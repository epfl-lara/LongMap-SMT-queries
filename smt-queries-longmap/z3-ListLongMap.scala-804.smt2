; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19322 () Bool)

(assert start!19322)

(declare-fun b!189916 () Bool)

(declare-fun b_free!4663 () Bool)

(declare-fun b_next!4663 () Bool)

(assert (=> b!189916 (= b_free!4663 (not b_next!4663))))

(declare-fun tp!16827 () Bool)

(declare-fun b_and!11283 () Bool)

(assert (=> b!189916 (= tp!16827 b_and!11283)))

(declare-fun res!89759 () Bool)

(declare-fun e!124980 () Bool)

(assert (=> start!19322 (=> (not res!89759) (not e!124980))))

(declare-datatypes ((V!5561 0))(
  ( (V!5562 (val!2262 Int)) )
))
(declare-datatypes ((ValueCell!1874 0))(
  ( (ValueCellFull!1874 (v!4183 V!5561)) (EmptyCell!1874) )
))
(declare-datatypes ((array!8083 0))(
  ( (array!8084 (arr!3808 (Array (_ BitVec 32) (_ BitVec 64))) (size!4129 (_ BitVec 32))) )
))
(declare-datatypes ((array!8085 0))(
  ( (array!8086 (arr!3809 (Array (_ BitVec 32) ValueCell!1874)) (size!4130 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2656 0))(
  ( (LongMapFixedSize!2657 (defaultEntry!3880 Int) (mask!9077 (_ BitVec 32)) (extraKeys!3617 (_ BitVec 32)) (zeroValue!3721 V!5561) (minValue!3721 V!5561) (_size!1377 (_ BitVec 32)) (_keys!5848 array!8083) (_values!3863 array!8085) (_vacant!1377 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2656)

(declare-fun valid!1110 (LongMapFixedSize!2656) Bool)

(assert (=> start!19322 (= res!89759 (valid!1110 thiss!1248))))

(assert (=> start!19322 e!124980))

(declare-fun e!124981 () Bool)

(assert (=> start!19322 e!124981))

(assert (=> start!19322 true))

(declare-fun tp_is_empty!4435 () Bool)

(assert (=> start!19322 tp_is_empty!4435))

(declare-fun b!189906 () Bool)

(declare-datatypes ((Unit!5699 0))(
  ( (Unit!5700) )
))
(declare-fun e!124983 () Unit!5699)

(declare-fun lt!93987 () Unit!5699)

(assert (=> b!189906 (= e!124983 lt!93987)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5699)

(assert (=> b!189906 (= lt!93987 (lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(declare-fun res!89758 () Bool)

(declare-datatypes ((SeekEntryResult!675 0))(
  ( (MissingZero!675 (index!4870 (_ BitVec 32))) (Found!675 (index!4871 (_ BitVec 32))) (Intermediate!675 (undefined!1487 Bool) (index!4872 (_ BitVec 32)) (x!20476 (_ BitVec 32))) (Undefined!675) (MissingVacant!675 (index!4873 (_ BitVec 32))) )
))
(declare-fun lt!93990 () SeekEntryResult!675)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189906 (= res!89758 (inRange!0 (index!4871 lt!93990) (mask!9077 thiss!1248)))))

(declare-fun e!124984 () Bool)

(assert (=> b!189906 (=> (not res!89758) (not e!124984))))

(assert (=> b!189906 e!124984))

(declare-fun b!189907 () Bool)

(declare-fun e!124978 () Bool)

(assert (=> b!189907 (= e!124978 (= (size!4130 (_values!3863 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9077 thiss!1248))))))

(declare-fun b!189908 () Bool)

(declare-fun e!124977 () Bool)

(declare-fun e!124986 () Bool)

(declare-fun mapRes!7654 () Bool)

(assert (=> b!189908 (= e!124977 (and e!124986 mapRes!7654))))

(declare-fun condMapEmpty!7654 () Bool)

(declare-fun mapDefault!7654 () ValueCell!1874)

(assert (=> b!189908 (= condMapEmpty!7654 (= (arr!3809 (_values!3863 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1874)) mapDefault!7654)))))

(declare-fun b!189909 () Bool)

(assert (=> b!189909 (= e!124984 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4871 lt!93990)) key!828))))

(declare-fun b!189910 () Bool)

(declare-fun res!89762 () Bool)

(assert (=> b!189910 (=> (not res!89762) (not e!124980))))

(assert (=> b!189910 (= res!89762 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189911 () Bool)

(declare-fun e!124985 () Bool)

(assert (=> b!189911 (= e!124980 e!124985)))

(declare-fun res!89760 () Bool)

(assert (=> b!189911 (=> (not res!89760) (not e!124985))))

(get-info :version)

(assert (=> b!189911 (= res!89760 (and (not ((_ is Undefined!675) lt!93990)) (not ((_ is MissingVacant!675) lt!93990)) (not ((_ is MissingZero!675) lt!93990)) ((_ is Found!675) lt!93990)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8083 (_ BitVec 32)) SeekEntryResult!675)

(assert (=> b!189911 (= lt!93990 (seekEntryOrOpen!0 key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun mapIsEmpty!7654 () Bool)

(assert (=> mapIsEmpty!7654 mapRes!7654))

(declare-fun b!189912 () Bool)

(declare-fun Unit!5701 () Unit!5699)

(assert (=> b!189912 (= e!124983 Unit!5701)))

(declare-fun lt!93985 () Unit!5699)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!165 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5699)

(assert (=> b!189912 (= lt!93985 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!165 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> b!189912 false))

(declare-fun mapNonEmpty!7654 () Bool)

(declare-fun tp!16828 () Bool)

(declare-fun e!124982 () Bool)

(assert (=> mapNonEmpty!7654 (= mapRes!7654 (and tp!16828 e!124982))))

(declare-fun mapKey!7654 () (_ BitVec 32))

(declare-fun mapRest!7654 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapValue!7654 () ValueCell!1874)

(assert (=> mapNonEmpty!7654 (= (arr!3809 (_values!3863 thiss!1248)) (store mapRest!7654 mapKey!7654 mapValue!7654))))

(declare-fun b!189913 () Bool)

(assert (=> b!189913 (= e!124985 (not e!124978))))

(declare-fun res!89761 () Bool)

(assert (=> b!189913 (=> res!89761 e!124978)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189913 (= res!89761 (not (validMask!0 (mask!9077 thiss!1248))))))

(declare-datatypes ((tuple2!3474 0))(
  ( (tuple2!3475 (_1!1748 (_ BitVec 64)) (_2!1748 V!5561)) )
))
(declare-datatypes ((List!2397 0))(
  ( (Nil!2394) (Cons!2393 (h!3030 tuple2!3474) (t!7296 List!2397)) )
))
(declare-datatypes ((ListLongMap!2383 0))(
  ( (ListLongMap!2384 (toList!1207 List!2397)) )
))
(declare-fun lt!93986 () ListLongMap!2383)

(declare-fun v!309 () V!5561)

(declare-fun +!299 (ListLongMap!2383 tuple2!3474) ListLongMap!2383)

(declare-fun getCurrentListMap!840 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) Int) ListLongMap!2383)

(assert (=> b!189913 (= (+!299 lt!93986 (tuple2!3475 key!828 v!309)) (getCurrentListMap!840 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!93988 () Unit!5699)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) (_ BitVec 64) V!5561 Int) Unit!5699)

(assert (=> b!189913 (= lt!93988 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4871 lt!93990) key!828 v!309 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!93989 () Unit!5699)

(assert (=> b!189913 (= lt!93989 e!124983)))

(declare-fun c!34125 () Bool)

(declare-fun contains!1322 (ListLongMap!2383 (_ BitVec 64)) Bool)

(assert (=> b!189913 (= c!34125 (contains!1322 lt!93986 key!828))))

(assert (=> b!189913 (= lt!93986 (getCurrentListMap!840 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun b!189914 () Bool)

(assert (=> b!189914 (= e!124986 tp_is_empty!4435)))

(declare-fun b!189915 () Bool)

(assert (=> b!189915 (= e!124982 tp_is_empty!4435)))

(declare-fun array_inv!2469 (array!8083) Bool)

(declare-fun array_inv!2470 (array!8085) Bool)

(assert (=> b!189916 (= e!124981 (and tp!16827 tp_is_empty!4435 (array_inv!2469 (_keys!5848 thiss!1248)) (array_inv!2470 (_values!3863 thiss!1248)) e!124977))))

(assert (= (and start!19322 res!89759) b!189910))

(assert (= (and b!189910 res!89762) b!189911))

(assert (= (and b!189911 res!89760) b!189913))

(assert (= (and b!189913 c!34125) b!189906))

(assert (= (and b!189913 (not c!34125)) b!189912))

(assert (= (and b!189906 res!89758) b!189909))

(assert (= (and b!189913 (not res!89761)) b!189907))

(assert (= (and b!189908 condMapEmpty!7654) mapIsEmpty!7654))

(assert (= (and b!189908 (not condMapEmpty!7654)) mapNonEmpty!7654))

(assert (= (and mapNonEmpty!7654 ((_ is ValueCellFull!1874) mapValue!7654)) b!189915))

(assert (= (and b!189908 ((_ is ValueCellFull!1874) mapDefault!7654)) b!189914))

(assert (= b!189916 b!189908))

(assert (= start!19322 b!189916))

(declare-fun m!215761 () Bool)

(assert (=> b!189916 m!215761))

(declare-fun m!215763 () Bool)

(assert (=> b!189916 m!215763))

(declare-fun m!215765 () Bool)

(assert (=> start!19322 m!215765))

(declare-fun m!215767 () Bool)

(assert (=> b!189913 m!215767))

(declare-fun m!215769 () Bool)

(assert (=> b!189913 m!215769))

(declare-fun m!215771 () Bool)

(assert (=> b!189913 m!215771))

(declare-fun m!215773 () Bool)

(assert (=> b!189913 m!215773))

(declare-fun m!215775 () Bool)

(assert (=> b!189913 m!215775))

(declare-fun m!215777 () Bool)

(assert (=> b!189913 m!215777))

(declare-fun m!215779 () Bool)

(assert (=> b!189913 m!215779))

(declare-fun m!215781 () Bool)

(assert (=> b!189911 m!215781))

(declare-fun m!215783 () Bool)

(assert (=> mapNonEmpty!7654 m!215783))

(declare-fun m!215785 () Bool)

(assert (=> b!189909 m!215785))

(declare-fun m!215787 () Bool)

(assert (=> b!189906 m!215787))

(declare-fun m!215789 () Bool)

(assert (=> b!189906 m!215789))

(declare-fun m!215791 () Bool)

(assert (=> b!189912 m!215791))

(check-sat tp_is_empty!4435 (not b!189911) b_and!11283 (not mapNonEmpty!7654) (not b!189906) (not b!189912) (not b!189913) (not b!189916) (not start!19322) (not b_next!4663))
(check-sat b_and!11283 (not b_next!4663))
(get-model)

(declare-fun d!55623 () Bool)

(declare-fun e!125049 () Bool)

(assert (=> d!55623 e!125049))

(declare-fun res!89797 () Bool)

(assert (=> d!55623 (=> (not res!89797) (not e!125049))))

(declare-fun lt!94031 () SeekEntryResult!675)

(assert (=> d!55623 (= res!89797 ((_ is Found!675) lt!94031))))

(assert (=> d!55623 (= lt!94031 (seekEntryOrOpen!0 key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun lt!94032 () Unit!5699)

(declare-fun choose!1027 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5699)

(assert (=> d!55623 (= lt!94032 (choose!1027 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55623 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55623 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) lt!94032)))

(declare-fun b!189987 () Bool)

(declare-fun res!89798 () Bool)

(assert (=> b!189987 (=> (not res!89798) (not e!125049))))

(assert (=> b!189987 (= res!89798 (inRange!0 (index!4871 lt!94031) (mask!9077 thiss!1248)))))

(declare-fun b!189988 () Bool)

(assert (=> b!189988 (= e!125049 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4871 lt!94031)) key!828))))

(assert (=> b!189988 (and (bvsge (index!4871 lt!94031) #b00000000000000000000000000000000) (bvslt (index!4871 lt!94031) (size!4129 (_keys!5848 thiss!1248))))))

(assert (= (and d!55623 res!89797) b!189987))

(assert (= (and b!189987 res!89798) b!189988))

(assert (=> d!55623 m!215781))

(declare-fun m!215857 () Bool)

(assert (=> d!55623 m!215857))

(assert (=> d!55623 m!215779))

(declare-fun m!215859 () Bool)

(assert (=> b!189987 m!215859))

(declare-fun m!215861 () Bool)

(assert (=> b!189988 m!215861))

(assert (=> b!189906 d!55623))

(declare-fun d!55625 () Bool)

(assert (=> d!55625 (= (inRange!0 (index!4871 lt!93990) (mask!9077 thiss!1248)) (and (bvsge (index!4871 lt!93990) #b00000000000000000000000000000000) (bvslt (index!4871 lt!93990) (bvadd (mask!9077 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189906 d!55625))

(declare-fun d!55627 () Bool)

(declare-fun lt!94039 () SeekEntryResult!675)

(assert (=> d!55627 (and (or ((_ is Undefined!675) lt!94039) (not ((_ is Found!675) lt!94039)) (and (bvsge (index!4871 lt!94039) #b00000000000000000000000000000000) (bvslt (index!4871 lt!94039) (size!4129 (_keys!5848 thiss!1248))))) (or ((_ is Undefined!675) lt!94039) ((_ is Found!675) lt!94039) (not ((_ is MissingZero!675) lt!94039)) (and (bvsge (index!4870 lt!94039) #b00000000000000000000000000000000) (bvslt (index!4870 lt!94039) (size!4129 (_keys!5848 thiss!1248))))) (or ((_ is Undefined!675) lt!94039) ((_ is Found!675) lt!94039) ((_ is MissingZero!675) lt!94039) (not ((_ is MissingVacant!675) lt!94039)) (and (bvsge (index!4873 lt!94039) #b00000000000000000000000000000000) (bvslt (index!4873 lt!94039) (size!4129 (_keys!5848 thiss!1248))))) (or ((_ is Undefined!675) lt!94039) (ite ((_ is Found!675) lt!94039) (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4871 lt!94039)) key!828) (ite ((_ is MissingZero!675) lt!94039) (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4870 lt!94039)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!675) lt!94039) (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4873 lt!94039)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!125057 () SeekEntryResult!675)

(assert (=> d!55627 (= lt!94039 e!125057)))

(declare-fun c!34140 () Bool)

(declare-fun lt!94040 () SeekEntryResult!675)

(assert (=> d!55627 (= c!34140 (and ((_ is Intermediate!675) lt!94040) (undefined!1487 lt!94040)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8083 (_ BitVec 32)) SeekEntryResult!675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55627 (= lt!94040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9077 thiss!1248)) key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(assert (=> d!55627 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55627 (= (seekEntryOrOpen!0 key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)) lt!94039)))

(declare-fun b!190001 () Bool)

(declare-fun e!125058 () SeekEntryResult!675)

(assert (=> b!190001 (= e!125057 e!125058)))

(declare-fun lt!94041 () (_ BitVec 64))

(assert (=> b!190001 (= lt!94041 (select (arr!3808 (_keys!5848 thiss!1248)) (index!4872 lt!94040)))))

(declare-fun c!34139 () Bool)

(assert (=> b!190001 (= c!34139 (= lt!94041 key!828))))

(declare-fun b!190002 () Bool)

(declare-fun e!125056 () SeekEntryResult!675)

(assert (=> b!190002 (= e!125056 (MissingZero!675 (index!4872 lt!94040)))))

(declare-fun b!190003 () Bool)

(assert (=> b!190003 (= e!125058 (Found!675 (index!4872 lt!94040)))))

(declare-fun b!190004 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8083 (_ BitVec 32)) SeekEntryResult!675)

(assert (=> b!190004 (= e!125056 (seekKeyOrZeroReturnVacant!0 (x!20476 lt!94040) (index!4872 lt!94040) (index!4872 lt!94040) key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun b!190005 () Bool)

(declare-fun c!34138 () Bool)

(assert (=> b!190005 (= c!34138 (= lt!94041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190005 (= e!125058 e!125056)))

(declare-fun b!190006 () Bool)

(assert (=> b!190006 (= e!125057 Undefined!675)))

(assert (= (and d!55627 c!34140) b!190006))

(assert (= (and d!55627 (not c!34140)) b!190001))

(assert (= (and b!190001 c!34139) b!190003))

(assert (= (and b!190001 (not c!34139)) b!190005))

(assert (= (and b!190005 c!34138) b!190002))

(assert (= (and b!190005 (not c!34138)) b!190004))

(declare-fun m!215863 () Bool)

(assert (=> d!55627 m!215863))

(assert (=> d!55627 m!215779))

(declare-fun m!215865 () Bool)

(assert (=> d!55627 m!215865))

(declare-fun m!215867 () Bool)

(assert (=> d!55627 m!215867))

(assert (=> d!55627 m!215865))

(declare-fun m!215869 () Bool)

(assert (=> d!55627 m!215869))

(declare-fun m!215871 () Bool)

(assert (=> d!55627 m!215871))

(declare-fun m!215873 () Bool)

(assert (=> b!190001 m!215873))

(declare-fun m!215875 () Bool)

(assert (=> b!190004 m!215875))

(assert (=> b!189911 d!55627))

(declare-fun d!55629 () Bool)

(assert (=> d!55629 (= (validMask!0 (mask!9077 thiss!1248)) (and (or (= (mask!9077 thiss!1248) #b00000000000000000000000000000111) (= (mask!9077 thiss!1248) #b00000000000000000000000000001111) (= (mask!9077 thiss!1248) #b00000000000000000000000000011111) (= (mask!9077 thiss!1248) #b00000000000000000000000000111111) (= (mask!9077 thiss!1248) #b00000000000000000000000001111111) (= (mask!9077 thiss!1248) #b00000000000000000000000011111111) (= (mask!9077 thiss!1248) #b00000000000000000000000111111111) (= (mask!9077 thiss!1248) #b00000000000000000000001111111111) (= (mask!9077 thiss!1248) #b00000000000000000000011111111111) (= (mask!9077 thiss!1248) #b00000000000000000000111111111111) (= (mask!9077 thiss!1248) #b00000000000000000001111111111111) (= (mask!9077 thiss!1248) #b00000000000000000011111111111111) (= (mask!9077 thiss!1248) #b00000000000000000111111111111111) (= (mask!9077 thiss!1248) #b00000000000000001111111111111111) (= (mask!9077 thiss!1248) #b00000000000000011111111111111111) (= (mask!9077 thiss!1248) #b00000000000000111111111111111111) (= (mask!9077 thiss!1248) #b00000000000001111111111111111111) (= (mask!9077 thiss!1248) #b00000000000011111111111111111111) (= (mask!9077 thiss!1248) #b00000000000111111111111111111111) (= (mask!9077 thiss!1248) #b00000000001111111111111111111111) (= (mask!9077 thiss!1248) #b00000000011111111111111111111111) (= (mask!9077 thiss!1248) #b00000000111111111111111111111111) (= (mask!9077 thiss!1248) #b00000001111111111111111111111111) (= (mask!9077 thiss!1248) #b00000011111111111111111111111111) (= (mask!9077 thiss!1248) #b00000111111111111111111111111111) (= (mask!9077 thiss!1248) #b00001111111111111111111111111111) (= (mask!9077 thiss!1248) #b00011111111111111111111111111111) (= (mask!9077 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9077 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!189913 d!55629))

(declare-fun d!55631 () Bool)

(declare-fun e!125061 () Bool)

(assert (=> d!55631 e!125061))

(declare-fun res!89801 () Bool)

(assert (=> d!55631 (=> (not res!89801) (not e!125061))))

(assert (=> d!55631 (= res!89801 (and (bvsge (index!4871 lt!93990) #b00000000000000000000000000000000) (bvslt (index!4871 lt!93990) (size!4130 (_values!3863 thiss!1248)))))))

(declare-fun lt!94044 () Unit!5699)

(declare-fun choose!1028 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) (_ BitVec 64) V!5561 Int) Unit!5699)

(assert (=> d!55631 (= lt!94044 (choose!1028 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4871 lt!93990) key!828 v!309 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55631 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55631 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4871 lt!93990) key!828 v!309 (defaultEntry!3880 thiss!1248)) lt!94044)))

(declare-fun b!190009 () Bool)

(assert (=> b!190009 (= e!125061 (= (+!299 (getCurrentListMap!840 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) (tuple2!3475 key!828 v!309)) (getCurrentListMap!840 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248))))))

(assert (= (and d!55631 res!89801) b!190009))

(declare-fun m!215877 () Bool)

(assert (=> d!55631 m!215877))

(assert (=> d!55631 m!215779))

(assert (=> b!190009 m!215769))

(assert (=> b!190009 m!215769))

(declare-fun m!215879 () Bool)

(assert (=> b!190009 m!215879))

(assert (=> b!190009 m!215775))

(assert (=> b!190009 m!215767))

(assert (=> b!189913 d!55631))

(declare-fun d!55633 () Bool)

(declare-fun e!125064 () Bool)

(assert (=> d!55633 e!125064))

(declare-fun res!89807 () Bool)

(assert (=> d!55633 (=> (not res!89807) (not e!125064))))

(declare-fun lt!94054 () ListLongMap!2383)

(assert (=> d!55633 (= res!89807 (contains!1322 lt!94054 (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun lt!94056 () List!2397)

(assert (=> d!55633 (= lt!94054 (ListLongMap!2384 lt!94056))))

(declare-fun lt!94053 () Unit!5699)

(declare-fun lt!94055 () Unit!5699)

(assert (=> d!55633 (= lt!94053 lt!94055)))

(declare-datatypes ((Option!240 0))(
  ( (Some!239 (v!4188 V!5561)) (None!238) )
))
(declare-fun getValueByKey!234 (List!2397 (_ BitVec 64)) Option!240)

(assert (=> d!55633 (= (getValueByKey!234 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309))) (Some!239 (_2!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!124 (List!2397 (_ BitVec 64) V!5561) Unit!5699)

(assert (=> d!55633 (= lt!94055 (lemmaContainsTupThenGetReturnValue!124 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun insertStrictlySorted!127 (List!2397 (_ BitVec 64) V!5561) List!2397)

(assert (=> d!55633 (= lt!94056 (insertStrictlySorted!127 (toList!1207 lt!93986) (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> d!55633 (= (+!299 lt!93986 (tuple2!3475 key!828 v!309)) lt!94054)))

(declare-fun b!190014 () Bool)

(declare-fun res!89806 () Bool)

(assert (=> b!190014 (=> (not res!89806) (not e!125064))))

(assert (=> b!190014 (= res!89806 (= (getValueByKey!234 (toList!1207 lt!94054) (_1!1748 (tuple2!3475 key!828 v!309))) (Some!239 (_2!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun b!190015 () Bool)

(declare-fun contains!1323 (List!2397 tuple2!3474) Bool)

(assert (=> b!190015 (= e!125064 (contains!1323 (toList!1207 lt!94054) (tuple2!3475 key!828 v!309)))))

(assert (= (and d!55633 res!89807) b!190014))

(assert (= (and b!190014 res!89806) b!190015))

(declare-fun m!215881 () Bool)

(assert (=> d!55633 m!215881))

(declare-fun m!215883 () Bool)

(assert (=> d!55633 m!215883))

(declare-fun m!215885 () Bool)

(assert (=> d!55633 m!215885))

(declare-fun m!215887 () Bool)

(assert (=> d!55633 m!215887))

(declare-fun m!215889 () Bool)

(assert (=> b!190014 m!215889))

(declare-fun m!215891 () Bool)

(assert (=> b!190015 m!215891))

(assert (=> b!189913 d!55633))

(declare-fun bm!19158 () Bool)

(declare-fun call!19163 () ListLongMap!2383)

(declare-fun call!19162 () ListLongMap!2383)

(assert (=> bm!19158 (= call!19163 call!19162)))

(declare-fun bm!19159 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!200 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) Int) ListLongMap!2383)

(assert (=> bm!19159 (= call!19162 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190058 () Bool)

(declare-fun res!89831 () Bool)

(declare-fun e!125103 () Bool)

(assert (=> b!190058 (=> (not res!89831) (not e!125103))))

(declare-fun e!125091 () Bool)

(assert (=> b!190058 (= res!89831 e!125091)))

(declare-fun res!89833 () Bool)

(assert (=> b!190058 (=> res!89833 e!125091)))

(declare-fun e!125098 () Bool)

(assert (=> b!190058 (= res!89833 (not e!125098))))

(declare-fun res!89826 () Bool)

(assert (=> b!190058 (=> (not res!89826) (not e!125098))))

(assert (=> b!190058 (= res!89826 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun c!34158 () Bool)

(declare-fun call!19165 () ListLongMap!2383)

(declare-fun call!19161 () ListLongMap!2383)

(declare-fun c!34153 () Bool)

(declare-fun bm!19160 () Bool)

(assert (=> bm!19160 (= call!19165 (+!299 (ite c!34158 call!19162 (ite c!34153 call!19163 call!19161)) (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun b!190059 () Bool)

(declare-fun e!125094 () Bool)

(declare-fun lt!94104 () ListLongMap!2383)

(declare-fun apply!179 (ListLongMap!2383 (_ BitVec 64)) V!5561)

(declare-fun get!2192 (ValueCell!1874 V!5561) V!5561)

(declare-fun dynLambda!513 (Int (_ BitVec 64)) V!5561)

(assert (=> b!190059 (= e!125094 (= (apply!179 lt!94104 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (get!2192 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4130 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))))))))

(assert (=> b!190059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun bm!19161 () Bool)

(declare-fun call!19167 () Bool)

(assert (=> bm!19161 (= call!19167 (contains!1322 lt!94104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190060 () Bool)

(declare-fun e!125093 () ListLongMap!2383)

(declare-fun call!19164 () ListLongMap!2383)

(assert (=> b!190060 (= e!125093 call!19164)))

(declare-fun b!190061 () Bool)

(declare-fun e!125097 () ListLongMap!2383)

(assert (=> b!190061 (= e!125097 call!19164)))

(declare-fun b!190062 () Bool)

(declare-fun e!125092 () Bool)

(assert (=> b!190062 (= e!125092 (not call!19167))))

(declare-fun bm!19162 () Bool)

(assert (=> bm!19162 (= call!19164 call!19165)))

(declare-fun b!190063 () Bool)

(declare-fun e!125100 () Bool)

(declare-fun e!125102 () Bool)

(assert (=> b!190063 (= e!125100 e!125102)))

(declare-fun res!89827 () Bool)

(declare-fun call!19166 () Bool)

(assert (=> b!190063 (= res!89827 call!19166)))

(assert (=> b!190063 (=> (not res!89827) (not e!125102))))

(declare-fun b!190064 () Bool)

(assert (=> b!190064 (= e!125103 e!125092)))

(declare-fun c!34157 () Bool)

(assert (=> b!190064 (= c!34157 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!55635 () Bool)

(assert (=> d!55635 e!125103))

(declare-fun res!89828 () Bool)

(assert (=> d!55635 (=> (not res!89828) (not e!125103))))

(assert (=> d!55635 (= res!89828 (or (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))))

(declare-fun lt!94114 () ListLongMap!2383)

(assert (=> d!55635 (= lt!94104 lt!94114)))

(declare-fun lt!94108 () Unit!5699)

(declare-fun e!125095 () Unit!5699)

(assert (=> d!55635 (= lt!94108 e!125095)))

(declare-fun c!34156 () Bool)

(declare-fun e!125101 () Bool)

(assert (=> d!55635 (= c!34156 e!125101)))

(declare-fun res!89830 () Bool)

(assert (=> d!55635 (=> (not res!89830) (not e!125101))))

(assert (=> d!55635 (= res!89830 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun e!125096 () ListLongMap!2383)

(assert (=> d!55635 (= lt!94114 e!125096)))

(assert (=> d!55635 (= c!34158 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55635 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55635 (= (getCurrentListMap!840 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94104)))

(declare-fun b!190065 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!190065 (= e!125098 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190066 () Bool)

(assert (=> b!190066 (= e!125096 e!125097)))

(assert (=> b!190066 (= c!34153 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190067 () Bool)

(declare-fun Unit!5704 () Unit!5699)

(assert (=> b!190067 (= e!125095 Unit!5704)))

(declare-fun b!190068 () Bool)

(assert (=> b!190068 (= e!125101 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190069 () Bool)

(declare-fun lt!94117 () Unit!5699)

(assert (=> b!190069 (= e!125095 lt!94117)))

(declare-fun lt!94121 () ListLongMap!2383)

(assert (=> b!190069 (= lt!94121 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94118 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94103 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94103 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94101 () Unit!5699)

(declare-fun addStillContains!155 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5699)

(assert (=> b!190069 (= lt!94101 (addStillContains!155 lt!94121 lt!94118 (zeroValue!3721 thiss!1248) lt!94103))))

(assert (=> b!190069 (contains!1322 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))) lt!94103)))

(declare-fun lt!94120 () Unit!5699)

(assert (=> b!190069 (= lt!94120 lt!94101)))

(declare-fun lt!94122 () ListLongMap!2383)

(assert (=> b!190069 (= lt!94122 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94116 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94116 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94109 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94109 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94119 () Unit!5699)

(declare-fun addApplyDifferent!155 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5699)

(assert (=> b!190069 (= lt!94119 (addApplyDifferent!155 lt!94122 lt!94116 (minValue!3721 thiss!1248) lt!94109))))

(assert (=> b!190069 (= (apply!179 (+!299 lt!94122 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))) lt!94109) (apply!179 lt!94122 lt!94109))))

(declare-fun lt!94111 () Unit!5699)

(assert (=> b!190069 (= lt!94111 lt!94119)))

(declare-fun lt!94113 () ListLongMap!2383)

(assert (=> b!190069 (= lt!94113 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94110 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94102 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94102 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94105 () Unit!5699)

(assert (=> b!190069 (= lt!94105 (addApplyDifferent!155 lt!94113 lt!94110 (zeroValue!3721 thiss!1248) lt!94102))))

(assert (=> b!190069 (= (apply!179 (+!299 lt!94113 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))) lt!94102) (apply!179 lt!94113 lt!94102))))

(declare-fun lt!94112 () Unit!5699)

(assert (=> b!190069 (= lt!94112 lt!94105)))

(declare-fun lt!94115 () ListLongMap!2383)

(assert (=> b!190069 (= lt!94115 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94107 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94107 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94106 () (_ BitVec 64))

(assert (=> b!190069 (= lt!94106 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190069 (= lt!94117 (addApplyDifferent!155 lt!94115 lt!94107 (minValue!3721 thiss!1248) lt!94106))))

(assert (=> b!190069 (= (apply!179 (+!299 lt!94115 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))) lt!94106) (apply!179 lt!94115 lt!94106))))

(declare-fun b!190070 () Bool)

(assert (=> b!190070 (= e!125093 call!19161)))

(declare-fun bm!19163 () Bool)

(assert (=> bm!19163 (= call!19161 call!19163)))

(declare-fun b!190071 () Bool)

(assert (=> b!190071 (= e!125096 (+!299 call!19165 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(declare-fun b!190072 () Bool)

(declare-fun e!125099 () Bool)

(assert (=> b!190072 (= e!125092 e!125099)))

(declare-fun res!89829 () Bool)

(assert (=> b!190072 (= res!89829 call!19167)))

(assert (=> b!190072 (=> (not res!89829) (not e!125099))))

(declare-fun b!190073 () Bool)

(declare-fun c!34154 () Bool)

(assert (=> b!190073 (= c!34154 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190073 (= e!125097 e!125093)))

(declare-fun b!190074 () Bool)

(assert (=> b!190074 (= e!125102 (= (apply!179 lt!94104 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3721 thiss!1248)))))

(declare-fun b!190075 () Bool)

(declare-fun res!89832 () Bool)

(assert (=> b!190075 (=> (not res!89832) (not e!125103))))

(assert (=> b!190075 (= res!89832 e!125100)))

(declare-fun c!34155 () Bool)

(assert (=> b!190075 (= c!34155 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190076 () Bool)

(assert (=> b!190076 (= e!125099 (= (apply!179 lt!94104 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3721 thiss!1248)))))

(declare-fun b!190077 () Bool)

(assert (=> b!190077 (= e!125100 (not call!19166))))

(declare-fun bm!19164 () Bool)

(assert (=> bm!19164 (= call!19166 (contains!1322 lt!94104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190078 () Bool)

(assert (=> b!190078 (= e!125091 e!125094)))

(declare-fun res!89834 () Bool)

(assert (=> b!190078 (=> (not res!89834) (not e!125094))))

(assert (=> b!190078 (= res!89834 (contains!1322 lt!94104 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (= (and d!55635 c!34158) b!190071))

(assert (= (and d!55635 (not c!34158)) b!190066))

(assert (= (and b!190066 c!34153) b!190061))

(assert (= (and b!190066 (not c!34153)) b!190073))

(assert (= (and b!190073 c!34154) b!190060))

(assert (= (and b!190073 (not c!34154)) b!190070))

(assert (= (or b!190060 b!190070) bm!19163))

(assert (= (or b!190061 bm!19163) bm!19158))

(assert (= (or b!190061 b!190060) bm!19162))

(assert (= (or b!190071 bm!19158) bm!19159))

(assert (= (or b!190071 bm!19162) bm!19160))

(assert (= (and d!55635 res!89830) b!190068))

(assert (= (and d!55635 c!34156) b!190069))

(assert (= (and d!55635 (not c!34156)) b!190067))

(assert (= (and d!55635 res!89828) b!190058))

(assert (= (and b!190058 res!89826) b!190065))

(assert (= (and b!190058 (not res!89833)) b!190078))

(assert (= (and b!190078 res!89834) b!190059))

(assert (= (and b!190058 res!89831) b!190075))

(assert (= (and b!190075 c!34155) b!190063))

(assert (= (and b!190075 (not c!34155)) b!190077))

(assert (= (and b!190063 res!89827) b!190074))

(assert (= (or b!190063 b!190077) bm!19164))

(assert (= (and b!190075 res!89832) b!190064))

(assert (= (and b!190064 c!34157) b!190072))

(assert (= (and b!190064 (not c!34157)) b!190062))

(assert (= (and b!190072 res!89829) b!190076))

(assert (= (or b!190072 b!190062) bm!19161))

(declare-fun b_lambda!7325 () Bool)

(assert (=> (not b_lambda!7325) (not b!190059)))

(declare-fun t!7298 () Bool)

(declare-fun tb!2861 () Bool)

(assert (=> (and b!189916 (= (defaultEntry!3880 thiss!1248) (defaultEntry!3880 thiss!1248)) t!7298) tb!2861))

(declare-fun result!4877 () Bool)

(assert (=> tb!2861 (= result!4877 tp_is_empty!4435)))

(assert (=> b!190059 t!7298))

(declare-fun b_and!11289 () Bool)

(assert (= b_and!11283 (and (=> t!7298 result!4877) b_and!11289)))

(declare-fun m!215893 () Bool)

(assert (=> b!190078 m!215893))

(assert (=> b!190078 m!215893))

(declare-fun m!215895 () Bool)

(assert (=> b!190078 m!215895))

(declare-fun m!215897 () Bool)

(assert (=> b!190071 m!215897))

(assert (=> d!55635 m!215779))

(assert (=> b!190065 m!215893))

(assert (=> b!190065 m!215893))

(declare-fun m!215899 () Bool)

(assert (=> b!190065 m!215899))

(declare-fun m!215901 () Bool)

(assert (=> b!190069 m!215901))

(declare-fun m!215903 () Bool)

(assert (=> b!190069 m!215903))

(declare-fun m!215905 () Bool)

(assert (=> b!190069 m!215905))

(declare-fun m!215907 () Bool)

(assert (=> b!190069 m!215907))

(declare-fun m!215909 () Bool)

(assert (=> b!190069 m!215909))

(declare-fun m!215911 () Bool)

(assert (=> b!190069 m!215911))

(assert (=> b!190069 m!215911))

(declare-fun m!215913 () Bool)

(assert (=> b!190069 m!215913))

(declare-fun m!215915 () Bool)

(assert (=> b!190069 m!215915))

(assert (=> b!190069 m!215915))

(declare-fun m!215917 () Bool)

(assert (=> b!190069 m!215917))

(declare-fun m!215919 () Bool)

(assert (=> b!190069 m!215919))

(assert (=> b!190069 m!215893))

(declare-fun m!215921 () Bool)

(assert (=> b!190069 m!215921))

(declare-fun m!215923 () Bool)

(assert (=> b!190069 m!215923))

(declare-fun m!215925 () Bool)

(assert (=> b!190069 m!215925))

(declare-fun m!215927 () Bool)

(assert (=> b!190069 m!215927))

(assert (=> b!190069 m!215909))

(declare-fun m!215929 () Bool)

(assert (=> b!190069 m!215929))

(assert (=> b!190069 m!215923))

(declare-fun m!215931 () Bool)

(assert (=> b!190069 m!215931))

(declare-fun m!215933 () Bool)

(assert (=> bm!19164 m!215933))

(assert (=> b!190068 m!215893))

(assert (=> b!190068 m!215893))

(assert (=> b!190068 m!215899))

(declare-fun m!215935 () Bool)

(assert (=> bm!19160 m!215935))

(declare-fun m!215937 () Bool)

(assert (=> b!190059 m!215937))

(declare-fun m!215939 () Bool)

(assert (=> b!190059 m!215939))

(declare-fun m!215941 () Bool)

(assert (=> b!190059 m!215941))

(assert (=> b!190059 m!215937))

(assert (=> b!190059 m!215939))

(assert (=> b!190059 m!215893))

(declare-fun m!215943 () Bool)

(assert (=> b!190059 m!215943))

(assert (=> b!190059 m!215893))

(assert (=> bm!19159 m!215905))

(declare-fun m!215945 () Bool)

(assert (=> bm!19161 m!215945))

(declare-fun m!215947 () Bool)

(assert (=> b!190076 m!215947))

(declare-fun m!215949 () Bool)

(assert (=> b!190074 m!215949))

(assert (=> b!189913 d!55635))

(declare-fun bm!19165 () Bool)

(declare-fun call!19170 () ListLongMap!2383)

(declare-fun call!19169 () ListLongMap!2383)

(assert (=> bm!19165 (= call!19170 call!19169)))

(declare-fun bm!19166 () Bool)

(assert (=> bm!19166 (= call!19169 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190081 () Bool)

(declare-fun res!89840 () Bool)

(declare-fun e!125116 () Bool)

(assert (=> b!190081 (=> (not res!89840) (not e!125116))))

(declare-fun e!125104 () Bool)

(assert (=> b!190081 (= res!89840 e!125104)))

(declare-fun res!89842 () Bool)

(assert (=> b!190081 (=> res!89842 e!125104)))

(declare-fun e!125111 () Bool)

(assert (=> b!190081 (= res!89842 (not e!125111))))

(declare-fun res!89835 () Bool)

(assert (=> b!190081 (=> (not res!89835) (not e!125111))))

(assert (=> b!190081 (= res!89835 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun c!34159 () Bool)

(declare-fun bm!19167 () Bool)

(declare-fun call!19168 () ListLongMap!2383)

(declare-fun call!19172 () ListLongMap!2383)

(declare-fun c!34164 () Bool)

(assert (=> bm!19167 (= call!19172 (+!299 (ite c!34164 call!19169 (ite c!34159 call!19170 call!19168)) (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun b!190082 () Bool)

(declare-fun e!125107 () Bool)

(declare-fun lt!94126 () ListLongMap!2383)

(assert (=> b!190082 (= e!125107 (= (apply!179 lt!94126 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (get!2192 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4130 (_values!3863 thiss!1248))))))

(assert (=> b!190082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun bm!19168 () Bool)

(declare-fun call!19174 () Bool)

(assert (=> bm!19168 (= call!19174 (contains!1322 lt!94126 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190083 () Bool)

(declare-fun e!125106 () ListLongMap!2383)

(declare-fun call!19171 () ListLongMap!2383)

(assert (=> b!190083 (= e!125106 call!19171)))

(declare-fun b!190084 () Bool)

(declare-fun e!125110 () ListLongMap!2383)

(assert (=> b!190084 (= e!125110 call!19171)))

(declare-fun b!190085 () Bool)

(declare-fun e!125105 () Bool)

(assert (=> b!190085 (= e!125105 (not call!19174))))

(declare-fun bm!19169 () Bool)

(assert (=> bm!19169 (= call!19171 call!19172)))

(declare-fun b!190086 () Bool)

(declare-fun e!125113 () Bool)

(declare-fun e!125115 () Bool)

(assert (=> b!190086 (= e!125113 e!125115)))

(declare-fun res!89836 () Bool)

(declare-fun call!19173 () Bool)

(assert (=> b!190086 (= res!89836 call!19173)))

(assert (=> b!190086 (=> (not res!89836) (not e!125115))))

(declare-fun b!190087 () Bool)

(assert (=> b!190087 (= e!125116 e!125105)))

(declare-fun c!34163 () Bool)

(assert (=> b!190087 (= c!34163 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!55637 () Bool)

(assert (=> d!55637 e!125116))

(declare-fun res!89837 () Bool)

(assert (=> d!55637 (=> (not res!89837) (not e!125116))))

(assert (=> d!55637 (= res!89837 (or (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))))

(declare-fun lt!94136 () ListLongMap!2383)

(assert (=> d!55637 (= lt!94126 lt!94136)))

(declare-fun lt!94130 () Unit!5699)

(declare-fun e!125108 () Unit!5699)

(assert (=> d!55637 (= lt!94130 e!125108)))

(declare-fun c!34162 () Bool)

(declare-fun e!125114 () Bool)

(assert (=> d!55637 (= c!34162 e!125114)))

(declare-fun res!89839 () Bool)

(assert (=> d!55637 (=> (not res!89839) (not e!125114))))

(assert (=> d!55637 (= res!89839 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun e!125109 () ListLongMap!2383)

(assert (=> d!55637 (= lt!94136 e!125109)))

(assert (=> d!55637 (= c!34164 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55637 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55637 (= (getCurrentListMap!840 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94126)))

(declare-fun b!190088 () Bool)

(assert (=> b!190088 (= e!125111 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190089 () Bool)

(assert (=> b!190089 (= e!125109 e!125110)))

(assert (=> b!190089 (= c!34159 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190090 () Bool)

(declare-fun Unit!5705 () Unit!5699)

(assert (=> b!190090 (= e!125108 Unit!5705)))

(declare-fun b!190091 () Bool)

(assert (=> b!190091 (= e!125114 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190092 () Bool)

(declare-fun lt!94139 () Unit!5699)

(assert (=> b!190092 (= e!125108 lt!94139)))

(declare-fun lt!94143 () ListLongMap!2383)

(assert (=> b!190092 (= lt!94143 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94140 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94125 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94125 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94123 () Unit!5699)

(assert (=> b!190092 (= lt!94123 (addStillContains!155 lt!94143 lt!94140 (zeroValue!3721 thiss!1248) lt!94125))))

(assert (=> b!190092 (contains!1322 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))) lt!94125)))

(declare-fun lt!94142 () Unit!5699)

(assert (=> b!190092 (= lt!94142 lt!94123)))

(declare-fun lt!94144 () ListLongMap!2383)

(assert (=> b!190092 (= lt!94144 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94138 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94138 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94131 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94131 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94141 () Unit!5699)

(assert (=> b!190092 (= lt!94141 (addApplyDifferent!155 lt!94144 lt!94138 (minValue!3721 thiss!1248) lt!94131))))

(assert (=> b!190092 (= (apply!179 (+!299 lt!94144 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))) lt!94131) (apply!179 lt!94144 lt!94131))))

(declare-fun lt!94133 () Unit!5699)

(assert (=> b!190092 (= lt!94133 lt!94141)))

(declare-fun lt!94135 () ListLongMap!2383)

(assert (=> b!190092 (= lt!94135 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94132 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94124 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94124 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94127 () Unit!5699)

(assert (=> b!190092 (= lt!94127 (addApplyDifferent!155 lt!94135 lt!94132 (zeroValue!3721 thiss!1248) lt!94124))))

(assert (=> b!190092 (= (apply!179 (+!299 lt!94135 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))) lt!94124) (apply!179 lt!94135 lt!94124))))

(declare-fun lt!94134 () Unit!5699)

(assert (=> b!190092 (= lt!94134 lt!94127)))

(declare-fun lt!94137 () ListLongMap!2383)

(assert (=> b!190092 (= lt!94137 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94129 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94129 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94128 () (_ BitVec 64))

(assert (=> b!190092 (= lt!94128 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190092 (= lt!94139 (addApplyDifferent!155 lt!94137 lt!94129 (minValue!3721 thiss!1248) lt!94128))))

(assert (=> b!190092 (= (apply!179 (+!299 lt!94137 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))) lt!94128) (apply!179 lt!94137 lt!94128))))

(declare-fun b!190093 () Bool)

(assert (=> b!190093 (= e!125106 call!19168)))

(declare-fun bm!19170 () Bool)

(assert (=> bm!19170 (= call!19168 call!19170)))

(declare-fun b!190094 () Bool)

(assert (=> b!190094 (= e!125109 (+!299 call!19172 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(declare-fun b!190095 () Bool)

(declare-fun e!125112 () Bool)

(assert (=> b!190095 (= e!125105 e!125112)))

(declare-fun res!89838 () Bool)

(assert (=> b!190095 (= res!89838 call!19174)))

(assert (=> b!190095 (=> (not res!89838) (not e!125112))))

(declare-fun b!190096 () Bool)

(declare-fun c!34160 () Bool)

(assert (=> b!190096 (= c!34160 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190096 (= e!125110 e!125106)))

(declare-fun b!190097 () Bool)

(assert (=> b!190097 (= e!125115 (= (apply!179 lt!94126 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3721 thiss!1248)))))

(declare-fun b!190098 () Bool)

(declare-fun res!89841 () Bool)

(assert (=> b!190098 (=> (not res!89841) (not e!125116))))

(assert (=> b!190098 (= res!89841 e!125113)))

(declare-fun c!34161 () Bool)

(assert (=> b!190098 (= c!34161 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190099 () Bool)

(assert (=> b!190099 (= e!125112 (= (apply!179 lt!94126 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3721 thiss!1248)))))

(declare-fun b!190100 () Bool)

(assert (=> b!190100 (= e!125113 (not call!19173))))

(declare-fun bm!19171 () Bool)

(assert (=> bm!19171 (= call!19173 (contains!1322 lt!94126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190101 () Bool)

(assert (=> b!190101 (= e!125104 e!125107)))

(declare-fun res!89843 () Bool)

(assert (=> b!190101 (=> (not res!89843) (not e!125107))))

(assert (=> b!190101 (= res!89843 (contains!1322 lt!94126 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (= (and d!55637 c!34164) b!190094))

(assert (= (and d!55637 (not c!34164)) b!190089))

(assert (= (and b!190089 c!34159) b!190084))

(assert (= (and b!190089 (not c!34159)) b!190096))

(assert (= (and b!190096 c!34160) b!190083))

(assert (= (and b!190096 (not c!34160)) b!190093))

(assert (= (or b!190083 b!190093) bm!19170))

(assert (= (or b!190084 bm!19170) bm!19165))

(assert (= (or b!190084 b!190083) bm!19169))

(assert (= (or b!190094 bm!19165) bm!19166))

(assert (= (or b!190094 bm!19169) bm!19167))

(assert (= (and d!55637 res!89839) b!190091))

(assert (= (and d!55637 c!34162) b!190092))

(assert (= (and d!55637 (not c!34162)) b!190090))

(assert (= (and d!55637 res!89837) b!190081))

(assert (= (and b!190081 res!89835) b!190088))

(assert (= (and b!190081 (not res!89842)) b!190101))

(assert (= (and b!190101 res!89843) b!190082))

(assert (= (and b!190081 res!89840) b!190098))

(assert (= (and b!190098 c!34161) b!190086))

(assert (= (and b!190098 (not c!34161)) b!190100))

(assert (= (and b!190086 res!89836) b!190097))

(assert (= (or b!190086 b!190100) bm!19171))

(assert (= (and b!190098 res!89841) b!190087))

(assert (= (and b!190087 c!34163) b!190095))

(assert (= (and b!190087 (not c!34163)) b!190085))

(assert (= (and b!190095 res!89838) b!190099))

(assert (= (or b!190095 b!190085) bm!19168))

(declare-fun b_lambda!7327 () Bool)

(assert (=> (not b_lambda!7327) (not b!190082)))

(assert (=> b!190082 t!7298))

(declare-fun b_and!11291 () Bool)

(assert (= b_and!11289 (and (=> t!7298 result!4877) b_and!11291)))

(assert (=> b!190101 m!215893))

(assert (=> b!190101 m!215893))

(declare-fun m!215951 () Bool)

(assert (=> b!190101 m!215951))

(declare-fun m!215953 () Bool)

(assert (=> b!190094 m!215953))

(assert (=> d!55637 m!215779))

(assert (=> b!190088 m!215893))

(assert (=> b!190088 m!215893))

(assert (=> b!190088 m!215899))

(declare-fun m!215955 () Bool)

(assert (=> b!190092 m!215955))

(declare-fun m!215957 () Bool)

(assert (=> b!190092 m!215957))

(declare-fun m!215959 () Bool)

(assert (=> b!190092 m!215959))

(declare-fun m!215961 () Bool)

(assert (=> b!190092 m!215961))

(declare-fun m!215963 () Bool)

(assert (=> b!190092 m!215963))

(declare-fun m!215965 () Bool)

(assert (=> b!190092 m!215965))

(assert (=> b!190092 m!215965))

(declare-fun m!215967 () Bool)

(assert (=> b!190092 m!215967))

(declare-fun m!215969 () Bool)

(assert (=> b!190092 m!215969))

(assert (=> b!190092 m!215969))

(declare-fun m!215971 () Bool)

(assert (=> b!190092 m!215971))

(declare-fun m!215973 () Bool)

(assert (=> b!190092 m!215973))

(assert (=> b!190092 m!215893))

(declare-fun m!215975 () Bool)

(assert (=> b!190092 m!215975))

(declare-fun m!215977 () Bool)

(assert (=> b!190092 m!215977))

(declare-fun m!215979 () Bool)

(assert (=> b!190092 m!215979))

(declare-fun m!215981 () Bool)

(assert (=> b!190092 m!215981))

(assert (=> b!190092 m!215963))

(declare-fun m!215983 () Bool)

(assert (=> b!190092 m!215983))

(assert (=> b!190092 m!215977))

(declare-fun m!215985 () Bool)

(assert (=> b!190092 m!215985))

(declare-fun m!215987 () Bool)

(assert (=> bm!19171 m!215987))

(assert (=> b!190091 m!215893))

(assert (=> b!190091 m!215893))

(assert (=> b!190091 m!215899))

(declare-fun m!215989 () Bool)

(assert (=> bm!19167 m!215989))

(declare-fun m!215991 () Bool)

(assert (=> b!190082 m!215991))

(assert (=> b!190082 m!215939))

(declare-fun m!215993 () Bool)

(assert (=> b!190082 m!215993))

(assert (=> b!190082 m!215991))

(assert (=> b!190082 m!215939))

(assert (=> b!190082 m!215893))

(declare-fun m!215995 () Bool)

(assert (=> b!190082 m!215995))

(assert (=> b!190082 m!215893))

(assert (=> bm!19166 m!215959))

(declare-fun m!215997 () Bool)

(assert (=> bm!19168 m!215997))

(declare-fun m!215999 () Bool)

(assert (=> b!190099 m!215999))

(declare-fun m!216001 () Bool)

(assert (=> b!190097 m!216001))

(assert (=> b!189913 d!55637))

(declare-fun d!55639 () Bool)

(declare-fun e!125122 () Bool)

(assert (=> d!55639 e!125122))

(declare-fun res!89846 () Bool)

(assert (=> d!55639 (=> res!89846 e!125122)))

(declare-fun lt!94154 () Bool)

(assert (=> d!55639 (= res!89846 (not lt!94154))))

(declare-fun lt!94155 () Bool)

(assert (=> d!55639 (= lt!94154 lt!94155)))

(declare-fun lt!94153 () Unit!5699)

(declare-fun e!125121 () Unit!5699)

(assert (=> d!55639 (= lt!94153 e!125121)))

(declare-fun c!34167 () Bool)

(assert (=> d!55639 (= c!34167 lt!94155)))

(declare-fun containsKey!238 (List!2397 (_ BitVec 64)) Bool)

(assert (=> d!55639 (= lt!94155 (containsKey!238 (toList!1207 lt!93986) key!828))))

(assert (=> d!55639 (= (contains!1322 lt!93986 key!828) lt!94154)))

(declare-fun b!190108 () Bool)

(declare-fun lt!94156 () Unit!5699)

(assert (=> b!190108 (= e!125121 lt!94156)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!187 (List!2397 (_ BitVec 64)) Unit!5699)

(assert (=> b!190108 (= lt!94156 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!93986) key!828))))

(declare-fun isDefined!188 (Option!240) Bool)

(assert (=> b!190108 (isDefined!188 (getValueByKey!234 (toList!1207 lt!93986) key!828))))

(declare-fun b!190109 () Bool)

(declare-fun Unit!5706 () Unit!5699)

(assert (=> b!190109 (= e!125121 Unit!5706)))

(declare-fun b!190110 () Bool)

(assert (=> b!190110 (= e!125122 (isDefined!188 (getValueByKey!234 (toList!1207 lt!93986) key!828)))))

(assert (= (and d!55639 c!34167) b!190108))

(assert (= (and d!55639 (not c!34167)) b!190109))

(assert (= (and d!55639 (not res!89846)) b!190110))

(declare-fun m!216003 () Bool)

(assert (=> d!55639 m!216003))

(declare-fun m!216005 () Bool)

(assert (=> b!190108 m!216005))

(declare-fun m!216007 () Bool)

(assert (=> b!190108 m!216007))

(assert (=> b!190108 m!216007))

(declare-fun m!216009 () Bool)

(assert (=> b!190108 m!216009))

(assert (=> b!190110 m!216007))

(assert (=> b!190110 m!216007))

(assert (=> b!190110 m!216009))

(assert (=> b!189913 d!55639))

(declare-fun d!55641 () Bool)

(declare-fun res!89853 () Bool)

(declare-fun e!125125 () Bool)

(assert (=> d!55641 (=> (not res!89853) (not e!125125))))

(declare-fun simpleValid!195 (LongMapFixedSize!2656) Bool)

(assert (=> d!55641 (= res!89853 (simpleValid!195 thiss!1248))))

(assert (=> d!55641 (= (valid!1110 thiss!1248) e!125125)))

(declare-fun b!190117 () Bool)

(declare-fun res!89854 () Bool)

(assert (=> b!190117 (=> (not res!89854) (not e!125125))))

(declare-fun arrayCountValidKeys!0 (array!8083 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190117 (= res!89854 (= (arrayCountValidKeys!0 (_keys!5848 thiss!1248) #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))) (_size!1377 thiss!1248)))))

(declare-fun b!190118 () Bool)

(declare-fun res!89855 () Bool)

(assert (=> b!190118 (=> (not res!89855) (not e!125125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8083 (_ BitVec 32)) Bool)

(assert (=> b!190118 (= res!89855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun b!190119 () Bool)

(declare-datatypes ((List!2398 0))(
  ( (Nil!2395) (Cons!2394 (h!3031 (_ BitVec 64)) (t!7299 List!2398)) )
))
(declare-fun arrayNoDuplicates!0 (array!8083 (_ BitVec 32) List!2398) Bool)

(assert (=> b!190119 (= e!125125 (arrayNoDuplicates!0 (_keys!5848 thiss!1248) #b00000000000000000000000000000000 Nil!2395))))

(assert (= (and d!55641 res!89853) b!190117))

(assert (= (and b!190117 res!89854) b!190118))

(assert (= (and b!190118 res!89855) b!190119))

(declare-fun m!216011 () Bool)

(assert (=> d!55641 m!216011))

(declare-fun m!216013 () Bool)

(assert (=> b!190117 m!216013))

(declare-fun m!216015 () Bool)

(assert (=> b!190118 m!216015))

(declare-fun m!216017 () Bool)

(assert (=> b!190119 m!216017))

(assert (=> start!19322 d!55641))

(declare-fun d!55643 () Bool)

(assert (=> d!55643 (= (array_inv!2469 (_keys!5848 thiss!1248)) (bvsge (size!4129 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189916 d!55643))

(declare-fun d!55645 () Bool)

(assert (=> d!55645 (= (array_inv!2470 (_values!3863 thiss!1248)) (bvsge (size!4130 (_values!3863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189916 d!55645))

(declare-fun bm!19176 () Bool)

(declare-fun call!19179 () Bool)

(declare-fun arrayContainsKey!0 (array!8083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19176 (= call!19179 (arrayContainsKey!0 (_keys!5848 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190136 () Bool)

(declare-fun e!125134 () Bool)

(declare-fun e!125135 () Bool)

(assert (=> b!190136 (= e!125134 e!125135)))

(declare-fun c!34173 () Bool)

(declare-fun lt!94162 () SeekEntryResult!675)

(assert (=> b!190136 (= c!34173 ((_ is MissingVacant!675) lt!94162))))

(declare-fun b!190137 () Bool)

(declare-fun e!125137 () Bool)

(assert (=> b!190137 (= e!125134 e!125137)))

(declare-fun res!89865 () Bool)

(declare-fun call!19180 () Bool)

(assert (=> b!190137 (= res!89865 call!19180)))

(assert (=> b!190137 (=> (not res!89865) (not e!125137))))

(declare-fun b!190138 () Bool)

(declare-fun res!89867 () Bool)

(declare-fun e!125136 () Bool)

(assert (=> b!190138 (=> (not res!89867) (not e!125136))))

(assert (=> b!190138 (= res!89867 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4873 lt!94162)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190138 (and (bvsge (index!4873 lt!94162) #b00000000000000000000000000000000) (bvslt (index!4873 lt!94162) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190140 () Bool)

(declare-fun res!89866 () Bool)

(assert (=> b!190140 (=> (not res!89866) (not e!125136))))

(assert (=> b!190140 (= res!89866 call!19180)))

(assert (=> b!190140 (= e!125135 e!125136)))

(declare-fun b!190141 () Bool)

(assert (=> b!190141 (= e!125137 (not call!19179))))

(declare-fun c!34172 () Bool)

(declare-fun bm!19177 () Bool)

(assert (=> bm!19177 (= call!19180 (inRange!0 (ite c!34172 (index!4870 lt!94162) (index!4873 lt!94162)) (mask!9077 thiss!1248)))))

(declare-fun b!190139 () Bool)

(assert (=> b!190139 (= e!125135 ((_ is Undefined!675) lt!94162))))

(declare-fun d!55647 () Bool)

(assert (=> d!55647 e!125134))

(assert (=> d!55647 (= c!34172 ((_ is MissingZero!675) lt!94162))))

(assert (=> d!55647 (= lt!94162 (seekEntryOrOpen!0 key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun lt!94161 () Unit!5699)

(declare-fun choose!1029 (array!8083 array!8085 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5699)

(assert (=> d!55647 (= lt!94161 (choose!1029 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55647 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55647 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!165 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) lt!94161)))

(declare-fun b!190142 () Bool)

(assert (=> b!190142 (and (bvsge (index!4870 lt!94162) #b00000000000000000000000000000000) (bvslt (index!4870 lt!94162) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun res!89864 () Bool)

(assert (=> b!190142 (= res!89864 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4870 lt!94162)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190142 (=> (not res!89864) (not e!125137))))

(declare-fun b!190143 () Bool)

(assert (=> b!190143 (= e!125136 (not call!19179))))

(assert (= (and d!55647 c!34172) b!190137))

(assert (= (and d!55647 (not c!34172)) b!190136))

(assert (= (and b!190137 res!89865) b!190142))

(assert (= (and b!190142 res!89864) b!190141))

(assert (= (and b!190136 c!34173) b!190140))

(assert (= (and b!190136 (not c!34173)) b!190139))

(assert (= (and b!190140 res!89866) b!190138))

(assert (= (and b!190138 res!89867) b!190143))

(assert (= (or b!190137 b!190140) bm!19177))

(assert (= (or b!190141 b!190143) bm!19176))

(assert (=> d!55647 m!215781))

(declare-fun m!216019 () Bool)

(assert (=> d!55647 m!216019))

(assert (=> d!55647 m!215779))

(declare-fun m!216021 () Bool)

(assert (=> b!190142 m!216021))

(declare-fun m!216023 () Bool)

(assert (=> bm!19177 m!216023))

(declare-fun m!216025 () Bool)

(assert (=> bm!19176 m!216025))

(declare-fun m!216027 () Bool)

(assert (=> b!190138 m!216027))

(assert (=> b!189912 d!55647))

(declare-fun mapIsEmpty!7663 () Bool)

(declare-fun mapRes!7663 () Bool)

(assert (=> mapIsEmpty!7663 mapRes!7663))

(declare-fun condMapEmpty!7663 () Bool)

(declare-fun mapDefault!7663 () ValueCell!1874)

(assert (=> mapNonEmpty!7654 (= condMapEmpty!7663 (= mapRest!7654 ((as const (Array (_ BitVec 32) ValueCell!1874)) mapDefault!7663)))))

(declare-fun e!125143 () Bool)

(assert (=> mapNonEmpty!7654 (= tp!16828 (and e!125143 mapRes!7663))))

(declare-fun b!190150 () Bool)

(declare-fun e!125142 () Bool)

(assert (=> b!190150 (= e!125142 tp_is_empty!4435)))

(declare-fun b!190151 () Bool)

(assert (=> b!190151 (= e!125143 tp_is_empty!4435)))

(declare-fun mapNonEmpty!7663 () Bool)

(declare-fun tp!16843 () Bool)

(assert (=> mapNonEmpty!7663 (= mapRes!7663 (and tp!16843 e!125142))))

(declare-fun mapKey!7663 () (_ BitVec 32))

(declare-fun mapRest!7663 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapValue!7663 () ValueCell!1874)

(assert (=> mapNonEmpty!7663 (= mapRest!7654 (store mapRest!7663 mapKey!7663 mapValue!7663))))

(assert (= (and mapNonEmpty!7654 condMapEmpty!7663) mapIsEmpty!7663))

(assert (= (and mapNonEmpty!7654 (not condMapEmpty!7663)) mapNonEmpty!7663))

(assert (= (and mapNonEmpty!7663 ((_ is ValueCellFull!1874) mapValue!7663)) b!190150))

(assert (= (and mapNonEmpty!7654 ((_ is ValueCellFull!1874) mapDefault!7663)) b!190151))

(declare-fun m!216029 () Bool)

(assert (=> mapNonEmpty!7663 m!216029))

(declare-fun b_lambda!7329 () Bool)

(assert (= b_lambda!7325 (or (and b!189916 b_free!4663) b_lambda!7329)))

(declare-fun b_lambda!7331 () Bool)

(assert (= b_lambda!7327 (or (and b!189916 b_free!4663) b_lambda!7331)))

(check-sat b_and!11291 (not d!55631) (not bm!19176) (not d!55641) (not bm!19177) (not b!190092) (not b!189987) (not d!55647) (not b!190065) (not b!190118) (not b!190091) (not b!190082) (not d!55635) (not b!190078) (not b!190097) tp_is_empty!4435 (not b!190119) (not d!55627) (not bm!19160) (not b!190069) (not b!190014) (not d!55633) (not b!190015) (not b!190101) (not d!55623) (not b!190108) (not b!190074) (not b!190004) (not b!190110) (not b_lambda!7329) (not d!55639) (not b!190094) (not bm!19171) (not b!190009) (not b!190059) (not b!190068) (not bm!19161) (not b!190071) (not d!55637) (not bm!19167) (not b!190076) (not bm!19164) (not bm!19166) (not bm!19159) (not mapNonEmpty!7663) (not b!190099) (not b_lambda!7331) (not b!190088) (not b_next!4663) (not bm!19168) (not b!190117))
(check-sat b_and!11291 (not b_next!4663))
(get-model)

(declare-fun d!55649 () Bool)

(declare-fun e!125144 () Bool)

(assert (=> d!55649 e!125144))

(declare-fun res!89869 () Bool)

(assert (=> d!55649 (=> (not res!89869) (not e!125144))))

(declare-fun lt!94164 () ListLongMap!2383)

(assert (=> d!55649 (= res!89869 (contains!1322 lt!94164 (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun lt!94166 () List!2397)

(assert (=> d!55649 (= lt!94164 (ListLongMap!2384 lt!94166))))

(declare-fun lt!94163 () Unit!5699)

(declare-fun lt!94165 () Unit!5699)

(assert (=> d!55649 (= lt!94163 lt!94165)))

(assert (=> d!55649 (= (getValueByKey!234 lt!94166 (_1!1748 (tuple2!3475 key!828 v!309))) (Some!239 (_2!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> d!55649 (= lt!94165 (lemmaContainsTupThenGetReturnValue!124 lt!94166 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> d!55649 (= lt!94166 (insertStrictlySorted!127 (toList!1207 (getCurrentListMap!840 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248))) (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> d!55649 (= (+!299 (getCurrentListMap!840 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) (tuple2!3475 key!828 v!309)) lt!94164)))

(declare-fun b!190152 () Bool)

(declare-fun res!89868 () Bool)

(assert (=> b!190152 (=> (not res!89868) (not e!125144))))

(assert (=> b!190152 (= res!89868 (= (getValueByKey!234 (toList!1207 lt!94164) (_1!1748 (tuple2!3475 key!828 v!309))) (Some!239 (_2!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun b!190153 () Bool)

(assert (=> b!190153 (= e!125144 (contains!1323 (toList!1207 lt!94164) (tuple2!3475 key!828 v!309)))))

(assert (= (and d!55649 res!89869) b!190152))

(assert (= (and b!190152 res!89868) b!190153))

(declare-fun m!216031 () Bool)

(assert (=> d!55649 m!216031))

(declare-fun m!216033 () Bool)

(assert (=> d!55649 m!216033))

(declare-fun m!216035 () Bool)

(assert (=> d!55649 m!216035))

(declare-fun m!216037 () Bool)

(assert (=> d!55649 m!216037))

(declare-fun m!216039 () Bool)

(assert (=> b!190152 m!216039))

(declare-fun m!216041 () Bool)

(assert (=> b!190153 m!216041))

(assert (=> b!190009 d!55649))

(assert (=> b!190009 d!55637))

(assert (=> b!190009 d!55635))

(declare-fun d!55651 () Bool)

(declare-fun e!125145 () Bool)

(assert (=> d!55651 e!125145))

(declare-fun res!89871 () Bool)

(assert (=> d!55651 (=> (not res!89871) (not e!125145))))

(declare-fun lt!94168 () ListLongMap!2383)

(assert (=> d!55651 (= res!89871 (contains!1322 lt!94168 (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94170 () List!2397)

(assert (=> d!55651 (= lt!94168 (ListLongMap!2384 lt!94170))))

(declare-fun lt!94167 () Unit!5699)

(declare-fun lt!94169 () Unit!5699)

(assert (=> d!55651 (= lt!94167 lt!94169)))

(assert (=> d!55651 (= (getValueByKey!234 lt!94170 (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55651 (= lt!94169 (lemmaContainsTupThenGetReturnValue!124 lt!94170 (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55651 (= lt!94170 (insertStrictlySorted!127 (toList!1207 call!19172) (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55651 (= (+!299 call!19172 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) lt!94168)))

(declare-fun b!190154 () Bool)

(declare-fun res!89870 () Bool)

(assert (=> b!190154 (=> (not res!89870) (not e!125145))))

(assert (=> b!190154 (= res!89870 (= (getValueByKey!234 (toList!1207 lt!94168) (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun b!190155 () Bool)

(assert (=> b!190155 (= e!125145 (contains!1323 (toList!1207 lt!94168) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(assert (= (and d!55651 res!89871) b!190154))

(assert (= (and b!190154 res!89870) b!190155))

(declare-fun m!216043 () Bool)

(assert (=> d!55651 m!216043))

(declare-fun m!216045 () Bool)

(assert (=> d!55651 m!216045))

(declare-fun m!216047 () Bool)

(assert (=> d!55651 m!216047))

(declare-fun m!216049 () Bool)

(assert (=> d!55651 m!216049))

(declare-fun m!216051 () Bool)

(assert (=> b!190154 m!216051))

(declare-fun m!216053 () Bool)

(assert (=> b!190155 m!216053))

(assert (=> b!190094 d!55651))

(declare-fun d!55653 () Bool)

(assert (=> d!55653 (= (+!299 (getCurrentListMap!840 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) (tuple2!3475 key!828 v!309)) (getCurrentListMap!840 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55653 true))

(declare-fun _$5!146 () Unit!5699)

(assert (=> d!55653 (= (choose!1028 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4871 lt!93990) key!828 v!309 (defaultEntry!3880 thiss!1248)) _$5!146)))

(declare-fun bs!7586 () Bool)

(assert (= bs!7586 d!55653))

(assert (=> bs!7586 m!215769))

(assert (=> bs!7586 m!215769))

(assert (=> bs!7586 m!215879))

(assert (=> bs!7586 m!215775))

(assert (=> bs!7586 m!215767))

(assert (=> d!55631 d!55653))

(assert (=> d!55631 d!55629))

(declare-fun d!55655 () Bool)

(declare-fun isEmpty!483 (Option!240) Bool)

(assert (=> d!55655 (= (isDefined!188 (getValueByKey!234 (toList!1207 lt!93986) key!828)) (not (isEmpty!483 (getValueByKey!234 (toList!1207 lt!93986) key!828))))))

(declare-fun bs!7587 () Bool)

(assert (= bs!7587 d!55655))

(assert (=> bs!7587 m!216007))

(declare-fun m!216055 () Bool)

(assert (=> bs!7587 m!216055))

(assert (=> b!190110 d!55655))

(declare-fun d!55657 () Bool)

(declare-fun c!34178 () Bool)

(assert (=> d!55657 (= c!34178 (and ((_ is Cons!2393) (toList!1207 lt!93986)) (= (_1!1748 (h!3030 (toList!1207 lt!93986))) key!828)))))

(declare-fun e!125150 () Option!240)

(assert (=> d!55657 (= (getValueByKey!234 (toList!1207 lt!93986) key!828) e!125150)))

(declare-fun b!190165 () Bool)

(declare-fun e!125151 () Option!240)

(assert (=> b!190165 (= e!125150 e!125151)))

(declare-fun c!34179 () Bool)

(assert (=> b!190165 (= c!34179 (and ((_ is Cons!2393) (toList!1207 lt!93986)) (not (= (_1!1748 (h!3030 (toList!1207 lt!93986))) key!828))))))

(declare-fun b!190166 () Bool)

(assert (=> b!190166 (= e!125151 (getValueByKey!234 (t!7296 (toList!1207 lt!93986)) key!828))))

(declare-fun b!190167 () Bool)

(assert (=> b!190167 (= e!125151 None!238)))

(declare-fun b!190164 () Bool)

(assert (=> b!190164 (= e!125150 (Some!239 (_2!1748 (h!3030 (toList!1207 lt!93986)))))))

(assert (= (and d!55657 c!34178) b!190164))

(assert (= (and d!55657 (not c!34178)) b!190165))

(assert (= (and b!190165 c!34179) b!190166))

(assert (= (and b!190165 (not c!34179)) b!190167))

(declare-fun m!216057 () Bool)

(assert (=> b!190166 m!216057))

(assert (=> b!190110 d!55657))

(declare-fun d!55659 () Bool)

(declare-fun e!125153 () Bool)

(assert (=> d!55659 e!125153))

(declare-fun res!89872 () Bool)

(assert (=> d!55659 (=> res!89872 e!125153)))

(declare-fun lt!94172 () Bool)

(assert (=> d!55659 (= res!89872 (not lt!94172))))

(declare-fun lt!94173 () Bool)

(assert (=> d!55659 (= lt!94172 lt!94173)))

(declare-fun lt!94171 () Unit!5699)

(declare-fun e!125152 () Unit!5699)

(assert (=> d!55659 (= lt!94171 e!125152)))

(declare-fun c!34180 () Bool)

(assert (=> d!55659 (= c!34180 lt!94173)))

(assert (=> d!55659 (= lt!94173 (containsKey!238 (toList!1207 lt!94104) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55659 (= (contains!1322 lt!94104 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) lt!94172)))

(declare-fun b!190168 () Bool)

(declare-fun lt!94174 () Unit!5699)

(assert (=> b!190168 (= e!125152 lt!94174)))

(assert (=> b!190168 (= lt!94174 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94104) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190168 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94104) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190169 () Bool)

(declare-fun Unit!5707 () Unit!5699)

(assert (=> b!190169 (= e!125152 Unit!5707)))

(declare-fun b!190170 () Bool)

(assert (=> b!190170 (= e!125153 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94104) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55659 c!34180) b!190168))

(assert (= (and d!55659 (not c!34180)) b!190169))

(assert (= (and d!55659 (not res!89872)) b!190170))

(assert (=> d!55659 m!215893))

(declare-fun m!216059 () Bool)

(assert (=> d!55659 m!216059))

(assert (=> b!190168 m!215893))

(declare-fun m!216061 () Bool)

(assert (=> b!190168 m!216061))

(assert (=> b!190168 m!215893))

(declare-fun m!216063 () Bool)

(assert (=> b!190168 m!216063))

(assert (=> b!190168 m!216063))

(declare-fun m!216065 () Bool)

(assert (=> b!190168 m!216065))

(assert (=> b!190170 m!215893))

(assert (=> b!190170 m!216063))

(assert (=> b!190170 m!216063))

(assert (=> b!190170 m!216065))

(assert (=> b!190078 d!55659))

(declare-fun d!55661 () Bool)

(assert (=> d!55661 (= (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190091 d!55661))

(declare-fun d!55663 () Bool)

(declare-fun e!125155 () Bool)

(assert (=> d!55663 e!125155))

(declare-fun res!89873 () Bool)

(assert (=> d!55663 (=> res!89873 e!125155)))

(declare-fun lt!94176 () Bool)

(assert (=> d!55663 (= res!89873 (not lt!94176))))

(declare-fun lt!94177 () Bool)

(assert (=> d!55663 (= lt!94176 lt!94177)))

(declare-fun lt!94175 () Unit!5699)

(declare-fun e!125154 () Unit!5699)

(assert (=> d!55663 (= lt!94175 e!125154)))

(declare-fun c!34181 () Bool)

(assert (=> d!55663 (= c!34181 lt!94177)))

(assert (=> d!55663 (= lt!94177 (containsKey!238 (toList!1207 lt!94104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55663 (= (contains!1322 lt!94104 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94176)))

(declare-fun b!190171 () Bool)

(declare-fun lt!94178 () Unit!5699)

(assert (=> b!190171 (= e!125154 lt!94178)))

(assert (=> b!190171 (= lt!94178 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190171 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190172 () Bool)

(declare-fun Unit!5708 () Unit!5699)

(assert (=> b!190172 (= e!125154 Unit!5708)))

(declare-fun b!190173 () Bool)

(assert (=> b!190173 (= e!125155 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55663 c!34181) b!190171))

(assert (= (and d!55663 (not c!34181)) b!190172))

(assert (= (and d!55663 (not res!89873)) b!190173))

(declare-fun m!216067 () Bool)

(assert (=> d!55663 m!216067))

(declare-fun m!216069 () Bool)

(assert (=> b!190171 m!216069))

(declare-fun m!216071 () Bool)

(assert (=> b!190171 m!216071))

(assert (=> b!190171 m!216071))

(declare-fun m!216073 () Bool)

(assert (=> b!190171 m!216073))

(assert (=> b!190173 m!216071))

(assert (=> b!190173 m!216071))

(assert (=> b!190173 m!216073))

(assert (=> bm!19161 d!55663))

(declare-fun b!190198 () Bool)

(declare-fun e!125174 () Bool)

(declare-fun e!125172 () Bool)

(assert (=> b!190198 (= e!125174 e!125172)))

(assert (=> b!190198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun res!89885 () Bool)

(declare-fun lt!94198 () ListLongMap!2383)

(assert (=> b!190198 (= res!89885 (contains!1322 lt!94198 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190198 (=> (not res!89885) (not e!125172))))

(declare-fun b!190199 () Bool)

(declare-fun e!125173 () Bool)

(assert (=> b!190199 (= e!125174 e!125173)))

(declare-fun c!34193 () Bool)

(assert (=> b!190199 (= c!34193 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190200 () Bool)

(assert (=> b!190200 (= e!125173 (= lt!94198 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248))))))

(declare-fun bm!19180 () Bool)

(declare-fun call!19183 () ListLongMap!2383)

(assert (=> bm!19180 (= call!19183 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190201 () Bool)

(declare-fun isEmpty!484 (ListLongMap!2383) Bool)

(assert (=> b!190201 (= e!125173 (isEmpty!484 lt!94198))))

(declare-fun b!190202 () Bool)

(declare-fun e!125170 () Bool)

(assert (=> b!190202 (= e!125170 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190202 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190203 () Bool)

(assert (=> b!190203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> b!190203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4130 (_values!3863 thiss!1248))))))

(assert (=> b!190203 (= e!125172 (= (apply!179 lt!94198 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (get!2192 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!55665 () Bool)

(declare-fun e!125176 () Bool)

(assert (=> d!55665 e!125176))

(declare-fun res!89882 () Bool)

(assert (=> d!55665 (=> (not res!89882) (not e!125176))))

(assert (=> d!55665 (= res!89882 (not (contains!1322 lt!94198 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125171 () ListLongMap!2383)

(assert (=> d!55665 (= lt!94198 e!125171)))

(declare-fun c!34192 () Bool)

(assert (=> d!55665 (= c!34192 (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> d!55665 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55665 (= (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94198)))

(declare-fun b!190204 () Bool)

(declare-fun e!125175 () ListLongMap!2383)

(assert (=> b!190204 (= e!125175 call!19183)))

(declare-fun b!190205 () Bool)

(declare-fun res!89883 () Bool)

(assert (=> b!190205 (=> (not res!89883) (not e!125176))))

(assert (=> b!190205 (= res!89883 (not (contains!1322 lt!94198 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190206 () Bool)

(assert (=> b!190206 (= e!125171 e!125175)))

(declare-fun c!34191 () Bool)

(assert (=> b!190206 (= c!34191 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190207 () Bool)

(assert (=> b!190207 (= e!125176 e!125174)))

(declare-fun c!34190 () Bool)

(assert (=> b!190207 (= c!34190 e!125170)))

(declare-fun res!89884 () Bool)

(assert (=> b!190207 (=> (not res!89884) (not e!125170))))

(assert (=> b!190207 (= res!89884 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190208 () Bool)

(assert (=> b!190208 (= e!125171 (ListLongMap!2384 Nil!2394))))

(declare-fun b!190209 () Bool)

(declare-fun lt!94195 () Unit!5699)

(declare-fun lt!94193 () Unit!5699)

(assert (=> b!190209 (= lt!94195 lt!94193)))

(declare-fun lt!94194 () V!5561)

(declare-fun lt!94199 () (_ BitVec 64))

(declare-fun lt!94197 () ListLongMap!2383)

(declare-fun lt!94196 () (_ BitVec 64))

(assert (=> b!190209 (not (contains!1322 (+!299 lt!94197 (tuple2!3475 lt!94196 lt!94194)) lt!94199))))

(declare-fun addStillNotContains!94 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5699)

(assert (=> b!190209 (= lt!94193 (addStillNotContains!94 lt!94197 lt!94196 lt!94194 lt!94199))))

(assert (=> b!190209 (= lt!94199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190209 (= lt!94194 (get!2192 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190209 (= lt!94196 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190209 (= lt!94197 call!19183)))

(assert (=> b!190209 (= e!125175 (+!299 call!19183 (tuple2!3475 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) (get!2192 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55665 c!34192) b!190208))

(assert (= (and d!55665 (not c!34192)) b!190206))

(assert (= (and b!190206 c!34191) b!190209))

(assert (= (and b!190206 (not c!34191)) b!190204))

(assert (= (or b!190209 b!190204) bm!19180))

(assert (= (and d!55665 res!89882) b!190205))

(assert (= (and b!190205 res!89883) b!190207))

(assert (= (and b!190207 res!89884) b!190202))

(assert (= (and b!190207 c!34190) b!190198))

(assert (= (and b!190207 (not c!34190)) b!190199))

(assert (= (and b!190198 res!89885) b!190203))

(assert (= (and b!190199 c!34193) b!190200))

(assert (= (and b!190199 (not c!34193)) b!190201))

(declare-fun b_lambda!7333 () Bool)

(assert (=> (not b_lambda!7333) (not b!190203)))

(assert (=> b!190203 t!7298))

(declare-fun b_and!11293 () Bool)

(assert (= b_and!11291 (and (=> t!7298 result!4877) b_and!11293)))

(declare-fun b_lambda!7335 () Bool)

(assert (=> (not b_lambda!7335) (not b!190209)))

(assert (=> b!190209 t!7298))

(declare-fun b_and!11295 () Bool)

(assert (= b_and!11293 (and (=> t!7298 result!4877) b_and!11295)))

(declare-fun m!216075 () Bool)

(assert (=> bm!19180 m!216075))

(assert (=> b!190200 m!216075))

(assert (=> b!190203 m!215991))

(assert (=> b!190203 m!215939))

(assert (=> b!190203 m!215993))

(assert (=> b!190203 m!215893))

(declare-fun m!216077 () Bool)

(assert (=> b!190203 m!216077))

(assert (=> b!190203 m!215991))

(assert (=> b!190203 m!215939))

(assert (=> b!190203 m!215893))

(declare-fun m!216079 () Bool)

(assert (=> b!190205 m!216079))

(assert (=> b!190198 m!215893))

(assert (=> b!190198 m!215893))

(declare-fun m!216081 () Bool)

(assert (=> b!190198 m!216081))

(declare-fun m!216083 () Bool)

(assert (=> d!55665 m!216083))

(assert (=> d!55665 m!215779))

(assert (=> b!190202 m!215893))

(assert (=> b!190202 m!215893))

(assert (=> b!190202 m!215899))

(declare-fun m!216085 () Bool)

(assert (=> b!190209 m!216085))

(declare-fun m!216087 () Bool)

(assert (=> b!190209 m!216087))

(assert (=> b!190209 m!216085))

(declare-fun m!216089 () Bool)

(assert (=> b!190209 m!216089))

(assert (=> b!190209 m!215991))

(assert (=> b!190209 m!215939))

(assert (=> b!190209 m!215993))

(declare-fun m!216091 () Bool)

(assert (=> b!190209 m!216091))

(assert (=> b!190209 m!215991))

(assert (=> b!190209 m!215939))

(assert (=> b!190209 m!215893))

(declare-fun m!216093 () Bool)

(assert (=> b!190201 m!216093))

(assert (=> b!190206 m!215893))

(assert (=> b!190206 m!215893))

(assert (=> b!190206 m!215899))

(assert (=> b!190092 d!55665))

(declare-fun d!55667 () Bool)

(declare-fun e!125177 () Bool)

(assert (=> d!55667 e!125177))

(declare-fun res!89887 () Bool)

(assert (=> d!55667 (=> (not res!89887) (not e!125177))))

(declare-fun lt!94201 () ListLongMap!2383)

(assert (=> d!55667 (= res!89887 (contains!1322 lt!94201 (_1!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94203 () List!2397)

(assert (=> d!55667 (= lt!94201 (ListLongMap!2384 lt!94203))))

(declare-fun lt!94200 () Unit!5699)

(declare-fun lt!94202 () Unit!5699)

(assert (=> d!55667 (= lt!94200 lt!94202)))

(assert (=> d!55667 (= (getValueByKey!234 lt!94203 (_1!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))))))

(assert (=> d!55667 (= lt!94202 (lemmaContainsTupThenGetReturnValue!124 lt!94203 (_1!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))))))

(assert (=> d!55667 (= lt!94203 (insertStrictlySorted!127 (toList!1207 lt!94144) (_1!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))))))

(assert (=> d!55667 (= (+!299 lt!94144 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))) lt!94201)))

(declare-fun b!190210 () Bool)

(declare-fun res!89886 () Bool)

(assert (=> b!190210 (=> (not res!89886) (not e!125177))))

(assert (=> b!190210 (= res!89886 (= (getValueByKey!234 (toList!1207 lt!94201) (_1!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))))))))

(declare-fun b!190211 () Bool)

(assert (=> b!190211 (= e!125177 (contains!1323 (toList!1207 lt!94201) (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))))))

(assert (= (and d!55667 res!89887) b!190210))

(assert (= (and b!190210 res!89886) b!190211))

(declare-fun m!216095 () Bool)

(assert (=> d!55667 m!216095))

(declare-fun m!216097 () Bool)

(assert (=> d!55667 m!216097))

(declare-fun m!216099 () Bool)

(assert (=> d!55667 m!216099))

(declare-fun m!216101 () Bool)

(assert (=> d!55667 m!216101))

(declare-fun m!216103 () Bool)

(assert (=> b!190210 m!216103))

(declare-fun m!216105 () Bool)

(assert (=> b!190211 m!216105))

(assert (=> b!190092 d!55667))

(declare-fun d!55669 () Bool)

(declare-fun e!125178 () Bool)

(assert (=> d!55669 e!125178))

(declare-fun res!89889 () Bool)

(assert (=> d!55669 (=> (not res!89889) (not e!125178))))

(declare-fun lt!94205 () ListLongMap!2383)

(assert (=> d!55669 (= res!89889 (contains!1322 lt!94205 (_1!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94207 () List!2397)

(assert (=> d!55669 (= lt!94205 (ListLongMap!2384 lt!94207))))

(declare-fun lt!94204 () Unit!5699)

(declare-fun lt!94206 () Unit!5699)

(assert (=> d!55669 (= lt!94204 lt!94206)))

(assert (=> d!55669 (= (getValueByKey!234 lt!94207 (_1!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))))))

(assert (=> d!55669 (= lt!94206 (lemmaContainsTupThenGetReturnValue!124 lt!94207 (_1!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))))))

(assert (=> d!55669 (= lt!94207 (insertStrictlySorted!127 (toList!1207 lt!94137) (_1!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))))))

(assert (=> d!55669 (= (+!299 lt!94137 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))) lt!94205)))

(declare-fun b!190212 () Bool)

(declare-fun res!89888 () Bool)

(assert (=> b!190212 (=> (not res!89888) (not e!125178))))

(assert (=> b!190212 (= res!89888 (= (getValueByKey!234 (toList!1207 lt!94205) (_1!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))))))))

(declare-fun b!190213 () Bool)

(assert (=> b!190213 (= e!125178 (contains!1323 (toList!1207 lt!94205) (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))))))

(assert (= (and d!55669 res!89889) b!190212))

(assert (= (and b!190212 res!89888) b!190213))

(declare-fun m!216107 () Bool)

(assert (=> d!55669 m!216107))

(declare-fun m!216109 () Bool)

(assert (=> d!55669 m!216109))

(declare-fun m!216111 () Bool)

(assert (=> d!55669 m!216111))

(declare-fun m!216113 () Bool)

(assert (=> d!55669 m!216113))

(declare-fun m!216115 () Bool)

(assert (=> b!190212 m!216115))

(declare-fun m!216117 () Bool)

(assert (=> b!190213 m!216117))

(assert (=> b!190092 d!55669))

(declare-fun d!55671 () Bool)

(declare-fun get!2193 (Option!240) V!5561)

(assert (=> d!55671 (= (apply!179 lt!94137 lt!94128) (get!2193 (getValueByKey!234 (toList!1207 lt!94137) lt!94128)))))

(declare-fun bs!7588 () Bool)

(assert (= bs!7588 d!55671))

(declare-fun m!216119 () Bool)

(assert (=> bs!7588 m!216119))

(assert (=> bs!7588 m!216119))

(declare-fun m!216121 () Bool)

(assert (=> bs!7588 m!216121))

(assert (=> b!190092 d!55671))

(declare-fun d!55673 () Bool)

(declare-fun e!125179 () Bool)

(assert (=> d!55673 e!125179))

(declare-fun res!89891 () Bool)

(assert (=> d!55673 (=> (not res!89891) (not e!125179))))

(declare-fun lt!94209 () ListLongMap!2383)

(assert (=> d!55673 (= res!89891 (contains!1322 lt!94209 (_1!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94211 () List!2397)

(assert (=> d!55673 (= lt!94209 (ListLongMap!2384 lt!94211))))

(declare-fun lt!94208 () Unit!5699)

(declare-fun lt!94210 () Unit!5699)

(assert (=> d!55673 (= lt!94208 lt!94210)))

(assert (=> d!55673 (= (getValueByKey!234 lt!94211 (_1!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55673 (= lt!94210 (lemmaContainsTupThenGetReturnValue!124 lt!94211 (_1!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55673 (= lt!94211 (insertStrictlySorted!127 (toList!1207 lt!94143) (_1!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55673 (= (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))) lt!94209)))

(declare-fun b!190214 () Bool)

(declare-fun res!89890 () Bool)

(assert (=> b!190214 (=> (not res!89890) (not e!125179))))

(assert (=> b!190214 (= res!89890 (= (getValueByKey!234 (toList!1207 lt!94209) (_1!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190215 () Bool)

(assert (=> b!190215 (= e!125179 (contains!1323 (toList!1207 lt!94209) (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55673 res!89891) b!190214))

(assert (= (and b!190214 res!89890) b!190215))

(declare-fun m!216123 () Bool)

(assert (=> d!55673 m!216123))

(declare-fun m!216125 () Bool)

(assert (=> d!55673 m!216125))

(declare-fun m!216127 () Bool)

(assert (=> d!55673 m!216127))

(declare-fun m!216129 () Bool)

(assert (=> d!55673 m!216129))

(declare-fun m!216131 () Bool)

(assert (=> b!190214 m!216131))

(declare-fun m!216133 () Bool)

(assert (=> b!190215 m!216133))

(assert (=> b!190092 d!55673))

(declare-fun d!55675 () Bool)

(assert (=> d!55675 (contains!1322 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))) lt!94125)))

(declare-fun lt!94214 () Unit!5699)

(declare-fun choose!1030 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5699)

(assert (=> d!55675 (= lt!94214 (choose!1030 lt!94143 lt!94140 (zeroValue!3721 thiss!1248) lt!94125))))

(assert (=> d!55675 (contains!1322 lt!94143 lt!94125)))

(assert (=> d!55675 (= (addStillContains!155 lt!94143 lt!94140 (zeroValue!3721 thiss!1248) lt!94125) lt!94214)))

(declare-fun bs!7589 () Bool)

(assert (= bs!7589 d!55675))

(assert (=> bs!7589 m!215969))

(assert (=> bs!7589 m!215969))

(assert (=> bs!7589 m!215971))

(declare-fun m!216135 () Bool)

(assert (=> bs!7589 m!216135))

(declare-fun m!216137 () Bool)

(assert (=> bs!7589 m!216137))

(assert (=> b!190092 d!55675))

(declare-fun d!55677 () Bool)

(declare-fun e!125181 () Bool)

(assert (=> d!55677 e!125181))

(declare-fun res!89892 () Bool)

(assert (=> d!55677 (=> res!89892 e!125181)))

(declare-fun lt!94216 () Bool)

(assert (=> d!55677 (= res!89892 (not lt!94216))))

(declare-fun lt!94217 () Bool)

(assert (=> d!55677 (= lt!94216 lt!94217)))

(declare-fun lt!94215 () Unit!5699)

(declare-fun e!125180 () Unit!5699)

(assert (=> d!55677 (= lt!94215 e!125180)))

(declare-fun c!34194 () Bool)

(assert (=> d!55677 (= c!34194 lt!94217)))

(assert (=> d!55677 (= lt!94217 (containsKey!238 (toList!1207 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))) lt!94125))))

(assert (=> d!55677 (= (contains!1322 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248))) lt!94125) lt!94216)))

(declare-fun b!190217 () Bool)

(declare-fun lt!94218 () Unit!5699)

(assert (=> b!190217 (= e!125180 lt!94218)))

(assert (=> b!190217 (= lt!94218 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))) lt!94125))))

(assert (=> b!190217 (isDefined!188 (getValueByKey!234 (toList!1207 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))) lt!94125))))

(declare-fun b!190218 () Bool)

(declare-fun Unit!5709 () Unit!5699)

(assert (=> b!190218 (= e!125180 Unit!5709)))

(declare-fun b!190219 () Bool)

(assert (=> b!190219 (= e!125181 (isDefined!188 (getValueByKey!234 (toList!1207 (+!299 lt!94143 (tuple2!3475 lt!94140 (zeroValue!3721 thiss!1248)))) lt!94125)))))

(assert (= (and d!55677 c!34194) b!190217))

(assert (= (and d!55677 (not c!34194)) b!190218))

(assert (= (and d!55677 (not res!89892)) b!190219))

(declare-fun m!216139 () Bool)

(assert (=> d!55677 m!216139))

(declare-fun m!216141 () Bool)

(assert (=> b!190217 m!216141))

(declare-fun m!216143 () Bool)

(assert (=> b!190217 m!216143))

(assert (=> b!190217 m!216143))

(declare-fun m!216145 () Bool)

(assert (=> b!190217 m!216145))

(assert (=> b!190219 m!216143))

(assert (=> b!190219 m!216143))

(assert (=> b!190219 m!216145))

(assert (=> b!190092 d!55677))

(declare-fun d!55679 () Bool)

(assert (=> d!55679 (= (apply!179 (+!299 lt!94135 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))) lt!94124) (apply!179 lt!94135 lt!94124))))

(declare-fun lt!94221 () Unit!5699)

(declare-fun choose!1031 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5699)

(assert (=> d!55679 (= lt!94221 (choose!1031 lt!94135 lt!94132 (zeroValue!3721 thiss!1248) lt!94124))))

(declare-fun e!125184 () Bool)

(assert (=> d!55679 e!125184))

(declare-fun res!89895 () Bool)

(assert (=> d!55679 (=> (not res!89895) (not e!125184))))

(assert (=> d!55679 (= res!89895 (contains!1322 lt!94135 lt!94124))))

(assert (=> d!55679 (= (addApplyDifferent!155 lt!94135 lt!94132 (zeroValue!3721 thiss!1248) lt!94124) lt!94221)))

(declare-fun b!190223 () Bool)

(assert (=> b!190223 (= e!125184 (not (= lt!94124 lt!94132)))))

(assert (= (and d!55679 res!89895) b!190223))

(assert (=> d!55679 m!215957))

(declare-fun m!216147 () Bool)

(assert (=> d!55679 m!216147))

(assert (=> d!55679 m!215977))

(assert (=> d!55679 m!215977))

(assert (=> d!55679 m!215979))

(declare-fun m!216149 () Bool)

(assert (=> d!55679 m!216149))

(assert (=> b!190092 d!55679))

(declare-fun d!55681 () Bool)

(assert (=> d!55681 (= (apply!179 lt!94135 lt!94124) (get!2193 (getValueByKey!234 (toList!1207 lt!94135) lt!94124)))))

(declare-fun bs!7590 () Bool)

(assert (= bs!7590 d!55681))

(declare-fun m!216151 () Bool)

(assert (=> bs!7590 m!216151))

(assert (=> bs!7590 m!216151))

(declare-fun m!216153 () Bool)

(assert (=> bs!7590 m!216153))

(assert (=> b!190092 d!55681))

(declare-fun d!55683 () Bool)

(declare-fun e!125185 () Bool)

(assert (=> d!55683 e!125185))

(declare-fun res!89897 () Bool)

(assert (=> d!55683 (=> (not res!89897) (not e!125185))))

(declare-fun lt!94223 () ListLongMap!2383)

(assert (=> d!55683 (= res!89897 (contains!1322 lt!94223 (_1!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94225 () List!2397)

(assert (=> d!55683 (= lt!94223 (ListLongMap!2384 lt!94225))))

(declare-fun lt!94222 () Unit!5699)

(declare-fun lt!94224 () Unit!5699)

(assert (=> d!55683 (= lt!94222 lt!94224)))

(assert (=> d!55683 (= (getValueByKey!234 lt!94225 (_1!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55683 (= lt!94224 (lemmaContainsTupThenGetReturnValue!124 lt!94225 (_1!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55683 (= lt!94225 (insertStrictlySorted!127 (toList!1207 lt!94135) (_1!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55683 (= (+!299 lt!94135 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))) lt!94223)))

(declare-fun b!190224 () Bool)

(declare-fun res!89896 () Bool)

(assert (=> b!190224 (=> (not res!89896) (not e!125185))))

(assert (=> b!190224 (= res!89896 (= (getValueByKey!234 (toList!1207 lt!94223) (_1!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190225 () Bool)

(assert (=> b!190225 (= e!125185 (contains!1323 (toList!1207 lt!94223) (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55683 res!89897) b!190224))

(assert (= (and b!190224 res!89896) b!190225))

(declare-fun m!216155 () Bool)

(assert (=> d!55683 m!216155))

(declare-fun m!216157 () Bool)

(assert (=> d!55683 m!216157))

(declare-fun m!216159 () Bool)

(assert (=> d!55683 m!216159))

(declare-fun m!216161 () Bool)

(assert (=> d!55683 m!216161))

(declare-fun m!216163 () Bool)

(assert (=> b!190224 m!216163))

(declare-fun m!216165 () Bool)

(assert (=> b!190225 m!216165))

(assert (=> b!190092 d!55683))

(declare-fun d!55685 () Bool)

(assert (=> d!55685 (= (apply!179 (+!299 lt!94144 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))) lt!94131) (get!2193 (getValueByKey!234 (toList!1207 (+!299 lt!94144 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248)))) lt!94131)))))

(declare-fun bs!7591 () Bool)

(assert (= bs!7591 d!55685))

(declare-fun m!216167 () Bool)

(assert (=> bs!7591 m!216167))

(assert (=> bs!7591 m!216167))

(declare-fun m!216169 () Bool)

(assert (=> bs!7591 m!216169))

(assert (=> b!190092 d!55685))

(declare-fun d!55687 () Bool)

(assert (=> d!55687 (= (apply!179 (+!299 lt!94137 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))) lt!94128) (get!2193 (getValueByKey!234 (toList!1207 (+!299 lt!94137 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248)))) lt!94128)))))

(declare-fun bs!7592 () Bool)

(assert (= bs!7592 d!55687))

(declare-fun m!216171 () Bool)

(assert (=> bs!7592 m!216171))

(assert (=> bs!7592 m!216171))

(declare-fun m!216173 () Bool)

(assert (=> bs!7592 m!216173))

(assert (=> b!190092 d!55687))

(declare-fun d!55689 () Bool)

(assert (=> d!55689 (= (apply!179 (+!299 lt!94135 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248))) lt!94124) (get!2193 (getValueByKey!234 (toList!1207 (+!299 lt!94135 (tuple2!3475 lt!94132 (zeroValue!3721 thiss!1248)))) lt!94124)))))

(declare-fun bs!7593 () Bool)

(assert (= bs!7593 d!55689))

(declare-fun m!216175 () Bool)

(assert (=> bs!7593 m!216175))

(assert (=> bs!7593 m!216175))

(declare-fun m!216177 () Bool)

(assert (=> bs!7593 m!216177))

(assert (=> b!190092 d!55689))

(declare-fun d!55691 () Bool)

(assert (=> d!55691 (= (apply!179 (+!299 lt!94144 (tuple2!3475 lt!94138 (minValue!3721 thiss!1248))) lt!94131) (apply!179 lt!94144 lt!94131))))

(declare-fun lt!94226 () Unit!5699)

(assert (=> d!55691 (= lt!94226 (choose!1031 lt!94144 lt!94138 (minValue!3721 thiss!1248) lt!94131))))

(declare-fun e!125186 () Bool)

(assert (=> d!55691 e!125186))

(declare-fun res!89898 () Bool)

(assert (=> d!55691 (=> (not res!89898) (not e!125186))))

(assert (=> d!55691 (= res!89898 (contains!1322 lt!94144 lt!94131))))

(assert (=> d!55691 (= (addApplyDifferent!155 lt!94144 lt!94138 (minValue!3721 thiss!1248) lt!94131) lt!94226)))

(declare-fun b!190226 () Bool)

(assert (=> b!190226 (= e!125186 (not (= lt!94131 lt!94138)))))

(assert (= (and d!55691 res!89898) b!190226))

(assert (=> d!55691 m!215981))

(declare-fun m!216179 () Bool)

(assert (=> d!55691 m!216179))

(assert (=> d!55691 m!215965))

(assert (=> d!55691 m!215965))

(assert (=> d!55691 m!215967))

(declare-fun m!216181 () Bool)

(assert (=> d!55691 m!216181))

(assert (=> b!190092 d!55691))

(declare-fun d!55693 () Bool)

(assert (=> d!55693 (= (apply!179 (+!299 lt!94137 (tuple2!3475 lt!94129 (minValue!3721 thiss!1248))) lt!94128) (apply!179 lt!94137 lt!94128))))

(declare-fun lt!94227 () Unit!5699)

(assert (=> d!55693 (= lt!94227 (choose!1031 lt!94137 lt!94129 (minValue!3721 thiss!1248) lt!94128))))

(declare-fun e!125187 () Bool)

(assert (=> d!55693 e!125187))

(declare-fun res!89899 () Bool)

(assert (=> d!55693 (=> (not res!89899) (not e!125187))))

(assert (=> d!55693 (= res!89899 (contains!1322 lt!94137 lt!94128))))

(assert (=> d!55693 (= (addApplyDifferent!155 lt!94137 lt!94129 (minValue!3721 thiss!1248) lt!94128) lt!94227)))

(declare-fun b!190227 () Bool)

(assert (=> b!190227 (= e!125187 (not (= lt!94128 lt!94129)))))

(assert (= (and d!55693 res!89899) b!190227))

(assert (=> d!55693 m!215975))

(declare-fun m!216183 () Bool)

(assert (=> d!55693 m!216183))

(assert (=> d!55693 m!215963))

(assert (=> d!55693 m!215963))

(assert (=> d!55693 m!215983))

(declare-fun m!216185 () Bool)

(assert (=> d!55693 m!216185))

(assert (=> b!190092 d!55693))

(declare-fun d!55695 () Bool)

(assert (=> d!55695 (= (apply!179 lt!94144 lt!94131) (get!2193 (getValueByKey!234 (toList!1207 lt!94144) lt!94131)))))

(declare-fun bs!7594 () Bool)

(assert (= bs!7594 d!55695))

(declare-fun m!216187 () Bool)

(assert (=> bs!7594 m!216187))

(assert (=> bs!7594 m!216187))

(declare-fun m!216189 () Bool)

(assert (=> bs!7594 m!216189))

(assert (=> b!190092 d!55695))

(declare-fun d!55697 () Bool)

(declare-fun e!125188 () Bool)

(assert (=> d!55697 e!125188))

(declare-fun res!89901 () Bool)

(assert (=> d!55697 (=> (not res!89901) (not e!125188))))

(declare-fun lt!94229 () ListLongMap!2383)

(assert (=> d!55697 (= res!89901 (contains!1322 lt!94229 (_1!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun lt!94231 () List!2397)

(assert (=> d!55697 (= lt!94229 (ListLongMap!2384 lt!94231))))

(declare-fun lt!94228 () Unit!5699)

(declare-fun lt!94230 () Unit!5699)

(assert (=> d!55697 (= lt!94228 lt!94230)))

(assert (=> d!55697 (= (getValueByKey!234 lt!94231 (_1!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!239 (_2!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55697 (= lt!94230 (lemmaContainsTupThenGetReturnValue!124 lt!94231 (_1!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55697 (= lt!94231 (insertStrictlySorted!127 (toList!1207 (ite c!34158 call!19162 (ite c!34153 call!19163 call!19161))) (_1!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55697 (= (+!299 (ite c!34158 call!19162 (ite c!34153 call!19163 call!19161)) (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) lt!94229)))

(declare-fun b!190228 () Bool)

(declare-fun res!89900 () Bool)

(assert (=> b!190228 (=> (not res!89900) (not e!125188))))

(assert (=> b!190228 (= res!89900 (= (getValueByKey!234 (toList!1207 lt!94229) (_1!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!239 (_2!1748 (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))))

(declare-fun b!190229 () Bool)

(assert (=> b!190229 (= e!125188 (contains!1323 (toList!1207 lt!94229) (ite (or c!34158 c!34153) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (= (and d!55697 res!89901) b!190228))

(assert (= (and b!190228 res!89900) b!190229))

(declare-fun m!216191 () Bool)

(assert (=> d!55697 m!216191))

(declare-fun m!216193 () Bool)

(assert (=> d!55697 m!216193))

(declare-fun m!216195 () Bool)

(assert (=> d!55697 m!216195))

(declare-fun m!216197 () Bool)

(assert (=> d!55697 m!216197))

(declare-fun m!216199 () Bool)

(assert (=> b!190228 m!216199))

(declare-fun m!216201 () Bool)

(assert (=> b!190229 m!216201))

(assert (=> bm!19160 d!55697))

(declare-fun c!34195 () Bool)

(declare-fun d!55699 () Bool)

(assert (=> d!55699 (= c!34195 (and ((_ is Cons!2393) (toList!1207 lt!94054)) (= (_1!1748 (h!3030 (toList!1207 lt!94054))) (_1!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun e!125189 () Option!240)

(assert (=> d!55699 (= (getValueByKey!234 (toList!1207 lt!94054) (_1!1748 (tuple2!3475 key!828 v!309))) e!125189)))

(declare-fun b!190231 () Bool)

(declare-fun e!125190 () Option!240)

(assert (=> b!190231 (= e!125189 e!125190)))

(declare-fun c!34196 () Bool)

(assert (=> b!190231 (= c!34196 (and ((_ is Cons!2393) (toList!1207 lt!94054)) (not (= (_1!1748 (h!3030 (toList!1207 lt!94054))) (_1!1748 (tuple2!3475 key!828 v!309))))))))

(declare-fun b!190232 () Bool)

(assert (=> b!190232 (= e!125190 (getValueByKey!234 (t!7296 (toList!1207 lt!94054)) (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun b!190233 () Bool)

(assert (=> b!190233 (= e!125190 None!238)))

(declare-fun b!190230 () Bool)

(assert (=> b!190230 (= e!125189 (Some!239 (_2!1748 (h!3030 (toList!1207 lt!94054)))))))

(assert (= (and d!55699 c!34195) b!190230))

(assert (= (and d!55699 (not c!34195)) b!190231))

(assert (= (and b!190231 c!34196) b!190232))

(assert (= (and b!190231 (not c!34196)) b!190233))

(declare-fun m!216203 () Bool)

(assert (=> b!190232 m!216203))

(assert (=> b!190014 d!55699))

(declare-fun d!55701 () Bool)

(assert (=> d!55701 (= (apply!179 lt!94104 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2193 (getValueByKey!234 (toList!1207 lt!94104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7595 () Bool)

(assert (= bs!7595 d!55701))

(assert (=> bs!7595 m!216071))

(assert (=> bs!7595 m!216071))

(declare-fun m!216205 () Bool)

(assert (=> bs!7595 m!216205))

(assert (=> b!190076 d!55701))

(assert (=> b!190088 d!55661))

(declare-fun d!55703 () Bool)

(assert (=> d!55703 (= (inRange!0 (index!4871 lt!94031) (mask!9077 thiss!1248)) (and (bvsge (index!4871 lt!94031) #b00000000000000000000000000000000) (bvslt (index!4871 lt!94031) (bvadd (mask!9077 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189987 d!55703))

(declare-fun d!55705 () Bool)

(declare-fun res!89906 () Bool)

(declare-fun e!125195 () Bool)

(assert (=> d!55705 (=> res!89906 e!125195)))

(assert (=> d!55705 (= res!89906 (= (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55705 (= (arrayContainsKey!0 (_keys!5848 thiss!1248) key!828 #b00000000000000000000000000000000) e!125195)))

(declare-fun b!190238 () Bool)

(declare-fun e!125196 () Bool)

(assert (=> b!190238 (= e!125195 e!125196)))

(declare-fun res!89907 () Bool)

(assert (=> b!190238 (=> (not res!89907) (not e!125196))))

(assert (=> b!190238 (= res!89907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190239 () Bool)

(assert (=> b!190239 (= e!125196 (arrayContainsKey!0 (_keys!5848 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55705 (not res!89906)) b!190238))

(assert (= (and b!190238 res!89907) b!190239))

(assert (=> d!55705 m!215893))

(declare-fun m!216207 () Bool)

(assert (=> b!190239 m!216207))

(assert (=> bm!19176 d!55705))

(declare-fun d!55707 () Bool)

(declare-fun e!125198 () Bool)

(assert (=> d!55707 e!125198))

(declare-fun res!89908 () Bool)

(assert (=> d!55707 (=> res!89908 e!125198)))

(declare-fun lt!94233 () Bool)

(assert (=> d!55707 (= res!89908 (not lt!94233))))

(declare-fun lt!94234 () Bool)

(assert (=> d!55707 (= lt!94233 lt!94234)))

(declare-fun lt!94232 () Unit!5699)

(declare-fun e!125197 () Unit!5699)

(assert (=> d!55707 (= lt!94232 e!125197)))

(declare-fun c!34197 () Bool)

(assert (=> d!55707 (= c!34197 lt!94234)))

(assert (=> d!55707 (= lt!94234 (containsKey!238 (toList!1207 lt!94104) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55707 (= (contains!1322 lt!94104 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94233)))

(declare-fun b!190240 () Bool)

(declare-fun lt!94235 () Unit!5699)

(assert (=> b!190240 (= e!125197 lt!94235)))

(assert (=> b!190240 (= lt!94235 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94104) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190240 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94104) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190241 () Bool)

(declare-fun Unit!5710 () Unit!5699)

(assert (=> b!190241 (= e!125197 Unit!5710)))

(declare-fun b!190242 () Bool)

(assert (=> b!190242 (= e!125198 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55707 c!34197) b!190240))

(assert (= (and d!55707 (not c!34197)) b!190241))

(assert (= (and d!55707 (not res!89908)) b!190242))

(declare-fun m!216209 () Bool)

(assert (=> d!55707 m!216209))

(declare-fun m!216211 () Bool)

(assert (=> b!190240 m!216211))

(declare-fun m!216213 () Bool)

(assert (=> b!190240 m!216213))

(assert (=> b!190240 m!216213))

(declare-fun m!216215 () Bool)

(assert (=> b!190240 m!216215))

(assert (=> b!190242 m!216213))

(assert (=> b!190242 m!216213))

(assert (=> b!190242 m!216215))

(assert (=> bm!19164 d!55707))

(declare-fun b!190255 () Bool)

(declare-fun e!125205 () SeekEntryResult!675)

(assert (=> b!190255 (= e!125205 (MissingVacant!675 (index!4872 lt!94040)))))

(declare-fun b!190256 () Bool)

(declare-fun c!34206 () Bool)

(declare-fun lt!94241 () (_ BitVec 64))

(assert (=> b!190256 (= c!34206 (= lt!94241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125207 () SeekEntryResult!675)

(assert (=> b!190256 (= e!125207 e!125205)))

(declare-fun b!190257 () Bool)

(declare-fun e!125206 () SeekEntryResult!675)

(assert (=> b!190257 (= e!125206 e!125207)))

(declare-fun c!34204 () Bool)

(assert (=> b!190257 (= c!34204 (= lt!94241 key!828))))

(declare-fun b!190258 () Bool)

(assert (=> b!190258 (= e!125207 (Found!675 (index!4872 lt!94040)))))

(declare-fun d!55709 () Bool)

(declare-fun lt!94240 () SeekEntryResult!675)

(assert (=> d!55709 (and (or ((_ is Undefined!675) lt!94240) (not ((_ is Found!675) lt!94240)) (and (bvsge (index!4871 lt!94240) #b00000000000000000000000000000000) (bvslt (index!4871 lt!94240) (size!4129 (_keys!5848 thiss!1248))))) (or ((_ is Undefined!675) lt!94240) ((_ is Found!675) lt!94240) (not ((_ is MissingVacant!675) lt!94240)) (not (= (index!4873 lt!94240) (index!4872 lt!94040))) (and (bvsge (index!4873 lt!94240) #b00000000000000000000000000000000) (bvslt (index!4873 lt!94240) (size!4129 (_keys!5848 thiss!1248))))) (or ((_ is Undefined!675) lt!94240) (ite ((_ is Found!675) lt!94240) (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4871 lt!94240)) key!828) (and ((_ is MissingVacant!675) lt!94240) (= (index!4873 lt!94240) (index!4872 lt!94040)) (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4873 lt!94240)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55709 (= lt!94240 e!125206)))

(declare-fun c!34205 () Bool)

(assert (=> d!55709 (= c!34205 (bvsge (x!20476 lt!94040) #b01111111111111111111111111111110))))

(assert (=> d!55709 (= lt!94241 (select (arr!3808 (_keys!5848 thiss!1248)) (index!4872 lt!94040)))))

(assert (=> d!55709 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55709 (= (seekKeyOrZeroReturnVacant!0 (x!20476 lt!94040) (index!4872 lt!94040) (index!4872 lt!94040) key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)) lt!94240)))

(declare-fun b!190259 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190259 (= e!125205 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20476 lt!94040) #b00000000000000000000000000000001) (nextIndex!0 (index!4872 lt!94040) (x!20476 lt!94040) (mask!9077 thiss!1248)) (index!4872 lt!94040) key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun b!190260 () Bool)

(assert (=> b!190260 (= e!125206 Undefined!675)))

(assert (= (and d!55709 c!34205) b!190260))

(assert (= (and d!55709 (not c!34205)) b!190257))

(assert (= (and b!190257 c!34204) b!190258))

(assert (= (and b!190257 (not c!34204)) b!190256))

(assert (= (and b!190256 c!34206) b!190255))

(assert (= (and b!190256 (not c!34206)) b!190259))

(declare-fun m!216217 () Bool)

(assert (=> d!55709 m!216217))

(declare-fun m!216219 () Bool)

(assert (=> d!55709 m!216219))

(assert (=> d!55709 m!215873))

(assert (=> d!55709 m!215779))

(declare-fun m!216221 () Bool)

(assert (=> b!190259 m!216221))

(assert (=> b!190259 m!216221))

(declare-fun m!216223 () Bool)

(assert (=> b!190259 m!216223))

(assert (=> b!190004 d!55709))

(declare-fun d!55711 () Bool)

(assert (=> d!55711 (= (apply!179 lt!94104 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (get!2193 (getValueByKey!234 (toList!1207 lt!94104) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7596 () Bool)

(assert (= bs!7596 d!55711))

(assert (=> bs!7596 m!215893))

(assert (=> bs!7596 m!216063))

(assert (=> bs!7596 m!216063))

(declare-fun m!216225 () Bool)

(assert (=> bs!7596 m!216225))

(assert (=> b!190059 d!55711))

(declare-fun c!34209 () Bool)

(declare-fun d!55713 () Bool)

(assert (=> d!55713 (= c!34209 ((_ is ValueCellFull!1874) (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!125210 () V!5561)

(assert (=> d!55713 (= (get!2192 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125210)))

(declare-fun b!190265 () Bool)

(declare-fun get!2194 (ValueCell!1874 V!5561) V!5561)

(assert (=> b!190265 (= e!125210 (get!2194 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190266 () Bool)

(declare-fun get!2195 (ValueCell!1874 V!5561) V!5561)

(assert (=> b!190266 (= e!125210 (get!2195 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55713 c!34209) b!190265))

(assert (= (and d!55713 (not c!34209)) b!190266))

(assert (=> b!190265 m!215937))

(assert (=> b!190265 m!215939))

(declare-fun m!216227 () Bool)

(assert (=> b!190265 m!216227))

(assert (=> b!190266 m!215937))

(assert (=> b!190266 m!215939))

(declare-fun m!216229 () Bool)

(assert (=> b!190266 m!216229))

(assert (=> b!190059 d!55713))

(declare-fun d!55715 () Bool)

(declare-fun lt!94244 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!151 (List!2397) (InoxSet tuple2!3474))

(assert (=> d!55715 (= lt!94244 (select (content!151 (toList!1207 lt!94054)) (tuple2!3475 key!828 v!309)))))

(declare-fun e!125215 () Bool)

(assert (=> d!55715 (= lt!94244 e!125215)))

(declare-fun res!89913 () Bool)

(assert (=> d!55715 (=> (not res!89913) (not e!125215))))

(assert (=> d!55715 (= res!89913 ((_ is Cons!2393) (toList!1207 lt!94054)))))

(assert (=> d!55715 (= (contains!1323 (toList!1207 lt!94054) (tuple2!3475 key!828 v!309)) lt!94244)))

(declare-fun b!190271 () Bool)

(declare-fun e!125216 () Bool)

(assert (=> b!190271 (= e!125215 e!125216)))

(declare-fun res!89914 () Bool)

(assert (=> b!190271 (=> res!89914 e!125216)))

(assert (=> b!190271 (= res!89914 (= (h!3030 (toList!1207 lt!94054)) (tuple2!3475 key!828 v!309)))))

(declare-fun b!190272 () Bool)

(assert (=> b!190272 (= e!125216 (contains!1323 (t!7296 (toList!1207 lt!94054)) (tuple2!3475 key!828 v!309)))))

(assert (= (and d!55715 res!89913) b!190271))

(assert (= (and b!190271 (not res!89914)) b!190272))

(declare-fun m!216231 () Bool)

(assert (=> d!55715 m!216231))

(declare-fun m!216233 () Bool)

(assert (=> d!55715 m!216233))

(declare-fun m!216235 () Bool)

(assert (=> b!190272 m!216235))

(assert (=> b!190015 d!55715))

(declare-fun d!55717 () Bool)

(assert (=> d!55717 (isDefined!188 (getValueByKey!234 (toList!1207 lt!93986) key!828))))

(declare-fun lt!94247 () Unit!5699)

(declare-fun choose!1032 (List!2397 (_ BitVec 64)) Unit!5699)

(assert (=> d!55717 (= lt!94247 (choose!1032 (toList!1207 lt!93986) key!828))))

(declare-fun e!125219 () Bool)

(assert (=> d!55717 e!125219))

(declare-fun res!89917 () Bool)

(assert (=> d!55717 (=> (not res!89917) (not e!125219))))

(declare-fun isStrictlySorted!348 (List!2397) Bool)

(assert (=> d!55717 (= res!89917 (isStrictlySorted!348 (toList!1207 lt!93986)))))

(assert (=> d!55717 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!93986) key!828) lt!94247)))

(declare-fun b!190275 () Bool)

(assert (=> b!190275 (= e!125219 (containsKey!238 (toList!1207 lt!93986) key!828))))

(assert (= (and d!55717 res!89917) b!190275))

(assert (=> d!55717 m!216007))

(assert (=> d!55717 m!216007))

(assert (=> d!55717 m!216009))

(declare-fun m!216237 () Bool)

(assert (=> d!55717 m!216237))

(declare-fun m!216239 () Bool)

(assert (=> d!55717 m!216239))

(assert (=> b!190275 m!216003))

(assert (=> b!190108 d!55717))

(assert (=> b!190108 d!55655))

(assert (=> b!190108 d!55657))

(declare-fun d!55719 () Bool)

(assert (=> d!55719 (= (apply!179 lt!94104 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2193 (getValueByKey!234 (toList!1207 lt!94104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7597 () Bool)

(assert (= bs!7597 d!55719))

(assert (=> bs!7597 m!216213))

(assert (=> bs!7597 m!216213))

(declare-fun m!216241 () Bool)

(assert (=> bs!7597 m!216241))

(assert (=> b!190074 d!55719))

(declare-fun b!190276 () Bool)

(declare-fun e!125224 () Bool)

(declare-fun e!125222 () Bool)

(assert (=> b!190276 (= e!125224 e!125222)))

(assert (=> b!190276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun res!89921 () Bool)

(declare-fun lt!94253 () ListLongMap!2383)

(assert (=> b!190276 (= res!89921 (contains!1322 lt!94253 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190276 (=> (not res!89921) (not e!125222))))

(declare-fun b!190277 () Bool)

(declare-fun e!125223 () Bool)

(assert (=> b!190277 (= e!125224 e!125223)))

(declare-fun c!34213 () Bool)

(assert (=> b!190277 (= c!34213 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190278 () Bool)

(assert (=> b!190278 (= e!125223 (= lt!94253 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248))))))

(declare-fun bm!19181 () Bool)

(declare-fun call!19184 () ListLongMap!2383)

(assert (=> bm!19181 (= call!19184 (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190279 () Bool)

(assert (=> b!190279 (= e!125223 (isEmpty!484 lt!94253))))

(declare-fun b!190280 () Bool)

(declare-fun e!125220 () Bool)

(assert (=> b!190280 (= e!125220 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190280 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190281 () Bool)

(assert (=> b!190281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> b!190281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4130 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))))))))

(assert (=> b!190281 (= e!125222 (= (apply!179 lt!94253 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (get!2192 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!55721 () Bool)

(declare-fun e!125226 () Bool)

(assert (=> d!55721 e!125226))

(declare-fun res!89918 () Bool)

(assert (=> d!55721 (=> (not res!89918) (not e!125226))))

(assert (=> d!55721 (= res!89918 (not (contains!1322 lt!94253 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125221 () ListLongMap!2383)

(assert (=> d!55721 (= lt!94253 e!125221)))

(declare-fun c!34212 () Bool)

(assert (=> d!55721 (= c!34212 (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> d!55721 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55721 (= (getCurrentListMapNoExtraKeys!200 (_keys!5848 thiss!1248) (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248))) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94253)))

(declare-fun b!190282 () Bool)

(declare-fun e!125225 () ListLongMap!2383)

(assert (=> b!190282 (= e!125225 call!19184)))

(declare-fun b!190283 () Bool)

(declare-fun res!89919 () Bool)

(assert (=> b!190283 (=> (not res!89919) (not e!125226))))

(assert (=> b!190283 (= res!89919 (not (contains!1322 lt!94253 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190284 () Bool)

(assert (=> b!190284 (= e!125221 e!125225)))

(declare-fun c!34211 () Bool)

(assert (=> b!190284 (= c!34211 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190285 () Bool)

(assert (=> b!190285 (= e!125226 e!125224)))

(declare-fun c!34210 () Bool)

(assert (=> b!190285 (= c!34210 e!125220)))

(declare-fun res!89920 () Bool)

(assert (=> b!190285 (=> (not res!89920) (not e!125220))))

(assert (=> b!190285 (= res!89920 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190286 () Bool)

(assert (=> b!190286 (= e!125221 (ListLongMap!2384 Nil!2394))))

(declare-fun b!190287 () Bool)

(declare-fun lt!94250 () Unit!5699)

(declare-fun lt!94248 () Unit!5699)

(assert (=> b!190287 (= lt!94250 lt!94248)))

(declare-fun lt!94251 () (_ BitVec 64))

(declare-fun lt!94252 () ListLongMap!2383)

(declare-fun lt!94249 () V!5561)

(declare-fun lt!94254 () (_ BitVec 64))

(assert (=> b!190287 (not (contains!1322 (+!299 lt!94252 (tuple2!3475 lt!94251 lt!94249)) lt!94254))))

(assert (=> b!190287 (= lt!94248 (addStillNotContains!94 lt!94252 lt!94251 lt!94249 lt!94254))))

(assert (=> b!190287 (= lt!94254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190287 (= lt!94249 (get!2192 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190287 (= lt!94251 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190287 (= lt!94252 call!19184)))

(assert (=> b!190287 (= e!125225 (+!299 call!19184 (tuple2!3475 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) (get!2192 (select (arr!3809 (array!8086 (store (arr!3809 (_values!3863 thiss!1248)) (index!4871 lt!93990) (ValueCellFull!1874 v!309)) (size!4130 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55721 c!34212) b!190286))

(assert (= (and d!55721 (not c!34212)) b!190284))

(assert (= (and b!190284 c!34211) b!190287))

(assert (= (and b!190284 (not c!34211)) b!190282))

(assert (= (or b!190287 b!190282) bm!19181))

(assert (= (and d!55721 res!89918) b!190283))

(assert (= (and b!190283 res!89919) b!190285))

(assert (= (and b!190285 res!89920) b!190280))

(assert (= (and b!190285 c!34210) b!190276))

(assert (= (and b!190285 (not c!34210)) b!190277))

(assert (= (and b!190276 res!89921) b!190281))

(assert (= (and b!190277 c!34213) b!190278))

(assert (= (and b!190277 (not c!34213)) b!190279))

(declare-fun b_lambda!7337 () Bool)

(assert (=> (not b_lambda!7337) (not b!190281)))

(assert (=> b!190281 t!7298))

(declare-fun b_and!11297 () Bool)

(assert (= b_and!11295 (and (=> t!7298 result!4877) b_and!11297)))

(declare-fun b_lambda!7339 () Bool)

(assert (=> (not b_lambda!7339) (not b!190287)))

(assert (=> b!190287 t!7298))

(declare-fun b_and!11299 () Bool)

(assert (= b_and!11297 (and (=> t!7298 result!4877) b_and!11299)))

(declare-fun m!216243 () Bool)

(assert (=> bm!19181 m!216243))

(assert (=> b!190278 m!216243))

(assert (=> b!190281 m!215937))

(assert (=> b!190281 m!215939))

(assert (=> b!190281 m!215941))

(assert (=> b!190281 m!215893))

(declare-fun m!216245 () Bool)

(assert (=> b!190281 m!216245))

(assert (=> b!190281 m!215937))

(assert (=> b!190281 m!215939))

(assert (=> b!190281 m!215893))

(declare-fun m!216247 () Bool)

(assert (=> b!190283 m!216247))

(assert (=> b!190276 m!215893))

(assert (=> b!190276 m!215893))

(declare-fun m!216249 () Bool)

(assert (=> b!190276 m!216249))

(declare-fun m!216251 () Bool)

(assert (=> d!55721 m!216251))

(assert (=> d!55721 m!215779))

(assert (=> b!190280 m!215893))

(assert (=> b!190280 m!215893))

(assert (=> b!190280 m!215899))

(declare-fun m!216253 () Bool)

(assert (=> b!190287 m!216253))

(declare-fun m!216255 () Bool)

(assert (=> b!190287 m!216255))

(assert (=> b!190287 m!216253))

(declare-fun m!216257 () Bool)

(assert (=> b!190287 m!216257))

(assert (=> b!190287 m!215937))

(assert (=> b!190287 m!215939))

(assert (=> b!190287 m!215941))

(declare-fun m!216259 () Bool)

(assert (=> b!190287 m!216259))

(assert (=> b!190287 m!215937))

(assert (=> b!190287 m!215939))

(assert (=> b!190287 m!215893))

(declare-fun m!216261 () Bool)

(assert (=> b!190279 m!216261))

(assert (=> b!190284 m!215893))

(assert (=> b!190284 m!215893))

(assert (=> b!190284 m!215899))

(assert (=> bm!19159 d!55721))

(declare-fun d!55723 () Bool)

(declare-fun e!125227 () Bool)

(assert (=> d!55723 e!125227))

(declare-fun res!89923 () Bool)

(assert (=> d!55723 (=> (not res!89923) (not e!125227))))

(declare-fun lt!94256 () ListLongMap!2383)

(assert (=> d!55723 (= res!89923 (contains!1322 lt!94256 (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94258 () List!2397)

(assert (=> d!55723 (= lt!94256 (ListLongMap!2384 lt!94258))))

(declare-fun lt!94255 () Unit!5699)

(declare-fun lt!94257 () Unit!5699)

(assert (=> d!55723 (= lt!94255 lt!94257)))

(assert (=> d!55723 (= (getValueByKey!234 lt!94258 (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55723 (= lt!94257 (lemmaContainsTupThenGetReturnValue!124 lt!94258 (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55723 (= lt!94258 (insertStrictlySorted!127 (toList!1207 call!19165) (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55723 (= (+!299 call!19165 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) lt!94256)))

(declare-fun b!190288 () Bool)

(declare-fun res!89922 () Bool)

(assert (=> b!190288 (=> (not res!89922) (not e!125227))))

(assert (=> b!190288 (= res!89922 (= (getValueByKey!234 (toList!1207 lt!94256) (_1!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun b!190289 () Bool)

(assert (=> b!190289 (= e!125227 (contains!1323 (toList!1207 lt!94256) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(assert (= (and d!55723 res!89923) b!190288))

(assert (= (and b!190288 res!89922) b!190289))

(declare-fun m!216263 () Bool)

(assert (=> d!55723 m!216263))

(declare-fun m!216265 () Bool)

(assert (=> d!55723 m!216265))

(declare-fun m!216267 () Bool)

(assert (=> d!55723 m!216267))

(declare-fun m!216269 () Bool)

(assert (=> d!55723 m!216269))

(declare-fun m!216271 () Bool)

(assert (=> b!190288 m!216271))

(declare-fun m!216273 () Bool)

(assert (=> b!190289 m!216273))

(assert (=> b!190071 d!55723))

(declare-fun b!190300 () Bool)

(declare-fun e!125238 () Bool)

(declare-fun e!125239 () Bool)

(assert (=> b!190300 (= e!125238 e!125239)))

(declare-fun res!89931 () Bool)

(assert (=> b!190300 (=> (not res!89931) (not e!125239))))

(declare-fun e!125237 () Bool)

(assert (=> b!190300 (= res!89931 (not e!125237))))

(declare-fun res!89930 () Bool)

(assert (=> b!190300 (=> (not res!89930) (not e!125237))))

(assert (=> b!190300 (= res!89930 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55725 () Bool)

(declare-fun res!89932 () Bool)

(assert (=> d!55725 (=> res!89932 e!125238)))

(assert (=> d!55725 (= res!89932 (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> d!55725 (= (arrayNoDuplicates!0 (_keys!5848 thiss!1248) #b00000000000000000000000000000000 Nil!2395) e!125238)))

(declare-fun b!190301 () Bool)

(declare-fun e!125236 () Bool)

(assert (=> b!190301 (= e!125239 e!125236)))

(declare-fun c!34216 () Bool)

(assert (=> b!190301 (= c!34216 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190302 () Bool)

(declare-fun call!19187 () Bool)

(assert (=> b!190302 (= e!125236 call!19187)))

(declare-fun bm!19184 () Bool)

(assert (=> bm!19184 (= call!19187 (arrayNoDuplicates!0 (_keys!5848 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34216 (Cons!2394 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) Nil!2395) Nil!2395)))))

(declare-fun b!190303 () Bool)

(declare-fun contains!1324 (List!2398 (_ BitVec 64)) Bool)

(assert (=> b!190303 (= e!125237 (contains!1324 Nil!2395 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190304 () Bool)

(assert (=> b!190304 (= e!125236 call!19187)))

(assert (= (and d!55725 (not res!89932)) b!190300))

(assert (= (and b!190300 res!89930) b!190303))

(assert (= (and b!190300 res!89931) b!190301))

(assert (= (and b!190301 c!34216) b!190302))

(assert (= (and b!190301 (not c!34216)) b!190304))

(assert (= (or b!190302 b!190304) bm!19184))

(assert (=> b!190300 m!215893))

(assert (=> b!190300 m!215893))

(assert (=> b!190300 m!215899))

(assert (=> b!190301 m!215893))

(assert (=> b!190301 m!215893))

(assert (=> b!190301 m!215899))

(assert (=> bm!19184 m!215893))

(declare-fun m!216275 () Bool)

(assert (=> bm!19184 m!216275))

(assert (=> b!190303 m!215893))

(assert (=> b!190303 m!215893))

(declare-fun m!216277 () Bool)

(assert (=> b!190303 m!216277))

(assert (=> b!190119 d!55725))

(declare-fun d!55727 () Bool)

(declare-fun e!125241 () Bool)

(assert (=> d!55727 e!125241))

(declare-fun res!89933 () Bool)

(assert (=> d!55727 (=> res!89933 e!125241)))

(declare-fun lt!94260 () Bool)

(assert (=> d!55727 (= res!89933 (not lt!94260))))

(declare-fun lt!94261 () Bool)

(assert (=> d!55727 (= lt!94260 lt!94261)))

(declare-fun lt!94259 () Unit!5699)

(declare-fun e!125240 () Unit!5699)

(assert (=> d!55727 (= lt!94259 e!125240)))

(declare-fun c!34217 () Bool)

(assert (=> d!55727 (= c!34217 lt!94261)))

(assert (=> d!55727 (= lt!94261 (containsKey!238 (toList!1207 lt!94126) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55727 (= (contains!1322 lt!94126 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94260)))

(declare-fun b!190305 () Bool)

(declare-fun lt!94262 () Unit!5699)

(assert (=> b!190305 (= e!125240 lt!94262)))

(assert (=> b!190305 (= lt!94262 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94126) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190305 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94126) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190306 () Bool)

(declare-fun Unit!5711 () Unit!5699)

(assert (=> b!190306 (= e!125240 Unit!5711)))

(declare-fun b!190307 () Bool)

(assert (=> b!190307 (= e!125241 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55727 c!34217) b!190305))

(assert (= (and d!55727 (not c!34217)) b!190306))

(assert (= (and d!55727 (not res!89933)) b!190307))

(declare-fun m!216279 () Bool)

(assert (=> d!55727 m!216279))

(declare-fun m!216281 () Bool)

(assert (=> b!190305 m!216281))

(declare-fun m!216283 () Bool)

(assert (=> b!190305 m!216283))

(assert (=> b!190305 m!216283))

(declare-fun m!216285 () Bool)

(assert (=> b!190305 m!216285))

(assert (=> b!190307 m!216283))

(assert (=> b!190307 m!216283))

(assert (=> b!190307 m!216285))

(assert (=> bm!19168 d!55727))

(declare-fun b!190316 () Bool)

(declare-fun e!125246 () (_ BitVec 32))

(declare-fun call!19190 () (_ BitVec 32))

(assert (=> b!190316 (= e!125246 call!19190)))

(declare-fun b!190317 () Bool)

(declare-fun e!125247 () (_ BitVec 32))

(assert (=> b!190317 (= e!125247 e!125246)))

(declare-fun c!34223 () Bool)

(assert (=> b!190317 (= c!34223 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55729 () Bool)

(declare-fun lt!94265 () (_ BitVec 32))

(assert (=> d!55729 (and (bvsge lt!94265 #b00000000000000000000000000000000) (bvsle lt!94265 (bvsub (size!4129 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55729 (= lt!94265 e!125247)))

(declare-fun c!34222 () Bool)

(assert (=> d!55729 (= c!34222 (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> d!55729 (and (bvsle #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4129 (_keys!5848 thiss!1248)) (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> d!55729 (= (arrayCountValidKeys!0 (_keys!5848 thiss!1248) #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))) lt!94265)))

(declare-fun bm!19187 () Bool)

(assert (=> bm!19187 (= call!19190 (arrayCountValidKeys!0 (_keys!5848 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun b!190318 () Bool)

(assert (=> b!190318 (= e!125246 (bvadd #b00000000000000000000000000000001 call!19190))))

(declare-fun b!190319 () Bool)

(assert (=> b!190319 (= e!125247 #b00000000000000000000000000000000)))

(assert (= (and d!55729 c!34222) b!190319))

(assert (= (and d!55729 (not c!34222)) b!190317))

(assert (= (and b!190317 c!34223) b!190318))

(assert (= (and b!190317 (not c!34223)) b!190316))

(assert (= (or b!190318 b!190316) bm!19187))

(assert (=> b!190317 m!215893))

(assert (=> b!190317 m!215893))

(assert (=> b!190317 m!215899))

(declare-fun m!216287 () Bool)

(assert (=> bm!19187 m!216287))

(assert (=> b!190117 d!55729))

(declare-fun d!55731 () Bool)

(declare-fun e!125249 () Bool)

(assert (=> d!55731 e!125249))

(declare-fun res!89934 () Bool)

(assert (=> d!55731 (=> res!89934 e!125249)))

(declare-fun lt!94267 () Bool)

(assert (=> d!55731 (= res!89934 (not lt!94267))))

(declare-fun lt!94268 () Bool)

(assert (=> d!55731 (= lt!94267 lt!94268)))

(declare-fun lt!94266 () Unit!5699)

(declare-fun e!125248 () Unit!5699)

(assert (=> d!55731 (= lt!94266 e!125248)))

(declare-fun c!34224 () Bool)

(assert (=> d!55731 (= c!34224 lt!94268)))

(assert (=> d!55731 (= lt!94268 (containsKey!238 (toList!1207 lt!94126) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55731 (= (contains!1322 lt!94126 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94267)))

(declare-fun b!190320 () Bool)

(declare-fun lt!94269 () Unit!5699)

(assert (=> b!190320 (= e!125248 lt!94269)))

(assert (=> b!190320 (= lt!94269 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94126) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190320 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94126) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190321 () Bool)

(declare-fun Unit!5712 () Unit!5699)

(assert (=> b!190321 (= e!125248 Unit!5712)))

(declare-fun b!190322 () Bool)

(assert (=> b!190322 (= e!125249 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55731 c!34224) b!190320))

(assert (= (and d!55731 (not c!34224)) b!190321))

(assert (= (and d!55731 (not res!89934)) b!190322))

(declare-fun m!216289 () Bool)

(assert (=> d!55731 m!216289))

(declare-fun m!216291 () Bool)

(assert (=> b!190320 m!216291))

(declare-fun m!216293 () Bool)

(assert (=> b!190320 m!216293))

(assert (=> b!190320 m!216293))

(declare-fun m!216295 () Bool)

(assert (=> b!190320 m!216295))

(assert (=> b!190322 m!216293))

(assert (=> b!190322 m!216293))

(assert (=> b!190322 m!216295))

(assert (=> bm!19171 d!55731))

(declare-fun d!55733 () Bool)

(declare-fun e!125250 () Bool)

(assert (=> d!55733 e!125250))

(declare-fun res!89936 () Bool)

(assert (=> d!55733 (=> (not res!89936) (not e!125250))))

(declare-fun lt!94271 () ListLongMap!2383)

(assert (=> d!55733 (= res!89936 (contains!1322 lt!94271 (_1!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94273 () List!2397)

(assert (=> d!55733 (= lt!94271 (ListLongMap!2384 lt!94273))))

(declare-fun lt!94270 () Unit!5699)

(declare-fun lt!94272 () Unit!5699)

(assert (=> d!55733 (= lt!94270 lt!94272)))

(assert (=> d!55733 (= (getValueByKey!234 lt!94273 (_1!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))))))

(assert (=> d!55733 (= lt!94272 (lemmaContainsTupThenGetReturnValue!124 lt!94273 (_1!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))))))

(assert (=> d!55733 (= lt!94273 (insertStrictlySorted!127 (toList!1207 lt!94115) (_1!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))))))

(assert (=> d!55733 (= (+!299 lt!94115 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))) lt!94271)))

(declare-fun b!190323 () Bool)

(declare-fun res!89935 () Bool)

(assert (=> b!190323 (=> (not res!89935) (not e!125250))))

(assert (=> b!190323 (= res!89935 (= (getValueByKey!234 (toList!1207 lt!94271) (_1!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))))))))

(declare-fun b!190324 () Bool)

(assert (=> b!190324 (= e!125250 (contains!1323 (toList!1207 lt!94271) (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))))))

(assert (= (and d!55733 res!89936) b!190323))

(assert (= (and b!190323 res!89935) b!190324))

(declare-fun m!216297 () Bool)

(assert (=> d!55733 m!216297))

(declare-fun m!216299 () Bool)

(assert (=> d!55733 m!216299))

(declare-fun m!216301 () Bool)

(assert (=> d!55733 m!216301))

(declare-fun m!216303 () Bool)

(assert (=> d!55733 m!216303))

(declare-fun m!216305 () Bool)

(assert (=> b!190323 m!216305))

(declare-fun m!216307 () Bool)

(assert (=> b!190324 m!216307))

(assert (=> b!190069 d!55733))

(assert (=> b!190069 d!55721))

(declare-fun d!55735 () Bool)

(assert (=> d!55735 (= (apply!179 lt!94122 lt!94109) (get!2193 (getValueByKey!234 (toList!1207 lt!94122) lt!94109)))))

(declare-fun bs!7598 () Bool)

(assert (= bs!7598 d!55735))

(declare-fun m!216309 () Bool)

(assert (=> bs!7598 m!216309))

(assert (=> bs!7598 m!216309))

(declare-fun m!216311 () Bool)

(assert (=> bs!7598 m!216311))

(assert (=> b!190069 d!55735))

(declare-fun d!55737 () Bool)

(assert (=> d!55737 (= (apply!179 (+!299 lt!94113 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))) lt!94102) (apply!179 lt!94113 lt!94102))))

(declare-fun lt!94274 () Unit!5699)

(assert (=> d!55737 (= lt!94274 (choose!1031 lt!94113 lt!94110 (zeroValue!3721 thiss!1248) lt!94102))))

(declare-fun e!125251 () Bool)

(assert (=> d!55737 e!125251))

(declare-fun res!89937 () Bool)

(assert (=> d!55737 (=> (not res!89937) (not e!125251))))

(assert (=> d!55737 (= res!89937 (contains!1322 lt!94113 lt!94102))))

(assert (=> d!55737 (= (addApplyDifferent!155 lt!94113 lt!94110 (zeroValue!3721 thiss!1248) lt!94102) lt!94274)))

(declare-fun b!190325 () Bool)

(assert (=> b!190325 (= e!125251 (not (= lt!94102 lt!94110)))))

(assert (= (and d!55737 res!89937) b!190325))

(assert (=> d!55737 m!215903))

(declare-fun m!216313 () Bool)

(assert (=> d!55737 m!216313))

(assert (=> d!55737 m!215923))

(assert (=> d!55737 m!215923))

(assert (=> d!55737 m!215925))

(declare-fun m!216315 () Bool)

(assert (=> d!55737 m!216315))

(assert (=> b!190069 d!55737))

(declare-fun d!55739 () Bool)

(declare-fun e!125252 () Bool)

(assert (=> d!55739 e!125252))

(declare-fun res!89939 () Bool)

(assert (=> d!55739 (=> (not res!89939) (not e!125252))))

(declare-fun lt!94276 () ListLongMap!2383)

(assert (=> d!55739 (= res!89939 (contains!1322 lt!94276 (_1!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94278 () List!2397)

(assert (=> d!55739 (= lt!94276 (ListLongMap!2384 lt!94278))))

(declare-fun lt!94275 () Unit!5699)

(declare-fun lt!94277 () Unit!5699)

(assert (=> d!55739 (= lt!94275 lt!94277)))

(assert (=> d!55739 (= (getValueByKey!234 lt!94278 (_1!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55739 (= lt!94277 (lemmaContainsTupThenGetReturnValue!124 lt!94278 (_1!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55739 (= lt!94278 (insertStrictlySorted!127 (toList!1207 lt!94121) (_1!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55739 (= (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))) lt!94276)))

(declare-fun b!190326 () Bool)

(declare-fun res!89938 () Bool)

(assert (=> b!190326 (=> (not res!89938) (not e!125252))))

(assert (=> b!190326 (= res!89938 (= (getValueByKey!234 (toList!1207 lt!94276) (_1!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190327 () Bool)

(assert (=> b!190327 (= e!125252 (contains!1323 (toList!1207 lt!94276) (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55739 res!89939) b!190326))

(assert (= (and b!190326 res!89938) b!190327))

(declare-fun m!216317 () Bool)

(assert (=> d!55739 m!216317))

(declare-fun m!216319 () Bool)

(assert (=> d!55739 m!216319))

(declare-fun m!216321 () Bool)

(assert (=> d!55739 m!216321))

(declare-fun m!216323 () Bool)

(assert (=> d!55739 m!216323))

(declare-fun m!216325 () Bool)

(assert (=> b!190326 m!216325))

(declare-fun m!216327 () Bool)

(assert (=> b!190327 m!216327))

(assert (=> b!190069 d!55739))

(declare-fun d!55741 () Bool)

(assert (=> d!55741 (= (apply!179 (+!299 lt!94113 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))) lt!94102) (get!2193 (getValueByKey!234 (toList!1207 (+!299 lt!94113 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))) lt!94102)))))

(declare-fun bs!7599 () Bool)

(assert (= bs!7599 d!55741))

(declare-fun m!216329 () Bool)

(assert (=> bs!7599 m!216329))

(assert (=> bs!7599 m!216329))

(declare-fun m!216331 () Bool)

(assert (=> bs!7599 m!216331))

(assert (=> b!190069 d!55741))

(declare-fun d!55743 () Bool)

(assert (=> d!55743 (= (apply!179 (+!299 lt!94122 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))) lt!94109) (apply!179 lt!94122 lt!94109))))

(declare-fun lt!94279 () Unit!5699)

(assert (=> d!55743 (= lt!94279 (choose!1031 lt!94122 lt!94116 (minValue!3721 thiss!1248) lt!94109))))

(declare-fun e!125253 () Bool)

(assert (=> d!55743 e!125253))

(declare-fun res!89940 () Bool)

(assert (=> d!55743 (=> (not res!89940) (not e!125253))))

(assert (=> d!55743 (= res!89940 (contains!1322 lt!94122 lt!94109))))

(assert (=> d!55743 (= (addApplyDifferent!155 lt!94122 lt!94116 (minValue!3721 thiss!1248) lt!94109) lt!94279)))

(declare-fun b!190328 () Bool)

(assert (=> b!190328 (= e!125253 (not (= lt!94109 lt!94116)))))

(assert (= (and d!55743 res!89940) b!190328))

(assert (=> d!55743 m!215927))

(declare-fun m!216333 () Bool)

(assert (=> d!55743 m!216333))

(assert (=> d!55743 m!215911))

(assert (=> d!55743 m!215911))

(assert (=> d!55743 m!215913))

(declare-fun m!216335 () Bool)

(assert (=> d!55743 m!216335))

(assert (=> b!190069 d!55743))

(declare-fun d!55745 () Bool)

(assert (=> d!55745 (= (apply!179 lt!94113 lt!94102) (get!2193 (getValueByKey!234 (toList!1207 lt!94113) lt!94102)))))

(declare-fun bs!7600 () Bool)

(assert (= bs!7600 d!55745))

(declare-fun m!216337 () Bool)

(assert (=> bs!7600 m!216337))

(assert (=> bs!7600 m!216337))

(declare-fun m!216339 () Bool)

(assert (=> bs!7600 m!216339))

(assert (=> b!190069 d!55745))

(declare-fun d!55747 () Bool)

(assert (=> d!55747 (contains!1322 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))) lt!94103)))

(declare-fun lt!94280 () Unit!5699)

(assert (=> d!55747 (= lt!94280 (choose!1030 lt!94121 lt!94118 (zeroValue!3721 thiss!1248) lt!94103))))

(assert (=> d!55747 (contains!1322 lt!94121 lt!94103)))

(assert (=> d!55747 (= (addStillContains!155 lt!94121 lt!94118 (zeroValue!3721 thiss!1248) lt!94103) lt!94280)))

(declare-fun bs!7601 () Bool)

(assert (= bs!7601 d!55747))

(assert (=> bs!7601 m!215915))

(assert (=> bs!7601 m!215915))

(assert (=> bs!7601 m!215917))

(declare-fun m!216341 () Bool)

(assert (=> bs!7601 m!216341))

(declare-fun m!216343 () Bool)

(assert (=> bs!7601 m!216343))

(assert (=> b!190069 d!55747))

(declare-fun d!55749 () Bool)

(assert (=> d!55749 (= (apply!179 lt!94115 lt!94106) (get!2193 (getValueByKey!234 (toList!1207 lt!94115) lt!94106)))))

(declare-fun bs!7602 () Bool)

(assert (= bs!7602 d!55749))

(declare-fun m!216345 () Bool)

(assert (=> bs!7602 m!216345))

(assert (=> bs!7602 m!216345))

(declare-fun m!216347 () Bool)

(assert (=> bs!7602 m!216347))

(assert (=> b!190069 d!55749))

(declare-fun d!55751 () Bool)

(assert (=> d!55751 (= (apply!179 (+!299 lt!94122 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))) lt!94109) (get!2193 (getValueByKey!234 (toList!1207 (+!299 lt!94122 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))) lt!94109)))))

(declare-fun bs!7603 () Bool)

(assert (= bs!7603 d!55751))

(declare-fun m!216349 () Bool)

(assert (=> bs!7603 m!216349))

(assert (=> bs!7603 m!216349))

(declare-fun m!216351 () Bool)

(assert (=> bs!7603 m!216351))

(assert (=> b!190069 d!55751))

(declare-fun d!55753 () Bool)

(assert (=> d!55753 (= (apply!179 (+!299 lt!94115 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))) lt!94106) (get!2193 (getValueByKey!234 (toList!1207 (+!299 lt!94115 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248)))) lt!94106)))))

(declare-fun bs!7604 () Bool)

(assert (= bs!7604 d!55753))

(declare-fun m!216353 () Bool)

(assert (=> bs!7604 m!216353))

(assert (=> bs!7604 m!216353))

(declare-fun m!216355 () Bool)

(assert (=> bs!7604 m!216355))

(assert (=> b!190069 d!55753))

(declare-fun d!55755 () Bool)

(declare-fun e!125255 () Bool)

(assert (=> d!55755 e!125255))

(declare-fun res!89941 () Bool)

(assert (=> d!55755 (=> res!89941 e!125255)))

(declare-fun lt!94282 () Bool)

(assert (=> d!55755 (= res!89941 (not lt!94282))))

(declare-fun lt!94283 () Bool)

(assert (=> d!55755 (= lt!94282 lt!94283)))

(declare-fun lt!94281 () Unit!5699)

(declare-fun e!125254 () Unit!5699)

(assert (=> d!55755 (= lt!94281 e!125254)))

(declare-fun c!34225 () Bool)

(assert (=> d!55755 (= c!34225 lt!94283)))

(assert (=> d!55755 (= lt!94283 (containsKey!238 (toList!1207 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))) lt!94103))))

(assert (=> d!55755 (= (contains!1322 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248))) lt!94103) lt!94282)))

(declare-fun b!190329 () Bool)

(declare-fun lt!94284 () Unit!5699)

(assert (=> b!190329 (= e!125254 lt!94284)))

(assert (=> b!190329 (= lt!94284 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))) lt!94103))))

(assert (=> b!190329 (isDefined!188 (getValueByKey!234 (toList!1207 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))) lt!94103))))

(declare-fun b!190330 () Bool)

(declare-fun Unit!5713 () Unit!5699)

(assert (=> b!190330 (= e!125254 Unit!5713)))

(declare-fun b!190331 () Bool)

(assert (=> b!190331 (= e!125255 (isDefined!188 (getValueByKey!234 (toList!1207 (+!299 lt!94121 (tuple2!3475 lt!94118 (zeroValue!3721 thiss!1248)))) lt!94103)))))

(assert (= (and d!55755 c!34225) b!190329))

(assert (= (and d!55755 (not c!34225)) b!190330))

(assert (= (and d!55755 (not res!89941)) b!190331))

(declare-fun m!216357 () Bool)

(assert (=> d!55755 m!216357))

(declare-fun m!216359 () Bool)

(assert (=> b!190329 m!216359))

(declare-fun m!216361 () Bool)

(assert (=> b!190329 m!216361))

(assert (=> b!190329 m!216361))

(declare-fun m!216363 () Bool)

(assert (=> b!190329 m!216363))

(assert (=> b!190331 m!216361))

(assert (=> b!190331 m!216361))

(assert (=> b!190331 m!216363))

(assert (=> b!190069 d!55755))

(declare-fun d!55757 () Bool)

(declare-fun e!125256 () Bool)

(assert (=> d!55757 e!125256))

(declare-fun res!89943 () Bool)

(assert (=> d!55757 (=> (not res!89943) (not e!125256))))

(declare-fun lt!94286 () ListLongMap!2383)

(assert (=> d!55757 (= res!89943 (contains!1322 lt!94286 (_1!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94288 () List!2397)

(assert (=> d!55757 (= lt!94286 (ListLongMap!2384 lt!94288))))

(declare-fun lt!94285 () Unit!5699)

(declare-fun lt!94287 () Unit!5699)

(assert (=> d!55757 (= lt!94285 lt!94287)))

(assert (=> d!55757 (= (getValueByKey!234 lt!94288 (_1!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55757 (= lt!94287 (lemmaContainsTupThenGetReturnValue!124 lt!94288 (_1!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55757 (= lt!94288 (insertStrictlySorted!127 (toList!1207 lt!94113) (_1!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55757 (= (+!299 lt!94113 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))) lt!94286)))

(declare-fun b!190332 () Bool)

(declare-fun res!89942 () Bool)

(assert (=> b!190332 (=> (not res!89942) (not e!125256))))

(assert (=> b!190332 (= res!89942 (= (getValueByKey!234 (toList!1207 lt!94286) (_1!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190333 () Bool)

(assert (=> b!190333 (= e!125256 (contains!1323 (toList!1207 lt!94286) (tuple2!3475 lt!94110 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55757 res!89943) b!190332))

(assert (= (and b!190332 res!89942) b!190333))

(declare-fun m!216365 () Bool)

(assert (=> d!55757 m!216365))

(declare-fun m!216367 () Bool)

(assert (=> d!55757 m!216367))

(declare-fun m!216369 () Bool)

(assert (=> d!55757 m!216369))

(declare-fun m!216371 () Bool)

(assert (=> d!55757 m!216371))

(declare-fun m!216373 () Bool)

(assert (=> b!190332 m!216373))

(declare-fun m!216375 () Bool)

(assert (=> b!190333 m!216375))

(assert (=> b!190069 d!55757))

(declare-fun d!55759 () Bool)

(declare-fun e!125257 () Bool)

(assert (=> d!55759 e!125257))

(declare-fun res!89945 () Bool)

(assert (=> d!55759 (=> (not res!89945) (not e!125257))))

(declare-fun lt!94290 () ListLongMap!2383)

(assert (=> d!55759 (= res!89945 (contains!1322 lt!94290 (_1!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94292 () List!2397)

(assert (=> d!55759 (= lt!94290 (ListLongMap!2384 lt!94292))))

(declare-fun lt!94289 () Unit!5699)

(declare-fun lt!94291 () Unit!5699)

(assert (=> d!55759 (= lt!94289 lt!94291)))

(assert (=> d!55759 (= (getValueByKey!234 lt!94292 (_1!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))))))

(assert (=> d!55759 (= lt!94291 (lemmaContainsTupThenGetReturnValue!124 lt!94292 (_1!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))))))

(assert (=> d!55759 (= lt!94292 (insertStrictlySorted!127 (toList!1207 lt!94122) (_1!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))) (_2!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))))))

(assert (=> d!55759 (= (+!299 lt!94122 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))) lt!94290)))

(declare-fun b!190334 () Bool)

(declare-fun res!89944 () Bool)

(assert (=> b!190334 (=> (not res!89944) (not e!125257))))

(assert (=> b!190334 (= res!89944 (= (getValueByKey!234 (toList!1207 lt!94290) (_1!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248)))) (Some!239 (_2!1748 (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))))))))

(declare-fun b!190335 () Bool)

(assert (=> b!190335 (= e!125257 (contains!1323 (toList!1207 lt!94290) (tuple2!3475 lt!94116 (minValue!3721 thiss!1248))))))

(assert (= (and d!55759 res!89945) b!190334))

(assert (= (and b!190334 res!89944) b!190335))

(declare-fun m!216377 () Bool)

(assert (=> d!55759 m!216377))

(declare-fun m!216379 () Bool)

(assert (=> d!55759 m!216379))

(declare-fun m!216381 () Bool)

(assert (=> d!55759 m!216381))

(declare-fun m!216383 () Bool)

(assert (=> d!55759 m!216383))

(declare-fun m!216385 () Bool)

(assert (=> b!190334 m!216385))

(declare-fun m!216387 () Bool)

(assert (=> b!190335 m!216387))

(assert (=> b!190069 d!55759))

(declare-fun d!55761 () Bool)

(assert (=> d!55761 (= (apply!179 (+!299 lt!94115 (tuple2!3475 lt!94107 (minValue!3721 thiss!1248))) lt!94106) (apply!179 lt!94115 lt!94106))))

(declare-fun lt!94293 () Unit!5699)

(assert (=> d!55761 (= lt!94293 (choose!1031 lt!94115 lt!94107 (minValue!3721 thiss!1248) lt!94106))))

(declare-fun e!125258 () Bool)

(assert (=> d!55761 e!125258))

(declare-fun res!89946 () Bool)

(assert (=> d!55761 (=> (not res!89946) (not e!125258))))

(assert (=> d!55761 (= res!89946 (contains!1322 lt!94115 lt!94106))))

(assert (=> d!55761 (= (addApplyDifferent!155 lt!94115 lt!94107 (minValue!3721 thiss!1248) lt!94106) lt!94293)))

(declare-fun b!190336 () Bool)

(assert (=> b!190336 (= e!125258 (not (= lt!94106 lt!94107)))))

(assert (= (and d!55761 res!89946) b!190336))

(assert (=> d!55761 m!215921))

(declare-fun m!216389 () Bool)

(assert (=> d!55761 m!216389))

(assert (=> d!55761 m!215909))

(assert (=> d!55761 m!215909))

(assert (=> d!55761 m!215929))

(declare-fun m!216391 () Bool)

(assert (=> d!55761 m!216391))

(assert (=> b!190069 d!55761))

(declare-fun d!55763 () Bool)

(declare-fun res!89955 () Bool)

(declare-fun e!125261 () Bool)

(assert (=> d!55763 (=> (not res!89955) (not e!125261))))

(assert (=> d!55763 (= res!89955 (validMask!0 (mask!9077 thiss!1248)))))

(assert (=> d!55763 (= (simpleValid!195 thiss!1248) e!125261)))

(declare-fun b!190346 () Bool)

(declare-fun res!89957 () Bool)

(assert (=> b!190346 (=> (not res!89957) (not e!125261))))

(declare-fun size!4135 (LongMapFixedSize!2656) (_ BitVec 32))

(assert (=> b!190346 (= res!89957 (bvsge (size!4135 thiss!1248) (_size!1377 thiss!1248)))))

(declare-fun b!190345 () Bool)

(declare-fun res!89958 () Bool)

(assert (=> b!190345 (=> (not res!89958) (not e!125261))))

(assert (=> b!190345 (= res!89958 (and (= (size!4130 (_values!3863 thiss!1248)) (bvadd (mask!9077 thiss!1248) #b00000000000000000000000000000001)) (= (size!4129 (_keys!5848 thiss!1248)) (size!4130 (_values!3863 thiss!1248))) (bvsge (_size!1377 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1377 thiss!1248) (bvadd (mask!9077 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!190348 () Bool)

(assert (=> b!190348 (= e!125261 (and (bvsge (extraKeys!3617 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3617 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1377 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!190347 () Bool)

(declare-fun res!89956 () Bool)

(assert (=> b!190347 (=> (not res!89956) (not e!125261))))

(assert (=> b!190347 (= res!89956 (= (size!4135 thiss!1248) (bvadd (_size!1377 thiss!1248) (bvsdiv (bvadd (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!55763 res!89955) b!190345))

(assert (= (and b!190345 res!89958) b!190346))

(assert (= (and b!190346 res!89957) b!190347))

(assert (= (and b!190347 res!89956) b!190348))

(assert (=> d!55763 m!215779))

(declare-fun m!216393 () Bool)

(assert (=> b!190346 m!216393))

(assert (=> b!190347 m!216393))

(assert (=> d!55641 d!55763))

(declare-fun d!55765 () Bool)

(assert (=> d!55765 (= (apply!179 lt!94126 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) (get!2193 (getValueByKey!234 (toList!1207 lt!94126) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7605 () Bool)

(assert (= bs!7605 d!55765))

(assert (=> bs!7605 m!215893))

(declare-fun m!216395 () Bool)

(assert (=> bs!7605 m!216395))

(assert (=> bs!7605 m!216395))

(declare-fun m!216397 () Bool)

(assert (=> bs!7605 m!216397))

(assert (=> b!190082 d!55765))

(declare-fun d!55767 () Bool)

(declare-fun c!34226 () Bool)

(assert (=> d!55767 (= c!34226 ((_ is ValueCellFull!1874) (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125262 () V!5561)

(assert (=> d!55767 (= (get!2192 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125262)))

(declare-fun b!190349 () Bool)

(assert (=> b!190349 (= e!125262 (get!2194 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190350 () Bool)

(assert (=> b!190350 (= e!125262 (get!2195 (select (arr!3809 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55767 c!34226) b!190349))

(assert (= (and d!55767 (not c!34226)) b!190350))

(assert (=> b!190349 m!215991))

(assert (=> b!190349 m!215939))

(declare-fun m!216399 () Bool)

(assert (=> b!190349 m!216399))

(assert (=> b!190350 m!215991))

(assert (=> b!190350 m!215939))

(declare-fun m!216401 () Bool)

(assert (=> b!190350 m!216401))

(assert (=> b!190082 d!55767))

(declare-fun d!55769 () Bool)

(declare-fun e!125264 () Bool)

(assert (=> d!55769 e!125264))

(declare-fun res!89959 () Bool)

(assert (=> d!55769 (=> res!89959 e!125264)))

(declare-fun lt!94295 () Bool)

(assert (=> d!55769 (= res!89959 (not lt!94295))))

(declare-fun lt!94296 () Bool)

(assert (=> d!55769 (= lt!94295 lt!94296)))

(declare-fun lt!94294 () Unit!5699)

(declare-fun e!125263 () Unit!5699)

(assert (=> d!55769 (= lt!94294 e!125263)))

(declare-fun c!34227 () Bool)

(assert (=> d!55769 (= c!34227 lt!94296)))

(assert (=> d!55769 (= lt!94296 (containsKey!238 (toList!1207 lt!94054) (_1!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> d!55769 (= (contains!1322 lt!94054 (_1!1748 (tuple2!3475 key!828 v!309))) lt!94295)))

(declare-fun b!190351 () Bool)

(declare-fun lt!94297 () Unit!5699)

(assert (=> b!190351 (= e!125263 lt!94297)))

(assert (=> b!190351 (= lt!94297 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94054) (_1!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> b!190351 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94054) (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun b!190352 () Bool)

(declare-fun Unit!5714 () Unit!5699)

(assert (=> b!190352 (= e!125263 Unit!5714)))

(declare-fun b!190353 () Bool)

(assert (=> b!190353 (= e!125264 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94054) (_1!1748 (tuple2!3475 key!828 v!309)))))))

(assert (= (and d!55769 c!34227) b!190351))

(assert (= (and d!55769 (not c!34227)) b!190352))

(assert (= (and d!55769 (not res!89959)) b!190353))

(declare-fun m!216403 () Bool)

(assert (=> d!55769 m!216403))

(declare-fun m!216405 () Bool)

(assert (=> b!190351 m!216405))

(assert (=> b!190351 m!215889))

(assert (=> b!190351 m!215889))

(declare-fun m!216407 () Bool)

(assert (=> b!190351 m!216407))

(assert (=> b!190353 m!215889))

(assert (=> b!190353 m!215889))

(assert (=> b!190353 m!216407))

(assert (=> d!55633 d!55769))

(declare-fun d!55771 () Bool)

(declare-fun c!34228 () Bool)

(assert (=> d!55771 (= c!34228 (and ((_ is Cons!2393) lt!94056) (= (_1!1748 (h!3030 lt!94056)) (_1!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun e!125265 () Option!240)

(assert (=> d!55771 (= (getValueByKey!234 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309))) e!125265)))

(declare-fun b!190355 () Bool)

(declare-fun e!125266 () Option!240)

(assert (=> b!190355 (= e!125265 e!125266)))

(declare-fun c!34229 () Bool)

(assert (=> b!190355 (= c!34229 (and ((_ is Cons!2393) lt!94056) (not (= (_1!1748 (h!3030 lt!94056)) (_1!1748 (tuple2!3475 key!828 v!309))))))))

(declare-fun b!190356 () Bool)

(assert (=> b!190356 (= e!125266 (getValueByKey!234 (t!7296 lt!94056) (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun b!190357 () Bool)

(assert (=> b!190357 (= e!125266 None!238)))

(declare-fun b!190354 () Bool)

(assert (=> b!190354 (= e!125265 (Some!239 (_2!1748 (h!3030 lt!94056))))))

(assert (= (and d!55771 c!34228) b!190354))

(assert (= (and d!55771 (not c!34228)) b!190355))

(assert (= (and b!190355 c!34229) b!190356))

(assert (= (and b!190355 (not c!34229)) b!190357))

(declare-fun m!216409 () Bool)

(assert (=> b!190356 m!216409))

(assert (=> d!55633 d!55771))

(declare-fun d!55773 () Bool)

(assert (=> d!55773 (= (getValueByKey!234 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309))) (Some!239 (_2!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun lt!94300 () Unit!5699)

(declare-fun choose!1033 (List!2397 (_ BitVec 64) V!5561) Unit!5699)

(assert (=> d!55773 (= lt!94300 (choose!1033 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun e!125269 () Bool)

(assert (=> d!55773 e!125269))

(declare-fun res!89964 () Bool)

(assert (=> d!55773 (=> (not res!89964) (not e!125269))))

(assert (=> d!55773 (= res!89964 (isStrictlySorted!348 lt!94056))))

(assert (=> d!55773 (= (lemmaContainsTupThenGetReturnValue!124 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))) lt!94300)))

(declare-fun b!190362 () Bool)

(declare-fun res!89965 () Bool)

(assert (=> b!190362 (=> (not res!89965) (not e!125269))))

(assert (=> b!190362 (= res!89965 (containsKey!238 lt!94056 (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun b!190363 () Bool)

(assert (=> b!190363 (= e!125269 (contains!1323 lt!94056 (tuple2!3475 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309)))))))

(assert (= (and d!55773 res!89964) b!190362))

(assert (= (and b!190362 res!89965) b!190363))

(assert (=> d!55773 m!215883))

(declare-fun m!216411 () Bool)

(assert (=> d!55773 m!216411))

(declare-fun m!216413 () Bool)

(assert (=> d!55773 m!216413))

(declare-fun m!216415 () Bool)

(assert (=> b!190362 m!216415))

(declare-fun m!216417 () Bool)

(assert (=> b!190363 m!216417))

(assert (=> d!55633 d!55773))

(declare-fun lt!94303 () List!2397)

(declare-fun b!190384 () Bool)

(declare-fun e!125282 () Bool)

(assert (=> b!190384 (= e!125282 (contains!1323 lt!94303 (tuple2!3475 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun b!190385 () Bool)

(declare-fun e!125281 () List!2397)

(declare-fun e!125284 () List!2397)

(assert (=> b!190385 (= e!125281 e!125284)))

(declare-fun c!34240 () Bool)

(assert (=> b!190385 (= c!34240 (and ((_ is Cons!2393) (toList!1207 lt!93986)) (= (_1!1748 (h!3030 (toList!1207 lt!93986))) (_1!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun b!190386 () Bool)

(declare-fun e!125280 () List!2397)

(declare-fun call!19199 () List!2397)

(assert (=> b!190386 (= e!125280 call!19199)))

(declare-fun b!190387 () Bool)

(declare-fun res!89971 () Bool)

(assert (=> b!190387 (=> (not res!89971) (not e!125282))))

(assert (=> b!190387 (= res!89971 (containsKey!238 lt!94303 (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun d!55775 () Bool)

(assert (=> d!55775 e!125282))

(declare-fun res!89970 () Bool)

(assert (=> d!55775 (=> (not res!89970) (not e!125282))))

(assert (=> d!55775 (= res!89970 (isStrictlySorted!348 lt!94303))))

(assert (=> d!55775 (= lt!94303 e!125281)))

(declare-fun c!34238 () Bool)

(assert (=> d!55775 (= c!34238 (and ((_ is Cons!2393) (toList!1207 lt!93986)) (bvslt (_1!1748 (h!3030 (toList!1207 lt!93986))) (_1!1748 (tuple2!3475 key!828 v!309)))))))

(assert (=> d!55775 (isStrictlySorted!348 (toList!1207 lt!93986))))

(assert (=> d!55775 (= (insertStrictlySorted!127 (toList!1207 lt!93986) (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))) lt!94303)))

(declare-fun c!34239 () Bool)

(declare-fun b!190388 () Bool)

(assert (=> b!190388 (= c!34239 (and ((_ is Cons!2393) (toList!1207 lt!93986)) (bvsgt (_1!1748 (h!3030 (toList!1207 lt!93986))) (_1!1748 (tuple2!3475 key!828 v!309)))))))

(assert (=> b!190388 (= e!125284 e!125280)))

(declare-fun bm!19194 () Bool)

(declare-fun call!19197 () List!2397)

(assert (=> bm!19194 (= call!19199 call!19197)))

(declare-fun bm!19195 () Bool)

(declare-fun call!19198 () List!2397)

(assert (=> bm!19195 (= call!19197 call!19198)))

(declare-fun b!190389 () Bool)

(assert (=> b!190389 (= e!125281 call!19198)))

(declare-fun b!190390 () Bool)

(assert (=> b!190390 (= e!125280 call!19199)))

(declare-fun b!190391 () Bool)

(assert (=> b!190391 (= e!125284 call!19197)))

(declare-fun e!125283 () List!2397)

(declare-fun bm!19196 () Bool)

(declare-fun $colon$colon!98 (List!2397 tuple2!3474) List!2397)

(assert (=> bm!19196 (= call!19198 ($colon$colon!98 e!125283 (ite c!34238 (h!3030 (toList!1207 lt!93986)) (tuple2!3475 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))))

(declare-fun c!34241 () Bool)

(assert (=> bm!19196 (= c!34241 c!34238)))

(declare-fun b!190392 () Bool)

(assert (=> b!190392 (= e!125283 (ite c!34240 (t!7296 (toList!1207 lt!93986)) (ite c!34239 (Cons!2393 (h!3030 (toList!1207 lt!93986)) (t!7296 (toList!1207 lt!93986))) Nil!2394)))))

(declare-fun b!190393 () Bool)

(assert (=> b!190393 (= e!125283 (insertStrictlySorted!127 (t!7296 (toList!1207 lt!93986)) (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(assert (= (and d!55775 c!34238) b!190389))

(assert (= (and d!55775 (not c!34238)) b!190385))

(assert (= (and b!190385 c!34240) b!190391))

(assert (= (and b!190385 (not c!34240)) b!190388))

(assert (= (and b!190388 c!34239) b!190386))

(assert (= (and b!190388 (not c!34239)) b!190390))

(assert (= (or b!190386 b!190390) bm!19194))

(assert (= (or b!190391 bm!19194) bm!19195))

(assert (= (or b!190389 bm!19195) bm!19196))

(assert (= (and bm!19196 c!34241) b!190393))

(assert (= (and bm!19196 (not c!34241)) b!190392))

(assert (= (and d!55775 res!89970) b!190387))

(assert (= (and b!190387 res!89971) b!190384))

(declare-fun m!216419 () Bool)

(assert (=> b!190384 m!216419))

(declare-fun m!216421 () Bool)

(assert (=> bm!19196 m!216421))

(declare-fun m!216423 () Bool)

(assert (=> b!190387 m!216423))

(declare-fun m!216425 () Bool)

(assert (=> d!55775 m!216425))

(assert (=> d!55775 m!216239))

(declare-fun m!216427 () Bool)

(assert (=> b!190393 m!216427))

(assert (=> d!55633 d!55775))

(assert (=> d!55635 d!55629))

(assert (=> d!55637 d!55629))

(declare-fun bm!19199 () Bool)

(declare-fun call!19202 () Bool)

(assert (=> bm!19199 (= call!19202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun d!55777 () Bool)

(declare-fun res!89976 () Bool)

(declare-fun e!125292 () Bool)

(assert (=> d!55777 (=> res!89976 e!125292)))

(assert (=> d!55777 (= res!89976 (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5848 thiss!1248))))))

(assert (=> d!55777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)) e!125292)))

(declare-fun b!190402 () Bool)

(declare-fun e!125293 () Bool)

(assert (=> b!190402 (= e!125292 e!125293)))

(declare-fun c!34244 () Bool)

(assert (=> b!190402 (= c!34244 (validKeyInArray!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190403 () Bool)

(assert (=> b!190403 (= e!125293 call!19202)))

(declare-fun b!190404 () Bool)

(declare-fun e!125291 () Bool)

(assert (=> b!190404 (= e!125293 e!125291)))

(declare-fun lt!94312 () (_ BitVec 64))

(assert (=> b!190404 (= lt!94312 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94310 () Unit!5699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8083 (_ BitVec 64) (_ BitVec 32)) Unit!5699)

(assert (=> b!190404 (= lt!94310 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5848 thiss!1248) lt!94312 #b00000000000000000000000000000000))))

(assert (=> b!190404 (arrayContainsKey!0 (_keys!5848 thiss!1248) lt!94312 #b00000000000000000000000000000000)))

(declare-fun lt!94311 () Unit!5699)

(assert (=> b!190404 (= lt!94311 lt!94310)))

(declare-fun res!89977 () Bool)

(assert (=> b!190404 (= res!89977 (= (seekEntryOrOpen!0 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000) (_keys!5848 thiss!1248) (mask!9077 thiss!1248)) (Found!675 #b00000000000000000000000000000000)))))

(assert (=> b!190404 (=> (not res!89977) (not e!125291))))

(declare-fun b!190405 () Bool)

(assert (=> b!190405 (= e!125291 call!19202)))

(assert (= (and d!55777 (not res!89976)) b!190402))

(assert (= (and b!190402 c!34244) b!190404))

(assert (= (and b!190402 (not c!34244)) b!190403))

(assert (= (and b!190404 res!89977) b!190405))

(assert (= (or b!190405 b!190403) bm!19199))

(declare-fun m!216429 () Bool)

(assert (=> bm!19199 m!216429))

(assert (=> b!190402 m!215893))

(assert (=> b!190402 m!215893))

(assert (=> b!190402 m!215899))

(assert (=> b!190404 m!215893))

(declare-fun m!216431 () Bool)

(assert (=> b!190404 m!216431))

(declare-fun m!216433 () Bool)

(assert (=> b!190404 m!216433))

(assert (=> b!190404 m!215893))

(declare-fun m!216435 () Bool)

(assert (=> b!190404 m!216435))

(assert (=> b!190118 d!55777))

(declare-fun d!55779 () Bool)

(declare-fun e!125295 () Bool)

(assert (=> d!55779 e!125295))

(declare-fun res!89978 () Bool)

(assert (=> d!55779 (=> res!89978 e!125295)))

(declare-fun lt!94314 () Bool)

(assert (=> d!55779 (= res!89978 (not lt!94314))))

(declare-fun lt!94315 () Bool)

(assert (=> d!55779 (= lt!94314 lt!94315)))

(declare-fun lt!94313 () Unit!5699)

(declare-fun e!125294 () Unit!5699)

(assert (=> d!55779 (= lt!94313 e!125294)))

(declare-fun c!34245 () Bool)

(assert (=> d!55779 (= c!34245 lt!94315)))

(assert (=> d!55779 (= lt!94315 (containsKey!238 (toList!1207 lt!94126) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55779 (= (contains!1322 lt!94126 (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)) lt!94314)))

(declare-fun b!190406 () Bool)

(declare-fun lt!94316 () Unit!5699)

(assert (=> b!190406 (= e!125294 lt!94316)))

(assert (=> b!190406 (= lt!94316 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1207 lt!94126) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190406 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94126) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190407 () Bool)

(declare-fun Unit!5715 () Unit!5699)

(assert (=> b!190407 (= e!125294 Unit!5715)))

(declare-fun b!190408 () Bool)

(assert (=> b!190408 (= e!125295 (isDefined!188 (getValueByKey!234 (toList!1207 lt!94126) (select (arr!3808 (_keys!5848 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55779 c!34245) b!190406))

(assert (= (and d!55779 (not c!34245)) b!190407))

(assert (= (and d!55779 (not res!89978)) b!190408))

(assert (=> d!55779 m!215893))

(declare-fun m!216437 () Bool)

(assert (=> d!55779 m!216437))

(assert (=> b!190406 m!215893))

(declare-fun m!216439 () Bool)

(assert (=> b!190406 m!216439))

(assert (=> b!190406 m!215893))

(assert (=> b!190406 m!216395))

(assert (=> b!190406 m!216395))

(declare-fun m!216441 () Bool)

(assert (=> b!190406 m!216441))

(assert (=> b!190408 m!215893))

(assert (=> b!190408 m!216395))

(assert (=> b!190408 m!216395))

(assert (=> b!190408 m!216441))

(assert (=> b!190101 d!55779))

(declare-fun b!190427 () Bool)

(declare-fun e!125310 () SeekEntryResult!675)

(assert (=> b!190427 (= e!125310 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9077 thiss!1248)) #b00000000000000000000000000000000 (mask!9077 thiss!1248)) key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(declare-fun b!190428 () Bool)

(declare-fun e!125307 () SeekEntryResult!675)

(assert (=> b!190428 (= e!125307 e!125310)))

(declare-fun c!34254 () Bool)

(declare-fun lt!94321 () (_ BitVec 64))

(assert (=> b!190428 (= c!34254 (or (= lt!94321 key!828) (= (bvadd lt!94321 lt!94321) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190429 () Bool)

(declare-fun lt!94322 () SeekEntryResult!675)

(assert (=> b!190429 (and (bvsge (index!4872 lt!94322) #b00000000000000000000000000000000) (bvslt (index!4872 lt!94322) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun e!125308 () Bool)

(assert (=> b!190429 (= e!125308 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4872 lt!94322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55781 () Bool)

(declare-fun e!125306 () Bool)

(assert (=> d!55781 e!125306))

(declare-fun c!34252 () Bool)

(assert (=> d!55781 (= c!34252 (and ((_ is Intermediate!675) lt!94322) (undefined!1487 lt!94322)))))

(assert (=> d!55781 (= lt!94322 e!125307)))

(declare-fun c!34253 () Bool)

(assert (=> d!55781 (= c!34253 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55781 (= lt!94321 (select (arr!3808 (_keys!5848 thiss!1248)) (toIndex!0 key!828 (mask!9077 thiss!1248))))))

(assert (=> d!55781 (validMask!0 (mask!9077 thiss!1248))))

(assert (=> d!55781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9077 thiss!1248)) key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)) lt!94322)))

(declare-fun b!190430 () Bool)

(assert (=> b!190430 (and (bvsge (index!4872 lt!94322) #b00000000000000000000000000000000) (bvslt (index!4872 lt!94322) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun res!89987 () Bool)

(assert (=> b!190430 (= res!89987 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4872 lt!94322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190430 (=> res!89987 e!125308)))

(declare-fun b!190431 () Bool)

(assert (=> b!190431 (= e!125307 (Intermediate!675 true (toIndex!0 key!828 (mask!9077 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190432 () Bool)

(declare-fun e!125309 () Bool)

(assert (=> b!190432 (= e!125306 e!125309)))

(declare-fun res!89986 () Bool)

(assert (=> b!190432 (= res!89986 (and ((_ is Intermediate!675) lt!94322) (not (undefined!1487 lt!94322)) (bvslt (x!20476 lt!94322) #b01111111111111111111111111111110) (bvsge (x!20476 lt!94322) #b00000000000000000000000000000000) (bvsge (x!20476 lt!94322) #b00000000000000000000000000000000)))))

(assert (=> b!190432 (=> (not res!89986) (not e!125309))))

(declare-fun b!190433 () Bool)

(assert (=> b!190433 (= e!125306 (bvsge (x!20476 lt!94322) #b01111111111111111111111111111110))))

(declare-fun b!190434 () Bool)

(assert (=> b!190434 (and (bvsge (index!4872 lt!94322) #b00000000000000000000000000000000) (bvslt (index!4872 lt!94322) (size!4129 (_keys!5848 thiss!1248))))))

(declare-fun res!89985 () Bool)

(assert (=> b!190434 (= res!89985 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4872 lt!94322)) key!828))))

(assert (=> b!190434 (=> res!89985 e!125308)))

(assert (=> b!190434 (= e!125309 e!125308)))

(declare-fun b!190435 () Bool)

(assert (=> b!190435 (= e!125310 (Intermediate!675 false (toIndex!0 key!828 (mask!9077 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!55781 c!34253) b!190431))

(assert (= (and d!55781 (not c!34253)) b!190428))

(assert (= (and b!190428 c!34254) b!190435))

(assert (= (and b!190428 (not c!34254)) b!190427))

(assert (= (and d!55781 c!34252) b!190433))

(assert (= (and d!55781 (not c!34252)) b!190432))

(assert (= (and b!190432 res!89986) b!190434))

(assert (= (and b!190434 (not res!89985)) b!190430))

(assert (= (and b!190430 (not res!89987)) b!190429))

(declare-fun m!216443 () Bool)

(assert (=> b!190429 m!216443))

(assert (=> b!190434 m!216443))

(assert (=> d!55781 m!215865))

(declare-fun m!216445 () Bool)

(assert (=> d!55781 m!216445))

(assert (=> d!55781 m!215779))

(assert (=> b!190430 m!216443))

(assert (=> b!190427 m!215865))

(declare-fun m!216447 () Bool)

(assert (=> b!190427 m!216447))

(assert (=> b!190427 m!216447))

(declare-fun m!216449 () Bool)

(assert (=> b!190427 m!216449))

(assert (=> d!55627 d!55781))

(declare-fun d!55783 () Bool)

(declare-fun lt!94328 () (_ BitVec 32))

(declare-fun lt!94327 () (_ BitVec 32))

(assert (=> d!55783 (= lt!94328 (bvmul (bvxor lt!94327 (bvlshr lt!94327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55783 (= lt!94327 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55783 (and (bvsge (mask!9077 thiss!1248) #b00000000000000000000000000000000) (let ((res!89988 (let ((h!3032 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20495 (bvmul (bvxor h!3032 (bvlshr h!3032 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20495 (bvlshr x!20495 #b00000000000000000000000000001101)) (mask!9077 thiss!1248)))))) (and (bvslt res!89988 (bvadd (mask!9077 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!89988 #b00000000000000000000000000000000))))))

(assert (=> d!55783 (= (toIndex!0 key!828 (mask!9077 thiss!1248)) (bvand (bvxor lt!94328 (bvlshr lt!94328 #b00000000000000000000000000001101)) (mask!9077 thiss!1248)))))

(assert (=> d!55627 d!55783))

(assert (=> d!55627 d!55629))

(assert (=> d!55647 d!55627))

(declare-fun bm!19204 () Bool)

(declare-fun call!19208 () Bool)

(assert (=> bm!19204 (= call!19208 (arrayContainsKey!0 (_keys!5848 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190452 () Bool)

(declare-fun res!90000 () Bool)

(declare-fun e!125322 () Bool)

(assert (=> b!190452 (=> (not res!90000) (not e!125322))))

(declare-fun lt!94331 () SeekEntryResult!675)

(assert (=> b!190452 (= res!90000 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4873 lt!94331)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190453 () Bool)

(declare-fun e!125321 () Bool)

(assert (=> b!190453 (= e!125321 (not call!19208))))

(declare-fun b!190454 () Bool)

(declare-fun e!125319 () Bool)

(declare-fun e!125320 () Bool)

(assert (=> b!190454 (= e!125319 e!125320)))

(declare-fun c!34260 () Bool)

(assert (=> b!190454 (= c!34260 ((_ is MissingVacant!675) lt!94331))))

(declare-fun b!190455 () Bool)

(assert (=> b!190455 (= e!125319 e!125321)))

(declare-fun res!89997 () Bool)

(declare-fun call!19207 () Bool)

(assert (=> b!190455 (= res!89997 call!19207)))

(assert (=> b!190455 (=> (not res!89997) (not e!125321))))

(declare-fun b!190456 () Bool)

(assert (=> b!190456 (= e!125320 ((_ is Undefined!675) lt!94331))))

(declare-fun b!190457 () Bool)

(declare-fun res!89998 () Bool)

(assert (=> b!190457 (=> (not res!89998) (not e!125322))))

(assert (=> b!190457 (= res!89998 call!19207)))

(assert (=> b!190457 (= e!125320 e!125322)))

(declare-fun d!55785 () Bool)

(assert (=> d!55785 e!125319))

(declare-fun c!34259 () Bool)

(assert (=> d!55785 (= c!34259 ((_ is MissingZero!675) lt!94331))))

(assert (=> d!55785 (= lt!94331 (seekEntryOrOpen!0 key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(assert (=> d!55785 true))

(declare-fun _$34!1075 () Unit!5699)

(assert (=> d!55785 (= (choose!1029 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) _$34!1075)))

(declare-fun b!190458 () Bool)

(assert (=> b!190458 (= e!125322 (not call!19208))))

(declare-fun b!190459 () Bool)

(declare-fun res!89999 () Bool)

(assert (=> b!190459 (= res!89999 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4870 lt!94331)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190459 (=> (not res!89999) (not e!125321))))

(declare-fun bm!19205 () Bool)

(assert (=> bm!19205 (= call!19207 (inRange!0 (ite c!34259 (index!4870 lt!94331) (index!4873 lt!94331)) (mask!9077 thiss!1248)))))

(assert (= (and d!55785 c!34259) b!190455))

(assert (= (and d!55785 (not c!34259)) b!190454))

(assert (= (and b!190455 res!89997) b!190459))

(assert (= (and b!190459 res!89999) b!190453))

(assert (= (and b!190454 c!34260) b!190457))

(assert (= (and b!190454 (not c!34260)) b!190456))

(assert (= (and b!190457 res!89998) b!190452))

(assert (= (and b!190452 res!90000) b!190458))

(assert (= (or b!190455 b!190457) bm!19205))

(assert (= (or b!190453 b!190458) bm!19204))

(declare-fun m!216451 () Bool)

(assert (=> b!190452 m!216451))

(assert (=> d!55785 m!215781))

(declare-fun m!216453 () Bool)

(assert (=> bm!19205 m!216453))

(declare-fun m!216455 () Bool)

(assert (=> b!190459 m!216455))

(assert (=> bm!19204 m!216025))

(assert (=> d!55647 d!55785))

(assert (=> d!55647 d!55629))

(assert (=> d!55623 d!55627))

(declare-fun d!55787 () Bool)

(declare-fun e!125325 () Bool)

(assert (=> d!55787 e!125325))

(declare-fun res!90005 () Bool)

(assert (=> d!55787 (=> (not res!90005) (not e!125325))))

(declare-fun lt!94334 () SeekEntryResult!675)

(assert (=> d!55787 (= res!90005 ((_ is Found!675) lt!94334))))

(assert (=> d!55787 (= lt!94334 (seekEntryOrOpen!0 key!828 (_keys!5848 thiss!1248) (mask!9077 thiss!1248)))))

(assert (=> d!55787 true))

(declare-fun _$33!138 () Unit!5699)

(assert (=> d!55787 (= (choose!1027 (_keys!5848 thiss!1248) (_values!3863 thiss!1248) (mask!9077 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) _$33!138)))

(declare-fun b!190464 () Bool)

(declare-fun res!90006 () Bool)

(assert (=> b!190464 (=> (not res!90006) (not e!125325))))

(assert (=> b!190464 (= res!90006 (inRange!0 (index!4871 lt!94334) (mask!9077 thiss!1248)))))

(declare-fun b!190465 () Bool)

(assert (=> b!190465 (= e!125325 (= (select (arr!3808 (_keys!5848 thiss!1248)) (index!4871 lt!94334)) key!828))))

(assert (= (and d!55787 res!90005) b!190464))

(assert (= (and b!190464 res!90006) b!190465))

(assert (=> d!55787 m!215781))

(declare-fun m!216457 () Bool)

(assert (=> b!190464 m!216457))

(declare-fun m!216459 () Bool)

(assert (=> b!190465 m!216459))

(assert (=> d!55623 d!55787))

(assert (=> d!55623 d!55629))

(assert (=> b!190068 d!55661))

(declare-fun d!55789 () Bool)

(declare-fun e!125326 () Bool)

(assert (=> d!55789 e!125326))

(declare-fun res!90008 () Bool)

(assert (=> d!55789 (=> (not res!90008) (not e!125326))))

(declare-fun lt!94336 () ListLongMap!2383)

(assert (=> d!55789 (= res!90008 (contains!1322 lt!94336 (_1!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun lt!94338 () List!2397)

(assert (=> d!55789 (= lt!94336 (ListLongMap!2384 lt!94338))))

(declare-fun lt!94335 () Unit!5699)

(declare-fun lt!94337 () Unit!5699)

(assert (=> d!55789 (= lt!94335 lt!94337)))

(assert (=> d!55789 (= (getValueByKey!234 lt!94338 (_1!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!239 (_2!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55789 (= lt!94337 (lemmaContainsTupThenGetReturnValue!124 lt!94338 (_1!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55789 (= lt!94338 (insertStrictlySorted!127 (toList!1207 (ite c!34164 call!19169 (ite c!34159 call!19170 call!19168))) (_1!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55789 (= (+!299 (ite c!34164 call!19169 (ite c!34159 call!19170 call!19168)) (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) lt!94336)))

(declare-fun b!190466 () Bool)

(declare-fun res!90007 () Bool)

(assert (=> b!190466 (=> (not res!90007) (not e!125326))))

(assert (=> b!190466 (= res!90007 (= (getValueByKey!234 (toList!1207 lt!94336) (_1!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!239 (_2!1748 (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))))

(declare-fun b!190467 () Bool)

(assert (=> b!190467 (= e!125326 (contains!1323 (toList!1207 lt!94336) (ite (or c!34164 c!34159) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (= (and d!55789 res!90008) b!190466))

(assert (= (and b!190466 res!90007) b!190467))

(declare-fun m!216461 () Bool)

(assert (=> d!55789 m!216461))

(declare-fun m!216463 () Bool)

(assert (=> d!55789 m!216463))

(declare-fun m!216465 () Bool)

(assert (=> d!55789 m!216465))

(declare-fun m!216467 () Bool)

(assert (=> d!55789 m!216467))

(declare-fun m!216469 () Bool)

(assert (=> b!190466 m!216469))

(declare-fun m!216471 () Bool)

(assert (=> b!190467 m!216471))

(assert (=> bm!19167 d!55789))

(declare-fun d!55791 () Bool)

(assert (=> d!55791 (= (apply!179 lt!94126 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2193 (getValueByKey!234 (toList!1207 lt!94126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7606 () Bool)

(assert (= bs!7606 d!55791))

(assert (=> bs!7606 m!216283))

(assert (=> bs!7606 m!216283))

(declare-fun m!216473 () Bool)

(assert (=> bs!7606 m!216473))

(assert (=> b!190099 d!55791))

(declare-fun d!55793 () Bool)

(declare-fun res!90013 () Bool)

(declare-fun e!125331 () Bool)

(assert (=> d!55793 (=> res!90013 e!125331)))

(assert (=> d!55793 (= res!90013 (and ((_ is Cons!2393) (toList!1207 lt!93986)) (= (_1!1748 (h!3030 (toList!1207 lt!93986))) key!828)))))

(assert (=> d!55793 (= (containsKey!238 (toList!1207 lt!93986) key!828) e!125331)))

(declare-fun b!190472 () Bool)

(declare-fun e!125332 () Bool)

(assert (=> b!190472 (= e!125331 e!125332)))

(declare-fun res!90014 () Bool)

(assert (=> b!190472 (=> (not res!90014) (not e!125332))))

(assert (=> b!190472 (= res!90014 (and (or (not ((_ is Cons!2393) (toList!1207 lt!93986))) (bvsle (_1!1748 (h!3030 (toList!1207 lt!93986))) key!828)) ((_ is Cons!2393) (toList!1207 lt!93986)) (bvslt (_1!1748 (h!3030 (toList!1207 lt!93986))) key!828)))))

(declare-fun b!190473 () Bool)

(assert (=> b!190473 (= e!125332 (containsKey!238 (t!7296 (toList!1207 lt!93986)) key!828))))

(assert (= (and d!55793 (not res!90013)) b!190472))

(assert (= (and b!190472 res!90014) b!190473))

(declare-fun m!216475 () Bool)

(assert (=> b!190473 m!216475))

(assert (=> d!55639 d!55793))

(assert (=> bm!19166 d!55665))

(declare-fun d!55795 () Bool)

(assert (=> d!55795 (= (apply!179 lt!94126 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2193 (getValueByKey!234 (toList!1207 lt!94126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7607 () Bool)

(assert (= bs!7607 d!55795))

(assert (=> bs!7607 m!216293))

(assert (=> bs!7607 m!216293))

(declare-fun m!216477 () Bool)

(assert (=> bs!7607 m!216477))

(assert (=> b!190097 d!55795))

(assert (=> b!190065 d!55661))

(declare-fun d!55797 () Bool)

(assert (=> d!55797 (= (inRange!0 (ite c!34172 (index!4870 lt!94162) (index!4873 lt!94162)) (mask!9077 thiss!1248)) (and (bvsge (ite c!34172 (index!4870 lt!94162) (index!4873 lt!94162)) #b00000000000000000000000000000000) (bvslt (ite c!34172 (index!4870 lt!94162) (index!4873 lt!94162)) (bvadd (mask!9077 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19177 d!55797))

(declare-fun mapIsEmpty!7664 () Bool)

(declare-fun mapRes!7664 () Bool)

(assert (=> mapIsEmpty!7664 mapRes!7664))

(declare-fun condMapEmpty!7664 () Bool)

(declare-fun mapDefault!7664 () ValueCell!1874)

(assert (=> mapNonEmpty!7663 (= condMapEmpty!7664 (= mapRest!7663 ((as const (Array (_ BitVec 32) ValueCell!1874)) mapDefault!7664)))))

(declare-fun e!125334 () Bool)

(assert (=> mapNonEmpty!7663 (= tp!16843 (and e!125334 mapRes!7664))))

(declare-fun b!190474 () Bool)

(declare-fun e!125333 () Bool)

(assert (=> b!190474 (= e!125333 tp_is_empty!4435)))

(declare-fun b!190475 () Bool)

(assert (=> b!190475 (= e!125334 tp_is_empty!4435)))

(declare-fun mapNonEmpty!7664 () Bool)

(declare-fun tp!16844 () Bool)

(assert (=> mapNonEmpty!7664 (= mapRes!7664 (and tp!16844 e!125333))))

(declare-fun mapKey!7664 () (_ BitVec 32))

(declare-fun mapRest!7664 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapValue!7664 () ValueCell!1874)

(assert (=> mapNonEmpty!7664 (= mapRest!7663 (store mapRest!7664 mapKey!7664 mapValue!7664))))

(assert (= (and mapNonEmpty!7663 condMapEmpty!7664) mapIsEmpty!7664))

(assert (= (and mapNonEmpty!7663 (not condMapEmpty!7664)) mapNonEmpty!7664))

(assert (= (and mapNonEmpty!7664 ((_ is ValueCellFull!1874) mapValue!7664)) b!190474))

(assert (= (and mapNonEmpty!7663 ((_ is ValueCellFull!1874) mapDefault!7664)) b!190475))

(declare-fun m!216479 () Bool)

(assert (=> mapNonEmpty!7664 m!216479))

(declare-fun b_lambda!7341 () Bool)

(assert (= b_lambda!7333 (or (and b!189916 b_free!4663) b_lambda!7341)))

(declare-fun b_lambda!7343 () Bool)

(assert (= b_lambda!7335 (or (and b!189916 b_free!4663) b_lambda!7343)))

(declare-fun b_lambda!7345 () Bool)

(assert (= b_lambda!7339 (or (and b!189916 b_free!4663) b_lambda!7345)))

(declare-fun b_lambda!7347 () Bool)

(assert (= b_lambda!7337 (or (and b!189916 b_free!4663) b_lambda!7347)))

(check-sat (not d!55649) (not d!55787) (not b!190203) tp_is_empty!4435 (not b!190224) (not b!190406) (not b!190346) (not b!190333) (not b!190275) (not b!190259) b_and!11299 (not b!190283) (not b!190384) (not d!55687) (not b!190327) (not d!55717) (not b!190198) (not bm!19181) (not b_lambda!7343) (not b!190152) (not d!55723) (not d!55745) (not bm!19199) (not d!55651) (not b!190307) (not b!190232) (not bm!19196) (not b!190276) (not d!55727) (not d!55693) (not b!190278) (not b!190219) (not b!190201) (not b!190211) (not b!190289) (not d!55665) (not b!190351) (not d!55749) (not d!55759) (not d!55683) (not b!190272) (not d!55695) (not d!55795) (not d!55779) (not b!190466) (not mapNonEmpty!7664) (not d!55675) (not b_lambda!7347) (not d!55741) (not b!190305) (not b!190239) (not b!190153) (not d!55689) (not d!55701) (not b!190212) (not b!190202) (not b!190362) (not b!190284) (not b!190467) (not d!55785) (not b!190228) (not b!190387) (not d!55747) (not d!55737) (not d!55719) (not b!190322) (not b!190288) (not b!190229) (not b!190240) (not d!55791) (not d!55707) (not d!55655) (not b!190317) (not b!190281) (not b!190225) (not d!55755) (not b_lambda!7329) (not d!55677) (not d!55721) (not b!190214) (not b!190473) (not b!190353) (not d!55769) (not bm!19187) (not d!55709) (not b!190200) (not d!55735) (not b!190280) (not b!190356) (not d!55751) (not b!190242) (not bm!19184) (not b!190332) (not b!190464) (not b!190349) (not b!190154) (not d!55697) (not b!190210) (not b!190320) (not d!55763) (not d!55679) (not b!190209) (not b!190331) (not d!55673) (not b!190324) (not b!190166) (not b!190347) (not b!190300) (not b!190215) (not d!55659) (not d!55711) (not b!190266) (not b_lambda!7341) (not b!190279) (not b!190265) (not d!55669) (not b!190303) (not d!55775) (not b!190427) (not d!55765) (not b!190363) (not b!190326) (not b!190155) (not b_lambda!7345) (not b!190206) (not d!55773) (not d!55733) (not d!55685) (not d!55781) (not bm!19180) (not b!190408) (not b!190393) (not d!55761) (not b!190173) (not b!190329) (not b!190170) (not b!190171) (not d!55731) (not d!55757) (not d!55681) (not d!55715) (not d!55663) (not b!190301) (not bm!19204) (not d!55739) (not d!55753) (not d!55671) (not d!55789) (not d!55691) (not b!190334) (not b_lambda!7331) (not b!190335) (not b!190323) (not d!55653) (not b_next!4663) (not b!190168) (not b!190350) (not b!190404) (not b!190402) (not b!190217) (not d!55667) (not b!190213) (not bm!19205) (not b!190205) (not d!55743) (not b!190287))
(check-sat b_and!11299 (not b_next!4663))
