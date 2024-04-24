; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11104 () Bool)

(assert start!11104)

(declare-fun b!90484 () Bool)

(declare-fun b_free!2293 () Bool)

(declare-fun b_next!2293 () Bool)

(assert (=> b!90484 (= b_free!2293 (not b_next!2293))))

(declare-fun tp!9128 () Bool)

(declare-fun b_and!5445 () Bool)

(assert (=> b!90484 (= tp!9128 b_and!5445)))

(declare-fun b!90481 () Bool)

(declare-fun b_free!2295 () Bool)

(declare-fun b_next!2295 () Bool)

(assert (=> b!90481 (= b_free!2295 (not b_next!2295))))

(declare-fun tp!9127 () Bool)

(declare-fun b_and!5447 () Bool)

(assert (=> b!90481 (= tp!9127 b_and!5447)))

(declare-fun b!90474 () Bool)

(declare-fun e!58924 () Bool)

(declare-fun tp_is_empty!2563 () Bool)

(assert (=> b!90474 (= e!58924 tp_is_empty!2563)))

(declare-fun b!90475 () Bool)

(declare-fun e!58929 () Bool)

(assert (=> b!90475 (= e!58929 (not true))))

(declare-datatypes ((V!3065 0))(
  ( (V!3066 (val!1326 Int)) )
))
(declare-datatypes ((tuple2!2222 0))(
  ( (tuple2!2223 (_1!1122 (_ BitVec 64)) (_2!1122 V!3065)) )
))
(declare-datatypes ((List!1525 0))(
  ( (Nil!1522) (Cons!1521 (h!2113 tuple2!2222) (t!5315 List!1525)) )
))
(declare-datatypes ((ListLongMap!1461 0))(
  ( (ListLongMap!1462 (toList!746 List!1525)) )
))
(declare-fun lt!43790 () ListLongMap!1461)

