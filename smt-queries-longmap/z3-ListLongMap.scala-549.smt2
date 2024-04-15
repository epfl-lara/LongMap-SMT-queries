; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14584 () Bool)

(assert start!14584)

(declare-fun b!138190 () Bool)

(declare-fun b_free!2977 () Bool)

(declare-fun b_next!2977 () Bool)

(assert (=> b!138190 (= b_free!2977 (not b_next!2977))))

(declare-fun tp!11393 () Bool)

(declare-fun b_and!8569 () Bool)

(assert (=> b!138190 (= tp!11393 b_and!8569)))

(declare-fun b!138199 () Bool)

(declare-fun b_free!2979 () Bool)

(declare-fun b_next!2979 () Bool)

(assert (=> b!138199 (= b_free!2979 (not b_next!2979))))

(declare-fun tp!11392 () Bool)

(declare-fun b_and!8571 () Bool)

(assert (=> b!138199 (= tp!11392 b_and!8571)))

(declare-fun res!66121 () Bool)

(declare-fun e!90004 () Bool)

(assert (=> start!14584 (=> (not res!66121) (not e!90004))))

(declare-datatypes ((V!3521 0))(
  ( (V!3522 (val!1497 Int)) )
))
(declare-datatypes ((array!4821 0))(
  ( (array!4822 (arr!2278 (Array (_ BitVec 32) (_ BitVec 64))) (size!2550 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1109 0))(
  ( (ValueCellFull!1109 (v!3241 V!3521)) (EmptyCell!1109) )
))
(declare-datatypes ((array!4823 0))(
  ( (array!4824 (arr!2279 (Array (_ BitVec 32) ValueCell!1109)) (size!2551 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1126 0))(
  ( (LongMapFixedSize!1127 (defaultEntry!2915 Int) (mask!7242 (_ BitVec 32)) (extraKeys!2672 (_ BitVec 32)) (zeroValue!2766 V!3521) (minValue!2766 V!3521) (_size!612 (_ BitVec 32)) (_keys!4671 array!4821) (_values!2898 array!4823) (_vacant!612 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!908 0))(
  ( (Cell!909 (v!3242 LongMapFixedSize!1126)) )
))
(declare-datatypes ((LongMap!908 0))(
  ( (LongMap!909 (underlying!465 Cell!908)) )
))
(declare-fun thiss!992 () LongMap!908)

(declare-fun valid!546 (LongMap!908) Bool)

(assert (=> start!14584 (= res!66121 (valid!546 thiss!992))))

(assert (=> start!14584 e!90004))

(declare-fun e!90016 () Bool)

(assert (=> start!14584 e!90016))

(assert (=> start!14584 true))

(declare-fun e!90007 () Bool)

(assert (=> start!14584 e!90007))

(declare-fun b!138189 () Bool)

(declare-fun e!90013 () Bool)

(declare-fun e!90012 () Bool)

(assert (=> b!138189 (= e!90013 e!90012)))

(declare-fun res!66117 () Bool)

(assert (=> b!138189 (=> (not res!66117) (not e!90012))))

(declare-datatypes ((tuple2!2622 0))(
  ( (tuple2!2623 (_1!1322 (_ BitVec 64)) (_2!1322 V!3521)) )
))
(declare-datatypes ((List!1723 0))(
  ( (Nil!1720) (Cons!1719 (h!2326 tuple2!2622) (t!6246 List!1723)) )
))
(declare-datatypes ((ListLongMap!1691 0))(
  ( (ListLongMap!1692 (toList!861 List!1723)) )
))
(declare-fun lt!72123 () ListLongMap!1691)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!900 (ListLongMap!1691 (_ BitVec 64)) Bool)

(assert (=> b!138189 (= res!66117 (contains!900 lt!72123 (select (arr!2278 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1126)

(declare-datatypes ((tuple2!2624 0))(
  ( (tuple2!2625 (_1!1323 Bool) (_2!1323 LongMapFixedSize!1126)) )
))
(declare-fun lt!72121 () tuple2!2624)

(declare-fun update!201 (LongMapFixedSize!1126 (_ BitVec 64) V!3521) tuple2!2624)

(declare-fun get!1503 (ValueCell!1109 V!3521) V!3521)

(declare-fun dynLambda!427 (Int (_ BitVec 64)) V!3521)

(assert (=> b!138189 (= lt!72121 (update!201 newMap!16 (select (arr!2278 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) from!355) (get!1503 (select (arr!2279 (_values!2898 (v!3242 (underlying!465 thiss!992)))) from!355) (dynLambda!427 (defaultEntry!2915 (v!3242 (underlying!465 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!2905 () Bool)

(declare-fun e!90005 () Bool)

(declare-fun e!90011 () Bool)

(declare-fun array_inv!1455 (array!4821) Bool)

(declare-fun array_inv!1456 (array!4823) Bool)

(assert (=> b!138190 (= e!90005 (and tp!11393 tp_is_empty!2905 (array_inv!1455 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) (array_inv!1456 (_values!2898 (v!3242 (underlying!465 thiss!992)))) e!90011))))

(declare-fun mapIsEmpty!4745 () Bool)

(declare-fun mapRes!4745 () Bool)

(assert (=> mapIsEmpty!4745 mapRes!4745))

(declare-fun b!138191 () Bool)

(declare-fun e!90018 () Bool)

(assert (=> b!138191 (= e!90011 (and e!90018 mapRes!4745))))

(declare-fun condMapEmpty!4746 () Bool)

(declare-fun mapDefault!4746 () ValueCell!1109)

(assert (=> b!138191 (= condMapEmpty!4746 (= (arr!2279 (_values!2898 (v!3242 (underlying!465 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1109)) mapDefault!4746)))))

(declare-fun b!138192 () Bool)

(assert (=> b!138192 (= e!90012 (not (or (bvsge (size!2550 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!2550 (_keys!4671 (v!3242 (underlying!465 thiss!992))))) (bvsle from!355 (size!2550 (_keys!4671 (v!3242 (underlying!465 thiss!992))))))))))

(declare-fun arrayContainsKey!0 (array!4821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138192 (arrayContainsKey!0 (_keys!4671 (v!3242 (underlying!465 thiss!992))) (select (arr!2278 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4356 0))(
  ( (Unit!4357) )
))
(declare-fun lt!72122 () Unit!4356)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!136 (array!4821 array!4823 (_ BitVec 32) (_ BitVec 32) V!3521 V!3521 (_ BitVec 64) (_ BitVec 32) Int) Unit!4356)

(assert (=> b!138192 (= lt!72122 (lemmaListMapContainsThenArrayContainsFrom!136 (_keys!4671 (v!3242 (underlying!465 thiss!992))) (_values!2898 (v!3242 (underlying!465 thiss!992))) (mask!7242 (v!3242 (underlying!465 thiss!992))) (extraKeys!2672 (v!3242 (underlying!465 thiss!992))) (zeroValue!2766 (v!3242 (underlying!465 thiss!992))) (minValue!2766 (v!3242 (underlying!465 thiss!992))) (select (arr!2278 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2915 (v!3242 (underlying!465 thiss!992)))))))

(declare-fun mapIsEmpty!4746 () Bool)

(declare-fun mapRes!4746 () Bool)

(assert (=> mapIsEmpty!4746 mapRes!4746))

(declare-fun b!138193 () Bool)

(assert (=> b!138193 (= e!90004 e!90013)))

(declare-fun res!66116 () Bool)

(assert (=> b!138193 (=> (not res!66116) (not e!90013))))

(declare-fun lt!72120 () ListLongMap!1691)

(assert (=> b!138193 (= res!66116 (and (= lt!72120 lt!72123) (not (= (select (arr!2278 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2278 (_keys!4671 (v!3242 (underlying!465 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1408 (LongMapFixedSize!1126) ListLongMap!1691)

(assert (=> b!138193 (= lt!72123 (map!1408 newMap!16))))

(declare-fun getCurrentListMap!526 (array!4821 array!4823 (_ BitVec 32) (_ BitVec 32) V!3521 V!3521 (_ BitVec 32) Int) ListLongMap!1691)

(assert (=> b!138193 (= lt!72120 (getCurrentListMap!526 (_keys!4671 (v!3242 (underlying!465 thiss!992))) (_values!2898 (v!3242 (underlying!465 thiss!992))) (mask!7242 (v!3242 (underlying!465 thiss!992))) (extraKeys!2672 (v!3242 (underlying!465 thiss!992))) (zeroValue!2766 (v!3242 (underlying!465 thiss!992))) (minValue!2766 (v!3242 (underlying!465 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2915 (v!3242 (underlying!465 thiss!992)))))))

(declare-fun b!138194 () Bool)

(assert (=> b!138194 (= e!90018 tp_is_empty!2905)))

(declare-fun b!138195 () Bool)

(declare-fun e!90008 () Bool)

(declare-fun e!90017 () Bool)

(assert (=> b!138195 (= e!90008 (and e!90017 mapRes!4746))))

(declare-fun condMapEmpty!4745 () Bool)

(declare-fun mapDefault!4745 () ValueCell!1109)

(assert (=> b!138195 (= condMapEmpty!4745 (= (arr!2279 (_values!2898 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1109)) mapDefault!4745)))))

(declare-fun b!138196 () Bool)

(declare-fun e!90014 () Bool)

(assert (=> b!138196 (= e!90016 e!90014)))

(declare-fun b!138197 () Bool)

(declare-fun res!66119 () Bool)

(assert (=> b!138197 (=> (not res!66119) (not e!90004))))

(assert (=> b!138197 (= res!66119 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2550 (_keys!4671 (v!3242 (underlying!465 thiss!992)))))))))

(declare-fun b!138198 () Bool)

(declare-fun res!66120 () Bool)

(assert (=> b!138198 (=> (not res!66120) (not e!90004))))

(declare-fun valid!547 (LongMapFixedSize!1126) Bool)

(assert (=> b!138198 (= res!66120 (valid!547 newMap!16))))

(assert (=> b!138199 (= e!90007 (and tp!11392 tp_is_empty!2905 (array_inv!1455 (_keys!4671 newMap!16)) (array_inv!1456 (_values!2898 newMap!16)) e!90008))))

(declare-fun mapNonEmpty!4745 () Bool)

(declare-fun tp!11394 () Bool)

(declare-fun e!90006 () Bool)

(assert (=> mapNonEmpty!4745 (= mapRes!4746 (and tp!11394 e!90006))))

(declare-fun mapKey!4745 () (_ BitVec 32))

(declare-fun mapValue!4745 () ValueCell!1109)

(declare-fun mapRest!4746 () (Array (_ BitVec 32) ValueCell!1109))

(assert (=> mapNonEmpty!4745 (= (arr!2279 (_values!2898 newMap!16)) (store mapRest!4746 mapKey!4745 mapValue!4745))))

(declare-fun b!138200 () Bool)

(declare-fun res!66118 () Bool)

(assert (=> b!138200 (=> (not res!66118) (not e!90004))))

(assert (=> b!138200 (= res!66118 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7242 newMap!16)) (_size!612 (v!3242 (underlying!465 thiss!992)))))))

(declare-fun b!138201 () Bool)

(assert (=> b!138201 (= e!90006 tp_is_empty!2905)))

(declare-fun b!138202 () Bool)

(declare-fun e!90015 () Bool)

(assert (=> b!138202 (= e!90015 tp_is_empty!2905)))

(declare-fun b!138203 () Bool)

(assert (=> b!138203 (= e!90014 e!90005)))

(declare-fun mapNonEmpty!4746 () Bool)

(declare-fun tp!11391 () Bool)

(assert (=> mapNonEmpty!4746 (= mapRes!4745 (and tp!11391 e!90015))))

(declare-fun mapKey!4746 () (_ BitVec 32))

(declare-fun mapValue!4746 () ValueCell!1109)

(declare-fun mapRest!4745 () (Array (_ BitVec 32) ValueCell!1109))

(assert (=> mapNonEmpty!4746 (= (arr!2279 (_values!2898 (v!3242 (underlying!465 thiss!992)))) (store mapRest!4745 mapKey!4746 mapValue!4746))))

(declare-fun b!138204 () Bool)

(assert (=> b!138204 (= e!90017 tp_is_empty!2905)))

(assert (= (and start!14584 res!66121) b!138197))

(assert (= (and b!138197 res!66119) b!138198))

(assert (= (and b!138198 res!66120) b!138200))

(assert (= (and b!138200 res!66118) b!138193))

(assert (= (and b!138193 res!66116) b!138189))

(assert (= (and b!138189 res!66117) b!138192))

(assert (= (and b!138191 condMapEmpty!4746) mapIsEmpty!4745))

(assert (= (and b!138191 (not condMapEmpty!4746)) mapNonEmpty!4746))

(get-info :version)

(assert (= (and mapNonEmpty!4746 ((_ is ValueCellFull!1109) mapValue!4746)) b!138202))

(assert (= (and b!138191 ((_ is ValueCellFull!1109) mapDefault!4746)) b!138194))

(assert (= b!138190 b!138191))

(assert (= b!138203 b!138190))

(assert (= b!138196 b!138203))

(assert (= start!14584 b!138196))

(assert (= (and b!138195 condMapEmpty!4745) mapIsEmpty!4746))

(assert (= (and b!138195 (not condMapEmpty!4745)) mapNonEmpty!4745))

(assert (= (and mapNonEmpty!4745 ((_ is ValueCellFull!1109) mapValue!4745)) b!138201))

(assert (= (and b!138195 ((_ is ValueCellFull!1109) mapDefault!4745)) b!138204))

(assert (= b!138199 b!138195))

(assert (= start!14584 b!138199))

(declare-fun b_lambda!6179 () Bool)

(assert (=> (not b_lambda!6179) (not b!138189)))

(declare-fun t!6243 () Bool)

(declare-fun tb!2485 () Bool)

(assert (=> (and b!138190 (= (defaultEntry!2915 (v!3242 (underlying!465 thiss!992))) (defaultEntry!2915 (v!3242 (underlying!465 thiss!992)))) t!6243) tb!2485))

(declare-fun result!4087 () Bool)

(assert (=> tb!2485 (= result!4087 tp_is_empty!2905)))

(assert (=> b!138189 t!6243))

(declare-fun b_and!8573 () Bool)

(assert (= b_and!8569 (and (=> t!6243 result!4087) b_and!8573)))

(declare-fun tb!2487 () Bool)

(declare-fun t!6245 () Bool)

(assert (=> (and b!138199 (= (defaultEntry!2915 newMap!16) (defaultEntry!2915 (v!3242 (underlying!465 thiss!992)))) t!6245) tb!2487))

(declare-fun result!4091 () Bool)

(assert (= result!4091 result!4087))

(assert (=> b!138189 t!6245))

(declare-fun b_and!8575 () Bool)

(assert (= b_and!8571 (and (=> t!6245 result!4091) b_and!8575)))

(declare-fun m!165075 () Bool)

(assert (=> mapNonEmpty!4746 m!165075))

(declare-fun m!165077 () Bool)

(assert (=> b!138192 m!165077))

(assert (=> b!138192 m!165077))

(declare-fun m!165079 () Bool)

(assert (=> b!138192 m!165079))

(assert (=> b!138192 m!165077))

(declare-fun m!165081 () Bool)

(assert (=> b!138192 m!165081))

(declare-fun m!165083 () Bool)

(assert (=> b!138190 m!165083))

(declare-fun m!165085 () Bool)

(assert (=> b!138190 m!165085))

(declare-fun m!165087 () Bool)

(assert (=> b!138189 m!165087))

(declare-fun m!165089 () Bool)

(assert (=> b!138189 m!165089))

(declare-fun m!165091 () Bool)

(assert (=> b!138189 m!165091))

(assert (=> b!138189 m!165077))

(assert (=> b!138189 m!165089))

(assert (=> b!138189 m!165077))

(declare-fun m!165093 () Bool)

(assert (=> b!138189 m!165093))

(assert (=> b!138189 m!165077))

(assert (=> b!138189 m!165091))

(declare-fun m!165095 () Bool)

(assert (=> b!138189 m!165095))

(assert (=> b!138189 m!165087))

(assert (=> b!138193 m!165077))

(declare-fun m!165097 () Bool)

(assert (=> b!138193 m!165097))

(declare-fun m!165099 () Bool)

(assert (=> b!138193 m!165099))

(declare-fun m!165101 () Bool)

(assert (=> mapNonEmpty!4745 m!165101))

(declare-fun m!165103 () Bool)

(assert (=> b!138198 m!165103))

(declare-fun m!165105 () Bool)

(assert (=> b!138199 m!165105))

(declare-fun m!165107 () Bool)

(assert (=> b!138199 m!165107))

(declare-fun m!165109 () Bool)

(assert (=> start!14584 m!165109))

(check-sat (not b!138199) (not mapNonEmpty!4745) (not b!138189) (not b!138193) (not mapNonEmpty!4746) (not b_next!2979) (not b!138198) (not b!138190) b_and!8575 (not b_lambda!6179) (not start!14584) (not b!138192) b_and!8573 tp_is_empty!2905 (not b_next!2977))
(check-sat b_and!8573 b_and!8575 (not b_next!2977) (not b_next!2979))
