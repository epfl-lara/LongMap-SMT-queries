; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90742 () Bool)

(assert start!90742)

(declare-fun b!1037533 () Bool)

(declare-fun b_free!20907 () Bool)

(declare-fun b_next!20907 () Bool)

(assert (=> b!1037533 (= b_free!20907 (not b_next!20907))))

(declare-fun tp!73870 () Bool)

(declare-fun b_and!33439 () Bool)

(assert (=> b!1037533 (= tp!73870 b_and!33439)))

(declare-fun b!1037527 () Bool)

(declare-fun e!586929 () Bool)

(declare-fun e!586930 () Bool)

(assert (=> b!1037527 (= e!586929 e!586930)))

(declare-fun res!692220 () Bool)

(assert (=> b!1037527 (=> (not res!692220) (not e!586930))))

(declare-datatypes ((SeekEntryResult!9757 0))(
  ( (MissingZero!9757 (index!41399 (_ BitVec 32))) (Found!9757 (index!41400 (_ BitVec 32))) (Intermediate!9757 (undefined!10569 Bool) (index!41401 (_ BitVec 32)) (x!92564 (_ BitVec 32))) (Undefined!9757) (MissingVacant!9757 (index!41402 (_ BitVec 32))) )
))
(declare-fun lt!457517 () SeekEntryResult!9757)

(get-info :version)

