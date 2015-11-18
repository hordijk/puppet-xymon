
# xymon::factory
class xymon::factory(
  $client_monitors = {}
){
  
  if($client_monitors){
    include ::xymon::client
    create_resources('::xymon::client::monitor', $client_monitors)
  }
  
}