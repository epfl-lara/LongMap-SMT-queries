; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89884 () Bool)

(assert start!89884)

(declare-fun b!1029545 () Bool)

(declare-fun b_free!20599 () Bool)

(declare-fun b_next!20599 () Bool)

(assert (=> b!1029545 (= b_free!20599 (not b_next!20599))))

(declare-fun tp!72860 () Bool)

(declare-fun b_and!32915 () Bool)

(assert (=> b!1029545 (= tp!72860 b_and!32915)))

(declare-fun mapNonEmpty!37925 () Bool)

(declare-fun mapRes!37925 () Bool)

(declare-fun tp!72861 () Bool)

(declare-fun e!581286 () Bool)

(assert (=> mapNonEmpty!37925 (= mapRes!37925 (and tp!72861 e!581286))))

(declare-datatypes ((V!37299 0))(
  ( (V!37300 (val!12210 Int)) )
))
(declare-datatypes ((ValueCell!11456 0))(
  ( (ValueCellFull!11456 (v!14784 V!37299)) (EmptyCell!11456) )
))
(declare-fun mapValue!37925 () ValueCell!11456)

(declare-datatypes ((array!64637 0))(
  ( (array!64638 (arr!31122 (Array (_ BitVec 32) (_ BitVec 64))) (size!31640 (_ BitVec 32))) )
))
(declare-datatypes ((array!64639 0))(
  ( (array!64640 (arr!31123 (Array (_ BitVec 32) ValueCell!11456)) (size!31641 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5506 0))(
  ( (LongMapFixedSize!5507 (defaultEntry!6121 Int) (mask!29879 (_ BitVec 32)) (extraKeys!5853 (_ BitVec 32)) (zeroValue!5957 V!37299) (minValue!5957 V!37299) (_size!2808 (_ BitVec 32)) (_keys!11283 array!64637) (_values!6144 array!64639) (_vacant!2808 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5506)

(declare-fun mapRest!37925 () (Array (_ BitVec 32) ValueCell!11456))

(declare-fun mapKey!37925 () (_ BitVec 32))

(assert (=> mapNonEmpty!37925 (= (arr!31123 (_values!6144 thiss!1427)) (store mapRest!37925 mapKey!37925 mapValue!37925))))

(declare-fun b!1029540 () Bool)

(declare-fun e!581280 () Bool)

(declare-fun tp_is_empty!24319 () Bool)

(assert (=> b!1029540 (= e!581280 tp_is_empty!24319)))

(declare-fun b!1029541 () Bool)

(declare-fun res!688654 () Bool)

(declare-fun e!581281 () Bool)

(assert (=> b!1029541 (=> (not res!688654) (not e!581281))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1029541 (= res!688654 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1029542 () Bool)

(declare-fun e!581284 () Bool)

(declare-fun e!581283 () Bool)

(assert (=> b!1029542 (= e!581284 (not e!581283))))

(declare-fun res!688653 () Bool)

(assert (=> b!1029542 (=> res!688653 e!581283)))

(declare-datatypes ((Unit!33515 0))(
  ( (Unit!33516) )
))
(declare-datatypes ((tuple2!15652 0))(
  ( (tuple2!15653 (_1!7837 Unit!33515) (_2!7837 LongMapFixedSize!5506)) )
))
(declare-fun lt!453775 () tuple2!15652)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029542 (= res!688653 (not (validMask!0 (mask!29879 (_2!7837 lt!453775)))))))

(declare-fun lt!453773 () array!64639)

(declare-fun lt!453777 () array!64637)

(declare-fun Unit!33517 () Unit!33515)

(declare-fun Unit!33518 () Unit!33515)

(assert (=> b!1029542 (= lt!453775 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2808 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15653 Unit!33517 (LongMapFixedSize!5507 (defaultEntry!6121 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvsub (_size!2808 thiss!1427) #b00000000000000000000000000000001) lt!453777 lt!453773 (bvadd #b00000000000000000000000000000001 (_vacant!2808 thiss!1427)))) (tuple2!15653 Unit!33518 (LongMapFixedSize!5507 (defaultEntry!6121 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvsub (_size!2808 thiss!1427) #b00000000000000000000000000000001) lt!453777 lt!453773 (_vacant!2808 thiss!1427)))))))

(declare-datatypes ((tuple2!15654 0))(
  ( (tuple2!15655 (_1!7838 (_ BitVec 64)) (_2!7838 V!37299)) )
))
(declare-datatypes ((List!21860 0))(
  ( (Nil!21857) (Cons!21856 (h!23057 tuple2!15654) (t!30945 List!21860)) )
))
(declare-datatypes ((ListLongMap!13761 0))(
  ( (ListLongMap!13762 (toList!6896 List!21860)) )
))
(declare-fun -!488 (ListLongMap!13761 (_ BitVec 64)) ListLongMap!13761)

(declare-fun getCurrentListMap!3863 (array!64637 array!64639 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) Int) ListLongMap!13761)

(assert (=> b!1029542 (= (-!488 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3863 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9674 0))(
  ( (MissingZero!9674 (index!41067 (_ BitVec 32))) (Found!9674 (index!41068 (_ BitVec 32))) (Intermediate!9674 (undefined!10486 Bool) (index!41069 (_ BitVec 32)) (x!91619 (_ BitVec 32))) (Undefined!9674) (MissingVacant!9674 (index!41070 (_ BitVec 32))) )
))
(declare-fun lt!453771 () SeekEntryResult!9674)

(declare-fun dynLambda!1950 (Int (_ BitVec 64)) V!37299)

(assert (=> b!1029542 (= lt!453773 (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))))))

(declare-fun lt!453779 () Unit!33515)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!13 (array!64637 array!64639 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) (_ BitVec 64) Int) Unit!33515)

(assert (=> b!1029542 (= lt!453779 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!13 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!41068 lt!453771) key!909 (defaultEntry!6121 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029542 (not (arrayContainsKey!0 lt!453777 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453776 () Unit!33515)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64637 (_ BitVec 32) (_ BitVec 64)) Unit!33515)

(assert (=> b!1029542 (= lt!453776 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11283 thiss!1427) (index!41068 lt!453771) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64637 (_ BitVec 32)) Bool)

(assert (=> b!1029542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453777 (mask!29879 thiss!1427))))

(declare-fun lt!453778 () Unit!33515)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64637 (_ BitVec 32) (_ BitVec 32)) Unit!33515)

(assert (=> b!1029542 (= lt!453778 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11283 thiss!1427) (index!41068 lt!453771) (mask!29879 thiss!1427)))))

(declare-datatypes ((List!21861 0))(
  ( (Nil!21858) (Cons!21857 (h!23058 (_ BitVec 64)) (t!30946 List!21861)) )
))
(declare-fun arrayNoDuplicates!0 (array!64637 (_ BitVec 32) List!21861) Bool)

(assert (=> b!1029542 (arrayNoDuplicates!0 lt!453777 #b00000000000000000000000000000000 Nil!21858)))

(declare-fun lt!453774 () Unit!33515)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21861) Unit!33515)

(assert (=> b!1029542 (= lt!453774 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11283 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!453771) #b00000000000000000000000000000000 Nil!21858))))

(declare-fun arrayCountValidKeys!0 (array!64637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029542 (= (arrayCountValidKeys!0 lt!453777 #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029542 (= lt!453777 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun lt!453772 () Unit!33515)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64637 (_ BitVec 32) (_ BitVec 64)) Unit!33515)

(assert (=> b!1029542 (= lt!453772 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11283 thiss!1427) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029543 () Bool)

(assert (=> b!1029543 (= e!581286 tp_is_empty!24319)))

(declare-fun b!1029544 () Bool)

(declare-fun e!581279 () Bool)

(assert (=> b!1029544 (= e!581279 (and e!581280 mapRes!37925))))

(declare-fun condMapEmpty!37925 () Bool)

(declare-fun mapDefault!37925 () ValueCell!11456)

(assert (=> b!1029544 (= condMapEmpty!37925 (= (arr!31123 (_values!6144 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11456)) mapDefault!37925)))))

(declare-fun mapIsEmpty!37925 () Bool)

(assert (=> mapIsEmpty!37925 mapRes!37925))

(declare-fun e!581285 () Bool)

(declare-fun array_inv!24093 (array!64637) Bool)

(declare-fun array_inv!24094 (array!64639) Bool)

(assert (=> b!1029545 (= e!581285 (and tp!72860 tp_is_empty!24319 (array_inv!24093 (_keys!11283 thiss!1427)) (array_inv!24094 (_values!6144 thiss!1427)) e!581279))))

(declare-fun b!1029546 () Bool)

(assert (=> b!1029546 (= e!581283 (or (not (= (size!31641 (_values!6144 (_2!7837 lt!453775))) (bvadd #b00000000000000000000000000000001 (mask!29879 (_2!7837 lt!453775))))) (not (= (size!31640 (_keys!11283 (_2!7837 lt!453775))) (size!31641 (_values!6144 (_2!7837 lt!453775))))) (bvslt (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000000000000) (bvslt (extraKeys!5853 (_2!7837 lt!453775)) #b00000000000000000000000000000000) (bvsle (extraKeys!5853 (_2!7837 lt!453775)) #b00000000000000000000000000000011)))))

(declare-fun res!688652 () Bool)

(assert (=> start!89884 (=> (not res!688652) (not e!581281))))

(declare-fun valid!2077 (LongMapFixedSize!5506) Bool)

(assert (=> start!89884 (= res!688652 (valid!2077 thiss!1427))))

(assert (=> start!89884 e!581281))

(assert (=> start!89884 e!581285))

(assert (=> start!89884 true))

(declare-fun b!1029547 () Bool)

(assert (=> b!1029547 (= e!581281 e!581284)))

(declare-fun res!688651 () Bool)

(assert (=> b!1029547 (=> (not res!688651) (not e!581284))))

(get-info :version)

(assert (=> b!1029547 (= res!688651 ((_ is Found!9674) lt!453771))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64637 (_ BitVec 32)) SeekEntryResult!9674)

(assert (=> b!1029547 (= lt!453771 (seekEntry!0 key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(assert (= (and start!89884 res!688652) b!1029541))

(assert (= (and b!1029541 res!688654) b!1029547))

(assert (= (and b!1029547 res!688651) b!1029542))

(assert (= (and b!1029542 (not res!688653)) b!1029546))

(assert (= (and b!1029544 condMapEmpty!37925) mapIsEmpty!37925))

(assert (= (and b!1029544 (not condMapEmpty!37925)) mapNonEmpty!37925))

(assert (= (and mapNonEmpty!37925 ((_ is ValueCellFull!11456) mapValue!37925)) b!1029543))

(assert (= (and b!1029544 ((_ is ValueCellFull!11456) mapDefault!37925)) b!1029540))

(assert (= b!1029545 b!1029544))

(assert (= start!89884 b!1029545))

(declare-fun b_lambda!15869 () Bool)

(assert (=> (not b_lambda!15869) (not b!1029542)))

(declare-fun t!30944 () Bool)

(declare-fun tb!6909 () Bool)

(assert (=> (and b!1029545 (= (defaultEntry!6121 thiss!1427) (defaultEntry!6121 thiss!1427)) t!30944) tb!6909))

(declare-fun result!14151 () Bool)

(assert (=> tb!6909 (= result!14151 tp_is_empty!24319)))

(assert (=> b!1029542 t!30944))

(declare-fun b_and!32917 () Bool)

(assert (= b_and!32915 (and (=> t!30944 result!14151) b_and!32917)))

(declare-fun m!948455 () Bool)

(assert (=> b!1029547 m!948455))

(declare-fun m!948457 () Bool)

(assert (=> start!89884 m!948457))

(declare-fun m!948459 () Bool)

(assert (=> b!1029545 m!948459))

(declare-fun m!948461 () Bool)

(assert (=> b!1029545 m!948461))

(declare-fun m!948463 () Bool)

(assert (=> mapNonEmpty!37925 m!948463))

(declare-fun m!948465 () Bool)

(assert (=> b!1029542 m!948465))

(declare-fun m!948467 () Bool)

(assert (=> b!1029542 m!948467))

(declare-fun m!948469 () Bool)

(assert (=> b!1029542 m!948469))

(declare-fun m!948471 () Bool)

(assert (=> b!1029542 m!948471))

(declare-fun m!948473 () Bool)

(assert (=> b!1029542 m!948473))

(declare-fun m!948475 () Bool)

(assert (=> b!1029542 m!948475))

(declare-fun m!948477 () Bool)

(assert (=> b!1029542 m!948477))

(declare-fun m!948479 () Bool)

(assert (=> b!1029542 m!948479))

(declare-fun m!948481 () Bool)

(assert (=> b!1029542 m!948481))

(assert (=> b!1029542 m!948479))

(declare-fun m!948483 () Bool)

(assert (=> b!1029542 m!948483))

(declare-fun m!948485 () Bool)

(assert (=> b!1029542 m!948485))

(declare-fun m!948487 () Bool)

(assert (=> b!1029542 m!948487))

(declare-fun m!948489 () Bool)

(assert (=> b!1029542 m!948489))

(declare-fun m!948491 () Bool)

(assert (=> b!1029542 m!948491))

(declare-fun m!948493 () Bool)

(assert (=> b!1029542 m!948493))

(declare-fun m!948495 () Bool)

(assert (=> b!1029542 m!948495))

(declare-fun m!948497 () Bool)

(assert (=> b!1029542 m!948497))

(check-sat b_and!32917 (not b_next!20599) (not b_lambda!15869) (not b!1029547) tp_is_empty!24319 (not start!89884) (not b!1029542) (not b!1029545) (not mapNonEmpty!37925))
(check-sat b_and!32917 (not b_next!20599))
(get-model)

(declare-fun b_lambda!15875 () Bool)

(assert (= b_lambda!15869 (or (and b!1029545 b_free!20599) b_lambda!15875)))

(check-sat b_and!32917 (not b_next!20599) (not b!1029547) tp_is_empty!24319 (not start!89884) (not b!1029542) (not b_lambda!15875) (not b!1029545) (not mapNonEmpty!37925))
(check-sat b_and!32917 (not b_next!20599))
(get-model)

(declare-fun d!123239 () Bool)

(declare-fun res!688685 () Bool)

(declare-fun e!581337 () Bool)

(assert (=> d!123239 (=> (not res!688685) (not e!581337))))

(declare-fun simpleValid!395 (LongMapFixedSize!5506) Bool)

(assert (=> d!123239 (= res!688685 (simpleValid!395 thiss!1427))))

(assert (=> d!123239 (= (valid!2077 thiss!1427) e!581337)))

(declare-fun b!1029608 () Bool)

(declare-fun res!688686 () Bool)

(assert (=> b!1029608 (=> (not res!688686) (not e!581337))))

(assert (=> b!1029608 (= res!688686 (= (arrayCountValidKeys!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (_size!2808 thiss!1427)))))

(declare-fun b!1029609 () Bool)

(declare-fun res!688687 () Bool)

(assert (=> b!1029609 (=> (not res!688687) (not e!581337))))

(assert (=> b!1029609 (= res!688687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029610 () Bool)

(assert (=> b!1029610 (= e!581337 (arrayNoDuplicates!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 Nil!21858))))

(assert (= (and d!123239 res!688685) b!1029608))

(assert (= (and b!1029608 res!688686) b!1029609))

(assert (= (and b!1029609 res!688687) b!1029610))

(declare-fun m!948587 () Bool)

(assert (=> d!123239 m!948587))

(assert (=> b!1029608 m!948493))

(declare-fun m!948589 () Bool)

(assert (=> b!1029609 m!948589))

(declare-fun m!948591 () Bool)

(assert (=> b!1029610 m!948591))

(assert (=> start!89884 d!123239))

(declare-fun d!123241 () Bool)

(assert (=> d!123241 (= (array_inv!24093 (_keys!11283 thiss!1427)) (bvsge (size!31640 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029545 d!123241))

(declare-fun d!123243 () Bool)

(assert (=> d!123243 (= (array_inv!24094 (_values!6144 thiss!1427)) (bvsge (size!31641 (_values!6144 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029545 d!123243))

(declare-fun b!1029623 () Bool)

(declare-fun e!581346 () SeekEntryResult!9674)

(assert (=> b!1029623 (= e!581346 Undefined!9674)))

(declare-fun b!1029624 () Bool)

(declare-fun e!581345 () SeekEntryResult!9674)

(declare-fun lt!453842 () SeekEntryResult!9674)

(assert (=> b!1029624 (= e!581345 (MissingZero!9674 (index!41069 lt!453842)))))

(declare-fun b!1029625 () Bool)

(declare-fun e!581344 () SeekEntryResult!9674)

(assert (=> b!1029625 (= e!581344 (Found!9674 (index!41069 lt!453842)))))

(declare-fun b!1029626 () Bool)

(assert (=> b!1029626 (= e!581346 e!581344)))

(declare-fun lt!453845 () (_ BitVec 64))

(assert (=> b!1029626 (= lt!453845 (select (arr!31122 (_keys!11283 thiss!1427)) (index!41069 lt!453842)))))

(declare-fun c!104021 () Bool)

(assert (=> b!1029626 (= c!104021 (= lt!453845 key!909))))

(declare-fun d!123245 () Bool)

(declare-fun lt!453843 () SeekEntryResult!9674)

(assert (=> d!123245 (and (or ((_ is MissingVacant!9674) lt!453843) (not ((_ is Found!9674) lt!453843)) (and (bvsge (index!41068 lt!453843) #b00000000000000000000000000000000) (bvslt (index!41068 lt!453843) (size!31640 (_keys!11283 thiss!1427))))) (not ((_ is MissingVacant!9674) lt!453843)) (or (not ((_ is Found!9674) lt!453843)) (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453843)) key!909)))))

(assert (=> d!123245 (= lt!453843 e!581346)))

(declare-fun c!104019 () Bool)

(assert (=> d!123245 (= c!104019 (and ((_ is Intermediate!9674) lt!453842) (undefined!10486 lt!453842)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64637 (_ BitVec 32)) SeekEntryResult!9674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123245 (= lt!453842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29879 thiss!1427)) key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(assert (=> d!123245 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123245 (= (seekEntry!0 key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)) lt!453843)))

(declare-fun b!1029627 () Bool)

(declare-fun lt!453844 () SeekEntryResult!9674)

(assert (=> b!1029627 (= e!581345 (ite ((_ is MissingVacant!9674) lt!453844) (MissingZero!9674 (index!41070 lt!453844)) lt!453844))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64637 (_ BitVec 32)) SeekEntryResult!9674)

(assert (=> b!1029627 (= lt!453844 (seekKeyOrZeroReturnVacant!0 (x!91619 lt!453842) (index!41069 lt!453842) (index!41069 lt!453842) key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029628 () Bool)

(declare-fun c!104020 () Bool)

(assert (=> b!1029628 (= c!104020 (= lt!453845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029628 (= e!581344 e!581345)))

(assert (= (and d!123245 c!104019) b!1029623))

(assert (= (and d!123245 (not c!104019)) b!1029626))

(assert (= (and b!1029626 c!104021) b!1029625))

(assert (= (and b!1029626 (not c!104021)) b!1029628))

(assert (= (and b!1029628 c!104020) b!1029624))

(assert (= (and b!1029628 (not c!104020)) b!1029627))

(declare-fun m!948593 () Bool)

(assert (=> b!1029626 m!948593))

(declare-fun m!948595 () Bool)

(assert (=> d!123245 m!948595))

(declare-fun m!948597 () Bool)

(assert (=> d!123245 m!948597))

(assert (=> d!123245 m!948597))

(declare-fun m!948599 () Bool)

(assert (=> d!123245 m!948599))

(declare-fun m!948601 () Bool)

(assert (=> d!123245 m!948601))

(declare-fun m!948603 () Bool)

(assert (=> b!1029627 m!948603))

(assert (=> b!1029547 d!123245))

(declare-fun d!123247 () Bool)

(declare-fun e!581349 () Bool)

(assert (=> d!123247 e!581349))

(declare-fun res!688690 () Bool)

(assert (=> d!123247 (=> (not res!688690) (not e!581349))))

(assert (=> d!123247 (= res!688690 (and (bvsge (index!41068 lt!453771) #b00000000000000000000000000000000) (bvslt (index!41068 lt!453771) (size!31640 (_keys!11283 thiss!1427)))))))

(declare-fun lt!453848 () Unit!33515)

(declare-fun choose!25 (array!64637 (_ BitVec 32) (_ BitVec 32)) Unit!33515)

(assert (=> d!123247 (= lt!453848 (choose!25 (_keys!11283 thiss!1427) (index!41068 lt!453771) (mask!29879 thiss!1427)))))

(assert (=> d!123247 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123247 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11283 thiss!1427) (index!41068 lt!453771) (mask!29879 thiss!1427)) lt!453848)))

(declare-fun b!1029631 () Bool)

(assert (=> b!1029631 (= e!581349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (mask!29879 thiss!1427)))))

(assert (= (and d!123247 res!688690) b!1029631))

(declare-fun m!948605 () Bool)

(assert (=> d!123247 m!948605))

(assert (=> d!123247 m!948601))

(assert (=> b!1029631 m!948467))

(declare-fun m!948607 () Bool)

(assert (=> b!1029631 m!948607))

(assert (=> b!1029542 d!123247))

(declare-fun d!123249 () Bool)

(assert (=> d!123249 (= (validMask!0 (mask!29879 (_2!7837 lt!453775))) (and (or (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000000000111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000000001111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000000011111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000000111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000001111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000011111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000000111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000001111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000011111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000000111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000001111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000011111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000000111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000001111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000011111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000000111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000001111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000011111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000000111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000001111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000011111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000000111111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000001111111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000011111111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00000111111111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00001111111111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00011111111111111111111111111111) (= (mask!29879 (_2!7837 lt!453775)) #b00111111111111111111111111111111)) (bvsle (mask!29879 (_2!7837 lt!453775)) #b00111111111111111111111111111111)))))

(assert (=> b!1029542 d!123249))

(declare-fun d!123251 () Bool)

(declare-fun lt!453851 () ListLongMap!13761)

(declare-fun contains!5954 (ListLongMap!13761 (_ BitVec 64)) Bool)

(assert (=> d!123251 (not (contains!5954 lt!453851 key!909))))

(declare-fun removeStrictlySorted!54 (List!21860 (_ BitVec 64)) List!21860)

(assert (=> d!123251 (= lt!453851 (ListLongMap!13762 (removeStrictlySorted!54 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))) key!909)))))

(assert (=> d!123251 (= (-!488 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) lt!453851)))

(declare-fun bs!30056 () Bool)

(assert (= bs!30056 d!123251))

(declare-fun m!948609 () Bool)

(assert (=> bs!30056 m!948609))

(declare-fun m!948611 () Bool)

(assert (=> bs!30056 m!948611))

(assert (=> b!1029542 d!123251))

(declare-fun b!1029640 () Bool)

(declare-fun e!581355 () (_ BitVec 32))

(declare-fun e!581354 () (_ BitVec 32))

(assert (=> b!1029640 (= e!581355 e!581354)))

(declare-fun c!104027 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029640 (= c!104027 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029641 () Bool)

(declare-fun call!43472 () (_ BitVec 32))

(assert (=> b!1029641 (= e!581354 (bvadd #b00000000000000000000000000000001 call!43472))))

(declare-fun bm!43469 () Bool)

(assert (=> bm!43469 (= call!43472 (arrayCountValidKeys!0 lt!453777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029642 () Bool)

(assert (=> b!1029642 (= e!581354 call!43472)))

(declare-fun b!1029643 () Bool)

(assert (=> b!1029643 (= e!581355 #b00000000000000000000000000000000)))

(declare-fun d!123253 () Bool)

(declare-fun lt!453854 () (_ BitVec 32))

(assert (=> d!123253 (and (bvsge lt!453854 #b00000000000000000000000000000000) (bvsle lt!453854 (bvsub (size!31640 lt!453777) #b00000000000000000000000000000000)))))

(assert (=> d!123253 (= lt!453854 e!581355)))

(declare-fun c!104026 () Bool)

(assert (=> d!123253 (= c!104026 (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123253 (and (bvsle #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31640 (_keys!11283 thiss!1427)) (size!31640 lt!453777)))))

(assert (=> d!123253 (= (arrayCountValidKeys!0 lt!453777 #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) lt!453854)))

(assert (= (and d!123253 c!104026) b!1029643))

(assert (= (and d!123253 (not c!104026)) b!1029640))

(assert (= (and b!1029640 c!104027) b!1029641))

(assert (= (and b!1029640 (not c!104027)) b!1029642))

(assert (= (or b!1029641 b!1029642) bm!43469))

(declare-fun m!948613 () Bool)

(assert (=> b!1029640 m!948613))

(assert (=> b!1029640 m!948613))

(declare-fun m!948615 () Bool)

(assert (=> b!1029640 m!948615))

(declare-fun m!948617 () Bool)

(assert (=> bm!43469 m!948617))

(assert (=> b!1029542 d!123253))

(declare-fun d!123255 () Bool)

(declare-fun e!581358 () Bool)

(assert (=> d!123255 e!581358))

(declare-fun res!688693 () Bool)

(assert (=> d!123255 (=> (not res!688693) (not e!581358))))

(assert (=> d!123255 (= res!688693 (bvslt (index!41068 lt!453771) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun lt!453857 () Unit!33515)

(declare-fun choose!121 (array!64637 (_ BitVec 32) (_ BitVec 64)) Unit!33515)

(assert (=> d!123255 (= lt!453857 (choose!121 (_keys!11283 thiss!1427) (index!41068 lt!453771) key!909))))

(assert (=> d!123255 (bvsge (index!41068 lt!453771) #b00000000000000000000000000000000)))

(assert (=> d!123255 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11283 thiss!1427) (index!41068 lt!453771) key!909) lt!453857)))

(declare-fun b!1029646 () Bool)

(assert (=> b!1029646 (= e!581358 (not (arrayContainsKey!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123255 res!688693) b!1029646))

(declare-fun m!948619 () Bool)

(assert (=> d!123255 m!948619))

(assert (=> b!1029646 m!948467))

(declare-fun m!948621 () Bool)

(assert (=> b!1029646 m!948621))

(assert (=> b!1029542 d!123255))

(declare-fun b!1029689 () Bool)

(declare-fun e!581388 () Bool)

(declare-fun lt!453909 () ListLongMap!13761)

(declare-fun apply!897 (ListLongMap!13761 (_ BitVec 64)) V!37299)

(assert (=> b!1029689 (= e!581388 (= (apply!897 lt!453909 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5957 thiss!1427)))))

(declare-fun b!1029690 () Bool)

(declare-fun e!581393 () Bool)

(declare-fun e!581390 () Bool)

(assert (=> b!1029690 (= e!581393 e!581390)))

(declare-fun res!688720 () Bool)

(assert (=> b!1029690 (=> (not res!688720) (not e!581390))))

(assert (=> b!1029690 (= res!688720 (contains!5954 lt!453909 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (=> b!1029690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(declare-fun b!1029691 () Bool)

(declare-fun e!581396 () Bool)

(declare-fun call!43491 () Bool)

(assert (=> b!1029691 (= e!581396 (not call!43491))))

(declare-fun b!1029692 () Bool)

(declare-fun e!581392 () ListLongMap!13761)

(declare-fun call!43489 () ListLongMap!13761)

(declare-fun +!3128 (ListLongMap!13761 tuple2!15654) ListLongMap!13761)

(assert (=> b!1029692 (= e!581392 (+!3128 call!43489 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(declare-fun b!1029693 () Bool)

(declare-fun e!581386 () Bool)

(assert (=> b!1029693 (= e!581386 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun d!123257 () Bool)

(declare-fun e!581395 () Bool)

(assert (=> d!123257 e!581395))

(declare-fun res!688712 () Bool)

(assert (=> d!123257 (=> (not res!688712) (not e!581395))))

(assert (=> d!123257 (= res!688712 (or (bvsge #b00000000000000000000000000000000 (size!31640 lt!453777)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))))

(declare-fun lt!453911 () ListLongMap!13761)

(assert (=> d!123257 (= lt!453909 lt!453911)))

(declare-fun lt!453902 () Unit!33515)

(declare-fun e!581394 () Unit!33515)

(assert (=> d!123257 (= lt!453902 e!581394)))

(declare-fun c!104041 () Bool)

(assert (=> d!123257 (= c!104041 e!581386)))

(declare-fun res!688718 () Bool)

(assert (=> d!123257 (=> (not res!688718) (not e!581386))))

(assert (=> d!123257 (= res!688718 (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(assert (=> d!123257 (= lt!453911 e!581392)))

(declare-fun c!104043 () Bool)

(assert (=> d!123257 (= c!104043 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123257 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123257 (= (getCurrentListMap!3863 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!453909)))

(declare-fun bm!43484 () Bool)

(declare-fun call!43492 () Bool)

(assert (=> bm!43484 (= call!43492 (contains!5954 lt!453909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029694 () Bool)

(declare-fun e!581397 () ListLongMap!13761)

(declare-fun call!43493 () ListLongMap!13761)

(assert (=> b!1029694 (= e!581397 call!43493)))

(declare-fun bm!43485 () Bool)

(assert (=> bm!43485 (= call!43491 (contains!5954 lt!453909 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!43487 () ListLongMap!13761)

(declare-fun bm!43486 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3563 (array!64637 array!64639 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) Int) ListLongMap!13761)

(assert (=> bm!43486 (= call!43487 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun bm!43487 () Bool)

(declare-fun call!43490 () ListLongMap!13761)

(assert (=> bm!43487 (= call!43490 call!43487)))

(declare-fun b!1029695 () Bool)

(declare-fun res!688713 () Bool)

(assert (=> b!1029695 (=> (not res!688713) (not e!581395))))

(assert (=> b!1029695 (= res!688713 e!581393)))

(declare-fun res!688719 () Bool)

(assert (=> b!1029695 (=> res!688719 e!581393)))

(declare-fun e!581389 () Bool)

(assert (=> b!1029695 (= res!688719 (not e!581389))))

(declare-fun res!688714 () Bool)

(assert (=> b!1029695 (=> (not res!688714) (not e!581389))))

(assert (=> b!1029695 (= res!688714 (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(declare-fun b!1029696 () Bool)

(declare-fun c!104045 () Bool)

(assert (=> b!1029696 (= c!104045 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581387 () ListLongMap!13761)

(assert (=> b!1029696 (= e!581397 e!581387)))

(declare-fun b!1029697 () Bool)

(assert (=> b!1029697 (= e!581395 e!581396)))

(declare-fun c!104044 () Bool)

(assert (=> b!1029697 (= c!104044 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029698 () Bool)

(declare-fun call!43488 () ListLongMap!13761)

(assert (=> b!1029698 (= e!581387 call!43488)))

(declare-fun b!1029699 () Bool)

(assert (=> b!1029699 (= e!581389 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029700 () Bool)

(assert (=> b!1029700 (= e!581396 e!581388)))

(declare-fun res!688715 () Bool)

(assert (=> b!1029700 (= res!688715 call!43491)))

(assert (=> b!1029700 (=> (not res!688715) (not e!581388))))

(declare-fun b!1029701 () Bool)

(declare-fun lt!453920 () Unit!33515)

(assert (=> b!1029701 (= e!581394 lt!453920)))

(declare-fun lt!453915 () ListLongMap!13761)

(assert (=> b!1029701 (= lt!453915 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453922 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453903 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453903 (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))

(declare-fun lt!453904 () Unit!33515)

(declare-fun addStillContains!616 (ListLongMap!13761 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33515)

(assert (=> b!1029701 (= lt!453904 (addStillContains!616 lt!453915 lt!453922 (zeroValue!5957 thiss!1427) lt!453903))))

(assert (=> b!1029701 (contains!5954 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))) lt!453903)))

(declare-fun lt!453923 () Unit!33515)

(assert (=> b!1029701 (= lt!453923 lt!453904)))

(declare-fun lt!453921 () ListLongMap!13761)

(assert (=> b!1029701 (= lt!453921 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453906 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453906 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453917 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453917 (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))

(declare-fun lt!453910 () Unit!33515)

(declare-fun addApplyDifferent!472 (ListLongMap!13761 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33515)

(assert (=> b!1029701 (= lt!453910 (addApplyDifferent!472 lt!453921 lt!453906 (minValue!5957 thiss!1427) lt!453917))))

(assert (=> b!1029701 (= (apply!897 (+!3128 lt!453921 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))) lt!453917) (apply!897 lt!453921 lt!453917))))

(declare-fun lt!453914 () Unit!33515)

(assert (=> b!1029701 (= lt!453914 lt!453910)))

(declare-fun lt!453907 () ListLongMap!13761)

(assert (=> b!1029701 (= lt!453907 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453912 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453919 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453919 (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))

(declare-fun lt!453913 () Unit!33515)

(assert (=> b!1029701 (= lt!453913 (addApplyDifferent!472 lt!453907 lt!453912 (zeroValue!5957 thiss!1427) lt!453919))))

(assert (=> b!1029701 (= (apply!897 (+!3128 lt!453907 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))) lt!453919) (apply!897 lt!453907 lt!453919))))

(declare-fun lt!453905 () Unit!33515)

(assert (=> b!1029701 (= lt!453905 lt!453913)))

(declare-fun lt!453918 () ListLongMap!13761)

(assert (=> b!1029701 (= lt!453918 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453916 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453916 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453908 () (_ BitVec 64))

(assert (=> b!1029701 (= lt!453908 (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))

(assert (=> b!1029701 (= lt!453920 (addApplyDifferent!472 lt!453918 lt!453916 (minValue!5957 thiss!1427) lt!453908))))

(assert (=> b!1029701 (= (apply!897 (+!3128 lt!453918 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))) lt!453908) (apply!897 lt!453918 lt!453908))))

(declare-fun bm!43488 () Bool)

(declare-fun c!104042 () Bool)

(assert (=> bm!43488 (= call!43489 (+!3128 (ite c!104043 call!43487 (ite c!104042 call!43490 call!43488)) (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun b!1029702 () Bool)

(declare-fun e!581385 () Bool)

(assert (=> b!1029702 (= e!581385 (= (apply!897 lt!453909 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5957 thiss!1427)))))

(declare-fun bm!43489 () Bool)

(assert (=> bm!43489 (= call!43488 call!43490)))

(declare-fun bm!43490 () Bool)

(assert (=> bm!43490 (= call!43493 call!43489)))

(declare-fun b!1029703 () Bool)

(assert (=> b!1029703 (= e!581392 e!581397)))

(assert (=> b!1029703 (= c!104042 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029704 () Bool)

(declare-fun e!581391 () Bool)

(assert (=> b!1029704 (= e!581391 e!581385)))

(declare-fun res!688717 () Bool)

(assert (=> b!1029704 (= res!688717 call!43492)))

(assert (=> b!1029704 (=> (not res!688717) (not e!581385))))

(declare-fun b!1029705 () Bool)

(declare-fun get!16357 (ValueCell!11456 V!37299) V!37299)

(assert (=> b!1029705 (= e!581390 (= (apply!897 lt!453909 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) (get!16357 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31641 lt!453773)))))

(assert (=> b!1029705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(declare-fun b!1029706 () Bool)

(assert (=> b!1029706 (= e!581391 (not call!43492))))

(declare-fun b!1029707 () Bool)

(assert (=> b!1029707 (= e!581387 call!43493)))

(declare-fun b!1029708 () Bool)

(declare-fun Unit!33523 () Unit!33515)

(assert (=> b!1029708 (= e!581394 Unit!33523)))

(declare-fun b!1029709 () Bool)

(declare-fun res!688716 () Bool)

(assert (=> b!1029709 (=> (not res!688716) (not e!581395))))

(assert (=> b!1029709 (= res!688716 e!581391)))

(declare-fun c!104040 () Bool)

(assert (=> b!1029709 (= c!104040 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!123257 c!104043) b!1029692))

(assert (= (and d!123257 (not c!104043)) b!1029703))

(assert (= (and b!1029703 c!104042) b!1029694))

(assert (= (and b!1029703 (not c!104042)) b!1029696))

(assert (= (and b!1029696 c!104045) b!1029707))

(assert (= (and b!1029696 (not c!104045)) b!1029698))

(assert (= (or b!1029707 b!1029698) bm!43489))

(assert (= (or b!1029694 bm!43489) bm!43487))

(assert (= (or b!1029694 b!1029707) bm!43490))

(assert (= (or b!1029692 bm!43487) bm!43486))

(assert (= (or b!1029692 bm!43490) bm!43488))

(assert (= (and d!123257 res!688718) b!1029693))

(assert (= (and d!123257 c!104041) b!1029701))

(assert (= (and d!123257 (not c!104041)) b!1029708))

(assert (= (and d!123257 res!688712) b!1029695))

(assert (= (and b!1029695 res!688714) b!1029699))

(assert (= (and b!1029695 (not res!688719)) b!1029690))

(assert (= (and b!1029690 res!688720) b!1029705))

(assert (= (and b!1029695 res!688713) b!1029709))

(assert (= (and b!1029709 c!104040) b!1029704))

(assert (= (and b!1029709 (not c!104040)) b!1029706))

(assert (= (and b!1029704 res!688717) b!1029702))

(assert (= (or b!1029704 b!1029706) bm!43484))

(assert (= (and b!1029709 res!688716) b!1029697))

(assert (= (and b!1029697 c!104044) b!1029700))

(assert (= (and b!1029697 (not c!104044)) b!1029691))

(assert (= (and b!1029700 res!688715) b!1029689))

(assert (= (or b!1029700 b!1029691) bm!43485))

(declare-fun b_lambda!15877 () Bool)

(assert (=> (not b_lambda!15877) (not b!1029705)))

(assert (=> b!1029705 t!30944))

(declare-fun b_and!32927 () Bool)

(assert (= b_and!32917 (and (=> t!30944 result!14151) b_and!32927)))

(declare-fun m!948623 () Bool)

(assert (=> bm!43486 m!948623))

(declare-fun m!948625 () Bool)

(assert (=> bm!43485 m!948625))

(declare-fun m!948627 () Bool)

(assert (=> b!1029702 m!948627))

(declare-fun m!948629 () Bool)

(assert (=> b!1029692 m!948629))

(assert (=> b!1029699 m!948613))

(assert (=> b!1029699 m!948613))

(assert (=> b!1029699 m!948615))

(declare-fun m!948631 () Bool)

(assert (=> bm!43484 m!948631))

(declare-fun m!948633 () Bool)

(assert (=> b!1029701 m!948633))

(declare-fun m!948635 () Bool)

(assert (=> b!1029701 m!948635))

(declare-fun m!948637 () Bool)

(assert (=> b!1029701 m!948637))

(assert (=> b!1029701 m!948623))

(declare-fun m!948639 () Bool)

(assert (=> b!1029701 m!948639))

(declare-fun m!948641 () Bool)

(assert (=> b!1029701 m!948641))

(declare-fun m!948643 () Bool)

(assert (=> b!1029701 m!948643))

(declare-fun m!948645 () Bool)

(assert (=> b!1029701 m!948645))

(declare-fun m!948647 () Bool)

(assert (=> b!1029701 m!948647))

(assert (=> b!1029701 m!948633))

(declare-fun m!948649 () Bool)

(assert (=> b!1029701 m!948649))

(declare-fun m!948651 () Bool)

(assert (=> b!1029701 m!948651))

(assert (=> b!1029701 m!948613))

(assert (=> b!1029701 m!948651))

(declare-fun m!948653 () Bool)

(assert (=> b!1029701 m!948653))

(declare-fun m!948655 () Bool)

(assert (=> b!1029701 m!948655))

(assert (=> b!1029701 m!948649))

(declare-fun m!948657 () Bool)

(assert (=> b!1029701 m!948657))

(declare-fun m!948659 () Bool)

(assert (=> b!1029701 m!948659))

(declare-fun m!948661 () Bool)

(assert (=> b!1029701 m!948661))

(assert (=> b!1029701 m!948641))

(assert (=> d!123257 m!948601))

(declare-fun m!948663 () Bool)

(assert (=> bm!43488 m!948663))

(assert (=> b!1029693 m!948613))

(assert (=> b!1029693 m!948613))

(assert (=> b!1029693 m!948615))

(assert (=> b!1029690 m!948613))

(assert (=> b!1029690 m!948613))

(declare-fun m!948665 () Bool)

(assert (=> b!1029690 m!948665))

(assert (=> b!1029705 m!948613))

(declare-fun m!948667 () Bool)

(assert (=> b!1029705 m!948667))

(assert (=> b!1029705 m!948487))

(declare-fun m!948669 () Bool)

(assert (=> b!1029705 m!948669))

(assert (=> b!1029705 m!948487))

(declare-fun m!948671 () Bool)

(assert (=> b!1029705 m!948671))

(assert (=> b!1029705 m!948613))

(assert (=> b!1029705 m!948669))

(declare-fun m!948673 () Bool)

(assert (=> b!1029689 m!948673))

(assert (=> b!1029542 d!123257))

(declare-fun b!1029710 () Bool)

(declare-fun e!581399 () (_ BitVec 32))

(declare-fun e!581398 () (_ BitVec 32))

(assert (=> b!1029710 (= e!581399 e!581398)))

(declare-fun c!104047 () Bool)

(assert (=> b!1029710 (= c!104047 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029711 () Bool)

(declare-fun call!43494 () (_ BitVec 32))

(assert (=> b!1029711 (= e!581398 (bvadd #b00000000000000000000000000000001 call!43494))))

(declare-fun bm!43491 () Bool)

(assert (=> bm!43491 (= call!43494 (arrayCountValidKeys!0 (_keys!11283 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029712 () Bool)

(assert (=> b!1029712 (= e!581398 call!43494)))

(declare-fun b!1029713 () Bool)

(assert (=> b!1029713 (= e!581399 #b00000000000000000000000000000000)))

(declare-fun d!123259 () Bool)

(declare-fun lt!453924 () (_ BitVec 32))

(assert (=> d!123259 (and (bvsge lt!453924 #b00000000000000000000000000000000) (bvsle lt!453924 (bvsub (size!31640 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123259 (= lt!453924 e!581399)))

(declare-fun c!104046 () Bool)

(assert (=> d!123259 (= c!104046 (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123259 (and (bvsle #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31640 (_keys!11283 thiss!1427)) (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123259 (= (arrayCountValidKeys!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) lt!453924)))

(assert (= (and d!123259 c!104046) b!1029713))

(assert (= (and d!123259 (not c!104046)) b!1029710))

(assert (= (and b!1029710 c!104047) b!1029711))

(assert (= (and b!1029710 (not c!104047)) b!1029712))

(assert (= (or b!1029711 b!1029712) bm!43491))

(declare-fun m!948675 () Bool)

(assert (=> b!1029710 m!948675))

(assert (=> b!1029710 m!948675))

(declare-fun m!948677 () Bool)

(assert (=> b!1029710 m!948677))

(declare-fun m!948679 () Bool)

(assert (=> bm!43491 m!948679))

(assert (=> b!1029542 d!123259))

(declare-fun d!123261 () Bool)

(declare-fun e!581402 () Bool)

(assert (=> d!123261 e!581402))

(declare-fun res!688723 () Bool)

(assert (=> d!123261 (=> (not res!688723) (not e!581402))))

(assert (=> d!123261 (= res!688723 (and (bvsge (index!41068 lt!453771) #b00000000000000000000000000000000) (bvslt (index!41068 lt!453771) (size!31640 (_keys!11283 thiss!1427)))))))

(declare-fun lt!453927 () Unit!33515)

(declare-fun choose!53 (array!64637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21861) Unit!33515)

(assert (=> d!123261 (= lt!453927 (choose!53 (_keys!11283 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!453771) #b00000000000000000000000000000000 Nil!21858))))

(assert (=> d!123261 (bvslt (size!31640 (_keys!11283 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123261 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11283 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!453771) #b00000000000000000000000000000000 Nil!21858) lt!453927)))

(declare-fun b!1029716 () Bool)

(assert (=> b!1029716 (= e!581402 (arrayNoDuplicates!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000000 Nil!21858))))

(assert (= (and d!123261 res!688723) b!1029716))

(declare-fun m!948681 () Bool)

(assert (=> d!123261 m!948681))

(assert (=> b!1029716 m!948467))

(declare-fun m!948683 () Bool)

(assert (=> b!1029716 m!948683))

(assert (=> b!1029542 d!123261))

(declare-fun d!123263 () Bool)

(declare-fun res!688728 () Bool)

(declare-fun e!581407 () Bool)

(assert (=> d!123263 (=> res!688728 e!581407)))

(assert (=> d!123263 (= res!688728 (= (select (arr!31122 lt!453777) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123263 (= (arrayContainsKey!0 lt!453777 key!909 #b00000000000000000000000000000000) e!581407)))

(declare-fun b!1029721 () Bool)

(declare-fun e!581408 () Bool)

(assert (=> b!1029721 (= e!581407 e!581408)))

(declare-fun res!688729 () Bool)

(assert (=> b!1029721 (=> (not res!688729) (not e!581408))))

(assert (=> b!1029721 (= res!688729 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 lt!453777)))))

(declare-fun b!1029722 () Bool)

(assert (=> b!1029722 (= e!581408 (arrayContainsKey!0 lt!453777 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123263 (not res!688728)) b!1029721))

(assert (= (and b!1029721 res!688729) b!1029722))

(assert (=> d!123263 m!948613))

(declare-fun m!948685 () Bool)

(assert (=> b!1029722 m!948685))

(assert (=> b!1029542 d!123263))

(declare-fun b!1029731 () Bool)

(declare-fun res!688740 () Bool)

(declare-fun e!581413 () Bool)

(assert (=> b!1029731 (=> (not res!688740) (not e!581413))))

(assert (=> b!1029731 (= res!688740 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771))))))

(declare-fun b!1029734 () Bool)

(declare-fun e!581414 () Bool)

(assert (=> b!1029734 (= e!581414 (= (arrayCountValidKeys!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!123265 () Bool)

(assert (=> d!123265 e!581414))

(declare-fun res!688741 () Bool)

(assert (=> d!123265 (=> (not res!688741) (not e!581414))))

(assert (=> d!123265 (= res!688741 (and (bvsge (index!41068 lt!453771) #b00000000000000000000000000000000) (bvslt (index!41068 lt!453771) (size!31640 (_keys!11283 thiss!1427)))))))

(declare-fun lt!453930 () Unit!33515)

(declare-fun choose!82 (array!64637 (_ BitVec 32) (_ BitVec 64)) Unit!33515)

(assert (=> d!123265 (= lt!453930 (choose!82 (_keys!11283 thiss!1427) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123265 e!581413))

(declare-fun res!688738 () Bool)

(assert (=> d!123265 (=> (not res!688738) (not e!581413))))

(assert (=> d!123265 (= res!688738 (and (bvsge (index!41068 lt!453771) #b00000000000000000000000000000000) (bvslt (index!41068 lt!453771) (size!31640 (_keys!11283 thiss!1427)))))))

(assert (=> d!123265 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11283 thiss!1427) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453930)))

(declare-fun b!1029732 () Bool)

(declare-fun res!688739 () Bool)

(assert (=> b!1029732 (=> (not res!688739) (not e!581413))))

(assert (=> b!1029732 (= res!688739 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029733 () Bool)

(assert (=> b!1029733 (= e!581413 (bvslt (size!31640 (_keys!11283 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!123265 res!688738) b!1029731))

(assert (= (and b!1029731 res!688740) b!1029732))

(assert (= (and b!1029732 res!688739) b!1029733))

(assert (= (and d!123265 res!688741) b!1029734))

(declare-fun m!948687 () Bool)

(assert (=> b!1029731 m!948687))

(assert (=> b!1029731 m!948687))

(declare-fun m!948689 () Bool)

(assert (=> b!1029731 m!948689))

(assert (=> b!1029734 m!948467))

(declare-fun m!948691 () Bool)

(assert (=> b!1029734 m!948691))

(assert (=> b!1029734 m!948493))

(declare-fun m!948693 () Bool)

(assert (=> d!123265 m!948693))

(declare-fun m!948695 () Bool)

(assert (=> b!1029732 m!948695))

(assert (=> b!1029542 d!123265))

(declare-fun d!123267 () Bool)

(declare-fun e!581417 () Bool)

(assert (=> d!123267 e!581417))

(declare-fun res!688744 () Bool)

(assert (=> d!123267 (=> (not res!688744) (not e!581417))))

(assert (=> d!123267 (= res!688744 (and (bvsge (index!41068 lt!453771) #b00000000000000000000000000000000) (bvslt (index!41068 lt!453771) (size!31640 (_keys!11283 thiss!1427)))))))

(declare-fun lt!453933 () Unit!33515)

(declare-fun choose!1699 (array!64637 array!64639 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) (_ BitVec 64) Int) Unit!33515)

(assert (=> d!123267 (= lt!453933 (choose!1699 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!41068 lt!453771) key!909 (defaultEntry!6121 thiss!1427)))))

(assert (=> d!123267 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123267 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!13 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!41068 lt!453771) key!909 (defaultEntry!6121 thiss!1427)) lt!453933)))

(declare-fun b!1029737 () Bool)

(assert (=> b!1029737 (= e!581417 (= (-!488 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3863 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))))

(assert (=> b!1029737 (bvslt (index!41068 lt!453771) (size!31641 (_values!6144 thiss!1427)))))

(assert (= (and d!123267 res!688744) b!1029737))

(declare-fun b_lambda!15879 () Bool)

(assert (=> (not b_lambda!15879) (not b!1029737)))

(assert (=> b!1029737 t!30944))

(declare-fun b_and!32929 () Bool)

(assert (= b_and!32927 (and (=> t!30944 result!14151) b_and!32929)))

(declare-fun m!948697 () Bool)

(assert (=> d!123267 m!948697))

(assert (=> d!123267 m!948601))

(assert (=> b!1029737 m!948487))

(assert (=> b!1029737 m!948483))

(declare-fun m!948699 () Bool)

(assert (=> b!1029737 m!948699))

(assert (=> b!1029737 m!948479))

(assert (=> b!1029737 m!948481))

(assert (=> b!1029737 m!948467))

(assert (=> b!1029737 m!948479))

(assert (=> b!1029542 d!123267))

(declare-fun b!1029738 () Bool)

(declare-fun e!581421 () Bool)

(declare-fun lt!453941 () ListLongMap!13761)

(assert (=> b!1029738 (= e!581421 (= (apply!897 lt!453941 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5957 thiss!1427)))))

(declare-fun b!1029739 () Bool)

(declare-fun e!581426 () Bool)

(declare-fun e!581423 () Bool)

(assert (=> b!1029739 (= e!581426 e!581423)))

(declare-fun res!688753 () Bool)

(assert (=> b!1029739 (=> (not res!688753) (not e!581423))))

(assert (=> b!1029739 (= res!688753 (contains!5954 lt!453941 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029740 () Bool)

(declare-fun e!581429 () Bool)

(declare-fun call!43499 () Bool)

(assert (=> b!1029740 (= e!581429 (not call!43499))))

(declare-fun b!1029741 () Bool)

(declare-fun e!581425 () ListLongMap!13761)

(declare-fun call!43497 () ListLongMap!13761)

(assert (=> b!1029741 (= e!581425 (+!3128 call!43497 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(declare-fun b!1029742 () Bool)

(declare-fun e!581419 () Bool)

(assert (=> b!1029742 (= e!581419 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123269 () Bool)

(declare-fun e!581428 () Bool)

(assert (=> d!123269 e!581428))

(declare-fun res!688745 () Bool)

(assert (=> d!123269 (=> (not res!688745) (not e!581428))))

(assert (=> d!123269 (= res!688745 (or (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))))

(declare-fun lt!453943 () ListLongMap!13761)

(assert (=> d!123269 (= lt!453941 lt!453943)))

(declare-fun lt!453934 () Unit!33515)

(declare-fun e!581427 () Unit!33515)

(assert (=> d!123269 (= lt!453934 e!581427)))

(declare-fun c!104049 () Bool)

(assert (=> d!123269 (= c!104049 e!581419)))

(declare-fun res!688751 () Bool)

(assert (=> d!123269 (=> (not res!688751) (not e!581419))))

(assert (=> d!123269 (= res!688751 (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123269 (= lt!453943 e!581425)))

(declare-fun c!104051 () Bool)

(assert (=> d!123269 (= c!104051 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123269 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123269 (= (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!453941)))

(declare-fun bm!43492 () Bool)

(declare-fun call!43500 () Bool)

(assert (=> bm!43492 (= call!43500 (contains!5954 lt!453941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029743 () Bool)

(declare-fun e!581430 () ListLongMap!13761)

(declare-fun call!43501 () ListLongMap!13761)

(assert (=> b!1029743 (= e!581430 call!43501)))

(declare-fun bm!43493 () Bool)

(assert (=> bm!43493 (= call!43499 (contains!5954 lt!453941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43494 () Bool)

(declare-fun call!43495 () ListLongMap!13761)

(assert (=> bm!43494 (= call!43495 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun bm!43495 () Bool)

(declare-fun call!43498 () ListLongMap!13761)

(assert (=> bm!43495 (= call!43498 call!43495)))

(declare-fun b!1029744 () Bool)

(declare-fun res!688746 () Bool)

(assert (=> b!1029744 (=> (not res!688746) (not e!581428))))

(assert (=> b!1029744 (= res!688746 e!581426)))

(declare-fun res!688752 () Bool)

(assert (=> b!1029744 (=> res!688752 e!581426)))

(declare-fun e!581422 () Bool)

(assert (=> b!1029744 (= res!688752 (not e!581422))))

(declare-fun res!688747 () Bool)

(assert (=> b!1029744 (=> (not res!688747) (not e!581422))))

(assert (=> b!1029744 (= res!688747 (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029745 () Bool)

(declare-fun c!104053 () Bool)

(assert (=> b!1029745 (= c!104053 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581420 () ListLongMap!13761)

(assert (=> b!1029745 (= e!581430 e!581420)))

(declare-fun b!1029746 () Bool)

(assert (=> b!1029746 (= e!581428 e!581429)))

(declare-fun c!104052 () Bool)

(assert (=> b!1029746 (= c!104052 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029747 () Bool)

(declare-fun call!43496 () ListLongMap!13761)

(assert (=> b!1029747 (= e!581420 call!43496)))

(declare-fun b!1029748 () Bool)

(assert (=> b!1029748 (= e!581422 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029749 () Bool)

(assert (=> b!1029749 (= e!581429 e!581421)))

(declare-fun res!688748 () Bool)

(assert (=> b!1029749 (= res!688748 call!43499)))

(assert (=> b!1029749 (=> (not res!688748) (not e!581421))))

(declare-fun b!1029750 () Bool)

(declare-fun lt!453952 () Unit!33515)

(assert (=> b!1029750 (= e!581427 lt!453952)))

(declare-fun lt!453947 () ListLongMap!13761)

(assert (=> b!1029750 (= lt!453947 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453954 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453935 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453935 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453936 () Unit!33515)

(assert (=> b!1029750 (= lt!453936 (addStillContains!616 lt!453947 lt!453954 (zeroValue!5957 thiss!1427) lt!453935))))

(assert (=> b!1029750 (contains!5954 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))) lt!453935)))

(declare-fun lt!453955 () Unit!33515)

(assert (=> b!1029750 (= lt!453955 lt!453936)))

(declare-fun lt!453953 () ListLongMap!13761)

(assert (=> b!1029750 (= lt!453953 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453938 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453938 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453949 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453949 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453942 () Unit!33515)

(assert (=> b!1029750 (= lt!453942 (addApplyDifferent!472 lt!453953 lt!453938 (minValue!5957 thiss!1427) lt!453949))))

(assert (=> b!1029750 (= (apply!897 (+!3128 lt!453953 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))) lt!453949) (apply!897 lt!453953 lt!453949))))

(declare-fun lt!453946 () Unit!33515)

(assert (=> b!1029750 (= lt!453946 lt!453942)))

(declare-fun lt!453939 () ListLongMap!13761)

(assert (=> b!1029750 (= lt!453939 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453944 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453951 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453951 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453945 () Unit!33515)

(assert (=> b!1029750 (= lt!453945 (addApplyDifferent!472 lt!453939 lt!453944 (zeroValue!5957 thiss!1427) lt!453951))))

(assert (=> b!1029750 (= (apply!897 (+!3128 lt!453939 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))) lt!453951) (apply!897 lt!453939 lt!453951))))

(declare-fun lt!453937 () Unit!33515)

(assert (=> b!1029750 (= lt!453937 lt!453945)))

(declare-fun lt!453950 () ListLongMap!13761)

(assert (=> b!1029750 (= lt!453950 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!453948 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453948 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453940 () (_ BitVec 64))

(assert (=> b!1029750 (= lt!453940 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029750 (= lt!453952 (addApplyDifferent!472 lt!453950 lt!453948 (minValue!5957 thiss!1427) lt!453940))))

(assert (=> b!1029750 (= (apply!897 (+!3128 lt!453950 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))) lt!453940) (apply!897 lt!453950 lt!453940))))

(declare-fun bm!43496 () Bool)

(declare-fun c!104050 () Bool)

(assert (=> bm!43496 (= call!43497 (+!3128 (ite c!104051 call!43495 (ite c!104050 call!43498 call!43496)) (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun b!1029751 () Bool)

(declare-fun e!581418 () Bool)

(assert (=> b!1029751 (= e!581418 (= (apply!897 lt!453941 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5957 thiss!1427)))))

(declare-fun bm!43497 () Bool)

(assert (=> bm!43497 (= call!43496 call!43498)))

(declare-fun bm!43498 () Bool)

(assert (=> bm!43498 (= call!43501 call!43497)))

(declare-fun b!1029752 () Bool)

(assert (=> b!1029752 (= e!581425 e!581430)))

(assert (=> b!1029752 (= c!104050 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029753 () Bool)

(declare-fun e!581424 () Bool)

(assert (=> b!1029753 (= e!581424 e!581418)))

(declare-fun res!688750 () Bool)

(assert (=> b!1029753 (= res!688750 call!43500)))

(assert (=> b!1029753 (=> (not res!688750) (not e!581418))))

(declare-fun b!1029754 () Bool)

(assert (=> b!1029754 (= e!581423 (= (apply!897 lt!453941 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)) (get!16357 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31641 (_values!6144 thiss!1427))))))

(assert (=> b!1029754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029755 () Bool)

(assert (=> b!1029755 (= e!581424 (not call!43500))))

(declare-fun b!1029756 () Bool)

(assert (=> b!1029756 (= e!581420 call!43501)))

(declare-fun b!1029757 () Bool)

(declare-fun Unit!33524 () Unit!33515)

(assert (=> b!1029757 (= e!581427 Unit!33524)))

(declare-fun b!1029758 () Bool)

(declare-fun res!688749 () Bool)

(assert (=> b!1029758 (=> (not res!688749) (not e!581428))))

(assert (=> b!1029758 (= res!688749 e!581424)))

(declare-fun c!104048 () Bool)

(assert (=> b!1029758 (= c!104048 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!123269 c!104051) b!1029741))

(assert (= (and d!123269 (not c!104051)) b!1029752))

(assert (= (and b!1029752 c!104050) b!1029743))

(assert (= (and b!1029752 (not c!104050)) b!1029745))

(assert (= (and b!1029745 c!104053) b!1029756))

(assert (= (and b!1029745 (not c!104053)) b!1029747))

(assert (= (or b!1029756 b!1029747) bm!43497))

(assert (= (or b!1029743 bm!43497) bm!43495))

(assert (= (or b!1029743 b!1029756) bm!43498))

(assert (= (or b!1029741 bm!43495) bm!43494))

(assert (= (or b!1029741 bm!43498) bm!43496))

(assert (= (and d!123269 res!688751) b!1029742))

(assert (= (and d!123269 c!104049) b!1029750))

(assert (= (and d!123269 (not c!104049)) b!1029757))

(assert (= (and d!123269 res!688745) b!1029744))

(assert (= (and b!1029744 res!688747) b!1029748))

(assert (= (and b!1029744 (not res!688752)) b!1029739))

(assert (= (and b!1029739 res!688753) b!1029754))

(assert (= (and b!1029744 res!688746) b!1029758))

(assert (= (and b!1029758 c!104048) b!1029753))

(assert (= (and b!1029758 (not c!104048)) b!1029755))

(assert (= (and b!1029753 res!688750) b!1029751))

(assert (= (or b!1029753 b!1029755) bm!43492))

(assert (= (and b!1029758 res!688749) b!1029746))

(assert (= (and b!1029746 c!104052) b!1029749))

(assert (= (and b!1029746 (not c!104052)) b!1029740))

(assert (= (and b!1029749 res!688748) b!1029738))

(assert (= (or b!1029749 b!1029740) bm!43493))

(declare-fun b_lambda!15881 () Bool)

(assert (=> (not b_lambda!15881) (not b!1029754)))

(assert (=> b!1029754 t!30944))

(declare-fun b_and!32931 () Bool)

(assert (= b_and!32929 (and (=> t!30944 result!14151) b_and!32931)))

(declare-fun m!948701 () Bool)

(assert (=> bm!43494 m!948701))

(declare-fun m!948703 () Bool)

(assert (=> bm!43493 m!948703))

(declare-fun m!948705 () Bool)

(assert (=> b!1029751 m!948705))

(declare-fun m!948707 () Bool)

(assert (=> b!1029741 m!948707))

(assert (=> b!1029748 m!948675))

(assert (=> b!1029748 m!948675))

(assert (=> b!1029748 m!948677))

(declare-fun m!948709 () Bool)

(assert (=> bm!43492 m!948709))

(declare-fun m!948711 () Bool)

(assert (=> b!1029750 m!948711))

(declare-fun m!948713 () Bool)

(assert (=> b!1029750 m!948713))

(declare-fun m!948715 () Bool)

(assert (=> b!1029750 m!948715))

(assert (=> b!1029750 m!948701))

(declare-fun m!948717 () Bool)

(assert (=> b!1029750 m!948717))

(declare-fun m!948719 () Bool)

(assert (=> b!1029750 m!948719))

(declare-fun m!948721 () Bool)

(assert (=> b!1029750 m!948721))

(declare-fun m!948723 () Bool)

(assert (=> b!1029750 m!948723))

(declare-fun m!948725 () Bool)

(assert (=> b!1029750 m!948725))

(assert (=> b!1029750 m!948711))

(declare-fun m!948727 () Bool)

(assert (=> b!1029750 m!948727))

(declare-fun m!948729 () Bool)

(assert (=> b!1029750 m!948729))

(assert (=> b!1029750 m!948675))

(assert (=> b!1029750 m!948729))

(declare-fun m!948731 () Bool)

(assert (=> b!1029750 m!948731))

(declare-fun m!948733 () Bool)

(assert (=> b!1029750 m!948733))

(assert (=> b!1029750 m!948727))

(declare-fun m!948735 () Bool)

(assert (=> b!1029750 m!948735))

(declare-fun m!948737 () Bool)

(assert (=> b!1029750 m!948737))

(declare-fun m!948739 () Bool)

(assert (=> b!1029750 m!948739))

(assert (=> b!1029750 m!948719))

(assert (=> d!123269 m!948601))

(declare-fun m!948741 () Bool)

(assert (=> bm!43496 m!948741))

(assert (=> b!1029742 m!948675))

(assert (=> b!1029742 m!948675))

(assert (=> b!1029742 m!948677))

(assert (=> b!1029739 m!948675))

(assert (=> b!1029739 m!948675))

(declare-fun m!948743 () Bool)

(assert (=> b!1029739 m!948743))

(assert (=> b!1029754 m!948675))

(declare-fun m!948745 () Bool)

(assert (=> b!1029754 m!948745))

(assert (=> b!1029754 m!948487))

(declare-fun m!948747 () Bool)

(assert (=> b!1029754 m!948747))

(assert (=> b!1029754 m!948487))

(declare-fun m!948749 () Bool)

(assert (=> b!1029754 m!948749))

(assert (=> b!1029754 m!948675))

(assert (=> b!1029754 m!948747))

(declare-fun m!948751 () Bool)

(assert (=> b!1029738 m!948751))

(assert (=> b!1029542 d!123269))

(declare-fun b!1029769 () Bool)

(declare-fun e!581442 () Bool)

(declare-fun call!43504 () Bool)

(assert (=> b!1029769 (= e!581442 call!43504)))

(declare-fun d!123271 () Bool)

(declare-fun res!688762 () Bool)

(declare-fun e!581439 () Bool)

(assert (=> d!123271 (=> res!688762 e!581439)))

(assert (=> d!123271 (= res!688762 (bvsge #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(assert (=> d!123271 (= (arrayNoDuplicates!0 lt!453777 #b00000000000000000000000000000000 Nil!21858) e!581439)))

(declare-fun b!1029770 () Bool)

(declare-fun e!581441 () Bool)

(assert (=> b!1029770 (= e!581441 e!581442)))

(declare-fun c!104056 () Bool)

(assert (=> b!1029770 (= c!104056 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029771 () Bool)

(assert (=> b!1029771 (= e!581439 e!581441)))

(declare-fun res!688760 () Bool)

(assert (=> b!1029771 (=> (not res!688760) (not e!581441))))

(declare-fun e!581440 () Bool)

(assert (=> b!1029771 (= res!688760 (not e!581440))))

(declare-fun res!688761 () Bool)

(assert (=> b!1029771 (=> (not res!688761) (not e!581440))))

(assert (=> b!1029771 (= res!688761 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029772 () Bool)

(assert (=> b!1029772 (= e!581442 call!43504)))

(declare-fun bm!43501 () Bool)

(assert (=> bm!43501 (= call!43504 (arrayNoDuplicates!0 lt!453777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104056 (Cons!21857 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) Nil!21858) Nil!21858)))))

(declare-fun b!1029773 () Bool)

(declare-fun contains!5955 (List!21861 (_ BitVec 64)) Bool)

(assert (=> b!1029773 (= e!581440 (contains!5955 Nil!21858 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (= (and d!123271 (not res!688762)) b!1029771))

(assert (= (and b!1029771 res!688761) b!1029773))

(assert (= (and b!1029771 res!688760) b!1029770))

(assert (= (and b!1029770 c!104056) b!1029772))

(assert (= (and b!1029770 (not c!104056)) b!1029769))

(assert (= (or b!1029772 b!1029769) bm!43501))

(assert (=> b!1029770 m!948613))

(assert (=> b!1029770 m!948613))

(assert (=> b!1029770 m!948615))

(assert (=> b!1029771 m!948613))

(assert (=> b!1029771 m!948613))

(assert (=> b!1029771 m!948615))

(assert (=> bm!43501 m!948613))

(declare-fun m!948753 () Bool)

(assert (=> bm!43501 m!948753))

(assert (=> b!1029773 m!948613))

(assert (=> b!1029773 m!948613))

(declare-fun m!948755 () Bool)

(assert (=> b!1029773 m!948755))

(assert (=> b!1029542 d!123271))

(declare-fun b!1029782 () Bool)

(declare-fun e!581449 () Bool)

(declare-fun e!581450 () Bool)

(assert (=> b!1029782 (= e!581449 e!581450)))

(declare-fun c!104059 () Bool)

(assert (=> b!1029782 (= c!104059 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029783 () Bool)

(declare-fun e!581451 () Bool)

(declare-fun call!43507 () Bool)

(assert (=> b!1029783 (= e!581451 call!43507)))

(declare-fun bm!43504 () Bool)

(assert (=> bm!43504 (= call!43507 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453777 (mask!29879 thiss!1427)))))

(declare-fun b!1029784 () Bool)

(assert (=> b!1029784 (= e!581450 e!581451)))

(declare-fun lt!453962 () (_ BitVec 64))

(assert (=> b!1029784 (= lt!453962 (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))

(declare-fun lt!453964 () Unit!33515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64637 (_ BitVec 64) (_ BitVec 32)) Unit!33515)

(assert (=> b!1029784 (= lt!453964 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453777 lt!453962 #b00000000000000000000000000000000))))

(assert (=> b!1029784 (arrayContainsKey!0 lt!453777 lt!453962 #b00000000000000000000000000000000)))

(declare-fun lt!453963 () Unit!33515)

(assert (=> b!1029784 (= lt!453963 lt!453964)))

(declare-fun res!688767 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64637 (_ BitVec 32)) SeekEntryResult!9674)

(assert (=> b!1029784 (= res!688767 (= (seekEntryOrOpen!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) lt!453777 (mask!29879 thiss!1427)) (Found!9674 #b00000000000000000000000000000000)))))

(assert (=> b!1029784 (=> (not res!688767) (not e!581451))))

(declare-fun d!123273 () Bool)

(declare-fun res!688768 () Bool)

(assert (=> d!123273 (=> res!688768 e!581449)))

(assert (=> d!123273 (= res!688768 (bvsge #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(assert (=> d!123273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453777 (mask!29879 thiss!1427)) e!581449)))

(declare-fun b!1029785 () Bool)

(assert (=> b!1029785 (= e!581450 call!43507)))

(assert (= (and d!123273 (not res!688768)) b!1029782))

(assert (= (and b!1029782 c!104059) b!1029784))

(assert (= (and b!1029782 (not c!104059)) b!1029785))

(assert (= (and b!1029784 res!688767) b!1029783))

(assert (= (or b!1029783 b!1029785) bm!43504))

(assert (=> b!1029782 m!948613))

(assert (=> b!1029782 m!948613))

(assert (=> b!1029782 m!948615))

(declare-fun m!948757 () Bool)

(assert (=> bm!43504 m!948757))

(assert (=> b!1029784 m!948613))

(declare-fun m!948759 () Bool)

(assert (=> b!1029784 m!948759))

(declare-fun m!948761 () Bool)

(assert (=> b!1029784 m!948761))

(assert (=> b!1029784 m!948613))

(declare-fun m!948763 () Bool)

(assert (=> b!1029784 m!948763))

(assert (=> b!1029542 d!123273))

(declare-fun condMapEmpty!37934 () Bool)

(declare-fun mapDefault!37934 () ValueCell!11456)

(assert (=> mapNonEmpty!37925 (= condMapEmpty!37934 (= mapRest!37925 ((as const (Array (_ BitVec 32) ValueCell!11456)) mapDefault!37934)))))

(declare-fun e!581456 () Bool)

(declare-fun mapRes!37934 () Bool)

(assert (=> mapNonEmpty!37925 (= tp!72861 (and e!581456 mapRes!37934))))

(declare-fun b!1029793 () Bool)

(assert (=> b!1029793 (= e!581456 tp_is_empty!24319)))

(declare-fun b!1029792 () Bool)

(declare-fun e!581457 () Bool)

(assert (=> b!1029792 (= e!581457 tp_is_empty!24319)))

(declare-fun mapIsEmpty!37934 () Bool)

(assert (=> mapIsEmpty!37934 mapRes!37934))

(declare-fun mapNonEmpty!37934 () Bool)

(declare-fun tp!72876 () Bool)

(assert (=> mapNonEmpty!37934 (= mapRes!37934 (and tp!72876 e!581457))))

(declare-fun mapKey!37934 () (_ BitVec 32))

(declare-fun mapValue!37934 () ValueCell!11456)

(declare-fun mapRest!37934 () (Array (_ BitVec 32) ValueCell!11456))

(assert (=> mapNonEmpty!37934 (= mapRest!37925 (store mapRest!37934 mapKey!37934 mapValue!37934))))

(assert (= (and mapNonEmpty!37925 condMapEmpty!37934) mapIsEmpty!37934))

(assert (= (and mapNonEmpty!37925 (not condMapEmpty!37934)) mapNonEmpty!37934))

(assert (= (and mapNonEmpty!37934 ((_ is ValueCellFull!11456) mapValue!37934)) b!1029792))

(assert (= (and mapNonEmpty!37925 ((_ is ValueCellFull!11456) mapDefault!37934)) b!1029793))

(declare-fun m!948765 () Bool)

(assert (=> mapNonEmpty!37934 m!948765))

(declare-fun b_lambda!15883 () Bool)

(assert (= b_lambda!15879 (or (and b!1029545 b_free!20599) b_lambda!15883)))

(declare-fun b_lambda!15885 () Bool)

(assert (= b_lambda!15877 (or (and b!1029545 b_free!20599) b_lambda!15885)))

(declare-fun b_lambda!15887 () Bool)

(assert (= b_lambda!15881 (or (and b!1029545 b_free!20599) b_lambda!15887)))

(check-sat (not b_lambda!15885) (not b!1029699) (not b!1029734) (not d!123247) (not b!1029631) (not bm!43494) (not b!1029750) (not b!1029773) (not b!1029771) tp_is_empty!24319 (not d!123267) (not b!1029748) (not bm!43469) (not b!1029610) (not d!123261) (not b!1029741) (not bm!43504) (not d!123257) (not b!1029640) (not b!1029722) (not bm!43501) (not bm!43496) (not b!1029609) (not b!1029646) (not d!123265) (not bm!43493) (not bm!43484) (not d!123245) (not b!1029770) (not b!1029689) (not b!1029737) (not d!123255) (not b!1029693) (not bm!43491) (not b!1029784) (not b!1029732) (not b!1029692) b_and!32931 (not b_next!20599) (not d!123239) (not b!1029702) (not b!1029710) (not bm!43488) (not bm!43485) (not b!1029690) (not b!1029754) (not b!1029738) (not b!1029701) (not b!1029731) (not b_lambda!15883) (not mapNonEmpty!37934) (not b!1029627) (not b!1029608) (not bm!43486) (not b!1029739) (not bm!43492) (not d!123251) (not b_lambda!15887) (not b!1029742) (not b!1029751) (not b_lambda!15875) (not d!123269) (not b!1029782) (not b!1029716) (not b!1029705))
(check-sat b_and!32931 (not b_next!20599))
(get-model)

(declare-fun b!1029803 () Bool)

(declare-fun res!688779 () Bool)

(declare-fun e!581460 () Bool)

(assert (=> b!1029803 (=> (not res!688779) (not e!581460))))

(declare-fun size!31646 (LongMapFixedSize!5506) (_ BitVec 32))

(assert (=> b!1029803 (= res!688779 (bvsge (size!31646 thiss!1427) (_size!2808 thiss!1427)))))

(declare-fun b!1029805 () Bool)

(assert (=> b!1029805 (= e!581460 (and (bvsge (extraKeys!5853 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5853 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2808 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!123275 () Bool)

(declare-fun res!688778 () Bool)

(assert (=> d!123275 (=> (not res!688778) (not e!581460))))

(assert (=> d!123275 (= res!688778 (validMask!0 (mask!29879 thiss!1427)))))

(assert (=> d!123275 (= (simpleValid!395 thiss!1427) e!581460)))

(declare-fun b!1029804 () Bool)

(declare-fun res!688780 () Bool)

(assert (=> b!1029804 (=> (not res!688780) (not e!581460))))

(assert (=> b!1029804 (= res!688780 (= (size!31646 thiss!1427) (bvadd (_size!2808 thiss!1427) (bvsdiv (bvadd (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1029802 () Bool)

(declare-fun res!688777 () Bool)

(assert (=> b!1029802 (=> (not res!688777) (not e!581460))))

(assert (=> b!1029802 (= res!688777 (and (= (size!31641 (_values!6144 thiss!1427)) (bvadd (mask!29879 thiss!1427) #b00000000000000000000000000000001)) (= (size!31640 (_keys!11283 thiss!1427)) (size!31641 (_values!6144 thiss!1427))) (bvsge (_size!2808 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2808 thiss!1427) (bvadd (mask!29879 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!123275 res!688778) b!1029802))

(assert (= (and b!1029802 res!688777) b!1029803))

(assert (= (and b!1029803 res!688779) b!1029804))

(assert (= (and b!1029804 res!688780) b!1029805))

(declare-fun m!948767 () Bool)

(assert (=> b!1029803 m!948767))

(assert (=> d!123275 m!948601))

(assert (=> b!1029804 m!948767))

(assert (=> d!123239 d!123275))

(declare-fun b!1029824 () Bool)

(declare-fun e!581473 () SeekEntryResult!9674)

(assert (=> b!1029824 (= e!581473 (Intermediate!9674 true (toIndex!0 key!909 (mask!29879 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029825 () Bool)

(declare-fun e!581472 () SeekEntryResult!9674)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029825 (= e!581472 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29879 thiss!1427)) #b00000000000000000000000000000000 (mask!29879 thiss!1427)) key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029826 () Bool)

(declare-fun e!581471 () Bool)

(declare-fun lt!453969 () SeekEntryResult!9674)

(assert (=> b!1029826 (= e!581471 (bvsge (x!91619 lt!453969) #b01111111111111111111111111111110))))

(declare-fun b!1029827 () Bool)

(assert (=> b!1029827 (and (bvsge (index!41069 lt!453969) #b00000000000000000000000000000000) (bvslt (index!41069 lt!453969) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun res!688787 () Bool)

(assert (=> b!1029827 (= res!688787 (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41069 lt!453969)) key!909))))

(declare-fun e!581475 () Bool)

(assert (=> b!1029827 (=> res!688787 e!581475)))

(declare-fun e!581474 () Bool)

(assert (=> b!1029827 (= e!581474 e!581475)))

(declare-fun b!1029828 () Bool)

(assert (=> b!1029828 (= e!581471 e!581474)))

(declare-fun res!688789 () Bool)

(assert (=> b!1029828 (= res!688789 (and ((_ is Intermediate!9674) lt!453969) (not (undefined!10486 lt!453969)) (bvslt (x!91619 lt!453969) #b01111111111111111111111111111110) (bvsge (x!91619 lt!453969) #b00000000000000000000000000000000) (bvsge (x!91619 lt!453969) #b00000000000000000000000000000000)))))

(assert (=> b!1029828 (=> (not res!688789) (not e!581474))))

(declare-fun d!123277 () Bool)

(assert (=> d!123277 e!581471))

(declare-fun c!104066 () Bool)

(assert (=> d!123277 (= c!104066 (and ((_ is Intermediate!9674) lt!453969) (undefined!10486 lt!453969)))))

(assert (=> d!123277 (= lt!453969 e!581473)))

(declare-fun c!104068 () Bool)

(assert (=> d!123277 (= c!104068 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!453970 () (_ BitVec 64))

(assert (=> d!123277 (= lt!453970 (select (arr!31122 (_keys!11283 thiss!1427)) (toIndex!0 key!909 (mask!29879 thiss!1427))))))

(assert (=> d!123277 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29879 thiss!1427)) key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)) lt!453969)))

(declare-fun b!1029829 () Bool)

(assert (=> b!1029829 (and (bvsge (index!41069 lt!453969) #b00000000000000000000000000000000) (bvslt (index!41069 lt!453969) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun res!688788 () Bool)

(assert (=> b!1029829 (= res!688788 (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41069 lt!453969)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029829 (=> res!688788 e!581475)))

(declare-fun b!1029830 () Bool)

(assert (=> b!1029830 (= e!581473 e!581472)))

(declare-fun c!104067 () Bool)

(assert (=> b!1029830 (= c!104067 (or (= lt!453970 key!909) (= (bvadd lt!453970 lt!453970) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029831 () Bool)

(assert (=> b!1029831 (= e!581472 (Intermediate!9674 false (toIndex!0 key!909 (mask!29879 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029832 () Bool)

(assert (=> b!1029832 (and (bvsge (index!41069 lt!453969) #b00000000000000000000000000000000) (bvslt (index!41069 lt!453969) (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> b!1029832 (= e!581475 (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41069 lt!453969)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123277 c!104068) b!1029824))

(assert (= (and d!123277 (not c!104068)) b!1029830))

(assert (= (and b!1029830 c!104067) b!1029831))

(assert (= (and b!1029830 (not c!104067)) b!1029825))

(assert (= (and d!123277 c!104066) b!1029826))

(assert (= (and d!123277 (not c!104066)) b!1029828))

(assert (= (and b!1029828 res!688789) b!1029827))

(assert (= (and b!1029827 (not res!688787)) b!1029829))

(assert (= (and b!1029829 (not res!688788)) b!1029832))

(declare-fun m!948769 () Bool)

(assert (=> b!1029827 m!948769))

(assert (=> d!123277 m!948597))

(declare-fun m!948771 () Bool)

(assert (=> d!123277 m!948771))

(assert (=> d!123277 m!948601))

(assert (=> b!1029829 m!948769))

(assert (=> b!1029825 m!948597))

(declare-fun m!948773 () Bool)

(assert (=> b!1029825 m!948773))

(assert (=> b!1029825 m!948773))

(declare-fun m!948775 () Bool)

(assert (=> b!1029825 m!948775))

(assert (=> b!1029832 m!948769))

(assert (=> d!123245 d!123277))

(declare-fun d!123279 () Bool)

(declare-fun lt!453976 () (_ BitVec 32))

(declare-fun lt!453975 () (_ BitVec 32))

(assert (=> d!123279 (= lt!453976 (bvmul (bvxor lt!453975 (bvlshr lt!453975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123279 (= lt!453975 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123279 (and (bvsge (mask!29879 thiss!1427) #b00000000000000000000000000000000) (let ((res!688790 (let ((h!23061 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91652 (bvmul (bvxor h!23061 (bvlshr h!23061 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91652 (bvlshr x!91652 #b00000000000000000000000000001101)) (mask!29879 thiss!1427)))))) (and (bvslt res!688790 (bvadd (mask!29879 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688790 #b00000000000000000000000000000000))))))

(assert (=> d!123279 (= (toIndex!0 key!909 (mask!29879 thiss!1427)) (bvand (bvxor lt!453976 (bvlshr lt!453976 #b00000000000000000000000000001101)) (mask!29879 thiss!1427)))))

(assert (=> d!123245 d!123279))

(declare-fun d!123281 () Bool)

(assert (=> d!123281 (= (validMask!0 (mask!29879 thiss!1427)) (and (or (= (mask!29879 thiss!1427) #b00000000000000000000000000000111) (= (mask!29879 thiss!1427) #b00000000000000000000000000001111) (= (mask!29879 thiss!1427) #b00000000000000000000000000011111) (= (mask!29879 thiss!1427) #b00000000000000000000000000111111) (= (mask!29879 thiss!1427) #b00000000000000000000000001111111) (= (mask!29879 thiss!1427) #b00000000000000000000000011111111) (= (mask!29879 thiss!1427) #b00000000000000000000000111111111) (= (mask!29879 thiss!1427) #b00000000000000000000001111111111) (= (mask!29879 thiss!1427) #b00000000000000000000011111111111) (= (mask!29879 thiss!1427) #b00000000000000000000111111111111) (= (mask!29879 thiss!1427) #b00000000000000000001111111111111) (= (mask!29879 thiss!1427) #b00000000000000000011111111111111) (= (mask!29879 thiss!1427) #b00000000000000000111111111111111) (= (mask!29879 thiss!1427) #b00000000000000001111111111111111) (= (mask!29879 thiss!1427) #b00000000000000011111111111111111) (= (mask!29879 thiss!1427) #b00000000000000111111111111111111) (= (mask!29879 thiss!1427) #b00000000000001111111111111111111) (= (mask!29879 thiss!1427) #b00000000000011111111111111111111) (= (mask!29879 thiss!1427) #b00000000000111111111111111111111) (= (mask!29879 thiss!1427) #b00000000001111111111111111111111) (= (mask!29879 thiss!1427) #b00000000011111111111111111111111) (= (mask!29879 thiss!1427) #b00000000111111111111111111111111) (= (mask!29879 thiss!1427) #b00000001111111111111111111111111) (= (mask!29879 thiss!1427) #b00000011111111111111111111111111) (= (mask!29879 thiss!1427) #b00000111111111111111111111111111) (= (mask!29879 thiss!1427) #b00001111111111111111111111111111) (= (mask!29879 thiss!1427) #b00011111111111111111111111111111) (= (mask!29879 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29879 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123245 d!123281))

(declare-fun d!123283 () Bool)

(declare-fun e!581494 () Bool)

(assert (=> d!123283 e!581494))

(declare-fun res!688801 () Bool)

(assert (=> d!123283 (=> (not res!688801) (not e!581494))))

(declare-fun lt!453993 () ListLongMap!13761)

(assert (=> d!123283 (= res!688801 (not (contains!5954 lt!453993 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!581490 () ListLongMap!13761)

(assert (=> d!123283 (= lt!453993 e!581490)))

(declare-fun c!104077 () Bool)

(assert (=> d!123283 (= c!104077 (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123283 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123283 (= (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!453993)))

(declare-fun b!1029857 () Bool)

(declare-fun e!581491 () Bool)

(assert (=> b!1029857 (= e!581494 e!581491)))

(declare-fun c!104079 () Bool)

(declare-fun e!581496 () Bool)

(assert (=> b!1029857 (= c!104079 e!581496)))

(declare-fun res!688802 () Bool)

(assert (=> b!1029857 (=> (not res!688802) (not e!581496))))

(assert (=> b!1029857 (= res!688802 (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029858 () Bool)

(declare-fun e!581493 () ListLongMap!13761)

(declare-fun call!43510 () ListLongMap!13761)

(assert (=> b!1029858 (= e!581493 call!43510)))

(declare-fun b!1029859 () Bool)

(assert (=> b!1029859 (= e!581490 (ListLongMap!13762 Nil!21857))))

(declare-fun b!1029860 () Bool)

(declare-fun e!581495 () Bool)

(assert (=> b!1029860 (= e!581491 e!581495)))

(assert (=> b!1029860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun res!688800 () Bool)

(assert (=> b!1029860 (= res!688800 (contains!5954 lt!453993 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029860 (=> (not res!688800) (not e!581495))))

(declare-fun b!1029861 () Bool)

(assert (=> b!1029861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> b!1029861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31641 (_values!6144 thiss!1427))))))

(assert (=> b!1029861 (= e!581495 (= (apply!897 lt!453993 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)) (get!16357 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029862 () Bool)

(assert (=> b!1029862 (= e!581496 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029862 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1029863 () Bool)

(declare-fun e!581492 () Bool)

(assert (=> b!1029863 (= e!581492 (= lt!453993 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427))))))

(declare-fun b!1029864 () Bool)

(declare-fun res!688799 () Bool)

(assert (=> b!1029864 (=> (not res!688799) (not e!581494))))

(assert (=> b!1029864 (= res!688799 (not (contains!5954 lt!453993 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!43507 () Bool)

(assert (=> bm!43507 (= call!43510 (getCurrentListMapNoExtraKeys!3563 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427)))))

(declare-fun b!1029865 () Bool)

(declare-fun isEmpty!930 (ListLongMap!13761) Bool)

(assert (=> b!1029865 (= e!581492 (isEmpty!930 lt!453993))))

(declare-fun b!1029866 () Bool)

(assert (=> b!1029866 (= e!581491 e!581492)))

(declare-fun c!104080 () Bool)

(assert (=> b!1029866 (= c!104080 (bvslt #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029867 () Bool)

(declare-fun lt!453995 () Unit!33515)

(declare-fun lt!453996 () Unit!33515)

(assert (=> b!1029867 (= lt!453995 lt!453996)))

(declare-fun lt!453991 () (_ BitVec 64))

(declare-fun lt!453992 () ListLongMap!13761)

(declare-fun lt!453994 () (_ BitVec 64))

(declare-fun lt!453997 () V!37299)

(assert (=> b!1029867 (not (contains!5954 (+!3128 lt!453992 (tuple2!15655 lt!453994 lt!453997)) lt!453991))))

(declare-fun addStillNotContains!242 (ListLongMap!13761 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33515)

(assert (=> b!1029867 (= lt!453996 (addStillNotContains!242 lt!453992 lt!453994 lt!453997 lt!453991))))

(assert (=> b!1029867 (= lt!453991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029867 (= lt!453997 (get!16357 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029867 (= lt!453994 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029867 (= lt!453992 call!43510)))

(assert (=> b!1029867 (= e!581493 (+!3128 call!43510 (tuple2!15655 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000) (get!16357 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029868 () Bool)

(assert (=> b!1029868 (= e!581490 e!581493)))

(declare-fun c!104078 () Bool)

(assert (=> b!1029868 (= c!104078 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123283 c!104077) b!1029859))

(assert (= (and d!123283 (not c!104077)) b!1029868))

(assert (= (and b!1029868 c!104078) b!1029867))

(assert (= (and b!1029868 (not c!104078)) b!1029858))

(assert (= (or b!1029867 b!1029858) bm!43507))

(assert (= (and d!123283 res!688801) b!1029864))

(assert (= (and b!1029864 res!688799) b!1029857))

(assert (= (and b!1029857 res!688802) b!1029862))

(assert (= (and b!1029857 c!104079) b!1029860))

(assert (= (and b!1029857 (not c!104079)) b!1029866))

(assert (= (and b!1029860 res!688800) b!1029861))

(assert (= (and b!1029866 c!104080) b!1029863))

(assert (= (and b!1029866 (not c!104080)) b!1029865))

(declare-fun b_lambda!15889 () Bool)

(assert (=> (not b_lambda!15889) (not b!1029861)))

(assert (=> b!1029861 t!30944))

(declare-fun b_and!32933 () Bool)

(assert (= b_and!32931 (and (=> t!30944 result!14151) b_and!32933)))

(declare-fun b_lambda!15891 () Bool)

(assert (=> (not b_lambda!15891) (not b!1029867)))

(assert (=> b!1029867 t!30944))

(declare-fun b_and!32935 () Bool)

(assert (= b_and!32933 (and (=> t!30944 result!14151) b_and!32935)))

(assert (=> b!1029861 m!948747))

(assert (=> b!1029861 m!948487))

(assert (=> b!1029861 m!948749))

(assert (=> b!1029861 m!948675))

(declare-fun m!948777 () Bool)

(assert (=> b!1029861 m!948777))

(assert (=> b!1029861 m!948675))

(assert (=> b!1029861 m!948487))

(assert (=> b!1029861 m!948747))

(assert (=> b!1029860 m!948675))

(assert (=> b!1029860 m!948675))

(declare-fun m!948779 () Bool)

(assert (=> b!1029860 m!948779))

(declare-fun m!948781 () Bool)

(assert (=> b!1029863 m!948781))

(declare-fun m!948783 () Bool)

(assert (=> b!1029864 m!948783))

(assert (=> bm!43507 m!948781))

(assert (=> b!1029868 m!948675))

(assert (=> b!1029868 m!948675))

(assert (=> b!1029868 m!948677))

(declare-fun m!948785 () Bool)

(assert (=> b!1029865 m!948785))

(assert (=> b!1029867 m!948675))

(declare-fun m!948787 () Bool)

(assert (=> b!1029867 m!948787))

(declare-fun m!948789 () Bool)

(assert (=> b!1029867 m!948789))

(assert (=> b!1029867 m!948747))

(assert (=> b!1029867 m!948487))

(assert (=> b!1029867 m!948749))

(assert (=> b!1029867 m!948787))

(declare-fun m!948791 () Bool)

(assert (=> b!1029867 m!948791))

(declare-fun m!948793 () Bool)

(assert (=> b!1029867 m!948793))

(assert (=> b!1029867 m!948487))

(assert (=> b!1029867 m!948747))

(declare-fun m!948795 () Bool)

(assert (=> d!123283 m!948795))

(assert (=> d!123283 m!948601))

(assert (=> b!1029862 m!948675))

(assert (=> b!1029862 m!948675))

(assert (=> b!1029862 m!948677))

(assert (=> bm!43494 d!123283))

(declare-fun d!123285 () Bool)

(assert (=> d!123285 (= (arrayCountValidKeys!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123285 true))

(declare-fun _$79!17 () Unit!33515)

(assert (=> d!123285 (= (choose!82 (_keys!11283 thiss!1427) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!17)))

(declare-fun bs!30057 () Bool)

(assert (= bs!30057 d!123285))

(assert (=> bs!30057 m!948467))

(assert (=> bs!30057 m!948691))

(assert (=> bs!30057 m!948493))

(assert (=> d!123265 d!123285))

(declare-fun d!123287 () Bool)

(declare-fun e!581501 () Bool)

(assert (=> d!123287 e!581501))

(declare-fun res!688805 () Bool)

(assert (=> d!123287 (=> res!688805 e!581501)))

(declare-fun lt!454007 () Bool)

(assert (=> d!123287 (= res!688805 (not lt!454007))))

(declare-fun lt!454009 () Bool)

(assert (=> d!123287 (= lt!454007 lt!454009)))

(declare-fun lt!454008 () Unit!33515)

(declare-fun e!581502 () Unit!33515)

(assert (=> d!123287 (= lt!454008 e!581502)))

(declare-fun c!104083 () Bool)

(assert (=> d!123287 (= c!104083 lt!454009)))

(declare-fun containsKey!562 (List!21860 (_ BitVec 64)) Bool)

(assert (=> d!123287 (= lt!454009 (containsKey!562 (toList!6896 lt!453909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123287 (= (contains!5954 lt!453909 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454007)))

(declare-fun b!1029875 () Bool)

(declare-fun lt!454006 () Unit!33515)

(assert (=> b!1029875 (= e!581502 lt!454006)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!394 (List!21860 (_ BitVec 64)) Unit!33515)

(assert (=> b!1029875 (= lt!454006 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!640 0))(
  ( (Some!639 (v!14788 V!37299)) (None!638) )
))
(declare-fun isDefined!437 (Option!640) Bool)

(declare-fun getValueByKey!589 (List!21860 (_ BitVec 64)) Option!640)

(assert (=> b!1029875 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029876 () Bool)

(declare-fun Unit!33525 () Unit!33515)

(assert (=> b!1029876 (= e!581502 Unit!33525)))

(declare-fun b!1029877 () Bool)

(assert (=> b!1029877 (= e!581501 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123287 c!104083) b!1029875))

(assert (= (and d!123287 (not c!104083)) b!1029876))

(assert (= (and d!123287 (not res!688805)) b!1029877))

(declare-fun m!948797 () Bool)

(assert (=> d!123287 m!948797))

(declare-fun m!948799 () Bool)

(assert (=> b!1029875 m!948799))

(declare-fun m!948801 () Bool)

(assert (=> b!1029875 m!948801))

(assert (=> b!1029875 m!948801))

(declare-fun m!948803 () Bool)

(assert (=> b!1029875 m!948803))

(assert (=> b!1029877 m!948801))

(assert (=> b!1029877 m!948801))

(assert (=> b!1029877 m!948803))

(assert (=> bm!43485 d!123287))

(declare-fun d!123289 () Bool)

(declare-fun res!688806 () Bool)

(declare-fun e!581503 () Bool)

(assert (=> d!123289 (=> res!688806 e!581503)))

(assert (=> d!123289 (= res!688806 (= (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123289 (= (arrayContainsKey!0 lt!453777 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!581503)))

(declare-fun b!1029878 () Bool)

(declare-fun e!581504 () Bool)

(assert (=> b!1029878 (= e!581503 e!581504)))

(declare-fun res!688807 () Bool)

(assert (=> b!1029878 (=> (not res!688807) (not e!581504))))

(assert (=> b!1029878 (= res!688807 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31640 lt!453777)))))

(declare-fun b!1029879 () Bool)

(assert (=> b!1029879 (= e!581504 (arrayContainsKey!0 lt!453777 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123289 (not res!688806)) b!1029878))

(assert (= (and b!1029878 res!688807) b!1029879))

(declare-fun m!948805 () Bool)

(assert (=> d!123289 m!948805))

(declare-fun m!948807 () Bool)

(assert (=> b!1029879 m!948807))

(assert (=> b!1029722 d!123289))

(declare-fun d!123291 () Bool)

(declare-fun e!581507 () Bool)

(assert (=> d!123291 e!581507))

(declare-fun res!688813 () Bool)

(assert (=> d!123291 (=> (not res!688813) (not e!581507))))

(declare-fun lt!454019 () ListLongMap!13761)

(assert (=> d!123291 (= res!688813 (contains!5954 lt!454019 (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454018 () List!21860)

(assert (=> d!123291 (= lt!454019 (ListLongMap!13762 lt!454018))))

(declare-fun lt!454021 () Unit!33515)

(declare-fun lt!454020 () Unit!33515)

(assert (=> d!123291 (= lt!454021 lt!454020)))

(assert (=> d!123291 (= (getValueByKey!589 lt!454018 (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!279 (List!21860 (_ BitVec 64) V!37299) Unit!33515)

(assert (=> d!123291 (= lt!454020 (lemmaContainsTupThenGetReturnValue!279 lt!454018 (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun insertStrictlySorted!372 (List!21860 (_ BitVec 64) V!37299) List!21860)

(assert (=> d!123291 (= lt!454018 (insertStrictlySorted!372 (toList!6896 call!43489) (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!123291 (= (+!3128 call!43489 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) lt!454019)))

(declare-fun b!1029884 () Bool)

(declare-fun res!688812 () Bool)

(assert (=> b!1029884 (=> (not res!688812) (not e!581507))))

(assert (=> b!1029884 (= res!688812 (= (getValueByKey!589 (toList!6896 lt!454019) (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun b!1029885 () Bool)

(declare-fun contains!5956 (List!21860 tuple2!15654) Bool)

(assert (=> b!1029885 (= e!581507 (contains!5956 (toList!6896 lt!454019) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(assert (= (and d!123291 res!688813) b!1029884))

(assert (= (and b!1029884 res!688812) b!1029885))

(declare-fun m!948809 () Bool)

(assert (=> d!123291 m!948809))

(declare-fun m!948811 () Bool)

(assert (=> d!123291 m!948811))

(declare-fun m!948813 () Bool)

(assert (=> d!123291 m!948813))

(declare-fun m!948815 () Bool)

(assert (=> d!123291 m!948815))

(declare-fun m!948817 () Bool)

(assert (=> b!1029884 m!948817))

(declare-fun m!948819 () Bool)

(assert (=> b!1029885 m!948819))

(assert (=> b!1029692 d!123291))

(declare-fun d!123293 () Bool)

(declare-fun e!581508 () Bool)

(assert (=> d!123293 e!581508))

(declare-fun res!688814 () Bool)

(assert (=> d!123293 (=> res!688814 e!581508)))

(declare-fun lt!454023 () Bool)

(assert (=> d!123293 (= res!688814 (not lt!454023))))

(declare-fun lt!454025 () Bool)

(assert (=> d!123293 (= lt!454023 lt!454025)))

(declare-fun lt!454024 () Unit!33515)

(declare-fun e!581509 () Unit!33515)

(assert (=> d!123293 (= lt!454024 e!581509)))

(declare-fun c!104084 () Bool)

(assert (=> d!123293 (= c!104084 lt!454025)))

(assert (=> d!123293 (= lt!454025 (containsKey!562 (toList!6896 lt!453909) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123293 (= (contains!5954 lt!453909 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454023)))

(declare-fun b!1029886 () Bool)

(declare-fun lt!454022 () Unit!33515)

(assert (=> b!1029886 (= e!581509 lt!454022)))

(assert (=> b!1029886 (= lt!454022 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453909) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029886 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453909) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029887 () Bool)

(declare-fun Unit!33526 () Unit!33515)

(assert (=> b!1029887 (= e!581509 Unit!33526)))

(declare-fun b!1029888 () Bool)

(assert (=> b!1029888 (= e!581508 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123293 c!104084) b!1029886))

(assert (= (and d!123293 (not c!104084)) b!1029887))

(assert (= (and d!123293 (not res!688814)) b!1029888))

(declare-fun m!948821 () Bool)

(assert (=> d!123293 m!948821))

(declare-fun m!948823 () Bool)

(assert (=> b!1029886 m!948823))

(declare-fun m!948825 () Bool)

(assert (=> b!1029886 m!948825))

(assert (=> b!1029886 m!948825))

(declare-fun m!948827 () Bool)

(assert (=> b!1029886 m!948827))

(assert (=> b!1029888 m!948825))

(assert (=> b!1029888 m!948825))

(assert (=> b!1029888 m!948827))

(assert (=> bm!43484 d!123293))

(declare-fun b!1029889 () Bool)

(declare-fun e!581513 () Bool)

(declare-fun call!43511 () Bool)

(assert (=> b!1029889 (= e!581513 call!43511)))

(declare-fun d!123295 () Bool)

(declare-fun res!688817 () Bool)

(declare-fun e!581510 () Bool)

(assert (=> d!123295 (=> res!688817 e!581510)))

(assert (=> d!123295 (= res!688817 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 lt!453777)))))

(assert (=> d!123295 (= (arrayNoDuplicates!0 lt!453777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104056 (Cons!21857 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) Nil!21858) Nil!21858)) e!581510)))

(declare-fun b!1029890 () Bool)

(declare-fun e!581512 () Bool)

(assert (=> b!1029890 (= e!581512 e!581513)))

(declare-fun c!104085 () Bool)

(assert (=> b!1029890 (= c!104085 (validKeyInArray!0 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029891 () Bool)

(assert (=> b!1029891 (= e!581510 e!581512)))

(declare-fun res!688815 () Bool)

(assert (=> b!1029891 (=> (not res!688815) (not e!581512))))

(declare-fun e!581511 () Bool)

(assert (=> b!1029891 (= res!688815 (not e!581511))))

(declare-fun res!688816 () Bool)

(assert (=> b!1029891 (=> (not res!688816) (not e!581511))))

(assert (=> b!1029891 (= res!688816 (validKeyInArray!0 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029892 () Bool)

(assert (=> b!1029892 (= e!581513 call!43511)))

(declare-fun bm!43508 () Bool)

(assert (=> bm!43508 (= call!43511 (arrayNoDuplicates!0 lt!453777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104085 (Cons!21857 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104056 (Cons!21857 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) Nil!21858) Nil!21858)) (ite c!104056 (Cons!21857 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) Nil!21858) Nil!21858))))))

(declare-fun b!1029893 () Bool)

(assert (=> b!1029893 (= e!581511 (contains!5955 (ite c!104056 (Cons!21857 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) Nil!21858) Nil!21858) (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123295 (not res!688817)) b!1029891))

(assert (= (and b!1029891 res!688816) b!1029893))

(assert (= (and b!1029891 res!688815) b!1029890))

(assert (= (and b!1029890 c!104085) b!1029892))

(assert (= (and b!1029890 (not c!104085)) b!1029889))

(assert (= (or b!1029892 b!1029889) bm!43508))

(assert (=> b!1029890 m!948805))

(assert (=> b!1029890 m!948805))

(declare-fun m!948829 () Bool)

(assert (=> b!1029890 m!948829))

(assert (=> b!1029891 m!948805))

(assert (=> b!1029891 m!948805))

(assert (=> b!1029891 m!948829))

(assert (=> bm!43508 m!948805))

(declare-fun m!948831 () Bool)

(assert (=> bm!43508 m!948831))

(assert (=> b!1029893 m!948805))

(assert (=> b!1029893 m!948805))

(declare-fun m!948833 () Bool)

(assert (=> b!1029893 m!948833))

(assert (=> bm!43501 d!123295))

(declare-fun d!123297 () Bool)

(declare-fun e!581514 () Bool)

(assert (=> d!123297 e!581514))

(declare-fun res!688818 () Bool)

(assert (=> d!123297 (=> res!688818 e!581514)))

(declare-fun lt!454027 () Bool)

(assert (=> d!123297 (= res!688818 (not lt!454027))))

(declare-fun lt!454029 () Bool)

(assert (=> d!123297 (= lt!454027 lt!454029)))

(declare-fun lt!454028 () Unit!33515)

(declare-fun e!581515 () Unit!33515)

(assert (=> d!123297 (= lt!454028 e!581515)))

(declare-fun c!104086 () Bool)

(assert (=> d!123297 (= c!104086 lt!454029)))

(assert (=> d!123297 (= lt!454029 (containsKey!562 (toList!6896 lt!453909) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (=> d!123297 (= (contains!5954 lt!453909 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) lt!454027)))

(declare-fun b!1029894 () Bool)

(declare-fun lt!454026 () Unit!33515)

(assert (=> b!1029894 (= e!581515 lt!454026)))

(assert (=> b!1029894 (= lt!454026 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453909) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (=> b!1029894 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453909) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029895 () Bool)

(declare-fun Unit!33527 () Unit!33515)

(assert (=> b!1029895 (= e!581515 Unit!33527)))

(declare-fun b!1029896 () Bool)

(assert (=> b!1029896 (= e!581514 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453909) (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))))

(assert (= (and d!123297 c!104086) b!1029894))

(assert (= (and d!123297 (not c!104086)) b!1029895))

(assert (= (and d!123297 (not res!688818)) b!1029896))

(assert (=> d!123297 m!948613))

(declare-fun m!948835 () Bool)

(assert (=> d!123297 m!948835))

(assert (=> b!1029894 m!948613))

(declare-fun m!948837 () Bool)

(assert (=> b!1029894 m!948837))

(assert (=> b!1029894 m!948613))

(declare-fun m!948839 () Bool)

(assert (=> b!1029894 m!948839))

(assert (=> b!1029894 m!948839))

(declare-fun m!948841 () Bool)

(assert (=> b!1029894 m!948841))

(assert (=> b!1029896 m!948613))

(assert (=> b!1029896 m!948839))

(assert (=> b!1029896 m!948839))

(assert (=> b!1029896 m!948841))

(assert (=> b!1029690 d!123297))

(declare-fun d!123299 () Bool)

(declare-fun get!16358 (Option!640) V!37299)

(assert (=> d!123299 (= (apply!897 lt!453941 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)) (get!16358 (getValueByKey!589 (toList!6896 lt!453941) (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30058 () Bool)

(assert (= bs!30058 d!123299))

(assert (=> bs!30058 m!948675))

(declare-fun m!948843 () Bool)

(assert (=> bs!30058 m!948843))

(assert (=> bs!30058 m!948843))

(declare-fun m!948845 () Bool)

(assert (=> bs!30058 m!948845))

(assert (=> b!1029754 d!123299))

(declare-fun d!123301 () Bool)

(declare-fun c!104089 () Bool)

(assert (=> d!123301 (= c!104089 ((_ is ValueCellFull!11456) (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581518 () V!37299)

(assert (=> d!123301 (= (get!16357 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581518)))

(declare-fun b!1029901 () Bool)

(declare-fun get!16359 (ValueCell!11456 V!37299) V!37299)

(assert (=> b!1029901 (= e!581518 (get!16359 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029902 () Bool)

(declare-fun get!16360 (ValueCell!11456 V!37299) V!37299)

(assert (=> b!1029902 (= e!581518 (get!16360 (select (arr!31123 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123301 c!104089) b!1029901))

(assert (= (and d!123301 (not c!104089)) b!1029902))

(assert (=> b!1029901 m!948747))

(assert (=> b!1029901 m!948487))

(declare-fun m!948847 () Bool)

(assert (=> b!1029901 m!948847))

(assert (=> b!1029902 m!948747))

(assert (=> b!1029902 m!948487))

(declare-fun m!948849 () Bool)

(assert (=> b!1029902 m!948849))

(assert (=> b!1029754 d!123301))

(declare-fun d!123303 () Bool)

(assert (=> d!123303 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1029732 d!123303))

(declare-fun b!1029903 () Bool)

(declare-fun e!581520 () (_ BitVec 32))

(declare-fun e!581519 () (_ BitVec 32))

(assert (=> b!1029903 (= e!581520 e!581519)))

(declare-fun c!104091 () Bool)

(assert (=> b!1029903 (= c!104091 (validKeyInArray!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029904 () Bool)

(declare-fun call!43512 () (_ BitVec 32))

(assert (=> b!1029904 (= e!581519 (bvadd #b00000000000000000000000000000001 call!43512))))

(declare-fun bm!43509 () Bool)

(assert (=> bm!43509 (= call!43512 (arrayCountValidKeys!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029905 () Bool)

(assert (=> b!1029905 (= e!581519 call!43512)))

(declare-fun b!1029906 () Bool)

(assert (=> b!1029906 (= e!581520 #b00000000000000000000000000000000)))

(declare-fun d!123305 () Bool)

(declare-fun lt!454030 () (_ BitVec 32))

(assert (=> d!123305 (and (bvsge lt!454030 #b00000000000000000000000000000000) (bvsle lt!454030 (bvsub (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!123305 (= lt!454030 e!581520)))

(declare-fun c!104090 () Bool)

(assert (=> d!123305 (= c!104090 (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123305 (and (bvsle #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31640 (_keys!11283 thiss!1427)) (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(assert (=> d!123305 (= (arrayCountValidKeys!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))) lt!454030)))

(assert (= (and d!123305 c!104090) b!1029906))

(assert (= (and d!123305 (not c!104090)) b!1029903))

(assert (= (and b!1029903 c!104091) b!1029904))

(assert (= (and b!1029903 (not c!104091)) b!1029905))

(assert (= (or b!1029904 b!1029905) bm!43509))

(declare-fun m!948851 () Bool)

(assert (=> b!1029903 m!948851))

(assert (=> b!1029903 m!948851))

(declare-fun m!948853 () Bool)

(assert (=> b!1029903 m!948853))

(declare-fun m!948855 () Bool)

(assert (=> bm!43509 m!948855))

(assert (=> b!1029734 d!123305))

(assert (=> b!1029734 d!123259))

(declare-fun d!123307 () Bool)

(assert (=> d!123307 (= (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) (and (not (= (select (arr!31122 lt!453777) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31122 lt!453777) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029771 d!123307))

(declare-fun d!123309 () Bool)

(assert (=> d!123309 (= (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029742 d!123309))

(declare-fun d!123311 () Bool)

(declare-fun e!581521 () Bool)

(assert (=> d!123311 e!581521))

(declare-fun res!688819 () Bool)

(assert (=> d!123311 (=> res!688819 e!581521)))

(declare-fun lt!454032 () Bool)

(assert (=> d!123311 (= res!688819 (not lt!454032))))

(declare-fun lt!454034 () Bool)

(assert (=> d!123311 (= lt!454032 lt!454034)))

(declare-fun lt!454033 () Unit!33515)

(declare-fun e!581522 () Unit!33515)

(assert (=> d!123311 (= lt!454033 e!581522)))

(declare-fun c!104092 () Bool)

(assert (=> d!123311 (= c!104092 lt!454034)))

(assert (=> d!123311 (= lt!454034 (containsKey!562 (toList!6896 lt!453941) (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123311 (= (contains!5954 lt!453941 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)) lt!454032)))

(declare-fun b!1029907 () Bool)

(declare-fun lt!454031 () Unit!33515)

(assert (=> b!1029907 (= e!581522 lt!454031)))

(assert (=> b!1029907 (= lt!454031 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453941) (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029907 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453941) (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029908 () Bool)

(declare-fun Unit!33528 () Unit!33515)

(assert (=> b!1029908 (= e!581522 Unit!33528)))

(declare-fun b!1029909 () Bool)

(assert (=> b!1029909 (= e!581521 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453941) (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123311 c!104092) b!1029907))

(assert (= (and d!123311 (not c!104092)) b!1029908))

(assert (= (and d!123311 (not res!688819)) b!1029909))

(assert (=> d!123311 m!948675))

(declare-fun m!948857 () Bool)

(assert (=> d!123311 m!948857))

(assert (=> b!1029907 m!948675))

(declare-fun m!948859 () Bool)

(assert (=> b!1029907 m!948859))

(assert (=> b!1029907 m!948675))

(assert (=> b!1029907 m!948843))

(assert (=> b!1029907 m!948843))

(declare-fun m!948861 () Bool)

(assert (=> b!1029907 m!948861))

(assert (=> b!1029909 m!948675))

(assert (=> b!1029909 m!948843))

(assert (=> b!1029909 m!948843))

(assert (=> b!1029909 m!948861))

(assert (=> b!1029739 d!123311))

(declare-fun d!123313 () Bool)

(assert (=> d!123313 (= (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771))) (and (not (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029731 d!123313))

(declare-fun d!123315 () Bool)

(declare-fun e!581523 () Bool)

(assert (=> d!123315 e!581523))

(declare-fun res!688820 () Bool)

(assert (=> d!123315 (=> res!688820 e!581523)))

(declare-fun lt!454036 () Bool)

(assert (=> d!123315 (= res!688820 (not lt!454036))))

(declare-fun lt!454038 () Bool)

(assert (=> d!123315 (= lt!454036 lt!454038)))

(declare-fun lt!454037 () Unit!33515)

(declare-fun e!581524 () Unit!33515)

(assert (=> d!123315 (= lt!454037 e!581524)))

(declare-fun c!104093 () Bool)

(assert (=> d!123315 (= c!104093 lt!454038)))

(assert (=> d!123315 (= lt!454038 (containsKey!562 (toList!6896 lt!453851) key!909))))

(assert (=> d!123315 (= (contains!5954 lt!453851 key!909) lt!454036)))

(declare-fun b!1029910 () Bool)

(declare-fun lt!454035 () Unit!33515)

(assert (=> b!1029910 (= e!581524 lt!454035)))

(assert (=> b!1029910 (= lt!454035 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453851) key!909))))

(assert (=> b!1029910 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453851) key!909))))

(declare-fun b!1029911 () Bool)

(declare-fun Unit!33529 () Unit!33515)

(assert (=> b!1029911 (= e!581524 Unit!33529)))

(declare-fun b!1029912 () Bool)

(assert (=> b!1029912 (= e!581523 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453851) key!909)))))

(assert (= (and d!123315 c!104093) b!1029910))

(assert (= (and d!123315 (not c!104093)) b!1029911))

(assert (= (and d!123315 (not res!688820)) b!1029912))

(declare-fun m!948863 () Bool)

(assert (=> d!123315 m!948863))

(declare-fun m!948865 () Bool)

(assert (=> b!1029910 m!948865))

(declare-fun m!948867 () Bool)

(assert (=> b!1029910 m!948867))

(assert (=> b!1029910 m!948867))

(declare-fun m!948869 () Bool)

(assert (=> b!1029910 m!948869))

(assert (=> b!1029912 m!948867))

(assert (=> b!1029912 m!948867))

(assert (=> b!1029912 m!948869))

(assert (=> d!123251 d!123315))

(declare-fun b!1029923 () Bool)

(declare-fun e!581533 () Bool)

(declare-fun lt!454041 () List!21860)

(assert (=> b!1029923 (= e!581533 (not (containsKey!562 lt!454041 key!909)))))

(declare-fun b!1029924 () Bool)

(declare-fun e!581532 () List!21860)

(assert (=> b!1029924 (= e!581532 (t!30945 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))))

(declare-fun b!1029925 () Bool)

(declare-fun e!581531 () List!21860)

(declare-fun $colon$colon!603 (List!21860 tuple2!15654) List!21860)

(assert (=> b!1029925 (= e!581531 ($colon$colon!603 (removeStrictlySorted!54 (t!30945 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))) key!909) (h!23057 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))))))

(declare-fun d!123317 () Bool)

(assert (=> d!123317 e!581533))

(declare-fun res!688823 () Bool)

(assert (=> d!123317 (=> (not res!688823) (not e!581533))))

(declare-fun isStrictlySorted!713 (List!21860) Bool)

(assert (=> d!123317 (= res!688823 (isStrictlySorted!713 lt!454041))))

(assert (=> d!123317 (= lt!454041 e!581532)))

(declare-fun c!104099 () Bool)

(assert (=> d!123317 (= c!104099 (and ((_ is Cons!21856) (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))) (= (_1!7838 (h!23057 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))) key!909)))))

(assert (=> d!123317 (isStrictlySorted!713 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))))

(assert (=> d!123317 (= (removeStrictlySorted!54 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))) key!909) lt!454041)))

(declare-fun b!1029926 () Bool)

(assert (=> b!1029926 (= e!581531 Nil!21857)))

(declare-fun b!1029927 () Bool)

(assert (=> b!1029927 (= e!581532 e!581531)))

(declare-fun c!104098 () Bool)

(assert (=> b!1029927 (= c!104098 (and ((_ is Cons!21856) (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))) (not (= (_1!7838 (h!23057 (toList!6896 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))) key!909))))))

(assert (= (and d!123317 c!104099) b!1029924))

(assert (= (and d!123317 (not c!104099)) b!1029927))

(assert (= (and b!1029927 c!104098) b!1029925))

(assert (= (and b!1029927 (not c!104098)) b!1029926))

(assert (= (and d!123317 res!688823) b!1029923))

(declare-fun m!948871 () Bool)

(assert (=> b!1029923 m!948871))

(declare-fun m!948873 () Bool)

(assert (=> b!1029925 m!948873))

(assert (=> b!1029925 m!948873))

(declare-fun m!948875 () Bool)

(assert (=> b!1029925 m!948875))

(declare-fun m!948877 () Bool)

(assert (=> d!123317 m!948877))

(declare-fun m!948879 () Bool)

(assert (=> d!123317 m!948879))

(assert (=> d!123251 d!123317))

(declare-fun d!123319 () Bool)

(declare-fun e!581534 () Bool)

(assert (=> d!123319 e!581534))

(declare-fun res!688825 () Bool)

(assert (=> d!123319 (=> (not res!688825) (not e!581534))))

(declare-fun lt!454043 () ListLongMap!13761)

(assert (=> d!123319 (= res!688825 (contains!5954 lt!454043 (_1!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun lt!454042 () List!21860)

(assert (=> d!123319 (= lt!454043 (ListLongMap!13762 lt!454042))))

(declare-fun lt!454045 () Unit!33515)

(declare-fun lt!454044 () Unit!33515)

(assert (=> d!123319 (= lt!454045 lt!454044)))

(assert (=> d!123319 (= (getValueByKey!589 lt!454042 (_1!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!639 (_2!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123319 (= lt!454044 (lemmaContainsTupThenGetReturnValue!279 lt!454042 (_1!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123319 (= lt!454042 (insertStrictlySorted!372 (toList!6896 (ite c!104043 call!43487 (ite c!104042 call!43490 call!43488))) (_1!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123319 (= (+!3128 (ite c!104043 call!43487 (ite c!104042 call!43490 call!43488)) (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) lt!454043)))

(declare-fun b!1029928 () Bool)

(declare-fun res!688824 () Bool)

(assert (=> b!1029928 (=> (not res!688824) (not e!581534))))

(assert (=> b!1029928 (= res!688824 (= (getValueByKey!589 (toList!6896 lt!454043) (_1!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!639 (_2!7838 (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))))

(declare-fun b!1029929 () Bool)

(assert (=> b!1029929 (= e!581534 (contains!5956 (toList!6896 lt!454043) (ite (or c!104043 c!104042) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (= (and d!123319 res!688825) b!1029928))

(assert (= (and b!1029928 res!688824) b!1029929))

(declare-fun m!948881 () Bool)

(assert (=> d!123319 m!948881))

(declare-fun m!948883 () Bool)

(assert (=> d!123319 m!948883))

(declare-fun m!948885 () Bool)

(assert (=> d!123319 m!948885))

(declare-fun m!948887 () Bool)

(assert (=> d!123319 m!948887))

(declare-fun m!948889 () Bool)

(assert (=> b!1029928 m!948889))

(declare-fun m!948891 () Bool)

(assert (=> b!1029929 m!948891))

(assert (=> bm!43488 d!123319))

(declare-fun d!123321 () Bool)

(assert (=> d!123321 (= (apply!897 lt!453941 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16358 (getValueByKey!589 (toList!6896 lt!453941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30059 () Bool)

(assert (= bs!30059 d!123321))

(declare-fun m!948893 () Bool)

(assert (=> bs!30059 m!948893))

(assert (=> bs!30059 m!948893))

(declare-fun m!948895 () Bool)

(assert (=> bs!30059 m!948895))

(assert (=> b!1029751 d!123321))

(declare-fun d!123323 () Bool)

(assert (=> d!123323 (arrayContainsKey!0 lt!453777 lt!453962 #b00000000000000000000000000000000)))

(declare-fun lt!454048 () Unit!33515)

(declare-fun choose!13 (array!64637 (_ BitVec 64) (_ BitVec 32)) Unit!33515)

(assert (=> d!123323 (= lt!454048 (choose!13 lt!453777 lt!453962 #b00000000000000000000000000000000))))

(assert (=> d!123323 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123323 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453777 lt!453962 #b00000000000000000000000000000000) lt!454048)))

(declare-fun bs!30060 () Bool)

(assert (= bs!30060 d!123323))

(assert (=> bs!30060 m!948761))

(declare-fun m!948897 () Bool)

(assert (=> bs!30060 m!948897))

(assert (=> b!1029784 d!123323))

(declare-fun d!123325 () Bool)

(declare-fun res!688826 () Bool)

(declare-fun e!581535 () Bool)

(assert (=> d!123325 (=> res!688826 e!581535)))

(assert (=> d!123325 (= res!688826 (= (select (arr!31122 lt!453777) #b00000000000000000000000000000000) lt!453962))))

(assert (=> d!123325 (= (arrayContainsKey!0 lt!453777 lt!453962 #b00000000000000000000000000000000) e!581535)))

(declare-fun b!1029930 () Bool)

(declare-fun e!581536 () Bool)

(assert (=> b!1029930 (= e!581535 e!581536)))

(declare-fun res!688827 () Bool)

(assert (=> b!1029930 (=> (not res!688827) (not e!581536))))

(assert (=> b!1029930 (= res!688827 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 lt!453777)))))

(declare-fun b!1029931 () Bool)

(assert (=> b!1029931 (= e!581536 (arrayContainsKey!0 lt!453777 lt!453962 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123325 (not res!688826)) b!1029930))

(assert (= (and b!1029930 res!688827) b!1029931))

(assert (=> d!123325 m!948613))

(declare-fun m!948899 () Bool)

(assert (=> b!1029931 m!948899))

(assert (=> b!1029784 d!123325))

(declare-fun b!1029944 () Bool)

(declare-fun e!581543 () SeekEntryResult!9674)

(declare-fun e!581544 () SeekEntryResult!9674)

(assert (=> b!1029944 (= e!581543 e!581544)))

(declare-fun lt!454055 () (_ BitVec 64))

(declare-fun lt!454057 () SeekEntryResult!9674)

(assert (=> b!1029944 (= lt!454055 (select (arr!31122 lt!453777) (index!41069 lt!454057)))))

(declare-fun c!104106 () Bool)

(assert (=> b!1029944 (= c!104106 (= lt!454055 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1029945 () Bool)

(assert (=> b!1029945 (= e!581544 (Found!9674 (index!41069 lt!454057)))))

(declare-fun e!581545 () SeekEntryResult!9674)

(declare-fun b!1029946 () Bool)

(assert (=> b!1029946 (= e!581545 (seekKeyOrZeroReturnVacant!0 (x!91619 lt!454057) (index!41069 lt!454057) (index!41069 lt!454057) (select (arr!31122 lt!453777) #b00000000000000000000000000000000) lt!453777 (mask!29879 thiss!1427)))))

(declare-fun b!1029947 () Bool)

(declare-fun c!104107 () Bool)

(assert (=> b!1029947 (= c!104107 (= lt!454055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029947 (= e!581544 e!581545)))

(declare-fun d!123327 () Bool)

(declare-fun lt!454056 () SeekEntryResult!9674)

(assert (=> d!123327 (and (or ((_ is Undefined!9674) lt!454056) (not ((_ is Found!9674) lt!454056)) (and (bvsge (index!41068 lt!454056) #b00000000000000000000000000000000) (bvslt (index!41068 lt!454056) (size!31640 lt!453777)))) (or ((_ is Undefined!9674) lt!454056) ((_ is Found!9674) lt!454056) (not ((_ is MissingZero!9674) lt!454056)) (and (bvsge (index!41067 lt!454056) #b00000000000000000000000000000000) (bvslt (index!41067 lt!454056) (size!31640 lt!453777)))) (or ((_ is Undefined!9674) lt!454056) ((_ is Found!9674) lt!454056) ((_ is MissingZero!9674) lt!454056) (not ((_ is MissingVacant!9674) lt!454056)) (and (bvsge (index!41070 lt!454056) #b00000000000000000000000000000000) (bvslt (index!41070 lt!454056) (size!31640 lt!453777)))) (or ((_ is Undefined!9674) lt!454056) (ite ((_ is Found!9674) lt!454056) (= (select (arr!31122 lt!453777) (index!41068 lt!454056)) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9674) lt!454056) (= (select (arr!31122 lt!453777) (index!41067 lt!454056)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9674) lt!454056) (= (select (arr!31122 lt!453777) (index!41070 lt!454056)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!123327 (= lt!454056 e!581543)))

(declare-fun c!104108 () Bool)

(assert (=> d!123327 (= c!104108 (and ((_ is Intermediate!9674) lt!454057) (undefined!10486 lt!454057)))))

(assert (=> d!123327 (= lt!454057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) (mask!29879 thiss!1427)) (select (arr!31122 lt!453777) #b00000000000000000000000000000000) lt!453777 (mask!29879 thiss!1427)))))

(assert (=> d!123327 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123327 (= (seekEntryOrOpen!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) lt!453777 (mask!29879 thiss!1427)) lt!454056)))

(declare-fun b!1029948 () Bool)

(assert (=> b!1029948 (= e!581543 Undefined!9674)))

(declare-fun b!1029949 () Bool)

(assert (=> b!1029949 (= e!581545 (MissingZero!9674 (index!41069 lt!454057)))))

(assert (= (and d!123327 c!104108) b!1029948))

(assert (= (and d!123327 (not c!104108)) b!1029944))

(assert (= (and b!1029944 c!104106) b!1029945))

(assert (= (and b!1029944 (not c!104106)) b!1029947))

(assert (= (and b!1029947 c!104107) b!1029949))

(assert (= (and b!1029947 (not c!104107)) b!1029946))

(declare-fun m!948901 () Bool)

(assert (=> b!1029944 m!948901))

(assert (=> b!1029946 m!948613))

(declare-fun m!948903 () Bool)

(assert (=> b!1029946 m!948903))

(assert (=> d!123327 m!948613))

(declare-fun m!948905 () Bool)

(assert (=> d!123327 m!948905))

(assert (=> d!123327 m!948905))

(assert (=> d!123327 m!948613))

(declare-fun m!948907 () Bool)

(assert (=> d!123327 m!948907))

(declare-fun m!948909 () Bool)

(assert (=> d!123327 m!948909))

(assert (=> d!123327 m!948601))

(declare-fun m!948911 () Bool)

(assert (=> d!123327 m!948911))

(declare-fun m!948913 () Bool)

(assert (=> d!123327 m!948913))

(assert (=> b!1029784 d!123327))

(declare-fun d!123329 () Bool)

(assert (=> d!123329 (= (-!488 (getCurrentListMap!3863 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3863 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(assert (=> d!123329 true))

(declare-fun _$9!44 () Unit!33515)

(assert (=> d!123329 (= (choose!1699 (_keys!11283 thiss!1427) (_values!6144 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!41068 lt!453771) key!909 (defaultEntry!6121 thiss!1427)) _$9!44)))

(declare-fun b_lambda!15893 () Bool)

(assert (=> (not b_lambda!15893) (not d!123329)))

(assert (=> d!123329 t!30944))

(declare-fun b_and!32937 () Bool)

(assert (= b_and!32935 (and (=> t!30944 result!14151) b_and!32937)))

(assert (=> d!123329 m!948479))

(assert (=> d!123329 m!948481))

(assert (=> d!123329 m!948483))

(assert (=> d!123329 m!948487))

(assert (=> d!123329 m!948699))

(assert (=> d!123329 m!948479))

(assert (=> d!123329 m!948467))

(assert (=> d!123267 d!123329))

(assert (=> d!123267 d!123281))

(declare-fun d!123331 () Bool)

(assert (=> d!123331 (contains!5954 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))) lt!453935)))

(declare-fun lt!454060 () Unit!33515)

(declare-fun choose!1700 (ListLongMap!13761 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33515)

(assert (=> d!123331 (= lt!454060 (choose!1700 lt!453947 lt!453954 (zeroValue!5957 thiss!1427) lt!453935))))

(assert (=> d!123331 (contains!5954 lt!453947 lt!453935)))

(assert (=> d!123331 (= (addStillContains!616 lt!453947 lt!453954 (zeroValue!5957 thiss!1427) lt!453935) lt!454060)))

(declare-fun bs!30061 () Bool)

(assert (= bs!30061 d!123331))

(assert (=> bs!30061 m!948711))

(assert (=> bs!30061 m!948711))

(assert (=> bs!30061 m!948713))

(declare-fun m!948915 () Bool)

(assert (=> bs!30061 m!948915))

(declare-fun m!948917 () Bool)

(assert (=> bs!30061 m!948917))

(assert (=> b!1029750 d!123331))

(declare-fun d!123333 () Bool)

(assert (=> d!123333 (= (apply!897 (+!3128 lt!453950 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))) lt!453940) (apply!897 lt!453950 lt!453940))))

(declare-fun lt!454063 () Unit!33515)

(declare-fun choose!1701 (ListLongMap!13761 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33515)

(assert (=> d!123333 (= lt!454063 (choose!1701 lt!453950 lt!453948 (minValue!5957 thiss!1427) lt!453940))))

(declare-fun e!581548 () Bool)

(assert (=> d!123333 e!581548))

(declare-fun res!688830 () Bool)

(assert (=> d!123333 (=> (not res!688830) (not e!581548))))

(assert (=> d!123333 (= res!688830 (contains!5954 lt!453950 lt!453940))))

(assert (=> d!123333 (= (addApplyDifferent!472 lt!453950 lt!453948 (minValue!5957 thiss!1427) lt!453940) lt!454063)))

(declare-fun b!1029954 () Bool)

(assert (=> b!1029954 (= e!581548 (not (= lt!453940 lt!453948)))))

(assert (= (and d!123333 res!688830) b!1029954))

(assert (=> d!123333 m!948715))

(declare-fun m!948919 () Bool)

(assert (=> d!123333 m!948919))

(assert (=> d!123333 m!948729))

(declare-fun m!948921 () Bool)

(assert (=> d!123333 m!948921))

(assert (=> d!123333 m!948729))

(assert (=> d!123333 m!948731))

(assert (=> b!1029750 d!123333))

(declare-fun d!123335 () Bool)

(assert (=> d!123335 (= (apply!897 lt!453953 lt!453949) (get!16358 (getValueByKey!589 (toList!6896 lt!453953) lt!453949)))))

(declare-fun bs!30062 () Bool)

(assert (= bs!30062 d!123335))

(declare-fun m!948923 () Bool)

(assert (=> bs!30062 m!948923))

(assert (=> bs!30062 m!948923))

(declare-fun m!948925 () Bool)

(assert (=> bs!30062 m!948925))

(assert (=> b!1029750 d!123335))

(declare-fun d!123337 () Bool)

(assert (=> d!123337 (= (apply!897 (+!3128 lt!453939 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))) lt!453951) (get!16358 (getValueByKey!589 (toList!6896 (+!3128 lt!453939 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))) lt!453951)))))

(declare-fun bs!30063 () Bool)

(assert (= bs!30063 d!123337))

(declare-fun m!948927 () Bool)

(assert (=> bs!30063 m!948927))

(assert (=> bs!30063 m!948927))

(declare-fun m!948929 () Bool)

(assert (=> bs!30063 m!948929))

(assert (=> b!1029750 d!123337))

(declare-fun d!123339 () Bool)

(assert (=> d!123339 (= (apply!897 (+!3128 lt!453950 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))) lt!453940) (get!16358 (getValueByKey!589 (toList!6896 (+!3128 lt!453950 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))) lt!453940)))))

(declare-fun bs!30064 () Bool)

(assert (= bs!30064 d!123339))

(declare-fun m!948931 () Bool)

(assert (=> bs!30064 m!948931))

(assert (=> bs!30064 m!948931))

(declare-fun m!948933 () Bool)

(assert (=> bs!30064 m!948933))

(assert (=> b!1029750 d!123339))

(declare-fun d!123341 () Bool)

(assert (=> d!123341 (= (apply!897 (+!3128 lt!453939 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))) lt!453951) (apply!897 lt!453939 lt!453951))))

(declare-fun lt!454064 () Unit!33515)

(assert (=> d!123341 (= lt!454064 (choose!1701 lt!453939 lt!453944 (zeroValue!5957 thiss!1427) lt!453951))))

(declare-fun e!581549 () Bool)

(assert (=> d!123341 e!581549))

(declare-fun res!688831 () Bool)

(assert (=> d!123341 (=> (not res!688831) (not e!581549))))

(assert (=> d!123341 (= res!688831 (contains!5954 lt!453939 lt!453951))))

(assert (=> d!123341 (= (addApplyDifferent!472 lt!453939 lt!453944 (zeroValue!5957 thiss!1427) lt!453951) lt!454064)))

(declare-fun b!1029955 () Bool)

(assert (=> b!1029955 (= e!581549 (not (= lt!453951 lt!453944)))))

(assert (= (and d!123341 res!688831) b!1029955))

(assert (=> d!123341 m!948725))

(declare-fun m!948935 () Bool)

(assert (=> d!123341 m!948935))

(assert (=> d!123341 m!948719))

(declare-fun m!948937 () Bool)

(assert (=> d!123341 m!948937))

(assert (=> d!123341 m!948719))

(assert (=> d!123341 m!948721))

(assert (=> b!1029750 d!123341))

(declare-fun d!123343 () Bool)

(declare-fun e!581550 () Bool)

(assert (=> d!123343 e!581550))

(declare-fun res!688832 () Bool)

(assert (=> d!123343 (=> res!688832 e!581550)))

(declare-fun lt!454066 () Bool)

(assert (=> d!123343 (= res!688832 (not lt!454066))))

(declare-fun lt!454068 () Bool)

(assert (=> d!123343 (= lt!454066 lt!454068)))

(declare-fun lt!454067 () Unit!33515)

(declare-fun e!581551 () Unit!33515)

(assert (=> d!123343 (= lt!454067 e!581551)))

(declare-fun c!104109 () Bool)

(assert (=> d!123343 (= c!104109 lt!454068)))

(assert (=> d!123343 (= lt!454068 (containsKey!562 (toList!6896 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))) lt!453935))))

(assert (=> d!123343 (= (contains!5954 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))) lt!453935) lt!454066)))

(declare-fun b!1029956 () Bool)

(declare-fun lt!454065 () Unit!33515)

(assert (=> b!1029956 (= e!581551 lt!454065)))

(assert (=> b!1029956 (= lt!454065 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))) lt!453935))))

(assert (=> b!1029956 (isDefined!437 (getValueByKey!589 (toList!6896 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))) lt!453935))))

(declare-fun b!1029957 () Bool)

(declare-fun Unit!33530 () Unit!33515)

(assert (=> b!1029957 (= e!581551 Unit!33530)))

(declare-fun b!1029958 () Bool)

(assert (=> b!1029958 (= e!581550 (isDefined!437 (getValueByKey!589 (toList!6896 (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))) lt!453935)))))

(assert (= (and d!123343 c!104109) b!1029956))

(assert (= (and d!123343 (not c!104109)) b!1029957))

(assert (= (and d!123343 (not res!688832)) b!1029958))

(declare-fun m!948939 () Bool)

(assert (=> d!123343 m!948939))

(declare-fun m!948941 () Bool)

(assert (=> b!1029956 m!948941))

(declare-fun m!948943 () Bool)

(assert (=> b!1029956 m!948943))

(assert (=> b!1029956 m!948943))

(declare-fun m!948945 () Bool)

(assert (=> b!1029956 m!948945))

(assert (=> b!1029958 m!948943))

(assert (=> b!1029958 m!948943))

(assert (=> b!1029958 m!948945))

(assert (=> b!1029750 d!123343))

(declare-fun d!123345 () Bool)

(assert (=> d!123345 (= (apply!897 (+!3128 lt!453953 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))) lt!453949) (get!16358 (getValueByKey!589 (toList!6896 (+!3128 lt!453953 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))) lt!453949)))))

(declare-fun bs!30065 () Bool)

(assert (= bs!30065 d!123345))

(declare-fun m!948947 () Bool)

(assert (=> bs!30065 m!948947))

(assert (=> bs!30065 m!948947))

(declare-fun m!948949 () Bool)

(assert (=> bs!30065 m!948949))

(assert (=> b!1029750 d!123345))

(declare-fun d!123347 () Bool)

(assert (=> d!123347 (= (apply!897 lt!453939 lt!453951) (get!16358 (getValueByKey!589 (toList!6896 lt!453939) lt!453951)))))

(declare-fun bs!30066 () Bool)

(assert (= bs!30066 d!123347))

(declare-fun m!948951 () Bool)

(assert (=> bs!30066 m!948951))

(assert (=> bs!30066 m!948951))

(declare-fun m!948953 () Bool)

(assert (=> bs!30066 m!948953))

(assert (=> b!1029750 d!123347))

(declare-fun d!123349 () Bool)

(assert (=> d!123349 (= (apply!897 lt!453950 lt!453940) (get!16358 (getValueByKey!589 (toList!6896 lt!453950) lt!453940)))))

(declare-fun bs!30067 () Bool)

(assert (= bs!30067 d!123349))

(declare-fun m!948955 () Bool)

(assert (=> bs!30067 m!948955))

(assert (=> bs!30067 m!948955))

(declare-fun m!948957 () Bool)

(assert (=> bs!30067 m!948957))

(assert (=> b!1029750 d!123349))

(declare-fun d!123351 () Bool)

(assert (=> d!123351 (= (apply!897 (+!3128 lt!453953 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))) lt!453949) (apply!897 lt!453953 lt!453949))))

(declare-fun lt!454069 () Unit!33515)

(assert (=> d!123351 (= lt!454069 (choose!1701 lt!453953 lt!453938 (minValue!5957 thiss!1427) lt!453949))))

(declare-fun e!581552 () Bool)

(assert (=> d!123351 e!581552))

(declare-fun res!688833 () Bool)

(assert (=> d!123351 (=> (not res!688833) (not e!581552))))

(assert (=> d!123351 (= res!688833 (contains!5954 lt!453953 lt!453949))))

(assert (=> d!123351 (= (addApplyDifferent!472 lt!453953 lt!453938 (minValue!5957 thiss!1427) lt!453949) lt!454069)))

(declare-fun b!1029959 () Bool)

(assert (=> b!1029959 (= e!581552 (not (= lt!453949 lt!453938)))))

(assert (= (and d!123351 res!688833) b!1029959))

(assert (=> d!123351 m!948739))

(declare-fun m!948959 () Bool)

(assert (=> d!123351 m!948959))

(assert (=> d!123351 m!948727))

(declare-fun m!948961 () Bool)

(assert (=> d!123351 m!948961))

(assert (=> d!123351 m!948727))

(assert (=> d!123351 m!948735))

(assert (=> b!1029750 d!123351))

(declare-fun d!123353 () Bool)

(declare-fun e!581553 () Bool)

(assert (=> d!123353 e!581553))

(declare-fun res!688835 () Bool)

(assert (=> d!123353 (=> (not res!688835) (not e!581553))))

(declare-fun lt!454071 () ListLongMap!13761)

(assert (=> d!123353 (= res!688835 (contains!5954 lt!454071 (_1!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454070 () List!21860)

(assert (=> d!123353 (= lt!454071 (ListLongMap!13762 lt!454070))))

(declare-fun lt!454073 () Unit!33515)

(declare-fun lt!454072 () Unit!33515)

(assert (=> d!123353 (= lt!454073 lt!454072)))

(assert (=> d!123353 (= (getValueByKey!589 lt!454070 (_1!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))))))

(assert (=> d!123353 (= lt!454072 (lemmaContainsTupThenGetReturnValue!279 lt!454070 (_1!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))))))

(assert (=> d!123353 (= lt!454070 (insertStrictlySorted!372 (toList!6896 lt!453950) (_1!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))))))

(assert (=> d!123353 (= (+!3128 lt!453950 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))) lt!454071)))

(declare-fun b!1029960 () Bool)

(declare-fun res!688834 () Bool)

(assert (=> b!1029960 (=> (not res!688834) (not e!581553))))

(assert (=> b!1029960 (= res!688834 (= (getValueByKey!589 (toList!6896 lt!454071) (_1!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))))))))

(declare-fun b!1029961 () Bool)

(assert (=> b!1029961 (= e!581553 (contains!5956 (toList!6896 lt!454071) (tuple2!15655 lt!453948 (minValue!5957 thiss!1427))))))

(assert (= (and d!123353 res!688835) b!1029960))

(assert (= (and b!1029960 res!688834) b!1029961))

(declare-fun m!948963 () Bool)

(assert (=> d!123353 m!948963))

(declare-fun m!948965 () Bool)

(assert (=> d!123353 m!948965))

(declare-fun m!948967 () Bool)

(assert (=> d!123353 m!948967))

(declare-fun m!948969 () Bool)

(assert (=> d!123353 m!948969))

(declare-fun m!948971 () Bool)

(assert (=> b!1029960 m!948971))

(declare-fun m!948973 () Bool)

(assert (=> b!1029961 m!948973))

(assert (=> b!1029750 d!123353))

(declare-fun d!123355 () Bool)

(declare-fun e!581554 () Bool)

(assert (=> d!123355 e!581554))

(declare-fun res!688837 () Bool)

(assert (=> d!123355 (=> (not res!688837) (not e!581554))))

(declare-fun lt!454075 () ListLongMap!13761)

(assert (=> d!123355 (= res!688837 (contains!5954 lt!454075 (_1!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454074 () List!21860)

(assert (=> d!123355 (= lt!454075 (ListLongMap!13762 lt!454074))))

(declare-fun lt!454077 () Unit!33515)

(declare-fun lt!454076 () Unit!33515)

(assert (=> d!123355 (= lt!454077 lt!454076)))

(assert (=> d!123355 (= (getValueByKey!589 lt!454074 (_1!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123355 (= lt!454076 (lemmaContainsTupThenGetReturnValue!279 lt!454074 (_1!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123355 (= lt!454074 (insertStrictlySorted!372 (toList!6896 lt!453947) (_1!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123355 (= (+!3128 lt!453947 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))) lt!454075)))

(declare-fun b!1029962 () Bool)

(declare-fun res!688836 () Bool)

(assert (=> b!1029962 (=> (not res!688836) (not e!581554))))

(assert (=> b!1029962 (= res!688836 (= (getValueByKey!589 (toList!6896 lt!454075) (_1!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1029963 () Bool)

(assert (=> b!1029963 (= e!581554 (contains!5956 (toList!6896 lt!454075) (tuple2!15655 lt!453954 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!123355 res!688837) b!1029962))

(assert (= (and b!1029962 res!688836) b!1029963))

(declare-fun m!948975 () Bool)

(assert (=> d!123355 m!948975))

(declare-fun m!948977 () Bool)

(assert (=> d!123355 m!948977))

(declare-fun m!948979 () Bool)

(assert (=> d!123355 m!948979))

(declare-fun m!948981 () Bool)

(assert (=> d!123355 m!948981))

(declare-fun m!948983 () Bool)

(assert (=> b!1029962 m!948983))

(declare-fun m!948985 () Bool)

(assert (=> b!1029963 m!948985))

(assert (=> b!1029750 d!123355))

(declare-fun d!123357 () Bool)

(declare-fun e!581555 () Bool)

(assert (=> d!123357 e!581555))

(declare-fun res!688839 () Bool)

(assert (=> d!123357 (=> (not res!688839) (not e!581555))))

(declare-fun lt!454079 () ListLongMap!13761)

(assert (=> d!123357 (= res!688839 (contains!5954 lt!454079 (_1!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454078 () List!21860)

(assert (=> d!123357 (= lt!454079 (ListLongMap!13762 lt!454078))))

(declare-fun lt!454081 () Unit!33515)

(declare-fun lt!454080 () Unit!33515)

(assert (=> d!123357 (= lt!454081 lt!454080)))

(assert (=> d!123357 (= (getValueByKey!589 lt!454078 (_1!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123357 (= lt!454080 (lemmaContainsTupThenGetReturnValue!279 lt!454078 (_1!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123357 (= lt!454078 (insertStrictlySorted!372 (toList!6896 lt!453939) (_1!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123357 (= (+!3128 lt!453939 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))) lt!454079)))

(declare-fun b!1029964 () Bool)

(declare-fun res!688838 () Bool)

(assert (=> b!1029964 (=> (not res!688838) (not e!581555))))

(assert (=> b!1029964 (= res!688838 (= (getValueByKey!589 (toList!6896 lt!454079) (_1!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1029965 () Bool)

(assert (=> b!1029965 (= e!581555 (contains!5956 (toList!6896 lt!454079) (tuple2!15655 lt!453944 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!123357 res!688839) b!1029964))

(assert (= (and b!1029964 res!688838) b!1029965))

(declare-fun m!948987 () Bool)

(assert (=> d!123357 m!948987))

(declare-fun m!948989 () Bool)

(assert (=> d!123357 m!948989))

(declare-fun m!948991 () Bool)

(assert (=> d!123357 m!948991))

(declare-fun m!948993 () Bool)

(assert (=> d!123357 m!948993))

(declare-fun m!948995 () Bool)

(assert (=> b!1029964 m!948995))

(declare-fun m!948997 () Bool)

(assert (=> b!1029965 m!948997))

(assert (=> b!1029750 d!123357))

(declare-fun d!123359 () Bool)

(declare-fun e!581556 () Bool)

(assert (=> d!123359 e!581556))

(declare-fun res!688841 () Bool)

(assert (=> d!123359 (=> (not res!688841) (not e!581556))))

(declare-fun lt!454083 () ListLongMap!13761)

(assert (=> d!123359 (= res!688841 (contains!5954 lt!454083 (_1!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454082 () List!21860)

(assert (=> d!123359 (= lt!454083 (ListLongMap!13762 lt!454082))))

(declare-fun lt!454085 () Unit!33515)

(declare-fun lt!454084 () Unit!33515)

(assert (=> d!123359 (= lt!454085 lt!454084)))

(assert (=> d!123359 (= (getValueByKey!589 lt!454082 (_1!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))))))

(assert (=> d!123359 (= lt!454084 (lemmaContainsTupThenGetReturnValue!279 lt!454082 (_1!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))))))

(assert (=> d!123359 (= lt!454082 (insertStrictlySorted!372 (toList!6896 lt!453953) (_1!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))))))

(assert (=> d!123359 (= (+!3128 lt!453953 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))) lt!454083)))

(declare-fun b!1029966 () Bool)

(declare-fun res!688840 () Bool)

(assert (=> b!1029966 (=> (not res!688840) (not e!581556))))

(assert (=> b!1029966 (= res!688840 (= (getValueByKey!589 (toList!6896 lt!454083) (_1!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))))))))

(declare-fun b!1029967 () Bool)

(assert (=> b!1029967 (= e!581556 (contains!5956 (toList!6896 lt!454083) (tuple2!15655 lt!453938 (minValue!5957 thiss!1427))))))

(assert (= (and d!123359 res!688841) b!1029966))

(assert (= (and b!1029966 res!688840) b!1029967))

(declare-fun m!948999 () Bool)

(assert (=> d!123359 m!948999))

(declare-fun m!949001 () Bool)

(assert (=> d!123359 m!949001))

(declare-fun m!949003 () Bool)

(assert (=> d!123359 m!949003))

(declare-fun m!949005 () Bool)

(assert (=> d!123359 m!949005))

(declare-fun m!949007 () Bool)

(assert (=> b!1029966 m!949007))

(declare-fun m!949009 () Bool)

(assert (=> b!1029967 m!949009))

(assert (=> b!1029750 d!123359))

(assert (=> b!1029750 d!123283))

(assert (=> b!1029737 d!123251))

(assert (=> b!1029737 d!123269))

(declare-fun b!1029968 () Bool)

(declare-fun e!581560 () Bool)

(declare-fun lt!454093 () ListLongMap!13761)

(assert (=> b!1029968 (= e!581560 (= (apply!897 lt!454093 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5957 thiss!1427)))))

(declare-fun b!1029969 () Bool)

(declare-fun e!581565 () Bool)

(declare-fun e!581562 () Bool)

(assert (=> b!1029969 (= e!581565 e!581562)))

(declare-fun res!688850 () Bool)

(assert (=> b!1029969 (=> (not res!688850) (not e!581562))))

(assert (=> b!1029969 (= res!688850 (contains!5954 lt!454093 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1029969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(declare-fun b!1029970 () Bool)

(declare-fun e!581568 () Bool)

(declare-fun call!43517 () Bool)

(assert (=> b!1029970 (= e!581568 (not call!43517))))

(declare-fun b!1029971 () Bool)

(declare-fun e!581564 () ListLongMap!13761)

(declare-fun call!43515 () ListLongMap!13761)

(assert (=> b!1029971 (= e!581564 (+!3128 call!43515 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(declare-fun b!1029972 () Bool)

(declare-fun e!581558 () Bool)

(assert (=> b!1029972 (= e!581558 (validKeyInArray!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!123361 () Bool)

(declare-fun e!581567 () Bool)

(assert (=> d!123361 e!581567))

(declare-fun res!688842 () Bool)

(assert (=> d!123361 (=> (not res!688842) (not e!581567))))

(assert (=> d!123361 (= res!688842 (or (bvsge #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))))

(declare-fun lt!454095 () ListLongMap!13761)

(assert (=> d!123361 (= lt!454093 lt!454095)))

(declare-fun lt!454086 () Unit!33515)

(declare-fun e!581566 () Unit!33515)

(assert (=> d!123361 (= lt!454086 e!581566)))

(declare-fun c!104111 () Bool)

(assert (=> d!123361 (= c!104111 e!581558)))

(declare-fun res!688848 () Bool)

(assert (=> d!123361 (=> (not res!688848) (not e!581558))))

(assert (=> d!123361 (= res!688848 (bvslt #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(assert (=> d!123361 (= lt!454095 e!581564)))

(declare-fun c!104113 () Bool)

(assert (=> d!123361 (= c!104113 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123361 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123361 (= (getCurrentListMap!3863 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454093)))

(declare-fun bm!43510 () Bool)

(declare-fun call!43518 () Bool)

(assert (=> bm!43510 (= call!43518 (contains!5954 lt!454093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029973 () Bool)

(declare-fun e!581569 () ListLongMap!13761)

(declare-fun call!43519 () ListLongMap!13761)

(assert (=> b!1029973 (= e!581569 call!43519)))

(declare-fun bm!43511 () Bool)

(assert (=> bm!43511 (= call!43517 (contains!5954 lt!454093 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43512 () Bool)

(declare-fun call!43513 () ListLongMap!13761)

(assert (=> bm!43512 (= call!43513 (getCurrentListMapNoExtraKeys!3563 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun bm!43513 () Bool)

(declare-fun call!43516 () ListLongMap!13761)

(assert (=> bm!43513 (= call!43516 call!43513)))

(declare-fun b!1029974 () Bool)

(declare-fun res!688843 () Bool)

(assert (=> b!1029974 (=> (not res!688843) (not e!581567))))

(assert (=> b!1029974 (= res!688843 e!581565)))

(declare-fun res!688849 () Bool)

(assert (=> b!1029974 (=> res!688849 e!581565)))

(declare-fun e!581561 () Bool)

(assert (=> b!1029974 (= res!688849 (not e!581561))))

(declare-fun res!688844 () Bool)

(assert (=> b!1029974 (=> (not res!688844) (not e!581561))))

(assert (=> b!1029974 (= res!688844 (bvslt #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(declare-fun b!1029975 () Bool)

(declare-fun c!104115 () Bool)

(assert (=> b!1029975 (= c!104115 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581559 () ListLongMap!13761)

(assert (=> b!1029975 (= e!581569 e!581559)))

(declare-fun b!1029976 () Bool)

(assert (=> b!1029976 (= e!581567 e!581568)))

(declare-fun c!104114 () Bool)

(assert (=> b!1029976 (= c!104114 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029977 () Bool)

(declare-fun call!43514 () ListLongMap!13761)

(assert (=> b!1029977 (= e!581559 call!43514)))

(declare-fun b!1029978 () Bool)

(assert (=> b!1029978 (= e!581561 (validKeyInArray!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029979 () Bool)

(assert (=> b!1029979 (= e!581568 e!581560)))

(declare-fun res!688845 () Bool)

(assert (=> b!1029979 (= res!688845 call!43517)))

(assert (=> b!1029979 (=> (not res!688845) (not e!581560))))

(declare-fun b!1029980 () Bool)

(declare-fun lt!454104 () Unit!33515)

(assert (=> b!1029980 (= e!581566 lt!454104)))

(declare-fun lt!454099 () ListLongMap!13761)

(assert (=> b!1029980 (= lt!454099 (getCurrentListMapNoExtraKeys!3563 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454106 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454087 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454087 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454088 () Unit!33515)

(assert (=> b!1029980 (= lt!454088 (addStillContains!616 lt!454099 lt!454106 (zeroValue!5957 thiss!1427) lt!454087))))

(assert (=> b!1029980 (contains!5954 (+!3128 lt!454099 (tuple2!15655 lt!454106 (zeroValue!5957 thiss!1427))) lt!454087)))

(declare-fun lt!454107 () Unit!33515)

(assert (=> b!1029980 (= lt!454107 lt!454088)))

(declare-fun lt!454105 () ListLongMap!13761)

(assert (=> b!1029980 (= lt!454105 (getCurrentListMapNoExtraKeys!3563 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454090 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454090 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454101 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454101 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454094 () Unit!33515)

(assert (=> b!1029980 (= lt!454094 (addApplyDifferent!472 lt!454105 lt!454090 (minValue!5957 thiss!1427) lt!454101))))

(assert (=> b!1029980 (= (apply!897 (+!3128 lt!454105 (tuple2!15655 lt!454090 (minValue!5957 thiss!1427))) lt!454101) (apply!897 lt!454105 lt!454101))))

(declare-fun lt!454098 () Unit!33515)

(assert (=> b!1029980 (= lt!454098 lt!454094)))

(declare-fun lt!454091 () ListLongMap!13761)

(assert (=> b!1029980 (= lt!454091 (getCurrentListMapNoExtraKeys!3563 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454096 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454103 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454103 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454097 () Unit!33515)

(assert (=> b!1029980 (= lt!454097 (addApplyDifferent!472 lt!454091 lt!454096 (zeroValue!5957 thiss!1427) lt!454103))))

(assert (=> b!1029980 (= (apply!897 (+!3128 lt!454091 (tuple2!15655 lt!454096 (zeroValue!5957 thiss!1427))) lt!454103) (apply!897 lt!454091 lt!454103))))

(declare-fun lt!454089 () Unit!33515)

(assert (=> b!1029980 (= lt!454089 lt!454097)))

(declare-fun lt!454102 () ListLongMap!13761)

(assert (=> b!1029980 (= lt!454102 (getCurrentListMapNoExtraKeys!3563 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454100 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454100 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454092 () (_ BitVec 64))

(assert (=> b!1029980 (= lt!454092 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1029980 (= lt!454104 (addApplyDifferent!472 lt!454102 lt!454100 (minValue!5957 thiss!1427) lt!454092))))

(assert (=> b!1029980 (= (apply!897 (+!3128 lt!454102 (tuple2!15655 lt!454100 (minValue!5957 thiss!1427))) lt!454092) (apply!897 lt!454102 lt!454092))))

(declare-fun c!104112 () Bool)

(declare-fun bm!43514 () Bool)

(assert (=> bm!43514 (= call!43515 (+!3128 (ite c!104113 call!43513 (ite c!104112 call!43516 call!43514)) (ite (or c!104113 c!104112) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun b!1029981 () Bool)

(declare-fun e!581557 () Bool)

(assert (=> b!1029981 (= e!581557 (= (apply!897 lt!454093 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5957 thiss!1427)))))

(declare-fun bm!43515 () Bool)

(assert (=> bm!43515 (= call!43514 call!43516)))

(declare-fun bm!43516 () Bool)

(assert (=> bm!43516 (= call!43519 call!43515)))

(declare-fun b!1029982 () Bool)

(assert (=> b!1029982 (= e!581564 e!581569)))

(assert (=> b!1029982 (= c!104112 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029983 () Bool)

(declare-fun e!581563 () Bool)

(assert (=> b!1029983 (= e!581563 e!581557)))

(declare-fun res!688847 () Bool)

(assert (=> b!1029983 (= res!688847 call!43518)))

(assert (=> b!1029983 (=> (not res!688847) (not e!581557))))

(declare-fun b!1029984 () Bool)

(assert (=> b!1029984 (= e!581562 (= (apply!897 lt!454093 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)) (get!16357 (select (arr!31123 (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31641 (array!64640 (store (arr!31123 (_values!6144 thiss!1427)) (index!41068 lt!453771) (ValueCellFull!11456 (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31641 (_values!6144 thiss!1427))))))))

(assert (=> b!1029984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(declare-fun b!1029985 () Bool)

(assert (=> b!1029985 (= e!581563 (not call!43518))))

(declare-fun b!1029986 () Bool)

(assert (=> b!1029986 (= e!581559 call!43519)))

(declare-fun b!1029987 () Bool)

(declare-fun Unit!33531 () Unit!33515)

(assert (=> b!1029987 (= e!581566 Unit!33531)))

(declare-fun b!1029988 () Bool)

(declare-fun res!688846 () Bool)

(assert (=> b!1029988 (=> (not res!688846) (not e!581567))))

(assert (=> b!1029988 (= res!688846 e!581563)))

(declare-fun c!104110 () Bool)

(assert (=> b!1029988 (= c!104110 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!123361 c!104113) b!1029971))

(assert (= (and d!123361 (not c!104113)) b!1029982))

(assert (= (and b!1029982 c!104112) b!1029973))

(assert (= (and b!1029982 (not c!104112)) b!1029975))

(assert (= (and b!1029975 c!104115) b!1029986))

(assert (= (and b!1029975 (not c!104115)) b!1029977))

(assert (= (or b!1029986 b!1029977) bm!43515))

(assert (= (or b!1029973 bm!43515) bm!43513))

(assert (= (or b!1029973 b!1029986) bm!43516))

(assert (= (or b!1029971 bm!43513) bm!43512))

(assert (= (or b!1029971 bm!43516) bm!43514))

(assert (= (and d!123361 res!688848) b!1029972))

(assert (= (and d!123361 c!104111) b!1029980))

(assert (= (and d!123361 (not c!104111)) b!1029987))

(assert (= (and d!123361 res!688842) b!1029974))

(assert (= (and b!1029974 res!688844) b!1029978))

(assert (= (and b!1029974 (not res!688849)) b!1029969))

(assert (= (and b!1029969 res!688850) b!1029984))

(assert (= (and b!1029974 res!688843) b!1029988))

(assert (= (and b!1029988 c!104110) b!1029983))

(assert (= (and b!1029988 (not c!104110)) b!1029985))

(assert (= (and b!1029983 res!688847) b!1029981))

(assert (= (or b!1029983 b!1029985) bm!43510))

(assert (= (and b!1029988 res!688846) b!1029976))

(assert (= (and b!1029976 c!104114) b!1029979))

(assert (= (and b!1029976 (not c!104114)) b!1029970))

(assert (= (and b!1029979 res!688845) b!1029968))

(assert (= (or b!1029979 b!1029970) bm!43511))

(declare-fun b_lambda!15895 () Bool)

(assert (=> (not b_lambda!15895) (not b!1029984)))

(assert (=> b!1029984 t!30944))

(declare-fun b_and!32939 () Bool)

(assert (= b_and!32937 (and (=> t!30944 result!14151) b_and!32939)))

(declare-fun m!949011 () Bool)

(assert (=> bm!43512 m!949011))

(declare-fun m!949013 () Bool)

(assert (=> bm!43511 m!949013))

(declare-fun m!949015 () Bool)

(assert (=> b!1029981 m!949015))

(declare-fun m!949017 () Bool)

(assert (=> b!1029971 m!949017))

(assert (=> b!1029978 m!948851))

(assert (=> b!1029978 m!948851))

(assert (=> b!1029978 m!948853))

(declare-fun m!949019 () Bool)

(assert (=> bm!43510 m!949019))

(declare-fun m!949021 () Bool)

(assert (=> b!1029980 m!949021))

(declare-fun m!949023 () Bool)

(assert (=> b!1029980 m!949023))

(declare-fun m!949025 () Bool)

(assert (=> b!1029980 m!949025))

(assert (=> b!1029980 m!949011))

(declare-fun m!949027 () Bool)

(assert (=> b!1029980 m!949027))

(declare-fun m!949029 () Bool)

(assert (=> b!1029980 m!949029))

(declare-fun m!949031 () Bool)

(assert (=> b!1029980 m!949031))

(declare-fun m!949033 () Bool)

(assert (=> b!1029980 m!949033))

(declare-fun m!949035 () Bool)

(assert (=> b!1029980 m!949035))

(assert (=> b!1029980 m!949021))

(declare-fun m!949037 () Bool)

(assert (=> b!1029980 m!949037))

(declare-fun m!949039 () Bool)

(assert (=> b!1029980 m!949039))

(assert (=> b!1029980 m!948851))

(assert (=> b!1029980 m!949039))

(declare-fun m!949041 () Bool)

(assert (=> b!1029980 m!949041))

(declare-fun m!949043 () Bool)

(assert (=> b!1029980 m!949043))

(assert (=> b!1029980 m!949037))

(declare-fun m!949045 () Bool)

(assert (=> b!1029980 m!949045))

(declare-fun m!949047 () Bool)

(assert (=> b!1029980 m!949047))

(declare-fun m!949049 () Bool)

(assert (=> b!1029980 m!949049))

(assert (=> b!1029980 m!949029))

(assert (=> d!123361 m!948601))

(declare-fun m!949051 () Bool)

(assert (=> bm!43514 m!949051))

(assert (=> b!1029972 m!948851))

(assert (=> b!1029972 m!948851))

(assert (=> b!1029972 m!948853))

(assert (=> b!1029969 m!948851))

(assert (=> b!1029969 m!948851))

(declare-fun m!949053 () Bool)

(assert (=> b!1029969 m!949053))

(assert (=> b!1029984 m!948851))

(declare-fun m!949055 () Bool)

(assert (=> b!1029984 m!949055))

(assert (=> b!1029984 m!948487))

(declare-fun m!949057 () Bool)

(assert (=> b!1029984 m!949057))

(assert (=> b!1029984 m!948487))

(declare-fun m!949059 () Bool)

(assert (=> b!1029984 m!949059))

(assert (=> b!1029984 m!948851))

(assert (=> b!1029984 m!949057))

(declare-fun m!949061 () Bool)

(assert (=> b!1029968 m!949061))

(assert (=> b!1029737 d!123361))

(declare-fun b!1029989 () Bool)

(declare-fun e!581570 () Bool)

(declare-fun e!581571 () Bool)

(assert (=> b!1029989 (= e!581570 e!581571)))

(declare-fun c!104116 () Bool)

(assert (=> b!1029989 (= c!104116 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029990 () Bool)

(declare-fun e!581572 () Bool)

(declare-fun call!43520 () Bool)

(assert (=> b!1029990 (= e!581572 call!43520)))

(declare-fun bm!43517 () Bool)

(assert (=> bm!43517 (= call!43520 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029991 () Bool)

(assert (=> b!1029991 (= e!581571 e!581572)))

(declare-fun lt!454108 () (_ BitVec 64))

(assert (=> b!1029991 (= lt!454108 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454110 () Unit!33515)

(assert (=> b!1029991 (= lt!454110 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11283 thiss!1427) lt!454108 #b00000000000000000000000000000000))))

(assert (=> b!1029991 (arrayContainsKey!0 (_keys!11283 thiss!1427) lt!454108 #b00000000000000000000000000000000)))

(declare-fun lt!454109 () Unit!33515)

(assert (=> b!1029991 (= lt!454109 lt!454110)))

(declare-fun res!688851 () Bool)

(assert (=> b!1029991 (= res!688851 (= (seekEntryOrOpen!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000) (_keys!11283 thiss!1427) (mask!29879 thiss!1427)) (Found!9674 #b00000000000000000000000000000000)))))

(assert (=> b!1029991 (=> (not res!688851) (not e!581572))))

(declare-fun d!123363 () Bool)

(declare-fun res!688852 () Bool)

(assert (=> d!123363 (=> res!688852 e!581570)))

(assert (=> d!123363 (= res!688852 (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)) e!581570)))

(declare-fun b!1029992 () Bool)

(assert (=> b!1029992 (= e!581571 call!43520)))

(assert (= (and d!123363 (not res!688852)) b!1029989))

(assert (= (and b!1029989 c!104116) b!1029991))

(assert (= (and b!1029989 (not c!104116)) b!1029992))

(assert (= (and b!1029991 res!688851) b!1029990))

(assert (= (or b!1029990 b!1029992) bm!43517))

(assert (=> b!1029989 m!948675))

(assert (=> b!1029989 m!948675))

(assert (=> b!1029989 m!948677))

(declare-fun m!949063 () Bool)

(assert (=> bm!43517 m!949063))

(assert (=> b!1029991 m!948675))

(declare-fun m!949065 () Bool)

(assert (=> b!1029991 m!949065))

(declare-fun m!949067 () Bool)

(assert (=> b!1029991 m!949067))

(assert (=> b!1029991 m!948675))

(declare-fun m!949069 () Bool)

(assert (=> b!1029991 m!949069))

(assert (=> b!1029609 d!123363))

(assert (=> b!1029748 d!123309))

(declare-fun b!1029993 () Bool)

(declare-fun e!581574 () (_ BitVec 32))

(declare-fun e!581573 () (_ BitVec 32))

(assert (=> b!1029993 (= e!581574 e!581573)))

(declare-fun c!104118 () Bool)

(assert (=> b!1029993 (= c!104118 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029994 () Bool)

(declare-fun call!43521 () (_ BitVec 32))

(assert (=> b!1029994 (= e!581573 (bvadd #b00000000000000000000000000000001 call!43521))))

(declare-fun bm!43518 () Bool)

(assert (=> bm!43518 (= call!43521 (arrayCountValidKeys!0 (_keys!11283 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1029995 () Bool)

(assert (=> b!1029995 (= e!581573 call!43521)))

(declare-fun b!1029996 () Bool)

(assert (=> b!1029996 (= e!581574 #b00000000000000000000000000000000)))

(declare-fun d!123365 () Bool)

(declare-fun lt!454111 () (_ BitVec 32))

(assert (=> d!123365 (and (bvsge lt!454111 #b00000000000000000000000000000000) (bvsle lt!454111 (bvsub (size!31640 (_keys!11283 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123365 (= lt!454111 e!581574)))

(declare-fun c!104117 () Bool)

(assert (=> d!123365 (= c!104117 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123365 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31640 (_keys!11283 thiss!1427)) (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123365 (= (arrayCountValidKeys!0 (_keys!11283 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))) lt!454111)))

(assert (= (and d!123365 c!104117) b!1029996))

(assert (= (and d!123365 (not c!104117)) b!1029993))

(assert (= (and b!1029993 c!104118) b!1029994))

(assert (= (and b!1029993 (not c!104118)) b!1029995))

(assert (= (or b!1029994 b!1029995) bm!43518))

(declare-fun m!949071 () Bool)

(assert (=> b!1029993 m!949071))

(assert (=> b!1029993 m!949071))

(declare-fun m!949073 () Bool)

(assert (=> b!1029993 m!949073))

(declare-fun m!949075 () Bool)

(assert (=> bm!43518 m!949075))

(assert (=> bm!43491 d!123365))

(declare-fun d!123367 () Bool)

(declare-fun e!581579 () Bool)

(assert (=> d!123367 e!581579))

(declare-fun res!688855 () Bool)

(assert (=> d!123367 (=> (not res!688855) (not e!581579))))

(declare-fun lt!454114 () ListLongMap!13761)

(assert (=> d!123367 (= res!688855 (not (contains!5954 lt!454114 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!581575 () ListLongMap!13761)

(assert (=> d!123367 (= lt!454114 e!581575)))

(declare-fun c!104119 () Bool)

(assert (=> d!123367 (= c!104119 (bvsge #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(assert (=> d!123367 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123367 (= (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454114)))

(declare-fun b!1029997 () Bool)

(declare-fun e!581576 () Bool)

(assert (=> b!1029997 (= e!581579 e!581576)))

(declare-fun c!104121 () Bool)

(declare-fun e!581581 () Bool)

(assert (=> b!1029997 (= c!104121 e!581581)))

(declare-fun res!688856 () Bool)

(assert (=> b!1029997 (=> (not res!688856) (not e!581581))))

(assert (=> b!1029997 (= res!688856 (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(declare-fun b!1029998 () Bool)

(declare-fun e!581578 () ListLongMap!13761)

(declare-fun call!43522 () ListLongMap!13761)

(assert (=> b!1029998 (= e!581578 call!43522)))

(declare-fun b!1029999 () Bool)

(assert (=> b!1029999 (= e!581575 (ListLongMap!13762 Nil!21857))))

(declare-fun b!1030000 () Bool)

(declare-fun e!581580 () Bool)

(assert (=> b!1030000 (= e!581576 e!581580)))

(assert (=> b!1030000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(declare-fun res!688854 () Bool)

(assert (=> b!1030000 (= res!688854 (contains!5954 lt!454114 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (=> b!1030000 (=> (not res!688854) (not e!581580))))

(declare-fun b!1030001 () Bool)

(assert (=> b!1030001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(assert (=> b!1030001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31641 lt!453773)))))

(assert (=> b!1030001 (= e!581580 (= (apply!897 lt!454114 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) (get!16357 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1030002 () Bool)

(assert (=> b!1030002 (= e!581581 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (=> b!1030002 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1030003 () Bool)

(declare-fun e!581577 () Bool)

(assert (=> b!1030003 (= e!581577 (= lt!454114 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427))))))

(declare-fun b!1030004 () Bool)

(declare-fun res!688853 () Bool)

(assert (=> b!1030004 (=> (not res!688853) (not e!581579))))

(assert (=> b!1030004 (= res!688853 (not (contains!5954 lt!454114 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!43519 () Bool)

(assert (=> bm!43519 (= call!43522 (getCurrentListMapNoExtraKeys!3563 lt!453777 lt!453773 (mask!29879 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427)))))

(declare-fun b!1030005 () Bool)

(assert (=> b!1030005 (= e!581577 (isEmpty!930 lt!454114))))

(declare-fun b!1030006 () Bool)

(assert (=> b!1030006 (= e!581576 e!581577)))

(declare-fun c!104122 () Bool)

(assert (=> b!1030006 (= c!104122 (bvslt #b00000000000000000000000000000000 (size!31640 lt!453777)))))

(declare-fun b!1030007 () Bool)

(declare-fun lt!454116 () Unit!33515)

(declare-fun lt!454117 () Unit!33515)

(assert (=> b!1030007 (= lt!454116 lt!454117)))

(declare-fun lt!454118 () V!37299)

(declare-fun lt!454113 () ListLongMap!13761)

(declare-fun lt!454112 () (_ BitVec 64))

(declare-fun lt!454115 () (_ BitVec 64))

(assert (=> b!1030007 (not (contains!5954 (+!3128 lt!454113 (tuple2!15655 lt!454115 lt!454118)) lt!454112))))

(assert (=> b!1030007 (= lt!454117 (addStillNotContains!242 lt!454113 lt!454115 lt!454118 lt!454112))))

(assert (=> b!1030007 (= lt!454112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1030007 (= lt!454118 (get!16357 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1030007 (= lt!454115 (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))

(assert (=> b!1030007 (= lt!454113 call!43522)))

(assert (=> b!1030007 (= e!581578 (+!3128 call!43522 (tuple2!15655 (select (arr!31122 lt!453777) #b00000000000000000000000000000000) (get!16357 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1030008 () Bool)

(assert (=> b!1030008 (= e!581575 e!581578)))

(declare-fun c!104120 () Bool)

(assert (=> b!1030008 (= c!104120 (validKeyInArray!0 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (= (and d!123367 c!104119) b!1029999))

(assert (= (and d!123367 (not c!104119)) b!1030008))

(assert (= (and b!1030008 c!104120) b!1030007))

(assert (= (and b!1030008 (not c!104120)) b!1029998))

(assert (= (or b!1030007 b!1029998) bm!43519))

(assert (= (and d!123367 res!688855) b!1030004))

(assert (= (and b!1030004 res!688853) b!1029997))

(assert (= (and b!1029997 res!688856) b!1030002))

(assert (= (and b!1029997 c!104121) b!1030000))

(assert (= (and b!1029997 (not c!104121)) b!1030006))

(assert (= (and b!1030000 res!688854) b!1030001))

(assert (= (and b!1030006 c!104122) b!1030003))

(assert (= (and b!1030006 (not c!104122)) b!1030005))

(declare-fun b_lambda!15897 () Bool)

(assert (=> (not b_lambda!15897) (not b!1030001)))

(assert (=> b!1030001 t!30944))

(declare-fun b_and!32941 () Bool)

(assert (= b_and!32939 (and (=> t!30944 result!14151) b_and!32941)))

(declare-fun b_lambda!15899 () Bool)

(assert (=> (not b_lambda!15899) (not b!1030007)))

(assert (=> b!1030007 t!30944))

(declare-fun b_and!32943 () Bool)

(assert (= b_and!32941 (and (=> t!30944 result!14151) b_and!32943)))

(assert (=> b!1030001 m!948669))

(assert (=> b!1030001 m!948487))

(assert (=> b!1030001 m!948671))

(assert (=> b!1030001 m!948613))

(declare-fun m!949077 () Bool)

(assert (=> b!1030001 m!949077))

(assert (=> b!1030001 m!948613))

(assert (=> b!1030001 m!948487))

(assert (=> b!1030001 m!948669))

(assert (=> b!1030000 m!948613))

(assert (=> b!1030000 m!948613))

(declare-fun m!949079 () Bool)

(assert (=> b!1030000 m!949079))

(declare-fun m!949081 () Bool)

(assert (=> b!1030003 m!949081))

(declare-fun m!949083 () Bool)

(assert (=> b!1030004 m!949083))

(assert (=> bm!43519 m!949081))

(assert (=> b!1030008 m!948613))

(assert (=> b!1030008 m!948613))

(assert (=> b!1030008 m!948615))

(declare-fun m!949085 () Bool)

(assert (=> b!1030005 m!949085))

(assert (=> b!1030007 m!948613))

(declare-fun m!949087 () Bool)

(assert (=> b!1030007 m!949087))

(declare-fun m!949089 () Bool)

(assert (=> b!1030007 m!949089))

(assert (=> b!1030007 m!948669))

(assert (=> b!1030007 m!948487))

(assert (=> b!1030007 m!948671))

(assert (=> b!1030007 m!949087))

(declare-fun m!949091 () Bool)

(assert (=> b!1030007 m!949091))

(declare-fun m!949093 () Bool)

(assert (=> b!1030007 m!949093))

(assert (=> b!1030007 m!948487))

(assert (=> b!1030007 m!948669))

(declare-fun m!949095 () Bool)

(assert (=> d!123367 m!949095))

(assert (=> d!123367 m!948601))

(assert (=> b!1030002 m!948613))

(assert (=> b!1030002 m!948613))

(assert (=> b!1030002 m!948615))

(assert (=> bm!43486 d!123367))

(declare-fun b!1030009 () Bool)

(declare-fun e!581582 () Bool)

(declare-fun e!581583 () Bool)

(assert (=> b!1030009 (= e!581582 e!581583)))

(declare-fun c!104123 () Bool)

(assert (=> b!1030009 (= c!104123 (validKeyInArray!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030010 () Bool)

(declare-fun e!581584 () Bool)

(declare-fun call!43523 () Bool)

(assert (=> b!1030010 (= e!581584 call!43523)))

(declare-fun bm!43520 () Bool)

(assert (=> bm!43520 (= call!43523 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (mask!29879 thiss!1427)))))

(declare-fun b!1030011 () Bool)

(assert (=> b!1030011 (= e!581583 e!581584)))

(declare-fun lt!454119 () (_ BitVec 64))

(assert (=> b!1030011 (= lt!454119 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454121 () Unit!33515)

(assert (=> b!1030011 (= lt!454121 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) lt!454119 #b00000000000000000000000000000000))))

(assert (=> b!1030011 (arrayContainsKey!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) lt!454119 #b00000000000000000000000000000000)))

(declare-fun lt!454120 () Unit!33515)

(assert (=> b!1030011 (= lt!454120 lt!454121)))

(declare-fun res!688857 () Bool)

(assert (=> b!1030011 (= res!688857 (= (seekEntryOrOpen!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000) (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (mask!29879 thiss!1427)) (Found!9674 #b00000000000000000000000000000000)))))

(assert (=> b!1030011 (=> (not res!688857) (not e!581584))))

(declare-fun d!123369 () Bool)

(declare-fun res!688858 () Bool)

(assert (=> d!123369 (=> res!688858 e!581582)))

(assert (=> d!123369 (= res!688858 (bvsge #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(assert (=> d!123369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (mask!29879 thiss!1427)) e!581582)))

(declare-fun b!1030012 () Bool)

(assert (=> b!1030012 (= e!581583 call!43523)))

(assert (= (and d!123369 (not res!688858)) b!1030009))

(assert (= (and b!1030009 c!104123) b!1030011))

(assert (= (and b!1030009 (not c!104123)) b!1030012))

(assert (= (and b!1030011 res!688857) b!1030010))

(assert (= (or b!1030010 b!1030012) bm!43520))

(assert (=> b!1030009 m!948851))

(assert (=> b!1030009 m!948851))

(assert (=> b!1030009 m!948853))

(declare-fun m!949097 () Bool)

(assert (=> bm!43520 m!949097))

(assert (=> b!1030011 m!948851))

(declare-fun m!949099 () Bool)

(assert (=> b!1030011 m!949099))

(declare-fun m!949101 () Bool)

(assert (=> b!1030011 m!949101))

(assert (=> b!1030011 m!948851))

(declare-fun m!949103 () Bool)

(assert (=> b!1030011 m!949103))

(assert (=> b!1029631 d!123369))

(declare-fun b!1030013 () Bool)

(declare-fun e!581586 () (_ BitVec 32))

(declare-fun e!581585 () (_ BitVec 32))

(assert (=> b!1030013 (= e!581586 e!581585)))

(declare-fun c!104125 () Bool)

(assert (=> b!1030013 (= c!104125 (validKeyInArray!0 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030014 () Bool)

(declare-fun call!43524 () (_ BitVec 32))

(assert (=> b!1030014 (= e!581585 (bvadd #b00000000000000000000000000000001 call!43524))))

(declare-fun bm!43521 () Bool)

(assert (=> bm!43521 (= call!43524 (arrayCountValidKeys!0 lt!453777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(declare-fun b!1030015 () Bool)

(assert (=> b!1030015 (= e!581585 call!43524)))

(declare-fun b!1030016 () Bool)

(assert (=> b!1030016 (= e!581586 #b00000000000000000000000000000000)))

(declare-fun d!123371 () Bool)

(declare-fun lt!454122 () (_ BitVec 32))

(assert (=> d!123371 (and (bvsge lt!454122 #b00000000000000000000000000000000) (bvsle lt!454122 (bvsub (size!31640 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123371 (= lt!454122 e!581586)))

(declare-fun c!104124 () Bool)

(assert (=> d!123371 (= c!104124 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123371 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31640 (_keys!11283 thiss!1427)) (size!31640 lt!453777)))))

(assert (=> d!123371 (= (arrayCountValidKeys!0 lt!453777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (_keys!11283 thiss!1427))) lt!454122)))

(assert (= (and d!123371 c!104124) b!1030016))

(assert (= (and d!123371 (not c!104124)) b!1030013))

(assert (= (and b!1030013 c!104125) b!1030014))

(assert (= (and b!1030013 (not c!104125)) b!1030015))

(assert (= (or b!1030014 b!1030015) bm!43521))

(assert (=> b!1030013 m!948805))

(assert (=> b!1030013 m!948805))

(assert (=> b!1030013 m!948829))

(declare-fun m!949105 () Bool)

(assert (=> bm!43521 m!949105))

(assert (=> bm!43469 d!123371))

(declare-fun d!123373 () Bool)

(declare-fun lt!454125 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!511 (List!21861) (InoxSet (_ BitVec 64)))

(assert (=> d!123373 (= lt!454125 (select (content!511 Nil!21858) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun e!581592 () Bool)

(assert (=> d!123373 (= lt!454125 e!581592)))

(declare-fun res!688863 () Bool)

(assert (=> d!123373 (=> (not res!688863) (not e!581592))))

(assert (=> d!123373 (= res!688863 ((_ is Cons!21857) Nil!21858))))

(assert (=> d!123373 (= (contains!5955 Nil!21858 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) lt!454125)))

(declare-fun b!1030021 () Bool)

(declare-fun e!581591 () Bool)

(assert (=> b!1030021 (= e!581592 e!581591)))

(declare-fun res!688864 () Bool)

(assert (=> b!1030021 (=> res!688864 e!581591)))

(assert (=> b!1030021 (= res!688864 (= (h!23058 Nil!21858) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(declare-fun b!1030022 () Bool)

(assert (=> b!1030022 (= e!581591 (contains!5955 (t!30946 Nil!21858) (select (arr!31122 lt!453777) #b00000000000000000000000000000000)))))

(assert (= (and d!123373 res!688863) b!1030021))

(assert (= (and b!1030021 (not res!688864)) b!1030022))

(declare-fun m!949107 () Bool)

(assert (=> d!123373 m!949107))

(assert (=> d!123373 m!948613))

(declare-fun m!949109 () Bool)

(assert (=> d!123373 m!949109))

(assert (=> b!1030022 m!948613))

(declare-fun m!949111 () Bool)

(assert (=> b!1030022 m!949111))

(assert (=> b!1029773 d!123373))

(declare-fun d!123375 () Bool)

(declare-fun e!581593 () Bool)

(assert (=> d!123375 e!581593))

(declare-fun res!688865 () Bool)

(assert (=> d!123375 (=> res!688865 e!581593)))

(declare-fun lt!454127 () Bool)

(assert (=> d!123375 (= res!688865 (not lt!454127))))

(declare-fun lt!454129 () Bool)

(assert (=> d!123375 (= lt!454127 lt!454129)))

(declare-fun lt!454128 () Unit!33515)

(declare-fun e!581594 () Unit!33515)

(assert (=> d!123375 (= lt!454128 e!581594)))

(declare-fun c!104126 () Bool)

(assert (=> d!123375 (= c!104126 lt!454129)))

(assert (=> d!123375 (= lt!454129 (containsKey!562 (toList!6896 lt!453941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123375 (= (contains!5954 lt!453941 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454127)))

(declare-fun b!1030023 () Bool)

(declare-fun lt!454126 () Unit!33515)

(assert (=> b!1030023 (= e!581594 lt!454126)))

(assert (=> b!1030023 (= lt!454126 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030023 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030024 () Bool)

(declare-fun Unit!33532 () Unit!33515)

(assert (=> b!1030024 (= e!581594 Unit!33532)))

(declare-fun b!1030025 () Bool)

(assert (=> b!1030025 (= e!581593 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123375 c!104126) b!1030023))

(assert (= (and d!123375 (not c!104126)) b!1030024))

(assert (= (and d!123375 (not res!688865)) b!1030025))

(declare-fun m!949113 () Bool)

(assert (=> d!123375 m!949113))

(declare-fun m!949115 () Bool)

(assert (=> b!1030023 m!949115))

(declare-fun m!949117 () Bool)

(assert (=> b!1030023 m!949117))

(assert (=> b!1030023 m!949117))

(declare-fun m!949119 () Bool)

(assert (=> b!1030023 m!949119))

(assert (=> b!1030025 m!949117))

(assert (=> b!1030025 m!949117))

(assert (=> b!1030025 m!949119))

(assert (=> bm!43493 d!123375))

(assert (=> b!1029710 d!123309))

(declare-fun d!123377 () Bool)

(declare-fun e!581595 () Bool)

(assert (=> d!123377 e!581595))

(declare-fun res!688866 () Bool)

(assert (=> d!123377 (=> res!688866 e!581595)))

(declare-fun lt!454131 () Bool)

(assert (=> d!123377 (= res!688866 (not lt!454131))))

(declare-fun lt!454133 () Bool)

(assert (=> d!123377 (= lt!454131 lt!454133)))

(declare-fun lt!454132 () Unit!33515)

(declare-fun e!581596 () Unit!33515)

(assert (=> d!123377 (= lt!454132 e!581596)))

(declare-fun c!104127 () Bool)

(assert (=> d!123377 (= c!104127 lt!454133)))

(assert (=> d!123377 (= lt!454133 (containsKey!562 (toList!6896 lt!453941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123377 (= (contains!5954 lt!453941 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454131)))

(declare-fun b!1030026 () Bool)

(declare-fun lt!454130 () Unit!33515)

(assert (=> b!1030026 (= e!581596 lt!454130)))

(assert (=> b!1030026 (= lt!454130 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 lt!453941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030026 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030027 () Bool)

(declare-fun Unit!33533 () Unit!33515)

(assert (=> b!1030027 (= e!581596 Unit!33533)))

(declare-fun b!1030028 () Bool)

(assert (=> b!1030028 (= e!581595 (isDefined!437 (getValueByKey!589 (toList!6896 lt!453941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123377 c!104127) b!1030026))

(assert (= (and d!123377 (not c!104127)) b!1030027))

(assert (= (and d!123377 (not res!688866)) b!1030028))

(declare-fun m!949121 () Bool)

(assert (=> d!123377 m!949121))

(declare-fun m!949123 () Bool)

(assert (=> b!1030026 m!949123))

(assert (=> b!1030026 m!948893))

(assert (=> b!1030026 m!948893))

(declare-fun m!949125 () Bool)

(assert (=> b!1030026 m!949125))

(assert (=> b!1030028 m!948893))

(assert (=> b!1030028 m!948893))

(assert (=> b!1030028 m!949125))

(assert (=> bm!43492 d!123377))

(assert (=> b!1029693 d!123307))

(assert (=> d!123269 d!123281))

(assert (=> b!1029640 d!123307))

(declare-fun d!123379 () Bool)

(assert (=> d!123379 (= (apply!897 lt!453909 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16358 (getValueByKey!589 (toList!6896 lt!453909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30068 () Bool)

(assert (= bs!30068 d!123379))

(assert (=> bs!30068 m!948801))

(assert (=> bs!30068 m!948801))

(declare-fun m!949127 () Bool)

(assert (=> bs!30068 m!949127))

(assert (=> b!1029689 d!123379))

(assert (=> b!1029770 d!123307))

(declare-fun d!123381 () Bool)

(declare-fun e!581597 () Bool)

(assert (=> d!123381 e!581597))

(declare-fun res!688868 () Bool)

(assert (=> d!123381 (=> (not res!688868) (not e!581597))))

(declare-fun lt!454135 () ListLongMap!13761)

(assert (=> d!123381 (= res!688868 (contains!5954 lt!454135 (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454134 () List!21860)

(assert (=> d!123381 (= lt!454135 (ListLongMap!13762 lt!454134))))

(declare-fun lt!454137 () Unit!33515)

(declare-fun lt!454136 () Unit!33515)

(assert (=> d!123381 (= lt!454137 lt!454136)))

(assert (=> d!123381 (= (getValueByKey!589 lt!454134 (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!123381 (= lt!454136 (lemmaContainsTupThenGetReturnValue!279 lt!454134 (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!123381 (= lt!454134 (insertStrictlySorted!372 (toList!6896 call!43497) (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!123381 (= (+!3128 call!43497 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) lt!454135)))

(declare-fun b!1030029 () Bool)

(declare-fun res!688867 () Bool)

(assert (=> b!1030029 (=> (not res!688867) (not e!581597))))

(assert (=> b!1030029 (= res!688867 (= (getValueByKey!589 (toList!6896 lt!454135) (_1!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun b!1030030 () Bool)

(assert (=> b!1030030 (= e!581597 (contains!5956 (toList!6896 lt!454135) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(assert (= (and d!123381 res!688868) b!1030029))

(assert (= (and b!1030029 res!688867) b!1030030))

(declare-fun m!949129 () Bool)

(assert (=> d!123381 m!949129))

(declare-fun m!949131 () Bool)

(assert (=> d!123381 m!949131))

(declare-fun m!949133 () Bool)

(assert (=> d!123381 m!949133))

(declare-fun m!949135 () Bool)

(assert (=> d!123381 m!949135))

(declare-fun m!949137 () Bool)

(assert (=> b!1030029 m!949137))

(declare-fun m!949139 () Bool)

(assert (=> b!1030030 m!949139))

(assert (=> b!1029741 d!123381))

(declare-fun d!123383 () Bool)

(assert (=> d!123383 (= (apply!897 lt!453909 (select (arr!31122 lt!453777) #b00000000000000000000000000000000)) (get!16358 (getValueByKey!589 (toList!6896 lt!453909) (select (arr!31122 lt!453777) #b00000000000000000000000000000000))))))

(declare-fun bs!30069 () Bool)

(assert (= bs!30069 d!123383))

(assert (=> bs!30069 m!948613))

(assert (=> bs!30069 m!948839))

(assert (=> bs!30069 m!948839))

(declare-fun m!949141 () Bool)

(assert (=> bs!30069 m!949141))

(assert (=> b!1029705 d!123383))

(declare-fun d!123385 () Bool)

(declare-fun c!104128 () Bool)

(assert (=> d!123385 (= c!104128 ((_ is ValueCellFull!11456) (select (arr!31123 lt!453773) #b00000000000000000000000000000000)))))

(declare-fun e!581598 () V!37299)

(assert (=> d!123385 (= (get!16357 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581598)))

(declare-fun b!1030031 () Bool)

(assert (=> b!1030031 (= e!581598 (get!16359 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030032 () Bool)

(assert (=> b!1030032 (= e!581598 (get!16360 (select (arr!31123 lt!453773) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123385 c!104128) b!1030031))

(assert (= (and d!123385 (not c!104128)) b!1030032))

(assert (=> b!1030031 m!948669))

(assert (=> b!1030031 m!948487))

(declare-fun m!949143 () Bool)

(assert (=> b!1030031 m!949143))

(assert (=> b!1030032 m!948669))

(assert (=> b!1030032 m!948487))

(declare-fun m!949145 () Bool)

(assert (=> b!1030032 m!949145))

(assert (=> b!1029705 d!123385))

(declare-fun d!123387 () Bool)

(assert (=> d!123387 (= (apply!897 lt!453941 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16358 (getValueByKey!589 (toList!6896 lt!453941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30070 () Bool)

(assert (= bs!30070 d!123387))

(assert (=> bs!30070 m!949117))

(assert (=> bs!30070 m!949117))

(declare-fun m!949147 () Bool)

(assert (=> bs!30070 m!949147))

(assert (=> b!1029738 d!123387))

(declare-fun d!123389 () Bool)

(assert (=> d!123389 (arrayNoDuplicates!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000000 Nil!21858)))

(assert (=> d!123389 true))

(declare-fun _$66!41 () Unit!33515)

(assert (=> d!123389 (= (choose!53 (_keys!11283 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!453771) #b00000000000000000000000000000000 Nil!21858) _$66!41)))

(declare-fun bs!30071 () Bool)

(assert (= bs!30071 d!123389))

(assert (=> bs!30071 m!948467))

(assert (=> bs!30071 m!948683))

(assert (=> d!123261 d!123389))

(declare-fun b!1030045 () Bool)

(declare-fun e!581606 () SeekEntryResult!9674)

(assert (=> b!1030045 (= e!581606 Undefined!9674)))

(declare-fun b!1030046 () Bool)

(declare-fun e!581605 () SeekEntryResult!9674)

(assert (=> b!1030046 (= e!581605 (Found!9674 (index!41069 lt!453842)))))

(declare-fun d!123391 () Bool)

(declare-fun lt!454142 () SeekEntryResult!9674)

(assert (=> d!123391 (and (or ((_ is Undefined!9674) lt!454142) (not ((_ is Found!9674) lt!454142)) (and (bvsge (index!41068 lt!454142) #b00000000000000000000000000000000) (bvslt (index!41068 lt!454142) (size!31640 (_keys!11283 thiss!1427))))) (or ((_ is Undefined!9674) lt!454142) ((_ is Found!9674) lt!454142) (not ((_ is MissingVacant!9674) lt!454142)) (not (= (index!41070 lt!454142) (index!41069 lt!453842))) (and (bvsge (index!41070 lt!454142) #b00000000000000000000000000000000) (bvslt (index!41070 lt!454142) (size!31640 (_keys!11283 thiss!1427))))) (or ((_ is Undefined!9674) lt!454142) (ite ((_ is Found!9674) lt!454142) (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!454142)) key!909) (and ((_ is MissingVacant!9674) lt!454142) (= (index!41070 lt!454142) (index!41069 lt!453842)) (= (select (arr!31122 (_keys!11283 thiss!1427)) (index!41070 lt!454142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!123391 (= lt!454142 e!581606)))

(declare-fun c!104136 () Bool)

(assert (=> d!123391 (= c!104136 (bvsge (x!91619 lt!453842) #b01111111111111111111111111111110))))

(declare-fun lt!454143 () (_ BitVec 64))

(assert (=> d!123391 (= lt!454143 (select (arr!31122 (_keys!11283 thiss!1427)) (index!41069 lt!453842)))))

(assert (=> d!123391 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123391 (= (seekKeyOrZeroReturnVacant!0 (x!91619 lt!453842) (index!41069 lt!453842) (index!41069 lt!453842) key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)) lt!454142)))

(declare-fun b!1030047 () Bool)

(declare-fun e!581607 () SeekEntryResult!9674)

(assert (=> b!1030047 (= e!581607 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91619 lt!453842) #b00000000000000000000000000000001) (nextIndex!0 (index!41069 lt!453842) (x!91619 lt!453842) (mask!29879 thiss!1427)) (index!41069 lt!453842) key!909 (_keys!11283 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1030048 () Bool)

(assert (=> b!1030048 (= e!581607 (MissingVacant!9674 (index!41069 lt!453842)))))

(declare-fun b!1030049 () Bool)

(declare-fun c!104135 () Bool)

(assert (=> b!1030049 (= c!104135 (= lt!454143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030049 (= e!581605 e!581607)))

(declare-fun b!1030050 () Bool)

(assert (=> b!1030050 (= e!581606 e!581605)))

(declare-fun c!104137 () Bool)

(assert (=> b!1030050 (= c!104137 (= lt!454143 key!909))))

(assert (= (and d!123391 c!104136) b!1030045))

(assert (= (and d!123391 (not c!104136)) b!1030050))

(assert (= (and b!1030050 c!104137) b!1030046))

(assert (= (and b!1030050 (not c!104137)) b!1030049))

(assert (= (and b!1030049 c!104135) b!1030048))

(assert (= (and b!1030049 (not c!104135)) b!1030047))

(declare-fun m!949149 () Bool)

(assert (=> d!123391 m!949149))

(declare-fun m!949151 () Bool)

(assert (=> d!123391 m!949151))

(assert (=> d!123391 m!948593))

(assert (=> d!123391 m!948601))

(declare-fun m!949153 () Bool)

(assert (=> b!1030047 m!949153))

(assert (=> b!1030047 m!949153))

(declare-fun m!949155 () Bool)

(assert (=> b!1030047 m!949155))

(assert (=> b!1029627 d!123391))

(declare-fun b!1030051 () Bool)

(declare-fun e!581608 () Bool)

(declare-fun e!581609 () Bool)

(assert (=> b!1030051 (= e!581608 e!581609)))

(declare-fun c!104138 () Bool)

(assert (=> b!1030051 (= c!104138 (validKeyInArray!0 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030052 () Bool)

(declare-fun e!581610 () Bool)

(declare-fun call!43525 () Bool)

(assert (=> b!1030052 (= e!581610 call!43525)))

(declare-fun bm!43522 () Bool)

(assert (=> bm!43522 (= call!43525 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!453777 (mask!29879 thiss!1427)))))

(declare-fun b!1030053 () Bool)

(assert (=> b!1030053 (= e!581609 e!581610)))

(declare-fun lt!454144 () (_ BitVec 64))

(assert (=> b!1030053 (= lt!454144 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!454146 () Unit!33515)

(assert (=> b!1030053 (= lt!454146 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453777 lt!454144 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1030053 (arrayContainsKey!0 lt!453777 lt!454144 #b00000000000000000000000000000000)))

(declare-fun lt!454145 () Unit!33515)

(assert (=> b!1030053 (= lt!454145 lt!454146)))

(declare-fun res!688869 () Bool)

(assert (=> b!1030053 (= res!688869 (= (seekEntryOrOpen!0 (select (arr!31122 lt!453777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!453777 (mask!29879 thiss!1427)) (Found!9674 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1030053 (=> (not res!688869) (not e!581610))))

(declare-fun d!123393 () Bool)

(declare-fun res!688870 () Bool)

(assert (=> d!123393 (=> res!688870 e!581608)))

(assert (=> d!123393 (= res!688870 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 lt!453777)))))

(assert (=> d!123393 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453777 (mask!29879 thiss!1427)) e!581608)))

(declare-fun b!1030054 () Bool)

(assert (=> b!1030054 (= e!581609 call!43525)))

(assert (= (and d!123393 (not res!688870)) b!1030051))

(assert (= (and b!1030051 c!104138) b!1030053))

(assert (= (and b!1030051 (not c!104138)) b!1030054))

(assert (= (and b!1030053 res!688869) b!1030052))

(assert (= (or b!1030052 b!1030054) bm!43522))

(assert (=> b!1030051 m!948805))

(assert (=> b!1030051 m!948805))

(assert (=> b!1030051 m!948829))

(declare-fun m!949157 () Bool)

(assert (=> bm!43522 m!949157))

(assert (=> b!1030053 m!948805))

(declare-fun m!949159 () Bool)

(assert (=> b!1030053 m!949159))

(declare-fun m!949161 () Bool)

(assert (=> b!1030053 m!949161))

(assert (=> b!1030053 m!948805))

(declare-fun m!949163 () Bool)

(assert (=> b!1030053 m!949163))

(assert (=> bm!43504 d!123393))

(declare-fun d!123395 () Bool)

(assert (=> d!123395 (= (apply!897 lt!453907 lt!453919) (get!16358 (getValueByKey!589 (toList!6896 lt!453907) lt!453919)))))

(declare-fun bs!30072 () Bool)

(assert (= bs!30072 d!123395))

(declare-fun m!949165 () Bool)

(assert (=> bs!30072 m!949165))

(assert (=> bs!30072 m!949165))

(declare-fun m!949167 () Bool)

(assert (=> bs!30072 m!949167))

(assert (=> b!1029701 d!123395))

(declare-fun d!123397 () Bool)

(assert (=> d!123397 (contains!5954 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))) lt!453903)))

(declare-fun lt!454147 () Unit!33515)

(assert (=> d!123397 (= lt!454147 (choose!1700 lt!453915 lt!453922 (zeroValue!5957 thiss!1427) lt!453903))))

(assert (=> d!123397 (contains!5954 lt!453915 lt!453903)))

(assert (=> d!123397 (= (addStillContains!616 lt!453915 lt!453922 (zeroValue!5957 thiss!1427) lt!453903) lt!454147)))

(declare-fun bs!30073 () Bool)

(assert (= bs!30073 d!123397))

(assert (=> bs!30073 m!948633))

(assert (=> bs!30073 m!948633))

(assert (=> bs!30073 m!948635))

(declare-fun m!949169 () Bool)

(assert (=> bs!30073 m!949169))

(declare-fun m!949171 () Bool)

(assert (=> bs!30073 m!949171))

(assert (=> b!1029701 d!123397))

(declare-fun d!123399 () Bool)

(declare-fun e!581611 () Bool)

(assert (=> d!123399 e!581611))

(declare-fun res!688872 () Bool)

(assert (=> d!123399 (=> (not res!688872) (not e!581611))))

(declare-fun lt!454149 () ListLongMap!13761)

(assert (=> d!123399 (= res!688872 (contains!5954 lt!454149 (_1!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454148 () List!21860)

(assert (=> d!123399 (= lt!454149 (ListLongMap!13762 lt!454148))))

(declare-fun lt!454151 () Unit!33515)

(declare-fun lt!454150 () Unit!33515)

(assert (=> d!123399 (= lt!454151 lt!454150)))

(assert (=> d!123399 (= (getValueByKey!589 lt!454148 (_1!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123399 (= lt!454150 (lemmaContainsTupThenGetReturnValue!279 lt!454148 (_1!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123399 (= lt!454148 (insertStrictlySorted!372 (toList!6896 lt!453915) (_1!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123399 (= (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))) lt!454149)))

(declare-fun b!1030055 () Bool)

(declare-fun res!688871 () Bool)

(assert (=> b!1030055 (=> (not res!688871) (not e!581611))))

(assert (=> b!1030055 (= res!688871 (= (getValueByKey!589 (toList!6896 lt!454149) (_1!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1030056 () Bool)

(assert (=> b!1030056 (= e!581611 (contains!5956 (toList!6896 lt!454149) (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!123399 res!688872) b!1030055))

(assert (= (and b!1030055 res!688871) b!1030056))

(declare-fun m!949173 () Bool)

(assert (=> d!123399 m!949173))

(declare-fun m!949175 () Bool)

(assert (=> d!123399 m!949175))

(declare-fun m!949177 () Bool)

(assert (=> d!123399 m!949177))

(declare-fun m!949179 () Bool)

(assert (=> d!123399 m!949179))

(declare-fun m!949181 () Bool)

(assert (=> b!1030055 m!949181))

(declare-fun m!949183 () Bool)

(assert (=> b!1030056 m!949183))

(assert (=> b!1029701 d!123399))

(declare-fun d!123401 () Bool)

(assert (=> d!123401 (= (apply!897 (+!3128 lt!453918 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))) lt!453908) (apply!897 lt!453918 lt!453908))))

(declare-fun lt!454152 () Unit!33515)

(assert (=> d!123401 (= lt!454152 (choose!1701 lt!453918 lt!453916 (minValue!5957 thiss!1427) lt!453908))))

(declare-fun e!581612 () Bool)

(assert (=> d!123401 e!581612))

(declare-fun res!688873 () Bool)

(assert (=> d!123401 (=> (not res!688873) (not e!581612))))

(assert (=> d!123401 (= res!688873 (contains!5954 lt!453918 lt!453908))))

(assert (=> d!123401 (= (addApplyDifferent!472 lt!453918 lt!453916 (minValue!5957 thiss!1427) lt!453908) lt!454152)))

(declare-fun b!1030057 () Bool)

(assert (=> b!1030057 (= e!581612 (not (= lt!453908 lt!453916)))))

(assert (= (and d!123401 res!688873) b!1030057))

(assert (=> d!123401 m!948637))

(declare-fun m!949185 () Bool)

(assert (=> d!123401 m!949185))

(assert (=> d!123401 m!948651))

(declare-fun m!949187 () Bool)

(assert (=> d!123401 m!949187))

(assert (=> d!123401 m!948651))

(assert (=> d!123401 m!948653))

(assert (=> b!1029701 d!123401))

(declare-fun d!123403 () Bool)

(assert (=> d!123403 (= (apply!897 (+!3128 lt!453918 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))) lt!453908) (get!16358 (getValueByKey!589 (toList!6896 (+!3128 lt!453918 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))) lt!453908)))))

(declare-fun bs!30074 () Bool)

(assert (= bs!30074 d!123403))

(declare-fun m!949189 () Bool)

(assert (=> bs!30074 m!949189))

(assert (=> bs!30074 m!949189))

(declare-fun m!949191 () Bool)

(assert (=> bs!30074 m!949191))

(assert (=> b!1029701 d!123403))

(declare-fun d!123405 () Bool)

(declare-fun e!581613 () Bool)

(assert (=> d!123405 e!581613))

(declare-fun res!688875 () Bool)

(assert (=> d!123405 (=> (not res!688875) (not e!581613))))

(declare-fun lt!454154 () ListLongMap!13761)

(assert (=> d!123405 (= res!688875 (contains!5954 lt!454154 (_1!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454153 () List!21860)

(assert (=> d!123405 (= lt!454154 (ListLongMap!13762 lt!454153))))

(declare-fun lt!454156 () Unit!33515)

(declare-fun lt!454155 () Unit!33515)

(assert (=> d!123405 (= lt!454156 lt!454155)))

(assert (=> d!123405 (= (getValueByKey!589 lt!454153 (_1!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123405 (= lt!454155 (lemmaContainsTupThenGetReturnValue!279 lt!454153 (_1!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123405 (= lt!454153 (insertStrictlySorted!372 (toList!6896 lt!453907) (_1!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123405 (= (+!3128 lt!453907 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))) lt!454154)))

(declare-fun b!1030058 () Bool)

(declare-fun res!688874 () Bool)

(assert (=> b!1030058 (=> (not res!688874) (not e!581613))))

(assert (=> b!1030058 (= res!688874 (= (getValueByKey!589 (toList!6896 lt!454154) (_1!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1030059 () Bool)

(assert (=> b!1030059 (= e!581613 (contains!5956 (toList!6896 lt!454154) (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!123405 res!688875) b!1030058))

(assert (= (and b!1030058 res!688874) b!1030059))

(declare-fun m!949193 () Bool)

(assert (=> d!123405 m!949193))

(declare-fun m!949195 () Bool)

(assert (=> d!123405 m!949195))

(declare-fun m!949197 () Bool)

(assert (=> d!123405 m!949197))

(declare-fun m!949199 () Bool)

(assert (=> d!123405 m!949199))

(declare-fun m!949201 () Bool)

(assert (=> b!1030058 m!949201))

(declare-fun m!949203 () Bool)

(assert (=> b!1030059 m!949203))

(assert (=> b!1029701 d!123405))

(assert (=> b!1029701 d!123367))

(declare-fun d!123407 () Bool)

(declare-fun e!581614 () Bool)

(assert (=> d!123407 e!581614))

(declare-fun res!688877 () Bool)

(assert (=> d!123407 (=> (not res!688877) (not e!581614))))

(declare-fun lt!454158 () ListLongMap!13761)

(assert (=> d!123407 (= res!688877 (contains!5954 lt!454158 (_1!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454157 () List!21860)

(assert (=> d!123407 (= lt!454158 (ListLongMap!13762 lt!454157))))

(declare-fun lt!454160 () Unit!33515)

(declare-fun lt!454159 () Unit!33515)

(assert (=> d!123407 (= lt!454160 lt!454159)))

(assert (=> d!123407 (= (getValueByKey!589 lt!454157 (_1!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))))))

(assert (=> d!123407 (= lt!454159 (lemmaContainsTupThenGetReturnValue!279 lt!454157 (_1!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))))))

(assert (=> d!123407 (= lt!454157 (insertStrictlySorted!372 (toList!6896 lt!453921) (_1!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))))))

(assert (=> d!123407 (= (+!3128 lt!453921 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))) lt!454158)))

(declare-fun b!1030060 () Bool)

(declare-fun res!688876 () Bool)

(assert (=> b!1030060 (=> (not res!688876) (not e!581614))))

(assert (=> b!1030060 (= res!688876 (= (getValueByKey!589 (toList!6896 lt!454158) (_1!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))))))))

(declare-fun b!1030061 () Bool)

(assert (=> b!1030061 (= e!581614 (contains!5956 (toList!6896 lt!454158) (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))))))

(assert (= (and d!123407 res!688877) b!1030060))

(assert (= (and b!1030060 res!688876) b!1030061))

(declare-fun m!949205 () Bool)

(assert (=> d!123407 m!949205))

(declare-fun m!949207 () Bool)

(assert (=> d!123407 m!949207))

(declare-fun m!949209 () Bool)

(assert (=> d!123407 m!949209))

(declare-fun m!949211 () Bool)

(assert (=> d!123407 m!949211))

(declare-fun m!949213 () Bool)

(assert (=> b!1030060 m!949213))

(declare-fun m!949215 () Bool)

(assert (=> b!1030061 m!949215))

(assert (=> b!1029701 d!123407))

(declare-fun d!123409 () Bool)

(declare-fun e!581615 () Bool)

(assert (=> d!123409 e!581615))

(declare-fun res!688879 () Bool)

(assert (=> d!123409 (=> (not res!688879) (not e!581615))))

(declare-fun lt!454162 () ListLongMap!13761)

(assert (=> d!123409 (= res!688879 (contains!5954 lt!454162 (_1!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454161 () List!21860)

(assert (=> d!123409 (= lt!454162 (ListLongMap!13762 lt!454161))))

(declare-fun lt!454164 () Unit!33515)

(declare-fun lt!454163 () Unit!33515)

(assert (=> d!123409 (= lt!454164 lt!454163)))

(assert (=> d!123409 (= (getValueByKey!589 lt!454161 (_1!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))))))

(assert (=> d!123409 (= lt!454163 (lemmaContainsTupThenGetReturnValue!279 lt!454161 (_1!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))))))

(assert (=> d!123409 (= lt!454161 (insertStrictlySorted!372 (toList!6896 lt!453918) (_1!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))) (_2!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))))))

(assert (=> d!123409 (= (+!3128 lt!453918 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))) lt!454162)))

(declare-fun b!1030062 () Bool)

(declare-fun res!688878 () Bool)

(assert (=> b!1030062 (=> (not res!688878) (not e!581615))))

(assert (=> b!1030062 (= res!688878 (= (getValueByKey!589 (toList!6896 lt!454162) (_1!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427)))) (Some!639 (_2!7838 (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))))))))

(declare-fun b!1030063 () Bool)

(assert (=> b!1030063 (= e!581615 (contains!5956 (toList!6896 lt!454162) (tuple2!15655 lt!453916 (minValue!5957 thiss!1427))))))

(assert (= (and d!123409 res!688879) b!1030062))

(assert (= (and b!1030062 res!688878) b!1030063))

(declare-fun m!949217 () Bool)

(assert (=> d!123409 m!949217))

(declare-fun m!949219 () Bool)

(assert (=> d!123409 m!949219))

(declare-fun m!949221 () Bool)

(assert (=> d!123409 m!949221))

(declare-fun m!949223 () Bool)

(assert (=> d!123409 m!949223))

(declare-fun m!949225 () Bool)

(assert (=> b!1030062 m!949225))

(declare-fun m!949227 () Bool)

(assert (=> b!1030063 m!949227))

(assert (=> b!1029701 d!123409))

(declare-fun d!123411 () Bool)

(assert (=> d!123411 (= (apply!897 lt!453918 lt!453908) (get!16358 (getValueByKey!589 (toList!6896 lt!453918) lt!453908)))))

(declare-fun bs!30075 () Bool)

(assert (= bs!30075 d!123411))

(declare-fun m!949229 () Bool)

(assert (=> bs!30075 m!949229))

(assert (=> bs!30075 m!949229))

(declare-fun m!949231 () Bool)

(assert (=> bs!30075 m!949231))

(assert (=> b!1029701 d!123411))

(declare-fun d!123413 () Bool)

(assert (=> d!123413 (= (apply!897 (+!3128 lt!453921 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))) lt!453917) (apply!897 lt!453921 lt!453917))))

(declare-fun lt!454165 () Unit!33515)

(assert (=> d!123413 (= lt!454165 (choose!1701 lt!453921 lt!453906 (minValue!5957 thiss!1427) lt!453917))))

(declare-fun e!581616 () Bool)

(assert (=> d!123413 e!581616))

(declare-fun res!688880 () Bool)

(assert (=> d!123413 (=> (not res!688880) (not e!581616))))

(assert (=> d!123413 (= res!688880 (contains!5954 lt!453921 lt!453917))))

(assert (=> d!123413 (= (addApplyDifferent!472 lt!453921 lt!453906 (minValue!5957 thiss!1427) lt!453917) lt!454165)))

(declare-fun b!1030064 () Bool)

(assert (=> b!1030064 (= e!581616 (not (= lt!453917 lt!453906)))))

(assert (= (and d!123413 res!688880) b!1030064))

(assert (=> d!123413 m!948661))

(declare-fun m!949233 () Bool)

(assert (=> d!123413 m!949233))

(assert (=> d!123413 m!948649))

(declare-fun m!949235 () Bool)

(assert (=> d!123413 m!949235))

(assert (=> d!123413 m!948649))

(assert (=> d!123413 m!948657))

(assert (=> b!1029701 d!123413))

(declare-fun d!123415 () Bool)

(assert (=> d!123415 (= (apply!897 (+!3128 lt!453907 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))) lt!453919) (apply!897 lt!453907 lt!453919))))

(declare-fun lt!454166 () Unit!33515)

(assert (=> d!123415 (= lt!454166 (choose!1701 lt!453907 lt!453912 (zeroValue!5957 thiss!1427) lt!453919))))

(declare-fun e!581617 () Bool)

(assert (=> d!123415 e!581617))

(declare-fun res!688881 () Bool)

(assert (=> d!123415 (=> (not res!688881) (not e!581617))))

(assert (=> d!123415 (= res!688881 (contains!5954 lt!453907 lt!453919))))

(assert (=> d!123415 (= (addApplyDifferent!472 lt!453907 lt!453912 (zeroValue!5957 thiss!1427) lt!453919) lt!454166)))

(declare-fun b!1030065 () Bool)

(assert (=> b!1030065 (= e!581617 (not (= lt!453919 lt!453912)))))

(assert (= (and d!123415 res!688881) b!1030065))

(assert (=> d!123415 m!948647))

(declare-fun m!949237 () Bool)

(assert (=> d!123415 m!949237))

(assert (=> d!123415 m!948641))

(declare-fun m!949239 () Bool)

(assert (=> d!123415 m!949239))

(assert (=> d!123415 m!948641))

(assert (=> d!123415 m!948643))

(assert (=> b!1029701 d!123415))

(declare-fun d!123417 () Bool)

(assert (=> d!123417 (= (apply!897 lt!453921 lt!453917) (get!16358 (getValueByKey!589 (toList!6896 lt!453921) lt!453917)))))

(declare-fun bs!30076 () Bool)

(assert (= bs!30076 d!123417))

(declare-fun m!949241 () Bool)

(assert (=> bs!30076 m!949241))

(assert (=> bs!30076 m!949241))

(declare-fun m!949243 () Bool)

(assert (=> bs!30076 m!949243))

(assert (=> b!1029701 d!123417))

(declare-fun d!123419 () Bool)

(declare-fun e!581618 () Bool)

(assert (=> d!123419 e!581618))

(declare-fun res!688882 () Bool)

(assert (=> d!123419 (=> res!688882 e!581618)))

(declare-fun lt!454168 () Bool)

(assert (=> d!123419 (= res!688882 (not lt!454168))))

(declare-fun lt!454170 () Bool)

(assert (=> d!123419 (= lt!454168 lt!454170)))

(declare-fun lt!454169 () Unit!33515)

(declare-fun e!581619 () Unit!33515)

(assert (=> d!123419 (= lt!454169 e!581619)))

(declare-fun c!104139 () Bool)

(assert (=> d!123419 (= c!104139 lt!454170)))

(assert (=> d!123419 (= lt!454170 (containsKey!562 (toList!6896 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))) lt!453903))))

(assert (=> d!123419 (= (contains!5954 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427))) lt!453903) lt!454168)))

(declare-fun b!1030066 () Bool)

(declare-fun lt!454167 () Unit!33515)

(assert (=> b!1030066 (= e!581619 lt!454167)))

(assert (=> b!1030066 (= lt!454167 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6896 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))) lt!453903))))

(assert (=> b!1030066 (isDefined!437 (getValueByKey!589 (toList!6896 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))) lt!453903))))

(declare-fun b!1030067 () Bool)

(declare-fun Unit!33534 () Unit!33515)

(assert (=> b!1030067 (= e!581619 Unit!33534)))

(declare-fun b!1030068 () Bool)

(assert (=> b!1030068 (= e!581618 (isDefined!437 (getValueByKey!589 (toList!6896 (+!3128 lt!453915 (tuple2!15655 lt!453922 (zeroValue!5957 thiss!1427)))) lt!453903)))))

(assert (= (and d!123419 c!104139) b!1030066))

(assert (= (and d!123419 (not c!104139)) b!1030067))

(assert (= (and d!123419 (not res!688882)) b!1030068))

(declare-fun m!949245 () Bool)

(assert (=> d!123419 m!949245))

(declare-fun m!949247 () Bool)

(assert (=> b!1030066 m!949247))

(declare-fun m!949249 () Bool)

(assert (=> b!1030066 m!949249))

(assert (=> b!1030066 m!949249))

(declare-fun m!949251 () Bool)

(assert (=> b!1030066 m!949251))

(assert (=> b!1030068 m!949249))

(assert (=> b!1030068 m!949249))

(assert (=> b!1030068 m!949251))

(assert (=> b!1029701 d!123419))

(declare-fun d!123421 () Bool)

(assert (=> d!123421 (= (apply!897 (+!3128 lt!453907 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427))) lt!453919) (get!16358 (getValueByKey!589 (toList!6896 (+!3128 lt!453907 (tuple2!15655 lt!453912 (zeroValue!5957 thiss!1427)))) lt!453919)))))

(declare-fun bs!30077 () Bool)

(assert (= bs!30077 d!123421))

(declare-fun m!949253 () Bool)

(assert (=> bs!30077 m!949253))

(assert (=> bs!30077 m!949253))

(declare-fun m!949255 () Bool)

(assert (=> bs!30077 m!949255))

(assert (=> b!1029701 d!123421))

(declare-fun d!123423 () Bool)

(assert (=> d!123423 (= (apply!897 (+!3128 lt!453921 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427))) lt!453917) (get!16358 (getValueByKey!589 (toList!6896 (+!3128 lt!453921 (tuple2!15655 lt!453906 (minValue!5957 thiss!1427)))) lt!453917)))))

(declare-fun bs!30078 () Bool)

(assert (= bs!30078 d!123423))

(declare-fun m!949257 () Bool)

(assert (=> bs!30078 m!949257))

(assert (=> bs!30078 m!949257))

(declare-fun m!949259 () Bool)

(assert (=> bs!30078 m!949259))

(assert (=> b!1029701 d!123423))

(declare-fun b!1030069 () Bool)

(declare-fun e!581623 () Bool)

(declare-fun call!43526 () Bool)

(assert (=> b!1030069 (= e!581623 call!43526)))

(declare-fun d!123425 () Bool)

(declare-fun res!688885 () Bool)

(declare-fun e!581620 () Bool)

(assert (=> d!123425 (=> res!688885 e!581620)))

(assert (=> d!123425 (= res!688885 (bvsge #b00000000000000000000000000000000 (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(assert (=> d!123425 (= (arrayNoDuplicates!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) #b00000000000000000000000000000000 Nil!21858) e!581620)))

(declare-fun b!1030070 () Bool)

(declare-fun e!581622 () Bool)

(assert (=> b!1030070 (= e!581622 e!581623)))

(declare-fun c!104140 () Bool)

(assert (=> b!1030070 (= c!104140 (validKeyInArray!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030071 () Bool)

(assert (=> b!1030071 (= e!581620 e!581622)))

(declare-fun res!688883 () Bool)

(assert (=> b!1030071 (=> (not res!688883) (not e!581622))))

(declare-fun e!581621 () Bool)

(assert (=> b!1030071 (= res!688883 (not e!581621))))

(declare-fun res!688884 () Bool)

(assert (=> b!1030071 (=> (not res!688884) (not e!581621))))

(assert (=> b!1030071 (= res!688884 (validKeyInArray!0 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030072 () Bool)

(assert (=> b!1030072 (= e!581623 call!43526)))

(declare-fun bm!43523 () Bool)

(assert (=> bm!43523 (= call!43526 (arrayNoDuplicates!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104140 (Cons!21857 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000) Nil!21858) Nil!21858)))))

(declare-fun b!1030073 () Bool)

(assert (=> b!1030073 (= e!581621 (contains!5955 Nil!21858 (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!123425 (not res!688885)) b!1030071))

(assert (= (and b!1030071 res!688884) b!1030073))

(assert (= (and b!1030071 res!688883) b!1030070))

(assert (= (and b!1030070 c!104140) b!1030072))

(assert (= (and b!1030070 (not c!104140)) b!1030069))

(assert (= (or b!1030072 b!1030069) bm!43523))

(assert (=> b!1030070 m!948851))

(assert (=> b!1030070 m!948851))

(assert (=> b!1030070 m!948853))

(assert (=> b!1030071 m!948851))

(assert (=> b!1030071 m!948851))

(assert (=> b!1030071 m!948853))

(assert (=> bm!43523 m!948851))

(declare-fun m!949261 () Bool)

(assert (=> bm!43523 m!949261))

(assert (=> b!1030073 m!948851))

(assert (=> b!1030073 m!948851))

(declare-fun m!949263 () Bool)

(assert (=> b!1030073 m!949263))

(assert (=> b!1029716 d!123425))

(declare-fun d!123427 () Bool)

(assert (=> d!123427 (not (arrayContainsKey!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123427 true))

(declare-fun _$59!20 () Unit!33515)

(assert (=> d!123427 (= (choose!121 (_keys!11283 thiss!1427) (index!41068 lt!453771) key!909) _$59!20)))

(declare-fun bs!30079 () Bool)

(assert (= bs!30079 d!123427))

(assert (=> bs!30079 m!948467))

(assert (=> bs!30079 m!948621))

(assert (=> d!123255 d!123427))

(declare-fun d!123429 () Bool)

(assert (=> d!123429 (= (apply!897 lt!453909 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16358 (getValueByKey!589 (toList!6896 lt!453909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30080 () Bool)

(assert (= bs!30080 d!123429))

(assert (=> bs!30080 m!948825))

(assert (=> bs!30080 m!948825))

(declare-fun m!949265 () Bool)

(assert (=> bs!30080 m!949265))

(assert (=> b!1029702 d!123429))

(assert (=> d!123257 d!123281))

(assert (=> b!1029699 d!123307))

(declare-fun d!123431 () Bool)

(assert (=> d!123431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) (mask!29879 thiss!1427))))

(assert (=> d!123431 true))

(declare-fun _$44!18 () Unit!33515)

(assert (=> d!123431 (= (choose!25 (_keys!11283 thiss!1427) (index!41068 lt!453771) (mask!29879 thiss!1427)) _$44!18)))

(declare-fun bs!30081 () Bool)

(assert (= bs!30081 d!123431))

(assert (=> bs!30081 m!948467))

(assert (=> bs!30081 m!948607))

(assert (=> d!123247 d!123431))

(assert (=> d!123247 d!123281))

(declare-fun d!123433 () Bool)

(declare-fun e!581624 () Bool)

(assert (=> d!123433 e!581624))

(declare-fun res!688887 () Bool)

(assert (=> d!123433 (=> (not res!688887) (not e!581624))))

(declare-fun lt!454172 () ListLongMap!13761)

(assert (=> d!123433 (= res!688887 (contains!5954 lt!454172 (_1!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun lt!454171 () List!21860)

(assert (=> d!123433 (= lt!454172 (ListLongMap!13762 lt!454171))))

(declare-fun lt!454174 () Unit!33515)

(declare-fun lt!454173 () Unit!33515)

(assert (=> d!123433 (= lt!454174 lt!454173)))

(assert (=> d!123433 (= (getValueByKey!589 lt!454171 (_1!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!639 (_2!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123433 (= lt!454173 (lemmaContainsTupThenGetReturnValue!279 lt!454171 (_1!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123433 (= lt!454171 (insertStrictlySorted!372 (toList!6896 (ite c!104051 call!43495 (ite c!104050 call!43498 call!43496))) (_1!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123433 (= (+!3128 (ite c!104051 call!43495 (ite c!104050 call!43498 call!43496)) (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) lt!454172)))

(declare-fun b!1030074 () Bool)

(declare-fun res!688886 () Bool)

(assert (=> b!1030074 (=> (not res!688886) (not e!581624))))

(assert (=> b!1030074 (= res!688886 (= (getValueByKey!589 (toList!6896 lt!454172) (_1!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!639 (_2!7838 (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))))

(declare-fun b!1030075 () Bool)

(assert (=> b!1030075 (= e!581624 (contains!5956 (toList!6896 lt!454172) (ite (or c!104051 c!104050) (tuple2!15655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (= (and d!123433 res!688887) b!1030074))

(assert (= (and b!1030074 res!688886) b!1030075))

(declare-fun m!949267 () Bool)

(assert (=> d!123433 m!949267))

(declare-fun m!949269 () Bool)

(assert (=> d!123433 m!949269))

(declare-fun m!949271 () Bool)

(assert (=> d!123433 m!949271))

(declare-fun m!949273 () Bool)

(assert (=> d!123433 m!949273))

(declare-fun m!949275 () Bool)

(assert (=> b!1030074 m!949275))

(declare-fun m!949277 () Bool)

(assert (=> b!1030075 m!949277))

(assert (=> bm!43496 d!123433))

(assert (=> b!1029782 d!123307))

(assert (=> b!1029608 d!123259))

(declare-fun b!1030076 () Bool)

(declare-fun e!581628 () Bool)

(declare-fun call!43527 () Bool)

(assert (=> b!1030076 (= e!581628 call!43527)))

(declare-fun d!123435 () Bool)

(declare-fun res!688890 () Bool)

(declare-fun e!581625 () Bool)

(assert (=> d!123435 (=> res!688890 e!581625)))

(assert (=> d!123435 (= res!688890 (bvsge #b00000000000000000000000000000000 (size!31640 (_keys!11283 thiss!1427))))))

(assert (=> d!123435 (= (arrayNoDuplicates!0 (_keys!11283 thiss!1427) #b00000000000000000000000000000000 Nil!21858) e!581625)))

(declare-fun b!1030077 () Bool)

(declare-fun e!581627 () Bool)

(assert (=> b!1030077 (= e!581627 e!581628)))

(declare-fun c!104141 () Bool)

(assert (=> b!1030077 (= c!104141 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030078 () Bool)

(assert (=> b!1030078 (= e!581625 e!581627)))

(declare-fun res!688888 () Bool)

(assert (=> b!1030078 (=> (not res!688888) (not e!581627))))

(declare-fun e!581626 () Bool)

(assert (=> b!1030078 (= res!688888 (not e!581626))))

(declare-fun res!688889 () Bool)

(assert (=> b!1030078 (=> (not res!688889) (not e!581626))))

(assert (=> b!1030078 (= res!688889 (validKeyInArray!0 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030079 () Bool)

(assert (=> b!1030079 (= e!581628 call!43527)))

(declare-fun bm!43524 () Bool)

(assert (=> bm!43524 (= call!43527 (arrayNoDuplicates!0 (_keys!11283 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104141 (Cons!21857 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000) Nil!21858) Nil!21858)))))

(declare-fun b!1030080 () Bool)

(assert (=> b!1030080 (= e!581626 (contains!5955 Nil!21858 (select (arr!31122 (_keys!11283 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123435 (not res!688890)) b!1030078))

(assert (= (and b!1030078 res!688889) b!1030080))

(assert (= (and b!1030078 res!688888) b!1030077))

(assert (= (and b!1030077 c!104141) b!1030079))

(assert (= (and b!1030077 (not c!104141)) b!1030076))

(assert (= (or b!1030079 b!1030076) bm!43524))

(assert (=> b!1030077 m!948675))

(assert (=> b!1030077 m!948675))

(assert (=> b!1030077 m!948677))

(assert (=> b!1030078 m!948675))

(assert (=> b!1030078 m!948675))

(assert (=> b!1030078 m!948677))

(assert (=> bm!43524 m!948675))

(declare-fun m!949279 () Bool)

(assert (=> bm!43524 m!949279))

(assert (=> b!1030080 m!948675))

(assert (=> b!1030080 m!948675))

(declare-fun m!949281 () Bool)

(assert (=> b!1030080 m!949281))

(assert (=> b!1029610 d!123435))

(declare-fun d!123437 () Bool)

(declare-fun res!688891 () Bool)

(declare-fun e!581629 () Bool)

(assert (=> d!123437 (=> res!688891 e!581629)))

(assert (=> d!123437 (= res!688891 (= (select (arr!31122 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123437 (= (arrayContainsKey!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) key!909 #b00000000000000000000000000000000) e!581629)))

(declare-fun b!1030081 () Bool)

(declare-fun e!581630 () Bool)

(assert (=> b!1030081 (= e!581629 e!581630)))

(declare-fun res!688892 () Bool)

(assert (=> b!1030081 (=> (not res!688892) (not e!581630))))

(assert (=> b!1030081 (= res!688892 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31640 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))))))))

(declare-fun b!1030082 () Bool)

(assert (=> b!1030082 (= e!581630 (arrayContainsKey!0 (array!64638 (store (arr!31122 (_keys!11283 thiss!1427)) (index!41068 lt!453771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31640 (_keys!11283 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123437 (not res!688891)) b!1030081))

(assert (= (and b!1030081 res!688892) b!1030082))

(assert (=> d!123437 m!948851))

(declare-fun m!949283 () Bool)

(assert (=> b!1030082 m!949283))

(assert (=> b!1029646 d!123437))

(declare-fun condMapEmpty!37935 () Bool)

(declare-fun mapDefault!37935 () ValueCell!11456)

(assert (=> mapNonEmpty!37934 (= condMapEmpty!37935 (= mapRest!37934 ((as const (Array (_ BitVec 32) ValueCell!11456)) mapDefault!37935)))))

(declare-fun e!581631 () Bool)

(declare-fun mapRes!37935 () Bool)

(assert (=> mapNonEmpty!37934 (= tp!72876 (and e!581631 mapRes!37935))))

(declare-fun b!1030084 () Bool)

(assert (=> b!1030084 (= e!581631 tp_is_empty!24319)))

(declare-fun b!1030083 () Bool)

(declare-fun e!581632 () Bool)

(assert (=> b!1030083 (= e!581632 tp_is_empty!24319)))

(declare-fun mapIsEmpty!37935 () Bool)

(assert (=> mapIsEmpty!37935 mapRes!37935))

(declare-fun mapNonEmpty!37935 () Bool)

(declare-fun tp!72877 () Bool)

(assert (=> mapNonEmpty!37935 (= mapRes!37935 (and tp!72877 e!581632))))

(declare-fun mapKey!37935 () (_ BitVec 32))

(declare-fun mapValue!37935 () ValueCell!11456)

(declare-fun mapRest!37935 () (Array (_ BitVec 32) ValueCell!11456))

(assert (=> mapNonEmpty!37935 (= mapRest!37934 (store mapRest!37935 mapKey!37935 mapValue!37935))))

(assert (= (and mapNonEmpty!37934 condMapEmpty!37935) mapIsEmpty!37935))

(assert (= (and mapNonEmpty!37934 (not condMapEmpty!37935)) mapNonEmpty!37935))

(assert (= (and mapNonEmpty!37935 ((_ is ValueCellFull!11456) mapValue!37935)) b!1030083))

(assert (= (and mapNonEmpty!37934 ((_ is ValueCellFull!11456) mapDefault!37935)) b!1030084))

(declare-fun m!949285 () Bool)

(assert (=> mapNonEmpty!37935 m!949285))

(declare-fun b_lambda!15901 () Bool)

(assert (= b_lambda!15899 (or (and b!1029545 b_free!20599) b_lambda!15901)))

(declare-fun b_lambda!15903 () Bool)

(assert (= b_lambda!15891 (or (and b!1029545 b_free!20599) b_lambda!15903)))

(declare-fun b_lambda!15905 () Bool)

(assert (= b_lambda!15893 (or (and b!1029545 b_free!20599) b_lambda!15905)))

(declare-fun b_lambda!15907 () Bool)

(assert (= b_lambda!15897 (or (and b!1029545 b_free!20599) b_lambda!15907)))

(declare-fun b_lambda!15909 () Bool)

(assert (= b_lambda!15895 (or (and b!1029545 b_free!20599) b_lambda!15909)))

(declare-fun b_lambda!15911 () Bool)

(assert (= b_lambda!15889 (or (and b!1029545 b_free!20599) b_lambda!15911)))

(check-sat b_and!32943 (not b!1029981) (not b!1029910) (not bm!43521) (not b!1030009) (not b!1030059) (not b_lambda!15885) (not b!1030003) (not b!1029885) (not b!1029931) (not b!1030026) (not d!123335) (not d!123315) (not b!1029971) (not b!1029903) (not b!1029862) (not b!1030077) (not bm!43512) (not b!1030066) (not d!123381) (not d!123323) (not d!123277) (not b!1029963) (not b!1030070) (not bm!43518) (not b!1030031) (not b!1029965) (not d!123287) (not d!123321) (not b!1029929) (not d!123399) (not d!123433) (not b!1029884) (not b!1029877) (not d!123347) (not b!1030004) (not b!1030030) (not d!123329) (not b!1029825) (not b!1030023) (not b!1029967) (not d!123373) (not b!1030063) (not b!1030068) (not d!123291) (not d!123299) (not d!123349) (not bm!43523) (not b!1030082) (not b!1030008) (not b!1029978) (not b!1029960) (not b!1029968) (not b!1029864) (not d!123427) (not b!1029890) (not b_lambda!15903) (not b!1030073) (not b!1029989) (not b!1030058) (not d!123401) (not b!1029888) (not b!1029891) (not d!123337) (not bm!43524) (not d!123397) (not d!123319) (not d!123391) (not d!123361) (not b_lambda!15905) (not b!1030060) (not b_lambda!15901) (not b!1030051) (not b!1030062) (not bm!43507) (not d!123377) (not b!1029969) (not d!123275) (not d!123351) (not b!1029962) (not bm!43522) (not b!1030080) (not d!123343) (not b!1029925) (not b_lambda!15909) (not d!123389) (not d!123327) (not b!1029980) (not b!1029956) (not b_next!20599) (not d!123297) (not d!123419) (not b!1030025) (not b!1029961) (not b!1030032) (not b_lambda!15911) (not d!123293) (not d!123423) (not d!123283) (not d!123341) (not d!123317) (not bm!43514) (not b!1030011) (not b!1030013) (not d!123355) (not d!123379) (not b!1029867) (not b!1030075) (not bm!43508) (not d!123345) (not d!123407) (not bm!43510) (not b!1029923) (not b!1030053) (not b!1029886) (not b!1029868) (not b!1029894) (not d!123353) (not b!1029863) (not d!123431) (not bm!43520) (not d!123411) (not b!1029803) (not bm!43519) (not b!1029879) (not b!1029896) (not d!123285) (not b!1029902) (not b!1029893) (not d!123405) (not b!1030071) (not b!1029991) (not b!1030002) (not d!123415) (not b!1030000) (not bm!43509) (not b!1030029) tp_is_empty!24319 (not b!1029984) (not b_lambda!15907) (not b_lambda!15883) (not b!1029946) (not b!1029909) (not b!1030005) (not b!1030028) (not d!123331) (not b!1029865) (not d!123395) (not b!1030056) (not b!1030055) (not b!1029901) (not b!1029912) (not d!123359) (not b!1029964) (not b!1030074) (not b!1029804) (not b!1030047) (not bm!43511) (not b!1029972) (not b!1030078) (not b!1029966) (not b!1029928) (not d!123357) (not b_lambda!15887) (not b!1030001) (not b!1029958) (not b!1030022) (not d!123383) (not d!123333) (not b!1029875) (not d!123417) (not b!1029860) (not bm!43517) (not b!1029861) (not d!123413) (not d!123387) (not b_lambda!15875) (not d!123409) (not d!123403) (not b!1030061) (not d!123367) (not b!1029993) (not d!123421) (not mapNonEmpty!37935) (not d!123429) (not d!123375) (not b!1029907) (not d!123339) (not d!123311) (not b!1030007))
(check-sat b_and!32943 (not b_next!20599))
