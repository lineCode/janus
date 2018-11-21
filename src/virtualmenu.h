#ifndef VIRTUALMENU_H
#define VIRTUALMENU_H

#include <QObject>

#include "multiplayermanager.h"
#include "roomobject.h"

enum VirtualMenuIndex
{
    VirtualMenuIndex_MAIN,
    VirtualMenuIndex_BOOKMARKS,
    VirtualMenuIndex_AVATAR,
    VirtualMenuIndex_SOCIAL,
};

struct VirtualMenuButton
{
    VirtualMenuButton(const QString js_id, const QString text, const QMatrix4x4 m)
    {
        button = new RoomObject();
        button->SetType(TYPE_OBJECT);
        button->SetInterfaceObject(true);
        button->GetProperties()->SetJSID(js_id);
        button->GetProperties()->SetID("cube");
        button->GetProperties()->SetCollisionID("cube");
//        button->GetProperties()->SetColour(QVector4D(0,0,0,0.25f));

        label = new RoomObject();
        label->SetType(TYPE_TEXT);
        label->SetInterfaceObject(true);
        label->SetFixedSize(true, 0.05f);
        label->SetText(text);

        SetModelMatrix(m);
    }

    void SetModelMatrix(const QMatrix4x4 m)
    {
        //place button
        QMatrix4x4 m2 = m;
        m2.scale(1, 0.2f, 0.05f);
        button->SetAttributeModelMatrix(m2);

        //place text "in front"
        QMatrix4x4 m3 = m;
        m3.scale(1, 1, 0.05f);
        m3.translate(0,0,-1.1f);
        label->SetAttributeModelMatrixNoScaling(m3);
    }

    QPointer <RoomObject> button;
    QPointer <RoomObject> label;
};

struct VirtualMenuImageButton
{
    VirtualMenuImageButton(const QString js_id, const QString url, const QString thumb_id, const QMatrix4x4 m)
    {
        button = new RoomObject();
        button->SetType(TYPE_OBJECT);
        button->SetInterfaceObject(true);
        button->GetProperties()->SetJSID(js_id);
        button->GetProperties()->SetID("cube");
        button->GetProperties()->SetCollisionID("cube");
        button->GetProperties()->SetLighting(false);
        button->GetProperties()->SetURL(url);
//        button->GetProperties()->SetColour(QVector4D(0,0,0,0.25f));

        label = new RoomObject();
        label->SetType(TYPE_TEXT);
        label->SetInterfaceObject(true);
//        label->SetFixedSize(true, 0.05f);
        label->SetText(url);
        label->GetProperties()->SetColour(QVector4D(0.25, 0.25, 1.0f, 1.0f));

        SetModelMatrix(m);
    }

    void SetModelMatrix(const QMatrix4x4 m)
    {
        //place button
        QMatrix4x4 m2 = m;
        m2.scale(1, 1, 0.05f);
        button->SetAttributeModelMatrix(m2);

        //place text "in front"
        QMatrix4x4 m3 = m;
        m3.scale(0.9f, 0.9f, 0.05f);
        m3.translate(0,0.45f,-1.1f);
        label->SetAttributeModelMatrix(m3);
    }

    QPointer <RoomObject> button;
    QPointer <RoomObject> label;
};

struct VirtualMenuImageUserButton
{
    VirtualMenuImageUserButton(const QString js_id, const QString user, const QString url, const QString thumb_id, const QMatrix4x4 m)
    {
        button = new RoomObject();
        button->SetType(TYPE_OBJECT);
        button->SetInterfaceObject(true);
        button->GetProperties()->SetJSID(js_id);
        button->GetProperties()->SetID("cube");
        button->GetProperties()->SetCollisionID("cube");
        button->GetProperties()->SetLighting(false);
        button->GetProperties()->SetURL(url);
//        button->GetProperties()->SetColour(QVector4D(0,0,0,0.25f));

        labelurl = new RoomObject();
        labelurl->SetType(TYPE_TEXT);
        labelurl->SetInterfaceObject(true);
        labelurl->SetText(url);
        labelurl->GetProperties()->SetColour(QVector4D(0.25, 0.25, 1.0f, 1.0f));

        labeluser = new RoomObject();
        labeluser->SetType(TYPE_TEXT);
        labeluser->SetInterfaceObject(true);
        labeluser->SetText(user);

        SetModelMatrix(m);
    }