(declare-datatypes ((array!4079 0))(
  ( (array!4080 (arr!1940 (Array (_ BitVec 32) (_ BitVec 64))) (size!2187 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!938 0))(
  ( (ValueCellFull!938 (v!2702 V!3065)) (EmptyCell!938) )
))
(declare-datatypes ((array!4081 0))(
  ( (array!4082 (arr!1941 (Array (_ BitVec 32) ValueCell!938)) (size!2188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!784 0))(
  ( (LongMapFixedSize!785 (defaultEntry!2393 Int) (mask!6447 (_ BitVec 32)) (extraKeys!2224 (_ BitVec 32)) (zeroValue!2281 V!3065) (minValue!2281 V!3065) (_size!441 (_ BitVec 32)) (_keys!4073 array!4079) (_values!2376 array!4081) (_vacant!441 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2224 0))(
  ( (tuple2!2225 (_1!1123 Bool) (_2!1123 LongMapFixedSize!784)) )
))
(declare-fun lt!43782 () tuple2!2224)

(declare-fun map!1212 (LongMapFixedSize!784) ListLongMap!1461)

(assert (=> b!90475 (= lt!43790 (map!1212 (_2!1123 lt!43782)))))

(declare-fun lt!43781 () ListLongMap!1461)

(declare-datatypes ((Cell!590 0))(
  ( (Cell!591 (v!2703 LongMapFixedSize!784)) )
))
(declare-datatypes ((LongMap!590 0))(
  ( (LongMap!591 (underlying!306 Cell!590)) )
))
(declare-fun thiss!992 () LongMap!590)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!436 (array!4079 array!4081 (_ BitVec 32) (_ BitVec 32) V!3065 V!3065 (_ BitVec 32) Int) ListLongMap!1461)

(assert (=> b!90475 (= lt!43781 (getCurrentListMap!436 (_keys!4073 (v!2703 (underlying!306 thiss!992))) (_values!2376 (v!2703 (underlying!306 thiss!992))) (mask!6447 (v!2703 (underlying!306 thiss!992))) (extraKeys!2224 (v!2703 (underlying!306 thiss!992))) (zeroValue!2281 (v!2703 (underlying!306 thiss!992))) (minValue!2281 (v!2703 (underlying!306 thiss!992))) from!355 (defaultEntry!2393 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun lt!43776 () tuple2!2222)

(declare-fun lt!43778 () ListLongMap!1461)

(declare-fun lt!43794 () tuple2!2222)

(declare-fun lt!43791 () ListLongMap!1461)

(declare-fun +!115 (ListLongMap!1461 tuple2!2222) ListLongMap!1461)

(assert (=> b!90475 (= (+!115 lt!43778 lt!43776) (+!115 (+!115 lt!43791 lt!43776) lt!43794))))

(assert (=> b!90475 (= lt!43776 (tuple2!2223 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2281 (v!2703 (underlying!306 thiss!992)))))))

(declare-datatypes ((Unit!2672 0))(
  ( (Unit!2673) )
))
(declare-fun lt!43789 () Unit!2672)

(declare-fun lt!43792 () V!3065)

(declare-fun addCommutativeForDiffKeys!35 (ListLongMap!1461 (_ BitVec 64) V!3065 (_ BitVec 64) V!3065) Unit!2672)

(assert (=> b!90475 (= lt!43789 (addCommutativeForDiffKeys!35 lt!43791 (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) lt!43792 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2281 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun lt!43783 () ListLongMap!1461)

(assert (=> b!90475 (= lt!43783 lt!43778)))

(assert (=> b!90475 (= lt!43778 (+!115 lt!43791 lt!43794))))

(declare-fun lt!43785 () ListLongMap!1461)

(declare-fun lt!43793 () tuple2!2222)

(assert (=> b!90475 (= lt!43783 (+!115 lt!43785 lt!43793))))

(declare-fun lt!43775 () ListLongMap!1461)

(assert (=> b!90475 (= lt!43791 (+!115 lt!43775 lt!43793))))

(assert (=> b!90475 (= lt!43793 (tuple2!2223 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2281 (v!2703 (underlying!306 thiss!992)))))))

(assert (=> b!90475 (= lt!43785 (+!115 lt!43775 lt!43794))))

(assert (=> b!90475 (= lt!43794 (tuple2!2223 (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) lt!43792))))

(declare-fun lt!43786 () Unit!2672)

(assert (=> b!90475 (= lt!43786 (addCommutativeForDiffKeys!35 lt!43775 (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) lt!43792 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2281 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!80 (array!4079 array!4081 (_ BitVec 32) (_ BitVec 32) V!3065 V!3065 (_ BitVec 32) Int) ListLongMap!1461)

(assert (=> b!90475 (= lt!43775 (getCurrentListMapNoExtraKeys!80 (_keys!4073 (v!2703 (underlying!306 thiss!992))) (_values!2376 (v!2703 (underlying!306 thiss!992))) (mask!6447 (v!2703 (underlying!306 thiss!992))) (extraKeys!2224 (v!2703 (underlying!306 thiss!992))) (zeroValue!2281 (v!2703 (underlying!306 thiss!992))) (minValue!2281 (v!2703 (underlying!306 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2393 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun b!90476 () Bool)

(declare-fun e!58917 () Bool)

(declare-fun e!58932 () Bool)

(assert (=> b!90476 (= e!58917 e!58932)))

(declare-fun b!90477 () Bool)

(declare-fun e!58926 () Bool)

(declare-fun mapRes!3508 () Bool)

(assert (=> b!90477 (= e!58926 (and e!58924 mapRes!3508))))

(declare-fun condMapEmpty!3508 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!784)

(declare-fun mapDefault!3508 () ValueCell!938)

(assert (=> b!90477 (= condMapEmpty!3508 (= (arr!1941 (_values!2376 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!938)) mapDefault!3508)))))

(declare-fun b!90478 () Bool)

(declare-fun e!58928 () Bool)

(declare-fun e!58920 () Bool)

(assert (=> b!90478 (= e!58928 e!58920)))

(declare-fun res!46160 () Bool)

(assert (=> b!90478 (=> (not res!46160) (not e!58920))))

(assert (=> b!90478 (= res!46160 (and (not (= (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1231 (ValueCell!938 V!3065) V!3065)

(declare-fun dynLambda!350 (Int (_ BitVec 64)) V!3065)

(assert (=> b!90478 (= lt!43792 (get!1231 (select (arr!1941 (_values!2376 (v!2703 (underlying!306 thiss!992)))) from!355) (dynLambda!350 (defaultEntry!2393 (v!2703 (underlying!306 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3507 () Bool)

(declare-fun tp!9130 () Bool)

(declare-fun e!58930 () Bool)

(assert (=> mapNonEmpty!3507 (= mapRes!3508 (and tp!9130 e!58930))))

(declare-fun mapKey!3507 () (_ BitVec 32))

(declare-fun mapValue!3507 () ValueCell!938)

(declare-fun mapRest!3508 () (Array (_ BitVec 32) ValueCell!938))

(assert (=> mapNonEmpty!3507 (= (arr!1941 (_values!2376 newMap!16)) (store mapRest!3508 mapKey!3507 mapValue!3507))))

(declare-fun b!90479 () Bool)

(declare-fun e!58918 () Unit!2672)

(declare-fun Unit!2674 () Unit!2672)

(assert (=> b!90479 (= e!58918 Unit!2674)))

(declare-fun e!58931 () Bool)

(declare-fun array_inv!1193 (array!4079) Bool)

(declare-fun array_inv!1194 (array!4081) Bool)

(assert (=> b!90481 (= e!58931 (and tp!9127 tp_is_empty!2563 (array_inv!1193 (_keys!4073 newMap!16)) (array_inv!1194 (_values!2376 newMap!16)) e!58926))))

(declare-fun b!90482 () Bool)

(declare-fun e!58923 () Bool)

(assert (=> b!90482 (= e!58923 e!58928)))

(declare-fun res!46161 () Bool)

(assert (=> b!90482 (=> (not res!46161) (not e!58928))))

(declare-fun lt!43784 () ListLongMap!1461)

(declare-fun lt!43780 () ListLongMap!1461)

(assert (=> b!90482 (= res!46161 (= lt!43784 lt!43780))))

(assert (=> b!90482 (= lt!43780 (map!1212 newMap!16))))

(assert (=> b!90482 (= lt!43784 (getCurrentListMap!436 (_keys!4073 (v!2703 (underlying!306 thiss!992))) (_values!2376 (v!2703 (underlying!306 thiss!992))) (mask!6447 (v!2703 (underlying!306 thiss!992))) (extraKeys!2224 (v!2703 (underlying!306 thiss!992))) (zeroValue!2281 (v!2703 (underlying!306 thiss!992))) (minValue!2281 (v!2703 (underlying!306 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2393 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun b!90483 () Bool)

(declare-fun e!58922 () Bool)

(assert (=> b!90483 (= e!58922 tp_is_empty!2563)))

(declare-fun e!58919 () Bool)

(declare-fun e!58925 () Bool)

(assert (=> b!90484 (= e!58919 (and tp!9128 tp_is_empty!2563 (array_inv!1193 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) (array_inv!1194 (_values!2376 (v!2703 (underlying!306 thiss!992)))) e!58925))))

(declare-fun mapIsEmpty!3507 () Bool)

(declare-fun mapRes!3507 () Bool)

(assert (=> mapIsEmpty!3507 mapRes!3507))

(declare-fun b!90485 () Bool)

(declare-fun res!46164 () Bool)

(assert (=> b!90485 (=> (not res!46164) (not e!58923))))

(assert (=> b!90485 (= res!46164 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6447 newMap!16)) (_size!441 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun b!90486 () Bool)

(assert (=> b!90486 (= e!58932 e!58919)))

(declare-fun b!90487 () Bool)

(assert (=> b!90487 (= e!58930 tp_is_empty!2563)))

(declare-fun mapIsEmpty!3508 () Bool)

(assert (=> mapIsEmpty!3508 mapRes!3508))

(declare-fun b!90488 () Bool)

(declare-fun Unit!2675 () Unit!2672)

(assert (=> b!90488 (= e!58918 Unit!2675)))

(declare-fun lt!43788 () Unit!2672)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!66 (array!4079 array!4081 (_ BitVec 32) (_ BitVec 32) V!3065 V!3065 (_ BitVec 64) (_ BitVec 32) Int) Unit!2672)

(assert (=> b!90488 (= lt!43788 (lemmaListMapContainsThenArrayContainsFrom!66 (_keys!4073 (v!2703 (underlying!306 thiss!992))) (_values!2376 (v!2703 (underlying!306 thiss!992))) (mask!6447 (v!2703 (underlying!306 thiss!992))) (extraKeys!2224 (v!2703 (underlying!306 thiss!992))) (zeroValue!2281 (v!2703 (underlying!306 thiss!992))) (minValue!2281 (v!2703 (underlying!306 thiss!992))) (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2393 (v!2703 (underlying!306 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90488 (arrayContainsKey!0 (_keys!4073 (v!2703 (underlying!306 thiss!992))) (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43777 () Unit!2672)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4079 (_ BitVec 32) (_ BitVec 32)) Unit!2672)

(assert (=> b!90488 (= lt!43777 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4073 (v!2703 (underlying!306 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1526 0))(
  ( (Nil!1523) (Cons!1522 (h!2114 (_ BitVec 64)) (t!5316 List!1526)) )
))
(declare-fun arrayNoDuplicates!0 (array!4079 (_ BitVec 32) List!1526) Bool)

(assert (=> b!90488 (arrayNoDuplicates!0 (_keys!4073 (v!2703 (underlying!306 thiss!992))) from!355 Nil!1523)))

(declare-fun lt!43779 () Unit!2672)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4079 (_ BitVec 32) (_ BitVec 64) List!1526) Unit!2672)

(assert (=> b!90488 (= lt!43779 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4073 (v!2703 (underlying!306 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) (Cons!1522 (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) Nil!1523)))))

(assert (=> b!90488 false))

(declare-fun b!90489 () Bool)

(declare-fun e!58921 () Bool)

(assert (=> b!90489 (= e!58925 (and e!58921 mapRes!3507))))

(declare-fun condMapEmpty!3507 () Bool)

(declare-fun mapDefault!3507 () ValueCell!938)

(assert (=> b!90489 (= condMapEmpty!3507 (= (arr!1941 (_values!2376 (v!2703 (underlying!306 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!938)) mapDefault!3507)))))

(declare-fun b!90480 () Bool)

(assert (=> b!90480 (= e!58921 tp_is_empty!2563)))

(declare-fun res!46162 () Bool)

(assert (=> start!11104 (=> (not res!46162) (not e!58923))))

(declare-fun valid!350 (LongMap!590) Bool)

(assert (=> start!11104 (= res!46162 (valid!350 thiss!992))))

(assert (=> start!11104 e!58923))

(assert (=> start!11104 e!58917))

(assert (=> start!11104 true))

(assert (=> start!11104 e!58931))

(declare-fun b!90490 () Bool)

(declare-fun res!46159 () Bool)

(assert (=> b!90490 (=> (not res!46159) (not e!58923))))

(declare-fun valid!351 (LongMapFixedSize!784) Bool)

(assert (=> b!90490 (= res!46159 (valid!351 newMap!16))))

(declare-fun mapNonEmpty!3508 () Bool)

(declare-fun tp!9129 () Bool)

(assert (=> mapNonEmpty!3508 (= mapRes!3507 (and tp!9129 e!58922))))

(declare-fun mapValue!3508 () ValueCell!938)

(declare-fun mapRest!3507 () (Array (_ BitVec 32) ValueCell!938))

(declare-fun mapKey!3508 () (_ BitVec 32))

(assert (=> mapNonEmpty!3508 (= (arr!1941 (_values!2376 (v!2703 (underlying!306 thiss!992)))) (store mapRest!3507 mapKey!3508 mapValue!3508))))

(declare-fun b!90491 () Bool)

(assert (=> b!90491 (= e!58920 e!58929)))

(declare-fun res!46165 () Bool)

(assert (=> b!90491 (=> (not res!46165) (not e!58929))))

(assert (=> b!90491 (= res!46165 (and (_1!1123 lt!43782) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43787 () Unit!2672)

(assert (=> b!90491 (= lt!43787 e!58918)))

(declare-fun c!15054 () Bool)

(declare-fun contains!763 (ListLongMap!1461 (_ BitVec 64)) Bool)

(assert (=> b!90491 (= c!15054 (contains!763 lt!43780 (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355)))))

(declare-fun update!131 (LongMapFixedSize!784 (_ BitVec 64) V!3065) tuple2!2224)

(assert (=> b!90491 (= lt!43782 (update!131 newMap!16 (select (arr!1940 (_keys!4073 (v!2703 (underlying!306 thiss!992)))) from!355) lt!43792))))

(declare-fun b!90492 () Bool)

(declare-fun res!46163 () Bool)

(assert (=> b!90492 (=> (not res!46163) (not e!58923))))

(assert (=> b!90492 (= res!46163 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2187 (_keys!4073 (v!2703 (underlying!306 thiss!992)))))))))

(assert (= (and start!11104 res!46162) b!90492))

(assert (= (and b!90492 res!46163) b!90490))

(assert (= (and b!90490 res!46159) b!90485))

(assert (= (and b!90485 res!46164) b!90482))

(assert (= (and b!90482 res!46161) b!90478))

(assert (= (and b!90478 res!46160) b!90491))

(assert (= (and b!90491 c!15054) b!90488))

(assert (= (and b!90491 (not c!15054)) b!90479))

(assert (= (and b!90491 res!46165) b!90475))

(assert (= (and b!90489 condMapEmpty!3507) mapIsEmpty!3507))

(assert (= (and b!90489 (not condMapEmpty!3507)) mapNonEmpty!3508))

(get-info :version)

(assert (= (and mapNonEmpty!3508 ((_ is ValueCellFull!938) mapValue!3508)) b!90483))

(assert (= (and b!90489 ((_ is ValueCellFull!938) mapDefault!3507)) b!90480))

(assert (= b!90484 b!90489))

(assert (= b!90486 b!90484))

(assert (= b!90476 b!90486))

(assert (= start!11104 b!90476))

(assert (= (and b!90477 condMapEmpty!3508) mapIsEmpty!3508))

(assert (= (and b!90477 (not condMapEmpty!3508)) mapNonEmpty!3507))

(assert (= (and mapNonEmpty!3507 ((_ is ValueCellFull!938) mapValue!3507)) b!90487))

(assert (= (and b!90477 ((_ is ValueCellFull!938) mapDefault!3508)) b!90474))

(assert (= b!90481 b!90477))

(assert (= start!11104 b!90481))

(declare-fun b_lambda!3997 () Bool)

(assert (=> (not b_lambda!3997) (not b!90478)))

(declare-fun t!5312 () Bool)

(declare-fun tb!1757 () Bool)

(assert (=> (and b!90484 (= (defaultEntry!2393 (v!2703 (underlying!306 thiss!992))) (defaultEntry!2393 (v!2703 (underlying!306 thiss!992)))) t!5312) tb!1757))

(declare-fun result!3017 () Bool)

(assert (=> tb!1757 (= result!3017 tp_is_empty!2563)))

(assert (=> b!90478 t!5312))

(declare-fun b_and!5449 () Bool)

(assert (= b_and!5445 (and (=> t!5312 result!3017) b_and!5449)))

(declare-fun t!5314 () Bool)

(declare-fun tb!1759 () Bool)

(assert (=> (and b!90481 (= (defaultEntry!2393 newMap!16) (defaultEntry!2393 (v!2703 (underlying!306 thiss!992)))) t!5314) tb!1759))

(declare-fun result!3021 () Bool)

(assert (= result!3021 result!3017))

(assert (=> b!90478 t!5314))

(declare-fun b_and!5451 () Bool)

(assert (= b_and!5447 (and (=> t!5314 result!3021) b_and!5451)))

(declare-fun m!97123 () Bool)

(assert (=> b!90484 m!97123))

(declare-fun m!97125 () Bool)

(assert (=> b!90484 m!97125))

(declare-fun m!97127 () Bool)

(assert (=> b!90481 m!97127))

(declare-fun m!97129 () Bool)

(assert (=> b!90481 m!97129))

(declare-fun m!97131 () Bool)

(assert (=> b!90490 m!97131))

(declare-fun m!97133 () Bool)

(assert (=> b!90488 m!97133))

(declare-fun m!97135 () Bool)

(assert (=> b!90488 m!97135))

(declare-fun m!97137 () Bool)

(assert (=> b!90488 m!97137))

(declare-fun m!97139 () Bool)

(assert (=> b!90488 m!97139))

(assert (=> b!90488 m!97137))

(assert (=> b!90488 m!97137))

(declare-fun m!97141 () Bool)

(assert (=> b!90488 m!97141))

(assert (=> b!90488 m!97137))

(declare-fun m!97143 () Bool)

(assert (=> b!90488 m!97143))

(assert (=> b!90478 m!97137))

(declare-fun m!97145 () Bool)

(assert (=> b!90478 m!97145))

(declare-fun m!97147 () Bool)

(assert (=> b!90478 m!97147))

(assert (=> b!90478 m!97145))

(assert (=> b!90478 m!97147))

(declare-fun m!97149 () Bool)

(assert (=> b!90478 m!97149))

(declare-fun m!97151 () Bool)

(assert (=> b!90475 m!97151))

(declare-fun m!97153 () Bool)

(assert (=> b!90475 m!97153))

(assert (=> b!90475 m!97137))

(declare-fun m!97155 () Bool)

(assert (=> b!90475 m!97155))

(declare-fun m!97157 () Bool)

(assert (=> b!90475 m!97157))

(assert (=> b!90475 m!97137))

(declare-fun m!97159 () Bool)

(assert (=> b!90475 m!97159))

(declare-fun m!97161 () Bool)

(assert (=> b!90475 m!97161))

(declare-fun m!97163 () Bool)

(assert (=> b!90475 m!97163))

(declare-fun m!97165 () Bool)

(assert (=> b!90475 m!97165))

(assert (=> b!90475 m!97163))

(declare-fun m!97167 () Bool)

(assert (=> b!90475 m!97167))

(declare-fun m!97169 () Bool)

(assert (=> b!90475 m!97169))

(declare-fun m!97171 () Bool)

(assert (=> b!90475 m!97171))

(assert (=> b!90475 m!97137))

(declare-fun m!97173 () Bool)

(assert (=> b!90475 m!97173))

(declare-fun m!97175 () Bool)

(assert (=> b!90482 m!97175))

(declare-fun m!97177 () Bool)

(assert (=> b!90482 m!97177))

(declare-fun m!97179 () Bool)

(assert (=> mapNonEmpty!3507 m!97179))

(assert (=> b!90491 m!97137))

(assert (=> b!90491 m!97137))

(declare-fun m!97181 () Bool)

(assert (=> b!90491 m!97181))

(assert (=> b!90491 m!97137))

(declare-fun m!97183 () Bool)

(assert (=> b!90491 m!97183))

(declare-fun m!97185 () Bool)

(assert (=> mapNonEmpty!3508 m!97185))

(declare-fun m!97187 () Bool)

(assert (=> start!11104 m!97187))

(check-sat (not b_lambda!3997) (not b!90491) (not b!90482) (not start!11104) (not b!90490) (not b!90478) (not mapNonEmpty!3507) (not b_next!2295) b_and!5451 b_and!5449 (not b!90484) (not b!90475) tp_is_empty!2563 (not b_next!2293) (not b!90481) (not b!90488) (not mapNonEmpty!3508))
(check-sat b_and!5449 b_and!5451 (not b_next!2293) (not b_next!2295))
