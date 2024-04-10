; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76878 () Bool)

(assert start!76878)

(declare-fun b!898867 () Bool)

(declare-fun b_free!16023 () Bool)

(declare-fun b_next!16023 () Bool)

(assert (=> b!898867 (= b_free!16023 (not b_next!16023))))

(declare-fun tp!56142 () Bool)

(declare-fun b_and!26323 () Bool)

(assert (=> b!898867 (= tp!56142 b_and!26323)))

(declare-fun b!898862 () Bool)

(declare-fun e!502875 () Bool)

(declare-fun e!502876 () Bool)

(declare-fun mapRes!29185 () Bool)

(assert (=> b!898862 (= e!502875 (and e!502876 mapRes!29185))))

(declare-fun condMapEmpty!29185 () Bool)

(declare-datatypes ((array!52742 0))(
  ( (array!52743 (arr!25347 (Array (_ BitVec 32) (_ BitVec 64))) (size!25803 (_ BitVec 32))) )
))
(declare-datatypes ((V!29433 0))(
  ( (V!29434 (val!9226 Int)) )
))
(declare-datatypes ((ValueCell!8694 0))(
  ( (ValueCellFull!8694 (v!11718 V!29433)) (EmptyCell!8694) )
))
(declare-datatypes ((array!52744 0))(
  ( (array!52745 (arr!25348 (Array (_ BitVec 32) ValueCell!8694)) (size!25804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4404 0))(
  ( (LongMapFixedSize!4405 (defaultEntry!5420 Int) (mask!26161 (_ BitVec 32)) (extraKeys!5138 (_ BitVec 32)) (zeroValue!5242 V!29433) (minValue!5242 V!29433) (_size!2257 (_ BitVec 32)) (_keys!10201 array!52742) (_values!5429 array!52744) (_vacant!2257 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4404)

(declare-fun mapDefault!29185 () ValueCell!8694)

(assert (=> b!898862 (= condMapEmpty!29185 (= (arr!25348 (_values!5429 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8694)) mapDefault!29185)))))

(declare-fun b!898863 () Bool)

(declare-fun e!502877 () Bool)

(declare-fun tp_is_empty!18351 () Bool)

(assert (=> b!898863 (= e!502877 tp_is_empty!18351)))

(declare-fun b!898864 () Bool)

(assert (=> b!898864 (= e!502876 tp_is_empty!18351)))

(declare-fun b!898865 () Bool)

(declare-fun e!502871 () Bool)

(assert (=> b!898865 (= e!502871 (or (not (= (size!25804 (_values!5429 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26161 thiss!1181)))) (= (size!25803 (_keys!10201 thiss!1181)) (size!25804 (_values!5429 thiss!1181)))))))

(declare-fun b!898866 () Bool)

(declare-fun e!502878 () Bool)

(declare-datatypes ((SeekEntryResult!8928 0))(
  ( (MissingZero!8928 (index!38083 (_ BitVec 32))) (Found!8928 (index!38084 (_ BitVec 32))) (Intermediate!8928 (undefined!9740 Bool) (index!38085 (_ BitVec 32)) (x!76601 (_ BitVec 32))) (Undefined!8928) (MissingVacant!8928 (index!38086 (_ BitVec 32))) )
))
(declare-fun lt!405855 () SeekEntryResult!8928)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898866 (= e!502878 (inRange!0 (index!38084 lt!405855) (mask!26161 thiss!1181)))))

(declare-fun e!502873 () Bool)

(declare-fun array_inv!19892 (array!52742) Bool)

(declare-fun array_inv!19893 (array!52744) Bool)

(assert (=> b!898867 (= e!502873 (and tp!56142 tp_is_empty!18351 (array_inv!19892 (_keys!10201 thiss!1181)) (array_inv!19893 (_values!5429 thiss!1181)) e!502875))))

(declare-fun mapNonEmpty!29185 () Bool)

(declare-fun tp!56141 () Bool)

(assert (=> mapNonEmpty!29185 (= mapRes!29185 (and tp!56141 e!502877))))

(declare-fun mapKey!29185 () (_ BitVec 32))

(declare-fun mapValue!29185 () ValueCell!8694)

(declare-fun mapRest!29185 () (Array (_ BitVec 32) ValueCell!8694))

(assert (=> mapNonEmpty!29185 (= (arr!25348 (_values!5429 thiss!1181)) (store mapRest!29185 mapKey!29185 mapValue!29185))))

(declare-fun b!898868 () Bool)

(declare-fun res!607347 () Bool)

(declare-fun e!502872 () Bool)

(assert (=> b!898868 (=> (not res!607347) (not e!502872))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898868 (= res!607347 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898869 () Bool)

(declare-fun e!502874 () Bool)

(assert (=> b!898869 (= e!502872 (not e!502874))))

(declare-fun res!607349 () Bool)

(assert (=> b!898869 (=> res!607349 e!502874)))

(get-info :version)

(assert (=> b!898869 (= res!607349 (not ((_ is Found!8928) lt!405855)))))

(assert (=> b!898869 e!502878))

(declare-fun res!607348 () Bool)

(assert (=> b!898869 (=> res!607348 e!502878)))

(assert (=> b!898869 (= res!607348 (not ((_ is Found!8928) lt!405855)))))

(declare-datatypes ((Unit!30548 0))(
  ( (Unit!30549) )
))
(declare-fun lt!405857 () Unit!30548)

(declare-fun lemmaSeekEntryGivesInRangeIndex!93 (array!52742 array!52744 (_ BitVec 32) (_ BitVec 32) V!29433 V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> b!898869 (= lt!405857 (lemmaSeekEntryGivesInRangeIndex!93 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52742 (_ BitVec 32)) SeekEntryResult!8928)

(assert (=> b!898869 (= lt!405855 (seekEntry!0 key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun b!898870 () Bool)

(assert (=> b!898870 (= e!502874 e!502871)))

(declare-fun res!607350 () Bool)

(assert (=> b!898870 (=> res!607350 e!502871)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898870 (= res!607350 (not (validMask!0 (mask!26161 thiss!1181))))))

(declare-datatypes ((tuple2!12038 0))(
  ( (tuple2!12039 (_1!6030 (_ BitVec 64)) (_2!6030 V!29433)) )
))
(declare-datatypes ((List!17843 0))(
  ( (Nil!17840) (Cons!17839 (h!18982 tuple2!12038) (t!25186 List!17843)) )
))
(declare-datatypes ((ListLongMap!10735 0))(
  ( (ListLongMap!10736 (toList!5383 List!17843)) )
))
(declare-fun contains!4414 (ListLongMap!10735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2657 (array!52742 array!52744 (_ BitVec 32) (_ BitVec 32) V!29433 V!29433 (_ BitVec 32) Int) ListLongMap!10735)

(assert (=> b!898870 (contains!4414 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))))

(declare-fun lt!405858 () Unit!30548)

(declare-fun lemmaValidKeyInArrayIsInListMap!246 (array!52742 array!52744 (_ BitVec 32) (_ BitVec 32) V!29433 V!29433 (_ BitVec 32) Int) Unit!30548)

(assert (=> b!898870 (= lt!405858 (lemmaValidKeyInArrayIsInListMap!246 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) (index!38084 lt!405855) (defaultEntry!5420 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898870 (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405856 () Unit!30548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52742 (_ BitVec 64) (_ BitVec 32)) Unit!30548)

(assert (=> b!898870 (= lt!405856 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10201 thiss!1181) key!785 (index!38084 lt!405855)))))

(declare-fun mapIsEmpty!29185 () Bool)

(assert (=> mapIsEmpty!29185 mapRes!29185))

(declare-fun res!607351 () Bool)

(assert (=> start!76878 (=> (not res!607351) (not e!502872))))

(declare-fun valid!1693 (LongMapFixedSize!4404) Bool)

(assert (=> start!76878 (= res!607351 (valid!1693 thiss!1181))))

(assert (=> start!76878 e!502872))

(assert (=> start!76878 e!502873))

(assert (=> start!76878 true))

(assert (= (and start!76878 res!607351) b!898868))

(assert (= (and b!898868 res!607347) b!898869))

(assert (= (and b!898869 (not res!607348)) b!898866))

(assert (= (and b!898869 (not res!607349)) b!898870))

(assert (= (and b!898870 (not res!607350)) b!898865))

(assert (= (and b!898862 condMapEmpty!29185) mapIsEmpty!29185))

(assert (= (and b!898862 (not condMapEmpty!29185)) mapNonEmpty!29185))

(assert (= (and mapNonEmpty!29185 ((_ is ValueCellFull!8694) mapValue!29185)) b!898863))

(assert (= (and b!898862 ((_ is ValueCellFull!8694) mapDefault!29185)) b!898864))

(assert (= b!898867 b!898862))

(assert (= start!76878 b!898867))

(declare-fun m!835361 () Bool)

(assert (=> b!898866 m!835361))

(declare-fun m!835363 () Bool)

(assert (=> b!898870 m!835363))

(declare-fun m!835365 () Bool)

(assert (=> b!898870 m!835365))

(declare-fun m!835367 () Bool)

(assert (=> b!898870 m!835367))

(declare-fun m!835369 () Bool)

(assert (=> b!898870 m!835369))

(assert (=> b!898870 m!835367))

(declare-fun m!835371 () Bool)

(assert (=> b!898870 m!835371))

(declare-fun m!835373 () Bool)

(assert (=> b!898870 m!835373))

(declare-fun m!835375 () Bool)

(assert (=> b!898870 m!835375))

(assert (=> b!898870 m!835365))

(declare-fun m!835377 () Bool)

(assert (=> b!898867 m!835377))

(declare-fun m!835379 () Bool)

(assert (=> b!898867 m!835379))

(declare-fun m!835381 () Bool)

(assert (=> start!76878 m!835381))

(declare-fun m!835383 () Bool)

(assert (=> b!898869 m!835383))

(declare-fun m!835385 () Bool)

(assert (=> b!898869 m!835385))

(declare-fun m!835387 () Bool)

(assert (=> mapNonEmpty!29185 m!835387))

(check-sat b_and!26323 (not start!76878) tp_is_empty!18351 (not b!898867) (not b!898869) (not b!898866) (not b_next!16023) (not b!898870) (not mapNonEmpty!29185))
(check-sat b_and!26323 (not b_next!16023))
(get-model)

(declare-fun d!111349 () Bool)

(assert (=> d!111349 (= (array_inv!19892 (_keys!10201 thiss!1181)) (bvsge (size!25803 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898867 d!111349))

(declare-fun d!111351 () Bool)

(assert (=> d!111351 (= (array_inv!19893 (_values!5429 thiss!1181)) (bvsge (size!25804 (_values!5429 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898867 d!111351))

(declare-fun d!111353 () Bool)

(assert (=> d!111353 (= (validMask!0 (mask!26161 thiss!1181)) (and (or (= (mask!26161 thiss!1181) #b00000000000000000000000000000111) (= (mask!26161 thiss!1181) #b00000000000000000000000000001111) (= (mask!26161 thiss!1181) #b00000000000000000000000000011111) (= (mask!26161 thiss!1181) #b00000000000000000000000000111111) (= (mask!26161 thiss!1181) #b00000000000000000000000001111111) (= (mask!26161 thiss!1181) #b00000000000000000000000011111111) (= (mask!26161 thiss!1181) #b00000000000000000000000111111111) (= (mask!26161 thiss!1181) #b00000000000000000000001111111111) (= (mask!26161 thiss!1181) #b00000000000000000000011111111111) (= (mask!26161 thiss!1181) #b00000000000000000000111111111111) (= (mask!26161 thiss!1181) #b00000000000000000001111111111111) (= (mask!26161 thiss!1181) #b00000000000000000011111111111111) (= (mask!26161 thiss!1181) #b00000000000000000111111111111111) (= (mask!26161 thiss!1181) #b00000000000000001111111111111111) (= (mask!26161 thiss!1181) #b00000000000000011111111111111111) (= (mask!26161 thiss!1181) #b00000000000000111111111111111111) (= (mask!26161 thiss!1181) #b00000000000001111111111111111111) (= (mask!26161 thiss!1181) #b00000000000011111111111111111111) (= (mask!26161 thiss!1181) #b00000000000111111111111111111111) (= (mask!26161 thiss!1181) #b00000000001111111111111111111111) (= (mask!26161 thiss!1181) #b00000000011111111111111111111111) (= (mask!26161 thiss!1181) #b00000000111111111111111111111111) (= (mask!26161 thiss!1181) #b00000001111111111111111111111111) (= (mask!26161 thiss!1181) #b00000011111111111111111111111111) (= (mask!26161 thiss!1181) #b00000111111111111111111111111111) (= (mask!26161 thiss!1181) #b00001111111111111111111111111111) (= (mask!26161 thiss!1181) #b00011111111111111111111111111111) (= (mask!26161 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26161 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898870 d!111353))

(declare-fun d!111355 () Bool)

(declare-fun e!502910 () Bool)

(assert (=> d!111355 e!502910))

(declare-fun res!607369 () Bool)

(assert (=> d!111355 (=> res!607369 e!502910)))

(declare-fun lt!405882 () Bool)

(assert (=> d!111355 (= res!607369 (not lt!405882))))

(declare-fun lt!405879 () Bool)

(assert (=> d!111355 (= lt!405882 lt!405879)))

(declare-fun lt!405881 () Unit!30548)

(declare-fun e!502911 () Unit!30548)

(assert (=> d!111355 (= lt!405881 e!502911)))

(declare-fun c!95031 () Bool)

(assert (=> d!111355 (= c!95031 lt!405879)))

(declare-fun containsKey!426 (List!17843 (_ BitVec 64)) Bool)

(assert (=> d!111355 (= lt!405879 (containsKey!426 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(assert (=> d!111355 (= (contains!4414 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))) lt!405882)))

(declare-fun b!898904 () Bool)

(declare-fun lt!405880 () Unit!30548)

(assert (=> b!898904 (= e!502911 lt!405880)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!322 (List!17843 (_ BitVec 64)) Unit!30548)

(assert (=> b!898904 (= lt!405880 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(declare-datatypes ((Option!463 0))(
  ( (Some!462 (v!11720 V!29433)) (None!461) )
))
(declare-fun isDefined!331 (Option!463) Bool)

(declare-fun getValueByKey!457 (List!17843 (_ BitVec 64)) Option!463)

(assert (=> b!898904 (isDefined!331 (getValueByKey!457 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(declare-fun b!898905 () Bool)

(declare-fun Unit!30552 () Unit!30548)

(assert (=> b!898905 (= e!502911 Unit!30552)))

(declare-fun b!898906 () Bool)

(assert (=> b!898906 (= e!502910 (isDefined!331 (getValueByKey!457 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))))))

(assert (= (and d!111355 c!95031) b!898904))

(assert (= (and d!111355 (not c!95031)) b!898905))

(assert (= (and d!111355 (not res!607369)) b!898906))

(assert (=> d!111355 m!835367))

(declare-fun m!835417 () Bool)

(assert (=> d!111355 m!835417))

(assert (=> b!898904 m!835367))

(declare-fun m!835419 () Bool)

(assert (=> b!898904 m!835419))

(assert (=> b!898904 m!835367))

(declare-fun m!835421 () Bool)

(assert (=> b!898904 m!835421))

(assert (=> b!898904 m!835421))

(declare-fun m!835423 () Bool)

(assert (=> b!898904 m!835423))

(assert (=> b!898906 m!835367))

(assert (=> b!898906 m!835421))

(assert (=> b!898906 m!835421))

(assert (=> b!898906 m!835423))

(assert (=> b!898870 d!111355))

(declare-fun d!111357 () Bool)

(declare-fun res!607374 () Bool)

(declare-fun e!502916 () Bool)

(assert (=> d!111357 (=> res!607374 e!502916)))

(assert (=> d!111357 (= res!607374 (= (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111357 (= (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 #b00000000000000000000000000000000) e!502916)))

(declare-fun b!898911 () Bool)

(declare-fun e!502917 () Bool)

(assert (=> b!898911 (= e!502916 e!502917)))

(declare-fun res!607375 () Bool)

(assert (=> b!898911 (=> (not res!607375) (not e!502917))))

(assert (=> b!898911 (= res!607375 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun b!898912 () Bool)

(assert (=> b!898912 (= e!502917 (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111357 (not res!607374)) b!898911))

(assert (= (and b!898911 res!607375) b!898912))

(declare-fun m!835425 () Bool)

(assert (=> d!111357 m!835425))

(declare-fun m!835427 () Bool)

(assert (=> b!898912 m!835427))

(assert (=> b!898870 d!111357))

(declare-fun b!898955 () Bool)

(declare-fun e!502944 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898955 (= e!502944 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun c!95049 () Bool)

(declare-fun call!39908 () ListLongMap!10735)

(declare-fun bm!39901 () Bool)

(declare-fun call!39906 () ListLongMap!10735)

(declare-fun call!39905 () ListLongMap!10735)

(declare-fun call!39909 () ListLongMap!10735)

(declare-fun c!95046 () Bool)

(declare-fun +!2592 (ListLongMap!10735 tuple2!12038) ListLongMap!10735)

(assert (=> bm!39901 (= call!39905 (+!2592 (ite c!95046 call!39906 (ite c!95049 call!39909 call!39908)) (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))

(declare-fun b!898956 () Bool)

(declare-fun e!502952 () Bool)

(declare-fun lt!405947 () ListLongMap!10735)

(declare-fun apply!411 (ListLongMap!10735 (_ BitVec 64)) V!29433)

(assert (=> b!898956 (= e!502952 (= (apply!411 lt!405947 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5242 thiss!1181)))))

(declare-fun b!898957 () Bool)

(declare-fun e!502948 () Bool)

(declare-fun call!39907 () Bool)

(assert (=> b!898957 (= e!502948 (not call!39907))))

(declare-fun b!898958 () Bool)

(declare-fun e!502949 () Bool)

(assert (=> b!898958 (= e!502948 e!502949)))

(declare-fun res!607399 () Bool)

(assert (=> b!898958 (= res!607399 call!39907)))

(assert (=> b!898958 (=> (not res!607399) (not e!502949))))

(declare-fun b!898959 () Bool)

(declare-fun res!607398 () Bool)

(declare-fun e!502946 () Bool)

(assert (=> b!898959 (=> (not res!607398) (not e!502946))))

(declare-fun e!502947 () Bool)

(assert (=> b!898959 (= res!607398 e!502947)))

(declare-fun res!607394 () Bool)

(assert (=> b!898959 (=> res!607394 e!502947)))

(declare-fun e!502953 () Bool)

(assert (=> b!898959 (= res!607394 (not e!502953))))

(declare-fun res!607400 () Bool)

(assert (=> b!898959 (=> (not res!607400) (not e!502953))))

(assert (=> b!898959 (= res!607400 (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun bm!39902 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3279 (array!52742 array!52744 (_ BitVec 32) (_ BitVec 32) V!29433 V!29433 (_ BitVec 32) Int) ListLongMap!10735)

(assert (=> bm!39902 (= call!39906 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))

(declare-fun d!111359 () Bool)

(assert (=> d!111359 e!502946))

(declare-fun res!607401 () Bool)

(assert (=> d!111359 (=> (not res!607401) (not e!502946))))

(assert (=> d!111359 (= res!607401 (or (bvsge #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))))

(declare-fun lt!405934 () ListLongMap!10735)

(assert (=> d!111359 (= lt!405947 lt!405934)))

(declare-fun lt!405928 () Unit!30548)

(declare-fun e!502956 () Unit!30548)

(assert (=> d!111359 (= lt!405928 e!502956)))

(declare-fun c!95048 () Bool)

(assert (=> d!111359 (= c!95048 e!502944)))

(declare-fun res!607396 () Bool)

(assert (=> d!111359 (=> (not res!607396) (not e!502944))))

(assert (=> d!111359 (= res!607396 (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun e!502945 () ListLongMap!10735)

(assert (=> d!111359 (= lt!405934 e!502945)))

(assert (=> d!111359 (= c!95046 (and (not (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111359 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111359 (= (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)) lt!405947)))

(declare-fun b!898960 () Bool)

(declare-fun e!502955 () Bool)

(assert (=> b!898960 (= e!502955 e!502952)))

(declare-fun res!607402 () Bool)

(declare-fun call!39904 () Bool)

(assert (=> b!898960 (= res!607402 call!39904)))

(assert (=> b!898960 (=> (not res!607402) (not e!502952))))

(declare-fun b!898961 () Bool)

(assert (=> b!898961 (= e!502955 (not call!39904))))

(declare-fun b!898962 () Bool)

(assert (=> b!898962 (= e!502946 e!502955)))

(declare-fun c!95047 () Bool)

(assert (=> b!898962 (= c!95047 (not (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898963 () Bool)

(declare-fun e!502954 () Bool)

(declare-fun get!13328 (ValueCell!8694 V!29433) V!29433)

(declare-fun dynLambda!1305 (Int (_ BitVec 64)) V!29433)

(assert (=> b!898963 (= e!502954 (= (apply!411 lt!405947 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)) (get!13328 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25804 (_values!5429 thiss!1181))))))

(assert (=> b!898963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun b!898964 () Bool)

(assert (=> b!898964 (= e!502953 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898965 () Bool)

(declare-fun e!502950 () ListLongMap!10735)

(declare-fun call!39910 () ListLongMap!10735)

(assert (=> b!898965 (= e!502950 call!39910)))

(declare-fun bm!39903 () Bool)

(assert (=> bm!39903 (= call!39909 call!39906)))

(declare-fun b!898966 () Bool)

(assert (=> b!898966 (= e!502945 e!502950)))

(assert (=> b!898966 (= c!95049 (and (not (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898967 () Bool)

(declare-fun e!502951 () ListLongMap!10735)

(assert (=> b!898967 (= e!502951 call!39908)))

(declare-fun b!898968 () Bool)

(declare-fun Unit!30553 () Unit!30548)

(assert (=> b!898968 (= e!502956 Unit!30553)))

(declare-fun b!898969 () Bool)

(declare-fun c!95044 () Bool)

(assert (=> b!898969 (= c!95044 (and (not (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!898969 (= e!502950 e!502951)))

(declare-fun bm!39904 () Bool)

(assert (=> bm!39904 (= call!39910 call!39905)))

(declare-fun bm!39905 () Bool)

(assert (=> bm!39905 (= call!39907 (contains!4414 lt!405947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898970 () Bool)

(assert (=> b!898970 (= e!502949 (= (apply!411 lt!405947 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5242 thiss!1181)))))

(declare-fun b!898971 () Bool)

(assert (=> b!898971 (= e!502945 (+!2592 call!39905 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))

(declare-fun bm!39906 () Bool)

(assert (=> bm!39906 (= call!39908 call!39909)))

(declare-fun bm!39907 () Bool)

(assert (=> bm!39907 (= call!39904 (contains!4414 lt!405947 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898972 () Bool)

(declare-fun res!607395 () Bool)

(assert (=> b!898972 (=> (not res!607395) (not e!502946))))

(assert (=> b!898972 (= res!607395 e!502948)))

(declare-fun c!95045 () Bool)

(assert (=> b!898972 (= c!95045 (not (= (bvand (extraKeys!5138 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!898973 () Bool)

(assert (=> b!898973 (= e!502951 call!39910)))

(declare-fun b!898974 () Bool)

(assert (=> b!898974 (= e!502947 e!502954)))

(declare-fun res!607397 () Bool)

(assert (=> b!898974 (=> (not res!607397) (not e!502954))))

(assert (=> b!898974 (= res!607397 (contains!4414 lt!405947 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun b!898975 () Bool)

(declare-fun lt!405938 () Unit!30548)

(assert (=> b!898975 (= e!502956 lt!405938)))

(declare-fun lt!405932 () ListLongMap!10735)

(assert (=> b!898975 (= lt!405932 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))

(declare-fun lt!405935 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405944 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405944 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405940 () Unit!30548)

(declare-fun addStillContains!333 (ListLongMap!10735 (_ BitVec 64) V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> b!898975 (= lt!405940 (addStillContains!333 lt!405932 lt!405935 (zeroValue!5242 thiss!1181) lt!405944))))

(assert (=> b!898975 (contains!4414 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))) lt!405944)))

(declare-fun lt!405937 () Unit!30548)

(assert (=> b!898975 (= lt!405937 lt!405940)))

(declare-fun lt!405942 () ListLongMap!10735)

(assert (=> b!898975 (= lt!405942 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))

(declare-fun lt!405927 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405927 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405931 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405931 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405929 () Unit!30548)

(declare-fun addApplyDifferent!333 (ListLongMap!10735 (_ BitVec 64) V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> b!898975 (= lt!405929 (addApplyDifferent!333 lt!405942 lt!405927 (minValue!5242 thiss!1181) lt!405931))))

(assert (=> b!898975 (= (apply!411 (+!2592 lt!405942 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))) lt!405931) (apply!411 lt!405942 lt!405931))))

(declare-fun lt!405936 () Unit!30548)

(assert (=> b!898975 (= lt!405936 lt!405929)))

(declare-fun lt!405941 () ListLongMap!10735)

(assert (=> b!898975 (= lt!405941 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))

(declare-fun lt!405930 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405939 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405939 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405948 () Unit!30548)

(assert (=> b!898975 (= lt!405948 (addApplyDifferent!333 lt!405941 lt!405930 (zeroValue!5242 thiss!1181) lt!405939))))

(assert (=> b!898975 (= (apply!411 (+!2592 lt!405941 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))) lt!405939) (apply!411 lt!405941 lt!405939))))

(declare-fun lt!405945 () Unit!30548)

(assert (=> b!898975 (= lt!405945 lt!405948)))

(declare-fun lt!405933 () ListLongMap!10735)

(assert (=> b!898975 (= lt!405933 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))

(declare-fun lt!405943 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405943 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405946 () (_ BitVec 64))

(assert (=> b!898975 (= lt!405946 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898975 (= lt!405938 (addApplyDifferent!333 lt!405933 lt!405943 (minValue!5242 thiss!1181) lt!405946))))

(assert (=> b!898975 (= (apply!411 (+!2592 lt!405933 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))) lt!405946) (apply!411 lt!405933 lt!405946))))

(assert (= (and d!111359 c!95046) b!898971))

(assert (= (and d!111359 (not c!95046)) b!898966))

(assert (= (and b!898966 c!95049) b!898965))

(assert (= (and b!898966 (not c!95049)) b!898969))

(assert (= (and b!898969 c!95044) b!898973))

(assert (= (and b!898969 (not c!95044)) b!898967))

(assert (= (or b!898973 b!898967) bm!39906))

(assert (= (or b!898965 bm!39906) bm!39903))

(assert (= (or b!898965 b!898973) bm!39904))

(assert (= (or b!898971 bm!39903) bm!39902))

(assert (= (or b!898971 bm!39904) bm!39901))

(assert (= (and d!111359 res!607396) b!898955))

(assert (= (and d!111359 c!95048) b!898975))

(assert (= (and d!111359 (not c!95048)) b!898968))

(assert (= (and d!111359 res!607401) b!898959))

(assert (= (and b!898959 res!607400) b!898964))

(assert (= (and b!898959 (not res!607394)) b!898974))

(assert (= (and b!898974 res!607397) b!898963))

(assert (= (and b!898959 res!607398) b!898972))

(assert (= (and b!898972 c!95045) b!898958))

(assert (= (and b!898972 (not c!95045)) b!898957))

(assert (= (and b!898958 res!607399) b!898970))

(assert (= (or b!898958 b!898957) bm!39905))

(assert (= (and b!898972 res!607395) b!898962))

(assert (= (and b!898962 c!95047) b!898960))

(assert (= (and b!898962 (not c!95047)) b!898961))

(assert (= (and b!898960 res!607402) b!898956))

(assert (= (or b!898960 b!898961) bm!39907))

(declare-fun b_lambda!12975 () Bool)

(assert (=> (not b_lambda!12975) (not b!898963)))

(declare-fun t!25189 () Bool)

(declare-fun tb!5195 () Bool)

(assert (=> (and b!898867 (= (defaultEntry!5420 thiss!1181) (defaultEntry!5420 thiss!1181)) t!25189) tb!5195))

(declare-fun result!10157 () Bool)

(assert (=> tb!5195 (= result!10157 tp_is_empty!18351)))

(assert (=> b!898963 t!25189))

(declare-fun b_and!26327 () Bool)

(assert (= b_and!26323 (and (=> t!25189 result!10157) b_and!26327)))

(declare-fun m!835429 () Bool)

(assert (=> bm!39902 m!835429))

(assert (=> b!898964 m!835425))

(assert (=> b!898964 m!835425))

(declare-fun m!835431 () Bool)

(assert (=> b!898964 m!835431))

(assert (=> d!111359 m!835373))

(declare-fun m!835433 () Bool)

(assert (=> bm!39905 m!835433))

(declare-fun m!835435 () Bool)

(assert (=> b!898975 m!835435))

(declare-fun m!835437 () Bool)

(assert (=> b!898975 m!835437))

(declare-fun m!835439 () Bool)

(assert (=> b!898975 m!835439))

(declare-fun m!835441 () Bool)

(assert (=> b!898975 m!835441))

(declare-fun m!835443 () Bool)

(assert (=> b!898975 m!835443))

(declare-fun m!835445 () Bool)

(assert (=> b!898975 m!835445))

(declare-fun m!835447 () Bool)

(assert (=> b!898975 m!835447))

(assert (=> b!898975 m!835429))

(declare-fun m!835449 () Bool)

(assert (=> b!898975 m!835449))

(declare-fun m!835451 () Bool)

(assert (=> b!898975 m!835451))

(assert (=> b!898975 m!835425))

(declare-fun m!835453 () Bool)

(assert (=> b!898975 m!835453))

(declare-fun m!835455 () Bool)

(assert (=> b!898975 m!835455))

(assert (=> b!898975 m!835453))

(declare-fun m!835457 () Bool)

(assert (=> b!898975 m!835457))

(assert (=> b!898975 m!835435))

(declare-fun m!835459 () Bool)

(assert (=> b!898975 m!835459))

(declare-fun m!835461 () Bool)

(assert (=> b!898975 m!835461))

(assert (=> b!898975 m!835451))

(declare-fun m!835463 () Bool)

(assert (=> b!898975 m!835463))

(assert (=> b!898975 m!835443))

(assert (=> b!898974 m!835425))

(assert (=> b!898974 m!835425))

(declare-fun m!835465 () Bool)

(assert (=> b!898974 m!835465))

(declare-fun m!835467 () Bool)

(assert (=> bm!39907 m!835467))

(declare-fun m!835469 () Bool)

(assert (=> b!898971 m!835469))

(declare-fun m!835471 () Bool)

(assert (=> b!898956 m!835471))

(declare-fun m!835473 () Bool)

(assert (=> b!898963 m!835473))

(declare-fun m!835475 () Bool)

(assert (=> b!898963 m!835475))

(assert (=> b!898963 m!835425))

(declare-fun m!835477 () Bool)

(assert (=> b!898963 m!835477))

(assert (=> b!898963 m!835473))

(assert (=> b!898963 m!835475))

(declare-fun m!835479 () Bool)

(assert (=> b!898963 m!835479))

(assert (=> b!898963 m!835425))

(declare-fun m!835481 () Bool)

(assert (=> b!898970 m!835481))

(assert (=> b!898955 m!835425))

(assert (=> b!898955 m!835425))

(assert (=> b!898955 m!835431))

(declare-fun m!835483 () Bool)

(assert (=> bm!39901 m!835483))

(assert (=> b!898870 d!111359))

(declare-fun d!111361 () Bool)

(declare-fun e!502959 () Bool)

(assert (=> d!111361 e!502959))

(declare-fun res!607405 () Bool)

(assert (=> d!111361 (=> (not res!607405) (not e!502959))))

(assert (=> d!111361 (= res!607405 (and (bvsge (index!38084 lt!405855) #b00000000000000000000000000000000) (bvslt (index!38084 lt!405855) (size!25803 (_keys!10201 thiss!1181)))))))

(declare-fun lt!405951 () Unit!30548)

(declare-fun choose!1495 (array!52742 array!52744 (_ BitVec 32) (_ BitVec 32) V!29433 V!29433 (_ BitVec 32) Int) Unit!30548)

(assert (=> d!111361 (= lt!405951 (choose!1495 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) (index!38084 lt!405855) (defaultEntry!5420 thiss!1181)))))

(assert (=> d!111361 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111361 (= (lemmaValidKeyInArrayIsInListMap!246 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) (index!38084 lt!405855) (defaultEntry!5420 thiss!1181)) lt!405951)))

(declare-fun b!898980 () Bool)

(assert (=> b!898980 (= e!502959 (contains!4414 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(assert (= (and d!111361 res!607405) b!898980))

(declare-fun m!835485 () Bool)

(assert (=> d!111361 m!835485))

(assert (=> d!111361 m!835373))

(assert (=> b!898980 m!835365))

(assert (=> b!898980 m!835367))

(assert (=> b!898980 m!835365))

(assert (=> b!898980 m!835367))

(assert (=> b!898980 m!835369))

(assert (=> b!898870 d!111361))

(declare-fun d!111363 () Bool)

(assert (=> d!111363 (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405954 () Unit!30548)

(declare-fun choose!13 (array!52742 (_ BitVec 64) (_ BitVec 32)) Unit!30548)

(assert (=> d!111363 (= lt!405954 (choose!13 (_keys!10201 thiss!1181) key!785 (index!38084 lt!405855)))))

(assert (=> d!111363 (bvsge (index!38084 lt!405855) #b00000000000000000000000000000000)))

(assert (=> d!111363 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10201 thiss!1181) key!785 (index!38084 lt!405855)) lt!405954)))

(declare-fun bs!25231 () Bool)

(assert (= bs!25231 d!111363))

(assert (=> bs!25231 m!835371))

(declare-fun m!835487 () Bool)

(assert (=> bs!25231 m!835487))

(assert (=> b!898870 d!111363))

(declare-fun d!111365 () Bool)

(assert (=> d!111365 (= (inRange!0 (index!38084 lt!405855) (mask!26161 thiss!1181)) (and (bvsge (index!38084 lt!405855) #b00000000000000000000000000000000) (bvslt (index!38084 lt!405855) (bvadd (mask!26161 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898866 d!111365))

(declare-fun d!111367 () Bool)

(declare-fun e!502962 () Bool)

(assert (=> d!111367 e!502962))

(declare-fun res!607408 () Bool)

(assert (=> d!111367 (=> res!607408 e!502962)))

(declare-fun lt!405960 () SeekEntryResult!8928)

(assert (=> d!111367 (= res!607408 (not ((_ is Found!8928) lt!405960)))))

(assert (=> d!111367 (= lt!405960 (seekEntry!0 key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun lt!405959 () Unit!30548)

(declare-fun choose!1496 (array!52742 array!52744 (_ BitVec 32) (_ BitVec 32) V!29433 V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> d!111367 (= lt!405959 (choose!1496 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) key!785))))

(assert (=> d!111367 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111367 (= (lemmaSeekEntryGivesInRangeIndex!93 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) key!785) lt!405959)))

(declare-fun b!898983 () Bool)

(assert (=> b!898983 (= e!502962 (inRange!0 (index!38084 lt!405960) (mask!26161 thiss!1181)))))

(assert (= (and d!111367 (not res!607408)) b!898983))

(assert (=> d!111367 m!835385))

(declare-fun m!835489 () Bool)

(assert (=> d!111367 m!835489))

(assert (=> d!111367 m!835373))

(declare-fun m!835491 () Bool)

(assert (=> b!898983 m!835491))

(assert (=> b!898869 d!111367))

(declare-fun b!898996 () Bool)

(declare-fun e!502971 () SeekEntryResult!8928)

(declare-fun e!502969 () SeekEntryResult!8928)

(assert (=> b!898996 (= e!502971 e!502969)))

(declare-fun lt!405970 () (_ BitVec 64))

(declare-fun lt!405972 () SeekEntryResult!8928)

(assert (=> b!898996 (= lt!405970 (select (arr!25347 (_keys!10201 thiss!1181)) (index!38085 lt!405972)))))

(declare-fun c!95058 () Bool)

(assert (=> b!898996 (= c!95058 (= lt!405970 key!785))))

(declare-fun b!898998 () Bool)

(declare-fun e!502970 () SeekEntryResult!8928)

(declare-fun lt!405971 () SeekEntryResult!8928)

(assert (=> b!898998 (= e!502970 (ite ((_ is MissingVacant!8928) lt!405971) (MissingZero!8928 (index!38086 lt!405971)) lt!405971))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52742 (_ BitVec 32)) SeekEntryResult!8928)

(assert (=> b!898998 (= lt!405971 (seekKeyOrZeroReturnVacant!0 (x!76601 lt!405972) (index!38085 lt!405972) (index!38085 lt!405972) key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun b!898999 () Bool)

(assert (=> b!898999 (= e!502970 (MissingZero!8928 (index!38085 lt!405972)))))

(declare-fun b!899000 () Bool)

(assert (=> b!899000 (= e!502969 (Found!8928 (index!38085 lt!405972)))))

(declare-fun b!899001 () Bool)

(assert (=> b!899001 (= e!502971 Undefined!8928)))

(declare-fun b!898997 () Bool)

(declare-fun c!95056 () Bool)

(assert (=> b!898997 (= c!95056 (= lt!405970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898997 (= e!502969 e!502970)))

(declare-fun d!111369 () Bool)

(declare-fun lt!405969 () SeekEntryResult!8928)

(assert (=> d!111369 (and (or ((_ is MissingVacant!8928) lt!405969) (not ((_ is Found!8928) lt!405969)) (and (bvsge (index!38084 lt!405969) #b00000000000000000000000000000000) (bvslt (index!38084 lt!405969) (size!25803 (_keys!10201 thiss!1181))))) (not ((_ is MissingVacant!8928) lt!405969)) (or (not ((_ is Found!8928) lt!405969)) (= (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405969)) key!785)))))

(assert (=> d!111369 (= lt!405969 e!502971)))

(declare-fun c!95057 () Bool)

(assert (=> d!111369 (= c!95057 (and ((_ is Intermediate!8928) lt!405972) (undefined!9740 lt!405972)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52742 (_ BitVec 32)) SeekEntryResult!8928)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111369 (= lt!405972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26161 thiss!1181)) key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(assert (=> d!111369 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111369 (= (seekEntry!0 key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)) lt!405969)))

(assert (= (and d!111369 c!95057) b!899001))

(assert (= (and d!111369 (not c!95057)) b!898996))

(assert (= (and b!898996 c!95058) b!899000))

(assert (= (and b!898996 (not c!95058)) b!898997))

(assert (= (and b!898997 c!95056) b!898999))

(assert (= (and b!898997 (not c!95056)) b!898998))

(declare-fun m!835493 () Bool)

(assert (=> b!898996 m!835493))

(declare-fun m!835495 () Bool)

(assert (=> b!898998 m!835495))

(declare-fun m!835497 () Bool)

(assert (=> d!111369 m!835497))

(declare-fun m!835499 () Bool)

(assert (=> d!111369 m!835499))

(assert (=> d!111369 m!835499))

(declare-fun m!835501 () Bool)

(assert (=> d!111369 m!835501))

(assert (=> d!111369 m!835373))

(assert (=> b!898869 d!111369))

(declare-fun d!111371 () Bool)

(declare-fun res!607415 () Bool)

(declare-fun e!502974 () Bool)

(assert (=> d!111371 (=> (not res!607415) (not e!502974))))

(declare-fun simpleValid!325 (LongMapFixedSize!4404) Bool)

(assert (=> d!111371 (= res!607415 (simpleValid!325 thiss!1181))))

(assert (=> d!111371 (= (valid!1693 thiss!1181) e!502974)))

(declare-fun b!899008 () Bool)

(declare-fun res!607416 () Bool)

(assert (=> b!899008 (=> (not res!607416) (not e!502974))))

(declare-fun arrayCountValidKeys!0 (array!52742 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899008 (= res!607416 (= (arrayCountValidKeys!0 (_keys!10201 thiss!1181) #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))) (_size!2257 thiss!1181)))))

(declare-fun b!899009 () Bool)

(declare-fun res!607417 () Bool)

(assert (=> b!899009 (=> (not res!607417) (not e!502974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52742 (_ BitVec 32)) Bool)

(assert (=> b!899009 (= res!607417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun b!899010 () Bool)

(declare-datatypes ((List!17845 0))(
  ( (Nil!17842) (Cons!17841 (h!18984 (_ BitVec 64)) (t!25190 List!17845)) )
))
(declare-fun arrayNoDuplicates!0 (array!52742 (_ BitVec 32) List!17845) Bool)

(assert (=> b!899010 (= e!502974 (arrayNoDuplicates!0 (_keys!10201 thiss!1181) #b00000000000000000000000000000000 Nil!17842))))

(assert (= (and d!111371 res!607415) b!899008))

(assert (= (and b!899008 res!607416) b!899009))

(assert (= (and b!899009 res!607417) b!899010))

(declare-fun m!835503 () Bool)

(assert (=> d!111371 m!835503))

(declare-fun m!835505 () Bool)

(assert (=> b!899008 m!835505))

(declare-fun m!835507 () Bool)

(assert (=> b!899009 m!835507))

(declare-fun m!835509 () Bool)

(assert (=> b!899010 m!835509))

(assert (=> start!76878 d!111371))

(declare-fun condMapEmpty!29191 () Bool)

(declare-fun mapDefault!29191 () ValueCell!8694)

(assert (=> mapNonEmpty!29185 (= condMapEmpty!29191 (= mapRest!29185 ((as const (Array (_ BitVec 32) ValueCell!8694)) mapDefault!29191)))))

(declare-fun e!502980 () Bool)

(declare-fun mapRes!29191 () Bool)

(assert (=> mapNonEmpty!29185 (= tp!56141 (and e!502980 mapRes!29191))))

(declare-fun b!899017 () Bool)

(declare-fun e!502979 () Bool)

(assert (=> b!899017 (= e!502979 tp_is_empty!18351)))

(declare-fun b!899018 () Bool)

(assert (=> b!899018 (= e!502980 tp_is_empty!18351)))

(declare-fun mapNonEmpty!29191 () Bool)

(declare-fun tp!56151 () Bool)

(assert (=> mapNonEmpty!29191 (= mapRes!29191 (and tp!56151 e!502979))))

(declare-fun mapRest!29191 () (Array (_ BitVec 32) ValueCell!8694))

(declare-fun mapValue!29191 () ValueCell!8694)

(declare-fun mapKey!29191 () (_ BitVec 32))

(assert (=> mapNonEmpty!29191 (= mapRest!29185 (store mapRest!29191 mapKey!29191 mapValue!29191))))

(declare-fun mapIsEmpty!29191 () Bool)

(assert (=> mapIsEmpty!29191 mapRes!29191))

(assert (= (and mapNonEmpty!29185 condMapEmpty!29191) mapIsEmpty!29191))

(assert (= (and mapNonEmpty!29185 (not condMapEmpty!29191)) mapNonEmpty!29191))

(assert (= (and mapNonEmpty!29191 ((_ is ValueCellFull!8694) mapValue!29191)) b!899017))

(assert (= (and mapNonEmpty!29185 ((_ is ValueCellFull!8694) mapDefault!29191)) b!899018))

(declare-fun m!835511 () Bool)

(assert (=> mapNonEmpty!29191 m!835511))

(declare-fun b_lambda!12977 () Bool)

(assert (= b_lambda!12975 (or (and b!898867 b_free!16023) b_lambda!12977)))

(check-sat (not b!898998) (not b!898955) (not b!898970) b_and!26327 (not d!111361) tp_is_empty!18351 (not b_next!16023) (not d!111367) (not b!899010) (not bm!39901) (not b!898983) (not b!898975) (not b!898906) (not d!111359) (not b!898971) (not d!111369) (not b!898904) (not b!898964) (not d!111363) (not b!898956) (not b!898912) (not mapNonEmpty!29191) (not b_lambda!12977) (not b!899009) (not b!899008) (not d!111371) (not d!111355) (not b!898980) (not bm!39905) (not b!898974) (not bm!39907) (not bm!39902) (not b!898963))
(check-sat b_and!26327 (not b_next!16023))
(get-model)

(declare-fun d!111373 () Bool)

(declare-fun get!13329 (Option!463) V!29433)

(assert (=> d!111373 (= (apply!411 lt!405947 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13329 (getValueByKey!457 (toList!5383 lt!405947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25232 () Bool)

(assert (= bs!25232 d!111373))

(declare-fun m!835513 () Bool)

(assert (=> bs!25232 m!835513))

(assert (=> bs!25232 m!835513))

(declare-fun m!835515 () Bool)

(assert (=> bs!25232 m!835515))

(assert (=> b!898956 d!111373))

(declare-fun d!111375 () Bool)

(declare-fun e!502981 () Bool)

(assert (=> d!111375 e!502981))

(declare-fun res!607418 () Bool)

(assert (=> d!111375 (=> res!607418 e!502981)))

(declare-fun lt!405976 () Bool)

(assert (=> d!111375 (= res!607418 (not lt!405976))))

(declare-fun lt!405973 () Bool)

(assert (=> d!111375 (= lt!405976 lt!405973)))

(declare-fun lt!405975 () Unit!30548)

(declare-fun e!502982 () Unit!30548)

(assert (=> d!111375 (= lt!405975 e!502982)))

(declare-fun c!95059 () Bool)

(assert (=> d!111375 (= c!95059 lt!405973)))

(assert (=> d!111375 (= lt!405973 (containsKey!426 (toList!5383 lt!405947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111375 (= (contains!4414 lt!405947 #b1000000000000000000000000000000000000000000000000000000000000000) lt!405976)))

(declare-fun b!899019 () Bool)

(declare-fun lt!405974 () Unit!30548)

(assert (=> b!899019 (= e!502982 lt!405974)))

(assert (=> b!899019 (= lt!405974 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5383 lt!405947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899019 (isDefined!331 (getValueByKey!457 (toList!5383 lt!405947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899020 () Bool)

(declare-fun Unit!30554 () Unit!30548)

(assert (=> b!899020 (= e!502982 Unit!30554)))

(declare-fun b!899021 () Bool)

(assert (=> b!899021 (= e!502981 (isDefined!331 (getValueByKey!457 (toList!5383 lt!405947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111375 c!95059) b!899019))

(assert (= (and d!111375 (not c!95059)) b!899020))

(assert (= (and d!111375 (not res!607418)) b!899021))

(declare-fun m!835517 () Bool)

(assert (=> d!111375 m!835517))

(declare-fun m!835519 () Bool)

(assert (=> b!899019 m!835519))

(assert (=> b!899019 m!835513))

(assert (=> b!899019 m!835513))

(declare-fun m!835521 () Bool)

(assert (=> b!899019 m!835521))

(assert (=> b!899021 m!835513))

(assert (=> b!899021 m!835513))

(assert (=> b!899021 m!835521))

(assert (=> bm!39907 d!111375))

(declare-fun d!111377 () Bool)

(declare-fun e!502985 () Bool)

(assert (=> d!111377 e!502985))

(declare-fun res!607424 () Bool)

(assert (=> d!111377 (=> (not res!607424) (not e!502985))))

(declare-fun lt!405985 () ListLongMap!10735)

(assert (=> d!111377 (= res!607424 (contains!4414 lt!405985 (_1!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))))

(declare-fun lt!405986 () List!17843)

(assert (=> d!111377 (= lt!405985 (ListLongMap!10736 lt!405986))))

(declare-fun lt!405987 () Unit!30548)

(declare-fun lt!405988 () Unit!30548)

(assert (=> d!111377 (= lt!405987 lt!405988)))

(assert (=> d!111377 (= (getValueByKey!457 lt!405986 (_1!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))) (Some!462 (_2!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!249 (List!17843 (_ BitVec 64) V!29433) Unit!30548)

(assert (=> d!111377 (= lt!405988 (lemmaContainsTupThenGetReturnValue!249 lt!405986 (_1!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))) (_2!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))))

(declare-fun insertStrictlySorted!306 (List!17843 (_ BitVec 64) V!29433) List!17843)

(assert (=> d!111377 (= lt!405986 (insertStrictlySorted!306 (toList!5383 (ite c!95046 call!39906 (ite c!95049 call!39909 call!39908))) (_1!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))) (_2!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))))

(assert (=> d!111377 (= (+!2592 (ite c!95046 call!39906 (ite c!95049 call!39909 call!39908)) (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))) lt!405985)))

(declare-fun b!899026 () Bool)

(declare-fun res!607423 () Bool)

(assert (=> b!899026 (=> (not res!607423) (not e!502985))))

(assert (=> b!899026 (= res!607423 (= (getValueByKey!457 (toList!5383 lt!405985) (_1!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))) (Some!462 (_2!6030 (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))))

(declare-fun b!899027 () Bool)

(declare-fun contains!4416 (List!17843 tuple2!12038) Bool)

(assert (=> b!899027 (= e!502985 (contains!4416 (toList!5383 lt!405985) (ite (or c!95046 c!95049) (tuple2!12039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5242 thiss!1181)) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))

(assert (= (and d!111377 res!607424) b!899026))

(assert (= (and b!899026 res!607423) b!899027))

(declare-fun m!835523 () Bool)

(assert (=> d!111377 m!835523))

(declare-fun m!835525 () Bool)

(assert (=> d!111377 m!835525))

(declare-fun m!835527 () Bool)

(assert (=> d!111377 m!835527))

(declare-fun m!835529 () Bool)

(assert (=> d!111377 m!835529))

(declare-fun m!835531 () Bool)

(assert (=> b!899026 m!835531))

(declare-fun m!835533 () Bool)

(assert (=> b!899027 m!835533))

(assert (=> bm!39901 d!111377))

(declare-fun d!111379 () Bool)

(declare-fun isEmpty!686 (Option!463) Bool)

(assert (=> d!111379 (= (isDefined!331 (getValueByKey!457 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))) (not (isEmpty!686 (getValueByKey!457 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))))

(declare-fun bs!25233 () Bool)

(assert (= bs!25233 d!111379))

(assert (=> bs!25233 m!835421))

(declare-fun m!835535 () Bool)

(assert (=> bs!25233 m!835535))

(assert (=> b!898906 d!111379))

(declare-fun b!899037 () Bool)

(declare-fun e!502990 () Option!463)

(declare-fun e!502991 () Option!463)

(assert (=> b!899037 (= e!502990 e!502991)))

(declare-fun c!95065 () Bool)

(assert (=> b!899037 (= c!95065 (and ((_ is Cons!17839) (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))) (not (= (_1!6030 (h!18982 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))))

(declare-fun d!111381 () Bool)

(declare-fun c!95064 () Bool)

(assert (=> d!111381 (= c!95064 (and ((_ is Cons!17839) (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))) (= (_1!6030 (h!18982 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))))))

(assert (=> d!111381 (= (getValueByKey!457 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))) e!502990)))

(declare-fun b!899036 () Bool)

(assert (=> b!899036 (= e!502990 (Some!462 (_2!6030 (h!18982 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))))))

(declare-fun b!899038 () Bool)

(assert (=> b!899038 (= e!502991 (getValueByKey!457 (t!25186 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(declare-fun b!899039 () Bool)

(assert (=> b!899039 (= e!502991 None!461)))

(assert (= (and d!111381 c!95064) b!899036))

(assert (= (and d!111381 (not c!95064)) b!899037))

(assert (= (and b!899037 c!95065) b!899038))

(assert (= (and b!899037 (not c!95065)) b!899039))

(assert (=> b!899038 m!835367))

(declare-fun m!835537 () Bool)

(assert (=> b!899038 m!835537))

(assert (=> b!898906 d!111381))

(declare-fun d!111383 () Bool)

(assert (=> d!111383 (= (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898955 d!111383))

(declare-fun d!111385 () Bool)

(assert (=> d!111385 (= (inRange!0 (index!38084 lt!405960) (mask!26161 thiss!1181)) (and (bvsge (index!38084 lt!405960) #b00000000000000000000000000000000) (bvslt (index!38084 lt!405960) (bvadd (mask!26161 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898983 d!111385))

(declare-fun d!111387 () Bool)

(declare-fun e!502992 () Bool)

(assert (=> d!111387 e!502992))

(declare-fun res!607426 () Bool)

(assert (=> d!111387 (=> (not res!607426) (not e!502992))))

(declare-fun lt!405989 () ListLongMap!10735)

(assert (=> d!111387 (= res!607426 (contains!4414 lt!405989 (_1!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))

(declare-fun lt!405990 () List!17843)

(assert (=> d!111387 (= lt!405989 (ListLongMap!10736 lt!405990))))

(declare-fun lt!405991 () Unit!30548)

(declare-fun lt!405992 () Unit!30548)

(assert (=> d!111387 (= lt!405991 lt!405992)))

(assert (=> d!111387 (= (getValueByKey!457 lt!405990 (_1!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))

(assert (=> d!111387 (= lt!405992 (lemmaContainsTupThenGetReturnValue!249 lt!405990 (_1!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))

(assert (=> d!111387 (= lt!405990 (insertStrictlySorted!306 (toList!5383 call!39905) (_1!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))))))

(assert (=> d!111387 (= (+!2592 call!39905 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))) lt!405989)))

(declare-fun b!899040 () Bool)

(declare-fun res!607425 () Bool)

(assert (=> b!899040 (=> (not res!607425) (not e!502992))))

(assert (=> b!899040 (= res!607425 (= (getValueByKey!457 (toList!5383 lt!405989) (_1!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))))

(declare-fun b!899041 () Bool)

(assert (=> b!899041 (= e!502992 (contains!4416 (toList!5383 lt!405989) (tuple2!12039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5242 thiss!1181))))))

(assert (= (and d!111387 res!607426) b!899040))

(assert (= (and b!899040 res!607425) b!899041))

(declare-fun m!835539 () Bool)

(assert (=> d!111387 m!835539))

(declare-fun m!835541 () Bool)

(assert (=> d!111387 m!835541))

(declare-fun m!835543 () Bool)

(assert (=> d!111387 m!835543))

(declare-fun m!835545 () Bool)

(assert (=> d!111387 m!835545))

(declare-fun m!835547 () Bool)

(assert (=> b!899040 m!835547))

(declare-fun m!835549 () Bool)

(assert (=> b!899041 m!835549))

(assert (=> b!898971 d!111387))

(declare-fun d!111389 () Bool)

(assert (=> d!111389 (= (apply!411 lt!405947 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13329 (getValueByKey!457 (toList!5383 lt!405947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25234 () Bool)

(assert (= bs!25234 d!111389))

(declare-fun m!835551 () Bool)

(assert (=> bs!25234 m!835551))

(assert (=> bs!25234 m!835551))

(declare-fun m!835553 () Bool)

(assert (=> bs!25234 m!835553))

(assert (=> b!898970 d!111389))

(assert (=> d!111363 d!111357))

(declare-fun d!111391 () Bool)

(assert (=> d!111391 (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111391 true))

(declare-fun _$60!421 () Unit!30548)

(assert (=> d!111391 (= (choose!13 (_keys!10201 thiss!1181) key!785 (index!38084 lt!405855)) _$60!421)))

(declare-fun bs!25235 () Bool)

(assert (= bs!25235 d!111391))

(assert (=> bs!25235 m!835371))

(assert (=> d!111363 d!111391))

(declare-fun d!111393 () Bool)

(assert (=> d!111393 (isDefined!331 (getValueByKey!457 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(declare-fun lt!405995 () Unit!30548)

(declare-fun choose!1497 (List!17843 (_ BitVec 64)) Unit!30548)

(assert (=> d!111393 (= lt!405995 (choose!1497 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(declare-fun e!502995 () Bool)

(assert (=> d!111393 e!502995))

(declare-fun res!607429 () Bool)

(assert (=> d!111393 (=> (not res!607429) (not e!502995))))

(declare-fun isStrictlySorted!498 (List!17843) Bool)

(assert (=> d!111393 (= res!607429 (isStrictlySorted!498 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))))))

(assert (=> d!111393 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))) lt!405995)))

(declare-fun b!899044 () Bool)

(assert (=> b!899044 (= e!502995 (containsKey!426 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(assert (= (and d!111393 res!607429) b!899044))

(assert (=> d!111393 m!835367))

(assert (=> d!111393 m!835421))

(assert (=> d!111393 m!835421))

(assert (=> d!111393 m!835423))

(assert (=> d!111393 m!835367))

(declare-fun m!835555 () Bool)

(assert (=> d!111393 m!835555))

(declare-fun m!835557 () Bool)

(assert (=> d!111393 m!835557))

(assert (=> b!899044 m!835367))

(assert (=> b!899044 m!835417))

(assert (=> b!898904 d!111393))

(assert (=> b!898904 d!111379))

(assert (=> b!898904 d!111381))

(declare-fun d!111395 () Bool)

(declare-fun e!502996 () Bool)

(assert (=> d!111395 e!502996))

(declare-fun res!607430 () Bool)

(assert (=> d!111395 (=> res!607430 e!502996)))

(declare-fun lt!405999 () Bool)

(assert (=> d!111395 (= res!607430 (not lt!405999))))

(declare-fun lt!405996 () Bool)

(assert (=> d!111395 (= lt!405999 lt!405996)))

(declare-fun lt!405998 () Unit!30548)

(declare-fun e!502997 () Unit!30548)

(assert (=> d!111395 (= lt!405998 e!502997)))

(declare-fun c!95066 () Bool)

(assert (=> d!111395 (= c!95066 lt!405996)))

(assert (=> d!111395 (= lt!405996 (containsKey!426 (toList!5383 lt!405947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111395 (= (contains!4414 lt!405947 #b0000000000000000000000000000000000000000000000000000000000000000) lt!405999)))

(declare-fun b!899045 () Bool)

(declare-fun lt!405997 () Unit!30548)

(assert (=> b!899045 (= e!502997 lt!405997)))

(assert (=> b!899045 (= lt!405997 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5383 lt!405947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899045 (isDefined!331 (getValueByKey!457 (toList!5383 lt!405947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899046 () Bool)

(declare-fun Unit!30555 () Unit!30548)

(assert (=> b!899046 (= e!502997 Unit!30555)))

(declare-fun b!899047 () Bool)

(assert (=> b!899047 (= e!502996 (isDefined!331 (getValueByKey!457 (toList!5383 lt!405947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111395 c!95066) b!899045))

(assert (= (and d!111395 (not c!95066)) b!899046))

(assert (= (and d!111395 (not res!607430)) b!899047))

(declare-fun m!835559 () Bool)

(assert (=> d!111395 m!835559))

(declare-fun m!835561 () Bool)

(assert (=> b!899045 m!835561))

(assert (=> b!899045 m!835551))

(assert (=> b!899045 m!835551))

(declare-fun m!835563 () Bool)

(assert (=> b!899045 m!835563))

(assert (=> b!899047 m!835551))

(assert (=> b!899047 m!835551))

(assert (=> b!899047 m!835563))

(assert (=> bm!39905 d!111395))

(assert (=> d!111367 d!111369))

(declare-fun d!111397 () Bool)

(declare-fun e!503000 () Bool)

(assert (=> d!111397 e!503000))

(declare-fun res!607433 () Bool)

(assert (=> d!111397 (=> res!607433 e!503000)))

(declare-fun lt!406002 () SeekEntryResult!8928)

(assert (=> d!111397 (= res!607433 (not ((_ is Found!8928) lt!406002)))))

(assert (=> d!111397 (= lt!406002 (seekEntry!0 key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(assert (=> d!111397 true))

(declare-fun _$36!369 () Unit!30548)

(assert (=> d!111397 (= (choose!1496 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) key!785) _$36!369)))

(declare-fun b!899050 () Bool)

(assert (=> b!899050 (= e!503000 (inRange!0 (index!38084 lt!406002) (mask!26161 thiss!1181)))))

(assert (= (and d!111397 (not res!607433)) b!899050))

(assert (=> d!111397 m!835385))

(declare-fun m!835565 () Bool)

(assert (=> b!899050 m!835565))

(assert (=> d!111367 d!111397))

(assert (=> d!111367 d!111353))

(assert (=> d!111359 d!111353))

(assert (=> b!898980 d!111355))

(assert (=> b!898980 d!111359))

(declare-fun d!111399 () Bool)

(assert (=> d!111399 (contains!4414 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))))

(assert (=> d!111399 true))

(declare-fun _$16!181 () Unit!30548)

(assert (=> d!111399 (= (choose!1495 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) (index!38084 lt!405855) (defaultEntry!5420 thiss!1181)) _$16!181)))

(declare-fun bs!25236 () Bool)

(assert (= bs!25236 d!111399))

(assert (=> bs!25236 m!835365))

(assert (=> bs!25236 m!835367))

(assert (=> bs!25236 m!835365))

(assert (=> bs!25236 m!835367))

(assert (=> bs!25236 m!835369))

(assert (=> d!111361 d!111399))

(assert (=> d!111361 d!111353))

(declare-fun b!899064 () Bool)

(declare-fun e!503008 () SeekEntryResult!8928)

(assert (=> b!899064 (= e!503008 Undefined!8928)))

(declare-fun b!899065 () Bool)

(declare-fun c!95075 () Bool)

(declare-fun lt!406008 () (_ BitVec 64))

(assert (=> b!899065 (= c!95075 (= lt!406008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503007 () SeekEntryResult!8928)

(declare-fun e!503009 () SeekEntryResult!8928)

(assert (=> b!899065 (= e!503007 e!503009)))

(declare-fun b!899066 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899066 (= e!503009 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76601 lt!405972) #b00000000000000000000000000000001) (nextIndex!0 (index!38085 lt!405972) (x!76601 lt!405972) (mask!26161 thiss!1181)) (index!38085 lt!405972) key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun b!899067 () Bool)

(assert (=> b!899067 (= e!503009 (MissingVacant!8928 (index!38085 lt!405972)))))

(declare-fun b!899068 () Bool)

(assert (=> b!899068 (= e!503007 (Found!8928 (index!38085 lt!405972)))))

(declare-fun b!899063 () Bool)

(assert (=> b!899063 (= e!503008 e!503007)))

(declare-fun c!95074 () Bool)

(assert (=> b!899063 (= c!95074 (= lt!406008 key!785))))

(declare-fun lt!406007 () SeekEntryResult!8928)

(declare-fun d!111401 () Bool)

(assert (=> d!111401 (and (or ((_ is Undefined!8928) lt!406007) (not ((_ is Found!8928) lt!406007)) (and (bvsge (index!38084 lt!406007) #b00000000000000000000000000000000) (bvslt (index!38084 lt!406007) (size!25803 (_keys!10201 thiss!1181))))) (or ((_ is Undefined!8928) lt!406007) ((_ is Found!8928) lt!406007) (not ((_ is MissingVacant!8928) lt!406007)) (not (= (index!38086 lt!406007) (index!38085 lt!405972))) (and (bvsge (index!38086 lt!406007) #b00000000000000000000000000000000) (bvslt (index!38086 lt!406007) (size!25803 (_keys!10201 thiss!1181))))) (or ((_ is Undefined!8928) lt!406007) (ite ((_ is Found!8928) lt!406007) (= (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!406007)) key!785) (and ((_ is MissingVacant!8928) lt!406007) (= (index!38086 lt!406007) (index!38085 lt!405972)) (= (select (arr!25347 (_keys!10201 thiss!1181)) (index!38086 lt!406007)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111401 (= lt!406007 e!503008)))

(declare-fun c!95073 () Bool)

(assert (=> d!111401 (= c!95073 (bvsge (x!76601 lt!405972) #b01111111111111111111111111111110))))

(assert (=> d!111401 (= lt!406008 (select (arr!25347 (_keys!10201 thiss!1181)) (index!38085 lt!405972)))))

(assert (=> d!111401 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111401 (= (seekKeyOrZeroReturnVacant!0 (x!76601 lt!405972) (index!38085 lt!405972) (index!38085 lt!405972) key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)) lt!406007)))

(assert (= (and d!111401 c!95073) b!899064))

(assert (= (and d!111401 (not c!95073)) b!899063))

(assert (= (and b!899063 c!95074) b!899068))

(assert (= (and b!899063 (not c!95074)) b!899065))

(assert (= (and b!899065 c!95075) b!899067))

(assert (= (and b!899065 (not c!95075)) b!899066))

(declare-fun m!835567 () Bool)

(assert (=> b!899066 m!835567))

(assert (=> b!899066 m!835567))

(declare-fun m!835569 () Bool)

(assert (=> b!899066 m!835569))

(declare-fun m!835571 () Bool)

(assert (=> d!111401 m!835571))

(declare-fun m!835573 () Bool)

(assert (=> d!111401 m!835573))

(assert (=> d!111401 m!835493))

(assert (=> d!111401 m!835373))

(assert (=> b!898998 d!111401))

(declare-fun d!111403 () Bool)

(declare-fun res!607434 () Bool)

(declare-fun e!503010 () Bool)

(assert (=> d!111403 (=> res!607434 e!503010)))

(assert (=> d!111403 (= res!607434 (= (select (arr!25347 (_keys!10201 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111403 (= (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503010)))

(declare-fun b!899069 () Bool)

(declare-fun e!503011 () Bool)

(assert (=> b!899069 (= e!503010 e!503011)))

(declare-fun res!607435 () Bool)

(assert (=> b!899069 (=> (not res!607435) (not e!503011))))

(assert (=> b!899069 (= res!607435 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun b!899070 () Bool)

(assert (=> b!899070 (= e!503011 (arrayContainsKey!0 (_keys!10201 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111403 (not res!607434)) b!899069))

(assert (= (and b!899069 res!607435) b!899070))

(declare-fun m!835575 () Bool)

(assert (=> d!111403 m!835575))

(declare-fun m!835577 () Bool)

(assert (=> b!899070 m!835577))

(assert (=> b!898912 d!111403))

(assert (=> b!898964 d!111383))

(declare-fun b!899081 () Bool)

(declare-fun e!503023 () Bool)

(declare-fun e!503021 () Bool)

(assert (=> b!899081 (= e!503023 e!503021)))

(declare-fun res!607444 () Bool)

(assert (=> b!899081 (=> (not res!607444) (not e!503021))))

(declare-fun e!503020 () Bool)

(assert (=> b!899081 (= res!607444 (not e!503020))))

(declare-fun res!607443 () Bool)

(assert (=> b!899081 (=> (not res!607443) (not e!503020))))

(assert (=> b!899081 (= res!607443 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111405 () Bool)

(declare-fun res!607442 () Bool)

(assert (=> d!111405 (=> res!607442 e!503023)))

(assert (=> d!111405 (= res!607442 (bvsge #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(assert (=> d!111405 (= (arrayNoDuplicates!0 (_keys!10201 thiss!1181) #b00000000000000000000000000000000 Nil!17842) e!503023)))

(declare-fun bm!39910 () Bool)

(declare-fun call!39913 () Bool)

(declare-fun c!95078 () Bool)

(assert (=> bm!39910 (= call!39913 (arrayNoDuplicates!0 (_keys!10201 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95078 (Cons!17841 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000) Nil!17842) Nil!17842)))))

(declare-fun b!899082 () Bool)

(declare-fun e!503022 () Bool)

(assert (=> b!899082 (= e!503021 e!503022)))

(assert (=> b!899082 (= c!95078 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899083 () Bool)

(assert (=> b!899083 (= e!503022 call!39913)))

(declare-fun b!899084 () Bool)

(declare-fun contains!4417 (List!17845 (_ BitVec 64)) Bool)

(assert (=> b!899084 (= e!503020 (contains!4417 Nil!17842 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899085 () Bool)

(assert (=> b!899085 (= e!503022 call!39913)))

(assert (= (and d!111405 (not res!607442)) b!899081))

(assert (= (and b!899081 res!607443) b!899084))

(assert (= (and b!899081 res!607444) b!899082))

(assert (= (and b!899082 c!95078) b!899083))

(assert (= (and b!899082 (not c!95078)) b!899085))

(assert (= (or b!899083 b!899085) bm!39910))

(assert (=> b!899081 m!835425))

(assert (=> b!899081 m!835425))

(assert (=> b!899081 m!835431))

(assert (=> bm!39910 m!835425))

(declare-fun m!835579 () Bool)

(assert (=> bm!39910 m!835579))

(assert (=> b!899082 m!835425))

(assert (=> b!899082 m!835425))

(assert (=> b!899082 m!835431))

(assert (=> b!899084 m!835425))

(assert (=> b!899084 m!835425))

(declare-fun m!835581 () Bool)

(assert (=> b!899084 m!835581))

(assert (=> b!899010 d!111405))

(declare-fun d!111407 () Bool)

(assert (=> d!111407 (= (apply!411 lt!405947 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)) (get!13329 (getValueByKey!457 (toList!5383 lt!405947) (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25237 () Bool)

(assert (= bs!25237 d!111407))

(assert (=> bs!25237 m!835425))

(declare-fun m!835583 () Bool)

(assert (=> bs!25237 m!835583))

(assert (=> bs!25237 m!835583))

(declare-fun m!835585 () Bool)

(assert (=> bs!25237 m!835585))

(assert (=> b!898963 d!111407))

(declare-fun d!111409 () Bool)

(declare-fun c!95081 () Bool)

(assert (=> d!111409 (= c!95081 ((_ is ValueCellFull!8694) (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503026 () V!29433)

(assert (=> d!111409 (= (get!13328 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503026)))

(declare-fun b!899090 () Bool)

(declare-fun get!13330 (ValueCell!8694 V!29433) V!29433)

(assert (=> b!899090 (= e!503026 (get!13330 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899091 () Bool)

(declare-fun get!13331 (ValueCell!8694 V!29433) V!29433)

(assert (=> b!899091 (= e!503026 (get!13331 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111409 c!95081) b!899090))

(assert (= (and d!111409 (not c!95081)) b!899091))

(assert (=> b!899090 m!835473))

(assert (=> b!899090 m!835475))

(declare-fun m!835587 () Bool)

(assert (=> b!899090 m!835587))

(assert (=> b!899091 m!835473))

(assert (=> b!899091 m!835475))

(declare-fun m!835589 () Bool)

(assert (=> b!899091 m!835589))

(assert (=> b!898963 d!111409))

(declare-fun b!899100 () Bool)

(declare-fun e!503034 () Bool)

(declare-fun e!503035 () Bool)

(assert (=> b!899100 (= e!503034 e!503035)))

(declare-fun lt!406015 () (_ BitVec 64))

(assert (=> b!899100 (= lt!406015 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406017 () Unit!30548)

(assert (=> b!899100 (= lt!406017 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10201 thiss!1181) lt!406015 #b00000000000000000000000000000000))))

(assert (=> b!899100 (arrayContainsKey!0 (_keys!10201 thiss!1181) lt!406015 #b00000000000000000000000000000000)))

(declare-fun lt!406016 () Unit!30548)

(assert (=> b!899100 (= lt!406016 lt!406017)))

(declare-fun res!607450 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52742 (_ BitVec 32)) SeekEntryResult!8928)

(assert (=> b!899100 (= res!607450 (= (seekEntryOrOpen!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000) (_keys!10201 thiss!1181) (mask!26161 thiss!1181)) (Found!8928 #b00000000000000000000000000000000)))))

(assert (=> b!899100 (=> (not res!607450) (not e!503035))))

(declare-fun b!899101 () Bool)

(declare-fun call!39916 () Bool)

(assert (=> b!899101 (= e!503034 call!39916)))

(declare-fun d!111411 () Bool)

(declare-fun res!607449 () Bool)

(declare-fun e!503033 () Bool)

(assert (=> d!111411 (=> res!607449 e!503033)))

(assert (=> d!111411 (= res!607449 (bvsge #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(assert (=> d!111411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)) e!503033)))

(declare-fun b!899102 () Bool)

(assert (=> b!899102 (= e!503033 e!503034)))

(declare-fun c!95084 () Bool)

(assert (=> b!899102 (= c!95084 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39913 () Bool)

(assert (=> bm!39913 (= call!39916 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun b!899103 () Bool)

(assert (=> b!899103 (= e!503035 call!39916)))

(assert (= (and d!111411 (not res!607449)) b!899102))

(assert (= (and b!899102 c!95084) b!899100))

(assert (= (and b!899102 (not c!95084)) b!899101))

(assert (= (and b!899100 res!607450) b!899103))

(assert (= (or b!899103 b!899101) bm!39913))

(assert (=> b!899100 m!835425))

(declare-fun m!835591 () Bool)

(assert (=> b!899100 m!835591))

(declare-fun m!835593 () Bool)

(assert (=> b!899100 m!835593))

(assert (=> b!899100 m!835425))

(declare-fun m!835595 () Bool)

(assert (=> b!899100 m!835595))

(assert (=> b!899102 m!835425))

(assert (=> b!899102 m!835425))

(assert (=> b!899102 m!835431))

(declare-fun m!835597 () Bool)

(assert (=> bm!39913 m!835597))

(assert (=> b!899009 d!111411))

(declare-fun d!111413 () Bool)

(declare-fun lt!406020 () (_ BitVec 32))

(assert (=> d!111413 (and (bvsge lt!406020 #b00000000000000000000000000000000) (bvsle lt!406020 (bvsub (size!25803 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503040 () (_ BitVec 32))

(assert (=> d!111413 (= lt!406020 e!503040)))

(declare-fun c!95089 () Bool)

(assert (=> d!111413 (= c!95089 (bvsge #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(assert (=> d!111413 (and (bvsle #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25803 (_keys!10201 thiss!1181)) (size!25803 (_keys!10201 thiss!1181))))))

(assert (=> d!111413 (= (arrayCountValidKeys!0 (_keys!10201 thiss!1181) #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))) lt!406020)))

(declare-fun b!899112 () Bool)

(declare-fun e!503041 () (_ BitVec 32))

(assert (=> b!899112 (= e!503040 e!503041)))

(declare-fun c!95090 () Bool)

(assert (=> b!899112 (= c!95090 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899113 () Bool)

(declare-fun call!39919 () (_ BitVec 32))

(assert (=> b!899113 (= e!503041 (bvadd #b00000000000000000000000000000001 call!39919))))

(declare-fun bm!39916 () Bool)

(assert (=> bm!39916 (= call!39919 (arrayCountValidKeys!0 (_keys!10201 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun b!899114 () Bool)

(assert (=> b!899114 (= e!503040 #b00000000000000000000000000000000)))

(declare-fun b!899115 () Bool)

(assert (=> b!899115 (= e!503041 call!39919)))

(assert (= (and d!111413 c!95089) b!899114))

(assert (= (and d!111413 (not c!95089)) b!899112))

(assert (= (and b!899112 c!95090) b!899113))

(assert (= (and b!899112 (not c!95090)) b!899115))

(assert (= (or b!899113 b!899115) bm!39916))

(assert (=> b!899112 m!835425))

(assert (=> b!899112 m!835425))

(assert (=> b!899112 m!835431))

(declare-fun m!835599 () Bool)

(assert (=> bm!39916 m!835599))

(assert (=> b!899008 d!111413))

(declare-fun b!899126 () Bool)

(declare-fun res!607459 () Bool)

(declare-fun e!503044 () Bool)

(assert (=> b!899126 (=> (not res!607459) (not e!503044))))

(declare-fun size!25807 (LongMapFixedSize!4404) (_ BitVec 32))

(assert (=> b!899126 (= res!607459 (= (size!25807 thiss!1181) (bvadd (_size!2257 thiss!1181) (bvsdiv (bvadd (extraKeys!5138 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!899125 () Bool)

(declare-fun res!607462 () Bool)

(assert (=> b!899125 (=> (not res!607462) (not e!503044))))

(assert (=> b!899125 (= res!607462 (bvsge (size!25807 thiss!1181) (_size!2257 thiss!1181)))))

(declare-fun b!899127 () Bool)

(assert (=> b!899127 (= e!503044 (and (bvsge (extraKeys!5138 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5138 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2257 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!111415 () Bool)

(declare-fun res!607461 () Bool)

(assert (=> d!111415 (=> (not res!607461) (not e!503044))))

(assert (=> d!111415 (= res!607461 (validMask!0 (mask!26161 thiss!1181)))))

(assert (=> d!111415 (= (simpleValid!325 thiss!1181) e!503044)))

(declare-fun b!899124 () Bool)

(declare-fun res!607460 () Bool)

(assert (=> b!899124 (=> (not res!607460) (not e!503044))))

(assert (=> b!899124 (= res!607460 (and (= (size!25804 (_values!5429 thiss!1181)) (bvadd (mask!26161 thiss!1181) #b00000000000000000000000000000001)) (= (size!25803 (_keys!10201 thiss!1181)) (size!25804 (_values!5429 thiss!1181))) (bvsge (_size!2257 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2257 thiss!1181) (bvadd (mask!26161 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!111415 res!607461) b!899124))

(assert (= (and b!899124 res!607460) b!899125))

(assert (= (and b!899125 res!607462) b!899126))

(assert (= (and b!899126 res!607459) b!899127))

(declare-fun m!835601 () Bool)

(assert (=> b!899126 m!835601))

(assert (=> b!899125 m!835601))

(assert (=> d!111415 m!835373))

(assert (=> d!111371 d!111415))

(declare-fun b!899152 () Bool)

(declare-fun e!503063 () Bool)

(declare-fun lt!406039 () ListLongMap!10735)

(declare-fun isEmpty!687 (ListLongMap!10735) Bool)

(assert (=> b!899152 (= e!503063 (isEmpty!687 lt!406039))))

(declare-fun b!899153 () Bool)

(declare-fun e!503061 () ListLongMap!10735)

(declare-fun call!39922 () ListLongMap!10735)

(assert (=> b!899153 (= e!503061 call!39922)))

(declare-fun b!899154 () Bool)

(declare-fun e!503065 () Bool)

(declare-fun e!503059 () Bool)

(assert (=> b!899154 (= e!503065 e!503059)))

(declare-fun c!95101 () Bool)

(declare-fun e!503062 () Bool)

(assert (=> b!899154 (= c!95101 e!503062)))

(declare-fun res!607471 () Bool)

(assert (=> b!899154 (=> (not res!607471) (not e!503062))))

(assert (=> b!899154 (= res!607471 (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun b!899155 () Bool)

(assert (=> b!899155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(assert (=> b!899155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25804 (_values!5429 thiss!1181))))))

(declare-fun e!503060 () Bool)

(assert (=> b!899155 (= e!503060 (= (apply!411 lt!406039 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)) (get!13328 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!899156 () Bool)

(declare-fun e!503064 () ListLongMap!10735)

(assert (=> b!899156 (= e!503064 e!503061)))

(declare-fun c!95099 () Bool)

(assert (=> b!899156 (= c!95099 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899157 () Bool)

(assert (=> b!899157 (= e!503059 e!503060)))

(assert (=> b!899157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun res!607474 () Bool)

(assert (=> b!899157 (= res!607474 (contains!4414 lt!406039 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899157 (=> (not res!607474) (not e!503060))))

(declare-fun b!899158 () Bool)

(declare-fun lt!406038 () Unit!30548)

(declare-fun lt!406036 () Unit!30548)

(assert (=> b!899158 (= lt!406038 lt!406036)))

(declare-fun lt!406041 () ListLongMap!10735)

(declare-fun lt!406040 () (_ BitVec 64))

(declare-fun lt!406037 () (_ BitVec 64))

(declare-fun lt!406035 () V!29433)

(assert (=> b!899158 (not (contains!4414 (+!2592 lt!406041 (tuple2!12039 lt!406037 lt!406035)) lt!406040))))

(declare-fun addStillNotContains!215 (ListLongMap!10735 (_ BitVec 64) V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> b!899158 (= lt!406036 (addStillNotContains!215 lt!406041 lt!406037 lt!406035 lt!406040))))

(assert (=> b!899158 (= lt!406040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!899158 (= lt!406035 (get!13328 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!899158 (= lt!406037 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899158 (= lt!406041 call!39922)))

(assert (=> b!899158 (= e!503061 (+!2592 call!39922 (tuple2!12039 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000) (get!13328 (select (arr!25348 (_values!5429 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5420 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!899159 () Bool)

(assert (=> b!899159 (= e!503062 (validKeyInArray!0 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899159 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!899161 () Bool)

(assert (=> b!899161 (= e!503064 (ListLongMap!10736 Nil!17840))))

(declare-fun b!899162 () Bool)

(assert (=> b!899162 (= e!503063 (= lt!406039 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5420 thiss!1181))))))

(declare-fun b!899163 () Bool)

(assert (=> b!899163 (= e!503059 e!503063)))

(declare-fun c!95100 () Bool)

(assert (=> b!899163 (= c!95100 (bvslt #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun bm!39919 () Bool)

(assert (=> bm!39919 (= call!39922 (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5420 thiss!1181)))))

(declare-fun d!111417 () Bool)

(assert (=> d!111417 e!503065))

(declare-fun res!607472 () Bool)

(assert (=> d!111417 (=> (not res!607472) (not e!503065))))

(assert (=> d!111417 (= res!607472 (not (contains!4414 lt!406039 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111417 (= lt!406039 e!503064)))

(declare-fun c!95102 () Bool)

(assert (=> d!111417 (= c!95102 (bvsge #b00000000000000000000000000000000 (size!25803 (_keys!10201 thiss!1181))))))

(assert (=> d!111417 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111417 (= (getCurrentListMapNoExtraKeys!3279 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)) lt!406039)))

(declare-fun b!899160 () Bool)

(declare-fun res!607473 () Bool)

(assert (=> b!899160 (=> (not res!607473) (not e!503065))))

(assert (=> b!899160 (= res!607473 (not (contains!4414 lt!406039 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111417 c!95102) b!899161))

(assert (= (and d!111417 (not c!95102)) b!899156))

(assert (= (and b!899156 c!95099) b!899158))

(assert (= (and b!899156 (not c!95099)) b!899153))

(assert (= (or b!899158 b!899153) bm!39919))

(assert (= (and d!111417 res!607472) b!899160))

(assert (= (and b!899160 res!607473) b!899154))

(assert (= (and b!899154 res!607471) b!899159))

(assert (= (and b!899154 c!95101) b!899157))

(assert (= (and b!899154 (not c!95101)) b!899163))

(assert (= (and b!899157 res!607474) b!899155))

(assert (= (and b!899163 c!95100) b!899162))

(assert (= (and b!899163 (not c!95100)) b!899152))

(declare-fun b_lambda!12979 () Bool)

(assert (=> (not b_lambda!12979) (not b!899155)))

(assert (=> b!899155 t!25189))

(declare-fun b_and!26329 () Bool)

(assert (= b_and!26327 (and (=> t!25189 result!10157) b_and!26329)))

(declare-fun b_lambda!12981 () Bool)

(assert (=> (not b_lambda!12981) (not b!899158)))

(assert (=> b!899158 t!25189))

(declare-fun b_and!26331 () Bool)

(assert (= b_and!26329 (and (=> t!25189 result!10157) b_and!26331)))

(assert (=> b!899158 m!835425))

(assert (=> b!899158 m!835473))

(assert (=> b!899158 m!835475))

(declare-fun m!835603 () Bool)

(assert (=> b!899158 m!835603))

(declare-fun m!835605 () Bool)

(assert (=> b!899158 m!835605))

(declare-fun m!835607 () Bool)

(assert (=> b!899158 m!835607))

(declare-fun m!835609 () Bool)

(assert (=> b!899158 m!835609))

(assert (=> b!899158 m!835603))

(assert (=> b!899158 m!835473))

(assert (=> b!899158 m!835475))

(assert (=> b!899158 m!835479))

(declare-fun m!835611 () Bool)

(assert (=> b!899152 m!835611))

(assert (=> b!899159 m!835425))

(assert (=> b!899159 m!835425))

(assert (=> b!899159 m!835431))

(assert (=> b!899157 m!835425))

(assert (=> b!899157 m!835425))

(declare-fun m!835613 () Bool)

(assert (=> b!899157 m!835613))

(declare-fun m!835615 () Bool)

(assert (=> b!899160 m!835615))

(assert (=> b!899155 m!835425))

(assert (=> b!899155 m!835473))

(assert (=> b!899155 m!835475))

(assert (=> b!899155 m!835473))

(assert (=> b!899155 m!835475))

(assert (=> b!899155 m!835479))

(assert (=> b!899155 m!835425))

(declare-fun m!835617 () Bool)

(assert (=> b!899155 m!835617))

(declare-fun m!835619 () Bool)

(assert (=> d!111417 m!835619))

(assert (=> d!111417 m!835373))

(assert (=> b!899156 m!835425))

(assert (=> b!899156 m!835425))

(assert (=> b!899156 m!835431))

(declare-fun m!835621 () Bool)

(assert (=> b!899162 m!835621))

(assert (=> bm!39919 m!835621))

(assert (=> bm!39902 d!111417))

(declare-fun d!111419 () Bool)

(declare-fun res!607479 () Bool)

(declare-fun e!503070 () Bool)

(assert (=> d!111419 (=> res!607479 e!503070)))

(assert (=> d!111419 (= res!607479 (and ((_ is Cons!17839) (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))) (= (_1!6030 (h!18982 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))))))

(assert (=> d!111419 (= (containsKey!426 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))) e!503070)))

(declare-fun b!899168 () Bool)

(declare-fun e!503071 () Bool)

(assert (=> b!899168 (= e!503070 e!503071)))

(declare-fun res!607480 () Bool)

(assert (=> b!899168 (=> (not res!607480) (not e!503071))))

(assert (=> b!899168 (= res!607480 (and (or (not ((_ is Cons!17839) (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))))) (bvsle (_1!6030 (h!18982 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))) ((_ is Cons!17839) (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))) (bvslt (_1!6030 (h!18982 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181))))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855)))))))

(declare-fun b!899169 () Bool)

(assert (=> b!899169 (= e!503071 (containsKey!426 (t!25186 (toList!5383 (getCurrentListMap!2657 (_keys!10201 thiss!1181) (_values!5429 thiss!1181) (mask!26161 thiss!1181) (extraKeys!5138 thiss!1181) (zeroValue!5242 thiss!1181) (minValue!5242 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5420 thiss!1181)))) (select (arr!25347 (_keys!10201 thiss!1181)) (index!38084 lt!405855))))))

(assert (= (and d!111419 (not res!607479)) b!899168))

(assert (= (and b!899168 res!607480) b!899169))

(assert (=> b!899169 m!835367))

(declare-fun m!835623 () Bool)

(assert (=> b!899169 m!835623))

(assert (=> d!111355 d!111419))

(declare-fun b!899188 () Bool)

(declare-fun e!503083 () SeekEntryResult!8928)

(assert (=> b!899188 (= e!503083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26161 thiss!1181)) #b00000000000000000000000000000000 (mask!26161 thiss!1181)) key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)))))

(declare-fun b!899189 () Bool)

(declare-fun e!503084 () SeekEntryResult!8928)

(assert (=> b!899189 (= e!503084 (Intermediate!8928 true (toIndex!0 key!785 (mask!26161 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899190 () Bool)

(declare-fun lt!406047 () SeekEntryResult!8928)

(assert (=> b!899190 (and (bvsge (index!38085 lt!406047) #b00000000000000000000000000000000) (bvslt (index!38085 lt!406047) (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun e!503086 () Bool)

(assert (=> b!899190 (= e!503086 (= (select (arr!25347 (_keys!10201 thiss!1181)) (index!38085 lt!406047)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899191 () Bool)

(assert (=> b!899191 (and (bvsge (index!38085 lt!406047) #b00000000000000000000000000000000) (bvslt (index!38085 lt!406047) (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun res!607487 () Bool)

(assert (=> b!899191 (= res!607487 (= (select (arr!25347 (_keys!10201 thiss!1181)) (index!38085 lt!406047)) key!785))))

(assert (=> b!899191 (=> res!607487 e!503086)))

(declare-fun e!503082 () Bool)

(assert (=> b!899191 (= e!503082 e!503086)))

(declare-fun b!899192 () Bool)

(declare-fun e!503085 () Bool)

(assert (=> b!899192 (= e!503085 (bvsge (x!76601 lt!406047) #b01111111111111111111111111111110))))

(declare-fun d!111421 () Bool)

(assert (=> d!111421 e!503085))

(declare-fun c!95110 () Bool)

(assert (=> d!111421 (= c!95110 (and ((_ is Intermediate!8928) lt!406047) (undefined!9740 lt!406047)))))

(assert (=> d!111421 (= lt!406047 e!503084)))

(declare-fun c!95111 () Bool)

(assert (=> d!111421 (= c!95111 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!406046 () (_ BitVec 64))

(assert (=> d!111421 (= lt!406046 (select (arr!25347 (_keys!10201 thiss!1181)) (toIndex!0 key!785 (mask!26161 thiss!1181))))))

(assert (=> d!111421 (validMask!0 (mask!26161 thiss!1181))))

(assert (=> d!111421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26161 thiss!1181)) key!785 (_keys!10201 thiss!1181) (mask!26161 thiss!1181)) lt!406047)))

(declare-fun b!899193 () Bool)

(assert (=> b!899193 (= e!503084 e!503083)))

(declare-fun c!95109 () Bool)

(assert (=> b!899193 (= c!95109 (or (= lt!406046 key!785) (= (bvadd lt!406046 lt!406046) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899194 () Bool)

(assert (=> b!899194 (= e!503083 (Intermediate!8928 false (toIndex!0 key!785 (mask!26161 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899195 () Bool)

(assert (=> b!899195 (= e!503085 e!503082)))

(declare-fun res!607488 () Bool)

(assert (=> b!899195 (= res!607488 (and ((_ is Intermediate!8928) lt!406047) (not (undefined!9740 lt!406047)) (bvslt (x!76601 lt!406047) #b01111111111111111111111111111110) (bvsge (x!76601 lt!406047) #b00000000000000000000000000000000) (bvsge (x!76601 lt!406047) #b00000000000000000000000000000000)))))

(assert (=> b!899195 (=> (not res!607488) (not e!503082))))

(declare-fun b!899196 () Bool)

(assert (=> b!899196 (and (bvsge (index!38085 lt!406047) #b00000000000000000000000000000000) (bvslt (index!38085 lt!406047) (size!25803 (_keys!10201 thiss!1181))))))

(declare-fun res!607489 () Bool)

(assert (=> b!899196 (= res!607489 (= (select (arr!25347 (_keys!10201 thiss!1181)) (index!38085 lt!406047)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899196 (=> res!607489 e!503086)))

(assert (= (and d!111421 c!95111) b!899189))

(assert (= (and d!111421 (not c!95111)) b!899193))

(assert (= (and b!899193 c!95109) b!899194))

(assert (= (and b!899193 (not c!95109)) b!899188))

(assert (= (and d!111421 c!95110) b!899192))

(assert (= (and d!111421 (not c!95110)) b!899195))

(assert (= (and b!899195 res!607488) b!899191))

(assert (= (and b!899191 (not res!607487)) b!899196))

(assert (= (and b!899196 (not res!607489)) b!899190))

(assert (=> b!899188 m!835499))

(declare-fun m!835625 () Bool)

(assert (=> b!899188 m!835625))

(assert (=> b!899188 m!835625))

(declare-fun m!835627 () Bool)

(assert (=> b!899188 m!835627))

(declare-fun m!835629 () Bool)

(assert (=> b!899190 m!835629))

(assert (=> b!899191 m!835629))

(assert (=> d!111421 m!835499))

(declare-fun m!835631 () Bool)

(assert (=> d!111421 m!835631))

(assert (=> d!111421 m!835373))

(assert (=> b!899196 m!835629))

(assert (=> d!111369 d!111421))

(declare-fun d!111423 () Bool)

(declare-fun lt!406053 () (_ BitVec 32))

(declare-fun lt!406052 () (_ BitVec 32))

(assert (=> d!111423 (= lt!406053 (bvmul (bvxor lt!406052 (bvlshr lt!406052 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111423 (= lt!406052 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111423 (and (bvsge (mask!26161 thiss!1181) #b00000000000000000000000000000000) (let ((res!607490 (let ((h!18985 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76620 (bvmul (bvxor h!18985 (bvlshr h!18985 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76620 (bvlshr x!76620 #b00000000000000000000000000001101)) (mask!26161 thiss!1181)))))) (and (bvslt res!607490 (bvadd (mask!26161 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607490 #b00000000000000000000000000000000))))))

(assert (=> d!111423 (= (toIndex!0 key!785 (mask!26161 thiss!1181)) (bvand (bvxor lt!406053 (bvlshr lt!406053 #b00000000000000000000000000001101)) (mask!26161 thiss!1181)))))

(assert (=> d!111369 d!111423))

(assert (=> d!111369 d!111353))

(declare-fun d!111425 () Bool)

(assert (=> d!111425 (= (apply!411 (+!2592 lt!405941 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))) lt!405939) (apply!411 lt!405941 lt!405939))))

(declare-fun lt!406056 () Unit!30548)

(declare-fun choose!1498 (ListLongMap!10735 (_ BitVec 64) V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> d!111425 (= lt!406056 (choose!1498 lt!405941 lt!405930 (zeroValue!5242 thiss!1181) lt!405939))))

(declare-fun e!503089 () Bool)

(assert (=> d!111425 e!503089))

(declare-fun res!607493 () Bool)

(assert (=> d!111425 (=> (not res!607493) (not e!503089))))

(assert (=> d!111425 (= res!607493 (contains!4414 lt!405941 lt!405939))))

(assert (=> d!111425 (= (addApplyDifferent!333 lt!405941 lt!405930 (zeroValue!5242 thiss!1181) lt!405939) lt!406056)))

(declare-fun b!899200 () Bool)

(assert (=> b!899200 (= e!503089 (not (= lt!405939 lt!405930)))))

(assert (= (and d!111425 res!607493) b!899200))

(assert (=> d!111425 m!835435))

(assert (=> d!111425 m!835437))

(assert (=> d!111425 m!835441))

(declare-fun m!835633 () Bool)

(assert (=> d!111425 m!835633))

(assert (=> d!111425 m!835435))

(declare-fun m!835635 () Bool)

(assert (=> d!111425 m!835635))

(assert (=> b!898975 d!111425))

(declare-fun d!111427 () Bool)

(declare-fun e!503090 () Bool)

(assert (=> d!111427 e!503090))

(declare-fun res!607495 () Bool)

(assert (=> d!111427 (=> (not res!607495) (not e!503090))))

(declare-fun lt!406057 () ListLongMap!10735)

(assert (=> d!111427 (= res!607495 (contains!4414 lt!406057 (_1!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))))))

(declare-fun lt!406058 () List!17843)

(assert (=> d!111427 (= lt!406057 (ListLongMap!10736 lt!406058))))

(declare-fun lt!406059 () Unit!30548)

(declare-fun lt!406060 () Unit!30548)

(assert (=> d!111427 (= lt!406059 lt!406060)))

(assert (=> d!111427 (= (getValueByKey!457 lt!406058 (_1!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))))))

(assert (=> d!111427 (= lt!406060 (lemmaContainsTupThenGetReturnValue!249 lt!406058 (_1!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))))))

(assert (=> d!111427 (= lt!406058 (insertStrictlySorted!306 (toList!5383 lt!405932) (_1!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))))))

(assert (=> d!111427 (= (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))) lt!406057)))

(declare-fun b!899201 () Bool)

(declare-fun res!607494 () Bool)

(assert (=> b!899201 (=> (not res!607494) (not e!503090))))

(assert (=> b!899201 (= res!607494 (= (getValueByKey!457 (toList!5383 lt!406057) (_1!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))))))))

(declare-fun b!899202 () Bool)

(assert (=> b!899202 (= e!503090 (contains!4416 (toList!5383 lt!406057) (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))))))

(assert (= (and d!111427 res!607495) b!899201))

(assert (= (and b!899201 res!607494) b!899202))

(declare-fun m!835637 () Bool)

(assert (=> d!111427 m!835637))

(declare-fun m!835639 () Bool)

(assert (=> d!111427 m!835639))

(declare-fun m!835641 () Bool)

(assert (=> d!111427 m!835641))

(declare-fun m!835643 () Bool)

(assert (=> d!111427 m!835643))

(declare-fun m!835645 () Bool)

(assert (=> b!899201 m!835645))

(declare-fun m!835647 () Bool)

(assert (=> b!899202 m!835647))

(assert (=> b!898975 d!111427))

(declare-fun d!111429 () Bool)

(declare-fun e!503091 () Bool)

(assert (=> d!111429 e!503091))

(declare-fun res!607497 () Bool)

(assert (=> d!111429 (=> (not res!607497) (not e!503091))))

(declare-fun lt!406061 () ListLongMap!10735)

(assert (=> d!111429 (= res!607497 (contains!4414 lt!406061 (_1!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))))))

(declare-fun lt!406062 () List!17843)

(assert (=> d!111429 (= lt!406061 (ListLongMap!10736 lt!406062))))

(declare-fun lt!406063 () Unit!30548)

(declare-fun lt!406064 () Unit!30548)

(assert (=> d!111429 (= lt!406063 lt!406064)))

(assert (=> d!111429 (= (getValueByKey!457 lt!406062 (_1!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))))))

(assert (=> d!111429 (= lt!406064 (lemmaContainsTupThenGetReturnValue!249 lt!406062 (_1!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))))))

(assert (=> d!111429 (= lt!406062 (insertStrictlySorted!306 (toList!5383 lt!405933) (_1!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))))))

(assert (=> d!111429 (= (+!2592 lt!405933 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))) lt!406061)))

(declare-fun b!899203 () Bool)

(declare-fun res!607496 () Bool)

(assert (=> b!899203 (=> (not res!607496) (not e!503091))))

(assert (=> b!899203 (= res!607496 (= (getValueByKey!457 (toList!5383 lt!406061) (_1!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))))))))

(declare-fun b!899204 () Bool)

(assert (=> b!899204 (= e!503091 (contains!4416 (toList!5383 lt!406061) (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))))))

(assert (= (and d!111429 res!607497) b!899203))

(assert (= (and b!899203 res!607496) b!899204))

(declare-fun m!835649 () Bool)

(assert (=> d!111429 m!835649))

(declare-fun m!835651 () Bool)

(assert (=> d!111429 m!835651))

(declare-fun m!835653 () Bool)

(assert (=> d!111429 m!835653))

(declare-fun m!835655 () Bool)

(assert (=> d!111429 m!835655))

(declare-fun m!835657 () Bool)

(assert (=> b!899203 m!835657))

(declare-fun m!835659 () Bool)

(assert (=> b!899204 m!835659))

(assert (=> b!898975 d!111429))

(declare-fun d!111431 () Bool)

(assert (=> d!111431 (contains!4414 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))) lt!405944)))

(declare-fun lt!406067 () Unit!30548)

(declare-fun choose!1499 (ListLongMap!10735 (_ BitVec 64) V!29433 (_ BitVec 64)) Unit!30548)

(assert (=> d!111431 (= lt!406067 (choose!1499 lt!405932 lt!405935 (zeroValue!5242 thiss!1181) lt!405944))))

(assert (=> d!111431 (contains!4414 lt!405932 lt!405944)))

(assert (=> d!111431 (= (addStillContains!333 lt!405932 lt!405935 (zeroValue!5242 thiss!1181) lt!405944) lt!406067)))

(declare-fun bs!25238 () Bool)

(assert (= bs!25238 d!111431))

(assert (=> bs!25238 m!835443))

(assert (=> bs!25238 m!835443))

(assert (=> bs!25238 m!835445))

(declare-fun m!835661 () Bool)

(assert (=> bs!25238 m!835661))

(declare-fun m!835663 () Bool)

(assert (=> bs!25238 m!835663))

(assert (=> b!898975 d!111431))

(declare-fun d!111433 () Bool)

(assert (=> d!111433 (= (apply!411 (+!2592 lt!405942 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))) lt!405931) (get!13329 (getValueByKey!457 (toList!5383 (+!2592 lt!405942 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))) lt!405931)))))

(declare-fun bs!25239 () Bool)

(assert (= bs!25239 d!111433))

(declare-fun m!835665 () Bool)

(assert (=> bs!25239 m!835665))

(assert (=> bs!25239 m!835665))

(declare-fun m!835667 () Bool)

(assert (=> bs!25239 m!835667))

(assert (=> b!898975 d!111433))

(assert (=> b!898975 d!111417))

(declare-fun d!111435 () Bool)

(declare-fun e!503092 () Bool)

(assert (=> d!111435 e!503092))

(declare-fun res!607499 () Bool)

(assert (=> d!111435 (=> (not res!607499) (not e!503092))))

(declare-fun lt!406068 () ListLongMap!10735)

(assert (=> d!111435 (= res!607499 (contains!4414 lt!406068 (_1!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))))))

(declare-fun lt!406069 () List!17843)

(assert (=> d!111435 (= lt!406068 (ListLongMap!10736 lt!406069))))

(declare-fun lt!406070 () Unit!30548)

(declare-fun lt!406071 () Unit!30548)

(assert (=> d!111435 (= lt!406070 lt!406071)))

(assert (=> d!111435 (= (getValueByKey!457 lt!406069 (_1!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))))))

(assert (=> d!111435 (= lt!406071 (lemmaContainsTupThenGetReturnValue!249 lt!406069 (_1!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))))))

(assert (=> d!111435 (= lt!406069 (insertStrictlySorted!306 (toList!5383 lt!405941) (_1!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))))))

(assert (=> d!111435 (= (+!2592 lt!405941 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))) lt!406068)))

(declare-fun b!899206 () Bool)

(declare-fun res!607498 () Bool)

(assert (=> b!899206 (=> (not res!607498) (not e!503092))))

(assert (=> b!899206 (= res!607498 (= (getValueByKey!457 (toList!5383 lt!406068) (_1!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))))))))

(declare-fun b!899207 () Bool)

(assert (=> b!899207 (= e!503092 (contains!4416 (toList!5383 lt!406068) (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))))))

(assert (= (and d!111435 res!607499) b!899206))

(assert (= (and b!899206 res!607498) b!899207))

(declare-fun m!835669 () Bool)

(assert (=> d!111435 m!835669))

(declare-fun m!835671 () Bool)

(assert (=> d!111435 m!835671))

(declare-fun m!835673 () Bool)

(assert (=> d!111435 m!835673))

(declare-fun m!835675 () Bool)

(assert (=> d!111435 m!835675))

(declare-fun m!835677 () Bool)

(assert (=> b!899206 m!835677))

(declare-fun m!835679 () Bool)

(assert (=> b!899207 m!835679))

(assert (=> b!898975 d!111435))

(declare-fun d!111437 () Bool)

(declare-fun e!503093 () Bool)

(assert (=> d!111437 e!503093))

(declare-fun res!607501 () Bool)

(assert (=> d!111437 (=> (not res!607501) (not e!503093))))

(declare-fun lt!406072 () ListLongMap!10735)

(assert (=> d!111437 (= res!607501 (contains!4414 lt!406072 (_1!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))))))

(declare-fun lt!406073 () List!17843)

(assert (=> d!111437 (= lt!406072 (ListLongMap!10736 lt!406073))))

(declare-fun lt!406074 () Unit!30548)

(declare-fun lt!406075 () Unit!30548)

(assert (=> d!111437 (= lt!406074 lt!406075)))

(assert (=> d!111437 (= (getValueByKey!457 lt!406073 (_1!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))))))

(assert (=> d!111437 (= lt!406075 (lemmaContainsTupThenGetReturnValue!249 lt!406073 (_1!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))))))

(assert (=> d!111437 (= lt!406073 (insertStrictlySorted!306 (toList!5383 lt!405942) (_1!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))) (_2!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))))))

(assert (=> d!111437 (= (+!2592 lt!405942 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))) lt!406072)))

(declare-fun b!899208 () Bool)

(declare-fun res!607500 () Bool)

(assert (=> b!899208 (=> (not res!607500) (not e!503093))))

(assert (=> b!899208 (= res!607500 (= (getValueByKey!457 (toList!5383 lt!406072) (_1!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181)))) (Some!462 (_2!6030 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))))))))

(declare-fun b!899209 () Bool)

(assert (=> b!899209 (= e!503093 (contains!4416 (toList!5383 lt!406072) (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))))))

(assert (= (and d!111437 res!607501) b!899208))

(assert (= (and b!899208 res!607500) b!899209))

(declare-fun m!835681 () Bool)

(assert (=> d!111437 m!835681))

(declare-fun m!835683 () Bool)

(assert (=> d!111437 m!835683))

(declare-fun m!835685 () Bool)

(assert (=> d!111437 m!835685))

(declare-fun m!835687 () Bool)

(assert (=> d!111437 m!835687))

(declare-fun m!835689 () Bool)

(assert (=> b!899208 m!835689))

(declare-fun m!835691 () Bool)

(assert (=> b!899209 m!835691))

(assert (=> b!898975 d!111437))

(declare-fun d!111439 () Bool)

(assert (=> d!111439 (= (apply!411 lt!405933 lt!405946) (get!13329 (getValueByKey!457 (toList!5383 lt!405933) lt!405946)))))

(declare-fun bs!25240 () Bool)

(assert (= bs!25240 d!111439))

(declare-fun m!835693 () Bool)

(assert (=> bs!25240 m!835693))

(assert (=> bs!25240 m!835693))

(declare-fun m!835695 () Bool)

(assert (=> bs!25240 m!835695))

(assert (=> b!898975 d!111439))

(declare-fun d!111441 () Bool)

(assert (=> d!111441 (= (apply!411 (+!2592 lt!405933 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))) lt!405946) (apply!411 lt!405933 lt!405946))))

(declare-fun lt!406076 () Unit!30548)

(assert (=> d!111441 (= lt!406076 (choose!1498 lt!405933 lt!405943 (minValue!5242 thiss!1181) lt!405946))))

(declare-fun e!503094 () Bool)

(assert (=> d!111441 e!503094))

(declare-fun res!607502 () Bool)

(assert (=> d!111441 (=> (not res!607502) (not e!503094))))

(assert (=> d!111441 (= res!607502 (contains!4414 lt!405933 lt!405946))))

(assert (=> d!111441 (= (addApplyDifferent!333 lt!405933 lt!405943 (minValue!5242 thiss!1181) lt!405946) lt!406076)))

(declare-fun b!899210 () Bool)

(assert (=> b!899210 (= e!503094 (not (= lt!405946 lt!405943)))))

(assert (= (and d!111441 res!607502) b!899210))

(assert (=> d!111441 m!835453))

(assert (=> d!111441 m!835457))

(assert (=> d!111441 m!835459))

(declare-fun m!835697 () Bool)

(assert (=> d!111441 m!835697))

(assert (=> d!111441 m!835453))

(declare-fun m!835699 () Bool)

(assert (=> d!111441 m!835699))

(assert (=> b!898975 d!111441))

(declare-fun d!111443 () Bool)

(assert (=> d!111443 (= (apply!411 (+!2592 lt!405933 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181))) lt!405946) (get!13329 (getValueByKey!457 (toList!5383 (+!2592 lt!405933 (tuple2!12039 lt!405943 (minValue!5242 thiss!1181)))) lt!405946)))))

(declare-fun bs!25241 () Bool)

(assert (= bs!25241 d!111443))

(declare-fun m!835701 () Bool)

(assert (=> bs!25241 m!835701))

(assert (=> bs!25241 m!835701))

(declare-fun m!835703 () Bool)

(assert (=> bs!25241 m!835703))

(assert (=> b!898975 d!111443))

(declare-fun d!111445 () Bool)

(assert (=> d!111445 (= (apply!411 (+!2592 lt!405942 (tuple2!12039 lt!405927 (minValue!5242 thiss!1181))) lt!405931) (apply!411 lt!405942 lt!405931))))

(declare-fun lt!406077 () Unit!30548)

(assert (=> d!111445 (= lt!406077 (choose!1498 lt!405942 lt!405927 (minValue!5242 thiss!1181) lt!405931))))

(declare-fun e!503095 () Bool)

(assert (=> d!111445 e!503095))

(declare-fun res!607503 () Bool)

(assert (=> d!111445 (=> (not res!607503) (not e!503095))))

(assert (=> d!111445 (= res!607503 (contains!4414 lt!405942 lt!405931))))

(assert (=> d!111445 (= (addApplyDifferent!333 lt!405942 lt!405927 (minValue!5242 thiss!1181) lt!405931) lt!406077)))

(declare-fun b!899211 () Bool)

(assert (=> b!899211 (= e!503095 (not (= lt!405931 lt!405927)))))

(assert (= (and d!111445 res!607503) b!899211))

(assert (=> d!111445 m!835451))

(assert (=> d!111445 m!835463))

(assert (=> d!111445 m!835455))

(declare-fun m!835705 () Bool)

(assert (=> d!111445 m!835705))

(assert (=> d!111445 m!835451))

(declare-fun m!835707 () Bool)

(assert (=> d!111445 m!835707))

(assert (=> b!898975 d!111445))

(declare-fun d!111447 () Bool)

(declare-fun e!503096 () Bool)

(assert (=> d!111447 e!503096))

(declare-fun res!607504 () Bool)

(assert (=> d!111447 (=> res!607504 e!503096)))

(declare-fun lt!406081 () Bool)

(assert (=> d!111447 (= res!607504 (not lt!406081))))

(declare-fun lt!406078 () Bool)

(assert (=> d!111447 (= lt!406081 lt!406078)))

(declare-fun lt!406080 () Unit!30548)

(declare-fun e!503097 () Unit!30548)

(assert (=> d!111447 (= lt!406080 e!503097)))

(declare-fun c!95112 () Bool)

(assert (=> d!111447 (= c!95112 lt!406078)))

(assert (=> d!111447 (= lt!406078 (containsKey!426 (toList!5383 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))) lt!405944))))

(assert (=> d!111447 (= (contains!4414 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181))) lt!405944) lt!406081)))

(declare-fun b!899212 () Bool)

(declare-fun lt!406079 () Unit!30548)

(assert (=> b!899212 (= e!503097 lt!406079)))

(assert (=> b!899212 (= lt!406079 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5383 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))) lt!405944))))

(assert (=> b!899212 (isDefined!331 (getValueByKey!457 (toList!5383 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))) lt!405944))))

(declare-fun b!899213 () Bool)

(declare-fun Unit!30556 () Unit!30548)

(assert (=> b!899213 (= e!503097 Unit!30556)))

(declare-fun b!899214 () Bool)

(assert (=> b!899214 (= e!503096 (isDefined!331 (getValueByKey!457 (toList!5383 (+!2592 lt!405932 (tuple2!12039 lt!405935 (zeroValue!5242 thiss!1181)))) lt!405944)))))

(assert (= (and d!111447 c!95112) b!899212))

(assert (= (and d!111447 (not c!95112)) b!899213))

(assert (= (and d!111447 (not res!607504)) b!899214))

(declare-fun m!835709 () Bool)

(assert (=> d!111447 m!835709))

(declare-fun m!835711 () Bool)

(assert (=> b!899212 m!835711))

(declare-fun m!835713 () Bool)

(assert (=> b!899212 m!835713))

(assert (=> b!899212 m!835713))

(declare-fun m!835715 () Bool)

(assert (=> b!899212 m!835715))

(assert (=> b!899214 m!835713))

(assert (=> b!899214 m!835713))

(assert (=> b!899214 m!835715))

(assert (=> b!898975 d!111447))

(declare-fun d!111449 () Bool)

(assert (=> d!111449 (= (apply!411 lt!405941 lt!405939) (get!13329 (getValueByKey!457 (toList!5383 lt!405941) lt!405939)))))

(declare-fun bs!25242 () Bool)

(assert (= bs!25242 d!111449))

(declare-fun m!835717 () Bool)

(assert (=> bs!25242 m!835717))

(assert (=> bs!25242 m!835717))

(declare-fun m!835719 () Bool)

(assert (=> bs!25242 m!835719))

(assert (=> b!898975 d!111449))

(declare-fun d!111451 () Bool)

(assert (=> d!111451 (= (apply!411 (+!2592 lt!405941 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181))) lt!405939) (get!13329 (getValueByKey!457 (toList!5383 (+!2592 lt!405941 (tuple2!12039 lt!405930 (zeroValue!5242 thiss!1181)))) lt!405939)))))

(declare-fun bs!25243 () Bool)

(assert (= bs!25243 d!111451))

(declare-fun m!835721 () Bool)

(assert (=> bs!25243 m!835721))

(assert (=> bs!25243 m!835721))

(declare-fun m!835723 () Bool)

(assert (=> bs!25243 m!835723))

(assert (=> b!898975 d!111451))

(declare-fun d!111453 () Bool)

(assert (=> d!111453 (= (apply!411 lt!405942 lt!405931) (get!13329 (getValueByKey!457 (toList!5383 lt!405942) lt!405931)))))

(declare-fun bs!25244 () Bool)

(assert (= bs!25244 d!111453))

(declare-fun m!835725 () Bool)

(assert (=> bs!25244 m!835725))

(assert (=> bs!25244 m!835725))

(declare-fun m!835727 () Bool)

(assert (=> bs!25244 m!835727))

(assert (=> b!898975 d!111453))

(declare-fun d!111455 () Bool)

(declare-fun e!503098 () Bool)

(assert (=> d!111455 e!503098))

(declare-fun res!607505 () Bool)

(assert (=> d!111455 (=> res!607505 e!503098)))

(declare-fun lt!406085 () Bool)

(assert (=> d!111455 (= res!607505 (not lt!406085))))

(declare-fun lt!406082 () Bool)

(assert (=> d!111455 (= lt!406085 lt!406082)))

(declare-fun lt!406084 () Unit!30548)

(declare-fun e!503099 () Unit!30548)

(assert (=> d!111455 (= lt!406084 e!503099)))

(declare-fun c!95113 () Bool)

(assert (=> d!111455 (= c!95113 lt!406082)))

(assert (=> d!111455 (= lt!406082 (containsKey!426 (toList!5383 lt!405947) (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111455 (= (contains!4414 lt!405947 (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)) lt!406085)))

(declare-fun b!899215 () Bool)

(declare-fun lt!406083 () Unit!30548)

(assert (=> b!899215 (= e!503099 lt!406083)))

(assert (=> b!899215 (= lt!406083 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5383 lt!405947) (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899215 (isDefined!331 (getValueByKey!457 (toList!5383 lt!405947) (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899216 () Bool)

(declare-fun Unit!30557 () Unit!30548)

(assert (=> b!899216 (= e!503099 Unit!30557)))

(declare-fun b!899217 () Bool)

(assert (=> b!899217 (= e!503098 (isDefined!331 (getValueByKey!457 (toList!5383 lt!405947) (select (arr!25347 (_keys!10201 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111455 c!95113) b!899215))

(assert (= (and d!111455 (not c!95113)) b!899216))

(assert (= (and d!111455 (not res!607505)) b!899217))

(assert (=> d!111455 m!835425))

(declare-fun m!835729 () Bool)

(assert (=> d!111455 m!835729))

(assert (=> b!899215 m!835425))

(declare-fun m!835731 () Bool)

(assert (=> b!899215 m!835731))

(assert (=> b!899215 m!835425))

(assert (=> b!899215 m!835583))

(assert (=> b!899215 m!835583))

(declare-fun m!835733 () Bool)

(assert (=> b!899215 m!835733))

(assert (=> b!899217 m!835425))

(assert (=> b!899217 m!835583))

(assert (=> b!899217 m!835583))

(assert (=> b!899217 m!835733))

(assert (=> b!898974 d!111455))

(declare-fun condMapEmpty!29192 () Bool)

(declare-fun mapDefault!29192 () ValueCell!8694)

(assert (=> mapNonEmpty!29191 (= condMapEmpty!29192 (= mapRest!29191 ((as const (Array (_ BitVec 32) ValueCell!8694)) mapDefault!29192)))))

(declare-fun e!503101 () Bool)

(declare-fun mapRes!29192 () Bool)

(assert (=> mapNonEmpty!29191 (= tp!56151 (and e!503101 mapRes!29192))))

(declare-fun b!899218 () Bool)

(declare-fun e!503100 () Bool)

(assert (=> b!899218 (= e!503100 tp_is_empty!18351)))

(declare-fun b!899219 () Bool)

(assert (=> b!899219 (= e!503101 tp_is_empty!18351)))

(declare-fun mapNonEmpty!29192 () Bool)

(declare-fun tp!56152 () Bool)

(assert (=> mapNonEmpty!29192 (= mapRes!29192 (and tp!56152 e!503100))))

(declare-fun mapRest!29192 () (Array (_ BitVec 32) ValueCell!8694))

(declare-fun mapValue!29192 () ValueCell!8694)

(declare-fun mapKey!29192 () (_ BitVec 32))

(assert (=> mapNonEmpty!29192 (= mapRest!29191 (store mapRest!29192 mapKey!29192 mapValue!29192))))

(declare-fun mapIsEmpty!29192 () Bool)

(assert (=> mapIsEmpty!29192 mapRes!29192))

(assert (= (and mapNonEmpty!29191 condMapEmpty!29192) mapIsEmpty!29192))

(assert (= (and mapNonEmpty!29191 (not condMapEmpty!29192)) mapNonEmpty!29192))

(assert (= (and mapNonEmpty!29192 ((_ is ValueCellFull!8694) mapValue!29192)) b!899218))

(assert (= (and mapNonEmpty!29191 ((_ is ValueCellFull!8694) mapDefault!29192)) b!899219))

(declare-fun m!835735 () Bool)

(assert (=> mapNonEmpty!29192 m!835735))

(declare-fun b_lambda!12983 () Bool)

(assert (= b_lambda!12981 (or (and b!898867 b_free!16023) b_lambda!12983)))

(declare-fun b_lambda!12985 () Bool)

(assert (= b_lambda!12979 (or (and b!898867 b_free!16023) b_lambda!12985)))

(check-sat (not d!111379) (not d!111387) (not d!111401) (not d!111415) (not bm!39919) (not bm!39913) (not b!899201) (not b!899100) (not b!899102) (not b!899081) (not b!899091) (not b_lambda!12977) (not b!899188) (not b!899026) (not b!899169) (not d!111437) (not d!111443) (not d!111375) (not b!899160) (not b_lambda!12985) (not mapNonEmpty!29192) (not b_lambda!12983) (not b!899021) (not d!111455) (not b!899207) (not d!111439) (not d!111377) (not d!111391) (not d!111373) (not b!899157) (not b!899082) (not d!111427) (not bm!39910) tp_is_empty!18351 (not d!111447) (not b!899027) (not b!899206) (not d!111389) (not b_next!16023) (not d!111407) (not d!111397) (not b!899214) (not d!111449) (not d!111441) (not d!111395) (not d!111393) (not bm!39916) (not b!899208) (not d!111431) (not b!899044) (not b!899212) (not b!899204) (not b!899040) (not b!899090) (not b!899041) (not d!111445) (not b!899126) (not d!111429) (not b!899203) b_and!26331 (not b!899112) (not b!899070) (not b!899152) (not d!111451) (not b!899162) (not b!899159) (not d!111399) (not b!899125) (not b!899045) (not d!111417) (not d!111435) (not b!899084) (not b!899217) (not d!111421) (not b!899209) (not b!899047) (not b!899155) (not b!899050) (not b!899215) (not b!899038) (not d!111425) (not b!899019) (not b!899158) (not b!899202) (not b!899156) (not b!899066) (not d!111453) (not d!111433))
(check-sat b_and!26331 (not b_next!16023))
