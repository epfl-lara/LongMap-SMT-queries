; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13156 () Bool)

(assert start!13156)

(declare-fun b!115511 () Bool)

(declare-fun b_free!2713 () Bool)

(declare-fun b_next!2713 () Bool)

(assert (=> b!115511 (= b_free!2713 (not b_next!2713))))

(declare-fun tp!10501 () Bool)

(declare-fun b_and!7169 () Bool)

(assert (=> b!115511 (= tp!10501 b_and!7169)))

(declare-fun b!115505 () Bool)

(declare-fun b_free!2715 () Bool)

(declare-fun b_next!2715 () Bool)

(assert (=> b!115505 (= b_free!2715 (not b_next!2715))))

(declare-fun tp!10502 () Bool)

(declare-fun b_and!7171 () Bool)

(assert (=> b!115505 (= tp!10502 b_and!7171)))

(declare-fun mapIsEmpty!4251 () Bool)

(declare-fun mapRes!4252 () Bool)

(assert (=> mapIsEmpty!4251 mapRes!4252))

(declare-fun b!115500 () Bool)

(declare-fun e!75369 () Bool)

(declare-fun tp_is_empty!2773 () Bool)

(assert (=> b!115500 (= e!75369 tp_is_empty!2773)))

(declare-fun b!115501 () Bool)

(declare-fun res!56643 () Bool)

(declare-fun e!75364 () Bool)

(assert (=> b!115501 (=> (not res!56643) (not e!75364))))

