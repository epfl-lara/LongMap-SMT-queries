; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12042 () Bool)

(assert start!12042)

(declare-fun b!101505 () Bool)

(declare-fun b_free!2465 () Bool)

(declare-fun b_next!2465 () Bool)

(assert (=> b!101505 (= b_free!2465 (not b_next!2465))))

(declare-fun tp!9700 () Bool)

(declare-fun b_and!6251 () Bool)

(assert (=> b!101505 (= tp!9700 b_and!6251)))

(declare-fun b!101516 () Bool)

(declare-fun b_free!2467 () Bool)

(declare-fun b_next!2467 () Bool)

(assert (=> b!101516 (= b_free!2467 (not b_next!2467))))

(declare-fun tp!9702 () Bool)

(declare-fun b_and!6253 () Bool)

(assert (=> b!101516 (= tp!9702 b_and!6253)))

(declare-fun mapIsEmpty!3821 () Bool)

(declare-fun mapRes!3822 () Bool)

(assert (=> mapIsEmpty!3821 mapRes!3822))

(declare-fun b!101497 () Bool)

(declare-fun e!66081 () Bool)

(declare-fun e!66090 () Bool)

(assert (=> b!101497 (= e!66081 e!66090)))

(declare-fun res!50854 () Bool)

(assert (=> b!101497 (=> (not res!50854) (not e!66090))))

(declare-datatypes ((V!3179 0))(
  ( (V!3180 (val!1369 Int)) )
))
(declare-datatypes ((tuple2!2366 0))(
  ( (tuple2!2367 (_1!1194 (_ BitVec 64)) (_2!1194 V!3179)) )
))
(declare-datatypes ((List!1592 0))(
  ( (Nil!1589) (Cons!1588 (h!2184 tuple2!2366) (t!5602 List!1592)) )
))
(declare-datatypes ((ListLongMap!1549 0))(
  ( (ListLongMap!1550 (toList!790 List!1592)) )
))
(declare-fun lt!51478 () ListLongMap!1549)

