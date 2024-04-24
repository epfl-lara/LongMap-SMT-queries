; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14706 () Bool)

(assert start!14706)

(declare-fun b!139401 () Bool)

(declare-fun b_free!3013 () Bool)

(declare-fun b_next!3013 () Bool)

(assert (=> b!139401 (= b_free!3013 (not b_next!3013))))

(declare-fun tp!11512 () Bool)

(declare-fun b_and!8693 () Bool)

(assert (=> b!139401 (= tp!11512 b_and!8693)))

(declare-fun b!139394 () Bool)

(declare-fun b_free!3015 () Bool)

(declare-fun b_next!3015 () Bool)

(assert (=> b!139394 (= b_free!3015 (not b_next!3015))))

(declare-fun tp!11511 () Bool)

(declare-fun b_and!8695 () Bool)

(assert (=> b!139394 (= tp!11511 b_and!8695)))

(declare-fun res!66671 () Bool)

(declare-fun e!90863 () Bool)

(assert (=> start!14706 (=> (not res!66671) (not e!90863))))

(declare-datatypes ((V!3545 0))(
  ( (V!3546 (val!1506 Int)) )
))
(declare-datatypes ((array!4867 0))(
  ( (array!4868 (arr!2300 (Array (_ BitVec 32) (_ BitVec 64))) (size!2572 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1118 0))(
  ( (ValueCellFull!1118 (v!3272 V!3545)) (EmptyCell!1118) )
))
(declare-datatypes ((array!4869 0))(
  ( (array!4870 (arr!2301 (Array (_ BitVec 32) ValueCell!1118)) (size!2573 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1144 0))(
  ( (LongMapFixedSize!1145 (defaultEntry!2936 Int) (mask!7274 (_ BitVec 32)) (extraKeys!2691 (_ BitVec 32)) (zeroValue!2786 V!3545) (minValue!2786 V!3545) (_size!621 (_ BitVec 32)) (_keys!4695 array!4867) (_values!2919 array!4869) (_vacant!621 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!930 0))(
  ( (Cell!931 (v!3273 LongMapFixedSize!1144)) )
))
(declare-datatypes ((LongMap!930 0))(
  ( (LongMap!931 (underlying!476 Cell!930)) )
))
(declare-fun thiss!992 () LongMap!930)

(declare-fun valid!562 (LongMap!930) Bool)

(assert (=> start!14706 (= res!66671 (valid!562 thiss!992))))

(assert (=> start!14706 e!90863))

(declare-fun e!90864 () Bool)

(assert (=> start!14706 e!90864))

(assert (=> start!14706 true))

(declare-fun e!90865 () Bool)

(assert (=> start!14706 e!90865))

(declare-fun mapIsEmpty!4809 () Bool)

(declare-fun mapRes!4810 () Bool)

(assert (=> mapIsEmpty!4809 mapRes!4810))

(declare-fun mapIsEmpty!4810 () Bool)

(declare-fun mapRes!4809 () Bool)

(assert (=> mapIsEmpty!4810 mapRes!4809))

(declare-fun b!139391 () Bool)

(declare-fun e!90871 () Bool)

(assert (=> b!139391 (= e!90864 e!90871)))

(declare-fun b!139392 () Bool)

(declare-fun e!90873 () Bool)

(declare-fun tp_is_empty!2923 () Bool)

(assert (=> b!139392 (= e!90873 tp_is_empty!2923)))

(declare-fun b!139393 () Bool)

(declare-fun e!90876 () Bool)

(assert (=> b!139393 (= e!90876 tp_is_empty!2923)))

(declare-fun e!90872 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1144)

(declare-fun array_inv!1437 (array!4867) Bool)

(declare-fun array_inv!1438 (array!4869) Bool)

(assert (=> b!139394 (= e!90865 (and tp!11511 tp_is_empty!2923 (array_inv!1437 (_keys!4695 newMap!16)) (array_inv!1438 (_values!2919 newMap!16)) e!90872))))

(declare-fun b!139395 () Bool)

(declare-fun e!90870 () Bool)

(assert (=> b!139395 (= e!90872 (and e!90870 mapRes!4810))))

(declare-fun condMapEmpty!4810 () Bool)

(declare-fun mapDefault!4810 () ValueCell!1118)

(assert (=> b!139395 (= condMapEmpty!4810 (= (arr!2301 (_values!2919 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1118)) mapDefault!4810)))))

(declare-fun b!139396 () Bool)

(declare-fun res!66670 () Bool)

(assert (=> b!139396 (=> (not res!66670) (not e!90863))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!139396 (= res!66670 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2572 (_keys!4695 (v!3273 (underlying!476 thiss!992)))))))))

(declare-fun b!139397 () Bool)

(declare-fun e!90874 () Bool)

(assert (=> b!139397 (= e!90863 e!90874)))

(declare-fun res!66669 () Bool)

(assert (=> b!139397 (=> (not res!66669) (not e!90874))))

(declare-datatypes ((tuple2!2618 0))(
  ( (tuple2!2619 (_1!1320 (_ BitVec 64)) (_2!1320 V!3545)) )
))
(declare-datatypes ((List!1716 0))(
  ( (Nil!1713) (Cons!1712 (h!2319 tuple2!2618) (t!6280 List!1716)) )
))
(declare-datatypes ((ListLongMap!1683 0))(
  ( (ListLongMap!1684 (toList!857 List!1716)) )
))
(declare-fun lt!72962 () ListLongMap!1683)

(declare-fun lt!72964 () ListLongMap!1683)

(assert (=> b!139397 (= res!66669 (and (= lt!72962 lt!72964) (not (= (select (arr!2300 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2300 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1426 (LongMapFixedSize!1144) ListLongMap!1683)

(assert (=> b!139397 (= lt!72964 (map!1426 newMap!16))))

(declare-fun getCurrentListMap!530 (array!4867 array!4869 (_ BitVec 32) (_ BitVec 32) V!3545 V!3545 (_ BitVec 32) Int) ListLongMap!1683)

(assert (=> b!139397 (= lt!72962 (getCurrentListMap!530 (_keys!4695 (v!3273 (underlying!476 thiss!992))) (_values!2919 (v!3273 (underlying!476 thiss!992))) (mask!7274 (v!3273 (underlying!476 thiss!992))) (extraKeys!2691 (v!3273 (underlying!476 thiss!992))) (zeroValue!2786 (v!3273 (underlying!476 thiss!992))) (minValue!2786 (v!3273 (underlying!476 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2936 (v!3273 (underlying!476 thiss!992)))))))

(declare-fun b!139398 () Bool)

(declare-fun res!66668 () Bool)

(assert (=> b!139398 (=> (not res!66668) (not e!90863))))

(declare-fun valid!563 (LongMapFixedSize!1144) Bool)

(assert (=> b!139398 (= res!66668 (valid!563 newMap!16))))

(declare-fun b!139399 () Bool)

(declare-fun e!90869 () Bool)

(assert (=> b!139399 (= e!90874 e!90869)))

(declare-fun res!66672 () Bool)

(assert (=> b!139399 (=> (not res!66672) (not e!90869))))

(declare-fun contains!903 (ListLongMap!1683 (_ BitVec 64)) Bool)

(assert (=> b!139399 (= res!66672 (contains!903 lt!72964 (select (arr!2300 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2620 0))(
  ( (tuple2!2621 (_1!1321 Bool) (_2!1321 LongMapFixedSize!1144)) )
))
(declare-fun lt!72960 () tuple2!2620)

(declare-fun update!208 (LongMapFixedSize!1144 (_ BitVec 64) V!3545) tuple2!2620)

(declare-fun get!1528 (ValueCell!1118 V!3545) V!3545)

(declare-fun dynLambda!438 (Int (_ BitVec 64)) V!3545)

(assert (=> b!139399 (= lt!72960 (update!208 newMap!16 (select (arr!2300 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) from!355) (get!1528 (select (arr!2301 (_values!2919 (v!3273 (underlying!476 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2936 (v!3273 (underlying!476 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!139400 () Bool)

(declare-fun res!66673 () Bool)

(assert (=> b!139400 (=> (not res!66673) (not e!90863))))

(assert (=> b!139400 (= res!66673 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7274 newMap!16)) (_size!621 (v!3273 (underlying!476 thiss!992)))))))

(declare-fun mapNonEmpty!4809 () Bool)

(declare-fun tp!11509 () Bool)

(assert (=> mapNonEmpty!4809 (= mapRes!4810 (and tp!11509 e!90873))))

(declare-fun mapKey!4810 () (_ BitVec 32))

(declare-fun mapRest!4809 () (Array (_ BitVec 32) ValueCell!1118))

(declare-fun mapValue!4810 () ValueCell!1118)

(assert (=> mapNonEmpty!4809 (= (arr!2301 (_values!2919 newMap!16)) (store mapRest!4809 mapKey!4810 mapValue!4810))))

(declare-fun e!90875 () Bool)

(declare-fun e!90868 () Bool)

(assert (=> b!139401 (= e!90875 (and tp!11512 tp_is_empty!2923 (array_inv!1437 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) (array_inv!1438 (_values!2919 (v!3273 (underlying!476 thiss!992)))) e!90868))))

(declare-fun b!139402 () Bool)

(assert (=> b!139402 (= e!90871 e!90875)))

(declare-fun b!139403 () Bool)

(assert (=> b!139403 (= e!90870 tp_is_empty!2923)))

(declare-fun b!139404 () Bool)

(assert (=> b!139404 (= e!90868 (and e!90876 mapRes!4809))))

(declare-fun condMapEmpty!4809 () Bool)

(declare-fun mapDefault!4809 () ValueCell!1118)

(assert (=> b!139404 (= condMapEmpty!4809 (= (arr!2301 (_values!2919 (v!3273 (underlying!476 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1118)) mapDefault!4809)))))

(declare-fun b!139405 () Bool)

(assert (=> b!139405 (= e!90869 (not (or (bvsge (size!2572 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1717 0))(
  ( (Nil!1714) (Cons!1713 (h!2320 (_ BitVec 64)) (t!6281 List!1717)) )
))
(declare-fun arrayNoDuplicates!0 (array!4867 (_ BitVec 32) List!1717) Bool)

(assert (=> b!139405 (arrayNoDuplicates!0 (_keys!4695 (v!3273 (underlying!476 thiss!992))) from!355 Nil!1714)))

(declare-datatypes ((Unit!4383 0))(
  ( (Unit!4384) )
))
(declare-fun lt!72961 () Unit!4383)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4867 (_ BitVec 32) (_ BitVec 32)) Unit!4383)

(assert (=> b!139405 (= lt!72961 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4695 (v!3273 (underlying!476 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139405 (arrayContainsKey!0 (_keys!4695 (v!3273 (underlying!476 thiss!992))) (select (arr!2300 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72963 () Unit!4383)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!137 (array!4867 array!4869 (_ BitVec 32) (_ BitVec 32) V!3545 V!3545 (_ BitVec 64) (_ BitVec 32) Int) Unit!4383)

(assert (=> b!139405 (= lt!72963 (lemmaListMapContainsThenArrayContainsFrom!137 (_keys!4695 (v!3273 (underlying!476 thiss!992))) (_values!2919 (v!3273 (underlying!476 thiss!992))) (mask!7274 (v!3273 (underlying!476 thiss!992))) (extraKeys!2691 (v!3273 (underlying!476 thiss!992))) (zeroValue!2786 (v!3273 (underlying!476 thiss!992))) (minValue!2786 (v!3273 (underlying!476 thiss!992))) (select (arr!2300 (_keys!4695 (v!3273 (underlying!476 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2936 (v!3273 (underlying!476 thiss!992)))))))

(declare-fun b!139406 () Bool)

(declare-fun e!90877 () Bool)

(assert (=> b!139406 (= e!90877 tp_is_empty!2923)))

(declare-fun mapNonEmpty!4810 () Bool)

(declare-fun tp!11510 () Bool)

(assert (=> mapNonEmpty!4810 (= mapRes!4809 (and tp!11510 e!90877))))

(declare-fun mapKey!4809 () (_ BitVec 32))

(declare-fun mapValue!4809 () ValueCell!1118)

(declare-fun mapRest!4810 () (Array (_ BitVec 32) ValueCell!1118))

(assert (=> mapNonEmpty!4810 (= (arr!2301 (_values!2919 (v!3273 (underlying!476 thiss!992)))) (store mapRest!4810 mapKey!4809 mapValue!4809))))

(assert (= (and start!14706 res!66671) b!139396))

(assert (= (and b!139396 res!66670) b!139398))

(assert (= (and b!139398 res!66668) b!139400))

(assert (= (and b!139400 res!66673) b!139397))

(assert (= (and b!139397 res!66669) b!139399))

(assert (= (and b!139399 res!66672) b!139405))

(assert (= (and b!139404 condMapEmpty!4809) mapIsEmpty!4810))

(assert (= (and b!139404 (not condMapEmpty!4809)) mapNonEmpty!4810))

(get-info :version)

(assert (= (and mapNonEmpty!4810 ((_ is ValueCellFull!1118) mapValue!4809)) b!139406))

(assert (= (and b!139404 ((_ is ValueCellFull!1118) mapDefault!4809)) b!139393))

(assert (= b!139401 b!139404))

(assert (= b!139402 b!139401))

(assert (= b!139391 b!139402))

(assert (= start!14706 b!139391))

(assert (= (and b!139395 condMapEmpty!4810) mapIsEmpty!4809))

(assert (= (and b!139395 (not condMapEmpty!4810)) mapNonEmpty!4809))

(assert (= (and mapNonEmpty!4809 ((_ is ValueCellFull!1118) mapValue!4810)) b!139392))

(assert (= (and b!139395 ((_ is ValueCellFull!1118) mapDefault!4810)) b!139403))

(assert (= b!139394 b!139395))

(assert (= start!14706 b!139394))

(declare-fun b_lambda!6253 () Bool)

(assert (=> (not b_lambda!6253) (not b!139399)))

(declare-fun t!6277 () Bool)

(declare-fun tb!2525 () Bool)

(assert (=> (and b!139401 (= (defaultEntry!2936 (v!3273 (underlying!476 thiss!992))) (defaultEntry!2936 (v!3273 (underlying!476 thiss!992)))) t!6277) tb!2525))

(declare-fun result!4149 () Bool)

(assert (=> tb!2525 (= result!4149 tp_is_empty!2923)))

(assert (=> b!139399 t!6277))

(declare-fun b_and!8697 () Bool)

(assert (= b_and!8693 (and (=> t!6277 result!4149) b_and!8697)))

(declare-fun t!6279 () Bool)

(declare-fun tb!2527 () Bool)

(assert (=> (and b!139394 (= (defaultEntry!2936 newMap!16) (defaultEntry!2936 (v!3273 (underlying!476 thiss!992)))) t!6279) tb!2527))

(declare-fun result!4153 () Bool)

(assert (= result!4153 result!4149))

(assert (=> b!139399 t!6279))

(declare-fun b_and!8699 () Bool)

(assert (= b_and!8695 (and (=> t!6279 result!4153) b_and!8699)))

(declare-fun m!166509 () Bool)

(assert (=> start!14706 m!166509))

(declare-fun m!166511 () Bool)

(assert (=> b!139401 m!166511))

(declare-fun m!166513 () Bool)

(assert (=> b!139401 m!166513))

(declare-fun m!166515 () Bool)

(assert (=> b!139397 m!166515))

(declare-fun m!166517 () Bool)

(assert (=> b!139397 m!166517))

(declare-fun m!166519 () Bool)

(assert (=> b!139397 m!166519))

(declare-fun m!166521 () Bool)

(assert (=> b!139405 m!166521))

(declare-fun m!166523 () Bool)

(assert (=> b!139405 m!166523))

(assert (=> b!139405 m!166515))

(declare-fun m!166525 () Bool)

(assert (=> b!139405 m!166525))

(assert (=> b!139405 m!166515))

(assert (=> b!139405 m!166515))

(declare-fun m!166527 () Bool)

(assert (=> b!139405 m!166527))

(declare-fun m!166529 () Bool)

(assert (=> mapNonEmpty!4809 m!166529))

(declare-fun m!166531 () Bool)

(assert (=> b!139399 m!166531))

(declare-fun m!166533 () Bool)

(assert (=> b!139399 m!166533))

(declare-fun m!166535 () Bool)

(assert (=> b!139399 m!166535))

(assert (=> b!139399 m!166515))

(assert (=> b!139399 m!166533))

(assert (=> b!139399 m!166515))

(declare-fun m!166537 () Bool)

(assert (=> b!139399 m!166537))

(assert (=> b!139399 m!166515))

(assert (=> b!139399 m!166535))

(declare-fun m!166539 () Bool)

(assert (=> b!139399 m!166539))

(assert (=> b!139399 m!166531))

(declare-fun m!166541 () Bool)

(assert (=> b!139394 m!166541))

(declare-fun m!166543 () Bool)

(assert (=> b!139394 m!166543))

(declare-fun m!166545 () Bool)

(assert (=> mapNonEmpty!4810 m!166545))

(declare-fun m!166547 () Bool)

(assert (=> b!139398 m!166547))

(check-sat (not b_next!3013) (not b!139399) (not b!139401) (not b_next!3015) b_and!8699 b_and!8697 (not b!139398) tp_is_empty!2923 (not b!139405) (not mapNonEmpty!4809) (not mapNonEmpty!4810) (not b_lambda!6253) (not b!139394) (not start!14706) (not b!139397))
(check-sat b_and!8697 b_and!8699 (not b_next!3013) (not b_next!3015))
