; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24868 () Bool)

(assert start!24868)

(declare-fun b!259625 () Bool)

(declare-fun b_free!6751 () Bool)

(declare-fun b_next!6751 () Bool)

(assert (=> b!259625 (= b_free!6751 (not b_next!6751))))

(declare-fun tp!23573 () Bool)

(declare-fun b_and!13867 () Bool)

(assert (=> b!259625 (= tp!23573 b_and!13867)))

(declare-fun b!259606 () Bool)

(declare-fun c!44080 () Bool)

(declare-datatypes ((SeekEntryResult!1146 0))(
  ( (MissingZero!1146 (index!6754 (_ BitVec 32))) (Found!1146 (index!6755 (_ BitVec 32))) (Intermediate!1146 (undefined!1958 Bool) (index!6756 (_ BitVec 32)) (x!25066 (_ BitVec 32))) (Undefined!1146) (MissingVacant!1146 (index!6757 (_ BitVec 32))) )
))
(declare-fun lt!130855 () SeekEntryResult!1146)

(get-info :version)

(assert (=> b!259606 (= c!44080 ((_ is MissingVacant!1146) lt!130855))))

(declare-fun e!168240 () Bool)

(declare-fun e!168250 () Bool)

(assert (=> b!259606 (= e!168240 e!168250)))

(declare-fun b!259607 () Bool)

(declare-fun res!126909 () Bool)