    void SetModelMatrix(const QMatrix4x4 m)
    {
        //place button
        QMatrix4x4 m2 = m;
        m2.scale(1, 1, 0.05f);
        button->SetAttributeModelMatrix(m2);

        //place text "in front"
        QMatrix4x4 m3 = m;
        m3.scale(0.9f, 0.9f, 0.05f);
        m3.translate(0,0.45f,-1.1f);
        labelurl->SetAttributeModelMatrix(m3);

        //place text "in front"
        QMatrix4x4 m4 = m;
        m4.scale(0.9f, 0.9f, 0.05f);
        labeluser->SetAttributeModelMatrix(m4);
    }

    QPointer <RoomObject> button;
    QPointer <RoomObject> labelurl;
    QPointer <RoomObject> labeluser;
};

struct VirtualMenuCheckbox
{
    VirtualMenuCheckbox()
    {
        enabled = false;
    }

    QPointer <RoomObject> button;
    QPointer <RoomObject> label;
    QPointer <RoomObject> indicator;
    bool enabled;
};

class VirtualMenu : public QObject
{
    Q_OBJECT

public:
    VirtualMenu();
    ~VirtualMenu();

    void SetBookmarkManager(QPointer <BookmarkManager> b);
    void SetMultiPlayerManager(QPointer <MultiPlayerManager> m);

    void SetVisible(const bool b);
    bool GetVisible() const;

    void Update();
    void DrawGL(QPointer <AssetShader> shader);

    QHash <QString, QPointer <RoomObject> > & GetEnvObjects();

    void mousePressEvent(QString selected);
    void mouseReleaseEvent(QString selected);

    void SetModelMatrix(const QMatrix4x4 m);
    QMatrix4x4 GetModelMatrix() const;

    VirtualMenuButton * AddNewButton(const VirtualMenuIndex index, const QString js_id, const QString label, const QMatrix4x4 m);
    VirtualMenuImageButton * AddNewImageButton(const VirtualMenuIndex index, const QString js_id, const QString url, const QString thumb_id, const QMatrix4x4 m);
    VirtualMenuImageUserButton * AddNewImageUserButton(const VirtualMenuIndex index, const QString js_id, const QString user, const QString url, const QString thumb_id, const QMatrix4x4 m);

    bool GetDoEscapeToHome();
    bool GetDoExit();
    bool GetDoCreatePortal();
    QString GetDoCreatePortalURL();
    QString GetDoCreatePortalThumb();

    void MenuButtonPressed();

public slots:

    void UpdatePartyModeList();

private:

    void Clear();
    void ConstructSubmenus();
    void ConstructSubmenuMain();
    void ConstructSubmenuBookmarks();
    void ConstructSubmenuAvatar();
    void ConstructSubmenuSocial();

    QHash <QString, QPointer <AssetImage> > assetimgs;
    QHash <QString, QPointer <AssetObject> > assetobjs;
    QHash <VirtualMenuIndex, QHash <QString, QPointer <RoomObject> > > envobjects; //indexes to envobject via js_id
    QHash <VirtualMenuIndex, QHash <QString, QPointer <RoomObject> > > envobjects_text; //indexes to envobject via js_id

    VirtualMenuIndex menu_index;
    bool visible;
    QMatrix4x4 modelmatrix; //transform to position menu in the environment

    QPointer <BookmarkManager> bookmarkmanager;
    QPointer <MultiPlayerManager> multi_players;

    int cur_bookmark;
    int num_bookmarks;

    int cur_user;
    int num_users;

    bool do_escape_to_home;
    bool do_exit;
    bool do_create_portal;
    QString create_portal_url;
    QString create_portal_thumb;

    QTimer partymode_request_timer;
    WebAsset partymode_data_request;
};

#endif // VIRTUALMENU_H