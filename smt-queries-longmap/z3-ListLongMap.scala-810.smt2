; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19696 () Bool)

(assert start!19696)

(declare-fun b!192844 () Bool)

(declare-fun b_free!4699 () Bool)

(declare-fun b_next!4699 () Bool)

(assert (=> b!192844 (= b_free!4699 (not b_next!4699))))

(declare-fun tp!16957 () Bool)

(declare-fun b_and!11375 () Bool)

(assert (=> b!192844 (= tp!16957 b_and!11375)))

(declare-fun b!192835 () Bool)

(declare-fun e!126876 () Bool)

(declare-fun e!126877 () Bool)

(declare-fun mapRes!7730 () Bool)

(assert (=> b!192835 (= e!126876 (and e!126877 mapRes!7730))))

(declare-fun condMapEmpty!7730 () Bool)

(declare-datatypes ((V!5609 0))(
  ( (V!5610 (val!2280 Int)) )
))
(declare-datatypes ((ValueCell!1892 0))(
  ( (ValueCellFull!1892 (v!4227 V!5609)) (EmptyCell!1892) )
))
(declare-datatypes ((array!8167 0))(
  ( (array!8168 (arr!3844 (Array (_ BitVec 32) (_ BitVec 64))) (size!4169 (_ BitVec 32))) )
))
(declare-datatypes ((array!8169 0))(
  ( (array!8170 (arr!3845 (Array (_ BitVec 32) ValueCell!1892)) (size!4170 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2692 0))(
  ( (LongMapFixedSize!2693 (defaultEntry!3938 Int) (mask!9182 (_ BitVec 32)) (extraKeys!3675 (_ BitVec 32)) (zeroValue!3779 V!5609) (minValue!3779 V!5609) (_size!1395 (_ BitVec 32)) (_keys!5925 array!8167) (_values!3921 array!8169) (_vacant!1395 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2692)

(declare-fun mapDefault!7730 () ValueCell!1892)

(assert (=> b!192835 (= condMapEmpty!7730 (= (arr!3845 (_values!3921 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1892)) mapDefault!7730)))))

(declare-fun b!192836 () Bool)

(declare-fun tp_is_empty!4471 () Bool)

(assert (=> b!192836 (= e!126877 tp_is_empty!4471)))

(declare-fun b!192837 () Bool)

(declare-fun e!126879 () Bool)

(assert (=> b!192837 (= e!126879 tp_is_empty!4471)))

(declare-fun res!91089 () Bool)

(declare-fun e!126874 () Bool)

(assert (=> start!19696 (=> (not res!91089) (not e!126874))))

(declare-fun valid!1123 (LongMapFixedSize!2692) Bool)

(assert (=> start!19696 (= res!91089 (valid!1123 thiss!1248))))

(assert (=> start!19696 e!126874))

(declare-fun e!126873 () Bool)

(assert (=> start!19696 e!126873))

(assert (=> start!19696 true))

(assert (=> start!19696 tp_is_empty!4471))

(declare-fun b!192838 () Bool)

(declare-fun res!91091 () Bool)

(declare-fun e!126881 () Bool)

(assert (=> b!192838 (=> res!91091 e!126881)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8167 (_ BitVec 32)) Bool)

(assert (=> b!192838 (= res!91091 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5925 thiss!1248) (mask!9182 thiss!1248))))))

(declare-fun b!192839 () Bool)

(declare-fun e!126872 () Bool)

(assert (=> b!192839 (= e!126872 (not e!126881))))

(declare-fun res!91085 () Bool)

(assert (=> b!192839 (=> res!91085 e!126881)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192839 (= res!91085 (not (validMask!0 (mask!9182 thiss!1248))))))

(declare-datatypes ((tuple2!3498 0))(
  ( (tuple2!3499 (_1!1760 (_ BitVec 64)) (_2!1760 V!5609)) )
))
(declare-datatypes ((List!2415 0))(
  ( (Nil!2412) (Cons!2411 (h!3052 tuple2!3498) (t!7326 List!2415)) )
))
(declare-datatypes ((ListLongMap!2407 0))(
  ( (ListLongMap!2408 (toList!1219 List!2415)) )
))
(declare-fun lt!95840 () ListLongMap!2407)

(declare-datatypes ((SeekEntryResult!688 0))(
  ( (MissingZero!688 (index!4922 (_ BitVec 32))) (Found!688 (index!4923 (_ BitVec 32))) (Intermediate!688 (undefined!1500 Bool) (index!4924 (_ BitVec 32)) (x!20629 (_ BitVec 32))) (Undefined!688) (MissingVacant!688 (index!4925 (_ BitVec 32))) )
))
(declare-fun lt!95839 () SeekEntryResult!688)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5609)

(declare-fun +!311 (ListLongMap!2407 tuple2!3498) ListLongMap!2407)

(declare-fun getCurrentListMap!852 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) Int) ListLongMap!2407)

(assert (=> b!192839 (= (+!311 lt!95840 (tuple2!3499 key!828 v!309)) (getCurrentListMap!852 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-datatypes ((Unit!5790 0))(
  ( (Unit!5791) )
))
(declare-fun lt!95838 () Unit!5790)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!127 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) (_ BitVec 64) V!5609 Int) Unit!5790)

