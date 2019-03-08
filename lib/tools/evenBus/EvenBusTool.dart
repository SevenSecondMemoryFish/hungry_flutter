
import 'package:event_bus/event_bus.dart';
EventBus eventBus = new EventBus();

class StoreDesEvenBus {
  String msg;
  StoreDesEvenBus(this.msg);
}
class StoreLeftViewEvenBus{
  String msg;
  int tapIndex;
  StoreLeftViewEvenBus(this.msg,this.tapIndex);
}
