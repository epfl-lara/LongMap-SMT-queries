; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91194 () Bool)

(assert start!91194)

(declare-fun b!1040526 () Bool)

(declare-fun b_free!21019 () Bool)

(declare-fun b_next!21019 () Bool)

(assert (=> b!1040526 (= b_free!21019 (not b_next!21019))))

(declare-fun tp!74258 () Bool)

(declare-fun b_and!33525 () Bool)

(assert (=> b!1040526 (= tp!74258 b_and!33525)))

(declare-fun b!1040521 () Bool)

(declare-fun res!693711 () Bool)

(declare-fun e!589128 () Bool)

(assert (=> b!1040521 (=> (not res!693711) (not e!589128))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040521 (= res!693711 (not (= key!909 (bvneg key!909))))))

(declare-fun res!693709 () Bool)

(assert (=> start!91194 (=> (not res!693709) (not e!589128))))

(declare-datatypes ((V!37859 0))(
  ( (V!37860 (val!12420 Int)) )
))
(declare-datatypes ((ValueCell!11666 0))(
  ( (ValueCellFull!11666 (v!15006 V!37859)) (EmptyCell!11666) )
))
(declare-datatypes ((array!65557 0))(
  ( (array!65558 (arr!31542 (Array (_ BitVec 32) (_ BitVec 64))) (size!32075 (_ BitVec 32))) )
))
(declare-datatypes ((array!65559 0))(
  ( (array!65560 (arr!31543 (Array (_ BitVec 32) ValueCell!11666)) (size!32076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5926 0))(
  ( (LongMapFixedSize!5927 (defaultEntry!6345 Int) (mask!30341 (_ BitVec 32)) (extraKeys!6073 (_ BitVec 32)) (zeroValue!6179 V!37859) (minValue!6179 V!37859) (_size!3018 (_ BitVec 32)) (_keys!11565 array!65557) (_values!6368 array!65559) (_vacant!3018 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5926)

(declare-fun valid!2216 (LongMapFixedSize!5926) Bool)

(assert (=> start!91194 (= res!693709 (valid!2216 thiss!1427))))

(assert (=> start!91194 e!589128))

(declare-fun e!589127 () Bool)

(assert (=> start!91194 e!589127))

(assert (=> start!91194 true))

(declare-fun b!1040522 () Bool)

(declare-fun e!589124 () Bool)

(declare-fun tp_is_empty!24739 () Bool)

(assert (=> b!1040522 (= e!589124 tp_is_empty!24739)))

(declare-fun b!1040523 () Bool)

(declare-fun e!589129 () Bool)

(assert (=> b!1040523 (= e!589129 tp_is_empty!24739)))

(declare-fun mapNonEmpty!38692 () Bool)

(declare-fun mapRes!38692 () Bool)

(declare-fun tp!74257 () Bool)

(assert (=> mapNonEmpty!38692 (= mapRes!38692 (and tp!74257 e!589124))))

(declare-fun mapKey!38692 () (_ BitVec 32))

(declare-fun mapValue!38692 () ValueCell!11666)

(declare-fun mapRest!38692 () (Array (_ BitVec 32) ValueCell!11666))

(assert (=> mapNonEmpty!38692 (= (arr!31543 (_values!6368 thiss!1427)) (store mapRest!38692 mapKey!38692 mapValue!38692))))

(declare-fun b!1040524 () Bool)

(declare-fun e!589126 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040524 (= e!589126 (not (validMask!0 (mask!30341 thiss!1427))))))

(declare-fun lt!458448 () array!65557)

(declare-fun arrayContainsKey!0 (array!65557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040524 (not (arrayContainsKey!0 lt!458448 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33905 0))(
  ( (Unit!33906) )
))
(declare-fun lt!458449 () Unit!33905)

(declare-datatypes ((SeekEntryResult!9795 0))(
  ( (MissingZero!9795 (index!41551 (_ BitVec 32))) (Found!9795 (index!41552 (_ BitVec 32))) (Intermediate!9795 (undefined!10607 Bool) (index!41553 (_ BitVec 32)) (x!92896 (_ BitVec 32))) (Undefined!9795) (MissingVacant!9795 (index!41554 (_ BitVec 32))) )
))
(declare-fun lt!458446 () SeekEntryResult!9795)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65557 (_ BitVec 32) (_ BitVec 64)) Unit!33905)

(assert (=> b!1040524 (= lt!458449 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11565 thiss!1427) (index!41552 lt!458446) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65557 (_ BitVec 32)) Bool)

(assert (=> b!1040524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458448 (mask!30341 thiss!1427))))

(declare-fun lt!458450 () Unit!33905)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65557 (_ BitVec 32) (_ BitVec 32)) Unit!33905)

(assert (=> b!1040524 (= lt!458450 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11565 thiss!1427) (index!41552 lt!458446) (mask!30341 thiss!1427)))))

(declare-datatypes ((List!21998 0))(
  ( (Nil!21995) (Cons!21994 (h!23198 (_ BitVec 64)) (t!31203 List!21998)) )
))
(declare-fun arrayNoDuplicates!0 (array!65557 (_ BitVec 32) List!21998) Bool)

