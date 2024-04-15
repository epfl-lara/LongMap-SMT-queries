; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14578 () Bool)

(assert start!14578)

(declare-fun b!138045 () Bool)

(declare-fun b_free!2965 () Bool)

(declare-fun b_next!2965 () Bool)

(assert (=> b!138045 (= b_free!2965 (not b_next!2965))))

(declare-fun tp!11357 () Bool)

(declare-fun b_and!8545 () Bool)

(assert (=> b!138045 (= tp!11357 b_and!8545)))

(declare-fun b!138053 () Bool)

(declare-fun b_free!2967 () Bool)

(declare-fun b_next!2967 () Bool)

(assert (=> b!138053 (= b_free!2967 (not b_next!2967))))

(declare-fun tp!11356 () Bool)

(declare-fun b_and!8547 () Bool)

(assert (=> b!138053 (= tp!11356 b_and!8547)))

(declare-fun b!138039 () Bool)

(declare-fun e!89880 () Bool)

(declare-fun tp_is_empty!2899 () Bool)

(assert (=> b!138039 (= e!89880 tp_is_empty!2899)))

(declare-fun mapIsEmpty!4727 () Bool)

(declare-fun mapRes!4727 () Bool)

(assert (=> mapIsEmpty!4727 mapRes!4727))

(declare-fun b!138040 () Bool)

(declare-fun res!66065 () Bool)

(declare-fun e!89869 () Bool)

(assert (=> b!138040 (=> (not res!66065) (not e!89869))))

