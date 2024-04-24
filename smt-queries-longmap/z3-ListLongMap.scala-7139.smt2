; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90932 () Bool)

(assert start!90932)

(declare-fun b!1038502 () Bool)

(declare-fun b_free!20887 () Bool)

(declare-fun b_next!20887 () Bool)

(assert (=> b!1038502 (= b_free!20887 (not b_next!20887))))

(declare-fun tp!73803 () Bool)

(declare-fun b_and!33429 () Bool)

(assert (=> b!1038502 (= tp!73803 b_and!33429)))

(declare-fun b!1038501 () Bool)

(declare-fun e!587495 () Bool)

(declare-fun e!587491 () Bool)

(assert (=> b!1038501 (= e!587495 e!587491)))

(declare-fun res!692595 () Bool)

(assert (=> b!1038501 (=> (not res!692595) (not e!587491))))

(declare-datatypes ((SeekEntryResult!9707 0))(
  ( (MissingZero!9707 (index!41199 (_ BitVec 32))) (Found!9707 (index!41200 (_ BitVec 32))) (Intermediate!9707 (undefined!10519 Bool) (index!41201 (_ BitVec 32)) (x!92496 (_ BitVec 32))) (Undefined!9707) (MissingVacant!9707 (index!41202 (_ BitVec 32))) )
))
(declare-fun lt!457935 () SeekEntryResult!9707)

(get-info :version)

