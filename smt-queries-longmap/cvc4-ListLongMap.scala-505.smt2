; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11950 () Bool)

(assert start!11950)

(declare-fun b!100755 () Bool)

(declare-fun b_free!2457 () Bool)

(declare-fun b_next!2457 () Bool)

(assert (=> b!100755 (= b_free!2457 (not b_next!2457))))

(declare-fun tp!9670 () Bool)

(declare-fun b_and!6211 () Bool)

(assert (=> b!100755 (= tp!9670 b_and!6211)))

(declare-fun b!100761 () Bool)

(declare-fun b_free!2459 () Bool)

(declare-fun b_next!2459 () Bool)

(assert (=> b!100761 (= b_free!2459 (not b_next!2459))))

(declare-fun tp!9672 () Bool)

(declare-fun b_and!6213 () Bool)

(assert (=> b!100761 (= tp!9672 b_and!6213)))

(declare-fun e!65629 () Bool)

(declare-datatypes ((V!3173 0))(
  ( (V!3174 (val!1367 Int)) )
))
(declare-datatypes ((array!4273 0))(
  ( (array!4274 (arr!2029 (Array (_ BitVec 32) (_ BitVec 64))) (size!2281 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!979 0))(
  ( (ValueCellFull!979 (v!2833 V!3173)) (EmptyCell!979) )
))
(declare-datatypes ((array!4275 0))(
  ( (array!4276 (arr!2030 (Array (_ BitVec 32) ValueCell!979)) (size!2282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!866 0))(
  ( (LongMapFixedSize!867 (defaultEntry!2524 Int) (mask!6641 (_ BitVec 32)) (extraKeys!2337 (_ BitVec 32)) (zeroValue!2403 V!3173) (minValue!2403 V!3173) (_size!482 (_ BitVec 32)) (_keys!4222 array!4273) (_values!2507 array!4275) (_vacant!482 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!666 0))(
  ( (Cell!667 (v!2834 LongMapFixedSize!866)) )
))
(declare-datatypes ((LongMap!666 0))(
  ( (LongMap!667 (underlying!344 Cell!666)) )
))
(declare-fun thiss!992 () LongMap!666)

(declare-fun tp_is_empty!2645 () Bool)

(declare-fun e!65621 () Bool)

(declare-fun array_inv!1267 (array!4273) Bool)

(declare-fun array_inv!1268 (array!4275) Bool)

(assert (=> b!100755 (= e!65621 (and tp!9670 tp_is_empty!2645 (array_inv!1267 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) (array_inv!1268 (_values!2507 (v!2834 (underlying!344 thiss!992)))) e!65629))))

(declare-fun b!100756 () Bool)

(declare-datatypes ((Unit!3064 0))(
  ( (Unit!3065) )
))
(declare-fun e!65631 () Unit!3064)

(declare-fun Unit!3066 () Unit!3064)

(assert (=> b!100756 (= e!65631 Unit!3066)))

(declare-fun lt!50955 () Unit!3064)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!92 (array!4273 array!4275 (_ BitVec 32) (_ BitVec 32) V!3173 V!3173 (_ BitVec 64) (_ BitVec 32) Int) Unit!3064)

(assert (=> b!100756 (= lt!50955 (lemmaListMapContainsThenArrayContainsFrom!92 (_keys!4222 (v!2834 (underlying!344 thiss!992))) (_values!2507 (v!2834 (underlying!344 thiss!992))) (mask!6641 (v!2834 (underlying!344 thiss!992))) (extraKeys!2337 (v!2834 (underlying!344 thiss!992))) (zeroValue!2403 (v!2834 (underlying!344 thiss!992))) (minValue!2403 (v!2834 (underlying!344 thiss!992))) (select (arr!2029 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2524 (v!2834 (underlying!344 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!100756 (arrayContainsKey!0 (_keys!4222 (v!2834 (underlying!344 thiss!992))) (select (arr!2029 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!50952 () Unit!3064)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4273 (_ BitVec 32) (_ BitVec 32)) Unit!3064)

(assert (=> b!100756 (= lt!50952 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4222 (v!2834 (underlying!344 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1588 0))(
  ( (Nil!1585) (Cons!1584 (h!2180 (_ BitVec 64)) (t!5586 List!1588)) )
))
(declare-fun arrayNoDuplicates!0 (array!4273 (_ BitVec 32) List!1588) Bool)

(assert (=> b!100756 (arrayNoDuplicates!0 (_keys!4222 (v!2834 (underlying!344 thiss!992))) from!355 Nil!1585)))

(declare-fun lt!50957 () Unit!3064)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4273 (_ BitVec 32) (_ BitVec 64) List!1588) Unit!3064)

(assert (=> b!100756 (= lt!50957 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4222 (v!2834 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2029 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) from!355) (Cons!1584 (select (arr!2029 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) from!355) Nil!1585)))))

(assert (=> b!100756 false))

(declare-fun b!100757 () Bool)

(declare-fun res!50523 () Bool)

(declare-fun e!65626 () Bool)

(assert (=> b!100757 (=> (not res!50523) (not e!65626))))

(declare-fun newMap!16 () LongMapFixedSize!866)

(assert (=> b!100757 (= res!50523 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6641 newMap!16)) (_size!482 (v!2834 (underlying!344 thiss!992)))))))

(declare-fun b!100758 () Bool)

(declare-fun res!50522 () Bool)

(assert (=> b!100758 (=> (not res!50522) (not e!65626))))

(assert (=> b!100758 (= res!50522 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2281 (_keys!4222 (v!2834 (underlying!344 thiss!992)))))))))

(declare-fun b!100759 () Bool)

(declare-fun e!65632 () Bool)

(assert (=> b!100759 (= e!65632 tp_is_empty!2645)))

(declare-fun b!100760 () Bool)

(declare-fun res!50527 () Bool)

(assert (=> b!100760 (=> (not res!50527) (not e!65626))))

(declare-fun valid!393 (LongMapFixedSize!866) Bool)

(assert (=> b!100760 (= res!50527 (valid!393 newMap!16))))

(declare-fun e!65620 () Bool)

(declare-fun e!65622 () Bool)

(assert (=> b!100761 (= e!65620 (and tp!9672 tp_is_empty!2645 (array_inv!1267 (_keys!4222 newMap!16)) (array_inv!1268 (_values!2507 newMap!16)) e!65622))))

(declare-fun mapNonEmpty!3803 () Bool)

(declare-fun mapRes!3804 () Bool)

(declare-fun tp!9669 () Bool)

(assert (=> mapNonEmpty!3803 (= mapRes!3804 (and tp!9669 e!65632))))

(declare-fun mapValue!3803 () ValueCell!979)

(declare-fun mapRest!3804 () (Array (_ BitVec 32) ValueCell!979))

(declare-fun mapKey!3804 () (_ BitVec 32))

(assert (=> mapNonEmpty!3803 (= (arr!2030 (_values!2507 (v!2834 (underlying!344 thiss!992)))) (store mapRest!3804 mapKey!3804 mapValue!3803))))

(declare-fun b!100762 () Bool)

(declare-fun e!65634 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4273 (_ BitVec 32)) Bool)

(assert (=> b!100762 (= e!65634 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4222 (v!2834 (underlying!344 thiss!992))) (mask!6641 (v!2834 (underlying!344 thiss!992))))))))

(declare-fun mapIsEmpty!3803 () Bool)

(declare-fun mapRes!3803 () Bool)

(assert (=> mapIsEmpty!3803 mapRes!3803))

(declare-fun res!50528 () Bool)

(assert (=> start!11950 (=> (not res!50528) (not e!65626))))

(declare-fun valid!394 (LongMap!666) Bool)

(assert (=> start!11950 (= res!50528 (valid!394 thiss!992))))

(assert (=> start!11950 e!65626))

(declare-fun e!65625 () Bool)

(assert (=> start!11950 e!65625))

(assert (=> start!11950 true))

(assert (=> start!11950 e!65620))

(declare-fun b!100763 () Bool)

(declare-fun e!65627 () Bool)

(assert (=> b!100763 (= e!65627 tp_is_empty!2645)))

(declare-fun b!100764 () Bool)

(declare-fun res!50524 () Bool)

(assert (=> b!100764 (=> (not res!50524) (not e!65634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!100764 (= res!50524 (validMask!0 (mask!6641 (v!2834 (underlying!344 thiss!992)))))))

(declare-fun b!100765 () Bool)

(declare-fun e!65635 () Bool)

(assert (=> b!100765 (= e!65635 tp_is_empty!2645)))

(declare-fun b!100766 () Bool)

(declare-fun e!65623 () Bool)

(assert (=> b!100766 (= e!65623 e!65634)))

(declare-fun res!50525 () Bool)

(assert (=> b!100766 (=> (not res!50525) (not e!65634))))

(declare-datatypes ((tuple2!2358 0))(
  ( (tuple2!2359 (_1!1190 Bool) (_2!1190 LongMapFixedSize!866)) )
))
(declare-fun lt!50956 () tuple2!2358)

(assert (=> b!100766 (= res!50525 (and (_1!1190 lt!50956) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!50953 () Unit!3064)

(assert (=> b!100766 (= lt!50953 e!65631)))

(declare-datatypes ((tuple2!2360 0))(
  ( (tuple2!2361 (_1!1191 (_ BitVec 64)) (_2!1191 V!3173)) )
))
(declare-datatypes ((List!1589 0))(
  ( (Nil!1586) (Cons!1585 (h!2181 tuple2!2360) (t!5587 List!1589)) )
))
(declare-datatypes ((ListLongMap!1545 0))(
  ( (ListLongMap!1546 (toList!788 List!1589)) )
))
(declare-fun lt!50958 () ListLongMap!1545)

(declare-fun c!17290 () Bool)

(declare-fun contains!809 (ListLongMap!1545 (_ BitVec 64)) Bool)

(assert (=> b!100766 (= c!17290 (contains!809 lt!50958 (select (arr!2029 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) from!355)))))

(declare-fun update!145 (LongMapFixedSize!866 (_ BitVec 64) V!3173) tuple2!2358)

(declare-fun get!1295 (ValueCell!979 V!3173) V!3173)

(declare-fun dynLambda!373 (Int (_ BitVec 64)) V!3173)

(assert (=> b!100766 (= lt!50956 (update!145 newMap!16 (select (arr!2029 (_keys!4222 (v!2834 (underlying!344 thiss!992)))) from!355) (get!1295 (select (arr!2030 (_values!2507 (v!2834 (underlying!344 thiss!992)))) from!355) (dynLambda!373 (defaultEntry!2524 (v!2834 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!100767 () Bool)

(declare-fun e!65633 () Bool)

(assert (=> b!100767 (= e!65625 e!65633)))

(declare-fun mapNonEmpty!3804 () Bool)

(declare-fun tp!9671 () Bool)

(assert (=> mapNonEmpty!3804 (= mapRes!3803 (and tp!9671 e!65627))))

(declare-fun mapValue!3804 () ValueCell!979)

(declare-fun mapKey!3803 () (_ BitVec 32))

(declare-fun mapRest!3803 () (Array (_ BitVec 32) ValueCell!979))

(assert (=> mapNonEmpty!3804 (= (arr!2030 (_values!2507 newMap!16)) (store mapRest!3803 mapKey!3803 mapValue!3804))))

(declare-fun b!100768 () Bool)

(declare-fun e!65630 () Bool)

(assert (=> b!100768 (= e!65622 (and e!65630 mapRes!3803))))

(declare-fun condMapEmpty!3803 () Bool)

(declare-fun mapDefault!3804 () ValueCell!979)