(declare-datatypes ((array!4283 0))(
  ( (array!4284 (arr!2033 (Array (_ BitVec 32) (_ BitVec 64))) (size!2286 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!981 0))(
  ( (ValueCellFull!981 (v!2843 V!3179)) (EmptyCell!981) )
))
(declare-datatypes ((array!4285 0))(
  ( (array!4286 (arr!2034 (Array (_ BitVec 32) ValueCell!981)) (size!2287 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!870 0))(
  ( (LongMapFixedSize!871 (defaultEntry!2536 Int) (mask!6659 (_ BitVec 32)) (extraKeys!2347 (_ BitVec 32)) (zeroValue!2414 V!3179) (minValue!2414 V!3179) (_size!484 (_ BitVec 32)) (_keys!4236 array!4283) (_values!2519 array!4285) (_vacant!484 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!670 0))(
  ( (Cell!671 (v!2844 LongMapFixedSize!870)) )
))
(declare-datatypes ((LongMap!670 0))(
  ( (LongMap!671 (underlying!346 Cell!670)) )
))
(declare-fun thiss!992 () LongMap!670)

(declare-fun lt!51483 () ListLongMap!1549)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!101497 (= res!50854 (and (= lt!51483 lt!51478) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!870)

(declare-fun map!1267 (LongMapFixedSize!870) ListLongMap!1549)

(assert (=> b!101497 (= lt!51478 (map!1267 newMap!16))))

(declare-fun getCurrentListMap!480 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) Int) ListLongMap!1549)

(assert (=> b!101497 (= lt!51483 (getCurrentListMap!480 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun mapNonEmpty!3821 () Bool)

(declare-fun mapRes!3821 () Bool)

(declare-fun tp!9701 () Bool)

(declare-fun e!66077 () Bool)

(assert (=> mapNonEmpty!3821 (= mapRes!3821 (and tp!9701 e!66077))))

(declare-fun mapRest!3822 () (Array (_ BitVec 32) ValueCell!981))

(declare-fun mapKey!3822 () (_ BitVec 32))

(declare-fun mapValue!3821 () ValueCell!981)

(assert (=> mapNonEmpty!3821 (= (arr!2034 (_values!2519 newMap!16)) (store mapRest!3822 mapKey!3822 mapValue!3821))))

(declare-fun b!101498 () Bool)

(declare-fun res!50853 () Bool)

(assert (=> b!101498 (=> (not res!50853) (not e!66081))))

(assert (=> b!101498 (= res!50853 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun b!101499 () Bool)

(declare-fun tp_is_empty!2649 () Bool)

(assert (=> b!101499 (= e!66077 tp_is_empty!2649)))

(declare-fun b!101500 () Bool)

(declare-datatypes ((Unit!3088 0))(
  ( (Unit!3089) )
))
(declare-fun e!66083 () Unit!3088)

(declare-fun Unit!3090 () Unit!3088)

(assert (=> b!101500 (= e!66083 Unit!3090)))

(declare-fun lt!51480 () Unit!3088)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!94 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) (_ BitVec 32) Int) Unit!3088)

(assert (=> b!101500 (= lt!51480 (lemmaListMapContainsThenArrayContainsFrom!94 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!101500 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51479 () Unit!3088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4283 (_ BitVec 32) (_ BitVec 32)) Unit!3088)

(assert (=> b!101500 (= lt!51479 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1593 0))(
  ( (Nil!1590) (Cons!1589 (h!2185 (_ BitVec 64)) (t!5603 List!1593)) )
))
(declare-fun arrayNoDuplicates!0 (array!4283 (_ BitVec 32) List!1593) Bool)

(assert (=> b!101500 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) from!355 Nil!1590)))

(declare-fun lt!51481 () Unit!3088)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4283 (_ BitVec 32) (_ BitVec 64) List!1593) Unit!3088)

(assert (=> b!101500 (= lt!51481 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590)))))

(assert (=> b!101500 false))

(declare-fun mapIsEmpty!3822 () Bool)

(assert (=> mapIsEmpty!3822 mapRes!3821))

(declare-fun b!101502 () Bool)

(declare-fun e!66079 () Bool)

(assert (=> b!101502 (= e!66079 tp_is_empty!2649)))

(declare-fun b!101503 () Bool)

(declare-fun res!50855 () Bool)

(assert (=> b!101503 (=> (not res!50855) (not e!66081))))

(assert (=> b!101503 (= res!50855 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6659 newMap!16)) (_size!484 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!101504 () Bool)

(declare-fun res!50847 () Bool)

(declare-fun e!66080 () Bool)

(assert (=> b!101504 (=> (not res!50847) (not e!66080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!101504 (= res!50847 (validMask!0 (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun e!66089 () Bool)

(declare-fun e!66078 () Bool)

(declare-fun array_inv!1271 (array!4283) Bool)

(declare-fun array_inv!1272 (array!4285) Bool)

(assert (=> b!101505 (= e!66078 (and tp!9700 tp_is_empty!2649 (array_inv!1271 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (array_inv!1272 (_values!2519 (v!2844 (underlying!346 thiss!992)))) e!66089))))

(declare-fun b!101506 () Bool)

(declare-fun e!66091 () Bool)

(assert (=> b!101506 (= e!66091 tp_is_empty!2649)))

(declare-fun b!101507 () Bool)

(assert (=> b!101507 (= e!66090 e!66080)))

(declare-fun res!50851 () Bool)

(assert (=> b!101507 (=> (not res!50851) (not e!66080))))

(declare-datatypes ((tuple2!2368 0))(
  ( (tuple2!2369 (_1!1195 Bool) (_2!1195 LongMapFixedSize!870)) )
))
(declare-fun lt!51482 () tuple2!2368)

(assert (=> b!101507 (= res!50851 (and (_1!1195 lt!51482) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!51484 () Unit!3088)

(assert (=> b!101507 (= lt!51484 e!66083)))

(declare-fun c!17458 () Bool)

(declare-fun contains!813 (ListLongMap!1549 (_ BitVec 64)) Bool)

(assert (=> b!101507 (= c!17458 (contains!813 lt!51478 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun update!147 (LongMapFixedSize!870 (_ BitVec 64) V!3179) tuple2!2368)

(declare-fun get!1302 (ValueCell!981 V!3179) V!3179)

(declare-fun dynLambda!375 (Int (_ BitVec 64)) V!3179)

(assert (=> b!101507 (= lt!51482 (update!147 newMap!16 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101508 () Bool)

(declare-fun res!50848 () Bool)

(assert (=> b!101508 (=> (not res!50848) (not e!66080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4283 (_ BitVec 32)) Bool)

(assert (=> b!101508 (= res!50848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!101509 () Bool)

(declare-fun e!66085 () Bool)

(assert (=> b!101509 (= e!66085 tp_is_empty!2649)))

(declare-fun b!101510 () Bool)

(declare-fun e!66086 () Bool)

(declare-fun e!66088 () Bool)

(assert (=> b!101510 (= e!66086 e!66088)))

(declare-fun b!101511 () Bool)

(assert (=> b!101511 (= e!66080 (not (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 Nil!1590)))))

(declare-fun mapNonEmpty!3822 () Bool)

(declare-fun tp!9699 () Bool)

(assert (=> mapNonEmpty!3822 (= mapRes!3822 (and tp!9699 e!66079))))

(declare-fun mapRest!3821 () (Array (_ BitVec 32) ValueCell!981))

(declare-fun mapValue!3822 () ValueCell!981)

(declare-fun mapKey!3821 () (_ BitVec 32))

(assert (=> mapNonEmpty!3822 (= (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (store mapRest!3821 mapKey!3821 mapValue!3822))))

(declare-fun res!50850 () Bool)

(assert (=> start!12042 (=> (not res!50850) (not e!66081))))

(declare-fun valid!397 (LongMap!670) Bool)

(assert (=> start!12042 (= res!50850 (valid!397 thiss!992))))

(assert (=> start!12042 e!66081))

(assert (=> start!12042 e!66086))

(assert (=> start!12042 true))

(declare-fun e!66087 () Bool)

(assert (=> start!12042 e!66087))

(declare-fun b!101501 () Bool)

(declare-fun res!50852 () Bool)

(assert (=> b!101501 (=> (not res!50852) (not e!66080))))

(assert (=> b!101501 (= res!50852 (and (= (size!2287 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6659 (v!2844 (underlying!346 thiss!992))))) (= (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (size!2287 (_values!2519 (v!2844 (underlying!346 thiss!992))))) (bvsge (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!101512 () Bool)

(declare-fun Unit!3091 () Unit!3088)

(assert (=> b!101512 (= e!66083 Unit!3091)))

(declare-fun b!101513 () Bool)

(assert (=> b!101513 (= e!66089 (and e!66085 mapRes!3822))))

(declare-fun condMapEmpty!3822 () Bool)

(declare-fun mapDefault!3822 () ValueCell!981)

(assert (=> b!101513 (= condMapEmpty!3822 (= (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!981)) mapDefault!3822)))))

(declare-fun b!101514 () Bool)

(declare-fun res!50849 () Bool)

(assert (=> b!101514 (=> (not res!50849) (not e!66081))))

(declare-fun valid!398 (LongMapFixedSize!870) Bool)

(assert (=> b!101514 (= res!50849 (valid!398 newMap!16))))

(declare-fun b!101515 () Bool)

(assert (=> b!101515 (= e!66088 e!66078)))

(declare-fun e!66082 () Bool)

(assert (=> b!101516 (= e!66087 (and tp!9702 tp_is_empty!2649 (array_inv!1271 (_keys!4236 newMap!16)) (array_inv!1272 (_values!2519 newMap!16)) e!66082))))

(declare-fun b!101517 () Bool)

(assert (=> b!101517 (= e!66082 (and e!66091 mapRes!3821))))

(declare-fun condMapEmpty!3821 () Bool)

(declare-fun mapDefault!3821 () ValueCell!981)

(assert (=> b!101517 (= condMapEmpty!3821 (= (arr!2034 (_values!2519 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!981)) mapDefault!3821)))))

(assert (= (and start!12042 res!50850) b!101498))

(assert (= (and b!101498 res!50853) b!101514))

(assert (= (and b!101514 res!50849) b!101503))

(assert (= (and b!101503 res!50855) b!101497))

(assert (= (and b!101497 res!50854) b!101507))

(assert (= (and b!101507 c!17458) b!101500))

(assert (= (and b!101507 (not c!17458)) b!101512))

(assert (= (and b!101507 res!50851) b!101504))

(assert (= (and b!101504 res!50847) b!101501))

(assert (= (and b!101501 res!50852) b!101508))

(assert (= (and b!101508 res!50848) b!101511))

(assert (= (and b!101513 condMapEmpty!3822) mapIsEmpty!3821))

(assert (= (and b!101513 (not condMapEmpty!3822)) mapNonEmpty!3822))

(get-info :version)

(assert (= (and mapNonEmpty!3822 ((_ is ValueCellFull!981) mapValue!3822)) b!101502))

(assert (= (and b!101513 ((_ is ValueCellFull!981) mapDefault!3822)) b!101509))

(assert (= b!101505 b!101513))

(assert (= b!101515 b!101505))

(assert (= b!101510 b!101515))

(assert (= start!12042 b!101510))

(assert (= (and b!101517 condMapEmpty!3821) mapIsEmpty!3822))

(assert (= (and b!101517 (not condMapEmpty!3821)) mapNonEmpty!3821))

(assert (= (and mapNonEmpty!3821 ((_ is ValueCellFull!981) mapValue!3821)) b!101499))

(assert (= (and b!101517 ((_ is ValueCellFull!981) mapDefault!3821)) b!101506))

(assert (= b!101516 b!101517))

(assert (= start!12042 b!101516))

(declare-fun b_lambda!4549 () Bool)

(assert (=> (not b_lambda!4549) (not b!101507)))

(declare-fun t!5599 () Bool)

(declare-fun tb!1977 () Bool)

(assert (=> (and b!101505 (= (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))) t!5599) tb!1977))

(declare-fun result!3341 () Bool)

(assert (=> tb!1977 (= result!3341 tp_is_empty!2649)))

(assert (=> b!101507 t!5599))

(declare-fun b_and!6255 () Bool)

(assert (= b_and!6251 (and (=> t!5599 result!3341) b_and!6255)))

(declare-fun tb!1979 () Bool)

(declare-fun t!5601 () Bool)

(assert (=> (and b!101516 (= (defaultEntry!2536 newMap!16) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))) t!5601) tb!1979))

(declare-fun result!3345 () Bool)

(assert (= result!3345 result!3341))

(assert (=> b!101507 t!5601))

(declare-fun b_and!6257 () Bool)

(assert (= b_and!6253 (and (=> t!5601 result!3345) b_and!6257)))

(declare-fun m!112513 () Bool)

(assert (=> b!101505 m!112513))

(declare-fun m!112515 () Bool)

(assert (=> b!101505 m!112515))

(declare-fun m!112517 () Bool)

(assert (=> b!101508 m!112517))

(declare-fun m!112519 () Bool)

(assert (=> mapNonEmpty!3822 m!112519))

(declare-fun m!112521 () Bool)

(assert (=> b!101507 m!112521))

(declare-fun m!112523 () Bool)

(assert (=> b!101507 m!112523))

(declare-fun m!112525 () Bool)

(assert (=> b!101507 m!112525))

(declare-fun m!112527 () Bool)

(assert (=> b!101507 m!112527))

(assert (=> b!101507 m!112527))

(declare-fun m!112529 () Bool)

(assert (=> b!101507 m!112529))

(assert (=> b!101507 m!112523))

(assert (=> b!101507 m!112527))

(assert (=> b!101507 m!112525))

(declare-fun m!112531 () Bool)

(assert (=> b!101507 m!112531))

(assert (=> b!101507 m!112521))

(declare-fun m!112533 () Bool)

(assert (=> b!101516 m!112533))

(declare-fun m!112535 () Bool)

(assert (=> b!101516 m!112535))

(declare-fun m!112537 () Bool)

(assert (=> b!101500 m!112537))

(declare-fun m!112539 () Bool)

(assert (=> b!101500 m!112539))

(assert (=> b!101500 m!112527))

(declare-fun m!112541 () Bool)

(assert (=> b!101500 m!112541))

(assert (=> b!101500 m!112527))

(assert (=> b!101500 m!112527))

(declare-fun m!112543 () Bool)

(assert (=> b!101500 m!112543))

(assert (=> b!101500 m!112527))

(declare-fun m!112545 () Bool)

(assert (=> b!101500 m!112545))

(declare-fun m!112547 () Bool)

(assert (=> mapNonEmpty!3821 m!112547))

(assert (=> b!101497 m!112527))

(declare-fun m!112549 () Bool)

(assert (=> b!101497 m!112549))

(declare-fun m!112551 () Bool)

(assert (=> b!101497 m!112551))

(declare-fun m!112553 () Bool)

(assert (=> b!101514 m!112553))

(declare-fun m!112555 () Bool)

(assert (=> start!12042 m!112555))

(declare-fun m!112557 () Bool)

(assert (=> b!101504 m!112557))

(declare-fun m!112559 () Bool)

(assert (=> b!101511 m!112559))

(check-sat (not start!12042) (not b!101514) (not mapNonEmpty!3822) (not b!101507) tp_is_empty!2649 (not b!101500) (not b!101504) (not b!101516) (not b_next!2467) (not b!101505) (not b_lambda!4549) b_and!6255 (not b!101511) b_and!6257 (not mapNonEmpty!3821) (not b!101497) (not b!101508) (not b_next!2465))
(check-sat b_and!6255 b_and!6257 (not b_next!2465) (not b_next!2467))
(get-model)

(declare-fun b_lambda!4553 () Bool)

(assert (= b_lambda!4549 (or (and b!101505 b_free!2465) (and b!101516 b_free!2467 (= (defaultEntry!2536 newMap!16) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))))) b_lambda!4553)))

(check-sat (not start!12042) (not b!101514) (not mapNonEmpty!3822) (not b!101507) (not b_lambda!4553) tp_is_empty!2649 (not b!101500) (not b!101504) (not b!101516) (not b_next!2467) (not b!101505) b_and!6255 (not b!101511) b_and!6257 (not mapNonEmpty!3821) (not b!101497) (not b!101508) (not b_next!2465))
(check-sat b_and!6255 b_and!6257 (not b_next!2465) (not b_next!2467))
(get-model)

(declare-fun d!27529 () Bool)

(assert (=> d!27529 (= (validMask!0 (mask!6659 (v!2844 (underlying!346 thiss!992)))) (and (or (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000001111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000011111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000001111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000011111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000001111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000011111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000001111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000011111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000000111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000001111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000011111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000000111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000001111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000011111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000000111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000001111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000011111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000000111111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000001111111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000011111111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00000111111111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00001111111111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00011111111111111111111111111111) (= (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6659 (v!2844 (underlying!346 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!101504 d!27529))

(declare-fun d!27531 () Bool)

(assert (=> d!27531 (not (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51508 () Unit!3088)

(declare-fun choose!68 (array!4283 (_ BitVec 32) (_ BitVec 64) List!1593) Unit!3088)

(assert (=> d!27531 (= lt!51508 (choose!68 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590)))))

(assert (=> d!27531 (bvslt (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27531 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590)) lt!51508)))

(declare-fun bs!4205 () Bool)

(assert (= bs!4205 d!27531))

(assert (=> bs!4205 m!112527))

(assert (=> bs!4205 m!112543))

(assert (=> bs!4205 m!112527))

(declare-fun m!112609 () Bool)

(assert (=> bs!4205 m!112609))

(assert (=> b!101500 d!27531))

(declare-fun d!27533 () Bool)

(assert (=> d!27533 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) from!355 Nil!1590)))

(declare-fun lt!51511 () Unit!3088)

(declare-fun choose!39 (array!4283 (_ BitVec 32) (_ BitVec 32)) Unit!3088)

(assert (=> d!27533 (= lt!51511 (choose!39 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27533 (bvslt (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27533 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 from!355) lt!51511)))

(declare-fun bs!4206 () Bool)

(assert (= bs!4206 d!27533))

(assert (=> bs!4206 m!112539))

(declare-fun m!112611 () Bool)

(assert (=> bs!4206 m!112611))

(assert (=> b!101500 d!27533))

(declare-fun d!27535 () Bool)

(declare-fun res!50887 () Bool)

(declare-fun e!66145 () Bool)

(assert (=> d!27535 (=> res!50887 e!66145)))

(assert (=> d!27535 (= res!50887 (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27535 (= (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!66145)))

(declare-fun b!101589 () Bool)

(declare-fun e!66146 () Bool)

(assert (=> b!101589 (= e!66145 e!66146)))

(declare-fun res!50888 () Bool)

(assert (=> b!101589 (=> (not res!50888) (not e!66146))))

(assert (=> b!101589 (= res!50888 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!101590 () Bool)

(assert (=> b!101590 (= e!66146 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27535 (not res!50887)) b!101589))

(assert (= (and b!101589 res!50888) b!101590))

(declare-fun m!112613 () Bool)

(assert (=> d!27535 m!112613))

(assert (=> b!101590 m!112527))

(declare-fun m!112615 () Bool)

(assert (=> b!101590 m!112615))

(assert (=> b!101500 d!27535))

(declare-fun d!27537 () Bool)

(declare-fun e!66149 () Bool)

(assert (=> d!27537 e!66149))

(declare-fun c!17464 () Bool)

(assert (=> d!27537 (= c!17464 (and (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!51514 () Unit!3088)

(declare-fun choose!625 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) (_ BitVec 32) Int) Unit!3088)

(assert (=> d!27537 (= lt!51514 (choose!625 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(assert (=> d!27537 (validMask!0 (mask!6659 (v!2844 (underlying!346 thiss!992))))))

(assert (=> d!27537 (= (lemmaListMapContainsThenArrayContainsFrom!94 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))) lt!51514)))

(declare-fun b!101595 () Bool)

(assert (=> b!101595 (= e!66149 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101596 () Bool)

(assert (=> b!101596 (= e!66149 (ite (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27537 c!17464) b!101595))

(assert (= (and d!27537 (not c!17464)) b!101596))

(assert (=> d!27537 m!112527))

(declare-fun m!112617 () Bool)

(assert (=> d!27537 m!112617))

(assert (=> d!27537 m!112557))

(assert (=> b!101595 m!112527))

(assert (=> b!101595 m!112543))

(assert (=> b!101500 d!27537))

(declare-fun d!27539 () Bool)

(declare-fun res!50895 () Bool)

(declare-fun e!66161 () Bool)

(assert (=> d!27539 (=> res!50895 e!66161)))

(assert (=> d!27539 (= res!50895 (bvsge from!355 (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27539 (= (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) from!355 Nil!1590) e!66161)))

(declare-fun b!101607 () Bool)

(declare-fun e!66159 () Bool)

(declare-fun e!66158 () Bool)

(assert (=> b!101607 (= e!66159 e!66158)))

(declare-fun c!17467 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!101607 (= c!17467 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun bm!10511 () Bool)

(declare-fun call!10514 () Bool)

(assert (=> bm!10511 (= call!10514 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17467 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590) Nil!1590)))))

(declare-fun b!101608 () Bool)

(assert (=> b!101608 (= e!66161 e!66159)))

(declare-fun res!50897 () Bool)

(assert (=> b!101608 (=> (not res!50897) (not e!66159))))

(declare-fun e!66160 () Bool)

(assert (=> b!101608 (= res!50897 (not e!66160))))

(declare-fun res!50896 () Bool)

(assert (=> b!101608 (=> (not res!50896) (not e!66160))))

(assert (=> b!101608 (= res!50896 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!101609 () Bool)

(declare-fun contains!814 (List!1593 (_ BitVec 64)) Bool)

(assert (=> b!101609 (= e!66160 (contains!814 Nil!1590 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!101610 () Bool)

(assert (=> b!101610 (= e!66158 call!10514)))

(declare-fun b!101611 () Bool)

(assert (=> b!101611 (= e!66158 call!10514)))

(assert (= (and d!27539 (not res!50895)) b!101608))

(assert (= (and b!101608 res!50896) b!101609))

(assert (= (and b!101608 res!50897) b!101607))

(assert (= (and b!101607 c!17467) b!101611))

(assert (= (and b!101607 (not c!17467)) b!101610))

(assert (= (or b!101611 b!101610) bm!10511))

(assert (=> b!101607 m!112527))

(assert (=> b!101607 m!112527))

(declare-fun m!112619 () Bool)

(assert (=> b!101607 m!112619))

(assert (=> bm!10511 m!112527))

(declare-fun m!112621 () Bool)

(assert (=> bm!10511 m!112621))

(assert (=> b!101608 m!112527))

(assert (=> b!101608 m!112527))

(assert (=> b!101608 m!112619))

(assert (=> b!101609 m!112527))

(assert (=> b!101609 m!112527))

(declare-fun m!112623 () Bool)

(assert (=> b!101609 m!112623))

(assert (=> b!101500 d!27539))

(declare-fun d!27541 () Bool)

(declare-fun res!50904 () Bool)

(declare-fun e!66164 () Bool)

(assert (=> d!27541 (=> (not res!50904) (not e!66164))))

(declare-fun simpleValid!71 (LongMapFixedSize!870) Bool)

(assert (=> d!27541 (= res!50904 (simpleValid!71 newMap!16))))

(assert (=> d!27541 (= (valid!398 newMap!16) e!66164)))

(declare-fun b!101618 () Bool)

(declare-fun res!50905 () Bool)

(assert (=> b!101618 (=> (not res!50905) (not e!66164))))

(declare-fun arrayCountValidKeys!0 (array!4283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!101618 (= res!50905 (= (arrayCountValidKeys!0 (_keys!4236 newMap!16) #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (_size!484 newMap!16)))))

(declare-fun b!101619 () Bool)

(declare-fun res!50906 () Bool)

(assert (=> b!101619 (=> (not res!50906) (not e!66164))))

(assert (=> b!101619 (= res!50906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun b!101620 () Bool)

(assert (=> b!101620 (= e!66164 (arrayNoDuplicates!0 (_keys!4236 newMap!16) #b00000000000000000000000000000000 Nil!1590))))

(assert (= (and d!27541 res!50904) b!101618))

(assert (= (and b!101618 res!50905) b!101619))

(assert (= (and b!101619 res!50906) b!101620))

(declare-fun m!112625 () Bool)

(assert (=> d!27541 m!112625))

(declare-fun m!112627 () Bool)

(assert (=> b!101618 m!112627))

(declare-fun m!112629 () Bool)

(assert (=> b!101619 m!112629))

(declare-fun m!112631 () Bool)

(assert (=> b!101620 m!112631))

(assert (=> b!101514 d!27541))

(declare-fun d!27543 () Bool)

(assert (=> d!27543 (= (array_inv!1271 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvsge (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!101505 d!27543))

(declare-fun d!27545 () Bool)

(assert (=> d!27545 (= (array_inv!1272 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvsge (size!2287 (_values!2519 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!101505 d!27545))

(declare-fun d!27547 () Bool)

(assert (=> d!27547 (= (map!1267 newMap!16) (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun bs!4207 () Bool)

(assert (= bs!4207 d!27547))

(declare-fun m!112633 () Bool)

(assert (=> bs!4207 m!112633))

(assert (=> b!101497 d!27547))

(declare-fun b!101663 () Bool)

(declare-fun e!66203 () ListLongMap!1549)

(declare-fun call!10533 () ListLongMap!1549)

(assert (=> b!101663 (= e!66203 call!10533)))

(declare-fun b!101664 () Bool)

(declare-fun e!66200 () Bool)

(declare-fun e!66191 () Bool)

(assert (=> b!101664 (= e!66200 e!66191)))

(declare-fun res!50929 () Bool)

(declare-fun call!10535 () Bool)

(assert (=> b!101664 (= res!50929 call!10535)))

(assert (=> b!101664 (=> (not res!50929) (not e!66191))))

(declare-fun b!101665 () Bool)

(declare-fun res!50930 () Bool)

(declare-fun e!66194 () Bool)

(assert (=> b!101665 (=> (not res!50930) (not e!66194))))

(declare-fun e!66192 () Bool)

(assert (=> b!101665 (= res!50930 e!66192)))

(declare-fun c!17481 () Bool)

(assert (=> b!101665 (= c!17481 (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101666 () Bool)

(declare-fun e!66199 () ListLongMap!1549)

(declare-fun e!66193 () ListLongMap!1549)

(assert (=> b!101666 (= e!66199 e!66193)))

(declare-fun c!17483 () Bool)

(assert (=> b!101666 (= c!17483 (and (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101667 () Bool)

(declare-fun lt!51566 () ListLongMap!1549)

(declare-fun apply!95 (ListLongMap!1549 (_ BitVec 64)) V!3179)

(assert (=> b!101667 (= e!66191 (= (apply!95 lt!51566 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun call!10530 () ListLongMap!1549)

(declare-fun call!10534 () ListLongMap!1549)

(declare-fun c!17480 () Bool)

(declare-fun bm!10526 () Bool)

(declare-fun call!10531 () ListLongMap!1549)

(declare-fun call!10532 () ListLongMap!1549)

(declare-fun +!138 (ListLongMap!1549 tuple2!2366) ListLongMap!1549)

(assert (=> bm!10526 (= call!10531 (+!138 (ite c!17480 call!10530 (ite c!17483 call!10534 call!10532)) (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun d!27549 () Bool)

(assert (=> d!27549 e!66194))

(declare-fun res!50925 () Bool)

(assert (=> d!27549 (=> (not res!50925) (not e!66194))))

(assert (=> d!27549 (= res!50925 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun lt!51560 () ListLongMap!1549)

(assert (=> d!27549 (= lt!51566 lt!51560)))

(declare-fun lt!51565 () Unit!3088)

(declare-fun e!66195 () Unit!3088)

(assert (=> d!27549 (= lt!51565 e!66195)))

(declare-fun c!17485 () Bool)

(declare-fun e!66197 () Bool)

(assert (=> d!27549 (= c!17485 e!66197)))

(declare-fun res!50926 () Bool)

(assert (=> d!27549 (=> (not res!50926) (not e!66197))))

(assert (=> d!27549 (= res!50926 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27549 (= lt!51560 e!66199)))

(assert (=> d!27549 (= c!17480 (and (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27549 (validMask!0 (mask!6659 (v!2844 (underlying!346 thiss!992))))))

(assert (=> d!27549 (= (getCurrentListMap!480 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))) lt!51566)))

(declare-fun bm!10527 () Bool)

(declare-fun call!10529 () Bool)

(assert (=> bm!10527 (= call!10529 (contains!813 lt!51566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101668 () Bool)

(assert (=> b!101668 (= e!66192 (not call!10529))))

(declare-fun b!101669 () Bool)

(assert (=> b!101669 (= e!66200 (not call!10535))))

(declare-fun bm!10528 () Bool)

(assert (=> bm!10528 (= call!10533 call!10531)))

(declare-fun bm!10529 () Bool)

(assert (=> bm!10529 (= call!10535 (contains!813 lt!51566 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101670 () Bool)

(declare-fun Unit!3096 () Unit!3088)

(assert (=> b!101670 (= e!66195 Unit!3096)))

(declare-fun b!101671 () Bool)

(declare-fun e!66201 () Bool)

(assert (=> b!101671 (= e!66201 (= (apply!95 lt!51566 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101671 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2287 (_values!2519 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> b!101671 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun bm!10530 () Bool)

(assert (=> bm!10530 (= call!10532 call!10534)))

(declare-fun b!101672 () Bool)

(declare-fun e!66202 () Bool)

(assert (=> b!101672 (= e!66202 e!66201)))

(declare-fun res!50931 () Bool)

(assert (=> b!101672 (=> (not res!50931) (not e!66201))))

(assert (=> b!101672 (= res!50931 (contains!813 lt!51566 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101672 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!101673 () Bool)

(assert (=> b!101673 (= e!66197 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101674 () Bool)

(assert (=> b!101674 (= e!66199 (+!138 call!10531 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!101675 () Bool)

(declare-fun e!66196 () Bool)

(assert (=> b!101675 (= e!66192 e!66196)))

(declare-fun res!50932 () Bool)

(assert (=> b!101675 (= res!50932 call!10529)))

(assert (=> b!101675 (=> (not res!50932) (not e!66196))))

(declare-fun b!101676 () Bool)

(declare-fun res!50927 () Bool)

(assert (=> b!101676 (=> (not res!50927) (not e!66194))))

(assert (=> b!101676 (= res!50927 e!66202)))

(declare-fun res!50933 () Bool)

(assert (=> b!101676 (=> res!50933 e!66202)))

(declare-fun e!66198 () Bool)

(assert (=> b!101676 (= res!50933 (not e!66198))))

(declare-fun res!50928 () Bool)

(assert (=> b!101676 (=> (not res!50928) (not e!66198))))

(assert (=> b!101676 (= res!50928 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!101677 () Bool)

(assert (=> b!101677 (= e!66193 call!10533)))

(declare-fun b!101678 () Bool)

(assert (=> b!101678 (= e!66194 e!66200)))

(declare-fun c!17484 () Bool)

(assert (=> b!101678 (= c!17484 (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101679 () Bool)

(declare-fun lt!51561 () Unit!3088)

(assert (=> b!101679 (= e!66195 lt!51561)))

(declare-fun lt!51562 () ListLongMap!1549)

(declare-fun getCurrentListMapNoExtraKeys!103 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) Int) ListLongMap!1549)

(assert (=> b!101679 (= lt!51562 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun lt!51576 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51571 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51571 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51563 () Unit!3088)

(declare-fun addStillContains!71 (ListLongMap!1549 (_ BitVec 64) V!3179 (_ BitVec 64)) Unit!3088)

(assert (=> b!101679 (= lt!51563 (addStillContains!71 lt!51562 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51571))))

(assert (=> b!101679 (contains!813 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51571)))

(declare-fun lt!51564 () Unit!3088)

(assert (=> b!101679 (= lt!51564 lt!51563)))

(declare-fun lt!51568 () ListLongMap!1549)

(assert (=> b!101679 (= lt!51568 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun lt!51578 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51577 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51577 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51570 () Unit!3088)

(declare-fun addApplyDifferent!71 (ListLongMap!1549 (_ BitVec 64) V!3179 (_ BitVec 64)) Unit!3088)

(assert (=> b!101679 (= lt!51570 (addApplyDifferent!71 lt!51568 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51577))))

(assert (=> b!101679 (= (apply!95 (+!138 lt!51568 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51577) (apply!95 lt!51568 lt!51577))))

(declare-fun lt!51580 () Unit!3088)

(assert (=> b!101679 (= lt!51580 lt!51570)))

(declare-fun lt!51575 () ListLongMap!1549)

(assert (=> b!101679 (= lt!51575 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun lt!51559 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51559 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51574 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51574 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51579 () Unit!3088)

(assert (=> b!101679 (= lt!51579 (addApplyDifferent!71 lt!51575 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51574))))

(assert (=> b!101679 (= (apply!95 (+!138 lt!51575 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51574) (apply!95 lt!51575 lt!51574))))

(declare-fun lt!51569 () Unit!3088)

(assert (=> b!101679 (= lt!51569 lt!51579)))

(declare-fun lt!51567 () ListLongMap!1549)

(assert (=> b!101679 (= lt!51567 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun lt!51573 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51572 () (_ BitVec 64))

(assert (=> b!101679 (= lt!51572 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!101679 (= lt!51561 (addApplyDifferent!71 lt!51567 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51572))))

(assert (=> b!101679 (= (apply!95 (+!138 lt!51567 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51572) (apply!95 lt!51567 lt!51572))))

(declare-fun bm!10531 () Bool)

(assert (=> bm!10531 (= call!10530 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun bm!10532 () Bool)

(assert (=> bm!10532 (= call!10534 call!10530)))

(declare-fun b!101680 () Bool)

(assert (=> b!101680 (= e!66203 call!10532)))

(declare-fun b!101681 () Bool)

(assert (=> b!101681 (= e!66196 (= (apply!95 lt!51566 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!101682 () Bool)

(assert (=> b!101682 (= e!66198 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101683 () Bool)

(declare-fun c!17482 () Bool)

(assert (=> b!101683 (= c!17482 (and (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101683 (= e!66193 e!66203)))

(assert (= (and d!27549 c!17480) b!101674))

(assert (= (and d!27549 (not c!17480)) b!101666))

(assert (= (and b!101666 c!17483) b!101677))

(assert (= (and b!101666 (not c!17483)) b!101683))

(assert (= (and b!101683 c!17482) b!101663))

(assert (= (and b!101683 (not c!17482)) b!101680))

(assert (= (or b!101663 b!101680) bm!10530))

(assert (= (or b!101677 bm!10530) bm!10532))

(assert (= (or b!101677 b!101663) bm!10528))

(assert (= (or b!101674 bm!10532) bm!10531))

(assert (= (or b!101674 bm!10528) bm!10526))

(assert (= (and d!27549 res!50926) b!101673))

(assert (= (and d!27549 c!17485) b!101679))

(assert (= (and d!27549 (not c!17485)) b!101670))

(assert (= (and d!27549 res!50925) b!101676))

(assert (= (and b!101676 res!50928) b!101682))

(assert (= (and b!101676 (not res!50933)) b!101672))

(assert (= (and b!101672 res!50931) b!101671))

(assert (= (and b!101676 res!50927) b!101665))

(assert (= (and b!101665 c!17481) b!101675))

(assert (= (and b!101665 (not c!17481)) b!101668))

(assert (= (and b!101675 res!50932) b!101681))

(assert (= (or b!101675 b!101668) bm!10527))

(assert (= (and b!101665 res!50930) b!101678))

(assert (= (and b!101678 c!17484) b!101664))

(assert (= (and b!101678 (not c!17484)) b!101669))

(assert (= (and b!101664 res!50929) b!101667))

(assert (= (or b!101664 b!101669) bm!10529))

(declare-fun b_lambda!4555 () Bool)

(assert (=> (not b_lambda!4555) (not b!101671)))

(assert (=> b!101671 t!5599))

(declare-fun b_and!6267 () Bool)

(assert (= b_and!6255 (and (=> t!5599 result!3341) b_and!6267)))

(assert (=> b!101671 t!5601))

(declare-fun b_and!6269 () Bool)

(assert (= b_and!6257 (and (=> t!5601 result!3345) b_and!6269)))

(assert (=> b!101672 m!112613))

(assert (=> b!101672 m!112613))

(declare-fun m!112635 () Bool)

(assert (=> b!101672 m!112635))

(assert (=> b!101682 m!112613))

(assert (=> b!101682 m!112613))

(declare-fun m!112637 () Bool)

(assert (=> b!101682 m!112637))

(declare-fun m!112639 () Bool)

(assert (=> bm!10531 m!112639))

(declare-fun m!112641 () Bool)

(assert (=> bm!10527 m!112641))

(declare-fun m!112643 () Bool)

(assert (=> bm!10529 m!112643))

(assert (=> d!27549 m!112557))

(declare-fun m!112645 () Bool)

(assert (=> b!101667 m!112645))

(declare-fun m!112647 () Bool)

(assert (=> b!101674 m!112647))

(declare-fun m!112649 () Bool)

(assert (=> b!101681 m!112649))

(assert (=> b!101673 m!112613))

(assert (=> b!101673 m!112613))

(assert (=> b!101673 m!112637))

(declare-fun m!112651 () Bool)

(assert (=> b!101679 m!112651))

(assert (=> b!101679 m!112613))

(assert (=> b!101679 m!112651))

(declare-fun m!112653 () Bool)

(assert (=> b!101679 m!112653))

(declare-fun m!112655 () Bool)

(assert (=> b!101679 m!112655))

(declare-fun m!112657 () Bool)

(assert (=> b!101679 m!112657))

(declare-fun m!112659 () Bool)

(assert (=> b!101679 m!112659))

(declare-fun m!112661 () Bool)

(assert (=> b!101679 m!112661))

(declare-fun m!112663 () Bool)

(assert (=> b!101679 m!112663))

(declare-fun m!112665 () Bool)

(assert (=> b!101679 m!112665))

(declare-fun m!112667 () Bool)

(assert (=> b!101679 m!112667))

(declare-fun m!112669 () Bool)

(assert (=> b!101679 m!112669))

(declare-fun m!112671 () Bool)

(assert (=> b!101679 m!112671))

(assert (=> b!101679 m!112655))

(assert (=> b!101679 m!112671))

(declare-fun m!112673 () Bool)

(assert (=> b!101679 m!112673))

(declare-fun m!112675 () Bool)

(assert (=> b!101679 m!112675))

(assert (=> b!101679 m!112639))

(assert (=> b!101679 m!112667))

(declare-fun m!112677 () Bool)

(assert (=> b!101679 m!112677))

(declare-fun m!112679 () Bool)

(assert (=> b!101679 m!112679))

(assert (=> b!101671 m!112613))

(declare-fun m!112681 () Bool)

(assert (=> b!101671 m!112681))

(declare-fun m!112683 () Bool)

(assert (=> b!101671 m!112683))

(assert (=> b!101671 m!112523))

(declare-fun m!112685 () Bool)

(assert (=> b!101671 m!112685))

(assert (=> b!101671 m!112683))

(assert (=> b!101671 m!112613))

(assert (=> b!101671 m!112523))

(declare-fun m!112687 () Bool)

(assert (=> bm!10526 m!112687))

(assert (=> b!101497 d!27549))

(declare-fun d!27551 () Bool)

(declare-fun res!50934 () Bool)

(declare-fun e!66207 () Bool)

(assert (=> d!27551 (=> res!50934 e!66207)))

(assert (=> d!27551 (= res!50934 (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27551 (= (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 Nil!1590) e!66207)))

(declare-fun b!101684 () Bool)

(declare-fun e!66205 () Bool)

(declare-fun e!66204 () Bool)

(assert (=> b!101684 (= e!66205 e!66204)))

(declare-fun c!17486 () Bool)

(assert (=> b!101684 (= c!17486 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!10533 () Bool)

(declare-fun call!10536 () Bool)

(assert (=> bm!10533 (= call!10536 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17486 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) Nil!1590) Nil!1590)))))

(declare-fun b!101685 () Bool)

(assert (=> b!101685 (= e!66207 e!66205)))

(declare-fun res!50936 () Bool)

(assert (=> b!101685 (=> (not res!50936) (not e!66205))))

(declare-fun e!66206 () Bool)

(assert (=> b!101685 (= res!50936 (not e!66206))))

(declare-fun res!50935 () Bool)

(assert (=> b!101685 (=> (not res!50935) (not e!66206))))

(assert (=> b!101685 (= res!50935 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101686 () Bool)

(assert (=> b!101686 (= e!66206 (contains!814 Nil!1590 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101687 () Bool)

(assert (=> b!101687 (= e!66204 call!10536)))

(declare-fun b!101688 () Bool)

(assert (=> b!101688 (= e!66204 call!10536)))

(assert (= (and d!27551 (not res!50934)) b!101685))

(assert (= (and b!101685 res!50935) b!101686))

(assert (= (and b!101685 res!50936) b!101684))

(assert (= (and b!101684 c!17486) b!101688))

(assert (= (and b!101684 (not c!17486)) b!101687))

(assert (= (or b!101688 b!101687) bm!10533))

(declare-fun m!112689 () Bool)

(assert (=> b!101684 m!112689))

(assert (=> b!101684 m!112689))

(declare-fun m!112691 () Bool)

(assert (=> b!101684 m!112691))

(assert (=> bm!10533 m!112689))

(declare-fun m!112693 () Bool)

(assert (=> bm!10533 m!112693))

(assert (=> b!101685 m!112689))

(assert (=> b!101685 m!112689))

(assert (=> b!101685 m!112691))

(assert (=> b!101686 m!112689))

(assert (=> b!101686 m!112689))

(declare-fun m!112695 () Bool)

(assert (=> b!101686 m!112695))

(assert (=> b!101511 d!27551))

(declare-fun d!27553 () Bool)

(assert (=> d!27553 (= (array_inv!1271 (_keys!4236 newMap!16)) (bvsge (size!2286 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101516 d!27553))

(declare-fun d!27555 () Bool)

(assert (=> d!27555 (= (array_inv!1272 (_values!2519 newMap!16)) (bvsge (size!2287 (_values!2519 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101516 d!27555))

(declare-fun d!27557 () Bool)

(declare-fun e!66213 () Bool)

(assert (=> d!27557 e!66213))

(declare-fun res!50939 () Bool)

(assert (=> d!27557 (=> res!50939 e!66213)))

(declare-fun lt!51592 () Bool)

(assert (=> d!27557 (= res!50939 (not lt!51592))))

(declare-fun lt!51591 () Bool)

(assert (=> d!27557 (= lt!51592 lt!51591)))

(declare-fun lt!51589 () Unit!3088)

(declare-fun e!66212 () Unit!3088)

(assert (=> d!27557 (= lt!51589 e!66212)))

(declare-fun c!17489 () Bool)

(assert (=> d!27557 (= c!17489 lt!51591)))

(declare-fun containsKey!157 (List!1592 (_ BitVec 64)) Bool)

(assert (=> d!27557 (= lt!51591 (containsKey!157 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27557 (= (contains!813 lt!51478 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) lt!51592)))

(declare-fun b!101695 () Bool)

(declare-fun lt!51590 () Unit!3088)

(assert (=> b!101695 (= e!66212 lt!51590)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!105 (List!1592 (_ BitVec 64)) Unit!3088)

(assert (=> b!101695 (= lt!51590 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-datatypes ((Option!159 0))(
  ( (Some!158 (v!2848 V!3179)) (None!157) )
))
(declare-fun isDefined!106 (Option!159) Bool)

(declare-fun getValueByKey!153 (List!1592 (_ BitVec 64)) Option!159)

(assert (=> b!101695 (isDefined!106 (getValueByKey!153 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!101696 () Bool)

(declare-fun Unit!3097 () Unit!3088)

(assert (=> b!101696 (= e!66212 Unit!3097)))

(declare-fun b!101697 () Bool)

(assert (=> b!101697 (= e!66213 (isDefined!106 (getValueByKey!153 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(assert (= (and d!27557 c!17489) b!101695))

(assert (= (and d!27557 (not c!17489)) b!101696))

(assert (= (and d!27557 (not res!50939)) b!101697))

(assert (=> d!27557 m!112527))

(declare-fun m!112697 () Bool)

(assert (=> d!27557 m!112697))

(assert (=> b!101695 m!112527))

(declare-fun m!112699 () Bool)

(assert (=> b!101695 m!112699))

(assert (=> b!101695 m!112527))

(declare-fun m!112701 () Bool)

(assert (=> b!101695 m!112701))

(assert (=> b!101695 m!112701))

(declare-fun m!112703 () Bool)

(assert (=> b!101695 m!112703))

(assert (=> b!101697 m!112527))

(assert (=> b!101697 m!112701))

(assert (=> b!101697 m!112701))

(assert (=> b!101697 m!112703))

(assert (=> b!101507 d!27557))

(declare-fun b!101778 () Bool)

(declare-fun e!66260 () Bool)

(declare-fun call!10600 () Bool)

(assert (=> b!101778 (= e!66260 (not call!10600))))

(declare-fun b!101779 () Bool)

(declare-fun e!66256 () Bool)

(declare-fun e!66261 () Bool)

(assert (=> b!101779 (= e!66256 e!66261)))

(declare-fun res!50970 () Bool)

(declare-fun call!10589 () Bool)

(assert (=> b!101779 (= res!50970 call!10589)))

(assert (=> b!101779 (=> (not res!50970) (not e!66261))))

(declare-fun b!101780 () Bool)

(declare-fun res!50975 () Bool)

(declare-fun e!66262 () Bool)

(assert (=> b!101780 (=> (not res!50975) (not e!66262))))

(declare-datatypes ((SeekEntryResult!256 0))(
  ( (MissingZero!256 (index!3170 (_ BitVec 32))) (Found!256 (index!3171 (_ BitVec 32))) (Intermediate!256 (undefined!1068 Bool) (index!3172 (_ BitVec 32)) (x!13339 (_ BitVec 32))) (Undefined!256) (MissingVacant!256 (index!3173 (_ BitVec 32))) )
))
(declare-fun lt!51668 () SeekEntryResult!256)

(assert (=> b!101780 (= res!50975 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3170 lt!51668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101781 () Bool)

(declare-fun lt!51658 () Unit!3088)

(declare-fun lt!51664 () Unit!3088)

(assert (=> b!101781 (= lt!51658 lt!51664)))

(declare-fun call!10607 () ListLongMap!1549)

(declare-fun lt!51670 () SeekEntryResult!256)

(assert (=> b!101781 (contains!813 call!10607 (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670)))))

(declare-fun lt!51673 () array!4285)

(declare-fun lemmaValidKeyInArrayIsInListMap!105 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) Int) Unit!3088)

(assert (=> b!101781 (= lt!51664 (lemmaValidKeyInArrayIsInListMap!105 (_keys!4236 newMap!16) lt!51673 (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (index!3171 lt!51670) (defaultEntry!2536 newMap!16)))))

(assert (=> b!101781 (= lt!51673 (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))))))

(declare-fun lt!51660 () Unit!3088)

(declare-fun lt!51671 () Unit!3088)

(assert (=> b!101781 (= lt!51660 lt!51671)))

(declare-fun call!10592 () ListLongMap!1549)

(declare-fun call!10605 () ListLongMap!1549)

(assert (=> b!101781 (= call!10592 call!10605)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) (_ BitVec 64) V!3179 Int) Unit!3088)

(assert (=> b!101781 (= lt!51671 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (index!3171 lt!51670) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51665 () Unit!3088)

(declare-fun e!66265 () Unit!3088)

(assert (=> b!101781 (= lt!51665 e!66265)))

(declare-fun c!17526 () Bool)

(declare-fun call!10597 () Bool)

(assert (=> b!101781 (= c!17526 call!10597)))

(declare-fun e!66273 () tuple2!2368)

(assert (=> b!101781 (= e!66273 (tuple2!2369 true (LongMapFixedSize!871 (defaultEntry!2536 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (_size!484 newMap!16) (_keys!4236 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))) (_vacant!484 newMap!16))))))

(declare-fun b!101782 () Bool)

(declare-fun e!66259 () tuple2!2368)

(declare-fun lt!51659 () tuple2!2368)

(assert (=> b!101782 (= e!66259 (tuple2!2369 (_1!1195 lt!51659) (_2!1195 lt!51659)))))

(declare-fun call!10608 () tuple2!2368)

(assert (=> b!101782 (= lt!51659 call!10608)))

(declare-fun bm!10582 () Bool)

(declare-fun call!10598 () ListLongMap!1549)

(assert (=> bm!10582 (= call!10598 call!10592)))

(declare-fun call!10593 () ListLongMap!1549)

(declare-fun e!66268 () Bool)

(declare-fun b!101783 () Bool)

(declare-fun call!10594 () ListLongMap!1549)

(assert (=> b!101783 (= e!66268 (= call!10594 (+!138 call!10593 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!101784 () Bool)

(declare-fun e!66263 () Bool)

(assert (=> b!101784 (= e!66263 (= call!10594 call!10593))))

(declare-fun b!101785 () Bool)

(declare-fun e!66269 () tuple2!2368)

(declare-fun e!66264 () tuple2!2368)

(assert (=> b!101785 (= e!66269 e!66264)))

(declare-fun c!17528 () Bool)

(assert (=> b!101785 (= c!17528 (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101786 () Bool)

(declare-fun lt!51667 () Unit!3088)

(assert (=> b!101786 (= e!66265 lt!51667)))

(declare-fun call!10602 () Unit!3088)

(assert (=> b!101786 (= lt!51667 call!10602)))

(declare-fun lt!51653 () SeekEntryResult!256)

(declare-fun call!10591 () SeekEntryResult!256)

(assert (=> b!101786 (= lt!51653 call!10591)))

(declare-fun res!50968 () Bool)

(assert (=> b!101786 (= res!50968 ((_ is Found!256) lt!51653))))

(declare-fun e!66267 () Bool)

(assert (=> b!101786 (=> (not res!50968) (not e!66267))))

(assert (=> b!101786 e!66267))

(declare-fun bm!10583 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) Int) Unit!3088)

(assert (=> bm!10583 (= call!10602 (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)))))

(declare-fun b!101787 () Bool)

(declare-fun res!50980 () Bool)

(declare-fun e!66266 () Bool)

(assert (=> b!101787 (=> (not res!50980) (not e!66266))))

(assert (=> b!101787 (= res!50980 call!10589)))

(declare-fun e!66276 () Bool)

(assert (=> b!101787 (= e!66276 e!66266)))

(declare-fun bm!10584 () Bool)

(declare-fun call!10599 () Bool)

(declare-fun call!10586 () Bool)

(assert (=> bm!10584 (= call!10599 call!10586)))

(declare-fun b!101788 () Bool)

(declare-fun call!10601 () Bool)

(assert (=> b!101788 (= e!66261 (not call!10601))))

(declare-fun bm!10585 () Bool)

(declare-fun call!10588 () Bool)

(declare-fun call!10596 () Bool)

(assert (=> bm!10585 (= call!10588 call!10596)))

(declare-fun b!101789 () Bool)

(declare-fun res!50981 () Bool)

(assert (=> b!101789 (= res!50981 call!10599)))

(assert (=> b!101789 (=> (not res!50981) (not e!66267))))

(declare-fun c!17522 () Bool)

(declare-fun bm!10586 () Bool)

(declare-fun lt!51666 () (_ BitVec 32))

(assert (=> bm!10586 (= call!10605 (getCurrentListMap!480 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun c!17524 () Bool)

(declare-fun bm!10587 () Bool)

(assert (=> bm!10587 (= call!10607 (getCurrentListMap!480 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun bm!10588 () Bool)

(declare-fun call!10587 () Bool)

(assert (=> bm!10588 (= call!10601 call!10587)))

(declare-fun b!101790 () Bool)

(declare-fun e!66274 () Unit!3088)

(declare-fun lt!51663 () Unit!3088)

(assert (=> b!101790 (= e!66274 lt!51663)))

(declare-fun call!10590 () Unit!3088)

(assert (=> b!101790 (= lt!51663 call!10590)))

(declare-fun call!10603 () SeekEntryResult!256)

(assert (=> b!101790 (= lt!51668 call!10603)))

(declare-fun c!17525 () Bool)

(assert (=> b!101790 (= c!17525 ((_ is MissingZero!256) lt!51668))))

(declare-fun e!66275 () Bool)

(assert (=> b!101790 e!66275))

(declare-fun call!10585 () ListLongMap!1549)

(declare-fun bm!10589 () Bool)

(declare-fun lt!51652 () (_ BitVec 32))

(assert (=> bm!10589 (= call!10585 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun b!101791 () Bool)

(declare-fun c!17519 () Bool)

(assert (=> b!101791 (= c!17519 ((_ is MissingVacant!256) lt!51668))))

(declare-fun e!66257 () Bool)

(assert (=> b!101791 (= e!66275 e!66257)))

(declare-fun b!101792 () Bool)

(declare-fun lt!51656 () Unit!3088)

(assert (=> b!101792 (= lt!51656 e!66274)))

(declare-fun c!17517 () Bool)

(assert (=> b!101792 (= c!17517 call!10597)))

(declare-fun e!66270 () tuple2!2368)

(assert (=> b!101792 (= e!66270 (tuple2!2369 false newMap!16))))

(declare-fun b!101793 () Bool)

(assert (=> b!101793 (= e!66259 e!66273)))

(declare-fun c!17523 () Bool)

(assert (=> b!101793 (= c!17523 ((_ is MissingZero!256) lt!51670))))

(declare-fun b!101794 () Bool)

(assert (=> b!101794 (= e!66267 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51653)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun c!17516 () Bool)

(declare-fun bm!10590 () Bool)

(declare-fun updateHelperNewKey!44 (LongMapFixedSize!870 (_ BitVec 64) V!3179 (_ BitVec 32)) tuple2!2368)

(assert (=> bm!10590 (= call!10608 (updateHelperNewKey!44 newMap!16 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670))))))

(declare-fun b!101795 () Bool)

(assert (=> b!101795 (= e!66262 (not call!10600))))

(declare-fun b!101796 () Bool)

(declare-fun lt!51651 () SeekEntryResult!256)

(assert (=> b!101796 (= e!66256 ((_ is Undefined!256) lt!51651))))

(declare-fun bm!10591 () Bool)

(assert (=> bm!10591 (= call!10596 call!10586)))

(declare-fun b!101797 () Bool)

(assert (=> b!101797 (= e!66263 e!66268)))

(declare-fun res!50971 () Bool)

(assert (=> b!101797 (= res!50971 (contains!813 call!10594 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> b!101797 (=> (not res!50971) (not e!66268))))

(declare-fun b!101798 () Bool)

(declare-fun e!66258 () ListLongMap!1549)

(assert (=> b!101798 (= e!66258 call!10607)))

(declare-fun b!101799 () Bool)

(declare-fun res!50974 () Bool)

(assert (=> b!101799 (= res!50974 call!10596)))

(declare-fun e!66272 () Bool)

(assert (=> b!101799 (=> (not res!50974) (not e!66272))))

(declare-fun bm!10592 () Bool)

(declare-fun call!10604 () SeekEntryResult!256)

(assert (=> bm!10592 (= call!10603 call!10604)))

(declare-fun b!101800 () Bool)

(declare-fun res!50972 () Bool)

(assert (=> b!101800 (=> (not res!50972) (not e!66266))))

(assert (=> b!101800 (= res!50972 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3170 lt!51651)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10593 () Bool)

(declare-fun c!17520 () Bool)

(assert (=> bm!10593 (= c!17520 c!17524)))

(assert (=> bm!10593 (= call!10597 (contains!813 e!66258 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!101801 () Bool)

(declare-fun Unit!3098 () Unit!3088)

(assert (=> b!101801 (= e!66274 Unit!3098)))

(declare-fun lt!51648 () Unit!3088)

(assert (=> b!101801 (= lt!51648 call!10602)))

(declare-fun lt!51672 () SeekEntryResult!256)

(assert (=> b!101801 (= lt!51672 call!10603)))

(declare-fun res!50977 () Bool)

(assert (=> b!101801 (= res!50977 ((_ is Found!256) lt!51672))))

(assert (=> b!101801 (=> (not res!50977) (not e!66272))))

(assert (=> b!101801 e!66272))

(declare-fun lt!51662 () Unit!3088)

(assert (=> b!101801 (= lt!51662 lt!51648)))

(assert (=> b!101801 false))

(declare-fun b!101802 () Bool)

(assert (=> b!101802 (= e!66257 ((_ is Undefined!256) lt!51668))))

(declare-fun b!101803 () Bool)

(declare-fun lt!51657 () tuple2!2368)

(assert (=> b!101803 (= lt!51657 call!10608)))

(assert (=> b!101803 (= e!66273 (tuple2!2369 (_1!1195 lt!51657) (_2!1195 lt!51657)))))

(declare-fun bm!10594 () Bool)

(declare-fun call!10606 () ListLongMap!1549)

(assert (=> bm!10594 (= call!10606 call!10605)))

(declare-fun d!27559 () Bool)

(declare-fun e!66271 () Bool)

(assert (=> d!27559 e!66271))

(declare-fun res!50976 () Bool)

(assert (=> d!27559 (=> (not res!50976) (not e!66271))))

(declare-fun lt!51647 () tuple2!2368)

(assert (=> d!27559 (= res!50976 (valid!398 (_2!1195 lt!51647)))))

(assert (=> d!27559 (= lt!51647 e!66269)))

(assert (=> d!27559 (= c!17522 (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvneg (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(assert (=> d!27559 (valid!398 newMap!16)))

(assert (=> d!27559 (= (update!147 newMap!16 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!51647)))

(declare-fun b!101804 () Bool)

(declare-fun lt!51669 () Unit!3088)

(declare-fun lt!51655 () Unit!3088)

(assert (=> b!101804 (= lt!51669 lt!51655)))

(assert (=> b!101804 (= call!10598 call!10606)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!44 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 V!3179 Int) Unit!3088)

(assert (=> b!101804 (= lt!51655 (lemmaChangeZeroKeyThenAddPairToListMap!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) lt!51666 (zeroValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2414 newMap!16) (defaultEntry!2536 newMap!16)))))

(assert (=> b!101804 (= lt!51666 (bvor (extraKeys!2347 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!101804 (= e!66264 (tuple2!2369 true (LongMapFixedSize!871 (defaultEntry!2536 newMap!16) (mask!6659 newMap!16) (bvor (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2414 newMap!16) (_size!484 newMap!16) (_keys!4236 newMap!16) (_values!2519 newMap!16) (_vacant!484 newMap!16))))))

(declare-fun b!101805 () Bool)

(assert (=> b!101805 (= c!17516 ((_ is MissingVacant!256) lt!51670))))

(assert (=> b!101805 (= e!66270 e!66259)))

(declare-fun bm!10595 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4283 (_ BitVec 32)) SeekEntryResult!256)

(assert (=> bm!10595 (= call!10604 (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun b!101806 () Bool)

(assert (=> b!101806 (= e!66257 e!66260)))

(declare-fun res!50969 () Bool)

(assert (=> b!101806 (= res!50969 call!10588)))

(assert (=> b!101806 (=> (not res!50969) (not e!66260))))

(declare-fun b!101807 () Bool)

(declare-fun res!50978 () Bool)

(assert (=> b!101807 (= res!50978 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3173 lt!51668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101807 (=> (not res!50978) (not e!66260))))

(declare-fun b!101808 () Bool)

(declare-fun Unit!3099 () Unit!3088)

(assert (=> b!101808 (= e!66265 Unit!3099)))

(declare-fun lt!51661 () Unit!3088)

(assert (=> b!101808 (= lt!51661 call!10590)))

(assert (=> b!101808 (= lt!51651 call!10591)))

(declare-fun c!17518 () Bool)

(assert (=> b!101808 (= c!17518 ((_ is MissingZero!256) lt!51651))))

(assert (=> b!101808 e!66276))

(declare-fun lt!51654 () Unit!3088)

(assert (=> b!101808 (= lt!51654 lt!51661)))

(assert (=> b!101808 false))

(declare-fun bm!10596 () Bool)

(assert (=> bm!10596 (= call!10600 call!10587)))

(declare-fun bm!10597 () Bool)

(assert (=> bm!10597 (= call!10587 (arrayContainsKey!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101809 () Bool)

(assert (=> b!101809 (= e!66266 (not call!10601))))

(declare-fun call!10595 () ListLongMap!1549)

(declare-fun bm!10598 () Bool)

(assert (=> bm!10598 (= call!10592 (+!138 (ite c!17522 (ite c!17528 call!10595 call!10606) call!10585) (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!10599 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10599 (= call!10586 (inRange!0 (ite c!17524 (ite c!17517 (index!3171 lt!51672) (ite c!17525 (index!3170 lt!51668) (index!3173 lt!51668))) (ite c!17526 (index!3171 lt!51653) (ite c!17518 (index!3170 lt!51651) (index!3173 lt!51651)))) (mask!6659 newMap!16)))))

(declare-fun bm!10600 () Bool)

(assert (=> bm!10600 (= call!10593 (map!1267 newMap!16))))

(declare-fun b!101810 () Bool)

(declare-fun lt!51649 () Unit!3088)

(declare-fun lt!51650 () Unit!3088)

(assert (=> b!101810 (= lt!51649 lt!51650)))

(assert (=> b!101810 (= call!10598 call!10595)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 V!3179 Int) Unit!3088)

(assert (=> b!101810 (= lt!51650 (lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) lt!51652 (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)))))

(assert (=> b!101810 (= lt!51652 (bvor (extraKeys!2347 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!101810 (= e!66264 (tuple2!2369 true (LongMapFixedSize!871 (defaultEntry!2536 newMap!16) (mask!6659 newMap!16) (bvor (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) (zeroValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!484 newMap!16) (_keys!4236 newMap!16) (_values!2519 newMap!16) (_vacant!484 newMap!16))))))

(declare-fun bm!10601 () Bool)

(assert (=> bm!10601 (= call!10595 call!10585)))

(declare-fun b!101811 () Bool)

(assert (=> b!101811 (= e!66272 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51672)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun bm!10602 () Bool)

(assert (=> bm!10602 (= call!10594 (map!1267 (_2!1195 lt!51647)))))

(declare-fun bm!10603 () Bool)

(assert (=> bm!10603 (= call!10591 call!10604)))

(declare-fun b!101812 () Bool)

(assert (=> b!101812 (= e!66269 e!66270)))

(assert (=> b!101812 (= lt!51670 (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(assert (=> b!101812 (= c!17524 ((_ is Undefined!256) lt!51670))))

(declare-fun b!101813 () Bool)

(assert (=> b!101813 (= e!66271 e!66263)))

(declare-fun c!17527 () Bool)

(assert (=> b!101813 (= c!17527 (_1!1195 lt!51647))))

(declare-fun b!101814 () Bool)

(declare-fun c!17521 () Bool)

(assert (=> b!101814 (= c!17521 ((_ is MissingVacant!256) lt!51651))))

(assert (=> b!101814 (= e!66276 e!66256)))

(declare-fun bm!10604 () Bool)

(assert (=> bm!10604 (= call!10589 call!10599)))

(declare-fun bm!10605 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) Int) Unit!3088)

(assert (=> bm!10605 (= call!10590 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)))))

(declare-fun b!101815 () Bool)

(declare-fun res!50973 () Bool)

(assert (=> b!101815 (=> (not res!50973) (not e!66262))))

(assert (=> b!101815 (= res!50973 call!10588)))

(assert (=> b!101815 (= e!66275 e!66262)))

(declare-fun b!101816 () Bool)

(declare-fun res!50979 () Bool)

(assert (=> b!101816 (= res!50979 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3173 lt!51651)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101816 (=> (not res!50979) (not e!66261))))

(declare-fun b!101817 () Bool)

(assert (=> b!101817 (= e!66258 call!10585)))

(assert (= (and d!27559 c!17522) b!101785))

(assert (= (and d!27559 (not c!17522)) b!101812))

(assert (= (and b!101785 c!17528) b!101804))

(assert (= (and b!101785 (not c!17528)) b!101810))

(assert (= (or b!101804 b!101810) bm!10594))

(assert (= (or b!101804 b!101810) bm!10601))

(assert (= (or b!101804 b!101810) bm!10582))

(assert (= (and b!101812 c!17524) b!101792))

(assert (= (and b!101812 (not c!17524)) b!101805))

(assert (= (and b!101792 c!17517) b!101801))

(assert (= (and b!101792 (not c!17517)) b!101790))

(assert (= (and b!101801 res!50977) b!101799))

(assert (= (and b!101799 res!50974) b!101811))

(assert (= (and b!101790 c!17525) b!101815))

(assert (= (and b!101790 (not c!17525)) b!101791))

(assert (= (and b!101815 res!50973) b!101780))

(assert (= (and b!101780 res!50975) b!101795))

(assert (= (and b!101791 c!17519) b!101806))

(assert (= (and b!101791 (not c!17519)) b!101802))

(assert (= (and b!101806 res!50969) b!101807))

(assert (= (and b!101807 res!50978) b!101778))

(assert (= (or b!101815 b!101806) bm!10585))

(assert (= (or b!101795 b!101778) bm!10596))

(assert (= (or b!101799 bm!10585) bm!10591))

(assert (= (or b!101801 b!101790) bm!10592))

(assert (= (and b!101805 c!17516) b!101782))

(assert (= (and b!101805 (not c!17516)) b!101793))

(assert (= (and b!101793 c!17523) b!101803))

(assert (= (and b!101793 (not c!17523)) b!101781))

(assert (= (and b!101781 c!17526) b!101786))

(assert (= (and b!101781 (not c!17526)) b!101808))

(assert (= (and b!101786 res!50968) b!101789))

(assert (= (and b!101789 res!50981) b!101794))

(assert (= (and b!101808 c!17518) b!101787))

(assert (= (and b!101808 (not c!17518)) b!101814))

(assert (= (and b!101787 res!50980) b!101800))

(assert (= (and b!101800 res!50972) b!101809))

(assert (= (and b!101814 c!17521) b!101779))

(assert (= (and b!101814 (not c!17521)) b!101796))

(assert (= (and b!101779 res!50970) b!101816))

(assert (= (and b!101816 res!50979) b!101788))

(assert (= (or b!101787 b!101779) bm!10604))

(assert (= (or b!101809 b!101788) bm!10588))

(assert (= (or b!101789 bm!10604) bm!10584))

(assert (= (or b!101786 b!101808) bm!10603))

(assert (= (or b!101782 b!101803) bm!10590))

(assert (= (or bm!10591 bm!10584) bm!10599))

(assert (= (or b!101792 b!101781) bm!10587))

(assert (= (or b!101801 b!101786) bm!10583))

(assert (= (or bm!10596 bm!10588) bm!10597))

(assert (= (or bm!10592 bm!10603) bm!10595))

(assert (= (or b!101790 b!101808) bm!10605))

(assert (= (or b!101792 b!101781) bm!10593))

(assert (= (and bm!10593 c!17520) b!101798))

(assert (= (and bm!10593 (not c!17520)) b!101817))

(assert (= (or bm!10594 b!101781) bm!10586))

(assert (= (or bm!10601 b!101781 b!101817) bm!10589))

(assert (= (or bm!10582 b!101781) bm!10598))

(assert (= (and d!27559 res!50976) b!101813))

(assert (= (and b!101813 c!17527) b!101797))

(assert (= (and b!101813 (not c!17527)) b!101784))

(assert (= (and b!101797 res!50971) b!101783))

(assert (= (or b!101783 b!101784) bm!10600))

(assert (= (or b!101797 b!101783 b!101784) bm!10602))

(declare-fun m!112705 () Bool)

(assert (=> b!101807 m!112705))

(assert (=> b!101810 m!112525))

(declare-fun m!112707 () Bool)

(assert (=> b!101810 m!112707))

(declare-fun m!112709 () Bool)

(assert (=> b!101811 m!112709))

(declare-fun m!112711 () Bool)

(assert (=> b!101816 m!112711))

(assert (=> b!101812 m!112527))

(declare-fun m!112713 () Bool)

(assert (=> b!101812 m!112713))

(declare-fun m!112715 () Bool)

(assert (=> bm!10586 m!112715))

(declare-fun m!112717 () Bool)

(assert (=> bm!10586 m!112717))

(declare-fun m!112719 () Bool)

(assert (=> b!101780 m!112719))

(declare-fun m!112721 () Bool)

(assert (=> bm!10587 m!112721))

(assert (=> bm!10600 m!112549))

(assert (=> b!101781 m!112527))

(assert (=> b!101781 m!112525))

(declare-fun m!112723 () Bool)

(assert (=> b!101781 m!112723))

(declare-fun m!112725 () Bool)

(assert (=> b!101781 m!112725))

(assert (=> b!101781 m!112725))

(declare-fun m!112727 () Bool)

(assert (=> b!101781 m!112727))

(assert (=> b!101781 m!112715))

(declare-fun m!112729 () Bool)

(assert (=> b!101781 m!112729))

(declare-fun m!112731 () Bool)

(assert (=> bm!10602 m!112731))

(declare-fun m!112733 () Bool)

(assert (=> b!101800 m!112733))

(assert (=> bm!10605 m!112527))

(declare-fun m!112735 () Bool)

(assert (=> bm!10605 m!112735))

(assert (=> bm!10583 m!112527))

(declare-fun m!112737 () Bool)

(assert (=> bm!10583 m!112737))

(assert (=> b!101804 m!112525))

(declare-fun m!112739 () Bool)

(assert (=> b!101804 m!112739))

(assert (=> bm!10590 m!112527))

(assert (=> bm!10590 m!112525))

(declare-fun m!112741 () Bool)

(assert (=> bm!10590 m!112741))

(assert (=> bm!10595 m!112527))

(assert (=> bm!10595 m!112713))

(declare-fun m!112743 () Bool)

(assert (=> bm!10599 m!112743))

(assert (=> bm!10593 m!112527))

(declare-fun m!112745 () Bool)

(assert (=> bm!10593 m!112745))

(declare-fun m!112747 () Bool)

(assert (=> b!101794 m!112747))

(declare-fun m!112749 () Bool)

(assert (=> bm!10598 m!112749))

(declare-fun m!112751 () Bool)

(assert (=> d!27559 m!112751))

(assert (=> d!27559 m!112553))

(assert (=> b!101797 m!112527))

(declare-fun m!112753 () Bool)

(assert (=> b!101797 m!112753))

(assert (=> bm!10597 m!112527))

(declare-fun m!112755 () Bool)

(assert (=> bm!10597 m!112755))

(declare-fun m!112757 () Bool)

(assert (=> bm!10589 m!112757))

(declare-fun m!112759 () Bool)

(assert (=> b!101783 m!112759))

(assert (=> b!101507 d!27559))

(declare-fun d!27561 () Bool)

(declare-fun c!17531 () Bool)

(assert (=> d!27561 (= c!17531 ((_ is ValueCellFull!981) (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun e!66279 () V!3179)

(assert (=> d!27561 (= (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66279)))

(declare-fun b!101822 () Bool)

(declare-fun get!1303 (ValueCell!981 V!3179) V!3179)

(assert (=> b!101822 (= e!66279 (get!1303 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101823 () Bool)

(declare-fun get!1304 (ValueCell!981 V!3179) V!3179)

(assert (=> b!101823 (= e!66279 (get!1304 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27561 c!17531) b!101822))

(assert (= (and d!27561 (not c!17531)) b!101823))

(assert (=> b!101822 m!112521))

(assert (=> b!101822 m!112523))

(declare-fun m!112761 () Bool)

(assert (=> b!101822 m!112761))

(assert (=> b!101823 m!112521))

(assert (=> b!101823 m!112523))

(declare-fun m!112763 () Bool)

(assert (=> b!101823 m!112763))

(assert (=> b!101507 d!27561))

(declare-fun d!27563 () Bool)

(assert (=> d!27563 (= (valid!397 thiss!992) (valid!398 (v!2844 (underlying!346 thiss!992))))))

(declare-fun bs!4208 () Bool)

(assert (= bs!4208 d!27563))

(declare-fun m!112765 () Bool)

(assert (=> bs!4208 m!112765))

(assert (=> start!12042 d!27563))

(declare-fun b!101832 () Bool)

(declare-fun e!66286 () Bool)

(declare-fun call!10611 () Bool)

(assert (=> b!101832 (= e!66286 call!10611)))

(declare-fun bm!10608 () Bool)

(assert (=> bm!10608 (= call!10611 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!101834 () Bool)

(declare-fun e!66288 () Bool)

(assert (=> b!101834 (= e!66288 call!10611)))

(declare-fun b!101835 () Bool)

(assert (=> b!101835 (= e!66288 e!66286)))

(declare-fun lt!51681 () (_ BitVec 64))

(assert (=> b!101835 (= lt!51681 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!51680 () Unit!3088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4283 (_ BitVec 64) (_ BitVec 32)) Unit!3088)

(assert (=> b!101835 (= lt!51680 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 #b00000000000000000000000000000000))))

(assert (=> b!101835 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 #b00000000000000000000000000000000)))

(declare-fun lt!51682 () Unit!3088)

(assert (=> b!101835 (= lt!51682 lt!51680)))

(declare-fun res!50987 () Bool)

(assert (=> b!101835 (= res!50987 (= (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))) (Found!256 #b00000000000000000000000000000000)))))

(assert (=> b!101835 (=> (not res!50987) (not e!66286))))

(declare-fun b!101833 () Bool)

(declare-fun e!66287 () Bool)

(assert (=> b!101833 (= e!66287 e!66288)))

(declare-fun c!17534 () Bool)

(assert (=> b!101833 (= c!17534 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!27565 () Bool)

(declare-fun res!50986 () Bool)

(assert (=> d!27565 (=> res!50986 e!66287)))

(assert (=> d!27565 (= res!50986 (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27565 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))) e!66287)))

(assert (= (and d!27565 (not res!50986)) b!101833))

(assert (= (and b!101833 c!17534) b!101835))

(assert (= (and b!101833 (not c!17534)) b!101834))

(assert (= (and b!101835 res!50987) b!101832))

(assert (= (or b!101832 b!101834) bm!10608))

(declare-fun m!112767 () Bool)

(assert (=> bm!10608 m!112767))

(assert (=> b!101835 m!112689))

(declare-fun m!112769 () Bool)

(assert (=> b!101835 m!112769))

(declare-fun m!112771 () Bool)

(assert (=> b!101835 m!112771))

(assert (=> b!101835 m!112689))

(declare-fun m!112773 () Bool)

(assert (=> b!101835 m!112773))

(assert (=> b!101833 m!112689))

(assert (=> b!101833 m!112689))

(assert (=> b!101833 m!112691))

(assert (=> b!101508 d!27565))

(declare-fun mapIsEmpty!3831 () Bool)

(declare-fun mapRes!3831 () Bool)

(assert (=> mapIsEmpty!3831 mapRes!3831))

(declare-fun b!101842 () Bool)

(declare-fun e!66293 () Bool)

(assert (=> b!101842 (= e!66293 tp_is_empty!2649)))

(declare-fun condMapEmpty!3831 () Bool)

(declare-fun mapDefault!3831 () ValueCell!981)

(assert (=> mapNonEmpty!3821 (= condMapEmpty!3831 (= mapRest!3822 ((as const (Array (_ BitVec 32) ValueCell!981)) mapDefault!3831)))))

(declare-fun e!66294 () Bool)

(assert (=> mapNonEmpty!3821 (= tp!9701 (and e!66294 mapRes!3831))))

(declare-fun mapNonEmpty!3831 () Bool)

(declare-fun tp!9717 () Bool)

(assert (=> mapNonEmpty!3831 (= mapRes!3831 (and tp!9717 e!66293))))

(declare-fun mapKey!3831 () (_ BitVec 32))

(declare-fun mapValue!3831 () ValueCell!981)

(declare-fun mapRest!3831 () (Array (_ BitVec 32) ValueCell!981))

(assert (=> mapNonEmpty!3831 (= mapRest!3822 (store mapRest!3831 mapKey!3831 mapValue!3831))))

(declare-fun b!101843 () Bool)

(assert (=> b!101843 (= e!66294 tp_is_empty!2649)))

(assert (= (and mapNonEmpty!3821 condMapEmpty!3831) mapIsEmpty!3831))

(assert (= (and mapNonEmpty!3821 (not condMapEmpty!3831)) mapNonEmpty!3831))

(assert (= (and mapNonEmpty!3831 ((_ is ValueCellFull!981) mapValue!3831)) b!101842))

(assert (= (and mapNonEmpty!3821 ((_ is ValueCellFull!981) mapDefault!3831)) b!101843))

(declare-fun m!112775 () Bool)

(assert (=> mapNonEmpty!3831 m!112775))

(declare-fun mapIsEmpty!3832 () Bool)

(declare-fun mapRes!3832 () Bool)

(assert (=> mapIsEmpty!3832 mapRes!3832))

(declare-fun b!101844 () Bool)

(declare-fun e!66295 () Bool)

(assert (=> b!101844 (= e!66295 tp_is_empty!2649)))

(declare-fun condMapEmpty!3832 () Bool)

(declare-fun mapDefault!3832 () ValueCell!981)

(assert (=> mapNonEmpty!3822 (= condMapEmpty!3832 (= mapRest!3821 ((as const (Array (_ BitVec 32) ValueCell!981)) mapDefault!3832)))))

(declare-fun e!66296 () Bool)

(assert (=> mapNonEmpty!3822 (= tp!9699 (and e!66296 mapRes!3832))))

(declare-fun mapNonEmpty!3832 () Bool)

(declare-fun tp!9718 () Bool)

(assert (=> mapNonEmpty!3832 (= mapRes!3832 (and tp!9718 e!66295))))

(declare-fun mapKey!3832 () (_ BitVec 32))

(declare-fun mapRest!3832 () (Array (_ BitVec 32) ValueCell!981))

(declare-fun mapValue!3832 () ValueCell!981)

(assert (=> mapNonEmpty!3832 (= mapRest!3821 (store mapRest!3832 mapKey!3832 mapValue!3832))))

(declare-fun b!101845 () Bool)

(assert (=> b!101845 (= e!66296 tp_is_empty!2649)))

(assert (= (and mapNonEmpty!3822 condMapEmpty!3832) mapIsEmpty!3832))

(assert (= (and mapNonEmpty!3822 (not condMapEmpty!3832)) mapNonEmpty!3832))

(assert (= (and mapNonEmpty!3832 ((_ is ValueCellFull!981) mapValue!3832)) b!101844))

(assert (= (and mapNonEmpty!3822 ((_ is ValueCellFull!981) mapDefault!3832)) b!101845))

(declare-fun m!112777 () Bool)

(assert (=> mapNonEmpty!3832 m!112777))

(declare-fun b_lambda!4557 () Bool)

(assert (= b_lambda!4555 (or (and b!101505 b_free!2465) (and b!101516 b_free!2467 (= (defaultEntry!2536 newMap!16) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))))) b_lambda!4557)))

(check-sat (not bm!10529) (not b!101695) (not b!101671) (not d!27557) (not b!101609) (not b!101679) (not b!101681) (not b!101835) (not b!101797) (not b!101682) (not bm!10602) (not bm!10527) (not b!101812) (not bm!10590) (not d!27547) (not b!101667) (not d!27549) (not b!101620) (not b!101672) (not b!101810) (not bm!10599) (not d!27563) (not bm!10586) (not b!101618) (not bm!10511) (not b!101673) (not d!27533) (not b!101833) (not b!101822) (not bm!10593) (not d!27541) (not b!101684) (not b!101804) (not mapNonEmpty!3832) (not d!27537) (not bm!10595) (not b_lambda!4553) (not b!101608) (not d!27531) (not d!27559) b_and!6269 (not bm!10587) (not b!101783) (not bm!10583) (not bm!10533) (not mapNonEmpty!3831) tp_is_empty!2649 (not bm!10531) (not b!101674) (not bm!10597) (not b!101685) (not b!101823) (not bm!10608) (not b_next!2467) (not b!101781) (not bm!10598) (not b!101607) (not b!101619) (not bm!10526) (not bm!10600) b_and!6267 (not b_next!2465) (not b!101686) (not b!101590) (not b!101595) (not bm!10605) (not b!101697) (not b_lambda!4557) (not bm!10589))
(check-sat b_and!6267 b_and!6269 (not b_next!2465) (not b_next!2467))
(get-model)

(declare-fun d!27567 () Bool)

(declare-fun e!66298 () Bool)

(assert (=> d!27567 e!66298))

(declare-fun res!50988 () Bool)

(assert (=> d!27567 (=> res!50988 e!66298)))

(declare-fun lt!51686 () Bool)

(assert (=> d!27567 (= res!50988 (not lt!51686))))

(declare-fun lt!51685 () Bool)

(assert (=> d!27567 (= lt!51686 lt!51685)))

(declare-fun lt!51683 () Unit!3088)

(declare-fun e!66297 () Unit!3088)

(assert (=> d!27567 (= lt!51683 e!66297)))

(declare-fun c!17535 () Bool)

(assert (=> d!27567 (= c!17535 lt!51685)))

(assert (=> d!27567 (= lt!51685 (containsKey!157 (toList!790 lt!51566) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27567 (= (contains!813 lt!51566 #b1000000000000000000000000000000000000000000000000000000000000000) lt!51686)))

(declare-fun b!101846 () Bool)

(declare-fun lt!51684 () Unit!3088)

(assert (=> b!101846 (= e!66297 lt!51684)))

(assert (=> b!101846 (= lt!51684 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 lt!51566) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101846 (isDefined!106 (getValueByKey!153 (toList!790 lt!51566) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101847 () Bool)

(declare-fun Unit!3100 () Unit!3088)

(assert (=> b!101847 (= e!66297 Unit!3100)))

(declare-fun b!101848 () Bool)

(assert (=> b!101848 (= e!66298 (isDefined!106 (getValueByKey!153 (toList!790 lt!51566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27567 c!17535) b!101846))

(assert (= (and d!27567 (not c!17535)) b!101847))

(assert (= (and d!27567 (not res!50988)) b!101848))

(declare-fun m!112779 () Bool)

(assert (=> d!27567 m!112779))

(declare-fun m!112781 () Bool)

(assert (=> b!101846 m!112781))

(declare-fun m!112783 () Bool)

(assert (=> b!101846 m!112783))

(assert (=> b!101846 m!112783))

(declare-fun m!112785 () Bool)

(assert (=> b!101846 m!112785))

(assert (=> b!101848 m!112783))

(assert (=> b!101848 m!112783))

(assert (=> b!101848 m!112785))

(assert (=> bm!10529 d!27567))

(declare-fun b!101849 () Bool)

(declare-fun e!66311 () ListLongMap!1549)

(declare-fun call!10616 () ListLongMap!1549)

(assert (=> b!101849 (= e!66311 call!10616)))

(declare-fun b!101850 () Bool)

(declare-fun e!66308 () Bool)

(declare-fun e!66299 () Bool)

(assert (=> b!101850 (= e!66308 e!66299)))

(declare-fun res!50993 () Bool)

(declare-fun call!10618 () Bool)

(assert (=> b!101850 (= res!50993 call!10618)))

(assert (=> b!101850 (=> (not res!50993) (not e!66299))))

(declare-fun b!101851 () Bool)

(declare-fun res!50994 () Bool)

(declare-fun e!66302 () Bool)

(assert (=> b!101851 (=> (not res!50994) (not e!66302))))

(declare-fun e!66300 () Bool)

(assert (=> b!101851 (= res!50994 e!66300)))

(declare-fun c!17537 () Bool)

(assert (=> b!101851 (= c!17537 (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101852 () Bool)

(declare-fun e!66307 () ListLongMap!1549)

(declare-fun e!66301 () ListLongMap!1549)

(assert (=> b!101852 (= e!66307 e!66301)))

(declare-fun c!17539 () Bool)

(assert (=> b!101852 (= c!17539 (and (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101853 () Bool)

(declare-fun lt!51694 () ListLongMap!1549)

(assert (=> b!101853 (= e!66299 (= (apply!95 lt!51694 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2414 newMap!16)))))

(declare-fun call!10614 () ListLongMap!1549)

(declare-fun call!10617 () ListLongMap!1549)

(declare-fun bm!10609 () Bool)

(declare-fun call!10615 () ListLongMap!1549)

(declare-fun call!10613 () ListLongMap!1549)

(declare-fun c!17536 () Bool)

(assert (=> bm!10609 (= call!10614 (+!138 (ite c!17536 call!10613 (ite c!17539 call!10617 call!10615)) (ite (or c!17536 c!17539) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 newMap!16)) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 newMap!16)))))))

(declare-fun d!27569 () Bool)

(assert (=> d!27569 e!66302))

(declare-fun res!50989 () Bool)

(assert (=> d!27569 (=> (not res!50989) (not e!66302))))

(assert (=> d!27569 (= res!50989 (or (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))))

(declare-fun lt!51688 () ListLongMap!1549)

(assert (=> d!27569 (= lt!51694 lt!51688)))

(declare-fun lt!51693 () Unit!3088)

(declare-fun e!66303 () Unit!3088)

(assert (=> d!27569 (= lt!51693 e!66303)))

(declare-fun c!17541 () Bool)

(declare-fun e!66305 () Bool)

(assert (=> d!27569 (= c!17541 e!66305)))

(declare-fun res!50990 () Bool)

(assert (=> d!27569 (=> (not res!50990) (not e!66305))))

(assert (=> d!27569 (= res!50990 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27569 (= lt!51688 e!66307)))

(assert (=> d!27569 (= c!17536 (and (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27569 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27569 (= (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) lt!51694)))

(declare-fun bm!10610 () Bool)

(declare-fun call!10612 () Bool)

(assert (=> bm!10610 (= call!10612 (contains!813 lt!51694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101854 () Bool)

(assert (=> b!101854 (= e!66300 (not call!10612))))

(declare-fun b!101855 () Bool)

(assert (=> b!101855 (= e!66308 (not call!10618))))

(declare-fun bm!10611 () Bool)

(assert (=> bm!10611 (= call!10616 call!10614)))

(declare-fun bm!10612 () Bool)

(assert (=> bm!10612 (= call!10618 (contains!813 lt!51694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101856 () Bool)

(declare-fun Unit!3101 () Unit!3088)

(assert (=> b!101856 (= e!66303 Unit!3101)))

(declare-fun b!101857 () Bool)

(declare-fun e!66309 () Bool)

(assert (=> b!101857 (= e!66309 (= (apply!95 lt!51694 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2034 (_values!2519 newMap!16)) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2536 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101857 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2287 (_values!2519 newMap!16))))))

(assert (=> b!101857 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun bm!10613 () Bool)

(assert (=> bm!10613 (= call!10615 call!10617)))

(declare-fun b!101858 () Bool)

(declare-fun e!66310 () Bool)

(assert (=> b!101858 (= e!66310 e!66309)))

(declare-fun res!50995 () Bool)

(assert (=> b!101858 (=> (not res!50995) (not e!66309))))

(assert (=> b!101858 (= res!50995 (contains!813 lt!51694 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!101859 () Bool)

(assert (=> b!101859 (= e!66305 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101860 () Bool)

(assert (=> b!101860 (= e!66307 (+!138 call!10614 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 newMap!16))))))

(declare-fun b!101861 () Bool)

(declare-fun e!66304 () Bool)

(assert (=> b!101861 (= e!66300 e!66304)))

(declare-fun res!50996 () Bool)

(assert (=> b!101861 (= res!50996 call!10612)))

(assert (=> b!101861 (=> (not res!50996) (not e!66304))))

(declare-fun b!101862 () Bool)

(declare-fun res!50991 () Bool)

(assert (=> b!101862 (=> (not res!50991) (not e!66302))))

(assert (=> b!101862 (= res!50991 e!66310)))

(declare-fun res!50997 () Bool)

(assert (=> b!101862 (=> res!50997 e!66310)))

(declare-fun e!66306 () Bool)

(assert (=> b!101862 (= res!50997 (not e!66306))))

(declare-fun res!50992 () Bool)

(assert (=> b!101862 (=> (not res!50992) (not e!66306))))

(assert (=> b!101862 (= res!50992 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!101863 () Bool)

(assert (=> b!101863 (= e!66301 call!10616)))

(declare-fun b!101864 () Bool)

(assert (=> b!101864 (= e!66302 e!66308)))

(declare-fun c!17540 () Bool)

(assert (=> b!101864 (= c!17540 (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101865 () Bool)

(declare-fun lt!51689 () Unit!3088)

(assert (=> b!101865 (= e!66303 lt!51689)))

(declare-fun lt!51690 () ListLongMap!1549)

(assert (=> b!101865 (= lt!51690 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51704 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51704 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51699 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51699 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51691 () Unit!3088)

(assert (=> b!101865 (= lt!51691 (addStillContains!71 lt!51690 lt!51704 (zeroValue!2414 newMap!16) lt!51699))))

(assert (=> b!101865 (contains!813 (+!138 lt!51690 (tuple2!2367 lt!51704 (zeroValue!2414 newMap!16))) lt!51699)))

(declare-fun lt!51692 () Unit!3088)

(assert (=> b!101865 (= lt!51692 lt!51691)))

(declare-fun lt!51696 () ListLongMap!1549)

(assert (=> b!101865 (= lt!51696 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51706 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51706 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51705 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51705 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51698 () Unit!3088)

(assert (=> b!101865 (= lt!51698 (addApplyDifferent!71 lt!51696 lt!51706 (minValue!2414 newMap!16) lt!51705))))

(assert (=> b!101865 (= (apply!95 (+!138 lt!51696 (tuple2!2367 lt!51706 (minValue!2414 newMap!16))) lt!51705) (apply!95 lt!51696 lt!51705))))

(declare-fun lt!51708 () Unit!3088)

(assert (=> b!101865 (= lt!51708 lt!51698)))

(declare-fun lt!51703 () ListLongMap!1549)

(assert (=> b!101865 (= lt!51703 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51687 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51702 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51702 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51707 () Unit!3088)

(assert (=> b!101865 (= lt!51707 (addApplyDifferent!71 lt!51703 lt!51687 (zeroValue!2414 newMap!16) lt!51702))))

(assert (=> b!101865 (= (apply!95 (+!138 lt!51703 (tuple2!2367 lt!51687 (zeroValue!2414 newMap!16))) lt!51702) (apply!95 lt!51703 lt!51702))))

(declare-fun lt!51697 () Unit!3088)

(assert (=> b!101865 (= lt!51697 lt!51707)))

(declare-fun lt!51695 () ListLongMap!1549)

(assert (=> b!101865 (= lt!51695 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51701 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51700 () (_ BitVec 64))

(assert (=> b!101865 (= lt!51700 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101865 (= lt!51689 (addApplyDifferent!71 lt!51695 lt!51701 (minValue!2414 newMap!16) lt!51700))))

(assert (=> b!101865 (= (apply!95 (+!138 lt!51695 (tuple2!2367 lt!51701 (minValue!2414 newMap!16))) lt!51700) (apply!95 lt!51695 lt!51700))))

(declare-fun bm!10614 () Bool)

(assert (=> bm!10614 (= call!10613 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun bm!10615 () Bool)

(assert (=> bm!10615 (= call!10617 call!10613)))

(declare-fun b!101866 () Bool)

(assert (=> b!101866 (= e!66311 call!10615)))

(declare-fun b!101867 () Bool)

(assert (=> b!101867 (= e!66304 (= (apply!95 lt!51694 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2414 newMap!16)))))

(declare-fun b!101868 () Bool)

(assert (=> b!101868 (= e!66306 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101869 () Bool)

(declare-fun c!17538 () Bool)

(assert (=> b!101869 (= c!17538 (and (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101869 (= e!66301 e!66311)))

(assert (= (and d!27569 c!17536) b!101860))

(assert (= (and d!27569 (not c!17536)) b!101852))

(assert (= (and b!101852 c!17539) b!101863))

(assert (= (and b!101852 (not c!17539)) b!101869))

(assert (= (and b!101869 c!17538) b!101849))

(assert (= (and b!101869 (not c!17538)) b!101866))

(assert (= (or b!101849 b!101866) bm!10613))

(assert (= (or b!101863 bm!10613) bm!10615))

(assert (= (or b!101863 b!101849) bm!10611))

(assert (= (or b!101860 bm!10615) bm!10614))

(assert (= (or b!101860 bm!10611) bm!10609))

(assert (= (and d!27569 res!50990) b!101859))

(assert (= (and d!27569 c!17541) b!101865))

(assert (= (and d!27569 (not c!17541)) b!101856))

(assert (= (and d!27569 res!50989) b!101862))

(assert (= (and b!101862 res!50992) b!101868))

(assert (= (and b!101862 (not res!50997)) b!101858))

(assert (= (and b!101858 res!50995) b!101857))

(assert (= (and b!101862 res!50991) b!101851))

(assert (= (and b!101851 c!17537) b!101861))

(assert (= (and b!101851 (not c!17537)) b!101854))

(assert (= (and b!101861 res!50996) b!101867))

(assert (= (or b!101861 b!101854) bm!10610))

(assert (= (and b!101851 res!50994) b!101864))

(assert (= (and b!101864 c!17540) b!101850))

(assert (= (and b!101864 (not c!17540)) b!101855))

(assert (= (and b!101850 res!50993) b!101853))

(assert (= (or b!101850 b!101855) bm!10612))

(declare-fun b_lambda!4559 () Bool)

(assert (=> (not b_lambda!4559) (not b!101857)))

(declare-fun tb!1985 () Bool)

(declare-fun t!5610 () Bool)

(assert (=> (and b!101505 (= (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) (defaultEntry!2536 newMap!16)) t!5610) tb!1985))

(declare-fun result!3355 () Bool)

(assert (=> tb!1985 (= result!3355 tp_is_empty!2649)))

(assert (=> b!101857 t!5610))

(declare-fun b_and!6271 () Bool)

(assert (= b_and!6267 (and (=> t!5610 result!3355) b_and!6271)))

(declare-fun t!5612 () Bool)

(declare-fun tb!1987 () Bool)

(assert (=> (and b!101516 (= (defaultEntry!2536 newMap!16) (defaultEntry!2536 newMap!16)) t!5612) tb!1987))

(declare-fun result!3357 () Bool)

(assert (= result!3357 result!3355))

(assert (=> b!101857 t!5612))

(declare-fun b_and!6273 () Bool)

(assert (= b_and!6269 (and (=> t!5612 result!3357) b_and!6273)))

(declare-fun m!112787 () Bool)

(assert (=> b!101858 m!112787))

(assert (=> b!101858 m!112787))

(declare-fun m!112789 () Bool)

(assert (=> b!101858 m!112789))

(assert (=> b!101868 m!112787))

(assert (=> b!101868 m!112787))

(declare-fun m!112791 () Bool)

(assert (=> b!101868 m!112791))

(declare-fun m!112793 () Bool)

(assert (=> bm!10614 m!112793))

(declare-fun m!112795 () Bool)

(assert (=> bm!10610 m!112795))

(declare-fun m!112797 () Bool)

(assert (=> bm!10612 m!112797))

(declare-fun m!112799 () Bool)

(assert (=> d!27569 m!112799))

(declare-fun m!112801 () Bool)

(assert (=> b!101853 m!112801))

(declare-fun m!112803 () Bool)

(assert (=> b!101860 m!112803))

(declare-fun m!112805 () Bool)

(assert (=> b!101867 m!112805))

(assert (=> b!101859 m!112787))

(assert (=> b!101859 m!112787))

(assert (=> b!101859 m!112791))

(declare-fun m!112807 () Bool)

(assert (=> b!101865 m!112807))

(assert (=> b!101865 m!112787))

(assert (=> b!101865 m!112807))

(declare-fun m!112809 () Bool)

(assert (=> b!101865 m!112809))

(declare-fun m!112811 () Bool)

(assert (=> b!101865 m!112811))

(declare-fun m!112813 () Bool)

(assert (=> b!101865 m!112813))

(declare-fun m!112815 () Bool)

(assert (=> b!101865 m!112815))

(declare-fun m!112817 () Bool)

(assert (=> b!101865 m!112817))

(declare-fun m!112819 () Bool)

(assert (=> b!101865 m!112819))

(declare-fun m!112821 () Bool)

(assert (=> b!101865 m!112821))

(declare-fun m!112823 () Bool)

(assert (=> b!101865 m!112823))

(declare-fun m!112825 () Bool)

(assert (=> b!101865 m!112825))

(declare-fun m!112827 () Bool)

(assert (=> b!101865 m!112827))

(assert (=> b!101865 m!112811))

(assert (=> b!101865 m!112827))

(declare-fun m!112829 () Bool)

(assert (=> b!101865 m!112829))

(declare-fun m!112831 () Bool)

(assert (=> b!101865 m!112831))

(assert (=> b!101865 m!112793))

(assert (=> b!101865 m!112823))

(declare-fun m!112833 () Bool)

(assert (=> b!101865 m!112833))

(declare-fun m!112835 () Bool)

(assert (=> b!101865 m!112835))

(assert (=> b!101857 m!112787))

(declare-fun m!112837 () Bool)

(assert (=> b!101857 m!112837))

(declare-fun m!112839 () Bool)

(assert (=> b!101857 m!112839))

(declare-fun m!112841 () Bool)

(assert (=> b!101857 m!112841))

(declare-fun m!112843 () Bool)

(assert (=> b!101857 m!112843))

(assert (=> b!101857 m!112839))

(assert (=> b!101857 m!112787))

(assert (=> b!101857 m!112841))

(declare-fun m!112845 () Bool)

(assert (=> bm!10609 m!112845))

(assert (=> d!27547 d!27569))

(assert (=> b!101595 d!27535))

(declare-fun d!27571 () Bool)

(assert (=> d!27571 (= (map!1267 (_2!1195 lt!51647)) (getCurrentListMap!480 (_keys!4236 (_2!1195 lt!51647)) (_values!2519 (_2!1195 lt!51647)) (mask!6659 (_2!1195 lt!51647)) (extraKeys!2347 (_2!1195 lt!51647)) (zeroValue!2414 (_2!1195 lt!51647)) (minValue!2414 (_2!1195 lt!51647)) #b00000000000000000000000000000000 (defaultEntry!2536 (_2!1195 lt!51647))))))

(declare-fun bs!4209 () Bool)

(assert (= bs!4209 d!27571))

(declare-fun m!112847 () Bool)

(assert (=> bs!4209 m!112847))

(assert (=> bm!10602 d!27571))

(declare-fun b!101879 () Bool)

(declare-fun res!51007 () Bool)

(declare-fun e!66314 () Bool)

(assert (=> b!101879 (=> (not res!51007) (not e!66314))))

(declare-fun size!2290 (LongMapFixedSize!870) (_ BitVec 32))

(assert (=> b!101879 (= res!51007 (bvsge (size!2290 newMap!16) (_size!484 newMap!16)))))

(declare-fun b!101880 () Bool)

(declare-fun res!51006 () Bool)

(assert (=> b!101880 (=> (not res!51006) (not e!66314))))

(assert (=> b!101880 (= res!51006 (= (size!2290 newMap!16) (bvadd (_size!484 newMap!16) (bvsdiv (bvadd (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!101881 () Bool)

(assert (=> b!101881 (= e!66314 (and (bvsge (extraKeys!2347 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2347 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!484 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!27573 () Bool)

(declare-fun res!51009 () Bool)

(assert (=> d!27573 (=> (not res!51009) (not e!66314))))

(assert (=> d!27573 (= res!51009 (validMask!0 (mask!6659 newMap!16)))))

(assert (=> d!27573 (= (simpleValid!71 newMap!16) e!66314)))

(declare-fun b!101878 () Bool)

(declare-fun res!51008 () Bool)

(assert (=> b!101878 (=> (not res!51008) (not e!66314))))

(assert (=> b!101878 (= res!51008 (and (= (size!2287 (_values!2519 newMap!16)) (bvadd (mask!6659 newMap!16) #b00000000000000000000000000000001)) (= (size!2286 (_keys!4236 newMap!16)) (size!2287 (_values!2519 newMap!16))) (bvsge (_size!484 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!484 newMap!16) (bvadd (mask!6659 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!27573 res!51009) b!101878))

(assert (= (and b!101878 res!51008) b!101879))

(assert (= (and b!101879 res!51007) b!101880))

(assert (= (and b!101880 res!51006) b!101881))

(declare-fun m!112849 () Bool)

(assert (=> b!101879 m!112849))

(assert (=> b!101880 m!112849))

(assert (=> d!27573 m!112799))

(assert (=> d!27541 d!27573))

(declare-fun d!27575 () Bool)

(declare-fun e!66317 () Bool)

(assert (=> d!27575 e!66317))

(declare-fun res!51014 () Bool)

(assert (=> d!27575 (=> (not res!51014) (not e!66317))))

(declare-fun lt!51713 () SeekEntryResult!256)

(assert (=> d!27575 (= res!51014 ((_ is Found!256) lt!51713))))

(assert (=> d!27575 (= lt!51713 (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun lt!51714 () Unit!3088)

(declare-fun choose!626 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) Int) Unit!3088)

(assert (=> d!27575 (= lt!51714 (choose!626 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27575 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27575 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)) lt!51714)))

(declare-fun b!101886 () Bool)

(declare-fun res!51015 () Bool)

(assert (=> b!101886 (=> (not res!51015) (not e!66317))))

(assert (=> b!101886 (= res!51015 (inRange!0 (index!3171 lt!51713) (mask!6659 newMap!16)))))

(declare-fun b!101887 () Bool)

(assert (=> b!101887 (= e!66317 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51713)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> b!101887 (and (bvsge (index!3171 lt!51713) #b00000000000000000000000000000000) (bvslt (index!3171 lt!51713) (size!2286 (_keys!4236 newMap!16))))))

(assert (= (and d!27575 res!51014) b!101886))

(assert (= (and b!101886 res!51015) b!101887))

(assert (=> d!27575 m!112527))

(assert (=> d!27575 m!112713))

(assert (=> d!27575 m!112527))

(declare-fun m!112851 () Bool)

(assert (=> d!27575 m!112851))

(assert (=> d!27575 m!112799))

(declare-fun m!112853 () Bool)

(assert (=> b!101886 m!112853))

(declare-fun m!112855 () Bool)

(assert (=> b!101887 m!112855))

(assert (=> bm!10583 d!27575))

(declare-fun d!27577 () Bool)

(assert (=> d!27577 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 #b00000000000000000000000000000000)))

(declare-fun lt!51717 () Unit!3088)

(declare-fun choose!13 (array!4283 (_ BitVec 64) (_ BitVec 32)) Unit!3088)

(assert (=> d!27577 (= lt!51717 (choose!13 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 #b00000000000000000000000000000000))))

(assert (=> d!27577 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!27577 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 #b00000000000000000000000000000000) lt!51717)))

(declare-fun bs!4210 () Bool)

(assert (= bs!4210 d!27577))

(assert (=> bs!4210 m!112771))

(declare-fun m!112857 () Bool)

(assert (=> bs!4210 m!112857))

(assert (=> b!101835 d!27577))

(declare-fun d!27579 () Bool)

(declare-fun res!51016 () Bool)

(declare-fun e!66318 () Bool)

(assert (=> d!27579 (=> res!51016 e!66318)))

(assert (=> d!27579 (= res!51016 (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) lt!51681))))

(assert (=> d!27579 (= (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 #b00000000000000000000000000000000) e!66318)))

(declare-fun b!101888 () Bool)

(declare-fun e!66319 () Bool)

(assert (=> b!101888 (= e!66318 e!66319)))

(declare-fun res!51017 () Bool)

(assert (=> b!101888 (=> (not res!51017) (not e!66319))))

(assert (=> b!101888 (= res!51017 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!101889 () Bool)

(assert (=> b!101889 (= e!66319 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51681 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27579 (not res!51016)) b!101888))

(assert (= (and b!101888 res!51017) b!101889))

(assert (=> d!27579 m!112689))

(declare-fun m!112859 () Bool)

(assert (=> b!101889 m!112859))

(assert (=> b!101835 d!27579))

(declare-fun b!101902 () Bool)

(declare-fun e!66327 () SeekEntryResult!256)

(assert (=> b!101902 (= e!66327 Undefined!256)))

(declare-fun b!101903 () Bool)

(declare-fun e!66326 () SeekEntryResult!256)

(declare-fun lt!51725 () SeekEntryResult!256)

(assert (=> b!101903 (= e!66326 (MissingZero!256 (index!3172 lt!51725)))))

(declare-fun d!27581 () Bool)

(declare-fun lt!51724 () SeekEntryResult!256)

(assert (=> d!27581 (and (or ((_ is Undefined!256) lt!51724) (not ((_ is Found!256) lt!51724)) (and (bvsge (index!3171 lt!51724) #b00000000000000000000000000000000) (bvslt (index!3171 lt!51724) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))) (or ((_ is Undefined!256) lt!51724) ((_ is Found!256) lt!51724) (not ((_ is MissingZero!256) lt!51724)) (and (bvsge (index!3170 lt!51724) #b00000000000000000000000000000000) (bvslt (index!3170 lt!51724) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))) (or ((_ is Undefined!256) lt!51724) ((_ is Found!256) lt!51724) ((_ is MissingZero!256) lt!51724) (not ((_ is MissingVacant!256) lt!51724)) (and (bvsge (index!3173 lt!51724) #b00000000000000000000000000000000) (bvslt (index!3173 lt!51724) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))) (or ((_ is Undefined!256) lt!51724) (ite ((_ is Found!256) lt!51724) (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (index!3171 lt!51724)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!256) lt!51724) (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (index!3170 lt!51724)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!256) lt!51724) (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (index!3173 lt!51724)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27581 (= lt!51724 e!66327)))

(declare-fun c!17549 () Bool)

(assert (=> d!27581 (= c!17549 (and ((_ is Intermediate!256) lt!51725) (undefined!1068 lt!51725)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4283 (_ BitVec 32)) SeekEntryResult!256)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!27581 (= lt!51725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) (mask!6659 (v!2844 (underlying!346 thiss!992)))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(assert (=> d!27581 (validMask!0 (mask!6659 (v!2844 (underlying!346 thiss!992))))))

(assert (=> d!27581 (= (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))) lt!51724)))

(declare-fun b!101904 () Bool)

(declare-fun c!17548 () Bool)

(declare-fun lt!51726 () (_ BitVec 64))

(assert (=> b!101904 (= c!17548 (= lt!51726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66328 () SeekEntryResult!256)

(assert (=> b!101904 (= e!66328 e!66326)))

(declare-fun b!101905 () Bool)

(assert (=> b!101905 (= e!66328 (Found!256 (index!3172 lt!51725)))))

(declare-fun b!101906 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4283 (_ BitVec 32)) SeekEntryResult!256)

(assert (=> b!101906 (= e!66326 (seekKeyOrZeroReturnVacant!0 (x!13339 lt!51725) (index!3172 lt!51725) (index!3172 lt!51725) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!101907 () Bool)

(assert (=> b!101907 (= e!66327 e!66328)))

(assert (=> b!101907 (= lt!51726 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (index!3172 lt!51725)))))

(declare-fun c!17550 () Bool)

(assert (=> b!101907 (= c!17550 (= lt!51726 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!27581 c!17549) b!101902))

(assert (= (and d!27581 (not c!17549)) b!101907))

(assert (= (and b!101907 c!17550) b!101905))

(assert (= (and b!101907 (not c!17550)) b!101904))

(assert (= (and b!101904 c!17548) b!101903))

(assert (= (and b!101904 (not c!17548)) b!101906))

(assert (=> d!27581 m!112557))

(declare-fun m!112861 () Bool)

(assert (=> d!27581 m!112861))

(declare-fun m!112863 () Bool)

(assert (=> d!27581 m!112863))

(assert (=> d!27581 m!112689))

(declare-fun m!112865 () Bool)

(assert (=> d!27581 m!112865))

(declare-fun m!112867 () Bool)

(assert (=> d!27581 m!112867))

(assert (=> d!27581 m!112689))

(assert (=> d!27581 m!112863))

(declare-fun m!112869 () Bool)

(assert (=> d!27581 m!112869))

(assert (=> b!101906 m!112689))

(declare-fun m!112871 () Bool)

(assert (=> b!101906 m!112871))

(declare-fun m!112873 () Bool)

(assert (=> b!101907 m!112873))

(assert (=> b!101835 d!27581))

(declare-fun d!27583 () Bool)

(declare-fun get!1305 (Option!159) V!3179)

(assert (=> d!27583 (= (apply!95 lt!51566 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1305 (getValueByKey!153 (toList!790 lt!51566) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4211 () Bool)

(assert (= bs!4211 d!27583))

(assert (=> bs!4211 m!112613))

(declare-fun m!112875 () Bool)

(assert (=> bs!4211 m!112875))

(assert (=> bs!4211 m!112875))

(declare-fun m!112877 () Bool)

(assert (=> bs!4211 m!112877))

(assert (=> b!101671 d!27583))

(declare-fun d!27585 () Bool)

(declare-fun c!17551 () Bool)

(assert (=> d!27585 (= c!17551 ((_ is ValueCellFull!981) (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!66329 () V!3179)

(assert (=> d!27585 (= (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66329)))

(declare-fun b!101908 () Bool)

(assert (=> b!101908 (= e!66329 (get!1303 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101909 () Bool)

(assert (=> b!101909 (= e!66329 (get!1304 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27585 c!17551) b!101908))

(assert (= (and d!27585 (not c!17551)) b!101909))

(assert (=> b!101908 m!112683))

(assert (=> b!101908 m!112523))

(declare-fun m!112879 () Bool)

(assert (=> b!101908 m!112879))

(assert (=> b!101909 m!112683))

(assert (=> b!101909 m!112523))

(declare-fun m!112881 () Bool)

(assert (=> b!101909 m!112881))

(assert (=> b!101671 d!27585))

(declare-fun b!101910 () Bool)

(declare-fun e!66331 () SeekEntryResult!256)

(assert (=> b!101910 (= e!66331 Undefined!256)))

(declare-fun b!101911 () Bool)

(declare-fun e!66330 () SeekEntryResult!256)

(declare-fun lt!51728 () SeekEntryResult!256)

(assert (=> b!101911 (= e!66330 (MissingZero!256 (index!3172 lt!51728)))))

(declare-fun d!27587 () Bool)

(declare-fun lt!51727 () SeekEntryResult!256)

(assert (=> d!27587 (and (or ((_ is Undefined!256) lt!51727) (not ((_ is Found!256) lt!51727)) (and (bvsge (index!3171 lt!51727) #b00000000000000000000000000000000) (bvslt (index!3171 lt!51727) (size!2286 (_keys!4236 newMap!16))))) (or ((_ is Undefined!256) lt!51727) ((_ is Found!256) lt!51727) (not ((_ is MissingZero!256) lt!51727)) (and (bvsge (index!3170 lt!51727) #b00000000000000000000000000000000) (bvslt (index!3170 lt!51727) (size!2286 (_keys!4236 newMap!16))))) (or ((_ is Undefined!256) lt!51727) ((_ is Found!256) lt!51727) ((_ is MissingZero!256) lt!51727) (not ((_ is MissingVacant!256) lt!51727)) (and (bvsge (index!3173 lt!51727) #b00000000000000000000000000000000) (bvslt (index!3173 lt!51727) (size!2286 (_keys!4236 newMap!16))))) (or ((_ is Undefined!256) lt!51727) (ite ((_ is Found!256) lt!51727) (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51727)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (ite ((_ is MissingZero!256) lt!51727) (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3170 lt!51727)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!256) lt!51727) (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3173 lt!51727)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27587 (= lt!51727 e!66331)))

(declare-fun c!17553 () Bool)

(assert (=> d!27587 (= c!17553 (and ((_ is Intermediate!256) lt!51728) (undefined!1068 lt!51728)))))

(assert (=> d!27587 (= lt!51728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (mask!6659 newMap!16)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(assert (=> d!27587 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27587 (= (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)) lt!51727)))

(declare-fun b!101912 () Bool)

(declare-fun c!17552 () Bool)

(declare-fun lt!51729 () (_ BitVec 64))

(assert (=> b!101912 (= c!17552 (= lt!51729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66332 () SeekEntryResult!256)

(assert (=> b!101912 (= e!66332 e!66330)))

(declare-fun b!101913 () Bool)

(assert (=> b!101913 (= e!66332 (Found!256 (index!3172 lt!51728)))))

(declare-fun b!101914 () Bool)

(assert (=> b!101914 (= e!66330 (seekKeyOrZeroReturnVacant!0 (x!13339 lt!51728) (index!3172 lt!51728) (index!3172 lt!51728) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun b!101915 () Bool)

(assert (=> b!101915 (= e!66331 e!66332)))

(assert (=> b!101915 (= lt!51729 (select (arr!2033 (_keys!4236 newMap!16)) (index!3172 lt!51728)))))

(declare-fun c!17554 () Bool)

(assert (=> b!101915 (= c!17554 (= lt!51729 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (= (and d!27587 c!17553) b!101910))

(assert (= (and d!27587 (not c!17553)) b!101915))

(assert (= (and b!101915 c!17554) b!101913))

(assert (= (and b!101915 (not c!17554)) b!101912))

(assert (= (and b!101912 c!17552) b!101911))

(assert (= (and b!101912 (not c!17552)) b!101914))

(assert (=> d!27587 m!112799))

(declare-fun m!112883 () Bool)

(assert (=> d!27587 m!112883))

(declare-fun m!112885 () Bool)

(assert (=> d!27587 m!112885))

(assert (=> d!27587 m!112527))

(declare-fun m!112887 () Bool)

(assert (=> d!27587 m!112887))

(declare-fun m!112889 () Bool)

(assert (=> d!27587 m!112889))

(assert (=> d!27587 m!112527))

(assert (=> d!27587 m!112885))

(declare-fun m!112891 () Bool)

(assert (=> d!27587 m!112891))

(assert (=> b!101914 m!112527))

(declare-fun m!112893 () Bool)

(assert (=> b!101914 m!112893))

(declare-fun m!112895 () Bool)

(assert (=> b!101915 m!112895))

(assert (=> b!101812 d!27587))

(declare-fun b!101916 () Bool)

(declare-fun e!66333 () Bool)

(declare-fun call!10619 () Bool)

(assert (=> b!101916 (= e!66333 call!10619)))

(declare-fun bm!10616 () Bool)

(assert (=> bm!10616 (= call!10619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun b!101918 () Bool)

(declare-fun e!66335 () Bool)

(assert (=> b!101918 (= e!66335 call!10619)))

(declare-fun b!101919 () Bool)

(assert (=> b!101919 (= e!66335 e!66333)))

(declare-fun lt!51731 () (_ BitVec 64))

(assert (=> b!101919 (= lt!51731 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51730 () Unit!3088)

(assert (=> b!101919 (= lt!51730 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4236 newMap!16) lt!51731 #b00000000000000000000000000000000))))

(assert (=> b!101919 (arrayContainsKey!0 (_keys!4236 newMap!16) lt!51731 #b00000000000000000000000000000000)))

(declare-fun lt!51732 () Unit!3088)

(assert (=> b!101919 (= lt!51732 lt!51730)))

(declare-fun res!51019 () Bool)

(assert (=> b!101919 (= res!51019 (= (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000) (_keys!4236 newMap!16) (mask!6659 newMap!16)) (Found!256 #b00000000000000000000000000000000)))))

(assert (=> b!101919 (=> (not res!51019) (not e!66333))))

(declare-fun b!101917 () Bool)

(declare-fun e!66334 () Bool)

(assert (=> b!101917 (= e!66334 e!66335)))

(declare-fun c!17555 () Bool)

(assert (=> b!101917 (= c!17555 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!27589 () Bool)

(declare-fun res!51018 () Bool)

(assert (=> d!27589 (=> res!51018 e!66334)))

(assert (=> d!27589 (= res!51018 (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4236 newMap!16) (mask!6659 newMap!16)) e!66334)))

(assert (= (and d!27589 (not res!51018)) b!101917))

(assert (= (and b!101917 c!17555) b!101919))

(assert (= (and b!101917 (not c!17555)) b!101918))

(assert (= (and b!101919 res!51019) b!101916))

(assert (= (or b!101916 b!101918) bm!10616))

(declare-fun m!112897 () Bool)

(assert (=> bm!10616 m!112897))

(assert (=> b!101919 m!112787))

(declare-fun m!112899 () Bool)

(assert (=> b!101919 m!112899))

(declare-fun m!112901 () Bool)

(assert (=> b!101919 m!112901))

(assert (=> b!101919 m!112787))

(declare-fun m!112903 () Bool)

(assert (=> b!101919 m!112903))

(assert (=> b!101917 m!112787))

(assert (=> b!101917 m!112787))

(assert (=> b!101917 m!112791))

(assert (=> b!101619 d!27589))

(declare-fun d!27591 () Bool)

(declare-fun res!51020 () Bool)

(declare-fun e!66339 () Bool)

(assert (=> d!27591 (=> res!51020 e!66339)))

(assert (=> d!27591 (= res!51020 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27591 (= (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17486 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) Nil!1590) Nil!1590)) e!66339)))

(declare-fun b!101920 () Bool)

(declare-fun e!66337 () Bool)

(declare-fun e!66336 () Bool)

(assert (=> b!101920 (= e!66337 e!66336)))

(declare-fun c!17556 () Bool)

(assert (=> b!101920 (= c!17556 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!10620 () Bool)

(declare-fun bm!10617 () Bool)

(assert (=> bm!10617 (= call!10620 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17556 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!17486 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) Nil!1590) Nil!1590)) (ite c!17486 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) Nil!1590) Nil!1590))))))

(declare-fun b!101921 () Bool)

(assert (=> b!101921 (= e!66339 e!66337)))

(declare-fun res!51022 () Bool)

(assert (=> b!101921 (=> (not res!51022) (not e!66337))))

(declare-fun e!66338 () Bool)

(assert (=> b!101921 (= res!51022 (not e!66338))))

(declare-fun res!51021 () Bool)

(assert (=> b!101921 (=> (not res!51021) (not e!66338))))

(assert (=> b!101921 (= res!51021 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101922 () Bool)

(assert (=> b!101922 (= e!66338 (contains!814 (ite c!17486 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) Nil!1590) Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101923 () Bool)

(assert (=> b!101923 (= e!66336 call!10620)))

(declare-fun b!101924 () Bool)

(assert (=> b!101924 (= e!66336 call!10620)))

(assert (= (and d!27591 (not res!51020)) b!101921))

(assert (= (and b!101921 res!51021) b!101922))

(assert (= (and b!101921 res!51022) b!101920))

(assert (= (and b!101920 c!17556) b!101924))

(assert (= (and b!101920 (not c!17556)) b!101923))

(assert (= (or b!101924 b!101923) bm!10617))

(declare-fun m!112905 () Bool)

(assert (=> b!101920 m!112905))

(assert (=> b!101920 m!112905))

(declare-fun m!112907 () Bool)

(assert (=> b!101920 m!112907))

(assert (=> bm!10617 m!112905))

(declare-fun m!112909 () Bool)

(assert (=> bm!10617 m!112909))

(assert (=> b!101921 m!112905))

(assert (=> b!101921 m!112905))

(assert (=> b!101921 m!112907))

(assert (=> b!101922 m!112905))

(assert (=> b!101922 m!112905))

(declare-fun m!112911 () Bool)

(assert (=> b!101922 m!112911))

(assert (=> bm!10533 d!27591))

(declare-fun b!101925 () Bool)

(declare-fun e!66352 () ListLongMap!1549)

(declare-fun call!10625 () ListLongMap!1549)

(assert (=> b!101925 (= e!66352 call!10625)))

(declare-fun b!101926 () Bool)

(declare-fun e!66349 () Bool)

(declare-fun e!66340 () Bool)

(assert (=> b!101926 (= e!66349 e!66340)))

(declare-fun res!51027 () Bool)

(declare-fun call!10627 () Bool)

(assert (=> b!101926 (= res!51027 call!10627)))

(assert (=> b!101926 (=> (not res!51027) (not e!66340))))

(declare-fun b!101927 () Bool)

(declare-fun res!51028 () Bool)

(declare-fun e!66343 () Bool)

(assert (=> b!101927 (=> (not res!51028) (not e!66343))))

(declare-fun e!66341 () Bool)

(assert (=> b!101927 (= res!51028 e!66341)))

(declare-fun c!17558 () Bool)

(assert (=> b!101927 (= c!17558 (not (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101928 () Bool)

(declare-fun e!66348 () ListLongMap!1549)

(declare-fun e!66342 () ListLongMap!1549)

(assert (=> b!101928 (= e!66348 e!66342)))

(declare-fun c!17560 () Bool)

(assert (=> b!101928 (= c!17560 (and (not (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101929 () Bool)

(declare-fun lt!51740 () ListLongMap!1549)

(assert (=> b!101929 (= e!66340 (= (apply!95 lt!51740 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2414 newMap!16)))))

(declare-fun call!10624 () ListLongMap!1549)

(declare-fun call!10622 () ListLongMap!1549)

(declare-fun call!10626 () ListLongMap!1549)

(declare-fun call!10623 () ListLongMap!1549)

(declare-fun c!17557 () Bool)

(declare-fun bm!10618 () Bool)

(assert (=> bm!10618 (= call!10623 (+!138 (ite c!17557 call!10622 (ite c!17560 call!10626 call!10624)) (ite (or c!17557 c!17560) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 newMap!16)))))))

(declare-fun d!27593 () Bool)

(assert (=> d!27593 e!66343))

(declare-fun res!51023 () Bool)

(assert (=> d!27593 (=> (not res!51023) (not e!66343))))

(assert (=> d!27593 (= res!51023 (or (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))))

(declare-fun lt!51734 () ListLongMap!1549)

(assert (=> d!27593 (= lt!51740 lt!51734)))

(declare-fun lt!51739 () Unit!3088)

(declare-fun e!66344 () Unit!3088)

(assert (=> d!27593 (= lt!51739 e!66344)))

(declare-fun c!17562 () Bool)

(declare-fun e!66346 () Bool)

(assert (=> d!27593 (= c!17562 e!66346)))

(declare-fun res!51024 () Bool)

(assert (=> d!27593 (=> (not res!51024) (not e!66346))))

(assert (=> d!27593 (= res!51024 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27593 (= lt!51734 e!66348)))

(assert (=> d!27593 (= c!17557 (and (not (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27593 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27593 (= (getCurrentListMap!480 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) lt!51740)))

(declare-fun bm!10619 () Bool)

(declare-fun call!10621 () Bool)

(assert (=> bm!10619 (= call!10621 (contains!813 lt!51740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101930 () Bool)

(assert (=> b!101930 (= e!66341 (not call!10621))))

(declare-fun b!101931 () Bool)

(assert (=> b!101931 (= e!66349 (not call!10627))))

(declare-fun bm!10620 () Bool)

(assert (=> bm!10620 (= call!10625 call!10623)))

(declare-fun bm!10621 () Bool)

(assert (=> bm!10621 (= call!10627 (contains!813 lt!51740 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101932 () Bool)

(declare-fun Unit!3102 () Unit!3088)

(assert (=> b!101932 (= e!66344 Unit!3102)))

(declare-fun b!101933 () Bool)

(declare-fun e!66350 () Bool)

(assert (=> b!101933 (= e!66350 (= (apply!95 lt!51740 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2034 (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2536 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2287 (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))))))))

(assert (=> b!101933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun bm!10622 () Bool)

(assert (=> bm!10622 (= call!10624 call!10626)))

(declare-fun b!101934 () Bool)

(declare-fun e!66351 () Bool)

(assert (=> b!101934 (= e!66351 e!66350)))

(declare-fun res!51029 () Bool)

(assert (=> b!101934 (=> (not res!51029) (not e!66350))))

(assert (=> b!101934 (= res!51029 (contains!813 lt!51740 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!101935 () Bool)

(assert (=> b!101935 (= e!66346 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101936 () Bool)

(assert (=> b!101936 (= e!66348 (+!138 call!10623 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 newMap!16))))))

(declare-fun b!101937 () Bool)

(declare-fun e!66345 () Bool)

(assert (=> b!101937 (= e!66341 e!66345)))

(declare-fun res!51030 () Bool)

(assert (=> b!101937 (= res!51030 call!10621)))

(assert (=> b!101937 (=> (not res!51030) (not e!66345))))

(declare-fun b!101938 () Bool)

(declare-fun res!51025 () Bool)

(assert (=> b!101938 (=> (not res!51025) (not e!66343))))

(assert (=> b!101938 (= res!51025 e!66351)))

(declare-fun res!51031 () Bool)

(assert (=> b!101938 (=> res!51031 e!66351)))

(declare-fun e!66347 () Bool)

(assert (=> b!101938 (= res!51031 (not e!66347))))

(declare-fun res!51026 () Bool)

(assert (=> b!101938 (=> (not res!51026) (not e!66347))))

(assert (=> b!101938 (= res!51026 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!101939 () Bool)

(assert (=> b!101939 (= e!66342 call!10625)))

(declare-fun b!101940 () Bool)

(assert (=> b!101940 (= e!66343 e!66349)))

(declare-fun c!17561 () Bool)

(assert (=> b!101940 (= c!17561 (not (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101941 () Bool)

(declare-fun lt!51735 () Unit!3088)

(assert (=> b!101941 (= e!66344 lt!51735)))

(declare-fun lt!51736 () ListLongMap!1549)

(assert (=> b!101941 (= lt!51736 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51750 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51750 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51745 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51745 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51737 () Unit!3088)

(assert (=> b!101941 (= lt!51737 (addStillContains!71 lt!51736 lt!51750 (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) lt!51745))))

(assert (=> b!101941 (contains!813 (+!138 lt!51736 (tuple2!2367 lt!51750 (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)))) lt!51745)))

(declare-fun lt!51738 () Unit!3088)

(assert (=> b!101941 (= lt!51738 lt!51737)))

(declare-fun lt!51742 () ListLongMap!1549)

(assert (=> b!101941 (= lt!51742 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51752 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51752 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51751 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51751 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51744 () Unit!3088)

(assert (=> b!101941 (= lt!51744 (addApplyDifferent!71 lt!51742 lt!51752 (minValue!2414 newMap!16) lt!51751))))

(assert (=> b!101941 (= (apply!95 (+!138 lt!51742 (tuple2!2367 lt!51752 (minValue!2414 newMap!16))) lt!51751) (apply!95 lt!51742 lt!51751))))

(declare-fun lt!51754 () Unit!3088)

(assert (=> b!101941 (= lt!51754 lt!51744)))

(declare-fun lt!51749 () ListLongMap!1549)

(assert (=> b!101941 (= lt!51749 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51733 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51748 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51748 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51753 () Unit!3088)

(assert (=> b!101941 (= lt!51753 (addApplyDifferent!71 lt!51749 lt!51733 (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) lt!51748))))

(assert (=> b!101941 (= (apply!95 (+!138 lt!51749 (tuple2!2367 lt!51733 (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)))) lt!51748) (apply!95 lt!51749 lt!51748))))

(declare-fun lt!51743 () Unit!3088)

(assert (=> b!101941 (= lt!51743 lt!51753)))

(declare-fun lt!51741 () ListLongMap!1549)

(assert (=> b!101941 (= lt!51741 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51747 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51747 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51746 () (_ BitVec 64))

(assert (=> b!101941 (= lt!51746 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101941 (= lt!51735 (addApplyDifferent!71 lt!51741 lt!51747 (minValue!2414 newMap!16) lt!51746))))

(assert (=> b!101941 (= (apply!95 (+!138 lt!51741 (tuple2!2367 lt!51747 (minValue!2414 newMap!16))) lt!51746) (apply!95 lt!51741 lt!51746))))

(declare-fun bm!10623 () Bool)

(assert (=> bm!10623 (= call!10622 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17522 (_values!2519 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16)))) (mask!6659 newMap!16) (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun bm!10624 () Bool)

(assert (=> bm!10624 (= call!10626 call!10622)))

(declare-fun b!101942 () Bool)

(assert (=> b!101942 (= e!66352 call!10624)))

(declare-fun b!101943 () Bool)

(assert (=> b!101943 (= e!66345 (= (apply!95 lt!51740 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!17522 c!17528) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2414 newMap!16))))))

(declare-fun b!101944 () Bool)

(assert (=> b!101944 (= e!66347 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!17559 () Bool)

(declare-fun b!101945 () Bool)

(assert (=> b!101945 (= c!17559 (and (not (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!17522 c!17528) lt!51666 (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101945 (= e!66342 e!66352)))

(assert (= (and d!27593 c!17557) b!101936))

(assert (= (and d!27593 (not c!17557)) b!101928))

(assert (= (and b!101928 c!17560) b!101939))

(assert (= (and b!101928 (not c!17560)) b!101945))

(assert (= (and b!101945 c!17559) b!101925))

(assert (= (and b!101945 (not c!17559)) b!101942))

(assert (= (or b!101925 b!101942) bm!10622))

(assert (= (or b!101939 bm!10622) bm!10624))

(assert (= (or b!101939 b!101925) bm!10620))

(assert (= (or b!101936 bm!10624) bm!10623))

(assert (= (or b!101936 bm!10620) bm!10618))

(assert (= (and d!27593 res!51024) b!101935))

(assert (= (and d!27593 c!17562) b!101941))

(assert (= (and d!27593 (not c!17562)) b!101932))

(assert (= (and d!27593 res!51023) b!101938))

(assert (= (and b!101938 res!51026) b!101944))

(assert (= (and b!101938 (not res!51031)) b!101934))

(assert (= (and b!101934 res!51029) b!101933))

(assert (= (and b!101938 res!51025) b!101927))

(assert (= (and b!101927 c!17558) b!101937))

(assert (= (and b!101927 (not c!17558)) b!101930))

(assert (= (and b!101937 res!51030) b!101943))

(assert (= (or b!101937 b!101930) bm!10619))

(assert (= (and b!101927 res!51028) b!101940))

(assert (= (and b!101940 c!17561) b!101926))

(assert (= (and b!101940 (not c!17561)) b!101931))

(assert (= (and b!101926 res!51027) b!101929))

(assert (= (or b!101926 b!101931) bm!10621))

(declare-fun b_lambda!4561 () Bool)

(assert (=> (not b_lambda!4561) (not b!101933)))

(assert (=> b!101933 t!5610))

(declare-fun b_and!6275 () Bool)

(assert (= b_and!6271 (and (=> t!5610 result!3355) b_and!6275)))

(assert (=> b!101933 t!5612))

(declare-fun b_and!6277 () Bool)

(assert (= b_and!6273 (and (=> t!5612 result!3357) b_and!6277)))

(assert (=> b!101934 m!112787))

(assert (=> b!101934 m!112787))

(declare-fun m!112913 () Bool)

(assert (=> b!101934 m!112913))

(assert (=> b!101944 m!112787))

(assert (=> b!101944 m!112787))

(assert (=> b!101944 m!112791))

(declare-fun m!112915 () Bool)

(assert (=> bm!10623 m!112915))

(declare-fun m!112917 () Bool)

(assert (=> bm!10619 m!112917))

(declare-fun m!112919 () Bool)

(assert (=> bm!10621 m!112919))

(assert (=> d!27593 m!112799))

(declare-fun m!112921 () Bool)

(assert (=> b!101929 m!112921))

(declare-fun m!112923 () Bool)

(assert (=> b!101936 m!112923))

(declare-fun m!112925 () Bool)

(assert (=> b!101943 m!112925))

(assert (=> b!101935 m!112787))

(assert (=> b!101935 m!112787))

(assert (=> b!101935 m!112791))

(declare-fun m!112927 () Bool)

(assert (=> b!101941 m!112927))

(assert (=> b!101941 m!112787))

(assert (=> b!101941 m!112927))

(declare-fun m!112929 () Bool)

(assert (=> b!101941 m!112929))

(declare-fun m!112931 () Bool)

(assert (=> b!101941 m!112931))

(declare-fun m!112933 () Bool)

(assert (=> b!101941 m!112933))

(declare-fun m!112935 () Bool)

(assert (=> b!101941 m!112935))

(declare-fun m!112937 () Bool)

(assert (=> b!101941 m!112937))

(declare-fun m!112939 () Bool)

(assert (=> b!101941 m!112939))

(declare-fun m!112941 () Bool)

(assert (=> b!101941 m!112941))

(declare-fun m!112943 () Bool)

(assert (=> b!101941 m!112943))

(declare-fun m!112945 () Bool)

(assert (=> b!101941 m!112945))

(declare-fun m!112947 () Bool)

(assert (=> b!101941 m!112947))

(assert (=> b!101941 m!112931))

(assert (=> b!101941 m!112947))

(declare-fun m!112949 () Bool)

(assert (=> b!101941 m!112949))

(declare-fun m!112951 () Bool)

(assert (=> b!101941 m!112951))

(assert (=> b!101941 m!112915))

(assert (=> b!101941 m!112943))

(declare-fun m!112953 () Bool)

(assert (=> b!101941 m!112953))

(declare-fun m!112955 () Bool)

(assert (=> b!101941 m!112955))

(assert (=> b!101933 m!112787))

(declare-fun m!112957 () Bool)

(assert (=> b!101933 m!112957))

(declare-fun m!112959 () Bool)

(assert (=> b!101933 m!112959))

(assert (=> b!101933 m!112841))

(declare-fun m!112961 () Bool)

(assert (=> b!101933 m!112961))

(assert (=> b!101933 m!112959))

(assert (=> b!101933 m!112787))

(assert (=> b!101933 m!112841))

(declare-fun m!112963 () Bool)

(assert (=> bm!10618 m!112963))

(assert (=> bm!10586 d!27593))

(declare-fun d!27595 () Bool)

(declare-fun e!66354 () Bool)

(assert (=> d!27595 e!66354))

(declare-fun res!51032 () Bool)

(assert (=> d!27595 (=> res!51032 e!66354)))

(declare-fun lt!51758 () Bool)

(assert (=> d!27595 (= res!51032 (not lt!51758))))

(declare-fun lt!51757 () Bool)

(assert (=> d!27595 (= lt!51758 lt!51757)))

(declare-fun lt!51755 () Unit!3088)

(declare-fun e!66353 () Unit!3088)

(assert (=> d!27595 (= lt!51755 e!66353)))

(declare-fun c!17563 () Bool)

(assert (=> d!27595 (= c!17563 lt!51757)))

(assert (=> d!27595 (= lt!51757 (containsKey!157 (toList!790 lt!51566) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!27595 (= (contains!813 lt!51566 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!51758)))

(declare-fun b!101946 () Bool)

(declare-fun lt!51756 () Unit!3088)

(assert (=> b!101946 (= e!66353 lt!51756)))

(assert (=> b!101946 (= lt!51756 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 lt!51566) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101946 (isDefined!106 (getValueByKey!153 (toList!790 lt!51566) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101947 () Bool)

(declare-fun Unit!3103 () Unit!3088)

(assert (=> b!101947 (= e!66353 Unit!3103)))

(declare-fun b!101948 () Bool)

(assert (=> b!101948 (= e!66354 (isDefined!106 (getValueByKey!153 (toList!790 lt!51566) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!27595 c!17563) b!101946))

(assert (= (and d!27595 (not c!17563)) b!101947))

(assert (= (and d!27595 (not res!51032)) b!101948))

(assert (=> d!27595 m!112613))

(declare-fun m!112965 () Bool)

(assert (=> d!27595 m!112965))

(assert (=> b!101946 m!112613))

(declare-fun m!112967 () Bool)

(assert (=> b!101946 m!112967))

(assert (=> b!101946 m!112613))

(assert (=> b!101946 m!112875))

(assert (=> b!101946 m!112875))

(declare-fun m!112969 () Bool)

(assert (=> b!101946 m!112969))

(assert (=> b!101948 m!112613))

(assert (=> b!101948 m!112875))

(assert (=> b!101948 m!112875))

(assert (=> b!101948 m!112969))

(assert (=> b!101672 d!27595))

(assert (=> d!27549 d!27529))

(declare-fun d!27597 () Bool)

(assert (=> d!27597 (= (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (and (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101607 d!27597))

(declare-fun d!27599 () Bool)

(declare-fun lt!51761 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!106 (List!1593) (InoxSet (_ BitVec 64)))

(assert (=> d!27599 (= lt!51761 (select (content!106 Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!66360 () Bool)

(assert (=> d!27599 (= lt!51761 e!66360)))

(declare-fun res!51037 () Bool)

(assert (=> d!27599 (=> (not res!51037) (not e!66360))))

(assert (=> d!27599 (= res!51037 ((_ is Cons!1589) Nil!1590))))

(assert (=> d!27599 (= (contains!814 Nil!1590 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)) lt!51761)))

(declare-fun b!101953 () Bool)

(declare-fun e!66359 () Bool)

(assert (=> b!101953 (= e!66360 e!66359)))

(declare-fun res!51038 () Bool)

(assert (=> b!101953 (=> res!51038 e!66359)))

(assert (=> b!101953 (= res!51038 (= (h!2185 Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101954 () Bool)

(assert (=> b!101954 (= e!66359 (contains!814 (t!5603 Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!27599 res!51037) b!101953))

(assert (= (and b!101953 (not res!51038)) b!101954))

(declare-fun m!112971 () Bool)

(assert (=> d!27599 m!112971))

(assert (=> d!27599 m!112689))

(declare-fun m!112973 () Bool)

(assert (=> d!27599 m!112973))

(assert (=> b!101954 m!112689))

(declare-fun m!112975 () Bool)

(assert (=> b!101954 m!112975))

(assert (=> b!101686 d!27599))

(declare-fun d!27601 () Bool)

(assert (=> d!27601 (= (+!138 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) lt!51666 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51764 () Unit!3088)

(declare-fun choose!627 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 V!3179 Int) Unit!3088)

(assert (=> d!27601 (= lt!51764 (choose!627 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) lt!51666 (zeroValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2414 newMap!16) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27601 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27601 (= (lemmaChangeZeroKeyThenAddPairToListMap!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) lt!51666 (zeroValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2414 newMap!16) (defaultEntry!2536 newMap!16)) lt!51764)))

(declare-fun bs!4212 () Bool)

(assert (= bs!4212 d!27601))

(assert (=> bs!4212 m!112525))

(declare-fun m!112977 () Bool)

(assert (=> bs!4212 m!112977))

(assert (=> bs!4212 m!112633))

(assert (=> bs!4212 m!112799))

(assert (=> bs!4212 m!112525))

(declare-fun m!112979 () Bool)

(assert (=> bs!4212 m!112979))

(assert (=> bs!4212 m!112633))

(declare-fun m!112981 () Bool)

(assert (=> bs!4212 m!112981))

(assert (=> b!101804 d!27601))

(declare-fun d!27603 () Bool)

(declare-fun e!66363 () Bool)

(assert (=> d!27603 e!66363))

(declare-fun res!51043 () Bool)

(assert (=> d!27603 (=> (not res!51043) (not e!66363))))

(declare-fun lt!51776 () ListLongMap!1549)

(assert (=> d!27603 (= res!51043 (contains!813 lt!51776 (_1!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun lt!51775 () List!1592)

(assert (=> d!27603 (= lt!51776 (ListLongMap!1550 lt!51775))))

(declare-fun lt!51773 () Unit!3088)

(declare-fun lt!51774 () Unit!3088)

(assert (=> d!27603 (= lt!51773 lt!51774)))

(assert (=> d!27603 (= (getValueByKey!153 lt!51775 (_1!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!69 (List!1592 (_ BitVec 64) V!3179) Unit!3088)

(assert (=> d!27603 (= lt!51774 (lemmaContainsTupThenGetReturnValue!69 lt!51775 (_1!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun insertStrictlySorted!72 (List!1592 (_ BitVec 64) V!3179) List!1592)

(assert (=> d!27603 (= lt!51775 (insertStrictlySorted!72 (toList!790 call!10531) (_1!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27603 (= (+!138 call!10531 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51776)))

(declare-fun b!101959 () Bool)

(declare-fun res!51044 () Bool)

(assert (=> b!101959 (=> (not res!51044) (not e!66363))))

(assert (=> b!101959 (= res!51044 (= (getValueByKey!153 (toList!790 lt!51776) (_1!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun b!101960 () Bool)

(declare-fun contains!815 (List!1592 tuple2!2366) Bool)

(assert (=> b!101960 (= e!66363 (contains!815 (toList!790 lt!51776) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))

(assert (= (and d!27603 res!51043) b!101959))

(assert (= (and b!101959 res!51044) b!101960))

(declare-fun m!112983 () Bool)

(assert (=> d!27603 m!112983))

(declare-fun m!112985 () Bool)

(assert (=> d!27603 m!112985))

(declare-fun m!112987 () Bool)

(assert (=> d!27603 m!112987))

(declare-fun m!112989 () Bool)

(assert (=> d!27603 m!112989))

(declare-fun m!112991 () Bool)

(assert (=> b!101959 m!112991))

(declare-fun m!112993 () Bool)

(assert (=> b!101960 m!112993))

(assert (=> b!101674 d!27603))

(declare-fun d!27605 () Bool)

(declare-fun res!51045 () Bool)

(declare-fun e!66364 () Bool)

(assert (=> d!27605 (=> (not res!51045) (not e!66364))))

(assert (=> d!27605 (= res!51045 (simpleValid!71 (_2!1195 lt!51647)))))

(assert (=> d!27605 (= (valid!398 (_2!1195 lt!51647)) e!66364)))

(declare-fun b!101961 () Bool)

(declare-fun res!51046 () Bool)

(assert (=> b!101961 (=> (not res!51046) (not e!66364))))

(assert (=> b!101961 (= res!51046 (= (arrayCountValidKeys!0 (_keys!4236 (_2!1195 lt!51647)) #b00000000000000000000000000000000 (size!2286 (_keys!4236 (_2!1195 lt!51647)))) (_size!484 (_2!1195 lt!51647))))))

(declare-fun b!101962 () Bool)

(declare-fun res!51047 () Bool)

(assert (=> b!101962 (=> (not res!51047) (not e!66364))))

(assert (=> b!101962 (= res!51047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4236 (_2!1195 lt!51647)) (mask!6659 (_2!1195 lt!51647))))))

(declare-fun b!101963 () Bool)

(assert (=> b!101963 (= e!66364 (arrayNoDuplicates!0 (_keys!4236 (_2!1195 lt!51647)) #b00000000000000000000000000000000 Nil!1590))))

(assert (= (and d!27605 res!51045) b!101961))

(assert (= (and b!101961 res!51046) b!101962))

(assert (= (and b!101962 res!51047) b!101963))

(declare-fun m!112995 () Bool)

(assert (=> d!27605 m!112995))

(declare-fun m!112997 () Bool)

(assert (=> b!101961 m!112997))

(declare-fun m!112999 () Bool)

(assert (=> b!101962 m!112999))

(declare-fun m!113001 () Bool)

(assert (=> b!101963 m!113001))

(assert (=> d!27559 d!27605))

(assert (=> d!27559 d!27541))

(declare-fun c!17568 () Bool)

(declare-fun bm!10629 () Bool)

(declare-fun call!10632 () Bool)

(declare-fun lt!51782 () SeekEntryResult!256)

(assert (=> bm!10629 (= call!10632 (inRange!0 (ite c!17568 (index!3170 lt!51782) (index!3173 lt!51782)) (mask!6659 newMap!16)))))

(declare-fun d!27607 () Bool)

(declare-fun e!66373 () Bool)

(assert (=> d!27607 e!66373))

(assert (=> d!27607 (= c!17568 ((_ is MissingZero!256) lt!51782))))

(assert (=> d!27607 (= lt!51782 (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun lt!51781 () Unit!3088)

(declare-fun choose!628 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) Int) Unit!3088)

(assert (=> d!27607 (= lt!51781 (choose!628 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27607 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27607 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)) lt!51781)))

(declare-fun b!101980 () Bool)

(declare-fun e!66376 () Bool)

(assert (=> b!101980 (= e!66373 e!66376)))

(declare-fun res!51058 () Bool)

(assert (=> b!101980 (= res!51058 call!10632)))

(assert (=> b!101980 (=> (not res!51058) (not e!66376))))

(declare-fun call!10633 () Bool)

(declare-fun bm!10630 () Bool)

(assert (=> bm!10630 (= call!10633 (arrayContainsKey!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101981 () Bool)

(declare-fun e!66375 () Bool)

(assert (=> b!101981 (= e!66375 ((_ is Undefined!256) lt!51782))))

(declare-fun b!101982 () Bool)

(declare-fun res!51057 () Bool)

(declare-fun e!66374 () Bool)

(assert (=> b!101982 (=> (not res!51057) (not e!66374))))

(assert (=> b!101982 (= res!51057 call!10632)))

(assert (=> b!101982 (= e!66375 e!66374)))

(declare-fun b!101983 () Bool)

(assert (=> b!101983 (= e!66376 (not call!10633))))

(declare-fun b!101984 () Bool)

(assert (=> b!101984 (= e!66374 (not call!10633))))

(declare-fun b!101985 () Bool)

(assert (=> b!101985 (and (bvsge (index!3170 lt!51782) #b00000000000000000000000000000000) (bvslt (index!3170 lt!51782) (size!2286 (_keys!4236 newMap!16))))))

(declare-fun res!51059 () Bool)

(assert (=> b!101985 (= res!51059 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3170 lt!51782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101985 (=> (not res!51059) (not e!66376))))

(declare-fun b!101986 () Bool)

(assert (=> b!101986 (= e!66373 e!66375)))

(declare-fun c!17569 () Bool)

(assert (=> b!101986 (= c!17569 ((_ is MissingVacant!256) lt!51782))))

(declare-fun b!101987 () Bool)

(declare-fun res!51056 () Bool)

(assert (=> b!101987 (=> (not res!51056) (not e!66374))))

(assert (=> b!101987 (= res!51056 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3173 lt!51782)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101987 (and (bvsge (index!3173 lt!51782) #b00000000000000000000000000000000) (bvslt (index!3173 lt!51782) (size!2286 (_keys!4236 newMap!16))))))

(assert (= (and d!27607 c!17568) b!101980))

(assert (= (and d!27607 (not c!17568)) b!101986))

(assert (= (and b!101980 res!51058) b!101985))

(assert (= (and b!101985 res!51059) b!101983))

(assert (= (and b!101986 c!17569) b!101982))

(assert (= (and b!101986 (not c!17569)) b!101981))

(assert (= (and b!101982 res!51057) b!101987))

(assert (= (and b!101987 res!51056) b!101984))

(assert (= (or b!101980 b!101982) bm!10629))

(assert (= (or b!101983 b!101984) bm!10630))

(assert (=> bm!10630 m!112527))

(assert (=> bm!10630 m!112755))

(declare-fun m!113003 () Bool)

(assert (=> b!101985 m!113003))

(assert (=> d!27607 m!112527))

(assert (=> d!27607 m!112713))

(assert (=> d!27607 m!112527))

(declare-fun m!113005 () Bool)

(assert (=> d!27607 m!113005))

(assert (=> d!27607 m!112799))

(declare-fun m!113007 () Bool)

(assert (=> bm!10629 m!113007))

(declare-fun m!113009 () Bool)

(assert (=> b!101987 m!113009))

(assert (=> bm!10605 d!27607))

(assert (=> b!101608 d!27597))

(assert (=> bm!10595 d!27587))

(declare-fun b!101988 () Bool)

(declare-fun e!66389 () ListLongMap!1549)

(declare-fun call!10638 () ListLongMap!1549)

(assert (=> b!101988 (= e!66389 call!10638)))

(declare-fun b!101989 () Bool)

(declare-fun e!66386 () Bool)

(declare-fun e!66377 () Bool)

(assert (=> b!101989 (= e!66386 e!66377)))

(declare-fun res!51064 () Bool)

(declare-fun call!10640 () Bool)

(assert (=> b!101989 (= res!51064 call!10640)))

(assert (=> b!101989 (=> (not res!51064) (not e!66377))))

(declare-fun b!101990 () Bool)

(declare-fun res!51065 () Bool)

(declare-fun e!66380 () Bool)

(assert (=> b!101990 (=> (not res!51065) (not e!66380))))

(declare-fun e!66378 () Bool)

(assert (=> b!101990 (= res!51065 e!66378)))

(declare-fun c!17571 () Bool)

(assert (=> b!101990 (= c!17571 (not (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101991 () Bool)

(declare-fun e!66385 () ListLongMap!1549)

(declare-fun e!66379 () ListLongMap!1549)

(assert (=> b!101991 (= e!66385 e!66379)))

(declare-fun c!17573 () Bool)

(assert (=> b!101991 (= c!17573 (and (not (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101992 () Bool)

(declare-fun lt!51790 () ListLongMap!1549)

(assert (=> b!101992 (= e!66377 (= (apply!95 lt!51790 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16))))))

(declare-fun bm!10631 () Bool)

(declare-fun call!10636 () ListLongMap!1549)

(declare-fun call!10639 () ListLongMap!1549)

(declare-fun call!10635 () ListLongMap!1549)

(declare-fun call!10637 () ListLongMap!1549)

(declare-fun c!17570 () Bool)

(assert (=> bm!10631 (= call!10636 (+!138 (ite c!17570 call!10635 (ite c!17573 call!10639 call!10637)) (ite (or c!17570 c!17573) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 newMap!16)) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16))))))))

(declare-fun d!27609 () Bool)

(assert (=> d!27609 e!66380))

(declare-fun res!51060 () Bool)

(assert (=> d!27609 (=> (not res!51060) (not e!66380))))

(assert (=> d!27609 (= res!51060 (or (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))))

(declare-fun lt!51784 () ListLongMap!1549)

(assert (=> d!27609 (= lt!51790 lt!51784)))

(declare-fun lt!51789 () Unit!3088)

(declare-fun e!66381 () Unit!3088)

(assert (=> d!27609 (= lt!51789 e!66381)))

(declare-fun c!17575 () Bool)

(declare-fun e!66383 () Bool)

(assert (=> d!27609 (= c!17575 e!66383)))

(declare-fun res!51061 () Bool)

(assert (=> d!27609 (=> (not res!51061) (not e!66383))))

(assert (=> d!27609 (= res!51061 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27609 (= lt!51784 e!66385)))

(assert (=> d!27609 (= c!17570 (and (not (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27609 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27609 (= (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) lt!51790)))

(declare-fun bm!10632 () Bool)

(declare-fun call!10634 () Bool)

(assert (=> bm!10632 (= call!10634 (contains!813 lt!51790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101993 () Bool)

(assert (=> b!101993 (= e!66378 (not call!10634))))

(declare-fun b!101994 () Bool)

(assert (=> b!101994 (= e!66386 (not call!10640))))

(declare-fun bm!10633 () Bool)

(assert (=> bm!10633 (= call!10638 call!10636)))

(declare-fun bm!10634 () Bool)

(assert (=> bm!10634 (= call!10640 (contains!813 lt!51790 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101995 () Bool)

(declare-fun Unit!3104 () Unit!3088)

(assert (=> b!101995 (= e!66381 Unit!3104)))

(declare-fun b!101996 () Bool)

(declare-fun e!66387 () Bool)

(assert (=> b!101996 (= e!66387 (= (apply!95 lt!51790 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2034 (_values!2519 newMap!16)) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2536 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101996 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2287 (_values!2519 newMap!16))))))

(assert (=> b!101996 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun bm!10635 () Bool)

(assert (=> bm!10635 (= call!10637 call!10639)))

(declare-fun b!101997 () Bool)

(declare-fun e!66388 () Bool)

(assert (=> b!101997 (= e!66388 e!66387)))

(declare-fun res!51066 () Bool)

(assert (=> b!101997 (=> (not res!51066) (not e!66387))))

(assert (=> b!101997 (= res!51066 (contains!813 lt!51790 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!101998 () Bool)

(assert (=> b!101998 (= e!66383 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101999 () Bool)

(assert (=> b!101999 (= e!66385 (+!138 call!10636 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)))))))

(declare-fun b!102000 () Bool)

(declare-fun e!66382 () Bool)

(assert (=> b!102000 (= e!66378 e!66382)))

(declare-fun res!51067 () Bool)

(assert (=> b!102000 (= res!51067 call!10634)))

(assert (=> b!102000 (=> (not res!51067) (not e!66382))))

(declare-fun b!102001 () Bool)

(declare-fun res!51062 () Bool)

(assert (=> b!102001 (=> (not res!51062) (not e!66380))))

(assert (=> b!102001 (= res!51062 e!66388)))

(declare-fun res!51068 () Bool)

(assert (=> b!102001 (=> res!51068 e!66388)))

(declare-fun e!66384 () Bool)

(assert (=> b!102001 (= res!51068 (not e!66384))))

(declare-fun res!51063 () Bool)

(assert (=> b!102001 (=> (not res!51063) (not e!66384))))

(assert (=> b!102001 (= res!51063 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!102002 () Bool)

(assert (=> b!102002 (= e!66379 call!10638)))

(declare-fun b!102003 () Bool)

(assert (=> b!102003 (= e!66380 e!66386)))

(declare-fun c!17574 () Bool)

(assert (=> b!102003 (= c!17574 (not (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102004 () Bool)

(declare-fun lt!51785 () Unit!3088)

(assert (=> b!102004 (= e!66381 lt!51785)))

(declare-fun lt!51786 () ListLongMap!1549)

(assert (=> b!102004 (= lt!51786 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51800 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51795 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51795 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51787 () Unit!3088)

(assert (=> b!102004 (= lt!51787 (addStillContains!71 lt!51786 lt!51800 (zeroValue!2414 newMap!16) lt!51795))))

(assert (=> b!102004 (contains!813 (+!138 lt!51786 (tuple2!2367 lt!51800 (zeroValue!2414 newMap!16))) lt!51795)))

(declare-fun lt!51788 () Unit!3088)

(assert (=> b!102004 (= lt!51788 lt!51787)))

(declare-fun lt!51792 () ListLongMap!1549)

(assert (=> b!102004 (= lt!51792 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51802 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51801 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51801 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51794 () Unit!3088)

(assert (=> b!102004 (= lt!51794 (addApplyDifferent!71 lt!51792 lt!51802 (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) lt!51801))))

(assert (=> b!102004 (= (apply!95 (+!138 lt!51792 (tuple2!2367 lt!51802 (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)))) lt!51801) (apply!95 lt!51792 lt!51801))))

(declare-fun lt!51804 () Unit!3088)

(assert (=> b!102004 (= lt!51804 lt!51794)))

(declare-fun lt!51799 () ListLongMap!1549)

(assert (=> b!102004 (= lt!51799 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51783 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51798 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51798 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51803 () Unit!3088)

(assert (=> b!102004 (= lt!51803 (addApplyDifferent!71 lt!51799 lt!51783 (zeroValue!2414 newMap!16) lt!51798))))

(assert (=> b!102004 (= (apply!95 (+!138 lt!51799 (tuple2!2367 lt!51783 (zeroValue!2414 newMap!16))) lt!51798) (apply!95 lt!51799 lt!51798))))

(declare-fun lt!51793 () Unit!3088)

(assert (=> b!102004 (= lt!51793 lt!51803)))

(declare-fun lt!51791 () ListLongMap!1549)

(assert (=> b!102004 (= lt!51791 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51797 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51796 () (_ BitVec 64))

(assert (=> b!102004 (= lt!51796 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102004 (= lt!51785 (addApplyDifferent!71 lt!51791 lt!51797 (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) lt!51796))))

(assert (=> b!102004 (= (apply!95 (+!138 lt!51791 (tuple2!2367 lt!51797 (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)))) lt!51796) (apply!95 lt!51791 lt!51796))))

(declare-fun bm!10636 () Bool)

(assert (=> bm!10636 (= call!10635 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) (zeroValue!2414 newMap!16) (ite c!17522 (ite c!17528 (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2414 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun bm!10637 () Bool)

(assert (=> bm!10637 (= call!10639 call!10635)))

(declare-fun b!102005 () Bool)

(assert (=> b!102005 (= e!66389 call!10637)))

(declare-fun b!102006 () Bool)

(assert (=> b!102006 (= e!66382 (= (apply!95 lt!51790 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2414 newMap!16)))))

(declare-fun b!102007 () Bool)

(assert (=> b!102007 (= e!66384 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!17572 () Bool)

(declare-fun b!102008 () Bool)

(assert (=> b!102008 (= c!17572 (and (not (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!17522 (ite c!17528 (extraKeys!2347 newMap!16) lt!51652) (extraKeys!2347 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!102008 (= e!66379 e!66389)))

(assert (= (and d!27609 c!17570) b!101999))

(assert (= (and d!27609 (not c!17570)) b!101991))

(assert (= (and b!101991 c!17573) b!102002))

(assert (= (and b!101991 (not c!17573)) b!102008))

(assert (= (and b!102008 c!17572) b!101988))

(assert (= (and b!102008 (not c!17572)) b!102005))

(assert (= (or b!101988 b!102005) bm!10635))

(assert (= (or b!102002 bm!10635) bm!10637))

(assert (= (or b!102002 b!101988) bm!10633))

(assert (= (or b!101999 bm!10637) bm!10636))

(assert (= (or b!101999 bm!10633) bm!10631))

(assert (= (and d!27609 res!51061) b!101998))

(assert (= (and d!27609 c!17575) b!102004))

(assert (= (and d!27609 (not c!17575)) b!101995))

(assert (= (and d!27609 res!51060) b!102001))

(assert (= (and b!102001 res!51063) b!102007))

(assert (= (and b!102001 (not res!51068)) b!101997))

(assert (= (and b!101997 res!51066) b!101996))

(assert (= (and b!102001 res!51062) b!101990))

(assert (= (and b!101990 c!17571) b!102000))

(assert (= (and b!101990 (not c!17571)) b!101993))

(assert (= (and b!102000 res!51067) b!102006))

(assert (= (or b!102000 b!101993) bm!10632))

(assert (= (and b!101990 res!51065) b!102003))

(assert (= (and b!102003 c!17574) b!101989))

(assert (= (and b!102003 (not c!17574)) b!101994))

(assert (= (and b!101989 res!51064) b!101992))

(assert (= (or b!101989 b!101994) bm!10634))

(declare-fun b_lambda!4563 () Bool)

(assert (=> (not b_lambda!4563) (not b!101996)))

(assert (=> b!101996 t!5610))

(declare-fun b_and!6279 () Bool)

(assert (= b_and!6275 (and (=> t!5610 result!3355) b_and!6279)))

(assert (=> b!101996 t!5612))

(declare-fun b_and!6281 () Bool)

(assert (= b_and!6277 (and (=> t!5612 result!3357) b_and!6281)))

(assert (=> b!101997 m!112787))

(assert (=> b!101997 m!112787))

(declare-fun m!113011 () Bool)

(assert (=> b!101997 m!113011))

(assert (=> b!102007 m!112787))

(assert (=> b!102007 m!112787))

(assert (=> b!102007 m!112791))

(declare-fun m!113013 () Bool)

(assert (=> bm!10636 m!113013))

(declare-fun m!113015 () Bool)

(assert (=> bm!10632 m!113015))

(declare-fun m!113017 () Bool)

(assert (=> bm!10634 m!113017))

(assert (=> d!27609 m!112799))

(declare-fun m!113019 () Bool)

(assert (=> b!101992 m!113019))

(declare-fun m!113021 () Bool)

(assert (=> b!101999 m!113021))

(declare-fun m!113023 () Bool)

(assert (=> b!102006 m!113023))

(assert (=> b!101998 m!112787))

(assert (=> b!101998 m!112787))

(assert (=> b!101998 m!112791))

(declare-fun m!113025 () Bool)

(assert (=> b!102004 m!113025))

(assert (=> b!102004 m!112787))

(assert (=> b!102004 m!113025))

(declare-fun m!113027 () Bool)

(assert (=> b!102004 m!113027))

(declare-fun m!113029 () Bool)

(assert (=> b!102004 m!113029))

(declare-fun m!113031 () Bool)

(assert (=> b!102004 m!113031))

(declare-fun m!113033 () Bool)

(assert (=> b!102004 m!113033))

(declare-fun m!113035 () Bool)

(assert (=> b!102004 m!113035))

(declare-fun m!113037 () Bool)

(assert (=> b!102004 m!113037))

(declare-fun m!113039 () Bool)

(assert (=> b!102004 m!113039))

(declare-fun m!113041 () Bool)

(assert (=> b!102004 m!113041))

(declare-fun m!113043 () Bool)

(assert (=> b!102004 m!113043))

(declare-fun m!113045 () Bool)

(assert (=> b!102004 m!113045))

(assert (=> b!102004 m!113029))

(assert (=> b!102004 m!113045))

(declare-fun m!113047 () Bool)

(assert (=> b!102004 m!113047))

(declare-fun m!113049 () Bool)

(assert (=> b!102004 m!113049))

(assert (=> b!102004 m!113013))

(assert (=> b!102004 m!113041))

(declare-fun m!113051 () Bool)

(assert (=> b!102004 m!113051))

(declare-fun m!113053 () Bool)

(assert (=> b!102004 m!113053))

(assert (=> b!101996 m!112787))

(declare-fun m!113055 () Bool)

(assert (=> b!101996 m!113055))

(assert (=> b!101996 m!112839))

(assert (=> b!101996 m!112841))

(assert (=> b!101996 m!112843))

(assert (=> b!101996 m!112839))

(assert (=> b!101996 m!112787))

(assert (=> b!101996 m!112841))

(declare-fun m!113057 () Bool)

(assert (=> bm!10631 m!113057))

(assert (=> bm!10589 d!27609))

(declare-fun d!27611 () Bool)

(declare-fun e!66391 () Bool)

(assert (=> d!27611 e!66391))

(declare-fun res!51069 () Bool)

(assert (=> d!27611 (=> res!51069 e!66391)))

(declare-fun lt!51808 () Bool)

(assert (=> d!27611 (= res!51069 (not lt!51808))))

(declare-fun lt!51807 () Bool)

(assert (=> d!27611 (= lt!51808 lt!51807)))

(declare-fun lt!51805 () Unit!3088)

(declare-fun e!66390 () Unit!3088)

(assert (=> d!27611 (= lt!51805 e!66390)))

(declare-fun c!17576 () Bool)

(assert (=> d!27611 (= c!17576 lt!51807)))

(assert (=> d!27611 (= lt!51807 (containsKey!157 (toList!790 call!10607) (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670))))))

(assert (=> d!27611 (= (contains!813 call!10607 (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670))) lt!51808)))

(declare-fun b!102009 () Bool)

(declare-fun lt!51806 () Unit!3088)

(assert (=> b!102009 (= e!66390 lt!51806)))

(assert (=> b!102009 (= lt!51806 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 call!10607) (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670))))))

(assert (=> b!102009 (isDefined!106 (getValueByKey!153 (toList!790 call!10607) (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670))))))

(declare-fun b!102010 () Bool)

(declare-fun Unit!3105 () Unit!3088)

(assert (=> b!102010 (= e!66390 Unit!3105)))

(declare-fun b!102011 () Bool)

(assert (=> b!102011 (= e!66391 (isDefined!106 (getValueByKey!153 (toList!790 call!10607) (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670)))))))

(assert (= (and d!27611 c!17576) b!102009))

(assert (= (and d!27611 (not c!17576)) b!102010))

(assert (= (and d!27611 (not res!51069)) b!102011))

(assert (=> d!27611 m!112725))

(declare-fun m!113059 () Bool)

(assert (=> d!27611 m!113059))

(assert (=> b!102009 m!112725))

(declare-fun m!113061 () Bool)

(assert (=> b!102009 m!113061))

(assert (=> b!102009 m!112725))

(declare-fun m!113063 () Bool)

(assert (=> b!102009 m!113063))

(assert (=> b!102009 m!113063))

(declare-fun m!113065 () Bool)

(assert (=> b!102009 m!113065))

(assert (=> b!102011 m!112725))

(assert (=> b!102011 m!113063))

(assert (=> b!102011 m!113063))

(assert (=> b!102011 m!113065))

(assert (=> b!101781 d!27611))

(declare-fun d!27613 () Bool)

(declare-fun e!66394 () Bool)

(assert (=> d!27613 e!66394))

(declare-fun res!51072 () Bool)

(assert (=> d!27613 (=> (not res!51072) (not e!66394))))

(assert (=> d!27613 (= res!51072 (and (bvsge (index!3171 lt!51670) #b00000000000000000000000000000000) (bvslt (index!3171 lt!51670) (size!2286 (_keys!4236 newMap!16)))))))

(declare-fun lt!51811 () Unit!3088)

(declare-fun choose!629 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) Int) Unit!3088)

(assert (=> d!27613 (= lt!51811 (choose!629 (_keys!4236 newMap!16) lt!51673 (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (index!3171 lt!51670) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27613 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27613 (= (lemmaValidKeyInArrayIsInListMap!105 (_keys!4236 newMap!16) lt!51673 (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (index!3171 lt!51670) (defaultEntry!2536 newMap!16)) lt!51811)))

(declare-fun b!102014 () Bool)

(assert (=> b!102014 (= e!66394 (contains!813 (getCurrentListMap!480 (_keys!4236 newMap!16) lt!51673 (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51670))))))

(assert (= (and d!27613 res!51072) b!102014))

(declare-fun m!113067 () Bool)

(assert (=> d!27613 m!113067))

(assert (=> d!27613 m!112799))

(declare-fun m!113069 () Bool)

(assert (=> b!102014 m!113069))

(assert (=> b!102014 m!112725))

(assert (=> b!102014 m!113069))

(assert (=> b!102014 m!112725))

(declare-fun m!113071 () Bool)

(assert (=> b!102014 m!113071))

(assert (=> b!101781 d!27613))

(declare-fun d!27615 () Bool)

(declare-fun e!66397 () Bool)

(assert (=> d!27615 e!66397))

(declare-fun res!51075 () Bool)

(assert (=> d!27615 (=> (not res!51075) (not e!66397))))

(assert (=> d!27615 (= res!51075 (and (bvsge (index!3171 lt!51670) #b00000000000000000000000000000000) (bvslt (index!3171 lt!51670) (size!2287 (_values!2519 newMap!16)))))))

(declare-fun lt!51814 () Unit!3088)

(declare-fun choose!630 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) (_ BitVec 64) V!3179 Int) Unit!3088)

(assert (=> d!27615 (= lt!51814 (choose!630 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (index!3171 lt!51670) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27615 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27615 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (index!3171 lt!51670) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)) lt!51814)))

(declare-fun b!102017 () Bool)

(assert (=> b!102017 (= e!66397 (= (+!138 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!480 (_keys!4236 newMap!16) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (index!3171 lt!51670) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16))))))

(assert (= (and d!27615 res!51075) b!102017))

(assert (=> d!27615 m!112527))

(assert (=> d!27615 m!112525))

(declare-fun m!113073 () Bool)

(assert (=> d!27615 m!113073))

(assert (=> d!27615 m!112799))

(assert (=> b!102017 m!112633))

(assert (=> b!102017 m!112633))

(declare-fun m!113075 () Bool)

(assert (=> b!102017 m!113075))

(assert (=> b!102017 m!112715))

(declare-fun m!113077 () Bool)

(assert (=> b!102017 m!113077))

(assert (=> b!101781 d!27615))

(declare-fun e!66417 () Bool)

(declare-fun b!102042 () Bool)

(declare-fun lt!51829 () ListLongMap!1549)

(assert (=> b!102042 (= e!66417 (= lt!51829 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!102044 () Bool)

(assert (=> b!102044 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> b!102044 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2287 (_values!2519 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun e!66412 () Bool)

(assert (=> b!102044 (= e!66412 (= (apply!95 lt!51829 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102045 () Bool)

(declare-fun e!66413 () Bool)

(assert (=> b!102045 (= e!66413 e!66417)))

(declare-fun c!17586 () Bool)

(assert (=> b!102045 (= c!17586 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!102046 () Bool)

(declare-fun e!66416 () ListLongMap!1549)

(assert (=> b!102046 (= e!66416 (ListLongMap!1550 Nil!1589))))

(declare-fun b!102047 () Bool)

(declare-fun lt!51833 () Unit!3088)

(declare-fun lt!51834 () Unit!3088)

(assert (=> b!102047 (= lt!51833 lt!51834)))

(declare-fun lt!51835 () (_ BitVec 64))

(declare-fun lt!51830 () (_ BitVec 64))

(declare-fun lt!51831 () ListLongMap!1549)

(declare-fun lt!51832 () V!3179)

(assert (=> b!102047 (not (contains!813 (+!138 lt!51831 (tuple2!2367 lt!51830 lt!51832)) lt!51835))))

(declare-fun addStillNotContains!43 (ListLongMap!1549 (_ BitVec 64) V!3179 (_ BitVec 64)) Unit!3088)

(assert (=> b!102047 (= lt!51834 (addStillNotContains!43 lt!51831 lt!51830 lt!51832 lt!51835))))

(assert (=> b!102047 (= lt!51835 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!102047 (= lt!51832 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102047 (= lt!51830 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!10643 () ListLongMap!1549)

(assert (=> b!102047 (= lt!51831 call!10643)))

(declare-fun e!66415 () ListLongMap!1549)

(assert (=> b!102047 (= e!66415 (+!138 call!10643 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!10640 () Bool)

(assert (=> bm!10640 (= call!10643 (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!102048 () Bool)

(assert (=> b!102048 (= e!66415 call!10643)))

(declare-fun b!102049 () Bool)

(declare-fun e!66418 () Bool)

(assert (=> b!102049 (= e!66418 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102049 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun d!27617 () Bool)

(declare-fun e!66414 () Bool)

(assert (=> d!27617 e!66414))

(declare-fun res!51087 () Bool)

(assert (=> d!27617 (=> (not res!51087) (not e!66414))))

(assert (=> d!27617 (= res!51087 (not (contains!813 lt!51829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27617 (= lt!51829 e!66416)))

(declare-fun c!17588 () Bool)

(assert (=> d!27617 (= c!17588 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27617 (validMask!0 (mask!6659 (v!2844 (underlying!346 thiss!992))))))

(assert (=> d!27617 (= (getCurrentListMapNoExtraKeys!103 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))) lt!51829)))

(declare-fun b!102043 () Bool)

(assert (=> b!102043 (= e!66413 e!66412)))

(assert (=> b!102043 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun res!51086 () Bool)

(assert (=> b!102043 (= res!51086 (contains!813 lt!51829 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102043 (=> (not res!51086) (not e!66412))))

(declare-fun b!102050 () Bool)

(declare-fun isEmpty!364 (ListLongMap!1549) Bool)

(assert (=> b!102050 (= e!66417 (isEmpty!364 lt!51829))))

(declare-fun b!102051 () Bool)

(declare-fun res!51084 () Bool)

(assert (=> b!102051 (=> (not res!51084) (not e!66414))))

(assert (=> b!102051 (= res!51084 (not (contains!813 lt!51829 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102052 () Bool)

(assert (=> b!102052 (= e!66416 e!66415)))

(declare-fun c!17585 () Bool)

(assert (=> b!102052 (= c!17585 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102053 () Bool)

(assert (=> b!102053 (= e!66414 e!66413)))

(declare-fun c!17587 () Bool)

(assert (=> b!102053 (= c!17587 e!66418)))

(declare-fun res!51085 () Bool)

(assert (=> b!102053 (=> (not res!51085) (not e!66418))))

(assert (=> b!102053 (= res!51085 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (= (and d!27617 c!17588) b!102046))

(assert (= (and d!27617 (not c!17588)) b!102052))

(assert (= (and b!102052 c!17585) b!102047))

(assert (= (and b!102052 (not c!17585)) b!102048))

(assert (= (or b!102047 b!102048) bm!10640))

(assert (= (and d!27617 res!51087) b!102051))

(assert (= (and b!102051 res!51084) b!102053))

(assert (= (and b!102053 res!51085) b!102049))

(assert (= (and b!102053 c!17587) b!102043))

(assert (= (and b!102053 (not c!17587)) b!102045))

(assert (= (and b!102043 res!51086) b!102044))

(assert (= (and b!102045 c!17586) b!102042))

(assert (= (and b!102045 (not c!17586)) b!102050))

(declare-fun b_lambda!4565 () Bool)

(assert (=> (not b_lambda!4565) (not b!102044)))

(assert (=> b!102044 t!5599))

(declare-fun b_and!6283 () Bool)

(assert (= b_and!6279 (and (=> t!5599 result!3341) b_and!6283)))

(assert (=> b!102044 t!5601))

(declare-fun b_and!6285 () Bool)

(assert (= b_and!6281 (and (=> t!5601 result!3345) b_and!6285)))

(declare-fun b_lambda!4567 () Bool)

(assert (=> (not b_lambda!4567) (not b!102047)))

(assert (=> b!102047 t!5599))

(declare-fun b_and!6287 () Bool)

(assert (= b_and!6283 (and (=> t!5599 result!3341) b_and!6287)))

(assert (=> b!102047 t!5601))

(declare-fun b_and!6289 () Bool)

(assert (= b_and!6285 (and (=> t!5601 result!3345) b_and!6289)))

(assert (=> b!102052 m!112613))

(assert (=> b!102052 m!112613))

(assert (=> b!102052 m!112637))

(assert (=> b!102049 m!112613))

(assert (=> b!102049 m!112613))

(assert (=> b!102049 m!112637))

(declare-fun m!113079 () Bool)

(assert (=> bm!10640 m!113079))

(declare-fun m!113081 () Bool)

(assert (=> d!27617 m!113081))

(assert (=> d!27617 m!112557))

(assert (=> b!102042 m!113079))

(declare-fun m!113083 () Bool)

(assert (=> b!102051 m!113083))

(declare-fun m!113085 () Bool)

(assert (=> b!102047 m!113085))

(declare-fun m!113087 () Bool)

(assert (=> b!102047 m!113087))

(assert (=> b!102047 m!112683))

(assert (=> b!102047 m!112523))

(assert (=> b!102047 m!112685))

(declare-fun m!113089 () Bool)

(assert (=> b!102047 m!113089))

(declare-fun m!113091 () Bool)

(assert (=> b!102047 m!113091))

(assert (=> b!102047 m!113089))

(assert (=> b!102047 m!112523))

(assert (=> b!102047 m!112613))

(assert (=> b!102047 m!112683))

(declare-fun m!113093 () Bool)

(assert (=> b!102050 m!113093))

(assert (=> b!102044 m!112613))

(declare-fun m!113095 () Bool)

(assert (=> b!102044 m!113095))

(assert (=> b!102044 m!112683))

(assert (=> b!102044 m!112523))

(assert (=> b!102044 m!112685))

(assert (=> b!102044 m!112523))

(assert (=> b!102044 m!112613))

(assert (=> b!102044 m!112683))

(assert (=> b!102043 m!112613))

(assert (=> b!102043 m!112613))

(declare-fun m!113097 () Bool)

(assert (=> b!102043 m!113097))

(assert (=> bm!10531 d!27617))

(declare-fun d!27619 () Bool)

(assert (=> d!27619 (= (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101682 d!27619))

(declare-fun b!102054 () Bool)

(declare-fun e!66419 () Bool)

(declare-fun call!10644 () Bool)

(assert (=> b!102054 (= e!66419 call!10644)))

(declare-fun bm!10641 () Bool)

(assert (=> bm!10641 (= call!10644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!102056 () Bool)

(declare-fun e!66421 () Bool)

(assert (=> b!102056 (= e!66421 call!10644)))

(declare-fun b!102057 () Bool)

(assert (=> b!102057 (= e!66421 e!66419)))

(declare-fun lt!51837 () (_ BitVec 64))

(assert (=> b!102057 (= lt!51837 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!51836 () Unit!3088)

(assert (=> b!102057 (= lt!51836 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51837 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!102057 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) lt!51837 #b00000000000000000000000000000000)))

(declare-fun lt!51838 () Unit!3088)

(assert (=> b!102057 (= lt!51838 lt!51836)))

(declare-fun res!51089 () Bool)

(assert (=> b!102057 (= res!51089 (= (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))) (Found!256 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!102057 (=> (not res!51089) (not e!66419))))

(declare-fun b!102055 () Bool)

(declare-fun e!66420 () Bool)

(assert (=> b!102055 (= e!66420 e!66421)))

(declare-fun c!17589 () Bool)

(assert (=> b!102055 (= c!17589 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!27621 () Bool)

(declare-fun res!51088 () Bool)

(assert (=> d!27621 (=> res!51088 e!66420)))

(assert (=> d!27621 (= res!51088 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27621 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))) e!66420)))

(assert (= (and d!27621 (not res!51088)) b!102055))

(assert (= (and b!102055 c!17589) b!102057))

(assert (= (and b!102055 (not c!17589)) b!102056))

(assert (= (and b!102057 res!51089) b!102054))

(assert (= (or b!102054 b!102056) bm!10641))

(declare-fun m!113099 () Bool)

(assert (=> bm!10641 m!113099))

(assert (=> b!102057 m!112905))

(declare-fun m!113101 () Bool)

(assert (=> b!102057 m!113101))

(declare-fun m!113103 () Bool)

(assert (=> b!102057 m!113103))

(assert (=> b!102057 m!112905))

(declare-fun m!113105 () Bool)

(assert (=> b!102057 m!113105))

(assert (=> b!102055 m!112905))

(assert (=> b!102055 m!112905))

(assert (=> b!102055 m!112907))

(assert (=> bm!10608 d!27621))

(declare-fun d!27623 () Bool)

(assert (=> d!27623 (= (+!138 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) lt!51652 (zeroValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51841 () Unit!3088)

(declare-fun choose!631 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 V!3179 Int) Unit!3088)

(assert (=> d!27623 (= lt!51841 (choose!631 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) lt!51652 (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27623 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27623 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) lt!51652 (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)) lt!51841)))

(declare-fun bs!4213 () Bool)

(assert (= bs!4213 d!27623))

(assert (=> bs!4213 m!112633))

(assert (=> bs!4213 m!112633))

(declare-fun m!113107 () Bool)

(assert (=> bs!4213 m!113107))

(assert (=> bs!4213 m!112799))

(assert (=> bs!4213 m!112525))

(declare-fun m!113109 () Bool)

(assert (=> bs!4213 m!113109))

(assert (=> bs!4213 m!112525))

(declare-fun m!113111 () Bool)

(assert (=> bs!4213 m!113111))

(assert (=> b!101810 d!27623))

(declare-fun d!27625 () Bool)

(assert (=> d!27625 (= (inRange!0 (ite c!17524 (ite c!17517 (index!3171 lt!51672) (ite c!17525 (index!3170 lt!51668) (index!3173 lt!51668))) (ite c!17526 (index!3171 lt!51653) (ite c!17518 (index!3170 lt!51651) (index!3173 lt!51651)))) (mask!6659 newMap!16)) (and (bvsge (ite c!17524 (ite c!17517 (index!3171 lt!51672) (ite c!17525 (index!3170 lt!51668) (index!3173 lt!51668))) (ite c!17526 (index!3171 lt!51653) (ite c!17518 (index!3170 lt!51651) (index!3173 lt!51651)))) #b00000000000000000000000000000000) (bvslt (ite c!17524 (ite c!17517 (index!3171 lt!51672) (ite c!17525 (index!3170 lt!51668) (index!3173 lt!51668))) (ite c!17526 (index!3171 lt!51653) (ite c!17518 (index!3170 lt!51651) (index!3173 lt!51651)))) (bvadd (mask!6659 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!10599 d!27625))

(declare-fun d!27627 () Bool)

(declare-fun e!66422 () Bool)

(assert (=> d!27627 e!66422))

(declare-fun res!51090 () Bool)

(assert (=> d!27627 (=> (not res!51090) (not e!66422))))

(declare-fun lt!51845 () ListLongMap!1549)

(assert (=> d!27627 (= res!51090 (contains!813 lt!51845 (_1!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun lt!51844 () List!1592)

(assert (=> d!27627 (= lt!51845 (ListLongMap!1550 lt!51844))))

(declare-fun lt!51842 () Unit!3088)

(declare-fun lt!51843 () Unit!3088)

(assert (=> d!27627 (= lt!51842 lt!51843)))

(assert (=> d!27627 (= (getValueByKey!153 lt!51844 (_1!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))) (Some!158 (_2!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(assert (=> d!27627 (= lt!51843 (lemmaContainsTupThenGetReturnValue!69 lt!51844 (_1!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (_2!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(assert (=> d!27627 (= lt!51844 (insertStrictlySorted!72 (toList!790 (ite c!17480 call!10530 (ite c!17483 call!10534 call!10532))) (_1!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (_2!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(assert (=> d!27627 (= (+!138 (ite c!17480 call!10530 (ite c!17483 call!10534 call!10532)) (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51845)))

(declare-fun b!102058 () Bool)

(declare-fun res!51091 () Bool)

(assert (=> b!102058 (=> (not res!51091) (not e!66422))))

(assert (=> b!102058 (= res!51091 (= (getValueByKey!153 (toList!790 lt!51845) (_1!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))) (Some!158 (_2!1194 (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))))

(declare-fun b!102059 () Bool)

(assert (=> b!102059 (= e!66422 (contains!815 (toList!790 lt!51845) (ite (or c!17480 c!17483) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (= (and d!27627 res!51090) b!102058))

(assert (= (and b!102058 res!51091) b!102059))

(declare-fun m!113113 () Bool)

(assert (=> d!27627 m!113113))

(declare-fun m!113115 () Bool)

(assert (=> d!27627 m!113115))

(declare-fun m!113117 () Bool)

(assert (=> d!27627 m!113117))

(declare-fun m!113119 () Bool)

(assert (=> d!27627 m!113119))

(declare-fun m!113121 () Bool)

(assert (=> b!102058 m!113121))

(declare-fun m!113123 () Bool)

(assert (=> b!102059 m!113123))

(assert (=> bm!10526 d!27627))

(declare-fun b!102068 () Bool)

(declare-fun e!66427 () (_ BitVec 32))

(declare-fun call!10647 () (_ BitVec 32))

(assert (=> b!102068 (= e!66427 (bvadd #b00000000000000000000000000000001 call!10647))))

(declare-fun b!102069 () Bool)

(assert (=> b!102069 (= e!66427 call!10647)))

(declare-fun b!102070 () Bool)

(declare-fun e!66428 () (_ BitVec 32))

(assert (=> b!102070 (= e!66428 #b00000000000000000000000000000000)))

(declare-fun b!102071 () Bool)

(assert (=> b!102071 (= e!66428 e!66427)))

(declare-fun c!17595 () Bool)

(assert (=> b!102071 (= c!17595 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10644 () Bool)

(assert (=> bm!10644 (= call!10647 (arrayCountValidKeys!0 (_keys!4236 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2286 (_keys!4236 newMap!16))))))

(declare-fun d!27629 () Bool)

(declare-fun lt!51848 () (_ BitVec 32))

(assert (=> d!27629 (and (bvsge lt!51848 #b00000000000000000000000000000000) (bvsle lt!51848 (bvsub (size!2286 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!27629 (= lt!51848 e!66428)))

(declare-fun c!17594 () Bool)

(assert (=> d!27629 (= c!17594 (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27629 (and (bvsle #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2286 (_keys!4236 newMap!16)) (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27629 (= (arrayCountValidKeys!0 (_keys!4236 newMap!16) #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) lt!51848)))

(assert (= (and d!27629 c!17594) b!102070))

(assert (= (and d!27629 (not c!17594)) b!102071))

(assert (= (and b!102071 c!17595) b!102068))

(assert (= (and b!102071 (not c!17595)) b!102069))

(assert (= (or b!102068 b!102069) bm!10644))

(assert (=> b!102071 m!112787))

(assert (=> b!102071 m!112787))

(assert (=> b!102071 m!112791))

(declare-fun m!113125 () Bool)

(assert (=> bm!10644 m!113125))

(assert (=> b!101618 d!27629))

(declare-fun d!27631 () Bool)

(assert (=> d!27631 (= (get!1304 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101823 d!27631))

(declare-fun d!27633 () Bool)

(declare-fun res!51096 () Bool)

(declare-fun e!66433 () Bool)

(assert (=> d!27633 (=> res!51096 e!66433)))

(assert (=> d!27633 (= res!51096 (and ((_ is Cons!1588) (toList!790 lt!51478)) (= (_1!1194 (h!2184 (toList!790 lt!51478))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(assert (=> d!27633 (= (containsKey!157 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) e!66433)))

(declare-fun b!102076 () Bool)

(declare-fun e!66434 () Bool)

(assert (=> b!102076 (= e!66433 e!66434)))

(declare-fun res!51097 () Bool)

(assert (=> b!102076 (=> (not res!51097) (not e!66434))))

(assert (=> b!102076 (= res!51097 (and (or (not ((_ is Cons!1588) (toList!790 lt!51478))) (bvsle (_1!1194 (h!2184 (toList!790 lt!51478))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))) ((_ is Cons!1588) (toList!790 lt!51478)) (bvslt (_1!1194 (h!2184 (toList!790 lt!51478))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(declare-fun b!102077 () Bool)

(assert (=> b!102077 (= e!66434 (containsKey!157 (t!5602 (toList!790 lt!51478)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (= (and d!27633 (not res!51096)) b!102076))

(assert (= (and b!102076 res!51097) b!102077))

(assert (=> b!102077 m!112527))

(declare-fun m!113127 () Bool)

(assert (=> b!102077 m!113127))

(assert (=> d!27557 d!27633))

(declare-fun d!27635 () Bool)

(declare-fun res!51098 () Bool)

(declare-fun e!66438 () Bool)

(assert (=> d!27635 (=> res!51098 e!66438)))

(assert (=> d!27635 (= res!51098 (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27635 (= (arrayNoDuplicates!0 (_keys!4236 newMap!16) #b00000000000000000000000000000000 Nil!1590) e!66438)))

(declare-fun b!102078 () Bool)

(declare-fun e!66436 () Bool)

(declare-fun e!66435 () Bool)

(assert (=> b!102078 (= e!66436 e!66435)))

(declare-fun c!17596 () Bool)

(assert (=> b!102078 (= c!17596 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10645 () Bool)

(declare-fun call!10648 () Bool)

(assert (=> bm!10645 (= call!10648 (arrayNoDuplicates!0 (_keys!4236 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17596 (Cons!1589 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000) Nil!1590) Nil!1590)))))

(declare-fun b!102079 () Bool)

(assert (=> b!102079 (= e!66438 e!66436)))

(declare-fun res!51100 () Bool)

(assert (=> b!102079 (=> (not res!51100) (not e!66436))))

(declare-fun e!66437 () Bool)

(assert (=> b!102079 (= res!51100 (not e!66437))))

(declare-fun res!51099 () Bool)

(assert (=> b!102079 (=> (not res!51099) (not e!66437))))

(assert (=> b!102079 (= res!51099 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102080 () Bool)

(assert (=> b!102080 (= e!66437 (contains!814 Nil!1590 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102081 () Bool)

(assert (=> b!102081 (= e!66435 call!10648)))

(declare-fun b!102082 () Bool)

(assert (=> b!102082 (= e!66435 call!10648)))

(assert (= (and d!27635 (not res!51098)) b!102079))

(assert (= (and b!102079 res!51099) b!102080))

(assert (= (and b!102079 res!51100) b!102078))

(assert (= (and b!102078 c!17596) b!102082))

(assert (= (and b!102078 (not c!17596)) b!102081))

(assert (= (or b!102082 b!102081) bm!10645))

(assert (=> b!102078 m!112787))

(assert (=> b!102078 m!112787))

(assert (=> b!102078 m!112791))

(assert (=> bm!10645 m!112787))

(declare-fun m!113129 () Bool)

(assert (=> bm!10645 m!113129))

(assert (=> b!102079 m!112787))

(assert (=> b!102079 m!112787))

(assert (=> b!102079 m!112791))

(assert (=> b!102080 m!112787))

(assert (=> b!102080 m!112787))

(declare-fun m!113131 () Bool)

(assert (=> b!102080 m!113131))

(assert (=> b!101620 d!27635))

(declare-fun d!27637 () Bool)

(declare-fun e!66440 () Bool)

(assert (=> d!27637 e!66440))

(declare-fun res!51101 () Bool)

(assert (=> d!27637 (=> res!51101 e!66440)))

(declare-fun lt!51852 () Bool)

(assert (=> d!27637 (= res!51101 (not lt!51852))))

(declare-fun lt!51851 () Bool)

(assert (=> d!27637 (= lt!51852 lt!51851)))

(declare-fun lt!51849 () Unit!3088)

(declare-fun e!66439 () Unit!3088)

(assert (=> d!27637 (= lt!51849 e!66439)))

(declare-fun c!17597 () Bool)

(assert (=> d!27637 (= c!17597 lt!51851)))

(assert (=> d!27637 (= lt!51851 (containsKey!157 (toList!790 e!66258) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27637 (= (contains!813 e!66258 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) lt!51852)))

(declare-fun b!102083 () Bool)

(declare-fun lt!51850 () Unit!3088)

(assert (=> b!102083 (= e!66439 lt!51850)))

(assert (=> b!102083 (= lt!51850 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 e!66258) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> b!102083 (isDefined!106 (getValueByKey!153 (toList!790 e!66258) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!102084 () Bool)

(declare-fun Unit!3106 () Unit!3088)

(assert (=> b!102084 (= e!66439 Unit!3106)))

(declare-fun b!102085 () Bool)

(assert (=> b!102085 (= e!66440 (isDefined!106 (getValueByKey!153 (toList!790 e!66258) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(assert (= (and d!27637 c!17597) b!102083))

(assert (= (and d!27637 (not c!17597)) b!102084))

(assert (= (and d!27637 (not res!51101)) b!102085))

(assert (=> d!27637 m!112527))

(declare-fun m!113133 () Bool)

(assert (=> d!27637 m!113133))

(assert (=> b!102083 m!112527))

(declare-fun m!113135 () Bool)

(assert (=> b!102083 m!113135))

(assert (=> b!102083 m!112527))

(declare-fun m!113137 () Bool)

(assert (=> b!102083 m!113137))

(assert (=> b!102083 m!113137))

(declare-fun m!113139 () Bool)

(assert (=> b!102083 m!113139))

(assert (=> b!102085 m!112527))

(assert (=> b!102085 m!113137))

(assert (=> b!102085 m!113137))

(assert (=> b!102085 m!113139))

(assert (=> bm!10593 d!27637))

(assert (=> b!101673 d!27619))

(assert (=> d!27531 d!27535))

(declare-fun d!27639 () Bool)

(assert (=> d!27639 (not (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!27639 true))

(declare-fun _$68!100 () Unit!3088)

(assert (=> d!27639 (= (choose!68 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590)) _$68!100)))

(declare-fun bs!4214 () Bool)

(assert (= bs!4214 d!27639))

(assert (=> bs!4214 m!112527))

(assert (=> bs!4214 m!112543))

(assert (=> d!27531 d!27639))

(declare-fun d!27641 () Bool)

(declare-fun res!51102 () Bool)

(declare-fun e!66441 () Bool)

(assert (=> d!27641 (=> (not res!51102) (not e!66441))))

(assert (=> d!27641 (= res!51102 (simpleValid!71 (v!2844 (underlying!346 thiss!992))))))

(assert (=> d!27641 (= (valid!398 (v!2844 (underlying!346 thiss!992))) e!66441)))

(declare-fun b!102086 () Bool)

(declare-fun res!51103 () Bool)

(assert (=> b!102086 (=> (not res!51103) (not e!66441))))

(assert (=> b!102086 (= res!51103 (= (arrayCountValidKeys!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))) (_size!484 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!102087 () Bool)

(declare-fun res!51104 () Bool)

(assert (=> b!102087 (=> (not res!51104) (not e!66441))))

(assert (=> b!102087 (= res!51104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992)))))))

(declare-fun b!102088 () Bool)

(assert (=> b!102088 (= e!66441 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 Nil!1590))))

(assert (= (and d!27641 res!51102) b!102086))

(assert (= (and b!102086 res!51103) b!102087))

(assert (= (and b!102087 res!51104) b!102088))

(declare-fun m!113141 () Bool)

(assert (=> d!27641 m!113141))

(declare-fun m!113143 () Bool)

(assert (=> b!102086 m!113143))

(assert (=> b!102087 m!112517))

(assert (=> b!102088 m!112559))

(assert (=> d!27563 d!27641))

(declare-fun d!27643 () Bool)

(assert (=> d!27643 (= (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101684 d!27643))

(declare-fun d!27645 () Bool)

(declare-fun res!51105 () Bool)

(declare-fun e!66445 () Bool)

(assert (=> d!27645 (=> res!51105 e!66445)))

(assert (=> d!27645 (= res!51105 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(assert (=> d!27645 (= (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17467 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590) Nil!1590)) e!66445)))

(declare-fun b!102089 () Bool)

(declare-fun e!66443 () Bool)

(declare-fun e!66442 () Bool)

(assert (=> b!102089 (= e!66443 e!66442)))

(declare-fun c!17598 () Bool)

(assert (=> b!102089 (= c!17598 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun call!10649 () Bool)

(declare-fun bm!10646 () Bool)

(assert (=> bm!10646 (= call!10649 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17598 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!17467 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590) Nil!1590)) (ite c!17467 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590) Nil!1590))))))

(declare-fun b!102090 () Bool)

(assert (=> b!102090 (= e!66445 e!66443)))

(declare-fun res!51107 () Bool)

(assert (=> b!102090 (=> (not res!51107) (not e!66443))))

(declare-fun e!66444 () Bool)

(assert (=> b!102090 (= res!51107 (not e!66444))))

(declare-fun res!51106 () Bool)

(assert (=> b!102090 (=> (not res!51106) (not e!66444))))

(assert (=> b!102090 (= res!51106 (validKeyInArray!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!102091 () Bool)

(assert (=> b!102091 (= e!66444 (contains!814 (ite c!17467 (Cons!1589 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) Nil!1590) Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!102092 () Bool)

(assert (=> b!102092 (= e!66442 call!10649)))

(declare-fun b!102093 () Bool)

(assert (=> b!102093 (= e!66442 call!10649)))

(assert (= (and d!27645 (not res!51105)) b!102090))

(assert (= (and b!102090 res!51106) b!102091))

(assert (= (and b!102090 res!51107) b!102089))

(assert (= (and b!102089 c!17598) b!102093))

(assert (= (and b!102089 (not c!17598)) b!102092))

(assert (= (or b!102093 b!102092) bm!10646))

(declare-fun m!113145 () Bool)

(assert (=> b!102089 m!113145))

(assert (=> b!102089 m!113145))

(declare-fun m!113147 () Bool)

(assert (=> b!102089 m!113147))

(assert (=> bm!10646 m!113145))

(declare-fun m!113149 () Bool)

(assert (=> bm!10646 m!113149))

(assert (=> b!102090 m!113145))

(assert (=> b!102090 m!113145))

(assert (=> b!102090 m!113147))

(assert (=> b!102091 m!113145))

(assert (=> b!102091 m!113145))

(declare-fun m!113151 () Bool)

(assert (=> b!102091 m!113151))

(assert (=> bm!10511 d!27645))

(declare-fun b!102094 () Bool)

(declare-fun e!66458 () ListLongMap!1549)

(declare-fun call!10654 () ListLongMap!1549)

(assert (=> b!102094 (= e!66458 call!10654)))

(declare-fun b!102095 () Bool)

(declare-fun e!66455 () Bool)

(declare-fun e!66446 () Bool)

(assert (=> b!102095 (= e!66455 e!66446)))

(declare-fun res!51112 () Bool)

(declare-fun call!10656 () Bool)

(assert (=> b!102095 (= res!51112 call!10656)))

(assert (=> b!102095 (=> (not res!51112) (not e!66446))))

(declare-fun b!102096 () Bool)

(declare-fun res!51113 () Bool)

(declare-fun e!66449 () Bool)

(assert (=> b!102096 (=> (not res!51113) (not e!66449))))

(declare-fun e!66447 () Bool)

(assert (=> b!102096 (= res!51113 e!66447)))

(declare-fun c!17600 () Bool)

(assert (=> b!102096 (= c!17600 (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!102097 () Bool)

(declare-fun e!66454 () ListLongMap!1549)

(declare-fun e!66448 () ListLongMap!1549)

(assert (=> b!102097 (= e!66454 e!66448)))

(declare-fun c!17602 () Bool)

(assert (=> b!102097 (= c!17602 (and (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102098 () Bool)

(declare-fun lt!51860 () ListLongMap!1549)

(assert (=> b!102098 (= e!66446 (= (apply!95 lt!51860 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2414 newMap!16)))))

(declare-fun call!10655 () ListLongMap!1549)

(declare-fun call!10652 () ListLongMap!1549)

(declare-fun bm!10647 () Bool)

(declare-fun call!10653 () ListLongMap!1549)

(declare-fun call!10651 () ListLongMap!1549)

(declare-fun c!17599 () Bool)

(assert (=> bm!10647 (= call!10652 (+!138 (ite c!17599 call!10651 (ite c!17602 call!10655 call!10653)) (ite (or c!17599 c!17602) (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2414 newMap!16)) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 newMap!16)))))))

(declare-fun d!27647 () Bool)

(assert (=> d!27647 e!66449))

(declare-fun res!51108 () Bool)

(assert (=> d!27647 (=> (not res!51108) (not e!66449))))

(assert (=> d!27647 (= res!51108 (or (bvsge #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))))

(declare-fun lt!51854 () ListLongMap!1549)

(assert (=> d!27647 (= lt!51860 lt!51854)))

(declare-fun lt!51859 () Unit!3088)

(declare-fun e!66450 () Unit!3088)

(assert (=> d!27647 (= lt!51859 e!66450)))

(declare-fun c!17604 () Bool)

(declare-fun e!66452 () Bool)

(assert (=> d!27647 (= c!17604 e!66452)))

(declare-fun res!51109 () Bool)

(assert (=> d!27647 (=> (not res!51109) (not e!66452))))

(assert (=> d!27647 (= res!51109 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(assert (=> d!27647 (= lt!51854 e!66454)))

(assert (=> d!27647 (= c!17599 (and (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27647 (validMask!0 (mask!6659 newMap!16))))

(assert (=> d!27647 (= (getCurrentListMap!480 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) lt!51860)))

(declare-fun bm!10648 () Bool)

(declare-fun call!10650 () Bool)

(assert (=> bm!10648 (= call!10650 (contains!813 lt!51860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102099 () Bool)

(assert (=> b!102099 (= e!66447 (not call!10650))))

(declare-fun b!102100 () Bool)

(assert (=> b!102100 (= e!66455 (not call!10656))))

(declare-fun bm!10649 () Bool)

(assert (=> bm!10649 (= call!10654 call!10652)))

(declare-fun bm!10650 () Bool)

(assert (=> bm!10650 (= call!10656 (contains!813 lt!51860 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102101 () Bool)

(declare-fun Unit!3107 () Unit!3088)

(assert (=> b!102101 (= e!66450 Unit!3107)))

(declare-fun e!66456 () Bool)

(declare-fun b!102102 () Bool)

(assert (=> b!102102 (= e!66456 (= (apply!95 lt!51860 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2034 (ite c!17524 (_values!2519 newMap!16) lt!51673)) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2536 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2287 (ite c!17524 (_values!2519 newMap!16) lt!51673))))))

(assert (=> b!102102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun bm!10651 () Bool)

(assert (=> bm!10651 (= call!10653 call!10655)))

(declare-fun b!102103 () Bool)

(declare-fun e!66457 () Bool)

(assert (=> b!102103 (= e!66457 e!66456)))

(declare-fun res!51114 () Bool)

(assert (=> b!102103 (=> (not res!51114) (not e!66456))))

(assert (=> b!102103 (= res!51114 (contains!813 lt!51860 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!102103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!102104 () Bool)

(assert (=> b!102104 (= e!66452 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102105 () Bool)

(assert (=> b!102105 (= e!66454 (+!138 call!10652 (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2414 newMap!16))))))

(declare-fun b!102106 () Bool)

(declare-fun e!66451 () Bool)

(assert (=> b!102106 (= e!66447 e!66451)))

(declare-fun res!51115 () Bool)

(assert (=> b!102106 (= res!51115 call!10650)))

(assert (=> b!102106 (=> (not res!51115) (not e!66451))))

(declare-fun b!102107 () Bool)

(declare-fun res!51110 () Bool)

(assert (=> b!102107 (=> (not res!51110) (not e!66449))))

(assert (=> b!102107 (= res!51110 e!66457)))

(declare-fun res!51116 () Bool)

(assert (=> b!102107 (=> res!51116 e!66457)))

(declare-fun e!66453 () Bool)

(assert (=> b!102107 (= res!51116 (not e!66453))))

(declare-fun res!51111 () Bool)

(assert (=> b!102107 (=> (not res!51111) (not e!66453))))

(assert (=> b!102107 (= res!51111 (bvslt #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!102108 () Bool)

(assert (=> b!102108 (= e!66448 call!10654)))

(declare-fun b!102109 () Bool)

(assert (=> b!102109 (= e!66449 e!66455)))

(declare-fun c!17603 () Bool)

(assert (=> b!102109 (= c!17603 (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102110 () Bool)

(declare-fun lt!51855 () Unit!3088)

(assert (=> b!102110 (= e!66450 lt!51855)))

(declare-fun lt!51856 () ListLongMap!1549)

(assert (=> b!102110 (= lt!51856 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51870 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51870 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51865 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51865 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51857 () Unit!3088)

(assert (=> b!102110 (= lt!51857 (addStillContains!71 lt!51856 lt!51870 (zeroValue!2414 newMap!16) lt!51865))))

(assert (=> b!102110 (contains!813 (+!138 lt!51856 (tuple2!2367 lt!51870 (zeroValue!2414 newMap!16))) lt!51865)))

(declare-fun lt!51858 () Unit!3088)

(assert (=> b!102110 (= lt!51858 lt!51857)))

(declare-fun lt!51862 () ListLongMap!1549)

(assert (=> b!102110 (= lt!51862 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51872 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51871 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51871 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51864 () Unit!3088)

(assert (=> b!102110 (= lt!51864 (addApplyDifferent!71 lt!51862 lt!51872 (minValue!2414 newMap!16) lt!51871))))

(assert (=> b!102110 (= (apply!95 (+!138 lt!51862 (tuple2!2367 lt!51872 (minValue!2414 newMap!16))) lt!51871) (apply!95 lt!51862 lt!51871))))

(declare-fun lt!51874 () Unit!3088)

(assert (=> b!102110 (= lt!51874 lt!51864)))

(declare-fun lt!51869 () ListLongMap!1549)

(assert (=> b!102110 (= lt!51869 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51853 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51868 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51868 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51873 () Unit!3088)

(assert (=> b!102110 (= lt!51873 (addApplyDifferent!71 lt!51869 lt!51853 (zeroValue!2414 newMap!16) lt!51868))))

(assert (=> b!102110 (= (apply!95 (+!138 lt!51869 (tuple2!2367 lt!51853 (zeroValue!2414 newMap!16))) lt!51868) (apply!95 lt!51869 lt!51868))))

(declare-fun lt!51863 () Unit!3088)

(assert (=> b!102110 (= lt!51863 lt!51873)))

(declare-fun lt!51861 () ListLongMap!1549)

(assert (=> b!102110 (= lt!51861 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51867 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51866 () (_ BitVec 64))

(assert (=> b!102110 (= lt!51866 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102110 (= lt!51855 (addApplyDifferent!71 lt!51861 lt!51867 (minValue!2414 newMap!16) lt!51866))))

(assert (=> b!102110 (= (apply!95 (+!138 lt!51861 (tuple2!2367 lt!51867 (minValue!2414 newMap!16))) lt!51866) (apply!95 lt!51861 lt!51866))))

(declare-fun bm!10652 () Bool)

(assert (=> bm!10652 (= call!10651 (getCurrentListMapNoExtraKeys!103 (_keys!4236 newMap!16) (ite c!17524 (_values!2519 newMap!16) lt!51673) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun bm!10653 () Bool)

(assert (=> bm!10653 (= call!10655 call!10651)))

(declare-fun b!102111 () Bool)

(assert (=> b!102111 (= e!66458 call!10653)))

(declare-fun b!102112 () Bool)

(assert (=> b!102112 (= e!66451 (= (apply!95 lt!51860 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2414 newMap!16)))))

(declare-fun b!102113 () Bool)

(assert (=> b!102113 (= e!66453 (validKeyInArray!0 (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102114 () Bool)

(declare-fun c!17601 () Bool)

(assert (=> b!102114 (= c!17601 (and (not (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2347 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!102114 (= e!66448 e!66458)))

(assert (= (and d!27647 c!17599) b!102105))

(assert (= (and d!27647 (not c!17599)) b!102097))

(assert (= (and b!102097 c!17602) b!102108))

(assert (= (and b!102097 (not c!17602)) b!102114))

(assert (= (and b!102114 c!17601) b!102094))

(assert (= (and b!102114 (not c!17601)) b!102111))

(assert (= (or b!102094 b!102111) bm!10651))

(assert (= (or b!102108 bm!10651) bm!10653))

(assert (= (or b!102108 b!102094) bm!10649))

(assert (= (or b!102105 bm!10653) bm!10652))

(assert (= (or b!102105 bm!10649) bm!10647))

(assert (= (and d!27647 res!51109) b!102104))

(assert (= (and d!27647 c!17604) b!102110))

(assert (= (and d!27647 (not c!17604)) b!102101))

(assert (= (and d!27647 res!51108) b!102107))

(assert (= (and b!102107 res!51111) b!102113))

(assert (= (and b!102107 (not res!51116)) b!102103))

(assert (= (and b!102103 res!51114) b!102102))

(assert (= (and b!102107 res!51110) b!102096))

(assert (= (and b!102096 c!17600) b!102106))

(assert (= (and b!102096 (not c!17600)) b!102099))

(assert (= (and b!102106 res!51115) b!102112))

(assert (= (or b!102106 b!102099) bm!10648))

(assert (= (and b!102096 res!51113) b!102109))

(assert (= (and b!102109 c!17603) b!102095))

(assert (= (and b!102109 (not c!17603)) b!102100))

(assert (= (and b!102095 res!51112) b!102098))

(assert (= (or b!102095 b!102100) bm!10650))

(declare-fun b_lambda!4569 () Bool)

(assert (=> (not b_lambda!4569) (not b!102102)))

(assert (=> b!102102 t!5610))

(declare-fun b_and!6291 () Bool)

(assert (= b_and!6287 (and (=> t!5610 result!3355) b_and!6291)))

(assert (=> b!102102 t!5612))

(declare-fun b_and!6293 () Bool)

(assert (= b_and!6289 (and (=> t!5612 result!3357) b_and!6293)))

(assert (=> b!102103 m!112787))

(assert (=> b!102103 m!112787))

(declare-fun m!113153 () Bool)

(assert (=> b!102103 m!113153))

(assert (=> b!102113 m!112787))

(assert (=> b!102113 m!112787))

(assert (=> b!102113 m!112791))

(declare-fun m!113155 () Bool)

(assert (=> bm!10652 m!113155))

(declare-fun m!113157 () Bool)

(assert (=> bm!10648 m!113157))

(declare-fun m!113159 () Bool)

(assert (=> bm!10650 m!113159))

(assert (=> d!27647 m!112799))

(declare-fun m!113161 () Bool)

(assert (=> b!102098 m!113161))

(declare-fun m!113163 () Bool)

(assert (=> b!102105 m!113163))

(declare-fun m!113165 () Bool)

(assert (=> b!102112 m!113165))

(assert (=> b!102104 m!112787))

(assert (=> b!102104 m!112787))

(assert (=> b!102104 m!112791))

(declare-fun m!113167 () Bool)

(assert (=> b!102110 m!113167))

(assert (=> b!102110 m!112787))

(assert (=> b!102110 m!113167))

(declare-fun m!113169 () Bool)

(assert (=> b!102110 m!113169))

(declare-fun m!113171 () Bool)

(assert (=> b!102110 m!113171))

(declare-fun m!113173 () Bool)

(assert (=> b!102110 m!113173))

(declare-fun m!113175 () Bool)

(assert (=> b!102110 m!113175))

(declare-fun m!113177 () Bool)

(assert (=> b!102110 m!113177))

(declare-fun m!113179 () Bool)

(assert (=> b!102110 m!113179))

(declare-fun m!113181 () Bool)

(assert (=> b!102110 m!113181))

(declare-fun m!113183 () Bool)

(assert (=> b!102110 m!113183))

(declare-fun m!113185 () Bool)

(assert (=> b!102110 m!113185))

(declare-fun m!113187 () Bool)

(assert (=> b!102110 m!113187))

(assert (=> b!102110 m!113171))

(assert (=> b!102110 m!113187))

(declare-fun m!113189 () Bool)

(assert (=> b!102110 m!113189))

(declare-fun m!113191 () Bool)

(assert (=> b!102110 m!113191))

(assert (=> b!102110 m!113155))

(assert (=> b!102110 m!113183))

(declare-fun m!113193 () Bool)

(assert (=> b!102110 m!113193))

(declare-fun m!113195 () Bool)

(assert (=> b!102110 m!113195))

(assert (=> b!102102 m!112787))

(declare-fun m!113197 () Bool)

(assert (=> b!102102 m!113197))

(declare-fun m!113199 () Bool)

(assert (=> b!102102 m!113199))

(assert (=> b!102102 m!112841))

(declare-fun m!113201 () Bool)

(assert (=> b!102102 m!113201))

(assert (=> b!102102 m!113199))

(assert (=> b!102102 m!112787))

(assert (=> b!102102 m!112841))

(declare-fun m!113203 () Bool)

(assert (=> bm!10647 m!113203))

(assert (=> bm!10587 d!27647))

(assert (=> b!101685 d!27643))

(declare-fun d!27649 () Bool)

(declare-fun lt!51875 () Bool)

(assert (=> d!27649 (= lt!51875 (select (content!106 Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun e!66460 () Bool)

(assert (=> d!27649 (= lt!51875 e!66460)))

(declare-fun res!51117 () Bool)

(assert (=> d!27649 (=> (not res!51117) (not e!66460))))

(assert (=> d!27649 (= res!51117 ((_ is Cons!1589) Nil!1590))))

(assert (=> d!27649 (= (contains!814 Nil!1590 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) lt!51875)))

(declare-fun b!102115 () Bool)

(declare-fun e!66459 () Bool)

(assert (=> b!102115 (= e!66460 e!66459)))

(declare-fun res!51118 () Bool)

(assert (=> b!102115 (=> res!51118 e!66459)))

(assert (=> b!102115 (= res!51118 (= (h!2185 Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!102116 () Bool)

(assert (=> b!102116 (= e!66459 (contains!814 (t!5603 Nil!1590) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (= (and d!27649 res!51117) b!102115))

(assert (= (and b!102115 (not res!51118)) b!102116))

(assert (=> d!27649 m!112971))

(assert (=> d!27649 m!112527))

(declare-fun m!113205 () Bool)

(assert (=> d!27649 m!113205))

(assert (=> b!102116 m!112527))

(declare-fun m!113207 () Bool)

(assert (=> b!102116 m!113207))

(assert (=> b!101609 d!27649))

(declare-fun d!27651 () Bool)

(declare-fun res!51119 () Bool)

(declare-fun e!66461 () Bool)

(assert (=> d!27651 (=> res!51119 e!66461)))

(assert (=> d!27651 (= res!51119 (= (select (arr!2033 (_keys!4236 newMap!16)) #b00000000000000000000000000000000) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27651 (= (arrayContainsKey!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000) e!66461)))

(declare-fun b!102117 () Bool)

(declare-fun e!66462 () Bool)

(assert (=> b!102117 (= e!66461 e!66462)))

(declare-fun res!51120 () Bool)

(assert (=> b!102117 (=> (not res!51120) (not e!66462))))

(assert (=> b!102117 (= res!51120 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2286 (_keys!4236 newMap!16))))))

(declare-fun b!102118 () Bool)

(assert (=> b!102118 (= e!66462 (arrayContainsKey!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27651 (not res!51119)) b!102117))

(assert (= (and b!102117 res!51120) b!102118))

(assert (=> d!27651 m!112787))

(assert (=> b!102118 m!112527))

(declare-fun m!113209 () Bool)

(assert (=> b!102118 m!113209))

(assert (=> bm!10597 d!27651))

(declare-fun d!27653 () Bool)

(declare-fun res!51121 () Bool)

(declare-fun e!66463 () Bool)

(assert (=> d!27653 (=> res!51121 e!66463)))

(assert (=> d!27653 (= res!51121 (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27653 (= (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!66463)))

(declare-fun b!102119 () Bool)

(declare-fun e!66464 () Bool)

(assert (=> b!102119 (= e!66463 e!66464)))

(declare-fun res!51122 () Bool)

(assert (=> b!102119 (=> (not res!51122) (not e!66464))))

(assert (=> b!102119 (= res!51122 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2286 (_keys!4236 (v!2844 (underlying!346 thiss!992))))))))

(declare-fun b!102120 () Bool)

(assert (=> b!102120 (= e!66464 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!27653 (not res!51121)) b!102119))

(assert (= (and b!102119 res!51122) b!102120))

(declare-fun m!113211 () Bool)

(assert (=> d!27653 m!113211))

(assert (=> b!102120 m!112527))

(declare-fun m!113213 () Bool)

(assert (=> b!102120 m!113213))

(assert (=> b!101590 d!27653))

(declare-fun d!27655 () Bool)

(declare-fun e!66465 () Bool)

(assert (=> d!27655 e!66465))

(declare-fun res!51123 () Bool)

(assert (=> d!27655 (=> (not res!51123) (not e!66465))))

(declare-fun lt!51879 () ListLongMap!1549)

(assert (=> d!27655 (= res!51123 (contains!813 lt!51879 (_1!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun lt!51878 () List!1592)

(assert (=> d!27655 (= lt!51879 (ListLongMap!1550 lt!51878))))

(declare-fun lt!51876 () Unit!3088)

(declare-fun lt!51877 () Unit!3088)

(assert (=> d!27655 (= lt!51876 lt!51877)))

(assert (=> d!27655 (= (getValueByKey!153 lt!51878 (_1!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27655 (= lt!51877 (lemmaContainsTupThenGetReturnValue!69 lt!51878 (_1!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27655 (= lt!51878 (insertStrictlySorted!72 (toList!790 lt!51562) (_1!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27655 (= (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51879)))

(declare-fun b!102121 () Bool)

(declare-fun res!51124 () Bool)

(assert (=> b!102121 (=> (not res!51124) (not e!66465))))

(assert (=> b!102121 (= res!51124 (= (getValueByKey!153 (toList!790 lt!51879) (_1!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun b!102122 () Bool)

(assert (=> b!102122 (= e!66465 (contains!815 (toList!790 lt!51879) (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))))))

(assert (= (and d!27655 res!51123) b!102121))

(assert (= (and b!102121 res!51124) b!102122))

(declare-fun m!113215 () Bool)

(assert (=> d!27655 m!113215))

(declare-fun m!113217 () Bool)

(assert (=> d!27655 m!113217))

(declare-fun m!113219 () Bool)

(assert (=> d!27655 m!113219))

(declare-fun m!113221 () Bool)

(assert (=> d!27655 m!113221))

(declare-fun m!113223 () Bool)

(assert (=> b!102121 m!113223))

(declare-fun m!113225 () Bool)

(assert (=> b!102122 m!113225))

(assert (=> b!101679 d!27655))

(declare-fun d!27657 () Bool)

(declare-fun e!66466 () Bool)

(assert (=> d!27657 e!66466))

(declare-fun res!51125 () Bool)

(assert (=> d!27657 (=> (not res!51125) (not e!66466))))

(declare-fun lt!51883 () ListLongMap!1549)

(assert (=> d!27657 (= res!51125 (contains!813 lt!51883 (_1!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun lt!51882 () List!1592)

(assert (=> d!27657 (= lt!51883 (ListLongMap!1550 lt!51882))))

(declare-fun lt!51880 () Unit!3088)

(declare-fun lt!51881 () Unit!3088)

(assert (=> d!27657 (= lt!51880 lt!51881)))

(assert (=> d!27657 (= (getValueByKey!153 lt!51882 (_1!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27657 (= lt!51881 (lemmaContainsTupThenGetReturnValue!69 lt!51882 (_1!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27657 (= lt!51882 (insertStrictlySorted!72 (toList!790 lt!51567) (_1!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27657 (= (+!138 lt!51567 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51883)))

(declare-fun b!102123 () Bool)

(declare-fun res!51126 () Bool)

(assert (=> b!102123 (=> (not res!51126) (not e!66466))))

(assert (=> b!102123 (= res!51126 (= (getValueByKey!153 (toList!790 lt!51883) (_1!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun b!102124 () Bool)

(assert (=> b!102124 (= e!66466 (contains!815 (toList!790 lt!51883) (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))

(assert (= (and d!27657 res!51125) b!102123))

(assert (= (and b!102123 res!51126) b!102124))

(declare-fun m!113227 () Bool)

(assert (=> d!27657 m!113227))

(declare-fun m!113229 () Bool)

(assert (=> d!27657 m!113229))

(declare-fun m!113231 () Bool)

(assert (=> d!27657 m!113231))

(declare-fun m!113233 () Bool)

(assert (=> d!27657 m!113233))

(declare-fun m!113235 () Bool)

(assert (=> b!102123 m!113235))

(declare-fun m!113237 () Bool)

(assert (=> b!102124 m!113237))

(assert (=> b!101679 d!27657))

(declare-fun d!27659 () Bool)

(assert (=> d!27659 (= (apply!95 lt!51567 lt!51572) (get!1305 (getValueByKey!153 (toList!790 lt!51567) lt!51572)))))

(declare-fun bs!4215 () Bool)

(assert (= bs!4215 d!27659))

(declare-fun m!113239 () Bool)

(assert (=> bs!4215 m!113239))

(assert (=> bs!4215 m!113239))

(declare-fun m!113241 () Bool)

(assert (=> bs!4215 m!113241))

(assert (=> b!101679 d!27659))

(declare-fun d!27661 () Bool)

(assert (=> d!27661 (= (apply!95 (+!138 lt!51575 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51574) (apply!95 lt!51575 lt!51574))))

(declare-fun lt!51886 () Unit!3088)

(declare-fun choose!632 (ListLongMap!1549 (_ BitVec 64) V!3179 (_ BitVec 64)) Unit!3088)

(assert (=> d!27661 (= lt!51886 (choose!632 lt!51575 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51574))))

(declare-fun e!66469 () Bool)

(assert (=> d!27661 e!66469))

(declare-fun res!51129 () Bool)

(assert (=> d!27661 (=> (not res!51129) (not e!66469))))

(assert (=> d!27661 (= res!51129 (contains!813 lt!51575 lt!51574))))

(assert (=> d!27661 (= (addApplyDifferent!71 lt!51575 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51574) lt!51886)))

(declare-fun b!102128 () Bool)

(assert (=> b!102128 (= e!66469 (not (= lt!51574 lt!51559)))))

(assert (= (and d!27661 res!51129) b!102128))

(assert (=> d!27661 m!112661))

(declare-fun m!113243 () Bool)

(assert (=> d!27661 m!113243))

(assert (=> d!27661 m!112671))

(assert (=> d!27661 m!112673))

(assert (=> d!27661 m!112671))

(declare-fun m!113245 () Bool)

(assert (=> d!27661 m!113245))

(assert (=> b!101679 d!27661))

(declare-fun d!27663 () Bool)

(declare-fun e!66470 () Bool)

(assert (=> d!27663 e!66470))

(declare-fun res!51130 () Bool)

(assert (=> d!27663 (=> (not res!51130) (not e!66470))))

(declare-fun lt!51890 () ListLongMap!1549)

(assert (=> d!27663 (= res!51130 (contains!813 lt!51890 (_1!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun lt!51889 () List!1592)

(assert (=> d!27663 (= lt!51890 (ListLongMap!1550 lt!51889))))

(declare-fun lt!51887 () Unit!3088)

(declare-fun lt!51888 () Unit!3088)

(assert (=> d!27663 (= lt!51887 lt!51888)))

(assert (=> d!27663 (= (getValueByKey!153 lt!51889 (_1!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27663 (= lt!51888 (lemmaContainsTupThenGetReturnValue!69 lt!51889 (_1!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27663 (= lt!51889 (insertStrictlySorted!72 (toList!790 lt!51568) (_1!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27663 (= (+!138 lt!51568 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51890)))

(declare-fun b!102129 () Bool)

(declare-fun res!51131 () Bool)

(assert (=> b!102129 (=> (not res!51131) (not e!66470))))

(assert (=> b!102129 (= res!51131 (= (getValueByKey!153 (toList!790 lt!51890) (_1!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun b!102130 () Bool)

(assert (=> b!102130 (= e!66470 (contains!815 (toList!790 lt!51890) (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))))))

(assert (= (and d!27663 res!51130) b!102129))

(assert (= (and b!102129 res!51131) b!102130))

(declare-fun m!113247 () Bool)

(assert (=> d!27663 m!113247))

(declare-fun m!113249 () Bool)

(assert (=> d!27663 m!113249))

(declare-fun m!113251 () Bool)

(assert (=> d!27663 m!113251))

(declare-fun m!113253 () Bool)

(assert (=> d!27663 m!113253))

(declare-fun m!113255 () Bool)

(assert (=> b!102129 m!113255))

(declare-fun m!113257 () Bool)

(assert (=> b!102130 m!113257))

(assert (=> b!101679 d!27663))

(declare-fun d!27665 () Bool)

(declare-fun e!66471 () Bool)

(assert (=> d!27665 e!66471))

(declare-fun res!51132 () Bool)

(assert (=> d!27665 (=> (not res!51132) (not e!66471))))

(declare-fun lt!51894 () ListLongMap!1549)

(assert (=> d!27665 (= res!51132 (contains!813 lt!51894 (_1!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(declare-fun lt!51893 () List!1592)

(assert (=> d!27665 (= lt!51894 (ListLongMap!1550 lt!51893))))

(declare-fun lt!51891 () Unit!3088)

(declare-fun lt!51892 () Unit!3088)

(assert (=> d!27665 (= lt!51891 lt!51892)))

(assert (=> d!27665 (= (getValueByKey!153 lt!51893 (_1!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27665 (= lt!51892 (lemmaContainsTupThenGetReturnValue!69 lt!51893 (_1!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27665 (= lt!51893 (insertStrictlySorted!72 (toList!790 lt!51575) (_1!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) (_2!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))))))

(assert (=> d!27665 (= (+!138 lt!51575 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51894)))

(declare-fun b!102131 () Bool)

(declare-fun res!51133 () Bool)

(assert (=> b!102131 (=> (not res!51133) (not e!66471))))

(assert (=> b!102131 (= res!51133 (= (getValueByKey!153 (toList!790 lt!51894) (_1!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) (Some!158 (_2!1194 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))))))))

(declare-fun b!102132 () Bool)

(assert (=> b!102132 (= e!66471 (contains!815 (toList!790 lt!51894) (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))))))

(assert (= (and d!27665 res!51132) b!102131))

(assert (= (and b!102131 res!51133) b!102132))

(declare-fun m!113259 () Bool)

(assert (=> d!27665 m!113259))

(declare-fun m!113261 () Bool)

(assert (=> d!27665 m!113261))

(declare-fun m!113263 () Bool)

(assert (=> d!27665 m!113263))

(declare-fun m!113265 () Bool)

(assert (=> d!27665 m!113265))

(declare-fun m!113267 () Bool)

(assert (=> b!102131 m!113267))

(declare-fun m!113269 () Bool)

(assert (=> b!102132 m!113269))

(assert (=> b!101679 d!27665))

(declare-fun d!27667 () Bool)

(assert (=> d!27667 (= (apply!95 (+!138 lt!51567 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51572) (apply!95 lt!51567 lt!51572))))

(declare-fun lt!51895 () Unit!3088)

(assert (=> d!27667 (= lt!51895 (choose!632 lt!51567 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51572))))

(declare-fun e!66472 () Bool)

(assert (=> d!27667 e!66472))

(declare-fun res!51134 () Bool)

(assert (=> d!27667 (=> (not res!51134) (not e!66472))))

(assert (=> d!27667 (= res!51134 (contains!813 lt!51567 lt!51572))))

(assert (=> d!27667 (= (addApplyDifferent!71 lt!51567 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51572) lt!51895)))

(declare-fun b!102133 () Bool)

(assert (=> b!102133 (= e!66472 (not (= lt!51572 lt!51573)))))

(assert (= (and d!27667 res!51134) b!102133))

(assert (=> d!27667 m!112669))

(declare-fun m!113271 () Bool)

(assert (=> d!27667 m!113271))

(assert (=> d!27667 m!112655))

(assert (=> d!27667 m!112657))

(assert (=> d!27667 m!112655))

(declare-fun m!113273 () Bool)

(assert (=> d!27667 m!113273))

(assert (=> b!101679 d!27667))

(declare-fun d!27669 () Bool)

(assert (=> d!27669 (= (apply!95 lt!51575 lt!51574) (get!1305 (getValueByKey!153 (toList!790 lt!51575) lt!51574)))))

(declare-fun bs!4216 () Bool)

(assert (= bs!4216 d!27669))

(declare-fun m!113275 () Bool)

(assert (=> bs!4216 m!113275))

(assert (=> bs!4216 m!113275))

(declare-fun m!113277 () Bool)

(assert (=> bs!4216 m!113277))

(assert (=> b!101679 d!27669))

(declare-fun d!27671 () Bool)

(declare-fun e!66474 () Bool)

(assert (=> d!27671 e!66474))

(declare-fun res!51135 () Bool)

(assert (=> d!27671 (=> res!51135 e!66474)))

(declare-fun lt!51899 () Bool)

(assert (=> d!27671 (= res!51135 (not lt!51899))))

(declare-fun lt!51898 () Bool)

(assert (=> d!27671 (= lt!51899 lt!51898)))

(declare-fun lt!51896 () Unit!3088)

(declare-fun e!66473 () Unit!3088)

(assert (=> d!27671 (= lt!51896 e!66473)))

(declare-fun c!17605 () Bool)

(assert (=> d!27671 (= c!17605 lt!51898)))

(assert (=> d!27671 (= lt!51898 (containsKey!157 (toList!790 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51571))))

(assert (=> d!27671 (= (contains!813 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51571) lt!51899)))

(declare-fun b!102134 () Bool)

(declare-fun lt!51897 () Unit!3088)

(assert (=> b!102134 (= e!66473 lt!51897)))

(assert (=> b!102134 (= lt!51897 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51571))))

(assert (=> b!102134 (isDefined!106 (getValueByKey!153 (toList!790 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51571))))

(declare-fun b!102135 () Bool)

(declare-fun Unit!3108 () Unit!3088)

(assert (=> b!102135 (= e!66473 Unit!3108)))

(declare-fun b!102136 () Bool)

(assert (=> b!102136 (= e!66474 (isDefined!106 (getValueByKey!153 (toList!790 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51571)))))

(assert (= (and d!27671 c!17605) b!102134))

(assert (= (and d!27671 (not c!17605)) b!102135))

(assert (= (and d!27671 (not res!51135)) b!102136))

(declare-fun m!113279 () Bool)

(assert (=> d!27671 m!113279))

(declare-fun m!113281 () Bool)

(assert (=> b!102134 m!113281))

(declare-fun m!113283 () Bool)

(assert (=> b!102134 m!113283))

(assert (=> b!102134 m!113283))

(declare-fun m!113285 () Bool)

(assert (=> b!102134 m!113285))

(assert (=> b!102136 m!113283))

(assert (=> b!102136 m!113283))

(assert (=> b!102136 m!113285))

(assert (=> b!101679 d!27671))

(declare-fun d!27673 () Bool)

(assert (=> d!27673 (contains!813 (+!138 lt!51562 (tuple2!2367 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51571)))

(declare-fun lt!51902 () Unit!3088)

(declare-fun choose!633 (ListLongMap!1549 (_ BitVec 64) V!3179 (_ BitVec 64)) Unit!3088)

(assert (=> d!27673 (= lt!51902 (choose!633 lt!51562 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51571))))

(assert (=> d!27673 (contains!813 lt!51562 lt!51571)))

(assert (=> d!27673 (= (addStillContains!71 lt!51562 lt!51576 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51571) lt!51902)))

(declare-fun bs!4217 () Bool)

(assert (= bs!4217 d!27673))

(assert (=> bs!4217 m!112667))

(assert (=> bs!4217 m!112667))

(assert (=> bs!4217 m!112677))

(declare-fun m!113287 () Bool)

(assert (=> bs!4217 m!113287))

(declare-fun m!113289 () Bool)

(assert (=> bs!4217 m!113289))

(assert (=> b!101679 d!27673))

(assert (=> b!101679 d!27617))

(declare-fun d!27675 () Bool)

(assert (=> d!27675 (= (apply!95 (+!138 lt!51575 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51574) (get!1305 (getValueByKey!153 (toList!790 (+!138 lt!51575 (tuple2!2367 lt!51559 (zeroValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51574)))))

(declare-fun bs!4218 () Bool)

(assert (= bs!4218 d!27675))

(declare-fun m!113291 () Bool)

(assert (=> bs!4218 m!113291))

(assert (=> bs!4218 m!113291))

(declare-fun m!113293 () Bool)

(assert (=> bs!4218 m!113293))

(assert (=> b!101679 d!27675))

(declare-fun d!27677 () Bool)

(assert (=> d!27677 (= (apply!95 (+!138 lt!51568 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51577) (get!1305 (getValueByKey!153 (toList!790 (+!138 lt!51568 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51577)))))

(declare-fun bs!4219 () Bool)

(assert (= bs!4219 d!27677))

(declare-fun m!113295 () Bool)

(assert (=> bs!4219 m!113295))

(assert (=> bs!4219 m!113295))

(declare-fun m!113297 () Bool)

(assert (=> bs!4219 m!113297))

(assert (=> b!101679 d!27677))

(declare-fun d!27679 () Bool)

(assert (=> d!27679 (= (apply!95 (+!138 lt!51567 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51572) (get!1305 (getValueByKey!153 (toList!790 (+!138 lt!51567 (tuple2!2367 lt!51573 (minValue!2414 (v!2844 (underlying!346 thiss!992)))))) lt!51572)))))

(declare-fun bs!4220 () Bool)

(assert (= bs!4220 d!27679))

(declare-fun m!113299 () Bool)

(assert (=> bs!4220 m!113299))

(assert (=> bs!4220 m!113299))

(declare-fun m!113301 () Bool)

(assert (=> bs!4220 m!113301))

(assert (=> b!101679 d!27679))

(declare-fun d!27681 () Bool)

(assert (=> d!27681 (= (apply!95 (+!138 lt!51568 (tuple2!2367 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))))) lt!51577) (apply!95 lt!51568 lt!51577))))

(declare-fun lt!51903 () Unit!3088)

(assert (=> d!27681 (= lt!51903 (choose!632 lt!51568 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51577))))

(declare-fun e!66475 () Bool)

(assert (=> d!27681 e!66475))

(declare-fun res!51136 () Bool)

(assert (=> d!27681 (=> (not res!51136) (not e!66475))))

(assert (=> d!27681 (= res!51136 (contains!813 lt!51568 lt!51577))))

(assert (=> d!27681 (= (addApplyDifferent!71 lt!51568 lt!51578 (minValue!2414 (v!2844 (underlying!346 thiss!992))) lt!51577) lt!51903)))

(declare-fun b!102138 () Bool)

(assert (=> b!102138 (= e!66475 (not (= lt!51577 lt!51578)))))

(assert (= (and d!27681 res!51136) b!102138))

(assert (=> d!27681 m!112679))

(declare-fun m!113303 () Bool)

(assert (=> d!27681 m!113303))

(assert (=> d!27681 m!112651))

(assert (=> d!27681 m!112653))

(assert (=> d!27681 m!112651))

(declare-fun m!113305 () Bool)

(assert (=> d!27681 m!113305))

(assert (=> b!101679 d!27681))

(declare-fun d!27683 () Bool)

(assert (=> d!27683 (= (apply!95 lt!51568 lt!51577) (get!1305 (getValueByKey!153 (toList!790 lt!51568) lt!51577)))))

(declare-fun bs!4221 () Bool)

(assert (= bs!4221 d!27683))

(declare-fun m!113307 () Bool)

(assert (=> bs!4221 m!113307))

(assert (=> bs!4221 m!113307))

(declare-fun m!113309 () Bool)

(assert (=> bs!4221 m!113309))

(assert (=> b!101679 d!27683))

(declare-fun d!27685 () Bool)

(declare-fun e!66476 () Bool)

(assert (=> d!27685 e!66476))

(declare-fun res!51137 () Bool)

(assert (=> d!27685 (=> (not res!51137) (not e!66476))))

(declare-fun lt!51907 () ListLongMap!1549)

(assert (=> d!27685 (= res!51137 (contains!813 lt!51907 (_1!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!51906 () List!1592)

(assert (=> d!27685 (= lt!51907 (ListLongMap!1550 lt!51906))))

(declare-fun lt!51904 () Unit!3088)

(declare-fun lt!51905 () Unit!3088)

(assert (=> d!27685 (= lt!51904 lt!51905)))

(assert (=> d!27685 (= (getValueByKey!153 lt!51906 (_1!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!158 (_2!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27685 (= lt!51905 (lemmaContainsTupThenGetReturnValue!69 lt!51906 (_1!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27685 (= lt!51906 (insertStrictlySorted!72 (toList!790 call!10593) (_1!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27685 (= (+!138 call!10593 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!51907)))

(declare-fun b!102139 () Bool)

(declare-fun res!51138 () Bool)

(assert (=> b!102139 (=> (not res!51138) (not e!66476))))

(assert (=> b!102139 (= res!51138 (= (getValueByKey!153 (toList!790 lt!51907) (_1!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!158 (_2!1194 (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!102140 () Bool)

(assert (=> b!102140 (= e!66476 (contains!815 (toList!790 lt!51907) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!27685 res!51137) b!102139))

(assert (= (and b!102139 res!51138) b!102140))

(declare-fun m!113311 () Bool)

(assert (=> d!27685 m!113311))

(declare-fun m!113313 () Bool)

(assert (=> d!27685 m!113313))

(declare-fun m!113315 () Bool)

(assert (=> d!27685 m!113315))

(declare-fun m!113317 () Bool)

(assert (=> d!27685 m!113317))

(declare-fun m!113319 () Bool)

(assert (=> b!102139 m!113319))

(declare-fun m!113321 () Bool)

(assert (=> b!102140 m!113321))

(assert (=> b!101783 d!27685))

(declare-fun d!27687 () Bool)

(assert (=> d!27687 (= (apply!95 lt!51566 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1305 (getValueByKey!153 (toList!790 lt!51566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4222 () Bool)

(assert (= bs!4222 d!27687))

(assert (=> bs!4222 m!112783))

(assert (=> bs!4222 m!112783))

(declare-fun m!113323 () Bool)

(assert (=> bs!4222 m!113323))

(assert (=> b!101667 d!27687))

(declare-fun d!27689 () Bool)

(assert (=> d!27689 (isDefined!106 (getValueByKey!153 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun lt!51910 () Unit!3088)

(declare-fun choose!634 (List!1592 (_ BitVec 64)) Unit!3088)

(assert (=> d!27689 (= lt!51910 (choose!634 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun e!66479 () Bool)

(assert (=> d!27689 e!66479))

(declare-fun res!51141 () Bool)

(assert (=> d!27689 (=> (not res!51141) (not e!66479))))

(declare-fun isStrictlySorted!307 (List!1592) Bool)

(assert (=> d!27689 (= res!51141 (isStrictlySorted!307 (toList!790 lt!51478)))))

(assert (=> d!27689 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) lt!51910)))

(declare-fun b!102143 () Bool)

(assert (=> b!102143 (= e!66479 (containsKey!157 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (= (and d!27689 res!51141) b!102143))

(assert (=> d!27689 m!112527))

(assert (=> d!27689 m!112701))

(assert (=> d!27689 m!112701))

(assert (=> d!27689 m!112703))

(assert (=> d!27689 m!112527))

(declare-fun m!113325 () Bool)

(assert (=> d!27689 m!113325))

(declare-fun m!113327 () Bool)

(assert (=> d!27689 m!113327))

(assert (=> b!102143 m!112527))

(assert (=> b!102143 m!112697))

(assert (=> b!101695 d!27689))

(declare-fun d!27691 () Bool)

(declare-fun isEmpty!365 (Option!159) Bool)

(assert (=> d!27691 (= (isDefined!106 (getValueByKey!153 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))) (not (isEmpty!365 (getValueByKey!153 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))))

(declare-fun bs!4223 () Bool)

(assert (= bs!4223 d!27691))

(assert (=> bs!4223 m!112701))

(declare-fun m!113329 () Bool)

(assert (=> bs!4223 m!113329))

(assert (=> b!101695 d!27691))

(declare-fun b!102153 () Bool)

(declare-fun e!66484 () Option!159)

(declare-fun e!66485 () Option!159)

(assert (=> b!102153 (= e!66484 e!66485)))

(declare-fun c!17611 () Bool)

(assert (=> b!102153 (= c!17611 (and ((_ is Cons!1588) (toList!790 lt!51478)) (not (= (_1!1194 (h!2184 (toList!790 lt!51478))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))))

(declare-fun b!102154 () Bool)

(assert (=> b!102154 (= e!66485 (getValueByKey!153 (t!5602 (toList!790 lt!51478)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!102152 () Bool)

(assert (=> b!102152 (= e!66484 (Some!158 (_2!1194 (h!2184 (toList!790 lt!51478)))))))

(declare-fun b!102155 () Bool)

(assert (=> b!102155 (= e!66485 None!157)))

(declare-fun c!17610 () Bool)

(declare-fun d!27693 () Bool)

(assert (=> d!27693 (= c!17610 (and ((_ is Cons!1588) (toList!790 lt!51478)) (= (_1!1194 (h!2184 (toList!790 lt!51478))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(assert (=> d!27693 (= (getValueByKey!153 (toList!790 lt!51478) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) e!66484)))

(assert (= (and d!27693 c!17610) b!102152))

(assert (= (and d!27693 (not c!17610)) b!102153))

(assert (= (and b!102153 c!17611) b!102154))

(assert (= (and b!102153 (not c!17611)) b!102155))

(assert (=> b!102154 m!112527))

(declare-fun m!113331 () Bool)

(assert (=> b!102154 m!113331))

(assert (=> b!101695 d!27693))

(declare-fun d!27695 () Bool)

(assert (=> d!27695 (= (apply!95 lt!51566 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1305 (getValueByKey!153 (toList!790 lt!51566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4224 () Bool)

(assert (= bs!4224 d!27695))

(declare-fun m!113333 () Bool)

(assert (=> bs!4224 m!113333))

(assert (=> bs!4224 m!113333))

(declare-fun m!113335 () Bool)

(assert (=> bs!4224 m!113335))

(assert (=> b!101681 d!27695))

(declare-fun d!27697 () Bool)

(declare-fun e!66486 () Bool)

(assert (=> d!27697 e!66486))

(declare-fun res!51142 () Bool)

(assert (=> d!27697 (=> (not res!51142) (not e!66486))))

(declare-fun lt!51914 () ListLongMap!1549)

(assert (=> d!27697 (= res!51142 (contains!813 lt!51914 (_1!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!51913 () List!1592)

(assert (=> d!27697 (= lt!51914 (ListLongMap!1550 lt!51913))))

(declare-fun lt!51911 () Unit!3088)

(declare-fun lt!51912 () Unit!3088)

(assert (=> d!27697 (= lt!51911 lt!51912)))

(assert (=> d!27697 (= (getValueByKey!153 lt!51913 (_1!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!158 (_2!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27697 (= lt!51912 (lemmaContainsTupThenGetReturnValue!69 lt!51913 (_1!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27697 (= lt!51913 (insertStrictlySorted!72 (toList!790 (ite c!17522 (ite c!17528 call!10595 call!10606) call!10585)) (_1!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27697 (= (+!138 (ite c!17522 (ite c!17528 call!10595 call!10606) call!10585) (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!51914)))

(declare-fun b!102156 () Bool)

(declare-fun res!51143 () Bool)

(assert (=> b!102156 (=> (not res!51143) (not e!66486))))

(assert (=> b!102156 (= res!51143 (= (getValueByKey!153 (toList!790 lt!51914) (_1!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!158 (_2!1194 (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!102157 () Bool)

(assert (=> b!102157 (= e!66486 (contains!815 (toList!790 lt!51914) (ite c!17522 (ite c!17528 (tuple2!2367 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2367 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27697 res!51142) b!102156))

(assert (= (and b!102156 res!51143) b!102157))

(declare-fun m!113337 () Bool)

(assert (=> d!27697 m!113337))

(declare-fun m!113339 () Bool)

(assert (=> d!27697 m!113339))

(declare-fun m!113341 () Bool)

(assert (=> d!27697 m!113341))

(declare-fun m!113343 () Bool)

(assert (=> d!27697 m!113343))

(declare-fun m!113345 () Bool)

(assert (=> b!102156 m!113345))

(declare-fun m!113347 () Bool)

(assert (=> b!102157 m!113347))

(assert (=> bm!10598 d!27697))

(declare-fun b!102192 () Bool)

(declare-fun res!51167 () Bool)

(declare-fun e!66506 () Bool)

(assert (=> b!102192 (=> (not res!51167) (not e!66506))))

(declare-fun lt!51991 () SeekEntryResult!256)

(assert (=> b!102192 (= res!51167 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3170 lt!51991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102193 () Bool)

(declare-fun e!66503 () Unit!3088)

(declare-fun Unit!3109 () Unit!3088)

(assert (=> b!102193 (= e!66503 Unit!3109)))

(declare-fun lt!51981 () Unit!3088)

(declare-fun lemmaArrayContainsKeyThenInListMap!28 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 64) (_ BitVec 32) Int) Unit!3088)

(assert (=> b!102193 (= lt!51981 (lemmaArrayContainsKeyThenInListMap!28 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(assert (=> b!102193 (contains!813 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))

(declare-fun lt!52000 () Unit!3088)

(assert (=> b!102193 (= lt!52000 lt!51981)))

(assert (=> b!102193 false))

(declare-fun b!102194 () Bool)

(declare-fun res!51169 () Bool)

(assert (=> b!102194 (= res!51169 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3173 lt!51991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66508 () Bool)

(assert (=> b!102194 (=> (not res!51169) (not e!66508))))

(declare-fun b!102195 () Bool)

(declare-fun c!17622 () Bool)

(assert (=> b!102195 (= c!17622 ((_ is MissingVacant!256) lt!51991))))

(declare-fun e!66505 () Bool)

(declare-fun e!66509 () Bool)

(assert (=> b!102195 (= e!66505 e!66509)))

(declare-fun b!102196 () Bool)

(declare-fun Unit!3110 () Unit!3088)

(assert (=> b!102196 (= e!66503 Unit!3110)))

(declare-fun d!27699 () Bool)

(declare-fun e!66510 () Bool)

(assert (=> d!27699 e!66510))

(declare-fun res!51162 () Bool)

(assert (=> d!27699 (=> (not res!51162) (not e!66510))))

(declare-fun lt!51998 () tuple2!2368)

(assert (=> d!27699 (= res!51162 (_1!1195 lt!51998))))

(assert (=> d!27699 (= lt!51998 (tuple2!2369 true (LongMapFixedSize!871 (defaultEntry!2536 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (bvadd (_size!484 newMap!16) #b00000000000000000000000000000001) (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))) (_vacant!484 newMap!16))))))

(declare-fun lt!51984 () Unit!3088)

(declare-fun lt!51983 () Unit!3088)

(assert (=> d!27699 (= lt!51984 lt!51983)))

(declare-fun lt!51988 () array!4283)

(declare-fun lt!51997 () array!4285)

(assert (=> d!27699 (contains!813 (getCurrentListMap!480 lt!51988 lt!51997 (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (select (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670))))))

(assert (=> d!27699 (= lt!51983 (lemmaValidKeyInArrayIsInListMap!105 lt!51988 lt!51997 (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (defaultEntry!2536 newMap!16)))))

(assert (=> d!27699 (= lt!51997 (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))))))

(assert (=> d!27699 (= lt!51988 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))))))

(declare-fun lt!51990 () Unit!3088)

(declare-fun lt!51987 () Unit!3088)

(assert (=> d!27699 (= lt!51990 lt!51987)))

(declare-fun lt!51986 () array!4283)

(assert (=> d!27699 (= (arrayCountValidKeys!0 lt!51986 (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (bvadd (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4283 (_ BitVec 32)) Unit!3088)

(assert (=> d!27699 (= lt!51987 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!51986 (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670))))))

(assert (=> d!27699 (= lt!51986 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))))))

(declare-fun lt!51999 () Unit!3088)

(declare-fun lt!51996 () Unit!3088)

(assert (=> d!27699 (= lt!51999 lt!51996)))

(declare-fun lt!52001 () array!4283)

(assert (=> d!27699 (arrayContainsKey!0 lt!52001 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!27699 (= lt!51996 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!52001 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670))))))

(assert (=> d!27699 (= lt!52001 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))))))

(declare-fun lt!52002 () Unit!3088)

(declare-fun lt!52004 () Unit!3088)

(assert (=> d!27699 (= lt!52002 lt!52004)))

(assert (=> d!27699 (= (+!138 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!480 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))) (array!4286 (store (arr!2034 (_values!2519 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (ValueCellFull!981 (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2287 (_values!2519 newMap!16))) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!28 (array!4283 array!4285 (_ BitVec 32) (_ BitVec 32) V!3179 V!3179 (_ BitVec 32) (_ BitVec 64) V!3179 Int) Unit!3088)

(assert (=> d!27699 (= lt!52004 (lemmaAddValidKeyToArrayThenAddPairToListMap!28 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2536 newMap!16)))))

(declare-fun lt!51978 () Unit!3088)

(declare-fun lt!51976 () Unit!3088)

(assert (=> d!27699 (= lt!51978 lt!51976)))

(assert (=> d!27699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))) (mask!6659 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4283 (_ BitVec 32) (_ BitVec 32)) Unit!3088)

(assert (=> d!27699 (= lt!51976 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (mask!6659 newMap!16)))))

(declare-fun lt!51979 () Unit!3088)

(declare-fun lt!51985 () Unit!3088)

(assert (=> d!27699 (= lt!51979 lt!51985)))

(assert (=> d!27699 (= (arrayCountValidKeys!0 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))) #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4236 newMap!16) #b00000000000000000000000000000000 (size!2286 (_keys!4236 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4283 (_ BitVec 32) (_ BitVec 64)) Unit!3088)

(assert (=> d!27699 (= lt!51985 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4236 newMap!16) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun lt!51992 () Unit!3088)

(declare-fun lt!51982 () Unit!3088)

(assert (=> d!27699 (= lt!51992 lt!51982)))

(declare-fun lt!51994 () List!1593)

(declare-fun lt!51993 () (_ BitVec 32))

(assert (=> d!27699 (arrayNoDuplicates!0 (array!4284 (store (arr!2033 (_keys!4236 newMap!16)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) (size!2286 (_keys!4236 newMap!16))) lt!51993 lt!51994)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1593) Unit!3088)

(assert (=> d!27699 (= lt!51982 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670)) lt!51993 lt!51994))))

(assert (=> d!27699 (= lt!51994 Nil!1590)))

(assert (=> d!27699 (= lt!51993 #b00000000000000000000000000000000)))

(declare-fun lt!52003 () Unit!3088)

(assert (=> d!27699 (= lt!52003 e!66503)))

(declare-fun c!17620 () Bool)

(assert (=> d!27699 (= c!17620 (arrayContainsKey!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!51975 () Unit!3088)

(declare-fun e!66507 () Unit!3088)

(assert (=> d!27699 (= lt!51975 e!66507)))

(declare-fun c!17621 () Bool)

(assert (=> d!27699 (= c!17621 (contains!813 (getCurrentListMap!480 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2536 newMap!16)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27699 (valid!398 newMap!16)))

(assert (=> d!27699 (= (updateHelperNewKey!44 newMap!16 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17516 (index!3173 lt!51670) (index!3170 lt!51670))) lt!51998)))

(declare-fun lt!51980 () SeekEntryResult!256)

(declare-fun b!102197 () Bool)

(declare-fun e!66504 () Bool)

(assert (=> b!102197 (= e!66504 (= (select (arr!2033 (_keys!4236 newMap!16)) (index!3171 lt!51980)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!102198 () Bool)

(declare-fun lt!51989 () Unit!3088)

(assert (=> b!102198 (= e!66507 lt!51989)))

(assert (=> b!102198 (= lt!51989 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)))))

(declare-fun call!10665 () SeekEntryResult!256)

(assert (=> b!102198 (= lt!51991 call!10665)))

(declare-fun c!17623 () Bool)

(assert (=> b!102198 (= c!17623 ((_ is MissingZero!256) lt!51991))))

(assert (=> b!102198 e!66505))

(declare-fun b!102199 () Bool)

(declare-fun call!10666 () Bool)

(assert (=> b!102199 (= e!66508 (not call!10666))))

(declare-fun b!102200 () Bool)

(declare-fun res!51165 () Bool)

(declare-fun call!10667 () Bool)

(assert (=> b!102200 (= res!51165 call!10667)))

(assert (=> b!102200 (=> (not res!51165) (not e!66504))))

(declare-fun bm!10662 () Bool)

(assert (=> bm!10662 (= call!10665 (seekEntryOrOpen!0 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (_keys!4236 newMap!16) (mask!6659 newMap!16)))))

(declare-fun bm!10663 () Bool)

(assert (=> bm!10663 (= call!10667 (inRange!0 (ite c!17621 (index!3171 lt!51980) (ite c!17623 (index!3170 lt!51991) (index!3173 lt!51991))) (mask!6659 newMap!16)))))

(declare-fun bm!10664 () Bool)

(declare-fun call!10668 () Bool)

(assert (=> bm!10664 (= call!10668 call!10667)))

(declare-fun bm!10665 () Bool)

(assert (=> bm!10665 (= call!10666 (arrayContainsKey!0 (_keys!4236 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!102201 () Bool)

(assert (=> b!102201 (= e!66509 e!66508)))

(declare-fun res!51170 () Bool)

(assert (=> b!102201 (= res!51170 call!10668)))

(assert (=> b!102201 (=> (not res!51170) (not e!66508))))

(declare-fun b!102202 () Bool)

(declare-fun res!51163 () Bool)

(assert (=> b!102202 (=> (not res!51163) (not e!66510))))

(assert (=> b!102202 (= res!51163 (contains!813 (map!1267 (_2!1195 lt!51998)) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!102203 () Bool)

(assert (=> b!102203 (= e!66506 (not call!10666))))

(declare-fun b!102204 () Bool)

(assert (=> b!102204 (= e!66509 ((_ is Undefined!256) lt!51991))))

(declare-fun b!102205 () Bool)

(declare-fun res!51168 () Bool)

(assert (=> b!102205 (=> (not res!51168) (not e!66510))))

(assert (=> b!102205 (= res!51168 (valid!398 (_2!1195 lt!51998)))))

(declare-fun b!102206 () Bool)

(declare-fun res!51164 () Bool)

(assert (=> b!102206 (=> (not res!51164) (not e!66506))))

(assert (=> b!102206 (= res!51164 call!10668)))

(assert (=> b!102206 (= e!66505 e!66506)))

(declare-fun b!102207 () Bool)

(declare-fun Unit!3111 () Unit!3088)

(assert (=> b!102207 (= e!66507 Unit!3111)))

(declare-fun lt!51995 () Unit!3088)

(assert (=> b!102207 (= lt!51995 (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4236 newMap!16) (_values!2519 newMap!16) (mask!6659 newMap!16) (extraKeys!2347 newMap!16) (zeroValue!2414 newMap!16) (minValue!2414 newMap!16) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (defaultEntry!2536 newMap!16)))))

(assert (=> b!102207 (= lt!51980 call!10665)))

(declare-fun res!51166 () Bool)

(assert (=> b!102207 (= res!51166 ((_ is Found!256) lt!51980))))

(assert (=> b!102207 (=> (not res!51166) (not e!66504))))

(assert (=> b!102207 e!66504))

(declare-fun lt!51977 () Unit!3088)

(assert (=> b!102207 (= lt!51977 lt!51995)))

(assert (=> b!102207 false))

(declare-fun b!102208 () Bool)

(assert (=> b!102208 (= e!66510 (= (map!1267 (_2!1195 lt!51998)) (+!138 (map!1267 newMap!16) (tuple2!2367 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (get!1302 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27699 c!17621) b!102207))

(assert (= (and d!27699 (not c!17621)) b!102198))

(assert (= (and b!102207 res!51166) b!102200))

(assert (= (and b!102200 res!51165) b!102197))

(assert (= (and b!102198 c!17623) b!102206))

(assert (= (and b!102198 (not c!17623)) b!102195))

(assert (= (and b!102206 res!51164) b!102192))

(assert (= (and b!102192 res!51167) b!102203))

(assert (= (and b!102195 c!17622) b!102201))

(assert (= (and b!102195 (not c!17622)) b!102204))

(assert (= (and b!102201 res!51170) b!102194))

(assert (= (and b!102194 res!51169) b!102199))

(assert (= (or b!102206 b!102201) bm!10664))

(assert (= (or b!102203 b!102199) bm!10665))

(assert (= (or b!102200 bm!10664) bm!10663))

(assert (= (or b!102207 b!102198) bm!10662))

(assert (= (and d!27699 c!17620) b!102193))

(assert (= (and d!27699 (not c!17620)) b!102196))

(assert (= (and d!27699 res!51162) b!102205))

(assert (= (and b!102205 res!51168) b!102202))

(assert (= (and b!102202 res!51163) b!102208))

(declare-fun m!113349 () Bool)

(assert (=> bm!10663 m!113349))

(declare-fun m!113351 () Bool)

(assert (=> b!102197 m!113351))

(assert (=> bm!10662 m!112527))

(assert (=> bm!10662 m!112713))

(assert (=> b!102193 m!112527))

(declare-fun m!113353 () Bool)

(assert (=> b!102193 m!113353))

(assert (=> b!102193 m!112633))

(assert (=> b!102193 m!112633))

(assert (=> b!102193 m!112527))

(declare-fun m!113355 () Bool)

(assert (=> b!102193 m!113355))

(assert (=> b!102198 m!112527))

(assert (=> b!102198 m!112735))

(declare-fun m!113357 () Bool)

(assert (=> b!102202 m!113357))

(assert (=> b!102202 m!113357))

(assert (=> b!102202 m!112527))

(declare-fun m!113359 () Bool)

(assert (=> b!102202 m!113359))

(declare-fun m!113361 () Bool)

(assert (=> b!102205 m!113361))

(declare-fun m!113363 () Bool)

(assert (=> b!102192 m!113363))

(assert (=> b!102208 m!113357))

(assert (=> b!102208 m!112549))

(assert (=> b!102208 m!112549))

(declare-fun m!113365 () Bool)

(assert (=> b!102208 m!113365))

(declare-fun m!113367 () Bool)

(assert (=> d!27699 m!113367))

(declare-fun m!113369 () Bool)

(assert (=> d!27699 m!113369))

(assert (=> d!27699 m!112633))

(assert (=> d!27699 m!112527))

(assert (=> d!27699 m!113355))

(declare-fun m!113371 () Bool)

(assert (=> d!27699 m!113371))

(assert (=> d!27699 m!112633))

(assert (=> d!27699 m!112627))

(assert (=> d!27699 m!112633))

(assert (=> d!27699 m!113075))

(declare-fun m!113373 () Bool)

(assert (=> d!27699 m!113373))

(declare-fun m!113375 () Bool)

(assert (=> d!27699 m!113375))

(declare-fun m!113377 () Bool)

(assert (=> d!27699 m!113377))

(assert (=> d!27699 m!112527))

(declare-fun m!113379 () Bool)

(assert (=> d!27699 m!113379))

(assert (=> d!27699 m!113369))

(assert (=> d!27699 m!113371))

(declare-fun m!113381 () Bool)

(assert (=> d!27699 m!113381))

(declare-fun m!113383 () Bool)

(assert (=> d!27699 m!113383))

(assert (=> d!27699 m!112553))

(assert (=> d!27699 m!112527))

(declare-fun m!113385 () Bool)

(assert (=> d!27699 m!113385))

(assert (=> d!27699 m!112527))

(declare-fun m!113387 () Bool)

(assert (=> d!27699 m!113387))

(assert (=> d!27699 m!112527))

(declare-fun m!113389 () Bool)

(assert (=> d!27699 m!113389))

(declare-fun m!113391 () Bool)

(assert (=> d!27699 m!113391))

(assert (=> d!27699 m!112527))

(assert (=> d!27699 m!112525))

(declare-fun m!113393 () Bool)

(assert (=> d!27699 m!113393))

(declare-fun m!113395 () Bool)

(assert (=> d!27699 m!113395))

(declare-fun m!113397 () Bool)

(assert (=> d!27699 m!113397))

(assert (=> d!27699 m!112527))

(declare-fun m!113399 () Bool)

(assert (=> d!27699 m!113399))

(declare-fun m!113401 () Bool)

(assert (=> d!27699 m!113401))

(assert (=> d!27699 m!112527))

(assert (=> d!27699 m!112755))

(assert (=> bm!10665 m!112527))

(assert (=> bm!10665 m!112755))

(assert (=> b!102207 m!112527))

(assert (=> b!102207 m!112737))

(declare-fun m!113403 () Bool)

(assert (=> b!102194 m!113403))

(assert (=> bm!10590 d!27699))

(assert (=> d!27533 d!27539))

(declare-fun d!27701 () Bool)

(assert (=> d!27701 (arrayNoDuplicates!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) from!355 Nil!1590)))

(assert (=> d!27701 true))

(declare-fun _$71!141 () Unit!3088)

(assert (=> d!27701 (= (choose!39 (_keys!4236 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!141)))

(declare-fun bs!4225 () Bool)

(assert (= bs!4225 d!27701))

(assert (=> bs!4225 m!112539))

(assert (=> d!27533 d!27701))

(declare-fun d!27703 () Bool)

(declare-fun e!66512 () Bool)

(assert (=> d!27703 e!66512))

(declare-fun res!51171 () Bool)

(assert (=> d!27703 (=> res!51171 e!66512)))

(declare-fun lt!52008 () Bool)

(assert (=> d!27703 (= res!51171 (not lt!52008))))

(declare-fun lt!52007 () Bool)

(assert (=> d!27703 (= lt!52008 lt!52007)))

(declare-fun lt!52005 () Unit!3088)

(declare-fun e!66511 () Unit!3088)

(assert (=> d!27703 (= lt!52005 e!66511)))

(declare-fun c!17624 () Bool)

(assert (=> d!27703 (= c!17624 lt!52007)))

(assert (=> d!27703 (= lt!52007 (containsKey!157 (toList!790 call!10594) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> d!27703 (= (contains!813 call!10594 (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)) lt!52008)))

(declare-fun b!102209 () Bool)

(declare-fun lt!52006 () Unit!3088)

(assert (=> b!102209 (= e!66511 lt!52006)))

(assert (=> b!102209 (= lt!52006 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 call!10594) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> b!102209 (isDefined!106 (getValueByKey!153 (toList!790 call!10594) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(declare-fun b!102210 () Bool)

(declare-fun Unit!3112 () Unit!3088)

(assert (=> b!102210 (= e!66511 Unit!3112)))

(declare-fun b!102211 () Bool)

(assert (=> b!102211 (= e!66512 (isDefined!106 (getValueByKey!153 (toList!790 call!10594) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355))))))

(assert (= (and d!27703 c!17624) b!102209))

(assert (= (and d!27703 (not c!17624)) b!102210))

(assert (= (and d!27703 (not res!51171)) b!102211))

(assert (=> d!27703 m!112527))

(declare-fun m!113405 () Bool)

(assert (=> d!27703 m!113405))

(assert (=> b!102209 m!112527))

(declare-fun m!113407 () Bool)

(assert (=> b!102209 m!113407))

(assert (=> b!102209 m!112527))

(declare-fun m!113409 () Bool)

(assert (=> b!102209 m!113409))

(assert (=> b!102209 m!113409))

(declare-fun m!113411 () Bool)

(assert (=> b!102209 m!113411))

(assert (=> b!102211 m!112527))

(assert (=> b!102211 m!113409))

(assert (=> b!102211 m!113409))

(assert (=> b!102211 m!113411))

(assert (=> b!101797 d!27703))

(declare-fun d!27705 () Bool)

(assert (=> d!27705 (= (get!1303 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2843 (select (arr!2034 (_values!2519 (v!2844 (underlying!346 thiss!992)))) from!355)))))

(assert (=> b!101822 d!27705))

(declare-fun d!27707 () Bool)

(declare-fun e!66514 () Bool)

(assert (=> d!27707 e!66514))

(declare-fun res!51172 () Bool)

(assert (=> d!27707 (=> res!51172 e!66514)))

(declare-fun lt!52012 () Bool)

(assert (=> d!27707 (= res!51172 (not lt!52012))))

(declare-fun lt!52011 () Bool)

(assert (=> d!27707 (= lt!52012 lt!52011)))

(declare-fun lt!52009 () Unit!3088)

(declare-fun e!66513 () Unit!3088)

(assert (=> d!27707 (= lt!52009 e!66513)))

(declare-fun c!17625 () Bool)

(assert (=> d!27707 (= c!17625 lt!52011)))

(assert (=> d!27707 (= lt!52011 (containsKey!157 (toList!790 lt!51566) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27707 (= (contains!813 lt!51566 #b0000000000000000000000000000000000000000000000000000000000000000) lt!52012)))

(declare-fun b!102212 () Bool)

(declare-fun lt!52010 () Unit!3088)

(assert (=> b!102212 (= e!66513 lt!52010)))

(assert (=> b!102212 (= lt!52010 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!790 lt!51566) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!102212 (isDefined!106 (getValueByKey!153 (toList!790 lt!51566) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102213 () Bool)

(declare-fun Unit!3113 () Unit!3088)

(assert (=> b!102213 (= e!66513 Unit!3113)))

(declare-fun b!102214 () Bool)

(assert (=> b!102214 (= e!66514 (isDefined!106 (getValueByKey!153 (toList!790 lt!51566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27707 c!17625) b!102212))

(assert (= (and d!27707 (not c!17625)) b!102213))

(assert (= (and d!27707 (not res!51172)) b!102214))

(declare-fun m!113413 () Bool)

(assert (=> d!27707 m!113413))

(declare-fun m!113415 () Bool)

(assert (=> b!102212 m!113415))

(assert (=> b!102212 m!113333))

(assert (=> b!102212 m!113333))

(declare-fun m!113417 () Bool)

(assert (=> b!102212 m!113417))

(assert (=> b!102214 m!113333))

(assert (=> b!102214 m!113333))

(assert (=> b!102214 m!113417))

(assert (=> bm!10527 d!27707))

(declare-fun d!27709 () Bool)

(declare-fun e!66517 () Bool)

(assert (=> d!27709 e!66517))

(declare-fun c!17628 () Bool)

(assert (=> d!27709 (= c!17628 (and (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!27709 true))

(declare-fun _$29!135 () Unit!3088)

(assert (=> d!27709 (= (choose!625 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (_values!2519 (v!2844 (underlying!346 thiss!992))) (mask!6659 (v!2844 (underlying!346 thiss!992))) (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) (zeroValue!2414 (v!2844 (underlying!346 thiss!992))) (minValue!2414 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992)))) _$29!135)))

(declare-fun b!102219 () Bool)

(assert (=> b!102219 (= e!66517 (arrayContainsKey!0 (_keys!4236 (v!2844 (underlying!346 thiss!992))) (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!102220 () Bool)

(assert (=> b!102220 (= e!66517 (ite (= (select (arr!2033 (_keys!4236 (v!2844 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2347 (v!2844 (underlying!346 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27709 c!17628) b!102219))

(assert (= (and d!27709 (not c!17628)) b!102220))

(assert (=> b!102219 m!112527))

(assert (=> b!102219 m!112543))

(assert (=> d!27537 d!27709))

(assert (=> d!27537 d!27529))

(assert (=> b!101833 d!27643))

(assert (=> b!101697 d!27691))

(assert (=> b!101697 d!27693))

(assert (=> bm!10600 d!27547))

(declare-fun mapIsEmpty!3833 () Bool)

(declare-fun mapRes!3833 () Bool)

(assert (=> mapIsEmpty!3833 mapRes!3833))

(declare-fun b!102221 () Bool)

(declare-fun e!66518 () Bool)

(assert (=> b!102221 (= e!66518 tp_is_empty!2649)))

(declare-fun condMapEmpty!3833 () Bool)

(declare-fun mapDefault!3833 () ValueCell!981)

(assert (=> mapNonEmpty!3832 (= condMapEmpty!3833 (= mapRest!3832 ((as const (Array (_ BitVec 32) ValueCell!981)) mapDefault!3833)))))

(declare-fun e!66519 () Bool)

(assert (=> mapNonEmpty!3832 (= tp!9718 (and e!66519 mapRes!3833))))

(declare-fun mapNonEmpty!3833 () Bool)

(declare-fun tp!9719 () Bool)

(assert (=> mapNonEmpty!3833 (= mapRes!3833 (and tp!9719 e!66518))))

(declare-fun mapKey!3833 () (_ BitVec 32))

(declare-fun mapRest!3833 () (Array (_ BitVec 32) ValueCell!981))

(declare-fun mapValue!3833 () ValueCell!981)

(assert (=> mapNonEmpty!3833 (= mapRest!3832 (store mapRest!3833 mapKey!3833 mapValue!3833))))

(declare-fun b!102222 () Bool)

(assert (=> b!102222 (= e!66519 tp_is_empty!2649)))

(assert (= (and mapNonEmpty!3832 condMapEmpty!3833) mapIsEmpty!3833))

(assert (= (and mapNonEmpty!3832 (not condMapEmpty!3833)) mapNonEmpty!3833))

(assert (= (and mapNonEmpty!3833 ((_ is ValueCellFull!981) mapValue!3833)) b!102221))

(assert (= (and mapNonEmpty!3832 ((_ is ValueCellFull!981) mapDefault!3833)) b!102222))

(declare-fun m!113419 () Bool)

(assert (=> mapNonEmpty!3833 m!113419))

(declare-fun mapIsEmpty!3834 () Bool)

(declare-fun mapRes!3834 () Bool)

(assert (=> mapIsEmpty!3834 mapRes!3834))

(declare-fun b!102223 () Bool)

(declare-fun e!66520 () Bool)

(assert (=> b!102223 (= e!66520 tp_is_empty!2649)))

(declare-fun condMapEmpty!3834 () Bool)

(declare-fun mapDefault!3834 () ValueCell!981)

(assert (=> mapNonEmpty!3831 (= condMapEmpty!3834 (= mapRest!3831 ((as const (Array (_ BitVec 32) ValueCell!981)) mapDefault!3834)))))

(declare-fun e!66521 () Bool)

(assert (=> mapNonEmpty!3831 (= tp!9717 (and e!66521 mapRes!3834))))

(declare-fun mapNonEmpty!3834 () Bool)

(declare-fun tp!9720 () Bool)

(assert (=> mapNonEmpty!3834 (= mapRes!3834 (and tp!9720 e!66520))))

(declare-fun mapRest!3834 () (Array (_ BitVec 32) ValueCell!981))

(declare-fun mapValue!3834 () ValueCell!981)

(declare-fun mapKey!3834 () (_ BitVec 32))

(assert (=> mapNonEmpty!3834 (= mapRest!3831 (store mapRest!3834 mapKey!3834 mapValue!3834))))

(declare-fun b!102224 () Bool)

(assert (=> b!102224 (= e!66521 tp_is_empty!2649)))

(assert (= (and mapNonEmpty!3831 condMapEmpty!3834) mapIsEmpty!3834))

(assert (= (and mapNonEmpty!3831 (not condMapEmpty!3834)) mapNonEmpty!3834))

(assert (= (and mapNonEmpty!3834 ((_ is ValueCellFull!981) mapValue!3834)) b!102223))

(assert (= (and mapNonEmpty!3831 ((_ is ValueCellFull!981) mapDefault!3834)) b!102224))

(declare-fun m!113421 () Bool)

(assert (=> mapNonEmpty!3834 m!113421))

(declare-fun b_lambda!4571 () Bool)

(assert (= b_lambda!4565 (or (and b!101505 b_free!2465) (and b!101516 b_free!2467 (= (defaultEntry!2536 newMap!16) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))))) b_lambda!4571)))

(declare-fun b_lambda!4573 () Bool)

(assert (= b_lambda!4561 (or (and b!101505 b_free!2465 (= (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) (defaultEntry!2536 newMap!16))) (and b!101516 b_free!2467) b_lambda!4573)))

(declare-fun b_lambda!4575 () Bool)

(assert (= b_lambda!4563 (or (and b!101505 b_free!2465 (= (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) (defaultEntry!2536 newMap!16))) (and b!101516 b_free!2467) b_lambda!4575)))

(declare-fun b_lambda!4577 () Bool)

(assert (= b_lambda!4567 (or (and b!101505 b_free!2465) (and b!101516 b_free!2467 (= (defaultEntry!2536 newMap!16) (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))))) b_lambda!4577)))

(declare-fun b_lambda!4579 () Bool)

(assert (= b_lambda!4569 (or (and b!101505 b_free!2465 (= (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) (defaultEntry!2536 newMap!16))) (and b!101516 b_free!2467) b_lambda!4579)))

(declare-fun b_lambda!4581 () Bool)

(assert (= b_lambda!4559 (or (and b!101505 b_free!2465 (= (defaultEntry!2536 (v!2844 (underlying!346 thiss!992))) (defaultEntry!2536 newMap!16))) (and b!101516 b_free!2467) b_lambda!4581)))

(check-sat (not d!27661) (not d!27607) (not d!27697) (not b!102193) (not bm!10646) (not d!27615) (not bm!10640) (not b!102083) (not b!101999) (not b!102050) (not d!27665) (not b!102208) (not d!27649) (not b!102042) (not bm!10629) (not b!102085) (not b!102071) (not b!102139) (not b!101933) (not b!101865) (not b!101996) (not b!102116) (not b!101922) (not b!101917) (not bm!10617) (not b!102058) (not b!102104) (not b!102057) (not b!102049) (not b!102112) (not bm!10630) (not b!101880) (not d!27603) (not b!101914) (not bm!10645) (not d!27691) (not b!102207) (not b!101962) (not b!102131) (not b!102202) (not d!27573) (not b!101867) (not b!102140) (not bm!10662) (not b!102087) (not b!102130) (not b!102212) (not b!102214) (not b!102078) (not bm!10663) (not b!101846) (not d!27587) (not b!101868) (not bm!10665) (not d!27689) (not b!102079) (not b!102156) (not b!101960) (not b!101954) (not d!27567) (not b!102136) (not b!101935) (not d!27577) (not d!27627) (not b!101909) (not b!101921) (not b!101886) (not d!27679) (not d!27657) (not b!101963) (not bm!10619) (not b!102051) (not d!27685) (not b!102122) (not b!102044) (not b!102120) (not d!27659) (not b!101944) (not b_lambda!4577) (not b!101848) (not bm!10632) (not b!102102) (not b!102103) (not bm!10652) (not d!27601) (not bm!10618) (not d!27569) (not d!27673) (not d!27639) (not b!102129) (not b_lambda!4553) (not b!102134) (not d!27641) (not b!101943) (not b!101929) (not d!27647) (not b!101961) (not bm!10614) (not d!27667) (not bm!10631) (not b!101858) (not d!27575) (not b!102121) (not b!101908) (not d!27699) (not b!101992) (not b!101859) tp_is_empty!2649 b_and!6293 (not b!102113) (not bm!10610) (not b_lambda!4575) (not bm!10636) (not b!101934) (not b!101857) (not b_lambda!4579) (not b!101920) (not b!101936) (not mapNonEmpty!3834) (not b!102052) (not b!102077) (not b!102098) (not b!102017) (not b!101889) (not bm!10623) (not d!27687) (not b!102211) (not b!102209) (not d!27613) (not b!102154) (not d!27663) (not b!102055) (not d!27605) (not bm!10647) (not b!102080) (not d!27637) (not b!102007) (not b!101906) (not d!27655) (not b!102091) (not b!102004) (not b!102123) (not d!27595) (not d!27599) (not bm!10609) (not bm!10641) (not d!27617) b_and!6291 (not d!27671) (not b_next!2467) (not d!27571) (not d!27683) (not d!27703) (not d!27677) (not b_lambda!4573) (not b!102143) (not b!102088) (not b!101853) (not b!101879) (not b!102205) (not bm!10616) (not b!101941) (not d!27675) (not bm!10612) (not bm!10650) (not mapNonEmpty!3833) (not b!102124) (not d!27707) (not b!102118) (not d!27623) (not b!102157) (not d!27583) (not b_next!2465) (not b!102089) (not d!27695) (not bm!10644) (not b!101860) (not d!27681) (not b!102132) (not b!102059) (not d!27593) (not bm!10648) (not d!27701) (not b!102198) (not d!27669) (not b!102047) (not b!101948) (not b!102219) (not b!102006) (not b_lambda!4571) (not b!101998) (not b!102011) (not d!27581) (not b!102009) (not d!27609) (not d!27611) (not b_lambda!4581) (not b!102110) (not b_lambda!4557) (not b!102043) (not b!102105) (not b!101997) (not b!101959) (not bm!10621) (not b!101919) (not bm!10634) (not b!101946) (not b!102090) (not b!102014) (not b!102086))
(check-sat b_and!6291 b_and!6293 (not b_next!2465) (not b_next!2467))
