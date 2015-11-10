# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  def home_page?
    current_page.path == "index.html"
  end

  def current_tag
    current_page.metadata[:locals]["tagname"]
  end

  def post_date(post)
    (post.data.published || post.date).strftime('%B %d, %Y')
  end

  def nav_link(field)
    if home_page?
      "##{field}"
    else
      "/##{field}"
    end
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir,  "fonts"
set :partials_dir, 'partials'
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :blog do |blog|
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.summary_separator = /READ_MORE/
  blog.paginate = true
  blog.taglink = "tags/{tag}.html"
  blog.tag_template = "tag.html"

  blog.custom_collections = {
    categories: {
      link: '/category/{category}.html',
      template: '/category.html',
      collection_entry_name: 'category'
    }
  }
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  set :http_prefix, "/"
end

# activate :deploy do |deploy|
#   deploy.method = :git
#   deploy.build_before = true
#   # Optional Settings
#   # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
#   # deploy.branch   = 'custom-branch' # default: gh-pages
#   # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
#   # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
# end

# activate :disqus do |d|
#   d.shortname = 'lifeatthecircle'
# end
