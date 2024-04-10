; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90762 () Bool)

(assert start!90762)

(declare-fun b!1037679 () Bool)

(declare-fun b_free!20913 () Bool)

(declare-fun b_next!20913 () Bool)

(assert (=> b!1037679 (= b_free!20913 (not b_next!20913))))

(declare-fun tp!73891 () Bool)

(declare-fun b_and!33445 () Bool)

(assert (=> b!1037679 (= tp!73891 b_and!33445)))

(declare-fun b!1037678 () Bool)

(declare-fun res!692298 () Bool)

(declare-fun e!587043 () Bool)

(assert (=> b!1037678 (=> (not res!692298) (not e!587043))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037678 (= res!692298 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38484 () Bool)

(declare-fun mapRes!38484 () Bool)

(assert (=> mapIsEmpty!38484 mapRes!38484))

(declare-fun e!587044 () Bool)

(declare-fun tp_is_empty!24633 () Bool)

(declare-fun e!587040 () Bool)

(declare-datatypes ((V!37717 0))(
  ( (V!37718 (val!12367 Int)) )
))
(declare-datatypes ((ValueCell!11613 0))(
  ( (ValueCellFull!11613 (v!14950 V!37717)) (EmptyCell!11613) )
))
(declare-datatypes ((array!65374 0))(
  ( (array!65375 (arr!31467 (Array (_ BitVec 32) (_ BitVec 64))) (size!31997 (_ BitVec 32))) )
))
(declare-datatypes ((array!65376 0))(
  ( (array!65377 (arr!31468 (Array (_ BitVec 32) ValueCell!11613)) (size!31998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5820 0))(
  ( (LongMapFixedSize!5821 (defaultEntry!6292 Int) (mask!30217 (_ BitVec 32)) (extraKeys!6020 (_ BitVec 32)) (zeroValue!6126 V!37717) (minValue!6126 V!37717) (_size!2965 (_ BitVec 32)) (_keys!11490 array!65374) (_values!6315 array!65376) (_vacant!2965 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5820)

(declare-fun array_inv!24335 (array!65374) Bool)

(declare-fun array_inv!24336 (array!65376) Bool)

(assert (=> b!1037679 (= e!587044 (and tp!73891 tp_is_empty!24633 (array_inv!24335 (_keys!11490 thiss!1427)) (array_inv!24336 (_values!6315 thiss!1427)) e!587040))))

(declare-fun b!1037680 () Bool)

(declare-fun e!587045 () Bool)

(assert (=> b!1037680 (= e!587045 tp_is_empty!24633)))

(declare-fun res!692297 () Bool)

(assert (=> start!90762 (=> (not res!692297) (not e!587043))))

(declare-fun valid!2193 (LongMapFixedSize!5820) Bool)

(assert (=> start!90762 (= res!692297 (valid!2193 thiss!1427))))

(assert (=> start!90762 e!587043))

(assert (=> start!90762 e!587044))

(assert (=> start!90762 true))

(declare-fun b!1037681 () Bool)

(declare-fun res!692294 () Bool)

(declare-fun e!587041 () Bool)

(assert (=> b!1037681 (=> res!692294 e!587041)))

(declare-datatypes ((List!21925 0))(
  ( (Nil!21922) (Cons!21921 (h!23124 (_ BitVec 64)) (t!31139 List!21925)) )
))
(declare-fun noDuplicate!1475 (List!21925) Bool)

(assert (=> b!1037681 (= res!692294 (not (noDuplicate!1475 Nil!21922)))))

(declare-fun b!1037682 () Bool)

(declare-fun e!587048 () Bool)

(assert (=> b!1037682 (= e!587048 tp_is_empty!24633)))

(declare-fun b!1037683 () Bool)

(assert (=> b!1037683 (= e!587040 (and e!587045 mapRes!38484))))

(declare-fun condMapEmpty!38484 () Bool)

(declare-fun mapDefault!38484 () ValueCell!11613)

(assert (=> b!1037683 (= condMapEmpty!38484 (= (arr!31468 (_values!6315 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11613)) mapDefault!38484)))))

(declare-fun b!1037684 () Bool)

(declare-fun e!587042 () Bool)

(assert (=> b!1037684 (= e!587041 e!587042)))

(declare-fun res!692293 () Bool)

(assert (=> b!1037684 (=> (not res!692293) (not e!587042))))

(declare-fun contains!6026 (List!21925 (_ BitVec 64)) Bool)

(assert (=> b!1037684 (= res!692293 (not (contains!6026 Nil!21922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38484 () Bool)

(declare-fun tp!73890 () Bool)

(assert (=> mapNonEmpty!38484 (= mapRes!38484 (and tp!73890 e!587048))))

(declare-fun mapValue!38484 () ValueCell!11613)

(declare-fun mapKey!38484 () (_ BitVec 32))

(declare-fun mapRest!38484 () (Array (_ BitVec 32) ValueCell!11613))

(assert (=> mapNonEmpty!38484 (= (arr!31468 (_values!6315 thiss!1427)) (store mapRest!38484 mapKey!38484 mapValue!38484))))

(declare-fun b!1037685 () Bool)

(assert (=> b!1037685 (= e!587042 (not (contains!6026 Nil!21922 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037686 () Bool)

(declare-fun e!587046 () Bool)

(assert (=> b!1037686 (= e!587043 e!587046)))

(declare-fun res!692295 () Bool)

(assert (=> b!1037686 (=> (not res!692295) (not e!587046))))

(declare-datatypes ((SeekEntryResult!9759 0))(
  ( (MissingZero!9759 (index!41407 (_ BitVec 32))) (Found!9759 (index!41408 (_ BitVec 32))) (Intermediate!9759 (undefined!10571 Bool) (index!41409 (_ BitVec 32)) (x!92582 (_ BitVec 32))) (Undefined!9759) (MissingVacant!9759 (index!41410 (_ BitVec 32))) )
))
(declare-fun lt!457554 () SeekEntryResult!9759)

(get-info :version)

(assert (=> b!1037686 (= res!692295 ((_ is Found!9759) lt!457554))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65374 (_ BitVec 32)) SeekEntryResult!9759)

(assert (=> b!1037686 (= lt!457554 (seekEntry!0 key!909 (_keys!11490 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun b!1037687 () Bool)

(assert (=> b!1037687 (= e!587046 (not e!587041))))

(declare-fun res!692296 () Bool)

(assert (=> b!1037687 (=> res!692296 e!587041)))

(assert (=> b!1037687 (= res!692296 (or (bvsge (size!31997 (_keys!11490 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65374 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037687 (= (arrayCountValidKeys!0 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427))) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11490 thiss!1427) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33957 0))(
  ( (Unit!33958) )
))
(declare-fun lt!457555 () Unit!33957)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65374 (_ BitVec 32) (_ BitVec 64)) Unit!33957)

(assert (=> b!1037687 (= lt!457555 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11490 thiss!1427) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90762 res!692297) b!1037678))

(assert (= (and b!1037678 res!692298) b!1037686))

(assert (= (and b!1037686 res!692295) b!1037687))

(assert (= (and b!1037687 (not res!692296)) b!1037681))

(assert (= (and b!1037681 (not res!692294)) b!1037684))

(assert (= (and b!1037684 res!692293) b!1037685))

(assert (= (and b!1037683 condMapEmpty!38484) mapIsEmpty!38484))

(assert (= (and b!1037683 (not condMapEmpty!38484)) mapNonEmpty!38484))

(assert (= (and mapNonEmpty!38484 ((_ is ValueCellFull!11613) mapValue!38484)) b!1037682))

(assert (= (and b!1037683 ((_ is ValueCellFull!11613) mapDefault!38484)) b!1037680))

(assert (= b!1037679 b!1037683))

(assert (= start!90762 b!1037679))

(declare-fun m!957823 () Bool)

(assert (=> b!1037685 m!957823))

(declare-fun m!957825 () Bool)

(assert (=> b!1037681 m!957825))

(declare-fun m!957827 () Bool)

(assert (=> b!1037687 m!957827))

(declare-fun m!957829 () Bool)

(assert (=> b!1037687 m!957829))

(declare-fun m!957831 () Bool)

(assert (=> b!1037687 m!957831))

(declare-fun m!957833 () Bool)

(assert (=> b!1037687 m!957833))

(declare-fun m!957835 () Bool)

(assert (=> b!1037686 m!957835))

(declare-fun m!957837 () Bool)

(assert (=> start!90762 m!957837))

(declare-fun m!957839 () Bool)

(assert (=> b!1037679 m!957839))

(declare-fun m!957841 () Bool)

(assert (=> b!1037679 m!957841))

(declare-fun m!957843 () Bool)

(assert (=> b!1037684 m!957843))

(declare-fun m!957845 () Bool)

(assert (=> mapNonEmpty!38484 m!957845))

(check-sat (not start!90762) (not b_next!20913) tp_is_empty!24633 (not b!1037679) (not b!1037681) (not b!1037686) (not mapNonEmpty!38484) (not b!1037684) (not b!1037685) b_and!33445 (not b!1037687))
(check-sat b_and!33445 (not b_next!20913))
(get-model)

(declare-fun d!125259 () Bool)

(declare-fun lt!457564 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!516 (List!21925) (InoxSet (_ BitVec 64)))

(assert (=> d!125259 (= lt!457564 (select (content!516 Nil!21922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587080 () Bool)

(assert (=> d!125259 (= lt!457564 e!587080)))

(declare-fun res!692322 () Bool)

(assert (=> d!125259 (=> (not res!692322) (not e!587080))))

(assert (=> d!125259 (= res!692322 ((_ is Cons!21921) Nil!21922))))

(assert (=> d!125259 (= (contains!6026 Nil!21922 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457564)))

(declare-fun b!1037722 () Bool)

(declare-fun e!587081 () Bool)

(assert (=> b!1037722 (= e!587080 e!587081)))

(declare-fun res!692321 () Bool)

(assert (=> b!1037722 (=> res!692321 e!587081)))

(assert (=> b!1037722 (= res!692321 (= (h!23124 Nil!21922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037723 () Bool)

(assert (=> b!1037723 (= e!587081 (contains!6026 (t!31139 Nil!21922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125259 res!692322) b!1037722))

(assert (= (and b!1037722 (not res!692321)) b!1037723))

(declare-fun m!957871 () Bool)

(assert (=> d!125259 m!957871))

(declare-fun m!957873 () Bool)

(assert (=> d!125259 m!957873))

(declare-fun m!957875 () Bool)

(assert (=> b!1037723 m!957875))

(assert (=> b!1037685 d!125259))

(declare-fun d!125261 () Bool)

(declare-fun res!692327 () Bool)

(declare-fun e!587086 () Bool)

(assert (=> d!125261 (=> res!692327 e!587086)))

(assert (=> d!125261 (= res!692327 ((_ is Nil!21922) Nil!21922))))

(assert (=> d!125261 (= (noDuplicate!1475 Nil!21922) e!587086)))

(declare-fun b!1037728 () Bool)

(declare-fun e!587087 () Bool)

(assert (=> b!1037728 (= e!587086 e!587087)))

(declare-fun res!692328 () Bool)

(assert (=> b!1037728 (=> (not res!692328) (not e!587087))))

(assert (=> b!1037728 (= res!692328 (not (contains!6026 (t!31139 Nil!21922) (h!23124 Nil!21922))))))

(declare-fun b!1037729 () Bool)

(assert (=> b!1037729 (= e!587087 (noDuplicate!1475 (t!31139 Nil!21922)))))

(assert (= (and d!125261 (not res!692327)) b!1037728))

(assert (= (and b!1037728 res!692328) b!1037729))

(declare-fun m!957877 () Bool)

(assert (=> b!1037728 m!957877))

(declare-fun m!957879 () Bool)

(assert (=> b!1037729 m!957879))

(assert (=> b!1037681 d!125261))

(declare-fun d!125263 () Bool)

(assert (=> d!125263 (= (array_inv!24335 (_keys!11490 thiss!1427)) (bvsge (size!31997 (_keys!11490 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037679 d!125263))

(declare-fun d!125265 () Bool)

(assert (=> d!125265 (= (array_inv!24336 (_values!6315 thiss!1427)) (bvsge (size!31998 (_values!6315 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037679 d!125265))

(declare-fun d!125267 () Bool)

(declare-fun lt!457565 () Bool)

(assert (=> d!125267 (= lt!457565 (select (content!516 Nil!21922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587088 () Bool)

(assert (=> d!125267 (= lt!457565 e!587088)))

(declare-fun res!692330 () Bool)

(assert (=> d!125267 (=> (not res!692330) (not e!587088))))

(assert (=> d!125267 (= res!692330 ((_ is Cons!21921) Nil!21922))))

(assert (=> d!125267 (= (contains!6026 Nil!21922 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457565)))

(declare-fun b!1037730 () Bool)

(declare-fun e!587089 () Bool)

(assert (=> b!1037730 (= e!587088 e!587089)))

(declare-fun res!692329 () Bool)

(assert (=> b!1037730 (=> res!692329 e!587089)))

(assert (=> b!1037730 (= res!692329 (= (h!23124 Nil!21922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037731 () Bool)

(assert (=> b!1037731 (= e!587089 (contains!6026 (t!31139 Nil!21922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125267 res!692330) b!1037730))

(assert (= (and b!1037730 (not res!692329)) b!1037731))

(assert (=> d!125267 m!957871))

(declare-fun m!957881 () Bool)

(assert (=> d!125267 m!957881))

(declare-fun m!957883 () Bool)

(assert (=> b!1037731 m!957883))

(assert (=> b!1037684 d!125267))

(declare-fun b!1037744 () Bool)

(declare-fun e!587098 () SeekEntryResult!9759)

(declare-fun lt!457575 () SeekEntryResult!9759)

(assert (=> b!1037744 (= e!587098 (ite ((_ is MissingVacant!9759) lt!457575) (MissingZero!9759 (index!41410 lt!457575)) lt!457575))))

(declare-fun lt!457574 () SeekEntryResult!9759)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65374 (_ BitVec 32)) SeekEntryResult!9759)

(assert (=> b!1037744 (= lt!457575 (seekKeyOrZeroReturnVacant!0 (x!92582 lt!457574) (index!41409 lt!457574) (index!41409 lt!457574) key!909 (_keys!11490 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun b!1037745 () Bool)

(declare-fun e!587096 () SeekEntryResult!9759)

(assert (=> b!1037745 (= e!587096 Undefined!9759)))

(declare-fun b!1037746 () Bool)

(declare-fun e!587097 () SeekEntryResult!9759)

(assert (=> b!1037746 (= e!587096 e!587097)))

(declare-fun lt!457577 () (_ BitVec 64))

(assert (=> b!1037746 (= lt!457577 (select (arr!31467 (_keys!11490 thiss!1427)) (index!41409 lt!457574)))))

(declare-fun c!105148 () Bool)

(assert (=> b!1037746 (= c!105148 (= lt!457577 key!909))))

(declare-fun b!1037747 () Bool)

(assert (=> b!1037747 (= e!587097 (Found!9759 (index!41409 lt!457574)))))

(declare-fun b!1037748 () Bool)

(declare-fun c!105149 () Bool)

(assert (=> b!1037748 (= c!105149 (= lt!457577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037748 (= e!587097 e!587098)))

(declare-fun d!125269 () Bool)

(declare-fun lt!457576 () SeekEntryResult!9759)

(assert (=> d!125269 (and (or ((_ is MissingVacant!9759) lt!457576) (not ((_ is Found!9759) lt!457576)) (and (bvsge (index!41408 lt!457576) #b00000000000000000000000000000000) (bvslt (index!41408 lt!457576) (size!31997 (_keys!11490 thiss!1427))))) (not ((_ is MissingVacant!9759) lt!457576)) (or (not ((_ is Found!9759) lt!457576)) (= (select (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457576)) key!909)))))

(assert (=> d!125269 (= lt!457576 e!587096)))

(declare-fun c!105150 () Bool)

(assert (=> d!125269 (= c!105150 (and ((_ is Intermediate!9759) lt!457574) (undefined!10571 lt!457574)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65374 (_ BitVec 32)) SeekEntryResult!9759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125269 (= lt!457574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30217 thiss!1427)) key!909 (_keys!11490 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125269 (validMask!0 (mask!30217 thiss!1427))))

(assert (=> d!125269 (= (seekEntry!0 key!909 (_keys!11490 thiss!1427) (mask!30217 thiss!1427)) lt!457576)))

(declare-fun b!1037749 () Bool)

(assert (=> b!1037749 (= e!587098 (MissingZero!9759 (index!41409 lt!457574)))))

(assert (= (and d!125269 c!105150) b!1037745))

(assert (= (and d!125269 (not c!105150)) b!1037746))

(assert (= (and b!1037746 c!105148) b!1037747))

(assert (= (and b!1037746 (not c!105148)) b!1037748))

(assert (= (and b!1037748 c!105149) b!1037749))

(assert (= (and b!1037748 (not c!105149)) b!1037744))

(declare-fun m!957885 () Bool)

(assert (=> b!1037744 m!957885))

(declare-fun m!957887 () Bool)

(assert (=> b!1037746 m!957887))

(declare-fun m!957889 () Bool)

(assert (=> d!125269 m!957889))

(declare-fun m!957891 () Bool)

(assert (=> d!125269 m!957891))

(assert (=> d!125269 m!957891))

(declare-fun m!957893 () Bool)

(assert (=> d!125269 m!957893))

(declare-fun m!957895 () Bool)

(assert (=> d!125269 m!957895))

(assert (=> b!1037686 d!125269))

(declare-fun d!125271 () Bool)

(declare-fun res!692337 () Bool)

(declare-fun e!587101 () Bool)

(assert (=> d!125271 (=> (not res!692337) (not e!587101))))

(declare-fun simpleValid!419 (LongMapFixedSize!5820) Bool)

(assert (=> d!125271 (= res!692337 (simpleValid!419 thiss!1427))))

(assert (=> d!125271 (= (valid!2193 thiss!1427) e!587101)))

(declare-fun b!1037756 () Bool)

(declare-fun res!692338 () Bool)

(assert (=> b!1037756 (=> (not res!692338) (not e!587101))))

(assert (=> b!1037756 (= res!692338 (= (arrayCountValidKeys!0 (_keys!11490 thiss!1427) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) (_size!2965 thiss!1427)))))

(declare-fun b!1037757 () Bool)

(declare-fun res!692339 () Bool)

(assert (=> b!1037757 (=> (not res!692339) (not e!587101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65374 (_ BitVec 32)) Bool)

(assert (=> b!1037757 (= res!692339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11490 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun b!1037758 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65374 (_ BitVec 32) List!21925) Bool)

(assert (=> b!1037758 (= e!587101 (arrayNoDuplicates!0 (_keys!11490 thiss!1427) #b00000000000000000000000000000000 Nil!21922))))

(assert (= (and d!125271 res!692337) b!1037756))

(assert (= (and b!1037756 res!692338) b!1037757))

(assert (= (and b!1037757 res!692339) b!1037758))

(declare-fun m!957897 () Bool)

(assert (=> d!125271 m!957897))

(assert (=> b!1037756 m!957831))

(declare-fun m!957899 () Bool)

(assert (=> b!1037757 m!957899))

(declare-fun m!957901 () Bool)

(assert (=> b!1037758 m!957901))

(assert (=> start!90762 d!125271))

(declare-fun b!1037767 () Bool)

(declare-fun e!587107 () (_ BitVec 32))

(assert (=> b!1037767 (= e!587107 #b00000000000000000000000000000000)))

(declare-fun b!1037768 () Bool)

(declare-fun e!587106 () (_ BitVec 32))

(assert (=> b!1037768 (= e!587107 e!587106)))

(declare-fun c!105156 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037768 (= c!105156 (validKeyInArray!0 (select (arr!31467 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1037769 () Bool)

(declare-fun call!43926 () (_ BitVec 32))

(assert (=> b!1037769 (= e!587106 (bvadd #b00000000000000000000000000000001 call!43926))))

(declare-fun d!125273 () Bool)

(declare-fun lt!457580 () (_ BitVec 32))

(assert (=> d!125273 (and (bvsge lt!457580 #b00000000000000000000000000000000) (bvsle lt!457580 (bvsub (size!31997 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125273 (= lt!457580 e!587107)))

(declare-fun c!105155 () Bool)

(assert (=> d!125273 (= c!105155 (bvsge #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))))))

(assert (=> d!125273 (and (bvsle #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31997 (_keys!11490 thiss!1427)) (size!31997 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427))))))))

(assert (=> d!125273 (= (arrayCountValidKeys!0 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427))) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) lt!457580)))

(declare-fun b!1037770 () Bool)

(assert (=> b!1037770 (= e!587106 call!43926)))

(declare-fun bm!43923 () Bool)

(assert (=> bm!43923 (= call!43926 (arrayCountValidKeys!0 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31997 (_keys!11490 thiss!1427))))))

(assert (= (and d!125273 c!105155) b!1037767))

(assert (= (and d!125273 (not c!105155)) b!1037768))

(assert (= (and b!1037768 c!105156) b!1037769))

(assert (= (and b!1037768 (not c!105156)) b!1037770))

(assert (= (or b!1037769 b!1037770) bm!43923))

(declare-fun m!957903 () Bool)

(assert (=> b!1037768 m!957903))

(assert (=> b!1037768 m!957903))

(declare-fun m!957905 () Bool)

(assert (=> b!1037768 m!957905))

(declare-fun m!957907 () Bool)

(assert (=> bm!43923 m!957907))

(assert (=> b!1037687 d!125273))

(declare-fun b!1037771 () Bool)

(declare-fun e!587109 () (_ BitVec 32))

(assert (=> b!1037771 (= e!587109 #b00000000000000000000000000000000)))

(declare-fun b!1037772 () Bool)

(declare-fun e!587108 () (_ BitVec 32))

(assert (=> b!1037772 (= e!587109 e!587108)))

(declare-fun c!105158 () Bool)

(assert (=> b!1037772 (= c!105158 (validKeyInArray!0 (select (arr!31467 (_keys!11490 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037773 () Bool)

(declare-fun call!43927 () (_ BitVec 32))

(assert (=> b!1037773 (= e!587108 (bvadd #b00000000000000000000000000000001 call!43927))))

(declare-fun d!125275 () Bool)

(declare-fun lt!457581 () (_ BitVec 32))

(assert (=> d!125275 (and (bvsge lt!457581 #b00000000000000000000000000000000) (bvsle lt!457581 (bvsub (size!31997 (_keys!11490 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125275 (= lt!457581 e!587109)))

(declare-fun c!105157 () Bool)

(assert (=> d!125275 (= c!105157 (bvsge #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))))))

(assert (=> d!125275 (and (bvsle #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31997 (_keys!11490 thiss!1427)) (size!31997 (_keys!11490 thiss!1427))))))

(assert (=> d!125275 (= (arrayCountValidKeys!0 (_keys!11490 thiss!1427) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) lt!457581)))

(declare-fun b!1037774 () Bool)

(assert (=> b!1037774 (= e!587108 call!43927)))

(declare-fun bm!43924 () Bool)

(assert (=> bm!43924 (= call!43927 (arrayCountValidKeys!0 (_keys!11490 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31997 (_keys!11490 thiss!1427))))))

(assert (= (and d!125275 c!105157) b!1037771))

(assert (= (and d!125275 (not c!105157)) b!1037772))

(assert (= (and b!1037772 c!105158) b!1037773))

(assert (= (and b!1037772 (not c!105158)) b!1037774))

(assert (= (or b!1037773 b!1037774) bm!43924))

(declare-fun m!957909 () Bool)

(assert (=> b!1037772 m!957909))

(assert (=> b!1037772 m!957909))

(declare-fun m!957911 () Bool)

(assert (=> b!1037772 m!957911))

(declare-fun m!957913 () Bool)

(assert (=> bm!43924 m!957913))

(assert (=> b!1037687 d!125275))

(declare-fun b!1037786 () Bool)

(declare-fun e!587114 () Bool)

(assert (=> b!1037786 (= e!587114 (= (arrayCountValidKeys!0 (array!65375 (store (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31997 (_keys!11490 thiss!1427))) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11490 thiss!1427) #b00000000000000000000000000000000 (size!31997 (_keys!11490 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037784 () Bool)

(declare-fun res!692348 () Bool)

(declare-fun e!587115 () Bool)

(assert (=> b!1037784 (=> (not res!692348) (not e!587115))))

(assert (=> b!1037784 (= res!692348 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125277 () Bool)

(assert (=> d!125277 e!587114))

(declare-fun res!692350 () Bool)

(assert (=> d!125277 (=> (not res!692350) (not e!587114))))

(assert (=> d!125277 (= res!692350 (and (bvsge (index!41408 lt!457554) #b00000000000000000000000000000000) (bvslt (index!41408 lt!457554) (size!31997 (_keys!11490 thiss!1427)))))))

(declare-fun lt!457584 () Unit!33957)

(declare-fun choose!82 (array!65374 (_ BitVec 32) (_ BitVec 64)) Unit!33957)

(assert (=> d!125277 (= lt!457584 (choose!82 (_keys!11490 thiss!1427) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125277 e!587115))

(declare-fun res!692351 () Bool)

(assert (=> d!125277 (=> (not res!692351) (not e!587115))))

(assert (=> d!125277 (= res!692351 (and (bvsge (index!41408 lt!457554) #b00000000000000000000000000000000) (bvslt (index!41408 lt!457554) (size!31997 (_keys!11490 thiss!1427)))))))

(assert (=> d!125277 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11490 thiss!1427) (index!41408 lt!457554) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457584)))

(declare-fun b!1037783 () Bool)

(declare-fun res!692349 () Bool)

(assert (=> b!1037783 (=> (not res!692349) (not e!587115))))

(assert (=> b!1037783 (= res!692349 (validKeyInArray!0 (select (arr!31467 (_keys!11490 thiss!1427)) (index!41408 lt!457554))))))

(declare-fun b!1037785 () Bool)

(assert (=> b!1037785 (= e!587115 (bvslt (size!31997 (_keys!11490 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125277 res!692351) b!1037783))

(assert (= (and b!1037783 res!692349) b!1037784))

(assert (= (and b!1037784 res!692348) b!1037785))

(assert (= (and d!125277 res!692350) b!1037786))

(assert (=> b!1037786 m!957827))

(assert (=> b!1037786 m!957829))

(assert (=> b!1037786 m!957831))

(declare-fun m!957915 () Bool)

(assert (=> b!1037784 m!957915))

(declare-fun m!957917 () Bool)

(assert (=> d!125277 m!957917))

(declare-fun m!957919 () Bool)

(assert (=> b!1037783 m!957919))

(assert (=> b!1037783 m!957919))

(declare-fun m!957921 () Bool)

(assert (=> b!1037783 m!957921))

(assert (=> b!1037687 d!125277))

(declare-fun condMapEmpty!38490 () Bool)

(declare-fun mapDefault!38490 () ValueCell!11613)

(assert (=> mapNonEmpty!38484 (= condMapEmpty!38490 (= mapRest!38484 ((as const (Array (_ BitVec 32) ValueCell!11613)) mapDefault!38490)))))

(declare-fun e!587120 () Bool)

(declare-fun mapRes!38490 () Bool)

(assert (=> mapNonEmpty!38484 (= tp!73890 (and e!587120 mapRes!38490))))

(declare-fun b!1037794 () Bool)

(assert (=> b!1037794 (= e!587120 tp_is_empty!24633)))

(declare-fun mapIsEmpty!38490 () Bool)

(assert (=> mapIsEmpty!38490 mapRes!38490))

(declare-fun mapNonEmpty!38490 () Bool)

(declare-fun tp!73900 () Bool)

(declare-fun e!587121 () Bool)

(assert (=> mapNonEmpty!38490 (= mapRes!38490 (and tp!73900 e!587121))))

(declare-fun mapValue!38490 () ValueCell!11613)

(declare-fun mapRest!38490 () (Array (_ BitVec 32) ValueCell!11613))

(declare-fun mapKey!38490 () (_ BitVec 32))

(assert (=> mapNonEmpty!38490 (= mapRest!38484 (store mapRest!38490 mapKey!38490 mapValue!38490))))

(declare-fun b!1037793 () Bool)

(assert (=> b!1037793 (= e!587121 tp_is_empty!24633)))

(assert (= (and mapNonEmpty!38484 condMapEmpty!38490) mapIsEmpty!38490))

(assert (= (and mapNonEmpty!38484 (not condMapEmpty!38490)) mapNonEmpty!38490))

(assert (= (and mapNonEmpty!38490 ((_ is ValueCellFull!11613) mapValue!38490)) b!1037793))

(assert (= (and mapNonEmpty!38484 ((_ is ValueCellFull!11613) mapDefault!38490)) b!1037794))

(declare-fun m!957923 () Bool)

(assert (=> mapNonEmpty!38490 m!957923))

(check-sat (not b!1037729) (not b!1037728) (not bm!43924) (not b!1037731) (not mapNonEmpty!38490) b_and!33445 tp_is_empty!24633 (not b!1037744) (not d!125259) (not d!125277) (not b!1037757) (not bm!43923) (not b!1037723) (not b!1037786) (not b_next!20913) (not b!1037768) (not b!1037756) (not d!125269) (not b!1037772) (not b!1037783) (not d!125267) (not d!125271) (not b!1037784) (not b!1037758))
(check-sat b_and!33445 (not b_next!20913))
