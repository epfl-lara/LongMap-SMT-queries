; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91170 () Bool)

(assert start!91170)

(declare-fun b!1040519 () Bool)

(declare-fun b_free!21015 () Bool)

(declare-fun b_next!21015 () Bool)

(assert (=> b!1040519 (= b_free!21015 (not b_next!21015))))

(declare-fun tp!74243 () Bool)

(declare-fun b_and!33547 () Bool)

(assert (=> b!1040519 (= tp!74243 b_and!33547)))

(declare-fun b!1040517 () Bool)

(declare-fun e!589108 () Bool)

(declare-fun tp_is_empty!24735 () Bool)

(assert (=> b!1040517 (= e!589108 tp_is_empty!24735)))

(declare-fun b!1040518 () Bool)

(declare-fun e!589105 () Bool)

(declare-fun e!589109 () Bool)

(assert (=> b!1040518 (= e!589105 e!589109)))

(declare-fun res!693704 () Bool)

(assert (=> b!1040518 (=> (not res!693704) (not e!589109))))

(declare-datatypes ((SeekEntryResult!9797 0))(
  ( (MissingZero!9797 (index!41559 (_ BitVec 32))) (Found!9797 (index!41560 (_ BitVec 32))) (Intermediate!9797 (undefined!10609 Bool) (index!41561 (_ BitVec 32)) (x!92885 (_ BitVec 32))) (Undefined!9797) (MissingVacant!9797 (index!41562 (_ BitVec 32))) )
))
(declare-fun lt!458580 () SeekEntryResult!9797)

(get-info :version)

