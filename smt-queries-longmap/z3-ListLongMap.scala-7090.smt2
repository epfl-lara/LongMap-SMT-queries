; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90040 () Bool)

(assert start!90040)

(declare-fun b!1030452 () Bool)

(declare-fun b_free!20593 () Bool)

(declare-fun b_next!20593 () Bool)

(assert (=> b!1030452 (= b_free!20593 (not b_next!20593))))

(declare-fun tp!72838 () Bool)

(declare-fun b_and!32921 () Bool)

(assert (=> b!1030452 (= tp!72838 b_and!32921)))

(declare-fun b!1030445 () Bool)

(declare-fun e!581844 () Bool)

(declare-fun e!581848 () Bool)

(declare-fun mapRes!37912 () Bool)

(assert (=> b!1030445 (= e!581844 (and e!581848 mapRes!37912))))

(declare-fun condMapEmpty!37912 () Bool)

(declare-datatypes ((V!37291 0))(
  ( (V!37292 (val!12207 Int)) )
))
(declare-datatypes ((ValueCell!11453 0))(
  ( (ValueCellFull!11453 (v!14776 V!37291)) (EmptyCell!11453) )
))
(declare-datatypes ((array!64733 0))(
  ( (array!64734 (arr!31165 (Array (_ BitVec 32) (_ BitVec 64))) (size!31681 (_ BitVec 32))) )
))
(declare-datatypes ((array!64735 0))(
  ( (array!64736 (arr!31166 (Array (_ BitVec 32) ValueCell!11453)) (size!31682 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5500 0))(
  ( (LongMapFixedSize!5501 (defaultEntry!6114 Int) (mask!29926 (_ BitVec 32)) (extraKeys!5846 (_ BitVec 32)) (zeroValue!5950 V!37291) (minValue!5950 V!37291) (_size!2805 (_ BitVec 32)) (_keys!11313 array!64733) (_values!6137 array!64735) (_vacant!2805 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5500)

(declare-fun mapDefault!37912 () ValueCell!11453)

(assert (=> b!1030445 (= condMapEmpty!37912 (= (arr!31166 (_values!6137 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11453)) mapDefault!37912)))))

(declare-fun b!1030446 () Bool)

(declare-fun tp_is_empty!24313 () Bool)

(assert (=> b!1030446 (= e!581848 tp_is_empty!24313)))

(declare-fun b!1030447 () Bool)

(declare-fun e!581845 () Bool)

(declare-fun e!581846 () Bool)

(assert (=> b!1030447 (= e!581845 (not e!581846))))

(declare-fun res!688979 () Bool)

(assert (=> b!1030447 (=> res!688979 e!581846)))

(declare-datatypes ((Unit!33620 0))(
  ( (Unit!33621) )
))
(declare-datatypes ((tuple2!15570 0))(
  ( (tuple2!15571 (_1!7796 Unit!33620) (_2!7796 LongMapFixedSize!5500)) )
))
(declare-fun lt!454072 () tuple2!15570)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030447 (= res!688979 (not (validMask!0 (mask!29926 (_2!7796 lt!454072)))))))

(declare-fun lt!454068 () array!64735)

(declare-fun lt!454067 () array!64733)

(declare-fun Unit!33622 () Unit!33620)

(declare-fun Unit!33623 () Unit!33620)

(assert (=> b!1030447 (= lt!454072 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2805 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15571 Unit!33622 (LongMapFixedSize!5501 (defaultEntry!6114 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvsub (_size!2805 thiss!1427) #b00000000000000000000000000000001) lt!454067 lt!454068 (bvadd #b00000000000000000000000000000001 (_vacant!2805 thiss!1427)))) (tuple2!15571 Unit!33623 (LongMapFixedSize!5501 (defaultEntry!6114 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvsub (_size!2805 thiss!1427) #b00000000000000000000000000000001) lt!454067 lt!454068 (_vacant!2805 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15572 0))(
  ( (tuple2!15573 (_1!7797 (_ BitVec 64)) (_2!7797 V!37291)) )
))
(declare-datatypes ((List!21812 0))(
  ( (Nil!21809) (Cons!21808 (h!23017 tuple2!15572) (t!30892 List!21812)) )
))
(declare-datatypes ((ListLongMap!13695 0))(
  ( (ListLongMap!13696 (toList!6863 List!21812)) )
))
(declare-fun -!486 (ListLongMap!13695 (_ BitVec 64)) ListLongMap!13695)

(declare-fun getCurrentListMap!3909 (array!64733 array!64735 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) Int) ListLongMap!13695)

(assert (=> b!1030447 (= (-!486 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3909 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9638 0))(
  ( (MissingZero!9638 (index!40923 (_ BitVec 32))) (Found!9638 (index!40924 (_ BitVec 32))) (Intermediate!9638 (undefined!10450 Bool) (index!40925 (_ BitVec 32)) (x!91564 (_ BitVec 32))) (Undefined!9638) (MissingVacant!9638 (index!40926 (_ BitVec 32))) )
))
(declare-fun lt!454069 () SeekEntryResult!9638)

(declare-fun dynLambda!1980 (Int (_ BitVec 64)) V!37291)

(assert (=> b!1030447 (= lt!454068 (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))))))

(declare-fun lt!454066 () Unit!33620)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!12 (array!64733 array!64735 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) (_ BitVec 64) Int) Unit!33620)

(assert (=> b!1030447 (= lt!454066 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!12 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!40924 lt!454069) key!909 (defaultEntry!6114 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030447 (not (arrayContainsKey!0 lt!454067 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454071 () Unit!33620)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64733 (_ BitVec 32) (_ BitVec 64)) Unit!33620)

(assert (=> b!1030447 (= lt!454071 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11313 thiss!1427) (index!40924 lt!454069) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64733 (_ BitVec 32)) Bool)

(assert (=> b!1030447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454067 (mask!29926 thiss!1427))))

(declare-fun lt!454070 () Unit!33620)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64733 (_ BitVec 32) (_ BitVec 32)) Unit!33620)

(assert (=> b!1030447 (= lt!454070 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11313 thiss!1427) (index!40924 lt!454069) (mask!29926 thiss!1427)))))

(declare-datatypes ((List!21813 0))(
  ( (Nil!21810) (Cons!21809 (h!23018 (_ BitVec 64)) (t!30893 List!21813)) )
))
(declare-fun arrayNoDuplicates!0 (array!64733 (_ BitVec 32) List!21813) Bool)