(assert (=> b!1037527 (= res!692220 ((_ is Found!9757) lt!457517))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37709 0))(
  ( (V!37710 (val!12364 Int)) )
))
(declare-datatypes ((ValueCell!11610 0))(
  ( (ValueCellFull!11610 (v!14947 V!37709)) (EmptyCell!11610) )
))
(declare-datatypes ((array!65360 0))(
  ( (array!65361 (arr!31461 (Array (_ BitVec 32) (_ BitVec 64))) (size!31991 (_ BitVec 32))) )
))
(declare-datatypes ((array!65362 0))(
  ( (array!65363 (arr!31462 (Array (_ BitVec 32) ValueCell!11610)) (size!31992 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5814 0))(
  ( (LongMapFixedSize!5815 (defaultEntry!6289 Int) (mask!30211 (_ BitVec 32)) (extraKeys!6017 (_ BitVec 32)) (zeroValue!6123 V!37709) (minValue!6123 V!37709) (_size!2962 (_ BitVec 32)) (_keys!11486 array!65360) (_values!6312 array!65362) (_vacant!2962 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5814)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65360 (_ BitVec 32)) SeekEntryResult!9757)

(assert (=> b!1037527 (= lt!457517 (seekEntry!0 key!909 (_keys!11486 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun b!1037528 () Bool)

(declare-fun e!586927 () Bool)

(declare-fun tp_is_empty!24627 () Bool)

(assert (=> b!1037528 (= e!586927 tp_is_empty!24627)))

(declare-fun mapIsEmpty!38472 () Bool)

(declare-fun mapRes!38472 () Bool)

(assert (=> mapIsEmpty!38472 mapRes!38472))

(declare-fun b!1037529 () Bool)

(declare-fun e!586928 () Bool)

(declare-datatypes ((List!21924 0))(
  ( (Nil!21921) (Cons!21920 (h!23123 (_ BitVec 64)) (t!31138 List!21924)) )
))
(declare-fun noDuplicate!1474 (List!21924) Bool)

(assert (=> b!1037529 (= e!586928 (noDuplicate!1474 Nil!21921))))

(declare-fun b!1037530 () Bool)

(assert (=> b!1037530 (= e!586930 (not e!586928))))

(declare-fun res!692223 () Bool)

(assert (=> b!1037530 (=> res!692223 e!586928)))

(assert (=> b!1037530 (= res!692223 (or (bvsge (size!31991 (_keys!11486 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65360 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037530 (= (arrayCountValidKeys!0 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427))) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11486 thiss!1427) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33955 0))(
  ( (Unit!33956) )
))
(declare-fun lt!457518 () Unit!33955)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65360 (_ BitVec 32) (_ BitVec 64)) Unit!33955)

(assert (=> b!1037530 (= lt!457518 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11486 thiss!1427) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037531 () Bool)

(declare-fun e!586926 () Bool)

(assert (=> b!1037531 (= e!586926 (and e!586927 mapRes!38472))))

(declare-fun condMapEmpty!38472 () Bool)

(declare-fun mapDefault!38472 () ValueCell!11610)

(assert (=> b!1037531 (= condMapEmpty!38472 (= (arr!31462 (_values!6312 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11610)) mapDefault!38472)))))

(declare-fun b!1037532 () Bool)

(declare-fun e!586931 () Bool)

(assert (=> b!1037532 (= e!586931 tp_is_empty!24627)))

(declare-fun e!586925 () Bool)

(declare-fun array_inv!24333 (array!65360) Bool)

(declare-fun array_inv!24334 (array!65362) Bool)

(assert (=> b!1037533 (= e!586925 (and tp!73870 tp_is_empty!24627 (array_inv!24333 (_keys!11486 thiss!1427)) (array_inv!24334 (_values!6312 thiss!1427)) e!586926))))

(declare-fun b!1037534 () Bool)

(declare-fun res!692221 () Bool)

(assert (=> b!1037534 (=> (not res!692221) (not e!586929))))

(assert (=> b!1037534 (= res!692221 (not (= key!909 (bvneg key!909))))))

(declare-fun res!692222 () Bool)

(assert (=> start!90742 (=> (not res!692222) (not e!586929))))

(declare-fun valid!2192 (LongMapFixedSize!5814) Bool)

(assert (=> start!90742 (= res!692222 (valid!2192 thiss!1427))))

(assert (=> start!90742 e!586929))

(assert (=> start!90742 e!586925))

(assert (=> start!90742 true))

(declare-fun mapNonEmpty!38472 () Bool)

(declare-fun tp!73869 () Bool)

(assert (=> mapNonEmpty!38472 (= mapRes!38472 (and tp!73869 e!586931))))

(declare-fun mapValue!38472 () ValueCell!11610)

(declare-fun mapRest!38472 () (Array (_ BitVec 32) ValueCell!11610))

(declare-fun mapKey!38472 () (_ BitVec 32))

(assert (=> mapNonEmpty!38472 (= (arr!31462 (_values!6312 thiss!1427)) (store mapRest!38472 mapKey!38472 mapValue!38472))))

(assert (= (and start!90742 res!692222) b!1037534))

(assert (= (and b!1037534 res!692221) b!1037527))

(assert (= (and b!1037527 res!692220) b!1037530))

(assert (= (and b!1037530 (not res!692223)) b!1037529))

(assert (= (and b!1037531 condMapEmpty!38472) mapIsEmpty!38472))

(assert (= (and b!1037531 (not condMapEmpty!38472)) mapNonEmpty!38472))

(assert (= (and mapNonEmpty!38472 ((_ is ValueCellFull!11610) mapValue!38472)) b!1037532))

(assert (= (and b!1037531 ((_ is ValueCellFull!11610) mapDefault!38472)) b!1037528))

(assert (= b!1037533 b!1037531))

(assert (= start!90742 b!1037533))

(declare-fun m!957715 () Bool)

(assert (=> b!1037530 m!957715))

(declare-fun m!957717 () Bool)

(assert (=> b!1037530 m!957717))

(declare-fun m!957719 () Bool)

(assert (=> b!1037530 m!957719))

(declare-fun m!957721 () Bool)

(assert (=> b!1037530 m!957721))

(declare-fun m!957723 () Bool)

(assert (=> start!90742 m!957723))

(declare-fun m!957725 () Bool)

(assert (=> mapNonEmpty!38472 m!957725))

(declare-fun m!957727 () Bool)

(assert (=> b!1037533 m!957727))

(declare-fun m!957729 () Bool)

(assert (=> b!1037533 m!957729))

(declare-fun m!957731 () Bool)

(assert (=> b!1037529 m!957731))

(declare-fun m!957733 () Bool)

(assert (=> b!1037527 m!957733))

(check-sat (not mapNonEmpty!38472) (not b!1037533) tp_is_empty!24627 (not b!1037527) b_and!33439 (not b!1037529) (not b_next!20907) (not start!90742) (not b!1037530))
(check-sat b_and!33439 (not b_next!20907))
(get-model)

(declare-fun d!125241 () Bool)

(assert (=> d!125241 (= (array_inv!24333 (_keys!11486 thiss!1427)) (bvsge (size!31991 (_keys!11486 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037533 d!125241))

(declare-fun d!125243 () Bool)

(assert (=> d!125243 (= (array_inv!24334 (_values!6312 thiss!1427)) (bvsge (size!31992 (_values!6312 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037533 d!125243))

(declare-fun d!125245 () Bool)

(declare-fun res!692242 () Bool)

(declare-fun e!586959 () Bool)

(assert (=> d!125245 (=> (not res!692242) (not e!586959))))

(declare-fun simpleValid!418 (LongMapFixedSize!5814) Bool)

(assert (=> d!125245 (= res!692242 (simpleValid!418 thiss!1427))))

(assert (=> d!125245 (= (valid!2192 thiss!1427) e!586959)))

(declare-fun b!1037565 () Bool)

(declare-fun res!692243 () Bool)

(assert (=> b!1037565 (=> (not res!692243) (not e!586959))))

(assert (=> b!1037565 (= res!692243 (= (arrayCountValidKeys!0 (_keys!11486 thiss!1427) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) (_size!2962 thiss!1427)))))

(declare-fun b!1037566 () Bool)

(declare-fun res!692244 () Bool)

(assert (=> b!1037566 (=> (not res!692244) (not e!586959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65360 (_ BitVec 32)) Bool)

(assert (=> b!1037566 (= res!692244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11486 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun b!1037567 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65360 (_ BitVec 32) List!21924) Bool)

(assert (=> b!1037567 (= e!586959 (arrayNoDuplicates!0 (_keys!11486 thiss!1427) #b00000000000000000000000000000000 Nil!21921))))

(assert (= (and d!125245 res!692242) b!1037565))

(assert (= (and b!1037565 res!692243) b!1037566))

(assert (= (and b!1037566 res!692244) b!1037567))

(declare-fun m!957755 () Bool)

(assert (=> d!125245 m!957755))

(assert (=> b!1037565 m!957719))

(declare-fun m!957757 () Bool)

(assert (=> b!1037566 m!957757))

(declare-fun m!957759 () Bool)

(assert (=> b!1037567 m!957759))

(assert (=> start!90742 d!125245))

(declare-fun b!1037580 () Bool)

(declare-fun e!586968 () SeekEntryResult!9757)

(declare-fun lt!457533 () SeekEntryResult!9757)

(assert (=> b!1037580 (= e!586968 (Found!9757 (index!41401 lt!457533)))))

(declare-fun d!125247 () Bool)

(declare-fun lt!457535 () SeekEntryResult!9757)

(assert (=> d!125247 (and (or ((_ is MissingVacant!9757) lt!457535) (not ((_ is Found!9757) lt!457535)) (and (bvsge (index!41400 lt!457535) #b00000000000000000000000000000000) (bvslt (index!41400 lt!457535) (size!31991 (_keys!11486 thiss!1427))))) (not ((_ is MissingVacant!9757) lt!457535)) (or (not ((_ is Found!9757) lt!457535)) (= (select (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457535)) key!909)))))

(declare-fun e!586967 () SeekEntryResult!9757)

(assert (=> d!125247 (= lt!457535 e!586967)))

(declare-fun c!105131 () Bool)

(assert (=> d!125247 (= c!105131 (and ((_ is Intermediate!9757) lt!457533) (undefined!10569 lt!457533)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65360 (_ BitVec 32)) SeekEntryResult!9757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125247 (= lt!457533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30211 thiss!1427)) key!909 (_keys!11486 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125247 (validMask!0 (mask!30211 thiss!1427))))

(assert (=> d!125247 (= (seekEntry!0 key!909 (_keys!11486 thiss!1427) (mask!30211 thiss!1427)) lt!457535)))

(declare-fun b!1037581 () Bool)

(declare-fun e!586966 () SeekEntryResult!9757)

(declare-fun lt!457536 () SeekEntryResult!9757)

(assert (=> b!1037581 (= e!586966 (ite ((_ is MissingVacant!9757) lt!457536) (MissingZero!9757 (index!41402 lt!457536)) lt!457536))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65360 (_ BitVec 32)) SeekEntryResult!9757)

(assert (=> b!1037581 (= lt!457536 (seekKeyOrZeroReturnVacant!0 (x!92564 lt!457533) (index!41401 lt!457533) (index!41401 lt!457533) key!909 (_keys!11486 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun b!1037582 () Bool)

(assert (=> b!1037582 (= e!586967 e!586968)))

(declare-fun lt!457534 () (_ BitVec 64))

(assert (=> b!1037582 (= lt!457534 (select (arr!31461 (_keys!11486 thiss!1427)) (index!41401 lt!457533)))))

(declare-fun c!105132 () Bool)

(assert (=> b!1037582 (= c!105132 (= lt!457534 key!909))))

(declare-fun b!1037583 () Bool)

(assert (=> b!1037583 (= e!586967 Undefined!9757)))

(declare-fun b!1037584 () Bool)

(declare-fun c!105133 () Bool)

(assert (=> b!1037584 (= c!105133 (= lt!457534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037584 (= e!586968 e!586966)))

(declare-fun b!1037585 () Bool)

(assert (=> b!1037585 (= e!586966 (MissingZero!9757 (index!41401 lt!457533)))))

(assert (= (and d!125247 c!105131) b!1037583))

(assert (= (and d!125247 (not c!105131)) b!1037582))

(assert (= (and b!1037582 c!105132) b!1037580))

(assert (= (and b!1037582 (not c!105132)) b!1037584))

(assert (= (and b!1037584 c!105133) b!1037585))

(assert (= (and b!1037584 (not c!105133)) b!1037581))

(declare-fun m!957761 () Bool)

(assert (=> d!125247 m!957761))

(declare-fun m!957763 () Bool)

(assert (=> d!125247 m!957763))

(assert (=> d!125247 m!957763))

(declare-fun m!957765 () Bool)

(assert (=> d!125247 m!957765))

(declare-fun m!957767 () Bool)

(assert (=> d!125247 m!957767))

(declare-fun m!957769 () Bool)

(assert (=> b!1037581 m!957769))

(declare-fun m!957771 () Bool)

(assert (=> b!1037582 m!957771))

(assert (=> b!1037527 d!125247))

(declare-fun d!125249 () Bool)

(declare-fun res!692249 () Bool)

(declare-fun e!586973 () Bool)

(assert (=> d!125249 (=> res!692249 e!586973)))

(assert (=> d!125249 (= res!692249 ((_ is Nil!21921) Nil!21921))))

(assert (=> d!125249 (= (noDuplicate!1474 Nil!21921) e!586973)))

(declare-fun b!1037590 () Bool)

(declare-fun e!586974 () Bool)

(assert (=> b!1037590 (= e!586973 e!586974)))

(declare-fun res!692250 () Bool)

(assert (=> b!1037590 (=> (not res!692250) (not e!586974))))

(declare-fun contains!6025 (List!21924 (_ BitVec 64)) Bool)

(assert (=> b!1037590 (= res!692250 (not (contains!6025 (t!31138 Nil!21921) (h!23123 Nil!21921))))))

(declare-fun b!1037591 () Bool)

(assert (=> b!1037591 (= e!586974 (noDuplicate!1474 (t!31138 Nil!21921)))))

(assert (= (and d!125249 (not res!692249)) b!1037590))

(assert (= (and b!1037590 res!692250) b!1037591))

(declare-fun m!957773 () Bool)

(assert (=> b!1037590 m!957773))

(declare-fun m!957775 () Bool)

(assert (=> b!1037591 m!957775))

(assert (=> b!1037529 d!125249))

(declare-fun b!1037600 () Bool)

(declare-fun e!586979 () (_ BitVec 32))

(declare-fun call!43922 () (_ BitVec 32))

(assert (=> b!1037600 (= e!586979 (bvadd #b00000000000000000000000000000001 call!43922))))

(declare-fun d!125251 () Bool)

(declare-fun lt!457539 () (_ BitVec 32))

(assert (=> d!125251 (and (bvsge lt!457539 #b00000000000000000000000000000000) (bvsle lt!457539 (bvsub (size!31991 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!586980 () (_ BitVec 32))

(assert (=> d!125251 (= lt!457539 e!586980)))

(declare-fun c!105139 () Bool)

(assert (=> d!125251 (= c!105139 (bvsge #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))))))

(assert (=> d!125251 (and (bvsle #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31991 (_keys!11486 thiss!1427)) (size!31991 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427))))))))

(assert (=> d!125251 (= (arrayCountValidKeys!0 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427))) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) lt!457539)))

(declare-fun b!1037601 () Bool)

(assert (=> b!1037601 (= e!586980 #b00000000000000000000000000000000)))

(declare-fun b!1037602 () Bool)

(assert (=> b!1037602 (= e!586980 e!586979)))

(declare-fun c!105138 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037602 (= c!105138 (validKeyInArray!0 (select (arr!31461 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1037603 () Bool)

(assert (=> b!1037603 (= e!586979 call!43922)))

(declare-fun bm!43919 () Bool)

(assert (=> bm!43919 (= call!43922 (arrayCountValidKeys!0 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31991 (_keys!11486 thiss!1427))))))

(assert (= (and d!125251 c!105139) b!1037601))

(assert (= (and d!125251 (not c!105139)) b!1037602))

(assert (= (and b!1037602 c!105138) b!1037600))

(assert (= (and b!1037602 (not c!105138)) b!1037603))

(assert (= (or b!1037600 b!1037603) bm!43919))

(declare-fun m!957777 () Bool)

(assert (=> b!1037602 m!957777))

(assert (=> b!1037602 m!957777))

(declare-fun m!957779 () Bool)

(assert (=> b!1037602 m!957779))

(declare-fun m!957781 () Bool)

(assert (=> bm!43919 m!957781))

(assert (=> b!1037530 d!125251))

(declare-fun b!1037604 () Bool)

(declare-fun e!586981 () (_ BitVec 32))

(declare-fun call!43923 () (_ BitVec 32))

(assert (=> b!1037604 (= e!586981 (bvadd #b00000000000000000000000000000001 call!43923))))

(declare-fun d!125253 () Bool)

(declare-fun lt!457540 () (_ BitVec 32))

(assert (=> d!125253 (and (bvsge lt!457540 #b00000000000000000000000000000000) (bvsle lt!457540 (bvsub (size!31991 (_keys!11486 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586982 () (_ BitVec 32))

(assert (=> d!125253 (= lt!457540 e!586982)))

(declare-fun c!105141 () Bool)

(assert (=> d!125253 (= c!105141 (bvsge #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))))))

(assert (=> d!125253 (and (bvsle #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31991 (_keys!11486 thiss!1427)) (size!31991 (_keys!11486 thiss!1427))))))

(assert (=> d!125253 (= (arrayCountValidKeys!0 (_keys!11486 thiss!1427) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) lt!457540)))

(declare-fun b!1037605 () Bool)

(assert (=> b!1037605 (= e!586982 #b00000000000000000000000000000000)))

(declare-fun b!1037606 () Bool)

(assert (=> b!1037606 (= e!586982 e!586981)))

(declare-fun c!105140 () Bool)

(assert (=> b!1037606 (= c!105140 (validKeyInArray!0 (select (arr!31461 (_keys!11486 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037607 () Bool)

(assert (=> b!1037607 (= e!586981 call!43923)))

(declare-fun bm!43920 () Bool)

(assert (=> bm!43920 (= call!43923 (arrayCountValidKeys!0 (_keys!11486 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31991 (_keys!11486 thiss!1427))))))

(assert (= (and d!125253 c!105141) b!1037605))

(assert (= (and d!125253 (not c!105141)) b!1037606))

(assert (= (and b!1037606 c!105140) b!1037604))

(assert (= (and b!1037606 (not c!105140)) b!1037607))

(assert (= (or b!1037604 b!1037607) bm!43920))

(declare-fun m!957783 () Bool)

(assert (=> b!1037606 m!957783))

(assert (=> b!1037606 m!957783))

(declare-fun m!957785 () Bool)

(assert (=> b!1037606 m!957785))

(declare-fun m!957787 () Bool)

(assert (=> bm!43920 m!957787))

(assert (=> b!1037530 d!125253))

(declare-fun d!125255 () Bool)

(declare-fun e!586988 () Bool)

(assert (=> d!125255 e!586988))

(declare-fun res!692259 () Bool)

(assert (=> d!125255 (=> (not res!692259) (not e!586988))))

(assert (=> d!125255 (= res!692259 (and (bvsge (index!41400 lt!457517) #b00000000000000000000000000000000) (bvslt (index!41400 lt!457517) (size!31991 (_keys!11486 thiss!1427)))))))

(declare-fun lt!457543 () Unit!33955)

(declare-fun choose!82 (array!65360 (_ BitVec 32) (_ BitVec 64)) Unit!33955)

(assert (=> d!125255 (= lt!457543 (choose!82 (_keys!11486 thiss!1427) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586987 () Bool)

(assert (=> d!125255 e!586987))

(declare-fun res!692261 () Bool)

(assert (=> d!125255 (=> (not res!692261) (not e!586987))))

(assert (=> d!125255 (= res!692261 (and (bvsge (index!41400 lt!457517) #b00000000000000000000000000000000) (bvslt (index!41400 lt!457517) (size!31991 (_keys!11486 thiss!1427)))))))

(assert (=> d!125255 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11486 thiss!1427) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457543)))

(declare-fun b!1037616 () Bool)

(declare-fun res!692260 () Bool)

(assert (=> b!1037616 (=> (not res!692260) (not e!586987))))

(assert (=> b!1037616 (= res!692260 (validKeyInArray!0 (select (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517))))))

(declare-fun b!1037617 () Bool)

(declare-fun res!692262 () Bool)

(assert (=> b!1037617 (=> (not res!692262) (not e!586987))))

(assert (=> b!1037617 (= res!692262 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037619 () Bool)

(assert (=> b!1037619 (= e!586988 (= (arrayCountValidKeys!0 (array!65361 (store (arr!31461 (_keys!11486 thiss!1427)) (index!41400 lt!457517) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31991 (_keys!11486 thiss!1427))) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11486 thiss!1427) #b00000000000000000000000000000000 (size!31991 (_keys!11486 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037618 () Bool)

(assert (=> b!1037618 (= e!586987 (bvslt (size!31991 (_keys!11486 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125255 res!692261) b!1037616))

(assert (= (and b!1037616 res!692260) b!1037617))

(assert (= (and b!1037617 res!692262) b!1037618))

(assert (= (and d!125255 res!692259) b!1037619))

(declare-fun m!957789 () Bool)

(assert (=> d!125255 m!957789))

(declare-fun m!957791 () Bool)

(assert (=> b!1037616 m!957791))

(assert (=> b!1037616 m!957791))

(declare-fun m!957793 () Bool)

(assert (=> b!1037616 m!957793))

(declare-fun m!957795 () Bool)

(assert (=> b!1037617 m!957795))

(assert (=> b!1037619 m!957715))

(assert (=> b!1037619 m!957717))

(assert (=> b!1037619 m!957719))

(assert (=> b!1037530 d!125255))

(declare-fun mapNonEmpty!38478 () Bool)

(declare-fun mapRes!38478 () Bool)

(declare-fun tp!73879 () Bool)

(declare-fun e!586993 () Bool)

(assert (=> mapNonEmpty!38478 (= mapRes!38478 (and tp!73879 e!586993))))

(declare-fun mapRest!38478 () (Array (_ BitVec 32) ValueCell!11610))

(declare-fun mapValue!38478 () ValueCell!11610)

(declare-fun mapKey!38478 () (_ BitVec 32))

(assert (=> mapNonEmpty!38478 (= mapRest!38472 (store mapRest!38478 mapKey!38478 mapValue!38478))))

(declare-fun condMapEmpty!38478 () Bool)

(declare-fun mapDefault!38478 () ValueCell!11610)

(assert (=> mapNonEmpty!38472 (= condMapEmpty!38478 (= mapRest!38472 ((as const (Array (_ BitVec 32) ValueCell!11610)) mapDefault!38478)))))

(declare-fun e!586994 () Bool)

(assert (=> mapNonEmpty!38472 (= tp!73869 (and e!586994 mapRes!38478))))

(declare-fun b!1037626 () Bool)

(assert (=> b!1037626 (= e!586993 tp_is_empty!24627)))

(declare-fun b!1037627 () Bool)

(assert (=> b!1037627 (= e!586994 tp_is_empty!24627)))

(declare-fun mapIsEmpty!38478 () Bool)

(assert (=> mapIsEmpty!38478 mapRes!38478))

(assert (= (and mapNonEmpty!38472 condMapEmpty!38478) mapIsEmpty!38478))

(assert (= (and mapNonEmpty!38472 (not condMapEmpty!38478)) mapNonEmpty!38478))

(assert (= (and mapNonEmpty!38478 ((_ is ValueCellFull!11610) mapValue!38478)) b!1037626))

(assert (= (and mapNonEmpty!38472 ((_ is ValueCellFull!11610) mapDefault!38478)) b!1037627))

(declare-fun m!957797 () Bool)

(assert (=> mapNonEmpty!38478 m!957797))

(check-sat (not bm!43919) (not d!125245) (not b!1037602) tp_is_empty!24627 (not b!1037567) (not mapNonEmpty!38478) (not d!125255) (not b!1037565) (not b!1037566) (not b!1037617) (not b!1037619) (not bm!43920) (not b!1037591) (not d!125247) (not b!1037606) b_and!33439 (not b!1037590) (not b!1037616) (not b!1037581) (not b_next!20907))
(check-sat b_and!33439 (not b_next!20907))