(assert (=> b!192839 (= lt!95838 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!127 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) (index!4923 lt!95839) key!828 v!309 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95843 () Unit!5790)

(declare-fun e!126875 () Unit!5790)

(assert (=> b!192839 (= lt!95843 e!126875)))

(declare-fun c!34782 () Bool)

(declare-fun contains!1344 (ListLongMap!2407 (_ BitVec 64)) Bool)

(assert (=> b!192839 (= c!34782 (contains!1344 lt!95840 key!828))))

(assert (=> b!192839 (= lt!95840 (getCurrentListMap!852 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun b!192840 () Bool)

(declare-fun Unit!5792 () Unit!5790)

(assert (=> b!192840 (= e!126875 Unit!5792)))

(declare-fun lt!95841 () Unit!5790)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5790)

(assert (=> b!192840 (= lt!95841 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> b!192840 false))

(declare-fun b!192841 () Bool)

(declare-datatypes ((List!2416 0))(
  ( (Nil!2413) (Cons!2412 (h!3053 (_ BitVec 64)) (t!7327 List!2416)) )
))
(declare-fun arrayNoDuplicates!0 (array!8167 (_ BitVec 32) List!2416) Bool)

(assert (=> b!192841 (= e!126881 (arrayNoDuplicates!0 (_keys!5925 thiss!1248) #b00000000000000000000000000000000 Nil!2413))))

(declare-fun b!192842 () Bool)

(declare-fun res!91087 () Bool)

(assert (=> b!192842 (=> (not res!91087) (not e!126874))))

(assert (=> b!192842 (= res!91087 (not (= key!828 (bvneg key!828))))))

(declare-fun b!192843 () Bool)

(declare-fun lt!95842 () Unit!5790)

(assert (=> b!192843 (= e!126875 lt!95842)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!176 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5790)

(assert (=> b!192843 (= lt!95842 (lemmaInListMapThenSeekEntryOrOpenFindsIt!176 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(declare-fun res!91090 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192843 (= res!91090 (inRange!0 (index!4923 lt!95839) (mask!9182 thiss!1248)))))

(declare-fun e!126880 () Bool)

(assert (=> b!192843 (=> (not res!91090) (not e!126880))))

(assert (=> b!192843 e!126880))

(declare-fun array_inv!2497 (array!8167) Bool)

(declare-fun array_inv!2498 (array!8169) Bool)

(assert (=> b!192844 (= e!126873 (and tp!16957 tp_is_empty!4471 (array_inv!2497 (_keys!5925 thiss!1248)) (array_inv!2498 (_values!3921 thiss!1248)) e!126876))))

(declare-fun b!192845 () Bool)

(declare-fun res!91086 () Bool)

(assert (=> b!192845 (=> res!91086 e!126881)))

(assert (=> b!192845 (= res!91086 (or (not (= (size!4170 (_values!3921 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9182 thiss!1248)))) (not (= (size!4169 (_keys!5925 thiss!1248)) (size!4170 (_values!3921 thiss!1248)))) (bvslt (mask!9182 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3675 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3675 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!192846 () Bool)

(assert (=> b!192846 (= e!126880 (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4923 lt!95839)) key!828))))

(declare-fun mapIsEmpty!7730 () Bool)

(assert (=> mapIsEmpty!7730 mapRes!7730))

(declare-fun b!192847 () Bool)

(assert (=> b!192847 (= e!126874 e!126872)))

(declare-fun res!91088 () Bool)

(assert (=> b!192847 (=> (not res!91088) (not e!126872))))

(get-info :version)

(assert (=> b!192847 (= res!91088 (and (not ((_ is Undefined!688) lt!95839)) (not ((_ is MissingVacant!688) lt!95839)) (not ((_ is MissingZero!688) lt!95839)) ((_ is Found!688) lt!95839)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8167 (_ BitVec 32)) SeekEntryResult!688)

(assert (=> b!192847 (= lt!95839 (seekEntryOrOpen!0 key!828 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(declare-fun mapNonEmpty!7730 () Bool)

(declare-fun tp!16958 () Bool)

(assert (=> mapNonEmpty!7730 (= mapRes!7730 (and tp!16958 e!126879))))

(declare-fun mapKey!7730 () (_ BitVec 32))

(declare-fun mapRest!7730 () (Array (_ BitVec 32) ValueCell!1892))

(declare-fun mapValue!7730 () ValueCell!1892)

(assert (=> mapNonEmpty!7730 (= (arr!3845 (_values!3921 thiss!1248)) (store mapRest!7730 mapKey!7730 mapValue!7730))))

(assert (= (and start!19696 res!91089) b!192842))

(assert (= (and b!192842 res!91087) b!192847))

(assert (= (and b!192847 res!91088) b!192839))

(assert (= (and b!192839 c!34782) b!192843))

(assert (= (and b!192839 (not c!34782)) b!192840))

(assert (= (and b!192843 res!91090) b!192846))

(assert (= (and b!192839 (not res!91085)) b!192845))

(assert (= (and b!192845 (not res!91086)) b!192838))

(assert (= (and b!192838 (not res!91091)) b!192841))

(assert (= (and b!192835 condMapEmpty!7730) mapIsEmpty!7730))

(assert (= (and b!192835 (not condMapEmpty!7730)) mapNonEmpty!7730))

(assert (= (and mapNonEmpty!7730 ((_ is ValueCellFull!1892) mapValue!7730)) b!192837))

(assert (= (and b!192835 ((_ is ValueCellFull!1892) mapDefault!7730)) b!192836))

(assert (= b!192844 b!192835))

(assert (= start!19696 b!192844))

(declare-fun m!219193 () Bool)

(assert (=> b!192843 m!219193))

(declare-fun m!219195 () Bool)

(assert (=> b!192843 m!219195))

(declare-fun m!219197 () Bool)

(assert (=> b!192846 m!219197))

(declare-fun m!219199 () Bool)

(assert (=> b!192838 m!219199))

(declare-fun m!219201 () Bool)

(assert (=> b!192839 m!219201))

(declare-fun m!219203 () Bool)

(assert (=> b!192839 m!219203))

(declare-fun m!219205 () Bool)

(assert (=> b!192839 m!219205))

(declare-fun m!219207 () Bool)

(assert (=> b!192839 m!219207))

(declare-fun m!219209 () Bool)

(assert (=> b!192839 m!219209))

(declare-fun m!219211 () Bool)

(assert (=> b!192839 m!219211))

(declare-fun m!219213 () Bool)

(assert (=> b!192839 m!219213))

(declare-fun m!219215 () Bool)

(assert (=> b!192847 m!219215))

(declare-fun m!219217 () Bool)

(assert (=> mapNonEmpty!7730 m!219217))

(declare-fun m!219219 () Bool)

(assert (=> b!192840 m!219219))

(declare-fun m!219221 () Bool)

(assert (=> b!192841 m!219221))

(declare-fun m!219223 () Bool)

(assert (=> b!192844 m!219223))

(declare-fun m!219225 () Bool)

(assert (=> b!192844 m!219225))

(declare-fun m!219227 () Bool)

(assert (=> start!19696 m!219227))

(check-sat (not b_next!4699) (not b!192839) (not b!192840) (not b!192844) tp_is_empty!4471 b_and!11375 (not mapNonEmpty!7730) (not start!19696) (not b!192847) (not b!192838) (not b!192841) (not b!192843))
(check-sat b_and!11375 (not b_next!4699))
(get-model)

(declare-fun d!56393 () Bool)

(declare-fun res!91140 () Bool)

(declare-fun e!126952 () Bool)

(assert (=> d!56393 (=> res!91140 e!126952)))

(assert (=> d!56393 (= res!91140 (bvsge #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(assert (=> d!56393 (= (arrayNoDuplicates!0 (_keys!5925 thiss!1248) #b00000000000000000000000000000000 Nil!2413) e!126952)))

(declare-fun b!192936 () Bool)

(declare-fun e!126953 () Bool)

(declare-fun contains!1347 (List!2416 (_ BitVec 64)) Bool)

(assert (=> b!192936 (= e!126953 (contains!1347 Nil!2413 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192937 () Bool)

(declare-fun e!126951 () Bool)

(declare-fun call!19468 () Bool)

(assert (=> b!192937 (= e!126951 call!19468)))

(declare-fun b!192938 () Bool)

(declare-fun e!126950 () Bool)

(assert (=> b!192938 (= e!126950 e!126951)))

(declare-fun c!34791 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192938 (= c!34791 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192939 () Bool)

(assert (=> b!192939 (= e!126952 e!126950)))

(declare-fun res!91141 () Bool)

(assert (=> b!192939 (=> (not res!91141) (not e!126950))))

(assert (=> b!192939 (= res!91141 (not e!126953))))

(declare-fun res!91142 () Bool)

(assert (=> b!192939 (=> (not res!91142) (not e!126953))))

(assert (=> b!192939 (= res!91142 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19465 () Bool)

(assert (=> bm!19465 (= call!19468 (arrayNoDuplicates!0 (_keys!5925 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34791 (Cons!2412 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000) Nil!2413) Nil!2413)))))

(declare-fun b!192940 () Bool)

(assert (=> b!192940 (= e!126951 call!19468)))

(assert (= (and d!56393 (not res!91140)) b!192939))

(assert (= (and b!192939 res!91142) b!192936))

(assert (= (and b!192939 res!91141) b!192938))

(assert (= (and b!192938 c!34791) b!192940))

(assert (= (and b!192938 (not c!34791)) b!192937))

(assert (= (or b!192940 b!192937) bm!19465))

(declare-fun m!219301 () Bool)

(assert (=> b!192936 m!219301))

(assert (=> b!192936 m!219301))

(declare-fun m!219303 () Bool)

(assert (=> b!192936 m!219303))

(assert (=> b!192938 m!219301))

(assert (=> b!192938 m!219301))

(declare-fun m!219305 () Bool)

(assert (=> b!192938 m!219305))

(assert (=> b!192939 m!219301))

(assert (=> b!192939 m!219301))

(assert (=> b!192939 m!219305))

(assert (=> bm!19465 m!219301))

(declare-fun m!219307 () Bool)

(assert (=> bm!19465 m!219307))

(assert (=> b!192841 d!56393))

(declare-fun d!56395 () Bool)

(declare-fun e!126956 () Bool)

(assert (=> d!56395 e!126956))

(declare-fun res!91148 () Bool)

(assert (=> d!56395 (=> (not res!91148) (not e!126956))))

(declare-fun lt!95884 () SeekEntryResult!688)

(assert (=> d!56395 (= res!91148 ((_ is Found!688) lt!95884))))

(assert (=> d!56395 (= lt!95884 (seekEntryOrOpen!0 key!828 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(declare-fun lt!95885 () Unit!5790)

(declare-fun choose!1061 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5790)

(assert (=> d!56395 (= lt!95885 (choose!1061 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> d!56395 (validMask!0 (mask!9182 thiss!1248))))

(assert (=> d!56395 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!176 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)) lt!95885)))

(declare-fun b!192945 () Bool)

(declare-fun res!91147 () Bool)

(assert (=> b!192945 (=> (not res!91147) (not e!126956))))

(assert (=> b!192945 (= res!91147 (inRange!0 (index!4923 lt!95884) (mask!9182 thiss!1248)))))

(declare-fun b!192946 () Bool)

(assert (=> b!192946 (= e!126956 (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4923 lt!95884)) key!828))))

(assert (=> b!192946 (and (bvsge (index!4923 lt!95884) #b00000000000000000000000000000000) (bvslt (index!4923 lt!95884) (size!4169 (_keys!5925 thiss!1248))))))

(assert (= (and d!56395 res!91148) b!192945))

(assert (= (and b!192945 res!91147) b!192946))

(assert (=> d!56395 m!219215))

(declare-fun m!219309 () Bool)

(assert (=> d!56395 m!219309))

(assert (=> d!56395 m!219211))

(declare-fun m!219311 () Bool)

(assert (=> b!192945 m!219311))

(declare-fun m!219313 () Bool)

(assert (=> b!192946 m!219313))

(assert (=> b!192843 d!56395))

(declare-fun d!56397 () Bool)

(assert (=> d!56397 (= (inRange!0 (index!4923 lt!95839) (mask!9182 thiss!1248)) (and (bvsge (index!4923 lt!95839) #b00000000000000000000000000000000) (bvslt (index!4923 lt!95839) (bvadd (mask!9182 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192843 d!56397))

(declare-fun e!126965 () SeekEntryResult!688)

(declare-fun lt!95893 () SeekEntryResult!688)

(declare-fun b!192959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8167 (_ BitVec 32)) SeekEntryResult!688)

(assert (=> b!192959 (= e!126965 (seekKeyOrZeroReturnVacant!0 (x!20629 lt!95893) (index!4924 lt!95893) (index!4924 lt!95893) key!828 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(declare-fun b!192960 () Bool)

(declare-fun e!126963 () SeekEntryResult!688)

(assert (=> b!192960 (= e!126963 (Found!688 (index!4924 lt!95893)))))

(declare-fun b!192961 () Bool)

(declare-fun c!34799 () Bool)

(declare-fun lt!95892 () (_ BitVec 64))

(assert (=> b!192961 (= c!34799 (= lt!95892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192961 (= e!126963 e!126965)))

(declare-fun b!192962 () Bool)

(assert (=> b!192962 (= e!126965 (MissingZero!688 (index!4924 lt!95893)))))

(declare-fun b!192963 () Bool)

(declare-fun e!126964 () SeekEntryResult!688)

(assert (=> b!192963 (= e!126964 Undefined!688)))

(declare-fun b!192964 () Bool)

(assert (=> b!192964 (= e!126964 e!126963)))

(assert (=> b!192964 (= lt!95892 (select (arr!3844 (_keys!5925 thiss!1248)) (index!4924 lt!95893)))))

(declare-fun c!34798 () Bool)

(assert (=> b!192964 (= c!34798 (= lt!95892 key!828))))

(declare-fun d!56399 () Bool)

(declare-fun lt!95894 () SeekEntryResult!688)

(assert (=> d!56399 (and (or ((_ is Undefined!688) lt!95894) (not ((_ is Found!688) lt!95894)) (and (bvsge (index!4923 lt!95894) #b00000000000000000000000000000000) (bvslt (index!4923 lt!95894) (size!4169 (_keys!5925 thiss!1248))))) (or ((_ is Undefined!688) lt!95894) ((_ is Found!688) lt!95894) (not ((_ is MissingZero!688) lt!95894)) (and (bvsge (index!4922 lt!95894) #b00000000000000000000000000000000) (bvslt (index!4922 lt!95894) (size!4169 (_keys!5925 thiss!1248))))) (or ((_ is Undefined!688) lt!95894) ((_ is Found!688) lt!95894) ((_ is MissingZero!688) lt!95894) (not ((_ is MissingVacant!688) lt!95894)) (and (bvsge (index!4925 lt!95894) #b00000000000000000000000000000000) (bvslt (index!4925 lt!95894) (size!4169 (_keys!5925 thiss!1248))))) (or ((_ is Undefined!688) lt!95894) (ite ((_ is Found!688) lt!95894) (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4923 lt!95894)) key!828) (ite ((_ is MissingZero!688) lt!95894) (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4922 lt!95894)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!688) lt!95894) (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4925 lt!95894)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56399 (= lt!95894 e!126964)))

(declare-fun c!34800 () Bool)

(assert (=> d!56399 (= c!34800 (and ((_ is Intermediate!688) lt!95893) (undefined!1500 lt!95893)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8167 (_ BitVec 32)) SeekEntryResult!688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56399 (= lt!95893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9182 thiss!1248)) key!828 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(assert (=> d!56399 (validMask!0 (mask!9182 thiss!1248))))

(assert (=> d!56399 (= (seekEntryOrOpen!0 key!828 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)) lt!95894)))

(assert (= (and d!56399 c!34800) b!192963))

(assert (= (and d!56399 (not c!34800)) b!192964))

(assert (= (and b!192964 c!34798) b!192960))

(assert (= (and b!192964 (not c!34798)) b!192961))

(assert (= (and b!192961 c!34799) b!192962))

(assert (= (and b!192961 (not c!34799)) b!192959))

(declare-fun m!219315 () Bool)

(assert (=> b!192959 m!219315))

(declare-fun m!219317 () Bool)

(assert (=> b!192964 m!219317))

(declare-fun m!219319 () Bool)

(assert (=> d!56399 m!219319))

(declare-fun m!219321 () Bool)

(assert (=> d!56399 m!219321))

(declare-fun m!219323 () Bool)

(assert (=> d!56399 m!219323))

(assert (=> d!56399 m!219211))

(assert (=> d!56399 m!219319))

(declare-fun m!219325 () Bool)

(assert (=> d!56399 m!219325))

(declare-fun m!219327 () Bool)

(assert (=> d!56399 m!219327))

(assert (=> b!192847 d!56399))

(declare-fun d!56401 () Bool)

(assert (=> d!56401 (= (validMask!0 (mask!9182 thiss!1248)) (and (or (= (mask!9182 thiss!1248) #b00000000000000000000000000000111) (= (mask!9182 thiss!1248) #b00000000000000000000000000001111) (= (mask!9182 thiss!1248) #b00000000000000000000000000011111) (= (mask!9182 thiss!1248) #b00000000000000000000000000111111) (= (mask!9182 thiss!1248) #b00000000000000000000000001111111) (= (mask!9182 thiss!1248) #b00000000000000000000000011111111) (= (mask!9182 thiss!1248) #b00000000000000000000000111111111) (= (mask!9182 thiss!1248) #b00000000000000000000001111111111) (= (mask!9182 thiss!1248) #b00000000000000000000011111111111) (= (mask!9182 thiss!1248) #b00000000000000000000111111111111) (= (mask!9182 thiss!1248) #b00000000000000000001111111111111) (= (mask!9182 thiss!1248) #b00000000000000000011111111111111) (= (mask!9182 thiss!1248) #b00000000000000000111111111111111) (= (mask!9182 thiss!1248) #b00000000000000001111111111111111) (= (mask!9182 thiss!1248) #b00000000000000011111111111111111) (= (mask!9182 thiss!1248) #b00000000000000111111111111111111) (= (mask!9182 thiss!1248) #b00000000000001111111111111111111) (= (mask!9182 thiss!1248) #b00000000000011111111111111111111) (= (mask!9182 thiss!1248) #b00000000000111111111111111111111) (= (mask!9182 thiss!1248) #b00000000001111111111111111111111) (= (mask!9182 thiss!1248) #b00000000011111111111111111111111) (= (mask!9182 thiss!1248) #b00000000111111111111111111111111) (= (mask!9182 thiss!1248) #b00000001111111111111111111111111) (= (mask!9182 thiss!1248) #b00000011111111111111111111111111) (= (mask!9182 thiss!1248) #b00000111111111111111111111111111) (= (mask!9182 thiss!1248) #b00001111111111111111111111111111) (= (mask!9182 thiss!1248) #b00011111111111111111111111111111) (= (mask!9182 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9182 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!192839 d!56401))

(declare-fun d!56403 () Bool)

(declare-fun e!126971 () Bool)

(assert (=> d!56403 e!126971))

(declare-fun res!91151 () Bool)

(assert (=> d!56403 (=> res!91151 e!126971)))

(declare-fun lt!95906 () Bool)

(assert (=> d!56403 (= res!91151 (not lt!95906))))

(declare-fun lt!95903 () Bool)

(assert (=> d!56403 (= lt!95906 lt!95903)))

(declare-fun lt!95904 () Unit!5790)

(declare-fun e!126970 () Unit!5790)

(assert (=> d!56403 (= lt!95904 e!126970)))

(declare-fun c!34803 () Bool)

(assert (=> d!56403 (= c!34803 lt!95903)))

(declare-fun containsKey!244 (List!2415 (_ BitVec 64)) Bool)

(assert (=> d!56403 (= lt!95903 (containsKey!244 (toList!1219 lt!95840) key!828))))

(assert (=> d!56403 (= (contains!1344 lt!95840 key!828) lt!95906)))

(declare-fun b!192971 () Bool)

(declare-fun lt!95905 () Unit!5790)

(assert (=> b!192971 (= e!126970 lt!95905)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!193 (List!2415 (_ BitVec 64)) Unit!5790)

(assert (=> b!192971 (= lt!95905 (lemmaContainsKeyImpliesGetValueByKeyDefined!193 (toList!1219 lt!95840) key!828))))

(declare-datatypes ((Option!246 0))(
  ( (Some!245 (v!4232 V!5609)) (None!244) )
))
(declare-fun isDefined!194 (Option!246) Bool)

(declare-fun getValueByKey!240 (List!2415 (_ BitVec 64)) Option!246)

(assert (=> b!192971 (isDefined!194 (getValueByKey!240 (toList!1219 lt!95840) key!828))))

(declare-fun b!192972 () Bool)

(declare-fun Unit!5798 () Unit!5790)

(assert (=> b!192972 (= e!126970 Unit!5798)))

(declare-fun b!192973 () Bool)

(assert (=> b!192973 (= e!126971 (isDefined!194 (getValueByKey!240 (toList!1219 lt!95840) key!828)))))

(assert (= (and d!56403 c!34803) b!192971))

(assert (= (and d!56403 (not c!34803)) b!192972))

(assert (= (and d!56403 (not res!91151)) b!192973))

(declare-fun m!219329 () Bool)

(assert (=> d!56403 m!219329))

(declare-fun m!219331 () Bool)

(assert (=> b!192971 m!219331))

(declare-fun m!219333 () Bool)

(assert (=> b!192971 m!219333))

(assert (=> b!192971 m!219333))

(declare-fun m!219335 () Bool)

(assert (=> b!192971 m!219335))

(assert (=> b!192973 m!219333))

(assert (=> b!192973 m!219333))

(assert (=> b!192973 m!219335))

(assert (=> b!192839 d!56403))

(declare-fun b!193016 () Bool)

(declare-fun e!127008 () Unit!5790)

(declare-fun Unit!5799 () Unit!5790)

(assert (=> b!193016 (= e!127008 Unit!5799)))

(declare-fun bm!19480 () Bool)

(declare-fun call!19484 () ListLongMap!2407)

(declare-fun getCurrentListMapNoExtraKeys!206 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) Int) ListLongMap!2407)

(assert (=> bm!19480 (= call!19484 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun b!193017 () Bool)

(declare-fun c!34818 () Bool)

(assert (=> b!193017 (= c!34818 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127006 () ListLongMap!2407)

(declare-fun e!127003 () ListLongMap!2407)

(assert (=> b!193017 (= e!127006 e!127003)))

(declare-fun b!193018 () Bool)

(declare-fun call!19487 () ListLongMap!2407)

(assert (=> b!193018 (= e!127003 call!19487)))

(declare-fun call!19485 () ListLongMap!2407)

(declare-fun c!34817 () Bool)

(declare-fun c!34819 () Bool)

(declare-fun call!19488 () ListLongMap!2407)

(declare-fun bm!19481 () Bool)

(declare-fun call!19483 () ListLongMap!2407)

(assert (=> bm!19481 (= call!19483 (+!311 (ite c!34819 call!19484 (ite c!34817 call!19485 call!19488)) (ite (or c!34819 c!34817) (tuple2!3499 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3779 thiss!1248)) (tuple2!3499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248)))))))

(declare-fun b!193019 () Bool)

(declare-fun res!91175 () Bool)

(declare-fun e!126998 () Bool)

(assert (=> b!193019 (=> (not res!91175) (not e!126998))))

(declare-fun e!127005 () Bool)

(assert (=> b!193019 (= res!91175 e!127005)))

(declare-fun c!34821 () Bool)

(assert (=> b!193019 (= c!34821 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193020 () Bool)

(declare-fun e!127004 () Bool)

(declare-fun call!19486 () Bool)

(assert (=> b!193020 (= e!127004 (not call!19486))))

(declare-fun b!193021 () Bool)

(assert (=> b!193021 (= e!127006 call!19487)))

(declare-fun d!56405 () Bool)

(assert (=> d!56405 e!126998))

(declare-fun res!91177 () Bool)

(assert (=> d!56405 (=> (not res!91177) (not e!126998))))

(assert (=> d!56405 (= res!91177 (or (bvsge #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))))

(declare-fun lt!95956 () ListLongMap!2407)

(declare-fun lt!95962 () ListLongMap!2407)

(assert (=> d!56405 (= lt!95956 lt!95962)))

(declare-fun lt!95967 () Unit!5790)

(assert (=> d!56405 (= lt!95967 e!127008)))

(declare-fun c!34816 () Bool)

(declare-fun e!127002 () Bool)

(assert (=> d!56405 (= c!34816 e!127002)))

(declare-fun res!91174 () Bool)

(assert (=> d!56405 (=> (not res!91174) (not e!127002))))

(assert (=> d!56405 (= res!91174 (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun e!127000 () ListLongMap!2407)

(assert (=> d!56405 (= lt!95962 e!127000)))

(assert (=> d!56405 (= c!34819 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56405 (validMask!0 (mask!9182 thiss!1248))))

(assert (=> d!56405 (= (getCurrentListMap!852 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)) lt!95956)))

(declare-fun bm!19482 () Bool)

(assert (=> bm!19482 (= call!19486 (contains!1344 lt!95956 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19483 () Bool)

(assert (=> bm!19483 (= call!19488 call!19485)))

(declare-fun b!193022 () Bool)

(declare-fun lt!95965 () Unit!5790)

(assert (=> b!193022 (= e!127008 lt!95965)))

(declare-fun lt!95960 () ListLongMap!2407)

(assert (=> b!193022 (= lt!95960 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95964 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95961 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95961 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95970 () Unit!5790)

(declare-fun addStillContains!161 (ListLongMap!2407 (_ BitVec 64) V!5609 (_ BitVec 64)) Unit!5790)

(assert (=> b!193022 (= lt!95970 (addStillContains!161 lt!95960 lt!95964 (zeroValue!3779 thiss!1248) lt!95961))))

(assert (=> b!193022 (contains!1344 (+!311 lt!95960 (tuple2!3499 lt!95964 (zeroValue!3779 thiss!1248))) lt!95961)))

(declare-fun lt!95954 () Unit!5790)

(assert (=> b!193022 (= lt!95954 lt!95970)))

(declare-fun lt!95966 () ListLongMap!2407)

(assert (=> b!193022 (= lt!95966 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95955 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95963 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95963 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95969 () Unit!5790)

(declare-fun addApplyDifferent!161 (ListLongMap!2407 (_ BitVec 64) V!5609 (_ BitVec 64)) Unit!5790)

(assert (=> b!193022 (= lt!95969 (addApplyDifferent!161 lt!95966 lt!95955 (minValue!3779 thiss!1248) lt!95963))))

(declare-fun apply!185 (ListLongMap!2407 (_ BitVec 64)) V!5609)

(assert (=> b!193022 (= (apply!185 (+!311 lt!95966 (tuple2!3499 lt!95955 (minValue!3779 thiss!1248))) lt!95963) (apply!185 lt!95966 lt!95963))))

(declare-fun lt!95957 () Unit!5790)

(assert (=> b!193022 (= lt!95957 lt!95969)))

(declare-fun lt!95968 () ListLongMap!2407)

(assert (=> b!193022 (= lt!95968 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95952 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95971 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95971 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95959 () Unit!5790)

(assert (=> b!193022 (= lt!95959 (addApplyDifferent!161 lt!95968 lt!95952 (zeroValue!3779 thiss!1248) lt!95971))))

(assert (=> b!193022 (= (apply!185 (+!311 lt!95968 (tuple2!3499 lt!95952 (zeroValue!3779 thiss!1248))) lt!95971) (apply!185 lt!95968 lt!95971))))

(declare-fun lt!95951 () Unit!5790)

(assert (=> b!193022 (= lt!95951 lt!95959)))

(declare-fun lt!95972 () ListLongMap!2407)

(assert (=> b!193022 (= lt!95972 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95953 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95953 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95958 () (_ BitVec 64))

(assert (=> b!193022 (= lt!95958 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193022 (= lt!95965 (addApplyDifferent!161 lt!95972 lt!95953 (minValue!3779 thiss!1248) lt!95958))))

(assert (=> b!193022 (= (apply!185 (+!311 lt!95972 (tuple2!3499 lt!95953 (minValue!3779 thiss!1248))) lt!95958) (apply!185 lt!95972 lt!95958))))

(declare-fun bm!19484 () Bool)

(assert (=> bm!19484 (= call!19487 call!19483)))

(declare-fun b!193023 () Bool)

(assert (=> b!193023 (= e!127002 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193024 () Bool)

(assert (=> b!193024 (= e!127000 (+!311 call!19483 (tuple2!3499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248))))))

(declare-fun b!193025 () Bool)

(declare-fun res!91171 () Bool)

(assert (=> b!193025 (=> (not res!91171) (not e!126998))))

(declare-fun e!127007 () Bool)

(assert (=> b!193025 (= res!91171 e!127007)))

(declare-fun res!91176 () Bool)

(assert (=> b!193025 (=> res!91176 e!127007)))

(declare-fun e!126999 () Bool)

(assert (=> b!193025 (= res!91176 (not e!126999))))

(declare-fun res!91172 () Bool)

(assert (=> b!193025 (=> (not res!91172) (not e!126999))))

(assert (=> b!193025 (= res!91172 (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun b!193026 () Bool)

(declare-fun call!19489 () Bool)

(assert (=> b!193026 (= e!127005 (not call!19489))))

(declare-fun b!193027 () Bool)

(assert (=> b!193027 (= e!127003 call!19488)))

(declare-fun b!193028 () Bool)

(declare-fun e!127009 () Bool)

(declare-fun get!2222 (ValueCell!1892 V!5609) V!5609)

(declare-fun dynLambda!519 (Int (_ BitVec 64)) V!5609)

(assert (=> b!193028 (= e!127009 (= (apply!185 lt!95956 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)) (get!2222 (select (arr!3845 (_values!3921 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!519 (defaultEntry!3938 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4170 (_values!3921 thiss!1248))))))

(assert (=> b!193028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun b!193029 () Bool)

(declare-fun e!127001 () Bool)

(assert (=> b!193029 (= e!127005 e!127001)))

(declare-fun res!91178 () Bool)

(assert (=> b!193029 (= res!91178 call!19489)))

(assert (=> b!193029 (=> (not res!91178) (not e!127001))))

(declare-fun b!193030 () Bool)

(assert (=> b!193030 (= e!127000 e!127006)))

(assert (=> b!193030 (= c!34817 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193031 () Bool)

(assert (=> b!193031 (= e!127007 e!127009)))

(declare-fun res!91173 () Bool)

(assert (=> b!193031 (=> (not res!91173) (not e!127009))))

(assert (=> b!193031 (= res!91173 (contains!1344 lt!95956 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun bm!19485 () Bool)

(assert (=> bm!19485 (= call!19489 (contains!1344 lt!95956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193032 () Bool)

(declare-fun e!127010 () Bool)

(assert (=> b!193032 (= e!127010 (= (apply!185 lt!95956 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3779 thiss!1248)))))

(declare-fun b!193033 () Bool)

(assert (=> b!193033 (= e!126999 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19486 () Bool)

(assert (=> bm!19486 (= call!19485 call!19484)))

(declare-fun b!193034 () Bool)

(assert (=> b!193034 (= e!127001 (= (apply!185 lt!95956 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3779 thiss!1248)))))

(declare-fun b!193035 () Bool)

(assert (=> b!193035 (= e!127004 e!127010)))

(declare-fun res!91170 () Bool)

(assert (=> b!193035 (= res!91170 call!19486)))

(assert (=> b!193035 (=> (not res!91170) (not e!127010))))

(declare-fun b!193036 () Bool)

(assert (=> b!193036 (= e!126998 e!127004)))

(declare-fun c!34820 () Bool)

(assert (=> b!193036 (= c!34820 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!56405 c!34819) b!193024))

(assert (= (and d!56405 (not c!34819)) b!193030))

(assert (= (and b!193030 c!34817) b!193021))

(assert (= (and b!193030 (not c!34817)) b!193017))

(assert (= (and b!193017 c!34818) b!193018))

(assert (= (and b!193017 (not c!34818)) b!193027))

(assert (= (or b!193018 b!193027) bm!19483))

(assert (= (or b!193021 bm!19483) bm!19486))

(assert (= (or b!193021 b!193018) bm!19484))

(assert (= (or b!193024 bm!19486) bm!19480))

(assert (= (or b!193024 bm!19484) bm!19481))

(assert (= (and d!56405 res!91174) b!193023))

(assert (= (and d!56405 c!34816) b!193022))

(assert (= (and d!56405 (not c!34816)) b!193016))

(assert (= (and d!56405 res!91177) b!193025))

(assert (= (and b!193025 res!91172) b!193033))

(assert (= (and b!193025 (not res!91176)) b!193031))

(assert (= (and b!193031 res!91173) b!193028))

(assert (= (and b!193025 res!91171) b!193019))

(assert (= (and b!193019 c!34821) b!193029))

(assert (= (and b!193019 (not c!34821)) b!193026))

(assert (= (and b!193029 res!91178) b!193034))

(assert (= (or b!193029 b!193026) bm!19485))

(assert (= (and b!193019 res!91175) b!193036))

(assert (= (and b!193036 c!34820) b!193035))

(assert (= (and b!193036 (not c!34820)) b!193020))

(assert (= (and b!193035 res!91170) b!193032))

(assert (= (or b!193035 b!193020) bm!19482))

(declare-fun b_lambda!7437 () Bool)

(assert (=> (not b_lambda!7437) (not b!193028)))

(declare-fun t!7332 () Bool)

(declare-fun tb!2873 () Bool)

(assert (=> (and b!192844 (= (defaultEntry!3938 thiss!1248) (defaultEntry!3938 thiss!1248)) t!7332) tb!2873))

(declare-fun result!4913 () Bool)

(assert (=> tb!2873 (= result!4913 tp_is_empty!4471)))

(assert (=> b!193028 t!7332))

(declare-fun b_and!11381 () Bool)

(assert (= b_and!11375 (and (=> t!7332 result!4913) b_and!11381)))

(declare-fun m!219337 () Bool)

(assert (=> bm!19485 m!219337))

(declare-fun m!219339 () Bool)

(assert (=> b!193032 m!219339))

(assert (=> b!193031 m!219301))

(assert (=> b!193031 m!219301))

(declare-fun m!219341 () Bool)

(assert (=> b!193031 m!219341))

(assert (=> b!193033 m!219301))

(assert (=> b!193033 m!219301))

(assert (=> b!193033 m!219305))

(declare-fun m!219343 () Bool)

(assert (=> b!193024 m!219343))

(assert (=> d!56405 m!219211))

(declare-fun m!219345 () Bool)

(assert (=> b!193034 m!219345))

(declare-fun m!219347 () Bool)

(assert (=> bm!19480 m!219347))

(declare-fun m!219349 () Bool)

(assert (=> bm!19482 m!219349))

(assert (=> b!193023 m!219301))

(assert (=> b!193023 m!219301))

(assert (=> b!193023 m!219305))

(declare-fun m!219351 () Bool)

(assert (=> bm!19481 m!219351))

(declare-fun m!219353 () Bool)

(assert (=> b!193022 m!219353))

(declare-fun m!219355 () Bool)

(assert (=> b!193022 m!219355))

(declare-fun m!219357 () Bool)

(assert (=> b!193022 m!219357))

(declare-fun m!219359 () Bool)

(assert (=> b!193022 m!219359))

(declare-fun m!219361 () Bool)

(assert (=> b!193022 m!219361))

(declare-fun m!219363 () Bool)

(assert (=> b!193022 m!219363))

(declare-fun m!219365 () Bool)

(assert (=> b!193022 m!219365))

(assert (=> b!193022 m!219347))

(declare-fun m!219367 () Bool)

(assert (=> b!193022 m!219367))

(assert (=> b!193022 m!219301))

(declare-fun m!219369 () Bool)

(assert (=> b!193022 m!219369))

(declare-fun m!219371 () Bool)

(assert (=> b!193022 m!219371))

(declare-fun m!219373 () Bool)

(assert (=> b!193022 m!219373))

(assert (=> b!193022 m!219365))

(declare-fun m!219375 () Bool)

(assert (=> b!193022 m!219375))

(declare-fun m!219377 () Bool)

(assert (=> b!193022 m!219377))

(declare-fun m!219379 () Bool)

(assert (=> b!193022 m!219379))

(declare-fun m!219381 () Bool)

(assert (=> b!193022 m!219381))

(assert (=> b!193022 m!219353))

(assert (=> b!193022 m!219369))

(assert (=> b!193022 m!219357))

(declare-fun m!219383 () Bool)

(assert (=> b!193028 m!219383))

(declare-fun m!219385 () Bool)

(assert (=> b!193028 m!219385))

(assert (=> b!193028 m!219385))

(assert (=> b!193028 m!219383))

(declare-fun m!219387 () Bool)

(assert (=> b!193028 m!219387))

(assert (=> b!193028 m!219301))

(declare-fun m!219389 () Bool)

(assert (=> b!193028 m!219389))

(assert (=> b!193028 m!219301))

(assert (=> b!192839 d!56405))

(declare-fun b!193039 () Bool)

(declare-fun e!127021 () Unit!5790)

(declare-fun Unit!5800 () Unit!5790)

(assert (=> b!193039 (= e!127021 Unit!5800)))

(declare-fun call!19491 () ListLongMap!2407)

(declare-fun bm!19487 () Bool)

(assert (=> bm!19487 (= call!19491 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun b!193040 () Bool)

(declare-fun c!34824 () Bool)

(assert (=> b!193040 (= c!34824 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127019 () ListLongMap!2407)

(declare-fun e!127016 () ListLongMap!2407)

(assert (=> b!193040 (= e!127019 e!127016)))

(declare-fun b!193041 () Bool)

(declare-fun call!19494 () ListLongMap!2407)

(assert (=> b!193041 (= e!127016 call!19494)))

(declare-fun c!34823 () Bool)

(declare-fun bm!19488 () Bool)

(declare-fun call!19495 () ListLongMap!2407)

(declare-fun call!19492 () ListLongMap!2407)

(declare-fun call!19490 () ListLongMap!2407)

(declare-fun c!34825 () Bool)

(assert (=> bm!19488 (= call!19490 (+!311 (ite c!34825 call!19491 (ite c!34823 call!19492 call!19495)) (ite (or c!34825 c!34823) (tuple2!3499 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3779 thiss!1248)) (tuple2!3499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248)))))))

(declare-fun b!193042 () Bool)

(declare-fun res!91184 () Bool)

(declare-fun e!127011 () Bool)

(assert (=> b!193042 (=> (not res!91184) (not e!127011))))

(declare-fun e!127018 () Bool)

(assert (=> b!193042 (= res!91184 e!127018)))

(declare-fun c!34827 () Bool)

(assert (=> b!193042 (= c!34827 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193043 () Bool)

(declare-fun e!127017 () Bool)

(declare-fun call!19493 () Bool)

(assert (=> b!193043 (= e!127017 (not call!19493))))

(declare-fun b!193044 () Bool)

(assert (=> b!193044 (= e!127019 call!19494)))

(declare-fun d!56407 () Bool)

(assert (=> d!56407 e!127011))

(declare-fun res!91186 () Bool)

(assert (=> d!56407 (=> (not res!91186) (not e!127011))))

(assert (=> d!56407 (= res!91186 (or (bvsge #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))))

(declare-fun lt!95978 () ListLongMap!2407)

(declare-fun lt!95984 () ListLongMap!2407)

(assert (=> d!56407 (= lt!95978 lt!95984)))

(declare-fun lt!95989 () Unit!5790)

(assert (=> d!56407 (= lt!95989 e!127021)))

(declare-fun c!34822 () Bool)

(declare-fun e!127015 () Bool)

(assert (=> d!56407 (= c!34822 e!127015)))

(declare-fun res!91183 () Bool)

(assert (=> d!56407 (=> (not res!91183) (not e!127015))))

(assert (=> d!56407 (= res!91183 (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun e!127013 () ListLongMap!2407)

(assert (=> d!56407 (= lt!95984 e!127013)))

(assert (=> d!56407 (= c!34825 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56407 (validMask!0 (mask!9182 thiss!1248))))

(assert (=> d!56407 (= (getCurrentListMap!852 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)) lt!95978)))

(declare-fun bm!19489 () Bool)

(assert (=> bm!19489 (= call!19493 (contains!1344 lt!95978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19490 () Bool)

(assert (=> bm!19490 (= call!19495 call!19492)))

(declare-fun b!193045 () Bool)

(declare-fun lt!95987 () Unit!5790)

(assert (=> b!193045 (= e!127021 lt!95987)))

(declare-fun lt!95982 () ListLongMap!2407)

(assert (=> b!193045 (= lt!95982 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95986 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95983 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95983 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95992 () Unit!5790)

(assert (=> b!193045 (= lt!95992 (addStillContains!161 lt!95982 lt!95986 (zeroValue!3779 thiss!1248) lt!95983))))

(assert (=> b!193045 (contains!1344 (+!311 lt!95982 (tuple2!3499 lt!95986 (zeroValue!3779 thiss!1248))) lt!95983)))

(declare-fun lt!95976 () Unit!5790)

(assert (=> b!193045 (= lt!95976 lt!95992)))

(declare-fun lt!95988 () ListLongMap!2407)

(assert (=> b!193045 (= lt!95988 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95977 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95985 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95985 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95991 () Unit!5790)

(assert (=> b!193045 (= lt!95991 (addApplyDifferent!161 lt!95988 lt!95977 (minValue!3779 thiss!1248) lt!95985))))

(assert (=> b!193045 (= (apply!185 (+!311 lt!95988 (tuple2!3499 lt!95977 (minValue!3779 thiss!1248))) lt!95985) (apply!185 lt!95988 lt!95985))))

(declare-fun lt!95979 () Unit!5790)

(assert (=> b!193045 (= lt!95979 lt!95991)))

(declare-fun lt!95990 () ListLongMap!2407)

(assert (=> b!193045 (= lt!95990 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95974 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95993 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95993 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95981 () Unit!5790)

(assert (=> b!193045 (= lt!95981 (addApplyDifferent!161 lt!95990 lt!95974 (zeroValue!3779 thiss!1248) lt!95993))))

(assert (=> b!193045 (= (apply!185 (+!311 lt!95990 (tuple2!3499 lt!95974 (zeroValue!3779 thiss!1248))) lt!95993) (apply!185 lt!95990 lt!95993))))

(declare-fun lt!95973 () Unit!5790)

(assert (=> b!193045 (= lt!95973 lt!95981)))

(declare-fun lt!95994 () ListLongMap!2407)

(assert (=> b!193045 (= lt!95994 (getCurrentListMapNoExtraKeys!206 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!95975 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95980 () (_ BitVec 64))

(assert (=> b!193045 (= lt!95980 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193045 (= lt!95987 (addApplyDifferent!161 lt!95994 lt!95975 (minValue!3779 thiss!1248) lt!95980))))

(assert (=> b!193045 (= (apply!185 (+!311 lt!95994 (tuple2!3499 lt!95975 (minValue!3779 thiss!1248))) lt!95980) (apply!185 lt!95994 lt!95980))))

(declare-fun bm!19491 () Bool)

(assert (=> bm!19491 (= call!19494 call!19490)))

(declare-fun b!193046 () Bool)

(assert (=> b!193046 (= e!127015 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193047 () Bool)

(assert (=> b!193047 (= e!127013 (+!311 call!19490 (tuple2!3499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248))))))

(declare-fun b!193048 () Bool)

(declare-fun res!91180 () Bool)

(assert (=> b!193048 (=> (not res!91180) (not e!127011))))

(declare-fun e!127020 () Bool)

(assert (=> b!193048 (= res!91180 e!127020)))

(declare-fun res!91185 () Bool)

(assert (=> b!193048 (=> res!91185 e!127020)))

(declare-fun e!127012 () Bool)

(assert (=> b!193048 (= res!91185 (not e!127012))))

(declare-fun res!91181 () Bool)

(assert (=> b!193048 (=> (not res!91181) (not e!127012))))

(assert (=> b!193048 (= res!91181 (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun b!193049 () Bool)

(declare-fun call!19496 () Bool)

(assert (=> b!193049 (= e!127018 (not call!19496))))

(declare-fun b!193050 () Bool)

(assert (=> b!193050 (= e!127016 call!19495)))

(declare-fun b!193051 () Bool)

(declare-fun e!127022 () Bool)

(assert (=> b!193051 (= e!127022 (= (apply!185 lt!95978 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)) (get!2222 (select (arr!3845 (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!519 (defaultEntry!3938 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4170 (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))))))))

(assert (=> b!193051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun b!193052 () Bool)

(declare-fun e!127014 () Bool)

(assert (=> b!193052 (= e!127018 e!127014)))

(declare-fun res!91187 () Bool)

(assert (=> b!193052 (= res!91187 call!19496)))

(assert (=> b!193052 (=> (not res!91187) (not e!127014))))

(declare-fun b!193053 () Bool)

(assert (=> b!193053 (= e!127013 e!127019)))

(assert (=> b!193053 (= c!34823 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193054 () Bool)

(assert (=> b!193054 (= e!127020 e!127022)))

(declare-fun res!91182 () Bool)

(assert (=> b!193054 (=> (not res!91182) (not e!127022))))

(assert (=> b!193054 (= res!91182 (contains!1344 lt!95978 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun bm!19492 () Bool)

(assert (=> bm!19492 (= call!19496 (contains!1344 lt!95978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193055 () Bool)

(declare-fun e!127023 () Bool)

(assert (=> b!193055 (= e!127023 (= (apply!185 lt!95978 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3779 thiss!1248)))))

(declare-fun b!193056 () Bool)

(assert (=> b!193056 (= e!127012 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19493 () Bool)

(assert (=> bm!19493 (= call!19492 call!19491)))

(declare-fun b!193057 () Bool)

(assert (=> b!193057 (= e!127014 (= (apply!185 lt!95978 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3779 thiss!1248)))))

(declare-fun b!193058 () Bool)

(assert (=> b!193058 (= e!127017 e!127023)))

(declare-fun res!91179 () Bool)

(assert (=> b!193058 (= res!91179 call!19493)))

(assert (=> b!193058 (=> (not res!91179) (not e!127023))))

(declare-fun b!193059 () Bool)

(assert (=> b!193059 (= e!127011 e!127017)))

(declare-fun c!34826 () Bool)

(assert (=> b!193059 (= c!34826 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!56407 c!34825) b!193047))

(assert (= (and d!56407 (not c!34825)) b!193053))

(assert (= (and b!193053 c!34823) b!193044))

(assert (= (and b!193053 (not c!34823)) b!193040))

(assert (= (and b!193040 c!34824) b!193041))

(assert (= (and b!193040 (not c!34824)) b!193050))

(assert (= (or b!193041 b!193050) bm!19490))

(assert (= (or b!193044 bm!19490) bm!19493))

(assert (= (or b!193044 b!193041) bm!19491))

(assert (= (or b!193047 bm!19493) bm!19487))

(assert (= (or b!193047 bm!19491) bm!19488))

(assert (= (and d!56407 res!91183) b!193046))

(assert (= (and d!56407 c!34822) b!193045))

(assert (= (and d!56407 (not c!34822)) b!193039))

(assert (= (and d!56407 res!91186) b!193048))

(assert (= (and b!193048 res!91181) b!193056))

(assert (= (and b!193048 (not res!91185)) b!193054))

(assert (= (and b!193054 res!91182) b!193051))

(assert (= (and b!193048 res!91180) b!193042))

(assert (= (and b!193042 c!34827) b!193052))

(assert (= (and b!193042 (not c!34827)) b!193049))

(assert (= (and b!193052 res!91187) b!193057))

(assert (= (or b!193052 b!193049) bm!19492))

(assert (= (and b!193042 res!91184) b!193059))

(assert (= (and b!193059 c!34826) b!193058))

(assert (= (and b!193059 (not c!34826)) b!193043))

(assert (= (and b!193058 res!91179) b!193055))

(assert (= (or b!193058 b!193043) bm!19489))

(declare-fun b_lambda!7439 () Bool)

(assert (=> (not b_lambda!7439) (not b!193051)))

(assert (=> b!193051 t!7332))

(declare-fun b_and!11383 () Bool)

(assert (= b_and!11381 (and (=> t!7332 result!4913) b_and!11383)))

(declare-fun m!219391 () Bool)

(assert (=> bm!19492 m!219391))

(declare-fun m!219393 () Bool)

(assert (=> b!193055 m!219393))

(assert (=> b!193054 m!219301))

(assert (=> b!193054 m!219301))

(declare-fun m!219395 () Bool)

(assert (=> b!193054 m!219395))

(assert (=> b!193056 m!219301))

(assert (=> b!193056 m!219301))

(assert (=> b!193056 m!219305))

(declare-fun m!219397 () Bool)

(assert (=> b!193047 m!219397))

(assert (=> d!56407 m!219211))

(declare-fun m!219399 () Bool)

(assert (=> b!193057 m!219399))

(declare-fun m!219401 () Bool)

(assert (=> bm!19487 m!219401))

(declare-fun m!219403 () Bool)

(assert (=> bm!19489 m!219403))

(assert (=> b!193046 m!219301))

(assert (=> b!193046 m!219301))

(assert (=> b!193046 m!219305))

(declare-fun m!219405 () Bool)

(assert (=> bm!19488 m!219405))

(declare-fun m!219407 () Bool)

(assert (=> b!193045 m!219407))

(declare-fun m!219409 () Bool)

(assert (=> b!193045 m!219409))

(declare-fun m!219411 () Bool)

(assert (=> b!193045 m!219411))

(declare-fun m!219413 () Bool)

(assert (=> b!193045 m!219413))

(declare-fun m!219415 () Bool)

(assert (=> b!193045 m!219415))

(declare-fun m!219417 () Bool)

(assert (=> b!193045 m!219417))

(declare-fun m!219419 () Bool)

(assert (=> b!193045 m!219419))

(assert (=> b!193045 m!219401))

(declare-fun m!219421 () Bool)

(assert (=> b!193045 m!219421))

(assert (=> b!193045 m!219301))

(declare-fun m!219423 () Bool)

(assert (=> b!193045 m!219423))

(declare-fun m!219425 () Bool)

(assert (=> b!193045 m!219425))

(declare-fun m!219427 () Bool)

(assert (=> b!193045 m!219427))

(assert (=> b!193045 m!219419))

(declare-fun m!219429 () Bool)

(assert (=> b!193045 m!219429))

(declare-fun m!219431 () Bool)

(assert (=> b!193045 m!219431))

(declare-fun m!219433 () Bool)

(assert (=> b!193045 m!219433))

(declare-fun m!219435 () Bool)

(assert (=> b!193045 m!219435))

(assert (=> b!193045 m!219407))

(assert (=> b!193045 m!219423))

(assert (=> b!193045 m!219411))

(assert (=> b!193051 m!219383))

(declare-fun m!219437 () Bool)

(assert (=> b!193051 m!219437))

(assert (=> b!193051 m!219437))

(assert (=> b!193051 m!219383))

(declare-fun m!219439 () Bool)

(assert (=> b!193051 m!219439))

(assert (=> b!193051 m!219301))

(declare-fun m!219441 () Bool)

(assert (=> b!193051 m!219441))

(assert (=> b!193051 m!219301))

(assert (=> b!192839 d!56407))

(declare-fun d!56409 () Bool)

(declare-fun e!127026 () Bool)

(assert (=> d!56409 e!127026))

(declare-fun res!91193 () Bool)

(assert (=> d!56409 (=> (not res!91193) (not e!127026))))

(declare-fun lt!96004 () ListLongMap!2407)

(assert (=> d!56409 (= res!91193 (contains!1344 lt!96004 (_1!1760 (tuple2!3499 key!828 v!309))))))

(declare-fun lt!96003 () List!2415)

(assert (=> d!56409 (= lt!96004 (ListLongMap!2408 lt!96003))))

(declare-fun lt!96005 () Unit!5790)

(declare-fun lt!96006 () Unit!5790)

(assert (=> d!56409 (= lt!96005 lt!96006)))

(assert (=> d!56409 (= (getValueByKey!240 lt!96003 (_1!1760 (tuple2!3499 key!828 v!309))) (Some!245 (_2!1760 (tuple2!3499 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!130 (List!2415 (_ BitVec 64) V!5609) Unit!5790)

(assert (=> d!56409 (= lt!96006 (lemmaContainsTupThenGetReturnValue!130 lt!96003 (_1!1760 (tuple2!3499 key!828 v!309)) (_2!1760 (tuple2!3499 key!828 v!309))))))

(declare-fun insertStrictlySorted!133 (List!2415 (_ BitVec 64) V!5609) List!2415)

(assert (=> d!56409 (= lt!96003 (insertStrictlySorted!133 (toList!1219 lt!95840) (_1!1760 (tuple2!3499 key!828 v!309)) (_2!1760 (tuple2!3499 key!828 v!309))))))

(assert (=> d!56409 (= (+!311 lt!95840 (tuple2!3499 key!828 v!309)) lt!96004)))

(declare-fun b!193064 () Bool)

(declare-fun res!91192 () Bool)

(assert (=> b!193064 (=> (not res!91192) (not e!127026))))

(assert (=> b!193064 (= res!91192 (= (getValueByKey!240 (toList!1219 lt!96004) (_1!1760 (tuple2!3499 key!828 v!309))) (Some!245 (_2!1760 (tuple2!3499 key!828 v!309)))))))

(declare-fun b!193065 () Bool)

(declare-fun contains!1348 (List!2415 tuple2!3498) Bool)

(assert (=> b!193065 (= e!127026 (contains!1348 (toList!1219 lt!96004) (tuple2!3499 key!828 v!309)))))

(assert (= (and d!56409 res!91193) b!193064))

(assert (= (and b!193064 res!91192) b!193065))

(declare-fun m!219443 () Bool)

(assert (=> d!56409 m!219443))

(declare-fun m!219445 () Bool)

(assert (=> d!56409 m!219445))

(declare-fun m!219447 () Bool)

(assert (=> d!56409 m!219447))

(declare-fun m!219449 () Bool)

(assert (=> d!56409 m!219449))

(declare-fun m!219451 () Bool)

(assert (=> b!193064 m!219451))

(declare-fun m!219453 () Bool)

(assert (=> b!193065 m!219453))

(assert (=> b!192839 d!56409))

(declare-fun d!56411 () Bool)

(declare-fun e!127029 () Bool)

(assert (=> d!56411 e!127029))

(declare-fun res!91196 () Bool)

(assert (=> d!56411 (=> (not res!91196) (not e!127029))))

(assert (=> d!56411 (= res!91196 (and (bvsge (index!4923 lt!95839) #b00000000000000000000000000000000) (bvslt (index!4923 lt!95839) (size!4170 (_values!3921 thiss!1248)))))))

(declare-fun lt!96009 () Unit!5790)

(declare-fun choose!1062 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) (_ BitVec 64) V!5609 Int) Unit!5790)

(assert (=> d!56411 (= lt!96009 (choose!1062 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) (index!4923 lt!95839) key!828 v!309 (defaultEntry!3938 thiss!1248)))))

(assert (=> d!56411 (validMask!0 (mask!9182 thiss!1248))))

(assert (=> d!56411 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!127 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) (index!4923 lt!95839) key!828 v!309 (defaultEntry!3938 thiss!1248)) lt!96009)))

(declare-fun b!193068 () Bool)

(assert (=> b!193068 (= e!127029 (= (+!311 (getCurrentListMap!852 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)) (tuple2!3499 key!828 v!309)) (getCurrentListMap!852 (_keys!5925 thiss!1248) (array!8170 (store (arr!3845 (_values!3921 thiss!1248)) (index!4923 lt!95839) (ValueCellFull!1892 v!309)) (size!4170 (_values!3921 thiss!1248))) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248))))))

(assert (= (and d!56411 res!91196) b!193068))

(declare-fun m!219455 () Bool)

(assert (=> d!56411 m!219455))

(assert (=> d!56411 m!219211))

(assert (=> b!193068 m!219205))

(assert (=> b!193068 m!219205))

(declare-fun m!219457 () Bool)

(assert (=> b!193068 m!219457))

(assert (=> b!193068 m!219203))

(assert (=> b!193068 m!219201))

(assert (=> b!192839 d!56411))

(declare-fun d!56413 () Bool)

(assert (=> d!56413 (= (array_inv!2497 (_keys!5925 thiss!1248)) (bvsge (size!4169 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192844 d!56413))

(declare-fun d!56415 () Bool)

(assert (=> d!56415 (= (array_inv!2498 (_values!3921 thiss!1248)) (bvsge (size!4170 (_values!3921 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192844 d!56415))

(declare-fun d!56417 () Bool)

(declare-fun res!91202 () Bool)

(declare-fun e!127038 () Bool)

(assert (=> d!56417 (=> res!91202 e!127038)))

(assert (=> d!56417 (= res!91202 (bvsge #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))))))

(assert (=> d!56417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)) e!127038)))

(declare-fun b!193077 () Bool)

(declare-fun e!127036 () Bool)

(declare-fun call!19499 () Bool)

(assert (=> b!193077 (= e!127036 call!19499)))

(declare-fun bm!19496 () Bool)

(assert (=> bm!19496 (= call!19499 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(declare-fun b!193078 () Bool)

(assert (=> b!193078 (= e!127038 e!127036)))

(declare-fun c!34830 () Bool)

(assert (=> b!193078 (= c!34830 (validKeyInArray!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193079 () Bool)

(declare-fun e!127037 () Bool)

(assert (=> b!193079 (= e!127036 e!127037)))

(declare-fun lt!96018 () (_ BitVec 64))

(assert (=> b!193079 (= lt!96018 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96016 () Unit!5790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8167 (_ BitVec 64) (_ BitVec 32)) Unit!5790)

(assert (=> b!193079 (= lt!96016 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5925 thiss!1248) lt!96018 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!193079 (arrayContainsKey!0 (_keys!5925 thiss!1248) lt!96018 #b00000000000000000000000000000000)))

(declare-fun lt!96017 () Unit!5790)

(assert (=> b!193079 (= lt!96017 lt!96016)))

(declare-fun res!91201 () Bool)

(assert (=> b!193079 (= res!91201 (= (seekEntryOrOpen!0 (select (arr!3844 (_keys!5925 thiss!1248)) #b00000000000000000000000000000000) (_keys!5925 thiss!1248) (mask!9182 thiss!1248)) (Found!688 #b00000000000000000000000000000000)))))

(assert (=> b!193079 (=> (not res!91201) (not e!127037))))

(declare-fun b!193080 () Bool)

(assert (=> b!193080 (= e!127037 call!19499)))

(assert (= (and d!56417 (not res!91202)) b!193078))

(assert (= (and b!193078 c!34830) b!193079))

(assert (= (and b!193078 (not c!34830)) b!193077))

(assert (= (and b!193079 res!91201) b!193080))

(assert (= (or b!193080 b!193077) bm!19496))

(declare-fun m!219459 () Bool)

(assert (=> bm!19496 m!219459))

(assert (=> b!193078 m!219301))

(assert (=> b!193078 m!219301))

(assert (=> b!193078 m!219305))

(assert (=> b!193079 m!219301))

(declare-fun m!219461 () Bool)

(assert (=> b!193079 m!219461))

(declare-fun m!219463 () Bool)

(assert (=> b!193079 m!219463))

(assert (=> b!193079 m!219301))

(declare-fun m!219465 () Bool)

(assert (=> b!193079 m!219465))

(assert (=> b!192838 d!56417))

(declare-fun b!193097 () Bool)

(declare-fun e!127048 () Bool)

(declare-fun call!19504 () Bool)

(assert (=> b!193097 (= e!127048 (not call!19504))))

(declare-fun b!193098 () Bool)

(declare-fun e!127047 () Bool)

(declare-fun e!127049 () Bool)

(assert (=> b!193098 (= e!127047 e!127049)))

(declare-fun c!34835 () Bool)

(declare-fun lt!96023 () SeekEntryResult!688)

(assert (=> b!193098 (= c!34835 ((_ is MissingVacant!688) lt!96023))))

(declare-fun d!56419 () Bool)

(assert (=> d!56419 e!127047))

(declare-fun c!34836 () Bool)

(assert (=> d!56419 (= c!34836 ((_ is MissingZero!688) lt!96023))))

(assert (=> d!56419 (= lt!96023 (seekEntryOrOpen!0 key!828 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(declare-fun lt!96024 () Unit!5790)

(declare-fun choose!1063 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5790)

(assert (=> d!56419 (= lt!96024 (choose!1063 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> d!56419 (validMask!0 (mask!9182 thiss!1248))))

(assert (=> d!56419 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (_keys!5925 thiss!1248) (_values!3921 thiss!1248) (mask!9182 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)) lt!96024)))

(declare-fun b!193099 () Bool)

(assert (=> b!193099 (= e!127049 ((_ is Undefined!688) lt!96023))))

(declare-fun b!193100 () Bool)

(assert (=> b!193100 (and (bvsge (index!4922 lt!96023) #b00000000000000000000000000000000) (bvslt (index!4922 lt!96023) (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun res!91212 () Bool)

(assert (=> b!193100 (= res!91212 (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4922 lt!96023)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127050 () Bool)

(assert (=> b!193100 (=> (not res!91212) (not e!127050))))

(declare-fun b!193101 () Bool)

(declare-fun res!91211 () Bool)

(assert (=> b!193101 (=> (not res!91211) (not e!127048))))

(declare-fun call!19505 () Bool)

(assert (=> b!193101 (= res!91211 call!19505)))

(assert (=> b!193101 (= e!127049 e!127048)))

(declare-fun b!193102 () Bool)

(assert (=> b!193102 (= e!127047 e!127050)))

(declare-fun res!91214 () Bool)

(assert (=> b!193102 (= res!91214 call!19505)))

(assert (=> b!193102 (=> (not res!91214) (not e!127050))))

(declare-fun bm!19501 () Bool)

(assert (=> bm!19501 (= call!19504 (arrayContainsKey!0 (_keys!5925 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!193103 () Bool)

(declare-fun res!91213 () Bool)

(assert (=> b!193103 (=> (not res!91213) (not e!127048))))

(assert (=> b!193103 (= res!91213 (= (select (arr!3844 (_keys!5925 thiss!1248)) (index!4925 lt!96023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193103 (and (bvsge (index!4925 lt!96023) #b00000000000000000000000000000000) (bvslt (index!4925 lt!96023) (size!4169 (_keys!5925 thiss!1248))))))

(declare-fun b!193104 () Bool)

(assert (=> b!193104 (= e!127050 (not call!19504))))

(declare-fun bm!19502 () Bool)

(assert (=> bm!19502 (= call!19505 (inRange!0 (ite c!34836 (index!4922 lt!96023) (index!4925 lt!96023)) (mask!9182 thiss!1248)))))

(assert (= (and d!56419 c!34836) b!193102))

(assert (= (and d!56419 (not c!34836)) b!193098))

(assert (= (and b!193102 res!91214) b!193100))

(assert (= (and b!193100 res!91212) b!193104))

(assert (= (and b!193098 c!34835) b!193101))

(assert (= (and b!193098 (not c!34835)) b!193099))

(assert (= (and b!193101 res!91211) b!193103))

(assert (= (and b!193103 res!91213) b!193097))

(assert (= (or b!193102 b!193101) bm!19502))

(assert (= (or b!193104 b!193097) bm!19501))

(declare-fun m!219467 () Bool)

(assert (=> b!193100 m!219467))

(declare-fun m!219469 () Bool)

(assert (=> b!193103 m!219469))

(assert (=> d!56419 m!219215))

(declare-fun m!219471 () Bool)

(assert (=> d!56419 m!219471))

(assert (=> d!56419 m!219211))

(declare-fun m!219473 () Bool)

(assert (=> bm!19501 m!219473))

(declare-fun m!219475 () Bool)

(assert (=> bm!19502 m!219475))

(assert (=> b!192840 d!56419))

(declare-fun d!56421 () Bool)

(declare-fun res!91221 () Bool)

(declare-fun e!127053 () Bool)

(assert (=> d!56421 (=> (not res!91221) (not e!127053))))

(declare-fun simpleValid!201 (LongMapFixedSize!2692) Bool)

(assert (=> d!56421 (= res!91221 (simpleValid!201 thiss!1248))))

(assert (=> d!56421 (= (valid!1123 thiss!1248) e!127053)))

(declare-fun b!193111 () Bool)

(declare-fun res!91222 () Bool)

(assert (=> b!193111 (=> (not res!91222) (not e!127053))))

(declare-fun arrayCountValidKeys!0 (array!8167 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193111 (= res!91222 (= (arrayCountValidKeys!0 (_keys!5925 thiss!1248) #b00000000000000000000000000000000 (size!4169 (_keys!5925 thiss!1248))) (_size!1395 thiss!1248)))))

(declare-fun b!193112 () Bool)

(declare-fun res!91223 () Bool)

(assert (=> b!193112 (=> (not res!91223) (not e!127053))))

(assert (=> b!193112 (= res!91223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5925 thiss!1248) (mask!9182 thiss!1248)))))

(declare-fun b!193113 () Bool)

(assert (=> b!193113 (= e!127053 (arrayNoDuplicates!0 (_keys!5925 thiss!1248) #b00000000000000000000000000000000 Nil!2413))))

(assert (= (and d!56421 res!91221) b!193111))

(assert (= (and b!193111 res!91222) b!193112))

(assert (= (and b!193112 res!91223) b!193113))

(declare-fun m!219477 () Bool)

(assert (=> d!56421 m!219477))

(declare-fun m!219479 () Bool)

(assert (=> b!193111 m!219479))

(assert (=> b!193112 m!219199))

(assert (=> b!193113 m!219221))

(assert (=> start!19696 d!56421))

(declare-fun mapIsEmpty!7739 () Bool)

(declare-fun mapRes!7739 () Bool)

(assert (=> mapIsEmpty!7739 mapRes!7739))

(declare-fun mapNonEmpty!7739 () Bool)

(declare-fun tp!16973 () Bool)

(declare-fun e!127059 () Bool)

(assert (=> mapNonEmpty!7739 (= mapRes!7739 (and tp!16973 e!127059))))

(declare-fun mapRest!7739 () (Array (_ BitVec 32) ValueCell!1892))

(declare-fun mapKey!7739 () (_ BitVec 32))

(declare-fun mapValue!7739 () ValueCell!1892)

(assert (=> mapNonEmpty!7739 (= mapRest!7730 (store mapRest!7739 mapKey!7739 mapValue!7739))))

(declare-fun condMapEmpty!7739 () Bool)

(declare-fun mapDefault!7739 () ValueCell!1892)

(assert (=> mapNonEmpty!7730 (= condMapEmpty!7739 (= mapRest!7730 ((as const (Array (_ BitVec 32) ValueCell!1892)) mapDefault!7739)))))

(declare-fun e!127058 () Bool)

(assert (=> mapNonEmpty!7730 (= tp!16958 (and e!127058 mapRes!7739))))

(declare-fun b!193120 () Bool)

(assert (=> b!193120 (= e!127059 tp_is_empty!4471)))

(declare-fun b!193121 () Bool)

(assert (=> b!193121 (= e!127058 tp_is_empty!4471)))

(assert (= (and mapNonEmpty!7730 condMapEmpty!7739) mapIsEmpty!7739))

(assert (= (and mapNonEmpty!7730 (not condMapEmpty!7739)) mapNonEmpty!7739))

(assert (= (and mapNonEmpty!7739 ((_ is ValueCellFull!1892) mapValue!7739)) b!193120))

(assert (= (and mapNonEmpty!7730 ((_ is ValueCellFull!1892) mapDefault!7739)) b!193121))

(declare-fun m!219481 () Bool)

(assert (=> mapNonEmpty!7739 m!219481))

(declare-fun b_lambda!7441 () Bool)

(assert (= b_lambda!7439 (or (and b!192844 b_free!4699) b_lambda!7441)))

(declare-fun b_lambda!7443 () Bool)

(assert (= b_lambda!7437 (or (and b!192844 b_free!4699) b_lambda!7443)))

(check-sat (not b!193034) (not bm!19481) (not b!192936) (not b!193065) (not b!193032) (not b!193078) (not b!193055) (not b!193112) (not d!56403) (not b!193064) (not bm!19487) (not b!193079) (not bm!19485) (not b_next!4699) (not b!192945) (not b!192971) (not b_lambda!7443) (not bm!19496) (not b!193054) (not b!192938) (not bm!19501) b_and!11383 (not bm!19492) (not d!56399) (not b!193056) (not b!193113) (not b_lambda!7441) (not b!193051) (not b!193111) (not b!193028) (not d!56421) (not b!193031) (not b!193022) (not b!193047) (not b!193045) (not b!193033) (not b!193068) (not b!193023) (not b!193057) (not d!56405) (not d!56407) (not b!192939) tp_is_empty!4471 (not bm!19502) (not b!192973) (not d!56409) (not bm!19482) (not d!56419) (not b!192959) (not bm!19480) (not bm!19488) (not mapNonEmpty!7739) (not bm!19489) (not d!56395) (not bm!19465) (not b!193046) (not b!193024) (not d!56411))
(check-sat b_and!11383 (not b_next!4699))