(assert (=> b!1030447 (arrayNoDuplicates!0 lt!454067 #b00000000000000000000000000000000 Nil!21810)))

(declare-fun lt!454064 () Unit!33620)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21813) Unit!33620)

(assert (=> b!1030447 (= lt!454064 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11313 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40924 lt!454069) #b00000000000000000000000000000000 Nil!21810))))

(declare-fun arrayCountValidKeys!0 (array!64733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030447 (= (arrayCountValidKeys!0 lt!454067 #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030447 (= lt!454067 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun lt!454065 () Unit!33620)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64733 (_ BitVec 32) (_ BitVec 64)) Unit!33620)

(assert (=> b!1030447 (= lt!454065 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11313 thiss!1427) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!688981 () Bool)

(declare-fun e!581850 () Bool)

(assert (=> start!90040 (=> (not res!688981) (not e!581850))))

(declare-fun valid!2090 (LongMapFixedSize!5500) Bool)

(assert (=> start!90040 (= res!688981 (valid!2090 thiss!1427))))

(assert (=> start!90040 e!581850))

(declare-fun e!581843 () Bool)

(assert (=> start!90040 e!581843))

(assert (=> start!90040 true))

(declare-fun mapIsEmpty!37912 () Bool)

(assert (=> mapIsEmpty!37912 mapRes!37912))

(declare-fun b!1030448 () Bool)

(declare-fun res!688978 () Bool)

(assert (=> b!1030448 (=> (not res!688978) (not e!581850))))

(assert (=> b!1030448 (= res!688978 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030449 () Bool)

(assert (=> b!1030449 (= e!581850 e!581845)))

(declare-fun res!688980 () Bool)

(assert (=> b!1030449 (=> (not res!688980) (not e!581845))))

(get-info :version)

(assert (=> b!1030449 (= res!688980 ((_ is Found!9638) lt!454069))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64733 (_ BitVec 32)) SeekEntryResult!9638)

(assert (=> b!1030449 (= lt!454069 (seekEntry!0 key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(declare-fun b!1030450 () Bool)

(declare-fun e!581847 () Bool)

(assert (=> b!1030450 (= e!581847 tp_is_empty!24313)))

(declare-fun b!1030451 () Bool)

(assert (=> b!1030451 (= e!581846 (or (not (= (size!31682 (_values!6137 (_2!7796 lt!454072))) (bvadd #b00000000000000000000000000000001 (mask!29926 (_2!7796 lt!454072))))) (not (= (size!31681 (_keys!11313 (_2!7796 lt!454072))) (size!31682 (_values!6137 (_2!7796 lt!454072))))) (bvslt (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000000000000) (bvsge (extraKeys!5846 (_2!7796 lt!454072)) #b00000000000000000000000000000000)))))

(declare-fun array_inv!24141 (array!64733) Bool)

(declare-fun array_inv!24142 (array!64735) Bool)

(assert (=> b!1030452 (= e!581843 (and tp!72838 tp_is_empty!24313 (array_inv!24141 (_keys!11313 thiss!1427)) (array_inv!24142 (_values!6137 thiss!1427)) e!581844))))

(declare-fun mapNonEmpty!37912 () Bool)

(declare-fun tp!72839 () Bool)

(assert (=> mapNonEmpty!37912 (= mapRes!37912 (and tp!72839 e!581847))))

(declare-fun mapRest!37912 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapValue!37912 () ValueCell!11453)

(declare-fun mapKey!37912 () (_ BitVec 32))

(assert (=> mapNonEmpty!37912 (= (arr!31166 (_values!6137 thiss!1427)) (store mapRest!37912 mapKey!37912 mapValue!37912))))

(assert (= (and start!90040 res!688981) b!1030448))

(assert (= (and b!1030448 res!688978) b!1030449))

(assert (= (and b!1030449 res!688980) b!1030447))

(assert (= (and b!1030447 (not res!688979)) b!1030451))

(assert (= (and b!1030445 condMapEmpty!37912) mapIsEmpty!37912))

(assert (= (and b!1030445 (not condMapEmpty!37912)) mapNonEmpty!37912))

(assert (= (and mapNonEmpty!37912 ((_ is ValueCellFull!11453) mapValue!37912)) b!1030450))

(assert (= (and b!1030445 ((_ is ValueCellFull!11453) mapDefault!37912)) b!1030446))

(assert (= b!1030452 b!1030445))

(assert (= start!90040 b!1030452))

(declare-fun b_lambda!15857 () Bool)

(assert (=> (not b_lambda!15857) (not b!1030447)))

(declare-fun t!30891 () Bool)

(declare-fun tb!6903 () Bool)

(assert (=> (and b!1030452 (= (defaultEntry!6114 thiss!1427) (defaultEntry!6114 thiss!1427)) t!30891) tb!6903))

(declare-fun result!14137 () Bool)

(assert (=> tb!6903 (= result!14137 tp_is_empty!24313)))

(assert (=> b!1030447 t!30891))

(declare-fun b_and!32923 () Bool)

(assert (= b_and!32921 (and (=> t!30891 result!14137) b_and!32923)))

(declare-fun m!949907 () Bool)

(assert (=> mapNonEmpty!37912 m!949907))

(declare-fun m!949909 () Bool)

(assert (=> b!1030449 m!949909))

(declare-fun m!949911 () Bool)

(assert (=> start!90040 m!949911))

(declare-fun m!949913 () Bool)

(assert (=> b!1030447 m!949913))

(declare-fun m!949915 () Bool)

(assert (=> b!1030447 m!949915))

(declare-fun m!949917 () Bool)

(assert (=> b!1030447 m!949917))

(declare-fun m!949919 () Bool)

(assert (=> b!1030447 m!949919))

(declare-fun m!949921 () Bool)

(assert (=> b!1030447 m!949921))

(declare-fun m!949923 () Bool)

(assert (=> b!1030447 m!949923))

(declare-fun m!949925 () Bool)

(assert (=> b!1030447 m!949925))

(declare-fun m!949927 () Bool)

(assert (=> b!1030447 m!949927))

(declare-fun m!949929 () Bool)

(assert (=> b!1030447 m!949929))

(declare-fun m!949931 () Bool)

(assert (=> b!1030447 m!949931))

(declare-fun m!949933 () Bool)

(assert (=> b!1030447 m!949933))

(declare-fun m!949935 () Bool)

(assert (=> b!1030447 m!949935))

(declare-fun m!949937 () Bool)

(assert (=> b!1030447 m!949937))

(declare-fun m!949939 () Bool)

(assert (=> b!1030447 m!949939))

(assert (=> b!1030447 m!949931))

(declare-fun m!949941 () Bool)

(assert (=> b!1030447 m!949941))

(declare-fun m!949943 () Bool)

(assert (=> b!1030447 m!949943))

(declare-fun m!949945 () Bool)

(assert (=> b!1030447 m!949945))

(declare-fun m!949947 () Bool)

(assert (=> b!1030452 m!949947))

(declare-fun m!949949 () Bool)

(assert (=> b!1030452 m!949949))

(check-sat (not mapNonEmpty!37912) (not start!90040) (not b!1030452) b_and!32923 (not b_next!20593) tp_is_empty!24313 (not b!1030449) (not b_lambda!15857) (not b!1030447))
(check-sat b_and!32923 (not b_next!20593))
(get-model)

(declare-fun b_lambda!15863 () Bool)

(assert (= b_lambda!15857 (or (and b!1030452 b_free!20593) b_lambda!15863)))

(check-sat (not mapNonEmpty!37912) (not start!90040) (not b!1030452) b_and!32923 (not b!1030447) (not b_next!20593) (not b_lambda!15863) tp_is_empty!24313 (not b!1030449))
(check-sat b_and!32923 (not b_next!20593))
(get-model)

(declare-fun b!1030519 () Bool)

(declare-fun c!104340 () Bool)

(declare-fun lt!454137 () (_ BitVec 64))

(assert (=> b!1030519 (= c!104340 (= lt!454137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581906 () SeekEntryResult!9638)

(declare-fun e!581907 () SeekEntryResult!9638)

(assert (=> b!1030519 (= e!581906 e!581907)))

(declare-fun b!1030520 () Bool)

(declare-fun lt!454138 () SeekEntryResult!9638)

(assert (=> b!1030520 (= e!581907 (ite ((_ is MissingVacant!9638) lt!454138) (MissingZero!9638 (index!40926 lt!454138)) lt!454138))))

(declare-fun lt!454135 () SeekEntryResult!9638)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64733 (_ BitVec 32)) SeekEntryResult!9638)

(assert (=> b!1030520 (= lt!454138 (seekKeyOrZeroReturnVacant!0 (x!91564 lt!454135) (index!40925 lt!454135) (index!40925 lt!454135) key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(declare-fun b!1030521 () Bool)

(declare-fun e!581905 () SeekEntryResult!9638)

(assert (=> b!1030521 (= e!581905 Undefined!9638)))

(declare-fun d!123649 () Bool)

(declare-fun lt!454136 () SeekEntryResult!9638)

(assert (=> d!123649 (and (or ((_ is MissingVacant!9638) lt!454136) (not ((_ is Found!9638) lt!454136)) (and (bvsge (index!40924 lt!454136) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454136) (size!31681 (_keys!11313 thiss!1427))))) (not ((_ is MissingVacant!9638) lt!454136)) (or (not ((_ is Found!9638) lt!454136)) (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454136)) key!909)))))

(assert (=> d!123649 (= lt!454136 e!581905)))

(declare-fun c!104339 () Bool)

(assert (=> d!123649 (= c!104339 (and ((_ is Intermediate!9638) lt!454135) (undefined!10450 lt!454135)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64733 (_ BitVec 32)) SeekEntryResult!9638)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123649 (= lt!454135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29926 thiss!1427)) key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(assert (=> d!123649 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123649 (= (seekEntry!0 key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)) lt!454136)))

(declare-fun b!1030522 () Bool)

(assert (=> b!1030522 (= e!581906 (Found!9638 (index!40925 lt!454135)))))

(declare-fun b!1030523 () Bool)

(assert (=> b!1030523 (= e!581907 (MissingZero!9638 (index!40925 lt!454135)))))

(declare-fun b!1030524 () Bool)

(assert (=> b!1030524 (= e!581905 e!581906)))

(assert (=> b!1030524 (= lt!454137 (select (arr!31165 (_keys!11313 thiss!1427)) (index!40925 lt!454135)))))

(declare-fun c!104341 () Bool)

(assert (=> b!1030524 (= c!104341 (= lt!454137 key!909))))

(assert (= (and d!123649 c!104339) b!1030521))

(assert (= (and d!123649 (not c!104339)) b!1030524))

(assert (= (and b!1030524 c!104341) b!1030522))

(assert (= (and b!1030524 (not c!104341)) b!1030519))

(assert (= (and b!1030519 c!104340) b!1030523))

(assert (= (and b!1030519 (not c!104340)) b!1030520))

(declare-fun m!950039 () Bool)

(assert (=> b!1030520 m!950039))

(declare-fun m!950041 () Bool)

(assert (=> d!123649 m!950041))

(declare-fun m!950043 () Bool)

(assert (=> d!123649 m!950043))

(assert (=> d!123649 m!950043))

(declare-fun m!950045 () Bool)

(assert (=> d!123649 m!950045))

(declare-fun m!950047 () Bool)

(assert (=> d!123649 m!950047))

(declare-fun m!950049 () Bool)

(assert (=> b!1030524 m!950049))

(assert (=> b!1030449 d!123649))

(declare-fun d!123651 () Bool)

(declare-fun e!581910 () Bool)

(assert (=> d!123651 e!581910))

(declare-fun res!689008 () Bool)

(assert (=> d!123651 (=> (not res!689008) (not e!581910))))

(assert (=> d!123651 (= res!689008 (and (bvsge (index!40924 lt!454069) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454069) (size!31681 (_keys!11313 thiss!1427)))))))

(declare-fun lt!454141 () Unit!33620)

(declare-fun choose!1693 (array!64733 array!64735 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) (_ BitVec 64) Int) Unit!33620)

(assert (=> d!123651 (= lt!454141 (choose!1693 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!40924 lt!454069) key!909 (defaultEntry!6114 thiss!1427)))))

(assert (=> d!123651 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123651 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!12 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!40924 lt!454069) key!909 (defaultEntry!6114 thiss!1427)) lt!454141)))

(declare-fun b!1030527 () Bool)

(assert (=> b!1030527 (= e!581910 (= (-!486 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3909 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))))

(assert (=> b!1030527 (bvslt (index!40924 lt!454069) (size!31682 (_values!6137 thiss!1427)))))

(assert (= (and d!123651 res!689008) b!1030527))

(declare-fun b_lambda!15865 () Bool)

(assert (=> (not b_lambda!15865) (not b!1030527)))

(assert (=> b!1030527 t!30891))

(declare-fun b_and!32933 () Bool)

(assert (= b_and!32923 (and (=> t!30891 result!14137) b_and!32933)))

(declare-fun m!950051 () Bool)

(assert (=> d!123651 m!950051))

(assert (=> d!123651 m!950047))

(assert (=> b!1030527 m!949933))

(assert (=> b!1030527 m!949913))

(declare-fun m!950053 () Bool)

(assert (=> b!1030527 m!950053))

(assert (=> b!1030527 m!949931))

(assert (=> b!1030527 m!949919))

(assert (=> b!1030527 m!949931))

(assert (=> b!1030527 m!949941))

(assert (=> b!1030447 d!123651))

(declare-fun b!1030538 () Bool)

(declare-fun e!581919 () Bool)

(declare-fun e!581920 () Bool)

(assert (=> b!1030538 (= e!581919 e!581920)))

(declare-fun res!689016 () Bool)

(assert (=> b!1030538 (=> (not res!689016) (not e!581920))))

(declare-fun e!581921 () Bool)

(assert (=> b!1030538 (= res!689016 (not e!581921))))

(declare-fun res!689017 () Bool)

(assert (=> b!1030538 (=> (not res!689017) (not e!581921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1030538 (= res!689017 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun bm!43501 () Bool)

(declare-fun call!43504 () Bool)

(declare-fun c!104344 () Bool)

(assert (=> bm!43501 (= call!43504 (arrayNoDuplicates!0 lt!454067 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104344 (Cons!21809 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) Nil!21810) Nil!21810)))))

(declare-fun d!123653 () Bool)

(declare-fun res!689015 () Bool)

(assert (=> d!123653 (=> res!689015 e!581919)))

(assert (=> d!123653 (= res!689015 (bvsge #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(assert (=> d!123653 (= (arrayNoDuplicates!0 lt!454067 #b00000000000000000000000000000000 Nil!21810) e!581919)))

(declare-fun b!1030539 () Bool)

(declare-fun contains!5997 (List!21813 (_ BitVec 64)) Bool)

(assert (=> b!1030539 (= e!581921 (contains!5997 Nil!21810 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030540 () Bool)

(declare-fun e!581922 () Bool)

(assert (=> b!1030540 (= e!581922 call!43504)))

(declare-fun b!1030541 () Bool)

(assert (=> b!1030541 (= e!581922 call!43504)))

(declare-fun b!1030542 () Bool)

(assert (=> b!1030542 (= e!581920 e!581922)))

(assert (=> b!1030542 (= c!104344 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (= (and d!123653 (not res!689015)) b!1030538))

(assert (= (and b!1030538 res!689017) b!1030539))

(assert (= (and b!1030538 res!689016) b!1030542))

(assert (= (and b!1030542 c!104344) b!1030540))

(assert (= (and b!1030542 (not c!104344)) b!1030541))

(assert (= (or b!1030540 b!1030541) bm!43501))

(declare-fun m!950055 () Bool)

(assert (=> b!1030538 m!950055))

(assert (=> b!1030538 m!950055))

(declare-fun m!950057 () Bool)

(assert (=> b!1030538 m!950057))

(assert (=> bm!43501 m!950055))

(declare-fun m!950059 () Bool)

(assert (=> bm!43501 m!950059))

(assert (=> b!1030539 m!950055))

(assert (=> b!1030539 m!950055))

(declare-fun m!950061 () Bool)

(assert (=> b!1030539 m!950061))

(assert (=> b!1030542 m!950055))

(assert (=> b!1030542 m!950055))

(assert (=> b!1030542 m!950057))

(assert (=> b!1030447 d!123653))

(declare-fun b!1030585 () Bool)

(declare-fun e!581960 () Bool)

(declare-fun lt!454197 () ListLongMap!13695)

(declare-fun apply!912 (ListLongMap!13695 (_ BitVec 64)) V!37291)

(declare-fun get!16385 (ValueCell!11453 V!37291) V!37291)

(assert (=> b!1030585 (= e!581960 (= (apply!912 lt!454197 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)) (get!16385 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31682 (_values!6137 thiss!1427))))))

(assert (=> b!1030585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun b!1030586 () Bool)

(declare-fun e!581957 () ListLongMap!13695)

(declare-fun call!43522 () ListLongMap!13695)

(assert (=> b!1030586 (= e!581957 call!43522)))

(declare-fun b!1030587 () Bool)

(declare-fun call!43519 () ListLongMap!13695)

(assert (=> b!1030587 (= e!581957 call!43519)))

(declare-fun b!1030588 () Bool)

(declare-fun e!581956 () Bool)

(assert (=> b!1030588 (= e!581956 (= (apply!912 lt!454197 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5950 thiss!1427)))))

(declare-fun b!1030589 () Bool)

(declare-fun c!104360 () Bool)

(assert (=> b!1030589 (= c!104360 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581955 () ListLongMap!13695)

(assert (=> b!1030589 (= e!581955 e!581957)))

(declare-fun bm!43516 () Bool)

(declare-fun call!43523 () ListLongMap!13695)

(assert (=> bm!43516 (= call!43519 call!43523)))

(declare-fun b!1030590 () Bool)

(declare-fun e!581961 () Bool)

(declare-fun e!581950 () Bool)

(assert (=> b!1030590 (= e!581961 e!581950)))

(declare-fun res!689042 () Bool)

(declare-fun call!43520 () Bool)

(assert (=> b!1030590 (= res!689042 call!43520)))

(assert (=> b!1030590 (=> (not res!689042) (not e!581950))))

(declare-fun b!1030591 () Bool)

(declare-fun res!689036 () Bool)

(declare-fun e!581952 () Bool)

(assert (=> b!1030591 (=> (not res!689036) (not e!581952))))

(declare-fun e!581959 () Bool)

(assert (=> b!1030591 (= res!689036 e!581959)))

(declare-fun res!689043 () Bool)

(assert (=> b!1030591 (=> res!689043 e!581959)))

(declare-fun e!581949 () Bool)

(assert (=> b!1030591 (= res!689043 (not e!581949))))

(declare-fun res!689044 () Bool)

(assert (=> b!1030591 (=> (not res!689044) (not e!581949))))

(assert (=> b!1030591 (= res!689044 (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun bm!43517 () Bool)

(declare-fun call!43524 () ListLongMap!13695)

(assert (=> bm!43517 (= call!43522 call!43524)))

(declare-fun bm!43518 () Bool)

(declare-fun call!43521 () ListLongMap!13695)

(declare-fun getCurrentListMapNoExtraKeys!3563 (array!64733 array!64735 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) Int) ListLongMap!13695)

(assert (=> bm!43518 (= call!43521 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1030593 () Bool)

(declare-fun res!689039 () Bool)

(assert (=> b!1030593 (=> (not res!689039) (not e!581952))))

(declare-fun e!581958 () Bool)

(assert (=> b!1030593 (= res!689039 e!581958)))

(declare-fun c!104359 () Bool)

(assert (=> b!1030593 (= c!104359 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!104358 () Bool)

(declare-fun c!104361 () Bool)

(declare-fun bm!43519 () Bool)

(declare-fun +!3123 (ListLongMap!13695 tuple2!15572) ListLongMap!13695)

(assert (=> bm!43519 (= call!43523 (+!3123 (ite c!104361 call!43521 (ite c!104358 call!43524 call!43522)) (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun b!1030594 () Bool)

(declare-fun e!581951 () Unit!33620)

(declare-fun Unit!33630 () Unit!33620)

(assert (=> b!1030594 (= e!581951 Unit!33630)))

(declare-fun bm!43520 () Bool)

(assert (=> bm!43520 (= call!43524 call!43521)))

(declare-fun b!1030595 () Bool)

(declare-fun e!581953 () ListLongMap!13695)

(assert (=> b!1030595 (= e!581953 (+!3123 call!43523 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(declare-fun b!1030596 () Bool)

(assert (=> b!1030596 (= e!581952 e!581961)))

(declare-fun c!104357 () Bool)

(assert (=> b!1030596 (= c!104357 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030597 () Bool)

(declare-fun call!43525 () Bool)

(assert (=> b!1030597 (= e!581958 (not call!43525))))

(declare-fun b!1030598 () Bool)

(assert (=> b!1030598 (= e!581953 e!581955)))

(assert (=> b!1030598 (= c!104358 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030599 () Bool)

(assert (=> b!1030599 (= e!581949 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030592 () Bool)

(assert (=> b!1030592 (= e!581959 e!581960)))

(declare-fun res!689041 () Bool)

(assert (=> b!1030592 (=> (not res!689041) (not e!581960))))

(declare-fun contains!5998 (ListLongMap!13695 (_ BitVec 64)) Bool)

(assert (=> b!1030592 (= res!689041 (contains!5998 lt!454197 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030592 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123655 () Bool)

(assert (=> d!123655 e!581952))

(declare-fun res!689040 () Bool)

(assert (=> d!123655 (=> (not res!689040) (not e!581952))))

(assert (=> d!123655 (= res!689040 (or (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))))

(declare-fun lt!454186 () ListLongMap!13695)

(assert (=> d!123655 (= lt!454197 lt!454186)))

(declare-fun lt!454191 () Unit!33620)

(assert (=> d!123655 (= lt!454191 e!581951)))

(declare-fun c!104362 () Bool)

(declare-fun e!581954 () Bool)

(assert (=> d!123655 (= c!104362 e!581954)))

(declare-fun res!689038 () Bool)

(assert (=> d!123655 (=> (not res!689038) (not e!581954))))

(assert (=> d!123655 (= res!689038 (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123655 (= lt!454186 e!581953)))

(assert (=> d!123655 (= c!104361 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123655 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123655 (= (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!454197)))

(declare-fun b!1030600 () Bool)

(declare-fun lt!454198 () Unit!33620)

(assert (=> b!1030600 (= e!581951 lt!454198)))

(declare-fun lt!454188 () ListLongMap!13695)

(assert (=> b!1030600 (= lt!454188 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454202 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454202 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454203 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454203 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454192 () Unit!33620)

(declare-fun addStillContains!622 (ListLongMap!13695 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33620)

(assert (=> b!1030600 (= lt!454192 (addStillContains!622 lt!454188 lt!454202 (zeroValue!5950 thiss!1427) lt!454203))))

(assert (=> b!1030600 (contains!5998 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))) lt!454203)))

(declare-fun lt!454196 () Unit!33620)

(assert (=> b!1030600 (= lt!454196 lt!454192)))

(declare-fun lt!454195 () ListLongMap!13695)

(assert (=> b!1030600 (= lt!454195 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454207 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454207 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454200 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454200 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454206 () Unit!33620)

(declare-fun addApplyDifferent!478 (ListLongMap!13695 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33620)

(assert (=> b!1030600 (= lt!454206 (addApplyDifferent!478 lt!454195 lt!454207 (minValue!5950 thiss!1427) lt!454200))))

(assert (=> b!1030600 (= (apply!912 (+!3123 lt!454195 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))) lt!454200) (apply!912 lt!454195 lt!454200))))

(declare-fun lt!454201 () Unit!33620)

(assert (=> b!1030600 (= lt!454201 lt!454206)))

(declare-fun lt!454199 () ListLongMap!13695)

(assert (=> b!1030600 (= lt!454199 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454204 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454205 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454205 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454190 () Unit!33620)

(assert (=> b!1030600 (= lt!454190 (addApplyDifferent!478 lt!454199 lt!454204 (zeroValue!5950 thiss!1427) lt!454205))))

(assert (=> b!1030600 (= (apply!912 (+!3123 lt!454199 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))) lt!454205) (apply!912 lt!454199 lt!454205))))

(declare-fun lt!454187 () Unit!33620)

(assert (=> b!1030600 (= lt!454187 lt!454190)))

(declare-fun lt!454194 () ListLongMap!13695)

(assert (=> b!1030600 (= lt!454194 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454193 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454193 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454189 () (_ BitVec 64))

(assert (=> b!1030600 (= lt!454189 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030600 (= lt!454198 (addApplyDifferent!478 lt!454194 lt!454193 (minValue!5950 thiss!1427) lt!454189))))

(assert (=> b!1030600 (= (apply!912 (+!3123 lt!454194 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))) lt!454189) (apply!912 lt!454194 lt!454189))))

(declare-fun bm!43521 () Bool)

(assert (=> bm!43521 (= call!43520 (contains!5998 lt!454197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030601 () Bool)

(assert (=> b!1030601 (= e!581955 call!43519)))

(declare-fun b!1030602 () Bool)

(assert (=> b!1030602 (= e!581954 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030603 () Bool)

(assert (=> b!1030603 (= e!581958 e!581956)))

(declare-fun res!689037 () Bool)

(assert (=> b!1030603 (= res!689037 call!43525)))

(assert (=> b!1030603 (=> (not res!689037) (not e!581956))))

(declare-fun b!1030604 () Bool)

(assert (=> b!1030604 (= e!581961 (not call!43520))))

(declare-fun bm!43522 () Bool)

(assert (=> bm!43522 (= call!43525 (contains!5998 lt!454197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030605 () Bool)

(assert (=> b!1030605 (= e!581950 (= (apply!912 lt!454197 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5950 thiss!1427)))))

(assert (= (and d!123655 c!104361) b!1030595))

(assert (= (and d!123655 (not c!104361)) b!1030598))

(assert (= (and b!1030598 c!104358) b!1030601))

(assert (= (and b!1030598 (not c!104358)) b!1030589))

(assert (= (and b!1030589 c!104360) b!1030587))

(assert (= (and b!1030589 (not c!104360)) b!1030586))

(assert (= (or b!1030587 b!1030586) bm!43517))

(assert (= (or b!1030601 bm!43517) bm!43520))

(assert (= (or b!1030601 b!1030587) bm!43516))

(assert (= (or b!1030595 bm!43520) bm!43518))

(assert (= (or b!1030595 bm!43516) bm!43519))

(assert (= (and d!123655 res!689038) b!1030602))

(assert (= (and d!123655 c!104362) b!1030600))

(assert (= (and d!123655 (not c!104362)) b!1030594))

(assert (= (and d!123655 res!689040) b!1030591))

(assert (= (and b!1030591 res!689044) b!1030599))

(assert (= (and b!1030591 (not res!689043)) b!1030592))

(assert (= (and b!1030592 res!689041) b!1030585))

(assert (= (and b!1030591 res!689036) b!1030593))

(assert (= (and b!1030593 c!104359) b!1030603))

(assert (= (and b!1030593 (not c!104359)) b!1030597))

(assert (= (and b!1030603 res!689037) b!1030588))

(assert (= (or b!1030603 b!1030597) bm!43522))

(assert (= (and b!1030593 res!689039) b!1030596))

(assert (= (and b!1030596 c!104357) b!1030590))

(assert (= (and b!1030596 (not c!104357)) b!1030604))

(assert (= (and b!1030590 res!689042) b!1030605))

(assert (= (or b!1030590 b!1030604) bm!43521))

(declare-fun b_lambda!15867 () Bool)

(assert (=> (not b_lambda!15867) (not b!1030585)))

(assert (=> b!1030585 t!30891))

(declare-fun b_and!32935 () Bool)

(assert (= b_and!32933 (and (=> t!30891 result!14137) b_and!32935)))

(declare-fun m!950063 () Bool)

(assert (=> b!1030595 m!950063))

(declare-fun m!950065 () Bool)

(assert (=> b!1030599 m!950065))

(assert (=> b!1030599 m!950065))

(declare-fun m!950067 () Bool)

(assert (=> b!1030599 m!950067))

(assert (=> d!123655 m!950047))

(declare-fun m!950069 () Bool)

(assert (=> b!1030585 m!950069))

(assert (=> b!1030585 m!949933))

(declare-fun m!950071 () Bool)

(assert (=> b!1030585 m!950071))

(assert (=> b!1030585 m!950069))

(assert (=> b!1030585 m!949933))

(assert (=> b!1030585 m!950065))

(assert (=> b!1030585 m!950065))

(declare-fun m!950073 () Bool)

(assert (=> b!1030585 m!950073))

(declare-fun m!950075 () Bool)

(assert (=> b!1030600 m!950075))

(declare-fun m!950077 () Bool)

(assert (=> b!1030600 m!950077))

(assert (=> b!1030600 m!950075))

(declare-fun m!950079 () Bool)

(assert (=> b!1030600 m!950079))

(declare-fun m!950081 () Bool)

(assert (=> b!1030600 m!950081))

(declare-fun m!950083 () Bool)

(assert (=> b!1030600 m!950083))

(declare-fun m!950085 () Bool)

(assert (=> b!1030600 m!950085))

(assert (=> b!1030600 m!950083))

(declare-fun m!950087 () Bool)

(assert (=> b!1030600 m!950087))

(declare-fun m!950089 () Bool)

(assert (=> b!1030600 m!950089))

(declare-fun m!950091 () Bool)

(assert (=> b!1030600 m!950091))

(declare-fun m!950093 () Bool)

(assert (=> b!1030600 m!950093))

(declare-fun m!950095 () Bool)

(assert (=> b!1030600 m!950095))

(assert (=> b!1030600 m!950065))

(declare-fun m!950097 () Bool)

(assert (=> b!1030600 m!950097))

(assert (=> b!1030600 m!950087))

(declare-fun m!950099 () Bool)

(assert (=> b!1030600 m!950099))

(declare-fun m!950101 () Bool)

(assert (=> b!1030600 m!950101))

(declare-fun m!950103 () Bool)

(assert (=> b!1030600 m!950103))

(declare-fun m!950105 () Bool)

(assert (=> b!1030600 m!950105))

(assert (=> b!1030600 m!950103))

(declare-fun m!950107 () Bool)

(assert (=> bm!43522 m!950107))

(declare-fun m!950109 () Bool)

(assert (=> b!1030588 m!950109))

(declare-fun m!950111 () Bool)

(assert (=> bm!43521 m!950111))

(assert (=> b!1030592 m!950065))

(assert (=> b!1030592 m!950065))

(declare-fun m!950113 () Bool)

(assert (=> b!1030592 m!950113))

(declare-fun m!950115 () Bool)

(assert (=> b!1030605 m!950115))

(assert (=> b!1030602 m!950065))

(assert (=> b!1030602 m!950065))

(assert (=> b!1030602 m!950067))

(declare-fun m!950117 () Bool)

(assert (=> bm!43519 m!950117))

(assert (=> bm!43518 m!950101))

(assert (=> b!1030447 d!123655))

(declare-fun d!123657 () Bool)

(declare-fun e!581964 () Bool)

(assert (=> d!123657 e!581964))

(declare-fun res!689047 () Bool)

(assert (=> d!123657 (=> (not res!689047) (not e!581964))))

(assert (=> d!123657 (= res!689047 (and (bvsge (index!40924 lt!454069) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454069) (size!31681 (_keys!11313 thiss!1427)))))))

(declare-fun lt!454210 () Unit!33620)

(declare-fun choose!53 (array!64733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21813) Unit!33620)

(assert (=> d!123657 (= lt!454210 (choose!53 (_keys!11313 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40924 lt!454069) #b00000000000000000000000000000000 Nil!21810))))

(assert (=> d!123657 (bvslt (size!31681 (_keys!11313 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123657 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11313 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40924 lt!454069) #b00000000000000000000000000000000 Nil!21810) lt!454210)))

(declare-fun b!1030608 () Bool)

(assert (=> b!1030608 (= e!581964 (arrayNoDuplicates!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000000 Nil!21810))))

(assert (= (and d!123657 res!689047) b!1030608))

(declare-fun m!950119 () Bool)

(assert (=> d!123657 m!950119))

(assert (=> b!1030608 m!949919))

(declare-fun m!950121 () Bool)

(assert (=> b!1030608 m!950121))

(assert (=> b!1030447 d!123657))

(declare-fun d!123659 () Bool)

(declare-fun e!581967 () Bool)

(assert (=> d!123659 e!581967))

(declare-fun res!689050 () Bool)

(assert (=> d!123659 (=> (not res!689050) (not e!581967))))

(assert (=> d!123659 (= res!689050 (bvslt (index!40924 lt!454069) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun lt!454213 () Unit!33620)

(declare-fun choose!121 (array!64733 (_ BitVec 32) (_ BitVec 64)) Unit!33620)

(assert (=> d!123659 (= lt!454213 (choose!121 (_keys!11313 thiss!1427) (index!40924 lt!454069) key!909))))

(assert (=> d!123659 (bvsge (index!40924 lt!454069) #b00000000000000000000000000000000)))

(assert (=> d!123659 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11313 thiss!1427) (index!40924 lt!454069) key!909) lt!454213)))

(declare-fun b!1030611 () Bool)

(assert (=> b!1030611 (= e!581967 (not (arrayContainsKey!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123659 res!689050) b!1030611))

(declare-fun m!950123 () Bool)

(assert (=> d!123659 m!950123))

(assert (=> b!1030611 m!949919))

(declare-fun m!950125 () Bool)

(assert (=> b!1030611 m!950125))

(assert (=> b!1030447 d!123659))

(declare-fun d!123661 () Bool)

(declare-fun res!689056 () Bool)

(declare-fun e!581974 () Bool)

(assert (=> d!123661 (=> res!689056 e!581974)))

(assert (=> d!123661 (= res!689056 (bvsge #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(assert (=> d!123661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454067 (mask!29926 thiss!1427)) e!581974)))

(declare-fun b!1030620 () Bool)

(declare-fun e!581976 () Bool)

(assert (=> b!1030620 (= e!581974 e!581976)))

(declare-fun c!104365 () Bool)

(assert (=> b!1030620 (= c!104365 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun bm!43525 () Bool)

(declare-fun call!43528 () Bool)

(assert (=> bm!43525 (= call!43528 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!454067 (mask!29926 thiss!1427)))))

(declare-fun b!1030621 () Bool)

(declare-fun e!581975 () Bool)

(assert (=> b!1030621 (= e!581975 call!43528)))

(declare-fun b!1030622 () Bool)

(assert (=> b!1030622 (= e!581976 call!43528)))

(declare-fun b!1030623 () Bool)

(assert (=> b!1030623 (= e!581976 e!581975)))

(declare-fun lt!454221 () (_ BitVec 64))

(assert (=> b!1030623 (= lt!454221 (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))

(declare-fun lt!454220 () Unit!33620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64733 (_ BitVec 64) (_ BitVec 32)) Unit!33620)

(assert (=> b!1030623 (= lt!454220 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454067 lt!454221 #b00000000000000000000000000000000))))

(assert (=> b!1030623 (arrayContainsKey!0 lt!454067 lt!454221 #b00000000000000000000000000000000)))

(declare-fun lt!454222 () Unit!33620)

(assert (=> b!1030623 (= lt!454222 lt!454220)))

(declare-fun res!689055 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64733 (_ BitVec 32)) SeekEntryResult!9638)

(assert (=> b!1030623 (= res!689055 (= (seekEntryOrOpen!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) lt!454067 (mask!29926 thiss!1427)) (Found!9638 #b00000000000000000000000000000000)))))

(assert (=> b!1030623 (=> (not res!689055) (not e!581975))))

(assert (= (and d!123661 (not res!689056)) b!1030620))

(assert (= (and b!1030620 c!104365) b!1030623))

(assert (= (and b!1030620 (not c!104365)) b!1030622))

(assert (= (and b!1030623 res!689055) b!1030621))

(assert (= (or b!1030621 b!1030622) bm!43525))

(assert (=> b!1030620 m!950055))

(assert (=> b!1030620 m!950055))

(assert (=> b!1030620 m!950057))

(declare-fun m!950127 () Bool)

(assert (=> bm!43525 m!950127))

(assert (=> b!1030623 m!950055))

(declare-fun m!950129 () Bool)

(assert (=> b!1030623 m!950129))

(declare-fun m!950131 () Bool)

(assert (=> b!1030623 m!950131))

(assert (=> b!1030623 m!950055))

(declare-fun m!950133 () Bool)

(assert (=> b!1030623 m!950133))

(assert (=> b!1030447 d!123661))

(declare-fun b!1030632 () Bool)

(declare-fun e!581981 () (_ BitVec 32))

(assert (=> b!1030632 (= e!581981 #b00000000000000000000000000000000)))

(declare-fun b!1030633 () Bool)

(declare-fun e!581982 () (_ BitVec 32))

(assert (=> b!1030633 (= e!581981 e!581982)))

(declare-fun c!104370 () Bool)

(assert (=> b!1030633 (= c!104370 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030634 () Bool)

(declare-fun call!43531 () (_ BitVec 32))

(assert (=> b!1030634 (= e!581982 call!43531)))

(declare-fun b!1030635 () Bool)

(assert (=> b!1030635 (= e!581982 (bvadd #b00000000000000000000000000000001 call!43531))))

(declare-fun bm!43528 () Bool)

(assert (=> bm!43528 (= call!43531 (arrayCountValidKeys!0 lt!454067 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123663 () Bool)

(declare-fun lt!454225 () (_ BitVec 32))

(assert (=> d!123663 (and (bvsge lt!454225 #b00000000000000000000000000000000) (bvsle lt!454225 (bvsub (size!31681 lt!454067) #b00000000000000000000000000000000)))))

(assert (=> d!123663 (= lt!454225 e!581981)))

(declare-fun c!104371 () Bool)

(assert (=> d!123663 (= c!104371 (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123663 (and (bvsle #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31681 (_keys!11313 thiss!1427)) (size!31681 lt!454067)))))

(assert (=> d!123663 (= (arrayCountValidKeys!0 lt!454067 #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) lt!454225)))

(assert (= (and d!123663 c!104371) b!1030632))

(assert (= (and d!123663 (not c!104371)) b!1030633))

(assert (= (and b!1030633 c!104370) b!1030635))

(assert (= (and b!1030633 (not c!104370)) b!1030634))

(assert (= (or b!1030635 b!1030634) bm!43528))

(assert (=> b!1030633 m!950055))

(assert (=> b!1030633 m!950055))

(assert (=> b!1030633 m!950057))

(declare-fun m!950135 () Bool)

(assert (=> bm!43528 m!950135))

(assert (=> b!1030447 d!123663))

(declare-fun b!1030636 () Bool)

(declare-fun e!581983 () (_ BitVec 32))

(assert (=> b!1030636 (= e!581983 #b00000000000000000000000000000000)))

(declare-fun b!1030637 () Bool)

(declare-fun e!581984 () (_ BitVec 32))

(assert (=> b!1030637 (= e!581983 e!581984)))

(declare-fun c!104372 () Bool)

(assert (=> b!1030637 (= c!104372 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030638 () Bool)

(declare-fun call!43532 () (_ BitVec 32))

(assert (=> b!1030638 (= e!581984 call!43532)))

(declare-fun b!1030639 () Bool)

(assert (=> b!1030639 (= e!581984 (bvadd #b00000000000000000000000000000001 call!43532))))

(declare-fun bm!43529 () Bool)

(assert (=> bm!43529 (= call!43532 (arrayCountValidKeys!0 (_keys!11313 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123665 () Bool)

(declare-fun lt!454226 () (_ BitVec 32))

(assert (=> d!123665 (and (bvsge lt!454226 #b00000000000000000000000000000000) (bvsle lt!454226 (bvsub (size!31681 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123665 (= lt!454226 e!581983)))

(declare-fun c!104373 () Bool)

(assert (=> d!123665 (= c!104373 (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123665 (and (bvsle #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31681 (_keys!11313 thiss!1427)) (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123665 (= (arrayCountValidKeys!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) lt!454226)))

(assert (= (and d!123665 c!104373) b!1030636))

(assert (= (and d!123665 (not c!104373)) b!1030637))

(assert (= (and b!1030637 c!104372) b!1030639))

(assert (= (and b!1030637 (not c!104372)) b!1030638))

(assert (= (or b!1030639 b!1030638) bm!43529))

(assert (=> b!1030637 m!950065))

(assert (=> b!1030637 m!950065))

(assert (=> b!1030637 m!950067))

(declare-fun m!950137 () Bool)

(assert (=> bm!43529 m!950137))

(assert (=> b!1030447 d!123665))

(declare-fun d!123667 () Bool)

(declare-fun res!689061 () Bool)

(declare-fun e!581989 () Bool)

(assert (=> d!123667 (=> res!689061 e!581989)))

(assert (=> d!123667 (= res!689061 (= (select (arr!31165 lt!454067) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123667 (= (arrayContainsKey!0 lt!454067 key!909 #b00000000000000000000000000000000) e!581989)))

(declare-fun b!1030644 () Bool)

(declare-fun e!581990 () Bool)

(assert (=> b!1030644 (= e!581989 e!581990)))

(declare-fun res!689062 () Bool)

(assert (=> b!1030644 (=> (not res!689062) (not e!581990))))

(assert (=> b!1030644 (= res!689062 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 lt!454067)))))

(declare-fun b!1030645 () Bool)

(assert (=> b!1030645 (= e!581990 (arrayContainsKey!0 lt!454067 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123667 (not res!689061)) b!1030644))

(assert (= (and b!1030644 res!689062) b!1030645))

(assert (=> d!123667 m!950055))

(declare-fun m!950139 () Bool)

(assert (=> b!1030645 m!950139))

(assert (=> b!1030447 d!123667))

(declare-fun b!1030657 () Bool)

(declare-fun e!581995 () Bool)

(assert (=> b!1030657 (= e!581995 (= (arrayCountValidKeys!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!123669 () Bool)

(assert (=> d!123669 e!581995))

(declare-fun res!689071 () Bool)

(assert (=> d!123669 (=> (not res!689071) (not e!581995))))

(assert (=> d!123669 (= res!689071 (and (bvsge (index!40924 lt!454069) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454069) (size!31681 (_keys!11313 thiss!1427)))))))

(declare-fun lt!454229 () Unit!33620)

(declare-fun choose!82 (array!64733 (_ BitVec 32) (_ BitVec 64)) Unit!33620)

(assert (=> d!123669 (= lt!454229 (choose!82 (_keys!11313 thiss!1427) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581996 () Bool)

(assert (=> d!123669 e!581996))

(declare-fun res!689073 () Bool)

(assert (=> d!123669 (=> (not res!689073) (not e!581996))))

(assert (=> d!123669 (= res!689073 (and (bvsge (index!40924 lt!454069) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454069) (size!31681 (_keys!11313 thiss!1427)))))))

(assert (=> d!123669 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11313 thiss!1427) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) lt!454229)))

(declare-fun b!1030655 () Bool)

(declare-fun res!689072 () Bool)

(assert (=> b!1030655 (=> (not res!689072) (not e!581996))))

(assert (=> b!1030655 (= res!689072 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030654 () Bool)

(declare-fun res!689074 () Bool)

(assert (=> b!1030654 (=> (not res!689074) (not e!581996))))

(assert (=> b!1030654 (= res!689074 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069))))))

(declare-fun b!1030656 () Bool)

(assert (=> b!1030656 (= e!581996 (bvslt (size!31681 (_keys!11313 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!123669 res!689073) b!1030654))

(assert (= (and b!1030654 res!689074) b!1030655))

(assert (= (and b!1030655 res!689072) b!1030656))

(assert (= (and d!123669 res!689071) b!1030657))

(assert (=> b!1030657 m!949919))

(declare-fun m!950141 () Bool)

(assert (=> b!1030657 m!950141))

(assert (=> b!1030657 m!949937))

(declare-fun m!950143 () Bool)

(assert (=> d!123669 m!950143))

(declare-fun m!950145 () Bool)

(assert (=> b!1030655 m!950145))

(declare-fun m!950147 () Bool)

(assert (=> b!1030654 m!950147))

(assert (=> b!1030654 m!950147))

(declare-fun m!950149 () Bool)

(assert (=> b!1030654 m!950149))

(assert (=> b!1030447 d!123669))

(declare-fun d!123671 () Bool)

(declare-fun lt!454232 () ListLongMap!13695)

(assert (=> d!123671 (not (contains!5998 lt!454232 key!909))))

(declare-fun removeStrictlySorted!52 (List!21812 (_ BitVec 64)) List!21812)

(assert (=> d!123671 (= lt!454232 (ListLongMap!13696 (removeStrictlySorted!52 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))) key!909)))))

(assert (=> d!123671 (= (-!486 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) lt!454232)))

(declare-fun bs!30076 () Bool)

(assert (= bs!30076 d!123671))

(declare-fun m!950151 () Bool)

(assert (=> bs!30076 m!950151))

(declare-fun m!950153 () Bool)

(assert (=> bs!30076 m!950153))

(assert (=> b!1030447 d!123671))

(declare-fun d!123673 () Bool)

(declare-fun e!581999 () Bool)

(assert (=> d!123673 e!581999))

(declare-fun res!689077 () Bool)

(assert (=> d!123673 (=> (not res!689077) (not e!581999))))

(assert (=> d!123673 (= res!689077 (and (bvsge (index!40924 lt!454069) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454069) (size!31681 (_keys!11313 thiss!1427)))))))

(declare-fun lt!454235 () Unit!33620)

(declare-fun choose!25 (array!64733 (_ BitVec 32) (_ BitVec 32)) Unit!33620)

(assert (=> d!123673 (= lt!454235 (choose!25 (_keys!11313 thiss!1427) (index!40924 lt!454069) (mask!29926 thiss!1427)))))

(assert (=> d!123673 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123673 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11313 thiss!1427) (index!40924 lt!454069) (mask!29926 thiss!1427)) lt!454235)))

(declare-fun b!1030660 () Bool)

(assert (=> b!1030660 (= e!581999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (mask!29926 thiss!1427)))))

(assert (= (and d!123673 res!689077) b!1030660))

(declare-fun m!950155 () Bool)

(assert (=> d!123673 m!950155))

(assert (=> d!123673 m!950047))

(assert (=> b!1030660 m!949919))

(declare-fun m!950157 () Bool)

(assert (=> b!1030660 m!950157))

(assert (=> b!1030447 d!123673))

(declare-fun lt!454247 () ListLongMap!13695)

(declare-fun e!582011 () Bool)

(declare-fun b!1030661 () Bool)

(assert (=> b!1030661 (= e!582011 (= (apply!912 lt!454247 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) (get!16385 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31682 lt!454068)))))

(assert (=> b!1030661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(declare-fun b!1030662 () Bool)

(declare-fun e!582008 () ListLongMap!13695)

(declare-fun call!43536 () ListLongMap!13695)

(assert (=> b!1030662 (= e!582008 call!43536)))

(declare-fun b!1030663 () Bool)

(declare-fun call!43533 () ListLongMap!13695)

(assert (=> b!1030663 (= e!582008 call!43533)))

(declare-fun b!1030664 () Bool)

(declare-fun e!582007 () Bool)

(assert (=> b!1030664 (= e!582007 (= (apply!912 lt!454247 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5950 thiss!1427)))))

(declare-fun b!1030665 () Bool)

(declare-fun c!104377 () Bool)

(assert (=> b!1030665 (= c!104377 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!582006 () ListLongMap!13695)

(assert (=> b!1030665 (= e!582006 e!582008)))

(declare-fun bm!43530 () Bool)

(declare-fun call!43537 () ListLongMap!13695)

(assert (=> bm!43530 (= call!43533 call!43537)))

(declare-fun b!1030666 () Bool)

(declare-fun e!582012 () Bool)

(declare-fun e!582001 () Bool)

(assert (=> b!1030666 (= e!582012 e!582001)))

(declare-fun res!689084 () Bool)

(declare-fun call!43534 () Bool)

(assert (=> b!1030666 (= res!689084 call!43534)))

(assert (=> b!1030666 (=> (not res!689084) (not e!582001))))

(declare-fun b!1030667 () Bool)

(declare-fun res!689078 () Bool)

(declare-fun e!582003 () Bool)

(assert (=> b!1030667 (=> (not res!689078) (not e!582003))))

(declare-fun e!582010 () Bool)

(assert (=> b!1030667 (= res!689078 e!582010)))

(declare-fun res!689085 () Bool)

(assert (=> b!1030667 (=> res!689085 e!582010)))

(declare-fun e!582000 () Bool)

(assert (=> b!1030667 (= res!689085 (not e!582000))))

(declare-fun res!689086 () Bool)

(assert (=> b!1030667 (=> (not res!689086) (not e!582000))))

(assert (=> b!1030667 (= res!689086 (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(declare-fun bm!43531 () Bool)

(declare-fun call!43538 () ListLongMap!13695)

(assert (=> bm!43531 (= call!43536 call!43538)))

(declare-fun bm!43532 () Bool)

(declare-fun call!43535 () ListLongMap!13695)

(assert (=> bm!43532 (= call!43535 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1030669 () Bool)

(declare-fun res!689081 () Bool)

(assert (=> b!1030669 (=> (not res!689081) (not e!582003))))

(declare-fun e!582009 () Bool)

(assert (=> b!1030669 (= res!689081 e!582009)))

(declare-fun c!104376 () Bool)

(assert (=> b!1030669 (= c!104376 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!104375 () Bool)

(declare-fun bm!43533 () Bool)

(declare-fun c!104378 () Bool)

(assert (=> bm!43533 (= call!43537 (+!3123 (ite c!104378 call!43535 (ite c!104375 call!43538 call!43536)) (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun b!1030670 () Bool)

(declare-fun e!582002 () Unit!33620)

(declare-fun Unit!33631 () Unit!33620)

(assert (=> b!1030670 (= e!582002 Unit!33631)))

(declare-fun bm!43534 () Bool)

(assert (=> bm!43534 (= call!43538 call!43535)))

(declare-fun b!1030671 () Bool)

(declare-fun e!582004 () ListLongMap!13695)

(assert (=> b!1030671 (= e!582004 (+!3123 call!43537 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(declare-fun b!1030672 () Bool)

(assert (=> b!1030672 (= e!582003 e!582012)))

(declare-fun c!104374 () Bool)

(assert (=> b!1030672 (= c!104374 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030673 () Bool)

(declare-fun call!43539 () Bool)

(assert (=> b!1030673 (= e!582009 (not call!43539))))

(declare-fun b!1030674 () Bool)

(assert (=> b!1030674 (= e!582004 e!582006)))

(assert (=> b!1030674 (= c!104375 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030675 () Bool)

(assert (=> b!1030675 (= e!582000 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030668 () Bool)

(assert (=> b!1030668 (= e!582010 e!582011)))

(declare-fun res!689083 () Bool)

(assert (=> b!1030668 (=> (not res!689083) (not e!582011))))

(assert (=> b!1030668 (= res!689083 (contains!5998 lt!454247 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (=> b!1030668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(declare-fun d!123675 () Bool)

(assert (=> d!123675 e!582003))

(declare-fun res!689082 () Bool)

(assert (=> d!123675 (=> (not res!689082) (not e!582003))))

(assert (=> d!123675 (= res!689082 (or (bvsge #b00000000000000000000000000000000 (size!31681 lt!454067)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))))

(declare-fun lt!454236 () ListLongMap!13695)

(assert (=> d!123675 (= lt!454247 lt!454236)))

(declare-fun lt!454241 () Unit!33620)

(assert (=> d!123675 (= lt!454241 e!582002)))

(declare-fun c!104379 () Bool)

(declare-fun e!582005 () Bool)

(assert (=> d!123675 (= c!104379 e!582005)))

(declare-fun res!689080 () Bool)

(assert (=> d!123675 (=> (not res!689080) (not e!582005))))

(assert (=> d!123675 (= res!689080 (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(assert (=> d!123675 (= lt!454236 e!582004)))

(assert (=> d!123675 (= c!104378 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123675 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123675 (= (getCurrentListMap!3909 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!454247)))

(declare-fun b!1030676 () Bool)

(declare-fun lt!454248 () Unit!33620)

(assert (=> b!1030676 (= e!582002 lt!454248)))

(declare-fun lt!454238 () ListLongMap!13695)

(assert (=> b!1030676 (= lt!454238 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454252 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454253 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454253 (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))

(declare-fun lt!454242 () Unit!33620)

(assert (=> b!1030676 (= lt!454242 (addStillContains!622 lt!454238 lt!454252 (zeroValue!5950 thiss!1427) lt!454253))))

(assert (=> b!1030676 (contains!5998 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))) lt!454253)))

(declare-fun lt!454246 () Unit!33620)

(assert (=> b!1030676 (= lt!454246 lt!454242)))

(declare-fun lt!454245 () ListLongMap!13695)

(assert (=> b!1030676 (= lt!454245 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454257 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454257 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454250 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454250 (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))

(declare-fun lt!454256 () Unit!33620)

(assert (=> b!1030676 (= lt!454256 (addApplyDifferent!478 lt!454245 lt!454257 (minValue!5950 thiss!1427) lt!454250))))

(assert (=> b!1030676 (= (apply!912 (+!3123 lt!454245 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))) lt!454250) (apply!912 lt!454245 lt!454250))))

(declare-fun lt!454251 () Unit!33620)

(assert (=> b!1030676 (= lt!454251 lt!454256)))

(declare-fun lt!454249 () ListLongMap!13695)

(assert (=> b!1030676 (= lt!454249 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454254 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454255 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454255 (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))

(declare-fun lt!454240 () Unit!33620)

(assert (=> b!1030676 (= lt!454240 (addApplyDifferent!478 lt!454249 lt!454254 (zeroValue!5950 thiss!1427) lt!454255))))

(assert (=> b!1030676 (= (apply!912 (+!3123 lt!454249 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))) lt!454255) (apply!912 lt!454249 lt!454255))))

(declare-fun lt!454237 () Unit!33620)

(assert (=> b!1030676 (= lt!454237 lt!454240)))

(declare-fun lt!454244 () ListLongMap!13695)

(assert (=> b!1030676 (= lt!454244 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454243 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454239 () (_ BitVec 64))

(assert (=> b!1030676 (= lt!454239 (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))

(assert (=> b!1030676 (= lt!454248 (addApplyDifferent!478 lt!454244 lt!454243 (minValue!5950 thiss!1427) lt!454239))))

(assert (=> b!1030676 (= (apply!912 (+!3123 lt!454244 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))) lt!454239) (apply!912 lt!454244 lt!454239))))

(declare-fun bm!43535 () Bool)

(assert (=> bm!43535 (= call!43534 (contains!5998 lt!454247 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030677 () Bool)

(assert (=> b!1030677 (= e!582006 call!43533)))

(declare-fun b!1030678 () Bool)

(assert (=> b!1030678 (= e!582005 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030679 () Bool)

(assert (=> b!1030679 (= e!582009 e!582007)))

(declare-fun res!689079 () Bool)

(assert (=> b!1030679 (= res!689079 call!43539)))

(assert (=> b!1030679 (=> (not res!689079) (not e!582007))))

(declare-fun b!1030680 () Bool)

(assert (=> b!1030680 (= e!582012 (not call!43534))))

(declare-fun bm!43536 () Bool)

(assert (=> bm!43536 (= call!43539 (contains!5998 lt!454247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030681 () Bool)

(assert (=> b!1030681 (= e!582001 (= (apply!912 lt!454247 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5950 thiss!1427)))))

(assert (= (and d!123675 c!104378) b!1030671))

(assert (= (and d!123675 (not c!104378)) b!1030674))

(assert (= (and b!1030674 c!104375) b!1030677))

(assert (= (and b!1030674 (not c!104375)) b!1030665))

(assert (= (and b!1030665 c!104377) b!1030663))

(assert (= (and b!1030665 (not c!104377)) b!1030662))

(assert (= (or b!1030663 b!1030662) bm!43531))

(assert (= (or b!1030677 bm!43531) bm!43534))

(assert (= (or b!1030677 b!1030663) bm!43530))

(assert (= (or b!1030671 bm!43534) bm!43532))

(assert (= (or b!1030671 bm!43530) bm!43533))

(assert (= (and d!123675 res!689080) b!1030678))

(assert (= (and d!123675 c!104379) b!1030676))

(assert (= (and d!123675 (not c!104379)) b!1030670))

(assert (= (and d!123675 res!689082) b!1030667))

(assert (= (and b!1030667 res!689086) b!1030675))

(assert (= (and b!1030667 (not res!689085)) b!1030668))

(assert (= (and b!1030668 res!689083) b!1030661))

(assert (= (and b!1030667 res!689078) b!1030669))

(assert (= (and b!1030669 c!104376) b!1030679))

(assert (= (and b!1030669 (not c!104376)) b!1030673))

(assert (= (and b!1030679 res!689079) b!1030664))

(assert (= (or b!1030679 b!1030673) bm!43536))

(assert (= (and b!1030669 res!689081) b!1030672))

(assert (= (and b!1030672 c!104374) b!1030666))

(assert (= (and b!1030672 (not c!104374)) b!1030680))

(assert (= (and b!1030666 res!689084) b!1030681))

(assert (= (or b!1030666 b!1030680) bm!43535))

(declare-fun b_lambda!15869 () Bool)

(assert (=> (not b_lambda!15869) (not b!1030661)))

(assert (=> b!1030661 t!30891))

(declare-fun b_and!32937 () Bool)

(assert (= b_and!32935 (and (=> t!30891 result!14137) b_and!32937)))

(declare-fun m!950159 () Bool)

(assert (=> b!1030671 m!950159))

(assert (=> b!1030675 m!950055))

(assert (=> b!1030675 m!950055))

(assert (=> b!1030675 m!950057))

(assert (=> d!123675 m!950047))

(declare-fun m!950161 () Bool)

(assert (=> b!1030661 m!950161))

(assert (=> b!1030661 m!949933))

(declare-fun m!950163 () Bool)

(assert (=> b!1030661 m!950163))

(assert (=> b!1030661 m!950161))

(assert (=> b!1030661 m!949933))

(assert (=> b!1030661 m!950055))

(assert (=> b!1030661 m!950055))

(declare-fun m!950165 () Bool)

(assert (=> b!1030661 m!950165))

(declare-fun m!950167 () Bool)

(assert (=> b!1030676 m!950167))

(declare-fun m!950169 () Bool)

(assert (=> b!1030676 m!950169))

(assert (=> b!1030676 m!950167))

(declare-fun m!950171 () Bool)

(assert (=> b!1030676 m!950171))

(declare-fun m!950173 () Bool)

(assert (=> b!1030676 m!950173))

(declare-fun m!950175 () Bool)

(assert (=> b!1030676 m!950175))

(declare-fun m!950177 () Bool)

(assert (=> b!1030676 m!950177))

(assert (=> b!1030676 m!950175))

(declare-fun m!950179 () Bool)

(assert (=> b!1030676 m!950179))

(declare-fun m!950181 () Bool)

(assert (=> b!1030676 m!950181))

(declare-fun m!950183 () Bool)

(assert (=> b!1030676 m!950183))

(declare-fun m!950185 () Bool)

(assert (=> b!1030676 m!950185))

(declare-fun m!950187 () Bool)

(assert (=> b!1030676 m!950187))

(assert (=> b!1030676 m!950055))

(declare-fun m!950189 () Bool)

(assert (=> b!1030676 m!950189))

(assert (=> b!1030676 m!950179))

(declare-fun m!950191 () Bool)

(assert (=> b!1030676 m!950191))

(declare-fun m!950193 () Bool)

(assert (=> b!1030676 m!950193))

(declare-fun m!950195 () Bool)

(assert (=> b!1030676 m!950195))

(declare-fun m!950197 () Bool)

(assert (=> b!1030676 m!950197))

(assert (=> b!1030676 m!950195))

(declare-fun m!950199 () Bool)

(assert (=> bm!43536 m!950199))

(declare-fun m!950201 () Bool)

(assert (=> b!1030664 m!950201))

(declare-fun m!950203 () Bool)

(assert (=> bm!43535 m!950203))

(assert (=> b!1030668 m!950055))

(assert (=> b!1030668 m!950055))

(declare-fun m!950205 () Bool)

(assert (=> b!1030668 m!950205))

(declare-fun m!950207 () Bool)

(assert (=> b!1030681 m!950207))

(assert (=> b!1030678 m!950055))

(assert (=> b!1030678 m!950055))

(assert (=> b!1030678 m!950057))

(declare-fun m!950209 () Bool)

(assert (=> bm!43533 m!950209))

(assert (=> bm!43532 m!950193))

(assert (=> b!1030447 d!123675))

(declare-fun d!123677 () Bool)

(assert (=> d!123677 (= (validMask!0 (mask!29926 (_2!7796 lt!454072))) (and (or (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000000000111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000000001111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000000011111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000000111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000001111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000011111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000000111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000001111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000011111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000000111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000001111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000011111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000000111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000001111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000011111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000000111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000001111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000011111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000000111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000001111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000011111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000000111111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000001111111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000011111111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00000111111111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00001111111111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00011111111111111111111111111111) (= (mask!29926 (_2!7796 lt!454072)) #b00111111111111111111111111111111)) (bvsle (mask!29926 (_2!7796 lt!454072)) #b00111111111111111111111111111111)))))

(assert (=> b!1030447 d!123677))

(declare-fun d!123679 () Bool)

(declare-fun res!689093 () Bool)

(declare-fun e!582015 () Bool)

(assert (=> d!123679 (=> (not res!689093) (not e!582015))))

(declare-fun simpleValid!394 (LongMapFixedSize!5500) Bool)

(assert (=> d!123679 (= res!689093 (simpleValid!394 thiss!1427))))

(assert (=> d!123679 (= (valid!2090 thiss!1427) e!582015)))

(declare-fun b!1030688 () Bool)

(declare-fun res!689094 () Bool)

(assert (=> b!1030688 (=> (not res!689094) (not e!582015))))

(assert (=> b!1030688 (= res!689094 (= (arrayCountValidKeys!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (_size!2805 thiss!1427)))))

(declare-fun b!1030689 () Bool)

(declare-fun res!689095 () Bool)

(assert (=> b!1030689 (=> (not res!689095) (not e!582015))))

(assert (=> b!1030689 (= res!689095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(declare-fun b!1030690 () Bool)

(assert (=> b!1030690 (= e!582015 (arrayNoDuplicates!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 Nil!21810))))

(assert (= (and d!123679 res!689093) b!1030688))

(assert (= (and b!1030688 res!689094) b!1030689))

(assert (= (and b!1030689 res!689095) b!1030690))

(declare-fun m!950211 () Bool)

(assert (=> d!123679 m!950211))

(assert (=> b!1030688 m!949937))

(declare-fun m!950213 () Bool)

(assert (=> b!1030689 m!950213))

(declare-fun m!950215 () Bool)

(assert (=> b!1030690 m!950215))

(assert (=> start!90040 d!123679))

(declare-fun d!123681 () Bool)

(assert (=> d!123681 (= (array_inv!24141 (_keys!11313 thiss!1427)) (bvsge (size!31681 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030452 d!123681))

(declare-fun d!123683 () Bool)

(assert (=> d!123683 (= (array_inv!24142 (_values!6137 thiss!1427)) (bvsge (size!31682 (_values!6137 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030452 d!123683))

(declare-fun b!1030697 () Bool)

(declare-fun e!582020 () Bool)

(assert (=> b!1030697 (= e!582020 tp_is_empty!24313)))

(declare-fun mapIsEmpty!37921 () Bool)

(declare-fun mapRes!37921 () Bool)

(assert (=> mapIsEmpty!37921 mapRes!37921))

(declare-fun mapNonEmpty!37921 () Bool)

(declare-fun tp!72854 () Bool)

(assert (=> mapNonEmpty!37921 (= mapRes!37921 (and tp!72854 e!582020))))

(declare-fun mapValue!37921 () ValueCell!11453)

(declare-fun mapRest!37921 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapKey!37921 () (_ BitVec 32))

(assert (=> mapNonEmpty!37921 (= mapRest!37912 (store mapRest!37921 mapKey!37921 mapValue!37921))))

(declare-fun condMapEmpty!37921 () Bool)

(declare-fun mapDefault!37921 () ValueCell!11453)

(assert (=> mapNonEmpty!37912 (= condMapEmpty!37921 (= mapRest!37912 ((as const (Array (_ BitVec 32) ValueCell!11453)) mapDefault!37921)))))

(declare-fun e!582021 () Bool)

(assert (=> mapNonEmpty!37912 (= tp!72839 (and e!582021 mapRes!37921))))

(declare-fun b!1030698 () Bool)

(assert (=> b!1030698 (= e!582021 tp_is_empty!24313)))

(assert (= (and mapNonEmpty!37912 condMapEmpty!37921) mapIsEmpty!37921))

(assert (= (and mapNonEmpty!37912 (not condMapEmpty!37921)) mapNonEmpty!37921))

(assert (= (and mapNonEmpty!37921 ((_ is ValueCellFull!11453) mapValue!37921)) b!1030697))

(assert (= (and mapNonEmpty!37912 ((_ is ValueCellFull!11453) mapDefault!37921)) b!1030698))

(declare-fun m!950217 () Bool)

(assert (=> mapNonEmpty!37921 m!950217))

(declare-fun b_lambda!15871 () Bool)

(assert (= b_lambda!15869 (or (and b!1030452 b_free!20593) b_lambda!15871)))

(declare-fun b_lambda!15873 () Bool)

(assert (= b_lambda!15867 (or (and b!1030452 b_free!20593) b_lambda!15873)))

(declare-fun b_lambda!15875 () Bool)

(assert (= b_lambda!15865 (or (and b!1030452 b_free!20593) b_lambda!15875)))

(check-sat (not b!1030539) (not d!123659) (not b!1030542) (not b_lambda!15875) (not b!1030599) (not b!1030661) (not b!1030655) (not bm!43528) (not b!1030688) (not b!1030671) (not d!123657) (not b!1030668) (not bm!43533) (not bm!43529) (not b!1030527) (not b!1030623) (not d!123651) (not b!1030620) (not b!1030678) (not b!1030595) (not b!1030637) (not bm!43521) (not b!1030600) (not b!1030611) (not d!123669) (not d!123673) (not bm!43519) (not d!123655) (not bm!43518) (not b!1030690) (not d!123679) (not bm!43501) (not b!1030633) (not b!1030689) (not b!1030681) (not bm!43532) (not b!1030676) (not b!1030608) (not bm!43536) (not b!1030585) (not b!1030660) (not b!1030657) tp_is_empty!24313 (not b!1030675) (not mapNonEmpty!37921) (not b!1030520) b_and!32937 (not d!123675) (not bm!43525) (not b_next!20593) (not d!123671) (not b!1030588) (not b_lambda!15871) (not b!1030654) (not bm!43522) (not b!1030592) (not d!123649) (not b!1030664) (not bm!43535) (not b_lambda!15873) (not b!1030538) (not b!1030605) (not b!1030645) (not b_lambda!15863) (not b!1030602))
(check-sat b_and!32937 (not b_next!20593))
(get-model)

(declare-fun b!1030708 () Bool)

(declare-fun res!689104 () Bool)

(declare-fun e!582024 () Bool)

(assert (=> b!1030708 (=> (not res!689104) (not e!582024))))

(declare-fun size!31687 (LongMapFixedSize!5500) (_ BitVec 32))

(assert (=> b!1030708 (= res!689104 (bvsge (size!31687 thiss!1427) (_size!2805 thiss!1427)))))

(declare-fun b!1030709 () Bool)

(declare-fun res!689106 () Bool)

(assert (=> b!1030709 (=> (not res!689106) (not e!582024))))

(assert (=> b!1030709 (= res!689106 (= (size!31687 thiss!1427) (bvadd (_size!2805 thiss!1427) (bvsdiv (bvadd (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123685 () Bool)

(declare-fun res!689107 () Bool)

(assert (=> d!123685 (=> (not res!689107) (not e!582024))))

(assert (=> d!123685 (= res!689107 (validMask!0 (mask!29926 thiss!1427)))))

(assert (=> d!123685 (= (simpleValid!394 thiss!1427) e!582024)))

(declare-fun b!1030710 () Bool)

(assert (=> b!1030710 (= e!582024 (and (bvsge (extraKeys!5846 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5846 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2805 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1030707 () Bool)

(declare-fun res!689105 () Bool)

(assert (=> b!1030707 (=> (not res!689105) (not e!582024))))

(assert (=> b!1030707 (= res!689105 (and (= (size!31682 (_values!6137 thiss!1427)) (bvadd (mask!29926 thiss!1427) #b00000000000000000000000000000001)) (= (size!31681 (_keys!11313 thiss!1427)) (size!31682 (_values!6137 thiss!1427))) (bvsge (_size!2805 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2805 thiss!1427) (bvadd (mask!29926 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!123685 res!689107) b!1030707))

(assert (= (and b!1030707 res!689105) b!1030708))

(assert (= (and b!1030708 res!689104) b!1030709))

(assert (= (and b!1030709 res!689106) b!1030710))

(declare-fun m!950219 () Bool)

(assert (=> b!1030708 m!950219))

(assert (=> b!1030709 m!950219))

(assert (=> d!123685 m!950047))

(assert (=> d!123679 d!123685))

(declare-fun b!1030711 () Bool)

(declare-fun e!582025 () Bool)

(declare-fun e!582026 () Bool)

(assert (=> b!1030711 (= e!582025 e!582026)))

(declare-fun res!689109 () Bool)

(assert (=> b!1030711 (=> (not res!689109) (not e!582026))))

(declare-fun e!582027 () Bool)

(assert (=> b!1030711 (= res!689109 (not e!582027))))

(declare-fun res!689110 () Bool)

(assert (=> b!1030711 (=> (not res!689110) (not e!582027))))

(assert (=> b!1030711 (= res!689110 (validKeyInArray!0 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!104380 () Bool)

(declare-fun bm!43537 () Bool)

(declare-fun call!43540 () Bool)

(assert (=> bm!43537 (= call!43540 (arrayNoDuplicates!0 lt!454067 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104380 (Cons!21809 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104344 (Cons!21809 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) Nil!21810) Nil!21810)) (ite c!104344 (Cons!21809 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) Nil!21810) Nil!21810))))))

(declare-fun d!123687 () Bool)

(declare-fun res!689108 () Bool)

(assert (=> d!123687 (=> res!689108 e!582025)))

(assert (=> d!123687 (= res!689108 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 lt!454067)))))

(assert (=> d!123687 (= (arrayNoDuplicates!0 lt!454067 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104344 (Cons!21809 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) Nil!21810) Nil!21810)) e!582025)))

(declare-fun b!1030712 () Bool)

(assert (=> b!1030712 (= e!582027 (contains!5997 (ite c!104344 (Cons!21809 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) Nil!21810) Nil!21810) (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030713 () Bool)

(declare-fun e!582028 () Bool)

(assert (=> b!1030713 (= e!582028 call!43540)))

(declare-fun b!1030714 () Bool)

(assert (=> b!1030714 (= e!582028 call!43540)))

(declare-fun b!1030715 () Bool)

(assert (=> b!1030715 (= e!582026 e!582028)))

(assert (=> b!1030715 (= c!104380 (validKeyInArray!0 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123687 (not res!689108)) b!1030711))

(assert (= (and b!1030711 res!689110) b!1030712))

(assert (= (and b!1030711 res!689109) b!1030715))

(assert (= (and b!1030715 c!104380) b!1030713))

(assert (= (and b!1030715 (not c!104380)) b!1030714))

(assert (= (or b!1030713 b!1030714) bm!43537))

(declare-fun m!950221 () Bool)

(assert (=> b!1030711 m!950221))

(assert (=> b!1030711 m!950221))

(declare-fun m!950223 () Bool)

(assert (=> b!1030711 m!950223))

(assert (=> bm!43537 m!950221))

(declare-fun m!950225 () Bool)

(assert (=> bm!43537 m!950225))

(assert (=> b!1030712 m!950221))

(assert (=> b!1030712 m!950221))

(declare-fun m!950227 () Bool)

(assert (=> b!1030712 m!950227))

(assert (=> b!1030715 m!950221))

(assert (=> b!1030715 m!950221))

(assert (=> b!1030715 m!950223))

(assert (=> bm!43501 d!123687))

(declare-fun d!123689 () Bool)

(assert (=> d!123689 (= (arrayCountValidKeys!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123689 true))

(declare-fun _$79!14 () Unit!33620)

(assert (=> d!123689 (= (choose!82 (_keys!11313 thiss!1427) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!14)))

(declare-fun bs!30077 () Bool)

(assert (= bs!30077 d!123689))

(assert (=> bs!30077 m!949919))

(assert (=> bs!30077 m!950141))

(assert (=> bs!30077 m!949937))

(assert (=> d!123669 d!123689))

(declare-fun b!1030734 () Bool)

(declare-fun lt!454263 () SeekEntryResult!9638)

(assert (=> b!1030734 (and (bvsge (index!40925 lt!454263) #b00000000000000000000000000000000) (bvslt (index!40925 lt!454263) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun res!689118 () Bool)

(assert (=> b!1030734 (= res!689118 (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40925 lt!454263)) key!909))))

(declare-fun e!582041 () Bool)

(assert (=> b!1030734 (=> res!689118 e!582041)))

(declare-fun e!582042 () Bool)

(assert (=> b!1030734 (= e!582042 e!582041)))

(declare-fun b!1030735 () Bool)

(declare-fun e!582040 () Bool)

(assert (=> b!1030735 (= e!582040 (bvsge (x!91564 lt!454263) #b01111111111111111111111111111110))))

(declare-fun b!1030736 () Bool)

(declare-fun e!582039 () SeekEntryResult!9638)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030736 (= e!582039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29926 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!29926 thiss!1427)) key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(declare-fun d!123691 () Bool)

(assert (=> d!123691 e!582040))

(declare-fun c!104389 () Bool)

(assert (=> d!123691 (= c!104389 (and ((_ is Intermediate!9638) lt!454263) (undefined!10450 lt!454263)))))

(declare-fun e!582043 () SeekEntryResult!9638)

(assert (=> d!123691 (= lt!454263 e!582043)))

(declare-fun c!104387 () Bool)

(assert (=> d!123691 (= c!104387 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!454262 () (_ BitVec 64))

(assert (=> d!123691 (= lt!454262 (select (arr!31165 (_keys!11313 thiss!1427)) (toIndex!0 key!909 (mask!29926 thiss!1427))))))

(assert (=> d!123691 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29926 thiss!1427)) key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)) lt!454263)))

(declare-fun b!1030737 () Bool)

(assert (=> b!1030737 (= e!582043 (Intermediate!9638 true (toIndex!0 key!909 (mask!29926 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1030738 () Bool)

(assert (=> b!1030738 (= e!582040 e!582042)))

(declare-fun res!689119 () Bool)

(assert (=> b!1030738 (= res!689119 (and ((_ is Intermediate!9638) lt!454263) (not (undefined!10450 lt!454263)) (bvslt (x!91564 lt!454263) #b01111111111111111111111111111110) (bvsge (x!91564 lt!454263) #b00000000000000000000000000000000) (bvsge (x!91564 lt!454263) #b00000000000000000000000000000000)))))

(assert (=> b!1030738 (=> (not res!689119) (not e!582042))))

(declare-fun b!1030739 () Bool)

(assert (=> b!1030739 (= e!582043 e!582039)))

(declare-fun c!104388 () Bool)

(assert (=> b!1030739 (= c!104388 (or (= lt!454262 key!909) (= (bvadd lt!454262 lt!454262) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030740 () Bool)

(assert (=> b!1030740 (and (bvsge (index!40925 lt!454263) #b00000000000000000000000000000000) (bvslt (index!40925 lt!454263) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun res!689117 () Bool)

(assert (=> b!1030740 (= res!689117 (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40925 lt!454263)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030740 (=> res!689117 e!582041)))

(declare-fun b!1030741 () Bool)

(assert (=> b!1030741 (and (bvsge (index!40925 lt!454263) #b00000000000000000000000000000000) (bvslt (index!40925 lt!454263) (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> b!1030741 (= e!582041 (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40925 lt!454263)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030742 () Bool)

(assert (=> b!1030742 (= e!582039 (Intermediate!9638 false (toIndex!0 key!909 (mask!29926 thiss!1427)) #b00000000000000000000000000000000))))

(assert (= (and d!123691 c!104387) b!1030737))

(assert (= (and d!123691 (not c!104387)) b!1030739))

(assert (= (and b!1030739 c!104388) b!1030742))

(assert (= (and b!1030739 (not c!104388)) b!1030736))

(assert (= (and d!123691 c!104389) b!1030735))

(assert (= (and d!123691 (not c!104389)) b!1030738))

(assert (= (and b!1030738 res!689119) b!1030734))

(assert (= (and b!1030734 (not res!689118)) b!1030740))

(assert (= (and b!1030740 (not res!689117)) b!1030741))

(assert (=> b!1030736 m!950043))

(declare-fun m!950229 () Bool)

(assert (=> b!1030736 m!950229))

(assert (=> b!1030736 m!950229))

(declare-fun m!950231 () Bool)

(assert (=> b!1030736 m!950231))

(assert (=> d!123691 m!950043))

(declare-fun m!950233 () Bool)

(assert (=> d!123691 m!950233))

(assert (=> d!123691 m!950047))

(declare-fun m!950235 () Bool)

(assert (=> b!1030734 m!950235))

(assert (=> b!1030740 m!950235))

(assert (=> b!1030741 m!950235))

(assert (=> d!123649 d!123691))

(declare-fun d!123693 () Bool)

(declare-fun lt!454269 () (_ BitVec 32))

(declare-fun lt!454268 () (_ BitVec 32))

(assert (=> d!123693 (= lt!454269 (bvmul (bvxor lt!454268 (bvlshr lt!454268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123693 (= lt!454268 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123693 (and (bvsge (mask!29926 thiss!1427) #b00000000000000000000000000000000) (let ((res!689120 (let ((h!23021 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91598 (bvmul (bvxor h!23021 (bvlshr h!23021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91598 (bvlshr x!91598 #b00000000000000000000000000001101)) (mask!29926 thiss!1427)))))) (and (bvslt res!689120 (bvadd (mask!29926 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!689120 #b00000000000000000000000000000000))))))

(assert (=> d!123693 (= (toIndex!0 key!909 (mask!29926 thiss!1427)) (bvand (bvxor lt!454269 (bvlshr lt!454269 #b00000000000000000000000000001101)) (mask!29926 thiss!1427)))))

(assert (=> d!123649 d!123693))

(declare-fun d!123695 () Bool)

(assert (=> d!123695 (= (validMask!0 (mask!29926 thiss!1427)) (and (or (= (mask!29926 thiss!1427) #b00000000000000000000000000000111) (= (mask!29926 thiss!1427) #b00000000000000000000000000001111) (= (mask!29926 thiss!1427) #b00000000000000000000000000011111) (= (mask!29926 thiss!1427) #b00000000000000000000000000111111) (= (mask!29926 thiss!1427) #b00000000000000000000000001111111) (= (mask!29926 thiss!1427) #b00000000000000000000000011111111) (= (mask!29926 thiss!1427) #b00000000000000000000000111111111) (= (mask!29926 thiss!1427) #b00000000000000000000001111111111) (= (mask!29926 thiss!1427) #b00000000000000000000011111111111) (= (mask!29926 thiss!1427) #b00000000000000000000111111111111) (= (mask!29926 thiss!1427) #b00000000000000000001111111111111) (= (mask!29926 thiss!1427) #b00000000000000000011111111111111) (= (mask!29926 thiss!1427) #b00000000000000000111111111111111) (= (mask!29926 thiss!1427) #b00000000000000001111111111111111) (= (mask!29926 thiss!1427) #b00000000000000011111111111111111) (= (mask!29926 thiss!1427) #b00000000000000111111111111111111) (= (mask!29926 thiss!1427) #b00000000000001111111111111111111) (= (mask!29926 thiss!1427) #b00000000000011111111111111111111) (= (mask!29926 thiss!1427) #b00000000000111111111111111111111) (= (mask!29926 thiss!1427) #b00000000001111111111111111111111) (= (mask!29926 thiss!1427) #b00000000011111111111111111111111) (= (mask!29926 thiss!1427) #b00000000111111111111111111111111) (= (mask!29926 thiss!1427) #b00000001111111111111111111111111) (= (mask!29926 thiss!1427) #b00000011111111111111111111111111) (= (mask!29926 thiss!1427) #b00000111111111111111111111111111) (= (mask!29926 thiss!1427) #b00001111111111111111111111111111) (= (mask!29926 thiss!1427) #b00011111111111111111111111111111) (= (mask!29926 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29926 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123649 d!123695))

(declare-fun d!123697 () Bool)

(declare-datatypes ((Option!633 0))(
  ( (Some!632 (v!14780 V!37291)) (None!631) )
))
(declare-fun get!16386 (Option!633) V!37291)

(declare-fun getValueByKey!582 (List!21812 (_ BitVec 64)) Option!633)

(assert (=> d!123697 (= (apply!912 lt!454197 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16386 (getValueByKey!582 (toList!6863 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30078 () Bool)

(assert (= bs!30078 d!123697))

(declare-fun m!950237 () Bool)

(assert (=> bs!30078 m!950237))

(assert (=> bs!30078 m!950237))

(declare-fun m!950239 () Bool)

(assert (=> bs!30078 m!950239))

(assert (=> b!1030605 d!123697))

(declare-fun d!123699 () Bool)

(declare-fun res!689122 () Bool)

(declare-fun e!582044 () Bool)

(assert (=> d!123699 (=> res!689122 e!582044)))

(assert (=> d!123699 (= res!689122 (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)) e!582044)))

(declare-fun b!1030743 () Bool)

(declare-fun e!582046 () Bool)

(assert (=> b!1030743 (= e!582044 e!582046)))

(declare-fun c!104390 () Bool)

(assert (=> b!1030743 (= c!104390 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43538 () Bool)

(declare-fun call!43541 () Bool)

(assert (=> bm!43538 (= call!43541 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(declare-fun b!1030744 () Bool)

(declare-fun e!582045 () Bool)

(assert (=> b!1030744 (= e!582045 call!43541)))

(declare-fun b!1030745 () Bool)

(assert (=> b!1030745 (= e!582046 call!43541)))

(declare-fun b!1030746 () Bool)

(assert (=> b!1030746 (= e!582046 e!582045)))

(declare-fun lt!454271 () (_ BitVec 64))

(assert (=> b!1030746 (= lt!454271 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454270 () Unit!33620)

(assert (=> b!1030746 (= lt!454270 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11313 thiss!1427) lt!454271 #b00000000000000000000000000000000))))

(assert (=> b!1030746 (arrayContainsKey!0 (_keys!11313 thiss!1427) lt!454271 #b00000000000000000000000000000000)))

(declare-fun lt!454272 () Unit!33620)

(assert (=> b!1030746 (= lt!454272 lt!454270)))

(declare-fun res!689121 () Bool)

(assert (=> b!1030746 (= res!689121 (= (seekEntryOrOpen!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000) (_keys!11313 thiss!1427) (mask!29926 thiss!1427)) (Found!9638 #b00000000000000000000000000000000)))))

(assert (=> b!1030746 (=> (not res!689121) (not e!582045))))

(assert (= (and d!123699 (not res!689122)) b!1030743))

(assert (= (and b!1030743 c!104390) b!1030746))

(assert (= (and b!1030743 (not c!104390)) b!1030745))

(assert (= (and b!1030746 res!689121) b!1030744))

(assert (= (or b!1030744 b!1030745) bm!43538))

(assert (=> b!1030743 m!950065))

(assert (=> b!1030743 m!950065))

(assert (=> b!1030743 m!950067))

(declare-fun m!950241 () Bool)

(assert (=> bm!43538 m!950241))

(assert (=> b!1030746 m!950065))

(declare-fun m!950243 () Bool)

(assert (=> b!1030746 m!950243))

(declare-fun m!950245 () Bool)

(assert (=> b!1030746 m!950245))

(assert (=> b!1030746 m!950065))

(declare-fun m!950247 () Bool)

(assert (=> b!1030746 m!950247))

(assert (=> b!1030689 d!123699))

(declare-fun d!123701 () Bool)

(assert (=> d!123701 (= (apply!912 lt!454247 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16386 (getValueByKey!582 (toList!6863 lt!454247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30079 () Bool)

(assert (= bs!30079 d!123701))

(declare-fun m!950249 () Bool)

(assert (=> bs!30079 m!950249))

(assert (=> bs!30079 m!950249))

(declare-fun m!950251 () Bool)

(assert (=> bs!30079 m!950251))

(assert (=> b!1030681 d!123701))

(declare-fun d!123703 () Bool)

(declare-fun e!582051 () Bool)

(assert (=> d!123703 e!582051))

(declare-fun res!689125 () Bool)

(assert (=> d!123703 (=> res!689125 e!582051)))

(declare-fun lt!454281 () Bool)

(assert (=> d!123703 (= res!689125 (not lt!454281))))

(declare-fun lt!454283 () Bool)

(assert (=> d!123703 (= lt!454281 lt!454283)))

(declare-fun lt!454284 () Unit!33620)

(declare-fun e!582052 () Unit!33620)

(assert (=> d!123703 (= lt!454284 e!582052)))

(declare-fun c!104393 () Bool)

(assert (=> d!123703 (= c!104393 lt!454283)))

(declare-fun containsKey!563 (List!21812 (_ BitVec 64)) Bool)

(assert (=> d!123703 (= lt!454283 (containsKey!563 (toList!6863 lt!454247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123703 (= (contains!5998 lt!454247 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454281)))

(declare-fun b!1030753 () Bool)

(declare-fun lt!454282 () Unit!33620)

(assert (=> b!1030753 (= e!582052 lt!454282)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!394 (List!21812 (_ BitVec 64)) Unit!33620)

(assert (=> b!1030753 (= lt!454282 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!432 (Option!633) Bool)

(assert (=> b!1030753 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030754 () Bool)

(declare-fun Unit!33632 () Unit!33620)

(assert (=> b!1030754 (= e!582052 Unit!33632)))

(declare-fun b!1030755 () Bool)

(assert (=> b!1030755 (= e!582051 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123703 c!104393) b!1030753))

(assert (= (and d!123703 (not c!104393)) b!1030754))

(assert (= (and d!123703 (not res!689125)) b!1030755))

(declare-fun m!950253 () Bool)

(assert (=> d!123703 m!950253))

(declare-fun m!950255 () Bool)

(assert (=> b!1030753 m!950255))

(assert (=> b!1030753 m!950249))

(assert (=> b!1030753 m!950249))

(declare-fun m!950257 () Bool)

(assert (=> b!1030753 m!950257))

(assert (=> b!1030755 m!950249))

(assert (=> b!1030755 m!950249))

(assert (=> b!1030755 m!950257))

(assert (=> bm!43535 d!123703))

(declare-fun b!1030756 () Bool)

(declare-fun e!582053 () (_ BitVec 32))

(assert (=> b!1030756 (= e!582053 #b00000000000000000000000000000000)))

(declare-fun b!1030757 () Bool)

(declare-fun e!582054 () (_ BitVec 32))

(assert (=> b!1030757 (= e!582053 e!582054)))

(declare-fun c!104394 () Bool)

(assert (=> b!1030757 (= c!104394 (validKeyInArray!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030758 () Bool)

(declare-fun call!43542 () (_ BitVec 32))

(assert (=> b!1030758 (= e!582054 call!43542)))

(declare-fun b!1030759 () Bool)

(assert (=> b!1030759 (= e!582054 (bvadd #b00000000000000000000000000000001 call!43542))))

(declare-fun bm!43539 () Bool)

(assert (=> bm!43539 (= call!43542 (arrayCountValidKeys!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123705 () Bool)

(declare-fun lt!454285 () (_ BitVec 32))

(assert (=> d!123705 (and (bvsge lt!454285 #b00000000000000000000000000000000) (bvsle lt!454285 (bvsub (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!123705 (= lt!454285 e!582053)))

(declare-fun c!104395 () Bool)

(assert (=> d!123705 (= c!104395 (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123705 (and (bvsle #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31681 (_keys!11313 thiss!1427)) (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(assert (=> d!123705 (= (arrayCountValidKeys!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))) lt!454285)))

(assert (= (and d!123705 c!104395) b!1030756))

(assert (= (and d!123705 (not c!104395)) b!1030757))

(assert (= (and b!1030757 c!104394) b!1030759))

(assert (= (and b!1030757 (not c!104394)) b!1030758))

(assert (= (or b!1030759 b!1030758) bm!43539))

(declare-fun m!950259 () Bool)

(assert (=> b!1030757 m!950259))

(assert (=> b!1030757 m!950259))

(declare-fun m!950261 () Bool)

(assert (=> b!1030757 m!950261))

(declare-fun m!950263 () Bool)

(assert (=> bm!43539 m!950263))

(assert (=> b!1030657 d!123705))

(assert (=> b!1030657 d!123665))

(declare-fun d!123707 () Bool)

(assert (=> d!123707 (= (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) (and (not (= (select (arr!31165 lt!454067) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31165 lt!454067) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030633 d!123707))

(declare-fun d!123709 () Bool)

(assert (=> d!123709 (= (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030599 d!123709))

(assert (=> b!1030675 d!123707))

(declare-fun d!123711 () Bool)

(assert (=> d!123711 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1030655 d!123711))

(assert (=> b!1030602 d!123709))

(assert (=> b!1030678 d!123707))

(declare-fun d!123713 () Bool)

(assert (=> d!123713 (= (apply!912 lt!454197 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)) (get!16386 (getValueByKey!582 (toList!6863 lt!454197) (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30080 () Bool)

(assert (= bs!30080 d!123713))

(assert (=> bs!30080 m!950065))

(declare-fun m!950265 () Bool)

(assert (=> bs!30080 m!950265))

(assert (=> bs!30080 m!950265))

(declare-fun m!950267 () Bool)

(assert (=> bs!30080 m!950267))

(assert (=> b!1030585 d!123713))

(declare-fun d!123715 () Bool)

(declare-fun c!104398 () Bool)

(assert (=> d!123715 (= c!104398 ((_ is ValueCellFull!11453) (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!582057 () V!37291)

(assert (=> d!123715 (= (get!16385 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!582057)))

(declare-fun b!1030764 () Bool)

(declare-fun get!16387 (ValueCell!11453 V!37291) V!37291)

(assert (=> b!1030764 (= e!582057 (get!16387 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030765 () Bool)

(declare-fun get!16388 (ValueCell!11453 V!37291) V!37291)

(assert (=> b!1030765 (= e!582057 (get!16388 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123715 c!104398) b!1030764))

(assert (= (and d!123715 (not c!104398)) b!1030765))

(assert (=> b!1030764 m!950069))

(assert (=> b!1030764 m!949933))

(declare-fun m!950269 () Bool)

(assert (=> b!1030764 m!950269))

(assert (=> b!1030765 m!950069))

(assert (=> b!1030765 m!949933))

(declare-fun m!950271 () Bool)

(assert (=> b!1030765 m!950271))

(assert (=> b!1030585 d!123715))

(declare-fun d!123717 () Bool)

(declare-fun e!582058 () Bool)

(assert (=> d!123717 e!582058))

(declare-fun res!689126 () Bool)

(assert (=> d!123717 (=> res!689126 e!582058)))

(declare-fun lt!454286 () Bool)

(assert (=> d!123717 (= res!689126 (not lt!454286))))

(declare-fun lt!454288 () Bool)

(assert (=> d!123717 (= lt!454286 lt!454288)))

(declare-fun lt!454289 () Unit!33620)

(declare-fun e!582059 () Unit!33620)

(assert (=> d!123717 (= lt!454289 e!582059)))

(declare-fun c!104399 () Bool)

(assert (=> d!123717 (= c!104399 lt!454288)))

(assert (=> d!123717 (= lt!454288 (containsKey!563 (toList!6863 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123717 (= (contains!5998 lt!454197 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454286)))

(declare-fun b!1030766 () Bool)

(declare-fun lt!454287 () Unit!33620)

(assert (=> b!1030766 (= e!582059 lt!454287)))

(assert (=> b!1030766 (= lt!454287 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030766 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030767 () Bool)

(declare-fun Unit!33633 () Unit!33620)

(assert (=> b!1030767 (= e!582059 Unit!33633)))

(declare-fun b!1030768 () Bool)

(assert (=> b!1030768 (= e!582058 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123717 c!104399) b!1030766))

(assert (= (and d!123717 (not c!104399)) b!1030767))

(assert (= (and d!123717 (not res!689126)) b!1030768))

(declare-fun m!950273 () Bool)

(assert (=> d!123717 m!950273))

(declare-fun m!950275 () Bool)

(assert (=> b!1030766 m!950275))

(assert (=> b!1030766 m!950237))

(assert (=> b!1030766 m!950237))

(declare-fun m!950277 () Bool)

(assert (=> b!1030766 m!950277))

(assert (=> b!1030768 m!950237))

(assert (=> b!1030768 m!950237))

(assert (=> b!1030768 m!950277))

(assert (=> bm!43521 d!123717))

(declare-fun d!123719 () Bool)

(assert (=> d!123719 (= (apply!912 lt!454247 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) (get!16386 (getValueByKey!582 (toList!6863 lt!454247) (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))))

(declare-fun bs!30081 () Bool)

(assert (= bs!30081 d!123719))

(assert (=> bs!30081 m!950055))

(declare-fun m!950279 () Bool)

(assert (=> bs!30081 m!950279))

(assert (=> bs!30081 m!950279))

(declare-fun m!950281 () Bool)

(assert (=> bs!30081 m!950281))

(assert (=> b!1030661 d!123719))

(declare-fun d!123721 () Bool)

(declare-fun c!104400 () Bool)

(assert (=> d!123721 (= c!104400 ((_ is ValueCellFull!11453) (select (arr!31166 lt!454068) #b00000000000000000000000000000000)))))

(declare-fun e!582060 () V!37291)

(assert (=> d!123721 (= (get!16385 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!582060)))

(declare-fun b!1030769 () Bool)

(assert (=> b!1030769 (= e!582060 (get!16387 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030770 () Bool)

(assert (=> b!1030770 (= e!582060 (get!16388 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123721 c!104400) b!1030769))

(assert (= (and d!123721 (not c!104400)) b!1030770))

(assert (=> b!1030769 m!950161))

(assert (=> b!1030769 m!949933))

(declare-fun m!950283 () Bool)

(assert (=> b!1030769 m!950283))

(assert (=> b!1030770 m!950161))

(assert (=> b!1030770 m!949933))

(declare-fun m!950285 () Bool)

(assert (=> b!1030770 m!950285))

(assert (=> b!1030661 d!123721))

(declare-fun d!123723 () Bool)

(declare-fun res!689127 () Bool)

(declare-fun e!582061 () Bool)

(assert (=> d!123723 (=> res!689127 e!582061)))

(assert (=> d!123723 (= res!689127 (= (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123723 (= (arrayContainsKey!0 lt!454067 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!582061)))

(declare-fun b!1030771 () Bool)

(declare-fun e!582062 () Bool)

(assert (=> b!1030771 (= e!582061 e!582062)))

(declare-fun res!689128 () Bool)

(assert (=> b!1030771 (=> (not res!689128) (not e!582062))))

(assert (=> b!1030771 (= res!689128 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31681 lt!454067)))))

(declare-fun b!1030772 () Bool)

(assert (=> b!1030772 (= e!582062 (arrayContainsKey!0 lt!454067 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123723 (not res!689127)) b!1030771))

(assert (= (and b!1030771 res!689128) b!1030772))

(assert (=> d!123723 m!950221))

(declare-fun m!950287 () Bool)

(assert (=> b!1030772 m!950287))

(assert (=> b!1030645 d!123723))

(declare-fun lt!454295 () SeekEntryResult!9638)

(declare-fun d!123725 () Bool)

(assert (=> d!123725 (and (or ((_ is Undefined!9638) lt!454295) (not ((_ is Found!9638) lt!454295)) (and (bvsge (index!40924 lt!454295) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454295) (size!31681 (_keys!11313 thiss!1427))))) (or ((_ is Undefined!9638) lt!454295) ((_ is Found!9638) lt!454295) (not ((_ is MissingVacant!9638) lt!454295)) (not (= (index!40926 lt!454295) (index!40925 lt!454135))) (and (bvsge (index!40926 lt!454295) #b00000000000000000000000000000000) (bvslt (index!40926 lt!454295) (size!31681 (_keys!11313 thiss!1427))))) (or ((_ is Undefined!9638) lt!454295) (ite ((_ is Found!9638) lt!454295) (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454295)) key!909) (and ((_ is MissingVacant!9638) lt!454295) (= (index!40926 lt!454295) (index!40925 lt!454135)) (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40926 lt!454295)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!582070 () SeekEntryResult!9638)

(assert (=> d!123725 (= lt!454295 e!582070)))

(declare-fun c!104407 () Bool)

(assert (=> d!123725 (= c!104407 (bvsge (x!91564 lt!454135) #b01111111111111111111111111111110))))

(declare-fun lt!454294 () (_ BitVec 64))

(assert (=> d!123725 (= lt!454294 (select (arr!31165 (_keys!11313 thiss!1427)) (index!40925 lt!454135)))))

(assert (=> d!123725 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123725 (= (seekKeyOrZeroReturnVacant!0 (x!91564 lt!454135) (index!40925 lt!454135) (index!40925 lt!454135) key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)) lt!454295)))

(declare-fun b!1030785 () Bool)

(declare-fun c!104409 () Bool)

(assert (=> b!1030785 (= c!104409 (= lt!454294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582069 () SeekEntryResult!9638)

(declare-fun e!582071 () SeekEntryResult!9638)

(assert (=> b!1030785 (= e!582069 e!582071)))

(declare-fun b!1030786 () Bool)

(assert (=> b!1030786 (= e!582070 Undefined!9638)))

(declare-fun b!1030787 () Bool)

(assert (=> b!1030787 (= e!582071 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91564 lt!454135) #b00000000000000000000000000000001) (nextIndex!0 (index!40925 lt!454135) (bvadd (x!91564 lt!454135) #b00000000000000000000000000000001) (mask!29926 thiss!1427)) (index!40925 lt!454135) key!909 (_keys!11313 thiss!1427) (mask!29926 thiss!1427)))))

(declare-fun b!1030788 () Bool)

(assert (=> b!1030788 (= e!582070 e!582069)))

(declare-fun c!104408 () Bool)

(assert (=> b!1030788 (= c!104408 (= lt!454294 key!909))))

(declare-fun b!1030789 () Bool)

(assert (=> b!1030789 (= e!582069 (Found!9638 (index!40925 lt!454135)))))

(declare-fun b!1030790 () Bool)

(assert (=> b!1030790 (= e!582071 (MissingVacant!9638 (index!40925 lt!454135)))))

(assert (= (and d!123725 c!104407) b!1030786))

(assert (= (and d!123725 (not c!104407)) b!1030788))

(assert (= (and b!1030788 c!104408) b!1030789))

(assert (= (and b!1030788 (not c!104408)) b!1030785))

(assert (= (and b!1030785 c!104409) b!1030790))

(assert (= (and b!1030785 (not c!104409)) b!1030787))

(declare-fun m!950289 () Bool)

(assert (=> d!123725 m!950289))

(declare-fun m!950291 () Bool)

(assert (=> d!123725 m!950291))

(assert (=> d!123725 m!950049))

(assert (=> d!123725 m!950047))

(declare-fun m!950293 () Bool)

(assert (=> b!1030787 m!950293))

(assert (=> b!1030787 m!950293))

(declare-fun m!950295 () Bool)

(assert (=> b!1030787 m!950295))

(assert (=> b!1030520 d!123725))

(declare-fun d!123727 () Bool)

(declare-fun res!689130 () Bool)

(declare-fun e!582072 () Bool)

(assert (=> d!123727 (=> res!689130 e!582072)))

(assert (=> d!123727 (= res!689130 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 lt!454067)))))

(assert (=> d!123727 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!454067 (mask!29926 thiss!1427)) e!582072)))

(declare-fun b!1030791 () Bool)

(declare-fun e!582074 () Bool)

(assert (=> b!1030791 (= e!582072 e!582074)))

(declare-fun c!104410 () Bool)

(assert (=> b!1030791 (= c!104410 (validKeyInArray!0 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43540 () Bool)

(declare-fun call!43543 () Bool)

(assert (=> bm!43540 (= call!43543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!454067 (mask!29926 thiss!1427)))))

(declare-fun b!1030792 () Bool)

(declare-fun e!582073 () Bool)

(assert (=> b!1030792 (= e!582073 call!43543)))

(declare-fun b!1030793 () Bool)

(assert (=> b!1030793 (= e!582074 call!43543)))

(declare-fun b!1030794 () Bool)

(assert (=> b!1030794 (= e!582074 e!582073)))

(declare-fun lt!454297 () (_ BitVec 64))

(assert (=> b!1030794 (= lt!454297 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!454296 () Unit!33620)

(assert (=> b!1030794 (= lt!454296 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454067 lt!454297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1030794 (arrayContainsKey!0 lt!454067 lt!454297 #b00000000000000000000000000000000)))

(declare-fun lt!454298 () Unit!33620)

(assert (=> b!1030794 (= lt!454298 lt!454296)))

(declare-fun res!689129 () Bool)

(assert (=> b!1030794 (= res!689129 (= (seekEntryOrOpen!0 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!454067 (mask!29926 thiss!1427)) (Found!9638 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1030794 (=> (not res!689129) (not e!582073))))

(assert (= (and d!123727 (not res!689130)) b!1030791))

(assert (= (and b!1030791 c!104410) b!1030794))

(assert (= (and b!1030791 (not c!104410)) b!1030793))

(assert (= (and b!1030794 res!689129) b!1030792))

(assert (= (or b!1030792 b!1030793) bm!43540))

(assert (=> b!1030791 m!950221))

(assert (=> b!1030791 m!950221))

(assert (=> b!1030791 m!950223))

(declare-fun m!950297 () Bool)

(assert (=> bm!43540 m!950297))

(assert (=> b!1030794 m!950221))

(declare-fun m!950299 () Bool)

(assert (=> b!1030794 m!950299))

(declare-fun m!950301 () Bool)

(assert (=> b!1030794 m!950301))

(assert (=> b!1030794 m!950221))

(declare-fun m!950303 () Bool)

(assert (=> b!1030794 m!950303))

(assert (=> bm!43525 d!123727))

(declare-fun d!123729 () Bool)

(assert (=> d!123729 (= (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069))) (and (not (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030654 d!123729))

(declare-fun b!1030820 () Bool)

(declare-fun e!582094 () ListLongMap!13695)

(declare-fun e!582093 () ListLongMap!13695)

(assert (=> b!1030820 (= e!582094 e!582093)))

(declare-fun c!104422 () Bool)

(assert (=> b!1030820 (= c!104422 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030821 () Bool)

(declare-fun call!43546 () ListLongMap!13695)

(assert (=> b!1030821 (= e!582093 call!43546)))

(declare-fun b!1030822 () Bool)

(declare-fun e!582092 () Bool)

(assert (=> b!1030822 (= e!582092 (validKeyInArray!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (=> b!1030822 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1030823 () Bool)

(assert (=> b!1030823 (= e!582094 (ListLongMap!13696 Nil!21809))))

(declare-fun b!1030824 () Bool)

(declare-fun e!582089 () Bool)

(declare-fun lt!454313 () ListLongMap!13695)

(declare-fun isEmpty!928 (ListLongMap!13695) Bool)

(assert (=> b!1030824 (= e!582089 (isEmpty!928 lt!454313))))

(declare-fun b!1030825 () Bool)

(declare-fun e!582095 () Bool)

(declare-fun e!582090 () Bool)

(assert (=> b!1030825 (= e!582095 e!582090)))

(assert (=> b!1030825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(declare-fun res!689142 () Bool)

(assert (=> b!1030825 (= res!689142 (contains!5998 lt!454313 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (=> b!1030825 (=> (not res!689142) (not e!582090))))

(declare-fun b!1030826 () Bool)

(assert (=> b!1030826 (= e!582095 e!582089)))

(declare-fun c!104419 () Bool)

(assert (=> b!1030826 (= c!104419 (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(declare-fun b!1030819 () Bool)

(declare-fun e!582091 () Bool)

(assert (=> b!1030819 (= e!582091 e!582095)))

(declare-fun c!104421 () Bool)

(assert (=> b!1030819 (= c!104421 e!582092)))

(declare-fun res!689140 () Bool)

(assert (=> b!1030819 (=> (not res!689140) (not e!582092))))

(assert (=> b!1030819 (= res!689140 (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(declare-fun d!123731 () Bool)

(assert (=> d!123731 e!582091))

(declare-fun res!689141 () Bool)

(assert (=> d!123731 (=> (not res!689141) (not e!582091))))

(assert (=> d!123731 (= res!689141 (not (contains!5998 lt!454313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123731 (= lt!454313 e!582094)))

(declare-fun c!104420 () Bool)

(assert (=> d!123731 (= c!104420 (bvsge #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(assert (=> d!123731 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123731 (= (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!454313)))

(declare-fun b!1030827 () Bool)

(declare-fun lt!454316 () Unit!33620)

(declare-fun lt!454314 () Unit!33620)

(assert (=> b!1030827 (= lt!454316 lt!454314)))

(declare-fun lt!454319 () V!37291)

(declare-fun lt!454318 () (_ BitVec 64))

(declare-fun lt!454317 () (_ BitVec 64))

(declare-fun lt!454315 () ListLongMap!13695)

(assert (=> b!1030827 (not (contains!5998 (+!3123 lt!454315 (tuple2!15573 lt!454317 lt!454319)) lt!454318))))

(declare-fun addStillNotContains!242 (ListLongMap!13695 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33620)

(assert (=> b!1030827 (= lt!454314 (addStillNotContains!242 lt!454315 lt!454317 lt!454319 lt!454318))))

(assert (=> b!1030827 (= lt!454318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1030827 (= lt!454319 (get!16385 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1030827 (= lt!454317 (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))

(assert (=> b!1030827 (= lt!454315 call!43546)))

(assert (=> b!1030827 (= e!582093 (+!3123 call!43546 (tuple2!15573 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) (get!16385 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!43543 () Bool)

(assert (=> bm!43543 (= call!43546 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1030828 () Bool)

(assert (=> b!1030828 (= e!582089 (= lt!454313 (getCurrentListMapNoExtraKeys!3563 lt!454067 lt!454068 (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427))))))

(declare-fun b!1030829 () Bool)

(declare-fun res!689139 () Bool)

(assert (=> b!1030829 (=> (not res!689139) (not e!582091))))

(assert (=> b!1030829 (= res!689139 (not (contains!5998 lt!454313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030830 () Bool)

(assert (=> b!1030830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 lt!454067)))))

(assert (=> b!1030830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31682 lt!454068)))))

(assert (=> b!1030830 (= e!582090 (= (apply!912 lt!454313 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) (get!16385 (select (arr!31166 lt!454068) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123731 c!104420) b!1030823))

(assert (= (and d!123731 (not c!104420)) b!1030820))

(assert (= (and b!1030820 c!104422) b!1030827))

(assert (= (and b!1030820 (not c!104422)) b!1030821))

(assert (= (or b!1030827 b!1030821) bm!43543))

(assert (= (and d!123731 res!689141) b!1030829))

(assert (= (and b!1030829 res!689139) b!1030819))

(assert (= (and b!1030819 res!689140) b!1030822))

(assert (= (and b!1030819 c!104421) b!1030825))

(assert (= (and b!1030819 (not c!104421)) b!1030826))

(assert (= (and b!1030825 res!689142) b!1030830))

(assert (= (and b!1030826 c!104419) b!1030828))

(assert (= (and b!1030826 (not c!104419)) b!1030824))

(declare-fun b_lambda!15877 () Bool)

(assert (=> (not b_lambda!15877) (not b!1030827)))

(assert (=> b!1030827 t!30891))

(declare-fun b_and!32939 () Bool)

(assert (= b_and!32937 (and (=> t!30891 result!14137) b_and!32939)))

(declare-fun b_lambda!15879 () Bool)

(assert (=> (not b_lambda!15879) (not b!1030830)))

(assert (=> b!1030830 t!30891))

(declare-fun b_and!32941 () Bool)

(assert (= b_and!32939 (and (=> t!30891 result!14137) b_and!32941)))

(declare-fun m!950305 () Bool)

(assert (=> b!1030827 m!950305))

(assert (=> b!1030827 m!949933))

(assert (=> b!1030827 m!950055))

(declare-fun m!950307 () Bool)

(assert (=> b!1030827 m!950307))

(declare-fun m!950309 () Bool)

(assert (=> b!1030827 m!950309))

(declare-fun m!950311 () Bool)

(assert (=> b!1030827 m!950311))

(assert (=> b!1030827 m!950161))

(assert (=> b!1030827 m!950161))

(assert (=> b!1030827 m!949933))

(assert (=> b!1030827 m!950163))

(assert (=> b!1030827 m!950307))

(declare-fun m!950313 () Bool)

(assert (=> bm!43543 m!950313))

(assert (=> b!1030830 m!949933))

(assert (=> b!1030830 m!950055))

(assert (=> b!1030830 m!950055))

(declare-fun m!950315 () Bool)

(assert (=> b!1030830 m!950315))

(assert (=> b!1030830 m!950161))

(assert (=> b!1030830 m!949933))

(assert (=> b!1030830 m!950163))

(assert (=> b!1030830 m!950161))

(declare-fun m!950317 () Bool)

(assert (=> b!1030829 m!950317))

(declare-fun m!950319 () Bool)

(assert (=> b!1030824 m!950319))

(assert (=> b!1030820 m!950055))

(assert (=> b!1030820 m!950055))

(assert (=> b!1030820 m!950057))

(declare-fun m!950321 () Bool)

(assert (=> d!123731 m!950321))

(assert (=> d!123731 m!950047))

(assert (=> b!1030825 m!950055))

(assert (=> b!1030825 m!950055))

(declare-fun m!950323 () Bool)

(assert (=> b!1030825 m!950323))

(assert (=> b!1030822 m!950055))

(assert (=> b!1030822 m!950055))

(assert (=> b!1030822 m!950057))

(assert (=> b!1030828 m!950313))

(assert (=> bm!43532 d!123731))

(declare-fun d!123733 () Bool)

(declare-fun e!582096 () Bool)

(assert (=> d!123733 e!582096))

(declare-fun res!689143 () Bool)

(assert (=> d!123733 (=> res!689143 e!582096)))

(declare-fun lt!454320 () Bool)

(assert (=> d!123733 (= res!689143 (not lt!454320))))

(declare-fun lt!454322 () Bool)

(assert (=> d!123733 (= lt!454320 lt!454322)))

(declare-fun lt!454323 () Unit!33620)

(declare-fun e!582097 () Unit!33620)

(assert (=> d!123733 (= lt!454323 e!582097)))

(declare-fun c!104423 () Bool)

(assert (=> d!123733 (= c!104423 lt!454322)))

(assert (=> d!123733 (= lt!454322 (containsKey!563 (toList!6863 lt!454197) (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123733 (= (contains!5998 lt!454197 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)) lt!454320)))

(declare-fun b!1030831 () Bool)

(declare-fun lt!454321 () Unit!33620)

(assert (=> b!1030831 (= e!582097 lt!454321)))

(assert (=> b!1030831 (= lt!454321 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454197) (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030831 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454197) (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030832 () Bool)

(declare-fun Unit!33634 () Unit!33620)

(assert (=> b!1030832 (= e!582097 Unit!33634)))

(declare-fun b!1030833 () Bool)

(assert (=> b!1030833 (= e!582096 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454197) (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123733 c!104423) b!1030831))

(assert (= (and d!123733 (not c!104423)) b!1030832))

(assert (= (and d!123733 (not res!689143)) b!1030833))

(assert (=> d!123733 m!950065))

(declare-fun m!950325 () Bool)

(assert (=> d!123733 m!950325))

(assert (=> b!1030831 m!950065))

(declare-fun m!950327 () Bool)

(assert (=> b!1030831 m!950327))

(assert (=> b!1030831 m!950065))

(assert (=> b!1030831 m!950265))

(assert (=> b!1030831 m!950265))

(declare-fun m!950329 () Bool)

(assert (=> b!1030831 m!950329))

(assert (=> b!1030833 m!950065))

(assert (=> b!1030833 m!950265))

(assert (=> b!1030833 m!950265))

(assert (=> b!1030833 m!950329))

(assert (=> b!1030592 d!123733))

(assert (=> b!1030542 d!123707))

(declare-fun d!123735 () Bool)

(declare-fun e!582098 () Bool)

(assert (=> d!123735 e!582098))

(declare-fun res!689144 () Bool)

(assert (=> d!123735 (=> res!689144 e!582098)))

(declare-fun lt!454324 () Bool)

(assert (=> d!123735 (= res!689144 (not lt!454324))))

(declare-fun lt!454326 () Bool)

(assert (=> d!123735 (= lt!454324 lt!454326)))

(declare-fun lt!454327 () Unit!33620)

(declare-fun e!582099 () Unit!33620)

(assert (=> d!123735 (= lt!454327 e!582099)))

(declare-fun c!104424 () Bool)

(assert (=> d!123735 (= c!104424 lt!454326)))

(assert (=> d!123735 (= lt!454326 (containsKey!563 (toList!6863 lt!454247) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (=> d!123735 (= (contains!5998 lt!454247 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) lt!454324)))

(declare-fun b!1030834 () Bool)

(declare-fun lt!454325 () Unit!33620)

(assert (=> b!1030834 (= e!582099 lt!454325)))

(assert (=> b!1030834 (= lt!454325 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454247) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (=> b!1030834 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454247) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030835 () Bool)

(declare-fun Unit!33635 () Unit!33620)

(assert (=> b!1030835 (= e!582099 Unit!33635)))

(declare-fun b!1030836 () Bool)

(assert (=> b!1030836 (= e!582098 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454247) (select (arr!31165 lt!454067) #b00000000000000000000000000000000))))))

(assert (= (and d!123735 c!104424) b!1030834))

(assert (= (and d!123735 (not c!104424)) b!1030835))

(assert (= (and d!123735 (not res!689144)) b!1030836))

(assert (=> d!123735 m!950055))

(declare-fun m!950331 () Bool)

(assert (=> d!123735 m!950331))

(assert (=> b!1030834 m!950055))

(declare-fun m!950333 () Bool)

(assert (=> b!1030834 m!950333))

(assert (=> b!1030834 m!950055))

(assert (=> b!1030834 m!950279))

(assert (=> b!1030834 m!950279))

(declare-fun m!950335 () Bool)

(assert (=> b!1030834 m!950335))

(assert (=> b!1030836 m!950055))

(assert (=> b!1030836 m!950279))

(assert (=> b!1030836 m!950279))

(assert (=> b!1030836 m!950335))

(assert (=> b!1030668 d!123735))

(declare-fun d!123737 () Bool)

(declare-fun e!582102 () Bool)

(assert (=> d!123737 e!582102))

(declare-fun res!689150 () Bool)

(assert (=> d!123737 (=> (not res!689150) (not e!582102))))

(declare-fun lt!454338 () ListLongMap!13695)

(assert (=> d!123737 (= res!689150 (contains!5998 lt!454338 (_1!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun lt!454337 () List!21812)

(assert (=> d!123737 (= lt!454338 (ListLongMap!13696 lt!454337))))

(declare-fun lt!454336 () Unit!33620)

(declare-fun lt!454339 () Unit!33620)

(assert (=> d!123737 (= lt!454336 lt!454339)))

(assert (=> d!123737 (= (getValueByKey!582 lt!454337 (_1!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!632 (_2!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!278 (List!21812 (_ BitVec 64) V!37291) Unit!33620)

(assert (=> d!123737 (= lt!454339 (lemmaContainsTupThenGetReturnValue!278 lt!454337 (_1!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun insertStrictlySorted!371 (List!21812 (_ BitVec 64) V!37291) List!21812)

(assert (=> d!123737 (= lt!454337 (insertStrictlySorted!371 (toList!6863 (ite c!104361 call!43521 (ite c!104358 call!43524 call!43522))) (_1!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123737 (= (+!3123 (ite c!104361 call!43521 (ite c!104358 call!43524 call!43522)) (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) lt!454338)))

(declare-fun b!1030841 () Bool)

(declare-fun res!689149 () Bool)

(assert (=> b!1030841 (=> (not res!689149) (not e!582102))))

(assert (=> b!1030841 (= res!689149 (= (getValueByKey!582 (toList!6863 lt!454338) (_1!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!632 (_2!7797 (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))))

(declare-fun b!1030842 () Bool)

(declare-fun contains!5999 (List!21812 tuple2!15572) Bool)

(assert (=> b!1030842 (= e!582102 (contains!5999 (toList!6863 lt!454338) (ite (or c!104361 c!104358) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (= (and d!123737 res!689150) b!1030841))

(assert (= (and b!1030841 res!689149) b!1030842))

(declare-fun m!950337 () Bool)

(assert (=> d!123737 m!950337))

(declare-fun m!950339 () Bool)

(assert (=> d!123737 m!950339))

(declare-fun m!950341 () Bool)

(assert (=> d!123737 m!950341))

(declare-fun m!950343 () Bool)

(assert (=> d!123737 m!950343))

(declare-fun m!950345 () Bool)

(assert (=> b!1030841 m!950345))

(declare-fun m!950347 () Bool)

(assert (=> b!1030842 m!950347))

(assert (=> bm!43519 d!123737))

(declare-fun d!123739 () Bool)

(declare-fun e!582103 () Bool)

(assert (=> d!123739 e!582103))

(declare-fun res!689152 () Bool)

(assert (=> d!123739 (=> (not res!689152) (not e!582103))))

(declare-fun lt!454342 () ListLongMap!13695)

(assert (=> d!123739 (= res!689152 (contains!5998 lt!454342 (_1!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun lt!454341 () List!21812)

(assert (=> d!123739 (= lt!454342 (ListLongMap!13696 lt!454341))))

(declare-fun lt!454340 () Unit!33620)

(declare-fun lt!454343 () Unit!33620)

(assert (=> d!123739 (= lt!454340 lt!454343)))

(assert (=> d!123739 (= (getValueByKey!582 lt!454341 (_1!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!632 (_2!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123739 (= lt!454343 (lemmaContainsTupThenGetReturnValue!278 lt!454341 (_1!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123739 (= lt!454341 (insertStrictlySorted!371 (toList!6863 (ite c!104378 call!43535 (ite c!104375 call!43538 call!43536))) (_1!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (_2!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(assert (=> d!123739 (= (+!3123 (ite c!104378 call!43535 (ite c!104375 call!43538 call!43536)) (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) lt!454342)))

(declare-fun b!1030843 () Bool)

(declare-fun res!689151 () Bool)

(assert (=> b!1030843 (=> (not res!689151) (not e!582103))))

(assert (=> b!1030843 (= res!689151 (= (getValueByKey!582 (toList!6863 lt!454342) (_1!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))) (Some!632 (_2!7797 (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))))

(declare-fun b!1030844 () Bool)

(assert (=> b!1030844 (= e!582103 (contains!5999 (toList!6863 lt!454342) (ite (or c!104378 c!104375) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (= (and d!123739 res!689152) b!1030843))

(assert (= (and b!1030843 res!689151) b!1030844))

(declare-fun m!950349 () Bool)

(assert (=> d!123739 m!950349))

(declare-fun m!950351 () Bool)

(assert (=> d!123739 m!950351))

(declare-fun m!950353 () Bool)

(assert (=> d!123739 m!950353))

(declare-fun m!950355 () Bool)

(assert (=> d!123739 m!950355))

(declare-fun m!950357 () Bool)

(assert (=> b!1030843 m!950357))

(declare-fun m!950359 () Bool)

(assert (=> b!1030844 m!950359))

(assert (=> bm!43533 d!123739))

(declare-fun d!123741 () Bool)

(declare-fun e!582104 () Bool)

(assert (=> d!123741 e!582104))

(declare-fun res!689153 () Bool)

(assert (=> d!123741 (=> res!689153 e!582104)))

(declare-fun lt!454344 () Bool)

(assert (=> d!123741 (= res!689153 (not lt!454344))))

(declare-fun lt!454346 () Bool)

(assert (=> d!123741 (= lt!454344 lt!454346)))

(declare-fun lt!454347 () Unit!33620)

(declare-fun e!582105 () Unit!33620)

(assert (=> d!123741 (= lt!454347 e!582105)))

(declare-fun c!104425 () Bool)

(assert (=> d!123741 (= c!104425 lt!454346)))

(assert (=> d!123741 (= lt!454346 (containsKey!563 (toList!6863 lt!454232) key!909))))

(assert (=> d!123741 (= (contains!5998 lt!454232 key!909) lt!454344)))

(declare-fun b!1030845 () Bool)

(declare-fun lt!454345 () Unit!33620)

(assert (=> b!1030845 (= e!582105 lt!454345)))

(assert (=> b!1030845 (= lt!454345 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454232) key!909))))

(assert (=> b!1030845 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454232) key!909))))

(declare-fun b!1030846 () Bool)

(declare-fun Unit!33636 () Unit!33620)

(assert (=> b!1030846 (= e!582105 Unit!33636)))

(declare-fun b!1030847 () Bool)

(assert (=> b!1030847 (= e!582104 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454232) key!909)))))

(assert (= (and d!123741 c!104425) b!1030845))

(assert (= (and d!123741 (not c!104425)) b!1030846))

(assert (= (and d!123741 (not res!689153)) b!1030847))

(declare-fun m!950361 () Bool)

(assert (=> d!123741 m!950361))

(declare-fun m!950363 () Bool)

(assert (=> b!1030845 m!950363))

(declare-fun m!950365 () Bool)

(assert (=> b!1030845 m!950365))

(assert (=> b!1030845 m!950365))

(declare-fun m!950367 () Bool)

(assert (=> b!1030845 m!950367))

(assert (=> b!1030847 m!950365))

(assert (=> b!1030847 m!950365))

(assert (=> b!1030847 m!950367))

(assert (=> d!123671 d!123741))

(declare-fun b!1030858 () Bool)

(declare-fun e!582114 () List!21812)

(declare-fun $colon$colon!601 (List!21812 tuple2!15572) List!21812)

(assert (=> b!1030858 (= e!582114 ($colon$colon!601 (removeStrictlySorted!52 (t!30892 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))) key!909) (h!23017 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))))))

(declare-fun b!1030859 () Bool)

(declare-fun e!582112 () List!21812)

(assert (=> b!1030859 (= e!582112 (t!30892 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))))

(declare-fun b!1030861 () Bool)

(assert (=> b!1030861 (= e!582114 Nil!21809)))

(declare-fun b!1030862 () Bool)

(assert (=> b!1030862 (= e!582112 e!582114)))

(declare-fun c!104431 () Bool)

(assert (=> b!1030862 (= c!104431 (and ((_ is Cons!21808) (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))) (not (= (_1!7797 (h!23017 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))) key!909))))))

(declare-fun b!1030860 () Bool)

(declare-fun e!582113 () Bool)

(declare-fun lt!454350 () List!21812)

(assert (=> b!1030860 (= e!582113 (not (containsKey!563 lt!454350 key!909)))))

(declare-fun d!123743 () Bool)

(assert (=> d!123743 e!582113))

(declare-fun res!689156 () Bool)

(assert (=> d!123743 (=> (not res!689156) (not e!582113))))

(declare-fun isStrictlySorted!704 (List!21812) Bool)

(assert (=> d!123743 (= res!689156 (isStrictlySorted!704 lt!454350))))

(assert (=> d!123743 (= lt!454350 e!582112)))

(declare-fun c!104430 () Bool)

(assert (=> d!123743 (= c!104430 (and ((_ is Cons!21808) (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))) (= (_1!7797 (h!23017 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))) key!909)))))

(assert (=> d!123743 (isStrictlySorted!704 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))))))

(assert (=> d!123743 (= (removeStrictlySorted!52 (toList!6863 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427))) key!909) lt!454350)))

(assert (= (and d!123743 c!104430) b!1030859))

(assert (= (and d!123743 (not c!104430)) b!1030862))

(assert (= (and b!1030862 c!104431) b!1030858))

(assert (= (and b!1030862 (not c!104431)) b!1030861))

(assert (= (and d!123743 res!689156) b!1030860))

(declare-fun m!950369 () Bool)

(assert (=> b!1030858 m!950369))

(assert (=> b!1030858 m!950369))

(declare-fun m!950371 () Bool)

(assert (=> b!1030858 m!950371))

(declare-fun m!950373 () Bool)

(assert (=> b!1030860 m!950373))

(declare-fun m!950375 () Bool)

(assert (=> d!123743 m!950375))

(declare-fun m!950377 () Bool)

(assert (=> d!123743 m!950377))

(assert (=> d!123671 d!123743))

(declare-fun b!1030864 () Bool)

(declare-fun e!582120 () ListLongMap!13695)

(declare-fun e!582119 () ListLongMap!13695)

(assert (=> b!1030864 (= e!582120 e!582119)))

(declare-fun c!104435 () Bool)

(assert (=> b!1030864 (= c!104435 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030865 () Bool)

(declare-fun call!43547 () ListLongMap!13695)

(assert (=> b!1030865 (= e!582119 call!43547)))

(declare-fun b!1030866 () Bool)

(declare-fun e!582118 () Bool)

(assert (=> b!1030866 (= e!582118 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030866 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1030867 () Bool)

(assert (=> b!1030867 (= e!582120 (ListLongMap!13696 Nil!21809))))

(declare-fun b!1030868 () Bool)

(declare-fun e!582115 () Bool)

(declare-fun lt!454351 () ListLongMap!13695)

(assert (=> b!1030868 (= e!582115 (isEmpty!928 lt!454351))))

(declare-fun b!1030869 () Bool)

(declare-fun e!582121 () Bool)

(declare-fun e!582116 () Bool)

(assert (=> b!1030869 (= e!582121 e!582116)))

(assert (=> b!1030869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun res!689160 () Bool)

(assert (=> b!1030869 (= res!689160 (contains!5998 lt!454351 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030869 (=> (not res!689160) (not e!582116))))

(declare-fun b!1030870 () Bool)

(assert (=> b!1030870 (= e!582121 e!582115)))

(declare-fun c!104432 () Bool)

(assert (=> b!1030870 (= c!104432 (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun b!1030863 () Bool)

(declare-fun e!582117 () Bool)

(assert (=> b!1030863 (= e!582117 e!582121)))

(declare-fun c!104434 () Bool)

(assert (=> b!1030863 (= c!104434 e!582118)))

(declare-fun res!689158 () Bool)

(assert (=> b!1030863 (=> (not res!689158) (not e!582118))))

(assert (=> b!1030863 (= res!689158 (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123745 () Bool)

(assert (=> d!123745 e!582117))

(declare-fun res!689159 () Bool)

(assert (=> d!123745 (=> (not res!689159) (not e!582117))))

(assert (=> d!123745 (= res!689159 (not (contains!5998 lt!454351 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123745 (= lt!454351 e!582120)))

(declare-fun c!104433 () Bool)

(assert (=> d!123745 (= c!104433 (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123745 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123745 (= (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!454351)))

(declare-fun b!1030871 () Bool)

(declare-fun lt!454354 () Unit!33620)

(declare-fun lt!454352 () Unit!33620)

(assert (=> b!1030871 (= lt!454354 lt!454352)))

(declare-fun lt!454356 () (_ BitVec 64))

(declare-fun lt!454353 () ListLongMap!13695)

(declare-fun lt!454355 () (_ BitVec 64))

(declare-fun lt!454357 () V!37291)

(assert (=> b!1030871 (not (contains!5998 (+!3123 lt!454353 (tuple2!15573 lt!454355 lt!454357)) lt!454356))))

(assert (=> b!1030871 (= lt!454352 (addStillNotContains!242 lt!454353 lt!454355 lt!454357 lt!454356))))

(assert (=> b!1030871 (= lt!454356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1030871 (= lt!454357 (get!16385 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1030871 (= lt!454355 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030871 (= lt!454353 call!43547)))

(assert (=> b!1030871 (= e!582119 (+!3123 call!43547 (tuple2!15573 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000) (get!16385 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!43544 () Bool)

(assert (=> bm!43544 (= call!43547 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1030872 () Bool)

(assert (=> b!1030872 (= e!582115 (= lt!454351 (getCurrentListMapNoExtraKeys!3563 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6114 thiss!1427))))))

(declare-fun b!1030873 () Bool)

(declare-fun res!689157 () Bool)

(assert (=> b!1030873 (=> (not res!689157) (not e!582117))))

(assert (=> b!1030873 (= res!689157 (not (contains!5998 lt!454351 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030874 () Bool)

(assert (=> b!1030874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> b!1030874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31682 (_values!6137 thiss!1427))))))

(assert (=> b!1030874 (= e!582116 (= (apply!912 lt!454351 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)) (get!16385 (select (arr!31166 (_values!6137 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123745 c!104433) b!1030867))

(assert (= (and d!123745 (not c!104433)) b!1030864))

(assert (= (and b!1030864 c!104435) b!1030871))

(assert (= (and b!1030864 (not c!104435)) b!1030865))

(assert (= (or b!1030871 b!1030865) bm!43544))

(assert (= (and d!123745 res!689159) b!1030873))

(assert (= (and b!1030873 res!689157) b!1030863))

(assert (= (and b!1030863 res!689158) b!1030866))

(assert (= (and b!1030863 c!104434) b!1030869))

(assert (= (and b!1030863 (not c!104434)) b!1030870))

(assert (= (and b!1030869 res!689160) b!1030874))

(assert (= (and b!1030870 c!104432) b!1030872))

(assert (= (and b!1030870 (not c!104432)) b!1030868))

(declare-fun b_lambda!15881 () Bool)

(assert (=> (not b_lambda!15881) (not b!1030871)))

(assert (=> b!1030871 t!30891))

(declare-fun b_and!32943 () Bool)

(assert (= b_and!32941 (and (=> t!30891 result!14137) b_and!32943)))

(declare-fun b_lambda!15883 () Bool)

(assert (=> (not b_lambda!15883) (not b!1030874)))

(assert (=> b!1030874 t!30891))

(declare-fun b_and!32945 () Bool)

(assert (= b_and!32943 (and (=> t!30891 result!14137) b_and!32945)))

(declare-fun m!950379 () Bool)

(assert (=> b!1030871 m!950379))

(assert (=> b!1030871 m!949933))

(assert (=> b!1030871 m!950065))

(declare-fun m!950381 () Bool)

(assert (=> b!1030871 m!950381))

(declare-fun m!950383 () Bool)

(assert (=> b!1030871 m!950383))

(declare-fun m!950385 () Bool)

(assert (=> b!1030871 m!950385))

(assert (=> b!1030871 m!950069))

(assert (=> b!1030871 m!950069))

(assert (=> b!1030871 m!949933))

(assert (=> b!1030871 m!950071))

(assert (=> b!1030871 m!950381))

(declare-fun m!950387 () Bool)

(assert (=> bm!43544 m!950387))

(assert (=> b!1030874 m!949933))

(assert (=> b!1030874 m!950065))

(assert (=> b!1030874 m!950065))

(declare-fun m!950389 () Bool)

(assert (=> b!1030874 m!950389))

(assert (=> b!1030874 m!950069))

(assert (=> b!1030874 m!949933))

(assert (=> b!1030874 m!950071))

(assert (=> b!1030874 m!950069))

(declare-fun m!950391 () Bool)

(assert (=> b!1030873 m!950391))

(declare-fun m!950393 () Bool)

(assert (=> b!1030868 m!950393))

(assert (=> b!1030864 m!950065))

(assert (=> b!1030864 m!950065))

(assert (=> b!1030864 m!950067))

(declare-fun m!950395 () Bool)

(assert (=> d!123745 m!950395))

(assert (=> d!123745 m!950047))

(assert (=> b!1030869 m!950065))

(assert (=> b!1030869 m!950065))

(declare-fun m!950397 () Bool)

(assert (=> b!1030869 m!950397))

(assert (=> b!1030866 m!950065))

(assert (=> b!1030866 m!950065))

(assert (=> b!1030866 m!950067))

(assert (=> b!1030872 m!950387))

(assert (=> bm!43518 d!123745))

(declare-fun d!123747 () Bool)

(declare-fun e!582122 () Bool)

(assert (=> d!123747 e!582122))

(declare-fun res!689161 () Bool)

(assert (=> d!123747 (=> res!689161 e!582122)))

(declare-fun lt!454358 () Bool)

(assert (=> d!123747 (= res!689161 (not lt!454358))))

(declare-fun lt!454360 () Bool)

(assert (=> d!123747 (= lt!454358 lt!454360)))

(declare-fun lt!454361 () Unit!33620)

(declare-fun e!582123 () Unit!33620)

(assert (=> d!123747 (= lt!454361 e!582123)))

(declare-fun c!104436 () Bool)

(assert (=> d!123747 (= c!104436 lt!454360)))

(assert (=> d!123747 (= lt!454360 (containsKey!563 (toList!6863 lt!454247) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123747 (= (contains!5998 lt!454247 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454358)))

(declare-fun b!1030875 () Bool)

(declare-fun lt!454359 () Unit!33620)

(assert (=> b!1030875 (= e!582123 lt!454359)))

(assert (=> b!1030875 (= lt!454359 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454247) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030875 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454247) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030876 () Bool)

(declare-fun Unit!33637 () Unit!33620)

(assert (=> b!1030876 (= e!582123 Unit!33637)))

(declare-fun b!1030877 () Bool)

(assert (=> b!1030877 (= e!582122 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123747 c!104436) b!1030875))

(assert (= (and d!123747 (not c!104436)) b!1030876))

(assert (= (and d!123747 (not res!689161)) b!1030877))

(declare-fun m!950399 () Bool)

(assert (=> d!123747 m!950399))

(declare-fun m!950401 () Bool)

(assert (=> b!1030875 m!950401))

(declare-fun m!950403 () Bool)

(assert (=> b!1030875 m!950403))

(assert (=> b!1030875 m!950403))

(declare-fun m!950405 () Bool)

(assert (=> b!1030875 m!950405))

(assert (=> b!1030877 m!950403))

(assert (=> b!1030877 m!950403))

(assert (=> b!1030877 m!950405))

(assert (=> bm!43536 d!123747))

(declare-fun d!123749 () Bool)

(assert (=> d!123749 (arrayNoDuplicates!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000000 Nil!21810)))

(assert (=> d!123749 true))

(declare-fun _$66!38 () Unit!33620)

(assert (=> d!123749 (= (choose!53 (_keys!11313 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40924 lt!454069) #b00000000000000000000000000000000 Nil!21810) _$66!38)))

(declare-fun bs!30082 () Bool)

(assert (= bs!30082 d!123749))

(assert (=> bs!30082 m!949919))

(assert (=> bs!30082 m!950121))

(assert (=> d!123657 d!123749))

(declare-fun d!123751 () Bool)

(assert (=> d!123751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (mask!29926 thiss!1427))))

(assert (=> d!123751 true))

(declare-fun _$44!15 () Unit!33620)

(assert (=> d!123751 (= (choose!25 (_keys!11313 thiss!1427) (index!40924 lt!454069) (mask!29926 thiss!1427)) _$44!15)))

(declare-fun bs!30083 () Bool)

(assert (= bs!30083 d!123751))

(assert (=> bs!30083 m!949919))

(assert (=> bs!30083 m!950157))

(assert (=> d!123673 d!123751))

(assert (=> d!123673 d!123695))

(declare-fun d!123753 () Bool)

(assert (=> d!123753 (= (apply!912 lt!454197 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16386 (getValueByKey!582 (toList!6863 lt!454197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30084 () Bool)

(assert (= bs!30084 d!123753))

(declare-fun m!950407 () Bool)

(assert (=> bs!30084 m!950407))

(assert (=> bs!30084 m!950407))

(declare-fun m!950409 () Bool)

(assert (=> bs!30084 m!950409))

(assert (=> b!1030588 d!123753))

(assert (=> b!1030538 d!123707))

(declare-fun d!123755 () Bool)

(declare-fun res!689162 () Bool)

(declare-fun e!582124 () Bool)

(assert (=> d!123755 (=> res!689162 e!582124)))

(assert (=> d!123755 (= res!689162 (= (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123755 (= (arrayContainsKey!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) key!909 #b00000000000000000000000000000000) e!582124)))

(declare-fun b!1030878 () Bool)

(declare-fun e!582125 () Bool)

(assert (=> b!1030878 (= e!582124 e!582125)))

(declare-fun res!689163 () Bool)

(assert (=> b!1030878 (=> (not res!689163) (not e!582125))))

(assert (=> b!1030878 (= res!689163 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(declare-fun b!1030879 () Bool)

(assert (=> b!1030879 (= e!582125 (arrayContainsKey!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123755 (not res!689162)) b!1030878))

(assert (= (and b!1030878 res!689163) b!1030879))

(assert (=> d!123755 m!950259))

(declare-fun m!950411 () Bool)

(assert (=> b!1030879 m!950411))

(assert (=> b!1030611 d!123755))

(declare-fun d!123757 () Bool)

(assert (=> d!123757 (= (apply!912 lt!454247 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16386 (getValueByKey!582 (toList!6863 lt!454247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30085 () Bool)

(assert (= bs!30085 d!123757))

(assert (=> bs!30085 m!950403))

(assert (=> bs!30085 m!950403))

(declare-fun m!950413 () Bool)

(assert (=> bs!30085 m!950413))

(assert (=> b!1030664 d!123757))

(declare-fun b!1030880 () Bool)

(declare-fun e!582126 () Bool)

(declare-fun e!582127 () Bool)

(assert (=> b!1030880 (= e!582126 e!582127)))

(declare-fun res!689165 () Bool)

(assert (=> b!1030880 (=> (not res!689165) (not e!582127))))

(declare-fun e!582128 () Bool)

(assert (=> b!1030880 (= res!689165 (not e!582128))))

(declare-fun res!689166 () Bool)

(assert (=> b!1030880 (=> (not res!689166) (not e!582128))))

(assert (=> b!1030880 (= res!689166 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43545 () Bool)

(declare-fun call!43548 () Bool)

(declare-fun c!104437 () Bool)

(assert (=> bm!43545 (= call!43548 (arrayNoDuplicates!0 (_keys!11313 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104437 (Cons!21809 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000) Nil!21810) Nil!21810)))))

(declare-fun d!123759 () Bool)

(declare-fun res!689164 () Bool)

(assert (=> d!123759 (=> res!689164 e!582126)))

(assert (=> d!123759 (= res!689164 (bvsge #b00000000000000000000000000000000 (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123759 (= (arrayNoDuplicates!0 (_keys!11313 thiss!1427) #b00000000000000000000000000000000 Nil!21810) e!582126)))

(declare-fun b!1030881 () Bool)

(assert (=> b!1030881 (= e!582128 (contains!5997 Nil!21810 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030882 () Bool)

(declare-fun e!582129 () Bool)

(assert (=> b!1030882 (= e!582129 call!43548)))

(declare-fun b!1030883 () Bool)

(assert (=> b!1030883 (= e!582129 call!43548)))

(declare-fun b!1030884 () Bool)

(assert (=> b!1030884 (= e!582127 e!582129)))

(assert (=> b!1030884 (= c!104437 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123759 (not res!689164)) b!1030880))

(assert (= (and b!1030880 res!689166) b!1030881))

(assert (= (and b!1030880 res!689165) b!1030884))

(assert (= (and b!1030884 c!104437) b!1030882))

(assert (= (and b!1030884 (not c!104437)) b!1030883))

(assert (= (or b!1030882 b!1030883) bm!43545))

(assert (=> b!1030880 m!950065))

(assert (=> b!1030880 m!950065))

(assert (=> b!1030880 m!950067))

(assert (=> bm!43545 m!950065))

(declare-fun m!950415 () Bool)

(assert (=> bm!43545 m!950415))

(assert (=> b!1030881 m!950065))

(assert (=> b!1030881 m!950065))

(declare-fun m!950417 () Bool)

(assert (=> b!1030881 m!950417))

(assert (=> b!1030884 m!950065))

(assert (=> b!1030884 m!950065))

(assert (=> b!1030884 m!950067))

(assert (=> b!1030690 d!123759))

(assert (=> d!123675 d!123695))

(declare-fun d!123761 () Bool)

(declare-fun lt!454364 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!513 (List!21813) (InoxSet (_ BitVec 64)))

(assert (=> d!123761 (= lt!454364 (select (content!513 Nil!21810) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun e!582134 () Bool)

(assert (=> d!123761 (= lt!454364 e!582134)))

(declare-fun res!689171 () Bool)

(assert (=> d!123761 (=> (not res!689171) (not e!582134))))

(assert (=> d!123761 (= res!689171 ((_ is Cons!21809) Nil!21810))))

(assert (=> d!123761 (= (contains!5997 Nil!21810 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) lt!454364)))

(declare-fun b!1030889 () Bool)

(declare-fun e!582135 () Bool)

(assert (=> b!1030889 (= e!582134 e!582135)))

(declare-fun res!689172 () Bool)

(assert (=> b!1030889 (=> res!689172 e!582135)))

(assert (=> b!1030889 (= res!689172 (= (h!23018 Nil!21810) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030890 () Bool)

(assert (=> b!1030890 (= e!582135 (contains!5997 (t!30893 Nil!21810) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(assert (= (and d!123761 res!689171) b!1030889))

(assert (= (and b!1030889 (not res!689172)) b!1030890))

(declare-fun m!950419 () Bool)

(assert (=> d!123761 m!950419))

(assert (=> d!123761 m!950055))

(declare-fun m!950421 () Bool)

(assert (=> d!123761 m!950421))

(assert (=> b!1030890 m!950055))

(declare-fun m!950423 () Bool)

(assert (=> b!1030890 m!950423))

(assert (=> b!1030539 d!123761))

(assert (=> b!1030688 d!123665))

(declare-fun d!123763 () Bool)

(declare-fun e!582136 () Bool)

(assert (=> d!123763 e!582136))

(declare-fun res!689173 () Bool)

(assert (=> d!123763 (=> res!689173 e!582136)))

(declare-fun lt!454365 () Bool)

(assert (=> d!123763 (= res!689173 (not lt!454365))))

(declare-fun lt!454367 () Bool)

(assert (=> d!123763 (= lt!454365 lt!454367)))

(declare-fun lt!454368 () Unit!33620)

(declare-fun e!582137 () Unit!33620)

(assert (=> d!123763 (= lt!454368 e!582137)))

(declare-fun c!104438 () Bool)

(assert (=> d!123763 (= c!104438 lt!454367)))

(assert (=> d!123763 (= lt!454367 (containsKey!563 (toList!6863 lt!454197) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123763 (= (contains!5998 lt!454197 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454365)))

(declare-fun b!1030891 () Bool)

(declare-fun lt!454366 () Unit!33620)

(assert (=> b!1030891 (= e!582137 lt!454366)))

(assert (=> b!1030891 (= lt!454366 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 lt!454197) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030891 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454197) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030892 () Bool)

(declare-fun Unit!33638 () Unit!33620)

(assert (=> b!1030892 (= e!582137 Unit!33638)))

(declare-fun b!1030893 () Bool)

(assert (=> b!1030893 (= e!582136 (isDefined!432 (getValueByKey!582 (toList!6863 lt!454197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123763 c!104438) b!1030891))

(assert (= (and d!123763 (not c!104438)) b!1030892))

(assert (= (and d!123763 (not res!689173)) b!1030893))

(declare-fun m!950425 () Bool)

(assert (=> d!123763 m!950425))

(declare-fun m!950427 () Bool)

(assert (=> b!1030891 m!950427))

(assert (=> b!1030891 m!950407))

(assert (=> b!1030891 m!950407))

(declare-fun m!950429 () Bool)

(assert (=> b!1030891 m!950429))

(assert (=> b!1030893 m!950407))

(assert (=> b!1030893 m!950407))

(assert (=> b!1030893 m!950429))

(assert (=> bm!43522 d!123763))

(declare-fun d!123765 () Bool)

(assert (=> d!123765 (= (apply!912 (+!3123 lt!454194 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))) lt!454189) (apply!912 lt!454194 lt!454189))))

(declare-fun lt!454371 () Unit!33620)

(declare-fun choose!1694 (ListLongMap!13695 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33620)

(assert (=> d!123765 (= lt!454371 (choose!1694 lt!454194 lt!454193 (minValue!5950 thiss!1427) lt!454189))))

(declare-fun e!582140 () Bool)

(assert (=> d!123765 e!582140))

(declare-fun res!689176 () Bool)

(assert (=> d!123765 (=> (not res!689176) (not e!582140))))

(assert (=> d!123765 (= res!689176 (contains!5998 lt!454194 lt!454189))))

(assert (=> d!123765 (= (addApplyDifferent!478 lt!454194 lt!454193 (minValue!5950 thiss!1427) lt!454189) lt!454371)))

(declare-fun b!1030897 () Bool)

(assert (=> b!1030897 (= e!582140 (not (= lt!454189 lt!454193)))))

(assert (= (and d!123765 res!689176) b!1030897))

(assert (=> d!123765 m!950087))

(declare-fun m!950431 () Bool)

(assert (=> d!123765 m!950431))

(declare-fun m!950433 () Bool)

(assert (=> d!123765 m!950433))

(assert (=> d!123765 m!950087))

(assert (=> d!123765 m!950099))

(assert (=> d!123765 m!950079))

(assert (=> b!1030600 d!123765))

(declare-fun d!123767 () Bool)

(declare-fun e!582141 () Bool)

(assert (=> d!123767 e!582141))

(declare-fun res!689178 () Bool)

(assert (=> d!123767 (=> (not res!689178) (not e!582141))))

(declare-fun lt!454374 () ListLongMap!13695)

(assert (=> d!123767 (= res!689178 (contains!5998 lt!454374 (_1!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))))))

(declare-fun lt!454373 () List!21812)

(assert (=> d!123767 (= lt!454374 (ListLongMap!13696 lt!454373))))

(declare-fun lt!454372 () Unit!33620)

(declare-fun lt!454375 () Unit!33620)

(assert (=> d!123767 (= lt!454372 lt!454375)))

(assert (=> d!123767 (= (getValueByKey!582 lt!454373 (_1!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))))))

(assert (=> d!123767 (= lt!454375 (lemmaContainsTupThenGetReturnValue!278 lt!454373 (_1!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))))))

(assert (=> d!123767 (= lt!454373 (insertStrictlySorted!371 (toList!6863 lt!454195) (_1!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))))))

(assert (=> d!123767 (= (+!3123 lt!454195 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))) lt!454374)))

(declare-fun b!1030898 () Bool)

(declare-fun res!689177 () Bool)

(assert (=> b!1030898 (=> (not res!689177) (not e!582141))))

(assert (=> b!1030898 (= res!689177 (= (getValueByKey!582 (toList!6863 lt!454374) (_1!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))))))))

(declare-fun b!1030899 () Bool)

(assert (=> b!1030899 (= e!582141 (contains!5999 (toList!6863 lt!454374) (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))))))

(assert (= (and d!123767 res!689178) b!1030898))

(assert (= (and b!1030898 res!689177) b!1030899))

(declare-fun m!950435 () Bool)

(assert (=> d!123767 m!950435))

(declare-fun m!950437 () Bool)

(assert (=> d!123767 m!950437))

(declare-fun m!950439 () Bool)

(assert (=> d!123767 m!950439))

(declare-fun m!950441 () Bool)

(assert (=> d!123767 m!950441))

(declare-fun m!950443 () Bool)

(assert (=> b!1030898 m!950443))

(declare-fun m!950445 () Bool)

(assert (=> b!1030899 m!950445))

(assert (=> b!1030600 d!123767))

(declare-fun d!123769 () Bool)

(declare-fun e!582142 () Bool)

(assert (=> d!123769 e!582142))

(declare-fun res!689180 () Bool)

(assert (=> d!123769 (=> (not res!689180) (not e!582142))))

(declare-fun lt!454378 () ListLongMap!13695)

(assert (=> d!123769 (= res!689180 (contains!5998 lt!454378 (_1!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))))))

(declare-fun lt!454377 () List!21812)

(assert (=> d!123769 (= lt!454378 (ListLongMap!13696 lt!454377))))

(declare-fun lt!454376 () Unit!33620)

(declare-fun lt!454379 () Unit!33620)

(assert (=> d!123769 (= lt!454376 lt!454379)))

(assert (=> d!123769 (= (getValueByKey!582 lt!454377 (_1!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))))))

(assert (=> d!123769 (= lt!454379 (lemmaContainsTupThenGetReturnValue!278 lt!454377 (_1!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))))))

(assert (=> d!123769 (= lt!454377 (insertStrictlySorted!371 (toList!6863 lt!454194) (_1!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))))))

(assert (=> d!123769 (= (+!3123 lt!454194 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))) lt!454378)))

(declare-fun b!1030900 () Bool)

(declare-fun res!689179 () Bool)

(assert (=> b!1030900 (=> (not res!689179) (not e!582142))))

(assert (=> b!1030900 (= res!689179 (= (getValueByKey!582 (toList!6863 lt!454378) (_1!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))))))))

(declare-fun b!1030901 () Bool)

(assert (=> b!1030901 (= e!582142 (contains!5999 (toList!6863 lt!454378) (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))))))

(assert (= (and d!123769 res!689180) b!1030900))

(assert (= (and b!1030900 res!689179) b!1030901))

(declare-fun m!950447 () Bool)

(assert (=> d!123769 m!950447))

(declare-fun m!950449 () Bool)

(assert (=> d!123769 m!950449))

(declare-fun m!950451 () Bool)

(assert (=> d!123769 m!950451))

(declare-fun m!950453 () Bool)

(assert (=> d!123769 m!950453))

(declare-fun m!950455 () Bool)

(assert (=> b!1030900 m!950455))

(declare-fun m!950457 () Bool)

(assert (=> b!1030901 m!950457))

(assert (=> b!1030600 d!123769))

(declare-fun d!123771 () Bool)

(assert (=> d!123771 (= (apply!912 lt!454199 lt!454205) (get!16386 (getValueByKey!582 (toList!6863 lt!454199) lt!454205)))))

(declare-fun bs!30086 () Bool)

(assert (= bs!30086 d!123771))

(declare-fun m!950459 () Bool)

(assert (=> bs!30086 m!950459))

(assert (=> bs!30086 m!950459))

(declare-fun m!950461 () Bool)

(assert (=> bs!30086 m!950461))

(assert (=> b!1030600 d!123771))

(declare-fun d!123773 () Bool)

(assert (=> d!123773 (= (apply!912 (+!3123 lt!454195 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))) lt!454200) (apply!912 lt!454195 lt!454200))))

(declare-fun lt!454380 () Unit!33620)

(assert (=> d!123773 (= lt!454380 (choose!1694 lt!454195 lt!454207 (minValue!5950 thiss!1427) lt!454200))))

(declare-fun e!582143 () Bool)

(assert (=> d!123773 e!582143))

(declare-fun res!689181 () Bool)

(assert (=> d!123773 (=> (not res!689181) (not e!582143))))

(assert (=> d!123773 (= res!689181 (contains!5998 lt!454195 lt!454200))))

(assert (=> d!123773 (= (addApplyDifferent!478 lt!454195 lt!454207 (minValue!5950 thiss!1427) lt!454200) lt!454380)))

(declare-fun b!1030902 () Bool)

(assert (=> b!1030902 (= e!582143 (not (= lt!454200 lt!454207)))))

(assert (= (and d!123773 res!689181) b!1030902))

(assert (=> d!123773 m!950075))

(declare-fun m!950463 () Bool)

(assert (=> d!123773 m!950463))

(declare-fun m!950465 () Bool)

(assert (=> d!123773 m!950465))

(assert (=> d!123773 m!950075))

(assert (=> d!123773 m!950077))

(assert (=> d!123773 m!950091))

(assert (=> b!1030600 d!123773))

(declare-fun d!123775 () Bool)

(assert (=> d!123775 (= (apply!912 lt!454195 lt!454200) (get!16386 (getValueByKey!582 (toList!6863 lt!454195) lt!454200)))))

(declare-fun bs!30087 () Bool)

(assert (= bs!30087 d!123775))

(declare-fun m!950467 () Bool)

(assert (=> bs!30087 m!950467))

(assert (=> bs!30087 m!950467))

(declare-fun m!950469 () Bool)

(assert (=> bs!30087 m!950469))

(assert (=> b!1030600 d!123775))

(declare-fun d!123777 () Bool)

(declare-fun e!582144 () Bool)

(assert (=> d!123777 e!582144))

(declare-fun res!689183 () Bool)

(assert (=> d!123777 (=> (not res!689183) (not e!582144))))

(declare-fun lt!454383 () ListLongMap!13695)

(assert (=> d!123777 (= res!689183 (contains!5998 lt!454383 (_1!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!454382 () List!21812)

(assert (=> d!123777 (= lt!454383 (ListLongMap!13696 lt!454382))))

(declare-fun lt!454381 () Unit!33620)

(declare-fun lt!454384 () Unit!33620)

(assert (=> d!123777 (= lt!454381 lt!454384)))

(assert (=> d!123777 (= (getValueByKey!582 lt!454382 (_1!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123777 (= lt!454384 (lemmaContainsTupThenGetReturnValue!278 lt!454382 (_1!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123777 (= lt!454382 (insertStrictlySorted!371 (toList!6863 lt!454199) (_1!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123777 (= (+!3123 lt!454199 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))) lt!454383)))

(declare-fun b!1030903 () Bool)

(declare-fun res!689182 () Bool)

(assert (=> b!1030903 (=> (not res!689182) (not e!582144))))

(assert (=> b!1030903 (= res!689182 (= (getValueByKey!582 (toList!6863 lt!454383) (_1!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1030904 () Bool)

(assert (=> b!1030904 (= e!582144 (contains!5999 (toList!6863 lt!454383) (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123777 res!689183) b!1030903))

(assert (= (and b!1030903 res!689182) b!1030904))

(declare-fun m!950471 () Bool)

(assert (=> d!123777 m!950471))

(declare-fun m!950473 () Bool)

(assert (=> d!123777 m!950473))

(declare-fun m!950475 () Bool)

(assert (=> d!123777 m!950475))

(declare-fun m!950477 () Bool)

(assert (=> d!123777 m!950477))

(declare-fun m!950479 () Bool)

(assert (=> b!1030903 m!950479))

(declare-fun m!950481 () Bool)

(assert (=> b!1030904 m!950481))

(assert (=> b!1030600 d!123777))

(declare-fun d!123779 () Bool)

(declare-fun e!582145 () Bool)

(assert (=> d!123779 e!582145))

(declare-fun res!689184 () Bool)

(assert (=> d!123779 (=> res!689184 e!582145)))

(declare-fun lt!454385 () Bool)

(assert (=> d!123779 (= res!689184 (not lt!454385))))

(declare-fun lt!454387 () Bool)

(assert (=> d!123779 (= lt!454385 lt!454387)))

(declare-fun lt!454388 () Unit!33620)

(declare-fun e!582146 () Unit!33620)

(assert (=> d!123779 (= lt!454388 e!582146)))

(declare-fun c!104439 () Bool)

(assert (=> d!123779 (= c!104439 lt!454387)))

(assert (=> d!123779 (= lt!454387 (containsKey!563 (toList!6863 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))) lt!454203))))

(assert (=> d!123779 (= (contains!5998 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))) lt!454203) lt!454385)))

(declare-fun b!1030905 () Bool)

(declare-fun lt!454386 () Unit!33620)

(assert (=> b!1030905 (= e!582146 lt!454386)))

(assert (=> b!1030905 (= lt!454386 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))) lt!454203))))

(assert (=> b!1030905 (isDefined!432 (getValueByKey!582 (toList!6863 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))) lt!454203))))

(declare-fun b!1030906 () Bool)

(declare-fun Unit!33639 () Unit!33620)

(assert (=> b!1030906 (= e!582146 Unit!33639)))

(declare-fun b!1030907 () Bool)

(assert (=> b!1030907 (= e!582145 (isDefined!432 (getValueByKey!582 (toList!6863 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))) lt!454203)))))

(assert (= (and d!123779 c!104439) b!1030905))

(assert (= (and d!123779 (not c!104439)) b!1030906))

(assert (= (and d!123779 (not res!689184)) b!1030907))

(declare-fun m!950483 () Bool)

(assert (=> d!123779 m!950483))

(declare-fun m!950485 () Bool)

(assert (=> b!1030905 m!950485))

(declare-fun m!950487 () Bool)

(assert (=> b!1030905 m!950487))

(assert (=> b!1030905 m!950487))

(declare-fun m!950489 () Bool)

(assert (=> b!1030905 m!950489))

(assert (=> b!1030907 m!950487))

(assert (=> b!1030907 m!950487))

(assert (=> b!1030907 m!950489))

(assert (=> b!1030600 d!123779))

(declare-fun d!123781 () Bool)

(assert (=> d!123781 (= (apply!912 lt!454194 lt!454189) (get!16386 (getValueByKey!582 (toList!6863 lt!454194) lt!454189)))))

(declare-fun bs!30088 () Bool)

(assert (= bs!30088 d!123781))

(declare-fun m!950491 () Bool)

(assert (=> bs!30088 m!950491))

(assert (=> bs!30088 m!950491))

(declare-fun m!950493 () Bool)

(assert (=> bs!30088 m!950493))

(assert (=> b!1030600 d!123781))

(declare-fun d!123783 () Bool)

(assert (=> d!123783 (contains!5998 (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))) lt!454203)))

(declare-fun lt!454391 () Unit!33620)

(declare-fun choose!1695 (ListLongMap!13695 (_ BitVec 64) V!37291 (_ BitVec 64)) Unit!33620)

(assert (=> d!123783 (= lt!454391 (choose!1695 lt!454188 lt!454202 (zeroValue!5950 thiss!1427) lt!454203))))

(assert (=> d!123783 (contains!5998 lt!454188 lt!454203)))

(assert (=> d!123783 (= (addStillContains!622 lt!454188 lt!454202 (zeroValue!5950 thiss!1427) lt!454203) lt!454391)))

(declare-fun bs!30089 () Bool)

(assert (= bs!30089 d!123783))

(assert (=> bs!30089 m!950083))

(assert (=> bs!30089 m!950083))

(assert (=> bs!30089 m!950085))

(declare-fun m!950495 () Bool)

(assert (=> bs!30089 m!950495))

(declare-fun m!950497 () Bool)

(assert (=> bs!30089 m!950497))

(assert (=> b!1030600 d!123783))

(declare-fun d!123785 () Bool)

(declare-fun e!582147 () Bool)

(assert (=> d!123785 e!582147))

(declare-fun res!689186 () Bool)

(assert (=> d!123785 (=> (not res!689186) (not e!582147))))

(declare-fun lt!454394 () ListLongMap!13695)

(assert (=> d!123785 (= res!689186 (contains!5998 lt!454394 (_1!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!454393 () List!21812)

(assert (=> d!123785 (= lt!454394 (ListLongMap!13696 lt!454393))))

(declare-fun lt!454392 () Unit!33620)

(declare-fun lt!454395 () Unit!33620)

(assert (=> d!123785 (= lt!454392 lt!454395)))

(assert (=> d!123785 (= (getValueByKey!582 lt!454393 (_1!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123785 (= lt!454395 (lemmaContainsTupThenGetReturnValue!278 lt!454393 (_1!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123785 (= lt!454393 (insertStrictlySorted!371 (toList!6863 lt!454188) (_1!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123785 (= (+!3123 lt!454188 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))) lt!454394)))

(declare-fun b!1030909 () Bool)

(declare-fun res!689185 () Bool)

(assert (=> b!1030909 (=> (not res!689185) (not e!582147))))

(assert (=> b!1030909 (= res!689185 (= (getValueByKey!582 (toList!6863 lt!454394) (_1!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1030910 () Bool)

(assert (=> b!1030910 (= e!582147 (contains!5999 (toList!6863 lt!454394) (tuple2!15573 lt!454202 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123785 res!689186) b!1030909))

(assert (= (and b!1030909 res!689185) b!1030910))

(declare-fun m!950499 () Bool)

(assert (=> d!123785 m!950499))

(declare-fun m!950501 () Bool)

(assert (=> d!123785 m!950501))

(declare-fun m!950503 () Bool)

(assert (=> d!123785 m!950503))

(declare-fun m!950505 () Bool)

(assert (=> d!123785 m!950505))

(declare-fun m!950507 () Bool)

(assert (=> b!1030909 m!950507))

(declare-fun m!950509 () Bool)

(assert (=> b!1030910 m!950509))

(assert (=> b!1030600 d!123785))

(declare-fun d!123787 () Bool)

(assert (=> d!123787 (= (apply!912 (+!3123 lt!454199 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))) lt!454205) (get!16386 (getValueByKey!582 (toList!6863 (+!3123 lt!454199 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427)))) lt!454205)))))

(declare-fun bs!30090 () Bool)

(assert (= bs!30090 d!123787))

(declare-fun m!950511 () Bool)

(assert (=> bs!30090 m!950511))

(assert (=> bs!30090 m!950511))

(declare-fun m!950513 () Bool)

(assert (=> bs!30090 m!950513))

(assert (=> b!1030600 d!123787))

(assert (=> b!1030600 d!123745))

(declare-fun d!123789 () Bool)

(assert (=> d!123789 (= (apply!912 (+!3123 lt!454195 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427))) lt!454200) (get!16386 (getValueByKey!582 (toList!6863 (+!3123 lt!454195 (tuple2!15573 lt!454207 (minValue!5950 thiss!1427)))) lt!454200)))))

(declare-fun bs!30091 () Bool)

(assert (= bs!30091 d!123789))

(declare-fun m!950515 () Bool)

(assert (=> bs!30091 m!950515))

(assert (=> bs!30091 m!950515))

(declare-fun m!950517 () Bool)

(assert (=> bs!30091 m!950517))

(assert (=> b!1030600 d!123789))

(declare-fun d!123791 () Bool)

(assert (=> d!123791 (= (apply!912 (+!3123 lt!454199 (tuple2!15573 lt!454204 (zeroValue!5950 thiss!1427))) lt!454205) (apply!912 lt!454199 lt!454205))))

(declare-fun lt!454396 () Unit!33620)

(assert (=> d!123791 (= lt!454396 (choose!1694 lt!454199 lt!454204 (zeroValue!5950 thiss!1427) lt!454205))))

(declare-fun e!582148 () Bool)

(assert (=> d!123791 e!582148))

(declare-fun res!689187 () Bool)

(assert (=> d!123791 (=> (not res!689187) (not e!582148))))

(assert (=> d!123791 (= res!689187 (contains!5998 lt!454199 lt!454205))))

(assert (=> d!123791 (= (addApplyDifferent!478 lt!454199 lt!454204 (zeroValue!5950 thiss!1427) lt!454205) lt!454396)))

(declare-fun b!1030911 () Bool)

(assert (=> b!1030911 (= e!582148 (not (= lt!454205 lt!454204)))))

(assert (= (and d!123791 res!689187) b!1030911))

(assert (=> d!123791 m!950103))

(declare-fun m!950519 () Bool)

(assert (=> d!123791 m!950519))

(declare-fun m!950521 () Bool)

(assert (=> d!123791 m!950521))

(assert (=> d!123791 m!950103))

(assert (=> d!123791 m!950105))

(assert (=> d!123791 m!950095))

(assert (=> b!1030600 d!123791))

(declare-fun d!123793 () Bool)

(assert (=> d!123793 (= (apply!912 (+!3123 lt!454194 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427))) lt!454189) (get!16386 (getValueByKey!582 (toList!6863 (+!3123 lt!454194 (tuple2!15573 lt!454193 (minValue!5950 thiss!1427)))) lt!454189)))))

(declare-fun bs!30092 () Bool)

(assert (= bs!30092 d!123793))

(declare-fun m!950523 () Bool)

(assert (=> bs!30092 m!950523))

(assert (=> bs!30092 m!950523))

(declare-fun m!950525 () Bool)

(assert (=> bs!30092 m!950525))

(assert (=> b!1030600 d!123793))

(declare-fun d!123795 () Bool)

(assert (=> d!123795 (contains!5998 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))) lt!454253)))

(declare-fun lt!454397 () Unit!33620)

(assert (=> d!123795 (= lt!454397 (choose!1695 lt!454238 lt!454252 (zeroValue!5950 thiss!1427) lt!454253))))

(assert (=> d!123795 (contains!5998 lt!454238 lt!454253)))

(assert (=> d!123795 (= (addStillContains!622 lt!454238 lt!454252 (zeroValue!5950 thiss!1427) lt!454253) lt!454397)))

(declare-fun bs!30093 () Bool)

(assert (= bs!30093 d!123795))

(assert (=> bs!30093 m!950175))

(assert (=> bs!30093 m!950175))

(assert (=> bs!30093 m!950177))

(declare-fun m!950527 () Bool)

(assert (=> bs!30093 m!950527))

(declare-fun m!950529 () Bool)

(assert (=> bs!30093 m!950529))

(assert (=> b!1030676 d!123795))

(declare-fun d!123797 () Bool)

(assert (=> d!123797 (= (apply!912 lt!454244 lt!454239) (get!16386 (getValueByKey!582 (toList!6863 lt!454244) lt!454239)))))

(declare-fun bs!30094 () Bool)

(assert (= bs!30094 d!123797))

(declare-fun m!950531 () Bool)

(assert (=> bs!30094 m!950531))

(assert (=> bs!30094 m!950531))

(declare-fun m!950533 () Bool)

(assert (=> bs!30094 m!950533))

(assert (=> b!1030676 d!123797))

(assert (=> b!1030676 d!123731))

(declare-fun d!123799 () Bool)

(assert (=> d!123799 (= (apply!912 (+!3123 lt!454244 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))) lt!454239) (get!16386 (getValueByKey!582 (toList!6863 (+!3123 lt!454244 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))) lt!454239)))))

(declare-fun bs!30095 () Bool)

(assert (= bs!30095 d!123799))

(declare-fun m!950535 () Bool)

(assert (=> bs!30095 m!950535))

(assert (=> bs!30095 m!950535))

(declare-fun m!950537 () Bool)

(assert (=> bs!30095 m!950537))

(assert (=> b!1030676 d!123799))

(declare-fun d!123801 () Bool)

(assert (=> d!123801 (= (apply!912 (+!3123 lt!454249 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))) lt!454255) (apply!912 lt!454249 lt!454255))))

(declare-fun lt!454398 () Unit!33620)

(assert (=> d!123801 (= lt!454398 (choose!1694 lt!454249 lt!454254 (zeroValue!5950 thiss!1427) lt!454255))))

(declare-fun e!582149 () Bool)

(assert (=> d!123801 e!582149))

(declare-fun res!689188 () Bool)

(assert (=> d!123801 (=> (not res!689188) (not e!582149))))

(assert (=> d!123801 (= res!689188 (contains!5998 lt!454249 lt!454255))))

(assert (=> d!123801 (= (addApplyDifferent!478 lt!454249 lt!454254 (zeroValue!5950 thiss!1427) lt!454255) lt!454398)))

(declare-fun b!1030912 () Bool)

(assert (=> b!1030912 (= e!582149 (not (= lt!454255 lt!454254)))))

(assert (= (and d!123801 res!689188) b!1030912))

(assert (=> d!123801 m!950195))

(declare-fun m!950539 () Bool)

(assert (=> d!123801 m!950539))

(declare-fun m!950541 () Bool)

(assert (=> d!123801 m!950541))

(assert (=> d!123801 m!950195))

(assert (=> d!123801 m!950197))

(assert (=> d!123801 m!950187))

(assert (=> b!1030676 d!123801))

(declare-fun d!123803 () Bool)

(assert (=> d!123803 (= (apply!912 (+!3123 lt!454245 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))) lt!454250) (get!16386 (getValueByKey!582 (toList!6863 (+!3123 lt!454245 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))) lt!454250)))))

(declare-fun bs!30096 () Bool)

(assert (= bs!30096 d!123803))

(declare-fun m!950543 () Bool)

(assert (=> bs!30096 m!950543))

(assert (=> bs!30096 m!950543))

(declare-fun m!950545 () Bool)

(assert (=> bs!30096 m!950545))

(assert (=> b!1030676 d!123803))

(declare-fun d!123805 () Bool)

(assert (=> d!123805 (= (apply!912 lt!454249 lt!454255) (get!16386 (getValueByKey!582 (toList!6863 lt!454249) lt!454255)))))

(declare-fun bs!30097 () Bool)

(assert (= bs!30097 d!123805))

(declare-fun m!950547 () Bool)

(assert (=> bs!30097 m!950547))

(assert (=> bs!30097 m!950547))

(declare-fun m!950549 () Bool)

(assert (=> bs!30097 m!950549))

(assert (=> b!1030676 d!123805))

(declare-fun d!123807 () Bool)

(declare-fun e!582150 () Bool)

(assert (=> d!123807 e!582150))

(declare-fun res!689190 () Bool)

(assert (=> d!123807 (=> (not res!689190) (not e!582150))))

(declare-fun lt!454401 () ListLongMap!13695)

(assert (=> d!123807 (= res!689190 (contains!5998 lt!454401 (_1!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!454400 () List!21812)

(assert (=> d!123807 (= lt!454401 (ListLongMap!13696 lt!454400))))

(declare-fun lt!454399 () Unit!33620)

(declare-fun lt!454402 () Unit!33620)

(assert (=> d!123807 (= lt!454399 lt!454402)))

(assert (=> d!123807 (= (getValueByKey!582 lt!454400 (_1!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123807 (= lt!454402 (lemmaContainsTupThenGetReturnValue!278 lt!454400 (_1!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123807 (= lt!454400 (insertStrictlySorted!371 (toList!6863 lt!454249) (_1!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123807 (= (+!3123 lt!454249 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))) lt!454401)))

(declare-fun b!1030913 () Bool)

(declare-fun res!689189 () Bool)

(assert (=> b!1030913 (=> (not res!689189) (not e!582150))))

(assert (=> b!1030913 (= res!689189 (= (getValueByKey!582 (toList!6863 lt!454401) (_1!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1030914 () Bool)

(assert (=> b!1030914 (= e!582150 (contains!5999 (toList!6863 lt!454401) (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123807 res!689190) b!1030913))

(assert (= (and b!1030913 res!689189) b!1030914))

(declare-fun m!950551 () Bool)

(assert (=> d!123807 m!950551))

(declare-fun m!950553 () Bool)

(assert (=> d!123807 m!950553))

(declare-fun m!950555 () Bool)

(assert (=> d!123807 m!950555))

(declare-fun m!950557 () Bool)

(assert (=> d!123807 m!950557))

(declare-fun m!950559 () Bool)

(assert (=> b!1030913 m!950559))

(declare-fun m!950561 () Bool)

(assert (=> b!1030914 m!950561))

(assert (=> b!1030676 d!123807))

(declare-fun d!123809 () Bool)

(assert (=> d!123809 (= (apply!912 (+!3123 lt!454245 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))) lt!454250) (apply!912 lt!454245 lt!454250))))

(declare-fun lt!454403 () Unit!33620)

(assert (=> d!123809 (= lt!454403 (choose!1694 lt!454245 lt!454257 (minValue!5950 thiss!1427) lt!454250))))

(declare-fun e!582151 () Bool)

(assert (=> d!123809 e!582151))

(declare-fun res!689191 () Bool)

(assert (=> d!123809 (=> (not res!689191) (not e!582151))))

(assert (=> d!123809 (= res!689191 (contains!5998 lt!454245 lt!454250))))

(assert (=> d!123809 (= (addApplyDifferent!478 lt!454245 lt!454257 (minValue!5950 thiss!1427) lt!454250) lt!454403)))

(declare-fun b!1030915 () Bool)

(assert (=> b!1030915 (= e!582151 (not (= lt!454250 lt!454257)))))

(assert (= (and d!123809 res!689191) b!1030915))

(assert (=> d!123809 m!950167))

(declare-fun m!950563 () Bool)

(assert (=> d!123809 m!950563))

(declare-fun m!950565 () Bool)

(assert (=> d!123809 m!950565))

(assert (=> d!123809 m!950167))

(assert (=> d!123809 m!950169))

(assert (=> d!123809 m!950183))

(assert (=> b!1030676 d!123809))

(declare-fun d!123811 () Bool)

(declare-fun e!582152 () Bool)

(assert (=> d!123811 e!582152))

(declare-fun res!689193 () Bool)

(assert (=> d!123811 (=> (not res!689193) (not e!582152))))

(declare-fun lt!454406 () ListLongMap!13695)

(assert (=> d!123811 (= res!689193 (contains!5998 lt!454406 (_1!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))))))

(declare-fun lt!454405 () List!21812)

(assert (=> d!123811 (= lt!454406 (ListLongMap!13696 lt!454405))))

(declare-fun lt!454404 () Unit!33620)

(declare-fun lt!454407 () Unit!33620)

(assert (=> d!123811 (= lt!454404 lt!454407)))

(assert (=> d!123811 (= (getValueByKey!582 lt!454405 (_1!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))))))

(assert (=> d!123811 (= lt!454407 (lemmaContainsTupThenGetReturnValue!278 lt!454405 (_1!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))))))

(assert (=> d!123811 (= lt!454405 (insertStrictlySorted!371 (toList!6863 lt!454244) (_1!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))))))

(assert (=> d!123811 (= (+!3123 lt!454244 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))) lt!454406)))

(declare-fun b!1030916 () Bool)

(declare-fun res!689192 () Bool)

(assert (=> b!1030916 (=> (not res!689192) (not e!582152))))

(assert (=> b!1030916 (= res!689192 (= (getValueByKey!582 (toList!6863 lt!454406) (_1!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))))))))

(declare-fun b!1030917 () Bool)

(assert (=> b!1030917 (= e!582152 (contains!5999 (toList!6863 lt!454406) (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))))))

(assert (= (and d!123811 res!689193) b!1030916))

(assert (= (and b!1030916 res!689192) b!1030917))

(declare-fun m!950567 () Bool)

(assert (=> d!123811 m!950567))

(declare-fun m!950569 () Bool)

(assert (=> d!123811 m!950569))

(declare-fun m!950571 () Bool)

(assert (=> d!123811 m!950571))

(declare-fun m!950573 () Bool)

(assert (=> d!123811 m!950573))

(declare-fun m!950575 () Bool)

(assert (=> b!1030916 m!950575))

(declare-fun m!950577 () Bool)

(assert (=> b!1030917 m!950577))

(assert (=> b!1030676 d!123811))

(declare-fun d!123813 () Bool)

(declare-fun e!582153 () Bool)

(assert (=> d!123813 e!582153))

(declare-fun res!689194 () Bool)

(assert (=> d!123813 (=> res!689194 e!582153)))

(declare-fun lt!454408 () Bool)

(assert (=> d!123813 (= res!689194 (not lt!454408))))

(declare-fun lt!454410 () Bool)

(assert (=> d!123813 (= lt!454408 lt!454410)))

(declare-fun lt!454411 () Unit!33620)

(declare-fun e!582154 () Unit!33620)

(assert (=> d!123813 (= lt!454411 e!582154)))

(declare-fun c!104440 () Bool)

(assert (=> d!123813 (= c!104440 lt!454410)))

(assert (=> d!123813 (= lt!454410 (containsKey!563 (toList!6863 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))) lt!454253))))

(assert (=> d!123813 (= (contains!5998 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))) lt!454253) lt!454408)))

(declare-fun b!1030918 () Bool)

(declare-fun lt!454409 () Unit!33620)

(assert (=> b!1030918 (= e!582154 lt!454409)))

(assert (=> b!1030918 (= lt!454409 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6863 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))) lt!454253))))

(assert (=> b!1030918 (isDefined!432 (getValueByKey!582 (toList!6863 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))) lt!454253))))

(declare-fun b!1030919 () Bool)

(declare-fun Unit!33640 () Unit!33620)

(assert (=> b!1030919 (= e!582154 Unit!33640)))

(declare-fun b!1030920 () Bool)

(assert (=> b!1030920 (= e!582153 (isDefined!432 (getValueByKey!582 (toList!6863 (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))) lt!454253)))))

(assert (= (and d!123813 c!104440) b!1030918))

(assert (= (and d!123813 (not c!104440)) b!1030919))

(assert (= (and d!123813 (not res!689194)) b!1030920))

(declare-fun m!950579 () Bool)

(assert (=> d!123813 m!950579))

(declare-fun m!950581 () Bool)

(assert (=> b!1030918 m!950581))

(declare-fun m!950583 () Bool)

(assert (=> b!1030918 m!950583))

(assert (=> b!1030918 m!950583))

(declare-fun m!950585 () Bool)

(assert (=> b!1030918 m!950585))

(assert (=> b!1030920 m!950583))

(assert (=> b!1030920 m!950583))

(assert (=> b!1030920 m!950585))

(assert (=> b!1030676 d!123813))

(declare-fun d!123815 () Bool)

(assert (=> d!123815 (= (apply!912 (+!3123 lt!454244 (tuple2!15573 lt!454243 (minValue!5950 thiss!1427))) lt!454239) (apply!912 lt!454244 lt!454239))))

(declare-fun lt!454412 () Unit!33620)

(assert (=> d!123815 (= lt!454412 (choose!1694 lt!454244 lt!454243 (minValue!5950 thiss!1427) lt!454239))))

(declare-fun e!582155 () Bool)

(assert (=> d!123815 e!582155))

(declare-fun res!689195 () Bool)

(assert (=> d!123815 (=> (not res!689195) (not e!582155))))

(assert (=> d!123815 (= res!689195 (contains!5998 lt!454244 lt!454239))))

(assert (=> d!123815 (= (addApplyDifferent!478 lt!454244 lt!454243 (minValue!5950 thiss!1427) lt!454239) lt!454412)))

(declare-fun b!1030921 () Bool)

(assert (=> b!1030921 (= e!582155 (not (= lt!454239 lt!454243)))))

(assert (= (and d!123815 res!689195) b!1030921))

(assert (=> d!123815 m!950179))

(declare-fun m!950587 () Bool)

(assert (=> d!123815 m!950587))

(declare-fun m!950589 () Bool)

(assert (=> d!123815 m!950589))

(assert (=> d!123815 m!950179))

(assert (=> d!123815 m!950191))

(assert (=> d!123815 m!950171))

(assert (=> b!1030676 d!123815))

(declare-fun d!123817 () Bool)

(assert (=> d!123817 (= (apply!912 lt!454245 lt!454250) (get!16386 (getValueByKey!582 (toList!6863 lt!454245) lt!454250)))))

(declare-fun bs!30098 () Bool)

(assert (= bs!30098 d!123817))

(declare-fun m!950591 () Bool)

(assert (=> bs!30098 m!950591))

(assert (=> bs!30098 m!950591))

(declare-fun m!950593 () Bool)

(assert (=> bs!30098 m!950593))

(assert (=> b!1030676 d!123817))

(declare-fun d!123819 () Bool)

(assert (=> d!123819 (= (apply!912 (+!3123 lt!454249 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427))) lt!454255) (get!16386 (getValueByKey!582 (toList!6863 (+!3123 lt!454249 (tuple2!15573 lt!454254 (zeroValue!5950 thiss!1427)))) lt!454255)))))

(declare-fun bs!30099 () Bool)

(assert (= bs!30099 d!123819))

(declare-fun m!950595 () Bool)

(assert (=> bs!30099 m!950595))

(assert (=> bs!30099 m!950595))

(declare-fun m!950597 () Bool)

(assert (=> bs!30099 m!950597))

(assert (=> b!1030676 d!123819))

(declare-fun d!123821 () Bool)

(declare-fun e!582156 () Bool)

(assert (=> d!123821 e!582156))

(declare-fun res!689197 () Bool)

(assert (=> d!123821 (=> (not res!689197) (not e!582156))))

(declare-fun lt!454415 () ListLongMap!13695)

(assert (=> d!123821 (= res!689197 (contains!5998 lt!454415 (_1!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))))))

(declare-fun lt!454414 () List!21812)

(assert (=> d!123821 (= lt!454415 (ListLongMap!13696 lt!454414))))

(declare-fun lt!454413 () Unit!33620)

(declare-fun lt!454416 () Unit!33620)

(assert (=> d!123821 (= lt!454413 lt!454416)))

(assert (=> d!123821 (= (getValueByKey!582 lt!454414 (_1!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))))))

(assert (=> d!123821 (= lt!454416 (lemmaContainsTupThenGetReturnValue!278 lt!454414 (_1!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))))))

(assert (=> d!123821 (= lt!454414 (insertStrictlySorted!371 (toList!6863 lt!454245) (_1!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))))))

(assert (=> d!123821 (= (+!3123 lt!454245 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))) lt!454415)))

(declare-fun b!1030922 () Bool)

(declare-fun res!689196 () Bool)

(assert (=> b!1030922 (=> (not res!689196) (not e!582156))))

(assert (=> b!1030922 (= res!689196 (= (getValueByKey!582 (toList!6863 lt!454415) (_1!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))))))))

(declare-fun b!1030923 () Bool)

(assert (=> b!1030923 (= e!582156 (contains!5999 (toList!6863 lt!454415) (tuple2!15573 lt!454257 (minValue!5950 thiss!1427))))))

(assert (= (and d!123821 res!689197) b!1030922))

(assert (= (and b!1030922 res!689196) b!1030923))

(declare-fun m!950599 () Bool)

(assert (=> d!123821 m!950599))

(declare-fun m!950601 () Bool)

(assert (=> d!123821 m!950601))

(declare-fun m!950603 () Bool)

(assert (=> d!123821 m!950603))

(declare-fun m!950605 () Bool)

(assert (=> d!123821 m!950605))

(declare-fun m!950607 () Bool)

(assert (=> b!1030922 m!950607))

(declare-fun m!950609 () Bool)

(assert (=> b!1030923 m!950609))

(assert (=> b!1030676 d!123821))

(declare-fun d!123823 () Bool)

(declare-fun e!582157 () Bool)

(assert (=> d!123823 e!582157))

(declare-fun res!689199 () Bool)

(assert (=> d!123823 (=> (not res!689199) (not e!582157))))

(declare-fun lt!454419 () ListLongMap!13695)

(assert (=> d!123823 (= res!689199 (contains!5998 lt!454419 (_1!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))))))

(declare-fun lt!454418 () List!21812)

(assert (=> d!123823 (= lt!454419 (ListLongMap!13696 lt!454418))))

(declare-fun lt!454417 () Unit!33620)

(declare-fun lt!454420 () Unit!33620)

(assert (=> d!123823 (= lt!454417 lt!454420)))

(assert (=> d!123823 (= (getValueByKey!582 lt!454418 (_1!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123823 (= lt!454420 (lemmaContainsTupThenGetReturnValue!278 lt!454418 (_1!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123823 (= lt!454418 (insertStrictlySorted!371 (toList!6863 lt!454238) (_1!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))))))

(assert (=> d!123823 (= (+!3123 lt!454238 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))) lt!454419)))

(declare-fun b!1030924 () Bool)

(declare-fun res!689198 () Bool)

(assert (=> b!1030924 (=> (not res!689198) (not e!582157))))

(assert (=> b!1030924 (= res!689198 (= (getValueByKey!582 (toList!6863 lt!454419) (_1!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))))))))

(declare-fun b!1030925 () Bool)

(assert (=> b!1030925 (= e!582157 (contains!5999 (toList!6863 lt!454419) (tuple2!15573 lt!454252 (zeroValue!5950 thiss!1427))))))

(assert (= (and d!123823 res!689199) b!1030924))

(assert (= (and b!1030924 res!689198) b!1030925))

(declare-fun m!950611 () Bool)

(assert (=> d!123823 m!950611))

(declare-fun m!950613 () Bool)

(assert (=> d!123823 m!950613))

(declare-fun m!950615 () Bool)

(assert (=> d!123823 m!950615))

(declare-fun m!950617 () Bool)

(assert (=> d!123823 m!950617))

(declare-fun m!950619 () Bool)

(assert (=> b!1030924 m!950619))

(declare-fun m!950621 () Bool)

(assert (=> b!1030925 m!950621))

(assert (=> b!1030676 d!123823))

(assert (=> d!123655 d!123695))

(declare-fun b!1030926 () Bool)

(declare-fun e!582158 () Bool)

(declare-fun e!582159 () Bool)

(assert (=> b!1030926 (= e!582158 e!582159)))

(declare-fun res!689201 () Bool)

(assert (=> b!1030926 (=> (not res!689201) (not e!582159))))

(declare-fun e!582160 () Bool)

(assert (=> b!1030926 (= res!689201 (not e!582160))))

(declare-fun res!689202 () Bool)

(assert (=> b!1030926 (=> (not res!689202) (not e!582160))))

(assert (=> b!1030926 (= res!689202 (validKeyInArray!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun call!43549 () Bool)

(declare-fun bm!43546 () Bool)

(declare-fun c!104441 () Bool)

(assert (=> bm!43546 (= call!43549 (arrayNoDuplicates!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104441 (Cons!21809 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000) Nil!21810) Nil!21810)))))

(declare-fun d!123825 () Bool)

(declare-fun res!689200 () Bool)

(assert (=> d!123825 (=> res!689200 e!582158)))

(assert (=> d!123825 (= res!689200 (bvsge #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(assert (=> d!123825 (= (arrayNoDuplicates!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) #b00000000000000000000000000000000 Nil!21810) e!582158)))

(declare-fun b!1030927 () Bool)

(assert (=> b!1030927 (= e!582160 (contains!5997 Nil!21810 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030928 () Bool)

(declare-fun e!582161 () Bool)

(assert (=> b!1030928 (= e!582161 call!43549)))

(declare-fun b!1030929 () Bool)

(assert (=> b!1030929 (= e!582161 call!43549)))

(declare-fun b!1030930 () Bool)

(assert (=> b!1030930 (= e!582159 e!582161)))

(assert (=> b!1030930 (= c!104441 (validKeyInArray!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!123825 (not res!689200)) b!1030926))

(assert (= (and b!1030926 res!689202) b!1030927))

(assert (= (and b!1030926 res!689201) b!1030930))

(assert (= (and b!1030930 c!104441) b!1030928))

(assert (= (and b!1030930 (not c!104441)) b!1030929))

(assert (= (or b!1030928 b!1030929) bm!43546))

(assert (=> b!1030926 m!950259))

(assert (=> b!1030926 m!950259))

(assert (=> b!1030926 m!950261))

(assert (=> bm!43546 m!950259))

(declare-fun m!950623 () Bool)

(assert (=> bm!43546 m!950623))

(assert (=> b!1030927 m!950259))

(assert (=> b!1030927 m!950259))

(declare-fun m!950625 () Bool)

(assert (=> b!1030927 m!950625))

(assert (=> b!1030930 m!950259))

(assert (=> b!1030930 m!950259))

(assert (=> b!1030930 m!950261))

(assert (=> b!1030608 d!123825))

(declare-fun d!123827 () Bool)

(declare-fun res!689204 () Bool)

(declare-fun e!582162 () Bool)

(assert (=> d!123827 (=> res!689204 e!582162)))

(assert (=> d!123827 (= res!689204 (bvsge #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(assert (=> d!123827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (mask!29926 thiss!1427)) e!582162)))

(declare-fun b!1030931 () Bool)

(declare-fun e!582164 () Bool)

(assert (=> b!1030931 (= e!582162 e!582164)))

(declare-fun c!104442 () Bool)

(assert (=> b!1030931 (= c!104442 (validKeyInArray!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43547 () Bool)

(declare-fun call!43550 () Bool)

(assert (=> bm!43547 (= call!43550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (mask!29926 thiss!1427)))))

(declare-fun b!1030932 () Bool)

(declare-fun e!582163 () Bool)

(assert (=> b!1030932 (= e!582163 call!43550)))

(declare-fun b!1030933 () Bool)

(assert (=> b!1030933 (= e!582164 call!43550)))

(declare-fun b!1030934 () Bool)

(assert (=> b!1030934 (= e!582164 e!582163)))

(declare-fun lt!454422 () (_ BitVec 64))

(assert (=> b!1030934 (= lt!454422 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454421 () Unit!33620)

(assert (=> b!1030934 (= lt!454421 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) lt!454422 #b00000000000000000000000000000000))))

(assert (=> b!1030934 (arrayContainsKey!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) lt!454422 #b00000000000000000000000000000000)))

(declare-fun lt!454423 () Unit!33620)

(assert (=> b!1030934 (= lt!454423 lt!454421)))

(declare-fun res!689203 () Bool)

(assert (=> b!1030934 (= res!689203 (= (seekEntryOrOpen!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000) (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (mask!29926 thiss!1427)) (Found!9638 #b00000000000000000000000000000000)))))

(assert (=> b!1030934 (=> (not res!689203) (not e!582163))))

(assert (= (and d!123827 (not res!689204)) b!1030931))

(assert (= (and b!1030931 c!104442) b!1030934))

(assert (= (and b!1030931 (not c!104442)) b!1030933))

(assert (= (and b!1030934 res!689203) b!1030932))

(assert (= (or b!1030932 b!1030933) bm!43547))

(assert (=> b!1030931 m!950259))

(assert (=> b!1030931 m!950259))

(assert (=> b!1030931 m!950261))

(declare-fun m!950627 () Bool)

(assert (=> bm!43547 m!950627))

(assert (=> b!1030934 m!950259))

(declare-fun m!950629 () Bool)

(assert (=> b!1030934 m!950629))

(declare-fun m!950631 () Bool)

(assert (=> b!1030934 m!950631))

(assert (=> b!1030934 m!950259))

(declare-fun m!950633 () Bool)

(assert (=> b!1030934 m!950633))

(assert (=> b!1030660 d!123827))

(declare-fun d!123829 () Bool)

(declare-fun e!582165 () Bool)

(assert (=> d!123829 e!582165))

(declare-fun res!689206 () Bool)

(assert (=> d!123829 (=> (not res!689206) (not e!582165))))

(declare-fun lt!454426 () ListLongMap!13695)

(assert (=> d!123829 (= res!689206 (contains!5998 lt!454426 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun lt!454425 () List!21812)

(assert (=> d!123829 (= lt!454426 (ListLongMap!13696 lt!454425))))

(declare-fun lt!454424 () Unit!33620)

(declare-fun lt!454427 () Unit!33620)

(assert (=> d!123829 (= lt!454424 lt!454427)))

(assert (=> d!123829 (= (getValueByKey!582 lt!454425 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123829 (= lt!454427 (lemmaContainsTupThenGetReturnValue!278 lt!454425 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123829 (= lt!454425 (insertStrictlySorted!371 (toList!6863 call!43523) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123829 (= (+!3123 call!43523 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) lt!454426)))

(declare-fun b!1030935 () Bool)

(declare-fun res!689205 () Bool)

(assert (=> b!1030935 (=> (not res!689205) (not e!582165))))

(assert (=> b!1030935 (= res!689205 (= (getValueByKey!582 (toList!6863 lt!454426) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun b!1030936 () Bool)

(assert (=> b!1030936 (= e!582165 (contains!5999 (toList!6863 lt!454426) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(assert (= (and d!123829 res!689206) b!1030935))

(assert (= (and b!1030935 res!689205) b!1030936))

(declare-fun m!950635 () Bool)

(assert (=> d!123829 m!950635))

(declare-fun m!950637 () Bool)

(assert (=> d!123829 m!950637))

(declare-fun m!950639 () Bool)

(assert (=> d!123829 m!950639))

(declare-fun m!950641 () Bool)

(assert (=> d!123829 m!950641))

(declare-fun m!950643 () Bool)

(assert (=> b!1030935 m!950643))

(declare-fun m!950645 () Bool)

(assert (=> b!1030936 m!950645))

(assert (=> b!1030595 d!123829))

(declare-fun d!123831 () Bool)

(declare-fun e!582166 () Bool)

(assert (=> d!123831 e!582166))

(declare-fun res!689208 () Bool)

(assert (=> d!123831 (=> (not res!689208) (not e!582166))))

(declare-fun lt!454430 () ListLongMap!13695)

(assert (=> d!123831 (= res!689208 (contains!5998 lt!454430 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun lt!454429 () List!21812)

(assert (=> d!123831 (= lt!454430 (ListLongMap!13696 lt!454429))))

(declare-fun lt!454428 () Unit!33620)

(declare-fun lt!454431 () Unit!33620)

(assert (=> d!123831 (= lt!454428 lt!454431)))

(assert (=> d!123831 (= (getValueByKey!582 lt!454429 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123831 (= lt!454431 (lemmaContainsTupThenGetReturnValue!278 lt!454429 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123831 (= lt!454429 (insertStrictlySorted!371 (toList!6863 call!43537) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(assert (=> d!123831 (= (+!3123 call!43537 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))) lt!454430)))

(declare-fun b!1030937 () Bool)

(declare-fun res!689207 () Bool)

(assert (=> b!1030937 (=> (not res!689207) (not e!582166))))

(assert (=> b!1030937 (= res!689207 (= (getValueByKey!582 (toList!6863 lt!454430) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))) (Some!632 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))))

(declare-fun b!1030938 () Bool)

(assert (=> b!1030938 (= e!582166 (contains!5999 (toList!6863 lt!454430) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(assert (= (and d!123831 res!689208) b!1030937))

(assert (= (and b!1030937 res!689207) b!1030938))

(declare-fun m!950647 () Bool)

(assert (=> d!123831 m!950647))

(declare-fun m!950649 () Bool)

(assert (=> d!123831 m!950649))

(declare-fun m!950651 () Bool)

(assert (=> d!123831 m!950651))

(declare-fun m!950653 () Bool)

(assert (=> d!123831 m!950653))

(declare-fun m!950655 () Bool)

(assert (=> b!1030937 m!950655))

(declare-fun m!950657 () Bool)

(assert (=> b!1030938 m!950657))

(assert (=> b!1030671 d!123831))

(assert (=> b!1030637 d!123709))

(declare-fun b!1030939 () Bool)

(declare-fun e!582167 () (_ BitVec 32))

(assert (=> b!1030939 (= e!582167 #b00000000000000000000000000000000)))

(declare-fun b!1030940 () Bool)

(declare-fun e!582168 () (_ BitVec 32))

(assert (=> b!1030940 (= e!582167 e!582168)))

(declare-fun c!104443 () Bool)

(assert (=> b!1030940 (= c!104443 (validKeyInArray!0 (select (arr!31165 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030941 () Bool)

(declare-fun call!43551 () (_ BitVec 32))

(assert (=> b!1030941 (= e!582168 call!43551)))

(declare-fun b!1030942 () Bool)

(assert (=> b!1030942 (= e!582168 (bvadd #b00000000000000000000000000000001 call!43551))))

(declare-fun bm!43548 () Bool)

(assert (=> bm!43548 (= call!43551 (arrayCountValidKeys!0 lt!454067 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123833 () Bool)

(declare-fun lt!454432 () (_ BitVec 32))

(assert (=> d!123833 (and (bvsge lt!454432 #b00000000000000000000000000000000) (bvsle lt!454432 (bvsub (size!31681 lt!454067) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123833 (= lt!454432 e!582167)))

(declare-fun c!104444 () Bool)

(assert (=> d!123833 (= c!104444 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123833 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31681 (_keys!11313 thiss!1427)) (size!31681 lt!454067)))))

(assert (=> d!123833 (= (arrayCountValidKeys!0 lt!454067 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))) lt!454432)))

(assert (= (and d!123833 c!104444) b!1030939))

(assert (= (and d!123833 (not c!104444)) b!1030940))

(assert (= (and b!1030940 c!104443) b!1030942))

(assert (= (and b!1030940 (not c!104443)) b!1030941))

(assert (= (or b!1030942 b!1030941) bm!43548))

(assert (=> b!1030940 m!950221))

(assert (=> b!1030940 m!950221))

(assert (=> b!1030940 m!950223))

(declare-fun m!950659 () Bool)

(assert (=> bm!43548 m!950659))

(assert (=> bm!43528 d!123833))

(declare-fun d!123835 () Bool)

(assert (=> d!123835 (arrayContainsKey!0 lt!454067 lt!454221 #b00000000000000000000000000000000)))

(declare-fun lt!454435 () Unit!33620)

(declare-fun choose!13 (array!64733 (_ BitVec 64) (_ BitVec 32)) Unit!33620)

(assert (=> d!123835 (= lt!454435 (choose!13 lt!454067 lt!454221 #b00000000000000000000000000000000))))

(assert (=> d!123835 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123835 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454067 lt!454221 #b00000000000000000000000000000000) lt!454435)))

(declare-fun bs!30100 () Bool)

(assert (= bs!30100 d!123835))

(assert (=> bs!30100 m!950131))

(declare-fun m!950661 () Bool)

(assert (=> bs!30100 m!950661))

(assert (=> b!1030623 d!123835))

(declare-fun d!123837 () Bool)

(declare-fun res!689209 () Bool)

(declare-fun e!582169 () Bool)

(assert (=> d!123837 (=> res!689209 e!582169)))

(assert (=> d!123837 (= res!689209 (= (select (arr!31165 lt!454067) #b00000000000000000000000000000000) lt!454221))))

(assert (=> d!123837 (= (arrayContainsKey!0 lt!454067 lt!454221 #b00000000000000000000000000000000) e!582169)))

(declare-fun b!1030943 () Bool)

(declare-fun e!582170 () Bool)

(assert (=> b!1030943 (= e!582169 e!582170)))

(declare-fun res!689210 () Bool)

(assert (=> b!1030943 (=> (not res!689210) (not e!582170))))

(assert (=> b!1030943 (= res!689210 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 lt!454067)))))

(declare-fun b!1030944 () Bool)

(assert (=> b!1030944 (= e!582170 (arrayContainsKey!0 lt!454067 lt!454221 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123837 (not res!689209)) b!1030943))

(assert (= (and b!1030943 res!689210) b!1030944))

(assert (=> d!123837 m!950055))

(declare-fun m!950663 () Bool)

(assert (=> b!1030944 m!950663))

(assert (=> b!1030623 d!123837))

(declare-fun d!123839 () Bool)

(declare-fun lt!454442 () SeekEntryResult!9638)

(assert (=> d!123839 (and (or ((_ is Undefined!9638) lt!454442) (not ((_ is Found!9638) lt!454442)) (and (bvsge (index!40924 lt!454442) #b00000000000000000000000000000000) (bvslt (index!40924 lt!454442) (size!31681 lt!454067)))) (or ((_ is Undefined!9638) lt!454442) ((_ is Found!9638) lt!454442) (not ((_ is MissingZero!9638) lt!454442)) (and (bvsge (index!40923 lt!454442) #b00000000000000000000000000000000) (bvslt (index!40923 lt!454442) (size!31681 lt!454067)))) (or ((_ is Undefined!9638) lt!454442) ((_ is Found!9638) lt!454442) ((_ is MissingZero!9638) lt!454442) (not ((_ is MissingVacant!9638) lt!454442)) (and (bvsge (index!40926 lt!454442) #b00000000000000000000000000000000) (bvslt (index!40926 lt!454442) (size!31681 lt!454067)))) (or ((_ is Undefined!9638) lt!454442) (ite ((_ is Found!9638) lt!454442) (= (select (arr!31165 lt!454067) (index!40924 lt!454442)) (select (arr!31165 lt!454067) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9638) lt!454442) (= (select (arr!31165 lt!454067) (index!40923 lt!454442)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9638) lt!454442) (= (select (arr!31165 lt!454067) (index!40926 lt!454442)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!582177 () SeekEntryResult!9638)

(assert (=> d!123839 (= lt!454442 e!582177)))

(declare-fun c!104453 () Bool)

(declare-fun lt!454444 () SeekEntryResult!9638)

(assert (=> d!123839 (= c!104453 (and ((_ is Intermediate!9638) lt!454444) (undefined!10450 lt!454444)))))

(assert (=> d!123839 (= lt!454444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) (mask!29926 thiss!1427)) (select (arr!31165 lt!454067) #b00000000000000000000000000000000) lt!454067 (mask!29926 thiss!1427)))))

(assert (=> d!123839 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123839 (= (seekEntryOrOpen!0 (select (arr!31165 lt!454067) #b00000000000000000000000000000000) lt!454067 (mask!29926 thiss!1427)) lt!454442)))

(declare-fun b!1030957 () Bool)

(declare-fun e!582178 () SeekEntryResult!9638)

(assert (=> b!1030957 (= e!582177 e!582178)))

(declare-fun lt!454443 () (_ BitVec 64))

(assert (=> b!1030957 (= lt!454443 (select (arr!31165 lt!454067) (index!40925 lt!454444)))))

(declare-fun c!104452 () Bool)

(assert (=> b!1030957 (= c!104452 (= lt!454443 (select (arr!31165 lt!454067) #b00000000000000000000000000000000)))))

(declare-fun b!1030958 () Bool)

(declare-fun e!582179 () SeekEntryResult!9638)

(assert (=> b!1030958 (= e!582179 (MissingZero!9638 (index!40925 lt!454444)))))

(declare-fun b!1030959 () Bool)

(assert (=> b!1030959 (= e!582179 (seekKeyOrZeroReturnVacant!0 (x!91564 lt!454444) (index!40925 lt!454444) (index!40925 lt!454444) (select (arr!31165 lt!454067) #b00000000000000000000000000000000) lt!454067 (mask!29926 thiss!1427)))))

(declare-fun b!1030960 () Bool)

(declare-fun c!104451 () Bool)

(assert (=> b!1030960 (= c!104451 (= lt!454443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030960 (= e!582178 e!582179)))

(declare-fun b!1030961 () Bool)

(assert (=> b!1030961 (= e!582178 (Found!9638 (index!40925 lt!454444)))))

(declare-fun b!1030962 () Bool)

(assert (=> b!1030962 (= e!582177 Undefined!9638)))

(assert (= (and d!123839 c!104453) b!1030962))

(assert (= (and d!123839 (not c!104453)) b!1030957))

(assert (= (and b!1030957 c!104452) b!1030961))

(assert (= (and b!1030957 (not c!104452)) b!1030960))

(assert (= (and b!1030960 c!104451) b!1030958))

(assert (= (and b!1030960 (not c!104451)) b!1030959))

(assert (=> d!123839 m!950047))

(declare-fun m!950665 () Bool)

(assert (=> d!123839 m!950665))

(declare-fun m!950667 () Bool)

(assert (=> d!123839 m!950667))

(assert (=> d!123839 m!950055))

(declare-fun m!950669 () Bool)

(assert (=> d!123839 m!950669))

(assert (=> d!123839 m!950669))

(assert (=> d!123839 m!950055))

(declare-fun m!950671 () Bool)

(assert (=> d!123839 m!950671))

(declare-fun m!950673 () Bool)

(assert (=> d!123839 m!950673))

(declare-fun m!950675 () Bool)

(assert (=> b!1030957 m!950675))

(assert (=> b!1030959 m!950055))

(declare-fun m!950677 () Bool)

(assert (=> b!1030959 m!950677))

(assert (=> b!1030623 d!123839))

(declare-fun d!123841 () Bool)

(assert (=> d!123841 (not (arrayContainsKey!0 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123841 true))

(declare-fun _$59!17 () Unit!33620)

(assert (=> d!123841 (= (choose!121 (_keys!11313 thiss!1427) (index!40924 lt!454069) key!909) _$59!17)))

(declare-fun bs!30101 () Bool)

(assert (= bs!30101 d!123841))

(assert (=> bs!30101 m!949919))

(assert (=> bs!30101 m!950125))

(assert (=> d!123659 d!123841))

(assert (=> b!1030527 d!123671))

(assert (=> b!1030527 d!123655))

(declare-fun b!1030963 () Bool)

(declare-fun lt!454456 () ListLongMap!13695)

(declare-fun e!582191 () Bool)

(assert (=> b!1030963 (= e!582191 (= (apply!912 lt!454456 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)) (get!16385 (select (arr!31166 (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31682 (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))))))))

(assert (=> b!1030963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(declare-fun b!1030964 () Bool)

(declare-fun e!582188 () ListLongMap!13695)

(declare-fun call!43555 () ListLongMap!13695)

(assert (=> b!1030964 (= e!582188 call!43555)))

(declare-fun b!1030965 () Bool)

(declare-fun call!43552 () ListLongMap!13695)

(assert (=> b!1030965 (= e!582188 call!43552)))

(declare-fun b!1030966 () Bool)

(declare-fun e!582187 () Bool)

(assert (=> b!1030966 (= e!582187 (= (apply!912 lt!454456 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5950 thiss!1427)))))

(declare-fun b!1030967 () Bool)

(declare-fun c!104457 () Bool)

(assert (=> b!1030967 (= c!104457 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!582186 () ListLongMap!13695)

(assert (=> b!1030967 (= e!582186 e!582188)))

(declare-fun bm!43549 () Bool)

(declare-fun call!43556 () ListLongMap!13695)

(assert (=> bm!43549 (= call!43552 call!43556)))

(declare-fun b!1030968 () Bool)

(declare-fun e!582192 () Bool)

(declare-fun e!582181 () Bool)

(assert (=> b!1030968 (= e!582192 e!582181)))

(declare-fun res!689217 () Bool)

(declare-fun call!43553 () Bool)

(assert (=> b!1030968 (= res!689217 call!43553)))

(assert (=> b!1030968 (=> (not res!689217) (not e!582181))))

(declare-fun b!1030969 () Bool)

(declare-fun res!689211 () Bool)

(declare-fun e!582183 () Bool)

(assert (=> b!1030969 (=> (not res!689211) (not e!582183))))

(declare-fun e!582190 () Bool)

(assert (=> b!1030969 (= res!689211 e!582190)))

(declare-fun res!689218 () Bool)

(assert (=> b!1030969 (=> res!689218 e!582190)))

(declare-fun e!582180 () Bool)

(assert (=> b!1030969 (= res!689218 (not e!582180))))

(declare-fun res!689219 () Bool)

(assert (=> b!1030969 (=> (not res!689219) (not e!582180))))

(assert (=> b!1030969 (= res!689219 (bvslt #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(declare-fun bm!43550 () Bool)

(declare-fun call!43557 () ListLongMap!13695)

(assert (=> bm!43550 (= call!43555 call!43557)))

(declare-fun bm!43551 () Bool)

(declare-fun call!43554 () ListLongMap!13695)

(assert (=> bm!43551 (= call!43554 (getCurrentListMapNoExtraKeys!3563 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun b!1030971 () Bool)

(declare-fun res!689214 () Bool)

(assert (=> b!1030971 (=> (not res!689214) (not e!582183))))

(declare-fun e!582189 () Bool)

(assert (=> b!1030971 (= res!689214 e!582189)))

(declare-fun c!104456 () Bool)

(assert (=> b!1030971 (= c!104456 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!104455 () Bool)

(declare-fun c!104458 () Bool)

(declare-fun bm!43552 () Bool)

(assert (=> bm!43552 (= call!43556 (+!3123 (ite c!104458 call!43554 (ite c!104455 call!43557 call!43555)) (ite (or c!104458 c!104455) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5950 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427)))))))

(declare-fun b!1030972 () Bool)

(declare-fun e!582182 () Unit!33620)

(declare-fun Unit!33641 () Unit!33620)

(assert (=> b!1030972 (= e!582182 Unit!33641)))

(declare-fun bm!43553 () Bool)

(assert (=> bm!43553 (= call!43557 call!43554)))

(declare-fun b!1030973 () Bool)

(declare-fun e!582184 () ListLongMap!13695)

(assert (=> b!1030973 (= e!582184 (+!3123 call!43556 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5950 thiss!1427))))))

(declare-fun b!1030974 () Bool)

(assert (=> b!1030974 (= e!582183 e!582192)))

(declare-fun c!104454 () Bool)

(assert (=> b!1030974 (= c!104454 (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030975 () Bool)

(declare-fun call!43558 () Bool)

(assert (=> b!1030975 (= e!582189 (not call!43558))))

(declare-fun b!1030976 () Bool)

(assert (=> b!1030976 (= e!582184 e!582186)))

(assert (=> b!1030976 (= c!104455 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030977 () Bool)

(assert (=> b!1030977 (= e!582180 (validKeyInArray!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030970 () Bool)

(assert (=> b!1030970 (= e!582190 e!582191)))

(declare-fun res!689216 () Bool)

(assert (=> b!1030970 (=> (not res!689216) (not e!582191))))

(assert (=> b!1030970 (= res!689216 (contains!5998 lt!454456 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1030970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(declare-fun d!123843 () Bool)

(assert (=> d!123843 e!582183))

(declare-fun res!689215 () Bool)

(assert (=> d!123843 (=> (not res!689215) (not e!582183))))

(assert (=> d!123843 (= res!689215 (or (bvsge #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))))

(declare-fun lt!454445 () ListLongMap!13695)

(assert (=> d!123843 (= lt!454456 lt!454445)))

(declare-fun lt!454450 () Unit!33620)

(assert (=> d!123843 (= lt!454450 e!582182)))

(declare-fun c!104459 () Bool)

(declare-fun e!582185 () Bool)

(assert (=> d!123843 (= c!104459 e!582185)))

(declare-fun res!689213 () Bool)

(assert (=> d!123843 (=> (not res!689213) (not e!582185))))

(assert (=> d!123843 (= res!689213 (bvslt #b00000000000000000000000000000000 (size!31681 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))))))))

(assert (=> d!123843 (= lt!454445 e!582184)))

(assert (=> d!123843 (= c!104458 (and (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5846 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123843 (validMask!0 (mask!29926 thiss!1427))))

(assert (=> d!123843 (= (getCurrentListMap!3909 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) lt!454456)))

(declare-fun b!1030978 () Bool)

(declare-fun lt!454457 () Unit!33620)

(assert (=> b!1030978 (= e!582182 lt!454457)))

(declare-fun lt!454447 () ListLongMap!13695)

(assert (=> b!1030978 (= lt!454447 (getCurrentListMapNoExtraKeys!3563 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454461 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454462 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454462 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454451 () Unit!33620)

(assert (=> b!1030978 (= lt!454451 (addStillContains!622 lt!454447 lt!454461 (zeroValue!5950 thiss!1427) lt!454462))))

(assert (=> b!1030978 (contains!5998 (+!3123 lt!454447 (tuple2!15573 lt!454461 (zeroValue!5950 thiss!1427))) lt!454462)))

(declare-fun lt!454455 () Unit!33620)

(assert (=> b!1030978 (= lt!454455 lt!454451)))

(declare-fun lt!454454 () ListLongMap!13695)

(assert (=> b!1030978 (= lt!454454 (getCurrentListMapNoExtraKeys!3563 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454466 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454466 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454459 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454459 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454465 () Unit!33620)

(assert (=> b!1030978 (= lt!454465 (addApplyDifferent!478 lt!454454 lt!454466 (minValue!5950 thiss!1427) lt!454459))))

(assert (=> b!1030978 (= (apply!912 (+!3123 lt!454454 (tuple2!15573 lt!454466 (minValue!5950 thiss!1427))) lt!454459) (apply!912 lt!454454 lt!454459))))

(declare-fun lt!454460 () Unit!33620)

(assert (=> b!1030978 (= lt!454460 lt!454465)))

(declare-fun lt!454458 () ListLongMap!13695)

(assert (=> b!1030978 (= lt!454458 (getCurrentListMapNoExtraKeys!3563 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454463 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454464 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454464 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454449 () Unit!33620)

(assert (=> b!1030978 (= lt!454449 (addApplyDifferent!478 lt!454458 lt!454463 (zeroValue!5950 thiss!1427) lt!454464))))

(assert (=> b!1030978 (= (apply!912 (+!3123 lt!454458 (tuple2!15573 lt!454463 (zeroValue!5950 thiss!1427))) lt!454464) (apply!912 lt!454458 lt!454464))))

(declare-fun lt!454446 () Unit!33620)

(assert (=> b!1030978 (= lt!454446 lt!454449)))

(declare-fun lt!454453 () ListLongMap!13695)

(assert (=> b!1030978 (= lt!454453 (getCurrentListMapNoExtraKeys!3563 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-fun lt!454452 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454448 () (_ BitVec 64))

(assert (=> b!1030978 (= lt!454448 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1030978 (= lt!454457 (addApplyDifferent!478 lt!454453 lt!454452 (minValue!5950 thiss!1427) lt!454448))))

(assert (=> b!1030978 (= (apply!912 (+!3123 lt!454453 (tuple2!15573 lt!454452 (minValue!5950 thiss!1427))) lt!454448) (apply!912 lt!454453 lt!454448))))

(declare-fun bm!43554 () Bool)

(assert (=> bm!43554 (= call!43553 (contains!5998 lt!454456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030979 () Bool)

(assert (=> b!1030979 (= e!582186 call!43552)))

(declare-fun b!1030980 () Bool)

(assert (=> b!1030980 (= e!582185 (validKeyInArray!0 (select (arr!31165 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030981 () Bool)

(assert (=> b!1030981 (= e!582189 e!582187)))

(declare-fun res!689212 () Bool)

(assert (=> b!1030981 (= res!689212 call!43558)))

(assert (=> b!1030981 (=> (not res!689212) (not e!582187))))

(declare-fun b!1030982 () Bool)

(assert (=> b!1030982 (= e!582192 (not call!43553))))

(declare-fun bm!43555 () Bool)

(assert (=> bm!43555 (= call!43558 (contains!5998 lt!454456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030983 () Bool)

(assert (=> b!1030983 (= e!582181 (= (apply!912 lt!454456 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5950 thiss!1427)))))

(assert (= (and d!123843 c!104458) b!1030973))

(assert (= (and d!123843 (not c!104458)) b!1030976))

(assert (= (and b!1030976 c!104455) b!1030979))

(assert (= (and b!1030976 (not c!104455)) b!1030967))

(assert (= (and b!1030967 c!104457) b!1030965))

(assert (= (and b!1030967 (not c!104457)) b!1030964))

(assert (= (or b!1030965 b!1030964) bm!43550))

(assert (= (or b!1030979 bm!43550) bm!43553))

(assert (= (or b!1030979 b!1030965) bm!43549))

(assert (= (or b!1030973 bm!43553) bm!43551))

(assert (= (or b!1030973 bm!43549) bm!43552))

(assert (= (and d!123843 res!689213) b!1030980))

(assert (= (and d!123843 c!104459) b!1030978))

(assert (= (and d!123843 (not c!104459)) b!1030972))

(assert (= (and d!123843 res!689215) b!1030969))

(assert (= (and b!1030969 res!689219) b!1030977))

(assert (= (and b!1030969 (not res!689218)) b!1030970))

(assert (= (and b!1030970 res!689216) b!1030963))

(assert (= (and b!1030969 res!689211) b!1030971))

(assert (= (and b!1030971 c!104456) b!1030981))

(assert (= (and b!1030971 (not c!104456)) b!1030975))

(assert (= (and b!1030981 res!689212) b!1030966))

(assert (= (or b!1030981 b!1030975) bm!43555))

(assert (= (and b!1030971 res!689214) b!1030974))

(assert (= (and b!1030974 c!104454) b!1030968))

(assert (= (and b!1030974 (not c!104454)) b!1030982))

(assert (= (and b!1030968 res!689217) b!1030983))

(assert (= (or b!1030968 b!1030982) bm!43554))

(declare-fun b_lambda!15885 () Bool)

(assert (=> (not b_lambda!15885) (not b!1030963)))

(assert (=> b!1030963 t!30891))

(declare-fun b_and!32947 () Bool)

(assert (= b_and!32945 (and (=> t!30891 result!14137) b_and!32947)))

(declare-fun m!950679 () Bool)

(assert (=> b!1030973 m!950679))

(assert (=> b!1030977 m!950259))

(assert (=> b!1030977 m!950259))

(assert (=> b!1030977 m!950261))

(assert (=> d!123843 m!950047))

(declare-fun m!950681 () Bool)

(assert (=> b!1030963 m!950681))

(assert (=> b!1030963 m!949933))

(declare-fun m!950683 () Bool)

(assert (=> b!1030963 m!950683))

(assert (=> b!1030963 m!950681))

(assert (=> b!1030963 m!949933))

(assert (=> b!1030963 m!950259))

(assert (=> b!1030963 m!950259))

(declare-fun m!950685 () Bool)

(assert (=> b!1030963 m!950685))

(declare-fun m!950687 () Bool)

(assert (=> b!1030978 m!950687))

(declare-fun m!950689 () Bool)

(assert (=> b!1030978 m!950689))

(assert (=> b!1030978 m!950687))

(declare-fun m!950691 () Bool)

(assert (=> b!1030978 m!950691))

(declare-fun m!950693 () Bool)

(assert (=> b!1030978 m!950693))

(declare-fun m!950695 () Bool)

(assert (=> b!1030978 m!950695))

(declare-fun m!950697 () Bool)

(assert (=> b!1030978 m!950697))

(assert (=> b!1030978 m!950695))

(declare-fun m!950699 () Bool)

(assert (=> b!1030978 m!950699))

(declare-fun m!950701 () Bool)

(assert (=> b!1030978 m!950701))

(declare-fun m!950703 () Bool)

(assert (=> b!1030978 m!950703))

(declare-fun m!950705 () Bool)

(assert (=> b!1030978 m!950705))

(declare-fun m!950707 () Bool)

(assert (=> b!1030978 m!950707))

(assert (=> b!1030978 m!950259))

(declare-fun m!950709 () Bool)

(assert (=> b!1030978 m!950709))

(assert (=> b!1030978 m!950699))

(declare-fun m!950711 () Bool)

(assert (=> b!1030978 m!950711))

(declare-fun m!950713 () Bool)

(assert (=> b!1030978 m!950713))

(declare-fun m!950715 () Bool)

(assert (=> b!1030978 m!950715))

(declare-fun m!950717 () Bool)

(assert (=> b!1030978 m!950717))

(assert (=> b!1030978 m!950715))

(declare-fun m!950719 () Bool)

(assert (=> bm!43555 m!950719))

(declare-fun m!950721 () Bool)

(assert (=> b!1030966 m!950721))

(declare-fun m!950723 () Bool)

(assert (=> bm!43554 m!950723))

(assert (=> b!1030970 m!950259))

(assert (=> b!1030970 m!950259))

(declare-fun m!950725 () Bool)

(assert (=> b!1030970 m!950725))

(declare-fun m!950727 () Bool)

(assert (=> b!1030983 m!950727))

(assert (=> b!1030980 m!950259))

(assert (=> b!1030980 m!950259))

(assert (=> b!1030980 m!950261))

(declare-fun m!950729 () Bool)

(assert (=> bm!43552 m!950729))

(assert (=> bm!43551 m!950713))

(assert (=> b!1030527 d!123843))

(assert (=> b!1030620 d!123707))

(declare-fun b!1030984 () Bool)

(declare-fun e!582193 () (_ BitVec 32))

(assert (=> b!1030984 (= e!582193 #b00000000000000000000000000000000)))

(declare-fun b!1030985 () Bool)

(declare-fun e!582194 () (_ BitVec 32))

(assert (=> b!1030985 (= e!582193 e!582194)))

(declare-fun c!104460 () Bool)

(assert (=> b!1030985 (= c!104460 (validKeyInArray!0 (select (arr!31165 (_keys!11313 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1030986 () Bool)

(declare-fun call!43559 () (_ BitVec 32))

(assert (=> b!1030986 (= e!582194 call!43559)))

(declare-fun b!1030987 () Bool)

(assert (=> b!1030987 (= e!582194 (bvadd #b00000000000000000000000000000001 call!43559))))

(declare-fun bm!43556 () Bool)

(assert (=> bm!43556 (= call!43559 (arrayCountValidKeys!0 (_keys!11313 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(declare-fun d!123845 () Bool)

(declare-fun lt!454467 () (_ BitVec 32))

(assert (=> d!123845 (and (bvsge lt!454467 #b00000000000000000000000000000000) (bvsle lt!454467 (bvsub (size!31681 (_keys!11313 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123845 (= lt!454467 e!582193)))

(declare-fun c!104461 () Bool)

(assert (=> d!123845 (= c!104461 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123845 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31681 (_keys!11313 thiss!1427)) (size!31681 (_keys!11313 thiss!1427))))))

(assert (=> d!123845 (= (arrayCountValidKeys!0 (_keys!11313 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31681 (_keys!11313 thiss!1427))) lt!454467)))

(assert (= (and d!123845 c!104461) b!1030984))

(assert (= (and d!123845 (not c!104461)) b!1030985))

(assert (= (and b!1030985 c!104460) b!1030987))

(assert (= (and b!1030985 (not c!104460)) b!1030986))

(assert (= (or b!1030987 b!1030986) bm!43556))

(declare-fun m!950731 () Bool)

(assert (=> b!1030985 m!950731))

(assert (=> b!1030985 m!950731))

(declare-fun m!950733 () Bool)

(assert (=> b!1030985 m!950733))

(declare-fun m!950735 () Bool)

(assert (=> bm!43556 m!950735))

(assert (=> bm!43529 d!123845))

(declare-fun d!123847 () Bool)

(assert (=> d!123847 (= (-!486 (getCurrentListMap!3909 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3909 (array!64734 (store (arr!31165 (_keys!11313 thiss!1427)) (index!40924 lt!454069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31681 (_keys!11313 thiss!1427))) (array!64736 (store (arr!31166 (_values!6137 thiss!1427)) (index!40924 lt!454069) (ValueCellFull!11453 (dynLambda!1980 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31682 (_values!6137 thiss!1427))) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(assert (=> d!123847 true))

(declare-fun _$9!41 () Unit!33620)

(assert (=> d!123847 (= (choose!1693 (_keys!11313 thiss!1427) (_values!6137 thiss!1427) (mask!29926 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!40924 lt!454069) key!909 (defaultEntry!6114 thiss!1427)) _$9!41)))

(declare-fun b_lambda!15887 () Bool)

(assert (=> (not b_lambda!15887) (not d!123847)))

(assert (=> d!123847 t!30891))

(declare-fun b_and!32949 () Bool)

(assert (= b_and!32947 (and (=> t!30891 result!14137) b_and!32949)))

(assert (=> d!123847 m!950053))

(assert (=> d!123847 m!949933))

(assert (=> d!123847 m!949919))

(assert (=> d!123847 m!949931))

(assert (=> d!123847 m!949941))

(assert (=> d!123847 m!949913))

(assert (=> d!123847 m!949931))

(assert (=> d!123651 d!123847))

(assert (=> d!123651 d!123695))

(declare-fun b!1030988 () Bool)

(declare-fun e!582195 () Bool)

(assert (=> b!1030988 (= e!582195 tp_is_empty!24313)))

(declare-fun mapIsEmpty!37922 () Bool)

(declare-fun mapRes!37922 () Bool)

(assert (=> mapIsEmpty!37922 mapRes!37922))

(declare-fun mapNonEmpty!37922 () Bool)

(declare-fun tp!72855 () Bool)

(assert (=> mapNonEmpty!37922 (= mapRes!37922 (and tp!72855 e!582195))))

(declare-fun mapRest!37922 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapKey!37922 () (_ BitVec 32))

(declare-fun mapValue!37922 () ValueCell!11453)

(assert (=> mapNonEmpty!37922 (= mapRest!37921 (store mapRest!37922 mapKey!37922 mapValue!37922))))

(declare-fun condMapEmpty!37922 () Bool)

(declare-fun mapDefault!37922 () ValueCell!11453)

(assert (=> mapNonEmpty!37921 (= condMapEmpty!37922 (= mapRest!37921 ((as const (Array (_ BitVec 32) ValueCell!11453)) mapDefault!37922)))))

(declare-fun e!582196 () Bool)

(assert (=> mapNonEmpty!37921 (= tp!72854 (and e!582196 mapRes!37922))))

(declare-fun b!1030989 () Bool)

(assert (=> b!1030989 (= e!582196 tp_is_empty!24313)))

(assert (= (and mapNonEmpty!37921 condMapEmpty!37922) mapIsEmpty!37922))

(assert (= (and mapNonEmpty!37921 (not condMapEmpty!37922)) mapNonEmpty!37922))

(assert (= (and mapNonEmpty!37922 ((_ is ValueCellFull!11453) mapValue!37922)) b!1030988))

(assert (= (and mapNonEmpty!37921 ((_ is ValueCellFull!11453) mapDefault!37922)) b!1030989))

(declare-fun m!950737 () Bool)

(assert (=> mapNonEmpty!37922 m!950737))

(declare-fun b_lambda!15889 () Bool)

(assert (= b_lambda!15885 (or (and b!1030452 b_free!20593) b_lambda!15889)))

(declare-fun b_lambda!15891 () Bool)

(assert (= b_lambda!15879 (or (and b!1030452 b_free!20593) b_lambda!15891)))

(declare-fun b_lambda!15893 () Bool)

(assert (= b_lambda!15877 (or (and b!1030452 b_free!20593) b_lambda!15893)))

(declare-fun b_lambda!15895 () Bool)

(assert (= b_lambda!15881 (or (and b!1030452 b_free!20593) b_lambda!15895)))

(declare-fun b_lambda!15897 () Bool)

(assert (= b_lambda!15887 (or (and b!1030452 b_free!20593) b_lambda!15897)))

(declare-fun b_lambda!15899 () Bool)

(assert (= b_lambda!15883 (or (and b!1030452 b_free!20593) b_lambda!15899)))

(check-sat (not d!123843) (not bm!43552) (not d!123689) (not b!1030901) (not d!123741) (not b!1030938) (not b_lambda!15899) (not b!1030875) (not b!1030898) (not d!123807) (not d!123749) (not b!1030931) (not d!123787) (not b!1030916) (not d!123841) (not d!123785) (not d!123751) (not b!1030842) (not b!1030925) (not d!123697) (not d!123771) (not b!1030980) (not b!1030743) (not bm!43556) (not b_lambda!15897) (not b!1030937) (not b!1030913) (not b!1030755) (not d!123817) (not b!1030824) (not d!123701) (not b!1030936) (not d!123735) (not b!1030845) (not b!1030825) (not b!1030934) (not d!123731) (not b!1030926) (not b!1030830) (not b!1030769) (not b!1030944) (not d!123795) (not d!123819) (not d!123761) (not d!123789) (not d!123703) (not b!1030836) (not b!1030918) (not d!123767) (not d!123783) (not b!1030891) (not b!1030922) (not d!123773) (not bm!43548) (not b!1030970) (not b!1030924) (not b!1030834) tp_is_empty!24313 (not d!123745) (not b!1030764) (not b!1030765) (not d!123803) (not b!1030881) (not b!1030715) (not bm!43539) (not b!1030768) (not b!1030884) (not b!1030893) (not bm!43551) (not d!123753) (not b!1030966) (not b!1030930) (not b!1030736) (not b!1030904) (not b!1030860) (not d!123713) (not b!1030890) (not d!123779) (not b!1030766) (not d!123797) (not b!1030879) (not b_lambda!15875) (not bm!43545) (not b!1030917) (not b!1030871) (not b!1030874) (not d!123717) (not b!1030791) (not b!1030983) (not b!1030820) (not b!1030708) (not d!123743) (not d!123791) (not b!1030787) (not d!123821) (not b!1030872) (not bm!43544) (not b!1030843) (not b!1030831) (not b!1030772) (not b!1030907) (not d!123799) (not d!123829) (not b!1030864) b_and!32949 (not b!1030873) (not d!123801) (not d!123691) (not b!1030899) (not d!123805) (not b_next!20593) (not b!1030905) (not d!123719) (not b_lambda!15871) (not d!123739) (not d!123847) (not b!1030709) (not b!1030880) (not b!1030920) (not b!1030757) (not b!1030868) (not d!123811) (not b!1030770) (not b!1030746) (not b_lambda!15891) (not d!123765) (not d!123757) (not b!1030753) (not d!123813) (not d!123793) (not d!123763) (not mapNonEmpty!37922) (not b_lambda!15895) (not d!123809) (not bm!43554) (not d!123831) (not b!1030978) (not d!123839) (not bm!43555) (not b!1030828) (not b!1030711) (not b_lambda!15893) (not bm!43546) (not b!1030977) (not b!1030903) (not b!1030822) (not b!1030935) (not d!123725) (not bm!43537) (not b!1030877) (not bm!43538) (not d!123733) (not b!1030959) (not b!1030973) (not d!123685) (not b!1030794) (not b!1030940) (not d!123737) (not b_lambda!15889) (not b!1030909) (not b!1030985) (not b!1030712) (not b!1030923) (not d!123835) (not b!1030914) (not bm!43547) (not b_lambda!15873) (not b!1030866) (not d!123823) (not d!123769) (not b!1030858) (not d!123747) (not b!1030963) (not b!1030900) (not b!1030841) (not d!123777) (not b!1030829) (not b!1030833) (not bm!43540) (not b!1030927) (not b!1030827) (not b!1030910) (not bm!43543) (not d!123781) (not b!1030844) (not d!123775) (not b!1030869) (not b!1030847) (not b_lambda!15863) (not d!123815))
(check-sat b_and!32949 (not b_next!20593))
