module ApplicationHelper
  def page_title(page_title = '', admin = false)
    base_title = if admin
                   'Negative word share(管理画面)'
                 else
                   'Negative word share'
                 end

    page_title.empty? ? base_title : page_title + ' | ' + base_title

    def active_if(path)
      path == controller_path ? 'active' : ''
    end
  end

  def default_meta_tags
    {
      title: 'Negative_word_share',
      reverse: true,
      separator: '|',
      description: '人生で傷ついた言葉を共有してみんななぐさめ合うサービス',
      keywords: 'ネガティヴワード',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('https://i.gyazo.com/c02a9c9c3f14d841019edb69e0682818.png') },
        { href: image_url('https://i.gyazo.com/c02a9c9c3f14d841019edb69e0682818.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        title: 'Negative_word_share',
        description: '人生で傷ついた言葉を共有してみんなでなぐさめ合うサービス',
        type: 'website',
        url: request.original_url,
        image: image_url('https://i.gyazo.com/c02a9c9c3f14d841019edb69e0682818.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@Ws44olu6bygWDyB'
      }
    }
  end
end
