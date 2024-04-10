; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13124 () Bool)

(assert start!13124)

(declare-fun b!115007 () Bool)

(declare-fun b_free!2657 () Bool)

(declare-fun b_next!2657 () Bool)

(assert (=> b!115007 (= b_free!2657 (not b_next!2657))))

(declare-fun tp!10335 () Bool)

(declare-fun b_and!7119 () Bool)

(assert (=> b!115007 (= tp!10335 b_and!7119)))

(declare-fun b!115004 () Bool)

(declare-fun b_free!2659 () Bool)

(declare-fun b_next!2659 () Bool)

(assert (=> b!115004 (= b_free!2659 (not b_next!2659))))

(declare-fun tp!10333 () Bool)

(declare-fun b_and!7121 () Bool)

(assert (=> b!115004 (= tp!10333 b_and!7121)))

(declare-fun b!114993 () Bool)

(declare-fun e!74889 () Bool)

(declare-fun tp_is_empty!2745 () Bool)

(assert (=> b!114993 (= e!74889 tp_is_empty!2745)))

(declare-fun b!114994 () Bool)

(declare-fun res!56519 () Bool)

(declare-fun e!74882 () Bool)

(assert (=> b!114994 (=> (not res!56519) (not e!74882))))

(declare-datatypes ((V!3307 0))(
  ( (V!3308 (val!1417 Int)) )
))
(declare-datatypes ((array!4493 0))(
  ( (array!4494 (arr!2129 (Array (_ BitVec 32) (_ BitVec 64))) (size!2389 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1029 0))(
  ( (ValueCellFull!1029 (v!3003 V!3307)) (EmptyCell!1029) )
))
(declare-datatypes ((array!4495 0))(
  ( (array!4496 (arr!2130 (Array (_ BitVec 32) ValueCell!1029)) (size!2390 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!966 0))(
  ( (LongMapFixedSize!967 (defaultEntry!2692 Int) (mask!6892 (_ BitVec 32)) (extraKeys!2481 (_ BitVec 32)) (zeroValue!2559 V!3307) (minValue!2559 V!3307) (_size!532 (_ BitVec 32)) (_keys!4414 array!4493) (_values!2675 array!4495) (_vacant!532 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!966)

(declare-fun valid!455 (LongMapFixedSize!966) Bool)

(assert (=> b!114994 (= res!56519 (valid!455 newMap!16))))

(declare-fun mapIsEmpty!4167 () Bool)

(declare-fun mapRes!4168 () Bool)

(assert (=> mapIsEmpty!4167 mapRes!4168))

(declare-fun b!114995 () Bool)

(declare-fun e!74883 () Bool)

(assert (=> b!114995 (= e!74883 tp_is_empty!2745)))

(declare-fun b!114996 () Bool)

(declare-fun e!74885 () Bool)

(assert (=> b!114996 (= e!74885 tp_is_empty!2745)))

(declare-fun b!114997 () Bool)

(declare-fun e!74878 () Bool)

(assert (=> b!114997 (= e!74878 tp_is_empty!2745)))

(declare-fun res!56521 () Bool)

(assert (=> start!13124 (=> (not res!56521) (not e!74882))))

(declare-datatypes ((Cell!766 0))(
  ( (Cell!767 (v!3004 LongMapFixedSize!966)) )
))
(declare-datatypes ((LongMap!766 0))(
  ( (LongMap!767 (underlying!394 Cell!766)) )
))
(declare-fun thiss!992 () LongMap!766)

(declare-fun valid!456 (LongMap!766) Bool)

(assert (=> start!13124 (= res!56521 (valid!456 thiss!992))))

(assert (=> start!13124 e!74882))

(declare-fun e!74884 () Bool)

(assert (=> start!13124 e!74884))

(assert (=> start!13124 true))

(declare-fun e!74879 () Bool)

(assert (=> start!13124 e!74879))

(declare-fun b!114998 () Bool)

(declare-datatypes ((Unit!3596 0))(
  ( (Unit!3597) )
))
(declare-fun e!74888 () Unit!3596)

(declare-fun Unit!3598 () Unit!3596)

(assert (=> b!114998 (= e!74888 Unit!3598)))

(declare-fun lt!59936 () Unit!3596)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!125 (array!4493 array!4495 (_ BitVec 32) (_ BitVec 32) V!3307 V!3307 (_ BitVec 64) (_ BitVec 32) Int) Unit!3596)

(assert (=> b!114998 (= lt!59936 (lemmaListMapContainsThenArrayContainsFrom!125 (_keys!4414 (v!3004 (underlying!394 thiss!992))) (_values!2675 (v!3004 (underlying!394 thiss!992))) (mask!6892 (v!3004 (underlying!394 thiss!992))) (extraKeys!2481 (v!3004 (underlying!394 thiss!992))) (zeroValue!2559 (v!3004 (underlying!394 thiss!992))) (minValue!2559 (v!3004 (underlying!394 thiss!992))) (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2692 (v!3004 (underlying!394 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114998 (arrayContainsKey!0 (_keys!4414 (v!3004 (underlying!394 thiss!992))) (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59933 () Unit!3596)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4493 (_ BitVec 32) (_ BitVec 32)) Unit!3596)

(assert (=> b!114998 (= lt!59933 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4414 (v!3004 (underlying!394 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1661 0))(
  ( (Nil!1658) (Cons!1657 (h!2257 (_ BitVec 64)) (t!5911 List!1661)) )
))
(declare-fun arrayNoDuplicates!0 (array!4493 (_ BitVec 32) List!1661) Bool)

(assert (=> b!114998 (arrayNoDuplicates!0 (_keys!4414 (v!3004 (underlying!394 thiss!992))) from!355 Nil!1658)))

(declare-fun lt!59937 () Unit!3596)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4493 (_ BitVec 32) (_ BitVec 64) List!1661) Unit!3596)

(assert (=> b!114998 (= lt!59937 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4414 (v!3004 (underlying!394 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) (Cons!1657 (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) Nil!1658)))))

(assert (=> b!114998 false))

(declare-fun b!114999 () Bool)

(declare-fun e!74887 () Bool)

(assert (=> b!114999 (= e!74882 e!74887)))

(declare-fun res!56518 () Bool)

(assert (=> b!114999 (=> (not res!56518) (not e!74887))))

(declare-datatypes ((tuple2!2496 0))(
  ( (tuple2!2497 (_1!1259 (_ BitVec 64)) (_2!1259 V!3307)) )
))
(declare-datatypes ((List!1662 0))(
  ( (Nil!1659) (Cons!1658 (h!2258 tuple2!2496) (t!5912 List!1662)) )
))
(declare-datatypes ((ListLongMap!1623 0))(
  ( (ListLongMap!1624 (toList!827 List!1662)) )
))
(declare-fun lt!59935 () ListLongMap!1623)

(declare-fun lt!59931 () ListLongMap!1623)

(assert (=> b!114999 (= res!56518 (and (= lt!59935 lt!59931) (not (= (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1328 (LongMapFixedSize!966) ListLongMap!1623)

(assert (=> b!114999 (= lt!59931 (map!1328 newMap!16))))

(declare-fun getCurrentListMap!509 (array!4493 array!4495 (_ BitVec 32) (_ BitVec 32) V!3307 V!3307 (_ BitVec 32) Int) ListLongMap!1623)

(assert (=> b!114999 (= lt!59935 (getCurrentListMap!509 (_keys!4414 (v!3004 (underlying!394 thiss!992))) (_values!2675 (v!3004 (underlying!394 thiss!992))) (mask!6892 (v!3004 (underlying!394 thiss!992))) (extraKeys!2481 (v!3004 (underlying!394 thiss!992))) (zeroValue!2559 (v!3004 (underlying!394 thiss!992))) (minValue!2559 (v!3004 (underlying!394 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2692 (v!3004 (underlying!394 thiss!992)))))))

(declare-fun b!115000 () Bool)

(assert (=> b!115000 (= e!74887 false)))

(declare-fun lt!59934 () Unit!3596)

(assert (=> b!115000 (= lt!59934 e!74888)))

(declare-fun c!20522 () Bool)

(declare-fun contains!859 (ListLongMap!1623 (_ BitVec 64)) Bool)

(assert (=> b!115000 (= c!20522 (contains!859 lt!59931 (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2498 0))(
  ( (tuple2!2499 (_1!1260 Bool) (_2!1260 LongMapFixedSize!966)) )
))
(declare-fun lt!59932 () tuple2!2498)

(declare-fun update!175 (LongMapFixedSize!966 (_ BitVec 64) V!3307) tuple2!2498)

(declare-fun get!1386 (ValueCell!1029 V!3307) V!3307)

(declare-fun dynLambda!402 (Int (_ BitVec 64)) V!3307)

(assert (=> b!115000 (= lt!59932 (update!175 newMap!16 (select (arr!2129 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) from!355) (get!1386 (select (arr!2130 (_values!2675 (v!3004 (underlying!394 thiss!992)))) from!355) (dynLambda!402 (defaultEntry!2692 (v!3004 (underlying!394 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115001 () Bool)

(declare-fun e!74890 () Bool)

(declare-fun e!74881 () Bool)

(assert (=> b!115001 (= e!74890 e!74881)))

(declare-fun mapNonEmpty!4167 () Bool)

(declare-fun tp!10336 () Bool)

(assert (=> mapNonEmpty!4167 (= mapRes!4168 (and tp!10336 e!74889))))

(declare-fun mapValue!4168 () ValueCell!1029)

(declare-fun mapKey!4168 () (_ BitVec 32))

(declare-fun mapRest!4167 () (Array (_ BitVec 32) ValueCell!1029))

(assert (=> mapNonEmpty!4167 (= (arr!2130 (_values!2675 newMap!16)) (store mapRest!4167 mapKey!4168 mapValue!4168))))

(declare-fun b!115002 () Bool)

(declare-fun e!74892 () Bool)

(assert (=> b!115002 (= e!74892 (and e!74885 mapRes!4168))))

(declare-fun condMapEmpty!4168 () Bool)

(declare-fun mapDefault!4167 () ValueCell!1029)

(assert (=> b!115002 (= condMapEmpty!4168 (= (arr!2130 (_values!2675 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1029)) mapDefault!4167)))))

(declare-fun b!115003 () Bool)

(declare-fun Unit!3599 () Unit!3596)

(assert (=> b!115003 (= e!74888 Unit!3599)))

(declare-fun array_inv!1339 (array!4493) Bool)

(declare-fun array_inv!1340 (array!4495) Bool)

(assert (=> b!115004 (= e!74879 (and tp!10333 tp_is_empty!2745 (array_inv!1339 (_keys!4414 newMap!16)) (array_inv!1340 (_values!2675 newMap!16)) e!74892))))

(declare-fun b!115005 () Bool)

(declare-fun e!74880 () Bool)

(declare-fun mapRes!4167 () Bool)

(assert (=> b!115005 (= e!74880 (and e!74883 mapRes!4167))))

(declare-fun condMapEmpty!4167 () Bool)

(declare-fun mapDefault!4168 () ValueCell!1029)

(assert (=> b!115005 (= condMapEmpty!4167 (= (arr!2130 (_values!2675 (v!3004 (underlying!394 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1029)) mapDefault!4168)))))

(declare-fun b!115006 () Bool)

(assert (=> b!115006 (= e!74884 e!74890)))

(assert (=> b!115007 (= e!74881 (and tp!10335 tp_is_empty!2745 (array_inv!1339 (_keys!4414 (v!3004 (underlying!394 thiss!992)))) (array_inv!1340 (_values!2675 (v!3004 (underlying!394 thiss!992)))) e!74880))))

(declare-fun mapIsEmpty!4168 () Bool)

(assert (=> mapIsEmpty!4168 mapRes!4167))

(declare-fun b!115008 () Bool)

(declare-fun res!56517 () Bool)

(assert (=> b!115008 (=> (not res!56517) (not e!74882))))

(assert (=> b!115008 (= res!56517 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2389 (_keys!4414 (v!3004 (underlying!394 thiss!992)))))))))

(declare-fun b!115009 () Bool)

(declare-fun res!56520 () Bool)

(assert (=> b!115009 (=> (not res!56520) (not e!74882))))

(assert (=> b!115009 (= res!56520 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6892 newMap!16)) (_size!532 (v!3004 (underlying!394 thiss!992)))))))

(declare-fun mapNonEmpty!4168 () Bool)

(declare-fun tp!10334 () Bool)

(assert (=> mapNonEmpty!4168 (= mapRes!4167 (and tp!10334 e!74878))))

(declare-fun mapRest!4168 () (Array (_ BitVec 32) ValueCell!1029))

(declare-fun mapKey!4167 () (_ BitVec 32))

(declare-fun mapValue!4167 () ValueCell!1029)

(assert (=> mapNonEmpty!4168 (= (arr!2130 (_values!2675 (v!3004 (underlying!394 thiss!992)))) (store mapRest!4168 mapKey!4167 mapValue!4167))))

(assert (= (and start!13124 res!56521) b!115008))

(assert (= (and b!115008 res!56517) b!114994))

(assert (= (and b!114994 res!56519) b!115009))

(assert (= (and b!115009 res!56520) b!114999))

(assert (= (and b!114999 res!56518) b!115000))

(assert (= (and b!115000 c!20522) b!114998))

(assert (= (and b!115000 (not c!20522)) b!115003))

(assert (= (and b!115005 condMapEmpty!4167) mapIsEmpty!4168))

(assert (= (and b!115005 (not condMapEmpty!4167)) mapNonEmpty!4168))

(get-info :version)

(assert (= (and mapNonEmpty!4168 ((_ is ValueCellFull!1029) mapValue!4167)) b!114997))

(assert (= (and b!115005 ((_ is ValueCellFull!1029) mapDefault!4168)) b!114995))

(assert (= b!115007 b!115005))

(assert (= b!115001 b!115007))

(assert (= b!115006 b!115001))

(assert (= start!13124 b!115006))

(assert (= (and b!115002 condMapEmpty!4168) mapIsEmpty!4167))

(assert (= (and b!115002 (not condMapEmpty!4168)) mapNonEmpty!4167))

(assert (= (and mapNonEmpty!4167 ((_ is ValueCellFull!1029) mapValue!4168)) b!114993))

(assert (= (and b!115002 ((_ is ValueCellFull!1029) mapDefault!4167)) b!114996))

(assert (= b!115004 b!115002))

(assert (= start!13124 b!115004))

(declare-fun b_lambda!5139 () Bool)

(assert (=> (not b_lambda!5139) (not b!115000)))

(declare-fun t!5908 () Bool)

(declare-fun tb!2213 () Bool)

(assert (=> (and b!115007 (= (defaultEntry!2692 (v!3004 (underlying!394 thiss!992))) (defaultEntry!2692 (v!3004 (underlying!394 thiss!992)))) t!5908) tb!2213))

(declare-fun result!3691 () Bool)

(assert (=> tb!2213 (= result!3691 tp_is_empty!2745)))

(assert (=> b!115000 t!5908))

(declare-fun b_and!7123 () Bool)

(assert (= b_and!7119 (and (=> t!5908 result!3691) b_and!7123)))

(declare-fun t!5910 () Bool)

(declare-fun tb!2215 () Bool)

(assert (=> (and b!115004 (= (defaultEntry!2692 newMap!16) (defaultEntry!2692 (v!3004 (underlying!394 thiss!992)))) t!5910) tb!2215))

(declare-fun result!3695 () Bool)

(assert (= result!3695 result!3691))

(assert (=> b!115000 t!5910))

(declare-fun b_and!7125 () Bool)

(assert (= b_and!7121 (and (=> t!5910 result!3695) b_and!7125)))

(declare-fun m!131323 () Bool)

(assert (=> b!114994 m!131323))

(declare-fun m!131325 () Bool)

(assert (=> b!115007 m!131325))

(declare-fun m!131327 () Bool)

(assert (=> b!115007 m!131327))

(declare-fun m!131329 () Bool)

(assert (=> mapNonEmpty!4168 m!131329))

(declare-fun m!131331 () Bool)

(assert (=> b!114998 m!131331))

(declare-fun m!131333 () Bool)

(assert (=> b!114998 m!131333))

(declare-fun m!131335 () Bool)

(assert (=> b!114998 m!131335))

(declare-fun m!131337 () Bool)

(assert (=> b!114998 m!131337))

(assert (=> b!114998 m!131335))

(assert (=> b!114998 m!131335))

(declare-fun m!131339 () Bool)

(assert (=> b!114998 m!131339))

(assert (=> b!114998 m!131335))

(declare-fun m!131341 () Bool)

(assert (=> b!114998 m!131341))

(declare-fun m!131343 () Bool)

(assert (=> b!115004 m!131343))

(declare-fun m!131345 () Bool)

(assert (=> b!115004 m!131345))

(declare-fun m!131347 () Bool)

(assert (=> mapNonEmpty!4167 m!131347))

(declare-fun m!131349 () Bool)

(assert (=> start!13124 m!131349))

(declare-fun m!131351 () Bool)

(assert (=> b!115000 m!131351))

(declare-fun m!131353 () Bool)

(assert (=> b!115000 m!131353))

(declare-fun m!131355 () Bool)

(assert (=> b!115000 m!131355))

(assert (=> b!115000 m!131335))

(assert (=> b!115000 m!131335))

(assert (=> b!115000 m!131355))

(declare-fun m!131357 () Bool)

(assert (=> b!115000 m!131357))

(assert (=> b!115000 m!131351))

(assert (=> b!115000 m!131335))

(declare-fun m!131359 () Bool)

(assert (=> b!115000 m!131359))

(assert (=> b!115000 m!131353))

(assert (=> b!114999 m!131335))

(declare-fun m!131361 () Bool)

(assert (=> b!114999 m!131361))

(declare-fun m!131363 () Bool)

(assert (=> b!114999 m!131363))

(check-sat (not b!114999) (not b!115007) (not b!114998) (not b_next!2657) b_and!7123 (not start!13124) (not b!115004) (not b_lambda!5139) (not b_next!2659) (not mapNonEmpty!4168) (not mapNonEmpty!4167) b_and!7125 (not b!114994) (not b!115000) tp_is_empty!2745)
(check-sat b_and!7123 b_and!7125 (not b_next!2657) (not b_next!2659))