(declare-datatypes ((V!8465 0))(
  ( (V!8466 (val!3351 Int)) )
))
(declare-datatypes ((ValueCell!2963 0))(
  ( (ValueCellFull!2963 (v!5462 V!8465)) (EmptyCell!2963) )
))
(declare-datatypes ((array!12575 0))(
  ( (array!12576 (arr!5953 (Array (_ BitVec 32) ValueCell!2963)) (size!6302 (_ BitVec 32))) )
))
(declare-datatypes ((array!12577 0))(
  ( (array!12578 (arr!5954 (Array (_ BitVec 32) (_ BitVec 64))) (size!6303 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3826 0))(
  ( (LongMapFixedSize!3827 (defaultEntry!4786 Int) (mask!11105 (_ BitVec 32)) (extraKeys!4523 (_ BitVec 32)) (zeroValue!4627 V!8465) (minValue!4627 V!8465) (_size!1962 (_ BitVec 32)) (_keys!6964 array!12577) (_values!4769 array!12575) (_vacant!1962 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3826)

(assert (=> b!259607 (= res!126909 (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6757 lt!130855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168249 () Bool)

(assert (=> b!259607 (=> (not res!126909) (not e!168249))))

(declare-fun b!259608 () Bool)

(declare-fun e!168241 () Bool)

(declare-fun call!24704 () Bool)

(assert (=> b!259608 (= e!168241 (not call!24704))))

(declare-fun b!259609 () Bool)

(assert (=> b!259609 (= e!168249 (not call!24704))))

(declare-fun b!259610 () Bool)

(declare-datatypes ((Unit!8044 0))(
  ( (Unit!8045) )
))
(declare-fun e!168239 () Unit!8044)

(declare-fun lt!130857 () Unit!8044)

(assert (=> b!259610 (= e!168239 lt!130857)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!428 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8044)

(assert (=> b!259610 (= lt!130857 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!428 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(declare-fun c!44081 () Bool)

(assert (=> b!259610 (= c!44081 ((_ is MissingZero!1146) lt!130855))))

(assert (=> b!259610 e!168240))

(declare-fun b!259611 () Bool)

(declare-fun e!168246 () Bool)

(declare-fun e!168238 () Bool)

(assert (=> b!259611 (= e!168246 e!168238)))

(declare-fun res!126907 () Bool)

(assert (=> b!259611 (=> (not res!126907) (not e!168238))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!259611 (= res!126907 (inRange!0 index!297 (mask!11105 thiss!1504)))))

(declare-fun lt!130854 () Unit!8044)

(assert (=> b!259611 (= lt!130854 e!168239)))

(declare-fun c!44079 () Bool)

(declare-datatypes ((tuple2!4852 0))(
  ( (tuple2!4853 (_1!2437 (_ BitVec 64)) (_2!2437 V!8465)) )
))
(declare-datatypes ((List!3730 0))(
  ( (Nil!3727) (Cons!3726 (h!4390 tuple2!4852) (t!8789 List!3730)) )
))
(declare-datatypes ((ListLongMap!3767 0))(
  ( (ListLongMap!3768 (toList!1899 List!3730)) )
))
(declare-fun lt!130848 () ListLongMap!3767)

(declare-fun contains!1862 (ListLongMap!3767 (_ BitVec 64)) Bool)

(assert (=> b!259611 (= c!44079 (contains!1862 lt!130848 key!932))))

(declare-fun getCurrentListMap!1431 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) Int) ListLongMap!3767)

(assert (=> b!259611 (= lt!130848 (getCurrentListMap!1431 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun b!259612 () Bool)

(assert (=> b!259612 (= e!168250 e!168249)))

(declare-fun res!126906 () Bool)

(declare-fun call!24705 () Bool)

(assert (=> b!259612 (= res!126906 call!24705)))

(assert (=> b!259612 (=> (not res!126906) (not e!168249))))

(declare-fun b!259613 () Bool)

(declare-fun e!168244 () Bool)

(declare-fun e!168242 () Bool)

(declare-fun mapRes!11267 () Bool)

(assert (=> b!259613 (= e!168244 (and e!168242 mapRes!11267))))

(declare-fun condMapEmpty!11267 () Bool)

(declare-fun mapDefault!11267 () ValueCell!2963)

(assert (=> b!259613 (= condMapEmpty!11267 (= (arr!5953 (_values!4769 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2963)) mapDefault!11267)))))

(declare-fun b!259614 () Bool)

(declare-fun e!168251 () Bool)

(declare-fun tp_is_empty!6613 () Bool)

(assert (=> b!259614 (= e!168251 tp_is_empty!6613)))

(declare-fun b!259615 () Bool)

(declare-fun e!168247 () Unit!8044)

(declare-fun Unit!8046 () Unit!8044)

(assert (=> b!259615 (= e!168247 Unit!8046)))

(declare-fun b!259616 () Bool)

(declare-fun res!126912 () Bool)

(declare-fun e!168252 () Bool)

(assert (=> b!259616 (=> (not res!126912) (not e!168252))))

(assert (=> b!259616 (= res!126912 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!259617 () Bool)

(declare-fun res!126908 () Bool)

(assert (=> b!259617 (=> (not res!126908) (not e!168241))))

(assert (=> b!259617 (= res!126908 (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6754 lt!130855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259618 () Bool)

(assert (=> b!259618 (= e!168250 ((_ is Undefined!1146) lt!130855))))

(declare-fun mapNonEmpty!11267 () Bool)

(declare-fun tp!23572 () Bool)

(assert (=> mapNonEmpty!11267 (= mapRes!11267 (and tp!23572 e!168251))))

(declare-fun mapValue!11267 () ValueCell!2963)

(declare-fun mapKey!11267 () (_ BitVec 32))

(declare-fun mapRest!11267 () (Array (_ BitVec 32) ValueCell!2963))

(assert (=> mapNonEmpty!11267 (= (arr!5953 (_values!4769 thiss!1504)) (store mapRest!11267 mapKey!11267 mapValue!11267))))

(declare-fun bm!24701 () Bool)

(assert (=> bm!24701 (= call!24705 (inRange!0 (ite c!44081 (index!6754 lt!130855) (index!6757 lt!130855)) (mask!11105 thiss!1504)))))

(declare-fun b!259619 () Bool)

(declare-fun e!168248 () Bool)

(assert (=> b!259619 (= e!168238 (not e!168248))))

(declare-fun res!126910 () Bool)

(assert (=> b!259619 (=> res!126910 e!168248)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!259619 (= res!126910 (not (validMask!0 (mask!11105 thiss!1504))))))

(declare-fun lt!130845 () array!12577)

(declare-fun arrayCountValidKeys!0 (array!12577 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259619 (= (arrayCountValidKeys!0 lt!130845 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130847 () Unit!8044)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12577 (_ BitVec 32)) Unit!8044)

(assert (=> b!259619 (= lt!130847 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130845 index!297))))

(declare-fun arrayContainsKey!0 (array!12577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!259619 (arrayContainsKey!0 lt!130845 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130851 () Unit!8044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12577 (_ BitVec 64) (_ BitVec 32)) Unit!8044)

(assert (=> b!259619 (= lt!130851 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130845 key!932 index!297))))

(declare-fun v!346 () V!8465)

(declare-fun +!696 (ListLongMap!3767 tuple2!4852) ListLongMap!3767)

(assert (=> b!259619 (= (+!696 lt!130848 (tuple2!4853 key!932 v!346)) (getCurrentListMap!1431 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130850 () Unit!8044)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!111 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) (_ BitVec 64) V!8465 Int) Unit!8044)

(assert (=> b!259619 (= lt!130850 (lemmaAddValidKeyToArrayThenAddPairToListMap!111 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12577 (_ BitVec 32)) Bool)

(assert (=> b!259619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130845 (mask!11105 thiss!1504))))

(declare-fun lt!130856 () Unit!8044)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12577 (_ BitVec 32) (_ BitVec 32)) Unit!8044)

(assert (=> b!259619 (= lt!130856 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) index!297 (mask!11105 thiss!1504)))))

(assert (=> b!259619 (= (arrayCountValidKeys!0 lt!130845 #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6964 thiss!1504) #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504)))))))

(declare-fun lt!130844 () Unit!8044)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12577 (_ BitVec 32) (_ BitVec 64)) Unit!8044)

(assert (=> b!259619 (= lt!130844 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6964 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3731 0))(
  ( (Nil!3728) (Cons!3727 (h!4391 (_ BitVec 64)) (t!8790 List!3731)) )
))
(declare-fun arrayNoDuplicates!0 (array!12577 (_ BitVec 32) List!3731) Bool)

(assert (=> b!259619 (arrayNoDuplicates!0 lt!130845 #b00000000000000000000000000000000 Nil!3728)))

(assert (=> b!259619 (= lt!130845 (array!12578 (store (arr!5954 (_keys!6964 thiss!1504)) index!297 key!932) (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun lt!130853 () Unit!8044)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3731) Unit!8044)

(assert (=> b!259619 (= lt!130853 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6964 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3728))))

(declare-fun lt!130852 () Unit!8044)

(assert (=> b!259619 (= lt!130852 e!168247)))

(declare-fun c!44078 () Bool)

(assert (=> b!259619 (= c!44078 (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24702 () Bool)

(assert (=> bm!24702 (= call!24704 (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11267 () Bool)

(assert (=> mapIsEmpty!11267 mapRes!11267))

(declare-fun b!259620 () Bool)

(declare-fun res!126913 () Bool)

(assert (=> b!259620 (=> (not res!126913) (not e!168241))))

(assert (=> b!259620 (= res!126913 call!24705)))

(assert (=> b!259620 (= e!168240 e!168241)))

(declare-fun b!259621 () Bool)

(assert (=> b!259621 (= e!168252 e!168246)))

(declare-fun res!126911 () Bool)

(assert (=> b!259621 (=> (not res!126911) (not e!168246))))

(assert (=> b!259621 (= res!126911 (or (= lt!130855 (MissingZero!1146 index!297)) (= lt!130855 (MissingVacant!1146 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12577 (_ BitVec 32)) SeekEntryResult!1146)

(assert (=> b!259621 (= lt!130855 (seekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(declare-fun b!259622 () Bool)

(declare-fun Unit!8047 () Unit!8044)

(assert (=> b!259622 (= e!168239 Unit!8047)))

(declare-fun lt!130846 () Unit!8044)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!436 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8044)

(assert (=> b!259622 (= lt!130846 (lemmaInListMapThenSeekEntryOrOpenFindsIt!436 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(assert (=> b!259622 false))

(declare-fun b!259623 () Bool)

(assert (=> b!259623 (= e!168248 (or (not (= (size!6302 (_values!4769 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11105 thiss!1504)))) (not (= (size!6303 (_keys!6964 thiss!1504)) (size!6302 (_values!4769 thiss!1504)))) (bvsge (mask!11105 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!259624 () Bool)

(declare-fun Unit!8048 () Unit!8044)

(assert (=> b!259624 (= e!168247 Unit!8048)))

(declare-fun lt!130849 () Unit!8044)

(declare-fun lemmaArrayContainsKeyThenInListMap!255 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) (_ BitVec 32) Int) Unit!8044)

(assert (=> b!259624 (= lt!130849 (lemmaArrayContainsKeyThenInListMap!255 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(assert (=> b!259624 false))

(declare-fun e!168245 () Bool)

(declare-fun array_inv!3921 (array!12577) Bool)

(declare-fun array_inv!3922 (array!12575) Bool)

(assert (=> b!259625 (= e!168245 (and tp!23573 tp_is_empty!6613 (array_inv!3921 (_keys!6964 thiss!1504)) (array_inv!3922 (_values!4769 thiss!1504)) e!168244))))

(declare-fun res!126914 () Bool)

(assert (=> start!24868 (=> (not res!126914) (not e!168252))))

(declare-fun valid!1501 (LongMapFixedSize!3826) Bool)

(assert (=> start!24868 (= res!126914 (valid!1501 thiss!1504))))

(assert (=> start!24868 e!168252))

(assert (=> start!24868 e!168245))

(assert (=> start!24868 true))

(assert (=> start!24868 tp_is_empty!6613))

(declare-fun b!259626 () Bool)

(assert (=> b!259626 (= e!168242 tp_is_empty!6613)))

(assert (= (and start!24868 res!126914) b!259616))

(assert (= (and b!259616 res!126912) b!259621))

(assert (= (and b!259621 res!126911) b!259611))

(assert (= (and b!259611 c!44079) b!259622))

(assert (= (and b!259611 (not c!44079)) b!259610))

(assert (= (and b!259610 c!44081) b!259620))

(assert (= (and b!259610 (not c!44081)) b!259606))

(assert (= (and b!259620 res!126913) b!259617))

(assert (= (and b!259617 res!126908) b!259608))

(assert (= (and b!259606 c!44080) b!259612))

(assert (= (and b!259606 (not c!44080)) b!259618))

(assert (= (and b!259612 res!126906) b!259607))

(assert (= (and b!259607 res!126909) b!259609))

(assert (= (or b!259620 b!259612) bm!24701))

(assert (= (or b!259608 b!259609) bm!24702))

(assert (= (and b!259611 res!126907) b!259619))

(assert (= (and b!259619 c!44078) b!259624))

(assert (= (and b!259619 (not c!44078)) b!259615))

(assert (= (and b!259619 (not res!126910)) b!259623))

(assert (= (and b!259613 condMapEmpty!11267) mapIsEmpty!11267))

(assert (= (and b!259613 (not condMapEmpty!11267)) mapNonEmpty!11267))

(assert (= (and mapNonEmpty!11267 ((_ is ValueCellFull!2963) mapValue!11267)) b!259614))

(assert (= (and b!259613 ((_ is ValueCellFull!2963) mapDefault!11267)) b!259626))

(assert (= b!259625 b!259613))

(assert (= start!24868 b!259625))

(declare-fun m!275441 () Bool)

(assert (=> b!259617 m!275441))

(declare-fun m!275443 () Bool)

(assert (=> bm!24702 m!275443))

(declare-fun m!275445 () Bool)

(assert (=> b!259619 m!275445))

(declare-fun m!275447 () Bool)

(assert (=> b!259619 m!275447))

(declare-fun m!275449 () Bool)

(assert (=> b!259619 m!275449))

(declare-fun m!275451 () Bool)

(assert (=> b!259619 m!275451))

(declare-fun m!275453 () Bool)

(assert (=> b!259619 m!275453))

(declare-fun m!275455 () Bool)

(assert (=> b!259619 m!275455))

(declare-fun m!275457 () Bool)

(assert (=> b!259619 m!275457))

(declare-fun m!275459 () Bool)

(assert (=> b!259619 m!275459))

(declare-fun m!275461 () Bool)

(assert (=> b!259619 m!275461))

(declare-fun m!275463 () Bool)

(assert (=> b!259619 m!275463))

(declare-fun m!275465 () Bool)

(assert (=> b!259619 m!275465))

(declare-fun m!275467 () Bool)

(assert (=> b!259619 m!275467))

(declare-fun m!275469 () Bool)

(assert (=> b!259619 m!275469))

(declare-fun m!275471 () Bool)

(assert (=> b!259619 m!275471))

(assert (=> b!259619 m!275443))

(declare-fun m!275473 () Bool)

(assert (=> b!259619 m!275473))

(declare-fun m!275475 () Bool)

(assert (=> b!259619 m!275475))

(declare-fun m!275477 () Bool)

(assert (=> b!259619 m!275477))

(declare-fun m!275479 () Bool)

(assert (=> b!259607 m!275479))

(declare-fun m!275481 () Bool)

(assert (=> start!24868 m!275481))

(declare-fun m!275483 () Bool)

(assert (=> mapNonEmpty!11267 m!275483))

(declare-fun m!275485 () Bool)

(assert (=> b!259611 m!275485))

(declare-fun m!275487 () Bool)

(assert (=> b!259611 m!275487))

(declare-fun m!275489 () Bool)

(assert (=> b!259611 m!275489))

(declare-fun m!275491 () Bool)

(assert (=> b!259621 m!275491))

(declare-fun m!275493 () Bool)

(assert (=> bm!24701 m!275493))

(declare-fun m!275495 () Bool)

(assert (=> b!259622 m!275495))

(declare-fun m!275497 () Bool)

(assert (=> b!259610 m!275497))

(declare-fun m!275499 () Bool)

(assert (=> b!259624 m!275499))

(declare-fun m!275501 () Bool)

(assert (=> b!259625 m!275501))

(declare-fun m!275503 () Bool)

(assert (=> b!259625 m!275503))

(check-sat (not start!24868) b_and!13867 (not mapNonEmpty!11267) (not b!259622) (not bm!24702) (not b_next!6751) (not b!259625) (not b!259610) (not b!259621) (not b!259624) (not b!259611) (not bm!24701) tp_is_empty!6613 (not b!259619))
(check-sat b_and!13867 (not b_next!6751))
(get-model)

(declare-fun d!62465 () Bool)

(assert (=> d!62465 (= (array_inv!3921 (_keys!6964 thiss!1504)) (bvsge (size!6303 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259625 d!62465))

(declare-fun d!62467 () Bool)

(assert (=> d!62467 (= (array_inv!3922 (_values!4769 thiss!1504)) (bvsge (size!6302 (_values!4769 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259625 d!62467))

(declare-fun d!62469 () Bool)

(declare-fun res!126973 () Bool)

(declare-fun e!168347 () Bool)

(assert (=> d!62469 (=> res!126973 e!168347)))

(assert (=> d!62469 (= res!126973 (= (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62469 (= (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 #b00000000000000000000000000000000) e!168347)))

(declare-fun b!259757 () Bool)

(declare-fun e!168348 () Bool)

(assert (=> b!259757 (= e!168347 e!168348)))

(declare-fun res!126974 () Bool)

(assert (=> b!259757 (=> (not res!126974) (not e!168348))))

(assert (=> b!259757 (= res!126974 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259758 () Bool)

(assert (=> b!259758 (= e!168348 (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62469 (not res!126973)) b!259757))

(assert (= (and b!259757 res!126974) b!259758))

(declare-fun m!275633 () Bool)

(assert (=> d!62469 m!275633))

(declare-fun m!275635 () Bool)

(assert (=> b!259758 m!275635))

(assert (=> bm!24702 d!62469))

(declare-fun d!62471 () Bool)

(assert (=> d!62471 (contains!1862 (getCurrentListMap!1431 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) key!932)))

(declare-fun lt!130944 () Unit!8044)

(declare-fun choose!1267 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) (_ BitVec 32) Int) Unit!8044)

(assert (=> d!62471 (= lt!130944 (choose!1267 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62471 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62471 (= (lemmaArrayContainsKeyThenInListMap!255 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) lt!130944)))

(declare-fun bs!9177 () Bool)

(assert (= bs!9177 d!62471))

(assert (=> bs!9177 m!275489))

(assert (=> bs!9177 m!275489))

(declare-fun m!275637 () Bool)

(assert (=> bs!9177 m!275637))

(declare-fun m!275639 () Bool)

(assert (=> bs!9177 m!275639))

(assert (=> bs!9177 m!275445))

(assert (=> b!259624 d!62471))

(declare-fun b!259769 () Bool)

(declare-fun e!168353 () Bool)

(assert (=> b!259769 (= e!168353 (bvslt (size!6303 (_keys!6964 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!259770 () Bool)

(declare-fun e!168354 () Bool)

(assert (=> b!259770 (= e!168354 (= (arrayCountValidKeys!0 (array!12578 (store (arr!5954 (_keys!6964 thiss!1504)) index!297 key!932) (size!6303 (_keys!6964 thiss!1504))) #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6964 thiss!1504) #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!259767 () Bool)

(declare-fun res!126986 () Bool)

(assert (=> b!259767 (=> (not res!126986) (not e!168353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!259767 (= res!126986 (not (validKeyInArray!0 (select (arr!5954 (_keys!6964 thiss!1504)) index!297))))))

(declare-fun d!62473 () Bool)

(assert (=> d!62473 e!168354))

(declare-fun res!126983 () Bool)

(assert (=> d!62473 (=> (not res!126983) (not e!168354))))

(assert (=> d!62473 (= res!126983 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6303 (_keys!6964 thiss!1504)))))))

(declare-fun lt!130947 () Unit!8044)

(declare-fun choose!1 (array!12577 (_ BitVec 32) (_ BitVec 64)) Unit!8044)

(assert (=> d!62473 (= lt!130947 (choose!1 (_keys!6964 thiss!1504) index!297 key!932))))

(assert (=> d!62473 e!168353))

(declare-fun res!126985 () Bool)

(assert (=> d!62473 (=> (not res!126985) (not e!168353))))

(assert (=> d!62473 (= res!126985 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6303 (_keys!6964 thiss!1504)))))))

(assert (=> d!62473 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6964 thiss!1504) index!297 key!932) lt!130947)))

(declare-fun b!259768 () Bool)

(declare-fun res!126984 () Bool)

(assert (=> b!259768 (=> (not res!126984) (not e!168353))))

(assert (=> b!259768 (= res!126984 (validKeyInArray!0 key!932))))

(assert (= (and d!62473 res!126985) b!259767))

(assert (= (and b!259767 res!126986) b!259768))

(assert (= (and b!259768 res!126984) b!259769))

(assert (= (and d!62473 res!126983) b!259770))

(assert (=> b!259770 m!275465))

(declare-fun m!275641 () Bool)

(assert (=> b!259770 m!275641))

(assert (=> b!259770 m!275467))

(declare-fun m!275643 () Bool)

(assert (=> b!259767 m!275643))

(assert (=> b!259767 m!275643))

(declare-fun m!275645 () Bool)

(assert (=> b!259767 m!275645))

(declare-fun m!275647 () Bool)

(assert (=> d!62473 m!275647))

(declare-fun m!275649 () Bool)

(assert (=> b!259768 m!275649))

(assert (=> b!259619 d!62473))

(declare-fun bm!24717 () Bool)

(declare-fun call!24720 () (_ BitVec 32))

(assert (=> bm!24717 (= call!24720 (arrayCountValidKeys!0 (_keys!6964 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259780 () Bool)

(declare-fun e!168359 () (_ BitVec 32))

(assert (=> b!259780 (= e!168359 call!24720)))

(declare-fun b!259781 () Bool)

(declare-fun e!168360 () (_ BitVec 32))

(assert (=> b!259781 (= e!168360 #b00000000000000000000000000000000)))

(declare-fun b!259782 () Bool)

(assert (=> b!259782 (= e!168359 (bvadd #b00000000000000000000000000000001 call!24720))))

(declare-fun b!259779 () Bool)

(assert (=> b!259779 (= e!168360 e!168359)))

(declare-fun c!44110 () Bool)

(assert (=> b!259779 (= c!44110 (validKeyInArray!0 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62475 () Bool)

(declare-fun lt!130950 () (_ BitVec 32))

(assert (=> d!62475 (and (bvsge lt!130950 #b00000000000000000000000000000000) (bvsle lt!130950 (bvsub (size!6303 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62475 (= lt!130950 e!168360)))

(declare-fun c!44111 () Bool)

(assert (=> d!62475 (= c!44111 (bvsge #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))

(assert (=> d!62475 (and (bvsle #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6303 (_keys!6964 thiss!1504)) (size!6303 (_keys!6964 thiss!1504))))))

(assert (=> d!62475 (= (arrayCountValidKeys!0 (_keys!6964 thiss!1504) #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) lt!130950)))

(assert (= (and d!62475 c!44111) b!259781))

(assert (= (and d!62475 (not c!44111)) b!259779))

(assert (= (and b!259779 c!44110) b!259782))

(assert (= (and b!259779 (not c!44110)) b!259780))

(assert (= (or b!259782 b!259780) bm!24717))

(declare-fun m!275651 () Bool)

(assert (=> bm!24717 m!275651))

(assert (=> b!259779 m!275633))

(assert (=> b!259779 m!275633))

(declare-fun m!275653 () Bool)

(assert (=> b!259779 m!275653))

(assert (=> b!259619 d!62475))

(declare-fun d!62477 () Bool)

(declare-fun e!168363 () Bool)

(assert (=> d!62477 e!168363))

(declare-fun res!126989 () Bool)

(assert (=> d!62477 (=> (not res!126989) (not e!168363))))

(assert (=> d!62477 (= res!126989 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6303 (_keys!6964 thiss!1504))) (bvslt index!297 (size!6302 (_values!4769 thiss!1504)))))))

(declare-fun lt!130953 () Unit!8044)

(declare-fun choose!1268 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) (_ BitVec 64) V!8465 Int) Unit!8044)

(assert (=> d!62477 (= lt!130953 (choose!1268 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62477 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62477 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!111 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)) lt!130953)))

(declare-fun b!259785 () Bool)

(assert (=> b!259785 (= e!168363 (= (+!696 (getCurrentListMap!1431 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) (tuple2!4853 key!932 v!346)) (getCurrentListMap!1431 (array!12578 (store (arr!5954 (_keys!6964 thiss!1504)) index!297 key!932) (size!6303 (_keys!6964 thiss!1504))) (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504))))))

(assert (= (and d!62477 res!126989) b!259785))

(declare-fun m!275655 () Bool)

(assert (=> d!62477 m!275655))

(assert (=> d!62477 m!275445))

(assert (=> b!259785 m!275455))

(assert (=> b!259785 m!275489))

(declare-fun m!275657 () Bool)

(assert (=> b!259785 m!275657))

(declare-fun m!275659 () Bool)

(assert (=> b!259785 m!275659))

(assert (=> b!259785 m!275465))

(assert (=> b!259785 m!275489))

(assert (=> b!259619 d!62477))

(declare-fun bm!24718 () Bool)

(declare-fun call!24721 () (_ BitVec 32))

(assert (=> bm!24718 (= call!24721 (arrayCountValidKeys!0 lt!130845 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!259787 () Bool)

(declare-fun e!168364 () (_ BitVec 32))

(assert (=> b!259787 (= e!168364 call!24721)))

(declare-fun b!259788 () Bool)

(declare-fun e!168365 () (_ BitVec 32))

(assert (=> b!259788 (= e!168365 #b00000000000000000000000000000000)))

(declare-fun b!259789 () Bool)

(assert (=> b!259789 (= e!168364 (bvadd #b00000000000000000000000000000001 call!24721))))

(declare-fun b!259786 () Bool)

(assert (=> b!259786 (= e!168365 e!168364)))

(declare-fun c!44112 () Bool)

(assert (=> b!259786 (= c!44112 (validKeyInArray!0 (select (arr!5954 lt!130845) index!297)))))

(declare-fun d!62479 () Bool)

(declare-fun lt!130954 () (_ BitVec 32))

(assert (=> d!62479 (and (bvsge lt!130954 #b00000000000000000000000000000000) (bvsle lt!130954 (bvsub (size!6303 lt!130845) index!297)))))

(assert (=> d!62479 (= lt!130954 e!168365)))

(declare-fun c!44113 () Bool)

(assert (=> d!62479 (= c!44113 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62479 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6303 lt!130845)))))

(assert (=> d!62479 (= (arrayCountValidKeys!0 lt!130845 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!130954)))

(assert (= (and d!62479 c!44113) b!259788))

(assert (= (and d!62479 (not c!44113)) b!259786))

(assert (= (and b!259786 c!44112) b!259789))

(assert (= (and b!259786 (not c!44112)) b!259787))

(assert (= (or b!259789 b!259787) bm!24718))

(declare-fun m!275661 () Bool)

(assert (=> bm!24718 m!275661))

(declare-fun m!275663 () Bool)

(assert (=> b!259786 m!275663))

(assert (=> b!259786 m!275663))

(declare-fun m!275665 () Bool)

(assert (=> b!259786 m!275665))

(assert (=> b!259619 d!62479))

(declare-fun d!62481 () Bool)

(declare-fun e!168368 () Bool)

(assert (=> d!62481 e!168368))

(declare-fun res!126994 () Bool)

(assert (=> d!62481 (=> (not res!126994) (not e!168368))))

(declare-fun lt!130965 () ListLongMap!3767)

(assert (=> d!62481 (= res!126994 (contains!1862 lt!130965 (_1!2437 (tuple2!4853 key!932 v!346))))))

(declare-fun lt!130964 () List!3730)

(assert (=> d!62481 (= lt!130965 (ListLongMap!3768 lt!130964))))

(declare-fun lt!130963 () Unit!8044)

(declare-fun lt!130966 () Unit!8044)

(assert (=> d!62481 (= lt!130963 lt!130966)))

(declare-datatypes ((Option!322 0))(
  ( (Some!321 (v!5467 V!8465)) (None!320) )
))
(declare-fun getValueByKey!316 (List!3730 (_ BitVec 64)) Option!322)

(assert (=> d!62481 (= (getValueByKey!316 lt!130964 (_1!2437 (tuple2!4853 key!932 v!346))) (Some!321 (_2!2437 (tuple2!4853 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!172 (List!3730 (_ BitVec 64) V!8465) Unit!8044)

(assert (=> d!62481 (= lt!130966 (lemmaContainsTupThenGetReturnValue!172 lt!130964 (_1!2437 (tuple2!4853 key!932 v!346)) (_2!2437 (tuple2!4853 key!932 v!346))))))

(declare-fun insertStrictlySorted!175 (List!3730 (_ BitVec 64) V!8465) List!3730)

(assert (=> d!62481 (= lt!130964 (insertStrictlySorted!175 (toList!1899 lt!130848) (_1!2437 (tuple2!4853 key!932 v!346)) (_2!2437 (tuple2!4853 key!932 v!346))))))

(assert (=> d!62481 (= (+!696 lt!130848 (tuple2!4853 key!932 v!346)) lt!130965)))

(declare-fun b!259794 () Bool)

(declare-fun res!126995 () Bool)

(assert (=> b!259794 (=> (not res!126995) (not e!168368))))

(assert (=> b!259794 (= res!126995 (= (getValueByKey!316 (toList!1899 lt!130965) (_1!2437 (tuple2!4853 key!932 v!346))) (Some!321 (_2!2437 (tuple2!4853 key!932 v!346)))))))

(declare-fun b!259795 () Bool)

(declare-fun contains!1863 (List!3730 tuple2!4852) Bool)

(assert (=> b!259795 (= e!168368 (contains!1863 (toList!1899 lt!130965) (tuple2!4853 key!932 v!346)))))

(assert (= (and d!62481 res!126994) b!259794))

(assert (= (and b!259794 res!126995) b!259795))

(declare-fun m!275667 () Bool)

(assert (=> d!62481 m!275667))

(declare-fun m!275669 () Bool)

(assert (=> d!62481 m!275669))

(declare-fun m!275671 () Bool)

(assert (=> d!62481 m!275671))

(declare-fun m!275673 () Bool)

(assert (=> d!62481 m!275673))

(declare-fun m!275675 () Bool)

(assert (=> b!259794 m!275675))

(declare-fun m!275677 () Bool)

(assert (=> b!259795 m!275677))

(assert (=> b!259619 d!62481))

(declare-fun bm!24719 () Bool)

(declare-fun call!24722 () (_ BitVec 32))

(assert (=> bm!24719 (= call!24722 (arrayCountValidKeys!0 lt!130845 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259797 () Bool)

(declare-fun e!168369 () (_ BitVec 32))

(assert (=> b!259797 (= e!168369 call!24722)))

(declare-fun b!259798 () Bool)

(declare-fun e!168370 () (_ BitVec 32))

(assert (=> b!259798 (= e!168370 #b00000000000000000000000000000000)))

(declare-fun b!259799 () Bool)

(assert (=> b!259799 (= e!168369 (bvadd #b00000000000000000000000000000001 call!24722))))

(declare-fun b!259796 () Bool)

(assert (=> b!259796 (= e!168370 e!168369)))

(declare-fun c!44114 () Bool)

(assert (=> b!259796 (= c!44114 (validKeyInArray!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(declare-fun d!62483 () Bool)

(declare-fun lt!130967 () (_ BitVec 32))

(assert (=> d!62483 (and (bvsge lt!130967 #b00000000000000000000000000000000) (bvsle lt!130967 (bvsub (size!6303 lt!130845) #b00000000000000000000000000000000)))))

(assert (=> d!62483 (= lt!130967 e!168370)))

(declare-fun c!44115 () Bool)

(assert (=> d!62483 (= c!44115 (bvsge #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))

(assert (=> d!62483 (and (bvsle #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6303 (_keys!6964 thiss!1504)) (size!6303 lt!130845)))))

(assert (=> d!62483 (= (arrayCountValidKeys!0 lt!130845 #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) lt!130967)))

(assert (= (and d!62483 c!44115) b!259798))

(assert (= (and d!62483 (not c!44115)) b!259796))

(assert (= (and b!259796 c!44114) b!259799))

(assert (= (and b!259796 (not c!44114)) b!259797))

(assert (= (or b!259799 b!259797) bm!24719))

(declare-fun m!275679 () Bool)

(assert (=> bm!24719 m!275679))

(declare-fun m!275681 () Bool)

(assert (=> b!259796 m!275681))

(assert (=> b!259796 m!275681))

(declare-fun m!275683 () Bool)

(assert (=> b!259796 m!275683))

(assert (=> b!259619 d!62483))

(declare-fun d!62485 () Bool)

(assert (=> d!62485 (arrayContainsKey!0 lt!130845 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130970 () Unit!8044)

(declare-fun choose!13 (array!12577 (_ BitVec 64) (_ BitVec 32)) Unit!8044)

(assert (=> d!62485 (= lt!130970 (choose!13 lt!130845 key!932 index!297))))

(assert (=> d!62485 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62485 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130845 key!932 index!297) lt!130970)))

(declare-fun bs!9178 () Bool)

(assert (= bs!9178 d!62485))

(assert (=> bs!9178 m!275449))

(declare-fun m!275685 () Bool)

(assert (=> bs!9178 m!275685))

(assert (=> b!259619 d!62485))

(declare-fun d!62487 () Bool)

(declare-fun res!127002 () Bool)

(declare-fun e!168381 () Bool)

(assert (=> d!62487 (=> res!127002 e!168381)))

(assert (=> d!62487 (= res!127002 (bvsge #b00000000000000000000000000000000 (size!6303 lt!130845)))))

(assert (=> d!62487 (= (arrayNoDuplicates!0 lt!130845 #b00000000000000000000000000000000 Nil!3728) e!168381)))

(declare-fun b!259810 () Bool)

(declare-fun e!168379 () Bool)

(assert (=> b!259810 (= e!168381 e!168379)))

(declare-fun res!127004 () Bool)

(assert (=> b!259810 (=> (not res!127004) (not e!168379))))

(declare-fun e!168382 () Bool)

(assert (=> b!259810 (= res!127004 (not e!168382))))

(declare-fun res!127003 () Bool)

(assert (=> b!259810 (=> (not res!127003) (not e!168382))))

(assert (=> b!259810 (= res!127003 (validKeyInArray!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(declare-fun b!259811 () Bool)

(declare-fun contains!1864 (List!3731 (_ BitVec 64)) Bool)

(assert (=> b!259811 (= e!168382 (contains!1864 Nil!3728 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(declare-fun b!259812 () Bool)

(declare-fun e!168380 () Bool)

(declare-fun call!24725 () Bool)

(assert (=> b!259812 (= e!168380 call!24725)))

(declare-fun b!259813 () Bool)

(assert (=> b!259813 (= e!168380 call!24725)))

(declare-fun bm!24722 () Bool)

(declare-fun c!44118 () Bool)

(assert (=> bm!24722 (= call!24725 (arrayNoDuplicates!0 lt!130845 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44118 (Cons!3727 (select (arr!5954 lt!130845) #b00000000000000000000000000000000) Nil!3728) Nil!3728)))))

(declare-fun b!259814 () Bool)

(assert (=> b!259814 (= e!168379 e!168380)))

(assert (=> b!259814 (= c!44118 (validKeyInArray!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(assert (= (and d!62487 (not res!127002)) b!259810))

(assert (= (and b!259810 res!127003) b!259811))

(assert (= (and b!259810 res!127004) b!259814))

(assert (= (and b!259814 c!44118) b!259813))

(assert (= (and b!259814 (not c!44118)) b!259812))

(assert (= (or b!259813 b!259812) bm!24722))

(assert (=> b!259810 m!275681))

(assert (=> b!259810 m!275681))

(assert (=> b!259810 m!275683))

(assert (=> b!259811 m!275681))

(assert (=> b!259811 m!275681))

(declare-fun m!275687 () Bool)

(assert (=> b!259811 m!275687))

(assert (=> bm!24722 m!275681))

(declare-fun m!275689 () Bool)

(assert (=> bm!24722 m!275689))

(assert (=> b!259814 m!275681))

(assert (=> b!259814 m!275681))

(assert (=> b!259814 m!275683))

(assert (=> b!259619 d!62487))

(declare-fun d!62489 () Bool)

(declare-fun res!127005 () Bool)

(declare-fun e!168383 () Bool)

(assert (=> d!62489 (=> res!127005 e!168383)))

(assert (=> d!62489 (= res!127005 (= (select (arr!5954 lt!130845) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62489 (= (arrayContainsKey!0 lt!130845 key!932 #b00000000000000000000000000000000) e!168383)))

(declare-fun b!259815 () Bool)

(declare-fun e!168384 () Bool)

(assert (=> b!259815 (= e!168383 e!168384)))

(declare-fun res!127006 () Bool)

(assert (=> b!259815 (=> (not res!127006) (not e!168384))))

(assert (=> b!259815 (= res!127006 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6303 lt!130845)))))

(declare-fun b!259816 () Bool)

(assert (=> b!259816 (= e!168384 (arrayContainsKey!0 lt!130845 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62489 (not res!127005)) b!259815))

(assert (= (and b!259815 res!127006) b!259816))

(assert (=> d!62489 m!275681))

(declare-fun m!275691 () Bool)

(assert (=> b!259816 m!275691))

(assert (=> b!259619 d!62489))

(declare-fun d!62491 () Bool)

(declare-fun e!168387 () Bool)

(assert (=> d!62491 e!168387))

(declare-fun res!127009 () Bool)

(assert (=> d!62491 (=> (not res!127009) (not e!168387))))

(assert (=> d!62491 (= res!127009 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6303 (_keys!6964 thiss!1504)))))))

(declare-fun lt!130973 () Unit!8044)

(declare-fun choose!41 (array!12577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3731) Unit!8044)

(assert (=> d!62491 (= lt!130973 (choose!41 (_keys!6964 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3728))))

(assert (=> d!62491 (bvslt (size!6303 (_keys!6964 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62491 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6964 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3728) lt!130973)))

(declare-fun b!259819 () Bool)

(assert (=> b!259819 (= e!168387 (arrayNoDuplicates!0 (array!12578 (store (arr!5954 (_keys!6964 thiss!1504)) index!297 key!932) (size!6303 (_keys!6964 thiss!1504))) #b00000000000000000000000000000000 Nil!3728))))

(assert (= (and d!62491 res!127009) b!259819))

(declare-fun m!275693 () Bool)

(assert (=> d!62491 m!275693))

(assert (=> b!259819 m!275465))

(declare-fun m!275695 () Bool)

(assert (=> b!259819 m!275695))

(assert (=> b!259619 d!62491))

(assert (=> b!259619 d!62469))

(declare-fun d!62493 () Bool)

(declare-fun e!168390 () Bool)

(assert (=> d!62493 e!168390))

(declare-fun res!127012 () Bool)

(assert (=> d!62493 (=> (not res!127012) (not e!168390))))

(assert (=> d!62493 (= res!127012 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6303 (_keys!6964 thiss!1504)))))))

(declare-fun lt!130976 () Unit!8044)

(declare-fun choose!102 ((_ BitVec 64) array!12577 (_ BitVec 32) (_ BitVec 32)) Unit!8044)

(assert (=> d!62493 (= lt!130976 (choose!102 key!932 (_keys!6964 thiss!1504) index!297 (mask!11105 thiss!1504)))))

(assert (=> d!62493 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62493 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) index!297 (mask!11105 thiss!1504)) lt!130976)))

(declare-fun b!259822 () Bool)

(assert (=> b!259822 (= e!168390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12578 (store (arr!5954 (_keys!6964 thiss!1504)) index!297 key!932) (size!6303 (_keys!6964 thiss!1504))) (mask!11105 thiss!1504)))))

(assert (= (and d!62493 res!127012) b!259822))

(declare-fun m!275697 () Bool)

(assert (=> d!62493 m!275697))

(assert (=> d!62493 m!275445))

(assert (=> b!259822 m!275465))

(declare-fun m!275699 () Bool)

(assert (=> b!259822 m!275699))

(assert (=> b!259619 d!62493))

(declare-fun d!62495 () Bool)

(assert (=> d!62495 (= (validMask!0 (mask!11105 thiss!1504)) (and (or (= (mask!11105 thiss!1504) #b00000000000000000000000000000111) (= (mask!11105 thiss!1504) #b00000000000000000000000000001111) (= (mask!11105 thiss!1504) #b00000000000000000000000000011111) (= (mask!11105 thiss!1504) #b00000000000000000000000000111111) (= (mask!11105 thiss!1504) #b00000000000000000000000001111111) (= (mask!11105 thiss!1504) #b00000000000000000000000011111111) (= (mask!11105 thiss!1504) #b00000000000000000000000111111111) (= (mask!11105 thiss!1504) #b00000000000000000000001111111111) (= (mask!11105 thiss!1504) #b00000000000000000000011111111111) (= (mask!11105 thiss!1504) #b00000000000000000000111111111111) (= (mask!11105 thiss!1504) #b00000000000000000001111111111111) (= (mask!11105 thiss!1504) #b00000000000000000011111111111111) (= (mask!11105 thiss!1504) #b00000000000000000111111111111111) (= (mask!11105 thiss!1504) #b00000000000000001111111111111111) (= (mask!11105 thiss!1504) #b00000000000000011111111111111111) (= (mask!11105 thiss!1504) #b00000000000000111111111111111111) (= (mask!11105 thiss!1504) #b00000000000001111111111111111111) (= (mask!11105 thiss!1504) #b00000000000011111111111111111111) (= (mask!11105 thiss!1504) #b00000000000111111111111111111111) (= (mask!11105 thiss!1504) #b00000000001111111111111111111111) (= (mask!11105 thiss!1504) #b00000000011111111111111111111111) (= (mask!11105 thiss!1504) #b00000000111111111111111111111111) (= (mask!11105 thiss!1504) #b00000001111111111111111111111111) (= (mask!11105 thiss!1504) #b00000011111111111111111111111111) (= (mask!11105 thiss!1504) #b00000111111111111111111111111111) (= (mask!11105 thiss!1504) #b00001111111111111111111111111111) (= (mask!11105 thiss!1504) #b00011111111111111111111111111111) (= (mask!11105 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11105 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!259619 d!62495))

(declare-fun b!259865 () Bool)

(declare-fun res!127033 () Bool)

(declare-fun e!168429 () Bool)

(assert (=> b!259865 (=> (not res!127033) (not e!168429))))

(declare-fun e!168428 () Bool)

(assert (=> b!259865 (= res!127033 e!168428)))

(declare-fun res!127034 () Bool)

(assert (=> b!259865 (=> res!127034 e!168428)))

(declare-fun e!168420 () Bool)

(assert (=> b!259865 (= res!127034 (not e!168420))))

(declare-fun res!127038 () Bool)

(assert (=> b!259865 (=> (not res!127038) (not e!168420))))

(assert (=> b!259865 (= res!127038 (bvslt #b00000000000000000000000000000000 (size!6303 lt!130845)))))

(declare-fun b!259866 () Bool)

(assert (=> b!259866 (= e!168420 (validKeyInArray!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(declare-fun b!259867 () Bool)

(declare-fun e!168423 () ListLongMap!3767)

(declare-fun call!24746 () ListLongMap!3767)

(assert (=> b!259867 (= e!168423 call!24746)))

(declare-fun b!259868 () Bool)

(declare-fun res!127039 () Bool)

(assert (=> b!259868 (=> (not res!127039) (not e!168429))))

(declare-fun e!168425 () Bool)

(assert (=> b!259868 (= res!127039 e!168425)))

(declare-fun c!44133 () Bool)

(assert (=> b!259868 (= c!44133 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259869 () Bool)

(declare-fun e!168424 () Bool)

(declare-fun call!24740 () Bool)

(assert (=> b!259869 (= e!168424 (not call!24740))))

(declare-fun b!259870 () Bool)

(declare-fun e!168427 () Unit!8044)

(declare-fun Unit!8053 () Unit!8044)

(assert (=> b!259870 (= e!168427 Unit!8053)))

(declare-fun b!259871 () Bool)

(declare-fun c!44135 () Bool)

(assert (=> b!259871 (= c!44135 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!168421 () ListLongMap!3767)

(assert (=> b!259871 (= e!168421 e!168423)))

(declare-fun b!259872 () Bool)

(declare-fun e!168422 () ListLongMap!3767)

(assert (=> b!259872 (= e!168422 e!168421)))

(declare-fun c!44131 () Bool)

(assert (=> b!259872 (= c!44131 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259873 () Bool)

(declare-fun e!168417 () Bool)

(assert (=> b!259873 (= e!168424 e!168417)))

(declare-fun res!127031 () Bool)

(assert (=> b!259873 (= res!127031 call!24740)))

(assert (=> b!259873 (=> (not res!127031) (not e!168417))))

(declare-fun bm!24738 () Bool)

(declare-fun call!24743 () ListLongMap!3767)

(assert (=> bm!24738 (= call!24746 call!24743)))

(declare-fun b!259874 () Bool)

(declare-fun e!168419 () Bool)

(assert (=> b!259874 (= e!168425 e!168419)))

(declare-fun res!127037 () Bool)

(declare-fun call!24741 () Bool)

(assert (=> b!259874 (= res!127037 call!24741)))

(assert (=> b!259874 (=> (not res!127037) (not e!168419))))

(declare-fun b!259875 () Bool)

(declare-fun lt!131034 () Unit!8044)

(assert (=> b!259875 (= e!168427 lt!131034)))

(declare-fun lt!131033 () ListLongMap!3767)

(declare-fun getCurrentListMapNoExtraKeys!573 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) Int) ListLongMap!3767)

(assert (=> b!259875 (= lt!131033 (getCurrentListMapNoExtraKeys!573 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131024 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131023 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131023 (select (arr!5954 lt!130845) #b00000000000000000000000000000000))))

(declare-fun lt!131036 () Unit!8044)

(declare-fun addStillContains!233 (ListLongMap!3767 (_ BitVec 64) V!8465 (_ BitVec 64)) Unit!8044)

(assert (=> b!259875 (= lt!131036 (addStillContains!233 lt!131033 lt!131024 (zeroValue!4627 thiss!1504) lt!131023))))

(assert (=> b!259875 (contains!1862 (+!696 lt!131033 (tuple2!4853 lt!131024 (zeroValue!4627 thiss!1504))) lt!131023)))

(declare-fun lt!131038 () Unit!8044)

(assert (=> b!259875 (= lt!131038 lt!131036)))

(declare-fun lt!131031 () ListLongMap!3767)

(assert (=> b!259875 (= lt!131031 (getCurrentListMapNoExtraKeys!573 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131037 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131037 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131030 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131030 (select (arr!5954 lt!130845) #b00000000000000000000000000000000))))

(declare-fun lt!131027 () Unit!8044)

(declare-fun addApplyDifferent!233 (ListLongMap!3767 (_ BitVec 64) V!8465 (_ BitVec 64)) Unit!8044)

(assert (=> b!259875 (= lt!131027 (addApplyDifferent!233 lt!131031 lt!131037 (minValue!4627 thiss!1504) lt!131030))))

(declare-fun apply!257 (ListLongMap!3767 (_ BitVec 64)) V!8465)

(assert (=> b!259875 (= (apply!257 (+!696 lt!131031 (tuple2!4853 lt!131037 (minValue!4627 thiss!1504))) lt!131030) (apply!257 lt!131031 lt!131030))))

(declare-fun lt!131035 () Unit!8044)

(assert (=> b!259875 (= lt!131035 lt!131027)))

(declare-fun lt!131041 () ListLongMap!3767)

(assert (=> b!259875 (= lt!131041 (getCurrentListMapNoExtraKeys!573 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131022 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131026 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131026 (select (arr!5954 lt!130845) #b00000000000000000000000000000000))))

(declare-fun lt!131021 () Unit!8044)

(assert (=> b!259875 (= lt!131021 (addApplyDifferent!233 lt!131041 lt!131022 (zeroValue!4627 thiss!1504) lt!131026))))

(assert (=> b!259875 (= (apply!257 (+!696 lt!131041 (tuple2!4853 lt!131022 (zeroValue!4627 thiss!1504))) lt!131026) (apply!257 lt!131041 lt!131026))))

(declare-fun lt!131032 () Unit!8044)

(assert (=> b!259875 (= lt!131032 lt!131021)))

(declare-fun lt!131029 () ListLongMap!3767)

(assert (=> b!259875 (= lt!131029 (getCurrentListMapNoExtraKeys!573 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131040 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131042 () (_ BitVec 64))

(assert (=> b!259875 (= lt!131042 (select (arr!5954 lt!130845) #b00000000000000000000000000000000))))

(assert (=> b!259875 (= lt!131034 (addApplyDifferent!233 lt!131029 lt!131040 (minValue!4627 thiss!1504) lt!131042))))

(assert (=> b!259875 (= (apply!257 (+!696 lt!131029 (tuple2!4853 lt!131040 (minValue!4627 thiss!1504))) lt!131042) (apply!257 lt!131029 lt!131042))))

(declare-fun b!259876 () Bool)

(assert (=> b!259876 (= e!168425 (not call!24741))))

(declare-fun call!24744 () ListLongMap!3767)

(declare-fun bm!24739 () Bool)

(assert (=> bm!24739 (= call!24744 (getCurrentListMapNoExtraKeys!573 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun b!259877 () Bool)

(declare-fun lt!131039 () ListLongMap!3767)

(assert (=> b!259877 (= e!168419 (= (apply!257 lt!131039 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4627 thiss!1504)))))

(declare-fun b!259878 () Bool)

(assert (=> b!259878 (= e!168422 (+!696 call!24743 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504))))))

(declare-fun b!259879 () Bool)

(declare-fun e!168418 () Bool)

(declare-fun get!3074 (ValueCell!2963 V!8465) V!8465)

(declare-fun dynLambda!600 (Int (_ BitVec 64)) V!8465)

(assert (=> b!259879 (= e!168418 (= (apply!257 lt!131039 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)) (get!3074 (select (arr!5953 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!600 (defaultEntry!4786 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6302 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))))))))

(assert (=> b!259879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6303 lt!130845)))))

(declare-fun b!259880 () Bool)

(assert (=> b!259880 (= e!168421 call!24746)))

(declare-fun b!259881 () Bool)

(assert (=> b!259881 (= e!168429 e!168424)))

(declare-fun c!44136 () Bool)

(assert (=> b!259881 (= c!44136 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259882 () Bool)

(declare-fun e!168426 () Bool)

(assert (=> b!259882 (= e!168426 (validKeyInArray!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(declare-fun bm!24737 () Bool)

(assert (=> bm!24737 (= call!24741 (contains!1862 lt!131039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!62497 () Bool)

(assert (=> d!62497 e!168429))

(declare-fun res!127032 () Bool)

(assert (=> d!62497 (=> (not res!127032) (not e!168429))))

(assert (=> d!62497 (= res!127032 (or (bvsge #b00000000000000000000000000000000 (size!6303 lt!130845)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6303 lt!130845)))))))

(declare-fun lt!131028 () ListLongMap!3767)

(assert (=> d!62497 (= lt!131039 lt!131028)))

(declare-fun lt!131025 () Unit!8044)

(assert (=> d!62497 (= lt!131025 e!168427)))

(declare-fun c!44134 () Bool)

(assert (=> d!62497 (= c!44134 e!168426)))

(declare-fun res!127035 () Bool)

(assert (=> d!62497 (=> (not res!127035) (not e!168426))))

(assert (=> d!62497 (= res!127035 (bvslt #b00000000000000000000000000000000 (size!6303 lt!130845)))))

(assert (=> d!62497 (= lt!131028 e!168422)))

(declare-fun c!44132 () Bool)

(assert (=> d!62497 (= c!44132 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62497 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62497 (= (getCurrentListMap!1431 lt!130845 (array!12576 (store (arr!5953 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6302 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) lt!131039)))

(declare-fun bm!24740 () Bool)

(declare-fun call!24745 () ListLongMap!3767)

(assert (=> bm!24740 (= call!24745 call!24744)))

(declare-fun bm!24741 () Bool)

(declare-fun call!24742 () ListLongMap!3767)

(assert (=> bm!24741 (= call!24742 call!24745)))

(declare-fun b!259883 () Bool)

(assert (=> b!259883 (= e!168428 e!168418)))

(declare-fun res!127036 () Bool)

(assert (=> b!259883 (=> (not res!127036) (not e!168418))))

(assert (=> b!259883 (= res!127036 (contains!1862 lt!131039 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(assert (=> b!259883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6303 lt!130845)))))

(declare-fun b!259884 () Bool)

(assert (=> b!259884 (= e!168417 (= (apply!257 lt!131039 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4627 thiss!1504)))))

(declare-fun b!259885 () Bool)

(assert (=> b!259885 (= e!168423 call!24742)))

(declare-fun bm!24742 () Bool)

(assert (=> bm!24742 (= call!24740 (contains!1862 lt!131039 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24743 () Bool)

(assert (=> bm!24743 (= call!24743 (+!696 (ite c!44132 call!24744 (ite c!44131 call!24745 call!24742)) (ite (or c!44132 c!44131) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4627 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504)))))))

(assert (= (and d!62497 c!44132) b!259878))

(assert (= (and d!62497 (not c!44132)) b!259872))

(assert (= (and b!259872 c!44131) b!259880))

(assert (= (and b!259872 (not c!44131)) b!259871))

(assert (= (and b!259871 c!44135) b!259867))

(assert (= (and b!259871 (not c!44135)) b!259885))

(assert (= (or b!259867 b!259885) bm!24741))

(assert (= (or b!259880 bm!24741) bm!24740))

(assert (= (or b!259880 b!259867) bm!24738))

(assert (= (or b!259878 bm!24740) bm!24739))

(assert (= (or b!259878 bm!24738) bm!24743))

(assert (= (and d!62497 res!127035) b!259882))

(assert (= (and d!62497 c!44134) b!259875))

(assert (= (and d!62497 (not c!44134)) b!259870))

(assert (= (and d!62497 res!127032) b!259865))

(assert (= (and b!259865 res!127038) b!259866))

(assert (= (and b!259865 (not res!127034)) b!259883))

(assert (= (and b!259883 res!127036) b!259879))

(assert (= (and b!259865 res!127033) b!259868))

(assert (= (and b!259868 c!44133) b!259874))

(assert (= (and b!259868 (not c!44133)) b!259876))

(assert (= (and b!259874 res!127037) b!259877))

(assert (= (or b!259874 b!259876) bm!24737))

(assert (= (and b!259868 res!127039) b!259881))

(assert (= (and b!259881 c!44136) b!259873))

(assert (= (and b!259881 (not c!44136)) b!259869))

(assert (= (and b!259873 res!127031) b!259884))

(assert (= (or b!259873 b!259869) bm!24742))

(declare-fun b_lambda!8273 () Bool)

(assert (=> (not b_lambda!8273) (not b!259879)))

(declare-fun t!8792 () Bool)

(declare-fun tb!3019 () Bool)

(assert (=> (and b!259625 (= (defaultEntry!4786 thiss!1504) (defaultEntry!4786 thiss!1504)) t!8792) tb!3019))

(declare-fun result!5395 () Bool)

(assert (=> tb!3019 (= result!5395 tp_is_empty!6613)))

(assert (=> b!259879 t!8792))

(declare-fun b_and!13873 () Bool)

(assert (= b_and!13867 (and (=> t!8792 result!5395) b_and!13873)))

(declare-fun m!275701 () Bool)

(assert (=> bm!24737 m!275701))

(declare-fun m!275703 () Bool)

(assert (=> bm!24742 m!275703))

(assert (=> b!259883 m!275681))

(assert (=> b!259883 m!275681))

(declare-fun m!275705 () Bool)

(assert (=> b!259883 m!275705))

(declare-fun m!275707 () Bool)

(assert (=> b!259875 m!275707))

(declare-fun m!275709 () Bool)

(assert (=> b!259875 m!275709))

(declare-fun m!275711 () Bool)

(assert (=> b!259875 m!275711))

(declare-fun m!275713 () Bool)

(assert (=> b!259875 m!275713))

(assert (=> b!259875 m!275711))

(declare-fun m!275715 () Bool)

(assert (=> b!259875 m!275715))

(declare-fun m!275717 () Bool)

(assert (=> b!259875 m!275717))

(assert (=> b!259875 m!275715))

(declare-fun m!275719 () Bool)

(assert (=> b!259875 m!275719))

(declare-fun m!275721 () Bool)

(assert (=> b!259875 m!275721))

(declare-fun m!275723 () Bool)

(assert (=> b!259875 m!275723))

(assert (=> b!259875 m!275681))

(declare-fun m!275725 () Bool)

(assert (=> b!259875 m!275725))

(assert (=> b!259875 m!275707))

(declare-fun m!275727 () Bool)

(assert (=> b!259875 m!275727))

(assert (=> b!259875 m!275709))

(declare-fun m!275729 () Bool)

(assert (=> b!259875 m!275729))

(declare-fun m!275731 () Bool)

(assert (=> b!259875 m!275731))

(declare-fun m!275733 () Bool)

(assert (=> b!259875 m!275733))

(declare-fun m!275735 () Bool)

(assert (=> b!259875 m!275735))

(declare-fun m!275737 () Bool)

(assert (=> b!259875 m!275737))

(assert (=> b!259879 m!275681))

(assert (=> b!259879 m!275681))

(declare-fun m!275739 () Bool)

(assert (=> b!259879 m!275739))

(declare-fun m!275741 () Bool)

(assert (=> b!259879 m!275741))

(declare-fun m!275743 () Bool)

(assert (=> b!259879 m!275743))

(declare-fun m!275745 () Bool)

(assert (=> b!259879 m!275745))

(assert (=> b!259879 m!275741))

(assert (=> b!259879 m!275743))

(assert (=> b!259866 m!275681))

(assert (=> b!259866 m!275681))

(assert (=> b!259866 m!275683))

(declare-fun m!275747 () Bool)

(assert (=> b!259878 m!275747))

(assert (=> b!259882 m!275681))

(assert (=> b!259882 m!275681))

(assert (=> b!259882 m!275683))

(declare-fun m!275749 () Bool)

(assert (=> b!259877 m!275749))

(declare-fun m!275751 () Bool)

(assert (=> b!259884 m!275751))

(assert (=> d!62497 m!275445))

(declare-fun m!275753 () Bool)

(assert (=> bm!24743 m!275753))

(assert (=> bm!24739 m!275721))

(assert (=> b!259619 d!62497))

(declare-fun b!259896 () Bool)

(declare-fun e!168438 () Bool)

(declare-fun call!24749 () Bool)

(assert (=> b!259896 (= e!168438 call!24749)))

(declare-fun b!259897 () Bool)

(declare-fun e!168436 () Bool)

(assert (=> b!259897 (= e!168436 call!24749)))

(declare-fun d!62499 () Bool)

(declare-fun res!127045 () Bool)

(declare-fun e!168437 () Bool)

(assert (=> d!62499 (=> res!127045 e!168437)))

(assert (=> d!62499 (= res!127045 (bvsge #b00000000000000000000000000000000 (size!6303 lt!130845)))))

(assert (=> d!62499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130845 (mask!11105 thiss!1504)) e!168437)))

(declare-fun bm!24746 () Bool)

(assert (=> bm!24746 (= call!24749 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130845 (mask!11105 thiss!1504)))))

(declare-fun b!259898 () Bool)

(assert (=> b!259898 (= e!168437 e!168438)))

(declare-fun c!44139 () Bool)

(assert (=> b!259898 (= c!44139 (validKeyInArray!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000)))))

(declare-fun b!259899 () Bool)

(assert (=> b!259899 (= e!168438 e!168436)))

(declare-fun lt!131049 () (_ BitVec 64))

(assert (=> b!259899 (= lt!131049 (select (arr!5954 lt!130845) #b00000000000000000000000000000000))))

(declare-fun lt!131050 () Unit!8044)

(assert (=> b!259899 (= lt!131050 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130845 lt!131049 #b00000000000000000000000000000000))))

(assert (=> b!259899 (arrayContainsKey!0 lt!130845 lt!131049 #b00000000000000000000000000000000)))

(declare-fun lt!131051 () Unit!8044)

(assert (=> b!259899 (= lt!131051 lt!131050)))

(declare-fun res!127044 () Bool)

(assert (=> b!259899 (= res!127044 (= (seekEntryOrOpen!0 (select (arr!5954 lt!130845) #b00000000000000000000000000000000) lt!130845 (mask!11105 thiss!1504)) (Found!1146 #b00000000000000000000000000000000)))))

(assert (=> b!259899 (=> (not res!127044) (not e!168436))))

(assert (= (and d!62499 (not res!127045)) b!259898))

(assert (= (and b!259898 c!44139) b!259899))

(assert (= (and b!259898 (not c!44139)) b!259896))

(assert (= (and b!259899 res!127044) b!259897))

(assert (= (or b!259897 b!259896) bm!24746))

(declare-fun m!275755 () Bool)

(assert (=> bm!24746 m!275755))

(assert (=> b!259898 m!275681))

(assert (=> b!259898 m!275681))

(assert (=> b!259898 m!275683))

(assert (=> b!259899 m!275681))

(declare-fun m!275757 () Bool)

(assert (=> b!259899 m!275757))

(declare-fun m!275759 () Bool)

(assert (=> b!259899 m!275759))

(assert (=> b!259899 m!275681))

(declare-fun m!275761 () Bool)

(assert (=> b!259899 m!275761))

(assert (=> b!259619 d!62499))

(declare-fun d!62501 () Bool)

(assert (=> d!62501 (= (arrayCountValidKeys!0 lt!130845 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131054 () Unit!8044)

(declare-fun choose!2 (array!12577 (_ BitVec 32)) Unit!8044)

(assert (=> d!62501 (= lt!131054 (choose!2 lt!130845 index!297))))

(declare-fun e!168441 () Bool)

(assert (=> d!62501 e!168441))

(declare-fun res!127050 () Bool)

(assert (=> d!62501 (=> (not res!127050) (not e!168441))))

(assert (=> d!62501 (= res!127050 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6303 lt!130845))))))

(assert (=> d!62501 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130845 index!297) lt!131054)))

(declare-fun b!259904 () Bool)

(declare-fun res!127051 () Bool)

(assert (=> b!259904 (=> (not res!127051) (not e!168441))))

(assert (=> b!259904 (= res!127051 (validKeyInArray!0 (select (arr!5954 lt!130845) index!297)))))

(declare-fun b!259905 () Bool)

(assert (=> b!259905 (= e!168441 (bvslt (size!6303 lt!130845) #b01111111111111111111111111111111))))

(assert (= (and d!62501 res!127050) b!259904))

(assert (= (and b!259904 res!127051) b!259905))

(declare-fun m!275763 () Bool)

(assert (=> d!62501 m!275763))

(declare-fun m!275765 () Bool)

(assert (=> d!62501 m!275765))

(assert (=> b!259904 m!275663))

(assert (=> b!259904 m!275663))

(assert (=> b!259904 m!275665))

(assert (=> b!259619 d!62501))

(declare-fun d!62503 () Bool)

(declare-fun e!168444 () Bool)

(assert (=> d!62503 e!168444))

(declare-fun res!127057 () Bool)

(assert (=> d!62503 (=> (not res!127057) (not e!168444))))

(declare-fun lt!131059 () SeekEntryResult!1146)

(assert (=> d!62503 (= res!127057 ((_ is Found!1146) lt!131059))))

(assert (=> d!62503 (= lt!131059 (seekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(declare-fun lt!131060 () Unit!8044)

(declare-fun choose!1269 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8044)

(assert (=> d!62503 (= lt!131060 (choose!1269 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62503 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62503 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!436 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)) lt!131060)))

(declare-fun b!259910 () Bool)

(declare-fun res!127056 () Bool)

(assert (=> b!259910 (=> (not res!127056) (not e!168444))))

(assert (=> b!259910 (= res!127056 (inRange!0 (index!6755 lt!131059) (mask!11105 thiss!1504)))))

(declare-fun b!259911 () Bool)

(assert (=> b!259911 (= e!168444 (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6755 lt!131059)) key!932))))

(assert (=> b!259911 (and (bvsge (index!6755 lt!131059) #b00000000000000000000000000000000) (bvslt (index!6755 lt!131059) (size!6303 (_keys!6964 thiss!1504))))))

(assert (= (and d!62503 res!127057) b!259910))

(assert (= (and b!259910 res!127056) b!259911))

(assert (=> d!62503 m!275491))

(declare-fun m!275767 () Bool)

(assert (=> d!62503 m!275767))

(assert (=> d!62503 m!275445))

(declare-fun m!275769 () Bool)

(assert (=> b!259910 m!275769))

(declare-fun m!275771 () Bool)

(assert (=> b!259911 m!275771))

(assert (=> b!259622 d!62503))

(declare-fun b!259928 () Bool)

(declare-fun e!168456 () Bool)

(declare-fun e!168453 () Bool)

(assert (=> b!259928 (= e!168456 e!168453)))

(declare-fun res!127068 () Bool)

(declare-fun call!24755 () Bool)

(assert (=> b!259928 (= res!127068 call!24755)))

(assert (=> b!259928 (=> (not res!127068) (not e!168453))))

(declare-fun b!259929 () Bool)

(declare-fun e!168455 () Bool)

(declare-fun call!24754 () Bool)

(assert (=> b!259929 (= e!168455 (not call!24754))))

(declare-fun lt!131066 () SeekEntryResult!1146)

(declare-fun bm!24751 () Bool)

(declare-fun c!44144 () Bool)

(assert (=> bm!24751 (= call!24755 (inRange!0 (ite c!44144 (index!6754 lt!131066) (index!6757 lt!131066)) (mask!11105 thiss!1504)))))

(declare-fun bm!24752 () Bool)

(assert (=> bm!24752 (= call!24754 (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259930 () Bool)

(declare-fun e!168454 () Bool)

(assert (=> b!259930 (= e!168456 e!168454)))

(declare-fun c!44145 () Bool)

(assert (=> b!259930 (= c!44145 ((_ is MissingVacant!1146) lt!131066))))

(declare-fun b!259931 () Bool)

(assert (=> b!259931 (= e!168454 ((_ is Undefined!1146) lt!131066))))

(declare-fun b!259933 () Bool)

(assert (=> b!259933 (= e!168453 (not call!24754))))

(declare-fun b!259934 () Bool)

(declare-fun res!127069 () Bool)

(assert (=> b!259934 (=> (not res!127069) (not e!168455))))

(assert (=> b!259934 (= res!127069 (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6757 lt!131066)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259934 (and (bvsge (index!6757 lt!131066) #b00000000000000000000000000000000) (bvslt (index!6757 lt!131066) (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259935 () Bool)

(declare-fun res!127066 () Bool)

(assert (=> b!259935 (=> (not res!127066) (not e!168455))))

(assert (=> b!259935 (= res!127066 call!24755)))

(assert (=> b!259935 (= e!168454 e!168455)))

(declare-fun b!259932 () Bool)

(assert (=> b!259932 (and (bvsge (index!6754 lt!131066) #b00000000000000000000000000000000) (bvslt (index!6754 lt!131066) (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun res!127067 () Bool)

(assert (=> b!259932 (= res!127067 (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6754 lt!131066)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259932 (=> (not res!127067) (not e!168453))))

(declare-fun d!62505 () Bool)

(assert (=> d!62505 e!168456))

(assert (=> d!62505 (= c!44144 ((_ is MissingZero!1146) lt!131066))))

(assert (=> d!62505 (= lt!131066 (seekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(declare-fun lt!131065 () Unit!8044)

(declare-fun choose!1270 (array!12577 array!12575 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8044)

(assert (=> d!62505 (= lt!131065 (choose!1270 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62505 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62505 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!428 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)) lt!131065)))

(assert (= (and d!62505 c!44144) b!259928))

(assert (= (and d!62505 (not c!44144)) b!259930))

(assert (= (and b!259928 res!127068) b!259932))

(assert (= (and b!259932 res!127067) b!259933))

(assert (= (and b!259930 c!44145) b!259935))

(assert (= (and b!259930 (not c!44145)) b!259931))

(assert (= (and b!259935 res!127066) b!259934))

(assert (= (and b!259934 res!127069) b!259929))

(assert (= (or b!259928 b!259935) bm!24751))

(assert (= (or b!259933 b!259929) bm!24752))

(declare-fun m!275773 () Bool)

(assert (=> bm!24751 m!275773))

(declare-fun m!275775 () Bool)

(assert (=> b!259932 m!275775))

(assert (=> bm!24752 m!275443))

(declare-fun m!275777 () Bool)

(assert (=> b!259934 m!275777))

(assert (=> d!62505 m!275491))

(declare-fun m!275779 () Bool)

(assert (=> d!62505 m!275779))

(assert (=> d!62505 m!275445))

(assert (=> b!259610 d!62505))

(declare-fun d!62507 () Bool)

(assert (=> d!62507 (= (inRange!0 index!297 (mask!11105 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11105 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!259611 d!62507))

(declare-fun d!62509 () Bool)

(declare-fun e!168461 () Bool)

(assert (=> d!62509 e!168461))

(declare-fun res!127072 () Bool)

(assert (=> d!62509 (=> res!127072 e!168461)))

(declare-fun lt!131075 () Bool)

(assert (=> d!62509 (= res!127072 (not lt!131075))))

(declare-fun lt!131076 () Bool)

(assert (=> d!62509 (= lt!131075 lt!131076)))

(declare-fun lt!131078 () Unit!8044)

(declare-fun e!168462 () Unit!8044)

(assert (=> d!62509 (= lt!131078 e!168462)))

(declare-fun c!44148 () Bool)

(assert (=> d!62509 (= c!44148 lt!131076)))

(declare-fun containsKey!307 (List!3730 (_ BitVec 64)) Bool)

(assert (=> d!62509 (= lt!131076 (containsKey!307 (toList!1899 lt!130848) key!932))))

(assert (=> d!62509 (= (contains!1862 lt!130848 key!932) lt!131075)))

(declare-fun b!259942 () Bool)

(declare-fun lt!131077 () Unit!8044)

(assert (=> b!259942 (= e!168462 lt!131077)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!255 (List!3730 (_ BitVec 64)) Unit!8044)

(assert (=> b!259942 (= lt!131077 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1899 lt!130848) key!932))))

(declare-fun isDefined!256 (Option!322) Bool)

(assert (=> b!259942 (isDefined!256 (getValueByKey!316 (toList!1899 lt!130848) key!932))))

(declare-fun b!259943 () Bool)

(declare-fun Unit!8054 () Unit!8044)

(assert (=> b!259943 (= e!168462 Unit!8054)))

(declare-fun b!259944 () Bool)

(assert (=> b!259944 (= e!168461 (isDefined!256 (getValueByKey!316 (toList!1899 lt!130848) key!932)))))

(assert (= (and d!62509 c!44148) b!259942))

(assert (= (and d!62509 (not c!44148)) b!259943))

(assert (= (and d!62509 (not res!127072)) b!259944))

(declare-fun m!275781 () Bool)

(assert (=> d!62509 m!275781))

(declare-fun m!275783 () Bool)

(assert (=> b!259942 m!275783))

(declare-fun m!275785 () Bool)

(assert (=> b!259942 m!275785))

(assert (=> b!259942 m!275785))

(declare-fun m!275787 () Bool)

(assert (=> b!259942 m!275787))

(assert (=> b!259944 m!275785))

(assert (=> b!259944 m!275785))

(assert (=> b!259944 m!275787))

(assert (=> b!259611 d!62509))

(declare-fun b!259945 () Bool)

(declare-fun res!127075 () Bool)

(declare-fun e!168475 () Bool)

(assert (=> b!259945 (=> (not res!127075) (not e!168475))))

(declare-fun e!168474 () Bool)

(assert (=> b!259945 (= res!127075 e!168474)))

(declare-fun res!127076 () Bool)

(assert (=> b!259945 (=> res!127076 e!168474)))

(declare-fun e!168466 () Bool)

(assert (=> b!259945 (= res!127076 (not e!168466))))

(declare-fun res!127080 () Bool)

(assert (=> b!259945 (=> (not res!127080) (not e!168466))))

(assert (=> b!259945 (= res!127080 (bvslt #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259946 () Bool)

(assert (=> b!259946 (= e!168466 (validKeyInArray!0 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259947 () Bool)

(declare-fun e!168469 () ListLongMap!3767)

(declare-fun call!24762 () ListLongMap!3767)

(assert (=> b!259947 (= e!168469 call!24762)))

(declare-fun b!259948 () Bool)

(declare-fun res!127081 () Bool)

(assert (=> b!259948 (=> (not res!127081) (not e!168475))))

(declare-fun e!168471 () Bool)

(assert (=> b!259948 (= res!127081 e!168471)))

(declare-fun c!44151 () Bool)

(assert (=> b!259948 (= c!44151 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259949 () Bool)

(declare-fun e!168470 () Bool)

(declare-fun call!24756 () Bool)

(assert (=> b!259949 (= e!168470 (not call!24756))))

(declare-fun b!259950 () Bool)

(declare-fun e!168473 () Unit!8044)

(declare-fun Unit!8055 () Unit!8044)

(assert (=> b!259950 (= e!168473 Unit!8055)))

(declare-fun b!259951 () Bool)

(declare-fun c!44153 () Bool)

(assert (=> b!259951 (= c!44153 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!168467 () ListLongMap!3767)

(assert (=> b!259951 (= e!168467 e!168469)))

(declare-fun b!259952 () Bool)

(declare-fun e!168468 () ListLongMap!3767)

(assert (=> b!259952 (= e!168468 e!168467)))

(declare-fun c!44149 () Bool)

(assert (=> b!259952 (= c!44149 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259953 () Bool)

(declare-fun e!168463 () Bool)

(assert (=> b!259953 (= e!168470 e!168463)))

(declare-fun res!127073 () Bool)

(assert (=> b!259953 (= res!127073 call!24756)))

(assert (=> b!259953 (=> (not res!127073) (not e!168463))))

(declare-fun bm!24754 () Bool)

(declare-fun call!24759 () ListLongMap!3767)

(assert (=> bm!24754 (= call!24762 call!24759)))

(declare-fun b!259954 () Bool)

(declare-fun e!168465 () Bool)

(assert (=> b!259954 (= e!168471 e!168465)))

(declare-fun res!127079 () Bool)

(declare-fun call!24757 () Bool)

(assert (=> b!259954 (= res!127079 call!24757)))

(assert (=> b!259954 (=> (not res!127079) (not e!168465))))

(declare-fun b!259955 () Bool)

(declare-fun lt!131092 () Unit!8044)

(assert (=> b!259955 (= e!168473 lt!131092)))

(declare-fun lt!131091 () ListLongMap!3767)

(assert (=> b!259955 (= lt!131091 (getCurrentListMapNoExtraKeys!573 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131082 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131081 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131081 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131094 () Unit!8044)

(assert (=> b!259955 (= lt!131094 (addStillContains!233 lt!131091 lt!131082 (zeroValue!4627 thiss!1504) lt!131081))))

(assert (=> b!259955 (contains!1862 (+!696 lt!131091 (tuple2!4853 lt!131082 (zeroValue!4627 thiss!1504))) lt!131081)))

(declare-fun lt!131096 () Unit!8044)

(assert (=> b!259955 (= lt!131096 lt!131094)))

(declare-fun lt!131089 () ListLongMap!3767)

(assert (=> b!259955 (= lt!131089 (getCurrentListMapNoExtraKeys!573 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131095 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131095 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131088 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131088 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131085 () Unit!8044)

(assert (=> b!259955 (= lt!131085 (addApplyDifferent!233 lt!131089 lt!131095 (minValue!4627 thiss!1504) lt!131088))))

(assert (=> b!259955 (= (apply!257 (+!696 lt!131089 (tuple2!4853 lt!131095 (minValue!4627 thiss!1504))) lt!131088) (apply!257 lt!131089 lt!131088))))

(declare-fun lt!131093 () Unit!8044)

(assert (=> b!259955 (= lt!131093 lt!131085)))

(declare-fun lt!131099 () ListLongMap!3767)

(assert (=> b!259955 (= lt!131099 (getCurrentListMapNoExtraKeys!573 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131080 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131084 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131084 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131079 () Unit!8044)

(assert (=> b!259955 (= lt!131079 (addApplyDifferent!233 lt!131099 lt!131080 (zeroValue!4627 thiss!1504) lt!131084))))

(assert (=> b!259955 (= (apply!257 (+!696 lt!131099 (tuple2!4853 lt!131080 (zeroValue!4627 thiss!1504))) lt!131084) (apply!257 lt!131099 lt!131084))))

(declare-fun lt!131090 () Unit!8044)

(assert (=> b!259955 (= lt!131090 lt!131079)))

(declare-fun lt!131087 () ListLongMap!3767)

(assert (=> b!259955 (= lt!131087 (getCurrentListMapNoExtraKeys!573 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!131098 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131098 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131100 () (_ BitVec 64))

(assert (=> b!259955 (= lt!131100 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259955 (= lt!131092 (addApplyDifferent!233 lt!131087 lt!131098 (minValue!4627 thiss!1504) lt!131100))))

(assert (=> b!259955 (= (apply!257 (+!696 lt!131087 (tuple2!4853 lt!131098 (minValue!4627 thiss!1504))) lt!131100) (apply!257 lt!131087 lt!131100))))

(declare-fun b!259956 () Bool)

(assert (=> b!259956 (= e!168471 (not call!24757))))

(declare-fun bm!24755 () Bool)

(declare-fun call!24760 () ListLongMap!3767)

(assert (=> bm!24755 (= call!24760 (getCurrentListMapNoExtraKeys!573 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun b!259957 () Bool)

(declare-fun lt!131097 () ListLongMap!3767)

(assert (=> b!259957 (= e!168465 (= (apply!257 lt!131097 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4627 thiss!1504)))))

(declare-fun b!259958 () Bool)

(assert (=> b!259958 (= e!168468 (+!696 call!24759 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504))))))

(declare-fun b!259959 () Bool)

(declare-fun e!168464 () Bool)

(assert (=> b!259959 (= e!168464 (= (apply!257 lt!131097 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000)) (get!3074 (select (arr!5953 (_values!4769 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!600 (defaultEntry!4786 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6302 (_values!4769 thiss!1504))))))

(assert (=> b!259959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259960 () Bool)

(assert (=> b!259960 (= e!168467 call!24762)))

(declare-fun b!259961 () Bool)

(assert (=> b!259961 (= e!168475 e!168470)))

(declare-fun c!44154 () Bool)

(assert (=> b!259961 (= c!44154 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259962 () Bool)

(declare-fun e!168472 () Bool)

(assert (=> b!259962 (= e!168472 (validKeyInArray!0 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24753 () Bool)

(assert (=> bm!24753 (= call!24757 (contains!1862 lt!131097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!62511 () Bool)

(assert (=> d!62511 e!168475))

(declare-fun res!127074 () Bool)

(assert (=> d!62511 (=> (not res!127074) (not e!168475))))

(assert (=> d!62511 (= res!127074 (or (bvsge #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))))

(declare-fun lt!131086 () ListLongMap!3767)

(assert (=> d!62511 (= lt!131097 lt!131086)))

(declare-fun lt!131083 () Unit!8044)

(assert (=> d!62511 (= lt!131083 e!168473)))

(declare-fun c!44152 () Bool)

(assert (=> d!62511 (= c!44152 e!168472)))

(declare-fun res!127077 () Bool)

(assert (=> d!62511 (=> (not res!127077) (not e!168472))))

(assert (=> d!62511 (= res!127077 (bvslt #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))

(assert (=> d!62511 (= lt!131086 e!168468)))

(declare-fun c!44150 () Bool)

(assert (=> d!62511 (= c!44150 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62511 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62511 (= (getCurrentListMap!1431 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) lt!131097)))

(declare-fun bm!24756 () Bool)

(declare-fun call!24761 () ListLongMap!3767)

(assert (=> bm!24756 (= call!24761 call!24760)))

(declare-fun bm!24757 () Bool)

(declare-fun call!24758 () ListLongMap!3767)

(assert (=> bm!24757 (= call!24758 call!24761)))

(declare-fun b!259963 () Bool)

(assert (=> b!259963 (= e!168474 e!168464)))

(declare-fun res!127078 () Bool)

(assert (=> b!259963 (=> (not res!127078) (not e!168464))))

(assert (=> b!259963 (= res!127078 (contains!1862 lt!131097 (select (arr!5954 (_keys!6964 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))))))

(declare-fun b!259964 () Bool)

(assert (=> b!259964 (= e!168463 (= (apply!257 lt!131097 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4627 thiss!1504)))))

(declare-fun b!259965 () Bool)

(assert (=> b!259965 (= e!168469 call!24758)))

(declare-fun bm!24758 () Bool)

(assert (=> bm!24758 (= call!24756 (contains!1862 lt!131097 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24759 () Bool)

(assert (=> bm!24759 (= call!24759 (+!696 (ite c!44150 call!24760 (ite c!44149 call!24761 call!24758)) (ite (or c!44150 c!44149) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4627 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504)))))))

(assert (= (and d!62511 c!44150) b!259958))

(assert (= (and d!62511 (not c!44150)) b!259952))

(assert (= (and b!259952 c!44149) b!259960))

(assert (= (and b!259952 (not c!44149)) b!259951))

(assert (= (and b!259951 c!44153) b!259947))

(assert (= (and b!259951 (not c!44153)) b!259965))

(assert (= (or b!259947 b!259965) bm!24757))

(assert (= (or b!259960 bm!24757) bm!24756))

(assert (= (or b!259960 b!259947) bm!24754))

(assert (= (or b!259958 bm!24756) bm!24755))

(assert (= (or b!259958 bm!24754) bm!24759))

(assert (= (and d!62511 res!127077) b!259962))

(assert (= (and d!62511 c!44152) b!259955))

(assert (= (and d!62511 (not c!44152)) b!259950))

(assert (= (and d!62511 res!127074) b!259945))

(assert (= (and b!259945 res!127080) b!259946))

(assert (= (and b!259945 (not res!127076)) b!259963))

(assert (= (and b!259963 res!127078) b!259959))

(assert (= (and b!259945 res!127075) b!259948))

(assert (= (and b!259948 c!44151) b!259954))

(assert (= (and b!259948 (not c!44151)) b!259956))

(assert (= (and b!259954 res!127079) b!259957))

(assert (= (or b!259954 b!259956) bm!24753))

(assert (= (and b!259948 res!127081) b!259961))

(assert (= (and b!259961 c!44154) b!259953))

(assert (= (and b!259961 (not c!44154)) b!259949))

(assert (= (and b!259953 res!127073) b!259964))

(assert (= (or b!259953 b!259949) bm!24758))

(declare-fun b_lambda!8275 () Bool)

(assert (=> (not b_lambda!8275) (not b!259959)))

(assert (=> b!259959 t!8792))

(declare-fun b_and!13875 () Bool)

(assert (= b_and!13873 (and (=> t!8792 result!5395) b_and!13875)))

(declare-fun m!275789 () Bool)

(assert (=> bm!24753 m!275789))

(declare-fun m!275791 () Bool)

(assert (=> bm!24758 m!275791))

(assert (=> b!259963 m!275633))

(assert (=> b!259963 m!275633))

(declare-fun m!275793 () Bool)

(assert (=> b!259963 m!275793))

(declare-fun m!275795 () Bool)

(assert (=> b!259955 m!275795))

(declare-fun m!275797 () Bool)

(assert (=> b!259955 m!275797))

(declare-fun m!275799 () Bool)

(assert (=> b!259955 m!275799))

(declare-fun m!275801 () Bool)

(assert (=> b!259955 m!275801))

(assert (=> b!259955 m!275799))

(declare-fun m!275803 () Bool)

(assert (=> b!259955 m!275803))

(declare-fun m!275805 () Bool)

(assert (=> b!259955 m!275805))

(assert (=> b!259955 m!275803))

(declare-fun m!275807 () Bool)

(assert (=> b!259955 m!275807))

(declare-fun m!275809 () Bool)

(assert (=> b!259955 m!275809))

(declare-fun m!275811 () Bool)

(assert (=> b!259955 m!275811))

(assert (=> b!259955 m!275633))

(declare-fun m!275813 () Bool)

(assert (=> b!259955 m!275813))

(assert (=> b!259955 m!275795))

(declare-fun m!275815 () Bool)

(assert (=> b!259955 m!275815))

(assert (=> b!259955 m!275797))

(declare-fun m!275817 () Bool)

(assert (=> b!259955 m!275817))

(declare-fun m!275819 () Bool)

(assert (=> b!259955 m!275819))

(declare-fun m!275821 () Bool)

(assert (=> b!259955 m!275821))

(declare-fun m!275823 () Bool)

(assert (=> b!259955 m!275823))

(declare-fun m!275825 () Bool)

(assert (=> b!259955 m!275825))

(assert (=> b!259959 m!275633))

(assert (=> b!259959 m!275633))

(declare-fun m!275827 () Bool)

(assert (=> b!259959 m!275827))

(declare-fun m!275829 () Bool)

(assert (=> b!259959 m!275829))

(assert (=> b!259959 m!275743))

(declare-fun m!275831 () Bool)

(assert (=> b!259959 m!275831))

(assert (=> b!259959 m!275829))

(assert (=> b!259959 m!275743))

(assert (=> b!259946 m!275633))

(assert (=> b!259946 m!275633))

(assert (=> b!259946 m!275653))

(declare-fun m!275833 () Bool)

(assert (=> b!259958 m!275833))

(assert (=> b!259962 m!275633))

(assert (=> b!259962 m!275633))

(assert (=> b!259962 m!275653))

(declare-fun m!275835 () Bool)

(assert (=> b!259957 m!275835))

(declare-fun m!275837 () Bool)

(assert (=> b!259964 m!275837))

(assert (=> d!62511 m!275445))

(declare-fun m!275839 () Bool)

(assert (=> bm!24759 m!275839))

(assert (=> bm!24755 m!275809))

(assert (=> b!259611 d!62511))

(declare-fun d!62513 () Bool)

(declare-fun res!127088 () Bool)

(declare-fun e!168478 () Bool)

(assert (=> d!62513 (=> (not res!127088) (not e!168478))))

(declare-fun simpleValid!280 (LongMapFixedSize!3826) Bool)

(assert (=> d!62513 (= res!127088 (simpleValid!280 thiss!1504))))

(assert (=> d!62513 (= (valid!1501 thiss!1504) e!168478)))

(declare-fun b!259972 () Bool)

(declare-fun res!127089 () Bool)

(assert (=> b!259972 (=> (not res!127089) (not e!168478))))

(assert (=> b!259972 (= res!127089 (= (arrayCountValidKeys!0 (_keys!6964 thiss!1504) #b00000000000000000000000000000000 (size!6303 (_keys!6964 thiss!1504))) (_size!1962 thiss!1504)))))

(declare-fun b!259973 () Bool)

(declare-fun res!127090 () Bool)

(assert (=> b!259973 (=> (not res!127090) (not e!168478))))

(assert (=> b!259973 (= res!127090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(declare-fun b!259974 () Bool)

(assert (=> b!259974 (= e!168478 (arrayNoDuplicates!0 (_keys!6964 thiss!1504) #b00000000000000000000000000000000 Nil!3728))))

(assert (= (and d!62513 res!127088) b!259972))

(assert (= (and b!259972 res!127089) b!259973))

(assert (= (and b!259973 res!127090) b!259974))

(declare-fun m!275841 () Bool)

(assert (=> d!62513 m!275841))

(assert (=> b!259972 m!275467))

(declare-fun m!275843 () Bool)

(assert (=> b!259973 m!275843))

(declare-fun m!275845 () Bool)

(assert (=> b!259974 m!275845))

(assert (=> start!24868 d!62513))

(declare-fun b!259987 () Bool)

(declare-fun e!168486 () SeekEntryResult!1146)

(declare-fun e!168487 () SeekEntryResult!1146)

(assert (=> b!259987 (= e!168486 e!168487)))

(declare-fun lt!131107 () (_ BitVec 64))

(declare-fun lt!131109 () SeekEntryResult!1146)

(assert (=> b!259987 (= lt!131107 (select (arr!5954 (_keys!6964 thiss!1504)) (index!6756 lt!131109)))))

(declare-fun c!44161 () Bool)

(assert (=> b!259987 (= c!44161 (= lt!131107 key!932))))

(declare-fun b!259988 () Bool)

(assert (=> b!259988 (= e!168486 Undefined!1146)))

(declare-fun b!259989 () Bool)

(declare-fun e!168485 () SeekEntryResult!1146)

(assert (=> b!259989 (= e!168485 (MissingZero!1146 (index!6756 lt!131109)))))

(declare-fun d!62515 () Bool)

(declare-fun lt!131108 () SeekEntryResult!1146)

(assert (=> d!62515 (and (or ((_ is Undefined!1146) lt!131108) (not ((_ is Found!1146) lt!131108)) (and (bvsge (index!6755 lt!131108) #b00000000000000000000000000000000) (bvslt (index!6755 lt!131108) (size!6303 (_keys!6964 thiss!1504))))) (or ((_ is Undefined!1146) lt!131108) ((_ is Found!1146) lt!131108) (not ((_ is MissingZero!1146) lt!131108)) (and (bvsge (index!6754 lt!131108) #b00000000000000000000000000000000) (bvslt (index!6754 lt!131108) (size!6303 (_keys!6964 thiss!1504))))) (or ((_ is Undefined!1146) lt!131108) ((_ is Found!1146) lt!131108) ((_ is MissingZero!1146) lt!131108) (not ((_ is MissingVacant!1146) lt!131108)) (and (bvsge (index!6757 lt!131108) #b00000000000000000000000000000000) (bvslt (index!6757 lt!131108) (size!6303 (_keys!6964 thiss!1504))))) (or ((_ is Undefined!1146) lt!131108) (ite ((_ is Found!1146) lt!131108) (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6755 lt!131108)) key!932) (ite ((_ is MissingZero!1146) lt!131108) (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6754 lt!131108)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1146) lt!131108) (= (select (arr!5954 (_keys!6964 thiss!1504)) (index!6757 lt!131108)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62515 (= lt!131108 e!168486)))

(declare-fun c!44162 () Bool)

(assert (=> d!62515 (= c!44162 (and ((_ is Intermediate!1146) lt!131109) (undefined!1958 lt!131109)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12577 (_ BitVec 32)) SeekEntryResult!1146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62515 (= lt!131109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11105 thiss!1504)) key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(assert (=> d!62515 (validMask!0 (mask!11105 thiss!1504))))

(assert (=> d!62515 (= (seekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)) lt!131108)))

(declare-fun b!259990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12577 (_ BitVec 32)) SeekEntryResult!1146)

(assert (=> b!259990 (= e!168485 (seekKeyOrZeroReturnVacant!0 (x!25066 lt!131109) (index!6756 lt!131109) (index!6756 lt!131109) key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(declare-fun b!259991 () Bool)

(declare-fun c!44163 () Bool)

(assert (=> b!259991 (= c!44163 (= lt!131107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259991 (= e!168487 e!168485)))

(declare-fun b!259992 () Bool)

(assert (=> b!259992 (= e!168487 (Found!1146 (index!6756 lt!131109)))))

(assert (= (and d!62515 c!44162) b!259988))

(assert (= (and d!62515 (not c!44162)) b!259987))

(assert (= (and b!259987 c!44161) b!259992))

(assert (= (and b!259987 (not c!44161)) b!259991))

(assert (= (and b!259991 c!44163) b!259989))

(assert (= (and b!259991 (not c!44163)) b!259990))

(declare-fun m!275847 () Bool)

(assert (=> b!259987 m!275847))

(declare-fun m!275849 () Bool)

(assert (=> d!62515 m!275849))

(declare-fun m!275851 () Bool)

(assert (=> d!62515 m!275851))

(assert (=> d!62515 m!275851))

(declare-fun m!275853 () Bool)

(assert (=> d!62515 m!275853))

(declare-fun m!275855 () Bool)

(assert (=> d!62515 m!275855))

(assert (=> d!62515 m!275445))

(declare-fun m!275857 () Bool)

(assert (=> d!62515 m!275857))

(declare-fun m!275859 () Bool)

(assert (=> b!259990 m!275859))

(assert (=> b!259621 d!62515))

(declare-fun d!62517 () Bool)

(assert (=> d!62517 (= (inRange!0 (ite c!44081 (index!6754 lt!130855) (index!6757 lt!130855)) (mask!11105 thiss!1504)) (and (bvsge (ite c!44081 (index!6754 lt!130855) (index!6757 lt!130855)) #b00000000000000000000000000000000) (bvslt (ite c!44081 (index!6754 lt!130855) (index!6757 lt!130855)) (bvadd (mask!11105 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24701 d!62517))

(declare-fun b!260000 () Bool)

(declare-fun e!168493 () Bool)

(assert (=> b!260000 (= e!168493 tp_is_empty!6613)))

(declare-fun mapNonEmpty!11276 () Bool)

(declare-fun mapRes!11276 () Bool)

(declare-fun tp!23588 () Bool)

(declare-fun e!168492 () Bool)

(assert (=> mapNonEmpty!11276 (= mapRes!11276 (and tp!23588 e!168492))))

(declare-fun mapRest!11276 () (Array (_ BitVec 32) ValueCell!2963))

(declare-fun mapKey!11276 () (_ BitVec 32))

(declare-fun mapValue!11276 () ValueCell!2963)

(assert (=> mapNonEmpty!11276 (= mapRest!11267 (store mapRest!11276 mapKey!11276 mapValue!11276))))

(declare-fun condMapEmpty!11276 () Bool)

(declare-fun mapDefault!11276 () ValueCell!2963)

(assert (=> mapNonEmpty!11267 (= condMapEmpty!11276 (= mapRest!11267 ((as const (Array (_ BitVec 32) ValueCell!2963)) mapDefault!11276)))))

(assert (=> mapNonEmpty!11267 (= tp!23572 (and e!168493 mapRes!11276))))

(declare-fun b!259999 () Bool)

(assert (=> b!259999 (= e!168492 tp_is_empty!6613)))

(declare-fun mapIsEmpty!11276 () Bool)

(assert (=> mapIsEmpty!11276 mapRes!11276))

(assert (= (and mapNonEmpty!11267 condMapEmpty!11276) mapIsEmpty!11276))

(assert (= (and mapNonEmpty!11267 (not condMapEmpty!11276)) mapNonEmpty!11276))

(assert (= (and mapNonEmpty!11276 ((_ is ValueCellFull!2963) mapValue!11276)) b!259999))

(assert (= (and mapNonEmpty!11267 ((_ is ValueCellFull!2963) mapDefault!11276)) b!260000))

(declare-fun m!275861 () Bool)

(assert (=> mapNonEmpty!11276 m!275861))

(declare-fun b_lambda!8277 () Bool)

(assert (= b_lambda!8273 (or (and b!259625 b_free!6751) b_lambda!8277)))

(declare-fun b_lambda!8279 () Bool)

(assert (= b_lambda!8275 (or (and b!259625 b_free!6751) b_lambda!8279)))

(check-sat (not b!259963) (not b!259972) (not b!259899) (not b!259957) (not b!259973) (not b!259910) (not d!62493) tp_is_empty!6613 b_and!13875 (not b!259879) (not b!259964) (not b_lambda!8277) (not b!259811) (not d!62471) (not bm!24718) (not b!259878) (not b!259884) (not b!259866) (not b!259962) (not d!62485) (not b!259898) (not b!259959) (not b!259944) (not d!62491) (not b!259816) (not b!259819) (not bm!24739) (not d!62505) (not b!259785) (not b!259822) (not b!259758) (not b!259779) (not d!62473) (not d!62501) (not bm!24719) (not b!259990) (not d!62513) (not d!62497) (not b!259795) (not bm!24737) (not b!259942) (not b!259955) (not bm!24752) (not b!259768) (not b!259883) (not b!259767) (not b!259877) (not b!259794) (not d!62515) (not b_next!6751) (not mapNonEmpty!11276) (not d!62503) (not bm!24755) (not d!62481) (not bm!24751) (not b!259946) (not b!259786) (not bm!24753) (not bm!24717) (not b!259814) (not d!62511) (not d!62477) (not b!259770) (not b!259974) (not b!259958) (not bm!24743) (not b!259904) (not bm!24758) (not bm!24746) (not b!259875) (not d!62509) (not bm!24759) (not b!259810) (not bm!24742) (not b!259882) (not b_lambda!8279) (not b!259796) (not bm!24722))
(check-sat b_and!13875 (not b_next!6751))
