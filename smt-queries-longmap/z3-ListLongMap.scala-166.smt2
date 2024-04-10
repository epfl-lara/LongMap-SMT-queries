; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3180 () Bool)

(assert start!3180)

(declare-fun b!19365 () Bool)

(declare-fun b_free!675 () Bool)

(declare-fun b_next!675 () Bool)

(assert (=> b!19365 (= b_free!675 (not b_next!675))))

(declare-fun tp!3233 () Bool)

(declare-fun b_and!1335 () Bool)

(assert (=> b!19365 (= tp!3233 b_and!1335)))

(declare-fun b!19361 () Bool)

(declare-fun e!12493 () Bool)

(declare-fun tp_is_empty!939 () Bool)

(assert (=> b!19361 (= e!12493 tp_is_empty!939)))

(declare-fun b!19362 () Bool)

(declare-fun e!12495 () Bool)

(declare-fun mapRes!860 () Bool)

(assert (=> b!19362 (= e!12495 (and e!12493 mapRes!860))))

(declare-fun condMapEmpty!860 () Bool)

(declare-datatypes ((V!1077 0))(
  ( (V!1078 (val!496 Int)) )
))
(declare-datatypes ((ValueCell!270 0))(
  ( (ValueCellFull!270 (v!1508 V!1077)) (EmptyCell!270) )
))
(declare-datatypes ((array!1091 0))(
  ( (array!1092 (arr!523 (Array (_ BitVec 32) ValueCell!270)) (size!615 (_ BitVec 32))) )
))
(declare-datatypes ((array!1093 0))(
  ( (array!1094 (arr!524 (Array (_ BitVec 32) (_ BitVec 64))) (size!616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!126 0))(
  ( (LongMapFixedSize!127 (defaultEntry!1682 Int) (mask!4629 (_ BitVec 32)) (extraKeys!1592 (_ BitVec 32)) (zeroValue!1616 V!1077) (minValue!1616 V!1077) (_size!96 (_ BitVec 32)) (_keys!3109 array!1093) (_values!1678 array!1091) (_vacant!96 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!126 0))(
  ( (Cell!127 (v!1509 LongMapFixedSize!126)) )
))
(declare-datatypes ((LongMap!126 0))(
  ( (LongMap!127 (underlying!74 Cell!126)) )
))
(declare-fun thiss!938 () LongMap!126)

(declare-fun mapDefault!860 () ValueCell!270)

(assert (=> b!19362 (= condMapEmpty!860 (= (arr!523 (_values!1678 (v!1509 (underlying!74 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!270)) mapDefault!860)))))

(declare-fun b!19363 () Bool)

(declare-fun e!12492 () Bool)

(assert (=> b!19363 (= e!12492 tp_is_empty!939)))

(declare-fun b!19364 () Bool)

(declare-fun e!12490 () Bool)

(declare-fun e!12494 () Bool)

(assert (=> b!19364 (= e!12490 e!12494)))

(declare-fun mapIsEmpty!860 () Bool)

(assert (=> mapIsEmpty!860 mapRes!860))

(declare-fun array_inv!355 (array!1093) Bool)

(declare-fun array_inv!356 (array!1091) Bool)

(assert (=> b!19365 (= e!12494 (and tp!3233 tp_is_empty!939 (array_inv!355 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) (array_inv!356 (_values!1678 (v!1509 (underlying!74 thiss!938)))) e!12495))))

(declare-fun b!19366 () Bool)

(declare-fun e!12491 () Bool)

(assert (=> b!19366 (= e!12491 e!12490)))

(declare-fun b!19367 () Bool)

(declare-fun res!13165 () Bool)

(declare-fun e!12496 () Bool)

(assert (=> b!19367 (=> (not res!13165) (not e!12496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19367 (= res!13165 (validMask!0 (mask!4629 (v!1509 (underlying!74 thiss!938)))))))

(declare-fun mapNonEmpty!860 () Bool)

(declare-fun tp!3232 () Bool)

(assert (=> mapNonEmpty!860 (= mapRes!860 (and tp!3232 e!12492))))

(declare-fun mapKey!860 () (_ BitVec 32))

(declare-fun mapValue!860 () ValueCell!270)

(declare-fun mapRest!860 () (Array (_ BitVec 32) ValueCell!270))

(assert (=> mapNonEmpty!860 (= (arr!523 (_values!1678 (v!1509 (underlying!74 thiss!938)))) (store mapRest!860 mapKey!860 mapValue!860))))

(declare-fun res!13164 () Bool)

(assert (=> start!3180 (=> (not res!13164) (not e!12496))))

(declare-fun valid!58 (LongMap!126) Bool)

(assert (=> start!3180 (= res!13164 (valid!58 thiss!938))))

(assert (=> start!3180 e!12496))

(assert (=> start!3180 e!12491))

(declare-fun b!19368 () Bool)

(assert (=> b!19368 (= e!12496 (and (bvsge (_size!96 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!96 (v!1509 (underlying!74 thiss!938))) (bvadd #b00000000000000000000000000000001 (mask!4629 (v!1509 (underlying!74 thiss!938))))) (bvslt (_vacant!96 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000)))))

(assert (= (and start!3180 res!13164) b!19367))

(assert (= (and b!19367 res!13165) b!19368))

(assert (= (and b!19362 condMapEmpty!860) mapIsEmpty!860))

(assert (= (and b!19362 (not condMapEmpty!860)) mapNonEmpty!860))

(get-info :version)

(assert (= (and mapNonEmpty!860 ((_ is ValueCellFull!270) mapValue!860)) b!19363))

(assert (= (and b!19362 ((_ is ValueCellFull!270) mapDefault!860)) b!19361))

(assert (= b!19365 b!19362))

(assert (= b!19364 b!19365))

(assert (= b!19366 b!19364))

(assert (= start!3180 b!19366))

(declare-fun m!13651 () Bool)

(assert (=> b!19365 m!13651))

(declare-fun m!13653 () Bool)

(assert (=> b!19365 m!13653))

(declare-fun m!13655 () Bool)

(assert (=> b!19367 m!13655))

(declare-fun m!13657 () Bool)

(assert (=> mapNonEmpty!860 m!13657))

(declare-fun m!13659 () Bool)

(assert (=> start!3180 m!13659))

(check-sat (not b!19367) tp_is_empty!939 (not b!19365) (not b_next!675) b_and!1335 (not mapNonEmpty!860) (not start!3180))
(check-sat b_and!1335 (not b_next!675))
(get-model)

(declare-fun d!3587 () Bool)

(declare-fun valid!59 (LongMapFixedSize!126) Bool)

(assert (=> d!3587 (= (valid!58 thiss!938) (valid!59 (v!1509 (underlying!74 thiss!938))))))

(declare-fun bs!870 () Bool)

(assert (= bs!870 d!3587))

(declare-fun m!13671 () Bool)

(assert (=> bs!870 m!13671))

(assert (=> start!3180 d!3587))

(declare-fun d!3589 () Bool)

(assert (=> d!3589 (= (array_inv!355 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) (bvsge (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19365 d!3589))

(declare-fun d!3591 () Bool)

(assert (=> d!3591 (= (array_inv!356 (_values!1678 (v!1509 (underlying!74 thiss!938)))) (bvsge (size!615 (_values!1678 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19365 d!3591))

(declare-fun d!3593 () Bool)

(assert (=> d!3593 (= (validMask!0 (mask!4629 (v!1509 (underlying!74 thiss!938)))) (and (or (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000001111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000011111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000001111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000011111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000001111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000011111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000001111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000011111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000001111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000011111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000001111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000011111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000001111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000011111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000111111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000001111111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000011111111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000111111111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00001111111111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00011111111111111111111111111111) (= (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19367 d!3593))

(declare-fun mapNonEmpty!866 () Bool)

(declare-fun mapRes!866 () Bool)

(declare-fun tp!3242 () Bool)

(declare-fun e!12525 () Bool)

(assert (=> mapNonEmpty!866 (= mapRes!866 (and tp!3242 e!12525))))

(declare-fun mapValue!866 () ValueCell!270)

(declare-fun mapRest!866 () (Array (_ BitVec 32) ValueCell!270))

(declare-fun mapKey!866 () (_ BitVec 32))

(assert (=> mapNonEmpty!866 (= mapRest!860 (store mapRest!866 mapKey!866 mapValue!866))))

(declare-fun condMapEmpty!866 () Bool)

(declare-fun mapDefault!866 () ValueCell!270)

(assert (=> mapNonEmpty!860 (= condMapEmpty!866 (= mapRest!860 ((as const (Array (_ BitVec 32) ValueCell!270)) mapDefault!866)))))

(declare-fun e!12526 () Bool)

(assert (=> mapNonEmpty!860 (= tp!3232 (and e!12526 mapRes!866))))

(declare-fun mapIsEmpty!866 () Bool)

(assert (=> mapIsEmpty!866 mapRes!866))

(declare-fun b!19399 () Bool)

(assert (=> b!19399 (= e!12525 tp_is_empty!939)))

(declare-fun b!19400 () Bool)

(assert (=> b!19400 (= e!12526 tp_is_empty!939)))

(assert (= (and mapNonEmpty!860 condMapEmpty!866) mapIsEmpty!866))

(assert (= (and mapNonEmpty!860 (not condMapEmpty!866)) mapNonEmpty!866))

(assert (= (and mapNonEmpty!866 ((_ is ValueCellFull!270) mapValue!866)) b!19399))

(assert (= (and mapNonEmpty!860 ((_ is ValueCellFull!270) mapDefault!866)) b!19400))

(declare-fun m!13673 () Bool)

(assert (=> mapNonEmpty!866 m!13673))

(check-sat tp_is_empty!939 (not d!3587) (not b_next!675) (not mapNonEmpty!866) b_and!1335)
(check-sat b_and!1335 (not b_next!675))
(get-model)

(declare-fun d!3595 () Bool)

(declare-fun res!13178 () Bool)

(declare-fun e!12529 () Bool)

(assert (=> d!3595 (=> (not res!13178) (not e!12529))))

(declare-fun simpleValid!12 (LongMapFixedSize!126) Bool)

(assert (=> d!3595 (= res!13178 (simpleValid!12 (v!1509 (underlying!74 thiss!938))))))

(assert (=> d!3595 (= (valid!59 (v!1509 (underlying!74 thiss!938))) e!12529)))

(declare-fun b!19407 () Bool)

(declare-fun res!13179 () Bool)

(assert (=> b!19407 (=> (not res!13179) (not e!12529))))

(declare-fun arrayCountValidKeys!0 (array!1093 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19407 (= res!13179 (= (arrayCountValidKeys!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000 (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))) (_size!96 (v!1509 (underlying!74 thiss!938)))))))

(declare-fun b!19408 () Bool)

(declare-fun res!13180 () Bool)

(assert (=> b!19408 (=> (not res!13180) (not e!12529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1093 (_ BitVec 32)) Bool)

(assert (=> b!19408 (= res!13180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3109 (v!1509 (underlying!74 thiss!938))) (mask!4629 (v!1509 (underlying!74 thiss!938)))))))

(declare-fun b!19409 () Bool)

(declare-datatypes ((List!546 0))(
  ( (Nil!543) (Cons!542 (h!1108 (_ BitVec 64)) (t!3189 List!546)) )
))
(declare-fun arrayNoDuplicates!0 (array!1093 (_ BitVec 32) List!546) Bool)

(assert (=> b!19409 (= e!12529 (arrayNoDuplicates!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000 Nil!543))))

(assert (= (and d!3595 res!13178) b!19407))

(assert (= (and b!19407 res!13179) b!19408))

(assert (= (and b!19408 res!13180) b!19409))

(declare-fun m!13675 () Bool)

(assert (=> d!3595 m!13675))

(declare-fun m!13677 () Bool)

(assert (=> b!19407 m!13677))

(declare-fun m!13679 () Bool)

(assert (=> b!19408 m!13679))

(declare-fun m!13681 () Bool)

(assert (=> b!19409 m!13681))

(assert (=> d!3587 d!3595))

(declare-fun mapNonEmpty!867 () Bool)

(declare-fun mapRes!867 () Bool)

(declare-fun tp!3243 () Bool)

(declare-fun e!12530 () Bool)

(assert (=> mapNonEmpty!867 (= mapRes!867 (and tp!3243 e!12530))))

(declare-fun mapValue!867 () ValueCell!270)

(declare-fun mapKey!867 () (_ BitVec 32))

(declare-fun mapRest!867 () (Array (_ BitVec 32) ValueCell!270))

(assert (=> mapNonEmpty!867 (= mapRest!866 (store mapRest!867 mapKey!867 mapValue!867))))

(declare-fun condMapEmpty!867 () Bool)

(declare-fun mapDefault!867 () ValueCell!270)

(assert (=> mapNonEmpty!866 (= condMapEmpty!867 (= mapRest!866 ((as const (Array (_ BitVec 32) ValueCell!270)) mapDefault!867)))))

(declare-fun e!12531 () Bool)

(assert (=> mapNonEmpty!866 (= tp!3242 (and e!12531 mapRes!867))))

(declare-fun mapIsEmpty!867 () Bool)

(assert (=> mapIsEmpty!867 mapRes!867))

(declare-fun b!19410 () Bool)

(assert (=> b!19410 (= e!12530 tp_is_empty!939)))

(declare-fun b!19411 () Bool)

(assert (=> b!19411 (= e!12531 tp_is_empty!939)))

(assert (= (and mapNonEmpty!866 condMapEmpty!867) mapIsEmpty!867))

(assert (= (and mapNonEmpty!866 (not condMapEmpty!867)) mapNonEmpty!867))

(assert (= (and mapNonEmpty!867 ((_ is ValueCellFull!270) mapValue!867)) b!19410))

(assert (= (and mapNonEmpty!866 ((_ is ValueCellFull!270) mapDefault!867)) b!19411))

(declare-fun m!13683 () Bool)

(assert (=> mapNonEmpty!867 m!13683))

(check-sat (not b!19408) (not b!19407) (not b_next!675) (not b!19409) (not d!3595) tp_is_empty!939 b_and!1335 (not mapNonEmpty!867))
(check-sat b_and!1335 (not b_next!675))
(get-model)

(declare-fun b!19420 () Bool)

(declare-fun res!13190 () Bool)

(declare-fun e!12534 () Bool)

(assert (=> b!19420 (=> (not res!13190) (not e!12534))))

(assert (=> b!19420 (= res!13190 (and (= (size!615 (_values!1678 (v!1509 (underlying!74 thiss!938)))) (bvadd (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000001)) (= (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) (size!615 (_values!1678 (v!1509 (underlying!74 thiss!938))))) (bvsge (_size!96 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!96 (v!1509 (underlying!74 thiss!938))) (bvadd (mask!4629 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun b!19422 () Bool)

(declare-fun res!13192 () Bool)

(assert (=> b!19422 (=> (not res!13192) (not e!12534))))

(declare-fun size!619 (LongMapFixedSize!126) (_ BitVec 32))

(assert (=> b!19422 (= res!13192 (= (size!619 (v!1509 (underlying!74 thiss!938))) (bvadd (_size!96 (v!1509 (underlying!74 thiss!938))) (bvsdiv (bvadd (extraKeys!1592 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19421 () Bool)

(declare-fun res!13191 () Bool)

(assert (=> b!19421 (=> (not res!13191) (not e!12534))))

(assert (=> b!19421 (= res!13191 (bvsge (size!619 (v!1509 (underlying!74 thiss!938))) (_size!96 (v!1509 (underlying!74 thiss!938)))))))

(declare-fun d!3597 () Bool)

(declare-fun res!13189 () Bool)

(assert (=> d!3597 (=> (not res!13189) (not e!12534))))

(assert (=> d!3597 (= res!13189 (validMask!0 (mask!4629 (v!1509 (underlying!74 thiss!938)))))))

(assert (=> d!3597 (= (simpleValid!12 (v!1509 (underlying!74 thiss!938))) e!12534)))

(declare-fun b!19423 () Bool)

(assert (=> b!19423 (= e!12534 (and (bvsge (extraKeys!1592 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1592 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!96 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000)))))

(assert (= (and d!3597 res!13189) b!19420))

(assert (= (and b!19420 res!13190) b!19421))

(assert (= (and b!19421 res!13191) b!19422))

(assert (= (and b!19422 res!13192) b!19423))

(declare-fun m!13685 () Bool)

(assert (=> b!19422 m!13685))

(assert (=> b!19421 m!13685))

(assert (=> d!3597 m!13655))

(assert (=> d!3595 d!3597))

(declare-fun d!3599 () Bool)

(declare-fun lt!5415 () (_ BitVec 32))

(assert (=> d!3599 (and (bvsge lt!5415 #b00000000000000000000000000000000) (bvsle lt!5415 (bvsub (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun e!12539 () (_ BitVec 32))

(assert (=> d!3599 (= lt!5415 e!12539)))

(declare-fun c!2073 () Bool)

(assert (=> d!3599 (= c!2073 (bvsge #b00000000000000000000000000000000 (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))))))

(assert (=> d!3599 (and (bvsle #b00000000000000000000000000000000 (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))))))

(assert (=> d!3599 (= (arrayCountValidKeys!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000 (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))) lt!5415)))

(declare-fun bm!895 () Bool)

(declare-fun call!898 () (_ BitVec 32))

(assert (=> bm!895 (= call!898 (arrayCountValidKeys!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))))))

(declare-fun b!19432 () Bool)

(declare-fun e!12540 () (_ BitVec 32))

(assert (=> b!19432 (= e!12540 call!898)))

(declare-fun b!19433 () Bool)

(assert (=> b!19433 (= e!12539 #b00000000000000000000000000000000)))

(declare-fun b!19434 () Bool)

(assert (=> b!19434 (= e!12540 (bvadd #b00000000000000000000000000000001 call!898))))

(declare-fun b!19435 () Bool)

(assert (=> b!19435 (= e!12539 e!12540)))

(declare-fun c!2072 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19435 (= c!2072 (validKeyInArray!0 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3599 c!2073) b!19433))

(assert (= (and d!3599 (not c!2073)) b!19435))

(assert (= (and b!19435 c!2072) b!19434))

(assert (= (and b!19435 (not c!2072)) b!19432))

(assert (= (or b!19434 b!19432) bm!895))

(declare-fun m!13687 () Bool)

(assert (=> bm!895 m!13687))

(declare-fun m!13689 () Bool)

(assert (=> b!19435 m!13689))

(assert (=> b!19435 m!13689))

(declare-fun m!13691 () Bool)

(assert (=> b!19435 m!13691))

(assert (=> b!19407 d!3599))

(declare-fun b!19444 () Bool)

(declare-fun e!12547 () Bool)

(declare-fun e!12548 () Bool)

(assert (=> b!19444 (= e!12547 e!12548)))

(declare-fun lt!5424 () (_ BitVec 64))

(assert (=> b!19444 (= lt!5424 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!382 0))(
  ( (Unit!383) )
))
(declare-fun lt!5422 () Unit!382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1093 (_ BitVec 64) (_ BitVec 32)) Unit!382)

(assert (=> b!19444 (= lt!5422 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) lt!5424 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19444 (arrayContainsKey!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) lt!5424 #b00000000000000000000000000000000)))

(declare-fun lt!5423 () Unit!382)

(assert (=> b!19444 (= lt!5423 lt!5422)))

(declare-fun res!13197 () Bool)

(declare-datatypes ((SeekEntryResult!46 0))(
  ( (MissingZero!46 (index!2304 (_ BitVec 32))) (Found!46 (index!2305 (_ BitVec 32))) (Intermediate!46 (undefined!858 Bool) (index!2306 (_ BitVec 32)) (x!4757 (_ BitVec 32))) (Undefined!46) (MissingVacant!46 (index!2307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1093 (_ BitVec 32)) SeekEntryResult!46)

(assert (=> b!19444 (= res!13197 (= (seekEntryOrOpen!0 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000) (_keys!3109 (v!1509 (underlying!74 thiss!938))) (mask!4629 (v!1509 (underlying!74 thiss!938)))) (Found!46 #b00000000000000000000000000000000)))))

(assert (=> b!19444 (=> (not res!13197) (not e!12548))))

(declare-fun d!3601 () Bool)

(declare-fun res!13198 () Bool)

(declare-fun e!12549 () Bool)

(assert (=> d!3601 (=> res!13198 e!12549)))

(assert (=> d!3601 (= res!13198 (bvsge #b00000000000000000000000000000000 (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))))))

(assert (=> d!3601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3109 (v!1509 (underlying!74 thiss!938))) (mask!4629 (v!1509 (underlying!74 thiss!938)))) e!12549)))

(declare-fun b!19445 () Bool)

(assert (=> b!19445 (= e!12549 e!12547)))

(declare-fun c!2076 () Bool)

(assert (=> b!19445 (= c!2076 (validKeyInArray!0 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun bm!898 () Bool)

(declare-fun call!901 () Bool)

(assert (=> bm!898 (= call!901 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3109 (v!1509 (underlying!74 thiss!938))) (mask!4629 (v!1509 (underlying!74 thiss!938)))))))

(declare-fun b!19446 () Bool)

(assert (=> b!19446 (= e!12547 call!901)))

(declare-fun b!19447 () Bool)

(assert (=> b!19447 (= e!12548 call!901)))

(assert (= (and d!3601 (not res!13198)) b!19445))

(assert (= (and b!19445 c!2076) b!19444))

(assert (= (and b!19445 (not c!2076)) b!19446))

(assert (= (and b!19444 res!13197) b!19447))

(assert (= (or b!19447 b!19446) bm!898))

(assert (=> b!19444 m!13689))

(declare-fun m!13693 () Bool)

(assert (=> b!19444 m!13693))

(declare-fun m!13695 () Bool)

(assert (=> b!19444 m!13695))

(assert (=> b!19444 m!13689))

(declare-fun m!13697 () Bool)

(assert (=> b!19444 m!13697))

(assert (=> b!19445 m!13689))

(assert (=> b!19445 m!13689))

(assert (=> b!19445 m!13691))

(declare-fun m!13699 () Bool)

(assert (=> bm!898 m!13699))

(assert (=> b!19408 d!3601))

(declare-fun b!19458 () Bool)

(declare-fun e!12558 () Bool)

(declare-fun call!904 () Bool)

(assert (=> b!19458 (= e!12558 call!904)))

(declare-fun b!19459 () Bool)

(assert (=> b!19459 (= e!12558 call!904)))

(declare-fun bm!901 () Bool)

(declare-fun c!2079 () Bool)

(assert (=> bm!901 (= call!904 (arrayNoDuplicates!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2079 (Cons!542 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000) Nil!543) Nil!543)))))

(declare-fun b!19460 () Bool)

(declare-fun e!12560 () Bool)

(declare-fun e!12561 () Bool)

(assert (=> b!19460 (= e!12560 e!12561)))

(declare-fun res!13206 () Bool)

(assert (=> b!19460 (=> (not res!13206) (not e!12561))))

(declare-fun e!12559 () Bool)

(assert (=> b!19460 (= res!13206 (not e!12559))))

(declare-fun res!13207 () Bool)

(assert (=> b!19460 (=> (not res!13207) (not e!12559))))

(assert (=> b!19460 (= res!13207 (validKeyInArray!0 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun d!3603 () Bool)

(declare-fun res!13205 () Bool)

(assert (=> d!3603 (=> res!13205 e!12560)))

(assert (=> d!3603 (= res!13205 (bvsge #b00000000000000000000000000000000 (size!616 (_keys!3109 (v!1509 (underlying!74 thiss!938))))))))

(assert (=> d!3603 (= (arrayNoDuplicates!0 (_keys!3109 (v!1509 (underlying!74 thiss!938))) #b00000000000000000000000000000000 Nil!543) e!12560)))

(declare-fun b!19461 () Bool)

(assert (=> b!19461 (= e!12561 e!12558)))

(assert (=> b!19461 (= c!2079 (validKeyInArray!0 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19462 () Bool)

(declare-fun contains!220 (List!546 (_ BitVec 64)) Bool)

(assert (=> b!19462 (= e!12559 (contains!220 Nil!543 (select (arr!524 (_keys!3109 (v!1509 (underlying!74 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3603 (not res!13205)) b!19460))

(assert (= (and b!19460 res!13207) b!19462))

(assert (= (and b!19460 res!13206) b!19461))

(assert (= (and b!19461 c!2079) b!19459))

(assert (= (and b!19461 (not c!2079)) b!19458))

(assert (= (or b!19459 b!19458) bm!901))

(assert (=> bm!901 m!13689))

(declare-fun m!13701 () Bool)

(assert (=> bm!901 m!13701))

(assert (=> b!19460 m!13689))

(assert (=> b!19460 m!13689))

(assert (=> b!19460 m!13691))

(assert (=> b!19461 m!13689))

(assert (=> b!19461 m!13689))

(assert (=> b!19461 m!13691))

(assert (=> b!19462 m!13689))

(assert (=> b!19462 m!13689))

(declare-fun m!13703 () Bool)

(assert (=> b!19462 m!13703))

(assert (=> b!19409 d!3603))

(declare-fun mapNonEmpty!868 () Bool)

(declare-fun mapRes!868 () Bool)

(declare-fun tp!3244 () Bool)

(declare-fun e!12562 () Bool)

(assert (=> mapNonEmpty!868 (= mapRes!868 (and tp!3244 e!12562))))

(declare-fun mapKey!868 () (_ BitVec 32))

(declare-fun mapRest!868 () (Array (_ BitVec 32) ValueCell!270))

(declare-fun mapValue!868 () ValueCell!270)

(assert (=> mapNonEmpty!868 (= mapRest!867 (store mapRest!868 mapKey!868 mapValue!868))))

(declare-fun condMapEmpty!868 () Bool)

(declare-fun mapDefault!868 () ValueCell!270)

(assert (=> mapNonEmpty!867 (= condMapEmpty!868 (= mapRest!867 ((as const (Array (_ BitVec 32) ValueCell!270)) mapDefault!868)))))

(declare-fun e!12563 () Bool)

(assert (=> mapNonEmpty!867 (= tp!3243 (and e!12563 mapRes!868))))

(declare-fun mapIsEmpty!868 () Bool)

(assert (=> mapIsEmpty!868 mapRes!868))

(declare-fun b!19463 () Bool)

(assert (=> b!19463 (= e!12562 tp_is_empty!939)))

(declare-fun b!19464 () Bool)

(assert (=> b!19464 (= e!12563 tp_is_empty!939)))

(assert (= (and mapNonEmpty!867 condMapEmpty!868) mapIsEmpty!868))

(assert (= (and mapNonEmpty!867 (not condMapEmpty!868)) mapNonEmpty!868))

(assert (= (and mapNonEmpty!868 ((_ is ValueCellFull!270) mapValue!868)) b!19463))

(assert (= (and mapNonEmpty!867 ((_ is ValueCellFull!270) mapDefault!868)) b!19464))

(declare-fun m!13705 () Bool)

(assert (=> mapNonEmpty!868 m!13705))

(check-sat tp_is_empty!939 (not b!19422) (not b!19435) (not bm!901) b_and!1335 (not b!19461) (not b!19462) (not mapNonEmpty!868) (not b!19444) (not b_next!675) (not b!19445) (not d!3597) (not bm!895) (not bm!898) (not b!19421) (not b!19460))
(check-sat b_and!1335 (not b_next!675))
