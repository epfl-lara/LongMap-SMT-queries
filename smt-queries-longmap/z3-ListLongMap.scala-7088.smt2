; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89686 () Bool)

(assert start!89686)

(declare-fun b!1028149 () Bool)

(declare-fun b_free!20581 () Bool)

(declare-fun b_next!20581 () Bool)

(assert (=> b!1028149 (= b_free!20581 (not b_next!20581))))

(declare-fun tp!72796 () Bool)

(declare-fun b_and!32837 () Bool)

(assert (=> b!1028149 (= tp!72796 b_and!32837)))

(declare-fun mapIsEmpty!37887 () Bool)

(declare-fun mapRes!37887 () Bool)

(assert (=> mapIsEmpty!37887 mapRes!37887))

(declare-fun e!580344 () Bool)

(declare-fun e!580349 () Bool)

(declare-fun tp_is_empty!24301 () Bool)

(declare-datatypes ((V!37275 0))(
  ( (V!37276 (val!12201 Int)) )
))
(declare-datatypes ((ValueCell!11447 0))(
  ( (ValueCellFull!11447 (v!14771 V!37275)) (EmptyCell!11447) )
))
(declare-datatypes ((array!64595 0))(
  ( (array!64596 (arr!31104 (Array (_ BitVec 32) (_ BitVec 64))) (size!31620 (_ BitVec 32))) )
))
(declare-datatypes ((array!64597 0))(
  ( (array!64598 (arr!31105 (Array (_ BitVec 32) ValueCell!11447)) (size!31621 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5488 0))(
  ( (LongMapFixedSize!5489 (defaultEntry!6102 Int) (mask!29832 (_ BitVec 32)) (extraKeys!5834 (_ BitVec 32)) (zeroValue!5938 V!37275) (minValue!5938 V!37275) (_size!2799 (_ BitVec 32)) (_keys!11252 array!64595) (_values!6125 array!64597) (_vacant!2799 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5488)

(declare-fun array_inv!24081 (array!64595) Bool)

(declare-fun array_inv!24082 (array!64597) Bool)

(assert (=> b!1028149 (= e!580349 (and tp!72796 tp_is_empty!24301 (array_inv!24081 (_keys!11252 thiss!1427)) (array_inv!24082 (_values!6125 thiss!1427)) e!580344))))

(declare-fun b!1028150 () Bool)

(declare-fun e!580348 () Bool)

(declare-datatypes ((Unit!33461 0))(
  ( (Unit!33462) )
))
(declare-datatypes ((tuple2!15624 0))(
  ( (tuple2!15625 (_1!7823 Unit!33461) (_2!7823 LongMapFixedSize!5488)) )
))
(declare-fun lt!452716 () tuple2!15624)

(assert (=> b!1028150 (= e!580348 (or (not (= (size!31621 (_values!6125 (_2!7823 lt!452716))) (bvadd #b00000000000000000000000000000001 (mask!29832 (_2!7823 lt!452716))))) (= (size!31620 (_keys!11252 (_2!7823 lt!452716))) (size!31621 (_values!6125 (_2!7823 lt!452716))))))))

(declare-fun b!1028151 () Bool)

(declare-fun e!580347 () Bool)

(assert (=> b!1028151 (= e!580347 (not e!580348))))

(declare-fun res!688026 () Bool)

(assert (=> b!1028151 (=> res!688026 e!580348)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028151 (= res!688026 (not (validMask!0 (mask!29832 (_2!7823 lt!452716)))))))

(declare-fun lt!452721 () array!64595)

(declare-fun lt!452715 () array!64597)

(declare-fun Unit!33463 () Unit!33461)

(declare-fun Unit!33464 () Unit!33461)

(assert (=> b!1028151 (= lt!452716 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2799 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15625 Unit!33463 (LongMapFixedSize!5489 (defaultEntry!6102 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvsub (_size!2799 thiss!1427) #b00000000000000000000000000000001) lt!452721 lt!452715 (bvadd #b00000000000000000000000000000001 (_vacant!2799 thiss!1427)))) (tuple2!15625 Unit!33464 (LongMapFixedSize!5489 (defaultEntry!6102 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvsub (_size!2799 thiss!1427) #b00000000000000000000000000000001) lt!452721 lt!452715 (_vacant!2799 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15626 0))(
  ( (tuple2!15627 (_1!7824 (_ BitVec 64)) (_2!7824 V!37275)) )
))
(declare-datatypes ((List!21846 0))(
  ( (Nil!21843) (Cons!21842 (h!23041 tuple2!15626) (t!30913 List!21846)) )
))
(declare-datatypes ((ListLongMap!13747 0))(
  ( (ListLongMap!13748 (toList!6889 List!21846)) )
))
(declare-fun -!481 (ListLongMap!13747 (_ BitVec 64)) ListLongMap!13747)

(declare-fun getCurrentListMap!3856 (array!64595 array!64597 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) Int) ListLongMap!13747)

(assert (=> b!1028151 (= (-!481 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) (getCurrentListMap!3856 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9667 0))(
  ( (MissingZero!9667 (index!41039 (_ BitVec 32))) (Found!9667 (index!41040 (_ BitVec 32))) (Intermediate!9667 (undefined!10479 Bool) (index!41041 (_ BitVec 32)) (x!91492 (_ BitVec 32))) (Undefined!9667) (MissingVacant!9667 (index!41042 (_ BitVec 32))) )
))
(declare-fun lt!452719 () SeekEntryResult!9667)

(declare-fun dynLambda!1943 (Int (_ BitVec 64)) V!37275)

(assert (=> b!1028151 (= lt!452715 (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))))))

(declare-fun lt!452723 () Unit!33461)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!6 (array!64595 array!64597 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) (_ BitVec 64) Int) Unit!33461)

(assert (=> b!1028151 (= lt!452723 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!6 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!41040 lt!452719) key!909 (defaultEntry!6102 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028151 (not (arrayContainsKey!0 lt!452721 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452720 () Unit!33461)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64595 (_ BitVec 32) (_ BitVec 64)) Unit!33461)

(assert (=> b!1028151 (= lt!452720 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11252 thiss!1427) (index!41040 lt!452719) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64595 (_ BitVec 32)) Bool)

(assert (=> b!1028151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452721 (mask!29832 thiss!1427))))

(declare-fun lt!452717 () Unit!33461)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64595 (_ BitVec 32) (_ BitVec 32)) Unit!33461)

(assert (=> b!1028151 (= lt!452717 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11252 thiss!1427) (index!41040 lt!452719) (mask!29832 thiss!1427)))))

(declare-datatypes ((List!21847 0))(
  ( (Nil!21844) (Cons!21843 (h!23042 (_ BitVec 64)) (t!30914 List!21847)) )
))
(declare-fun arrayNoDuplicates!0 (array!64595 (_ BitVec 32) List!21847) Bool)

(assert (=> b!1028151 (arrayNoDuplicates!0 lt!452721 #b00000000000000000000000000000000 Nil!21844)))

(declare-fun lt!452722 () Unit!33461)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64595 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21847) Unit!33461)

(assert (=> b!1028151 (= lt!452722 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11252 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41040 lt!452719) #b00000000000000000000000000000000 Nil!21844))))

(declare-fun arrayCountValidKeys!0 (array!64595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028151 (= (arrayCountValidKeys!0 lt!452721 #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028151 (= lt!452721 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun lt!452718 () Unit!33461)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64595 (_ BitVec 32) (_ BitVec 64)) Unit!33461)

(assert (=> b!1028151 (= lt!452718 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11252 thiss!1427) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028152 () Bool)

(declare-fun e!580350 () Bool)

(assert (=> b!1028152 (= e!580350 tp_is_empty!24301)))

(declare-fun b!1028153 () Bool)

(declare-fun e!580345 () Bool)

(assert (=> b!1028153 (= e!580345 e!580347)))

(declare-fun res!688025 () Bool)

(assert (=> b!1028153 (=> (not res!688025) (not e!580347))))

(get-info :version)

(assert (=> b!1028153 (= res!688025 ((_ is Found!9667) lt!452719))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64595 (_ BitVec 32)) SeekEntryResult!9667)

(assert (=> b!1028153 (= lt!452719 (seekEntry!0 key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(declare-fun b!1028154 () Bool)

(declare-fun res!688027 () Bool)

(assert (=> b!1028154 (=> (not res!688027) (not e!580345))))

(assert (=> b!1028154 (= res!688027 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028155 () Bool)

(declare-fun e!580351 () Bool)

(assert (=> b!1028155 (= e!580351 tp_is_empty!24301)))

(declare-fun mapNonEmpty!37887 () Bool)

(declare-fun tp!72795 () Bool)

(assert (=> mapNonEmpty!37887 (= mapRes!37887 (and tp!72795 e!580350))))

(declare-fun mapKey!37887 () (_ BitVec 32))

(declare-fun mapValue!37887 () ValueCell!11447)

(declare-fun mapRest!37887 () (Array (_ BitVec 32) ValueCell!11447))

(assert (=> mapNonEmpty!37887 (= (arr!31105 (_values!6125 thiss!1427)) (store mapRest!37887 mapKey!37887 mapValue!37887))))

(declare-fun b!1028148 () Bool)

(assert (=> b!1028148 (= e!580344 (and e!580351 mapRes!37887))))

(declare-fun condMapEmpty!37887 () Bool)

(declare-fun mapDefault!37887 () ValueCell!11447)

(assert (=> b!1028148 (= condMapEmpty!37887 (= (arr!31105 (_values!6125 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11447)) mapDefault!37887)))))

(declare-fun res!688028 () Bool)

(assert (=> start!89686 (=> (not res!688028) (not e!580345))))

(declare-fun valid!2070 (LongMapFixedSize!5488) Bool)

(assert (=> start!89686 (= res!688028 (valid!2070 thiss!1427))))

(assert (=> start!89686 e!580345))

(assert (=> start!89686 e!580349))

(assert (=> start!89686 true))

(assert (= (and start!89686 res!688028) b!1028154))

(assert (= (and b!1028154 res!688027) b!1028153))

(assert (= (and b!1028153 res!688025) b!1028151))

(assert (= (and b!1028151 (not res!688026)) b!1028150))

(assert (= (and b!1028148 condMapEmpty!37887) mapIsEmpty!37887))

(assert (= (and b!1028148 (not condMapEmpty!37887)) mapNonEmpty!37887))

(assert (= (and mapNonEmpty!37887 ((_ is ValueCellFull!11447) mapValue!37887)) b!1028152))

(assert (= (and b!1028148 ((_ is ValueCellFull!11447) mapDefault!37887)) b!1028155))

(assert (= b!1028149 b!1028148))

(assert (= start!89686 b!1028149))

(declare-fun b_lambda!15761 () Bool)

(assert (=> (not b_lambda!15761) (not b!1028151)))

(declare-fun t!30912 () Bool)

(declare-fun tb!6891 () Bool)

(assert (=> (and b!1028149 (= (defaultEntry!6102 thiss!1427) (defaultEntry!6102 thiss!1427)) t!30912) tb!6891))

(declare-fun result!14109 () Bool)

(assert (=> tb!6891 (= result!14109 tp_is_empty!24301)))

(assert (=> b!1028151 t!30912))

(declare-fun b_and!32839 () Bool)

(assert (= b_and!32837 (and (=> t!30912 result!14109) b_and!32839)))

(declare-fun m!946479 () Bool)

(assert (=> b!1028149 m!946479))

(declare-fun m!946481 () Bool)

(assert (=> b!1028149 m!946481))

(declare-fun m!946483 () Bool)

(assert (=> start!89686 m!946483))

(declare-fun m!946485 () Bool)

(assert (=> b!1028151 m!946485))

(declare-fun m!946487 () Bool)

(assert (=> b!1028151 m!946487))

(declare-fun m!946489 () Bool)

(assert (=> b!1028151 m!946489))

(declare-fun m!946491 () Bool)

(assert (=> b!1028151 m!946491))

(declare-fun m!946493 () Bool)

(assert (=> b!1028151 m!946493))

(declare-fun m!946495 () Bool)

(assert (=> b!1028151 m!946495))

(declare-fun m!946497 () Bool)

(assert (=> b!1028151 m!946497))

(declare-fun m!946499 () Bool)

(assert (=> b!1028151 m!946499))

(declare-fun m!946501 () Bool)

(assert (=> b!1028151 m!946501))

(declare-fun m!946503 () Bool)

(assert (=> b!1028151 m!946503))

(declare-fun m!946505 () Bool)

(assert (=> b!1028151 m!946505))

(declare-fun m!946507 () Bool)

(assert (=> b!1028151 m!946507))

(assert (=> b!1028151 m!946503))

(declare-fun m!946509 () Bool)

(assert (=> b!1028151 m!946509))

(declare-fun m!946511 () Bool)

(assert (=> b!1028151 m!946511))

(declare-fun m!946513 () Bool)

(assert (=> b!1028151 m!946513))

(declare-fun m!946515 () Bool)

(assert (=> b!1028151 m!946515))

(declare-fun m!946517 () Bool)

(assert (=> b!1028151 m!946517))

(declare-fun m!946519 () Bool)

(assert (=> b!1028153 m!946519))

(declare-fun m!946521 () Bool)

(assert (=> mapNonEmpty!37887 m!946521))

(check-sat (not mapNonEmpty!37887) (not b_next!20581) (not b!1028149) tp_is_empty!24301 (not b!1028151) b_and!32839 (not b_lambda!15761) (not start!89686) (not b!1028153))
(check-sat b_and!32839 (not b_next!20581))
(get-model)

(declare-fun b_lambda!15767 () Bool)

(assert (= b_lambda!15761 (or (and b!1028149 b_free!20581) b_lambda!15767)))

(check-sat (not mapNonEmpty!37887) (not b_lambda!15767) (not b_next!20581) (not b!1028149) tp_is_empty!24301 (not b!1028151) b_and!32839 (not start!89686) (not b!1028153))
(check-sat b_and!32839 (not b_next!20581))
(get-model)

(declare-fun d!122797 () Bool)

(declare-fun lt!452786 () SeekEntryResult!9667)

(assert (=> d!122797 (and (or ((_ is MissingVacant!9667) lt!452786) (not ((_ is Found!9667) lt!452786)) (and (bvsge (index!41040 lt!452786) #b00000000000000000000000000000000) (bvslt (index!41040 lt!452786) (size!31620 (_keys!11252 thiss!1427))))) (not ((_ is MissingVacant!9667) lt!452786)) (or (not ((_ is Found!9667) lt!452786)) (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452786)) key!909)))))

(declare-fun e!580407 () SeekEntryResult!9667)

(assert (=> d!122797 (= lt!452786 e!580407)))

(declare-fun c!103714 () Bool)

(declare-fun lt!452787 () SeekEntryResult!9667)

(assert (=> d!122797 (= c!103714 (and ((_ is Intermediate!9667) lt!452787) (undefined!10479 lt!452787)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64595 (_ BitVec 32)) SeekEntryResult!9667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!122797 (= lt!452787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29832 thiss!1427)) key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(assert (=> d!122797 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122797 (= (seekEntry!0 key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)) lt!452786)))

(declare-fun b!1028222 () Bool)

(assert (=> b!1028222 (= e!580407 Undefined!9667)))

(declare-fun b!1028223 () Bool)

(declare-fun e!580408 () SeekEntryResult!9667)

(assert (=> b!1028223 (= e!580407 e!580408)))

(declare-fun lt!452789 () (_ BitVec 64))

(assert (=> b!1028223 (= lt!452789 (select (arr!31104 (_keys!11252 thiss!1427)) (index!41041 lt!452787)))))

(declare-fun c!103716 () Bool)

(assert (=> b!1028223 (= c!103716 (= lt!452789 key!909))))

(declare-fun b!1028224 () Bool)

(declare-fun e!580406 () SeekEntryResult!9667)

(declare-fun lt!452788 () SeekEntryResult!9667)

(assert (=> b!1028224 (= e!580406 (ite ((_ is MissingVacant!9667) lt!452788) (MissingZero!9667 (index!41042 lt!452788)) lt!452788))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64595 (_ BitVec 32)) SeekEntryResult!9667)

(assert (=> b!1028224 (= lt!452788 (seekKeyOrZeroReturnVacant!0 (x!91492 lt!452787) (index!41041 lt!452787) (index!41041 lt!452787) key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(declare-fun b!1028225 () Bool)

(assert (=> b!1028225 (= e!580406 (MissingZero!9667 (index!41041 lt!452787)))))

(declare-fun b!1028226 () Bool)

(declare-fun c!103715 () Bool)

(assert (=> b!1028226 (= c!103715 (= lt!452789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028226 (= e!580408 e!580406)))

(declare-fun b!1028227 () Bool)

(assert (=> b!1028227 (= e!580408 (Found!9667 (index!41041 lt!452787)))))

(assert (= (and d!122797 c!103714) b!1028222))

(assert (= (and d!122797 (not c!103714)) b!1028223))

(assert (= (and b!1028223 c!103716) b!1028227))

(assert (= (and b!1028223 (not c!103716)) b!1028226))

(assert (= (and b!1028226 c!103715) b!1028225))

(assert (= (and b!1028226 (not c!103715)) b!1028224))

(declare-fun m!946611 () Bool)

(assert (=> d!122797 m!946611))

(declare-fun m!946613 () Bool)

(assert (=> d!122797 m!946613))

(assert (=> d!122797 m!946613))

(declare-fun m!946615 () Bool)

(assert (=> d!122797 m!946615))

(declare-fun m!946617 () Bool)

(assert (=> d!122797 m!946617))

(declare-fun m!946619 () Bool)

(assert (=> b!1028223 m!946619))

(declare-fun m!946621 () Bool)

(assert (=> b!1028224 m!946621))

(assert (=> b!1028153 d!122797))

(declare-fun b!1028236 () Bool)

(declare-fun e!580415 () Bool)

(declare-fun e!580417 () Bool)

(assert (=> b!1028236 (= e!580415 e!580417)))

(declare-fun lt!452796 () (_ BitVec 64))

(assert (=> b!1028236 (= lt!452796 (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))

(declare-fun lt!452798 () Unit!33461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64595 (_ BitVec 64) (_ BitVec 32)) Unit!33461)

(assert (=> b!1028236 (= lt!452798 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452721 lt!452796 #b00000000000000000000000000000000))))

(assert (=> b!1028236 (arrayContainsKey!0 lt!452721 lt!452796 #b00000000000000000000000000000000)))

(declare-fun lt!452797 () Unit!33461)

(assert (=> b!1028236 (= lt!452797 lt!452798)))

(declare-fun res!688058 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64595 (_ BitVec 32)) SeekEntryResult!9667)

(assert (=> b!1028236 (= res!688058 (= (seekEntryOrOpen!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) lt!452721 (mask!29832 thiss!1427)) (Found!9667 #b00000000000000000000000000000000)))))

(assert (=> b!1028236 (=> (not res!688058) (not e!580417))))

(declare-fun b!1028237 () Bool)

(declare-fun call!43318 () Bool)

(assert (=> b!1028237 (= e!580415 call!43318)))

(declare-fun b!1028238 () Bool)

(declare-fun e!580416 () Bool)

(assert (=> b!1028238 (= e!580416 e!580415)))

(declare-fun c!103719 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1028238 (= c!103719 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun d!122799 () Bool)

(declare-fun res!688057 () Bool)

(assert (=> d!122799 (=> res!688057 e!580416)))

(assert (=> d!122799 (= res!688057 (bvsge #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(assert (=> d!122799 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452721 (mask!29832 thiss!1427)) e!580416)))

(declare-fun b!1028239 () Bool)

(assert (=> b!1028239 (= e!580417 call!43318)))

(declare-fun bm!43315 () Bool)

(assert (=> bm!43315 (= call!43318 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452721 (mask!29832 thiss!1427)))))

(assert (= (and d!122799 (not res!688057)) b!1028238))

(assert (= (and b!1028238 c!103719) b!1028236))

(assert (= (and b!1028238 (not c!103719)) b!1028237))

(assert (= (and b!1028236 res!688058) b!1028239))

(assert (= (or b!1028239 b!1028237) bm!43315))

(declare-fun m!946623 () Bool)

(assert (=> b!1028236 m!946623))

(declare-fun m!946625 () Bool)

(assert (=> b!1028236 m!946625))

(declare-fun m!946627 () Bool)

(assert (=> b!1028236 m!946627))

(assert (=> b!1028236 m!946623))

(declare-fun m!946629 () Bool)

(assert (=> b!1028236 m!946629))

(assert (=> b!1028238 m!946623))

(assert (=> b!1028238 m!946623))

(declare-fun m!946631 () Bool)

(assert (=> b!1028238 m!946631))

(declare-fun m!946633 () Bool)

(assert (=> bm!43315 m!946633))

(assert (=> b!1028151 d!122799))

(declare-fun b!1028248 () Bool)

(declare-fun e!580422 () (_ BitVec 32))

(assert (=> b!1028248 (= e!580422 #b00000000000000000000000000000000)))

(declare-fun bm!43318 () Bool)

(declare-fun call!43321 () (_ BitVec 32))

(assert (=> bm!43318 (= call!43321 (arrayCountValidKeys!0 lt!452721 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028249 () Bool)

(declare-fun e!580423 () (_ BitVec 32))

(assert (=> b!1028249 (= e!580422 e!580423)))

(declare-fun c!103725 () Bool)

(assert (=> b!1028249 (= c!103725 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun d!122801 () Bool)

(declare-fun lt!452801 () (_ BitVec 32))

(assert (=> d!122801 (and (bvsge lt!452801 #b00000000000000000000000000000000) (bvsle lt!452801 (bvsub (size!31620 lt!452721) #b00000000000000000000000000000000)))))

(assert (=> d!122801 (= lt!452801 e!580422)))

(declare-fun c!103724 () Bool)

(assert (=> d!122801 (= c!103724 (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122801 (and (bvsle #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31620 (_keys!11252 thiss!1427)) (size!31620 lt!452721)))))

(assert (=> d!122801 (= (arrayCountValidKeys!0 lt!452721 #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) lt!452801)))

(declare-fun b!1028250 () Bool)

(assert (=> b!1028250 (= e!580423 (bvadd #b00000000000000000000000000000001 call!43321))))

(declare-fun b!1028251 () Bool)

(assert (=> b!1028251 (= e!580423 call!43321)))

(assert (= (and d!122801 c!103724) b!1028248))

(assert (= (and d!122801 (not c!103724)) b!1028249))

(assert (= (and b!1028249 c!103725) b!1028250))

(assert (= (and b!1028249 (not c!103725)) b!1028251))

(assert (= (or b!1028250 b!1028251) bm!43318))

(declare-fun m!946635 () Bool)

(assert (=> bm!43318 m!946635))

(assert (=> b!1028249 m!946623))

(assert (=> b!1028249 m!946623))

(assert (=> b!1028249 m!946631))

(assert (=> b!1028151 d!122801))

(declare-fun b!1028294 () Bool)

(declare-fun e!580456 () Bool)

(declare-fun lt!452856 () ListLongMap!13747)

(declare-fun apply!894 (ListLongMap!13747 (_ BitVec 64)) V!37275)

(assert (=> b!1028294 (= e!580456 (= (apply!894 lt!452856 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5938 thiss!1427)))))

(declare-fun b!1028295 () Bool)

(declare-fun e!580457 () ListLongMap!13747)

(declare-fun call!43338 () ListLongMap!13747)

(declare-fun +!3125 (ListLongMap!13747 tuple2!15626) ListLongMap!13747)

(assert (=> b!1028295 (= e!580457 (+!3125 call!43338 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(declare-fun bm!43333 () Bool)

(declare-fun call!43340 () ListLongMap!13747)

(declare-fun call!43336 () ListLongMap!13747)

(assert (=> bm!43333 (= call!43340 call!43336)))

(declare-fun b!1028296 () Bool)

(declare-fun res!688082 () Bool)

(declare-fun e!580452 () Bool)

(assert (=> b!1028296 (=> (not res!688082) (not e!580452))))

(declare-fun e!580450 () Bool)

(assert (=> b!1028296 (= res!688082 e!580450)))

(declare-fun res!688078 () Bool)

(assert (=> b!1028296 (=> res!688078 e!580450)))

(declare-fun e!580461 () Bool)

(assert (=> b!1028296 (= res!688078 (not e!580461))))

(declare-fun res!688080 () Bool)

(assert (=> b!1028296 (=> (not res!688080) (not e!580461))))

(assert (=> b!1028296 (= res!688080 (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028297 () Bool)

(declare-fun res!688077 () Bool)

(assert (=> b!1028297 (=> (not res!688077) (not e!580452))))

(declare-fun e!580453 () Bool)

(assert (=> b!1028297 (= res!688077 e!580453)))

(declare-fun c!103743 () Bool)

(assert (=> b!1028297 (= c!103743 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028298 () Bool)

(declare-fun e!580455 () Bool)

(assert (=> b!1028298 (= e!580452 e!580455)))

(declare-fun c!103742 () Bool)

(assert (=> b!1028298 (= c!103742 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!103738 () Bool)

(declare-fun call!43337 () ListLongMap!13747)

(declare-fun c!103740 () Bool)

(declare-fun bm!43334 () Bool)

(assert (=> bm!43334 (= call!43338 (+!3125 (ite c!103740 call!43337 (ite c!103738 call!43336 call!43340)) (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun bm!43335 () Bool)

(declare-fun call!43342 () Bool)

(declare-fun contains!5946 (ListLongMap!13747 (_ BitVec 64)) Bool)

(assert (=> bm!43335 (= call!43342 (contains!5946 lt!452856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028299 () Bool)

(assert (=> b!1028299 (= e!580453 (not call!43342))))

(declare-fun b!1028300 () Bool)

(assert (=> b!1028300 (= e!580455 e!580456)))

(declare-fun res!688084 () Bool)

(declare-fun call!43341 () Bool)

(assert (=> b!1028300 (= res!688084 call!43341)))

(assert (=> b!1028300 (=> (not res!688084) (not e!580456))))

(declare-fun d!122803 () Bool)

(assert (=> d!122803 e!580452))

(declare-fun res!688085 () Bool)

(assert (=> d!122803 (=> (not res!688085) (not e!580452))))

(assert (=> d!122803 (= res!688085 (or (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))))

(declare-fun lt!452852 () ListLongMap!13747)

(assert (=> d!122803 (= lt!452856 lt!452852)))

(declare-fun lt!452850 () Unit!33461)

(declare-fun e!580458 () Unit!33461)

(assert (=> d!122803 (= lt!452850 e!580458)))

(declare-fun c!103741 () Bool)

(declare-fun e!580459 () Bool)

(assert (=> d!122803 (= c!103741 e!580459)))

(declare-fun res!688081 () Bool)

(assert (=> d!122803 (=> (not res!688081) (not e!580459))))

(assert (=> d!122803 (= res!688081 (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122803 (= lt!452852 e!580457)))

(assert (=> d!122803 (= c!103740 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122803 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122803 (= (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!452856)))

(declare-fun b!1028301 () Bool)

(assert (=> b!1028301 (= e!580461 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028302 () Bool)

(declare-fun e!580462 () Bool)

(assert (=> b!1028302 (= e!580453 e!580462)))

(declare-fun res!688079 () Bool)

(assert (=> b!1028302 (= res!688079 call!43342)))

(assert (=> b!1028302 (=> (not res!688079) (not e!580462))))

(declare-fun b!1028303 () Bool)

(assert (=> b!1028303 (= e!580459 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028304 () Bool)

(declare-fun c!103739 () Bool)

(assert (=> b!1028304 (= c!103739 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580460 () ListLongMap!13747)

(declare-fun e!580454 () ListLongMap!13747)

(assert (=> b!1028304 (= e!580460 e!580454)))

(declare-fun b!1028305 () Bool)

(declare-fun call!43339 () ListLongMap!13747)

(assert (=> b!1028305 (= e!580454 call!43339)))

(declare-fun bm!43336 () Bool)

(assert (=> bm!43336 (= call!43339 call!43338)))

(declare-fun bm!43337 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3560 (array!64595 array!64597 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) Int) ListLongMap!13747)

(assert (=> bm!43337 (= call!43337 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1028306 () Bool)

(assert (=> b!1028306 (= e!580454 call!43340)))

(declare-fun b!1028307 () Bool)

(assert (=> b!1028307 (= e!580462 (= (apply!894 lt!452856 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5938 thiss!1427)))))

(declare-fun b!1028308 () Bool)

(assert (=> b!1028308 (= e!580460 call!43339)))

(declare-fun b!1028309 () Bool)

(assert (=> b!1028309 (= e!580457 e!580460)))

(assert (=> b!1028309 (= c!103738 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43338 () Bool)

(assert (=> bm!43338 (= call!43336 call!43337)))

(declare-fun b!1028310 () Bool)

(declare-fun e!580451 () Bool)

(declare-fun get!16342 (ValueCell!11447 V!37275) V!37275)

(assert (=> b!1028310 (= e!580451 (= (apply!894 lt!452856 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)) (get!16342 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31621 (_values!6125 thiss!1427))))))

(assert (=> b!1028310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028311 () Bool)

(assert (=> b!1028311 (= e!580455 (not call!43341))))

(declare-fun bm!43339 () Bool)

(assert (=> bm!43339 (= call!43341 (contains!5946 lt!452856 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028312 () Bool)

(declare-fun lt!452848 () Unit!33461)

(assert (=> b!1028312 (= e!580458 lt!452848)))

(declare-fun lt!452866 () ListLongMap!13747)

(assert (=> b!1028312 (= lt!452866 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452858 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452861 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452861 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452847 () Unit!33461)

(declare-fun addStillContains!613 (ListLongMap!13747 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33461)

(assert (=> b!1028312 (= lt!452847 (addStillContains!613 lt!452866 lt!452858 (zeroValue!5938 thiss!1427) lt!452861))))

(assert (=> b!1028312 (contains!5946 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))) lt!452861)))

(declare-fun lt!452849 () Unit!33461)

(assert (=> b!1028312 (= lt!452849 lt!452847)))

(declare-fun lt!452859 () ListLongMap!13747)

(assert (=> b!1028312 (= lt!452859 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452867 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452846 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452846 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452863 () Unit!33461)

(declare-fun addApplyDifferent!469 (ListLongMap!13747 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33461)

(assert (=> b!1028312 (= lt!452863 (addApplyDifferent!469 lt!452859 lt!452867 (minValue!5938 thiss!1427) lt!452846))))

(assert (=> b!1028312 (= (apply!894 (+!3125 lt!452859 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))) lt!452846) (apply!894 lt!452859 lt!452846))))

(declare-fun lt!452864 () Unit!33461)

(assert (=> b!1028312 (= lt!452864 lt!452863)))

(declare-fun lt!452865 () ListLongMap!13747)

(assert (=> b!1028312 (= lt!452865 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452855 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452862 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452862 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452851 () Unit!33461)

(assert (=> b!1028312 (= lt!452851 (addApplyDifferent!469 lt!452865 lt!452855 (zeroValue!5938 thiss!1427) lt!452862))))

(assert (=> b!1028312 (= (apply!894 (+!3125 lt!452865 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))) lt!452862) (apply!894 lt!452865 lt!452862))))

(declare-fun lt!452853 () Unit!33461)

(assert (=> b!1028312 (= lt!452853 lt!452851)))

(declare-fun lt!452857 () ListLongMap!13747)

(assert (=> b!1028312 (= lt!452857 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452854 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452860 () (_ BitVec 64))

(assert (=> b!1028312 (= lt!452860 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028312 (= lt!452848 (addApplyDifferent!469 lt!452857 lt!452854 (minValue!5938 thiss!1427) lt!452860))))

(assert (=> b!1028312 (= (apply!894 (+!3125 lt!452857 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))) lt!452860) (apply!894 lt!452857 lt!452860))))

(declare-fun b!1028313 () Bool)

(declare-fun Unit!33473 () Unit!33461)

(assert (=> b!1028313 (= e!580458 Unit!33473)))

(declare-fun b!1028314 () Bool)

(assert (=> b!1028314 (= e!580450 e!580451)))

(declare-fun res!688083 () Bool)

(assert (=> b!1028314 (=> (not res!688083) (not e!580451))))

(assert (=> b!1028314 (= res!688083 (contains!5946 lt!452856 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (= (and d!122803 c!103740) b!1028295))

(assert (= (and d!122803 (not c!103740)) b!1028309))

(assert (= (and b!1028309 c!103738) b!1028308))

(assert (= (and b!1028309 (not c!103738)) b!1028304))

(assert (= (and b!1028304 c!103739) b!1028305))

(assert (= (and b!1028304 (not c!103739)) b!1028306))

(assert (= (or b!1028305 b!1028306) bm!43333))

(assert (= (or b!1028308 bm!43333) bm!43338))

(assert (= (or b!1028308 b!1028305) bm!43336))

(assert (= (or b!1028295 bm!43338) bm!43337))

(assert (= (or b!1028295 bm!43336) bm!43334))

(assert (= (and d!122803 res!688081) b!1028303))

(assert (= (and d!122803 c!103741) b!1028312))

(assert (= (and d!122803 (not c!103741)) b!1028313))

(assert (= (and d!122803 res!688085) b!1028296))

(assert (= (and b!1028296 res!688080) b!1028301))

(assert (= (and b!1028296 (not res!688078)) b!1028314))

(assert (= (and b!1028314 res!688083) b!1028310))

(assert (= (and b!1028296 res!688082) b!1028297))

(assert (= (and b!1028297 c!103743) b!1028302))

(assert (= (and b!1028297 (not c!103743)) b!1028299))

(assert (= (and b!1028302 res!688079) b!1028307))

(assert (= (or b!1028302 b!1028299) bm!43335))

(assert (= (and b!1028297 res!688077) b!1028298))

(assert (= (and b!1028298 c!103742) b!1028300))

(assert (= (and b!1028298 (not c!103742)) b!1028311))

(assert (= (and b!1028300 res!688084) b!1028294))

(assert (= (or b!1028300 b!1028311) bm!43339))

(declare-fun b_lambda!15769 () Bool)

(assert (=> (not b_lambda!15769) (not b!1028310)))

(assert (=> b!1028310 t!30912))

(declare-fun b_and!32849 () Bool)

(assert (= b_and!32839 (and (=> t!30912 result!14109) b_and!32849)))

(declare-fun m!946637 () Bool)

(assert (=> b!1028312 m!946637))

(declare-fun m!946639 () Bool)

(assert (=> b!1028312 m!946639))

(declare-fun m!946641 () Bool)

(assert (=> b!1028312 m!946641))

(declare-fun m!946643 () Bool)

(assert (=> b!1028312 m!946643))

(declare-fun m!946645 () Bool)

(assert (=> b!1028312 m!946645))

(declare-fun m!946647 () Bool)

(assert (=> b!1028312 m!946647))

(declare-fun m!946649 () Bool)

(assert (=> b!1028312 m!946649))

(declare-fun m!946651 () Bool)

(assert (=> b!1028312 m!946651))

(declare-fun m!946653 () Bool)

(assert (=> b!1028312 m!946653))

(declare-fun m!946655 () Bool)

(assert (=> b!1028312 m!946655))

(declare-fun m!946657 () Bool)

(assert (=> b!1028312 m!946657))

(declare-fun m!946659 () Bool)

(assert (=> b!1028312 m!946659))

(assert (=> b!1028312 m!946657))

(assert (=> b!1028312 m!946639))

(declare-fun m!946661 () Bool)

(assert (=> b!1028312 m!946661))

(declare-fun m!946663 () Bool)

(assert (=> b!1028312 m!946663))

(declare-fun m!946665 () Bool)

(assert (=> b!1028312 m!946665))

(declare-fun m!946667 () Bool)

(assert (=> b!1028312 m!946667))

(assert (=> b!1028312 m!946663))

(assert (=> b!1028312 m!946651))

(declare-fun m!946669 () Bool)

(assert (=> b!1028312 m!946669))

(declare-fun m!946671 () Bool)

(assert (=> b!1028294 m!946671))

(declare-fun m!946673 () Bool)

(assert (=> b!1028310 m!946673))

(assert (=> b!1028310 m!946655))

(assert (=> b!1028310 m!946673))

(assert (=> b!1028310 m!946517))

(declare-fun m!946675 () Bool)

(assert (=> b!1028310 m!946675))

(assert (=> b!1028310 m!946655))

(declare-fun m!946677 () Bool)

(assert (=> b!1028310 m!946677))

(assert (=> b!1028310 m!946517))

(declare-fun m!946679 () Bool)

(assert (=> b!1028307 m!946679))

(assert (=> b!1028301 m!946655))

(assert (=> b!1028301 m!946655))

(declare-fun m!946681 () Bool)

(assert (=> b!1028301 m!946681))

(assert (=> b!1028303 m!946655))

(assert (=> b!1028303 m!946655))

(assert (=> b!1028303 m!946681))

(declare-fun m!946683 () Bool)

(assert (=> bm!43335 m!946683))

(declare-fun m!946685 () Bool)

(assert (=> bm!43334 m!946685))

(assert (=> b!1028314 m!946655))

(assert (=> b!1028314 m!946655))

(declare-fun m!946687 () Bool)

(assert (=> b!1028314 m!946687))

(declare-fun m!946689 () Bool)

(assert (=> b!1028295 m!946689))

(declare-fun m!946691 () Bool)

(assert (=> bm!43339 m!946691))

(assert (=> bm!43337 m!946649))

(assert (=> d!122803 m!946617))

(assert (=> b!1028151 d!122803))

(declare-fun d!122805 () Bool)

(declare-fun lt!452870 () ListLongMap!13747)

(assert (=> d!122805 (not (contains!5946 lt!452870 key!909))))

(declare-fun removeStrictlySorted!51 (List!21846 (_ BitVec 64)) List!21846)

(assert (=> d!122805 (= lt!452870 (ListLongMap!13748 (removeStrictlySorted!51 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))) key!909)))))

(assert (=> d!122805 (= (-!481 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) lt!452870)))

(declare-fun bs!29994 () Bool)

(assert (= bs!29994 d!122805))

(declare-fun m!946693 () Bool)

(assert (=> bs!29994 m!946693))

(declare-fun m!946695 () Bool)

(assert (=> bs!29994 m!946695))

(assert (=> b!1028151 d!122805))

(declare-fun b!1028315 () Bool)

(declare-fun e!580469 () Bool)

(declare-fun lt!452881 () ListLongMap!13747)

(assert (=> b!1028315 (= e!580469 (= (apply!894 lt!452881 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5938 thiss!1427)))))

(declare-fun b!1028316 () Bool)

(declare-fun e!580470 () ListLongMap!13747)

(declare-fun call!43345 () ListLongMap!13747)

(assert (=> b!1028316 (= e!580470 (+!3125 call!43345 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(declare-fun bm!43340 () Bool)

(declare-fun call!43347 () ListLongMap!13747)

(declare-fun call!43343 () ListLongMap!13747)

(assert (=> bm!43340 (= call!43347 call!43343)))

(declare-fun b!1028317 () Bool)

(declare-fun res!688091 () Bool)

(declare-fun e!580465 () Bool)

(assert (=> b!1028317 (=> (not res!688091) (not e!580465))))

(declare-fun e!580463 () Bool)

(assert (=> b!1028317 (= res!688091 e!580463)))

(declare-fun res!688087 () Bool)

(assert (=> b!1028317 (=> res!688087 e!580463)))

(declare-fun e!580474 () Bool)

(assert (=> b!1028317 (= res!688087 (not e!580474))))

(declare-fun res!688089 () Bool)

(assert (=> b!1028317 (=> (not res!688089) (not e!580474))))

(assert (=> b!1028317 (= res!688089 (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(declare-fun b!1028318 () Bool)

(declare-fun res!688086 () Bool)

(assert (=> b!1028318 (=> (not res!688086) (not e!580465))))

(declare-fun e!580466 () Bool)

(assert (=> b!1028318 (= res!688086 e!580466)))

(declare-fun c!103749 () Bool)

(assert (=> b!1028318 (= c!103749 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028319 () Bool)

(declare-fun e!580468 () Bool)

(assert (=> b!1028319 (= e!580465 e!580468)))

(declare-fun c!103748 () Bool)

(assert (=> b!1028319 (= c!103748 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!103746 () Bool)

(declare-fun bm!43341 () Bool)

(declare-fun c!103744 () Bool)

(declare-fun call!43344 () ListLongMap!13747)

(assert (=> bm!43341 (= call!43345 (+!3125 (ite c!103746 call!43344 (ite c!103744 call!43343 call!43347)) (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun bm!43342 () Bool)

(declare-fun call!43349 () Bool)

(assert (=> bm!43342 (= call!43349 (contains!5946 lt!452881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028320 () Bool)

(assert (=> b!1028320 (= e!580466 (not call!43349))))

(declare-fun b!1028321 () Bool)

(assert (=> b!1028321 (= e!580468 e!580469)))

(declare-fun res!688093 () Bool)

(declare-fun call!43348 () Bool)

(assert (=> b!1028321 (= res!688093 call!43348)))

(assert (=> b!1028321 (=> (not res!688093) (not e!580469))))

(declare-fun d!122807 () Bool)

(assert (=> d!122807 e!580465))

(declare-fun res!688094 () Bool)

(assert (=> d!122807 (=> (not res!688094) (not e!580465))))

(assert (=> d!122807 (= res!688094 (or (bvsge #b00000000000000000000000000000000 (size!31620 lt!452721)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))))

(declare-fun lt!452877 () ListLongMap!13747)

(assert (=> d!122807 (= lt!452881 lt!452877)))

(declare-fun lt!452875 () Unit!33461)

(declare-fun e!580471 () Unit!33461)

(assert (=> d!122807 (= lt!452875 e!580471)))

(declare-fun c!103747 () Bool)

(declare-fun e!580472 () Bool)

(assert (=> d!122807 (= c!103747 e!580472)))

(declare-fun res!688090 () Bool)

(assert (=> d!122807 (=> (not res!688090) (not e!580472))))

(assert (=> d!122807 (= res!688090 (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(assert (=> d!122807 (= lt!452877 e!580470)))

(assert (=> d!122807 (= c!103746 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122807 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122807 (= (getCurrentListMap!3856 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!452881)))

(declare-fun b!1028322 () Bool)

(assert (=> b!1028322 (= e!580474 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028323 () Bool)

(declare-fun e!580475 () Bool)

(assert (=> b!1028323 (= e!580466 e!580475)))

(declare-fun res!688088 () Bool)

(assert (=> b!1028323 (= res!688088 call!43349)))

(assert (=> b!1028323 (=> (not res!688088) (not e!580475))))

(declare-fun b!1028324 () Bool)

(assert (=> b!1028324 (= e!580472 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028325 () Bool)

(declare-fun c!103745 () Bool)

(assert (=> b!1028325 (= c!103745 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580473 () ListLongMap!13747)

(declare-fun e!580467 () ListLongMap!13747)

(assert (=> b!1028325 (= e!580473 e!580467)))

(declare-fun b!1028326 () Bool)

(declare-fun call!43346 () ListLongMap!13747)

(assert (=> b!1028326 (= e!580467 call!43346)))

(declare-fun bm!43343 () Bool)

(assert (=> bm!43343 (= call!43346 call!43345)))

(declare-fun bm!43344 () Bool)

(assert (=> bm!43344 (= call!43344 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1028327 () Bool)

(assert (=> b!1028327 (= e!580467 call!43347)))

(declare-fun b!1028328 () Bool)

(assert (=> b!1028328 (= e!580475 (= (apply!894 lt!452881 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5938 thiss!1427)))))

(declare-fun b!1028329 () Bool)

(assert (=> b!1028329 (= e!580473 call!43346)))

(declare-fun b!1028330 () Bool)

(assert (=> b!1028330 (= e!580470 e!580473)))

(assert (=> b!1028330 (= c!103744 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43345 () Bool)

(assert (=> bm!43345 (= call!43343 call!43344)))

(declare-fun b!1028331 () Bool)

(declare-fun e!580464 () Bool)

(assert (=> b!1028331 (= e!580464 (= (apply!894 lt!452881 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) (get!16342 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31621 lt!452715)))))

(assert (=> b!1028331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(declare-fun b!1028332 () Bool)

(assert (=> b!1028332 (= e!580468 (not call!43348))))

(declare-fun bm!43346 () Bool)

(assert (=> bm!43346 (= call!43348 (contains!5946 lt!452881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028333 () Bool)

(declare-fun lt!452873 () Unit!33461)

(assert (=> b!1028333 (= e!580471 lt!452873)))

(declare-fun lt!452891 () ListLongMap!13747)

(assert (=> b!1028333 (= lt!452891 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452883 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452886 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452886 (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))

(declare-fun lt!452872 () Unit!33461)

(assert (=> b!1028333 (= lt!452872 (addStillContains!613 lt!452891 lt!452883 (zeroValue!5938 thiss!1427) lt!452886))))

(assert (=> b!1028333 (contains!5946 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))) lt!452886)))

(declare-fun lt!452874 () Unit!33461)

(assert (=> b!1028333 (= lt!452874 lt!452872)))

(declare-fun lt!452884 () ListLongMap!13747)

(assert (=> b!1028333 (= lt!452884 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452892 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452892 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452871 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452871 (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))

(declare-fun lt!452888 () Unit!33461)

(assert (=> b!1028333 (= lt!452888 (addApplyDifferent!469 lt!452884 lt!452892 (minValue!5938 thiss!1427) lt!452871))))

(assert (=> b!1028333 (= (apply!894 (+!3125 lt!452884 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))) lt!452871) (apply!894 lt!452884 lt!452871))))

(declare-fun lt!452889 () Unit!33461)

(assert (=> b!1028333 (= lt!452889 lt!452888)))

(declare-fun lt!452890 () ListLongMap!13747)

(assert (=> b!1028333 (= lt!452890 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452880 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452887 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452887 (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))

(declare-fun lt!452876 () Unit!33461)

(assert (=> b!1028333 (= lt!452876 (addApplyDifferent!469 lt!452890 lt!452880 (zeroValue!5938 thiss!1427) lt!452887))))

(assert (=> b!1028333 (= (apply!894 (+!3125 lt!452890 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))) lt!452887) (apply!894 lt!452890 lt!452887))))

(declare-fun lt!452878 () Unit!33461)

(assert (=> b!1028333 (= lt!452878 lt!452876)))

(declare-fun lt!452882 () ListLongMap!13747)

(assert (=> b!1028333 (= lt!452882 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!452879 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452879 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452885 () (_ BitVec 64))

(assert (=> b!1028333 (= lt!452885 (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))

(assert (=> b!1028333 (= lt!452873 (addApplyDifferent!469 lt!452882 lt!452879 (minValue!5938 thiss!1427) lt!452885))))

(assert (=> b!1028333 (= (apply!894 (+!3125 lt!452882 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))) lt!452885) (apply!894 lt!452882 lt!452885))))

(declare-fun b!1028334 () Bool)

(declare-fun Unit!33474 () Unit!33461)

(assert (=> b!1028334 (= e!580471 Unit!33474)))

(declare-fun b!1028335 () Bool)

(assert (=> b!1028335 (= e!580463 e!580464)))

(declare-fun res!688092 () Bool)

(assert (=> b!1028335 (=> (not res!688092) (not e!580464))))

(assert (=> b!1028335 (= res!688092 (contains!5946 lt!452881 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (=> b!1028335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(assert (= (and d!122807 c!103746) b!1028316))

(assert (= (and d!122807 (not c!103746)) b!1028330))

(assert (= (and b!1028330 c!103744) b!1028329))

(assert (= (and b!1028330 (not c!103744)) b!1028325))

(assert (= (and b!1028325 c!103745) b!1028326))

(assert (= (and b!1028325 (not c!103745)) b!1028327))

(assert (= (or b!1028326 b!1028327) bm!43340))

(assert (= (or b!1028329 bm!43340) bm!43345))

(assert (= (or b!1028329 b!1028326) bm!43343))

(assert (= (or b!1028316 bm!43345) bm!43344))

(assert (= (or b!1028316 bm!43343) bm!43341))

(assert (= (and d!122807 res!688090) b!1028324))

(assert (= (and d!122807 c!103747) b!1028333))

(assert (= (and d!122807 (not c!103747)) b!1028334))

(assert (= (and d!122807 res!688094) b!1028317))

(assert (= (and b!1028317 res!688089) b!1028322))

(assert (= (and b!1028317 (not res!688087)) b!1028335))

(assert (= (and b!1028335 res!688092) b!1028331))

(assert (= (and b!1028317 res!688091) b!1028318))

(assert (= (and b!1028318 c!103749) b!1028323))

(assert (= (and b!1028318 (not c!103749)) b!1028320))

(assert (= (and b!1028323 res!688088) b!1028328))

(assert (= (or b!1028323 b!1028320) bm!43342))

(assert (= (and b!1028318 res!688086) b!1028319))

(assert (= (and b!1028319 c!103748) b!1028321))

(assert (= (and b!1028319 (not c!103748)) b!1028332))

(assert (= (and b!1028321 res!688093) b!1028315))

(assert (= (or b!1028321 b!1028332) bm!43346))

(declare-fun b_lambda!15771 () Bool)

(assert (=> (not b_lambda!15771) (not b!1028331)))

(assert (=> b!1028331 t!30912))

(declare-fun b_and!32851 () Bool)

(assert (= b_and!32849 (and (=> t!30912 result!14109) b_and!32851)))

(declare-fun m!946697 () Bool)

(assert (=> b!1028333 m!946697))

(declare-fun m!946699 () Bool)

(assert (=> b!1028333 m!946699))

(declare-fun m!946701 () Bool)

(assert (=> b!1028333 m!946701))

(declare-fun m!946703 () Bool)

(assert (=> b!1028333 m!946703))

(declare-fun m!946705 () Bool)

(assert (=> b!1028333 m!946705))

(declare-fun m!946707 () Bool)

(assert (=> b!1028333 m!946707))

(declare-fun m!946709 () Bool)

(assert (=> b!1028333 m!946709))

(declare-fun m!946711 () Bool)

(assert (=> b!1028333 m!946711))

(declare-fun m!946713 () Bool)

(assert (=> b!1028333 m!946713))

(assert (=> b!1028333 m!946623))

(declare-fun m!946715 () Bool)

(assert (=> b!1028333 m!946715))

(declare-fun m!946717 () Bool)

(assert (=> b!1028333 m!946717))

(assert (=> b!1028333 m!946715))

(assert (=> b!1028333 m!946699))

(declare-fun m!946719 () Bool)

(assert (=> b!1028333 m!946719))

(declare-fun m!946721 () Bool)

(assert (=> b!1028333 m!946721))

(declare-fun m!946723 () Bool)

(assert (=> b!1028333 m!946723))

(declare-fun m!946725 () Bool)

(assert (=> b!1028333 m!946725))

(assert (=> b!1028333 m!946721))

(assert (=> b!1028333 m!946711))

(declare-fun m!946727 () Bool)

(assert (=> b!1028333 m!946727))

(declare-fun m!946729 () Bool)

(assert (=> b!1028315 m!946729))

(declare-fun m!946731 () Bool)

(assert (=> b!1028331 m!946731))

(assert (=> b!1028331 m!946623))

(assert (=> b!1028331 m!946731))

(assert (=> b!1028331 m!946517))

(declare-fun m!946733 () Bool)

(assert (=> b!1028331 m!946733))

(assert (=> b!1028331 m!946623))

(declare-fun m!946735 () Bool)

(assert (=> b!1028331 m!946735))

(assert (=> b!1028331 m!946517))

(declare-fun m!946737 () Bool)

(assert (=> b!1028328 m!946737))

(assert (=> b!1028322 m!946623))

(assert (=> b!1028322 m!946623))

(assert (=> b!1028322 m!946631))

(assert (=> b!1028324 m!946623))

(assert (=> b!1028324 m!946623))

(assert (=> b!1028324 m!946631))

(declare-fun m!946739 () Bool)

(assert (=> bm!43342 m!946739))

(declare-fun m!946741 () Bool)

(assert (=> bm!43341 m!946741))

(assert (=> b!1028335 m!946623))

(assert (=> b!1028335 m!946623))

(declare-fun m!946743 () Bool)

(assert (=> b!1028335 m!946743))

(declare-fun m!946745 () Bool)

(assert (=> b!1028316 m!946745))

(declare-fun m!946747 () Bool)

(assert (=> bm!43346 m!946747))

(assert (=> bm!43344 m!946709))

(assert (=> d!122807 m!946617))

(assert (=> b!1028151 d!122807))

(declare-fun d!122809 () Bool)

(declare-fun e!580478 () Bool)

(assert (=> d!122809 e!580478))

(declare-fun res!688097 () Bool)

(assert (=> d!122809 (=> (not res!688097) (not e!580478))))

(assert (=> d!122809 (= res!688097 (bvslt (index!41040 lt!452719) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun lt!452895 () Unit!33461)

(declare-fun choose!121 (array!64595 (_ BitVec 32) (_ BitVec 64)) Unit!33461)

(assert (=> d!122809 (= lt!452895 (choose!121 (_keys!11252 thiss!1427) (index!41040 lt!452719) key!909))))

(assert (=> d!122809 (bvsge (index!41040 lt!452719) #b00000000000000000000000000000000)))

(assert (=> d!122809 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11252 thiss!1427) (index!41040 lt!452719) key!909) lt!452895)))

(declare-fun b!1028338 () Bool)

(assert (=> b!1028338 (= e!580478 (not (arrayContainsKey!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!122809 res!688097) b!1028338))

(declare-fun m!946749 () Bool)

(assert (=> d!122809 m!946749))

(assert (=> b!1028338 m!946515))

(declare-fun m!946751 () Bool)

(assert (=> b!1028338 m!946751))

(assert (=> b!1028151 d!122809))

(declare-fun d!122811 () Bool)

(declare-fun res!688102 () Bool)

(declare-fun e!580483 () Bool)

(assert (=> d!122811 (=> res!688102 e!580483)))

(assert (=> d!122811 (= res!688102 (= (select (arr!31104 lt!452721) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122811 (= (arrayContainsKey!0 lt!452721 key!909 #b00000000000000000000000000000000) e!580483)))

(declare-fun b!1028343 () Bool)

(declare-fun e!580484 () Bool)

(assert (=> b!1028343 (= e!580483 e!580484)))

(declare-fun res!688103 () Bool)

(assert (=> b!1028343 (=> (not res!688103) (not e!580484))))

(assert (=> b!1028343 (= res!688103 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 lt!452721)))))

(declare-fun b!1028344 () Bool)

(assert (=> b!1028344 (= e!580484 (arrayContainsKey!0 lt!452721 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122811 (not res!688102)) b!1028343))

(assert (= (and b!1028343 res!688103) b!1028344))

(assert (=> d!122811 m!946623))

(declare-fun m!946753 () Bool)

(assert (=> b!1028344 m!946753))

(assert (=> b!1028151 d!122811))

(declare-fun d!122813 () Bool)

(assert (=> d!122813 (= (validMask!0 (mask!29832 (_2!7823 lt!452716))) (and (or (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000000000111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000000001111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000000011111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000000111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000001111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000011111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000000111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000001111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000011111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000000111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000001111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000011111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000000111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000001111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000011111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000000111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000001111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000011111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000000111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000001111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000011111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000000111111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000001111111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000011111111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00000111111111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00001111111111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00011111111111111111111111111111) (= (mask!29832 (_2!7823 lt!452716)) #b00111111111111111111111111111111)) (bvsle (mask!29832 (_2!7823 lt!452716)) #b00111111111111111111111111111111)))))

(assert (=> b!1028151 d!122813))

(declare-fun d!122815 () Bool)

(declare-fun e!580487 () Bool)

(assert (=> d!122815 e!580487))

(declare-fun res!688106 () Bool)

(assert (=> d!122815 (=> (not res!688106) (not e!580487))))

(assert (=> d!122815 (= res!688106 (and (bvsge (index!41040 lt!452719) #b00000000000000000000000000000000) (bvslt (index!41040 lt!452719) (size!31620 (_keys!11252 thiss!1427)))))))

(declare-fun lt!452898 () Unit!33461)

(declare-fun choose!25 (array!64595 (_ BitVec 32) (_ BitVec 32)) Unit!33461)

(assert (=> d!122815 (= lt!452898 (choose!25 (_keys!11252 thiss!1427) (index!41040 lt!452719) (mask!29832 thiss!1427)))))

(assert (=> d!122815 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122815 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11252 thiss!1427) (index!41040 lt!452719) (mask!29832 thiss!1427)) lt!452898)))

(declare-fun b!1028347 () Bool)

(assert (=> b!1028347 (= e!580487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (mask!29832 thiss!1427)))))

(assert (= (and d!122815 res!688106) b!1028347))

(declare-fun m!946755 () Bool)

(assert (=> d!122815 m!946755))

(assert (=> d!122815 m!946617))

(assert (=> b!1028347 m!946515))

(declare-fun m!946757 () Bool)

(assert (=> b!1028347 m!946757))

(assert (=> b!1028151 d!122815))

(declare-fun b!1028348 () Bool)

(declare-fun e!580488 () (_ BitVec 32))

(assert (=> b!1028348 (= e!580488 #b00000000000000000000000000000000)))

(declare-fun bm!43347 () Bool)

(declare-fun call!43350 () (_ BitVec 32))

(assert (=> bm!43347 (= call!43350 (arrayCountValidKeys!0 (_keys!11252 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028349 () Bool)

(declare-fun e!580489 () (_ BitVec 32))

(assert (=> b!1028349 (= e!580488 e!580489)))

(declare-fun c!103751 () Bool)

(assert (=> b!1028349 (= c!103751 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122817 () Bool)

(declare-fun lt!452899 () (_ BitVec 32))

(assert (=> d!122817 (and (bvsge lt!452899 #b00000000000000000000000000000000) (bvsle lt!452899 (bvsub (size!31620 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122817 (= lt!452899 e!580488)))

(declare-fun c!103750 () Bool)

(assert (=> d!122817 (= c!103750 (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122817 (and (bvsle #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31620 (_keys!11252 thiss!1427)) (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122817 (= (arrayCountValidKeys!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) lt!452899)))

(declare-fun b!1028350 () Bool)

(assert (=> b!1028350 (= e!580489 (bvadd #b00000000000000000000000000000001 call!43350))))

(declare-fun b!1028351 () Bool)

(assert (=> b!1028351 (= e!580489 call!43350)))

(assert (= (and d!122817 c!103750) b!1028348))

(assert (= (and d!122817 (not c!103750)) b!1028349))

(assert (= (and b!1028349 c!103751) b!1028350))

(assert (= (and b!1028349 (not c!103751)) b!1028351))

(assert (= (or b!1028350 b!1028351) bm!43347))

(declare-fun m!946759 () Bool)

(assert (=> bm!43347 m!946759))

(assert (=> b!1028349 m!946655))

(assert (=> b!1028349 m!946655))

(assert (=> b!1028349 m!946681))

(assert (=> b!1028151 d!122817))

(declare-fun b!1028361 () Bool)

(declare-fun res!688117 () Bool)

(declare-fun e!580495 () Bool)

(assert (=> b!1028361 (=> (not res!688117) (not e!580495))))

(assert (=> b!1028361 (= res!688117 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028362 () Bool)

(assert (=> b!1028362 (= e!580495 (bvslt (size!31620 (_keys!11252 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1028360 () Bool)

(declare-fun res!688115 () Bool)

(assert (=> b!1028360 (=> (not res!688115) (not e!580495))))

(assert (=> b!1028360 (= res!688115 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719))))))

(declare-fun b!1028363 () Bool)

(declare-fun e!580494 () Bool)

(assert (=> b!1028363 (= e!580494 (= (arrayCountValidKeys!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!122819 () Bool)

(assert (=> d!122819 e!580494))

(declare-fun res!688118 () Bool)

(assert (=> d!122819 (=> (not res!688118) (not e!580494))))

(assert (=> d!122819 (= res!688118 (and (bvsge (index!41040 lt!452719) #b00000000000000000000000000000000) (bvslt (index!41040 lt!452719) (size!31620 (_keys!11252 thiss!1427)))))))

(declare-fun lt!452902 () Unit!33461)

(declare-fun choose!82 (array!64595 (_ BitVec 32) (_ BitVec 64)) Unit!33461)

(assert (=> d!122819 (= lt!452902 (choose!82 (_keys!11252 thiss!1427) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122819 e!580495))

(declare-fun res!688116 () Bool)

(assert (=> d!122819 (=> (not res!688116) (not e!580495))))

(assert (=> d!122819 (= res!688116 (and (bvsge (index!41040 lt!452719) #b00000000000000000000000000000000) (bvslt (index!41040 lt!452719) (size!31620 (_keys!11252 thiss!1427)))))))

(assert (=> d!122819 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11252 thiss!1427) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) lt!452902)))

(assert (= (and d!122819 res!688116) b!1028360))

(assert (= (and b!1028360 res!688115) b!1028361))

(assert (= (and b!1028361 res!688117) b!1028362))

(assert (= (and d!122819 res!688118) b!1028363))

(declare-fun m!946761 () Bool)

(assert (=> b!1028361 m!946761))

(declare-fun m!946763 () Bool)

(assert (=> b!1028360 m!946763))

(assert (=> b!1028360 m!946763))

(declare-fun m!946765 () Bool)

(assert (=> b!1028360 m!946765))

(assert (=> b!1028363 m!946515))

(declare-fun m!946767 () Bool)

(assert (=> b!1028363 m!946767))

(assert (=> b!1028363 m!946497))

(declare-fun m!946769 () Bool)

(assert (=> d!122819 m!946769))

(assert (=> b!1028151 d!122819))

(declare-fun bm!43350 () Bool)

(declare-fun call!43353 () Bool)

(declare-fun c!103754 () Bool)

(assert (=> bm!43350 (= call!43353 (arrayNoDuplicates!0 lt!452721 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103754 (Cons!21843 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) Nil!21844) Nil!21844)))))

(declare-fun b!1028374 () Bool)

(declare-fun e!580506 () Bool)

(declare-fun e!580504 () Bool)

(assert (=> b!1028374 (= e!580506 e!580504)))

(declare-fun res!688126 () Bool)

(assert (=> b!1028374 (=> (not res!688126) (not e!580504))))

(declare-fun e!580505 () Bool)

(assert (=> b!1028374 (= res!688126 (not e!580505))))

(declare-fun res!688127 () Bool)

(assert (=> b!1028374 (=> (not res!688127) (not e!580505))))

(assert (=> b!1028374 (= res!688127 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun d!122821 () Bool)

(declare-fun res!688125 () Bool)

(assert (=> d!122821 (=> res!688125 e!580506)))

(assert (=> d!122821 (= res!688125 (bvsge #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(assert (=> d!122821 (= (arrayNoDuplicates!0 lt!452721 #b00000000000000000000000000000000 Nil!21844) e!580506)))

(declare-fun b!1028375 () Bool)

(declare-fun e!580507 () Bool)

(assert (=> b!1028375 (= e!580504 e!580507)))

(assert (=> b!1028375 (= c!103754 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028376 () Bool)

(assert (=> b!1028376 (= e!580507 call!43353)))

(declare-fun b!1028377 () Bool)

(assert (=> b!1028377 (= e!580507 call!43353)))

(declare-fun b!1028378 () Bool)

(declare-fun contains!5947 (List!21847 (_ BitVec 64)) Bool)

(assert (=> b!1028378 (= e!580505 (contains!5947 Nil!21844 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (= (and d!122821 (not res!688125)) b!1028374))

(assert (= (and b!1028374 res!688127) b!1028378))

(assert (= (and b!1028374 res!688126) b!1028375))

(assert (= (and b!1028375 c!103754) b!1028376))

(assert (= (and b!1028375 (not c!103754)) b!1028377))

(assert (= (or b!1028376 b!1028377) bm!43350))

(assert (=> bm!43350 m!946623))

(declare-fun m!946771 () Bool)

(assert (=> bm!43350 m!946771))

(assert (=> b!1028374 m!946623))

(assert (=> b!1028374 m!946623))

(assert (=> b!1028374 m!946631))

(assert (=> b!1028375 m!946623))

(assert (=> b!1028375 m!946623))

(assert (=> b!1028375 m!946631))

(assert (=> b!1028378 m!946623))

(assert (=> b!1028378 m!946623))

(declare-fun m!946773 () Bool)

(assert (=> b!1028378 m!946773))

(assert (=> b!1028151 d!122821))

(declare-fun d!122823 () Bool)

(declare-fun e!580510 () Bool)

(assert (=> d!122823 e!580510))

(declare-fun res!688130 () Bool)

(assert (=> d!122823 (=> (not res!688130) (not e!580510))))

(assert (=> d!122823 (= res!688130 (and (bvsge (index!41040 lt!452719) #b00000000000000000000000000000000) (bvslt (index!41040 lt!452719) (size!31620 (_keys!11252 thiss!1427)))))))

(declare-fun lt!452905 () Unit!33461)

(declare-fun choose!1692 (array!64595 array!64597 (_ BitVec 32) (_ BitVec 32) V!37275 V!37275 (_ BitVec 32) (_ BitVec 64) Int) Unit!33461)

(assert (=> d!122823 (= lt!452905 (choose!1692 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!41040 lt!452719) key!909 (defaultEntry!6102 thiss!1427)))))

(assert (=> d!122823 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122823 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!6 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!41040 lt!452719) key!909 (defaultEntry!6102 thiss!1427)) lt!452905)))

(declare-fun b!1028381 () Bool)

(assert (=> b!1028381 (= e!580510 (= (-!481 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) (getCurrentListMap!3856 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))))

(assert (=> b!1028381 (bvslt (index!41040 lt!452719) (size!31621 (_values!6125 thiss!1427)))))

(assert (= (and d!122823 res!688130) b!1028381))

(declare-fun b_lambda!15773 () Bool)

(assert (=> (not b_lambda!15773) (not b!1028381)))

(assert (=> b!1028381 t!30912))

(declare-fun b_and!32853 () Bool)

(assert (= b_and!32851 (and (=> t!30912 result!14109) b_and!32853)))

(declare-fun m!946775 () Bool)

(assert (=> d!122823 m!946775))

(assert (=> d!122823 m!946617))

(assert (=> b!1028381 m!946503))

(declare-fun m!946777 () Bool)

(assert (=> b!1028381 m!946777))

(assert (=> b!1028381 m!946513))

(assert (=> b!1028381 m!946517))

(assert (=> b!1028381 m!946515))

(assert (=> b!1028381 m!946503))

(assert (=> b!1028381 m!946505))

(assert (=> b!1028151 d!122823))

(declare-fun d!122825 () Bool)

(declare-fun e!580513 () Bool)

(assert (=> d!122825 e!580513))

(declare-fun res!688133 () Bool)

(assert (=> d!122825 (=> (not res!688133) (not e!580513))))

(assert (=> d!122825 (= res!688133 (and (bvsge (index!41040 lt!452719) #b00000000000000000000000000000000) (bvslt (index!41040 lt!452719) (size!31620 (_keys!11252 thiss!1427)))))))

(declare-fun lt!452908 () Unit!33461)

(declare-fun choose!53 (array!64595 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21847) Unit!33461)

(assert (=> d!122825 (= lt!452908 (choose!53 (_keys!11252 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41040 lt!452719) #b00000000000000000000000000000000 Nil!21844))))

(assert (=> d!122825 (bvslt (size!31620 (_keys!11252 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122825 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11252 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41040 lt!452719) #b00000000000000000000000000000000 Nil!21844) lt!452908)))

(declare-fun b!1028384 () Bool)

(assert (=> b!1028384 (= e!580513 (arrayNoDuplicates!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000000 Nil!21844))))

(assert (= (and d!122825 res!688133) b!1028384))

(declare-fun m!946779 () Bool)

(assert (=> d!122825 m!946779))

(assert (=> b!1028384 m!946515))

(declare-fun m!946781 () Bool)

(assert (=> b!1028384 m!946781))

(assert (=> b!1028151 d!122825))

(declare-fun d!122827 () Bool)

(assert (=> d!122827 (= (array_inv!24081 (_keys!11252 thiss!1427)) (bvsge (size!31620 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028149 d!122827))

(declare-fun d!122829 () Bool)

(assert (=> d!122829 (= (array_inv!24082 (_values!6125 thiss!1427)) (bvsge (size!31621 (_values!6125 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028149 d!122829))

(declare-fun d!122831 () Bool)

(declare-fun res!688140 () Bool)

(declare-fun e!580516 () Bool)

(assert (=> d!122831 (=> (not res!688140) (not e!580516))))

(declare-fun simpleValid!392 (LongMapFixedSize!5488) Bool)

(assert (=> d!122831 (= res!688140 (simpleValid!392 thiss!1427))))

(assert (=> d!122831 (= (valid!2070 thiss!1427) e!580516)))

(declare-fun b!1028391 () Bool)

(declare-fun res!688141 () Bool)

(assert (=> b!1028391 (=> (not res!688141) (not e!580516))))

(assert (=> b!1028391 (= res!688141 (= (arrayCountValidKeys!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (_size!2799 thiss!1427)))))

(declare-fun b!1028392 () Bool)

(declare-fun res!688142 () Bool)

(assert (=> b!1028392 (=> (not res!688142) (not e!580516))))

(assert (=> b!1028392 (= res!688142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(declare-fun b!1028393 () Bool)

(assert (=> b!1028393 (= e!580516 (arrayNoDuplicates!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 Nil!21844))))

(assert (= (and d!122831 res!688140) b!1028391))

(assert (= (and b!1028391 res!688141) b!1028392))

(assert (= (and b!1028392 res!688142) b!1028393))

(declare-fun m!946783 () Bool)

(assert (=> d!122831 m!946783))

(assert (=> b!1028391 m!946497))

(declare-fun m!946785 () Bool)

(assert (=> b!1028392 m!946785))

(declare-fun m!946787 () Bool)

(assert (=> b!1028393 m!946787))

(assert (=> start!89686 d!122831))

(declare-fun b!1028400 () Bool)

(declare-fun e!580521 () Bool)

(assert (=> b!1028400 (= e!580521 tp_is_empty!24301)))

(declare-fun condMapEmpty!37896 () Bool)

(declare-fun mapDefault!37896 () ValueCell!11447)

(assert (=> mapNonEmpty!37887 (= condMapEmpty!37896 (= mapRest!37887 ((as const (Array (_ BitVec 32) ValueCell!11447)) mapDefault!37896)))))

(declare-fun e!580522 () Bool)

(declare-fun mapRes!37896 () Bool)

(assert (=> mapNonEmpty!37887 (= tp!72795 (and e!580522 mapRes!37896))))

(declare-fun mapIsEmpty!37896 () Bool)

(assert (=> mapIsEmpty!37896 mapRes!37896))

(declare-fun mapNonEmpty!37896 () Bool)

(declare-fun tp!72811 () Bool)

(assert (=> mapNonEmpty!37896 (= mapRes!37896 (and tp!72811 e!580521))))

(declare-fun mapRest!37896 () (Array (_ BitVec 32) ValueCell!11447))

(declare-fun mapKey!37896 () (_ BitVec 32))

(declare-fun mapValue!37896 () ValueCell!11447)

(assert (=> mapNonEmpty!37896 (= mapRest!37887 (store mapRest!37896 mapKey!37896 mapValue!37896))))

(declare-fun b!1028401 () Bool)

(assert (=> b!1028401 (= e!580522 tp_is_empty!24301)))

(assert (= (and mapNonEmpty!37887 condMapEmpty!37896) mapIsEmpty!37896))

(assert (= (and mapNonEmpty!37887 (not condMapEmpty!37896)) mapNonEmpty!37896))

(assert (= (and mapNonEmpty!37896 ((_ is ValueCellFull!11447) mapValue!37896)) b!1028400))

(assert (= (and mapNonEmpty!37887 ((_ is ValueCellFull!11447) mapDefault!37896)) b!1028401))

(declare-fun m!946789 () Bool)

(assert (=> mapNonEmpty!37896 m!946789))

(declare-fun b_lambda!15775 () Bool)

(assert (= b_lambda!15771 (or (and b!1028149 b_free!20581) b_lambda!15775)))

(declare-fun b_lambda!15777 () Bool)

(assert (= b_lambda!15769 (or (and b!1028149 b_free!20581) b_lambda!15777)))

(declare-fun b_lambda!15779 () Bool)

(assert (= b_lambda!15773 (or (and b!1028149 b_free!20581) b_lambda!15779)))

(check-sat (not b!1028347) (not b_lambda!15767) (not d!122805) (not bm!43342) (not d!122819) (not bm!43346) (not b!1028236) (not b!1028295) (not b!1028312) (not b!1028238) (not bm!43339) (not b!1028331) (not bm!43347) (not bm!43318) (not d!122831) (not b!1028322) (not b!1028344) (not bm!43350) (not b_lambda!15775) (not b_lambda!15779) (not b!1028315) (not d!122797) (not b!1028378) (not b_next!20581) (not bm!43334) (not d!122809) (not b!1028335) (not b!1028324) (not b!1028393) (not b!1028224) tp_is_empty!24301 (not b!1028349) (not b!1028375) (not b!1028361) (not b_lambda!15777) b_and!32853 (not b!1028328) (not d!122823) (not b!1028360) (not d!122825) (not b!1028249) (not d!122807) (not bm!43337) (not b!1028333) (not bm!43344) (not b!1028307) (not bm!43335) (not b!1028314) (not b!1028316) (not b!1028301) (not b!1028310) (not b!1028363) (not bm!43341) (not d!122815) (not b!1028294) (not d!122803) (not b!1028303) (not b!1028384) (not b!1028392) (not bm!43315) (not b!1028338) (not b!1028374) (not b!1028391) (not mapNonEmpty!37896) (not b!1028381))
(check-sat b_and!32853 (not b_next!20581))
(get-model)

(declare-fun d!122833 () Bool)

(assert (=> d!122833 (= (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) (and (not (= (select (arr!31104 lt!452721) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31104 lt!452721) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028374 d!122833))

(declare-fun d!122835 () Bool)

(declare-datatypes ((Option!638 0))(
  ( (Some!637 (v!14775 V!37275)) (None!636) )
))
(declare-fun get!16343 (Option!638) V!37275)

(declare-fun getValueByKey!587 (List!21846 (_ BitVec 64)) Option!638)

(assert (=> d!122835 (= (apply!894 lt!452881 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16343 (getValueByKey!587 (toList!6889 lt!452881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29995 () Bool)

(assert (= bs!29995 d!122835))

(declare-fun m!946791 () Bool)

(assert (=> bs!29995 m!946791))

(assert (=> bs!29995 m!946791))

(declare-fun m!946793 () Bool)

(assert (=> bs!29995 m!946793))

(assert (=> b!1028328 d!122835))

(declare-fun d!122837 () Bool)

(assert (=> d!122837 (= (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719))) (and (not (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028360 d!122837))

(declare-fun d!122839 () Bool)

(assert (=> d!122839 (not (arrayContainsKey!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!122839 true))

(declare-fun _$59!14 () Unit!33461)

(assert (=> d!122839 (= (choose!121 (_keys!11252 thiss!1427) (index!41040 lt!452719) key!909) _$59!14)))

(declare-fun bs!29996 () Bool)

(assert (= bs!29996 d!122839))

(assert (=> bs!29996 m!946515))

(assert (=> bs!29996 m!946751))

(assert (=> d!122809 d!122839))

(declare-fun b!1028402 () Bool)

(declare-fun e!580523 () (_ BitVec 32))

(assert (=> b!1028402 (= e!580523 #b00000000000000000000000000000000)))

(declare-fun bm!43351 () Bool)

(declare-fun call!43354 () (_ BitVec 32))

(assert (=> bm!43351 (= call!43354 (arrayCountValidKeys!0 lt!452721 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028403 () Bool)

(declare-fun e!580524 () (_ BitVec 32))

(assert (=> b!1028403 (= e!580523 e!580524)))

(declare-fun c!103756 () Bool)

(assert (=> b!1028403 (= c!103756 (validKeyInArray!0 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122841 () Bool)

(declare-fun lt!452909 () (_ BitVec 32))

(assert (=> d!122841 (and (bvsge lt!452909 #b00000000000000000000000000000000) (bvsle lt!452909 (bvsub (size!31620 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!122841 (= lt!452909 e!580523)))

(declare-fun c!103755 () Bool)

(assert (=> d!122841 (= c!103755 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122841 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31620 (_keys!11252 thiss!1427)) (size!31620 lt!452721)))))

(assert (=> d!122841 (= (arrayCountValidKeys!0 lt!452721 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))) lt!452909)))

(declare-fun b!1028404 () Bool)

(assert (=> b!1028404 (= e!580524 (bvadd #b00000000000000000000000000000001 call!43354))))

(declare-fun b!1028405 () Bool)

(assert (=> b!1028405 (= e!580524 call!43354)))

(assert (= (and d!122841 c!103755) b!1028402))

(assert (= (and d!122841 (not c!103755)) b!1028403))

(assert (= (and b!1028403 c!103756) b!1028404))

(assert (= (and b!1028403 (not c!103756)) b!1028405))

(assert (= (or b!1028404 b!1028405) bm!43351))

(declare-fun m!946795 () Bool)

(assert (=> bm!43351 m!946795))

(declare-fun m!946797 () Bool)

(assert (=> b!1028403 m!946797))

(assert (=> b!1028403 m!946797))

(declare-fun m!946799 () Bool)

(assert (=> b!1028403 m!946799))

(assert (=> bm!43318 d!122841))

(declare-fun d!122843 () Bool)

(declare-fun e!580527 () Bool)

(assert (=> d!122843 e!580527))

(declare-fun res!688147 () Bool)

(assert (=> d!122843 (=> (not res!688147) (not e!580527))))

(declare-fun lt!452919 () ListLongMap!13747)

(assert (=> d!122843 (= res!688147 (contains!5946 lt!452919 (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun lt!452918 () List!21846)

(assert (=> d!122843 (= lt!452919 (ListLongMap!13748 lt!452918))))

(declare-fun lt!452920 () Unit!33461)

(declare-fun lt!452921 () Unit!33461)

(assert (=> d!122843 (= lt!452920 lt!452921)))

(assert (=> d!122843 (= (getValueByKey!587 lt!452918 (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!277 (List!21846 (_ BitVec 64) V!37275) Unit!33461)

(assert (=> d!122843 (= lt!452921 (lemmaContainsTupThenGetReturnValue!277 lt!452918 (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun insertStrictlySorted!370 (List!21846 (_ BitVec 64) V!37275) List!21846)

(assert (=> d!122843 (= lt!452918 (insertStrictlySorted!370 (toList!6889 call!43345) (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!122843 (= (+!3125 call!43345 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) lt!452919)))

(declare-fun b!1028410 () Bool)

(declare-fun res!688148 () Bool)

(assert (=> b!1028410 (=> (not res!688148) (not e!580527))))

(assert (=> b!1028410 (= res!688148 (= (getValueByKey!587 (toList!6889 lt!452919) (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun b!1028411 () Bool)

(declare-fun contains!5948 (List!21846 tuple2!15626) Bool)

(assert (=> b!1028411 (= e!580527 (contains!5948 (toList!6889 lt!452919) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(assert (= (and d!122843 res!688147) b!1028410))

(assert (= (and b!1028410 res!688148) b!1028411))

(declare-fun m!946801 () Bool)

(assert (=> d!122843 m!946801))

(declare-fun m!946803 () Bool)

(assert (=> d!122843 m!946803))

(declare-fun m!946805 () Bool)

(assert (=> d!122843 m!946805))

(declare-fun m!946807 () Bool)

(assert (=> d!122843 m!946807))

(declare-fun m!946809 () Bool)

(assert (=> b!1028410 m!946809))

(declare-fun m!946811 () Bool)

(assert (=> b!1028411 m!946811))

(assert (=> b!1028316 d!122843))

(declare-fun d!122845 () Bool)

(declare-fun lt!452924 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!509 (List!21847) (InoxSet (_ BitVec 64)))

(assert (=> d!122845 (= lt!452924 (select (content!509 Nil!21844) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun e!580532 () Bool)

(assert (=> d!122845 (= lt!452924 e!580532)))

(declare-fun res!688154 () Bool)

(assert (=> d!122845 (=> (not res!688154) (not e!580532))))

(assert (=> d!122845 (= res!688154 ((_ is Cons!21843) Nil!21844))))

(assert (=> d!122845 (= (contains!5947 Nil!21844 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) lt!452924)))

(declare-fun b!1028416 () Bool)

(declare-fun e!580533 () Bool)

(assert (=> b!1028416 (= e!580532 e!580533)))

(declare-fun res!688153 () Bool)

(assert (=> b!1028416 (=> res!688153 e!580533)))

(assert (=> b!1028416 (= res!688153 (= (h!23042 Nil!21844) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028417 () Bool)

(assert (=> b!1028417 (= e!580533 (contains!5947 (t!30914 Nil!21844) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (= (and d!122845 res!688154) b!1028416))

(assert (= (and b!1028416 (not res!688153)) b!1028417))

(declare-fun m!946813 () Bool)

(assert (=> d!122845 m!946813))

(assert (=> d!122845 m!946623))

(declare-fun m!946815 () Bool)

(assert (=> d!122845 m!946815))

(assert (=> b!1028417 m!946623))

(declare-fun m!946817 () Bool)

(assert (=> b!1028417 m!946817))

(assert (=> b!1028378 d!122845))

(declare-fun d!122847 () Bool)

(assert (=> d!122847 (= (apply!894 lt!452881 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) (get!16343 (getValueByKey!587 (toList!6889 lt!452881) (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))))

(declare-fun bs!29997 () Bool)

(assert (= bs!29997 d!122847))

(assert (=> bs!29997 m!946623))

(declare-fun m!946819 () Bool)

(assert (=> bs!29997 m!946819))

(assert (=> bs!29997 m!946819))

(declare-fun m!946821 () Bool)

(assert (=> bs!29997 m!946821))

(assert (=> b!1028331 d!122847))

(declare-fun d!122849 () Bool)

(declare-fun c!103759 () Bool)

(assert (=> d!122849 (= c!103759 ((_ is ValueCellFull!11447) (select (arr!31105 lt!452715) #b00000000000000000000000000000000)))))

(declare-fun e!580536 () V!37275)

(assert (=> d!122849 (= (get!16342 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580536)))

(declare-fun b!1028422 () Bool)

(declare-fun get!16344 (ValueCell!11447 V!37275) V!37275)

(assert (=> b!1028422 (= e!580536 (get!16344 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028423 () Bool)

(declare-fun get!16345 (ValueCell!11447 V!37275) V!37275)

(assert (=> b!1028423 (= e!580536 (get!16345 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122849 c!103759) b!1028422))

(assert (= (and d!122849 (not c!103759)) b!1028423))

(assert (=> b!1028422 m!946731))

(assert (=> b!1028422 m!946517))

(declare-fun m!946823 () Bool)

(assert (=> b!1028422 m!946823))

(assert (=> b!1028423 m!946731))

(assert (=> b!1028423 m!946517))

(declare-fun m!946825 () Bool)

(assert (=> b!1028423 m!946825))

(assert (=> b!1028331 d!122849))

(declare-fun b!1028424 () Bool)

(declare-fun e!580537 () (_ BitVec 32))

(assert (=> b!1028424 (= e!580537 #b00000000000000000000000000000000)))

(declare-fun bm!43352 () Bool)

(declare-fun call!43355 () (_ BitVec 32))

(assert (=> bm!43352 (= call!43355 (arrayCountValidKeys!0 (_keys!11252 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028425 () Bool)

(declare-fun e!580538 () (_ BitVec 32))

(assert (=> b!1028425 (= e!580537 e!580538)))

(declare-fun c!103761 () Bool)

(assert (=> b!1028425 (= c!103761 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122851 () Bool)

(declare-fun lt!452925 () (_ BitVec 32))

(assert (=> d!122851 (and (bvsge lt!452925 #b00000000000000000000000000000000) (bvsle lt!452925 (bvsub (size!31620 (_keys!11252 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!122851 (= lt!452925 e!580537)))

(declare-fun c!103760 () Bool)

(assert (=> d!122851 (= c!103760 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122851 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31620 (_keys!11252 thiss!1427)) (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122851 (= (arrayCountValidKeys!0 (_keys!11252 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))) lt!452925)))

(declare-fun b!1028426 () Bool)

(assert (=> b!1028426 (= e!580538 (bvadd #b00000000000000000000000000000001 call!43355))))

(declare-fun b!1028427 () Bool)

(assert (=> b!1028427 (= e!580538 call!43355)))

(assert (= (and d!122851 c!103760) b!1028424))

(assert (= (and d!122851 (not c!103760)) b!1028425))

(assert (= (and b!1028425 c!103761) b!1028426))

(assert (= (and b!1028425 (not c!103761)) b!1028427))

(assert (= (or b!1028426 b!1028427) bm!43352))

(declare-fun m!946827 () Bool)

(assert (=> bm!43352 m!946827))

(declare-fun m!946829 () Bool)

(assert (=> b!1028425 m!946829))

(assert (=> b!1028425 m!946829))

(declare-fun m!946831 () Bool)

(assert (=> b!1028425 m!946831))

(assert (=> bm!43347 d!122851))

(declare-fun d!122853 () Bool)

(declare-fun res!688155 () Bool)

(declare-fun e!580539 () Bool)

(assert (=> d!122853 (=> res!688155 e!580539)))

(assert (=> d!122853 (= res!688155 (= (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!122853 (= (arrayContainsKey!0 lt!452721 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!580539)))

(declare-fun b!1028428 () Bool)

(declare-fun e!580540 () Bool)

(assert (=> b!1028428 (= e!580539 e!580540)))

(declare-fun res!688156 () Bool)

(assert (=> b!1028428 (=> (not res!688156) (not e!580540))))

(assert (=> b!1028428 (= res!688156 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31620 lt!452721)))))

(declare-fun b!1028429 () Bool)

(assert (=> b!1028429 (= e!580540 (arrayContainsKey!0 lt!452721 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!122853 (not res!688155)) b!1028428))

(assert (= (and b!1028428 res!688156) b!1028429))

(assert (=> d!122853 m!946797))

(declare-fun m!946833 () Bool)

(assert (=> b!1028429 m!946833))

(assert (=> b!1028344 d!122853))

(declare-fun d!122855 () Bool)

(declare-fun e!580546 () Bool)

(assert (=> d!122855 e!580546))

(declare-fun res!688159 () Bool)

(assert (=> d!122855 (=> res!688159 e!580546)))

(declare-fun lt!452936 () Bool)

(assert (=> d!122855 (= res!688159 (not lt!452936))))

(declare-fun lt!452937 () Bool)

(assert (=> d!122855 (= lt!452936 lt!452937)))

(declare-fun lt!452934 () Unit!33461)

(declare-fun e!580545 () Unit!33461)

(assert (=> d!122855 (= lt!452934 e!580545)))

(declare-fun c!103764 () Bool)

(assert (=> d!122855 (= c!103764 lt!452937)))

(declare-fun containsKey!560 (List!21846 (_ BitVec 64)) Bool)

(assert (=> d!122855 (= lt!452937 (containsKey!560 (toList!6889 lt!452881) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122855 (= (contains!5946 lt!452881 #b1000000000000000000000000000000000000000000000000000000000000000) lt!452936)))

(declare-fun b!1028436 () Bool)

(declare-fun lt!452935 () Unit!33461)

(assert (=> b!1028436 (= e!580545 lt!452935)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!392 (List!21846 (_ BitVec 64)) Unit!33461)

(assert (=> b!1028436 (= lt!452935 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452881) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!435 (Option!638) Bool)

(assert (=> b!1028436 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452881) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028437 () Bool)

(declare-fun Unit!33475 () Unit!33461)

(assert (=> b!1028437 (= e!580545 Unit!33475)))

(declare-fun b!1028438 () Bool)

(assert (=> b!1028438 (= e!580546 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122855 c!103764) b!1028436))

(assert (= (and d!122855 (not c!103764)) b!1028437))

(assert (= (and d!122855 (not res!688159)) b!1028438))

(declare-fun m!946835 () Bool)

(assert (=> d!122855 m!946835))

(declare-fun m!946837 () Bool)

(assert (=> b!1028436 m!946837))

(declare-fun m!946839 () Bool)

(assert (=> b!1028436 m!946839))

(assert (=> b!1028436 m!946839))

(declare-fun m!946841 () Bool)

(assert (=> b!1028436 m!946841))

(assert (=> b!1028438 m!946839))

(assert (=> b!1028438 m!946839))

(assert (=> b!1028438 m!946841))

(assert (=> bm!43346 d!122855))

(declare-fun d!122857 () Bool)

(assert (=> d!122857 (= (validMask!0 (mask!29832 thiss!1427)) (and (or (= (mask!29832 thiss!1427) #b00000000000000000000000000000111) (= (mask!29832 thiss!1427) #b00000000000000000000000000001111) (= (mask!29832 thiss!1427) #b00000000000000000000000000011111) (= (mask!29832 thiss!1427) #b00000000000000000000000000111111) (= (mask!29832 thiss!1427) #b00000000000000000000000001111111) (= (mask!29832 thiss!1427) #b00000000000000000000000011111111) (= (mask!29832 thiss!1427) #b00000000000000000000000111111111) (= (mask!29832 thiss!1427) #b00000000000000000000001111111111) (= (mask!29832 thiss!1427) #b00000000000000000000011111111111) (= (mask!29832 thiss!1427) #b00000000000000000000111111111111) (= (mask!29832 thiss!1427) #b00000000000000000001111111111111) (= (mask!29832 thiss!1427) #b00000000000000000011111111111111) (= (mask!29832 thiss!1427) #b00000000000000000111111111111111) (= (mask!29832 thiss!1427) #b00000000000000001111111111111111) (= (mask!29832 thiss!1427) #b00000000000000011111111111111111) (= (mask!29832 thiss!1427) #b00000000000000111111111111111111) (= (mask!29832 thiss!1427) #b00000000000001111111111111111111) (= (mask!29832 thiss!1427) #b00000000000011111111111111111111) (= (mask!29832 thiss!1427) #b00000000000111111111111111111111) (= (mask!29832 thiss!1427) #b00000000001111111111111111111111) (= (mask!29832 thiss!1427) #b00000000011111111111111111111111) (= (mask!29832 thiss!1427) #b00000000111111111111111111111111) (= (mask!29832 thiss!1427) #b00000001111111111111111111111111) (= (mask!29832 thiss!1427) #b00000011111111111111111111111111) (= (mask!29832 thiss!1427) #b00000111111111111111111111111111) (= (mask!29832 thiss!1427) #b00001111111111111111111111111111) (= (mask!29832 thiss!1427) #b00011111111111111111111111111111) (= (mask!29832 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29832 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!122807 d!122857))

(declare-fun b!1028439 () Bool)

(declare-fun e!580547 () Bool)

(declare-fun e!580549 () Bool)

(assert (=> b!1028439 (= e!580547 e!580549)))

(declare-fun lt!452938 () (_ BitVec 64))

(assert (=> b!1028439 (= lt!452938 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452940 () Unit!33461)

(assert (=> b!1028439 (= lt!452940 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) lt!452938 #b00000000000000000000000000000000))))

(assert (=> b!1028439 (arrayContainsKey!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) lt!452938 #b00000000000000000000000000000000)))

(declare-fun lt!452939 () Unit!33461)

(assert (=> b!1028439 (= lt!452939 lt!452940)))

(declare-fun res!688161 () Bool)

(assert (=> b!1028439 (= res!688161 (= (seekEntryOrOpen!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000) (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (mask!29832 thiss!1427)) (Found!9667 #b00000000000000000000000000000000)))))

(assert (=> b!1028439 (=> (not res!688161) (not e!580549))))

(declare-fun b!1028440 () Bool)

(declare-fun call!43356 () Bool)

(assert (=> b!1028440 (= e!580547 call!43356)))

(declare-fun b!1028441 () Bool)

(declare-fun e!580548 () Bool)

(assert (=> b!1028441 (= e!580548 e!580547)))

(declare-fun c!103765 () Bool)

(assert (=> b!1028441 (= c!103765 (validKeyInArray!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!122859 () Bool)

(declare-fun res!688160 () Bool)

(assert (=> d!122859 (=> res!688160 e!580548)))

(assert (=> d!122859 (= res!688160 (bvsge #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(assert (=> d!122859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (mask!29832 thiss!1427)) e!580548)))

(declare-fun b!1028442 () Bool)

(assert (=> b!1028442 (= e!580549 call!43356)))

(declare-fun bm!43353 () Bool)

(assert (=> bm!43353 (= call!43356 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (mask!29832 thiss!1427)))))

(assert (= (and d!122859 (not res!688160)) b!1028441))

(assert (= (and b!1028441 c!103765) b!1028439))

(assert (= (and b!1028441 (not c!103765)) b!1028440))

(assert (= (and b!1028439 res!688161) b!1028442))

(assert (= (or b!1028442 b!1028440) bm!43353))

(declare-fun m!946843 () Bool)

(assert (=> b!1028439 m!946843))

(declare-fun m!946845 () Bool)

(assert (=> b!1028439 m!946845))

(declare-fun m!946847 () Bool)

(assert (=> b!1028439 m!946847))

(assert (=> b!1028439 m!946843))

(declare-fun m!946849 () Bool)

(assert (=> b!1028439 m!946849))

(assert (=> b!1028441 m!946843))

(assert (=> b!1028441 m!946843))

(declare-fun m!946851 () Bool)

(assert (=> b!1028441 m!946851))

(declare-fun m!946853 () Bool)

(assert (=> bm!43353 m!946853))

(assert (=> b!1028347 d!122859))

(declare-fun d!122861 () Bool)

(assert (=> d!122861 (= (arrayCountValidKeys!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!122861 true))

(declare-fun _$79!11 () Unit!33461)

(assert (=> d!122861 (= (choose!82 (_keys!11252 thiss!1427) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!11)))

(declare-fun bs!29998 () Bool)

(assert (= bs!29998 d!122861))

(assert (=> bs!29998 m!946515))

(assert (=> bs!29998 m!946767))

(assert (=> bs!29998 m!946497))

(assert (=> d!122819 d!122861))

(declare-fun d!122863 () Bool)

(assert (=> d!122863 (= (apply!894 lt!452856 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)) (get!16343 (getValueByKey!587 (toList!6889 lt!452856) (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!29999 () Bool)

(assert (= bs!29999 d!122863))

(assert (=> bs!29999 m!946655))

(declare-fun m!946855 () Bool)

(assert (=> bs!29999 m!946855))

(assert (=> bs!29999 m!946855))

(declare-fun m!946857 () Bool)

(assert (=> bs!29999 m!946857))

(assert (=> b!1028310 d!122863))

(declare-fun d!122865 () Bool)

(declare-fun c!103766 () Bool)

(assert (=> d!122865 (= c!103766 ((_ is ValueCellFull!11447) (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580550 () V!37275)

(assert (=> d!122865 (= (get!16342 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580550)))

(declare-fun b!1028443 () Bool)

(assert (=> b!1028443 (= e!580550 (get!16344 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028444 () Bool)

(assert (=> b!1028444 (= e!580550 (get!16345 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122865 c!103766) b!1028443))

(assert (= (and d!122865 (not c!103766)) b!1028444))

(assert (=> b!1028443 m!946673))

(assert (=> b!1028443 m!946517))

(declare-fun m!946859 () Bool)

(assert (=> b!1028443 m!946859))

(assert (=> b!1028444 m!946673))

(assert (=> b!1028444 m!946517))

(declare-fun m!946861 () Bool)

(assert (=> b!1028444 m!946861))

(assert (=> b!1028310 d!122865))

(assert (=> b!1028322 d!122833))

(declare-fun b!1028453 () Bool)

(declare-fun res!688172 () Bool)

(declare-fun e!580553 () Bool)

(assert (=> b!1028453 (=> (not res!688172) (not e!580553))))

(assert (=> b!1028453 (= res!688172 (and (= (size!31621 (_values!6125 thiss!1427)) (bvadd (mask!29832 thiss!1427) #b00000000000000000000000000000001)) (= (size!31620 (_keys!11252 thiss!1427)) (size!31621 (_values!6125 thiss!1427))) (bvsge (_size!2799 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2799 thiss!1427) (bvadd (mask!29832 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1028456 () Bool)

(assert (=> b!1028456 (= e!580553 (and (bvsge (extraKeys!5834 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5834 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2799 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1028454 () Bool)

(declare-fun res!688170 () Bool)

(assert (=> b!1028454 (=> (not res!688170) (not e!580553))))

(declare-fun size!31626 (LongMapFixedSize!5488) (_ BitVec 32))

(assert (=> b!1028454 (= res!688170 (bvsge (size!31626 thiss!1427) (_size!2799 thiss!1427)))))

(declare-fun d!122867 () Bool)

(declare-fun res!688173 () Bool)

(assert (=> d!122867 (=> (not res!688173) (not e!580553))))

(assert (=> d!122867 (= res!688173 (validMask!0 (mask!29832 thiss!1427)))))

(assert (=> d!122867 (= (simpleValid!392 thiss!1427) e!580553)))

(declare-fun b!1028455 () Bool)

(declare-fun res!688171 () Bool)

(assert (=> b!1028455 (=> (not res!688171) (not e!580553))))

(assert (=> b!1028455 (= res!688171 (= (size!31626 thiss!1427) (bvadd (_size!2799 thiss!1427) (bvsdiv (bvadd (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!122867 res!688173) b!1028453))

(assert (= (and b!1028453 res!688172) b!1028454))

(assert (= (and b!1028454 res!688170) b!1028455))

(assert (= (and b!1028455 res!688171) b!1028456))

(declare-fun m!946863 () Bool)

(assert (=> b!1028454 m!946863))

(assert (=> d!122867 m!946617))

(assert (=> b!1028455 m!946863))

(assert (=> d!122831 d!122867))

(declare-fun d!122869 () Bool)

(declare-fun e!580554 () Bool)

(assert (=> d!122869 e!580554))

(declare-fun res!688174 () Bool)

(assert (=> d!122869 (=> (not res!688174) (not e!580554))))

(declare-fun lt!452942 () ListLongMap!13747)

(assert (=> d!122869 (= res!688174 (contains!5946 lt!452942 (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun lt!452941 () List!21846)

(assert (=> d!122869 (= lt!452942 (ListLongMap!13748 lt!452941))))

(declare-fun lt!452943 () Unit!33461)

(declare-fun lt!452944 () Unit!33461)

(assert (=> d!122869 (= lt!452943 lt!452944)))

(assert (=> d!122869 (= (getValueByKey!587 lt!452941 (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!122869 (= lt!452944 (lemmaContainsTupThenGetReturnValue!277 lt!452941 (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!122869 (= lt!452941 (insertStrictlySorted!370 (toList!6889 call!43338) (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (=> d!122869 (= (+!3125 call!43338 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))) lt!452942)))

(declare-fun b!1028457 () Bool)

(declare-fun res!688175 () Bool)

(assert (=> b!1028457 (=> (not res!688175) (not e!580554))))

(assert (=> b!1028457 (= res!688175 (= (getValueByKey!587 (toList!6889 lt!452942) (_1!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun b!1028458 () Bool)

(assert (=> b!1028458 (= e!580554 (contains!5948 (toList!6889 lt!452942) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(assert (= (and d!122869 res!688174) b!1028457))

(assert (= (and b!1028457 res!688175) b!1028458))

(declare-fun m!946865 () Bool)

(assert (=> d!122869 m!946865))

(declare-fun m!946867 () Bool)

(assert (=> d!122869 m!946867))

(declare-fun m!946869 () Bool)

(assert (=> d!122869 m!946869))

(declare-fun m!946871 () Bool)

(assert (=> d!122869 m!946871))

(declare-fun m!946873 () Bool)

(assert (=> b!1028457 m!946873))

(declare-fun m!946875 () Bool)

(assert (=> b!1028458 m!946875))

(assert (=> b!1028295 d!122869))

(declare-fun b!1028459 () Bool)

(declare-fun e!580555 () Bool)

(declare-fun e!580557 () Bool)

(assert (=> b!1028459 (= e!580555 e!580557)))

(declare-fun lt!452945 () (_ BitVec 64))

(assert (=> b!1028459 (= lt!452945 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452947 () Unit!33461)

(assert (=> b!1028459 (= lt!452947 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11252 thiss!1427) lt!452945 #b00000000000000000000000000000000))))

(assert (=> b!1028459 (arrayContainsKey!0 (_keys!11252 thiss!1427) lt!452945 #b00000000000000000000000000000000)))

(declare-fun lt!452946 () Unit!33461)

(assert (=> b!1028459 (= lt!452946 lt!452947)))

(declare-fun res!688177 () Bool)

(assert (=> b!1028459 (= res!688177 (= (seekEntryOrOpen!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000) (_keys!11252 thiss!1427) (mask!29832 thiss!1427)) (Found!9667 #b00000000000000000000000000000000)))))

(assert (=> b!1028459 (=> (not res!688177) (not e!580557))))

(declare-fun b!1028460 () Bool)

(declare-fun call!43357 () Bool)

(assert (=> b!1028460 (= e!580555 call!43357)))

(declare-fun b!1028461 () Bool)

(declare-fun e!580556 () Bool)

(assert (=> b!1028461 (= e!580556 e!580555)))

(declare-fun c!103767 () Bool)

(assert (=> b!1028461 (= c!103767 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122871 () Bool)

(declare-fun res!688176 () Bool)

(assert (=> d!122871 (=> res!688176 e!580556)))

(assert (=> d!122871 (= res!688176 (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122871 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)) e!580556)))

(declare-fun b!1028462 () Bool)

(assert (=> b!1028462 (= e!580557 call!43357)))

(declare-fun bm!43354 () Bool)

(assert (=> bm!43354 (= call!43357 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(assert (= (and d!122871 (not res!688176)) b!1028461))

(assert (= (and b!1028461 c!103767) b!1028459))

(assert (= (and b!1028461 (not c!103767)) b!1028460))

(assert (= (and b!1028459 res!688177) b!1028462))

(assert (= (or b!1028462 b!1028460) bm!43354))

(assert (=> b!1028459 m!946655))

(declare-fun m!946877 () Bool)

(assert (=> b!1028459 m!946877))

(declare-fun m!946879 () Bool)

(assert (=> b!1028459 m!946879))

(assert (=> b!1028459 m!946655))

(declare-fun m!946881 () Bool)

(assert (=> b!1028459 m!946881))

(assert (=> b!1028461 m!946655))

(assert (=> b!1028461 m!946655))

(assert (=> b!1028461 m!946681))

(declare-fun m!946883 () Bool)

(assert (=> bm!43354 m!946883))

(assert (=> b!1028392 d!122871))

(declare-fun d!122873 () Bool)

(declare-fun e!580559 () Bool)

(assert (=> d!122873 e!580559))

(declare-fun res!688178 () Bool)

(assert (=> d!122873 (=> res!688178 e!580559)))

(declare-fun lt!452950 () Bool)

(assert (=> d!122873 (= res!688178 (not lt!452950))))

(declare-fun lt!452951 () Bool)

(assert (=> d!122873 (= lt!452950 lt!452951)))

(declare-fun lt!452948 () Unit!33461)

(declare-fun e!580558 () Unit!33461)

(assert (=> d!122873 (= lt!452948 e!580558)))

(declare-fun c!103768 () Bool)

(assert (=> d!122873 (= c!103768 lt!452951)))

(assert (=> d!122873 (= lt!452951 (containsKey!560 (toList!6889 lt!452856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122873 (= (contains!5946 lt!452856 #b1000000000000000000000000000000000000000000000000000000000000000) lt!452950)))

(declare-fun b!1028463 () Bool)

(declare-fun lt!452949 () Unit!33461)

(assert (=> b!1028463 (= e!580558 lt!452949)))

(assert (=> b!1028463 (= lt!452949 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028463 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028464 () Bool)

(declare-fun Unit!33476 () Unit!33461)

(assert (=> b!1028464 (= e!580558 Unit!33476)))

(declare-fun b!1028465 () Bool)

(assert (=> b!1028465 (= e!580559 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122873 c!103768) b!1028463))

(assert (= (and d!122873 (not c!103768)) b!1028464))

(assert (= (and d!122873 (not res!688178)) b!1028465))

(declare-fun m!946885 () Bool)

(assert (=> d!122873 m!946885))

(declare-fun m!946887 () Bool)

(assert (=> b!1028463 m!946887))

(declare-fun m!946889 () Bool)

(assert (=> b!1028463 m!946889))

(assert (=> b!1028463 m!946889))

(declare-fun m!946891 () Bool)

(assert (=> b!1028463 m!946891))

(assert (=> b!1028465 m!946889))

(assert (=> b!1028465 m!946889))

(assert (=> b!1028465 m!946891))

(assert (=> bm!43339 d!122873))

(declare-fun d!122875 () Bool)

(assert (=> d!122875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (mask!29832 thiss!1427))))

(assert (=> d!122875 true))

(declare-fun _$44!12 () Unit!33461)

(assert (=> d!122875 (= (choose!25 (_keys!11252 thiss!1427) (index!41040 lt!452719) (mask!29832 thiss!1427)) _$44!12)))

(declare-fun bs!30000 () Bool)

(assert (= bs!30000 d!122875))

(assert (=> bs!30000 m!946515))

(assert (=> bs!30000 m!946757))

(assert (=> d!122815 d!122875))

(assert (=> d!122815 d!122857))

(assert (=> b!1028324 d!122833))

(declare-fun d!122877 () Bool)

(declare-fun e!580561 () Bool)

(assert (=> d!122877 e!580561))

(declare-fun res!688179 () Bool)

(assert (=> d!122877 (=> res!688179 e!580561)))

(declare-fun lt!452954 () Bool)

(assert (=> d!122877 (= res!688179 (not lt!452954))))

(declare-fun lt!452955 () Bool)

(assert (=> d!122877 (= lt!452954 lt!452955)))

(declare-fun lt!452952 () Unit!33461)

(declare-fun e!580560 () Unit!33461)

(assert (=> d!122877 (= lt!452952 e!580560)))

(declare-fun c!103769 () Bool)

(assert (=> d!122877 (= c!103769 lt!452955)))

(assert (=> d!122877 (= lt!452955 (containsKey!560 (toList!6889 lt!452870) key!909))))

(assert (=> d!122877 (= (contains!5946 lt!452870 key!909) lt!452954)))

(declare-fun b!1028466 () Bool)

(declare-fun lt!452953 () Unit!33461)

(assert (=> b!1028466 (= e!580560 lt!452953)))

(assert (=> b!1028466 (= lt!452953 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452870) key!909))))

(assert (=> b!1028466 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452870) key!909))))

(declare-fun b!1028467 () Bool)

(declare-fun Unit!33477 () Unit!33461)

(assert (=> b!1028467 (= e!580560 Unit!33477)))

(declare-fun b!1028468 () Bool)

(assert (=> b!1028468 (= e!580561 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452870) key!909)))))

(assert (= (and d!122877 c!103769) b!1028466))

(assert (= (and d!122877 (not c!103769)) b!1028467))

(assert (= (and d!122877 (not res!688179)) b!1028468))

(declare-fun m!946893 () Bool)

(assert (=> d!122877 m!946893))

(declare-fun m!946895 () Bool)

(assert (=> b!1028466 m!946895))

(declare-fun m!946897 () Bool)

(assert (=> b!1028466 m!946897))

(assert (=> b!1028466 m!946897))

(declare-fun m!946899 () Bool)

(assert (=> b!1028466 m!946899))

(assert (=> b!1028468 m!946897))

(assert (=> b!1028468 m!946897))

(assert (=> b!1028468 m!946899))

(assert (=> d!122805 d!122877))

(declare-fun b!1028479 () Bool)

(declare-fun e!580570 () Bool)

(declare-fun lt!452958 () List!21846)

(assert (=> b!1028479 (= e!580570 (not (containsKey!560 lt!452958 key!909)))))

(declare-fun b!1028480 () Bool)

(declare-fun e!580569 () List!21846)

(assert (=> b!1028480 (= e!580569 (t!30913 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))))

(declare-fun b!1028481 () Bool)

(declare-fun e!580568 () List!21846)

(assert (=> b!1028481 (= e!580569 e!580568)))

(declare-fun c!103775 () Bool)

(assert (=> b!1028481 (= c!103775 (and ((_ is Cons!21842) (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))) (not (= (_1!7824 (h!23041 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))) key!909))))))

(declare-fun d!122879 () Bool)

(assert (=> d!122879 e!580570))

(declare-fun res!688182 () Bool)

(assert (=> d!122879 (=> (not res!688182) (not e!580570))))

(declare-fun isStrictlySorted!711 (List!21846) Bool)

(assert (=> d!122879 (= res!688182 (isStrictlySorted!711 lt!452958))))

(assert (=> d!122879 (= lt!452958 e!580569)))

(declare-fun c!103774 () Bool)

(assert (=> d!122879 (= c!103774 (and ((_ is Cons!21842) (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))) (= (_1!7824 (h!23041 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))) key!909)))))

(assert (=> d!122879 (isStrictlySorted!711 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))))

(assert (=> d!122879 (= (removeStrictlySorted!51 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))) key!909) lt!452958)))

(declare-fun b!1028482 () Bool)

(assert (=> b!1028482 (= e!580568 Nil!21843)))

(declare-fun b!1028483 () Bool)

(declare-fun $colon$colon!601 (List!21846 tuple2!15626) List!21846)

(assert (=> b!1028483 (= e!580568 ($colon$colon!601 (removeStrictlySorted!51 (t!30913 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))) key!909) (h!23041 (toList!6889 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427))))))))

(assert (= (and d!122879 c!103774) b!1028480))

(assert (= (and d!122879 (not c!103774)) b!1028481))

(assert (= (and b!1028481 c!103775) b!1028483))

(assert (= (and b!1028481 (not c!103775)) b!1028482))

(assert (= (and d!122879 res!688182) b!1028479))

(declare-fun m!946901 () Bool)

(assert (=> b!1028479 m!946901))

(declare-fun m!946903 () Bool)

(assert (=> d!122879 m!946903))

(declare-fun m!946905 () Bool)

(assert (=> d!122879 m!946905))

(declare-fun m!946907 () Bool)

(assert (=> b!1028483 m!946907))

(assert (=> b!1028483 m!946907))

(declare-fun m!946909 () Bool)

(assert (=> b!1028483 m!946909))

(assert (=> d!122805 d!122879))

(declare-fun d!122881 () Bool)

(declare-fun res!688183 () Bool)

(declare-fun e!580571 () Bool)

(assert (=> d!122881 (=> res!688183 e!580571)))

(assert (=> d!122881 (= res!688183 (= (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122881 (= (arrayContainsKey!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) key!909 #b00000000000000000000000000000000) e!580571)))

(declare-fun b!1028484 () Bool)

(declare-fun e!580572 () Bool)

(assert (=> b!1028484 (= e!580571 e!580572)))

(declare-fun res!688184 () Bool)

(assert (=> b!1028484 (=> (not res!688184) (not e!580572))))

(assert (=> b!1028484 (= res!688184 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(declare-fun b!1028485 () Bool)

(assert (=> b!1028485 (= e!580572 (arrayContainsKey!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122881 (not res!688183)) b!1028484))

(assert (= (and b!1028484 res!688184) b!1028485))

(assert (=> d!122881 m!946843))

(declare-fun m!946911 () Bool)

(assert (=> b!1028485 m!946911))

(assert (=> b!1028338 d!122881))

(declare-fun d!122883 () Bool)

(declare-fun e!580574 () Bool)

(assert (=> d!122883 e!580574))

(declare-fun res!688185 () Bool)

(assert (=> d!122883 (=> res!688185 e!580574)))

(declare-fun lt!452961 () Bool)

(assert (=> d!122883 (= res!688185 (not lt!452961))))

(declare-fun lt!452962 () Bool)

(assert (=> d!122883 (= lt!452961 lt!452962)))

(declare-fun lt!452959 () Unit!33461)

(declare-fun e!580573 () Unit!33461)

(assert (=> d!122883 (= lt!452959 e!580573)))

(declare-fun c!103776 () Bool)

(assert (=> d!122883 (= c!103776 lt!452962)))

(assert (=> d!122883 (= lt!452962 (containsKey!560 (toList!6889 lt!452856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122883 (= (contains!5946 lt!452856 #b0000000000000000000000000000000000000000000000000000000000000000) lt!452961)))

(declare-fun b!1028486 () Bool)

(declare-fun lt!452960 () Unit!33461)

(assert (=> b!1028486 (= e!580573 lt!452960)))

(assert (=> b!1028486 (= lt!452960 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028486 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028487 () Bool)

(declare-fun Unit!33478 () Unit!33461)

(assert (=> b!1028487 (= e!580573 Unit!33478)))

(declare-fun b!1028488 () Bool)

(assert (=> b!1028488 (= e!580574 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122883 c!103776) b!1028486))

(assert (= (and d!122883 (not c!103776)) b!1028487))

(assert (= (and d!122883 (not res!688185)) b!1028488))

(declare-fun m!946913 () Bool)

(assert (=> d!122883 m!946913))

(declare-fun m!946915 () Bool)

(assert (=> b!1028486 m!946915))

(declare-fun m!946917 () Bool)

(assert (=> b!1028486 m!946917))

(assert (=> b!1028486 m!946917))

(declare-fun m!946919 () Bool)

(assert (=> b!1028486 m!946919))

(assert (=> b!1028488 m!946917))

(assert (=> b!1028488 m!946917))

(assert (=> b!1028488 m!946919))

(assert (=> bm!43335 d!122883))

(declare-fun call!43360 () ListLongMap!13747)

(declare-fun bm!43357 () Bool)

(assert (=> bm!43357 (= call!43360 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1028513 () Bool)

(declare-fun e!580593 () ListLongMap!13747)

(declare-fun e!580592 () ListLongMap!13747)

(assert (=> b!1028513 (= e!580593 e!580592)))

(declare-fun c!103787 () Bool)

(assert (=> b!1028513 (= c!103787 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028514 () Bool)

(declare-fun e!580590 () Bool)

(declare-fun e!580594 () Bool)

(assert (=> b!1028514 (= e!580590 e!580594)))

(declare-fun c!103788 () Bool)

(assert (=> b!1028514 (= c!103788 (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(declare-fun b!1028515 () Bool)

(declare-fun e!580595 () Bool)

(assert (=> b!1028515 (= e!580595 e!580590)))

(declare-fun c!103786 () Bool)

(declare-fun e!580589 () Bool)

(assert (=> b!1028515 (= c!103786 e!580589)))

(declare-fun res!688194 () Bool)

(assert (=> b!1028515 (=> (not res!688194) (not e!580589))))

(assert (=> b!1028515 (= res!688194 (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(declare-fun b!1028516 () Bool)

(declare-fun res!688197 () Bool)

(assert (=> b!1028516 (=> (not res!688197) (not e!580595))))

(declare-fun lt!452977 () ListLongMap!13747)

(assert (=> b!1028516 (= res!688197 (not (contains!5946 lt!452977 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028517 () Bool)

(assert (=> b!1028517 (= e!580589 (validKeyInArray!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (=> b!1028517 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028518 () Bool)

(declare-fun lt!452981 () Unit!33461)

(declare-fun lt!452980 () Unit!33461)

(assert (=> b!1028518 (= lt!452981 lt!452980)))

(declare-fun lt!452983 () ListLongMap!13747)

(declare-fun lt!452982 () (_ BitVec 64))

(declare-fun lt!452979 () (_ BitVec 64))

(declare-fun lt!452978 () V!37275)

(assert (=> b!1028518 (not (contains!5946 (+!3125 lt!452983 (tuple2!15627 lt!452979 lt!452978)) lt!452982))))

(declare-fun addStillNotContains!240 (ListLongMap!13747 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33461)

(assert (=> b!1028518 (= lt!452980 (addStillNotContains!240 lt!452983 lt!452979 lt!452978 lt!452982))))

(assert (=> b!1028518 (= lt!452982 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028518 (= lt!452978 (get!16342 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028518 (= lt!452979 (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))

(assert (=> b!1028518 (= lt!452983 call!43360)))

(assert (=> b!1028518 (= e!580592 (+!3125 call!43360 (tuple2!15627 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) (get!16342 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028519 () Bool)

(assert (=> b!1028519 (= e!580594 (= lt!452977 (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427))))))

(declare-fun b!1028520 () Bool)

(declare-fun e!580591 () Bool)

(assert (=> b!1028520 (= e!580590 e!580591)))

(assert (=> b!1028520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(declare-fun res!688195 () Bool)

(assert (=> b!1028520 (= res!688195 (contains!5946 lt!452977 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (=> b!1028520 (=> (not res!688195) (not e!580591))))

(declare-fun d!122885 () Bool)

(assert (=> d!122885 e!580595))

(declare-fun res!688196 () Bool)

(assert (=> d!122885 (=> (not res!688196) (not e!580595))))

(assert (=> d!122885 (= res!688196 (not (contains!5946 lt!452977 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!122885 (= lt!452977 e!580593)))

(declare-fun c!103785 () Bool)

(assert (=> d!122885 (= c!103785 (bvsge #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(assert (=> d!122885 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122885 (= (getCurrentListMapNoExtraKeys!3560 lt!452721 lt!452715 (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!452977)))

(declare-fun b!1028521 () Bool)

(declare-fun isEmpty!928 (ListLongMap!13747) Bool)

(assert (=> b!1028521 (= e!580594 (isEmpty!928 lt!452977))))

(declare-fun b!1028522 () Bool)

(assert (=> b!1028522 (= e!580592 call!43360)))

(declare-fun b!1028523 () Bool)

(assert (=> b!1028523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 lt!452721)))))

(assert (=> b!1028523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31621 lt!452715)))))

(assert (=> b!1028523 (= e!580591 (= (apply!894 lt!452977 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) (get!16342 (select (arr!31105 lt!452715) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028524 () Bool)

(assert (=> b!1028524 (= e!580593 (ListLongMap!13748 Nil!21843))))

(assert (= (and d!122885 c!103785) b!1028524))

(assert (= (and d!122885 (not c!103785)) b!1028513))

(assert (= (and b!1028513 c!103787) b!1028518))

(assert (= (and b!1028513 (not c!103787)) b!1028522))

(assert (= (or b!1028518 b!1028522) bm!43357))

(assert (= (and d!122885 res!688196) b!1028516))

(assert (= (and b!1028516 res!688197) b!1028515))

(assert (= (and b!1028515 res!688194) b!1028517))

(assert (= (and b!1028515 c!103786) b!1028520))

(assert (= (and b!1028515 (not c!103786)) b!1028514))

(assert (= (and b!1028520 res!688195) b!1028523))

(assert (= (and b!1028514 c!103788) b!1028519))

(assert (= (and b!1028514 (not c!103788)) b!1028521))

(declare-fun b_lambda!15781 () Bool)

(assert (=> (not b_lambda!15781) (not b!1028518)))

(assert (=> b!1028518 t!30912))

(declare-fun b_and!32855 () Bool)

(assert (= b_and!32853 (and (=> t!30912 result!14109) b_and!32855)))

(declare-fun b_lambda!15783 () Bool)

(assert (=> (not b_lambda!15783) (not b!1028523)))

(assert (=> b!1028523 t!30912))

(declare-fun b_and!32857 () Bool)

(assert (= b_and!32855 (and (=> t!30912 result!14109) b_and!32857)))

(assert (=> b!1028513 m!946623))

(assert (=> b!1028513 m!946623))

(assert (=> b!1028513 m!946631))

(declare-fun m!946921 () Bool)

(assert (=> b!1028521 m!946921))

(declare-fun m!946923 () Bool)

(assert (=> d!122885 m!946923))

(assert (=> d!122885 m!946617))

(assert (=> b!1028523 m!946623))

(declare-fun m!946925 () Bool)

(assert (=> b!1028523 m!946925))

(assert (=> b!1028523 m!946623))

(assert (=> b!1028523 m!946517))

(assert (=> b!1028523 m!946731))

(assert (=> b!1028523 m!946731))

(assert (=> b!1028523 m!946517))

(assert (=> b!1028523 m!946733))

(declare-fun m!946927 () Bool)

(assert (=> b!1028516 m!946927))

(declare-fun m!946929 () Bool)

(assert (=> b!1028518 m!946929))

(declare-fun m!946931 () Bool)

(assert (=> b!1028518 m!946931))

(assert (=> b!1028518 m!946517))

(assert (=> b!1028518 m!946731))

(assert (=> b!1028518 m!946731))

(assert (=> b!1028518 m!946517))

(assert (=> b!1028518 m!946733))

(declare-fun m!946933 () Bool)

(assert (=> b!1028518 m!946933))

(declare-fun m!946935 () Bool)

(assert (=> b!1028518 m!946935))

(assert (=> b!1028518 m!946623))

(assert (=> b!1028518 m!946933))

(assert (=> b!1028520 m!946623))

(assert (=> b!1028520 m!946623))

(declare-fun m!946937 () Bool)

(assert (=> b!1028520 m!946937))

(assert (=> b!1028517 m!946623))

(assert (=> b!1028517 m!946623))

(assert (=> b!1028517 m!946631))

(declare-fun m!946939 () Bool)

(assert (=> bm!43357 m!946939))

(assert (=> b!1028519 m!946939))

(assert (=> bm!43344 d!122885))

(declare-fun d!122887 () Bool)

(assert (=> d!122887 (arrayNoDuplicates!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000000 Nil!21844)))

(assert (=> d!122887 true))

(declare-fun _$66!35 () Unit!33461)

(assert (=> d!122887 (= (choose!53 (_keys!11252 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41040 lt!452719) #b00000000000000000000000000000000 Nil!21844) _$66!35)))

(declare-fun bs!30001 () Bool)

(assert (= bs!30001 d!122887))

(assert (=> bs!30001 m!946515))

(assert (=> bs!30001 m!946781))

(assert (=> d!122825 d!122887))

(declare-fun d!122889 () Bool)

(assert (=> d!122889 (= (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028301 d!122889))

(assert (=> b!1028375 d!122833))

(declare-fun d!122891 () Bool)

(assert (=> d!122891 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1028361 d!122891))

(assert (=> b!1028303 d!122889))

(assert (=> b!1028249 d!122833))

(declare-fun d!122893 () Bool)

(assert (=> d!122893 (= (apply!894 lt!452881 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16343 (getValueByKey!587 (toList!6889 lt!452881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30002 () Bool)

(assert (= bs!30002 d!122893))

(assert (=> bs!30002 m!946839))

(assert (=> bs!30002 m!946839))

(declare-fun m!946941 () Bool)

(assert (=> bs!30002 m!946941))

(assert (=> b!1028315 d!122893))

(assert (=> b!1028349 d!122889))

(declare-fun d!122895 () Bool)

(assert (=> d!122895 (= (apply!894 lt!452884 lt!452871) (get!16343 (getValueByKey!587 (toList!6889 lt!452884) lt!452871)))))

(declare-fun bs!30003 () Bool)

(assert (= bs!30003 d!122895))

(declare-fun m!946943 () Bool)

(assert (=> bs!30003 m!946943))

(assert (=> bs!30003 m!946943))

(declare-fun m!946945 () Bool)

(assert (=> bs!30003 m!946945))

(assert (=> b!1028333 d!122895))

(declare-fun d!122897 () Bool)

(assert (=> d!122897 (= (apply!894 (+!3125 lt!452884 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))) lt!452871) (get!16343 (getValueByKey!587 (toList!6889 (+!3125 lt!452884 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))) lt!452871)))))

(declare-fun bs!30004 () Bool)

(assert (= bs!30004 d!122897))

(declare-fun m!946947 () Bool)

(assert (=> bs!30004 m!946947))

(assert (=> bs!30004 m!946947))

(declare-fun m!946949 () Bool)

(assert (=> bs!30004 m!946949))

(assert (=> b!1028333 d!122897))

(declare-fun d!122899 () Bool)

(assert (=> d!122899 (= (apply!894 lt!452882 lt!452885) (get!16343 (getValueByKey!587 (toList!6889 lt!452882) lt!452885)))))

(declare-fun bs!30005 () Bool)

(assert (= bs!30005 d!122899))

(declare-fun m!946951 () Bool)

(assert (=> bs!30005 m!946951))

(assert (=> bs!30005 m!946951))

(declare-fun m!946953 () Bool)

(assert (=> bs!30005 m!946953))

(assert (=> b!1028333 d!122899))

(declare-fun d!122901 () Bool)

(declare-fun e!580596 () Bool)

(assert (=> d!122901 e!580596))

(declare-fun res!688198 () Bool)

(assert (=> d!122901 (=> (not res!688198) (not e!580596))))

(declare-fun lt!452985 () ListLongMap!13747)

(assert (=> d!122901 (= res!688198 (contains!5946 lt!452985 (_1!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!452984 () List!21846)

(assert (=> d!122901 (= lt!452985 (ListLongMap!13748 lt!452984))))

(declare-fun lt!452986 () Unit!33461)

(declare-fun lt!452987 () Unit!33461)

(assert (=> d!122901 (= lt!452986 lt!452987)))

(assert (=> d!122901 (= (getValueByKey!587 lt!452984 (_1!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122901 (= lt!452987 (lemmaContainsTupThenGetReturnValue!277 lt!452984 (_1!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122901 (= lt!452984 (insertStrictlySorted!370 (toList!6889 lt!452891) (_1!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122901 (= (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))) lt!452985)))

(declare-fun b!1028525 () Bool)

(declare-fun res!688199 () Bool)

(assert (=> b!1028525 (=> (not res!688199) (not e!580596))))

(assert (=> b!1028525 (= res!688199 (= (getValueByKey!587 (toList!6889 lt!452985) (_1!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1028526 () Bool)

(assert (=> b!1028526 (= e!580596 (contains!5948 (toList!6889 lt!452985) (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!122901 res!688198) b!1028525))

(assert (= (and b!1028525 res!688199) b!1028526))

(declare-fun m!946955 () Bool)

(assert (=> d!122901 m!946955))

(declare-fun m!946957 () Bool)

(assert (=> d!122901 m!946957))

(declare-fun m!946959 () Bool)

(assert (=> d!122901 m!946959))

(declare-fun m!946961 () Bool)

(assert (=> d!122901 m!946961))

(declare-fun m!946963 () Bool)

(assert (=> b!1028525 m!946963))

(declare-fun m!946965 () Bool)

(assert (=> b!1028526 m!946965))

(assert (=> b!1028333 d!122901))

(declare-fun d!122903 () Bool)

(assert (=> d!122903 (= (apply!894 (+!3125 lt!452882 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))) lt!452885) (get!16343 (getValueByKey!587 (toList!6889 (+!3125 lt!452882 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))) lt!452885)))))

(declare-fun bs!30006 () Bool)

(assert (= bs!30006 d!122903))

(declare-fun m!946967 () Bool)

(assert (=> bs!30006 m!946967))

(assert (=> bs!30006 m!946967))

(declare-fun m!946969 () Bool)

(assert (=> bs!30006 m!946969))

(assert (=> b!1028333 d!122903))

(declare-fun d!122905 () Bool)

(assert (=> d!122905 (contains!5946 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))) lt!452886)))

(declare-fun lt!452990 () Unit!33461)

(declare-fun choose!1693 (ListLongMap!13747 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33461)

(assert (=> d!122905 (= lt!452990 (choose!1693 lt!452891 lt!452883 (zeroValue!5938 thiss!1427) lt!452886))))

(assert (=> d!122905 (contains!5946 lt!452891 lt!452886)))

(assert (=> d!122905 (= (addStillContains!613 lt!452891 lt!452883 (zeroValue!5938 thiss!1427) lt!452886) lt!452990)))

(declare-fun bs!30007 () Bool)

(assert (= bs!30007 d!122905))

(assert (=> bs!30007 m!946699))

(assert (=> bs!30007 m!946699))

(assert (=> bs!30007 m!946719))

(declare-fun m!946971 () Bool)

(assert (=> bs!30007 m!946971))

(declare-fun m!946973 () Bool)

(assert (=> bs!30007 m!946973))

(assert (=> b!1028333 d!122905))

(declare-fun d!122907 () Bool)

(assert (=> d!122907 (= (apply!894 (+!3125 lt!452884 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))) lt!452871) (apply!894 lt!452884 lt!452871))))

(declare-fun lt!452993 () Unit!33461)

(declare-fun choose!1694 (ListLongMap!13747 (_ BitVec 64) V!37275 (_ BitVec 64)) Unit!33461)

(assert (=> d!122907 (= lt!452993 (choose!1694 lt!452884 lt!452892 (minValue!5938 thiss!1427) lt!452871))))

(declare-fun e!580599 () Bool)

(assert (=> d!122907 e!580599))

(declare-fun res!688202 () Bool)

(assert (=> d!122907 (=> (not res!688202) (not e!580599))))

(assert (=> d!122907 (= res!688202 (contains!5946 lt!452884 lt!452871))))

(assert (=> d!122907 (= (addApplyDifferent!469 lt!452884 lt!452892 (minValue!5938 thiss!1427) lt!452871) lt!452993)))

(declare-fun b!1028531 () Bool)

(assert (=> b!1028531 (= e!580599 (not (= lt!452871 lt!452892)))))

(assert (= (and d!122907 res!688202) b!1028531))

(declare-fun m!946975 () Bool)

(assert (=> d!122907 m!946975))

(declare-fun m!946977 () Bool)

(assert (=> d!122907 m!946977))

(assert (=> d!122907 m!946715))

(assert (=> d!122907 m!946717))

(assert (=> d!122907 m!946715))

(assert (=> d!122907 m!946705))

(assert (=> b!1028333 d!122907))

(declare-fun d!122909 () Bool)

(declare-fun e!580601 () Bool)

(assert (=> d!122909 e!580601))

(declare-fun res!688203 () Bool)

(assert (=> d!122909 (=> res!688203 e!580601)))

(declare-fun lt!452996 () Bool)

(assert (=> d!122909 (= res!688203 (not lt!452996))))

(declare-fun lt!452997 () Bool)

(assert (=> d!122909 (= lt!452996 lt!452997)))

(declare-fun lt!452994 () Unit!33461)

(declare-fun e!580600 () Unit!33461)

(assert (=> d!122909 (= lt!452994 e!580600)))

(declare-fun c!103789 () Bool)

(assert (=> d!122909 (= c!103789 lt!452997)))

(assert (=> d!122909 (= lt!452997 (containsKey!560 (toList!6889 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))) lt!452886))))

(assert (=> d!122909 (= (contains!5946 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427))) lt!452886) lt!452996)))

(declare-fun b!1028532 () Bool)

(declare-fun lt!452995 () Unit!33461)

(assert (=> b!1028532 (= e!580600 lt!452995)))

(assert (=> b!1028532 (= lt!452995 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))) lt!452886))))

(assert (=> b!1028532 (isDefined!435 (getValueByKey!587 (toList!6889 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))) lt!452886))))

(declare-fun b!1028533 () Bool)

(declare-fun Unit!33479 () Unit!33461)

(assert (=> b!1028533 (= e!580600 Unit!33479)))

(declare-fun b!1028534 () Bool)

(assert (=> b!1028534 (= e!580601 (isDefined!435 (getValueByKey!587 (toList!6889 (+!3125 lt!452891 (tuple2!15627 lt!452883 (zeroValue!5938 thiss!1427)))) lt!452886)))))

(assert (= (and d!122909 c!103789) b!1028532))

(assert (= (and d!122909 (not c!103789)) b!1028533))

(assert (= (and d!122909 (not res!688203)) b!1028534))

(declare-fun m!946979 () Bool)

(assert (=> d!122909 m!946979))

(declare-fun m!946981 () Bool)

(assert (=> b!1028532 m!946981))

(declare-fun m!946983 () Bool)

(assert (=> b!1028532 m!946983))

(assert (=> b!1028532 m!946983))

(declare-fun m!946985 () Bool)

(assert (=> b!1028532 m!946985))

(assert (=> b!1028534 m!946983))

(assert (=> b!1028534 m!946983))

(assert (=> b!1028534 m!946985))

(assert (=> b!1028333 d!122909))

(declare-fun d!122911 () Bool)

(assert (=> d!122911 (= (apply!894 (+!3125 lt!452890 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))) lt!452887) (get!16343 (getValueByKey!587 (toList!6889 (+!3125 lt!452890 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))) lt!452887)))))

(declare-fun bs!30008 () Bool)

(assert (= bs!30008 d!122911))

(declare-fun m!946987 () Bool)

(assert (=> bs!30008 m!946987))

(assert (=> bs!30008 m!946987))

(declare-fun m!946989 () Bool)

(assert (=> bs!30008 m!946989))

(assert (=> b!1028333 d!122911))

(declare-fun d!122913 () Bool)

(assert (=> d!122913 (= (apply!894 lt!452890 lt!452887) (get!16343 (getValueByKey!587 (toList!6889 lt!452890) lt!452887)))))

(declare-fun bs!30009 () Bool)

(assert (= bs!30009 d!122913))

(declare-fun m!946991 () Bool)

(assert (=> bs!30009 m!946991))

(assert (=> bs!30009 m!946991))

(declare-fun m!946993 () Bool)

(assert (=> bs!30009 m!946993))

(assert (=> b!1028333 d!122913))

(assert (=> b!1028333 d!122885))

(declare-fun d!122915 () Bool)

(declare-fun e!580602 () Bool)

(assert (=> d!122915 e!580602))

(declare-fun res!688204 () Bool)

(assert (=> d!122915 (=> (not res!688204) (not e!580602))))

(declare-fun lt!452999 () ListLongMap!13747)

(assert (=> d!122915 (= res!688204 (contains!5946 lt!452999 (_1!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!452998 () List!21846)

(assert (=> d!122915 (= lt!452999 (ListLongMap!13748 lt!452998))))

(declare-fun lt!453000 () Unit!33461)

(declare-fun lt!453001 () Unit!33461)

(assert (=> d!122915 (= lt!453000 lt!453001)))

(assert (=> d!122915 (= (getValueByKey!587 lt!452998 (_1!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122915 (= lt!453001 (lemmaContainsTupThenGetReturnValue!277 lt!452998 (_1!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122915 (= lt!452998 (insertStrictlySorted!370 (toList!6889 lt!452890) (_1!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122915 (= (+!3125 lt!452890 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))) lt!452999)))

(declare-fun b!1028535 () Bool)

(declare-fun res!688205 () Bool)

(assert (=> b!1028535 (=> (not res!688205) (not e!580602))))

(assert (=> b!1028535 (= res!688205 (= (getValueByKey!587 (toList!6889 lt!452999) (_1!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1028536 () Bool)

(assert (=> b!1028536 (= e!580602 (contains!5948 (toList!6889 lt!452999) (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!122915 res!688204) b!1028535))

(assert (= (and b!1028535 res!688205) b!1028536))

(declare-fun m!946995 () Bool)

(assert (=> d!122915 m!946995))

(declare-fun m!946997 () Bool)

(assert (=> d!122915 m!946997))

(declare-fun m!946999 () Bool)

(assert (=> d!122915 m!946999))

(declare-fun m!947001 () Bool)

(assert (=> d!122915 m!947001))

(declare-fun m!947003 () Bool)

(assert (=> b!1028535 m!947003))

(declare-fun m!947005 () Bool)

(assert (=> b!1028536 m!947005))

(assert (=> b!1028333 d!122915))

(declare-fun d!122917 () Bool)

(assert (=> d!122917 (= (apply!894 (+!3125 lt!452882 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))) lt!452885) (apply!894 lt!452882 lt!452885))))

(declare-fun lt!453002 () Unit!33461)

(assert (=> d!122917 (= lt!453002 (choose!1694 lt!452882 lt!452879 (minValue!5938 thiss!1427) lt!452885))))

(declare-fun e!580603 () Bool)

(assert (=> d!122917 e!580603))

(declare-fun res!688206 () Bool)

(assert (=> d!122917 (=> (not res!688206) (not e!580603))))

(assert (=> d!122917 (= res!688206 (contains!5946 lt!452882 lt!452885))))

(assert (=> d!122917 (= (addApplyDifferent!469 lt!452882 lt!452879 (minValue!5938 thiss!1427) lt!452885) lt!453002)))

(declare-fun b!1028537 () Bool)

(assert (=> b!1028537 (= e!580603 (not (= lt!452885 lt!452879)))))

(assert (= (and d!122917 res!688206) b!1028537))

(declare-fun m!947007 () Bool)

(assert (=> d!122917 m!947007))

(declare-fun m!947009 () Bool)

(assert (=> d!122917 m!947009))

(assert (=> d!122917 m!946721))

(assert (=> d!122917 m!946723))

(assert (=> d!122917 m!946721))

(assert (=> d!122917 m!946697))

(assert (=> b!1028333 d!122917))

(declare-fun d!122919 () Bool)

(declare-fun e!580604 () Bool)

(assert (=> d!122919 e!580604))

(declare-fun res!688207 () Bool)

(assert (=> d!122919 (=> (not res!688207) (not e!580604))))

(declare-fun lt!453004 () ListLongMap!13747)

(assert (=> d!122919 (= res!688207 (contains!5946 lt!453004 (_1!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453003 () List!21846)

(assert (=> d!122919 (= lt!453004 (ListLongMap!13748 lt!453003))))

(declare-fun lt!453005 () Unit!33461)

(declare-fun lt!453006 () Unit!33461)

(assert (=> d!122919 (= lt!453005 lt!453006)))

(assert (=> d!122919 (= (getValueByKey!587 lt!453003 (_1!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))))))

(assert (=> d!122919 (= lt!453006 (lemmaContainsTupThenGetReturnValue!277 lt!453003 (_1!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))))))

(assert (=> d!122919 (= lt!453003 (insertStrictlySorted!370 (toList!6889 lt!452882) (_1!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))))))

(assert (=> d!122919 (= (+!3125 lt!452882 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))) lt!453004)))

(declare-fun b!1028538 () Bool)

(declare-fun res!688208 () Bool)

(assert (=> b!1028538 (=> (not res!688208) (not e!580604))))

(assert (=> b!1028538 (= res!688208 (= (getValueByKey!587 (toList!6889 lt!453004) (_1!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))))))))

(declare-fun b!1028539 () Bool)

(assert (=> b!1028539 (= e!580604 (contains!5948 (toList!6889 lt!453004) (tuple2!15627 lt!452879 (minValue!5938 thiss!1427))))))

(assert (= (and d!122919 res!688207) b!1028538))

(assert (= (and b!1028538 res!688208) b!1028539))

(declare-fun m!947011 () Bool)

(assert (=> d!122919 m!947011))

(declare-fun m!947013 () Bool)

(assert (=> d!122919 m!947013))

(declare-fun m!947015 () Bool)

(assert (=> d!122919 m!947015))

(declare-fun m!947017 () Bool)

(assert (=> d!122919 m!947017))

(declare-fun m!947019 () Bool)

(assert (=> b!1028538 m!947019))

(declare-fun m!947021 () Bool)

(assert (=> b!1028539 m!947021))

(assert (=> b!1028333 d!122919))

(declare-fun d!122921 () Bool)

(assert (=> d!122921 (= (apply!894 (+!3125 lt!452890 (tuple2!15627 lt!452880 (zeroValue!5938 thiss!1427))) lt!452887) (apply!894 lt!452890 lt!452887))))

(declare-fun lt!453007 () Unit!33461)

(assert (=> d!122921 (= lt!453007 (choose!1694 lt!452890 lt!452880 (zeroValue!5938 thiss!1427) lt!452887))))

(declare-fun e!580605 () Bool)

(assert (=> d!122921 e!580605))

(declare-fun res!688209 () Bool)

(assert (=> d!122921 (=> (not res!688209) (not e!580605))))

(assert (=> d!122921 (= res!688209 (contains!5946 lt!452890 lt!452887))))

(assert (=> d!122921 (= (addApplyDifferent!469 lt!452890 lt!452880 (zeroValue!5938 thiss!1427) lt!452887) lt!453007)))

(declare-fun b!1028540 () Bool)

(assert (=> b!1028540 (= e!580605 (not (= lt!452887 lt!452880)))))

(assert (= (and d!122921 res!688209) b!1028540))

(declare-fun m!947023 () Bool)

(assert (=> d!122921 m!947023))

(declare-fun m!947025 () Bool)

(assert (=> d!122921 m!947025))

(assert (=> d!122921 m!946711))

(assert (=> d!122921 m!946727))

(assert (=> d!122921 m!946711))

(assert (=> d!122921 m!946703))

(assert (=> b!1028333 d!122921))

(declare-fun d!122923 () Bool)

(declare-fun e!580606 () Bool)

(assert (=> d!122923 e!580606))

(declare-fun res!688210 () Bool)

(assert (=> d!122923 (=> (not res!688210) (not e!580606))))

(declare-fun lt!453009 () ListLongMap!13747)

(assert (=> d!122923 (= res!688210 (contains!5946 lt!453009 (_1!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453008 () List!21846)

(assert (=> d!122923 (= lt!453009 (ListLongMap!13748 lt!453008))))

(declare-fun lt!453010 () Unit!33461)

(declare-fun lt!453011 () Unit!33461)

(assert (=> d!122923 (= lt!453010 lt!453011)))

(assert (=> d!122923 (= (getValueByKey!587 lt!453008 (_1!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))))))

(assert (=> d!122923 (= lt!453011 (lemmaContainsTupThenGetReturnValue!277 lt!453008 (_1!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))))))

(assert (=> d!122923 (= lt!453008 (insertStrictlySorted!370 (toList!6889 lt!452884) (_1!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))))))

(assert (=> d!122923 (= (+!3125 lt!452884 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))) lt!453009)))

(declare-fun b!1028541 () Bool)

(declare-fun res!688211 () Bool)

(assert (=> b!1028541 (=> (not res!688211) (not e!580606))))

(assert (=> b!1028541 (= res!688211 (= (getValueByKey!587 (toList!6889 lt!453009) (_1!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))))))))

(declare-fun b!1028542 () Bool)

(assert (=> b!1028542 (= e!580606 (contains!5948 (toList!6889 lt!453009) (tuple2!15627 lt!452892 (minValue!5938 thiss!1427))))))

(assert (= (and d!122923 res!688210) b!1028541))

(assert (= (and b!1028541 res!688211) b!1028542))

(declare-fun m!947027 () Bool)

(assert (=> d!122923 m!947027))

(declare-fun m!947029 () Bool)

(assert (=> d!122923 m!947029))

(declare-fun m!947031 () Bool)

(assert (=> d!122923 m!947031))

(declare-fun m!947033 () Bool)

(assert (=> d!122923 m!947033))

(declare-fun m!947035 () Bool)

(assert (=> b!1028541 m!947035))

(declare-fun m!947037 () Bool)

(assert (=> b!1028542 m!947037))

(assert (=> b!1028333 d!122923))

(declare-fun b!1028561 () Bool)

(declare-fun lt!453017 () SeekEntryResult!9667)

(assert (=> b!1028561 (and (bvsge (index!41041 lt!453017) #b00000000000000000000000000000000) (bvslt (index!41041 lt!453017) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun res!688219 () Bool)

(assert (=> b!1028561 (= res!688219 (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41041 lt!453017)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580618 () Bool)

(assert (=> b!1028561 (=> res!688219 e!580618)))

(declare-fun b!1028563 () Bool)

(declare-fun e!580620 () SeekEntryResult!9667)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028563 (= e!580620 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29832 thiss!1427)) #b00000000000000000000000000000000 (mask!29832 thiss!1427)) key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(declare-fun b!1028564 () Bool)

(declare-fun e!580617 () Bool)

(assert (=> b!1028564 (= e!580617 (bvsge (x!91492 lt!453017) #b01111111111111111111111111111110))))

(declare-fun b!1028565 () Bool)

(declare-fun e!580621 () SeekEntryResult!9667)

(assert (=> b!1028565 (= e!580621 e!580620)))

(declare-fun c!103797 () Bool)

(declare-fun lt!453016 () (_ BitVec 64))

(assert (=> b!1028565 (= c!103797 (or (= lt!453016 key!909) (= (bvadd lt!453016 lt!453016) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028566 () Bool)

(assert (=> b!1028566 (= e!580621 (Intermediate!9667 true (toIndex!0 key!909 (mask!29832 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1028567 () Bool)

(declare-fun e!580619 () Bool)

(assert (=> b!1028567 (= e!580617 e!580619)))

(declare-fun res!688218 () Bool)

(assert (=> b!1028567 (= res!688218 (and ((_ is Intermediate!9667) lt!453017) (not (undefined!10479 lt!453017)) (bvslt (x!91492 lt!453017) #b01111111111111111111111111111110) (bvsge (x!91492 lt!453017) #b00000000000000000000000000000000) (bvsge (x!91492 lt!453017) #b00000000000000000000000000000000)))))

(assert (=> b!1028567 (=> (not res!688218) (not e!580619))))

(declare-fun b!1028568 () Bool)

(assert (=> b!1028568 (and (bvsge (index!41041 lt!453017) #b00000000000000000000000000000000) (bvslt (index!41041 lt!453017) (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> b!1028568 (= e!580618 (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41041 lt!453017)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028569 () Bool)

(assert (=> b!1028569 (and (bvsge (index!41041 lt!453017) #b00000000000000000000000000000000) (bvslt (index!41041 lt!453017) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun res!688220 () Bool)

(assert (=> b!1028569 (= res!688220 (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41041 lt!453017)) key!909))))

(assert (=> b!1028569 (=> res!688220 e!580618)))

(assert (=> b!1028569 (= e!580619 e!580618)))

(declare-fun d!122925 () Bool)

(assert (=> d!122925 e!580617))

(declare-fun c!103796 () Bool)

(assert (=> d!122925 (= c!103796 (and ((_ is Intermediate!9667) lt!453017) (undefined!10479 lt!453017)))))

(assert (=> d!122925 (= lt!453017 e!580621)))

(declare-fun c!103798 () Bool)

(assert (=> d!122925 (= c!103798 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!122925 (= lt!453016 (select (arr!31104 (_keys!11252 thiss!1427)) (toIndex!0 key!909 (mask!29832 thiss!1427))))))

(assert (=> d!122925 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29832 thiss!1427)) key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)) lt!453017)))

(declare-fun b!1028562 () Bool)

(assert (=> b!1028562 (= e!580620 (Intermediate!9667 false (toIndex!0 key!909 (mask!29832 thiss!1427)) #b00000000000000000000000000000000))))

(assert (= (and d!122925 c!103798) b!1028566))

(assert (= (and d!122925 (not c!103798)) b!1028565))

(assert (= (and b!1028565 c!103797) b!1028562))

(assert (= (and b!1028565 (not c!103797)) b!1028563))

(assert (= (and d!122925 c!103796) b!1028564))

(assert (= (and d!122925 (not c!103796)) b!1028567))

(assert (= (and b!1028567 res!688218) b!1028569))

(assert (= (and b!1028569 (not res!688220)) b!1028561))

(assert (= (and b!1028561 (not res!688219)) b!1028568))

(assert (=> d!122925 m!946613))

(declare-fun m!947039 () Bool)

(assert (=> d!122925 m!947039))

(assert (=> d!122925 m!946617))

(declare-fun m!947041 () Bool)

(assert (=> b!1028568 m!947041))

(assert (=> b!1028569 m!947041))

(assert (=> b!1028561 m!947041))

(assert (=> b!1028563 m!946613))

(declare-fun m!947043 () Bool)

(assert (=> b!1028563 m!947043))

(assert (=> b!1028563 m!947043))

(declare-fun m!947045 () Bool)

(assert (=> b!1028563 m!947045))

(assert (=> d!122797 d!122925))

(declare-fun d!122927 () Bool)

(declare-fun lt!453023 () (_ BitVec 32))

(declare-fun lt!453022 () (_ BitVec 32))

(assert (=> d!122927 (= lt!453023 (bvmul (bvxor lt!453022 (bvlshr lt!453022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!122927 (= lt!453022 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!122927 (and (bvsge (mask!29832 thiss!1427) #b00000000000000000000000000000000) (let ((res!688221 (let ((h!23047 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91527 (bvmul (bvxor h!23047 (bvlshr h!23047 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91527 (bvlshr x!91527 #b00000000000000000000000000001101)) (mask!29832 thiss!1427)))))) (and (bvslt res!688221 (bvadd (mask!29832 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688221 #b00000000000000000000000000000000))))))

(assert (=> d!122927 (= (toIndex!0 key!909 (mask!29832 thiss!1427)) (bvand (bvxor lt!453023 (bvlshr lt!453023 #b00000000000000000000000000001101)) (mask!29832 thiss!1427)))))

(assert (=> d!122797 d!122927))

(assert (=> d!122797 d!122857))

(declare-fun b!1028570 () Bool)

(declare-fun e!580622 () (_ BitVec 32))

(assert (=> b!1028570 (= e!580622 #b00000000000000000000000000000000)))

(declare-fun bm!43358 () Bool)

(declare-fun call!43361 () (_ BitVec 32))

(assert (=> bm!43358 (= call!43361 (arrayCountValidKeys!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028571 () Bool)

(declare-fun e!580623 () (_ BitVec 32))

(assert (=> b!1028571 (= e!580622 e!580623)))

(declare-fun c!103800 () Bool)

(assert (=> b!1028571 (= c!103800 (validKeyInArray!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!122929 () Bool)

(declare-fun lt!453024 () (_ BitVec 32))

(assert (=> d!122929 (and (bvsge lt!453024 #b00000000000000000000000000000000) (bvsle lt!453024 (bvsub (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!122929 (= lt!453024 e!580622)))

(declare-fun c!103799 () Bool)

(assert (=> d!122929 (= c!103799 (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122929 (and (bvsle #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31620 (_keys!11252 thiss!1427)) (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(assert (=> d!122929 (= (arrayCountValidKeys!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))) lt!453024)))

(declare-fun b!1028572 () Bool)

(assert (=> b!1028572 (= e!580623 (bvadd #b00000000000000000000000000000001 call!43361))))

(declare-fun b!1028573 () Bool)

(assert (=> b!1028573 (= e!580623 call!43361)))

(assert (= (and d!122929 c!103799) b!1028570))

(assert (= (and d!122929 (not c!103799)) b!1028571))

(assert (= (and b!1028571 c!103800) b!1028572))

(assert (= (and b!1028571 (not c!103800)) b!1028573))

(assert (= (or b!1028572 b!1028573) bm!43358))

(declare-fun m!947047 () Bool)

(assert (=> bm!43358 m!947047))

(assert (=> b!1028571 m!946843))

(assert (=> b!1028571 m!946843))

(assert (=> b!1028571 m!946851))

(assert (=> b!1028363 d!122929))

(assert (=> b!1028363 d!122817))

(declare-fun bm!43359 () Bool)

(declare-fun call!43362 () ListLongMap!13747)

(assert (=> bm!43359 (= call!43362 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1028574 () Bool)

(declare-fun e!580628 () ListLongMap!13747)

(declare-fun e!580627 () ListLongMap!13747)

(assert (=> b!1028574 (= e!580628 e!580627)))

(declare-fun c!103803 () Bool)

(assert (=> b!1028574 (= c!103803 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028575 () Bool)

(declare-fun e!580625 () Bool)

(declare-fun e!580629 () Bool)

(assert (=> b!1028575 (= e!580625 e!580629)))

(declare-fun c!103804 () Bool)

(assert (=> b!1028575 (= c!103804 (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028576 () Bool)

(declare-fun e!580630 () Bool)

(assert (=> b!1028576 (= e!580630 e!580625)))

(declare-fun c!103802 () Bool)

(declare-fun e!580624 () Bool)

(assert (=> b!1028576 (= c!103802 e!580624)))

(declare-fun res!688222 () Bool)

(assert (=> b!1028576 (=> (not res!688222) (not e!580624))))

(assert (=> b!1028576 (= res!688222 (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun b!1028577 () Bool)

(declare-fun res!688225 () Bool)

(assert (=> b!1028577 (=> (not res!688225) (not e!580630))))

(declare-fun lt!453025 () ListLongMap!13747)

(assert (=> b!1028577 (= res!688225 (not (contains!5946 lt!453025 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028578 () Bool)

(assert (=> b!1028578 (= e!580624 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028578 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028579 () Bool)

(declare-fun lt!453029 () Unit!33461)

(declare-fun lt!453028 () Unit!33461)

(assert (=> b!1028579 (= lt!453029 lt!453028)))

(declare-fun lt!453026 () V!37275)

(declare-fun lt!453027 () (_ BitVec 64))

(declare-fun lt!453031 () ListLongMap!13747)

(declare-fun lt!453030 () (_ BitVec 64))

(assert (=> b!1028579 (not (contains!5946 (+!3125 lt!453031 (tuple2!15627 lt!453027 lt!453026)) lt!453030))))

(assert (=> b!1028579 (= lt!453028 (addStillNotContains!240 lt!453031 lt!453027 lt!453026 lt!453030))))

(assert (=> b!1028579 (= lt!453030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028579 (= lt!453026 (get!16342 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028579 (= lt!453027 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028579 (= lt!453031 call!43362)))

(assert (=> b!1028579 (= e!580627 (+!3125 call!43362 (tuple2!15627 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000) (get!16342 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028580 () Bool)

(assert (=> b!1028580 (= e!580629 (= lt!453025 (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6102 thiss!1427))))))

(declare-fun b!1028581 () Bool)

(declare-fun e!580626 () Bool)

(assert (=> b!1028581 (= e!580625 e!580626)))

(assert (=> b!1028581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(declare-fun res!688223 () Bool)

(assert (=> b!1028581 (= res!688223 (contains!5946 lt!453025 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028581 (=> (not res!688223) (not e!580626))))

(declare-fun d!122931 () Bool)

(assert (=> d!122931 e!580630))

(declare-fun res!688224 () Bool)

(assert (=> d!122931 (=> (not res!688224) (not e!580630))))

(assert (=> d!122931 (= res!688224 (not (contains!5946 lt!453025 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!122931 (= lt!453025 e!580628)))

(declare-fun c!103801 () Bool)

(assert (=> d!122931 (= c!103801 (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122931 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122931 (= (getCurrentListMapNoExtraKeys!3560 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453025)))

(declare-fun b!1028582 () Bool)

(assert (=> b!1028582 (= e!580629 (isEmpty!928 lt!453025))))

(declare-fun b!1028583 () Bool)

(assert (=> b!1028583 (= e!580627 call!43362)))

(declare-fun b!1028584 () Bool)

(assert (=> b!1028584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> b!1028584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31621 (_values!6125 thiss!1427))))))

(assert (=> b!1028584 (= e!580626 (= (apply!894 lt!453025 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)) (get!16342 (select (arr!31105 (_values!6125 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028585 () Bool)

(assert (=> b!1028585 (= e!580628 (ListLongMap!13748 Nil!21843))))

(assert (= (and d!122931 c!103801) b!1028585))

(assert (= (and d!122931 (not c!103801)) b!1028574))

(assert (= (and b!1028574 c!103803) b!1028579))

(assert (= (and b!1028574 (not c!103803)) b!1028583))

(assert (= (or b!1028579 b!1028583) bm!43359))

(assert (= (and d!122931 res!688224) b!1028577))

(assert (= (and b!1028577 res!688225) b!1028576))

(assert (= (and b!1028576 res!688222) b!1028578))

(assert (= (and b!1028576 c!103802) b!1028581))

(assert (= (and b!1028576 (not c!103802)) b!1028575))

(assert (= (and b!1028581 res!688223) b!1028584))

(assert (= (and b!1028575 c!103804) b!1028580))

(assert (= (and b!1028575 (not c!103804)) b!1028582))

(declare-fun b_lambda!15785 () Bool)

(assert (=> (not b_lambda!15785) (not b!1028579)))

(assert (=> b!1028579 t!30912))

(declare-fun b_and!32859 () Bool)

(assert (= b_and!32857 (and (=> t!30912 result!14109) b_and!32859)))

(declare-fun b_lambda!15787 () Bool)

(assert (=> (not b_lambda!15787) (not b!1028584)))

(assert (=> b!1028584 t!30912))

(declare-fun b_and!32861 () Bool)

(assert (= b_and!32859 (and (=> t!30912 result!14109) b_and!32861)))

(assert (=> b!1028574 m!946655))

(assert (=> b!1028574 m!946655))

(assert (=> b!1028574 m!946681))

(declare-fun m!947049 () Bool)

(assert (=> b!1028582 m!947049))

(declare-fun m!947051 () Bool)

(assert (=> d!122931 m!947051))

(assert (=> d!122931 m!946617))

(assert (=> b!1028584 m!946655))

(declare-fun m!947053 () Bool)

(assert (=> b!1028584 m!947053))

(assert (=> b!1028584 m!946655))

(assert (=> b!1028584 m!946517))

(assert (=> b!1028584 m!946673))

(assert (=> b!1028584 m!946673))

(assert (=> b!1028584 m!946517))

(assert (=> b!1028584 m!946675))

(declare-fun m!947055 () Bool)

(assert (=> b!1028577 m!947055))

(declare-fun m!947057 () Bool)

(assert (=> b!1028579 m!947057))

(declare-fun m!947059 () Bool)

(assert (=> b!1028579 m!947059))

(assert (=> b!1028579 m!946517))

(assert (=> b!1028579 m!946673))

(assert (=> b!1028579 m!946673))

(assert (=> b!1028579 m!946517))

(assert (=> b!1028579 m!946675))

(declare-fun m!947061 () Bool)

(assert (=> b!1028579 m!947061))

(declare-fun m!947063 () Bool)

(assert (=> b!1028579 m!947063))

(assert (=> b!1028579 m!946655))

(assert (=> b!1028579 m!947061))

(assert (=> b!1028581 m!946655))

(assert (=> b!1028581 m!946655))

(declare-fun m!947065 () Bool)

(assert (=> b!1028581 m!947065))

(assert (=> b!1028578 m!946655))

(assert (=> b!1028578 m!946655))

(assert (=> b!1028578 m!946681))

(declare-fun m!947067 () Bool)

(assert (=> bm!43359 m!947067))

(assert (=> b!1028580 m!947067))

(assert (=> bm!43337 d!122931))

(declare-fun d!122933 () Bool)

(assert (=> d!122933 (= (apply!894 lt!452856 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16343 (getValueByKey!587 (toList!6889 lt!452856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30010 () Bool)

(assert (= bs!30010 d!122933))

(assert (=> bs!30010 m!946917))

(assert (=> bs!30010 m!946917))

(declare-fun m!947069 () Bool)

(assert (=> bs!30010 m!947069))

(assert (=> b!1028307 d!122933))

(assert (=> d!122803 d!122857))

(declare-fun d!122935 () Bool)

(declare-fun e!580631 () Bool)

(assert (=> d!122935 e!580631))

(declare-fun res!688226 () Bool)

(assert (=> d!122935 (=> (not res!688226) (not e!580631))))

(declare-fun lt!453033 () ListLongMap!13747)

(assert (=> d!122935 (= res!688226 (contains!5946 lt!453033 (_1!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun lt!453032 () List!21846)

(assert (=> d!122935 (= lt!453033 (ListLongMap!13748 lt!453032))))

(declare-fun lt!453034 () Unit!33461)

(declare-fun lt!453035 () Unit!33461)

(assert (=> d!122935 (= lt!453034 lt!453035)))

(assert (=> d!122935 (= (getValueByKey!587 lt!453032 (_1!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!637 (_2!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!122935 (= lt!453035 (lemmaContainsTupThenGetReturnValue!277 lt!453032 (_1!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!122935 (= lt!453032 (insertStrictlySorted!370 (toList!6889 (ite c!103746 call!43344 (ite c!103744 call!43343 call!43347))) (_1!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!122935 (= (+!3125 (ite c!103746 call!43344 (ite c!103744 call!43343 call!43347)) (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) lt!453033)))

(declare-fun b!1028586 () Bool)

(declare-fun res!688227 () Bool)

(assert (=> b!1028586 (=> (not res!688227) (not e!580631))))

(assert (=> b!1028586 (= res!688227 (= (getValueByKey!587 (toList!6889 lt!453033) (_1!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!637 (_2!7824 (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))))

(declare-fun b!1028587 () Bool)

(assert (=> b!1028587 (= e!580631 (contains!5948 (toList!6889 lt!453033) (ite (or c!103746 c!103744) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (= (and d!122935 res!688226) b!1028586))

(assert (= (and b!1028586 res!688227) b!1028587))

(declare-fun m!947071 () Bool)

(assert (=> d!122935 m!947071))

(declare-fun m!947073 () Bool)

(assert (=> d!122935 m!947073))

(declare-fun m!947075 () Bool)

(assert (=> d!122935 m!947075))

(declare-fun m!947077 () Bool)

(assert (=> d!122935 m!947077))

(declare-fun m!947079 () Bool)

(assert (=> b!1028586 m!947079))

(declare-fun m!947081 () Bool)

(assert (=> b!1028587 m!947081))

(assert (=> bm!43341 d!122935))

(declare-fun d!122937 () Bool)

(declare-fun e!580633 () Bool)

(assert (=> d!122937 e!580633))

(declare-fun res!688228 () Bool)

(assert (=> d!122937 (=> res!688228 e!580633)))

(declare-fun lt!453038 () Bool)

(assert (=> d!122937 (= res!688228 (not lt!453038))))

(declare-fun lt!453039 () Bool)

(assert (=> d!122937 (= lt!453038 lt!453039)))

(declare-fun lt!453036 () Unit!33461)

(declare-fun e!580632 () Unit!33461)

(assert (=> d!122937 (= lt!453036 e!580632)))

(declare-fun c!103805 () Bool)

(assert (=> d!122937 (= c!103805 lt!453039)))

(assert (=> d!122937 (= lt!453039 (containsKey!560 (toList!6889 lt!452881) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (=> d!122937 (= (contains!5946 lt!452881 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) lt!453038)))

(declare-fun b!1028588 () Bool)

(declare-fun lt!453037 () Unit!33461)

(assert (=> b!1028588 (= e!580632 lt!453037)))

(assert (=> b!1028588 (= lt!453037 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452881) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(assert (=> b!1028588 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452881) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028589 () Bool)

(declare-fun Unit!33480 () Unit!33461)

(assert (=> b!1028589 (= e!580632 Unit!33480)))

(declare-fun b!1028590 () Bool)

(assert (=> b!1028590 (= e!580633 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452881) (select (arr!31104 lt!452721) #b00000000000000000000000000000000))))))

(assert (= (and d!122937 c!103805) b!1028588))

(assert (= (and d!122937 (not c!103805)) b!1028589))

(assert (= (and d!122937 (not res!688228)) b!1028590))

(assert (=> d!122937 m!946623))

(declare-fun m!947083 () Bool)

(assert (=> d!122937 m!947083))

(assert (=> b!1028588 m!946623))

(declare-fun m!947085 () Bool)

(assert (=> b!1028588 m!947085))

(assert (=> b!1028588 m!946623))

(assert (=> b!1028588 m!946819))

(assert (=> b!1028588 m!946819))

(declare-fun m!947087 () Bool)

(assert (=> b!1028588 m!947087))

(assert (=> b!1028590 m!946623))

(assert (=> b!1028590 m!946819))

(assert (=> b!1028590 m!946819))

(assert (=> b!1028590 m!947087))

(assert (=> b!1028335 d!122937))

(declare-fun d!122939 () Bool)

(declare-fun e!580635 () Bool)

(assert (=> d!122939 e!580635))

(declare-fun res!688229 () Bool)

(assert (=> d!122939 (=> res!688229 e!580635)))

(declare-fun lt!453042 () Bool)

(assert (=> d!122939 (= res!688229 (not lt!453042))))

(declare-fun lt!453043 () Bool)

(assert (=> d!122939 (= lt!453042 lt!453043)))

(declare-fun lt!453040 () Unit!33461)

(declare-fun e!580634 () Unit!33461)

(assert (=> d!122939 (= lt!453040 e!580634)))

(declare-fun c!103806 () Bool)

(assert (=> d!122939 (= c!103806 lt!453043)))

(assert (=> d!122939 (= lt!453043 (containsKey!560 (toList!6889 lt!452881) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122939 (= (contains!5946 lt!452881 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453042)))

(declare-fun b!1028591 () Bool)

(declare-fun lt!453041 () Unit!33461)

(assert (=> b!1028591 (= e!580634 lt!453041)))

(assert (=> b!1028591 (= lt!453041 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452881) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028591 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452881) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028592 () Bool)

(declare-fun Unit!33481 () Unit!33461)

(assert (=> b!1028592 (= e!580634 Unit!33481)))

(declare-fun b!1028593 () Bool)

(assert (=> b!1028593 (= e!580635 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122939 c!103806) b!1028591))

(assert (= (and d!122939 (not c!103806)) b!1028592))

(assert (= (and d!122939 (not res!688229)) b!1028593))

(declare-fun m!947089 () Bool)

(assert (=> d!122939 m!947089))

(declare-fun m!947091 () Bool)

(assert (=> b!1028591 m!947091))

(assert (=> b!1028591 m!946791))

(assert (=> b!1028591 m!946791))

(declare-fun m!947093 () Bool)

(assert (=> b!1028591 m!947093))

(assert (=> b!1028593 m!946791))

(assert (=> b!1028593 m!946791))

(assert (=> b!1028593 m!947093))

(assert (=> bm!43342 d!122939))

(declare-fun d!122941 () Bool)

(assert (=> d!122941 (= (-!481 (getCurrentListMap!3856 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) key!909) (getCurrentListMap!3856 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(assert (=> d!122941 true))

(declare-fun _$9!38 () Unit!33461)

(assert (=> d!122941 (= (choose!1692 (_keys!11252 thiss!1427) (_values!6125 thiss!1427) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) (index!41040 lt!452719) key!909 (defaultEntry!6102 thiss!1427)) _$9!38)))

(declare-fun b_lambda!15789 () Bool)

(assert (=> (not b_lambda!15789) (not d!122941)))

(assert (=> d!122941 t!30912))

(declare-fun b_and!32863 () Bool)

(assert (= b_and!32861 (and (=> t!30912 result!14109) b_and!32863)))

(assert (=> d!122941 m!946503))

(assert (=> d!122941 m!946517))

(assert (=> d!122941 m!946515))

(assert (=> d!122941 m!946503))

(assert (=> d!122941 m!946505))

(assert (=> d!122941 m!946513))

(assert (=> d!122941 m!946777))

(assert (=> d!122823 d!122941))

(assert (=> d!122823 d!122857))

(assert (=> b!1028381 d!122805))

(assert (=> b!1028381 d!122803))

(declare-fun b!1028594 () Bool)

(declare-fun e!580642 () Bool)

(declare-fun lt!453054 () ListLongMap!13747)

(assert (=> b!1028594 (= e!580642 (= (apply!894 lt!453054 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5938 thiss!1427)))))

(declare-fun b!1028595 () Bool)

(declare-fun e!580643 () ListLongMap!13747)

(declare-fun call!43365 () ListLongMap!13747)

(assert (=> b!1028595 (= e!580643 (+!3125 call!43365 (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))

(declare-fun bm!43360 () Bool)

(declare-fun call!43367 () ListLongMap!13747)

(declare-fun call!43363 () ListLongMap!13747)

(assert (=> bm!43360 (= call!43367 call!43363)))

(declare-fun b!1028596 () Bool)

(declare-fun res!688235 () Bool)

(declare-fun e!580638 () Bool)

(assert (=> b!1028596 (=> (not res!688235) (not e!580638))))

(declare-fun e!580636 () Bool)

(assert (=> b!1028596 (= res!688235 e!580636)))

(declare-fun res!688231 () Bool)

(assert (=> b!1028596 (=> res!688231 e!580636)))

(declare-fun e!580647 () Bool)

(assert (=> b!1028596 (= res!688231 (not e!580647))))

(declare-fun res!688233 () Bool)

(assert (=> b!1028596 (=> (not res!688233) (not e!580647))))

(assert (=> b!1028596 (= res!688233 (bvslt #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(declare-fun b!1028597 () Bool)

(declare-fun res!688230 () Bool)

(assert (=> b!1028597 (=> (not res!688230) (not e!580638))))

(declare-fun e!580639 () Bool)

(assert (=> b!1028597 (= res!688230 e!580639)))

(declare-fun c!103812 () Bool)

(assert (=> b!1028597 (= c!103812 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028598 () Bool)

(declare-fun e!580641 () Bool)

(assert (=> b!1028598 (= e!580638 e!580641)))

(declare-fun c!103811 () Bool)

(assert (=> b!1028598 (= c!103811 (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!103807 () Bool)

(declare-fun bm!43361 () Bool)

(declare-fun c!103809 () Bool)

(declare-fun call!43364 () ListLongMap!13747)

(assert (=> bm!43361 (= call!43365 (+!3125 (ite c!103809 call!43364 (ite c!103807 call!43363 call!43367)) (ite (or c!103809 c!103807) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(declare-fun bm!43362 () Bool)

(declare-fun call!43369 () Bool)

(assert (=> bm!43362 (= call!43369 (contains!5946 lt!453054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028599 () Bool)

(assert (=> b!1028599 (= e!580639 (not call!43369))))

(declare-fun b!1028600 () Bool)

(assert (=> b!1028600 (= e!580641 e!580642)))

(declare-fun res!688237 () Bool)

(declare-fun call!43368 () Bool)

(assert (=> b!1028600 (= res!688237 call!43368)))

(assert (=> b!1028600 (=> (not res!688237) (not e!580642))))

(declare-fun d!122943 () Bool)

(assert (=> d!122943 e!580638))

(declare-fun res!688238 () Bool)

(assert (=> d!122943 (=> (not res!688238) (not e!580638))))

(assert (=> d!122943 (= res!688238 (or (bvsge #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))))

(declare-fun lt!453050 () ListLongMap!13747)

(assert (=> d!122943 (= lt!453054 lt!453050)))

(declare-fun lt!453048 () Unit!33461)

(declare-fun e!580644 () Unit!33461)

(assert (=> d!122943 (= lt!453048 e!580644)))

(declare-fun c!103810 () Bool)

(declare-fun e!580645 () Bool)

(assert (=> d!122943 (= c!103810 e!580645)))

(declare-fun res!688234 () Bool)

(assert (=> d!122943 (=> (not res!688234) (not e!580645))))

(assert (=> d!122943 (= res!688234 (bvslt #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(assert (=> d!122943 (= lt!453050 e!580643)))

(assert (=> d!122943 (= c!103809 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122943 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122943 (= (getCurrentListMap!3856 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)) lt!453054)))

(declare-fun b!1028601 () Bool)

(assert (=> b!1028601 (= e!580647 (validKeyInArray!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028602 () Bool)

(declare-fun e!580648 () Bool)

(assert (=> b!1028602 (= e!580639 e!580648)))

(declare-fun res!688232 () Bool)

(assert (=> b!1028602 (= res!688232 call!43369)))

(assert (=> b!1028602 (=> (not res!688232) (not e!580648))))

(declare-fun b!1028603 () Bool)

(assert (=> b!1028603 (= e!580645 (validKeyInArray!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028604 () Bool)

(declare-fun c!103808 () Bool)

(assert (=> b!1028604 (= c!103808 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580646 () ListLongMap!13747)

(declare-fun e!580640 () ListLongMap!13747)

(assert (=> b!1028604 (= e!580646 e!580640)))

(declare-fun b!1028605 () Bool)

(declare-fun call!43366 () ListLongMap!13747)

(assert (=> b!1028605 (= e!580640 call!43366)))

(declare-fun bm!43363 () Bool)

(assert (=> bm!43363 (= call!43366 call!43365)))

(declare-fun bm!43364 () Bool)

(assert (=> bm!43364 (= call!43364 (getCurrentListMapNoExtraKeys!3560 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun b!1028606 () Bool)

(assert (=> b!1028606 (= e!580640 call!43367)))

(declare-fun b!1028607 () Bool)

(assert (=> b!1028607 (= e!580648 (= (apply!894 lt!453054 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5938 thiss!1427)))))

(declare-fun b!1028608 () Bool)

(assert (=> b!1028608 (= e!580646 call!43366)))

(declare-fun b!1028609 () Bool)

(assert (=> b!1028609 (= e!580643 e!580646)))

(assert (=> b!1028609 (= c!103807 (and (not (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5834 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43365 () Bool)

(assert (=> bm!43365 (= call!43363 call!43364)))

(declare-fun b!1028610 () Bool)

(declare-fun e!580637 () Bool)

(assert (=> b!1028610 (= e!580637 (= (apply!894 lt!453054 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)) (get!16342 (select (arr!31105 (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31621 (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))))))))

(assert (=> b!1028610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(declare-fun b!1028611 () Bool)

(assert (=> b!1028611 (= e!580641 (not call!43368))))

(declare-fun bm!43366 () Bool)

(assert (=> bm!43366 (= call!43368 (contains!5946 lt!453054 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028612 () Bool)

(declare-fun lt!453046 () Unit!33461)

(assert (=> b!1028612 (= e!580644 lt!453046)))

(declare-fun lt!453064 () ListLongMap!13747)

(assert (=> b!1028612 (= lt!453064 (getCurrentListMapNoExtraKeys!3560 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453056 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453056 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453059 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453059 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453045 () Unit!33461)

(assert (=> b!1028612 (= lt!453045 (addStillContains!613 lt!453064 lt!453056 (zeroValue!5938 thiss!1427) lt!453059))))

(assert (=> b!1028612 (contains!5946 (+!3125 lt!453064 (tuple2!15627 lt!453056 (zeroValue!5938 thiss!1427))) lt!453059)))

(declare-fun lt!453047 () Unit!33461)

(assert (=> b!1028612 (= lt!453047 lt!453045)))

(declare-fun lt!453057 () ListLongMap!13747)

(assert (=> b!1028612 (= lt!453057 (getCurrentListMapNoExtraKeys!3560 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453065 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453065 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453044 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453044 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453061 () Unit!33461)

(assert (=> b!1028612 (= lt!453061 (addApplyDifferent!469 lt!453057 lt!453065 (minValue!5938 thiss!1427) lt!453044))))

(assert (=> b!1028612 (= (apply!894 (+!3125 lt!453057 (tuple2!15627 lt!453065 (minValue!5938 thiss!1427))) lt!453044) (apply!894 lt!453057 lt!453044))))

(declare-fun lt!453062 () Unit!33461)

(assert (=> b!1028612 (= lt!453062 lt!453061)))

(declare-fun lt!453063 () ListLongMap!13747)

(assert (=> b!1028612 (= lt!453063 (getCurrentListMapNoExtraKeys!3560 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453053 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453060 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453060 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453049 () Unit!33461)

(assert (=> b!1028612 (= lt!453049 (addApplyDifferent!469 lt!453063 lt!453053 (zeroValue!5938 thiss!1427) lt!453060))))

(assert (=> b!1028612 (= (apply!894 (+!3125 lt!453063 (tuple2!15627 lt!453053 (zeroValue!5938 thiss!1427))) lt!453060) (apply!894 lt!453063 lt!453060))))

(declare-fun lt!453051 () Unit!33461)

(assert (=> b!1028612 (= lt!453051 lt!453049)))

(declare-fun lt!453055 () ListLongMap!13747)

(assert (=> b!1028612 (= lt!453055 (getCurrentListMapNoExtraKeys!3560 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (array!64598 (store (arr!31105 (_values!6125 thiss!1427)) (index!41040 lt!452719) (ValueCellFull!11447 (dynLambda!1943 (defaultEntry!6102 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31621 (_values!6125 thiss!1427))) (mask!29832 thiss!1427) (extraKeys!5834 thiss!1427) (zeroValue!5938 thiss!1427) (minValue!5938 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6102 thiss!1427)))))

(declare-fun lt!453052 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453058 () (_ BitVec 64))

(assert (=> b!1028612 (= lt!453058 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1028612 (= lt!453046 (addApplyDifferent!469 lt!453055 lt!453052 (minValue!5938 thiss!1427) lt!453058))))

(assert (=> b!1028612 (= (apply!894 (+!3125 lt!453055 (tuple2!15627 lt!453052 (minValue!5938 thiss!1427))) lt!453058) (apply!894 lt!453055 lt!453058))))

(declare-fun b!1028613 () Bool)

(declare-fun Unit!33482 () Unit!33461)

(assert (=> b!1028613 (= e!580644 Unit!33482)))

(declare-fun b!1028614 () Bool)

(assert (=> b!1028614 (= e!580636 e!580637)))

(declare-fun res!688236 () Bool)

(assert (=> b!1028614 (=> (not res!688236) (not e!580637))))

(assert (=> b!1028614 (= res!688236 (contains!5946 lt!453054 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1028614 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(assert (= (and d!122943 c!103809) b!1028595))

(assert (= (and d!122943 (not c!103809)) b!1028609))

(assert (= (and b!1028609 c!103807) b!1028608))

(assert (= (and b!1028609 (not c!103807)) b!1028604))

(assert (= (and b!1028604 c!103808) b!1028605))

(assert (= (and b!1028604 (not c!103808)) b!1028606))

(assert (= (or b!1028605 b!1028606) bm!43360))

(assert (= (or b!1028608 bm!43360) bm!43365))

(assert (= (or b!1028608 b!1028605) bm!43363))

(assert (= (or b!1028595 bm!43365) bm!43364))

(assert (= (or b!1028595 bm!43363) bm!43361))

(assert (= (and d!122943 res!688234) b!1028603))

(assert (= (and d!122943 c!103810) b!1028612))

(assert (= (and d!122943 (not c!103810)) b!1028613))

(assert (= (and d!122943 res!688238) b!1028596))

(assert (= (and b!1028596 res!688233) b!1028601))

(assert (= (and b!1028596 (not res!688231)) b!1028614))

(assert (= (and b!1028614 res!688236) b!1028610))

(assert (= (and b!1028596 res!688235) b!1028597))

(assert (= (and b!1028597 c!103812) b!1028602))

(assert (= (and b!1028597 (not c!103812)) b!1028599))

(assert (= (and b!1028602 res!688232) b!1028607))

(assert (= (or b!1028602 b!1028599) bm!43362))

(assert (= (and b!1028597 res!688230) b!1028598))

(assert (= (and b!1028598 c!103811) b!1028600))

(assert (= (and b!1028598 (not c!103811)) b!1028611))

(assert (= (and b!1028600 res!688237) b!1028594))

(assert (= (or b!1028600 b!1028611) bm!43366))

(declare-fun b_lambda!15791 () Bool)

(assert (=> (not b_lambda!15791) (not b!1028610)))

(assert (=> b!1028610 t!30912))

(declare-fun b_and!32865 () Bool)

(assert (= b_and!32863 (and (=> t!30912 result!14109) b_and!32865)))

(declare-fun m!947095 () Bool)

(assert (=> b!1028612 m!947095))

(declare-fun m!947097 () Bool)

(assert (=> b!1028612 m!947097))

(declare-fun m!947099 () Bool)

(assert (=> b!1028612 m!947099))

(declare-fun m!947101 () Bool)

(assert (=> b!1028612 m!947101))

(declare-fun m!947103 () Bool)

(assert (=> b!1028612 m!947103))

(declare-fun m!947105 () Bool)

(assert (=> b!1028612 m!947105))

(declare-fun m!947107 () Bool)

(assert (=> b!1028612 m!947107))

(declare-fun m!947109 () Bool)

(assert (=> b!1028612 m!947109))

(declare-fun m!947111 () Bool)

(assert (=> b!1028612 m!947111))

(assert (=> b!1028612 m!946843))

(declare-fun m!947113 () Bool)

(assert (=> b!1028612 m!947113))

(declare-fun m!947115 () Bool)

(assert (=> b!1028612 m!947115))

(assert (=> b!1028612 m!947113))

(assert (=> b!1028612 m!947097))

(declare-fun m!947117 () Bool)

(assert (=> b!1028612 m!947117))

(declare-fun m!947119 () Bool)

(assert (=> b!1028612 m!947119))

(declare-fun m!947121 () Bool)

(assert (=> b!1028612 m!947121))

(declare-fun m!947123 () Bool)

(assert (=> b!1028612 m!947123))

(assert (=> b!1028612 m!947119))

(assert (=> b!1028612 m!947109))

(declare-fun m!947125 () Bool)

(assert (=> b!1028612 m!947125))

(declare-fun m!947127 () Bool)

(assert (=> b!1028594 m!947127))

(declare-fun m!947129 () Bool)

(assert (=> b!1028610 m!947129))

(assert (=> b!1028610 m!946843))

(assert (=> b!1028610 m!947129))

(assert (=> b!1028610 m!946517))

(declare-fun m!947131 () Bool)

(assert (=> b!1028610 m!947131))

(assert (=> b!1028610 m!946843))

(declare-fun m!947133 () Bool)

(assert (=> b!1028610 m!947133))

(assert (=> b!1028610 m!946517))

(declare-fun m!947135 () Bool)

(assert (=> b!1028607 m!947135))

(assert (=> b!1028601 m!946843))

(assert (=> b!1028601 m!946843))

(assert (=> b!1028601 m!946851))

(assert (=> b!1028603 m!946843))

(assert (=> b!1028603 m!946843))

(assert (=> b!1028603 m!946851))

(declare-fun m!947137 () Bool)

(assert (=> bm!43362 m!947137))

(declare-fun m!947139 () Bool)

(assert (=> bm!43361 m!947139))

(assert (=> b!1028614 m!946843))

(assert (=> b!1028614 m!946843))

(declare-fun m!947141 () Bool)

(assert (=> b!1028614 m!947141))

(declare-fun m!947143 () Bool)

(assert (=> b!1028595 m!947143))

(declare-fun m!947145 () Bool)

(assert (=> bm!43366 m!947145))

(assert (=> bm!43364 m!947107))

(assert (=> d!122943 m!946617))

(assert (=> b!1028381 d!122943))

(declare-fun d!122945 () Bool)

(assert (=> d!122945 (arrayContainsKey!0 lt!452721 lt!452796 #b00000000000000000000000000000000)))

(declare-fun lt!453068 () Unit!33461)

(declare-fun choose!13 (array!64595 (_ BitVec 64) (_ BitVec 32)) Unit!33461)

(assert (=> d!122945 (= lt!453068 (choose!13 lt!452721 lt!452796 #b00000000000000000000000000000000))))

(assert (=> d!122945 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!122945 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452721 lt!452796 #b00000000000000000000000000000000) lt!453068)))

(declare-fun bs!30011 () Bool)

(assert (= bs!30011 d!122945))

(assert (=> bs!30011 m!946627))

(declare-fun m!947147 () Bool)

(assert (=> bs!30011 m!947147))

(assert (=> b!1028236 d!122945))

(declare-fun d!122947 () Bool)

(declare-fun res!688239 () Bool)

(declare-fun e!580649 () Bool)

(assert (=> d!122947 (=> res!688239 e!580649)))

(assert (=> d!122947 (= res!688239 (= (select (arr!31104 lt!452721) #b00000000000000000000000000000000) lt!452796))))

(assert (=> d!122947 (= (arrayContainsKey!0 lt!452721 lt!452796 #b00000000000000000000000000000000) e!580649)))

(declare-fun b!1028615 () Bool)

(declare-fun e!580650 () Bool)

(assert (=> b!1028615 (= e!580649 e!580650)))

(declare-fun res!688240 () Bool)

(assert (=> b!1028615 (=> (not res!688240) (not e!580650))))

(assert (=> b!1028615 (= res!688240 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 lt!452721)))))

(declare-fun b!1028616 () Bool)

(assert (=> b!1028616 (= e!580650 (arrayContainsKey!0 lt!452721 lt!452796 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122947 (not res!688239)) b!1028615))

(assert (= (and b!1028615 res!688240) b!1028616))

(assert (=> d!122947 m!946623))

(declare-fun m!947149 () Bool)

(assert (=> b!1028616 m!947149))

(assert (=> b!1028236 d!122947))

(declare-fun b!1028629 () Bool)

(declare-fun c!103820 () Bool)

(declare-fun lt!453075 () (_ BitVec 64))

(assert (=> b!1028629 (= c!103820 (= lt!453075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580659 () SeekEntryResult!9667)

(declare-fun e!580657 () SeekEntryResult!9667)

(assert (=> b!1028629 (= e!580659 e!580657)))

(declare-fun b!1028630 () Bool)

(declare-fun e!580658 () SeekEntryResult!9667)

(assert (=> b!1028630 (= e!580658 e!580659)))

(declare-fun lt!453076 () SeekEntryResult!9667)

(assert (=> b!1028630 (= lt!453075 (select (arr!31104 lt!452721) (index!41041 lt!453076)))))

(declare-fun c!103821 () Bool)

(assert (=> b!1028630 (= c!103821 (= lt!453075 (select (arr!31104 lt!452721) #b00000000000000000000000000000000)))))

(declare-fun b!1028631 () Bool)

(assert (=> b!1028631 (= e!580658 Undefined!9667)))

(declare-fun b!1028632 () Bool)

(assert (=> b!1028632 (= e!580657 (MissingZero!9667 (index!41041 lt!453076)))))

(declare-fun b!1028633 () Bool)

(assert (=> b!1028633 (= e!580659 (Found!9667 (index!41041 lt!453076)))))

(declare-fun b!1028634 () Bool)

(assert (=> b!1028634 (= e!580657 (seekKeyOrZeroReturnVacant!0 (x!91492 lt!453076) (index!41041 lt!453076) (index!41041 lt!453076) (select (arr!31104 lt!452721) #b00000000000000000000000000000000) lt!452721 (mask!29832 thiss!1427)))))

(declare-fun d!122949 () Bool)

(declare-fun lt!453077 () SeekEntryResult!9667)

(assert (=> d!122949 (and (or ((_ is Undefined!9667) lt!453077) (not ((_ is Found!9667) lt!453077)) (and (bvsge (index!41040 lt!453077) #b00000000000000000000000000000000) (bvslt (index!41040 lt!453077) (size!31620 lt!452721)))) (or ((_ is Undefined!9667) lt!453077) ((_ is Found!9667) lt!453077) (not ((_ is MissingZero!9667) lt!453077)) (and (bvsge (index!41039 lt!453077) #b00000000000000000000000000000000) (bvslt (index!41039 lt!453077) (size!31620 lt!452721)))) (or ((_ is Undefined!9667) lt!453077) ((_ is Found!9667) lt!453077) ((_ is MissingZero!9667) lt!453077) (not ((_ is MissingVacant!9667) lt!453077)) (and (bvsge (index!41042 lt!453077) #b00000000000000000000000000000000) (bvslt (index!41042 lt!453077) (size!31620 lt!452721)))) (or ((_ is Undefined!9667) lt!453077) (ite ((_ is Found!9667) lt!453077) (= (select (arr!31104 lt!452721) (index!41040 lt!453077)) (select (arr!31104 lt!452721) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9667) lt!453077) (= (select (arr!31104 lt!452721) (index!41039 lt!453077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9667) lt!453077) (= (select (arr!31104 lt!452721) (index!41042 lt!453077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!122949 (= lt!453077 e!580658)))

(declare-fun c!103819 () Bool)

(assert (=> d!122949 (= c!103819 (and ((_ is Intermediate!9667) lt!453076) (undefined!10479 lt!453076)))))

(assert (=> d!122949 (= lt!453076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) (mask!29832 thiss!1427)) (select (arr!31104 lt!452721) #b00000000000000000000000000000000) lt!452721 (mask!29832 thiss!1427)))))

(assert (=> d!122949 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122949 (= (seekEntryOrOpen!0 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) lt!452721 (mask!29832 thiss!1427)) lt!453077)))

(assert (= (and d!122949 c!103819) b!1028631))

(assert (= (and d!122949 (not c!103819)) b!1028630))

(assert (= (and b!1028630 c!103821) b!1028633))

(assert (= (and b!1028630 (not c!103821)) b!1028629))

(assert (= (and b!1028629 c!103820) b!1028632))

(assert (= (and b!1028629 (not c!103820)) b!1028634))

(declare-fun m!947151 () Bool)

(assert (=> b!1028630 m!947151))

(assert (=> b!1028634 m!946623))

(declare-fun m!947153 () Bool)

(assert (=> b!1028634 m!947153))

(assert (=> d!122949 m!946617))

(declare-fun m!947155 () Bool)

(assert (=> d!122949 m!947155))

(assert (=> d!122949 m!946623))

(declare-fun m!947157 () Bool)

(assert (=> d!122949 m!947157))

(assert (=> d!122949 m!946623))

(assert (=> d!122949 m!947155))

(declare-fun m!947159 () Bool)

(assert (=> d!122949 m!947159))

(declare-fun m!947161 () Bool)

(assert (=> d!122949 m!947161))

(declare-fun m!947163 () Bool)

(assert (=> d!122949 m!947163))

(assert (=> b!1028236 d!122949))

(declare-fun d!122951 () Bool)

(assert (=> d!122951 (= (apply!894 lt!452856 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16343 (getValueByKey!587 (toList!6889 lt!452856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30012 () Bool)

(assert (= bs!30012 d!122951))

(assert (=> bs!30012 m!946889))

(assert (=> bs!30012 m!946889))

(declare-fun m!947165 () Bool)

(assert (=> bs!30012 m!947165))

(assert (=> b!1028294 d!122951))

(assert (=> b!1028391 d!122817))

(declare-fun b!1028647 () Bool)

(declare-fun e!580667 () SeekEntryResult!9667)

(assert (=> b!1028647 (= e!580667 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91492 lt!452787) #b00000000000000000000000000000001) (nextIndex!0 (index!41041 lt!452787) (x!91492 lt!452787) (mask!29832 thiss!1427)) (index!41041 lt!452787) key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)))))

(declare-fun b!1028648 () Bool)

(declare-fun e!580666 () SeekEntryResult!9667)

(assert (=> b!1028648 (= e!580666 (Found!9667 (index!41041 lt!452787)))))

(declare-fun lt!453083 () SeekEntryResult!9667)

(declare-fun d!122953 () Bool)

(assert (=> d!122953 (and (or ((_ is Undefined!9667) lt!453083) (not ((_ is Found!9667) lt!453083)) (and (bvsge (index!41040 lt!453083) #b00000000000000000000000000000000) (bvslt (index!41040 lt!453083) (size!31620 (_keys!11252 thiss!1427))))) (or ((_ is Undefined!9667) lt!453083) ((_ is Found!9667) lt!453083) (not ((_ is MissingVacant!9667) lt!453083)) (not (= (index!41042 lt!453083) (index!41041 lt!452787))) (and (bvsge (index!41042 lt!453083) #b00000000000000000000000000000000) (bvslt (index!41042 lt!453083) (size!31620 (_keys!11252 thiss!1427))))) (or ((_ is Undefined!9667) lt!453083) (ite ((_ is Found!9667) lt!453083) (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!453083)) key!909) (and ((_ is MissingVacant!9667) lt!453083) (= (index!41042 lt!453083) (index!41041 lt!452787)) (= (select (arr!31104 (_keys!11252 thiss!1427)) (index!41042 lt!453083)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!580668 () SeekEntryResult!9667)

(assert (=> d!122953 (= lt!453083 e!580668)))

(declare-fun c!103828 () Bool)

(assert (=> d!122953 (= c!103828 (bvsge (x!91492 lt!452787) #b01111111111111111111111111111110))))

(declare-fun lt!453082 () (_ BitVec 64))

(assert (=> d!122953 (= lt!453082 (select (arr!31104 (_keys!11252 thiss!1427)) (index!41041 lt!452787)))))

(assert (=> d!122953 (validMask!0 (mask!29832 thiss!1427))))

(assert (=> d!122953 (= (seekKeyOrZeroReturnVacant!0 (x!91492 lt!452787) (index!41041 lt!452787) (index!41041 lt!452787) key!909 (_keys!11252 thiss!1427) (mask!29832 thiss!1427)) lt!453083)))

(declare-fun b!1028649 () Bool)

(assert (=> b!1028649 (= e!580668 e!580666)))

(declare-fun c!103829 () Bool)

(assert (=> b!1028649 (= c!103829 (= lt!453082 key!909))))

(declare-fun b!1028650 () Bool)

(assert (=> b!1028650 (= e!580667 (MissingVacant!9667 (index!41041 lt!452787)))))

(declare-fun b!1028651 () Bool)

(declare-fun c!103830 () Bool)

(assert (=> b!1028651 (= c!103830 (= lt!453082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028651 (= e!580666 e!580667)))

(declare-fun b!1028652 () Bool)

(assert (=> b!1028652 (= e!580668 Undefined!9667)))

(assert (= (and d!122953 c!103828) b!1028652))

(assert (= (and d!122953 (not c!103828)) b!1028649))

(assert (= (and b!1028649 c!103829) b!1028648))

(assert (= (and b!1028649 (not c!103829)) b!1028651))

(assert (= (and b!1028651 c!103830) b!1028650))

(assert (= (and b!1028651 (not c!103830)) b!1028647))

(declare-fun m!947167 () Bool)

(assert (=> b!1028647 m!947167))

(assert (=> b!1028647 m!947167))

(declare-fun m!947169 () Bool)

(assert (=> b!1028647 m!947169))

(declare-fun m!947171 () Bool)

(assert (=> d!122953 m!947171))

(declare-fun m!947173 () Bool)

(assert (=> d!122953 m!947173))

(assert (=> d!122953 m!946619))

(assert (=> d!122953 m!946617))

(assert (=> b!1028224 d!122953))

(assert (=> b!1028238 d!122833))

(declare-fun b!1028653 () Bool)

(declare-fun e!580669 () Bool)

(declare-fun e!580671 () Bool)

(assert (=> b!1028653 (= e!580669 e!580671)))

(declare-fun lt!453084 () (_ BitVec 64))

(assert (=> b!1028653 (= lt!453084 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!453086 () Unit!33461)

(assert (=> b!1028653 (= lt!453086 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452721 lt!453084 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1028653 (arrayContainsKey!0 lt!452721 lt!453084 #b00000000000000000000000000000000)))

(declare-fun lt!453085 () Unit!33461)

(assert (=> b!1028653 (= lt!453085 lt!453086)))

(declare-fun res!688242 () Bool)

(assert (=> b!1028653 (= res!688242 (= (seekEntryOrOpen!0 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!452721 (mask!29832 thiss!1427)) (Found!9667 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1028653 (=> (not res!688242) (not e!580671))))

(declare-fun b!1028654 () Bool)

(declare-fun call!43370 () Bool)

(assert (=> b!1028654 (= e!580669 call!43370)))

(declare-fun b!1028655 () Bool)

(declare-fun e!580670 () Bool)

(assert (=> b!1028655 (= e!580670 e!580669)))

(declare-fun c!103831 () Bool)

(assert (=> b!1028655 (= c!103831 (validKeyInArray!0 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122955 () Bool)

(declare-fun res!688241 () Bool)

(assert (=> d!122955 (=> res!688241 e!580670)))

(assert (=> d!122955 (= res!688241 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 lt!452721)))))

(assert (=> d!122955 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452721 (mask!29832 thiss!1427)) e!580670)))

(declare-fun b!1028656 () Bool)

(assert (=> b!1028656 (= e!580671 call!43370)))

(declare-fun bm!43367 () Bool)

(assert (=> bm!43367 (= call!43370 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!452721 (mask!29832 thiss!1427)))))

(assert (= (and d!122955 (not res!688241)) b!1028655))

(assert (= (and b!1028655 c!103831) b!1028653))

(assert (= (and b!1028655 (not c!103831)) b!1028654))

(assert (= (and b!1028653 res!688242) b!1028656))

(assert (= (or b!1028656 b!1028654) bm!43367))

(assert (=> b!1028653 m!946797))

(declare-fun m!947175 () Bool)

(assert (=> b!1028653 m!947175))

(declare-fun m!947177 () Bool)

(assert (=> b!1028653 m!947177))

(assert (=> b!1028653 m!946797))

(declare-fun m!947179 () Bool)

(assert (=> b!1028653 m!947179))

(assert (=> b!1028655 m!946797))

(assert (=> b!1028655 m!946797))

(assert (=> b!1028655 m!946799))

(declare-fun m!947181 () Bool)

(assert (=> bm!43367 m!947181))

(assert (=> bm!43315 d!122955))

(declare-fun bm!43368 () Bool)

(declare-fun call!43371 () Bool)

(declare-fun c!103832 () Bool)

(assert (=> bm!43368 (= call!43371 (arrayNoDuplicates!0 (_keys!11252 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103832 (Cons!21843 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000) Nil!21844) Nil!21844)))))

(declare-fun b!1028657 () Bool)

(declare-fun e!580674 () Bool)

(declare-fun e!580672 () Bool)

(assert (=> b!1028657 (= e!580674 e!580672)))

(declare-fun res!688244 () Bool)

(assert (=> b!1028657 (=> (not res!688244) (not e!580672))))

(declare-fun e!580673 () Bool)

(assert (=> b!1028657 (= res!688244 (not e!580673))))

(declare-fun res!688245 () Bool)

(assert (=> b!1028657 (=> (not res!688245) (not e!580673))))

(assert (=> b!1028657 (= res!688245 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122957 () Bool)

(declare-fun res!688243 () Bool)

(assert (=> d!122957 (=> res!688243 e!580674)))

(assert (=> d!122957 (= res!688243 (bvsge #b00000000000000000000000000000000 (size!31620 (_keys!11252 thiss!1427))))))

(assert (=> d!122957 (= (arrayNoDuplicates!0 (_keys!11252 thiss!1427) #b00000000000000000000000000000000 Nil!21844) e!580674)))

(declare-fun b!1028658 () Bool)

(declare-fun e!580675 () Bool)

(assert (=> b!1028658 (= e!580672 e!580675)))

(assert (=> b!1028658 (= c!103832 (validKeyInArray!0 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028659 () Bool)

(assert (=> b!1028659 (= e!580675 call!43371)))

(declare-fun b!1028660 () Bool)

(assert (=> b!1028660 (= e!580675 call!43371)))

(declare-fun b!1028661 () Bool)

(assert (=> b!1028661 (= e!580673 (contains!5947 Nil!21844 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122957 (not res!688243)) b!1028657))

(assert (= (and b!1028657 res!688245) b!1028661))

(assert (= (and b!1028657 res!688244) b!1028658))

(assert (= (and b!1028658 c!103832) b!1028659))

(assert (= (and b!1028658 (not c!103832)) b!1028660))

(assert (= (or b!1028659 b!1028660) bm!43368))

(assert (=> bm!43368 m!946655))

(declare-fun m!947183 () Bool)

(assert (=> bm!43368 m!947183))

(assert (=> b!1028657 m!946655))

(assert (=> b!1028657 m!946655))

(assert (=> b!1028657 m!946681))

(assert (=> b!1028658 m!946655))

(assert (=> b!1028658 m!946655))

(assert (=> b!1028658 m!946681))

(assert (=> b!1028661 m!946655))

(assert (=> b!1028661 m!946655))

(declare-fun m!947185 () Bool)

(assert (=> b!1028661 m!947185))

(assert (=> b!1028393 d!122957))

(declare-fun d!122959 () Bool)

(assert (=> d!122959 (= (apply!894 (+!3125 lt!452865 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))) lt!452862) (get!16343 (getValueByKey!587 (toList!6889 (+!3125 lt!452865 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))) lt!452862)))))

(declare-fun bs!30013 () Bool)

(assert (= bs!30013 d!122959))

(declare-fun m!947187 () Bool)

(assert (=> bs!30013 m!947187))

(assert (=> bs!30013 m!947187))

(declare-fun m!947189 () Bool)

(assert (=> bs!30013 m!947189))

(assert (=> b!1028312 d!122959))

(assert (=> b!1028312 d!122931))

(declare-fun d!122961 () Bool)

(assert (=> d!122961 (= (apply!894 (+!3125 lt!452865 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))) lt!452862) (apply!894 lt!452865 lt!452862))))

(declare-fun lt!453087 () Unit!33461)

(assert (=> d!122961 (= lt!453087 (choose!1694 lt!452865 lt!452855 (zeroValue!5938 thiss!1427) lt!452862))))

(declare-fun e!580676 () Bool)

(assert (=> d!122961 e!580676))

(declare-fun res!688246 () Bool)

(assert (=> d!122961 (=> (not res!688246) (not e!580676))))

(assert (=> d!122961 (= res!688246 (contains!5946 lt!452865 lt!452862))))

(assert (=> d!122961 (= (addApplyDifferent!469 lt!452865 lt!452855 (zeroValue!5938 thiss!1427) lt!452862) lt!453087)))

(declare-fun b!1028662 () Bool)

(assert (=> b!1028662 (= e!580676 (not (= lt!452862 lt!452855)))))

(assert (= (and d!122961 res!688246) b!1028662))

(declare-fun m!947191 () Bool)

(assert (=> d!122961 m!947191))

(declare-fun m!947193 () Bool)

(assert (=> d!122961 m!947193))

(assert (=> d!122961 m!946651))

(assert (=> d!122961 m!946669))

(assert (=> d!122961 m!946651))

(assert (=> d!122961 m!946643))

(assert (=> b!1028312 d!122961))

(declare-fun d!122963 () Bool)

(assert (=> d!122963 (= (apply!894 lt!452859 lt!452846) (get!16343 (getValueByKey!587 (toList!6889 lt!452859) lt!452846)))))

(declare-fun bs!30014 () Bool)

(assert (= bs!30014 d!122963))

(declare-fun m!947195 () Bool)

(assert (=> bs!30014 m!947195))

(assert (=> bs!30014 m!947195))

(declare-fun m!947197 () Bool)

(assert (=> bs!30014 m!947197))

(assert (=> b!1028312 d!122963))

(declare-fun d!122965 () Bool)

(assert (=> d!122965 (= (apply!894 lt!452857 lt!452860) (get!16343 (getValueByKey!587 (toList!6889 lt!452857) lt!452860)))))

(declare-fun bs!30015 () Bool)

(assert (= bs!30015 d!122965))

(declare-fun m!947199 () Bool)

(assert (=> bs!30015 m!947199))

(assert (=> bs!30015 m!947199))

(declare-fun m!947201 () Bool)

(assert (=> bs!30015 m!947201))

(assert (=> b!1028312 d!122965))

(declare-fun d!122967 () Bool)

(assert (=> d!122967 (contains!5946 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))) lt!452861)))

(declare-fun lt!453088 () Unit!33461)

(assert (=> d!122967 (= lt!453088 (choose!1693 lt!452866 lt!452858 (zeroValue!5938 thiss!1427) lt!452861))))

(assert (=> d!122967 (contains!5946 lt!452866 lt!452861)))

(assert (=> d!122967 (= (addStillContains!613 lt!452866 lt!452858 (zeroValue!5938 thiss!1427) lt!452861) lt!453088)))

(declare-fun bs!30016 () Bool)

(assert (= bs!30016 d!122967))

(assert (=> bs!30016 m!946639))

(assert (=> bs!30016 m!946639))

(assert (=> bs!30016 m!946661))

(declare-fun m!947203 () Bool)

(assert (=> bs!30016 m!947203))

(declare-fun m!947205 () Bool)

(assert (=> bs!30016 m!947205))

(assert (=> b!1028312 d!122967))

(declare-fun d!122969 () Bool)

(assert (=> d!122969 (= (apply!894 (+!3125 lt!452857 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))) lt!452860) (apply!894 lt!452857 lt!452860))))

(declare-fun lt!453089 () Unit!33461)

(assert (=> d!122969 (= lt!453089 (choose!1694 lt!452857 lt!452854 (minValue!5938 thiss!1427) lt!452860))))

(declare-fun e!580677 () Bool)

(assert (=> d!122969 e!580677))

(declare-fun res!688247 () Bool)

(assert (=> d!122969 (=> (not res!688247) (not e!580677))))

(assert (=> d!122969 (= res!688247 (contains!5946 lt!452857 lt!452860))))

(assert (=> d!122969 (= (addApplyDifferent!469 lt!452857 lt!452854 (minValue!5938 thiss!1427) lt!452860) lt!453089)))

(declare-fun b!1028663 () Bool)

(assert (=> b!1028663 (= e!580677 (not (= lt!452860 lt!452854)))))

(assert (= (and d!122969 res!688247) b!1028663))

(declare-fun m!947207 () Bool)

(assert (=> d!122969 m!947207))

(declare-fun m!947209 () Bool)

(assert (=> d!122969 m!947209))

(assert (=> d!122969 m!946663))

(assert (=> d!122969 m!946665))

(assert (=> d!122969 m!946663))

(assert (=> d!122969 m!946637))

(assert (=> b!1028312 d!122969))

(declare-fun d!122971 () Bool)

(declare-fun e!580678 () Bool)

(assert (=> d!122971 e!580678))

(declare-fun res!688248 () Bool)

(assert (=> d!122971 (=> (not res!688248) (not e!580678))))

(declare-fun lt!453091 () ListLongMap!13747)

(assert (=> d!122971 (= res!688248 (contains!5946 lt!453091 (_1!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453090 () List!21846)

(assert (=> d!122971 (= lt!453091 (ListLongMap!13748 lt!453090))))

(declare-fun lt!453092 () Unit!33461)

(declare-fun lt!453093 () Unit!33461)

(assert (=> d!122971 (= lt!453092 lt!453093)))

(assert (=> d!122971 (= (getValueByKey!587 lt!453090 (_1!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))))))

(assert (=> d!122971 (= lt!453093 (lemmaContainsTupThenGetReturnValue!277 lt!453090 (_1!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))))))

(assert (=> d!122971 (= lt!453090 (insertStrictlySorted!370 (toList!6889 lt!452859) (_1!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))))))

(assert (=> d!122971 (= (+!3125 lt!452859 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))) lt!453091)))

(declare-fun b!1028664 () Bool)

(declare-fun res!688249 () Bool)

(assert (=> b!1028664 (=> (not res!688249) (not e!580678))))

(assert (=> b!1028664 (= res!688249 (= (getValueByKey!587 (toList!6889 lt!453091) (_1!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))))))))

(declare-fun b!1028665 () Bool)

(assert (=> b!1028665 (= e!580678 (contains!5948 (toList!6889 lt!453091) (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))))))

(assert (= (and d!122971 res!688248) b!1028664))

(assert (= (and b!1028664 res!688249) b!1028665))

(declare-fun m!947211 () Bool)

(assert (=> d!122971 m!947211))

(declare-fun m!947213 () Bool)

(assert (=> d!122971 m!947213))

(declare-fun m!947215 () Bool)

(assert (=> d!122971 m!947215))

(declare-fun m!947217 () Bool)

(assert (=> d!122971 m!947217))

(declare-fun m!947219 () Bool)

(assert (=> b!1028664 m!947219))

(declare-fun m!947221 () Bool)

(assert (=> b!1028665 m!947221))

(assert (=> b!1028312 d!122971))

(declare-fun d!122973 () Bool)

(declare-fun e!580679 () Bool)

(assert (=> d!122973 e!580679))

(declare-fun res!688250 () Bool)

(assert (=> d!122973 (=> (not res!688250) (not e!580679))))

(declare-fun lt!453095 () ListLongMap!13747)

(assert (=> d!122973 (= res!688250 (contains!5946 lt!453095 (_1!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!453094 () List!21846)

(assert (=> d!122973 (= lt!453095 (ListLongMap!13748 lt!453094))))

(declare-fun lt!453096 () Unit!33461)

(declare-fun lt!453097 () Unit!33461)

(assert (=> d!122973 (= lt!453096 lt!453097)))

(assert (=> d!122973 (= (getValueByKey!587 lt!453094 (_1!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122973 (= lt!453097 (lemmaContainsTupThenGetReturnValue!277 lt!453094 (_1!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122973 (= lt!453094 (insertStrictlySorted!370 (toList!6889 lt!452865) (_1!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122973 (= (+!3125 lt!452865 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))) lt!453095)))

(declare-fun b!1028666 () Bool)

(declare-fun res!688251 () Bool)

(assert (=> b!1028666 (=> (not res!688251) (not e!580679))))

(assert (=> b!1028666 (= res!688251 (= (getValueByKey!587 (toList!6889 lt!453095) (_1!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1028667 () Bool)

(assert (=> b!1028667 (= e!580679 (contains!5948 (toList!6889 lt!453095) (tuple2!15627 lt!452855 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!122973 res!688250) b!1028666))

(assert (= (and b!1028666 res!688251) b!1028667))

(declare-fun m!947223 () Bool)

(assert (=> d!122973 m!947223))

(declare-fun m!947225 () Bool)

(assert (=> d!122973 m!947225))

(declare-fun m!947227 () Bool)

(assert (=> d!122973 m!947227))

(declare-fun m!947229 () Bool)

(assert (=> d!122973 m!947229))

(declare-fun m!947231 () Bool)

(assert (=> b!1028666 m!947231))

(declare-fun m!947233 () Bool)

(assert (=> b!1028667 m!947233))

(assert (=> b!1028312 d!122973))

(declare-fun d!122975 () Bool)

(assert (=> d!122975 (= (apply!894 (+!3125 lt!452859 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))) lt!452846) (get!16343 (getValueByKey!587 (toList!6889 (+!3125 lt!452859 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427)))) lt!452846)))))

(declare-fun bs!30017 () Bool)

(assert (= bs!30017 d!122975))

(declare-fun m!947235 () Bool)

(assert (=> bs!30017 m!947235))

(assert (=> bs!30017 m!947235))

(declare-fun m!947237 () Bool)

(assert (=> bs!30017 m!947237))

(assert (=> b!1028312 d!122975))

(declare-fun d!122977 () Bool)

(assert (=> d!122977 (= (apply!894 (+!3125 lt!452857 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))) lt!452860) (get!16343 (getValueByKey!587 (toList!6889 (+!3125 lt!452857 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))) lt!452860)))))

(declare-fun bs!30018 () Bool)

(assert (= bs!30018 d!122977))

(declare-fun m!947239 () Bool)

(assert (=> bs!30018 m!947239))

(assert (=> bs!30018 m!947239))

(declare-fun m!947241 () Bool)

(assert (=> bs!30018 m!947241))

(assert (=> b!1028312 d!122977))

(declare-fun d!122979 () Bool)

(assert (=> d!122979 (= (apply!894 lt!452865 lt!452862) (get!16343 (getValueByKey!587 (toList!6889 lt!452865) lt!452862)))))

(declare-fun bs!30019 () Bool)

(assert (= bs!30019 d!122979))

(declare-fun m!947243 () Bool)

(assert (=> bs!30019 m!947243))

(assert (=> bs!30019 m!947243))

(declare-fun m!947245 () Bool)

(assert (=> bs!30019 m!947245))

(assert (=> b!1028312 d!122979))

(declare-fun d!122981 () Bool)

(declare-fun e!580680 () Bool)

(assert (=> d!122981 e!580680))

(declare-fun res!688252 () Bool)

(assert (=> d!122981 (=> (not res!688252) (not e!580680))))

(declare-fun lt!453099 () ListLongMap!13747)

(assert (=> d!122981 (= res!688252 (contains!5946 lt!453099 (_1!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))))))

(declare-fun lt!453098 () List!21846)

(assert (=> d!122981 (= lt!453099 (ListLongMap!13748 lt!453098))))

(declare-fun lt!453100 () Unit!33461)

(declare-fun lt!453101 () Unit!33461)

(assert (=> d!122981 (= lt!453100 lt!453101)))

(assert (=> d!122981 (= (getValueByKey!587 lt!453098 (_1!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))))))

(assert (=> d!122981 (= lt!453101 (lemmaContainsTupThenGetReturnValue!277 lt!453098 (_1!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))))))

(assert (=> d!122981 (= lt!453098 (insertStrictlySorted!370 (toList!6889 lt!452857) (_1!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))))))

(assert (=> d!122981 (= (+!3125 lt!452857 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))) lt!453099)))

(declare-fun b!1028668 () Bool)

(declare-fun res!688253 () Bool)

(assert (=> b!1028668 (=> (not res!688253) (not e!580680))))

(assert (=> b!1028668 (= res!688253 (= (getValueByKey!587 (toList!6889 lt!453099) (_1!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))))))))

(declare-fun b!1028669 () Bool)

(assert (=> b!1028669 (= e!580680 (contains!5948 (toList!6889 lt!453099) (tuple2!15627 lt!452854 (minValue!5938 thiss!1427))))))

(assert (= (and d!122981 res!688252) b!1028668))

(assert (= (and b!1028668 res!688253) b!1028669))

(declare-fun m!947247 () Bool)

(assert (=> d!122981 m!947247))

(declare-fun m!947249 () Bool)

(assert (=> d!122981 m!947249))

(declare-fun m!947251 () Bool)

(assert (=> d!122981 m!947251))

(declare-fun m!947253 () Bool)

(assert (=> d!122981 m!947253))

(declare-fun m!947255 () Bool)

(assert (=> b!1028668 m!947255))

(declare-fun m!947257 () Bool)

(assert (=> b!1028669 m!947257))

(assert (=> b!1028312 d!122981))

(declare-fun d!122983 () Bool)

(assert (=> d!122983 (= (apply!894 (+!3125 lt!452859 (tuple2!15627 lt!452867 (minValue!5938 thiss!1427))) lt!452846) (apply!894 lt!452859 lt!452846))))

(declare-fun lt!453102 () Unit!33461)

(assert (=> d!122983 (= lt!453102 (choose!1694 lt!452859 lt!452867 (minValue!5938 thiss!1427) lt!452846))))

(declare-fun e!580681 () Bool)

(assert (=> d!122983 e!580681))

(declare-fun res!688254 () Bool)

(assert (=> d!122983 (=> (not res!688254) (not e!580681))))

(assert (=> d!122983 (= res!688254 (contains!5946 lt!452859 lt!452846))))

(assert (=> d!122983 (= (addApplyDifferent!469 lt!452859 lt!452867 (minValue!5938 thiss!1427) lt!452846) lt!453102)))

(declare-fun b!1028670 () Bool)

(assert (=> b!1028670 (= e!580681 (not (= lt!452846 lt!452867)))))

(assert (= (and d!122983 res!688254) b!1028670))

(declare-fun m!947259 () Bool)

(assert (=> d!122983 m!947259))

(declare-fun m!947261 () Bool)

(assert (=> d!122983 m!947261))

(assert (=> d!122983 m!946657))

(assert (=> d!122983 m!946659))

(assert (=> d!122983 m!946657))

(assert (=> d!122983 m!946645))

(assert (=> b!1028312 d!122983))

(declare-fun d!122985 () Bool)

(declare-fun e!580682 () Bool)

(assert (=> d!122985 e!580682))

(declare-fun res!688255 () Bool)

(assert (=> d!122985 (=> (not res!688255) (not e!580682))))

(declare-fun lt!453104 () ListLongMap!13747)

(assert (=> d!122985 (= res!688255 (contains!5946 lt!453104 (_1!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))))))

(declare-fun lt!453103 () List!21846)

(assert (=> d!122985 (= lt!453104 (ListLongMap!13748 lt!453103))))

(declare-fun lt!453105 () Unit!33461)

(declare-fun lt!453106 () Unit!33461)

(assert (=> d!122985 (= lt!453105 lt!453106)))

(assert (=> d!122985 (= (getValueByKey!587 lt!453103 (_1!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122985 (= lt!453106 (lemmaContainsTupThenGetReturnValue!277 lt!453103 (_1!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122985 (= lt!453103 (insertStrictlySorted!370 (toList!6889 lt!452866) (_1!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))) (_2!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))))))

(assert (=> d!122985 (= (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))) lt!453104)))

(declare-fun b!1028671 () Bool)

(declare-fun res!688256 () Bool)

(assert (=> b!1028671 (=> (not res!688256) (not e!580682))))

(assert (=> b!1028671 (= res!688256 (= (getValueByKey!587 (toList!6889 lt!453104) (_1!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))) (Some!637 (_2!7824 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))))))))

(declare-fun b!1028672 () Bool)

(assert (=> b!1028672 (= e!580682 (contains!5948 (toList!6889 lt!453104) (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))))))

(assert (= (and d!122985 res!688255) b!1028671))

(assert (= (and b!1028671 res!688256) b!1028672))

(declare-fun m!947263 () Bool)

(assert (=> d!122985 m!947263))

(declare-fun m!947265 () Bool)

(assert (=> d!122985 m!947265))

(declare-fun m!947267 () Bool)

(assert (=> d!122985 m!947267))

(declare-fun m!947269 () Bool)

(assert (=> d!122985 m!947269))

(declare-fun m!947271 () Bool)

(assert (=> b!1028671 m!947271))

(declare-fun m!947273 () Bool)

(assert (=> b!1028672 m!947273))

(assert (=> b!1028312 d!122985))

(declare-fun d!122987 () Bool)

(declare-fun e!580684 () Bool)

(assert (=> d!122987 e!580684))

(declare-fun res!688257 () Bool)

(assert (=> d!122987 (=> res!688257 e!580684)))

(declare-fun lt!453109 () Bool)

(assert (=> d!122987 (= res!688257 (not lt!453109))))

(declare-fun lt!453110 () Bool)

(assert (=> d!122987 (= lt!453109 lt!453110)))

(declare-fun lt!453107 () Unit!33461)

(declare-fun e!580683 () Unit!33461)

(assert (=> d!122987 (= lt!453107 e!580683)))

(declare-fun c!103833 () Bool)

(assert (=> d!122987 (= c!103833 lt!453110)))

(assert (=> d!122987 (= lt!453110 (containsKey!560 (toList!6889 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))) lt!452861))))

(assert (=> d!122987 (= (contains!5946 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427))) lt!452861) lt!453109)))

(declare-fun b!1028673 () Bool)

(declare-fun lt!453108 () Unit!33461)

(assert (=> b!1028673 (= e!580683 lt!453108)))

(assert (=> b!1028673 (= lt!453108 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))) lt!452861))))

(assert (=> b!1028673 (isDefined!435 (getValueByKey!587 (toList!6889 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))) lt!452861))))

(declare-fun b!1028674 () Bool)

(declare-fun Unit!33483 () Unit!33461)

(assert (=> b!1028674 (= e!580683 Unit!33483)))

(declare-fun b!1028675 () Bool)

(assert (=> b!1028675 (= e!580684 (isDefined!435 (getValueByKey!587 (toList!6889 (+!3125 lt!452866 (tuple2!15627 lt!452858 (zeroValue!5938 thiss!1427)))) lt!452861)))))

(assert (= (and d!122987 c!103833) b!1028673))

(assert (= (and d!122987 (not c!103833)) b!1028674))

(assert (= (and d!122987 (not res!688257)) b!1028675))

(declare-fun m!947275 () Bool)

(assert (=> d!122987 m!947275))

(declare-fun m!947277 () Bool)

(assert (=> b!1028673 m!947277))

(declare-fun m!947279 () Bool)

(assert (=> b!1028673 m!947279))

(assert (=> b!1028673 m!947279))

(declare-fun m!947281 () Bool)

(assert (=> b!1028673 m!947281))

(assert (=> b!1028675 m!947279))

(assert (=> b!1028675 m!947279))

(assert (=> b!1028675 m!947281))

(assert (=> b!1028312 d!122987))

(declare-fun d!122989 () Bool)

(declare-fun e!580685 () Bool)

(assert (=> d!122989 e!580685))

(declare-fun res!688258 () Bool)

(assert (=> d!122989 (=> (not res!688258) (not e!580685))))

(declare-fun lt!453112 () ListLongMap!13747)

(assert (=> d!122989 (= res!688258 (contains!5946 lt!453112 (_1!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(declare-fun lt!453111 () List!21846)

(assert (=> d!122989 (= lt!453112 (ListLongMap!13748 lt!453111))))

(declare-fun lt!453113 () Unit!33461)

(declare-fun lt!453114 () Unit!33461)

(assert (=> d!122989 (= lt!453113 lt!453114)))

(assert (=> d!122989 (= (getValueByKey!587 lt!453111 (_1!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!637 (_2!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!122989 (= lt!453114 (lemmaContainsTupThenGetReturnValue!277 lt!453111 (_1!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!122989 (= lt!453111 (insertStrictlySorted!370 (toList!6889 (ite c!103740 call!43337 (ite c!103738 call!43336 call!43340))) (_1!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) (_2!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))))))

(assert (=> d!122989 (= (+!3125 (ite c!103740 call!43337 (ite c!103738 call!43336 call!43340)) (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))) lt!453112)))

(declare-fun b!1028676 () Bool)

(declare-fun res!688259 () Bool)

(assert (=> b!1028676 (=> (not res!688259) (not e!580685))))

(assert (=> b!1028676 (= res!688259 (= (getValueByKey!587 (toList!6889 lt!453112) (_1!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427))))) (Some!637 (_2!7824 (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))))

(declare-fun b!1028677 () Bool)

(assert (=> b!1028677 (= e!580685 (contains!5948 (toList!6889 lt!453112) (ite (or c!103740 c!103738) (tuple2!15627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5938 thiss!1427)) (tuple2!15627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5938 thiss!1427)))))))

(assert (= (and d!122989 res!688258) b!1028676))

(assert (= (and b!1028676 res!688259) b!1028677))

(declare-fun m!947283 () Bool)

(assert (=> d!122989 m!947283))

(declare-fun m!947285 () Bool)

(assert (=> d!122989 m!947285))

(declare-fun m!947287 () Bool)

(assert (=> d!122989 m!947287))

(declare-fun m!947289 () Bool)

(assert (=> d!122989 m!947289))

(declare-fun m!947291 () Bool)

(assert (=> b!1028676 m!947291))

(declare-fun m!947293 () Bool)

(assert (=> b!1028677 m!947293))

(assert (=> bm!43334 d!122989))

(declare-fun d!122991 () Bool)

(declare-fun e!580687 () Bool)

(assert (=> d!122991 e!580687))

(declare-fun res!688260 () Bool)

(assert (=> d!122991 (=> res!688260 e!580687)))

(declare-fun lt!453117 () Bool)

(assert (=> d!122991 (= res!688260 (not lt!453117))))

(declare-fun lt!453118 () Bool)

(assert (=> d!122991 (= lt!453117 lt!453118)))

(declare-fun lt!453115 () Unit!33461)

(declare-fun e!580686 () Unit!33461)

(assert (=> d!122991 (= lt!453115 e!580686)))

(declare-fun c!103834 () Bool)

(assert (=> d!122991 (= c!103834 lt!453118)))

(assert (=> d!122991 (= lt!453118 (containsKey!560 (toList!6889 lt!452856) (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122991 (= (contains!5946 lt!452856 (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)) lt!453117)))

(declare-fun b!1028678 () Bool)

(declare-fun lt!453116 () Unit!33461)

(assert (=> b!1028678 (= e!580686 lt!453116)))

(assert (=> b!1028678 (= lt!453116 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6889 lt!452856) (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028678 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452856) (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028679 () Bool)

(declare-fun Unit!33484 () Unit!33461)

(assert (=> b!1028679 (= e!580686 Unit!33484)))

(declare-fun b!1028680 () Bool)

(assert (=> b!1028680 (= e!580687 (isDefined!435 (getValueByKey!587 (toList!6889 lt!452856) (select (arr!31104 (_keys!11252 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!122991 c!103834) b!1028678))

(assert (= (and d!122991 (not c!103834)) b!1028679))

(assert (= (and d!122991 (not res!688260)) b!1028680))

(assert (=> d!122991 m!946655))

(declare-fun m!947295 () Bool)

(assert (=> d!122991 m!947295))

(assert (=> b!1028678 m!946655))

(declare-fun m!947297 () Bool)

(assert (=> b!1028678 m!947297))

(assert (=> b!1028678 m!946655))

(assert (=> b!1028678 m!946855))

(assert (=> b!1028678 m!946855))

(declare-fun m!947299 () Bool)

(assert (=> b!1028678 m!947299))

(assert (=> b!1028680 m!946655))

(assert (=> b!1028680 m!946855))

(assert (=> b!1028680 m!946855))

(assert (=> b!1028680 m!947299))

(assert (=> b!1028314 d!122991))

(declare-fun c!103835 () Bool)

(declare-fun call!43372 () Bool)

(declare-fun bm!43369 () Bool)

(assert (=> bm!43369 (= call!43372 (arrayNoDuplicates!0 lt!452721 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!103835 (Cons!21843 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!103754 (Cons!21843 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) Nil!21844) Nil!21844)) (ite c!103754 (Cons!21843 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) Nil!21844) Nil!21844))))))

(declare-fun b!1028681 () Bool)

(declare-fun e!580690 () Bool)

(declare-fun e!580688 () Bool)

(assert (=> b!1028681 (= e!580690 e!580688)))

(declare-fun res!688262 () Bool)

(assert (=> b!1028681 (=> (not res!688262) (not e!580688))))

(declare-fun e!580689 () Bool)

(assert (=> b!1028681 (= res!688262 (not e!580689))))

(declare-fun res!688263 () Bool)

(assert (=> b!1028681 (=> (not res!688263) (not e!580689))))

(assert (=> b!1028681 (= res!688263 (validKeyInArray!0 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122993 () Bool)

(declare-fun res!688261 () Bool)

(assert (=> d!122993 (=> res!688261 e!580690)))

(assert (=> d!122993 (= res!688261 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31620 lt!452721)))))

(assert (=> d!122993 (= (arrayNoDuplicates!0 lt!452721 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103754 (Cons!21843 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) Nil!21844) Nil!21844)) e!580690)))

(declare-fun b!1028682 () Bool)

(declare-fun e!580691 () Bool)

(assert (=> b!1028682 (= e!580688 e!580691)))

(assert (=> b!1028682 (= c!103835 (validKeyInArray!0 (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028683 () Bool)

(assert (=> b!1028683 (= e!580691 call!43372)))

(declare-fun b!1028684 () Bool)

(assert (=> b!1028684 (= e!580691 call!43372)))

(declare-fun b!1028685 () Bool)

(assert (=> b!1028685 (= e!580689 (contains!5947 (ite c!103754 (Cons!21843 (select (arr!31104 lt!452721) #b00000000000000000000000000000000) Nil!21844) Nil!21844) (select (arr!31104 lt!452721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!122993 (not res!688261)) b!1028681))

(assert (= (and b!1028681 res!688263) b!1028685))

(assert (= (and b!1028681 res!688262) b!1028682))

(assert (= (and b!1028682 c!103835) b!1028683))

(assert (= (and b!1028682 (not c!103835)) b!1028684))

(assert (= (or b!1028683 b!1028684) bm!43369))

(assert (=> bm!43369 m!946797))

(declare-fun m!947301 () Bool)

(assert (=> bm!43369 m!947301))

(assert (=> b!1028681 m!946797))

(assert (=> b!1028681 m!946797))

(assert (=> b!1028681 m!946799))

(assert (=> b!1028682 m!946797))

(assert (=> b!1028682 m!946797))

(assert (=> b!1028682 m!946799))

(assert (=> b!1028685 m!946797))

(assert (=> b!1028685 m!946797))

(declare-fun m!947303 () Bool)

(assert (=> b!1028685 m!947303))

(assert (=> bm!43350 d!122993))

(declare-fun call!43373 () Bool)

(declare-fun bm!43370 () Bool)

(declare-fun c!103836 () Bool)

(assert (=> bm!43370 (= call!43373 (arrayNoDuplicates!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103836 (Cons!21843 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000) Nil!21844) Nil!21844)))))

(declare-fun b!1028686 () Bool)

(declare-fun e!580694 () Bool)

(declare-fun e!580692 () Bool)

(assert (=> b!1028686 (= e!580694 e!580692)))

(declare-fun res!688265 () Bool)

(assert (=> b!1028686 (=> (not res!688265) (not e!580692))))

(declare-fun e!580693 () Bool)

(assert (=> b!1028686 (= res!688265 (not e!580693))))

(declare-fun res!688266 () Bool)

(assert (=> b!1028686 (=> (not res!688266) (not e!580693))))

(assert (=> b!1028686 (= res!688266 (validKeyInArray!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!122995 () Bool)

(declare-fun res!688264 () Bool)

(assert (=> d!122995 (=> res!688264 e!580694)))

(assert (=> d!122995 (= res!688264 (bvsge #b00000000000000000000000000000000 (size!31620 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))))))))

(assert (=> d!122995 (= (arrayNoDuplicates!0 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427))) #b00000000000000000000000000000000 Nil!21844) e!580694)))

(declare-fun b!1028687 () Bool)

(declare-fun e!580695 () Bool)

(assert (=> b!1028687 (= e!580692 e!580695)))

(assert (=> b!1028687 (= c!103836 (validKeyInArray!0 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028688 () Bool)

(assert (=> b!1028688 (= e!580695 call!43373)))

(declare-fun b!1028689 () Bool)

(assert (=> b!1028689 (= e!580695 call!43373)))

(declare-fun b!1028690 () Bool)

(assert (=> b!1028690 (= e!580693 (contains!5947 Nil!21844 (select (arr!31104 (array!64596 (store (arr!31104 (_keys!11252 thiss!1427)) (index!41040 lt!452719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31620 (_keys!11252 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!122995 (not res!688264)) b!1028686))

(assert (= (and b!1028686 res!688266) b!1028690))

(assert (= (and b!1028686 res!688265) b!1028687))

(assert (= (and b!1028687 c!103836) b!1028688))

(assert (= (and b!1028687 (not c!103836)) b!1028689))

(assert (= (or b!1028688 b!1028689) bm!43370))

(assert (=> bm!43370 m!946843))

(declare-fun m!947305 () Bool)

(assert (=> bm!43370 m!947305))

(assert (=> b!1028686 m!946843))

(assert (=> b!1028686 m!946843))

(assert (=> b!1028686 m!946851))

(assert (=> b!1028687 m!946843))

(assert (=> b!1028687 m!946843))

(assert (=> b!1028687 m!946851))

(assert (=> b!1028690 m!946843))

(assert (=> b!1028690 m!946843))

(declare-fun m!947307 () Bool)

(assert (=> b!1028690 m!947307))

(assert (=> b!1028384 d!122995))

(declare-fun b!1028691 () Bool)

(declare-fun e!580696 () Bool)

(assert (=> b!1028691 (= e!580696 tp_is_empty!24301)))

(declare-fun condMapEmpty!37897 () Bool)

(declare-fun mapDefault!37897 () ValueCell!11447)

(assert (=> mapNonEmpty!37896 (= condMapEmpty!37897 (= mapRest!37896 ((as const (Array (_ BitVec 32) ValueCell!11447)) mapDefault!37897)))))

(declare-fun e!580697 () Bool)

(declare-fun mapRes!37897 () Bool)

(assert (=> mapNonEmpty!37896 (= tp!72811 (and e!580697 mapRes!37897))))

(declare-fun mapIsEmpty!37897 () Bool)

(assert (=> mapIsEmpty!37897 mapRes!37897))

(declare-fun mapNonEmpty!37897 () Bool)

(declare-fun tp!72812 () Bool)

(assert (=> mapNonEmpty!37897 (= mapRes!37897 (and tp!72812 e!580696))))

(declare-fun mapRest!37897 () (Array (_ BitVec 32) ValueCell!11447))

(declare-fun mapKey!37897 () (_ BitVec 32))

(declare-fun mapValue!37897 () ValueCell!11447)

(assert (=> mapNonEmpty!37897 (= mapRest!37896 (store mapRest!37897 mapKey!37897 mapValue!37897))))

(declare-fun b!1028692 () Bool)

(assert (=> b!1028692 (= e!580697 tp_is_empty!24301)))

(assert (= (and mapNonEmpty!37896 condMapEmpty!37897) mapIsEmpty!37897))

(assert (= (and mapNonEmpty!37896 (not condMapEmpty!37897)) mapNonEmpty!37897))

(assert (= (and mapNonEmpty!37897 ((_ is ValueCellFull!11447) mapValue!37897)) b!1028691))

(assert (= (and mapNonEmpty!37896 ((_ is ValueCellFull!11447) mapDefault!37897)) b!1028692))

(declare-fun m!947309 () Bool)

(assert (=> mapNonEmpty!37897 m!947309))

(declare-fun b_lambda!15793 () Bool)

(assert (= b_lambda!15787 (or (and b!1028149 b_free!20581) b_lambda!15793)))

(declare-fun b_lambda!15795 () Bool)

(assert (= b_lambda!15791 (or (and b!1028149 b_free!20581) b_lambda!15795)))

(declare-fun b_lambda!15797 () Bool)

(assert (= b_lambda!15789 (or (and b!1028149 b_free!20581) b_lambda!15797)))

(declare-fun b_lambda!15799 () Bool)

(assert (= b_lambda!15785 (or (and b!1028149 b_free!20581) b_lambda!15799)))

(declare-fun b_lambda!15801 () Bool)

(assert (= b_lambda!15781 (or (and b!1028149 b_free!20581) b_lambda!15801)))

(declare-fun b_lambda!15803 () Bool)

(assert (= b_lambda!15783 (or (and b!1028149 b_free!20581) b_lambda!15803)))

(check-sat (not b_lambda!15767) (not b!1028455) (not d!122839) (not b!1028579) (not b!1028461) (not bm!43367) (not b!1028520) (not d!122977) (not d!122893) (not d!122937) (not bm!43354) (not d!122975) (not d!122895) (not b!1028603) (not d!122935) (not d!122883) (not d!122921) (not d!122901) (not b!1028690) b_and!32865 (not bm!43369) (not b!1028669) (not b!1028678) (not b_lambda!15775) (not d!122945) (not b_lambda!15779) (not d!122867) (not b!1028582) (not b!1028513) (not b!1028578) (not d!122915) (not d!122847) (not mapNonEmpty!37897) (not b!1028587) (not b!1028485) (not bm!43370) (not d!122985) (not b!1028483) (not b!1028441) (not b!1028439) (not b!1028517) (not b!1028403) (not b!1028571) (not d!122963) (not b!1028666) (not bm!43366) (not bm!43352) (not b_lambda!15797) (not b_next!20581) (not b_lambda!15803) (not b!1028523) (not b!1028581) (not b!1028614) (not b!1028665) (not b!1028675) (not b!1028680) (not bm!43361) (not d!122905) (not b!1028423) (not d!122979) (not b!1028526) (not b!1028563) (not b!1028534) (not b!1028443) (not b!1028539) tp_is_empty!24301 (not b!1028584) (not b!1028686) (not d!122835) (not b!1028658) (not b!1028536) (not b!1028521) (not b!1028465) (not b!1028411) (not d!122991) (not d!122885) (not b!1028574) (not b_lambda!15777) (not d!122973) (not b!1028577) (not b!1028664) (not b!1028647) (not b!1028590) (not b!1028410) (not d!122873) (not bm!43362) (not b!1028580) (not d!122981) (not b!1028444) (not b_lambda!15801) (not b!1028458) (not b!1028593) (not d!122949) (not b!1028591) (not b!1028457) (not b!1028488) (not b!1028657) (not b!1028468) (not bm!43351) (not d!122953) (not d!122909) (not d!122925) (not d!122911) (not b!1028535) (not b!1028429) (not b_lambda!15799) (not b!1028438) (not d!122951) (not b!1028612) (not b!1028479) (not d!122843) (not d!122989) (not b!1028594) (not b!1028595) (not d!122887) (not b!1028681) (not d!122939) (not b!1028422) (not b!1028671) (not b!1028542) (not d!122943) (not b!1028682) (not bm!43358) (not b!1028653) (not b!1028532) (not b!1028661) (not b!1028459) (not b!1028541) (not b!1028672) (not d!122983) (not bm!43364) (not b_lambda!15795) (not d!122855) (not b!1028516) (not d!122959) (not b!1028486) (not d!122923) (not b!1028425) (not b!1028610) (not d!122903) (not b!1028454) (not d!122961) (not d!122877) (not b!1028677) (not b!1028525) (not d!122965) (not b!1028538) (not d!122969) (not d!122861) (not d!122875) (not d!122931) (not b!1028667) (not d!122987) (not b!1028436) (not b!1028586) (not b!1028668) (not d!122897) (not d!122863) (not d!122879) (not d!122899) (not b!1028607) (not bm!43353) (not d!122933) (not b!1028687) (not d!122913) (not d!122907) (not b!1028466) (not b!1028676) (not d!122917) (not d!122941) (not b!1028601) (not b!1028685) (not b!1028655) (not b!1028616) (not b!1028463) (not b!1028417) (not bm!43357) (not b!1028588) (not bm!43359) (not d!122845) (not d!122967) (not b_lambda!15793) (not d!122869) (not b!1028518) (not bm!43368) (not d!122971) (not b!1028519) (not d!122919) (not b!1028634) (not b!1028673))
(check-sat b_and!32865 (not b_next!20581))
