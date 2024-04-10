; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89808 () Bool)

(assert start!89808)

(declare-fun b!1029162 () Bool)

(declare-fun b_free!20595 () Bool)

(declare-fun b_next!20595 () Bool)

(assert (=> b!1029162 (= b_free!20595 (not b_next!20595))))

(declare-fun tp!72845 () Bool)

(declare-fun b_and!32915 () Bool)

(assert (=> b!1029162 (= tp!72845 b_and!32915)))

(declare-fun b!1029156 () Bool)

(declare-fun e!581030 () Bool)

(declare-fun e!581024 () Bool)

(declare-fun mapRes!37915 () Bool)

(assert (=> b!1029156 (= e!581030 (and e!581024 mapRes!37915))))

(declare-fun condMapEmpty!37915 () Bool)

(declare-datatypes ((V!37293 0))(
  ( (V!37294 (val!12208 Int)) )
))
(declare-datatypes ((ValueCell!11454 0))(
  ( (ValueCellFull!11454 (v!14781 V!37293)) (EmptyCell!11454) )
))
(declare-datatypes ((array!64688 0))(
  ( (array!64689 (arr!31149 (Array (_ BitVec 32) (_ BitVec 64))) (size!31664 (_ BitVec 32))) )
))
(declare-datatypes ((array!64690 0))(
  ( (array!64691 (arr!31150 (Array (_ BitVec 32) ValueCell!11454)) (size!31665 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5502 0))(
  ( (LongMapFixedSize!5503 (defaultEntry!6115 Int) (mask!29867 (_ BitVec 32)) (extraKeys!5847 (_ BitVec 32)) (zeroValue!5951 V!37293) (minValue!5951 V!37293) (_size!2806 (_ BitVec 32)) (_keys!11276 array!64688) (_values!6138 array!64690) (_vacant!2806 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5502)

(declare-fun mapDefault!37915 () ValueCell!11454)

(assert (=> b!1029156 (= condMapEmpty!37915 (= (arr!31150 (_values!6138 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11454)) mapDefault!37915)))))

(declare-fun b!1029157 () Bool)

(declare-fun e!581031 () Bool)

(declare-datatypes ((Unit!33605 0))(
  ( (Unit!33606) )
))
(declare-datatypes ((tuple2!15558 0))(
  ( (tuple2!15559 (_1!7790 Unit!33605) (_2!7790 LongMapFixedSize!5502)) )
))
(declare-fun lt!453584 () tuple2!15558)

(assert (=> b!1029157 (= e!581031 (or (not (= (size!31665 (_values!6138 (_2!7790 lt!453584))) (bvadd #b00000000000000000000000000000001 (mask!29867 (_2!7790 lt!453584))))) (not (= (size!31664 (_keys!11276 (_2!7790 lt!453584))) (size!31665 (_values!6138 (_2!7790 lt!453584))))) (bvslt (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000000000000) (bvsge (extraKeys!5847 (_2!7790 lt!453584)) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37915 () Bool)

(declare-fun tp!72844 () Bool)

(declare-fun e!581029 () Bool)

(assert (=> mapNonEmpty!37915 (= mapRes!37915 (and tp!72844 e!581029))))

(declare-fun mapRest!37915 () (Array (_ BitVec 32) ValueCell!11454))

(declare-fun mapKey!37915 () (_ BitVec 32))

(declare-fun mapValue!37915 () ValueCell!11454)

(assert (=> mapNonEmpty!37915 (= (arr!31150 (_values!6138 thiss!1427)) (store mapRest!37915 mapKey!37915 mapValue!37915))))

(declare-fun b!1029158 () Bool)

(declare-fun res!688481 () Bool)

(declare-fun e!581025 () Bool)

(assert (=> b!1029158 (=> (not res!688481) (not e!581025))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1029158 (= res!688481 (not (= key!909 (bvneg key!909))))))

(declare-fun res!688483 () Bool)

(assert (=> start!89808 (=> (not res!688483) (not e!581025))))

(declare-fun valid!2083 (LongMapFixedSize!5502) Bool)

(assert (=> start!89808 (= res!688483 (valid!2083 thiss!1427))))

(assert (=> start!89808 e!581025))

(declare-fun e!581026 () Bool)

(assert (=> start!89808 e!581026))

(assert (=> start!89808 true))

(declare-fun mapIsEmpty!37915 () Bool)

(assert (=> mapIsEmpty!37915 mapRes!37915))

(declare-fun b!1029159 () Bool)

(declare-fun tp_is_empty!24315 () Bool)

(assert (=> b!1029159 (= e!581024 tp_is_empty!24315)))

(declare-fun b!1029160 () Bool)

(declare-fun e!581028 () Bool)

(assert (=> b!1029160 (= e!581028 (not e!581031))))

(declare-fun res!688480 () Bool)

(assert (=> b!1029160 (=> res!688480 e!581031)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029160 (= res!688480 (not (validMask!0 (mask!29867 (_2!7790 lt!453584)))))))

(declare-fun lt!453577 () array!64690)

(declare-fun lt!453576 () array!64688)

(declare-fun Unit!33607 () Unit!33605)

(declare-fun Unit!33608 () Unit!33605)

(assert (=> b!1029160 (= lt!453584 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2806 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15559 Unit!33607 (LongMapFixedSize!5503 (defaultEntry!6115 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (bvsub (_size!2806 thiss!1427) #b00000000000000000000000000000001) lt!453576 lt!453577 (bvadd #b00000000000000000000000000000001 (_vacant!2806 thiss!1427)))) (tuple2!15559 Unit!33608 (LongMapFixedSize!5503 (defaultEntry!6115 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (bvsub (_size!2806 thiss!1427) #b00000000000000000000000000000001) lt!453576 lt!453577 (_vacant!2806 thiss!1427)))))))

(declare-datatypes ((tuple2!15560 0))(
  ( (tuple2!15561 (_1!7791 (_ BitVec 64)) (_2!7791 V!37293)) )
))
(declare-datatypes ((List!21823 0))(
  ( (Nil!21820) (Cons!21819 (h!23019 tuple2!15560) (t!30913 List!21823)) )
))
(declare-datatypes ((ListLongMap!13683 0))(
  ( (ListLongMap!13684 (toList!6857 List!21823)) )
))
(declare-fun -!484 (ListLongMap!13683 (_ BitVec 64)) ListLongMap!13683)

(declare-fun getCurrentListMap!3905 (array!64688 array!64690 (_ BitVec 32) (_ BitVec 32) V!37293 V!37293 (_ BitVec 32) Int) ListLongMap!13683)

(assert (=> b!1029160 (= (-!484 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) key!909) (getCurrentListMap!3905 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9683 0))(
  ( (MissingZero!9683 (index!41103 (_ BitVec 32))) (Found!9683 (index!41104 (_ BitVec 32))) (Intermediate!9683 (undefined!10495 Bool) (index!41105 (_ BitVec 32)) (x!91589 (_ BitVec 32))) (Undefined!9683) (MissingVacant!9683 (index!41106 (_ BitVec 32))) )
))
(declare-fun lt!453581 () SeekEntryResult!9683)

(declare-fun dynLambda!1954 (Int (_ BitVec 64)) V!37293)

(assert (=> b!1029160 (= lt!453577 (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))))))

(declare-fun lt!453579 () Unit!33605)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!10 (array!64688 array!64690 (_ BitVec 32) (_ BitVec 32) V!37293 V!37293 (_ BitVec 32) (_ BitVec 64) Int) Unit!33605)

(assert (=> b!1029160 (= lt!453579 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!10 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (index!41104 lt!453581) key!909 (defaultEntry!6115 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029160 (not (arrayContainsKey!0 lt!453576 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453582 () Unit!33605)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64688 (_ BitVec 32) (_ BitVec 64)) Unit!33605)

(assert (=> b!1029160 (= lt!453582 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11276 thiss!1427) (index!41104 lt!453581) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64688 (_ BitVec 32)) Bool)

(assert (=> b!1029160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453576 (mask!29867 thiss!1427))))

(declare-fun lt!453583 () Unit!33605)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64688 (_ BitVec 32) (_ BitVec 32)) Unit!33605)

(assert (=> b!1029160 (= lt!453583 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11276 thiss!1427) (index!41104 lt!453581) (mask!29867 thiss!1427)))))

(declare-datatypes ((List!21824 0))(
  ( (Nil!21821) (Cons!21820 (h!23020 (_ BitVec 64)) (t!30914 List!21824)) )
))
(declare-fun arrayNoDuplicates!0 (array!64688 (_ BitVec 32) List!21824) Bool)

(assert (=> b!1029160 (arrayNoDuplicates!0 lt!453576 #b00000000000000000000000000000000 Nil!21821)))

(declare-fun lt!453580 () Unit!33605)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21824) Unit!33605)

(assert (=> b!1029160 (= lt!453580 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11276 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41104 lt!453581) #b00000000000000000000000000000000 Nil!21821))))

(declare-fun arrayCountValidKeys!0 (array!64688 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029160 (= (arrayCountValidKeys!0 lt!453576 #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029160 (= lt!453576 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun lt!453578 () Unit!33605)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64688 (_ BitVec 32) (_ BitVec 64)) Unit!33605)

(assert (=> b!1029160 (= lt!453578 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11276 thiss!1427) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029161 () Bool)

(assert (=> b!1029161 (= e!581029 tp_is_empty!24315)))

(declare-fun array_inv!24113 (array!64688) Bool)

(declare-fun array_inv!24114 (array!64690) Bool)

(assert (=> b!1029162 (= e!581026 (and tp!72845 tp_is_empty!24315 (array_inv!24113 (_keys!11276 thiss!1427)) (array_inv!24114 (_values!6138 thiss!1427)) e!581030))))

(declare-fun b!1029163 () Bool)

(assert (=> b!1029163 (= e!581025 e!581028)))

(declare-fun res!688482 () Bool)

(assert (=> b!1029163 (=> (not res!688482) (not e!581028))))

(get-info :version)

(assert (=> b!1029163 (= res!688482 ((_ is Found!9683) lt!453581))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64688 (_ BitVec 32)) SeekEntryResult!9683)

(assert (=> b!1029163 (= lt!453581 (seekEntry!0 key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(assert (= (and start!89808 res!688483) b!1029158))

(assert (= (and b!1029158 res!688481) b!1029163))

(assert (= (and b!1029163 res!688482) b!1029160))

(assert (= (and b!1029160 (not res!688480)) b!1029157))

(assert (= (and b!1029156 condMapEmpty!37915) mapIsEmpty!37915))

(assert (= (and b!1029156 (not condMapEmpty!37915)) mapNonEmpty!37915))

(assert (= (and mapNonEmpty!37915 ((_ is ValueCellFull!11454) mapValue!37915)) b!1029161))

(assert (= (and b!1029156 ((_ is ValueCellFull!11454) mapDefault!37915)) b!1029159))

(assert (= b!1029162 b!1029156))

(assert (= start!89808 b!1029162))

(declare-fun b_lambda!15849 () Bool)

(assert (=> (not b_lambda!15849) (not b!1029160)))

(declare-fun t!30912 () Bool)

(declare-fun tb!6913 () Bool)

(assert (=> (and b!1029162 (= (defaultEntry!6115 thiss!1427) (defaultEntry!6115 thiss!1427)) t!30912) tb!6913))

(declare-fun result!14149 () Bool)

(assert (=> tb!6913 (= result!14149 tp_is_empty!24315)))

(assert (=> b!1029160 t!30912))

(declare-fun b_and!32917 () Bool)

(assert (= b_and!32915 (and (=> t!30912 result!14149) b_and!32917)))

(declare-fun m!948287 () Bool)

(assert (=> b!1029160 m!948287))

(declare-fun m!948289 () Bool)

(assert (=> b!1029160 m!948289))

(declare-fun m!948291 () Bool)

(assert (=> b!1029160 m!948291))

(declare-fun m!948293 () Bool)

(assert (=> b!1029160 m!948293))

(declare-fun m!948295 () Bool)

(assert (=> b!1029160 m!948295))

(declare-fun m!948297 () Bool)

(assert (=> b!1029160 m!948297))

(declare-fun m!948299 () Bool)

(assert (=> b!1029160 m!948299))

(declare-fun m!948301 () Bool)

(assert (=> b!1029160 m!948301))

(assert (=> b!1029160 m!948299))

(declare-fun m!948303 () Bool)

(assert (=> b!1029160 m!948303))

(declare-fun m!948305 () Bool)

(assert (=> b!1029160 m!948305))

(declare-fun m!948307 () Bool)

(assert (=> b!1029160 m!948307))

(declare-fun m!948309 () Bool)

(assert (=> b!1029160 m!948309))

(declare-fun m!948311 () Bool)

(assert (=> b!1029160 m!948311))

(declare-fun m!948313 () Bool)

(assert (=> b!1029160 m!948313))

(declare-fun m!948315 () Bool)

(assert (=> b!1029160 m!948315))

(declare-fun m!948317 () Bool)

(assert (=> b!1029160 m!948317))

(declare-fun m!948319 () Bool)

(assert (=> b!1029160 m!948319))

(declare-fun m!948321 () Bool)

(assert (=> mapNonEmpty!37915 m!948321))

(declare-fun m!948323 () Bool)

(assert (=> start!89808 m!948323))

(declare-fun m!948325 () Bool)

(assert (=> b!1029162 m!948325))

(declare-fun m!948327 () Bool)

(assert (=> b!1029162 m!948327))

(declare-fun m!948329 () Bool)

(assert (=> b!1029163 m!948329))

(check-sat (not b!1029160) b_and!32917 (not b!1029162) (not start!89808) (not b_next!20595) (not mapNonEmpty!37915) (not b!1029163) tp_is_empty!24315 (not b_lambda!15849))
(check-sat b_and!32917 (not b_next!20595))
(get-model)

(declare-fun b_lambda!15853 () Bool)

(assert (= b_lambda!15849 (or (and b!1029162 b_free!20595) b_lambda!15853)))

(check-sat (not b!1029160) tp_is_empty!24315 b_and!32917 (not b!1029162) (not b_lambda!15853) (not start!89808) (not b_next!20595) (not mapNonEmpty!37915) (not b!1029163))
(check-sat b_and!32917 (not b_next!20595))
(get-model)

(declare-fun b!1029204 () Bool)

(declare-fun e!581064 () SeekEntryResult!9683)

(assert (=> b!1029204 (= e!581064 Undefined!9683)))

(declare-fun b!1029205 () Bool)

(declare-fun e!581062 () SeekEntryResult!9683)

(declare-fun lt!453622 () SeekEntryResult!9683)

(assert (=> b!1029205 (= e!581062 (MissingZero!9683 (index!41105 lt!453622)))))

(declare-fun b!1029207 () Bool)

(declare-fun c!103931 () Bool)

(declare-fun lt!453620 () (_ BitVec 64))

(assert (=> b!1029207 (= c!103931 (= lt!453620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581063 () SeekEntryResult!9683)

(assert (=> b!1029207 (= e!581063 e!581062)))

(declare-fun b!1029208 () Bool)

(assert (=> b!1029208 (= e!581064 e!581063)))

(assert (=> b!1029208 (= lt!453620 (select (arr!31149 (_keys!11276 thiss!1427)) (index!41105 lt!453622)))))

(declare-fun c!103929 () Bool)

(assert (=> b!1029208 (= c!103929 (= lt!453620 key!909))))

(declare-fun b!1029209 () Bool)

(assert (=> b!1029209 (= e!581063 (Found!9683 (index!41105 lt!453622)))))

(declare-fun d!123187 () Bool)

(declare-fun lt!453621 () SeekEntryResult!9683)

(assert (=> d!123187 (and (or ((_ is MissingVacant!9683) lt!453621) (not ((_ is Found!9683) lt!453621)) (and (bvsge (index!41104 lt!453621) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453621) (size!31664 (_keys!11276 thiss!1427))))) (not ((_ is MissingVacant!9683) lt!453621)) (or (not ((_ is Found!9683) lt!453621)) (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453621)) key!909)))))

(assert (=> d!123187 (= lt!453621 e!581064)))

(declare-fun c!103930 () Bool)

(assert (=> d!123187 (= c!103930 (and ((_ is Intermediate!9683) lt!453622) (undefined!10495 lt!453622)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64688 (_ BitVec 32)) SeekEntryResult!9683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123187 (= lt!453622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29867 thiss!1427)) key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(assert (=> d!123187 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123187 (= (seekEntry!0 key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)) lt!453621)))

(declare-fun b!1029206 () Bool)

(declare-fun lt!453623 () SeekEntryResult!9683)

(assert (=> b!1029206 (= e!581062 (ite ((_ is MissingVacant!9683) lt!453623) (MissingZero!9683 (index!41106 lt!453623)) lt!453623))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64688 (_ BitVec 32)) SeekEntryResult!9683)

(assert (=> b!1029206 (= lt!453623 (seekKeyOrZeroReturnVacant!0 (x!91589 lt!453622) (index!41105 lt!453622) (index!41105 lt!453622) key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(assert (= (and d!123187 c!103930) b!1029204))

(assert (= (and d!123187 (not c!103930)) b!1029208))

(assert (= (and b!1029208 c!103929) b!1029209))

(assert (= (and b!1029208 (not c!103929)) b!1029207))

(assert (= (and b!1029207 c!103931) b!1029205))

(assert (= (and b!1029207 (not c!103931)) b!1029206))

(declare-fun m!948375 () Bool)

(assert (=> b!1029208 m!948375))

(declare-fun m!948377 () Bool)

(assert (=> d!123187 m!948377))

(declare-fun m!948379 () Bool)

(assert (=> d!123187 m!948379))

(assert (=> d!123187 m!948379))

(declare-fun m!948381 () Bool)

(assert (=> d!123187 m!948381))

(declare-fun m!948383 () Bool)

(assert (=> d!123187 m!948383))

(declare-fun m!948385 () Bool)

(assert (=> b!1029206 m!948385))

(assert (=> b!1029163 d!123187))

(declare-fun d!123189 () Bool)

(declare-fun res!688502 () Bool)

(declare-fun e!581067 () Bool)

(assert (=> d!123189 (=> (not res!688502) (not e!581067))))

(declare-fun simpleValid!394 (LongMapFixedSize!5502) Bool)

(assert (=> d!123189 (= res!688502 (simpleValid!394 thiss!1427))))

(assert (=> d!123189 (= (valid!2083 thiss!1427) e!581067)))

(declare-fun b!1029216 () Bool)

(declare-fun res!688503 () Bool)

(assert (=> b!1029216 (=> (not res!688503) (not e!581067))))

(assert (=> b!1029216 (= res!688503 (= (arrayCountValidKeys!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (_size!2806 thiss!1427)))))

(declare-fun b!1029217 () Bool)

(declare-fun res!688504 () Bool)

(assert (=> b!1029217 (=> (not res!688504) (not e!581067))))

(assert (=> b!1029217 (= res!688504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(declare-fun b!1029218 () Bool)

(assert (=> b!1029218 (= e!581067 (arrayNoDuplicates!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 Nil!21821))))

(assert (= (and d!123189 res!688502) b!1029216))

(assert (= (and b!1029216 res!688503) b!1029217))

(assert (= (and b!1029217 res!688504) b!1029218))

(declare-fun m!948387 () Bool)

(assert (=> d!123189 m!948387))

(assert (=> b!1029216 m!948311))

(declare-fun m!948389 () Bool)

(assert (=> b!1029217 m!948389))

(declare-fun m!948391 () Bool)

(assert (=> b!1029218 m!948391))

(assert (=> start!89808 d!123189))

(declare-fun d!123191 () Bool)

(assert (=> d!123191 (= (array_inv!24113 (_keys!11276 thiss!1427)) (bvsge (size!31664 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029162 d!123191))

(declare-fun d!123193 () Bool)

(assert (=> d!123193 (= (array_inv!24114 (_values!6138 thiss!1427)) (bvsge (size!31665 (_values!6138 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029162 d!123193))

(declare-fun bm!43446 () Bool)

(declare-fun call!43455 () ListLongMap!13683)

(declare-fun call!43451 () ListLongMap!13683)

(assert (=> bm!43446 (= call!43455 call!43451)))

(declare-fun b!1029261 () Bool)

(declare-fun e!581099 () Bool)

(declare-fun call!43450 () Bool)

(assert (=> b!1029261 (= e!581099 (not call!43450))))

(declare-fun b!1029262 () Bool)

(declare-fun c!103946 () Bool)

(assert (=> b!1029262 (= c!103946 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581106 () ListLongMap!13683)

(declare-fun e!581095 () ListLongMap!13683)

(assert (=> b!1029262 (= e!581106 e!581095)))

(declare-fun b!1029263 () Bool)

(declare-fun e!581103 () Bool)

(declare-fun call!43454 () Bool)

(assert (=> b!1029263 (= e!581103 (not call!43454))))

(declare-fun b!1029264 () Bool)

(declare-fun call!43453 () ListLongMap!13683)

(assert (=> b!1029264 (= e!581095 call!43453)))

(declare-fun b!1029265 () Bool)

(declare-fun e!581100 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029265 (= e!581100 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun b!1029266 () Bool)

(declare-fun e!581096 () Bool)

(assert (=> b!1029266 (= e!581103 e!581096)))

(declare-fun res!688525 () Bool)

(assert (=> b!1029266 (= res!688525 call!43454)))

(assert (=> b!1029266 (=> (not res!688525) (not e!581096))))

(declare-fun b!1029267 () Bool)

(declare-fun lt!453685 () ListLongMap!13683)

(declare-fun apply!903 (ListLongMap!13683 (_ BitVec 64)) V!37293)

(assert (=> b!1029267 (= e!581096 (= (apply!903 lt!453685 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5951 thiss!1427)))))

(declare-fun b!1029268 () Bool)

(declare-fun call!43449 () ListLongMap!13683)

(assert (=> b!1029268 (= e!581095 call!43449)))

(declare-fun bm!43447 () Bool)

(declare-fun contains!5972 (ListLongMap!13683 (_ BitVec 64)) Bool)

(assert (=> bm!43447 (= call!43454 (contains!5972 lt!453685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029269 () Bool)

(assert (=> b!1029269 (= e!581106 call!43449)))

(declare-fun c!103947 () Bool)

(declare-fun call!43452 () ListLongMap!13683)

(declare-fun c!103944 () Bool)

(declare-fun bm!43448 () Bool)

(declare-fun +!3101 (ListLongMap!13683 tuple2!15560) ListLongMap!13683)

(assert (=> bm!43448 (= call!43452 (+!3101 (ite c!103947 call!43451 (ite c!103944 call!43455 call!43453)) (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(declare-fun b!1029270 () Bool)

(declare-fun e!581097 () Bool)

(declare-fun e!581105 () Bool)

(assert (=> b!1029270 (= e!581097 e!581105)))

(declare-fun res!688526 () Bool)

(assert (=> b!1029270 (=> (not res!688526) (not e!581105))))

(assert (=> b!1029270 (= res!688526 (contains!5972 lt!453685 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (=> b!1029270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(declare-fun b!1029271 () Bool)

(declare-fun e!581098 () ListLongMap!13683)

(assert (=> b!1029271 (= e!581098 e!581106)))

(assert (=> b!1029271 (= c!103944 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029272 () Bool)

(declare-fun e!581101 () Unit!33605)

(declare-fun Unit!33613 () Unit!33605)

(assert (=> b!1029272 (= e!581101 Unit!33613)))

(declare-fun b!1029273 () Bool)

(declare-fun res!688531 () Bool)

(declare-fun e!581102 () Bool)

(assert (=> b!1029273 (=> (not res!688531) (not e!581102))))

(assert (=> b!1029273 (= res!688531 e!581097)))

(declare-fun res!688527 () Bool)

(assert (=> b!1029273 (=> res!688527 e!581097)))

(assert (=> b!1029273 (= res!688527 (not e!581100))))

(declare-fun res!688529 () Bool)

(assert (=> b!1029273 (=> (not res!688529) (not e!581100))))

(assert (=> b!1029273 (= res!688529 (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(declare-fun b!1029274 () Bool)

(assert (=> b!1029274 (= e!581102 e!581099)))

(declare-fun c!103945 () Bool)

(assert (=> b!1029274 (= c!103945 (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029275 () Bool)

(assert (=> b!1029275 (= e!581098 (+!3101 call!43452 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))

(declare-fun b!1029276 () Bool)

(declare-fun e!581094 () Bool)

(assert (=> b!1029276 (= e!581094 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun bm!43450 () Bool)

(assert (=> bm!43450 (= call!43453 call!43455)))

(declare-fun b!1029277 () Bool)

(declare-fun e!581104 () Bool)

(assert (=> b!1029277 (= e!581104 (= (apply!903 lt!453685 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5951 thiss!1427)))))

(declare-fun b!1029278 () Bool)

(declare-fun lt!453684 () Unit!33605)

(assert (=> b!1029278 (= e!581101 lt!453684)))

(declare-fun lt!453681 () ListLongMap!13683)

(declare-fun getCurrentListMapNoExtraKeys!3517 (array!64688 array!64690 (_ BitVec 32) (_ BitVec 32) V!37293 V!37293 (_ BitVec 32) Int) ListLongMap!13683)

(assert (=> b!1029278 (= lt!453681 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453688 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453668 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453668 (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))

(declare-fun lt!453689 () Unit!33605)

(declare-fun addStillContains!622 (ListLongMap!13683 (_ BitVec 64) V!37293 (_ BitVec 64)) Unit!33605)

(assert (=> b!1029278 (= lt!453689 (addStillContains!622 lt!453681 lt!453688 (zeroValue!5951 thiss!1427) lt!453668))))

(assert (=> b!1029278 (contains!5972 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))) lt!453668)))

(declare-fun lt!453675 () Unit!33605)

(assert (=> b!1029278 (= lt!453675 lt!453689)))

(declare-fun lt!453673 () ListLongMap!13683)

(assert (=> b!1029278 (= lt!453673 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453671 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453686 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453686 (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))

(declare-fun lt!453683 () Unit!33605)

(declare-fun addApplyDifferent!482 (ListLongMap!13683 (_ BitVec 64) V!37293 (_ BitVec 64)) Unit!33605)

(assert (=> b!1029278 (= lt!453683 (addApplyDifferent!482 lt!453673 lt!453671 (minValue!5951 thiss!1427) lt!453686))))

(assert (=> b!1029278 (= (apply!903 (+!3101 lt!453673 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))) lt!453686) (apply!903 lt!453673 lt!453686))))

(declare-fun lt!453676 () Unit!33605)

(assert (=> b!1029278 (= lt!453676 lt!453683)))

(declare-fun lt!453682 () ListLongMap!13683)

(assert (=> b!1029278 (= lt!453682 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453687 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453680 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453680 (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))

(declare-fun lt!453677 () Unit!33605)

(assert (=> b!1029278 (= lt!453677 (addApplyDifferent!482 lt!453682 lt!453687 (zeroValue!5951 thiss!1427) lt!453680))))

(assert (=> b!1029278 (= (apply!903 (+!3101 lt!453682 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))) lt!453680) (apply!903 lt!453682 lt!453680))))

(declare-fun lt!453670 () Unit!33605)

(assert (=> b!1029278 (= lt!453670 lt!453677)))

(declare-fun lt!453669 () ListLongMap!13683)

(assert (=> b!1029278 (= lt!453669 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453674 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453674 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453672 () (_ BitVec 64))

(assert (=> b!1029278 (= lt!453672 (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))

(assert (=> b!1029278 (= lt!453684 (addApplyDifferent!482 lt!453669 lt!453674 (minValue!5951 thiss!1427) lt!453672))))

(assert (=> b!1029278 (= (apply!903 (+!3101 lt!453669 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))) lt!453672) (apply!903 lt!453669 lt!453672))))

(declare-fun b!1029279 () Bool)

(assert (=> b!1029279 (= e!581099 e!581104)))

(declare-fun res!688524 () Bool)

(assert (=> b!1029279 (= res!688524 call!43450)))

(assert (=> b!1029279 (=> (not res!688524) (not e!581104))))

(declare-fun b!1029280 () Bool)

(declare-fun res!688528 () Bool)

(assert (=> b!1029280 (=> (not res!688528) (not e!581102))))

(assert (=> b!1029280 (= res!688528 e!581103)))

(declare-fun c!103948 () Bool)

(assert (=> b!1029280 (= c!103948 (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43451 () Bool)

(assert (=> bm!43451 (= call!43450 (contains!5972 lt!453685 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43452 () Bool)

(assert (=> bm!43452 (= call!43449 call!43452)))

(declare-fun b!1029281 () Bool)

(declare-fun get!16356 (ValueCell!11454 V!37293) V!37293)

(assert (=> b!1029281 (= e!581105 (= (apply!903 lt!453685 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) (get!16356 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31665 lt!453577)))))

(assert (=> b!1029281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(declare-fun d!123195 () Bool)

(assert (=> d!123195 e!581102))

(declare-fun res!688523 () Bool)

(assert (=> d!123195 (=> (not res!688523) (not e!581102))))

(assert (=> d!123195 (= res!688523 (or (bvsge #b00000000000000000000000000000000 (size!31664 lt!453576)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))))

(declare-fun lt!453678 () ListLongMap!13683)

(assert (=> d!123195 (= lt!453685 lt!453678)))

(declare-fun lt!453679 () Unit!33605)

(assert (=> d!123195 (= lt!453679 e!581101)))

(declare-fun c!103949 () Bool)

(assert (=> d!123195 (= c!103949 e!581094)))

(declare-fun res!688530 () Bool)

(assert (=> d!123195 (=> (not res!688530) (not e!581094))))

(assert (=> d!123195 (= res!688530 (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(assert (=> d!123195 (= lt!453678 e!581098)))

(assert (=> d!123195 (= c!103947 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123195 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123195 (= (getCurrentListMap!3905 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) lt!453685)))

(declare-fun bm!43449 () Bool)

(assert (=> bm!43449 (= call!43451 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(assert (= (and d!123195 c!103947) b!1029275))

(assert (= (and d!123195 (not c!103947)) b!1029271))

(assert (= (and b!1029271 c!103944) b!1029269))

(assert (= (and b!1029271 (not c!103944)) b!1029262))

(assert (= (and b!1029262 c!103946) b!1029268))

(assert (= (and b!1029262 (not c!103946)) b!1029264))

(assert (= (or b!1029268 b!1029264) bm!43450))

(assert (= (or b!1029269 bm!43450) bm!43446))

(assert (= (or b!1029269 b!1029268) bm!43452))

(assert (= (or b!1029275 bm!43446) bm!43449))

(assert (= (or b!1029275 bm!43452) bm!43448))

(assert (= (and d!123195 res!688530) b!1029276))

(assert (= (and d!123195 c!103949) b!1029278))

(assert (= (and d!123195 (not c!103949)) b!1029272))

(assert (= (and d!123195 res!688523) b!1029273))

(assert (= (and b!1029273 res!688529) b!1029265))

(assert (= (and b!1029273 (not res!688527)) b!1029270))

(assert (= (and b!1029270 res!688526) b!1029281))

(assert (= (and b!1029273 res!688531) b!1029280))

(assert (= (and b!1029280 c!103948) b!1029266))

(assert (= (and b!1029280 (not c!103948)) b!1029263))

(assert (= (and b!1029266 res!688525) b!1029267))

(assert (= (or b!1029266 b!1029263) bm!43447))

(assert (= (and b!1029280 res!688528) b!1029274))

(assert (= (and b!1029274 c!103945) b!1029279))

(assert (= (and b!1029274 (not c!103945)) b!1029261))

(assert (= (and b!1029279 res!688524) b!1029277))

(assert (= (or b!1029279 b!1029261) bm!43451))

(declare-fun b_lambda!15855 () Bool)

(assert (=> (not b_lambda!15855) (not b!1029281)))

(assert (=> b!1029281 t!30912))

(declare-fun b_and!32923 () Bool)

(assert (= b_and!32917 (and (=> t!30912 result!14149) b_and!32923)))

(declare-fun m!948393 () Bool)

(assert (=> bm!43447 m!948393))

(declare-fun m!948395 () Bool)

(assert (=> b!1029270 m!948395))

(assert (=> b!1029270 m!948395))

(declare-fun m!948397 () Bool)

(assert (=> b!1029270 m!948397))

(declare-fun m!948399 () Bool)

(assert (=> bm!43451 m!948399))

(declare-fun m!948401 () Bool)

(assert (=> b!1029278 m!948401))

(declare-fun m!948403 () Bool)

(assert (=> b!1029278 m!948403))

(declare-fun m!948405 () Bool)

(assert (=> b!1029278 m!948405))

(declare-fun m!948407 () Bool)

(assert (=> b!1029278 m!948407))

(declare-fun m!948409 () Bool)

(assert (=> b!1029278 m!948409))

(declare-fun m!948411 () Bool)

(assert (=> b!1029278 m!948411))

(declare-fun m!948413 () Bool)

(assert (=> b!1029278 m!948413))

(declare-fun m!948415 () Bool)

(assert (=> b!1029278 m!948415))

(assert (=> b!1029278 m!948403))

(declare-fun m!948417 () Bool)

(assert (=> b!1029278 m!948417))

(declare-fun m!948419 () Bool)

(assert (=> b!1029278 m!948419))

(declare-fun m!948421 () Bool)

(assert (=> b!1029278 m!948421))

(declare-fun m!948423 () Bool)

(assert (=> b!1029278 m!948423))

(declare-fun m!948425 () Bool)

(assert (=> b!1029278 m!948425))

(assert (=> b!1029278 m!948421))

(declare-fun m!948427 () Bool)

(assert (=> b!1029278 m!948427))

(assert (=> b!1029278 m!948417))

(declare-fun m!948429 () Bool)

(assert (=> b!1029278 m!948429))

(assert (=> b!1029278 m!948411))

(declare-fun m!948431 () Bool)

(assert (=> b!1029278 m!948431))

(assert (=> b!1029278 m!948395))

(declare-fun m!948433 () Bool)

(assert (=> bm!43448 m!948433))

(assert (=> b!1029281 m!948395))

(declare-fun m!948435 () Bool)

(assert (=> b!1029281 m!948435))

(assert (=> b!1029281 m!948319))

(declare-fun m!948437 () Bool)

(assert (=> b!1029281 m!948437))

(assert (=> b!1029281 m!948395))

(assert (=> b!1029281 m!948437))

(assert (=> b!1029281 m!948319))

(declare-fun m!948439 () Bool)

(assert (=> b!1029281 m!948439))

(assert (=> b!1029265 m!948395))

(assert (=> b!1029265 m!948395))

(declare-fun m!948441 () Bool)

(assert (=> b!1029265 m!948441))

(assert (=> d!123195 m!948383))

(declare-fun m!948443 () Bool)

(assert (=> b!1029277 m!948443))

(declare-fun m!948445 () Bool)

(assert (=> b!1029275 m!948445))

(declare-fun m!948447 () Bool)

(assert (=> b!1029267 m!948447))

(assert (=> bm!43449 m!948401))

(assert (=> b!1029276 m!948395))

(assert (=> b!1029276 m!948395))

(assert (=> b!1029276 m!948441))

(assert (=> b!1029160 d!123195))

(declare-fun d!123197 () Bool)

(declare-fun e!581109 () Bool)

(assert (=> d!123197 e!581109))

(declare-fun res!688534 () Bool)

(assert (=> d!123197 (=> (not res!688534) (not e!581109))))

(assert (=> d!123197 (= res!688534 (and (bvsge (index!41104 lt!453581) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453581) (size!31664 (_keys!11276 thiss!1427)))))))

(declare-fun lt!453692 () Unit!33605)

(declare-fun choose!25 (array!64688 (_ BitVec 32) (_ BitVec 32)) Unit!33605)

(assert (=> d!123197 (= lt!453692 (choose!25 (_keys!11276 thiss!1427) (index!41104 lt!453581) (mask!29867 thiss!1427)))))

(assert (=> d!123197 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123197 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11276 thiss!1427) (index!41104 lt!453581) (mask!29867 thiss!1427)) lt!453692)))

(declare-fun b!1029284 () Bool)

(assert (=> b!1029284 (= e!581109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (mask!29867 thiss!1427)))))

(assert (= (and d!123197 res!688534) b!1029284))

(declare-fun m!948449 () Bool)

(assert (=> d!123197 m!948449))

(assert (=> d!123197 m!948383))

(assert (=> b!1029284 m!948287))

(declare-fun m!948451 () Bool)

(assert (=> b!1029284 m!948451))

(assert (=> b!1029160 d!123197))

(declare-fun d!123199 () Bool)

(assert (=> d!123199 (= (validMask!0 (mask!29867 (_2!7790 lt!453584))) (and (or (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000000000111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000000001111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000000011111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000000111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000001111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000011111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000000111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000001111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000011111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000000111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000001111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000011111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000000111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000001111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000011111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000000111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000001111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000011111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000000111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000001111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000011111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000000111111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000001111111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000011111111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00000111111111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00001111111111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00011111111111111111111111111111) (= (mask!29867 (_2!7790 lt!453584)) #b00111111111111111111111111111111)) (bvsle (mask!29867 (_2!7790 lt!453584)) #b00111111111111111111111111111111)))))

(assert (=> b!1029160 d!123199))

(declare-fun b!1029293 () Bool)

(declare-fun res!688543 () Bool)

(declare-fun e!581115 () Bool)

(assert (=> b!1029293 (=> (not res!688543) (not e!581115))))

(assert (=> b!1029293 (= res!688543 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581))))))

(declare-fun b!1029296 () Bool)

(declare-fun e!581114 () Bool)

(assert (=> b!1029296 (= e!581114 (= (arrayCountValidKeys!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1029295 () Bool)

(assert (=> b!1029295 (= e!581115 (bvslt (size!31664 (_keys!11276 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1029294 () Bool)

(declare-fun res!688545 () Bool)

(assert (=> b!1029294 (=> (not res!688545) (not e!581115))))

(assert (=> b!1029294 (= res!688545 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123201 () Bool)

(assert (=> d!123201 e!581114))

(declare-fun res!688544 () Bool)

(assert (=> d!123201 (=> (not res!688544) (not e!581114))))

(assert (=> d!123201 (= res!688544 (and (bvsge (index!41104 lt!453581) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453581) (size!31664 (_keys!11276 thiss!1427)))))))

(declare-fun lt!453695 () Unit!33605)

(declare-fun choose!82 (array!64688 (_ BitVec 32) (_ BitVec 64)) Unit!33605)

(assert (=> d!123201 (= lt!453695 (choose!82 (_keys!11276 thiss!1427) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123201 e!581115))

(declare-fun res!688546 () Bool)

(assert (=> d!123201 (=> (not res!688546) (not e!581115))))

(assert (=> d!123201 (= res!688546 (and (bvsge (index!41104 lt!453581) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453581) (size!31664 (_keys!11276 thiss!1427)))))))

(assert (=> d!123201 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11276 thiss!1427) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453695)))

(assert (= (and d!123201 res!688546) b!1029293))

(assert (= (and b!1029293 res!688543) b!1029294))

(assert (= (and b!1029294 res!688545) b!1029295))

(assert (= (and d!123201 res!688544) b!1029296))

(declare-fun m!948453 () Bool)

(assert (=> b!1029293 m!948453))

(assert (=> b!1029293 m!948453))

(declare-fun m!948455 () Bool)

(assert (=> b!1029293 m!948455))

(assert (=> b!1029296 m!948287))

(declare-fun m!948457 () Bool)

(assert (=> b!1029296 m!948457))

(assert (=> b!1029296 m!948311))

(declare-fun m!948459 () Bool)

(assert (=> b!1029294 m!948459))

(declare-fun m!948461 () Bool)

(assert (=> d!123201 m!948461))

(assert (=> b!1029160 d!123201))

(declare-fun bm!43453 () Bool)

(declare-fun call!43462 () ListLongMap!13683)

(declare-fun call!43458 () ListLongMap!13683)

(assert (=> bm!43453 (= call!43462 call!43458)))

(declare-fun b!1029297 () Bool)

(declare-fun e!581121 () Bool)

(declare-fun call!43457 () Bool)

(assert (=> b!1029297 (= e!581121 (not call!43457))))

(declare-fun b!1029298 () Bool)

(declare-fun c!103952 () Bool)

(assert (=> b!1029298 (= c!103952 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581128 () ListLongMap!13683)

(declare-fun e!581117 () ListLongMap!13683)

(assert (=> b!1029298 (= e!581128 e!581117)))

(declare-fun b!1029299 () Bool)

(declare-fun e!581125 () Bool)

(declare-fun call!43461 () Bool)

(assert (=> b!1029299 (= e!581125 (not call!43461))))

(declare-fun b!1029300 () Bool)

(declare-fun call!43460 () ListLongMap!13683)

(assert (=> b!1029300 (= e!581117 call!43460)))

(declare-fun b!1029301 () Bool)

(declare-fun e!581122 () Bool)

(assert (=> b!1029301 (= e!581122 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029302 () Bool)

(declare-fun e!581118 () Bool)

(assert (=> b!1029302 (= e!581125 e!581118)))

(declare-fun res!688549 () Bool)

(assert (=> b!1029302 (= res!688549 call!43461)))

(assert (=> b!1029302 (=> (not res!688549) (not e!581118))))

(declare-fun b!1029303 () Bool)

(declare-fun lt!453713 () ListLongMap!13683)

(assert (=> b!1029303 (= e!581118 (= (apply!903 lt!453713 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5951 thiss!1427)))))

(declare-fun b!1029304 () Bool)

(declare-fun call!43456 () ListLongMap!13683)

(assert (=> b!1029304 (= e!581117 call!43456)))

(declare-fun bm!43454 () Bool)

(assert (=> bm!43454 (= call!43461 (contains!5972 lt!453713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029305 () Bool)

(assert (=> b!1029305 (= e!581128 call!43456)))

(declare-fun call!43459 () ListLongMap!13683)

(declare-fun c!103953 () Bool)

(declare-fun c!103950 () Bool)

(declare-fun bm!43455 () Bool)

(assert (=> bm!43455 (= call!43459 (+!3101 (ite c!103953 call!43458 (ite c!103950 call!43462 call!43460)) (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(declare-fun b!1029306 () Bool)

(declare-fun e!581119 () Bool)

(declare-fun e!581127 () Bool)

(assert (=> b!1029306 (= e!581119 e!581127)))

(declare-fun res!688550 () Bool)

(assert (=> b!1029306 (=> (not res!688550) (not e!581127))))

(assert (=> b!1029306 (= res!688550 (contains!5972 lt!453713 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029307 () Bool)

(declare-fun e!581120 () ListLongMap!13683)

(assert (=> b!1029307 (= e!581120 e!581128)))

(assert (=> b!1029307 (= c!103950 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029308 () Bool)

(declare-fun e!581123 () Unit!33605)

(declare-fun Unit!33614 () Unit!33605)

(assert (=> b!1029308 (= e!581123 Unit!33614)))

(declare-fun b!1029309 () Bool)

(declare-fun res!688555 () Bool)

(declare-fun e!581124 () Bool)

(assert (=> b!1029309 (=> (not res!688555) (not e!581124))))

(assert (=> b!1029309 (= res!688555 e!581119)))

(declare-fun res!688551 () Bool)

(assert (=> b!1029309 (=> res!688551 e!581119)))

(assert (=> b!1029309 (= res!688551 (not e!581122))))

(declare-fun res!688553 () Bool)

(assert (=> b!1029309 (=> (not res!688553) (not e!581122))))

(assert (=> b!1029309 (= res!688553 (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029310 () Bool)

(assert (=> b!1029310 (= e!581124 e!581121)))

(declare-fun c!103951 () Bool)

(assert (=> b!1029310 (= c!103951 (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029311 () Bool)

(assert (=> b!1029311 (= e!581120 (+!3101 call!43459 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))

(declare-fun b!1029312 () Bool)

(declare-fun e!581116 () Bool)

(assert (=> b!1029312 (= e!581116 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43457 () Bool)

(assert (=> bm!43457 (= call!43460 call!43462)))

(declare-fun b!1029313 () Bool)

(declare-fun e!581126 () Bool)

(assert (=> b!1029313 (= e!581126 (= (apply!903 lt!453713 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5951 thiss!1427)))))

(declare-fun b!1029314 () Bool)

(declare-fun lt!453712 () Unit!33605)

(assert (=> b!1029314 (= e!581123 lt!453712)))

(declare-fun lt!453709 () ListLongMap!13683)

(assert (=> b!1029314 (= lt!453709 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453716 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453696 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453696 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453717 () Unit!33605)

(assert (=> b!1029314 (= lt!453717 (addStillContains!622 lt!453709 lt!453716 (zeroValue!5951 thiss!1427) lt!453696))))

(assert (=> b!1029314 (contains!5972 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))) lt!453696)))

(declare-fun lt!453703 () Unit!33605)

(assert (=> b!1029314 (= lt!453703 lt!453717)))

(declare-fun lt!453701 () ListLongMap!13683)

(assert (=> b!1029314 (= lt!453701 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453699 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453699 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453714 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453714 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453711 () Unit!33605)

(assert (=> b!1029314 (= lt!453711 (addApplyDifferent!482 lt!453701 lt!453699 (minValue!5951 thiss!1427) lt!453714))))

(assert (=> b!1029314 (= (apply!903 (+!3101 lt!453701 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))) lt!453714) (apply!903 lt!453701 lt!453714))))

(declare-fun lt!453704 () Unit!33605)

(assert (=> b!1029314 (= lt!453704 lt!453711)))

(declare-fun lt!453710 () ListLongMap!13683)

(assert (=> b!1029314 (= lt!453710 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453715 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453708 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453708 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453705 () Unit!33605)

(assert (=> b!1029314 (= lt!453705 (addApplyDifferent!482 lt!453710 lt!453715 (zeroValue!5951 thiss!1427) lt!453708))))

(assert (=> b!1029314 (= (apply!903 (+!3101 lt!453710 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))) lt!453708) (apply!903 lt!453710 lt!453708))))

(declare-fun lt!453698 () Unit!33605)

(assert (=> b!1029314 (= lt!453698 lt!453705)))

(declare-fun lt!453697 () ListLongMap!13683)

(assert (=> b!1029314 (= lt!453697 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453702 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453702 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453700 () (_ BitVec 64))

(assert (=> b!1029314 (= lt!453700 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029314 (= lt!453712 (addApplyDifferent!482 lt!453697 lt!453702 (minValue!5951 thiss!1427) lt!453700))))

(assert (=> b!1029314 (= (apply!903 (+!3101 lt!453697 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))) lt!453700) (apply!903 lt!453697 lt!453700))))

(declare-fun b!1029315 () Bool)

(assert (=> b!1029315 (= e!581121 e!581126)))

(declare-fun res!688548 () Bool)

(assert (=> b!1029315 (= res!688548 call!43457)))

(assert (=> b!1029315 (=> (not res!688548) (not e!581126))))

(declare-fun b!1029316 () Bool)

(declare-fun res!688552 () Bool)

(assert (=> b!1029316 (=> (not res!688552) (not e!581124))))

(assert (=> b!1029316 (= res!688552 e!581125)))

(declare-fun c!103954 () Bool)

(assert (=> b!1029316 (= c!103954 (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43458 () Bool)

(assert (=> bm!43458 (= call!43457 (contains!5972 lt!453713 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43459 () Bool)

(assert (=> bm!43459 (= call!43456 call!43459)))

(declare-fun b!1029317 () Bool)

(assert (=> b!1029317 (= e!581127 (= (apply!903 lt!453713 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)) (get!16356 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31665 (_values!6138 thiss!1427))))))

(assert (=> b!1029317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun d!123203 () Bool)

(assert (=> d!123203 e!581124))

(declare-fun res!688547 () Bool)

(assert (=> d!123203 (=> (not res!688547) (not e!581124))))

(assert (=> d!123203 (= res!688547 (or (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))))

(declare-fun lt!453706 () ListLongMap!13683)

(assert (=> d!123203 (= lt!453713 lt!453706)))

(declare-fun lt!453707 () Unit!33605)

(assert (=> d!123203 (= lt!453707 e!581123)))

(declare-fun c!103955 () Bool)

(assert (=> d!123203 (= c!103955 e!581116)))

(declare-fun res!688554 () Bool)

(assert (=> d!123203 (=> (not res!688554) (not e!581116))))

(assert (=> d!123203 (= res!688554 (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123203 (= lt!453706 e!581120)))

(assert (=> d!123203 (= c!103953 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123203 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123203 (= (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) lt!453713)))

(declare-fun bm!43456 () Bool)

(assert (=> bm!43456 (= call!43458 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(assert (= (and d!123203 c!103953) b!1029311))

(assert (= (and d!123203 (not c!103953)) b!1029307))

(assert (= (and b!1029307 c!103950) b!1029305))

(assert (= (and b!1029307 (not c!103950)) b!1029298))

(assert (= (and b!1029298 c!103952) b!1029304))

(assert (= (and b!1029298 (not c!103952)) b!1029300))

(assert (= (or b!1029304 b!1029300) bm!43457))

(assert (= (or b!1029305 bm!43457) bm!43453))

(assert (= (or b!1029305 b!1029304) bm!43459))

(assert (= (or b!1029311 bm!43453) bm!43456))

(assert (= (or b!1029311 bm!43459) bm!43455))

(assert (= (and d!123203 res!688554) b!1029312))

(assert (= (and d!123203 c!103955) b!1029314))

(assert (= (and d!123203 (not c!103955)) b!1029308))

(assert (= (and d!123203 res!688547) b!1029309))

(assert (= (and b!1029309 res!688553) b!1029301))

(assert (= (and b!1029309 (not res!688551)) b!1029306))

(assert (= (and b!1029306 res!688550) b!1029317))

(assert (= (and b!1029309 res!688555) b!1029316))

(assert (= (and b!1029316 c!103954) b!1029302))

(assert (= (and b!1029316 (not c!103954)) b!1029299))

(assert (= (and b!1029302 res!688549) b!1029303))

(assert (= (or b!1029302 b!1029299) bm!43454))

(assert (= (and b!1029316 res!688552) b!1029310))

(assert (= (and b!1029310 c!103951) b!1029315))

(assert (= (and b!1029310 (not c!103951)) b!1029297))

(assert (= (and b!1029315 res!688548) b!1029313))

(assert (= (or b!1029315 b!1029297) bm!43458))

(declare-fun b_lambda!15857 () Bool)

(assert (=> (not b_lambda!15857) (not b!1029317)))

(assert (=> b!1029317 t!30912))

(declare-fun b_and!32925 () Bool)

(assert (= b_and!32923 (and (=> t!30912 result!14149) b_and!32925)))

(declare-fun m!948463 () Bool)

(assert (=> bm!43454 m!948463))

(declare-fun m!948465 () Bool)

(assert (=> b!1029306 m!948465))

(assert (=> b!1029306 m!948465))

(declare-fun m!948467 () Bool)

(assert (=> b!1029306 m!948467))

(declare-fun m!948469 () Bool)

(assert (=> bm!43458 m!948469))

(declare-fun m!948471 () Bool)

(assert (=> b!1029314 m!948471))

(declare-fun m!948473 () Bool)

(assert (=> b!1029314 m!948473))

(declare-fun m!948475 () Bool)

(assert (=> b!1029314 m!948475))

(declare-fun m!948477 () Bool)

(assert (=> b!1029314 m!948477))

(declare-fun m!948479 () Bool)

(assert (=> b!1029314 m!948479))

(declare-fun m!948481 () Bool)

(assert (=> b!1029314 m!948481))

(declare-fun m!948483 () Bool)

(assert (=> b!1029314 m!948483))

(declare-fun m!948485 () Bool)

(assert (=> b!1029314 m!948485))

(assert (=> b!1029314 m!948473))

(declare-fun m!948487 () Bool)

(assert (=> b!1029314 m!948487))

(declare-fun m!948489 () Bool)

(assert (=> b!1029314 m!948489))

(declare-fun m!948491 () Bool)

(assert (=> b!1029314 m!948491))

(declare-fun m!948493 () Bool)

(assert (=> b!1029314 m!948493))

(declare-fun m!948495 () Bool)

(assert (=> b!1029314 m!948495))

(assert (=> b!1029314 m!948491))

(declare-fun m!948497 () Bool)

(assert (=> b!1029314 m!948497))

(assert (=> b!1029314 m!948487))

(declare-fun m!948499 () Bool)

(assert (=> b!1029314 m!948499))

(assert (=> b!1029314 m!948481))

(declare-fun m!948501 () Bool)

(assert (=> b!1029314 m!948501))

(assert (=> b!1029314 m!948465))

(declare-fun m!948503 () Bool)

(assert (=> bm!43455 m!948503))

(assert (=> b!1029317 m!948465))

(declare-fun m!948505 () Bool)

(assert (=> b!1029317 m!948505))

(assert (=> b!1029317 m!948319))

(declare-fun m!948507 () Bool)

(assert (=> b!1029317 m!948507))

(assert (=> b!1029317 m!948465))

(assert (=> b!1029317 m!948507))

(assert (=> b!1029317 m!948319))

(declare-fun m!948509 () Bool)

(assert (=> b!1029317 m!948509))

(assert (=> b!1029301 m!948465))

(assert (=> b!1029301 m!948465))

(declare-fun m!948511 () Bool)

(assert (=> b!1029301 m!948511))

(assert (=> d!123203 m!948383))

(declare-fun m!948513 () Bool)

(assert (=> b!1029313 m!948513))

(declare-fun m!948515 () Bool)

(assert (=> b!1029311 m!948515))

(declare-fun m!948517 () Bool)

(assert (=> b!1029303 m!948517))

(assert (=> bm!43456 m!948471))

(assert (=> b!1029312 m!948465))

(assert (=> b!1029312 m!948465))

(assert (=> b!1029312 m!948511))

(assert (=> b!1029160 d!123203))

(declare-fun d!123205 () Bool)

(declare-fun lt!453720 () ListLongMap!13683)

(assert (=> d!123205 (not (contains!5972 lt!453720 key!909))))

(declare-fun removeStrictlySorted!53 (List!21823 (_ BitVec 64)) List!21823)

(assert (=> d!123205 (= lt!453720 (ListLongMap!13684 (removeStrictlySorted!53 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))) key!909)))))

(assert (=> d!123205 (= (-!484 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) key!909) lt!453720)))

(declare-fun bs!30056 () Bool)

(assert (= bs!30056 d!123205))

(declare-fun m!948519 () Bool)

(assert (=> bs!30056 m!948519))

(declare-fun m!948521 () Bool)

(assert (=> bs!30056 m!948521))

(assert (=> b!1029160 d!123205))

(declare-fun b!1029326 () Bool)

(declare-fun e!581135 () Bool)

(declare-fun e!581136 () Bool)

(assert (=> b!1029326 (= e!581135 e!581136)))

(declare-fun c!103958 () Bool)

(assert (=> b!1029326 (= c!103958 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun b!1029327 () Bool)

(declare-fun call!43465 () Bool)

(assert (=> b!1029327 (= e!581136 call!43465)))

(declare-fun b!1029328 () Bool)

(declare-fun e!581137 () Bool)

(assert (=> b!1029328 (= e!581136 e!581137)))

(declare-fun lt!453728 () (_ BitVec 64))

(assert (=> b!1029328 (= lt!453728 (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))

(declare-fun lt!453729 () Unit!33605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64688 (_ BitVec 64) (_ BitVec 32)) Unit!33605)

(assert (=> b!1029328 (= lt!453729 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453576 lt!453728 #b00000000000000000000000000000000))))

(assert (=> b!1029328 (arrayContainsKey!0 lt!453576 lt!453728 #b00000000000000000000000000000000)))

(declare-fun lt!453727 () Unit!33605)

(assert (=> b!1029328 (= lt!453727 lt!453729)))

(declare-fun res!688560 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64688 (_ BitVec 32)) SeekEntryResult!9683)

(assert (=> b!1029328 (= res!688560 (= (seekEntryOrOpen!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) lt!453576 (mask!29867 thiss!1427)) (Found!9683 #b00000000000000000000000000000000)))))

(assert (=> b!1029328 (=> (not res!688560) (not e!581137))))

(declare-fun b!1029329 () Bool)

(assert (=> b!1029329 (= e!581137 call!43465)))

(declare-fun d!123207 () Bool)

(declare-fun res!688561 () Bool)

(assert (=> d!123207 (=> res!688561 e!581135)))

(assert (=> d!123207 (= res!688561 (bvsge #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(assert (=> d!123207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453576 (mask!29867 thiss!1427)) e!581135)))

(declare-fun bm!43462 () Bool)

(assert (=> bm!43462 (= call!43465 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453576 (mask!29867 thiss!1427)))))

(assert (= (and d!123207 (not res!688561)) b!1029326))

(assert (= (and b!1029326 c!103958) b!1029328))

(assert (= (and b!1029326 (not c!103958)) b!1029327))

(assert (= (and b!1029328 res!688560) b!1029329))

(assert (= (or b!1029329 b!1029327) bm!43462))

(assert (=> b!1029326 m!948395))

(assert (=> b!1029326 m!948395))

(assert (=> b!1029326 m!948441))

(assert (=> b!1029328 m!948395))

(declare-fun m!948523 () Bool)

(assert (=> b!1029328 m!948523))

(declare-fun m!948525 () Bool)

(assert (=> b!1029328 m!948525))

(assert (=> b!1029328 m!948395))

(declare-fun m!948527 () Bool)

(assert (=> b!1029328 m!948527))

(declare-fun m!948529 () Bool)

(assert (=> bm!43462 m!948529))

(assert (=> b!1029160 d!123207))

(declare-fun d!123209 () Bool)

(declare-fun e!581140 () Bool)

(assert (=> d!123209 e!581140))

(declare-fun res!688564 () Bool)

(assert (=> d!123209 (=> (not res!688564) (not e!581140))))

(assert (=> d!123209 (= res!688564 (and (bvsge (index!41104 lt!453581) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453581) (size!31664 (_keys!11276 thiss!1427)))))))

(declare-fun lt!453732 () Unit!33605)

(declare-fun choose!53 (array!64688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21824) Unit!33605)

(assert (=> d!123209 (= lt!453732 (choose!53 (_keys!11276 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41104 lt!453581) #b00000000000000000000000000000000 Nil!21821))))

(assert (=> d!123209 (bvslt (size!31664 (_keys!11276 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123209 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11276 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41104 lt!453581) #b00000000000000000000000000000000 Nil!21821) lt!453732)))

(declare-fun b!1029332 () Bool)

(assert (=> b!1029332 (= e!581140 (arrayNoDuplicates!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000000 Nil!21821))))

(assert (= (and d!123209 res!688564) b!1029332))

(declare-fun m!948531 () Bool)

(assert (=> d!123209 m!948531))

(assert (=> b!1029332 m!948287))

(declare-fun m!948533 () Bool)

(assert (=> b!1029332 m!948533))

(assert (=> b!1029160 d!123209))

(declare-fun d!123211 () Bool)

(declare-fun e!581143 () Bool)

(assert (=> d!123211 e!581143))

(declare-fun res!688567 () Bool)

(assert (=> d!123211 (=> (not res!688567) (not e!581143))))

(assert (=> d!123211 (= res!688567 (and (bvsge (index!41104 lt!453581) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453581) (size!31664 (_keys!11276 thiss!1427)))))))

(declare-fun lt!453735 () Unit!33605)

(declare-fun choose!1689 (array!64688 array!64690 (_ BitVec 32) (_ BitVec 32) V!37293 V!37293 (_ BitVec 32) (_ BitVec 64) Int) Unit!33605)

(assert (=> d!123211 (= lt!453735 (choose!1689 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (index!41104 lt!453581) key!909 (defaultEntry!6115 thiss!1427)))))

(assert (=> d!123211 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123211 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!10 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (index!41104 lt!453581) key!909 (defaultEntry!6115 thiss!1427)) lt!453735)))

(declare-fun b!1029335 () Bool)

(assert (=> b!1029335 (= e!581143 (= (-!484 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) key!909) (getCurrentListMap!3905 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))))))

(assert (=> b!1029335 (bvslt (index!41104 lt!453581) (size!31665 (_values!6138 thiss!1427)))))

(assert (= (and d!123211 res!688567) b!1029335))

(declare-fun b_lambda!15859 () Bool)

(assert (=> (not b_lambda!15859) (not b!1029335)))

(assert (=> b!1029335 t!30912))

(declare-fun b_and!32927 () Bool)

(assert (= b_and!32925 (and (=> t!30912 result!14149) b_and!32927)))

(declare-fun m!948535 () Bool)

(assert (=> d!123211 m!948535))

(assert (=> d!123211 m!948383))

(assert (=> b!1029335 m!948299))

(assert (=> b!1029335 m!948313))

(assert (=> b!1029335 m!948299))

(assert (=> b!1029335 m!948301))

(declare-fun m!948537 () Bool)

(assert (=> b!1029335 m!948537))

(assert (=> b!1029335 m!948319))

(assert (=> b!1029335 m!948287))

(assert (=> b!1029160 d!123211))

(declare-fun d!123213 () Bool)

(declare-fun e!581146 () Bool)

(assert (=> d!123213 e!581146))

(declare-fun res!688570 () Bool)

(assert (=> d!123213 (=> (not res!688570) (not e!581146))))

(assert (=> d!123213 (= res!688570 (bvslt (index!41104 lt!453581) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun lt!453738 () Unit!33605)

(declare-fun choose!121 (array!64688 (_ BitVec 32) (_ BitVec 64)) Unit!33605)

(assert (=> d!123213 (= lt!453738 (choose!121 (_keys!11276 thiss!1427) (index!41104 lt!453581) key!909))))

(assert (=> d!123213 (bvsge (index!41104 lt!453581) #b00000000000000000000000000000000)))

(assert (=> d!123213 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11276 thiss!1427) (index!41104 lt!453581) key!909) lt!453738)))

(declare-fun b!1029338 () Bool)

(assert (=> b!1029338 (= e!581146 (not (arrayContainsKey!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123213 res!688570) b!1029338))

(declare-fun m!948539 () Bool)

(assert (=> d!123213 m!948539))

(assert (=> b!1029338 m!948287))

(declare-fun m!948541 () Bool)

(assert (=> b!1029338 m!948541))

(assert (=> b!1029160 d!123213))

(declare-fun b!1029347 () Bool)

(declare-fun e!581151 () (_ BitVec 32))

(declare-fun e!581152 () (_ BitVec 32))

(assert (=> b!1029347 (= e!581151 e!581152)))

(declare-fun c!103964 () Bool)

(assert (=> b!1029347 (= c!103964 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43465 () Bool)

(declare-fun call!43468 () (_ BitVec 32))

(assert (=> bm!43465 (= call!43468 (arrayCountValidKeys!0 (_keys!11276 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029349 () Bool)

(assert (=> b!1029349 (= e!581152 call!43468)))

(declare-fun b!1029350 () Bool)

(assert (=> b!1029350 (= e!581152 (bvadd #b00000000000000000000000000000001 call!43468))))

(declare-fun d!123215 () Bool)

(declare-fun lt!453741 () (_ BitVec 32))

(assert (=> d!123215 (and (bvsge lt!453741 #b00000000000000000000000000000000) (bvsle lt!453741 (bvsub (size!31664 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123215 (= lt!453741 e!581151)))

(declare-fun c!103963 () Bool)

(assert (=> d!123215 (= c!103963 (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123215 (and (bvsle #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31664 (_keys!11276 thiss!1427)) (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123215 (= (arrayCountValidKeys!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) lt!453741)))

(declare-fun b!1029348 () Bool)

(assert (=> b!1029348 (= e!581151 #b00000000000000000000000000000000)))

(assert (= (and d!123215 c!103963) b!1029348))

(assert (= (and d!123215 (not c!103963)) b!1029347))

(assert (= (and b!1029347 c!103964) b!1029350))

(assert (= (and b!1029347 (not c!103964)) b!1029349))

(assert (= (or b!1029350 b!1029349) bm!43465))

(assert (=> b!1029347 m!948465))

(assert (=> b!1029347 m!948465))

(assert (=> b!1029347 m!948511))

(declare-fun m!948543 () Bool)

(assert (=> bm!43465 m!948543))

(assert (=> b!1029160 d!123215))

(declare-fun d!123217 () Bool)

(declare-fun res!688579 () Bool)

(declare-fun e!581162 () Bool)

(assert (=> d!123217 (=> res!688579 e!581162)))

(assert (=> d!123217 (= res!688579 (bvsge #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(assert (=> d!123217 (= (arrayNoDuplicates!0 lt!453576 #b00000000000000000000000000000000 Nil!21821) e!581162)))

(declare-fun b!1029361 () Bool)

(declare-fun e!581161 () Bool)

(declare-fun contains!5973 (List!21824 (_ BitVec 64)) Bool)

(assert (=> b!1029361 (= e!581161 (contains!5973 Nil!21821 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun bm!43468 () Bool)

(declare-fun call!43471 () Bool)

(declare-fun c!103967 () Bool)

(assert (=> bm!43468 (= call!43471 (arrayNoDuplicates!0 lt!453576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103967 (Cons!21820 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) Nil!21821) Nil!21821)))))

(declare-fun b!1029362 () Bool)

(declare-fun e!581164 () Bool)

(assert (=> b!1029362 (= e!581164 call!43471)))

(declare-fun b!1029363 () Bool)

(assert (=> b!1029363 (= e!581164 call!43471)))

(declare-fun b!1029364 () Bool)

(declare-fun e!581163 () Bool)

(assert (=> b!1029364 (= e!581162 e!581163)))

(declare-fun res!688577 () Bool)

(assert (=> b!1029364 (=> (not res!688577) (not e!581163))))

(assert (=> b!1029364 (= res!688577 (not e!581161))))

(declare-fun res!688578 () Bool)

(assert (=> b!1029364 (=> (not res!688578) (not e!581161))))

(assert (=> b!1029364 (= res!688578 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun b!1029365 () Bool)

(assert (=> b!1029365 (= e!581163 e!581164)))

(assert (=> b!1029365 (= c!103967 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (= (and d!123217 (not res!688579)) b!1029364))

(assert (= (and b!1029364 res!688578) b!1029361))

(assert (= (and b!1029364 res!688577) b!1029365))

(assert (= (and b!1029365 c!103967) b!1029363))

(assert (= (and b!1029365 (not c!103967)) b!1029362))

(assert (= (or b!1029363 b!1029362) bm!43468))

(assert (=> b!1029361 m!948395))

(assert (=> b!1029361 m!948395))

(declare-fun m!948545 () Bool)

(assert (=> b!1029361 m!948545))

(assert (=> bm!43468 m!948395))

(declare-fun m!948547 () Bool)

(assert (=> bm!43468 m!948547))

(assert (=> b!1029364 m!948395))

(assert (=> b!1029364 m!948395))

(assert (=> b!1029364 m!948441))

(assert (=> b!1029365 m!948395))

(assert (=> b!1029365 m!948395))

(assert (=> b!1029365 m!948441))

(assert (=> b!1029160 d!123217))

(declare-fun b!1029366 () Bool)

(declare-fun e!581165 () (_ BitVec 32))

(declare-fun e!581166 () (_ BitVec 32))

(assert (=> b!1029366 (= e!581165 e!581166)))

(declare-fun c!103969 () Bool)

(assert (=> b!1029366 (= c!103969 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun bm!43469 () Bool)

(declare-fun call!43472 () (_ BitVec 32))

(assert (=> bm!43469 (= call!43472 (arrayCountValidKeys!0 lt!453576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029368 () Bool)

(assert (=> b!1029368 (= e!581166 call!43472)))

(declare-fun b!1029369 () Bool)

(assert (=> b!1029369 (= e!581166 (bvadd #b00000000000000000000000000000001 call!43472))))

(declare-fun d!123219 () Bool)

(declare-fun lt!453742 () (_ BitVec 32))

(assert (=> d!123219 (and (bvsge lt!453742 #b00000000000000000000000000000000) (bvsle lt!453742 (bvsub (size!31664 lt!453576) #b00000000000000000000000000000000)))))

(assert (=> d!123219 (= lt!453742 e!581165)))

(declare-fun c!103968 () Bool)

(assert (=> d!123219 (= c!103968 (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123219 (and (bvsle #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31664 (_keys!11276 thiss!1427)) (size!31664 lt!453576)))))

(assert (=> d!123219 (= (arrayCountValidKeys!0 lt!453576 #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) lt!453742)))

(declare-fun b!1029367 () Bool)

(assert (=> b!1029367 (= e!581165 #b00000000000000000000000000000000)))

(assert (= (and d!123219 c!103968) b!1029367))

(assert (= (and d!123219 (not c!103968)) b!1029366))

(assert (= (and b!1029366 c!103969) b!1029369))

(assert (= (and b!1029366 (not c!103969)) b!1029368))

(assert (= (or b!1029369 b!1029368) bm!43469))

(assert (=> b!1029366 m!948395))

(assert (=> b!1029366 m!948395))

(assert (=> b!1029366 m!948441))

(declare-fun m!948549 () Bool)

(assert (=> bm!43469 m!948549))

(assert (=> b!1029160 d!123219))

(declare-fun d!123221 () Bool)

(declare-fun res!688584 () Bool)

(declare-fun e!581171 () Bool)

(assert (=> d!123221 (=> res!688584 e!581171)))

(assert (=> d!123221 (= res!688584 (= (select (arr!31149 lt!453576) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123221 (= (arrayContainsKey!0 lt!453576 key!909 #b00000000000000000000000000000000) e!581171)))

(declare-fun b!1029374 () Bool)

(declare-fun e!581172 () Bool)

(assert (=> b!1029374 (= e!581171 e!581172)))

(declare-fun res!688585 () Bool)

(assert (=> b!1029374 (=> (not res!688585) (not e!581172))))

(assert (=> b!1029374 (= res!688585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 lt!453576)))))

(declare-fun b!1029375 () Bool)

(assert (=> b!1029375 (= e!581172 (arrayContainsKey!0 lt!453576 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123221 (not res!688584)) b!1029374))

(assert (= (and b!1029374 res!688585) b!1029375))

(assert (=> d!123221 m!948395))

(declare-fun m!948551 () Bool)

(assert (=> b!1029375 m!948551))

(assert (=> b!1029160 d!123221))

(declare-fun mapIsEmpty!37921 () Bool)

(declare-fun mapRes!37921 () Bool)

(assert (=> mapIsEmpty!37921 mapRes!37921))

(declare-fun mapNonEmpty!37921 () Bool)

(declare-fun tp!72854 () Bool)

(declare-fun e!581177 () Bool)

(assert (=> mapNonEmpty!37921 (= mapRes!37921 (and tp!72854 e!581177))))

(declare-fun mapValue!37921 () ValueCell!11454)

(declare-fun mapKey!37921 () (_ BitVec 32))

(declare-fun mapRest!37921 () (Array (_ BitVec 32) ValueCell!11454))

(assert (=> mapNonEmpty!37921 (= mapRest!37915 (store mapRest!37921 mapKey!37921 mapValue!37921))))

(declare-fun condMapEmpty!37921 () Bool)

(declare-fun mapDefault!37921 () ValueCell!11454)

(assert (=> mapNonEmpty!37915 (= condMapEmpty!37921 (= mapRest!37915 ((as const (Array (_ BitVec 32) ValueCell!11454)) mapDefault!37921)))))

(declare-fun e!581178 () Bool)

(assert (=> mapNonEmpty!37915 (= tp!72844 (and e!581178 mapRes!37921))))

(declare-fun b!1029383 () Bool)

(assert (=> b!1029383 (= e!581178 tp_is_empty!24315)))

(declare-fun b!1029382 () Bool)

(assert (=> b!1029382 (= e!581177 tp_is_empty!24315)))

(assert (= (and mapNonEmpty!37915 condMapEmpty!37921) mapIsEmpty!37921))

(assert (= (and mapNonEmpty!37915 (not condMapEmpty!37921)) mapNonEmpty!37921))

(assert (= (and mapNonEmpty!37921 ((_ is ValueCellFull!11454) mapValue!37921)) b!1029382))

(assert (= (and mapNonEmpty!37915 ((_ is ValueCellFull!11454) mapDefault!37921)) b!1029383))

(declare-fun m!948553 () Bool)

(assert (=> mapNonEmpty!37921 m!948553))

(declare-fun b_lambda!15861 () Bool)

(assert (= b_lambda!15859 (or (and b!1029162 b_free!20595) b_lambda!15861)))

(declare-fun b_lambda!15863 () Bool)

(assert (= b_lambda!15857 (or (and b!1029162 b_free!20595) b_lambda!15863)))

(declare-fun b_lambda!15865 () Bool)

(assert (= b_lambda!15855 (or (and b!1029162 b_free!20595) b_lambda!15865)))

(check-sat (not b!1029313) (not d!123189) (not bm!43451) (not d!123195) (not b!1029361) (not b!1029326) (not b_lambda!15861) (not b!1029332) (not b!1029270) (not b!1029267) (not bm!43465) (not b!1029312) (not b!1029265) (not b!1029281) (not bm!43456) (not d!123211) b_and!32927 (not b!1029317) (not b!1029216) (not b!1029314) (not b!1029284) (not bm!43468) (not bm!43448) (not d!123203) (not b!1029277) (not b!1029366) (not b!1029335) (not b!1029375) (not b_lambda!15865) (not mapNonEmpty!37921) tp_is_empty!24315 (not bm!43455) (not b!1029296) (not b_lambda!15853) (not d!123197) (not bm!43454) (not bm!43458) (not bm!43447) (not b!1029293) (not b!1029278) (not b!1029275) (not b!1029276) (not b!1029303) (not b!1029364) (not d!123213) (not b!1029328) (not b!1029218) (not b!1029206) (not d!123209) (not bm!43469) (not b!1029301) (not b_next!20595) (not b!1029306) (not b!1029294) (not b!1029217) (not bm!43462) (not b!1029311) (not d!123187) (not bm!43449) (not b!1029365) (not d!123201) (not b!1029347) (not b_lambda!15863) (not d!123205) (not b!1029338))
(check-sat b_and!32927 (not b_next!20595))
(get-model)

(declare-fun b!1029384 () Bool)

(declare-fun e!581179 () (_ BitVec 32))

(declare-fun e!581180 () (_ BitVec 32))

(assert (=> b!1029384 (= e!581179 e!581180)))

(declare-fun c!103971 () Bool)

(assert (=> b!1029384 (= c!103971 (validKeyInArray!0 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43470 () Bool)

(declare-fun call!43473 () (_ BitVec 32))

(assert (=> bm!43470 (= call!43473 (arrayCountValidKeys!0 lt!453576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029386 () Bool)

(assert (=> b!1029386 (= e!581180 call!43473)))

(declare-fun b!1029387 () Bool)

(assert (=> b!1029387 (= e!581180 (bvadd #b00000000000000000000000000000001 call!43473))))

(declare-fun d!123223 () Bool)

(declare-fun lt!453743 () (_ BitVec 32))

(assert (=> d!123223 (and (bvsge lt!453743 #b00000000000000000000000000000000) (bvsle lt!453743 (bvsub (size!31664 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123223 (= lt!453743 e!581179)))

(declare-fun c!103970 () Bool)

(assert (=> d!123223 (= c!103970 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123223 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31664 (_keys!11276 thiss!1427)) (size!31664 lt!453576)))))

(assert (=> d!123223 (= (arrayCountValidKeys!0 lt!453576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))) lt!453743)))

(declare-fun b!1029385 () Bool)

(assert (=> b!1029385 (= e!581179 #b00000000000000000000000000000000)))

(assert (= (and d!123223 c!103970) b!1029385))

(assert (= (and d!123223 (not c!103970)) b!1029384))

(assert (= (and b!1029384 c!103971) b!1029387))

(assert (= (and b!1029384 (not c!103971)) b!1029386))

(assert (= (or b!1029387 b!1029386) bm!43470))

(declare-fun m!948555 () Bool)

(assert (=> b!1029384 m!948555))

(assert (=> b!1029384 m!948555))

(declare-fun m!948557 () Bool)

(assert (=> b!1029384 m!948557))

(declare-fun m!948559 () Bool)

(assert (=> bm!43470 m!948559))

(assert (=> bm!43469 d!123223))

(assert (=> b!1029216 d!123215))

(declare-fun d!123225 () Bool)

(assert (=> d!123225 (= (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) (and (not (= (select (arr!31149 lt!453576) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31149 lt!453576) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029276 d!123225))

(declare-fun d!123227 () Bool)

(declare-datatypes ((Option!637 0))(
  ( (Some!636 (v!14784 V!37293)) (None!635) )
))
(declare-fun get!16357 (Option!637) V!37293)

(declare-fun getValueByKey!586 (List!21823 (_ BitVec 64)) Option!637)

(assert (=> d!123227 (= (apply!903 lt!453713 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)) (get!16357 (getValueByKey!586 (toList!6857 lt!453713) (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30057 () Bool)

(assert (= bs!30057 d!123227))

(assert (=> bs!30057 m!948465))

(declare-fun m!948561 () Bool)

(assert (=> bs!30057 m!948561))

(assert (=> bs!30057 m!948561))

(declare-fun m!948563 () Bool)

(assert (=> bs!30057 m!948563))

(assert (=> b!1029317 d!123227))

(declare-fun d!123229 () Bool)

(declare-fun c!103974 () Bool)

(assert (=> d!123229 (= c!103974 ((_ is ValueCellFull!11454) (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581183 () V!37293)

(assert (=> d!123229 (= (get!16356 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581183)))

(declare-fun b!1029392 () Bool)

(declare-fun get!16358 (ValueCell!11454 V!37293) V!37293)

(assert (=> b!1029392 (= e!581183 (get!16358 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029393 () Bool)

(declare-fun get!16359 (ValueCell!11454 V!37293) V!37293)

(assert (=> b!1029393 (= e!581183 (get!16359 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123229 c!103974) b!1029392))

(assert (= (and d!123229 (not c!103974)) b!1029393))

(assert (=> b!1029392 m!948507))

(assert (=> b!1029392 m!948319))

(declare-fun m!948565 () Bool)

(assert (=> b!1029392 m!948565))

(assert (=> b!1029393 m!948507))

(assert (=> b!1029393 m!948319))

(declare-fun m!948567 () Bool)

(assert (=> b!1029393 m!948567))

(assert (=> b!1029317 d!123229))

(declare-fun b!1029412 () Bool)

(declare-fun e!581195 () Bool)

(declare-fun lt!453748 () SeekEntryResult!9683)

(assert (=> b!1029412 (= e!581195 (bvsge (x!91589 lt!453748) #b01111111111111111111111111111110))))

(declare-fun b!1029413 () Bool)

(declare-fun e!581194 () SeekEntryResult!9683)

(assert (=> b!1029413 (= e!581194 (Intermediate!9683 false (toIndex!0 key!909 (mask!29867 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029414 () Bool)

(declare-fun e!581196 () SeekEntryResult!9683)

(assert (=> b!1029414 (= e!581196 (Intermediate!9683 true (toIndex!0 key!909 (mask!29867 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029415 () Bool)

(assert (=> b!1029415 (= e!581196 e!581194)))

(declare-fun c!103981 () Bool)

(declare-fun lt!453749 () (_ BitVec 64))

(assert (=> b!1029415 (= c!103981 (or (= lt!453749 key!909) (= (bvadd lt!453749 lt!453749) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029416 () Bool)

(assert (=> b!1029416 (and (bvsge (index!41105 lt!453748) #b00000000000000000000000000000000) (bvslt (index!41105 lt!453748) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun res!688594 () Bool)

(assert (=> b!1029416 (= res!688594 (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41105 lt!453748)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581198 () Bool)

(assert (=> b!1029416 (=> res!688594 e!581198)))

(declare-fun b!1029417 () Bool)

(declare-fun e!581197 () Bool)

(assert (=> b!1029417 (= e!581195 e!581197)))

(declare-fun res!688593 () Bool)

(assert (=> b!1029417 (= res!688593 (and ((_ is Intermediate!9683) lt!453748) (not (undefined!10495 lt!453748)) (bvslt (x!91589 lt!453748) #b01111111111111111111111111111110) (bvsge (x!91589 lt!453748) #b00000000000000000000000000000000) (bvsge (x!91589 lt!453748) #b00000000000000000000000000000000)))))

(assert (=> b!1029417 (=> (not res!688593) (not e!581197))))

(declare-fun b!1029418 () Bool)

(assert (=> b!1029418 (and (bvsge (index!41105 lt!453748) #b00000000000000000000000000000000) (bvslt (index!41105 lt!453748) (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> b!1029418 (= e!581198 (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41105 lt!453748)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029419 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029419 (= e!581194 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29867 thiss!1427)) #b00000000000000000000000000000000 (mask!29867 thiss!1427)) key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(declare-fun b!1029420 () Bool)

(assert (=> b!1029420 (and (bvsge (index!41105 lt!453748) #b00000000000000000000000000000000) (bvslt (index!41105 lt!453748) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun res!688592 () Bool)

(assert (=> b!1029420 (= res!688592 (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41105 lt!453748)) key!909))))

(assert (=> b!1029420 (=> res!688592 e!581198)))

(assert (=> b!1029420 (= e!581197 e!581198)))

(declare-fun d!123231 () Bool)

(assert (=> d!123231 e!581195))

(declare-fun c!103983 () Bool)

(assert (=> d!123231 (= c!103983 (and ((_ is Intermediate!9683) lt!453748) (undefined!10495 lt!453748)))))

(assert (=> d!123231 (= lt!453748 e!581196)))

(declare-fun c!103982 () Bool)

(assert (=> d!123231 (= c!103982 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!123231 (= lt!453749 (select (arr!31149 (_keys!11276 thiss!1427)) (toIndex!0 key!909 (mask!29867 thiss!1427))))))

(assert (=> d!123231 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29867 thiss!1427)) key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)) lt!453748)))

(assert (= (and d!123231 c!103982) b!1029414))

(assert (= (and d!123231 (not c!103982)) b!1029415))

(assert (= (and b!1029415 c!103981) b!1029413))

(assert (= (and b!1029415 (not c!103981)) b!1029419))

(assert (= (and d!123231 c!103983) b!1029412))

(assert (= (and d!123231 (not c!103983)) b!1029417))

(assert (= (and b!1029417 res!688593) b!1029420))

(assert (= (and b!1029420 (not res!688592)) b!1029416))

(assert (= (and b!1029416 (not res!688594)) b!1029418))

(declare-fun m!948569 () Bool)

(assert (=> b!1029416 m!948569))

(assert (=> d!123231 m!948379))

(declare-fun m!948571 () Bool)

(assert (=> d!123231 m!948571))

(assert (=> d!123231 m!948383))

(assert (=> b!1029418 m!948569))

(assert (=> b!1029419 m!948379))

(declare-fun m!948573 () Bool)

(assert (=> b!1029419 m!948573))

(assert (=> b!1029419 m!948573))

(declare-fun m!948575 () Bool)

(assert (=> b!1029419 m!948575))

(assert (=> b!1029420 m!948569))

(assert (=> d!123187 d!123231))

(declare-fun d!123233 () Bool)

(declare-fun lt!453755 () (_ BitVec 32))

(declare-fun lt!453754 () (_ BitVec 32))

(assert (=> d!123233 (= lt!453755 (bvmul (bvxor lt!453754 (bvlshr lt!453754 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123233 (= lt!453754 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123233 (and (bvsge (mask!29867 thiss!1427) #b00000000000000000000000000000000) (let ((res!688595 (let ((h!23023 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91620 (bvmul (bvxor h!23023 (bvlshr h!23023 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91620 (bvlshr x!91620 #b00000000000000000000000000001101)) (mask!29867 thiss!1427)))))) (and (bvslt res!688595 (bvadd (mask!29867 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688595 #b00000000000000000000000000000000))))))

(assert (=> d!123233 (= (toIndex!0 key!909 (mask!29867 thiss!1427)) (bvand (bvxor lt!453755 (bvlshr lt!453755 #b00000000000000000000000000001101)) (mask!29867 thiss!1427)))))

(assert (=> d!123187 d!123233))

(declare-fun d!123235 () Bool)

(assert (=> d!123235 (= (validMask!0 (mask!29867 thiss!1427)) (and (or (= (mask!29867 thiss!1427) #b00000000000000000000000000000111) (= (mask!29867 thiss!1427) #b00000000000000000000000000001111) (= (mask!29867 thiss!1427) #b00000000000000000000000000011111) (= (mask!29867 thiss!1427) #b00000000000000000000000000111111) (= (mask!29867 thiss!1427) #b00000000000000000000000001111111) (= (mask!29867 thiss!1427) #b00000000000000000000000011111111) (= (mask!29867 thiss!1427) #b00000000000000000000000111111111) (= (mask!29867 thiss!1427) #b00000000000000000000001111111111) (= (mask!29867 thiss!1427) #b00000000000000000000011111111111) (= (mask!29867 thiss!1427) #b00000000000000000000111111111111) (= (mask!29867 thiss!1427) #b00000000000000000001111111111111) (= (mask!29867 thiss!1427) #b00000000000000000011111111111111) (= (mask!29867 thiss!1427) #b00000000000000000111111111111111) (= (mask!29867 thiss!1427) #b00000000000000001111111111111111) (= (mask!29867 thiss!1427) #b00000000000000011111111111111111) (= (mask!29867 thiss!1427) #b00000000000000111111111111111111) (= (mask!29867 thiss!1427) #b00000000000001111111111111111111) (= (mask!29867 thiss!1427) #b00000000000011111111111111111111) (= (mask!29867 thiss!1427) #b00000000000111111111111111111111) (= (mask!29867 thiss!1427) #b00000000001111111111111111111111) (= (mask!29867 thiss!1427) #b00000000011111111111111111111111) (= (mask!29867 thiss!1427) #b00000000111111111111111111111111) (= (mask!29867 thiss!1427) #b00000001111111111111111111111111) (= (mask!29867 thiss!1427) #b00000011111111111111111111111111) (= (mask!29867 thiss!1427) #b00000111111111111111111111111111) (= (mask!29867 thiss!1427) #b00001111111111111111111111111111) (= (mask!29867 thiss!1427) #b00011111111111111111111111111111) (= (mask!29867 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29867 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123187 d!123235))

(declare-fun b!1029421 () Bool)

(declare-fun e!581199 () Bool)

(declare-fun e!581200 () Bool)

(assert (=> b!1029421 (= e!581199 e!581200)))

(declare-fun c!103984 () Bool)

(assert (=> b!1029421 (= c!103984 (validKeyInArray!0 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029422 () Bool)

(declare-fun call!43474 () Bool)

(assert (=> b!1029422 (= e!581200 call!43474)))

(declare-fun b!1029423 () Bool)

(declare-fun e!581201 () Bool)

(assert (=> b!1029423 (= e!581200 e!581201)))

(declare-fun lt!453757 () (_ BitVec 64))

(assert (=> b!1029423 (= lt!453757 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!453758 () Unit!33605)

(assert (=> b!1029423 (= lt!453758 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453576 lt!453757 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1029423 (arrayContainsKey!0 lt!453576 lt!453757 #b00000000000000000000000000000000)))

(declare-fun lt!453756 () Unit!33605)

(assert (=> b!1029423 (= lt!453756 lt!453758)))

(declare-fun res!688596 () Bool)

(assert (=> b!1029423 (= res!688596 (= (seekEntryOrOpen!0 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!453576 (mask!29867 thiss!1427)) (Found!9683 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1029423 (=> (not res!688596) (not e!581201))))

(declare-fun b!1029424 () Bool)

(assert (=> b!1029424 (= e!581201 call!43474)))

(declare-fun d!123237 () Bool)

(declare-fun res!688597 () Bool)

(assert (=> d!123237 (=> res!688597 e!581199)))

(assert (=> d!123237 (= res!688597 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 lt!453576)))))

(assert (=> d!123237 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453576 (mask!29867 thiss!1427)) e!581199)))

(declare-fun bm!43471 () Bool)

(assert (=> bm!43471 (= call!43474 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!453576 (mask!29867 thiss!1427)))))

(assert (= (and d!123237 (not res!688597)) b!1029421))

(assert (= (and b!1029421 c!103984) b!1029423))

(assert (= (and b!1029421 (not c!103984)) b!1029422))

(assert (= (and b!1029423 res!688596) b!1029424))

(assert (= (or b!1029424 b!1029422) bm!43471))

(assert (=> b!1029421 m!948555))

(assert (=> b!1029421 m!948555))

(assert (=> b!1029421 m!948557))

(assert (=> b!1029423 m!948555))

(declare-fun m!948577 () Bool)

(assert (=> b!1029423 m!948577))

(declare-fun m!948579 () Bool)

(assert (=> b!1029423 m!948579))

(assert (=> b!1029423 m!948555))

(declare-fun m!948581 () Bool)

(assert (=> b!1029423 m!948581))

(declare-fun m!948583 () Bool)

(assert (=> bm!43471 m!948583))

(assert (=> bm!43462 d!123237))

(declare-fun d!123239 () Bool)

(declare-fun e!581206 () Bool)

(assert (=> d!123239 e!581206))

(declare-fun res!688600 () Bool)

(assert (=> d!123239 (=> res!688600 e!581206)))

(declare-fun lt!453769 () Bool)

(assert (=> d!123239 (= res!688600 (not lt!453769))))

(declare-fun lt!453770 () Bool)

(assert (=> d!123239 (= lt!453769 lt!453770)))

(declare-fun lt!453768 () Unit!33605)

(declare-fun e!581207 () Unit!33605)

(assert (=> d!123239 (= lt!453768 e!581207)))

(declare-fun c!103987 () Bool)

(assert (=> d!123239 (= c!103987 lt!453770)))

(declare-fun containsKey!561 (List!21823 (_ BitVec 64)) Bool)

(assert (=> d!123239 (= lt!453770 (containsKey!561 (toList!6857 lt!453713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123239 (= (contains!5972 lt!453713 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453769)))

(declare-fun b!1029431 () Bool)

(declare-fun lt!453767 () Unit!33605)

(assert (=> b!1029431 (= e!581207 lt!453767)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!394 (List!21823 (_ BitVec 64)) Unit!33605)

(assert (=> b!1029431 (= lt!453767 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!433 (Option!637) Bool)

(assert (=> b!1029431 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029432 () Bool)

(declare-fun Unit!33615 () Unit!33605)

(assert (=> b!1029432 (= e!581207 Unit!33615)))

(declare-fun b!1029433 () Bool)

(assert (=> b!1029433 (= e!581206 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123239 c!103987) b!1029431))

(assert (= (and d!123239 (not c!103987)) b!1029432))

(assert (= (and d!123239 (not res!688600)) b!1029433))

(declare-fun m!948585 () Bool)

(assert (=> d!123239 m!948585))

(declare-fun m!948587 () Bool)

(assert (=> b!1029431 m!948587))

(declare-fun m!948589 () Bool)

(assert (=> b!1029431 m!948589))

(assert (=> b!1029431 m!948589))

(declare-fun m!948591 () Bool)

(assert (=> b!1029431 m!948591))

(assert (=> b!1029433 m!948589))

(assert (=> b!1029433 m!948589))

(assert (=> b!1029433 m!948591))

(assert (=> bm!43458 d!123239))

(declare-fun b!1029434 () Bool)

(declare-fun e!581208 () (_ BitVec 32))

(declare-fun e!581209 () (_ BitVec 32))

(assert (=> b!1029434 (= e!581208 e!581209)))

(declare-fun c!103989 () Bool)

(assert (=> b!1029434 (= c!103989 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43472 () Bool)

(declare-fun call!43475 () (_ BitVec 32))

(assert (=> bm!43472 (= call!43475 (arrayCountValidKeys!0 (_keys!11276 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029436 () Bool)

(assert (=> b!1029436 (= e!581209 call!43475)))

(declare-fun b!1029437 () Bool)

(assert (=> b!1029437 (= e!581209 (bvadd #b00000000000000000000000000000001 call!43475))))

(declare-fun d!123241 () Bool)

(declare-fun lt!453771 () (_ BitVec 32))

(assert (=> d!123241 (and (bvsge lt!453771 #b00000000000000000000000000000000) (bvsle lt!453771 (bvsub (size!31664 (_keys!11276 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123241 (= lt!453771 e!581208)))

(declare-fun c!103988 () Bool)

(assert (=> d!123241 (= c!103988 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123241 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31664 (_keys!11276 thiss!1427)) (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123241 (= (arrayCountValidKeys!0 (_keys!11276 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))) lt!453771)))

(declare-fun b!1029435 () Bool)

(assert (=> b!1029435 (= e!581208 #b00000000000000000000000000000000)))

(assert (= (and d!123241 c!103988) b!1029435))

(assert (= (and d!123241 (not c!103988)) b!1029434))

(assert (= (and b!1029434 c!103989) b!1029437))

(assert (= (and b!1029434 (not c!103989)) b!1029436))

(assert (= (or b!1029437 b!1029436) bm!43472))

(declare-fun m!948593 () Bool)

(assert (=> b!1029434 m!948593))

(assert (=> b!1029434 m!948593))

(declare-fun m!948595 () Bool)

(assert (=> b!1029434 m!948595))

(declare-fun m!948597 () Bool)

(assert (=> bm!43472 m!948597))

(assert (=> bm!43465 d!123241))

(declare-fun d!123243 () Bool)

(assert (=> d!123243 (arrayContainsKey!0 lt!453576 lt!453728 #b00000000000000000000000000000000)))

(declare-fun lt!453774 () Unit!33605)

(declare-fun choose!13 (array!64688 (_ BitVec 64) (_ BitVec 32)) Unit!33605)

(assert (=> d!123243 (= lt!453774 (choose!13 lt!453576 lt!453728 #b00000000000000000000000000000000))))

(assert (=> d!123243 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123243 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453576 lt!453728 #b00000000000000000000000000000000) lt!453774)))

(declare-fun bs!30058 () Bool)

(assert (= bs!30058 d!123243))

(assert (=> bs!30058 m!948525))

(declare-fun m!948599 () Bool)

(assert (=> bs!30058 m!948599))

(assert (=> b!1029328 d!123243))

(declare-fun d!123245 () Bool)

(declare-fun res!688601 () Bool)

(declare-fun e!581210 () Bool)

(assert (=> d!123245 (=> res!688601 e!581210)))

(assert (=> d!123245 (= res!688601 (= (select (arr!31149 lt!453576) #b00000000000000000000000000000000) lt!453728))))

(assert (=> d!123245 (= (arrayContainsKey!0 lt!453576 lt!453728 #b00000000000000000000000000000000) e!581210)))

(declare-fun b!1029438 () Bool)

(declare-fun e!581211 () Bool)

(assert (=> b!1029438 (= e!581210 e!581211)))

(declare-fun res!688602 () Bool)

(assert (=> b!1029438 (=> (not res!688602) (not e!581211))))

(assert (=> b!1029438 (= res!688602 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 lt!453576)))))

(declare-fun b!1029439 () Bool)

(assert (=> b!1029439 (= e!581211 (arrayContainsKey!0 lt!453576 lt!453728 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123245 (not res!688601)) b!1029438))

(assert (= (and b!1029438 res!688602) b!1029439))

(assert (=> d!123245 m!948395))

(declare-fun m!948601 () Bool)

(assert (=> b!1029439 m!948601))

(assert (=> b!1029328 d!123245))

(declare-fun b!1029452 () Bool)

(declare-fun c!103997 () Bool)

(declare-fun lt!453782 () (_ BitVec 64))

(assert (=> b!1029452 (= c!103997 (= lt!453782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581219 () SeekEntryResult!9683)

(declare-fun e!581220 () SeekEntryResult!9683)

(assert (=> b!1029452 (= e!581219 e!581220)))

(declare-fun b!1029453 () Bool)

(declare-fun lt!453783 () SeekEntryResult!9683)

(assert (=> b!1029453 (= e!581220 (MissingZero!9683 (index!41105 lt!453783)))))

(declare-fun b!1029454 () Bool)

(assert (=> b!1029454 (= e!581219 (Found!9683 (index!41105 lt!453783)))))

(declare-fun b!1029455 () Bool)

(assert (=> b!1029455 (= e!581220 (seekKeyOrZeroReturnVacant!0 (x!91589 lt!453783) (index!41105 lt!453783) (index!41105 lt!453783) (select (arr!31149 lt!453576) #b00000000000000000000000000000000) lt!453576 (mask!29867 thiss!1427)))))

(declare-fun d!123247 () Bool)

(declare-fun lt!453781 () SeekEntryResult!9683)

(assert (=> d!123247 (and (or ((_ is Undefined!9683) lt!453781) (not ((_ is Found!9683) lt!453781)) (and (bvsge (index!41104 lt!453781) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453781) (size!31664 lt!453576)))) (or ((_ is Undefined!9683) lt!453781) ((_ is Found!9683) lt!453781) (not ((_ is MissingZero!9683) lt!453781)) (and (bvsge (index!41103 lt!453781) #b00000000000000000000000000000000) (bvslt (index!41103 lt!453781) (size!31664 lt!453576)))) (or ((_ is Undefined!9683) lt!453781) ((_ is Found!9683) lt!453781) ((_ is MissingZero!9683) lt!453781) (not ((_ is MissingVacant!9683) lt!453781)) (and (bvsge (index!41106 lt!453781) #b00000000000000000000000000000000) (bvslt (index!41106 lt!453781) (size!31664 lt!453576)))) (or ((_ is Undefined!9683) lt!453781) (ite ((_ is Found!9683) lt!453781) (= (select (arr!31149 lt!453576) (index!41104 lt!453781)) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9683) lt!453781) (= (select (arr!31149 lt!453576) (index!41103 lt!453781)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9683) lt!453781) (= (select (arr!31149 lt!453576) (index!41106 lt!453781)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!581218 () SeekEntryResult!9683)

(assert (=> d!123247 (= lt!453781 e!581218)))

(declare-fun c!103998 () Bool)

(assert (=> d!123247 (= c!103998 (and ((_ is Intermediate!9683) lt!453783) (undefined!10495 lt!453783)))))

(assert (=> d!123247 (= lt!453783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) (mask!29867 thiss!1427)) (select (arr!31149 lt!453576) #b00000000000000000000000000000000) lt!453576 (mask!29867 thiss!1427)))))

(assert (=> d!123247 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123247 (= (seekEntryOrOpen!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) lt!453576 (mask!29867 thiss!1427)) lt!453781)))

(declare-fun b!1029456 () Bool)

(assert (=> b!1029456 (= e!581218 Undefined!9683)))

(declare-fun b!1029457 () Bool)

(assert (=> b!1029457 (= e!581218 e!581219)))

(assert (=> b!1029457 (= lt!453782 (select (arr!31149 lt!453576) (index!41105 lt!453783)))))

(declare-fun c!103996 () Bool)

(assert (=> b!1029457 (= c!103996 (= lt!453782 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (= (and d!123247 c!103998) b!1029456))

(assert (= (and d!123247 (not c!103998)) b!1029457))

(assert (= (and b!1029457 c!103996) b!1029454))

(assert (= (and b!1029457 (not c!103996)) b!1029452))

(assert (= (and b!1029452 c!103997) b!1029453))

(assert (= (and b!1029452 (not c!103997)) b!1029455))

(assert (=> b!1029455 m!948395))

(declare-fun m!948603 () Bool)

(assert (=> b!1029455 m!948603))

(assert (=> d!123247 m!948395))

(declare-fun m!948605 () Bool)

(assert (=> d!123247 m!948605))

(declare-fun m!948607 () Bool)

(assert (=> d!123247 m!948607))

(declare-fun m!948609 () Bool)

(assert (=> d!123247 m!948609))

(declare-fun m!948611 () Bool)

(assert (=> d!123247 m!948611))

(assert (=> d!123247 m!948605))

(assert (=> d!123247 m!948395))

(declare-fun m!948613 () Bool)

(assert (=> d!123247 m!948613))

(assert (=> d!123247 m!948383))

(declare-fun m!948615 () Bool)

(assert (=> b!1029457 m!948615))

(assert (=> b!1029328 d!123247))

(declare-fun d!123249 () Bool)

(declare-fun e!581223 () Bool)

(assert (=> d!123249 e!581223))

(declare-fun res!688607 () Bool)

(assert (=> d!123249 (=> (not res!688607) (not e!581223))))

(declare-fun lt!453794 () ListLongMap!13683)

(assert (=> d!123249 (= res!688607 (contains!5972 lt!453794 (_1!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(declare-fun lt!453795 () List!21823)

(assert (=> d!123249 (= lt!453794 (ListLongMap!13684 lt!453795))))

(declare-fun lt!453793 () Unit!33605)

(declare-fun lt!453792 () Unit!33605)

(assert (=> d!123249 (= lt!453793 lt!453792)))

(assert (=> d!123249 (= (getValueByKey!586 lt!453795 (_1!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))) (Some!636 (_2!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!277 (List!21823 (_ BitVec 64) V!37293) Unit!33605)

(assert (=> d!123249 (= lt!453792 (lemmaContainsTupThenGetReturnValue!277 lt!453795 (_1!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (_2!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(declare-fun insertStrictlySorted!370 (List!21823 (_ BitVec 64) V!37293) List!21823)

(assert (=> d!123249 (= lt!453795 (insertStrictlySorted!370 (toList!6857 (ite c!103947 call!43451 (ite c!103944 call!43455 call!43453))) (_1!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (_2!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(assert (=> d!123249 (= (+!3101 (ite c!103947 call!43451 (ite c!103944 call!43455 call!43453)) (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) lt!453794)))

(declare-fun b!1029462 () Bool)

(declare-fun res!688608 () Bool)

(assert (=> b!1029462 (=> (not res!688608) (not e!581223))))

(assert (=> b!1029462 (= res!688608 (= (getValueByKey!586 (toList!6857 lt!453794) (_1!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))) (Some!636 (_2!7791 (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))))

(declare-fun b!1029463 () Bool)

(declare-fun contains!5974 (List!21823 tuple2!15560) Bool)

(assert (=> b!1029463 (= e!581223 (contains!5974 (toList!6857 lt!453794) (ite (or c!103947 c!103944) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (= (and d!123249 res!688607) b!1029462))

(assert (= (and b!1029462 res!688608) b!1029463))

(declare-fun m!948617 () Bool)

(assert (=> d!123249 m!948617))

(declare-fun m!948619 () Bool)

(assert (=> d!123249 m!948619))

(declare-fun m!948621 () Bool)

(assert (=> d!123249 m!948621))

(declare-fun m!948623 () Bool)

(assert (=> d!123249 m!948623))

(declare-fun m!948625 () Bool)

(assert (=> b!1029462 m!948625))

(declare-fun m!948627 () Bool)

(assert (=> b!1029463 m!948627))

(assert (=> bm!43448 d!123249))

(assert (=> b!1029326 d!123225))

(declare-fun d!123251 () Bool)

(assert (=> d!123251 (= (apply!903 lt!453713 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16357 (getValueByKey!586 (toList!6857 lt!453713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30059 () Bool)

(assert (= bs!30059 d!123251))

(assert (=> bs!30059 m!948589))

(assert (=> bs!30059 m!948589))

(declare-fun m!948629 () Bool)

(assert (=> bs!30059 m!948629))

(assert (=> b!1029313 d!123251))

(assert (=> b!1029335 d!123205))

(assert (=> b!1029335 d!123203))

(declare-fun bm!43473 () Bool)

(declare-fun call!43482 () ListLongMap!13683)

(declare-fun call!43478 () ListLongMap!13683)

(assert (=> bm!43473 (= call!43482 call!43478)))

(declare-fun b!1029464 () Bool)

(declare-fun e!581229 () Bool)

(declare-fun call!43477 () Bool)

(assert (=> b!1029464 (= e!581229 (not call!43477))))

(declare-fun b!1029465 () Bool)

(declare-fun c!104001 () Bool)

(assert (=> b!1029465 (= c!104001 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581236 () ListLongMap!13683)

(declare-fun e!581225 () ListLongMap!13683)

(assert (=> b!1029465 (= e!581236 e!581225)))

(declare-fun b!1029466 () Bool)

(declare-fun e!581233 () Bool)

(declare-fun call!43481 () Bool)

(assert (=> b!1029466 (= e!581233 (not call!43481))))

(declare-fun b!1029467 () Bool)

(declare-fun call!43480 () ListLongMap!13683)

(assert (=> b!1029467 (= e!581225 call!43480)))

(declare-fun b!1029468 () Bool)

(declare-fun e!581230 () Bool)

(assert (=> b!1029468 (= e!581230 (validKeyInArray!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029469 () Bool)

(declare-fun e!581226 () Bool)

(assert (=> b!1029469 (= e!581233 e!581226)))

(declare-fun res!688611 () Bool)

(assert (=> b!1029469 (= res!688611 call!43481)))

(assert (=> b!1029469 (=> (not res!688611) (not e!581226))))

(declare-fun b!1029470 () Bool)

(declare-fun lt!453813 () ListLongMap!13683)

(assert (=> b!1029470 (= e!581226 (= (apply!903 lt!453813 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5951 thiss!1427)))))

(declare-fun b!1029471 () Bool)

(declare-fun call!43476 () ListLongMap!13683)

(assert (=> b!1029471 (= e!581225 call!43476)))

(declare-fun bm!43474 () Bool)

(assert (=> bm!43474 (= call!43481 (contains!5972 lt!453813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029472 () Bool)

(assert (=> b!1029472 (= e!581236 call!43476)))

(declare-fun c!104002 () Bool)

(declare-fun c!103999 () Bool)

(declare-fun bm!43475 () Bool)

(declare-fun call!43479 () ListLongMap!13683)

(assert (=> bm!43475 (= call!43479 (+!3101 (ite c!104002 call!43478 (ite c!103999 call!43482 call!43480)) (ite (or c!104002 c!103999) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(declare-fun b!1029473 () Bool)

(declare-fun e!581227 () Bool)

(declare-fun e!581235 () Bool)

(assert (=> b!1029473 (= e!581227 e!581235)))

(declare-fun res!688612 () Bool)

(assert (=> b!1029473 (=> (not res!688612) (not e!581235))))

(assert (=> b!1029473 (= res!688612 (contains!5972 lt!453813 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1029473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(declare-fun b!1029474 () Bool)

(declare-fun e!581228 () ListLongMap!13683)

(assert (=> b!1029474 (= e!581228 e!581236)))

(assert (=> b!1029474 (= c!103999 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029475 () Bool)

(declare-fun e!581231 () Unit!33605)

(declare-fun Unit!33616 () Unit!33605)

(assert (=> b!1029475 (= e!581231 Unit!33616)))

(declare-fun b!1029476 () Bool)

(declare-fun res!688617 () Bool)

(declare-fun e!581232 () Bool)

(assert (=> b!1029476 (=> (not res!688617) (not e!581232))))

(assert (=> b!1029476 (= res!688617 e!581227)))

(declare-fun res!688613 () Bool)

(assert (=> b!1029476 (=> res!688613 e!581227)))

(assert (=> b!1029476 (= res!688613 (not e!581230))))

(declare-fun res!688615 () Bool)

(assert (=> b!1029476 (=> (not res!688615) (not e!581230))))

(assert (=> b!1029476 (= res!688615 (bvslt #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(declare-fun b!1029477 () Bool)

(assert (=> b!1029477 (= e!581232 e!581229)))

(declare-fun c!104000 () Bool)

(assert (=> b!1029477 (= c!104000 (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029478 () Bool)

(assert (=> b!1029478 (= e!581228 (+!3101 call!43479 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))

(declare-fun b!1029479 () Bool)

(declare-fun e!581224 () Bool)

(assert (=> b!1029479 (= e!581224 (validKeyInArray!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43477 () Bool)

(assert (=> bm!43477 (= call!43480 call!43482)))

(declare-fun b!1029480 () Bool)

(declare-fun e!581234 () Bool)

(assert (=> b!1029480 (= e!581234 (= (apply!903 lt!453813 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5951 thiss!1427)))))

(declare-fun b!1029481 () Bool)

(declare-fun lt!453812 () Unit!33605)

(assert (=> b!1029481 (= e!581231 lt!453812)))

(declare-fun lt!453809 () ListLongMap!13683)

(assert (=> b!1029481 (= lt!453809 (getCurrentListMapNoExtraKeys!3517 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453816 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453796 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453796 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453817 () Unit!33605)

(assert (=> b!1029481 (= lt!453817 (addStillContains!622 lt!453809 lt!453816 (zeroValue!5951 thiss!1427) lt!453796))))

(assert (=> b!1029481 (contains!5972 (+!3101 lt!453809 (tuple2!15561 lt!453816 (zeroValue!5951 thiss!1427))) lt!453796)))

(declare-fun lt!453803 () Unit!33605)

(assert (=> b!1029481 (= lt!453803 lt!453817)))

(declare-fun lt!453801 () ListLongMap!13683)

(assert (=> b!1029481 (= lt!453801 (getCurrentListMapNoExtraKeys!3517 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453799 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453799 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453814 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453814 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453811 () Unit!33605)

(assert (=> b!1029481 (= lt!453811 (addApplyDifferent!482 lt!453801 lt!453799 (minValue!5951 thiss!1427) lt!453814))))

(assert (=> b!1029481 (= (apply!903 (+!3101 lt!453801 (tuple2!15561 lt!453799 (minValue!5951 thiss!1427))) lt!453814) (apply!903 lt!453801 lt!453814))))

(declare-fun lt!453804 () Unit!33605)

(assert (=> b!1029481 (= lt!453804 lt!453811)))

(declare-fun lt!453810 () ListLongMap!13683)

(assert (=> b!1029481 (= lt!453810 (getCurrentListMapNoExtraKeys!3517 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453815 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453808 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453808 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453805 () Unit!33605)

(assert (=> b!1029481 (= lt!453805 (addApplyDifferent!482 lt!453810 lt!453815 (zeroValue!5951 thiss!1427) lt!453808))))

(assert (=> b!1029481 (= (apply!903 (+!3101 lt!453810 (tuple2!15561 lt!453815 (zeroValue!5951 thiss!1427))) lt!453808) (apply!903 lt!453810 lt!453808))))

(declare-fun lt!453798 () Unit!33605)

(assert (=> b!1029481 (= lt!453798 lt!453805)))

(declare-fun lt!453797 () ListLongMap!13683)

(assert (=> b!1029481 (= lt!453797 (getCurrentListMapNoExtraKeys!3517 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(declare-fun lt!453802 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453800 () (_ BitVec 64))

(assert (=> b!1029481 (= lt!453800 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1029481 (= lt!453812 (addApplyDifferent!482 lt!453797 lt!453802 (minValue!5951 thiss!1427) lt!453800))))

(assert (=> b!1029481 (= (apply!903 (+!3101 lt!453797 (tuple2!15561 lt!453802 (minValue!5951 thiss!1427))) lt!453800) (apply!903 lt!453797 lt!453800))))

(declare-fun b!1029482 () Bool)

(assert (=> b!1029482 (= e!581229 e!581234)))

(declare-fun res!688610 () Bool)

(assert (=> b!1029482 (= res!688610 call!43477)))

(assert (=> b!1029482 (=> (not res!688610) (not e!581234))))

(declare-fun b!1029483 () Bool)

(declare-fun res!688614 () Bool)

(assert (=> b!1029483 (=> (not res!688614) (not e!581232))))

(assert (=> b!1029483 (= res!688614 e!581233)))

(declare-fun c!104003 () Bool)

(assert (=> b!1029483 (= c!104003 (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43478 () Bool)

(assert (=> bm!43478 (= call!43477 (contains!5972 lt!453813 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43479 () Bool)

(assert (=> bm!43479 (= call!43476 call!43479)))

(declare-fun b!1029484 () Bool)

(assert (=> b!1029484 (= e!581235 (= (apply!903 lt!453813 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)) (get!16356 (select (arr!31150 (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31665 (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))))))))

(assert (=> b!1029484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(declare-fun d!123253 () Bool)

(assert (=> d!123253 e!581232))

(declare-fun res!688609 () Bool)

(assert (=> d!123253 (=> (not res!688609) (not e!581232))))

(assert (=> d!123253 (= res!688609 (or (bvsge #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))))

(declare-fun lt!453806 () ListLongMap!13683)

(assert (=> d!123253 (= lt!453813 lt!453806)))

(declare-fun lt!453807 () Unit!33605)

(assert (=> d!123253 (= lt!453807 e!581231)))

(declare-fun c!104004 () Bool)

(assert (=> d!123253 (= c!104004 e!581224)))

(declare-fun res!688616 () Bool)

(assert (=> d!123253 (=> (not res!688616) (not e!581224))))

(assert (=> d!123253 (= res!688616 (bvslt #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(assert (=> d!123253 (= lt!453806 e!581228)))

(assert (=> d!123253 (= c!104002 (and (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5847 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123253 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123253 (= (getCurrentListMap!3905 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) lt!453813)))

(declare-fun bm!43476 () Bool)

(assert (=> bm!43476 (= call!43478 (getCurrentListMapNoExtraKeys!3517 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(assert (= (and d!123253 c!104002) b!1029478))

(assert (= (and d!123253 (not c!104002)) b!1029474))

(assert (= (and b!1029474 c!103999) b!1029472))

(assert (= (and b!1029474 (not c!103999)) b!1029465))

(assert (= (and b!1029465 c!104001) b!1029471))

(assert (= (and b!1029465 (not c!104001)) b!1029467))

(assert (= (or b!1029471 b!1029467) bm!43477))

(assert (= (or b!1029472 bm!43477) bm!43473))

(assert (= (or b!1029472 b!1029471) bm!43479))

(assert (= (or b!1029478 bm!43473) bm!43476))

(assert (= (or b!1029478 bm!43479) bm!43475))

(assert (= (and d!123253 res!688616) b!1029479))

(assert (= (and d!123253 c!104004) b!1029481))

(assert (= (and d!123253 (not c!104004)) b!1029475))

(assert (= (and d!123253 res!688609) b!1029476))

(assert (= (and b!1029476 res!688615) b!1029468))

(assert (= (and b!1029476 (not res!688613)) b!1029473))

(assert (= (and b!1029473 res!688612) b!1029484))

(assert (= (and b!1029476 res!688617) b!1029483))

(assert (= (and b!1029483 c!104003) b!1029469))

(assert (= (and b!1029483 (not c!104003)) b!1029466))

(assert (= (and b!1029469 res!688611) b!1029470))

(assert (= (or b!1029469 b!1029466) bm!43474))

(assert (= (and b!1029483 res!688614) b!1029477))

(assert (= (and b!1029477 c!104000) b!1029482))

(assert (= (and b!1029477 (not c!104000)) b!1029464))

(assert (= (and b!1029482 res!688610) b!1029480))

(assert (= (or b!1029482 b!1029464) bm!43478))

(declare-fun b_lambda!15867 () Bool)

(assert (=> (not b_lambda!15867) (not b!1029484)))

(assert (=> b!1029484 t!30912))

(declare-fun b_and!32929 () Bool)

(assert (= b_and!32927 (and (=> t!30912 result!14149) b_and!32929)))

(declare-fun m!948631 () Bool)

(assert (=> bm!43474 m!948631))

(declare-fun m!948633 () Bool)

(assert (=> b!1029473 m!948633))

(assert (=> b!1029473 m!948633))

(declare-fun m!948635 () Bool)

(assert (=> b!1029473 m!948635))

(declare-fun m!948637 () Bool)

(assert (=> bm!43478 m!948637))

(declare-fun m!948639 () Bool)

(assert (=> b!1029481 m!948639))

(declare-fun m!948641 () Bool)

(assert (=> b!1029481 m!948641))

(declare-fun m!948643 () Bool)

(assert (=> b!1029481 m!948643))

(declare-fun m!948645 () Bool)

(assert (=> b!1029481 m!948645))

(declare-fun m!948647 () Bool)

(assert (=> b!1029481 m!948647))

(declare-fun m!948649 () Bool)

(assert (=> b!1029481 m!948649))

(declare-fun m!948651 () Bool)

(assert (=> b!1029481 m!948651))

(declare-fun m!948653 () Bool)

(assert (=> b!1029481 m!948653))

(assert (=> b!1029481 m!948641))

(declare-fun m!948655 () Bool)

(assert (=> b!1029481 m!948655))

(declare-fun m!948657 () Bool)

(assert (=> b!1029481 m!948657))

(declare-fun m!948659 () Bool)

(assert (=> b!1029481 m!948659))

(declare-fun m!948661 () Bool)

(assert (=> b!1029481 m!948661))

(declare-fun m!948663 () Bool)

(assert (=> b!1029481 m!948663))

(assert (=> b!1029481 m!948659))

(declare-fun m!948665 () Bool)

(assert (=> b!1029481 m!948665))

(assert (=> b!1029481 m!948655))

(declare-fun m!948667 () Bool)

(assert (=> b!1029481 m!948667))

(assert (=> b!1029481 m!948649))

(declare-fun m!948669 () Bool)

(assert (=> b!1029481 m!948669))

(assert (=> b!1029481 m!948633))

(declare-fun m!948671 () Bool)

(assert (=> bm!43475 m!948671))

(assert (=> b!1029484 m!948633))

(declare-fun m!948673 () Bool)

(assert (=> b!1029484 m!948673))

(assert (=> b!1029484 m!948319))

(declare-fun m!948675 () Bool)

(assert (=> b!1029484 m!948675))

(assert (=> b!1029484 m!948633))

(assert (=> b!1029484 m!948675))

(assert (=> b!1029484 m!948319))

(declare-fun m!948677 () Bool)

(assert (=> b!1029484 m!948677))

(assert (=> b!1029468 m!948633))

(assert (=> b!1029468 m!948633))

(declare-fun m!948679 () Bool)

(assert (=> b!1029468 m!948679))

(assert (=> d!123253 m!948383))

(declare-fun m!948681 () Bool)

(assert (=> b!1029480 m!948681))

(declare-fun m!948683 () Bool)

(assert (=> b!1029478 m!948683))

(declare-fun m!948685 () Bool)

(assert (=> b!1029470 m!948685))

(assert (=> bm!43476 m!948639))

(assert (=> b!1029479 m!948633))

(assert (=> b!1029479 m!948633))

(assert (=> b!1029479 m!948679))

(assert (=> b!1029335 d!123253))

(declare-fun d!123255 () Bool)

(assert (=> d!123255 (= (-!484 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) key!909) (getCurrentListMap!3905 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (array!64691 (store (arr!31150 (_values!6138 thiss!1427)) (index!41104 lt!453581) (ValueCellFull!11454 (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31665 (_values!6138 thiss!1427))) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))

(assert (=> d!123255 true))

(declare-fun _$9!41 () Unit!33605)

(assert (=> d!123255 (= (choose!1689 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (index!41104 lt!453581) key!909 (defaultEntry!6115 thiss!1427)) _$9!41)))

(declare-fun b_lambda!15869 () Bool)

(assert (=> (not b_lambda!15869) (not d!123255)))

(assert (=> d!123255 t!30912))

(declare-fun b_and!32931 () Bool)

(assert (= b_and!32929 (and (=> t!30912 result!14149) b_and!32931)))

(assert (=> d!123255 m!948299))

(assert (=> d!123255 m!948537))

(assert (=> d!123255 m!948287))

(assert (=> d!123255 m!948299))

(assert (=> d!123255 m!948301))

(assert (=> d!123255 m!948319))

(assert (=> d!123255 m!948313))

(assert (=> d!123211 d!123255))

(assert (=> d!123211 d!123235))

(declare-fun d!123257 () Bool)

(declare-fun e!581237 () Bool)

(assert (=> d!123257 e!581237))

(declare-fun res!688618 () Bool)

(assert (=> d!123257 (=> (not res!688618) (not e!581237))))

(declare-fun lt!453820 () ListLongMap!13683)

(assert (=> d!123257 (= res!688618 (contains!5972 lt!453820 (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(declare-fun lt!453821 () List!21823)

(assert (=> d!123257 (= lt!453820 (ListLongMap!13684 lt!453821))))

(declare-fun lt!453819 () Unit!33605)

(declare-fun lt!453818 () Unit!33605)

(assert (=> d!123257 (= lt!453819 lt!453818)))

(assert (=> d!123257 (= (getValueByKey!586 lt!453821 (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (=> d!123257 (= lt!453818 (lemmaContainsTupThenGetReturnValue!277 lt!453821 (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (=> d!123257 (= lt!453821 (insertStrictlySorted!370 (toList!6857 call!43459) (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (=> d!123257 (= (+!3101 call!43459 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))) lt!453820)))

(declare-fun b!1029485 () Bool)

(declare-fun res!688619 () Bool)

(assert (=> b!1029485 (=> (not res!688619) (not e!581237))))

(assert (=> b!1029485 (= res!688619 (= (getValueByKey!586 (toList!6857 lt!453820) (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(declare-fun b!1029486 () Bool)

(assert (=> b!1029486 (= e!581237 (contains!5974 (toList!6857 lt!453820) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))

(assert (= (and d!123257 res!688618) b!1029485))

(assert (= (and b!1029485 res!688619) b!1029486))

(declare-fun m!948687 () Bool)

(assert (=> d!123257 m!948687))

(declare-fun m!948689 () Bool)

(assert (=> d!123257 m!948689))

(declare-fun m!948691 () Bool)

(assert (=> d!123257 m!948691))

(declare-fun m!948693 () Bool)

(assert (=> d!123257 m!948693))

(declare-fun m!948695 () Bool)

(assert (=> b!1029485 m!948695))

(declare-fun m!948697 () Bool)

(assert (=> b!1029486 m!948697))

(assert (=> b!1029311 d!123257))

(assert (=> b!1029364 d!123225))

(declare-fun b!1029487 () Bool)

(declare-fun e!581238 () (_ BitVec 32))

(declare-fun e!581239 () (_ BitVec 32))

(assert (=> b!1029487 (= e!581238 e!581239)))

(declare-fun c!104006 () Bool)

(assert (=> b!1029487 (= c!104006 (validKeyInArray!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43480 () Bool)

(declare-fun call!43483 () (_ BitVec 32))

(assert (=> bm!43480 (= call!43483 (arrayCountValidKeys!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029489 () Bool)

(assert (=> b!1029489 (= e!581239 call!43483)))

(declare-fun b!1029490 () Bool)

(assert (=> b!1029490 (= e!581239 (bvadd #b00000000000000000000000000000001 call!43483))))

(declare-fun d!123259 () Bool)

(declare-fun lt!453822 () (_ BitVec 32))

(assert (=> d!123259 (and (bvsge lt!453822 #b00000000000000000000000000000000) (bvsle lt!453822 (bvsub (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!123259 (= lt!453822 e!581238)))

(declare-fun c!104005 () Bool)

(assert (=> d!123259 (= c!104005 (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123259 (and (bvsle #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31664 (_keys!11276 thiss!1427)) (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(assert (=> d!123259 (= (arrayCountValidKeys!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) lt!453822)))

(declare-fun b!1029488 () Bool)

(assert (=> b!1029488 (= e!581238 #b00000000000000000000000000000000)))

(assert (= (and d!123259 c!104005) b!1029488))

(assert (= (and d!123259 (not c!104005)) b!1029487))

(assert (= (and b!1029487 c!104006) b!1029490))

(assert (= (and b!1029487 (not c!104006)) b!1029489))

(assert (= (or b!1029490 b!1029489) bm!43480))

(assert (=> b!1029487 m!948633))

(assert (=> b!1029487 m!948633))

(assert (=> b!1029487 m!948679))

(declare-fun m!948699 () Bool)

(assert (=> bm!43480 m!948699))

(assert (=> b!1029296 d!123259))

(assert (=> b!1029296 d!123215))

(declare-fun d!123261 () Bool)

(assert (=> d!123261 (= (apply!903 lt!453685 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) (get!16357 (getValueByKey!586 (toList!6857 lt!453685) (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))))

(declare-fun bs!30060 () Bool)

(assert (= bs!30060 d!123261))

(assert (=> bs!30060 m!948395))

(declare-fun m!948701 () Bool)

(assert (=> bs!30060 m!948701))

(assert (=> bs!30060 m!948701))

(declare-fun m!948703 () Bool)

(assert (=> bs!30060 m!948703))

(assert (=> b!1029281 d!123261))

(declare-fun d!123263 () Bool)

(declare-fun c!104007 () Bool)

(assert (=> d!123263 (= c!104007 ((_ is ValueCellFull!11454) (select (arr!31150 lt!453577) #b00000000000000000000000000000000)))))

(declare-fun e!581240 () V!37293)

(assert (=> d!123263 (= (get!16356 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581240)))

(declare-fun b!1029491 () Bool)

(assert (=> b!1029491 (= e!581240 (get!16358 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029492 () Bool)

(assert (=> b!1029492 (= e!581240 (get!16359 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123263 c!104007) b!1029491))

(assert (= (and d!123263 (not c!104007)) b!1029492))

(assert (=> b!1029491 m!948437))

(assert (=> b!1029491 m!948319))

(declare-fun m!948705 () Bool)

(assert (=> b!1029491 m!948705))

(assert (=> b!1029492 m!948437))

(assert (=> b!1029492 m!948319))

(declare-fun m!948707 () Bool)

(assert (=> b!1029492 m!948707))

(assert (=> b!1029281 d!123263))

(declare-fun d!123265 () Bool)

(assert (=> d!123265 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1029294 d!123265))

(declare-fun d!123267 () Bool)

(declare-fun e!581241 () Bool)

(assert (=> d!123267 e!581241))

(declare-fun res!688620 () Bool)

(assert (=> d!123267 (=> res!688620 e!581241)))

(declare-fun lt!453825 () Bool)

(assert (=> d!123267 (= res!688620 (not lt!453825))))

(declare-fun lt!453826 () Bool)

(assert (=> d!123267 (= lt!453825 lt!453826)))

(declare-fun lt!453824 () Unit!33605)

(declare-fun e!581242 () Unit!33605)

(assert (=> d!123267 (= lt!453824 e!581242)))

(declare-fun c!104008 () Bool)

(assert (=> d!123267 (= c!104008 lt!453826)))

(assert (=> d!123267 (= lt!453826 (containsKey!561 (toList!6857 lt!453685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123267 (= (contains!5972 lt!453685 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453825)))

(declare-fun b!1029493 () Bool)

(declare-fun lt!453823 () Unit!33605)

(assert (=> b!1029493 (= e!581242 lt!453823)))

(assert (=> b!1029493 (= lt!453823 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029493 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029494 () Bool)

(declare-fun Unit!33617 () Unit!33605)

(assert (=> b!1029494 (= e!581242 Unit!33617)))

(declare-fun b!1029495 () Bool)

(assert (=> b!1029495 (= e!581241 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123267 c!104008) b!1029493))

(assert (= (and d!123267 (not c!104008)) b!1029494))

(assert (= (and d!123267 (not res!688620)) b!1029495))

(declare-fun m!948709 () Bool)

(assert (=> d!123267 m!948709))

(declare-fun m!948711 () Bool)

(assert (=> b!1029493 m!948711))

(declare-fun m!948713 () Bool)

(assert (=> b!1029493 m!948713))

(assert (=> b!1029493 m!948713))

(declare-fun m!948715 () Bool)

(assert (=> b!1029493 m!948715))

(assert (=> b!1029495 m!948713))

(assert (=> b!1029495 m!948713))

(assert (=> b!1029495 m!948715))

(assert (=> bm!43451 d!123267))

(declare-fun d!123269 () Bool)

(assert (=> d!123269 (arrayNoDuplicates!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000000 Nil!21821)))

(assert (=> d!123269 true))

(declare-fun _$66!38 () Unit!33605)

(assert (=> d!123269 (= (choose!53 (_keys!11276 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41104 lt!453581) #b00000000000000000000000000000000 Nil!21821) _$66!38)))

(declare-fun bs!30061 () Bool)

(assert (= bs!30061 d!123269))

(assert (=> bs!30061 m!948287))

(assert (=> bs!30061 m!948533))

(assert (=> d!123209 d!123269))

(declare-fun b!1029520 () Bool)

(assert (=> b!1029520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> b!1029520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31665 (_values!6138 thiss!1427))))))

(declare-fun e!581263 () Bool)

(declare-fun lt!453847 () ListLongMap!13683)

(assert (=> b!1029520 (= e!581263 (= (apply!903 lt!453847 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)) (get!16356 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029521 () Bool)

(declare-fun e!581259 () Bool)

(declare-fun e!581262 () Bool)

(assert (=> b!1029521 (= e!581259 e!581262)))

(declare-fun c!104020 () Bool)

(declare-fun e!581260 () Bool)

(assert (=> b!1029521 (= c!104020 e!581260)))

(declare-fun res!688632 () Bool)

(assert (=> b!1029521 (=> (not res!688632) (not e!581260))))

(assert (=> b!1029521 (= res!688632 (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029522 () Bool)

(assert (=> b!1029522 (= e!581262 e!581263)))

(assert (=> b!1029522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun res!688631 () Bool)

(assert (=> b!1029522 (= res!688631 (contains!5972 lt!453847 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029522 (=> (not res!688631) (not e!581263))))

(declare-fun b!1029523 () Bool)

(declare-fun res!688629 () Bool)

(assert (=> b!1029523 (=> (not res!688629) (not e!581259))))

(assert (=> b!1029523 (= res!688629 (not (contains!5972 lt!453847 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029524 () Bool)

(assert (=> b!1029524 (= e!581260 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029524 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1029525 () Bool)

(declare-fun lt!453844 () Unit!33605)

(declare-fun lt!453845 () Unit!33605)

(assert (=> b!1029525 (= lt!453844 lt!453845)))

(declare-fun lt!453842 () V!37293)

(declare-fun lt!453841 () ListLongMap!13683)

(declare-fun lt!453843 () (_ BitVec 64))

(declare-fun lt!453846 () (_ BitVec 64))

(assert (=> b!1029525 (not (contains!5972 (+!3101 lt!453841 (tuple2!15561 lt!453843 lt!453842)) lt!453846))))

(declare-fun addStillNotContains!240 (ListLongMap!13683 (_ BitVec 64) V!37293 (_ BitVec 64)) Unit!33605)

(assert (=> b!1029525 (= lt!453845 (addStillNotContains!240 lt!453841 lt!453843 lt!453842 lt!453846))))

(assert (=> b!1029525 (= lt!453846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029525 (= lt!453842 (get!16356 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029525 (= lt!453843 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43486 () ListLongMap!13683)

(assert (=> b!1029525 (= lt!453841 call!43486)))

(declare-fun e!581257 () ListLongMap!13683)

(assert (=> b!1029525 (= e!581257 (+!3101 call!43486 (tuple2!15561 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000) (get!16356 (select (arr!31150 (_values!6138 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029527 () Bool)

(declare-fun e!581261 () Bool)

(declare-fun isEmpty!924 (ListLongMap!13683) Bool)

(assert (=> b!1029527 (= e!581261 (isEmpty!924 lt!453847))))

(declare-fun b!1029528 () Bool)

(declare-fun e!581258 () ListLongMap!13683)

(assert (=> b!1029528 (= e!581258 (ListLongMap!13684 Nil!21820))))

(declare-fun b!1029529 () Bool)

(assert (=> b!1029529 (= e!581257 call!43486)))

(declare-fun bm!43483 () Bool)

(assert (=> bm!43483 (= call!43486 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6115 thiss!1427)))))

(declare-fun b!1029530 () Bool)

(assert (=> b!1029530 (= e!581261 (= lt!453847 (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6115 thiss!1427))))))

(declare-fun b!1029531 () Bool)

(assert (=> b!1029531 (= e!581262 e!581261)))

(declare-fun c!104019 () Bool)

(assert (=> b!1029531 (= c!104019 (bvslt #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(declare-fun b!1029526 () Bool)

(assert (=> b!1029526 (= e!581258 e!581257)))

(declare-fun c!104017 () Bool)

(assert (=> b!1029526 (= c!104017 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123271 () Bool)

(assert (=> d!123271 e!581259))

(declare-fun res!688630 () Bool)

(assert (=> d!123271 (=> (not res!688630) (not e!581259))))

(assert (=> d!123271 (= res!688630 (not (contains!5972 lt!453847 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123271 (= lt!453847 e!581258)))

(declare-fun c!104018 () Bool)

(assert (=> d!123271 (= c!104018 (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123271 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123271 (= (getCurrentListMapNoExtraKeys!3517 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) lt!453847)))

(assert (= (and d!123271 c!104018) b!1029528))

(assert (= (and d!123271 (not c!104018)) b!1029526))

(assert (= (and b!1029526 c!104017) b!1029525))

(assert (= (and b!1029526 (not c!104017)) b!1029529))

(assert (= (or b!1029525 b!1029529) bm!43483))

(assert (= (and d!123271 res!688630) b!1029523))

(assert (= (and b!1029523 res!688629) b!1029521))

(assert (= (and b!1029521 res!688632) b!1029524))

(assert (= (and b!1029521 c!104020) b!1029522))

(assert (= (and b!1029521 (not c!104020)) b!1029531))

(assert (= (and b!1029522 res!688631) b!1029520))

(assert (= (and b!1029531 c!104019) b!1029530))

(assert (= (and b!1029531 (not c!104019)) b!1029527))

(declare-fun b_lambda!15871 () Bool)

(assert (=> (not b_lambda!15871) (not b!1029520)))

(assert (=> b!1029520 t!30912))

(declare-fun b_and!32933 () Bool)

(assert (= b_and!32931 (and (=> t!30912 result!14149) b_and!32933)))

(declare-fun b_lambda!15873 () Bool)

(assert (=> (not b_lambda!15873) (not b!1029525)))

(assert (=> b!1029525 t!30912))

(declare-fun b_and!32935 () Bool)

(assert (= b_and!32933 (and (=> t!30912 result!14149) b_and!32935)))

(declare-fun m!948717 () Bool)

(assert (=> bm!43483 m!948717))

(declare-fun m!948719 () Bool)

(assert (=> d!123271 m!948719))

(assert (=> d!123271 m!948383))

(declare-fun m!948721 () Bool)

(assert (=> b!1029527 m!948721))

(assert (=> b!1029524 m!948465))

(assert (=> b!1029524 m!948465))

(assert (=> b!1029524 m!948511))

(assert (=> b!1029520 m!948507))

(assert (=> b!1029520 m!948319))

(assert (=> b!1029520 m!948465))

(declare-fun m!948723 () Bool)

(assert (=> b!1029520 m!948723))

(assert (=> b!1029520 m!948465))

(assert (=> b!1029520 m!948507))

(assert (=> b!1029520 m!948319))

(assert (=> b!1029520 m!948509))

(assert (=> b!1029526 m!948465))

(assert (=> b!1029526 m!948465))

(assert (=> b!1029526 m!948511))

(declare-fun m!948725 () Bool)

(assert (=> b!1029525 m!948725))

(assert (=> b!1029525 m!948507))

(declare-fun m!948727 () Bool)

(assert (=> b!1029525 m!948727))

(assert (=> b!1029525 m!948725))

(declare-fun m!948729 () Bool)

(assert (=> b!1029525 m!948729))

(assert (=> b!1029525 m!948319))

(declare-fun m!948731 () Bool)

(assert (=> b!1029525 m!948731))

(assert (=> b!1029525 m!948465))

(assert (=> b!1029525 m!948507))

(assert (=> b!1029525 m!948319))

(assert (=> b!1029525 m!948509))

(assert (=> b!1029522 m!948465))

(assert (=> b!1029522 m!948465))

(declare-fun m!948733 () Bool)

(assert (=> b!1029522 m!948733))

(declare-fun m!948735 () Bool)

(assert (=> b!1029523 m!948735))

(assert (=> b!1029530 m!948717))

(assert (=> bm!43456 d!123271))

(declare-fun d!123273 () Bool)

(declare-fun e!581264 () Bool)

(assert (=> d!123273 e!581264))

(declare-fun res!688633 () Bool)

(assert (=> d!123273 (=> res!688633 e!581264)))

(declare-fun lt!453850 () Bool)

(assert (=> d!123273 (= res!688633 (not lt!453850))))

(declare-fun lt!453851 () Bool)

(assert (=> d!123273 (= lt!453850 lt!453851)))

(declare-fun lt!453849 () Unit!33605)

(declare-fun e!581265 () Unit!33605)

(assert (=> d!123273 (= lt!453849 e!581265)))

(declare-fun c!104021 () Bool)

(assert (=> d!123273 (= c!104021 lt!453851)))

(assert (=> d!123273 (= lt!453851 (containsKey!561 (toList!6857 lt!453713) (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123273 (= (contains!5972 lt!453713 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)) lt!453850)))

(declare-fun b!1029532 () Bool)

(declare-fun lt!453848 () Unit!33605)

(assert (=> b!1029532 (= e!581265 lt!453848)))

(assert (=> b!1029532 (= lt!453848 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453713) (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029532 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453713) (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029533 () Bool)

(declare-fun Unit!33618 () Unit!33605)

(assert (=> b!1029533 (= e!581265 Unit!33618)))

(declare-fun b!1029534 () Bool)

(assert (=> b!1029534 (= e!581264 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453713) (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123273 c!104021) b!1029532))

(assert (= (and d!123273 (not c!104021)) b!1029533))

(assert (= (and d!123273 (not res!688633)) b!1029534))

(assert (=> d!123273 m!948465))

(declare-fun m!948737 () Bool)

(assert (=> d!123273 m!948737))

(assert (=> b!1029532 m!948465))

(declare-fun m!948739 () Bool)

(assert (=> b!1029532 m!948739))

(assert (=> b!1029532 m!948465))

(assert (=> b!1029532 m!948561))

(assert (=> b!1029532 m!948561))

(declare-fun m!948741 () Bool)

(assert (=> b!1029532 m!948741))

(assert (=> b!1029534 m!948465))

(assert (=> b!1029534 m!948561))

(assert (=> b!1029534 m!948561))

(assert (=> b!1029534 m!948741))

(assert (=> b!1029306 d!123273))

(declare-fun d!123275 () Bool)

(declare-fun lt!453854 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!510 (List!21824) (InoxSet (_ BitVec 64)))

(assert (=> d!123275 (= lt!453854 (select (content!510 Nil!21821) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun e!581271 () Bool)

(assert (=> d!123275 (= lt!453854 e!581271)))

(declare-fun res!688638 () Bool)

(assert (=> d!123275 (=> (not res!688638) (not e!581271))))

(assert (=> d!123275 (= res!688638 ((_ is Cons!21820) Nil!21821))))

(assert (=> d!123275 (= (contains!5973 Nil!21821 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) lt!453854)))

(declare-fun b!1029539 () Bool)

(declare-fun e!581270 () Bool)

(assert (=> b!1029539 (= e!581271 e!581270)))

(declare-fun res!688639 () Bool)

(assert (=> b!1029539 (=> res!688639 e!581270)))

(assert (=> b!1029539 (= res!688639 (= (h!23020 Nil!21821) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun b!1029540 () Bool)

(assert (=> b!1029540 (= e!581270 (contains!5973 (t!30914 Nil!21821) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (= (and d!123275 res!688638) b!1029539))

(assert (= (and b!1029539 (not res!688639)) b!1029540))

(declare-fun m!948743 () Bool)

(assert (=> d!123275 m!948743))

(assert (=> d!123275 m!948395))

(declare-fun m!948745 () Bool)

(assert (=> d!123275 m!948745))

(assert (=> b!1029540 m!948395))

(declare-fun m!948747 () Bool)

(assert (=> b!1029540 m!948747))

(assert (=> b!1029361 d!123275))

(declare-fun d!123277 () Bool)

(declare-fun res!688642 () Bool)

(declare-fun e!581273 () Bool)

(assert (=> d!123277 (=> res!688642 e!581273)))

(assert (=> d!123277 (= res!688642 (bvsge #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(assert (=> d!123277 (= (arrayNoDuplicates!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000000 Nil!21821) e!581273)))

(declare-fun b!1029541 () Bool)

(declare-fun e!581272 () Bool)

(assert (=> b!1029541 (= e!581272 (contains!5973 Nil!21821 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun call!43487 () Bool)

(declare-fun bm!43484 () Bool)

(declare-fun c!104022 () Bool)

(assert (=> bm!43484 (= call!43487 (arrayNoDuplicates!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104022 (Cons!21820 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000) Nil!21821) Nil!21821)))))

(declare-fun b!1029542 () Bool)

(declare-fun e!581275 () Bool)

(assert (=> b!1029542 (= e!581275 call!43487)))

(declare-fun b!1029543 () Bool)

(assert (=> b!1029543 (= e!581275 call!43487)))

(declare-fun b!1029544 () Bool)

(declare-fun e!581274 () Bool)

(assert (=> b!1029544 (= e!581273 e!581274)))

(declare-fun res!688640 () Bool)

(assert (=> b!1029544 (=> (not res!688640) (not e!581274))))

(assert (=> b!1029544 (= res!688640 (not e!581272))))

(declare-fun res!688641 () Bool)

(assert (=> b!1029544 (=> (not res!688641) (not e!581272))))

(assert (=> b!1029544 (= res!688641 (validKeyInArray!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029545 () Bool)

(assert (=> b!1029545 (= e!581274 e!581275)))

(assert (=> b!1029545 (= c!104022 (validKeyInArray!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!123277 (not res!688642)) b!1029544))

(assert (= (and b!1029544 res!688641) b!1029541))

(assert (= (and b!1029544 res!688640) b!1029545))

(assert (= (and b!1029545 c!104022) b!1029543))

(assert (= (and b!1029545 (not c!104022)) b!1029542))

(assert (= (or b!1029543 b!1029542) bm!43484))

(assert (=> b!1029541 m!948633))

(assert (=> b!1029541 m!948633))

(declare-fun m!948749 () Bool)

(assert (=> b!1029541 m!948749))

(assert (=> bm!43484 m!948633))

(declare-fun m!948751 () Bool)

(assert (=> bm!43484 m!948751))

(assert (=> b!1029544 m!948633))

(assert (=> b!1029544 m!948633))

(assert (=> b!1029544 m!948679))

(assert (=> b!1029545 m!948633))

(assert (=> b!1029545 m!948633))

(assert (=> b!1029545 m!948679))

(assert (=> b!1029332 d!123277))

(declare-fun d!123279 () Bool)

(declare-fun res!688645 () Bool)

(declare-fun e!581277 () Bool)

(assert (=> d!123279 (=> res!688645 e!581277)))

(assert (=> d!123279 (= res!688645 (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123279 (= (arrayNoDuplicates!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 Nil!21821) e!581277)))

(declare-fun b!1029546 () Bool)

(declare-fun e!581276 () Bool)

(assert (=> b!1029546 (= e!581276 (contains!5973 Nil!21821 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43485 () Bool)

(declare-fun call!43488 () Bool)

(declare-fun c!104023 () Bool)

(assert (=> bm!43485 (= call!43488 (arrayNoDuplicates!0 (_keys!11276 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104023 (Cons!21820 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000) Nil!21821) Nil!21821)))))

(declare-fun b!1029547 () Bool)

(declare-fun e!581279 () Bool)

(assert (=> b!1029547 (= e!581279 call!43488)))

(declare-fun b!1029548 () Bool)

(assert (=> b!1029548 (= e!581279 call!43488)))

(declare-fun b!1029549 () Bool)

(declare-fun e!581278 () Bool)

(assert (=> b!1029549 (= e!581277 e!581278)))

(declare-fun res!688643 () Bool)

(assert (=> b!1029549 (=> (not res!688643) (not e!581278))))

(assert (=> b!1029549 (= res!688643 (not e!581276))))

(declare-fun res!688644 () Bool)

(assert (=> b!1029549 (=> (not res!688644) (not e!581276))))

(assert (=> b!1029549 (= res!688644 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029550 () Bool)

(assert (=> b!1029550 (= e!581278 e!581279)))

(assert (=> b!1029550 (= c!104023 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123279 (not res!688645)) b!1029549))

(assert (= (and b!1029549 res!688644) b!1029546))

(assert (= (and b!1029549 res!688643) b!1029550))

(assert (= (and b!1029550 c!104023) b!1029548))

(assert (= (and b!1029550 (not c!104023)) b!1029547))

(assert (= (or b!1029548 b!1029547) bm!43485))

(assert (=> b!1029546 m!948465))

(assert (=> b!1029546 m!948465))

(declare-fun m!948753 () Bool)

(assert (=> b!1029546 m!948753))

(assert (=> bm!43485 m!948465))

(declare-fun m!948755 () Bool)

(assert (=> bm!43485 m!948755))

(assert (=> b!1029549 m!948465))

(assert (=> b!1029549 m!948465))

(assert (=> b!1029549 m!948511))

(assert (=> b!1029550 m!948465))

(assert (=> b!1029550 m!948465))

(assert (=> b!1029550 m!948511))

(assert (=> b!1029218 d!123279))

(declare-fun d!123281 () Bool)

(assert (=> d!123281 (= (apply!903 lt!453685 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16357 (getValueByKey!586 (toList!6857 lt!453685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30062 () Bool)

(assert (= bs!30062 d!123281))

(assert (=> bs!30062 m!948713))

(assert (=> bs!30062 m!948713))

(declare-fun m!948757 () Bool)

(assert (=> bs!30062 m!948757))

(assert (=> b!1029277 d!123281))

(declare-fun b!1029551 () Bool)

(declare-fun e!581280 () Bool)

(declare-fun e!581281 () Bool)

(assert (=> b!1029551 (= e!581280 e!581281)))

(declare-fun c!104024 () Bool)

(assert (=> b!1029551 (= c!104024 (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029552 () Bool)

(declare-fun call!43489 () Bool)

(assert (=> b!1029552 (= e!581281 call!43489)))

(declare-fun b!1029553 () Bool)

(declare-fun e!581282 () Bool)

(assert (=> b!1029553 (= e!581281 e!581282)))

(declare-fun lt!453856 () (_ BitVec 64))

(assert (=> b!1029553 (= lt!453856 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453857 () Unit!33605)

(assert (=> b!1029553 (= lt!453857 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11276 thiss!1427) lt!453856 #b00000000000000000000000000000000))))

(assert (=> b!1029553 (arrayContainsKey!0 (_keys!11276 thiss!1427) lt!453856 #b00000000000000000000000000000000)))

(declare-fun lt!453855 () Unit!33605)

(assert (=> b!1029553 (= lt!453855 lt!453857)))

(declare-fun res!688646 () Bool)

(assert (=> b!1029553 (= res!688646 (= (seekEntryOrOpen!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000) (_keys!11276 thiss!1427) (mask!29867 thiss!1427)) (Found!9683 #b00000000000000000000000000000000)))))

(assert (=> b!1029553 (=> (not res!688646) (not e!581282))))

(declare-fun b!1029554 () Bool)

(assert (=> b!1029554 (= e!581282 call!43489)))

(declare-fun d!123283 () Bool)

(declare-fun res!688647 () Bool)

(assert (=> d!123283 (=> res!688647 e!581280)))

(assert (=> d!123283 (= res!688647 (bvsge #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))))))

(assert (=> d!123283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)) e!581280)))

(declare-fun bm!43486 () Bool)

(assert (=> bm!43486 (= call!43489 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(assert (= (and d!123283 (not res!688647)) b!1029551))

(assert (= (and b!1029551 c!104024) b!1029553))

(assert (= (and b!1029551 (not c!104024)) b!1029552))

(assert (= (and b!1029553 res!688646) b!1029554))

(assert (= (or b!1029554 b!1029552) bm!43486))

(assert (=> b!1029551 m!948465))

(assert (=> b!1029551 m!948465))

(assert (=> b!1029551 m!948511))

(assert (=> b!1029553 m!948465))

(declare-fun m!948759 () Bool)

(assert (=> b!1029553 m!948759))

(declare-fun m!948761 () Bool)

(assert (=> b!1029553 m!948761))

(assert (=> b!1029553 m!948465))

(declare-fun m!948763 () Bool)

(assert (=> b!1029553 m!948763))

(declare-fun m!948765 () Bool)

(assert (=> bm!43486 m!948765))

(assert (=> b!1029217 d!123283))

(declare-fun d!123285 () Bool)

(declare-fun e!581283 () Bool)

(assert (=> d!123285 e!581283))

(declare-fun res!688648 () Bool)

(assert (=> d!123285 (=> res!688648 e!581283)))

(declare-fun lt!453860 () Bool)

(assert (=> d!123285 (= res!688648 (not lt!453860))))

(declare-fun lt!453861 () Bool)

(assert (=> d!123285 (= lt!453860 lt!453861)))

(declare-fun lt!453859 () Unit!33605)

(declare-fun e!581284 () Unit!33605)

(assert (=> d!123285 (= lt!453859 e!581284)))

(declare-fun c!104025 () Bool)

(assert (=> d!123285 (= c!104025 lt!453861)))

(assert (=> d!123285 (= lt!453861 (containsKey!561 (toList!6857 lt!453713) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123285 (= (contains!5972 lt!453713 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453860)))

(declare-fun b!1029555 () Bool)

(declare-fun lt!453858 () Unit!33605)

(assert (=> b!1029555 (= e!581284 lt!453858)))

(assert (=> b!1029555 (= lt!453858 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453713) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029555 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453713) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029556 () Bool)

(declare-fun Unit!33619 () Unit!33605)

(assert (=> b!1029556 (= e!581284 Unit!33619)))

(declare-fun b!1029557 () Bool)

(assert (=> b!1029557 (= e!581283 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123285 c!104025) b!1029555))

(assert (= (and d!123285 (not c!104025)) b!1029556))

(assert (= (and d!123285 (not res!688648)) b!1029557))

(declare-fun m!948767 () Bool)

(assert (=> d!123285 m!948767))

(declare-fun m!948769 () Bool)

(assert (=> b!1029555 m!948769))

(declare-fun m!948771 () Bool)

(assert (=> b!1029555 m!948771))

(assert (=> b!1029555 m!948771))

(declare-fun m!948773 () Bool)

(assert (=> b!1029555 m!948773))

(assert (=> b!1029557 m!948771))

(assert (=> b!1029557 m!948771))

(assert (=> b!1029557 m!948773))

(assert (=> bm!43454 d!123285))

(declare-fun b!1029558 () Bool)

(declare-fun e!581285 () Bool)

(declare-fun e!581286 () Bool)

(assert (=> b!1029558 (= e!581285 e!581286)))

(declare-fun c!104026 () Bool)

(assert (=> b!1029558 (= c!104026 (validKeyInArray!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029559 () Bool)

(declare-fun call!43490 () Bool)

(assert (=> b!1029559 (= e!581286 call!43490)))

(declare-fun b!1029560 () Bool)

(declare-fun e!581287 () Bool)

(assert (=> b!1029560 (= e!581286 e!581287)))

(declare-fun lt!453863 () (_ BitVec 64))

(assert (=> b!1029560 (= lt!453863 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453864 () Unit!33605)

(assert (=> b!1029560 (= lt!453864 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) lt!453863 #b00000000000000000000000000000000))))

(assert (=> b!1029560 (arrayContainsKey!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) lt!453863 #b00000000000000000000000000000000)))

(declare-fun lt!453862 () Unit!33605)

(assert (=> b!1029560 (= lt!453862 lt!453864)))

(declare-fun res!688649 () Bool)

(assert (=> b!1029560 (= res!688649 (= (seekEntryOrOpen!0 (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000) (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (mask!29867 thiss!1427)) (Found!9683 #b00000000000000000000000000000000)))))

(assert (=> b!1029560 (=> (not res!688649) (not e!581287))))

(declare-fun b!1029561 () Bool)

(assert (=> b!1029561 (= e!581287 call!43490)))

(declare-fun d!123287 () Bool)

(declare-fun res!688650 () Bool)

(assert (=> d!123287 (=> res!688650 e!581285)))

(assert (=> d!123287 (= res!688650 (bvsge #b00000000000000000000000000000000 (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(assert (=> d!123287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (mask!29867 thiss!1427)) e!581285)))

(declare-fun bm!43487 () Bool)

(assert (=> bm!43487 (= call!43490 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (mask!29867 thiss!1427)))))

(assert (= (and d!123287 (not res!688650)) b!1029558))

(assert (= (and b!1029558 c!104026) b!1029560))

(assert (= (and b!1029558 (not c!104026)) b!1029559))

(assert (= (and b!1029560 res!688649) b!1029561))

(assert (= (or b!1029561 b!1029559) bm!43487))

(assert (=> b!1029558 m!948633))

(assert (=> b!1029558 m!948633))

(assert (=> b!1029558 m!948679))

(assert (=> b!1029560 m!948633))

(declare-fun m!948775 () Bool)

(assert (=> b!1029560 m!948775))

(declare-fun m!948777 () Bool)

(assert (=> b!1029560 m!948777))

(assert (=> b!1029560 m!948633))

(declare-fun m!948779 () Bool)

(assert (=> b!1029560 m!948779))

(declare-fun m!948781 () Bool)

(assert (=> bm!43487 m!948781))

(assert (=> b!1029284 d!123287))

(declare-fun b!1029573 () Bool)

(declare-fun e!581290 () Bool)

(assert (=> b!1029573 (= e!581290 (and (bvsge (extraKeys!5847 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5847 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2806 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1029570 () Bool)

(declare-fun res!688660 () Bool)

(assert (=> b!1029570 (=> (not res!688660) (not e!581290))))

(assert (=> b!1029570 (= res!688660 (and (= (size!31665 (_values!6138 thiss!1427)) (bvadd (mask!29867 thiss!1427) #b00000000000000000000000000000001)) (= (size!31664 (_keys!11276 thiss!1427)) (size!31665 (_values!6138 thiss!1427))) (bvsge (_size!2806 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2806 thiss!1427) (bvadd (mask!29867 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!123289 () Bool)

(declare-fun res!688662 () Bool)

(assert (=> d!123289 (=> (not res!688662) (not e!581290))))

(assert (=> d!123289 (= res!688662 (validMask!0 (mask!29867 thiss!1427)))))

(assert (=> d!123289 (= (simpleValid!394 thiss!1427) e!581290)))

(declare-fun b!1029571 () Bool)

(declare-fun res!688661 () Bool)

(assert (=> b!1029571 (=> (not res!688661) (not e!581290))))

(declare-fun size!31668 (LongMapFixedSize!5502) (_ BitVec 32))

(assert (=> b!1029571 (= res!688661 (bvsge (size!31668 thiss!1427) (_size!2806 thiss!1427)))))

(declare-fun b!1029572 () Bool)

(declare-fun res!688659 () Bool)

(assert (=> b!1029572 (=> (not res!688659) (not e!581290))))

(assert (=> b!1029572 (= res!688659 (= (size!31668 thiss!1427) (bvadd (_size!2806 thiss!1427) (bvsdiv (bvadd (extraKeys!5847 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!123289 res!688662) b!1029570))

(assert (= (and b!1029570 res!688660) b!1029571))

(assert (= (and b!1029571 res!688661) b!1029572))

(assert (= (and b!1029572 res!688659) b!1029573))

(assert (=> d!123289 m!948383))

(declare-fun m!948783 () Bool)

(assert (=> b!1029571 m!948783))

(assert (=> b!1029572 m!948783))

(assert (=> d!123189 d!123289))

(declare-fun d!123291 () Bool)

(assert (=> d!123291 (= (apply!903 lt!453713 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16357 (getValueByKey!586 (toList!6857 lt!453713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30063 () Bool)

(assert (= bs!30063 d!123291))

(assert (=> bs!30063 m!948771))

(assert (=> bs!30063 m!948771))

(declare-fun m!948785 () Bool)

(assert (=> bs!30063 m!948785))

(assert (=> b!1029303 d!123291))

(assert (=> b!1029366 d!123225))

(declare-fun d!123293 () Bool)

(assert (=> d!123293 (not (arrayContainsKey!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123293 true))

(declare-fun _$59!17 () Unit!33605)

(assert (=> d!123293 (= (choose!121 (_keys!11276 thiss!1427) (index!41104 lt!453581) key!909) _$59!17)))

(declare-fun bs!30064 () Bool)

(assert (= bs!30064 d!123293))

(assert (=> bs!30064 m!948287))

(assert (=> bs!30064 m!948541))

(assert (=> d!123213 d!123293))

(assert (=> d!123195 d!123235))

(assert (=> d!123203 d!123235))

(declare-fun d!123295 () Bool)

(declare-fun e!581291 () Bool)

(assert (=> d!123295 e!581291))

(declare-fun res!688663 () Bool)

(assert (=> d!123295 (=> (not res!688663) (not e!581291))))

(declare-fun lt!453867 () ListLongMap!13683)

(assert (=> d!123295 (= res!688663 (contains!5972 lt!453867 (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(declare-fun lt!453868 () List!21823)

(assert (=> d!123295 (= lt!453867 (ListLongMap!13684 lt!453868))))

(declare-fun lt!453866 () Unit!33605)

(declare-fun lt!453865 () Unit!33605)

(assert (=> d!123295 (= lt!453866 lt!453865)))

(assert (=> d!123295 (= (getValueByKey!586 lt!453868 (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (=> d!123295 (= lt!453865 (lemmaContainsTupThenGetReturnValue!277 lt!453868 (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (=> d!123295 (= lt!453868 (insertStrictlySorted!370 (toList!6857 call!43452) (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (=> d!123295 (= (+!3101 call!43452 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))) lt!453867)))

(declare-fun b!1029574 () Bool)

(declare-fun res!688664 () Bool)

(assert (=> b!1029574 (=> (not res!688664) (not e!581291))))

(assert (=> b!1029574 (= res!688664 (= (getValueByKey!586 (toList!6857 lt!453867) (_1!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(declare-fun b!1029575 () Bool)

(assert (=> b!1029575 (= e!581291 (contains!5974 (toList!6857 lt!453867) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))

(assert (= (and d!123295 res!688663) b!1029574))

(assert (= (and b!1029574 res!688664) b!1029575))

(declare-fun m!948787 () Bool)

(assert (=> d!123295 m!948787))

(declare-fun m!948789 () Bool)

(assert (=> d!123295 m!948789))

(declare-fun m!948791 () Bool)

(assert (=> d!123295 m!948791))

(declare-fun m!948793 () Bool)

(assert (=> d!123295 m!948793))

(declare-fun m!948795 () Bool)

(assert (=> b!1029574 m!948795))

(declare-fun m!948797 () Bool)

(assert (=> b!1029575 m!948797))

(assert (=> b!1029275 d!123295))

(declare-fun d!123297 () Bool)

(assert (=> d!123297 (= (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31149 (_keys!11276 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029301 d!123297))

(declare-fun d!123299 () Bool)

(declare-fun res!688665 () Bool)

(declare-fun e!581292 () Bool)

(assert (=> d!123299 (=> res!688665 e!581292)))

(assert (=> d!123299 (= res!688665 (= (select (arr!31149 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123299 (= (arrayContainsKey!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) key!909 #b00000000000000000000000000000000) e!581292)))

(declare-fun b!1029576 () Bool)

(declare-fun e!581293 () Bool)

(assert (=> b!1029576 (= e!581292 e!581293)))

(declare-fun res!688666 () Bool)

(assert (=> b!1029576 (=> (not res!688666) (not e!581293))))

(assert (=> b!1029576 (= res!688666 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))))))))

(declare-fun b!1029577 () Bool)

(assert (=> b!1029577 (= e!581293 (arrayContainsKey!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123299 (not res!688665)) b!1029576))

(assert (= (and b!1029576 res!688666) b!1029577))

(assert (=> d!123299 m!948633))

(declare-fun m!948799 () Bool)

(assert (=> b!1029577 m!948799))

(assert (=> b!1029338 d!123299))

(declare-fun d!123301 () Bool)

(declare-fun e!581294 () Bool)

(assert (=> d!123301 e!581294))

(declare-fun res!688667 () Bool)

(assert (=> d!123301 (=> res!688667 e!581294)))

(declare-fun lt!453871 () Bool)

(assert (=> d!123301 (= res!688667 (not lt!453871))))

(declare-fun lt!453872 () Bool)

(assert (=> d!123301 (= lt!453871 lt!453872)))

(declare-fun lt!453870 () Unit!33605)

(declare-fun e!581295 () Unit!33605)

(assert (=> d!123301 (= lt!453870 e!581295)))

(declare-fun c!104027 () Bool)

(assert (=> d!123301 (= c!104027 lt!453872)))

(assert (=> d!123301 (= lt!453872 (containsKey!561 (toList!6857 lt!453720) key!909))))

(assert (=> d!123301 (= (contains!5972 lt!453720 key!909) lt!453871)))

(declare-fun b!1029578 () Bool)

(declare-fun lt!453869 () Unit!33605)

(assert (=> b!1029578 (= e!581295 lt!453869)))

(assert (=> b!1029578 (= lt!453869 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453720) key!909))))

(assert (=> b!1029578 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453720) key!909))))

(declare-fun b!1029579 () Bool)

(declare-fun Unit!33620 () Unit!33605)

(assert (=> b!1029579 (= e!581295 Unit!33620)))

(declare-fun b!1029580 () Bool)

(assert (=> b!1029580 (= e!581294 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453720) key!909)))))

(assert (= (and d!123301 c!104027) b!1029578))

(assert (= (and d!123301 (not c!104027)) b!1029579))

(assert (= (and d!123301 (not res!688667)) b!1029580))

(declare-fun m!948801 () Bool)

(assert (=> d!123301 m!948801))

(declare-fun m!948803 () Bool)

(assert (=> b!1029578 m!948803))

(declare-fun m!948805 () Bool)

(assert (=> b!1029578 m!948805))

(assert (=> b!1029578 m!948805))

(declare-fun m!948807 () Bool)

(assert (=> b!1029578 m!948807))

(assert (=> b!1029580 m!948805))

(assert (=> b!1029580 m!948805))

(assert (=> b!1029580 m!948807))

(assert (=> d!123205 d!123301))

(declare-fun b!1029591 () Bool)

(declare-fun e!581302 () List!21823)

(assert (=> b!1029591 (= e!581302 (t!30913 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))))))

(declare-fun b!1029592 () Bool)

(declare-fun e!581303 () List!21823)

(assert (=> b!1029592 (= e!581302 e!581303)))

(declare-fun c!104032 () Bool)

(assert (=> b!1029592 (= c!104032 (and ((_ is Cons!21819) (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))) (not (= (_1!7791 (h!23019 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))))) key!909))))))

(declare-fun b!1029593 () Bool)

(assert (=> b!1029593 (= e!581303 Nil!21820)))

(declare-fun b!1029594 () Bool)

(declare-fun $colon$colon!600 (List!21823 tuple2!15560) List!21823)

(assert (=> b!1029594 (= e!581303 ($colon$colon!600 (removeStrictlySorted!53 (t!30913 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))) key!909) (h!23019 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))))))))

(declare-fun d!123303 () Bool)

(declare-fun e!581304 () Bool)

(assert (=> d!123303 e!581304))

(declare-fun res!688670 () Bool)

(assert (=> d!123303 (=> (not res!688670) (not e!581304))))

(declare-fun lt!453875 () List!21823)

(declare-fun isStrictlySorted!716 (List!21823) Bool)

(assert (=> d!123303 (= res!688670 (isStrictlySorted!716 lt!453875))))

(assert (=> d!123303 (= lt!453875 e!581302)))

(declare-fun c!104033 () Bool)

(assert (=> d!123303 (= c!104033 (and ((_ is Cons!21819) (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)))) (= (_1!7791 (h!23019 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))))) key!909)))))

(assert (=> d!123303 (isStrictlySorted!716 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))))))

(assert (=> d!123303 (= (removeStrictlySorted!53 (toList!6857 (getCurrentListMap!3905 (_keys!11276 thiss!1427) (_values!6138 thiss!1427) (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427))) key!909) lt!453875)))

(declare-fun b!1029595 () Bool)

(assert (=> b!1029595 (= e!581304 (not (containsKey!561 lt!453875 key!909)))))

(assert (= (and d!123303 c!104033) b!1029591))

(assert (= (and d!123303 (not c!104033)) b!1029592))

(assert (= (and b!1029592 c!104032) b!1029594))

(assert (= (and b!1029592 (not c!104032)) b!1029593))

(assert (= (and d!123303 res!688670) b!1029595))

(declare-fun m!948809 () Bool)

(assert (=> b!1029594 m!948809))

(assert (=> b!1029594 m!948809))

(declare-fun m!948811 () Bool)

(assert (=> b!1029594 m!948811))

(declare-fun m!948813 () Bool)

(assert (=> d!123303 m!948813))

(declare-fun m!948815 () Bool)

(assert (=> d!123303 m!948815))

(declare-fun m!948817 () Bool)

(assert (=> b!1029595 m!948817))

(assert (=> d!123205 d!123303))

(declare-fun b!1029596 () Bool)

(assert (=> b!1029596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(assert (=> b!1029596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31665 lt!453577)))))

(declare-fun lt!453882 () ListLongMap!13683)

(declare-fun e!581311 () Bool)

(assert (=> b!1029596 (= e!581311 (= (apply!903 lt!453882 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) (get!16356 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029597 () Bool)

(declare-fun e!581307 () Bool)

(declare-fun e!581310 () Bool)

(assert (=> b!1029597 (= e!581307 e!581310)))

(declare-fun c!104037 () Bool)

(declare-fun e!581308 () Bool)

(assert (=> b!1029597 (= c!104037 e!581308)))

(declare-fun res!688674 () Bool)

(assert (=> b!1029597 (=> (not res!688674) (not e!581308))))

(assert (=> b!1029597 (= res!688674 (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(declare-fun b!1029598 () Bool)

(assert (=> b!1029598 (= e!581310 e!581311)))

(assert (=> b!1029598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(declare-fun res!688673 () Bool)

(assert (=> b!1029598 (= res!688673 (contains!5972 lt!453882 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (=> b!1029598 (=> (not res!688673) (not e!581311))))

(declare-fun b!1029599 () Bool)

(declare-fun res!688671 () Bool)

(assert (=> b!1029599 (=> (not res!688671) (not e!581307))))

(assert (=> b!1029599 (= res!688671 (not (contains!5972 lt!453882 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029600 () Bool)

(assert (=> b!1029600 (= e!581308 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (=> b!1029600 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1029601 () Bool)

(declare-fun lt!453879 () Unit!33605)

(declare-fun lt!453880 () Unit!33605)

(assert (=> b!1029601 (= lt!453879 lt!453880)))

(declare-fun lt!453877 () V!37293)

(declare-fun lt!453881 () (_ BitVec 64))

(declare-fun lt!453876 () ListLongMap!13683)

(declare-fun lt!453878 () (_ BitVec 64))

(assert (=> b!1029601 (not (contains!5972 (+!3101 lt!453876 (tuple2!15561 lt!453878 lt!453877)) lt!453881))))

(assert (=> b!1029601 (= lt!453880 (addStillNotContains!240 lt!453876 lt!453878 lt!453877 lt!453881))))

(assert (=> b!1029601 (= lt!453881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029601 (= lt!453877 (get!16356 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029601 (= lt!453878 (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))

(declare-fun call!43491 () ListLongMap!13683)

(assert (=> b!1029601 (= lt!453876 call!43491)))

(declare-fun e!581305 () ListLongMap!13683)

(assert (=> b!1029601 (= e!581305 (+!3101 call!43491 (tuple2!15561 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) (get!16356 (select (arr!31150 lt!453577) #b00000000000000000000000000000000) (dynLambda!1954 (defaultEntry!6115 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029603 () Bool)

(declare-fun e!581309 () Bool)

(assert (=> b!1029603 (= e!581309 (isEmpty!924 lt!453882))))

(declare-fun b!1029604 () Bool)

(declare-fun e!581306 () ListLongMap!13683)

(assert (=> b!1029604 (= e!581306 (ListLongMap!13684 Nil!21820))))

(declare-fun b!1029605 () Bool)

(assert (=> b!1029605 (= e!581305 call!43491)))

(declare-fun bm!43488 () Bool)

(assert (=> bm!43488 (= call!43491 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6115 thiss!1427)))))

(declare-fun b!1029606 () Bool)

(assert (=> b!1029606 (= e!581309 (= lt!453882 (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6115 thiss!1427))))))

(declare-fun b!1029607 () Bool)

(assert (=> b!1029607 (= e!581310 e!581309)))

(declare-fun c!104036 () Bool)

(assert (=> b!1029607 (= c!104036 (bvslt #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(declare-fun b!1029602 () Bool)

(assert (=> b!1029602 (= e!581306 e!581305)))

(declare-fun c!104034 () Bool)

(assert (=> b!1029602 (= c!104034 (validKeyInArray!0 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun d!123305 () Bool)

(assert (=> d!123305 e!581307))

(declare-fun res!688672 () Bool)

(assert (=> d!123305 (=> (not res!688672) (not e!581307))))

(assert (=> d!123305 (= res!688672 (not (contains!5972 lt!453882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123305 (= lt!453882 e!581306)))

(declare-fun c!104035 () Bool)

(assert (=> d!123305 (= c!104035 (bvsge #b00000000000000000000000000000000 (size!31664 lt!453576)))))

(assert (=> d!123305 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123305 (= (getCurrentListMapNoExtraKeys!3517 lt!453576 lt!453577 (mask!29867 thiss!1427) (extraKeys!5847 thiss!1427) (zeroValue!5951 thiss!1427) (minValue!5951 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6115 thiss!1427)) lt!453882)))

(assert (= (and d!123305 c!104035) b!1029604))

(assert (= (and d!123305 (not c!104035)) b!1029602))

(assert (= (and b!1029602 c!104034) b!1029601))

(assert (= (and b!1029602 (not c!104034)) b!1029605))

(assert (= (or b!1029601 b!1029605) bm!43488))

(assert (= (and d!123305 res!688672) b!1029599))

(assert (= (and b!1029599 res!688671) b!1029597))

(assert (= (and b!1029597 res!688674) b!1029600))

(assert (= (and b!1029597 c!104037) b!1029598))

(assert (= (and b!1029597 (not c!104037)) b!1029607))

(assert (= (and b!1029598 res!688673) b!1029596))

(assert (= (and b!1029607 c!104036) b!1029606))

(assert (= (and b!1029607 (not c!104036)) b!1029603))

(declare-fun b_lambda!15875 () Bool)

(assert (=> (not b_lambda!15875) (not b!1029596)))

(assert (=> b!1029596 t!30912))

(declare-fun b_and!32937 () Bool)

(assert (= b_and!32935 (and (=> t!30912 result!14149) b_and!32937)))

(declare-fun b_lambda!15877 () Bool)

(assert (=> (not b_lambda!15877) (not b!1029601)))

(assert (=> b!1029601 t!30912))

(declare-fun b_and!32939 () Bool)

(assert (= b_and!32937 (and (=> t!30912 result!14149) b_and!32939)))

(declare-fun m!948819 () Bool)

(assert (=> bm!43488 m!948819))

(declare-fun m!948821 () Bool)

(assert (=> d!123305 m!948821))

(assert (=> d!123305 m!948383))

(declare-fun m!948823 () Bool)

(assert (=> b!1029603 m!948823))

(assert (=> b!1029600 m!948395))

(assert (=> b!1029600 m!948395))

(assert (=> b!1029600 m!948441))

(assert (=> b!1029596 m!948437))

(assert (=> b!1029596 m!948319))

(assert (=> b!1029596 m!948395))

(declare-fun m!948825 () Bool)

(assert (=> b!1029596 m!948825))

(assert (=> b!1029596 m!948395))

(assert (=> b!1029596 m!948437))

(assert (=> b!1029596 m!948319))

(assert (=> b!1029596 m!948439))

(assert (=> b!1029602 m!948395))

(assert (=> b!1029602 m!948395))

(assert (=> b!1029602 m!948441))

(declare-fun m!948827 () Bool)

(assert (=> b!1029601 m!948827))

(assert (=> b!1029601 m!948437))

(declare-fun m!948829 () Bool)

(assert (=> b!1029601 m!948829))

(assert (=> b!1029601 m!948827))

(declare-fun m!948831 () Bool)

(assert (=> b!1029601 m!948831))

(assert (=> b!1029601 m!948319))

(declare-fun m!948833 () Bool)

(assert (=> b!1029601 m!948833))

(assert (=> b!1029601 m!948395))

(assert (=> b!1029601 m!948437))

(assert (=> b!1029601 m!948319))

(assert (=> b!1029601 m!948439))

(assert (=> b!1029598 m!948395))

(assert (=> b!1029598 m!948395))

(declare-fun m!948835 () Bool)

(assert (=> b!1029598 m!948835))

(declare-fun m!948837 () Bool)

(assert (=> b!1029599 m!948837))

(assert (=> b!1029606 m!948819))

(assert (=> bm!43449 d!123305))

(declare-fun d!123307 () Bool)

(declare-fun e!581312 () Bool)

(assert (=> d!123307 e!581312))

(declare-fun res!688675 () Bool)

(assert (=> d!123307 (=> res!688675 e!581312)))

(declare-fun lt!453885 () Bool)

(assert (=> d!123307 (= res!688675 (not lt!453885))))

(declare-fun lt!453886 () Bool)

(assert (=> d!123307 (= lt!453885 lt!453886)))

(declare-fun lt!453884 () Unit!33605)

(declare-fun e!581313 () Unit!33605)

(assert (=> d!123307 (= lt!453884 e!581313)))

(declare-fun c!104038 () Bool)

(assert (=> d!123307 (= c!104038 lt!453886)))

(assert (=> d!123307 (= lt!453886 (containsKey!561 (toList!6857 lt!453685) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (=> d!123307 (= (contains!5972 lt!453685 (select (arr!31149 lt!453576) #b00000000000000000000000000000000)) lt!453885)))

(declare-fun b!1029608 () Bool)

(declare-fun lt!453883 () Unit!33605)

(assert (=> b!1029608 (= e!581313 lt!453883)))

(assert (=> b!1029608 (= lt!453883 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453685) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(assert (=> b!1029608 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453685) (select (arr!31149 lt!453576) #b00000000000000000000000000000000)))))

(declare-fun b!1029609 () Bool)

(declare-fun Unit!33621 () Unit!33605)

(assert (=> b!1029609 (= e!581313 Unit!33621)))

(declare-fun b!1029610 () Bool)

(assert (=> b!1029610 (= e!581312 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453685) (select (arr!31149 lt!453576) #b00000000000000000000000000000000))))))

(assert (= (and d!123307 c!104038) b!1029608))

(assert (= (and d!123307 (not c!104038)) b!1029609))

(assert (= (and d!123307 (not res!688675)) b!1029610))

(assert (=> d!123307 m!948395))

(declare-fun m!948839 () Bool)

(assert (=> d!123307 m!948839))

(assert (=> b!1029608 m!948395))

(declare-fun m!948841 () Bool)

(assert (=> b!1029608 m!948841))

(assert (=> b!1029608 m!948395))

(assert (=> b!1029608 m!948701))

(assert (=> b!1029608 m!948701))

(declare-fun m!948843 () Bool)

(assert (=> b!1029608 m!948843))

(assert (=> b!1029610 m!948395))

(assert (=> b!1029610 m!948701))

(assert (=> b!1029610 m!948701))

(assert (=> b!1029610 m!948843))

(assert (=> b!1029270 d!123307))

(assert (=> b!1029347 d!123297))

(declare-fun d!123309 () Bool)

(assert (=> d!123309 (= (apply!903 (+!3101 lt!453697 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))) lt!453700) (get!16357 (getValueByKey!586 (toList!6857 (+!3101 lt!453697 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))) lt!453700)))))

(declare-fun bs!30065 () Bool)

(assert (= bs!30065 d!123309))

(declare-fun m!948845 () Bool)

(assert (=> bs!30065 m!948845))

(assert (=> bs!30065 m!948845))

(declare-fun m!948847 () Bool)

(assert (=> bs!30065 m!948847))

(assert (=> b!1029314 d!123309))

(declare-fun d!123311 () Bool)

(assert (=> d!123311 (= (apply!903 lt!453701 lt!453714) (get!16357 (getValueByKey!586 (toList!6857 lt!453701) lt!453714)))))

(declare-fun bs!30066 () Bool)

(assert (= bs!30066 d!123311))

(declare-fun m!948849 () Bool)

(assert (=> bs!30066 m!948849))

(assert (=> bs!30066 m!948849))

(declare-fun m!948851 () Bool)

(assert (=> bs!30066 m!948851))

(assert (=> b!1029314 d!123311))

(declare-fun d!123313 () Bool)

(declare-fun e!581314 () Bool)

(assert (=> d!123313 e!581314))

(declare-fun res!688676 () Bool)

(assert (=> d!123313 (=> (not res!688676) (not e!581314))))

(declare-fun lt!453889 () ListLongMap!13683)

(assert (=> d!123313 (= res!688676 (contains!5972 lt!453889 (_1!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))))))

(declare-fun lt!453890 () List!21823)

(assert (=> d!123313 (= lt!453889 (ListLongMap!13684 lt!453890))))

(declare-fun lt!453888 () Unit!33605)

(declare-fun lt!453887 () Unit!33605)

(assert (=> d!123313 (= lt!453888 lt!453887)))

(assert (=> d!123313 (= (getValueByKey!586 lt!453890 (_1!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))))))

(assert (=> d!123313 (= lt!453887 (lemmaContainsTupThenGetReturnValue!277 lt!453890 (_1!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))))))

(assert (=> d!123313 (= lt!453890 (insertStrictlySorted!370 (toList!6857 lt!453701) (_1!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))))))

(assert (=> d!123313 (= (+!3101 lt!453701 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))) lt!453889)))

(declare-fun b!1029611 () Bool)

(declare-fun res!688677 () Bool)

(assert (=> b!1029611 (=> (not res!688677) (not e!581314))))

(assert (=> b!1029611 (= res!688677 (= (getValueByKey!586 (toList!6857 lt!453889) (_1!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))))))))

(declare-fun b!1029612 () Bool)

(assert (=> b!1029612 (= e!581314 (contains!5974 (toList!6857 lt!453889) (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))))))

(assert (= (and d!123313 res!688676) b!1029611))

(assert (= (and b!1029611 res!688677) b!1029612))

(declare-fun m!948853 () Bool)

(assert (=> d!123313 m!948853))

(declare-fun m!948855 () Bool)

(assert (=> d!123313 m!948855))

(declare-fun m!948857 () Bool)

(assert (=> d!123313 m!948857))

(declare-fun m!948859 () Bool)

(assert (=> d!123313 m!948859))

(declare-fun m!948861 () Bool)

(assert (=> b!1029611 m!948861))

(declare-fun m!948863 () Bool)

(assert (=> b!1029612 m!948863))

(assert (=> b!1029314 d!123313))

(declare-fun d!123315 () Bool)

(assert (=> d!123315 (= (apply!903 lt!453710 lt!453708) (get!16357 (getValueByKey!586 (toList!6857 lt!453710) lt!453708)))))

(declare-fun bs!30067 () Bool)

(assert (= bs!30067 d!123315))

(declare-fun m!948865 () Bool)

(assert (=> bs!30067 m!948865))

(assert (=> bs!30067 m!948865))

(declare-fun m!948867 () Bool)

(assert (=> bs!30067 m!948867))

(assert (=> b!1029314 d!123315))

(declare-fun d!123317 () Bool)

(assert (=> d!123317 (contains!5972 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))) lt!453696)))

(declare-fun lt!453893 () Unit!33605)

(declare-fun choose!1690 (ListLongMap!13683 (_ BitVec 64) V!37293 (_ BitVec 64)) Unit!33605)

(assert (=> d!123317 (= lt!453893 (choose!1690 lt!453709 lt!453716 (zeroValue!5951 thiss!1427) lt!453696))))

(assert (=> d!123317 (contains!5972 lt!453709 lt!453696)))

(assert (=> d!123317 (= (addStillContains!622 lt!453709 lt!453716 (zeroValue!5951 thiss!1427) lt!453696) lt!453893)))

(declare-fun bs!30068 () Bool)

(assert (= bs!30068 d!123317))

(assert (=> bs!30068 m!948473))

(assert (=> bs!30068 m!948473))

(assert (=> bs!30068 m!948475))

(declare-fun m!948869 () Bool)

(assert (=> bs!30068 m!948869))

(declare-fun m!948871 () Bool)

(assert (=> bs!30068 m!948871))

(assert (=> b!1029314 d!123317))

(declare-fun d!123319 () Bool)

(assert (=> d!123319 (= (apply!903 (+!3101 lt!453701 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))) lt!453714) (apply!903 lt!453701 lt!453714))))

(declare-fun lt!453896 () Unit!33605)

(declare-fun choose!1691 (ListLongMap!13683 (_ BitVec 64) V!37293 (_ BitVec 64)) Unit!33605)

(assert (=> d!123319 (= lt!453896 (choose!1691 lt!453701 lt!453699 (minValue!5951 thiss!1427) lt!453714))))

(declare-fun e!581317 () Bool)

(assert (=> d!123319 e!581317))

(declare-fun res!688680 () Bool)

(assert (=> d!123319 (=> (not res!688680) (not e!581317))))

(assert (=> d!123319 (= res!688680 (contains!5972 lt!453701 lt!453714))))

(assert (=> d!123319 (= (addApplyDifferent!482 lt!453701 lt!453699 (minValue!5951 thiss!1427) lt!453714) lt!453896)))

(declare-fun b!1029617 () Bool)

(assert (=> b!1029617 (= e!581317 (not (= lt!453714 lt!453699)))))

(assert (= (and d!123319 res!688680) b!1029617))

(declare-fun m!948873 () Bool)

(assert (=> d!123319 m!948873))

(assert (=> d!123319 m!948481))

(assert (=> d!123319 m!948485))

(assert (=> d!123319 m!948481))

(assert (=> d!123319 m!948501))

(declare-fun m!948875 () Bool)

(assert (=> d!123319 m!948875))

(assert (=> b!1029314 d!123319))

(declare-fun d!123321 () Bool)

(assert (=> d!123321 (= (apply!903 (+!3101 lt!453710 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))) lt!453708) (apply!903 lt!453710 lt!453708))))

(declare-fun lt!453897 () Unit!33605)

(assert (=> d!123321 (= lt!453897 (choose!1691 lt!453710 lt!453715 (zeroValue!5951 thiss!1427) lt!453708))))

(declare-fun e!581318 () Bool)

(assert (=> d!123321 e!581318))

(declare-fun res!688681 () Bool)

(assert (=> d!123321 (=> (not res!688681) (not e!581318))))

(assert (=> d!123321 (= res!688681 (contains!5972 lt!453710 lt!453708))))

(assert (=> d!123321 (= (addApplyDifferent!482 lt!453710 lt!453715 (zeroValue!5951 thiss!1427) lt!453708) lt!453897)))

(declare-fun b!1029618 () Bool)

(assert (=> b!1029618 (= e!581318 (not (= lt!453708 lt!453715)))))

(assert (= (and d!123321 res!688681) b!1029618))

(declare-fun m!948877 () Bool)

(assert (=> d!123321 m!948877))

(assert (=> d!123321 m!948491))

(assert (=> d!123321 m!948497))

(assert (=> d!123321 m!948491))

(assert (=> d!123321 m!948493))

(declare-fun m!948879 () Bool)

(assert (=> d!123321 m!948879))

(assert (=> b!1029314 d!123321))

(declare-fun d!123323 () Bool)

(declare-fun e!581319 () Bool)

(assert (=> d!123323 e!581319))

(declare-fun res!688682 () Bool)

(assert (=> d!123323 (=> res!688682 e!581319)))

(declare-fun lt!453900 () Bool)

(assert (=> d!123323 (= res!688682 (not lt!453900))))

(declare-fun lt!453901 () Bool)

(assert (=> d!123323 (= lt!453900 lt!453901)))

(declare-fun lt!453899 () Unit!33605)

(declare-fun e!581320 () Unit!33605)

(assert (=> d!123323 (= lt!453899 e!581320)))

(declare-fun c!104039 () Bool)

(assert (=> d!123323 (= c!104039 lt!453901)))

(assert (=> d!123323 (= lt!453901 (containsKey!561 (toList!6857 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))) lt!453696))))

(assert (=> d!123323 (= (contains!5972 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))) lt!453696) lt!453900)))

(declare-fun b!1029619 () Bool)

(declare-fun lt!453898 () Unit!33605)

(assert (=> b!1029619 (= e!581320 lt!453898)))

(assert (=> b!1029619 (= lt!453898 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))) lt!453696))))

(assert (=> b!1029619 (isDefined!433 (getValueByKey!586 (toList!6857 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))) lt!453696))))

(declare-fun b!1029620 () Bool)

(declare-fun Unit!33622 () Unit!33605)

(assert (=> b!1029620 (= e!581320 Unit!33622)))

(declare-fun b!1029621 () Bool)

(assert (=> b!1029621 (= e!581319 (isDefined!433 (getValueByKey!586 (toList!6857 (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))) lt!453696)))))

(assert (= (and d!123323 c!104039) b!1029619))

(assert (= (and d!123323 (not c!104039)) b!1029620))

(assert (= (and d!123323 (not res!688682)) b!1029621))

(declare-fun m!948881 () Bool)

(assert (=> d!123323 m!948881))

(declare-fun m!948883 () Bool)

(assert (=> b!1029619 m!948883))

(declare-fun m!948885 () Bool)

(assert (=> b!1029619 m!948885))

(assert (=> b!1029619 m!948885))

(declare-fun m!948887 () Bool)

(assert (=> b!1029619 m!948887))

(assert (=> b!1029621 m!948885))

(assert (=> b!1029621 m!948885))

(assert (=> b!1029621 m!948887))

(assert (=> b!1029314 d!123323))

(declare-fun d!123325 () Bool)

(assert (=> d!123325 (= (apply!903 lt!453697 lt!453700) (get!16357 (getValueByKey!586 (toList!6857 lt!453697) lt!453700)))))

(declare-fun bs!30069 () Bool)

(assert (= bs!30069 d!123325))

(declare-fun m!948889 () Bool)

(assert (=> bs!30069 m!948889))

(assert (=> bs!30069 m!948889))

(declare-fun m!948891 () Bool)

(assert (=> bs!30069 m!948891))

(assert (=> b!1029314 d!123325))

(declare-fun d!123327 () Bool)

(declare-fun e!581321 () Bool)

(assert (=> d!123327 e!581321))

(declare-fun res!688683 () Bool)

(assert (=> d!123327 (=> (not res!688683) (not e!581321))))

(declare-fun lt!453904 () ListLongMap!13683)

(assert (=> d!123327 (= res!688683 (contains!5972 lt!453904 (_1!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))))))

(declare-fun lt!453905 () List!21823)

(assert (=> d!123327 (= lt!453904 (ListLongMap!13684 lt!453905))))

(declare-fun lt!453903 () Unit!33605)

(declare-fun lt!453902 () Unit!33605)

(assert (=> d!123327 (= lt!453903 lt!453902)))

(assert (=> d!123327 (= (getValueByKey!586 lt!453905 (_1!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123327 (= lt!453902 (lemmaContainsTupThenGetReturnValue!277 lt!453905 (_1!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123327 (= lt!453905 (insertStrictlySorted!370 (toList!6857 lt!453709) (_1!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123327 (= (+!3101 lt!453709 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))) lt!453904)))

(declare-fun b!1029622 () Bool)

(declare-fun res!688684 () Bool)

(assert (=> b!1029622 (=> (not res!688684) (not e!581321))))

(assert (=> b!1029622 (= res!688684 (= (getValueByKey!586 (toList!6857 lt!453904) (_1!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))))))))

(declare-fun b!1029623 () Bool)

(assert (=> b!1029623 (= e!581321 (contains!5974 (toList!6857 lt!453904) (tuple2!15561 lt!453716 (zeroValue!5951 thiss!1427))))))

(assert (= (and d!123327 res!688683) b!1029622))

(assert (= (and b!1029622 res!688684) b!1029623))

(declare-fun m!948893 () Bool)

(assert (=> d!123327 m!948893))

(declare-fun m!948895 () Bool)

(assert (=> d!123327 m!948895))

(declare-fun m!948897 () Bool)

(assert (=> d!123327 m!948897))

(declare-fun m!948899 () Bool)

(assert (=> d!123327 m!948899))

(declare-fun m!948901 () Bool)

(assert (=> b!1029622 m!948901))

(declare-fun m!948903 () Bool)

(assert (=> b!1029623 m!948903))

(assert (=> b!1029314 d!123327))

(declare-fun d!123329 () Bool)

(assert (=> d!123329 (= (apply!903 (+!3101 lt!453697 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))) lt!453700) (apply!903 lt!453697 lt!453700))))

(declare-fun lt!453906 () Unit!33605)

(assert (=> d!123329 (= lt!453906 (choose!1691 lt!453697 lt!453702 (minValue!5951 thiss!1427) lt!453700))))

(declare-fun e!581322 () Bool)

(assert (=> d!123329 e!581322))

(declare-fun res!688685 () Bool)

(assert (=> d!123329 (=> (not res!688685) (not e!581322))))

(assert (=> d!123329 (= res!688685 (contains!5972 lt!453697 lt!453700))))

(assert (=> d!123329 (= (addApplyDifferent!482 lt!453697 lt!453702 (minValue!5951 thiss!1427) lt!453700) lt!453906)))

(declare-fun b!1029624 () Bool)

(assert (=> b!1029624 (= e!581322 (not (= lt!453700 lt!453702)))))

(assert (= (and d!123329 res!688685) b!1029624))

(declare-fun m!948905 () Bool)

(assert (=> d!123329 m!948905))

(assert (=> d!123329 m!948487))

(assert (=> d!123329 m!948477))

(assert (=> d!123329 m!948487))

(assert (=> d!123329 m!948489))

(declare-fun m!948907 () Bool)

(assert (=> d!123329 m!948907))

(assert (=> b!1029314 d!123329))

(declare-fun d!123331 () Bool)

(assert (=> d!123331 (= (apply!903 (+!3101 lt!453710 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))) lt!453708) (get!16357 (getValueByKey!586 (toList!6857 (+!3101 lt!453710 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))) lt!453708)))))

(declare-fun bs!30070 () Bool)

(assert (= bs!30070 d!123331))

(declare-fun m!948909 () Bool)

(assert (=> bs!30070 m!948909))

(assert (=> bs!30070 m!948909))

(declare-fun m!948911 () Bool)

(assert (=> bs!30070 m!948911))

(assert (=> b!1029314 d!123331))

(declare-fun d!123333 () Bool)

(assert (=> d!123333 (= (apply!903 (+!3101 lt!453701 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427))) lt!453714) (get!16357 (getValueByKey!586 (toList!6857 (+!3101 lt!453701 (tuple2!15561 lt!453699 (minValue!5951 thiss!1427)))) lt!453714)))))

(declare-fun bs!30071 () Bool)

(assert (= bs!30071 d!123333))

(declare-fun m!948913 () Bool)

(assert (=> bs!30071 m!948913))

(assert (=> bs!30071 m!948913))

(declare-fun m!948915 () Bool)

(assert (=> bs!30071 m!948915))

(assert (=> b!1029314 d!123333))

(declare-fun d!123335 () Bool)

(declare-fun e!581323 () Bool)

(assert (=> d!123335 e!581323))

(declare-fun res!688686 () Bool)

(assert (=> d!123335 (=> (not res!688686) (not e!581323))))

(declare-fun lt!453909 () ListLongMap!13683)

(assert (=> d!123335 (= res!688686 (contains!5972 lt!453909 (_1!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))))))

(declare-fun lt!453910 () List!21823)

(assert (=> d!123335 (= lt!453909 (ListLongMap!13684 lt!453910))))

(declare-fun lt!453908 () Unit!33605)

(declare-fun lt!453907 () Unit!33605)

(assert (=> d!123335 (= lt!453908 lt!453907)))

(assert (=> d!123335 (= (getValueByKey!586 lt!453910 (_1!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))))))

(assert (=> d!123335 (= lt!453907 (lemmaContainsTupThenGetReturnValue!277 lt!453910 (_1!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))))))

(assert (=> d!123335 (= lt!453910 (insertStrictlySorted!370 (toList!6857 lt!453697) (_1!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))))))

(assert (=> d!123335 (= (+!3101 lt!453697 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))) lt!453909)))

(declare-fun b!1029625 () Bool)

(declare-fun res!688687 () Bool)

(assert (=> b!1029625 (=> (not res!688687) (not e!581323))))

(assert (=> b!1029625 (= res!688687 (= (getValueByKey!586 (toList!6857 lt!453909) (_1!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))))))))

(declare-fun b!1029626 () Bool)

(assert (=> b!1029626 (= e!581323 (contains!5974 (toList!6857 lt!453909) (tuple2!15561 lt!453702 (minValue!5951 thiss!1427))))))

(assert (= (and d!123335 res!688686) b!1029625))

(assert (= (and b!1029625 res!688687) b!1029626))

(declare-fun m!948917 () Bool)

(assert (=> d!123335 m!948917))

(declare-fun m!948919 () Bool)

(assert (=> d!123335 m!948919))

(declare-fun m!948921 () Bool)

(assert (=> d!123335 m!948921))

(declare-fun m!948923 () Bool)

(assert (=> d!123335 m!948923))

(declare-fun m!948925 () Bool)

(assert (=> b!1029625 m!948925))

(declare-fun m!948927 () Bool)

(assert (=> b!1029626 m!948927))

(assert (=> b!1029314 d!123335))

(declare-fun d!123337 () Bool)

(declare-fun e!581324 () Bool)

(assert (=> d!123337 e!581324))

(declare-fun res!688688 () Bool)

(assert (=> d!123337 (=> (not res!688688) (not e!581324))))

(declare-fun lt!453913 () ListLongMap!13683)

(assert (=> d!123337 (= res!688688 (contains!5972 lt!453913 (_1!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))))))

(declare-fun lt!453914 () List!21823)

(assert (=> d!123337 (= lt!453913 (ListLongMap!13684 lt!453914))))

(declare-fun lt!453912 () Unit!33605)

(declare-fun lt!453911 () Unit!33605)

(assert (=> d!123337 (= lt!453912 lt!453911)))

(assert (=> d!123337 (= (getValueByKey!586 lt!453914 (_1!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123337 (= lt!453911 (lemmaContainsTupThenGetReturnValue!277 lt!453914 (_1!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123337 (= lt!453914 (insertStrictlySorted!370 (toList!6857 lt!453710) (_1!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123337 (= (+!3101 lt!453710 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))) lt!453913)))

(declare-fun b!1029627 () Bool)

(declare-fun res!688689 () Bool)

(assert (=> b!1029627 (=> (not res!688689) (not e!581324))))

(assert (=> b!1029627 (= res!688689 (= (getValueByKey!586 (toList!6857 lt!453913) (_1!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))))))))

(declare-fun b!1029628 () Bool)

(assert (=> b!1029628 (= e!581324 (contains!5974 (toList!6857 lt!453913) (tuple2!15561 lt!453715 (zeroValue!5951 thiss!1427))))))

(assert (= (and d!123337 res!688688) b!1029627))

(assert (= (and b!1029627 res!688689) b!1029628))

(declare-fun m!948929 () Bool)

(assert (=> d!123337 m!948929))

(declare-fun m!948931 () Bool)

(assert (=> d!123337 m!948931))

(declare-fun m!948933 () Bool)

(assert (=> d!123337 m!948933))

(declare-fun m!948935 () Bool)

(assert (=> d!123337 m!948935))

(declare-fun m!948937 () Bool)

(assert (=> b!1029627 m!948937))

(declare-fun m!948939 () Bool)

(assert (=> b!1029628 m!948939))

(assert (=> b!1029314 d!123337))

(assert (=> b!1029314 d!123271))

(declare-fun d!123339 () Bool)

(assert (=> d!123339 (= (arrayCountValidKeys!0 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11276 thiss!1427) #b00000000000000000000000000000000 (size!31664 (_keys!11276 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123339 true))

(declare-fun _$79!14 () Unit!33605)

(assert (=> d!123339 (= (choose!82 (_keys!11276 thiss!1427) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!14)))

(declare-fun bs!30072 () Bool)

(assert (= bs!30072 d!123339))

(assert (=> bs!30072 m!948287))

(assert (=> bs!30072 m!948457))

(assert (=> bs!30072 m!948311))

(assert (=> d!123201 d!123339))

(declare-fun d!123341 () Bool)

(declare-fun e!581325 () Bool)

(assert (=> d!123341 e!581325))

(declare-fun res!688690 () Bool)

(assert (=> d!123341 (=> res!688690 e!581325)))

(declare-fun lt!453917 () Bool)

(assert (=> d!123341 (= res!688690 (not lt!453917))))

(declare-fun lt!453918 () Bool)

(assert (=> d!123341 (= lt!453917 lt!453918)))

(declare-fun lt!453916 () Unit!33605)

(declare-fun e!581326 () Unit!33605)

(assert (=> d!123341 (= lt!453916 e!581326)))

(declare-fun c!104040 () Bool)

(assert (=> d!123341 (= c!104040 lt!453918)))

(assert (=> d!123341 (= lt!453918 (containsKey!561 (toList!6857 lt!453685) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123341 (= (contains!5972 lt!453685 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453917)))

(declare-fun b!1029629 () Bool)

(declare-fun lt!453915 () Unit!33605)

(assert (=> b!1029629 (= e!581326 lt!453915)))

(assert (=> b!1029629 (= lt!453915 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 lt!453685) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029629 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453685) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029630 () Bool)

(declare-fun Unit!33623 () Unit!33605)

(assert (=> b!1029630 (= e!581326 Unit!33623)))

(declare-fun b!1029631 () Bool)

(assert (=> b!1029631 (= e!581325 (isDefined!433 (getValueByKey!586 (toList!6857 lt!453685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123341 c!104040) b!1029629))

(assert (= (and d!123341 (not c!104040)) b!1029630))

(assert (= (and d!123341 (not res!688690)) b!1029631))

(declare-fun m!948941 () Bool)

(assert (=> d!123341 m!948941))

(declare-fun m!948943 () Bool)

(assert (=> b!1029629 m!948943))

(declare-fun m!948945 () Bool)

(assert (=> b!1029629 m!948945))

(assert (=> b!1029629 m!948945))

(declare-fun m!948947 () Bool)

(assert (=> b!1029629 m!948947))

(assert (=> b!1029631 m!948945))

(assert (=> b!1029631 m!948945))

(assert (=> b!1029631 m!948947))

(assert (=> bm!43447 d!123341))

(assert (=> b!1029312 d!123297))

(declare-fun d!123343 () Bool)

(declare-fun res!688691 () Bool)

(declare-fun e!581327 () Bool)

(assert (=> d!123343 (=> res!688691 e!581327)))

(assert (=> d!123343 (= res!688691 (= (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123343 (= (arrayContainsKey!0 lt!453576 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!581327)))

(declare-fun b!1029632 () Bool)

(declare-fun e!581328 () Bool)

(assert (=> b!1029632 (= e!581327 e!581328)))

(declare-fun res!688692 () Bool)

(assert (=> b!1029632 (=> (not res!688692) (not e!581328))))

(assert (=> b!1029632 (= res!688692 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31664 lt!453576)))))

(declare-fun b!1029633 () Bool)

(assert (=> b!1029633 (= e!581328 (arrayContainsKey!0 lt!453576 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123343 (not res!688691)) b!1029632))

(assert (= (and b!1029632 res!688692) b!1029633))

(assert (=> d!123343 m!948555))

(declare-fun m!948949 () Bool)

(assert (=> b!1029633 m!948949))

(assert (=> b!1029375 d!123343))

(assert (=> b!1029365 d!123225))

(declare-fun d!123345 () Bool)

(assert (=> d!123345 (= (apply!903 lt!453685 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16357 (getValueByKey!586 (toList!6857 lt!453685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30073 () Bool)

(assert (= bs!30073 d!123345))

(assert (=> bs!30073 m!948945))

(assert (=> bs!30073 m!948945))

(declare-fun m!948951 () Bool)

(assert (=> bs!30073 m!948951))

(assert (=> b!1029267 d!123345))

(assert (=> b!1029265 d!123225))

(declare-fun d!123347 () Bool)

(assert (=> d!123347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64689 (store (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31664 (_keys!11276 thiss!1427))) (mask!29867 thiss!1427))))

(assert (=> d!123347 true))

(declare-fun _$44!15 () Unit!33605)

(assert (=> d!123347 (= (choose!25 (_keys!11276 thiss!1427) (index!41104 lt!453581) (mask!29867 thiss!1427)) _$44!15)))

(declare-fun bs!30074 () Bool)

(assert (= bs!30074 d!123347))

(assert (=> bs!30074 m!948287))

(assert (=> bs!30074 m!948451))

(assert (=> d!123197 d!123347))

(assert (=> d!123197 d!123235))

(declare-fun d!123349 () Bool)

(declare-fun res!688695 () Bool)

(declare-fun e!581330 () Bool)

(assert (=> d!123349 (=> res!688695 e!581330)))

(assert (=> d!123349 (= res!688695 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31664 lt!453576)))))

(assert (=> d!123349 (= (arrayNoDuplicates!0 lt!453576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103967 (Cons!21820 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) Nil!21821) Nil!21821)) e!581330)))

(declare-fun b!1029634 () Bool)

(declare-fun e!581329 () Bool)

(assert (=> b!1029634 (= e!581329 (contains!5973 (ite c!103967 (Cons!21820 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) Nil!21821) Nil!21821) (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!43492 () Bool)

(declare-fun bm!43489 () Bool)

(declare-fun c!104041 () Bool)

(assert (=> bm!43489 (= call!43492 (arrayNoDuplicates!0 lt!453576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104041 (Cons!21820 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!103967 (Cons!21820 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) Nil!21821) Nil!21821)) (ite c!103967 (Cons!21820 (select (arr!31149 lt!453576) #b00000000000000000000000000000000) Nil!21821) Nil!21821))))))

(declare-fun b!1029635 () Bool)

(declare-fun e!581332 () Bool)

(assert (=> b!1029635 (= e!581332 call!43492)))

(declare-fun b!1029636 () Bool)

(assert (=> b!1029636 (= e!581332 call!43492)))

(declare-fun b!1029637 () Bool)

(declare-fun e!581331 () Bool)

(assert (=> b!1029637 (= e!581330 e!581331)))

(declare-fun res!688693 () Bool)

(assert (=> b!1029637 (=> (not res!688693) (not e!581331))))

(assert (=> b!1029637 (= res!688693 (not e!581329))))

(declare-fun res!688694 () Bool)

(assert (=> b!1029637 (=> (not res!688694) (not e!581329))))

(assert (=> b!1029637 (= res!688694 (validKeyInArray!0 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029638 () Bool)

(assert (=> b!1029638 (= e!581331 e!581332)))

(assert (=> b!1029638 (= c!104041 (validKeyInArray!0 (select (arr!31149 lt!453576) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123349 (not res!688695)) b!1029637))

(assert (= (and b!1029637 res!688694) b!1029634))

(assert (= (and b!1029637 res!688693) b!1029638))

(assert (= (and b!1029638 c!104041) b!1029636))

(assert (= (and b!1029638 (not c!104041)) b!1029635))

(assert (= (or b!1029636 b!1029635) bm!43489))

(assert (=> b!1029634 m!948555))

(assert (=> b!1029634 m!948555))

(declare-fun m!948953 () Bool)

(assert (=> b!1029634 m!948953))

(assert (=> bm!43489 m!948555))

(declare-fun m!948955 () Bool)

(assert (=> bm!43489 m!948955))

(assert (=> b!1029637 m!948555))

(assert (=> b!1029637 m!948555))

(assert (=> b!1029637 m!948557))

(assert (=> b!1029638 m!948555))

(assert (=> b!1029638 m!948555))

(assert (=> b!1029638 m!948557))

(assert (=> bm!43468 d!123349))

(declare-fun d!123351 () Bool)

(assert (=> d!123351 (= (validKeyInArray!0 (select (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581))) (and (not (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453581)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029293 d!123351))

(declare-fun d!123353 () Bool)

(declare-fun e!581333 () Bool)

(assert (=> d!123353 e!581333))

(declare-fun res!688696 () Bool)

(assert (=> d!123353 (=> (not res!688696) (not e!581333))))

(declare-fun lt!453921 () ListLongMap!13683)

(assert (=> d!123353 (= res!688696 (contains!5972 lt!453921 (_1!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(declare-fun lt!453922 () List!21823)

(assert (=> d!123353 (= lt!453921 (ListLongMap!13684 lt!453922))))

(declare-fun lt!453920 () Unit!33605)

(declare-fun lt!453919 () Unit!33605)

(assert (=> d!123353 (= lt!453920 lt!453919)))

(assert (=> d!123353 (= (getValueByKey!586 lt!453922 (_1!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))) (Some!636 (_2!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(assert (=> d!123353 (= lt!453919 (lemmaContainsTupThenGetReturnValue!277 lt!453922 (_1!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (_2!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(assert (=> d!123353 (= lt!453922 (insertStrictlySorted!370 (toList!6857 (ite c!103953 call!43458 (ite c!103950 call!43462 call!43460))) (_1!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) (_2!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))))))

(assert (=> d!123353 (= (+!3101 (ite c!103953 call!43458 (ite c!103950 call!43462 call!43460)) (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))) lt!453921)))

(declare-fun b!1029639 () Bool)

(declare-fun res!688697 () Bool)

(assert (=> b!1029639 (=> (not res!688697) (not e!581333))))

(assert (=> b!1029639 (= res!688697 (= (getValueByKey!586 (toList!6857 lt!453921) (_1!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427))))) (Some!636 (_2!7791 (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))))

(declare-fun b!1029640 () Bool)

(assert (=> b!1029640 (= e!581333 (contains!5974 (toList!6857 lt!453921) (ite (or c!103953 c!103950) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5951 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5951 thiss!1427)))))))

(assert (= (and d!123353 res!688696) b!1029639))

(assert (= (and b!1029639 res!688697) b!1029640))

(declare-fun m!948957 () Bool)

(assert (=> d!123353 m!948957))

(declare-fun m!948959 () Bool)

(assert (=> d!123353 m!948959))

(declare-fun m!948961 () Bool)

(assert (=> d!123353 m!948961))

(declare-fun m!948963 () Bool)

(assert (=> d!123353 m!948963))

(declare-fun m!948965 () Bool)

(assert (=> b!1029639 m!948965))

(declare-fun m!948967 () Bool)

(assert (=> b!1029640 m!948967))

(assert (=> bm!43455 d!123353))

(declare-fun b!1029653 () Bool)

(declare-fun e!581342 () SeekEntryResult!9683)

(declare-fun e!581341 () SeekEntryResult!9683)

(assert (=> b!1029653 (= e!581342 e!581341)))

(declare-fun c!104048 () Bool)

(declare-fun lt!453928 () (_ BitVec 64))

(assert (=> b!1029653 (= c!104048 (= lt!453928 key!909))))

(declare-fun e!581340 () SeekEntryResult!9683)

(declare-fun b!1029654 () Bool)

(assert (=> b!1029654 (= e!581340 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91589 lt!453622) #b00000000000000000000000000000001) (nextIndex!0 (index!41105 lt!453622) (x!91589 lt!453622) (mask!29867 thiss!1427)) (index!41105 lt!453622) key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)))))

(declare-fun b!1029655 () Bool)

(assert (=> b!1029655 (= e!581341 (Found!9683 (index!41105 lt!453622)))))

(declare-fun b!1029656 () Bool)

(assert (=> b!1029656 (= e!581340 (MissingVacant!9683 (index!41105 lt!453622)))))

(declare-fun lt!453927 () SeekEntryResult!9683)

(declare-fun d!123355 () Bool)

(assert (=> d!123355 (and (or ((_ is Undefined!9683) lt!453927) (not ((_ is Found!9683) lt!453927)) (and (bvsge (index!41104 lt!453927) #b00000000000000000000000000000000) (bvslt (index!41104 lt!453927) (size!31664 (_keys!11276 thiss!1427))))) (or ((_ is Undefined!9683) lt!453927) ((_ is Found!9683) lt!453927) (not ((_ is MissingVacant!9683) lt!453927)) (not (= (index!41106 lt!453927) (index!41105 lt!453622))) (and (bvsge (index!41106 lt!453927) #b00000000000000000000000000000000) (bvslt (index!41106 lt!453927) (size!31664 (_keys!11276 thiss!1427))))) (or ((_ is Undefined!9683) lt!453927) (ite ((_ is Found!9683) lt!453927) (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41104 lt!453927)) key!909) (and ((_ is MissingVacant!9683) lt!453927) (= (index!41106 lt!453927) (index!41105 lt!453622)) (= (select (arr!31149 (_keys!11276 thiss!1427)) (index!41106 lt!453927)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!123355 (= lt!453927 e!581342)))

(declare-fun c!104050 () Bool)

(assert (=> d!123355 (= c!104050 (bvsge (x!91589 lt!453622) #b01111111111111111111111111111110))))

(assert (=> d!123355 (= lt!453928 (select (arr!31149 (_keys!11276 thiss!1427)) (index!41105 lt!453622)))))

(assert (=> d!123355 (validMask!0 (mask!29867 thiss!1427))))

(assert (=> d!123355 (= (seekKeyOrZeroReturnVacant!0 (x!91589 lt!453622) (index!41105 lt!453622) (index!41105 lt!453622) key!909 (_keys!11276 thiss!1427) (mask!29867 thiss!1427)) lt!453927)))

(declare-fun b!1029657 () Bool)

(declare-fun c!104049 () Bool)

(assert (=> b!1029657 (= c!104049 (= lt!453928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029657 (= e!581341 e!581340)))

(declare-fun b!1029658 () Bool)

(assert (=> b!1029658 (= e!581342 Undefined!9683)))

(assert (= (and d!123355 c!104050) b!1029658))

(assert (= (and d!123355 (not c!104050)) b!1029653))

(assert (= (and b!1029653 c!104048) b!1029655))

(assert (= (and b!1029653 (not c!104048)) b!1029657))

(assert (= (and b!1029657 c!104049) b!1029656))

(assert (= (and b!1029657 (not c!104049)) b!1029654))

(declare-fun m!948969 () Bool)

(assert (=> b!1029654 m!948969))

(assert (=> b!1029654 m!948969))

(declare-fun m!948971 () Bool)

(assert (=> b!1029654 m!948971))

(declare-fun m!948973 () Bool)

(assert (=> d!123355 m!948973))

(declare-fun m!948975 () Bool)

(assert (=> d!123355 m!948975))

(assert (=> d!123355 m!948375))

(assert (=> d!123355 m!948383))

(assert (=> b!1029206 d!123355))

(declare-fun d!123357 () Bool)

(declare-fun e!581343 () Bool)

(assert (=> d!123357 e!581343))

(declare-fun res!688698 () Bool)

(assert (=> d!123357 (=> (not res!688698) (not e!581343))))

(declare-fun lt!453931 () ListLongMap!13683)

(assert (=> d!123357 (= res!688698 (contains!5972 lt!453931 (_1!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))))))

(declare-fun lt!453932 () List!21823)

(assert (=> d!123357 (= lt!453931 (ListLongMap!13684 lt!453932))))

(declare-fun lt!453930 () Unit!33605)

(declare-fun lt!453929 () Unit!33605)

(assert (=> d!123357 (= lt!453930 lt!453929)))

(assert (=> d!123357 (= (getValueByKey!586 lt!453932 (_1!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123357 (= lt!453929 (lemmaContainsTupThenGetReturnValue!277 lt!453932 (_1!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123357 (= lt!453932 (insertStrictlySorted!370 (toList!6857 lt!453682) (_1!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123357 (= (+!3101 lt!453682 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))) lt!453931)))

(declare-fun b!1029659 () Bool)

(declare-fun res!688699 () Bool)

(assert (=> b!1029659 (=> (not res!688699) (not e!581343))))

(assert (=> b!1029659 (= res!688699 (= (getValueByKey!586 (toList!6857 lt!453931) (_1!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))))))))

(declare-fun b!1029660 () Bool)

(assert (=> b!1029660 (= e!581343 (contains!5974 (toList!6857 lt!453931) (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))))))

(assert (= (and d!123357 res!688698) b!1029659))

(assert (= (and b!1029659 res!688699) b!1029660))

(declare-fun m!948977 () Bool)

(assert (=> d!123357 m!948977))

(declare-fun m!948979 () Bool)

(assert (=> d!123357 m!948979))

(declare-fun m!948981 () Bool)

(assert (=> d!123357 m!948981))

(declare-fun m!948983 () Bool)

(assert (=> d!123357 m!948983))

(declare-fun m!948985 () Bool)

(assert (=> b!1029659 m!948985))

(declare-fun m!948987 () Bool)

(assert (=> b!1029660 m!948987))

(assert (=> b!1029278 d!123357))

(declare-fun d!123359 () Bool)

(assert (=> d!123359 (= (apply!903 lt!453669 lt!453672) (get!16357 (getValueByKey!586 (toList!6857 lt!453669) lt!453672)))))

(declare-fun bs!30075 () Bool)

(assert (= bs!30075 d!123359))

(declare-fun m!948989 () Bool)

(assert (=> bs!30075 m!948989))

(assert (=> bs!30075 m!948989))

(declare-fun m!948991 () Bool)

(assert (=> bs!30075 m!948991))

(assert (=> b!1029278 d!123359))

(declare-fun d!123361 () Bool)

(assert (=> d!123361 (= (apply!903 (+!3101 lt!453682 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))) lt!453680) (apply!903 lt!453682 lt!453680))))

(declare-fun lt!453933 () Unit!33605)

(assert (=> d!123361 (= lt!453933 (choose!1691 lt!453682 lt!453687 (zeroValue!5951 thiss!1427) lt!453680))))

(declare-fun e!581344 () Bool)

(assert (=> d!123361 e!581344))

(declare-fun res!688700 () Bool)

(assert (=> d!123361 (=> (not res!688700) (not e!581344))))

(assert (=> d!123361 (= res!688700 (contains!5972 lt!453682 lt!453680))))

(assert (=> d!123361 (= (addApplyDifferent!482 lt!453682 lt!453687 (zeroValue!5951 thiss!1427) lt!453680) lt!453933)))

(declare-fun b!1029661 () Bool)

(assert (=> b!1029661 (= e!581344 (not (= lt!453680 lt!453687)))))

(assert (= (and d!123361 res!688700) b!1029661))

(declare-fun m!948993 () Bool)

(assert (=> d!123361 m!948993))

(assert (=> d!123361 m!948421))

(assert (=> d!123361 m!948427))

(assert (=> d!123361 m!948421))

(assert (=> d!123361 m!948423))

(declare-fun m!948995 () Bool)

(assert (=> d!123361 m!948995))

(assert (=> b!1029278 d!123361))

(declare-fun d!123363 () Bool)

(assert (=> d!123363 (= (apply!903 (+!3101 lt!453669 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))) lt!453672) (apply!903 lt!453669 lt!453672))))

(declare-fun lt!453934 () Unit!33605)

(assert (=> d!123363 (= lt!453934 (choose!1691 lt!453669 lt!453674 (minValue!5951 thiss!1427) lt!453672))))

(declare-fun e!581345 () Bool)

(assert (=> d!123363 e!581345))

(declare-fun res!688701 () Bool)

(assert (=> d!123363 (=> (not res!688701) (not e!581345))))

(assert (=> d!123363 (= res!688701 (contains!5972 lt!453669 lt!453672))))

(assert (=> d!123363 (= (addApplyDifferent!482 lt!453669 lt!453674 (minValue!5951 thiss!1427) lt!453672) lt!453934)))

(declare-fun b!1029662 () Bool)

(assert (=> b!1029662 (= e!581345 (not (= lt!453672 lt!453674)))))

(assert (= (and d!123363 res!688701) b!1029662))

(declare-fun m!948997 () Bool)

(assert (=> d!123363 m!948997))

(assert (=> d!123363 m!948417))

(assert (=> d!123363 m!948407))

(assert (=> d!123363 m!948417))

(assert (=> d!123363 m!948419))

(declare-fun m!948999 () Bool)

(assert (=> d!123363 m!948999))

(assert (=> b!1029278 d!123363))

(declare-fun d!123365 () Bool)

(assert (=> d!123365 (= (apply!903 (+!3101 lt!453673 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))) lt!453686) (get!16357 (getValueByKey!586 (toList!6857 (+!3101 lt!453673 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))) lt!453686)))))

(declare-fun bs!30076 () Bool)

(assert (= bs!30076 d!123365))

(declare-fun m!949001 () Bool)

(assert (=> bs!30076 m!949001))

(assert (=> bs!30076 m!949001))

(declare-fun m!949003 () Bool)

(assert (=> bs!30076 m!949003))

(assert (=> b!1029278 d!123365))

(declare-fun d!123367 () Bool)

(assert (=> d!123367 (= (apply!903 lt!453673 lt!453686) (get!16357 (getValueByKey!586 (toList!6857 lt!453673) lt!453686)))))

(declare-fun bs!30077 () Bool)

(assert (= bs!30077 d!123367))

(declare-fun m!949005 () Bool)

(assert (=> bs!30077 m!949005))

(assert (=> bs!30077 m!949005))

(declare-fun m!949007 () Bool)

(assert (=> bs!30077 m!949007))

(assert (=> b!1029278 d!123367))

(declare-fun d!123369 () Bool)

(declare-fun e!581346 () Bool)

(assert (=> d!123369 e!581346))

(declare-fun res!688702 () Bool)

(assert (=> d!123369 (=> (not res!688702) (not e!581346))))

(declare-fun lt!453937 () ListLongMap!13683)

(assert (=> d!123369 (= res!688702 (contains!5972 lt!453937 (_1!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))))))

(declare-fun lt!453938 () List!21823)

(assert (=> d!123369 (= lt!453937 (ListLongMap!13684 lt!453938))))

(declare-fun lt!453936 () Unit!33605)

(declare-fun lt!453935 () Unit!33605)

(assert (=> d!123369 (= lt!453936 lt!453935)))

(assert (=> d!123369 (= (getValueByKey!586 lt!453938 (_1!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123369 (= lt!453935 (lemmaContainsTupThenGetReturnValue!277 lt!453938 (_1!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123369 (= lt!453938 (insertStrictlySorted!370 (toList!6857 lt!453681) (_1!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))))))

(assert (=> d!123369 (= (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))) lt!453937)))

(declare-fun b!1029663 () Bool)

(declare-fun res!688703 () Bool)

(assert (=> b!1029663 (=> (not res!688703) (not e!581346))))

(assert (=> b!1029663 (= res!688703 (= (getValueByKey!586 (toList!6857 lt!453937) (_1!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))))))))

(declare-fun b!1029664 () Bool)

(assert (=> b!1029664 (= e!581346 (contains!5974 (toList!6857 lt!453937) (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))))))

(assert (= (and d!123369 res!688702) b!1029663))

(assert (= (and b!1029663 res!688703) b!1029664))

(declare-fun m!949009 () Bool)

(assert (=> d!123369 m!949009))

(declare-fun m!949011 () Bool)

(assert (=> d!123369 m!949011))

(declare-fun m!949013 () Bool)

(assert (=> d!123369 m!949013))

(declare-fun m!949015 () Bool)

(assert (=> d!123369 m!949015))

(declare-fun m!949017 () Bool)

(assert (=> b!1029663 m!949017))

(declare-fun m!949019 () Bool)

(assert (=> b!1029664 m!949019))

(assert (=> b!1029278 d!123369))

(declare-fun d!123371 () Bool)

(assert (=> d!123371 (= (apply!903 (+!3101 lt!453669 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))) lt!453672) (get!16357 (getValueByKey!586 (toList!6857 (+!3101 lt!453669 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))) lt!453672)))))

(declare-fun bs!30078 () Bool)

(assert (= bs!30078 d!123371))

(declare-fun m!949021 () Bool)

(assert (=> bs!30078 m!949021))

(assert (=> bs!30078 m!949021))

(declare-fun m!949023 () Bool)

(assert (=> bs!30078 m!949023))

(assert (=> b!1029278 d!123371))

(assert (=> b!1029278 d!123305))

(declare-fun d!123373 () Bool)

(declare-fun e!581347 () Bool)

(assert (=> d!123373 e!581347))

(declare-fun res!688704 () Bool)

(assert (=> d!123373 (=> res!688704 e!581347)))

(declare-fun lt!453941 () Bool)

(assert (=> d!123373 (= res!688704 (not lt!453941))))

(declare-fun lt!453942 () Bool)

(assert (=> d!123373 (= lt!453941 lt!453942)))

(declare-fun lt!453940 () Unit!33605)

(declare-fun e!581348 () Unit!33605)

(assert (=> d!123373 (= lt!453940 e!581348)))

(declare-fun c!104051 () Bool)

(assert (=> d!123373 (= c!104051 lt!453942)))

(assert (=> d!123373 (= lt!453942 (containsKey!561 (toList!6857 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))) lt!453668))))

(assert (=> d!123373 (= (contains!5972 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))) lt!453668) lt!453941)))

(declare-fun b!1029665 () Bool)

(declare-fun lt!453939 () Unit!33605)

(assert (=> b!1029665 (= e!581348 lt!453939)))

(assert (=> b!1029665 (= lt!453939 (lemmaContainsKeyImpliesGetValueByKeyDefined!394 (toList!6857 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))) lt!453668))))

(assert (=> b!1029665 (isDefined!433 (getValueByKey!586 (toList!6857 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))) lt!453668))))

(declare-fun b!1029666 () Bool)

(declare-fun Unit!33624 () Unit!33605)

(assert (=> b!1029666 (= e!581348 Unit!33624)))

(declare-fun b!1029667 () Bool)

(assert (=> b!1029667 (= e!581347 (isDefined!433 (getValueByKey!586 (toList!6857 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427)))) lt!453668)))))

(assert (= (and d!123373 c!104051) b!1029665))

(assert (= (and d!123373 (not c!104051)) b!1029666))

(assert (= (and d!123373 (not res!688704)) b!1029667))

(declare-fun m!949025 () Bool)

(assert (=> d!123373 m!949025))

(declare-fun m!949027 () Bool)

(assert (=> b!1029665 m!949027))

(declare-fun m!949029 () Bool)

(assert (=> b!1029665 m!949029))

(assert (=> b!1029665 m!949029))

(declare-fun m!949031 () Bool)

(assert (=> b!1029665 m!949031))

(assert (=> b!1029667 m!949029))

(assert (=> b!1029667 m!949029))

(assert (=> b!1029667 m!949031))

(assert (=> b!1029278 d!123373))

(declare-fun d!123375 () Bool)

(assert (=> d!123375 (= (apply!903 (+!3101 lt!453682 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427))) lt!453680) (get!16357 (getValueByKey!586 (toList!6857 (+!3101 lt!453682 (tuple2!15561 lt!453687 (zeroValue!5951 thiss!1427)))) lt!453680)))))

(declare-fun bs!30079 () Bool)

(assert (= bs!30079 d!123375))

(declare-fun m!949033 () Bool)

(assert (=> bs!30079 m!949033))

(assert (=> bs!30079 m!949033))

(declare-fun m!949035 () Bool)

(assert (=> bs!30079 m!949035))

(assert (=> b!1029278 d!123375))

(declare-fun d!123377 () Bool)

(assert (=> d!123377 (contains!5972 (+!3101 lt!453681 (tuple2!15561 lt!453688 (zeroValue!5951 thiss!1427))) lt!453668)))

(declare-fun lt!453943 () Unit!33605)

(assert (=> d!123377 (= lt!453943 (choose!1690 lt!453681 lt!453688 (zeroValue!5951 thiss!1427) lt!453668))))

(assert (=> d!123377 (contains!5972 lt!453681 lt!453668)))

(assert (=> d!123377 (= (addStillContains!622 lt!453681 lt!453688 (zeroValue!5951 thiss!1427) lt!453668) lt!453943)))

(declare-fun bs!30080 () Bool)

(assert (= bs!30080 d!123377))

(assert (=> bs!30080 m!948403))

(assert (=> bs!30080 m!948403))

(assert (=> bs!30080 m!948405))

(declare-fun m!949037 () Bool)

(assert (=> bs!30080 m!949037))

(declare-fun m!949039 () Bool)

(assert (=> bs!30080 m!949039))

(assert (=> b!1029278 d!123377))

(declare-fun d!123379 () Bool)

(assert (=> d!123379 (= (apply!903 lt!453682 lt!453680) (get!16357 (getValueByKey!586 (toList!6857 lt!453682) lt!453680)))))

(declare-fun bs!30081 () Bool)

(assert (= bs!30081 d!123379))

(declare-fun m!949041 () Bool)

(assert (=> bs!30081 m!949041))

(assert (=> bs!30081 m!949041))

(declare-fun m!949043 () Bool)

(assert (=> bs!30081 m!949043))

(assert (=> b!1029278 d!123379))

(declare-fun d!123381 () Bool)

(declare-fun e!581349 () Bool)

(assert (=> d!123381 e!581349))

(declare-fun res!688705 () Bool)

(assert (=> d!123381 (=> (not res!688705) (not e!581349))))

(declare-fun lt!453946 () ListLongMap!13683)

(assert (=> d!123381 (= res!688705 (contains!5972 lt!453946 (_1!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))))))

(declare-fun lt!453947 () List!21823)

(assert (=> d!123381 (= lt!453946 (ListLongMap!13684 lt!453947))))

(declare-fun lt!453945 () Unit!33605)

(declare-fun lt!453944 () Unit!33605)

(assert (=> d!123381 (= lt!453945 lt!453944)))

(assert (=> d!123381 (= (getValueByKey!586 lt!453947 (_1!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))))))

(assert (=> d!123381 (= lt!453944 (lemmaContainsTupThenGetReturnValue!277 lt!453947 (_1!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))))))

(assert (=> d!123381 (= lt!453947 (insertStrictlySorted!370 (toList!6857 lt!453669) (_1!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))))))

(assert (=> d!123381 (= (+!3101 lt!453669 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))) lt!453946)))

(declare-fun b!1029668 () Bool)

(declare-fun res!688706 () Bool)

(assert (=> b!1029668 (=> (not res!688706) (not e!581349))))

(assert (=> b!1029668 (= res!688706 (= (getValueByKey!586 (toList!6857 lt!453946) (_1!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))))))))

(declare-fun b!1029669 () Bool)

(assert (=> b!1029669 (= e!581349 (contains!5974 (toList!6857 lt!453946) (tuple2!15561 lt!453674 (minValue!5951 thiss!1427))))))

(assert (= (and d!123381 res!688705) b!1029668))

(assert (= (and b!1029668 res!688706) b!1029669))

(declare-fun m!949045 () Bool)

(assert (=> d!123381 m!949045))

(declare-fun m!949047 () Bool)

(assert (=> d!123381 m!949047))

(declare-fun m!949049 () Bool)

(assert (=> d!123381 m!949049))

(declare-fun m!949051 () Bool)

(assert (=> d!123381 m!949051))

(declare-fun m!949053 () Bool)

(assert (=> b!1029668 m!949053))

(declare-fun m!949055 () Bool)

(assert (=> b!1029669 m!949055))

(assert (=> b!1029278 d!123381))

(declare-fun d!123383 () Bool)

(declare-fun e!581350 () Bool)

(assert (=> d!123383 e!581350))

(declare-fun res!688707 () Bool)

(assert (=> d!123383 (=> (not res!688707) (not e!581350))))

(declare-fun lt!453950 () ListLongMap!13683)

(assert (=> d!123383 (= res!688707 (contains!5972 lt!453950 (_1!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))))))

(declare-fun lt!453951 () List!21823)

(assert (=> d!123383 (= lt!453950 (ListLongMap!13684 lt!453951))))

(declare-fun lt!453949 () Unit!33605)

(declare-fun lt!453948 () Unit!33605)

(assert (=> d!123383 (= lt!453949 lt!453948)))

(assert (=> d!123383 (= (getValueByKey!586 lt!453951 (_1!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))))))

(assert (=> d!123383 (= lt!453948 (lemmaContainsTupThenGetReturnValue!277 lt!453951 (_1!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))))))

(assert (=> d!123383 (= lt!453951 (insertStrictlySorted!370 (toList!6857 lt!453673) (_1!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))) (_2!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))))))

(assert (=> d!123383 (= (+!3101 lt!453673 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))) lt!453950)))

(declare-fun b!1029670 () Bool)

(declare-fun res!688708 () Bool)

(assert (=> b!1029670 (=> (not res!688708) (not e!581350))))

(assert (=> b!1029670 (= res!688708 (= (getValueByKey!586 (toList!6857 lt!453950) (_1!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427)))) (Some!636 (_2!7791 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))))))))

(declare-fun b!1029671 () Bool)

(assert (=> b!1029671 (= e!581350 (contains!5974 (toList!6857 lt!453950) (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))))))

(assert (= (and d!123383 res!688707) b!1029670))

(assert (= (and b!1029670 res!688708) b!1029671))

(declare-fun m!949057 () Bool)

(assert (=> d!123383 m!949057))

(declare-fun m!949059 () Bool)

(assert (=> d!123383 m!949059))

(declare-fun m!949061 () Bool)

(assert (=> d!123383 m!949061))

(declare-fun m!949063 () Bool)

(assert (=> d!123383 m!949063))

(declare-fun m!949065 () Bool)

(assert (=> b!1029670 m!949065))

(declare-fun m!949067 () Bool)

(assert (=> b!1029671 m!949067))

(assert (=> b!1029278 d!123383))

(declare-fun d!123385 () Bool)

(assert (=> d!123385 (= (apply!903 (+!3101 lt!453673 (tuple2!15561 lt!453671 (minValue!5951 thiss!1427))) lt!453686) (apply!903 lt!453673 lt!453686))))

(declare-fun lt!453952 () Unit!33605)

(assert (=> d!123385 (= lt!453952 (choose!1691 lt!453673 lt!453671 (minValue!5951 thiss!1427) lt!453686))))

(declare-fun e!581351 () Bool)

(assert (=> d!123385 e!581351))

(declare-fun res!688709 () Bool)

(assert (=> d!123385 (=> (not res!688709) (not e!581351))))

(assert (=> d!123385 (= res!688709 (contains!5972 lt!453673 lt!453686))))

(assert (=> d!123385 (= (addApplyDifferent!482 lt!453673 lt!453671 (minValue!5951 thiss!1427) lt!453686) lt!453952)))

(declare-fun b!1029672 () Bool)

(assert (=> b!1029672 (= e!581351 (not (= lt!453686 lt!453671)))))

(assert (= (and d!123385 res!688709) b!1029672))

(declare-fun m!949069 () Bool)

(assert (=> d!123385 m!949069))

(assert (=> d!123385 m!948411))

(assert (=> d!123385 m!948415))

(assert (=> d!123385 m!948411))

(assert (=> d!123385 m!948431))

(declare-fun m!949071 () Bool)

(assert (=> d!123385 m!949071))

(assert (=> b!1029278 d!123385))

(declare-fun mapIsEmpty!37922 () Bool)

(declare-fun mapRes!37922 () Bool)

(assert (=> mapIsEmpty!37922 mapRes!37922))

(declare-fun mapNonEmpty!37922 () Bool)

(declare-fun tp!72855 () Bool)

(declare-fun e!581352 () Bool)

(assert (=> mapNonEmpty!37922 (= mapRes!37922 (and tp!72855 e!581352))))

(declare-fun mapKey!37922 () (_ BitVec 32))

(declare-fun mapRest!37922 () (Array (_ BitVec 32) ValueCell!11454))

(declare-fun mapValue!37922 () ValueCell!11454)

(assert (=> mapNonEmpty!37922 (= mapRest!37921 (store mapRest!37922 mapKey!37922 mapValue!37922))))

(declare-fun condMapEmpty!37922 () Bool)

(declare-fun mapDefault!37922 () ValueCell!11454)

(assert (=> mapNonEmpty!37921 (= condMapEmpty!37922 (= mapRest!37921 ((as const (Array (_ BitVec 32) ValueCell!11454)) mapDefault!37922)))))

(declare-fun e!581353 () Bool)

(assert (=> mapNonEmpty!37921 (= tp!72854 (and e!581353 mapRes!37922))))

(declare-fun b!1029674 () Bool)

(assert (=> b!1029674 (= e!581353 tp_is_empty!24315)))

(declare-fun b!1029673 () Bool)

(assert (=> b!1029673 (= e!581352 tp_is_empty!24315)))

(assert (= (and mapNonEmpty!37921 condMapEmpty!37922) mapIsEmpty!37922))

(assert (= (and mapNonEmpty!37921 (not condMapEmpty!37922)) mapNonEmpty!37922))

(assert (= (and mapNonEmpty!37922 ((_ is ValueCellFull!11454) mapValue!37922)) b!1029673))

(assert (= (and mapNonEmpty!37921 ((_ is ValueCellFull!11454) mapDefault!37922)) b!1029674))

(declare-fun m!949073 () Bool)

(assert (=> mapNonEmpty!37922 m!949073))

(declare-fun b_lambda!15879 () Bool)

(assert (= b_lambda!15875 (or (and b!1029162 b_free!20595) b_lambda!15879)))

(declare-fun b_lambda!15881 () Bool)

(assert (= b_lambda!15877 (or (and b!1029162 b_free!20595) b_lambda!15881)))

(declare-fun b_lambda!15883 () Bool)

(assert (= b_lambda!15869 (or (and b!1029162 b_free!20595) b_lambda!15883)))

(declare-fun b_lambda!15885 () Bool)

(assert (= b_lambda!15867 (or (and b!1029162 b_free!20595) b_lambda!15885)))

(declare-fun b_lambda!15887 () Bool)

(assert (= b_lambda!15873 (or (and b!1029162 b_free!20595) b_lambda!15887)))

(declare-fun b_lambda!15889 () Bool)

(assert (= b_lambda!15871 (or (and b!1029162 b_free!20595) b_lambda!15889)))

(check-sat (not b!1029462) (not d!123353) (not d!123367) (not d!123323) (not d!123329) (not d!123261) (not d!123303) (not b_lambda!15885) (not b!1029560) (not b!1029602) (not bm!43483) (not b!1029665) (not b!1029619) (not d!123289) (not b!1029525) (not b!1029601) (not d!123373) (not d!123311) (not b!1029524) (not b!1029671) (not d!123271) (not bm!43474) (not b!1029629) (not d!123361) (not b!1029530) (not b!1029473) (not b!1029625) (not d!123315) (not b!1029493) (not b!1029470) (not b!1029393) (not d!123251) (not b!1029654) (not bm!43489) (not b!1029663) (not b!1029526) (not b!1029598) (not d!123355) (not b!1029434) (not b!1029571) (not b!1029557) (not bm!43484) (not d!123385) (not b!1029600) (not d!123295) (not b_lambda!15887) (not b!1029540) (not b!1029595) (not b!1029481) (not b!1029534) (not b!1029626) (not b_lambda!15865) (not b!1029669) (not b!1029492) (not d!123365) (not d!123281) (not d!123231) (not b!1029621) (not d!123337) tp_is_empty!24315 (not b!1029596) (not d!123291) (not b!1029638) (not b!1029485) (not d!123357) (not b!1029608) (not bm!43488) (not b!1029668) (not bm!43471) (not bm!43480) (not bm!43478) (not b!1029541) (not b!1029633) (not b!1029527) (not d!123379) (not d!123257) (not b!1029623) (not d!123273) (not bm!43486) (not d!123331) (not d!123249) (not b!1029486) (not d!123253) (not b!1029627) (not b!1029634) (not b!1029551) (not b!1029463) (not b_lambda!15881) (not b!1029523) (not d!123269) (not b!1029574) (not b!1029421) (not b!1029664) (not b!1029603) (not b!1029550) (not d!123371) (not b!1029484) (not b_lambda!15853) (not d!123321) (not b!1029384) (not b_lambda!15883) (not b!1029659) (not d!123305) (not b!1029532) (not b!1029555) (not b!1029423) (not d!123309) (not d!123301) (not b!1029594) (not b!1029549) (not b!1029660) (not b!1029455) (not d!123285) (not b!1029572) (not b!1029419) (not b!1029480) (not b!1029670) (not mapNonEmpty!37922) (not b_lambda!15889) (not bm!43485) (not b!1029431) (not b_lambda!15861) (not b!1029522) (not d!123359) (not b!1029433) (not d!123317) (not d!123327) (not b!1029610) (not b!1029491) (not bm!43470) (not d!123369) (not d!123333) (not b!1029637) (not b!1029478) (not d!123347) (not b!1029479) (not b!1029553) (not d!123341) (not b!1029392) (not b!1029545) (not bm!43487) (not b_next!20595) (not d!123243) (not d!123239) (not b!1029622) (not b!1029575) (not b!1029631) (not b!1029640) (not d!123325) (not b!1029639) (not d!123345) (not b!1029520) (not b!1029611) (not d!123377) (not b!1029580) (not b!1029599) (not b!1029546) (not b_lambda!15879) (not d!123255) (not bm!43476) (not d!123381) (not d!123383) (not b!1029628) (not bm!43475) (not d!123275) (not d!123293) (not b!1029667) (not b!1029606) (not b!1029578) (not b!1029612) (not b_lambda!15863) (not b!1029495) (not d!123335) (not d!123313) (not b!1029487) (not d!123227) (not d!123339) (not b!1029577) (not b!1029439) b_and!32939 (not d!123319) (not d!123363) (not d!123307) (not d!123267) (not d!123375) (not b!1029468) (not d!123247) (not b!1029558) (not bm!43472) (not b!1029544))
(check-sat b_and!32939 (not b_next!20595))
