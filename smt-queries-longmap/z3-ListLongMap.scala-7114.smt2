; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90160 () Bool)

(assert start!90160)

(declare-fun b!1032465 () Bool)

(declare-fun b_free!20737 () Bool)

(declare-fun b_next!20737 () Bool)

(assert (=> b!1032465 (= b_free!20737 (not b_next!20737))))

(declare-fun tp!73289 () Bool)

(declare-fun b_and!33179 () Bool)

(assert (=> b!1032465 (= tp!73289 b_and!33179)))

(declare-fun mapIsEmpty!38147 () Bool)

(declare-fun mapRes!38147 () Bool)

(assert (=> mapIsEmpty!38147 mapRes!38147))

(declare-fun b!1032462 () Bool)

(declare-fun e!583405 () Bool)

(declare-fun tp_is_empty!24457 () Bool)

(assert (=> b!1032462 (= e!583405 tp_is_empty!24457)))

(declare-fun b!1032463 () Bool)

(declare-fun e!583409 () Bool)

(assert (=> b!1032463 (= e!583409 (and e!583405 mapRes!38147))))

(declare-fun condMapEmpty!38147 () Bool)

(declare-datatypes ((V!37483 0))(
  ( (V!37484 (val!12279 Int)) )
))
(declare-datatypes ((ValueCell!11525 0))(
  ( (ValueCellFull!11525 (v!14855 V!37483)) (EmptyCell!11525) )
))
(declare-datatypes ((array!64921 0))(
  ( (array!64922 (arr!31260 (Array (_ BitVec 32) (_ BitVec 64))) (size!31781 (_ BitVec 32))) )
))
(declare-datatypes ((array!64923 0))(
  ( (array!64924 (arr!31261 (Array (_ BitVec 32) ValueCell!11525)) (size!31782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5644 0))(
  ( (LongMapFixedSize!5645 (defaultEntry!6196 Int) (mask!30017 (_ BitVec 32)) (extraKeys!5928 (_ BitVec 32)) (zeroValue!6032 V!37483) (minValue!6032 V!37483) (_size!2877 (_ BitVec 32)) (_keys!11367 array!64921) (_values!6219 array!64923) (_vacant!2877 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5644)

(declare-fun mapDefault!38147 () ValueCell!11525)

(assert (=> b!1032463 (= condMapEmpty!38147 (= (arr!31261 (_values!6219 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11525)) mapDefault!38147)))))

(declare-fun res!690058 () Bool)

(declare-fun e!583410 () Bool)

(assert (=> start!90160 (=> (not res!690058) (not e!583410))))

(declare-fun valid!2125 (LongMapFixedSize!5644) Bool)

(assert (=> start!90160 (= res!690058 (valid!2125 thiss!1427))))

(assert (=> start!90160 e!583410))

(declare-fun e!583406 () Bool)

(assert (=> start!90160 e!583406))

(assert (=> start!90160 true))

(declare-fun b!1032464 () Bool)

(declare-fun res!690057 () Bool)

(assert (=> b!1032464 (=> (not res!690057) (not e!583410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032464 (= res!690057 (validMask!0 (mask!30017 thiss!1427)))))

(declare-fun array_inv!24189 (array!64921) Bool)

(declare-fun array_inv!24190 (array!64923) Bool)

(assert (=> b!1032465 (= e!583406 (and tp!73289 tp_is_empty!24457 (array_inv!24189 (_keys!11367 thiss!1427)) (array_inv!24190 (_values!6219 thiss!1427)) e!583409))))

(declare-fun mapNonEmpty!38147 () Bool)

(declare-fun tp!73290 () Bool)

(declare-fun e!583408 () Bool)

(assert (=> mapNonEmpty!38147 (= mapRes!38147 (and tp!73290 e!583408))))

(declare-fun mapRest!38147 () (Array (_ BitVec 32) ValueCell!11525))

(declare-fun mapValue!38147 () ValueCell!11525)

(declare-fun mapKey!38147 () (_ BitVec 32))

(assert (=> mapNonEmpty!38147 (= (arr!31261 (_values!6219 thiss!1427)) (store mapRest!38147 mapKey!38147 mapValue!38147))))

(declare-fun b!1032466 () Bool)

(declare-fun res!690056 () Bool)

(assert (=> b!1032466 (=> (not res!690056) (not e!583410))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032466 (= res!690056 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032467 () Bool)

(assert (=> b!1032467 (= e!583410 (and (= (size!31782 (_values!6219 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30017 thiss!1427))) (not (= (size!31781 (_keys!11367 thiss!1427)) (size!31782 (_values!6219 thiss!1427))))))))

(declare-fun b!1032468 () Bool)

(assert (=> b!1032468 (= e!583408 tp_is_empty!24457)))

(assert (= (and start!90160 res!690058) b!1032466))

(assert (= (and b!1032466 res!690056) b!1032464))

(assert (= (and b!1032464 res!690057) b!1032467))

(assert (= (and b!1032463 condMapEmpty!38147) mapIsEmpty!38147))

(assert (= (and b!1032463 (not condMapEmpty!38147)) mapNonEmpty!38147))

(get-info :version)

(assert (= (and mapNonEmpty!38147 ((_ is ValueCellFull!11525) mapValue!38147)) b!1032468))

(assert (= (and b!1032463 ((_ is ValueCellFull!11525) mapDefault!38147)) b!1032462))

(assert (= b!1032465 b!1032463))

(assert (= start!90160 b!1032465))

(declare-fun m!952181 () Bool)

(assert (=> start!90160 m!952181))

(declare-fun m!952183 () Bool)

(assert (=> b!1032464 m!952183))

(declare-fun m!952185 () Bool)

(assert (=> b!1032465 m!952185))

(declare-fun m!952187 () Bool)

(assert (=> b!1032465 m!952187))

(declare-fun m!952189 () Bool)

(assert (=> mapNonEmpty!38147 m!952189))

(check-sat (not b_next!20737) tp_is_empty!24457 (not b!1032465) (not mapNonEmpty!38147) (not b!1032464) (not start!90160) b_and!33179)
(check-sat b_and!33179 (not b_next!20737))
(get-model)

(declare-fun d!123557 () Bool)

(assert (=> d!123557 (= (array_inv!24189 (_keys!11367 thiss!1427)) (bvsge (size!31781 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032465 d!123557))

(declare-fun d!123559 () Bool)

(assert (=> d!123559 (= (array_inv!24190 (_values!6219 thiss!1427)) (bvsge (size!31782 (_values!6219 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032465 d!123559))

(declare-fun d!123561 () Bool)

(assert (=> d!123561 (= (validMask!0 (mask!30017 thiss!1427)) (and (or (= (mask!30017 thiss!1427) #b00000000000000000000000000000111) (= (mask!30017 thiss!1427) #b00000000000000000000000000001111) (= (mask!30017 thiss!1427) #b00000000000000000000000000011111) (= (mask!30017 thiss!1427) #b00000000000000000000000000111111) (= (mask!30017 thiss!1427) #b00000000000000000000000001111111) (= (mask!30017 thiss!1427) #b00000000000000000000000011111111) (= (mask!30017 thiss!1427) #b00000000000000000000000111111111) (= (mask!30017 thiss!1427) #b00000000000000000000001111111111) (= (mask!30017 thiss!1427) #b00000000000000000000011111111111) (= (mask!30017 thiss!1427) #b00000000000000000000111111111111) (= (mask!30017 thiss!1427) #b00000000000000000001111111111111) (= (mask!30017 thiss!1427) #b00000000000000000011111111111111) (= (mask!30017 thiss!1427) #b00000000000000000111111111111111) (= (mask!30017 thiss!1427) #b00000000000000001111111111111111) (= (mask!30017 thiss!1427) #b00000000000000011111111111111111) (= (mask!30017 thiss!1427) #b00000000000000111111111111111111) (= (mask!30017 thiss!1427) #b00000000000001111111111111111111) (= (mask!30017 thiss!1427) #b00000000000011111111111111111111) (= (mask!30017 thiss!1427) #b00000000000111111111111111111111) (= (mask!30017 thiss!1427) #b00000000001111111111111111111111) (= (mask!30017 thiss!1427) #b00000000011111111111111111111111) (= (mask!30017 thiss!1427) #b00000000111111111111111111111111) (= (mask!30017 thiss!1427) #b00000001111111111111111111111111) (= (mask!30017 thiss!1427) #b00000011111111111111111111111111) (= (mask!30017 thiss!1427) #b00000111111111111111111111111111) (= (mask!30017 thiss!1427) #b00001111111111111111111111111111) (= (mask!30017 thiss!1427) #b00011111111111111111111111111111) (= (mask!30017 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30017 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032464 d!123561))

(declare-fun d!123563 () Bool)

(declare-fun res!690083 () Bool)

(declare-fun e!583449 () Bool)

(assert (=> d!123563 (=> (not res!690083) (not e!583449))))

(declare-fun simpleValid!399 (LongMapFixedSize!5644) Bool)

(assert (=> d!123563 (= res!690083 (simpleValid!399 thiss!1427))))

(assert (=> d!123563 (= (valid!2125 thiss!1427) e!583449)))

(declare-fun b!1032517 () Bool)

(declare-fun res!690084 () Bool)

(assert (=> b!1032517 (=> (not res!690084) (not e!583449))))

(declare-fun arrayCountValidKeys!0 (array!64921 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032517 (= res!690084 (= (arrayCountValidKeys!0 (_keys!11367 thiss!1427) #b00000000000000000000000000000000 (size!31781 (_keys!11367 thiss!1427))) (_size!2877 thiss!1427)))))

(declare-fun b!1032518 () Bool)

(declare-fun res!690085 () Bool)

(assert (=> b!1032518 (=> (not res!690085) (not e!583449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64921 (_ BitVec 32)) Bool)

(assert (=> b!1032518 (= res!690085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11367 thiss!1427) (mask!30017 thiss!1427)))))

(declare-fun b!1032519 () Bool)

(declare-datatypes ((List!21933 0))(
  ( (Nil!21930) (Cons!21929 (h!23131 (_ BitVec 64)) (t!31118 List!21933)) )
))
(declare-fun arrayNoDuplicates!0 (array!64921 (_ BitVec 32) List!21933) Bool)

(assert (=> b!1032519 (= e!583449 (arrayNoDuplicates!0 (_keys!11367 thiss!1427) #b00000000000000000000000000000000 Nil!21930))))

(assert (= (and d!123563 res!690083) b!1032517))

(assert (= (and b!1032517 res!690084) b!1032518))

(assert (= (and b!1032518 res!690085) b!1032519))

(declare-fun m!952211 () Bool)

(assert (=> d!123563 m!952211))

(declare-fun m!952213 () Bool)

(assert (=> b!1032517 m!952213))

(declare-fun m!952215 () Bool)

(assert (=> b!1032518 m!952215))

(declare-fun m!952217 () Bool)

(assert (=> b!1032519 m!952217))

(assert (=> start!90160 d!123563))

(declare-fun mapIsEmpty!38156 () Bool)

(declare-fun mapRes!38156 () Bool)

(assert (=> mapIsEmpty!38156 mapRes!38156))

(declare-fun b!1032527 () Bool)

(declare-fun e!583455 () Bool)

(assert (=> b!1032527 (= e!583455 tp_is_empty!24457)))

(declare-fun condMapEmpty!38156 () Bool)

(declare-fun mapDefault!38156 () ValueCell!11525)

(assert (=> mapNonEmpty!38147 (= condMapEmpty!38156 (= mapRest!38147 ((as const (Array (_ BitVec 32) ValueCell!11525)) mapDefault!38156)))))

(assert (=> mapNonEmpty!38147 (= tp!73290 (and e!583455 mapRes!38156))))

(declare-fun mapNonEmpty!38156 () Bool)

(declare-fun tp!73305 () Bool)

(declare-fun e!583454 () Bool)

(assert (=> mapNonEmpty!38156 (= mapRes!38156 (and tp!73305 e!583454))))

(declare-fun mapRest!38156 () (Array (_ BitVec 32) ValueCell!11525))

(declare-fun mapKey!38156 () (_ BitVec 32))

(declare-fun mapValue!38156 () ValueCell!11525)

(assert (=> mapNonEmpty!38156 (= mapRest!38147 (store mapRest!38156 mapKey!38156 mapValue!38156))))

(declare-fun b!1032526 () Bool)

(assert (=> b!1032526 (= e!583454 tp_is_empty!24457)))

(assert (= (and mapNonEmpty!38147 condMapEmpty!38156) mapIsEmpty!38156))

(assert (= (and mapNonEmpty!38147 (not condMapEmpty!38156)) mapNonEmpty!38156))

(assert (= (and mapNonEmpty!38156 ((_ is ValueCellFull!11525) mapValue!38156)) b!1032526))

(assert (= (and mapNonEmpty!38147 ((_ is ValueCellFull!11525) mapDefault!38156)) b!1032527))

(declare-fun m!952219 () Bool)

(assert (=> mapNonEmpty!38156 m!952219))

(check-sat (not b_next!20737) tp_is_empty!24457 (not b!1032519) (not mapNonEmpty!38156) (not d!123563) (not b!1032517) b_and!33179 (not b!1032518))
(check-sat b_and!33179 (not b_next!20737))
(get-model)

(declare-fun d!123565 () Bool)

(declare-fun res!690094 () Bool)

(declare-fun e!583458 () Bool)

(assert (=> d!123565 (=> (not res!690094) (not e!583458))))

(assert (=> d!123565 (= res!690094 (validMask!0 (mask!30017 thiss!1427)))))

(assert (=> d!123565 (= (simpleValid!399 thiss!1427) e!583458)))

(declare-fun b!1032536 () Bool)

(declare-fun res!690095 () Bool)

(assert (=> b!1032536 (=> (not res!690095) (not e!583458))))

(assert (=> b!1032536 (= res!690095 (and (= (size!31782 (_values!6219 thiss!1427)) (bvadd (mask!30017 thiss!1427) #b00000000000000000000000000000001)) (= (size!31781 (_keys!11367 thiss!1427)) (size!31782 (_values!6219 thiss!1427))) (bvsge (_size!2877 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2877 thiss!1427) (bvadd (mask!30017 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1032539 () Bool)

(assert (=> b!1032539 (= e!583458 (and (bvsge (extraKeys!5928 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5928 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2877 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032537 () Bool)

(declare-fun res!690096 () Bool)

(assert (=> b!1032537 (=> (not res!690096) (not e!583458))))

(declare-fun size!31787 (LongMapFixedSize!5644) (_ BitVec 32))

(assert (=> b!1032537 (= res!690096 (bvsge (size!31787 thiss!1427) (_size!2877 thiss!1427)))))

(declare-fun b!1032538 () Bool)

(declare-fun res!690097 () Bool)

(assert (=> b!1032538 (=> (not res!690097) (not e!583458))))

(assert (=> b!1032538 (= res!690097 (= (size!31787 thiss!1427) (bvadd (_size!2877 thiss!1427) (bvsdiv (bvadd (extraKeys!5928 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!123565 res!690094) b!1032536))

(assert (= (and b!1032536 res!690095) b!1032537))

(assert (= (and b!1032537 res!690096) b!1032538))

(assert (= (and b!1032538 res!690097) b!1032539))

(assert (=> d!123565 m!952183))

(declare-fun m!952221 () Bool)

(assert (=> b!1032537 m!952221))

(assert (=> b!1032538 m!952221))

(assert (=> d!123563 d!123565))

(declare-fun b!1032550 () Bool)

(declare-fun e!583467 () Bool)

(declare-fun e!583469 () Bool)

(assert (=> b!1032550 (= e!583467 e!583469)))

(declare-fun c!104289 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032550 (= c!104289 (validKeyInArray!0 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032551 () Bool)

(declare-fun e!583470 () Bool)

(declare-fun contains!5988 (List!21933 (_ BitVec 64)) Bool)

(assert (=> b!1032551 (= e!583470 (contains!5988 Nil!21930 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032552 () Bool)

(declare-fun call!43588 () Bool)

(assert (=> b!1032552 (= e!583469 call!43588)))

(declare-fun bm!43585 () Bool)

(assert (=> bm!43585 (= call!43588 (arrayNoDuplicates!0 (_keys!11367 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104289 (Cons!21929 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000) Nil!21930) Nil!21930)))))

(declare-fun d!123567 () Bool)

(declare-fun res!690105 () Bool)

(declare-fun e!583468 () Bool)

(assert (=> d!123567 (=> res!690105 e!583468)))

(assert (=> d!123567 (= res!690105 (bvsge #b00000000000000000000000000000000 (size!31781 (_keys!11367 thiss!1427))))))

(assert (=> d!123567 (= (arrayNoDuplicates!0 (_keys!11367 thiss!1427) #b00000000000000000000000000000000 Nil!21930) e!583468)))

(declare-fun b!1032553 () Bool)

(assert (=> b!1032553 (= e!583468 e!583467)))

(declare-fun res!690104 () Bool)

(assert (=> b!1032553 (=> (not res!690104) (not e!583467))))

(assert (=> b!1032553 (= res!690104 (not e!583470))))

(declare-fun res!690106 () Bool)

(assert (=> b!1032553 (=> (not res!690106) (not e!583470))))

(assert (=> b!1032553 (= res!690106 (validKeyInArray!0 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032554 () Bool)

(assert (=> b!1032554 (= e!583469 call!43588)))

(assert (= (and d!123567 (not res!690105)) b!1032553))

(assert (= (and b!1032553 res!690106) b!1032551))

(assert (= (and b!1032553 res!690104) b!1032550))

(assert (= (and b!1032550 c!104289) b!1032552))

(assert (= (and b!1032550 (not c!104289)) b!1032554))

(assert (= (or b!1032552 b!1032554) bm!43585))

(declare-fun m!952223 () Bool)

(assert (=> b!1032550 m!952223))

(assert (=> b!1032550 m!952223))

(declare-fun m!952225 () Bool)

(assert (=> b!1032550 m!952225))

(assert (=> b!1032551 m!952223))

(assert (=> b!1032551 m!952223))

(declare-fun m!952227 () Bool)

(assert (=> b!1032551 m!952227))

(assert (=> bm!43585 m!952223))

(declare-fun m!952229 () Bool)

(assert (=> bm!43585 m!952229))

(assert (=> b!1032553 m!952223))

(assert (=> b!1032553 m!952223))

(assert (=> b!1032553 m!952225))

(assert (=> b!1032519 d!123567))

(declare-fun b!1032563 () Bool)

(declare-fun e!583476 () (_ BitVec 32))

(declare-fun call!43591 () (_ BitVec 32))

(assert (=> b!1032563 (= e!583476 call!43591)))

(declare-fun b!1032564 () Bool)

(declare-fun e!583475 () (_ BitVec 32))

(assert (=> b!1032564 (= e!583475 #b00000000000000000000000000000000)))

(declare-fun b!1032565 () Bool)

(assert (=> b!1032565 (= e!583475 e!583476)))

(declare-fun c!104295 () Bool)

(assert (=> b!1032565 (= c!104295 (validKeyInArray!0 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123569 () Bool)

(declare-fun lt!455856 () (_ BitVec 32))

(assert (=> d!123569 (and (bvsge lt!455856 #b00000000000000000000000000000000) (bvsle lt!455856 (bvsub (size!31781 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123569 (= lt!455856 e!583475)))

(declare-fun c!104294 () Bool)

(assert (=> d!123569 (= c!104294 (bvsge #b00000000000000000000000000000000 (size!31781 (_keys!11367 thiss!1427))))))

(assert (=> d!123569 (and (bvsle #b00000000000000000000000000000000 (size!31781 (_keys!11367 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31781 (_keys!11367 thiss!1427)) (size!31781 (_keys!11367 thiss!1427))))))

(assert (=> d!123569 (= (arrayCountValidKeys!0 (_keys!11367 thiss!1427) #b00000000000000000000000000000000 (size!31781 (_keys!11367 thiss!1427))) lt!455856)))

(declare-fun b!1032566 () Bool)

(assert (=> b!1032566 (= e!583476 (bvadd #b00000000000000000000000000000001 call!43591))))

(declare-fun bm!43588 () Bool)

(assert (=> bm!43588 (= call!43591 (arrayCountValidKeys!0 (_keys!11367 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31781 (_keys!11367 thiss!1427))))))

(assert (= (and d!123569 c!104294) b!1032564))

(assert (= (and d!123569 (not c!104294)) b!1032565))

(assert (= (and b!1032565 c!104295) b!1032566))

(assert (= (and b!1032565 (not c!104295)) b!1032563))

(assert (= (or b!1032566 b!1032563) bm!43588))

(assert (=> b!1032565 m!952223))

(assert (=> b!1032565 m!952223))

(assert (=> b!1032565 m!952225))

(declare-fun m!952231 () Bool)

(assert (=> bm!43588 m!952231))

(assert (=> b!1032517 d!123569))

(declare-fun bm!43591 () Bool)

(declare-fun call!43594 () Bool)

(assert (=> bm!43591 (= call!43594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11367 thiss!1427) (mask!30017 thiss!1427)))))

(declare-fun b!1032575 () Bool)

(declare-fun e!583483 () Bool)

(assert (=> b!1032575 (= e!583483 call!43594)))

(declare-fun b!1032576 () Bool)

(declare-fun e!583485 () Bool)

(assert (=> b!1032576 (= e!583485 e!583483)))

(declare-fun lt!455864 () (_ BitVec 64))

(assert (=> b!1032576 (= lt!455864 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33703 0))(
  ( (Unit!33704) )
))
(declare-fun lt!455863 () Unit!33703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64921 (_ BitVec 64) (_ BitVec 32)) Unit!33703)

(assert (=> b!1032576 (= lt!455863 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11367 thiss!1427) lt!455864 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032576 (arrayContainsKey!0 (_keys!11367 thiss!1427) lt!455864 #b00000000000000000000000000000000)))

(declare-fun lt!455865 () Unit!33703)

(assert (=> b!1032576 (= lt!455865 lt!455863)))

(declare-fun res!690112 () Bool)

(declare-datatypes ((SeekEntryResult!9724 0))(
  ( (MissingZero!9724 (index!41267 (_ BitVec 32))) (Found!9724 (index!41268 (_ BitVec 32))) (Intermediate!9724 (undefined!10536 Bool) (index!41269 (_ BitVec 32)) (x!92043 (_ BitVec 32))) (Undefined!9724) (MissingVacant!9724 (index!41270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64921 (_ BitVec 32)) SeekEntryResult!9724)

(assert (=> b!1032576 (= res!690112 (= (seekEntryOrOpen!0 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000) (_keys!11367 thiss!1427) (mask!30017 thiss!1427)) (Found!9724 #b00000000000000000000000000000000)))))

(assert (=> b!1032576 (=> (not res!690112) (not e!583483))))

(declare-fun b!1032577 () Bool)

(declare-fun e!583484 () Bool)

(assert (=> b!1032577 (= e!583484 e!583485)))

(declare-fun c!104298 () Bool)

(assert (=> b!1032577 (= c!104298 (validKeyInArray!0 (select (arr!31260 (_keys!11367 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032578 () Bool)

(assert (=> b!1032578 (= e!583485 call!43594)))

(declare-fun d!123571 () Bool)

(declare-fun res!690111 () Bool)

(assert (=> d!123571 (=> res!690111 e!583484)))

(assert (=> d!123571 (= res!690111 (bvsge #b00000000000000000000000000000000 (size!31781 (_keys!11367 thiss!1427))))))

(assert (=> d!123571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11367 thiss!1427) (mask!30017 thiss!1427)) e!583484)))

(assert (= (and d!123571 (not res!690111)) b!1032577))

(assert (= (and b!1032577 c!104298) b!1032576))

(assert (= (and b!1032577 (not c!104298)) b!1032578))

(assert (= (and b!1032576 res!690112) b!1032575))

(assert (= (or b!1032575 b!1032578) bm!43591))

(declare-fun m!952233 () Bool)

(assert (=> bm!43591 m!952233))

(assert (=> b!1032576 m!952223))

(declare-fun m!952235 () Bool)

(assert (=> b!1032576 m!952235))

(declare-fun m!952237 () Bool)

(assert (=> b!1032576 m!952237))

(assert (=> b!1032576 m!952223))

(declare-fun m!952239 () Bool)

(assert (=> b!1032576 m!952239))

(assert (=> b!1032577 m!952223))

(assert (=> b!1032577 m!952223))

(assert (=> b!1032577 m!952225))

(assert (=> b!1032518 d!123571))

(declare-fun mapIsEmpty!38157 () Bool)

(declare-fun mapRes!38157 () Bool)

(assert (=> mapIsEmpty!38157 mapRes!38157))

(declare-fun b!1032580 () Bool)

(declare-fun e!583487 () Bool)

(assert (=> b!1032580 (= e!583487 tp_is_empty!24457)))

(declare-fun condMapEmpty!38157 () Bool)

(declare-fun mapDefault!38157 () ValueCell!11525)

(assert (=> mapNonEmpty!38156 (= condMapEmpty!38157 (= mapRest!38156 ((as const (Array (_ BitVec 32) ValueCell!11525)) mapDefault!38157)))))

(assert (=> mapNonEmpty!38156 (= tp!73305 (and e!583487 mapRes!38157))))

(declare-fun mapNonEmpty!38157 () Bool)

(declare-fun tp!73306 () Bool)

(declare-fun e!583486 () Bool)

(assert (=> mapNonEmpty!38157 (= mapRes!38157 (and tp!73306 e!583486))))

(declare-fun mapValue!38157 () ValueCell!11525)

(declare-fun mapRest!38157 () (Array (_ BitVec 32) ValueCell!11525))

(declare-fun mapKey!38157 () (_ BitVec 32))

(assert (=> mapNonEmpty!38157 (= mapRest!38156 (store mapRest!38157 mapKey!38157 mapValue!38157))))

(declare-fun b!1032579 () Bool)

(assert (=> b!1032579 (= e!583486 tp_is_empty!24457)))

(assert (= (and mapNonEmpty!38156 condMapEmpty!38157) mapIsEmpty!38157))

(assert (= (and mapNonEmpty!38156 (not condMapEmpty!38157)) mapNonEmpty!38157))

(assert (= (and mapNonEmpty!38157 ((_ is ValueCellFull!11525) mapValue!38157)) b!1032579))

(assert (= (and mapNonEmpty!38156 ((_ is ValueCellFull!11525) mapDefault!38157)) b!1032580))

(declare-fun m!952241 () Bool)

(assert (=> mapNonEmpty!38157 m!952241))

(check-sat (not b_next!20737) (not b!1032538) (not bm!43588) (not b!1032550) (not b!1032551) b_and!33179 (not b!1032576) (not d!123565) tp_is_empty!24457 (not bm!43585) (not b!1032565) (not b!1032537) (not bm!43591) (not mapNonEmpty!38157) (not b!1032577) (not b!1032553))
(check-sat b_and!33179 (not b_next!20737))
