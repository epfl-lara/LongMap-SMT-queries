; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90868 () Bool)

(assert start!90868)

(declare-fun b!1038577 () Bool)

(declare-fun b_free!20949 () Bool)

(declare-fun b_next!20949 () Bool)

(assert (=> b!1038577 (= b_free!20949 (not b_next!20949))))

(declare-fun tp!74010 () Bool)

(declare-fun b_and!33481 () Bool)

(assert (=> b!1038577 (= tp!74010 b_and!33481)))

(declare-fun tp_is_empty!24669 () Bool)

(declare-fun e!587677 () Bool)

(declare-datatypes ((V!37765 0))(
  ( (V!37766 (val!12385 Int)) )
))
(declare-datatypes ((ValueCell!11631 0))(
  ( (ValueCellFull!11631 (v!14971 V!37765)) (EmptyCell!11631) )
))
(declare-datatypes ((array!65454 0))(
  ( (array!65455 (arr!31503 (Array (_ BitVec 32) (_ BitVec 64))) (size!32033 (_ BitVec 32))) )
))
(declare-datatypes ((array!65456 0))(
  ( (array!65457 (arr!31504 (Array (_ BitVec 32) ValueCell!11631)) (size!32034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5856 0))(
  ( (LongMapFixedSize!5857 (defaultEntry!6310 Int) (mask!30252 (_ BitVec 32)) (extraKeys!6038 (_ BitVec 32)) (zeroValue!6144 V!37765) (minValue!6144 V!37765) (_size!2983 (_ BitVec 32)) (_keys!11512 array!65454) (_values!6333 array!65456) (_vacant!2983 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5856)

(declare-fun e!587683 () Bool)

(declare-fun array_inv!24359 (array!65454) Bool)

(declare-fun array_inv!24360 (array!65456) Bool)

(assert (=> b!1038577 (= e!587677 (and tp!74010 tp_is_empty!24669 (array_inv!24359 (_keys!11512 thiss!1427)) (array_inv!24360 (_values!6333 thiss!1427)) e!587683))))

(declare-fun b!1038578 () Bool)

(declare-fun res!692792 () Bool)

(declare-fun e!587682 () Bool)

(assert (=> b!1038578 (=> (not res!692792) (not e!587682))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038578 (= res!692792 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038579 () Bool)

(declare-fun e!587676 () Bool)

(assert (=> b!1038579 (= e!587682 e!587676)))

(declare-fun res!692793 () Bool)

(assert (=> b!1038579 (=> (not res!692793) (not e!587676))))

(declare-datatypes ((SeekEntryResult!9773 0))(
  ( (MissingZero!9773 (index!41463 (_ BitVec 32))) (Found!9773 (index!41464 (_ BitVec 32))) (Intermediate!9773 (undefined!10585 Bool) (index!41465 (_ BitVec 32)) (x!92676 (_ BitVec 32))) (Undefined!9773) (MissingVacant!9773 (index!41466 (_ BitVec 32))) )
))
(declare-fun lt!457790 () SeekEntryResult!9773)

(get-info :version)

(assert (=> b!1038579 (= res!692793 ((_ is Found!9773) lt!457790))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65454 (_ BitVec 32)) SeekEntryResult!9773)

(assert (=> b!1038579 (= lt!457790 (seekEntry!0 key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(declare-fun b!1038580 () Bool)

(declare-fun e!587680 () Bool)

(assert (=> b!1038580 (= e!587680 tp_is_empty!24669)))

(declare-fun res!692790 () Bool)

(assert (=> start!90868 (=> (not res!692790) (not e!587682))))

(declare-fun valid!2203 (LongMapFixedSize!5856) Bool)

(assert (=> start!90868 (= res!692790 (valid!2203 thiss!1427))))

(assert (=> start!90868 e!587682))

(assert (=> start!90868 e!587677))

(assert (=> start!90868 true))

(declare-fun b!1038581 () Bool)

(declare-fun e!587681 () Bool)

(assert (=> b!1038581 (= e!587681 tp_is_empty!24669)))

(declare-fun b!1038582 () Bool)

(declare-fun mapRes!38550 () Bool)

(assert (=> b!1038582 (= e!587683 (and e!587680 mapRes!38550))))

(declare-fun condMapEmpty!38550 () Bool)

(declare-fun mapDefault!38550 () ValueCell!11631)

(assert (=> b!1038582 (= condMapEmpty!38550 (= (arr!31504 (_values!6333 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11631)) mapDefault!38550)))))

(declare-fun b!1038583 () Bool)

(declare-fun e!587678 () Bool)

(assert (=> b!1038583 (= e!587678 (= (size!32033 (_keys!11512 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30252 thiss!1427))))))

(declare-fun mapIsEmpty!38550 () Bool)

(assert (=> mapIsEmpty!38550 mapRes!38550))

(declare-fun b!1038584 () Bool)

(assert (=> b!1038584 (= e!587676 (not e!587678))))

(declare-fun res!692791 () Bool)

(assert (=> b!1038584 (=> res!692791 e!587678)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038584 (= res!692791 (not (validMask!0 (mask!30252 thiss!1427))))))

(declare-fun lt!457791 () array!65454)

(declare-datatypes ((List!21938 0))(
  ( (Nil!21935) (Cons!21934 (h!23137 (_ BitVec 64)) (t!31152 List!21938)) )
))
(declare-fun arrayNoDuplicates!0 (array!65454 (_ BitVec 32) List!21938) Bool)

(assert (=> b!1038584 (arrayNoDuplicates!0 lt!457791 #b00000000000000000000000000000000 Nil!21935)))

(declare-datatypes ((Unit!33979 0))(
  ( (Unit!33980) )
))
(declare-fun lt!457792 () Unit!33979)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21938) Unit!33979)

(assert (=> b!1038584 (= lt!457792 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11512 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!457790) #b00000000000000000000000000000000 Nil!21935))))

(declare-fun arrayCountValidKeys!0 (array!65454 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038584 (= (arrayCountValidKeys!0 lt!457791 #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038584 (= lt!457791 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))))))

(declare-fun lt!457793 () Unit!33979)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65454 (_ BitVec 32) (_ BitVec 64)) Unit!33979)

(assert (=> b!1038584 (= lt!457793 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11512 thiss!1427) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38550 () Bool)

(declare-fun tp!74011 () Bool)

(assert (=> mapNonEmpty!38550 (= mapRes!38550 (and tp!74011 e!587681))))

(declare-fun mapValue!38550 () ValueCell!11631)

(declare-fun mapRest!38550 () (Array (_ BitVec 32) ValueCell!11631))

(declare-fun mapKey!38550 () (_ BitVec 32))

(assert (=> mapNonEmpty!38550 (= (arr!31504 (_values!6333 thiss!1427)) (store mapRest!38550 mapKey!38550 mapValue!38550))))

(assert (= (and start!90868 res!692790) b!1038578))

(assert (= (and b!1038578 res!692792) b!1038579))

(assert (= (and b!1038579 res!692793) b!1038584))

(assert (= (and b!1038584 (not res!692791)) b!1038583))

(assert (= (and b!1038582 condMapEmpty!38550) mapIsEmpty!38550))

(assert (= (and b!1038582 (not condMapEmpty!38550)) mapNonEmpty!38550))

(assert (= (and mapNonEmpty!38550 ((_ is ValueCellFull!11631) mapValue!38550)) b!1038581))

(assert (= (and b!1038582 ((_ is ValueCellFull!11631) mapDefault!38550)) b!1038580))

(assert (= b!1038577 b!1038582))

(assert (= start!90868 b!1038577))

(declare-fun m!958493 () Bool)

(assert (=> start!90868 m!958493))

(declare-fun m!958495 () Bool)

(assert (=> b!1038584 m!958495))

(declare-fun m!958497 () Bool)

(assert (=> b!1038584 m!958497))

(declare-fun m!958499 () Bool)

(assert (=> b!1038584 m!958499))

(declare-fun m!958501 () Bool)

(assert (=> b!1038584 m!958501))

(declare-fun m!958503 () Bool)

(assert (=> b!1038584 m!958503))

(declare-fun m!958505 () Bool)

(assert (=> b!1038584 m!958505))

(declare-fun m!958507 () Bool)

(assert (=> b!1038584 m!958507))

(declare-fun m!958509 () Bool)

(assert (=> b!1038577 m!958509))

(declare-fun m!958511 () Bool)

(assert (=> b!1038577 m!958511))

(declare-fun m!958513 () Bool)

(assert (=> b!1038579 m!958513))

(declare-fun m!958515 () Bool)

(assert (=> mapNonEmpty!38550 m!958515))

(check-sat (not b_next!20949) (not mapNonEmpty!38550) tp_is_empty!24669 (not b!1038577) (not b!1038584) (not b!1038579) (not start!90868) b_and!33481)
(check-sat b_and!33481 (not b_next!20949))
(get-model)

(declare-fun b!1038621 () Bool)

(declare-fun e!587714 () SeekEntryResult!9773)

(declare-fun lt!457814 () SeekEntryResult!9773)

(assert (=> b!1038621 (= e!587714 (Found!9773 (index!41465 lt!457814)))))

(declare-fun d!125355 () Bool)

(declare-fun lt!457816 () SeekEntryResult!9773)

(assert (=> d!125355 (and (or ((_ is MissingVacant!9773) lt!457816) (not ((_ is Found!9773) lt!457816)) (and (bvsge (index!41464 lt!457816) #b00000000000000000000000000000000) (bvslt (index!41464 lt!457816) (size!32033 (_keys!11512 thiss!1427))))) (not ((_ is MissingVacant!9773) lt!457816)) (or (not ((_ is Found!9773) lt!457816)) (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457816)) key!909)))))

(declare-fun e!587715 () SeekEntryResult!9773)

(assert (=> d!125355 (= lt!457816 e!587715)))

(declare-fun c!105226 () Bool)

(assert (=> d!125355 (= c!105226 (and ((_ is Intermediate!9773) lt!457814) (undefined!10585 lt!457814)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65454 (_ BitVec 32)) SeekEntryResult!9773)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125355 (= lt!457814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30252 thiss!1427)) key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(assert (=> d!125355 (validMask!0 (mask!30252 thiss!1427))))

(assert (=> d!125355 (= (seekEntry!0 key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)) lt!457816)))

(declare-fun b!1038622 () Bool)

(assert (=> b!1038622 (= e!587715 Undefined!9773)))

(declare-fun b!1038623 () Bool)

(declare-fun e!587716 () SeekEntryResult!9773)

(assert (=> b!1038623 (= e!587716 (MissingZero!9773 (index!41465 lt!457814)))))

(declare-fun b!1038624 () Bool)

(declare-fun c!105225 () Bool)

(declare-fun lt!457815 () (_ BitVec 64))

(assert (=> b!1038624 (= c!105225 (= lt!457815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038624 (= e!587714 e!587716)))

(declare-fun b!1038625 () Bool)

(declare-fun lt!457817 () SeekEntryResult!9773)

(assert (=> b!1038625 (= e!587716 (ite ((_ is MissingVacant!9773) lt!457817) (MissingZero!9773 (index!41466 lt!457817)) lt!457817))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65454 (_ BitVec 32)) SeekEntryResult!9773)

(assert (=> b!1038625 (= lt!457817 (seekKeyOrZeroReturnVacant!0 (x!92676 lt!457814) (index!41465 lt!457814) (index!41465 lt!457814) key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(declare-fun b!1038626 () Bool)

(assert (=> b!1038626 (= e!587715 e!587714)))

(assert (=> b!1038626 (= lt!457815 (select (arr!31503 (_keys!11512 thiss!1427)) (index!41465 lt!457814)))))

(declare-fun c!105227 () Bool)

(assert (=> b!1038626 (= c!105227 (= lt!457815 key!909))))

(assert (= (and d!125355 c!105226) b!1038622))

(assert (= (and d!125355 (not c!105226)) b!1038626))

(assert (= (and b!1038626 c!105227) b!1038621))

(assert (= (and b!1038626 (not c!105227)) b!1038624))

(assert (= (and b!1038624 c!105225) b!1038623))

(assert (= (and b!1038624 (not c!105225)) b!1038625))

(declare-fun m!958541 () Bool)

(assert (=> d!125355 m!958541))

(declare-fun m!958543 () Bool)

(assert (=> d!125355 m!958543))

(assert (=> d!125355 m!958543))

(declare-fun m!958545 () Bool)

(assert (=> d!125355 m!958545))

(assert (=> d!125355 m!958503))

(declare-fun m!958547 () Bool)

(assert (=> b!1038625 m!958547))

(declare-fun m!958549 () Bool)

(assert (=> b!1038626 m!958549))

(assert (=> b!1038579 d!125355))

(declare-fun d!125357 () Bool)

(declare-fun res!692812 () Bool)

(declare-fun e!587719 () Bool)

(assert (=> d!125357 (=> (not res!692812) (not e!587719))))

(declare-fun simpleValid!423 (LongMapFixedSize!5856) Bool)

(assert (=> d!125357 (= res!692812 (simpleValid!423 thiss!1427))))

(assert (=> d!125357 (= (valid!2203 thiss!1427) e!587719)))

(declare-fun b!1038633 () Bool)

(declare-fun res!692813 () Bool)

(assert (=> b!1038633 (=> (not res!692813) (not e!587719))))

(assert (=> b!1038633 (= res!692813 (= (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (_size!2983 thiss!1427)))))

(declare-fun b!1038634 () Bool)

(declare-fun res!692814 () Bool)

(assert (=> b!1038634 (=> (not res!692814) (not e!587719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65454 (_ BitVec 32)) Bool)

(assert (=> b!1038634 (= res!692814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(declare-fun b!1038635 () Bool)

(assert (=> b!1038635 (= e!587719 (arrayNoDuplicates!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 Nil!21935))))

(assert (= (and d!125357 res!692812) b!1038633))

(assert (= (and b!1038633 res!692813) b!1038634))

(assert (= (and b!1038634 res!692814) b!1038635))

(declare-fun m!958551 () Bool)

(assert (=> d!125357 m!958551))

(assert (=> b!1038633 m!958497))

(declare-fun m!958553 () Bool)

(assert (=> b!1038634 m!958553))

(declare-fun m!958555 () Bool)

(assert (=> b!1038635 m!958555))

(assert (=> start!90868 d!125357))

(declare-fun d!125359 () Bool)

(assert (=> d!125359 (= (array_inv!24359 (_keys!11512 thiss!1427)) (bvsge (size!32033 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038577 d!125359))

(declare-fun d!125361 () Bool)

(assert (=> d!125361 (= (array_inv!24360 (_values!6333 thiss!1427)) (bvsge (size!32034 (_values!6333 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038577 d!125361))

(declare-fun b!1038644 () Bool)

(declare-fun res!692826 () Bool)

(declare-fun e!587724 () Bool)

(assert (=> b!1038644 (=> (not res!692826) (not e!587724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038644 (= res!692826 (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790))))))

(declare-fun b!1038645 () Bool)

(declare-fun res!692824 () Bool)

(assert (=> b!1038645 (=> (not res!692824) (not e!587724))))

(assert (=> b!1038645 (= res!692824 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125363 () Bool)

(declare-fun e!587725 () Bool)

(assert (=> d!125363 e!587725))

(declare-fun res!692825 () Bool)

(assert (=> d!125363 (=> (not res!692825) (not e!587725))))

(assert (=> d!125363 (= res!692825 (and (bvsge (index!41464 lt!457790) #b00000000000000000000000000000000) (bvslt (index!41464 lt!457790) (size!32033 (_keys!11512 thiss!1427)))))))

(declare-fun lt!457820 () Unit!33979)

(declare-fun choose!82 (array!65454 (_ BitVec 32) (_ BitVec 64)) Unit!33979)

(assert (=> d!125363 (= lt!457820 (choose!82 (_keys!11512 thiss!1427) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125363 e!587724))

(declare-fun res!692823 () Bool)

(assert (=> d!125363 (=> (not res!692823) (not e!587724))))

(assert (=> d!125363 (= res!692823 (and (bvsge (index!41464 lt!457790) #b00000000000000000000000000000000) (bvslt (index!41464 lt!457790) (size!32033 (_keys!11512 thiss!1427)))))))

(assert (=> d!125363 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11512 thiss!1427) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457820)))

(declare-fun b!1038646 () Bool)

(assert (=> b!1038646 (= e!587724 (bvslt (size!32033 (_keys!11512 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038647 () Bool)

(assert (=> b!1038647 (= e!587725 (= (arrayCountValidKeys!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125363 res!692823) b!1038644))

(assert (= (and b!1038644 res!692826) b!1038645))

(assert (= (and b!1038645 res!692824) b!1038646))

(assert (= (and d!125363 res!692825) b!1038647))

(declare-fun m!958557 () Bool)

(assert (=> b!1038644 m!958557))

(assert (=> b!1038644 m!958557))

(declare-fun m!958559 () Bool)

(assert (=> b!1038644 m!958559))

(declare-fun m!958561 () Bool)

(assert (=> b!1038645 m!958561))

(declare-fun m!958563 () Bool)

(assert (=> d!125363 m!958563))

(assert (=> b!1038647 m!958495))

(declare-fun m!958565 () Bool)

(assert (=> b!1038647 m!958565))

(assert (=> b!1038647 m!958497))

(assert (=> b!1038584 d!125363))

(declare-fun d!125365 () Bool)

(assert (=> d!125365 (= (validMask!0 (mask!30252 thiss!1427)) (and (or (= (mask!30252 thiss!1427) #b00000000000000000000000000000111) (= (mask!30252 thiss!1427) #b00000000000000000000000000001111) (= (mask!30252 thiss!1427) #b00000000000000000000000000011111) (= (mask!30252 thiss!1427) #b00000000000000000000000000111111) (= (mask!30252 thiss!1427) #b00000000000000000000000001111111) (= (mask!30252 thiss!1427) #b00000000000000000000000011111111) (= (mask!30252 thiss!1427) #b00000000000000000000000111111111) (= (mask!30252 thiss!1427) #b00000000000000000000001111111111) (= (mask!30252 thiss!1427) #b00000000000000000000011111111111) (= (mask!30252 thiss!1427) #b00000000000000000000111111111111) (= (mask!30252 thiss!1427) #b00000000000000000001111111111111) (= (mask!30252 thiss!1427) #b00000000000000000011111111111111) (= (mask!30252 thiss!1427) #b00000000000000000111111111111111) (= (mask!30252 thiss!1427) #b00000000000000001111111111111111) (= (mask!30252 thiss!1427) #b00000000000000011111111111111111) (= (mask!30252 thiss!1427) #b00000000000000111111111111111111) (= (mask!30252 thiss!1427) #b00000000000001111111111111111111) (= (mask!30252 thiss!1427) #b00000000000011111111111111111111) (= (mask!30252 thiss!1427) #b00000000000111111111111111111111) (= (mask!30252 thiss!1427) #b00000000001111111111111111111111) (= (mask!30252 thiss!1427) #b00000000011111111111111111111111) (= (mask!30252 thiss!1427) #b00000000111111111111111111111111) (= (mask!30252 thiss!1427) #b00000001111111111111111111111111) (= (mask!30252 thiss!1427) #b00000011111111111111111111111111) (= (mask!30252 thiss!1427) #b00000111111111111111111111111111) (= (mask!30252 thiss!1427) #b00001111111111111111111111111111) (= (mask!30252 thiss!1427) #b00011111111111111111111111111111) (= (mask!30252 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30252 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038584 d!125365))

(declare-fun b!1038658 () Bool)

(declare-fun e!587736 () Bool)

(declare-fun call!43951 () Bool)

(assert (=> b!1038658 (= e!587736 call!43951)))

(declare-fun b!1038659 () Bool)

(declare-fun e!587737 () Bool)

(declare-fun e!587735 () Bool)

(assert (=> b!1038659 (= e!587737 e!587735)))

(declare-fun res!692833 () Bool)

(assert (=> b!1038659 (=> (not res!692833) (not e!587735))))

(declare-fun e!587734 () Bool)

(assert (=> b!1038659 (= res!692833 (not e!587734))))

(declare-fun res!692834 () Bool)

(assert (=> b!1038659 (=> (not res!692834) (not e!587734))))

(assert (=> b!1038659 (= res!692834 (validKeyInArray!0 (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(declare-fun b!1038660 () Bool)

(assert (=> b!1038660 (= e!587736 call!43951)))

(declare-fun b!1038661 () Bool)

(assert (=> b!1038661 (= e!587735 e!587736)))

(declare-fun c!105230 () Bool)

(assert (=> b!1038661 (= c!105230 (validKeyInArray!0 (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(declare-fun d!125367 () Bool)

(declare-fun res!692835 () Bool)

(assert (=> d!125367 (=> res!692835 e!587737)))

(assert (=> d!125367 (= res!692835 (bvsge #b00000000000000000000000000000000 (size!32033 lt!457791)))))

(assert (=> d!125367 (= (arrayNoDuplicates!0 lt!457791 #b00000000000000000000000000000000 Nil!21935) e!587737)))

(declare-fun b!1038662 () Bool)

(declare-fun contains!6039 (List!21938 (_ BitVec 64)) Bool)

(assert (=> b!1038662 (= e!587734 (contains!6039 Nil!21935 (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(declare-fun bm!43948 () Bool)

(assert (=> bm!43948 (= call!43951 (arrayNoDuplicates!0 lt!457791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105230 (Cons!21934 (select (arr!31503 lt!457791) #b00000000000000000000000000000000) Nil!21935) Nil!21935)))))

(assert (= (and d!125367 (not res!692835)) b!1038659))

(assert (= (and b!1038659 res!692834) b!1038662))

(assert (= (and b!1038659 res!692833) b!1038661))

(assert (= (and b!1038661 c!105230) b!1038660))

(assert (= (and b!1038661 (not c!105230)) b!1038658))

(assert (= (or b!1038660 b!1038658) bm!43948))

(declare-fun m!958567 () Bool)

(assert (=> b!1038659 m!958567))

(assert (=> b!1038659 m!958567))

(declare-fun m!958569 () Bool)

(assert (=> b!1038659 m!958569))

(assert (=> b!1038661 m!958567))

(assert (=> b!1038661 m!958567))

(assert (=> b!1038661 m!958569))

(assert (=> b!1038662 m!958567))

(assert (=> b!1038662 m!958567))

(declare-fun m!958571 () Bool)

(assert (=> b!1038662 m!958571))

(assert (=> bm!43948 m!958567))

(declare-fun m!958573 () Bool)

(assert (=> bm!43948 m!958573))

(assert (=> b!1038584 d!125367))

(declare-fun d!125369 () Bool)

(declare-fun e!587740 () Bool)

(assert (=> d!125369 e!587740))

(declare-fun res!692838 () Bool)

(assert (=> d!125369 (=> (not res!692838) (not e!587740))))

(assert (=> d!125369 (= res!692838 (and (bvsge (index!41464 lt!457790) #b00000000000000000000000000000000) (bvslt (index!41464 lt!457790) (size!32033 (_keys!11512 thiss!1427)))))))

(declare-fun lt!457823 () Unit!33979)

(declare-fun choose!53 (array!65454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21938) Unit!33979)

(assert (=> d!125369 (= lt!457823 (choose!53 (_keys!11512 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!457790) #b00000000000000000000000000000000 Nil!21935))))

(assert (=> d!125369 (bvslt (size!32033 (_keys!11512 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125369 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11512 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!457790) #b00000000000000000000000000000000 Nil!21935) lt!457823)))

(declare-fun b!1038665 () Bool)

(assert (=> b!1038665 (= e!587740 (arrayNoDuplicates!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 Nil!21935))))

(assert (= (and d!125369 res!692838) b!1038665))

(declare-fun m!958575 () Bool)

(assert (=> d!125369 m!958575))

(assert (=> b!1038665 m!958495))

(declare-fun m!958577 () Bool)

(assert (=> b!1038665 m!958577))

(assert (=> b!1038584 d!125369))

(declare-fun b!1038674 () Bool)

(declare-fun e!587746 () (_ BitVec 32))

(assert (=> b!1038674 (= e!587746 #b00000000000000000000000000000000)))

(declare-fun b!1038675 () Bool)

(declare-fun e!587745 () (_ BitVec 32))

(declare-fun call!43954 () (_ BitVec 32))

(assert (=> b!1038675 (= e!587745 (bvadd #b00000000000000000000000000000001 call!43954))))

(declare-fun b!1038676 () Bool)

(assert (=> b!1038676 (= e!587746 e!587745)))

(declare-fun c!105236 () Bool)

(assert (=> b!1038676 (= c!105236 (validKeyInArray!0 (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(declare-fun d!125371 () Bool)

(declare-fun lt!457826 () (_ BitVec 32))

(assert (=> d!125371 (and (bvsge lt!457826 #b00000000000000000000000000000000) (bvsle lt!457826 (bvsub (size!32033 lt!457791) #b00000000000000000000000000000000)))))

(assert (=> d!125371 (= lt!457826 e!587746)))

(declare-fun c!105235 () Bool)

(assert (=> d!125371 (= c!105235 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125371 (and (bvsle #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11512 thiss!1427)) (size!32033 lt!457791)))))

(assert (=> d!125371 (= (arrayCountValidKeys!0 lt!457791 #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) lt!457826)))

(declare-fun b!1038677 () Bool)

(assert (=> b!1038677 (= e!587745 call!43954)))

(declare-fun bm!43951 () Bool)

(assert (=> bm!43951 (= call!43954 (arrayCountValidKeys!0 lt!457791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (= (and d!125371 c!105235) b!1038674))

(assert (= (and d!125371 (not c!105235)) b!1038676))

(assert (= (and b!1038676 c!105236) b!1038675))

(assert (= (and b!1038676 (not c!105236)) b!1038677))

(assert (= (or b!1038675 b!1038677) bm!43951))

(assert (=> b!1038676 m!958567))

(assert (=> b!1038676 m!958567))

(assert (=> b!1038676 m!958569))

(declare-fun m!958579 () Bool)

(assert (=> bm!43951 m!958579))

(assert (=> b!1038584 d!125371))

(declare-fun b!1038678 () Bool)

(declare-fun e!587748 () (_ BitVec 32))

(assert (=> b!1038678 (= e!587748 #b00000000000000000000000000000000)))

(declare-fun b!1038679 () Bool)

(declare-fun e!587747 () (_ BitVec 32))

(declare-fun call!43955 () (_ BitVec 32))

(assert (=> b!1038679 (= e!587747 (bvadd #b00000000000000000000000000000001 call!43955))))

(declare-fun b!1038680 () Bool)

(assert (=> b!1038680 (= e!587748 e!587747)))

(declare-fun c!105238 () Bool)

(assert (=> b!1038680 (= c!105238 (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125373 () Bool)

(declare-fun lt!457827 () (_ BitVec 32))

(assert (=> d!125373 (and (bvsge lt!457827 #b00000000000000000000000000000000) (bvsle lt!457827 (bvsub (size!32033 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125373 (= lt!457827 e!587748)))

(declare-fun c!105237 () Bool)

(assert (=> d!125373 (= c!105237 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125373 (and (bvsle #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11512 thiss!1427)) (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125373 (= (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) lt!457827)))

(declare-fun b!1038681 () Bool)

(assert (=> b!1038681 (= e!587747 call!43955)))

(declare-fun bm!43952 () Bool)

(assert (=> bm!43952 (= call!43955 (arrayCountValidKeys!0 (_keys!11512 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (= (and d!125373 c!105237) b!1038678))

(assert (= (and d!125373 (not c!105237)) b!1038680))

(assert (= (and b!1038680 c!105238) b!1038679))

(assert (= (and b!1038680 (not c!105238)) b!1038681))

(assert (= (or b!1038679 b!1038681) bm!43952))

(declare-fun m!958581 () Bool)

(assert (=> b!1038680 m!958581))

(assert (=> b!1038680 m!958581))

(declare-fun m!958583 () Bool)

(assert (=> b!1038680 m!958583))

(declare-fun m!958585 () Bool)

(assert (=> bm!43952 m!958585))

(assert (=> b!1038584 d!125373))

(declare-fun condMapEmpty!38556 () Bool)

(declare-fun mapDefault!38556 () ValueCell!11631)

(assert (=> mapNonEmpty!38550 (= condMapEmpty!38556 (= mapRest!38550 ((as const (Array (_ BitVec 32) ValueCell!11631)) mapDefault!38556)))))

(declare-fun e!587753 () Bool)

(declare-fun mapRes!38556 () Bool)

(assert (=> mapNonEmpty!38550 (= tp!74011 (and e!587753 mapRes!38556))))

(declare-fun b!1038688 () Bool)

(declare-fun e!587754 () Bool)

(assert (=> b!1038688 (= e!587754 tp_is_empty!24669)))

(declare-fun mapNonEmpty!38556 () Bool)

(declare-fun tp!74020 () Bool)

(assert (=> mapNonEmpty!38556 (= mapRes!38556 (and tp!74020 e!587754))))

(declare-fun mapRest!38556 () (Array (_ BitVec 32) ValueCell!11631))

(declare-fun mapValue!38556 () ValueCell!11631)

(declare-fun mapKey!38556 () (_ BitVec 32))

(assert (=> mapNonEmpty!38556 (= mapRest!38550 (store mapRest!38556 mapKey!38556 mapValue!38556))))

(declare-fun mapIsEmpty!38556 () Bool)

(assert (=> mapIsEmpty!38556 mapRes!38556))

(declare-fun b!1038689 () Bool)

(assert (=> b!1038689 (= e!587753 tp_is_empty!24669)))

(assert (= (and mapNonEmpty!38550 condMapEmpty!38556) mapIsEmpty!38556))

(assert (= (and mapNonEmpty!38550 (not condMapEmpty!38556)) mapNonEmpty!38556))

(assert (= (and mapNonEmpty!38556 ((_ is ValueCellFull!11631) mapValue!38556)) b!1038688))

(assert (= (and mapNonEmpty!38550 ((_ is ValueCellFull!11631) mapDefault!38556)) b!1038689))

(declare-fun m!958587 () Bool)

(assert (=> mapNonEmpty!38556 m!958587))

(check-sat (not b!1038661) (not b_next!20949) (not b!1038645) (not b!1038644) (not d!125355) (not b!1038659) (not b!1038662) (not bm!43952) (not b!1038680) (not b!1038676) (not bm!43948) (not mapNonEmpty!38556) (not d!125357) (not b!1038633) tp_is_empty!24669 (not d!125363) (not b!1038647) (not b!1038635) (not bm!43951) (not d!125369) (not b!1038665) (not b!1038634) (not b!1038625) b_and!33481)
(check-sat b_and!33481 (not b_next!20949))
(get-model)

(declare-fun b!1038690 () Bool)

(declare-fun e!587757 () Bool)

(declare-fun call!43956 () Bool)

(assert (=> b!1038690 (= e!587757 call!43956)))

(declare-fun b!1038691 () Bool)

(declare-fun e!587758 () Bool)

(declare-fun e!587756 () Bool)

(assert (=> b!1038691 (= e!587758 e!587756)))

(declare-fun res!692839 () Bool)

(assert (=> b!1038691 (=> (not res!692839) (not e!587756))))

(declare-fun e!587755 () Bool)

(assert (=> b!1038691 (= res!692839 (not e!587755))))

(declare-fun res!692840 () Bool)

(assert (=> b!1038691 (=> (not res!692840) (not e!587755))))

(assert (=> b!1038691 (= res!692840 (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038692 () Bool)

(assert (=> b!1038692 (= e!587757 call!43956)))

(declare-fun b!1038693 () Bool)

(assert (=> b!1038693 (= e!587756 e!587757)))

(declare-fun c!105239 () Bool)

(assert (=> b!1038693 (= c!105239 (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125375 () Bool)

(declare-fun res!692841 () Bool)

(assert (=> d!125375 (=> res!692841 e!587758)))

(assert (=> d!125375 (= res!692841 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125375 (= (arrayNoDuplicates!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 Nil!21935) e!587758)))

(declare-fun b!1038694 () Bool)

(assert (=> b!1038694 (= e!587755 (contains!6039 Nil!21935 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43953 () Bool)

(assert (=> bm!43953 (= call!43956 (arrayNoDuplicates!0 (_keys!11512 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105239 (Cons!21934 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000) Nil!21935) Nil!21935)))))

(assert (= (and d!125375 (not res!692841)) b!1038691))

(assert (= (and b!1038691 res!692840) b!1038694))

(assert (= (and b!1038691 res!692839) b!1038693))

(assert (= (and b!1038693 c!105239) b!1038692))

(assert (= (and b!1038693 (not c!105239)) b!1038690))

(assert (= (or b!1038692 b!1038690) bm!43953))

(assert (=> b!1038691 m!958581))

(assert (=> b!1038691 m!958581))

(assert (=> b!1038691 m!958583))

(assert (=> b!1038693 m!958581))

(assert (=> b!1038693 m!958581))

(assert (=> b!1038693 m!958583))

(assert (=> b!1038694 m!958581))

(assert (=> b!1038694 m!958581))

(declare-fun m!958589 () Bool)

(assert (=> b!1038694 m!958589))

(assert (=> bm!43953 m!958581))

(declare-fun m!958591 () Bool)

(assert (=> bm!43953 m!958591))

(assert (=> b!1038635 d!125375))

(declare-fun d!125377 () Bool)

(assert (=> d!125377 (= (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790))) (and (not (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038644 d!125377))

(declare-fun b!1038703 () Bool)

(declare-fun e!587767 () Bool)

(declare-fun e!587765 () Bool)

(assert (=> b!1038703 (= e!587767 e!587765)))

(declare-fun lt!457835 () (_ BitVec 64))

(assert (=> b!1038703 (= lt!457835 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457834 () Unit!33979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65454 (_ BitVec 64) (_ BitVec 32)) Unit!33979)

(assert (=> b!1038703 (= lt!457834 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11512 thiss!1427) lt!457835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1038703 (arrayContainsKey!0 (_keys!11512 thiss!1427) lt!457835 #b00000000000000000000000000000000)))

(declare-fun lt!457836 () Unit!33979)

(assert (=> b!1038703 (= lt!457836 lt!457834)))

(declare-fun res!692846 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65454 (_ BitVec 32)) SeekEntryResult!9773)

(assert (=> b!1038703 (= res!692846 (= (seekEntryOrOpen!0 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000) (_keys!11512 thiss!1427) (mask!30252 thiss!1427)) (Found!9773 #b00000000000000000000000000000000)))))

(assert (=> b!1038703 (=> (not res!692846) (not e!587765))))

(declare-fun b!1038704 () Bool)

(declare-fun e!587766 () Bool)

(assert (=> b!1038704 (= e!587766 e!587767)))

(declare-fun c!105242 () Bool)

(assert (=> b!1038704 (= c!105242 (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43956 () Bool)

(declare-fun call!43959 () Bool)

(assert (=> bm!43956 (= call!43959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(declare-fun d!125379 () Bool)

(declare-fun res!692847 () Bool)

(assert (=> d!125379 (=> res!692847 e!587766)))

(assert (=> d!125379 (= res!692847 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)) e!587766)))

(declare-fun b!1038705 () Bool)

(assert (=> b!1038705 (= e!587765 call!43959)))

(declare-fun b!1038706 () Bool)

(assert (=> b!1038706 (= e!587767 call!43959)))

(assert (= (and d!125379 (not res!692847)) b!1038704))

(assert (= (and b!1038704 c!105242) b!1038703))

(assert (= (and b!1038704 (not c!105242)) b!1038706))

(assert (= (and b!1038703 res!692846) b!1038705))

(assert (= (or b!1038705 b!1038706) bm!43956))

(assert (=> b!1038703 m!958581))

(declare-fun m!958593 () Bool)

(assert (=> b!1038703 m!958593))

(declare-fun m!958595 () Bool)

(assert (=> b!1038703 m!958595))

(assert (=> b!1038703 m!958581))

(declare-fun m!958597 () Bool)

(assert (=> b!1038703 m!958597))

(assert (=> b!1038704 m!958581))

(assert (=> b!1038704 m!958581))

(assert (=> b!1038704 m!958583))

(declare-fun m!958599 () Bool)

(assert (=> bm!43956 m!958599))

(assert (=> b!1038634 d!125379))

(assert (=> b!1038633 d!125373))

(declare-fun b!1038716 () Bool)

(declare-fun res!692859 () Bool)

(declare-fun e!587770 () Bool)

(assert (=> b!1038716 (=> (not res!692859) (not e!587770))))

(declare-fun size!32037 (LongMapFixedSize!5856) (_ BitVec 32))

(assert (=> b!1038716 (= res!692859 (bvsge (size!32037 thiss!1427) (_size!2983 thiss!1427)))))

(declare-fun b!1038715 () Bool)

(declare-fun res!692856 () Bool)

(assert (=> b!1038715 (=> (not res!692856) (not e!587770))))

(assert (=> b!1038715 (= res!692856 (and (= (size!32034 (_values!6333 thiss!1427)) (bvadd (mask!30252 thiss!1427) #b00000000000000000000000000000001)) (= (size!32033 (_keys!11512 thiss!1427)) (size!32034 (_values!6333 thiss!1427))) (bvsge (_size!2983 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2983 thiss!1427) (bvadd (mask!30252 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!125381 () Bool)

(declare-fun res!692857 () Bool)

(assert (=> d!125381 (=> (not res!692857) (not e!587770))))

(assert (=> d!125381 (= res!692857 (validMask!0 (mask!30252 thiss!1427)))))

(assert (=> d!125381 (= (simpleValid!423 thiss!1427) e!587770)))

(declare-fun b!1038717 () Bool)

(declare-fun res!692858 () Bool)

(assert (=> b!1038717 (=> (not res!692858) (not e!587770))))

(assert (=> b!1038717 (= res!692858 (= (size!32037 thiss!1427) (bvadd (_size!2983 thiss!1427) (bvsdiv (bvadd (extraKeys!6038 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1038718 () Bool)

(assert (=> b!1038718 (= e!587770 (and (bvsge (extraKeys!6038 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6038 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2983 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!125381 res!692857) b!1038715))

(assert (= (and b!1038715 res!692856) b!1038716))

(assert (= (and b!1038716 res!692859) b!1038717))

(assert (= (and b!1038717 res!692858) b!1038718))

(declare-fun m!958601 () Bool)

(assert (=> b!1038716 m!958601))

(assert (=> d!125381 m!958503))

(assert (=> b!1038717 m!958601))

(assert (=> d!125357 d!125381))

(declare-fun b!1038719 () Bool)

(declare-fun e!587772 () (_ BitVec 32))

(assert (=> b!1038719 (= e!587772 #b00000000000000000000000000000000)))

(declare-fun b!1038720 () Bool)

(declare-fun e!587771 () (_ BitVec 32))

(declare-fun call!43960 () (_ BitVec 32))

(assert (=> b!1038720 (= e!587771 (bvadd #b00000000000000000000000000000001 call!43960))))

(declare-fun b!1038721 () Bool)

(assert (=> b!1038721 (= e!587772 e!587771)))

(declare-fun c!105244 () Bool)

(assert (=> b!1038721 (= c!105244 (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125383 () Bool)

(declare-fun lt!457837 () (_ BitVec 32))

(assert (=> d!125383 (and (bvsge lt!457837 #b00000000000000000000000000000000) (bvsle lt!457837 (bvsub (size!32033 (_keys!11512 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125383 (= lt!457837 e!587772)))

(declare-fun c!105243 () Bool)

(assert (=> d!125383 (= c!105243 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125383 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11512 thiss!1427)) (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125383 (= (arrayCountValidKeys!0 (_keys!11512 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))) lt!457837)))

(declare-fun b!1038722 () Bool)

(assert (=> b!1038722 (= e!587771 call!43960)))

(declare-fun bm!43957 () Bool)

(assert (=> bm!43957 (= call!43960 (arrayCountValidKeys!0 (_keys!11512 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (= (and d!125383 c!105243) b!1038719))

(assert (= (and d!125383 (not c!105243)) b!1038721))

(assert (= (and b!1038721 c!105244) b!1038720))

(assert (= (and b!1038721 (not c!105244)) b!1038722))

(assert (= (or b!1038720 b!1038722) bm!43957))

(declare-fun m!958603 () Bool)

(assert (=> b!1038721 m!958603))

(assert (=> b!1038721 m!958603))

(declare-fun m!958605 () Bool)

(assert (=> b!1038721 m!958605))

(declare-fun m!958607 () Bool)

(assert (=> bm!43957 m!958607))

(assert (=> bm!43952 d!125383))

(declare-fun d!125385 () Bool)

(assert (=> d!125385 (= (arrayCountValidKeys!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11512 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125385 true))

(declare-fun _$79!20 () Unit!33979)

(assert (=> d!125385 (= (choose!82 (_keys!11512 thiss!1427) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!20)))

(declare-fun bs!30406 () Bool)

(assert (= bs!30406 d!125385))

(assert (=> bs!30406 m!958495))

(assert (=> bs!30406 m!958565))

(assert (=> bs!30406 m!958497))

(assert (=> d!125363 d!125385))

(declare-fun b!1038741 () Bool)

(declare-fun e!587787 () Bool)

(declare-fun e!587784 () Bool)

(assert (=> b!1038741 (= e!587787 e!587784)))

(declare-fun res!692866 () Bool)

(declare-fun lt!457843 () SeekEntryResult!9773)

(assert (=> b!1038741 (= res!692866 (and ((_ is Intermediate!9773) lt!457843) (not (undefined!10585 lt!457843)) (bvslt (x!92676 lt!457843) #b01111111111111111111111111111110) (bvsge (x!92676 lt!457843) #b00000000000000000000000000000000) (bvsge (x!92676 lt!457843) #b00000000000000000000000000000000)))))

(assert (=> b!1038741 (=> (not res!692866) (not e!587784))))

(declare-fun b!1038742 () Bool)

(assert (=> b!1038742 (= e!587787 (bvsge (x!92676 lt!457843) #b01111111111111111111111111111110))))

(declare-fun b!1038743 () Bool)

(assert (=> b!1038743 (and (bvsge (index!41465 lt!457843) #b00000000000000000000000000000000) (bvslt (index!41465 lt!457843) (size!32033 (_keys!11512 thiss!1427))))))

(declare-fun e!587785 () Bool)

(assert (=> b!1038743 (= e!587785 (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41465 lt!457843)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038745 () Bool)

(declare-fun e!587783 () SeekEntryResult!9773)

(declare-fun e!587786 () SeekEntryResult!9773)

(assert (=> b!1038745 (= e!587783 e!587786)))

(declare-fun c!105251 () Bool)

(declare-fun lt!457842 () (_ BitVec 64))

(assert (=> b!1038745 (= c!105251 (or (= lt!457842 key!909) (= (bvadd lt!457842 lt!457842) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038746 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038746 (= e!587786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30252 thiss!1427)) #b00000000000000000000000000000000 (mask!30252 thiss!1427)) key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(declare-fun b!1038747 () Bool)

(assert (=> b!1038747 (= e!587786 (Intermediate!9773 false (toIndex!0 key!909 (mask!30252 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1038748 () Bool)

(assert (=> b!1038748 (and (bvsge (index!41465 lt!457843) #b00000000000000000000000000000000) (bvslt (index!41465 lt!457843) (size!32033 (_keys!11512 thiss!1427))))))

(declare-fun res!692868 () Bool)

(assert (=> b!1038748 (= res!692868 (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41465 lt!457843)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038748 (=> res!692868 e!587785)))

(declare-fun b!1038749 () Bool)

(assert (=> b!1038749 (and (bvsge (index!41465 lt!457843) #b00000000000000000000000000000000) (bvslt (index!41465 lt!457843) (size!32033 (_keys!11512 thiss!1427))))))

(declare-fun res!692867 () Bool)

(assert (=> b!1038749 (= res!692867 (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41465 lt!457843)) key!909))))

(assert (=> b!1038749 (=> res!692867 e!587785)))

(assert (=> b!1038749 (= e!587784 e!587785)))

(declare-fun d!125387 () Bool)

(assert (=> d!125387 e!587787))

(declare-fun c!105253 () Bool)

(assert (=> d!125387 (= c!105253 (and ((_ is Intermediate!9773) lt!457843) (undefined!10585 lt!457843)))))

(assert (=> d!125387 (= lt!457843 e!587783)))

(declare-fun c!105252 () Bool)

(assert (=> d!125387 (= c!105252 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125387 (= lt!457842 (select (arr!31503 (_keys!11512 thiss!1427)) (toIndex!0 key!909 (mask!30252 thiss!1427))))))

(assert (=> d!125387 (validMask!0 (mask!30252 thiss!1427))))

(assert (=> d!125387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30252 thiss!1427)) key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)) lt!457843)))

(declare-fun b!1038744 () Bool)

(assert (=> b!1038744 (= e!587783 (Intermediate!9773 true (toIndex!0 key!909 (mask!30252 thiss!1427)) #b00000000000000000000000000000000))))

(assert (= (and d!125387 c!105252) b!1038744))

(assert (= (and d!125387 (not c!105252)) b!1038745))

(assert (= (and b!1038745 c!105251) b!1038747))

(assert (= (and b!1038745 (not c!105251)) b!1038746))

(assert (= (and d!125387 c!105253) b!1038742))

(assert (= (and d!125387 (not c!105253)) b!1038741))

(assert (= (and b!1038741 res!692866) b!1038749))

(assert (= (and b!1038749 (not res!692867)) b!1038748))

(assert (= (and b!1038748 (not res!692868)) b!1038743))

(declare-fun m!958609 () Bool)

(assert (=> b!1038749 m!958609))

(assert (=> d!125387 m!958543))

(declare-fun m!958611 () Bool)

(assert (=> d!125387 m!958611))

(assert (=> d!125387 m!958503))

(assert (=> b!1038746 m!958543))

(declare-fun m!958613 () Bool)

(assert (=> b!1038746 m!958613))

(assert (=> b!1038746 m!958613))

(declare-fun m!958615 () Bool)

(assert (=> b!1038746 m!958615))

(assert (=> b!1038743 m!958609))

(assert (=> b!1038748 m!958609))

(assert (=> d!125355 d!125387))

(declare-fun d!125389 () Bool)

(declare-fun lt!457849 () (_ BitVec 32))

(declare-fun lt!457848 () (_ BitVec 32))

(assert (=> d!125389 (= lt!457849 (bvmul (bvxor lt!457848 (bvlshr lt!457848 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125389 (= lt!457848 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125389 (and (bvsge (mask!30252 thiss!1427) #b00000000000000000000000000000000) (let ((res!692869 (let ((h!23139 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92693 (bvmul (bvxor h!23139 (bvlshr h!23139 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92693 (bvlshr x!92693 #b00000000000000000000000000001101)) (mask!30252 thiss!1427)))))) (and (bvslt res!692869 (bvadd (mask!30252 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!692869 #b00000000000000000000000000000000))))))

(assert (=> d!125389 (= (toIndex!0 key!909 (mask!30252 thiss!1427)) (bvand (bvxor lt!457849 (bvlshr lt!457849 #b00000000000000000000000000001101)) (mask!30252 thiss!1427)))))

(assert (=> d!125355 d!125389))

(assert (=> d!125355 d!125365))

(declare-fun d!125391 () Bool)

(assert (=> d!125391 (= (validKeyInArray!0 (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31503 (_keys!11512 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038680 d!125391))

(declare-fun b!1038750 () Bool)

(declare-fun e!587790 () Bool)

(declare-fun call!43961 () Bool)

(assert (=> b!1038750 (= e!587790 call!43961)))

(declare-fun b!1038751 () Bool)

(declare-fun e!587791 () Bool)

(declare-fun e!587789 () Bool)

(assert (=> b!1038751 (= e!587791 e!587789)))

(declare-fun res!692870 () Bool)

(assert (=> b!1038751 (=> (not res!692870) (not e!587789))))

(declare-fun e!587788 () Bool)

(assert (=> b!1038751 (= res!692870 (not e!587788))))

(declare-fun res!692871 () Bool)

(assert (=> b!1038751 (=> (not res!692871) (not e!587788))))

(assert (=> b!1038751 (= res!692871 (validKeyInArray!0 (select (arr!31503 lt!457791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1038752 () Bool)

(assert (=> b!1038752 (= e!587790 call!43961)))

(declare-fun b!1038753 () Bool)

(assert (=> b!1038753 (= e!587789 e!587790)))

(declare-fun c!105254 () Bool)

(assert (=> b!1038753 (= c!105254 (validKeyInArray!0 (select (arr!31503 lt!457791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125393 () Bool)

(declare-fun res!692872 () Bool)

(assert (=> d!125393 (=> res!692872 e!587791)))

(assert (=> d!125393 (= res!692872 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 lt!457791)))))

(assert (=> d!125393 (= (arrayNoDuplicates!0 lt!457791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105230 (Cons!21934 (select (arr!31503 lt!457791) #b00000000000000000000000000000000) Nil!21935) Nil!21935)) e!587791)))

(declare-fun b!1038754 () Bool)

(assert (=> b!1038754 (= e!587788 (contains!6039 (ite c!105230 (Cons!21934 (select (arr!31503 lt!457791) #b00000000000000000000000000000000) Nil!21935) Nil!21935) (select (arr!31503 lt!457791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43958 () Bool)

(assert (=> bm!43958 (= call!43961 (arrayNoDuplicates!0 lt!457791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105254 (Cons!21934 (select (arr!31503 lt!457791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105230 (Cons!21934 (select (arr!31503 lt!457791) #b00000000000000000000000000000000) Nil!21935) Nil!21935)) (ite c!105230 (Cons!21934 (select (arr!31503 lt!457791) #b00000000000000000000000000000000) Nil!21935) Nil!21935))))))

(assert (= (and d!125393 (not res!692872)) b!1038751))

(assert (= (and b!1038751 res!692871) b!1038754))

(assert (= (and b!1038751 res!692870) b!1038753))

(assert (= (and b!1038753 c!105254) b!1038752))

(assert (= (and b!1038753 (not c!105254)) b!1038750))

(assert (= (or b!1038752 b!1038750) bm!43958))

(declare-fun m!958617 () Bool)

(assert (=> b!1038751 m!958617))

(assert (=> b!1038751 m!958617))

(declare-fun m!958619 () Bool)

(assert (=> b!1038751 m!958619))

(assert (=> b!1038753 m!958617))

(assert (=> b!1038753 m!958617))

(assert (=> b!1038753 m!958619))

(assert (=> b!1038754 m!958617))

(assert (=> b!1038754 m!958617))

(declare-fun m!958621 () Bool)

(assert (=> b!1038754 m!958621))

(assert (=> bm!43958 m!958617))

(declare-fun m!958623 () Bool)

(assert (=> bm!43958 m!958623))

(assert (=> bm!43948 d!125393))

(declare-fun b!1038767 () Bool)

(declare-fun c!105263 () Bool)

(declare-fun lt!457855 () (_ BitVec 64))

(assert (=> b!1038767 (= c!105263 (= lt!457855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587799 () SeekEntryResult!9773)

(declare-fun e!587798 () SeekEntryResult!9773)

(assert (=> b!1038767 (= e!587799 e!587798)))

(declare-fun b!1038768 () Bool)

(assert (=> b!1038768 (= e!587798 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92676 lt!457814) #b00000000000000000000000000000001) (nextIndex!0 (index!41465 lt!457814) (x!92676 lt!457814) (mask!30252 thiss!1427)) (index!41465 lt!457814) key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)))))

(declare-fun lt!457854 () SeekEntryResult!9773)

(declare-fun d!125395 () Bool)

(assert (=> d!125395 (and (or ((_ is Undefined!9773) lt!457854) (not ((_ is Found!9773) lt!457854)) (and (bvsge (index!41464 lt!457854) #b00000000000000000000000000000000) (bvslt (index!41464 lt!457854) (size!32033 (_keys!11512 thiss!1427))))) (or ((_ is Undefined!9773) lt!457854) ((_ is Found!9773) lt!457854) (not ((_ is MissingVacant!9773) lt!457854)) (not (= (index!41466 lt!457854) (index!41465 lt!457814))) (and (bvsge (index!41466 lt!457854) #b00000000000000000000000000000000) (bvslt (index!41466 lt!457854) (size!32033 (_keys!11512 thiss!1427))))) (or ((_ is Undefined!9773) lt!457854) (ite ((_ is Found!9773) lt!457854) (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457854)) key!909) (and ((_ is MissingVacant!9773) lt!457854) (= (index!41466 lt!457854) (index!41465 lt!457814)) (= (select (arr!31503 (_keys!11512 thiss!1427)) (index!41466 lt!457854)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!587800 () SeekEntryResult!9773)

(assert (=> d!125395 (= lt!457854 e!587800)))

(declare-fun c!105262 () Bool)

(assert (=> d!125395 (= c!105262 (bvsge (x!92676 lt!457814) #b01111111111111111111111111111110))))

(assert (=> d!125395 (= lt!457855 (select (arr!31503 (_keys!11512 thiss!1427)) (index!41465 lt!457814)))))

(assert (=> d!125395 (validMask!0 (mask!30252 thiss!1427))))

(assert (=> d!125395 (= (seekKeyOrZeroReturnVacant!0 (x!92676 lt!457814) (index!41465 lt!457814) (index!41465 lt!457814) key!909 (_keys!11512 thiss!1427) (mask!30252 thiss!1427)) lt!457854)))

(declare-fun b!1038769 () Bool)

(assert (=> b!1038769 (= e!587799 (Found!9773 (index!41465 lt!457814)))))

(declare-fun b!1038770 () Bool)

(assert (=> b!1038770 (= e!587800 e!587799)))

(declare-fun c!105261 () Bool)

(assert (=> b!1038770 (= c!105261 (= lt!457855 key!909))))

(declare-fun b!1038771 () Bool)

(assert (=> b!1038771 (= e!587798 (MissingVacant!9773 (index!41465 lt!457814)))))

(declare-fun b!1038772 () Bool)

(assert (=> b!1038772 (= e!587800 Undefined!9773)))

(assert (= (and d!125395 c!105262) b!1038772))

(assert (= (and d!125395 (not c!105262)) b!1038770))

(assert (= (and b!1038770 c!105261) b!1038769))

(assert (= (and b!1038770 (not c!105261)) b!1038767))

(assert (= (and b!1038767 c!105263) b!1038771))

(assert (= (and b!1038767 (not c!105263)) b!1038768))

(declare-fun m!958625 () Bool)

(assert (=> b!1038768 m!958625))

(assert (=> b!1038768 m!958625))

(declare-fun m!958627 () Bool)

(assert (=> b!1038768 m!958627))

(declare-fun m!958629 () Bool)

(assert (=> d!125395 m!958629))

(declare-fun m!958631 () Bool)

(assert (=> d!125395 m!958631))

(assert (=> d!125395 m!958549))

(assert (=> d!125395 m!958503))

(assert (=> b!1038625 d!125395))

(declare-fun d!125397 () Bool)

(declare-fun lt!457858 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!519 (List!21938) (InoxSet (_ BitVec 64)))

(assert (=> d!125397 (= lt!457858 (select (content!519 Nil!21935) (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(declare-fun e!587806 () Bool)

(assert (=> d!125397 (= lt!457858 e!587806)))

(declare-fun res!692878 () Bool)

(assert (=> d!125397 (=> (not res!692878) (not e!587806))))

(assert (=> d!125397 (= res!692878 ((_ is Cons!21934) Nil!21935))))

(assert (=> d!125397 (= (contains!6039 Nil!21935 (select (arr!31503 lt!457791) #b00000000000000000000000000000000)) lt!457858)))

(declare-fun b!1038777 () Bool)

(declare-fun e!587805 () Bool)

(assert (=> b!1038777 (= e!587806 e!587805)))

(declare-fun res!692877 () Bool)

(assert (=> b!1038777 (=> res!692877 e!587805)))

(assert (=> b!1038777 (= res!692877 (= (h!23137 Nil!21935) (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(declare-fun b!1038778 () Bool)

(assert (=> b!1038778 (= e!587805 (contains!6039 (t!31152 Nil!21935) (select (arr!31503 lt!457791) #b00000000000000000000000000000000)))))

(assert (= (and d!125397 res!692878) b!1038777))

(assert (= (and b!1038777 (not res!692877)) b!1038778))

(declare-fun m!958633 () Bool)

(assert (=> d!125397 m!958633))

(assert (=> d!125397 m!958567))

(declare-fun m!958635 () Bool)

(assert (=> d!125397 m!958635))

(assert (=> b!1038778 m!958567))

(declare-fun m!958637 () Bool)

(assert (=> b!1038778 m!958637))

(assert (=> b!1038662 d!125397))

(declare-fun d!125399 () Bool)

(assert (=> d!125399 (arrayNoDuplicates!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 Nil!21935)))

(assert (=> d!125399 true))

(declare-fun _$66!44 () Unit!33979)

(assert (=> d!125399 (= (choose!53 (_keys!11512 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!457790) #b00000000000000000000000000000000 Nil!21935) _$66!44)))

(declare-fun bs!30407 () Bool)

(assert (= bs!30407 d!125399))

(assert (=> bs!30407 m!958495))

(assert (=> bs!30407 m!958577))

(assert (=> d!125369 d!125399))

(declare-fun b!1038779 () Bool)

(declare-fun e!587808 () (_ BitVec 32))

(assert (=> b!1038779 (= e!587808 #b00000000000000000000000000000000)))

(declare-fun b!1038780 () Bool)

(declare-fun e!587807 () (_ BitVec 32))

(declare-fun call!43962 () (_ BitVec 32))

(assert (=> b!1038780 (= e!587807 (bvadd #b00000000000000000000000000000001 call!43962))))

(declare-fun b!1038781 () Bool)

(assert (=> b!1038781 (= e!587808 e!587807)))

(declare-fun c!105265 () Bool)

(assert (=> b!1038781 (= c!105265 (validKeyInArray!0 (select (arr!31503 lt!457791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125401 () Bool)

(declare-fun lt!457859 () (_ BitVec 32))

(assert (=> d!125401 (and (bvsge lt!457859 #b00000000000000000000000000000000) (bvsle lt!457859 (bvsub (size!32033 lt!457791) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125401 (= lt!457859 e!587808)))

(declare-fun c!105264 () Bool)

(assert (=> d!125401 (= c!105264 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125401 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11512 thiss!1427)) (size!32033 lt!457791)))))

(assert (=> d!125401 (= (arrayCountValidKeys!0 lt!457791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))) lt!457859)))

(declare-fun b!1038782 () Bool)

(assert (=> b!1038782 (= e!587807 call!43962)))

(declare-fun bm!43959 () Bool)

(assert (=> bm!43959 (= call!43962 (arrayCountValidKeys!0 lt!457791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (= (and d!125401 c!105264) b!1038779))

(assert (= (and d!125401 (not c!105264)) b!1038781))

(assert (= (and b!1038781 c!105265) b!1038780))

(assert (= (and b!1038781 (not c!105265)) b!1038782))

(assert (= (or b!1038780 b!1038782) bm!43959))

(assert (=> b!1038781 m!958617))

(assert (=> b!1038781 m!958617))

(assert (=> b!1038781 m!958619))

(declare-fun m!958639 () Bool)

(assert (=> bm!43959 m!958639))

(assert (=> bm!43951 d!125401))

(declare-fun d!125403 () Bool)

(assert (=> d!125403 (= (validKeyInArray!0 (select (arr!31503 lt!457791) #b00000000000000000000000000000000)) (and (not (= (select (arr!31503 lt!457791) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31503 lt!457791) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038661 d!125403))

(declare-fun b!1038783 () Bool)

(declare-fun e!587811 () Bool)

(declare-fun call!43963 () Bool)

(assert (=> b!1038783 (= e!587811 call!43963)))

(declare-fun b!1038784 () Bool)

(declare-fun e!587812 () Bool)

(declare-fun e!587810 () Bool)

(assert (=> b!1038784 (= e!587812 e!587810)))

(declare-fun res!692879 () Bool)

(assert (=> b!1038784 (=> (not res!692879) (not e!587810))))

(declare-fun e!587809 () Bool)

(assert (=> b!1038784 (= res!692879 (not e!587809))))

(declare-fun res!692880 () Bool)

(assert (=> b!1038784 (=> (not res!692880) (not e!587809))))

(assert (=> b!1038784 (= res!692880 (validKeyInArray!0 (select (arr!31503 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038785 () Bool)

(assert (=> b!1038785 (= e!587811 call!43963)))

(declare-fun b!1038786 () Bool)

(assert (=> b!1038786 (= e!587810 e!587811)))

(declare-fun c!105266 () Bool)

(assert (=> b!1038786 (= c!105266 (validKeyInArray!0 (select (arr!31503 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125405 () Bool)

(declare-fun res!692881 () Bool)

(assert (=> d!125405 (=> res!692881 e!587812)))

(assert (=> d!125405 (= res!692881 (bvsge #b00000000000000000000000000000000 (size!32033 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))))))))

(assert (=> d!125405 (= (arrayNoDuplicates!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 Nil!21935) e!587812)))

(declare-fun b!1038787 () Bool)

(assert (=> b!1038787 (= e!587809 (contains!6039 Nil!21935 (select (arr!31503 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43960 () Bool)

(assert (=> bm!43960 (= call!43963 (arrayNoDuplicates!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105266 (Cons!21934 (select (arr!31503 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000) Nil!21935) Nil!21935)))))

(assert (= (and d!125405 (not res!692881)) b!1038784))

(assert (= (and b!1038784 res!692880) b!1038787))

(assert (= (and b!1038784 res!692879) b!1038786))

(assert (= (and b!1038786 c!105266) b!1038785))

(assert (= (and b!1038786 (not c!105266)) b!1038783))

(assert (= (or b!1038785 b!1038783) bm!43960))

(declare-fun m!958641 () Bool)

(assert (=> b!1038784 m!958641))

(assert (=> b!1038784 m!958641))

(declare-fun m!958643 () Bool)

(assert (=> b!1038784 m!958643))

(assert (=> b!1038786 m!958641))

(assert (=> b!1038786 m!958641))

(assert (=> b!1038786 m!958643))

(assert (=> b!1038787 m!958641))

(assert (=> b!1038787 m!958641))

(declare-fun m!958645 () Bool)

(assert (=> b!1038787 m!958645))

(assert (=> bm!43960 m!958641))

(declare-fun m!958647 () Bool)

(assert (=> bm!43960 m!958647))

(assert (=> b!1038665 d!125405))

(declare-fun b!1038788 () Bool)

(declare-fun e!587814 () (_ BitVec 32))

(assert (=> b!1038788 (= e!587814 #b00000000000000000000000000000000)))

(declare-fun b!1038789 () Bool)

(declare-fun e!587813 () (_ BitVec 32))

(declare-fun call!43964 () (_ BitVec 32))

(assert (=> b!1038789 (= e!587813 (bvadd #b00000000000000000000000000000001 call!43964))))

(declare-fun b!1038790 () Bool)

(assert (=> b!1038790 (= e!587814 e!587813)))

(declare-fun c!105268 () Bool)

(assert (=> b!1038790 (= c!105268 (validKeyInArray!0 (select (arr!31503 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125407 () Bool)

(declare-fun lt!457860 () (_ BitVec 32))

(assert (=> d!125407 (and (bvsge lt!457860 #b00000000000000000000000000000000) (bvsle lt!457860 (bvsub (size!32033 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125407 (= lt!457860 e!587814)))

(declare-fun c!105267 () Bool)

(assert (=> d!125407 (= c!105267 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))))))

(assert (=> d!125407 (and (bvsle #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11512 thiss!1427)) (size!32033 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))))))))

(assert (=> d!125407 (= (arrayCountValidKeys!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) #b00000000000000000000000000000000 (size!32033 (_keys!11512 thiss!1427))) lt!457860)))

(declare-fun b!1038791 () Bool)

(assert (=> b!1038791 (= e!587813 call!43964)))

(declare-fun bm!43961 () Bool)

(assert (=> bm!43961 (= call!43964 (arrayCountValidKeys!0 (array!65455 (store (arr!31503 (_keys!11512 thiss!1427)) (index!41464 lt!457790) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11512 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11512 thiss!1427))))))

(assert (= (and d!125407 c!105267) b!1038788))

(assert (= (and d!125407 (not c!105267)) b!1038790))

(assert (= (and b!1038790 c!105268) b!1038789))

(assert (= (and b!1038790 (not c!105268)) b!1038791))

(assert (= (or b!1038789 b!1038791) bm!43961))

(assert (=> b!1038790 m!958641))

(assert (=> b!1038790 m!958641))

(assert (=> b!1038790 m!958643))

(declare-fun m!958649 () Bool)

(assert (=> bm!43961 m!958649))

(assert (=> b!1038647 d!125407))

(assert (=> b!1038647 d!125373))

(assert (=> b!1038676 d!125403))

(assert (=> b!1038659 d!125403))

(declare-fun d!125409 () Bool)

(assert (=> d!125409 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1038645 d!125409))

(declare-fun condMapEmpty!38557 () Bool)

(declare-fun mapDefault!38557 () ValueCell!11631)

(assert (=> mapNonEmpty!38556 (= condMapEmpty!38557 (= mapRest!38556 ((as const (Array (_ BitVec 32) ValueCell!11631)) mapDefault!38557)))))

(declare-fun e!587815 () Bool)

(declare-fun mapRes!38557 () Bool)

(assert (=> mapNonEmpty!38556 (= tp!74020 (and e!587815 mapRes!38557))))

(declare-fun b!1038792 () Bool)

(declare-fun e!587816 () Bool)

(assert (=> b!1038792 (= e!587816 tp_is_empty!24669)))

(declare-fun mapNonEmpty!38557 () Bool)

(declare-fun tp!74021 () Bool)

(assert (=> mapNonEmpty!38557 (= mapRes!38557 (and tp!74021 e!587816))))

(declare-fun mapKey!38557 () (_ BitVec 32))

(declare-fun mapRest!38557 () (Array (_ BitVec 32) ValueCell!11631))

(declare-fun mapValue!38557 () ValueCell!11631)

(assert (=> mapNonEmpty!38557 (= mapRest!38556 (store mapRest!38557 mapKey!38557 mapValue!38557))))

(declare-fun mapIsEmpty!38557 () Bool)

(assert (=> mapIsEmpty!38557 mapRes!38557))

(declare-fun b!1038793 () Bool)

(assert (=> b!1038793 (= e!587815 tp_is_empty!24669)))

(assert (= (and mapNonEmpty!38556 condMapEmpty!38557) mapIsEmpty!38557))

(assert (= (and mapNonEmpty!38556 (not condMapEmpty!38557)) mapNonEmpty!38557))

(assert (= (and mapNonEmpty!38557 ((_ is ValueCellFull!11631) mapValue!38557)) b!1038792))

(assert (= (and mapNonEmpty!38556 ((_ is ValueCellFull!11631) mapDefault!38557)) b!1038793))

(declare-fun m!958651 () Bool)

(assert (=> mapNonEmpty!38557 m!958651))

(check-sat (not b!1038716) (not b!1038754) (not mapNonEmpty!38557) (not b!1038704) (not b!1038694) (not bm!43958) (not b!1038721) (not b!1038746) b_and!33481 (not b!1038751) (not b!1038787) (not bm!43957) (not bm!43959) (not bm!43956) (not b!1038784) (not bm!43960) (not d!125385) (not b_next!20949) (not b!1038781) (not d!125395) tp_is_empty!24669 (not b!1038768) (not bm!43961) (not d!125397) (not b!1038778) (not b!1038753) (not bm!43953) (not b!1038717) (not b!1038703) (not b!1038786) (not d!125387) (not d!125381) (not b!1038693) (not b!1038691) (not b!1038790) (not d!125399))
(check-sat b_and!33481 (not b_next!20949))
