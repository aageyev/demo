### Generate version

```ruby
version_hash = {'version' => '0.0.1'}
File.open(Rails.root.join('version.yml'), 'w') { |file| file.write(version_hash.to_yaml) }
```