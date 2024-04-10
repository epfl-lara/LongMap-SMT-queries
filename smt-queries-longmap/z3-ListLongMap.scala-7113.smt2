; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90142 () Bool)

(assert start!90142)

(declare-fun b!1032502 () Bool)

(declare-fun b_free!20733 () Bool)

(declare-fun b_next!20733 () Bool)

(assert (=> b!1032502 (= b_free!20733 (not b_next!20733))))

(declare-fun tp!73274 () Bool)

(declare-fun b_and!33201 () Bool)

(assert (=> b!1032502 (= tp!73274 b_and!33201)))

(declare-fun b!1032501 () Bool)

(declare-fun e!583422 () Bool)

(declare-fun tp_is_empty!24453 () Bool)

(assert (=> b!1032501 (= e!583422 tp_is_empty!24453)))

(declare-fun e!583419 () Bool)

(declare-fun e!583420 () Bool)

(declare-datatypes ((V!37477 0))(
  ( (V!37478 (val!12277 Int)) )
))
(declare-datatypes ((ValueCell!11523 0))(
  ( (ValueCellFull!11523 (v!14854 V!37477)) (EmptyCell!11523) )
))
(declare-datatypes ((array!64972 0))(
  ( (array!64973 (arr!31287 (Array (_ BitVec 32) (_ BitVec 64))) (size!31805 (_ BitVec 32))) )
))
(declare-datatypes ((array!64974 0))(
  ( (array!64975 (arr!31288 (Array (_ BitVec 32) ValueCell!11523)) (size!31806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5640 0))(
  ( (LongMapFixedSize!5641 (defaultEntry!6194 Int) (mask!30016 (_ BitVec 32)) (extraKeys!5926 (_ BitVec 32)) (zeroValue!6030 V!37477) (minValue!6030 V!37477) (_size!2875 (_ BitVec 32)) (_keys!11368 array!64972) (_values!6217 array!64974) (_vacant!2875 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5640)

(declare-fun array_inv!24213 (array!64972) Bool)

(declare-fun array_inv!24214 (array!64974) Bool)

(assert (=> b!1032502 (= e!583420 (and tp!73274 tp_is_empty!24453 (array_inv!24213 (_keys!11368 thiss!1427)) (array_inv!24214 (_values!6217 thiss!1427)) e!583419))))

(declare-fun b!1032503 () Bool)

(declare-fun res!690069 () Bool)

(declare-fun e!583423 () Bool)

(assert (=> b!1032503 (=> (not res!690069) (not e!583423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032503 (= res!690069 (validMask!0 (mask!30016 thiss!1427)))))

(declare-fun res!690070 () Bool)

(assert (=> start!90142 (=> (not res!690070) (not e!583423))))

(declare-fun valid!2135 (LongMapFixedSize!5640) Bool)

(assert (=> start!90142 (= res!690070 (valid!2135 thiss!1427))))

(assert (=> start!90142 e!583423))

(assert (=> start!90142 e!583420))

(assert (=> start!90142 true))

(declare-fun b!1032504 () Bool)

(declare-fun e!583424 () Bool)

(declare-fun mapRes!38137 () Bool)

(assert (=> b!1032504 (= e!583419 (and e!583424 mapRes!38137))))

(declare-fun condMapEmpty!38137 () Bool)

(declare-fun mapDefault!38137 () ValueCell!11523)

(assert (=> b!1032504 (= condMapEmpty!38137 (= (arr!31288 (_values!6217 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11523)) mapDefault!38137)))))

(declare-fun b!1032505 () Bool)

(assert (=> b!1032505 (= e!583424 tp_is_empty!24453)))

(declare-fun mapNonEmpty!38137 () Bool)

(declare-fun tp!73273 () Bool)

(assert (=> mapNonEmpty!38137 (= mapRes!38137 (and tp!73273 e!583422))))

(declare-fun mapRest!38137 () (Array (_ BitVec 32) ValueCell!11523))

(declare-fun mapKey!38137 () (_ BitVec 32))

(declare-fun mapValue!38137 () ValueCell!11523)

(assert (=> mapNonEmpty!38137 (= (arr!31288 (_values!6217 thiss!1427)) (store mapRest!38137 mapKey!38137 mapValue!38137))))

(declare-fun b!1032506 () Bool)

(assert (=> b!1032506 (= e!583423 (not (= (size!31806 (_values!6217 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30016 thiss!1427)))))))

(declare-fun b!1032507 () Bool)

(declare-fun res!690071 () Bool)

(assert (=> b!1032507 (=> (not res!690071) (not e!583423))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032507 (= res!690071 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38137 () Bool)

(assert (=> mapIsEmpty!38137 mapRes!38137))

(assert (= (and start!90142 res!690070) b!1032507))

(assert (= (and b!1032507 res!690071) b!1032503))

(assert (= (and b!1032503 res!690069) b!1032506))

(assert (= (and b!1032504 condMapEmpty!38137) mapIsEmpty!38137))

(assert (= (and b!1032504 (not condMapEmpty!38137)) mapNonEmpty!38137))

(get-info :version)

(assert (= (and mapNonEmpty!38137 ((_ is ValueCellFull!11523) mapValue!38137)) b!1032501))

(assert (= (and b!1032504 ((_ is ValueCellFull!11523) mapDefault!38137)) b!1032505))

(assert (= b!1032502 b!1032504))

(assert (= start!90142 b!1032502))

(declare-fun m!952749 () Bool)

(assert (=> b!1032502 m!952749))

(declare-fun m!952751 () Bool)

(assert (=> b!1032502 m!952751))

(declare-fun m!952753 () Bool)

(assert (=> b!1032503 m!952753))

(declare-fun m!952755 () Bool)

(assert (=> start!90142 m!952755))

(declare-fun m!952757 () Bool)

(assert (=> mapNonEmpty!38137 m!952757))

(check-sat (not mapNonEmpty!38137) (not b_next!20733) (not b!1032502) b_and!33201 (not start!90142) (not b!1032503) tp_is_empty!24453)
(check-sat b_and!33201 (not b_next!20733))
(get-model)

(declare-fun d!123689 () Bool)

(declare-fun res!690087 () Bool)

(declare-fun e!583445 () Bool)

(assert (=> d!123689 (=> (not res!690087) (not e!583445))))

(declare-fun simpleValid!398 (LongMapFixedSize!5640) Bool)

(assert (=> d!123689 (= res!690087 (simpleValid!398 thiss!1427))))

(assert (=> d!123689 (= (valid!2135 thiss!1427) e!583445)))

(declare-fun b!1032535 () Bool)

(declare-fun res!690088 () Bool)

(assert (=> b!1032535 (=> (not res!690088) (not e!583445))))

(declare-fun arrayCountValidKeys!0 (array!64972 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032535 (= res!690088 (= (arrayCountValidKeys!0 (_keys!11368 thiss!1427) #b00000000000000000000000000000000 (size!31805 (_keys!11368 thiss!1427))) (_size!2875 thiss!1427)))))

(declare-fun b!1032536 () Bool)

(declare-fun res!690089 () Bool)

(assert (=> b!1032536 (=> (not res!690089) (not e!583445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64972 (_ BitVec 32)) Bool)

(assert (=> b!1032536 (= res!690089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11368 thiss!1427) (mask!30016 thiss!1427)))))

(declare-fun b!1032537 () Bool)

(declare-datatypes ((List!21896 0))(
  ( (Nil!21893) (Cons!21892 (h!23094 (_ BitVec 64)) (t!31090 List!21896)) )
))
(declare-fun arrayNoDuplicates!0 (array!64972 (_ BitVec 32) List!21896) Bool)

(assert (=> b!1032537 (= e!583445 (arrayNoDuplicates!0 (_keys!11368 thiss!1427) #b00000000000000000000000000000000 Nil!21893))))

(assert (= (and d!123689 res!690087) b!1032535))

(assert (= (and b!1032535 res!690088) b!1032536))

(assert (= (and b!1032536 res!690089) b!1032537))

(declare-fun m!952769 () Bool)

(assert (=> d!123689 m!952769))

(declare-fun m!952771 () Bool)

(assert (=> b!1032535 m!952771))

(declare-fun m!952773 () Bool)

(assert (=> b!1032536 m!952773))

(declare-fun m!952775 () Bool)

(assert (=> b!1032537 m!952775))

(assert (=> start!90142 d!123689))

(declare-fun d!123691 () Bool)

(assert (=> d!123691 (= (array_inv!24213 (_keys!11368 thiss!1427)) (bvsge (size!31805 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032502 d!123691))

(declare-fun d!123693 () Bool)

(assert (=> d!123693 (= (array_inv!24214 (_values!6217 thiss!1427)) (bvsge (size!31806 (_values!6217 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032502 d!123693))

(declare-fun d!123695 () Bool)

(assert (=> d!123695 (= (validMask!0 (mask!30016 thiss!1427)) (and (or (= (mask!30016 thiss!1427) #b00000000000000000000000000000111) (= (mask!30016 thiss!1427) #b00000000000000000000000000001111) (= (mask!30016 thiss!1427) #b00000000000000000000000000011111) (= (mask!30016 thiss!1427) #b00000000000000000000000000111111) (= (mask!30016 thiss!1427) #b00000000000000000000000001111111) (= (mask!30016 thiss!1427) #b00000000000000000000000011111111) (= (mask!30016 thiss!1427) #b00000000000000000000000111111111) (= (mask!30016 thiss!1427) #b00000000000000000000001111111111) (= (mask!30016 thiss!1427) #b00000000000000000000011111111111) (= (mask!30016 thiss!1427) #b00000000000000000000111111111111) (= (mask!30016 thiss!1427) #b00000000000000000001111111111111) (= (mask!30016 thiss!1427) #b00000000000000000011111111111111) (= (mask!30016 thiss!1427) #b00000000000000000111111111111111) (= (mask!30016 thiss!1427) #b00000000000000001111111111111111) (= (mask!30016 thiss!1427) #b00000000000000011111111111111111) (= (mask!30016 thiss!1427) #b00000000000000111111111111111111) (= (mask!30016 thiss!1427) #b00000000000001111111111111111111) (= (mask!30016 thiss!1427) #b00000000000011111111111111111111) (= (mask!30016 thiss!1427) #b00000000000111111111111111111111) (= (mask!30016 thiss!1427) #b00000000001111111111111111111111) (= (mask!30016 thiss!1427) #b00000000011111111111111111111111) (= (mask!30016 thiss!1427) #b00000000111111111111111111111111) (= (mask!30016 thiss!1427) #b00000001111111111111111111111111) (= (mask!30016 thiss!1427) #b00000011111111111111111111111111) (= (mask!30016 thiss!1427) #b00000111111111111111111111111111) (= (mask!30016 thiss!1427) #b00001111111111111111111111111111) (= (mask!30016 thiss!1427) #b00011111111111111111111111111111) (= (mask!30016 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30016 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032503 d!123695))

(declare-fun mapNonEmpty!38143 () Bool)

(declare-fun mapRes!38143 () Bool)

(declare-fun tp!73283 () Bool)

(declare-fun e!583450 () Bool)

(assert (=> mapNonEmpty!38143 (= mapRes!38143 (and tp!73283 e!583450))))

(declare-fun mapRest!38143 () (Array (_ BitVec 32) ValueCell!11523))

(declare-fun mapValue!38143 () ValueCell!11523)

(declare-fun mapKey!38143 () (_ BitVec 32))

(assert (=> mapNonEmpty!38143 (= mapRest!38137 (store mapRest!38143 mapKey!38143 mapValue!38143))))

(declare-fun b!1032544 () Bool)

(assert (=> b!1032544 (= e!583450 tp_is_empty!24453)))

(declare-fun mapIsEmpty!38143 () Bool)

(assert (=> mapIsEmpty!38143 mapRes!38143))

(declare-fun b!1032545 () Bool)

(declare-fun e!583451 () Bool)

(assert (=> b!1032545 (= e!583451 tp_is_empty!24453)))

(declare-fun condMapEmpty!38143 () Bool)

(declare-fun mapDefault!38143 () ValueCell!11523)

(assert (=> mapNonEmpty!38137 (= condMapEmpty!38143 (= mapRest!38137 ((as const (Array (_ BitVec 32) ValueCell!11523)) mapDefault!38143)))))

(assert (=> mapNonEmpty!38137 (= tp!73273 (and e!583451 mapRes!38143))))

(assert (= (and mapNonEmpty!38137 condMapEmpty!38143) mapIsEmpty!38143))

(assert (= (and mapNonEmpty!38137 (not condMapEmpty!38143)) mapNonEmpty!38143))

(assert (= (and mapNonEmpty!38143 ((_ is ValueCellFull!11523) mapValue!38143)) b!1032544))

(assert (= (and mapNonEmpty!38137 ((_ is ValueCellFull!11523) mapDefault!38143)) b!1032545))

(declare-fun m!952777 () Bool)

(assert (=> mapNonEmpty!38143 m!952777))

(check-sat (not b!1032536) (not b!1032537) tp_is_empty!24453 (not b_next!20733) (not mapNonEmpty!38143) (not d!123689) b_and!33201 (not b!1032535))
(check-sat b_and!33201 (not b_next!20733))
(get-model)

(declare-fun d!123697 () Bool)

(declare-fun res!690095 () Bool)

(declare-fun e!583458 () Bool)

(assert (=> d!123697 (=> res!690095 e!583458)))

(assert (=> d!123697 (= res!690095 (bvsge #b00000000000000000000000000000000 (size!31805 (_keys!11368 thiss!1427))))))

(assert (=> d!123697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11368 thiss!1427) (mask!30016 thiss!1427)) e!583458)))

(declare-fun bm!43599 () Bool)

(declare-fun call!43602 () Bool)

(assert (=> bm!43599 (= call!43602 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11368 thiss!1427) (mask!30016 thiss!1427)))))

(declare-fun b!1032554 () Bool)

(declare-fun e!583460 () Bool)

(assert (=> b!1032554 (= e!583458 e!583460)))

(declare-fun c!104316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032554 (= c!104316 (validKeyInArray!0 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032555 () Bool)

(declare-fun e!583459 () Bool)

(assert (=> b!1032555 (= e!583460 e!583459)))

(declare-fun lt!456049 () (_ BitVec 64))

(assert (=> b!1032555 (= lt!456049 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33817 0))(
  ( (Unit!33818) )
))
(declare-fun lt!456048 () Unit!33817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64972 (_ BitVec 64) (_ BitVec 32)) Unit!33817)

(assert (=> b!1032555 (= lt!456048 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11368 thiss!1427) lt!456049 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032555 (arrayContainsKey!0 (_keys!11368 thiss!1427) lt!456049 #b00000000000000000000000000000000)))

(declare-fun lt!456050 () Unit!33817)

(assert (=> b!1032555 (= lt!456050 lt!456048)))

(declare-fun res!690094 () Bool)

(declare-datatypes ((SeekEntryResult!9732 0))(
  ( (MissingZero!9732 (index!41299 (_ BitVec 32))) (Found!9732 (index!41300 (_ BitVec 32))) (Intermediate!9732 (undefined!10544 Bool) (index!41301 (_ BitVec 32)) (x!92032 (_ BitVec 32))) (Undefined!9732) (MissingVacant!9732 (index!41302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64972 (_ BitVec 32)) SeekEntryResult!9732)

(assert (=> b!1032555 (= res!690094 (= (seekEntryOrOpen!0 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000) (_keys!11368 thiss!1427) (mask!30016 thiss!1427)) (Found!9732 #b00000000000000000000000000000000)))))

(assert (=> b!1032555 (=> (not res!690094) (not e!583459))))

(declare-fun b!1032556 () Bool)

(assert (=> b!1032556 (= e!583460 call!43602)))

(declare-fun b!1032557 () Bool)

(assert (=> b!1032557 (= e!583459 call!43602)))

(assert (= (and d!123697 (not res!690095)) b!1032554))

(assert (= (and b!1032554 c!104316) b!1032555))

(assert (= (and b!1032554 (not c!104316)) b!1032556))

(assert (= (and b!1032555 res!690094) b!1032557))

(assert (= (or b!1032557 b!1032556) bm!43599))

(declare-fun m!952779 () Bool)

(assert (=> bm!43599 m!952779))

(declare-fun m!952781 () Bool)

(assert (=> b!1032554 m!952781))

(assert (=> b!1032554 m!952781))

(declare-fun m!952783 () Bool)

(assert (=> b!1032554 m!952783))

(assert (=> b!1032555 m!952781))

(declare-fun m!952785 () Bool)

(assert (=> b!1032555 m!952785))

(declare-fun m!952787 () Bool)

(assert (=> b!1032555 m!952787))

(assert (=> b!1032555 m!952781))

(declare-fun m!952789 () Bool)

(assert (=> b!1032555 m!952789))

(assert (=> b!1032536 d!123697))

(declare-fun bm!43602 () Bool)

(declare-fun call!43605 () Bool)

(declare-fun c!104319 () Bool)

(assert (=> bm!43602 (= call!43605 (arrayNoDuplicates!0 (_keys!11368 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104319 (Cons!21892 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000) Nil!21893) Nil!21893)))))

(declare-fun b!1032568 () Bool)

(declare-fun e!583469 () Bool)

(assert (=> b!1032568 (= e!583469 call!43605)))

(declare-fun b!1032569 () Bool)

(declare-fun e!583470 () Bool)

(declare-fun e!583472 () Bool)

(assert (=> b!1032569 (= e!583470 e!583472)))

(declare-fun res!690104 () Bool)

(assert (=> b!1032569 (=> (not res!690104) (not e!583472))))

(declare-fun e!583471 () Bool)

(assert (=> b!1032569 (= res!690104 (not e!583471))))

(declare-fun res!690102 () Bool)

(assert (=> b!1032569 (=> (not res!690102) (not e!583471))))

(assert (=> b!1032569 (= res!690102 (validKeyInArray!0 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032570 () Bool)

(assert (=> b!1032570 (= e!583472 e!583469)))

(assert (=> b!1032570 (= c!104319 (validKeyInArray!0 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032571 () Bool)

(assert (=> b!1032571 (= e!583469 call!43605)))

(declare-fun d!123699 () Bool)

(declare-fun res!690103 () Bool)

(assert (=> d!123699 (=> res!690103 e!583470)))

(assert (=> d!123699 (= res!690103 (bvsge #b00000000000000000000000000000000 (size!31805 (_keys!11368 thiss!1427))))))

(assert (=> d!123699 (= (arrayNoDuplicates!0 (_keys!11368 thiss!1427) #b00000000000000000000000000000000 Nil!21893) e!583470)))

(declare-fun b!1032572 () Bool)

(declare-fun contains!6007 (List!21896 (_ BitVec 64)) Bool)

(assert (=> b!1032572 (= e!583471 (contains!6007 Nil!21893 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123699 (not res!690103)) b!1032569))

(assert (= (and b!1032569 res!690102) b!1032572))

(assert (= (and b!1032569 res!690104) b!1032570))

(assert (= (and b!1032570 c!104319) b!1032571))

(assert (= (and b!1032570 (not c!104319)) b!1032568))

(assert (= (or b!1032571 b!1032568) bm!43602))

(assert (=> bm!43602 m!952781))

(declare-fun m!952791 () Bool)

(assert (=> bm!43602 m!952791))

(assert (=> b!1032569 m!952781))

(assert (=> b!1032569 m!952781))

(assert (=> b!1032569 m!952783))

(assert (=> b!1032570 m!952781))

(assert (=> b!1032570 m!952781))

(assert (=> b!1032570 m!952783))

(assert (=> b!1032572 m!952781))

(assert (=> b!1032572 m!952781))

(declare-fun m!952793 () Bool)

(assert (=> b!1032572 m!952793))

(assert (=> b!1032537 d!123699))

(declare-fun b!1032581 () Bool)

(declare-fun e!583477 () (_ BitVec 32))

(assert (=> b!1032581 (= e!583477 #b00000000000000000000000000000000)))

(declare-fun d!123701 () Bool)

(declare-fun lt!456053 () (_ BitVec 32))

(assert (=> d!123701 (and (bvsge lt!456053 #b00000000000000000000000000000000) (bvsle lt!456053 (bvsub (size!31805 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123701 (= lt!456053 e!583477)))

(declare-fun c!104324 () Bool)

(assert (=> d!123701 (= c!104324 (bvsge #b00000000000000000000000000000000 (size!31805 (_keys!11368 thiss!1427))))))

(assert (=> d!123701 (and (bvsle #b00000000000000000000000000000000 (size!31805 (_keys!11368 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31805 (_keys!11368 thiss!1427)) (size!31805 (_keys!11368 thiss!1427))))))

(assert (=> d!123701 (= (arrayCountValidKeys!0 (_keys!11368 thiss!1427) #b00000000000000000000000000000000 (size!31805 (_keys!11368 thiss!1427))) lt!456053)))

(declare-fun b!1032582 () Bool)

(declare-fun e!583478 () (_ BitVec 32))

(declare-fun call!43608 () (_ BitVec 32))

(assert (=> b!1032582 (= e!583478 call!43608)))

(declare-fun b!1032583 () Bool)

(assert (=> b!1032583 (= e!583477 e!583478)))

(declare-fun c!104325 () Bool)

(assert (=> b!1032583 (= c!104325 (validKeyInArray!0 (select (arr!31287 (_keys!11368 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43605 () Bool)

(assert (=> bm!43605 (= call!43608 (arrayCountValidKeys!0 (_keys!11368 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31805 (_keys!11368 thiss!1427))))))

(declare-fun b!1032584 () Bool)

(assert (=> b!1032584 (= e!583478 (bvadd #b00000000000000000000000000000001 call!43608))))

(assert (= (and d!123701 c!104324) b!1032581))

(assert (= (and d!123701 (not c!104324)) b!1032583))

(assert (= (and b!1032583 c!104325) b!1032584))

(assert (= (and b!1032583 (not c!104325)) b!1032582))

(assert (= (or b!1032584 b!1032582) bm!43605))

(assert (=> b!1032583 m!952781))

(assert (=> b!1032583 m!952781))

(assert (=> b!1032583 m!952783))

(declare-fun m!952795 () Bool)

(assert (=> bm!43605 m!952795))

(assert (=> b!1032535 d!123701))

(declare-fun d!123703 () Bool)

(declare-fun res!690115 () Bool)

(declare-fun e!583481 () Bool)

(assert (=> d!123703 (=> (not res!690115) (not e!583481))))

(assert (=> d!123703 (= res!690115 (validMask!0 (mask!30016 thiss!1427)))))

(assert (=> d!123703 (= (simpleValid!398 thiss!1427) e!583481)))

(declare-fun b!1032594 () Bool)

(declare-fun res!690116 () Bool)

(assert (=> b!1032594 (=> (not res!690116) (not e!583481))))

(declare-fun size!31809 (LongMapFixedSize!5640) (_ BitVec 32))

(assert (=> b!1032594 (= res!690116 (bvsge (size!31809 thiss!1427) (_size!2875 thiss!1427)))))

(declare-fun b!1032596 () Bool)

(assert (=> b!1032596 (= e!583481 (and (bvsge (extraKeys!5926 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5926 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2875 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032595 () Bool)

(declare-fun res!690113 () Bool)

(assert (=> b!1032595 (=> (not res!690113) (not e!583481))))

(assert (=> b!1032595 (= res!690113 (= (size!31809 thiss!1427) (bvadd (_size!2875 thiss!1427) (bvsdiv (bvadd (extraKeys!5926 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1032593 () Bool)

(declare-fun res!690114 () Bool)

(assert (=> b!1032593 (=> (not res!690114) (not e!583481))))

(assert (=> b!1032593 (= res!690114 (and (= (size!31806 (_values!6217 thiss!1427)) (bvadd (mask!30016 thiss!1427) #b00000000000000000000000000000001)) (= (size!31805 (_keys!11368 thiss!1427)) (size!31806 (_values!6217 thiss!1427))) (bvsge (_size!2875 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2875 thiss!1427) (bvadd (mask!30016 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!123703 res!690115) b!1032593))

(assert (= (and b!1032593 res!690114) b!1032594))

(assert (= (and b!1032594 res!690116) b!1032595))

(assert (= (and b!1032595 res!690113) b!1032596))

(assert (=> d!123703 m!952753))

(declare-fun m!952797 () Bool)

(assert (=> b!1032594 m!952797))

(assert (=> b!1032595 m!952797))

(assert (=> d!123689 d!123703))

(declare-fun mapNonEmpty!38144 () Bool)

(declare-fun mapRes!38144 () Bool)

(declare-fun tp!73284 () Bool)

(declare-fun e!583482 () Bool)

(assert (=> mapNonEmpty!38144 (= mapRes!38144 (and tp!73284 e!583482))))

(declare-fun mapValue!38144 () ValueCell!11523)

(declare-fun mapRest!38144 () (Array (_ BitVec 32) ValueCell!11523))

(declare-fun mapKey!38144 () (_ BitVec 32))

(assert (=> mapNonEmpty!38144 (= mapRest!38143 (store mapRest!38144 mapKey!38144 mapValue!38144))))

(declare-fun b!1032597 () Bool)

(assert (=> b!1032597 (= e!583482 tp_is_empty!24453)))

(declare-fun mapIsEmpty!38144 () Bool)

(assert (=> mapIsEmpty!38144 mapRes!38144))

(declare-fun b!1032598 () Bool)

(declare-fun e!583483 () Bool)

(assert (=> b!1032598 (= e!583483 tp_is_empty!24453)))

(declare-fun condMapEmpty!38144 () Bool)

(declare-fun mapDefault!38144 () ValueCell!11523)

(assert (=> mapNonEmpty!38143 (= condMapEmpty!38144 (= mapRest!38143 ((as const (Array (_ BitVec 32) ValueCell!11523)) mapDefault!38144)))))

(assert (=> mapNonEmpty!38143 (= tp!73283 (and e!583483 mapRes!38144))))

(assert (= (and mapNonEmpty!38143 condMapEmpty!38144) mapIsEmpty!38144))

(assert (= (and mapNonEmpty!38143 (not condMapEmpty!38144)) mapNonEmpty!38144))

(assert (= (and mapNonEmpty!38144 ((_ is ValueCellFull!11523) mapValue!38144)) b!1032597))

(assert (= (and mapNonEmpty!38143 ((_ is ValueCellFull!11523) mapDefault!38144)) b!1032598))

(declare-fun m!952799 () Bool)

(assert (=> mapNonEmpty!38144 m!952799))

(check-sat (not b!1032569) (not mapNonEmpty!38144) (not b!1032595) (not b!1032583) tp_is_empty!24453 (not b_next!20733) (not bm!43605) (not b!1032594) (not d!123703) (not bm!43599) (not b!1032572) (not b!1032570) (not b!1032555) (not bm!43602) b_and!33201 (not b!1032554))
(check-sat b_and!33201 (not b_next!20733))
