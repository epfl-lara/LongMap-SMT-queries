; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91034 () Bool)

(assert start!91034)

(declare-fun b!1039504 () Bool)

(declare-fun b_free!20983 () Bool)

(declare-fun b_next!20983 () Bool)

(assert (=> b!1039504 (= b_free!20983 (not b_next!20983))))

(declare-fun tp!74132 () Bool)

(declare-fun b_and!33489 () Bool)

(assert (=> b!1039504 (= tp!74132 b_and!33489)))

(declare-fun b!1039498 () Bool)

(declare-fun e!588352 () Bool)

(declare-fun e!588353 () Bool)

(assert (=> b!1039498 (= e!588352 e!588353)))

(declare-fun res!693234 () Bool)

(assert (=> b!1039498 (=> (not res!693234) (not e!588353))))

(declare-datatypes ((SeekEntryResult!9781 0))(
  ( (MissingZero!9781 (index!41495 (_ BitVec 32))) (Found!9781 (index!41496 (_ BitVec 32))) (Intermediate!9781 (undefined!10593 Bool) (index!41497 (_ BitVec 32)) (x!92786 (_ BitVec 32))) (Undefined!9781) (MissingVacant!9781 (index!41498 (_ BitVec 32))) )
))
(declare-fun lt!457971 () SeekEntryResult!9781)

(get-info :version)

