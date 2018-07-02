#ifndef ENVSKYBOX_H
#define ENVSKYBOX_H

#include <QtGui>
#include <QUrl>

#include "assetimage.h"

class AssetSkybox : public QObject
{

public:

    AssetSkybox();
    ~AssetSkybox();

    void SetAssetImages(const QVector <QPointer <AssetImage> > & imgs);
    QVector <QPointer <AssetImage> > & GetAssetImages();
    TextureHandle* GetTextureHandle();

    void DrawGL(QPointer <AssetShader> shader, const QMatrix4x4 & model_matrix);

    void UpdateAssets();

private:

    QVector <QPointer <AssetImage> > m_asset_images;
    std::shared_ptr<TextureHandle> m_texture_handle;
    TextureHandle* m_texture_handle_ref;
    bool m_has_generated_texture;
};

#endif // ENVSKYBOX_H