(assert (=> b!1038501 (= res!692595 ((_ is Found!9707) lt!457935))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37683 0))(
  ( (V!37684 (val!12354 Int)) )
))
(declare-datatypes ((ValueCell!11600 0))(
  ( (ValueCellFull!11600 (v!14933 V!37683)) (EmptyCell!11600) )
))
(declare-datatypes ((array!65365 0))(
  ( (array!65366 (arr!31459 (Array (_ BitVec 32) (_ BitVec 64))) (size!31990 (_ BitVec 32))) )
))
(declare-datatypes ((array!65367 0))(
  ( (array!65368 (arr!31460 (Array (_ BitVec 32) ValueCell!11600)) (size!31991 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5794 0))(
  ( (LongMapFixedSize!5795 (defaultEntry!6279 Int) (mask!30253 (_ BitVec 32)) (extraKeys!6007 (_ BitVec 32)) (zeroValue!6113 V!37683) (minValue!6113 V!37683) (_size!2952 (_ BitVec 32)) (_keys!11512 array!65365) (_values!6302 array!65367) (_vacant!2952 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5794)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65365 (_ BitVec 32)) SeekEntryResult!9707)

(assert (=> b!1038501 (= lt!457935 (seekEntry!0 key!909 (_keys!11512 thiss!1427) (mask!30253 thiss!1427)))))

(declare-fun res!692593 () Bool)

(assert (=> start!90932 (=> (not res!692593) (not e!587495))))

(declare-fun valid!2190 (LongMapFixedSize!5794) Bool)

(assert (=> start!90932 (= res!692593 (valid!2190 thiss!1427))))

(assert (=> start!90932 e!587495))

(declare-fun e!587490 () Bool)

(assert (=> start!90932 e!587490))

(assert (=> start!90932 true))

(declare-fun e!587489 () Bool)

(declare-fun tp_is_empty!24607 () Bool)

(declare-fun array_inv!24341 (array!65365) Bool)

(declare-fun array_inv!24342 (array!65367) Bool)

(assert (=> b!1038502 (= e!587490 (and tp!73803 tp_is_empty!24607 (array_inv!24341 (_keys!11512 thiss!1427)) (array_inv!24342 (_values!6302 thiss!1427)) e!587489))))

(declare-fun mapNonEmpty!38436 () Bool)

(declare-fun mapRes!38436 () Bool)

(declare-fun tp!73804 () Bool)

(declare-fun e!587493 () Bool)

(assert (=> mapNonEmpty!38436 (= mapRes!38436 (and tp!73804 e!587493))))

(declare-fun mapValue!38436 () ValueCell!11600)

(declare-fun mapKey!38436 () (_ BitVec 32))

(declare-fun mapRest!38436 () (Array (_ BitVec 32) ValueCell!11600))

(assert (=> mapNonEmpty!38436 (= (arr!31460 (_values!6302 thiss!1427)) (store mapRest!38436 mapKey!38436 mapValue!38436))))

(declare-fun b!1038503 () Bool)

(declare-fun e!587494 () Bool)

(assert (=> b!1038503 (= e!587494 tp_is_empty!24607)))

(declare-fun b!1038504 () Bool)

(assert (=> b!1038504 (= e!587489 (and e!587494 mapRes!38436))))

(declare-fun condMapEmpty!38436 () Bool)

(declare-fun mapDefault!38436 () ValueCell!11600)

(assert (=> b!1038504 (= condMapEmpty!38436 (= (arr!31460 (_values!6302 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11600)) mapDefault!38436)))))

(declare-fun b!1038505 () Bool)

(declare-fun res!692594 () Bool)

(assert (=> b!1038505 (=> (not res!692594) (not e!587495))))

(assert (=> b!1038505 (= res!692594 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038506 () Bool)

(assert (=> b!1038506 (= e!587493 tp_is_empty!24607)))

(declare-fun b!1038507 () Bool)

(assert (=> b!1038507 (= e!587491 (not (bvslt (size!31990 (_keys!11512 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun arrayCountValidKeys!0 (array!65365 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038507 (= (arrayCountValidKeys!0 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33947 0))(
  ( (Unit!33948) )
))
(declare-fun lt!457934 () Unit!33947)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65365 (_ BitVec 32) (_ BitVec 64)) Unit!33947)

(assert (=> b!1038507 (= lt!457934 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11512 thiss!1427) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38436 () Bool)

(assert (=> mapIsEmpty!38436 mapRes!38436))

(assert (= (and start!90932 res!692593) b!1038505))

(assert (= (and b!1038505 res!692594) b!1038501))

(assert (= (and b!1038501 res!692595) b!1038507))

(assert (= (and b!1038504 condMapEmpty!38436) mapIsEmpty!38436))

(assert (= (and b!1038504 (not condMapEmpty!38436)) mapNonEmpty!38436))

(assert (= (and mapNonEmpty!38436 ((_ is ValueCellFull!11600) mapValue!38436)) b!1038506))

(assert (= (and b!1038504 ((_ is ValueCellFull!11600) mapDefault!38436)) b!1038503))

(assert (= b!1038502 b!1038504))

(assert (= start!90932 b!1038502))

(declare-fun m!959117 () Bool)

(assert (=> mapNonEmpty!38436 m!959117))

(declare-fun m!959119 () Bool)

(assert (=> start!90932 m!959119))

(declare-fun m!959121 () Bool)

(assert (=> b!1038507 m!959121))

(declare-fun m!959123 () Bool)

(assert (=> b!1038507 m!959123))

(declare-fun m!959125 () Bool)

(assert (=> b!1038507 m!959125))

(declare-fun m!959127 () Bool)

(assert (=> b!1038507 m!959127))

(declare-fun m!959129 () Bool)

(assert (=> b!1038502 m!959129))

(declare-fun m!959131 () Bool)

(assert (=> b!1038502 m!959131))

(declare-fun m!959133 () Bool)

(assert (=> b!1038501 m!959133))

(check-sat (not mapNonEmpty!38436) (not b!1038501) (not b!1038502) tp_is_empty!24607 (not b!1038507) (not b_next!20887) b_and!33429 (not start!90932))
(check-sat b_and!33429 (not b_next!20887))
(get-model)

(declare-fun b!1038558 () Bool)

(declare-fun e!587543 () (_ BitVec 32))

(declare-fun call!43981 () (_ BitVec 32))

(assert (=> b!1038558 (= e!587543 (bvadd #b00000000000000000000000000000001 call!43981))))

(declare-fun bm!43978 () Bool)

(assert (=> bm!43978 (= call!43981 (arrayCountValidKeys!0 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31990 (_keys!11512 thiss!1427))))))

(declare-fun b!1038559 () Bool)

(assert (=> b!1038559 (= e!587543 call!43981)))

(declare-fun d!125669 () Bool)

(declare-fun lt!457950 () (_ BitVec 32))

(assert (=> d!125669 (and (bvsge lt!457950 #b00000000000000000000000000000000) (bvsle lt!457950 (bvsub (size!31990 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!587542 () (_ BitVec 32))

(assert (=> d!125669 (= lt!457950 e!587542)))

(declare-fun c!105505 () Bool)

(assert (=> d!125669 (= c!105505 (bvsge #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))))))

(assert (=> d!125669 (and (bvsle #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31990 (_keys!11512 thiss!1427)) (size!31990 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427))))))))

(assert (=> d!125669 (= (arrayCountValidKeys!0 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) lt!457950)))

(declare-fun b!1038560 () Bool)

(assert (=> b!1038560 (= e!587542 e!587543)))

(declare-fun c!105506 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038560 (= c!105506 (validKeyInArray!0 (select (arr!31459 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038561 () Bool)

(assert (=> b!1038561 (= e!587542 #b00000000000000000000000000000000)))

(assert (= (and d!125669 c!105505) b!1038561))

(assert (= (and d!125669 (not c!105505)) b!1038560))

(assert (= (and b!1038560 c!105506) b!1038558))

(assert (= (and b!1038560 (not c!105506)) b!1038559))

(assert (= (or b!1038558 b!1038559) bm!43978))

(declare-fun m!959171 () Bool)

(assert (=> bm!43978 m!959171))

(declare-fun m!959173 () Bool)

(assert (=> b!1038560 m!959173))

(assert (=> b!1038560 m!959173))

(declare-fun m!959175 () Bool)

(assert (=> b!1038560 m!959175))

(assert (=> b!1038507 d!125669))

(declare-fun b!1038562 () Bool)

(declare-fun e!587545 () (_ BitVec 32))

(declare-fun call!43982 () (_ BitVec 32))

(assert (=> b!1038562 (= e!587545 (bvadd #b00000000000000000000000000000001 call!43982))))

(declare-fun bm!43979 () Bool)

(assert (=> bm!43979 (= call!43982 (arrayCountValidKeys!0 (_keys!11512 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31990 (_keys!11512 thiss!1427))))))

(declare-fun b!1038563 () Bool)

(assert (=> b!1038563 (= e!587545 call!43982)))

(declare-fun d!125671 () Bool)

(declare-fun lt!457951 () (_ BitVec 32))

(assert (=> d!125671 (and (bvsge lt!457951 #b00000000000000000000000000000000) (bvsle lt!457951 (bvsub (size!31990 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587544 () (_ BitVec 32))

(assert (=> d!125671 (= lt!457951 e!587544)))

(declare-fun c!105507 () Bool)

(assert (=> d!125671 (= c!105507 (bvsge #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))))))

(assert (=> d!125671 (and (bvsle #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31990 (_keys!11512 thiss!1427)) (size!31990 (_keys!11512 thiss!1427))))))

(assert (=> d!125671 (= (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) lt!457951)))

(declare-fun b!1038564 () Bool)

(assert (=> b!1038564 (= e!587544 e!587545)))

(declare-fun c!105508 () Bool)

(assert (=> b!1038564 (= c!105508 (validKeyInArray!0 (select (arr!31459 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038565 () Bool)

(assert (=> b!1038565 (= e!587544 #b00000000000000000000000000000000)))

(assert (= (and d!125671 c!105507) b!1038565))

(assert (= (and d!125671 (not c!105507)) b!1038564))

(assert (= (and b!1038564 c!105508) b!1038562))

(assert (= (and b!1038564 (not c!105508)) b!1038563))

(assert (= (or b!1038562 b!1038563) bm!43979))

(declare-fun m!959177 () Bool)

(assert (=> bm!43979 m!959177))

(declare-fun m!959179 () Bool)

(assert (=> b!1038564 m!959179))

(assert (=> b!1038564 m!959179))

(declare-fun m!959181 () Bool)

(assert (=> b!1038564 m!959181))

(assert (=> b!1038507 d!125671))

(declare-fun d!125673 () Bool)

(declare-fun e!587551 () Bool)

(assert (=> d!125673 e!587551))

(declare-fun res!692624 () Bool)

(assert (=> d!125673 (=> (not res!692624) (not e!587551))))

(assert (=> d!125673 (= res!692624 (and (bvsge (index!41200 lt!457935) #b00000000000000000000000000000000) (bvslt (index!41200 lt!457935) (size!31990 (_keys!11512 thiss!1427)))))))

(declare-fun lt!457954 () Unit!33947)

(declare-fun choose!82 (array!65365 (_ BitVec 32) (_ BitVec 64)) Unit!33947)

(assert (=> d!125673 (= lt!457954 (choose!82 (_keys!11512 thiss!1427) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587550 () Bool)

(assert (=> d!125673 e!587550))

(declare-fun res!692623 () Bool)

(assert (=> d!125673 (=> (not res!692623) (not e!587550))))

(assert (=> d!125673 (= res!692623 (and (bvsge (index!41200 lt!457935) #b00000000000000000000000000000000) (bvslt (index!41200 lt!457935) (size!31990 (_keys!11512 thiss!1427)))))))

(assert (=> d!125673 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11512 thiss!1427) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457954)))

(declare-fun b!1038576 () Bool)

(assert (=> b!1038576 (= e!587550 (bvslt (size!31990 (_keys!11512 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038577 () Bool)

(assert (=> b!1038577 (= e!587551 (= (arrayCountValidKeys!0 (array!65366 (store (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038574 () Bool)

(declare-fun res!692625 () Bool)

(assert (=> b!1038574 (=> (not res!692625) (not e!587550))))

(assert (=> b!1038574 (= res!692625 (validKeyInArray!0 (select (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457935))))))

(declare-fun b!1038575 () Bool)

(declare-fun res!692622 () Bool)

(assert (=> b!1038575 (=> (not res!692622) (not e!587550))))

(assert (=> b!1038575 (= res!692622 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125673 res!692623) b!1038574))

(assert (= (and b!1038574 res!692625) b!1038575))

(assert (= (and b!1038575 res!692622) b!1038576))

(assert (= (and d!125673 res!692624) b!1038577))

(declare-fun m!959183 () Bool)

(assert (=> d!125673 m!959183))

(assert (=> b!1038577 m!959121))

(assert (=> b!1038577 m!959123))

(assert (=> b!1038577 m!959125))

(declare-fun m!959185 () Bool)

(assert (=> b!1038574 m!959185))

(assert (=> b!1038574 m!959185))

(declare-fun m!959187 () Bool)

(assert (=> b!1038574 m!959187))

(declare-fun m!959189 () Bool)

(assert (=> b!1038575 m!959189))

(assert (=> b!1038507 d!125673))

(declare-fun d!125675 () Bool)

(declare-fun res!692632 () Bool)

(declare-fun e!587554 () Bool)

(assert (=> d!125675 (=> (not res!692632) (not e!587554))))

(declare-fun simpleValid!416 (LongMapFixedSize!5794) Bool)

(assert (=> d!125675 (= res!692632 (simpleValid!416 thiss!1427))))

(assert (=> d!125675 (= (valid!2190 thiss!1427) e!587554)))

(declare-fun b!1038584 () Bool)

(declare-fun res!692633 () Bool)

(assert (=> b!1038584 (=> (not res!692633) (not e!587554))))

(assert (=> b!1038584 (= res!692633 (= (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!31990 (_keys!11512 thiss!1427))) (_size!2952 thiss!1427)))))

(declare-fun b!1038585 () Bool)

(declare-fun res!692634 () Bool)

(assert (=> b!1038585 (=> (not res!692634) (not e!587554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65365 (_ BitVec 32)) Bool)

(assert (=> b!1038585 (= res!692634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11512 thiss!1427) (mask!30253 thiss!1427)))))

(declare-fun b!1038586 () Bool)

(declare-datatypes ((List!21907 0))(
  ( (Nil!21904) (Cons!21903 (h!23115 (_ BitVec 64)) (t!31113 List!21907)) )
))
(declare-fun arrayNoDuplicates!0 (array!65365 (_ BitVec 32) List!21907) Bool)

(assert (=> b!1038586 (= e!587554 (arrayNoDuplicates!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 Nil!21904))))

(assert (= (and d!125675 res!692632) b!1038584))

(assert (= (and b!1038584 res!692633) b!1038585))

(assert (= (and b!1038585 res!692634) b!1038586))

(declare-fun m!959191 () Bool)

(assert (=> d!125675 m!959191))

(assert (=> b!1038584 m!959125))

(declare-fun m!959193 () Bool)

(assert (=> b!1038585 m!959193))

(declare-fun m!959195 () Bool)

(assert (=> b!1038586 m!959195))

(assert (=> start!90932 d!125675))

(declare-fun d!125677 () Bool)

(assert (=> d!125677 (= (array_inv!24341 (_keys!11512 thiss!1427)) (bvsge (size!31990 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038502 d!125677))

(declare-fun d!125679 () Bool)

(assert (=> d!125679 (= (array_inv!24342 (_values!6302 thiss!1427)) (bvsge (size!31991 (_values!6302 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038502 d!125679))

(declare-fun b!1038599 () Bool)

(declare-fun e!587563 () SeekEntryResult!9707)

(assert (=> b!1038599 (= e!587563 Undefined!9707)))

(declare-fun b!1038600 () Bool)

(declare-fun e!587561 () SeekEntryResult!9707)

(declare-fun lt!457966 () SeekEntryResult!9707)

(assert (=> b!1038600 (= e!587561 (ite ((_ is MissingVacant!9707) lt!457966) (MissingZero!9707 (index!41202 lt!457966)) lt!457966))))

(declare-fun lt!457965 () SeekEntryResult!9707)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65365 (_ BitVec 32)) SeekEntryResult!9707)

(assert (=> b!1038600 (= lt!457966 (seekKeyOrZeroReturnVacant!0 (x!92496 lt!457965) (index!41201 lt!457965) (index!41201 lt!457965) key!909 (_keys!11512 thiss!1427) (mask!30253 thiss!1427)))))

(declare-fun b!1038601 () Bool)

(declare-fun e!587562 () SeekEntryResult!9707)

(assert (=> b!1038601 (= e!587562 (Found!9707 (index!41201 lt!457965)))))

(declare-fun b!1038602 () Bool)

(declare-fun c!105515 () Bool)

(declare-fun lt!457963 () (_ BitVec 64))

(assert (=> b!1038602 (= c!105515 (= lt!457963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038602 (= e!587562 e!587561)))

(declare-fun b!1038603 () Bool)

(assert (=> b!1038603 (= e!587561 (MissingZero!9707 (index!41201 lt!457965)))))

(declare-fun d!125681 () Bool)

(declare-fun lt!457964 () SeekEntryResult!9707)

(assert (=> d!125681 (and (or ((_ is MissingVacant!9707) lt!457964) (not ((_ is Found!9707) lt!457964)) (and (bvsge (index!41200 lt!457964) #b00000000000000000000000000000000) (bvslt (index!41200 lt!457964) (size!31990 (_keys!11512 thiss!1427))))) (not ((_ is MissingVacant!9707) lt!457964)) (or (not ((_ is Found!9707) lt!457964)) (= (select (arr!31459 (_keys!11512 thiss!1427)) (index!41200 lt!457964)) key!909)))))

(assert (=> d!125681 (= lt!457964 e!587563)))

(declare-fun c!105517 () Bool)

(assert (=> d!125681 (= c!105517 (and ((_ is Intermediate!9707) lt!457965) (undefined!10519 lt!457965)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65365 (_ BitVec 32)) SeekEntryResult!9707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125681 (= lt!457965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30253 thiss!1427)) key!909 (_keys!11512 thiss!1427) (mask!30253 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125681 (validMask!0 (mask!30253 thiss!1427))))

(assert (=> d!125681 (= (seekEntry!0 key!909 (_keys!11512 thiss!1427) (mask!30253 thiss!1427)) lt!457964)))

(declare-fun b!1038604 () Bool)

(assert (=> b!1038604 (= e!587563 e!587562)))

(assert (=> b!1038604 (= lt!457963 (select (arr!31459 (_keys!11512 thiss!1427)) (index!41201 lt!457965)))))

(declare-fun c!105516 () Bool)

(assert (=> b!1038604 (= c!105516 (= lt!457963 key!909))))

(assert (= (and d!125681 c!105517) b!1038599))

(assert (= (and d!125681 (not c!105517)) b!1038604))

(assert (= (and b!1038604 c!105516) b!1038601))

(assert (= (and b!1038604 (not c!105516)) b!1038602))

(assert (= (and b!1038602 c!105515) b!1038603))

(assert (= (and b!1038602 (not c!105515)) b!1038600))

(declare-fun m!959197 () Bool)

(assert (=> b!1038600 m!959197))

(declare-fun m!959199 () Bool)

(assert (=> d!125681 m!959199))

(declare-fun m!959201 () Bool)

(assert (=> d!125681 m!959201))

(assert (=> d!125681 m!959201))

(declare-fun m!959203 () Bool)

(assert (=> d!125681 m!959203))

(declare-fun m!959205 () Bool)

(assert (=> d!125681 m!959205))

(declare-fun m!959207 () Bool)

(assert (=> b!1038604 m!959207))

(assert (=> b!1038501 d!125681))

(declare-fun condMapEmpty!38445 () Bool)

(declare-fun mapDefault!38445 () ValueCell!11600)

(assert (=> mapNonEmpty!38436 (= condMapEmpty!38445 (= mapRest!38436 ((as const (Array (_ BitVec 32) ValueCell!11600)) mapDefault!38445)))))

(declare-fun e!587569 () Bool)

(declare-fun mapRes!38445 () Bool)

(assert (=> mapNonEmpty!38436 (= tp!73804 (and e!587569 mapRes!38445))))

(declare-fun b!1038612 () Bool)

(assert (=> b!1038612 (= e!587569 tp_is_empty!24607)))

(declare-fun b!1038611 () Bool)

(declare-fun e!587568 () Bool)

(assert (=> b!1038611 (= e!587568 tp_is_empty!24607)))

(declare-fun mapNonEmpty!38445 () Bool)

(declare-fun tp!73819 () Bool)

(assert (=> mapNonEmpty!38445 (= mapRes!38445 (and tp!73819 e!587568))))

(declare-fun mapKey!38445 () (_ BitVec 32))

(declare-fun mapRest!38445 () (Array (_ BitVec 32) ValueCell!11600))

(declare-fun mapValue!38445 () ValueCell!11600)

(assert (=> mapNonEmpty!38445 (= mapRest!38436 (store mapRest!38445 mapKey!38445 mapValue!38445))))

(declare-fun mapIsEmpty!38445 () Bool)

(assert (=> mapIsEmpty!38445 mapRes!38445))

(assert (= (and mapNonEmpty!38436 condMapEmpty!38445) mapIsEmpty!38445))

(assert (= (and mapNonEmpty!38436 (not condMapEmpty!38445)) mapNonEmpty!38445))

(assert (= (and mapNonEmpty!38445 ((_ is ValueCellFull!11600) mapValue!38445)) b!1038611))

(assert (= (and mapNonEmpty!38436 ((_ is ValueCellFull!11600) mapDefault!38445)) b!1038612))

(declare-fun m!959209 () Bool)

(assert (=> mapNonEmpty!38445 m!959209))

(check-sat (not b!1038577) b_and!33429 (not b!1038586) (not b!1038560) (not b!1038564) tp_is_empty!24607 (not d!125673) (not b!1038584) (not d!125681) (not d!125675) (not b!1038585) (not b!1038600) (not bm!43979) (not b_next!20887) (not bm!43978) (not b!1038574) (not mapNonEmpty!38445) (not b!1038575))
(check-sat b_and!33429 (not b_next!20887))
