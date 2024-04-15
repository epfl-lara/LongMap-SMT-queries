; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24012 () Bool)

(assert start!24012)

(declare-fun b!251218 () Bool)

(declare-fun b_free!6637 () Bool)

(declare-fun b_next!6637 () Bool)

(assert (=> b!251218 (= b_free!6637 (not b_next!6637))))

(declare-fun tp!23183 () Bool)

(declare-fun b_and!13639 () Bool)

(assert (=> b!251218 (= tp!23183 b_and!13639)))

(declare-fun b!251199 () Bool)

(declare-fun e!162901 () Bool)

(declare-fun e!162900 () Bool)

(assert (=> b!251199 (= e!162901 e!162900)))

(declare-fun res!122973 () Bool)

(assert (=> b!251199 (=> (not res!122973) (not e!162900))))

(declare-datatypes ((SeekEntryResult!1125 0))(
  ( (MissingZero!1125 (index!6670 (_ BitVec 32))) (Found!1125 (index!6671 (_ BitVec 32))) (Intermediate!1125 (undefined!1937 Bool) (index!6672 (_ BitVec 32)) (x!24718 (_ BitVec 32))) (Undefined!1125) (MissingVacant!1125 (index!6673 (_ BitVec 32))) )
))
(declare-fun lt!125780 () SeekEntryResult!1125)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!251199 (= res!122973 (or (= lt!125780 (MissingZero!1125 index!297)) (= lt!125780 (MissingVacant!1125 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8313 0))(
  ( (V!8314 (val!3294 Int)) )
))
(declare-datatypes ((ValueCell!2906 0))(
  ( (ValueCellFull!2906 (v!5356 V!8313)) (EmptyCell!2906) )
))
(declare-datatypes ((array!12311 0))(
  ( (array!12312 (arr!5835 (Array (_ BitVec 32) ValueCell!2906)) (size!6182 (_ BitVec 32))) )
))
(declare-datatypes ((array!12313 0))(
  ( (array!12314 (arr!5836 (Array (_ BitVec 32) (_ BitVec 64))) (size!6183 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3712 0))(
  ( (LongMapFixedSize!3713 (defaultEntry!4645 Int) (mask!10845 (_ BitVec 32)) (extraKeys!4382 (_ BitVec 32)) (zeroValue!4486 V!8313) (minValue!4486 V!8313) (_size!1905 (_ BitVec 32)) (_keys!6786 array!12313) (_values!4628 array!12311) (_vacant!1905 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3712)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12313 (_ BitVec 32)) SeekEntryResult!1125)

(assert (=> b!251199 (= lt!125780 (seekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun mapNonEmpty!11048 () Bool)

(declare-fun mapRes!11048 () Bool)

(declare-fun tp!23182 () Bool)

(declare-fun e!162905 () Bool)

(assert (=> mapNonEmpty!11048 (= mapRes!11048 (and tp!23182 e!162905))))

(declare-fun mapValue!11048 () ValueCell!2906)

(declare-fun mapRest!11048 () (Array (_ BitVec 32) ValueCell!2906))

(declare-fun mapKey!11048 () (_ BitVec 32))

(assert (=> mapNonEmpty!11048 (= (arr!5835 (_values!4628 thiss!1504)) (store mapRest!11048 mapKey!11048 mapValue!11048))))

(declare-fun res!122977 () Bool)

(assert (=> start!24012 (=> (not res!122977) (not e!162901))))

(declare-fun valid!1454 (LongMapFixedSize!3712) Bool)

(assert (=> start!24012 (= res!122977 (valid!1454 thiss!1504))))

(assert (=> start!24012 e!162901))

(declare-fun e!162913 () Bool)

(assert (=> start!24012 e!162913))

(assert (=> start!24012 true))

(declare-fun b!251200 () Bool)

(declare-fun e!162907 () Bool)

(declare-fun call!23622 () Bool)

(assert (=> b!251200 (= e!162907 (not call!23622))))

(declare-fun b!251201 () Bool)

(declare-datatypes ((Unit!7753 0))(
  ( (Unit!7754) )
))
(declare-fun e!162912 () Unit!7753)

(declare-fun lt!125784 () Unit!7753)

(assert (=> b!251201 (= e!162912 lt!125784)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7753)

(assert (=> b!251201 (= lt!125784 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(declare-fun c!42267 () Bool)

(get-info :version)

(assert (=> b!251201 (= c!42267 ((_ is MissingZero!1125) lt!125780))))

(declare-fun e!162902 () Bool)

(assert (=> b!251201 e!162902))

(declare-fun b!251202 () Bool)

(declare-fun e!162910 () Bool)

(assert (=> b!251202 (= e!162910 ((_ is Undefined!1125) lt!125780))))

(declare-fun b!251203 () Bool)

(declare-fun res!122978 () Bool)

(assert (=> b!251203 (=> (not res!122978) (not e!162907))))

(assert (=> b!251203 (= res!122978 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6670 lt!125780)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251204 () Bool)

(declare-fun res!122972 () Bool)

(assert (=> b!251204 (= res!122972 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6673 lt!125780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162904 () Bool)

(assert (=> b!251204 (=> (not res!122972) (not e!162904))))

(declare-fun bm!23619 () Bool)

(declare-fun arrayContainsKey!0 (array!12313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23619 (= call!23622 (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251205 () Bool)

(declare-fun e!162908 () Unit!7753)

(declare-fun Unit!7755 () Unit!7753)

(assert (=> b!251205 (= e!162908 Unit!7755)))

(declare-fun lt!125782 () Unit!7753)

(declare-fun lemmaArrayContainsKeyThenInListMap!210 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) (_ BitVec 32) Int) Unit!7753)

(assert (=> b!251205 (= lt!125782 (lemmaArrayContainsKeyThenInListMap!210 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(assert (=> b!251205 false))

(declare-fun b!251206 () Bool)

(declare-fun Unit!7756 () Unit!7753)

(assert (=> b!251206 (= e!162912 Unit!7756)))

(declare-fun lt!125781 () Unit!7753)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7753)

(assert (=> b!251206 (= lt!125781 (lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> b!251206 false))

(declare-fun b!251207 () Bool)

(declare-fun e!162903 () Bool)

(declare-fun e!162899 () Bool)

(assert (=> b!251207 (= e!162903 (not e!162899))))

(declare-fun res!122974 () Bool)

(assert (=> b!251207 (=> res!122974 e!162899)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!251207 (= res!122974 (not (validMask!0 (mask!10845 thiss!1504))))))

(declare-fun lt!125787 () array!12313)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12313 (_ BitVec 32)) Bool)

(assert (=> b!251207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125787 (mask!10845 thiss!1504))))

(declare-fun lt!125779 () Unit!7753)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12313 (_ BitVec 32) (_ BitVec 32)) Unit!7753)

(assert (=> b!251207 (= lt!125779 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) index!297 (mask!10845 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12313 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251207 (= (arrayCountValidKeys!0 lt!125787 #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504)))))))

(declare-fun lt!125778 () Unit!7753)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12313 (_ BitVec 32) (_ BitVec 64)) Unit!7753)

(assert (=> b!251207 (= lt!125778 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6786 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3713 0))(
  ( (Nil!3710) (Cons!3709 (h!4370 (_ BitVec 64)) (t!8741 List!3713)) )
))
(declare-fun arrayNoDuplicates!0 (array!12313 (_ BitVec 32) List!3713) Bool)

(assert (=> b!251207 (arrayNoDuplicates!0 lt!125787 #b00000000000000000000000000000000 Nil!3710)))

(assert (=> b!251207 (= lt!125787 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun lt!125785 () Unit!7753)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3713) Unit!7753)

(assert (=> b!251207 (= lt!125785 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6786 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710))))

(declare-fun lt!125786 () Unit!7753)

(assert (=> b!251207 (= lt!125786 e!162908)))

(declare-fun c!42265 () Bool)

(assert (=> b!251207 (= c!42265 (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251208 () Bool)

(declare-fun c!42264 () Bool)

(assert (=> b!251208 (= c!42264 ((_ is MissingVacant!1125) lt!125780))))

(assert (=> b!251208 (= e!162902 e!162910)))

(declare-fun mapIsEmpty!11048 () Bool)

(assert (=> mapIsEmpty!11048 mapRes!11048))

(declare-fun b!251209 () Bool)

(declare-fun e!162909 () Bool)

(declare-fun e!162911 () Bool)

(assert (=> b!251209 (= e!162909 (and e!162911 mapRes!11048))))

(declare-fun condMapEmpty!11048 () Bool)

(declare-fun mapDefault!11048 () ValueCell!2906)

(assert (=> b!251209 (= condMapEmpty!11048 (= (arr!5835 (_values!4628 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2906)) mapDefault!11048)))))

(declare-fun b!251210 () Bool)

(declare-fun res!122971 () Bool)

(assert (=> b!251210 (=> (not res!122971) (not e!162907))))

(declare-fun call!23623 () Bool)

(assert (=> b!251210 (= res!122971 call!23623)))

(assert (=> b!251210 (= e!162902 e!162907)))

(declare-fun b!251211 () Bool)

(assert (=> b!251211 (= e!162899 (or (not (= (size!6182 (_values!4628 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10845 thiss!1504)))) (not (= (size!6183 (_keys!6786 thiss!1504)) (size!6182 (_values!4628 thiss!1504)))) (bvslt (mask!10845 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4382 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4382 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!251212 () Bool)

(declare-fun Unit!7757 () Unit!7753)

(assert (=> b!251212 (= e!162908 Unit!7757)))

(declare-fun b!251213 () Bool)

(assert (=> b!251213 (= e!162904 (not call!23622))))

(declare-fun bm!23620 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23620 (= call!23623 (inRange!0 (ite c!42267 (index!6670 lt!125780) (index!6673 lt!125780)) (mask!10845 thiss!1504)))))

(declare-fun b!251214 () Bool)

(declare-fun tp_is_empty!6499 () Bool)

(assert (=> b!251214 (= e!162911 tp_is_empty!6499)))

(declare-fun b!251215 () Bool)

(declare-fun res!122976 () Bool)

(assert (=> b!251215 (=> (not res!122976) (not e!162901))))

(assert (=> b!251215 (= res!122976 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251216 () Bool)

(assert (=> b!251216 (= e!162900 e!162903)))

(declare-fun res!122975 () Bool)

(assert (=> b!251216 (=> (not res!122975) (not e!162903))))

(assert (=> b!251216 (= res!122975 (inRange!0 index!297 (mask!10845 thiss!1504)))))

(declare-fun lt!125783 () Unit!7753)

(assert (=> b!251216 (= lt!125783 e!162912)))

(declare-fun c!42266 () Bool)

(declare-datatypes ((tuple2!4814 0))(
  ( (tuple2!4815 (_1!2418 (_ BitVec 64)) (_2!2418 V!8313)) )
))
(declare-datatypes ((List!3714 0))(
  ( (Nil!3711) (Cons!3710 (h!4371 tuple2!4814) (t!8742 List!3714)) )
))
(declare-datatypes ((ListLongMap!3717 0))(
  ( (ListLongMap!3718 (toList!1874 List!3714)) )
))
(declare-fun contains!1803 (ListLongMap!3717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1383 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 32) Int) ListLongMap!3717)

(assert (=> b!251216 (= c!42266 (contains!1803 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932))))

(declare-fun b!251217 () Bool)

(assert (=> b!251217 (= e!162910 e!162904)))

(declare-fun res!122970 () Bool)

(assert (=> b!251217 (= res!122970 call!23623)))

(assert (=> b!251217 (=> (not res!122970) (not e!162904))))

(declare-fun array_inv!3847 (array!12313) Bool)

(declare-fun array_inv!3848 (array!12311) Bool)

(assert (=> b!251218 (= e!162913 (and tp!23183 tp_is_empty!6499 (array_inv!3847 (_keys!6786 thiss!1504)) (array_inv!3848 (_values!4628 thiss!1504)) e!162909))))

(declare-fun b!251219 () Bool)

(assert (=> b!251219 (= e!162905 tp_is_empty!6499)))

(assert (= (and start!24012 res!122977) b!251215))

(assert (= (and b!251215 res!122976) b!251199))

(assert (= (and b!251199 res!122973) b!251216))

(assert (= (and b!251216 c!42266) b!251206))

(assert (= (and b!251216 (not c!42266)) b!251201))

(assert (= (and b!251201 c!42267) b!251210))

(assert (= (and b!251201 (not c!42267)) b!251208))

(assert (= (and b!251210 res!122971) b!251203))

(assert (= (and b!251203 res!122978) b!251200))

(assert (= (and b!251208 c!42264) b!251217))

(assert (= (and b!251208 (not c!42264)) b!251202))

(assert (= (and b!251217 res!122970) b!251204))

(assert (= (and b!251204 res!122972) b!251213))

(assert (= (or b!251210 b!251217) bm!23620))

(assert (= (or b!251200 b!251213) bm!23619))

(assert (= (and b!251216 res!122975) b!251207))

(assert (= (and b!251207 c!42265) b!251205))

(assert (= (and b!251207 (not c!42265)) b!251212))

(assert (= (and b!251207 (not res!122974)) b!251211))

(assert (= (and b!251209 condMapEmpty!11048) mapIsEmpty!11048))

(assert (= (and b!251209 (not condMapEmpty!11048)) mapNonEmpty!11048))

(assert (= (and mapNonEmpty!11048 ((_ is ValueCellFull!2906) mapValue!11048)) b!251219))

(assert (= (and b!251209 ((_ is ValueCellFull!2906) mapDefault!11048)) b!251214))

(assert (= b!251218 b!251209))

(assert (= start!24012 b!251218))

(declare-fun m!267031 () Bool)

(assert (=> b!251206 m!267031))

(declare-fun m!267033 () Bool)

(assert (=> start!24012 m!267033))

(declare-fun m!267035 () Bool)

(assert (=> b!251207 m!267035))

(declare-fun m!267037 () Bool)

(assert (=> b!251207 m!267037))

(declare-fun m!267039 () Bool)

(assert (=> b!251207 m!267039))

(declare-fun m!267041 () Bool)

(assert (=> b!251207 m!267041))

(declare-fun m!267043 () Bool)

(assert (=> b!251207 m!267043))

(declare-fun m!267045 () Bool)

(assert (=> b!251207 m!267045))

(declare-fun m!267047 () Bool)

(assert (=> b!251207 m!267047))

(declare-fun m!267049 () Bool)

(assert (=> b!251207 m!267049))

(declare-fun m!267051 () Bool)

(assert (=> b!251207 m!267051))

(declare-fun m!267053 () Bool)

(assert (=> b!251207 m!267053))

(declare-fun m!267055 () Bool)

(assert (=> mapNonEmpty!11048 m!267055))

(declare-fun m!267057 () Bool)

(assert (=> b!251199 m!267057))

(declare-fun m!267059 () Bool)

(assert (=> b!251218 m!267059))

(declare-fun m!267061 () Bool)

(assert (=> b!251218 m!267061))

(declare-fun m!267063 () Bool)

(assert (=> b!251216 m!267063))

(declare-fun m!267065 () Bool)

(assert (=> b!251216 m!267065))

(assert (=> b!251216 m!267065))

(declare-fun m!267067 () Bool)

(assert (=> b!251216 m!267067))

(declare-fun m!267069 () Bool)

(assert (=> bm!23620 m!267069))

(assert (=> bm!23619 m!267037))

(declare-fun m!267071 () Bool)

(assert (=> b!251205 m!267071))

(declare-fun m!267073 () Bool)

(assert (=> b!251204 m!267073))

(declare-fun m!267075 () Bool)

(assert (=> b!251203 m!267075))

(declare-fun m!267077 () Bool)

(assert (=> b!251201 m!267077))

(check-sat (not b!251218) b_and!13639 (not b_next!6637) tp_is_empty!6499 (not b!251201) (not start!24012) (not b!251206) (not mapNonEmpty!11048) (not b!251207) (not bm!23620) (not b!251205) (not bm!23619) (not b!251216) (not b!251199))
(check-sat b_and!13639 (not b_next!6637))
(get-model)

(declare-fun d!60985 () Bool)

(declare-fun res!123039 () Bool)

(declare-fun e!163006 () Bool)

(assert (=> d!60985 (=> (not res!123039) (not e!163006))))

(declare-fun simpleValid!265 (LongMapFixedSize!3712) Bool)

(assert (=> d!60985 (= res!123039 (simpleValid!265 thiss!1504))))

(assert (=> d!60985 (= (valid!1454 thiss!1504) e!163006)))

(declare-fun b!251352 () Bool)

(declare-fun res!123040 () Bool)

(assert (=> b!251352 (=> (not res!123040) (not e!163006))))

(assert (=> b!251352 (= res!123040 (= (arrayCountValidKeys!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (_size!1905 thiss!1504)))))

(declare-fun b!251353 () Bool)

(declare-fun res!123041 () Bool)

(assert (=> b!251353 (=> (not res!123041) (not e!163006))))

(assert (=> b!251353 (= res!123041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun b!251354 () Bool)

(assert (=> b!251354 (= e!163006 (arrayNoDuplicates!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 Nil!3710))))

(assert (= (and d!60985 res!123039) b!251352))

(assert (= (and b!251352 res!123040) b!251353))

(assert (= (and b!251353 res!123041) b!251354))

(declare-fun m!267175 () Bool)

(assert (=> d!60985 m!267175))

(assert (=> b!251352 m!267047))

(declare-fun m!267177 () Bool)

(assert (=> b!251353 m!267177))

(declare-fun m!267179 () Bool)

(assert (=> b!251354 m!267179))

(assert (=> start!24012 d!60985))

(declare-fun d!60987 () Bool)

(assert (=> d!60987 (contains!1803 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932)))

(declare-fun lt!125850 () Unit!7753)

(declare-fun choose!1201 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) (_ BitVec 32) Int) Unit!7753)

(assert (=> d!60987 (= lt!125850 (choose!1201 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(assert (=> d!60987 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!60987 (= (lemmaArrayContainsKeyThenInListMap!210 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) lt!125850)))

(declare-fun bs!8982 () Bool)

(assert (= bs!8982 d!60987))

(assert (=> bs!8982 m!267065))

(assert (=> bs!8982 m!267065))

(assert (=> bs!8982 m!267067))

(declare-fun m!267181 () Bool)

(assert (=> bs!8982 m!267181))

(assert (=> bs!8982 m!267035))

(assert (=> b!251205 d!60987))

(declare-fun d!60989 () Bool)

(assert (=> d!60989 (= (inRange!0 (ite c!42267 (index!6670 lt!125780) (index!6673 lt!125780)) (mask!10845 thiss!1504)) (and (bvsge (ite c!42267 (index!6670 lt!125780) (index!6673 lt!125780)) #b00000000000000000000000000000000) (bvslt (ite c!42267 (index!6670 lt!125780) (index!6673 lt!125780)) (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23620 d!60989))

(declare-fun d!60991 () Bool)

(assert (=> d!60991 (= (array_inv!3847 (_keys!6786 thiss!1504)) (bvsge (size!6183 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251218 d!60991))

(declare-fun d!60993 () Bool)

(assert (=> d!60993 (= (array_inv!3848 (_values!4628 thiss!1504)) (bvsge (size!6182 (_values!4628 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251218 d!60993))

(declare-fun d!60995 () Bool)

(declare-fun res!123046 () Bool)

(declare-fun e!163011 () Bool)

(assert (=> d!60995 (=> res!123046 e!163011)))

(assert (=> d!60995 (= res!123046 (= (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60995 (= (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 #b00000000000000000000000000000000) e!163011)))

(declare-fun b!251359 () Bool)

(declare-fun e!163012 () Bool)

(assert (=> b!251359 (= e!163011 e!163012)))

(declare-fun res!123047 () Bool)

(assert (=> b!251359 (=> (not res!123047) (not e!163012))))

(assert (=> b!251359 (= res!123047 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251360 () Bool)

(assert (=> b!251360 (= e!163012 (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60995 (not res!123046)) b!251359))

(assert (= (and b!251359 res!123047) b!251360))

(declare-fun m!267183 () Bool)

(assert (=> d!60995 m!267183))

(declare-fun m!267185 () Bool)

(assert (=> b!251360 m!267185))

(assert (=> bm!23619 d!60995))

(declare-fun d!60997 () Bool)

(declare-fun e!163015 () Bool)

(assert (=> d!60997 e!163015))

(declare-fun res!123053 () Bool)

(assert (=> d!60997 (=> (not res!123053) (not e!163015))))

(declare-fun lt!125856 () SeekEntryResult!1125)

(assert (=> d!60997 (= res!123053 ((_ is Found!1125) lt!125856))))

(assert (=> d!60997 (= lt!125856 (seekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun lt!125855 () Unit!7753)

(declare-fun choose!1202 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7753)

(assert (=> d!60997 (= lt!125855 (choose!1202 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> d!60997 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!60997 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) lt!125855)))

(declare-fun b!251365 () Bool)

(declare-fun res!123052 () Bool)

(assert (=> b!251365 (=> (not res!123052) (not e!163015))))

(assert (=> b!251365 (= res!123052 (inRange!0 (index!6671 lt!125856) (mask!10845 thiss!1504)))))

(declare-fun b!251366 () Bool)

(assert (=> b!251366 (= e!163015 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6671 lt!125856)) key!932))))

(assert (=> b!251366 (and (bvsge (index!6671 lt!125856) #b00000000000000000000000000000000) (bvslt (index!6671 lt!125856) (size!6183 (_keys!6786 thiss!1504))))))

(assert (= (and d!60997 res!123053) b!251365))

(assert (= (and b!251365 res!123052) b!251366))

(assert (=> d!60997 m!267057))

(declare-fun m!267187 () Bool)

(assert (=> d!60997 m!267187))

(assert (=> d!60997 m!267035))

(declare-fun m!267189 () Bool)

(assert (=> b!251365 m!267189))

(declare-fun m!267191 () Bool)

(assert (=> b!251366 m!267191))

(assert (=> b!251206 d!60997))

(declare-fun b!251383 () Bool)

(declare-fun e!163027 () Bool)

(declare-fun e!163024 () Bool)

(assert (=> b!251383 (= e!163027 e!163024)))

(declare-fun res!123062 () Bool)

(declare-fun call!23641 () Bool)

(assert (=> b!251383 (= res!123062 call!23641)))

(assert (=> b!251383 (=> (not res!123062) (not e!163024))))

(declare-fun b!251384 () Bool)

(declare-fun res!123065 () Bool)

(declare-fun e!163026 () Bool)

(assert (=> b!251384 (=> (not res!123065) (not e!163026))))

(assert (=> b!251384 (= res!123065 call!23641)))

(declare-fun e!163025 () Bool)

(assert (=> b!251384 (= e!163025 e!163026)))

(declare-fun b!251385 () Bool)

(declare-fun res!123063 () Bool)

(assert (=> b!251385 (=> (not res!123063) (not e!163026))))

(declare-fun lt!125862 () SeekEntryResult!1125)

(assert (=> b!251385 (= res!123063 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6673 lt!125862)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251385 (and (bvsge (index!6673 lt!125862) #b00000000000000000000000000000000) (bvslt (index!6673 lt!125862) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun c!42296 () Bool)

(declare-fun bm!23637 () Bool)

(assert (=> bm!23637 (= call!23641 (inRange!0 (ite c!42296 (index!6670 lt!125862) (index!6673 lt!125862)) (mask!10845 thiss!1504)))))

(declare-fun b!251386 () Bool)

(declare-fun call!23640 () Bool)

(assert (=> b!251386 (= e!163024 (not call!23640))))

(declare-fun b!251387 () Bool)

(assert (=> b!251387 (= e!163027 e!163025)))

(declare-fun c!42297 () Bool)

(assert (=> b!251387 (= c!42297 ((_ is MissingVacant!1125) lt!125862))))

(declare-fun bm!23638 () Bool)

(assert (=> bm!23638 (= call!23640 (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!60999 () Bool)

(assert (=> d!60999 e!163027))

(assert (=> d!60999 (= c!42296 ((_ is MissingZero!1125) lt!125862))))

(assert (=> d!60999 (= lt!125862 (seekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun lt!125861 () Unit!7753)

(declare-fun choose!1203 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7753)

(assert (=> d!60999 (= lt!125861 (choose!1203 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> d!60999 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!60999 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) lt!125861)))

(declare-fun b!251388 () Bool)

(assert (=> b!251388 (and (bvsge (index!6670 lt!125862) #b00000000000000000000000000000000) (bvslt (index!6670 lt!125862) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun res!123064 () Bool)

(assert (=> b!251388 (= res!123064 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6670 lt!125862)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251388 (=> (not res!123064) (not e!163024))))

(declare-fun b!251389 () Bool)

(assert (=> b!251389 (= e!163025 ((_ is Undefined!1125) lt!125862))))

(declare-fun b!251390 () Bool)

(assert (=> b!251390 (= e!163026 (not call!23640))))

(assert (= (and d!60999 c!42296) b!251383))

(assert (= (and d!60999 (not c!42296)) b!251387))

(assert (= (and b!251383 res!123062) b!251388))

(assert (= (and b!251388 res!123064) b!251386))

(assert (= (and b!251387 c!42297) b!251384))

(assert (= (and b!251387 (not c!42297)) b!251389))

(assert (= (and b!251384 res!123065) b!251385))

(assert (= (and b!251385 res!123063) b!251390))

(assert (= (or b!251383 b!251384) bm!23637))

(assert (= (or b!251386 b!251390) bm!23638))

(assert (=> d!60999 m!267057))

(declare-fun m!267193 () Bool)

(assert (=> d!60999 m!267193))

(assert (=> d!60999 m!267035))

(declare-fun m!267195 () Bool)

(assert (=> bm!23637 m!267195))

(assert (=> bm!23638 m!267037))

(declare-fun m!267197 () Bool)

(assert (=> b!251388 m!267197))

(declare-fun m!267199 () Bool)

(assert (=> b!251385 m!267199))

(assert (=> b!251201 d!60999))

(declare-fun b!251403 () Bool)

(declare-fun e!163034 () SeekEntryResult!1125)

(declare-fun lt!125869 () SeekEntryResult!1125)

(assert (=> b!251403 (= e!163034 (MissingZero!1125 (index!6672 lt!125869)))))

(declare-fun b!251404 () Bool)

(declare-fun c!42304 () Bool)

(declare-fun lt!125870 () (_ BitVec 64))

(assert (=> b!251404 (= c!42304 (= lt!125870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163035 () SeekEntryResult!1125)

(assert (=> b!251404 (= e!163035 e!163034)))

(declare-fun d!61001 () Bool)

(declare-fun lt!125871 () SeekEntryResult!1125)

(assert (=> d!61001 (and (or ((_ is Undefined!1125) lt!125871) (not ((_ is Found!1125) lt!125871)) (and (bvsge (index!6671 lt!125871) #b00000000000000000000000000000000) (bvslt (index!6671 lt!125871) (size!6183 (_keys!6786 thiss!1504))))) (or ((_ is Undefined!1125) lt!125871) ((_ is Found!1125) lt!125871) (not ((_ is MissingZero!1125) lt!125871)) (and (bvsge (index!6670 lt!125871) #b00000000000000000000000000000000) (bvslt (index!6670 lt!125871) (size!6183 (_keys!6786 thiss!1504))))) (or ((_ is Undefined!1125) lt!125871) ((_ is Found!1125) lt!125871) ((_ is MissingZero!1125) lt!125871) (not ((_ is MissingVacant!1125) lt!125871)) (and (bvsge (index!6673 lt!125871) #b00000000000000000000000000000000) (bvslt (index!6673 lt!125871) (size!6183 (_keys!6786 thiss!1504))))) (or ((_ is Undefined!1125) lt!125871) (ite ((_ is Found!1125) lt!125871) (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6671 lt!125871)) key!932) (ite ((_ is MissingZero!1125) lt!125871) (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6670 lt!125871)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1125) lt!125871) (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6673 lt!125871)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!163036 () SeekEntryResult!1125)

(assert (=> d!61001 (= lt!125871 e!163036)))

(declare-fun c!42306 () Bool)

(assert (=> d!61001 (= c!42306 (and ((_ is Intermediate!1125) lt!125869) (undefined!1937 lt!125869)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12313 (_ BitVec 32)) SeekEntryResult!1125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61001 (= lt!125869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10845 thiss!1504)) key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(assert (=> d!61001 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61001 (= (seekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)) lt!125871)))

(declare-fun b!251405 () Bool)

(assert (=> b!251405 (= e!163035 (Found!1125 (index!6672 lt!125869)))))

(declare-fun b!251406 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12313 (_ BitVec 32)) SeekEntryResult!1125)

(assert (=> b!251406 (= e!163034 (seekKeyOrZeroReturnVacant!0 (x!24718 lt!125869) (index!6672 lt!125869) (index!6672 lt!125869) key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun b!251407 () Bool)

(assert (=> b!251407 (= e!163036 e!163035)))

(assert (=> b!251407 (= lt!125870 (select (arr!5836 (_keys!6786 thiss!1504)) (index!6672 lt!125869)))))

(declare-fun c!42305 () Bool)

(assert (=> b!251407 (= c!42305 (= lt!125870 key!932))))

(declare-fun b!251408 () Bool)

(assert (=> b!251408 (= e!163036 Undefined!1125)))

(assert (= (and d!61001 c!42306) b!251408))

(assert (= (and d!61001 (not c!42306)) b!251407))

(assert (= (and b!251407 c!42305) b!251405))

(assert (= (and b!251407 (not c!42305)) b!251404))

(assert (= (and b!251404 c!42304) b!251403))

(assert (= (and b!251404 (not c!42304)) b!251406))

(declare-fun m!267201 () Bool)

(assert (=> d!61001 m!267201))

(declare-fun m!267203 () Bool)

(assert (=> d!61001 m!267203))

(declare-fun m!267205 () Bool)

(assert (=> d!61001 m!267205))

(assert (=> d!61001 m!267035))

(declare-fun m!267207 () Bool)

(assert (=> d!61001 m!267207))

(assert (=> d!61001 m!267203))

(declare-fun m!267209 () Bool)

(assert (=> d!61001 m!267209))

(declare-fun m!267211 () Bool)

(assert (=> b!251406 m!267211))

(declare-fun m!267213 () Bool)

(assert (=> b!251407 m!267213))

(assert (=> b!251199 d!61001))

(declare-fun d!61003 () Bool)

(assert (=> d!61003 (= (inRange!0 index!297 (mask!10845 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251216 d!61003))

(declare-fun d!61005 () Bool)

(declare-fun e!163041 () Bool)

(assert (=> d!61005 e!163041))

(declare-fun res!123068 () Bool)

(assert (=> d!61005 (=> res!123068 e!163041)))

(declare-fun lt!125880 () Bool)

(assert (=> d!61005 (= res!123068 (not lt!125880))))

(declare-fun lt!125883 () Bool)

(assert (=> d!61005 (= lt!125880 lt!125883)))

(declare-fun lt!125881 () Unit!7753)

(declare-fun e!163042 () Unit!7753)

(assert (=> d!61005 (= lt!125881 e!163042)))

(declare-fun c!42309 () Bool)

(assert (=> d!61005 (= c!42309 lt!125883)))

(declare-fun containsKey!290 (List!3714 (_ BitVec 64)) Bool)

(assert (=> d!61005 (= lt!125883 (containsKey!290 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(assert (=> d!61005 (= (contains!1803 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932) lt!125880)))

(declare-fun b!251415 () Bool)

(declare-fun lt!125882 () Unit!7753)

(assert (=> b!251415 (= e!163042 lt!125882)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!239 (List!3714 (_ BitVec 64)) Unit!7753)

(assert (=> b!251415 (= lt!125882 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-datatypes ((Option!304 0))(
  ( (Some!303 (v!5359 V!8313)) (None!302) )
))
(declare-fun isDefined!240 (Option!304) Bool)

(declare-fun getValueByKey!298 (List!3714 (_ BitVec 64)) Option!304)

(assert (=> b!251415 (isDefined!240 (getValueByKey!298 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-fun b!251416 () Bool)

(declare-fun Unit!7767 () Unit!7753)

(assert (=> b!251416 (= e!163042 Unit!7767)))

(declare-fun b!251417 () Bool)

(assert (=> b!251417 (= e!163041 (isDefined!240 (getValueByKey!298 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932)))))

(assert (= (and d!61005 c!42309) b!251415))

(assert (= (and d!61005 (not c!42309)) b!251416))

(assert (= (and d!61005 (not res!123068)) b!251417))

(declare-fun m!267215 () Bool)

(assert (=> d!61005 m!267215))

(declare-fun m!267217 () Bool)

(assert (=> b!251415 m!267217))

(declare-fun m!267219 () Bool)

(assert (=> b!251415 m!267219))

(assert (=> b!251415 m!267219))

(declare-fun m!267221 () Bool)

(assert (=> b!251415 m!267221))

(assert (=> b!251417 m!267219))

(assert (=> b!251417 m!267219))

(assert (=> b!251417 m!267221))

(assert (=> b!251216 d!61005))

(declare-fun b!251460 () Bool)

(declare-fun e!163073 () Bool)

(declare-fun lt!125932 () ListLongMap!3717)

(declare-fun apply!242 (ListLongMap!3717 (_ BitVec 64)) V!8313)

(assert (=> b!251460 (= e!163073 (= (apply!242 lt!125932 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4486 thiss!1504)))))

(declare-fun bm!23653 () Bool)

(declare-fun call!23658 () Bool)

(assert (=> bm!23653 (= call!23658 (contains!1803 lt!125932 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23654 () Bool)

(declare-fun call!23660 () Bool)

(assert (=> bm!23654 (= call!23660 (contains!1803 lt!125932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23655 () Bool)

(declare-fun call!23656 () ListLongMap!3717)

(declare-fun call!23657 () ListLongMap!3717)

(declare-fun c!42323 () Bool)

(declare-fun call!23662 () ListLongMap!3717)

(declare-fun call!23659 () ListLongMap!3717)

(declare-fun c!42322 () Bool)

(declare-fun +!675 (ListLongMap!3717 tuple2!4814) ListLongMap!3717)

(assert (=> bm!23655 (= call!23657 (+!675 (ite c!42322 call!23662 (ite c!42323 call!23659 call!23656)) (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(declare-fun b!251461 () Bool)

(declare-fun e!163081 () Bool)

(assert (=> b!251461 (= e!163081 (= (apply!242 lt!125932 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4486 thiss!1504)))))

(declare-fun b!251462 () Bool)

(declare-fun e!163070 () ListLongMap!3717)

(declare-fun e!163071 () ListLongMap!3717)

(assert (=> b!251462 (= e!163070 e!163071)))

(assert (=> b!251462 (= c!42323 (and (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!61007 () Bool)

(declare-fun e!163069 () Bool)

(assert (=> d!61007 e!163069))

(declare-fun res!123094 () Bool)

(assert (=> d!61007 (=> (not res!123094) (not e!163069))))

(assert (=> d!61007 (= res!123094 (or (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))))

(declare-fun lt!125946 () ListLongMap!3717)

(assert (=> d!61007 (= lt!125932 lt!125946)))

(declare-fun lt!125935 () Unit!7753)

(declare-fun e!163079 () Unit!7753)

(assert (=> d!61007 (= lt!125935 e!163079)))

(declare-fun c!42327 () Bool)

(declare-fun e!163074 () Bool)

(assert (=> d!61007 (= c!42327 e!163074)))

(declare-fun res!123087 () Bool)

(assert (=> d!61007 (=> (not res!123087) (not e!163074))))

(assert (=> d!61007 (= res!123087 (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61007 (= lt!125946 e!163070)))

(assert (=> d!61007 (= c!42322 (and (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61007 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61007 (= (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) lt!125932)))

(declare-fun b!251463 () Bool)

(declare-fun e!163072 () Bool)

(assert (=> b!251463 (= e!163072 (not call!23660))))

(declare-fun b!251464 () Bool)

(declare-fun lt!125945 () Unit!7753)

(assert (=> b!251464 (= e!163079 lt!125945)))

(declare-fun lt!125944 () ListLongMap!3717)

(declare-fun getCurrentListMapNoExtraKeys!558 (array!12313 array!12311 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 32) Int) ListLongMap!3717)

(assert (=> b!251464 (= lt!125944 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!125943 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125936 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125936 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125949 () Unit!7753)

(declare-fun addStillContains!218 (ListLongMap!3717 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7753)

(assert (=> b!251464 (= lt!125949 (addStillContains!218 lt!125944 lt!125943 (zeroValue!4486 thiss!1504) lt!125936))))

(assert (=> b!251464 (contains!1803 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))) lt!125936)))

(declare-fun lt!125939 () Unit!7753)

(assert (=> b!251464 (= lt!125939 lt!125949)))

(declare-fun lt!125940 () ListLongMap!3717)

(assert (=> b!251464 (= lt!125940 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!125947 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125947 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125934 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125934 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125941 () Unit!7753)

(declare-fun addApplyDifferent!218 (ListLongMap!3717 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7753)

(assert (=> b!251464 (= lt!125941 (addApplyDifferent!218 lt!125940 lt!125947 (minValue!4486 thiss!1504) lt!125934))))

(assert (=> b!251464 (= (apply!242 (+!675 lt!125940 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))) lt!125934) (apply!242 lt!125940 lt!125934))))

(declare-fun lt!125942 () Unit!7753)

(assert (=> b!251464 (= lt!125942 lt!125941)))

(declare-fun lt!125928 () ListLongMap!3717)

(assert (=> b!251464 (= lt!125928 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!125933 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125937 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125937 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125929 () Unit!7753)

(assert (=> b!251464 (= lt!125929 (addApplyDifferent!218 lt!125928 lt!125933 (zeroValue!4486 thiss!1504) lt!125937))))

(assert (=> b!251464 (= (apply!242 (+!675 lt!125928 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))) lt!125937) (apply!242 lt!125928 lt!125937))))

(declare-fun lt!125938 () Unit!7753)

(assert (=> b!251464 (= lt!125938 lt!125929)))

(declare-fun lt!125948 () ListLongMap!3717)

(assert (=> b!251464 (= lt!125948 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!125930 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125930 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125931 () (_ BitVec 64))

(assert (=> b!251464 (= lt!125931 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251464 (= lt!125945 (addApplyDifferent!218 lt!125948 lt!125930 (minValue!4486 thiss!1504) lt!125931))))

(assert (=> b!251464 (= (apply!242 (+!675 lt!125948 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))) lt!125931) (apply!242 lt!125948 lt!125931))))

(declare-fun b!251465 () Bool)

(declare-fun e!163077 () ListLongMap!3717)

(assert (=> b!251465 (= e!163077 call!23656)))

(declare-fun b!251466 () Bool)

(declare-fun e!163075 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!251466 (= e!163075 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251467 () Bool)

(declare-fun call!23661 () ListLongMap!3717)

(assert (=> b!251467 (= e!163071 call!23661)))

(declare-fun b!251468 () Bool)

(declare-fun Unit!7768 () Unit!7753)

(assert (=> b!251468 (= e!163079 Unit!7768)))

(declare-fun b!251469 () Bool)

(assert (=> b!251469 (= e!163072 e!163081)))

(declare-fun res!123089 () Bool)

(assert (=> b!251469 (= res!123089 call!23660)))

(assert (=> b!251469 (=> (not res!123089) (not e!163081))))

(declare-fun b!251470 () Bool)

(assert (=> b!251470 (= e!163077 call!23661)))

(declare-fun b!251471 () Bool)

(declare-fun e!163080 () Bool)

(declare-fun e!163078 () Bool)

(assert (=> b!251471 (= e!163080 e!163078)))

(declare-fun res!123090 () Bool)

(assert (=> b!251471 (=> (not res!123090) (not e!163078))))

(assert (=> b!251471 (= res!123090 (contains!1803 lt!125932 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251472 () Bool)

(declare-fun c!42325 () Bool)

(assert (=> b!251472 (= c!42325 (and (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!251472 (= e!163071 e!163077)))

(declare-fun b!251473 () Bool)

(declare-fun res!123093 () Bool)

(assert (=> b!251473 (=> (not res!123093) (not e!163069))))

(assert (=> b!251473 (= res!123093 e!163072)))

(declare-fun c!42324 () Bool)

(assert (=> b!251473 (= c!42324 (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!251474 () Bool)

(assert (=> b!251474 (= e!163070 (+!675 call!23657 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))

(declare-fun bm!23656 () Bool)

(assert (=> bm!23656 (= call!23661 call!23657)))

(declare-fun bm!23657 () Bool)

(assert (=> bm!23657 (= call!23662 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun b!251475 () Bool)

(assert (=> b!251475 (= e!163074 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23658 () Bool)

(assert (=> bm!23658 (= call!23656 call!23659)))

(declare-fun b!251476 () Bool)

(declare-fun e!163076 () Bool)

(assert (=> b!251476 (= e!163076 (not call!23658))))

(declare-fun b!251477 () Bool)

(declare-fun get!3000 (ValueCell!2906 V!8313) V!8313)

(declare-fun dynLambda!576 (Int (_ BitVec 64)) V!8313)

(assert (=> b!251477 (= e!163078 (= (apply!242 lt!125932 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)) (get!3000 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_values!4628 thiss!1504))))))

(assert (=> b!251477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251478 () Bool)

(declare-fun res!123092 () Bool)

(assert (=> b!251478 (=> (not res!123092) (not e!163069))))

(assert (=> b!251478 (= res!123092 e!163080)))

(declare-fun res!123091 () Bool)

(assert (=> b!251478 (=> res!123091 e!163080)))

(assert (=> b!251478 (= res!123091 (not e!163075))))

(declare-fun res!123095 () Bool)

(assert (=> b!251478 (=> (not res!123095) (not e!163075))))

(assert (=> b!251478 (= res!123095 (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251479 () Bool)

(assert (=> b!251479 (= e!163076 e!163073)))

(declare-fun res!123088 () Bool)

(assert (=> b!251479 (= res!123088 call!23658)))

(assert (=> b!251479 (=> (not res!123088) (not e!163073))))

(declare-fun bm!23659 () Bool)

(assert (=> bm!23659 (= call!23659 call!23662)))

(declare-fun b!251480 () Bool)

(assert (=> b!251480 (= e!163069 e!163076)))

(declare-fun c!42326 () Bool)

(assert (=> b!251480 (= c!42326 (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61007 c!42322) b!251474))

(assert (= (and d!61007 (not c!42322)) b!251462))

(assert (= (and b!251462 c!42323) b!251467))

(assert (= (and b!251462 (not c!42323)) b!251472))

(assert (= (and b!251472 c!42325) b!251470))

(assert (= (and b!251472 (not c!42325)) b!251465))

(assert (= (or b!251470 b!251465) bm!23658))

(assert (= (or b!251467 bm!23658) bm!23659))

(assert (= (or b!251467 b!251470) bm!23656))

(assert (= (or b!251474 bm!23659) bm!23657))

(assert (= (or b!251474 bm!23656) bm!23655))

(assert (= (and d!61007 res!123087) b!251475))

(assert (= (and d!61007 c!42327) b!251464))

(assert (= (and d!61007 (not c!42327)) b!251468))

(assert (= (and d!61007 res!123094) b!251478))

(assert (= (and b!251478 res!123095) b!251466))

(assert (= (and b!251478 (not res!123091)) b!251471))

(assert (= (and b!251471 res!123090) b!251477))

(assert (= (and b!251478 res!123092) b!251473))

(assert (= (and b!251473 c!42324) b!251469))

(assert (= (and b!251473 (not c!42324)) b!251463))

(assert (= (and b!251469 res!123089) b!251461))

(assert (= (or b!251469 b!251463) bm!23654))

(assert (= (and b!251473 res!123093) b!251480))

(assert (= (and b!251480 c!42326) b!251479))

(assert (= (and b!251480 (not c!42326)) b!251476))

(assert (= (and b!251479 res!123088) b!251460))

(assert (= (or b!251479 b!251476) bm!23653))

(declare-fun b_lambda!8085 () Bool)

(assert (=> (not b_lambda!8085) (not b!251477)))

(declare-fun t!8747 () Bool)

(declare-fun tb!2989 () Bool)

(assert (=> (and b!251218 (= (defaultEntry!4645 thiss!1504) (defaultEntry!4645 thiss!1504)) t!8747) tb!2989))

(declare-fun result!5305 () Bool)

(assert (=> tb!2989 (= result!5305 tp_is_empty!6499)))

(assert (=> b!251477 t!8747))

(declare-fun b_and!13645 () Bool)

(assert (= b_and!13639 (and (=> t!8747 result!5305) b_and!13645)))

(declare-fun m!267223 () Bool)

(assert (=> b!251460 m!267223))

(assert (=> b!251466 m!267183))

(assert (=> b!251466 m!267183))

(declare-fun m!267225 () Bool)

(assert (=> b!251466 m!267225))

(declare-fun m!267227 () Bool)

(assert (=> b!251477 m!267227))

(assert (=> b!251477 m!267183))

(declare-fun m!267229 () Bool)

(assert (=> b!251477 m!267229))

(assert (=> b!251477 m!267183))

(declare-fun m!267231 () Bool)

(assert (=> b!251477 m!267231))

(assert (=> b!251477 m!267231))

(assert (=> b!251477 m!267227))

(declare-fun m!267233 () Bool)

(assert (=> b!251477 m!267233))

(assert (=> b!251471 m!267183))

(assert (=> b!251471 m!267183))

(declare-fun m!267235 () Bool)

(assert (=> b!251471 m!267235))

(declare-fun m!267237 () Bool)

(assert (=> b!251461 m!267237))

(declare-fun m!267239 () Bool)

(assert (=> bm!23655 m!267239))

(declare-fun m!267241 () Bool)

(assert (=> bm!23654 m!267241))

(assert (=> d!61007 m!267035))

(declare-fun m!267243 () Bool)

(assert (=> bm!23653 m!267243))

(declare-fun m!267245 () Bool)

(assert (=> b!251464 m!267245))

(declare-fun m!267247 () Bool)

(assert (=> b!251464 m!267247))

(declare-fun m!267249 () Bool)

(assert (=> b!251464 m!267249))

(declare-fun m!267251 () Bool)

(assert (=> b!251464 m!267251))

(declare-fun m!267253 () Bool)

(assert (=> b!251464 m!267253))

(declare-fun m!267255 () Bool)

(assert (=> b!251464 m!267255))

(declare-fun m!267257 () Bool)

(assert (=> b!251464 m!267257))

(declare-fun m!267259 () Bool)

(assert (=> b!251464 m!267259))

(assert (=> b!251464 m!267253))

(assert (=> b!251464 m!267183))

(declare-fun m!267261 () Bool)

(assert (=> b!251464 m!267261))

(declare-fun m!267263 () Bool)

(assert (=> b!251464 m!267263))

(declare-fun m!267265 () Bool)

(assert (=> b!251464 m!267265))

(assert (=> b!251464 m!267251))

(declare-fun m!267267 () Bool)

(assert (=> b!251464 m!267267))

(assert (=> b!251464 m!267245))

(declare-fun m!267269 () Bool)

(assert (=> b!251464 m!267269))

(declare-fun m!267271 () Bool)

(assert (=> b!251464 m!267271))

(declare-fun m!267273 () Bool)

(assert (=> b!251464 m!267273))

(assert (=> b!251464 m!267247))

(declare-fun m!267275 () Bool)

(assert (=> b!251464 m!267275))

(assert (=> bm!23657 m!267265))

(declare-fun m!267277 () Bool)

(assert (=> b!251474 m!267277))

(assert (=> b!251475 m!267183))

(assert (=> b!251475 m!267183))

(assert (=> b!251475 m!267225))

(assert (=> b!251216 d!61007))

(declare-fun b!251494 () Bool)

(declare-fun e!163086 () Bool)

(assert (=> b!251494 (= e!163086 (= (arrayCountValidKeys!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!251493 () Bool)

(declare-fun e!163087 () Bool)

(assert (=> b!251493 (= e!163087 (bvslt (size!6183 (_keys!6786 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!251492 () Bool)

(declare-fun res!123105 () Bool)

(assert (=> b!251492 (=> (not res!123105) (not e!163087))))

(assert (=> b!251492 (= res!123105 (validKeyInArray!0 key!932))))

(declare-fun b!251491 () Bool)

(declare-fun res!123104 () Bool)

(assert (=> b!251491 (=> (not res!123104) (not e!163087))))

(assert (=> b!251491 (= res!123104 (not (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) index!297))))))

(declare-fun d!61009 () Bool)

(assert (=> d!61009 e!163086))

(declare-fun res!123107 () Bool)

(assert (=> d!61009 (=> (not res!123107) (not e!163086))))

(assert (=> d!61009 (= res!123107 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6183 (_keys!6786 thiss!1504)))))))

(declare-fun lt!125952 () Unit!7753)

(declare-fun choose!1 (array!12313 (_ BitVec 32) (_ BitVec 64)) Unit!7753)

(assert (=> d!61009 (= lt!125952 (choose!1 (_keys!6786 thiss!1504) index!297 key!932))))

(assert (=> d!61009 e!163087))

(declare-fun res!123106 () Bool)

(assert (=> d!61009 (=> (not res!123106) (not e!163087))))

(assert (=> d!61009 (= res!123106 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6183 (_keys!6786 thiss!1504)))))))

(assert (=> d!61009 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6786 thiss!1504) index!297 key!932) lt!125952)))

(assert (= (and d!61009 res!123106) b!251491))

(assert (= (and b!251491 res!123104) b!251492))

(assert (= (and b!251492 res!123105) b!251493))

(assert (= (and d!61009 res!123107) b!251494))

(assert (=> b!251494 m!267045))

(declare-fun m!267279 () Bool)

(assert (=> b!251494 m!267279))

(assert (=> b!251494 m!267047))

(declare-fun m!267281 () Bool)

(assert (=> b!251492 m!267281))

(declare-fun m!267283 () Bool)

(assert (=> b!251491 m!267283))

(assert (=> b!251491 m!267283))

(declare-fun m!267285 () Bool)

(assert (=> b!251491 m!267285))

(declare-fun m!267287 () Bool)

(assert (=> d!61009 m!267287))

(assert (=> b!251207 d!61009))

(declare-fun d!61011 () Bool)

(declare-fun lt!125955 () (_ BitVec 32))

(assert (=> d!61011 (and (bvsge lt!125955 #b00000000000000000000000000000000) (bvsle lt!125955 (bvsub (size!6183 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!163093 () (_ BitVec 32))

(assert (=> d!61011 (= lt!125955 e!163093)))

(declare-fun c!42333 () Bool)

(assert (=> d!61011 (= c!42333 (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61011 (and (bvsle #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6183 (_keys!6786 thiss!1504)) (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61011 (= (arrayCountValidKeys!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) lt!125955)))

(declare-fun b!251503 () Bool)

(declare-fun e!163092 () (_ BitVec 32))

(declare-fun call!23665 () (_ BitVec 32))

(assert (=> b!251503 (= e!163092 (bvadd #b00000000000000000000000000000001 call!23665))))

(declare-fun bm!23662 () Bool)

(assert (=> bm!23662 (= call!23665 (arrayCountValidKeys!0 (_keys!6786 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251504 () Bool)

(assert (=> b!251504 (= e!163093 #b00000000000000000000000000000000)))

(declare-fun b!251505 () Bool)

(assert (=> b!251505 (= e!163093 e!163092)))

(declare-fun c!42332 () Bool)

(assert (=> b!251505 (= c!42332 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251506 () Bool)

(assert (=> b!251506 (= e!163092 call!23665)))

(assert (= (and d!61011 c!42333) b!251504))

(assert (= (and d!61011 (not c!42333)) b!251505))

(assert (= (and b!251505 c!42332) b!251503))

(assert (= (and b!251505 (not c!42332)) b!251506))

(assert (= (or b!251503 b!251506) bm!23662))

(declare-fun m!267289 () Bool)

(assert (=> bm!23662 m!267289))

(assert (=> b!251505 m!267183))

(assert (=> b!251505 m!267183))

(assert (=> b!251505 m!267225))

(assert (=> b!251207 d!61011))

(declare-fun d!61013 () Bool)

(assert (=> d!61013 (= (validMask!0 (mask!10845 thiss!1504)) (and (or (= (mask!10845 thiss!1504) #b00000000000000000000000000000111) (= (mask!10845 thiss!1504) #b00000000000000000000000000001111) (= (mask!10845 thiss!1504) #b00000000000000000000000000011111) (= (mask!10845 thiss!1504) #b00000000000000000000000000111111) (= (mask!10845 thiss!1504) #b00000000000000000000000001111111) (= (mask!10845 thiss!1504) #b00000000000000000000000011111111) (= (mask!10845 thiss!1504) #b00000000000000000000000111111111) (= (mask!10845 thiss!1504) #b00000000000000000000001111111111) (= (mask!10845 thiss!1504) #b00000000000000000000011111111111) (= (mask!10845 thiss!1504) #b00000000000000000000111111111111) (= (mask!10845 thiss!1504) #b00000000000000000001111111111111) (= (mask!10845 thiss!1504) #b00000000000000000011111111111111) (= (mask!10845 thiss!1504) #b00000000000000000111111111111111) (= (mask!10845 thiss!1504) #b00000000000000001111111111111111) (= (mask!10845 thiss!1504) #b00000000000000011111111111111111) (= (mask!10845 thiss!1504) #b00000000000000111111111111111111) (= (mask!10845 thiss!1504) #b00000000000001111111111111111111) (= (mask!10845 thiss!1504) #b00000000000011111111111111111111) (= (mask!10845 thiss!1504) #b00000000000111111111111111111111) (= (mask!10845 thiss!1504) #b00000000001111111111111111111111) (= (mask!10845 thiss!1504) #b00000000011111111111111111111111) (= (mask!10845 thiss!1504) #b00000000111111111111111111111111) (= (mask!10845 thiss!1504) #b00000001111111111111111111111111) (= (mask!10845 thiss!1504) #b00000011111111111111111111111111) (= (mask!10845 thiss!1504) #b00000111111111111111111111111111) (= (mask!10845 thiss!1504) #b00001111111111111111111111111111) (= (mask!10845 thiss!1504) #b00011111111111111111111111111111) (= (mask!10845 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10845 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!251207 d!61013))

(declare-fun b!251517 () Bool)

(declare-fun e!163102 () Bool)

(declare-fun call!23668 () Bool)

(assert (=> b!251517 (= e!163102 call!23668)))

(declare-fun b!251518 () Bool)

(declare-fun e!163105 () Bool)

(declare-fun contains!1805 (List!3713 (_ BitVec 64)) Bool)

(assert (=> b!251518 (= e!163105 (contains!1805 Nil!3710 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun b!251519 () Bool)

(declare-fun e!163103 () Bool)

(assert (=> b!251519 (= e!163103 e!163102)))

(declare-fun c!42336 () Bool)

(assert (=> b!251519 (= c!42336 (validKeyInArray!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun b!251520 () Bool)

(assert (=> b!251520 (= e!163102 call!23668)))

(declare-fun d!61015 () Bool)

(declare-fun res!123115 () Bool)

(declare-fun e!163104 () Bool)

(assert (=> d!61015 (=> res!123115 e!163104)))

(assert (=> d!61015 (= res!123115 (bvsge #b00000000000000000000000000000000 (size!6183 lt!125787)))))

(assert (=> d!61015 (= (arrayNoDuplicates!0 lt!125787 #b00000000000000000000000000000000 Nil!3710) e!163104)))

(declare-fun bm!23665 () Bool)

(assert (=> bm!23665 (= call!23668 (arrayNoDuplicates!0 lt!125787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42336 (Cons!3709 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) Nil!3710) Nil!3710)))))

(declare-fun b!251521 () Bool)

(assert (=> b!251521 (= e!163104 e!163103)))

(declare-fun res!123114 () Bool)

(assert (=> b!251521 (=> (not res!123114) (not e!163103))))

(assert (=> b!251521 (= res!123114 (not e!163105))))

(declare-fun res!123116 () Bool)

(assert (=> b!251521 (=> (not res!123116) (not e!163105))))

(assert (=> b!251521 (= res!123116 (validKeyInArray!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(assert (= (and d!61015 (not res!123115)) b!251521))

(assert (= (and b!251521 res!123116) b!251518))

(assert (= (and b!251521 res!123114) b!251519))

(assert (= (and b!251519 c!42336) b!251517))

(assert (= (and b!251519 (not c!42336)) b!251520))

(assert (= (or b!251517 b!251520) bm!23665))

(declare-fun m!267291 () Bool)

(assert (=> b!251518 m!267291))

(assert (=> b!251518 m!267291))

(declare-fun m!267293 () Bool)

(assert (=> b!251518 m!267293))

(assert (=> b!251519 m!267291))

(assert (=> b!251519 m!267291))

(declare-fun m!267295 () Bool)

(assert (=> b!251519 m!267295))

(assert (=> bm!23665 m!267291))

(declare-fun m!267297 () Bool)

(assert (=> bm!23665 m!267297))

(assert (=> b!251521 m!267291))

(assert (=> b!251521 m!267291))

(assert (=> b!251521 m!267295))

(assert (=> b!251207 d!61015))

(declare-fun b!251530 () Bool)

(declare-fun e!163113 () Bool)

(declare-fun e!163112 () Bool)

(assert (=> b!251530 (= e!163113 e!163112)))

(declare-fun c!42339 () Bool)

(assert (=> b!251530 (= c!42339 (validKeyInArray!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun d!61017 () Bool)

(declare-fun res!123122 () Bool)

(assert (=> d!61017 (=> res!123122 e!163113)))

(assert (=> d!61017 (= res!123122 (bvsge #b00000000000000000000000000000000 (size!6183 lt!125787)))))

(assert (=> d!61017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125787 (mask!10845 thiss!1504)) e!163113)))

(declare-fun bm!23668 () Bool)

(declare-fun call!23671 () Bool)

(assert (=> bm!23668 (= call!23671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125787 (mask!10845 thiss!1504)))))

(declare-fun b!251531 () Bool)

(declare-fun e!163114 () Bool)

(assert (=> b!251531 (= e!163112 e!163114)))

(declare-fun lt!125963 () (_ BitVec 64))

(assert (=> b!251531 (= lt!125963 (select (arr!5836 lt!125787) #b00000000000000000000000000000000))))

(declare-fun lt!125962 () Unit!7753)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12313 (_ BitVec 64) (_ BitVec 32)) Unit!7753)

(assert (=> b!251531 (= lt!125962 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125787 lt!125963 #b00000000000000000000000000000000))))

(assert (=> b!251531 (arrayContainsKey!0 lt!125787 lt!125963 #b00000000000000000000000000000000)))

(declare-fun lt!125964 () Unit!7753)

(assert (=> b!251531 (= lt!125964 lt!125962)))

(declare-fun res!123121 () Bool)

(assert (=> b!251531 (= res!123121 (= (seekEntryOrOpen!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) lt!125787 (mask!10845 thiss!1504)) (Found!1125 #b00000000000000000000000000000000)))))

(assert (=> b!251531 (=> (not res!123121) (not e!163114))))

(declare-fun b!251532 () Bool)

(assert (=> b!251532 (= e!163114 call!23671)))

(declare-fun b!251533 () Bool)

(assert (=> b!251533 (= e!163112 call!23671)))

(assert (= (and d!61017 (not res!123122)) b!251530))

(assert (= (and b!251530 c!42339) b!251531))

(assert (= (and b!251530 (not c!42339)) b!251533))

(assert (= (and b!251531 res!123121) b!251532))

(assert (= (or b!251532 b!251533) bm!23668))

(assert (=> b!251530 m!267291))

(assert (=> b!251530 m!267291))

(assert (=> b!251530 m!267295))

(declare-fun m!267299 () Bool)

(assert (=> bm!23668 m!267299))

(assert (=> b!251531 m!267291))

(declare-fun m!267301 () Bool)

(assert (=> b!251531 m!267301))

(declare-fun m!267303 () Bool)

(assert (=> b!251531 m!267303))

(assert (=> b!251531 m!267291))

(declare-fun m!267305 () Bool)

(assert (=> b!251531 m!267305))

(assert (=> b!251207 d!61017))

(declare-fun d!61019 () Bool)

(declare-fun e!163117 () Bool)

(assert (=> d!61019 e!163117))

(declare-fun res!123125 () Bool)

(assert (=> d!61019 (=> (not res!123125) (not e!163117))))

(assert (=> d!61019 (= res!123125 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6183 (_keys!6786 thiss!1504)))))))

(declare-fun lt!125967 () Unit!7753)

(declare-fun choose!41 (array!12313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3713) Unit!7753)

(assert (=> d!61019 (= lt!125967 (choose!41 (_keys!6786 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710))))

(assert (=> d!61019 (bvslt (size!6183 (_keys!6786 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61019 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6786 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710) lt!125967)))

(declare-fun b!251536 () Bool)

(assert (=> b!251536 (= e!163117 (arrayNoDuplicates!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000000 Nil!3710))))

(assert (= (and d!61019 res!123125) b!251536))

(declare-fun m!267307 () Bool)

(assert (=> d!61019 m!267307))

(assert (=> b!251536 m!267045))

(declare-fun m!267309 () Bool)

(assert (=> b!251536 m!267309))

(assert (=> b!251207 d!61019))

(declare-fun d!61021 () Bool)

(declare-fun lt!125968 () (_ BitVec 32))

(assert (=> d!61021 (and (bvsge lt!125968 #b00000000000000000000000000000000) (bvsle lt!125968 (bvsub (size!6183 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun e!163119 () (_ BitVec 32))

(assert (=> d!61021 (= lt!125968 e!163119)))

(declare-fun c!42341 () Bool)

(assert (=> d!61021 (= c!42341 (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61021 (and (bvsle #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6183 (_keys!6786 thiss!1504)) (size!6183 lt!125787)))))

(assert (=> d!61021 (= (arrayCountValidKeys!0 lt!125787 #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) lt!125968)))

(declare-fun b!251537 () Bool)

(declare-fun e!163118 () (_ BitVec 32))

(declare-fun call!23672 () (_ BitVec 32))

(assert (=> b!251537 (= e!163118 (bvadd #b00000000000000000000000000000001 call!23672))))

(declare-fun bm!23669 () Bool)

(assert (=> bm!23669 (= call!23672 (arrayCountValidKeys!0 lt!125787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251538 () Bool)

(assert (=> b!251538 (= e!163119 #b00000000000000000000000000000000)))

(declare-fun b!251539 () Bool)

(assert (=> b!251539 (= e!163119 e!163118)))

(declare-fun c!42340 () Bool)

(assert (=> b!251539 (= c!42340 (validKeyInArray!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun b!251540 () Bool)

(assert (=> b!251540 (= e!163118 call!23672)))

(assert (= (and d!61021 c!42341) b!251538))

(assert (= (and d!61021 (not c!42341)) b!251539))

(assert (= (and b!251539 c!42340) b!251537))

(assert (= (and b!251539 (not c!42340)) b!251540))

(assert (= (or b!251537 b!251540) bm!23669))

(declare-fun m!267311 () Bool)

(assert (=> bm!23669 m!267311))

(assert (=> b!251539 m!267291))

(assert (=> b!251539 m!267291))

(assert (=> b!251539 m!267295))

(assert (=> b!251207 d!61021))

(assert (=> b!251207 d!60995))

(declare-fun d!61023 () Bool)

(declare-fun e!163122 () Bool)

(assert (=> d!61023 e!163122))

(declare-fun res!123128 () Bool)

(assert (=> d!61023 (=> (not res!123128) (not e!163122))))

(assert (=> d!61023 (= res!123128 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6183 (_keys!6786 thiss!1504)))))))

(declare-fun lt!125971 () Unit!7753)

(declare-fun choose!102 ((_ BitVec 64) array!12313 (_ BitVec 32) (_ BitVec 32)) Unit!7753)

(assert (=> d!61023 (= lt!125971 (choose!102 key!932 (_keys!6786 thiss!1504) index!297 (mask!10845 thiss!1504)))))

(assert (=> d!61023 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61023 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) index!297 (mask!10845 thiss!1504)) lt!125971)))

(declare-fun b!251543 () Bool)

(assert (=> b!251543 (= e!163122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (mask!10845 thiss!1504)))))

(assert (= (and d!61023 res!123128) b!251543))

(declare-fun m!267313 () Bool)

(assert (=> d!61023 m!267313))

(assert (=> d!61023 m!267035))

(assert (=> b!251543 m!267045))

(declare-fun m!267315 () Bool)

(assert (=> b!251543 m!267315))

(assert (=> b!251207 d!61023))

(declare-fun mapIsEmpty!11057 () Bool)

(declare-fun mapRes!11057 () Bool)

(assert (=> mapIsEmpty!11057 mapRes!11057))

(declare-fun b!251550 () Bool)

(declare-fun e!163127 () Bool)

(assert (=> b!251550 (= e!163127 tp_is_empty!6499)))

(declare-fun b!251551 () Bool)

(declare-fun e!163128 () Bool)

(assert (=> b!251551 (= e!163128 tp_is_empty!6499)))

(declare-fun condMapEmpty!11057 () Bool)

(declare-fun mapDefault!11057 () ValueCell!2906)

(assert (=> mapNonEmpty!11048 (= condMapEmpty!11057 (= mapRest!11048 ((as const (Array (_ BitVec 32) ValueCell!2906)) mapDefault!11057)))))

(assert (=> mapNonEmpty!11048 (= tp!23182 (and e!163128 mapRes!11057))))

(declare-fun mapNonEmpty!11057 () Bool)

(declare-fun tp!23198 () Bool)

(assert (=> mapNonEmpty!11057 (= mapRes!11057 (and tp!23198 e!163127))))

(declare-fun mapRest!11057 () (Array (_ BitVec 32) ValueCell!2906))

(declare-fun mapValue!11057 () ValueCell!2906)

(declare-fun mapKey!11057 () (_ BitVec 32))

(assert (=> mapNonEmpty!11057 (= mapRest!11048 (store mapRest!11057 mapKey!11057 mapValue!11057))))

(assert (= (and mapNonEmpty!11048 condMapEmpty!11057) mapIsEmpty!11057))

(assert (= (and mapNonEmpty!11048 (not condMapEmpty!11057)) mapNonEmpty!11057))

(assert (= (and mapNonEmpty!11057 ((_ is ValueCellFull!2906) mapValue!11057)) b!251550))

(assert (= (and mapNonEmpty!11048 ((_ is ValueCellFull!2906) mapDefault!11057)) b!251551))

(declare-fun m!267317 () Bool)

(assert (=> mapNonEmpty!11057 m!267317))

(declare-fun b_lambda!8087 () Bool)

(assert (= b_lambda!8085 (or (and b!251218 b_free!6637) b_lambda!8087)))

(check-sat (not b!251460) (not d!61019) (not mapNonEmpty!11057) tp_is_empty!6499 (not bm!23637) (not b!251543) (not b!251519) (not d!61005) (not bm!23655) (not b!251521) (not bm!23654) (not d!61009) (not bm!23665) (not b!251352) (not b!251491) (not b!251464) (not b!251360) (not b_next!6637) (not b!251365) (not b!251461) (not d!61023) (not b!251406) (not bm!23668) (not d!60997) (not b!251475) (not b!251518) (not b!251531) (not b!251417) (not bm!23669) (not d!60985) (not b_lambda!8087) (not b!251415) b_and!13645 (not b!251530) (not b!251353) (not bm!23657) (not b!251536) (not d!60987) (not d!61007) (not b!251474) (not b!251466) (not b!251494) (not b!251492) (not bm!23638) (not b!251354) (not d!61001) (not b!251477) (not d!60999) (not b!251471) (not b!251539) (not b!251505) (not bm!23653) (not bm!23662))
(check-sat b_and!13645 (not b_next!6637))
(get-model)

(declare-fun d!61025 () Bool)

(declare-fun e!163129 () Bool)

(assert (=> d!61025 e!163129))

(declare-fun res!123129 () Bool)

(assert (=> d!61025 (=> res!123129 e!163129)))

(declare-fun lt!125972 () Bool)

(assert (=> d!61025 (= res!123129 (not lt!125972))))

(declare-fun lt!125975 () Bool)

(assert (=> d!61025 (= lt!125972 lt!125975)))

(declare-fun lt!125973 () Unit!7753)

(declare-fun e!163130 () Unit!7753)

(assert (=> d!61025 (= lt!125973 e!163130)))

(declare-fun c!42342 () Bool)

(assert (=> d!61025 (= c!42342 lt!125975)))

(assert (=> d!61025 (= lt!125975 (containsKey!290 (toList!1874 lt!125932) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61025 (= (contains!1803 lt!125932 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125972)))

(declare-fun b!251552 () Bool)

(declare-fun lt!125974 () Unit!7753)

(assert (=> b!251552 (= e!163130 lt!125974)))

(assert (=> b!251552 (= lt!125974 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1874 lt!125932) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251552 (isDefined!240 (getValueByKey!298 (toList!1874 lt!125932) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251553 () Bool)

(declare-fun Unit!7769 () Unit!7753)

(assert (=> b!251553 (= e!163130 Unit!7769)))

(declare-fun b!251554 () Bool)

(assert (=> b!251554 (= e!163129 (isDefined!240 (getValueByKey!298 (toList!1874 lt!125932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61025 c!42342) b!251552))

(assert (= (and d!61025 (not c!42342)) b!251553))

(assert (= (and d!61025 (not res!123129)) b!251554))

(declare-fun m!267319 () Bool)

(assert (=> d!61025 m!267319))

(declare-fun m!267321 () Bool)

(assert (=> b!251552 m!267321))

(declare-fun m!267323 () Bool)

(assert (=> b!251552 m!267323))

(assert (=> b!251552 m!267323))

(declare-fun m!267325 () Bool)

(assert (=> b!251552 m!267325))

(assert (=> b!251554 m!267323))

(assert (=> b!251554 m!267323))

(assert (=> b!251554 m!267325))

(assert (=> bm!23654 d!61025))

(assert (=> d!60997 d!61001))

(declare-fun d!61027 () Bool)

(declare-fun e!163133 () Bool)

(assert (=> d!61027 e!163133))

(declare-fun res!123134 () Bool)

(assert (=> d!61027 (=> (not res!123134) (not e!163133))))

(declare-fun lt!125978 () SeekEntryResult!1125)

(assert (=> d!61027 (= res!123134 ((_ is Found!1125) lt!125978))))

(assert (=> d!61027 (= lt!125978 (seekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(assert (=> d!61027 true))

(declare-fun _$33!171 () Unit!7753)

(assert (=> d!61027 (= (choose!1202 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) _$33!171)))

(declare-fun b!251559 () Bool)

(declare-fun res!123135 () Bool)

(assert (=> b!251559 (=> (not res!123135) (not e!163133))))

(assert (=> b!251559 (= res!123135 (inRange!0 (index!6671 lt!125978) (mask!10845 thiss!1504)))))

(declare-fun b!251560 () Bool)

(assert (=> b!251560 (= e!163133 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6671 lt!125978)) key!932))))

(assert (= (and d!61027 res!123134) b!251559))

(assert (= (and b!251559 res!123135) b!251560))

(assert (=> d!61027 m!267057))

(declare-fun m!267327 () Bool)

(assert (=> b!251559 m!267327))

(declare-fun m!267329 () Bool)

(assert (=> b!251560 m!267329))

(assert (=> d!60997 d!61027))

(assert (=> d!60997 d!61013))

(declare-fun d!61029 () Bool)

(declare-fun get!3001 (Option!304) V!8313)

(assert (=> d!61029 (= (apply!242 lt!125932 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3001 (getValueByKey!298 (toList!1874 lt!125932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8983 () Bool)

(assert (= bs!8983 d!61029))

(assert (=> bs!8983 m!267323))

(assert (=> bs!8983 m!267323))

(declare-fun m!267331 () Bool)

(assert (=> bs!8983 m!267331))

(assert (=> b!251461 d!61029))

(declare-fun d!61031 () Bool)

(assert (=> d!61031 (= (validKeyInArray!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)) (and (not (= (select (arr!5836 lt!125787) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5836 lt!125787) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251530 d!61031))

(declare-fun d!61033 () Bool)

(assert (=> d!61033 (isDefined!240 (getValueByKey!298 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-fun lt!125981 () Unit!7753)

(declare-fun choose!1204 (List!3714 (_ BitVec 64)) Unit!7753)

(assert (=> d!61033 (= lt!125981 (choose!1204 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-fun e!163136 () Bool)

(assert (=> d!61033 e!163136))

(declare-fun res!123138 () Bool)

(assert (=> d!61033 (=> (not res!123138) (not e!163136))))

(declare-fun isStrictlySorted!367 (List!3714) Bool)

(assert (=> d!61033 (= res!123138 (isStrictlySorted!367 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))))

(assert (=> d!61033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932) lt!125981)))

(declare-fun b!251563 () Bool)

(assert (=> b!251563 (= e!163136 (containsKey!290 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(assert (= (and d!61033 res!123138) b!251563))

(assert (=> d!61033 m!267219))

(assert (=> d!61033 m!267219))

(assert (=> d!61033 m!267221))

(declare-fun m!267333 () Bool)

(assert (=> d!61033 m!267333))

(declare-fun m!267335 () Bool)

(assert (=> d!61033 m!267335))

(assert (=> b!251563 m!267215))

(assert (=> b!251415 d!61033))

(declare-fun d!61035 () Bool)

(declare-fun isEmpty!534 (Option!304) Bool)

(assert (=> d!61035 (= (isDefined!240 (getValueByKey!298 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932)) (not (isEmpty!534 (getValueByKey!298 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))))

(declare-fun bs!8984 () Bool)

(assert (= bs!8984 d!61035))

(assert (=> bs!8984 m!267219))

(declare-fun m!267337 () Bool)

(assert (=> bs!8984 m!267337))

(assert (=> b!251415 d!61035))

(declare-fun d!61037 () Bool)

(declare-fun c!42347 () Bool)

(assert (=> d!61037 (= c!42347 (and ((_ is Cons!3710) (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (= (_1!2418 (h!4371 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)))))

(declare-fun e!163141 () Option!304)

(assert (=> d!61037 (= (getValueByKey!298 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932) e!163141)))

(declare-fun b!251573 () Bool)

(declare-fun e!163142 () Option!304)

(assert (=> b!251573 (= e!163141 e!163142)))

(declare-fun c!42348 () Bool)

(assert (=> b!251573 (= c!42348 (and ((_ is Cons!3710) (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (not (= (_1!2418 (h!4371 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932))))))

(declare-fun b!251572 () Bool)

(assert (=> b!251572 (= e!163141 (Some!303 (_2!2418 (h!4371 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))))))

(declare-fun b!251575 () Bool)

(assert (=> b!251575 (= e!163142 None!302)))

(declare-fun b!251574 () Bool)

(assert (=> b!251574 (= e!163142 (getValueByKey!298 (t!8742 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) key!932))))

(assert (= (and d!61037 c!42347) b!251572))

(assert (= (and d!61037 (not c!42347)) b!251573))

(assert (= (and b!251573 c!42348) b!251574))

(assert (= (and b!251573 (not c!42348)) b!251575))

(declare-fun m!267339 () Bool)

(assert (=> b!251574 m!267339))

(assert (=> b!251415 d!61037))

(declare-fun d!61039 () Bool)

(declare-fun res!123139 () Bool)

(declare-fun e!163143 () Bool)

(assert (=> d!61039 (=> res!123139 e!163143)))

(assert (=> d!61039 (= res!123139 (= (select (arr!5836 (_keys!6786 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61039 (= (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!163143)))

(declare-fun b!251576 () Bool)

(declare-fun e!163144 () Bool)

(assert (=> b!251576 (= e!163143 e!163144)))

(declare-fun res!123140 () Bool)

(assert (=> b!251576 (=> (not res!123140) (not e!163144))))

(assert (=> b!251576 (= res!123140 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251577 () Bool)

(assert (=> b!251577 (= e!163144 (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61039 (not res!123139)) b!251576))

(assert (= (and b!251576 res!123140) b!251577))

(declare-fun m!267341 () Bool)

(assert (=> d!61039 m!267341))

(declare-fun m!267343 () Bool)

(assert (=> b!251577 m!267343))

(assert (=> b!251360 d!61039))

(declare-fun bm!23672 () Bool)

(declare-fun call!23675 () ListLongMap!3717)

(assert (=> bm!23672 (= call!23675 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4645 thiss!1504)))))

(declare-fun b!251602 () Bool)

(declare-fun res!123151 () Bool)

(declare-fun e!163163 () Bool)

(assert (=> b!251602 (=> (not res!123151) (not e!163163))))

(declare-fun lt!126001 () ListLongMap!3717)

(assert (=> b!251602 (= res!123151 (not (contains!1803 lt!126001 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251603 () Bool)

(declare-fun e!163160 () Bool)

(declare-fun e!163165 () Bool)

(assert (=> b!251603 (= e!163160 e!163165)))

(declare-fun c!42357 () Bool)

(assert (=> b!251603 (= c!42357 (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251604 () Bool)

(declare-fun e!163161 () ListLongMap!3717)

(assert (=> b!251604 (= e!163161 (ListLongMap!3718 Nil!3711))))

(declare-fun b!251605 () Bool)

(declare-fun e!163159 () Bool)

(assert (=> b!251605 (= e!163160 e!163159)))

(assert (=> b!251605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun res!123150 () Bool)

(assert (=> b!251605 (= res!123150 (contains!1803 lt!126001 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251605 (=> (not res!123150) (not e!163159))))

(declare-fun d!61041 () Bool)

(assert (=> d!61041 e!163163))

(declare-fun res!123149 () Bool)

(assert (=> d!61041 (=> (not res!123149) (not e!163163))))

(assert (=> d!61041 (= res!123149 (not (contains!1803 lt!126001 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61041 (= lt!126001 e!163161)))

(declare-fun c!42358 () Bool)

(assert (=> d!61041 (= c!42358 (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61041 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61041 (= (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) lt!126001)))

(declare-fun b!251606 () Bool)

(assert (=> b!251606 (= e!163165 (= lt!126001 (getCurrentListMapNoExtraKeys!558 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4645 thiss!1504))))))

(declare-fun b!251607 () Bool)

(declare-fun e!163162 () ListLongMap!3717)

(assert (=> b!251607 (= e!163161 e!163162)))

(declare-fun c!42359 () Bool)

(assert (=> b!251607 (= c!42359 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251608 () Bool)

(assert (=> b!251608 (= e!163163 e!163160)))

(declare-fun c!42360 () Bool)

(declare-fun e!163164 () Bool)

(assert (=> b!251608 (= c!42360 e!163164)))

(declare-fun res!123152 () Bool)

(assert (=> b!251608 (=> (not res!123152) (not e!163164))))

(assert (=> b!251608 (= res!123152 (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251609 () Bool)

(declare-fun isEmpty!535 (ListLongMap!3717) Bool)

(assert (=> b!251609 (= e!163165 (isEmpty!535 lt!126001))))

(declare-fun b!251610 () Bool)

(assert (=> b!251610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> b!251610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_values!4628 thiss!1504))))))

(assert (=> b!251610 (= e!163159 (= (apply!242 lt!126001 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)) (get!3000 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251611 () Bool)

(assert (=> b!251611 (= e!163164 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251611 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!251612 () Bool)

(assert (=> b!251612 (= e!163162 call!23675)))

(declare-fun b!251613 () Bool)

(declare-fun lt!126002 () Unit!7753)

(declare-fun lt!125999 () Unit!7753)

(assert (=> b!251613 (= lt!126002 lt!125999)))

(declare-fun lt!125996 () V!8313)

(declare-fun lt!125998 () (_ BitVec 64))

(declare-fun lt!126000 () (_ BitVec 64))

(declare-fun lt!125997 () ListLongMap!3717)

(assert (=> b!251613 (not (contains!1803 (+!675 lt!125997 (tuple2!4815 lt!125998 lt!125996)) lt!126000))))

(declare-fun addStillNotContains!125 (ListLongMap!3717 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7753)

(assert (=> b!251613 (= lt!125999 (addStillNotContains!125 lt!125997 lt!125998 lt!125996 lt!126000))))

(assert (=> b!251613 (= lt!126000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!251613 (= lt!125996 (get!3000 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251613 (= lt!125998 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251613 (= lt!125997 call!23675)))

(assert (=> b!251613 (= e!163162 (+!675 call!23675 (tuple2!4815 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000) (get!3000 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!61041 c!42358) b!251604))

(assert (= (and d!61041 (not c!42358)) b!251607))

(assert (= (and b!251607 c!42359) b!251613))

(assert (= (and b!251607 (not c!42359)) b!251612))

(assert (= (or b!251613 b!251612) bm!23672))

(assert (= (and d!61041 res!123149) b!251602))

(assert (= (and b!251602 res!123151) b!251608))

(assert (= (and b!251608 res!123152) b!251611))

(assert (= (and b!251608 c!42360) b!251605))

(assert (= (and b!251608 (not c!42360)) b!251603))

(assert (= (and b!251605 res!123150) b!251610))

(assert (= (and b!251603 c!42357) b!251606))

(assert (= (and b!251603 (not c!42357)) b!251609))

(declare-fun b_lambda!8089 () Bool)

(assert (=> (not b_lambda!8089) (not b!251610)))

(assert (=> b!251610 t!8747))

(declare-fun b_and!13647 () Bool)

(assert (= b_and!13645 (and (=> t!8747 result!5305) b_and!13647)))

(declare-fun b_lambda!8091 () Bool)

(assert (=> (not b_lambda!8091) (not b!251613)))

(assert (=> b!251613 t!8747))

(declare-fun b_and!13649 () Bool)

(assert (= b_and!13647 (and (=> t!8747 result!5305) b_and!13649)))

(assert (=> b!251610 m!267231))

(assert (=> b!251610 m!267231))

(assert (=> b!251610 m!267227))

(assert (=> b!251610 m!267233))

(assert (=> b!251610 m!267183))

(declare-fun m!267345 () Bool)

(assert (=> b!251610 m!267345))

(assert (=> b!251610 m!267227))

(assert (=> b!251610 m!267183))

(declare-fun m!267347 () Bool)

(assert (=> b!251602 m!267347))

(assert (=> b!251611 m!267183))

(assert (=> b!251611 m!267183))

(assert (=> b!251611 m!267225))

(declare-fun m!267349 () Bool)

(assert (=> d!61041 m!267349))

(assert (=> d!61041 m!267035))

(declare-fun m!267351 () Bool)

(assert (=> b!251609 m!267351))

(assert (=> b!251605 m!267183))

(assert (=> b!251605 m!267183))

(declare-fun m!267353 () Bool)

(assert (=> b!251605 m!267353))

(assert (=> b!251607 m!267183))

(assert (=> b!251607 m!267183))

(assert (=> b!251607 m!267225))

(declare-fun m!267355 () Bool)

(assert (=> b!251613 m!267355))

(declare-fun m!267357 () Bool)

(assert (=> b!251613 m!267357))

(assert (=> b!251613 m!267357))

(declare-fun m!267359 () Bool)

(assert (=> b!251613 m!267359))

(assert (=> b!251613 m!267231))

(assert (=> b!251613 m!267231))

(assert (=> b!251613 m!267227))

(assert (=> b!251613 m!267233))

(declare-fun m!267361 () Bool)

(assert (=> b!251613 m!267361))

(assert (=> b!251613 m!267227))

(assert (=> b!251613 m!267183))

(declare-fun m!267363 () Bool)

(assert (=> bm!23672 m!267363))

(assert (=> b!251606 m!267363))

(assert (=> bm!23657 d!61041))

(declare-fun d!61043 () Bool)

(assert (=> d!61043 (= (apply!242 lt!125932 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3001 (getValueByKey!298 (toList!1874 lt!125932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8985 () Bool)

(assert (= bs!8985 d!61043))

(declare-fun m!267365 () Bool)

(assert (=> bs!8985 m!267365))

(assert (=> bs!8985 m!267365))

(declare-fun m!267367 () Bool)

(assert (=> bs!8985 m!267367))

(assert (=> b!251460 d!61043))

(declare-fun d!61045 () Bool)

(assert (=> d!61045 (= (apply!242 lt!125932 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)) (get!3001 (getValueByKey!298 (toList!1874 lt!125932) (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8986 () Bool)

(assert (= bs!8986 d!61045))

(assert (=> bs!8986 m!267183))

(declare-fun m!267369 () Bool)

(assert (=> bs!8986 m!267369))

(assert (=> bs!8986 m!267369))

(declare-fun m!267371 () Bool)

(assert (=> bs!8986 m!267371))

(assert (=> b!251477 d!61045))

(declare-fun d!61047 () Bool)

(declare-fun c!42363 () Bool)

(assert (=> d!61047 (= c!42363 ((_ is ValueCellFull!2906) (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!163168 () V!8313)

(assert (=> d!61047 (= (get!3000 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!163168)))

(declare-fun b!251618 () Bool)

(declare-fun get!3002 (ValueCell!2906 V!8313) V!8313)

(assert (=> b!251618 (= e!163168 (get!3002 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251619 () Bool)

(declare-fun get!3003 (ValueCell!2906 V!8313) V!8313)

(assert (=> b!251619 (= e!163168 (get!3003 (select (arr!5835 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61047 c!42363) b!251618))

(assert (= (and d!61047 (not c!42363)) b!251619))

(assert (=> b!251618 m!267231))

(assert (=> b!251618 m!267227))

(declare-fun m!267373 () Bool)

(assert (=> b!251618 m!267373))

(assert (=> b!251619 m!267231))

(assert (=> b!251619 m!267227))

(declare-fun m!267375 () Bool)

(assert (=> b!251619 m!267375))

(assert (=> b!251477 d!61047))

(declare-fun b!251632 () Bool)

(declare-fun e!163175 () SeekEntryResult!1125)

(assert (=> b!251632 (= e!163175 (MissingVacant!1125 (index!6672 lt!125869)))))

(declare-fun b!251633 () Bool)

(declare-fun c!42371 () Bool)

(declare-fun lt!126008 () (_ BitVec 64))

(assert (=> b!251633 (= c!42371 (= lt!126008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163177 () SeekEntryResult!1125)

(assert (=> b!251633 (= e!163177 e!163175)))

(declare-fun b!251634 () Bool)

(declare-fun e!163176 () SeekEntryResult!1125)

(assert (=> b!251634 (= e!163176 e!163177)))

(declare-fun c!42370 () Bool)

(assert (=> b!251634 (= c!42370 (= lt!126008 key!932))))

(declare-fun b!251635 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251635 (= e!163175 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24718 lt!125869) #b00000000000000000000000000000001) (nextIndex!0 (index!6672 lt!125869) (x!24718 lt!125869) (mask!10845 thiss!1504)) (index!6672 lt!125869) key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun d!61049 () Bool)

(declare-fun lt!126007 () SeekEntryResult!1125)

(assert (=> d!61049 (and (or ((_ is Undefined!1125) lt!126007) (not ((_ is Found!1125) lt!126007)) (and (bvsge (index!6671 lt!126007) #b00000000000000000000000000000000) (bvslt (index!6671 lt!126007) (size!6183 (_keys!6786 thiss!1504))))) (or ((_ is Undefined!1125) lt!126007) ((_ is Found!1125) lt!126007) (not ((_ is MissingVacant!1125) lt!126007)) (not (= (index!6673 lt!126007) (index!6672 lt!125869))) (and (bvsge (index!6673 lt!126007) #b00000000000000000000000000000000) (bvslt (index!6673 lt!126007) (size!6183 (_keys!6786 thiss!1504))))) (or ((_ is Undefined!1125) lt!126007) (ite ((_ is Found!1125) lt!126007) (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6671 lt!126007)) key!932) (and ((_ is MissingVacant!1125) lt!126007) (= (index!6673 lt!126007) (index!6672 lt!125869)) (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6673 lt!126007)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!61049 (= lt!126007 e!163176)))

(declare-fun c!42372 () Bool)

(assert (=> d!61049 (= c!42372 (bvsge (x!24718 lt!125869) #b01111111111111111111111111111110))))

(assert (=> d!61049 (= lt!126008 (select (arr!5836 (_keys!6786 thiss!1504)) (index!6672 lt!125869)))))

(assert (=> d!61049 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61049 (= (seekKeyOrZeroReturnVacant!0 (x!24718 lt!125869) (index!6672 lt!125869) (index!6672 lt!125869) key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)) lt!126007)))

(declare-fun b!251636 () Bool)

(assert (=> b!251636 (= e!163176 Undefined!1125)))

(declare-fun b!251637 () Bool)

(assert (=> b!251637 (= e!163177 (Found!1125 (index!6672 lt!125869)))))

(assert (= (and d!61049 c!42372) b!251636))

(assert (= (and d!61049 (not c!42372)) b!251634))

(assert (= (and b!251634 c!42370) b!251637))

(assert (= (and b!251634 (not c!42370)) b!251633))

(assert (= (and b!251633 c!42371) b!251632))

(assert (= (and b!251633 (not c!42371)) b!251635))

(declare-fun m!267377 () Bool)

(assert (=> b!251635 m!267377))

(assert (=> b!251635 m!267377))

(declare-fun m!267379 () Bool)

(assert (=> b!251635 m!267379))

(declare-fun m!267381 () Bool)

(assert (=> d!61049 m!267381))

(declare-fun m!267383 () Bool)

(assert (=> d!61049 m!267383))

(assert (=> d!61049 m!267213))

(assert (=> d!61049 m!267035))

(assert (=> b!251406 d!61049))

(assert (=> b!251352 d!61011))

(declare-fun d!61051 () Bool)

(declare-fun e!163178 () Bool)

(assert (=> d!61051 e!163178))

(declare-fun res!123153 () Bool)

(assert (=> d!61051 (=> res!123153 e!163178)))

(declare-fun lt!126009 () Bool)

(assert (=> d!61051 (= res!123153 (not lt!126009))))

(declare-fun lt!126012 () Bool)

(assert (=> d!61051 (= lt!126009 lt!126012)))

(declare-fun lt!126010 () Unit!7753)

(declare-fun e!163179 () Unit!7753)

(assert (=> d!61051 (= lt!126010 e!163179)))

(declare-fun c!42373 () Bool)

(assert (=> d!61051 (= c!42373 lt!126012)))

(assert (=> d!61051 (= lt!126012 (containsKey!290 (toList!1874 lt!125932) (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61051 (= (contains!1803 lt!125932 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)) lt!126009)))

(declare-fun b!251638 () Bool)

(declare-fun lt!126011 () Unit!7753)

(assert (=> b!251638 (= e!163179 lt!126011)))

(assert (=> b!251638 (= lt!126011 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1874 lt!125932) (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251638 (isDefined!240 (getValueByKey!298 (toList!1874 lt!125932) (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251639 () Bool)

(declare-fun Unit!7770 () Unit!7753)

(assert (=> b!251639 (= e!163179 Unit!7770)))

(declare-fun b!251640 () Bool)

(assert (=> b!251640 (= e!163178 (isDefined!240 (getValueByKey!298 (toList!1874 lt!125932) (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!61051 c!42373) b!251638))

(assert (= (and d!61051 (not c!42373)) b!251639))

(assert (= (and d!61051 (not res!123153)) b!251640))

(assert (=> d!61051 m!267183))

(declare-fun m!267385 () Bool)

(assert (=> d!61051 m!267385))

(assert (=> b!251638 m!267183))

(declare-fun m!267387 () Bool)

(assert (=> b!251638 m!267387))

(assert (=> b!251638 m!267183))

(assert (=> b!251638 m!267369))

(assert (=> b!251638 m!267369))

(declare-fun m!267389 () Bool)

(assert (=> b!251638 m!267389))

(assert (=> b!251640 m!267183))

(assert (=> b!251640 m!267369))

(assert (=> b!251640 m!267369))

(assert (=> b!251640 m!267389))

(assert (=> b!251471 d!61051))

(declare-fun d!61053 () Bool)

(declare-fun lt!126013 () (_ BitVec 32))

(assert (=> d!61053 (and (bvsge lt!126013 #b00000000000000000000000000000000) (bvsle lt!126013 (bvsub (size!6183 (_keys!6786 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!163181 () (_ BitVec 32))

(assert (=> d!61053 (= lt!126013 e!163181)))

(declare-fun c!42375 () Bool)

(assert (=> d!61053 (= c!42375 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61053 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6183 (_keys!6786 thiss!1504)) (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61053 (= (arrayCountValidKeys!0 (_keys!6786 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))) lt!126013)))

(declare-fun b!251641 () Bool)

(declare-fun e!163180 () (_ BitVec 32))

(declare-fun call!23676 () (_ BitVec 32))

(assert (=> b!251641 (= e!163180 (bvadd #b00000000000000000000000000000001 call!23676))))

(declare-fun bm!23673 () Bool)

(assert (=> bm!23673 (= call!23676 (arrayCountValidKeys!0 (_keys!6786 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251642 () Bool)

(assert (=> b!251642 (= e!163181 #b00000000000000000000000000000000)))

(declare-fun b!251643 () Bool)

(assert (=> b!251643 (= e!163181 e!163180)))

(declare-fun c!42374 () Bool)

(assert (=> b!251643 (= c!42374 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251644 () Bool)

(assert (=> b!251644 (= e!163180 call!23676)))

(assert (= (and d!61053 c!42375) b!251642))

(assert (= (and d!61053 (not c!42375)) b!251643))

(assert (= (and b!251643 c!42374) b!251641))

(assert (= (and b!251643 (not c!42374)) b!251644))

(assert (= (or b!251641 b!251644) bm!23673))

(declare-fun m!267391 () Bool)

(assert (=> bm!23673 m!267391))

(assert (=> b!251643 m!267341))

(assert (=> b!251643 m!267341))

(declare-fun m!267393 () Bool)

(assert (=> b!251643 m!267393))

(assert (=> bm!23662 d!61053))

(declare-fun b!251645 () Bool)

(declare-fun e!163182 () Bool)

(declare-fun call!23677 () Bool)

(assert (=> b!251645 (= e!163182 call!23677)))

(declare-fun e!163185 () Bool)

(declare-fun b!251646 () Bool)

(assert (=> b!251646 (= e!163185 (contains!1805 Nil!3710 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251647 () Bool)

(declare-fun e!163183 () Bool)

(assert (=> b!251647 (= e!163183 e!163182)))

(declare-fun c!42376 () Bool)

(assert (=> b!251647 (= c!42376 (validKeyInArray!0 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251648 () Bool)

(assert (=> b!251648 (= e!163182 call!23677)))

(declare-fun d!61055 () Bool)

(declare-fun res!123155 () Bool)

(declare-fun e!163184 () Bool)

(assert (=> d!61055 (=> res!123155 e!163184)))

(assert (=> d!61055 (= res!123155 (bvsge #b00000000000000000000000000000000 (size!6183 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))))))))

(assert (=> d!61055 (= (arrayNoDuplicates!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000000 Nil!3710) e!163184)))

(declare-fun bm!23674 () Bool)

(assert (=> bm!23674 (= call!23677 (arrayNoDuplicates!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42376 (Cons!3709 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000) Nil!3710) Nil!3710)))))

(declare-fun b!251649 () Bool)

(assert (=> b!251649 (= e!163184 e!163183)))

(declare-fun res!123154 () Bool)

(assert (=> b!251649 (=> (not res!123154) (not e!163183))))

(assert (=> b!251649 (= res!123154 (not e!163185))))

(declare-fun res!123156 () Bool)

(assert (=> b!251649 (=> (not res!123156) (not e!163185))))

(assert (=> b!251649 (= res!123156 (validKeyInArray!0 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!61055 (not res!123155)) b!251649))

(assert (= (and b!251649 res!123156) b!251646))

(assert (= (and b!251649 res!123154) b!251647))

(assert (= (and b!251647 c!42376) b!251645))

(assert (= (and b!251647 (not c!42376)) b!251648))

(assert (= (or b!251645 b!251648) bm!23674))

(declare-fun m!267395 () Bool)

(assert (=> b!251646 m!267395))

(assert (=> b!251646 m!267395))

(declare-fun m!267397 () Bool)

(assert (=> b!251646 m!267397))

(assert (=> b!251647 m!267395))

(assert (=> b!251647 m!267395))

(declare-fun m!267399 () Bool)

(assert (=> b!251647 m!267399))

(assert (=> bm!23674 m!267395))

(declare-fun m!267401 () Bool)

(assert (=> bm!23674 m!267401))

(assert (=> b!251649 m!267395))

(assert (=> b!251649 m!267395))

(assert (=> b!251649 m!267399))

(assert (=> b!251536 d!61055))

(declare-fun d!61057 () Bool)

(assert (=> d!61057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (mask!10845 thiss!1504))))

(assert (=> d!61057 true))

(declare-fun _$56!30 () Unit!7753)

(assert (=> d!61057 (= (choose!102 key!932 (_keys!6786 thiss!1504) index!297 (mask!10845 thiss!1504)) _$56!30)))

(declare-fun bs!8987 () Bool)

(assert (= bs!8987 d!61057))

(assert (=> bs!8987 m!267045))

(assert (=> bs!8987 m!267315))

(assert (=> d!61023 d!61057))

(assert (=> d!61023 d!61013))

(declare-fun b!251650 () Bool)

(declare-fun e!163186 () Bool)

(declare-fun call!23678 () Bool)

(assert (=> b!251650 (= e!163186 call!23678)))

(declare-fun b!251651 () Bool)

(declare-fun e!163189 () Bool)

(assert (=> b!251651 (= e!163189 (contains!1805 Nil!3710 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251652 () Bool)

(declare-fun e!163187 () Bool)

(assert (=> b!251652 (= e!163187 e!163186)))

(declare-fun c!42377 () Bool)

(assert (=> b!251652 (= c!42377 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251653 () Bool)

(assert (=> b!251653 (= e!163186 call!23678)))

(declare-fun d!61059 () Bool)

(declare-fun res!123158 () Bool)

(declare-fun e!163188 () Bool)

(assert (=> d!61059 (=> res!123158 e!163188)))

(assert (=> d!61059 (= res!123158 (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61059 (= (arrayNoDuplicates!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 Nil!3710) e!163188)))

(declare-fun bm!23675 () Bool)

(assert (=> bm!23675 (= call!23678 (arrayNoDuplicates!0 (_keys!6786 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42377 (Cons!3709 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000) Nil!3710) Nil!3710)))))

(declare-fun b!251654 () Bool)

(assert (=> b!251654 (= e!163188 e!163187)))

(declare-fun res!123157 () Bool)

(assert (=> b!251654 (=> (not res!123157) (not e!163187))))

(assert (=> b!251654 (= res!123157 (not e!163189))))

(declare-fun res!123159 () Bool)

(assert (=> b!251654 (=> (not res!123159) (not e!163189))))

(assert (=> b!251654 (= res!123159 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61059 (not res!123158)) b!251654))

(assert (= (and b!251654 res!123159) b!251651))

(assert (= (and b!251654 res!123157) b!251652))

(assert (= (and b!251652 c!42377) b!251650))

(assert (= (and b!251652 (not c!42377)) b!251653))

(assert (= (or b!251650 b!251653) bm!23675))

(assert (=> b!251651 m!267183))

(assert (=> b!251651 m!267183))

(declare-fun m!267403 () Bool)

(assert (=> b!251651 m!267403))

(assert (=> b!251652 m!267183))

(assert (=> b!251652 m!267183))

(assert (=> b!251652 m!267225))

(assert (=> bm!23675 m!267183))

(declare-fun m!267405 () Bool)

(assert (=> bm!23675 m!267405))

(assert (=> b!251654 m!267183))

(assert (=> b!251654 m!267183))

(assert (=> b!251654 m!267225))

(assert (=> b!251354 d!61059))

(declare-fun d!61061 () Bool)

(assert (=> d!61061 (= (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251505 d!61061))

(declare-fun d!61063 () Bool)

(assert (=> d!61063 (arrayContainsKey!0 lt!125787 lt!125963 #b00000000000000000000000000000000)))

(declare-fun lt!126016 () Unit!7753)

(declare-fun choose!13 (array!12313 (_ BitVec 64) (_ BitVec 32)) Unit!7753)

(assert (=> d!61063 (= lt!126016 (choose!13 lt!125787 lt!125963 #b00000000000000000000000000000000))))

(assert (=> d!61063 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!61063 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125787 lt!125963 #b00000000000000000000000000000000) lt!126016)))

(declare-fun bs!8988 () Bool)

(assert (= bs!8988 d!61063))

(assert (=> bs!8988 m!267303))

(declare-fun m!267407 () Bool)

(assert (=> bs!8988 m!267407))

(assert (=> b!251531 d!61063))

(declare-fun d!61065 () Bool)

(declare-fun res!123160 () Bool)

(declare-fun e!163190 () Bool)

(assert (=> d!61065 (=> res!123160 e!163190)))

(assert (=> d!61065 (= res!123160 (= (select (arr!5836 lt!125787) #b00000000000000000000000000000000) lt!125963))))

(assert (=> d!61065 (= (arrayContainsKey!0 lt!125787 lt!125963 #b00000000000000000000000000000000) e!163190)))

(declare-fun b!251655 () Bool)

(declare-fun e!163191 () Bool)

(assert (=> b!251655 (= e!163190 e!163191)))

(declare-fun res!123161 () Bool)

(assert (=> b!251655 (=> (not res!123161) (not e!163191))))

(assert (=> b!251655 (= res!123161 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 lt!125787)))))

(declare-fun b!251656 () Bool)

(assert (=> b!251656 (= e!163191 (arrayContainsKey!0 lt!125787 lt!125963 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61065 (not res!123160)) b!251655))

(assert (= (and b!251655 res!123161) b!251656))

(assert (=> d!61065 m!267291))

(declare-fun m!267409 () Bool)

(assert (=> b!251656 m!267409))

(assert (=> b!251531 d!61065))

(declare-fun b!251657 () Bool)

(declare-fun e!163192 () SeekEntryResult!1125)

(declare-fun lt!126017 () SeekEntryResult!1125)

(assert (=> b!251657 (= e!163192 (MissingZero!1125 (index!6672 lt!126017)))))

(declare-fun b!251658 () Bool)

(declare-fun c!42378 () Bool)

(declare-fun lt!126018 () (_ BitVec 64))

(assert (=> b!251658 (= c!42378 (= lt!126018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163193 () SeekEntryResult!1125)

(assert (=> b!251658 (= e!163193 e!163192)))

(declare-fun d!61067 () Bool)

(declare-fun lt!126019 () SeekEntryResult!1125)

(assert (=> d!61067 (and (or ((_ is Undefined!1125) lt!126019) (not ((_ is Found!1125) lt!126019)) (and (bvsge (index!6671 lt!126019) #b00000000000000000000000000000000) (bvslt (index!6671 lt!126019) (size!6183 lt!125787)))) (or ((_ is Undefined!1125) lt!126019) ((_ is Found!1125) lt!126019) (not ((_ is MissingZero!1125) lt!126019)) (and (bvsge (index!6670 lt!126019) #b00000000000000000000000000000000) (bvslt (index!6670 lt!126019) (size!6183 lt!125787)))) (or ((_ is Undefined!1125) lt!126019) ((_ is Found!1125) lt!126019) ((_ is MissingZero!1125) lt!126019) (not ((_ is MissingVacant!1125) lt!126019)) (and (bvsge (index!6673 lt!126019) #b00000000000000000000000000000000) (bvslt (index!6673 lt!126019) (size!6183 lt!125787)))) (or ((_ is Undefined!1125) lt!126019) (ite ((_ is Found!1125) lt!126019) (= (select (arr!5836 lt!125787) (index!6671 lt!126019)) (select (arr!5836 lt!125787) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1125) lt!126019) (= (select (arr!5836 lt!125787) (index!6670 lt!126019)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1125) lt!126019) (= (select (arr!5836 lt!125787) (index!6673 lt!126019)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!163194 () SeekEntryResult!1125)

(assert (=> d!61067 (= lt!126019 e!163194)))

(declare-fun c!42380 () Bool)

(assert (=> d!61067 (= c!42380 (and ((_ is Intermediate!1125) lt!126017) (undefined!1937 lt!126017)))))

(assert (=> d!61067 (= lt!126017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) (mask!10845 thiss!1504)) (select (arr!5836 lt!125787) #b00000000000000000000000000000000) lt!125787 (mask!10845 thiss!1504)))))

(assert (=> d!61067 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61067 (= (seekEntryOrOpen!0 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) lt!125787 (mask!10845 thiss!1504)) lt!126019)))

(declare-fun b!251659 () Bool)

(assert (=> b!251659 (= e!163193 (Found!1125 (index!6672 lt!126017)))))

(declare-fun b!251660 () Bool)

(assert (=> b!251660 (= e!163192 (seekKeyOrZeroReturnVacant!0 (x!24718 lt!126017) (index!6672 lt!126017) (index!6672 lt!126017) (select (arr!5836 lt!125787) #b00000000000000000000000000000000) lt!125787 (mask!10845 thiss!1504)))))

(declare-fun b!251661 () Bool)

(assert (=> b!251661 (= e!163194 e!163193)))

(assert (=> b!251661 (= lt!126018 (select (arr!5836 lt!125787) (index!6672 lt!126017)))))

(declare-fun c!42379 () Bool)

(assert (=> b!251661 (= c!42379 (= lt!126018 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun b!251662 () Bool)

(assert (=> b!251662 (= e!163194 Undefined!1125)))

(assert (= (and d!61067 c!42380) b!251662))

(assert (= (and d!61067 (not c!42380)) b!251661))

(assert (= (and b!251661 c!42379) b!251659))

(assert (= (and b!251661 (not c!42379)) b!251658))

(assert (= (and b!251658 c!42378) b!251657))

(assert (= (and b!251658 (not c!42378)) b!251660))

(declare-fun m!267411 () Bool)

(assert (=> d!61067 m!267411))

(assert (=> d!61067 m!267291))

(declare-fun m!267413 () Bool)

(assert (=> d!61067 m!267413))

(declare-fun m!267415 () Bool)

(assert (=> d!61067 m!267415))

(assert (=> d!61067 m!267035))

(declare-fun m!267417 () Bool)

(assert (=> d!61067 m!267417))

(assert (=> d!61067 m!267413))

(assert (=> d!61067 m!267291))

(declare-fun m!267419 () Bool)

(assert (=> d!61067 m!267419))

(assert (=> b!251660 m!267291))

(declare-fun m!267421 () Bool)

(assert (=> b!251660 m!267421))

(declare-fun m!267423 () Bool)

(assert (=> b!251661 m!267423))

(assert (=> b!251531 d!61067))

(declare-fun d!61069 () Bool)

(assert (=> d!61069 (= (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) index!297)) (and (not (= (select (arr!5836 (_keys!6786 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5836 (_keys!6786 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251491 d!61069))

(assert (=> b!251417 d!61035))

(assert (=> b!251417 d!61037))

(assert (=> b!251519 d!61031))

(declare-fun d!61071 () Bool)

(assert (=> d!61071 (= (inRange!0 (ite c!42296 (index!6670 lt!125862) (index!6673 lt!125862)) (mask!10845 thiss!1504)) (and (bvsge (ite c!42296 (index!6670 lt!125862) (index!6673 lt!125862)) #b00000000000000000000000000000000) (bvslt (ite c!42296 (index!6670 lt!125862) (index!6673 lt!125862)) (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23637 d!61071))

(declare-fun b!251663 () Bool)

(declare-fun e!163195 () Bool)

(declare-fun call!23679 () Bool)

(assert (=> b!251663 (= e!163195 call!23679)))

(declare-fun b!251664 () Bool)

(declare-fun e!163198 () Bool)

(assert (=> b!251664 (= e!163198 (contains!1805 (ite c!42336 (Cons!3709 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) Nil!3710) Nil!3710) (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251665 () Bool)

(declare-fun e!163196 () Bool)

(assert (=> b!251665 (= e!163196 e!163195)))

(declare-fun c!42381 () Bool)

(assert (=> b!251665 (= c!42381 (validKeyInArray!0 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251666 () Bool)

(assert (=> b!251666 (= e!163195 call!23679)))

(declare-fun d!61073 () Bool)

(declare-fun res!123163 () Bool)

(declare-fun e!163197 () Bool)

(assert (=> d!61073 (=> res!123163 e!163197)))

(assert (=> d!61073 (= res!123163 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 lt!125787)))))

(assert (=> d!61073 (= (arrayNoDuplicates!0 lt!125787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42336 (Cons!3709 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) Nil!3710) Nil!3710)) e!163197)))

(declare-fun bm!23676 () Bool)

(assert (=> bm!23676 (= call!23679 (arrayNoDuplicates!0 lt!125787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42381 (Cons!3709 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!42336 (Cons!3709 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) Nil!3710) Nil!3710)) (ite c!42336 (Cons!3709 (select (arr!5836 lt!125787) #b00000000000000000000000000000000) Nil!3710) Nil!3710))))))

(declare-fun b!251667 () Bool)

(assert (=> b!251667 (= e!163197 e!163196)))

(declare-fun res!123162 () Bool)

(assert (=> b!251667 (=> (not res!123162) (not e!163196))))

(assert (=> b!251667 (= res!123162 (not e!163198))))

(declare-fun res!123164 () Bool)

(assert (=> b!251667 (=> (not res!123164) (not e!163198))))

(assert (=> b!251667 (= res!123164 (validKeyInArray!0 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!61073 (not res!123163)) b!251667))

(assert (= (and b!251667 res!123164) b!251664))

(assert (= (and b!251667 res!123162) b!251665))

(assert (= (and b!251665 c!42381) b!251663))

(assert (= (and b!251665 (not c!42381)) b!251666))

(assert (= (or b!251663 b!251666) bm!23676))

(declare-fun m!267425 () Bool)

(assert (=> b!251664 m!267425))

(assert (=> b!251664 m!267425))

(declare-fun m!267427 () Bool)

(assert (=> b!251664 m!267427))

(assert (=> b!251665 m!267425))

(assert (=> b!251665 m!267425))

(declare-fun m!267429 () Bool)

(assert (=> b!251665 m!267429))

(assert (=> bm!23676 m!267425))

(declare-fun m!267431 () Bool)

(assert (=> bm!23676 m!267431))

(assert (=> b!251667 m!267425))

(assert (=> b!251667 m!267425))

(assert (=> b!251667 m!267429))

(assert (=> bm!23665 d!61073))

(declare-fun d!61075 () Bool)

(declare-fun e!163201 () Bool)

(assert (=> d!61075 e!163201))

(declare-fun res!123169 () Bool)

(assert (=> d!61075 (=> (not res!123169) (not e!163201))))

(declare-fun lt!126029 () ListLongMap!3717)

(assert (=> d!61075 (= res!123169 (contains!1803 lt!126029 (_1!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(declare-fun lt!126028 () List!3714)

(assert (=> d!61075 (= lt!126029 (ListLongMap!3718 lt!126028))))

(declare-fun lt!126030 () Unit!7753)

(declare-fun lt!126031 () Unit!7753)

(assert (=> d!61075 (= lt!126030 lt!126031)))

(assert (=> d!61075 (= (getValueByKey!298 lt!126028 (_1!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))) (Some!303 (_2!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!161 (List!3714 (_ BitVec 64) V!8313) Unit!7753)

(assert (=> d!61075 (= lt!126031 (lemmaContainsTupThenGetReturnValue!161 lt!126028 (_1!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (_2!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(declare-fun insertStrictlySorted!164 (List!3714 (_ BitVec 64) V!8313) List!3714)

(assert (=> d!61075 (= lt!126028 (insertStrictlySorted!164 (toList!1874 (ite c!42322 call!23662 (ite c!42323 call!23659 call!23656))) (_1!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (_2!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(assert (=> d!61075 (= (+!675 (ite c!42322 call!23662 (ite c!42323 call!23659 call!23656)) (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) lt!126029)))

(declare-fun b!251672 () Bool)

(declare-fun res!123170 () Bool)

(assert (=> b!251672 (=> (not res!123170) (not e!163201))))

(assert (=> b!251672 (= res!123170 (= (getValueByKey!298 (toList!1874 lt!126029) (_1!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))) (Some!303 (_2!2418 (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))))

(declare-fun b!251673 () Bool)

(declare-fun contains!1806 (List!3714 tuple2!4814) Bool)

(assert (=> b!251673 (= e!163201 (contains!1806 (toList!1874 lt!126029) (ite (or c!42322 c!42323) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(assert (= (and d!61075 res!123169) b!251672))

(assert (= (and b!251672 res!123170) b!251673))

(declare-fun m!267433 () Bool)

(assert (=> d!61075 m!267433))

(declare-fun m!267435 () Bool)

(assert (=> d!61075 m!267435))

(declare-fun m!267437 () Bool)

(assert (=> d!61075 m!267437))

(declare-fun m!267439 () Bool)

(assert (=> d!61075 m!267439))

(declare-fun m!267441 () Bool)

(assert (=> b!251672 m!267441))

(declare-fun m!267443 () Bool)

(assert (=> b!251673 m!267443))

(assert (=> bm!23655 d!61075))

(assert (=> d!60987 d!61005))

(assert (=> d!60987 d!61007))

(declare-fun d!61077 () Bool)

(assert (=> d!61077 (contains!1803 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932)))

(assert (=> d!61077 true))

(declare-fun _$17!80 () Unit!7753)

(assert (=> d!61077 (= (choose!1201 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) _$17!80)))

(declare-fun bs!8989 () Bool)

(assert (= bs!8989 d!61077))

(assert (=> bs!8989 m!267065))

(assert (=> bs!8989 m!267065))

(assert (=> bs!8989 m!267067))

(assert (=> d!60987 d!61077))

(assert (=> d!60987 d!61013))

(declare-fun b!251692 () Bool)

(declare-fun lt!126036 () SeekEntryResult!1125)

(assert (=> b!251692 (and (bvsge (index!6672 lt!126036) #b00000000000000000000000000000000) (bvslt (index!6672 lt!126036) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun e!163214 () Bool)

(assert (=> b!251692 (= e!163214 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6672 lt!126036)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!61079 () Bool)

(declare-fun e!163212 () Bool)

(assert (=> d!61079 e!163212))

(declare-fun c!42389 () Bool)

(assert (=> d!61079 (= c!42389 (and ((_ is Intermediate!1125) lt!126036) (undefined!1937 lt!126036)))))

(declare-fun e!163216 () SeekEntryResult!1125)

(assert (=> d!61079 (= lt!126036 e!163216)))

(declare-fun c!42390 () Bool)

(assert (=> d!61079 (= c!42390 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!126037 () (_ BitVec 64))

(assert (=> d!61079 (= lt!126037 (select (arr!5836 (_keys!6786 thiss!1504)) (toIndex!0 key!932 (mask!10845 thiss!1504))))))

(assert (=> d!61079 (validMask!0 (mask!10845 thiss!1504))))

(assert (=> d!61079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10845 thiss!1504)) key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)) lt!126036)))

(declare-fun b!251693 () Bool)

(assert (=> b!251693 (and (bvsge (index!6672 lt!126036) #b00000000000000000000000000000000) (bvslt (index!6672 lt!126036) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun res!123179 () Bool)

(assert (=> b!251693 (= res!123179 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6672 lt!126036)) key!932))))

(assert (=> b!251693 (=> res!123179 e!163214)))

(declare-fun e!163213 () Bool)

(assert (=> b!251693 (= e!163213 e!163214)))

(declare-fun b!251694 () Bool)

(declare-fun e!163215 () SeekEntryResult!1125)

(assert (=> b!251694 (= e!163215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10845 thiss!1504)) #b00000000000000000000000000000000 (mask!10845 thiss!1504)) key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun b!251695 () Bool)

(assert (=> b!251695 (= e!163212 e!163213)))

(declare-fun res!123178 () Bool)

(assert (=> b!251695 (= res!123178 (and ((_ is Intermediate!1125) lt!126036) (not (undefined!1937 lt!126036)) (bvslt (x!24718 lt!126036) #b01111111111111111111111111111110) (bvsge (x!24718 lt!126036) #b00000000000000000000000000000000) (bvsge (x!24718 lt!126036) #b00000000000000000000000000000000)))))

(assert (=> b!251695 (=> (not res!123178) (not e!163213))))

(declare-fun b!251696 () Bool)

(assert (=> b!251696 (= e!163216 (Intermediate!1125 true (toIndex!0 key!932 (mask!10845 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251697 () Bool)

(assert (=> b!251697 (= e!163215 (Intermediate!1125 false (toIndex!0 key!932 (mask!10845 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251698 () Bool)

(assert (=> b!251698 (= e!163216 e!163215)))

(declare-fun c!42388 () Bool)

(assert (=> b!251698 (= c!42388 (or (= lt!126037 key!932) (= (bvadd lt!126037 lt!126037) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251699 () Bool)

(assert (=> b!251699 (= e!163212 (bvsge (x!24718 lt!126036) #b01111111111111111111111111111110))))

(declare-fun b!251700 () Bool)

(assert (=> b!251700 (and (bvsge (index!6672 lt!126036) #b00000000000000000000000000000000) (bvslt (index!6672 lt!126036) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun res!123177 () Bool)

(assert (=> b!251700 (= res!123177 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6672 lt!126036)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251700 (=> res!123177 e!163214)))

(assert (= (and d!61079 c!42390) b!251696))

(assert (= (and d!61079 (not c!42390)) b!251698))

(assert (= (and b!251698 c!42388) b!251697))

(assert (= (and b!251698 (not c!42388)) b!251694))

(assert (= (and d!61079 c!42389) b!251699))

(assert (= (and d!61079 (not c!42389)) b!251695))

(assert (= (and b!251695 res!123178) b!251693))

(assert (= (and b!251693 (not res!123179)) b!251700))

(assert (= (and b!251700 (not res!123177)) b!251692))

(assert (=> b!251694 m!267203))

(declare-fun m!267445 () Bool)

(assert (=> b!251694 m!267445))

(assert (=> b!251694 m!267445))

(declare-fun m!267447 () Bool)

(assert (=> b!251694 m!267447))

(assert (=> d!61079 m!267203))

(declare-fun m!267449 () Bool)

(assert (=> d!61079 m!267449))

(assert (=> d!61079 m!267035))

(declare-fun m!267451 () Bool)

(assert (=> b!251692 m!267451))

(assert (=> b!251700 m!267451))

(assert (=> b!251693 m!267451))

(assert (=> d!61001 d!61079))

(declare-fun d!61081 () Bool)

(declare-fun lt!126043 () (_ BitVec 32))

(declare-fun lt!126042 () (_ BitVec 32))

(assert (=> d!61081 (= lt!126043 (bvmul (bvxor lt!126042 (bvlshr lt!126042 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!61081 (= lt!126042 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!61081 (and (bvsge (mask!10845 thiss!1504) #b00000000000000000000000000000000) (let ((res!123180 (let ((h!4375 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24738 (bvmul (bvxor h!4375 (bvlshr h!4375 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24738 (bvlshr x!24738 #b00000000000000000000000000001101)) (mask!10845 thiss!1504)))))) (and (bvslt res!123180 (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!123180 #b00000000000000000000000000000000))))))

(assert (=> d!61081 (= (toIndex!0 key!932 (mask!10845 thiss!1504)) (bvand (bvxor lt!126043 (bvlshr lt!126043 #b00000000000000000000000000001101)) (mask!10845 thiss!1504)))))

(assert (=> d!61001 d!61081))

(assert (=> d!61001 d!61013))

(declare-fun b!251701 () Bool)

(declare-fun e!163218 () Bool)

(declare-fun e!163217 () Bool)

(assert (=> b!251701 (= e!163218 e!163217)))

(declare-fun c!42391 () Bool)

(assert (=> b!251701 (= c!42391 (validKeyInArray!0 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!61083 () Bool)

(declare-fun res!123182 () Bool)

(assert (=> d!61083 (=> res!123182 e!163218)))

(assert (=> d!61083 (= res!123182 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 lt!125787)))))

(assert (=> d!61083 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125787 (mask!10845 thiss!1504)) e!163218)))

(declare-fun bm!23677 () Bool)

(declare-fun call!23680 () Bool)

(assert (=> bm!23677 (= call!23680 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125787 (mask!10845 thiss!1504)))))

(declare-fun b!251702 () Bool)

(declare-fun e!163219 () Bool)

(assert (=> b!251702 (= e!163217 e!163219)))

(declare-fun lt!126045 () (_ BitVec 64))

(assert (=> b!251702 (= lt!126045 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!126044 () Unit!7753)

(assert (=> b!251702 (= lt!126044 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125787 lt!126045 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!251702 (arrayContainsKey!0 lt!125787 lt!126045 #b00000000000000000000000000000000)))

(declare-fun lt!126046 () Unit!7753)

(assert (=> b!251702 (= lt!126046 lt!126044)))

(declare-fun res!123181 () Bool)

(assert (=> b!251702 (= res!123181 (= (seekEntryOrOpen!0 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125787 (mask!10845 thiss!1504)) (Found!1125 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!251702 (=> (not res!123181) (not e!163219))))

(declare-fun b!251703 () Bool)

(assert (=> b!251703 (= e!163219 call!23680)))

(declare-fun b!251704 () Bool)

(assert (=> b!251704 (= e!163217 call!23680)))

(assert (= (and d!61083 (not res!123182)) b!251701))

(assert (= (and b!251701 c!42391) b!251702))

(assert (= (and b!251701 (not c!42391)) b!251704))

(assert (= (and b!251702 res!123181) b!251703))

(assert (= (or b!251703 b!251704) bm!23677))

(assert (=> b!251701 m!267425))

(assert (=> b!251701 m!267425))

(assert (=> b!251701 m!267429))

(declare-fun m!267453 () Bool)

(assert (=> bm!23677 m!267453))

(assert (=> b!251702 m!267425))

(declare-fun m!267455 () Bool)

(assert (=> b!251702 m!267455))

(declare-fun m!267457 () Bool)

(assert (=> b!251702 m!267457))

(assert (=> b!251702 m!267425))

(declare-fun m!267459 () Bool)

(assert (=> b!251702 m!267459))

(assert (=> bm!23668 d!61083))

(declare-fun d!61085 () Bool)

(declare-fun e!163220 () Bool)

(assert (=> d!61085 e!163220))

(declare-fun res!123183 () Bool)

(assert (=> d!61085 (=> (not res!123183) (not e!163220))))

(declare-fun lt!126048 () ListLongMap!3717)

(assert (=> d!61085 (= res!123183 (contains!1803 lt!126048 (_1!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))))))

(declare-fun lt!126047 () List!3714)

(assert (=> d!61085 (= lt!126048 (ListLongMap!3718 lt!126047))))

(declare-fun lt!126049 () Unit!7753)

(declare-fun lt!126050 () Unit!7753)

(assert (=> d!61085 (= lt!126049 lt!126050)))

(assert (=> d!61085 (= (getValueByKey!298 lt!126047 (_1!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))))))

(assert (=> d!61085 (= lt!126050 (lemmaContainsTupThenGetReturnValue!161 lt!126047 (_1!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))))))

(assert (=> d!61085 (= lt!126047 (insertStrictlySorted!164 (toList!1874 lt!125948) (_1!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))))))

(assert (=> d!61085 (= (+!675 lt!125948 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))) lt!126048)))

(declare-fun b!251705 () Bool)

(declare-fun res!123184 () Bool)

(assert (=> b!251705 (=> (not res!123184) (not e!163220))))

(assert (=> b!251705 (= res!123184 (= (getValueByKey!298 (toList!1874 lt!126048) (_1!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))))))))

(declare-fun b!251706 () Bool)

(assert (=> b!251706 (= e!163220 (contains!1806 (toList!1874 lt!126048) (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))))))

(assert (= (and d!61085 res!123183) b!251705))

(assert (= (and b!251705 res!123184) b!251706))

(declare-fun m!267461 () Bool)

(assert (=> d!61085 m!267461))

(declare-fun m!267463 () Bool)

(assert (=> d!61085 m!267463))

(declare-fun m!267465 () Bool)

(assert (=> d!61085 m!267465))

(declare-fun m!267467 () Bool)

(assert (=> d!61085 m!267467))

(declare-fun m!267469 () Bool)

(assert (=> b!251705 m!267469))

(declare-fun m!267471 () Bool)

(assert (=> b!251706 m!267471))

(assert (=> b!251464 d!61085))

(declare-fun d!61087 () Bool)

(declare-fun e!163221 () Bool)

(assert (=> d!61087 e!163221))

(declare-fun res!123185 () Bool)

(assert (=> d!61087 (=> (not res!123185) (not e!163221))))

(declare-fun lt!126052 () ListLongMap!3717)

(assert (=> d!61087 (= res!123185 (contains!1803 lt!126052 (_1!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))))))

(declare-fun lt!126051 () List!3714)

(assert (=> d!61087 (= lt!126052 (ListLongMap!3718 lt!126051))))

(declare-fun lt!126053 () Unit!7753)

(declare-fun lt!126054 () Unit!7753)

(assert (=> d!61087 (= lt!126053 lt!126054)))

(assert (=> d!61087 (= (getValueByKey!298 lt!126051 (_1!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61087 (= lt!126054 (lemmaContainsTupThenGetReturnValue!161 lt!126051 (_1!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61087 (= lt!126051 (insertStrictlySorted!164 (toList!1874 lt!125928) (_1!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61087 (= (+!675 lt!125928 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))) lt!126052)))

(declare-fun b!251707 () Bool)

(declare-fun res!123186 () Bool)

(assert (=> b!251707 (=> (not res!123186) (not e!163221))))

(assert (=> b!251707 (= res!123186 (= (getValueByKey!298 (toList!1874 lt!126052) (_1!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))))))))

(declare-fun b!251708 () Bool)

(assert (=> b!251708 (= e!163221 (contains!1806 (toList!1874 lt!126052) (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))))))

(assert (= (and d!61087 res!123185) b!251707))

(assert (= (and b!251707 res!123186) b!251708))

(declare-fun m!267473 () Bool)

(assert (=> d!61087 m!267473))

(declare-fun m!267475 () Bool)

(assert (=> d!61087 m!267475))

(declare-fun m!267477 () Bool)

(assert (=> d!61087 m!267477))

(declare-fun m!267479 () Bool)

(assert (=> d!61087 m!267479))

(declare-fun m!267481 () Bool)

(assert (=> b!251707 m!267481))

(declare-fun m!267483 () Bool)

(assert (=> b!251708 m!267483))

(assert (=> b!251464 d!61087))

(declare-fun d!61089 () Bool)

(assert (=> d!61089 (= (apply!242 (+!675 lt!125928 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))) lt!125937) (apply!242 lt!125928 lt!125937))))

(declare-fun lt!126057 () Unit!7753)

(declare-fun choose!1205 (ListLongMap!3717 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7753)

(assert (=> d!61089 (= lt!126057 (choose!1205 lt!125928 lt!125933 (zeroValue!4486 thiss!1504) lt!125937))))

(declare-fun e!163224 () Bool)

(assert (=> d!61089 e!163224))

(declare-fun res!123189 () Bool)

(assert (=> d!61089 (=> (not res!123189) (not e!163224))))

(assert (=> d!61089 (= res!123189 (contains!1803 lt!125928 lt!125937))))

(assert (=> d!61089 (= (addApplyDifferent!218 lt!125928 lt!125933 (zeroValue!4486 thiss!1504) lt!125937) lt!126057)))

(declare-fun b!251712 () Bool)

(assert (=> b!251712 (= e!163224 (not (= lt!125937 lt!125933)))))

(assert (= (and d!61089 res!123189) b!251712))

(assert (=> d!61089 m!267247))

(assert (=> d!61089 m!267247))

(assert (=> d!61089 m!267275))

(declare-fun m!267485 () Bool)

(assert (=> d!61089 m!267485))

(assert (=> d!61089 m!267271))

(declare-fun m!267487 () Bool)

(assert (=> d!61089 m!267487))

(assert (=> b!251464 d!61089))

(declare-fun d!61091 () Bool)

(assert (=> d!61091 (= (apply!242 lt!125928 lt!125937) (get!3001 (getValueByKey!298 (toList!1874 lt!125928) lt!125937)))))

(declare-fun bs!8990 () Bool)

(assert (= bs!8990 d!61091))

(declare-fun m!267489 () Bool)

(assert (=> bs!8990 m!267489))

(assert (=> bs!8990 m!267489))

(declare-fun m!267491 () Bool)

(assert (=> bs!8990 m!267491))

(assert (=> b!251464 d!61091))

(declare-fun d!61093 () Bool)

(assert (=> d!61093 (= (apply!242 (+!675 lt!125940 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))) lt!125934) (apply!242 lt!125940 lt!125934))))

(declare-fun lt!126058 () Unit!7753)

(assert (=> d!61093 (= lt!126058 (choose!1205 lt!125940 lt!125947 (minValue!4486 thiss!1504) lt!125934))))

(declare-fun e!163225 () Bool)

(assert (=> d!61093 e!163225))

(declare-fun res!123190 () Bool)

(assert (=> d!61093 (=> (not res!123190) (not e!163225))))

(assert (=> d!61093 (= res!123190 (contains!1803 lt!125940 lt!125934))))

(assert (=> d!61093 (= (addApplyDifferent!218 lt!125940 lt!125947 (minValue!4486 thiss!1504) lt!125934) lt!126058)))

(declare-fun b!251713 () Bool)

(assert (=> b!251713 (= e!163225 (not (= lt!125934 lt!125947)))))

(assert (= (and d!61093 res!123190) b!251713))

(assert (=> d!61093 m!267253))

(assert (=> d!61093 m!267253))

(assert (=> d!61093 m!267255))

(declare-fun m!267493 () Bool)

(assert (=> d!61093 m!267493))

(assert (=> d!61093 m!267257))

(declare-fun m!267495 () Bool)

(assert (=> d!61093 m!267495))

(assert (=> b!251464 d!61093))

(declare-fun d!61095 () Bool)

(assert (=> d!61095 (= (apply!242 (+!675 lt!125948 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))) lt!125931) (apply!242 lt!125948 lt!125931))))

(declare-fun lt!126059 () Unit!7753)

(assert (=> d!61095 (= lt!126059 (choose!1205 lt!125948 lt!125930 (minValue!4486 thiss!1504) lt!125931))))

(declare-fun e!163226 () Bool)

(assert (=> d!61095 e!163226))

(declare-fun res!123191 () Bool)

(assert (=> d!61095 (=> (not res!123191) (not e!163226))))

(assert (=> d!61095 (= res!123191 (contains!1803 lt!125948 lt!125931))))

(assert (=> d!61095 (= (addApplyDifferent!218 lt!125948 lt!125930 (minValue!4486 thiss!1504) lt!125931) lt!126059)))

(declare-fun b!251714 () Bool)

(assert (=> b!251714 (= e!163226 (not (= lt!125931 lt!125930)))))

(assert (= (and d!61095 res!123191) b!251714))

(assert (=> d!61095 m!267245))

(assert (=> d!61095 m!267245))

(assert (=> d!61095 m!267269))

(declare-fun m!267497 () Bool)

(assert (=> d!61095 m!267497))

(assert (=> d!61095 m!267263))

(declare-fun m!267499 () Bool)

(assert (=> d!61095 m!267499))

(assert (=> b!251464 d!61095))

(declare-fun d!61097 () Bool)

(assert (=> d!61097 (= (apply!242 (+!675 lt!125940 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))) lt!125934) (get!3001 (getValueByKey!298 (toList!1874 (+!675 lt!125940 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))) lt!125934)))))

(declare-fun bs!8991 () Bool)

(assert (= bs!8991 d!61097))

(declare-fun m!267501 () Bool)

(assert (=> bs!8991 m!267501))

(assert (=> bs!8991 m!267501))

(declare-fun m!267503 () Bool)

(assert (=> bs!8991 m!267503))

(assert (=> b!251464 d!61097))

(assert (=> b!251464 d!61041))

(declare-fun d!61099 () Bool)

(declare-fun e!163227 () Bool)

(assert (=> d!61099 e!163227))

(declare-fun res!123192 () Bool)

(assert (=> d!61099 (=> (not res!123192) (not e!163227))))

(declare-fun lt!126061 () ListLongMap!3717)

(assert (=> d!61099 (= res!123192 (contains!1803 lt!126061 (_1!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))))))

(declare-fun lt!126060 () List!3714)

(assert (=> d!61099 (= lt!126061 (ListLongMap!3718 lt!126060))))

(declare-fun lt!126062 () Unit!7753)

(declare-fun lt!126063 () Unit!7753)

(assert (=> d!61099 (= lt!126062 lt!126063)))

(assert (=> d!61099 (= (getValueByKey!298 lt!126060 (_1!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))))))

(assert (=> d!61099 (= lt!126063 (lemmaContainsTupThenGetReturnValue!161 lt!126060 (_1!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))))))

(assert (=> d!61099 (= lt!126060 (insertStrictlySorted!164 (toList!1874 lt!125940) (_1!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))))))

(assert (=> d!61099 (= (+!675 lt!125940 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))) lt!126061)))

(declare-fun b!251715 () Bool)

(declare-fun res!123193 () Bool)

(assert (=> b!251715 (=> (not res!123193) (not e!163227))))

(assert (=> b!251715 (= res!123193 (= (getValueByKey!298 (toList!1874 lt!126061) (_1!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))))))))

(declare-fun b!251716 () Bool)

(assert (=> b!251716 (= e!163227 (contains!1806 (toList!1874 lt!126061) (tuple2!4815 lt!125947 (minValue!4486 thiss!1504))))))

(assert (= (and d!61099 res!123192) b!251715))

(assert (= (and b!251715 res!123193) b!251716))

(declare-fun m!267505 () Bool)

(assert (=> d!61099 m!267505))

(declare-fun m!267507 () Bool)

(assert (=> d!61099 m!267507))

(declare-fun m!267509 () Bool)

(assert (=> d!61099 m!267509))

(declare-fun m!267511 () Bool)

(assert (=> d!61099 m!267511))

(declare-fun m!267513 () Bool)

(assert (=> b!251715 m!267513))

(declare-fun m!267515 () Bool)

(assert (=> b!251716 m!267515))

(assert (=> b!251464 d!61099))

(declare-fun d!61101 () Bool)

(assert (=> d!61101 (= (apply!242 lt!125948 lt!125931) (get!3001 (getValueByKey!298 (toList!1874 lt!125948) lt!125931)))))

(declare-fun bs!8992 () Bool)

(assert (= bs!8992 d!61101))

(declare-fun m!267517 () Bool)

(assert (=> bs!8992 m!267517))

(assert (=> bs!8992 m!267517))

(declare-fun m!267519 () Bool)

(assert (=> bs!8992 m!267519))

(assert (=> b!251464 d!61101))

(declare-fun d!61103 () Bool)

(assert (=> d!61103 (= (apply!242 (+!675 lt!125948 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504))) lt!125931) (get!3001 (getValueByKey!298 (toList!1874 (+!675 lt!125948 (tuple2!4815 lt!125930 (minValue!4486 thiss!1504)))) lt!125931)))))

(declare-fun bs!8993 () Bool)

(assert (= bs!8993 d!61103))

(declare-fun m!267521 () Bool)

(assert (=> bs!8993 m!267521))

(assert (=> bs!8993 m!267521))

(declare-fun m!267523 () Bool)

(assert (=> bs!8993 m!267523))

(assert (=> b!251464 d!61103))

(declare-fun d!61105 () Bool)

(assert (=> d!61105 (contains!1803 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))) lt!125936)))

(declare-fun lt!126066 () Unit!7753)

(declare-fun choose!1206 (ListLongMap!3717 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7753)

(assert (=> d!61105 (= lt!126066 (choose!1206 lt!125944 lt!125943 (zeroValue!4486 thiss!1504) lt!125936))))

(assert (=> d!61105 (contains!1803 lt!125944 lt!125936)))

(assert (=> d!61105 (= (addStillContains!218 lt!125944 lt!125943 (zeroValue!4486 thiss!1504) lt!125936) lt!126066)))

(declare-fun bs!8994 () Bool)

(assert (= bs!8994 d!61105))

(assert (=> bs!8994 m!267251))

(assert (=> bs!8994 m!267251))

(assert (=> bs!8994 m!267267))

(declare-fun m!267525 () Bool)

(assert (=> bs!8994 m!267525))

(declare-fun m!267527 () Bool)

(assert (=> bs!8994 m!267527))

(assert (=> b!251464 d!61105))

(declare-fun d!61107 () Bool)

(assert (=> d!61107 (= (apply!242 (+!675 lt!125928 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504))) lt!125937) (get!3001 (getValueByKey!298 (toList!1874 (+!675 lt!125928 (tuple2!4815 lt!125933 (zeroValue!4486 thiss!1504)))) lt!125937)))))

(declare-fun bs!8995 () Bool)

(assert (= bs!8995 d!61107))

(declare-fun m!267529 () Bool)

(assert (=> bs!8995 m!267529))

(assert (=> bs!8995 m!267529))

(declare-fun m!267531 () Bool)

(assert (=> bs!8995 m!267531))

(assert (=> b!251464 d!61107))

(declare-fun d!61109 () Bool)

(declare-fun e!163228 () Bool)

(assert (=> d!61109 e!163228))

(declare-fun res!123194 () Bool)

(assert (=> d!61109 (=> (not res!123194) (not e!163228))))

(declare-fun lt!126068 () ListLongMap!3717)

(assert (=> d!61109 (= res!123194 (contains!1803 lt!126068 (_1!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))))))

(declare-fun lt!126067 () List!3714)

(assert (=> d!61109 (= lt!126068 (ListLongMap!3718 lt!126067))))

(declare-fun lt!126069 () Unit!7753)

(declare-fun lt!126070 () Unit!7753)

(assert (=> d!61109 (= lt!126069 lt!126070)))

(assert (=> d!61109 (= (getValueByKey!298 lt!126067 (_1!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61109 (= lt!126070 (lemmaContainsTupThenGetReturnValue!161 lt!126067 (_1!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61109 (= lt!126067 (insertStrictlySorted!164 (toList!1874 lt!125944) (_1!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61109 (= (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))) lt!126068)))

(declare-fun b!251718 () Bool)

(declare-fun res!123195 () Bool)

(assert (=> b!251718 (=> (not res!123195) (not e!163228))))

(assert (=> b!251718 (= res!123195 (= (getValueByKey!298 (toList!1874 lt!126068) (_1!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))))))))

(declare-fun b!251719 () Bool)

(assert (=> b!251719 (= e!163228 (contains!1806 (toList!1874 lt!126068) (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))))))

(assert (= (and d!61109 res!123194) b!251718))

(assert (= (and b!251718 res!123195) b!251719))

(declare-fun m!267533 () Bool)

(assert (=> d!61109 m!267533))

(declare-fun m!267535 () Bool)

(assert (=> d!61109 m!267535))

(declare-fun m!267537 () Bool)

(assert (=> d!61109 m!267537))

(declare-fun m!267539 () Bool)

(assert (=> d!61109 m!267539))

(declare-fun m!267541 () Bool)

(assert (=> b!251718 m!267541))

(declare-fun m!267543 () Bool)

(assert (=> b!251719 m!267543))

(assert (=> b!251464 d!61109))

(declare-fun d!61111 () Bool)

(declare-fun e!163229 () Bool)

(assert (=> d!61111 e!163229))

(declare-fun res!123196 () Bool)

(assert (=> d!61111 (=> res!123196 e!163229)))

(declare-fun lt!126071 () Bool)

(assert (=> d!61111 (= res!123196 (not lt!126071))))

(declare-fun lt!126074 () Bool)

(assert (=> d!61111 (= lt!126071 lt!126074)))

(declare-fun lt!126072 () Unit!7753)

(declare-fun e!163230 () Unit!7753)

(assert (=> d!61111 (= lt!126072 e!163230)))

(declare-fun c!42392 () Bool)

(assert (=> d!61111 (= c!42392 lt!126074)))

(assert (=> d!61111 (= lt!126074 (containsKey!290 (toList!1874 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))) lt!125936))))

(assert (=> d!61111 (= (contains!1803 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504))) lt!125936) lt!126071)))

(declare-fun b!251720 () Bool)

(declare-fun lt!126073 () Unit!7753)

(assert (=> b!251720 (= e!163230 lt!126073)))

(assert (=> b!251720 (= lt!126073 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1874 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))) lt!125936))))

(assert (=> b!251720 (isDefined!240 (getValueByKey!298 (toList!1874 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))) lt!125936))))

(declare-fun b!251721 () Bool)

(declare-fun Unit!7771 () Unit!7753)

(assert (=> b!251721 (= e!163230 Unit!7771)))

(declare-fun b!251722 () Bool)

(assert (=> b!251722 (= e!163229 (isDefined!240 (getValueByKey!298 (toList!1874 (+!675 lt!125944 (tuple2!4815 lt!125943 (zeroValue!4486 thiss!1504)))) lt!125936)))))

(assert (= (and d!61111 c!42392) b!251720))

(assert (= (and d!61111 (not c!42392)) b!251721))

(assert (= (and d!61111 (not res!123196)) b!251722))

(declare-fun m!267545 () Bool)

(assert (=> d!61111 m!267545))

(declare-fun m!267547 () Bool)

(assert (=> b!251720 m!267547))

(declare-fun m!267549 () Bool)

(assert (=> b!251720 m!267549))

(assert (=> b!251720 m!267549))

(declare-fun m!267551 () Bool)

(assert (=> b!251720 m!267551))

(assert (=> b!251722 m!267549))

(assert (=> b!251722 m!267549))

(assert (=> b!251722 m!267551))

(assert (=> b!251464 d!61111))

(declare-fun d!61113 () Bool)

(assert (=> d!61113 (= (apply!242 lt!125940 lt!125934) (get!3001 (getValueByKey!298 (toList!1874 lt!125940) lt!125934)))))

(declare-fun bs!8996 () Bool)

(assert (= bs!8996 d!61113))

(declare-fun m!267553 () Bool)

(assert (=> bs!8996 m!267553))

(assert (=> bs!8996 m!267553))

(declare-fun m!267555 () Bool)

(assert (=> bs!8996 m!267555))

(assert (=> b!251464 d!61113))

(assert (=> d!61007 d!61013))

(declare-fun d!61115 () Bool)

(assert (=> d!61115 (arrayNoDuplicates!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000000 Nil!3710)))

(assert (=> d!61115 true))

(declare-fun _$65!83 () Unit!7753)

(assert (=> d!61115 (= (choose!41 (_keys!6786 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710) _$65!83)))

(declare-fun bs!8997 () Bool)

(assert (= bs!8997 d!61115))

(assert (=> bs!8997 m!267045))

(assert (=> bs!8997 m!267309))

(assert (=> d!61019 d!61115))

(assert (=> b!251475 d!61061))

(assert (=> d!60999 d!61001))

(declare-fun b!251739 () Bool)

(declare-fun res!123205 () Bool)

(declare-fun e!163239 () Bool)

(assert (=> b!251739 (=> (not res!123205) (not e!163239))))

(declare-fun lt!126077 () SeekEntryResult!1125)

(assert (=> b!251739 (= res!123205 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6673 lt!126077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251740 () Bool)

(declare-fun res!123206 () Bool)

(assert (=> b!251740 (= res!123206 (= (select (arr!5836 (_keys!6786 thiss!1504)) (index!6670 lt!126077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163240 () Bool)

(assert (=> b!251740 (=> (not res!123206) (not e!163240))))

(declare-fun bm!23682 () Bool)

(declare-fun call!23686 () Bool)

(assert (=> bm!23682 (= call!23686 (arrayContainsKey!0 (_keys!6786 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251741 () Bool)

(declare-fun e!163241 () Bool)

(assert (=> b!251741 (= e!163241 e!163240)))

(declare-fun res!123208 () Bool)

(declare-fun call!23685 () Bool)

(assert (=> b!251741 (= res!123208 call!23685)))

(assert (=> b!251741 (=> (not res!123208) (not e!163240))))

(declare-fun b!251742 () Bool)

(declare-fun res!123207 () Bool)

(assert (=> b!251742 (=> (not res!123207) (not e!163239))))

(assert (=> b!251742 (= res!123207 call!23685)))

(declare-fun e!163242 () Bool)

(assert (=> b!251742 (= e!163242 e!163239)))

(declare-fun bm!23683 () Bool)

(declare-fun c!42397 () Bool)

(assert (=> bm!23683 (= call!23685 (inRange!0 (ite c!42397 (index!6670 lt!126077) (index!6673 lt!126077)) (mask!10845 thiss!1504)))))

(declare-fun d!61117 () Bool)

(assert (=> d!61117 e!163241))

(assert (=> d!61117 (= c!42397 ((_ is MissingZero!1125) lt!126077))))

(assert (=> d!61117 (= lt!126077 (seekEntryOrOpen!0 key!932 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(assert (=> d!61117 true))

(declare-fun _$34!1116 () Unit!7753)

(assert (=> d!61117 (= (choose!1203 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) _$34!1116)))

(declare-fun b!251743 () Bool)

(assert (=> b!251743 (= e!163239 (not call!23686))))

(declare-fun b!251744 () Bool)

(assert (=> b!251744 (= e!163241 e!163242)))

(declare-fun c!42398 () Bool)

(assert (=> b!251744 (= c!42398 ((_ is MissingVacant!1125) lt!126077))))

(declare-fun b!251745 () Bool)

(assert (=> b!251745 (= e!163242 ((_ is Undefined!1125) lt!126077))))

(declare-fun b!251746 () Bool)

(assert (=> b!251746 (= e!163240 (not call!23686))))

(assert (= (and d!61117 c!42397) b!251741))

(assert (= (and d!61117 (not c!42397)) b!251744))

(assert (= (and b!251741 res!123208) b!251740))

(assert (= (and b!251740 res!123206) b!251746))

(assert (= (and b!251744 c!42398) b!251742))

(assert (= (and b!251744 (not c!42398)) b!251745))

(assert (= (and b!251742 res!123207) b!251739))

(assert (= (and b!251739 res!123205) b!251743))

(assert (= (or b!251741 b!251742) bm!23683))

(assert (= (or b!251746 b!251743) bm!23682))

(declare-fun m!267557 () Bool)

(assert (=> b!251740 m!267557))

(declare-fun m!267559 () Bool)

(assert (=> b!251739 m!267559))

(assert (=> d!61117 m!267057))

(assert (=> bm!23682 m!267037))

(declare-fun m!267561 () Bool)

(assert (=> bm!23683 m!267561))

(assert (=> d!60999 d!61117))

(assert (=> d!60999 d!61013))

(declare-fun d!61119 () Bool)

(declare-fun e!163243 () Bool)

(assert (=> d!61119 e!163243))

(declare-fun res!123209 () Bool)

(assert (=> d!61119 (=> res!123209 e!163243)))

(declare-fun lt!126078 () Bool)

(assert (=> d!61119 (= res!123209 (not lt!126078))))

(declare-fun lt!126081 () Bool)

(assert (=> d!61119 (= lt!126078 lt!126081)))

(declare-fun lt!126079 () Unit!7753)

(declare-fun e!163244 () Unit!7753)

(assert (=> d!61119 (= lt!126079 e!163244)))

(declare-fun c!42399 () Bool)

(assert (=> d!61119 (= c!42399 lt!126081)))

(assert (=> d!61119 (= lt!126081 (containsKey!290 (toList!1874 lt!125932) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61119 (= (contains!1803 lt!125932 #b1000000000000000000000000000000000000000000000000000000000000000) lt!126078)))

(declare-fun b!251747 () Bool)

(declare-fun lt!126080 () Unit!7753)

(assert (=> b!251747 (= e!163244 lt!126080)))

(assert (=> b!251747 (= lt!126080 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1874 lt!125932) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251747 (isDefined!240 (getValueByKey!298 (toList!1874 lt!125932) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251748 () Bool)

(declare-fun Unit!7772 () Unit!7753)

(assert (=> b!251748 (= e!163244 Unit!7772)))

(declare-fun b!251749 () Bool)

(assert (=> b!251749 (= e!163243 (isDefined!240 (getValueByKey!298 (toList!1874 lt!125932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61119 c!42399) b!251747))

(assert (= (and d!61119 (not c!42399)) b!251748))

(assert (= (and d!61119 (not res!123209)) b!251749))

(declare-fun m!267563 () Bool)

(assert (=> d!61119 m!267563))

(declare-fun m!267565 () Bool)

(assert (=> b!251747 m!267565))

(assert (=> b!251747 m!267365))

(assert (=> b!251747 m!267365))

(declare-fun m!267567 () Bool)

(assert (=> b!251747 m!267567))

(assert (=> b!251749 m!267365))

(assert (=> b!251749 m!267365))

(assert (=> b!251749 m!267567))

(assert (=> bm!23653 d!61119))

(declare-fun d!61121 () Bool)

(declare-fun res!123214 () Bool)

(declare-fun e!163249 () Bool)

(assert (=> d!61121 (=> res!123214 e!163249)))

(assert (=> d!61121 (= res!123214 (and ((_ is Cons!3710) (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (= (_1!2418 (h!4371 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)))))

(assert (=> d!61121 (= (containsKey!290 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932) e!163249)))

(declare-fun b!251754 () Bool)

(declare-fun e!163250 () Bool)

(assert (=> b!251754 (= e!163249 e!163250)))

(declare-fun res!123215 () Bool)

(assert (=> b!251754 (=> (not res!123215) (not e!163250))))

(assert (=> b!251754 (= res!123215 (and (or (not ((_ is Cons!3710) (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) (bvsle (_1!2418 (h!4371 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)) ((_ is Cons!3710) (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (bvslt (_1!2418 (h!4371 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)))))

(declare-fun b!251755 () Bool)

(assert (=> b!251755 (= e!163250 (containsKey!290 (t!8742 (toList!1874 (getCurrentListMap!1383 (_keys!6786 thiss!1504) (_values!4628 thiss!1504) (mask!10845 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) key!932))))

(assert (= (and d!61121 (not res!123214)) b!251754))

(assert (= (and b!251754 res!123215) b!251755))

(declare-fun m!267569 () Bool)

(assert (=> b!251755 m!267569))

(assert (=> d!61005 d!61121))

(declare-fun b!251756 () Bool)

(declare-fun e!163252 () Bool)

(declare-fun e!163251 () Bool)

(assert (=> b!251756 (= e!163252 e!163251)))

(declare-fun c!42400 () Bool)

(assert (=> b!251756 (= c!42400 (validKeyInArray!0 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!61123 () Bool)

(declare-fun res!123217 () Bool)

(assert (=> d!61123 (=> res!123217 e!163252)))

(assert (=> d!61123 (= res!123217 (bvsge #b00000000000000000000000000000000 (size!6183 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))))))))

(assert (=> d!61123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (mask!10845 thiss!1504)) e!163252)))

(declare-fun bm!23684 () Bool)

(declare-fun call!23687 () Bool)

(assert (=> bm!23684 (= call!23687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (mask!10845 thiss!1504)))))

(declare-fun b!251757 () Bool)

(declare-fun e!163253 () Bool)

(assert (=> b!251757 (= e!163251 e!163253)))

(declare-fun lt!126083 () (_ BitVec 64))

(assert (=> b!251757 (= lt!126083 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!126082 () Unit!7753)

(assert (=> b!251757 (= lt!126082 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) lt!126083 #b00000000000000000000000000000000))))

(assert (=> b!251757 (arrayContainsKey!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) lt!126083 #b00000000000000000000000000000000)))

(declare-fun lt!126084 () Unit!7753)

(assert (=> b!251757 (= lt!126084 lt!126082)))

(declare-fun res!123216 () Bool)

(assert (=> b!251757 (= res!123216 (= (seekEntryOrOpen!0 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000) (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (mask!10845 thiss!1504)) (Found!1125 #b00000000000000000000000000000000)))))

(assert (=> b!251757 (=> (not res!123216) (not e!163253))))

(declare-fun b!251758 () Bool)

(assert (=> b!251758 (= e!163253 call!23687)))

(declare-fun b!251759 () Bool)

(assert (=> b!251759 (= e!163251 call!23687)))

(assert (= (and d!61123 (not res!123217)) b!251756))

(assert (= (and b!251756 c!42400) b!251757))

(assert (= (and b!251756 (not c!42400)) b!251759))

(assert (= (and b!251757 res!123216) b!251758))

(assert (= (or b!251758 b!251759) bm!23684))

(assert (=> b!251756 m!267395))

(assert (=> b!251756 m!267395))

(assert (=> b!251756 m!267399))

(declare-fun m!267571 () Bool)

(assert (=> bm!23684 m!267571))

(assert (=> b!251757 m!267395))

(declare-fun m!267573 () Bool)

(assert (=> b!251757 m!267573))

(declare-fun m!267575 () Bool)

(assert (=> b!251757 m!267575))

(assert (=> b!251757 m!267395))

(declare-fun m!267577 () Bool)

(assert (=> b!251757 m!267577))

(assert (=> b!251543 d!61123))

(assert (=> b!251521 d!61031))

(assert (=> bm!23638 d!60995))

(declare-fun d!61125 () Bool)

(declare-fun res!123226 () Bool)

(declare-fun e!163256 () Bool)

(assert (=> d!61125 (=> (not res!123226) (not e!163256))))

(assert (=> d!61125 (= res!123226 (validMask!0 (mask!10845 thiss!1504)))))

(assert (=> d!61125 (= (simpleValid!265 thiss!1504) e!163256)))

(declare-fun b!251771 () Bool)

(assert (=> b!251771 (= e!163256 (and (bvsge (extraKeys!4382 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4382 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1905 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!251770 () Bool)

(declare-fun res!123229 () Bool)

(assert (=> b!251770 (=> (not res!123229) (not e!163256))))

(declare-fun size!6188 (LongMapFixedSize!3712) (_ BitVec 32))

(assert (=> b!251770 (= res!123229 (= (size!6188 thiss!1504) (bvadd (_size!1905 thiss!1504) (bvsdiv (bvadd (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!251769 () Bool)

(declare-fun res!123228 () Bool)

(assert (=> b!251769 (=> (not res!123228) (not e!163256))))

(assert (=> b!251769 (= res!123228 (bvsge (size!6188 thiss!1504) (_size!1905 thiss!1504)))))

(declare-fun b!251768 () Bool)

(declare-fun res!123227 () Bool)

(assert (=> b!251768 (=> (not res!123227) (not e!163256))))

(assert (=> b!251768 (= res!123227 (and (= (size!6182 (_values!4628 thiss!1504)) (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001)) (= (size!6183 (_keys!6786 thiss!1504)) (size!6182 (_values!4628 thiss!1504))) (bvsge (_size!1905 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1905 thiss!1504) (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!61125 res!123226) b!251768))

(assert (= (and b!251768 res!123227) b!251769))

(assert (= (and b!251769 res!123228) b!251770))

(assert (= (and b!251770 res!123229) b!251771))

(assert (=> d!61125 m!267035))

(declare-fun m!267579 () Bool)

(assert (=> b!251770 m!267579))

(assert (=> b!251769 m!267579))

(assert (=> d!60985 d!61125))

(declare-fun b!251772 () Bool)

(declare-fun e!163258 () Bool)

(declare-fun e!163257 () Bool)

(assert (=> b!251772 (= e!163258 e!163257)))

(declare-fun c!42401 () Bool)

(assert (=> b!251772 (= c!42401 (validKeyInArray!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61127 () Bool)

(declare-fun res!123231 () Bool)

(assert (=> d!61127 (=> res!123231 e!163258)))

(assert (=> d!61127 (= res!123231 (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6786 thiss!1504) (mask!10845 thiss!1504)) e!163258)))

(declare-fun bm!23685 () Bool)

(declare-fun call!23688 () Bool)

(assert (=> bm!23685 (= call!23688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6786 thiss!1504) (mask!10845 thiss!1504)))))

(declare-fun b!251773 () Bool)

(declare-fun e!163259 () Bool)

(assert (=> b!251773 (= e!163257 e!163259)))

(declare-fun lt!126086 () (_ BitVec 64))

(assert (=> b!251773 (= lt!126086 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126085 () Unit!7753)

(assert (=> b!251773 (= lt!126085 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6786 thiss!1504) lt!126086 #b00000000000000000000000000000000))))

(assert (=> b!251773 (arrayContainsKey!0 (_keys!6786 thiss!1504) lt!126086 #b00000000000000000000000000000000)))

(declare-fun lt!126087 () Unit!7753)

(assert (=> b!251773 (= lt!126087 lt!126085)))

(declare-fun res!123230 () Bool)

(assert (=> b!251773 (= res!123230 (= (seekEntryOrOpen!0 (select (arr!5836 (_keys!6786 thiss!1504)) #b00000000000000000000000000000000) (_keys!6786 thiss!1504) (mask!10845 thiss!1504)) (Found!1125 #b00000000000000000000000000000000)))))

(assert (=> b!251773 (=> (not res!123230) (not e!163259))))

(declare-fun b!251774 () Bool)

(assert (=> b!251774 (= e!163259 call!23688)))

(declare-fun b!251775 () Bool)

(assert (=> b!251775 (= e!163257 call!23688)))

(assert (= (and d!61127 (not res!123231)) b!251772))

(assert (= (and b!251772 c!42401) b!251773))

(assert (= (and b!251772 (not c!42401)) b!251775))

(assert (= (and b!251773 res!123230) b!251774))

(assert (= (or b!251774 b!251775) bm!23685))

(assert (=> b!251772 m!267183))

(assert (=> b!251772 m!267183))

(assert (=> b!251772 m!267225))

(declare-fun m!267581 () Bool)

(assert (=> bm!23685 m!267581))

(assert (=> b!251773 m!267183))

(declare-fun m!267583 () Bool)

(assert (=> b!251773 m!267583))

(declare-fun m!267585 () Bool)

(assert (=> b!251773 m!267585))

(assert (=> b!251773 m!267183))

(declare-fun m!267587 () Bool)

(assert (=> b!251773 m!267587))

(assert (=> b!251353 d!61127))

(declare-fun d!61129 () Bool)

(assert (=> d!61129 (= (arrayCountValidKeys!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6786 thiss!1504) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!61129 true))

(declare-fun _$84!33 () Unit!7753)

(assert (=> d!61129 (= (choose!1 (_keys!6786 thiss!1504) index!297 key!932) _$84!33)))

(declare-fun bs!8998 () Bool)

(assert (= bs!8998 d!61129))

(assert (=> bs!8998 m!267045))

(assert (=> bs!8998 m!267279))

(assert (=> bs!8998 m!267047))

(assert (=> d!61009 d!61129))

(declare-fun d!61131 () Bool)

(declare-fun e!163260 () Bool)

(assert (=> d!61131 e!163260))

(declare-fun res!123232 () Bool)

(assert (=> d!61131 (=> (not res!123232) (not e!163260))))

(declare-fun lt!126089 () ListLongMap!3717)

(assert (=> d!61131 (= res!123232 (contains!1803 lt!126089 (_1!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(declare-fun lt!126088 () List!3714)

(assert (=> d!61131 (= lt!126089 (ListLongMap!3718 lt!126088))))

(declare-fun lt!126090 () Unit!7753)

(declare-fun lt!126091 () Unit!7753)

(assert (=> d!61131 (= lt!126090 lt!126091)))

(assert (=> d!61131 (= (getValueByKey!298 lt!126088 (_1!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(assert (=> d!61131 (= lt!126091 (lemmaContainsTupThenGetReturnValue!161 lt!126088 (_1!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(assert (=> d!61131 (= lt!126088 (insertStrictlySorted!164 (toList!1874 call!23657) (_1!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))) (_2!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(assert (=> d!61131 (= (+!675 call!23657 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))) lt!126089)))

(declare-fun b!251776 () Bool)

(declare-fun res!123233 () Bool)

(assert (=> b!251776 (=> (not res!123233) (not e!163260))))

(assert (=> b!251776 (= res!123233 (= (getValueByKey!298 (toList!1874 lt!126089) (_1!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (Some!303 (_2!2418 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(declare-fun b!251777 () Bool)

(assert (=> b!251777 (= e!163260 (contains!1806 (toList!1874 lt!126089) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))

(assert (= (and d!61131 res!123232) b!251776))

(assert (= (and b!251776 res!123233) b!251777))

(declare-fun m!267589 () Bool)

(assert (=> d!61131 m!267589))

(declare-fun m!267591 () Bool)

(assert (=> d!61131 m!267591))

(declare-fun m!267593 () Bool)

(assert (=> d!61131 m!267593))

(declare-fun m!267595 () Bool)

(assert (=> d!61131 m!267595))

(declare-fun m!267597 () Bool)

(assert (=> b!251776 m!267597))

(declare-fun m!267599 () Bool)

(assert (=> b!251777 m!267599))

(assert (=> b!251474 d!61131))

(declare-fun d!61133 () Bool)

(assert (=> d!61133 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251492 d!61133))

(assert (=> b!251466 d!61061))

(declare-fun d!61135 () Bool)

(declare-fun lt!126092 () (_ BitVec 32))

(assert (=> d!61135 (and (bvsge lt!126092 #b00000000000000000000000000000000) (bvsle lt!126092 (bvsub (size!6183 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!163262 () (_ BitVec 32))

(assert (=> d!61135 (= lt!126092 e!163262)))

(declare-fun c!42403 () Bool)

(assert (=> d!61135 (= c!42403 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61135 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6183 (_keys!6786 thiss!1504)) (size!6183 lt!125787)))))

(assert (=> d!61135 (= (arrayCountValidKeys!0 lt!125787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))) lt!126092)))

(declare-fun b!251778 () Bool)

(declare-fun e!163261 () (_ BitVec 32))

(declare-fun call!23689 () (_ BitVec 32))

(assert (=> b!251778 (= e!163261 (bvadd #b00000000000000000000000000000001 call!23689))))

(declare-fun bm!23686 () Bool)

(assert (=> bm!23686 (= call!23689 (arrayCountValidKeys!0 lt!125787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251779 () Bool)

(assert (=> b!251779 (= e!163262 #b00000000000000000000000000000000)))

(declare-fun b!251780 () Bool)

(assert (=> b!251780 (= e!163262 e!163261)))

(declare-fun c!42402 () Bool)

(assert (=> b!251780 (= c!42402 (validKeyInArray!0 (select (arr!5836 lt!125787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251781 () Bool)

(assert (=> b!251781 (= e!163261 call!23689)))

(assert (= (and d!61135 c!42403) b!251779))

(assert (= (and d!61135 (not c!42403)) b!251780))

(assert (= (and b!251780 c!42402) b!251778))

(assert (= (and b!251780 (not c!42402)) b!251781))

(assert (= (or b!251778 b!251781) bm!23686))

(declare-fun m!267601 () Bool)

(assert (=> bm!23686 m!267601))

(assert (=> b!251780 m!267425))

(assert (=> b!251780 m!267425))

(assert (=> b!251780 m!267429))

(assert (=> bm!23669 d!61135))

(declare-fun d!61137 () Bool)

(declare-fun lt!126095 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!167 (List!3713) (InoxSet (_ BitVec 64)))

(assert (=> d!61137 (= lt!126095 (select (content!167 Nil!3710) (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun e!163268 () Bool)

(assert (=> d!61137 (= lt!126095 e!163268)))

(declare-fun res!123238 () Bool)

(assert (=> d!61137 (=> (not res!123238) (not e!163268))))

(assert (=> d!61137 (= res!123238 ((_ is Cons!3709) Nil!3710))))

(assert (=> d!61137 (= (contains!1805 Nil!3710 (select (arr!5836 lt!125787) #b00000000000000000000000000000000)) lt!126095)))

(declare-fun b!251786 () Bool)

(declare-fun e!163267 () Bool)

(assert (=> b!251786 (= e!163268 e!163267)))

(declare-fun res!123239 () Bool)

(assert (=> b!251786 (=> res!123239 e!163267)))

(assert (=> b!251786 (= res!123239 (= (h!4370 Nil!3710) (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(declare-fun b!251787 () Bool)

(assert (=> b!251787 (= e!163267 (contains!1805 (t!8741 Nil!3710) (select (arr!5836 lt!125787) #b00000000000000000000000000000000)))))

(assert (= (and d!61137 res!123238) b!251786))

(assert (= (and b!251786 (not res!123239)) b!251787))

(declare-fun m!267603 () Bool)

(assert (=> d!61137 m!267603))

(assert (=> d!61137 m!267291))

(declare-fun m!267605 () Bool)

(assert (=> d!61137 m!267605))

(assert (=> b!251787 m!267291))

(declare-fun m!267607 () Bool)

(assert (=> b!251787 m!267607))

(assert (=> b!251518 d!61137))

(declare-fun d!61139 () Bool)

(declare-fun lt!126096 () (_ BitVec 32))

(assert (=> d!61139 (and (bvsge lt!126096 #b00000000000000000000000000000000) (bvsle lt!126096 (bvsub (size!6183 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!163270 () (_ BitVec 32))

(assert (=> d!61139 (= lt!126096 e!163270)))

(declare-fun c!42405 () Bool)

(assert (=> d!61139 (= c!42405 (bvsge #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))))))

(assert (=> d!61139 (and (bvsle #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6183 (_keys!6786 thiss!1504)) (size!6183 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))))))))

(assert (=> d!61139 (= (arrayCountValidKeys!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) #b00000000000000000000000000000000 (size!6183 (_keys!6786 thiss!1504))) lt!126096)))

(declare-fun b!251788 () Bool)

(declare-fun e!163269 () (_ BitVec 32))

(declare-fun call!23690 () (_ BitVec 32))

(assert (=> b!251788 (= e!163269 (bvadd #b00000000000000000000000000000001 call!23690))))

(declare-fun bm!23687 () Bool)

(assert (=> bm!23687 (= call!23690 (arrayCountValidKeys!0 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6183 (_keys!6786 thiss!1504))))))

(declare-fun b!251789 () Bool)

(assert (=> b!251789 (= e!163270 #b00000000000000000000000000000000)))

(declare-fun b!251790 () Bool)

(assert (=> b!251790 (= e!163270 e!163269)))

(declare-fun c!42404 () Bool)

(assert (=> b!251790 (= c!42404 (validKeyInArray!0 (select (arr!5836 (array!12314 (store (arr!5836 (_keys!6786 thiss!1504)) index!297 key!932) (size!6183 (_keys!6786 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251791 () Bool)

(assert (=> b!251791 (= e!163269 call!23690)))

(assert (= (and d!61139 c!42405) b!251789))

(assert (= (and d!61139 (not c!42405)) b!251790))

(assert (= (and b!251790 c!42404) b!251788))

(assert (= (and b!251790 (not c!42404)) b!251791))

(assert (= (or b!251788 b!251791) bm!23687))

(declare-fun m!267609 () Bool)

(assert (=> bm!23687 m!267609))

(assert (=> b!251790 m!267395))

(assert (=> b!251790 m!267395))

(assert (=> b!251790 m!267399))

(assert (=> b!251494 d!61139))

(assert (=> b!251494 d!61011))

(assert (=> b!251539 d!61031))

(declare-fun d!61141 () Bool)

(assert (=> d!61141 (= (inRange!0 (index!6671 lt!125856) (mask!10845 thiss!1504)) (and (bvsge (index!6671 lt!125856) #b00000000000000000000000000000000) (bvslt (index!6671 lt!125856) (bvadd (mask!10845 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251365 d!61141))

(declare-fun mapIsEmpty!11058 () Bool)

(declare-fun mapRes!11058 () Bool)

(assert (=> mapIsEmpty!11058 mapRes!11058))

(declare-fun b!251792 () Bool)

(declare-fun e!163271 () Bool)

(assert (=> b!251792 (= e!163271 tp_is_empty!6499)))

(declare-fun b!251793 () Bool)

(declare-fun e!163272 () Bool)

(assert (=> b!251793 (= e!163272 tp_is_empty!6499)))

(declare-fun condMapEmpty!11058 () Bool)

(declare-fun mapDefault!11058 () ValueCell!2906)

(assert (=> mapNonEmpty!11057 (= condMapEmpty!11058 (= mapRest!11057 ((as const (Array (_ BitVec 32) ValueCell!2906)) mapDefault!11058)))))

(assert (=> mapNonEmpty!11057 (= tp!23198 (and e!163272 mapRes!11058))))

(declare-fun mapNonEmpty!11058 () Bool)

(declare-fun tp!23199 () Bool)

(assert (=> mapNonEmpty!11058 (= mapRes!11058 (and tp!23199 e!163271))))

(declare-fun mapKey!11058 () (_ BitVec 32))

(declare-fun mapRest!11058 () (Array (_ BitVec 32) ValueCell!2906))

(declare-fun mapValue!11058 () ValueCell!2906)

(assert (=> mapNonEmpty!11058 (= mapRest!11057 (store mapRest!11058 mapKey!11058 mapValue!11058))))

(assert (= (and mapNonEmpty!11057 condMapEmpty!11058) mapIsEmpty!11058))

(assert (= (and mapNonEmpty!11057 (not condMapEmpty!11058)) mapNonEmpty!11058))

(assert (= (and mapNonEmpty!11058 ((_ is ValueCellFull!2906) mapValue!11058)) b!251792))

(assert (= (and mapNonEmpty!11057 ((_ is ValueCellFull!2906) mapDefault!11058)) b!251793))

(declare-fun m!267611 () Bool)

(assert (=> mapNonEmpty!11058 m!267611))

(declare-fun b_lambda!8093 () Bool)

(assert (= b_lambda!8091 (or (and b!251218 b_free!6637) b_lambda!8093)))

(declare-fun b_lambda!8095 () Bool)

(assert (= b_lambda!8089 (or (and b!251218 b_free!6637) b_lambda!8095)))

(check-sat (not b!251646) (not b!251787) (not b!251780) (not bm!23676) (not b!251701) (not d!61099) (not b!251667) (not d!61103) (not d!61089) (not b!251607) (not b!251708) (not b!251756) (not b_next!6637) (not d!61063) b_and!13649 (not d!61137) (not b!251718) (not b!251755) (not b!251672) (not bm!23675) (not b!251749) (not d!61095) (not b!251660) (not d!61035) (not d!61077) (not bm!23672) (not d!61105) (not d!61101) (not bm!23674) (not d!61093) (not b!251665) (not bm!23684) (not b!251649) (not b!251638) (not d!61131) (not b!251574) tp_is_empty!6499 (not b!251716) (not d!61051) (not d!61117) (not d!61115) (not b!251715) (not b!251563) (not d!61119) (not d!61111) (not b!251770) (not b!251673) (not b!251722) (not d!61029) (not b!251707) (not bm!23683) (not d!61057) (not b!251652) (not bm!23685) (not b_lambda!8087) (not b!251610) (not d!61067) (not d!61027) (not b!251647) (not b!251757) (not b!251552) (not b!251777) (not mapNonEmpty!11058) (not d!61033) (not b!251705) (not b!251656) (not d!61075) (not b!251619) (not d!61041) (not b!251694) (not d!61085) (not b!251651) (not d!61049) (not b!251747) (not b!251654) (not b!251664) (not b!251618) (not d!61087) (not b!251559) (not b!251611) (not d!61129) (not b!251720) (not b!251602) (not b!251776) (not b!251790) (not b!251606) (not d!61091) (not b!251643) (not b!251769) (not d!61107) (not d!61109) (not bm!23682) (not b!251635) (not b!251640) (not d!61113) (not b!251554) (not d!61125) (not bm!23686) (not b!251577) (not b!251772) (not b!251719) (not d!61079) (not bm!23673) (not bm!23687) (not b!251773) (not b!251613) (not d!61045) (not b!251609) (not b!251706) (not b!251605) (not bm!23677) (not b_lambda!8095) (not b!251702) (not d!61043) (not d!61097) (not b_lambda!8093) (not d!61025))
(check-sat b_and!13649 (not b_next!6637))