(assert (=> b!1040518 (= res!693704 ((_ is Found!9797) lt!458580))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37853 0))(
  ( (V!37854 (val!12418 Int)) )
))
(declare-datatypes ((ValueCell!11664 0))(
  ( (ValueCellFull!11664 (v!15005 V!37853)) (EmptyCell!11664) )
))
(declare-datatypes ((array!65608 0))(
  ( (array!65609 (arr!31569 (Array (_ BitVec 32) (_ BitVec 64))) (size!32100 (_ BitVec 32))) )
))
(declare-datatypes ((array!65610 0))(
  ( (array!65611 (arr!31570 (Array (_ BitVec 32) ValueCell!11664)) (size!32101 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5922 0))(
  ( (LongMapFixedSize!5923 (defaultEntry!6343 Int) (mask!30339 (_ BitVec 32)) (extraKeys!6071 (_ BitVec 32)) (zeroValue!6177 V!37853) (minValue!6177 V!37853) (_size!3016 (_ BitVec 32)) (_keys!11565 array!65608) (_values!6366 array!65610) (_vacant!3016 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5922)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65608 (_ BitVec 32)) SeekEntryResult!9797)

(assert (=> b!1040518 (= lt!458580 (seekEntry!0 key!909 (_keys!11565 thiss!1427) (mask!30339 thiss!1427)))))

(declare-fun e!589107 () Bool)

(declare-fun e!589111 () Bool)

(declare-fun array_inv!24395 (array!65608) Bool)

(declare-fun array_inv!24396 (array!65610) Bool)

(assert (=> b!1040519 (= e!589111 (and tp!74243 tp_is_empty!24735 (array_inv!24395 (_keys!11565 thiss!1427)) (array_inv!24396 (_values!6366 thiss!1427)) e!589107))))

(declare-fun b!1040520 () Bool)

(declare-fun mapRes!38683 () Bool)

(assert (=> b!1040520 (= e!589107 (and e!589108 mapRes!38683))))

(declare-fun condMapEmpty!38683 () Bool)

(declare-fun mapDefault!38683 () ValueCell!11664)

(assert (=> b!1040520 (= condMapEmpty!38683 (= (arr!31570 (_values!6366 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11664)) mapDefault!38683)))))

(declare-fun b!1040521 () Bool)

(declare-fun res!693703 () Bool)

(declare-fun e!589112 () Bool)

(assert (=> b!1040521 (=> res!693703 e!589112)))

(declare-datatypes ((List!21960 0))(
  ( (Nil!21957) (Cons!21956 (h!23160 (_ BitVec 64)) (t!31174 List!21960)) )
))
(declare-fun arrayNoDuplicates!0 (array!65608 (_ BitVec 32) List!21960) Bool)

(assert (=> b!1040521 (= res!693703 (not (arrayNoDuplicates!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 Nil!21957)))))

(declare-fun mapNonEmpty!38683 () Bool)

(declare-fun tp!74242 () Bool)

(declare-fun e!589110 () Bool)

(assert (=> mapNonEmpty!38683 (= mapRes!38683 (and tp!74242 e!589110))))

(declare-fun mapRest!38683 () (Array (_ BitVec 32) ValueCell!11664))

(declare-fun mapKey!38683 () (_ BitVec 32))

(declare-fun mapValue!38683 () ValueCell!11664)

(assert (=> mapNonEmpty!38683 (= (arr!31570 (_values!6366 thiss!1427)) (store mapRest!38683 mapKey!38683 mapValue!38683))))

(declare-fun mapIsEmpty!38683 () Bool)

(assert (=> mapIsEmpty!38683 mapRes!38683))

(declare-fun b!1040523 () Bool)

(assert (=> b!1040523 (= e!589110 tp_is_empty!24735)))

(declare-fun b!1040524 () Bool)

(assert (=> b!1040524 (= e!589109 (not e!589112))))

(declare-fun res!693701 () Bool)

(assert (=> b!1040524 (=> res!693701 e!589112)))

(assert (=> b!1040524 (= res!693701 (or (bvslt (index!41560 lt!458580) #b00000000000000000000000000000000) (bvsge (index!41560 lt!458580) (size!32100 (_keys!11565 thiss!1427))) (bvsge (size!32100 (_keys!11565 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458584 () array!65608)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65608 (_ BitVec 32)) Bool)

(assert (=> b!1040524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458584 (mask!30339 thiss!1427))))

(declare-datatypes ((Unit!34017 0))(
  ( (Unit!34018) )
))
(declare-fun lt!458581 () Unit!34017)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65608 (_ BitVec 32) (_ BitVec 32)) Unit!34017)

(assert (=> b!1040524 (= lt!458581 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11565 thiss!1427) (index!41560 lt!458580) (mask!30339 thiss!1427)))))

(assert (=> b!1040524 (arrayNoDuplicates!0 lt!458584 #b00000000000000000000000000000000 Nil!21957)))

(declare-fun lt!458582 () Unit!34017)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21960) Unit!34017)

(assert (=> b!1040524 (= lt!458582 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11565 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41560 lt!458580) #b00000000000000000000000000000000 Nil!21957))))

(declare-fun arrayCountValidKeys!0 (array!65608 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040524 (= (arrayCountValidKeys!0 lt!458584 #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040524 (= lt!458584 (array!65609 (store (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32100 (_keys!11565 thiss!1427))))))

(declare-fun lt!458583 () Unit!34017)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65608 (_ BitVec 32) (_ BitVec 64)) Unit!34017)

(assert (=> b!1040524 (= lt!458583 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11565 thiss!1427) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040525 () Bool)

(assert (=> b!1040525 (= e!589112 (= (select (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458580)) key!909))))

(declare-fun b!1040526 () Bool)

(declare-fun res!693706 () Bool)

(assert (=> b!1040526 (=> res!693706 e!589112)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040526 (= res!693706 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1040522 () Bool)

(declare-fun res!693705 () Bool)

(assert (=> b!1040522 (=> (not res!693705) (not e!589105))))

(assert (=> b!1040522 (= res!693705 (not (= key!909 (bvneg key!909))))))

(declare-fun res!693702 () Bool)

(assert (=> start!91170 (=> (not res!693702) (not e!589105))))

(declare-fun valid!2223 (LongMapFixedSize!5922) Bool)

(assert (=> start!91170 (= res!693702 (valid!2223 thiss!1427))))

(assert (=> start!91170 e!589105))

(assert (=> start!91170 e!589111))

(assert (=> start!91170 true))

(assert (= (and start!91170 res!693702) b!1040522))

(assert (= (and b!1040522 res!693705) b!1040518))

(assert (= (and b!1040518 res!693704) b!1040524))

(assert (= (and b!1040524 (not res!693701)) b!1040521))

(assert (= (and b!1040521 (not res!693703)) b!1040526))

(assert (= (and b!1040526 (not res!693706)) b!1040525))

(assert (= (and b!1040520 condMapEmpty!38683) mapIsEmpty!38683))

(assert (= (and b!1040520 (not condMapEmpty!38683)) mapNonEmpty!38683))

(assert (= (and mapNonEmpty!38683 ((_ is ValueCellFull!11664) mapValue!38683)) b!1040523))

(assert (= (and b!1040520 ((_ is ValueCellFull!11664) mapDefault!38683)) b!1040517))

(assert (= b!1040519 b!1040520))

(assert (= start!91170 b!1040519))

(declare-fun m!960059 () Bool)

(assert (=> b!1040526 m!960059))

(declare-fun m!960061 () Bool)

(assert (=> start!91170 m!960061))

(declare-fun m!960063 () Bool)

(assert (=> mapNonEmpty!38683 m!960063))

(declare-fun m!960065 () Bool)

(assert (=> b!1040518 m!960065))

(declare-fun m!960067 () Bool)

(assert (=> b!1040525 m!960067))

(declare-fun m!960069 () Bool)

(assert (=> b!1040524 m!960069))

(declare-fun m!960071 () Bool)

(assert (=> b!1040524 m!960071))

(declare-fun m!960073 () Bool)

(assert (=> b!1040524 m!960073))

(declare-fun m!960075 () Bool)

(assert (=> b!1040524 m!960075))

(declare-fun m!960077 () Bool)

(assert (=> b!1040524 m!960077))

(declare-fun m!960079 () Bool)

(assert (=> b!1040524 m!960079))

(declare-fun m!960081 () Bool)

(assert (=> b!1040524 m!960081))

(declare-fun m!960083 () Bool)

(assert (=> b!1040524 m!960083))

(declare-fun m!960085 () Bool)

(assert (=> b!1040519 m!960085))

(declare-fun m!960087 () Bool)

(assert (=> b!1040519 m!960087))

(declare-fun m!960089 () Bool)

(assert (=> b!1040521 m!960089))

(check-sat (not b!1040519) (not b!1040518) (not start!91170) (not b_next!21015) (not b!1040524) (not b!1040526) tp_is_empty!24735 b_and!33547 (not b!1040521) (not mapNonEmpty!38683))
(check-sat b_and!33547 (not b_next!21015))
(get-model)

(declare-fun d!125661 () Bool)

(assert (=> d!125661 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040526 d!125661))

(declare-fun b!1040569 () Bool)

(declare-fun e!589143 () SeekEntryResult!9797)

(declare-fun lt!458608 () SeekEntryResult!9797)

(assert (=> b!1040569 (= e!589143 (MissingZero!9797 (index!41561 lt!458608)))))

(declare-fun b!1040570 () Bool)

(declare-fun lt!458609 () SeekEntryResult!9797)

(assert (=> b!1040570 (= e!589143 (ite ((_ is MissingVacant!9797) lt!458609) (MissingZero!9797 (index!41562 lt!458609)) lt!458609))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65608 (_ BitVec 32)) SeekEntryResult!9797)

(assert (=> b!1040570 (= lt!458609 (seekKeyOrZeroReturnVacant!0 (x!92885 lt!458608) (index!41561 lt!458608) (index!41561 lt!458608) key!909 (_keys!11565 thiss!1427) (mask!30339 thiss!1427)))))

(declare-fun b!1040571 () Bool)

(declare-fun e!589145 () SeekEntryResult!9797)

(declare-fun e!589144 () SeekEntryResult!9797)

(assert (=> b!1040571 (= e!589145 e!589144)))

(declare-fun lt!458610 () (_ BitVec 64))

(assert (=> b!1040571 (= lt!458610 (select (arr!31569 (_keys!11565 thiss!1427)) (index!41561 lt!458608)))))

(declare-fun c!105498 () Bool)

(assert (=> b!1040571 (= c!105498 (= lt!458610 key!909))))

(declare-fun b!1040572 () Bool)

(assert (=> b!1040572 (= e!589145 Undefined!9797)))

(declare-fun d!125663 () Bool)

(declare-fun lt!458611 () SeekEntryResult!9797)

(assert (=> d!125663 (and (or ((_ is MissingVacant!9797) lt!458611) (not ((_ is Found!9797) lt!458611)) (and (bvsge (index!41560 lt!458611) #b00000000000000000000000000000000) (bvslt (index!41560 lt!458611) (size!32100 (_keys!11565 thiss!1427))))) (not ((_ is MissingVacant!9797) lt!458611)) (or (not ((_ is Found!9797) lt!458611)) (= (select (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458611)) key!909)))))

(assert (=> d!125663 (= lt!458611 e!589145)))

(declare-fun c!105497 () Bool)

(assert (=> d!125663 (= c!105497 (and ((_ is Intermediate!9797) lt!458608) (undefined!10609 lt!458608)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65608 (_ BitVec 32)) SeekEntryResult!9797)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125663 (= lt!458608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30339 thiss!1427)) key!909 (_keys!11565 thiss!1427) (mask!30339 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125663 (validMask!0 (mask!30339 thiss!1427))))

(assert (=> d!125663 (= (seekEntry!0 key!909 (_keys!11565 thiss!1427) (mask!30339 thiss!1427)) lt!458611)))

(declare-fun b!1040573 () Bool)

(declare-fun c!105499 () Bool)

(assert (=> b!1040573 (= c!105499 (= lt!458610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040573 (= e!589144 e!589143)))

(declare-fun b!1040574 () Bool)

(assert (=> b!1040574 (= e!589144 (Found!9797 (index!41561 lt!458608)))))

(assert (= (and d!125663 c!105497) b!1040572))

(assert (= (and d!125663 (not c!105497)) b!1040571))

(assert (= (and b!1040571 c!105498) b!1040574))

(assert (= (and b!1040571 (not c!105498)) b!1040573))

(assert (= (and b!1040573 c!105499) b!1040569))

(assert (= (and b!1040573 (not c!105499)) b!1040570))

(declare-fun m!960123 () Bool)

(assert (=> b!1040570 m!960123))

(declare-fun m!960125 () Bool)

(assert (=> b!1040571 m!960125))

(declare-fun m!960127 () Bool)

(assert (=> d!125663 m!960127))

(declare-fun m!960129 () Bool)

(assert (=> d!125663 m!960129))

(assert (=> d!125663 m!960129))

(declare-fun m!960131 () Bool)

(assert (=> d!125663 m!960131))

(declare-fun m!960133 () Bool)

(assert (=> d!125663 m!960133))

(assert (=> b!1040518 d!125663))

(declare-fun d!125665 () Bool)

(assert (=> d!125665 (= (array_inv!24395 (_keys!11565 thiss!1427)) (bvsge (size!32100 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040519 d!125665))

(declare-fun d!125667 () Bool)

(assert (=> d!125667 (= (array_inv!24396 (_values!6366 thiss!1427)) (bvsge (size!32101 (_values!6366 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040519 d!125667))

(declare-fun b!1040585 () Bool)

(declare-fun e!589154 () Bool)

(declare-fun contains!6050 (List!21960 (_ BitVec 64)) Bool)

(assert (=> b!1040585 (= e!589154 (contains!6050 Nil!21957 (select (arr!31569 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125669 () Bool)

(declare-fun res!693731 () Bool)

(declare-fun e!589155 () Bool)

(assert (=> d!125669 (=> res!693731 e!589155)))

(assert (=> d!125669 (= res!693731 (bvsge #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))))))

(assert (=> d!125669 (= (arrayNoDuplicates!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 Nil!21957) e!589155)))

(declare-fun b!1040586 () Bool)

(declare-fun e!589156 () Bool)

(declare-fun call!44059 () Bool)

(assert (=> b!1040586 (= e!589156 call!44059)))

(declare-fun b!1040587 () Bool)

(declare-fun e!589157 () Bool)

(assert (=> b!1040587 (= e!589157 e!589156)))

(declare-fun c!105502 () Bool)

(assert (=> b!1040587 (= c!105502 (validKeyInArray!0 (select (arr!31569 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040588 () Bool)

(assert (=> b!1040588 (= e!589156 call!44059)))

(declare-fun b!1040589 () Bool)

(assert (=> b!1040589 (= e!589155 e!589157)))

(declare-fun res!693733 () Bool)

(assert (=> b!1040589 (=> (not res!693733) (not e!589157))))

(assert (=> b!1040589 (= res!693733 (not e!589154))))

(declare-fun res!693732 () Bool)

(assert (=> b!1040589 (=> (not res!693732) (not e!589154))))

(assert (=> b!1040589 (= res!693732 (validKeyInArray!0 (select (arr!31569 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44056 () Bool)

(assert (=> bm!44056 (= call!44059 (arrayNoDuplicates!0 (_keys!11565 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105502 (Cons!21956 (select (arr!31569 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000) Nil!21957) Nil!21957)))))

(assert (= (and d!125669 (not res!693731)) b!1040589))

(assert (= (and b!1040589 res!693732) b!1040585))

(assert (= (and b!1040589 res!693733) b!1040587))

(assert (= (and b!1040587 c!105502) b!1040586))

(assert (= (and b!1040587 (not c!105502)) b!1040588))

(assert (= (or b!1040586 b!1040588) bm!44056))

(declare-fun m!960135 () Bool)

(assert (=> b!1040585 m!960135))

(assert (=> b!1040585 m!960135))

(declare-fun m!960137 () Bool)

(assert (=> b!1040585 m!960137))

(assert (=> b!1040587 m!960135))

(assert (=> b!1040587 m!960135))

(declare-fun m!960139 () Bool)

(assert (=> b!1040587 m!960139))

(assert (=> b!1040589 m!960135))

(assert (=> b!1040589 m!960135))

(assert (=> b!1040589 m!960139))

(assert (=> bm!44056 m!960135))

(declare-fun m!960141 () Bool)

(assert (=> bm!44056 m!960141))

(assert (=> b!1040521 d!125669))

(declare-fun d!125671 () Bool)

(declare-fun res!693740 () Bool)

(declare-fun e!589160 () Bool)

(assert (=> d!125671 (=> (not res!693740) (not e!589160))))

(declare-fun simpleValid!434 (LongMapFixedSize!5922) Bool)

(assert (=> d!125671 (= res!693740 (simpleValid!434 thiss!1427))))

(assert (=> d!125671 (= (valid!2223 thiss!1427) e!589160)))

(declare-fun b!1040596 () Bool)

(declare-fun res!693741 () Bool)

(assert (=> b!1040596 (=> (not res!693741) (not e!589160))))

(assert (=> b!1040596 (= res!693741 (= (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) (_size!3016 thiss!1427)))))

(declare-fun b!1040597 () Bool)

(declare-fun res!693742 () Bool)

(assert (=> b!1040597 (=> (not res!693742) (not e!589160))))

(assert (=> b!1040597 (= res!693742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11565 thiss!1427) (mask!30339 thiss!1427)))))

(declare-fun b!1040598 () Bool)

(assert (=> b!1040598 (= e!589160 (arrayNoDuplicates!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 Nil!21957))))

(assert (= (and d!125671 res!693740) b!1040596))

(assert (= (and b!1040596 res!693741) b!1040597))

(assert (= (and b!1040597 res!693742) b!1040598))

(declare-fun m!960143 () Bool)

(assert (=> d!125671 m!960143))

(assert (=> b!1040596 m!960081))

(declare-fun m!960145 () Bool)

(assert (=> b!1040597 m!960145))

(assert (=> b!1040598 m!960089))

(assert (=> start!91170 d!125671))

(declare-fun b!1040608 () Bool)

(declare-fun res!693753 () Bool)

(declare-fun e!589165 () Bool)

(assert (=> b!1040608 (=> (not res!693753) (not e!589165))))

(assert (=> b!1040608 (= res!693753 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125673 () Bool)

(declare-fun e!589166 () Bool)

(assert (=> d!125673 e!589166))

(declare-fun res!693752 () Bool)

(assert (=> d!125673 (=> (not res!693752) (not e!589166))))

(assert (=> d!125673 (= res!693752 (and (bvsge (index!41560 lt!458580) #b00000000000000000000000000000000) (bvslt (index!41560 lt!458580) (size!32100 (_keys!11565 thiss!1427)))))))

(declare-fun lt!458614 () Unit!34017)

(declare-fun choose!82 (array!65608 (_ BitVec 32) (_ BitVec 64)) Unit!34017)

(assert (=> d!125673 (= lt!458614 (choose!82 (_keys!11565 thiss!1427) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125673 e!589165))

(declare-fun res!693754 () Bool)

(assert (=> d!125673 (=> (not res!693754) (not e!589165))))

(assert (=> d!125673 (= res!693754 (and (bvsge (index!41560 lt!458580) #b00000000000000000000000000000000) (bvslt (index!41560 lt!458580) (size!32100 (_keys!11565 thiss!1427)))))))

(assert (=> d!125673 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11565 thiss!1427) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458614)))

(declare-fun b!1040609 () Bool)

(assert (=> b!1040609 (= e!589165 (bvslt (size!32100 (_keys!11565 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040610 () Bool)

(assert (=> b!1040610 (= e!589166 (= (arrayCountValidKeys!0 (array!65609 (store (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32100 (_keys!11565 thiss!1427))) #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040607 () Bool)

(declare-fun res!693751 () Bool)

(assert (=> b!1040607 (=> (not res!693751) (not e!589165))))

(assert (=> b!1040607 (= res!693751 (validKeyInArray!0 (select (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458580))))))

(assert (= (and d!125673 res!693754) b!1040607))

(assert (= (and b!1040607 res!693751) b!1040608))

(assert (= (and b!1040608 res!693753) b!1040609))

(assert (= (and d!125673 res!693752) b!1040610))

(declare-fun m!960147 () Bool)

(assert (=> b!1040608 m!960147))

(declare-fun m!960149 () Bool)

(assert (=> d!125673 m!960149))

(assert (=> b!1040610 m!960073))

(declare-fun m!960151 () Bool)

(assert (=> b!1040610 m!960151))

(assert (=> b!1040610 m!960081))

(assert (=> b!1040607 m!960067))

(assert (=> b!1040607 m!960067))

(declare-fun m!960153 () Bool)

(assert (=> b!1040607 m!960153))

(assert (=> b!1040524 d!125673))

(declare-fun b!1040619 () Bool)

(declare-fun e!589171 () (_ BitVec 32))

(declare-fun call!44062 () (_ BitVec 32))

(assert (=> b!1040619 (= e!589171 call!44062)))

(declare-fun d!125675 () Bool)

(declare-fun lt!458617 () (_ BitVec 32))

(assert (=> d!125675 (and (bvsge lt!458617 #b00000000000000000000000000000000) (bvsle lt!458617 (bvsub (size!32100 lt!458584) #b00000000000000000000000000000000)))))

(declare-fun e!589172 () (_ BitVec 32))

(assert (=> d!125675 (= lt!458617 e!589172)))

(declare-fun c!105508 () Bool)

(assert (=> d!125675 (= c!105508 (bvsge #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))))))

(assert (=> d!125675 (and (bvsle #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32100 (_keys!11565 thiss!1427)) (size!32100 lt!458584)))))

(assert (=> d!125675 (= (arrayCountValidKeys!0 lt!458584 #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) lt!458617)))

(declare-fun b!1040620 () Bool)

(assert (=> b!1040620 (= e!589172 e!589171)))

(declare-fun c!105507 () Bool)

(assert (=> b!1040620 (= c!105507 (validKeyInArray!0 (select (arr!31569 lt!458584) #b00000000000000000000000000000000)))))

(declare-fun bm!44059 () Bool)

(assert (=> bm!44059 (= call!44062 (arrayCountValidKeys!0 lt!458584 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32100 (_keys!11565 thiss!1427))))))

(declare-fun b!1040621 () Bool)

(assert (=> b!1040621 (= e!589171 (bvadd #b00000000000000000000000000000001 call!44062))))

(declare-fun b!1040622 () Bool)

(assert (=> b!1040622 (= e!589172 #b00000000000000000000000000000000)))

(assert (= (and d!125675 c!105508) b!1040622))

(assert (= (and d!125675 (not c!105508)) b!1040620))

(assert (= (and b!1040620 c!105507) b!1040621))

(assert (= (and b!1040620 (not c!105507)) b!1040619))

(assert (= (or b!1040621 b!1040619) bm!44059))

(declare-fun m!960155 () Bool)

(assert (=> b!1040620 m!960155))

(assert (=> b!1040620 m!960155))

(declare-fun m!960157 () Bool)

(assert (=> b!1040620 m!960157))

(declare-fun m!960159 () Bool)

(assert (=> bm!44059 m!960159))

(assert (=> b!1040524 d!125675))

(declare-fun b!1040631 () Bool)

(declare-fun e!589179 () Bool)

(declare-fun call!44065 () Bool)

(assert (=> b!1040631 (= e!589179 call!44065)))

(declare-fun bm!44062 () Bool)

(assert (=> bm!44062 (= call!44065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458584 (mask!30339 thiss!1427)))))

(declare-fun b!1040633 () Bool)

(declare-fun e!589180 () Bool)

(assert (=> b!1040633 (= e!589179 e!589180)))

(declare-fun lt!458625 () (_ BitVec 64))

(assert (=> b!1040633 (= lt!458625 (select (arr!31569 lt!458584) #b00000000000000000000000000000000))))

(declare-fun lt!458626 () Unit!34017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65608 (_ BitVec 64) (_ BitVec 32)) Unit!34017)

(assert (=> b!1040633 (= lt!458626 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458584 lt!458625 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040633 (arrayContainsKey!0 lt!458584 lt!458625 #b00000000000000000000000000000000)))

(declare-fun lt!458624 () Unit!34017)

(assert (=> b!1040633 (= lt!458624 lt!458626)))

(declare-fun res!693760 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65608 (_ BitVec 32)) SeekEntryResult!9797)

(assert (=> b!1040633 (= res!693760 (= (seekEntryOrOpen!0 (select (arr!31569 lt!458584) #b00000000000000000000000000000000) lt!458584 (mask!30339 thiss!1427)) (Found!9797 #b00000000000000000000000000000000)))))

(assert (=> b!1040633 (=> (not res!693760) (not e!589180))))

(declare-fun b!1040634 () Bool)

(declare-fun e!589181 () Bool)

(assert (=> b!1040634 (= e!589181 e!589179)))

(declare-fun c!105511 () Bool)

(assert (=> b!1040634 (= c!105511 (validKeyInArray!0 (select (arr!31569 lt!458584) #b00000000000000000000000000000000)))))

(declare-fun b!1040632 () Bool)

(assert (=> b!1040632 (= e!589180 call!44065)))

(declare-fun d!125677 () Bool)

(declare-fun res!693759 () Bool)

(assert (=> d!125677 (=> res!693759 e!589181)))

(assert (=> d!125677 (= res!693759 (bvsge #b00000000000000000000000000000000 (size!32100 lt!458584)))))

(assert (=> d!125677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458584 (mask!30339 thiss!1427)) e!589181)))

(assert (= (and d!125677 (not res!693759)) b!1040634))

(assert (= (and b!1040634 c!105511) b!1040633))

(assert (= (and b!1040634 (not c!105511)) b!1040631))

(assert (= (and b!1040633 res!693760) b!1040632))

(assert (= (or b!1040632 b!1040631) bm!44062))

(declare-fun m!960161 () Bool)

(assert (=> bm!44062 m!960161))

(assert (=> b!1040633 m!960155))

(declare-fun m!960163 () Bool)

(assert (=> b!1040633 m!960163))

(declare-fun m!960165 () Bool)

(assert (=> b!1040633 m!960165))

(assert (=> b!1040633 m!960155))

(declare-fun m!960167 () Bool)

(assert (=> b!1040633 m!960167))

(assert (=> b!1040634 m!960155))

(assert (=> b!1040634 m!960155))

(assert (=> b!1040634 m!960157))

(assert (=> b!1040524 d!125677))

(declare-fun b!1040635 () Bool)

(declare-fun e!589182 () Bool)

(assert (=> b!1040635 (= e!589182 (contains!6050 Nil!21957 (select (arr!31569 lt!458584) #b00000000000000000000000000000000)))))

(declare-fun d!125679 () Bool)

(declare-fun res!693761 () Bool)

(declare-fun e!589183 () Bool)

(assert (=> d!125679 (=> res!693761 e!589183)))

(assert (=> d!125679 (= res!693761 (bvsge #b00000000000000000000000000000000 (size!32100 lt!458584)))))

(assert (=> d!125679 (= (arrayNoDuplicates!0 lt!458584 #b00000000000000000000000000000000 Nil!21957) e!589183)))

(declare-fun b!1040636 () Bool)

(declare-fun e!589184 () Bool)

(declare-fun call!44066 () Bool)

(assert (=> b!1040636 (= e!589184 call!44066)))

(declare-fun b!1040637 () Bool)

(declare-fun e!589185 () Bool)

(assert (=> b!1040637 (= e!589185 e!589184)))

(declare-fun c!105512 () Bool)

(assert (=> b!1040637 (= c!105512 (validKeyInArray!0 (select (arr!31569 lt!458584) #b00000000000000000000000000000000)))))

(declare-fun b!1040638 () Bool)

(assert (=> b!1040638 (= e!589184 call!44066)))

(declare-fun b!1040639 () Bool)

(assert (=> b!1040639 (= e!589183 e!589185)))

(declare-fun res!693763 () Bool)

(assert (=> b!1040639 (=> (not res!693763) (not e!589185))))

(assert (=> b!1040639 (= res!693763 (not e!589182))))

(declare-fun res!693762 () Bool)

(assert (=> b!1040639 (=> (not res!693762) (not e!589182))))

(assert (=> b!1040639 (= res!693762 (validKeyInArray!0 (select (arr!31569 lt!458584) #b00000000000000000000000000000000)))))

(declare-fun bm!44063 () Bool)

(assert (=> bm!44063 (= call!44066 (arrayNoDuplicates!0 lt!458584 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105512 (Cons!21956 (select (arr!31569 lt!458584) #b00000000000000000000000000000000) Nil!21957) Nil!21957)))))

(assert (= (and d!125679 (not res!693761)) b!1040639))

(assert (= (and b!1040639 res!693762) b!1040635))

(assert (= (and b!1040639 res!693763) b!1040637))

(assert (= (and b!1040637 c!105512) b!1040636))

(assert (= (and b!1040637 (not c!105512)) b!1040638))

(assert (= (or b!1040636 b!1040638) bm!44063))

(assert (=> b!1040635 m!960155))

(assert (=> b!1040635 m!960155))

(declare-fun m!960169 () Bool)

(assert (=> b!1040635 m!960169))

(assert (=> b!1040637 m!960155))

(assert (=> b!1040637 m!960155))

(assert (=> b!1040637 m!960157))

(assert (=> b!1040639 m!960155))

(assert (=> b!1040639 m!960155))

(assert (=> b!1040639 m!960157))

(assert (=> bm!44063 m!960155))

(declare-fun m!960171 () Bool)

(assert (=> bm!44063 m!960171))

(assert (=> b!1040524 d!125679))

(declare-fun d!125681 () Bool)

(declare-fun e!589188 () Bool)

(assert (=> d!125681 e!589188))

(declare-fun res!693766 () Bool)

(assert (=> d!125681 (=> (not res!693766) (not e!589188))))

(assert (=> d!125681 (= res!693766 (and (bvsge (index!41560 lt!458580) #b00000000000000000000000000000000) (bvslt (index!41560 lt!458580) (size!32100 (_keys!11565 thiss!1427)))))))

(declare-fun lt!458629 () Unit!34017)

(declare-fun choose!25 (array!65608 (_ BitVec 32) (_ BitVec 32)) Unit!34017)

(assert (=> d!125681 (= lt!458629 (choose!25 (_keys!11565 thiss!1427) (index!41560 lt!458580) (mask!30339 thiss!1427)))))

(assert (=> d!125681 (validMask!0 (mask!30339 thiss!1427))))

(assert (=> d!125681 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11565 thiss!1427) (index!41560 lt!458580) (mask!30339 thiss!1427)) lt!458629)))

(declare-fun b!1040642 () Bool)

(assert (=> b!1040642 (= e!589188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65609 (store (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32100 (_keys!11565 thiss!1427))) (mask!30339 thiss!1427)))))

(assert (= (and d!125681 res!693766) b!1040642))

(declare-fun m!960173 () Bool)

(assert (=> d!125681 m!960173))

(assert (=> d!125681 m!960133))

(assert (=> b!1040642 m!960073))

(declare-fun m!960175 () Bool)

(assert (=> b!1040642 m!960175))

(assert (=> b!1040524 d!125681))

(declare-fun d!125683 () Bool)

(declare-fun e!589191 () Bool)

(assert (=> d!125683 e!589191))

(declare-fun res!693769 () Bool)

(assert (=> d!125683 (=> (not res!693769) (not e!589191))))

(assert (=> d!125683 (= res!693769 (and (bvsge (index!41560 lt!458580) #b00000000000000000000000000000000) (bvslt (index!41560 lt!458580) (size!32100 (_keys!11565 thiss!1427)))))))

(declare-fun lt!458632 () Unit!34017)

(declare-fun choose!53 (array!65608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21960) Unit!34017)

(assert (=> d!125683 (= lt!458632 (choose!53 (_keys!11565 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41560 lt!458580) #b00000000000000000000000000000000 Nil!21957))))

(assert (=> d!125683 (bvslt (size!32100 (_keys!11565 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125683 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11565 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41560 lt!458580) #b00000000000000000000000000000000 Nil!21957) lt!458632)))

(declare-fun b!1040645 () Bool)

(assert (=> b!1040645 (= e!589191 (arrayNoDuplicates!0 (array!65609 (store (arr!31569 (_keys!11565 thiss!1427)) (index!41560 lt!458580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32100 (_keys!11565 thiss!1427))) #b00000000000000000000000000000000 Nil!21957))))

(assert (= (and d!125683 res!693769) b!1040645))

(declare-fun m!960177 () Bool)

(assert (=> d!125683 m!960177))

(assert (=> b!1040645 m!960073))

(declare-fun m!960179 () Bool)

(assert (=> b!1040645 m!960179))

(assert (=> b!1040524 d!125683))

(declare-fun b!1040646 () Bool)

(declare-fun e!589192 () (_ BitVec 32))

(declare-fun call!44067 () (_ BitVec 32))

(assert (=> b!1040646 (= e!589192 call!44067)))

(declare-fun d!125685 () Bool)

(declare-fun lt!458633 () (_ BitVec 32))

(assert (=> d!125685 (and (bvsge lt!458633 #b00000000000000000000000000000000) (bvsle lt!458633 (bvsub (size!32100 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!589193 () (_ BitVec 32))

(assert (=> d!125685 (= lt!458633 e!589193)))

(declare-fun c!105514 () Bool)

(assert (=> d!125685 (= c!105514 (bvsge #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))))))

(assert (=> d!125685 (and (bvsle #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32100 (_keys!11565 thiss!1427)) (size!32100 (_keys!11565 thiss!1427))))))

(assert (=> d!125685 (= (arrayCountValidKeys!0 (_keys!11565 thiss!1427) #b00000000000000000000000000000000 (size!32100 (_keys!11565 thiss!1427))) lt!458633)))

(declare-fun b!1040647 () Bool)

(assert (=> b!1040647 (= e!589193 e!589192)))

(declare-fun c!105513 () Bool)

(assert (=> b!1040647 (= c!105513 (validKeyInArray!0 (select (arr!31569 (_keys!11565 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44064 () Bool)

(assert (=> bm!44064 (= call!44067 (arrayCountValidKeys!0 (_keys!11565 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32100 (_keys!11565 thiss!1427))))))

(declare-fun b!1040648 () Bool)

(assert (=> b!1040648 (= e!589192 (bvadd #b00000000000000000000000000000001 call!44067))))

(declare-fun b!1040649 () Bool)

(assert (=> b!1040649 (= e!589193 #b00000000000000000000000000000000)))

(assert (= (and d!125685 c!105514) b!1040649))

(assert (= (and d!125685 (not c!105514)) b!1040647))

(assert (= (and b!1040647 c!105513) b!1040648))

(assert (= (and b!1040647 (not c!105513)) b!1040646))

(assert (= (or b!1040648 b!1040646) bm!44064))

(assert (=> b!1040647 m!960135))

(assert (=> b!1040647 m!960135))

(assert (=> b!1040647 m!960139))

(declare-fun m!960181 () Bool)

(assert (=> bm!44064 m!960181))

(assert (=> b!1040524 d!125685))

(declare-fun condMapEmpty!38689 () Bool)

(declare-fun mapDefault!38689 () ValueCell!11664)

(assert (=> mapNonEmpty!38683 (= condMapEmpty!38689 (= mapRest!38683 ((as const (Array (_ BitVec 32) ValueCell!11664)) mapDefault!38689)))))

(declare-fun e!589199 () Bool)

(declare-fun mapRes!38689 () Bool)

(assert (=> mapNonEmpty!38683 (= tp!74242 (and e!589199 mapRes!38689))))

(declare-fun b!1040656 () Bool)

(declare-fun e!589198 () Bool)

(assert (=> b!1040656 (= e!589198 tp_is_empty!24735)))

(declare-fun mapIsEmpty!38689 () Bool)

(assert (=> mapIsEmpty!38689 mapRes!38689))

(declare-fun b!1040657 () Bool)

(assert (=> b!1040657 (= e!589199 tp_is_empty!24735)))

(declare-fun mapNonEmpty!38689 () Bool)

(declare-fun tp!74252 () Bool)

(assert (=> mapNonEmpty!38689 (= mapRes!38689 (and tp!74252 e!589198))))

(declare-fun mapKey!38689 () (_ BitVec 32))

(declare-fun mapRest!38689 () (Array (_ BitVec 32) ValueCell!11664))

(declare-fun mapValue!38689 () ValueCell!11664)

(assert (=> mapNonEmpty!38689 (= mapRest!38683 (store mapRest!38689 mapKey!38689 mapValue!38689))))

(assert (= (and mapNonEmpty!38683 condMapEmpty!38689) mapIsEmpty!38689))

(assert (= (and mapNonEmpty!38683 (not condMapEmpty!38689)) mapNonEmpty!38689))

(assert (= (and mapNonEmpty!38689 ((_ is ValueCellFull!11664) mapValue!38689)) b!1040656))

(assert (= (and mapNonEmpty!38683 ((_ is ValueCellFull!11664) mapDefault!38689)) b!1040657))

(declare-fun m!960183 () Bool)

(assert (=> mapNonEmpty!38689 m!960183))

(check-sat (not b!1040607) (not bm!44063) (not d!125673) tp_is_empty!24735 (not b!1040639) (not b!1040608) (not b!1040589) (not bm!44059) (not b!1040596) (not bm!44062) (not b!1040598) (not d!125683) (not b!1040597) (not b!1040647) (not b!1040633) (not bm!44056) (not b!1040570) (not b!1040585) (not b!1040635) (not b_next!21015) (not b!1040645) (not bm!44064) (not mapNonEmpty!38689) b_and!33547 (not b!1040610) (not b!1040587) (not d!125681) (not b!1040620) (not b!1040634) (not d!125663) (not b!1040642) (not d!125671) (not b!1040637))
(check-sat b_and!33547 (not b_next!21015))
