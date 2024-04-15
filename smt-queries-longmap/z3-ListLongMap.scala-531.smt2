; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13232 () Bool)

(assert start!13232)

(declare-fun b!116523 () Bool)

(declare-fun b_free!2761 () Bool)

(declare-fun b_next!2761 () Bool)

(assert (=> b!116523 (= b_free!2761 (not b_next!2761))))

(declare-fun tp!10656 () Bool)

(declare-fun b_and!7253 () Bool)

(assert (=> b!116523 (= tp!10656 b_and!7253)))

(declare-fun b!116531 () Bool)

(declare-fun b_free!2763 () Bool)

(declare-fun b_next!2763 () Bool)

(assert (=> b!116531 (= b_free!2763 (not b_next!2763))))

(declare-fun tp!10658 () Bool)

(declare-fun b_and!7255 () Bool)

(assert (=> b!116531 (= tp!10658 b_and!7255)))

(declare-fun mapIsEmpty!4333 () Bool)

(declare-fun mapRes!4333 () Bool)

(assert (=> mapIsEmpty!4333 mapRes!4333))

(declare-fun b!116518 () Bool)

(declare-fun e!76116 () Bool)

(declare-fun e!76123 () Bool)

(assert (=> b!116518 (= e!76116 e!76123)))

(declare-fun b!116519 () Bool)

(declare-fun e!76120 () Bool)

(declare-fun tp_is_empty!2797 () Bool)

(assert (=> b!116519 (= e!76120 tp_is_empty!2797)))

(declare-fun res!57056 () Bool)

(declare-fun e!76126 () Bool)

(assert (=> start!13232 (=> (not res!57056) (not e!76126))))

