SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.item :new_post, 'Submit Your Own', new_post_url
  end
end