(declare-datatypes ((V!3345 0))(
  ( (V!3346 (val!1431 Int)) )
))
(declare-datatypes ((array!4529 0))(
  ( (array!4530 (arr!2146 (Array (_ BitVec 32) (_ BitVec 64))) (size!2407 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1043 0))(
  ( (ValueCellFull!1043 (v!3023 V!3345)) (EmptyCell!1043) )
))
(declare-datatypes ((array!4531 0))(
  ( (array!4532 (arr!2147 (Array (_ BitVec 32) ValueCell!1043)) (size!2408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!994 0))(
  ( (LongMapFixedSize!995 (defaultEntry!2706 Int) (mask!6915 (_ BitVec 32)) (extraKeys!2495 (_ BitVec 32)) (zeroValue!2573 V!3345) (minValue!2573 V!3345) (_size!546 (_ BitVec 32)) (_keys!4427 array!4529) (_values!2689 array!4531) (_vacant!546 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!994)

(declare-datatypes ((Cell!782 0))(
  ( (Cell!783 (v!3024 LongMapFixedSize!994)) )
))
(declare-datatypes ((LongMap!782 0))(
  ( (LongMap!783 (underlying!402 Cell!782)) )
))
(declare-fun thiss!992 () LongMap!782)

(assert (=> b!115501 (= res!56643 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6915 newMap!16)) (_size!546 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115502 () Bool)

(declare-fun res!56646 () Bool)

(assert (=> b!115502 (=> (not res!56646) (not e!75364))))

(declare-fun valid!474 (LongMapFixedSize!994) Bool)

(assert (=> b!115502 (= res!56646 (valid!474 newMap!16))))

(declare-fun b!115503 () Bool)

(declare-fun res!56644 () Bool)

(assert (=> b!115503 (=> (not res!56644) (not e!75364))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115503 (= res!56644 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun b!115504 () Bool)

(declare-fun e!75370 () Bool)

(declare-fun e!75371 () Bool)

(declare-fun mapRes!4251 () Bool)

(assert (=> b!115504 (= e!75370 (and e!75371 mapRes!4251))))

(declare-fun condMapEmpty!4252 () Bool)

(declare-fun mapDefault!4252 () ValueCell!1043)

(assert (=> b!115504 (= condMapEmpty!4252 (= (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4252)))))

(declare-fun e!75367 () Bool)

(declare-fun e!75366 () Bool)

(declare-fun array_inv!1359 (array!4529) Bool)

(declare-fun array_inv!1360 (array!4531) Bool)

(assert (=> b!115505 (= e!75367 (and tp!10502 tp_is_empty!2773 (array_inv!1359 (_keys!4427 newMap!16)) (array_inv!1360 (_values!2689 newMap!16)) e!75366))))

(declare-fun b!115506 () Bool)

(declare-fun e!75363 () Bool)

(assert (=> b!115506 (= e!75366 (and e!75363 mapRes!4252))))

(declare-fun condMapEmpty!4251 () Bool)

(declare-fun mapDefault!4251 () ValueCell!1043)

(assert (=> b!115506 (= condMapEmpty!4251 (= (arr!2147 (_values!2689 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4251)))))

(declare-fun b!115507 () Bool)

(declare-fun e!75362 () Bool)

(assert (=> b!115507 (= e!75362 tp_is_empty!2773)))

(declare-fun mapNonEmpty!4251 () Bool)

(declare-fun tp!10503 () Bool)

(assert (=> mapNonEmpty!4251 (= mapRes!4252 (and tp!10503 e!75369))))

(declare-fun mapKey!4251 () (_ BitVec 32))

(declare-fun mapRest!4252 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapValue!4252 () ValueCell!1043)

(assert (=> mapNonEmpty!4251 (= (arr!2147 (_values!2689 newMap!16)) (store mapRest!4252 mapKey!4251 mapValue!4252))))

(declare-fun b!115508 () Bool)

(declare-fun e!75375 () Bool)

(declare-fun e!75372 () Bool)

(assert (=> b!115508 (= e!75375 e!75372)))

(declare-fun mapIsEmpty!4252 () Bool)

(assert (=> mapIsEmpty!4252 mapRes!4251))

(declare-fun res!56642 () Bool)

(assert (=> start!13156 (=> (not res!56642) (not e!75364))))

(declare-fun valid!475 (LongMap!782) Bool)

(assert (=> start!13156 (= res!56642 (valid!475 thiss!992))))

(assert (=> start!13156 e!75364))

(assert (=> start!13156 e!75375))

(assert (=> start!13156 true))

(assert (=> start!13156 e!75367))

(declare-fun b!115509 () Bool)

(assert (=> b!115509 (= e!75363 tp_is_empty!2773)))

(declare-fun mapNonEmpty!4252 () Bool)

(declare-fun tp!10504 () Bool)

(assert (=> mapNonEmpty!4252 (= mapRes!4251 (and tp!10504 e!75362))))

(declare-fun mapValue!4251 () ValueCell!1043)

(declare-fun mapKey!4252 () (_ BitVec 32))

(declare-fun mapRest!4251 () (Array (_ BitVec 32) ValueCell!1043))

(assert (=> mapNonEmpty!4252 (= (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (store mapRest!4251 mapKey!4252 mapValue!4251))))

(declare-fun b!115510 () Bool)

(declare-fun e!75374 () Bool)

(assert (=> b!115510 (= e!75372 e!75374)))

(assert (=> b!115511 (= e!75374 (and tp!10501 tp_is_empty!2773 (array_inv!1359 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (array_inv!1360 (_values!2689 (v!3024 (underlying!402 thiss!992)))) e!75370))))

(declare-datatypes ((tuple2!2484 0))(
  ( (tuple2!2485 (_1!1253 (_ BitVec 64)) (_2!1253 V!3345)) )
))
(declare-datatypes ((List!1666 0))(
  ( (Nil!1663) (Cons!1662 (h!2262 tuple2!2484) (t!5915 List!1666)) )
))
(declare-datatypes ((ListLongMap!1609 0))(
  ( (ListLongMap!1610 (toList!820 List!1666)) )
))
(declare-fun lt!59918 () ListLongMap!1609)

(declare-fun e!75365 () Bool)

(declare-fun b!115512 () Bool)

(declare-fun getCurrentListMap!491 (array!4529 array!4531 (_ BitVec 32) (_ BitVec 32) V!3345 V!3345 (_ BitVec 32) Int) ListLongMap!1609)

(assert (=> b!115512 (= e!75365 (not (= (getCurrentListMap!491 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) lt!59918)))))

(declare-fun b!115513 () Bool)

(assert (=> b!115513 (= e!75371 tp_is_empty!2773)))

(declare-fun b!115514 () Bool)

(assert (=> b!115514 (= e!75364 e!75365)))

(declare-fun res!56645 () Bool)

(assert (=> b!115514 (=> (not res!56645) (not e!75365))))

(declare-fun lt!59919 () ListLongMap!1609)

(assert (=> b!115514 (= res!56645 (and (= lt!59919 lt!59918) (or (= (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun map!1329 (LongMapFixedSize!994) ListLongMap!1609)

(assert (=> b!115514 (= lt!59918 (map!1329 newMap!16))))

(assert (=> b!115514 (= lt!59919 (getCurrentListMap!491 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(assert (= (and start!13156 res!56642) b!115503))

(assert (= (and b!115503 res!56644) b!115502))

(assert (= (and b!115502 res!56646) b!115501))

(assert (= (and b!115501 res!56643) b!115514))

(assert (= (and b!115514 res!56645) b!115512))

(assert (= (and b!115504 condMapEmpty!4252) mapIsEmpty!4252))

(assert (= (and b!115504 (not condMapEmpty!4252)) mapNonEmpty!4252))

(get-info :version)

(assert (= (and mapNonEmpty!4252 ((_ is ValueCellFull!1043) mapValue!4251)) b!115507))

(assert (= (and b!115504 ((_ is ValueCellFull!1043) mapDefault!4252)) b!115513))

(assert (= b!115511 b!115504))

(assert (= b!115510 b!115511))

(assert (= b!115508 b!115510))

(assert (= start!13156 b!115508))

(assert (= (and b!115506 condMapEmpty!4251) mapIsEmpty!4251))

(assert (= (and b!115506 (not condMapEmpty!4251)) mapNonEmpty!4251))

(assert (= (and mapNonEmpty!4251 ((_ is ValueCellFull!1043) mapValue!4252)) b!115500))

(assert (= (and b!115506 ((_ is ValueCellFull!1043) mapDefault!4251)) b!115509))

(assert (= b!115505 b!115506))

(assert (= start!13156 b!115505))

(declare-fun m!131307 () Bool)

(assert (=> mapNonEmpty!4252 m!131307))

(declare-fun m!131309 () Bool)

(assert (=> b!115505 m!131309))

(declare-fun m!131311 () Bool)

(assert (=> b!115505 m!131311))

(declare-fun m!131313 () Bool)

(assert (=> b!115502 m!131313))

(declare-fun m!131315 () Bool)

(assert (=> b!115511 m!131315))

(declare-fun m!131317 () Bool)

(assert (=> b!115511 m!131317))

(declare-fun m!131319 () Bool)

(assert (=> b!115512 m!131319))

(declare-fun m!131321 () Bool)

(assert (=> start!13156 m!131321))

(declare-fun m!131323 () Bool)

(assert (=> mapNonEmpty!4251 m!131323))

(declare-fun m!131325 () Bool)

(assert (=> b!115514 m!131325))

(declare-fun m!131327 () Bool)

(assert (=> b!115514 m!131327))

(declare-fun m!131329 () Bool)

(assert (=> b!115514 m!131329))

(check-sat (not mapNonEmpty!4251) (not b!115512) tp_is_empty!2773 (not mapNonEmpty!4252) (not b!115502) (not b!115505) b_and!7169 (not b!115511) (not start!13156) (not b_next!2715) (not b_next!2713) (not b!115514) b_and!7171)
(check-sat b_and!7169 b_and!7171 (not b_next!2713) (not b_next!2715))
(get-model)

(declare-fun d!32375 () Bool)

(declare-fun res!56683 () Bool)

(declare-fun e!75462 () Bool)

(assert (=> d!32375 (=> (not res!56683) (not e!75462))))

(declare-fun simpleValid!80 (LongMapFixedSize!994) Bool)

(assert (=> d!32375 (= res!56683 (simpleValid!80 newMap!16))))

(assert (=> d!32375 (= (valid!474 newMap!16) e!75462)))

(declare-fun b!115611 () Bool)

(declare-fun res!56684 () Bool)

(assert (=> b!115611 (=> (not res!56684) (not e!75462))))

(declare-fun arrayCountValidKeys!0 (array!4529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!115611 (= res!56684 (= (arrayCountValidKeys!0 (_keys!4427 newMap!16) #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))) (_size!546 newMap!16)))))

(declare-fun b!115612 () Bool)

(declare-fun res!56685 () Bool)

(assert (=> b!115612 (=> (not res!56685) (not e!75462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4529 (_ BitVec 32)) Bool)

(assert (=> b!115612 (= res!56685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4427 newMap!16) (mask!6915 newMap!16)))))

(declare-fun b!115613 () Bool)

(declare-datatypes ((List!1669 0))(
  ( (Nil!1666) (Cons!1665 (h!2265 (_ BitVec 64)) (t!5922 List!1669)) )
))
(declare-fun arrayNoDuplicates!0 (array!4529 (_ BitVec 32) List!1669) Bool)

(assert (=> b!115613 (= e!75462 (arrayNoDuplicates!0 (_keys!4427 newMap!16) #b00000000000000000000000000000000 Nil!1666))))

(assert (= (and d!32375 res!56683) b!115611))

(assert (= (and b!115611 res!56684) b!115612))

(assert (= (and b!115612 res!56685) b!115613))

(declare-fun m!131379 () Bool)

(assert (=> d!32375 m!131379))

(declare-fun m!131381 () Bool)

(assert (=> b!115611 m!131381))

(declare-fun m!131383 () Bool)

(assert (=> b!115612 m!131383))

(declare-fun m!131385 () Bool)

(assert (=> b!115613 m!131385))

(assert (=> b!115502 d!32375))

(declare-fun d!32377 () Bool)

(assert (=> d!32377 (= (valid!475 thiss!992) (valid!474 (v!3024 (underlying!402 thiss!992))))))

(declare-fun bs!4694 () Bool)

(assert (= bs!4694 d!32377))

(declare-fun m!131387 () Bool)

(assert (=> bs!4694 m!131387))

(assert (=> start!13156 d!32377))

(declare-fun d!32379 () Bool)

(assert (=> d!32379 (= (map!1329 newMap!16) (getCurrentListMap!491 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun bs!4695 () Bool)

(assert (= bs!4695 d!32379))

(declare-fun m!131389 () Bool)

(assert (=> bs!4695 m!131389))

(assert (=> b!115514 d!32379))

(declare-fun b!115656 () Bool)

(declare-datatypes ((Unit!3588 0))(
  ( (Unit!3589) )
))
(declare-fun e!75490 () Unit!3588)

(declare-fun Unit!3590 () Unit!3588)

(assert (=> b!115656 (= e!75490 Unit!3590)))

(declare-fun bm!12366 () Bool)

(declare-fun call!12373 () ListLongMap!1609)

(declare-fun getCurrentListMapNoExtraKeys!116 (array!4529 array!4531 (_ BitVec 32) (_ BitVec 32) V!3345 V!3345 (_ BitVec 32) Int) ListLongMap!1609)

(assert (=> bm!12366 (= call!12373 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115657 () Bool)

(declare-fun e!75491 () Bool)

(declare-fun e!75492 () Bool)

(assert (=> b!115657 (= e!75491 e!75492)))

(declare-fun res!56705 () Bool)

(declare-fun call!12371 () Bool)

(assert (=> b!115657 (= res!56705 call!12371)))

(assert (=> b!115657 (=> (not res!56705) (not e!75492))))

(declare-fun b!115658 () Bool)

(declare-fun e!75496 () Bool)

(assert (=> b!115658 (= e!75496 e!75491)))

(declare-fun c!20518 () Bool)

(assert (=> b!115658 (= c!20518 (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115659 () Bool)

(declare-fun e!75493 () Bool)

(declare-fun lt!59996 () ListLongMap!1609)

(declare-fun apply!104 (ListLongMap!1609 (_ BitVec 64)) V!3345)

(assert (=> b!115659 (= e!75493 (= (apply!104 lt!59996 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115660 () Bool)

(declare-fun e!75500 () Bool)

(declare-fun e!75501 () Bool)

(assert (=> b!115660 (= e!75500 e!75501)))

(declare-fun res!56712 () Bool)

(assert (=> b!115660 (=> (not res!56712) (not e!75501))))

(declare-fun contains!850 (ListLongMap!1609 (_ BitVec 64)) Bool)

(assert (=> b!115660 (= res!56712 (contains!850 lt!59996 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115660 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun bm!12367 () Bool)

(declare-fun call!12369 () Bool)

(assert (=> bm!12367 (= call!12369 (contains!850 lt!59996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12368 () Bool)

(assert (=> bm!12368 (= call!12371 (contains!850 lt!59996 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115661 () Bool)

(declare-fun res!56708 () Bool)

(assert (=> b!115661 (=> (not res!56708) (not e!75496))))

(declare-fun e!75497 () Bool)

(assert (=> b!115661 (= res!56708 e!75497)))

(declare-fun c!20515 () Bool)

(assert (=> b!115661 (= c!20515 (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12369 () Bool)

(declare-fun call!12372 () ListLongMap!1609)

(declare-fun call!12375 () ListLongMap!1609)

(assert (=> bm!12369 (= call!12372 call!12375)))

(declare-fun b!115662 () Bool)

(declare-fun lt!59988 () Unit!3588)

(assert (=> b!115662 (= e!75490 lt!59988)))

(declare-fun lt!59985 () ListLongMap!1609)

(assert (=> b!115662 (= lt!59985 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!59989 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59994 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59994 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59979 () Unit!3588)

(declare-fun addStillContains!80 (ListLongMap!1609 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3588)

(assert (=> b!115662 (= lt!59979 (addStillContains!80 lt!59985 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59994))))

(declare-fun +!151 (ListLongMap!1609 tuple2!2484) ListLongMap!1609)

(assert (=> b!115662 (contains!850 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59994)))

(declare-fun lt!59977 () Unit!3588)

(assert (=> b!115662 (= lt!59977 lt!59979)))

(declare-fun lt!59995 () ListLongMap!1609)

(assert (=> b!115662 (= lt!59995 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!59987 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59987 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59992 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59992 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59983 () Unit!3588)

(declare-fun addApplyDifferent!80 (ListLongMap!1609 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3588)

(assert (=> b!115662 (= lt!59983 (addApplyDifferent!80 lt!59995 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59992))))

(assert (=> b!115662 (= (apply!104 (+!151 lt!59995 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59992) (apply!104 lt!59995 lt!59992))))

(declare-fun lt!59980 () Unit!3588)

(assert (=> b!115662 (= lt!59980 lt!59983)))

(declare-fun lt!59991 () ListLongMap!1609)

(assert (=> b!115662 (= lt!59991 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!59982 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59982 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59984 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59984 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!59978 () Unit!3588)

(assert (=> b!115662 (= lt!59978 (addApplyDifferent!80 lt!59991 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59984))))

(assert (=> b!115662 (= (apply!104 (+!151 lt!59991 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59984) (apply!104 lt!59991 lt!59984))))

(declare-fun lt!59993 () Unit!3588)

(assert (=> b!115662 (= lt!59993 lt!59978)))

(declare-fun lt!59981 () ListLongMap!1609)

(assert (=> b!115662 (= lt!59981 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!59997 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59997 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!59990 () (_ BitVec 64))

(assert (=> b!115662 (= lt!59990 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!115662 (= lt!59988 (addApplyDifferent!80 lt!59981 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59990))))

(assert (=> b!115662 (= (apply!104 (+!151 lt!59981 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59990) (apply!104 lt!59981 lt!59990))))

(declare-fun b!115663 () Bool)

(declare-fun c!20514 () Bool)

(assert (=> b!115663 (= c!20514 (and (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75498 () ListLongMap!1609)

(declare-fun e!75489 () ListLongMap!1609)

(assert (=> b!115663 (= e!75498 e!75489)))

(declare-fun bm!12370 () Bool)

(declare-fun call!12370 () ListLongMap!1609)

(declare-fun call!12374 () ListLongMap!1609)

(assert (=> bm!12370 (= call!12370 call!12374)))

(declare-fun b!115664 () Bool)

(declare-fun e!75495 () ListLongMap!1609)

(assert (=> b!115664 (= e!75495 e!75498)))

(declare-fun c!20513 () Bool)

(assert (=> b!115664 (= c!20513 (and (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!32381 () Bool)

(assert (=> d!32381 e!75496))

(declare-fun res!56711 () Bool)

(assert (=> d!32381 (=> (not res!56711) (not e!75496))))

(assert (=> d!32381 (= res!56711 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun lt!59976 () ListLongMap!1609)

(assert (=> d!32381 (= lt!59996 lt!59976)))

(declare-fun lt!59986 () Unit!3588)

(assert (=> d!32381 (= lt!59986 e!75490)))

(declare-fun c!20517 () Bool)

(declare-fun e!75494 () Bool)

(assert (=> d!32381 (= c!20517 e!75494)))

(declare-fun res!56706 () Bool)

(assert (=> d!32381 (=> (not res!56706) (not e!75494))))

(assert (=> d!32381 (= res!56706 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> d!32381 (= lt!59976 e!75495)))

(declare-fun c!20516 () Bool)

(assert (=> d!32381 (= c!20516 (and (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32381 (validMask!0 (mask!6915 (v!3024 (underlying!402 thiss!992))))))

(assert (=> d!32381 (= (getCurrentListMap!491 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) lt!59996)))

(declare-fun b!115665 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!115665 (= e!75494 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!12371 () Bool)

(assert (=> bm!12371 (= call!12374 call!12373)))

(declare-fun b!115666 () Bool)

(assert (=> b!115666 (= e!75492 (= (apply!104 lt!59996 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115667 () Bool)

(declare-fun e!75499 () Bool)

(assert (=> b!115667 (= e!75499 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115668 () Bool)

(declare-fun res!56707 () Bool)

(assert (=> b!115668 (=> (not res!56707) (not e!75496))))

(assert (=> b!115668 (= res!56707 e!75500)))

(declare-fun res!56710 () Bool)

(assert (=> b!115668 (=> res!56710 e!75500)))

(assert (=> b!115668 (= res!56710 (not e!75499))))

(declare-fun res!56704 () Bool)

(assert (=> b!115668 (=> (not res!56704) (not e!75499))))

(assert (=> b!115668 (= res!56704 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115669 () Bool)

(declare-fun get!1397 (ValueCell!1043 V!3345) V!3345)

(declare-fun dynLambda!400 (Int (_ BitVec 64)) V!3345)

(assert (=> b!115669 (= e!75501 (= (apply!104 lt!59996 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115669 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2408 (_values!2689 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> b!115669 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115670 () Bool)

(assert (=> b!115670 (= e!75497 e!75493)))

(declare-fun res!56709 () Bool)

(assert (=> b!115670 (= res!56709 call!12369)))

(assert (=> b!115670 (=> (not res!56709) (not e!75493))))

(declare-fun b!115671 () Bool)

(assert (=> b!115671 (= e!75491 (not call!12371))))

(declare-fun b!115672 () Bool)

(assert (=> b!115672 (= e!75495 (+!151 call!12375 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun bm!12372 () Bool)

(assert (=> bm!12372 (= call!12375 (+!151 (ite c!20516 call!12373 (ite c!20513 call!12374 call!12370)) (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun b!115673 () Bool)

(assert (=> b!115673 (= e!75489 call!12372)))

(declare-fun b!115674 () Bool)

(assert (=> b!115674 (= e!75498 call!12372)))

(declare-fun b!115675 () Bool)

(assert (=> b!115675 (= e!75497 (not call!12369))))

(declare-fun b!115676 () Bool)

(assert (=> b!115676 (= e!75489 call!12370)))

(assert (= (and d!32381 c!20516) b!115672))

(assert (= (and d!32381 (not c!20516)) b!115664))

(assert (= (and b!115664 c!20513) b!115674))

(assert (= (and b!115664 (not c!20513)) b!115663))

(assert (= (and b!115663 c!20514) b!115673))

(assert (= (and b!115663 (not c!20514)) b!115676))

(assert (= (or b!115673 b!115676) bm!12370))

(assert (= (or b!115674 bm!12370) bm!12371))

(assert (= (or b!115674 b!115673) bm!12369))

(assert (= (or b!115672 bm!12371) bm!12366))

(assert (= (or b!115672 bm!12369) bm!12372))

(assert (= (and d!32381 res!56706) b!115665))

(assert (= (and d!32381 c!20517) b!115662))

(assert (= (and d!32381 (not c!20517)) b!115656))

(assert (= (and d!32381 res!56711) b!115668))

(assert (= (and b!115668 res!56704) b!115667))

(assert (= (and b!115668 (not res!56710)) b!115660))

(assert (= (and b!115660 res!56712) b!115669))

(assert (= (and b!115668 res!56707) b!115661))

(assert (= (and b!115661 c!20515) b!115670))

(assert (= (and b!115661 (not c!20515)) b!115675))

(assert (= (and b!115670 res!56709) b!115659))

(assert (= (or b!115670 b!115675) bm!12367))

(assert (= (and b!115661 res!56708) b!115658))

(assert (= (and b!115658 c!20518) b!115657))

(assert (= (and b!115658 (not c!20518)) b!115671))

(assert (= (and b!115657 res!56705) b!115666))

(assert (= (or b!115657 b!115671) bm!12368))

(declare-fun b_lambda!5133 () Bool)

(assert (=> (not b_lambda!5133) (not b!115669)))

(declare-fun t!5919 () Bool)

(declare-fun tb!2217 () Bool)

(assert (=> (and b!115511 (= (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) t!5919) tb!2217))

(declare-fun result!3699 () Bool)

(assert (=> tb!2217 (= result!3699 tp_is_empty!2773)))

(assert (=> b!115669 t!5919))

(declare-fun b_and!7181 () Bool)

(assert (= b_and!7169 (and (=> t!5919 result!3699) b_and!7181)))

(declare-fun t!5921 () Bool)

(declare-fun tb!2219 () Bool)

(assert (=> (and b!115505 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) t!5921) tb!2219))

(declare-fun result!3703 () Bool)

(assert (= result!3703 result!3699))

(assert (=> b!115669 t!5921))

(declare-fun b_and!7183 () Bool)

(assert (= b_and!7171 (and (=> t!5921 result!3703) b_and!7183)))

(declare-fun m!131391 () Bool)

(assert (=> bm!12366 m!131391))

(declare-fun m!131393 () Bool)

(assert (=> b!115659 m!131393))

(declare-fun m!131395 () Bool)

(assert (=> d!32381 m!131395))

(declare-fun m!131397 () Bool)

(assert (=> b!115666 m!131397))

(declare-fun m!131399 () Bool)

(assert (=> bm!12367 m!131399))

(declare-fun m!131401 () Bool)

(assert (=> b!115669 m!131401))

(declare-fun m!131403 () Bool)

(assert (=> b!115669 m!131403))

(declare-fun m!131405 () Bool)

(assert (=> b!115669 m!131405))

(declare-fun m!131407 () Bool)

(assert (=> b!115669 m!131407))

(declare-fun m!131409 () Bool)

(assert (=> b!115669 m!131409))

(assert (=> b!115669 m!131401))

(assert (=> b!115669 m!131407))

(assert (=> b!115669 m!131405))

(declare-fun m!131411 () Bool)

(assert (=> bm!12368 m!131411))

(declare-fun m!131413 () Bool)

(assert (=> b!115662 m!131413))

(declare-fun m!131415 () Bool)

(assert (=> b!115662 m!131415))

(declare-fun m!131417 () Bool)

(assert (=> b!115662 m!131417))

(declare-fun m!131419 () Bool)

(assert (=> b!115662 m!131419))

(declare-fun m!131421 () Bool)

(assert (=> b!115662 m!131421))

(assert (=> b!115662 m!131401))

(declare-fun m!131423 () Bool)

(assert (=> b!115662 m!131423))

(declare-fun m!131425 () Bool)

(assert (=> b!115662 m!131425))

(declare-fun m!131427 () Bool)

(assert (=> b!115662 m!131427))

(assert (=> b!115662 m!131421))

(declare-fun m!131429 () Bool)

(assert (=> b!115662 m!131429))

(assert (=> b!115662 m!131417))

(declare-fun m!131431 () Bool)

(assert (=> b!115662 m!131431))

(assert (=> b!115662 m!131391))

(assert (=> b!115662 m!131425))

(declare-fun m!131433 () Bool)

(assert (=> b!115662 m!131433))

(declare-fun m!131435 () Bool)

(assert (=> b!115662 m!131435))

(assert (=> b!115662 m!131427))

(declare-fun m!131437 () Bool)

(assert (=> b!115662 m!131437))

(declare-fun m!131439 () Bool)

(assert (=> b!115662 m!131439))

(declare-fun m!131441 () Bool)

(assert (=> b!115662 m!131441))

(assert (=> b!115665 m!131401))

(assert (=> b!115665 m!131401))

(declare-fun m!131443 () Bool)

(assert (=> b!115665 m!131443))

(declare-fun m!131445 () Bool)

(assert (=> bm!12372 m!131445))

(declare-fun m!131447 () Bool)

(assert (=> b!115672 m!131447))

(assert (=> b!115660 m!131401))

(assert (=> b!115660 m!131401))

(declare-fun m!131449 () Bool)

(assert (=> b!115660 m!131449))

(assert (=> b!115667 m!131401))

(assert (=> b!115667 m!131401))

(assert (=> b!115667 m!131443))

(assert (=> b!115514 d!32381))

(declare-fun d!32383 () Bool)

(assert (=> d!32383 (= (array_inv!1359 (_keys!4427 newMap!16)) (bvsge (size!2407 (_keys!4427 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115505 d!32383))

(declare-fun d!32385 () Bool)

(assert (=> d!32385 (= (array_inv!1360 (_values!2689 newMap!16)) (bvsge (size!2408 (_values!2689 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115505 d!32385))

(declare-fun b!115679 () Bool)

(declare-fun e!75503 () Unit!3588)

(declare-fun Unit!3591 () Unit!3588)

(assert (=> b!115679 (= e!75503 Unit!3591)))

(declare-fun bm!12373 () Bool)

(declare-fun call!12380 () ListLongMap!1609)

(assert (=> bm!12373 (= call!12380 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115680 () Bool)

(declare-fun e!75504 () Bool)

(declare-fun e!75505 () Bool)

(assert (=> b!115680 (= e!75504 e!75505)))

(declare-fun res!56714 () Bool)

(declare-fun call!12378 () Bool)

(assert (=> b!115680 (= res!56714 call!12378)))

(assert (=> b!115680 (=> (not res!56714) (not e!75505))))

(declare-fun b!115681 () Bool)

(declare-fun e!75509 () Bool)

(assert (=> b!115681 (= e!75509 e!75504)))

(declare-fun c!20524 () Bool)

(assert (=> b!115681 (= c!20524 (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115682 () Bool)

(declare-fun e!75506 () Bool)

(declare-fun lt!60018 () ListLongMap!1609)

(assert (=> b!115682 (= e!75506 (= (apply!104 lt!60018 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115683 () Bool)

(declare-fun e!75513 () Bool)

(declare-fun e!75514 () Bool)

(assert (=> b!115683 (= e!75513 e!75514)))

(declare-fun res!56721 () Bool)

(assert (=> b!115683 (=> (not res!56721) (not e!75514))))

(assert (=> b!115683 (= res!56721 (contains!850 lt!60018 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115683 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun bm!12374 () Bool)

(declare-fun call!12376 () Bool)

(assert (=> bm!12374 (= call!12376 (contains!850 lt!60018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12375 () Bool)

(assert (=> bm!12375 (= call!12378 (contains!850 lt!60018 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115684 () Bool)

(declare-fun res!56717 () Bool)

(assert (=> b!115684 (=> (not res!56717) (not e!75509))))

(declare-fun e!75510 () Bool)

(assert (=> b!115684 (= res!56717 e!75510)))

(declare-fun c!20521 () Bool)

(assert (=> b!115684 (= c!20521 (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12376 () Bool)

(declare-fun call!12379 () ListLongMap!1609)

(declare-fun call!12382 () ListLongMap!1609)

(assert (=> bm!12376 (= call!12379 call!12382)))

(declare-fun b!115685 () Bool)

(declare-fun lt!60010 () Unit!3588)

(assert (=> b!115685 (= e!75503 lt!60010)))

(declare-fun lt!60007 () ListLongMap!1609)

(assert (=> b!115685 (= lt!60007 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!60011 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60016 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60016 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60001 () Unit!3588)

(assert (=> b!115685 (= lt!60001 (addStillContains!80 lt!60007 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60016))))

(assert (=> b!115685 (contains!850 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60016)))

(declare-fun lt!59999 () Unit!3588)

(assert (=> b!115685 (= lt!59999 lt!60001)))

(declare-fun lt!60017 () ListLongMap!1609)

(assert (=> b!115685 (= lt!60017 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!60009 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60009 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60014 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60014 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60005 () Unit!3588)

(assert (=> b!115685 (= lt!60005 (addApplyDifferent!80 lt!60017 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60014))))

(assert (=> b!115685 (= (apply!104 (+!151 lt!60017 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60014) (apply!104 lt!60017 lt!60014))))

(declare-fun lt!60002 () Unit!3588)

(assert (=> b!115685 (= lt!60002 lt!60005)))

(declare-fun lt!60013 () ListLongMap!1609)

(assert (=> b!115685 (= lt!60013 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!60004 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60004 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60006 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60006 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60000 () Unit!3588)

(assert (=> b!115685 (= lt!60000 (addApplyDifferent!80 lt!60013 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60006))))

(assert (=> b!115685 (= (apply!104 (+!151 lt!60013 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60006) (apply!104 lt!60013 lt!60006))))

(declare-fun lt!60015 () Unit!3588)

(assert (=> b!115685 (= lt!60015 lt!60000)))

(declare-fun lt!60003 () ListLongMap!1609)

(assert (=> b!115685 (= lt!60003 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun lt!60019 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60019 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60012 () (_ BitVec 64))

(assert (=> b!115685 (= lt!60012 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(assert (=> b!115685 (= lt!60010 (addApplyDifferent!80 lt!60003 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60012))))

(assert (=> b!115685 (= (apply!104 (+!151 lt!60003 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60012) (apply!104 lt!60003 lt!60012))))

(declare-fun b!115686 () Bool)

(declare-fun c!20520 () Bool)

(assert (=> b!115686 (= c!20520 (and (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75511 () ListLongMap!1609)

(declare-fun e!75502 () ListLongMap!1609)

(assert (=> b!115686 (= e!75511 e!75502)))

(declare-fun bm!12377 () Bool)

(declare-fun call!12377 () ListLongMap!1609)

(declare-fun call!12381 () ListLongMap!1609)

(assert (=> bm!12377 (= call!12377 call!12381)))

(declare-fun b!115687 () Bool)

(declare-fun e!75508 () ListLongMap!1609)

(assert (=> b!115687 (= e!75508 e!75511)))

(declare-fun c!20519 () Bool)

(assert (=> b!115687 (= c!20519 (and (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!32387 () Bool)

(assert (=> d!32387 e!75509))

(declare-fun res!56720 () Bool)

(assert (=> d!32387 (=> (not res!56720) (not e!75509))))

(assert (=> d!32387 (= res!56720 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun lt!59998 () ListLongMap!1609)

(assert (=> d!32387 (= lt!60018 lt!59998)))

(declare-fun lt!60008 () Unit!3588)

(assert (=> d!32387 (= lt!60008 e!75503)))

(declare-fun c!20523 () Bool)

(declare-fun e!75507 () Bool)

(assert (=> d!32387 (= c!20523 e!75507)))

(declare-fun res!56715 () Bool)

(assert (=> d!32387 (=> (not res!56715) (not e!75507))))

(assert (=> d!32387 (= res!56715 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> d!32387 (= lt!59998 e!75508)))

(declare-fun c!20522 () Bool)

(assert (=> d!32387 (= c!20522 (and (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32387 (validMask!0 (mask!6915 (v!3024 (underlying!402 thiss!992))))))

(assert (=> d!32387 (= (getCurrentListMap!491 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) lt!60018)))

(declare-fun b!115688 () Bool)

(assert (=> b!115688 (= e!75507 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun bm!12378 () Bool)

(assert (=> bm!12378 (= call!12381 call!12380)))

(declare-fun b!115689 () Bool)

(assert (=> b!115689 (= e!75505 (= (apply!104 lt!60018 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115690 () Bool)

(declare-fun e!75512 () Bool)

(assert (=> b!115690 (= e!75512 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115691 () Bool)

(declare-fun res!56716 () Bool)

(assert (=> b!115691 (=> (not res!56716) (not e!75509))))

(assert (=> b!115691 (= res!56716 e!75513)))

(declare-fun res!56719 () Bool)

(assert (=> b!115691 (=> res!56719 e!75513)))

(assert (=> b!115691 (= res!56719 (not e!75512))))

(declare-fun res!56713 () Bool)

(assert (=> b!115691 (=> (not res!56713) (not e!75512))))

(assert (=> b!115691 (= res!56713 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115692 () Bool)

(assert (=> b!115692 (= e!75514 (= (apply!104 lt!60018 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115692 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2408 (_values!2689 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> b!115692 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115693 () Bool)

(assert (=> b!115693 (= e!75510 e!75506)))

(declare-fun res!56718 () Bool)

(assert (=> b!115693 (= res!56718 call!12376)))

(assert (=> b!115693 (=> (not res!56718) (not e!75506))))

(declare-fun b!115694 () Bool)

(assert (=> b!115694 (= e!75504 (not call!12378))))

(declare-fun b!115695 () Bool)

(assert (=> b!115695 (= e!75508 (+!151 call!12382 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun bm!12379 () Bool)

(assert (=> bm!12379 (= call!12382 (+!151 (ite c!20522 call!12380 (ite c!20519 call!12381 call!12377)) (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun b!115696 () Bool)

(assert (=> b!115696 (= e!75502 call!12379)))

(declare-fun b!115697 () Bool)

(assert (=> b!115697 (= e!75511 call!12379)))

(declare-fun b!115698 () Bool)

(assert (=> b!115698 (= e!75510 (not call!12376))))

(declare-fun b!115699 () Bool)

(assert (=> b!115699 (= e!75502 call!12377)))

(assert (= (and d!32387 c!20522) b!115695))

(assert (= (and d!32387 (not c!20522)) b!115687))

(assert (= (and b!115687 c!20519) b!115697))

(assert (= (and b!115687 (not c!20519)) b!115686))

(assert (= (and b!115686 c!20520) b!115696))

(assert (= (and b!115686 (not c!20520)) b!115699))

(assert (= (or b!115696 b!115699) bm!12377))

(assert (= (or b!115697 bm!12377) bm!12378))

(assert (= (or b!115697 b!115696) bm!12376))

(assert (= (or b!115695 bm!12378) bm!12373))

(assert (= (or b!115695 bm!12376) bm!12379))

(assert (= (and d!32387 res!56715) b!115688))

(assert (= (and d!32387 c!20523) b!115685))

(assert (= (and d!32387 (not c!20523)) b!115679))

(assert (= (and d!32387 res!56720) b!115691))

(assert (= (and b!115691 res!56713) b!115690))

(assert (= (and b!115691 (not res!56719)) b!115683))

(assert (= (and b!115683 res!56721) b!115692))

(assert (= (and b!115691 res!56716) b!115684))

(assert (= (and b!115684 c!20521) b!115693))

(assert (= (and b!115684 (not c!20521)) b!115698))

(assert (= (and b!115693 res!56718) b!115682))

(assert (= (or b!115693 b!115698) bm!12374))

(assert (= (and b!115684 res!56717) b!115681))

(assert (= (and b!115681 c!20524) b!115680))

(assert (= (and b!115681 (not c!20524)) b!115694))

(assert (= (and b!115680 res!56714) b!115689))

(assert (= (or b!115680 b!115694) bm!12375))

(declare-fun b_lambda!5135 () Bool)

(assert (=> (not b_lambda!5135) (not b!115692)))

(assert (=> b!115692 t!5919))

(declare-fun b_and!7185 () Bool)

(assert (= b_and!7181 (and (=> t!5919 result!3699) b_and!7185)))

(assert (=> b!115692 t!5921))

(declare-fun b_and!7187 () Bool)

(assert (= b_and!7183 (and (=> t!5921 result!3703) b_and!7187)))

(declare-fun m!131451 () Bool)

(assert (=> bm!12373 m!131451))

(declare-fun m!131453 () Bool)

(assert (=> b!115682 m!131453))

(assert (=> d!32387 m!131395))

(declare-fun m!131455 () Bool)

(assert (=> b!115689 m!131455))

(declare-fun m!131457 () Bool)

(assert (=> bm!12374 m!131457))

(declare-fun m!131459 () Bool)

(assert (=> b!115692 m!131459))

(declare-fun m!131461 () Bool)

(assert (=> b!115692 m!131461))

(declare-fun m!131463 () Bool)

(assert (=> b!115692 m!131463))

(assert (=> b!115692 m!131407))

(declare-fun m!131465 () Bool)

(assert (=> b!115692 m!131465))

(assert (=> b!115692 m!131459))

(assert (=> b!115692 m!131407))

(assert (=> b!115692 m!131463))

(declare-fun m!131467 () Bool)

(assert (=> bm!12375 m!131467))

(declare-fun m!131469 () Bool)

(assert (=> b!115685 m!131469))

(declare-fun m!131471 () Bool)

(assert (=> b!115685 m!131471))

(declare-fun m!131473 () Bool)

(assert (=> b!115685 m!131473))

(declare-fun m!131475 () Bool)

(assert (=> b!115685 m!131475))

(declare-fun m!131477 () Bool)

(assert (=> b!115685 m!131477))

(assert (=> b!115685 m!131459))

(declare-fun m!131479 () Bool)

(assert (=> b!115685 m!131479))

(declare-fun m!131481 () Bool)

(assert (=> b!115685 m!131481))

(declare-fun m!131483 () Bool)

(assert (=> b!115685 m!131483))

(assert (=> b!115685 m!131477))

(declare-fun m!131485 () Bool)

(assert (=> b!115685 m!131485))

(assert (=> b!115685 m!131473))

(declare-fun m!131487 () Bool)

(assert (=> b!115685 m!131487))

(assert (=> b!115685 m!131451))

(assert (=> b!115685 m!131481))

(declare-fun m!131489 () Bool)

(assert (=> b!115685 m!131489))

(declare-fun m!131491 () Bool)

(assert (=> b!115685 m!131491))

(assert (=> b!115685 m!131483))

(declare-fun m!131493 () Bool)

(assert (=> b!115685 m!131493))

(declare-fun m!131495 () Bool)

(assert (=> b!115685 m!131495))

(declare-fun m!131497 () Bool)

(assert (=> b!115685 m!131497))

(assert (=> b!115688 m!131459))

(assert (=> b!115688 m!131459))

(declare-fun m!131499 () Bool)

(assert (=> b!115688 m!131499))

(declare-fun m!131501 () Bool)

(assert (=> bm!12379 m!131501))

(declare-fun m!131503 () Bool)

(assert (=> b!115695 m!131503))

(assert (=> b!115683 m!131459))

(assert (=> b!115683 m!131459))

(declare-fun m!131505 () Bool)

(assert (=> b!115683 m!131505))

(assert (=> b!115690 m!131459))

(assert (=> b!115690 m!131459))

(assert (=> b!115690 m!131499))

(assert (=> b!115512 d!32387))

(declare-fun d!32389 () Bool)

(assert (=> d!32389 (= (array_inv!1359 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvsge (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!115511 d!32389))

(declare-fun d!32391 () Bool)

(assert (=> d!32391 (= (array_inv!1360 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvsge (size!2408 (_values!2689 (v!3024 (underlying!402 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!115511 d!32391))

(declare-fun mapNonEmpty!4267 () Bool)

(declare-fun mapRes!4267 () Bool)

(declare-fun tp!10531 () Bool)

(declare-fun e!75519 () Bool)

(assert (=> mapNonEmpty!4267 (= mapRes!4267 (and tp!10531 e!75519))))

(declare-fun mapValue!4267 () ValueCell!1043)

(declare-fun mapRest!4267 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapKey!4267 () (_ BitVec 32))

(assert (=> mapNonEmpty!4267 (= mapRest!4251 (store mapRest!4267 mapKey!4267 mapValue!4267))))

(declare-fun b!115706 () Bool)

(assert (=> b!115706 (= e!75519 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4267 () Bool)

(assert (=> mapIsEmpty!4267 mapRes!4267))

(declare-fun condMapEmpty!4267 () Bool)

(declare-fun mapDefault!4267 () ValueCell!1043)

(assert (=> mapNonEmpty!4252 (= condMapEmpty!4267 (= mapRest!4251 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4267)))))

(declare-fun e!75520 () Bool)

(assert (=> mapNonEmpty!4252 (= tp!10504 (and e!75520 mapRes!4267))))

(declare-fun b!115707 () Bool)

(assert (=> b!115707 (= e!75520 tp_is_empty!2773)))

(assert (= (and mapNonEmpty!4252 condMapEmpty!4267) mapIsEmpty!4267))

(assert (= (and mapNonEmpty!4252 (not condMapEmpty!4267)) mapNonEmpty!4267))

(assert (= (and mapNonEmpty!4267 ((_ is ValueCellFull!1043) mapValue!4267)) b!115706))

(assert (= (and mapNonEmpty!4252 ((_ is ValueCellFull!1043) mapDefault!4267)) b!115707))

(declare-fun m!131507 () Bool)

(assert (=> mapNonEmpty!4267 m!131507))

(declare-fun mapNonEmpty!4268 () Bool)

(declare-fun mapRes!4268 () Bool)

(declare-fun tp!10532 () Bool)

(declare-fun e!75521 () Bool)

(assert (=> mapNonEmpty!4268 (= mapRes!4268 (and tp!10532 e!75521))))

(declare-fun mapValue!4268 () ValueCell!1043)

(declare-fun mapRest!4268 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapKey!4268 () (_ BitVec 32))

(assert (=> mapNonEmpty!4268 (= mapRest!4252 (store mapRest!4268 mapKey!4268 mapValue!4268))))

(declare-fun b!115708 () Bool)

(assert (=> b!115708 (= e!75521 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4268 () Bool)

(assert (=> mapIsEmpty!4268 mapRes!4268))

(declare-fun condMapEmpty!4268 () Bool)

(declare-fun mapDefault!4268 () ValueCell!1043)

(assert (=> mapNonEmpty!4251 (= condMapEmpty!4268 (= mapRest!4252 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4268)))))

(declare-fun e!75522 () Bool)

(assert (=> mapNonEmpty!4251 (= tp!10503 (and e!75522 mapRes!4268))))

(declare-fun b!115709 () Bool)

(assert (=> b!115709 (= e!75522 tp_is_empty!2773)))

(assert (= (and mapNonEmpty!4251 condMapEmpty!4268) mapIsEmpty!4268))

(assert (= (and mapNonEmpty!4251 (not condMapEmpty!4268)) mapNonEmpty!4268))

(assert (= (and mapNonEmpty!4268 ((_ is ValueCellFull!1043) mapValue!4268)) b!115708))

(assert (= (and mapNonEmpty!4251 ((_ is ValueCellFull!1043) mapDefault!4268)) b!115709))

(declare-fun m!131509 () Bool)

(assert (=> mapNonEmpty!4268 m!131509))

(declare-fun b_lambda!5137 () Bool)

(assert (= b_lambda!5135 (or (and b!115511 b_free!2713) (and b!115505 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))) b_lambda!5137)))

(declare-fun b_lambda!5139 () Bool)

(assert (= b_lambda!5133 (or (and b!115511 b_free!2713) (and b!115505 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))) b_lambda!5139)))

(check-sat (not bm!12374) (not b!115685) (not bm!12373) (not d!32381) (not d!32375) b_and!7185 (not b!115666) (not bm!12372) (not b!115692) (not bm!12368) b_and!7187 (not b_lambda!5137) (not mapNonEmpty!4267) (not b!115669) (not d!32379) (not b!115612) (not b!115683) (not b_lambda!5139) (not b!115690) (not b!115613) (not b!115695) tp_is_empty!2773 (not d!32387) (not b!115667) (not b!115659) (not b!115682) (not bm!12379) (not b_next!2715) (not b_next!2713) (not b!115689) (not bm!12366) (not b!115662) (not mapNonEmpty!4268) (not d!32377) (not bm!12375) (not b!115665) (not b!115611) (not bm!12367) (not b!115660) (not b!115672) (not b!115688))
(check-sat b_and!7185 b_and!7187 (not b_next!2713) (not b_next!2715))
(get-model)

(declare-fun d!32393 () Bool)

(declare-datatypes ((Option!166 0))(
  ( (Some!165 (v!3029 V!3345)) (None!164) )
))
(declare-fun get!1398 (Option!166) V!3345)

(declare-fun getValueByKey!160 (List!1666 (_ BitVec 64)) Option!166)

(assert (=> d!32393 (= (apply!104 lt!60017 lt!60014) (get!1398 (getValueByKey!160 (toList!820 lt!60017) lt!60014)))))

(declare-fun bs!4696 () Bool)

(assert (= bs!4696 d!32393))

(declare-fun m!131511 () Bool)

(assert (=> bs!4696 m!131511))

(assert (=> bs!4696 m!131511))

(declare-fun m!131513 () Bool)

(assert (=> bs!4696 m!131513))

(assert (=> b!115685 d!32393))

(declare-fun d!32395 () Bool)

(assert (=> d!32395 (= (apply!104 lt!60003 lt!60012) (get!1398 (getValueByKey!160 (toList!820 lt!60003) lt!60012)))))

(declare-fun bs!4697 () Bool)

(assert (= bs!4697 d!32395))

(declare-fun m!131515 () Bool)

(assert (=> bs!4697 m!131515))

(assert (=> bs!4697 m!131515))

(declare-fun m!131517 () Bool)

(assert (=> bs!4697 m!131517))

(assert (=> b!115685 d!32395))

(declare-fun d!32397 () Bool)

(assert (=> d!32397 (= (apply!104 (+!151 lt!60003 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60012) (get!1398 (getValueByKey!160 (toList!820 (+!151 lt!60003 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60012)))))

(declare-fun bs!4698 () Bool)

(assert (= bs!4698 d!32397))

(declare-fun m!131519 () Bool)

(assert (=> bs!4698 m!131519))

(assert (=> bs!4698 m!131519))

(declare-fun m!131521 () Bool)

(assert (=> bs!4698 m!131521))

(assert (=> b!115685 d!32397))

(declare-fun d!32399 () Bool)

(assert (=> d!32399 (= (apply!104 lt!60013 lt!60006) (get!1398 (getValueByKey!160 (toList!820 lt!60013) lt!60006)))))

(declare-fun bs!4699 () Bool)

(assert (= bs!4699 d!32399))

(declare-fun m!131523 () Bool)

(assert (=> bs!4699 m!131523))

(assert (=> bs!4699 m!131523))

(declare-fun m!131525 () Bool)

(assert (=> bs!4699 m!131525))

(assert (=> b!115685 d!32399))

(declare-fun d!32401 () Bool)

(assert (=> d!32401 (= (apply!104 (+!151 lt!60017 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60014) (apply!104 lt!60017 lt!60014))))

(declare-fun lt!60022 () Unit!3588)

(declare-fun choose!732 (ListLongMap!1609 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3588)

(assert (=> d!32401 (= lt!60022 (choose!732 lt!60017 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60014))))

(declare-fun e!75525 () Bool)

(assert (=> d!32401 e!75525))

(declare-fun res!56724 () Bool)

(assert (=> d!32401 (=> (not res!56724) (not e!75525))))

(assert (=> d!32401 (= res!56724 (contains!850 lt!60017 lt!60014))))

(assert (=> d!32401 (= (addApplyDifferent!80 lt!60017 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60014) lt!60022)))

(declare-fun b!115713 () Bool)

(assert (=> b!115713 (= e!75525 (not (= lt!60014 lt!60009)))))

(assert (= (and d!32401 res!56724) b!115713))

(assert (=> d!32401 m!131479))

(assert (=> d!32401 m!131481))

(assert (=> d!32401 m!131489))

(declare-fun m!131527 () Bool)

(assert (=> d!32401 m!131527))

(declare-fun m!131529 () Bool)

(assert (=> d!32401 m!131529))

(assert (=> d!32401 m!131481))

(assert (=> b!115685 d!32401))

(declare-fun d!32403 () Bool)

(assert (=> d!32403 (contains!850 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60016)))

(declare-fun lt!60025 () Unit!3588)

(declare-fun choose!733 (ListLongMap!1609 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3588)

(assert (=> d!32403 (= lt!60025 (choose!733 lt!60007 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60016))))

(assert (=> d!32403 (contains!850 lt!60007 lt!60016)))

(assert (=> d!32403 (= (addStillContains!80 lt!60007 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60016) lt!60025)))

(declare-fun bs!4700 () Bool)

(assert (= bs!4700 d!32403))

(assert (=> bs!4700 m!131473))

(assert (=> bs!4700 m!131473))

(assert (=> bs!4700 m!131487))

(declare-fun m!131531 () Bool)

(assert (=> bs!4700 m!131531))

(declare-fun m!131533 () Bool)

(assert (=> bs!4700 m!131533))

(assert (=> b!115685 d!32403))

(declare-fun d!32405 () Bool)

(declare-fun e!75530 () Bool)

(assert (=> d!32405 e!75530))

(declare-fun res!56727 () Bool)

(assert (=> d!32405 (=> res!56727 e!75530)))

(declare-fun lt!60034 () Bool)

(assert (=> d!32405 (= res!56727 (not lt!60034))))

(declare-fun lt!60035 () Bool)

(assert (=> d!32405 (= lt!60034 lt!60035)))

(declare-fun lt!60037 () Unit!3588)

(declare-fun e!75531 () Unit!3588)

(assert (=> d!32405 (= lt!60037 e!75531)))

(declare-fun c!20527 () Bool)

(assert (=> d!32405 (= c!20527 lt!60035)))

(declare-fun containsKey!164 (List!1666 (_ BitVec 64)) Bool)

(assert (=> d!32405 (= lt!60035 (containsKey!164 (toList!820 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60016))))

(assert (=> d!32405 (= (contains!850 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60016) lt!60034)))

(declare-fun b!115721 () Bool)

(declare-fun lt!60036 () Unit!3588)

(assert (=> b!115721 (= e!75531 lt!60036)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!113 (List!1666 (_ BitVec 64)) Unit!3588)

(assert (=> b!115721 (= lt!60036 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60016))))

(declare-fun isDefined!114 (Option!166) Bool)

(assert (=> b!115721 (isDefined!114 (getValueByKey!160 (toList!820 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60016))))

(declare-fun b!115722 () Bool)

(declare-fun Unit!3592 () Unit!3588)

(assert (=> b!115722 (= e!75531 Unit!3592)))

(declare-fun b!115723 () Bool)

(assert (=> b!115723 (= e!75530 (isDefined!114 (getValueByKey!160 (toList!820 (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60016)))))

(assert (= (and d!32405 c!20527) b!115721))

(assert (= (and d!32405 (not c!20527)) b!115722))

(assert (= (and d!32405 (not res!56727)) b!115723))

(declare-fun m!131535 () Bool)

(assert (=> d!32405 m!131535))

(declare-fun m!131537 () Bool)

(assert (=> b!115721 m!131537))

(declare-fun m!131539 () Bool)

(assert (=> b!115721 m!131539))

(assert (=> b!115721 m!131539))

(declare-fun m!131541 () Bool)

(assert (=> b!115721 m!131541))

(assert (=> b!115723 m!131539))

(assert (=> b!115723 m!131539))

(assert (=> b!115723 m!131541))

(assert (=> b!115685 d!32405))

(declare-fun d!32407 () Bool)

(declare-fun e!75534 () Bool)

(assert (=> d!32407 e!75534))

(declare-fun res!56733 () Bool)

(assert (=> d!32407 (=> (not res!56733) (not e!75534))))

(declare-fun lt!60046 () ListLongMap!1609)

(assert (=> d!32407 (= res!56733 (contains!850 lt!60046 (_1!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60048 () List!1666)

(assert (=> d!32407 (= lt!60046 (ListLongMap!1610 lt!60048))))

(declare-fun lt!60047 () Unit!3588)

(declare-fun lt!60049 () Unit!3588)

(assert (=> d!32407 (= lt!60047 lt!60049)))

(assert (=> d!32407 (= (getValueByKey!160 lt!60048 (_1!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!79 (List!1666 (_ BitVec 64) V!3345) Unit!3588)

(assert (=> d!32407 (= lt!60049 (lemmaContainsTupThenGetReturnValue!79 lt!60048 (_1!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun insertStrictlySorted!82 (List!1666 (_ BitVec 64) V!3345) List!1666)

(assert (=> d!32407 (= lt!60048 (insertStrictlySorted!82 (toList!820 lt!60017) (_1!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32407 (= (+!151 lt!60017 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60046)))

(declare-fun b!115728 () Bool)

(declare-fun res!56732 () Bool)

(assert (=> b!115728 (=> (not res!56732) (not e!75534))))

(assert (=> b!115728 (= res!56732 (= (getValueByKey!160 (toList!820 lt!60046) (_1!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115729 () Bool)

(declare-fun contains!851 (List!1666 tuple2!2484) Bool)

(assert (=> b!115729 (= e!75534 (contains!851 (toList!820 lt!60046) (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32407 res!56733) b!115728))

(assert (= (and b!115728 res!56732) b!115729))

(declare-fun m!131543 () Bool)

(assert (=> d!32407 m!131543))

(declare-fun m!131545 () Bool)

(assert (=> d!32407 m!131545))

(declare-fun m!131547 () Bool)

(assert (=> d!32407 m!131547))

(declare-fun m!131549 () Bool)

(assert (=> d!32407 m!131549))

(declare-fun m!131551 () Bool)

(assert (=> b!115728 m!131551))

(declare-fun m!131553 () Bool)

(assert (=> b!115729 m!131553))

(assert (=> b!115685 d!32407))

(declare-fun d!32409 () Bool)

(assert (=> d!32409 (= (apply!104 (+!151 lt!60003 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60012) (apply!104 lt!60003 lt!60012))))

(declare-fun lt!60050 () Unit!3588)

(assert (=> d!32409 (= lt!60050 (choose!732 lt!60003 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60012))))

(declare-fun e!75535 () Bool)

(assert (=> d!32409 e!75535))

(declare-fun res!56734 () Bool)

(assert (=> d!32409 (=> (not res!56734) (not e!75535))))

(assert (=> d!32409 (= res!56734 (contains!850 lt!60003 lt!60012))))

(assert (=> d!32409 (= (addApplyDifferent!80 lt!60003 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60012) lt!60050)))

(declare-fun b!115730 () Bool)

(assert (=> b!115730 (= e!75535 (not (= lt!60012 lt!60019)))))

(assert (= (and d!32409 res!56734) b!115730))

(assert (=> d!32409 m!131475))

(assert (=> d!32409 m!131477))

(assert (=> d!32409 m!131485))

(declare-fun m!131555 () Bool)

(assert (=> d!32409 m!131555))

(declare-fun m!131557 () Bool)

(assert (=> d!32409 m!131557))

(assert (=> d!32409 m!131477))

(assert (=> b!115685 d!32409))

(declare-fun d!32411 () Bool)

(assert (=> d!32411 (= (apply!104 (+!151 lt!60013 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60006) (apply!104 lt!60013 lt!60006))))

(declare-fun lt!60051 () Unit!3588)

(assert (=> d!32411 (= lt!60051 (choose!732 lt!60013 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60006))))

(declare-fun e!75536 () Bool)

(assert (=> d!32411 e!75536))

(declare-fun res!56735 () Bool)

(assert (=> d!32411 (=> (not res!56735) (not e!75536))))

(assert (=> d!32411 (= res!56735 (contains!850 lt!60013 lt!60006))))

(assert (=> d!32411 (= (addApplyDifferent!80 lt!60013 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!60006) lt!60051)))

(declare-fun b!115731 () Bool)

(assert (=> b!115731 (= e!75536 (not (= lt!60006 lt!60004)))))

(assert (= (and d!32411 res!56735) b!115731))

(assert (=> d!32411 m!131471))

(assert (=> d!32411 m!131483))

(assert (=> d!32411 m!131493))

(declare-fun m!131559 () Bool)

(assert (=> d!32411 m!131559))

(declare-fun m!131561 () Bool)

(assert (=> d!32411 m!131561))

(assert (=> d!32411 m!131483))

(assert (=> b!115685 d!32411))

(declare-fun d!32413 () Bool)

(assert (=> d!32413 (= (apply!104 (+!151 lt!60017 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60014) (get!1398 (getValueByKey!160 (toList!820 (+!151 lt!60017 (tuple2!2485 lt!60009 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60014)))))

(declare-fun bs!4701 () Bool)

(assert (= bs!4701 d!32413))

(declare-fun m!131563 () Bool)

(assert (=> bs!4701 m!131563))

(assert (=> bs!4701 m!131563))

(declare-fun m!131565 () Bool)

(assert (=> bs!4701 m!131565))

(assert (=> b!115685 d!32413))

(declare-fun d!32415 () Bool)

(assert (=> d!32415 (= (apply!104 (+!151 lt!60013 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60006) (get!1398 (getValueByKey!160 (toList!820 (+!151 lt!60013 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60006)))))

(declare-fun bs!4702 () Bool)

(assert (= bs!4702 d!32415))

(declare-fun m!131567 () Bool)

(assert (=> bs!4702 m!131567))

(assert (=> bs!4702 m!131567))

(declare-fun m!131569 () Bool)

(assert (=> bs!4702 m!131569))

(assert (=> b!115685 d!32415))

(declare-fun d!32417 () Bool)

(declare-fun e!75537 () Bool)

(assert (=> d!32417 e!75537))

(declare-fun res!56737 () Bool)

(assert (=> d!32417 (=> (not res!56737) (not e!75537))))

(declare-fun lt!60052 () ListLongMap!1609)

(assert (=> d!32417 (= res!56737 (contains!850 lt!60052 (_1!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60054 () List!1666)

(assert (=> d!32417 (= lt!60052 (ListLongMap!1610 lt!60054))))

(declare-fun lt!60053 () Unit!3588)

(declare-fun lt!60055 () Unit!3588)

(assert (=> d!32417 (= lt!60053 lt!60055)))

(assert (=> d!32417 (= (getValueByKey!160 lt!60054 (_1!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32417 (= lt!60055 (lemmaContainsTupThenGetReturnValue!79 lt!60054 (_1!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32417 (= lt!60054 (insertStrictlySorted!82 (toList!820 lt!60003) (_1!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32417 (= (+!151 lt!60003 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60052)))

(declare-fun b!115732 () Bool)

(declare-fun res!56736 () Bool)

(assert (=> b!115732 (=> (not res!56736) (not e!75537))))

(assert (=> b!115732 (= res!56736 (= (getValueByKey!160 (toList!820 lt!60052) (_1!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115733 () Bool)

(assert (=> b!115733 (= e!75537 (contains!851 (toList!820 lt!60052) (tuple2!2485 lt!60019 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32417 res!56737) b!115732))

(assert (= (and b!115732 res!56736) b!115733))

(declare-fun m!131571 () Bool)

(assert (=> d!32417 m!131571))

(declare-fun m!131573 () Bool)

(assert (=> d!32417 m!131573))

(declare-fun m!131575 () Bool)

(assert (=> d!32417 m!131575))

(declare-fun m!131577 () Bool)

(assert (=> d!32417 m!131577))

(declare-fun m!131579 () Bool)

(assert (=> b!115732 m!131579))

(declare-fun m!131581 () Bool)

(assert (=> b!115733 m!131581))

(assert (=> b!115685 d!32417))

(declare-fun d!32419 () Bool)

(declare-fun e!75538 () Bool)

(assert (=> d!32419 e!75538))

(declare-fun res!56739 () Bool)

(assert (=> d!32419 (=> (not res!56739) (not e!75538))))

(declare-fun lt!60056 () ListLongMap!1609)

(assert (=> d!32419 (= res!56739 (contains!850 lt!60056 (_1!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60058 () List!1666)

(assert (=> d!32419 (= lt!60056 (ListLongMap!1610 lt!60058))))

(declare-fun lt!60057 () Unit!3588)

(declare-fun lt!60059 () Unit!3588)

(assert (=> d!32419 (= lt!60057 lt!60059)))

(assert (=> d!32419 (= (getValueByKey!160 lt!60058 (_1!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32419 (= lt!60059 (lemmaContainsTupThenGetReturnValue!79 lt!60058 (_1!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32419 (= lt!60058 (insertStrictlySorted!82 (toList!820 lt!60007) (_1!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32419 (= (+!151 lt!60007 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60056)))

(declare-fun b!115734 () Bool)

(declare-fun res!56738 () Bool)

(assert (=> b!115734 (=> (not res!56738) (not e!75538))))

(assert (=> b!115734 (= res!56738 (= (getValueByKey!160 (toList!820 lt!60056) (_1!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115735 () Bool)

(assert (=> b!115735 (= e!75538 (contains!851 (toList!820 lt!60056) (tuple2!2485 lt!60011 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32419 res!56739) b!115734))

(assert (= (and b!115734 res!56738) b!115735))

(declare-fun m!131583 () Bool)

(assert (=> d!32419 m!131583))

(declare-fun m!131585 () Bool)

(assert (=> d!32419 m!131585))

(declare-fun m!131587 () Bool)

(assert (=> d!32419 m!131587))

(declare-fun m!131589 () Bool)

(assert (=> d!32419 m!131589))

(declare-fun m!131591 () Bool)

(assert (=> b!115734 m!131591))

(declare-fun m!131593 () Bool)

(assert (=> b!115735 m!131593))

(assert (=> b!115685 d!32419))

(declare-fun b!115760 () Bool)

(declare-fun e!75556 () Bool)

(declare-fun e!75557 () Bool)

(assert (=> b!115760 (= e!75556 e!75557)))

(declare-fun c!20539 () Bool)

(assert (=> b!115760 (= c!20539 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115761 () Bool)

(declare-fun e!75558 () ListLongMap!1609)

(declare-fun e!75553 () ListLongMap!1609)

(assert (=> b!115761 (= e!75558 e!75553)))

(declare-fun c!20536 () Bool)

(assert (=> b!115761 (= c!20536 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun d!32421 () Bool)

(declare-fun e!75555 () Bool)

(assert (=> d!32421 e!75555))

(declare-fun res!56750 () Bool)

(assert (=> d!32421 (=> (not res!56750) (not e!75555))))

(declare-fun lt!60076 () ListLongMap!1609)

(assert (=> d!32421 (= res!56750 (not (contains!850 lt!60076 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32421 (= lt!60076 e!75558)))

(declare-fun c!20537 () Bool)

(assert (=> d!32421 (= c!20537 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> d!32421 (validMask!0 (mask!6915 (v!3024 (underlying!402 thiss!992))))))

(assert (=> d!32421 (= (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) lt!60076)))

(declare-fun b!115762 () Bool)

(assert (=> b!115762 (= e!75557 (= lt!60076 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115763 () Bool)

(assert (=> b!115763 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> b!115763 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2408 (_values!2689 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun e!75554 () Bool)

(assert (=> b!115763 (= e!75554 (= (apply!104 lt!60076 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115764 () Bool)

(declare-fun res!56749 () Bool)

(assert (=> b!115764 (=> (not res!56749) (not e!75555))))

(assert (=> b!115764 (= res!56749 (not (contains!850 lt!60076 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115765 () Bool)

(assert (=> b!115765 (= e!75555 e!75556)))

(declare-fun c!20538 () Bool)

(declare-fun e!75559 () Bool)

(assert (=> b!115765 (= c!20538 e!75559)))

(declare-fun res!56751 () Bool)

(assert (=> b!115765 (=> (not res!56751) (not e!75559))))

(assert (=> b!115765 (= res!56751 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115766 () Bool)

(declare-fun lt!60075 () Unit!3588)

(declare-fun lt!60080 () Unit!3588)

(assert (=> b!115766 (= lt!60075 lt!60080)))

(declare-fun lt!60077 () V!3345)

(declare-fun lt!60078 () ListLongMap!1609)

(declare-fun lt!60074 () (_ BitVec 64))

(declare-fun lt!60079 () (_ BitVec 64))

(assert (=> b!115766 (not (contains!850 (+!151 lt!60078 (tuple2!2485 lt!60074 lt!60077)) lt!60079))))

(declare-fun addStillNotContains!53 (ListLongMap!1609 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3588)

(assert (=> b!115766 (= lt!60080 (addStillNotContains!53 lt!60078 lt!60074 lt!60077 lt!60079))))

(assert (=> b!115766 (= lt!60079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!115766 (= lt!60077 (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115766 (= lt!60074 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun call!12385 () ListLongMap!1609)

(assert (=> b!115766 (= lt!60078 call!12385)))

(assert (=> b!115766 (= e!75553 (+!151 call!12385 (tuple2!2485 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!115767 () Bool)

(declare-fun isEmpty!390 (ListLongMap!1609) Bool)

(assert (=> b!115767 (= e!75557 (isEmpty!390 lt!60076))))

(declare-fun bm!12382 () Bool)

(assert (=> bm!12382 (= call!12385 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115768 () Bool)

(assert (=> b!115768 (= e!75556 e!75554)))

(assert (=> b!115768 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun res!56748 () Bool)

(assert (=> b!115768 (= res!56748 (contains!850 lt!60076 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115768 (=> (not res!56748) (not e!75554))))

(declare-fun b!115769 () Bool)

(assert (=> b!115769 (= e!75553 call!12385)))

(declare-fun b!115770 () Bool)

(assert (=> b!115770 (= e!75558 (ListLongMap!1610 Nil!1663))))

(declare-fun b!115771 () Bool)

(assert (=> b!115771 (= e!75559 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115771 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(assert (= (and d!32421 c!20537) b!115770))

(assert (= (and d!32421 (not c!20537)) b!115761))

(assert (= (and b!115761 c!20536) b!115766))

(assert (= (and b!115761 (not c!20536)) b!115769))

(assert (= (or b!115766 b!115769) bm!12382))

(assert (= (and d!32421 res!56750) b!115764))

(assert (= (and b!115764 res!56749) b!115765))

(assert (= (and b!115765 res!56751) b!115771))

(assert (= (and b!115765 c!20538) b!115768))

(assert (= (and b!115765 (not c!20538)) b!115760))

(assert (= (and b!115768 res!56748) b!115763))

(assert (= (and b!115760 c!20539) b!115762))

(assert (= (and b!115760 (not c!20539)) b!115767))

(declare-fun b_lambda!5141 () Bool)

(assert (=> (not b_lambda!5141) (not b!115763)))

(assert (=> b!115763 t!5919))

(declare-fun b_and!7189 () Bool)

(assert (= b_and!7185 (and (=> t!5919 result!3699) b_and!7189)))

(assert (=> b!115763 t!5921))

(declare-fun b_and!7191 () Bool)

(assert (= b_and!7187 (and (=> t!5921 result!3703) b_and!7191)))

(declare-fun b_lambda!5143 () Bool)

(assert (=> (not b_lambda!5143) (not b!115766)))

(assert (=> b!115766 t!5919))

(declare-fun b_and!7193 () Bool)

(assert (= b_and!7189 (and (=> t!5919 result!3699) b_and!7193)))

(assert (=> b!115766 t!5921))

(declare-fun b_and!7195 () Bool)

(assert (= b_and!7191 (and (=> t!5921 result!3703) b_and!7195)))

(assert (=> b!115771 m!131459))

(assert (=> b!115771 m!131459))

(assert (=> b!115771 m!131499))

(assert (=> b!115761 m!131459))

(assert (=> b!115761 m!131459))

(assert (=> b!115761 m!131499))

(declare-fun m!131595 () Bool)

(assert (=> b!115764 m!131595))

(assert (=> b!115763 m!131463))

(assert (=> b!115763 m!131407))

(assert (=> b!115763 m!131465))

(assert (=> b!115763 m!131459))

(assert (=> b!115763 m!131407))

(assert (=> b!115763 m!131459))

(declare-fun m!131597 () Bool)

(assert (=> b!115763 m!131597))

(assert (=> b!115763 m!131463))

(declare-fun m!131599 () Bool)

(assert (=> d!32421 m!131599))

(assert (=> d!32421 m!131395))

(declare-fun m!131601 () Bool)

(assert (=> bm!12382 m!131601))

(assert (=> b!115768 m!131459))

(assert (=> b!115768 m!131459))

(declare-fun m!131603 () Bool)

(assert (=> b!115768 m!131603))

(assert (=> b!115762 m!131601))

(assert (=> b!115766 m!131463))

(assert (=> b!115766 m!131407))

(assert (=> b!115766 m!131465))

(assert (=> b!115766 m!131459))

(assert (=> b!115766 m!131407))

(declare-fun m!131605 () Bool)

(assert (=> b!115766 m!131605))

(declare-fun m!131607 () Bool)

(assert (=> b!115766 m!131607))

(declare-fun m!131609 () Bool)

(assert (=> b!115766 m!131609))

(assert (=> b!115766 m!131605))

(assert (=> b!115766 m!131463))

(declare-fun m!131611 () Bool)

(assert (=> b!115766 m!131611))

(declare-fun m!131613 () Bool)

(assert (=> b!115767 m!131613))

(assert (=> b!115685 d!32421))

(declare-fun d!32423 () Bool)

(declare-fun e!75560 () Bool)

(assert (=> d!32423 e!75560))

(declare-fun res!56753 () Bool)

(assert (=> d!32423 (=> (not res!56753) (not e!75560))))

(declare-fun lt!60081 () ListLongMap!1609)

(assert (=> d!32423 (= res!56753 (contains!850 lt!60081 (_1!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60083 () List!1666)

(assert (=> d!32423 (= lt!60081 (ListLongMap!1610 lt!60083))))

(declare-fun lt!60082 () Unit!3588)

(declare-fun lt!60084 () Unit!3588)

(assert (=> d!32423 (= lt!60082 lt!60084)))

(assert (=> d!32423 (= (getValueByKey!160 lt!60083 (_1!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32423 (= lt!60084 (lemmaContainsTupThenGetReturnValue!79 lt!60083 (_1!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32423 (= lt!60083 (insertStrictlySorted!82 (toList!820 lt!60013) (_1!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32423 (= (+!151 lt!60013 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60081)))

(declare-fun b!115772 () Bool)

(declare-fun res!56752 () Bool)

(assert (=> b!115772 (=> (not res!56752) (not e!75560))))

(assert (=> b!115772 (= res!56752 (= (getValueByKey!160 (toList!820 lt!60081) (_1!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115773 () Bool)

(assert (=> b!115773 (= e!75560 (contains!851 (toList!820 lt!60081) (tuple2!2485 lt!60004 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32423 res!56753) b!115772))

(assert (= (and b!115772 res!56752) b!115773))

(declare-fun m!131615 () Bool)

(assert (=> d!32423 m!131615))

(declare-fun m!131617 () Bool)

(assert (=> d!32423 m!131617))

(declare-fun m!131619 () Bool)

(assert (=> d!32423 m!131619))

(declare-fun m!131621 () Bool)

(assert (=> d!32423 m!131621))

(declare-fun m!131623 () Bool)

(assert (=> b!115772 m!131623))

(declare-fun m!131625 () Bool)

(assert (=> b!115773 m!131625))

(assert (=> b!115685 d!32423))

(declare-fun d!32425 () Bool)

(assert (=> d!32425 (= (apply!104 lt!59996 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1398 (getValueByKey!160 (toList!820 lt!59996) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4703 () Bool)

(assert (= bs!4703 d!32425))

(assert (=> bs!4703 m!131401))

(declare-fun m!131627 () Bool)

(assert (=> bs!4703 m!131627))

(assert (=> bs!4703 m!131627))

(declare-fun m!131629 () Bool)

(assert (=> bs!4703 m!131629))

(assert (=> b!115669 d!32425))

(declare-fun d!32427 () Bool)

(declare-fun c!20542 () Bool)

(assert (=> d!32427 (= c!20542 ((_ is ValueCellFull!1043) (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!75563 () V!3345)

(assert (=> d!32427 (= (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!75563)))

(declare-fun b!115778 () Bool)

(declare-fun get!1399 (ValueCell!1043 V!3345) V!3345)

(assert (=> b!115778 (= e!75563 (get!1399 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115779 () Bool)

(declare-fun get!1400 (ValueCell!1043 V!3345) V!3345)

(assert (=> b!115779 (= e!75563 (get!1400 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32427 c!20542) b!115778))

(assert (= (and d!32427 (not c!20542)) b!115779))

(assert (=> b!115778 m!131405))

(assert (=> b!115778 m!131407))

(declare-fun m!131631 () Bool)

(assert (=> b!115778 m!131631))

(assert (=> b!115779 m!131405))

(assert (=> b!115779 m!131407))

(declare-fun m!131633 () Bool)

(assert (=> b!115779 m!131633))

(assert (=> b!115669 d!32427))

(declare-fun d!32429 () Bool)

(declare-fun e!75564 () Bool)

(assert (=> d!32429 e!75564))

(declare-fun res!56755 () Bool)

(assert (=> d!32429 (=> (not res!56755) (not e!75564))))

(declare-fun lt!60085 () ListLongMap!1609)

(assert (=> d!32429 (= res!56755 (contains!850 lt!60085 (_1!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun lt!60087 () List!1666)

(assert (=> d!32429 (= lt!60085 (ListLongMap!1610 lt!60087))))

(declare-fun lt!60086 () Unit!3588)

(declare-fun lt!60088 () Unit!3588)

(assert (=> d!32429 (= lt!60086 lt!60088)))

(assert (=> d!32429 (= (getValueByKey!160 lt!60087 (_1!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))) (Some!165 (_2!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(assert (=> d!32429 (= lt!60088 (lemmaContainsTupThenGetReturnValue!79 lt!60087 (_1!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (_2!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(assert (=> d!32429 (= lt!60087 (insertStrictlySorted!82 (toList!820 (ite c!20516 call!12373 (ite c!20513 call!12374 call!12370))) (_1!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (_2!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(assert (=> d!32429 (= (+!151 (ite c!20516 call!12373 (ite c!20513 call!12374 call!12370)) (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60085)))

(declare-fun b!115780 () Bool)

(declare-fun res!56754 () Bool)

(assert (=> b!115780 (=> (not res!56754) (not e!75564))))

(assert (=> b!115780 (= res!56754 (= (getValueByKey!160 (toList!820 lt!60085) (_1!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))) (Some!165 (_2!1253 (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))))

(declare-fun b!115781 () Bool)

(assert (=> b!115781 (= e!75564 (contains!851 (toList!820 lt!60085) (ite (or c!20516 c!20513) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (= (and d!32429 res!56755) b!115780))

(assert (= (and b!115780 res!56754) b!115781))

(declare-fun m!131635 () Bool)

(assert (=> d!32429 m!131635))

(declare-fun m!131637 () Bool)

(assert (=> d!32429 m!131637))

(declare-fun m!131639 () Bool)

(assert (=> d!32429 m!131639))

(declare-fun m!131641 () Bool)

(assert (=> d!32429 m!131641))

(declare-fun m!131643 () Bool)

(assert (=> b!115780 m!131643))

(declare-fun m!131645 () Bool)

(assert (=> b!115781 m!131645))

(assert (=> bm!12372 d!32429))

(declare-fun d!32431 () Bool)

(declare-fun res!56756 () Bool)

(declare-fun e!75565 () Bool)

(assert (=> d!32431 (=> (not res!56756) (not e!75565))))

(assert (=> d!32431 (= res!56756 (simpleValid!80 (v!3024 (underlying!402 thiss!992))))))

(assert (=> d!32431 (= (valid!474 (v!3024 (underlying!402 thiss!992))) e!75565)))

(declare-fun b!115782 () Bool)

(declare-fun res!56757 () Bool)

(assert (=> b!115782 (=> (not res!56757) (not e!75565))))

(assert (=> b!115782 (= res!56757 (= (arrayCountValidKeys!0 (_keys!4427 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000000 (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))) (_size!546 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115783 () Bool)

(declare-fun res!56758 () Bool)

(assert (=> b!115783 (=> (not res!56758) (not e!75565))))

(assert (=> b!115783 (= res!56758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115784 () Bool)

(assert (=> b!115784 (= e!75565 (arrayNoDuplicates!0 (_keys!4427 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000000 Nil!1666))))

(assert (= (and d!32431 res!56756) b!115782))

(assert (= (and b!115782 res!56757) b!115783))

(assert (= (and b!115783 res!56758) b!115784))

(declare-fun m!131647 () Bool)

(assert (=> d!32431 m!131647))

(declare-fun m!131649 () Bool)

(assert (=> b!115782 m!131649))

(declare-fun m!131651 () Bool)

(assert (=> b!115783 m!131651))

(declare-fun m!131653 () Bool)

(assert (=> b!115784 m!131653))

(assert (=> d!32377 d!32431))

(declare-fun b!115785 () Bool)

(declare-fun e!75569 () Bool)

(declare-fun e!75570 () Bool)

(assert (=> b!115785 (= e!75569 e!75570)))

(declare-fun c!20546 () Bool)

(assert (=> b!115785 (= c!20546 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115786 () Bool)

(declare-fun e!75571 () ListLongMap!1609)

(declare-fun e!75566 () ListLongMap!1609)

(assert (=> b!115786 (= e!75571 e!75566)))

(declare-fun c!20543 () Bool)

(assert (=> b!115786 (= c!20543 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!32433 () Bool)

(declare-fun e!75568 () Bool)

(assert (=> d!32433 e!75568))

(declare-fun res!56761 () Bool)

(assert (=> d!32433 (=> (not res!56761) (not e!75568))))

(declare-fun lt!60091 () ListLongMap!1609)

(assert (=> d!32433 (= res!56761 (not (contains!850 lt!60091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32433 (= lt!60091 e!75571)))

(declare-fun c!20544 () Bool)

(assert (=> d!32433 (= c!20544 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> d!32433 (validMask!0 (mask!6915 (v!3024 (underlying!402 thiss!992))))))

(assert (=> d!32433 (= (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))) lt!60091)))

(declare-fun b!115787 () Bool)

(assert (=> b!115787 (= e!75570 (= lt!60091 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115788 () Bool)

(assert (=> b!115788 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(assert (=> b!115788 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2408 (_values!2689 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun e!75567 () Bool)

(assert (=> b!115788 (= e!75567 (= (apply!104 lt!60091 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115789 () Bool)

(declare-fun res!56760 () Bool)

(assert (=> b!115789 (=> (not res!56760) (not e!75568))))

(assert (=> b!115789 (= res!56760 (not (contains!850 lt!60091 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115790 () Bool)

(assert (=> b!115790 (= e!75568 e!75569)))

(declare-fun c!20545 () Bool)

(declare-fun e!75572 () Bool)

(assert (=> b!115790 (= c!20545 e!75572)))

(declare-fun res!56762 () Bool)

(assert (=> b!115790 (=> (not res!56762) (not e!75572))))

(assert (=> b!115790 (= res!56762 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun b!115791 () Bool)

(declare-fun lt!60090 () Unit!3588)

(declare-fun lt!60095 () Unit!3588)

(assert (=> b!115791 (= lt!60090 lt!60095)))

(declare-fun lt!60092 () V!3345)

(declare-fun lt!60094 () (_ BitVec 64))

(declare-fun lt!60089 () (_ BitVec 64))

(declare-fun lt!60093 () ListLongMap!1609)

(assert (=> b!115791 (not (contains!850 (+!151 lt!60093 (tuple2!2485 lt!60089 lt!60092)) lt!60094))))

(assert (=> b!115791 (= lt!60095 (addStillNotContains!53 lt!60093 lt!60089 lt!60092 lt!60094))))

(assert (=> b!115791 (= lt!60094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!115791 (= lt!60092 (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115791 (= lt!60089 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!12386 () ListLongMap!1609)

(assert (=> b!115791 (= lt!60093 call!12386)))

(assert (=> b!115791 (= e!75566 (+!151 call!12386 (tuple2!2485 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!115792 () Bool)

(assert (=> b!115792 (= e!75570 (isEmpty!390 lt!60091))))

(declare-fun bm!12383 () Bool)

(assert (=> bm!12383 (= call!12386 (getCurrentListMapNoExtraKeys!116 (_keys!4427 (v!3024 (underlying!402 thiss!992))) (_values!2689 (v!3024 (underlying!402 thiss!992))) (mask!6915 (v!3024 (underlying!402 thiss!992))) (extraKeys!2495 (v!3024 (underlying!402 thiss!992))) (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) (minValue!2573 (v!3024 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992)))))))

(declare-fun b!115793 () Bool)

(assert (=> b!115793 (= e!75569 e!75567)))

(assert (=> b!115793 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2407 (_keys!4427 (v!3024 (underlying!402 thiss!992))))))))

(declare-fun res!56759 () Bool)

(assert (=> b!115793 (= res!56759 (contains!850 lt!60091 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115793 (=> (not res!56759) (not e!75567))))

(declare-fun b!115794 () Bool)

(assert (=> b!115794 (= e!75566 call!12386)))

(declare-fun b!115795 () Bool)

(assert (=> b!115795 (= e!75571 (ListLongMap!1610 Nil!1663))))

(declare-fun b!115796 () Bool)

(assert (=> b!115796 (= e!75572 (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115796 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(assert (= (and d!32433 c!20544) b!115795))

(assert (= (and d!32433 (not c!20544)) b!115786))

(assert (= (and b!115786 c!20543) b!115791))

(assert (= (and b!115786 (not c!20543)) b!115794))

(assert (= (or b!115791 b!115794) bm!12383))

(assert (= (and d!32433 res!56761) b!115789))

(assert (= (and b!115789 res!56760) b!115790))

(assert (= (and b!115790 res!56762) b!115796))

(assert (= (and b!115790 c!20545) b!115793))

(assert (= (and b!115790 (not c!20545)) b!115785))

(assert (= (and b!115793 res!56759) b!115788))

(assert (= (and b!115785 c!20546) b!115787))

(assert (= (and b!115785 (not c!20546)) b!115792))

(declare-fun b_lambda!5145 () Bool)

(assert (=> (not b_lambda!5145) (not b!115788)))

(assert (=> b!115788 t!5919))

(declare-fun b_and!7197 () Bool)

(assert (= b_and!7193 (and (=> t!5919 result!3699) b_and!7197)))

(assert (=> b!115788 t!5921))

(declare-fun b_and!7199 () Bool)

(assert (= b_and!7195 (and (=> t!5921 result!3703) b_and!7199)))

(declare-fun b_lambda!5147 () Bool)

(assert (=> (not b_lambda!5147) (not b!115791)))

(assert (=> b!115791 t!5919))

(declare-fun b_and!7201 () Bool)

(assert (= b_and!7197 (and (=> t!5919 result!3699) b_and!7201)))

(assert (=> b!115791 t!5921))

(declare-fun b_and!7203 () Bool)

(assert (= b_and!7199 (and (=> t!5921 result!3703) b_and!7203)))

(assert (=> b!115796 m!131401))

(assert (=> b!115796 m!131401))

(assert (=> b!115796 m!131443))

(assert (=> b!115786 m!131401))

(assert (=> b!115786 m!131401))

(assert (=> b!115786 m!131443))

(declare-fun m!131655 () Bool)

(assert (=> b!115789 m!131655))

(assert (=> b!115788 m!131405))

(assert (=> b!115788 m!131407))

(assert (=> b!115788 m!131409))

(assert (=> b!115788 m!131401))

(assert (=> b!115788 m!131407))

(assert (=> b!115788 m!131401))

(declare-fun m!131657 () Bool)

(assert (=> b!115788 m!131657))

(assert (=> b!115788 m!131405))

(declare-fun m!131659 () Bool)

(assert (=> d!32433 m!131659))

(assert (=> d!32433 m!131395))

(declare-fun m!131661 () Bool)

(assert (=> bm!12383 m!131661))

(assert (=> b!115793 m!131401))

(assert (=> b!115793 m!131401))

(declare-fun m!131663 () Bool)

(assert (=> b!115793 m!131663))

(assert (=> b!115787 m!131661))

(assert (=> b!115791 m!131405))

(assert (=> b!115791 m!131407))

(assert (=> b!115791 m!131409))

(assert (=> b!115791 m!131401))

(assert (=> b!115791 m!131407))

(declare-fun m!131665 () Bool)

(assert (=> b!115791 m!131665))

(declare-fun m!131667 () Bool)

(assert (=> b!115791 m!131667))

(declare-fun m!131669 () Bool)

(assert (=> b!115791 m!131669))

(assert (=> b!115791 m!131665))

(assert (=> b!115791 m!131405))

(declare-fun m!131671 () Bool)

(assert (=> b!115791 m!131671))

(declare-fun m!131673 () Bool)

(assert (=> b!115792 m!131673))

(assert (=> bm!12366 d!32433))

(declare-fun d!32435 () Bool)

(declare-fun e!75573 () Bool)

(assert (=> d!32435 e!75573))

(declare-fun res!56764 () Bool)

(assert (=> d!32435 (=> (not res!56764) (not e!75573))))

(declare-fun lt!60096 () ListLongMap!1609)

(assert (=> d!32435 (= res!56764 (contains!850 lt!60096 (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60098 () List!1666)

(assert (=> d!32435 (= lt!60096 (ListLongMap!1610 lt!60098))))

(declare-fun lt!60097 () Unit!3588)

(declare-fun lt!60099 () Unit!3588)

(assert (=> d!32435 (= lt!60097 lt!60099)))

(assert (=> d!32435 (= (getValueByKey!160 lt!60098 (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32435 (= lt!60099 (lemmaContainsTupThenGetReturnValue!79 lt!60098 (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32435 (= lt!60098 (insertStrictlySorted!82 (toList!820 call!12375) (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32435 (= (+!151 call!12375 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60096)))

(declare-fun b!115797 () Bool)

(declare-fun res!56763 () Bool)

(assert (=> b!115797 (=> (not res!56763) (not e!75573))))

(assert (=> b!115797 (= res!56763 (= (getValueByKey!160 (toList!820 lt!60096) (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115798 () Bool)

(assert (=> b!115798 (= e!75573 (contains!851 (toList!820 lt!60096) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32435 res!56764) b!115797))

(assert (= (and b!115797 res!56763) b!115798))

(declare-fun m!131675 () Bool)

(assert (=> d!32435 m!131675))

(declare-fun m!131677 () Bool)

(assert (=> d!32435 m!131677))

(declare-fun m!131679 () Bool)

(assert (=> d!32435 m!131679))

(declare-fun m!131681 () Bool)

(assert (=> d!32435 m!131681))

(declare-fun m!131683 () Bool)

(assert (=> b!115797 m!131683))

(declare-fun m!131685 () Bool)

(assert (=> b!115798 m!131685))

(assert (=> b!115672 d!32435))

(declare-fun d!32437 () Bool)

(assert (=> d!32437 (= (apply!104 lt!60018 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1398 (getValueByKey!160 (toList!820 lt!60018) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4704 () Bool)

(assert (= bs!4704 d!32437))

(declare-fun m!131687 () Bool)

(assert (=> bs!4704 m!131687))

(assert (=> bs!4704 m!131687))

(declare-fun m!131689 () Bool)

(assert (=> bs!4704 m!131689))

(assert (=> b!115682 d!32437))

(declare-fun d!32439 () Bool)

(declare-fun e!75574 () Bool)

(assert (=> d!32439 e!75574))

(declare-fun res!56765 () Bool)

(assert (=> d!32439 (=> res!56765 e!75574)))

(declare-fun lt!60100 () Bool)

(assert (=> d!32439 (= res!56765 (not lt!60100))))

(declare-fun lt!60101 () Bool)

(assert (=> d!32439 (= lt!60100 lt!60101)))

(declare-fun lt!60103 () Unit!3588)

(declare-fun e!75575 () Unit!3588)

(assert (=> d!32439 (= lt!60103 e!75575)))

(declare-fun c!20547 () Bool)

(assert (=> d!32439 (= c!20547 lt!60101)))

(assert (=> d!32439 (= lt!60101 (containsKey!164 (toList!820 lt!60018) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> d!32439 (= (contains!850 lt!60018 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) lt!60100)))

(declare-fun b!115799 () Bool)

(declare-fun lt!60102 () Unit!3588)

(assert (=> b!115799 (= e!75575 lt!60102)))

(assert (=> b!115799 (= lt!60102 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 lt!60018) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115799 (isDefined!114 (getValueByKey!160 (toList!820 lt!60018) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115800 () Bool)

(declare-fun Unit!3593 () Unit!3588)

(assert (=> b!115800 (= e!75575 Unit!3593)))

(declare-fun b!115801 () Bool)

(assert (=> b!115801 (= e!75574 (isDefined!114 (getValueByKey!160 (toList!820 lt!60018) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))))

(assert (= (and d!32439 c!20547) b!115799))

(assert (= (and d!32439 (not c!20547)) b!115800))

(assert (= (and d!32439 (not res!56765)) b!115801))

(assert (=> d!32439 m!131459))

(declare-fun m!131691 () Bool)

(assert (=> d!32439 m!131691))

(assert (=> b!115799 m!131459))

(declare-fun m!131693 () Bool)

(assert (=> b!115799 m!131693))

(assert (=> b!115799 m!131459))

(declare-fun m!131695 () Bool)

(assert (=> b!115799 m!131695))

(assert (=> b!115799 m!131695))

(declare-fun m!131697 () Bool)

(assert (=> b!115799 m!131697))

(assert (=> b!115801 m!131459))

(assert (=> b!115801 m!131695))

(assert (=> b!115801 m!131695))

(assert (=> b!115801 m!131697))

(assert (=> b!115683 d!32439))

(declare-fun d!32441 () Bool)

(assert (=> d!32441 (= (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115665 d!32441))

(declare-fun bm!12386 () Bool)

(declare-fun call!12389 () Bool)

(declare-fun c!20550 () Bool)

(assert (=> bm!12386 (= call!12389 (arrayNoDuplicates!0 (_keys!4427 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20550 (Cons!1665 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000) Nil!1666) Nil!1666)))))

(declare-fun b!115813 () Bool)

(declare-fun e!75585 () Bool)

(assert (=> b!115813 (= e!75585 call!12389)))

(declare-fun b!115814 () Bool)

(assert (=> b!115814 (= e!75585 call!12389)))

(declare-fun b!115815 () Bool)

(declare-fun e!75587 () Bool)

(declare-fun e!75586 () Bool)

(assert (=> b!115815 (= e!75587 e!75586)))

(declare-fun res!56773 () Bool)

(assert (=> b!115815 (=> (not res!56773) (not e!75586))))

(declare-fun e!75584 () Bool)

(assert (=> b!115815 (= res!56773 (not e!75584))))

(declare-fun res!56772 () Bool)

(assert (=> b!115815 (=> (not res!56772) (not e!75584))))

(assert (=> b!115815 (= res!56772 (validKeyInArray!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115816 () Bool)

(declare-fun contains!852 (List!1669 (_ BitVec 64)) Bool)

(assert (=> b!115816 (= e!75584 (contains!852 Nil!1666 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32443 () Bool)

(declare-fun res!56774 () Bool)

(assert (=> d!32443 (=> res!56774 e!75587)))

(assert (=> d!32443 (= res!56774 (bvsge #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(assert (=> d!32443 (= (arrayNoDuplicates!0 (_keys!4427 newMap!16) #b00000000000000000000000000000000 Nil!1666) e!75587)))

(declare-fun b!115812 () Bool)

(assert (=> b!115812 (= e!75586 e!75585)))

(assert (=> b!115812 (= c!20550 (validKeyInArray!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32443 (not res!56774)) b!115815))

(assert (= (and b!115815 res!56772) b!115816))

(assert (= (and b!115815 res!56773) b!115812))

(assert (= (and b!115812 c!20550) b!115813))

(assert (= (and b!115812 (not c!20550)) b!115814))

(assert (= (or b!115813 b!115814) bm!12386))

(declare-fun m!131699 () Bool)

(assert (=> bm!12386 m!131699))

(declare-fun m!131701 () Bool)

(assert (=> bm!12386 m!131701))

(assert (=> b!115815 m!131699))

(assert (=> b!115815 m!131699))

(declare-fun m!131703 () Bool)

(assert (=> b!115815 m!131703))

(assert (=> b!115816 m!131699))

(assert (=> b!115816 m!131699))

(declare-fun m!131705 () Bool)

(assert (=> b!115816 m!131705))

(assert (=> b!115812 m!131699))

(assert (=> b!115812 m!131699))

(assert (=> b!115812 m!131703))

(assert (=> b!115613 d!32443))

(declare-fun d!32445 () Bool)

(declare-fun e!75588 () Bool)

(assert (=> d!32445 e!75588))

(declare-fun res!56775 () Bool)

(assert (=> d!32445 (=> res!56775 e!75588)))

(declare-fun lt!60104 () Bool)

(assert (=> d!32445 (= res!56775 (not lt!60104))))

(declare-fun lt!60105 () Bool)

(assert (=> d!32445 (= lt!60104 lt!60105)))

(declare-fun lt!60107 () Unit!3588)

(declare-fun e!75589 () Unit!3588)

(assert (=> d!32445 (= lt!60107 e!75589)))

(declare-fun c!20551 () Bool)

(assert (=> d!32445 (= c!20551 lt!60105)))

(assert (=> d!32445 (= lt!60105 (containsKey!164 (toList!820 lt!60018) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32445 (= (contains!850 lt!60018 #b1000000000000000000000000000000000000000000000000000000000000000) lt!60104)))

(declare-fun b!115817 () Bool)

(declare-fun lt!60106 () Unit!3588)

(assert (=> b!115817 (= e!75589 lt!60106)))

(assert (=> b!115817 (= lt!60106 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 lt!60018) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115817 (isDefined!114 (getValueByKey!160 (toList!820 lt!60018) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115818 () Bool)

(declare-fun Unit!3594 () Unit!3588)

(assert (=> b!115818 (= e!75589 Unit!3594)))

(declare-fun b!115819 () Bool)

(assert (=> b!115819 (= e!75588 (isDefined!114 (getValueByKey!160 (toList!820 lt!60018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32445 c!20551) b!115817))

(assert (= (and d!32445 (not c!20551)) b!115818))

(assert (= (and d!32445 (not res!56775)) b!115819))

(declare-fun m!131707 () Bool)

(assert (=> d!32445 m!131707))

(declare-fun m!131709 () Bool)

(assert (=> b!115817 m!131709))

(declare-fun m!131711 () Bool)

(assert (=> b!115817 m!131711))

(assert (=> b!115817 m!131711))

(declare-fun m!131713 () Bool)

(assert (=> b!115817 m!131713))

(assert (=> b!115819 m!131711))

(assert (=> b!115819 m!131711))

(assert (=> b!115819 m!131713))

(assert (=> bm!12375 d!32445))

(declare-fun d!32447 () Bool)

(assert (=> d!32447 (= (validMask!0 (mask!6915 (v!3024 (underlying!402 thiss!992)))) (and (or (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000000111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000001111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000011111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000000111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000001111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000011111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000000111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000001111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000011111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000000111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000001111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000011111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000000111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000001111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000011111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000000111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000001111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000011111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000000111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000001111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000011111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000000111111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000001111111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000011111111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00000111111111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00001111111111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00011111111111111111111111111111) (= (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6915 (v!3024 (underlying!402 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!32381 d!32447))

(assert (=> b!115667 d!32441))

(assert (=> d!32387 d!32447))

(declare-fun d!32449 () Bool)

(assert (=> d!32449 (= (apply!104 lt!59996 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1398 (getValueByKey!160 (toList!820 lt!59996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4705 () Bool)

(assert (= bs!4705 d!32449))

(declare-fun m!131715 () Bool)

(assert (=> bs!4705 m!131715))

(assert (=> bs!4705 m!131715))

(declare-fun m!131717 () Bool)

(assert (=> bs!4705 m!131717))

(assert (=> b!115666 d!32449))

(declare-fun d!32451 () Bool)

(declare-fun e!75590 () Bool)

(assert (=> d!32451 e!75590))

(declare-fun res!56776 () Bool)

(assert (=> d!32451 (=> res!56776 e!75590)))

(declare-fun lt!60108 () Bool)

(assert (=> d!32451 (= res!56776 (not lt!60108))))

(declare-fun lt!60109 () Bool)

(assert (=> d!32451 (= lt!60108 lt!60109)))

(declare-fun lt!60111 () Unit!3588)

(declare-fun e!75591 () Unit!3588)

(assert (=> d!32451 (= lt!60111 e!75591)))

(declare-fun c!20552 () Bool)

(assert (=> d!32451 (= c!20552 lt!60109)))

(assert (=> d!32451 (= lt!60109 (containsKey!164 (toList!820 lt!60018) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32451 (= (contains!850 lt!60018 #b0000000000000000000000000000000000000000000000000000000000000000) lt!60108)))

(declare-fun b!115820 () Bool)

(declare-fun lt!60110 () Unit!3588)

(assert (=> b!115820 (= e!75591 lt!60110)))

(assert (=> b!115820 (= lt!60110 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 lt!60018) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115820 (isDefined!114 (getValueByKey!160 (toList!820 lt!60018) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115821 () Bool)

(declare-fun Unit!3595 () Unit!3588)

(assert (=> b!115821 (= e!75591 Unit!3595)))

(declare-fun b!115822 () Bool)

(assert (=> b!115822 (= e!75590 (isDefined!114 (getValueByKey!160 (toList!820 lt!60018) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32451 c!20552) b!115820))

(assert (= (and d!32451 (not c!20552)) b!115821))

(assert (= (and d!32451 (not res!56776)) b!115822))

(declare-fun m!131719 () Bool)

(assert (=> d!32451 m!131719))

(declare-fun m!131721 () Bool)

(assert (=> b!115820 m!131721))

(assert (=> b!115820 m!131687))

(assert (=> b!115820 m!131687))

(declare-fun m!131723 () Bool)

(assert (=> b!115820 m!131723))

(assert (=> b!115822 m!131687))

(assert (=> b!115822 m!131687))

(assert (=> b!115822 m!131723))

(assert (=> bm!12374 d!32451))

(declare-fun d!32453 () Bool)

(declare-fun e!75592 () Bool)

(assert (=> d!32453 e!75592))

(declare-fun res!56777 () Bool)

(assert (=> d!32453 (=> res!56777 e!75592)))

(declare-fun lt!60112 () Bool)

(assert (=> d!32453 (= res!56777 (not lt!60112))))

(declare-fun lt!60113 () Bool)

(assert (=> d!32453 (= lt!60112 lt!60113)))

(declare-fun lt!60115 () Unit!3588)

(declare-fun e!75593 () Unit!3588)

(assert (=> d!32453 (= lt!60115 e!75593)))

(declare-fun c!20553 () Bool)

(assert (=> d!32453 (= c!20553 lt!60113)))

(assert (=> d!32453 (= lt!60113 (containsKey!164 (toList!820 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59994))))

(assert (=> d!32453 (= (contains!850 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59994) lt!60112)))

(declare-fun b!115823 () Bool)

(declare-fun lt!60114 () Unit!3588)

(assert (=> b!115823 (= e!75593 lt!60114)))

(assert (=> b!115823 (= lt!60114 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59994))))

(assert (=> b!115823 (isDefined!114 (getValueByKey!160 (toList!820 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59994))))

(declare-fun b!115824 () Bool)

(declare-fun Unit!3596 () Unit!3588)

(assert (=> b!115824 (= e!75593 Unit!3596)))

(declare-fun b!115825 () Bool)

(assert (=> b!115825 (= e!75592 (isDefined!114 (getValueByKey!160 (toList!820 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59994)))))

(assert (= (and d!32453 c!20553) b!115823))

(assert (= (and d!32453 (not c!20553)) b!115824))

(assert (= (and d!32453 (not res!56777)) b!115825))

(declare-fun m!131725 () Bool)

(assert (=> d!32453 m!131725))

(declare-fun m!131727 () Bool)

(assert (=> b!115823 m!131727))

(declare-fun m!131729 () Bool)

(assert (=> b!115823 m!131729))

(assert (=> b!115823 m!131729))

(declare-fun m!131731 () Bool)

(assert (=> b!115823 m!131731))

(assert (=> b!115825 m!131729))

(assert (=> b!115825 m!131729))

(assert (=> b!115825 m!131731))

(assert (=> b!115662 d!32453))

(declare-fun d!32455 () Bool)

(assert (=> d!32455 (= (apply!104 (+!151 lt!59995 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59992) (get!1398 (getValueByKey!160 (toList!820 (+!151 lt!59995 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59992)))))

(declare-fun bs!4706 () Bool)

(assert (= bs!4706 d!32455))

(declare-fun m!131733 () Bool)

(assert (=> bs!4706 m!131733))

(assert (=> bs!4706 m!131733))

(declare-fun m!131735 () Bool)

(assert (=> bs!4706 m!131735))

(assert (=> b!115662 d!32455))

(declare-fun d!32457 () Bool)

(assert (=> d!32457 (contains!850 (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59994)))

(declare-fun lt!60116 () Unit!3588)

(assert (=> d!32457 (= lt!60116 (choose!733 lt!59985 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59994))))

(assert (=> d!32457 (contains!850 lt!59985 lt!59994)))

(assert (=> d!32457 (= (addStillContains!80 lt!59985 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59994) lt!60116)))

(declare-fun bs!4707 () Bool)

(assert (= bs!4707 d!32457))

(assert (=> bs!4707 m!131417))

(assert (=> bs!4707 m!131417))

(assert (=> bs!4707 m!131431))

(declare-fun m!131737 () Bool)

(assert (=> bs!4707 m!131737))

(declare-fun m!131739 () Bool)

(assert (=> bs!4707 m!131739))

(assert (=> b!115662 d!32457))

(declare-fun d!32459 () Bool)

(assert (=> d!32459 (= (apply!104 lt!59991 lt!59984) (get!1398 (getValueByKey!160 (toList!820 lt!59991) lt!59984)))))

(declare-fun bs!4708 () Bool)

(assert (= bs!4708 d!32459))

(declare-fun m!131741 () Bool)

(assert (=> bs!4708 m!131741))

(assert (=> bs!4708 m!131741))

(declare-fun m!131743 () Bool)

(assert (=> bs!4708 m!131743))

(assert (=> b!115662 d!32459))

(declare-fun d!32461 () Bool)

(declare-fun e!75594 () Bool)

(assert (=> d!32461 e!75594))

(declare-fun res!56779 () Bool)

(assert (=> d!32461 (=> (not res!56779) (not e!75594))))

(declare-fun lt!60117 () ListLongMap!1609)

(assert (=> d!32461 (= res!56779 (contains!850 lt!60117 (_1!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60119 () List!1666)

(assert (=> d!32461 (= lt!60117 (ListLongMap!1610 lt!60119))))

(declare-fun lt!60118 () Unit!3588)

(declare-fun lt!60120 () Unit!3588)

(assert (=> d!32461 (= lt!60118 lt!60120)))

(assert (=> d!32461 (= (getValueByKey!160 lt!60119 (_1!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32461 (= lt!60120 (lemmaContainsTupThenGetReturnValue!79 lt!60119 (_1!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32461 (= lt!60119 (insertStrictlySorted!82 (toList!820 lt!59995) (_1!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32461 (= (+!151 lt!59995 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60117)))

(declare-fun b!115826 () Bool)

(declare-fun res!56778 () Bool)

(assert (=> b!115826 (=> (not res!56778) (not e!75594))))

(assert (=> b!115826 (= res!56778 (= (getValueByKey!160 (toList!820 lt!60117) (_1!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115827 () Bool)

(assert (=> b!115827 (= e!75594 (contains!851 (toList!820 lt!60117) (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32461 res!56779) b!115826))

(assert (= (and b!115826 res!56778) b!115827))

(declare-fun m!131745 () Bool)

(assert (=> d!32461 m!131745))

(declare-fun m!131747 () Bool)

(assert (=> d!32461 m!131747))

(declare-fun m!131749 () Bool)

(assert (=> d!32461 m!131749))

(declare-fun m!131751 () Bool)

(assert (=> d!32461 m!131751))

(declare-fun m!131753 () Bool)

(assert (=> b!115826 m!131753))

(declare-fun m!131755 () Bool)

(assert (=> b!115827 m!131755))

(assert (=> b!115662 d!32461))

(declare-fun d!32463 () Bool)

(assert (=> d!32463 (= (apply!104 lt!59981 lt!59990) (get!1398 (getValueByKey!160 (toList!820 lt!59981) lt!59990)))))

(declare-fun bs!4709 () Bool)

(assert (= bs!4709 d!32463))

(declare-fun m!131757 () Bool)

(assert (=> bs!4709 m!131757))

(assert (=> bs!4709 m!131757))

(declare-fun m!131759 () Bool)

(assert (=> bs!4709 m!131759))

(assert (=> b!115662 d!32463))

(declare-fun d!32465 () Bool)

(declare-fun e!75595 () Bool)

(assert (=> d!32465 e!75595))

(declare-fun res!56781 () Bool)

(assert (=> d!32465 (=> (not res!56781) (not e!75595))))

(declare-fun lt!60121 () ListLongMap!1609)

(assert (=> d!32465 (= res!56781 (contains!850 lt!60121 (_1!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60123 () List!1666)

(assert (=> d!32465 (= lt!60121 (ListLongMap!1610 lt!60123))))

(declare-fun lt!60122 () Unit!3588)

(declare-fun lt!60124 () Unit!3588)

(assert (=> d!32465 (= lt!60122 lt!60124)))

(assert (=> d!32465 (= (getValueByKey!160 lt!60123 (_1!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32465 (= lt!60124 (lemmaContainsTupThenGetReturnValue!79 lt!60123 (_1!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32465 (= lt!60123 (insertStrictlySorted!82 (toList!820 lt!59991) (_1!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32465 (= (+!151 lt!59991 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60121)))

(declare-fun b!115828 () Bool)

(declare-fun res!56780 () Bool)

(assert (=> b!115828 (=> (not res!56780) (not e!75595))))

(assert (=> b!115828 (= res!56780 (= (getValueByKey!160 (toList!820 lt!60121) (_1!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115829 () Bool)

(assert (=> b!115829 (= e!75595 (contains!851 (toList!820 lt!60121) (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32465 res!56781) b!115828))

(assert (= (and b!115828 res!56780) b!115829))

(declare-fun m!131761 () Bool)

(assert (=> d!32465 m!131761))

(declare-fun m!131763 () Bool)

(assert (=> d!32465 m!131763))

(declare-fun m!131765 () Bool)

(assert (=> d!32465 m!131765))

(declare-fun m!131767 () Bool)

(assert (=> d!32465 m!131767))

(declare-fun m!131769 () Bool)

(assert (=> b!115828 m!131769))

(declare-fun m!131771 () Bool)

(assert (=> b!115829 m!131771))

(assert (=> b!115662 d!32465))

(declare-fun d!32467 () Bool)

(assert (=> d!32467 (= (apply!104 (+!151 lt!59991 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59984) (apply!104 lt!59991 lt!59984))))

(declare-fun lt!60125 () Unit!3588)

(assert (=> d!32467 (= lt!60125 (choose!732 lt!59991 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59984))))

(declare-fun e!75596 () Bool)

(assert (=> d!32467 e!75596))

(declare-fun res!56782 () Bool)

(assert (=> d!32467 (=> (not res!56782) (not e!75596))))

(assert (=> d!32467 (= res!56782 (contains!850 lt!59991 lt!59984))))

(assert (=> d!32467 (= (addApplyDifferent!80 lt!59991 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59984) lt!60125)))

(declare-fun b!115830 () Bool)

(assert (=> b!115830 (= e!75596 (not (= lt!59984 lt!59982)))))

(assert (= (and d!32467 res!56782) b!115830))

(assert (=> d!32467 m!131415))

(assert (=> d!32467 m!131427))

(assert (=> d!32467 m!131437))

(declare-fun m!131773 () Bool)

(assert (=> d!32467 m!131773))

(declare-fun m!131775 () Bool)

(assert (=> d!32467 m!131775))

(assert (=> d!32467 m!131427))

(assert (=> b!115662 d!32467))

(declare-fun d!32469 () Bool)

(declare-fun e!75597 () Bool)

(assert (=> d!32469 e!75597))

(declare-fun res!56784 () Bool)

(assert (=> d!32469 (=> (not res!56784) (not e!75597))))

(declare-fun lt!60126 () ListLongMap!1609)

(assert (=> d!32469 (= res!56784 (contains!850 lt!60126 (_1!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60128 () List!1666)

(assert (=> d!32469 (= lt!60126 (ListLongMap!1610 lt!60128))))

(declare-fun lt!60127 () Unit!3588)

(declare-fun lt!60129 () Unit!3588)

(assert (=> d!32469 (= lt!60127 lt!60129)))

(assert (=> d!32469 (= (getValueByKey!160 lt!60128 (_1!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32469 (= lt!60129 (lemmaContainsTupThenGetReturnValue!79 lt!60128 (_1!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32469 (= lt!60128 (insertStrictlySorted!82 (toList!820 lt!59985) (_1!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32469 (= (+!151 lt!59985 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60126)))

(declare-fun b!115831 () Bool)

(declare-fun res!56783 () Bool)

(assert (=> b!115831 (=> (not res!56783) (not e!75597))))

(assert (=> b!115831 (= res!56783 (= (getValueByKey!160 (toList!820 lt!60126) (_1!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115832 () Bool)

(assert (=> b!115832 (= e!75597 (contains!851 (toList!820 lt!60126) (tuple2!2485 lt!59989 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32469 res!56784) b!115831))

(assert (= (and b!115831 res!56783) b!115832))

(declare-fun m!131777 () Bool)

(assert (=> d!32469 m!131777))

(declare-fun m!131779 () Bool)

(assert (=> d!32469 m!131779))

(declare-fun m!131781 () Bool)

(assert (=> d!32469 m!131781))

(declare-fun m!131783 () Bool)

(assert (=> d!32469 m!131783))

(declare-fun m!131785 () Bool)

(assert (=> b!115831 m!131785))

(declare-fun m!131787 () Bool)

(assert (=> b!115832 m!131787))

(assert (=> b!115662 d!32469))

(declare-fun d!32471 () Bool)

(assert (=> d!32471 (= (apply!104 lt!59995 lt!59992) (get!1398 (getValueByKey!160 (toList!820 lt!59995) lt!59992)))))

(declare-fun bs!4710 () Bool)

(assert (= bs!4710 d!32471))

(declare-fun m!131789 () Bool)

(assert (=> bs!4710 m!131789))

(assert (=> bs!4710 m!131789))

(declare-fun m!131791 () Bool)

(assert (=> bs!4710 m!131791))

(assert (=> b!115662 d!32471))

(declare-fun d!32473 () Bool)

(declare-fun e!75598 () Bool)

(assert (=> d!32473 e!75598))

(declare-fun res!56786 () Bool)

(assert (=> d!32473 (=> (not res!56786) (not e!75598))))

(declare-fun lt!60130 () ListLongMap!1609)

(assert (=> d!32473 (= res!56786 (contains!850 lt!60130 (_1!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60132 () List!1666)

(assert (=> d!32473 (= lt!60130 (ListLongMap!1610 lt!60132))))

(declare-fun lt!60131 () Unit!3588)

(declare-fun lt!60133 () Unit!3588)

(assert (=> d!32473 (= lt!60131 lt!60133)))

(assert (=> d!32473 (= (getValueByKey!160 lt!60132 (_1!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32473 (= lt!60133 (lemmaContainsTupThenGetReturnValue!79 lt!60132 (_1!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32473 (= lt!60132 (insertStrictlySorted!82 (toList!820 lt!59981) (_1!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32473 (= (+!151 lt!59981 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60130)))

(declare-fun b!115833 () Bool)

(declare-fun res!56785 () Bool)

(assert (=> b!115833 (=> (not res!56785) (not e!75598))))

(assert (=> b!115833 (= res!56785 (= (getValueByKey!160 (toList!820 lt!60130) (_1!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115834 () Bool)

(assert (=> b!115834 (= e!75598 (contains!851 (toList!820 lt!60130) (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32473 res!56786) b!115833))

(assert (= (and b!115833 res!56785) b!115834))

(declare-fun m!131793 () Bool)

(assert (=> d!32473 m!131793))

(declare-fun m!131795 () Bool)

(assert (=> d!32473 m!131795))

(declare-fun m!131797 () Bool)

(assert (=> d!32473 m!131797))

(declare-fun m!131799 () Bool)

(assert (=> d!32473 m!131799))

(declare-fun m!131801 () Bool)

(assert (=> b!115833 m!131801))

(declare-fun m!131803 () Bool)

(assert (=> b!115834 m!131803))

(assert (=> b!115662 d!32473))

(declare-fun d!32475 () Bool)

(assert (=> d!32475 (= (apply!104 (+!151 lt!59995 (tuple2!2485 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59992) (apply!104 lt!59995 lt!59992))))

(declare-fun lt!60134 () Unit!3588)

(assert (=> d!32475 (= lt!60134 (choose!732 lt!59995 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59992))))

(declare-fun e!75599 () Bool)

(assert (=> d!32475 e!75599))

(declare-fun res!56787 () Bool)

(assert (=> d!32475 (=> (not res!56787) (not e!75599))))

(assert (=> d!32475 (= res!56787 (contains!850 lt!59995 lt!59992))))

(assert (=> d!32475 (= (addApplyDifferent!80 lt!59995 lt!59987 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59992) lt!60134)))

(declare-fun b!115835 () Bool)

(assert (=> b!115835 (= e!75599 (not (= lt!59992 lt!59987)))))

(assert (= (and d!32475 res!56787) b!115835))

(assert (=> d!32475 m!131423))

(assert (=> d!32475 m!131425))

(assert (=> d!32475 m!131433))

(declare-fun m!131805 () Bool)

(assert (=> d!32475 m!131805))

(declare-fun m!131807 () Bool)

(assert (=> d!32475 m!131807))

(assert (=> d!32475 m!131425))

(assert (=> b!115662 d!32475))

(assert (=> b!115662 d!32433))

(declare-fun d!32477 () Bool)

(assert (=> d!32477 (= (apply!104 (+!151 lt!59981 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59990) (apply!104 lt!59981 lt!59990))))

(declare-fun lt!60135 () Unit!3588)

(assert (=> d!32477 (= lt!60135 (choose!732 lt!59981 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59990))))

(declare-fun e!75600 () Bool)

(assert (=> d!32477 e!75600))

(declare-fun res!56788 () Bool)

(assert (=> d!32477 (=> (not res!56788) (not e!75600))))

(assert (=> d!32477 (= res!56788 (contains!850 lt!59981 lt!59990))))

(assert (=> d!32477 (= (addApplyDifferent!80 lt!59981 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))) lt!59990) lt!60135)))

(declare-fun b!115836 () Bool)

(assert (=> b!115836 (= e!75600 (not (= lt!59990 lt!59997)))))

(assert (= (and d!32477 res!56788) b!115836))

(assert (=> d!32477 m!131419))

(assert (=> d!32477 m!131421))

(assert (=> d!32477 m!131429))

(declare-fun m!131809 () Bool)

(assert (=> d!32477 m!131809))

(declare-fun m!131811 () Bool)

(assert (=> d!32477 m!131811))

(assert (=> d!32477 m!131421))

(assert (=> b!115662 d!32477))

(declare-fun d!32479 () Bool)

(assert (=> d!32479 (= (apply!104 (+!151 lt!59981 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59990) (get!1398 (getValueByKey!160 (toList!820 (+!151 lt!59981 (tuple2!2485 lt!59997 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59990)))))

(declare-fun bs!4711 () Bool)

(assert (= bs!4711 d!32479))

(declare-fun m!131813 () Bool)

(assert (=> bs!4711 m!131813))

(assert (=> bs!4711 m!131813))

(declare-fun m!131815 () Bool)

(assert (=> bs!4711 m!131815))

(assert (=> b!115662 d!32479))

(declare-fun d!32481 () Bool)

(assert (=> d!32481 (= (apply!104 (+!151 lt!59991 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!59984) (get!1398 (getValueByKey!160 (toList!820 (+!151 lt!59991 (tuple2!2485 lt!59982 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!59984)))))

(declare-fun bs!4712 () Bool)

(assert (= bs!4712 d!32481))

(declare-fun m!131817 () Bool)

(assert (=> bs!4712 m!131817))

(assert (=> bs!4712 m!131817))

(declare-fun m!131819 () Bool)

(assert (=> bs!4712 m!131819))

(assert (=> b!115662 d!32481))

(declare-fun b!115837 () Bool)

(declare-fun e!75602 () Unit!3588)

(declare-fun Unit!3597 () Unit!3588)

(assert (=> b!115837 (= e!75602 Unit!3597)))

(declare-fun bm!12387 () Bool)

(declare-fun call!12394 () ListLongMap!1609)

(assert (=> bm!12387 (= call!12394 (getCurrentListMapNoExtraKeys!116 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun b!115838 () Bool)

(declare-fun e!75603 () Bool)

(declare-fun e!75604 () Bool)

(assert (=> b!115838 (= e!75603 e!75604)))

(declare-fun res!56790 () Bool)

(declare-fun call!12392 () Bool)

(assert (=> b!115838 (= res!56790 call!12392)))

(assert (=> b!115838 (=> (not res!56790) (not e!75604))))

(declare-fun b!115839 () Bool)

(declare-fun e!75608 () Bool)

(assert (=> b!115839 (= e!75608 e!75603)))

(declare-fun c!20559 () Bool)

(assert (=> b!115839 (= c!20559 (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115840 () Bool)

(declare-fun e!75605 () Bool)

(declare-fun lt!60156 () ListLongMap!1609)

(assert (=> b!115840 (= e!75605 (= (apply!104 lt!60156 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2573 newMap!16)))))

(declare-fun b!115841 () Bool)

(declare-fun e!75612 () Bool)

(declare-fun e!75613 () Bool)

(assert (=> b!115841 (= e!75612 e!75613)))

(declare-fun res!56797 () Bool)

(assert (=> b!115841 (=> (not res!56797) (not e!75613))))

(assert (=> b!115841 (= res!56797 (contains!850 lt!60156 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!115841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(declare-fun bm!12388 () Bool)

(declare-fun call!12390 () Bool)

(assert (=> bm!12388 (= call!12390 (contains!850 lt!60156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12389 () Bool)

(assert (=> bm!12389 (= call!12392 (contains!850 lt!60156 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115842 () Bool)

(declare-fun res!56793 () Bool)

(assert (=> b!115842 (=> (not res!56793) (not e!75608))))

(declare-fun e!75609 () Bool)

(assert (=> b!115842 (= res!56793 e!75609)))

(declare-fun c!20556 () Bool)

(assert (=> b!115842 (= c!20556 (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12390 () Bool)

(declare-fun call!12393 () ListLongMap!1609)

(declare-fun call!12396 () ListLongMap!1609)

(assert (=> bm!12390 (= call!12393 call!12396)))

(declare-fun b!115843 () Bool)

(declare-fun lt!60148 () Unit!3588)

(assert (=> b!115843 (= e!75602 lt!60148)))

(declare-fun lt!60145 () ListLongMap!1609)

(assert (=> b!115843 (= lt!60145 (getCurrentListMapNoExtraKeys!116 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60149 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60154 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60154 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60139 () Unit!3588)

(assert (=> b!115843 (= lt!60139 (addStillContains!80 lt!60145 lt!60149 (zeroValue!2573 newMap!16) lt!60154))))

(assert (=> b!115843 (contains!850 (+!151 lt!60145 (tuple2!2485 lt!60149 (zeroValue!2573 newMap!16))) lt!60154)))

(declare-fun lt!60137 () Unit!3588)

(assert (=> b!115843 (= lt!60137 lt!60139)))

(declare-fun lt!60155 () ListLongMap!1609)

(assert (=> b!115843 (= lt!60155 (getCurrentListMapNoExtraKeys!116 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60147 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60147 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60152 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60152 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60143 () Unit!3588)

(assert (=> b!115843 (= lt!60143 (addApplyDifferent!80 lt!60155 lt!60147 (minValue!2573 newMap!16) lt!60152))))

(assert (=> b!115843 (= (apply!104 (+!151 lt!60155 (tuple2!2485 lt!60147 (minValue!2573 newMap!16))) lt!60152) (apply!104 lt!60155 lt!60152))))

(declare-fun lt!60140 () Unit!3588)

(assert (=> b!115843 (= lt!60140 lt!60143)))

(declare-fun lt!60151 () ListLongMap!1609)

(assert (=> b!115843 (= lt!60151 (getCurrentListMapNoExtraKeys!116 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60142 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60142 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60144 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60144 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60138 () Unit!3588)

(assert (=> b!115843 (= lt!60138 (addApplyDifferent!80 lt!60151 lt!60142 (zeroValue!2573 newMap!16) lt!60144))))

(assert (=> b!115843 (= (apply!104 (+!151 lt!60151 (tuple2!2485 lt!60142 (zeroValue!2573 newMap!16))) lt!60144) (apply!104 lt!60151 lt!60144))))

(declare-fun lt!60153 () Unit!3588)

(assert (=> b!115843 (= lt!60153 lt!60138)))

(declare-fun lt!60141 () ListLongMap!1609)

(assert (=> b!115843 (= lt!60141 (getCurrentListMapNoExtraKeys!116 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60157 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60150 () (_ BitVec 64))

(assert (=> b!115843 (= lt!60150 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115843 (= lt!60148 (addApplyDifferent!80 lt!60141 lt!60157 (minValue!2573 newMap!16) lt!60150))))

(assert (=> b!115843 (= (apply!104 (+!151 lt!60141 (tuple2!2485 lt!60157 (minValue!2573 newMap!16))) lt!60150) (apply!104 lt!60141 lt!60150))))

(declare-fun b!115844 () Bool)

(declare-fun c!20555 () Bool)

(assert (=> b!115844 (= c!20555 (and (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75610 () ListLongMap!1609)

(declare-fun e!75601 () ListLongMap!1609)

(assert (=> b!115844 (= e!75610 e!75601)))

(declare-fun bm!12391 () Bool)

(declare-fun call!12391 () ListLongMap!1609)

(declare-fun call!12395 () ListLongMap!1609)

(assert (=> bm!12391 (= call!12391 call!12395)))

(declare-fun b!115845 () Bool)

(declare-fun e!75607 () ListLongMap!1609)

(assert (=> b!115845 (= e!75607 e!75610)))

(declare-fun c!20554 () Bool)

(assert (=> b!115845 (= c!20554 (and (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!32483 () Bool)

(assert (=> d!32483 e!75608))

(declare-fun res!56796 () Bool)

(assert (=> d!32483 (=> (not res!56796) (not e!75608))))

(assert (=> d!32483 (= res!56796 (or (bvsge #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))))

(declare-fun lt!60136 () ListLongMap!1609)

(assert (=> d!32483 (= lt!60156 lt!60136)))

(declare-fun lt!60146 () Unit!3588)

(assert (=> d!32483 (= lt!60146 e!75602)))

(declare-fun c!20558 () Bool)

(declare-fun e!75606 () Bool)

(assert (=> d!32483 (= c!20558 e!75606)))

(declare-fun res!56791 () Bool)

(assert (=> d!32483 (=> (not res!56791) (not e!75606))))

(assert (=> d!32483 (= res!56791 (bvslt #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(assert (=> d!32483 (= lt!60136 e!75607)))

(declare-fun c!20557 () Bool)

(assert (=> d!32483 (= c!20557 (and (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32483 (validMask!0 (mask!6915 newMap!16))))

(assert (=> d!32483 (= (getCurrentListMap!491 (_keys!4427 newMap!16) (_values!2689 newMap!16) (mask!6915 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)) lt!60156)))

(declare-fun b!115846 () Bool)

(assert (=> b!115846 (= e!75606 (validKeyInArray!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12392 () Bool)

(assert (=> bm!12392 (= call!12395 call!12394)))

(declare-fun b!115847 () Bool)

(assert (=> b!115847 (= e!75604 (= (apply!104 lt!60156 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2573 newMap!16)))))

(declare-fun b!115848 () Bool)

(declare-fun e!75611 () Bool)

(assert (=> b!115848 (= e!75611 (validKeyInArray!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115849 () Bool)

(declare-fun res!56792 () Bool)

(assert (=> b!115849 (=> (not res!56792) (not e!75608))))

(assert (=> b!115849 (= res!56792 e!75612)))

(declare-fun res!56795 () Bool)

(assert (=> b!115849 (=> res!56795 e!75612)))

(assert (=> b!115849 (= res!56795 (not e!75611))))

(declare-fun res!56789 () Bool)

(assert (=> b!115849 (=> (not res!56789) (not e!75611))))

(assert (=> b!115849 (= res!56789 (bvslt #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(declare-fun b!115850 () Bool)

(assert (=> b!115850 (= e!75613 (= (apply!104 lt!60156 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)) (get!1397 (select (arr!2147 (_values!2689 newMap!16)) #b00000000000000000000000000000000) (dynLambda!400 (defaultEntry!2706 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2408 (_values!2689 newMap!16))))))

(assert (=> b!115850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(declare-fun b!115851 () Bool)

(assert (=> b!115851 (= e!75609 e!75605)))

(declare-fun res!56794 () Bool)

(assert (=> b!115851 (= res!56794 call!12390)))

(assert (=> b!115851 (=> (not res!56794) (not e!75605))))

(declare-fun b!115852 () Bool)

(assert (=> b!115852 (= e!75603 (not call!12392))))

(declare-fun b!115853 () Bool)

(assert (=> b!115853 (= e!75607 (+!151 call!12396 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 newMap!16))))))

(declare-fun bm!12393 () Bool)

(assert (=> bm!12393 (= call!12396 (+!151 (ite c!20557 call!12394 (ite c!20554 call!12395 call!12391)) (ite (or c!20557 c!20554) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 newMap!16)) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 newMap!16)))))))

(declare-fun b!115854 () Bool)

(assert (=> b!115854 (= e!75601 call!12393)))

(declare-fun b!115855 () Bool)

(assert (=> b!115855 (= e!75610 call!12393)))

(declare-fun b!115856 () Bool)

(assert (=> b!115856 (= e!75609 (not call!12390))))

(declare-fun b!115857 () Bool)

(assert (=> b!115857 (= e!75601 call!12391)))

(assert (= (and d!32483 c!20557) b!115853))

(assert (= (and d!32483 (not c!20557)) b!115845))

(assert (= (and b!115845 c!20554) b!115855))

(assert (= (and b!115845 (not c!20554)) b!115844))

(assert (= (and b!115844 c!20555) b!115854))

(assert (= (and b!115844 (not c!20555)) b!115857))

(assert (= (or b!115854 b!115857) bm!12391))

(assert (= (or b!115855 bm!12391) bm!12392))

(assert (= (or b!115855 b!115854) bm!12390))

(assert (= (or b!115853 bm!12392) bm!12387))

(assert (= (or b!115853 bm!12390) bm!12393))

(assert (= (and d!32483 res!56791) b!115846))

(assert (= (and d!32483 c!20558) b!115843))

(assert (= (and d!32483 (not c!20558)) b!115837))

(assert (= (and d!32483 res!56796) b!115849))

(assert (= (and b!115849 res!56789) b!115848))

(assert (= (and b!115849 (not res!56795)) b!115841))

(assert (= (and b!115841 res!56797) b!115850))

(assert (= (and b!115849 res!56792) b!115842))

(assert (= (and b!115842 c!20556) b!115851))

(assert (= (and b!115842 (not c!20556)) b!115856))

(assert (= (and b!115851 res!56794) b!115840))

(assert (= (or b!115851 b!115856) bm!12388))

(assert (= (and b!115842 res!56793) b!115839))

(assert (= (and b!115839 c!20559) b!115838))

(assert (= (and b!115839 (not c!20559)) b!115852))

(assert (= (and b!115838 res!56790) b!115847))

(assert (= (or b!115838 b!115852) bm!12389))

(declare-fun b_lambda!5149 () Bool)

(assert (=> (not b_lambda!5149) (not b!115850)))

(declare-fun tb!2221 () Bool)

(declare-fun t!5924 () Bool)

(assert (=> (and b!115511 (= (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) (defaultEntry!2706 newMap!16)) t!5924) tb!2221))

(declare-fun result!3707 () Bool)

(assert (=> tb!2221 (= result!3707 tp_is_empty!2773)))

(assert (=> b!115850 t!5924))

(declare-fun b_and!7205 () Bool)

(assert (= b_and!7201 (and (=> t!5924 result!3707) b_and!7205)))

(declare-fun t!5926 () Bool)

(declare-fun tb!2223 () Bool)

(assert (=> (and b!115505 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 newMap!16)) t!5926) tb!2223))

(declare-fun result!3709 () Bool)

(assert (= result!3709 result!3707))

(assert (=> b!115850 t!5926))

(declare-fun b_and!7207 () Bool)

(assert (= b_and!7203 (and (=> t!5926 result!3709) b_and!7207)))

(declare-fun m!131821 () Bool)

(assert (=> bm!12387 m!131821))

(declare-fun m!131823 () Bool)

(assert (=> b!115840 m!131823))

(declare-fun m!131825 () Bool)

(assert (=> d!32483 m!131825))

(declare-fun m!131827 () Bool)

(assert (=> b!115847 m!131827))

(declare-fun m!131829 () Bool)

(assert (=> bm!12388 m!131829))

(assert (=> b!115850 m!131699))

(declare-fun m!131831 () Bool)

(assert (=> b!115850 m!131831))

(declare-fun m!131833 () Bool)

(assert (=> b!115850 m!131833))

(declare-fun m!131835 () Bool)

(assert (=> b!115850 m!131835))

(declare-fun m!131837 () Bool)

(assert (=> b!115850 m!131837))

(assert (=> b!115850 m!131699))

(assert (=> b!115850 m!131835))

(assert (=> b!115850 m!131833))

(declare-fun m!131839 () Bool)

(assert (=> bm!12389 m!131839))

(declare-fun m!131841 () Bool)

(assert (=> b!115843 m!131841))

(declare-fun m!131843 () Bool)

(assert (=> b!115843 m!131843))

(declare-fun m!131845 () Bool)

(assert (=> b!115843 m!131845))

(declare-fun m!131847 () Bool)

(assert (=> b!115843 m!131847))

(declare-fun m!131849 () Bool)

(assert (=> b!115843 m!131849))

(assert (=> b!115843 m!131699))

(declare-fun m!131851 () Bool)

(assert (=> b!115843 m!131851))

(declare-fun m!131853 () Bool)

(assert (=> b!115843 m!131853))

(declare-fun m!131855 () Bool)

(assert (=> b!115843 m!131855))

(assert (=> b!115843 m!131849))

(declare-fun m!131857 () Bool)

(assert (=> b!115843 m!131857))

(assert (=> b!115843 m!131845))

(declare-fun m!131859 () Bool)

(assert (=> b!115843 m!131859))

(assert (=> b!115843 m!131821))

(assert (=> b!115843 m!131853))

(declare-fun m!131861 () Bool)

(assert (=> b!115843 m!131861))

(declare-fun m!131863 () Bool)

(assert (=> b!115843 m!131863))

(assert (=> b!115843 m!131855))

(declare-fun m!131865 () Bool)

(assert (=> b!115843 m!131865))

(declare-fun m!131867 () Bool)

(assert (=> b!115843 m!131867))

(declare-fun m!131869 () Bool)

(assert (=> b!115843 m!131869))

(assert (=> b!115846 m!131699))

(assert (=> b!115846 m!131699))

(assert (=> b!115846 m!131703))

(declare-fun m!131871 () Bool)

(assert (=> bm!12393 m!131871))

(declare-fun m!131873 () Bool)

(assert (=> b!115853 m!131873))

(assert (=> b!115841 m!131699))

(assert (=> b!115841 m!131699))

(declare-fun m!131875 () Bool)

(assert (=> b!115841 m!131875))

(assert (=> b!115848 m!131699))

(assert (=> b!115848 m!131699))

(assert (=> b!115848 m!131703))

(assert (=> d!32379 d!32483))

(declare-fun d!32485 () Bool)

(assert (=> d!32485 (= (apply!104 lt!60018 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1398 (getValueByKey!160 (toList!820 lt!60018) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))))

(declare-fun bs!4713 () Bool)

(assert (= bs!4713 d!32485))

(assert (=> bs!4713 m!131459))

(assert (=> bs!4713 m!131695))

(assert (=> bs!4713 m!131695))

(declare-fun m!131877 () Bool)

(assert (=> bs!4713 m!131877))

(assert (=> b!115692 d!32485))

(declare-fun d!32487 () Bool)

(declare-fun c!20560 () Bool)

(assert (=> d!32487 (= c!20560 ((_ is ValueCellFull!1043) (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun e!75614 () V!3345)

(assert (=> d!32487 (= (get!1397 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!75614)))

(declare-fun b!115858 () Bool)

(assert (=> b!115858 (= e!75614 (get!1399 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115859 () Bool)

(assert (=> b!115859 (= e!75614 (get!1400 (select (arr!2147 (_values!2689 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!400 (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32487 c!20560) b!115858))

(assert (= (and d!32487 (not c!20560)) b!115859))

(assert (=> b!115858 m!131463))

(assert (=> b!115858 m!131407))

(declare-fun m!131879 () Bool)

(assert (=> b!115858 m!131879))

(assert (=> b!115859 m!131463))

(assert (=> b!115859 m!131407))

(declare-fun m!131881 () Bool)

(assert (=> b!115859 m!131881))

(assert (=> b!115692 d!32487))

(declare-fun bm!12396 () Bool)

(declare-fun call!12399 () Bool)

(assert (=> bm!12396 (= call!12399 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4427 newMap!16) (mask!6915 newMap!16)))))

(declare-fun b!115868 () Bool)

(declare-fun e!75621 () Bool)

(assert (=> b!115868 (= e!75621 call!12399)))

(declare-fun b!115869 () Bool)

(declare-fun e!75623 () Bool)

(declare-fun e!75622 () Bool)

(assert (=> b!115869 (= e!75623 e!75622)))

(declare-fun c!20563 () Bool)

(assert (=> b!115869 (= c!20563 (validKeyInArray!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32489 () Bool)

(declare-fun res!56802 () Bool)

(assert (=> d!32489 (=> res!56802 e!75623)))

(assert (=> d!32489 (= res!56802 (bvsge #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(assert (=> d!32489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4427 newMap!16) (mask!6915 newMap!16)) e!75623)))

(declare-fun b!115870 () Bool)

(assert (=> b!115870 (= e!75622 e!75621)))

(declare-fun lt!60164 () (_ BitVec 64))

(assert (=> b!115870 (= lt!60164 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60166 () Unit!3588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4529 (_ BitVec 64) (_ BitVec 32)) Unit!3588)

(assert (=> b!115870 (= lt!60166 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4427 newMap!16) lt!60164 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!115870 (arrayContainsKey!0 (_keys!4427 newMap!16) lt!60164 #b00000000000000000000000000000000)))

(declare-fun lt!60165 () Unit!3588)

(assert (=> b!115870 (= lt!60165 lt!60166)))

(declare-fun res!56803 () Bool)

(declare-datatypes ((SeekEntryResult!268 0))(
  ( (MissingZero!268 (index!3225 (_ BitVec 32))) (Found!268 (index!3226 (_ BitVec 32))) (Intermediate!268 (undefined!1080 Bool) (index!3227 (_ BitVec 32)) (x!14412 (_ BitVec 32))) (Undefined!268) (MissingVacant!268 (index!3228 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4529 (_ BitVec 32)) SeekEntryResult!268)

(assert (=> b!115870 (= res!56803 (= (seekEntryOrOpen!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000) (_keys!4427 newMap!16) (mask!6915 newMap!16)) (Found!268 #b00000000000000000000000000000000)))))

(assert (=> b!115870 (=> (not res!56803) (not e!75621))))

(declare-fun b!115871 () Bool)

(assert (=> b!115871 (= e!75622 call!12399)))

(assert (= (and d!32489 (not res!56802)) b!115869))

(assert (= (and b!115869 c!20563) b!115870))

(assert (= (and b!115869 (not c!20563)) b!115871))

(assert (= (and b!115870 res!56803) b!115868))

(assert (= (or b!115868 b!115871) bm!12396))

(declare-fun m!131883 () Bool)

(assert (=> bm!12396 m!131883))

(assert (=> b!115869 m!131699))

(assert (=> b!115869 m!131699))

(assert (=> b!115869 m!131703))

(assert (=> b!115870 m!131699))

(declare-fun m!131885 () Bool)

(assert (=> b!115870 m!131885))

(declare-fun m!131887 () Bool)

(assert (=> b!115870 m!131887))

(assert (=> b!115870 m!131699))

(declare-fun m!131889 () Bool)

(assert (=> b!115870 m!131889))

(assert (=> b!115612 d!32489))

(declare-fun d!32491 () Bool)

(declare-fun e!75624 () Bool)

(assert (=> d!32491 e!75624))

(declare-fun res!56805 () Bool)

(assert (=> d!32491 (=> (not res!56805) (not e!75624))))

(declare-fun lt!60167 () ListLongMap!1609)

(assert (=> d!32491 (= res!56805 (contains!850 lt!60167 (_1!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun lt!60169 () List!1666)

(assert (=> d!32491 (= lt!60167 (ListLongMap!1610 lt!60169))))

(declare-fun lt!60168 () Unit!3588)

(declare-fun lt!60170 () Unit!3588)

(assert (=> d!32491 (= lt!60168 lt!60170)))

(assert (=> d!32491 (= (getValueByKey!160 lt!60169 (_1!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))) (Some!165 (_2!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(assert (=> d!32491 (= lt!60170 (lemmaContainsTupThenGetReturnValue!79 lt!60169 (_1!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (_2!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(assert (=> d!32491 (= lt!60169 (insertStrictlySorted!82 (toList!820 (ite c!20522 call!12380 (ite c!20519 call!12381 call!12377))) (_1!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (_2!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(assert (=> d!32491 (= (+!151 (ite c!20522 call!12380 (ite c!20519 call!12381 call!12377)) (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) lt!60167)))

(declare-fun b!115872 () Bool)

(declare-fun res!56804 () Bool)

(assert (=> b!115872 (=> (not res!56804) (not e!75624))))

(assert (=> b!115872 (= res!56804 (= (getValueByKey!160 (toList!820 lt!60167) (_1!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))) (Some!165 (_2!1253 (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))))

(declare-fun b!115873 () Bool)

(assert (=> b!115873 (= e!75624 (contains!851 (toList!820 lt!60167) (ite (or c!20522 c!20519) (tuple2!2485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3024 (underlying!402 thiss!992)))) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (= (and d!32491 res!56805) b!115872))

(assert (= (and b!115872 res!56804) b!115873))

(declare-fun m!131891 () Bool)

(assert (=> d!32491 m!131891))

(declare-fun m!131893 () Bool)

(assert (=> d!32491 m!131893))

(declare-fun m!131895 () Bool)

(assert (=> d!32491 m!131895))

(declare-fun m!131897 () Bool)

(assert (=> d!32491 m!131897))

(declare-fun m!131899 () Bool)

(assert (=> b!115872 m!131899))

(declare-fun m!131901 () Bool)

(assert (=> b!115873 m!131901))

(assert (=> bm!12379 d!32491))

(declare-fun bm!12399 () Bool)

(declare-fun call!12402 () (_ BitVec 32))

(assert (=> bm!12399 (= call!12402 (arrayCountValidKeys!0 (_keys!4427 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2407 (_keys!4427 newMap!16))))))

(declare-fun b!115882 () Bool)

(declare-fun e!75630 () (_ BitVec 32))

(assert (=> b!115882 (= e!75630 #b00000000000000000000000000000000)))

(declare-fun d!32493 () Bool)

(declare-fun lt!60173 () (_ BitVec 32))

(assert (=> d!32493 (and (bvsge lt!60173 #b00000000000000000000000000000000) (bvsle lt!60173 (bvsub (size!2407 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!32493 (= lt!60173 e!75630)))

(declare-fun c!20569 () Bool)

(assert (=> d!32493 (= c!20569 (bvsge #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))))))

(assert (=> d!32493 (and (bvsle #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2407 (_keys!4427 newMap!16)) (size!2407 (_keys!4427 newMap!16))))))

(assert (=> d!32493 (= (arrayCountValidKeys!0 (_keys!4427 newMap!16) #b00000000000000000000000000000000 (size!2407 (_keys!4427 newMap!16))) lt!60173)))

(declare-fun b!115883 () Bool)

(declare-fun e!75629 () (_ BitVec 32))

(assert (=> b!115883 (= e!75629 (bvadd #b00000000000000000000000000000001 call!12402))))

(declare-fun b!115884 () Bool)

(assert (=> b!115884 (= e!75629 call!12402)))

(declare-fun b!115885 () Bool)

(assert (=> b!115885 (= e!75630 e!75629)))

(declare-fun c!20568 () Bool)

(assert (=> b!115885 (= c!20568 (validKeyInArray!0 (select (arr!2146 (_keys!4427 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32493 c!20569) b!115882))

(assert (= (and d!32493 (not c!20569)) b!115885))

(assert (= (and b!115885 c!20568) b!115883))

(assert (= (and b!115885 (not c!20568)) b!115884))

(assert (= (or b!115883 b!115884) bm!12399))

(declare-fun m!131903 () Bool)

(assert (=> bm!12399 m!131903))

(assert (=> b!115885 m!131699))

(assert (=> b!115885 m!131699))

(assert (=> b!115885 m!131703))

(assert (=> b!115611 d!32493))

(assert (=> bm!12373 d!32421))

(declare-fun d!32495 () Bool)

(declare-fun res!56816 () Bool)

(declare-fun e!75633 () Bool)

(assert (=> d!32495 (=> (not res!56816) (not e!75633))))

(assert (=> d!32495 (= res!56816 (validMask!0 (mask!6915 newMap!16)))))

(assert (=> d!32495 (= (simpleValid!80 newMap!16) e!75633)))

(declare-fun b!115895 () Bool)

(declare-fun res!56815 () Bool)

(assert (=> b!115895 (=> (not res!56815) (not e!75633))))

(declare-fun size!2413 (LongMapFixedSize!994) (_ BitVec 32))

(assert (=> b!115895 (= res!56815 (bvsge (size!2413 newMap!16) (_size!546 newMap!16)))))

(declare-fun b!115894 () Bool)

(declare-fun res!56814 () Bool)

(assert (=> b!115894 (=> (not res!56814) (not e!75633))))

(assert (=> b!115894 (= res!56814 (and (= (size!2408 (_values!2689 newMap!16)) (bvadd (mask!6915 newMap!16) #b00000000000000000000000000000001)) (= (size!2407 (_keys!4427 newMap!16)) (size!2408 (_values!2689 newMap!16))) (bvsge (_size!546 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!546 newMap!16) (bvadd (mask!6915 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!115897 () Bool)

(assert (=> b!115897 (= e!75633 (and (bvsge (extraKeys!2495 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2495 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!546 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!115896 () Bool)

(declare-fun res!56817 () Bool)

(assert (=> b!115896 (=> (not res!56817) (not e!75633))))

(assert (=> b!115896 (= res!56817 (= (size!2413 newMap!16) (bvadd (_size!546 newMap!16) (bvsdiv (bvadd (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!32495 res!56816) b!115894))

(assert (= (and b!115894 res!56814) b!115895))

(assert (= (and b!115895 res!56815) b!115896))

(assert (= (and b!115896 res!56817) b!115897))

(assert (=> d!32495 m!131825))

(declare-fun m!131905 () Bool)

(assert (=> b!115895 m!131905))

(assert (=> b!115896 m!131905))

(assert (=> d!32375 d!32495))

(declare-fun d!32497 () Bool)

(declare-fun e!75634 () Bool)

(assert (=> d!32497 e!75634))

(declare-fun res!56819 () Bool)

(assert (=> d!32497 (=> (not res!56819) (not e!75634))))

(declare-fun lt!60174 () ListLongMap!1609)

(assert (=> d!32497 (= res!56819 (contains!850 lt!60174 (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(declare-fun lt!60176 () List!1666)

(assert (=> d!32497 (= lt!60174 (ListLongMap!1610 lt!60176))))

(declare-fun lt!60175 () Unit!3588)

(declare-fun lt!60177 () Unit!3588)

(assert (=> d!32497 (= lt!60175 lt!60177)))

(assert (=> d!32497 (= (getValueByKey!160 lt!60176 (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32497 (= lt!60177 (lemmaContainsTupThenGetReturnValue!79 lt!60176 (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32497 (= lt!60176 (insertStrictlySorted!82 (toList!820 call!12382) (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))))))

(assert (=> d!32497 (= (+!151 call!12382 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))) lt!60174)))

(declare-fun b!115898 () Bool)

(declare-fun res!56818 () Bool)

(assert (=> b!115898 (=> (not res!56818) (not e!75634))))

(assert (=> b!115898 (= res!56818 (= (getValueByKey!160 (toList!820 lt!60174) (_1!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992)))))) (Some!165 (_2!1253 (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))))

(declare-fun b!115899 () Bool)

(assert (=> b!115899 (= e!75634 (contains!851 (toList!820 lt!60174) (tuple2!2485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3024 (underlying!402 thiss!992))))))))

(assert (= (and d!32497 res!56819) b!115898))

(assert (= (and b!115898 res!56818) b!115899))

(declare-fun m!131907 () Bool)

(assert (=> d!32497 m!131907))

(declare-fun m!131909 () Bool)

(assert (=> d!32497 m!131909))

(declare-fun m!131911 () Bool)

(assert (=> d!32497 m!131911))

(declare-fun m!131913 () Bool)

(assert (=> d!32497 m!131913))

(declare-fun m!131915 () Bool)

(assert (=> b!115898 m!131915))

(declare-fun m!131917 () Bool)

(assert (=> b!115899 m!131917))

(assert (=> b!115695 d!32497))

(declare-fun d!32499 () Bool)

(assert (=> d!32499 (= (apply!104 lt!59996 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1398 (getValueByKey!160 (toList!820 lt!59996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4714 () Bool)

(assert (= bs!4714 d!32499))

(declare-fun m!131919 () Bool)

(assert (=> bs!4714 m!131919))

(assert (=> bs!4714 m!131919))

(declare-fun m!131921 () Bool)

(assert (=> bs!4714 m!131921))

(assert (=> b!115659 d!32499))

(declare-fun d!32501 () Bool)

(assert (=> d!32501 (= (validKeyInArray!0 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (and (not (= (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115688 d!32501))

(declare-fun d!32503 () Bool)

(declare-fun e!75635 () Bool)

(assert (=> d!32503 e!75635))

(declare-fun res!56820 () Bool)

(assert (=> d!32503 (=> res!56820 e!75635)))

(declare-fun lt!60178 () Bool)

(assert (=> d!32503 (= res!56820 (not lt!60178))))

(declare-fun lt!60179 () Bool)

(assert (=> d!32503 (= lt!60178 lt!60179)))

(declare-fun lt!60181 () Unit!3588)

(declare-fun e!75636 () Unit!3588)

(assert (=> d!32503 (= lt!60181 e!75636)))

(declare-fun c!20570 () Bool)

(assert (=> d!32503 (= c!20570 lt!60179)))

(assert (=> d!32503 (= lt!60179 (containsKey!164 (toList!820 lt!59996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32503 (= (contains!850 lt!59996 #b1000000000000000000000000000000000000000000000000000000000000000) lt!60178)))

(declare-fun b!115900 () Bool)

(declare-fun lt!60180 () Unit!3588)

(assert (=> b!115900 (= e!75636 lt!60180)))

(assert (=> b!115900 (= lt!60180 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 lt!59996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115900 (isDefined!114 (getValueByKey!160 (toList!820 lt!59996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115901 () Bool)

(declare-fun Unit!3598 () Unit!3588)

(assert (=> b!115901 (= e!75636 Unit!3598)))

(declare-fun b!115902 () Bool)

(assert (=> b!115902 (= e!75635 (isDefined!114 (getValueByKey!160 (toList!820 lt!59996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32503 c!20570) b!115900))

(assert (= (and d!32503 (not c!20570)) b!115901))

(assert (= (and d!32503 (not res!56820)) b!115902))

(declare-fun m!131923 () Bool)

(assert (=> d!32503 m!131923))

(declare-fun m!131925 () Bool)

(assert (=> b!115900 m!131925))

(assert (=> b!115900 m!131715))

(assert (=> b!115900 m!131715))

(declare-fun m!131927 () Bool)

(assert (=> b!115900 m!131927))

(assert (=> b!115902 m!131715))

(assert (=> b!115902 m!131715))

(assert (=> b!115902 m!131927))

(assert (=> bm!12368 d!32503))

(declare-fun d!32505 () Bool)

(declare-fun e!75637 () Bool)

(assert (=> d!32505 e!75637))

(declare-fun res!56821 () Bool)

(assert (=> d!32505 (=> res!56821 e!75637)))

(declare-fun lt!60182 () Bool)

(assert (=> d!32505 (= res!56821 (not lt!60182))))

(declare-fun lt!60183 () Bool)

(assert (=> d!32505 (= lt!60182 lt!60183)))

(declare-fun lt!60185 () Unit!3588)

(declare-fun e!75638 () Unit!3588)

(assert (=> d!32505 (= lt!60185 e!75638)))

(declare-fun c!20571 () Bool)

(assert (=> d!32505 (= c!20571 lt!60183)))

(assert (=> d!32505 (= lt!60183 (containsKey!164 (toList!820 lt!59996) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32505 (= (contains!850 lt!59996 #b0000000000000000000000000000000000000000000000000000000000000000) lt!60182)))

(declare-fun b!115903 () Bool)

(declare-fun lt!60184 () Unit!3588)

(assert (=> b!115903 (= e!75638 lt!60184)))

(assert (=> b!115903 (= lt!60184 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 lt!59996) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115903 (isDefined!114 (getValueByKey!160 (toList!820 lt!59996) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115904 () Bool)

(declare-fun Unit!3599 () Unit!3588)

(assert (=> b!115904 (= e!75638 Unit!3599)))

(declare-fun b!115905 () Bool)

(assert (=> b!115905 (= e!75637 (isDefined!114 (getValueByKey!160 (toList!820 lt!59996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32505 c!20571) b!115903))

(assert (= (and d!32505 (not c!20571)) b!115904))

(assert (= (and d!32505 (not res!56821)) b!115905))

(declare-fun m!131929 () Bool)

(assert (=> d!32505 m!131929))

(declare-fun m!131931 () Bool)

(assert (=> b!115903 m!131931))

(assert (=> b!115903 m!131919))

(assert (=> b!115903 m!131919))

(declare-fun m!131933 () Bool)

(assert (=> b!115903 m!131933))

(assert (=> b!115905 m!131919))

(assert (=> b!115905 m!131919))

(assert (=> b!115905 m!131933))

(assert (=> bm!12367 d!32505))

(declare-fun d!32507 () Bool)

(assert (=> d!32507 (= (apply!104 lt!60018 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1398 (getValueByKey!160 (toList!820 lt!60018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4715 () Bool)

(assert (= bs!4715 d!32507))

(assert (=> bs!4715 m!131711))

(assert (=> bs!4715 m!131711))

(declare-fun m!131935 () Bool)

(assert (=> bs!4715 m!131935))

(assert (=> b!115689 d!32507))

(declare-fun d!32509 () Bool)

(declare-fun e!75639 () Bool)

(assert (=> d!32509 e!75639))

(declare-fun res!56822 () Bool)

(assert (=> d!32509 (=> res!56822 e!75639)))

(declare-fun lt!60186 () Bool)

(assert (=> d!32509 (= res!56822 (not lt!60186))))

(declare-fun lt!60187 () Bool)

(assert (=> d!32509 (= lt!60186 lt!60187)))

(declare-fun lt!60189 () Unit!3588)

(declare-fun e!75640 () Unit!3588)

(assert (=> d!32509 (= lt!60189 e!75640)))

(declare-fun c!20572 () Bool)

(assert (=> d!32509 (= c!20572 lt!60187)))

(assert (=> d!32509 (= lt!60187 (containsKey!164 (toList!820 lt!59996) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32509 (= (contains!850 lt!59996 (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!60186)))

(declare-fun b!115906 () Bool)

(declare-fun lt!60188 () Unit!3588)

(assert (=> b!115906 (= e!75640 lt!60188)))

(assert (=> b!115906 (= lt!60188 (lemmaContainsKeyImpliesGetValueByKeyDefined!113 (toList!820 lt!59996) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115906 (isDefined!114 (getValueByKey!160 (toList!820 lt!59996) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115907 () Bool)

(declare-fun Unit!3600 () Unit!3588)

(assert (=> b!115907 (= e!75640 Unit!3600)))

(declare-fun b!115908 () Bool)

(assert (=> b!115908 (= e!75639 (isDefined!114 (getValueByKey!160 (toList!820 lt!59996) (select (arr!2146 (_keys!4427 (v!3024 (underlying!402 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32509 c!20572) b!115906))

(assert (= (and d!32509 (not c!20572)) b!115907))

(assert (= (and d!32509 (not res!56822)) b!115908))

(assert (=> d!32509 m!131401))

(declare-fun m!131937 () Bool)

(assert (=> d!32509 m!131937))

(assert (=> b!115906 m!131401))

(declare-fun m!131939 () Bool)

(assert (=> b!115906 m!131939))

(assert (=> b!115906 m!131401))

(assert (=> b!115906 m!131627))

(assert (=> b!115906 m!131627))

(declare-fun m!131941 () Bool)

(assert (=> b!115906 m!131941))

(assert (=> b!115908 m!131401))

(assert (=> b!115908 m!131627))

(assert (=> b!115908 m!131627))

(assert (=> b!115908 m!131941))

(assert (=> b!115660 d!32509))

(assert (=> b!115690 d!32501))

(declare-fun mapNonEmpty!4269 () Bool)

(declare-fun mapRes!4269 () Bool)

(declare-fun tp!10533 () Bool)

(declare-fun e!75641 () Bool)

(assert (=> mapNonEmpty!4269 (= mapRes!4269 (and tp!10533 e!75641))))

(declare-fun mapRest!4269 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapValue!4269 () ValueCell!1043)

(declare-fun mapKey!4269 () (_ BitVec 32))

(assert (=> mapNonEmpty!4269 (= mapRest!4267 (store mapRest!4269 mapKey!4269 mapValue!4269))))

(declare-fun b!115909 () Bool)

(assert (=> b!115909 (= e!75641 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4269 () Bool)

(assert (=> mapIsEmpty!4269 mapRes!4269))

(declare-fun condMapEmpty!4269 () Bool)

(declare-fun mapDefault!4269 () ValueCell!1043)

(assert (=> mapNonEmpty!4267 (= condMapEmpty!4269 (= mapRest!4267 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4269)))))

(declare-fun e!75642 () Bool)

(assert (=> mapNonEmpty!4267 (= tp!10531 (and e!75642 mapRes!4269))))

(declare-fun b!115910 () Bool)

(assert (=> b!115910 (= e!75642 tp_is_empty!2773)))

(assert (= (and mapNonEmpty!4267 condMapEmpty!4269) mapIsEmpty!4269))

(assert (= (and mapNonEmpty!4267 (not condMapEmpty!4269)) mapNonEmpty!4269))

(assert (= (and mapNonEmpty!4269 ((_ is ValueCellFull!1043) mapValue!4269)) b!115909))

(assert (= (and mapNonEmpty!4267 ((_ is ValueCellFull!1043) mapDefault!4269)) b!115910))

(declare-fun m!131943 () Bool)

(assert (=> mapNonEmpty!4269 m!131943))

(declare-fun mapNonEmpty!4270 () Bool)

(declare-fun mapRes!4270 () Bool)

(declare-fun tp!10534 () Bool)

(declare-fun e!75643 () Bool)

(assert (=> mapNonEmpty!4270 (= mapRes!4270 (and tp!10534 e!75643))))

(declare-fun mapRest!4270 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapValue!4270 () ValueCell!1043)

(declare-fun mapKey!4270 () (_ BitVec 32))

(assert (=> mapNonEmpty!4270 (= mapRest!4268 (store mapRest!4270 mapKey!4270 mapValue!4270))))

(declare-fun b!115911 () Bool)

(assert (=> b!115911 (= e!75643 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4270 () Bool)

(assert (=> mapIsEmpty!4270 mapRes!4270))

(declare-fun condMapEmpty!4270 () Bool)

(declare-fun mapDefault!4270 () ValueCell!1043)

(assert (=> mapNonEmpty!4268 (= condMapEmpty!4270 (= mapRest!4268 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4270)))))

(declare-fun e!75644 () Bool)

(assert (=> mapNonEmpty!4268 (= tp!10532 (and e!75644 mapRes!4270))))

(declare-fun b!115912 () Bool)

(assert (=> b!115912 (= e!75644 tp_is_empty!2773)))

(assert (= (and mapNonEmpty!4268 condMapEmpty!4270) mapIsEmpty!4270))

(assert (= (and mapNonEmpty!4268 (not condMapEmpty!4270)) mapNonEmpty!4270))

(assert (= (and mapNonEmpty!4270 ((_ is ValueCellFull!1043) mapValue!4270)) b!115911))

(assert (= (and mapNonEmpty!4268 ((_ is ValueCellFull!1043) mapDefault!4270)) b!115912))

(declare-fun m!131945 () Bool)

(assert (=> mapNonEmpty!4270 m!131945))

(declare-fun b_lambda!5151 () Bool)

(assert (= b_lambda!5145 (or (and b!115511 b_free!2713) (and b!115505 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))) b_lambda!5151)))

(declare-fun b_lambda!5153 () Bool)

(assert (= b_lambda!5141 (or (and b!115511 b_free!2713) (and b!115505 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))) b_lambda!5153)))

(declare-fun b_lambda!5155 () Bool)

(assert (= b_lambda!5149 (or (and b!115511 b_free!2713 (= (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))) (defaultEntry!2706 newMap!16))) (and b!115505 b_free!2715) b_lambda!5155)))

(declare-fun b_lambda!5157 () Bool)

(assert (= b_lambda!5143 (or (and b!115511 b_free!2713) (and b!115505 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))) b_lambda!5157)))

(declare-fun b_lambda!5159 () Bool)

(assert (= b_lambda!5147 (or (and b!115511 b_free!2713) (and b!115505 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3024 (underlying!402 thiss!992))))) b_lambda!5159)))

(check-sat (not b!115721) (not d!32459) (not b!115848) (not b!115902) (not b!115767) (not b!115825) (not d!32399) (not bm!12389) (not b!115789) (not b!115841) (not b!115796) (not d!32507) (not d!32435) (not d!32457) (not b_lambda!5139) (not b!115826) (not b!115729) (not d!32415) (not d!32453) (not b!115780) (not b!115791) (not b!115801) (not d!32401) (not b!115859) (not d!32433) (not b!115834) (not b!115898) (not d!32417) (not b!115762) (not b_lambda!5155) (not b!115786) (not d!32397) (not b_lambda!5157) (not b!115858) (not b!115734) (not bm!12382) (not b!115781) (not b!115723) (not d!32477) (not d!32421) (not b!115799) tp_is_empty!2773 (not d!32403) (not b!115732) (not d!32423) (not b!115896) (not b!115761) (not b!115728) (not b!115788) (not d!32473) (not b!115779) (not b!115793) (not d!32497) (not b!115833) (not b!115831) (not d!32395) (not b!115828) (not d!32455) (not b!115908) b_and!7205 (not b_lambda!5151) (not d!32479) (not b!115850) (not b!115764) (not b!115733) (not d!32509) (not b_lambda!5159) (not d!32505) (not b!115840) (not b!115766) (not b!115817) (not b_next!2715) (not b_next!2713) (not b!115798) (not b!115899) (not d!32485) (not b!115797) (not b!115772) (not b!115827) (not b!115815) (not d!32407) (not d!32483) b_and!7207 (not b!115778) (not b!115847) (not bm!12393) (not b!115843) (not b!115906) (not d!32475) (not b!115784) (not b!115820) (not d!32503) (not b!115816) (not d!32431) (not d!32471) (not b!115822) (not d!32419) (not d!32429) (not b!115773) (not b!115903) (not d!32467) (not b!115895) (not d!32451) (not b!115768) (not bm!12386) (not b!115869) (not d!32461) (not b!115870) (not d!32449) (not b!115783) (not d!32405) (not d!32481) (not b!115771) (not bm!12383) (not bm!12388) (not b!115900) (not b!115782) (not d!32445) (not d!32425) (not b!115829) (not b!115812) (not b!115873) (not b!115763) (not d!32469) (not bm!12387) (not bm!12399) (not mapNonEmpty!4270) (not d!32499) (not b!115787) (not b!115846) (not b!115872) (not d!32439) (not b!115885) (not b_lambda!5137) (not b_lambda!5153) (not d!32393) (not d!32409) (not d!32463) (not d!32491) (not b!115792) (not d!32437) (not b!115853) (not b!115735) (not b!115905) (not d!32413) (not d!32495) (not b!115832) (not bm!12396) (not mapNonEmpty!4269) (not b!115823) (not d!32465) (not b!115819) (not d!32411))
(check-sat b_and!7205 b_and!7207 (not b_next!2713) (not b_next!2715))
