; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13156 () Bool)

(assert start!13156)

(declare-fun b!115540 () Bool)

(declare-fun b_free!2713 () Bool)

(declare-fun b_next!2713 () Bool)

(assert (=> b!115540 (= b_free!2713 (not b_next!2713))))

(declare-fun tp!10502 () Bool)

(declare-fun b_and!7177 () Bool)

(assert (=> b!115540 (= tp!10502 b_and!7177)))

(declare-fun b!115550 () Bool)

(declare-fun b_free!2715 () Bool)

(declare-fun b_next!2715 () Bool)

(assert (=> b!115550 (= b_free!2715 (not b_next!2715))))

(declare-fun tp!10503 () Bool)

(declare-fun b_and!7179 () Bool)

(assert (=> b!115550 (= tp!10503 b_and!7179)))

(declare-fun b!115536 () Bool)

(declare-fun res!56670 () Bool)

(declare-fun e!75399 () Bool)

(assert (=> b!115536 (=> (not res!56670) (not e!75399))))

(declare-datatypes ((V!3345 0))(
  ( (V!3346 (val!1431 Int)) )
))
(declare-datatypes ((array!4535 0))(
  ( (array!4536 (arr!2150 (Array (_ BitVec 32) (_ BitVec 64))) (size!2410 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1043 0))(
  ( (ValueCellFull!1043 (v!3032 V!3345)) (EmptyCell!1043) )
))
(declare-datatypes ((array!4537 0))(
  ( (array!4538 (arr!2151 (Array (_ BitVec 32) ValueCell!1043)) (size!2411 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!994 0))(
  ( (LongMapFixedSize!995 (defaultEntry!2706 Int) (mask!6916 (_ BitVec 32)) (extraKeys!2495 (_ BitVec 32)) (zeroValue!2573 V!3345) (minValue!2573 V!3345) (_size!546 (_ BitVec 32)) (_keys!4428 array!4535) (_values!2689 array!4537) (_vacant!546 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!994)

(declare-datatypes ((Cell!794 0))(
  ( (Cell!795 (v!3033 LongMapFixedSize!994)) )
))
(declare-datatypes ((LongMap!794 0))(
  ( (LongMap!795 (underlying!408 Cell!794)) )
))
(declare-fun thiss!992 () LongMap!794)

(assert (=> b!115536 (= res!56670 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6916 newMap!16)) (_size!546 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun e!75391 () Bool)

(declare-datatypes ((tuple2!2470 0))(
  ( (tuple2!2471 (_1!1246 (_ BitVec 64)) (_2!1246 V!3345)) )
))
(declare-datatypes ((List!1651 0))(
  ( (Nil!1648) (Cons!1647 (h!2247 tuple2!2470) (t!5901 List!1651)) )
))
(declare-datatypes ((ListLongMap!1597 0))(
  ( (ListLongMap!1598 (toList!814 List!1651)) )
))
(declare-fun lt!59961 () ListLongMap!1597)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun b!115537 () Bool)

(declare-fun getCurrentListMap!495 (array!4535 array!4537 (_ BitVec 32) (_ BitVec 32) V!3345 V!3345 (_ BitVec 32) Int) ListLongMap!1597)

(assert (=> b!115537 (= e!75391 (not (= (getCurrentListMap!495 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) lt!59961)))))

(declare-fun b!115538 () Bool)

(declare-fun res!56671 () Bool)

(assert (=> b!115538 (=> (not res!56671) (not e!75399))))

(declare-fun valid!477 (LongMapFixedSize!994) Bool)

(assert (=> b!115538 (= res!56671 (valid!477 newMap!16))))

(declare-fun res!56672 () Bool)

(assert (=> start!13156 (=> (not res!56672) (not e!75399))))

(declare-fun valid!478 (LongMap!794) Bool)

(assert (=> start!13156 (= res!56672 (valid!478 thiss!992))))

(assert (=> start!13156 e!75399))

(declare-fun e!75390 () Bool)

(assert (=> start!13156 e!75390))

(assert (=> start!13156 true))

(declare-fun e!75400 () Bool)

(assert (=> start!13156 e!75400))

(declare-fun b!115539 () Bool)

(declare-fun e!75395 () Bool)

(declare-fun tp_is_empty!2773 () Bool)

(assert (=> b!115539 (= e!75395 tp_is_empty!2773)))

(declare-fun mapNonEmpty!4251 () Bool)

(declare-fun mapRes!4252 () Bool)

(declare-fun tp!10501 () Bool)

(assert (=> mapNonEmpty!4251 (= mapRes!4252 (and tp!10501 e!75395))))

(declare-fun mapKey!4251 () (_ BitVec 32))

(declare-fun mapValue!4251 () ValueCell!1043)

(declare-fun mapRest!4251 () (Array (_ BitVec 32) ValueCell!1043))

(assert (=> mapNonEmpty!4251 (= (arr!2151 (_values!2689 newMap!16)) (store mapRest!4251 mapKey!4251 mapValue!4251))))

(declare-fun e!75396 () Bool)

(declare-fun e!75401 () Bool)

(declare-fun array_inv!1341 (array!4535) Bool)

(declare-fun array_inv!1342 (array!4537) Bool)

(assert (=> b!115540 (= e!75396 (and tp!10502 tp_is_empty!2773 (array_inv!1341 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (array_inv!1342 (_values!2689 (v!3033 (underlying!408 thiss!992)))) e!75401))))

(declare-fun mapIsEmpty!4251 () Bool)

(declare-fun mapRes!4251 () Bool)

(assert (=> mapIsEmpty!4251 mapRes!4251))

(declare-fun b!115541 () Bool)

(declare-fun e!75393 () Bool)

(assert (=> b!115541 (= e!75393 tp_is_empty!2773)))

(declare-fun b!115542 () Bool)

(declare-fun res!56668 () Bool)

(assert (=> b!115542 (=> (not res!56668) (not e!75399))))

(assert (=> b!115542 (= res!56668 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun b!115543 () Bool)

(declare-fun e!75388 () Bool)

(assert (=> b!115543 (= e!75388 tp_is_empty!2773)))

(declare-fun b!115544 () Bool)

(declare-fun e!75394 () Bool)

(assert (=> b!115544 (= e!75390 e!75394)))

(declare-fun b!115545 () Bool)

(assert (=> b!115545 (= e!75394 e!75396)))

(declare-fun b!115546 () Bool)

(assert (=> b!115546 (= e!75399 e!75391)))

(declare-fun res!56669 () Bool)

(assert (=> b!115546 (=> (not res!56669) (not e!75391))))

(declare-fun lt!59960 () ListLongMap!1597)

(assert (=> b!115546 (= res!56669 (and (= lt!59960 lt!59961) (or (= (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun map!1341 (LongMapFixedSize!994) ListLongMap!1597)

(assert (=> b!115546 (= lt!59961 (map!1341 newMap!16))))

(assert (=> b!115546 (= lt!59960 (getCurrentListMap!495 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115547 () Bool)

(declare-fun e!75392 () Bool)

(assert (=> b!115547 (= e!75392 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4252 () Bool)

(assert (=> mapIsEmpty!4252 mapRes!4252))

(declare-fun b!115548 () Bool)

(declare-fun e!75398 () Bool)

(assert (=> b!115548 (= e!75398 (and e!75393 mapRes!4252))))

(declare-fun condMapEmpty!4251 () Bool)

(declare-fun mapDefault!4252 () ValueCell!1043)

(assert (=> b!115548 (= condMapEmpty!4251 (= (arr!2151 (_values!2689 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4252)))))

(declare-fun b!115549 () Bool)

(assert (=> b!115549 (= e!75401 (and e!75388 mapRes!4251))))

(declare-fun condMapEmpty!4252 () Bool)

(declare-fun mapDefault!4251 () ValueCell!1043)

(assert (=> b!115549 (= condMapEmpty!4252 (= (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4251)))))

(assert (=> b!115550 (= e!75400 (and tp!10503 tp_is_empty!2773 (array_inv!1341 (_keys!4428 newMap!16)) (array_inv!1342 (_values!2689 newMap!16)) e!75398))))

(declare-fun mapNonEmpty!4252 () Bool)

(declare-fun tp!10504 () Bool)

(assert (=> mapNonEmpty!4252 (= mapRes!4251 (and tp!10504 e!75392))))

(declare-fun mapRest!4252 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapValue!4252 () ValueCell!1043)

(declare-fun mapKey!4252 () (_ BitVec 32))

(assert (=> mapNonEmpty!4252 (= (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (store mapRest!4252 mapKey!4252 mapValue!4252))))

(assert (= (and start!13156 res!56672) b!115542))

(assert (= (and b!115542 res!56668) b!115538))

(assert (= (and b!115538 res!56671) b!115536))

(assert (= (and b!115536 res!56670) b!115546))

(assert (= (and b!115546 res!56669) b!115537))

(assert (= (and b!115549 condMapEmpty!4252) mapIsEmpty!4251))

(assert (= (and b!115549 (not condMapEmpty!4252)) mapNonEmpty!4252))

(get-info :version)

(assert (= (and mapNonEmpty!4252 ((_ is ValueCellFull!1043) mapValue!4252)) b!115547))

(assert (= (and b!115549 ((_ is ValueCellFull!1043) mapDefault!4251)) b!115543))

(assert (= b!115540 b!115549))

(assert (= b!115545 b!115540))

(assert (= b!115544 b!115545))

(assert (= start!13156 b!115544))

(assert (= (and b!115548 condMapEmpty!4251) mapIsEmpty!4252))

(assert (= (and b!115548 (not condMapEmpty!4251)) mapNonEmpty!4251))

(assert (= (and mapNonEmpty!4251 ((_ is ValueCellFull!1043) mapValue!4251)) b!115539))

(assert (= (and b!115548 ((_ is ValueCellFull!1043) mapDefault!4252)) b!115541))

(assert (= b!115550 b!115548))

(assert (= start!13156 b!115550))

(declare-fun m!131469 () Bool)

(assert (=> b!115540 m!131469))

(declare-fun m!131471 () Bool)

(assert (=> b!115540 m!131471))

(declare-fun m!131473 () Bool)

(assert (=> mapNonEmpty!4252 m!131473))

(declare-fun m!131475 () Bool)

(assert (=> mapNonEmpty!4251 m!131475))

(declare-fun m!131477 () Bool)

(assert (=> start!13156 m!131477))

(declare-fun m!131479 () Bool)

(assert (=> b!115550 m!131479))

(declare-fun m!131481 () Bool)

(assert (=> b!115550 m!131481))

(declare-fun m!131483 () Bool)

(assert (=> b!115537 m!131483))

(declare-fun m!131485 () Bool)

(assert (=> b!115538 m!131485))

(declare-fun m!131487 () Bool)

(assert (=> b!115546 m!131487))

(declare-fun m!131489 () Bool)

(assert (=> b!115546 m!131489))

(declare-fun m!131491 () Bool)

(assert (=> b!115546 m!131491))

(check-sat (not b_next!2715) (not b!115538) tp_is_empty!2773 (not b!115540) (not b!115550) b_and!7177 (not mapNonEmpty!4252) (not b_next!2713) (not b!115537) (not start!13156) (not b!115546) b_and!7179 (not mapNonEmpty!4251))
(check-sat b_and!7177 b_and!7179 (not b_next!2713) (not b_next!2715))
(get-model)

(declare-fun d!32435 () Bool)

(assert (=> d!32435 (= (valid!478 thiss!992) (valid!477 (v!3033 (underlying!408 thiss!992))))))

(declare-fun bs!4706 () Bool)

(assert (= bs!4706 d!32435))

(declare-fun m!131541 () Bool)

(assert (=> bs!4706 m!131541))

(assert (=> start!13156 d!32435))

(declare-fun d!32437 () Bool)

(declare-fun res!56709 () Bool)

(declare-fun e!75488 () Bool)

(assert (=> d!32437 (=> (not res!56709) (not e!75488))))

(declare-fun simpleValid!80 (LongMapFixedSize!994) Bool)

(assert (=> d!32437 (= res!56709 (simpleValid!80 newMap!16))))

(assert (=> d!32437 (= (valid!477 newMap!16) e!75488)))

(declare-fun b!115647 () Bool)

(declare-fun res!56710 () Bool)

(assert (=> b!115647 (=> (not res!56710) (not e!75488))))

(declare-fun arrayCountValidKeys!0 (array!4535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!115647 (= res!56710 (= (arrayCountValidKeys!0 (_keys!4428 newMap!16) #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))) (_size!546 newMap!16)))))

(declare-fun b!115648 () Bool)

(declare-fun res!56711 () Bool)

(assert (=> b!115648 (=> (not res!56711) (not e!75488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4535 (_ BitVec 32)) Bool)

(assert (=> b!115648 (= res!56711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4428 newMap!16) (mask!6916 newMap!16)))))

(declare-fun b!115649 () Bool)

(declare-datatypes ((List!1653 0))(
  ( (Nil!1650) (Cons!1649 (h!2249 (_ BitVec 64)) (t!5907 List!1653)) )
))
(declare-fun arrayNoDuplicates!0 (array!4535 (_ BitVec 32) List!1653) Bool)

(assert (=> b!115649 (= e!75488 (arrayNoDuplicates!0 (_keys!4428 newMap!16) #b00000000000000000000000000000000 Nil!1650))))

(assert (= (and d!32437 res!56709) b!115647))

(assert (= (and b!115647 res!56710) b!115648))

(assert (= (and b!115648 res!56711) b!115649))

(declare-fun m!131543 () Bool)

(assert (=> d!32437 m!131543))

(declare-fun m!131545 () Bool)

(assert (=> b!115647 m!131545))

(declare-fun m!131547 () Bool)

(assert (=> b!115648 m!131547))

(declare-fun m!131549 () Bool)

(assert (=> b!115649 m!131549))

(assert (=> b!115538 d!32437))

(declare-fun d!32439 () Bool)

(assert (=> d!32439 (= (array_inv!1341 (_keys!4428 newMap!16)) (bvsge (size!2410 (_keys!4428 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115550 d!32439))

(declare-fun d!32441 () Bool)

(assert (=> d!32441 (= (array_inv!1342 (_values!2689 newMap!16)) (bvsge (size!2411 (_values!2689 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115550 d!32441))

(declare-fun b!115692 () Bool)

(declare-fun e!75524 () Bool)

(declare-fun lt!60029 () ListLongMap!1597)

(declare-fun apply!104 (ListLongMap!1597 (_ BitVec 64)) V!3345)

(assert (=> b!115692 (= e!75524 (= (apply!104 lt!60029 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun e!75520 () Bool)

(declare-fun b!115693 () Bool)

(declare-fun get!1408 (ValueCell!1043 V!3345) V!3345)

(declare-fun dynLambda!408 (Int (_ BitVec 64)) V!3345)

(assert (=> b!115693 (= e!75520 (= (apply!104 lt!60029 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115693 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2411 (_values!2689 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115693 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun bm!12361 () Bool)

(declare-fun call!12368 () ListLongMap!1597)

(declare-fun call!12366 () ListLongMap!1597)

(assert (=> bm!12361 (= call!12368 call!12366)))

(declare-fun b!115694 () Bool)

(declare-fun e!75523 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!115694 (= e!75523 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115695 () Bool)

(declare-datatypes ((Unit!3583 0))(
  ( (Unit!3584) )
))
(declare-fun e!75526 () Unit!3583)

(declare-fun Unit!3585 () Unit!3583)

(assert (=> b!115695 (= e!75526 Unit!3585)))

(declare-fun b!115696 () Bool)

(declare-fun e!75516 () Bool)

(assert (=> b!115696 (= e!75516 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115697 () Bool)

(declare-fun e!75527 () Bool)

(declare-fun call!12364 () Bool)

(assert (=> b!115697 (= e!75527 (not call!12364))))

(declare-fun b!115698 () Bool)

(declare-fun c!20520 () Bool)

(assert (=> b!115698 (= c!20520 (and (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75517 () ListLongMap!1597)

(declare-fun e!75515 () ListLongMap!1597)

(assert (=> b!115698 (= e!75517 e!75515)))

(declare-fun b!115699 () Bool)

(declare-fun e!75525 () Bool)

(assert (=> b!115699 (= e!75525 e!75527)))

(declare-fun c!20521 () Bool)

(assert (=> b!115699 (= c!20521 (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115700 () Bool)

(declare-fun res!56737 () Bool)

(assert (=> b!115700 (=> (not res!56737) (not e!75525))))

(declare-fun e!75522 () Bool)

(assert (=> b!115700 (= res!56737 e!75522)))

(declare-fun c!20523 () Bool)

(assert (=> b!115700 (= c!20523 (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!115702 () Bool)

(declare-fun lt!60037 () Unit!3583)

(assert (=> b!115702 (= e!75526 lt!60037)))

(declare-fun lt!60035 () ListLongMap!1597)

(declare-fun getCurrentListMapNoExtraKeys!124 (array!4535 array!4537 (_ BitVec 32) (_ BitVec 32) V!3345 V!3345 (_ BitVec 32) Int) ListLongMap!1597)

(assert (=> b!115702 (= lt!60035 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60025 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60026 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60026 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60019 () Unit!3583)

(declare-fun addStillContains!80 (ListLongMap!1597 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3583)

(assert (=> b!115702 (= lt!60019 (addStillContains!80 lt!60035 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60026))))

(declare-fun contains!848 (ListLongMap!1597 (_ BitVec 64)) Bool)

(declare-fun +!157 (ListLongMap!1597 tuple2!2470) ListLongMap!1597)

(assert (=> b!115702 (contains!848 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60026)))

(declare-fun lt!60031 () Unit!3583)

(assert (=> b!115702 (= lt!60031 lt!60019)))

(declare-fun lt!60033 () ListLongMap!1597)

(assert (=> b!115702 (= lt!60033 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60038 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60038 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60020 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60020 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60036 () Unit!3583)

(declare-fun addApplyDifferent!80 (ListLongMap!1597 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3583)

(assert (=> b!115702 (= lt!60036 (addApplyDifferent!80 lt!60033 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60020))))

(assert (=> b!115702 (= (apply!104 (+!157 lt!60033 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60020) (apply!104 lt!60033 lt!60020))))

(declare-fun lt!60039 () Unit!3583)

(assert (=> b!115702 (= lt!60039 lt!60036)))

(declare-fun lt!60030 () ListLongMap!1597)

(assert (=> b!115702 (= lt!60030 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60021 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60024 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60024 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60022 () Unit!3583)

(assert (=> b!115702 (= lt!60022 (addApplyDifferent!80 lt!60030 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60024))))

(assert (=> b!115702 (= (apply!104 (+!157 lt!60030 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60024) (apply!104 lt!60030 lt!60024))))

(declare-fun lt!60023 () Unit!3583)

(assert (=> b!115702 (= lt!60023 lt!60022)))

(declare-fun lt!60028 () ListLongMap!1597)

(assert (=> b!115702 (= lt!60028 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60018 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60018 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60027 () (_ BitVec 64))

(assert (=> b!115702 (= lt!60027 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(assert (=> b!115702 (= lt!60037 (addApplyDifferent!80 lt!60028 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60027))))

(assert (=> b!115702 (= (apply!104 (+!157 lt!60028 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60027) (apply!104 lt!60028 lt!60027))))

(declare-fun b!115703 () Bool)

(assert (=> b!115703 (= e!75515 call!12368)))

(declare-fun b!115704 () Bool)

(declare-fun e!75518 () Bool)

(assert (=> b!115704 (= e!75518 e!75520)))

(declare-fun res!56734 () Bool)

(assert (=> b!115704 (=> (not res!56734) (not e!75520))))

(assert (=> b!115704 (= res!56734 (contains!848 lt!60029 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115704 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115705 () Bool)

(assert (=> b!115705 (= e!75527 e!75524)))

(declare-fun res!56738 () Bool)

(assert (=> b!115705 (= res!56738 call!12364)))

(assert (=> b!115705 (=> (not res!56738) (not e!75524))))

(declare-fun bm!12362 () Bool)

(assert (=> bm!12362 (= call!12364 (contains!848 lt!60029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115706 () Bool)

(declare-fun call!12367 () Bool)

(assert (=> b!115706 (= e!75522 (not call!12367))))

(declare-fun bm!12363 () Bool)

(declare-fun call!12369 () ListLongMap!1597)

(assert (=> bm!12363 (= call!12366 call!12369)))

(declare-fun bm!12364 () Bool)

(assert (=> bm!12364 (= call!12369 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun d!32443 () Bool)

(assert (=> d!32443 e!75525))

(declare-fun res!56736 () Bool)

(assert (=> d!32443 (=> (not res!56736) (not e!75525))))

(assert (=> d!32443 (= res!56736 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60032 () ListLongMap!1597)

(assert (=> d!32443 (= lt!60029 lt!60032)))

(declare-fun lt!60034 () Unit!3583)

(assert (=> d!32443 (= lt!60034 e!75526)))

(declare-fun c!20518 () Bool)

(assert (=> d!32443 (= c!20518 e!75523)))

(declare-fun res!56731 () Bool)

(assert (=> d!32443 (=> (not res!56731) (not e!75523))))

(assert (=> d!32443 (= res!56731 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun e!75521 () ListLongMap!1597)

(assert (=> d!32443 (= lt!60032 e!75521)))

(declare-fun c!20522 () Bool)

(assert (=> d!32443 (= c!20522 (and (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32443 (validMask!0 (mask!6916 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32443 (= (getCurrentListMap!495 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) lt!60029)))

(declare-fun b!115701 () Bool)

(declare-fun e!75519 () Bool)

(assert (=> b!115701 (= e!75522 e!75519)))

(declare-fun res!56730 () Bool)

(assert (=> b!115701 (= res!56730 call!12367)))

(assert (=> b!115701 (=> (not res!56730) (not e!75519))))

(declare-fun b!115707 () Bool)

(declare-fun call!12365 () ListLongMap!1597)

(assert (=> b!115707 (= e!75517 call!12365)))

(declare-fun bm!12365 () Bool)

(declare-fun call!12370 () ListLongMap!1597)

(assert (=> bm!12365 (= call!12365 call!12370)))

(declare-fun b!115708 () Bool)

(declare-fun res!56732 () Bool)

(assert (=> b!115708 (=> (not res!56732) (not e!75525))))

(assert (=> b!115708 (= res!56732 e!75518)))

(declare-fun res!56735 () Bool)

(assert (=> b!115708 (=> res!56735 e!75518)))

(assert (=> b!115708 (= res!56735 (not e!75516))))

(declare-fun res!56733 () Bool)

(assert (=> b!115708 (=> (not res!56733) (not e!75516))))

(assert (=> b!115708 (= res!56733 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun c!20519 () Bool)

(declare-fun bm!12366 () Bool)

(assert (=> bm!12366 (= call!12370 (+!157 (ite c!20522 call!12369 (ite c!20519 call!12366 call!12368)) (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun b!115709 () Bool)

(assert (=> b!115709 (= e!75519 (= (apply!104 lt!60029 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115710 () Bool)

(assert (=> b!115710 (= e!75515 call!12365)))

(declare-fun b!115711 () Bool)

(assert (=> b!115711 (= e!75521 (+!157 call!12370 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115712 () Bool)

(assert (=> b!115712 (= e!75521 e!75517)))

(assert (=> b!115712 (= c!20519 (and (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12367 () Bool)

(assert (=> bm!12367 (= call!12367 (contains!848 lt!60029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!32443 c!20522) b!115711))

(assert (= (and d!32443 (not c!20522)) b!115712))

(assert (= (and b!115712 c!20519) b!115707))

(assert (= (and b!115712 (not c!20519)) b!115698))

(assert (= (and b!115698 c!20520) b!115710))

(assert (= (and b!115698 (not c!20520)) b!115703))

(assert (= (or b!115710 b!115703) bm!12361))

(assert (= (or b!115707 bm!12361) bm!12363))

(assert (= (or b!115707 b!115710) bm!12365))

(assert (= (or b!115711 bm!12363) bm!12364))

(assert (= (or b!115711 bm!12365) bm!12366))

(assert (= (and d!32443 res!56731) b!115694))

(assert (= (and d!32443 c!20518) b!115702))

(assert (= (and d!32443 (not c!20518)) b!115695))

(assert (= (and d!32443 res!56736) b!115708))

(assert (= (and b!115708 res!56733) b!115696))

(assert (= (and b!115708 (not res!56735)) b!115704))

(assert (= (and b!115704 res!56734) b!115693))

(assert (= (and b!115708 res!56732) b!115700))

(assert (= (and b!115700 c!20523) b!115701))

(assert (= (and b!115700 (not c!20523)) b!115706))

(assert (= (and b!115701 res!56730) b!115709))

(assert (= (or b!115701 b!115706) bm!12367))

(assert (= (and b!115700 res!56737) b!115699))

(assert (= (and b!115699 c!20521) b!115705))

(assert (= (and b!115699 (not c!20521)) b!115697))

(assert (= (and b!115705 res!56738) b!115692))

(assert (= (or b!115705 b!115697) bm!12362))

(declare-fun b_lambda!5141 () Bool)

(assert (=> (not b_lambda!5141) (not b!115693)))

(declare-fun t!5904 () Bool)

(declare-fun tb!2217 () Bool)

(assert (=> (and b!115540 (= (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) t!5904) tb!2217))

(declare-fun result!3699 () Bool)

(assert (=> tb!2217 (= result!3699 tp_is_empty!2773)))

(assert (=> b!115693 t!5904))

(declare-fun b_and!7189 () Bool)

(assert (= b_and!7177 (and (=> t!5904 result!3699) b_and!7189)))

(declare-fun tb!2219 () Bool)

(declare-fun t!5906 () Bool)

(assert (=> (and b!115550 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) t!5906) tb!2219))

(declare-fun result!3703 () Bool)

(assert (= result!3703 result!3699))

(assert (=> b!115693 t!5906))

(declare-fun b_and!7191 () Bool)

(assert (= b_and!7179 (and (=> t!5906 result!3703) b_and!7191)))

(declare-fun m!131551 () Bool)

(assert (=> bm!12367 m!131551))

(declare-fun m!131553 () Bool)

(assert (=> bm!12366 m!131553))

(declare-fun m!131555 () Bool)

(assert (=> b!115702 m!131555))

(declare-fun m!131557 () Bool)

(assert (=> b!115702 m!131557))

(declare-fun m!131559 () Bool)

(assert (=> b!115702 m!131559))

(declare-fun m!131561 () Bool)

(assert (=> b!115702 m!131561))

(declare-fun m!131563 () Bool)

(assert (=> b!115702 m!131563))

(assert (=> b!115702 m!131557))

(declare-fun m!131565 () Bool)

(assert (=> b!115702 m!131565))

(declare-fun m!131567 () Bool)

(assert (=> b!115702 m!131567))

(declare-fun m!131569 () Bool)

(assert (=> b!115702 m!131569))

(declare-fun m!131571 () Bool)

(assert (=> b!115702 m!131571))

(declare-fun m!131573 () Bool)

(assert (=> b!115702 m!131573))

(declare-fun m!131575 () Bool)

(assert (=> b!115702 m!131575))

(declare-fun m!131577 () Bool)

(assert (=> b!115702 m!131577))

(assert (=> b!115702 m!131561))

(declare-fun m!131579 () Bool)

(assert (=> b!115702 m!131579))

(assert (=> b!115702 m!131573))

(declare-fun m!131581 () Bool)

(assert (=> b!115702 m!131581))

(assert (=> b!115702 m!131575))

(declare-fun m!131583 () Bool)

(assert (=> b!115702 m!131583))

(declare-fun m!131585 () Bool)

(assert (=> b!115702 m!131585))

(declare-fun m!131587 () Bool)

(assert (=> b!115702 m!131587))

(assert (=> b!115696 m!131555))

(assert (=> b!115696 m!131555))

(declare-fun m!131589 () Bool)

(assert (=> b!115696 m!131589))

(declare-fun m!131591 () Bool)

(assert (=> d!32443 m!131591))

(declare-fun m!131593 () Bool)

(assert (=> b!115692 m!131593))

(assert (=> bm!12364 m!131571))

(assert (=> b!115693 m!131555))

(declare-fun m!131595 () Bool)

(assert (=> b!115693 m!131595))

(declare-fun m!131597 () Bool)

(assert (=> b!115693 m!131597))

(assert (=> b!115693 m!131597))

(assert (=> b!115693 m!131595))

(declare-fun m!131599 () Bool)

(assert (=> b!115693 m!131599))

(assert (=> b!115693 m!131555))

(declare-fun m!131601 () Bool)

(assert (=> b!115693 m!131601))

(declare-fun m!131603 () Bool)

(assert (=> bm!12362 m!131603))

(assert (=> b!115694 m!131555))

(assert (=> b!115694 m!131555))

(assert (=> b!115694 m!131589))

(assert (=> b!115704 m!131555))

(assert (=> b!115704 m!131555))

(declare-fun m!131605 () Bool)

(assert (=> b!115704 m!131605))

(declare-fun m!131607 () Bool)

(assert (=> b!115709 m!131607))

(declare-fun m!131609 () Bool)

(assert (=> b!115711 m!131609))

(assert (=> b!115537 d!32443))

(declare-fun d!32445 () Bool)

(assert (=> d!32445 (= (map!1341 newMap!16) (getCurrentListMap!495 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun bs!4707 () Bool)

(assert (= bs!4707 d!32445))

(declare-fun m!131611 () Bool)

(assert (=> bs!4707 m!131611))

(assert (=> b!115546 d!32445))

(declare-fun b!115715 () Bool)

(declare-fun e!75537 () Bool)

(declare-fun lt!60051 () ListLongMap!1597)

(assert (=> b!115715 (= e!75537 (= (apply!104 lt!60051 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115716 () Bool)

(declare-fun e!75533 () Bool)

(assert (=> b!115716 (= e!75533 (= (apply!104 lt!60051 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115716 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2411 (_values!2689 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115716 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun bm!12368 () Bool)

(declare-fun call!12375 () ListLongMap!1597)

(declare-fun call!12373 () ListLongMap!1597)

(assert (=> bm!12368 (= call!12375 call!12373)))

(declare-fun b!115717 () Bool)

(declare-fun e!75536 () Bool)

(assert (=> b!115717 (= e!75536 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115718 () Bool)

(declare-fun e!75539 () Unit!3583)

(declare-fun Unit!3586 () Unit!3583)

(assert (=> b!115718 (= e!75539 Unit!3586)))

(declare-fun b!115719 () Bool)

(declare-fun e!75529 () Bool)

(assert (=> b!115719 (= e!75529 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115720 () Bool)

(declare-fun e!75540 () Bool)

(declare-fun call!12371 () Bool)

(assert (=> b!115720 (= e!75540 (not call!12371))))

(declare-fun b!115721 () Bool)

(declare-fun c!20526 () Bool)

(assert (=> b!115721 (= c!20526 (and (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75530 () ListLongMap!1597)

(declare-fun e!75528 () ListLongMap!1597)

(assert (=> b!115721 (= e!75530 e!75528)))

(declare-fun b!115722 () Bool)

(declare-fun e!75538 () Bool)

(assert (=> b!115722 (= e!75538 e!75540)))

(declare-fun c!20527 () Bool)

(assert (=> b!115722 (= c!20527 (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115723 () Bool)

(declare-fun res!56746 () Bool)

(assert (=> b!115723 (=> (not res!56746) (not e!75538))))

(declare-fun e!75535 () Bool)

(assert (=> b!115723 (= res!56746 e!75535)))

(declare-fun c!20529 () Bool)

(assert (=> b!115723 (= c!20529 (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!115725 () Bool)

(declare-fun lt!60059 () Unit!3583)

(assert (=> b!115725 (= e!75539 lt!60059)))

(declare-fun lt!60057 () ListLongMap!1597)

(assert (=> b!115725 (= lt!60057 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60047 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60048 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60048 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60041 () Unit!3583)

(assert (=> b!115725 (= lt!60041 (addStillContains!80 lt!60057 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60048))))

(assert (=> b!115725 (contains!848 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60048)))

(declare-fun lt!60053 () Unit!3583)

(assert (=> b!115725 (= lt!60053 lt!60041)))

(declare-fun lt!60055 () ListLongMap!1597)

(assert (=> b!115725 (= lt!60055 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60060 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60042 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60042 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60058 () Unit!3583)

(assert (=> b!115725 (= lt!60058 (addApplyDifferent!80 lt!60055 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60042))))

(assert (=> b!115725 (= (apply!104 (+!157 lt!60055 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60042) (apply!104 lt!60055 lt!60042))))

(declare-fun lt!60061 () Unit!3583)

(assert (=> b!115725 (= lt!60061 lt!60058)))

(declare-fun lt!60052 () ListLongMap!1597)

(assert (=> b!115725 (= lt!60052 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60043 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60046 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60046 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60044 () Unit!3583)

(assert (=> b!115725 (= lt!60044 (addApplyDifferent!80 lt!60052 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60046))))

(assert (=> b!115725 (= (apply!104 (+!157 lt!60052 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60046) (apply!104 lt!60052 lt!60046))))

(declare-fun lt!60045 () Unit!3583)

(assert (=> b!115725 (= lt!60045 lt!60044)))

(declare-fun lt!60050 () ListLongMap!1597)

(assert (=> b!115725 (= lt!60050 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60040 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60049 () (_ BitVec 64))

(assert (=> b!115725 (= lt!60049 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!115725 (= lt!60059 (addApplyDifferent!80 lt!60050 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60049))))

(assert (=> b!115725 (= (apply!104 (+!157 lt!60050 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60049) (apply!104 lt!60050 lt!60049))))

(declare-fun b!115726 () Bool)

(assert (=> b!115726 (= e!75528 call!12375)))

(declare-fun b!115727 () Bool)

(declare-fun e!75531 () Bool)

(assert (=> b!115727 (= e!75531 e!75533)))

(declare-fun res!56743 () Bool)

(assert (=> b!115727 (=> (not res!56743) (not e!75533))))

(assert (=> b!115727 (= res!56743 (contains!848 lt!60051 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115727 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115728 () Bool)

(assert (=> b!115728 (= e!75540 e!75537)))

(declare-fun res!56747 () Bool)

(assert (=> b!115728 (= res!56747 call!12371)))

(assert (=> b!115728 (=> (not res!56747) (not e!75537))))

(declare-fun bm!12369 () Bool)

(assert (=> bm!12369 (= call!12371 (contains!848 lt!60051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115729 () Bool)

(declare-fun call!12374 () Bool)

(assert (=> b!115729 (= e!75535 (not call!12374))))

(declare-fun bm!12370 () Bool)

(declare-fun call!12376 () ListLongMap!1597)

(assert (=> bm!12370 (= call!12373 call!12376)))

(declare-fun bm!12371 () Bool)

(assert (=> bm!12371 (= call!12376 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun d!32447 () Bool)

(assert (=> d!32447 e!75538))

(declare-fun res!56745 () Bool)

(assert (=> d!32447 (=> (not res!56745) (not e!75538))))

(assert (=> d!32447 (= res!56745 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60054 () ListLongMap!1597)

(assert (=> d!32447 (= lt!60051 lt!60054)))

(declare-fun lt!60056 () Unit!3583)

(assert (=> d!32447 (= lt!60056 e!75539)))

(declare-fun c!20524 () Bool)

(assert (=> d!32447 (= c!20524 e!75536)))

(declare-fun res!56740 () Bool)

(assert (=> d!32447 (=> (not res!56740) (not e!75536))))

(assert (=> d!32447 (= res!56740 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun e!75534 () ListLongMap!1597)

(assert (=> d!32447 (= lt!60054 e!75534)))

(declare-fun c!20528 () Bool)

(assert (=> d!32447 (= c!20528 (and (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32447 (validMask!0 (mask!6916 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32447 (= (getCurrentListMap!495 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) lt!60051)))

(declare-fun b!115724 () Bool)

(declare-fun e!75532 () Bool)

(assert (=> b!115724 (= e!75535 e!75532)))

(declare-fun res!56739 () Bool)

(assert (=> b!115724 (= res!56739 call!12374)))

(assert (=> b!115724 (=> (not res!56739) (not e!75532))))

(declare-fun b!115730 () Bool)

(declare-fun call!12372 () ListLongMap!1597)

(assert (=> b!115730 (= e!75530 call!12372)))

(declare-fun bm!12372 () Bool)

(declare-fun call!12377 () ListLongMap!1597)

(assert (=> bm!12372 (= call!12372 call!12377)))

(declare-fun b!115731 () Bool)

(declare-fun res!56741 () Bool)

(assert (=> b!115731 (=> (not res!56741) (not e!75538))))

(assert (=> b!115731 (= res!56741 e!75531)))

(declare-fun res!56744 () Bool)

(assert (=> b!115731 (=> res!56744 e!75531)))

(assert (=> b!115731 (= res!56744 (not e!75529))))

(declare-fun res!56742 () Bool)

(assert (=> b!115731 (=> (not res!56742) (not e!75529))))

(assert (=> b!115731 (= res!56742 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun bm!12373 () Bool)

(declare-fun c!20525 () Bool)

(assert (=> bm!12373 (= call!12377 (+!157 (ite c!20528 call!12376 (ite c!20525 call!12373 call!12375)) (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun b!115732 () Bool)

(assert (=> b!115732 (= e!75532 (= (apply!104 lt!60051 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115733 () Bool)

(assert (=> b!115733 (= e!75528 call!12372)))

(declare-fun b!115734 () Bool)

(assert (=> b!115734 (= e!75534 (+!157 call!12377 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115735 () Bool)

(assert (=> b!115735 (= e!75534 e!75530)))

(assert (=> b!115735 (= c!20525 (and (not (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12374 () Bool)

(assert (=> bm!12374 (= call!12374 (contains!848 lt!60051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!32447 c!20528) b!115734))

(assert (= (and d!32447 (not c!20528)) b!115735))

(assert (= (and b!115735 c!20525) b!115730))

(assert (= (and b!115735 (not c!20525)) b!115721))

(assert (= (and b!115721 c!20526) b!115733))

(assert (= (and b!115721 (not c!20526)) b!115726))

(assert (= (or b!115733 b!115726) bm!12368))

(assert (= (or b!115730 bm!12368) bm!12370))

(assert (= (or b!115730 b!115733) bm!12372))

(assert (= (or b!115734 bm!12370) bm!12371))

(assert (= (or b!115734 bm!12372) bm!12373))

(assert (= (and d!32447 res!56740) b!115717))

(assert (= (and d!32447 c!20524) b!115725))

(assert (= (and d!32447 (not c!20524)) b!115718))

(assert (= (and d!32447 res!56745) b!115731))

(assert (= (and b!115731 res!56742) b!115719))

(assert (= (and b!115731 (not res!56744)) b!115727))

(assert (= (and b!115727 res!56743) b!115716))

(assert (= (and b!115731 res!56741) b!115723))

(assert (= (and b!115723 c!20529) b!115724))

(assert (= (and b!115723 (not c!20529)) b!115729))

(assert (= (and b!115724 res!56739) b!115732))

(assert (= (or b!115724 b!115729) bm!12374))

(assert (= (and b!115723 res!56746) b!115722))

(assert (= (and b!115722 c!20527) b!115728))

(assert (= (and b!115722 (not c!20527)) b!115720))

(assert (= (and b!115728 res!56747) b!115715))

(assert (= (or b!115728 b!115720) bm!12369))

(declare-fun b_lambda!5143 () Bool)

(assert (=> (not b_lambda!5143) (not b!115716)))

(assert (=> b!115716 t!5904))

(declare-fun b_and!7193 () Bool)

(assert (= b_and!7189 (and (=> t!5904 result!3699) b_and!7193)))

(assert (=> b!115716 t!5906))

(declare-fun b_and!7195 () Bool)

(assert (= b_and!7191 (and (=> t!5906 result!3703) b_and!7195)))

(declare-fun m!131613 () Bool)

(assert (=> bm!12374 m!131613))

(declare-fun m!131615 () Bool)

(assert (=> bm!12373 m!131615))

(declare-fun m!131617 () Bool)

(assert (=> b!115725 m!131617))

(declare-fun m!131619 () Bool)

(assert (=> b!115725 m!131619))

(declare-fun m!131621 () Bool)

(assert (=> b!115725 m!131621))

(declare-fun m!131623 () Bool)

(assert (=> b!115725 m!131623))

(declare-fun m!131625 () Bool)

(assert (=> b!115725 m!131625))

(assert (=> b!115725 m!131619))

(declare-fun m!131627 () Bool)

(assert (=> b!115725 m!131627))

(declare-fun m!131629 () Bool)

(assert (=> b!115725 m!131629))

(declare-fun m!131631 () Bool)

(assert (=> b!115725 m!131631))

(declare-fun m!131633 () Bool)

(assert (=> b!115725 m!131633))

(declare-fun m!131635 () Bool)

(assert (=> b!115725 m!131635))

(declare-fun m!131637 () Bool)

(assert (=> b!115725 m!131637))

(declare-fun m!131639 () Bool)

(assert (=> b!115725 m!131639))

(assert (=> b!115725 m!131623))

(declare-fun m!131641 () Bool)

(assert (=> b!115725 m!131641))

(assert (=> b!115725 m!131635))

(declare-fun m!131643 () Bool)

(assert (=> b!115725 m!131643))

(assert (=> b!115725 m!131637))

(declare-fun m!131645 () Bool)

(assert (=> b!115725 m!131645))

(declare-fun m!131647 () Bool)

(assert (=> b!115725 m!131647))

(declare-fun m!131649 () Bool)

(assert (=> b!115725 m!131649))

(assert (=> b!115719 m!131617))

(assert (=> b!115719 m!131617))

(declare-fun m!131651 () Bool)

(assert (=> b!115719 m!131651))

(assert (=> d!32447 m!131591))

(declare-fun m!131653 () Bool)

(assert (=> b!115715 m!131653))

(assert (=> bm!12371 m!131633))

(assert (=> b!115716 m!131617))

(assert (=> b!115716 m!131595))

(declare-fun m!131655 () Bool)

(assert (=> b!115716 m!131655))

(assert (=> b!115716 m!131655))

(assert (=> b!115716 m!131595))

(declare-fun m!131657 () Bool)

(assert (=> b!115716 m!131657))

(assert (=> b!115716 m!131617))

(declare-fun m!131659 () Bool)

(assert (=> b!115716 m!131659))

(declare-fun m!131661 () Bool)

(assert (=> bm!12369 m!131661))

(assert (=> b!115717 m!131617))

(assert (=> b!115717 m!131617))

(assert (=> b!115717 m!131651))

(assert (=> b!115727 m!131617))

(assert (=> b!115727 m!131617))

(declare-fun m!131663 () Bool)

(assert (=> b!115727 m!131663))

(declare-fun m!131665 () Bool)

(assert (=> b!115732 m!131665))

(declare-fun m!131667 () Bool)

(assert (=> b!115734 m!131667))

(assert (=> b!115546 d!32447))

(declare-fun d!32449 () Bool)

(assert (=> d!32449 (= (array_inv!1341 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvsge (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!115540 d!32449))

(declare-fun d!32451 () Bool)

(assert (=> d!32451 (= (array_inv!1342 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvsge (size!2411 (_values!2689 (v!3033 (underlying!408 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!115540 d!32451))

(declare-fun b!115742 () Bool)

(declare-fun e!75546 () Bool)

(assert (=> b!115742 (= e!75546 tp_is_empty!2773)))

(declare-fun b!115743 () Bool)

(declare-fun e!75545 () Bool)

(assert (=> b!115743 (= e!75545 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4267 () Bool)

(declare-fun mapRes!4267 () Bool)

(assert (=> mapIsEmpty!4267 mapRes!4267))

(declare-fun mapNonEmpty!4267 () Bool)

(declare-fun tp!10531 () Bool)

(assert (=> mapNonEmpty!4267 (= mapRes!4267 (and tp!10531 e!75546))))

(declare-fun mapValue!4267 () ValueCell!1043)

(declare-fun mapKey!4267 () (_ BitVec 32))

(declare-fun mapRest!4267 () (Array (_ BitVec 32) ValueCell!1043))

(assert (=> mapNonEmpty!4267 (= mapRest!4252 (store mapRest!4267 mapKey!4267 mapValue!4267))))

(declare-fun condMapEmpty!4267 () Bool)

(declare-fun mapDefault!4267 () ValueCell!1043)

(assert (=> mapNonEmpty!4252 (= condMapEmpty!4267 (= mapRest!4252 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4267)))))

(assert (=> mapNonEmpty!4252 (= tp!10504 (and e!75545 mapRes!4267))))

(assert (= (and mapNonEmpty!4252 condMapEmpty!4267) mapIsEmpty!4267))

(assert (= (and mapNonEmpty!4252 (not condMapEmpty!4267)) mapNonEmpty!4267))

(assert (= (and mapNonEmpty!4267 ((_ is ValueCellFull!1043) mapValue!4267)) b!115742))

(assert (= (and mapNonEmpty!4252 ((_ is ValueCellFull!1043) mapDefault!4267)) b!115743))

(declare-fun m!131669 () Bool)

(assert (=> mapNonEmpty!4267 m!131669))

(declare-fun b!115744 () Bool)

(declare-fun e!75548 () Bool)

(assert (=> b!115744 (= e!75548 tp_is_empty!2773)))

(declare-fun b!115745 () Bool)

(declare-fun e!75547 () Bool)

(assert (=> b!115745 (= e!75547 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4268 () Bool)

(declare-fun mapRes!4268 () Bool)

(assert (=> mapIsEmpty!4268 mapRes!4268))

(declare-fun mapNonEmpty!4268 () Bool)

(declare-fun tp!10532 () Bool)

(assert (=> mapNonEmpty!4268 (= mapRes!4268 (and tp!10532 e!75548))))

(declare-fun mapKey!4268 () (_ BitVec 32))

(declare-fun mapRest!4268 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapValue!4268 () ValueCell!1043)

(assert (=> mapNonEmpty!4268 (= mapRest!4251 (store mapRest!4268 mapKey!4268 mapValue!4268))))

(declare-fun condMapEmpty!4268 () Bool)

(declare-fun mapDefault!4268 () ValueCell!1043)

(assert (=> mapNonEmpty!4251 (= condMapEmpty!4268 (= mapRest!4251 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4268)))))

(assert (=> mapNonEmpty!4251 (= tp!10501 (and e!75547 mapRes!4268))))

(assert (= (and mapNonEmpty!4251 condMapEmpty!4268) mapIsEmpty!4268))

(assert (= (and mapNonEmpty!4251 (not condMapEmpty!4268)) mapNonEmpty!4268))

(assert (= (and mapNonEmpty!4268 ((_ is ValueCellFull!1043) mapValue!4268)) b!115744))

(assert (= (and mapNonEmpty!4251 ((_ is ValueCellFull!1043) mapDefault!4268)) b!115745))

(declare-fun m!131671 () Bool)

(assert (=> mapNonEmpty!4268 m!131671))

(declare-fun b_lambda!5145 () Bool)

(assert (= b_lambda!5143 (or (and b!115540 b_free!2713) (and b!115550 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))) b_lambda!5145)))

(declare-fun b_lambda!5147 () Bool)

(assert (= b_lambda!5141 (or (and b!115540 b_free!2713) (and b!115550 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))) b_lambda!5147)))

(check-sat (not b!115694) (not d!32443) (not bm!12362) (not b!115649) (not b_lambda!5147) (not b!115647) (not b!115727) b_and!7193 (not b!115719) (not b!115709) (not b_next!2715) (not d!32445) (not b!115734) (not bm!12366) (not mapNonEmpty!4267) tp_is_empty!2773 (not bm!12374) (not bm!12371) (not b!115717) (not b!115715) (not b!115648) (not b!115702) (not d!32447) (not b!115711) (not bm!12367) (not b_lambda!5145) (not b!115704) (not d!32435) (not b!115692) (not b!115732) (not bm!12373) (not b!115716) (not bm!12369) (not b!115693) (not b_next!2713) (not d!32437) (not b!115696) (not b!115725) (not bm!12364) b_and!7195 (not mapNonEmpty!4268))
(check-sat b_and!7193 b_and!7195 (not b_next!2713) (not b_next!2715))
(get-model)

(declare-fun d!32453 () Bool)

(declare-fun e!75553 () Bool)

(assert (=> d!32453 e!75553))

(declare-fun res!56750 () Bool)

(assert (=> d!32453 (=> res!56750 e!75553)))

(declare-fun lt!60073 () Bool)

(assert (=> d!32453 (= res!56750 (not lt!60073))))

(declare-fun lt!60070 () Bool)

(assert (=> d!32453 (= lt!60073 lt!60070)))

(declare-fun lt!60072 () Unit!3583)

(declare-fun e!75554 () Unit!3583)

(assert (=> d!32453 (= lt!60072 e!75554)))

(declare-fun c!20532 () Bool)

(assert (=> d!32453 (= c!20532 lt!60070)))

(declare-fun containsKey!166 (List!1651 (_ BitVec 64)) Bool)

(assert (=> d!32453 (= lt!60070 (containsKey!166 (toList!814 lt!60051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32453 (= (contains!848 lt!60051 #b1000000000000000000000000000000000000000000000000000000000000000) lt!60073)))

(declare-fun b!115752 () Bool)

(declare-fun lt!60071 () Unit!3583)

(assert (=> b!115752 (= e!75554 lt!60071)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!114 (List!1651 (_ BitVec 64)) Unit!3583)

(assert (=> b!115752 (= lt!60071 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 lt!60051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!169 0))(
  ( (Some!168 (v!3038 V!3345)) (None!167) )
))
(declare-fun isDefined!115 (Option!169) Bool)

(declare-fun getValueByKey!163 (List!1651 (_ BitVec 64)) Option!169)

(assert (=> b!115752 (isDefined!115 (getValueByKey!163 (toList!814 lt!60051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115753 () Bool)

(declare-fun Unit!3587 () Unit!3583)

(assert (=> b!115753 (= e!75554 Unit!3587)))

(declare-fun b!115754 () Bool)

(assert (=> b!115754 (= e!75553 (isDefined!115 (getValueByKey!163 (toList!814 lt!60051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32453 c!20532) b!115752))

(assert (= (and d!32453 (not c!20532)) b!115753))

(assert (= (and d!32453 (not res!56750)) b!115754))

(declare-fun m!131673 () Bool)

(assert (=> d!32453 m!131673))

(declare-fun m!131675 () Bool)

(assert (=> b!115752 m!131675))

(declare-fun m!131677 () Bool)

(assert (=> b!115752 m!131677))

(assert (=> b!115752 m!131677))

(declare-fun m!131679 () Bool)

(assert (=> b!115752 m!131679))

(assert (=> b!115754 m!131677))

(assert (=> b!115754 m!131677))

(assert (=> b!115754 m!131679))

(assert (=> bm!12369 d!32453))

(declare-fun d!32455 () Bool)

(declare-fun get!1409 (Option!169) V!3345)

(assert (=> d!32455 (= (apply!104 lt!60029 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1409 (getValueByKey!163 (toList!814 lt!60029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4708 () Bool)

(assert (= bs!4708 d!32455))

(declare-fun m!131681 () Bool)

(assert (=> bs!4708 m!131681))

(assert (=> bs!4708 m!131681))

(declare-fun m!131683 () Bool)

(assert (=> bs!4708 m!131683))

(assert (=> b!115709 d!32455))

(declare-fun d!32457 () Bool)

(declare-fun e!75557 () Bool)

(assert (=> d!32457 e!75557))

(declare-fun res!56756 () Bool)

(assert (=> d!32457 (=> (not res!56756) (not e!75557))))

(declare-fun lt!60082 () ListLongMap!1597)

(assert (=> d!32457 (= res!56756 (contains!848 lt!60082 (_1!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60083 () List!1651)

(assert (=> d!32457 (= lt!60082 (ListLongMap!1598 lt!60083))))

(declare-fun lt!60084 () Unit!3583)

(declare-fun lt!60085 () Unit!3583)

(assert (=> d!32457 (= lt!60084 lt!60085)))

(assert (=> d!32457 (= (getValueByKey!163 lt!60083 (_1!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))) (Some!168 (_2!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!79 (List!1651 (_ BitVec 64) V!3345) Unit!3583)

(assert (=> d!32457 (= lt!60085 (lemmaContainsTupThenGetReturnValue!79 lt!60083 (_1!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (_2!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun insertStrictlySorted!82 (List!1651 (_ BitVec 64) V!3345) List!1651)

(assert (=> d!32457 (= lt!60083 (insertStrictlySorted!82 (toList!814 (ite c!20522 call!12369 (ite c!20519 call!12366 call!12368))) (_1!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (_2!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32457 (= (+!157 (ite c!20522 call!12369 (ite c!20519 call!12366 call!12368)) (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60082)))

(declare-fun b!115759 () Bool)

(declare-fun res!56755 () Bool)

(assert (=> b!115759 (=> (not res!56755) (not e!75557))))

(assert (=> b!115759 (= res!56755 (= (getValueByKey!163 (toList!814 lt!60082) (_1!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))) (Some!168 (_2!1246 (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))))

(declare-fun b!115760 () Bool)

(declare-fun contains!849 (List!1651 tuple2!2470) Bool)

(assert (=> b!115760 (= e!75557 (contains!849 (toList!814 lt!60082) (ite (or c!20522 c!20519) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (= (and d!32457 res!56756) b!115759))

(assert (= (and b!115759 res!56755) b!115760))

(declare-fun m!131685 () Bool)

(assert (=> d!32457 m!131685))

(declare-fun m!131687 () Bool)

(assert (=> d!32457 m!131687))

(declare-fun m!131689 () Bool)

(assert (=> d!32457 m!131689))

(declare-fun m!131691 () Bool)

(assert (=> d!32457 m!131691))

(declare-fun m!131693 () Bool)

(assert (=> b!115759 m!131693))

(declare-fun m!131695 () Bool)

(assert (=> b!115760 m!131695))

(assert (=> bm!12366 d!32457))

(declare-fun d!32459 () Bool)

(assert (=> d!32459 (= (apply!104 lt!60029 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1409 (getValueByKey!163 (toList!814 lt!60029) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))))

(declare-fun bs!4709 () Bool)

(assert (= bs!4709 d!32459))

(assert (=> bs!4709 m!131555))

(declare-fun m!131697 () Bool)

(assert (=> bs!4709 m!131697))

(assert (=> bs!4709 m!131697))

(declare-fun m!131699 () Bool)

(assert (=> bs!4709 m!131699))

(assert (=> b!115693 d!32459))

(declare-fun d!32461 () Bool)

(declare-fun c!20535 () Bool)

(assert (=> d!32461 (= c!20535 ((_ is ValueCellFull!1043) (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun e!75560 () V!3345)

(assert (=> d!32461 (= (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!75560)))

(declare-fun b!115765 () Bool)

(declare-fun get!1410 (ValueCell!1043 V!3345) V!3345)

(assert (=> b!115765 (= e!75560 (get!1410 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115766 () Bool)

(declare-fun get!1411 (ValueCell!1043 V!3345) V!3345)

(assert (=> b!115766 (= e!75560 (get!1411 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32461 c!20535) b!115765))

(assert (= (and d!32461 (not c!20535)) b!115766))

(assert (=> b!115765 m!131597))

(assert (=> b!115765 m!131595))

(declare-fun m!131701 () Bool)

(assert (=> b!115765 m!131701))

(assert (=> b!115766 m!131597))

(assert (=> b!115766 m!131595))

(declare-fun m!131703 () Bool)

(assert (=> b!115766 m!131703))

(assert (=> b!115693 d!32461))

(declare-fun b!115791 () Bool)

(declare-fun lt!60106 () ListLongMap!1597)

(declare-fun e!75576 () Bool)

(assert (=> b!115791 (= e!75576 (= lt!60106 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115792 () Bool)

(declare-fun e!75578 () ListLongMap!1597)

(declare-fun call!12380 () ListLongMap!1597)

(assert (=> b!115792 (= e!75578 call!12380)))

(declare-fun b!115793 () Bool)

(declare-fun res!56768 () Bool)

(declare-fun e!75579 () Bool)

(assert (=> b!115793 (=> (not res!56768) (not e!75579))))

(assert (=> b!115793 (= res!56768 (not (contains!848 lt!60106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115794 () Bool)

(assert (=> b!115794 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115794 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2411 (_values!2689 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun e!75581 () Bool)

(assert (=> b!115794 (= e!75581 (= (apply!104 lt!60106 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115795 () Bool)

(declare-fun e!75580 () Bool)

(assert (=> b!115795 (= e!75579 e!75580)))

(declare-fun c!20544 () Bool)

(declare-fun e!75575 () Bool)

(assert (=> b!115795 (= c!20544 e!75575)))

(declare-fun res!56765 () Bool)

(assert (=> b!115795 (=> (not res!56765) (not e!75575))))

(assert (=> b!115795 (= res!56765 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115796 () Bool)

(declare-fun e!75577 () ListLongMap!1597)

(assert (=> b!115796 (= e!75577 (ListLongMap!1598 Nil!1648))))

(declare-fun b!115797 () Bool)

(assert (=> b!115797 (= e!75577 e!75578)))

(declare-fun c!20547 () Bool)

(assert (=> b!115797 (= c!20547 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115798 () Bool)

(declare-fun lt!60105 () Unit!3583)

(declare-fun lt!60101 () Unit!3583)

(assert (=> b!115798 (= lt!60105 lt!60101)))

(declare-fun lt!60100 () (_ BitVec 64))

(declare-fun lt!60102 () V!3345)

(declare-fun lt!60103 () (_ BitVec 64))

(declare-fun lt!60104 () ListLongMap!1597)

(assert (=> b!115798 (not (contains!848 (+!157 lt!60104 (tuple2!2471 lt!60103 lt!60102)) lt!60100))))

(declare-fun addStillNotContains!54 (ListLongMap!1597 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3583)

(assert (=> b!115798 (= lt!60101 (addStillNotContains!54 lt!60104 lt!60103 lt!60102 lt!60100))))

(assert (=> b!115798 (= lt!60100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!115798 (= lt!60102 (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115798 (= lt!60103 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!115798 (= lt!60104 call!12380)))

(assert (=> b!115798 (= e!75578 (+!157 call!12380 (tuple2!2471 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!115799 () Bool)

(assert (=> b!115799 (= e!75580 e!75576)))

(declare-fun c!20546 () Bool)

(assert (=> b!115799 (= c!20546 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun bm!12377 () Bool)

(assert (=> bm!12377 (= call!12380 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115800 () Bool)

(assert (=> b!115800 (= e!75580 e!75581)))

(assert (=> b!115800 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun res!56766 () Bool)

(assert (=> b!115800 (= res!56766 (contains!848 lt!60106 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115800 (=> (not res!56766) (not e!75581))))

(declare-fun d!32463 () Bool)

(assert (=> d!32463 e!75579))

(declare-fun res!56767 () Bool)

(assert (=> d!32463 (=> (not res!56767) (not e!75579))))

(assert (=> d!32463 (= res!56767 (not (contains!848 lt!60106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32463 (= lt!60106 e!75577)))

(declare-fun c!20545 () Bool)

(assert (=> d!32463 (= c!20545 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> d!32463 (validMask!0 (mask!6916 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32463 (= (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) lt!60106)))

(declare-fun b!115801 () Bool)

(assert (=> b!115801 (= e!75575 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115801 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!115802 () Bool)

(declare-fun isEmpty!392 (ListLongMap!1597) Bool)

(assert (=> b!115802 (= e!75576 (isEmpty!392 lt!60106))))

(assert (= (and d!32463 c!20545) b!115796))

(assert (= (and d!32463 (not c!20545)) b!115797))

(assert (= (and b!115797 c!20547) b!115798))

(assert (= (and b!115797 (not c!20547)) b!115792))

(assert (= (or b!115798 b!115792) bm!12377))

(assert (= (and d!32463 res!56767) b!115793))

(assert (= (and b!115793 res!56768) b!115795))

(assert (= (and b!115795 res!56765) b!115801))

(assert (= (and b!115795 c!20544) b!115800))

(assert (= (and b!115795 (not c!20544)) b!115799))

(assert (= (and b!115800 res!56766) b!115794))

(assert (= (and b!115799 c!20546) b!115791))

(assert (= (and b!115799 (not c!20546)) b!115802))

(declare-fun b_lambda!5149 () Bool)

(assert (=> (not b_lambda!5149) (not b!115794)))

(assert (=> b!115794 t!5904))

(declare-fun b_and!7197 () Bool)

(assert (= b_and!7193 (and (=> t!5904 result!3699) b_and!7197)))

(assert (=> b!115794 t!5906))

(declare-fun b_and!7199 () Bool)

(assert (= b_and!7195 (and (=> t!5906 result!3703) b_and!7199)))

(declare-fun b_lambda!5151 () Bool)

(assert (=> (not b_lambda!5151) (not b!115798)))

(assert (=> b!115798 t!5904))

(declare-fun b_and!7201 () Bool)

(assert (= b_and!7197 (and (=> t!5904 result!3699) b_and!7201)))

(assert (=> b!115798 t!5906))

(declare-fun b_and!7203 () Bool)

(assert (= b_and!7199 (and (=> t!5906 result!3703) b_and!7203)))

(declare-fun m!131705 () Bool)

(assert (=> b!115793 m!131705))

(assert (=> b!115800 m!131617))

(assert (=> b!115800 m!131617))

(declare-fun m!131707 () Bool)

(assert (=> b!115800 m!131707))

(declare-fun m!131709 () Bool)

(assert (=> b!115791 m!131709))

(assert (=> bm!12377 m!131709))

(assert (=> b!115794 m!131617))

(declare-fun m!131711 () Bool)

(assert (=> b!115794 m!131711))

(assert (=> b!115794 m!131655))

(assert (=> b!115794 m!131595))

(assert (=> b!115794 m!131617))

(assert (=> b!115794 m!131655))

(assert (=> b!115794 m!131595))

(assert (=> b!115794 m!131657))

(assert (=> b!115797 m!131617))

(assert (=> b!115797 m!131617))

(assert (=> b!115797 m!131651))

(assert (=> b!115801 m!131617))

(assert (=> b!115801 m!131617))

(assert (=> b!115801 m!131651))

(declare-fun m!131713 () Bool)

(assert (=> d!32463 m!131713))

(assert (=> d!32463 m!131591))

(declare-fun m!131715 () Bool)

(assert (=> b!115798 m!131715))

(assert (=> b!115798 m!131655))

(assert (=> b!115798 m!131595))

(assert (=> b!115798 m!131617))

(assert (=> b!115798 m!131655))

(assert (=> b!115798 m!131595))

(assert (=> b!115798 m!131657))

(declare-fun m!131717 () Bool)

(assert (=> b!115798 m!131717))

(declare-fun m!131719 () Bool)

(assert (=> b!115798 m!131719))

(declare-fun m!131721 () Bool)

(assert (=> b!115798 m!131721))

(assert (=> b!115798 m!131719))

(declare-fun m!131723 () Bool)

(assert (=> b!115802 m!131723))

(assert (=> bm!12371 d!32463))

(declare-fun d!32465 () Bool)

(assert (=> d!32465 (= (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (and (not (= (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115696 d!32465))

(assert (=> b!115694 d!32465))

(declare-fun d!32467 () Bool)

(declare-fun e!75582 () Bool)

(assert (=> d!32467 e!75582))

(declare-fun res!56770 () Bool)

(assert (=> d!32467 (=> (not res!56770) (not e!75582))))

(declare-fun lt!60107 () ListLongMap!1597)

(assert (=> d!32467 (= res!56770 (contains!848 lt!60107 (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60108 () List!1651)

(assert (=> d!32467 (= lt!60107 (ListLongMap!1598 lt!60108))))

(declare-fun lt!60109 () Unit!3583)

(declare-fun lt!60110 () Unit!3583)

(assert (=> d!32467 (= lt!60109 lt!60110)))

(assert (=> d!32467 (= (getValueByKey!163 lt!60108 (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32467 (= lt!60110 (lemmaContainsTupThenGetReturnValue!79 lt!60108 (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32467 (= lt!60108 (insertStrictlySorted!82 (toList!814 call!12370) (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32467 (= (+!157 call!12370 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60107)))

(declare-fun b!115803 () Bool)

(declare-fun res!56769 () Bool)

(assert (=> b!115803 (=> (not res!56769) (not e!75582))))

(assert (=> b!115803 (= res!56769 (= (getValueByKey!163 (toList!814 lt!60107) (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115804 () Bool)

(assert (=> b!115804 (= e!75582 (contains!849 (toList!814 lt!60107) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32467 res!56770) b!115803))

(assert (= (and b!115803 res!56769) b!115804))

(declare-fun m!131725 () Bool)

(assert (=> d!32467 m!131725))

(declare-fun m!131727 () Bool)

(assert (=> d!32467 m!131727))

(declare-fun m!131729 () Bool)

(assert (=> d!32467 m!131729))

(declare-fun m!131731 () Bool)

(assert (=> d!32467 m!131731))

(declare-fun m!131733 () Bool)

(assert (=> b!115803 m!131733))

(declare-fun m!131735 () Bool)

(assert (=> b!115804 m!131735))

(assert (=> b!115711 d!32467))

(declare-fun d!32469 () Bool)

(declare-fun res!56775 () Bool)

(declare-fun e!75591 () Bool)

(assert (=> d!32469 (=> res!56775 e!75591)))

(assert (=> d!32469 (= res!56775 (bvsge #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(assert (=> d!32469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4428 newMap!16) (mask!6916 newMap!16)) e!75591)))

(declare-fun b!115813 () Bool)

(declare-fun e!75589 () Bool)

(assert (=> b!115813 (= e!75591 e!75589)))

(declare-fun c!20550 () Bool)

(assert (=> b!115813 (= c!20550 (validKeyInArray!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12380 () Bool)

(declare-fun call!12383 () Bool)

(assert (=> bm!12380 (= call!12383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4428 newMap!16) (mask!6916 newMap!16)))))

(declare-fun b!115814 () Bool)

(declare-fun e!75590 () Bool)

(assert (=> b!115814 (= e!75590 call!12383)))

(declare-fun b!115815 () Bool)

(assert (=> b!115815 (= e!75589 e!75590)))

(declare-fun lt!60117 () (_ BitVec 64))

(assert (=> b!115815 (= lt!60117 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60119 () Unit!3583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4535 (_ BitVec 64) (_ BitVec 32)) Unit!3583)

(assert (=> b!115815 (= lt!60119 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4428 newMap!16) lt!60117 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!115815 (arrayContainsKey!0 (_keys!4428 newMap!16) lt!60117 #b00000000000000000000000000000000)))

(declare-fun lt!60118 () Unit!3583)

(assert (=> b!115815 (= lt!60118 lt!60119)))

(declare-fun res!56776 () Bool)

(declare-datatypes ((SeekEntryResult!259 0))(
  ( (MissingZero!259 (index!3189 (_ BitVec 32))) (Found!259 (index!3190 (_ BitVec 32))) (Intermediate!259 (undefined!1071 Bool) (index!3191 (_ BitVec 32)) (x!14404 (_ BitVec 32))) (Undefined!259) (MissingVacant!259 (index!3192 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4535 (_ BitVec 32)) SeekEntryResult!259)

(assert (=> b!115815 (= res!56776 (= (seekEntryOrOpen!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000) (_keys!4428 newMap!16) (mask!6916 newMap!16)) (Found!259 #b00000000000000000000000000000000)))))

(assert (=> b!115815 (=> (not res!56776) (not e!75590))))

(declare-fun b!115816 () Bool)

(assert (=> b!115816 (= e!75589 call!12383)))

(assert (= (and d!32469 (not res!56775)) b!115813))

(assert (= (and b!115813 c!20550) b!115815))

(assert (= (and b!115813 (not c!20550)) b!115816))

(assert (= (and b!115815 res!56776) b!115814))

(assert (= (or b!115814 b!115816) bm!12380))

(declare-fun m!131737 () Bool)

(assert (=> b!115813 m!131737))

(assert (=> b!115813 m!131737))

(declare-fun m!131739 () Bool)

(assert (=> b!115813 m!131739))

(declare-fun m!131741 () Bool)

(assert (=> bm!12380 m!131741))

(assert (=> b!115815 m!131737))

(declare-fun m!131743 () Bool)

(assert (=> b!115815 m!131743))

(declare-fun m!131745 () Bool)

(assert (=> b!115815 m!131745))

(assert (=> b!115815 m!131737))

(declare-fun m!131747 () Bool)

(assert (=> b!115815 m!131747))

(assert (=> b!115648 d!32469))

(declare-fun b!115817 () Bool)

(declare-fun lt!60126 () ListLongMap!1597)

(declare-fun e!75593 () Bool)

(assert (=> b!115817 (= e!75593 (= lt!60126 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115818 () Bool)

(declare-fun e!75595 () ListLongMap!1597)

(declare-fun call!12384 () ListLongMap!1597)

(assert (=> b!115818 (= e!75595 call!12384)))

(declare-fun b!115819 () Bool)

(declare-fun res!56780 () Bool)

(declare-fun e!75596 () Bool)

(assert (=> b!115819 (=> (not res!56780) (not e!75596))))

(assert (=> b!115819 (= res!56780 (not (contains!848 lt!60126 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115820 () Bool)

(assert (=> b!115820 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115820 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2411 (_values!2689 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun e!75598 () Bool)

(assert (=> b!115820 (= e!75598 (= (apply!104 lt!60126 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115821 () Bool)

(declare-fun e!75597 () Bool)

(assert (=> b!115821 (= e!75596 e!75597)))

(declare-fun c!20551 () Bool)

(declare-fun e!75592 () Bool)

(assert (=> b!115821 (= c!20551 e!75592)))

(declare-fun res!56777 () Bool)

(assert (=> b!115821 (=> (not res!56777) (not e!75592))))

(assert (=> b!115821 (= res!56777 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115822 () Bool)

(declare-fun e!75594 () ListLongMap!1597)

(assert (=> b!115822 (= e!75594 (ListLongMap!1598 Nil!1648))))

(declare-fun b!115823 () Bool)

(assert (=> b!115823 (= e!75594 e!75595)))

(declare-fun c!20554 () Bool)

(assert (=> b!115823 (= c!20554 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115824 () Bool)

(declare-fun lt!60125 () Unit!3583)

(declare-fun lt!60121 () Unit!3583)

(assert (=> b!115824 (= lt!60125 lt!60121)))

(declare-fun lt!60120 () (_ BitVec 64))

(declare-fun lt!60123 () (_ BitVec 64))

(declare-fun lt!60122 () V!3345)

(declare-fun lt!60124 () ListLongMap!1597)

(assert (=> b!115824 (not (contains!848 (+!157 lt!60124 (tuple2!2471 lt!60123 lt!60122)) lt!60120))))

(assert (=> b!115824 (= lt!60121 (addStillNotContains!54 lt!60124 lt!60123 lt!60122 lt!60120))))

(assert (=> b!115824 (= lt!60120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!115824 (= lt!60122 (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115824 (= lt!60123 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(assert (=> b!115824 (= lt!60124 call!12384)))

(assert (=> b!115824 (= e!75595 (+!157 call!12384 (tuple2!2471 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!115825 () Bool)

(assert (=> b!115825 (= e!75597 e!75593)))

(declare-fun c!20553 () Bool)

(assert (=> b!115825 (= c!20553 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun bm!12381 () Bool)

(assert (=> bm!12381 (= call!12384 (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115826 () Bool)

(assert (=> b!115826 (= e!75597 e!75598)))

(assert (=> b!115826 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun res!56778 () Bool)

(assert (=> b!115826 (= res!56778 (contains!848 lt!60126 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115826 (=> (not res!56778) (not e!75598))))

(declare-fun d!32471 () Bool)

(assert (=> d!32471 e!75596))

(declare-fun res!56779 () Bool)

(assert (=> d!32471 (=> (not res!56779) (not e!75596))))

(assert (=> d!32471 (= res!56779 (not (contains!848 lt!60126 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32471 (= lt!60126 e!75594)))

(declare-fun c!20552 () Bool)

(assert (=> d!32471 (= c!20552 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> d!32471 (validMask!0 (mask!6916 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32471 (= (getCurrentListMapNoExtraKeys!124 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (_values!2689 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992))) (extraKeys!2495 (v!3033 (underlying!408 thiss!992))) (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) (minValue!2573 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992)))) lt!60126)))

(declare-fun b!115827 () Bool)

(assert (=> b!115827 (= e!75592 (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115827 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!115828 () Bool)

(assert (=> b!115828 (= e!75593 (isEmpty!392 lt!60126))))

(assert (= (and d!32471 c!20552) b!115822))

(assert (= (and d!32471 (not c!20552)) b!115823))

(assert (= (and b!115823 c!20554) b!115824))

(assert (= (and b!115823 (not c!20554)) b!115818))

(assert (= (or b!115824 b!115818) bm!12381))

(assert (= (and d!32471 res!56779) b!115819))

(assert (= (and b!115819 res!56780) b!115821))

(assert (= (and b!115821 res!56777) b!115827))

(assert (= (and b!115821 c!20551) b!115826))

(assert (= (and b!115821 (not c!20551)) b!115825))

(assert (= (and b!115826 res!56778) b!115820))

(assert (= (and b!115825 c!20553) b!115817))

(assert (= (and b!115825 (not c!20553)) b!115828))

(declare-fun b_lambda!5153 () Bool)

(assert (=> (not b_lambda!5153) (not b!115820)))

(assert (=> b!115820 t!5904))

(declare-fun b_and!7205 () Bool)

(assert (= b_and!7201 (and (=> t!5904 result!3699) b_and!7205)))

(assert (=> b!115820 t!5906))

(declare-fun b_and!7207 () Bool)

(assert (= b_and!7203 (and (=> t!5906 result!3703) b_and!7207)))

(declare-fun b_lambda!5155 () Bool)

(assert (=> (not b_lambda!5155) (not b!115824)))

(assert (=> b!115824 t!5904))

(declare-fun b_and!7209 () Bool)

(assert (= b_and!7205 (and (=> t!5904 result!3699) b_and!7209)))

(assert (=> b!115824 t!5906))

(declare-fun b_and!7211 () Bool)

(assert (= b_and!7207 (and (=> t!5906 result!3703) b_and!7211)))

(declare-fun m!131749 () Bool)

(assert (=> b!115819 m!131749))

(assert (=> b!115826 m!131555))

(assert (=> b!115826 m!131555))

(declare-fun m!131751 () Bool)

(assert (=> b!115826 m!131751))

(declare-fun m!131753 () Bool)

(assert (=> b!115817 m!131753))

(assert (=> bm!12381 m!131753))

(assert (=> b!115820 m!131555))

(declare-fun m!131755 () Bool)

(assert (=> b!115820 m!131755))

(assert (=> b!115820 m!131597))

(assert (=> b!115820 m!131595))

(assert (=> b!115820 m!131555))

(assert (=> b!115820 m!131597))

(assert (=> b!115820 m!131595))

(assert (=> b!115820 m!131599))

(assert (=> b!115823 m!131555))

(assert (=> b!115823 m!131555))

(assert (=> b!115823 m!131589))

(assert (=> b!115827 m!131555))

(assert (=> b!115827 m!131555))

(assert (=> b!115827 m!131589))

(declare-fun m!131757 () Bool)

(assert (=> d!32471 m!131757))

(assert (=> d!32471 m!131591))

(declare-fun m!131759 () Bool)

(assert (=> b!115824 m!131759))

(assert (=> b!115824 m!131597))

(assert (=> b!115824 m!131595))

(assert (=> b!115824 m!131555))

(assert (=> b!115824 m!131597))

(assert (=> b!115824 m!131595))

(assert (=> b!115824 m!131599))

(declare-fun m!131761 () Bool)

(assert (=> b!115824 m!131761))

(declare-fun m!131763 () Bool)

(assert (=> b!115824 m!131763))

(declare-fun m!131765 () Bool)

(assert (=> b!115824 m!131765))

(assert (=> b!115824 m!131763))

(declare-fun m!131767 () Bool)

(assert (=> b!115828 m!131767))

(assert (=> bm!12364 d!32471))

(declare-fun d!32473 () Bool)

(assert (=> d!32473 (= (validMask!0 (mask!6916 (v!3033 (underlying!408 thiss!992)))) (and (or (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000001111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000011111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000001111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000011111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000001111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000011111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000001111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000011111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000000111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000001111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000011111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000000111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000001111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000011111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000000111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000001111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000011111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000000111111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000001111111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000011111111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00000111111111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00001111111111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00011111111111111111111111111111) (= (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6916 (v!3033 (underlying!408 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!32443 d!32473))

(declare-fun b!115837 () Bool)

(declare-fun e!75604 () (_ BitVec 32))

(declare-fun e!75603 () (_ BitVec 32))

(assert (=> b!115837 (= e!75604 e!75603)))

(declare-fun c!20559 () Bool)

(assert (=> b!115837 (= c!20559 (validKeyInArray!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32475 () Bool)

(declare-fun lt!60129 () (_ BitVec 32))

(assert (=> d!32475 (and (bvsge lt!60129 #b00000000000000000000000000000000) (bvsle lt!60129 (bvsub (size!2410 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!32475 (= lt!60129 e!75604)))

(declare-fun c!20560 () Bool)

(assert (=> d!32475 (= c!20560 (bvsge #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(assert (=> d!32475 (and (bvsle #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2410 (_keys!4428 newMap!16)) (size!2410 (_keys!4428 newMap!16))))))

(assert (=> d!32475 (= (arrayCountValidKeys!0 (_keys!4428 newMap!16) #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))) lt!60129)))

(declare-fun bm!12384 () Bool)

(declare-fun call!12387 () (_ BitVec 32))

(assert (=> bm!12384 (= call!12387 (arrayCountValidKeys!0 (_keys!4428 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2410 (_keys!4428 newMap!16))))))

(declare-fun b!115838 () Bool)

(assert (=> b!115838 (= e!75603 call!12387)))

(declare-fun b!115839 () Bool)

(assert (=> b!115839 (= e!75603 (bvadd #b00000000000000000000000000000001 call!12387))))

(declare-fun b!115840 () Bool)

(assert (=> b!115840 (= e!75604 #b00000000000000000000000000000000)))

(assert (= (and d!32475 c!20560) b!115840))

(assert (= (and d!32475 (not c!20560)) b!115837))

(assert (= (and b!115837 c!20559) b!115839))

(assert (= (and b!115837 (not c!20559)) b!115838))

(assert (= (or b!115839 b!115838) bm!12384))

(assert (=> b!115837 m!131737))

(assert (=> b!115837 m!131737))

(assert (=> b!115837 m!131739))

(declare-fun m!131769 () Bool)

(assert (=> bm!12384 m!131769))

(assert (=> b!115647 d!32475))

(declare-fun b!115852 () Bool)

(declare-fun e!75607 () Bool)

(assert (=> b!115852 (= e!75607 (and (bvsge (extraKeys!2495 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2495 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!546 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!115850 () Bool)

(declare-fun res!56790 () Bool)

(assert (=> b!115850 (=> (not res!56790) (not e!75607))))

(declare-fun size!2416 (LongMapFixedSize!994) (_ BitVec 32))

(assert (=> b!115850 (= res!56790 (bvsge (size!2416 newMap!16) (_size!546 newMap!16)))))

(declare-fun d!32477 () Bool)

(declare-fun res!56791 () Bool)

(assert (=> d!32477 (=> (not res!56791) (not e!75607))))

(assert (=> d!32477 (= res!56791 (validMask!0 (mask!6916 newMap!16)))))

(assert (=> d!32477 (= (simpleValid!80 newMap!16) e!75607)))

(declare-fun b!115849 () Bool)

(declare-fun res!56792 () Bool)

(assert (=> b!115849 (=> (not res!56792) (not e!75607))))

(assert (=> b!115849 (= res!56792 (and (= (size!2411 (_values!2689 newMap!16)) (bvadd (mask!6916 newMap!16) #b00000000000000000000000000000001)) (= (size!2410 (_keys!4428 newMap!16)) (size!2411 (_values!2689 newMap!16))) (bvsge (_size!546 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!546 newMap!16) (bvadd (mask!6916 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!115851 () Bool)

(declare-fun res!56789 () Bool)

(assert (=> b!115851 (=> (not res!56789) (not e!75607))))

(assert (=> b!115851 (= res!56789 (= (size!2416 newMap!16) (bvadd (_size!546 newMap!16) (bvsdiv (bvadd (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!32477 res!56791) b!115849))

(assert (= (and b!115849 res!56792) b!115850))

(assert (= (and b!115850 res!56790) b!115851))

(assert (= (and b!115851 res!56789) b!115852))

(declare-fun m!131771 () Bool)

(assert (=> b!115850 m!131771))

(declare-fun m!131773 () Bool)

(assert (=> d!32477 m!131773))

(assert (=> b!115851 m!131771))

(assert (=> d!32437 d!32477))

(declare-fun d!32479 () Bool)

(declare-fun e!75608 () Bool)

(assert (=> d!32479 e!75608))

(declare-fun res!56793 () Bool)

(assert (=> d!32479 (=> res!56793 e!75608)))

(declare-fun lt!60133 () Bool)

(assert (=> d!32479 (= res!56793 (not lt!60133))))

(declare-fun lt!60130 () Bool)

(assert (=> d!32479 (= lt!60133 lt!60130)))

(declare-fun lt!60132 () Unit!3583)

(declare-fun e!75609 () Unit!3583)

(assert (=> d!32479 (= lt!60132 e!75609)))

(declare-fun c!20561 () Bool)

(assert (=> d!32479 (= c!20561 lt!60130)))

(assert (=> d!32479 (= lt!60130 (containsKey!166 (toList!814 lt!60051) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32479 (= (contains!848 lt!60051 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!60133)))

(declare-fun b!115853 () Bool)

(declare-fun lt!60131 () Unit!3583)

(assert (=> b!115853 (= e!75609 lt!60131)))

(assert (=> b!115853 (= lt!60131 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 lt!60051) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115853 (isDefined!115 (getValueByKey!163 (toList!814 lt!60051) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115854 () Bool)

(declare-fun Unit!3588 () Unit!3583)

(assert (=> b!115854 (= e!75609 Unit!3588)))

(declare-fun b!115855 () Bool)

(assert (=> b!115855 (= e!75608 (isDefined!115 (getValueByKey!163 (toList!814 lt!60051) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32479 c!20561) b!115853))

(assert (= (and d!32479 (not c!20561)) b!115854))

(assert (= (and d!32479 (not res!56793)) b!115855))

(assert (=> d!32479 m!131617))

(declare-fun m!131775 () Bool)

(assert (=> d!32479 m!131775))

(assert (=> b!115853 m!131617))

(declare-fun m!131777 () Bool)

(assert (=> b!115853 m!131777))

(assert (=> b!115853 m!131617))

(declare-fun m!131779 () Bool)

(assert (=> b!115853 m!131779))

(assert (=> b!115853 m!131779))

(declare-fun m!131781 () Bool)

(assert (=> b!115853 m!131781))

(assert (=> b!115855 m!131617))

(assert (=> b!115855 m!131779))

(assert (=> b!115855 m!131779))

(assert (=> b!115855 m!131781))

(assert (=> b!115727 d!32479))

(declare-fun d!32481 () Bool)

(assert (=> d!32481 (= (apply!104 lt!60029 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1409 (getValueByKey!163 (toList!814 lt!60029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4710 () Bool)

(assert (= bs!4710 d!32481))

(declare-fun m!131783 () Bool)

(assert (=> bs!4710 m!131783))

(assert (=> bs!4710 m!131783))

(declare-fun m!131785 () Bool)

(assert (=> bs!4710 m!131785))

(assert (=> b!115692 d!32481))

(declare-fun d!32483 () Bool)

(assert (=> d!32483 (= (apply!104 (+!157 lt!60052 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60046) (get!1409 (getValueByKey!163 (toList!814 (+!157 lt!60052 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60046)))))

(declare-fun bs!4711 () Bool)

(assert (= bs!4711 d!32483))

(declare-fun m!131787 () Bool)

(assert (=> bs!4711 m!131787))

(assert (=> bs!4711 m!131787))

(declare-fun m!131789 () Bool)

(assert (=> bs!4711 m!131789))

(assert (=> b!115725 d!32483))

(declare-fun d!32485 () Bool)

(assert (=> d!32485 (= (apply!104 (+!157 lt!60055 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60042) (apply!104 lt!60055 lt!60042))))

(declare-fun lt!60136 () Unit!3583)

(declare-fun choose!732 (ListLongMap!1597 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3583)

(assert (=> d!32485 (= lt!60136 (choose!732 lt!60055 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60042))))

(declare-fun e!75612 () Bool)

(assert (=> d!32485 e!75612))

(declare-fun res!56796 () Bool)

(assert (=> d!32485 (=> (not res!56796) (not e!75612))))

(assert (=> d!32485 (= res!56796 (contains!848 lt!60055 lt!60042))))

(assert (=> d!32485 (= (addApplyDifferent!80 lt!60055 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60042) lt!60136)))

(declare-fun b!115859 () Bool)

(assert (=> b!115859 (= e!75612 (not (= lt!60042 lt!60060)))))

(assert (= (and d!32485 res!56796) b!115859))

(declare-fun m!131791 () Bool)

(assert (=> d!32485 m!131791))

(declare-fun m!131793 () Bool)

(assert (=> d!32485 m!131793))

(assert (=> d!32485 m!131649))

(assert (=> d!32485 m!131635))

(assert (=> d!32485 m!131643))

(assert (=> d!32485 m!131635))

(assert (=> b!115725 d!32485))

(assert (=> b!115725 d!32463))

(declare-fun d!32487 () Bool)

(assert (=> d!32487 (= (apply!104 (+!157 lt!60052 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60046) (apply!104 lt!60052 lt!60046))))

(declare-fun lt!60137 () Unit!3583)

(assert (=> d!32487 (= lt!60137 (choose!732 lt!60052 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60046))))

(declare-fun e!75613 () Bool)

(assert (=> d!32487 e!75613))

(declare-fun res!56797 () Bool)

(assert (=> d!32487 (=> (not res!56797) (not e!75613))))

(assert (=> d!32487 (= res!56797 (contains!848 lt!60052 lt!60046))))

(assert (=> d!32487 (= (addApplyDifferent!80 lt!60052 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60046) lt!60137)))

(declare-fun b!115860 () Bool)

(assert (=> b!115860 (= e!75613 (not (= lt!60046 lt!60043)))))

(assert (= (and d!32487 res!56797) b!115860))

(declare-fun m!131795 () Bool)

(assert (=> d!32487 m!131795))

(declare-fun m!131797 () Bool)

(assert (=> d!32487 m!131797))

(assert (=> d!32487 m!131629))

(assert (=> d!32487 m!131619))

(assert (=> d!32487 m!131627))

(assert (=> d!32487 m!131619))

(assert (=> b!115725 d!32487))

(declare-fun d!32489 () Bool)

(assert (=> d!32489 (= (apply!104 (+!157 lt!60050 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60049) (get!1409 (getValueByKey!163 (toList!814 (+!157 lt!60050 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60049)))))

(declare-fun bs!4712 () Bool)

(assert (= bs!4712 d!32489))

(declare-fun m!131799 () Bool)

(assert (=> bs!4712 m!131799))

(assert (=> bs!4712 m!131799))

(declare-fun m!131801 () Bool)

(assert (=> bs!4712 m!131801))

(assert (=> b!115725 d!32489))

(declare-fun d!32491 () Bool)

(assert (=> d!32491 (contains!848 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60048)))

(declare-fun lt!60140 () Unit!3583)

(declare-fun choose!733 (ListLongMap!1597 (_ BitVec 64) V!3345 (_ BitVec 64)) Unit!3583)

(assert (=> d!32491 (= lt!60140 (choose!733 lt!60057 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60048))))

(assert (=> d!32491 (contains!848 lt!60057 lt!60048)))

(assert (=> d!32491 (= (addStillContains!80 lt!60057 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60048) lt!60140)))

(declare-fun bs!4713 () Bool)

(assert (= bs!4713 d!32491))

(assert (=> bs!4713 m!131637))

(assert (=> bs!4713 m!131637))

(assert (=> bs!4713 m!131645))

(declare-fun m!131803 () Bool)

(assert (=> bs!4713 m!131803))

(declare-fun m!131805 () Bool)

(assert (=> bs!4713 m!131805))

(assert (=> b!115725 d!32491))

(declare-fun d!32493 () Bool)

(declare-fun e!75614 () Bool)

(assert (=> d!32493 e!75614))

(declare-fun res!56798 () Bool)

(assert (=> d!32493 (=> res!56798 e!75614)))

(declare-fun lt!60144 () Bool)

(assert (=> d!32493 (= res!56798 (not lt!60144))))

(declare-fun lt!60141 () Bool)

(assert (=> d!32493 (= lt!60144 lt!60141)))

(declare-fun lt!60143 () Unit!3583)

(declare-fun e!75615 () Unit!3583)

(assert (=> d!32493 (= lt!60143 e!75615)))

(declare-fun c!20562 () Bool)

(assert (=> d!32493 (= c!20562 lt!60141)))

(assert (=> d!32493 (= lt!60141 (containsKey!166 (toList!814 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60048))))

(assert (=> d!32493 (= (contains!848 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60048) lt!60144)))

(declare-fun b!115862 () Bool)

(declare-fun lt!60142 () Unit!3583)

(assert (=> b!115862 (= e!75615 lt!60142)))

(assert (=> b!115862 (= lt!60142 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60048))))

(assert (=> b!115862 (isDefined!115 (getValueByKey!163 (toList!814 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60048))))

(declare-fun b!115863 () Bool)

(declare-fun Unit!3589 () Unit!3583)

(assert (=> b!115863 (= e!75615 Unit!3589)))

(declare-fun b!115864 () Bool)

(assert (=> b!115864 (= e!75614 (isDefined!115 (getValueByKey!163 (toList!814 (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60048)))))

(assert (= (and d!32493 c!20562) b!115862))

(assert (= (and d!32493 (not c!20562)) b!115863))

(assert (= (and d!32493 (not res!56798)) b!115864))

(declare-fun m!131807 () Bool)

(assert (=> d!32493 m!131807))

(declare-fun m!131809 () Bool)

(assert (=> b!115862 m!131809))

(declare-fun m!131811 () Bool)

(assert (=> b!115862 m!131811))

(assert (=> b!115862 m!131811))

(declare-fun m!131813 () Bool)

(assert (=> b!115862 m!131813))

(assert (=> b!115864 m!131811))

(assert (=> b!115864 m!131811))

(assert (=> b!115864 m!131813))

(assert (=> b!115725 d!32493))

(declare-fun d!32495 () Bool)

(declare-fun e!75616 () Bool)

(assert (=> d!32495 e!75616))

(declare-fun res!56800 () Bool)

(assert (=> d!32495 (=> (not res!56800) (not e!75616))))

(declare-fun lt!60145 () ListLongMap!1597)

(assert (=> d!32495 (= res!56800 (contains!848 lt!60145 (_1!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60146 () List!1651)

(assert (=> d!32495 (= lt!60145 (ListLongMap!1598 lt!60146))))

(declare-fun lt!60147 () Unit!3583)

(declare-fun lt!60148 () Unit!3583)

(assert (=> d!32495 (= lt!60147 lt!60148)))

(assert (=> d!32495 (= (getValueByKey!163 lt!60146 (_1!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32495 (= lt!60148 (lemmaContainsTupThenGetReturnValue!79 lt!60146 (_1!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32495 (= lt!60146 (insertStrictlySorted!82 (toList!814 lt!60052) (_1!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32495 (= (+!157 lt!60052 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60145)))

(declare-fun b!115865 () Bool)

(declare-fun res!56799 () Bool)

(assert (=> b!115865 (=> (not res!56799) (not e!75616))))

(assert (=> b!115865 (= res!56799 (= (getValueByKey!163 (toList!814 lt!60145) (_1!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115866 () Bool)

(assert (=> b!115866 (= e!75616 (contains!849 (toList!814 lt!60145) (tuple2!2471 lt!60043 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32495 res!56800) b!115865))

(assert (= (and b!115865 res!56799) b!115866))

(declare-fun m!131815 () Bool)

(assert (=> d!32495 m!131815))

(declare-fun m!131817 () Bool)

(assert (=> d!32495 m!131817))

(declare-fun m!131819 () Bool)

(assert (=> d!32495 m!131819))

(declare-fun m!131821 () Bool)

(assert (=> d!32495 m!131821))

(declare-fun m!131823 () Bool)

(assert (=> b!115865 m!131823))

(declare-fun m!131825 () Bool)

(assert (=> b!115866 m!131825))

(assert (=> b!115725 d!32495))

(declare-fun d!32497 () Bool)

(declare-fun e!75617 () Bool)

(assert (=> d!32497 e!75617))

(declare-fun res!56802 () Bool)

(assert (=> d!32497 (=> (not res!56802) (not e!75617))))

(declare-fun lt!60149 () ListLongMap!1597)

(assert (=> d!32497 (= res!56802 (contains!848 lt!60149 (_1!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60150 () List!1651)

(assert (=> d!32497 (= lt!60149 (ListLongMap!1598 lt!60150))))

(declare-fun lt!60151 () Unit!3583)

(declare-fun lt!60152 () Unit!3583)

(assert (=> d!32497 (= lt!60151 lt!60152)))

(assert (=> d!32497 (= (getValueByKey!163 lt!60150 (_1!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32497 (= lt!60152 (lemmaContainsTupThenGetReturnValue!79 lt!60150 (_1!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32497 (= lt!60150 (insertStrictlySorted!82 (toList!814 lt!60050) (_1!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32497 (= (+!157 lt!60050 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60149)))

(declare-fun b!115867 () Bool)

(declare-fun res!56801 () Bool)

(assert (=> b!115867 (=> (not res!56801) (not e!75617))))

(assert (=> b!115867 (= res!56801 (= (getValueByKey!163 (toList!814 lt!60149) (_1!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115868 () Bool)

(assert (=> b!115868 (= e!75617 (contains!849 (toList!814 lt!60149) (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32497 res!56802) b!115867))

(assert (= (and b!115867 res!56801) b!115868))

(declare-fun m!131827 () Bool)

(assert (=> d!32497 m!131827))

(declare-fun m!131829 () Bool)

(assert (=> d!32497 m!131829))

(declare-fun m!131831 () Bool)

(assert (=> d!32497 m!131831))

(declare-fun m!131833 () Bool)

(assert (=> d!32497 m!131833))

(declare-fun m!131835 () Bool)

(assert (=> b!115867 m!131835))

(declare-fun m!131837 () Bool)

(assert (=> b!115868 m!131837))

(assert (=> b!115725 d!32497))

(declare-fun d!32499 () Bool)

(assert (=> d!32499 (= (apply!104 lt!60055 lt!60042) (get!1409 (getValueByKey!163 (toList!814 lt!60055) lt!60042)))))

(declare-fun bs!4714 () Bool)

(assert (= bs!4714 d!32499))

(declare-fun m!131839 () Bool)

(assert (=> bs!4714 m!131839))

(assert (=> bs!4714 m!131839))

(declare-fun m!131841 () Bool)

(assert (=> bs!4714 m!131841))

(assert (=> b!115725 d!32499))

(declare-fun d!32501 () Bool)

(assert (=> d!32501 (= (apply!104 lt!60052 lt!60046) (get!1409 (getValueByKey!163 (toList!814 lt!60052) lt!60046)))))

(declare-fun bs!4715 () Bool)

(assert (= bs!4715 d!32501))

(declare-fun m!131843 () Bool)

(assert (=> bs!4715 m!131843))

(assert (=> bs!4715 m!131843))

(declare-fun m!131845 () Bool)

(assert (=> bs!4715 m!131845))

(assert (=> b!115725 d!32501))

(declare-fun d!32503 () Bool)

(assert (=> d!32503 (= (apply!104 lt!60050 lt!60049) (get!1409 (getValueByKey!163 (toList!814 lt!60050) lt!60049)))))

(declare-fun bs!4716 () Bool)

(assert (= bs!4716 d!32503))

(declare-fun m!131847 () Bool)

(assert (=> bs!4716 m!131847))

(assert (=> bs!4716 m!131847))

(declare-fun m!131849 () Bool)

(assert (=> bs!4716 m!131849))

(assert (=> b!115725 d!32503))

(declare-fun d!32505 () Bool)

(assert (=> d!32505 (= (apply!104 (+!157 lt!60055 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60042) (get!1409 (getValueByKey!163 (toList!814 (+!157 lt!60055 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60042)))))

(declare-fun bs!4717 () Bool)

(assert (= bs!4717 d!32505))

(declare-fun m!131851 () Bool)

(assert (=> bs!4717 m!131851))

(assert (=> bs!4717 m!131851))

(declare-fun m!131853 () Bool)

(assert (=> bs!4717 m!131853))

(assert (=> b!115725 d!32505))

(declare-fun d!32507 () Bool)

(assert (=> d!32507 (= (apply!104 (+!157 lt!60050 (tuple2!2471 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60049) (apply!104 lt!60050 lt!60049))))

(declare-fun lt!60153 () Unit!3583)

(assert (=> d!32507 (= lt!60153 (choose!732 lt!60050 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60049))))

(declare-fun e!75618 () Bool)

(assert (=> d!32507 e!75618))

(declare-fun res!56803 () Bool)

(assert (=> d!32507 (=> (not res!56803) (not e!75618))))

(assert (=> d!32507 (= res!56803 (contains!848 lt!60050 lt!60049))))

(assert (=> d!32507 (= (addApplyDifferent!80 lt!60050 lt!60040 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60049) lt!60153)))

(declare-fun b!115869 () Bool)

(assert (=> b!115869 (= e!75618 (not (= lt!60049 lt!60040)))))

(assert (= (and d!32507 res!56803) b!115869))

(declare-fun m!131855 () Bool)

(assert (=> d!32507 m!131855))

(declare-fun m!131857 () Bool)

(assert (=> d!32507 m!131857))

(assert (=> d!32507 m!131639))

(assert (=> d!32507 m!131623))

(assert (=> d!32507 m!131625))

(assert (=> d!32507 m!131623))

(assert (=> b!115725 d!32507))

(declare-fun d!32509 () Bool)

(declare-fun e!75619 () Bool)

(assert (=> d!32509 e!75619))

(declare-fun res!56805 () Bool)

(assert (=> d!32509 (=> (not res!56805) (not e!75619))))

(declare-fun lt!60154 () ListLongMap!1597)

(assert (=> d!32509 (= res!56805 (contains!848 lt!60154 (_1!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60155 () List!1651)

(assert (=> d!32509 (= lt!60154 (ListLongMap!1598 lt!60155))))

(declare-fun lt!60156 () Unit!3583)

(declare-fun lt!60157 () Unit!3583)

(assert (=> d!32509 (= lt!60156 lt!60157)))

(assert (=> d!32509 (= (getValueByKey!163 lt!60155 (_1!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32509 (= lt!60157 (lemmaContainsTupThenGetReturnValue!79 lt!60155 (_1!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32509 (= lt!60155 (insertStrictlySorted!82 (toList!814 lt!60055) (_1!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32509 (= (+!157 lt!60055 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60154)))

(declare-fun b!115870 () Bool)

(declare-fun res!56804 () Bool)

(assert (=> b!115870 (=> (not res!56804) (not e!75619))))

(assert (=> b!115870 (= res!56804 (= (getValueByKey!163 (toList!814 lt!60154) (_1!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115871 () Bool)

(assert (=> b!115871 (= e!75619 (contains!849 (toList!814 lt!60154) (tuple2!2471 lt!60060 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32509 res!56805) b!115870))

(assert (= (and b!115870 res!56804) b!115871))

(declare-fun m!131859 () Bool)

(assert (=> d!32509 m!131859))

(declare-fun m!131861 () Bool)

(assert (=> d!32509 m!131861))

(declare-fun m!131863 () Bool)

(assert (=> d!32509 m!131863))

(declare-fun m!131865 () Bool)

(assert (=> d!32509 m!131865))

(declare-fun m!131867 () Bool)

(assert (=> b!115870 m!131867))

(declare-fun m!131869 () Bool)

(assert (=> b!115871 m!131869))

(assert (=> b!115725 d!32509))

(declare-fun d!32511 () Bool)

(declare-fun e!75620 () Bool)

(assert (=> d!32511 e!75620))

(declare-fun res!56807 () Bool)

(assert (=> d!32511 (=> (not res!56807) (not e!75620))))

(declare-fun lt!60158 () ListLongMap!1597)

(assert (=> d!32511 (= res!56807 (contains!848 lt!60158 (_1!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60159 () List!1651)

(assert (=> d!32511 (= lt!60158 (ListLongMap!1598 lt!60159))))

(declare-fun lt!60160 () Unit!3583)

(declare-fun lt!60161 () Unit!3583)

(assert (=> d!32511 (= lt!60160 lt!60161)))

(assert (=> d!32511 (= (getValueByKey!163 lt!60159 (_1!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32511 (= lt!60161 (lemmaContainsTupThenGetReturnValue!79 lt!60159 (_1!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32511 (= lt!60159 (insertStrictlySorted!82 (toList!814 lt!60057) (_1!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32511 (= (+!157 lt!60057 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60158)))

(declare-fun b!115872 () Bool)

(declare-fun res!56806 () Bool)

(assert (=> b!115872 (=> (not res!56806) (not e!75620))))

(assert (=> b!115872 (= res!56806 (= (getValueByKey!163 (toList!814 lt!60158) (_1!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115873 () Bool)

(assert (=> b!115873 (= e!75620 (contains!849 (toList!814 lt!60158) (tuple2!2471 lt!60047 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32511 res!56807) b!115872))

(assert (= (and b!115872 res!56806) b!115873))

(declare-fun m!131871 () Bool)

(assert (=> d!32511 m!131871))

(declare-fun m!131873 () Bool)

(assert (=> d!32511 m!131873))

(declare-fun m!131875 () Bool)

(assert (=> d!32511 m!131875))

(declare-fun m!131877 () Bool)

(assert (=> d!32511 m!131877))

(declare-fun m!131879 () Bool)

(assert (=> b!115872 m!131879))

(declare-fun m!131881 () Bool)

(assert (=> b!115873 m!131881))

(assert (=> b!115725 d!32511))

(declare-fun b!115884 () Bool)

(declare-fun e!75632 () Bool)

(declare-fun contains!850 (List!1653 (_ BitVec 64)) Bool)

(assert (=> b!115884 (= e!75632 (contains!850 Nil!1650 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115885 () Bool)

(declare-fun e!75629 () Bool)

(declare-fun e!75630 () Bool)

(assert (=> b!115885 (= e!75629 e!75630)))

(declare-fun c!20565 () Bool)

(assert (=> b!115885 (= c!20565 (validKeyInArray!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12387 () Bool)

(declare-fun call!12390 () Bool)

(assert (=> bm!12387 (= call!12390 (arrayNoDuplicates!0 (_keys!4428 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20565 (Cons!1649 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000) Nil!1650) Nil!1650)))))

(declare-fun b!115886 () Bool)

(declare-fun e!75631 () Bool)

(assert (=> b!115886 (= e!75631 e!75629)))

(declare-fun res!56816 () Bool)

(assert (=> b!115886 (=> (not res!56816) (not e!75629))))

(assert (=> b!115886 (= res!56816 (not e!75632))))

(declare-fun res!56814 () Bool)

(assert (=> b!115886 (=> (not res!56814) (not e!75632))))

(assert (=> b!115886 (= res!56814 (validKeyInArray!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32513 () Bool)

(declare-fun res!56815 () Bool)

(assert (=> d!32513 (=> res!56815 e!75631)))

(assert (=> d!32513 (= res!56815 (bvsge #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(assert (=> d!32513 (= (arrayNoDuplicates!0 (_keys!4428 newMap!16) #b00000000000000000000000000000000 Nil!1650) e!75631)))

(declare-fun b!115887 () Bool)

(assert (=> b!115887 (= e!75630 call!12390)))

(declare-fun b!115888 () Bool)

(assert (=> b!115888 (= e!75630 call!12390)))

(assert (= (and d!32513 (not res!56815)) b!115886))

(assert (= (and b!115886 res!56814) b!115884))

(assert (= (and b!115886 res!56816) b!115885))

(assert (= (and b!115885 c!20565) b!115887))

(assert (= (and b!115885 (not c!20565)) b!115888))

(assert (= (or b!115887 b!115888) bm!12387))

(assert (=> b!115884 m!131737))

(assert (=> b!115884 m!131737))

(declare-fun m!131883 () Bool)

(assert (=> b!115884 m!131883))

(assert (=> b!115885 m!131737))

(assert (=> b!115885 m!131737))

(assert (=> b!115885 m!131739))

(assert (=> bm!12387 m!131737))

(declare-fun m!131885 () Bool)

(assert (=> bm!12387 m!131885))

(assert (=> b!115886 m!131737))

(assert (=> b!115886 m!131737))

(assert (=> b!115886 m!131739))

(assert (=> b!115649 d!32513))

(declare-fun d!32515 () Bool)

(assert (=> d!32515 (= (validKeyInArray!0 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115719 d!32515))

(declare-fun d!32517 () Bool)

(declare-fun e!75633 () Bool)

(assert (=> d!32517 e!75633))

(declare-fun res!56817 () Bool)

(assert (=> d!32517 (=> res!56817 e!75633)))

(declare-fun lt!60165 () Bool)

(assert (=> d!32517 (= res!56817 (not lt!60165))))

(declare-fun lt!60162 () Bool)

(assert (=> d!32517 (= lt!60165 lt!60162)))

(declare-fun lt!60164 () Unit!3583)

(declare-fun e!75634 () Unit!3583)

(assert (=> d!32517 (= lt!60164 e!75634)))

(declare-fun c!20566 () Bool)

(assert (=> d!32517 (= c!20566 lt!60162)))

(assert (=> d!32517 (= lt!60162 (containsKey!166 (toList!814 lt!60029) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> d!32517 (= (contains!848 lt!60029 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) lt!60165)))

(declare-fun b!115889 () Bool)

(declare-fun lt!60163 () Unit!3583)

(assert (=> b!115889 (= e!75634 lt!60163)))

(assert (=> b!115889 (= lt!60163 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 lt!60029) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115889 (isDefined!115 (getValueByKey!163 (toList!814 lt!60029) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115890 () Bool)

(declare-fun Unit!3590 () Unit!3583)

(assert (=> b!115890 (= e!75634 Unit!3590)))

(declare-fun b!115891 () Bool)

(assert (=> b!115891 (= e!75633 (isDefined!115 (getValueByKey!163 (toList!814 lt!60029) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))))

(assert (= (and d!32517 c!20566) b!115889))

(assert (= (and d!32517 (not c!20566)) b!115890))

(assert (= (and d!32517 (not res!56817)) b!115891))

(assert (=> d!32517 m!131555))

(declare-fun m!131887 () Bool)

(assert (=> d!32517 m!131887))

(assert (=> b!115889 m!131555))

(declare-fun m!131889 () Bool)

(assert (=> b!115889 m!131889))

(assert (=> b!115889 m!131555))

(assert (=> b!115889 m!131697))

(assert (=> b!115889 m!131697))

(declare-fun m!131891 () Bool)

(assert (=> b!115889 m!131891))

(assert (=> b!115891 m!131555))

(assert (=> b!115891 m!131697))

(assert (=> b!115891 m!131697))

(assert (=> b!115891 m!131891))

(assert (=> b!115704 d!32517))

(assert (=> b!115717 d!32515))

(declare-fun d!32519 () Bool)

(assert (=> d!32519 (= (apply!104 (+!157 lt!60033 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60020) (apply!104 lt!60033 lt!60020))))

(declare-fun lt!60166 () Unit!3583)

(assert (=> d!32519 (= lt!60166 (choose!732 lt!60033 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60020))))

(declare-fun e!75635 () Bool)

(assert (=> d!32519 e!75635))

(declare-fun res!56818 () Bool)

(assert (=> d!32519 (=> (not res!56818) (not e!75635))))

(assert (=> d!32519 (= res!56818 (contains!848 lt!60033 lt!60020))))

(assert (=> d!32519 (= (addApplyDifferent!80 lt!60033 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60020) lt!60166)))

(declare-fun b!115892 () Bool)

(assert (=> b!115892 (= e!75635 (not (= lt!60020 lt!60038)))))

(assert (= (and d!32519 res!56818) b!115892))

(declare-fun m!131893 () Bool)

(assert (=> d!32519 m!131893))

(declare-fun m!131895 () Bool)

(assert (=> d!32519 m!131895))

(assert (=> d!32519 m!131587))

(assert (=> d!32519 m!131573))

(assert (=> d!32519 m!131581))

(assert (=> d!32519 m!131573))

(assert (=> b!115702 d!32519))

(declare-fun d!32521 () Bool)

(declare-fun e!75636 () Bool)

(assert (=> d!32521 e!75636))

(declare-fun res!56819 () Bool)

(assert (=> d!32521 (=> res!56819 e!75636)))

(declare-fun lt!60170 () Bool)

(assert (=> d!32521 (= res!56819 (not lt!60170))))

(declare-fun lt!60167 () Bool)

(assert (=> d!32521 (= lt!60170 lt!60167)))

(declare-fun lt!60169 () Unit!3583)

(declare-fun e!75637 () Unit!3583)

(assert (=> d!32521 (= lt!60169 e!75637)))

(declare-fun c!20567 () Bool)

(assert (=> d!32521 (= c!20567 lt!60167)))

(assert (=> d!32521 (= lt!60167 (containsKey!166 (toList!814 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60026))))

(assert (=> d!32521 (= (contains!848 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60026) lt!60170)))

(declare-fun b!115893 () Bool)

(declare-fun lt!60168 () Unit!3583)

(assert (=> b!115893 (= e!75637 lt!60168)))

(assert (=> b!115893 (= lt!60168 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60026))))

(assert (=> b!115893 (isDefined!115 (getValueByKey!163 (toList!814 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60026))))

(declare-fun b!115894 () Bool)

(declare-fun Unit!3591 () Unit!3583)

(assert (=> b!115894 (= e!75637 Unit!3591)))

(declare-fun b!115895 () Bool)

(assert (=> b!115895 (= e!75636 (isDefined!115 (getValueByKey!163 (toList!814 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60026)))))

(assert (= (and d!32521 c!20567) b!115893))

(assert (= (and d!32521 (not c!20567)) b!115894))

(assert (= (and d!32521 (not res!56819)) b!115895))

(declare-fun m!131897 () Bool)

(assert (=> d!32521 m!131897))

(declare-fun m!131899 () Bool)

(assert (=> b!115893 m!131899))

(declare-fun m!131901 () Bool)

(assert (=> b!115893 m!131901))

(assert (=> b!115893 m!131901))

(declare-fun m!131903 () Bool)

(assert (=> b!115893 m!131903))

(assert (=> b!115895 m!131901))

(assert (=> b!115895 m!131901))

(assert (=> b!115895 m!131903))

(assert (=> b!115702 d!32521))

(declare-fun d!32523 () Bool)

(assert (=> d!32523 (= (apply!104 (+!157 lt!60028 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60027) (apply!104 lt!60028 lt!60027))))

(declare-fun lt!60171 () Unit!3583)

(assert (=> d!32523 (= lt!60171 (choose!732 lt!60028 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60027))))

(declare-fun e!75638 () Bool)

(assert (=> d!32523 e!75638))

(declare-fun res!56820 () Bool)

(assert (=> d!32523 (=> (not res!56820) (not e!75638))))

(assert (=> d!32523 (= res!56820 (contains!848 lt!60028 lt!60027))))

(assert (=> d!32523 (= (addApplyDifferent!80 lt!60028 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60027) lt!60171)))

(declare-fun b!115896 () Bool)

(assert (=> b!115896 (= e!75638 (not (= lt!60027 lt!60018)))))

(assert (= (and d!32523 res!56820) b!115896))

(declare-fun m!131905 () Bool)

(assert (=> d!32523 m!131905))

(declare-fun m!131907 () Bool)

(assert (=> d!32523 m!131907))

(assert (=> d!32523 m!131577))

(assert (=> d!32523 m!131561))

(assert (=> d!32523 m!131563))

(assert (=> d!32523 m!131561))

(assert (=> b!115702 d!32523))

(declare-fun d!32525 () Bool)

(assert (=> d!32525 (= (apply!104 lt!60033 lt!60020) (get!1409 (getValueByKey!163 (toList!814 lt!60033) lt!60020)))))

(declare-fun bs!4718 () Bool)

(assert (= bs!4718 d!32525))

(declare-fun m!131909 () Bool)

(assert (=> bs!4718 m!131909))

(assert (=> bs!4718 m!131909))

(declare-fun m!131911 () Bool)

(assert (=> bs!4718 m!131911))

(assert (=> b!115702 d!32525))

(declare-fun d!32527 () Bool)

(declare-fun e!75639 () Bool)

(assert (=> d!32527 e!75639))

(declare-fun res!56822 () Bool)

(assert (=> d!32527 (=> (not res!56822) (not e!75639))))

(declare-fun lt!60172 () ListLongMap!1597)

(assert (=> d!32527 (= res!56822 (contains!848 lt!60172 (_1!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60173 () List!1651)

(assert (=> d!32527 (= lt!60172 (ListLongMap!1598 lt!60173))))

(declare-fun lt!60174 () Unit!3583)

(declare-fun lt!60175 () Unit!3583)

(assert (=> d!32527 (= lt!60174 lt!60175)))

(assert (=> d!32527 (= (getValueByKey!163 lt!60173 (_1!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32527 (= lt!60175 (lemmaContainsTupThenGetReturnValue!79 lt!60173 (_1!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32527 (= lt!60173 (insertStrictlySorted!82 (toList!814 lt!60033) (_1!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32527 (= (+!157 lt!60033 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60172)))

(declare-fun b!115897 () Bool)

(declare-fun res!56821 () Bool)

(assert (=> b!115897 (=> (not res!56821) (not e!75639))))

(assert (=> b!115897 (= res!56821 (= (getValueByKey!163 (toList!814 lt!60172) (_1!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115898 () Bool)

(assert (=> b!115898 (= e!75639 (contains!849 (toList!814 lt!60172) (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32527 res!56822) b!115897))

(assert (= (and b!115897 res!56821) b!115898))

(declare-fun m!131913 () Bool)

(assert (=> d!32527 m!131913))

(declare-fun m!131915 () Bool)

(assert (=> d!32527 m!131915))

(declare-fun m!131917 () Bool)

(assert (=> d!32527 m!131917))

(declare-fun m!131919 () Bool)

(assert (=> d!32527 m!131919))

(declare-fun m!131921 () Bool)

(assert (=> b!115897 m!131921))

(declare-fun m!131923 () Bool)

(assert (=> b!115898 m!131923))

(assert (=> b!115702 d!32527))

(declare-fun d!32529 () Bool)

(declare-fun e!75640 () Bool)

(assert (=> d!32529 e!75640))

(declare-fun res!56824 () Bool)

(assert (=> d!32529 (=> (not res!56824) (not e!75640))))

(declare-fun lt!60176 () ListLongMap!1597)

(assert (=> d!32529 (= res!56824 (contains!848 lt!60176 (_1!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60177 () List!1651)

(assert (=> d!32529 (= lt!60176 (ListLongMap!1598 lt!60177))))

(declare-fun lt!60178 () Unit!3583)

(declare-fun lt!60179 () Unit!3583)

(assert (=> d!32529 (= lt!60178 lt!60179)))

(assert (=> d!32529 (= (getValueByKey!163 lt!60177 (_1!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32529 (= lt!60179 (lemmaContainsTupThenGetReturnValue!79 lt!60177 (_1!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32529 (= lt!60177 (insertStrictlySorted!82 (toList!814 lt!60035) (_1!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32529 (= (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60176)))

(declare-fun b!115899 () Bool)

(declare-fun res!56823 () Bool)

(assert (=> b!115899 (=> (not res!56823) (not e!75640))))

(assert (=> b!115899 (= res!56823 (= (getValueByKey!163 (toList!814 lt!60176) (_1!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115900 () Bool)

(assert (=> b!115900 (= e!75640 (contains!849 (toList!814 lt!60176) (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32529 res!56824) b!115899))

(assert (= (and b!115899 res!56823) b!115900))

(declare-fun m!131925 () Bool)

(assert (=> d!32529 m!131925))

(declare-fun m!131927 () Bool)

(assert (=> d!32529 m!131927))

(declare-fun m!131929 () Bool)

(assert (=> d!32529 m!131929))

(declare-fun m!131931 () Bool)

(assert (=> d!32529 m!131931))

(declare-fun m!131933 () Bool)

(assert (=> b!115899 m!131933))

(declare-fun m!131935 () Bool)

(assert (=> b!115900 m!131935))

(assert (=> b!115702 d!32529))

(assert (=> b!115702 d!32471))

(declare-fun d!32531 () Bool)

(assert (=> d!32531 (= (apply!104 (+!157 lt!60033 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60020) (get!1409 (getValueByKey!163 (toList!814 (+!157 lt!60033 (tuple2!2471 lt!60038 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60020)))))

(declare-fun bs!4719 () Bool)

(assert (= bs!4719 d!32531))

(declare-fun m!131937 () Bool)

(assert (=> bs!4719 m!131937))

(assert (=> bs!4719 m!131937))

(declare-fun m!131939 () Bool)

(assert (=> bs!4719 m!131939))

(assert (=> b!115702 d!32531))

(declare-fun d!32533 () Bool)

(assert (=> d!32533 (= (apply!104 (+!157 lt!60030 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60024) (apply!104 lt!60030 lt!60024))))

(declare-fun lt!60180 () Unit!3583)

(assert (=> d!32533 (= lt!60180 (choose!732 lt!60030 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60024))))

(declare-fun e!75641 () Bool)

(assert (=> d!32533 e!75641))

(declare-fun res!56825 () Bool)

(assert (=> d!32533 (=> (not res!56825) (not e!75641))))

(assert (=> d!32533 (= res!56825 (contains!848 lt!60030 lt!60024))))

(assert (=> d!32533 (= (addApplyDifferent!80 lt!60030 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60024) lt!60180)))

(declare-fun b!115901 () Bool)

(assert (=> b!115901 (= e!75641 (not (= lt!60024 lt!60021)))))

(assert (= (and d!32533 res!56825) b!115901))

(declare-fun m!131941 () Bool)

(assert (=> d!32533 m!131941))

(declare-fun m!131943 () Bool)

(assert (=> d!32533 m!131943))

(assert (=> d!32533 m!131567))

(assert (=> d!32533 m!131557))

(assert (=> d!32533 m!131565))

(assert (=> d!32533 m!131557))

(assert (=> b!115702 d!32533))

(declare-fun d!32535 () Bool)

(assert (=> d!32535 (contains!848 (+!157 lt!60035 (tuple2!2471 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60026)))

(declare-fun lt!60181 () Unit!3583)

(assert (=> d!32535 (= lt!60181 (choose!733 lt!60035 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60026))))

(assert (=> d!32535 (contains!848 lt!60035 lt!60026)))

(assert (=> d!32535 (= (addStillContains!80 lt!60035 lt!60025 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))) lt!60026) lt!60181)))

(declare-fun bs!4720 () Bool)

(assert (= bs!4720 d!32535))

(assert (=> bs!4720 m!131575))

(assert (=> bs!4720 m!131575))

(assert (=> bs!4720 m!131583))

(declare-fun m!131945 () Bool)

(assert (=> bs!4720 m!131945))

(declare-fun m!131947 () Bool)

(assert (=> bs!4720 m!131947))

(assert (=> b!115702 d!32535))

(declare-fun d!32537 () Bool)

(assert (=> d!32537 (= (apply!104 lt!60028 lt!60027) (get!1409 (getValueByKey!163 (toList!814 lt!60028) lt!60027)))))

(declare-fun bs!4721 () Bool)

(assert (= bs!4721 d!32537))

(declare-fun m!131949 () Bool)

(assert (=> bs!4721 m!131949))

(assert (=> bs!4721 m!131949))

(declare-fun m!131951 () Bool)

(assert (=> bs!4721 m!131951))

(assert (=> b!115702 d!32537))

(declare-fun d!32539 () Bool)

(assert (=> d!32539 (= (apply!104 (+!157 lt!60028 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60027) (get!1409 (getValueByKey!163 (toList!814 (+!157 lt!60028 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60027)))))

(declare-fun bs!4722 () Bool)

(assert (= bs!4722 d!32539))

(declare-fun m!131953 () Bool)

(assert (=> bs!4722 m!131953))

(assert (=> bs!4722 m!131953))

(declare-fun m!131955 () Bool)

(assert (=> bs!4722 m!131955))

(assert (=> b!115702 d!32539))

(declare-fun d!32541 () Bool)

(declare-fun e!75642 () Bool)

(assert (=> d!32541 e!75642))

(declare-fun res!56827 () Bool)

(assert (=> d!32541 (=> (not res!56827) (not e!75642))))

(declare-fun lt!60182 () ListLongMap!1597)

(assert (=> d!32541 (= res!56827 (contains!848 lt!60182 (_1!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60183 () List!1651)

(assert (=> d!32541 (= lt!60182 (ListLongMap!1598 lt!60183))))

(declare-fun lt!60184 () Unit!3583)

(declare-fun lt!60185 () Unit!3583)

(assert (=> d!32541 (= lt!60184 lt!60185)))

(assert (=> d!32541 (= (getValueByKey!163 lt!60183 (_1!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32541 (= lt!60185 (lemmaContainsTupThenGetReturnValue!79 lt!60183 (_1!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32541 (= lt!60183 (insertStrictlySorted!82 (toList!814 lt!60030) (_1!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32541 (= (+!157 lt!60030 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60182)))

(declare-fun b!115902 () Bool)

(declare-fun res!56826 () Bool)

(assert (=> b!115902 (=> (not res!56826) (not e!75642))))

(assert (=> b!115902 (= res!56826 (= (getValueByKey!163 (toList!814 lt!60182) (_1!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115903 () Bool)

(assert (=> b!115903 (= e!75642 (contains!849 (toList!814 lt!60182) (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32541 res!56827) b!115902))

(assert (= (and b!115902 res!56826) b!115903))

(declare-fun m!131957 () Bool)

(assert (=> d!32541 m!131957))

(declare-fun m!131959 () Bool)

(assert (=> d!32541 m!131959))

(declare-fun m!131961 () Bool)

(assert (=> d!32541 m!131961))

(declare-fun m!131963 () Bool)

(assert (=> d!32541 m!131963))

(declare-fun m!131965 () Bool)

(assert (=> b!115902 m!131965))

(declare-fun m!131967 () Bool)

(assert (=> b!115903 m!131967))

(assert (=> b!115702 d!32541))

(declare-fun d!32543 () Bool)

(assert (=> d!32543 (= (apply!104 (+!157 lt!60030 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60024) (get!1409 (getValueByKey!163 (toList!814 (+!157 lt!60030 (tuple2!2471 lt!60021 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60024)))))

(declare-fun bs!4723 () Bool)

(assert (= bs!4723 d!32543))

(declare-fun m!131969 () Bool)

(assert (=> bs!4723 m!131969))

(assert (=> bs!4723 m!131969))

(declare-fun m!131971 () Bool)

(assert (=> bs!4723 m!131971))

(assert (=> b!115702 d!32543))

(declare-fun d!32545 () Bool)

(declare-fun e!75643 () Bool)

(assert (=> d!32545 e!75643))

(declare-fun res!56829 () Bool)

(assert (=> d!32545 (=> (not res!56829) (not e!75643))))

(declare-fun lt!60186 () ListLongMap!1597)

(assert (=> d!32545 (= res!56829 (contains!848 lt!60186 (_1!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60187 () List!1651)

(assert (=> d!32545 (= lt!60186 (ListLongMap!1598 lt!60187))))

(declare-fun lt!60188 () Unit!3583)

(declare-fun lt!60189 () Unit!3583)

(assert (=> d!32545 (= lt!60188 lt!60189)))

(assert (=> d!32545 (= (getValueByKey!163 lt!60187 (_1!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32545 (= lt!60189 (lemmaContainsTupThenGetReturnValue!79 lt!60187 (_1!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32545 (= lt!60187 (insertStrictlySorted!82 (toList!814 lt!60028) (_1!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32545 (= (+!157 lt!60028 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60186)))

(declare-fun b!115904 () Bool)

(declare-fun res!56828 () Bool)

(assert (=> b!115904 (=> (not res!56828) (not e!75643))))

(assert (=> b!115904 (= res!56828 (= (getValueByKey!163 (toList!814 lt!60186) (_1!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115905 () Bool)

(assert (=> b!115905 (= e!75643 (contains!849 (toList!814 lt!60186) (tuple2!2471 lt!60018 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32545 res!56829) b!115904))

(assert (= (and b!115904 res!56828) b!115905))

(declare-fun m!131973 () Bool)

(assert (=> d!32545 m!131973))

(declare-fun m!131975 () Bool)

(assert (=> d!32545 m!131975))

(declare-fun m!131977 () Bool)

(assert (=> d!32545 m!131977))

(declare-fun m!131979 () Bool)

(assert (=> d!32545 m!131979))

(declare-fun m!131981 () Bool)

(assert (=> b!115904 m!131981))

(declare-fun m!131983 () Bool)

(assert (=> b!115905 m!131983))

(assert (=> b!115702 d!32545))

(declare-fun d!32547 () Bool)

(assert (=> d!32547 (= (apply!104 lt!60030 lt!60024) (get!1409 (getValueByKey!163 (toList!814 lt!60030) lt!60024)))))

(declare-fun bs!4724 () Bool)

(assert (= bs!4724 d!32547))

(declare-fun m!131985 () Bool)

(assert (=> bs!4724 m!131985))

(assert (=> bs!4724 m!131985))

(declare-fun m!131987 () Bool)

(assert (=> bs!4724 m!131987))

(assert (=> b!115702 d!32547))

(declare-fun d!32549 () Bool)

(declare-fun e!75644 () Bool)

(assert (=> d!32549 e!75644))

(declare-fun res!56831 () Bool)

(assert (=> d!32549 (=> (not res!56831) (not e!75644))))

(declare-fun lt!60190 () ListLongMap!1597)

(assert (=> d!32549 (= res!56831 (contains!848 lt!60190 (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60191 () List!1651)

(assert (=> d!32549 (= lt!60190 (ListLongMap!1598 lt!60191))))

(declare-fun lt!60192 () Unit!3583)

(declare-fun lt!60193 () Unit!3583)

(assert (=> d!32549 (= lt!60192 lt!60193)))

(assert (=> d!32549 (= (getValueByKey!163 lt!60191 (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32549 (= lt!60193 (lemmaContainsTupThenGetReturnValue!79 lt!60191 (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32549 (= lt!60191 (insertStrictlySorted!82 (toList!814 call!12377) (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32549 (= (+!157 call!12377 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))) lt!60190)))

(declare-fun b!115906 () Bool)

(declare-fun res!56830 () Bool)

(assert (=> b!115906 (=> (not res!56830) (not e!75644))))

(assert (=> b!115906 (= res!56830 (= (getValueByKey!163 (toList!814 lt!60190) (_1!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (Some!168 (_2!1246 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115907 () Bool)

(assert (=> b!115907 (= e!75644 (contains!849 (toList!814 lt!60190) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32549 res!56831) b!115906))

(assert (= (and b!115906 res!56830) b!115907))

(declare-fun m!131989 () Bool)

(assert (=> d!32549 m!131989))

(declare-fun m!131991 () Bool)

(assert (=> d!32549 m!131991))

(declare-fun m!131993 () Bool)

(assert (=> d!32549 m!131993))

(declare-fun m!131995 () Bool)

(assert (=> d!32549 m!131995))

(declare-fun m!131997 () Bool)

(assert (=> b!115906 m!131997))

(declare-fun m!131999 () Bool)

(assert (=> b!115907 m!131999))

(assert (=> b!115734 d!32549))

(declare-fun d!32551 () Bool)

(declare-fun e!75645 () Bool)

(assert (=> d!32551 e!75645))

(declare-fun res!56832 () Bool)

(assert (=> d!32551 (=> res!56832 e!75645)))

(declare-fun lt!60197 () Bool)

(assert (=> d!32551 (= res!56832 (not lt!60197))))

(declare-fun lt!60194 () Bool)

(assert (=> d!32551 (= lt!60197 lt!60194)))

(declare-fun lt!60196 () Unit!3583)

(declare-fun e!75646 () Unit!3583)

(assert (=> d!32551 (= lt!60196 e!75646)))

(declare-fun c!20568 () Bool)

(assert (=> d!32551 (= c!20568 lt!60194)))

(assert (=> d!32551 (= lt!60194 (containsKey!166 (toList!814 lt!60029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32551 (= (contains!848 lt!60029 #b1000000000000000000000000000000000000000000000000000000000000000) lt!60197)))

(declare-fun b!115908 () Bool)

(declare-fun lt!60195 () Unit!3583)

(assert (=> b!115908 (= e!75646 lt!60195)))

(assert (=> b!115908 (= lt!60195 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 lt!60029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115908 (isDefined!115 (getValueByKey!163 (toList!814 lt!60029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115909 () Bool)

(declare-fun Unit!3592 () Unit!3583)

(assert (=> b!115909 (= e!75646 Unit!3592)))

(declare-fun b!115910 () Bool)

(assert (=> b!115910 (= e!75645 (isDefined!115 (getValueByKey!163 (toList!814 lt!60029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32551 c!20568) b!115908))

(assert (= (and d!32551 (not c!20568)) b!115909))

(assert (= (and d!32551 (not res!56832)) b!115910))

(declare-fun m!132001 () Bool)

(assert (=> d!32551 m!132001))

(declare-fun m!132003 () Bool)

(assert (=> b!115908 m!132003))

(assert (=> b!115908 m!131783))

(assert (=> b!115908 m!131783))

(declare-fun m!132005 () Bool)

(assert (=> b!115908 m!132005))

(assert (=> b!115910 m!131783))

(assert (=> b!115910 m!131783))

(assert (=> b!115910 m!132005))

(assert (=> bm!12362 d!32551))

(declare-fun d!32553 () Bool)

(declare-fun e!75647 () Bool)

(assert (=> d!32553 e!75647))

(declare-fun res!56833 () Bool)

(assert (=> d!32553 (=> res!56833 e!75647)))

(declare-fun lt!60201 () Bool)

(assert (=> d!32553 (= res!56833 (not lt!60201))))

(declare-fun lt!60198 () Bool)

(assert (=> d!32553 (= lt!60201 lt!60198)))

(declare-fun lt!60200 () Unit!3583)

(declare-fun e!75648 () Unit!3583)

(assert (=> d!32553 (= lt!60200 e!75648)))

(declare-fun c!20569 () Bool)

(assert (=> d!32553 (= c!20569 lt!60198)))

(assert (=> d!32553 (= lt!60198 (containsKey!166 (toList!814 lt!60051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32553 (= (contains!848 lt!60051 #b0000000000000000000000000000000000000000000000000000000000000000) lt!60201)))

(declare-fun b!115911 () Bool)

(declare-fun lt!60199 () Unit!3583)

(assert (=> b!115911 (= e!75648 lt!60199)))

(assert (=> b!115911 (= lt!60199 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 lt!60051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115911 (isDefined!115 (getValueByKey!163 (toList!814 lt!60051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115912 () Bool)

(declare-fun Unit!3593 () Unit!3583)

(assert (=> b!115912 (= e!75648 Unit!3593)))

(declare-fun b!115913 () Bool)

(assert (=> b!115913 (= e!75647 (isDefined!115 (getValueByKey!163 (toList!814 lt!60051) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32553 c!20569) b!115911))

(assert (= (and d!32553 (not c!20569)) b!115912))

(assert (= (and d!32553 (not res!56833)) b!115913))

(declare-fun m!132007 () Bool)

(assert (=> d!32553 m!132007))

(declare-fun m!132009 () Bool)

(assert (=> b!115911 m!132009))

(declare-fun m!132011 () Bool)

(assert (=> b!115911 m!132011))

(assert (=> b!115911 m!132011))

(declare-fun m!132013 () Bool)

(assert (=> b!115911 m!132013))

(assert (=> b!115913 m!132011))

(assert (=> b!115913 m!132011))

(assert (=> b!115913 m!132013))

(assert (=> bm!12374 d!32553))

(assert (=> d!32447 d!32473))

(declare-fun d!32555 () Bool)

(declare-fun e!75649 () Bool)

(assert (=> d!32555 e!75649))

(declare-fun res!56834 () Bool)

(assert (=> d!32555 (=> res!56834 e!75649)))

(declare-fun lt!60205 () Bool)

(assert (=> d!32555 (= res!56834 (not lt!60205))))

(declare-fun lt!60202 () Bool)

(assert (=> d!32555 (= lt!60205 lt!60202)))

(declare-fun lt!60204 () Unit!3583)

(declare-fun e!75650 () Unit!3583)

(assert (=> d!32555 (= lt!60204 e!75650)))

(declare-fun c!20570 () Bool)

(assert (=> d!32555 (= c!20570 lt!60202)))

(assert (=> d!32555 (= lt!60202 (containsKey!166 (toList!814 lt!60029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32555 (= (contains!848 lt!60029 #b0000000000000000000000000000000000000000000000000000000000000000) lt!60205)))

(declare-fun b!115914 () Bool)

(declare-fun lt!60203 () Unit!3583)

(assert (=> b!115914 (= e!75650 lt!60203)))

(assert (=> b!115914 (= lt!60203 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!814 lt!60029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115914 (isDefined!115 (getValueByKey!163 (toList!814 lt!60029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115915 () Bool)

(declare-fun Unit!3594 () Unit!3583)

(assert (=> b!115915 (= e!75650 Unit!3594)))

(declare-fun b!115916 () Bool)

(assert (=> b!115916 (= e!75649 (isDefined!115 (getValueByKey!163 (toList!814 lt!60029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32555 c!20570) b!115914))

(assert (= (and d!32555 (not c!20570)) b!115915))

(assert (= (and d!32555 (not res!56834)) b!115916))

(declare-fun m!132015 () Bool)

(assert (=> d!32555 m!132015))

(declare-fun m!132017 () Bool)

(assert (=> b!115914 m!132017))

(assert (=> b!115914 m!131681))

(assert (=> b!115914 m!131681))

(declare-fun m!132019 () Bool)

(assert (=> b!115914 m!132019))

(assert (=> b!115916 m!131681))

(assert (=> b!115916 m!131681))

(assert (=> b!115916 m!132019))

(assert (=> bm!12367 d!32555))

(declare-fun b!115917 () Bool)

(declare-fun e!75660 () Bool)

(declare-fun lt!60217 () ListLongMap!1597)

(assert (=> b!115917 (= e!75660 (= (apply!104 lt!60217 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2573 newMap!16)))))

(declare-fun b!115918 () Bool)

(declare-fun e!75656 () Bool)

(assert (=> b!115918 (= e!75656 (= (apply!104 lt!60217 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)) (get!1408 (select (arr!2151 (_values!2689 newMap!16)) #b00000000000000000000000000000000) (dynLambda!408 (defaultEntry!2706 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2411 (_values!2689 newMap!16))))))

(assert (=> b!115918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(declare-fun bm!12388 () Bool)

(declare-fun call!12395 () ListLongMap!1597)

(declare-fun call!12393 () ListLongMap!1597)

(assert (=> bm!12388 (= call!12395 call!12393)))

(declare-fun b!115919 () Bool)

(declare-fun e!75659 () Bool)

(assert (=> b!115919 (= e!75659 (validKeyInArray!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115920 () Bool)

(declare-fun e!75662 () Unit!3583)

(declare-fun Unit!3595 () Unit!3583)

(assert (=> b!115920 (= e!75662 Unit!3595)))

(declare-fun b!115921 () Bool)

(declare-fun e!75652 () Bool)

(assert (=> b!115921 (= e!75652 (validKeyInArray!0 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115922 () Bool)

(declare-fun e!75663 () Bool)

(declare-fun call!12391 () Bool)

(assert (=> b!115922 (= e!75663 (not call!12391))))

(declare-fun b!115923 () Bool)

(declare-fun c!20573 () Bool)

(assert (=> b!115923 (= c!20573 (and (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75653 () ListLongMap!1597)

(declare-fun e!75651 () ListLongMap!1597)

(assert (=> b!115923 (= e!75653 e!75651)))

(declare-fun b!115924 () Bool)

(declare-fun e!75661 () Bool)

(assert (=> b!115924 (= e!75661 e!75663)))

(declare-fun c!20574 () Bool)

(assert (=> b!115924 (= c!20574 (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115925 () Bool)

(declare-fun res!56842 () Bool)

(assert (=> b!115925 (=> (not res!56842) (not e!75661))))

(declare-fun e!75658 () Bool)

(assert (=> b!115925 (= res!56842 e!75658)))

(declare-fun c!20576 () Bool)

(assert (=> b!115925 (= c!20576 (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!115927 () Bool)

(declare-fun lt!60225 () Unit!3583)

(assert (=> b!115927 (= e!75662 lt!60225)))

(declare-fun lt!60223 () ListLongMap!1597)

(assert (=> b!115927 (= lt!60223 (getCurrentListMapNoExtraKeys!124 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60213 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60214 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60214 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60207 () Unit!3583)

(assert (=> b!115927 (= lt!60207 (addStillContains!80 lt!60223 lt!60213 (zeroValue!2573 newMap!16) lt!60214))))

(assert (=> b!115927 (contains!848 (+!157 lt!60223 (tuple2!2471 lt!60213 (zeroValue!2573 newMap!16))) lt!60214)))

(declare-fun lt!60219 () Unit!3583)

(assert (=> b!115927 (= lt!60219 lt!60207)))

(declare-fun lt!60221 () ListLongMap!1597)

(assert (=> b!115927 (= lt!60221 (getCurrentListMapNoExtraKeys!124 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60226 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60226 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60208 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60208 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60224 () Unit!3583)

(assert (=> b!115927 (= lt!60224 (addApplyDifferent!80 lt!60221 lt!60226 (minValue!2573 newMap!16) lt!60208))))

(assert (=> b!115927 (= (apply!104 (+!157 lt!60221 (tuple2!2471 lt!60226 (minValue!2573 newMap!16))) lt!60208) (apply!104 lt!60221 lt!60208))))

(declare-fun lt!60227 () Unit!3583)

(assert (=> b!115927 (= lt!60227 lt!60224)))

(declare-fun lt!60218 () ListLongMap!1597)

(assert (=> b!115927 (= lt!60218 (getCurrentListMapNoExtraKeys!124 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60209 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60212 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60212 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60210 () Unit!3583)

(assert (=> b!115927 (= lt!60210 (addApplyDifferent!80 lt!60218 lt!60209 (zeroValue!2573 newMap!16) lt!60212))))

(assert (=> b!115927 (= (apply!104 (+!157 lt!60218 (tuple2!2471 lt!60209 (zeroValue!2573 newMap!16))) lt!60212) (apply!104 lt!60218 lt!60212))))

(declare-fun lt!60211 () Unit!3583)

(assert (=> b!115927 (= lt!60211 lt!60210)))

(declare-fun lt!60216 () ListLongMap!1597)

(assert (=> b!115927 (= lt!60216 (getCurrentListMapNoExtraKeys!124 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun lt!60206 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60215 () (_ BitVec 64))

(assert (=> b!115927 (= lt!60215 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115927 (= lt!60225 (addApplyDifferent!80 lt!60216 lt!60206 (minValue!2573 newMap!16) lt!60215))))

(assert (=> b!115927 (= (apply!104 (+!157 lt!60216 (tuple2!2471 lt!60206 (minValue!2573 newMap!16))) lt!60215) (apply!104 lt!60216 lt!60215))))

(declare-fun b!115928 () Bool)

(assert (=> b!115928 (= e!75651 call!12395)))

(declare-fun b!115929 () Bool)

(declare-fun e!75654 () Bool)

(assert (=> b!115929 (= e!75654 e!75656)))

(declare-fun res!56839 () Bool)

(assert (=> b!115929 (=> (not res!56839) (not e!75656))))

(assert (=> b!115929 (= res!56839 (contains!848 lt!60217 (select (arr!2150 (_keys!4428 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!115929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(declare-fun b!115930 () Bool)

(assert (=> b!115930 (= e!75663 e!75660)))

(declare-fun res!56843 () Bool)

(assert (=> b!115930 (= res!56843 call!12391)))

(assert (=> b!115930 (=> (not res!56843) (not e!75660))))

(declare-fun bm!12389 () Bool)

(assert (=> bm!12389 (= call!12391 (contains!848 lt!60217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115931 () Bool)

(declare-fun call!12394 () Bool)

(assert (=> b!115931 (= e!75658 (not call!12394))))

(declare-fun bm!12390 () Bool)

(declare-fun call!12396 () ListLongMap!1597)

(assert (=> bm!12390 (= call!12393 call!12396)))

(declare-fun bm!12391 () Bool)

(assert (=> bm!12391 (= call!12396 (getCurrentListMapNoExtraKeys!124 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)))))

(declare-fun d!32557 () Bool)

(assert (=> d!32557 e!75661))

(declare-fun res!56841 () Bool)

(assert (=> d!32557 (=> (not res!56841) (not e!75661))))

(assert (=> d!32557 (= res!56841 (or (bvsge #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))))

(declare-fun lt!60220 () ListLongMap!1597)

(assert (=> d!32557 (= lt!60217 lt!60220)))

(declare-fun lt!60222 () Unit!3583)

(assert (=> d!32557 (= lt!60222 e!75662)))

(declare-fun c!20571 () Bool)

(assert (=> d!32557 (= c!20571 e!75659)))

(declare-fun res!56836 () Bool)

(assert (=> d!32557 (=> (not res!56836) (not e!75659))))

(assert (=> d!32557 (= res!56836 (bvslt #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(declare-fun e!75657 () ListLongMap!1597)

(assert (=> d!32557 (= lt!60220 e!75657)))

(declare-fun c!20575 () Bool)

(assert (=> d!32557 (= c!20575 (and (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32557 (validMask!0 (mask!6916 newMap!16))))

(assert (=> d!32557 (= (getCurrentListMap!495 (_keys!4428 newMap!16) (_values!2689 newMap!16) (mask!6916 newMap!16) (extraKeys!2495 newMap!16) (zeroValue!2573 newMap!16) (minValue!2573 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2706 newMap!16)) lt!60217)))

(declare-fun b!115926 () Bool)

(declare-fun e!75655 () Bool)

(assert (=> b!115926 (= e!75658 e!75655)))

(declare-fun res!56835 () Bool)

(assert (=> b!115926 (= res!56835 call!12394)))

(assert (=> b!115926 (=> (not res!56835) (not e!75655))))

(declare-fun b!115932 () Bool)

(declare-fun call!12392 () ListLongMap!1597)

(assert (=> b!115932 (= e!75653 call!12392)))

(declare-fun bm!12392 () Bool)

(declare-fun call!12397 () ListLongMap!1597)

(assert (=> bm!12392 (= call!12392 call!12397)))

(declare-fun b!115933 () Bool)

(declare-fun res!56837 () Bool)

(assert (=> b!115933 (=> (not res!56837) (not e!75661))))

(assert (=> b!115933 (= res!56837 e!75654)))

(declare-fun res!56840 () Bool)

(assert (=> b!115933 (=> res!56840 e!75654)))

(assert (=> b!115933 (= res!56840 (not e!75652))))

(declare-fun res!56838 () Bool)

(assert (=> b!115933 (=> (not res!56838) (not e!75652))))

(assert (=> b!115933 (= res!56838 (bvslt #b00000000000000000000000000000000 (size!2410 (_keys!4428 newMap!16))))))

(declare-fun c!20572 () Bool)

(declare-fun bm!12393 () Bool)

(assert (=> bm!12393 (= call!12397 (+!157 (ite c!20575 call!12396 (ite c!20572 call!12393 call!12395)) (ite (or c!20575 c!20572) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 newMap!16)) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 newMap!16)))))))

(declare-fun b!115934 () Bool)

(assert (=> b!115934 (= e!75655 (= (apply!104 lt!60217 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2573 newMap!16)))))

(declare-fun b!115935 () Bool)

(assert (=> b!115935 (= e!75651 call!12392)))

(declare-fun b!115936 () Bool)

(assert (=> b!115936 (= e!75657 (+!157 call!12397 (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 newMap!16))))))

(declare-fun b!115937 () Bool)

(assert (=> b!115937 (= e!75657 e!75653)))

(assert (=> b!115937 (= c!20572 (and (not (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2495 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12394 () Bool)

(assert (=> bm!12394 (= call!12394 (contains!848 lt!60217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!32557 c!20575) b!115936))

(assert (= (and d!32557 (not c!20575)) b!115937))

(assert (= (and b!115937 c!20572) b!115932))

(assert (= (and b!115937 (not c!20572)) b!115923))

(assert (= (and b!115923 c!20573) b!115935))

(assert (= (and b!115923 (not c!20573)) b!115928))

(assert (= (or b!115935 b!115928) bm!12388))

(assert (= (or b!115932 bm!12388) bm!12390))

(assert (= (or b!115932 b!115935) bm!12392))

(assert (= (or b!115936 bm!12390) bm!12391))

(assert (= (or b!115936 bm!12392) bm!12393))

(assert (= (and d!32557 res!56836) b!115919))

(assert (= (and d!32557 c!20571) b!115927))

(assert (= (and d!32557 (not c!20571)) b!115920))

(assert (= (and d!32557 res!56841) b!115933))

(assert (= (and b!115933 res!56838) b!115921))

(assert (= (and b!115933 (not res!56840)) b!115929))

(assert (= (and b!115929 res!56839) b!115918))

(assert (= (and b!115933 res!56837) b!115925))

(assert (= (and b!115925 c!20576) b!115926))

(assert (= (and b!115925 (not c!20576)) b!115931))

(assert (= (and b!115926 res!56835) b!115934))

(assert (= (or b!115926 b!115931) bm!12394))

(assert (= (and b!115925 res!56842) b!115924))

(assert (= (and b!115924 c!20574) b!115930))

(assert (= (and b!115924 (not c!20574)) b!115922))

(assert (= (and b!115930 res!56843) b!115917))

(assert (= (or b!115930 b!115922) bm!12389))

(declare-fun b_lambda!5157 () Bool)

(assert (=> (not b_lambda!5157) (not b!115918)))

(declare-fun t!5909 () Bool)

(declare-fun tb!2221 () Bool)

(assert (=> (and b!115540 (= (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) (defaultEntry!2706 newMap!16)) t!5909) tb!2221))

(declare-fun result!3707 () Bool)

(assert (=> tb!2221 (= result!3707 tp_is_empty!2773)))

(assert (=> b!115918 t!5909))

(declare-fun b_and!7213 () Bool)

(assert (= b_and!7209 (and (=> t!5909 result!3707) b_and!7213)))

(declare-fun t!5911 () Bool)

(declare-fun tb!2223 () Bool)

(assert (=> (and b!115550 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 newMap!16)) t!5911) tb!2223))

(declare-fun result!3709 () Bool)

(assert (= result!3709 result!3707))

(assert (=> b!115918 t!5911))

(declare-fun b_and!7215 () Bool)

(assert (= b_and!7211 (and (=> t!5911 result!3709) b_and!7215)))

(declare-fun m!132021 () Bool)

(assert (=> bm!12394 m!132021))

(declare-fun m!132023 () Bool)

(assert (=> bm!12393 m!132023))

(assert (=> b!115927 m!131737))

(declare-fun m!132025 () Bool)

(assert (=> b!115927 m!132025))

(declare-fun m!132027 () Bool)

(assert (=> b!115927 m!132027))

(declare-fun m!132029 () Bool)

(assert (=> b!115927 m!132029))

(declare-fun m!132031 () Bool)

(assert (=> b!115927 m!132031))

(assert (=> b!115927 m!132025))

(declare-fun m!132033 () Bool)

(assert (=> b!115927 m!132033))

(declare-fun m!132035 () Bool)

(assert (=> b!115927 m!132035))

(declare-fun m!132037 () Bool)

(assert (=> b!115927 m!132037))

(declare-fun m!132039 () Bool)

(assert (=> b!115927 m!132039))

(declare-fun m!132041 () Bool)

(assert (=> b!115927 m!132041))

(declare-fun m!132043 () Bool)

(assert (=> b!115927 m!132043))

(declare-fun m!132045 () Bool)

(assert (=> b!115927 m!132045))

(assert (=> b!115927 m!132029))

(declare-fun m!132047 () Bool)

(assert (=> b!115927 m!132047))

(assert (=> b!115927 m!132041))

(declare-fun m!132049 () Bool)

(assert (=> b!115927 m!132049))

(assert (=> b!115927 m!132043))

(declare-fun m!132051 () Bool)

(assert (=> b!115927 m!132051))

(declare-fun m!132053 () Bool)

(assert (=> b!115927 m!132053))

(declare-fun m!132055 () Bool)

(assert (=> b!115927 m!132055))

(assert (=> b!115921 m!131737))

(assert (=> b!115921 m!131737))

(assert (=> b!115921 m!131739))

(assert (=> d!32557 m!131773))

(declare-fun m!132057 () Bool)

(assert (=> b!115917 m!132057))

(assert (=> bm!12391 m!132039))

(assert (=> b!115918 m!131737))

(declare-fun m!132059 () Bool)

(assert (=> b!115918 m!132059))

(declare-fun m!132061 () Bool)

(assert (=> b!115918 m!132061))

(assert (=> b!115918 m!132061))

(assert (=> b!115918 m!132059))

(declare-fun m!132063 () Bool)

(assert (=> b!115918 m!132063))

(assert (=> b!115918 m!131737))

(declare-fun m!132065 () Bool)

(assert (=> b!115918 m!132065))

(declare-fun m!132067 () Bool)

(assert (=> bm!12389 m!132067))

(assert (=> b!115919 m!131737))

(assert (=> b!115919 m!131737))

(assert (=> b!115919 m!131739))

(assert (=> b!115929 m!131737))

(assert (=> b!115929 m!131737))

(declare-fun m!132069 () Bool)

(assert (=> b!115929 m!132069))

(declare-fun m!132071 () Bool)

(assert (=> b!115934 m!132071))

(declare-fun m!132073 () Bool)

(assert (=> b!115936 m!132073))

(assert (=> d!32445 d!32557))

(declare-fun d!32559 () Bool)

(assert (=> d!32559 (= (apply!104 lt!60051 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1409 (getValueByKey!163 (toList!814 lt!60051) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4725 () Bool)

(assert (= bs!4725 d!32559))

(assert (=> bs!4725 m!132011))

(assert (=> bs!4725 m!132011))

(declare-fun m!132075 () Bool)

(assert (=> bs!4725 m!132075))

(assert (=> b!115732 d!32559))

(declare-fun d!32561 () Bool)

(assert (=> d!32561 (= (apply!104 lt!60051 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1409 (getValueByKey!163 (toList!814 lt!60051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4726 () Bool)

(assert (= bs!4726 d!32561))

(assert (=> bs!4726 m!131677))

(assert (=> bs!4726 m!131677))

(declare-fun m!132077 () Bool)

(assert (=> bs!4726 m!132077))

(assert (=> b!115715 d!32561))

(declare-fun d!32563 () Bool)

(assert (=> d!32563 (= (apply!104 lt!60051 (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1409 (getValueByKey!163 (toList!814 lt!60051) (select (arr!2150 (_keys!4428 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4727 () Bool)

(assert (= bs!4727 d!32563))

(assert (=> bs!4727 m!131617))

(assert (=> bs!4727 m!131779))

(assert (=> bs!4727 m!131779))

(declare-fun m!132079 () Bool)

(assert (=> bs!4727 m!132079))

(assert (=> b!115716 d!32563))

(declare-fun d!32565 () Bool)

(declare-fun c!20577 () Bool)

(assert (=> d!32565 (= c!20577 ((_ is ValueCellFull!1043) (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!75664 () V!3345)

(assert (=> d!32565 (= (get!1408 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!75664)))

(declare-fun b!115938 () Bool)

(assert (=> b!115938 (= e!75664 (get!1410 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115939 () Bool)

(assert (=> b!115939 (= e!75664 (get!1411 (select (arr!2151 (_values!2689 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!408 (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32565 c!20577) b!115938))

(assert (= (and d!32565 (not c!20577)) b!115939))

(assert (=> b!115938 m!131655))

(assert (=> b!115938 m!131595))

(declare-fun m!132081 () Bool)

(assert (=> b!115938 m!132081))

(assert (=> b!115939 m!131655))

(assert (=> b!115939 m!131595))

(declare-fun m!132083 () Bool)

(assert (=> b!115939 m!132083))

(assert (=> b!115716 d!32565))

(declare-fun d!32567 () Bool)

(declare-fun res!56844 () Bool)

(declare-fun e!75665 () Bool)

(assert (=> d!32567 (=> (not res!56844) (not e!75665))))

(assert (=> d!32567 (= res!56844 (simpleValid!80 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32567 (= (valid!477 (v!3033 (underlying!408 thiss!992))) e!75665)))

(declare-fun b!115940 () Bool)

(declare-fun res!56845 () Bool)

(assert (=> b!115940 (=> (not res!56845) (not e!75665))))

(assert (=> b!115940 (= res!56845 (= (arrayCountValidKeys!0 (_keys!4428 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000000 (size!2410 (_keys!4428 (v!3033 (underlying!408 thiss!992))))) (_size!546 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115941 () Bool)

(declare-fun res!56846 () Bool)

(assert (=> b!115941 (=> (not res!56846) (not e!75665))))

(assert (=> b!115941 (= res!56846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4428 (v!3033 (underlying!408 thiss!992))) (mask!6916 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115942 () Bool)

(assert (=> b!115942 (= e!75665 (arrayNoDuplicates!0 (_keys!4428 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000000 Nil!1650))))

(assert (= (and d!32567 res!56844) b!115940))

(assert (= (and b!115940 res!56845) b!115941))

(assert (= (and b!115941 res!56846) b!115942))

(declare-fun m!132085 () Bool)

(assert (=> d!32567 m!132085))

(declare-fun m!132087 () Bool)

(assert (=> b!115940 m!132087))

(declare-fun m!132089 () Bool)

(assert (=> b!115941 m!132089))

(declare-fun m!132091 () Bool)

(assert (=> b!115942 m!132091))

(assert (=> d!32435 d!32567))

(declare-fun d!32569 () Bool)

(declare-fun e!75666 () Bool)

(assert (=> d!32569 e!75666))

(declare-fun res!56848 () Bool)

(assert (=> d!32569 (=> (not res!56848) (not e!75666))))

(declare-fun lt!60228 () ListLongMap!1597)

(assert (=> d!32569 (= res!56848 (contains!848 lt!60228 (_1!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60229 () List!1651)

(assert (=> d!32569 (= lt!60228 (ListLongMap!1598 lt!60229))))

(declare-fun lt!60230 () Unit!3583)

(declare-fun lt!60231 () Unit!3583)

(assert (=> d!32569 (= lt!60230 lt!60231)))

(assert (=> d!32569 (= (getValueByKey!163 lt!60229 (_1!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))) (Some!168 (_2!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32569 (= lt!60231 (lemmaContainsTupThenGetReturnValue!79 lt!60229 (_1!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (_2!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32569 (= lt!60229 (insertStrictlySorted!82 (toList!814 (ite c!20528 call!12376 (ite c!20525 call!12373 call!12375))) (_1!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) (_2!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32569 (= (+!157 (ite c!20528 call!12376 (ite c!20525 call!12373 call!12375)) (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))) lt!60228)))

(declare-fun b!115943 () Bool)

(declare-fun res!56847 () Bool)

(assert (=> b!115943 (=> (not res!56847) (not e!75666))))

(assert (=> b!115943 (= res!56847 (= (getValueByKey!163 (toList!814 lt!60228) (_1!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992))))))) (Some!168 (_2!1246 (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))))

(declare-fun b!115944 () Bool)

(assert (=> b!115944 (= e!75666 (contains!849 (toList!814 lt!60228) (ite (or c!20528 c!20525) (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2573 (v!3033 (underlying!408 thiss!992)))) (tuple2!2471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2573 (v!3033 (underlying!408 thiss!992)))))))))

(assert (= (and d!32569 res!56848) b!115943))

(assert (= (and b!115943 res!56847) b!115944))

(declare-fun m!132093 () Bool)

(assert (=> d!32569 m!132093))

(declare-fun m!132095 () Bool)

(assert (=> d!32569 m!132095))

(declare-fun m!132097 () Bool)

(assert (=> d!32569 m!132097))

(declare-fun m!132099 () Bool)

(assert (=> d!32569 m!132099))

(declare-fun m!132101 () Bool)

(assert (=> b!115943 m!132101))

(declare-fun m!132103 () Bool)

(assert (=> b!115944 m!132103))

(assert (=> bm!12373 d!32569))

(declare-fun b!115945 () Bool)

(declare-fun e!75668 () Bool)

(assert (=> b!115945 (= e!75668 tp_is_empty!2773)))

(declare-fun b!115946 () Bool)

(declare-fun e!75667 () Bool)

(assert (=> b!115946 (= e!75667 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4269 () Bool)

(declare-fun mapRes!4269 () Bool)

(assert (=> mapIsEmpty!4269 mapRes!4269))

(declare-fun mapNonEmpty!4269 () Bool)

(declare-fun tp!10533 () Bool)

(assert (=> mapNonEmpty!4269 (= mapRes!4269 (and tp!10533 e!75668))))

(declare-fun mapKey!4269 () (_ BitVec 32))

(declare-fun mapRest!4269 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapValue!4269 () ValueCell!1043)

(assert (=> mapNonEmpty!4269 (= mapRest!4267 (store mapRest!4269 mapKey!4269 mapValue!4269))))

(declare-fun condMapEmpty!4269 () Bool)

(declare-fun mapDefault!4269 () ValueCell!1043)

(assert (=> mapNonEmpty!4267 (= condMapEmpty!4269 (= mapRest!4267 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4269)))))

(assert (=> mapNonEmpty!4267 (= tp!10531 (and e!75667 mapRes!4269))))

(assert (= (and mapNonEmpty!4267 condMapEmpty!4269) mapIsEmpty!4269))

(assert (= (and mapNonEmpty!4267 (not condMapEmpty!4269)) mapNonEmpty!4269))

(assert (= (and mapNonEmpty!4269 ((_ is ValueCellFull!1043) mapValue!4269)) b!115945))

(assert (= (and mapNonEmpty!4267 ((_ is ValueCellFull!1043) mapDefault!4269)) b!115946))

(declare-fun m!132105 () Bool)

(assert (=> mapNonEmpty!4269 m!132105))

(declare-fun b!115947 () Bool)

(declare-fun e!75670 () Bool)

(assert (=> b!115947 (= e!75670 tp_is_empty!2773)))

(declare-fun b!115948 () Bool)

(declare-fun e!75669 () Bool)

(assert (=> b!115948 (= e!75669 tp_is_empty!2773)))

(declare-fun mapIsEmpty!4270 () Bool)

(declare-fun mapRes!4270 () Bool)

(assert (=> mapIsEmpty!4270 mapRes!4270))

(declare-fun mapNonEmpty!4270 () Bool)

(declare-fun tp!10534 () Bool)

(assert (=> mapNonEmpty!4270 (= mapRes!4270 (and tp!10534 e!75670))))

(declare-fun mapRest!4270 () (Array (_ BitVec 32) ValueCell!1043))

(declare-fun mapKey!4270 () (_ BitVec 32))

(declare-fun mapValue!4270 () ValueCell!1043)

(assert (=> mapNonEmpty!4270 (= mapRest!4268 (store mapRest!4270 mapKey!4270 mapValue!4270))))

(declare-fun condMapEmpty!4270 () Bool)

(declare-fun mapDefault!4270 () ValueCell!1043)

(assert (=> mapNonEmpty!4268 (= condMapEmpty!4270 (= mapRest!4268 ((as const (Array (_ BitVec 32) ValueCell!1043)) mapDefault!4270)))))

(assert (=> mapNonEmpty!4268 (= tp!10532 (and e!75669 mapRes!4270))))

(assert (= (and mapNonEmpty!4268 condMapEmpty!4270) mapIsEmpty!4270))

(assert (= (and mapNonEmpty!4268 (not condMapEmpty!4270)) mapNonEmpty!4270))

(assert (= (and mapNonEmpty!4270 ((_ is ValueCellFull!1043) mapValue!4270)) b!115947))

(assert (= (and mapNonEmpty!4268 ((_ is ValueCellFull!1043) mapDefault!4270)) b!115948))

(declare-fun m!132107 () Bool)

(assert (=> mapNonEmpty!4270 m!132107))

(declare-fun b_lambda!5159 () Bool)

(assert (= b_lambda!5151 (or (and b!115540 b_free!2713) (and b!115550 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))) b_lambda!5159)))

(declare-fun b_lambda!5161 () Bool)

(assert (= b_lambda!5153 (or (and b!115540 b_free!2713) (and b!115550 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))) b_lambda!5161)))

(declare-fun b_lambda!5163 () Bool)

(assert (= b_lambda!5157 (or (and b!115540 b_free!2713 (= (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))) (defaultEntry!2706 newMap!16))) (and b!115550 b_free!2715) b_lambda!5163)))

(declare-fun b_lambda!5165 () Bool)

(assert (= b_lambda!5155 (or (and b!115540 b_free!2713) (and b!115550 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))) b_lambda!5165)))

(declare-fun b_lambda!5167 () Bool)

(assert (= b_lambda!5149 (or (and b!115540 b_free!2713) (and b!115550 b_free!2715 (= (defaultEntry!2706 newMap!16) (defaultEntry!2706 (v!3033 (underlying!408 thiss!992))))) b_lambda!5167)))

(check-sat (not bm!12394) (not b!115898) (not b!115904) (not b_next!2715) (not b!115853) (not b!115866) (not d!32479) (not d!32529) (not b!115906) (not b!115940) (not d!32507) (not b!115934) (not b!115873) (not b!115916) (not b!115944) (not b!115914) (not d!32567) (not b!115827) (not b!115798) (not b!115891) (not b!115868) (not b!115800) (not b!115902) (not b!115752) (not d!32521) (not b!115889) (not d!32509) (not d!32457) tp_is_empty!2773 (not b!115872) b_and!7215 (not b_lambda!5159) (not d!32539) (not b!115908) (not b!115828) (not d!32551) (not b!115942) (not d!32561) (not d!32523) (not d!32559) (not b!115871) (not b!115905) (not d!32501) (not d!32505) (not d!32537) (not b!115913) (not d!32481) (not b!115801) (not d!32463) (not b!115754) (not d!32493) (not b!115851) (not b!115939) (not b!115867) (not b!115884) (not d!32527) (not b!115766) (not b!115919) (not b!115794) (not b!115910) (not b_lambda!5165) (not d!32563) (not b!115893) (not b!115936) (not d!32459) (not b!115837) (not b!115897) (not b!115864) (not b!115907) (not bm!12377) (not d!32557) (not b!115865) (not b_lambda!5163) (not b!115899) (not d!32569) (not b!115797) (not d!32517) (not b!115804) (not b!115802) (not d!32491) (not bm!12380) (not d!32487) (not b!115813) (not b!115938) (not d!32533) (not b!115862) (not d!32495) (not b!115765) (not b!115941) (not d!32531) (not b!115760) (not b_lambda!5147) (not d!32485) (not bm!12393) (not b!115870) (not d!32555) (not b!115803) (not b!115817) (not b!115885) (not d!32489) (not bm!12387) (not d!32543) (not b!115815) (not b!115793) (not b!115911) (not b!115826) (not bm!12384) (not b!115820) (not mapNonEmpty!4270) (not b_lambda!5161) (not b_lambda!5145) (not d!32547) (not d!32497) (not b!115791) (not d!32453) (not bm!12381) (not b!115759) (not d!32467) (not d!32549) (not d!32503) (not d!32525) b_and!7213 (not b!115943) (not d!32511) (not b!115921) (not b!115855) (not b!115900) (not b!115850) (not b_lambda!5167) (not b!115927) (not b!115895) (not d!32553) (not b!115929) (not d!32455) (not b_next!2713) (not b!115903) (not d!32535) (not bm!12391) (not b!115886) (not bm!12389) (not d!32519) (not d!32483) (not d!32499) (not d!32541) (not d!32477) (not b!115918) (not d!32545) (not mapNonEmpty!4269) (not b!115823) (not d!32471) (not b!115917) (not b!115824) (not b!115819))
(check-sat b_and!7213 b_and!7215 (not b_next!2713) (not b_next!2715))
