; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13204 () Bool)

(assert start!13204)

(declare-fun b!116281 () Bool)

(declare-fun b_free!2741 () Bool)

(declare-fun b_next!2741 () Bool)

(assert (=> b!116281 (= b_free!2741 (not b_next!2741))))

(declare-fun tp!10594 () Bool)

(declare-fun b_and!7239 () Bool)

(assert (=> b!116281 (= tp!10594 b_and!7239)))

(declare-fun b!116275 () Bool)

(declare-fun b_free!2743 () Bool)

(declare-fun b_next!2743 () Bool)

(assert (=> b!116275 (= b_free!2743 (not b_next!2743))))

(declare-fun tp!10591 () Bool)

(declare-fun b_and!7241 () Bool)

(assert (=> b!116275 (= tp!10591 b_and!7241)))

(declare-fun b!116264 () Bool)

(declare-fun e!75924 () Bool)

(declare-fun tp_is_empty!2787 () Bool)

(assert (=> b!116264 (= e!75924 tp_is_empty!2787)))

(declare-fun b!116265 () Bool)

(declare-fun res!56984 () Bool)

(declare-fun e!75920 () Bool)

(assert (=> b!116265 (=> (not res!56984) (not e!75920))))

(declare-datatypes ((V!3363 0))(
  ( (V!3364 (val!1438 Int)) )
))
(declare-datatypes ((array!4579 0))(
  ( (array!4580 (arr!2171 (Array (_ BitVec 32) (_ BitVec 64))) (size!2432 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1050 0))(
  ( (ValueCellFull!1050 (v!3045 V!3363)) (EmptyCell!1050) )
))
(declare-datatypes ((array!4581 0))(
  ( (array!4582 (arr!2172 (Array (_ BitVec 32) ValueCell!1050)) (size!2433 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1008 0))(
  ( (LongMapFixedSize!1009 (defaultEntry!2715 Int) (mask!6931 (_ BitVec 32)) (extraKeys!2504 (_ BitVec 32)) (zeroValue!2582 V!3363) (minValue!2582 V!3363) (_size!553 (_ BitVec 32)) (_keys!4438 array!4579) (_values!2698 array!4581) (_vacant!553 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!806 0))(
  ( (Cell!807 (v!3046 LongMapFixedSize!1008)) )
))
(declare-datatypes ((LongMap!806 0))(
  ( (LongMap!807 (underlying!414 Cell!806)) )
))
(declare-fun thiss!992 () LongMap!806)

(declare-fun newMap!16 () LongMapFixedSize!1008)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2534 0))(
  ( (tuple2!2535 (_1!1278 (_ BitVec 64)) (_2!1278 V!3363)) )
))
(declare-datatypes ((List!1678 0))(
  ( (Nil!1675) (Cons!1674 (h!2274 tuple2!2534) (t!5940 List!1678)) )
))
(declare-datatypes ((ListLongMap!1653 0))(
  ( (ListLongMap!1654 (toList!842 List!1678)) )
))
(declare-fun getCurrentListMap!523 (array!4579 array!4581 (_ BitVec 32) (_ BitVec 32) V!3363 V!3363 (_ BitVec 32) Int) ListLongMap!1653)

(declare-fun map!1356 (LongMapFixedSize!1008) ListLongMap!1653)

(assert (=> b!116265 (= res!56984 (= (getCurrentListMap!523 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))) (map!1356 newMap!16)))))

(declare-fun b!116266 () Bool)

(declare-fun res!56986 () Bool)

(assert (=> b!116266 (=> (not res!56986) (not e!75920))))

(assert (=> b!116266 (= res!56986 (and (or (= (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun b!116268 () Bool)

(declare-fun e!75922 () Bool)

(declare-fun mapRes!4299 () Bool)

(assert (=> b!116268 (= e!75922 (and e!75924 mapRes!4299))))

(declare-fun condMapEmpty!4299 () Bool)

(declare-fun mapDefault!4299 () ValueCell!1050)

(assert (=> b!116268 (= condMapEmpty!4299 (= (arr!2172 (_values!2698 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1050)) mapDefault!4299)))))

(declare-fun b!116269 () Bool)

(declare-fun e!75914 () Bool)

(assert (=> b!116269 (= e!75914 tp_is_empty!2787)))

(declare-fun b!116270 () Bool)

(declare-fun e!75915 () Bool)

(assert (=> b!116270 (= e!75915 tp_is_empty!2787)))

(declare-fun mapIsEmpty!4299 () Bool)

(declare-fun mapRes!4300 () Bool)

(assert (=> mapIsEmpty!4299 mapRes!4300))

(declare-fun mapIsEmpty!4300 () Bool)

(assert (=> mapIsEmpty!4300 mapRes!4299))

(declare-fun b!116271 () Bool)

(declare-fun res!56987 () Bool)

(declare-fun e!75917 () Bool)

(assert (=> b!116271 (=> (not res!56987) (not e!75917))))

(declare-datatypes ((tuple2!2536 0))(
  ( (tuple2!2537 (_1!1279 Bool) (_2!1279 LongMapFixedSize!1008)) )
))
(declare-fun lt!60312 () tuple2!2536)

(declare-fun valid!478 (LongMapFixedSize!1008) Bool)

(assert (=> b!116271 (= res!56987 (valid!478 (_2!1279 lt!60312)))))

(declare-fun mapNonEmpty!4299 () Bool)

(declare-fun tp!10592 () Bool)

(assert (=> mapNonEmpty!4299 (= mapRes!4300 (and tp!10592 e!75915))))

(declare-fun mapKey!4300 () (_ BitVec 32))

(declare-fun mapRest!4300 () (Array (_ BitVec 32) ValueCell!1050))

(declare-fun mapValue!4300 () ValueCell!1050)

(assert (=> mapNonEmpty!4299 (= (arr!2172 (_values!2698 (v!3046 (underlying!414 thiss!992)))) (store mapRest!4300 mapKey!4300 mapValue!4300))))

(declare-fun b!116272 () Bool)

(declare-fun res!56991 () Bool)

(assert (=> b!116272 (=> (not res!56991) (not e!75920))))

(assert (=> b!116272 (= res!56991 (valid!478 newMap!16))))

(declare-fun mapNonEmpty!4300 () Bool)

(declare-fun tp!10593 () Bool)

(declare-fun e!75919 () Bool)

(assert (=> mapNonEmpty!4300 (= mapRes!4299 (and tp!10593 e!75919))))

(declare-fun mapRest!4299 () (Array (_ BitVec 32) ValueCell!1050))

(declare-fun mapValue!4299 () ValueCell!1050)

(declare-fun mapKey!4299 () (_ BitVec 32))

(assert (=> mapNonEmpty!4300 (= (arr!2172 (_values!2698 newMap!16)) (store mapRest!4299 mapKey!4299 mapValue!4299))))

(declare-fun b!116273 () Bool)

(declare-fun res!56990 () Bool)

(assert (=> b!116273 (=> (not res!56990) (not e!75920))))

(assert (=> b!116273 (= res!56990 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116274 () Bool)

(declare-fun e!75913 () Bool)

(assert (=> b!116274 (= e!75913 (and e!75914 mapRes!4300))))

(declare-fun condMapEmpty!4300 () Bool)

(declare-fun mapDefault!4300 () ValueCell!1050)

(assert (=> b!116274 (= condMapEmpty!4300 (= (arr!2172 (_values!2698 (v!3046 (underlying!414 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1050)) mapDefault!4300)))))

(declare-fun e!75926 () Bool)

(declare-fun array_inv!1365 (array!4579) Bool)

(declare-fun array_inv!1366 (array!4581) Bool)

(assert (=> b!116275 (= e!75926 (and tp!10591 tp_is_empty!2787 (array_inv!1365 (_keys!4438 newMap!16)) (array_inv!1366 (_values!2698 newMap!16)) e!75922))))

(declare-fun res!56988 () Bool)

(assert (=> start!13204 (=> (not res!56988) (not e!75920))))

(declare-fun valid!479 (LongMap!806) Bool)

(assert (=> start!13204 (= res!56988 (valid!479 thiss!992))))

(assert (=> start!13204 e!75920))

(declare-fun e!75918 () Bool)

(assert (=> start!13204 e!75918))

(assert (=> start!13204 true))

(assert (=> start!13204 e!75926))

(declare-fun b!116267 () Bool)

(declare-fun e!75916 () Bool)

(assert (=> b!116267 (= e!75918 e!75916)))

(declare-fun b!116276 () Bool)

(declare-fun e!75921 () Bool)

(assert (=> b!116276 (= e!75916 e!75921)))

(declare-fun b!116277 () Bool)

(assert (=> b!116277 (= e!75919 tp_is_empty!2787)))

(declare-fun b!116278 () Bool)

(declare-fun res!56985 () Bool)

(assert (=> b!116278 (=> (not res!56985) (not e!75920))))

(assert (=> b!116278 (= res!56985 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6931 newMap!16)) (_size!553 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116279 () Bool)

(assert (=> b!116279 (= e!75917 (not (valid!478 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116280 () Bool)

(assert (=> b!116280 (= e!75920 e!75917)))

(declare-fun res!56989 () Bool)

(assert (=> b!116280 (=> (not res!56989) (not e!75917))))

(assert (=> b!116280 (= res!56989 (_1!1279 lt!60312))))

(declare-fun repackFrom!16 (LongMap!806 LongMapFixedSize!1008 (_ BitVec 32)) tuple2!2536)

(assert (=> b!116280 (= lt!60312 (repackFrom!16 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> b!116281 (= e!75921 (and tp!10594 tp_is_empty!2787 (array_inv!1365 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (array_inv!1366 (_values!2698 (v!3046 (underlying!414 thiss!992)))) e!75913))))

(assert (= (and start!13204 res!56988) b!116273))

(assert (= (and b!116273 res!56990) b!116272))

(assert (= (and b!116272 res!56991) b!116278))

(assert (= (and b!116278 res!56985) b!116265))

(assert (= (and b!116265 res!56984) b!116266))

(assert (= (and b!116266 res!56986) b!116280))

(assert (= (and b!116280 res!56989) b!116271))

(assert (= (and b!116271 res!56987) b!116279))

(assert (= (and b!116274 condMapEmpty!4300) mapIsEmpty!4299))

(assert (= (and b!116274 (not condMapEmpty!4300)) mapNonEmpty!4299))

(get-info :version)

(assert (= (and mapNonEmpty!4299 ((_ is ValueCellFull!1050) mapValue!4300)) b!116270))

(assert (= (and b!116274 ((_ is ValueCellFull!1050) mapDefault!4300)) b!116269))

(assert (= b!116281 b!116274))

(assert (= b!116276 b!116281))

(assert (= b!116267 b!116276))

(assert (= start!13204 b!116267))

(assert (= (and b!116268 condMapEmpty!4299) mapIsEmpty!4300))

(assert (= (and b!116268 (not condMapEmpty!4299)) mapNonEmpty!4300))

(assert (= (and mapNonEmpty!4300 ((_ is ValueCellFull!1050) mapValue!4299)) b!116277))

(assert (= (and b!116268 ((_ is ValueCellFull!1050) mapDefault!4299)) b!116264))

(assert (= b!116275 b!116268))

(assert (= start!13204 b!116275))

(declare-fun m!132399 () Bool)

(assert (=> b!116272 m!132399))

(declare-fun m!132401 () Bool)

(assert (=> b!116275 m!132401))

(declare-fun m!132403 () Bool)

(assert (=> b!116275 m!132403))

(declare-fun m!132405 () Bool)

(assert (=> b!116281 m!132405))

(declare-fun m!132407 () Bool)

(assert (=> b!116281 m!132407))

(declare-fun m!132409 () Bool)

(assert (=> b!116266 m!132409))

(declare-fun m!132411 () Bool)

(assert (=> mapNonEmpty!4300 m!132411))

(declare-fun m!132413 () Bool)

(assert (=> b!116280 m!132413))

(declare-fun m!132415 () Bool)

(assert (=> b!116265 m!132415))

(declare-fun m!132417 () Bool)

(assert (=> b!116265 m!132417))

(declare-fun m!132419 () Bool)

(assert (=> mapNonEmpty!4299 m!132419))

(declare-fun m!132421 () Bool)

(assert (=> b!116271 m!132421))

(declare-fun m!132423 () Bool)

(assert (=> start!13204 m!132423))

(declare-fun m!132425 () Bool)

(assert (=> b!116279 m!132425))

(check-sat (not b!116281) (not b_next!2741) (not mapNonEmpty!4299) (not b!116279) (not b!116265) (not b!116280) b_and!7241 tp_is_empty!2787 (not start!13204) (not b!116272) (not b!116275) (not mapNonEmpty!4300) b_and!7239 (not b_next!2743) (not b!116271))
(check-sat b_and!7239 b_and!7241 (not b_next!2741) (not b_next!2743))
(get-model)

(declare-fun d!32587 () Bool)

(declare-fun res!57022 () Bool)

(declare-fun e!75971 () Bool)

(assert (=> d!32587 (=> (not res!57022) (not e!75971))))

(declare-fun simpleValid!81 (LongMapFixedSize!1008) Bool)

(assert (=> d!32587 (= res!57022 (simpleValid!81 (_2!1279 lt!60312)))))

(assert (=> d!32587 (= (valid!478 (_2!1279 lt!60312)) e!75971)))

(declare-fun b!116342 () Bool)

(declare-fun res!57023 () Bool)

(assert (=> b!116342 (=> (not res!57023) (not e!75971))))

(declare-fun arrayCountValidKeys!0 (array!4579 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!116342 (= res!57023 (= (arrayCountValidKeys!0 (_keys!4438 (_2!1279 lt!60312)) #b00000000000000000000000000000000 (size!2432 (_keys!4438 (_2!1279 lt!60312)))) (_size!553 (_2!1279 lt!60312))))))

(declare-fun b!116343 () Bool)

(declare-fun res!57024 () Bool)

(assert (=> b!116343 (=> (not res!57024) (not e!75971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4579 (_ BitVec 32)) Bool)

(assert (=> b!116343 (= res!57024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4438 (_2!1279 lt!60312)) (mask!6931 (_2!1279 lt!60312))))))

(declare-fun b!116344 () Bool)

(declare-datatypes ((List!1679 0))(
  ( (Nil!1676) (Cons!1675 (h!2275 (_ BitVec 64)) (t!5945 List!1679)) )
))
(declare-fun arrayNoDuplicates!0 (array!4579 (_ BitVec 32) List!1679) Bool)

(assert (=> b!116344 (= e!75971 (arrayNoDuplicates!0 (_keys!4438 (_2!1279 lt!60312)) #b00000000000000000000000000000000 Nil!1676))))

(assert (= (and d!32587 res!57022) b!116342))

(assert (= (and b!116342 res!57023) b!116343))

(assert (= (and b!116343 res!57024) b!116344))

(declare-fun m!132455 () Bool)

(assert (=> d!32587 m!132455))

(declare-fun m!132457 () Bool)

(assert (=> b!116342 m!132457))

(declare-fun m!132459 () Bool)

(assert (=> b!116343 m!132459))

(declare-fun m!132461 () Bool)

(assert (=> b!116344 m!132461))

(assert (=> b!116271 d!32587))

(declare-fun d!32589 () Bool)

(assert (=> d!32589 (= (array_inv!1365 (_keys!4438 newMap!16)) (bvsge (size!2432 (_keys!4438 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116275 d!32589))

(declare-fun d!32591 () Bool)

(assert (=> d!32591 (= (array_inv!1366 (_values!2698 newMap!16)) (bvsge (size!2433 (_values!2698 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116275 d!32591))

(declare-fun b!116373 () Bool)

(declare-fun e!75991 () Bool)

(declare-fun e!75993 () Bool)

(assert (=> b!116373 (= e!75991 e!75993)))

(declare-fun res!57029 () Bool)

(assert (=> b!116373 (=> (not res!57029) (not e!75993))))

(declare-fun lt!60388 () tuple2!2536)

(assert (=> b!116373 (= res!57029 (valid!478 (_2!1279 lt!60388)))))

(declare-fun b!116374 () Bool)

(declare-fun e!75994 () tuple2!2536)

(declare-fun e!75989 () tuple2!2536)

(assert (=> b!116374 (= e!75994 e!75989)))

(declare-fun c!20612 () Bool)

(assert (=> b!116374 (= c!20612 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!60411 () V!3363)

(declare-fun bm!12442 () Bool)

(declare-fun call!12455 () ListLongMap!1653)

(declare-fun lt!60387 () (_ BitVec 64))

(declare-fun lt!60385 () ListLongMap!1653)

(declare-fun lt!60390 () (_ BitVec 64))

(declare-fun c!20614 () Bool)

(declare-fun lt!60392 () ListLongMap!1653)

(declare-fun +!163 (ListLongMap!1653 tuple2!2534) ListLongMap!1653)

(assert (=> bm!12442 (= call!12455 (+!163 (ite c!20614 lt!60385 lt!60392) (ite c!20614 (tuple2!2535 lt!60387 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))) (tuple2!2535 lt!60390 lt!60411))))))

(declare-fun b!116375 () Bool)

(declare-fun e!75995 () tuple2!2536)

(declare-fun lt!60410 () tuple2!2536)

(assert (=> b!116375 (= e!75995 (tuple2!2537 (_1!1279 lt!60410) (_2!1279 lt!60410)))))

(declare-fun call!12452 () ListLongMap!1653)

(assert (=> b!116375 (= lt!60385 call!12452)))

(assert (=> b!116375 (= lt!60387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!3615 0))(
  ( (Unit!3616) )
))
(declare-fun lt!60381 () Unit!3615)

(declare-fun call!12445 () Unit!3615)

(assert (=> b!116375 (= lt!60381 call!12445)))

(declare-fun call!12456 () ListLongMap!1653)

(declare-fun call!12449 () ListLongMap!1653)

(assert (=> b!116375 (= call!12456 call!12449)))

(declare-fun lt!60407 () Unit!3615)

(assert (=> b!116375 (= lt!60407 lt!60381)))

(declare-fun lt!60391 () ListLongMap!1653)

(declare-fun call!12453 () ListLongMap!1653)

(assert (=> b!116375 (= lt!60391 call!12453)))

(declare-fun lt!60382 () (_ BitVec 64))

(assert (=> b!116375 (= lt!60382 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60389 () Unit!3615)

(declare-fun call!12454 () Unit!3615)

(assert (=> b!116375 (= lt!60389 call!12454)))

(declare-fun call!12450 () ListLongMap!1653)

(declare-fun call!12451 () ListLongMap!1653)

(assert (=> b!116375 (= call!12450 call!12451)))

(declare-fun lt!60401 () Unit!3615)

(assert (=> b!116375 (= lt!60401 lt!60389)))

(declare-fun call!12447 () tuple2!2536)

(assert (=> b!116375 (= lt!60410 call!12447)))

(declare-fun d!32593 () Bool)

(assert (=> d!32593 e!75991))

(declare-fun res!57030 () Bool)

(assert (=> d!32593 (=> res!57030 e!75991)))

(assert (=> d!32593 (= res!57030 (not (_1!1279 lt!60388)))))

(assert (=> d!32593 (= lt!60388 e!75994)))

(declare-fun c!20611 () Bool)

(assert (=> d!32593 (= c!20611 (and (not (= lt!60390 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!60390 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!60394 () ListLongMap!1653)

(assert (=> d!32593 (= lt!60394 (map!1356 newMap!16))))

(declare-fun get!1406 (ValueCell!1050 V!3363) V!3363)

(declare-fun dynLambda!405 (Int (_ BitVec 64)) V!3363)

(assert (=> d!32593 (= lt!60411 (get!1406 (select (arr!2172 (_values!2698 (v!3046 (underlying!414 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!405 (defaultEntry!2715 (v!3046 (underlying!414 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32593 (= lt!60390 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!32593 (valid!479 thiss!992)))

(assert (=> d!32593 (= (repackFrom!16 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)) lt!60388)))

(declare-fun e!75988 () Bool)

(declare-fun lt!60409 () (_ BitVec 32))

(declare-fun b!116376 () Bool)

(declare-fun arrayContainsKey!0 (array!4579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!116376 (= e!75988 (arrayContainsKey!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) lt!60390 lt!60409))))

(declare-fun b!116377 () Bool)

(assert (=> b!116377 (= e!75989 (tuple2!2537 true newMap!16))))

(declare-fun b!116378 () Bool)

(assert (=> b!116378 false))

(declare-fun lt!60393 () Unit!3615)

(declare-fun lt!60399 () Unit!3615)

(assert (=> b!116378 (= lt!60393 lt!60399)))

(declare-fun lt!60404 () (_ BitVec 32))

(assert (=> b!116378 (not (arrayContainsKey!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) lt!60390 lt!60404))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4579 (_ BitVec 32) (_ BitVec 64) List!1679) Unit!3615)

(assert (=> b!116378 (= lt!60399 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) lt!60404 lt!60390 (Cons!1675 lt!60390 Nil!1676)))))

(assert (=> b!116378 (= lt!60404 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!60384 () Unit!3615)

(declare-fun lt!60397 () Unit!3615)

(assert (=> b!116378 (= lt!60384 lt!60397)))

(assert (=> b!116378 (arrayNoDuplicates!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1676)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4579 (_ BitVec 32) (_ BitVec 32)) Unit!3615)

(assert (=> b!116378 (= lt!60397 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!60405 () Unit!3615)

(declare-fun lt!60386 () Unit!3615)

(assert (=> b!116378 (= lt!60405 lt!60386)))

(assert (=> b!116378 e!75988))

(declare-fun c!20610 () Bool)

(assert (=> b!116378 (= c!20610 (and (not (= lt!60390 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!60390 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!126 (array!4579 array!4581 (_ BitVec 32) (_ BitVec 32) V!3363 V!3363 (_ BitVec 64) (_ BitVec 32) Int) Unit!3615)

(assert (=> b!116378 (= lt!60386 (lemmaListMapContainsThenArrayContainsFrom!126 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) lt!60390 lt!60409 (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(assert (=> b!116378 (= lt!60409 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!75992 () Unit!3615)

(declare-fun Unit!3617 () Unit!3615)

(assert (=> b!116378 (= e!75992 Unit!3617)))

(declare-fun bm!12443 () Bool)

(declare-fun call!12448 () ListLongMap!1653)

(declare-fun lt!60398 () ListLongMap!1653)

(declare-fun lt!60400 () (_ BitVec 64))

(assert (=> bm!12443 (= call!12448 (+!163 (ite c!20614 lt!60391 lt!60398) (ite c!20614 (tuple2!2535 lt!60390 lt!60411) (tuple2!2535 lt!60400 (minValue!2582 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun bm!12444 () Bool)

(declare-fun lt!60406 () (_ BitVec 64))

(declare-fun call!12457 () ListLongMap!1653)

(assert (=> bm!12444 (= call!12457 (+!163 (ite c!20614 lt!60385 lt!60392) (ite c!20614 (tuple2!2535 lt!60390 lt!60411) (tuple2!2535 lt!60406 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116379 () Bool)

(declare-fun Unit!3618 () Unit!3615)

(assert (=> b!116379 (= e!75992 Unit!3618)))

(declare-fun b!116380 () Bool)

(assert (=> b!116380 (= c!20614 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!75990 () tuple2!2536)

(assert (=> b!116380 (= e!75990 e!75995)))

(declare-fun bm!12445 () Bool)

(declare-fun addCommutativeForDiffKeys!74 (ListLongMap!1653 (_ BitVec 64) V!3363 (_ BitVec 64) V!3363) Unit!3615)

(assert (=> bm!12445 (= call!12454 (addCommutativeForDiffKeys!74 (ite c!20614 lt!60391 lt!60392) lt!60390 lt!60411 (ite c!20614 lt!60382 lt!60406) (ite c!20614 (minValue!2582 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun bm!12446 () Bool)

(assert (=> bm!12446 (= call!12445 (addCommutativeForDiffKeys!74 (ite c!20614 lt!60385 lt!60398) lt!60390 lt!60411 (ite c!20614 lt!60387 lt!60400) (ite c!20614 (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun b!116381 () Bool)

(assert (=> b!116381 (= e!75994 e!75990)))

(declare-fun lt!60402 () tuple2!2536)

(declare-fun update!177 (LongMapFixedSize!1008 (_ BitVec 64) V!3363) tuple2!2536)

(assert (=> b!116381 (= lt!60402 (update!177 newMap!16 lt!60390 lt!60411))))

(declare-fun c!20613 () Bool)

(declare-fun contains!864 (ListLongMap!1653 (_ BitVec 64)) Bool)

(assert (=> b!116381 (= c!20613 (contains!864 lt!60394 lt!60390))))

(declare-fun lt!60396 () Unit!3615)

(assert (=> b!116381 (= lt!60396 e!75992)))

(declare-fun c!20615 () Bool)

(assert (=> b!116381 (= c!20615 (_1!1279 lt!60402))))

(declare-fun bm!12447 () Bool)

(assert (=> bm!12447 (= call!12449 (+!163 (ite c!20614 call!12455 call!12448) (tuple2!2535 lt!60390 lt!60411)))))

(declare-fun b!116382 () Bool)

(assert (=> b!116382 (= e!75995 (tuple2!2537 true (_2!1279 lt!60402)))))

(assert (=> b!116382 (= lt!60392 call!12452)))

(assert (=> b!116382 (= lt!60406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60395 () Unit!3615)

(assert (=> b!116382 (= lt!60395 call!12454)))

(assert (=> b!116382 (= call!12453 call!12451)))

(declare-fun lt!60380 () Unit!3615)

(assert (=> b!116382 (= lt!60380 lt!60395)))

(assert (=> b!116382 (= lt!60398 call!12456)))

(assert (=> b!116382 (= lt!60400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60408 () Unit!3615)

(assert (=> b!116382 (= lt!60408 call!12445)))

(assert (=> b!116382 (= call!12450 call!12449)))

(declare-fun lt!60383 () Unit!3615)

(assert (=> b!116382 (= lt!60383 lt!60408)))

(declare-fun bm!12448 () Bool)

(assert (=> bm!12448 (= call!12447 (repackFrom!16 thiss!992 (ite c!20611 (_2!1279 lt!60402) newMap!16) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!12449 () Bool)

(assert (=> bm!12449 (= call!12453 (+!163 (ite c!20614 call!12452 call!12455) (ite c!20614 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))) (tuple2!2535 lt!60406 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun bm!12450 () Bool)

(declare-fun call!12446 () ListLongMap!1653)

(assert (=> bm!12450 (= call!12450 (+!163 (ite c!20614 call!12448 call!12446) (ite c!20614 (tuple2!2535 lt!60382 (minValue!2582 (v!3046 (underlying!414 thiss!992)))) (tuple2!2535 lt!60400 (minValue!2582 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116383 () Bool)

(assert (=> b!116383 (= e!75990 (tuple2!2537 false (_2!1279 lt!60402)))))

(declare-fun b!116384 () Bool)

(assert (=> b!116384 (= e!75988 (ite (= lt!60390 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!116385 () Bool)

(declare-fun lt!60403 () tuple2!2536)

(assert (=> b!116385 (= lt!60403 call!12447)))

(assert (=> b!116385 (= e!75989 (tuple2!2537 (_1!1279 lt!60403) (_2!1279 lt!60403)))))

(declare-fun bm!12451 () Bool)

(assert (=> bm!12451 (= call!12446 (+!163 (ite c!20614 lt!60391 lt!60398) (ite c!20614 (tuple2!2535 lt!60382 (minValue!2582 (v!3046 (underlying!414 thiss!992)))) (tuple2!2535 lt!60390 lt!60411))))))

(declare-fun bm!12452 () Bool)

(assert (=> bm!12452 (= call!12456 (+!163 (ite c!20614 call!12457 call!12452) (ite c!20614 (tuple2!2535 lt!60387 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116386 () Bool)

(assert (=> b!116386 (= e!75993 (= (map!1356 (_2!1279 lt!60388)) (map!1356 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun bm!12453 () Bool)

(assert (=> bm!12453 (= call!12451 (+!163 (ite c!20614 call!12446 call!12457) (tuple2!2535 lt!60390 lt!60411)))))

(declare-fun bm!12454 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!129 (array!4579 array!4581 (_ BitVec 32) (_ BitVec 32) V!3363 V!3363 (_ BitVec 32) Int) ListLongMap!1653)

(assert (=> bm!12454 (= call!12452 (getCurrentListMapNoExtraKeys!129 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(assert (= (and d!32593 c!20611) b!116381))

(assert (= (and d!32593 (not c!20611)) b!116374))

(assert (= (and b!116381 c!20613) b!116378))

(assert (= (and b!116381 (not c!20613)) b!116379))

(assert (= (and b!116378 c!20610) b!116376))

(assert (= (and b!116378 (not c!20610)) b!116384))

(assert (= (and b!116381 c!20615) b!116380))

(assert (= (and b!116381 (not c!20615)) b!116383))

(assert (= (and b!116380 c!20614) b!116375))

(assert (= (and b!116380 (not c!20614)) b!116382))

(assert (= (or b!116375 b!116382) bm!12446))

(assert (= (or b!116375 b!116382) bm!12444))

(assert (= (or b!116375 b!116382) bm!12454))

(assert (= (or b!116375 b!116382) bm!12442))

(assert (= (or b!116375 b!116382) bm!12443))

(assert (= (or b!116375 b!116382) bm!12445))

(assert (= (or b!116375 b!116382) bm!12451))

(assert (= (or b!116375 b!116382) bm!12450))

(assert (= (or b!116375 b!116382) bm!12447))

(assert (= (or b!116375 b!116382) bm!12453))

(assert (= (or b!116375 b!116382) bm!12452))

(assert (= (or b!116375 b!116382) bm!12449))

(assert (= (and b!116374 c!20612) b!116385))

(assert (= (and b!116374 (not c!20612)) b!116377))

(assert (= (or b!116375 b!116385) bm!12448))

(assert (= (and d!32593 (not res!57030)) b!116373))

(assert (= (and b!116373 res!57029) b!116386))

(declare-fun b_lambda!5171 () Bool)

(assert (=> (not b_lambda!5171) (not d!32593)))

(declare-fun t!5942 () Bool)

(declare-fun tb!2229 () Bool)

(assert (=> (and b!116281 (= (defaultEntry!2715 (v!3046 (underlying!414 thiss!992))) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))) t!5942) tb!2229))

(declare-fun result!3715 () Bool)

(assert (=> tb!2229 (= result!3715 tp_is_empty!2787)))

(assert (=> d!32593 t!5942))

(declare-fun b_and!7247 () Bool)

(assert (= b_and!7239 (and (=> t!5942 result!3715) b_and!7247)))

(declare-fun t!5944 () Bool)

(declare-fun tb!2231 () Bool)

(assert (=> (and b!116275 (= (defaultEntry!2715 newMap!16) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))) t!5944) tb!2231))

(declare-fun result!3719 () Bool)

(assert (= result!3719 result!3715))

(assert (=> d!32593 t!5944))

(declare-fun b_and!7249 () Bool)

(assert (= b_and!7241 (and (=> t!5944 result!3719) b_and!7249)))

(declare-fun m!132463 () Bool)

(assert (=> bm!12447 m!132463))

(declare-fun m!132465 () Bool)

(assert (=> bm!12449 m!132465))

(declare-fun m!132467 () Bool)

(assert (=> bm!12451 m!132467))

(declare-fun m!132469 () Bool)

(assert (=> bm!12448 m!132469))

(declare-fun m!132471 () Bool)

(assert (=> bm!12446 m!132471))

(declare-fun m!132473 () Bool)

(assert (=> bm!12452 m!132473))

(declare-fun m!132475 () Bool)

(assert (=> d!32593 m!132475))

(declare-fun m!132477 () Bool)

(assert (=> d!32593 m!132477))

(declare-fun m!132479 () Bool)

(assert (=> d!32593 m!132479))

(declare-fun m!132481 () Bool)

(assert (=> d!32593 m!132481))

(assert (=> d!32593 m!132477))

(assert (=> d!32593 m!132417))

(assert (=> d!32593 m!132423))

(assert (=> d!32593 m!132479))

(declare-fun m!132483 () Bool)

(assert (=> bm!12454 m!132483))

(declare-fun m!132485 () Bool)

(assert (=> b!116378 m!132485))

(declare-fun m!132487 () Bool)

(assert (=> b!116378 m!132487))

(declare-fun m!132489 () Bool)

(assert (=> b!116378 m!132489))

(declare-fun m!132491 () Bool)

(assert (=> b!116378 m!132491))

(declare-fun m!132493 () Bool)

(assert (=> b!116378 m!132493))

(declare-fun m!132495 () Bool)

(assert (=> bm!12443 m!132495))

(declare-fun m!132497 () Bool)

(assert (=> bm!12445 m!132497))

(declare-fun m!132499 () Bool)

(assert (=> bm!12450 m!132499))

(declare-fun m!132501 () Bool)

(assert (=> b!116373 m!132501))

(declare-fun m!132503 () Bool)

(assert (=> b!116376 m!132503))

(declare-fun m!132505 () Bool)

(assert (=> bm!12442 m!132505))

(declare-fun m!132507 () Bool)

(assert (=> b!116381 m!132507))

(declare-fun m!132509 () Bool)

(assert (=> b!116381 m!132509))

(declare-fun m!132511 () Bool)

(assert (=> b!116386 m!132511))

(declare-fun m!132513 () Bool)

(assert (=> b!116386 m!132513))

(declare-fun m!132515 () Bool)

(assert (=> bm!12444 m!132515))

(declare-fun m!132517 () Bool)

(assert (=> bm!12453 m!132517))

(assert (=> b!116280 d!32593))

(declare-fun d!32595 () Bool)

(assert (=> d!32595 (= (array_inv!1365 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvsge (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116281 d!32595))

(declare-fun d!32597 () Bool)

(assert (=> d!32597 (= (array_inv!1366 (_values!2698 (v!3046 (underlying!414 thiss!992)))) (bvsge (size!2433 (_values!2698 (v!3046 (underlying!414 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116281 d!32597))

(declare-fun d!32599 () Bool)

(declare-fun res!57031 () Bool)

(declare-fun e!75996 () Bool)

(assert (=> d!32599 (=> (not res!57031) (not e!75996))))

(assert (=> d!32599 (= res!57031 (simpleValid!81 newMap!16))))

(assert (=> d!32599 (= (valid!478 newMap!16) e!75996)))

(declare-fun b!116389 () Bool)

(declare-fun res!57032 () Bool)

(assert (=> b!116389 (=> (not res!57032) (not e!75996))))

(assert (=> b!116389 (= res!57032 (= (arrayCountValidKeys!0 (_keys!4438 newMap!16) #b00000000000000000000000000000000 (size!2432 (_keys!4438 newMap!16))) (_size!553 newMap!16)))))

(declare-fun b!116390 () Bool)

(declare-fun res!57033 () Bool)

(assert (=> b!116390 (=> (not res!57033) (not e!75996))))

(assert (=> b!116390 (= res!57033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4438 newMap!16) (mask!6931 newMap!16)))))

(declare-fun b!116391 () Bool)

(assert (=> b!116391 (= e!75996 (arrayNoDuplicates!0 (_keys!4438 newMap!16) #b00000000000000000000000000000000 Nil!1676))))

(assert (= (and d!32599 res!57031) b!116389))

(assert (= (and b!116389 res!57032) b!116390))

(assert (= (and b!116390 res!57033) b!116391))

(declare-fun m!132519 () Bool)

(assert (=> d!32599 m!132519))

(declare-fun m!132521 () Bool)

(assert (=> b!116389 m!132521))

(declare-fun m!132523 () Bool)

(assert (=> b!116390 m!132523))

(declare-fun m!132525 () Bool)

(assert (=> b!116391 m!132525))

(assert (=> b!116272 d!32599))

(declare-fun d!32601 () Bool)

(assert (=> d!32601 (= (valid!479 thiss!992) (valid!478 (v!3046 (underlying!414 thiss!992))))))

(declare-fun bs!4734 () Bool)

(assert (= bs!4734 d!32601))

(assert (=> bs!4734 m!132425))

(assert (=> start!13204 d!32601))

(declare-fun bm!12469 () Bool)

(declare-fun call!12472 () ListLongMap!1653)

(declare-fun call!12477 () ListLongMap!1653)

(assert (=> bm!12469 (= call!12472 call!12477)))

(declare-fun b!116434 () Bool)

(declare-fun e!76032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!116434 (= e!76032 (validKeyInArray!0 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!12470 () Bool)

(declare-fun call!12474 () ListLongMap!1653)

(declare-fun call!12475 () ListLongMap!1653)

(assert (=> bm!12470 (= call!12474 call!12475)))

(declare-fun bm!12471 () Bool)

(declare-fun call!12478 () ListLongMap!1653)

(assert (=> bm!12471 (= call!12478 call!12474)))

(declare-fun b!116435 () Bool)

(declare-fun e!76034 () Bool)

(declare-fun call!12473 () Bool)

(assert (=> b!116435 (= e!76034 (not call!12473))))

(declare-fun b!116436 () Bool)

(declare-fun res!57058 () Bool)

(declare-fun e!76031 () Bool)

(assert (=> b!116436 (=> (not res!57058) (not e!76031))))

(assert (=> b!116436 (= res!57058 e!76034)))

(declare-fun c!20631 () Bool)

(assert (=> b!116436 (= c!20631 (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!116437 () Bool)

(declare-fun e!76028 () ListLongMap!1653)

(assert (=> b!116437 (= e!76028 call!12472)))

(declare-fun d!32603 () Bool)

(assert (=> d!32603 e!76031))

(declare-fun res!57057 () Bool)

(assert (=> d!32603 (=> (not res!57057) (not e!76031))))

(assert (=> d!32603 (= res!57057 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))))))))

(declare-fun lt!60459 () ListLongMap!1653)

(declare-fun lt!60477 () ListLongMap!1653)

(assert (=> d!32603 (= lt!60459 lt!60477)))

(declare-fun lt!60462 () Unit!3615)

(declare-fun e!76023 () Unit!3615)

(assert (=> d!32603 (= lt!60462 e!76023)))

(declare-fun c!20629 () Bool)

(declare-fun e!76025 () Bool)

(assert (=> d!32603 (= c!20629 e!76025)))

(declare-fun res!57060 () Bool)

(assert (=> d!32603 (=> (not res!57060) (not e!76025))))

(assert (=> d!32603 (= res!57060 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun e!76024 () ListLongMap!1653)

(assert (=> d!32603 (= lt!60477 e!76024)))

(declare-fun c!20630 () Bool)

(assert (=> d!32603 (= c!20630 (and (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32603 (validMask!0 (mask!6931 (v!3046 (underlying!414 thiss!992))))))

(assert (=> d!32603 (= (getCurrentListMap!523 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))) lt!60459)))

(declare-fun b!116438 () Bool)

(declare-fun e!76029 () Bool)

(declare-fun apply!105 (ListLongMap!1653 (_ BitVec 64)) V!3363)

(assert (=> b!116438 (= e!76029 (= (apply!105 lt!60459 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116439 () Bool)

(assert (=> b!116439 (= e!76024 e!76028)))

(declare-fun c!20628 () Bool)

(assert (=> b!116439 (= c!20628 (and (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116440 () Bool)

(declare-fun e!76035 () Bool)

(assert (=> b!116440 (= e!76035 (= (apply!105 lt!60459 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2582 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116441 () Bool)

(declare-fun e!76030 () ListLongMap!1653)

(assert (=> b!116441 (= e!76030 call!12472)))

(declare-fun b!116442 () Bool)

(declare-fun Unit!3619 () Unit!3615)

(assert (=> b!116442 (= e!76023 Unit!3619)))

(declare-fun b!116443 () Bool)

(declare-fun e!76027 () Bool)

(declare-fun e!76033 () Bool)

(assert (=> b!116443 (= e!76027 e!76033)))

(declare-fun res!57054 () Bool)

(assert (=> b!116443 (=> (not res!57054) (not e!76033))))

(assert (=> b!116443 (= res!57054 (contains!864 lt!60459 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116443 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun b!116444 () Bool)

(declare-fun e!76026 () Bool)

(declare-fun call!12476 () Bool)

(assert (=> b!116444 (= e!76026 (not call!12476))))

(declare-fun b!116445 () Bool)

(declare-fun lt!60456 () Unit!3615)

(assert (=> b!116445 (= e!76023 lt!60456)))

(declare-fun lt!60467 () ListLongMap!1653)

(assert (=> b!116445 (= lt!60467 (getCurrentListMapNoExtraKeys!129 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60460 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60461 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60461 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60476 () Unit!3615)

(declare-fun addStillContains!81 (ListLongMap!1653 (_ BitVec 64) V!3363 (_ BitVec 64)) Unit!3615)

(assert (=> b!116445 (= lt!60476 (addStillContains!81 lt!60467 lt!60460 (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) lt!60461))))

(assert (=> b!116445 (contains!864 (+!163 lt!60467 (tuple2!2535 lt!60460 (zeroValue!2582 (v!3046 (underlying!414 thiss!992))))) lt!60461)))

(declare-fun lt!60472 () Unit!3615)

(assert (=> b!116445 (= lt!60472 lt!60476)))

(declare-fun lt!60474 () ListLongMap!1653)

(assert (=> b!116445 (= lt!60474 (getCurrentListMapNoExtraKeys!129 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60468 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60471 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60471 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60457 () Unit!3615)

(declare-fun addApplyDifferent!81 (ListLongMap!1653 (_ BitVec 64) V!3363 (_ BitVec 64)) Unit!3615)

(assert (=> b!116445 (= lt!60457 (addApplyDifferent!81 lt!60474 lt!60468 (minValue!2582 (v!3046 (underlying!414 thiss!992))) lt!60471))))

(assert (=> b!116445 (= (apply!105 (+!163 lt!60474 (tuple2!2535 lt!60468 (minValue!2582 (v!3046 (underlying!414 thiss!992))))) lt!60471) (apply!105 lt!60474 lt!60471))))

(declare-fun lt!60458 () Unit!3615)

(assert (=> b!116445 (= lt!60458 lt!60457)))

(declare-fun lt!60473 () ListLongMap!1653)

(assert (=> b!116445 (= lt!60473 (getCurrentListMapNoExtraKeys!129 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60470 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60463 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60463 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60469 () Unit!3615)

(assert (=> b!116445 (= lt!60469 (addApplyDifferent!81 lt!60473 lt!60470 (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) lt!60463))))

(assert (=> b!116445 (= (apply!105 (+!163 lt!60473 (tuple2!2535 lt!60470 (zeroValue!2582 (v!3046 (underlying!414 thiss!992))))) lt!60463) (apply!105 lt!60473 lt!60463))))

(declare-fun lt!60464 () Unit!3615)

(assert (=> b!116445 (= lt!60464 lt!60469)))

(declare-fun lt!60466 () ListLongMap!1653)

(assert (=> b!116445 (= lt!60466 (getCurrentListMapNoExtraKeys!129 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60475 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60475 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60465 () (_ BitVec 64))

(assert (=> b!116445 (= lt!60465 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!116445 (= lt!60456 (addApplyDifferent!81 lt!60466 lt!60475 (minValue!2582 (v!3046 (underlying!414 thiss!992))) lt!60465))))

(assert (=> b!116445 (= (apply!105 (+!163 lt!60466 (tuple2!2535 lt!60475 (minValue!2582 (v!3046 (underlying!414 thiss!992))))) lt!60465) (apply!105 lt!60466 lt!60465))))

(declare-fun bm!12472 () Bool)

(assert (=> bm!12472 (= call!12477 (+!163 (ite c!20630 call!12475 (ite c!20628 call!12474 call!12478)) (ite (or c!20630 c!20628) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2582 (v!3046 (underlying!414 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2582 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116446 () Bool)

(assert (=> b!116446 (= e!76026 e!76035)))

(declare-fun res!57053 () Bool)

(assert (=> b!116446 (= res!57053 call!12476)))

(assert (=> b!116446 (=> (not res!57053) (not e!76035))))

(declare-fun b!116447 () Bool)

(assert (=> b!116447 (= e!76031 e!76026)))

(declare-fun c!20632 () Bool)

(assert (=> b!116447 (= c!20632 (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116448 () Bool)

(assert (=> b!116448 (= e!76024 (+!163 call!12477 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2582 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun b!116449 () Bool)

(assert (=> b!116449 (= e!76034 e!76029)))

(declare-fun res!57059 () Bool)

(assert (=> b!116449 (= res!57059 call!12473)))

(assert (=> b!116449 (=> (not res!57059) (not e!76029))))

(declare-fun b!116450 () Bool)

(declare-fun c!20633 () Bool)

(assert (=> b!116450 (= c!20633 (and (not (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!116450 (= e!76028 e!76030)))

(declare-fun b!116451 () Bool)

(declare-fun res!57056 () Bool)

(assert (=> b!116451 (=> (not res!57056) (not e!76031))))

(assert (=> b!116451 (= res!57056 e!76027)))

(declare-fun res!57052 () Bool)

(assert (=> b!116451 (=> res!57052 e!76027)))

(assert (=> b!116451 (= res!57052 (not e!76032))))

(declare-fun res!57055 () Bool)

(assert (=> b!116451 (=> (not res!57055) (not e!76032))))

(assert (=> b!116451 (= res!57055 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun bm!12473 () Bool)

(assert (=> bm!12473 (= call!12473 (contains!864 lt!60459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12474 () Bool)

(assert (=> bm!12474 (= call!12475 (getCurrentListMapNoExtraKeys!129 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (_values!2698 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992))) (extraKeys!2504 (v!3046 (underlying!414 thiss!992))) (zeroValue!2582 (v!3046 (underlying!414 thiss!992))) (minValue!2582 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun bm!12475 () Bool)

(assert (=> bm!12475 (= call!12476 (contains!864 lt!60459 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116452 () Bool)

(assert (=> b!116452 (= e!76025 (validKeyInArray!0 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116453 () Bool)

(assert (=> b!116453 (= e!76033 (= (apply!105 lt!60459 (select (arr!2171 (_keys!4438 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1406 (select (arr!2172 (_values!2698 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!405 (defaultEntry!2715 (v!3046 (underlying!414 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!116453 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2433 (_values!2698 (v!3046 (underlying!414 thiss!992))))))))

(assert (=> b!116453 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun b!116454 () Bool)

(assert (=> b!116454 (= e!76030 call!12478)))

(assert (= (and d!32603 c!20630) b!116448))

(assert (= (and d!32603 (not c!20630)) b!116439))

(assert (= (and b!116439 c!20628) b!116437))

(assert (= (and b!116439 (not c!20628)) b!116450))

(assert (= (and b!116450 c!20633) b!116441))

(assert (= (and b!116450 (not c!20633)) b!116454))

(assert (= (or b!116441 b!116454) bm!12471))

(assert (= (or b!116437 bm!12471) bm!12470))

(assert (= (or b!116437 b!116441) bm!12469))

(assert (= (or b!116448 bm!12470) bm!12474))

(assert (= (or b!116448 bm!12469) bm!12472))

(assert (= (and d!32603 res!57060) b!116452))

(assert (= (and d!32603 c!20629) b!116445))

(assert (= (and d!32603 (not c!20629)) b!116442))

(assert (= (and d!32603 res!57057) b!116451))

(assert (= (and b!116451 res!57055) b!116434))

(assert (= (and b!116451 (not res!57052)) b!116443))

(assert (= (and b!116443 res!57054) b!116453))

(assert (= (and b!116451 res!57056) b!116436))

(assert (= (and b!116436 c!20631) b!116449))

(assert (= (and b!116436 (not c!20631)) b!116435))

(assert (= (and b!116449 res!57059) b!116438))

(assert (= (or b!116449 b!116435) bm!12473))

(assert (= (and b!116436 res!57058) b!116447))

(assert (= (and b!116447 c!20632) b!116446))

(assert (= (and b!116447 (not c!20632)) b!116444))

(assert (= (and b!116446 res!57053) b!116440))

(assert (= (or b!116446 b!116444) bm!12475))

(declare-fun b_lambda!5173 () Bool)

(assert (=> (not b_lambda!5173) (not b!116453)))

(assert (=> b!116453 t!5942))

(declare-fun b_and!7251 () Bool)

(assert (= b_and!7247 (and (=> t!5942 result!3715) b_and!7251)))

(assert (=> b!116453 t!5944))

(declare-fun b_and!7253 () Bool)

(assert (= b_and!7249 (and (=> t!5944 result!3719) b_and!7253)))

(declare-fun m!132527 () Bool)

(assert (=> bm!12474 m!132527))

(declare-fun m!132529 () Bool)

(assert (=> d!32603 m!132529))

(declare-fun m!132531 () Bool)

(assert (=> b!116440 m!132531))

(declare-fun m!132533 () Bool)

(assert (=> b!116438 m!132533))

(declare-fun m!132535 () Bool)

(assert (=> b!116443 m!132535))

(assert (=> b!116443 m!132535))

(declare-fun m!132537 () Bool)

(assert (=> b!116443 m!132537))

(declare-fun m!132539 () Bool)

(assert (=> b!116453 m!132539))

(assert (=> b!116453 m!132479))

(declare-fun m!132541 () Bool)

(assert (=> b!116453 m!132541))

(assert (=> b!116453 m!132479))

(assert (=> b!116453 m!132535))

(assert (=> b!116453 m!132535))

(declare-fun m!132543 () Bool)

(assert (=> b!116453 m!132543))

(assert (=> b!116453 m!132539))

(assert (=> b!116434 m!132535))

(assert (=> b!116434 m!132535))

(declare-fun m!132545 () Bool)

(assert (=> b!116434 m!132545))

(assert (=> b!116452 m!132535))

(assert (=> b!116452 m!132535))

(assert (=> b!116452 m!132545))

(declare-fun m!132547 () Bool)

(assert (=> b!116445 m!132547))

(declare-fun m!132549 () Bool)

(assert (=> b!116445 m!132549))

(declare-fun m!132551 () Bool)

(assert (=> b!116445 m!132551))

(declare-fun m!132553 () Bool)

(assert (=> b!116445 m!132553))

(declare-fun m!132555 () Bool)

(assert (=> b!116445 m!132555))

(declare-fun m!132557 () Bool)

(assert (=> b!116445 m!132557))

(declare-fun m!132559 () Bool)

(assert (=> b!116445 m!132559))

(declare-fun m!132561 () Bool)

(assert (=> b!116445 m!132561))

(assert (=> b!116445 m!132527))

(declare-fun m!132563 () Bool)

(assert (=> b!116445 m!132563))

(declare-fun m!132565 () Bool)

(assert (=> b!116445 m!132565))

(assert (=> b!116445 m!132535))

(declare-fun m!132567 () Bool)

(assert (=> b!116445 m!132567))

(declare-fun m!132569 () Bool)

(assert (=> b!116445 m!132569))

(assert (=> b!116445 m!132557))

(declare-fun m!132571 () Bool)

(assert (=> b!116445 m!132571))

(assert (=> b!116445 m!132547))

(declare-fun m!132573 () Bool)

(assert (=> b!116445 m!132573))

(assert (=> b!116445 m!132563))

(declare-fun m!132575 () Bool)

(assert (=> b!116445 m!132575))

(assert (=> b!116445 m!132567))

(declare-fun m!132577 () Bool)

(assert (=> bm!12472 m!132577))

(declare-fun m!132579 () Bool)

(assert (=> b!116448 m!132579))

(declare-fun m!132581 () Bool)

(assert (=> bm!12475 m!132581))

(declare-fun m!132583 () Bool)

(assert (=> bm!12473 m!132583))

(assert (=> b!116265 d!32603))

(declare-fun d!32605 () Bool)

(assert (=> d!32605 (= (map!1356 newMap!16) (getCurrentListMap!523 (_keys!4438 newMap!16) (_values!2698 newMap!16) (mask!6931 newMap!16) (extraKeys!2504 newMap!16) (zeroValue!2582 newMap!16) (minValue!2582 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2715 newMap!16)))))

(declare-fun bs!4735 () Bool)

(assert (= bs!4735 d!32605))

(declare-fun m!132585 () Bool)

(assert (=> bs!4735 m!132585))

(assert (=> b!116265 d!32605))

(declare-fun d!32607 () Bool)

(declare-fun res!57061 () Bool)

(declare-fun e!76036 () Bool)

(assert (=> d!32607 (=> (not res!57061) (not e!76036))))

(assert (=> d!32607 (= res!57061 (simpleValid!81 (v!3046 (underlying!414 thiss!992))))))

(assert (=> d!32607 (= (valid!478 (v!3046 (underlying!414 thiss!992))) e!76036)))

(declare-fun b!116455 () Bool)

(declare-fun res!57062 () Bool)

(assert (=> b!116455 (=> (not res!57062) (not e!76036))))

(assert (=> b!116455 (= res!57062 (= (arrayCountValidKeys!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000000 (size!2432 (_keys!4438 (v!3046 (underlying!414 thiss!992))))) (_size!553 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116456 () Bool)

(declare-fun res!57063 () Bool)

(assert (=> b!116456 (=> (not res!57063) (not e!76036))))

(assert (=> b!116456 (= res!57063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4438 (v!3046 (underlying!414 thiss!992))) (mask!6931 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116457 () Bool)

(assert (=> b!116457 (= e!76036 (arrayNoDuplicates!0 (_keys!4438 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000000 Nil!1676))))

(assert (= (and d!32607 res!57061) b!116455))

(assert (= (and b!116455 res!57062) b!116456))

(assert (= (and b!116456 res!57063) b!116457))

(declare-fun m!132587 () Bool)

(assert (=> d!32607 m!132587))

(declare-fun m!132589 () Bool)

(assert (=> b!116455 m!132589))

(declare-fun m!132591 () Bool)

(assert (=> b!116456 m!132591))

(declare-fun m!132593 () Bool)

(assert (=> b!116457 m!132593))

(assert (=> b!116279 d!32607))

(declare-fun b!116465 () Bool)

(declare-fun e!76042 () Bool)

(assert (=> b!116465 (= e!76042 tp_is_empty!2787)))

(declare-fun mapNonEmpty!4309 () Bool)

(declare-fun mapRes!4309 () Bool)

(declare-fun tp!10609 () Bool)

(declare-fun e!76041 () Bool)

(assert (=> mapNonEmpty!4309 (= mapRes!4309 (and tp!10609 e!76041))))

(declare-fun mapValue!4309 () ValueCell!1050)

(declare-fun mapKey!4309 () (_ BitVec 32))

(declare-fun mapRest!4309 () (Array (_ BitVec 32) ValueCell!1050))

(assert (=> mapNonEmpty!4309 (= mapRest!4300 (store mapRest!4309 mapKey!4309 mapValue!4309))))

(declare-fun mapIsEmpty!4309 () Bool)

(assert (=> mapIsEmpty!4309 mapRes!4309))

(declare-fun b!116464 () Bool)

(assert (=> b!116464 (= e!76041 tp_is_empty!2787)))

(declare-fun condMapEmpty!4309 () Bool)

(declare-fun mapDefault!4309 () ValueCell!1050)

(assert (=> mapNonEmpty!4299 (= condMapEmpty!4309 (= mapRest!4300 ((as const (Array (_ BitVec 32) ValueCell!1050)) mapDefault!4309)))))

(assert (=> mapNonEmpty!4299 (= tp!10592 (and e!76042 mapRes!4309))))

(assert (= (and mapNonEmpty!4299 condMapEmpty!4309) mapIsEmpty!4309))

(assert (= (and mapNonEmpty!4299 (not condMapEmpty!4309)) mapNonEmpty!4309))

(assert (= (and mapNonEmpty!4309 ((_ is ValueCellFull!1050) mapValue!4309)) b!116464))

(assert (= (and mapNonEmpty!4299 ((_ is ValueCellFull!1050) mapDefault!4309)) b!116465))

(declare-fun m!132595 () Bool)

(assert (=> mapNonEmpty!4309 m!132595))

(declare-fun b!116467 () Bool)

(declare-fun e!76044 () Bool)

(assert (=> b!116467 (= e!76044 tp_is_empty!2787)))

(declare-fun mapNonEmpty!4310 () Bool)

(declare-fun mapRes!4310 () Bool)

(declare-fun tp!10610 () Bool)

(declare-fun e!76043 () Bool)

(assert (=> mapNonEmpty!4310 (= mapRes!4310 (and tp!10610 e!76043))))

(declare-fun mapValue!4310 () ValueCell!1050)

(declare-fun mapKey!4310 () (_ BitVec 32))

(declare-fun mapRest!4310 () (Array (_ BitVec 32) ValueCell!1050))

(assert (=> mapNonEmpty!4310 (= mapRest!4299 (store mapRest!4310 mapKey!4310 mapValue!4310))))

(declare-fun mapIsEmpty!4310 () Bool)

(assert (=> mapIsEmpty!4310 mapRes!4310))

(declare-fun b!116466 () Bool)

(assert (=> b!116466 (= e!76043 tp_is_empty!2787)))

(declare-fun condMapEmpty!4310 () Bool)

(declare-fun mapDefault!4310 () ValueCell!1050)

(assert (=> mapNonEmpty!4300 (= condMapEmpty!4310 (= mapRest!4299 ((as const (Array (_ BitVec 32) ValueCell!1050)) mapDefault!4310)))))

(assert (=> mapNonEmpty!4300 (= tp!10593 (and e!76044 mapRes!4310))))

(assert (= (and mapNonEmpty!4300 condMapEmpty!4310) mapIsEmpty!4310))

(assert (= (and mapNonEmpty!4300 (not condMapEmpty!4310)) mapNonEmpty!4310))

(assert (= (and mapNonEmpty!4310 ((_ is ValueCellFull!1050) mapValue!4310)) b!116466))

(assert (= (and mapNonEmpty!4300 ((_ is ValueCellFull!1050) mapDefault!4310)) b!116467))

(declare-fun m!132597 () Bool)

(assert (=> mapNonEmpty!4310 m!132597))

(declare-fun b_lambda!5175 () Bool)

(assert (= b_lambda!5173 (or (and b!116281 b_free!2741) (and b!116275 b_free!2743 (= (defaultEntry!2715 newMap!16) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992))))) b_lambda!5175)))

(declare-fun b_lambda!5177 () Bool)

(assert (= b_lambda!5171 (or (and b!116281 b_free!2741) (and b!116275 b_free!2743 (= (defaultEntry!2715 newMap!16) (defaultEntry!2715 (v!3046 (underlying!414 thiss!992))))) b_lambda!5177)))

(check-sat (not bm!12474) (not bm!12452) (not bm!12473) (not d!32601) (not b!116386) (not bm!12444) (not b!116389) (not b!116440) (not bm!12447) (not bm!12446) (not bm!12448) (not d!32587) (not bm!12472) (not bm!12475) (not b!116452) (not d!32593) (not mapNonEmpty!4310) (not d!32605) (not d!32607) (not b_lambda!5175) (not bm!12442) (not bm!12453) (not b!116373) b_and!7251 (not b!116455) (not b!116343) (not b!116390) b_and!7253 (not b!116381) (not b!116445) (not bm!12443) (not b!116378) (not bm!12445) (not b_next!2741) (not b!116434) (not bm!12451) (not b!116453) (not b!116376) tp_is_empty!2787 (not bm!12449) (not b!116448) (not mapNonEmpty!4309) (not bm!12454) (not b!116438) (not b!116456) (not d!32599) (not b!116443) (not b_lambda!5177) (not b!116457) (not b_next!2743) (not b!116342) (not d!32603) (not bm!12450) (not b!116344) (not b!116391))
(check-sat b_and!7251 b_and!7253 (not b_next!2741) (not b_next!2743))
