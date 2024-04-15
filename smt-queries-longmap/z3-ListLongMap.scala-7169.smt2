; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91546 () Bool)

(assert start!91546)

(declare-fun b!1042497 () Bool)

(declare-fun b_free!21067 () Bool)

(declare-fun b_next!21067 () Bool)

(assert (=> b!1042497 (= b_free!21067 (not b_next!21067))))

(declare-fun tp!74429 () Bool)

(declare-fun b_and!33573 () Bool)

(assert (=> b!1042497 (= tp!74429 b_and!33573)))

(declare-fun b!1042488 () Bool)

(declare-fun e!590558 () Bool)

(declare-datatypes ((SeekEntryResult!9818 0))(
  ( (MissingZero!9818 (index!41643 (_ BitVec 32))) (Found!9818 (index!41644 (_ BitVec 32))) (Intermediate!9818 (undefined!10630 Bool) (index!41645 (_ BitVec 32)) (x!93083 (_ BitVec 32))) (Undefined!9818) (MissingVacant!9818 (index!41646 (_ BitVec 32))) )
))
(declare-fun lt!459363 () SeekEntryResult!9818)

(declare-datatypes ((V!37923 0))(
  ( (V!37924 (val!12444 Int)) )
))
(declare-datatypes ((ValueCell!11690 0))(
  ( (ValueCellFull!11690 (v!15034 V!37923)) (EmptyCell!11690) )
))
(declare-datatypes ((array!65669 0))(
  ( (array!65670 (arr!31590 (Array (_ BitVec 32) (_ BitVec 64))) (size!32127 (_ BitVec 32))) )
))
(declare-datatypes ((array!65671 0))(
  ( (array!65672 (arr!31591 (Array (_ BitVec 32) ValueCell!11690)) (size!32128 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5974 0))(
  ( (LongMapFixedSize!5975 (defaultEntry!6369 Int) (mask!30433 (_ BitVec 32)) (extraKeys!6097 (_ BitVec 32)) (zeroValue!6203 V!37923) (minValue!6203 V!37923) (_size!3042 (_ BitVec 32)) (_keys!11617 array!65669) (_values!6392 array!65671) (_vacant!3042 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5974)

(assert (=> b!1042488 (= e!590558 (and (bvsge (index!41644 lt!459363) #b00000000000000000000000000000000) (bvslt (index!41644 lt!459363) (size!32127 (_keys!11617 thiss!1427)))))))

(declare-fun res!694640 () Bool)

(declare-fun e!590557 () Bool)

(assert (=> start!91546 (=> (not res!694640) (not e!590557))))

(declare-fun valid!2234 (LongMapFixedSize!5974) Bool)

(assert (=> start!91546 (= res!694640 (valid!2234 thiss!1427))))

(assert (=> start!91546 e!590557))

(declare-fun e!590555 () Bool)

(assert (=> start!91546 e!590555))

(assert (=> start!91546 true))

(declare-fun b!1042489 () Bool)

(declare-fun e!590556 () Bool)

(assert (=> b!1042489 (= e!590557 e!590556)))

(declare-fun res!694636 () Bool)

(assert (=> b!1042489 (=> (not res!694636) (not e!590556))))

(get-info :version)

(assert (=> b!1042489 (= res!694636 ((_ is Found!9818) lt!459363))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65669 (_ BitVec 32)) SeekEntryResult!9818)

(assert (=> b!1042489 (= lt!459363 (seekEntry!0 key!909 (_keys!11617 thiss!1427) (mask!30433 thiss!1427)))))

(declare-fun mapIsEmpty!38792 () Bool)

(declare-fun mapRes!38792 () Bool)

(assert (=> mapIsEmpty!38792 mapRes!38792))

(declare-fun b!1042490 () Bool)

(declare-fun e!590554 () Bool)

(declare-fun tp_is_empty!24787 () Bool)

(assert (=> b!1042490 (= e!590554 tp_is_empty!24787)))

(declare-fun mapNonEmpty!38792 () Bool)

(declare-fun tp!74430 () Bool)

(declare-fun e!590559 () Bool)

(assert (=> mapNonEmpty!38792 (= mapRes!38792 (and tp!74430 e!590559))))

(declare-fun mapRest!38792 () (Array (_ BitVec 32) ValueCell!11690))

(declare-fun mapKey!38792 () (_ BitVec 32))

(declare-fun mapValue!38792 () ValueCell!11690)

(assert (=> mapNonEmpty!38792 (= (arr!31591 (_values!6392 thiss!1427)) (store mapRest!38792 mapKey!38792 mapValue!38792))))

(declare-fun b!1042491 () Bool)

(declare-fun res!694639 () Bool)

(assert (=> b!1042491 (=> res!694639 e!590558)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65669 (_ BitVec 32)) Bool)

(assert (=> b!1042491 (= res!694639 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11617 thiss!1427) (mask!30433 thiss!1427))))))

(declare-fun b!1042492 () Bool)

(declare-fun res!694634 () Bool)

(assert (=> b!1042492 (=> res!694634 e!590558)))

(declare-datatypes ((List!22015 0))(
  ( (Nil!22012) (Cons!22011 (h!23219 (_ BitVec 64)) (t!31220 List!22015)) )
))
(declare-fun arrayNoDuplicates!0 (array!65669 (_ BitVec 32) List!22015) Bool)

(assert (=> b!1042492 (= res!694634 (not (arrayNoDuplicates!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 Nil!22012)))))

(declare-fun b!1042493 () Bool)

(declare-fun res!694635 () Bool)

(assert (=> b!1042493 (=> (not res!694635) (not e!590557))))

(assert (=> b!1042493 (= res!694635 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042494 () Bool)

(declare-fun res!694637 () Bool)

(assert (=> b!1042494 (=> res!694637 e!590558)))

(assert (=> b!1042494 (= res!694637 (or (not (= (size!32128 (_values!6392 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30433 thiss!1427)))) (not (= (size!32127 (_keys!11617 thiss!1427)) (size!32128 (_values!6392 thiss!1427)))) (bvslt (mask!30433 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6097 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6097 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042495 () Bool)

(assert (=> b!1042495 (= e!590559 tp_is_empty!24787)))

(declare-fun b!1042496 () Bool)

(assert (=> b!1042496 (= e!590556 (not e!590558))))

(declare-fun res!694638 () Bool)

(assert (=> b!1042496 (=> res!694638 e!590558)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042496 (= res!694638 (not (validMask!0 (mask!30433 thiss!1427))))))

(declare-fun lt!459361 () array!65669)

(declare-fun arrayContainsKey!0 (array!65669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042496 (not (arrayContainsKey!0 lt!459361 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33939 0))(
  ( (Unit!33940) )
))
(declare-fun lt!459365 () Unit!33939)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65669 (_ BitVec 32) (_ BitVec 64)) Unit!33939)

(assert (=> b!1042496 (= lt!459365 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11617 thiss!1427) (index!41644 lt!459363) key!909))))

(assert (=> b!1042496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459361 (mask!30433 thiss!1427))))

(declare-fun lt!459362 () Unit!33939)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65669 (_ BitVec 32) (_ BitVec 32)) Unit!33939)

(assert (=> b!1042496 (= lt!459362 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11617 thiss!1427) (index!41644 lt!459363) (mask!30433 thiss!1427)))))

(assert (=> b!1042496 (arrayNoDuplicates!0 lt!459361 #b00000000000000000000000000000000 Nil!22012)))

(declare-fun lt!459364 () Unit!33939)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65669 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22015) Unit!33939)

(assert (=> b!1042496 (= lt!459364 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11617 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41644 lt!459363) #b00000000000000000000000000000000 Nil!22012))))

(declare-fun arrayCountValidKeys!0 (array!65669 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042496 (= (arrayCountValidKeys!0 lt!459361 #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042496 (= lt!459361 (array!65670 (store (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32127 (_keys!11617 thiss!1427))))))

(declare-fun lt!459360 () Unit!33939)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65669 (_ BitVec 32) (_ BitVec 64)) Unit!33939)

(assert (=> b!1042496 (= lt!459360 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11617 thiss!1427) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590561 () Bool)

(declare-fun array_inv!24413 (array!65669) Bool)

(declare-fun array_inv!24414 (array!65671) Bool)

(assert (=> b!1042497 (= e!590555 (and tp!74429 tp_is_empty!24787 (array_inv!24413 (_keys!11617 thiss!1427)) (array_inv!24414 (_values!6392 thiss!1427)) e!590561))))

(declare-fun b!1042498 () Bool)

(assert (=> b!1042498 (= e!590561 (and e!590554 mapRes!38792))))

(declare-fun condMapEmpty!38792 () Bool)

(declare-fun mapDefault!38792 () ValueCell!11690)

(assert (=> b!1042498 (= condMapEmpty!38792 (= (arr!31591 (_values!6392 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11690)) mapDefault!38792)))))

(assert (= (and start!91546 res!694640) b!1042493))

(assert (= (and b!1042493 res!694635) b!1042489))

(assert (= (and b!1042489 res!694636) b!1042496))

(assert (= (and b!1042496 (not res!694638)) b!1042494))

(assert (= (and b!1042494 (not res!694637)) b!1042491))

(assert (= (and b!1042491 (not res!694639)) b!1042492))

(assert (= (and b!1042492 (not res!694634)) b!1042488))

(assert (= (and b!1042498 condMapEmpty!38792) mapIsEmpty!38792))

(assert (= (and b!1042498 (not condMapEmpty!38792)) mapNonEmpty!38792))

(assert (= (and mapNonEmpty!38792 ((_ is ValueCellFull!11690) mapValue!38792)) b!1042495))

(assert (= (and b!1042498 ((_ is ValueCellFull!11690) mapDefault!38792)) b!1042490))

(assert (= b!1042497 b!1042498))

(assert (= start!91546 b!1042497))

(declare-fun m!961301 () Bool)

(assert (=> b!1042489 m!961301))

(declare-fun m!961303 () Bool)

(assert (=> b!1042497 m!961303))

(declare-fun m!961305 () Bool)

(assert (=> b!1042497 m!961305))

(declare-fun m!961307 () Bool)

(assert (=> start!91546 m!961307))

(declare-fun m!961309 () Bool)

(assert (=> b!1042492 m!961309))

(declare-fun m!961311 () Bool)

(assert (=> mapNonEmpty!38792 m!961311))

(declare-fun m!961313 () Bool)

(assert (=> b!1042496 m!961313))

(declare-fun m!961315 () Bool)

(assert (=> b!1042496 m!961315))

(declare-fun m!961317 () Bool)

(assert (=> b!1042496 m!961317))

(declare-fun m!961319 () Bool)

(assert (=> b!1042496 m!961319))

(declare-fun m!961321 () Bool)

(assert (=> b!1042496 m!961321))

(declare-fun m!961323 () Bool)

(assert (=> b!1042496 m!961323))

(declare-fun m!961325 () Bool)

(assert (=> b!1042496 m!961325))

(declare-fun m!961327 () Bool)

(assert (=> b!1042496 m!961327))

(declare-fun m!961329 () Bool)

(assert (=> b!1042496 m!961329))

(declare-fun m!961331 () Bool)

(assert (=> b!1042496 m!961331))

(declare-fun m!961333 () Bool)

(assert (=> b!1042496 m!961333))

(declare-fun m!961335 () Bool)

(assert (=> b!1042491 m!961335))

(check-sat (not b!1042497) (not b!1042492) b_and!33573 (not b!1042489) (not b!1042491) (not mapNonEmpty!38792) tp_is_empty!24787 (not b_next!21067) (not start!91546) (not b!1042496))
(check-sat b_and!33573 (not b_next!21067))
(get-model)

(declare-fun b!1042575 () Bool)

(declare-fun e!590621 () Bool)

(declare-fun call!44166 () Bool)

(assert (=> b!1042575 (= e!590621 call!44166)))

(declare-fun b!1042576 () Bool)

(assert (=> b!1042576 (= e!590621 call!44166)))

(declare-fun b!1042577 () Bool)

(declare-fun e!590620 () Bool)

(assert (=> b!1042577 (= e!590620 e!590621)))

(declare-fun c!105821 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042577 (= c!105821 (validKeyInArray!0 (select (arr!31590 lt!459361) #b00000000000000000000000000000000)))))

(declare-fun b!1042578 () Bool)

(declare-fun e!590618 () Bool)

(declare-fun contains!6039 (List!22015 (_ BitVec 64)) Bool)

(assert (=> b!1042578 (= e!590618 (contains!6039 Nil!22012 (select (arr!31590 lt!459361) #b00000000000000000000000000000000)))))

(declare-fun d!126001 () Bool)

(declare-fun res!694689 () Bool)

(declare-fun e!590619 () Bool)

(assert (=> d!126001 (=> res!694689 e!590619)))

(assert (=> d!126001 (= res!694689 (bvsge #b00000000000000000000000000000000 (size!32127 lt!459361)))))

(assert (=> d!126001 (= (arrayNoDuplicates!0 lt!459361 #b00000000000000000000000000000000 Nil!22012) e!590619)))

(declare-fun bm!44163 () Bool)

(assert (=> bm!44163 (= call!44166 (arrayNoDuplicates!0 lt!459361 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105821 (Cons!22011 (select (arr!31590 lt!459361) #b00000000000000000000000000000000) Nil!22012) Nil!22012)))))

(declare-fun b!1042579 () Bool)

(assert (=> b!1042579 (= e!590619 e!590620)))

(declare-fun res!694690 () Bool)

(assert (=> b!1042579 (=> (not res!694690) (not e!590620))))

(assert (=> b!1042579 (= res!694690 (not e!590618))))

(declare-fun res!694691 () Bool)

(assert (=> b!1042579 (=> (not res!694691) (not e!590618))))

(assert (=> b!1042579 (= res!694691 (validKeyInArray!0 (select (arr!31590 lt!459361) #b00000000000000000000000000000000)))))

(assert (= (and d!126001 (not res!694689)) b!1042579))

(assert (= (and b!1042579 res!694691) b!1042578))

(assert (= (and b!1042579 res!694690) b!1042577))

(assert (= (and b!1042577 c!105821) b!1042575))

(assert (= (and b!1042577 (not c!105821)) b!1042576))

(assert (= (or b!1042575 b!1042576) bm!44163))

(declare-fun m!961409 () Bool)

(assert (=> b!1042577 m!961409))

(assert (=> b!1042577 m!961409))

(declare-fun m!961411 () Bool)

(assert (=> b!1042577 m!961411))

(assert (=> b!1042578 m!961409))

(assert (=> b!1042578 m!961409))

(declare-fun m!961413 () Bool)

(assert (=> b!1042578 m!961413))

(assert (=> bm!44163 m!961409))

(declare-fun m!961415 () Bool)

(assert (=> bm!44163 m!961415))

(assert (=> b!1042579 m!961409))

(assert (=> b!1042579 m!961409))

(assert (=> b!1042579 m!961411))

(assert (=> b!1042496 d!126001))

(declare-fun b!1042588 () Bool)

(declare-fun res!694703 () Bool)

(declare-fun e!590626 () Bool)

(assert (=> b!1042588 (=> (not res!694703) (not e!590626))))

(assert (=> b!1042588 (= res!694703 (validKeyInArray!0 (select (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459363))))))

(declare-fun d!126003 () Bool)

(declare-fun e!590627 () Bool)

(assert (=> d!126003 e!590627))

(declare-fun res!694700 () Bool)

(assert (=> d!126003 (=> (not res!694700) (not e!590627))))

(assert (=> d!126003 (= res!694700 (and (bvsge (index!41644 lt!459363) #b00000000000000000000000000000000) (bvslt (index!41644 lt!459363) (size!32127 (_keys!11617 thiss!1427)))))))

(declare-fun lt!459404 () Unit!33939)

(declare-fun choose!82 (array!65669 (_ BitVec 32) (_ BitVec 64)) Unit!33939)

(assert (=> d!126003 (= lt!459404 (choose!82 (_keys!11617 thiss!1427) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126003 e!590626))

(declare-fun res!694702 () Bool)

(assert (=> d!126003 (=> (not res!694702) (not e!590626))))

(assert (=> d!126003 (= res!694702 (and (bvsge (index!41644 lt!459363) #b00000000000000000000000000000000) (bvslt (index!41644 lt!459363) (size!32127 (_keys!11617 thiss!1427)))))))

(assert (=> d!126003 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11617 thiss!1427) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459404)))

(declare-fun b!1042589 () Bool)

(declare-fun res!694701 () Bool)

(assert (=> b!1042589 (=> (not res!694701) (not e!590626))))

(assert (=> b!1042589 (= res!694701 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042590 () Bool)

(assert (=> b!1042590 (= e!590626 (bvslt (size!32127 (_keys!11617 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042591 () Bool)

(assert (=> b!1042591 (= e!590627 (= (arrayCountValidKeys!0 (array!65670 (store (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32127 (_keys!11617 thiss!1427))) #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126003 res!694702) b!1042588))

(assert (= (and b!1042588 res!694703) b!1042589))

(assert (= (and b!1042589 res!694701) b!1042590))

(assert (= (and d!126003 res!694700) b!1042591))

(declare-fun m!961417 () Bool)

(assert (=> b!1042588 m!961417))

(assert (=> b!1042588 m!961417))

(declare-fun m!961419 () Bool)

(assert (=> b!1042588 m!961419))

(declare-fun m!961421 () Bool)

(assert (=> d!126003 m!961421))

(declare-fun m!961423 () Bool)

(assert (=> b!1042589 m!961423))

(assert (=> b!1042591 m!961323))

(declare-fun m!961425 () Bool)

(assert (=> b!1042591 m!961425))

(assert (=> b!1042591 m!961321))

(assert (=> b!1042496 d!126003))

(declare-fun d!126005 () Bool)

(declare-fun e!590630 () Bool)

(assert (=> d!126005 e!590630))

(declare-fun res!694706 () Bool)

(assert (=> d!126005 (=> (not res!694706) (not e!590630))))

(assert (=> d!126005 (= res!694706 (and (bvsge (index!41644 lt!459363) #b00000000000000000000000000000000) (bvslt (index!41644 lt!459363) (size!32127 (_keys!11617 thiss!1427)))))))

(declare-fun lt!459407 () Unit!33939)

(declare-fun choose!53 (array!65669 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22015) Unit!33939)

(assert (=> d!126005 (= lt!459407 (choose!53 (_keys!11617 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41644 lt!459363) #b00000000000000000000000000000000 Nil!22012))))

(assert (=> d!126005 (bvslt (size!32127 (_keys!11617 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126005 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11617 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41644 lt!459363) #b00000000000000000000000000000000 Nil!22012) lt!459407)))

(declare-fun b!1042594 () Bool)

(assert (=> b!1042594 (= e!590630 (arrayNoDuplicates!0 (array!65670 (store (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32127 (_keys!11617 thiss!1427))) #b00000000000000000000000000000000 Nil!22012))))

(assert (= (and d!126005 res!694706) b!1042594))

(declare-fun m!961427 () Bool)

(assert (=> d!126005 m!961427))

(assert (=> b!1042594 m!961323))

(declare-fun m!961429 () Bool)

(assert (=> b!1042594 m!961429))

(assert (=> b!1042496 d!126005))

(declare-fun d!126007 () Bool)

(assert (=> d!126007 (= (validMask!0 (mask!30433 thiss!1427)) (and (or (= (mask!30433 thiss!1427) #b00000000000000000000000000000111) (= (mask!30433 thiss!1427) #b00000000000000000000000000001111) (= (mask!30433 thiss!1427) #b00000000000000000000000000011111) (= (mask!30433 thiss!1427) #b00000000000000000000000000111111) (= (mask!30433 thiss!1427) #b00000000000000000000000001111111) (= (mask!30433 thiss!1427) #b00000000000000000000000011111111) (= (mask!30433 thiss!1427) #b00000000000000000000000111111111) (= (mask!30433 thiss!1427) #b00000000000000000000001111111111) (= (mask!30433 thiss!1427) #b00000000000000000000011111111111) (= (mask!30433 thiss!1427) #b00000000000000000000111111111111) (= (mask!30433 thiss!1427) #b00000000000000000001111111111111) (= (mask!30433 thiss!1427) #b00000000000000000011111111111111) (= (mask!30433 thiss!1427) #b00000000000000000111111111111111) (= (mask!30433 thiss!1427) #b00000000000000001111111111111111) (= (mask!30433 thiss!1427) #b00000000000000011111111111111111) (= (mask!30433 thiss!1427) #b00000000000000111111111111111111) (= (mask!30433 thiss!1427) #b00000000000001111111111111111111) (= (mask!30433 thiss!1427) #b00000000000011111111111111111111) (= (mask!30433 thiss!1427) #b00000000000111111111111111111111) (= (mask!30433 thiss!1427) #b00000000001111111111111111111111) (= (mask!30433 thiss!1427) #b00000000011111111111111111111111) (= (mask!30433 thiss!1427) #b00000000111111111111111111111111) (= (mask!30433 thiss!1427) #b00000001111111111111111111111111) (= (mask!30433 thiss!1427) #b00000011111111111111111111111111) (= (mask!30433 thiss!1427) #b00000111111111111111111111111111) (= (mask!30433 thiss!1427) #b00001111111111111111111111111111) (= (mask!30433 thiss!1427) #b00011111111111111111111111111111) (= (mask!30433 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30433 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042496 d!126007))

(declare-fun d!126009 () Bool)

(declare-fun e!590633 () Bool)

(assert (=> d!126009 e!590633))

(declare-fun res!694709 () Bool)

(assert (=> d!126009 (=> (not res!694709) (not e!590633))))

(assert (=> d!126009 (= res!694709 (bvslt (index!41644 lt!459363) (size!32127 (_keys!11617 thiss!1427))))))

(declare-fun lt!459410 () Unit!33939)

(declare-fun choose!121 (array!65669 (_ BitVec 32) (_ BitVec 64)) Unit!33939)

(assert (=> d!126009 (= lt!459410 (choose!121 (_keys!11617 thiss!1427) (index!41644 lt!459363) key!909))))

(assert (=> d!126009 (bvsge (index!41644 lt!459363) #b00000000000000000000000000000000)))

(assert (=> d!126009 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11617 thiss!1427) (index!41644 lt!459363) key!909) lt!459410)))

(declare-fun b!1042597 () Bool)

(assert (=> b!1042597 (= e!590633 (not (arrayContainsKey!0 (array!65670 (store (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32127 (_keys!11617 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126009 res!694709) b!1042597))

(declare-fun m!961431 () Bool)

(assert (=> d!126009 m!961431))

(assert (=> b!1042597 m!961323))

(declare-fun m!961433 () Bool)

(assert (=> b!1042597 m!961433))

(assert (=> b!1042496 d!126009))

(declare-fun d!126011 () Bool)

(declare-fun res!694714 () Bool)

(declare-fun e!590638 () Bool)

(assert (=> d!126011 (=> res!694714 e!590638)))

(assert (=> d!126011 (= res!694714 (= (select (arr!31590 lt!459361) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126011 (= (arrayContainsKey!0 lt!459361 key!909 #b00000000000000000000000000000000) e!590638)))

(declare-fun b!1042602 () Bool)

(declare-fun e!590639 () Bool)

(assert (=> b!1042602 (= e!590638 e!590639)))

(declare-fun res!694715 () Bool)

(assert (=> b!1042602 (=> (not res!694715) (not e!590639))))

(assert (=> b!1042602 (= res!694715 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32127 lt!459361)))))

(declare-fun b!1042603 () Bool)

(assert (=> b!1042603 (= e!590639 (arrayContainsKey!0 lt!459361 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126011 (not res!694714)) b!1042602))

(assert (= (and b!1042602 res!694715) b!1042603))

(assert (=> d!126011 m!961409))

(declare-fun m!961435 () Bool)

(assert (=> b!1042603 m!961435))

(assert (=> b!1042496 d!126011))

(declare-fun bm!44166 () Bool)

(declare-fun call!44169 () (_ BitVec 32))

(assert (=> bm!44166 (= call!44169 (arrayCountValidKeys!0 lt!459361 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32127 (_keys!11617 thiss!1427))))))

(declare-fun d!126013 () Bool)

(declare-fun lt!459413 () (_ BitVec 32))

(assert (=> d!126013 (and (bvsge lt!459413 #b00000000000000000000000000000000) (bvsle lt!459413 (bvsub (size!32127 lt!459361) #b00000000000000000000000000000000)))))

(declare-fun e!590644 () (_ BitVec 32))

(assert (=> d!126013 (= lt!459413 e!590644)))

(declare-fun c!105827 () Bool)

(assert (=> d!126013 (= c!105827 (bvsge #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))))))

(assert (=> d!126013 (and (bvsle #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32127 (_keys!11617 thiss!1427)) (size!32127 lt!459361)))))

(assert (=> d!126013 (= (arrayCountValidKeys!0 lt!459361 #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) lt!459413)))

(declare-fun b!1042612 () Bool)

(assert (=> b!1042612 (= e!590644 #b00000000000000000000000000000000)))

(declare-fun b!1042613 () Bool)

(declare-fun e!590645 () (_ BitVec 32))

(assert (=> b!1042613 (= e!590645 call!44169)))

(declare-fun b!1042614 () Bool)

(assert (=> b!1042614 (= e!590644 e!590645)))

(declare-fun c!105826 () Bool)

(assert (=> b!1042614 (= c!105826 (validKeyInArray!0 (select (arr!31590 lt!459361) #b00000000000000000000000000000000)))))

(declare-fun b!1042615 () Bool)

(assert (=> b!1042615 (= e!590645 (bvadd #b00000000000000000000000000000001 call!44169))))

(assert (= (and d!126013 c!105827) b!1042612))

(assert (= (and d!126013 (not c!105827)) b!1042614))

(assert (= (and b!1042614 c!105826) b!1042615))

(assert (= (and b!1042614 (not c!105826)) b!1042613))

(assert (= (or b!1042615 b!1042613) bm!44166))

(declare-fun m!961437 () Bool)

(assert (=> bm!44166 m!961437))

(assert (=> b!1042614 m!961409))

(assert (=> b!1042614 m!961409))

(assert (=> b!1042614 m!961411))

(assert (=> b!1042496 d!126013))

(declare-fun b!1042624 () Bool)

(declare-fun e!590652 () Bool)

(declare-fun e!590653 () Bool)

(assert (=> b!1042624 (= e!590652 e!590653)))

(declare-fun lt!459422 () (_ BitVec 64))

(assert (=> b!1042624 (= lt!459422 (select (arr!31590 lt!459361) #b00000000000000000000000000000000))))

(declare-fun lt!459420 () Unit!33939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65669 (_ BitVec 64) (_ BitVec 32)) Unit!33939)

(assert (=> b!1042624 (= lt!459420 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459361 lt!459422 #b00000000000000000000000000000000))))

(assert (=> b!1042624 (arrayContainsKey!0 lt!459361 lt!459422 #b00000000000000000000000000000000)))

(declare-fun lt!459421 () Unit!33939)

(assert (=> b!1042624 (= lt!459421 lt!459420)))

(declare-fun res!694721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65669 (_ BitVec 32)) SeekEntryResult!9818)

(assert (=> b!1042624 (= res!694721 (= (seekEntryOrOpen!0 (select (arr!31590 lt!459361) #b00000000000000000000000000000000) lt!459361 (mask!30433 thiss!1427)) (Found!9818 #b00000000000000000000000000000000)))))

(assert (=> b!1042624 (=> (not res!694721) (not e!590653))))

(declare-fun b!1042625 () Bool)

(declare-fun call!44172 () Bool)

(assert (=> b!1042625 (= e!590653 call!44172)))

(declare-fun bm!44169 () Bool)

(assert (=> bm!44169 (= call!44172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459361 (mask!30433 thiss!1427)))))

(declare-fun b!1042626 () Bool)

(declare-fun e!590654 () Bool)

(assert (=> b!1042626 (= e!590654 e!590652)))

(declare-fun c!105830 () Bool)

(assert (=> b!1042626 (= c!105830 (validKeyInArray!0 (select (arr!31590 lt!459361) #b00000000000000000000000000000000)))))

(declare-fun d!126015 () Bool)

(declare-fun res!694720 () Bool)

(assert (=> d!126015 (=> res!694720 e!590654)))

(assert (=> d!126015 (= res!694720 (bvsge #b00000000000000000000000000000000 (size!32127 lt!459361)))))

(assert (=> d!126015 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459361 (mask!30433 thiss!1427)) e!590654)))

(declare-fun b!1042627 () Bool)

(assert (=> b!1042627 (= e!590652 call!44172)))

(assert (= (and d!126015 (not res!694720)) b!1042626))

(assert (= (and b!1042626 c!105830) b!1042624))

(assert (= (and b!1042626 (not c!105830)) b!1042627))

(assert (= (and b!1042624 res!694721) b!1042625))

(assert (= (or b!1042625 b!1042627) bm!44169))

(assert (=> b!1042624 m!961409))

(declare-fun m!961439 () Bool)

(assert (=> b!1042624 m!961439))

(declare-fun m!961441 () Bool)

(assert (=> b!1042624 m!961441))

(assert (=> b!1042624 m!961409))

(declare-fun m!961443 () Bool)

(assert (=> b!1042624 m!961443))

(declare-fun m!961445 () Bool)

(assert (=> bm!44169 m!961445))

(assert (=> b!1042626 m!961409))

(assert (=> b!1042626 m!961409))

(assert (=> b!1042626 m!961411))

(assert (=> b!1042496 d!126015))

(declare-fun bm!44170 () Bool)

(declare-fun call!44173 () (_ BitVec 32))

(assert (=> bm!44170 (= call!44173 (arrayCountValidKeys!0 (_keys!11617 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32127 (_keys!11617 thiss!1427))))))

(declare-fun d!126017 () Bool)

(declare-fun lt!459423 () (_ BitVec 32))

(assert (=> d!126017 (and (bvsge lt!459423 #b00000000000000000000000000000000) (bvsle lt!459423 (bvsub (size!32127 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!590655 () (_ BitVec 32))

(assert (=> d!126017 (= lt!459423 e!590655)))

(declare-fun c!105832 () Bool)

(assert (=> d!126017 (= c!105832 (bvsge #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))))))

(assert (=> d!126017 (and (bvsle #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32127 (_keys!11617 thiss!1427)) (size!32127 (_keys!11617 thiss!1427))))))

(assert (=> d!126017 (= (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) lt!459423)))

(declare-fun b!1042628 () Bool)

(assert (=> b!1042628 (= e!590655 #b00000000000000000000000000000000)))

(declare-fun b!1042629 () Bool)

(declare-fun e!590656 () (_ BitVec 32))

(assert (=> b!1042629 (= e!590656 call!44173)))

(declare-fun b!1042630 () Bool)

(assert (=> b!1042630 (= e!590655 e!590656)))

(declare-fun c!105831 () Bool)

(assert (=> b!1042630 (= c!105831 (validKeyInArray!0 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042631 () Bool)

(assert (=> b!1042631 (= e!590656 (bvadd #b00000000000000000000000000000001 call!44173))))

(assert (= (and d!126017 c!105832) b!1042628))

(assert (= (and d!126017 (not c!105832)) b!1042630))

(assert (= (and b!1042630 c!105831) b!1042631))

(assert (= (and b!1042630 (not c!105831)) b!1042629))

(assert (= (or b!1042631 b!1042629) bm!44170))

(declare-fun m!961447 () Bool)

(assert (=> bm!44170 m!961447))

(declare-fun m!961449 () Bool)

(assert (=> b!1042630 m!961449))

(assert (=> b!1042630 m!961449))

(declare-fun m!961451 () Bool)

(assert (=> b!1042630 m!961451))

(assert (=> b!1042496 d!126017))

(declare-fun d!126019 () Bool)

(declare-fun e!590659 () Bool)

(assert (=> d!126019 e!590659))

(declare-fun res!694724 () Bool)

(assert (=> d!126019 (=> (not res!694724) (not e!590659))))

(assert (=> d!126019 (= res!694724 (and (bvsge (index!41644 lt!459363) #b00000000000000000000000000000000) (bvslt (index!41644 lt!459363) (size!32127 (_keys!11617 thiss!1427)))))))

(declare-fun lt!459426 () Unit!33939)

(declare-fun choose!25 (array!65669 (_ BitVec 32) (_ BitVec 32)) Unit!33939)

(assert (=> d!126019 (= lt!459426 (choose!25 (_keys!11617 thiss!1427) (index!41644 lt!459363) (mask!30433 thiss!1427)))))

(assert (=> d!126019 (validMask!0 (mask!30433 thiss!1427))))

(assert (=> d!126019 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11617 thiss!1427) (index!41644 lt!459363) (mask!30433 thiss!1427)) lt!459426)))

(declare-fun b!1042634 () Bool)

(assert (=> b!1042634 (= e!590659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65670 (store (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459363) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32127 (_keys!11617 thiss!1427))) (mask!30433 thiss!1427)))))

(assert (= (and d!126019 res!694724) b!1042634))

(declare-fun m!961453 () Bool)

(assert (=> d!126019 m!961453))

(assert (=> d!126019 m!961315))

(assert (=> b!1042634 m!961323))

(declare-fun m!961455 () Bool)

(assert (=> b!1042634 m!961455))

(assert (=> b!1042496 d!126019))

(declare-fun b!1042635 () Bool)

(declare-fun e!590660 () Bool)

(declare-fun e!590661 () Bool)

(assert (=> b!1042635 (= e!590660 e!590661)))

(declare-fun lt!459429 () (_ BitVec 64))

(assert (=> b!1042635 (= lt!459429 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459427 () Unit!33939)

(assert (=> b!1042635 (= lt!459427 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11617 thiss!1427) lt!459429 #b00000000000000000000000000000000))))

(assert (=> b!1042635 (arrayContainsKey!0 (_keys!11617 thiss!1427) lt!459429 #b00000000000000000000000000000000)))

(declare-fun lt!459428 () Unit!33939)

(assert (=> b!1042635 (= lt!459428 lt!459427)))

(declare-fun res!694726 () Bool)

(assert (=> b!1042635 (= res!694726 (= (seekEntryOrOpen!0 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000) (_keys!11617 thiss!1427) (mask!30433 thiss!1427)) (Found!9818 #b00000000000000000000000000000000)))))

(assert (=> b!1042635 (=> (not res!694726) (not e!590661))))

(declare-fun b!1042636 () Bool)

(declare-fun call!44174 () Bool)

(assert (=> b!1042636 (= e!590661 call!44174)))

(declare-fun bm!44171 () Bool)

(assert (=> bm!44171 (= call!44174 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11617 thiss!1427) (mask!30433 thiss!1427)))))

(declare-fun b!1042637 () Bool)

(declare-fun e!590662 () Bool)

(assert (=> b!1042637 (= e!590662 e!590660)))

(declare-fun c!105833 () Bool)

(assert (=> b!1042637 (= c!105833 (validKeyInArray!0 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126021 () Bool)

(declare-fun res!694725 () Bool)

(assert (=> d!126021 (=> res!694725 e!590662)))

(assert (=> d!126021 (= res!694725 (bvsge #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))))))

(assert (=> d!126021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11617 thiss!1427) (mask!30433 thiss!1427)) e!590662)))

(declare-fun b!1042638 () Bool)

(assert (=> b!1042638 (= e!590660 call!44174)))

(assert (= (and d!126021 (not res!694725)) b!1042637))

(assert (= (and b!1042637 c!105833) b!1042635))

(assert (= (and b!1042637 (not c!105833)) b!1042638))

(assert (= (and b!1042635 res!694726) b!1042636))

(assert (= (or b!1042636 b!1042638) bm!44171))

(assert (=> b!1042635 m!961449))

(declare-fun m!961457 () Bool)

(assert (=> b!1042635 m!961457))

(declare-fun m!961459 () Bool)

(assert (=> b!1042635 m!961459))

(assert (=> b!1042635 m!961449))

(declare-fun m!961461 () Bool)

(assert (=> b!1042635 m!961461))

(declare-fun m!961463 () Bool)

(assert (=> bm!44171 m!961463))

(assert (=> b!1042637 m!961449))

(assert (=> b!1042637 m!961449))

(assert (=> b!1042637 m!961451))

(assert (=> b!1042491 d!126021))

(declare-fun d!126023 () Bool)

(assert (=> d!126023 (= (array_inv!24413 (_keys!11617 thiss!1427)) (bvsge (size!32127 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042497 d!126023))

(declare-fun d!126025 () Bool)

(assert (=> d!126025 (= (array_inv!24414 (_values!6392 thiss!1427)) (bvsge (size!32128 (_values!6392 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042497 d!126025))

(declare-fun b!1042639 () Bool)

(declare-fun e!590666 () Bool)

(declare-fun call!44175 () Bool)

(assert (=> b!1042639 (= e!590666 call!44175)))

(declare-fun b!1042640 () Bool)

(assert (=> b!1042640 (= e!590666 call!44175)))

(declare-fun b!1042641 () Bool)

(declare-fun e!590665 () Bool)

(assert (=> b!1042641 (= e!590665 e!590666)))

(declare-fun c!105834 () Bool)

(assert (=> b!1042641 (= c!105834 (validKeyInArray!0 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042642 () Bool)

(declare-fun e!590663 () Bool)

(assert (=> b!1042642 (= e!590663 (contains!6039 Nil!22012 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126027 () Bool)

(declare-fun res!694727 () Bool)

(declare-fun e!590664 () Bool)

(assert (=> d!126027 (=> res!694727 e!590664)))

(assert (=> d!126027 (= res!694727 (bvsge #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))))))

(assert (=> d!126027 (= (arrayNoDuplicates!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 Nil!22012) e!590664)))

(declare-fun bm!44172 () Bool)

(assert (=> bm!44172 (= call!44175 (arrayNoDuplicates!0 (_keys!11617 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105834 (Cons!22011 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000) Nil!22012) Nil!22012)))))

(declare-fun b!1042643 () Bool)

(assert (=> b!1042643 (= e!590664 e!590665)))

(declare-fun res!694728 () Bool)

(assert (=> b!1042643 (=> (not res!694728) (not e!590665))))

(assert (=> b!1042643 (= res!694728 (not e!590663))))

(declare-fun res!694729 () Bool)

(assert (=> b!1042643 (=> (not res!694729) (not e!590663))))

(assert (=> b!1042643 (= res!694729 (validKeyInArray!0 (select (arr!31590 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126027 (not res!694727)) b!1042643))

(assert (= (and b!1042643 res!694729) b!1042642))

(assert (= (and b!1042643 res!694728) b!1042641))

(assert (= (and b!1042641 c!105834) b!1042639))

(assert (= (and b!1042641 (not c!105834)) b!1042640))

(assert (= (or b!1042639 b!1042640) bm!44172))

(assert (=> b!1042641 m!961449))

(assert (=> b!1042641 m!961449))

(assert (=> b!1042641 m!961451))

(assert (=> b!1042642 m!961449))

(assert (=> b!1042642 m!961449))

(declare-fun m!961465 () Bool)

(assert (=> b!1042642 m!961465))

(assert (=> bm!44172 m!961449))

(declare-fun m!961467 () Bool)

(assert (=> bm!44172 m!961467))

(assert (=> b!1042643 m!961449))

(assert (=> b!1042643 m!961449))

(assert (=> b!1042643 m!961451))

(assert (=> b!1042492 d!126027))

(declare-fun b!1042656 () Bool)

(declare-fun e!590673 () SeekEntryResult!9818)

(declare-fun e!590675 () SeekEntryResult!9818)

(assert (=> b!1042656 (= e!590673 e!590675)))

(declare-fun lt!459440 () (_ BitVec 64))

(declare-fun lt!459441 () SeekEntryResult!9818)

(assert (=> b!1042656 (= lt!459440 (select (arr!31590 (_keys!11617 thiss!1427)) (index!41645 lt!459441)))))

(declare-fun c!105842 () Bool)

(assert (=> b!1042656 (= c!105842 (= lt!459440 key!909))))

(declare-fun b!1042657 () Bool)

(declare-fun e!590674 () SeekEntryResult!9818)

(assert (=> b!1042657 (= e!590674 (MissingZero!9818 (index!41645 lt!459441)))))

(declare-fun d!126029 () Bool)

(declare-fun lt!459438 () SeekEntryResult!9818)

(assert (=> d!126029 (and (or ((_ is MissingVacant!9818) lt!459438) (not ((_ is Found!9818) lt!459438)) (and (bvsge (index!41644 lt!459438) #b00000000000000000000000000000000) (bvslt (index!41644 lt!459438) (size!32127 (_keys!11617 thiss!1427))))) (not ((_ is MissingVacant!9818) lt!459438)) (or (not ((_ is Found!9818) lt!459438)) (= (select (arr!31590 (_keys!11617 thiss!1427)) (index!41644 lt!459438)) key!909)))))

(assert (=> d!126029 (= lt!459438 e!590673)))

(declare-fun c!105843 () Bool)

(assert (=> d!126029 (= c!105843 (and ((_ is Intermediate!9818) lt!459441) (undefined!10630 lt!459441)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65669 (_ BitVec 32)) SeekEntryResult!9818)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126029 (= lt!459441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30433 thiss!1427)) key!909 (_keys!11617 thiss!1427) (mask!30433 thiss!1427)))))

(assert (=> d!126029 (validMask!0 (mask!30433 thiss!1427))))

(assert (=> d!126029 (= (seekEntry!0 key!909 (_keys!11617 thiss!1427) (mask!30433 thiss!1427)) lt!459438)))

(declare-fun b!1042658 () Bool)

(assert (=> b!1042658 (= e!590675 (Found!9818 (index!41645 lt!459441)))))

(declare-fun b!1042659 () Bool)

(assert (=> b!1042659 (= e!590673 Undefined!9818)))

(declare-fun b!1042660 () Bool)

(declare-fun lt!459439 () SeekEntryResult!9818)

(assert (=> b!1042660 (= e!590674 (ite ((_ is MissingVacant!9818) lt!459439) (MissingZero!9818 (index!41646 lt!459439)) lt!459439))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65669 (_ BitVec 32)) SeekEntryResult!9818)

(assert (=> b!1042660 (= lt!459439 (seekKeyOrZeroReturnVacant!0 (x!93083 lt!459441) (index!41645 lt!459441) (index!41645 lt!459441) key!909 (_keys!11617 thiss!1427) (mask!30433 thiss!1427)))))

(declare-fun b!1042661 () Bool)

(declare-fun c!105841 () Bool)

(assert (=> b!1042661 (= c!105841 (= lt!459440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042661 (= e!590675 e!590674)))

(assert (= (and d!126029 c!105843) b!1042659))

(assert (= (and d!126029 (not c!105843)) b!1042656))

(assert (= (and b!1042656 c!105842) b!1042658))

(assert (= (and b!1042656 (not c!105842)) b!1042661))

(assert (= (and b!1042661 c!105841) b!1042657))

(assert (= (and b!1042661 (not c!105841)) b!1042660))

(declare-fun m!961469 () Bool)

(assert (=> b!1042656 m!961469))

(declare-fun m!961471 () Bool)

(assert (=> d!126029 m!961471))

(declare-fun m!961473 () Bool)

(assert (=> d!126029 m!961473))

(assert (=> d!126029 m!961473))

(declare-fun m!961475 () Bool)

(assert (=> d!126029 m!961475))

(assert (=> d!126029 m!961315))

(declare-fun m!961477 () Bool)

(assert (=> b!1042660 m!961477))

(assert (=> b!1042489 d!126029))

(declare-fun d!126031 () Bool)

(declare-fun res!694736 () Bool)

(declare-fun e!590678 () Bool)

(assert (=> d!126031 (=> (not res!694736) (not e!590678))))

(declare-fun simpleValid!443 (LongMapFixedSize!5974) Bool)

(assert (=> d!126031 (= res!694736 (simpleValid!443 thiss!1427))))

(assert (=> d!126031 (= (valid!2234 thiss!1427) e!590678)))

(declare-fun b!1042668 () Bool)

(declare-fun res!694737 () Bool)

(assert (=> b!1042668 (=> (not res!694737) (not e!590678))))

(assert (=> b!1042668 (= res!694737 (= (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32127 (_keys!11617 thiss!1427))) (_size!3042 thiss!1427)))))

(declare-fun b!1042669 () Bool)

(declare-fun res!694738 () Bool)

(assert (=> b!1042669 (=> (not res!694738) (not e!590678))))

(assert (=> b!1042669 (= res!694738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11617 thiss!1427) (mask!30433 thiss!1427)))))

(declare-fun b!1042670 () Bool)

(assert (=> b!1042670 (= e!590678 (arrayNoDuplicates!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 Nil!22012))))

(assert (= (and d!126031 res!694736) b!1042668))

(assert (= (and b!1042668 res!694737) b!1042669))

(assert (= (and b!1042669 res!694738) b!1042670))

(declare-fun m!961479 () Bool)

(assert (=> d!126031 m!961479))

(assert (=> b!1042668 m!961321))

(assert (=> b!1042669 m!961335))

(assert (=> b!1042670 m!961309))

(assert (=> start!91546 d!126031))

(declare-fun mapNonEmpty!38801 () Bool)

(declare-fun mapRes!38801 () Bool)

(declare-fun tp!74445 () Bool)

(declare-fun e!590683 () Bool)

(assert (=> mapNonEmpty!38801 (= mapRes!38801 (and tp!74445 e!590683))))

(declare-fun mapKey!38801 () (_ BitVec 32))

(declare-fun mapRest!38801 () (Array (_ BitVec 32) ValueCell!11690))

(declare-fun mapValue!38801 () ValueCell!11690)

(assert (=> mapNonEmpty!38801 (= mapRest!38792 (store mapRest!38801 mapKey!38801 mapValue!38801))))

(declare-fun b!1042677 () Bool)

(assert (=> b!1042677 (= e!590683 tp_is_empty!24787)))

(declare-fun mapIsEmpty!38801 () Bool)

(assert (=> mapIsEmpty!38801 mapRes!38801))

(declare-fun condMapEmpty!38801 () Bool)

(declare-fun mapDefault!38801 () ValueCell!11690)

(assert (=> mapNonEmpty!38792 (= condMapEmpty!38801 (= mapRest!38792 ((as const (Array (_ BitVec 32) ValueCell!11690)) mapDefault!38801)))))

(declare-fun e!590684 () Bool)

(assert (=> mapNonEmpty!38792 (= tp!74430 (and e!590684 mapRes!38801))))

(declare-fun b!1042678 () Bool)

(assert (=> b!1042678 (= e!590684 tp_is_empty!24787)))

(assert (= (and mapNonEmpty!38792 condMapEmpty!38801) mapIsEmpty!38801))

(assert (= (and mapNonEmpty!38792 (not condMapEmpty!38801)) mapNonEmpty!38801))

(assert (= (and mapNonEmpty!38801 ((_ is ValueCellFull!11690) mapValue!38801)) b!1042677))

(assert (= (and mapNonEmpty!38792 ((_ is ValueCellFull!11690) mapDefault!38801)) b!1042678))

(declare-fun m!961481 () Bool)

(assert (=> mapNonEmpty!38801 m!961481))

(check-sat (not b!1042635) (not bm!44169) (not b!1042660) (not b!1042670) (not mapNonEmpty!38801) tp_is_empty!24787 (not b!1042589) (not b!1042603) (not b!1042597) (not b!1042626) (not d!126005) (not b!1042594) (not b!1042577) (not d!126031) (not b!1042641) (not b!1042637) (not b!1042669) (not b!1042614) b_and!33573 (not b!1042624) (not b!1042630) (not b!1042642) (not bm!44171) (not b!1042578) (not d!126003) (not bm!44163) (not b!1042634) (not bm!44170) (not b!1042643) (not d!126009) (not d!126029) (not b_next!21067) (not b!1042579) (not bm!44166) (not bm!44172) (not b!1042591) (not d!126019) (not b!1042588) (not b!1042668))
(check-sat b_and!33573 (not b_next!21067))