(declare-datatypes ((V!3513 0))(
  ( (V!3514 (val!1494 Int)) )
))
(declare-datatypes ((array!4809 0))(
  ( (array!4810 (arr!2272 (Array (_ BitVec 32) (_ BitVec 64))) (size!2544 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1106 0))(
  ( (ValueCellFull!1106 (v!3236 V!3513)) (EmptyCell!1106) )
))
(declare-datatypes ((array!4811 0))(
  ( (array!4812 (arr!2273 (Array (_ BitVec 32) ValueCell!1106)) (size!2545 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1120 0))(
  ( (LongMapFixedSize!1121 (defaultEntry!2912 Int) (mask!7237 (_ BitVec 32)) (extraKeys!2669 (_ BitVec 32)) (zeroValue!2763 V!3513) (minValue!2763 V!3513) (_size!609 (_ BitVec 32)) (_keys!4668 array!4809) (_values!2895 array!4811) (_vacant!609 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1120)

(declare-fun valid!544 (LongMapFixedSize!1120) Bool)

(assert (=> b!138040 (= res!66065 (valid!544 newMap!16))))

(declare-fun b!138041 () Bool)

(declare-fun e!89872 () Bool)

(declare-fun e!89877 () Bool)

(assert (=> b!138041 (= e!89872 e!89877)))

(declare-fun b!138042 () Bool)

(declare-fun e!89882 () Bool)

(assert (=> b!138042 (= e!89882 e!89872)))

(declare-fun b!138043 () Bool)

(declare-fun e!89875 () Bool)

(assert (=> b!138043 (= e!89869 e!89875)))

(declare-fun res!66062 () Bool)

(assert (=> b!138043 (=> (not res!66062) (not e!89875))))

(declare-datatypes ((tuple2!2618 0))(
  ( (tuple2!2619 (_1!1320 (_ BitVec 64)) (_2!1320 V!3513)) )
))
(declare-datatypes ((List!1722 0))(
  ( (Nil!1719) (Cons!1718 (h!2325 tuple2!2618) (t!6233 List!1722)) )
))
(declare-datatypes ((ListLongMap!1689 0))(
  ( (ListLongMap!1690 (toList!860 List!1722)) )
))
(declare-fun lt!72087 () ListLongMap!1689)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!72084 () ListLongMap!1689)

(declare-datatypes ((Cell!904 0))(
  ( (Cell!905 (v!3237 LongMapFixedSize!1120)) )
))
(declare-datatypes ((LongMap!904 0))(
  ( (LongMap!905 (underlying!463 Cell!904)) )
))
(declare-fun thiss!992 () LongMap!904)

(assert (=> b!138043 (= res!66062 (and (= lt!72087 lt!72084) (not (= (select (arr!2272 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2272 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1405 (LongMapFixedSize!1120) ListLongMap!1689)

(assert (=> b!138043 (= lt!72084 (map!1405 newMap!16))))

(declare-fun getCurrentListMap!525 (array!4809 array!4811 (_ BitVec 32) (_ BitVec 32) V!3513 V!3513 (_ BitVec 32) Int) ListLongMap!1689)

(assert (=> b!138043 (= lt!72087 (getCurrentListMap!525 (_keys!4668 (v!3237 (underlying!463 thiss!992))) (_values!2895 (v!3237 (underlying!463 thiss!992))) (mask!7237 (v!3237 (underlying!463 thiss!992))) (extraKeys!2669 (v!3237 (underlying!463 thiss!992))) (zeroValue!2763 (v!3237 (underlying!463 thiss!992))) (minValue!2763 (v!3237 (underlying!463 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2912 (v!3237 (underlying!463 thiss!992)))))))

(declare-fun b!138044 () Bool)

(declare-fun res!66063 () Bool)

(assert (=> b!138044 (=> (not res!66063) (not e!89869))))

(assert (=> b!138044 (= res!66063 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2544 (_keys!4668 (v!3237 (underlying!463 thiss!992)))))))))

(declare-fun e!89874 () Bool)

(declare-fun array_inv!1451 (array!4809) Bool)

(declare-fun array_inv!1452 (array!4811) Bool)

(assert (=> b!138045 (= e!89877 (and tp!11357 tp_is_empty!2899 (array_inv!1451 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) (array_inv!1452 (_values!2895 (v!3237 (underlying!463 thiss!992)))) e!89874))))

(declare-fun b!138046 () Bool)

(declare-fun e!89873 () Bool)

(assert (=> b!138046 (= e!89873 tp_is_empty!2899)))

(declare-fun b!138047 () Bool)

(declare-fun e!89883 () Bool)

(assert (=> b!138047 (= e!89883 (not (or (bvsge (size!2544 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!2544 (_keys!4668 (v!3237 (underlying!463 thiss!992))))))))))

(declare-fun arrayContainsKey!0 (array!4809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138047 (arrayContainsKey!0 (_keys!4668 (v!3237 (underlying!463 thiss!992))) (select (arr!2272 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4352 0))(
  ( (Unit!4353) )
))
(declare-fun lt!72085 () Unit!4352)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!134 (array!4809 array!4811 (_ BitVec 32) (_ BitVec 32) V!3513 V!3513 (_ BitVec 64) (_ BitVec 32) Int) Unit!4352)

(assert (=> b!138047 (= lt!72085 (lemmaListMapContainsThenArrayContainsFrom!134 (_keys!4668 (v!3237 (underlying!463 thiss!992))) (_values!2895 (v!3237 (underlying!463 thiss!992))) (mask!7237 (v!3237 (underlying!463 thiss!992))) (extraKeys!2669 (v!3237 (underlying!463 thiss!992))) (zeroValue!2763 (v!3237 (underlying!463 thiss!992))) (minValue!2763 (v!3237 (underlying!463 thiss!992))) (select (arr!2272 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2912 (v!3237 (underlying!463 thiss!992)))))))

(declare-fun mapNonEmpty!4727 () Bool)

(declare-fun mapRes!4728 () Bool)

(declare-fun tp!11358 () Bool)

(declare-fun e!89881 () Bool)

(assert (=> mapNonEmpty!4727 (= mapRes!4728 (and tp!11358 e!89881))))

(declare-fun mapValue!4728 () ValueCell!1106)

(declare-fun mapRest!4727 () (Array (_ BitVec 32) ValueCell!1106))

(declare-fun mapKey!4727 () (_ BitVec 32))

(assert (=> mapNonEmpty!4727 (= (arr!2273 (_values!2895 newMap!16)) (store mapRest!4727 mapKey!4727 mapValue!4728))))

(declare-fun b!138048 () Bool)

(declare-fun e!89876 () Bool)

(assert (=> b!138048 (= e!89876 (and e!89873 mapRes!4728))))

(declare-fun condMapEmpty!4728 () Bool)

(declare-fun mapDefault!4727 () ValueCell!1106)

(assert (=> b!138048 (= condMapEmpty!4728 (= (arr!2273 (_values!2895 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1106)) mapDefault!4727)))))

(declare-fun b!138049 () Bool)

(assert (=> b!138049 (= e!89874 (and e!89880 mapRes!4727))))

(declare-fun condMapEmpty!4727 () Bool)

(declare-fun mapDefault!4728 () ValueCell!1106)

(assert (=> b!138049 (= condMapEmpty!4727 (= (arr!2273 (_values!2895 (v!3237 (underlying!463 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1106)) mapDefault!4728)))))

(declare-fun b!138050 () Bool)

(declare-fun res!66066 () Bool)

(assert (=> b!138050 (=> (not res!66066) (not e!89869))))

(assert (=> b!138050 (= res!66066 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7237 newMap!16)) (_size!609 (v!3237 (underlying!463 thiss!992)))))))

(declare-fun res!66064 () Bool)

(assert (=> start!14578 (=> (not res!66064) (not e!89869))))

(declare-fun valid!545 (LongMap!904) Bool)

(assert (=> start!14578 (= res!66064 (valid!545 thiss!992))))

(assert (=> start!14578 e!89869))

(assert (=> start!14578 e!89882))

(assert (=> start!14578 true))

(declare-fun e!89879 () Bool)

(assert (=> start!14578 e!89879))

(declare-fun mapIsEmpty!4728 () Bool)

(assert (=> mapIsEmpty!4728 mapRes!4728))

(declare-fun b!138051 () Bool)

(assert (=> b!138051 (= e!89875 e!89883)))

(declare-fun res!66067 () Bool)

(assert (=> b!138051 (=> (not res!66067) (not e!89883))))

(declare-fun contains!899 (ListLongMap!1689 (_ BitVec 64)) Bool)

(assert (=> b!138051 (= res!66067 (contains!899 lt!72084 (select (arr!2272 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2620 0))(
  ( (tuple2!2621 (_1!1321 Bool) (_2!1321 LongMapFixedSize!1120)) )
))
(declare-fun lt!72086 () tuple2!2620)

(declare-fun update!200 (LongMapFixedSize!1120 (_ BitVec 64) V!3513) tuple2!2620)

(declare-fun get!1500 (ValueCell!1106 V!3513) V!3513)

(declare-fun dynLambda!426 (Int (_ BitVec 64)) V!3513)

(assert (=> b!138051 (= lt!72086 (update!200 newMap!16 (select (arr!2272 (_keys!4668 (v!3237 (underlying!463 thiss!992)))) from!355) (get!1500 (select (arr!2273 (_values!2895 (v!3237 (underlying!463 thiss!992)))) from!355) (dynLambda!426 (defaultEntry!2912 (v!3237 (underlying!463 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138052 () Bool)

(assert (=> b!138052 (= e!89881 tp_is_empty!2899)))

(declare-fun mapNonEmpty!4728 () Bool)

(declare-fun tp!11355 () Bool)

(declare-fun e!89870 () Bool)

(assert (=> mapNonEmpty!4728 (= mapRes!4727 (and tp!11355 e!89870))))

(declare-fun mapRest!4728 () (Array (_ BitVec 32) ValueCell!1106))

(declare-fun mapValue!4727 () ValueCell!1106)

(declare-fun mapKey!4728 () (_ BitVec 32))

(assert (=> mapNonEmpty!4728 (= (arr!2273 (_values!2895 (v!3237 (underlying!463 thiss!992)))) (store mapRest!4728 mapKey!4728 mapValue!4727))))

(assert (=> b!138053 (= e!89879 (and tp!11356 tp_is_empty!2899 (array_inv!1451 (_keys!4668 newMap!16)) (array_inv!1452 (_values!2895 newMap!16)) e!89876))))

(declare-fun b!138054 () Bool)

(assert (=> b!138054 (= e!89870 tp_is_empty!2899)))

(assert (= (and start!14578 res!66064) b!138044))

(assert (= (and b!138044 res!66063) b!138040))

(assert (= (and b!138040 res!66065) b!138050))

(assert (= (and b!138050 res!66066) b!138043))

(assert (= (and b!138043 res!66062) b!138051))

(assert (= (and b!138051 res!66067) b!138047))

(assert (= (and b!138049 condMapEmpty!4727) mapIsEmpty!4727))

(assert (= (and b!138049 (not condMapEmpty!4727)) mapNonEmpty!4728))

(get-info :version)

(assert (= (and mapNonEmpty!4728 ((_ is ValueCellFull!1106) mapValue!4727)) b!138054))

(assert (= (and b!138049 ((_ is ValueCellFull!1106) mapDefault!4728)) b!138039))

(assert (= b!138045 b!138049))

(assert (= b!138041 b!138045))

(assert (= b!138042 b!138041))

(assert (= start!14578 b!138042))

(assert (= (and b!138048 condMapEmpty!4728) mapIsEmpty!4728))

(assert (= (and b!138048 (not condMapEmpty!4728)) mapNonEmpty!4727))

(assert (= (and mapNonEmpty!4727 ((_ is ValueCellFull!1106) mapValue!4728)) b!138052))

(assert (= (and b!138048 ((_ is ValueCellFull!1106) mapDefault!4727)) b!138046))

(assert (= b!138053 b!138048))

(assert (= start!14578 b!138053))

(declare-fun b_lambda!6173 () Bool)

(assert (=> (not b_lambda!6173) (not b!138051)))

(declare-fun t!6230 () Bool)

(declare-fun tb!2473 () Bool)

(assert (=> (and b!138045 (= (defaultEntry!2912 (v!3237 (underlying!463 thiss!992))) (defaultEntry!2912 (v!3237 (underlying!463 thiss!992)))) t!6230) tb!2473))

(declare-fun result!4069 () Bool)

(assert (=> tb!2473 (= result!4069 tp_is_empty!2899)))

(assert (=> b!138051 t!6230))

(declare-fun b_and!8549 () Bool)

(assert (= b_and!8545 (and (=> t!6230 result!4069) b_and!8549)))

(declare-fun tb!2475 () Bool)

(declare-fun t!6232 () Bool)

(assert (=> (and b!138053 (= (defaultEntry!2912 newMap!16) (defaultEntry!2912 (v!3237 (underlying!463 thiss!992)))) t!6232) tb!2475))

(declare-fun result!4073 () Bool)

(assert (= result!4073 result!4069))

(assert (=> b!138051 t!6232))

(declare-fun b_and!8551 () Bool)

(assert (= b_and!8547 (and (=> t!6232 result!4073) b_and!8551)))

(declare-fun m!164967 () Bool)

(assert (=> b!138053 m!164967))

(declare-fun m!164969 () Bool)

(assert (=> b!138053 m!164969))

(declare-fun m!164971 () Bool)

(assert (=> mapNonEmpty!4728 m!164971))

(declare-fun m!164973 () Bool)

(assert (=> b!138047 m!164973))

(assert (=> b!138047 m!164973))

(declare-fun m!164975 () Bool)

(assert (=> b!138047 m!164975))

(assert (=> b!138047 m!164973))

(declare-fun m!164977 () Bool)

(assert (=> b!138047 m!164977))

(declare-fun m!164979 () Bool)

(assert (=> b!138051 m!164979))

(declare-fun m!164981 () Bool)

(assert (=> b!138051 m!164981))

(declare-fun m!164983 () Bool)

(assert (=> b!138051 m!164983))

(assert (=> b!138051 m!164973))

(declare-fun m!164985 () Bool)

(assert (=> b!138051 m!164985))

(assert (=> b!138051 m!164973))

(assert (=> b!138051 m!164981))

(assert (=> b!138051 m!164973))

(assert (=> b!138051 m!164983))

(declare-fun m!164987 () Bool)

(assert (=> b!138051 m!164987))

(assert (=> b!138051 m!164979))

(declare-fun m!164989 () Bool)

(assert (=> b!138045 m!164989))

(declare-fun m!164991 () Bool)

(assert (=> b!138045 m!164991))

(assert (=> b!138043 m!164973))

(declare-fun m!164993 () Bool)

(assert (=> b!138043 m!164993))

(declare-fun m!164995 () Bool)

(assert (=> b!138043 m!164995))

(declare-fun m!164997 () Bool)

(assert (=> b!138040 m!164997))

(declare-fun m!164999 () Bool)

(assert (=> mapNonEmpty!4727 m!164999))

(declare-fun m!165001 () Bool)

(assert (=> start!14578 m!165001))

(check-sat (not b!138045) (not b!138043) b_and!8549 (not start!14578) (not mapNonEmpty!4727) (not mapNonEmpty!4728) (not b!138051) tp_is_empty!2899 b_and!8551 (not b!138053) (not b!138040) (not b_lambda!6173) (not b_next!2967) (not b!138047) (not b_next!2965))
(check-sat b_and!8549 b_and!8551 (not b_next!2965) (not b_next!2967))