(assert (=> b!1039498 (= res!693234 ((_ is Found!9781) lt!457971))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37811 0))(
  ( (V!37812 (val!12402 Int)) )
))
(declare-datatypes ((ValueCell!11648 0))(
  ( (ValueCellFull!11648 (v!14988 V!37811)) (EmptyCell!11648) )
))
(declare-datatypes ((array!65473 0))(
  ( (array!65474 (arr!31506 (Array (_ BitVec 32) (_ BitVec 64))) (size!32039 (_ BitVec 32))) )
))
(declare-datatypes ((array!65475 0))(
  ( (array!65476 (arr!31507 (Array (_ BitVec 32) ValueCell!11648)) (size!32040 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5890 0))(
  ( (LongMapFixedSize!5891 (defaultEntry!6327 Int) (mask!30293 (_ BitVec 32)) (extraKeys!6055 (_ BitVec 32)) (zeroValue!6161 V!37811) (minValue!6161 V!37811) (_size!3000 (_ BitVec 32)) (_keys!11535 array!65473) (_values!6350 array!65475) (_vacant!3000 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5890)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65473 (_ BitVec 32)) SeekEntryResult!9781)

(assert (=> b!1039498 (= lt!457971 (seekEntry!0 key!909 (_keys!11535 thiss!1427) (mask!30293 thiss!1427)))))

(declare-fun b!1039499 () Bool)

(declare-fun e!588358 () Bool)

(declare-fun tp_is_empty!24703 () Bool)

(assert (=> b!1039499 (= e!588358 tp_is_empty!24703)))

(declare-fun mapNonEmpty!38620 () Bool)

(declare-fun mapRes!38620 () Bool)

(declare-fun tp!74131 () Bool)

(declare-fun e!588354 () Bool)

(assert (=> mapNonEmpty!38620 (= mapRes!38620 (and tp!74131 e!588354))))

(declare-fun mapKey!38620 () (_ BitVec 32))

(declare-fun mapRest!38620 () (Array (_ BitVec 32) ValueCell!11648))

(declare-fun mapValue!38620 () ValueCell!11648)

(assert (=> mapNonEmpty!38620 (= (arr!31507 (_values!6350 thiss!1427)) (store mapRest!38620 mapKey!38620 mapValue!38620))))

(declare-fun b!1039500 () Bool)

(declare-fun res!693233 () Bool)

(assert (=> b!1039500 (=> (not res!693233) (not e!588352))))

(assert (=> b!1039500 (= res!693233 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039502 () Bool)

(assert (=> b!1039502 (= e!588353 (not (bvsge (index!41496 lt!457971) #b00000000000000000000000000000000)))))

(declare-fun lt!457972 () array!65473)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65473 (_ BitVec 32)) Bool)

(assert (=> b!1039502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!457972 (mask!30293 thiss!1427))))

(declare-datatypes ((Unit!33881 0))(
  ( (Unit!33882) )
))
(declare-fun lt!457973 () Unit!33881)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65473 (_ BitVec 32) (_ BitVec 32)) Unit!33881)

(assert (=> b!1039502 (= lt!457973 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11535 thiss!1427) (index!41496 lt!457971) (mask!30293 thiss!1427)))))

(declare-datatypes ((List!21985 0))(
  ( (Nil!21982) (Cons!21981 (h!23185 (_ BitVec 64)) (t!31190 List!21985)) )
))
(declare-fun arrayNoDuplicates!0 (array!65473 (_ BitVec 32) List!21985) Bool)

(assert (=> b!1039502 (arrayNoDuplicates!0 lt!457972 #b00000000000000000000000000000000 Nil!21982)))

(declare-fun lt!457970 () Unit!33881)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21985) Unit!33881)

(assert (=> b!1039502 (= lt!457970 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11535 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41496 lt!457971) #b00000000000000000000000000000000 Nil!21982))))

(declare-fun arrayCountValidKeys!0 (array!65473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039502 (= (arrayCountValidKeys!0 lt!457972 #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039502 (= lt!457972 (array!65474 (store (arr!31506 (_keys!11535 thiss!1427)) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32039 (_keys!11535 thiss!1427))))))

(declare-fun lt!457974 () Unit!33881)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65473 (_ BitVec 32) (_ BitVec 64)) Unit!33881)

(assert (=> b!1039502 (= lt!457974 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11535 thiss!1427) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38620 () Bool)

(assert (=> mapIsEmpty!38620 mapRes!38620))

(declare-fun b!1039503 () Bool)

(assert (=> b!1039503 (= e!588354 tp_is_empty!24703)))

(declare-fun e!588355 () Bool)

(declare-fun e!588356 () Bool)

(declare-fun array_inv!24359 (array!65473) Bool)

(declare-fun array_inv!24360 (array!65475) Bool)

(assert (=> b!1039504 (= e!588356 (and tp!74132 tp_is_empty!24703 (array_inv!24359 (_keys!11535 thiss!1427)) (array_inv!24360 (_values!6350 thiss!1427)) e!588355))))

(declare-fun res!693232 () Bool)

(assert (=> start!91034 (=> (not res!693232) (not e!588352))))

(declare-fun valid!2205 (LongMapFixedSize!5890) Bool)

(assert (=> start!91034 (= res!693232 (valid!2205 thiss!1427))))

(assert (=> start!91034 e!588352))

(assert (=> start!91034 e!588356))

(assert (=> start!91034 true))

(declare-fun b!1039501 () Bool)

(assert (=> b!1039501 (= e!588355 (and e!588358 mapRes!38620))))

(declare-fun condMapEmpty!38620 () Bool)

(declare-fun mapDefault!38620 () ValueCell!11648)

(assert (=> b!1039501 (= condMapEmpty!38620 (= (arr!31507 (_values!6350 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11648)) mapDefault!38620)))))

(assert (= (and start!91034 res!693232) b!1039500))

(assert (= (and b!1039500 res!693233) b!1039498))

(assert (= (and b!1039498 res!693234) b!1039502))

(assert (= (and b!1039501 condMapEmpty!38620) mapIsEmpty!38620))

(assert (= (and b!1039501 (not condMapEmpty!38620)) mapNonEmpty!38620))

(assert (= (and mapNonEmpty!38620 ((_ is ValueCellFull!11648) mapValue!38620)) b!1039503))

(assert (= (and b!1039501 ((_ is ValueCellFull!11648) mapDefault!38620)) b!1039499))

(assert (= b!1039504 b!1039501))

(assert (= start!91034 b!1039504))

(declare-fun m!958685 () Bool)

(assert (=> b!1039502 m!958685))

(declare-fun m!958687 () Bool)

(assert (=> b!1039502 m!958687))

(declare-fun m!958689 () Bool)

(assert (=> b!1039502 m!958689))

(declare-fun m!958691 () Bool)

(assert (=> b!1039502 m!958691))

(declare-fun m!958693 () Bool)

(assert (=> b!1039502 m!958693))

(declare-fun m!958695 () Bool)

(assert (=> b!1039502 m!958695))

(declare-fun m!958697 () Bool)

(assert (=> b!1039502 m!958697))

(declare-fun m!958699 () Bool)

(assert (=> b!1039502 m!958699))

(declare-fun m!958701 () Bool)

(assert (=> start!91034 m!958701))

(declare-fun m!958703 () Bool)

(assert (=> b!1039498 m!958703))

(declare-fun m!958705 () Bool)

(assert (=> b!1039504 m!958705))

(declare-fun m!958707 () Bool)

(assert (=> b!1039504 m!958707))

(declare-fun m!958709 () Bool)

(assert (=> mapNonEmpty!38620 m!958709))

(check-sat (not b!1039498) b_and!33489 (not mapNonEmpty!38620) tp_is_empty!24703 (not b!1039502) (not start!91034) (not b!1039504) (not b_next!20983))
(check-sat b_and!33489 (not b_next!20983))
(get-model)

(declare-fun d!125385 () Bool)

(assert (=> d!125385 (= (array_inv!24359 (_keys!11535 thiss!1427)) (bvsge (size!32039 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039504 d!125385))

(declare-fun d!125387 () Bool)

(assert (=> d!125387 (= (array_inv!24360 (_values!6350 thiss!1427)) (bvsge (size!32040 (_values!6350 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039504 d!125387))

(declare-fun d!125389 () Bool)

(declare-fun e!588403 () Bool)

(assert (=> d!125389 e!588403))

(declare-fun res!693255 () Bool)

(assert (=> d!125389 (=> (not res!693255) (not e!588403))))

(assert (=> d!125389 (= res!693255 (and (bvsge (index!41496 lt!457971) #b00000000000000000000000000000000) (bvslt (index!41496 lt!457971) (size!32039 (_keys!11535 thiss!1427)))))))

(declare-fun lt!458007 () Unit!33881)

(declare-fun choose!53 (array!65473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21985) Unit!33881)

(assert (=> d!125389 (= lt!458007 (choose!53 (_keys!11535 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41496 lt!457971) #b00000000000000000000000000000000 Nil!21982))))

(assert (=> d!125389 (bvslt (size!32039 (_keys!11535 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125389 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11535 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41496 lt!457971) #b00000000000000000000000000000000 Nil!21982) lt!458007)))

(declare-fun b!1039549 () Bool)

(assert (=> b!1039549 (= e!588403 (arrayNoDuplicates!0 (array!65474 (store (arr!31506 (_keys!11535 thiss!1427)) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32039 (_keys!11535 thiss!1427))) #b00000000000000000000000000000000 Nil!21982))))

(assert (= (and d!125389 res!693255) b!1039549))

(declare-fun m!958763 () Bool)

(assert (=> d!125389 m!958763))

(assert (=> b!1039549 m!958691))

(declare-fun m!958765 () Bool)

(assert (=> b!1039549 m!958765))

(assert (=> b!1039502 d!125389))

(declare-fun b!1039560 () Bool)

(declare-fun e!588414 () Bool)

(declare-fun call!43984 () Bool)

(assert (=> b!1039560 (= e!588414 call!43984)))

(declare-fun b!1039561 () Bool)

(assert (=> b!1039561 (= e!588414 call!43984)))

(declare-fun d!125391 () Bool)

(declare-fun res!693262 () Bool)

(declare-fun e!588415 () Bool)

(assert (=> d!125391 (=> res!693262 e!588415)))

(assert (=> d!125391 (= res!693262 (bvsge #b00000000000000000000000000000000 (size!32039 lt!457972)))))

(assert (=> d!125391 (= (arrayNoDuplicates!0 lt!457972 #b00000000000000000000000000000000 Nil!21982) e!588415)))

(declare-fun bm!43981 () Bool)

(declare-fun c!105337 () Bool)

(assert (=> bm!43981 (= call!43984 (arrayNoDuplicates!0 lt!457972 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105337 (Cons!21981 (select (arr!31506 lt!457972) #b00000000000000000000000000000000) Nil!21982) Nil!21982)))))

(declare-fun b!1039562 () Bool)

(declare-fun e!588413 () Bool)

(assert (=> b!1039562 (= e!588413 e!588414)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039562 (= c!105337 (validKeyInArray!0 (select (arr!31506 lt!457972) #b00000000000000000000000000000000)))))

(declare-fun b!1039563 () Bool)

(declare-fun e!588412 () Bool)

(declare-fun contains!6025 (List!21985 (_ BitVec 64)) Bool)

(assert (=> b!1039563 (= e!588412 (contains!6025 Nil!21982 (select (arr!31506 lt!457972) #b00000000000000000000000000000000)))))

(declare-fun b!1039564 () Bool)

(assert (=> b!1039564 (= e!588415 e!588413)))

(declare-fun res!693263 () Bool)

(assert (=> b!1039564 (=> (not res!693263) (not e!588413))))

(assert (=> b!1039564 (= res!693263 (not e!588412))))

(declare-fun res!693264 () Bool)

(assert (=> b!1039564 (=> (not res!693264) (not e!588412))))

(assert (=> b!1039564 (= res!693264 (validKeyInArray!0 (select (arr!31506 lt!457972) #b00000000000000000000000000000000)))))

(assert (= (and d!125391 (not res!693262)) b!1039564))

(assert (= (and b!1039564 res!693264) b!1039563))

(assert (= (and b!1039564 res!693263) b!1039562))

(assert (= (and b!1039562 c!105337) b!1039560))

(assert (= (and b!1039562 (not c!105337)) b!1039561))

(assert (= (or b!1039560 b!1039561) bm!43981))

(declare-fun m!958767 () Bool)

(assert (=> bm!43981 m!958767))

(declare-fun m!958769 () Bool)

(assert (=> bm!43981 m!958769))

(assert (=> b!1039562 m!958767))

(assert (=> b!1039562 m!958767))

(declare-fun m!958771 () Bool)

(assert (=> b!1039562 m!958771))

(assert (=> b!1039563 m!958767))

(assert (=> b!1039563 m!958767))

(declare-fun m!958773 () Bool)

(assert (=> b!1039563 m!958773))

(assert (=> b!1039564 m!958767))

(assert (=> b!1039564 m!958767))

(assert (=> b!1039564 m!958771))

(assert (=> b!1039502 d!125391))

(declare-fun b!1039573 () Bool)

(declare-fun e!588422 () Bool)

(declare-fun e!588423 () Bool)

(assert (=> b!1039573 (= e!588422 e!588423)))

(declare-fun lt!458015 () (_ BitVec 64))

(assert (=> b!1039573 (= lt!458015 (select (arr!31506 lt!457972) #b00000000000000000000000000000000))))

(declare-fun lt!458014 () Unit!33881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65473 (_ BitVec 64) (_ BitVec 32)) Unit!33881)

(assert (=> b!1039573 (= lt!458014 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!457972 lt!458015 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039573 (arrayContainsKey!0 lt!457972 lt!458015 #b00000000000000000000000000000000)))

(declare-fun lt!458016 () Unit!33881)

(assert (=> b!1039573 (= lt!458016 lt!458014)))

(declare-fun res!693269 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65473 (_ BitVec 32)) SeekEntryResult!9781)

(assert (=> b!1039573 (= res!693269 (= (seekEntryOrOpen!0 (select (arr!31506 lt!457972) #b00000000000000000000000000000000) lt!457972 (mask!30293 thiss!1427)) (Found!9781 #b00000000000000000000000000000000)))))

(assert (=> b!1039573 (=> (not res!693269) (not e!588423))))

(declare-fun b!1039574 () Bool)

(declare-fun e!588424 () Bool)

(assert (=> b!1039574 (= e!588424 e!588422)))

(declare-fun c!105340 () Bool)

(assert (=> b!1039574 (= c!105340 (validKeyInArray!0 (select (arr!31506 lt!457972) #b00000000000000000000000000000000)))))

(declare-fun d!125393 () Bool)

(declare-fun res!693270 () Bool)

(assert (=> d!125393 (=> res!693270 e!588424)))

(assert (=> d!125393 (= res!693270 (bvsge #b00000000000000000000000000000000 (size!32039 lt!457972)))))

(assert (=> d!125393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!457972 (mask!30293 thiss!1427)) e!588424)))

(declare-fun bm!43984 () Bool)

(declare-fun call!43987 () Bool)

(assert (=> bm!43984 (= call!43987 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!457972 (mask!30293 thiss!1427)))))

(declare-fun b!1039575 () Bool)

(assert (=> b!1039575 (= e!588423 call!43987)))

(declare-fun b!1039576 () Bool)

(assert (=> b!1039576 (= e!588422 call!43987)))

(assert (= (and d!125393 (not res!693270)) b!1039574))

(assert (= (and b!1039574 c!105340) b!1039573))

(assert (= (and b!1039574 (not c!105340)) b!1039576))

(assert (= (and b!1039573 res!693269) b!1039575))

(assert (= (or b!1039575 b!1039576) bm!43984))

(assert (=> b!1039573 m!958767))

(declare-fun m!958775 () Bool)

(assert (=> b!1039573 m!958775))

(declare-fun m!958777 () Bool)

(assert (=> b!1039573 m!958777))

(assert (=> b!1039573 m!958767))

(declare-fun m!958779 () Bool)

(assert (=> b!1039573 m!958779))

(assert (=> b!1039574 m!958767))

(assert (=> b!1039574 m!958767))

(assert (=> b!1039574 m!958771))

(declare-fun m!958781 () Bool)

(assert (=> bm!43984 m!958781))

(assert (=> b!1039502 d!125393))

(declare-fun d!125395 () Bool)

(declare-fun e!588430 () Bool)

(assert (=> d!125395 e!588430))

(declare-fun res!693281 () Bool)

(assert (=> d!125395 (=> (not res!693281) (not e!588430))))

(assert (=> d!125395 (= res!693281 (and (bvsge (index!41496 lt!457971) #b00000000000000000000000000000000) (bvslt (index!41496 lt!457971) (size!32039 (_keys!11535 thiss!1427)))))))

(declare-fun lt!458019 () Unit!33881)

(declare-fun choose!82 (array!65473 (_ BitVec 32) (_ BitVec 64)) Unit!33881)

(assert (=> d!125395 (= lt!458019 (choose!82 (_keys!11535 thiss!1427) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588429 () Bool)

(assert (=> d!125395 e!588429))

(declare-fun res!693279 () Bool)

(assert (=> d!125395 (=> (not res!693279) (not e!588429))))

(assert (=> d!125395 (= res!693279 (and (bvsge (index!41496 lt!457971) #b00000000000000000000000000000000) (bvslt (index!41496 lt!457971) (size!32039 (_keys!11535 thiss!1427)))))))

(assert (=> d!125395 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11535 thiss!1427) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458019)))

(declare-fun b!1039588 () Bool)

(assert (=> b!1039588 (= e!588430 (= (arrayCountValidKeys!0 (array!65474 (store (arr!31506 (_keys!11535 thiss!1427)) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32039 (_keys!11535 thiss!1427))) #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039587 () Bool)

(assert (=> b!1039587 (= e!588429 (bvslt (size!32039 (_keys!11535 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039585 () Bool)

(declare-fun res!693280 () Bool)

(assert (=> b!1039585 (=> (not res!693280) (not e!588429))))

(assert (=> b!1039585 (= res!693280 (validKeyInArray!0 (select (arr!31506 (_keys!11535 thiss!1427)) (index!41496 lt!457971))))))

(declare-fun b!1039586 () Bool)

(declare-fun res!693282 () Bool)

(assert (=> b!1039586 (=> (not res!693282) (not e!588429))))

(assert (=> b!1039586 (= res!693282 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125395 res!693279) b!1039585))

(assert (= (and b!1039585 res!693280) b!1039586))

(assert (= (and b!1039586 res!693282) b!1039587))

(assert (= (and d!125395 res!693281) b!1039588))

(declare-fun m!958783 () Bool)

(assert (=> d!125395 m!958783))

(assert (=> b!1039588 m!958691))

(declare-fun m!958785 () Bool)

(assert (=> b!1039588 m!958785))

(assert (=> b!1039588 m!958697))

(declare-fun m!958787 () Bool)

(assert (=> b!1039585 m!958787))

(assert (=> b!1039585 m!958787))

(declare-fun m!958789 () Bool)

(assert (=> b!1039585 m!958789))

(declare-fun m!958791 () Bool)

(assert (=> b!1039586 m!958791))

(assert (=> b!1039502 d!125395))

(declare-fun bm!43987 () Bool)

(declare-fun call!43990 () (_ BitVec 32))

(assert (=> bm!43987 (= call!43990 (arrayCountValidKeys!0 (_keys!11535 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32039 (_keys!11535 thiss!1427))))))

(declare-fun b!1039597 () Bool)

(declare-fun e!588436 () (_ BitVec 32))

(assert (=> b!1039597 (= e!588436 (bvadd #b00000000000000000000000000000001 call!43990))))

(declare-fun b!1039598 () Bool)

(declare-fun e!588435 () (_ BitVec 32))

(assert (=> b!1039598 (= e!588435 #b00000000000000000000000000000000)))

(declare-fun d!125397 () Bool)

(declare-fun lt!458022 () (_ BitVec 32))

(assert (=> d!125397 (and (bvsge lt!458022 #b00000000000000000000000000000000) (bvsle lt!458022 (bvsub (size!32039 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125397 (= lt!458022 e!588435)))

(declare-fun c!105346 () Bool)

(assert (=> d!125397 (= c!105346 (bvsge #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))))))

(assert (=> d!125397 (and (bvsle #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32039 (_keys!11535 thiss!1427)) (size!32039 (_keys!11535 thiss!1427))))))

(assert (=> d!125397 (= (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) lt!458022)))

(declare-fun b!1039599 () Bool)

(assert (=> b!1039599 (= e!588435 e!588436)))

(declare-fun c!105345 () Bool)

(assert (=> b!1039599 (= c!105345 (validKeyInArray!0 (select (arr!31506 (_keys!11535 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039600 () Bool)

(assert (=> b!1039600 (= e!588436 call!43990)))

(assert (= (and d!125397 c!105346) b!1039598))

(assert (= (and d!125397 (not c!105346)) b!1039599))

(assert (= (and b!1039599 c!105345) b!1039597))

(assert (= (and b!1039599 (not c!105345)) b!1039600))

(assert (= (or b!1039597 b!1039600) bm!43987))

(declare-fun m!958793 () Bool)

(assert (=> bm!43987 m!958793))

(declare-fun m!958795 () Bool)

(assert (=> b!1039599 m!958795))

(assert (=> b!1039599 m!958795))

(declare-fun m!958797 () Bool)

(assert (=> b!1039599 m!958797))

(assert (=> b!1039502 d!125397))

(declare-fun bm!43988 () Bool)

(declare-fun call!43991 () (_ BitVec 32))

(assert (=> bm!43988 (= call!43991 (arrayCountValidKeys!0 lt!457972 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32039 (_keys!11535 thiss!1427))))))

(declare-fun b!1039601 () Bool)

(declare-fun e!588438 () (_ BitVec 32))

(assert (=> b!1039601 (= e!588438 (bvadd #b00000000000000000000000000000001 call!43991))))

(declare-fun b!1039602 () Bool)

(declare-fun e!588437 () (_ BitVec 32))

(assert (=> b!1039602 (= e!588437 #b00000000000000000000000000000000)))

(declare-fun d!125399 () Bool)

(declare-fun lt!458023 () (_ BitVec 32))

(assert (=> d!125399 (and (bvsge lt!458023 #b00000000000000000000000000000000) (bvsle lt!458023 (bvsub (size!32039 lt!457972) #b00000000000000000000000000000000)))))

(assert (=> d!125399 (= lt!458023 e!588437)))

(declare-fun c!105348 () Bool)

(assert (=> d!125399 (= c!105348 (bvsge #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))))))

(assert (=> d!125399 (and (bvsle #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32039 (_keys!11535 thiss!1427)) (size!32039 lt!457972)))))

(assert (=> d!125399 (= (arrayCountValidKeys!0 lt!457972 #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) lt!458023)))

(declare-fun b!1039603 () Bool)

(assert (=> b!1039603 (= e!588437 e!588438)))

(declare-fun c!105347 () Bool)

(assert (=> b!1039603 (= c!105347 (validKeyInArray!0 (select (arr!31506 lt!457972) #b00000000000000000000000000000000)))))

(declare-fun b!1039604 () Bool)

(assert (=> b!1039604 (= e!588438 call!43991)))

(assert (= (and d!125399 c!105348) b!1039602))

(assert (= (and d!125399 (not c!105348)) b!1039603))

(assert (= (and b!1039603 c!105347) b!1039601))

(assert (= (and b!1039603 (not c!105347)) b!1039604))

(assert (= (or b!1039601 b!1039604) bm!43988))

(declare-fun m!958799 () Bool)

(assert (=> bm!43988 m!958799))

(assert (=> b!1039603 m!958767))

(assert (=> b!1039603 m!958767))

(assert (=> b!1039603 m!958771))

(assert (=> b!1039502 d!125399))

(declare-fun d!125401 () Bool)

(declare-fun e!588441 () Bool)

(assert (=> d!125401 e!588441))

(declare-fun res!693285 () Bool)

(assert (=> d!125401 (=> (not res!693285) (not e!588441))))

(assert (=> d!125401 (= res!693285 (and (bvsge (index!41496 lt!457971) #b00000000000000000000000000000000) (bvslt (index!41496 lt!457971) (size!32039 (_keys!11535 thiss!1427)))))))

(declare-fun lt!458026 () Unit!33881)

(declare-fun choose!25 (array!65473 (_ BitVec 32) (_ BitVec 32)) Unit!33881)

(assert (=> d!125401 (= lt!458026 (choose!25 (_keys!11535 thiss!1427) (index!41496 lt!457971) (mask!30293 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125401 (validMask!0 (mask!30293 thiss!1427))))

(assert (=> d!125401 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11535 thiss!1427) (index!41496 lt!457971) (mask!30293 thiss!1427)) lt!458026)))

(declare-fun b!1039607 () Bool)

(assert (=> b!1039607 (= e!588441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65474 (store (arr!31506 (_keys!11535 thiss!1427)) (index!41496 lt!457971) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32039 (_keys!11535 thiss!1427))) (mask!30293 thiss!1427)))))

(assert (= (and d!125401 res!693285) b!1039607))

(declare-fun m!958801 () Bool)

(assert (=> d!125401 m!958801))

(declare-fun m!958803 () Bool)

(assert (=> d!125401 m!958803))

(assert (=> b!1039607 m!958691))

(declare-fun m!958805 () Bool)

(assert (=> b!1039607 m!958805))

(assert (=> b!1039502 d!125401))

(declare-fun b!1039620 () Bool)

(declare-fun c!105355 () Bool)

(declare-fun lt!458035 () (_ BitVec 64))

(assert (=> b!1039620 (= c!105355 (= lt!458035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588448 () SeekEntryResult!9781)

(declare-fun e!588449 () SeekEntryResult!9781)

(assert (=> b!1039620 (= e!588448 e!588449)))

(declare-fun b!1039621 () Bool)

(declare-fun lt!458038 () SeekEntryResult!9781)

(assert (=> b!1039621 (= e!588448 (Found!9781 (index!41497 lt!458038)))))

(declare-fun b!1039622 () Bool)

(declare-fun e!588450 () SeekEntryResult!9781)

(assert (=> b!1039622 (= e!588450 e!588448)))

(assert (=> b!1039622 (= lt!458035 (select (arr!31506 (_keys!11535 thiss!1427)) (index!41497 lt!458038)))))

(declare-fun c!105356 () Bool)

(assert (=> b!1039622 (= c!105356 (= lt!458035 key!909))))

(declare-fun b!1039623 () Bool)

(assert (=> b!1039623 (= e!588450 Undefined!9781)))

(declare-fun b!1039624 () Bool)

(assert (=> b!1039624 (= e!588449 (MissingZero!9781 (index!41497 lt!458038)))))

(declare-fun d!125403 () Bool)

(declare-fun lt!458036 () SeekEntryResult!9781)

(assert (=> d!125403 (and (or ((_ is MissingVacant!9781) lt!458036) (not ((_ is Found!9781) lt!458036)) (and (bvsge (index!41496 lt!458036) #b00000000000000000000000000000000) (bvslt (index!41496 lt!458036) (size!32039 (_keys!11535 thiss!1427))))) (not ((_ is MissingVacant!9781) lt!458036)) (or (not ((_ is Found!9781) lt!458036)) (= (select (arr!31506 (_keys!11535 thiss!1427)) (index!41496 lt!458036)) key!909)))))

(assert (=> d!125403 (= lt!458036 e!588450)))

(declare-fun c!105357 () Bool)

(assert (=> d!125403 (= c!105357 (and ((_ is Intermediate!9781) lt!458038) (undefined!10593 lt!458038)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65473 (_ BitVec 32)) SeekEntryResult!9781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125403 (= lt!458038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30293 thiss!1427)) key!909 (_keys!11535 thiss!1427) (mask!30293 thiss!1427)))))

(assert (=> d!125403 (validMask!0 (mask!30293 thiss!1427))))

(assert (=> d!125403 (= (seekEntry!0 key!909 (_keys!11535 thiss!1427) (mask!30293 thiss!1427)) lt!458036)))

(declare-fun b!1039625 () Bool)

(declare-fun lt!458037 () SeekEntryResult!9781)

(assert (=> b!1039625 (= e!588449 (ite ((_ is MissingVacant!9781) lt!458037) (MissingZero!9781 (index!41498 lt!458037)) lt!458037))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65473 (_ BitVec 32)) SeekEntryResult!9781)

(assert (=> b!1039625 (= lt!458037 (seekKeyOrZeroReturnVacant!0 (x!92786 lt!458038) (index!41497 lt!458038) (index!41497 lt!458038) key!909 (_keys!11535 thiss!1427) (mask!30293 thiss!1427)))))

(assert (= (and d!125403 c!105357) b!1039623))

(assert (= (and d!125403 (not c!105357)) b!1039622))

(assert (= (and b!1039622 c!105356) b!1039621))

(assert (= (and b!1039622 (not c!105356)) b!1039620))

(assert (= (and b!1039620 c!105355) b!1039624))

(assert (= (and b!1039620 (not c!105355)) b!1039625))

(declare-fun m!958807 () Bool)

(assert (=> b!1039622 m!958807))

(declare-fun m!958809 () Bool)

(assert (=> d!125403 m!958809))

(declare-fun m!958811 () Bool)

(assert (=> d!125403 m!958811))

(assert (=> d!125403 m!958811))

(declare-fun m!958813 () Bool)

(assert (=> d!125403 m!958813))

(assert (=> d!125403 m!958803))

(declare-fun m!958815 () Bool)

(assert (=> b!1039625 m!958815))

(assert (=> b!1039498 d!125403))

(declare-fun d!125405 () Bool)

(declare-fun res!693292 () Bool)

(declare-fun e!588453 () Bool)

(assert (=> d!125405 (=> (not res!693292) (not e!588453))))

(declare-fun simpleValid!429 (LongMapFixedSize!5890) Bool)

(assert (=> d!125405 (= res!693292 (simpleValid!429 thiss!1427))))

(assert (=> d!125405 (= (valid!2205 thiss!1427) e!588453)))

(declare-fun b!1039632 () Bool)

(declare-fun res!693293 () Bool)

(assert (=> b!1039632 (=> (not res!693293) (not e!588453))))

(assert (=> b!1039632 (= res!693293 (= (arrayCountValidKeys!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 (size!32039 (_keys!11535 thiss!1427))) (_size!3000 thiss!1427)))))

(declare-fun b!1039633 () Bool)

(declare-fun res!693294 () Bool)

(assert (=> b!1039633 (=> (not res!693294) (not e!588453))))

(assert (=> b!1039633 (= res!693294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11535 thiss!1427) (mask!30293 thiss!1427)))))

(declare-fun b!1039634 () Bool)

(assert (=> b!1039634 (= e!588453 (arrayNoDuplicates!0 (_keys!11535 thiss!1427) #b00000000000000000000000000000000 Nil!21982))))

(assert (= (and d!125405 res!693292) b!1039632))

(assert (= (and b!1039632 res!693293) b!1039633))

(assert (= (and b!1039633 res!693294) b!1039634))

(declare-fun m!958817 () Bool)

(assert (=> d!125405 m!958817))

(assert (=> b!1039632 m!958697))

(declare-fun m!958819 () Bool)

(assert (=> b!1039633 m!958819))

(declare-fun m!958821 () Bool)

(assert (=> b!1039634 m!958821))

(assert (=> start!91034 d!125405))

(declare-fun b!1039641 () Bool)

(declare-fun e!588459 () Bool)

(assert (=> b!1039641 (= e!588459 tp_is_empty!24703)))

(declare-fun condMapEmpty!38629 () Bool)

(declare-fun mapDefault!38629 () ValueCell!11648)

(assert (=> mapNonEmpty!38620 (= condMapEmpty!38629 (= mapRest!38620 ((as const (Array (_ BitVec 32) ValueCell!11648)) mapDefault!38629)))))

(declare-fun e!588458 () Bool)

(declare-fun mapRes!38629 () Bool)

(assert (=> mapNonEmpty!38620 (= tp!74131 (and e!588458 mapRes!38629))))

(declare-fun b!1039642 () Bool)

(assert (=> b!1039642 (= e!588458 tp_is_empty!24703)))

(declare-fun mapNonEmpty!38629 () Bool)

(declare-fun tp!74147 () Bool)

(assert (=> mapNonEmpty!38629 (= mapRes!38629 (and tp!74147 e!588459))))

(declare-fun mapRest!38629 () (Array (_ BitVec 32) ValueCell!11648))

(declare-fun mapValue!38629 () ValueCell!11648)

(declare-fun mapKey!38629 () (_ BitVec 32))

(assert (=> mapNonEmpty!38629 (= mapRest!38620 (store mapRest!38629 mapKey!38629 mapValue!38629))))

(declare-fun mapIsEmpty!38629 () Bool)

(assert (=> mapIsEmpty!38629 mapRes!38629))

(assert (= (and mapNonEmpty!38620 condMapEmpty!38629) mapIsEmpty!38629))

(assert (= (and mapNonEmpty!38620 (not condMapEmpty!38629)) mapNonEmpty!38629))

(assert (= (and mapNonEmpty!38629 ((_ is ValueCellFull!11648) mapValue!38629)) b!1039641))

(assert (= (and mapNonEmpty!38620 ((_ is ValueCellFull!11648) mapDefault!38629)) b!1039642))

(declare-fun m!958823 () Bool)

(assert (=> mapNonEmpty!38629 m!958823))

(check-sat (not bm!43988) (not b!1039625) (not b!1039588) (not b!1039586) (not d!125395) (not bm!43981) (not d!125405) (not mapNonEmpty!38629) (not b!1039564) (not b!1039607) (not bm!43984) (not d!125401) (not b!1039603) (not b!1039573) (not b!1039549) b_and!33489 (not d!125403) (not b!1039632) (not b!1039585) (not b!1039562) (not b_next!20983) (not bm!43987) tp_is_empty!24703 (not b!1039574) (not b!1039563) (not b!1039634) (not d!125389) (not b!1039599) (not b!1039633))
(check-sat b_and!33489 (not b_next!20983))
