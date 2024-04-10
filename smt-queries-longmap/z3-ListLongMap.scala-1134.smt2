; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23330 () Bool)

(assert start!23330)

(declare-fun b!245340 () Bool)

(declare-fun b_free!6555 () Bool)

(declare-fun b_next!6555 () Bool)

(assert (=> b!245340 (= b_free!6555 (not b_next!6555))))

(declare-fun tp!22897 () Bool)

(declare-fun b_and!13543 () Bool)

(assert (=> b!245340 (= tp!22897 b_and!13543)))

(declare-fun b!245339 () Bool)

(declare-fun res!120346 () Bool)

(declare-fun e!159179 () Bool)

(assert (=> b!245339 (=> (not res!120346) (not e!159179))))

(declare-fun call!22899 () Bool)

(assert (=> b!245339 (= res!120346 call!22899)))

(declare-fun e!159170 () Bool)

(assert (=> b!245339 (= e!159170 e!159179)))

(declare-fun e!159177 () Bool)

(declare-fun tp_is_empty!6417 () Bool)

(declare-datatypes ((V!8203 0))(
  ( (V!8204 (val!3253 Int)) )
))
(declare-datatypes ((ValueCell!2865 0))(
  ( (ValueCellFull!2865 (v!5305 V!8203)) (EmptyCell!2865) )
))
(declare-datatypes ((array!12131 0))(
  ( (array!12132 (arr!5758 (Array (_ BitVec 32) ValueCell!2865)) (size!6100 (_ BitVec 32))) )
))
(declare-datatypes ((array!12133 0))(
  ( (array!12134 (arr!5759 (Array (_ BitVec 32) (_ BitVec 64))) (size!6101 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3630 0))(
  ( (LongMapFixedSize!3631 (defaultEntry!4540 Int) (mask!10649 (_ BitVec 32)) (extraKeys!4277 (_ BitVec 32)) (zeroValue!4381 V!8203) (minValue!4381 V!8203) (_size!1864 (_ BitVec 32)) (_keys!6654 array!12133) (_values!4523 array!12131) (_vacant!1864 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3630)

(declare-fun e!159180 () Bool)

(declare-fun array_inv!3805 (array!12133) Bool)

(declare-fun array_inv!3806 (array!12131) Bool)

(assert (=> b!245340 (= e!159180 (and tp!22897 tp_is_empty!6417 (array_inv!3805 (_keys!6654 thiss!1504)) (array_inv!3806 (_values!4523 thiss!1504)) e!159177))))

(declare-fun b!245341 () Bool)

(declare-fun e!159169 () Bool)

(declare-fun mapRes!10885 () Bool)

(assert (=> b!245341 (= e!159177 (and e!159169 mapRes!10885))))

(declare-fun condMapEmpty!10885 () Bool)

(declare-fun mapDefault!10885 () ValueCell!2865)

(assert (=> b!245341 (= condMapEmpty!10885 (= (arr!5758 (_values!4523 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2865)) mapDefault!10885)))))

(declare-fun b!245342 () Bool)

(declare-fun call!22898 () Bool)

(assert (=> b!245342 (= e!159179 (not call!22898))))

(declare-fun bm!22895 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22895 (= call!22898 (arrayContainsKey!0 (_keys!6654 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245343 () Bool)

(declare-fun res!120344 () Bool)

(declare-datatypes ((SeekEntryResult!1088 0))(
  ( (MissingZero!1088 (index!6522 (_ BitVec 32))) (Found!1088 (index!6523 (_ BitVec 32))) (Intermediate!1088 (undefined!1900 Bool) (index!6524 (_ BitVec 32)) (x!24418 (_ BitVec 32))) (Undefined!1088) (MissingVacant!1088 (index!6525 (_ BitVec 32))) )
))
(declare-fun lt!122867 () SeekEntryResult!1088)

(assert (=> b!245343 (= res!120344 (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6525 lt!122867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159171 () Bool)

(assert (=> b!245343 (=> (not res!120344) (not e!159171))))

(declare-fun res!120348 () Bool)

(declare-fun e!159173 () Bool)

(assert (=> start!23330 (=> (not res!120348) (not e!159173))))

(declare-fun valid!1420 (LongMapFixedSize!3630) Bool)

(assert (=> start!23330 (= res!120348 (valid!1420 thiss!1504))))

(assert (=> start!23330 e!159173))

(assert (=> start!23330 e!159180))

(assert (=> start!23330 true))

(declare-fun b!245344 () Bool)

(declare-fun e!159172 () Bool)

(assert (=> b!245344 (= e!159173 e!159172)))

(declare-fun res!120349 () Bool)

(assert (=> b!245344 (=> (not res!120349) (not e!159172))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!245344 (= res!120349 (or (= lt!122867 (MissingZero!1088 index!297)) (= lt!122867 (MissingVacant!1088 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12133 (_ BitVec 32)) SeekEntryResult!1088)

(assert (=> b!245344 (= lt!122867 (seekEntryOrOpen!0 key!932 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)))))

(declare-fun b!245345 () Bool)

(declare-datatypes ((Unit!7575 0))(
  ( (Unit!7576) )
))
(declare-fun e!159181 () Unit!7575)

(declare-fun Unit!7577 () Unit!7575)

(assert (=> b!245345 (= e!159181 Unit!7577)))

(declare-fun b!245346 () Bool)

(declare-fun e!159168 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245346 (= e!159168 (not (validMask!0 (mask!10649 thiss!1504))))))

(declare-fun lt!122863 () array!12133)

(declare-fun arrayCountValidKeys!0 (array!12133 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245346 (= (arrayCountValidKeys!0 lt!122863 #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6654 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504)))))))

(declare-fun lt!122865 () Unit!7575)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12133 (_ BitVec 32) (_ BitVec 64)) Unit!7575)

(assert (=> b!245346 (= lt!122865 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6654 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3668 0))(
  ( (Nil!3665) (Cons!3664 (h!4321 (_ BitVec 64)) (t!8681 List!3668)) )
))
(declare-fun arrayNoDuplicates!0 (array!12133 (_ BitVec 32) List!3668) Bool)

(assert (=> b!245346 (arrayNoDuplicates!0 lt!122863 #b00000000000000000000000000000000 Nil!3665)))

(assert (=> b!245346 (= lt!122863 (array!12134 (store (arr!5759 (_keys!6654 thiss!1504)) index!297 key!932) (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun lt!122864 () Unit!7575)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3668) Unit!7575)

(assert (=> b!245346 (= lt!122864 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6654 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3665))))

(declare-fun lt!122869 () Unit!7575)

(assert (=> b!245346 (= lt!122869 e!159181)))

(declare-fun c!40959 () Bool)

(assert (=> b!245346 (= c!40959 (arrayContainsKey!0 (_keys!6654 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10885 () Bool)

(assert (=> mapIsEmpty!10885 mapRes!10885))

(declare-fun b!245347 () Bool)

(declare-fun c!40960 () Bool)

(get-info :version)

(assert (=> b!245347 (= c!40960 ((_ is MissingVacant!1088) lt!122867))))

(declare-fun e!159176 () Bool)

(assert (=> b!245347 (= e!159170 e!159176)))

(declare-fun b!245348 () Bool)

(declare-fun e!159178 () Bool)

(assert (=> b!245348 (= e!159178 tp_is_empty!6417)))

(declare-fun b!245349 () Bool)

(declare-fun e!159174 () Unit!7575)

(declare-fun Unit!7578 () Unit!7575)

(assert (=> b!245349 (= e!159174 Unit!7578)))

(declare-fun lt!122870 () Unit!7575)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 64) Int) Unit!7575)

(assert (=> b!245349 (= lt!122870 (lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 (defaultEntry!4540 thiss!1504)))))

(assert (=> b!245349 false))

(declare-fun b!245350 () Bool)

(declare-fun res!120351 () Bool)

(assert (=> b!245350 (=> (not res!120351) (not e!159173))))

(assert (=> b!245350 (= res!120351 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!245351 () Bool)

(assert (=> b!245351 (= e!159176 e!159171)))

(declare-fun res!120350 () Bool)

(assert (=> b!245351 (= res!120350 call!22899)))

(assert (=> b!245351 (=> (not res!120350) (not e!159171))))

(declare-fun mapNonEmpty!10885 () Bool)

(declare-fun tp!22896 () Bool)

(assert (=> mapNonEmpty!10885 (= mapRes!10885 (and tp!22896 e!159178))))

(declare-fun mapValue!10885 () ValueCell!2865)

(declare-fun mapRest!10885 () (Array (_ BitVec 32) ValueCell!2865))

(declare-fun mapKey!10885 () (_ BitVec 32))

(assert (=> mapNonEmpty!10885 (= (arr!5758 (_values!4523 thiss!1504)) (store mapRest!10885 mapKey!10885 mapValue!10885))))

(declare-fun b!245352 () Bool)

(assert (=> b!245352 (= e!159171 (not call!22898))))

(declare-fun b!245353 () Bool)

(assert (=> b!245353 (= e!159169 tp_is_empty!6417)))

(declare-fun b!245354 () Bool)

(declare-fun Unit!7579 () Unit!7575)

(assert (=> b!245354 (= e!159181 Unit!7579)))

(declare-fun lt!122866 () Unit!7575)

(declare-fun lemmaArrayContainsKeyThenInListMap!174 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 64) (_ BitVec 32) Int) Unit!7575)

(assert (=> b!245354 (= lt!122866 (lemmaArrayContainsKeyThenInListMap!174 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(assert (=> b!245354 false))

(declare-fun bm!22896 () Bool)

(declare-fun c!40961 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22896 (= call!22899 (inRange!0 (ite c!40961 (index!6522 lt!122867) (index!6525 lt!122867)) (mask!10649 thiss!1504)))))

(declare-fun b!245355 () Bool)

(assert (=> b!245355 (= e!159172 e!159168)))

(declare-fun res!120345 () Bool)

(assert (=> b!245355 (=> (not res!120345) (not e!159168))))

(assert (=> b!245355 (= res!120345 (inRange!0 index!297 (mask!10649 thiss!1504)))))

(declare-fun lt!122862 () Unit!7575)

(assert (=> b!245355 (= lt!122862 e!159174)))

(declare-fun c!40962 () Bool)

(declare-datatypes ((tuple2!4786 0))(
  ( (tuple2!4787 (_1!2404 (_ BitVec 64)) (_2!2404 V!8203)) )
))
(declare-datatypes ((List!3669 0))(
  ( (Nil!3666) (Cons!3665 (h!4322 tuple2!4786) (t!8682 List!3669)) )
))
(declare-datatypes ((ListLongMap!3699 0))(
  ( (ListLongMap!3700 (toList!1865 List!3669)) )
))
(declare-fun contains!1773 (ListLongMap!3699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1393 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 32) Int) ListLongMap!3699)

(assert (=> b!245355 (= c!40962 (contains!1773 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)) key!932))))

(declare-fun b!245356 () Bool)

(declare-fun lt!122868 () Unit!7575)

(assert (=> b!245356 (= e!159174 lt!122868)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!377 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 64) Int) Unit!7575)

(assert (=> b!245356 (= lt!122868 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!377 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 (defaultEntry!4540 thiss!1504)))))

(assert (=> b!245356 (= c!40961 ((_ is MissingZero!1088) lt!122867))))

(assert (=> b!245356 e!159170))

(declare-fun b!245357 () Bool)

(declare-fun res!120347 () Bool)

(assert (=> b!245357 (=> (not res!120347) (not e!159179))))

(assert (=> b!245357 (= res!120347 (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6522 lt!122867)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245358 () Bool)

(assert (=> b!245358 (= e!159176 ((_ is Undefined!1088) lt!122867))))

(assert (= (and start!23330 res!120348) b!245350))

(assert (= (and b!245350 res!120351) b!245344))

(assert (= (and b!245344 res!120349) b!245355))

(assert (= (and b!245355 c!40962) b!245349))

(assert (= (and b!245355 (not c!40962)) b!245356))

(assert (= (and b!245356 c!40961) b!245339))

(assert (= (and b!245356 (not c!40961)) b!245347))

(assert (= (and b!245339 res!120346) b!245357))

(assert (= (and b!245357 res!120347) b!245342))

(assert (= (and b!245347 c!40960) b!245351))

(assert (= (and b!245347 (not c!40960)) b!245358))

(assert (= (and b!245351 res!120350) b!245343))

(assert (= (and b!245343 res!120344) b!245352))

(assert (= (or b!245339 b!245351) bm!22896))

(assert (= (or b!245342 b!245352) bm!22895))

(assert (= (and b!245355 res!120345) b!245346))

(assert (= (and b!245346 c!40959) b!245354))

(assert (= (and b!245346 (not c!40959)) b!245345))

(assert (= (and b!245341 condMapEmpty!10885) mapIsEmpty!10885))

(assert (= (and b!245341 (not condMapEmpty!10885)) mapNonEmpty!10885))

(assert (= (and mapNonEmpty!10885 ((_ is ValueCellFull!2865) mapValue!10885)) b!245348))

(assert (= (and b!245341 ((_ is ValueCellFull!2865) mapDefault!10885)) b!245353))

(assert (= b!245340 b!245341))

(assert (= start!23330 b!245340))

(declare-fun m!262953 () Bool)

(assert (=> mapNonEmpty!10885 m!262953))

(declare-fun m!262955 () Bool)

(assert (=> start!23330 m!262955))

(declare-fun m!262957 () Bool)

(assert (=> b!245344 m!262957))

(declare-fun m!262959 () Bool)

(assert (=> b!245349 m!262959))

(declare-fun m!262961 () Bool)

(assert (=> b!245343 m!262961))

(declare-fun m!262963 () Bool)

(assert (=> bm!22896 m!262963))

(declare-fun m!262965 () Bool)

(assert (=> b!245354 m!262965))

(declare-fun m!262967 () Bool)

(assert (=> b!245355 m!262967))

(declare-fun m!262969 () Bool)

(assert (=> b!245355 m!262969))

(assert (=> b!245355 m!262969))

(declare-fun m!262971 () Bool)

(assert (=> b!245355 m!262971))

(declare-fun m!262973 () Bool)

(assert (=> b!245356 m!262973))

(declare-fun m!262975 () Bool)

(assert (=> b!245346 m!262975))

(declare-fun m!262977 () Bool)

(assert (=> b!245346 m!262977))

(declare-fun m!262979 () Bool)

(assert (=> b!245346 m!262979))

(declare-fun m!262981 () Bool)

(assert (=> b!245346 m!262981))

(declare-fun m!262983 () Bool)

(assert (=> b!245346 m!262983))

(declare-fun m!262985 () Bool)

(assert (=> b!245346 m!262985))

(declare-fun m!262987 () Bool)

(assert (=> b!245346 m!262987))

(declare-fun m!262989 () Bool)

(assert (=> b!245346 m!262989))

(declare-fun m!262991 () Bool)

(assert (=> b!245357 m!262991))

(assert (=> bm!22895 m!262977))

(declare-fun m!262993 () Bool)

(assert (=> b!245340 m!262993))

(declare-fun m!262995 () Bool)

(assert (=> b!245340 m!262995))

(check-sat (not b!245354) (not b_next!6555) (not b!245356) (not b!245340) (not b!245346) (not bm!22895) (not b!245344) (not bm!22896) b_and!13543 (not mapNonEmpty!10885) tp_is_empty!6417 (not b!245355) (not start!23330) (not b!245349))
(check-sat b_and!13543 (not b_next!6555))
(get-model)

(declare-fun d!60181 () Bool)

(declare-fun res!120380 () Bool)

(declare-fun e!159228 () Bool)

(assert (=> d!60181 (=> res!120380 e!159228)))

(assert (=> d!60181 (= res!120380 (= (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60181 (= (arrayContainsKey!0 (_keys!6654 thiss!1504) key!932 #b00000000000000000000000000000000) e!159228)))

(declare-fun b!245423 () Bool)

(declare-fun e!159229 () Bool)

(assert (=> b!245423 (= e!159228 e!159229)))

(declare-fun res!120381 () Bool)

(assert (=> b!245423 (=> (not res!120381) (not e!159229))))

(assert (=> b!245423 (= res!120381 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245424 () Bool)

(assert (=> b!245424 (= e!159229 (arrayContainsKey!0 (_keys!6654 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60181 (not res!120380)) b!245423))

(assert (= (and b!245423 res!120381) b!245424))

(declare-fun m!263041 () Bool)

(assert (=> d!60181 m!263041))

(declare-fun m!263043 () Bool)

(assert (=> b!245424 m!263043))

(assert (=> bm!22895 d!60181))

(declare-fun d!60183 () Bool)

(assert (=> d!60183 (= (inRange!0 index!297 (mask!10649 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10649 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245355 d!60183))

(declare-fun d!60185 () Bool)

(declare-fun e!159235 () Bool)

(assert (=> d!60185 e!159235))

(declare-fun res!120384 () Bool)

(assert (=> d!60185 (=> res!120384 e!159235)))

(declare-fun lt!122909 () Bool)

(assert (=> d!60185 (= res!120384 (not lt!122909))))

(declare-fun lt!122907 () Bool)

(assert (=> d!60185 (= lt!122909 lt!122907)))

(declare-fun lt!122906 () Unit!7575)

(declare-fun e!159234 () Unit!7575)

(assert (=> d!60185 (= lt!122906 e!159234)))

(declare-fun c!40977 () Bool)

(assert (=> d!60185 (= c!40977 lt!122907)))

(declare-fun containsKey!280 (List!3669 (_ BitVec 64)) Bool)

(assert (=> d!60185 (= lt!122907 (containsKey!280 (toList!1865 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504))) key!932))))

(assert (=> d!60185 (= (contains!1773 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)) key!932) lt!122909)))

(declare-fun b!245431 () Bool)

(declare-fun lt!122908 () Unit!7575)

(assert (=> b!245431 (= e!159234 lt!122908)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!228 (List!3669 (_ BitVec 64)) Unit!7575)

(assert (=> b!245431 (= lt!122908 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1865 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504))) key!932))))

(declare-datatypes ((Option!294 0))(
  ( (Some!293 (v!5307 V!8203)) (None!292) )
))
(declare-fun isDefined!229 (Option!294) Bool)

(declare-fun getValueByKey!288 (List!3669 (_ BitVec 64)) Option!294)

(assert (=> b!245431 (isDefined!229 (getValueByKey!288 (toList!1865 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504))) key!932))))

(declare-fun b!245432 () Bool)

(declare-fun Unit!7583 () Unit!7575)

(assert (=> b!245432 (= e!159234 Unit!7583)))

(declare-fun b!245433 () Bool)

(assert (=> b!245433 (= e!159235 (isDefined!229 (getValueByKey!288 (toList!1865 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504))) key!932)))))

(assert (= (and d!60185 c!40977) b!245431))

(assert (= (and d!60185 (not c!40977)) b!245432))

(assert (= (and d!60185 (not res!120384)) b!245433))

(declare-fun m!263045 () Bool)

(assert (=> d!60185 m!263045))

(declare-fun m!263047 () Bool)

(assert (=> b!245431 m!263047))

(declare-fun m!263049 () Bool)

(assert (=> b!245431 m!263049))

(assert (=> b!245431 m!263049))

(declare-fun m!263051 () Bool)

(assert (=> b!245431 m!263051))

(assert (=> b!245433 m!263049))

(assert (=> b!245433 m!263049))

(assert (=> b!245433 m!263051))

(assert (=> b!245355 d!60185))

(declare-fun d!60187 () Bool)

(declare-fun e!159271 () Bool)

(assert (=> d!60187 e!159271))

(declare-fun res!120408 () Bool)

(assert (=> d!60187 (=> (not res!120408) (not e!159271))))

(assert (=> d!60187 (= res!120408 (or (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))))

(declare-fun lt!122973 () ListLongMap!3699)

(declare-fun lt!122971 () ListLongMap!3699)

(assert (=> d!60187 (= lt!122973 lt!122971)))

(declare-fun lt!122970 () Unit!7575)

(declare-fun e!159266 () Unit!7575)

(assert (=> d!60187 (= lt!122970 e!159266)))

(declare-fun c!40991 () Bool)

(declare-fun e!159269 () Bool)

(assert (=> d!60187 (= c!40991 e!159269)))

(declare-fun res!120410 () Bool)

(assert (=> d!60187 (=> (not res!120410) (not e!159269))))

(assert (=> d!60187 (= res!120410 (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun e!159274 () ListLongMap!3699)

(assert (=> d!60187 (= lt!122971 e!159274)))

(declare-fun c!40994 () Bool)

(assert (=> d!60187 (= c!40994 (and (not (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60187 (validMask!0 (mask!10649 thiss!1504))))

(assert (=> d!60187 (= (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)) lt!122973)))

(declare-fun b!245476 () Bool)

(declare-fun lt!122972 () Unit!7575)

(assert (=> b!245476 (= e!159266 lt!122972)))

(declare-fun lt!122968 () ListLongMap!3699)

(declare-fun getCurrentListMapNoExtraKeys!552 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 32) Int) ListLongMap!3699)

(assert (=> b!245476 (= lt!122968 (getCurrentListMapNoExtraKeys!552 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(declare-fun lt!122961 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122963 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122963 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122965 () Unit!7575)

(declare-fun addStillContains!206 (ListLongMap!3699 (_ BitVec 64) V!8203 (_ BitVec 64)) Unit!7575)

(assert (=> b!245476 (= lt!122965 (addStillContains!206 lt!122968 lt!122961 (zeroValue!4381 thiss!1504) lt!122963))))

(declare-fun +!657 (ListLongMap!3699 tuple2!4786) ListLongMap!3699)

(assert (=> b!245476 (contains!1773 (+!657 lt!122968 (tuple2!4787 lt!122961 (zeroValue!4381 thiss!1504))) lt!122963)))

(declare-fun lt!122960 () Unit!7575)

(assert (=> b!245476 (= lt!122960 lt!122965)))

(declare-fun lt!122969 () ListLongMap!3699)

(assert (=> b!245476 (= lt!122969 (getCurrentListMapNoExtraKeys!552 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(declare-fun lt!122957 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122964 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122964 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122974 () Unit!7575)

(declare-fun addApplyDifferent!206 (ListLongMap!3699 (_ BitVec 64) V!8203 (_ BitVec 64)) Unit!7575)

(assert (=> b!245476 (= lt!122974 (addApplyDifferent!206 lt!122969 lt!122957 (minValue!4381 thiss!1504) lt!122964))))

(declare-fun apply!230 (ListLongMap!3699 (_ BitVec 64)) V!8203)

(assert (=> b!245476 (= (apply!230 (+!657 lt!122969 (tuple2!4787 lt!122957 (minValue!4381 thiss!1504))) lt!122964) (apply!230 lt!122969 lt!122964))))

(declare-fun lt!122975 () Unit!7575)

(assert (=> b!245476 (= lt!122975 lt!122974)))

(declare-fun lt!122954 () ListLongMap!3699)

(assert (=> b!245476 (= lt!122954 (getCurrentListMapNoExtraKeys!552 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(declare-fun lt!122958 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122958 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122959 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122959 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122966 () Unit!7575)

(assert (=> b!245476 (= lt!122966 (addApplyDifferent!206 lt!122954 lt!122958 (zeroValue!4381 thiss!1504) lt!122959))))

(assert (=> b!245476 (= (apply!230 (+!657 lt!122954 (tuple2!4787 lt!122958 (zeroValue!4381 thiss!1504))) lt!122959) (apply!230 lt!122954 lt!122959))))

(declare-fun lt!122956 () Unit!7575)

(assert (=> b!245476 (= lt!122956 lt!122966)))

(declare-fun lt!122967 () ListLongMap!3699)

(assert (=> b!245476 (= lt!122967 (getCurrentListMapNoExtraKeys!552 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(declare-fun lt!122962 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122962 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122955 () (_ BitVec 64))

(assert (=> b!245476 (= lt!122955 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245476 (= lt!122972 (addApplyDifferent!206 lt!122967 lt!122962 (minValue!4381 thiss!1504) lt!122955))))

(assert (=> b!245476 (= (apply!230 (+!657 lt!122967 (tuple2!4787 lt!122962 (minValue!4381 thiss!1504))) lt!122955) (apply!230 lt!122967 lt!122955))))

(declare-fun bm!22917 () Bool)

(declare-fun call!22924 () ListLongMap!3699)

(assert (=> bm!22917 (= call!22924 (getCurrentListMapNoExtraKeys!552 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(declare-fun bm!22918 () Bool)

(declare-fun call!22922 () ListLongMap!3699)

(declare-fun call!22921 () ListLongMap!3699)

(assert (=> bm!22918 (= call!22922 call!22921)))

(declare-fun b!245477 () Bool)

(declare-fun c!40990 () Bool)

(assert (=> b!245477 (= c!40990 (and (not (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!159264 () ListLongMap!3699)

(declare-fun e!159270 () ListLongMap!3699)

(assert (=> b!245477 (= e!159264 e!159270)))

(declare-fun b!245478 () Bool)

(declare-fun call!22923 () ListLongMap!3699)

(assert (=> b!245478 (= e!159270 call!22923)))

(declare-fun b!245479 () Bool)

(assert (=> b!245479 (= e!159264 call!22922)))

(declare-fun bm!22919 () Bool)

(declare-fun call!22926 () ListLongMap!3699)

(assert (=> bm!22919 (= call!22926 call!22924)))

(declare-fun b!245480 () Bool)

(assert (=> b!245480 (= e!159270 call!22922)))

(declare-fun bm!22920 () Bool)

(declare-fun call!22925 () Bool)

(assert (=> bm!22920 (= call!22925 (contains!1773 lt!122973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245481 () Bool)

(declare-fun e!159267 () Bool)

(declare-fun get!2954 (ValueCell!2865 V!8203) V!8203)

(declare-fun dynLambda!573 (Int (_ BitVec 64)) V!8203)

(assert (=> b!245481 (= e!159267 (= (apply!230 lt!122973 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000)) (get!2954 (select (arr!5758 (_values!4523 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4540 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6100 (_values!4523 thiss!1504))))))

(assert (=> b!245481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245482 () Bool)

(declare-fun Unit!7584 () Unit!7575)

(assert (=> b!245482 (= e!159266 Unit!7584)))

(declare-fun b!245483 () Bool)

(declare-fun e!159262 () Bool)

(assert (=> b!245483 (= e!159271 e!159262)))

(declare-fun c!40992 () Bool)

(assert (=> b!245483 (= c!40992 (not (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245484 () Bool)

(declare-fun e!159268 () Bool)

(assert (=> b!245484 (= e!159268 (= (apply!230 lt!122973 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4381 thiss!1504)))))

(declare-fun b!245485 () Bool)

(declare-fun e!159263 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!245485 (= e!159263 (validKeyInArray!0 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245486 () Bool)

(declare-fun e!159272 () Bool)

(assert (=> b!245486 (= e!159272 e!159267)))

(declare-fun res!120403 () Bool)

(assert (=> b!245486 (=> (not res!120403) (not e!159267))))

(assert (=> b!245486 (= res!120403 (contains!1773 lt!122973 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245487 () Bool)

(assert (=> b!245487 (= e!159269 (validKeyInArray!0 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245488 () Bool)

(assert (=> b!245488 (= e!159262 e!159268)))

(declare-fun res!120407 () Bool)

(declare-fun call!22920 () Bool)

(assert (=> b!245488 (= res!120407 call!22920)))

(assert (=> b!245488 (=> (not res!120407) (not e!159268))))

(declare-fun b!245489 () Bool)

(assert (=> b!245489 (= e!159274 e!159264)))

(declare-fun c!40995 () Bool)

(assert (=> b!245489 (= c!40995 (and (not (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22921 () Bool)

(assert (=> bm!22921 (= call!22921 (+!657 (ite c!40994 call!22924 (ite c!40995 call!22926 call!22923)) (ite (or c!40994 c!40995) (tuple2!4787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4381 thiss!1504)) (tuple2!4787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4381 thiss!1504)))))))

(declare-fun bm!22922 () Bool)

(assert (=> bm!22922 (= call!22920 (contains!1773 lt!122973 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245490 () Bool)

(assert (=> b!245490 (= e!159274 (+!657 call!22921 (tuple2!4787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4381 thiss!1504))))))

(declare-fun b!245491 () Bool)

(declare-fun res!120406 () Bool)

(assert (=> b!245491 (=> (not res!120406) (not e!159271))))

(assert (=> b!245491 (= res!120406 e!159272)))

(declare-fun res!120405 () Bool)

(assert (=> b!245491 (=> res!120405 e!159272)))

(assert (=> b!245491 (= res!120405 (not e!159263))))

(declare-fun res!120409 () Bool)

(assert (=> b!245491 (=> (not res!120409) (not e!159263))))

(assert (=> b!245491 (= res!120409 (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245492 () Bool)

(declare-fun e!159273 () Bool)

(declare-fun e!159265 () Bool)

(assert (=> b!245492 (= e!159273 e!159265)))

(declare-fun res!120404 () Bool)

(assert (=> b!245492 (= res!120404 call!22925)))

(assert (=> b!245492 (=> (not res!120404) (not e!159265))))

(declare-fun b!245493 () Bool)

(assert (=> b!245493 (= e!159265 (= (apply!230 lt!122973 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4381 thiss!1504)))))

(declare-fun bm!22923 () Bool)

(assert (=> bm!22923 (= call!22923 call!22926)))

(declare-fun b!245494 () Bool)

(assert (=> b!245494 (= e!159262 (not call!22920))))

(declare-fun b!245495 () Bool)

(declare-fun res!120411 () Bool)

(assert (=> b!245495 (=> (not res!120411) (not e!159271))))

(assert (=> b!245495 (= res!120411 e!159273)))

(declare-fun c!40993 () Bool)

(assert (=> b!245495 (= c!40993 (not (= (bvand (extraKeys!4277 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245496 () Bool)

(assert (=> b!245496 (= e!159273 (not call!22925))))

(assert (= (and d!60187 c!40994) b!245490))

(assert (= (and d!60187 (not c!40994)) b!245489))

(assert (= (and b!245489 c!40995) b!245479))

(assert (= (and b!245489 (not c!40995)) b!245477))

(assert (= (and b!245477 c!40990) b!245480))

(assert (= (and b!245477 (not c!40990)) b!245478))

(assert (= (or b!245480 b!245478) bm!22923))

(assert (= (or b!245479 bm!22923) bm!22919))

(assert (= (or b!245479 b!245480) bm!22918))

(assert (= (or b!245490 bm!22919) bm!22917))

(assert (= (or b!245490 bm!22918) bm!22921))

(assert (= (and d!60187 res!120410) b!245487))

(assert (= (and d!60187 c!40991) b!245476))

(assert (= (and d!60187 (not c!40991)) b!245482))

(assert (= (and d!60187 res!120408) b!245491))

(assert (= (and b!245491 res!120409) b!245485))

(assert (= (and b!245491 (not res!120405)) b!245486))

(assert (= (and b!245486 res!120403) b!245481))

(assert (= (and b!245491 res!120406) b!245495))

(assert (= (and b!245495 c!40993) b!245492))

(assert (= (and b!245495 (not c!40993)) b!245496))

(assert (= (and b!245492 res!120404) b!245493))

(assert (= (or b!245492 b!245496) bm!22920))

(assert (= (and b!245495 res!120411) b!245483))

(assert (= (and b!245483 c!40992) b!245488))

(assert (= (and b!245483 (not c!40992)) b!245494))

(assert (= (and b!245488 res!120407) b!245484))

(assert (= (or b!245488 b!245494) bm!22922))

(declare-fun b_lambda!8023 () Bool)

(assert (=> (not b_lambda!8023) (not b!245481)))

(declare-fun t!8686 () Bool)

(declare-fun tb!2973 () Bool)

(assert (=> (and b!245340 (= (defaultEntry!4540 thiss!1504) (defaultEntry!4540 thiss!1504)) t!8686) tb!2973))

(declare-fun result!5241 () Bool)

(assert (=> tb!2973 (= result!5241 tp_is_empty!6417)))

(assert (=> b!245481 t!8686))

(declare-fun b_and!13547 () Bool)

(assert (= b_and!13543 (and (=> t!8686 result!5241) b_and!13547)))

(declare-fun m!263053 () Bool)

(assert (=> bm!22917 m!263053))

(declare-fun m!263055 () Bool)

(assert (=> b!245476 m!263055))

(declare-fun m!263057 () Bool)

(assert (=> b!245476 m!263057))

(declare-fun m!263059 () Bool)

(assert (=> b!245476 m!263059))

(declare-fun m!263061 () Bool)

(assert (=> b!245476 m!263061))

(assert (=> b!245476 m!263055))

(declare-fun m!263063 () Bool)

(assert (=> b!245476 m!263063))

(assert (=> b!245476 m!263041))

(declare-fun m!263065 () Bool)

(assert (=> b!245476 m!263065))

(declare-fun m!263067 () Bool)

(assert (=> b!245476 m!263067))

(declare-fun m!263069 () Bool)

(assert (=> b!245476 m!263069))

(assert (=> b!245476 m!263065))

(assert (=> b!245476 m!263069))

(declare-fun m!263071 () Bool)

(assert (=> b!245476 m!263071))

(declare-fun m!263073 () Bool)

(assert (=> b!245476 m!263073))

(declare-fun m!263075 () Bool)

(assert (=> b!245476 m!263075))

(declare-fun m!263077 () Bool)

(assert (=> b!245476 m!263077))

(assert (=> b!245476 m!263053))

(declare-fun m!263079 () Bool)

(assert (=> b!245476 m!263079))

(declare-fun m!263081 () Bool)

(assert (=> b!245476 m!263081))

(assert (=> b!245476 m!263059))

(declare-fun m!263083 () Bool)

(assert (=> b!245476 m!263083))

(assert (=> b!245487 m!263041))

(assert (=> b!245487 m!263041))

(declare-fun m!263085 () Bool)

(assert (=> b!245487 m!263085))

(assert (=> b!245485 m!263041))

(assert (=> b!245485 m!263041))

(assert (=> b!245485 m!263085))

(declare-fun m!263087 () Bool)

(assert (=> bm!22922 m!263087))

(declare-fun m!263089 () Bool)

(assert (=> bm!22920 m!263089))

(declare-fun m!263091 () Bool)

(assert (=> b!245490 m!263091))

(declare-fun m!263093 () Bool)

(assert (=> b!245493 m!263093))

(declare-fun m!263095 () Bool)

(assert (=> bm!22921 m!263095))

(declare-fun m!263097 () Bool)

(assert (=> b!245484 m!263097))

(declare-fun m!263099 () Bool)

(assert (=> b!245481 m!263099))

(assert (=> b!245481 m!263099))

(declare-fun m!263101 () Bool)

(assert (=> b!245481 m!263101))

(declare-fun m!263103 () Bool)

(assert (=> b!245481 m!263103))

(assert (=> b!245481 m!263041))

(assert (=> b!245481 m!263101))

(assert (=> b!245481 m!263041))

(declare-fun m!263105 () Bool)

(assert (=> b!245481 m!263105))

(assert (=> b!245486 m!263041))

(assert (=> b!245486 m!263041))

(declare-fun m!263107 () Bool)

(assert (=> b!245486 m!263107))

(assert (=> d!60187 m!262975))

(assert (=> b!245355 d!60187))

(declare-fun b!245515 () Bool)

(declare-fun res!120421 () Bool)

(declare-fun e!159285 () Bool)

(assert (=> b!245515 (=> (not res!120421) (not e!159285))))

(declare-fun call!22931 () Bool)

(assert (=> b!245515 (= res!120421 call!22931)))

(declare-fun e!159283 () Bool)

(assert (=> b!245515 (= e!159283 e!159285)))

(declare-fun lt!122980 () SeekEntryResult!1088)

(declare-fun c!41001 () Bool)

(declare-fun bm!22928 () Bool)

(assert (=> bm!22928 (= call!22931 (inRange!0 (ite c!41001 (index!6522 lt!122980) (index!6525 lt!122980)) (mask!10649 thiss!1504)))))

(declare-fun b!245516 () Bool)

(assert (=> b!245516 (and (bvsge (index!6522 lt!122980) #b00000000000000000000000000000000) (bvslt (index!6522 lt!122980) (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun res!120422 () Bool)

(assert (=> b!245516 (= res!120422 (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6522 lt!122980)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159286 () Bool)

(assert (=> b!245516 (=> (not res!120422) (not e!159286))))

(declare-fun b!245517 () Bool)

(declare-fun call!22932 () Bool)

(assert (=> b!245517 (= e!159285 (not call!22932))))

(declare-fun b!245518 () Bool)

(declare-fun e!159284 () Bool)

(assert (=> b!245518 (= e!159284 e!159283)))

(declare-fun c!41000 () Bool)

(assert (=> b!245518 (= c!41000 ((_ is MissingVacant!1088) lt!122980))))

(declare-fun d!60189 () Bool)

(assert (=> d!60189 e!159284))

(assert (=> d!60189 (= c!41001 ((_ is MissingZero!1088) lt!122980))))

(assert (=> d!60189 (= lt!122980 (seekEntryOrOpen!0 key!932 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)))))

(declare-fun lt!122981 () Unit!7575)

(declare-fun choose!1146 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 64) Int) Unit!7575)

(assert (=> d!60189 (= lt!122981 (choose!1146 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 (defaultEntry!4540 thiss!1504)))))

(assert (=> d!60189 (validMask!0 (mask!10649 thiss!1504))))

(assert (=> d!60189 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!377 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 (defaultEntry!4540 thiss!1504)) lt!122981)))

(declare-fun b!245519 () Bool)

(declare-fun res!120420 () Bool)

(assert (=> b!245519 (=> (not res!120420) (not e!159285))))

(assert (=> b!245519 (= res!120420 (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6525 lt!122980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245519 (and (bvsge (index!6525 lt!122980) #b00000000000000000000000000000000) (bvslt (index!6525 lt!122980) (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245520 () Bool)

(assert (=> b!245520 (= e!159283 ((_ is Undefined!1088) lt!122980))))

(declare-fun b!245521 () Bool)

(assert (=> b!245521 (= e!159286 (not call!22932))))

(declare-fun b!245522 () Bool)

(assert (=> b!245522 (= e!159284 e!159286)))

(declare-fun res!120423 () Bool)

(assert (=> b!245522 (= res!120423 call!22931)))

(assert (=> b!245522 (=> (not res!120423) (not e!159286))))

(declare-fun bm!22929 () Bool)

(assert (=> bm!22929 (= call!22932 (arrayContainsKey!0 (_keys!6654 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!60189 c!41001) b!245522))

(assert (= (and d!60189 (not c!41001)) b!245518))

(assert (= (and b!245522 res!120423) b!245516))

(assert (= (and b!245516 res!120422) b!245521))

(assert (= (and b!245518 c!41000) b!245515))

(assert (= (and b!245518 (not c!41000)) b!245520))

(assert (= (and b!245515 res!120421) b!245519))

(assert (= (and b!245519 res!120420) b!245517))

(assert (= (or b!245522 b!245515) bm!22928))

(assert (= (or b!245521 b!245517) bm!22929))

(assert (=> d!60189 m!262957))

(declare-fun m!263109 () Bool)

(assert (=> d!60189 m!263109))

(assert (=> d!60189 m!262975))

(declare-fun m!263111 () Bool)

(assert (=> bm!22928 m!263111))

(declare-fun m!263113 () Bool)

(assert (=> b!245516 m!263113))

(assert (=> bm!22929 m!262977))

(declare-fun m!263115 () Bool)

(assert (=> b!245519 m!263115))

(assert (=> b!245356 d!60189))

(declare-fun b!245535 () Bool)

(declare-fun e!159294 () SeekEntryResult!1088)

(declare-fun lt!122990 () SeekEntryResult!1088)

(assert (=> b!245535 (= e!159294 (Found!1088 (index!6524 lt!122990)))))

(declare-fun b!245536 () Bool)

(declare-fun e!159295 () SeekEntryResult!1088)

(assert (=> b!245536 (= e!159295 (MissingZero!1088 (index!6524 lt!122990)))))

(declare-fun b!245537 () Bool)

(declare-fun e!159293 () SeekEntryResult!1088)

(assert (=> b!245537 (= e!159293 e!159294)))

(declare-fun lt!122988 () (_ BitVec 64))

(assert (=> b!245537 (= lt!122988 (select (arr!5759 (_keys!6654 thiss!1504)) (index!6524 lt!122990)))))

(declare-fun c!41008 () Bool)

(assert (=> b!245537 (= c!41008 (= lt!122988 key!932))))

(declare-fun b!245538 () Bool)

(declare-fun c!41010 () Bool)

(assert (=> b!245538 (= c!41010 (= lt!122988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245538 (= e!159294 e!159295)))

(declare-fun d!60191 () Bool)

(declare-fun lt!122989 () SeekEntryResult!1088)

(assert (=> d!60191 (and (or ((_ is Undefined!1088) lt!122989) (not ((_ is Found!1088) lt!122989)) (and (bvsge (index!6523 lt!122989) #b00000000000000000000000000000000) (bvslt (index!6523 lt!122989) (size!6101 (_keys!6654 thiss!1504))))) (or ((_ is Undefined!1088) lt!122989) ((_ is Found!1088) lt!122989) (not ((_ is MissingZero!1088) lt!122989)) (and (bvsge (index!6522 lt!122989) #b00000000000000000000000000000000) (bvslt (index!6522 lt!122989) (size!6101 (_keys!6654 thiss!1504))))) (or ((_ is Undefined!1088) lt!122989) ((_ is Found!1088) lt!122989) ((_ is MissingZero!1088) lt!122989) (not ((_ is MissingVacant!1088) lt!122989)) (and (bvsge (index!6525 lt!122989) #b00000000000000000000000000000000) (bvslt (index!6525 lt!122989) (size!6101 (_keys!6654 thiss!1504))))) (or ((_ is Undefined!1088) lt!122989) (ite ((_ is Found!1088) lt!122989) (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6523 lt!122989)) key!932) (ite ((_ is MissingZero!1088) lt!122989) (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6522 lt!122989)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1088) lt!122989) (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6525 lt!122989)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60191 (= lt!122989 e!159293)))

(declare-fun c!41009 () Bool)

(assert (=> d!60191 (= c!41009 (and ((_ is Intermediate!1088) lt!122990) (undefined!1900 lt!122990)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12133 (_ BitVec 32)) SeekEntryResult!1088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60191 (= lt!122990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10649 thiss!1504)) key!932 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)))))

(assert (=> d!60191 (validMask!0 (mask!10649 thiss!1504))))

(assert (=> d!60191 (= (seekEntryOrOpen!0 key!932 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)) lt!122989)))

(declare-fun b!245539 () Bool)

(assert (=> b!245539 (= e!159293 Undefined!1088)))

(declare-fun b!245540 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12133 (_ BitVec 32)) SeekEntryResult!1088)

(assert (=> b!245540 (= e!159295 (seekKeyOrZeroReturnVacant!0 (x!24418 lt!122990) (index!6524 lt!122990) (index!6524 lt!122990) key!932 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)))))

(assert (= (and d!60191 c!41009) b!245539))

(assert (= (and d!60191 (not c!41009)) b!245537))

(assert (= (and b!245537 c!41008) b!245535))

(assert (= (and b!245537 (not c!41008)) b!245538))

(assert (= (and b!245538 c!41010) b!245536))

(assert (= (and b!245538 (not c!41010)) b!245540))

(declare-fun m!263117 () Bool)

(assert (=> b!245537 m!263117))

(declare-fun m!263119 () Bool)

(assert (=> d!60191 m!263119))

(declare-fun m!263121 () Bool)

(assert (=> d!60191 m!263121))

(assert (=> d!60191 m!263119))

(declare-fun m!263123 () Bool)

(assert (=> d!60191 m!263123))

(assert (=> d!60191 m!262975))

(declare-fun m!263125 () Bool)

(assert (=> d!60191 m!263125))

(declare-fun m!263127 () Bool)

(assert (=> d!60191 m!263127))

(declare-fun m!263129 () Bool)

(assert (=> b!245540 m!263129))

(assert (=> b!245344 d!60191))

(declare-fun d!60193 () Bool)

(declare-fun res!120430 () Bool)

(declare-fun e!159298 () Bool)

(assert (=> d!60193 (=> (not res!120430) (not e!159298))))

(declare-fun simpleValid!253 (LongMapFixedSize!3630) Bool)

(assert (=> d!60193 (= res!120430 (simpleValid!253 thiss!1504))))

(assert (=> d!60193 (= (valid!1420 thiss!1504) e!159298)))

(declare-fun b!245547 () Bool)

(declare-fun res!120431 () Bool)

(assert (=> b!245547 (=> (not res!120431) (not e!159298))))

(assert (=> b!245547 (= res!120431 (= (arrayCountValidKeys!0 (_keys!6654 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) (_size!1864 thiss!1504)))))

(declare-fun b!245548 () Bool)

(declare-fun res!120432 () Bool)

(assert (=> b!245548 (=> (not res!120432) (not e!159298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12133 (_ BitVec 32)) Bool)

(assert (=> b!245548 (= res!120432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)))))

(declare-fun b!245549 () Bool)

(assert (=> b!245549 (= e!159298 (arrayNoDuplicates!0 (_keys!6654 thiss!1504) #b00000000000000000000000000000000 Nil!3665))))

(assert (= (and d!60193 res!120430) b!245547))

(assert (= (and b!245547 res!120431) b!245548))

(assert (= (and b!245548 res!120432) b!245549))

(declare-fun m!263131 () Bool)

(assert (=> d!60193 m!263131))

(assert (=> b!245547 m!262983))

(declare-fun m!263133 () Bool)

(assert (=> b!245548 m!263133))

(declare-fun m!263135 () Bool)

(assert (=> b!245549 m!263135))

(assert (=> start!23330 d!60193))

(declare-fun d!60195 () Bool)

(assert (=> d!60195 (= (array_inv!3805 (_keys!6654 thiss!1504)) (bvsge (size!6101 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245340 d!60195))

(declare-fun d!60197 () Bool)

(assert (=> d!60197 (= (array_inv!3806 (_values!4523 thiss!1504)) (bvsge (size!6100 (_values!4523 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245340 d!60197))

(declare-fun d!60199 () Bool)

(declare-fun e!159301 () Bool)

(assert (=> d!60199 e!159301))

(declare-fun res!120438 () Bool)

(assert (=> d!60199 (=> (not res!120438) (not e!159301))))

(declare-fun lt!122995 () SeekEntryResult!1088)

(assert (=> d!60199 (= res!120438 ((_ is Found!1088) lt!122995))))

(assert (=> d!60199 (= lt!122995 (seekEntryOrOpen!0 key!932 (_keys!6654 thiss!1504) (mask!10649 thiss!1504)))))

(declare-fun lt!122996 () Unit!7575)

(declare-fun choose!1147 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 64) Int) Unit!7575)

(assert (=> d!60199 (= lt!122996 (choose!1147 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 (defaultEntry!4540 thiss!1504)))))

(assert (=> d!60199 (validMask!0 (mask!10649 thiss!1504))))

(assert (=> d!60199 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 (defaultEntry!4540 thiss!1504)) lt!122996)))

(declare-fun b!245554 () Bool)

(declare-fun res!120437 () Bool)

(assert (=> b!245554 (=> (not res!120437) (not e!159301))))

(assert (=> b!245554 (= res!120437 (inRange!0 (index!6523 lt!122995) (mask!10649 thiss!1504)))))

(declare-fun b!245555 () Bool)

(assert (=> b!245555 (= e!159301 (= (select (arr!5759 (_keys!6654 thiss!1504)) (index!6523 lt!122995)) key!932))))

(assert (=> b!245555 (and (bvsge (index!6523 lt!122995) #b00000000000000000000000000000000) (bvslt (index!6523 lt!122995) (size!6101 (_keys!6654 thiss!1504))))))

(assert (= (and d!60199 res!120438) b!245554))

(assert (= (and b!245554 res!120437) b!245555))

(assert (=> d!60199 m!262957))

(declare-fun m!263137 () Bool)

(assert (=> d!60199 m!263137))

(assert (=> d!60199 m!262975))

(declare-fun m!263139 () Bool)

(assert (=> b!245554 m!263139))

(declare-fun m!263141 () Bool)

(assert (=> b!245555 m!263141))

(assert (=> b!245349 d!60199))

(declare-fun d!60201 () Bool)

(assert (=> d!60201 (contains!1773 (getCurrentListMap!1393 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)) key!932)))

(declare-fun lt!122999 () Unit!7575)

(declare-fun choose!1148 (array!12133 array!12131 (_ BitVec 32) (_ BitVec 32) V!8203 V!8203 (_ BitVec 64) (_ BitVec 32) Int) Unit!7575)

(assert (=> d!60201 (= lt!122999 (choose!1148 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)))))

(assert (=> d!60201 (validMask!0 (mask!10649 thiss!1504))))

(assert (=> d!60201 (= (lemmaArrayContainsKeyThenInListMap!174 (_keys!6654 thiss!1504) (_values!4523 thiss!1504) (mask!10649 thiss!1504) (extraKeys!4277 thiss!1504) (zeroValue!4381 thiss!1504) (minValue!4381 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4540 thiss!1504)) lt!122999)))

(declare-fun bs!8891 () Bool)

(assert (= bs!8891 d!60201))

(assert (=> bs!8891 m!262969))

(assert (=> bs!8891 m!262969))

(assert (=> bs!8891 m!262971))

(declare-fun m!263143 () Bool)

(assert (=> bs!8891 m!263143))

(assert (=> bs!8891 m!262975))

(assert (=> b!245354 d!60201))

(declare-fun b!245566 () Bool)

(declare-fun e!159307 () Bool)

(assert (=> b!245566 (= e!159307 (bvslt (size!6101 (_keys!6654 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!245565 () Bool)

(declare-fun res!120447 () Bool)

(assert (=> b!245565 (=> (not res!120447) (not e!159307))))

(assert (=> b!245565 (= res!120447 (validKeyInArray!0 key!932))))

(declare-fun d!60203 () Bool)

(declare-fun e!159306 () Bool)

(assert (=> d!60203 e!159306))

(declare-fun res!120448 () Bool)

(assert (=> d!60203 (=> (not res!120448) (not e!159306))))

(assert (=> d!60203 (= res!120448 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6101 (_keys!6654 thiss!1504)))))))

(declare-fun lt!123002 () Unit!7575)

(declare-fun choose!1 (array!12133 (_ BitVec 32) (_ BitVec 64)) Unit!7575)

(assert (=> d!60203 (= lt!123002 (choose!1 (_keys!6654 thiss!1504) index!297 key!932))))

(assert (=> d!60203 e!159307))

(declare-fun res!120450 () Bool)

(assert (=> d!60203 (=> (not res!120450) (not e!159307))))

(assert (=> d!60203 (= res!120450 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6101 (_keys!6654 thiss!1504)))))))

(assert (=> d!60203 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6654 thiss!1504) index!297 key!932) lt!123002)))

(declare-fun b!245567 () Bool)

(assert (=> b!245567 (= e!159306 (= (arrayCountValidKeys!0 (array!12134 (store (arr!5759 (_keys!6654 thiss!1504)) index!297 key!932) (size!6101 (_keys!6654 thiss!1504))) #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6654 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!245564 () Bool)

(declare-fun res!120449 () Bool)

(assert (=> b!245564 (=> (not res!120449) (not e!159307))))

(assert (=> b!245564 (= res!120449 (not (validKeyInArray!0 (select (arr!5759 (_keys!6654 thiss!1504)) index!297))))))

(assert (= (and d!60203 res!120450) b!245564))

(assert (= (and b!245564 res!120449) b!245565))

(assert (= (and b!245565 res!120447) b!245566))

(assert (= (and d!60203 res!120448) b!245567))

(declare-fun m!263145 () Bool)

(assert (=> b!245565 m!263145))

(declare-fun m!263147 () Bool)

(assert (=> d!60203 m!263147))

(assert (=> b!245567 m!262987))

(declare-fun m!263149 () Bool)

(assert (=> b!245567 m!263149))

(assert (=> b!245567 m!262983))

(declare-fun m!263151 () Bool)

(assert (=> b!245564 m!263151))

(assert (=> b!245564 m!263151))

(declare-fun m!263153 () Bool)

(assert (=> b!245564 m!263153))

(assert (=> b!245346 d!60203))

(declare-fun b!245576 () Bool)

(declare-fun e!159313 () (_ BitVec 32))

(declare-fun call!22935 () (_ BitVec 32))

(assert (=> b!245576 (= e!159313 call!22935)))

(declare-fun b!245577 () Bool)

(assert (=> b!245577 (= e!159313 (bvadd #b00000000000000000000000000000001 call!22935))))

(declare-fun d!60205 () Bool)

(declare-fun lt!123005 () (_ BitVec 32))

(assert (=> d!60205 (and (bvsge lt!123005 #b00000000000000000000000000000000) (bvsle lt!123005 (bvsub (size!6101 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159312 () (_ BitVec 32))

(assert (=> d!60205 (= lt!123005 e!159312)))

(declare-fun c!41015 () Bool)

(assert (=> d!60205 (= c!41015 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))

(assert (=> d!60205 (and (bvsle #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6654 thiss!1504)) (size!6101 (_keys!6654 thiss!1504))))))

(assert (=> d!60205 (= (arrayCountValidKeys!0 (_keys!6654 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) lt!123005)))

(declare-fun bm!22932 () Bool)

(assert (=> bm!22932 (= call!22935 (arrayCountValidKeys!0 (_keys!6654 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245578 () Bool)

(assert (=> b!245578 (= e!159312 e!159313)))

(declare-fun c!41016 () Bool)

(assert (=> b!245578 (= c!41016 (validKeyInArray!0 (select (arr!5759 (_keys!6654 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245579 () Bool)

(assert (=> b!245579 (= e!159312 #b00000000000000000000000000000000)))

(assert (= (and d!60205 c!41015) b!245579))

(assert (= (and d!60205 (not c!41015)) b!245578))

(assert (= (and b!245578 c!41016) b!245577))

(assert (= (and b!245578 (not c!41016)) b!245576))

(assert (= (or b!245577 b!245576) bm!22932))

(declare-fun m!263155 () Bool)

(assert (=> bm!22932 m!263155))

(assert (=> b!245578 m!263041))

(assert (=> b!245578 m!263041))

(assert (=> b!245578 m!263085))

(assert (=> b!245346 d!60205))

(declare-fun d!60207 () Bool)

(assert (=> d!60207 (= (validMask!0 (mask!10649 thiss!1504)) (and (or (= (mask!10649 thiss!1504) #b00000000000000000000000000000111) (= (mask!10649 thiss!1504) #b00000000000000000000000000001111) (= (mask!10649 thiss!1504) #b00000000000000000000000000011111) (= (mask!10649 thiss!1504) #b00000000000000000000000000111111) (= (mask!10649 thiss!1504) #b00000000000000000000000001111111) (= (mask!10649 thiss!1504) #b00000000000000000000000011111111) (= (mask!10649 thiss!1504) #b00000000000000000000000111111111) (= (mask!10649 thiss!1504) #b00000000000000000000001111111111) (= (mask!10649 thiss!1504) #b00000000000000000000011111111111) (= (mask!10649 thiss!1504) #b00000000000000000000111111111111) (= (mask!10649 thiss!1504) #b00000000000000000001111111111111) (= (mask!10649 thiss!1504) #b00000000000000000011111111111111) (= (mask!10649 thiss!1504) #b00000000000000000111111111111111) (= (mask!10649 thiss!1504) #b00000000000000001111111111111111) (= (mask!10649 thiss!1504) #b00000000000000011111111111111111) (= (mask!10649 thiss!1504) #b00000000000000111111111111111111) (= (mask!10649 thiss!1504) #b00000000000001111111111111111111) (= (mask!10649 thiss!1504) #b00000000000011111111111111111111) (= (mask!10649 thiss!1504) #b00000000000111111111111111111111) (= (mask!10649 thiss!1504) #b00000000001111111111111111111111) (= (mask!10649 thiss!1504) #b00000000011111111111111111111111) (= (mask!10649 thiss!1504) #b00000000111111111111111111111111) (= (mask!10649 thiss!1504) #b00000001111111111111111111111111) (= (mask!10649 thiss!1504) #b00000011111111111111111111111111) (= (mask!10649 thiss!1504) #b00000111111111111111111111111111) (= (mask!10649 thiss!1504) #b00001111111111111111111111111111) (= (mask!10649 thiss!1504) #b00011111111111111111111111111111) (= (mask!10649 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10649 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!245346 d!60207))

(declare-fun b!245590 () Bool)

(declare-fun e!159322 () Bool)

(declare-fun e!159325 () Bool)

(assert (=> b!245590 (= e!159322 e!159325)))

(declare-fun c!41019 () Bool)

(assert (=> b!245590 (= c!41019 (validKeyInArray!0 (select (arr!5759 lt!122863) #b00000000000000000000000000000000)))))

(declare-fun b!245591 () Bool)

(declare-fun call!22938 () Bool)

(assert (=> b!245591 (= e!159325 call!22938)))

(declare-fun b!245592 () Bool)

(declare-fun e!159323 () Bool)

(declare-fun contains!1775 (List!3668 (_ BitVec 64)) Bool)

(assert (=> b!245592 (= e!159323 (contains!1775 Nil!3665 (select (arr!5759 lt!122863) #b00000000000000000000000000000000)))))

(declare-fun d!60209 () Bool)

(declare-fun res!120457 () Bool)

(declare-fun e!159324 () Bool)

(assert (=> d!60209 (=> res!120457 e!159324)))

(assert (=> d!60209 (= res!120457 (bvsge #b00000000000000000000000000000000 (size!6101 lt!122863)))))

(assert (=> d!60209 (= (arrayNoDuplicates!0 lt!122863 #b00000000000000000000000000000000 Nil!3665) e!159324)))

(declare-fun bm!22935 () Bool)

(assert (=> bm!22935 (= call!22938 (arrayNoDuplicates!0 lt!122863 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41019 (Cons!3664 (select (arr!5759 lt!122863) #b00000000000000000000000000000000) Nil!3665) Nil!3665)))))

(declare-fun b!245593 () Bool)

(assert (=> b!245593 (= e!159324 e!159322)))

(declare-fun res!120458 () Bool)

(assert (=> b!245593 (=> (not res!120458) (not e!159322))))

(assert (=> b!245593 (= res!120458 (not e!159323))))

(declare-fun res!120459 () Bool)

(assert (=> b!245593 (=> (not res!120459) (not e!159323))))

(assert (=> b!245593 (= res!120459 (validKeyInArray!0 (select (arr!5759 lt!122863) #b00000000000000000000000000000000)))))

(declare-fun b!245594 () Bool)

(assert (=> b!245594 (= e!159325 call!22938)))

(assert (= (and d!60209 (not res!120457)) b!245593))

(assert (= (and b!245593 res!120459) b!245592))

(assert (= (and b!245593 res!120458) b!245590))

(assert (= (and b!245590 c!41019) b!245594))

(assert (= (and b!245590 (not c!41019)) b!245591))

(assert (= (or b!245594 b!245591) bm!22935))

(declare-fun m!263157 () Bool)

(assert (=> b!245590 m!263157))

(assert (=> b!245590 m!263157))

(declare-fun m!263159 () Bool)

(assert (=> b!245590 m!263159))

(assert (=> b!245592 m!263157))

(assert (=> b!245592 m!263157))

(declare-fun m!263161 () Bool)

(assert (=> b!245592 m!263161))

(assert (=> bm!22935 m!263157))

(declare-fun m!263163 () Bool)

(assert (=> bm!22935 m!263163))

(assert (=> b!245593 m!263157))

(assert (=> b!245593 m!263157))

(assert (=> b!245593 m!263159))

(assert (=> b!245346 d!60209))

(declare-fun d!60211 () Bool)

(declare-fun e!159328 () Bool)

(assert (=> d!60211 e!159328))

(declare-fun res!120462 () Bool)

(assert (=> d!60211 (=> (not res!120462) (not e!159328))))

(assert (=> d!60211 (= res!120462 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6101 (_keys!6654 thiss!1504)))))))

(declare-fun lt!123008 () Unit!7575)

(declare-fun choose!41 (array!12133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3668) Unit!7575)

(assert (=> d!60211 (= lt!123008 (choose!41 (_keys!6654 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3665))))

(assert (=> d!60211 (bvslt (size!6101 (_keys!6654 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60211 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6654 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3665) lt!123008)))

(declare-fun b!245597 () Bool)

(assert (=> b!245597 (= e!159328 (arrayNoDuplicates!0 (array!12134 (store (arr!5759 (_keys!6654 thiss!1504)) index!297 key!932) (size!6101 (_keys!6654 thiss!1504))) #b00000000000000000000000000000000 Nil!3665))))

(assert (= (and d!60211 res!120462) b!245597))

(declare-fun m!263165 () Bool)

(assert (=> d!60211 m!263165))

(assert (=> b!245597 m!262987))

(declare-fun m!263167 () Bool)

(assert (=> b!245597 m!263167))

(assert (=> b!245346 d!60211))

(declare-fun b!245598 () Bool)

(declare-fun e!159330 () (_ BitVec 32))

(declare-fun call!22939 () (_ BitVec 32))

(assert (=> b!245598 (= e!159330 call!22939)))

(declare-fun b!245599 () Bool)

(assert (=> b!245599 (= e!159330 (bvadd #b00000000000000000000000000000001 call!22939))))

(declare-fun d!60213 () Bool)

(declare-fun lt!123009 () (_ BitVec 32))

(assert (=> d!60213 (and (bvsge lt!123009 #b00000000000000000000000000000000) (bvsle lt!123009 (bvsub (size!6101 lt!122863) #b00000000000000000000000000000000)))))

(declare-fun e!159329 () (_ BitVec 32))

(assert (=> d!60213 (= lt!123009 e!159329)))

(declare-fun c!41020 () Bool)

(assert (=> d!60213 (= c!41020 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))))))

(assert (=> d!60213 (and (bvsle #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6654 thiss!1504)) (size!6101 lt!122863)))))

(assert (=> d!60213 (= (arrayCountValidKeys!0 lt!122863 #b00000000000000000000000000000000 (size!6101 (_keys!6654 thiss!1504))) lt!123009)))

(declare-fun bm!22936 () Bool)

(assert (=> bm!22936 (= call!22939 (arrayCountValidKeys!0 lt!122863 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6654 thiss!1504))))))

(declare-fun b!245600 () Bool)

(assert (=> b!245600 (= e!159329 e!159330)))

(declare-fun c!41021 () Bool)

(assert (=> b!245600 (= c!41021 (validKeyInArray!0 (select (arr!5759 lt!122863) #b00000000000000000000000000000000)))))

(declare-fun b!245601 () Bool)

(assert (=> b!245601 (= e!159329 #b00000000000000000000000000000000)))

(assert (= (and d!60213 c!41020) b!245601))

(assert (= (and d!60213 (not c!41020)) b!245600))

(assert (= (and b!245600 c!41021) b!245599))

(assert (= (and b!245600 (not c!41021)) b!245598))

(assert (= (or b!245599 b!245598) bm!22936))

(declare-fun m!263169 () Bool)

(assert (=> bm!22936 m!263169))

(assert (=> b!245600 m!263157))

(assert (=> b!245600 m!263157))

(assert (=> b!245600 m!263159))

(assert (=> b!245346 d!60213))

(assert (=> b!245346 d!60181))

(declare-fun d!60215 () Bool)

(assert (=> d!60215 (= (inRange!0 (ite c!40961 (index!6522 lt!122867) (index!6525 lt!122867)) (mask!10649 thiss!1504)) (and (bvsge (ite c!40961 (index!6522 lt!122867) (index!6525 lt!122867)) #b00000000000000000000000000000000) (bvslt (ite c!40961 (index!6522 lt!122867) (index!6525 lt!122867)) (bvadd (mask!10649 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22896 d!60215))

(declare-fun b!245609 () Bool)

(declare-fun e!159335 () Bool)

(assert (=> b!245609 (= e!159335 tp_is_empty!6417)))

(declare-fun b!245608 () Bool)

(declare-fun e!159336 () Bool)

(assert (=> b!245608 (= e!159336 tp_is_empty!6417)))

(declare-fun mapIsEmpty!10891 () Bool)

(declare-fun mapRes!10891 () Bool)

(assert (=> mapIsEmpty!10891 mapRes!10891))

(declare-fun condMapEmpty!10891 () Bool)

(declare-fun mapDefault!10891 () ValueCell!2865)

(assert (=> mapNonEmpty!10885 (= condMapEmpty!10891 (= mapRest!10885 ((as const (Array (_ BitVec 32) ValueCell!2865)) mapDefault!10891)))))

(assert (=> mapNonEmpty!10885 (= tp!22896 (and e!159335 mapRes!10891))))

(declare-fun mapNonEmpty!10891 () Bool)

(declare-fun tp!22906 () Bool)

(assert (=> mapNonEmpty!10891 (= mapRes!10891 (and tp!22906 e!159336))))

(declare-fun mapKey!10891 () (_ BitVec 32))

(declare-fun mapValue!10891 () ValueCell!2865)

(declare-fun mapRest!10891 () (Array (_ BitVec 32) ValueCell!2865))

(assert (=> mapNonEmpty!10891 (= mapRest!10885 (store mapRest!10891 mapKey!10891 mapValue!10891))))

(assert (= (and mapNonEmpty!10885 condMapEmpty!10891) mapIsEmpty!10891))

(assert (= (and mapNonEmpty!10885 (not condMapEmpty!10891)) mapNonEmpty!10891))

(assert (= (and mapNonEmpty!10891 ((_ is ValueCellFull!2865) mapValue!10891)) b!245608))

(assert (= (and mapNonEmpty!10885 ((_ is ValueCellFull!2865) mapDefault!10891)) b!245609))

(declare-fun m!263171 () Bool)

(assert (=> mapNonEmpty!10891 m!263171))

(declare-fun b_lambda!8025 () Bool)

(assert (= b_lambda!8023 (or (and b!245340 b_free!6555) b_lambda!8025)))

(check-sat (not bm!22921) (not b!245578) (not b!245597) (not d!60189) (not b!245593) (not b!245565) (not bm!22928) (not bm!22922) (not b!245481) (not b!245567) (not mapNonEmpty!10891) (not b!245564) (not b!245433) (not bm!22929) (not b!245554) (not b!245487) (not bm!22920) (not b!245493) (not b_next!6555) (not b!245431) (not b!245548) (not b!245490) (not b!245476) (not b!245540) (not b!245547) (not b!245424) (not bm!22935) (not d!60185) (not bm!22917) tp_is_empty!6417 (not d!60201) (not d!60187) (not b!245484) (not b!245600) (not b!245592) (not bm!22932) (not b_lambda!8025) (not bm!22936) (not b!245486) (not d!60203) (not b!245485) (not b!245549) (not d!60211) (not d!60199) (not d!60191) (not b!245590) b_and!13547 (not d!60193))
(check-sat b_and!13547 (not b_next!6555))