(declare-datatypes ((V!3377 0))(
  ( (V!3378 (val!1443 Int)) )
))
(declare-datatypes ((array!4581 0))(
  ( (array!4582 (arr!2170 (Array (_ BitVec 32) (_ BitVec 64))) (size!2432 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1055 0))(
  ( (ValueCellFull!1055 (v!3048 V!3377)) (EmptyCell!1055) )
))
(declare-datatypes ((array!4583 0))(
  ( (array!4584 (arr!2171 (Array (_ BitVec 32) ValueCell!1055)) (size!2433 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1018 0))(
  ( (LongMapFixedSize!1019 (defaultEntry!2721 Int) (mask!6940 (_ BitVec 32)) (extraKeys!2510 (_ BitVec 32)) (zeroValue!2588 V!3377) (minValue!2588 V!3377) (_size!558 (_ BitVec 32)) (_keys!4443 array!4581) (_values!2704 array!4583) (_vacant!558 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!806 0))(
  ( (Cell!807 (v!3049 LongMapFixedSize!1018)) )
))
(declare-datatypes ((LongMap!806 0))(
  ( (LongMap!807 (underlying!414 Cell!806)) )
))
(declare-fun thiss!992 () LongMap!806)

(declare-fun valid!488 (LongMap!806) Bool)

(assert (=> start!13232 (= res!57056 (valid!488 thiss!992))))

(assert (=> start!13232 e!76126))

(declare-fun e!76121 () Bool)

(assert (=> start!13232 e!76121))

(assert (=> start!13232 true))

(declare-fun e!76117 () Bool)

(assert (=> start!13232 e!76117))

(declare-fun b!116520 () Bool)

(declare-fun e!76128 () Bool)

(assert (=> b!116520 (= e!76128 tp_is_empty!2797)))

(declare-fun b!116521 () Bool)

(declare-fun e!76119 () Bool)

(assert (=> b!116521 (= e!76119 (and e!76120 mapRes!4333))))

(declare-fun condMapEmpty!4334 () Bool)

(declare-fun mapDefault!4334 () ValueCell!1055)

(assert (=> b!116521 (= condMapEmpty!4334 (= (arr!2171 (_values!2704 (v!3049 (underlying!414 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4334)))))

(declare-fun b!116522 () Bool)

(declare-fun res!57054 () Bool)

(assert (=> b!116522 (=> (not res!57054) (not e!76126))))

(declare-fun newMap!16 () LongMapFixedSize!1018)

(assert (=> b!116522 (= res!57054 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6940 newMap!16)) (_size!558 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun array_inv!1375 (array!4581) Bool)

(declare-fun array_inv!1376 (array!4583) Bool)

(assert (=> b!116523 (= e!76123 (and tp!10656 tp_is_empty!2797 (array_inv!1375 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (array_inv!1376 (_values!2704 (v!3049 (underlying!414 thiss!992)))) e!76119))))

(declare-fun b!116524 () Bool)

(assert (=> b!116524 (= e!76121 e!76116)))

(declare-fun b!116525 () Bool)

(declare-fun valid!489 (LongMapFixedSize!1018) Bool)

(assert (=> b!116525 (= e!76126 (not (valid!489 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun b!116526 () Bool)

(declare-fun res!57057 () Bool)

(assert (=> b!116526 (=> (not res!57057) (not e!76126))))

(assert (=> b!116526 (= res!57057 (valid!489 newMap!16))))

(declare-fun b!116527 () Bool)

(declare-fun e!76118 () Bool)

(assert (=> b!116527 (= e!76118 tp_is_empty!2797)))

(declare-fun mapIsEmpty!4334 () Bool)

(declare-fun mapRes!4334 () Bool)

(assert (=> mapIsEmpty!4334 mapRes!4334))

(declare-fun mapNonEmpty!4333 () Bool)

(declare-fun tp!10655 () Bool)

(assert (=> mapNonEmpty!4333 (= mapRes!4333 (and tp!10655 e!76118))))

(declare-fun mapValue!4333 () ValueCell!1055)

(declare-fun mapKey!4333 () (_ BitVec 32))

(declare-fun mapRest!4333 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4333 (= (arr!2171 (_values!2704 (v!3049 (underlying!414 thiss!992)))) (store mapRest!4333 mapKey!4333 mapValue!4333))))

(declare-fun b!116528 () Bool)

(declare-fun res!57059 () Bool)

(assert (=> b!116528 (=> (not res!57059) (not e!76126))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2510 0))(
  ( (tuple2!2511 (_1!1266 (_ BitVec 64)) (_2!1266 V!3377)) )
))
(declare-datatypes ((List!1676 0))(
  ( (Nil!1673) (Cons!1672 (h!2272 tuple2!2510) (t!5937 List!1676)) )
))
(declare-datatypes ((ListLongMap!1625 0))(
  ( (ListLongMap!1626 (toList!828 List!1676)) )
))
(declare-fun getCurrentListMap!499 (array!4581 array!4583 (_ BitVec 32) (_ BitVec 32) V!3377 V!3377 (_ BitVec 32) Int) ListLongMap!1625)

(declare-fun map!1345 (LongMapFixedSize!1018) ListLongMap!1625)

(assert (=> b!116528 (= res!57059 (= (getCurrentListMap!499 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))) (map!1345 newMap!16)))))

(declare-fun b!116529 () Bool)

(declare-fun e!76127 () Bool)

(assert (=> b!116529 (= e!76127 (and e!76128 mapRes!4334))))

(declare-fun condMapEmpty!4333 () Bool)

(declare-fun mapDefault!4333 () ValueCell!1055)

(assert (=> b!116529 (= condMapEmpty!4333 (= (arr!2171 (_values!2704 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4333)))))

(declare-fun b!116530 () Bool)

(declare-fun res!57055 () Bool)

(assert (=> b!116530 (=> (not res!57055) (not e!76126))))

(assert (=> b!116530 (= res!57055 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992)))))))))

(assert (=> b!116531 (= e!76117 (and tp!10658 tp_is_empty!2797 (array_inv!1375 (_keys!4443 newMap!16)) (array_inv!1376 (_values!2704 newMap!16)) e!76127))))

(declare-fun b!116532 () Bool)

(declare-fun e!76124 () Bool)

(assert (=> b!116532 (= e!76124 tp_is_empty!2797)))

(declare-fun mapNonEmpty!4334 () Bool)

(declare-fun tp!10657 () Bool)

(assert (=> mapNonEmpty!4334 (= mapRes!4334 (and tp!10657 e!76124))))

(declare-fun mapRest!4334 () (Array (_ BitVec 32) ValueCell!1055))

(declare-fun mapValue!4334 () ValueCell!1055)

(declare-fun mapKey!4334 () (_ BitVec 32))

(assert (=> mapNonEmpty!4334 (= (arr!2171 (_values!2704 newMap!16)) (store mapRest!4334 mapKey!4334 mapValue!4334))))

(declare-fun b!116533 () Bool)

(declare-fun res!57058 () Bool)

(assert (=> b!116533 (=> (not res!57058) (not e!76126))))

(assert (=> b!116533 (= res!57058 (and (or (= (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(assert (= (and start!13232 res!57056) b!116530))

(assert (= (and b!116530 res!57055) b!116526))

(assert (= (and b!116526 res!57057) b!116522))

(assert (= (and b!116522 res!57054) b!116528))

(assert (= (and b!116528 res!57059) b!116533))

(assert (= (and b!116533 res!57058) b!116525))

(assert (= (and b!116521 condMapEmpty!4334) mapIsEmpty!4333))

(assert (= (and b!116521 (not condMapEmpty!4334)) mapNonEmpty!4333))

(get-info :version)

(assert (= (and mapNonEmpty!4333 ((_ is ValueCellFull!1055) mapValue!4333)) b!116527))

(assert (= (and b!116521 ((_ is ValueCellFull!1055) mapDefault!4334)) b!116519))

(assert (= b!116523 b!116521))

(assert (= b!116518 b!116523))

(assert (= b!116524 b!116518))

(assert (= start!13232 b!116524))

(assert (= (and b!116529 condMapEmpty!4333) mapIsEmpty!4334))

(assert (= (and b!116529 (not condMapEmpty!4333)) mapNonEmpty!4334))

(assert (= (and mapNonEmpty!4334 ((_ is ValueCellFull!1055) mapValue!4334)) b!116532))

(assert (= (and b!116529 ((_ is ValueCellFull!1055) mapDefault!4333)) b!116520))

(assert (= b!116531 b!116529))

(assert (= start!13232 b!116531))

(declare-fun m!132313 () Bool)

(assert (=> b!116526 m!132313))

(declare-fun m!132315 () Bool)

(assert (=> b!116523 m!132315))

(declare-fun m!132317 () Bool)

(assert (=> b!116523 m!132317))

(declare-fun m!132319 () Bool)

(assert (=> b!116525 m!132319))

(declare-fun m!132321 () Bool)

(assert (=> b!116533 m!132321))

(declare-fun m!132323 () Bool)

(assert (=> b!116531 m!132323))

(declare-fun m!132325 () Bool)

(assert (=> b!116531 m!132325))

(declare-fun m!132327 () Bool)

(assert (=> start!13232 m!132327))

(declare-fun m!132329 () Bool)

(assert (=> b!116528 m!132329))

(declare-fun m!132331 () Bool)

(assert (=> b!116528 m!132331))

(declare-fun m!132333 () Bool)

(assert (=> mapNonEmpty!4334 m!132333))

(declare-fun m!132335 () Bool)

(assert (=> mapNonEmpty!4333 m!132335))

(check-sat (not mapNonEmpty!4334) b_and!7253 (not b_next!2763) (not b!116523) (not b!116526) (not start!13232) (not b!116531) (not b_next!2761) (not mapNonEmpty!4333) b_and!7255 (not b!116525) (not b!116528) tp_is_empty!2797)
(check-sat b_and!7253 b_and!7255 (not b_next!2761) (not b_next!2763))
(get-model)

(declare-fun d!32541 () Bool)

(declare-fun res!57102 () Bool)

(declare-fun e!76209 () Bool)

(assert (=> d!32541 (=> (not res!57102) (not e!76209))))

(declare-fun simpleValid!82 (LongMapFixedSize!1018) Bool)

(assert (=> d!32541 (= res!57102 (simpleValid!82 newMap!16))))

(assert (=> d!32541 (= (valid!489 newMap!16) e!76209)))

(declare-fun b!116636 () Bool)

(declare-fun res!57103 () Bool)

(assert (=> b!116636 (=> (not res!57103) (not e!76209))))

(declare-fun arrayCountValidKeys!0 (array!4581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!116636 (= res!57103 (= (arrayCountValidKeys!0 (_keys!4443 newMap!16) #b00000000000000000000000000000000 (size!2432 (_keys!4443 newMap!16))) (_size!558 newMap!16)))))

(declare-fun b!116637 () Bool)

(declare-fun res!57104 () Bool)

(assert (=> b!116637 (=> (not res!57104) (not e!76209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4581 (_ BitVec 32)) Bool)

(assert (=> b!116637 (= res!57104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4443 newMap!16) (mask!6940 newMap!16)))))

(declare-fun b!116638 () Bool)

(declare-datatypes ((List!1677 0))(
  ( (Nil!1674) (Cons!1673 (h!2273 (_ BitVec 64)) (t!5942 List!1677)) )
))
(declare-fun arrayNoDuplicates!0 (array!4581 (_ BitVec 32) List!1677) Bool)

(assert (=> b!116638 (= e!76209 (arrayNoDuplicates!0 (_keys!4443 newMap!16) #b00000000000000000000000000000000 Nil!1674))))

(assert (= (and d!32541 res!57102) b!116636))

(assert (= (and b!116636 res!57103) b!116637))

(assert (= (and b!116637 res!57104) b!116638))

(declare-fun m!132385 () Bool)

(assert (=> d!32541 m!132385))

(declare-fun m!132387 () Bool)

(assert (=> b!116636 m!132387))

(declare-fun m!132389 () Bool)

(assert (=> b!116637 m!132389))

(declare-fun m!132391 () Bool)

(assert (=> b!116638 m!132391))

(assert (=> b!116526 d!32541))

(declare-fun d!32543 () Bool)

(assert (=> d!32543 (= (array_inv!1375 (_keys!4443 newMap!16)) (bvsge (size!2432 (_keys!4443 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116531 d!32543))

(declare-fun d!32545 () Bool)

(assert (=> d!32545 (= (array_inv!1376 (_values!2704 newMap!16)) (bvsge (size!2433 (_values!2704 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116531 d!32545))

(declare-fun d!32547 () Bool)

(assert (=> d!32547 (= (array_inv!1375 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvsge (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116523 d!32547))

(declare-fun d!32549 () Bool)

(assert (=> d!32549 (= (array_inv!1376 (_values!2704 (v!3049 (underlying!414 thiss!992)))) (bvsge (size!2433 (_values!2704 (v!3049 (underlying!414 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116523 d!32549))

(declare-fun d!32551 () Bool)

(assert (=> d!32551 (= (valid!488 thiss!992) (valid!489 (v!3049 (underlying!414 thiss!992))))))

(declare-fun bs!4730 () Bool)

(assert (= bs!4730 d!32551))

(assert (=> bs!4730 m!132319))

(assert (=> start!13232 d!32551))

(declare-fun b!116681 () Bool)

(declare-fun e!76244 () ListLongMap!1625)

(declare-fun call!12483 () ListLongMap!1625)

(assert (=> b!116681 (= e!76244 call!12483)))

(declare-fun b!116682 () Bool)

(declare-fun e!76238 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!116682 (= e!76238 (validKeyInArray!0 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!76243 () Bool)

(declare-fun lt!60459 () ListLongMap!1625)

(declare-fun b!116683 () Bool)

(declare-fun apply!106 (ListLongMap!1625 (_ BitVec 64)) V!3377)

(declare-fun get!1410 (ValueCell!1055 V!3377) V!3377)

(declare-fun dynLambda!402 (Int (_ BitVec 64)) V!3377)

(assert (=> b!116683 (= e!76243 (= (apply!106 lt!60459 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1410 (select (arr!2171 (_values!2704 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!402 (defaultEntry!2721 (v!3049 (underlying!414 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!116683 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2433 (_values!2704 (v!3049 (underlying!414 thiss!992))))))))

(assert (=> b!116683 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))))))

(declare-fun b!116684 () Bool)

(declare-fun e!76245 () Bool)

(declare-fun call!12482 () Bool)

(assert (=> b!116684 (= e!76245 (not call!12482))))

(declare-fun b!116685 () Bool)

(declare-datatypes ((Unit!3606 0))(
  ( (Unit!3607) )
))
(declare-fun e!76239 () Unit!3606)

(declare-fun Unit!3608 () Unit!3606)

(assert (=> b!116685 (= e!76239 Unit!3608)))

(declare-fun b!116687 () Bool)

(declare-fun res!57126 () Bool)

(declare-fun e!76242 () Bool)

(assert (=> b!116687 (=> (not res!57126) (not e!76242))))

(declare-fun e!76240 () Bool)

(assert (=> b!116687 (= res!57126 e!76240)))

(declare-fun c!20623 () Bool)

(assert (=> b!116687 (= c!20623 (not (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!116688 () Bool)

(declare-fun e!76237 () ListLongMap!1625)

(declare-fun e!76236 () ListLongMap!1625)

(assert (=> b!116688 (= e!76237 e!76236)))

(declare-fun c!20624 () Bool)

(assert (=> b!116688 (= c!20624 (and (not (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12474 () Bool)

(declare-fun call!12481 () ListLongMap!1625)

(assert (=> bm!12474 (= call!12483 call!12481)))

(declare-fun b!116689 () Bool)

(declare-fun e!76248 () Bool)

(assert (=> b!116689 (= e!76248 (= (apply!106 lt!60459 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2588 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun b!116690 () Bool)

(declare-fun e!76241 () Bool)

(assert (=> b!116690 (= e!76245 e!76241)))

(declare-fun res!57124 () Bool)

(assert (=> b!116690 (= res!57124 call!12482)))

(assert (=> b!116690 (=> (not res!57124) (not e!76241))))

(declare-fun b!116691 () Bool)

(assert (=> b!116691 (= e!76240 e!76248)))

(declare-fun res!57131 () Bool)

(declare-fun call!12477 () Bool)

(assert (=> b!116691 (= res!57131 call!12477)))

(assert (=> b!116691 (=> (not res!57131) (not e!76248))))

(declare-fun bm!12475 () Bool)

(declare-fun call!12478 () ListLongMap!1625)

(declare-fun getCurrentListMapNoExtraKeys!118 (array!4581 array!4583 (_ BitVec 32) (_ BitVec 32) V!3377 V!3377 (_ BitVec 32) Int) ListLongMap!1625)

(assert (=> bm!12475 (= call!12478 (getCurrentListMapNoExtraKeys!118 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun b!116692 () Bool)

(declare-fun res!57130 () Bool)

(assert (=> b!116692 (=> (not res!57130) (not e!76242))))

(declare-fun e!76247 () Bool)

(assert (=> b!116692 (= res!57130 e!76247)))

(declare-fun res!57125 () Bool)

(assert (=> b!116692 (=> res!57125 e!76247)))

(assert (=> b!116692 (= res!57125 (not e!76238))))

(declare-fun res!57127 () Bool)

(assert (=> b!116692 (=> (not res!57127) (not e!76238))))

(assert (=> b!116692 (= res!57127 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))))))

(declare-fun bm!12476 () Bool)

(assert (=> bm!12476 (= call!12481 call!12478)))

(declare-fun b!116693 () Bool)

(declare-fun c!20625 () Bool)

(assert (=> b!116693 (= c!20625 (and (not (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!116693 (= e!76236 e!76244)))

(declare-fun bm!12477 () Bool)

(declare-fun call!12480 () ListLongMap!1625)

(declare-fun call!12479 () ListLongMap!1625)

(assert (=> bm!12477 (= call!12480 call!12479)))

(declare-fun d!32553 () Bool)

(assert (=> d!32553 e!76242))

(declare-fun res!57128 () Bool)

(assert (=> d!32553 (=> (not res!57128) (not e!76242))))

(assert (=> d!32553 (= res!57128 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))))))))

(declare-fun lt!60460 () ListLongMap!1625)

(assert (=> d!32553 (= lt!60459 lt!60460)))

(declare-fun lt!60454 () Unit!3606)

(assert (=> d!32553 (= lt!60454 e!76239)))

(declare-fun c!20622 () Bool)

(declare-fun e!76246 () Bool)

(assert (=> d!32553 (= c!20622 e!76246)))

(declare-fun res!57123 () Bool)

(assert (=> d!32553 (=> (not res!57123) (not e!76246))))

(assert (=> d!32553 (= res!57123 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))))))

(assert (=> d!32553 (= lt!60460 e!76237)))

(declare-fun c!20626 () Bool)

(assert (=> d!32553 (= c!20626 (and (not (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32553 (validMask!0 (mask!6940 (v!3049 (underlying!414 thiss!992))))))

(assert (=> d!32553 (= (getCurrentListMap!499 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))) lt!60459)))

(declare-fun b!116686 () Bool)

(assert (=> b!116686 (= e!76242 e!76245)))

(declare-fun c!20621 () Bool)

(assert (=> b!116686 (= c!20621 (not (= (bvand (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116694 () Bool)

(declare-fun lt!60455 () Unit!3606)

(assert (=> b!116694 (= e!76239 lt!60455)))

(declare-fun lt!60445 () ListLongMap!1625)

(assert (=> b!116694 (= lt!60445 (getCurrentListMapNoExtraKeys!118 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun lt!60443 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60441 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60441 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60448 () Unit!3606)

(declare-fun addStillContains!82 (ListLongMap!1625 (_ BitVec 64) V!3377 (_ BitVec 64)) Unit!3606)

(assert (=> b!116694 (= lt!60448 (addStillContains!82 lt!60445 lt!60443 (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) lt!60441))))

(declare-fun contains!854 (ListLongMap!1625 (_ BitVec 64)) Bool)

(declare-fun +!153 (ListLongMap!1625 tuple2!2510) ListLongMap!1625)

(assert (=> b!116694 (contains!854 (+!153 lt!60445 (tuple2!2511 lt!60443 (zeroValue!2588 (v!3049 (underlying!414 thiss!992))))) lt!60441)))

(declare-fun lt!60449 () Unit!3606)

(assert (=> b!116694 (= lt!60449 lt!60448)))

(declare-fun lt!60444 () ListLongMap!1625)

(assert (=> b!116694 (= lt!60444 (getCurrentListMapNoExtraKeys!118 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun lt!60458 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60458 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60461 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60461 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60447 () Unit!3606)

(declare-fun addApplyDifferent!82 (ListLongMap!1625 (_ BitVec 64) V!3377 (_ BitVec 64)) Unit!3606)

(assert (=> b!116694 (= lt!60447 (addApplyDifferent!82 lt!60444 lt!60458 (minValue!2588 (v!3049 (underlying!414 thiss!992))) lt!60461))))

(assert (=> b!116694 (= (apply!106 (+!153 lt!60444 (tuple2!2511 lt!60458 (minValue!2588 (v!3049 (underlying!414 thiss!992))))) lt!60461) (apply!106 lt!60444 lt!60461))))

(declare-fun lt!60462 () Unit!3606)

(assert (=> b!116694 (= lt!60462 lt!60447)))

(declare-fun lt!60450 () ListLongMap!1625)

(assert (=> b!116694 (= lt!60450 (getCurrentListMapNoExtraKeys!118 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun lt!60442 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60456 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60456 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60451 () Unit!3606)

(assert (=> b!116694 (= lt!60451 (addApplyDifferent!82 lt!60450 lt!60442 (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) lt!60456))))

(assert (=> b!116694 (= (apply!106 (+!153 lt!60450 (tuple2!2511 lt!60442 (zeroValue!2588 (v!3049 (underlying!414 thiss!992))))) lt!60456) (apply!106 lt!60450 lt!60456))))

(declare-fun lt!60452 () Unit!3606)

(assert (=> b!116694 (= lt!60452 lt!60451)))

(declare-fun lt!60453 () ListLongMap!1625)

(assert (=> b!116694 (= lt!60453 (getCurrentListMapNoExtraKeys!118 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (_values!2704 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992))) (extraKeys!2510 (v!3049 (underlying!414 thiss!992))) (zeroValue!2588 (v!3049 (underlying!414 thiss!992))) (minValue!2588 (v!3049 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun lt!60446 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60446 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60457 () (_ BitVec 64))

(assert (=> b!116694 (= lt!60457 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!116694 (= lt!60455 (addApplyDifferent!82 lt!60453 lt!60446 (minValue!2588 (v!3049 (underlying!414 thiss!992))) lt!60457))))

(assert (=> b!116694 (= (apply!106 (+!153 lt!60453 (tuple2!2511 lt!60446 (minValue!2588 (v!3049 (underlying!414 thiss!992))))) lt!60457) (apply!106 lt!60453 lt!60457))))

(declare-fun b!116695 () Bool)

(assert (=> b!116695 (= e!76237 (+!153 call!12479 (tuple2!2511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2588 (v!3049 (underlying!414 thiss!992))))))))

(declare-fun b!116696 () Bool)

(assert (=> b!116696 (= e!76236 call!12480)))

(declare-fun b!116697 () Bool)

(assert (=> b!116697 (= e!76246 (validKeyInArray!0 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116698 () Bool)

(assert (=> b!116698 (= e!76247 e!76243)))

(declare-fun res!57129 () Bool)

(assert (=> b!116698 (=> (not res!57129) (not e!76243))))

(assert (=> b!116698 (= res!57129 (contains!854 lt!60459 (select (arr!2170 (_keys!4443 (v!3049 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116698 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))))))

(declare-fun b!116699 () Bool)

(assert (=> b!116699 (= e!76244 call!12480)))

(declare-fun bm!12478 () Bool)

(assert (=> bm!12478 (= call!12477 (contains!854 lt!60459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12479 () Bool)

(assert (=> bm!12479 (= call!12479 (+!153 (ite c!20626 call!12478 (ite c!20624 call!12481 call!12483)) (ite (or c!20626 c!20624) (tuple2!2511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2588 (v!3049 (underlying!414 thiss!992)))) (tuple2!2511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2588 (v!3049 (underlying!414 thiss!992)))))))))

(declare-fun b!116700 () Bool)

(assert (=> b!116700 (= e!76241 (= (apply!106 lt!60459 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2588 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun bm!12480 () Bool)

(assert (=> bm!12480 (= call!12482 (contains!854 lt!60459 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116701 () Bool)

(assert (=> b!116701 (= e!76240 (not call!12477))))

(assert (= (and d!32553 c!20626) b!116695))

(assert (= (and d!32553 (not c!20626)) b!116688))

(assert (= (and b!116688 c!20624) b!116696))

(assert (= (and b!116688 (not c!20624)) b!116693))

(assert (= (and b!116693 c!20625) b!116699))

(assert (= (and b!116693 (not c!20625)) b!116681))

(assert (= (or b!116699 b!116681) bm!12474))

(assert (= (or b!116696 bm!12474) bm!12476))

(assert (= (or b!116696 b!116699) bm!12477))

(assert (= (or b!116695 bm!12476) bm!12475))

(assert (= (or b!116695 bm!12477) bm!12479))

(assert (= (and d!32553 res!57123) b!116697))

(assert (= (and d!32553 c!20622) b!116694))

(assert (= (and d!32553 (not c!20622)) b!116685))

(assert (= (and d!32553 res!57128) b!116692))

(assert (= (and b!116692 res!57127) b!116682))

(assert (= (and b!116692 (not res!57125)) b!116698))

(assert (= (and b!116698 res!57129) b!116683))

(assert (= (and b!116692 res!57130) b!116687))

(assert (= (and b!116687 c!20623) b!116691))

(assert (= (and b!116687 (not c!20623)) b!116701))

(assert (= (and b!116691 res!57131) b!116689))

(assert (= (or b!116691 b!116701) bm!12478))

(assert (= (and b!116687 res!57126) b!116686))

(assert (= (and b!116686 c!20621) b!116690))

(assert (= (and b!116686 (not c!20621)) b!116684))

(assert (= (and b!116690 res!57124) b!116700))

(assert (= (or b!116690 b!116684) bm!12480))

(declare-fun b_lambda!5169 () Bool)

(assert (=> (not b_lambda!5169) (not b!116683)))

(declare-fun t!5939 () Bool)

(declare-fun tb!2229 () Bool)

(assert (=> (and b!116523 (= (defaultEntry!2721 (v!3049 (underlying!414 thiss!992))) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))) t!5939) tb!2229))

(declare-fun result!3719 () Bool)

(assert (=> tb!2229 (= result!3719 tp_is_empty!2797)))

(assert (=> b!116683 t!5939))

(declare-fun b_and!7265 () Bool)

(assert (= b_and!7253 (and (=> t!5939 result!3719) b_and!7265)))

(declare-fun t!5941 () Bool)

(declare-fun tb!2231 () Bool)

(assert (=> (and b!116531 (= (defaultEntry!2721 newMap!16) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992)))) t!5941) tb!2231))

(declare-fun result!3723 () Bool)

(assert (= result!3723 result!3719))

(assert (=> b!116683 t!5941))

(declare-fun b_and!7267 () Bool)

(assert (= b_and!7255 (and (=> t!5941 result!3723) b_and!7267)))

(declare-fun m!132393 () Bool)

(assert (=> bm!12480 m!132393))

(declare-fun m!132395 () Bool)

(assert (=> b!116682 m!132395))

(assert (=> b!116682 m!132395))

(declare-fun m!132397 () Bool)

(assert (=> b!116682 m!132397))

(declare-fun m!132399 () Bool)

(assert (=> d!32553 m!132399))

(declare-fun m!132401 () Bool)

(assert (=> bm!12479 m!132401))

(declare-fun m!132403 () Bool)

(assert (=> b!116694 m!132403))

(declare-fun m!132405 () Bool)

(assert (=> b!116694 m!132405))

(assert (=> b!116694 m!132405))

(declare-fun m!132407 () Bool)

(assert (=> b!116694 m!132407))

(assert (=> b!116694 m!132395))

(declare-fun m!132409 () Bool)

(assert (=> b!116694 m!132409))

(declare-fun m!132411 () Bool)

(assert (=> b!116694 m!132411))

(declare-fun m!132413 () Bool)

(assert (=> b!116694 m!132413))

(declare-fun m!132415 () Bool)

(assert (=> b!116694 m!132415))

(assert (=> b!116694 m!132403))

(declare-fun m!132417 () Bool)

(assert (=> b!116694 m!132417))

(declare-fun m!132419 () Bool)

(assert (=> b!116694 m!132419))

(declare-fun m!132421 () Bool)

(assert (=> b!116694 m!132421))

(declare-fun m!132423 () Bool)

(assert (=> b!116694 m!132423))

(declare-fun m!132425 () Bool)

(assert (=> b!116694 m!132425))

(declare-fun m!132427 () Bool)

(assert (=> b!116694 m!132427))

(declare-fun m!132429 () Bool)

(assert (=> b!116694 m!132429))

(assert (=> b!116694 m!132421))

(assert (=> b!116694 m!132413))

(declare-fun m!132431 () Bool)

(assert (=> b!116694 m!132431))

(declare-fun m!132433 () Bool)

(assert (=> b!116694 m!132433))

(declare-fun m!132435 () Bool)

(assert (=> b!116689 m!132435))

(assert (=> b!116698 m!132395))

(assert (=> b!116698 m!132395))

(declare-fun m!132437 () Bool)

(assert (=> b!116698 m!132437))

(assert (=> bm!12475 m!132427))

(assert (=> b!116697 m!132395))

(assert (=> b!116697 m!132395))

(assert (=> b!116697 m!132397))

(declare-fun m!132439 () Bool)

(assert (=> b!116700 m!132439))

(declare-fun m!132441 () Bool)

(assert (=> bm!12478 m!132441))

(declare-fun m!132443 () Bool)

(assert (=> b!116695 m!132443))

(assert (=> b!116683 m!132395))

(declare-fun m!132445 () Bool)

(assert (=> b!116683 m!132445))

(assert (=> b!116683 m!132395))

(declare-fun m!132447 () Bool)

(assert (=> b!116683 m!132447))

(declare-fun m!132449 () Bool)

(assert (=> b!116683 m!132449))

(assert (=> b!116683 m!132447))

(declare-fun m!132451 () Bool)

(assert (=> b!116683 m!132451))

(assert (=> b!116683 m!132449))

(assert (=> b!116528 d!32553))

(declare-fun d!32555 () Bool)

(assert (=> d!32555 (= (map!1345 newMap!16) (getCurrentListMap!499 (_keys!4443 newMap!16) (_values!2704 newMap!16) (mask!6940 newMap!16) (extraKeys!2510 newMap!16) (zeroValue!2588 newMap!16) (minValue!2588 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2721 newMap!16)))))

(declare-fun bs!4731 () Bool)

(assert (= bs!4731 d!32555))

(declare-fun m!132453 () Bool)

(assert (=> bs!4731 m!132453))

(assert (=> b!116528 d!32555))

(declare-fun d!32557 () Bool)

(declare-fun res!57132 () Bool)

(declare-fun e!76249 () Bool)

(assert (=> d!32557 (=> (not res!57132) (not e!76249))))

(assert (=> d!32557 (= res!57132 (simpleValid!82 (v!3049 (underlying!414 thiss!992))))))

(assert (=> d!32557 (= (valid!489 (v!3049 (underlying!414 thiss!992))) e!76249)))

(declare-fun b!116704 () Bool)

(declare-fun res!57133 () Bool)

(assert (=> b!116704 (=> (not res!57133) (not e!76249))))

(assert (=> b!116704 (= res!57133 (= (arrayCountValidKeys!0 (_keys!4443 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000000 (size!2432 (_keys!4443 (v!3049 (underlying!414 thiss!992))))) (_size!558 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun b!116705 () Bool)

(declare-fun res!57134 () Bool)

(assert (=> b!116705 (=> (not res!57134) (not e!76249))))

(assert (=> b!116705 (= res!57134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4443 (v!3049 (underlying!414 thiss!992))) (mask!6940 (v!3049 (underlying!414 thiss!992)))))))

(declare-fun b!116706 () Bool)

(assert (=> b!116706 (= e!76249 (arrayNoDuplicates!0 (_keys!4443 (v!3049 (underlying!414 thiss!992))) #b00000000000000000000000000000000 Nil!1674))))

(assert (= (and d!32557 res!57132) b!116704))

(assert (= (and b!116704 res!57133) b!116705))

(assert (= (and b!116705 res!57134) b!116706))

(declare-fun m!132455 () Bool)

(assert (=> d!32557 m!132455))

(declare-fun m!132457 () Bool)

(assert (=> b!116704 m!132457))

(declare-fun m!132459 () Bool)

(assert (=> b!116705 m!132459))

(declare-fun m!132461 () Bool)

(assert (=> b!116706 m!132461))

(assert (=> b!116525 d!32557))

(declare-fun b!116714 () Bool)

(declare-fun e!76254 () Bool)

(assert (=> b!116714 (= e!76254 tp_is_empty!2797)))

(declare-fun mapIsEmpty!4349 () Bool)

(declare-fun mapRes!4349 () Bool)

(assert (=> mapIsEmpty!4349 mapRes!4349))

(declare-fun b!116713 () Bool)

(declare-fun e!76255 () Bool)

(assert (=> b!116713 (= e!76255 tp_is_empty!2797)))

(declare-fun condMapEmpty!4349 () Bool)

(declare-fun mapDefault!4349 () ValueCell!1055)

(assert (=> mapNonEmpty!4333 (= condMapEmpty!4349 (= mapRest!4333 ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4349)))))

(assert (=> mapNonEmpty!4333 (= tp!10655 (and e!76254 mapRes!4349))))

(declare-fun mapNonEmpty!4349 () Bool)

(declare-fun tp!10685 () Bool)

(assert (=> mapNonEmpty!4349 (= mapRes!4349 (and tp!10685 e!76255))))

(declare-fun mapKey!4349 () (_ BitVec 32))

(declare-fun mapValue!4349 () ValueCell!1055)

(declare-fun mapRest!4349 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4349 (= mapRest!4333 (store mapRest!4349 mapKey!4349 mapValue!4349))))

(assert (= (and mapNonEmpty!4333 condMapEmpty!4349) mapIsEmpty!4349))

(assert (= (and mapNonEmpty!4333 (not condMapEmpty!4349)) mapNonEmpty!4349))

(assert (= (and mapNonEmpty!4349 ((_ is ValueCellFull!1055) mapValue!4349)) b!116713))

(assert (= (and mapNonEmpty!4333 ((_ is ValueCellFull!1055) mapDefault!4349)) b!116714))

(declare-fun m!132463 () Bool)

(assert (=> mapNonEmpty!4349 m!132463))

(declare-fun b!116716 () Bool)

(declare-fun e!76256 () Bool)

(assert (=> b!116716 (= e!76256 tp_is_empty!2797)))

(declare-fun mapIsEmpty!4350 () Bool)

(declare-fun mapRes!4350 () Bool)

(assert (=> mapIsEmpty!4350 mapRes!4350))

(declare-fun b!116715 () Bool)

(declare-fun e!76257 () Bool)

(assert (=> b!116715 (= e!76257 tp_is_empty!2797)))

(declare-fun condMapEmpty!4350 () Bool)

(declare-fun mapDefault!4350 () ValueCell!1055)

(assert (=> mapNonEmpty!4334 (= condMapEmpty!4350 (= mapRest!4334 ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4350)))))

(assert (=> mapNonEmpty!4334 (= tp!10657 (and e!76256 mapRes!4350))))

(declare-fun mapNonEmpty!4350 () Bool)

(declare-fun tp!10686 () Bool)

(assert (=> mapNonEmpty!4350 (= mapRes!4350 (and tp!10686 e!76257))))

(declare-fun mapValue!4350 () ValueCell!1055)

(declare-fun mapRest!4350 () (Array (_ BitVec 32) ValueCell!1055))

(declare-fun mapKey!4350 () (_ BitVec 32))

(assert (=> mapNonEmpty!4350 (= mapRest!4334 (store mapRest!4350 mapKey!4350 mapValue!4350))))

(assert (= (and mapNonEmpty!4334 condMapEmpty!4350) mapIsEmpty!4350))

(assert (= (and mapNonEmpty!4334 (not condMapEmpty!4350)) mapNonEmpty!4350))

(assert (= (and mapNonEmpty!4350 ((_ is ValueCellFull!1055) mapValue!4350)) b!116715))

(assert (= (and mapNonEmpty!4334 ((_ is ValueCellFull!1055) mapDefault!4350)) b!116716))

(declare-fun m!132465 () Bool)

(assert (=> mapNonEmpty!4350 m!132465))

(declare-fun b_lambda!5171 () Bool)

(assert (= b_lambda!5169 (or (and b!116523 b_free!2761) (and b!116531 b_free!2763 (= (defaultEntry!2721 newMap!16) (defaultEntry!2721 (v!3049 (underlying!414 thiss!992))))) b_lambda!5171)))

(check-sat (not b_lambda!5171) (not b_next!2761) (not d!32541) (not b!116704) (not bm!12478) (not bm!12480) (not b!116700) (not b!116697) (not b!116638) (not b!116637) tp_is_empty!2797 (not d!32555) (not b!116636) b_and!7267 (not b!116694) (not bm!12479) (not b!116683) (not d!32551) (not bm!12475) (not d!32557) (not mapNonEmpty!4350) b_and!7265 (not b_next!2763) (not b!116695) (not b!116706) (not d!32553) (not b!116682) (not b!116705) (not b!116698) (not mapNonEmpty!4349) (not b!116689))
(check-sat b_and!7265 b_and!7267 (not b_next!2761) (not b_next!2763))