(assert (=> b!1040524 (arrayNoDuplicates!0 lt!458448 #b00000000000000000000000000000000 Nil!21995)))

(declare-fun lt!458447 () Unit!33905)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21998) Unit!33905)

(assert (=> b!1040524 (= lt!458447 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11565 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!458446) #b00000000000000000000000000000000 Nil!21995))))

(declare-fun arrayCountValidKeys!0 (array!65557 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040524 (= (arrayCountValidKeys!0 lt!458448 #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040524 (= lt!458448 (array!65558 (store (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11565 thiss!1427))))))

(declare-fun lt!458451 () Unit!33905)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65557 (_ BitVec 32) (_ BitVec 64)) Unit!33905)

(assert (=> b!1040524 (= lt!458451 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11565 thiss!1427) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040525 () Bool)

(assert (=> b!1040525 (= e!589128 e!589126)))

(declare-fun res!693710 () Bool)

(assert (=> b!1040525 (=> (not res!693710) (not e!589126))))

(get-info :version)

(assert (=> b!1040525 (= res!693710 ((_ is Found!9795) lt!458446))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65557 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1040525 (= lt!458446 (seekEntry!0 key!909 (_keys!11565 thiss!1427) (mask!30341 thiss!1427)))))

(declare-fun e!589123 () Bool)

(declare-fun array_inv!24383 (array!65557) Bool)

(declare-fun array_inv!24384 (array!65559) Bool)

(assert (=> b!1040526 (= e!589127 (and tp!74258 tp_is_empty!24739 (array_inv!24383 (_keys!11565 thiss!1427)) (array_inv!24384 (_values!6368 thiss!1427)) e!589123))))

(declare-fun mapIsEmpty!38692 () Bool)

(assert (=> mapIsEmpty!38692 mapRes!38692))

(declare-fun b!1040527 () Bool)

(assert (=> b!1040527 (= e!589123 (and e!589129 mapRes!38692))))

(declare-fun condMapEmpty!38692 () Bool)

(declare-fun mapDefault!38692 () ValueCell!11666)

(assert (=> b!1040527 (= condMapEmpty!38692 (= (arr!31543 (_values!6368 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11666)) mapDefault!38692)))))

(assert (= (and start!91194 res!693709) b!1040521))

(assert (= (and b!1040521 res!693711) b!1040525))

(assert (= (and b!1040525 res!693710) b!1040524))

(assert (= (and b!1040527 condMapEmpty!38692) mapIsEmpty!38692))

(assert (= (and b!1040527 (not condMapEmpty!38692)) mapNonEmpty!38692))

(assert (= (and mapNonEmpty!38692 ((_ is ValueCellFull!11666) mapValue!38692)) b!1040522))

(assert (= (and b!1040527 ((_ is ValueCellFull!11666) mapDefault!38692)) b!1040523))

(assert (= b!1040526 b!1040527))

(assert (= start!91194 b!1040526))

(declare-fun m!959565 () Bool)

(assert (=> b!1040525 m!959565))

(declare-fun m!959567 () Bool)

(assert (=> mapNonEmpty!38692 m!959567))

(declare-fun m!959569 () Bool)

(assert (=> start!91194 m!959569))

(declare-fun m!959571 () Bool)

(assert (=> b!1040524 m!959571))

(declare-fun m!959573 () Bool)

(assert (=> b!1040524 m!959573))

(declare-fun m!959575 () Bool)

(assert (=> b!1040524 m!959575))

(declare-fun m!959577 () Bool)

(assert (=> b!1040524 m!959577))

(declare-fun m!959579 () Bool)

(assert (=> b!1040524 m!959579))

(declare-fun m!959581 () Bool)

(assert (=> b!1040524 m!959581))

(declare-fun m!959583 () Bool)

(assert (=> b!1040524 m!959583))

(declare-fun m!959585 () Bool)

(assert (=> b!1040524 m!959585))

(declare-fun m!959587 () Bool)

(assert (=> b!1040524 m!959587))

(declare-fun m!959589 () Bool)

(assert (=> b!1040524 m!959589))

(declare-fun m!959591 () Bool)

(assert (=> b!1040524 m!959591))

(declare-fun m!959593 () Bool)

(assert (=> b!1040526 m!959593))

(declare-fun m!959595 () Bool)

(assert (=> b!1040526 m!959595))

(check-sat (not b!1040524) (not b_next!21019) (not start!91194) (not b!1040526) tp_is_empty!24739 (not mapNonEmpty!38692) b_and!33525 (not b!1040525))
(check-sat b_and!33525 (not b_next!21019))
(get-model)

(declare-fun d!125539 () Bool)

(declare-fun res!693736 () Bool)

(declare-fun e!589174 () Bool)

(assert (=> d!125539 (=> (not res!693736) (not e!589174))))

(declare-fun simpleValid!435 (LongMapFixedSize!5926) Bool)

(assert (=> d!125539 (= res!693736 (simpleValid!435 thiss!1427))))

(assert (=> d!125539 (= (valid!2216 thiss!1427) e!589174)))

(declare-fun b!1040576 () Bool)

(declare-fun res!693737 () Bool)

(assert (=> b!1040576 (=> (not res!693737) (not e!589174))))

(assert (=> b!1040576 (= res!693737 (= (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) (_size!3018 thiss!1427)))))

(declare-fun b!1040577 () Bool)

(declare-fun res!693738 () Bool)

(assert (=> b!1040577 (=> (not res!693738) (not e!589174))))

(assert (=> b!1040577 (= res!693738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11565 thiss!1427) (mask!30341 thiss!1427)))))

(declare-fun b!1040578 () Bool)

(assert (=> b!1040578 (= e!589174 (arrayNoDuplicates!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 Nil!21995))))

(assert (= (and d!125539 res!693736) b!1040576))

(assert (= (and b!1040576 res!693737) b!1040577))

(assert (= (and b!1040577 res!693738) b!1040578))

(declare-fun m!959661 () Bool)

(assert (=> d!125539 m!959661))

(assert (=> b!1040576 m!959577))

(declare-fun m!959663 () Bool)

(assert (=> b!1040577 m!959663))

(declare-fun m!959665 () Bool)

(assert (=> b!1040578 m!959665))

(assert (=> start!91194 d!125539))

(declare-fun d!125541 () Bool)

(declare-fun e!589177 () Bool)

(assert (=> d!125541 e!589177))

(declare-fun res!693741 () Bool)

(assert (=> d!125541 (=> (not res!693741) (not e!589177))))

(assert (=> d!125541 (= res!693741 (and (bvsge (index!41552 lt!458446) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458446) (size!32075 (_keys!11565 thiss!1427)))))))

(declare-fun lt!458490 () Unit!33905)

(declare-fun choose!53 (array!65557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21998) Unit!33905)

(assert (=> d!125541 (= lt!458490 (choose!53 (_keys!11565 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!458446) #b00000000000000000000000000000000 Nil!21995))))

(assert (=> d!125541 (bvslt (size!32075 (_keys!11565 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125541 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11565 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!458446) #b00000000000000000000000000000000 Nil!21995) lt!458490)))

(declare-fun b!1040581 () Bool)

(assert (=> b!1040581 (= e!589177 (arrayNoDuplicates!0 (array!65558 (store (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11565 thiss!1427))) #b00000000000000000000000000000000 Nil!21995))))

(assert (= (and d!125541 res!693741) b!1040581))

(declare-fun m!959667 () Bool)

(assert (=> d!125541 m!959667))

(assert (=> b!1040581 m!959573))

(declare-fun m!959669 () Bool)

(assert (=> b!1040581 m!959669))

(assert (=> b!1040524 d!125541))

(declare-fun d!125543 () Bool)

(declare-fun e!589180 () Bool)

(assert (=> d!125543 e!589180))

(declare-fun res!693744 () Bool)

(assert (=> d!125543 (=> (not res!693744) (not e!589180))))

(assert (=> d!125543 (= res!693744 (and (bvsge (index!41552 lt!458446) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458446) (size!32075 (_keys!11565 thiss!1427)))))))

(declare-fun lt!458493 () Unit!33905)

(declare-fun choose!25 (array!65557 (_ BitVec 32) (_ BitVec 32)) Unit!33905)

(assert (=> d!125543 (= lt!458493 (choose!25 (_keys!11565 thiss!1427) (index!41552 lt!458446) (mask!30341 thiss!1427)))))

(assert (=> d!125543 (validMask!0 (mask!30341 thiss!1427))))

(assert (=> d!125543 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11565 thiss!1427) (index!41552 lt!458446) (mask!30341 thiss!1427)) lt!458493)))

(declare-fun b!1040584 () Bool)

(assert (=> b!1040584 (= e!589180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65558 (store (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11565 thiss!1427))) (mask!30341 thiss!1427)))))

(assert (= (and d!125543 res!693744) b!1040584))

(declare-fun m!959671 () Bool)

(assert (=> d!125543 m!959671))

(assert (=> d!125543 m!959587))

(assert (=> b!1040584 m!959573))

(declare-fun m!959673 () Bool)

(assert (=> b!1040584 m!959673))

(assert (=> b!1040524 d!125543))

(declare-fun b!1040593 () Bool)

(declare-fun e!589186 () (_ BitVec 32))

(assert (=> b!1040593 (= e!589186 #b00000000000000000000000000000000)))

(declare-fun bm!44044 () Bool)

(declare-fun call!44047 () (_ BitVec 32))

(assert (=> bm!44044 (= call!44047 (arrayCountValidKeys!0 lt!458448 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32075 (_keys!11565 thiss!1427))))))

(declare-fun b!1040594 () Bool)

(declare-fun e!589185 () (_ BitVec 32))

(assert (=> b!1040594 (= e!589185 (bvadd #b00000000000000000000000000000001 call!44047))))

(declare-fun b!1040595 () Bool)

(assert (=> b!1040595 (= e!589185 call!44047)))

(declare-fun b!1040596 () Bool)

(assert (=> b!1040596 (= e!589186 e!589185)))

(declare-fun c!105481 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040596 (= c!105481 (validKeyInArray!0 (select (arr!31542 lt!458448) #b00000000000000000000000000000000)))))

(declare-fun d!125545 () Bool)

(declare-fun lt!458496 () (_ BitVec 32))

(assert (=> d!125545 (and (bvsge lt!458496 #b00000000000000000000000000000000) (bvsle lt!458496 (bvsub (size!32075 lt!458448) #b00000000000000000000000000000000)))))

(assert (=> d!125545 (= lt!458496 e!589186)))

(declare-fun c!105480 () Bool)

(assert (=> d!125545 (= c!105480 (bvsge #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))))))

(assert (=> d!125545 (and (bvsle #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32075 (_keys!11565 thiss!1427)) (size!32075 lt!458448)))))

(assert (=> d!125545 (= (arrayCountValidKeys!0 lt!458448 #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) lt!458496)))

(assert (= (and d!125545 c!105480) b!1040593))

(assert (= (and d!125545 (not c!105480)) b!1040596))

(assert (= (and b!1040596 c!105481) b!1040594))

(assert (= (and b!1040596 (not c!105481)) b!1040595))

(assert (= (or b!1040594 b!1040595) bm!44044))

(declare-fun m!959675 () Bool)

(assert (=> bm!44044 m!959675))

(declare-fun m!959677 () Bool)

(assert (=> b!1040596 m!959677))

(assert (=> b!1040596 m!959677))

(declare-fun m!959679 () Bool)

(assert (=> b!1040596 m!959679))

(assert (=> b!1040524 d!125545))

(declare-fun b!1040605 () Bool)

(declare-fun e!589193 () Bool)

(declare-fun call!44050 () Bool)

(assert (=> b!1040605 (= e!589193 call!44050)))

(declare-fun b!1040606 () Bool)

(declare-fun e!589194 () Bool)

(assert (=> b!1040606 (= e!589194 call!44050)))

(declare-fun d!125547 () Bool)

(declare-fun res!693749 () Bool)

(declare-fun e!589195 () Bool)

(assert (=> d!125547 (=> res!693749 e!589195)))

(assert (=> d!125547 (= res!693749 (bvsge #b00000000000000000000000000000000 (size!32075 lt!458448)))))

(assert (=> d!125547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458448 (mask!30341 thiss!1427)) e!589195)))

(declare-fun b!1040607 () Bool)

(assert (=> b!1040607 (= e!589195 e!589194)))

(declare-fun c!105484 () Bool)

(assert (=> b!1040607 (= c!105484 (validKeyInArray!0 (select (arr!31542 lt!458448) #b00000000000000000000000000000000)))))

(declare-fun b!1040608 () Bool)

(assert (=> b!1040608 (= e!589194 e!589193)))

(declare-fun lt!458503 () (_ BitVec 64))

(assert (=> b!1040608 (= lt!458503 (select (arr!31542 lt!458448) #b00000000000000000000000000000000))))

(declare-fun lt!458505 () Unit!33905)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65557 (_ BitVec 64) (_ BitVec 32)) Unit!33905)

(assert (=> b!1040608 (= lt!458505 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458448 lt!458503 #b00000000000000000000000000000000))))

(assert (=> b!1040608 (arrayContainsKey!0 lt!458448 lt!458503 #b00000000000000000000000000000000)))

(declare-fun lt!458504 () Unit!33905)

(assert (=> b!1040608 (= lt!458504 lt!458505)))

(declare-fun res!693750 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65557 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1040608 (= res!693750 (= (seekEntryOrOpen!0 (select (arr!31542 lt!458448) #b00000000000000000000000000000000) lt!458448 (mask!30341 thiss!1427)) (Found!9795 #b00000000000000000000000000000000)))))

(assert (=> b!1040608 (=> (not res!693750) (not e!589193))))

(declare-fun bm!44047 () Bool)

(assert (=> bm!44047 (= call!44050 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458448 (mask!30341 thiss!1427)))))

(assert (= (and d!125547 (not res!693749)) b!1040607))

(assert (= (and b!1040607 c!105484) b!1040608))

(assert (= (and b!1040607 (not c!105484)) b!1040606))

(assert (= (and b!1040608 res!693750) b!1040605))

(assert (= (or b!1040605 b!1040606) bm!44047))

(assert (=> b!1040607 m!959677))

(assert (=> b!1040607 m!959677))

(assert (=> b!1040607 m!959679))

(assert (=> b!1040608 m!959677))

(declare-fun m!959681 () Bool)

(assert (=> b!1040608 m!959681))

(declare-fun m!959683 () Bool)

(assert (=> b!1040608 m!959683))

(assert (=> b!1040608 m!959677))

(declare-fun m!959685 () Bool)

(assert (=> b!1040608 m!959685))

(declare-fun m!959687 () Bool)

(assert (=> bm!44047 m!959687))

(assert (=> b!1040524 d!125547))

(declare-fun d!125549 () Bool)

(assert (=> d!125549 (= (validMask!0 (mask!30341 thiss!1427)) (and (or (= (mask!30341 thiss!1427) #b00000000000000000000000000000111) (= (mask!30341 thiss!1427) #b00000000000000000000000000001111) (= (mask!30341 thiss!1427) #b00000000000000000000000000011111) (= (mask!30341 thiss!1427) #b00000000000000000000000000111111) (= (mask!30341 thiss!1427) #b00000000000000000000000001111111) (= (mask!30341 thiss!1427) #b00000000000000000000000011111111) (= (mask!30341 thiss!1427) #b00000000000000000000000111111111) (= (mask!30341 thiss!1427) #b00000000000000000000001111111111) (= (mask!30341 thiss!1427) #b00000000000000000000011111111111) (= (mask!30341 thiss!1427) #b00000000000000000000111111111111) (= (mask!30341 thiss!1427) #b00000000000000000001111111111111) (= (mask!30341 thiss!1427) #b00000000000000000011111111111111) (= (mask!30341 thiss!1427) #b00000000000000000111111111111111) (= (mask!30341 thiss!1427) #b00000000000000001111111111111111) (= (mask!30341 thiss!1427) #b00000000000000011111111111111111) (= (mask!30341 thiss!1427) #b00000000000000111111111111111111) (= (mask!30341 thiss!1427) #b00000000000001111111111111111111) (= (mask!30341 thiss!1427) #b00000000000011111111111111111111) (= (mask!30341 thiss!1427) #b00000000000111111111111111111111) (= (mask!30341 thiss!1427) #b00000000001111111111111111111111) (= (mask!30341 thiss!1427) #b00000000011111111111111111111111) (= (mask!30341 thiss!1427) #b00000000111111111111111111111111) (= (mask!30341 thiss!1427) #b00000001111111111111111111111111) (= (mask!30341 thiss!1427) #b00000011111111111111111111111111) (= (mask!30341 thiss!1427) #b00000111111111111111111111111111) (= (mask!30341 thiss!1427) #b00001111111111111111111111111111) (= (mask!30341 thiss!1427) #b00011111111111111111111111111111) (= (mask!30341 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30341 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040524 d!125549))

(declare-fun d!125551 () Bool)

(declare-fun res!693755 () Bool)

(declare-fun e!589200 () Bool)

(assert (=> d!125551 (=> res!693755 e!589200)))

(assert (=> d!125551 (= res!693755 (= (select (arr!31542 lt!458448) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125551 (= (arrayContainsKey!0 lt!458448 key!909 #b00000000000000000000000000000000) e!589200)))

(declare-fun b!1040613 () Bool)

(declare-fun e!589201 () Bool)

(assert (=> b!1040613 (= e!589200 e!589201)))

(declare-fun res!693756 () Bool)

(assert (=> b!1040613 (=> (not res!693756) (not e!589201))))

(assert (=> b!1040613 (= res!693756 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32075 lt!458448)))))

(declare-fun b!1040614 () Bool)

(assert (=> b!1040614 (= e!589201 (arrayContainsKey!0 lt!458448 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125551 (not res!693755)) b!1040613))

(assert (= (and b!1040613 res!693756) b!1040614))

(assert (=> d!125551 m!959677))

(declare-fun m!959689 () Bool)

(assert (=> b!1040614 m!959689))

(assert (=> b!1040524 d!125551))

(declare-fun b!1040623 () Bool)

(declare-fun res!693765 () Bool)

(declare-fun e!589207 () Bool)

(assert (=> b!1040623 (=> (not res!693765) (not e!589207))))

(assert (=> b!1040623 (= res!693765 (validKeyInArray!0 (select (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458446))))))

(declare-fun d!125553 () Bool)

(declare-fun e!589206 () Bool)

(assert (=> d!125553 e!589206))

(declare-fun res!693767 () Bool)

(assert (=> d!125553 (=> (not res!693767) (not e!589206))))

(assert (=> d!125553 (= res!693767 (and (bvsge (index!41552 lt!458446) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458446) (size!32075 (_keys!11565 thiss!1427)))))))

(declare-fun lt!458508 () Unit!33905)

(declare-fun choose!82 (array!65557 (_ BitVec 32) (_ BitVec 64)) Unit!33905)

(assert (=> d!125553 (= lt!458508 (choose!82 (_keys!11565 thiss!1427) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125553 e!589207))

(declare-fun res!693766 () Bool)

(assert (=> d!125553 (=> (not res!693766) (not e!589207))))

(assert (=> d!125553 (= res!693766 (and (bvsge (index!41552 lt!458446) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458446) (size!32075 (_keys!11565 thiss!1427)))))))

(assert (=> d!125553 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11565 thiss!1427) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458508)))

(declare-fun b!1040626 () Bool)

(assert (=> b!1040626 (= e!589206 (= (arrayCountValidKeys!0 (array!65558 (store (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11565 thiss!1427))) #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040624 () Bool)

(declare-fun res!693768 () Bool)

(assert (=> b!1040624 (=> (not res!693768) (not e!589207))))

(assert (=> b!1040624 (= res!693768 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040625 () Bool)

(assert (=> b!1040625 (= e!589207 (bvslt (size!32075 (_keys!11565 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125553 res!693766) b!1040623))

(assert (= (and b!1040623 res!693765) b!1040624))

(assert (= (and b!1040624 res!693768) b!1040625))

(assert (= (and d!125553 res!693767) b!1040626))

(declare-fun m!959691 () Bool)

(assert (=> b!1040623 m!959691))

(assert (=> b!1040623 m!959691))

(declare-fun m!959693 () Bool)

(assert (=> b!1040623 m!959693))

(declare-fun m!959695 () Bool)

(assert (=> d!125553 m!959695))

(assert (=> b!1040626 m!959573))

(declare-fun m!959697 () Bool)

(assert (=> b!1040626 m!959697))

(assert (=> b!1040626 m!959577))

(declare-fun m!959699 () Bool)

(assert (=> b!1040624 m!959699))

(assert (=> b!1040524 d!125553))

(declare-fun b!1040627 () Bool)

(declare-fun e!589209 () (_ BitVec 32))

(assert (=> b!1040627 (= e!589209 #b00000000000000000000000000000000)))

(declare-fun bm!44048 () Bool)

(declare-fun call!44051 () (_ BitVec 32))

(assert (=> bm!44048 (= call!44051 (arrayCountValidKeys!0 (_keys!11565 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32075 (_keys!11565 thiss!1427))))))

(declare-fun b!1040628 () Bool)

(declare-fun e!589208 () (_ BitVec 32))

(assert (=> b!1040628 (= e!589208 (bvadd #b00000000000000000000000000000001 call!44051))))

(declare-fun b!1040629 () Bool)

(assert (=> b!1040629 (= e!589208 call!44051)))

(declare-fun b!1040630 () Bool)

(assert (=> b!1040630 (= e!589209 e!589208)))

(declare-fun c!105486 () Bool)

(assert (=> b!1040630 (= c!105486 (validKeyInArray!0 (select (arr!31542 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125555 () Bool)

(declare-fun lt!458509 () (_ BitVec 32))

(assert (=> d!125555 (and (bvsge lt!458509 #b00000000000000000000000000000000) (bvsle lt!458509 (bvsub (size!32075 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125555 (= lt!458509 e!589209)))

(declare-fun c!105485 () Bool)

(assert (=> d!125555 (= c!105485 (bvsge #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))))))

(assert (=> d!125555 (and (bvsle #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32075 (_keys!11565 thiss!1427)) (size!32075 (_keys!11565 thiss!1427))))))

(assert (=> d!125555 (= (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11565 thiss!1427))) lt!458509)))

(assert (= (and d!125555 c!105485) b!1040627))

(assert (= (and d!125555 (not c!105485)) b!1040630))

(assert (= (and b!1040630 c!105486) b!1040628))

(assert (= (and b!1040630 (not c!105486)) b!1040629))

(assert (= (or b!1040628 b!1040629) bm!44048))

(declare-fun m!959701 () Bool)

(assert (=> bm!44048 m!959701))

(declare-fun m!959703 () Bool)

(assert (=> b!1040630 m!959703))

(assert (=> b!1040630 m!959703))

(declare-fun m!959705 () Bool)

(assert (=> b!1040630 m!959705))

(assert (=> b!1040524 d!125555))

(declare-fun b!1040641 () Bool)

(declare-fun e!589219 () Bool)

(declare-fun call!44054 () Bool)

(assert (=> b!1040641 (= e!589219 call!44054)))

(declare-fun b!1040642 () Bool)

(declare-fun e!589218 () Bool)

(declare-fun e!589221 () Bool)

(assert (=> b!1040642 (= e!589218 e!589221)))

(declare-fun res!693776 () Bool)

(assert (=> b!1040642 (=> (not res!693776) (not e!589221))))

(declare-fun e!589220 () Bool)

(assert (=> b!1040642 (= res!693776 (not e!589220))))

(declare-fun res!693777 () Bool)

(assert (=> b!1040642 (=> (not res!693777) (not e!589220))))

(assert (=> b!1040642 (= res!693777 (validKeyInArray!0 (select (arr!31542 lt!458448) #b00000000000000000000000000000000)))))

(declare-fun bm!44051 () Bool)

(declare-fun c!105489 () Bool)

(assert (=> bm!44051 (= call!44054 (arrayNoDuplicates!0 lt!458448 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105489 (Cons!21994 (select (arr!31542 lt!458448) #b00000000000000000000000000000000) Nil!21995) Nil!21995)))))

(declare-fun b!1040644 () Bool)

(assert (=> b!1040644 (= e!589219 call!44054)))

(declare-fun b!1040645 () Bool)

(assert (=> b!1040645 (= e!589221 e!589219)))

(assert (=> b!1040645 (= c!105489 (validKeyInArray!0 (select (arr!31542 lt!458448) #b00000000000000000000000000000000)))))

(declare-fun d!125557 () Bool)

(declare-fun res!693775 () Bool)

(assert (=> d!125557 (=> res!693775 e!589218)))

(assert (=> d!125557 (= res!693775 (bvsge #b00000000000000000000000000000000 (size!32075 lt!458448)))))

(assert (=> d!125557 (= (arrayNoDuplicates!0 lt!458448 #b00000000000000000000000000000000 Nil!21995) e!589218)))

(declare-fun b!1040643 () Bool)

(declare-fun contains!6031 (List!21998 (_ BitVec 64)) Bool)

(assert (=> b!1040643 (= e!589220 (contains!6031 Nil!21995 (select (arr!31542 lt!458448) #b00000000000000000000000000000000)))))

(assert (= (and d!125557 (not res!693775)) b!1040642))

(assert (= (and b!1040642 res!693777) b!1040643))

(assert (= (and b!1040642 res!693776) b!1040645))

(assert (= (and b!1040645 c!105489) b!1040644))

(assert (= (and b!1040645 (not c!105489)) b!1040641))

(assert (= (or b!1040644 b!1040641) bm!44051))

(assert (=> b!1040642 m!959677))

(assert (=> b!1040642 m!959677))

(assert (=> b!1040642 m!959679))

(assert (=> bm!44051 m!959677))

(declare-fun m!959707 () Bool)

(assert (=> bm!44051 m!959707))

(assert (=> b!1040645 m!959677))

(assert (=> b!1040645 m!959677))

(assert (=> b!1040645 m!959679))

(assert (=> b!1040643 m!959677))

(assert (=> b!1040643 m!959677))

(declare-fun m!959709 () Bool)

(assert (=> b!1040643 m!959709))

(assert (=> b!1040524 d!125557))

(declare-fun d!125559 () Bool)

(declare-fun e!589224 () Bool)

(assert (=> d!125559 e!589224))

(declare-fun res!693780 () Bool)

(assert (=> d!125559 (=> (not res!693780) (not e!589224))))

(assert (=> d!125559 (= res!693780 (bvslt (index!41552 lt!458446) (size!32075 (_keys!11565 thiss!1427))))))

(declare-fun lt!458512 () Unit!33905)

(declare-fun choose!121 (array!65557 (_ BitVec 32) (_ BitVec 64)) Unit!33905)

(assert (=> d!125559 (= lt!458512 (choose!121 (_keys!11565 thiss!1427) (index!41552 lt!458446) key!909))))

(assert (=> d!125559 (bvsge (index!41552 lt!458446) #b00000000000000000000000000000000)))

(assert (=> d!125559 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11565 thiss!1427) (index!41552 lt!458446) key!909) lt!458512)))

(declare-fun b!1040648 () Bool)

(assert (=> b!1040648 (= e!589224 (not (arrayContainsKey!0 (array!65558 (store (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458446) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11565 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125559 res!693780) b!1040648))

(declare-fun m!959711 () Bool)

(assert (=> d!125559 m!959711))

(assert (=> b!1040648 m!959573))

(declare-fun m!959713 () Bool)

(assert (=> b!1040648 m!959713))

(assert (=> b!1040524 d!125559))

(declare-fun d!125561 () Bool)

(assert (=> d!125561 (= (array_inv!24383 (_keys!11565 thiss!1427)) (bvsge (size!32075 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040526 d!125561))

(declare-fun d!125563 () Bool)

(assert (=> d!125563 (= (array_inv!24384 (_values!6368 thiss!1427)) (bvsge (size!32076 (_values!6368 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040526 d!125563))

(declare-fun b!1040661 () Bool)

(declare-fun e!589231 () SeekEntryResult!9795)

(declare-fun lt!458524 () SeekEntryResult!9795)

(assert (=> b!1040661 (= e!589231 (ite ((_ is MissingVacant!9795) lt!458524) (MissingZero!9795 (index!41554 lt!458524)) lt!458524))))

(declare-fun lt!458523 () SeekEntryResult!9795)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65557 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1040661 (= lt!458524 (seekKeyOrZeroReturnVacant!0 (x!92896 lt!458523) (index!41553 lt!458523) (index!41553 lt!458523) key!909 (_keys!11565 thiss!1427) (mask!30341 thiss!1427)))))

(declare-fun b!1040662 () Bool)

(declare-fun e!589232 () SeekEntryResult!9795)

(assert (=> b!1040662 (= e!589232 Undefined!9795)))

(declare-fun b!1040663 () Bool)

(declare-fun e!589233 () SeekEntryResult!9795)

(assert (=> b!1040663 (= e!589232 e!589233)))

(declare-fun lt!458522 () (_ BitVec 64))

(assert (=> b!1040663 (= lt!458522 (select (arr!31542 (_keys!11565 thiss!1427)) (index!41553 lt!458523)))))

(declare-fun c!105497 () Bool)

(assert (=> b!1040663 (= c!105497 (= lt!458522 key!909))))

(declare-fun b!1040664 () Bool)

(assert (=> b!1040664 (= e!589233 (Found!9795 (index!41553 lt!458523)))))

(declare-fun d!125565 () Bool)

(declare-fun lt!458521 () SeekEntryResult!9795)

(assert (=> d!125565 (and (or ((_ is MissingVacant!9795) lt!458521) (not ((_ is Found!9795) lt!458521)) (and (bvsge (index!41552 lt!458521) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458521) (size!32075 (_keys!11565 thiss!1427))))) (not ((_ is MissingVacant!9795) lt!458521)) (or (not ((_ is Found!9795) lt!458521)) (= (select (arr!31542 (_keys!11565 thiss!1427)) (index!41552 lt!458521)) key!909)))))

(assert (=> d!125565 (= lt!458521 e!589232)))

(declare-fun c!105496 () Bool)

(assert (=> d!125565 (= c!105496 (and ((_ is Intermediate!9795) lt!458523) (undefined!10607 lt!458523)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65557 (_ BitVec 32)) SeekEntryResult!9795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125565 (= lt!458523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30341 thiss!1427)) key!909 (_keys!11565 thiss!1427) (mask!30341 thiss!1427)))))

(assert (=> d!125565 (validMask!0 (mask!30341 thiss!1427))))

(assert (=> d!125565 (= (seekEntry!0 key!909 (_keys!11565 thiss!1427) (mask!30341 thiss!1427)) lt!458521)))

(declare-fun b!1040665 () Bool)

(declare-fun c!105498 () Bool)

(assert (=> b!1040665 (= c!105498 (= lt!458522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040665 (= e!589233 e!589231)))

(declare-fun b!1040666 () Bool)

(assert (=> b!1040666 (= e!589231 (MissingZero!9795 (index!41553 lt!458523)))))

(assert (= (and d!125565 c!105496) b!1040662))

(assert (= (and d!125565 (not c!105496)) b!1040663))

(assert (= (and b!1040663 c!105497) b!1040664))

(assert (= (and b!1040663 (not c!105497)) b!1040665))

(assert (= (and b!1040665 c!105498) b!1040666))

(assert (= (and b!1040665 (not c!105498)) b!1040661))

(declare-fun m!959715 () Bool)

(assert (=> b!1040661 m!959715))

(declare-fun m!959717 () Bool)

(assert (=> b!1040663 m!959717))

(declare-fun m!959719 () Bool)

(assert (=> d!125565 m!959719))

(declare-fun m!959721 () Bool)

(assert (=> d!125565 m!959721))

(assert (=> d!125565 m!959721))

(declare-fun m!959723 () Bool)

(assert (=> d!125565 m!959723))

(assert (=> d!125565 m!959587))

(assert (=> b!1040525 d!125565))

(declare-fun mapNonEmpty!38701 () Bool)

(declare-fun mapRes!38701 () Bool)

(declare-fun tp!74273 () Bool)

(declare-fun e!589239 () Bool)

(assert (=> mapNonEmpty!38701 (= mapRes!38701 (and tp!74273 e!589239))))

(declare-fun mapKey!38701 () (_ BitVec 32))

(declare-fun mapValue!38701 () ValueCell!11666)

(declare-fun mapRest!38701 () (Array (_ BitVec 32) ValueCell!11666))

(assert (=> mapNonEmpty!38701 (= mapRest!38692 (store mapRest!38701 mapKey!38701 mapValue!38701))))

(declare-fun b!1040673 () Bool)

(assert (=> b!1040673 (= e!589239 tp_is_empty!24739)))

(declare-fun condMapEmpty!38701 () Bool)

(declare-fun mapDefault!38701 () ValueCell!11666)

(assert (=> mapNonEmpty!38692 (= condMapEmpty!38701 (= mapRest!38692 ((as const (Array (_ BitVec 32) ValueCell!11666)) mapDefault!38701)))))

(declare-fun e!589238 () Bool)

(assert (=> mapNonEmpty!38692 (= tp!74257 (and e!589238 mapRes!38701))))

(declare-fun mapIsEmpty!38701 () Bool)

(assert (=> mapIsEmpty!38701 mapRes!38701))

(declare-fun b!1040674 () Bool)

(assert (=> b!1040674 (= e!589238 tp_is_empty!24739)))

(assert (= (and mapNonEmpty!38692 condMapEmpty!38701) mapIsEmpty!38701))

(assert (= (and mapNonEmpty!38692 (not condMapEmpty!38701)) mapNonEmpty!38701))

(assert (= (and mapNonEmpty!38701 ((_ is ValueCellFull!11666) mapValue!38701)) b!1040673))

(assert (= (and mapNonEmpty!38692 ((_ is ValueCellFull!11666) mapDefault!38701)) b!1040674))

(declare-fun m!959725 () Bool)

(assert (=> mapNonEmpty!38701 m!959725))

(check-sat (not b!1040578) (not b!1040584) (not b!1040648) (not d!125543) (not b!1040608) (not b!1040577) (not b!1040643) (not b!1040581) (not d!125539) (not b!1040623) (not d!125541) (not b_next!21019) (not bm!44044) (not bm!44048) (not bm!44051) (not b!1040642) (not b!1040607) (not b!1040576) (not d!125565) (not b!1040596) (not b!1040626) b_and!33525 (not bm!44047) (not b!1040630) (not mapNonEmpty!38701) tp_is_empty!24739 (not b!1040624) (not d!125553) (not b!1040645) (not b!1040661) (not d!125559) (not b!1040614))
(check-sat b_and!33525 (not b_next!21019))
