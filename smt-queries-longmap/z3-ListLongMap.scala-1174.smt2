; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25238 () Bool)

(assert start!25238)

(declare-fun b!262934 () Bool)

(declare-fun b_free!6795 () Bool)

(declare-fun b_next!6795 () Bool)

(assert (=> b!262934 (= b_free!6795 (not b_next!6795))))

(declare-fun tp!23721 () Bool)

(declare-fun b_and!13937 () Bool)

(assert (=> b!262934 (= tp!23721 b_and!13937)))

(declare-fun b!262917 () Bool)

(declare-fun e!170385 () Bool)

(declare-fun e!170392 () Bool)

(assert (=> b!262917 (= e!170385 e!170392)))

(declare-fun res!128414 () Bool)

(assert (=> b!262917 (=> (not res!128414) (not e!170392))))

(declare-datatypes ((SeekEntryResult!1200 0))(
  ( (MissingZero!1200 (index!6970 (_ BitVec 32))) (Found!1200 (index!6971 (_ BitVec 32))) (Intermediate!1200 (undefined!2012 Bool) (index!6972 (_ BitVec 32)) (x!25242 (_ BitVec 32))) (Undefined!1200) (MissingVacant!1200 (index!6973 (_ BitVec 32))) )
))
(declare-fun lt!133018 () SeekEntryResult!1200)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!262917 (= res!128414 (or (= lt!133018 (MissingZero!1200 index!297)) (= lt!133018 (MissingVacant!1200 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8523 0))(
  ( (V!8524 (val!3373 Int)) )
))
(declare-datatypes ((ValueCell!2985 0))(
  ( (ValueCellFull!2985 (v!5504 V!8523)) (EmptyCell!2985) )
))
(declare-datatypes ((array!12675 0))(
  ( (array!12676 (arr!5998 (Array (_ BitVec 32) ValueCell!2985)) (size!6349 (_ BitVec 32))) )
))
(declare-datatypes ((array!12677 0))(
  ( (array!12678 (arr!5999 (Array (_ BitVec 32) (_ BitVec 64))) (size!6350 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3870 0))(
  ( (LongMapFixedSize!3871 (defaultEntry!4843 Int) (mask!11209 (_ BitVec 32)) (extraKeys!4580 (_ BitVec 32)) (zeroValue!4684 V!8523) (minValue!4684 V!8523) (_size!1984 (_ BitVec 32)) (_keys!7035 array!12677) (_values!4826 array!12675) (_vacant!1984 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3870)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12677 (_ BitVec 32)) SeekEntryResult!1200)

(assert (=> b!262917 (= lt!133018 (seekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!262918 () Bool)

(declare-fun e!170387 () Bool)

(declare-fun e!170398 () Bool)

(assert (=> b!262918 (= e!170387 e!170398)))

(declare-fun res!128412 () Bool)

(assert (=> b!262918 (=> (not res!128412) (not e!170398))))

(declare-datatypes ((tuple2!4978 0))(
  ( (tuple2!4979 (_1!2500 (_ BitVec 64)) (_2!2500 V!8523)) )
))
(declare-datatypes ((List!3852 0))(
  ( (Nil!3849) (Cons!3848 (h!4514 tuple2!4978) (t!8929 List!3852)) )
))
(declare-datatypes ((ListLongMap!3891 0))(
  ( (ListLongMap!3892 (toList!1961 List!3852)) )
))
(declare-fun lt!133009 () ListLongMap!3891)

(declare-fun contains!1912 (ListLongMap!3891 (_ BitVec 64)) Bool)

(assert (=> b!262918 (= res!128412 (contains!1912 lt!133009 key!932))))

(declare-fun lt!133015 () LongMapFixedSize!3870)

(declare-fun map!2758 (LongMapFixedSize!3870) ListLongMap!3891)

(assert (=> b!262918 (= lt!133009 (map!2758 lt!133015))))

(declare-fun lt!133020 () tuple2!4978)

(declare-fun b!262920 () Bool)

(declare-fun +!710 (ListLongMap!3891 tuple2!4978) ListLongMap!3891)

(assert (=> b!262920 (= e!170398 (= lt!133009 (+!710 (map!2758 thiss!1504) lt!133020)))))

(declare-fun b!262921 () Bool)

(declare-fun e!170393 () Bool)

(declare-fun call!25147 () Bool)

(assert (=> b!262921 (= e!170393 (not call!25147))))

(declare-fun b!262922 () Bool)

(declare-fun e!170388 () Bool)

(assert (=> b!262922 (= e!170392 e!170388)))

(declare-fun res!128419 () Bool)

(assert (=> b!262922 (=> (not res!128419) (not e!170388))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262922 (= res!128419 (inRange!0 index!297 (mask!11209 thiss!1504)))))

(declare-datatypes ((Unit!8190 0))(
  ( (Unit!8191) )
))
(declare-fun lt!133022 () Unit!8190)

(declare-fun e!170397 () Unit!8190)

(assert (=> b!262922 (= lt!133022 e!170397)))

(declare-fun c!44821 () Bool)

(declare-fun lt!133012 () ListLongMap!3891)

(assert (=> b!262922 (= c!44821 (contains!1912 lt!133012 key!932))))

(declare-fun getCurrentListMap!1489 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 32) Int) ListLongMap!3891)

(assert (=> b!262922 (= lt!133012 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun bm!25144 () Bool)

(declare-fun arrayContainsKey!0 (array!12677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25144 (= call!25147 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262923 () Bool)

(assert (=> b!262923 (= e!170388 (not e!170387))))

(declare-fun res!128413 () Bool)

(assert (=> b!262923 (=> (not res!128413) (not e!170387))))

(declare-fun valid!1507 (LongMapFixedSize!3870) Bool)

(assert (=> b!262923 (= res!128413 (valid!1507 lt!133015))))

(declare-fun lt!133025 () ListLongMap!3891)

(assert (=> b!262923 (contains!1912 lt!133025 key!932)))

(declare-fun lt!133017 () Unit!8190)

(declare-fun lt!133026 () array!12677)

(declare-fun lt!133023 () array!12675)

(declare-fun lemmaValidKeyInArrayIsInListMap!152 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 32) Int) Unit!8190)

(assert (=> b!262923 (= lt!133017 (lemmaValidKeyInArrayIsInListMap!152 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 (defaultEntry!4843 thiss!1504)))))

(assert (=> b!262923 (= lt!133015 (LongMapFixedSize!3871 (defaultEntry!4843 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1984 thiss!1504)) lt!133026 lt!133023 (_vacant!1984 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262923 (= (arrayCountValidKeys!0 lt!133026 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!133019 () Unit!8190)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12677 (_ BitVec 32)) Unit!8190)

(assert (=> b!262923 (= lt!133019 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!133026 index!297))))

(assert (=> b!262923 (arrayContainsKey!0 lt!133026 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!133016 () Unit!8190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12677 (_ BitVec 64) (_ BitVec 32)) Unit!8190)

(assert (=> b!262923 (= lt!133016 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 key!932 index!297))))

(declare-fun lt!133007 () ListLongMap!3891)

(assert (=> b!262923 (= lt!133007 lt!133025)))

(assert (=> b!262923 (= lt!133025 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(assert (=> b!262923 (= lt!133007 (+!710 lt!133012 lt!133020))))

(declare-fun v!346 () V!8523)

(assert (=> b!262923 (= lt!133023 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))))))

(assert (=> b!262923 (= lt!133020 (tuple2!4979 key!932 v!346))))

(declare-fun lt!133013 () Unit!8190)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!120 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 32) (_ BitVec 64) V!8523 Int) Unit!8190)

(assert (=> b!262923 (= lt!133013 (lemmaAddValidKeyToArrayThenAddPairToListMap!120 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 key!932 v!346 (defaultEntry!4843 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12677 (_ BitVec 32)) Bool)

(assert (=> b!262923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!133026 (mask!11209 thiss!1504))))

(declare-fun lt!133021 () Unit!8190)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12677 (_ BitVec 32) (_ BitVec 32)) Unit!8190)

(assert (=> b!262923 (= lt!133021 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) index!297 (mask!11209 thiss!1504)))))

(assert (=> b!262923 (= (arrayCountValidKeys!0 lt!133026 #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504)))))))

(declare-fun lt!133014 () Unit!8190)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12677 (_ BitVec 32) (_ BitVec 64)) Unit!8190)

(assert (=> b!262923 (= lt!133014 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7035 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3853 0))(
  ( (Nil!3850) (Cons!3849 (h!4515 (_ BitVec 64)) (t!8930 List!3853)) )
))
(declare-fun arrayNoDuplicates!0 (array!12677 (_ BitVec 32) List!3853) Bool)

(assert (=> b!262923 (arrayNoDuplicates!0 lt!133026 #b00000000000000000000000000000000 Nil!3850)))

(assert (=> b!262923 (= lt!133026 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun lt!133010 () Unit!8190)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3853) Unit!8190)

(assert (=> b!262923 (= lt!133010 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7035 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3850))))

(declare-fun lt!133006 () Unit!8190)

(declare-fun e!170390 () Unit!8190)

(assert (=> b!262923 (= lt!133006 e!170390)))

(declare-fun c!44824 () Bool)

(assert (=> b!262923 (= c!44824 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262924 () Bool)

(declare-fun e!170391 () Bool)

(assert (=> b!262924 (= e!170391 (not call!25147))))

(declare-fun b!262925 () Bool)

(declare-fun res!128420 () Bool)

(assert (=> b!262925 (= res!128420 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133018)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262925 (=> (not res!128420) (not e!170391))))

(declare-fun b!262926 () Bool)

(declare-fun Unit!8192 () Unit!8190)

(assert (=> b!262926 (= e!170397 Unit!8192)))

(declare-fun lt!133011 () Unit!8190)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!455 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 64) Int) Unit!8190)

(assert (=> b!262926 (= lt!133011 (lemmaInListMapThenSeekEntryOrOpenFindsIt!455 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)))))

(assert (=> b!262926 false))

(declare-fun b!262927 () Bool)

(declare-fun Unit!8193 () Unit!8190)

(assert (=> b!262927 (= e!170390 Unit!8193)))

(declare-fun b!262928 () Bool)

(declare-fun e!170399 () Bool)

(declare-fun tp_is_empty!6657 () Bool)

(assert (=> b!262928 (= e!170399 tp_is_empty!6657)))

(declare-fun b!262919 () Bool)

(declare-fun Unit!8194 () Unit!8190)

(assert (=> b!262919 (= e!170390 Unit!8194)))

(declare-fun lt!133024 () Unit!8190)

(declare-fun lemmaArrayContainsKeyThenInListMap!262 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 64) (_ BitVec 32) Int) Unit!8190)

(assert (=> b!262919 (= lt!133024 (lemmaArrayContainsKeyThenInListMap!262 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(assert (=> b!262919 false))

(declare-fun res!128417 () Bool)

(assert (=> start!25238 (=> (not res!128417) (not e!170385))))

(assert (=> start!25238 (= res!128417 (valid!1507 thiss!1504))))

(assert (=> start!25238 e!170385))

(declare-fun e!170386 () Bool)

(assert (=> start!25238 e!170386))

(assert (=> start!25238 true))

(assert (=> start!25238 tp_is_empty!6657))

(declare-fun b!262929 () Bool)

(declare-fun e!170384 () Bool)

(get-info :version)

(assert (=> b!262929 (= e!170384 ((_ is Undefined!1200) lt!133018))))

(declare-fun b!262930 () Bool)

(declare-fun res!128418 () Bool)

(assert (=> b!262930 (=> (not res!128418) (not e!170393))))

(assert (=> b!262930 (= res!128418 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6970 lt!133018)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!11350 () Bool)

(declare-fun mapRes!11350 () Bool)

(declare-fun tp!23722 () Bool)

(assert (=> mapNonEmpty!11350 (= mapRes!11350 (and tp!23722 e!170399))))

(declare-fun mapRest!11350 () (Array (_ BitVec 32) ValueCell!2985))

(declare-fun mapValue!11350 () ValueCell!2985)

(declare-fun mapKey!11350 () (_ BitVec 32))

(assert (=> mapNonEmpty!11350 (= (arr!5998 (_values!4826 thiss!1504)) (store mapRest!11350 mapKey!11350 mapValue!11350))))

(declare-fun b!262931 () Bool)

(declare-fun lt!133008 () Unit!8190)

(assert (=> b!262931 (= e!170397 lt!133008)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!455 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 64) Int) Unit!8190)

(assert (=> b!262931 (= lt!133008 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!455 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)))))

(declare-fun c!44822 () Bool)

(assert (=> b!262931 (= c!44822 ((_ is MissingZero!1200) lt!133018))))

(declare-fun e!170394 () Bool)

(assert (=> b!262931 e!170394))

(declare-fun b!262932 () Bool)

(declare-fun res!128416 () Bool)

(assert (=> b!262932 (=> (not res!128416) (not e!170393))))

(declare-fun call!25148 () Bool)

(assert (=> b!262932 (= res!128416 call!25148)))

(assert (=> b!262932 (= e!170394 e!170393)))

(declare-fun b!262933 () Bool)

(assert (=> b!262933 (= e!170384 e!170391)))

(declare-fun res!128411 () Bool)

(assert (=> b!262933 (= res!128411 call!25148)))

(assert (=> b!262933 (=> (not res!128411) (not e!170391))))

(declare-fun e!170395 () Bool)

(declare-fun array_inv!3963 (array!12677) Bool)

(declare-fun array_inv!3964 (array!12675) Bool)

(assert (=> b!262934 (= e!170386 (and tp!23721 tp_is_empty!6657 (array_inv!3963 (_keys!7035 thiss!1504)) (array_inv!3964 (_values!4826 thiss!1504)) e!170395))))

(declare-fun mapIsEmpty!11350 () Bool)

(assert (=> mapIsEmpty!11350 mapRes!11350))

(declare-fun b!262935 () Bool)

(declare-fun c!44823 () Bool)

(assert (=> b!262935 (= c!44823 ((_ is MissingVacant!1200) lt!133018))))

(assert (=> b!262935 (= e!170394 e!170384)))

(declare-fun bm!25145 () Bool)

(assert (=> bm!25145 (= call!25148 (inRange!0 (ite c!44822 (index!6970 lt!133018) (index!6973 lt!133018)) (mask!11209 thiss!1504)))))

(declare-fun b!262936 () Bool)

(declare-fun e!170396 () Bool)

(assert (=> b!262936 (= e!170396 tp_is_empty!6657)))

(declare-fun b!262937 () Bool)

(declare-fun res!128415 () Bool)

(assert (=> b!262937 (=> (not res!128415) (not e!170385))))

(assert (=> b!262937 (= res!128415 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262938 () Bool)

(assert (=> b!262938 (= e!170395 (and e!170396 mapRes!11350))))

(declare-fun condMapEmpty!11350 () Bool)

(declare-fun mapDefault!11350 () ValueCell!2985)

(assert (=> b!262938 (= condMapEmpty!11350 (= (arr!5998 (_values!4826 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2985)) mapDefault!11350)))))

(assert (= (and start!25238 res!128417) b!262937))

(assert (= (and b!262937 res!128415) b!262917))

(assert (= (and b!262917 res!128414) b!262922))

(assert (= (and b!262922 c!44821) b!262926))

(assert (= (and b!262922 (not c!44821)) b!262931))

(assert (= (and b!262931 c!44822) b!262932))

(assert (= (and b!262931 (not c!44822)) b!262935))

(assert (= (and b!262932 res!128416) b!262930))

(assert (= (and b!262930 res!128418) b!262921))

(assert (= (and b!262935 c!44823) b!262933))

(assert (= (and b!262935 (not c!44823)) b!262929))

(assert (= (and b!262933 res!128411) b!262925))

(assert (= (and b!262925 res!128420) b!262924))

(assert (= (or b!262932 b!262933) bm!25145))

(assert (= (or b!262921 b!262924) bm!25144))

(assert (= (and b!262922 res!128419) b!262923))

(assert (= (and b!262923 c!44824) b!262919))

(assert (= (and b!262923 (not c!44824)) b!262927))

(assert (= (and b!262923 res!128413) b!262918))

(assert (= (and b!262918 res!128412) b!262920))

(assert (= (and b!262938 condMapEmpty!11350) mapIsEmpty!11350))

(assert (= (and b!262938 (not condMapEmpty!11350)) mapNonEmpty!11350))

(assert (= (and mapNonEmpty!11350 ((_ is ValueCellFull!2985) mapValue!11350)) b!262928))

(assert (= (and b!262938 ((_ is ValueCellFull!2985) mapDefault!11350)) b!262936))

(assert (= b!262934 b!262938))

(assert (= start!25238 b!262934))

(declare-fun m!278981 () Bool)

(assert (=> b!262934 m!278981))

(declare-fun m!278983 () Bool)

(assert (=> b!262934 m!278983))

(declare-fun m!278985 () Bool)

(assert (=> b!262918 m!278985))

(declare-fun m!278987 () Bool)

(assert (=> b!262918 m!278987))

(declare-fun m!278989 () Bool)

(assert (=> b!262920 m!278989))

(assert (=> b!262920 m!278989))

(declare-fun m!278991 () Bool)

(assert (=> b!262920 m!278991))

(declare-fun m!278993 () Bool)

(assert (=> b!262931 m!278993))

(declare-fun m!278995 () Bool)

(assert (=> start!25238 m!278995))

(declare-fun m!278997 () Bool)

(assert (=> b!262925 m!278997))

(declare-fun m!278999 () Bool)

(assert (=> b!262926 m!278999))

(declare-fun m!279001 () Bool)

(assert (=> b!262923 m!279001))

(declare-fun m!279003 () Bool)

(assert (=> b!262923 m!279003))

(declare-fun m!279005 () Bool)

(assert (=> b!262923 m!279005))

(declare-fun m!279007 () Bool)

(assert (=> b!262923 m!279007))

(declare-fun m!279009 () Bool)

(assert (=> b!262923 m!279009))

(declare-fun m!279011 () Bool)

(assert (=> b!262923 m!279011))

(declare-fun m!279013 () Bool)

(assert (=> b!262923 m!279013))

(declare-fun m!279015 () Bool)

(assert (=> b!262923 m!279015))

(declare-fun m!279017 () Bool)

(assert (=> b!262923 m!279017))

(declare-fun m!279019 () Bool)

(assert (=> b!262923 m!279019))

(declare-fun m!279021 () Bool)

(assert (=> b!262923 m!279021))

(declare-fun m!279023 () Bool)

(assert (=> b!262923 m!279023))

(declare-fun m!279025 () Bool)

(assert (=> b!262923 m!279025))

(declare-fun m!279027 () Bool)

(assert (=> b!262923 m!279027))

(declare-fun m!279029 () Bool)

(assert (=> b!262923 m!279029))

(declare-fun m!279031 () Bool)

(assert (=> b!262923 m!279031))

(declare-fun m!279033 () Bool)

(assert (=> b!262923 m!279033))

(declare-fun m!279035 () Bool)

(assert (=> b!262923 m!279035))

(declare-fun m!279037 () Bool)

(assert (=> b!262923 m!279037))

(declare-fun m!279039 () Bool)

(assert (=> b!262923 m!279039))

(assert (=> bm!25144 m!279001))

(declare-fun m!279041 () Bool)

(assert (=> b!262922 m!279041))

(declare-fun m!279043 () Bool)

(assert (=> b!262922 m!279043))

(declare-fun m!279045 () Bool)

(assert (=> b!262922 m!279045))

(declare-fun m!279047 () Bool)

(assert (=> b!262919 m!279047))

(declare-fun m!279049 () Bool)

(assert (=> b!262917 m!279049))

(declare-fun m!279051 () Bool)

(assert (=> b!262930 m!279051))

(declare-fun m!279053 () Bool)

(assert (=> mapNonEmpty!11350 m!279053))

(declare-fun m!279055 () Bool)

(assert (=> bm!25145 m!279055))

(check-sat (not bm!25145) (not b!262931) (not mapNonEmpty!11350) (not b_next!6795) (not b!262919) tp_is_empty!6657 b_and!13937 (not b!262926) (not start!25238) (not b!262920) (not b!262917) (not bm!25144) (not b!262934) (not b!262922) (not b!262923) (not b!262918))
(check-sat b_and!13937 (not b_next!6795))
(get-model)

(declare-fun b!263017 () Bool)

(declare-fun e!170456 () SeekEntryResult!1200)

(declare-fun lt!133097 () SeekEntryResult!1200)

(assert (=> b!263017 (= e!170456 (MissingZero!1200 (index!6972 lt!133097)))))

(declare-fun b!263018 () Bool)

(declare-fun e!170455 () SeekEntryResult!1200)

(declare-fun e!170454 () SeekEntryResult!1200)

(assert (=> b!263018 (= e!170455 e!170454)))

(declare-fun lt!133098 () (_ BitVec 64))

(assert (=> b!263018 (= lt!133098 (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133097)))))

(declare-fun c!44845 () Bool)

(assert (=> b!263018 (= c!44845 (= lt!133098 key!932))))

(declare-fun b!263019 () Bool)

(declare-fun c!44843 () Bool)

(assert (=> b!263019 (= c!44843 (= lt!133098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263019 (= e!170454 e!170456)))

(declare-fun b!263020 () Bool)

(assert (=> b!263020 (= e!170454 (Found!1200 (index!6972 lt!133097)))))

(declare-fun b!263021 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12677 (_ BitVec 32)) SeekEntryResult!1200)

(assert (=> b!263021 (= e!170456 (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133097) (index!6972 lt!133097) (index!6972 lt!133097) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun d!63077 () Bool)

(declare-fun lt!133096 () SeekEntryResult!1200)

(assert (=> d!63077 (and (or ((_ is Undefined!1200) lt!133096) (not ((_ is Found!1200) lt!133096)) (and (bvsge (index!6971 lt!133096) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133096) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133096) ((_ is Found!1200) lt!133096) (not ((_ is MissingZero!1200) lt!133096)) (and (bvsge (index!6970 lt!133096) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133096) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133096) ((_ is Found!1200) lt!133096) ((_ is MissingZero!1200) lt!133096) (not ((_ is MissingVacant!1200) lt!133096)) (and (bvsge (index!6973 lt!133096) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133096) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133096) (ite ((_ is Found!1200) lt!133096) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6971 lt!133096)) key!932) (ite ((_ is MissingZero!1200) lt!133096) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6970 lt!133096)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1200) lt!133096) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133096)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63077 (= lt!133096 e!170455)))

(declare-fun c!44844 () Bool)

(assert (=> d!63077 (= c!44844 (and ((_ is Intermediate!1200) lt!133097) (undefined!2012 lt!133097)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12677 (_ BitVec 32)) SeekEntryResult!1200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63077 (= lt!133097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11209 thiss!1504)) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!63077 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63077 (= (seekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) lt!133096)))

(declare-fun b!263022 () Bool)

(assert (=> b!263022 (= e!170455 Undefined!1200)))

(assert (= (and d!63077 c!44844) b!263022))

(assert (= (and d!63077 (not c!44844)) b!263018))

(assert (= (and b!263018 c!44845) b!263020))

(assert (= (and b!263018 (not c!44845)) b!263019))

(assert (= (and b!263019 c!44843) b!263017))

(assert (= (and b!263019 (not c!44843)) b!263021))

(declare-fun m!279133 () Bool)

(assert (=> b!263018 m!279133))

(declare-fun m!279135 () Bool)

(assert (=> b!263021 m!279135))

(declare-fun m!279137 () Bool)

(assert (=> d!63077 m!279137))

(declare-fun m!279139 () Bool)

(assert (=> d!63077 m!279139))

(declare-fun m!279141 () Bool)

(assert (=> d!63077 m!279141))

(declare-fun m!279143 () Bool)

(assert (=> d!63077 m!279143))

(declare-fun m!279145 () Bool)

(assert (=> d!63077 m!279145))

(assert (=> d!63077 m!279143))

(declare-fun m!279147 () Bool)

(assert (=> d!63077 m!279147))

(assert (=> b!262917 d!63077))

(declare-fun d!63079 () Bool)

(declare-fun e!170459 () Bool)

(assert (=> d!63079 e!170459))

(declare-fun res!128456 () Bool)

(assert (=> d!63079 (=> (not res!128456) (not e!170459))))

(declare-fun lt!133104 () SeekEntryResult!1200)

(assert (=> d!63079 (= res!128456 ((_ is Found!1200) lt!133104))))

(assert (=> d!63079 (= lt!133104 (seekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun lt!133103 () Unit!8190)

(declare-fun choose!1288 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 64) Int) Unit!8190)

(assert (=> d!63079 (= lt!133103 (choose!1288 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)))))

(assert (=> d!63079 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63079 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!455 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)) lt!133103)))

(declare-fun b!263027 () Bool)

(declare-fun res!128455 () Bool)

(assert (=> b!263027 (=> (not res!128455) (not e!170459))))

(assert (=> b!263027 (= res!128455 (inRange!0 (index!6971 lt!133104) (mask!11209 thiss!1504)))))

(declare-fun b!263028 () Bool)

(assert (=> b!263028 (= e!170459 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6971 lt!133104)) key!932))))

(assert (=> b!263028 (and (bvsge (index!6971 lt!133104) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133104) (size!6350 (_keys!7035 thiss!1504))))))

(assert (= (and d!63079 res!128456) b!263027))

(assert (= (and b!263027 res!128455) b!263028))

(assert (=> d!63079 m!279049))

(declare-fun m!279149 () Bool)

(assert (=> d!63079 m!279149))

(assert (=> d!63079 m!279139))

(declare-fun m!279151 () Bool)

(assert (=> b!263027 m!279151))

(declare-fun m!279153 () Bool)

(assert (=> b!263028 m!279153))

(assert (=> b!262926 d!63079))

(declare-fun d!63081 () Bool)

(assert (=> d!63081 (= (inRange!0 (ite c!44822 (index!6970 lt!133018) (index!6973 lt!133018)) (mask!11209 thiss!1504)) (and (bvsge (ite c!44822 (index!6970 lt!133018) (index!6973 lt!133018)) #b00000000000000000000000000000000) (bvslt (ite c!44822 (index!6970 lt!133018) (index!6973 lt!133018)) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25145 d!63081))

(declare-fun d!63083 () Bool)

(declare-fun e!170464 () Bool)

(assert (=> d!63083 e!170464))

(declare-fun res!128459 () Bool)

(assert (=> d!63083 (=> res!128459 e!170464)))

(declare-fun lt!133114 () Bool)

(assert (=> d!63083 (= res!128459 (not lt!133114))))

(declare-fun lt!133113 () Bool)

(assert (=> d!63083 (= lt!133114 lt!133113)))

(declare-fun lt!133115 () Unit!8190)

(declare-fun e!170465 () Unit!8190)

(assert (=> d!63083 (= lt!133115 e!170465)))

(declare-fun c!44848 () Bool)

(assert (=> d!63083 (= c!44848 lt!133113)))

(declare-fun containsKey!312 (List!3852 (_ BitVec 64)) Bool)

(assert (=> d!63083 (= lt!133113 (containsKey!312 (toList!1961 lt!133009) key!932))))

(assert (=> d!63083 (= (contains!1912 lt!133009 key!932) lt!133114)))

(declare-fun b!263035 () Bool)

(declare-fun lt!133116 () Unit!8190)

(assert (=> b!263035 (= e!170465 lt!133116)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!260 (List!3852 (_ BitVec 64)) Unit!8190)

(assert (=> b!263035 (= lt!133116 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133009) key!932))))

(declare-datatypes ((Option!326 0))(
  ( (Some!325 (v!5508 V!8523)) (None!324) )
))
(declare-fun isDefined!261 (Option!326) Bool)

(declare-fun getValueByKey!320 (List!3852 (_ BitVec 64)) Option!326)

(assert (=> b!263035 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133009) key!932))))

(declare-fun b!263036 () Bool)

(declare-fun Unit!8199 () Unit!8190)

(assert (=> b!263036 (= e!170465 Unit!8199)))

(declare-fun b!263037 () Bool)

(assert (=> b!263037 (= e!170464 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133009) key!932)))))

(assert (= (and d!63083 c!44848) b!263035))

(assert (= (and d!63083 (not c!44848)) b!263036))

(assert (= (and d!63083 (not res!128459)) b!263037))

(declare-fun m!279155 () Bool)

(assert (=> d!63083 m!279155))

(declare-fun m!279157 () Bool)

(assert (=> b!263035 m!279157))

(declare-fun m!279159 () Bool)

(assert (=> b!263035 m!279159))

(assert (=> b!263035 m!279159))

(declare-fun m!279161 () Bool)

(assert (=> b!263035 m!279161))

(assert (=> b!263037 m!279159))

(assert (=> b!263037 m!279159))

(assert (=> b!263037 m!279161))

(assert (=> b!262918 d!63083))

(declare-fun d!63085 () Bool)

(assert (=> d!63085 (= (map!2758 lt!133015) (getCurrentListMap!1489 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)))))

(declare-fun bs!9247 () Bool)

(assert (= bs!9247 d!63085))

(declare-fun m!279163 () Bool)

(assert (=> bs!9247 m!279163))

(assert (=> b!262918 d!63085))

(declare-fun d!63087 () Bool)

(declare-fun e!170468 () Bool)

(assert (=> d!63087 e!170468))

(declare-fun res!128464 () Bool)

(assert (=> d!63087 (=> (not res!128464) (not e!170468))))

(declare-fun lt!133127 () ListLongMap!3891)

(assert (=> d!63087 (= res!128464 (contains!1912 lt!133127 (_1!2500 lt!133020)))))

(declare-fun lt!133128 () List!3852)

(assert (=> d!63087 (= lt!133127 (ListLongMap!3892 lt!133128))))

(declare-fun lt!133126 () Unit!8190)

(declare-fun lt!133125 () Unit!8190)

(assert (=> d!63087 (= lt!133126 lt!133125)))

(assert (=> d!63087 (= (getValueByKey!320 lt!133128 (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020)))))

(declare-fun lemmaContainsTupThenGetReturnValue!176 (List!3852 (_ BitVec 64) V!8523) Unit!8190)

(assert (=> d!63087 (= lt!133125 (lemmaContainsTupThenGetReturnValue!176 lt!133128 (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun insertStrictlySorted!179 (List!3852 (_ BitVec 64) V!8523) List!3852)

(assert (=> d!63087 (= lt!133128 (insertStrictlySorted!179 (toList!1961 (map!2758 thiss!1504)) (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(assert (=> d!63087 (= (+!710 (map!2758 thiss!1504) lt!133020) lt!133127)))

(declare-fun b!263042 () Bool)

(declare-fun res!128465 () Bool)

(assert (=> b!263042 (=> (not res!128465) (not e!170468))))

(assert (=> b!263042 (= res!128465 (= (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020))))))

(declare-fun b!263043 () Bool)

(declare-fun contains!1914 (List!3852 tuple2!4978) Bool)

(assert (=> b!263043 (= e!170468 (contains!1914 (toList!1961 lt!133127) lt!133020))))

(assert (= (and d!63087 res!128464) b!263042))

(assert (= (and b!263042 res!128465) b!263043))

(declare-fun m!279165 () Bool)

(assert (=> d!63087 m!279165))

(declare-fun m!279167 () Bool)

(assert (=> d!63087 m!279167))

(declare-fun m!279169 () Bool)

(assert (=> d!63087 m!279169))

(declare-fun m!279171 () Bool)

(assert (=> d!63087 m!279171))

(declare-fun m!279173 () Bool)

(assert (=> b!263042 m!279173))

(declare-fun m!279175 () Bool)

(assert (=> b!263043 m!279175))

(assert (=> b!262920 d!63087))

(declare-fun d!63089 () Bool)

(assert (=> d!63089 (= (map!2758 thiss!1504) (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun bs!9248 () Bool)

(assert (= bs!9248 d!63089))

(assert (=> bs!9248 m!279045))

(assert (=> b!262920 d!63089))

(declare-fun d!63091 () Bool)

(assert (=> d!63091 (contains!1912 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) key!932)))

(declare-fun lt!133131 () Unit!8190)

(declare-fun choose!1289 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 64) (_ BitVec 32) Int) Unit!8190)

(assert (=> d!63091 (= lt!133131 (choose!1289 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(assert (=> d!63091 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63091 (= (lemmaArrayContainsKeyThenInListMap!262 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133131)))

(declare-fun bs!9249 () Bool)

(assert (= bs!9249 d!63091))

(assert (=> bs!9249 m!279045))

(assert (=> bs!9249 m!279045))

(declare-fun m!279177 () Bool)

(assert (=> bs!9249 m!279177))

(declare-fun m!279179 () Bool)

(assert (=> bs!9249 m!279179))

(assert (=> bs!9249 m!279139))

(assert (=> b!262919 d!63091))

(declare-fun b!263060 () Bool)

(declare-fun res!128474 () Bool)

(declare-fun e!170479 () Bool)

(assert (=> b!263060 (=> (not res!128474) (not e!170479))))

(declare-fun lt!133136 () SeekEntryResult!1200)

(assert (=> b!263060 (= res!128474 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263060 (and (bvsge (index!6973 lt!133136) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133136) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63093 () Bool)

(declare-fun e!170480 () Bool)

(assert (=> d!63093 e!170480))

(declare-fun c!44853 () Bool)

(assert (=> d!63093 (= c!44853 ((_ is MissingZero!1200) lt!133136))))

(assert (=> d!63093 (= lt!133136 (seekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun lt!133137 () Unit!8190)

(declare-fun choose!1290 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 64) Int) Unit!8190)

(assert (=> d!63093 (= lt!133137 (choose!1290 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)))))

(assert (=> d!63093 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63093 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!455 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)) lt!133137)))

(declare-fun b!263061 () Bool)

(declare-fun res!128475 () Bool)

(assert (=> b!263061 (=> (not res!128475) (not e!170479))))

(declare-fun call!25159 () Bool)

(assert (=> b!263061 (= res!128475 call!25159)))

(declare-fun e!170478 () Bool)

(assert (=> b!263061 (= e!170478 e!170479)))

(declare-fun b!263062 () Bool)

(declare-fun e!170477 () Bool)

(assert (=> b!263062 (= e!170480 e!170477)))

(declare-fun res!128477 () Bool)

(assert (=> b!263062 (= res!128477 call!25159)))

(assert (=> b!263062 (=> (not res!128477) (not e!170477))))

(declare-fun b!263063 () Bool)

(assert (=> b!263063 (= e!170478 ((_ is Undefined!1200) lt!133136))))

(declare-fun b!263064 () Bool)

(assert (=> b!263064 (and (bvsge (index!6970 lt!133136) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133136) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128476 () Bool)

(assert (=> b!263064 (= res!128476 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6970 lt!133136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263064 (=> (not res!128476) (not e!170477))))

(declare-fun bm!25156 () Bool)

(assert (=> bm!25156 (= call!25159 (inRange!0 (ite c!44853 (index!6970 lt!133136) (index!6973 lt!133136)) (mask!11209 thiss!1504)))))

(declare-fun b!263065 () Bool)

(declare-fun call!25160 () Bool)

(assert (=> b!263065 (= e!170479 (not call!25160))))

(declare-fun b!263066 () Bool)

(assert (=> b!263066 (= e!170480 e!170478)))

(declare-fun c!44854 () Bool)

(assert (=> b!263066 (= c!44854 ((_ is MissingVacant!1200) lt!133136))))

(declare-fun b!263067 () Bool)

(assert (=> b!263067 (= e!170477 (not call!25160))))

(declare-fun bm!25157 () Bool)

(assert (=> bm!25157 (= call!25160 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!63093 c!44853) b!263062))

(assert (= (and d!63093 (not c!44853)) b!263066))

(assert (= (and b!263062 res!128477) b!263064))

(assert (= (and b!263064 res!128476) b!263067))

(assert (= (and b!263066 c!44854) b!263061))

(assert (= (and b!263066 (not c!44854)) b!263063))

(assert (= (and b!263061 res!128475) b!263060))

(assert (= (and b!263060 res!128474) b!263065))

(assert (= (or b!263062 b!263061) bm!25156))

(assert (= (or b!263067 b!263065) bm!25157))

(assert (=> d!63093 m!279049))

(declare-fun m!279181 () Bool)

(assert (=> d!63093 m!279181))

(assert (=> d!63093 m!279139))

(declare-fun m!279183 () Bool)

(assert (=> b!263064 m!279183))

(declare-fun m!279185 () Bool)

(assert (=> b!263060 m!279185))

(declare-fun m!279187 () Bool)

(assert (=> bm!25156 m!279187))

(assert (=> bm!25157 m!279001))

(assert (=> b!262931 d!63093))

(declare-fun d!63095 () Bool)

(assert (=> d!63095 (= (inRange!0 index!297 (mask!11209 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262922 d!63095))

(declare-fun d!63097 () Bool)

(declare-fun e!170481 () Bool)

(assert (=> d!63097 e!170481))

(declare-fun res!128478 () Bool)

(assert (=> d!63097 (=> res!128478 e!170481)))

(declare-fun lt!133139 () Bool)

(assert (=> d!63097 (= res!128478 (not lt!133139))))

(declare-fun lt!133138 () Bool)

(assert (=> d!63097 (= lt!133139 lt!133138)))

(declare-fun lt!133140 () Unit!8190)

(declare-fun e!170482 () Unit!8190)

(assert (=> d!63097 (= lt!133140 e!170482)))

(declare-fun c!44855 () Bool)

(assert (=> d!63097 (= c!44855 lt!133138)))

(assert (=> d!63097 (= lt!133138 (containsKey!312 (toList!1961 lt!133012) key!932))))

(assert (=> d!63097 (= (contains!1912 lt!133012 key!932) lt!133139)))

(declare-fun b!263068 () Bool)

(declare-fun lt!133141 () Unit!8190)

(assert (=> b!263068 (= e!170482 lt!133141)))

(assert (=> b!263068 (= lt!133141 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133012) key!932))))

(assert (=> b!263068 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133012) key!932))))

(declare-fun b!263069 () Bool)

(declare-fun Unit!8200 () Unit!8190)

(assert (=> b!263069 (= e!170482 Unit!8200)))

(declare-fun b!263070 () Bool)

(assert (=> b!263070 (= e!170481 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133012) key!932)))))

(assert (= (and d!63097 c!44855) b!263068))

(assert (= (and d!63097 (not c!44855)) b!263069))

(assert (= (and d!63097 (not res!128478)) b!263070))

(declare-fun m!279189 () Bool)

(assert (=> d!63097 m!279189))

(declare-fun m!279191 () Bool)

(assert (=> b!263068 m!279191))

(declare-fun m!279193 () Bool)

(assert (=> b!263068 m!279193))

(assert (=> b!263068 m!279193))

(declare-fun m!279195 () Bool)

(assert (=> b!263068 m!279195))

(assert (=> b!263070 m!279193))

(assert (=> b!263070 m!279193))

(assert (=> b!263070 m!279195))

(assert (=> b!262922 d!63097))

(declare-fun d!63099 () Bool)

(declare-fun e!170513 () Bool)

(assert (=> d!63099 e!170513))

(declare-fun res!128505 () Bool)

(assert (=> d!63099 (=> (not res!128505) (not e!170513))))

(assert (=> d!63099 (= res!128505 (or (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun lt!133201 () ListLongMap!3891)

(declare-fun lt!133192 () ListLongMap!3891)

(assert (=> d!63099 (= lt!133201 lt!133192)))

(declare-fun lt!133195 () Unit!8190)

(declare-fun e!170509 () Unit!8190)

(assert (=> d!63099 (= lt!133195 e!170509)))

(declare-fun c!44868 () Bool)

(declare-fun e!170516 () Bool)

(assert (=> d!63099 (= c!44868 e!170516)))

(declare-fun res!128500 () Bool)

(assert (=> d!63099 (=> (not res!128500) (not e!170516))))

(assert (=> d!63099 (= res!128500 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun e!170511 () ListLongMap!3891)

(assert (=> d!63099 (= lt!133192 e!170511)))

(declare-fun c!44872 () Bool)

(assert (=> d!63099 (= c!44872 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63099 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63099 (= (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133201)))

(declare-fun b!263113 () Bool)

(declare-fun Unit!8201 () Unit!8190)

(assert (=> b!263113 (= e!170509 Unit!8201)))

(declare-fun b!263114 () Bool)

(declare-fun e!170518 () Bool)

(declare-fun apply!262 (ListLongMap!3891 (_ BitVec 64)) V!8523)

(declare-fun get!3093 (ValueCell!2985 V!8523) V!8523)

(declare-fun dynLambda!605 (Int (_ BitVec 64)) V!8523)

(assert (=> b!263114 (= e!170518 (= (apply!262 lt!133201 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 (_values!4826 thiss!1504))))))

(assert (=> b!263114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!263115 () Bool)

(declare-fun e!170519 () Bool)

(declare-fun call!25179 () Bool)

(assert (=> b!263115 (= e!170519 (not call!25179))))

(declare-fun b!263116 () Bool)

(assert (=> b!263116 (= e!170513 e!170519)))

(declare-fun c!44871 () Bool)

(assert (=> b!263116 (= c!44871 (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263117 () Bool)

(declare-fun e!170521 () Bool)

(assert (=> b!263117 (= e!170521 (= (apply!262 lt!133201 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4684 thiss!1504)))))

(declare-fun bm!25172 () Bool)

(declare-fun call!25177 () ListLongMap!3891)

(declare-fun getCurrentListMapNoExtraKeys!584 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 32) Int) ListLongMap!3891)

(assert (=> bm!25172 (= call!25177 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun b!263118 () Bool)

(declare-fun res!128497 () Bool)

(assert (=> b!263118 (=> (not res!128497) (not e!170513))))

(declare-fun e!170510 () Bool)

(assert (=> b!263118 (= res!128497 e!170510)))

(declare-fun c!44870 () Bool)

(assert (=> b!263118 (= c!44870 (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!263119 () Bool)

(declare-fun res!128499 () Bool)

(assert (=> b!263119 (=> (not res!128499) (not e!170513))))

(declare-fun e!170515 () Bool)

(assert (=> b!263119 (= res!128499 e!170515)))

(declare-fun res!128498 () Bool)

(assert (=> b!263119 (=> res!128498 e!170515)))

(declare-fun e!170517 () Bool)

(assert (=> b!263119 (= res!128498 (not e!170517))))

(declare-fun res!128501 () Bool)

(assert (=> b!263119 (=> (not res!128501) (not e!170517))))

(assert (=> b!263119 (= res!128501 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun bm!25173 () Bool)

(assert (=> bm!25173 (= call!25179 (contains!1912 lt!133201 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263120 () Bool)

(declare-fun lt!133206 () Unit!8190)

(assert (=> b!263120 (= e!170509 lt!133206)))

(declare-fun lt!133207 () ListLongMap!3891)

(assert (=> b!263120 (= lt!133207 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133187 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133187 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133200 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133200 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133197 () Unit!8190)

(declare-fun addStillContains!238 (ListLongMap!3891 (_ BitVec 64) V!8523 (_ BitVec 64)) Unit!8190)

(assert (=> b!263120 (= lt!133197 (addStillContains!238 lt!133207 lt!133187 (zeroValue!4684 thiss!1504) lt!133200))))

(assert (=> b!263120 (contains!1912 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) lt!133200)))

(declare-fun lt!133189 () Unit!8190)

(assert (=> b!263120 (= lt!133189 lt!133197)))

(declare-fun lt!133203 () ListLongMap!3891)

(assert (=> b!263120 (= lt!133203 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133202 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133202 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133186 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133186 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133205 () Unit!8190)

(declare-fun addApplyDifferent!238 (ListLongMap!3891 (_ BitVec 64) V!8523 (_ BitVec 64)) Unit!8190)

(assert (=> b!263120 (= lt!133205 (addApplyDifferent!238 lt!133203 lt!133202 (minValue!4684 thiss!1504) lt!133186))))

(assert (=> b!263120 (= (apply!262 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) lt!133186) (apply!262 lt!133203 lt!133186))))

(declare-fun lt!133191 () Unit!8190)

(assert (=> b!263120 (= lt!133191 lt!133205)))

(declare-fun lt!133193 () ListLongMap!3891)

(assert (=> b!263120 (= lt!133193 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133194 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133198 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133198 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133204 () Unit!8190)

(assert (=> b!263120 (= lt!133204 (addApplyDifferent!238 lt!133193 lt!133194 (zeroValue!4684 thiss!1504) lt!133198))))

(assert (=> b!263120 (= (apply!262 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) lt!133198) (apply!262 lt!133193 lt!133198))))

(declare-fun lt!133196 () Unit!8190)

(assert (=> b!263120 (= lt!133196 lt!133204)))

(declare-fun lt!133199 () ListLongMap!3891)

(assert (=> b!263120 (= lt!133199 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133188 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133188 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133190 () (_ BitVec 64))

(assert (=> b!263120 (= lt!133190 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!263120 (= lt!133206 (addApplyDifferent!238 lt!133199 lt!133188 (minValue!4684 thiss!1504) lt!133190))))

(assert (=> b!263120 (= (apply!262 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) lt!133190) (apply!262 lt!133199 lt!133190))))

(declare-fun bm!25174 () Bool)

(declare-fun call!25176 () ListLongMap!3891)

(declare-fun call!25175 () ListLongMap!3891)

(assert (=> bm!25174 (= call!25176 call!25175)))

(declare-fun b!263121 () Bool)

(declare-fun e!170512 () ListLongMap!3891)

(declare-fun call!25180 () ListLongMap!3891)

(assert (=> b!263121 (= e!170512 call!25180)))

(declare-fun b!263122 () Bool)

(declare-fun call!25181 () ListLongMap!3891)

(assert (=> b!263122 (= e!170511 (+!710 call!25181 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun bm!25175 () Bool)

(assert (=> bm!25175 (= call!25175 call!25177)))

(declare-fun b!263123 () Bool)

(declare-fun e!170514 () Bool)

(assert (=> b!263123 (= e!170514 (= (apply!262 lt!133201 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4684 thiss!1504)))))

(declare-fun bm!25176 () Bool)

(declare-fun c!44869 () Bool)

(assert (=> bm!25176 (= call!25181 (+!710 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263124 () Bool)

(declare-fun c!44873 () Bool)

(assert (=> b!263124 (= c!44873 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170520 () ListLongMap!3891)

(assert (=> b!263124 (= e!170512 e!170520)))

(declare-fun b!263125 () Bool)

(assert (=> b!263125 (= e!170510 e!170521)))

(declare-fun res!128502 () Bool)

(declare-fun call!25178 () Bool)

(assert (=> b!263125 (= res!128502 call!25178)))

(assert (=> b!263125 (=> (not res!128502) (not e!170521))))

(declare-fun b!263126 () Bool)

(assert (=> b!263126 (= e!170520 call!25180)))

(declare-fun b!263127 () Bool)

(assert (=> b!263127 (= e!170515 e!170518)))

(declare-fun res!128503 () Bool)

(assert (=> b!263127 (=> (not res!128503) (not e!170518))))

(assert (=> b!263127 (= res!128503 (contains!1912 lt!133201 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun bm!25177 () Bool)

(assert (=> bm!25177 (= call!25178 (contains!1912 lt!133201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263128 () Bool)

(assert (=> b!263128 (= e!170511 e!170512)))

(assert (=> b!263128 (= c!44869 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263129 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!263129 (= e!170517 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263130 () Bool)

(assert (=> b!263130 (= e!170510 (not call!25178))))

(declare-fun b!263131 () Bool)

(assert (=> b!263131 (= e!170520 call!25176)))

(declare-fun b!263132 () Bool)

(assert (=> b!263132 (= e!170519 e!170514)))

(declare-fun res!128504 () Bool)

(assert (=> b!263132 (= res!128504 call!25179)))

(assert (=> b!263132 (=> (not res!128504) (not e!170514))))

(declare-fun b!263133 () Bool)

(assert (=> b!263133 (= e!170516 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25178 () Bool)

(assert (=> bm!25178 (= call!25180 call!25181)))

(assert (= (and d!63099 c!44872) b!263122))

(assert (= (and d!63099 (not c!44872)) b!263128))

(assert (= (and b!263128 c!44869) b!263121))

(assert (= (and b!263128 (not c!44869)) b!263124))

(assert (= (and b!263124 c!44873) b!263126))

(assert (= (and b!263124 (not c!44873)) b!263131))

(assert (= (or b!263126 b!263131) bm!25174))

(assert (= (or b!263121 bm!25174) bm!25175))

(assert (= (or b!263121 b!263126) bm!25178))

(assert (= (or b!263122 bm!25175) bm!25172))

(assert (= (or b!263122 bm!25178) bm!25176))

(assert (= (and d!63099 res!128500) b!263133))

(assert (= (and d!63099 c!44868) b!263120))

(assert (= (and d!63099 (not c!44868)) b!263113))

(assert (= (and d!63099 res!128505) b!263119))

(assert (= (and b!263119 res!128501) b!263129))

(assert (= (and b!263119 (not res!128498)) b!263127))

(assert (= (and b!263127 res!128503) b!263114))

(assert (= (and b!263119 res!128499) b!263118))

(assert (= (and b!263118 c!44870) b!263125))

(assert (= (and b!263118 (not c!44870)) b!263130))

(assert (= (and b!263125 res!128502) b!263117))

(assert (= (or b!263125 b!263130) bm!25177))

(assert (= (and b!263118 res!128497) b!263116))

(assert (= (and b!263116 c!44871) b!263132))

(assert (= (and b!263116 (not c!44871)) b!263115))

(assert (= (and b!263132 res!128504) b!263123))

(assert (= (or b!263132 b!263115) bm!25173))

(declare-fun b_lambda!8331 () Bool)

(assert (=> (not b_lambda!8331) (not b!263114)))

(declare-fun t!8933 () Bool)

(declare-fun tb!3037 () Bool)

(assert (=> (and b!262934 (= (defaultEntry!4843 thiss!1504) (defaultEntry!4843 thiss!1504)) t!8933) tb!3037))

(declare-fun result!5433 () Bool)

(assert (=> tb!3037 (= result!5433 tp_is_empty!6657)))

(assert (=> b!263114 t!8933))

(declare-fun b_and!13941 () Bool)

(assert (= b_and!13937 (and (=> t!8933 result!5433) b_and!13941)))

(declare-fun m!279197 () Bool)

(assert (=> bm!25176 m!279197))

(declare-fun m!279199 () Bool)

(assert (=> b!263129 m!279199))

(assert (=> b!263129 m!279199))

(declare-fun m!279201 () Bool)

(assert (=> b!263129 m!279201))

(assert (=> b!263133 m!279199))

(assert (=> b!263133 m!279199))

(assert (=> b!263133 m!279201))

(declare-fun m!279203 () Bool)

(assert (=> bm!25177 m!279203))

(declare-fun m!279205 () Bool)

(assert (=> bm!25172 m!279205))

(declare-fun m!279207 () Bool)

(assert (=> b!263117 m!279207))

(assert (=> d!63099 m!279139))

(declare-fun m!279209 () Bool)

(assert (=> bm!25173 m!279209))

(assert (=> b!263127 m!279199))

(assert (=> b!263127 m!279199))

(declare-fun m!279211 () Bool)

(assert (=> b!263127 m!279211))

(declare-fun m!279213 () Bool)

(assert (=> b!263122 m!279213))

(declare-fun m!279215 () Bool)

(assert (=> b!263120 m!279215))

(declare-fun m!279217 () Bool)

(assert (=> b!263120 m!279217))

(declare-fun m!279219 () Bool)

(assert (=> b!263120 m!279219))

(declare-fun m!279221 () Bool)

(assert (=> b!263120 m!279221))

(declare-fun m!279223 () Bool)

(assert (=> b!263120 m!279223))

(assert (=> b!263120 m!279219))

(assert (=> b!263120 m!279199))

(declare-fun m!279225 () Bool)

(assert (=> b!263120 m!279225))

(assert (=> b!263120 m!279223))

(declare-fun m!279227 () Bool)

(assert (=> b!263120 m!279227))

(declare-fun m!279229 () Bool)

(assert (=> b!263120 m!279229))

(assert (=> b!263120 m!279215))

(declare-fun m!279231 () Bool)

(assert (=> b!263120 m!279231))

(assert (=> b!263120 m!279205))

(declare-fun m!279233 () Bool)

(assert (=> b!263120 m!279233))

(declare-fun m!279235 () Bool)

(assert (=> b!263120 m!279235))

(declare-fun m!279237 () Bool)

(assert (=> b!263120 m!279237))

(assert (=> b!263120 m!279235))

(declare-fun m!279239 () Bool)

(assert (=> b!263120 m!279239))

(declare-fun m!279241 () Bool)

(assert (=> b!263120 m!279241))

(declare-fun m!279243 () Bool)

(assert (=> b!263120 m!279243))

(declare-fun m!279245 () Bool)

(assert (=> b!263123 m!279245))

(assert (=> b!263114 m!279199))

(declare-fun m!279247 () Bool)

(assert (=> b!263114 m!279247))

(declare-fun m!279249 () Bool)

(assert (=> b!263114 m!279249))

(declare-fun m!279251 () Bool)

(assert (=> b!263114 m!279251))

(declare-fun m!279253 () Bool)

(assert (=> b!263114 m!279253))

(assert (=> b!263114 m!279251))

(assert (=> b!263114 m!279249))

(assert (=> b!263114 m!279199))

(assert (=> b!262922 d!63099))

(declare-fun b!263144 () Bool)

(declare-fun e!170526 () (_ BitVec 32))

(assert (=> b!263144 (= e!170526 #b00000000000000000000000000000000)))

(declare-fun b!263146 () Bool)

(declare-fun e!170527 () (_ BitVec 32))

(assert (=> b!263146 (= e!170526 e!170527)))

(declare-fun c!44879 () Bool)

(assert (=> b!263146 (= c!44879 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263147 () Bool)

(declare-fun call!25184 () (_ BitVec 32))

(assert (=> b!263147 (= e!170527 call!25184)))

(declare-fun bm!25181 () Bool)

(assert (=> bm!25181 (= call!25184 (arrayCountValidKeys!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63101 () Bool)

(declare-fun lt!133210 () (_ BitVec 32))

(assert (=> d!63101 (and (bvsge lt!133210 #b00000000000000000000000000000000) (bvsle lt!133210 (bvsub (size!6350 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> d!63101 (= lt!133210 e!170526)))

(declare-fun c!44878 () Bool)

(assert (=> d!63101 (= c!44878 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63101 (and (bvsle #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 lt!133026)))))

(assert (=> d!63101 (= (arrayCountValidKeys!0 lt!133026 #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) lt!133210)))

(declare-fun b!263145 () Bool)

(assert (=> b!263145 (= e!170527 (bvadd #b00000000000000000000000000000001 call!25184))))

(assert (= (and d!63101 c!44878) b!263144))

(assert (= (and d!63101 (not c!44878)) b!263146))

(assert (= (and b!263146 c!44879) b!263145))

(assert (= (and b!263146 (not c!44879)) b!263147))

(assert (= (or b!263145 b!263147) bm!25181))

(declare-fun m!279255 () Bool)

(assert (=> b!263146 m!279255))

(assert (=> b!263146 m!279255))

(declare-fun m!279257 () Bool)

(assert (=> b!263146 m!279257))

(declare-fun m!279259 () Bool)

(assert (=> bm!25181 m!279259))

(assert (=> b!262923 d!63101))

(declare-fun b!263156 () Bool)

(declare-fun res!128517 () Bool)

(declare-fun e!170532 () Bool)

(assert (=> b!263156 (=> (not res!128517) (not e!170532))))

(assert (=> b!263156 (= res!128517 (not (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) index!297))))))

(declare-fun e!170533 () Bool)

(declare-fun b!263159 () Bool)

(assert (=> b!263159 (= e!170533 (= (arrayCountValidKeys!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!63103 () Bool)

(assert (=> d!63103 e!170533))

(declare-fun res!128516 () Bool)

(assert (=> d!63103 (=> (not res!128516) (not e!170533))))

(assert (=> d!63103 (= res!128516 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 (_keys!7035 thiss!1504)))))))

(declare-fun lt!133213 () Unit!8190)

(declare-fun choose!1 (array!12677 (_ BitVec 32) (_ BitVec 64)) Unit!8190)

(assert (=> d!63103 (= lt!133213 (choose!1 (_keys!7035 thiss!1504) index!297 key!932))))

(assert (=> d!63103 e!170532))

(declare-fun res!128514 () Bool)

(assert (=> d!63103 (=> (not res!128514) (not e!170532))))

(assert (=> d!63103 (= res!128514 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 (_keys!7035 thiss!1504)))))))

(assert (=> d!63103 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7035 thiss!1504) index!297 key!932) lt!133213)))

(declare-fun b!263157 () Bool)

(declare-fun res!128515 () Bool)

(assert (=> b!263157 (=> (not res!128515) (not e!170532))))

(assert (=> b!263157 (= res!128515 (validKeyInArray!0 key!932))))

(declare-fun b!263158 () Bool)

(assert (=> b!263158 (= e!170532 (bvslt (size!6350 (_keys!7035 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!63103 res!128514) b!263156))

(assert (= (and b!263156 res!128517) b!263157))

(assert (= (and b!263157 res!128515) b!263158))

(assert (= (and d!63103 res!128516) b!263159))

(declare-fun m!279261 () Bool)

(assert (=> b!263156 m!279261))

(assert (=> b!263156 m!279261))

(declare-fun m!279263 () Bool)

(assert (=> b!263156 m!279263))

(assert (=> b!263159 m!279017))

(declare-fun m!279265 () Bool)

(assert (=> b!263159 m!279265))

(assert (=> b!263159 m!279019))

(declare-fun m!279267 () Bool)

(assert (=> d!63103 m!279267))

(declare-fun m!279269 () Bool)

(assert (=> b!263157 m!279269))

(assert (=> b!262923 d!63103))

(declare-fun b!263169 () Bool)

(declare-fun e!170540 () Bool)

(declare-fun call!25187 () Bool)

(assert (=> b!263169 (= e!170540 call!25187)))

(declare-fun b!263170 () Bool)

(declare-fun e!170541 () Bool)

(assert (=> b!263170 (= e!170540 e!170541)))

(declare-fun lt!133220 () (_ BitVec 64))

(assert (=> b!263170 (= lt!133220 (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))

(declare-fun lt!133221 () Unit!8190)

(assert (=> b!263170 (= lt!133221 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 lt!133220 #b00000000000000000000000000000000))))

(assert (=> b!263170 (arrayContainsKey!0 lt!133026 lt!133220 #b00000000000000000000000000000000)))

(declare-fun lt!133222 () Unit!8190)

(assert (=> b!263170 (= lt!133222 lt!133221)))

(declare-fun res!128523 () Bool)

(assert (=> b!263170 (= res!128523 (= (seekEntryOrOpen!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)) (Found!1200 #b00000000000000000000000000000000)))))

(assert (=> b!263170 (=> (not res!128523) (not e!170541))))

(declare-fun b!263171 () Bool)

(assert (=> b!263171 (= e!170541 call!25187)))

(declare-fun bm!25184 () Bool)

(assert (=> bm!25184 (= call!25187 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun b!263168 () Bool)

(declare-fun e!170542 () Bool)

(assert (=> b!263168 (= e!170542 e!170540)))

(declare-fun c!44882 () Bool)

(assert (=> b!263168 (= c!44882 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun d!63105 () Bool)

(declare-fun res!128522 () Bool)

(assert (=> d!63105 (=> res!128522 e!170542)))

(assert (=> d!63105 (= res!128522 (bvsge #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(assert (=> d!63105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!133026 (mask!11209 thiss!1504)) e!170542)))

(assert (= (and d!63105 (not res!128522)) b!263168))

(assert (= (and b!263168 c!44882) b!263170))

(assert (= (and b!263168 (not c!44882)) b!263169))

(assert (= (and b!263170 res!128523) b!263171))

(assert (= (or b!263171 b!263169) bm!25184))

(assert (=> b!263170 m!279255))

(declare-fun m!279271 () Bool)

(assert (=> b!263170 m!279271))

(declare-fun m!279273 () Bool)

(assert (=> b!263170 m!279273))

(assert (=> b!263170 m!279255))

(declare-fun m!279275 () Bool)

(assert (=> b!263170 m!279275))

(declare-fun m!279277 () Bool)

(assert (=> bm!25184 m!279277))

(assert (=> b!263168 m!279255))

(assert (=> b!263168 m!279255))

(assert (=> b!263168 m!279257))

(assert (=> b!262923 d!63105))

(declare-fun b!263182 () Bool)

(declare-fun e!170551 () Bool)

(declare-fun contains!1915 (List!3853 (_ BitVec 64)) Bool)

(assert (=> b!263182 (= e!170551 (contains!1915 Nil!3850 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263184 () Bool)

(declare-fun e!170554 () Bool)

(declare-fun call!25190 () Bool)

(assert (=> b!263184 (= e!170554 call!25190)))

(declare-fun b!263185 () Bool)

(declare-fun e!170552 () Bool)

(assert (=> b!263185 (= e!170552 e!170554)))

(declare-fun c!44885 () Bool)

(assert (=> b!263185 (= c!44885 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263183 () Bool)

(declare-fun e!170553 () Bool)

(assert (=> b!263183 (= e!170553 e!170552)))

(declare-fun res!128531 () Bool)

(assert (=> b!263183 (=> (not res!128531) (not e!170552))))

(assert (=> b!263183 (= res!128531 (not e!170551))))

(declare-fun res!128532 () Bool)

(assert (=> b!263183 (=> (not res!128532) (not e!170551))))

(assert (=> b!263183 (= res!128532 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun d!63107 () Bool)

(declare-fun res!128530 () Bool)

(assert (=> d!63107 (=> res!128530 e!170553)))

(assert (=> d!63107 (= res!128530 (bvsge #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(assert (=> d!63107 (= (arrayNoDuplicates!0 lt!133026 #b00000000000000000000000000000000 Nil!3850) e!170553)))

(declare-fun bm!25187 () Bool)

(assert (=> bm!25187 (= call!25190 (arrayNoDuplicates!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)))))

(declare-fun b!263186 () Bool)

(assert (=> b!263186 (= e!170554 call!25190)))

(assert (= (and d!63107 (not res!128530)) b!263183))

(assert (= (and b!263183 res!128532) b!263182))

(assert (= (and b!263183 res!128531) b!263185))

(assert (= (and b!263185 c!44885) b!263184))

(assert (= (and b!263185 (not c!44885)) b!263186))

(assert (= (or b!263184 b!263186) bm!25187))

(assert (=> b!263182 m!279255))

(assert (=> b!263182 m!279255))

(declare-fun m!279279 () Bool)

(assert (=> b!263182 m!279279))

(assert (=> b!263185 m!279255))

(assert (=> b!263185 m!279255))

(assert (=> b!263185 m!279257))

(assert (=> b!263183 m!279255))

(assert (=> b!263183 m!279255))

(assert (=> b!263183 m!279257))

(assert (=> bm!25187 m!279255))

(declare-fun m!279281 () Bool)

(assert (=> bm!25187 m!279281))

(assert (=> b!262923 d!63107))

(declare-fun b!263187 () Bool)

(declare-fun e!170555 () (_ BitVec 32))

(assert (=> b!263187 (= e!170555 #b00000000000000000000000000000000)))

(declare-fun b!263189 () Bool)

(declare-fun e!170556 () (_ BitVec 32))

(assert (=> b!263189 (= e!170555 e!170556)))

(declare-fun c!44887 () Bool)

(assert (=> b!263189 (= c!44887 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263190 () Bool)

(declare-fun call!25191 () (_ BitVec 32))

(assert (=> b!263190 (= e!170556 call!25191)))

(declare-fun bm!25188 () Bool)

(assert (=> bm!25188 (= call!25191 (arrayCountValidKeys!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63109 () Bool)

(declare-fun lt!133223 () (_ BitVec 32))

(assert (=> d!63109 (and (bvsge lt!133223 #b00000000000000000000000000000000) (bvsle lt!133223 (bvsub (size!6350 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63109 (= lt!133223 e!170555)))

(declare-fun c!44886 () Bool)

(assert (=> d!63109 (= c!44886 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63109 (and (bvsle #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63109 (= (arrayCountValidKeys!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) lt!133223)))

(declare-fun b!263188 () Bool)

(assert (=> b!263188 (= e!170556 (bvadd #b00000000000000000000000000000001 call!25191))))

(assert (= (and d!63109 c!44886) b!263187))

(assert (= (and d!63109 (not c!44886)) b!263189))

(assert (= (and b!263189 c!44887) b!263188))

(assert (= (and b!263189 (not c!44887)) b!263190))

(assert (= (or b!263188 b!263190) bm!25188))

(assert (=> b!263189 m!279199))

(assert (=> b!263189 m!279199))

(assert (=> b!263189 m!279201))

(declare-fun m!279283 () Bool)

(assert (=> bm!25188 m!279283))

(assert (=> b!262923 d!63109))

(declare-fun d!63111 () Bool)

(declare-fun e!170557 () Bool)

(assert (=> d!63111 e!170557))

(declare-fun res!128533 () Bool)

(assert (=> d!63111 (=> res!128533 e!170557)))

(declare-fun lt!133225 () Bool)

(assert (=> d!63111 (= res!128533 (not lt!133225))))

(declare-fun lt!133224 () Bool)

(assert (=> d!63111 (= lt!133225 lt!133224)))

(declare-fun lt!133226 () Unit!8190)

(declare-fun e!170558 () Unit!8190)

(assert (=> d!63111 (= lt!133226 e!170558)))

(declare-fun c!44888 () Bool)

(assert (=> d!63111 (= c!44888 lt!133224)))

(assert (=> d!63111 (= lt!133224 (containsKey!312 (toList!1961 lt!133025) key!932))))

(assert (=> d!63111 (= (contains!1912 lt!133025 key!932) lt!133225)))

(declare-fun b!263191 () Bool)

(declare-fun lt!133227 () Unit!8190)

(assert (=> b!263191 (= e!170558 lt!133227)))

(assert (=> b!263191 (= lt!133227 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133025) key!932))))

(assert (=> b!263191 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133025) key!932))))

(declare-fun b!263192 () Bool)

(declare-fun Unit!8202 () Unit!8190)

(assert (=> b!263192 (= e!170558 Unit!8202)))

(declare-fun b!263193 () Bool)

(assert (=> b!263193 (= e!170557 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133025) key!932)))))

(assert (= (and d!63111 c!44888) b!263191))

(assert (= (and d!63111 (not c!44888)) b!263192))

(assert (= (and d!63111 (not res!128533)) b!263193))

(declare-fun m!279285 () Bool)

(assert (=> d!63111 m!279285))

(declare-fun m!279287 () Bool)

(assert (=> b!263191 m!279287))

(declare-fun m!279289 () Bool)

(assert (=> b!263191 m!279289))

(assert (=> b!263191 m!279289))

(declare-fun m!279291 () Bool)

(assert (=> b!263191 m!279291))

(assert (=> b!263193 m!279289))

(assert (=> b!263193 m!279289))

(assert (=> b!263193 m!279291))

(assert (=> b!262923 d!63111))

(declare-fun d!63113 () Bool)

(declare-fun res!128538 () Bool)

(declare-fun e!170563 () Bool)

(assert (=> d!63113 (=> res!128538 e!170563)))

(assert (=> d!63113 (= res!128538 (= (select (arr!5999 lt!133026) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63113 (= (arrayContainsKey!0 lt!133026 key!932 #b00000000000000000000000000000000) e!170563)))

(declare-fun b!263198 () Bool)

(declare-fun e!170564 () Bool)

(assert (=> b!263198 (= e!170563 e!170564)))

(declare-fun res!128539 () Bool)

(assert (=> b!263198 (=> (not res!128539) (not e!170564))))

(assert (=> b!263198 (= res!128539 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263199 () Bool)

(assert (=> b!263199 (= e!170564 (arrayContainsKey!0 lt!133026 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63113 (not res!128538)) b!263198))

(assert (= (and b!263198 res!128539) b!263199))

(assert (=> d!63113 m!279255))

(declare-fun m!279293 () Bool)

(assert (=> b!263199 m!279293))

(assert (=> b!262923 d!63113))

(declare-fun d!63115 () Bool)

(declare-fun res!128546 () Bool)

(declare-fun e!170567 () Bool)

(assert (=> d!63115 (=> (not res!128546) (not e!170567))))

(declare-fun simpleValid!285 (LongMapFixedSize!3870) Bool)

(assert (=> d!63115 (= res!128546 (simpleValid!285 lt!133015))))

(assert (=> d!63115 (= (valid!1507 lt!133015) e!170567)))

(declare-fun b!263206 () Bool)

(declare-fun res!128547 () Bool)

(assert (=> b!263206 (=> (not res!128547) (not e!170567))))

(assert (=> b!263206 (= res!128547 (= (arrayCountValidKeys!0 (_keys!7035 lt!133015) #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))) (_size!1984 lt!133015)))))

(declare-fun b!263207 () Bool)

(declare-fun res!128548 () Bool)

(assert (=> b!263207 (=> (not res!128548) (not e!170567))))

(assert (=> b!263207 (= res!128548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7035 lt!133015) (mask!11209 lt!133015)))))

(declare-fun b!263208 () Bool)

(assert (=> b!263208 (= e!170567 (arrayNoDuplicates!0 (_keys!7035 lt!133015) #b00000000000000000000000000000000 Nil!3850))))

(assert (= (and d!63115 res!128546) b!263206))

(assert (= (and b!263206 res!128547) b!263207))

(assert (= (and b!263207 res!128548) b!263208))

(declare-fun m!279295 () Bool)

(assert (=> d!63115 m!279295))

(declare-fun m!279297 () Bool)

(assert (=> b!263206 m!279297))

(declare-fun m!279299 () Bool)

(assert (=> b!263207 m!279299))

(declare-fun m!279301 () Bool)

(assert (=> b!263208 m!279301))

(assert (=> b!262923 d!63115))

(declare-fun d!63117 () Bool)

(assert (=> d!63117 (= (arrayCountValidKeys!0 lt!133026 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!133230 () Unit!8190)

(declare-fun choose!2 (array!12677 (_ BitVec 32)) Unit!8190)

(assert (=> d!63117 (= lt!133230 (choose!2 lt!133026 index!297))))

(declare-fun e!170570 () Bool)

(assert (=> d!63117 e!170570))

(declare-fun res!128553 () Bool)

(assert (=> d!63117 (=> (not res!128553) (not e!170570))))

(assert (=> d!63117 (= res!128553 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 lt!133026))))))

(assert (=> d!63117 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!133026 index!297) lt!133230)))

(declare-fun b!263213 () Bool)

(declare-fun res!128554 () Bool)

(assert (=> b!263213 (=> (not res!128554) (not e!170570))))

(assert (=> b!263213 (= res!128554 (validKeyInArray!0 (select (arr!5999 lt!133026) index!297)))))

(declare-fun b!263214 () Bool)

(assert (=> b!263214 (= e!170570 (bvslt (size!6350 lt!133026) #b01111111111111111111111111111111))))

(assert (= (and d!63117 res!128553) b!263213))

(assert (= (and b!263213 res!128554) b!263214))

(declare-fun m!279303 () Bool)

(assert (=> d!63117 m!279303))

(declare-fun m!279305 () Bool)

(assert (=> d!63117 m!279305))

(declare-fun m!279307 () Bool)

(assert (=> b!263213 m!279307))

(assert (=> b!263213 m!279307))

(declare-fun m!279309 () Bool)

(assert (=> b!263213 m!279309))

(assert (=> b!262923 d!63117))

(declare-fun b!263215 () Bool)

(declare-fun e!170571 () (_ BitVec 32))

(assert (=> b!263215 (= e!170571 #b00000000000000000000000000000000)))

(declare-fun b!263217 () Bool)

(declare-fun e!170572 () (_ BitVec 32))

(assert (=> b!263217 (= e!170571 e!170572)))

(declare-fun c!44890 () Bool)

(assert (=> b!263217 (= c!44890 (validKeyInArray!0 (select (arr!5999 lt!133026) index!297)))))

(declare-fun b!263218 () Bool)

(declare-fun call!25192 () (_ BitVec 32))

(assert (=> b!263218 (= e!170572 call!25192)))

(declare-fun bm!25189 () Bool)

(assert (=> bm!25189 (= call!25192 (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!63119 () Bool)

(declare-fun lt!133231 () (_ BitVec 32))

(assert (=> d!63119 (and (bvsge lt!133231 #b00000000000000000000000000000000) (bvsle lt!133231 (bvsub (size!6350 lt!133026) index!297)))))

(assert (=> d!63119 (= lt!133231 e!170571)))

(declare-fun c!44889 () Bool)

(assert (=> d!63119 (= c!44889 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63119 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6350 lt!133026)))))

(assert (=> d!63119 (= (arrayCountValidKeys!0 lt!133026 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!133231)))

(declare-fun b!263216 () Bool)

(assert (=> b!263216 (= e!170572 (bvadd #b00000000000000000000000000000001 call!25192))))

(assert (= (and d!63119 c!44889) b!263215))

(assert (= (and d!63119 (not c!44889)) b!263217))

(assert (= (and b!263217 c!44890) b!263216))

(assert (= (and b!263217 (not c!44890)) b!263218))

(assert (= (or b!263216 b!263218) bm!25189))

(assert (=> b!263217 m!279307))

(assert (=> b!263217 m!279307))

(assert (=> b!263217 m!279309))

(declare-fun m!279311 () Bool)

(assert (=> bm!25189 m!279311))

(assert (=> b!262923 d!63119))

(declare-fun d!63121 () Bool)

(declare-fun res!128555 () Bool)

(declare-fun e!170573 () Bool)

(assert (=> d!63121 (=> res!128555 e!170573)))

(assert (=> d!63121 (= res!128555 (= (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63121 (= (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 #b00000000000000000000000000000000) e!170573)))

(declare-fun b!263219 () Bool)

(declare-fun e!170574 () Bool)

(assert (=> b!263219 (= e!170573 e!170574)))

(declare-fun res!128556 () Bool)

(assert (=> b!263219 (=> (not res!128556) (not e!170574))))

(assert (=> b!263219 (= res!128556 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!263220 () Bool)

(assert (=> b!263220 (= e!170574 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63121 (not res!128555)) b!263219))

(assert (= (and b!263219 res!128556) b!263220))

(assert (=> d!63121 m!279199))

(declare-fun m!279313 () Bool)

(assert (=> b!263220 m!279313))

(assert (=> b!262923 d!63121))

(declare-fun d!63123 () Bool)

(declare-fun e!170577 () Bool)

(assert (=> d!63123 e!170577))

(declare-fun res!128559 () Bool)

(assert (=> d!63123 (=> (not res!128559) (not e!170577))))

(assert (=> d!63123 (= res!128559 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 (_keys!7035 thiss!1504)))))))

(declare-fun lt!133234 () Unit!8190)

(declare-fun choose!102 ((_ BitVec 64) array!12677 (_ BitVec 32) (_ BitVec 32)) Unit!8190)

(assert (=> d!63123 (= lt!133234 (choose!102 key!932 (_keys!7035 thiss!1504) index!297 (mask!11209 thiss!1504)))))

(assert (=> d!63123 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63123 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) index!297 (mask!11209 thiss!1504)) lt!133234)))

(declare-fun b!263223 () Bool)

(assert (=> b!263223 (= e!170577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)))))

(assert (= (and d!63123 res!128559) b!263223))

(declare-fun m!279315 () Bool)

(assert (=> d!63123 m!279315))

(assert (=> d!63123 m!279139))

(assert (=> b!263223 m!279017))

(declare-fun m!279317 () Bool)

(assert (=> b!263223 m!279317))

(assert (=> b!262923 d!63123))

(declare-fun d!63125 () Bool)

(declare-fun e!170580 () Bool)

(assert (=> d!63125 e!170580))

(declare-fun res!128562 () Bool)

(assert (=> d!63125 (=> (not res!128562) (not e!170580))))

(assert (=> d!63125 (= res!128562 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 lt!133026))))))

(declare-fun lt!133237 () Unit!8190)

(declare-fun choose!1291 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 32) Int) Unit!8190)

(assert (=> d!63125 (= lt!133237 (choose!1291 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 (defaultEntry!4843 thiss!1504)))))

(assert (=> d!63125 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63125 (= (lemmaValidKeyInArrayIsInListMap!152 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 (defaultEntry!4843 thiss!1504)) lt!133237)))

(declare-fun b!263226 () Bool)

(assert (=> b!263226 (= e!170580 (contains!1912 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) (select (arr!5999 lt!133026) index!297)))))

(assert (= (and d!63125 res!128562) b!263226))

(declare-fun m!279319 () Bool)

(assert (=> d!63125 m!279319))

(assert (=> d!63125 m!279139))

(assert (=> b!263226 m!279029))

(assert (=> b!263226 m!279307))

(assert (=> b!263226 m!279029))

(assert (=> b!263226 m!279307))

(declare-fun m!279321 () Bool)

(assert (=> b!263226 m!279321))

(assert (=> b!262923 d!63125))

(declare-fun d!63127 () Bool)

(declare-fun e!170583 () Bool)

(assert (=> d!63127 e!170583))

(declare-fun res!128565 () Bool)

(assert (=> d!63127 (=> (not res!128565) (not e!170583))))

(assert (=> d!63127 (= res!128565 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 (_keys!7035 thiss!1504))) (bvslt index!297 (size!6349 (_values!4826 thiss!1504)))))))

(declare-fun lt!133240 () Unit!8190)

(declare-fun choose!1292 (array!12677 array!12675 (_ BitVec 32) (_ BitVec 32) V!8523 V!8523 (_ BitVec 32) (_ BitVec 64) V!8523 Int) Unit!8190)

(assert (=> d!63127 (= lt!133240 (choose!1292 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 key!932 v!346 (defaultEntry!4843 thiss!1504)))))

(assert (=> d!63127 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63127 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!120 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 key!932 v!346 (defaultEntry!4843 thiss!1504)) lt!133240)))

(declare-fun b!263229 () Bool)

(assert (=> b!263229 (= e!170583 (= (+!710 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) (tuple2!4979 key!932 v!346)) (getCurrentListMap!1489 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))))

(assert (= (and d!63127 res!128565) b!263229))

(declare-fun m!279323 () Bool)

(assert (=> d!63127 m!279323))

(assert (=> d!63127 m!279139))

(assert (=> b!263229 m!279045))

(assert (=> b!263229 m!279045))

(declare-fun m!279325 () Bool)

(assert (=> b!263229 m!279325))

(declare-fun m!279327 () Bool)

(assert (=> b!263229 m!279327))

(assert (=> b!263229 m!279017))

(assert (=> b!263229 m!279007))

(assert (=> b!262923 d!63127))

(declare-fun d!63129 () Bool)

(declare-fun e!170588 () Bool)

(assert (=> d!63129 e!170588))

(declare-fun res!128574 () Bool)

(assert (=> d!63129 (=> (not res!128574) (not e!170588))))

(assert (=> d!63129 (= res!128574 (or (bvsge #b00000000000000000000000000000000 (size!6350 lt!133026)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))))

(declare-fun lt!133256 () ListLongMap!3891)

(declare-fun lt!133247 () ListLongMap!3891)

(assert (=> d!63129 (= lt!133256 lt!133247)))

(declare-fun lt!133250 () Unit!8190)

(declare-fun e!170584 () Unit!8190)

(assert (=> d!63129 (= lt!133250 e!170584)))

(declare-fun c!44891 () Bool)

(declare-fun e!170591 () Bool)

(assert (=> d!63129 (= c!44891 e!170591)))

(declare-fun res!128569 () Bool)

(assert (=> d!63129 (=> (not res!128569) (not e!170591))))

(assert (=> d!63129 (= res!128569 (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun e!170586 () ListLongMap!3891)

(assert (=> d!63129 (= lt!133247 e!170586)))

(declare-fun c!44895 () Bool)

(assert (=> d!63129 (= c!44895 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63129 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63129 (= (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133256)))

(declare-fun b!263230 () Bool)

(declare-fun Unit!8203 () Unit!8190)

(assert (=> b!263230 (= e!170584 Unit!8203)))

(declare-fun e!170593 () Bool)

(declare-fun b!263231 () Bool)

(assert (=> b!263231 (= e!170593 (= (apply!262 lt!133256 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 lt!133023)))))

(assert (=> b!263231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun b!263232 () Bool)

(declare-fun e!170594 () Bool)

(declare-fun call!25197 () Bool)

(assert (=> b!263232 (= e!170594 (not call!25197))))

(declare-fun b!263233 () Bool)

(assert (=> b!263233 (= e!170588 e!170594)))

(declare-fun c!44894 () Bool)

(assert (=> b!263233 (= c!44894 (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263234 () Bool)

(declare-fun e!170596 () Bool)

(assert (=> b!263234 (= e!170596 (= (apply!262 lt!133256 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4684 thiss!1504)))))

(declare-fun bm!25190 () Bool)

(declare-fun call!25195 () ListLongMap!3891)

(assert (=> bm!25190 (= call!25195 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun b!263235 () Bool)

(declare-fun res!128566 () Bool)

(assert (=> b!263235 (=> (not res!128566) (not e!170588))))

(declare-fun e!170585 () Bool)

(assert (=> b!263235 (= res!128566 e!170585)))

(declare-fun c!44893 () Bool)

(assert (=> b!263235 (= c!44893 (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!263236 () Bool)

(declare-fun res!128568 () Bool)

(assert (=> b!263236 (=> (not res!128568) (not e!170588))))

(declare-fun e!170590 () Bool)

(assert (=> b!263236 (= res!128568 e!170590)))

(declare-fun res!128567 () Bool)

(assert (=> b!263236 (=> res!128567 e!170590)))

(declare-fun e!170592 () Bool)

(assert (=> b!263236 (= res!128567 (not e!170592))))

(declare-fun res!128570 () Bool)

(assert (=> b!263236 (=> (not res!128570) (not e!170592))))

(assert (=> b!263236 (= res!128570 (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun bm!25191 () Bool)

(assert (=> bm!25191 (= call!25197 (contains!1912 lt!133256 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263237 () Bool)

(declare-fun lt!133261 () Unit!8190)

(assert (=> b!263237 (= e!170584 lt!133261)))

(declare-fun lt!133262 () ListLongMap!3891)

(assert (=> b!263237 (= lt!133262 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133242 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133255 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133255 (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))

(declare-fun lt!133252 () Unit!8190)

(assert (=> b!263237 (= lt!133252 (addStillContains!238 lt!133262 lt!133242 (zeroValue!4684 thiss!1504) lt!133255))))

(assert (=> b!263237 (contains!1912 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) lt!133255)))

(declare-fun lt!133244 () Unit!8190)

(assert (=> b!263237 (= lt!133244 lt!133252)))

(declare-fun lt!133258 () ListLongMap!3891)

(assert (=> b!263237 (= lt!133258 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133257 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133257 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133241 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133241 (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))

(declare-fun lt!133260 () Unit!8190)

(assert (=> b!263237 (= lt!133260 (addApplyDifferent!238 lt!133258 lt!133257 (minValue!4684 thiss!1504) lt!133241))))

(assert (=> b!263237 (= (apply!262 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) lt!133241) (apply!262 lt!133258 lt!133241))))

(declare-fun lt!133246 () Unit!8190)

(assert (=> b!263237 (= lt!133246 lt!133260)))

(declare-fun lt!133248 () ListLongMap!3891)

(assert (=> b!263237 (= lt!133248 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133249 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133253 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133253 (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))

(declare-fun lt!133259 () Unit!8190)

(assert (=> b!263237 (= lt!133259 (addApplyDifferent!238 lt!133248 lt!133249 (zeroValue!4684 thiss!1504) lt!133253))))

(assert (=> b!263237 (= (apply!262 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) lt!133253) (apply!262 lt!133248 lt!133253))))

(declare-fun lt!133251 () Unit!8190)

(assert (=> b!263237 (= lt!133251 lt!133259)))

(declare-fun lt!133254 () ListLongMap!3891)

(assert (=> b!263237 (= lt!133254 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133243 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133245 () (_ BitVec 64))

(assert (=> b!263237 (= lt!133245 (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))

(assert (=> b!263237 (= lt!133261 (addApplyDifferent!238 lt!133254 lt!133243 (minValue!4684 thiss!1504) lt!133245))))

(assert (=> b!263237 (= (apply!262 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) lt!133245) (apply!262 lt!133254 lt!133245))))

(declare-fun bm!25192 () Bool)

(declare-fun call!25194 () ListLongMap!3891)

(declare-fun call!25193 () ListLongMap!3891)

(assert (=> bm!25192 (= call!25194 call!25193)))

(declare-fun b!263238 () Bool)

(declare-fun e!170587 () ListLongMap!3891)

(declare-fun call!25198 () ListLongMap!3891)

(assert (=> b!263238 (= e!170587 call!25198)))

(declare-fun b!263239 () Bool)

(declare-fun call!25199 () ListLongMap!3891)

(assert (=> b!263239 (= e!170586 (+!710 call!25199 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun bm!25193 () Bool)

(assert (=> bm!25193 (= call!25193 call!25195)))

(declare-fun b!263240 () Bool)

(declare-fun e!170589 () Bool)

(assert (=> b!263240 (= e!170589 (= (apply!262 lt!133256 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4684 thiss!1504)))))

(declare-fun bm!25194 () Bool)

(declare-fun c!44892 () Bool)

(assert (=> bm!25194 (= call!25199 (+!710 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263241 () Bool)

(declare-fun c!44896 () Bool)

(assert (=> b!263241 (= c!44896 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170595 () ListLongMap!3891)

(assert (=> b!263241 (= e!170587 e!170595)))

(declare-fun b!263242 () Bool)

(assert (=> b!263242 (= e!170585 e!170596)))

(declare-fun res!128571 () Bool)

(declare-fun call!25196 () Bool)

(assert (=> b!263242 (= res!128571 call!25196)))

(assert (=> b!263242 (=> (not res!128571) (not e!170596))))

(declare-fun b!263243 () Bool)

(assert (=> b!263243 (= e!170595 call!25198)))

(declare-fun b!263244 () Bool)

(assert (=> b!263244 (= e!170590 e!170593)))

(declare-fun res!128572 () Bool)

(assert (=> b!263244 (=> (not res!128572) (not e!170593))))

(assert (=> b!263244 (= res!128572 (contains!1912 lt!133256 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> b!263244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun bm!25195 () Bool)

(assert (=> bm!25195 (= call!25196 (contains!1912 lt!133256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263245 () Bool)

(assert (=> b!263245 (= e!170586 e!170587)))

(assert (=> b!263245 (= c!44892 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263246 () Bool)

(assert (=> b!263246 (= e!170592 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263247 () Bool)

(assert (=> b!263247 (= e!170585 (not call!25196))))

(declare-fun b!263248 () Bool)

(assert (=> b!263248 (= e!170595 call!25194)))

(declare-fun b!263249 () Bool)

(assert (=> b!263249 (= e!170594 e!170589)))

(declare-fun res!128573 () Bool)

(assert (=> b!263249 (= res!128573 call!25197)))

(assert (=> b!263249 (=> (not res!128573) (not e!170589))))

(declare-fun b!263250 () Bool)

(assert (=> b!263250 (= e!170591 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun bm!25196 () Bool)

(assert (=> bm!25196 (= call!25198 call!25199)))

(assert (= (and d!63129 c!44895) b!263239))

(assert (= (and d!63129 (not c!44895)) b!263245))

(assert (= (and b!263245 c!44892) b!263238))

(assert (= (and b!263245 (not c!44892)) b!263241))

(assert (= (and b!263241 c!44896) b!263243))

(assert (= (and b!263241 (not c!44896)) b!263248))

(assert (= (or b!263243 b!263248) bm!25192))

(assert (= (or b!263238 bm!25192) bm!25193))

(assert (= (or b!263238 b!263243) bm!25196))

(assert (= (or b!263239 bm!25193) bm!25190))

(assert (= (or b!263239 bm!25196) bm!25194))

(assert (= (and d!63129 res!128569) b!263250))

(assert (= (and d!63129 c!44891) b!263237))

(assert (= (and d!63129 (not c!44891)) b!263230))

(assert (= (and d!63129 res!128574) b!263236))

(assert (= (and b!263236 res!128570) b!263246))

(assert (= (and b!263236 (not res!128567)) b!263244))

(assert (= (and b!263244 res!128572) b!263231))

(assert (= (and b!263236 res!128568) b!263235))

(assert (= (and b!263235 c!44893) b!263242))

(assert (= (and b!263235 (not c!44893)) b!263247))

(assert (= (and b!263242 res!128571) b!263234))

(assert (= (or b!263242 b!263247) bm!25195))

(assert (= (and b!263235 res!128566) b!263233))

(assert (= (and b!263233 c!44894) b!263249))

(assert (= (and b!263233 (not c!44894)) b!263232))

(assert (= (and b!263249 res!128573) b!263240))

(assert (= (or b!263249 b!263232) bm!25191))

(declare-fun b_lambda!8333 () Bool)

(assert (=> (not b_lambda!8333) (not b!263231)))

(assert (=> b!263231 t!8933))

(declare-fun b_and!13943 () Bool)

(assert (= b_and!13941 (and (=> t!8933 result!5433) b_and!13943)))

(declare-fun m!279329 () Bool)

(assert (=> bm!25194 m!279329))

(assert (=> b!263246 m!279255))

(assert (=> b!263246 m!279255))

(assert (=> b!263246 m!279257))

(assert (=> b!263250 m!279255))

(assert (=> b!263250 m!279255))

(assert (=> b!263250 m!279257))

(declare-fun m!279331 () Bool)

(assert (=> bm!25195 m!279331))

(declare-fun m!279333 () Bool)

(assert (=> bm!25190 m!279333))

(declare-fun m!279335 () Bool)

(assert (=> b!263234 m!279335))

(assert (=> d!63129 m!279139))

(declare-fun m!279337 () Bool)

(assert (=> bm!25191 m!279337))

(assert (=> b!263244 m!279255))

(assert (=> b!263244 m!279255))

(declare-fun m!279339 () Bool)

(assert (=> b!263244 m!279339))

(declare-fun m!279341 () Bool)

(assert (=> b!263239 m!279341))

(declare-fun m!279343 () Bool)

(assert (=> b!263237 m!279343))

(declare-fun m!279345 () Bool)

(assert (=> b!263237 m!279345))

(declare-fun m!279347 () Bool)

(assert (=> b!263237 m!279347))

(declare-fun m!279349 () Bool)

(assert (=> b!263237 m!279349))

(declare-fun m!279351 () Bool)

(assert (=> b!263237 m!279351))

(assert (=> b!263237 m!279347))

(assert (=> b!263237 m!279255))

(declare-fun m!279353 () Bool)

(assert (=> b!263237 m!279353))

(assert (=> b!263237 m!279351))

(declare-fun m!279355 () Bool)

(assert (=> b!263237 m!279355))

(declare-fun m!279357 () Bool)

(assert (=> b!263237 m!279357))

(assert (=> b!263237 m!279343))

(declare-fun m!279359 () Bool)

(assert (=> b!263237 m!279359))

(assert (=> b!263237 m!279333))

(declare-fun m!279361 () Bool)

(assert (=> b!263237 m!279361))

(declare-fun m!279363 () Bool)

(assert (=> b!263237 m!279363))

(declare-fun m!279365 () Bool)

(assert (=> b!263237 m!279365))

(assert (=> b!263237 m!279363))

(declare-fun m!279367 () Bool)

(assert (=> b!263237 m!279367))

(declare-fun m!279369 () Bool)

(assert (=> b!263237 m!279369))

(declare-fun m!279371 () Bool)

(assert (=> b!263237 m!279371))

(declare-fun m!279373 () Bool)

(assert (=> b!263240 m!279373))

(assert (=> b!263231 m!279255))

(declare-fun m!279375 () Bool)

(assert (=> b!263231 m!279375))

(declare-fun m!279377 () Bool)

(assert (=> b!263231 m!279377))

(assert (=> b!263231 m!279251))

(declare-fun m!279379 () Bool)

(assert (=> b!263231 m!279379))

(assert (=> b!263231 m!279251))

(assert (=> b!263231 m!279377))

(assert (=> b!263231 m!279255))

(assert (=> b!262923 d!63129))

(declare-fun d!63131 () Bool)

(declare-fun e!170597 () Bool)

(assert (=> d!63131 e!170597))

(declare-fun res!128575 () Bool)

(assert (=> d!63131 (=> (not res!128575) (not e!170597))))

(declare-fun lt!133265 () ListLongMap!3891)

(assert (=> d!63131 (= res!128575 (contains!1912 lt!133265 (_1!2500 lt!133020)))))

(declare-fun lt!133266 () List!3852)

(assert (=> d!63131 (= lt!133265 (ListLongMap!3892 lt!133266))))

(declare-fun lt!133264 () Unit!8190)

(declare-fun lt!133263 () Unit!8190)

(assert (=> d!63131 (= lt!133264 lt!133263)))

(assert (=> d!63131 (= (getValueByKey!320 lt!133266 (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020)))))

(assert (=> d!63131 (= lt!133263 (lemmaContainsTupThenGetReturnValue!176 lt!133266 (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(assert (=> d!63131 (= lt!133266 (insertStrictlySorted!179 (toList!1961 lt!133012) (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(assert (=> d!63131 (= (+!710 lt!133012 lt!133020) lt!133265)))

(declare-fun b!263251 () Bool)

(declare-fun res!128576 () Bool)

(assert (=> b!263251 (=> (not res!128576) (not e!170597))))

(assert (=> b!263251 (= res!128576 (= (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020))))))

(declare-fun b!263252 () Bool)

(assert (=> b!263252 (= e!170597 (contains!1914 (toList!1961 lt!133265) lt!133020))))

(assert (= (and d!63131 res!128575) b!263251))

(assert (= (and b!263251 res!128576) b!263252))

(declare-fun m!279381 () Bool)

(assert (=> d!63131 m!279381))

(declare-fun m!279383 () Bool)

(assert (=> d!63131 m!279383))

(declare-fun m!279385 () Bool)

(assert (=> d!63131 m!279385))

(declare-fun m!279387 () Bool)

(assert (=> d!63131 m!279387))

(declare-fun m!279389 () Bool)

(assert (=> b!263251 m!279389))

(declare-fun m!279391 () Bool)

(assert (=> b!263252 m!279391))

(assert (=> b!262923 d!63131))

(declare-fun d!63133 () Bool)

(assert (=> d!63133 (arrayContainsKey!0 lt!133026 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!133269 () Unit!8190)

(declare-fun choose!13 (array!12677 (_ BitVec 64) (_ BitVec 32)) Unit!8190)

(assert (=> d!63133 (= lt!133269 (choose!13 lt!133026 key!932 index!297))))

(assert (=> d!63133 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!63133 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 key!932 index!297) lt!133269)))

(declare-fun bs!9250 () Bool)

(assert (= bs!9250 d!63133))

(assert (=> bs!9250 m!279031))

(declare-fun m!279393 () Bool)

(assert (=> bs!9250 m!279393))

(assert (=> b!262923 d!63133))

(declare-fun d!63135 () Bool)

(declare-fun e!170600 () Bool)

(assert (=> d!63135 e!170600))

(declare-fun res!128579 () Bool)

(assert (=> d!63135 (=> (not res!128579) (not e!170600))))

(assert (=> d!63135 (= res!128579 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6350 (_keys!7035 thiss!1504)))))))

(declare-fun lt!133272 () Unit!8190)

(declare-fun choose!41 (array!12677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3853) Unit!8190)

(assert (=> d!63135 (= lt!133272 (choose!41 (_keys!7035 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3850))))

(assert (=> d!63135 (bvslt (size!6350 (_keys!7035 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!63135 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7035 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3850) lt!133272)))

(declare-fun b!263255 () Bool)

(assert (=> b!263255 (= e!170600 (arrayNoDuplicates!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000000 Nil!3850))))

(assert (= (and d!63135 res!128579) b!263255))

(declare-fun m!279395 () Bool)

(assert (=> d!63135 m!279395))

(assert (=> b!263255 m!279017))

(declare-fun m!279397 () Bool)

(assert (=> b!263255 m!279397))

(assert (=> b!262923 d!63135))

(assert (=> bm!25144 d!63121))

(declare-fun d!63137 () Bool)

(assert (=> d!63137 (= (array_inv!3963 (_keys!7035 thiss!1504)) (bvsge (size!6350 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262934 d!63137))

(declare-fun d!63139 () Bool)

(assert (=> d!63139 (= (array_inv!3964 (_values!4826 thiss!1504)) (bvsge (size!6349 (_values!4826 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262934 d!63139))

(declare-fun d!63141 () Bool)

(declare-fun res!128580 () Bool)

(declare-fun e!170601 () Bool)

(assert (=> d!63141 (=> (not res!128580) (not e!170601))))

(assert (=> d!63141 (= res!128580 (simpleValid!285 thiss!1504))))

(assert (=> d!63141 (= (valid!1507 thiss!1504) e!170601)))

(declare-fun b!263256 () Bool)

(declare-fun res!128581 () Bool)

(assert (=> b!263256 (=> (not res!128581) (not e!170601))))

(assert (=> b!263256 (= res!128581 (= (arrayCountValidKeys!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (_size!1984 thiss!1504)))))

(declare-fun b!263257 () Bool)

(declare-fun res!128582 () Bool)

(assert (=> b!263257 (=> (not res!128582) (not e!170601))))

(assert (=> b!263257 (= res!128582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!263258 () Bool)

(assert (=> b!263258 (= e!170601 (arrayNoDuplicates!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 Nil!3850))))

(assert (= (and d!63141 res!128580) b!263256))

(assert (= (and b!263256 res!128581) b!263257))

(assert (= (and b!263257 res!128582) b!263258))

(declare-fun m!279399 () Bool)

(assert (=> d!63141 m!279399))

(assert (=> b!263256 m!279019))

(declare-fun m!279401 () Bool)

(assert (=> b!263257 m!279401))

(declare-fun m!279403 () Bool)

(assert (=> b!263258 m!279403))

(assert (=> start!25238 d!63141))

(declare-fun condMapEmpty!11356 () Bool)

(declare-fun mapDefault!11356 () ValueCell!2985)

(assert (=> mapNonEmpty!11350 (= condMapEmpty!11356 (= mapRest!11350 ((as const (Array (_ BitVec 32) ValueCell!2985)) mapDefault!11356)))))

(declare-fun e!170606 () Bool)

(declare-fun mapRes!11356 () Bool)

(assert (=> mapNonEmpty!11350 (= tp!23722 (and e!170606 mapRes!11356))))

(declare-fun b!263266 () Bool)

(assert (=> b!263266 (= e!170606 tp_is_empty!6657)))

(declare-fun mapIsEmpty!11356 () Bool)

(assert (=> mapIsEmpty!11356 mapRes!11356))

(declare-fun mapNonEmpty!11356 () Bool)

(declare-fun tp!23731 () Bool)

(declare-fun e!170607 () Bool)

(assert (=> mapNonEmpty!11356 (= mapRes!11356 (and tp!23731 e!170607))))

(declare-fun mapValue!11356 () ValueCell!2985)

(declare-fun mapRest!11356 () (Array (_ BitVec 32) ValueCell!2985))

(declare-fun mapKey!11356 () (_ BitVec 32))

(assert (=> mapNonEmpty!11356 (= mapRest!11350 (store mapRest!11356 mapKey!11356 mapValue!11356))))

(declare-fun b!263265 () Bool)

(assert (=> b!263265 (= e!170607 tp_is_empty!6657)))

(assert (= (and mapNonEmpty!11350 condMapEmpty!11356) mapIsEmpty!11356))

(assert (= (and mapNonEmpty!11350 (not condMapEmpty!11356)) mapNonEmpty!11356))

(assert (= (and mapNonEmpty!11356 ((_ is ValueCellFull!2985) mapValue!11356)) b!263265))

(assert (= (and mapNonEmpty!11350 ((_ is ValueCellFull!2985) mapDefault!11356)) b!263266))

(declare-fun m!279405 () Bool)

(assert (=> mapNonEmpty!11356 m!279405))

(declare-fun b_lambda!8335 () Bool)

(assert (= b_lambda!8331 (or (and b!262934 b_free!6795) b_lambda!8335)))

(declare-fun b_lambda!8337 () Bool)

(assert (= b_lambda!8333 (or (and b!262934 b_free!6795) b_lambda!8337)))

(check-sat (not b!263114) (not b!263191) (not d!63091) (not bm!25157) (not b!263231) (not b!263168) (not b!263027) (not b!263226) (not bm!25156) (not b!263207) (not b!263220) (not b!263170) (not bm!25187) (not b!263258) (not bm!25195) (not b_next!6795) (not b!263043) (not b!263251) (not d!63087) (not b!263206) (not bm!25172) (not d!63133) (not bm!25176) (not d!63129) (not d!63141) (not b!263117) (not b!263127) (not b!263042) b_and!13943 (not b!263037) (not d!63115) (not b!263035) (not b!263068) (not b!263157) (not b!263120) (not d!63085) (not b!263123) (not bm!25188) (not b!263159) (not b!263217) (not d!63103) (not b_lambda!8337) (not d!63089) tp_is_empty!6657 (not d!63117) (not b!263185) (not b!263156) (not d!63079) (not b!263257) (not b!263237) (not b!263146) (not d!63097) (not d!63135) (not d!63093) (not b!263240) (not b!263208) (not b!263070) (not d!63077) (not b!263234) (not b!263239) (not bm!25184) (not b!263133) (not b!263189) (not b!263223) (not b!263183) (not b!263256) (not b!263129) (not b!263229) (not b_lambda!8335) (not b!263021) (not b!263213) (not b!263246) (not bm!25190) (not b!263182) (not b!263255) (not b!263252) (not b!263122) (not d!63131) (not bm!25181) (not d!63111) (not d!63123) (not d!63083) (not d!63099) (not mapNonEmpty!11356) (not d!63125) (not bm!25177) (not b!263193) (not b!263244) (not b!263250) (not bm!25189) (not bm!25194) (not d!63127) (not bm!25173) (not b!263199) (not bm!25191))
(check-sat b_and!13943 (not b_next!6795))
(get-model)

(declare-fun d!63143 () Bool)

(declare-fun e!170608 () Bool)

(assert (=> d!63143 e!170608))

(declare-fun res!128583 () Bool)

(assert (=> d!63143 (=> (not res!128583) (not e!170608))))

(declare-fun lt!133275 () ListLongMap!3891)

(assert (=> d!63143 (= res!128583 (contains!1912 lt!133275 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133276 () List!3852)

(assert (=> d!63143 (= lt!133275 (ListLongMap!3892 lt!133276))))

(declare-fun lt!133274 () Unit!8190)

(declare-fun lt!133273 () Unit!8190)

(assert (=> d!63143 (= lt!133274 lt!133273)))

(assert (=> d!63143 (= (getValueByKey!320 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63143 (= lt!133273 (lemmaContainsTupThenGetReturnValue!176 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63143 (= lt!133276 (insertStrictlySorted!179 (toList!1961 call!25181) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63143 (= (+!710 call!25181 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) lt!133275)))

(declare-fun b!263267 () Bool)

(declare-fun res!128584 () Bool)

(assert (=> b!263267 (=> (not res!128584) (not e!170608))))

(assert (=> b!263267 (= res!128584 (= (getValueByKey!320 (toList!1961 lt!133275) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!263268 () Bool)

(assert (=> b!263268 (= e!170608 (contains!1914 (toList!1961 lt!133275) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(assert (= (and d!63143 res!128583) b!263267))

(assert (= (and b!263267 res!128584) b!263268))

(declare-fun m!279407 () Bool)

(assert (=> d!63143 m!279407))

(declare-fun m!279409 () Bool)

(assert (=> d!63143 m!279409))

(declare-fun m!279411 () Bool)

(assert (=> d!63143 m!279411))

(declare-fun m!279413 () Bool)

(assert (=> d!63143 m!279413))

(declare-fun m!279415 () Bool)

(assert (=> b!263267 m!279415))

(declare-fun m!279417 () Bool)

(assert (=> b!263268 m!279417))

(assert (=> b!263122 d!63143))

(declare-fun d!63145 () Bool)

(declare-fun e!170609 () Bool)

(assert (=> d!63145 e!170609))

(declare-fun res!128585 () Bool)

(assert (=> d!63145 (=> res!128585 e!170609)))

(declare-fun lt!133278 () Bool)

(assert (=> d!63145 (= res!128585 (not lt!133278))))

(declare-fun lt!133277 () Bool)

(assert (=> d!63145 (= lt!133278 lt!133277)))

(declare-fun lt!133279 () Unit!8190)

(declare-fun e!170610 () Unit!8190)

(assert (=> d!63145 (= lt!133279 e!170610)))

(declare-fun c!44897 () Bool)

(assert (=> d!63145 (= c!44897 lt!133277)))

(assert (=> d!63145 (= lt!133277 (containsKey!312 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> d!63145 (= (contains!1912 lt!133256 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) lt!133278)))

(declare-fun b!263269 () Bool)

(declare-fun lt!133280 () Unit!8190)

(assert (=> b!263269 (= e!170610 lt!133280)))

(assert (=> b!263269 (= lt!133280 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> b!263269 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263270 () Bool)

(declare-fun Unit!8204 () Unit!8190)

(assert (=> b!263270 (= e!170610 Unit!8204)))

(declare-fun b!263271 () Bool)

(assert (=> b!263271 (= e!170609 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(assert (= (and d!63145 c!44897) b!263269))

(assert (= (and d!63145 (not c!44897)) b!263270))

(assert (= (and d!63145 (not res!128585)) b!263271))

(assert (=> d!63145 m!279255))

(declare-fun m!279419 () Bool)

(assert (=> d!63145 m!279419))

(assert (=> b!263269 m!279255))

(declare-fun m!279421 () Bool)

(assert (=> b!263269 m!279421))

(assert (=> b!263269 m!279255))

(declare-fun m!279423 () Bool)

(assert (=> b!263269 m!279423))

(assert (=> b!263269 m!279423))

(declare-fun m!279425 () Bool)

(assert (=> b!263269 m!279425))

(assert (=> b!263271 m!279255))

(assert (=> b!263271 m!279423))

(assert (=> b!263271 m!279423))

(assert (=> b!263271 m!279425))

(assert (=> b!263244 d!63145))

(declare-fun d!63147 () Bool)

(assert (=> d!63147 (arrayContainsKey!0 lt!133026 lt!133220 #b00000000000000000000000000000000)))

(declare-fun lt!133281 () Unit!8190)

(assert (=> d!63147 (= lt!133281 (choose!13 lt!133026 lt!133220 #b00000000000000000000000000000000))))

(assert (=> d!63147 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63147 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 lt!133220 #b00000000000000000000000000000000) lt!133281)))

(declare-fun bs!9251 () Bool)

(assert (= bs!9251 d!63147))

(assert (=> bs!9251 m!279273))

(declare-fun m!279427 () Bool)

(assert (=> bs!9251 m!279427))

(assert (=> b!263170 d!63147))

(declare-fun d!63149 () Bool)

(declare-fun res!128586 () Bool)

(declare-fun e!170611 () Bool)

(assert (=> d!63149 (=> res!128586 e!170611)))

(assert (=> d!63149 (= res!128586 (= (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133220))))

(assert (=> d!63149 (= (arrayContainsKey!0 lt!133026 lt!133220 #b00000000000000000000000000000000) e!170611)))

(declare-fun b!263272 () Bool)

(declare-fun e!170612 () Bool)

(assert (=> b!263272 (= e!170611 e!170612)))

(declare-fun res!128587 () Bool)

(assert (=> b!263272 (=> (not res!128587) (not e!170612))))

(assert (=> b!263272 (= res!128587 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263273 () Bool)

(assert (=> b!263273 (= e!170612 (arrayContainsKey!0 lt!133026 lt!133220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63149 (not res!128586)) b!263272))

(assert (= (and b!263272 res!128587) b!263273))

(assert (=> d!63149 m!279255))

(declare-fun m!279429 () Bool)

(assert (=> b!263273 m!279429))

(assert (=> b!263170 d!63149))

(declare-fun b!263274 () Bool)

(declare-fun e!170615 () SeekEntryResult!1200)

(declare-fun lt!133283 () SeekEntryResult!1200)

(assert (=> b!263274 (= e!170615 (MissingZero!1200 (index!6972 lt!133283)))))

(declare-fun b!263275 () Bool)

(declare-fun e!170614 () SeekEntryResult!1200)

(declare-fun e!170613 () SeekEntryResult!1200)

(assert (=> b!263275 (= e!170614 e!170613)))

(declare-fun lt!133284 () (_ BitVec 64))

(assert (=> b!263275 (= lt!133284 (select (arr!5999 lt!133026) (index!6972 lt!133283)))))

(declare-fun c!44900 () Bool)

(assert (=> b!263275 (= c!44900 (= lt!133284 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263276 () Bool)

(declare-fun c!44898 () Bool)

(assert (=> b!263276 (= c!44898 (= lt!133284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263276 (= e!170613 e!170615)))

(declare-fun b!263277 () Bool)

(assert (=> b!263277 (= e!170613 (Found!1200 (index!6972 lt!133283)))))

(declare-fun b!263278 () Bool)

(assert (=> b!263278 (= e!170615 (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133283) (index!6972 lt!133283) (index!6972 lt!133283) (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun d!63151 () Bool)

(declare-fun lt!133282 () SeekEntryResult!1200)

(assert (=> d!63151 (and (or ((_ is Undefined!1200) lt!133282) (not ((_ is Found!1200) lt!133282)) (and (bvsge (index!6971 lt!133282) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133282) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133282) ((_ is Found!1200) lt!133282) (not ((_ is MissingZero!1200) lt!133282)) (and (bvsge (index!6970 lt!133282) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133282) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133282) ((_ is Found!1200) lt!133282) ((_ is MissingZero!1200) lt!133282) (not ((_ is MissingVacant!1200) lt!133282)) (and (bvsge (index!6973 lt!133282) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133282) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133282) (ite ((_ is Found!1200) lt!133282) (= (select (arr!5999 lt!133026) (index!6971 lt!133282)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1200) lt!133282) (= (select (arr!5999 lt!133026) (index!6970 lt!133282)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1200) lt!133282) (= (select (arr!5999 lt!133026) (index!6973 lt!133282)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63151 (= lt!133282 e!170614)))

(declare-fun c!44899 () Bool)

(assert (=> d!63151 (= c!44899 (and ((_ is Intermediate!1200) lt!133283) (undefined!2012 lt!133283)))))

(assert (=> d!63151 (= lt!133283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)))))

(assert (=> d!63151 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63151 (= (seekEntryOrOpen!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)) lt!133282)))

(declare-fun b!263279 () Bool)

(assert (=> b!263279 (= e!170614 Undefined!1200)))

(assert (= (and d!63151 c!44899) b!263279))

(assert (= (and d!63151 (not c!44899)) b!263275))

(assert (= (and b!263275 c!44900) b!263277))

(assert (= (and b!263275 (not c!44900)) b!263276))

(assert (= (and b!263276 c!44898) b!263274))

(assert (= (and b!263276 (not c!44898)) b!263278))

(declare-fun m!279431 () Bool)

(assert (=> b!263275 m!279431))

(assert (=> b!263278 m!279255))

(declare-fun m!279433 () Bool)

(assert (=> b!263278 m!279433))

(declare-fun m!279435 () Bool)

(assert (=> d!63151 m!279435))

(assert (=> d!63151 m!279139))

(declare-fun m!279437 () Bool)

(assert (=> d!63151 m!279437))

(assert (=> d!63151 m!279255))

(declare-fun m!279439 () Bool)

(assert (=> d!63151 m!279439))

(declare-fun m!279441 () Bool)

(assert (=> d!63151 m!279441))

(assert (=> d!63151 m!279439))

(assert (=> d!63151 m!279255))

(declare-fun m!279443 () Bool)

(assert (=> d!63151 m!279443))

(assert (=> b!263170 d!63151))

(declare-fun d!63153 () Bool)

(declare-fun res!128592 () Bool)

(declare-fun e!170620 () Bool)

(assert (=> d!63153 (=> res!128592 e!170620)))

(assert (=> d!63153 (= res!128592 (and ((_ is Cons!3848) (toList!1961 lt!133009)) (= (_1!2500 (h!4514 (toList!1961 lt!133009))) key!932)))))

(assert (=> d!63153 (= (containsKey!312 (toList!1961 lt!133009) key!932) e!170620)))

(declare-fun b!263284 () Bool)

(declare-fun e!170621 () Bool)

(assert (=> b!263284 (= e!170620 e!170621)))

(declare-fun res!128593 () Bool)

(assert (=> b!263284 (=> (not res!128593) (not e!170621))))

(assert (=> b!263284 (= res!128593 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133009))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133009))) key!932)) ((_ is Cons!3848) (toList!1961 lt!133009)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133009))) key!932)))))

(declare-fun b!263285 () Bool)

(assert (=> b!263285 (= e!170621 (containsKey!312 (t!8929 (toList!1961 lt!133009)) key!932))))

(assert (= (and d!63153 (not res!128592)) b!263284))

(assert (= (and b!263284 res!128593) b!263285))

(declare-fun m!279445 () Bool)

(assert (=> b!263285 m!279445))

(assert (=> d!63083 d!63153))

(declare-fun d!63155 () Bool)

(assert (=> d!63155 (= (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) index!297)) (and (not (= (select (arr!5999 (_keys!7035 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 (_keys!7035 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263156 d!63155))

(declare-fun d!63157 () Bool)

(declare-fun lt!133287 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!176 (List!3852) (InoxSet tuple2!4978))

(assert (=> d!63157 (= lt!133287 (select (content!176 (toList!1961 lt!133127)) lt!133020))))

(declare-fun e!170627 () Bool)

(assert (=> d!63157 (= lt!133287 e!170627)))

(declare-fun res!128599 () Bool)

(assert (=> d!63157 (=> (not res!128599) (not e!170627))))

(assert (=> d!63157 (= res!128599 ((_ is Cons!3848) (toList!1961 lt!133127)))))

(assert (=> d!63157 (= (contains!1914 (toList!1961 lt!133127) lt!133020) lt!133287)))

(declare-fun b!263290 () Bool)

(declare-fun e!170626 () Bool)

(assert (=> b!263290 (= e!170627 e!170626)))

(declare-fun res!128598 () Bool)

(assert (=> b!263290 (=> res!128598 e!170626)))

(assert (=> b!263290 (= res!128598 (= (h!4514 (toList!1961 lt!133127)) lt!133020))))

(declare-fun b!263291 () Bool)

(assert (=> b!263291 (= e!170626 (contains!1914 (t!8929 (toList!1961 lt!133127)) lt!133020))))

(assert (= (and d!63157 res!128599) b!263290))

(assert (= (and b!263290 (not res!128598)) b!263291))

(declare-fun m!279447 () Bool)

(assert (=> d!63157 m!279447))

(declare-fun m!279449 () Bool)

(assert (=> d!63157 m!279449))

(declare-fun m!279451 () Bool)

(assert (=> b!263291 m!279451))

(assert (=> b!263043 d!63157))

(declare-fun d!63159 () Bool)

(declare-fun get!3094 (Option!326) V!8523)

(assert (=> d!63159 (= (apply!262 lt!133201 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9252 () Bool)

(assert (= bs!9252 d!63159))

(declare-fun m!279453 () Bool)

(assert (=> bs!9252 m!279453))

(assert (=> bs!9252 m!279453))

(declare-fun m!279455 () Bool)

(assert (=> bs!9252 m!279455))

(assert (=> b!263123 d!63159))

(declare-fun b!263293 () Bool)

(declare-fun e!170628 () Bool)

(declare-fun call!25200 () Bool)

(assert (=> b!263293 (= e!170628 call!25200)))

(declare-fun b!263294 () Bool)

(declare-fun e!170629 () Bool)

(assert (=> b!263294 (= e!170628 e!170629)))

(declare-fun lt!133288 () (_ BitVec 64))

(assert (=> b!263294 (= lt!133288 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133289 () Unit!8190)

(assert (=> b!263294 (= lt!133289 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 lt!133288 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263294 (arrayContainsKey!0 lt!133026 lt!133288 #b00000000000000000000000000000000)))

(declare-fun lt!133290 () Unit!8190)

(assert (=> b!263294 (= lt!133290 lt!133289)))

(declare-fun res!128601 () Bool)

(assert (=> b!263294 (= res!128601 (= (seekEntryOrOpen!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133026 (mask!11209 thiss!1504)) (Found!1200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263294 (=> (not res!128601) (not e!170629))))

(declare-fun b!263295 () Bool)

(assert (=> b!263295 (= e!170629 call!25200)))

(declare-fun bm!25197 () Bool)

(assert (=> bm!25197 (= call!25200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun b!263292 () Bool)

(declare-fun e!170630 () Bool)

(assert (=> b!263292 (= e!170630 e!170628)))

(declare-fun c!44901 () Bool)

(assert (=> b!263292 (= c!44901 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63161 () Bool)

(declare-fun res!128600 () Bool)

(assert (=> d!63161 (=> res!128600 e!170630)))

(assert (=> d!63161 (= res!128600 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!63161 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!133026 (mask!11209 thiss!1504)) e!170630)))

(assert (= (and d!63161 (not res!128600)) b!263292))

(assert (= (and b!263292 c!44901) b!263294))

(assert (= (and b!263292 (not c!44901)) b!263293))

(assert (= (and b!263294 res!128601) b!263295))

(assert (= (or b!263295 b!263293) bm!25197))

(declare-fun m!279457 () Bool)

(assert (=> b!263294 m!279457))

(declare-fun m!279459 () Bool)

(assert (=> b!263294 m!279459))

(declare-fun m!279461 () Bool)

(assert (=> b!263294 m!279461))

(assert (=> b!263294 m!279457))

(declare-fun m!279463 () Bool)

(assert (=> b!263294 m!279463))

(declare-fun m!279465 () Bool)

(assert (=> bm!25197 m!279465))

(assert (=> b!263292 m!279457))

(assert (=> b!263292 m!279457))

(declare-fun m!279467 () Bool)

(assert (=> b!263292 m!279467))

(assert (=> bm!25184 d!63161))

(declare-fun d!63163 () Bool)

(declare-fun lt!133293 () Bool)

(declare-fun content!177 (List!3853) (InoxSet (_ BitVec 64)))

(assert (=> d!63163 (= lt!133293 (select (content!177 Nil!3850) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun e!170635 () Bool)

(assert (=> d!63163 (= lt!133293 e!170635)))

(declare-fun res!128607 () Bool)

(assert (=> d!63163 (=> (not res!128607) (not e!170635))))

(assert (=> d!63163 (= res!128607 ((_ is Cons!3849) Nil!3850))))

(assert (=> d!63163 (= (contains!1915 Nil!3850 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) lt!133293)))

(declare-fun b!263300 () Bool)

(declare-fun e!170636 () Bool)

(assert (=> b!263300 (= e!170635 e!170636)))

(declare-fun res!128606 () Bool)

(assert (=> b!263300 (=> res!128606 e!170636)))

(assert (=> b!263300 (= res!128606 (= (h!4515 Nil!3850) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263301 () Bool)

(assert (=> b!263301 (= e!170636 (contains!1915 (t!8930 Nil!3850) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (= (and d!63163 res!128607) b!263300))

(assert (= (and b!263300 (not res!128606)) b!263301))

(declare-fun m!279469 () Bool)

(assert (=> d!63163 m!279469))

(assert (=> d!63163 m!279255))

(declare-fun m!279471 () Bool)

(assert (=> d!63163 m!279471))

(assert (=> b!263301 m!279255))

(declare-fun m!279473 () Bool)

(assert (=> b!263301 m!279473))

(assert (=> b!263182 d!63163))

(assert (=> bm!25157 d!63121))

(declare-fun b!263303 () Bool)

(declare-fun e!170637 () Bool)

(declare-fun call!25201 () Bool)

(assert (=> b!263303 (= e!170637 call!25201)))

(declare-fun b!263304 () Bool)

(declare-fun e!170638 () Bool)

(assert (=> b!263304 (= e!170637 e!170638)))

(declare-fun lt!133294 () (_ BitVec 64))

(assert (=> b!263304 (= lt!133294 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133295 () Unit!8190)

(assert (=> b!263304 (= lt!133295 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7035 thiss!1504) lt!133294 #b00000000000000000000000000000000))))

(assert (=> b!263304 (arrayContainsKey!0 (_keys!7035 thiss!1504) lt!133294 #b00000000000000000000000000000000)))

(declare-fun lt!133296 () Unit!8190)

(assert (=> b!263304 (= lt!133296 lt!133295)))

(declare-fun res!128609 () Bool)

(assert (=> b!263304 (= res!128609 (= (seekEntryOrOpen!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) (Found!1200 #b00000000000000000000000000000000)))))

(assert (=> b!263304 (=> (not res!128609) (not e!170638))))

(declare-fun b!263305 () Bool)

(assert (=> b!263305 (= e!170638 call!25201)))

(declare-fun bm!25198 () Bool)

(assert (=> bm!25198 (= call!25201 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!263302 () Bool)

(declare-fun e!170639 () Bool)

(assert (=> b!263302 (= e!170639 e!170637)))

(declare-fun c!44902 () Bool)

(assert (=> b!263302 (= c!44902 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63165 () Bool)

(declare-fun res!128608 () Bool)

(assert (=> d!63165 (=> res!128608 e!170639)))

(assert (=> d!63165 (= res!128608 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) e!170639)))

(assert (= (and d!63165 (not res!128608)) b!263302))

(assert (= (and b!263302 c!44902) b!263304))

(assert (= (and b!263302 (not c!44902)) b!263303))

(assert (= (and b!263304 res!128609) b!263305))

(assert (= (or b!263305 b!263303) bm!25198))

(assert (=> b!263304 m!279199))

(declare-fun m!279475 () Bool)

(assert (=> b!263304 m!279475))

(declare-fun m!279477 () Bool)

(assert (=> b!263304 m!279477))

(assert (=> b!263304 m!279199))

(declare-fun m!279479 () Bool)

(assert (=> b!263304 m!279479))

(declare-fun m!279481 () Bool)

(assert (=> bm!25198 m!279481))

(assert (=> b!263302 m!279199))

(assert (=> b!263302 m!279199))

(assert (=> b!263302 m!279201))

(assert (=> b!263257 d!63165))

(declare-fun d!63167 () Bool)

(assert (=> d!63167 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133012) key!932))))

(declare-fun lt!133299 () Unit!8190)

(declare-fun choose!1293 (List!3852 (_ BitVec 64)) Unit!8190)

(assert (=> d!63167 (= lt!133299 (choose!1293 (toList!1961 lt!133012) key!932))))

(declare-fun e!170642 () Bool)

(assert (=> d!63167 e!170642))

(declare-fun res!128612 () Bool)

(assert (=> d!63167 (=> (not res!128612) (not e!170642))))

(declare-fun isStrictlySorted!377 (List!3852) Bool)

(assert (=> d!63167 (= res!128612 (isStrictlySorted!377 (toList!1961 lt!133012)))))

(assert (=> d!63167 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133012) key!932) lt!133299)))

(declare-fun b!263308 () Bool)

(assert (=> b!263308 (= e!170642 (containsKey!312 (toList!1961 lt!133012) key!932))))

(assert (= (and d!63167 res!128612) b!263308))

(assert (=> d!63167 m!279193))

(assert (=> d!63167 m!279193))

(assert (=> d!63167 m!279195))

(declare-fun m!279483 () Bool)

(assert (=> d!63167 m!279483))

(declare-fun m!279485 () Bool)

(assert (=> d!63167 m!279485))

(assert (=> b!263308 m!279189))

(assert (=> b!263068 d!63167))

(declare-fun d!63169 () Bool)

(declare-fun isEmpty!540 (Option!326) Bool)

(assert (=> d!63169 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133012) key!932)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133012) key!932))))))

(declare-fun bs!9253 () Bool)

(assert (= bs!9253 d!63169))

(assert (=> bs!9253 m!279193))

(declare-fun m!279487 () Bool)

(assert (=> bs!9253 m!279487))

(assert (=> b!263068 d!63169))

(declare-fun b!263319 () Bool)

(declare-fun e!170648 () Option!326)

(assert (=> b!263319 (= e!170648 (getValueByKey!320 (t!8929 (toList!1961 lt!133012)) key!932))))

(declare-fun b!263317 () Bool)

(declare-fun e!170647 () Option!326)

(assert (=> b!263317 (= e!170647 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133012)))))))

(declare-fun d!63171 () Bool)

(declare-fun c!44907 () Bool)

(assert (=> d!63171 (= c!44907 (and ((_ is Cons!3848) (toList!1961 lt!133012)) (= (_1!2500 (h!4514 (toList!1961 lt!133012))) key!932)))))

(assert (=> d!63171 (= (getValueByKey!320 (toList!1961 lt!133012) key!932) e!170647)))

(declare-fun b!263320 () Bool)

(assert (=> b!263320 (= e!170648 None!324)))

(declare-fun b!263318 () Bool)

(assert (=> b!263318 (= e!170647 e!170648)))

(declare-fun c!44908 () Bool)

(assert (=> b!263318 (= c!44908 (and ((_ is Cons!3848) (toList!1961 lt!133012)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133012))) key!932))))))

(assert (= (and d!63171 c!44907) b!263317))

(assert (= (and d!63171 (not c!44907)) b!263318))

(assert (= (and b!263318 c!44908) b!263319))

(assert (= (and b!263318 (not c!44908)) b!263320))

(declare-fun m!279489 () Bool)

(assert (=> b!263319 m!279489))

(assert (=> b!263068 d!63171))

(declare-fun b!263321 () Bool)

(declare-fun e!170649 () (_ BitVec 32))

(assert (=> b!263321 (= e!170649 #b00000000000000000000000000000000)))

(declare-fun b!263323 () Bool)

(declare-fun e!170650 () (_ BitVec 32))

(assert (=> b!263323 (= e!170649 e!170650)))

(declare-fun c!44910 () Bool)

(assert (=> b!263323 (= c!44910 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!263324 () Bool)

(declare-fun call!25202 () (_ BitVec 32))

(assert (=> b!263324 (= e!170650 call!25202)))

(declare-fun bm!25199 () Bool)

(assert (=> bm!25199 (= call!25202 (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!63173 () Bool)

(declare-fun lt!133300 () (_ BitVec 32))

(assert (=> d!63173 (and (bvsge lt!133300 #b00000000000000000000000000000000) (bvsle lt!133300 (bvsub (size!6350 lt!133026) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!63173 (= lt!133300 e!170649)))

(declare-fun c!44909 () Bool)

(assert (=> d!63173 (= c!44909 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63173 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6350 lt!133026)))))

(assert (=> d!63173 (= (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!133300)))

(declare-fun b!263322 () Bool)

(assert (=> b!263322 (= e!170650 (bvadd #b00000000000000000000000000000001 call!25202))))

(assert (= (and d!63173 c!44909) b!263321))

(assert (= (and d!63173 (not c!44909)) b!263323))

(assert (= (and b!263323 c!44910) b!263322))

(assert (= (and b!263323 (not c!44910)) b!263324))

(assert (= (or b!263322 b!263324) bm!25199))

(declare-fun m!279491 () Bool)

(assert (=> b!263323 m!279491))

(assert (=> b!263323 m!279491))

(declare-fun m!279493 () Bool)

(assert (=> b!263323 m!279493))

(declare-fun m!279495 () Bool)

(assert (=> bm!25199 m!279495))

(assert (=> bm!25189 d!63173))

(declare-fun d!63175 () Bool)

(declare-fun e!170651 () Bool)

(assert (=> d!63175 e!170651))

(declare-fun res!128613 () Bool)

(assert (=> d!63175 (=> res!128613 e!170651)))

(declare-fun lt!133302 () Bool)

(assert (=> d!63175 (= res!128613 (not lt!133302))))

(declare-fun lt!133301 () Bool)

(assert (=> d!63175 (= lt!133302 lt!133301)))

(declare-fun lt!133303 () Unit!8190)

(declare-fun e!170652 () Unit!8190)

(assert (=> d!63175 (= lt!133303 e!170652)))

(declare-fun c!44911 () Bool)

(assert (=> d!63175 (= c!44911 lt!133301)))

(assert (=> d!63175 (= lt!133301 (containsKey!312 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63175 (= (contains!1912 lt!133201 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133302)))

(declare-fun b!263325 () Bool)

(declare-fun lt!133304 () Unit!8190)

(assert (=> b!263325 (= e!170652 lt!133304)))

(assert (=> b!263325 (= lt!133304 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263325 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263326 () Bool)

(declare-fun Unit!8205 () Unit!8190)

(assert (=> b!263326 (= e!170652 Unit!8205)))

(declare-fun b!263327 () Bool)

(assert (=> b!263327 (= e!170651 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63175 c!44911) b!263325))

(assert (= (and d!63175 (not c!44911)) b!263326))

(assert (= (and d!63175 (not res!128613)) b!263327))

(declare-fun m!279497 () Bool)

(assert (=> d!63175 m!279497))

(declare-fun m!279499 () Bool)

(assert (=> b!263325 m!279499))

(assert (=> b!263325 m!279453))

(assert (=> b!263325 m!279453))

(declare-fun m!279501 () Bool)

(assert (=> b!263325 m!279501))

(assert (=> b!263327 m!279453))

(assert (=> b!263327 m!279453))

(assert (=> b!263327 m!279501))

(assert (=> bm!25173 d!63175))

(assert (=> b!263070 d!63169))

(assert (=> b!263070 d!63171))

(declare-fun d!63177 () Bool)

(declare-fun e!170653 () Bool)

(assert (=> d!63177 e!170653))

(declare-fun res!128614 () Bool)

(assert (=> d!63177 (=> (not res!128614) (not e!170653))))

(declare-fun lt!133307 () ListLongMap!3891)

(assert (=> d!63177 (= res!128614 (contains!1912 lt!133307 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun lt!133308 () List!3852)

(assert (=> d!63177 (= lt!133307 (ListLongMap!3892 lt!133308))))

(declare-fun lt!133306 () Unit!8190)

(declare-fun lt!133305 () Unit!8190)

(assert (=> d!63177 (= lt!133306 lt!133305)))

(assert (=> d!63177 (= (getValueByKey!320 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63177 (= lt!133305 (lemmaContainsTupThenGetReturnValue!176 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63177 (= lt!133308 (insertStrictlySorted!179 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63177 (= (+!710 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133307)))

(declare-fun b!263328 () Bool)

(declare-fun res!128615 () Bool)

(assert (=> b!263328 (=> (not res!128615) (not e!170653))))

(assert (=> b!263328 (= res!128615 (= (getValueByKey!320 (toList!1961 lt!133307) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!263329 () Bool)

(assert (=> b!263329 (= e!170653 (contains!1914 (toList!1961 lt!133307) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (= (and d!63177 res!128614) b!263328))

(assert (= (and b!263328 res!128615) b!263329))

(declare-fun m!279503 () Bool)

(assert (=> d!63177 m!279503))

(declare-fun m!279505 () Bool)

(assert (=> d!63177 m!279505))

(declare-fun m!279507 () Bool)

(assert (=> d!63177 m!279507))

(declare-fun m!279509 () Bool)

(assert (=> d!63177 m!279509))

(declare-fun m!279511 () Bool)

(assert (=> b!263328 m!279511))

(declare-fun m!279513 () Bool)

(assert (=> b!263329 m!279513))

(assert (=> bm!25194 d!63177))

(assert (=> d!63093 d!63077))

(declare-fun b!263346 () Bool)

(declare-fun res!128625 () Bool)

(declare-fun lt!133311 () SeekEntryResult!1200)

(assert (=> b!263346 (= res!128625 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6970 lt!133311)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170664 () Bool)

(assert (=> b!263346 (=> (not res!128625) (not e!170664))))

(declare-fun b!263347 () Bool)

(declare-fun call!25207 () Bool)

(assert (=> b!263347 (= e!170664 (not call!25207))))

(declare-fun b!263348 () Bool)

(declare-fun e!170665 () Bool)

(assert (=> b!263348 (= e!170665 ((_ is Undefined!1200) lt!133311))))

(declare-fun b!263349 () Bool)

(declare-fun e!170663 () Bool)

(assert (=> b!263349 (= e!170663 e!170664)))

(declare-fun res!128624 () Bool)

(declare-fun call!25208 () Bool)

(assert (=> b!263349 (= res!128624 call!25208)))

(assert (=> b!263349 (=> (not res!128624) (not e!170664))))

(declare-fun bm!25204 () Bool)

(assert (=> bm!25204 (= call!25207 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!263350 () Bool)

(assert (=> b!263350 (= e!170663 e!170665)))

(declare-fun c!44916 () Bool)

(assert (=> b!263350 (= c!44916 ((_ is MissingVacant!1200) lt!133311))))

(declare-fun c!44917 () Bool)

(declare-fun bm!25205 () Bool)

(assert (=> bm!25205 (= call!25208 (inRange!0 (ite c!44917 (index!6970 lt!133311) (index!6973 lt!133311)) (mask!11209 thiss!1504)))))

(declare-fun b!263351 () Bool)

(declare-fun res!128627 () Bool)

(declare-fun e!170662 () Bool)

(assert (=> b!263351 (=> (not res!128627) (not e!170662))))

(assert (=> b!263351 (= res!128627 call!25208)))

(assert (=> b!263351 (= e!170665 e!170662)))

(declare-fun d!63179 () Bool)

(assert (=> d!63179 e!170663))

(assert (=> d!63179 (= c!44917 ((_ is MissingZero!1200) lt!133311))))

(assert (=> d!63179 (= lt!133311 (seekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(assert (=> d!63179 true))

(declare-fun _$34!1131 () Unit!8190)

(assert (=> d!63179 (= (choose!1290 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)) _$34!1131)))

(declare-fun b!263352 () Bool)

(assert (=> b!263352 (= e!170662 (not call!25207))))

(declare-fun b!263353 () Bool)

(declare-fun res!128626 () Bool)

(assert (=> b!263353 (=> (not res!128626) (not e!170662))))

(assert (=> b!263353 (= res!128626 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133311)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63179 c!44917) b!263349))

(assert (= (and d!63179 (not c!44917)) b!263350))

(assert (= (and b!263349 res!128624) b!263346))

(assert (= (and b!263346 res!128625) b!263347))

(assert (= (and b!263350 c!44916) b!263351))

(assert (= (and b!263350 (not c!44916)) b!263348))

(assert (= (and b!263351 res!128627) b!263353))

(assert (= (and b!263353 res!128626) b!263352))

(assert (= (or b!263349 b!263351) bm!25205))

(assert (= (or b!263347 b!263352) bm!25204))

(assert (=> d!63179 m!279049))

(declare-fun m!279515 () Bool)

(assert (=> b!263353 m!279515))

(assert (=> bm!25204 m!279001))

(declare-fun m!279517 () Bool)

(assert (=> bm!25205 m!279517))

(declare-fun m!279519 () Bool)

(assert (=> b!263346 m!279519))

(assert (=> d!63093 d!63179))

(declare-fun d!63181 () Bool)

(assert (=> d!63181 (= (validMask!0 (mask!11209 thiss!1504)) (and (or (= (mask!11209 thiss!1504) #b00000000000000000000000000000111) (= (mask!11209 thiss!1504) #b00000000000000000000000000001111) (= (mask!11209 thiss!1504) #b00000000000000000000000000011111) (= (mask!11209 thiss!1504) #b00000000000000000000000000111111) (= (mask!11209 thiss!1504) #b00000000000000000000000001111111) (= (mask!11209 thiss!1504) #b00000000000000000000000011111111) (= (mask!11209 thiss!1504) #b00000000000000000000000111111111) (= (mask!11209 thiss!1504) #b00000000000000000000001111111111) (= (mask!11209 thiss!1504) #b00000000000000000000011111111111) (= (mask!11209 thiss!1504) #b00000000000000000000111111111111) (= (mask!11209 thiss!1504) #b00000000000000000001111111111111) (= (mask!11209 thiss!1504) #b00000000000000000011111111111111) (= (mask!11209 thiss!1504) #b00000000000000000111111111111111) (= (mask!11209 thiss!1504) #b00000000000000001111111111111111) (= (mask!11209 thiss!1504) #b00000000000000011111111111111111) (= (mask!11209 thiss!1504) #b00000000000000111111111111111111) (= (mask!11209 thiss!1504) #b00000000000001111111111111111111) (= (mask!11209 thiss!1504) #b00000000000011111111111111111111) (= (mask!11209 thiss!1504) #b00000000000111111111111111111111) (= (mask!11209 thiss!1504) #b00000000001111111111111111111111) (= (mask!11209 thiss!1504) #b00000000011111111111111111111111) (= (mask!11209 thiss!1504) #b00000000111111111111111111111111) (= (mask!11209 thiss!1504) #b00000001111111111111111111111111) (= (mask!11209 thiss!1504) #b00000011111111111111111111111111) (= (mask!11209 thiss!1504) #b00000111111111111111111111111111) (= (mask!11209 thiss!1504) #b00001111111111111111111111111111) (= (mask!11209 thiss!1504) #b00011111111111111111111111111111) (= (mask!11209 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11209 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!63093 d!63181))

(declare-fun b!263354 () Bool)

(declare-fun e!170666 () Bool)

(assert (=> b!263354 (= e!170666 (contains!1915 (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263356 () Bool)

(declare-fun e!170669 () Bool)

(declare-fun call!25209 () Bool)

(assert (=> b!263356 (= e!170669 call!25209)))

(declare-fun b!263357 () Bool)

(declare-fun e!170667 () Bool)

(assert (=> b!263357 (= e!170667 e!170669)))

(declare-fun c!44918 () Bool)

(assert (=> b!263357 (= c!44918 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263355 () Bool)

(declare-fun e!170668 () Bool)

(assert (=> b!263355 (= e!170668 e!170667)))

(declare-fun res!128629 () Bool)

(assert (=> b!263355 (=> (not res!128629) (not e!170667))))

(assert (=> b!263355 (= res!128629 (not e!170666))))

(declare-fun res!128630 () Bool)

(assert (=> b!263355 (=> (not res!128630) (not e!170666))))

(assert (=> b!263355 (= res!128630 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63183 () Bool)

(declare-fun res!128628 () Bool)

(assert (=> d!63183 (=> res!128628 e!170668)))

(assert (=> d!63183 (= res!128628 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!63183 (= (arrayNoDuplicates!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) e!170668)))

(declare-fun bm!25206 () Bool)

(assert (=> bm!25206 (= call!25209 (arrayNoDuplicates!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44918 (Cons!3849 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850))))))

(declare-fun b!263358 () Bool)

(assert (=> b!263358 (= e!170669 call!25209)))

(assert (= (and d!63183 (not res!128628)) b!263355))

(assert (= (and b!263355 res!128630) b!263354))

(assert (= (and b!263355 res!128629) b!263357))

(assert (= (and b!263357 c!44918) b!263356))

(assert (= (and b!263357 (not c!44918)) b!263358))

(assert (= (or b!263356 b!263358) bm!25206))

(assert (=> b!263354 m!279457))

(assert (=> b!263354 m!279457))

(declare-fun m!279521 () Bool)

(assert (=> b!263354 m!279521))

(assert (=> b!263357 m!279457))

(assert (=> b!263357 m!279457))

(assert (=> b!263357 m!279467))

(assert (=> b!263355 m!279457))

(assert (=> b!263355 m!279457))

(assert (=> b!263355 m!279467))

(assert (=> bm!25206 m!279457))

(declare-fun m!279523 () Bool)

(assert (=> bm!25206 m!279523))

(assert (=> bm!25187 d!63183))

(declare-fun d!63185 () Bool)

(declare-fun e!170670 () Bool)

(assert (=> d!63185 e!170670))

(declare-fun res!128631 () Bool)

(assert (=> d!63185 (=> res!128631 e!170670)))

(declare-fun lt!133313 () Bool)

(assert (=> d!63185 (= res!128631 (not lt!133313))))

(declare-fun lt!133312 () Bool)

(assert (=> d!63185 (= lt!133313 lt!133312)))

(declare-fun lt!133314 () Unit!8190)

(declare-fun e!170671 () Unit!8190)

(assert (=> d!63185 (= lt!133314 e!170671)))

(declare-fun c!44919 () Bool)

(assert (=> d!63185 (= c!44919 lt!133312)))

(assert (=> d!63185 (= lt!133312 (containsKey!312 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))

(assert (=> d!63185 (= (contains!1912 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) key!932) lt!133313)))

(declare-fun b!263359 () Bool)

(declare-fun lt!133315 () Unit!8190)

(assert (=> b!263359 (= e!170671 lt!133315)))

(assert (=> b!263359 (= lt!133315 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))

(assert (=> b!263359 (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))

(declare-fun b!263360 () Bool)

(declare-fun Unit!8206 () Unit!8190)

(assert (=> b!263360 (= e!170671 Unit!8206)))

(declare-fun b!263361 () Bool)

(assert (=> b!263361 (= e!170670 (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932)))))

(assert (= (and d!63185 c!44919) b!263359))

(assert (= (and d!63185 (not c!44919)) b!263360))

(assert (= (and d!63185 (not res!128631)) b!263361))

(declare-fun m!279525 () Bool)

(assert (=> d!63185 m!279525))

(declare-fun m!279527 () Bool)

(assert (=> b!263359 m!279527))

(declare-fun m!279529 () Bool)

(assert (=> b!263359 m!279529))

(assert (=> b!263359 m!279529))

(declare-fun m!279531 () Bool)

(assert (=> b!263359 m!279531))

(assert (=> b!263361 m!279529))

(assert (=> b!263361 m!279529))

(assert (=> b!263361 m!279531))

(assert (=> d!63091 d!63185))

(assert (=> d!63091 d!63099))

(declare-fun d!63187 () Bool)

(assert (=> d!63187 (contains!1912 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) key!932)))

(assert (=> d!63187 true))

(declare-fun _$17!95 () Unit!8190)

(assert (=> d!63187 (= (choose!1289 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) _$17!95)))

(declare-fun bs!9254 () Bool)

(assert (= bs!9254 d!63187))

(assert (=> bs!9254 m!279045))

(assert (=> bs!9254 m!279045))

(assert (=> bs!9254 m!279177))

(assert (=> d!63091 d!63187))

(assert (=> d!63091 d!63181))

(declare-fun d!63189 () Bool)

(assert (=> d!63189 (= (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (and (not (= (select (arr!5999 lt!133026) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 lt!133026) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263168 d!63189))

(declare-fun d!63191 () Bool)

(assert (=> d!63191 (= (apply!262 lt!133201 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) (get!3094 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9255 () Bool)

(assert (= bs!9255 d!63191))

(assert (=> bs!9255 m!279199))

(declare-fun m!279533 () Bool)

(assert (=> bs!9255 m!279533))

(assert (=> bs!9255 m!279533))

(declare-fun m!279535 () Bool)

(assert (=> bs!9255 m!279535))

(assert (=> b!263114 d!63191))

(declare-fun d!63193 () Bool)

(declare-fun c!44922 () Bool)

(assert (=> d!63193 (= c!44922 ((_ is ValueCellFull!2985) (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!170674 () V!8523)

(assert (=> d!63193 (= (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170674)))

(declare-fun b!263366 () Bool)

(declare-fun get!3095 (ValueCell!2985 V!8523) V!8523)

(assert (=> b!263366 (= e!170674 (get!3095 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263367 () Bool)

(declare-fun get!3096 (ValueCell!2985 V!8523) V!8523)

(assert (=> b!263367 (= e!170674 (get!3096 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63193 c!44922) b!263366))

(assert (= (and d!63193 (not c!44922)) b!263367))

(assert (=> b!263366 m!279249))

(assert (=> b!263366 m!279251))

(declare-fun m!279537 () Bool)

(assert (=> b!263366 m!279537))

(assert (=> b!263367 m!279249))

(assert (=> b!263367 m!279251))

(declare-fun m!279539 () Bool)

(assert (=> b!263367 m!279539))

(assert (=> b!263114 d!63193))

(declare-fun d!63195 () Bool)

(assert (=> d!63195 (= (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263129 d!63195))

(declare-fun d!63197 () Bool)

(declare-fun e!170675 () Bool)

(assert (=> d!63197 e!170675))

(declare-fun res!128632 () Bool)

(assert (=> d!63197 (=> res!128632 e!170675)))

(declare-fun lt!133317 () Bool)

(assert (=> d!63197 (= res!128632 (not lt!133317))))

(declare-fun lt!133316 () Bool)

(assert (=> d!63197 (= lt!133317 lt!133316)))

(declare-fun lt!133318 () Unit!8190)

(declare-fun e!170676 () Unit!8190)

(assert (=> d!63197 (= lt!133318 e!170676)))

(declare-fun c!44923 () Bool)

(assert (=> d!63197 (= c!44923 lt!133316)))

(assert (=> d!63197 (= lt!133316 (containsKey!312 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63197 (= (contains!1912 lt!133256 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133317)))

(declare-fun b!263368 () Bool)

(declare-fun lt!133319 () Unit!8190)

(assert (=> b!263368 (= e!170676 lt!133319)))

(assert (=> b!263368 (= lt!133319 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263368 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263369 () Bool)

(declare-fun Unit!8207 () Unit!8190)

(assert (=> b!263369 (= e!170676 Unit!8207)))

(declare-fun b!263370 () Bool)

(assert (=> b!263370 (= e!170675 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63197 c!44923) b!263368))

(assert (= (and d!63197 (not c!44923)) b!263369))

(assert (= (and d!63197 (not res!128632)) b!263370))

(declare-fun m!279541 () Bool)

(assert (=> d!63197 m!279541))

(declare-fun m!279543 () Bool)

(assert (=> b!263368 m!279543))

(declare-fun m!279545 () Bool)

(assert (=> b!263368 m!279545))

(assert (=> b!263368 m!279545))

(declare-fun m!279547 () Bool)

(assert (=> b!263368 m!279547))

(assert (=> b!263370 m!279545))

(assert (=> b!263370 m!279545))

(assert (=> b!263370 m!279547))

(assert (=> bm!25191 d!63197))

(declare-fun d!63199 () Bool)

(declare-fun lt!133320 () Bool)

(assert (=> d!63199 (= lt!133320 (select (content!176 (toList!1961 lt!133265)) lt!133020))))

(declare-fun e!170678 () Bool)

(assert (=> d!63199 (= lt!133320 e!170678)))

(declare-fun res!128634 () Bool)

(assert (=> d!63199 (=> (not res!128634) (not e!170678))))

(assert (=> d!63199 (= res!128634 ((_ is Cons!3848) (toList!1961 lt!133265)))))

(assert (=> d!63199 (= (contains!1914 (toList!1961 lt!133265) lt!133020) lt!133320)))

(declare-fun b!263371 () Bool)

(declare-fun e!170677 () Bool)

(assert (=> b!263371 (= e!170678 e!170677)))

(declare-fun res!128633 () Bool)

(assert (=> b!263371 (=> res!128633 e!170677)))

(assert (=> b!263371 (= res!128633 (= (h!4514 (toList!1961 lt!133265)) lt!133020))))

(declare-fun b!263372 () Bool)

(assert (=> b!263372 (= e!170677 (contains!1914 (t!8929 (toList!1961 lt!133265)) lt!133020))))

(assert (= (and d!63199 res!128634) b!263371))

(assert (= (and b!263371 (not res!128633)) b!263372))

(declare-fun m!279549 () Bool)

(assert (=> d!63199 m!279549))

(declare-fun m!279551 () Bool)

(assert (=> d!63199 m!279551))

(declare-fun m!279553 () Bool)

(assert (=> b!263372 m!279553))

(assert (=> b!263252 d!63199))

(declare-fun d!63201 () Bool)

(declare-fun e!170679 () Bool)

(assert (=> d!63201 e!170679))

(declare-fun res!128635 () Bool)

(assert (=> d!63201 (=> res!128635 e!170679)))

(declare-fun lt!133322 () Bool)

(assert (=> d!63201 (= res!128635 (not lt!133322))))

(declare-fun lt!133321 () Bool)

(assert (=> d!63201 (= lt!133322 lt!133321)))

(declare-fun lt!133323 () Unit!8190)

(declare-fun e!170680 () Unit!8190)

(assert (=> d!63201 (= lt!133323 e!170680)))

(declare-fun c!44924 () Bool)

(assert (=> d!63201 (= c!44924 lt!133321)))

(assert (=> d!63201 (= lt!133321 (containsKey!312 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))

(assert (=> d!63201 (= (contains!1912 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) (select (arr!5999 lt!133026) index!297)) lt!133322)))

(declare-fun b!263373 () Bool)

(declare-fun lt!133324 () Unit!8190)

(assert (=> b!263373 (= e!170680 lt!133324)))

(assert (=> b!263373 (= lt!133324 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))

(assert (=> b!263373 (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))

(declare-fun b!263374 () Bool)

(declare-fun Unit!8208 () Unit!8190)

(assert (=> b!263374 (= e!170680 Unit!8208)))

(declare-fun b!263375 () Bool)

(assert (=> b!263375 (= e!170679 (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297))))))

(assert (= (and d!63201 c!44924) b!263373))

(assert (= (and d!63201 (not c!44924)) b!263374))

(assert (= (and d!63201 (not res!128635)) b!263375))

(assert (=> d!63201 m!279307))

(declare-fun m!279555 () Bool)

(assert (=> d!63201 m!279555))

(assert (=> b!263373 m!279307))

(declare-fun m!279557 () Bool)

(assert (=> b!263373 m!279557))

(assert (=> b!263373 m!279307))

(declare-fun m!279559 () Bool)

(assert (=> b!263373 m!279559))

(assert (=> b!263373 m!279559))

(declare-fun m!279561 () Bool)

(assert (=> b!263373 m!279561))

(assert (=> b!263375 m!279307))

(assert (=> b!263375 m!279559))

(assert (=> b!263375 m!279559))

(assert (=> b!263375 m!279561))

(assert (=> b!263226 d!63201))

(assert (=> b!263226 d!63129))

(declare-fun b!263394 () Bool)

(declare-fun e!170694 () Bool)

(declare-fun e!170691 () Bool)

(assert (=> b!263394 (= e!170694 e!170691)))

(declare-fun res!128643 () Bool)

(declare-fun lt!133330 () SeekEntryResult!1200)

(assert (=> b!263394 (= res!128643 (and ((_ is Intermediate!1200) lt!133330) (not (undefined!2012 lt!133330)) (bvslt (x!25242 lt!133330) #b01111111111111111111111111111110) (bvsge (x!25242 lt!133330) #b00000000000000000000000000000000) (bvsge (x!25242 lt!133330) #b00000000000000000000000000000000)))))

(assert (=> b!263394 (=> (not res!128643) (not e!170691))))

(declare-fun b!263395 () Bool)

(declare-fun e!170695 () SeekEntryResult!1200)

(declare-fun e!170693 () SeekEntryResult!1200)

(assert (=> b!263395 (= e!170695 e!170693)))

(declare-fun c!44931 () Bool)

(declare-fun lt!133329 () (_ BitVec 64))

(assert (=> b!263395 (= c!44931 (or (= lt!133329 key!932) (= (bvadd lt!133329 lt!133329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263396 () Bool)

(assert (=> b!263396 (and (bvsge (index!6972 lt!133330) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133330) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun e!170692 () Bool)

(assert (=> b!263396 (= e!170692 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263397 () Bool)

(assert (=> b!263397 (and (bvsge (index!6972 lt!133330) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133330) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128642 () Bool)

(assert (=> b!263397 (= res!128642 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263397 (=> res!128642 e!170692)))

(declare-fun b!263398 () Bool)

(assert (=> b!263398 (= e!170695 (Intermediate!1200 true (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!263399 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!263399 (= e!170693 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!263400 () Bool)

(assert (=> b!263400 (= e!170694 (bvsge (x!25242 lt!133330) #b01111111111111111111111111111110))))

(declare-fun d!63203 () Bool)

(assert (=> d!63203 e!170694))

(declare-fun c!44932 () Bool)

(assert (=> d!63203 (= c!44932 (and ((_ is Intermediate!1200) lt!133330) (undefined!2012 lt!133330)))))

(assert (=> d!63203 (= lt!133330 e!170695)))

(declare-fun c!44933 () Bool)

(assert (=> d!63203 (= c!44933 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!63203 (= lt!133329 (select (arr!5999 (_keys!7035 thiss!1504)) (toIndex!0 key!932 (mask!11209 thiss!1504))))))

(assert (=> d!63203 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11209 thiss!1504)) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) lt!133330)))

(declare-fun b!263401 () Bool)

(assert (=> b!263401 (and (bvsge (index!6972 lt!133330) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133330) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128644 () Bool)

(assert (=> b!263401 (= res!128644 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133330)) key!932))))

(assert (=> b!263401 (=> res!128644 e!170692)))

(assert (=> b!263401 (= e!170691 e!170692)))

(declare-fun b!263402 () Bool)

(assert (=> b!263402 (= e!170693 (Intermediate!1200 false (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!63203 c!44933) b!263398))

(assert (= (and d!63203 (not c!44933)) b!263395))

(assert (= (and b!263395 c!44931) b!263402))

(assert (= (and b!263395 (not c!44931)) b!263399))

(assert (= (and d!63203 c!44932) b!263400))

(assert (= (and d!63203 (not c!44932)) b!263394))

(assert (= (and b!263394 res!128643) b!263401))

(assert (= (and b!263401 (not res!128644)) b!263397))

(assert (= (and b!263397 (not res!128642)) b!263396))

(assert (=> b!263399 m!279143))

(declare-fun m!279563 () Bool)

(assert (=> b!263399 m!279563))

(assert (=> b!263399 m!279563))

(declare-fun m!279565 () Bool)

(assert (=> b!263399 m!279565))

(declare-fun m!279567 () Bool)

(assert (=> b!263396 m!279567))

(assert (=> b!263397 m!279567))

(assert (=> b!263401 m!279567))

(assert (=> d!63203 m!279143))

(declare-fun m!279569 () Bool)

(assert (=> d!63203 m!279569))

(assert (=> d!63203 m!279139))

(assert (=> d!63077 d!63203))

(declare-fun d!63205 () Bool)

(declare-fun lt!133336 () (_ BitVec 32))

(declare-fun lt!133335 () (_ BitVec 32))

(assert (=> d!63205 (= lt!133336 (bvmul (bvxor lt!133335 (bvlshr lt!133335 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63205 (= lt!133335 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63205 (and (bvsge (mask!11209 thiss!1504) #b00000000000000000000000000000000) (let ((res!128645 (let ((h!4517 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25267 (bvmul (bvxor h!4517 (bvlshr h!4517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25267 (bvlshr x!25267 #b00000000000000000000000000001101)) (mask!11209 thiss!1504)))))) (and (bvslt res!128645 (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!128645 #b00000000000000000000000000000000))))))

(assert (=> d!63205 (= (toIndex!0 key!932 (mask!11209 thiss!1504)) (bvand (bvxor lt!133336 (bvlshr lt!133336 #b00000000000000000000000000001101)) (mask!11209 thiss!1504)))))

(assert (=> d!63077 d!63205))

(assert (=> d!63077 d!63181))

(assert (=> b!263189 d!63195))

(declare-fun b!263427 () Bool)

(declare-fun e!170715 () Bool)

(declare-fun lt!133352 () ListLongMap!3891)

(assert (=> b!263427 (= e!170715 (= lt!133352 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504))))))

(declare-fun b!263428 () Bool)

(declare-fun e!170713 () Bool)

(assert (=> b!263428 (= e!170713 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263428 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263429 () Bool)

(declare-fun res!128654 () Bool)

(declare-fun e!170714 () Bool)

(assert (=> b!263429 (=> (not res!128654) (not e!170714))))

(assert (=> b!263429 (= res!128654 (not (contains!1912 lt!133352 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263430 () Bool)

(declare-fun e!170716 () Bool)

(assert (=> b!263430 (= e!170714 e!170716)))

(declare-fun c!44943 () Bool)

(assert (=> b!263430 (= c!44943 e!170713)))

(declare-fun res!128655 () Bool)

(assert (=> b!263430 (=> (not res!128655) (not e!170713))))

(assert (=> b!263430 (= res!128655 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!263431 () Bool)

(declare-fun e!170712 () ListLongMap!3891)

(declare-fun e!170710 () ListLongMap!3891)

(assert (=> b!263431 (= e!170712 e!170710)))

(declare-fun c!44945 () Bool)

(assert (=> b!263431 (= c!44945 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263432 () Bool)

(declare-fun isEmpty!541 (ListLongMap!3891) Bool)

(assert (=> b!263432 (= e!170715 (isEmpty!541 lt!133352))))

(declare-fun bm!25209 () Bool)

(declare-fun call!25212 () ListLongMap!3891)

(assert (=> bm!25209 (= call!25212 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)))))

(declare-fun d!63207 () Bool)

(assert (=> d!63207 e!170714))

(declare-fun res!128657 () Bool)

(assert (=> d!63207 (=> (not res!128657) (not e!170714))))

(assert (=> d!63207 (= res!128657 (not (contains!1912 lt!133352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63207 (= lt!133352 e!170712)))

(declare-fun c!44942 () Bool)

(assert (=> d!63207 (= c!44942 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63207 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63207 (= (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133352)))

(declare-fun b!263433 () Bool)

(assert (=> b!263433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> b!263433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 (_values!4826 thiss!1504))))))

(declare-fun e!170711 () Bool)

(assert (=> b!263433 (= e!170711 (= (apply!262 lt!133352 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263434 () Bool)

(assert (=> b!263434 (= e!170716 e!170715)))

(declare-fun c!44944 () Bool)

(assert (=> b!263434 (= c!44944 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!263435 () Bool)

(assert (=> b!263435 (= e!170712 (ListLongMap!3892 Nil!3849))))

(declare-fun b!263436 () Bool)

(declare-fun lt!133351 () Unit!8190)

(declare-fun lt!133354 () Unit!8190)

(assert (=> b!263436 (= lt!133351 lt!133354)))

(declare-fun lt!133355 () (_ BitVec 64))

(declare-fun lt!133356 () (_ BitVec 64))

(declare-fun lt!133353 () V!8523)

(declare-fun lt!133357 () ListLongMap!3891)

(assert (=> b!263436 (not (contains!1912 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353)) lt!133355))))

(declare-fun addStillNotContains!129 (ListLongMap!3891 (_ BitVec 64) V!8523 (_ BitVec 64)) Unit!8190)

(assert (=> b!263436 (= lt!133354 (addStillNotContains!129 lt!133357 lt!133356 lt!133353 lt!133355))))

(assert (=> b!263436 (= lt!133355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263436 (= lt!133353 (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263436 (= lt!133356 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!263436 (= lt!133357 call!25212)))

(assert (=> b!263436 (= e!170710 (+!710 call!25212 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263437 () Bool)

(assert (=> b!263437 (= e!170710 call!25212)))

(declare-fun b!263438 () Bool)

(assert (=> b!263438 (= e!170716 e!170711)))

(assert (=> b!263438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128656 () Bool)

(assert (=> b!263438 (= res!128656 (contains!1912 lt!133352 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263438 (=> (not res!128656) (not e!170711))))

(assert (= (and d!63207 c!44942) b!263435))

(assert (= (and d!63207 (not c!44942)) b!263431))

(assert (= (and b!263431 c!44945) b!263436))

(assert (= (and b!263431 (not c!44945)) b!263437))

(assert (= (or b!263436 b!263437) bm!25209))

(assert (= (and d!63207 res!128657) b!263429))

(assert (= (and b!263429 res!128654) b!263430))

(assert (= (and b!263430 res!128655) b!263428))

(assert (= (and b!263430 c!44943) b!263438))

(assert (= (and b!263430 (not c!44943)) b!263434))

(assert (= (and b!263438 res!128656) b!263433))

(assert (= (and b!263434 c!44944) b!263427))

(assert (= (and b!263434 (not c!44944)) b!263432))

(declare-fun b_lambda!8339 () Bool)

(assert (=> (not b_lambda!8339) (not b!263433)))

(assert (=> b!263433 t!8933))

(declare-fun b_and!13945 () Bool)

(assert (= b_and!13943 (and (=> t!8933 result!5433) b_and!13945)))

(declare-fun b_lambda!8341 () Bool)

(assert (=> (not b_lambda!8341) (not b!263436)))

(assert (=> b!263436 t!8933))

(declare-fun b_and!13947 () Bool)

(assert (= b_and!13945 (and (=> t!8933 result!5433) b_and!13947)))

(declare-fun m!279571 () Bool)

(assert (=> bm!25209 m!279571))

(assert (=> b!263428 m!279199))

(assert (=> b!263428 m!279199))

(assert (=> b!263428 m!279201))

(assert (=> b!263427 m!279571))

(declare-fun m!279573 () Bool)

(assert (=> b!263436 m!279573))

(assert (=> b!263436 m!279251))

(declare-fun m!279575 () Bool)

(assert (=> b!263436 m!279575))

(assert (=> b!263436 m!279199))

(assert (=> b!263436 m!279249))

(declare-fun m!279577 () Bool)

(assert (=> b!263436 m!279577))

(declare-fun m!279579 () Bool)

(assert (=> b!263436 m!279579))

(assert (=> b!263436 m!279577))

(assert (=> b!263436 m!279249))

(assert (=> b!263436 m!279251))

(assert (=> b!263436 m!279253))

(declare-fun m!279581 () Bool)

(assert (=> b!263432 m!279581))

(assert (=> b!263438 m!279199))

(assert (=> b!263438 m!279199))

(declare-fun m!279583 () Bool)

(assert (=> b!263438 m!279583))

(declare-fun m!279585 () Bool)

(assert (=> b!263429 m!279585))

(assert (=> b!263431 m!279199))

(assert (=> b!263431 m!279199))

(assert (=> b!263431 m!279201))

(declare-fun m!279587 () Bool)

(assert (=> d!63207 m!279587))

(assert (=> d!63207 m!279139))

(assert (=> b!263433 m!279251))

(assert (=> b!263433 m!279199))

(assert (=> b!263433 m!279249))

(assert (=> b!263433 m!279199))

(declare-fun m!279589 () Bool)

(assert (=> b!263433 m!279589))

(assert (=> b!263433 m!279249))

(assert (=> b!263433 m!279251))

(assert (=> b!263433 m!279253))

(assert (=> bm!25172 d!63207))

(assert (=> b!263133 d!63195))

(assert (=> b!263256 d!63109))

(declare-fun b!263439 () Bool)

(declare-fun e!170717 () (_ BitVec 32))

(assert (=> b!263439 (= e!170717 #b00000000000000000000000000000000)))

(declare-fun b!263441 () Bool)

(declare-fun e!170718 () (_ BitVec 32))

(assert (=> b!263441 (= e!170717 e!170718)))

(declare-fun c!44947 () Bool)

(assert (=> b!263441 (= c!44947 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!263442 () Bool)

(declare-fun call!25213 () (_ BitVec 32))

(assert (=> b!263442 (= e!170718 call!25213)))

(declare-fun bm!25210 () Bool)

(assert (=> bm!25210 (= call!25213 (arrayCountValidKeys!0 (_keys!7035 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))))))

(declare-fun d!63209 () Bool)

(declare-fun lt!133358 () (_ BitVec 32))

(assert (=> d!63209 (and (bvsge lt!133358 #b00000000000000000000000000000000) (bvsle lt!133358 (bvsub (size!6350 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (=> d!63209 (= lt!133358 e!170717)))

(declare-fun c!44946 () Bool)

(assert (=> d!63209 (= c!44946 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63209 (and (bvsle #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 lt!133015)) (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63209 (= (arrayCountValidKeys!0 (_keys!7035 lt!133015) #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))) lt!133358)))

(declare-fun b!263440 () Bool)

(assert (=> b!263440 (= e!170718 (bvadd #b00000000000000000000000000000001 call!25213))))

(assert (= (and d!63209 c!44946) b!263439))

(assert (= (and d!63209 (not c!44946)) b!263441))

(assert (= (and b!263441 c!44947) b!263440))

(assert (= (and b!263441 (not c!44947)) b!263442))

(assert (= (or b!263440 b!263442) bm!25210))

(declare-fun m!279591 () Bool)

(assert (=> b!263441 m!279591))

(assert (=> b!263441 m!279591))

(declare-fun m!279593 () Bool)

(assert (=> b!263441 m!279593))

(declare-fun m!279595 () Bool)

(assert (=> bm!25210 m!279595))

(assert (=> b!263206 d!63209))

(declare-fun d!63211 () Bool)

(declare-fun res!128658 () Bool)

(declare-fun e!170719 () Bool)

(assert (=> d!63211 (=> res!128658 e!170719)))

(assert (=> d!63211 (= res!128658 (= (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63211 (= (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170719)))

(declare-fun b!263443 () Bool)

(declare-fun e!170720 () Bool)

(assert (=> b!263443 (= e!170719 e!170720)))

(declare-fun res!128659 () Bool)

(assert (=> b!263443 (=> (not res!128659) (not e!170720))))

(assert (=> b!263443 (= res!128659 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!263444 () Bool)

(assert (=> b!263444 (= e!170720 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63211 (not res!128658)) b!263443))

(assert (= (and b!263443 res!128659) b!263444))

(declare-fun m!279597 () Bool)

(assert (=> d!63211 m!279597))

(declare-fun m!279599 () Bool)

(assert (=> b!263444 m!279599))

(assert (=> b!263220 d!63211))

(declare-fun d!63213 () Bool)

(declare-fun res!128660 () Bool)

(declare-fun e!170721 () Bool)

(assert (=> d!63213 (=> res!128660 e!170721)))

(assert (=> d!63213 (= res!128660 (and ((_ is Cons!3848) (toList!1961 lt!133012)) (= (_1!2500 (h!4514 (toList!1961 lt!133012))) key!932)))))

(assert (=> d!63213 (= (containsKey!312 (toList!1961 lt!133012) key!932) e!170721)))

(declare-fun b!263445 () Bool)

(declare-fun e!170722 () Bool)

(assert (=> b!263445 (= e!170721 e!170722)))

(declare-fun res!128661 () Bool)

(assert (=> b!263445 (=> (not res!128661) (not e!170722))))

(assert (=> b!263445 (= res!128661 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133012))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133012))) key!932)) ((_ is Cons!3848) (toList!1961 lt!133012)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133012))) key!932)))))

(declare-fun b!263446 () Bool)

(assert (=> b!263446 (= e!170722 (containsKey!312 (t!8929 (toList!1961 lt!133012)) key!932))))

(assert (= (and d!63213 (not res!128660)) b!263445))

(assert (= (and b!263445 res!128661) b!263446))

(declare-fun m!279601 () Bool)

(assert (=> b!263446 m!279601))

(assert (=> d!63097 d!63213))

(declare-fun b!263447 () Bool)

(declare-fun e!170723 () Bool)

(assert (=> b!263447 (= e!170723 (contains!1915 Nil!3850 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!263449 () Bool)

(declare-fun e!170726 () Bool)

(declare-fun call!25214 () Bool)

(assert (=> b!263449 (= e!170726 call!25214)))

(declare-fun b!263450 () Bool)

(declare-fun e!170724 () Bool)

(assert (=> b!263450 (= e!170724 e!170726)))

(declare-fun c!44948 () Bool)

(assert (=> b!263450 (= c!44948 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!263448 () Bool)

(declare-fun e!170725 () Bool)

(assert (=> b!263448 (= e!170725 e!170724)))

(declare-fun res!128663 () Bool)

(assert (=> b!263448 (=> (not res!128663) (not e!170724))))

(assert (=> b!263448 (= res!128663 (not e!170723))))

(declare-fun res!128664 () Bool)

(assert (=> b!263448 (=> (not res!128664) (not e!170723))))

(assert (=> b!263448 (= res!128664 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun d!63215 () Bool)

(declare-fun res!128662 () Bool)

(assert (=> d!63215 (=> res!128662 e!170725)))

(assert (=> d!63215 (= res!128662 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63215 (= (arrayNoDuplicates!0 (_keys!7035 lt!133015) #b00000000000000000000000000000000 Nil!3850) e!170725)))

(declare-fun bm!25211 () Bool)

(assert (=> bm!25211 (= call!25214 (arrayNoDuplicates!0 (_keys!7035 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44948 (Cons!3849 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) Nil!3850) Nil!3850)))))

(declare-fun b!263451 () Bool)

(assert (=> b!263451 (= e!170726 call!25214)))

(assert (= (and d!63215 (not res!128662)) b!263448))

(assert (= (and b!263448 res!128664) b!263447))

(assert (= (and b!263448 res!128663) b!263450))

(assert (= (and b!263450 c!44948) b!263449))

(assert (= (and b!263450 (not c!44948)) b!263451))

(assert (= (or b!263449 b!263451) bm!25211))

(assert (=> b!263447 m!279591))

(assert (=> b!263447 m!279591))

(declare-fun m!279603 () Bool)

(assert (=> b!263447 m!279603))

(assert (=> b!263450 m!279591))

(assert (=> b!263450 m!279591))

(assert (=> b!263450 m!279593))

(assert (=> b!263448 m!279591))

(assert (=> b!263448 m!279591))

(assert (=> b!263448 m!279593))

(assert (=> bm!25211 m!279591))

(declare-fun m!279605 () Bool)

(assert (=> bm!25211 m!279605))

(assert (=> b!263208 d!63215))

(assert (=> d!63099 d!63181))

(declare-fun d!63217 () Bool)

(assert (=> d!63217 (= (apply!262 lt!133256 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9256 () Bool)

(assert (= bs!9256 d!63217))

(declare-fun m!279607 () Bool)

(assert (=> bs!9256 m!279607))

(assert (=> bs!9256 m!279607))

(declare-fun m!279609 () Bool)

(assert (=> bs!9256 m!279609))

(assert (=> b!263234 d!63217))

(declare-fun d!63219 () Bool)

(assert (=> d!63219 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133025) key!932))))

(declare-fun lt!133359 () Unit!8190)

(assert (=> d!63219 (= lt!133359 (choose!1293 (toList!1961 lt!133025) key!932))))

(declare-fun e!170727 () Bool)

(assert (=> d!63219 e!170727))

(declare-fun res!128665 () Bool)

(assert (=> d!63219 (=> (not res!128665) (not e!170727))))

(assert (=> d!63219 (= res!128665 (isStrictlySorted!377 (toList!1961 lt!133025)))))

(assert (=> d!63219 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133025) key!932) lt!133359)))

(declare-fun b!263452 () Bool)

(assert (=> b!263452 (= e!170727 (containsKey!312 (toList!1961 lt!133025) key!932))))

(assert (= (and d!63219 res!128665) b!263452))

(assert (=> d!63219 m!279289))

(assert (=> d!63219 m!279289))

(assert (=> d!63219 m!279291))

(declare-fun m!279611 () Bool)

(assert (=> d!63219 m!279611))

(declare-fun m!279613 () Bool)

(assert (=> d!63219 m!279613))

(assert (=> b!263452 m!279285))

(assert (=> b!263191 d!63219))

(declare-fun d!63221 () Bool)

(assert (=> d!63221 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133025) key!932)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133025) key!932))))))

(declare-fun bs!9257 () Bool)

(assert (= bs!9257 d!63221))

(assert (=> bs!9257 m!279289))

(declare-fun m!279615 () Bool)

(assert (=> bs!9257 m!279615))

(assert (=> b!263191 d!63221))

(declare-fun b!263455 () Bool)

(declare-fun e!170729 () Option!326)

(assert (=> b!263455 (= e!170729 (getValueByKey!320 (t!8929 (toList!1961 lt!133025)) key!932))))

(declare-fun b!263453 () Bool)

(declare-fun e!170728 () Option!326)

(assert (=> b!263453 (= e!170728 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133025)))))))

(declare-fun d!63223 () Bool)

(declare-fun c!44949 () Bool)

(assert (=> d!63223 (= c!44949 (and ((_ is Cons!3848) (toList!1961 lt!133025)) (= (_1!2500 (h!4514 (toList!1961 lt!133025))) key!932)))))

(assert (=> d!63223 (= (getValueByKey!320 (toList!1961 lt!133025) key!932) e!170728)))

(declare-fun b!263456 () Bool)

(assert (=> b!263456 (= e!170729 None!324)))

(declare-fun b!263454 () Bool)

(assert (=> b!263454 (= e!170728 e!170729)))

(declare-fun c!44950 () Bool)

(assert (=> b!263454 (= c!44950 (and ((_ is Cons!3848) (toList!1961 lt!133025)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133025))) key!932))))))

(assert (= (and d!63223 c!44949) b!263453))

(assert (= (and d!63223 (not c!44949)) b!263454))

(assert (= (and b!263454 c!44950) b!263455))

(assert (= (and b!263454 (not c!44950)) b!263456))

(declare-fun m!279617 () Bool)

(assert (=> b!263455 m!279617))

(assert (=> b!263191 d!63223))

(declare-fun d!63225 () Bool)

(declare-fun e!170730 () Bool)

(assert (=> d!63225 e!170730))

(declare-fun res!128666 () Bool)

(assert (=> d!63225 (=> res!128666 e!170730)))

(declare-fun lt!133361 () Bool)

(assert (=> d!63225 (= res!128666 (not lt!133361))))

(declare-fun lt!133360 () Bool)

(assert (=> d!63225 (= lt!133361 lt!133360)))

(declare-fun lt!133362 () Unit!8190)

(declare-fun e!170731 () Unit!8190)

(assert (=> d!63225 (= lt!133362 e!170731)))

(declare-fun c!44951 () Bool)

(assert (=> d!63225 (= c!44951 lt!133360)))

(assert (=> d!63225 (= lt!133360 (containsKey!312 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63225 (= (contains!1912 lt!133201 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133361)))

(declare-fun b!263457 () Bool)

(declare-fun lt!133363 () Unit!8190)

(assert (=> b!263457 (= e!170731 lt!133363)))

(assert (=> b!263457 (= lt!133363 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263457 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263458 () Bool)

(declare-fun Unit!8209 () Unit!8190)

(assert (=> b!263458 (= e!170731 Unit!8209)))

(declare-fun b!263459 () Bool)

(assert (=> b!263459 (= e!170730 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63225 c!44951) b!263457))

(assert (= (and d!63225 (not c!44951)) b!263458))

(assert (= (and d!63225 (not res!128666)) b!263459))

(declare-fun m!279619 () Bool)

(assert (=> d!63225 m!279619))

(declare-fun m!279621 () Bool)

(assert (=> b!263457 m!279621))

(declare-fun m!279623 () Bool)

(assert (=> b!263457 m!279623))

(assert (=> b!263457 m!279623))

(declare-fun m!279625 () Bool)

(assert (=> b!263457 m!279625))

(assert (=> b!263459 m!279623))

(assert (=> b!263459 m!279623))

(assert (=> b!263459 m!279625))

(assert (=> bm!25177 d!63225))

(declare-fun d!63227 () Bool)

(assert (=> d!63227 (= (inRange!0 (index!6971 lt!133104) (mask!11209 thiss!1504)) (and (bvsge (index!6971 lt!133104) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133104) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!263027 d!63227))

(declare-fun d!63229 () Bool)

(assert (=> d!63229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504))))

(assert (=> d!63229 true))

(declare-fun _$56!45 () Unit!8190)

(assert (=> d!63229 (= (choose!102 key!932 (_keys!7035 thiss!1504) index!297 (mask!11209 thiss!1504)) _$56!45)))

(declare-fun bs!9258 () Bool)

(assert (= bs!9258 d!63229))

(assert (=> bs!9258 m!279017))

(assert (=> bs!9258 m!279317))

(assert (=> d!63123 d!63229))

(assert (=> d!63123 d!63181))

(assert (=> b!263193 d!63221))

(assert (=> b!263193 d!63223))

(assert (=> b!263146 d!63189))

(declare-fun d!63231 () Bool)

(declare-fun res!128667 () Bool)

(declare-fun e!170732 () Bool)

(assert (=> d!63231 (=> res!128667 e!170732)))

(assert (=> d!63231 (= res!128667 (= (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63231 (= (arrayContainsKey!0 lt!133026 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170732)))

(declare-fun b!263460 () Bool)

(declare-fun e!170733 () Bool)

(assert (=> b!263460 (= e!170732 e!170733)))

(declare-fun res!128668 () Bool)

(assert (=> b!263460 (=> (not res!128668) (not e!170733))))

(assert (=> b!263460 (= res!128668 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263461 () Bool)

(assert (=> b!263461 (= e!170733 (arrayContainsKey!0 lt!133026 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63231 (not res!128667)) b!263460))

(assert (= (and b!263460 res!128668) b!263461))

(assert (=> d!63231 m!279457))

(declare-fun m!279627 () Bool)

(assert (=> b!263461 m!279627))

(assert (=> b!263199 d!63231))

(assert (=> d!63079 d!63077))

(declare-fun d!63233 () Bool)

(declare-fun e!170736 () Bool)

(assert (=> d!63233 e!170736))

(declare-fun res!128674 () Bool)

(assert (=> d!63233 (=> (not res!128674) (not e!170736))))

(declare-fun lt!133366 () SeekEntryResult!1200)

(assert (=> d!63233 (= res!128674 ((_ is Found!1200) lt!133366))))

(assert (=> d!63233 (= lt!133366 (seekEntryOrOpen!0 key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(assert (=> d!63233 true))

(declare-fun _$33!186 () Unit!8190)

(assert (=> d!63233 (= (choose!1288 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) key!932 (defaultEntry!4843 thiss!1504)) _$33!186)))

(declare-fun b!263466 () Bool)

(declare-fun res!128673 () Bool)

(assert (=> b!263466 (=> (not res!128673) (not e!170736))))

(assert (=> b!263466 (= res!128673 (inRange!0 (index!6971 lt!133366) (mask!11209 thiss!1504)))))

(declare-fun b!263467 () Bool)

(assert (=> b!263467 (= e!170736 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6971 lt!133366)) key!932))))

(assert (= (and d!63233 res!128674) b!263466))

(assert (= (and b!263466 res!128673) b!263467))

(assert (=> d!63233 m!279049))

(declare-fun m!279629 () Bool)

(assert (=> b!263466 m!279629))

(declare-fun m!279631 () Bool)

(assert (=> b!263467 m!279631))

(assert (=> d!63079 d!63233))

(assert (=> d!63079 d!63181))

(declare-fun d!63235 () Bool)

(declare-fun e!170737 () Bool)

(assert (=> d!63235 e!170737))

(declare-fun res!128675 () Bool)

(assert (=> d!63235 (=> (not res!128675) (not e!170737))))

(declare-fun lt!133369 () ListLongMap!3891)

(assert (=> d!63235 (= res!128675 (contains!1912 lt!133369 (_1!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun lt!133370 () List!3852)

(assert (=> d!63235 (= lt!133369 (ListLongMap!3892 lt!133370))))

(declare-fun lt!133368 () Unit!8190)

(declare-fun lt!133367 () Unit!8190)

(assert (=> d!63235 (= lt!133368 lt!133367)))

(assert (=> d!63235 (= (getValueByKey!320 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346))) (Some!325 (_2!2500 (tuple2!4979 key!932 v!346))))))

(assert (=> d!63235 (= lt!133367 (lemmaContainsTupThenGetReturnValue!176 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))))))

(assert (=> d!63235 (= lt!133370 (insertStrictlySorted!179 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))))))

(assert (=> d!63235 (= (+!710 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) (tuple2!4979 key!932 v!346)) lt!133369)))

(declare-fun b!263468 () Bool)

(declare-fun res!128676 () Bool)

(assert (=> b!263468 (=> (not res!128676) (not e!170737))))

(assert (=> b!263468 (= res!128676 (= (getValueByKey!320 (toList!1961 lt!133369) (_1!2500 (tuple2!4979 key!932 v!346))) (Some!325 (_2!2500 (tuple2!4979 key!932 v!346)))))))

(declare-fun b!263469 () Bool)

(assert (=> b!263469 (= e!170737 (contains!1914 (toList!1961 lt!133369) (tuple2!4979 key!932 v!346)))))

(assert (= (and d!63235 res!128675) b!263468))

(assert (= (and b!263468 res!128676) b!263469))

(declare-fun m!279633 () Bool)

(assert (=> d!63235 m!279633))

(declare-fun m!279635 () Bool)

(assert (=> d!63235 m!279635))

(declare-fun m!279637 () Bool)

(assert (=> d!63235 m!279637))

(declare-fun m!279639 () Bool)

(assert (=> d!63235 m!279639))

(declare-fun m!279641 () Bool)

(assert (=> b!263468 m!279641))

(declare-fun m!279643 () Bool)

(assert (=> b!263469 m!279643))

(assert (=> b!263229 d!63235))

(assert (=> b!263229 d!63099))

(declare-fun d!63237 () Bool)

(declare-fun e!170742 () Bool)

(assert (=> d!63237 e!170742))

(declare-fun res!128685 () Bool)

(assert (=> d!63237 (=> (not res!128685) (not e!170742))))

(assert (=> d!63237 (= res!128685 (or (bvsge #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))))

(declare-fun lt!133386 () ListLongMap!3891)

(declare-fun lt!133377 () ListLongMap!3891)

(assert (=> d!63237 (= lt!133386 lt!133377)))

(declare-fun lt!133380 () Unit!8190)

(declare-fun e!170738 () Unit!8190)

(assert (=> d!63237 (= lt!133380 e!170738)))

(declare-fun c!44952 () Bool)

(declare-fun e!170745 () Bool)

(assert (=> d!63237 (= c!44952 e!170745)))

(declare-fun res!128680 () Bool)

(assert (=> d!63237 (=> (not res!128680) (not e!170745))))

(assert (=> d!63237 (= res!128680 (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun e!170740 () ListLongMap!3891)

(assert (=> d!63237 (= lt!133377 e!170740)))

(declare-fun c!44956 () Bool)

(assert (=> d!63237 (= c!44956 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63237 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63237 (= (getCurrentListMap!1489 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133386)))

(declare-fun b!263470 () Bool)

(declare-fun Unit!8210 () Unit!8190)

(assert (=> b!263470 (= e!170738 Unit!8210)))

(declare-fun e!170747 () Bool)

(declare-fun b!263471 () Bool)

(assert (=> b!263471 (= e!170747 (= (apply!262 lt!133386 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))))))))

(assert (=> b!263471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun b!263472 () Bool)

(declare-fun e!170748 () Bool)

(declare-fun call!25219 () Bool)

(assert (=> b!263472 (= e!170748 (not call!25219))))

(declare-fun b!263473 () Bool)

(assert (=> b!263473 (= e!170742 e!170748)))

(declare-fun c!44955 () Bool)

(assert (=> b!263473 (= c!44955 (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263474 () Bool)

(declare-fun e!170750 () Bool)

(assert (=> b!263474 (= e!170750 (= (apply!262 lt!133386 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4684 thiss!1504)))))

(declare-fun call!25217 () ListLongMap!3891)

(declare-fun bm!25212 () Bool)

(assert (=> bm!25212 (= call!25217 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun b!263475 () Bool)

(declare-fun res!128677 () Bool)

(assert (=> b!263475 (=> (not res!128677) (not e!170742))))

(declare-fun e!170739 () Bool)

(assert (=> b!263475 (= res!128677 e!170739)))

(declare-fun c!44954 () Bool)

(assert (=> b!263475 (= c!44954 (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!263476 () Bool)

(declare-fun res!128679 () Bool)

(assert (=> b!263476 (=> (not res!128679) (not e!170742))))

(declare-fun e!170744 () Bool)

(assert (=> b!263476 (= res!128679 e!170744)))

(declare-fun res!128678 () Bool)

(assert (=> b!263476 (=> res!128678 e!170744)))

(declare-fun e!170746 () Bool)

(assert (=> b!263476 (= res!128678 (not e!170746))))

(declare-fun res!128681 () Bool)

(assert (=> b!263476 (=> (not res!128681) (not e!170746))))

(assert (=> b!263476 (= res!128681 (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun bm!25213 () Bool)

(assert (=> bm!25213 (= call!25219 (contains!1912 lt!133386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263477 () Bool)

(declare-fun lt!133391 () Unit!8190)

(assert (=> b!263477 (= e!170738 lt!133391)))

(declare-fun lt!133392 () ListLongMap!3891)

(assert (=> b!263477 (= lt!133392 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133372 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133385 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133385 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133382 () Unit!8190)

(assert (=> b!263477 (= lt!133382 (addStillContains!238 lt!133392 lt!133372 (zeroValue!4684 thiss!1504) lt!133385))))

(assert (=> b!263477 (contains!1912 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))) lt!133385)))

(declare-fun lt!133374 () Unit!8190)

(assert (=> b!263477 (= lt!133374 lt!133382)))

(declare-fun lt!133388 () ListLongMap!3891)

(assert (=> b!263477 (= lt!133388 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133387 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133387 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133371 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133371 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133390 () Unit!8190)

(assert (=> b!263477 (= lt!133390 (addApplyDifferent!238 lt!133388 lt!133387 (minValue!4684 thiss!1504) lt!133371))))

(assert (=> b!263477 (= (apply!262 (+!710 lt!133388 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))) lt!133371) (apply!262 lt!133388 lt!133371))))

(declare-fun lt!133376 () Unit!8190)

(assert (=> b!263477 (= lt!133376 lt!133390)))

(declare-fun lt!133378 () ListLongMap!3891)

(assert (=> b!263477 (= lt!133378 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133379 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133383 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133383 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133389 () Unit!8190)

(assert (=> b!263477 (= lt!133389 (addApplyDifferent!238 lt!133378 lt!133379 (zeroValue!4684 thiss!1504) lt!133383))))

(assert (=> b!263477 (= (apply!262 (+!710 lt!133378 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))) lt!133383) (apply!262 lt!133378 lt!133383))))

(declare-fun lt!133381 () Unit!8190)

(assert (=> b!263477 (= lt!133381 lt!133389)))

(declare-fun lt!133384 () ListLongMap!3891)

(assert (=> b!263477 (= lt!133384 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(declare-fun lt!133373 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133375 () (_ BitVec 64))

(assert (=> b!263477 (= lt!133375 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!263477 (= lt!133391 (addApplyDifferent!238 lt!133384 lt!133373 (minValue!4684 thiss!1504) lt!133375))))

(assert (=> b!263477 (= (apply!262 (+!710 lt!133384 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))) lt!133375) (apply!262 lt!133384 lt!133375))))

(declare-fun bm!25214 () Bool)

(declare-fun call!25216 () ListLongMap!3891)

(declare-fun call!25215 () ListLongMap!3891)

(assert (=> bm!25214 (= call!25216 call!25215)))

(declare-fun b!263478 () Bool)

(declare-fun e!170741 () ListLongMap!3891)

(declare-fun call!25220 () ListLongMap!3891)

(assert (=> b!263478 (= e!170741 call!25220)))

(declare-fun b!263479 () Bool)

(declare-fun call!25221 () ListLongMap!3891)

(assert (=> b!263479 (= e!170740 (+!710 call!25221 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun bm!25215 () Bool)

(assert (=> bm!25215 (= call!25215 call!25217)))

(declare-fun b!263480 () Bool)

(declare-fun e!170743 () Bool)

(assert (=> b!263480 (= e!170743 (= (apply!262 lt!133386 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4684 thiss!1504)))))

(declare-fun bm!25216 () Bool)

(declare-fun c!44953 () Bool)

(assert (=> bm!25216 (= call!25221 (+!710 (ite c!44956 call!25217 (ite c!44953 call!25215 call!25216)) (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263481 () Bool)

(declare-fun c!44957 () Bool)

(assert (=> b!263481 (= c!44957 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170749 () ListLongMap!3891)

(assert (=> b!263481 (= e!170741 e!170749)))

(declare-fun b!263482 () Bool)

(assert (=> b!263482 (= e!170739 e!170750)))

(declare-fun res!128682 () Bool)

(declare-fun call!25218 () Bool)

(assert (=> b!263482 (= res!128682 call!25218)))

(assert (=> b!263482 (=> (not res!128682) (not e!170750))))

(declare-fun b!263483 () Bool)

(assert (=> b!263483 (= e!170749 call!25220)))

(declare-fun b!263484 () Bool)

(assert (=> b!263484 (= e!170744 e!170747)))

(declare-fun res!128683 () Bool)

(assert (=> b!263484 (=> (not res!128683) (not e!170747))))

(assert (=> b!263484 (= res!128683 (contains!1912 lt!133386 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun bm!25217 () Bool)

(assert (=> bm!25217 (= call!25218 (contains!1912 lt!133386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263485 () Bool)

(assert (=> b!263485 (= e!170740 e!170741)))

(assert (=> b!263485 (= c!44953 (and (not (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263486 () Bool)

(assert (=> b!263486 (= e!170746 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263487 () Bool)

(assert (=> b!263487 (= e!170739 (not call!25218))))

(declare-fun b!263488 () Bool)

(assert (=> b!263488 (= e!170749 call!25216)))

(declare-fun b!263489 () Bool)

(assert (=> b!263489 (= e!170748 e!170743)))

(declare-fun res!128684 () Bool)

(assert (=> b!263489 (= res!128684 call!25219)))

(assert (=> b!263489 (=> (not res!128684) (not e!170743))))

(declare-fun b!263490 () Bool)

(assert (=> b!263490 (= e!170745 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!25218 () Bool)

(assert (=> bm!25218 (= call!25220 call!25221)))

(assert (= (and d!63237 c!44956) b!263479))

(assert (= (and d!63237 (not c!44956)) b!263485))

(assert (= (and b!263485 c!44953) b!263478))

(assert (= (and b!263485 (not c!44953)) b!263481))

(assert (= (and b!263481 c!44957) b!263483))

(assert (= (and b!263481 (not c!44957)) b!263488))

(assert (= (or b!263483 b!263488) bm!25214))

(assert (= (or b!263478 bm!25214) bm!25215))

(assert (= (or b!263478 b!263483) bm!25218))

(assert (= (or b!263479 bm!25215) bm!25212))

(assert (= (or b!263479 bm!25218) bm!25216))

(assert (= (and d!63237 res!128680) b!263490))

(assert (= (and d!63237 c!44952) b!263477))

(assert (= (and d!63237 (not c!44952)) b!263470))

(assert (= (and d!63237 res!128685) b!263476))

(assert (= (and b!263476 res!128681) b!263486))

(assert (= (and b!263476 (not res!128678)) b!263484))

(assert (= (and b!263484 res!128683) b!263471))

(assert (= (and b!263476 res!128679) b!263475))

(assert (= (and b!263475 c!44954) b!263482))

(assert (= (and b!263475 (not c!44954)) b!263487))

(assert (= (and b!263482 res!128682) b!263474))

(assert (= (or b!263482 b!263487) bm!25217))

(assert (= (and b!263475 res!128677) b!263473))

(assert (= (and b!263473 c!44955) b!263489))

(assert (= (and b!263473 (not c!44955)) b!263472))

(assert (= (and b!263489 res!128684) b!263480))

(assert (= (or b!263489 b!263472) bm!25213))

(declare-fun b_lambda!8343 () Bool)

(assert (=> (not b_lambda!8343) (not b!263471)))

(assert (=> b!263471 t!8933))

(declare-fun b_and!13949 () Bool)

(assert (= b_and!13947 (and (=> t!8933 result!5433) b_and!13949)))

(declare-fun m!279645 () Bool)

(assert (=> bm!25216 m!279645))

(declare-fun m!279647 () Bool)

(assert (=> b!263486 m!279647))

(assert (=> b!263486 m!279647))

(declare-fun m!279649 () Bool)

(assert (=> b!263486 m!279649))

(assert (=> b!263490 m!279647))

(assert (=> b!263490 m!279647))

(assert (=> b!263490 m!279649))

(declare-fun m!279651 () Bool)

(assert (=> bm!25217 m!279651))

(declare-fun m!279653 () Bool)

(assert (=> bm!25212 m!279653))

(declare-fun m!279655 () Bool)

(assert (=> b!263474 m!279655))

(assert (=> d!63237 m!279139))

(declare-fun m!279657 () Bool)

(assert (=> bm!25213 m!279657))

(assert (=> b!263484 m!279647))

(assert (=> b!263484 m!279647))

(declare-fun m!279659 () Bool)

(assert (=> b!263484 m!279659))

(declare-fun m!279661 () Bool)

(assert (=> b!263479 m!279661))

(declare-fun m!279663 () Bool)

(assert (=> b!263477 m!279663))

(declare-fun m!279665 () Bool)

(assert (=> b!263477 m!279665))

(declare-fun m!279667 () Bool)

(assert (=> b!263477 m!279667))

(declare-fun m!279669 () Bool)

(assert (=> b!263477 m!279669))

(declare-fun m!279671 () Bool)

(assert (=> b!263477 m!279671))

(assert (=> b!263477 m!279667))

(assert (=> b!263477 m!279647))

(declare-fun m!279673 () Bool)

(assert (=> b!263477 m!279673))

(assert (=> b!263477 m!279671))

(declare-fun m!279675 () Bool)

(assert (=> b!263477 m!279675))

(declare-fun m!279677 () Bool)

(assert (=> b!263477 m!279677))

(assert (=> b!263477 m!279663))

(declare-fun m!279679 () Bool)

(assert (=> b!263477 m!279679))

(assert (=> b!263477 m!279653))

(declare-fun m!279681 () Bool)

(assert (=> b!263477 m!279681))

(declare-fun m!279683 () Bool)

(assert (=> b!263477 m!279683))

(declare-fun m!279685 () Bool)

(assert (=> b!263477 m!279685))

(assert (=> b!263477 m!279683))

(declare-fun m!279687 () Bool)

(assert (=> b!263477 m!279687))

(declare-fun m!279689 () Bool)

(assert (=> b!263477 m!279689))

(declare-fun m!279691 () Bool)

(assert (=> b!263477 m!279691))

(declare-fun m!279693 () Bool)

(assert (=> b!263480 m!279693))

(assert (=> b!263471 m!279647))

(declare-fun m!279695 () Bool)

(assert (=> b!263471 m!279695))

(declare-fun m!279697 () Bool)

(assert (=> b!263471 m!279697))

(assert (=> b!263471 m!279251))

(declare-fun m!279699 () Bool)

(assert (=> b!263471 m!279699))

(assert (=> b!263471 m!279251))

(assert (=> b!263471 m!279697))

(assert (=> b!263471 m!279647))

(assert (=> b!263229 d!63237))

(declare-fun b!263491 () Bool)

(declare-fun e!170751 () (_ BitVec 32))

(assert (=> b!263491 (= e!170751 #b00000000000000000000000000000000)))

(declare-fun b!263493 () Bool)

(declare-fun e!170752 () (_ BitVec 32))

(assert (=> b!263493 (= e!170751 e!170752)))

(declare-fun c!44959 () Bool)

(assert (=> b!263493 (= c!44959 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263494 () Bool)

(declare-fun call!25222 () (_ BitVec 32))

(assert (=> b!263494 (= e!170752 call!25222)))

(declare-fun bm!25219 () Bool)

(assert (=> bm!25219 (= call!25222 (arrayCountValidKeys!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63239 () Bool)

(declare-fun lt!133393 () (_ BitVec 32))

(assert (=> d!63239 (and (bvsge lt!133393 #b00000000000000000000000000000000) (bvsle lt!133393 (bvsub (size!6350 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63239 (= lt!133393 e!170751)))

(declare-fun c!44958 () Bool)

(assert (=> d!63239 (= c!44958 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63239 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 lt!133026)))))

(assert (=> d!63239 (= (arrayCountValidKeys!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) lt!133393)))

(declare-fun b!263492 () Bool)

(assert (=> b!263492 (= e!170752 (bvadd #b00000000000000000000000000000001 call!25222))))

(assert (= (and d!63239 c!44958) b!263491))

(assert (= (and d!63239 (not c!44958)) b!263493))

(assert (= (and b!263493 c!44959) b!263492))

(assert (= (and b!263493 (not c!44959)) b!263494))

(assert (= (or b!263492 b!263494) bm!25219))

(assert (=> b!263493 m!279457))

(assert (=> b!263493 m!279457))

(assert (=> b!263493 m!279467))

(declare-fun m!279701 () Bool)

(assert (=> bm!25219 m!279701))

(assert (=> bm!25181 d!63239))

(declare-fun lt!133398 () SeekEntryResult!1200)

(declare-fun d!63241 () Bool)

(assert (=> d!63241 (and (or ((_ is Undefined!1200) lt!133398) (not ((_ is Found!1200) lt!133398)) (and (bvsge (index!6971 lt!133398) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133398) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133398) ((_ is Found!1200) lt!133398) (not ((_ is MissingVacant!1200) lt!133398)) (not (= (index!6973 lt!133398) (index!6972 lt!133097))) (and (bvsge (index!6973 lt!133398) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133398) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133398) (ite ((_ is Found!1200) lt!133398) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6971 lt!133398)) key!932) (and ((_ is MissingVacant!1200) lt!133398) (= (index!6973 lt!133398) (index!6972 lt!133097)) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133398)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!170761 () SeekEntryResult!1200)

(assert (=> d!63241 (= lt!133398 e!170761)))

(declare-fun c!44966 () Bool)

(assert (=> d!63241 (= c!44966 (bvsge (x!25242 lt!133097) #b01111111111111111111111111111110))))

(declare-fun lt!133399 () (_ BitVec 64))

(assert (=> d!63241 (= lt!133399 (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133097)))))

(assert (=> d!63241 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63241 (= (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133097) (index!6972 lt!133097) (index!6972 lt!133097) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) lt!133398)))

(declare-fun b!263507 () Bool)

(declare-fun e!170760 () SeekEntryResult!1200)

(assert (=> b!263507 (= e!170760 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25242 lt!133097) #b00000000000000000000000000000001) (nextIndex!0 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504)) (index!6972 lt!133097) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!263508 () Bool)

(assert (=> b!263508 (= e!170760 (MissingVacant!1200 (index!6972 lt!133097)))))

(declare-fun b!263509 () Bool)

(declare-fun c!44968 () Bool)

(assert (=> b!263509 (= c!44968 (= lt!133399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170759 () SeekEntryResult!1200)

(assert (=> b!263509 (= e!170759 e!170760)))

(declare-fun b!263510 () Bool)

(assert (=> b!263510 (= e!170761 e!170759)))

(declare-fun c!44967 () Bool)

(assert (=> b!263510 (= c!44967 (= lt!133399 key!932))))

(declare-fun b!263511 () Bool)

(assert (=> b!263511 (= e!170759 (Found!1200 (index!6972 lt!133097)))))

(declare-fun b!263512 () Bool)

(assert (=> b!263512 (= e!170761 Undefined!1200)))

(assert (= (and d!63241 c!44966) b!263512))

(assert (= (and d!63241 (not c!44966)) b!263510))

(assert (= (and b!263510 c!44967) b!263511))

(assert (= (and b!263510 (not c!44967)) b!263509))

(assert (= (and b!263509 c!44968) b!263508))

(assert (= (and b!263509 (not c!44968)) b!263507))

(declare-fun m!279703 () Bool)

(assert (=> d!63241 m!279703))

(declare-fun m!279705 () Bool)

(assert (=> d!63241 m!279705))

(assert (=> d!63241 m!279133))

(assert (=> d!63241 m!279139))

(declare-fun m!279707 () Bool)

(assert (=> b!263507 m!279707))

(assert (=> b!263507 m!279707))

(declare-fun m!279709 () Bool)

(assert (=> b!263507 m!279709))

(assert (=> b!263021 d!63241))

(declare-fun d!63243 () Bool)

(declare-fun e!170762 () Bool)

(assert (=> d!63243 e!170762))

(declare-fun res!128686 () Bool)

(assert (=> d!63243 (=> res!128686 e!170762)))

(declare-fun lt!133401 () Bool)

(assert (=> d!63243 (= res!128686 (not lt!133401))))

(declare-fun lt!133400 () Bool)

(assert (=> d!63243 (= lt!133401 lt!133400)))

(declare-fun lt!133402 () Unit!8190)

(declare-fun e!170763 () Unit!8190)

(assert (=> d!63243 (= lt!133402 e!170763)))

(declare-fun c!44969 () Bool)

(assert (=> d!63243 (= c!44969 lt!133400)))

(assert (=> d!63243 (= lt!133400 (containsKey!312 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63243 (= (contains!1912 lt!133256 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133401)))

(declare-fun b!263513 () Bool)

(declare-fun lt!133403 () Unit!8190)

(assert (=> b!263513 (= e!170763 lt!133403)))

(assert (=> b!263513 (= lt!133403 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263513 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263514 () Bool)

(declare-fun Unit!8211 () Unit!8190)

(assert (=> b!263514 (= e!170763 Unit!8211)))

(declare-fun b!263515 () Bool)

(assert (=> b!263515 (= e!170762 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63243 c!44969) b!263513))

(assert (= (and d!63243 (not c!44969)) b!263514))

(assert (= (and d!63243 (not res!128686)) b!263515))

(declare-fun m!279711 () Bool)

(assert (=> d!63243 m!279711))

(declare-fun m!279713 () Bool)

(assert (=> b!263513 m!279713))

(assert (=> b!263513 m!279607))

(assert (=> b!263513 m!279607))

(declare-fun m!279715 () Bool)

(assert (=> b!263513 m!279715))

(assert (=> b!263515 m!279607))

(assert (=> b!263515 m!279607))

(assert (=> b!263515 m!279715))

(assert (=> bm!25195 d!63243))

(declare-fun b!263518 () Bool)

(declare-fun e!170765 () Option!326)

(assert (=> b!263518 (= e!170765 (getValueByKey!320 (t!8929 (toList!1961 lt!133127)) (_1!2500 lt!133020)))))

(declare-fun b!263516 () Bool)

(declare-fun e!170764 () Option!326)

(assert (=> b!263516 (= e!170764 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133127)))))))

(declare-fun d!63245 () Bool)

(declare-fun c!44970 () Bool)

(assert (=> d!63245 (= c!44970 (and ((_ is Cons!3848) (toList!1961 lt!133127)) (= (_1!2500 (h!4514 (toList!1961 lt!133127))) (_1!2500 lt!133020))))))

(assert (=> d!63245 (= (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020)) e!170764)))

(declare-fun b!263519 () Bool)

(assert (=> b!263519 (= e!170765 None!324)))

(declare-fun b!263517 () Bool)

(assert (=> b!263517 (= e!170764 e!170765)))

(declare-fun c!44971 () Bool)

(assert (=> b!263517 (= c!44971 (and ((_ is Cons!3848) (toList!1961 lt!133127)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133127))) (_1!2500 lt!133020)))))))

(assert (= (and d!63245 c!44970) b!263516))

(assert (= (and d!63245 (not c!44970)) b!263517))

(assert (= (and b!263517 c!44971) b!263518))

(assert (= (and b!263517 (not c!44971)) b!263519))

(declare-fun m!279717 () Bool)

(assert (=> b!263518 m!279717))

(assert (=> b!263042 d!63245))

(declare-fun d!63247 () Bool)

(declare-fun e!170766 () Bool)

(assert (=> d!63247 e!170766))

(declare-fun res!128687 () Bool)

(assert (=> d!63247 (=> res!128687 e!170766)))

(declare-fun lt!133405 () Bool)

(assert (=> d!63247 (= res!128687 (not lt!133405))))

(declare-fun lt!133404 () Bool)

(assert (=> d!63247 (= lt!133405 lt!133404)))

(declare-fun lt!133406 () Unit!8190)

(declare-fun e!170767 () Unit!8190)

(assert (=> d!63247 (= lt!133406 e!170767)))

(declare-fun c!44972 () Bool)

(assert (=> d!63247 (= c!44972 lt!133404)))

(assert (=> d!63247 (= lt!133404 (containsKey!312 (toList!1961 lt!133265) (_1!2500 lt!133020)))))

(assert (=> d!63247 (= (contains!1912 lt!133265 (_1!2500 lt!133020)) lt!133405)))

(declare-fun b!263520 () Bool)

(declare-fun lt!133407 () Unit!8190)

(assert (=> b!263520 (= e!170767 lt!133407)))

(assert (=> b!263520 (= lt!133407 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133265) (_1!2500 lt!133020)))))

(assert (=> b!263520 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020)))))

(declare-fun b!263521 () Bool)

(declare-fun Unit!8212 () Unit!8190)

(assert (=> b!263521 (= e!170767 Unit!8212)))

(declare-fun b!263522 () Bool)

(assert (=> b!263522 (= e!170766 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020))))))

(assert (= (and d!63247 c!44972) b!263520))

(assert (= (and d!63247 (not c!44972)) b!263521))

(assert (= (and d!63247 (not res!128687)) b!263522))

(declare-fun m!279719 () Bool)

(assert (=> d!63247 m!279719))

(declare-fun m!279721 () Bool)

(assert (=> b!263520 m!279721))

(assert (=> b!263520 m!279389))

(assert (=> b!263520 m!279389))

(declare-fun m!279723 () Bool)

(assert (=> b!263520 m!279723))

(assert (=> b!263522 m!279389))

(assert (=> b!263522 m!279389))

(assert (=> b!263522 m!279723))

(assert (=> d!63131 d!63247))

(declare-fun b!263525 () Bool)

(declare-fun e!170769 () Option!326)

(assert (=> b!263525 (= e!170769 (getValueByKey!320 (t!8929 lt!133266) (_1!2500 lt!133020)))))

(declare-fun b!263523 () Bool)

(declare-fun e!170768 () Option!326)

(assert (=> b!263523 (= e!170768 (Some!325 (_2!2500 (h!4514 lt!133266))))))

(declare-fun d!63249 () Bool)

(declare-fun c!44973 () Bool)

(assert (=> d!63249 (= c!44973 (and ((_ is Cons!3848) lt!133266) (= (_1!2500 (h!4514 lt!133266)) (_1!2500 lt!133020))))))

(assert (=> d!63249 (= (getValueByKey!320 lt!133266 (_1!2500 lt!133020)) e!170768)))

(declare-fun b!263526 () Bool)

(assert (=> b!263526 (= e!170769 None!324)))

(declare-fun b!263524 () Bool)

(assert (=> b!263524 (= e!170768 e!170769)))

(declare-fun c!44974 () Bool)

(assert (=> b!263524 (= c!44974 (and ((_ is Cons!3848) lt!133266) (not (= (_1!2500 (h!4514 lt!133266)) (_1!2500 lt!133020)))))))

(assert (= (and d!63249 c!44973) b!263523))

(assert (= (and d!63249 (not c!44973)) b!263524))

(assert (= (and b!263524 c!44974) b!263525))

(assert (= (and b!263524 (not c!44974)) b!263526))

(declare-fun m!279725 () Bool)

(assert (=> b!263525 m!279725))

(assert (=> d!63131 d!63249))

(declare-fun d!63251 () Bool)

(assert (=> d!63251 (= (getValueByKey!320 lt!133266 (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020)))))

(declare-fun lt!133410 () Unit!8190)

(declare-fun choose!1294 (List!3852 (_ BitVec 64) V!8523) Unit!8190)

(assert (=> d!63251 (= lt!133410 (choose!1294 lt!133266 (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun e!170772 () Bool)

(assert (=> d!63251 e!170772))

(declare-fun res!128692 () Bool)

(assert (=> d!63251 (=> (not res!128692) (not e!170772))))

(assert (=> d!63251 (= res!128692 (isStrictlySorted!377 lt!133266))))

(assert (=> d!63251 (= (lemmaContainsTupThenGetReturnValue!176 lt!133266 (_1!2500 lt!133020) (_2!2500 lt!133020)) lt!133410)))

(declare-fun b!263531 () Bool)

(declare-fun res!128693 () Bool)

(assert (=> b!263531 (=> (not res!128693) (not e!170772))))

(assert (=> b!263531 (= res!128693 (containsKey!312 lt!133266 (_1!2500 lt!133020)))))

(declare-fun b!263532 () Bool)

(assert (=> b!263532 (= e!170772 (contains!1914 lt!133266 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(assert (= (and d!63251 res!128692) b!263531))

(assert (= (and b!263531 res!128693) b!263532))

(assert (=> d!63251 m!279383))

(declare-fun m!279727 () Bool)

(assert (=> d!63251 m!279727))

(declare-fun m!279729 () Bool)

(assert (=> d!63251 m!279729))

(declare-fun m!279731 () Bool)

(assert (=> b!263531 m!279731))

(declare-fun m!279733 () Bool)

(assert (=> b!263532 m!279733))

(assert (=> d!63131 d!63251))

(declare-fun bm!25226 () Bool)

(declare-fun call!25231 () List!3852)

(declare-fun call!25230 () List!3852)

(assert (=> bm!25226 (= call!25231 call!25230)))

(declare-fun bm!25227 () Bool)

(declare-fun call!25229 () List!3852)

(assert (=> bm!25227 (= call!25229 call!25231)))

(declare-fun b!263553 () Bool)

(declare-fun res!128698 () Bool)

(declare-fun e!170787 () Bool)

(assert (=> b!263553 (=> (not res!128698) (not e!170787))))

(declare-fun lt!133413 () List!3852)

(assert (=> b!263553 (= res!128698 (containsKey!312 lt!133413 (_1!2500 lt!133020)))))

(declare-fun b!263554 () Bool)

(declare-fun c!44983 () Bool)

(assert (=> b!263554 (= c!44983 (and ((_ is Cons!3848) (toList!1961 lt!133012)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133012))) (_1!2500 lt!133020))))))

(declare-fun e!170786 () List!3852)

(declare-fun e!170783 () List!3852)

(assert (=> b!263554 (= e!170786 e!170783)))

(declare-fun b!263555 () Bool)

(declare-fun e!170785 () List!3852)

(assert (=> b!263555 (= e!170785 e!170786)))

(declare-fun c!44986 () Bool)

(assert (=> b!263555 (= c!44986 (and ((_ is Cons!3848) (toList!1961 lt!133012)) (= (_1!2500 (h!4514 (toList!1961 lt!133012))) (_1!2500 lt!133020))))))

(declare-fun b!263556 () Bool)

(assert (=> b!263556 (= e!170787 (contains!1914 lt!133413 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!263557 () Bool)

(assert (=> b!263557 (= e!170785 call!25230)))

(declare-fun b!263558 () Bool)

(assert (=> b!263558 (= e!170786 call!25231)))

(declare-fun b!263559 () Bool)

(declare-fun e!170784 () List!3852)

(assert (=> b!263559 (= e!170784 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133012)) (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun b!263560 () Bool)

(assert (=> b!263560 (= e!170783 call!25229)))

(declare-fun bm!25228 () Bool)

(declare-fun c!44985 () Bool)

(declare-fun $colon$colon!108 (List!3852 tuple2!4978) List!3852)

(assert (=> bm!25228 (= call!25230 ($colon$colon!108 e!170784 (ite c!44985 (h!4514 (toList!1961 lt!133012)) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020)))))))

(declare-fun c!44984 () Bool)

(assert (=> bm!25228 (= c!44984 c!44985)))

(declare-fun d!63253 () Bool)

(assert (=> d!63253 e!170787))

(declare-fun res!128699 () Bool)

(assert (=> d!63253 (=> (not res!128699) (not e!170787))))

(assert (=> d!63253 (= res!128699 (isStrictlySorted!377 lt!133413))))

(assert (=> d!63253 (= lt!133413 e!170785)))

(assert (=> d!63253 (= c!44985 (and ((_ is Cons!3848) (toList!1961 lt!133012)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133012))) (_1!2500 lt!133020))))))

(assert (=> d!63253 (isStrictlySorted!377 (toList!1961 lt!133012))))

(assert (=> d!63253 (= (insertStrictlySorted!179 (toList!1961 lt!133012) (_1!2500 lt!133020) (_2!2500 lt!133020)) lt!133413)))

(declare-fun b!263561 () Bool)

(assert (=> b!263561 (= e!170783 call!25229)))

(declare-fun b!263562 () Bool)

(assert (=> b!263562 (= e!170784 (ite c!44986 (t!8929 (toList!1961 lt!133012)) (ite c!44983 (Cons!3848 (h!4514 (toList!1961 lt!133012)) (t!8929 (toList!1961 lt!133012))) Nil!3849)))))

(assert (= (and d!63253 c!44985) b!263557))

(assert (= (and d!63253 (not c!44985)) b!263555))

(assert (= (and b!263555 c!44986) b!263558))

(assert (= (and b!263555 (not c!44986)) b!263554))

(assert (= (and b!263554 c!44983) b!263561))

(assert (= (and b!263554 (not c!44983)) b!263560))

(assert (= (or b!263561 b!263560) bm!25227))

(assert (= (or b!263558 bm!25227) bm!25226))

(assert (= (or b!263557 bm!25226) bm!25228))

(assert (= (and bm!25228 c!44984) b!263559))

(assert (= (and bm!25228 (not c!44984)) b!263562))

(assert (= (and d!63253 res!128699) b!263553))

(assert (= (and b!263553 res!128698) b!263556))

(declare-fun m!279735 () Bool)

(assert (=> bm!25228 m!279735))

(declare-fun m!279737 () Bool)

(assert (=> b!263559 m!279737))

(declare-fun m!279739 () Bool)

(assert (=> b!263556 m!279739))

(declare-fun m!279741 () Bool)

(assert (=> b!263553 m!279741))

(declare-fun m!279743 () Bool)

(assert (=> d!63253 m!279743))

(assert (=> d!63253 m!279485))

(assert (=> d!63131 d!63253))

(declare-fun d!63255 () Bool)

(assert (=> d!63255 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263157 d!63255))

(declare-fun d!63257 () Bool)

(declare-fun e!170788 () Bool)

(assert (=> d!63257 e!170788))

(declare-fun res!128700 () Bool)

(assert (=> d!63257 (=> (not res!128700) (not e!170788))))

(declare-fun lt!133416 () ListLongMap!3891)

(assert (=> d!63257 (= res!128700 (contains!1912 lt!133416 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun lt!133417 () List!3852)

(assert (=> d!63257 (= lt!133416 (ListLongMap!3892 lt!133417))))

(declare-fun lt!133415 () Unit!8190)

(declare-fun lt!133414 () Unit!8190)

(assert (=> d!63257 (= lt!133415 lt!133414)))

(assert (=> d!63257 (= (getValueByKey!320 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63257 (= lt!133414 (lemmaContainsTupThenGetReturnValue!176 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63257 (= lt!133417 (insertStrictlySorted!179 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63257 (= (+!710 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133416)))

(declare-fun b!263563 () Bool)

(declare-fun res!128701 () Bool)

(assert (=> b!263563 (=> (not res!128701) (not e!170788))))

(assert (=> b!263563 (= res!128701 (= (getValueByKey!320 (toList!1961 lt!133416) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!263564 () Bool)

(assert (=> b!263564 (= e!170788 (contains!1914 (toList!1961 lt!133416) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (= (and d!63257 res!128700) b!263563))

(assert (= (and b!263563 res!128701) b!263564))

(declare-fun m!279745 () Bool)

(assert (=> d!63257 m!279745))

(declare-fun m!279747 () Bool)

(assert (=> d!63257 m!279747))

(declare-fun m!279749 () Bool)

(assert (=> d!63257 m!279749))

(declare-fun m!279751 () Bool)

(assert (=> d!63257 m!279751))

(declare-fun m!279753 () Bool)

(assert (=> b!263563 m!279753))

(declare-fun m!279755 () Bool)

(assert (=> b!263564 m!279755))

(assert (=> bm!25176 d!63257))

(assert (=> b!263246 d!63189))

(declare-fun d!63259 () Bool)

(declare-fun res!128710 () Bool)

(declare-fun e!170791 () Bool)

(assert (=> d!63259 (=> (not res!128710) (not e!170791))))

(assert (=> d!63259 (= res!128710 (validMask!0 (mask!11209 lt!133015)))))

(assert (=> d!63259 (= (simpleValid!285 lt!133015) e!170791)))

(declare-fun b!263575 () Bool)

(declare-fun res!128711 () Bool)

(assert (=> b!263575 (=> (not res!128711) (not e!170791))))

(declare-fun size!6353 (LongMapFixedSize!3870) (_ BitVec 32))

(assert (=> b!263575 (= res!128711 (= (size!6353 lt!133015) (bvadd (_size!1984 lt!133015) (bvsdiv (bvadd (extraKeys!4580 lt!133015) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!263573 () Bool)

(declare-fun res!128712 () Bool)

(assert (=> b!263573 (=> (not res!128712) (not e!170791))))

(assert (=> b!263573 (= res!128712 (and (= (size!6349 (_values!4826 lt!133015)) (bvadd (mask!11209 lt!133015) #b00000000000000000000000000000001)) (= (size!6350 (_keys!7035 lt!133015)) (size!6349 (_values!4826 lt!133015))) (bvsge (_size!1984 lt!133015) #b00000000000000000000000000000000) (bvsle (_size!1984 lt!133015) (bvadd (mask!11209 lt!133015) #b00000000000000000000000000000001))))))

(declare-fun b!263576 () Bool)

(assert (=> b!263576 (= e!170791 (and (bvsge (extraKeys!4580 lt!133015) #b00000000000000000000000000000000) (bvsle (extraKeys!4580 lt!133015) #b00000000000000000000000000000011) (bvsge (_vacant!1984 lt!133015) #b00000000000000000000000000000000)))))

(declare-fun b!263574 () Bool)

(declare-fun res!128713 () Bool)

(assert (=> b!263574 (=> (not res!128713) (not e!170791))))

(assert (=> b!263574 (= res!128713 (bvsge (size!6353 lt!133015) (_size!1984 lt!133015)))))

(assert (= (and d!63259 res!128710) b!263573))

(assert (= (and b!263573 res!128712) b!263574))

(assert (= (and b!263574 res!128713) b!263575))

(assert (= (and b!263575 res!128711) b!263576))

(declare-fun m!279757 () Bool)

(assert (=> d!63259 m!279757))

(declare-fun m!279759 () Bool)

(assert (=> b!263575 m!279759))

(assert (=> b!263574 m!279759))

(assert (=> d!63115 d!63259))

(declare-fun d!63261 () Bool)

(assert (=> d!63261 (= (apply!262 lt!133256 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (get!3094 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(declare-fun bs!9259 () Bool)

(assert (= bs!9259 d!63261))

(assert (=> bs!9259 m!279255))

(assert (=> bs!9259 m!279423))

(assert (=> bs!9259 m!279423))

(declare-fun m!279761 () Bool)

(assert (=> bs!9259 m!279761))

(assert (=> b!263231 d!63261))

(declare-fun d!63263 () Bool)

(declare-fun c!44987 () Bool)

(assert (=> d!63263 (= c!44987 ((_ is ValueCellFull!2985) (select (arr!5998 lt!133023) #b00000000000000000000000000000000)))))

(declare-fun e!170792 () V!8523)

(assert (=> d!63263 (= (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170792)))

(declare-fun b!263577 () Bool)

(assert (=> b!263577 (= e!170792 (get!3095 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263578 () Bool)

(assert (=> b!263578 (= e!170792 (get!3096 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63263 c!44987) b!263577))

(assert (= (and d!63263 (not c!44987)) b!263578))

(assert (=> b!263577 m!279377))

(assert (=> b!263577 m!279251))

(declare-fun m!279763 () Bool)

(assert (=> b!263577 m!279763))

(assert (=> b!263578 m!279377))

(assert (=> b!263578 m!279251))

(declare-fun m!279765 () Bool)

(assert (=> b!263578 m!279765))

(assert (=> b!263231 d!63263))

(declare-fun b!263579 () Bool)

(declare-fun e!170793 () Bool)

(assert (=> b!263579 (= e!170793 (contains!1915 Nil!3850 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263581 () Bool)

(declare-fun e!170796 () Bool)

(declare-fun call!25232 () Bool)

(assert (=> b!263581 (= e!170796 call!25232)))

(declare-fun b!263582 () Bool)

(declare-fun e!170794 () Bool)

(assert (=> b!263582 (= e!170794 e!170796)))

(declare-fun c!44988 () Bool)

(assert (=> b!263582 (= c!44988 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263580 () Bool)

(declare-fun e!170795 () Bool)

(assert (=> b!263580 (= e!170795 e!170794)))

(declare-fun res!128715 () Bool)

(assert (=> b!263580 (=> (not res!128715) (not e!170794))))

(assert (=> b!263580 (= res!128715 (not e!170793))))

(declare-fun res!128716 () Bool)

(assert (=> b!263580 (=> (not res!128716) (not e!170793))))

(assert (=> b!263580 (= res!128716 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!63265 () Bool)

(declare-fun res!128714 () Bool)

(assert (=> d!63265 (=> res!128714 e!170795)))

(assert (=> d!63265 (= res!128714 (bvsge #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!63265 (= (arrayNoDuplicates!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000000 Nil!3850) e!170795)))

(declare-fun bm!25229 () Bool)

(assert (=> bm!25229 (= call!25232 (arrayNoDuplicates!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44988 (Cons!3849 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) Nil!3850) Nil!3850)))))

(declare-fun b!263583 () Bool)

(assert (=> b!263583 (= e!170796 call!25232)))

(assert (= (and d!63265 (not res!128714)) b!263580))

(assert (= (and b!263580 res!128716) b!263579))

(assert (= (and b!263580 res!128715) b!263582))

(assert (= (and b!263582 c!44988) b!263581))

(assert (= (and b!263582 (not c!44988)) b!263583))

(assert (= (or b!263581 b!263583) bm!25229))

(assert (=> b!263579 m!279647))

(assert (=> b!263579 m!279647))

(declare-fun m!279767 () Bool)

(assert (=> b!263579 m!279767))

(assert (=> b!263582 m!279647))

(assert (=> b!263582 m!279647))

(assert (=> b!263582 m!279649))

(assert (=> b!263580 m!279647))

(assert (=> b!263580 m!279647))

(assert (=> b!263580 m!279649))

(assert (=> bm!25229 m!279647))

(declare-fun m!279769 () Bool)

(assert (=> bm!25229 m!279769))

(assert (=> b!263255 d!63265))

(declare-fun d!63267 () Bool)

(declare-fun e!170797 () Bool)

(assert (=> d!63267 e!170797))

(declare-fun res!128717 () Bool)

(assert (=> d!63267 (=> (not res!128717) (not e!170797))))

(declare-fun lt!133420 () ListLongMap!3891)

(assert (=> d!63267 (= res!128717 (contains!1912 lt!133420 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133421 () List!3852)

(assert (=> d!63267 (= lt!133420 (ListLongMap!3892 lt!133421))))

(declare-fun lt!133419 () Unit!8190)

(declare-fun lt!133418 () Unit!8190)

(assert (=> d!63267 (= lt!133419 lt!133418)))

(assert (=> d!63267 (= (getValueByKey!320 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63267 (= lt!133418 (lemmaContainsTupThenGetReturnValue!176 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63267 (= lt!133421 (insertStrictlySorted!179 (toList!1961 call!25199) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63267 (= (+!710 call!25199 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) lt!133420)))

(declare-fun b!263584 () Bool)

(declare-fun res!128718 () Bool)

(assert (=> b!263584 (=> (not res!128718) (not e!170797))))

(assert (=> b!263584 (= res!128718 (= (getValueByKey!320 (toList!1961 lt!133420) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!263585 () Bool)

(assert (=> b!263585 (= e!170797 (contains!1914 (toList!1961 lt!133420) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(assert (= (and d!63267 res!128717) b!263584))

(assert (= (and b!263584 res!128718) b!263585))

(declare-fun m!279771 () Bool)

(assert (=> d!63267 m!279771))

(declare-fun m!279773 () Bool)

(assert (=> d!63267 m!279773))

(declare-fun m!279775 () Bool)

(assert (=> d!63267 m!279775))

(declare-fun m!279777 () Bool)

(assert (=> d!63267 m!279777))

(declare-fun m!279779 () Bool)

(assert (=> b!263584 m!279779))

(declare-fun m!279781 () Bool)

(assert (=> b!263585 m!279781))

(assert (=> b!263239 d!63267))

(declare-fun b!263586 () Bool)

(declare-fun e!170798 () (_ BitVec 32))

(assert (=> b!263586 (= e!170798 #b00000000000000000000000000000000)))

(declare-fun b!263588 () Bool)

(declare-fun e!170799 () (_ BitVec 32))

(assert (=> b!263588 (= e!170798 e!170799)))

(declare-fun c!44990 () Bool)

(assert (=> b!263588 (= c!44990 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263589 () Bool)

(declare-fun call!25233 () (_ BitVec 32))

(assert (=> b!263589 (= e!170799 call!25233)))

(declare-fun bm!25230 () Bool)

(assert (=> bm!25230 (= call!25233 (arrayCountValidKeys!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63269 () Bool)

(declare-fun lt!133422 () (_ BitVec 32))

(assert (=> d!63269 (and (bvsge lt!133422 #b00000000000000000000000000000000) (bvsle lt!133422 (bvsub (size!6350 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63269 (= lt!133422 e!170798)))

(declare-fun c!44989 () Bool)

(assert (=> d!63269 (= c!44989 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63269 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63269 (= (arrayCountValidKeys!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) lt!133422)))

(declare-fun b!263587 () Bool)

(assert (=> b!263587 (= e!170799 (bvadd #b00000000000000000000000000000001 call!25233))))

(assert (= (and d!63269 c!44989) b!263586))

(assert (= (and d!63269 (not c!44989)) b!263588))

(assert (= (and b!263588 c!44990) b!263587))

(assert (= (and b!263588 (not c!44990)) b!263589))

(assert (= (or b!263587 b!263589) bm!25230))

(assert (=> b!263588 m!279597))

(assert (=> b!263588 m!279597))

(declare-fun m!279783 () Bool)

(assert (=> b!263588 m!279783))

(declare-fun m!279785 () Bool)

(assert (=> bm!25230 m!279785))

(assert (=> bm!25188 d!63269))

(declare-fun d!63271 () Bool)

(assert (=> d!63271 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133009) key!932))))

(declare-fun lt!133423 () Unit!8190)

(assert (=> d!63271 (= lt!133423 (choose!1293 (toList!1961 lt!133009) key!932))))

(declare-fun e!170800 () Bool)

(assert (=> d!63271 e!170800))

(declare-fun res!128719 () Bool)

(assert (=> d!63271 (=> (not res!128719) (not e!170800))))

(assert (=> d!63271 (= res!128719 (isStrictlySorted!377 (toList!1961 lt!133009)))))

(assert (=> d!63271 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133009) key!932) lt!133423)))

(declare-fun b!263590 () Bool)

(assert (=> b!263590 (= e!170800 (containsKey!312 (toList!1961 lt!133009) key!932))))

(assert (= (and d!63271 res!128719) b!263590))

(assert (=> d!63271 m!279159))

(assert (=> d!63271 m!279159))

(assert (=> d!63271 m!279161))

(declare-fun m!279787 () Bool)

(assert (=> d!63271 m!279787))

(declare-fun m!279789 () Bool)

(assert (=> d!63271 m!279789))

(assert (=> b!263590 m!279155))

(assert (=> b!263035 d!63271))

(declare-fun d!63273 () Bool)

(assert (=> d!63273 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133009) key!932)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133009) key!932))))))

(declare-fun bs!9260 () Bool)

(assert (= bs!9260 d!63273))

(assert (=> bs!9260 m!279159))

(declare-fun m!279791 () Bool)

(assert (=> bs!9260 m!279791))

(assert (=> b!263035 d!63273))

(declare-fun b!263593 () Bool)

(declare-fun e!170802 () Option!326)

(assert (=> b!263593 (= e!170802 (getValueByKey!320 (t!8929 (toList!1961 lt!133009)) key!932))))

(declare-fun b!263591 () Bool)

(declare-fun e!170801 () Option!326)

(assert (=> b!263591 (= e!170801 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133009)))))))

(declare-fun d!63275 () Bool)

(declare-fun c!44991 () Bool)

(assert (=> d!63275 (= c!44991 (and ((_ is Cons!3848) (toList!1961 lt!133009)) (= (_1!2500 (h!4514 (toList!1961 lt!133009))) key!932)))))

(assert (=> d!63275 (= (getValueByKey!320 (toList!1961 lt!133009) key!932) e!170801)))

(declare-fun b!263594 () Bool)

(assert (=> b!263594 (= e!170802 None!324)))

(declare-fun b!263592 () Bool)

(assert (=> b!263592 (= e!170801 e!170802)))

(declare-fun c!44992 () Bool)

(assert (=> b!263592 (= c!44992 (and ((_ is Cons!3848) (toList!1961 lt!133009)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133009))) key!932))))))

(assert (= (and d!63275 c!44991) b!263591))

(assert (= (and d!63275 (not c!44991)) b!263592))

(assert (= (and b!263592 c!44992) b!263593))

(assert (= (and b!263592 (not c!44992)) b!263594))

(declare-fun m!279793 () Bool)

(assert (=> b!263593 m!279793))

(assert (=> b!263035 d!63275))

(declare-fun d!63277 () Bool)

(assert (=> d!63277 (= (validKeyInArray!0 (select (arr!5999 lt!133026) index!297)) (and (not (= (select (arr!5999 lt!133026) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 lt!133026) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263213 d!63277))

(assert (=> b!263183 d!63189))

(assert (=> d!63089 d!63099))

(declare-fun b!263595 () Bool)

(declare-fun e!170803 () (_ BitVec 32))

(assert (=> b!263595 (= e!170803 #b00000000000000000000000000000000)))

(declare-fun b!263597 () Bool)

(declare-fun e!170804 () (_ BitVec 32))

(assert (=> b!263597 (= e!170803 e!170804)))

(declare-fun c!44994 () Bool)

(assert (=> b!263597 (= c!44994 (validKeyInArray!0 (select (arr!5999 lt!133026) index!297)))))

(declare-fun b!263598 () Bool)

(declare-fun call!25234 () (_ BitVec 32))

(assert (=> b!263598 (= e!170804 call!25234)))

(declare-fun bm!25231 () Bool)

(assert (=> bm!25231 (= call!25234 (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun d!63279 () Bool)

(declare-fun lt!133424 () (_ BitVec 32))

(assert (=> d!63279 (and (bvsge lt!133424 #b00000000000000000000000000000000) (bvsle lt!133424 (bvsub (size!6350 lt!133026) index!297)))))

(assert (=> d!63279 (= lt!133424 e!170803)))

(declare-fun c!44993 () Bool)

(assert (=> d!63279 (= c!44993 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!63279 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!63279 (= (arrayCountValidKeys!0 lt!133026 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!133424)))

(declare-fun b!263596 () Bool)

(assert (=> b!263596 (= e!170804 (bvadd #b00000000000000000000000000000001 call!25234))))

(assert (= (and d!63279 c!44993) b!263595))

(assert (= (and d!63279 (not c!44993)) b!263597))

(assert (= (and b!263597 c!44994) b!263596))

(assert (= (and b!263597 (not c!44994)) b!263598))

(assert (= (or b!263596 b!263598) bm!25231))

(assert (=> b!263597 m!279307))

(assert (=> b!263597 m!279307))

(assert (=> b!263597 m!279309))

(declare-fun m!279795 () Bool)

(assert (=> bm!25231 m!279795))

(assert (=> d!63117 d!63279))

(declare-fun d!63281 () Bool)

(assert (=> d!63281 (= (arrayCountValidKeys!0 lt!133026 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!63281 true))

(declare-fun _$85!33 () Unit!8190)

(assert (=> d!63281 (= (choose!2 lt!133026 index!297) _$85!33)))

(declare-fun bs!9261 () Bool)

(assert (= bs!9261 d!63281))

(assert (=> bs!9261 m!279303))

(assert (=> d!63117 d!63281))

(declare-fun b!263599 () Bool)

(declare-fun e!170805 () Bool)

(assert (=> b!263599 (= e!170805 (contains!1915 Nil!3850 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263601 () Bool)

(declare-fun e!170808 () Bool)

(declare-fun call!25235 () Bool)

(assert (=> b!263601 (= e!170808 call!25235)))

(declare-fun b!263602 () Bool)

(declare-fun e!170806 () Bool)

(assert (=> b!263602 (= e!170806 e!170808)))

(declare-fun c!44995 () Bool)

(assert (=> b!263602 (= c!44995 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263600 () Bool)

(declare-fun e!170807 () Bool)

(assert (=> b!263600 (= e!170807 e!170806)))

(declare-fun res!128721 () Bool)

(assert (=> b!263600 (=> (not res!128721) (not e!170806))))

(assert (=> b!263600 (= res!128721 (not e!170805))))

(declare-fun res!128722 () Bool)

(assert (=> b!263600 (=> (not res!128722) (not e!170805))))

(assert (=> b!263600 (= res!128722 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63283 () Bool)

(declare-fun res!128720 () Bool)

(assert (=> d!63283 (=> res!128720 e!170807)))

(assert (=> d!63283 (= res!128720 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63283 (= (arrayNoDuplicates!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 Nil!3850) e!170807)))

(declare-fun bm!25232 () Bool)

(assert (=> bm!25232 (= call!25235 (arrayNoDuplicates!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44995 (Cons!3849 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) Nil!3850) Nil!3850)))))

(declare-fun b!263603 () Bool)

(assert (=> b!263603 (= e!170808 call!25235)))

(assert (= (and d!63283 (not res!128720)) b!263600))

(assert (= (and b!263600 res!128722) b!263599))

(assert (= (and b!263600 res!128721) b!263602))

(assert (= (and b!263602 c!44995) b!263601))

(assert (= (and b!263602 (not c!44995)) b!263603))

(assert (= (or b!263601 b!263603) bm!25232))

(assert (=> b!263599 m!279199))

(assert (=> b!263599 m!279199))

(declare-fun m!279797 () Bool)

(assert (=> b!263599 m!279797))

(assert (=> b!263602 m!279199))

(assert (=> b!263602 m!279199))

(assert (=> b!263602 m!279201))

(assert (=> b!263600 m!279199))

(assert (=> b!263600 m!279199))

(assert (=> b!263600 m!279201))

(assert (=> bm!25232 m!279199))

(declare-fun m!279799 () Bool)

(assert (=> bm!25232 m!279799))

(assert (=> b!263258 d!63283))

(declare-fun d!63285 () Bool)

(assert (=> d!63285 (= (apply!262 lt!133256 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9262 () Bool)

(assert (= bs!9262 d!63285))

(assert (=> bs!9262 m!279545))

(assert (=> bs!9262 m!279545))

(declare-fun m!279801 () Bool)

(assert (=> bs!9262 m!279801))

(assert (=> b!263240 d!63285))

(declare-fun d!63287 () Bool)

(assert (=> d!63287 (arrayNoDuplicates!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000000 Nil!3850)))

(assert (=> d!63287 true))

(declare-fun _$65!98 () Unit!8190)

(assert (=> d!63287 (= (choose!41 (_keys!7035 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3850) _$65!98)))

(declare-fun bs!9263 () Bool)

(assert (= bs!9263 d!63287))

(assert (=> bs!9263 m!279017))

(assert (=> bs!9263 m!279397))

(assert (=> d!63135 d!63287))

(assert (=> b!263037 d!63273))

(assert (=> b!263037 d!63275))

(assert (=> b!263185 d!63189))

(declare-fun d!63289 () Bool)

(assert (=> d!63289 (= (apply!262 lt!133199 lt!133190) (get!3094 (getValueByKey!320 (toList!1961 lt!133199) lt!133190)))))

(declare-fun bs!9264 () Bool)

(assert (= bs!9264 d!63289))

(declare-fun m!279803 () Bool)

(assert (=> bs!9264 m!279803))

(assert (=> bs!9264 m!279803))

(declare-fun m!279805 () Bool)

(assert (=> bs!9264 m!279805))

(assert (=> b!263120 d!63289))

(declare-fun d!63291 () Bool)

(assert (=> d!63291 (= (apply!262 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) lt!133198) (apply!262 lt!133193 lt!133198))))

(declare-fun lt!133427 () Unit!8190)

(declare-fun choose!1295 (ListLongMap!3891 (_ BitVec 64) V!8523 (_ BitVec 64)) Unit!8190)

(assert (=> d!63291 (= lt!133427 (choose!1295 lt!133193 lt!133194 (zeroValue!4684 thiss!1504) lt!133198))))

(declare-fun e!170811 () Bool)

(assert (=> d!63291 e!170811))

(declare-fun res!128725 () Bool)

(assert (=> d!63291 (=> (not res!128725) (not e!170811))))

(assert (=> d!63291 (= res!128725 (contains!1912 lt!133193 lt!133198))))

(assert (=> d!63291 (= (addApplyDifferent!238 lt!133193 lt!133194 (zeroValue!4684 thiss!1504) lt!133198) lt!133427)))

(declare-fun b!263607 () Bool)

(assert (=> b!263607 (= e!170811 (not (= lt!133198 lt!133194)))))

(assert (= (and d!63291 res!128725) b!263607))

(assert (=> d!63291 m!279243))

(assert (=> d!63291 m!279223))

(assert (=> d!63291 m!279223))

(assert (=> d!63291 m!279227))

(declare-fun m!279807 () Bool)

(assert (=> d!63291 m!279807))

(declare-fun m!279809 () Bool)

(assert (=> d!63291 m!279809))

(assert (=> b!263120 d!63291))

(declare-fun d!63293 () Bool)

(assert (=> d!63293 (= (apply!262 lt!133203 lt!133186) (get!3094 (getValueByKey!320 (toList!1961 lt!133203) lt!133186)))))

(declare-fun bs!9265 () Bool)

(assert (= bs!9265 d!63293))

(declare-fun m!279811 () Bool)

(assert (=> bs!9265 m!279811))

(assert (=> bs!9265 m!279811))

(declare-fun m!279813 () Bool)

(assert (=> bs!9265 m!279813))

(assert (=> b!263120 d!63293))

(declare-fun d!63295 () Bool)

(assert (=> d!63295 (= (apply!262 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) lt!133186) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133186)))))

(declare-fun bs!9266 () Bool)

(assert (= bs!9266 d!63295))

(declare-fun m!279815 () Bool)

(assert (=> bs!9266 m!279815))

(assert (=> bs!9266 m!279815))

(declare-fun m!279817 () Bool)

(assert (=> bs!9266 m!279817))

(assert (=> b!263120 d!63295))

(declare-fun d!63297 () Bool)

(declare-fun e!170812 () Bool)

(assert (=> d!63297 e!170812))

(declare-fun res!128726 () Bool)

(assert (=> d!63297 (=> res!128726 e!170812)))

(declare-fun lt!133429 () Bool)

(assert (=> d!63297 (= res!128726 (not lt!133429))))

(declare-fun lt!133428 () Bool)

(assert (=> d!63297 (= lt!133429 lt!133428)))

(declare-fun lt!133430 () Unit!8190)

(declare-fun e!170813 () Unit!8190)

(assert (=> d!63297 (= lt!133430 e!170813)))

(declare-fun c!44996 () Bool)

(assert (=> d!63297 (= c!44996 lt!133428)))

(assert (=> d!63297 (= lt!133428 (containsKey!312 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))

(assert (=> d!63297 (= (contains!1912 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) lt!133200) lt!133429)))

(declare-fun b!263608 () Bool)

(declare-fun lt!133431 () Unit!8190)

(assert (=> b!263608 (= e!170813 lt!133431)))

(assert (=> b!263608 (= lt!133431 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))

(assert (=> b!263608 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))

(declare-fun b!263609 () Bool)

(declare-fun Unit!8213 () Unit!8190)

(assert (=> b!263609 (= e!170813 Unit!8213)))

(declare-fun b!263610 () Bool)

(assert (=> b!263610 (= e!170812 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200)))))

(assert (= (and d!63297 c!44996) b!263608))

(assert (= (and d!63297 (not c!44996)) b!263609))

(assert (= (and d!63297 (not res!128726)) b!263610))

(declare-fun m!279819 () Bool)

(assert (=> d!63297 m!279819))

(declare-fun m!279821 () Bool)

(assert (=> b!263608 m!279821))

(declare-fun m!279823 () Bool)

(assert (=> b!263608 m!279823))

(assert (=> b!263608 m!279823))

(declare-fun m!279825 () Bool)

(assert (=> b!263608 m!279825))

(assert (=> b!263610 m!279823))

(assert (=> b!263610 m!279823))

(assert (=> b!263610 m!279825))

(assert (=> b!263120 d!63297))

(declare-fun d!63299 () Bool)

(assert (=> d!63299 (= (apply!262 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) lt!133190) (apply!262 lt!133199 lt!133190))))

(declare-fun lt!133432 () Unit!8190)

(assert (=> d!63299 (= lt!133432 (choose!1295 lt!133199 lt!133188 (minValue!4684 thiss!1504) lt!133190))))

(declare-fun e!170814 () Bool)

(assert (=> d!63299 e!170814))

(declare-fun res!128727 () Bool)

(assert (=> d!63299 (=> (not res!128727) (not e!170814))))

(assert (=> d!63299 (= res!128727 (contains!1912 lt!133199 lt!133190))))

(assert (=> d!63299 (= (addApplyDifferent!238 lt!133199 lt!133188 (minValue!4684 thiss!1504) lt!133190) lt!133432)))

(declare-fun b!263611 () Bool)

(assert (=> b!263611 (= e!170814 (not (= lt!133190 lt!133188)))))

(assert (= (and d!63299 res!128727) b!263611))

(assert (=> d!63299 m!279241))

(assert (=> d!63299 m!279235))

(assert (=> d!63299 m!279235))

(assert (=> d!63299 m!279239))

(declare-fun m!279827 () Bool)

(assert (=> d!63299 m!279827))

(declare-fun m!279829 () Bool)

(assert (=> d!63299 m!279829))

(assert (=> b!263120 d!63299))

(assert (=> b!263120 d!63207))

(declare-fun d!63301 () Bool)

(declare-fun e!170815 () Bool)

(assert (=> d!63301 e!170815))

(declare-fun res!128728 () Bool)

(assert (=> d!63301 (=> (not res!128728) (not e!170815))))

(declare-fun lt!133435 () ListLongMap!3891)

(assert (=> d!63301 (= res!128728 (contains!1912 lt!133435 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133436 () List!3852)

(assert (=> d!63301 (= lt!133435 (ListLongMap!3892 lt!133436))))

(declare-fun lt!133434 () Unit!8190)

(declare-fun lt!133433 () Unit!8190)

(assert (=> d!63301 (= lt!133434 lt!133433)))

(assert (=> d!63301 (= (getValueByKey!320 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63301 (= lt!133433 (lemmaContainsTupThenGetReturnValue!176 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63301 (= lt!133436 (insertStrictlySorted!179 (toList!1961 lt!133193) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63301 (= (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) lt!133435)))

(declare-fun b!263612 () Bool)

(declare-fun res!128729 () Bool)

(assert (=> b!263612 (=> (not res!128729) (not e!170815))))

(assert (=> b!263612 (= res!128729 (= (getValueByKey!320 (toList!1961 lt!133435) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263613 () Bool)

(assert (=> b!263613 (= e!170815 (contains!1914 (toList!1961 lt!133435) (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63301 res!128728) b!263612))

(assert (= (and b!263612 res!128729) b!263613))

(declare-fun m!279831 () Bool)

(assert (=> d!63301 m!279831))

(declare-fun m!279833 () Bool)

(assert (=> d!63301 m!279833))

(declare-fun m!279835 () Bool)

(assert (=> d!63301 m!279835))

(declare-fun m!279837 () Bool)

(assert (=> d!63301 m!279837))

(declare-fun m!279839 () Bool)

(assert (=> b!263612 m!279839))

(declare-fun m!279841 () Bool)

(assert (=> b!263613 m!279841))

(assert (=> b!263120 d!63301))

(declare-fun d!63303 () Bool)

(assert (=> d!63303 (= (apply!262 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) lt!133198) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133198)))))

(declare-fun bs!9267 () Bool)

(assert (= bs!9267 d!63303))

(declare-fun m!279843 () Bool)

(assert (=> bs!9267 m!279843))

(assert (=> bs!9267 m!279843))

(declare-fun m!279845 () Bool)

(assert (=> bs!9267 m!279845))

(assert (=> b!263120 d!63303))

(declare-fun d!63305 () Bool)

(declare-fun e!170816 () Bool)

(assert (=> d!63305 e!170816))

(declare-fun res!128730 () Bool)

(assert (=> d!63305 (=> (not res!128730) (not e!170816))))

(declare-fun lt!133439 () ListLongMap!3891)

(assert (=> d!63305 (= res!128730 (contains!1912 lt!133439 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133440 () List!3852)

(assert (=> d!63305 (= lt!133439 (ListLongMap!3892 lt!133440))))

(declare-fun lt!133438 () Unit!8190)

(declare-fun lt!133437 () Unit!8190)

(assert (=> d!63305 (= lt!133438 lt!133437)))

(assert (=> d!63305 (= (getValueByKey!320 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(assert (=> d!63305 (= lt!133437 (lemmaContainsTupThenGetReturnValue!176 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(assert (=> d!63305 (= lt!133440 (insertStrictlySorted!179 (toList!1961 lt!133203) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(assert (=> d!63305 (= (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) lt!133439)))

(declare-fun b!263614 () Bool)

(declare-fun res!128731 () Bool)

(assert (=> b!263614 (=> (not res!128731) (not e!170816))))

(assert (=> b!263614 (= res!128731 (= (getValueByKey!320 (toList!1961 lt!133439) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(declare-fun b!263615 () Bool)

(assert (=> b!263615 (= e!170816 (contains!1914 (toList!1961 lt!133439) (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))

(assert (= (and d!63305 res!128730) b!263614))

(assert (= (and b!263614 res!128731) b!263615))

(declare-fun m!279847 () Bool)

(assert (=> d!63305 m!279847))

(declare-fun m!279849 () Bool)

(assert (=> d!63305 m!279849))

(declare-fun m!279851 () Bool)

(assert (=> d!63305 m!279851))

(declare-fun m!279853 () Bool)

(assert (=> d!63305 m!279853))

(declare-fun m!279855 () Bool)

(assert (=> b!263614 m!279855))

(declare-fun m!279857 () Bool)

(assert (=> b!263615 m!279857))

(assert (=> b!263120 d!63305))

(declare-fun d!63307 () Bool)

(assert (=> d!63307 (= (apply!262 lt!133193 lt!133198) (get!3094 (getValueByKey!320 (toList!1961 lt!133193) lt!133198)))))

(declare-fun bs!9268 () Bool)

(assert (= bs!9268 d!63307))

(declare-fun m!279859 () Bool)

(assert (=> bs!9268 m!279859))

(assert (=> bs!9268 m!279859))

(declare-fun m!279861 () Bool)

(assert (=> bs!9268 m!279861))

(assert (=> b!263120 d!63307))

(declare-fun d!63309 () Bool)

(assert (=> d!63309 (= (apply!262 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) lt!133190) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133190)))))

(declare-fun bs!9269 () Bool)

(assert (= bs!9269 d!63309))

(declare-fun m!279863 () Bool)

(assert (=> bs!9269 m!279863))

(assert (=> bs!9269 m!279863))

(declare-fun m!279865 () Bool)

(assert (=> bs!9269 m!279865))

(assert (=> b!263120 d!63309))

(declare-fun d!63311 () Bool)

(declare-fun e!170817 () Bool)

(assert (=> d!63311 e!170817))

(declare-fun res!128732 () Bool)

(assert (=> d!63311 (=> (not res!128732) (not e!170817))))

(declare-fun lt!133443 () ListLongMap!3891)

(assert (=> d!63311 (= res!128732 (contains!1912 lt!133443 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133444 () List!3852)

(assert (=> d!63311 (= lt!133443 (ListLongMap!3892 lt!133444))))

(declare-fun lt!133442 () Unit!8190)

(declare-fun lt!133441 () Unit!8190)

(assert (=> d!63311 (= lt!133442 lt!133441)))

(assert (=> d!63311 (= (getValueByKey!320 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(assert (=> d!63311 (= lt!133441 (lemmaContainsTupThenGetReturnValue!176 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(assert (=> d!63311 (= lt!133444 (insertStrictlySorted!179 (toList!1961 lt!133199) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(assert (=> d!63311 (= (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) lt!133443)))

(declare-fun b!263616 () Bool)

(declare-fun res!128733 () Bool)

(assert (=> b!263616 (=> (not res!128733) (not e!170817))))

(assert (=> b!263616 (= res!128733 (= (getValueByKey!320 (toList!1961 lt!133443) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(declare-fun b!263617 () Bool)

(assert (=> b!263617 (= e!170817 (contains!1914 (toList!1961 lt!133443) (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))

(assert (= (and d!63311 res!128732) b!263616))

(assert (= (and b!263616 res!128733) b!263617))

(declare-fun m!279867 () Bool)

(assert (=> d!63311 m!279867))

(declare-fun m!279869 () Bool)

(assert (=> d!63311 m!279869))

(declare-fun m!279871 () Bool)

(assert (=> d!63311 m!279871))

(declare-fun m!279873 () Bool)

(assert (=> d!63311 m!279873))

(declare-fun m!279875 () Bool)

(assert (=> b!263616 m!279875))

(declare-fun m!279877 () Bool)

(assert (=> b!263617 m!279877))

(assert (=> b!263120 d!63311))

(declare-fun d!63313 () Bool)

(assert (=> d!63313 (contains!1912 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) lt!133200)))

(declare-fun lt!133447 () Unit!8190)

(declare-fun choose!1296 (ListLongMap!3891 (_ BitVec 64) V!8523 (_ BitVec 64)) Unit!8190)

(assert (=> d!63313 (= lt!133447 (choose!1296 lt!133207 lt!133187 (zeroValue!4684 thiss!1504) lt!133200))))

(assert (=> d!63313 (contains!1912 lt!133207 lt!133200)))

(assert (=> d!63313 (= (addStillContains!238 lt!133207 lt!133187 (zeroValue!4684 thiss!1504) lt!133200) lt!133447)))

(declare-fun bs!9270 () Bool)

(assert (= bs!9270 d!63313))

(assert (=> bs!9270 m!279219))

(assert (=> bs!9270 m!279219))

(assert (=> bs!9270 m!279221))

(declare-fun m!279879 () Bool)

(assert (=> bs!9270 m!279879))

(declare-fun m!279881 () Bool)

(assert (=> bs!9270 m!279881))

(assert (=> b!263120 d!63313))

(declare-fun d!63315 () Bool)

(assert (=> d!63315 (= (apply!262 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) lt!133186) (apply!262 lt!133203 lt!133186))))

(declare-fun lt!133448 () Unit!8190)

(assert (=> d!63315 (= lt!133448 (choose!1295 lt!133203 lt!133202 (minValue!4684 thiss!1504) lt!133186))))

(declare-fun e!170818 () Bool)

(assert (=> d!63315 e!170818))

(declare-fun res!128734 () Bool)

(assert (=> d!63315 (=> (not res!128734) (not e!170818))))

(assert (=> d!63315 (= res!128734 (contains!1912 lt!133203 lt!133186))))

(assert (=> d!63315 (= (addApplyDifferent!238 lt!133203 lt!133202 (minValue!4684 thiss!1504) lt!133186) lt!133448)))

(declare-fun b!263619 () Bool)

(assert (=> b!263619 (= e!170818 (not (= lt!133186 lt!133202)))))

(assert (= (and d!63315 res!128734) b!263619))

(assert (=> d!63315 m!279225))

(assert (=> d!63315 m!279215))

(assert (=> d!63315 m!279215))

(assert (=> d!63315 m!279217))

(declare-fun m!279883 () Bool)

(assert (=> d!63315 m!279883))

(declare-fun m!279885 () Bool)

(assert (=> d!63315 m!279885))

(assert (=> b!263120 d!63315))

(declare-fun d!63317 () Bool)

(declare-fun e!170819 () Bool)

(assert (=> d!63317 e!170819))

(declare-fun res!128735 () Bool)

(assert (=> d!63317 (=> (not res!128735) (not e!170819))))

(declare-fun lt!133451 () ListLongMap!3891)

(assert (=> d!63317 (= res!128735 (contains!1912 lt!133451 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133452 () List!3852)

(assert (=> d!63317 (= lt!133451 (ListLongMap!3892 lt!133452))))

(declare-fun lt!133450 () Unit!8190)

(declare-fun lt!133449 () Unit!8190)

(assert (=> d!63317 (= lt!133450 lt!133449)))

(assert (=> d!63317 (= (getValueByKey!320 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63317 (= lt!133449 (lemmaContainsTupThenGetReturnValue!176 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63317 (= lt!133452 (insertStrictlySorted!179 (toList!1961 lt!133207) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63317 (= (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) lt!133451)))

(declare-fun b!263620 () Bool)

(declare-fun res!128736 () Bool)

(assert (=> b!263620 (=> (not res!128736) (not e!170819))))

(assert (=> b!263620 (= res!128736 (= (getValueByKey!320 (toList!1961 lt!133451) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263621 () Bool)

(assert (=> b!263621 (= e!170819 (contains!1914 (toList!1961 lt!133451) (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63317 res!128735) b!263620))

(assert (= (and b!263620 res!128736) b!263621))

(declare-fun m!279887 () Bool)

(assert (=> d!63317 m!279887))

(declare-fun m!279889 () Bool)

(assert (=> d!63317 m!279889))

(declare-fun m!279891 () Bool)

(assert (=> d!63317 m!279891))

(declare-fun m!279893 () Bool)

(assert (=> d!63317 m!279893))

(declare-fun m!279895 () Bool)

(assert (=> b!263620 m!279895))

(declare-fun m!279897 () Bool)

(assert (=> b!263621 m!279897))

(assert (=> b!263120 d!63317))

(declare-fun d!63319 () Bool)

(assert (=> d!63319 (= (+!710 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) (tuple2!4979 key!932 v!346)) (getCurrentListMap!1489 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))

(assert (=> d!63319 true))

(declare-fun _$3!67 () Unit!8190)

(assert (=> d!63319 (= (choose!1292 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 key!932 v!346 (defaultEntry!4843 thiss!1504)) _$3!67)))

(declare-fun bs!9271 () Bool)

(assert (= bs!9271 d!63319))

(assert (=> bs!9271 m!279045))

(assert (=> bs!9271 m!279017))

(assert (=> bs!9271 m!279327))

(assert (=> bs!9271 m!279007))

(assert (=> bs!9271 m!279045))

(assert (=> bs!9271 m!279325))

(assert (=> d!63127 d!63319))

(assert (=> d!63127 d!63181))

(declare-fun d!63321 () Bool)

(declare-fun res!128737 () Bool)

(declare-fun e!170820 () Bool)

(assert (=> d!63321 (=> res!128737 e!170820)))

(assert (=> d!63321 (= res!128737 (and ((_ is Cons!3848) (toList!1961 lt!133025)) (= (_1!2500 (h!4514 (toList!1961 lt!133025))) key!932)))))

(assert (=> d!63321 (= (containsKey!312 (toList!1961 lt!133025) key!932) e!170820)))

(declare-fun b!263622 () Bool)

(declare-fun e!170821 () Bool)

(assert (=> b!263622 (= e!170820 e!170821)))

(declare-fun res!128738 () Bool)

(assert (=> b!263622 (=> (not res!128738) (not e!170821))))

(assert (=> b!263622 (= res!128738 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133025))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133025))) key!932)) ((_ is Cons!3848) (toList!1961 lt!133025)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133025))) key!932)))))

(declare-fun b!263623 () Bool)

(assert (=> b!263623 (= e!170821 (containsKey!312 (t!8929 (toList!1961 lt!133025)) key!932))))

(assert (= (and d!63321 (not res!128737)) b!263622))

(assert (= (and b!263622 res!128738) b!263623))

(declare-fun m!279899 () Bool)

(assert (=> b!263623 m!279899))

(assert (=> d!63111 d!63321))

(declare-fun d!63323 () Bool)

(declare-fun res!128739 () Bool)

(declare-fun e!170822 () Bool)

(assert (=> d!63323 (=> (not res!128739) (not e!170822))))

(assert (=> d!63323 (= res!128739 (validMask!0 (mask!11209 thiss!1504)))))

(assert (=> d!63323 (= (simpleValid!285 thiss!1504) e!170822)))

(declare-fun b!263626 () Bool)

(declare-fun res!128740 () Bool)

(assert (=> b!263626 (=> (not res!128740) (not e!170822))))

(assert (=> b!263626 (= res!128740 (= (size!6353 thiss!1504) (bvadd (_size!1984 thiss!1504) (bvsdiv (bvadd (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!263624 () Bool)

(declare-fun res!128741 () Bool)

(assert (=> b!263624 (=> (not res!128741) (not e!170822))))

(assert (=> b!263624 (= res!128741 (and (= (size!6349 (_values!4826 thiss!1504)) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001)) (= (size!6350 (_keys!7035 thiss!1504)) (size!6349 (_values!4826 thiss!1504))) (bvsge (_size!1984 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1984 thiss!1504) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!263627 () Bool)

(assert (=> b!263627 (= e!170822 (and (bvsge (extraKeys!4580 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4580 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1984 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!263625 () Bool)

(declare-fun res!128742 () Bool)

(assert (=> b!263625 (=> (not res!128742) (not e!170822))))

(assert (=> b!263625 (= res!128742 (bvsge (size!6353 thiss!1504) (_size!1984 thiss!1504)))))

(assert (= (and d!63323 res!128739) b!263624))

(assert (= (and b!263624 res!128741) b!263625))

(assert (= (and b!263625 res!128742) b!263626))

(assert (= (and b!263626 res!128740) b!263627))

(assert (=> d!63323 m!279139))

(declare-fun m!279901 () Bool)

(assert (=> b!263626 m!279901))

(assert (=> b!263625 m!279901))

(assert (=> d!63141 d!63323))

(declare-fun b!263630 () Bool)

(declare-fun e!170824 () Option!326)

(assert (=> b!263630 (= e!170824 (getValueByKey!320 (t!8929 (toList!1961 lt!133265)) (_1!2500 lt!133020)))))

(declare-fun b!263628 () Bool)

(declare-fun e!170823 () Option!326)

(assert (=> b!263628 (= e!170823 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133265)))))))

(declare-fun d!63325 () Bool)

(declare-fun c!44997 () Bool)

(assert (=> d!63325 (= c!44997 (and ((_ is Cons!3848) (toList!1961 lt!133265)) (= (_1!2500 (h!4514 (toList!1961 lt!133265))) (_1!2500 lt!133020))))))

(assert (=> d!63325 (= (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020)) e!170823)))

(declare-fun b!263631 () Bool)

(assert (=> b!263631 (= e!170824 None!324)))

(declare-fun b!263629 () Bool)

(assert (=> b!263629 (= e!170823 e!170824)))

(declare-fun c!44998 () Bool)

(assert (=> b!263629 (= c!44998 (and ((_ is Cons!3848) (toList!1961 lt!133265)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133265))) (_1!2500 lt!133020)))))))

(assert (= (and d!63325 c!44997) b!263628))

(assert (= (and d!63325 (not c!44997)) b!263629))

(assert (= (and b!263629 c!44998) b!263630))

(assert (= (and b!263629 (not c!44998)) b!263631))

(declare-fun m!279903 () Bool)

(assert (=> b!263630 m!279903))

(assert (=> b!263251 d!63325))

(declare-fun d!63327 () Bool)

(assert (=> d!63327 (= (inRange!0 (ite c!44853 (index!6970 lt!133136) (index!6973 lt!133136)) (mask!11209 thiss!1504)) (and (bvsge (ite c!44853 (index!6970 lt!133136) (index!6973 lt!133136)) #b00000000000000000000000000000000) (bvslt (ite c!44853 (index!6970 lt!133136) (index!6973 lt!133136)) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25156 d!63327))

(declare-fun d!63329 () Bool)

(assert (=> d!63329 (= (apply!262 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) lt!133241) (apply!262 lt!133258 lt!133241))))

(declare-fun lt!133453 () Unit!8190)

(assert (=> d!63329 (= lt!133453 (choose!1295 lt!133258 lt!133257 (minValue!4684 thiss!1504) lt!133241))))

(declare-fun e!170825 () Bool)

(assert (=> d!63329 e!170825))

(declare-fun res!128743 () Bool)

(assert (=> d!63329 (=> (not res!128743) (not e!170825))))

(assert (=> d!63329 (= res!128743 (contains!1912 lt!133258 lt!133241))))

(assert (=> d!63329 (= (addApplyDifferent!238 lt!133258 lt!133257 (minValue!4684 thiss!1504) lt!133241) lt!133453)))

(declare-fun b!263632 () Bool)

(assert (=> b!263632 (= e!170825 (not (= lt!133241 lt!133257)))))

(assert (= (and d!63329 res!128743) b!263632))

(assert (=> d!63329 m!279353))

(assert (=> d!63329 m!279343))

(assert (=> d!63329 m!279343))

(assert (=> d!63329 m!279345))

(declare-fun m!279905 () Bool)

(assert (=> d!63329 m!279905))

(declare-fun m!279907 () Bool)

(assert (=> d!63329 m!279907))

(assert (=> b!263237 d!63329))

(declare-fun d!63331 () Bool)

(assert (=> d!63331 (= (apply!262 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) lt!133245) (apply!262 lt!133254 lt!133245))))

(declare-fun lt!133454 () Unit!8190)

(assert (=> d!63331 (= lt!133454 (choose!1295 lt!133254 lt!133243 (minValue!4684 thiss!1504) lt!133245))))

(declare-fun e!170826 () Bool)

(assert (=> d!63331 e!170826))

(declare-fun res!128744 () Bool)

(assert (=> d!63331 (=> (not res!128744) (not e!170826))))

(assert (=> d!63331 (= res!128744 (contains!1912 lt!133254 lt!133245))))

(assert (=> d!63331 (= (addApplyDifferent!238 lt!133254 lt!133243 (minValue!4684 thiss!1504) lt!133245) lt!133454)))

(declare-fun b!263633 () Bool)

(assert (=> b!263633 (= e!170826 (not (= lt!133245 lt!133243)))))

(assert (= (and d!63331 res!128744) b!263633))

(assert (=> d!63331 m!279369))

(assert (=> d!63331 m!279363))

(assert (=> d!63331 m!279363))

(assert (=> d!63331 m!279367))

(declare-fun m!279909 () Bool)

(assert (=> d!63331 m!279909))

(declare-fun m!279911 () Bool)

(assert (=> d!63331 m!279911))

(assert (=> b!263237 d!63331))

(declare-fun d!63333 () Bool)

(declare-fun e!170827 () Bool)

(assert (=> d!63333 e!170827))

(declare-fun res!128745 () Bool)

(assert (=> d!63333 (=> (not res!128745) (not e!170827))))

(declare-fun lt!133457 () ListLongMap!3891)

(assert (=> d!63333 (= res!128745 (contains!1912 lt!133457 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133458 () List!3852)

(assert (=> d!63333 (= lt!133457 (ListLongMap!3892 lt!133458))))

(declare-fun lt!133456 () Unit!8190)

(declare-fun lt!133455 () Unit!8190)

(assert (=> d!63333 (= lt!133456 lt!133455)))

(assert (=> d!63333 (= (getValueByKey!320 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63333 (= lt!133455 (lemmaContainsTupThenGetReturnValue!176 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63333 (= lt!133458 (insertStrictlySorted!179 (toList!1961 lt!133262) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63333 (= (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) lt!133457)))

(declare-fun b!263634 () Bool)

(declare-fun res!128746 () Bool)

(assert (=> b!263634 (=> (not res!128746) (not e!170827))))

(assert (=> b!263634 (= res!128746 (= (getValueByKey!320 (toList!1961 lt!133457) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263635 () Bool)

(assert (=> b!263635 (= e!170827 (contains!1914 (toList!1961 lt!133457) (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63333 res!128745) b!263634))

(assert (= (and b!263634 res!128746) b!263635))

(declare-fun m!279913 () Bool)

(assert (=> d!63333 m!279913))

(declare-fun m!279915 () Bool)

(assert (=> d!63333 m!279915))

(declare-fun m!279917 () Bool)

(assert (=> d!63333 m!279917))

(declare-fun m!279919 () Bool)

(assert (=> d!63333 m!279919))

(declare-fun m!279921 () Bool)

(assert (=> b!263634 m!279921))

(declare-fun m!279923 () Bool)

(assert (=> b!263635 m!279923))

(assert (=> b!263237 d!63333))

(declare-fun d!63335 () Bool)

(assert (=> d!63335 (= (apply!262 lt!133254 lt!133245) (get!3094 (getValueByKey!320 (toList!1961 lt!133254) lt!133245)))))

(declare-fun bs!9272 () Bool)

(assert (= bs!9272 d!63335))

(declare-fun m!279925 () Bool)

(assert (=> bs!9272 m!279925))

(assert (=> bs!9272 m!279925))

(declare-fun m!279927 () Bool)

(assert (=> bs!9272 m!279927))

(assert (=> b!263237 d!63335))

(declare-fun b!263636 () Bool)

(declare-fun lt!133460 () ListLongMap!3891)

(declare-fun e!170833 () Bool)

(assert (=> b!263636 (= e!170833 (= lt!133460 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504))))))

(declare-fun b!263637 () Bool)

(declare-fun e!170831 () Bool)

(assert (=> b!263637 (= e!170831 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> b!263637 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263638 () Bool)

(declare-fun res!128747 () Bool)

(declare-fun e!170832 () Bool)

(assert (=> b!263638 (=> (not res!128747) (not e!170832))))

(assert (=> b!263638 (= res!128747 (not (contains!1912 lt!133460 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263639 () Bool)

(declare-fun e!170834 () Bool)

(assert (=> b!263639 (= e!170832 e!170834)))

(declare-fun c!45000 () Bool)

(assert (=> b!263639 (= c!45000 e!170831)))

(declare-fun res!128748 () Bool)

(assert (=> b!263639 (=> (not res!128748) (not e!170831))))

(assert (=> b!263639 (= res!128748 (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun b!263640 () Bool)

(declare-fun e!170830 () ListLongMap!3891)

(declare-fun e!170828 () ListLongMap!3891)

(assert (=> b!263640 (= e!170830 e!170828)))

(declare-fun c!45002 () Bool)

(assert (=> b!263640 (= c!45002 (validKeyInArray!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263641 () Bool)

(assert (=> b!263641 (= e!170833 (isEmpty!541 lt!133460))))

(declare-fun call!25236 () ListLongMap!3891)

(declare-fun bm!25233 () Bool)

(assert (=> bm!25233 (= call!25236 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)))))

(declare-fun d!63337 () Bool)

(assert (=> d!63337 e!170832))

(declare-fun res!128750 () Bool)

(assert (=> d!63337 (=> (not res!128750) (not e!170832))))

(assert (=> d!63337 (= res!128750 (not (contains!1912 lt!133460 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63337 (= lt!133460 e!170830)))

(declare-fun c!44999 () Bool)

(assert (=> d!63337 (= c!44999 (bvsge #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(assert (=> d!63337 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63337 (= (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133460)))

(declare-fun b!263642 () Bool)

(assert (=> b!263642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(assert (=> b!263642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 lt!133023)))))

(declare-fun e!170829 () Bool)

(assert (=> b!263642 (= e!170829 (= (apply!262 lt!133460 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263643 () Bool)

(assert (=> b!263643 (= e!170834 e!170833)))

(declare-fun c!45001 () Bool)

(assert (=> b!263643 (= c!45001 (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun b!263644 () Bool)

(assert (=> b!263644 (= e!170830 (ListLongMap!3892 Nil!3849))))

(declare-fun b!263645 () Bool)

(declare-fun lt!133459 () Unit!8190)

(declare-fun lt!133462 () Unit!8190)

(assert (=> b!263645 (= lt!133459 lt!133462)))

(declare-fun lt!133465 () ListLongMap!3891)

(declare-fun lt!133464 () (_ BitVec 64))

(declare-fun lt!133463 () (_ BitVec 64))

(declare-fun lt!133461 () V!8523)

(assert (=> b!263645 (not (contains!1912 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461)) lt!133463))))

(assert (=> b!263645 (= lt!133462 (addStillNotContains!129 lt!133465 lt!133464 lt!133461 lt!133463))))

(assert (=> b!263645 (= lt!133463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263645 (= lt!133461 (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263645 (= lt!133464 (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))

(assert (=> b!263645 (= lt!133465 call!25236)))

(assert (=> b!263645 (= e!170828 (+!710 call!25236 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263646 () Bool)

(assert (=> b!263646 (= e!170828 call!25236)))

(declare-fun b!263647 () Bool)

(assert (=> b!263647 (= e!170834 e!170829)))

(assert (=> b!263647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 lt!133026)))))

(declare-fun res!128749 () Bool)

(assert (=> b!263647 (= res!128749 (contains!1912 lt!133460 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> b!263647 (=> (not res!128749) (not e!170829))))

(assert (= (and d!63337 c!44999) b!263644))

(assert (= (and d!63337 (not c!44999)) b!263640))

(assert (= (and b!263640 c!45002) b!263645))

(assert (= (and b!263640 (not c!45002)) b!263646))

(assert (= (or b!263645 b!263646) bm!25233))

(assert (= (and d!63337 res!128750) b!263638))

(assert (= (and b!263638 res!128747) b!263639))

(assert (= (and b!263639 res!128748) b!263637))

(assert (= (and b!263639 c!45000) b!263647))

(assert (= (and b!263639 (not c!45000)) b!263643))

(assert (= (and b!263647 res!128749) b!263642))

(assert (= (and b!263643 c!45001) b!263636))

(assert (= (and b!263643 (not c!45001)) b!263641))

(declare-fun b_lambda!8345 () Bool)

(assert (=> (not b_lambda!8345) (not b!263642)))

(assert (=> b!263642 t!8933))

(declare-fun b_and!13951 () Bool)

(assert (= b_and!13949 (and (=> t!8933 result!5433) b_and!13951)))

(declare-fun b_lambda!8347 () Bool)

(assert (=> (not b_lambda!8347) (not b!263645)))

(assert (=> b!263645 t!8933))

(declare-fun b_and!13953 () Bool)

(assert (= b_and!13951 (and (=> t!8933 result!5433) b_and!13953)))

(declare-fun m!279929 () Bool)

(assert (=> bm!25233 m!279929))

(assert (=> b!263637 m!279255))

(assert (=> b!263637 m!279255))

(assert (=> b!263637 m!279257))

(assert (=> b!263636 m!279929))

(declare-fun m!279931 () Bool)

(assert (=> b!263645 m!279931))

(assert (=> b!263645 m!279251))

(declare-fun m!279933 () Bool)

(assert (=> b!263645 m!279933))

(assert (=> b!263645 m!279255))

(assert (=> b!263645 m!279377))

(declare-fun m!279935 () Bool)

(assert (=> b!263645 m!279935))

(declare-fun m!279937 () Bool)

(assert (=> b!263645 m!279937))

(assert (=> b!263645 m!279935))

(assert (=> b!263645 m!279377))

(assert (=> b!263645 m!279251))

(assert (=> b!263645 m!279379))

(declare-fun m!279939 () Bool)

(assert (=> b!263641 m!279939))

(assert (=> b!263647 m!279255))

(assert (=> b!263647 m!279255))

(declare-fun m!279941 () Bool)

(assert (=> b!263647 m!279941))

(declare-fun m!279943 () Bool)

(assert (=> b!263638 m!279943))

(assert (=> b!263640 m!279255))

(assert (=> b!263640 m!279255))

(assert (=> b!263640 m!279257))

(declare-fun m!279945 () Bool)

(assert (=> d!63337 m!279945))

(assert (=> d!63337 m!279139))

(assert (=> b!263642 m!279251))

(assert (=> b!263642 m!279255))

(assert (=> b!263642 m!279377))

(assert (=> b!263642 m!279255))

(declare-fun m!279947 () Bool)

(assert (=> b!263642 m!279947))

(assert (=> b!263642 m!279377))

(assert (=> b!263642 m!279251))

(assert (=> b!263642 m!279379))

(assert (=> b!263237 d!63337))

(declare-fun d!63339 () Bool)

(declare-fun e!170835 () Bool)

(assert (=> d!63339 e!170835))

(declare-fun res!128751 () Bool)

(assert (=> d!63339 (=> (not res!128751) (not e!170835))))

(declare-fun lt!133468 () ListLongMap!3891)

(assert (=> d!63339 (= res!128751 (contains!1912 lt!133468 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133469 () List!3852)

(assert (=> d!63339 (= lt!133468 (ListLongMap!3892 lt!133469))))

(declare-fun lt!133467 () Unit!8190)

(declare-fun lt!133466 () Unit!8190)

(assert (=> d!63339 (= lt!133467 lt!133466)))

(assert (=> d!63339 (= (getValueByKey!320 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63339 (= lt!133466 (lemmaContainsTupThenGetReturnValue!176 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63339 (= lt!133469 (insertStrictlySorted!179 (toList!1961 lt!133248) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63339 (= (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) lt!133468)))

(declare-fun b!263648 () Bool)

(declare-fun res!128752 () Bool)

(assert (=> b!263648 (=> (not res!128752) (not e!170835))))

(assert (=> b!263648 (= res!128752 (= (getValueByKey!320 (toList!1961 lt!133468) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263649 () Bool)

(assert (=> b!263649 (= e!170835 (contains!1914 (toList!1961 lt!133468) (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63339 res!128751) b!263648))

(assert (= (and b!263648 res!128752) b!263649))

(declare-fun m!279949 () Bool)

(assert (=> d!63339 m!279949))

(declare-fun m!279951 () Bool)

(assert (=> d!63339 m!279951))

(declare-fun m!279953 () Bool)

(assert (=> d!63339 m!279953))

(declare-fun m!279955 () Bool)

(assert (=> d!63339 m!279955))

(declare-fun m!279957 () Bool)

(assert (=> b!263648 m!279957))

(declare-fun m!279959 () Bool)

(assert (=> b!263649 m!279959))

(assert (=> b!263237 d!63339))

(declare-fun d!63341 () Bool)

(declare-fun e!170836 () Bool)

(assert (=> d!63341 e!170836))

(declare-fun res!128753 () Bool)

(assert (=> d!63341 (=> (not res!128753) (not e!170836))))

(declare-fun lt!133472 () ListLongMap!3891)

(assert (=> d!63341 (= res!128753 (contains!1912 lt!133472 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133473 () List!3852)

(assert (=> d!63341 (= lt!133472 (ListLongMap!3892 lt!133473))))

(declare-fun lt!133471 () Unit!8190)

(declare-fun lt!133470 () Unit!8190)

(assert (=> d!63341 (= lt!133471 lt!133470)))

(assert (=> d!63341 (= (getValueByKey!320 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(assert (=> d!63341 (= lt!133470 (lemmaContainsTupThenGetReturnValue!176 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(assert (=> d!63341 (= lt!133473 (insertStrictlySorted!179 (toList!1961 lt!133254) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(assert (=> d!63341 (= (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) lt!133472)))

(declare-fun b!263650 () Bool)

(declare-fun res!128754 () Bool)

(assert (=> b!263650 (=> (not res!128754) (not e!170836))))

(assert (=> b!263650 (= res!128754 (= (getValueByKey!320 (toList!1961 lt!133472) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(declare-fun b!263651 () Bool)

(assert (=> b!263651 (= e!170836 (contains!1914 (toList!1961 lt!133472) (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))

(assert (= (and d!63341 res!128753) b!263650))

(assert (= (and b!263650 res!128754) b!263651))

(declare-fun m!279961 () Bool)

(assert (=> d!63341 m!279961))

(declare-fun m!279963 () Bool)

(assert (=> d!63341 m!279963))

(declare-fun m!279965 () Bool)

(assert (=> d!63341 m!279965))

(declare-fun m!279967 () Bool)

(assert (=> d!63341 m!279967))

(declare-fun m!279969 () Bool)

(assert (=> b!263650 m!279969))

(declare-fun m!279971 () Bool)

(assert (=> b!263651 m!279971))

(assert (=> b!263237 d!63341))

(declare-fun d!63343 () Bool)

(declare-fun e!170837 () Bool)

(assert (=> d!63343 e!170837))

(declare-fun res!128755 () Bool)

(assert (=> d!63343 (=> res!128755 e!170837)))

(declare-fun lt!133475 () Bool)

(assert (=> d!63343 (= res!128755 (not lt!133475))))

(declare-fun lt!133474 () Bool)

(assert (=> d!63343 (= lt!133475 lt!133474)))

(declare-fun lt!133476 () Unit!8190)

(declare-fun e!170838 () Unit!8190)

(assert (=> d!63343 (= lt!133476 e!170838)))

(declare-fun c!45003 () Bool)

(assert (=> d!63343 (= c!45003 lt!133474)))

(assert (=> d!63343 (= lt!133474 (containsKey!312 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))

(assert (=> d!63343 (= (contains!1912 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) lt!133255) lt!133475)))

(declare-fun b!263652 () Bool)

(declare-fun lt!133477 () Unit!8190)

(assert (=> b!263652 (= e!170838 lt!133477)))

(assert (=> b!263652 (= lt!133477 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))

(assert (=> b!263652 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))

(declare-fun b!263653 () Bool)

(declare-fun Unit!8214 () Unit!8190)

(assert (=> b!263653 (= e!170838 Unit!8214)))

(declare-fun b!263654 () Bool)

(assert (=> b!263654 (= e!170837 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255)))))

(assert (= (and d!63343 c!45003) b!263652))

(assert (= (and d!63343 (not c!45003)) b!263653))

(assert (= (and d!63343 (not res!128755)) b!263654))

(declare-fun m!279973 () Bool)

(assert (=> d!63343 m!279973))

(declare-fun m!279975 () Bool)

(assert (=> b!263652 m!279975))

(declare-fun m!279977 () Bool)

(assert (=> b!263652 m!279977))

(assert (=> b!263652 m!279977))

(declare-fun m!279979 () Bool)

(assert (=> b!263652 m!279979))

(assert (=> b!263654 m!279977))

(assert (=> b!263654 m!279977))

(assert (=> b!263654 m!279979))

(assert (=> b!263237 d!63343))

(declare-fun d!63345 () Bool)

(assert (=> d!63345 (= (apply!262 lt!133248 lt!133253) (get!3094 (getValueByKey!320 (toList!1961 lt!133248) lt!133253)))))

(declare-fun bs!9273 () Bool)

(assert (= bs!9273 d!63345))

(declare-fun m!279981 () Bool)

(assert (=> bs!9273 m!279981))

(assert (=> bs!9273 m!279981))

(declare-fun m!279983 () Bool)

(assert (=> bs!9273 m!279983))

(assert (=> b!263237 d!63345))

(declare-fun d!63347 () Bool)

(assert (=> d!63347 (= (apply!262 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) lt!133253) (apply!262 lt!133248 lt!133253))))

(declare-fun lt!133478 () Unit!8190)

(assert (=> d!63347 (= lt!133478 (choose!1295 lt!133248 lt!133249 (zeroValue!4684 thiss!1504) lt!133253))))

(declare-fun e!170839 () Bool)

(assert (=> d!63347 e!170839))

(declare-fun res!128756 () Bool)

(assert (=> d!63347 (=> (not res!128756) (not e!170839))))

(assert (=> d!63347 (= res!128756 (contains!1912 lt!133248 lt!133253))))

(assert (=> d!63347 (= (addApplyDifferent!238 lt!133248 lt!133249 (zeroValue!4684 thiss!1504) lt!133253) lt!133478)))

(declare-fun b!263655 () Bool)

(assert (=> b!263655 (= e!170839 (not (= lt!133253 lt!133249)))))

(assert (= (and d!63347 res!128756) b!263655))

(assert (=> d!63347 m!279371))

(assert (=> d!63347 m!279351))

(assert (=> d!63347 m!279351))

(assert (=> d!63347 m!279355))

(declare-fun m!279985 () Bool)

(assert (=> d!63347 m!279985))

(declare-fun m!279987 () Bool)

(assert (=> d!63347 m!279987))

(assert (=> b!263237 d!63347))

(declare-fun d!63349 () Bool)

(assert (=> d!63349 (= (apply!262 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) lt!133245) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133245)))))

(declare-fun bs!9274 () Bool)

(assert (= bs!9274 d!63349))

(declare-fun m!279989 () Bool)

(assert (=> bs!9274 m!279989))

(assert (=> bs!9274 m!279989))

(declare-fun m!279991 () Bool)

(assert (=> bs!9274 m!279991))

(assert (=> b!263237 d!63349))

(declare-fun d!63351 () Bool)

(assert (=> d!63351 (= (apply!262 lt!133258 lt!133241) (get!3094 (getValueByKey!320 (toList!1961 lt!133258) lt!133241)))))

(declare-fun bs!9275 () Bool)

(assert (= bs!9275 d!63351))

(declare-fun m!279993 () Bool)

(assert (=> bs!9275 m!279993))

(assert (=> bs!9275 m!279993))

(declare-fun m!279995 () Bool)

(assert (=> bs!9275 m!279995))

(assert (=> b!263237 d!63351))

(declare-fun d!63353 () Bool)

(declare-fun e!170840 () Bool)

(assert (=> d!63353 e!170840))

(declare-fun res!128757 () Bool)

(assert (=> d!63353 (=> (not res!128757) (not e!170840))))

(declare-fun lt!133481 () ListLongMap!3891)

(assert (=> d!63353 (= res!128757 (contains!1912 lt!133481 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133482 () List!3852)

(assert (=> d!63353 (= lt!133481 (ListLongMap!3892 lt!133482))))

(declare-fun lt!133480 () Unit!8190)

(declare-fun lt!133479 () Unit!8190)

(assert (=> d!63353 (= lt!133480 lt!133479)))

(assert (=> d!63353 (= (getValueByKey!320 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(assert (=> d!63353 (= lt!133479 (lemmaContainsTupThenGetReturnValue!176 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(assert (=> d!63353 (= lt!133482 (insertStrictlySorted!179 (toList!1961 lt!133258) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(assert (=> d!63353 (= (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) lt!133481)))

(declare-fun b!263656 () Bool)

(declare-fun res!128758 () Bool)

(assert (=> b!263656 (=> (not res!128758) (not e!170840))))

(assert (=> b!263656 (= res!128758 (= (getValueByKey!320 (toList!1961 lt!133481) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(declare-fun b!263657 () Bool)

(assert (=> b!263657 (= e!170840 (contains!1914 (toList!1961 lt!133481) (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))

(assert (= (and d!63353 res!128757) b!263656))

(assert (= (and b!263656 res!128758) b!263657))

(declare-fun m!279997 () Bool)

(assert (=> d!63353 m!279997))

(declare-fun m!279999 () Bool)

(assert (=> d!63353 m!279999))

(declare-fun m!280001 () Bool)

(assert (=> d!63353 m!280001))

(declare-fun m!280003 () Bool)

(assert (=> d!63353 m!280003))

(declare-fun m!280005 () Bool)

(assert (=> b!263656 m!280005))

(declare-fun m!280007 () Bool)

(assert (=> b!263657 m!280007))

(assert (=> b!263237 d!63353))

(declare-fun d!63355 () Bool)

(assert (=> d!63355 (= (apply!262 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) lt!133241) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133241)))))

(declare-fun bs!9276 () Bool)

(assert (= bs!9276 d!63355))

(declare-fun m!280009 () Bool)

(assert (=> bs!9276 m!280009))

(assert (=> bs!9276 m!280009))

(declare-fun m!280011 () Bool)

(assert (=> bs!9276 m!280011))

(assert (=> b!263237 d!63355))

(declare-fun d!63357 () Bool)

(assert (=> d!63357 (contains!1912 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) lt!133255)))

(declare-fun lt!133483 () Unit!8190)

(assert (=> d!63357 (= lt!133483 (choose!1296 lt!133262 lt!133242 (zeroValue!4684 thiss!1504) lt!133255))))

(assert (=> d!63357 (contains!1912 lt!133262 lt!133255)))

(assert (=> d!63357 (= (addStillContains!238 lt!133262 lt!133242 (zeroValue!4684 thiss!1504) lt!133255) lt!133483)))

(declare-fun bs!9277 () Bool)

(assert (= bs!9277 d!63357))

(assert (=> bs!9277 m!279347))

(assert (=> bs!9277 m!279347))

(assert (=> bs!9277 m!279349))

(declare-fun m!280013 () Bool)

(assert (=> bs!9277 m!280013))

(declare-fun m!280015 () Bool)

(assert (=> bs!9277 m!280015))

(assert (=> b!263237 d!63357))

(declare-fun d!63359 () Bool)

(assert (=> d!63359 (= (apply!262 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) lt!133253) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133253)))))

(declare-fun bs!9278 () Bool)

(assert (= bs!9278 d!63359))

(declare-fun m!280017 () Bool)

(assert (=> bs!9278 m!280017))

(assert (=> bs!9278 m!280017))

(declare-fun m!280019 () Bool)

(assert (=> bs!9278 m!280019))

(assert (=> b!263237 d!63359))

(declare-fun d!63361 () Bool)

(assert (=> d!63361 (contains!1912 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) (select (arr!5999 lt!133026) index!297))))

(assert (=> d!63361 true))

(declare-fun _$16!169 () Unit!8190)

(assert (=> d!63361 (= (choose!1291 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) index!297 (defaultEntry!4843 thiss!1504)) _$16!169)))

(declare-fun bs!9279 () Bool)

(assert (= bs!9279 d!63361))

(assert (=> bs!9279 m!279029))

(assert (=> bs!9279 m!279307))

(assert (=> bs!9279 m!279029))

(assert (=> bs!9279 m!279307))

(assert (=> bs!9279 m!279321))

(assert (=> d!63125 d!63361))

(assert (=> d!63125 d!63181))

(declare-fun d!63363 () Bool)

(assert (=> d!63363 (= (apply!262 lt!133201 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9280 () Bool)

(assert (= bs!9280 d!63363))

(assert (=> bs!9280 m!279623))

(assert (=> bs!9280 m!279623))

(declare-fun m!280021 () Bool)

(assert (=> bs!9280 m!280021))

(assert (=> b!263117 d!63363))

(declare-fun d!63365 () Bool)

(declare-fun e!170841 () Bool)

(assert (=> d!63365 e!170841))

(declare-fun res!128759 () Bool)

(assert (=> d!63365 (=> res!128759 e!170841)))

(declare-fun lt!133485 () Bool)

(assert (=> d!63365 (= res!128759 (not lt!133485))))

(declare-fun lt!133484 () Bool)

(assert (=> d!63365 (= lt!133485 lt!133484)))

(declare-fun lt!133486 () Unit!8190)

(declare-fun e!170842 () Unit!8190)

(assert (=> d!63365 (= lt!133486 e!170842)))

(declare-fun c!45004 () Bool)

(assert (=> d!63365 (= c!45004 lt!133484)))

(assert (=> d!63365 (= lt!133484 (containsKey!312 (toList!1961 lt!133127) (_1!2500 lt!133020)))))

(assert (=> d!63365 (= (contains!1912 lt!133127 (_1!2500 lt!133020)) lt!133485)))

(declare-fun b!263658 () Bool)

(declare-fun lt!133487 () Unit!8190)

(assert (=> b!263658 (= e!170842 lt!133487)))

(assert (=> b!263658 (= lt!133487 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133127) (_1!2500 lt!133020)))))

(assert (=> b!263658 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020)))))

(declare-fun b!263659 () Bool)

(declare-fun Unit!8215 () Unit!8190)

(assert (=> b!263659 (= e!170842 Unit!8215)))

(declare-fun b!263660 () Bool)

(assert (=> b!263660 (= e!170841 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020))))))

(assert (= (and d!63365 c!45004) b!263658))

(assert (= (and d!63365 (not c!45004)) b!263659))

(assert (= (and d!63365 (not res!128759)) b!263660))

(declare-fun m!280023 () Bool)

(assert (=> d!63365 m!280023))

(declare-fun m!280025 () Bool)

(assert (=> b!263658 m!280025))

(assert (=> b!263658 m!279173))

(assert (=> b!263658 m!279173))

(declare-fun m!280027 () Bool)

(assert (=> b!263658 m!280027))

(assert (=> b!263660 m!279173))

(assert (=> b!263660 m!279173))

(assert (=> b!263660 m!280027))

(assert (=> d!63087 d!63365))

(declare-fun b!263663 () Bool)

(declare-fun e!170844 () Option!326)

(assert (=> b!263663 (= e!170844 (getValueByKey!320 (t!8929 lt!133128) (_1!2500 lt!133020)))))

(declare-fun b!263661 () Bool)

(declare-fun e!170843 () Option!326)

(assert (=> b!263661 (= e!170843 (Some!325 (_2!2500 (h!4514 lt!133128))))))

(declare-fun d!63367 () Bool)

(declare-fun c!45005 () Bool)

(assert (=> d!63367 (= c!45005 (and ((_ is Cons!3848) lt!133128) (= (_1!2500 (h!4514 lt!133128)) (_1!2500 lt!133020))))))

(assert (=> d!63367 (= (getValueByKey!320 lt!133128 (_1!2500 lt!133020)) e!170843)))

(declare-fun b!263664 () Bool)

(assert (=> b!263664 (= e!170844 None!324)))

(declare-fun b!263662 () Bool)

(assert (=> b!263662 (= e!170843 e!170844)))

(declare-fun c!45006 () Bool)

(assert (=> b!263662 (= c!45006 (and ((_ is Cons!3848) lt!133128) (not (= (_1!2500 (h!4514 lt!133128)) (_1!2500 lt!133020)))))))

(assert (= (and d!63367 c!45005) b!263661))

(assert (= (and d!63367 (not c!45005)) b!263662))

(assert (= (and b!263662 c!45006) b!263663))

(assert (= (and b!263662 (not c!45006)) b!263664))

(declare-fun m!280029 () Bool)

(assert (=> b!263663 m!280029))

(assert (=> d!63087 d!63367))

(declare-fun d!63369 () Bool)

(assert (=> d!63369 (= (getValueByKey!320 lt!133128 (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020)))))

(declare-fun lt!133488 () Unit!8190)

(assert (=> d!63369 (= lt!133488 (choose!1294 lt!133128 (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun e!170845 () Bool)

(assert (=> d!63369 e!170845))

(declare-fun res!128760 () Bool)

(assert (=> d!63369 (=> (not res!128760) (not e!170845))))

(assert (=> d!63369 (= res!128760 (isStrictlySorted!377 lt!133128))))

(assert (=> d!63369 (= (lemmaContainsTupThenGetReturnValue!176 lt!133128 (_1!2500 lt!133020) (_2!2500 lt!133020)) lt!133488)))

(declare-fun b!263665 () Bool)

(declare-fun res!128761 () Bool)

(assert (=> b!263665 (=> (not res!128761) (not e!170845))))

(assert (=> b!263665 (= res!128761 (containsKey!312 lt!133128 (_1!2500 lt!133020)))))

(declare-fun b!263666 () Bool)

(assert (=> b!263666 (= e!170845 (contains!1914 lt!133128 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(assert (= (and d!63369 res!128760) b!263665))

(assert (= (and b!263665 res!128761) b!263666))

(assert (=> d!63369 m!279167))

(declare-fun m!280031 () Bool)

(assert (=> d!63369 m!280031))

(declare-fun m!280033 () Bool)

(assert (=> d!63369 m!280033))

(declare-fun m!280035 () Bool)

(assert (=> b!263665 m!280035))

(declare-fun m!280037 () Bool)

(assert (=> b!263666 m!280037))

(assert (=> d!63087 d!63369))

(declare-fun bm!25234 () Bool)

(declare-fun call!25239 () List!3852)

(declare-fun call!25238 () List!3852)

(assert (=> bm!25234 (= call!25239 call!25238)))

(declare-fun bm!25235 () Bool)

(declare-fun call!25237 () List!3852)

(assert (=> bm!25235 (= call!25237 call!25239)))

(declare-fun b!263667 () Bool)

(declare-fun res!128762 () Bool)

(declare-fun e!170850 () Bool)

(assert (=> b!263667 (=> (not res!128762) (not e!170850))))

(declare-fun lt!133489 () List!3852)

(assert (=> b!263667 (= res!128762 (containsKey!312 lt!133489 (_1!2500 lt!133020)))))

(declare-fun b!263668 () Bool)

(declare-fun c!45007 () Bool)

(assert (=> b!263668 (= c!45007 (and ((_ is Cons!3848) (toList!1961 (map!2758 thiss!1504))) (bvsgt (_1!2500 (h!4514 (toList!1961 (map!2758 thiss!1504)))) (_1!2500 lt!133020))))))

(declare-fun e!170849 () List!3852)

(declare-fun e!170846 () List!3852)

(assert (=> b!263668 (= e!170849 e!170846)))

(declare-fun b!263669 () Bool)

(declare-fun e!170848 () List!3852)

(assert (=> b!263669 (= e!170848 e!170849)))

(declare-fun c!45010 () Bool)

(assert (=> b!263669 (= c!45010 (and ((_ is Cons!3848) (toList!1961 (map!2758 thiss!1504))) (= (_1!2500 (h!4514 (toList!1961 (map!2758 thiss!1504)))) (_1!2500 lt!133020))))))

(declare-fun b!263670 () Bool)

(assert (=> b!263670 (= e!170850 (contains!1914 lt!133489 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!263671 () Bool)

(assert (=> b!263671 (= e!170848 call!25238)))

(declare-fun b!263672 () Bool)

(assert (=> b!263672 (= e!170849 call!25239)))

(declare-fun b!263673 () Bool)

(declare-fun e!170847 () List!3852)

(assert (=> b!263673 (= e!170847 (insertStrictlySorted!179 (t!8929 (toList!1961 (map!2758 thiss!1504))) (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun b!263674 () Bool)

(assert (=> b!263674 (= e!170846 call!25237)))

(declare-fun c!45009 () Bool)

(declare-fun bm!25236 () Bool)

(assert (=> bm!25236 (= call!25238 ($colon$colon!108 e!170847 (ite c!45009 (h!4514 (toList!1961 (map!2758 thiss!1504))) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020)))))))

(declare-fun c!45008 () Bool)

(assert (=> bm!25236 (= c!45008 c!45009)))

(declare-fun d!63371 () Bool)

(assert (=> d!63371 e!170850))

(declare-fun res!128763 () Bool)

(assert (=> d!63371 (=> (not res!128763) (not e!170850))))

(assert (=> d!63371 (= res!128763 (isStrictlySorted!377 lt!133489))))

(assert (=> d!63371 (= lt!133489 e!170848)))

(assert (=> d!63371 (= c!45009 (and ((_ is Cons!3848) (toList!1961 (map!2758 thiss!1504))) (bvslt (_1!2500 (h!4514 (toList!1961 (map!2758 thiss!1504)))) (_1!2500 lt!133020))))))

(assert (=> d!63371 (isStrictlySorted!377 (toList!1961 (map!2758 thiss!1504)))))

(assert (=> d!63371 (= (insertStrictlySorted!179 (toList!1961 (map!2758 thiss!1504)) (_1!2500 lt!133020) (_2!2500 lt!133020)) lt!133489)))

(declare-fun b!263675 () Bool)

(assert (=> b!263675 (= e!170846 call!25237)))

(declare-fun b!263676 () Bool)

(assert (=> b!263676 (= e!170847 (ite c!45010 (t!8929 (toList!1961 (map!2758 thiss!1504))) (ite c!45007 (Cons!3848 (h!4514 (toList!1961 (map!2758 thiss!1504))) (t!8929 (toList!1961 (map!2758 thiss!1504)))) Nil!3849)))))

(assert (= (and d!63371 c!45009) b!263671))

(assert (= (and d!63371 (not c!45009)) b!263669))

(assert (= (and b!263669 c!45010) b!263672))

(assert (= (and b!263669 (not c!45010)) b!263668))

(assert (= (and b!263668 c!45007) b!263675))

(assert (= (and b!263668 (not c!45007)) b!263674))

(assert (= (or b!263675 b!263674) bm!25235))

(assert (= (or b!263672 bm!25235) bm!25234))

(assert (= (or b!263671 bm!25234) bm!25236))

(assert (= (and bm!25236 c!45008) b!263673))

(assert (= (and bm!25236 (not c!45008)) b!263676))

(assert (= (and d!63371 res!128763) b!263667))

(assert (= (and b!263667 res!128762) b!263670))

(declare-fun m!280039 () Bool)

(assert (=> bm!25236 m!280039))

(declare-fun m!280041 () Bool)

(assert (=> b!263673 m!280041))

(declare-fun m!280043 () Bool)

(assert (=> b!263670 m!280043))

(declare-fun m!280045 () Bool)

(assert (=> b!263667 m!280045))

(declare-fun m!280047 () Bool)

(assert (=> d!63371 m!280047))

(declare-fun m!280049 () Bool)

(assert (=> d!63371 m!280049))

(assert (=> d!63087 d!63371))

(assert (=> b!263217 d!63277))

(assert (=> d!63133 d!63113))

(declare-fun d!63373 () Bool)

(assert (=> d!63373 (arrayContainsKey!0 lt!133026 key!932 #b00000000000000000000000000000000)))

(assert (=> d!63373 true))

(declare-fun _$60!390 () Unit!8190)

(assert (=> d!63373 (= (choose!13 lt!133026 key!932 index!297) _$60!390)))

(declare-fun bs!9281 () Bool)

(assert (= bs!9281 d!63373))

(assert (=> bs!9281 m!279031))

(assert (=> d!63133 d!63373))

(declare-fun b!263677 () Bool)

(declare-fun e!170851 () (_ BitVec 32))

(assert (=> b!263677 (= e!170851 #b00000000000000000000000000000000)))

(declare-fun b!263679 () Bool)

(declare-fun e!170852 () (_ BitVec 32))

(assert (=> b!263679 (= e!170851 e!170852)))

(declare-fun c!45012 () Bool)

(assert (=> b!263679 (= c!45012 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263680 () Bool)

(declare-fun call!25240 () (_ BitVec 32))

(assert (=> b!263680 (= e!170852 call!25240)))

(declare-fun bm!25237 () Bool)

(assert (=> bm!25237 (= call!25240 (arrayCountValidKeys!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun lt!133490 () (_ BitVec 32))

(declare-fun d!63375 () Bool)

(assert (=> d!63375 (and (bvsge lt!133490 #b00000000000000000000000000000000) (bvsle lt!133490 (bvsub (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!63375 (= lt!133490 e!170851)))

(declare-fun c!45011 () Bool)

(assert (=> d!63375 (= c!45011 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63375 (and (bvsle #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!63375 (= (arrayCountValidKeys!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) lt!133490)))

(declare-fun b!263678 () Bool)

(assert (=> b!263678 (= e!170852 (bvadd #b00000000000000000000000000000001 call!25240))))

(assert (= (and d!63375 c!45011) b!263677))

(assert (= (and d!63375 (not c!45011)) b!263679))

(assert (= (and b!263679 c!45012) b!263678))

(assert (= (and b!263679 (not c!45012)) b!263680))

(assert (= (or b!263678 b!263680) bm!25237))

(assert (=> b!263679 m!279647))

(assert (=> b!263679 m!279647))

(assert (=> b!263679 m!279649))

(declare-fun m!280051 () Bool)

(assert (=> bm!25237 m!280051))

(assert (=> b!263159 d!63375))

(assert (=> b!263159 d!63109))

(declare-fun b!263682 () Bool)

(declare-fun e!170853 () Bool)

(declare-fun call!25241 () Bool)

(assert (=> b!263682 (= e!170853 call!25241)))

(declare-fun b!263683 () Bool)

(declare-fun e!170854 () Bool)

(assert (=> b!263683 (= e!170853 e!170854)))

(declare-fun lt!133491 () (_ BitVec 64))

(assert (=> b!263683 (= lt!133491 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))

(declare-fun lt!133492 () Unit!8190)

(assert (=> b!263683 (= lt!133492 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7035 lt!133015) lt!133491 #b00000000000000000000000000000000))))

(assert (=> b!263683 (arrayContainsKey!0 (_keys!7035 lt!133015) lt!133491 #b00000000000000000000000000000000)))

(declare-fun lt!133493 () Unit!8190)

(assert (=> b!263683 (= lt!133493 lt!133492)))

(declare-fun res!128765 () Bool)

(assert (=> b!263683 (= res!128765 (= (seekEntryOrOpen!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) (_keys!7035 lt!133015) (mask!11209 lt!133015)) (Found!1200 #b00000000000000000000000000000000)))))

(assert (=> b!263683 (=> (not res!128765) (not e!170854))))

(declare-fun b!263684 () Bool)

(assert (=> b!263684 (= e!170854 call!25241)))

(declare-fun bm!25238 () Bool)

(assert (=> bm!25238 (= call!25241 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7035 lt!133015) (mask!11209 lt!133015)))))

(declare-fun b!263681 () Bool)

(declare-fun e!170855 () Bool)

(assert (=> b!263681 (= e!170855 e!170853)))

(declare-fun c!45013 () Bool)

(assert (=> b!263681 (= c!45013 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun d!63377 () Bool)

(declare-fun res!128764 () Bool)

(assert (=> d!63377 (=> res!128764 e!170855)))

(assert (=> d!63377 (= res!128764 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7035 lt!133015) (mask!11209 lt!133015)) e!170855)))

(assert (= (and d!63377 (not res!128764)) b!263681))

(assert (= (and b!263681 c!45013) b!263683))

(assert (= (and b!263681 (not c!45013)) b!263682))

(assert (= (and b!263683 res!128765) b!263684))

(assert (= (or b!263684 b!263682) bm!25238))

(assert (=> b!263683 m!279591))

(declare-fun m!280053 () Bool)

(assert (=> b!263683 m!280053))

(declare-fun m!280055 () Bool)

(assert (=> b!263683 m!280055))

(assert (=> b!263683 m!279591))

(declare-fun m!280057 () Bool)

(assert (=> b!263683 m!280057))

(declare-fun m!280059 () Bool)

(assert (=> bm!25238 m!280059))

(assert (=> b!263681 m!279591))

(assert (=> b!263681 m!279591))

(assert (=> b!263681 m!279593))

(assert (=> b!263207 d!63377))

(declare-fun b!263686 () Bool)

(declare-fun e!170856 () Bool)

(declare-fun call!25242 () Bool)

(assert (=> b!263686 (= e!170856 call!25242)))

(declare-fun b!263687 () Bool)

(declare-fun e!170857 () Bool)

(assert (=> b!263687 (= e!170856 e!170857)))

(declare-fun lt!133494 () (_ BitVec 64))

(assert (=> b!263687 (= lt!133494 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133495 () Unit!8190)

(assert (=> b!263687 (= lt!133495 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 #b00000000000000000000000000000000))))

(assert (=> b!263687 (arrayContainsKey!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 #b00000000000000000000000000000000)))

(declare-fun lt!133496 () Unit!8190)

(assert (=> b!263687 (= lt!133496 lt!133495)))

(declare-fun res!128767 () Bool)

(assert (=> b!263687 (= res!128767 (= (seekEntryOrOpen!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)) (Found!1200 #b00000000000000000000000000000000)))))

(assert (=> b!263687 (=> (not res!128767) (not e!170857))))

(declare-fun b!263688 () Bool)

(assert (=> b!263688 (= e!170857 call!25242)))

(declare-fun bm!25239 () Bool)

(assert (=> bm!25239 (= call!25242 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)))))

(declare-fun b!263685 () Bool)

(declare-fun e!170858 () Bool)

(assert (=> b!263685 (= e!170858 e!170856)))

(declare-fun c!45014 () Bool)

(assert (=> b!263685 (= c!45014 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!63379 () Bool)

(declare-fun res!128766 () Bool)

(assert (=> d!63379 (=> res!128766 e!170858)))

(assert (=> d!63379 (= res!128766 (bvsge #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!63379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)) e!170858)))

(assert (= (and d!63379 (not res!128766)) b!263685))

(assert (= (and b!263685 c!45014) b!263687))

(assert (= (and b!263685 (not c!45014)) b!263686))

(assert (= (and b!263687 res!128767) b!263688))

(assert (= (or b!263688 b!263686) bm!25239))

(assert (=> b!263687 m!279647))

(declare-fun m!280061 () Bool)

(assert (=> b!263687 m!280061))

(declare-fun m!280063 () Bool)

(assert (=> b!263687 m!280063))

(assert (=> b!263687 m!279647))

(declare-fun m!280065 () Bool)

(assert (=> b!263687 m!280065))

(declare-fun m!280067 () Bool)

(assert (=> bm!25239 m!280067))

(assert (=> b!263685 m!279647))

(assert (=> b!263685 m!279647))

(assert (=> b!263685 m!279649))

(assert (=> b!263223 d!63379))

(declare-fun d!63381 () Bool)

(declare-fun e!170863 () Bool)

(assert (=> d!63381 e!170863))

(declare-fun res!128776 () Bool)

(assert (=> d!63381 (=> (not res!128776) (not e!170863))))

(assert (=> d!63381 (= res!128776 (or (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))))

(declare-fun lt!133512 () ListLongMap!3891)

(declare-fun lt!133503 () ListLongMap!3891)

(assert (=> d!63381 (= lt!133512 lt!133503)))

(declare-fun lt!133506 () Unit!8190)

(declare-fun e!170859 () Unit!8190)

(assert (=> d!63381 (= lt!133506 e!170859)))

(declare-fun c!45015 () Bool)

(declare-fun e!170866 () Bool)

(assert (=> d!63381 (= c!45015 e!170866)))

(declare-fun res!128771 () Bool)

(assert (=> d!63381 (=> (not res!128771) (not e!170866))))

(assert (=> d!63381 (= res!128771 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun e!170861 () ListLongMap!3891)

(assert (=> d!63381 (= lt!133503 e!170861)))

(declare-fun c!45019 () Bool)

(assert (=> d!63381 (= c!45019 (and (not (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63381 (validMask!0 (mask!11209 lt!133015))))

(assert (=> d!63381 (= (getCurrentListMap!1489 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)) lt!133512)))

(declare-fun b!263689 () Bool)

(declare-fun Unit!8216 () Unit!8190)

(assert (=> b!263689 (= e!170859 Unit!8216)))

(declare-fun b!263690 () Bool)

(declare-fun e!170868 () Bool)

(assert (=> b!263690 (= e!170868 (= (apply!262 lt!133512 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 (_values!4826 lt!133015))))))

(assert (=> b!263690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun b!263691 () Bool)

(declare-fun e!170869 () Bool)

(declare-fun call!25247 () Bool)

(assert (=> b!263691 (= e!170869 (not call!25247))))

(declare-fun b!263692 () Bool)

(assert (=> b!263692 (= e!170863 e!170869)))

(declare-fun c!45018 () Bool)

(assert (=> b!263692 (= c!45018 (not (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263693 () Bool)

(declare-fun e!170871 () Bool)

(assert (=> b!263693 (= e!170871 (= (apply!262 lt!133512 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4684 lt!133015)))))

(declare-fun bm!25240 () Bool)

(declare-fun call!25245 () ListLongMap!3891)

(assert (=> bm!25240 (= call!25245 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)))))

(declare-fun b!263694 () Bool)

(declare-fun res!128768 () Bool)

(assert (=> b!263694 (=> (not res!128768) (not e!170863))))

(declare-fun e!170860 () Bool)

(assert (=> b!263694 (= res!128768 e!170860)))

(declare-fun c!45017 () Bool)

(assert (=> b!263694 (= c!45017 (not (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!263695 () Bool)

(declare-fun res!128770 () Bool)

(assert (=> b!263695 (=> (not res!128770) (not e!170863))))

(declare-fun e!170865 () Bool)

(assert (=> b!263695 (= res!128770 e!170865)))

(declare-fun res!128769 () Bool)

(assert (=> b!263695 (=> res!128769 e!170865)))

(declare-fun e!170867 () Bool)

(assert (=> b!263695 (= res!128769 (not e!170867))))

(declare-fun res!128772 () Bool)

(assert (=> b!263695 (=> (not res!128772) (not e!170867))))

(assert (=> b!263695 (= res!128772 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun bm!25241 () Bool)

(assert (=> bm!25241 (= call!25247 (contains!1912 lt!133512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263696 () Bool)

(declare-fun lt!133517 () Unit!8190)

(assert (=> b!263696 (= e!170859 lt!133517)))

(declare-fun lt!133518 () ListLongMap!3891)

(assert (=> b!263696 (= lt!133518 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)))))

(declare-fun lt!133498 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133511 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133511 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))

(declare-fun lt!133508 () Unit!8190)

(assert (=> b!263696 (= lt!133508 (addStillContains!238 lt!133518 lt!133498 (zeroValue!4684 lt!133015) lt!133511))))

(assert (=> b!263696 (contains!1912 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))) lt!133511)))

(declare-fun lt!133500 () Unit!8190)

(assert (=> b!263696 (= lt!133500 lt!133508)))

(declare-fun lt!133514 () ListLongMap!3891)

(assert (=> b!263696 (= lt!133514 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)))))

(declare-fun lt!133513 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133513 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133497 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133497 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))

(declare-fun lt!133516 () Unit!8190)

(assert (=> b!263696 (= lt!133516 (addApplyDifferent!238 lt!133514 lt!133513 (minValue!4684 lt!133015) lt!133497))))

(assert (=> b!263696 (= (apply!262 (+!710 lt!133514 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))) lt!133497) (apply!262 lt!133514 lt!133497))))

(declare-fun lt!133502 () Unit!8190)

(assert (=> b!263696 (= lt!133502 lt!133516)))

(declare-fun lt!133504 () ListLongMap!3891)

(assert (=> b!263696 (= lt!133504 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)))))

(declare-fun lt!133505 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133509 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133509 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))

(declare-fun lt!133515 () Unit!8190)

(assert (=> b!263696 (= lt!133515 (addApplyDifferent!238 lt!133504 lt!133505 (zeroValue!4684 lt!133015) lt!133509))))

(assert (=> b!263696 (= (apply!262 (+!710 lt!133504 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))) lt!133509) (apply!262 lt!133504 lt!133509))))

(declare-fun lt!133507 () Unit!8190)

(assert (=> b!263696 (= lt!133507 lt!133515)))

(declare-fun lt!133510 () ListLongMap!3891)

(assert (=> b!263696 (= lt!133510 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)))))

(declare-fun lt!133499 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133501 () (_ BitVec 64))

(assert (=> b!263696 (= lt!133501 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))

(assert (=> b!263696 (= lt!133517 (addApplyDifferent!238 lt!133510 lt!133499 (minValue!4684 lt!133015) lt!133501))))

(assert (=> b!263696 (= (apply!262 (+!710 lt!133510 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))) lt!133501) (apply!262 lt!133510 lt!133501))))

(declare-fun bm!25242 () Bool)

(declare-fun call!25244 () ListLongMap!3891)

(declare-fun call!25243 () ListLongMap!3891)

(assert (=> bm!25242 (= call!25244 call!25243)))

(declare-fun b!263697 () Bool)

(declare-fun e!170862 () ListLongMap!3891)

(declare-fun call!25248 () ListLongMap!3891)

(assert (=> b!263697 (= e!170862 call!25248)))

(declare-fun b!263698 () Bool)

(declare-fun call!25249 () ListLongMap!3891)

(assert (=> b!263698 (= e!170861 (+!710 call!25249 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))

(declare-fun bm!25243 () Bool)

(assert (=> bm!25243 (= call!25243 call!25245)))

(declare-fun b!263699 () Bool)

(declare-fun e!170864 () Bool)

(assert (=> b!263699 (= e!170864 (= (apply!262 lt!133512 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4684 lt!133015)))))

(declare-fun bm!25244 () Bool)

(declare-fun c!45016 () Bool)

(assert (=> bm!25244 (= call!25249 (+!710 (ite c!45019 call!25245 (ite c!45016 call!25243 call!25244)) (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))

(declare-fun b!263700 () Bool)

(declare-fun c!45020 () Bool)

(assert (=> b!263700 (= c!45020 (and (not (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170870 () ListLongMap!3891)

(assert (=> b!263700 (= e!170862 e!170870)))

(declare-fun b!263701 () Bool)

(assert (=> b!263701 (= e!170860 e!170871)))

(declare-fun res!128773 () Bool)

(declare-fun call!25246 () Bool)

(assert (=> b!263701 (= res!128773 call!25246)))

(assert (=> b!263701 (=> (not res!128773) (not e!170871))))

(declare-fun b!263702 () Bool)

(assert (=> b!263702 (= e!170870 call!25248)))

(declare-fun b!263703 () Bool)

(assert (=> b!263703 (= e!170865 e!170868)))

(declare-fun res!128774 () Bool)

(assert (=> b!263703 (=> (not res!128774) (not e!170868))))

(assert (=> b!263703 (= res!128774 (contains!1912 lt!133512 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (=> b!263703 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun bm!25245 () Bool)

(assert (=> bm!25245 (= call!25246 (contains!1912 lt!133512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263704 () Bool)

(assert (=> b!263704 (= e!170861 e!170862)))

(assert (=> b!263704 (= c!45016 (and (not (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4580 lt!133015) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263705 () Bool)

(assert (=> b!263705 (= e!170867 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!263706 () Bool)

(assert (=> b!263706 (= e!170860 (not call!25246))))

(declare-fun b!263707 () Bool)

(assert (=> b!263707 (= e!170870 call!25244)))

(declare-fun b!263708 () Bool)

(assert (=> b!263708 (= e!170869 e!170864)))

(declare-fun res!128775 () Bool)

(assert (=> b!263708 (= res!128775 call!25247)))

(assert (=> b!263708 (=> (not res!128775) (not e!170864))))

(declare-fun b!263709 () Bool)

(assert (=> b!263709 (= e!170866 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun bm!25246 () Bool)

(assert (=> bm!25246 (= call!25248 call!25249)))

(assert (= (and d!63381 c!45019) b!263698))

(assert (= (and d!63381 (not c!45019)) b!263704))

(assert (= (and b!263704 c!45016) b!263697))

(assert (= (and b!263704 (not c!45016)) b!263700))

(assert (= (and b!263700 c!45020) b!263702))

(assert (= (and b!263700 (not c!45020)) b!263707))

(assert (= (or b!263702 b!263707) bm!25242))

(assert (= (or b!263697 bm!25242) bm!25243))

(assert (= (or b!263697 b!263702) bm!25246))

(assert (= (or b!263698 bm!25243) bm!25240))

(assert (= (or b!263698 bm!25246) bm!25244))

(assert (= (and d!63381 res!128771) b!263709))

(assert (= (and d!63381 c!45015) b!263696))

(assert (= (and d!63381 (not c!45015)) b!263689))

(assert (= (and d!63381 res!128776) b!263695))

(assert (= (and b!263695 res!128772) b!263705))

(assert (= (and b!263695 (not res!128769)) b!263703))

(assert (= (and b!263703 res!128774) b!263690))

(assert (= (and b!263695 res!128770) b!263694))

(assert (= (and b!263694 c!45017) b!263701))

(assert (= (and b!263694 (not c!45017)) b!263706))

(assert (= (and b!263701 res!128773) b!263693))

(assert (= (or b!263701 b!263706) bm!25245))

(assert (= (and b!263694 res!128768) b!263692))

(assert (= (and b!263692 c!45018) b!263708))

(assert (= (and b!263692 (not c!45018)) b!263691))

(assert (= (and b!263708 res!128775) b!263699))

(assert (= (or b!263708 b!263691) bm!25241))

(declare-fun b_lambda!8349 () Bool)

(assert (=> (not b_lambda!8349) (not b!263690)))

(declare-fun t!8935 () Bool)

(declare-fun tb!3039 () Bool)

(assert (=> (and b!262934 (= (defaultEntry!4843 thiss!1504) (defaultEntry!4843 lt!133015)) t!8935) tb!3039))

(declare-fun result!5439 () Bool)

(assert (=> tb!3039 (= result!5439 tp_is_empty!6657)))

(assert (=> b!263690 t!8935))

(declare-fun b_and!13955 () Bool)

(assert (= b_and!13953 (and (=> t!8935 result!5439) b_and!13955)))

(declare-fun m!280069 () Bool)

(assert (=> bm!25244 m!280069))

(assert (=> b!263705 m!279591))

(assert (=> b!263705 m!279591))

(assert (=> b!263705 m!279593))

(assert (=> b!263709 m!279591))

(assert (=> b!263709 m!279591))

(assert (=> b!263709 m!279593))

(declare-fun m!280071 () Bool)

(assert (=> bm!25245 m!280071))

(declare-fun m!280073 () Bool)

(assert (=> bm!25240 m!280073))

(declare-fun m!280075 () Bool)

(assert (=> b!263693 m!280075))

(assert (=> d!63381 m!279757))

(declare-fun m!280077 () Bool)

(assert (=> bm!25241 m!280077))

(assert (=> b!263703 m!279591))

(assert (=> b!263703 m!279591))

(declare-fun m!280079 () Bool)

(assert (=> b!263703 m!280079))

(declare-fun m!280081 () Bool)

(assert (=> b!263698 m!280081))

(declare-fun m!280083 () Bool)

(assert (=> b!263696 m!280083))

(declare-fun m!280085 () Bool)

(assert (=> b!263696 m!280085))

(declare-fun m!280087 () Bool)

(assert (=> b!263696 m!280087))

(declare-fun m!280089 () Bool)

(assert (=> b!263696 m!280089))

(declare-fun m!280091 () Bool)

(assert (=> b!263696 m!280091))

(assert (=> b!263696 m!280087))

(assert (=> b!263696 m!279591))

(declare-fun m!280093 () Bool)

(assert (=> b!263696 m!280093))

(assert (=> b!263696 m!280091))

(declare-fun m!280095 () Bool)

(assert (=> b!263696 m!280095))

(declare-fun m!280097 () Bool)

(assert (=> b!263696 m!280097))

(assert (=> b!263696 m!280083))

(declare-fun m!280099 () Bool)

(assert (=> b!263696 m!280099))

(assert (=> b!263696 m!280073))

(declare-fun m!280101 () Bool)

(assert (=> b!263696 m!280101))

(declare-fun m!280103 () Bool)

(assert (=> b!263696 m!280103))

(declare-fun m!280105 () Bool)

(assert (=> b!263696 m!280105))

(assert (=> b!263696 m!280103))

(declare-fun m!280107 () Bool)

(assert (=> b!263696 m!280107))

(declare-fun m!280109 () Bool)

(assert (=> b!263696 m!280109))

(declare-fun m!280111 () Bool)

(assert (=> b!263696 m!280111))

(declare-fun m!280113 () Bool)

(assert (=> b!263699 m!280113))

(assert (=> b!263690 m!279591))

(declare-fun m!280115 () Bool)

(assert (=> b!263690 m!280115))

(declare-fun m!280117 () Bool)

(assert (=> b!263690 m!280117))

(declare-fun m!280119 () Bool)

(assert (=> b!263690 m!280119))

(declare-fun m!280121 () Bool)

(assert (=> b!263690 m!280121))

(assert (=> b!263690 m!280119))

(assert (=> b!263690 m!280117))

(assert (=> b!263690 m!279591))

(assert (=> d!63085 d!63381))

(declare-fun d!63383 () Bool)

(declare-fun e!170872 () Bool)

(assert (=> d!63383 e!170872))

(declare-fun res!128777 () Bool)

(assert (=> d!63383 (=> res!128777 e!170872)))

(declare-fun lt!133520 () Bool)

(assert (=> d!63383 (= res!128777 (not lt!133520))))

(declare-fun lt!133519 () Bool)

(assert (=> d!63383 (= lt!133520 lt!133519)))

(declare-fun lt!133521 () Unit!8190)

(declare-fun e!170873 () Unit!8190)

(assert (=> d!63383 (= lt!133521 e!170873)))

(declare-fun c!45021 () Bool)

(assert (=> d!63383 (= c!45021 lt!133519)))

(assert (=> d!63383 (= lt!133519 (containsKey!312 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63383 (= (contains!1912 lt!133201 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) lt!133520)))

(declare-fun b!263710 () Bool)

(declare-fun lt!133522 () Unit!8190)

(assert (=> b!263710 (= e!170873 lt!133522)))

(assert (=> b!263710 (= lt!133522 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263710 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263711 () Bool)

(declare-fun Unit!8217 () Unit!8190)

(assert (=> b!263711 (= e!170873 Unit!8217)))

(declare-fun b!263712 () Bool)

(assert (=> b!263712 (= e!170872 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!63383 c!45021) b!263710))

(assert (= (and d!63383 (not c!45021)) b!263711))

(assert (= (and d!63383 (not res!128777)) b!263712))

(assert (=> d!63383 m!279199))

(declare-fun m!280123 () Bool)

(assert (=> d!63383 m!280123))

(assert (=> b!263710 m!279199))

(declare-fun m!280125 () Bool)

(assert (=> b!263710 m!280125))

(assert (=> b!263710 m!279199))

(assert (=> b!263710 m!279533))

(assert (=> b!263710 m!279533))

(declare-fun m!280127 () Bool)

(assert (=> b!263710 m!280127))

(assert (=> b!263712 m!279199))

(assert (=> b!263712 m!279533))

(assert (=> b!263712 m!279533))

(assert (=> b!263712 m!280127))

(assert (=> b!263127 d!63383))

(assert (=> b!263250 d!63189))

(assert (=> bm!25190 d!63337))

(assert (=> d!63129 d!63181))

(declare-fun d!63385 () Bool)

(assert (=> d!63385 (= (arrayCountValidKeys!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7035 thiss!1504) #b00000000000000000000000000000000 (size!6350 (_keys!7035 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!63385 true))

(declare-fun _$84!48 () Unit!8190)

(assert (=> d!63385 (= (choose!1 (_keys!7035 thiss!1504) index!297 key!932) _$84!48)))

(declare-fun bs!9282 () Bool)

(assert (= bs!9282 d!63385))

(assert (=> bs!9282 m!279017))

(assert (=> bs!9282 m!279265))

(assert (=> bs!9282 m!279019))

(assert (=> d!63103 d!63385))

(declare-fun condMapEmpty!11357 () Bool)

(declare-fun mapDefault!11357 () ValueCell!2985)

(assert (=> mapNonEmpty!11356 (= condMapEmpty!11357 (= mapRest!11356 ((as const (Array (_ BitVec 32) ValueCell!2985)) mapDefault!11357)))))

(declare-fun e!170874 () Bool)

(declare-fun mapRes!11357 () Bool)

(assert (=> mapNonEmpty!11356 (= tp!23731 (and e!170874 mapRes!11357))))

(declare-fun b!263714 () Bool)

(assert (=> b!263714 (= e!170874 tp_is_empty!6657)))

(declare-fun mapIsEmpty!11357 () Bool)

(assert (=> mapIsEmpty!11357 mapRes!11357))

(declare-fun mapNonEmpty!11357 () Bool)

(declare-fun tp!23732 () Bool)

(declare-fun e!170875 () Bool)

(assert (=> mapNonEmpty!11357 (= mapRes!11357 (and tp!23732 e!170875))))

(declare-fun mapKey!11357 () (_ BitVec 32))

(declare-fun mapRest!11357 () (Array (_ BitVec 32) ValueCell!2985))

(declare-fun mapValue!11357 () ValueCell!2985)

(assert (=> mapNonEmpty!11357 (= mapRest!11356 (store mapRest!11357 mapKey!11357 mapValue!11357))))

(declare-fun b!263713 () Bool)

(assert (=> b!263713 (= e!170875 tp_is_empty!6657)))

(assert (= (and mapNonEmpty!11356 condMapEmpty!11357) mapIsEmpty!11357))

(assert (= (and mapNonEmpty!11356 (not condMapEmpty!11357)) mapNonEmpty!11357))

(assert (= (and mapNonEmpty!11357 ((_ is ValueCellFull!2985) mapValue!11357)) b!263713))

(assert (= (and mapNonEmpty!11356 ((_ is ValueCellFull!2985) mapDefault!11357)) b!263714))

(declare-fun m!280129 () Bool)

(assert (=> mapNonEmpty!11357 m!280129))

(declare-fun b_lambda!8351 () Bool)

(assert (= b_lambda!8343 (or (and b!262934 b_free!6795) b_lambda!8351)))

(declare-fun b_lambda!8353 () Bool)

(assert (= b_lambda!8347 (or (and b!262934 b_free!6795) b_lambda!8353)))

(declare-fun b_lambda!8355 () Bool)

(assert (= b_lambda!8345 (or (and b!262934 b_free!6795) b_lambda!8355)))

(declare-fun b_lambda!8357 () Bool)

(assert (= b_lambda!8341 (or (and b!262934 b_free!6795) b_lambda!8357)))

(declare-fun b_lambda!8359 () Bool)

(assert (= b_lambda!8339 (or (and b!262934 b_free!6795) b_lambda!8359)))

(check-sat (not b!263301) (not bm!25210) (not d!63221) (not b!263645) (not d!63353) (not d!63191) (not d!63259) (not d!63159) (not b!263355) (not b!263654) (not d!63157) (not d!63297) (not b!263693) (not b!263522) (not d!63383) (not bm!25232) (not b!263368) (not d!63143) (not b!263525) (not b!263304) (not b!263635) (not b!263656) (not b!263687) (not b!263640) (not b!263273) (not b_lambda!8355) (not b!263559) (not b!263574) (not d!63235) (not b!263455) (not b!263325) (not b!263328) (not d!63271) (not d!63313) (not b!263531) (not b!263648) (not b!263285) (not d!63199) (not b_lambda!8349) (not d!63179) (not bm!25244) (not d!63303) (not d!63351) (not b!263642) (not b!263432) (not b!263652) (not d!63369) (not b!263468) (not bm!25209) (not b!263584) (not b!263590) (not b!263433) (not b!263327) (not b!263370) (not d!63339) (not b!263657) (not d!63301) (not b!263679) (not b!263372) (not d!63343) (not b!263578) (not bm!25233) (not b!263703) (not b_next!6795) (not b!263466) (not b!263556) (not b!263302) (not b!263323) (not b!263681) (not b!263563) (not bm!25228) (not b!263580) (not b!263608) (not b!263436) (not bm!25216) (not b!263438) (not b!263329) (not b!263663) (not bm!25231) (not d!63305) (not b!263575) (not b!263399) (not d!63219) (not b!263429) (not b_lambda!8357) (not b!263515) (not b!263268) (not b!263477) (not b!263666) (not b!263685) (not b!263532) (not b!263319) (not d!63345) (not b!263579) (not bm!25239) (not d!63285) (not b!263269) (not d!63267) (not bm!25206) (not b!263357) (not b!263712) (not bm!25240) (not b!263613) (not d!63177) (not b!263699) (not d!63169) (not d!63243) (not b!263690) (not b!263696) (not b!263474) (not b!263623) (not b!263658) (not b!263294) (not d!63197) (not d!63295) (not d!63331) (not b!263602) (not bm!25219) (not b!263444) (not d!63163) (not d!63329) tp_is_empty!6657 (not b!263626) (not d!63233) (not d!63287) (not b!263710) (not bm!25204) (not b_lambda!8337) (not bm!25230) (not b_lambda!8353) (not b!263308) (not d!63309) (not d!63365) (not b!263625) (not d!63145) b_and!13955 (not d!63291) (not d!63273) (not d!63167) (not b!263630) (not d!63225) (not b!263457) (not b!263585) (not b!263486) (not b!263617) (not d!63203) (not b!263278) (not d!63151) (not b!263612) (not b!263375) (not d!63361) (not b!263600) (not d!63363) (not b!263610) (not d!63293) (not b!263431) (not b!263577) (not bm!25197) (not b!263637) (not b!263271) (not b!263588) (not d!63311) (not d!63229) (not b_lambda!8351) (not d!63281) (not b!263292) (not d!63207) (not b!263428) (not d!63187) (not b!263446) (not d!63175) (not b!263621) (not bm!25229) (not d!63357) (not b!263673) (not b!263660) (not bm!25213) (not b!263518) (not bm!25212) (not b!263650) (not b!263461) (not b!263705) (not d!63257) (not bm!25199) (not d!63373) (not b!263459) (not b!263469) (not b!263636) (not b!263448) (not b!263582) (not d!63315) (not d!63217) (not b!263647) (not bm!25245) (not b_lambda!8359) (not b!263634) (not d!63289) (not b!263616) (not b_lambda!8335) (not d!63347) (not d!63317) (not b!263359) (not b!263354) (not b!263493) (not b!263651) (not b!263649) (not b!263620) (not b!263709) (not b!263373) (not d!63201) (not b!263683) (not b!263667) (not d!63253) (not bm!25217) (not bm!25241) (not bm!25205) (not d!63337) (not b!263441) (not b!263291) (not b!263450) (not b!263447) (not d!63241) (not b!263698) (not d!63261) (not d!63371) (not d!63185) (not d!63355) (not b!263670) (not d!63359) (not bm!25236) (not d!63385) (not b!263361) (not bm!25237) (not bm!25211) (not d!63381) (not b!263479) (not d!63147) (not d!63307) (not b!263614) (not b!263367) (not d!63335) (not b!263599) (not b!263471) (not b!263520) (not d!63319) (not b!263513) (not b!263507) (not bm!25198) (not b!263638) (not b!263665) (not d!63341) (not d!63333) (not b!263452) (not d!63349) (not b!263553) (not b!263427) (not d!63299) (not d!63237) (not d!63251) (not b!263490) (not b!263597) (not b!263615) (not b!263480) (not b!263641) (not b!263267) (not mapNonEmpty!11357) (not b!263564) (not bm!25238) (not b!263593) (not b!263484) (not d!63247) (not d!63323) (not b!263366))
(check-sat b_and!13955 (not b_next!6795))
(get-model)

(declare-fun d!63387 () Bool)

(declare-fun lt!133523 () SeekEntryResult!1200)

(assert (=> d!63387 (and (or ((_ is Undefined!1200) lt!133523) (not ((_ is Found!1200) lt!133523)) (and (bvsge (index!6971 lt!133523) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133523) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133523) ((_ is Found!1200) lt!133523) (not ((_ is MissingVacant!1200) lt!133523)) (not (= (index!6973 lt!133523) (index!6972 lt!133283))) (and (bvsge (index!6973 lt!133523) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133523) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133523) (ite ((_ is Found!1200) lt!133523) (= (select (arr!5999 lt!133026) (index!6971 lt!133523)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!1200) lt!133523) (= (index!6973 lt!133523) (index!6972 lt!133283)) (= (select (arr!5999 lt!133026) (index!6973 lt!133523)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!170878 () SeekEntryResult!1200)

(assert (=> d!63387 (= lt!133523 e!170878)))

(declare-fun c!45022 () Bool)

(assert (=> d!63387 (= c!45022 (bvsge (x!25242 lt!133283) #b01111111111111111111111111111110))))

(declare-fun lt!133524 () (_ BitVec 64))

(assert (=> d!63387 (= lt!133524 (select (arr!5999 lt!133026) (index!6972 lt!133283)))))

(assert (=> d!63387 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63387 (= (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133283) (index!6972 lt!133283) (index!6972 lt!133283) (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)) lt!133523)))

(declare-fun b!263715 () Bool)

(declare-fun e!170877 () SeekEntryResult!1200)

(assert (=> b!263715 (= e!170877 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25242 lt!133283) #b00000000000000000000000000000001) (nextIndex!0 (index!6972 lt!133283) (x!25242 lt!133283) (mask!11209 thiss!1504)) (index!6972 lt!133283) (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun b!263716 () Bool)

(assert (=> b!263716 (= e!170877 (MissingVacant!1200 (index!6972 lt!133283)))))

(declare-fun b!263717 () Bool)

(declare-fun c!45024 () Bool)

(assert (=> b!263717 (= c!45024 (= lt!133524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170876 () SeekEntryResult!1200)

(assert (=> b!263717 (= e!170876 e!170877)))

(declare-fun b!263718 () Bool)

(assert (=> b!263718 (= e!170878 e!170876)))

(declare-fun c!45023 () Bool)

(assert (=> b!263718 (= c!45023 (= lt!133524 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263719 () Bool)

(assert (=> b!263719 (= e!170876 (Found!1200 (index!6972 lt!133283)))))

(declare-fun b!263720 () Bool)

(assert (=> b!263720 (= e!170878 Undefined!1200)))

(assert (= (and d!63387 c!45022) b!263720))

(assert (= (and d!63387 (not c!45022)) b!263718))

(assert (= (and b!263718 c!45023) b!263719))

(assert (= (and b!263718 (not c!45023)) b!263717))

(assert (= (and b!263717 c!45024) b!263716))

(assert (= (and b!263717 (not c!45024)) b!263715))

(declare-fun m!280131 () Bool)

(assert (=> d!63387 m!280131))

(declare-fun m!280133 () Bool)

(assert (=> d!63387 m!280133))

(assert (=> d!63387 m!279431))

(assert (=> d!63387 m!279139))

(declare-fun m!280135 () Bool)

(assert (=> b!263715 m!280135))

(assert (=> b!263715 m!280135))

(assert (=> b!263715 m!279255))

(declare-fun m!280137 () Bool)

(assert (=> b!263715 m!280137))

(assert (=> b!263278 d!63387))

(declare-fun d!63389 () Bool)

(assert (=> d!63389 (= (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263493 d!63389))

(declare-fun d!63391 () Bool)

(assert (=> d!63391 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun lt!133525 () Unit!8190)

(assert (=> d!63391 (= lt!133525 (choose!1293 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun e!170879 () Bool)

(assert (=> d!63391 e!170879))

(declare-fun res!128778 () Bool)

(assert (=> d!63391 (=> (not res!128778) (not e!170879))))

(assert (=> d!63391 (= res!128778 (isStrictlySorted!377 (toList!1961 lt!133256)))))

(assert (=> d!63391 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) lt!133525)))

(declare-fun b!263721 () Bool)

(assert (=> b!263721 (= e!170879 (containsKey!312 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (= (and d!63391 res!128778) b!263721))

(assert (=> d!63391 m!279255))

(assert (=> d!63391 m!279423))

(assert (=> d!63391 m!279423))

(assert (=> d!63391 m!279425))

(assert (=> d!63391 m!279255))

(declare-fun m!280139 () Bool)

(assert (=> d!63391 m!280139))

(declare-fun m!280141 () Bool)

(assert (=> d!63391 m!280141))

(assert (=> b!263721 m!279255))

(assert (=> b!263721 m!279419))

(assert (=> b!263269 d!63391))

(declare-fun d!63393 () Bool)

(assert (=> d!63393 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))))

(declare-fun bs!9283 () Bool)

(assert (= bs!9283 d!63393))

(assert (=> bs!9283 m!279423))

(declare-fun m!280143 () Bool)

(assert (=> bs!9283 m!280143))

(assert (=> b!263269 d!63393))

(declare-fun b!263724 () Bool)

(declare-fun e!170881 () Option!326)

(assert (=> b!263724 (= e!170881 (getValueByKey!320 (t!8929 (toList!1961 lt!133256)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!263722 () Bool)

(declare-fun e!170880 () Option!326)

(assert (=> b!263722 (= e!170880 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133256)))))))

(declare-fun d!63395 () Bool)

(declare-fun c!45025 () Bool)

(assert (=> d!63395 (= c!45025 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (= (_1!2500 (h!4514 (toList!1961 lt!133256))) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(assert (=> d!63395 (= (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) e!170880)))

(declare-fun b!263725 () Bool)

(assert (=> b!263725 (= e!170881 None!324)))

(declare-fun b!263723 () Bool)

(assert (=> b!263723 (= e!170880 e!170881)))

(declare-fun c!45026 () Bool)

(assert (=> b!263723 (= c!45026 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133256))) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))))

(assert (= (and d!63395 c!45025) b!263722))

(assert (= (and d!63395 (not c!45025)) b!263723))

(assert (= (and b!263723 c!45026) b!263724))

(assert (= (and b!263723 (not c!45026)) b!263725))

(assert (=> b!263724 m!279255))

(declare-fun m!280145 () Bool)

(assert (=> b!263724 m!280145))

(assert (=> b!263269 d!63395))

(declare-fun b!263726 () Bool)

(declare-fun e!170882 () (_ BitVec 32))

(assert (=> b!263726 (= e!170882 #b00000000000000000000000000000000)))

(declare-fun b!263728 () Bool)

(declare-fun e!170883 () (_ BitVec 32))

(assert (=> b!263728 (= e!170882 e!170883)))

(declare-fun c!45028 () Bool)

(assert (=> b!263728 (= c!45028 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!263729 () Bool)

(declare-fun call!25250 () (_ BitVec 32))

(assert (=> b!263729 (= e!170883 call!25250)))

(declare-fun bm!25247 () Bool)

(assert (=> bm!25247 (= call!25250 (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!63397 () Bool)

(declare-fun lt!133526 () (_ BitVec 32))

(assert (=> d!63397 (and (bvsge lt!133526 #b00000000000000000000000000000000) (bvsle lt!133526 (bvsub (size!6350 lt!133026) (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63397 (= lt!133526 e!170882)))

(declare-fun c!45027 () Bool)

(assert (=> d!63397 (= c!45027 (bvsge (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63397 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6350 lt!133026)))))

(assert (=> d!63397 (= (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!133526)))

(declare-fun b!263727 () Bool)

(assert (=> b!263727 (= e!170883 (bvadd #b00000000000000000000000000000001 call!25250))))

(assert (= (and d!63397 c!45027) b!263726))

(assert (= (and d!63397 (not c!45027)) b!263728))

(assert (= (and b!263728 c!45028) b!263727))

(assert (= (and b!263728 (not c!45028)) b!263729))

(assert (= (or b!263727 b!263729) bm!25247))

(declare-fun m!280147 () Bool)

(assert (=> b!263728 m!280147))

(assert (=> b!263728 m!280147))

(declare-fun m!280149 () Bool)

(assert (=> b!263728 m!280149))

(declare-fun m!280151 () Bool)

(assert (=> bm!25247 m!280151))

(assert (=> bm!25199 d!63397))

(declare-fun d!63399 () Bool)

(declare-fun e!170884 () Bool)

(assert (=> d!63399 e!170884))

(declare-fun res!128779 () Bool)

(assert (=> d!63399 (=> res!128779 e!170884)))

(declare-fun lt!133528 () Bool)

(assert (=> d!63399 (= res!128779 (not lt!133528))))

(declare-fun lt!133527 () Bool)

(assert (=> d!63399 (= lt!133528 lt!133527)))

(declare-fun lt!133529 () Unit!8190)

(declare-fun e!170885 () Unit!8190)

(assert (=> d!63399 (= lt!133529 e!170885)))

(declare-fun c!45029 () Bool)

(assert (=> d!63399 (= c!45029 lt!133527)))

(assert (=> d!63399 (= lt!133527 (containsKey!312 (toList!1961 lt!133420) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63399 (= (contains!1912 lt!133420 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133528)))

(declare-fun b!263730 () Bool)

(declare-fun lt!133530 () Unit!8190)

(assert (=> b!263730 (= e!170885 lt!133530)))

(assert (=> b!263730 (= lt!133530 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133420) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> b!263730 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133420) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263731 () Bool)

(declare-fun Unit!8218 () Unit!8190)

(assert (=> b!263731 (= e!170885 Unit!8218)))

(declare-fun b!263732 () Bool)

(assert (=> b!263732 (= e!170884 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133420) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63399 c!45029) b!263730))

(assert (= (and d!63399 (not c!45029)) b!263731))

(assert (= (and d!63399 (not res!128779)) b!263732))

(declare-fun m!280153 () Bool)

(assert (=> d!63399 m!280153))

(declare-fun m!280155 () Bool)

(assert (=> b!263730 m!280155))

(assert (=> b!263730 m!279779))

(assert (=> b!263730 m!279779))

(declare-fun m!280157 () Bool)

(assert (=> b!263730 m!280157))

(assert (=> b!263732 m!279779))

(assert (=> b!263732 m!279779))

(assert (=> b!263732 m!280157))

(assert (=> d!63267 d!63399))

(declare-fun b!263735 () Bool)

(declare-fun e!170887 () Option!326)

(assert (=> b!263735 (= e!170887 (getValueByKey!320 (t!8929 lt!133421) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263733 () Bool)

(declare-fun e!170886 () Option!326)

(assert (=> b!263733 (= e!170886 (Some!325 (_2!2500 (h!4514 lt!133421))))))

(declare-fun d!63401 () Bool)

(declare-fun c!45030 () Bool)

(assert (=> d!63401 (= c!45030 (and ((_ is Cons!3848) lt!133421) (= (_1!2500 (h!4514 lt!133421)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63401 (= (getValueByKey!320 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) e!170886)))

(declare-fun b!263736 () Bool)

(assert (=> b!263736 (= e!170887 None!324)))

(declare-fun b!263734 () Bool)

(assert (=> b!263734 (= e!170886 e!170887)))

(declare-fun c!45031 () Bool)

(assert (=> b!263734 (= c!45031 (and ((_ is Cons!3848) lt!133421) (not (= (_1!2500 (h!4514 lt!133421)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63401 c!45030) b!263733))

(assert (= (and d!63401 (not c!45030)) b!263734))

(assert (= (and b!263734 c!45031) b!263735))

(assert (= (and b!263734 (not c!45031)) b!263736))

(declare-fun m!280159 () Bool)

(assert (=> b!263735 m!280159))

(assert (=> d!63267 d!63401))

(declare-fun d!63403 () Bool)

(assert (=> d!63403 (= (getValueByKey!320 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133531 () Unit!8190)

(assert (=> d!63403 (= lt!133531 (choose!1294 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun e!170888 () Bool)

(assert (=> d!63403 e!170888))

(declare-fun res!128780 () Bool)

(assert (=> d!63403 (=> (not res!128780) (not e!170888))))

(assert (=> d!63403 (= res!128780 (isStrictlySorted!377 lt!133421))))

(assert (=> d!63403 (= (lemmaContainsTupThenGetReturnValue!176 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133531)))

(declare-fun b!263737 () Bool)

(declare-fun res!128781 () Bool)

(assert (=> b!263737 (=> (not res!128781) (not e!170888))))

(assert (=> b!263737 (= res!128781 (containsKey!312 lt!133421 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263738 () Bool)

(assert (=> b!263738 (= e!170888 (contains!1914 lt!133421 (tuple2!4979 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63403 res!128780) b!263737))

(assert (= (and b!263737 res!128781) b!263738))

(assert (=> d!63403 m!279773))

(declare-fun m!280161 () Bool)

(assert (=> d!63403 m!280161))

(declare-fun m!280163 () Bool)

(assert (=> d!63403 m!280163))

(declare-fun m!280165 () Bool)

(assert (=> b!263737 m!280165))

(declare-fun m!280167 () Bool)

(assert (=> b!263738 m!280167))

(assert (=> d!63267 d!63403))

(declare-fun bm!25248 () Bool)

(declare-fun call!25253 () List!3852)

(declare-fun call!25252 () List!3852)

(assert (=> bm!25248 (= call!25253 call!25252)))

(declare-fun bm!25249 () Bool)

(declare-fun call!25251 () List!3852)

(assert (=> bm!25249 (= call!25251 call!25253)))

(declare-fun b!263739 () Bool)

(declare-fun res!128782 () Bool)

(declare-fun e!170893 () Bool)

(assert (=> b!263739 (=> (not res!128782) (not e!170893))))

(declare-fun lt!133532 () List!3852)

(assert (=> b!263739 (= res!128782 (containsKey!312 lt!133532 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263740 () Bool)

(declare-fun c!45032 () Bool)

(assert (=> b!263740 (= c!45032 (and ((_ is Cons!3848) (toList!1961 call!25199)) (bvsgt (_1!2500 (h!4514 (toList!1961 call!25199))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun e!170892 () List!3852)

(declare-fun e!170889 () List!3852)

(assert (=> b!263740 (= e!170892 e!170889)))

(declare-fun b!263741 () Bool)

(declare-fun e!170891 () List!3852)

(assert (=> b!263741 (= e!170891 e!170892)))

(declare-fun c!45035 () Bool)

(assert (=> b!263741 (= c!45035 (and ((_ is Cons!3848) (toList!1961 call!25199)) (= (_1!2500 (h!4514 (toList!1961 call!25199))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!263742 () Bool)

(assert (=> b!263742 (= e!170893 (contains!1914 lt!133532 (tuple2!4979 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!263743 () Bool)

(assert (=> b!263743 (= e!170891 call!25252)))

(declare-fun b!263744 () Bool)

(assert (=> b!263744 (= e!170892 call!25253)))

(declare-fun b!263745 () Bool)

(declare-fun e!170890 () List!3852)

(assert (=> b!263745 (= e!170890 (insertStrictlySorted!179 (t!8929 (toList!1961 call!25199)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263746 () Bool)

(assert (=> b!263746 (= e!170889 call!25251)))

(declare-fun c!45034 () Bool)

(declare-fun bm!25250 () Bool)

(assert (=> bm!25250 (= call!25252 ($colon$colon!108 e!170890 (ite c!45034 (h!4514 (toList!1961 call!25199)) (tuple2!4979 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun c!45033 () Bool)

(assert (=> bm!25250 (= c!45033 c!45034)))

(declare-fun d!63405 () Bool)

(assert (=> d!63405 e!170893))

(declare-fun res!128783 () Bool)

(assert (=> d!63405 (=> (not res!128783) (not e!170893))))

(assert (=> d!63405 (= res!128783 (isStrictlySorted!377 lt!133532))))

(assert (=> d!63405 (= lt!133532 e!170891)))

(assert (=> d!63405 (= c!45034 (and ((_ is Cons!3848) (toList!1961 call!25199)) (bvslt (_1!2500 (h!4514 (toList!1961 call!25199))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63405 (isStrictlySorted!377 (toList!1961 call!25199))))

(assert (=> d!63405 (= (insertStrictlySorted!179 (toList!1961 call!25199) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133532)))

(declare-fun b!263747 () Bool)

(assert (=> b!263747 (= e!170889 call!25251)))

(declare-fun b!263748 () Bool)

(assert (=> b!263748 (= e!170890 (ite c!45035 (t!8929 (toList!1961 call!25199)) (ite c!45032 (Cons!3848 (h!4514 (toList!1961 call!25199)) (t!8929 (toList!1961 call!25199))) Nil!3849)))))

(assert (= (and d!63405 c!45034) b!263743))

(assert (= (and d!63405 (not c!45034)) b!263741))

(assert (= (and b!263741 c!45035) b!263744))

(assert (= (and b!263741 (not c!45035)) b!263740))

(assert (= (and b!263740 c!45032) b!263747))

(assert (= (and b!263740 (not c!45032)) b!263746))

(assert (= (or b!263747 b!263746) bm!25249))

(assert (= (or b!263744 bm!25249) bm!25248))

(assert (= (or b!263743 bm!25248) bm!25250))

(assert (= (and bm!25250 c!45033) b!263745))

(assert (= (and bm!25250 (not c!45033)) b!263748))

(assert (= (and d!63405 res!128783) b!263739))

(assert (= (and b!263739 res!128782) b!263742))

(declare-fun m!280169 () Bool)

(assert (=> bm!25250 m!280169))

(declare-fun m!280171 () Bool)

(assert (=> b!263745 m!280171))

(declare-fun m!280173 () Bool)

(assert (=> b!263742 m!280173))

(declare-fun m!280175 () Bool)

(assert (=> b!263739 m!280175))

(declare-fun m!280177 () Bool)

(assert (=> d!63405 m!280177))

(declare-fun m!280179 () Bool)

(assert (=> d!63405 m!280179))

(assert (=> d!63267 d!63405))

(declare-fun b!263749 () Bool)

(declare-fun e!170894 () Bool)

(assert (=> b!263749 (= e!170894 (contains!1915 (ite c!44948 (Cons!3849 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) Nil!3850) Nil!3850) (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263751 () Bool)

(declare-fun e!170897 () Bool)

(declare-fun call!25254 () Bool)

(assert (=> b!263751 (= e!170897 call!25254)))

(declare-fun b!263752 () Bool)

(declare-fun e!170895 () Bool)

(assert (=> b!263752 (= e!170895 e!170897)))

(declare-fun c!45036 () Bool)

(assert (=> b!263752 (= c!45036 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263750 () Bool)

(declare-fun e!170896 () Bool)

(assert (=> b!263750 (= e!170896 e!170895)))

(declare-fun res!128785 () Bool)

(assert (=> b!263750 (=> (not res!128785) (not e!170895))))

(assert (=> b!263750 (= res!128785 (not e!170894))))

(declare-fun res!128786 () Bool)

(assert (=> b!263750 (=> (not res!128786) (not e!170894))))

(assert (=> b!263750 (= res!128786 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63407 () Bool)

(declare-fun res!128784 () Bool)

(assert (=> d!63407 (=> res!128784 e!170896)))

(assert (=> d!63407 (= res!128784 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63407 (= (arrayNoDuplicates!0 (_keys!7035 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44948 (Cons!3849 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) e!170896)))

(declare-fun bm!25251 () Bool)

(assert (=> bm!25251 (= call!25254 (arrayNoDuplicates!0 (_keys!7035 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45036 (Cons!3849 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44948 (Cons!3849 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44948 (Cons!3849 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) Nil!3850) Nil!3850))))))

(declare-fun b!263753 () Bool)

(assert (=> b!263753 (= e!170897 call!25254)))

(assert (= (and d!63407 (not res!128784)) b!263750))

(assert (= (and b!263750 res!128786) b!263749))

(assert (= (and b!263750 res!128785) b!263752))

(assert (= (and b!263752 c!45036) b!263751))

(assert (= (and b!263752 (not c!45036)) b!263753))

(assert (= (or b!263751 b!263753) bm!25251))

(declare-fun m!280181 () Bool)

(assert (=> b!263749 m!280181))

(assert (=> b!263749 m!280181))

(declare-fun m!280183 () Bool)

(assert (=> b!263749 m!280183))

(assert (=> b!263752 m!280181))

(assert (=> b!263752 m!280181))

(declare-fun m!280185 () Bool)

(assert (=> b!263752 m!280185))

(assert (=> b!263750 m!280181))

(assert (=> b!263750 m!280181))

(assert (=> b!263750 m!280185))

(assert (=> bm!25251 m!280181))

(declare-fun m!280187 () Bool)

(assert (=> bm!25251 m!280187))

(assert (=> bm!25211 d!63407))

(assert (=> d!63281 d!63279))

(declare-fun d!63409 () Bool)

(assert (=> d!63409 (= (apply!262 (+!710 lt!133514 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))) lt!133497) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133514 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))) lt!133497)))))

(declare-fun bs!9284 () Bool)

(assert (= bs!9284 d!63409))

(declare-fun m!280189 () Bool)

(assert (=> bs!9284 m!280189))

(assert (=> bs!9284 m!280189))

(declare-fun m!280191 () Bool)

(assert (=> bs!9284 m!280191))

(assert (=> b!263696 d!63409))

(declare-fun d!63411 () Bool)

(assert (=> d!63411 (= (apply!262 (+!710 lt!133510 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))) lt!133501) (apply!262 lt!133510 lt!133501))))

(declare-fun lt!133533 () Unit!8190)

(assert (=> d!63411 (= lt!133533 (choose!1295 lt!133510 lt!133499 (minValue!4684 lt!133015) lt!133501))))

(declare-fun e!170898 () Bool)

(assert (=> d!63411 e!170898))

(declare-fun res!128787 () Bool)

(assert (=> d!63411 (=> (not res!128787) (not e!170898))))

(assert (=> d!63411 (= res!128787 (contains!1912 lt!133510 lt!133501))))

(assert (=> d!63411 (= (addApplyDifferent!238 lt!133510 lt!133499 (minValue!4684 lt!133015) lt!133501) lt!133533)))

(declare-fun b!263754 () Bool)

(assert (=> b!263754 (= e!170898 (not (= lt!133501 lt!133499)))))

(assert (= (and d!63411 res!128787) b!263754))

(assert (=> d!63411 m!280109))

(assert (=> d!63411 m!280103))

(assert (=> d!63411 m!280103))

(assert (=> d!63411 m!280107))

(declare-fun m!280193 () Bool)

(assert (=> d!63411 m!280193))

(declare-fun m!280195 () Bool)

(assert (=> d!63411 m!280195))

(assert (=> b!263696 d!63411))

(declare-fun d!63413 () Bool)

(declare-fun e!170899 () Bool)

(assert (=> d!63413 e!170899))

(declare-fun res!128788 () Bool)

(assert (=> d!63413 (=> (not res!128788) (not e!170899))))

(declare-fun lt!133536 () ListLongMap!3891)

(assert (=> d!63413 (= res!128788 (contains!1912 lt!133536 (_1!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))))))

(declare-fun lt!133537 () List!3852)

(assert (=> d!63413 (= lt!133536 (ListLongMap!3892 lt!133537))))

(declare-fun lt!133535 () Unit!8190)

(declare-fun lt!133534 () Unit!8190)

(assert (=> d!63413 (= lt!133535 lt!133534)))

(assert (=> d!63413 (= (getValueByKey!320 lt!133537 (_1!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))))))

(assert (=> d!63413 (= lt!133534 (lemmaContainsTupThenGetReturnValue!176 lt!133537 (_1!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))))))

(assert (=> d!63413 (= lt!133537 (insertStrictlySorted!179 (toList!1961 lt!133518) (_1!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))))))

(assert (=> d!63413 (= (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))) lt!133536)))

(declare-fun b!263755 () Bool)

(declare-fun res!128789 () Bool)

(assert (=> b!263755 (=> (not res!128789) (not e!170899))))

(assert (=> b!263755 (= res!128789 (= (getValueByKey!320 (toList!1961 lt!133536) (_1!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))))))))

(declare-fun b!263756 () Bool)

(assert (=> b!263756 (= e!170899 (contains!1914 (toList!1961 lt!133536) (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))))))

(assert (= (and d!63413 res!128788) b!263755))

(assert (= (and b!263755 res!128789) b!263756))

(declare-fun m!280197 () Bool)

(assert (=> d!63413 m!280197))

(declare-fun m!280199 () Bool)

(assert (=> d!63413 m!280199))

(declare-fun m!280201 () Bool)

(assert (=> d!63413 m!280201))

(declare-fun m!280203 () Bool)

(assert (=> d!63413 m!280203))

(declare-fun m!280205 () Bool)

(assert (=> b!263755 m!280205))

(declare-fun m!280207 () Bool)

(assert (=> b!263756 m!280207))

(assert (=> b!263696 d!63413))

(declare-fun d!63415 () Bool)

(assert (=> d!63415 (contains!1912 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))) lt!133511)))

(declare-fun lt!133538 () Unit!8190)

(assert (=> d!63415 (= lt!133538 (choose!1296 lt!133518 lt!133498 (zeroValue!4684 lt!133015) lt!133511))))

(assert (=> d!63415 (contains!1912 lt!133518 lt!133511)))

(assert (=> d!63415 (= (addStillContains!238 lt!133518 lt!133498 (zeroValue!4684 lt!133015) lt!133511) lt!133538)))

(declare-fun bs!9285 () Bool)

(assert (= bs!9285 d!63415))

(assert (=> bs!9285 m!280087))

(assert (=> bs!9285 m!280087))

(assert (=> bs!9285 m!280089))

(declare-fun m!280209 () Bool)

(assert (=> bs!9285 m!280209))

(declare-fun m!280211 () Bool)

(assert (=> bs!9285 m!280211))

(assert (=> b!263696 d!63415))

(declare-fun d!63417 () Bool)

(assert (=> d!63417 (= (apply!262 (+!710 lt!133510 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))) lt!133501) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133510 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))) lt!133501)))))

(declare-fun bs!9286 () Bool)

(assert (= bs!9286 d!63417))

(declare-fun m!280213 () Bool)

(assert (=> bs!9286 m!280213))

(assert (=> bs!9286 m!280213))

(declare-fun m!280215 () Bool)

(assert (=> bs!9286 m!280215))

(assert (=> b!263696 d!63417))

(declare-fun d!63419 () Bool)

(assert (=> d!63419 (= (apply!262 lt!133514 lt!133497) (get!3094 (getValueByKey!320 (toList!1961 lt!133514) lt!133497)))))

(declare-fun bs!9287 () Bool)

(assert (= bs!9287 d!63419))

(declare-fun m!280217 () Bool)

(assert (=> bs!9287 m!280217))

(assert (=> bs!9287 m!280217))

(declare-fun m!280219 () Bool)

(assert (=> bs!9287 m!280219))

(assert (=> b!263696 d!63419))

(declare-fun d!63421 () Bool)

(declare-fun e!170900 () Bool)

(assert (=> d!63421 e!170900))

(declare-fun res!128790 () Bool)

(assert (=> d!63421 (=> (not res!128790) (not e!170900))))

(declare-fun lt!133541 () ListLongMap!3891)

(assert (=> d!63421 (= res!128790 (contains!1912 lt!133541 (_1!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))))))

(declare-fun lt!133542 () List!3852)

(assert (=> d!63421 (= lt!133541 (ListLongMap!3892 lt!133542))))

(declare-fun lt!133540 () Unit!8190)

(declare-fun lt!133539 () Unit!8190)

(assert (=> d!63421 (= lt!133540 lt!133539)))

(assert (=> d!63421 (= (getValueByKey!320 lt!133542 (_1!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))))))

(assert (=> d!63421 (= lt!133539 (lemmaContainsTupThenGetReturnValue!176 lt!133542 (_1!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))))))

(assert (=> d!63421 (= lt!133542 (insertStrictlySorted!179 (toList!1961 lt!133504) (_1!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))))))

(assert (=> d!63421 (= (+!710 lt!133504 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))) lt!133541)))

(declare-fun b!263757 () Bool)

(declare-fun res!128791 () Bool)

(assert (=> b!263757 (=> (not res!128791) (not e!170900))))

(assert (=> b!263757 (= res!128791 (= (getValueByKey!320 (toList!1961 lt!133541) (_1!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))))))))

(declare-fun b!263758 () Bool)

(assert (=> b!263758 (= e!170900 (contains!1914 (toList!1961 lt!133541) (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))))))

(assert (= (and d!63421 res!128790) b!263757))

(assert (= (and b!263757 res!128791) b!263758))

(declare-fun m!280221 () Bool)

(assert (=> d!63421 m!280221))

(declare-fun m!280223 () Bool)

(assert (=> d!63421 m!280223))

(declare-fun m!280225 () Bool)

(assert (=> d!63421 m!280225))

(declare-fun m!280227 () Bool)

(assert (=> d!63421 m!280227))

(declare-fun m!280229 () Bool)

(assert (=> b!263757 m!280229))

(declare-fun m!280231 () Bool)

(assert (=> b!263758 m!280231))

(assert (=> b!263696 d!63421))

(declare-fun d!63423 () Bool)

(declare-fun e!170901 () Bool)

(assert (=> d!63423 e!170901))

(declare-fun res!128792 () Bool)

(assert (=> d!63423 (=> res!128792 e!170901)))

(declare-fun lt!133544 () Bool)

(assert (=> d!63423 (= res!128792 (not lt!133544))))

(declare-fun lt!133543 () Bool)

(assert (=> d!63423 (= lt!133544 lt!133543)))

(declare-fun lt!133545 () Unit!8190)

(declare-fun e!170902 () Unit!8190)

(assert (=> d!63423 (= lt!133545 e!170902)))

(declare-fun c!45037 () Bool)

(assert (=> d!63423 (= c!45037 lt!133543)))

(assert (=> d!63423 (= lt!133543 (containsKey!312 (toList!1961 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))) lt!133511))))

(assert (=> d!63423 (= (contains!1912 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015))) lt!133511) lt!133544)))

(declare-fun b!263759 () Bool)

(declare-fun lt!133546 () Unit!8190)

(assert (=> b!263759 (= e!170902 lt!133546)))

(assert (=> b!263759 (= lt!133546 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))) lt!133511))))

(assert (=> b!263759 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))) lt!133511))))

(declare-fun b!263760 () Bool)

(declare-fun Unit!8219 () Unit!8190)

(assert (=> b!263760 (= e!170902 Unit!8219)))

(declare-fun b!263761 () Bool)

(assert (=> b!263761 (= e!170901 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133518 (tuple2!4979 lt!133498 (zeroValue!4684 lt!133015)))) lt!133511)))))

(assert (= (and d!63423 c!45037) b!263759))

(assert (= (and d!63423 (not c!45037)) b!263760))

(assert (= (and d!63423 (not res!128792)) b!263761))

(declare-fun m!280233 () Bool)

(assert (=> d!63423 m!280233))

(declare-fun m!280235 () Bool)

(assert (=> b!263759 m!280235))

(declare-fun m!280237 () Bool)

(assert (=> b!263759 m!280237))

(assert (=> b!263759 m!280237))

(declare-fun m!280239 () Bool)

(assert (=> b!263759 m!280239))

(assert (=> b!263761 m!280237))

(assert (=> b!263761 m!280237))

(assert (=> b!263761 m!280239))

(assert (=> b!263696 d!63423))

(declare-fun b!263762 () Bool)

(declare-fun e!170908 () Bool)

(declare-fun lt!133548 () ListLongMap!3891)

(assert (=> b!263762 (= e!170908 (= lt!133548 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 lt!133015))))))

(declare-fun b!263763 () Bool)

(declare-fun e!170906 () Bool)

(assert (=> b!263763 (= e!170906 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (=> b!263763 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263764 () Bool)

(declare-fun res!128793 () Bool)

(declare-fun e!170907 () Bool)

(assert (=> b!263764 (=> (not res!128793) (not e!170907))))

(assert (=> b!263764 (= res!128793 (not (contains!1912 lt!133548 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263765 () Bool)

(declare-fun e!170909 () Bool)

(assert (=> b!263765 (= e!170907 e!170909)))

(declare-fun c!45039 () Bool)

(assert (=> b!263765 (= c!45039 e!170906)))

(declare-fun res!128794 () Bool)

(assert (=> b!263765 (=> (not res!128794) (not e!170906))))

(assert (=> b!263765 (= res!128794 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun b!263766 () Bool)

(declare-fun e!170905 () ListLongMap!3891)

(declare-fun e!170903 () ListLongMap!3891)

(assert (=> b!263766 (= e!170905 e!170903)))

(declare-fun c!45041 () Bool)

(assert (=> b!263766 (= c!45041 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!263767 () Bool)

(assert (=> b!263767 (= e!170908 (isEmpty!541 lt!133548))))

(declare-fun bm!25252 () Bool)

(declare-fun call!25255 () ListLongMap!3891)

(assert (=> bm!25252 (= call!25255 (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 lt!133015)))))

(declare-fun d!63425 () Bool)

(assert (=> d!63425 e!170907))

(declare-fun res!128796 () Bool)

(assert (=> d!63425 (=> (not res!128796) (not e!170907))))

(assert (=> d!63425 (= res!128796 (not (contains!1912 lt!133548 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63425 (= lt!133548 e!170905)))

(declare-fun c!45038 () Bool)

(assert (=> d!63425 (= c!45038 (bvsge #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63425 (validMask!0 (mask!11209 lt!133015))))

(assert (=> d!63425 (= (getCurrentListMapNoExtraKeys!584 (_keys!7035 lt!133015) (_values!4826 lt!133015) (mask!11209 lt!133015) (extraKeys!4580 lt!133015) (zeroValue!4684 lt!133015) (minValue!4684 lt!133015) #b00000000000000000000000000000000 (defaultEntry!4843 lt!133015)) lt!133548)))

(declare-fun b!263768 () Bool)

(assert (=> b!263768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(assert (=> b!263768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 (_values!4826 lt!133015))))))

(declare-fun e!170904 () Bool)

(assert (=> b!263768 (= e!170904 (= (apply!262 lt!133548 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263769 () Bool)

(assert (=> b!263769 (= e!170909 e!170908)))

(declare-fun c!45040 () Bool)

(assert (=> b!263769 (= c!45040 (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun b!263770 () Bool)

(assert (=> b!263770 (= e!170905 (ListLongMap!3892 Nil!3849))))

(declare-fun b!263771 () Bool)

(declare-fun lt!133547 () Unit!8190)

(declare-fun lt!133550 () Unit!8190)

(assert (=> b!263771 (= lt!133547 lt!133550)))

(declare-fun lt!133549 () V!8523)

(declare-fun lt!133552 () (_ BitVec 64))

(declare-fun lt!133553 () ListLongMap!3891)

(declare-fun lt!133551 () (_ BitVec 64))

(assert (=> b!263771 (not (contains!1912 (+!710 lt!133553 (tuple2!4979 lt!133552 lt!133549)) lt!133551))))

(assert (=> b!263771 (= lt!133550 (addStillNotContains!129 lt!133553 lt!133552 lt!133549 lt!133551))))

(assert (=> b!263771 (= lt!133551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263771 (= lt!133549 (get!3093 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263771 (= lt!133552 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))

(assert (=> b!263771 (= lt!133553 call!25255)))

(assert (=> b!263771 (= e!170903 (+!710 call!25255 (tuple2!4979 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263772 () Bool)

(assert (=> b!263772 (= e!170903 call!25255)))

(declare-fun b!263773 () Bool)

(assert (=> b!263773 (= e!170909 e!170904)))

(assert (=> b!263773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (_keys!7035 lt!133015))))))

(declare-fun res!128795 () Bool)

(assert (=> b!263773 (= res!128795 (contains!1912 lt!133548 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (=> b!263773 (=> (not res!128795) (not e!170904))))

(assert (= (and d!63425 c!45038) b!263770))

(assert (= (and d!63425 (not c!45038)) b!263766))

(assert (= (and b!263766 c!45041) b!263771))

(assert (= (and b!263766 (not c!45041)) b!263772))

(assert (= (or b!263771 b!263772) bm!25252))

(assert (= (and d!63425 res!128796) b!263764))

(assert (= (and b!263764 res!128793) b!263765))

(assert (= (and b!263765 res!128794) b!263763))

(assert (= (and b!263765 c!45039) b!263773))

(assert (= (and b!263765 (not c!45039)) b!263769))

(assert (= (and b!263773 res!128795) b!263768))

(assert (= (and b!263769 c!45040) b!263762))

(assert (= (and b!263769 (not c!45040)) b!263767))

(declare-fun b_lambda!8361 () Bool)

(assert (=> (not b_lambda!8361) (not b!263768)))

(assert (=> b!263768 t!8935))

(declare-fun b_and!13957 () Bool)

(assert (= b_and!13955 (and (=> t!8935 result!5439) b_and!13957)))

(declare-fun b_lambda!8363 () Bool)

(assert (=> (not b_lambda!8363) (not b!263771)))

(assert (=> b!263771 t!8935))

(declare-fun b_and!13959 () Bool)

(assert (= b_and!13957 (and (=> t!8935 result!5439) b_and!13959)))

(declare-fun m!280241 () Bool)

(assert (=> bm!25252 m!280241))

(assert (=> b!263763 m!279591))

(assert (=> b!263763 m!279591))

(assert (=> b!263763 m!279593))

(assert (=> b!263762 m!280241))

(declare-fun m!280243 () Bool)

(assert (=> b!263771 m!280243))

(assert (=> b!263771 m!280119))

(declare-fun m!280245 () Bool)

(assert (=> b!263771 m!280245))

(assert (=> b!263771 m!279591))

(assert (=> b!263771 m!280117))

(declare-fun m!280247 () Bool)

(assert (=> b!263771 m!280247))

(declare-fun m!280249 () Bool)

(assert (=> b!263771 m!280249))

(assert (=> b!263771 m!280247))

(assert (=> b!263771 m!280117))

(assert (=> b!263771 m!280119))

(assert (=> b!263771 m!280121))

(declare-fun m!280251 () Bool)

(assert (=> b!263767 m!280251))

(assert (=> b!263773 m!279591))

(assert (=> b!263773 m!279591))

(declare-fun m!280253 () Bool)

(assert (=> b!263773 m!280253))

(declare-fun m!280255 () Bool)

(assert (=> b!263764 m!280255))

(assert (=> b!263766 m!279591))

(assert (=> b!263766 m!279591))

(assert (=> b!263766 m!279593))

(declare-fun m!280257 () Bool)

(assert (=> d!63425 m!280257))

(assert (=> d!63425 m!279757))

(assert (=> b!263768 m!280119))

(assert (=> b!263768 m!279591))

(assert (=> b!263768 m!280117))

(assert (=> b!263768 m!279591))

(declare-fun m!280259 () Bool)

(assert (=> b!263768 m!280259))

(assert (=> b!263768 m!280117))

(assert (=> b!263768 m!280119))

(assert (=> b!263768 m!280121))

(assert (=> b!263696 d!63425))

(declare-fun d!63427 () Bool)

(declare-fun e!170910 () Bool)

(assert (=> d!63427 e!170910))

(declare-fun res!128797 () Bool)

(assert (=> d!63427 (=> (not res!128797) (not e!170910))))

(declare-fun lt!133556 () ListLongMap!3891)

(assert (=> d!63427 (= res!128797 (contains!1912 lt!133556 (_1!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))))))

(declare-fun lt!133557 () List!3852)

(assert (=> d!63427 (= lt!133556 (ListLongMap!3892 lt!133557))))

(declare-fun lt!133555 () Unit!8190)

(declare-fun lt!133554 () Unit!8190)

(assert (=> d!63427 (= lt!133555 lt!133554)))

(assert (=> d!63427 (= (getValueByKey!320 lt!133557 (_1!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))))))

(assert (=> d!63427 (= lt!133554 (lemmaContainsTupThenGetReturnValue!176 lt!133557 (_1!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))))))

(assert (=> d!63427 (= lt!133557 (insertStrictlySorted!179 (toList!1961 lt!133510) (_1!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))))))

(assert (=> d!63427 (= (+!710 lt!133510 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))) lt!133556)))

(declare-fun b!263774 () Bool)

(declare-fun res!128798 () Bool)

(assert (=> b!263774 (=> (not res!128798) (not e!170910))))

(assert (=> b!263774 (= res!128798 (= (getValueByKey!320 (toList!1961 lt!133556) (_1!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133499 (minValue!4684 lt!133015))))))))

(declare-fun b!263775 () Bool)

(assert (=> b!263775 (= e!170910 (contains!1914 (toList!1961 lt!133556) (tuple2!4979 lt!133499 (minValue!4684 lt!133015))))))

(assert (= (and d!63427 res!128797) b!263774))

(assert (= (and b!263774 res!128798) b!263775))

(declare-fun m!280261 () Bool)

(assert (=> d!63427 m!280261))

(declare-fun m!280263 () Bool)

(assert (=> d!63427 m!280263))

(declare-fun m!280265 () Bool)

(assert (=> d!63427 m!280265))

(declare-fun m!280267 () Bool)

(assert (=> d!63427 m!280267))

(declare-fun m!280269 () Bool)

(assert (=> b!263774 m!280269))

(declare-fun m!280271 () Bool)

(assert (=> b!263775 m!280271))

(assert (=> b!263696 d!63427))

(declare-fun d!63429 () Bool)

(assert (=> d!63429 (= (apply!262 (+!710 lt!133514 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))) lt!133497) (apply!262 lt!133514 lt!133497))))

(declare-fun lt!133558 () Unit!8190)

(assert (=> d!63429 (= lt!133558 (choose!1295 lt!133514 lt!133513 (minValue!4684 lt!133015) lt!133497))))

(declare-fun e!170911 () Bool)

(assert (=> d!63429 e!170911))

(declare-fun res!128799 () Bool)

(assert (=> d!63429 (=> (not res!128799) (not e!170911))))

(assert (=> d!63429 (= res!128799 (contains!1912 lt!133514 lt!133497))))

(assert (=> d!63429 (= (addApplyDifferent!238 lt!133514 lt!133513 (minValue!4684 lt!133015) lt!133497) lt!133558)))

(declare-fun b!263776 () Bool)

(assert (=> b!263776 (= e!170911 (not (= lt!133497 lt!133513)))))

(assert (= (and d!63429 res!128799) b!263776))

(assert (=> d!63429 m!280093))

(assert (=> d!63429 m!280083))

(assert (=> d!63429 m!280083))

(assert (=> d!63429 m!280085))

(declare-fun m!280273 () Bool)

(assert (=> d!63429 m!280273))

(declare-fun m!280275 () Bool)

(assert (=> d!63429 m!280275))

(assert (=> b!263696 d!63429))

(declare-fun d!63431 () Bool)

(assert (=> d!63431 (= (apply!262 lt!133504 lt!133509) (get!3094 (getValueByKey!320 (toList!1961 lt!133504) lt!133509)))))

(declare-fun bs!9288 () Bool)

(assert (= bs!9288 d!63431))

(declare-fun m!280277 () Bool)

(assert (=> bs!9288 m!280277))

(assert (=> bs!9288 m!280277))

(declare-fun m!280279 () Bool)

(assert (=> bs!9288 m!280279))

(assert (=> b!263696 d!63431))

(declare-fun d!63433 () Bool)

(assert (=> d!63433 (= (apply!262 (+!710 lt!133504 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))) lt!133509) (apply!262 lt!133504 lt!133509))))

(declare-fun lt!133559 () Unit!8190)

(assert (=> d!63433 (= lt!133559 (choose!1295 lt!133504 lt!133505 (zeroValue!4684 lt!133015) lt!133509))))

(declare-fun e!170912 () Bool)

(assert (=> d!63433 e!170912))

(declare-fun res!128800 () Bool)

(assert (=> d!63433 (=> (not res!128800) (not e!170912))))

(assert (=> d!63433 (= res!128800 (contains!1912 lt!133504 lt!133509))))

(assert (=> d!63433 (= (addApplyDifferent!238 lt!133504 lt!133505 (zeroValue!4684 lt!133015) lt!133509) lt!133559)))

(declare-fun b!263777 () Bool)

(assert (=> b!263777 (= e!170912 (not (= lt!133509 lt!133505)))))

(assert (= (and d!63433 res!128800) b!263777))

(assert (=> d!63433 m!280111))

(assert (=> d!63433 m!280091))

(assert (=> d!63433 m!280091))

(assert (=> d!63433 m!280095))

(declare-fun m!280281 () Bool)

(assert (=> d!63433 m!280281))

(declare-fun m!280283 () Bool)

(assert (=> d!63433 m!280283))

(assert (=> b!263696 d!63433))

(declare-fun d!63435 () Bool)

(assert (=> d!63435 (= (apply!262 lt!133510 lt!133501) (get!3094 (getValueByKey!320 (toList!1961 lt!133510) lt!133501)))))

(declare-fun bs!9289 () Bool)

(assert (= bs!9289 d!63435))

(declare-fun m!280285 () Bool)

(assert (=> bs!9289 m!280285))

(assert (=> bs!9289 m!280285))

(declare-fun m!280287 () Bool)

(assert (=> bs!9289 m!280287))

(assert (=> b!263696 d!63435))

(declare-fun d!63437 () Bool)

(declare-fun e!170913 () Bool)

(assert (=> d!63437 e!170913))

(declare-fun res!128801 () Bool)

(assert (=> d!63437 (=> (not res!128801) (not e!170913))))

(declare-fun lt!133562 () ListLongMap!3891)

(assert (=> d!63437 (= res!128801 (contains!1912 lt!133562 (_1!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))))))

(declare-fun lt!133563 () List!3852)

(assert (=> d!63437 (= lt!133562 (ListLongMap!3892 lt!133563))))

(declare-fun lt!133561 () Unit!8190)

(declare-fun lt!133560 () Unit!8190)

(assert (=> d!63437 (= lt!133561 lt!133560)))

(assert (=> d!63437 (= (getValueByKey!320 lt!133563 (_1!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))))))

(assert (=> d!63437 (= lt!133560 (lemmaContainsTupThenGetReturnValue!176 lt!133563 (_1!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))))))

(assert (=> d!63437 (= lt!133563 (insertStrictlySorted!179 (toList!1961 lt!133514) (_1!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))) (_2!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))))))

(assert (=> d!63437 (= (+!710 lt!133514 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))) lt!133562)))

(declare-fun b!263778 () Bool)

(declare-fun res!128802 () Bool)

(assert (=> b!263778 (=> (not res!128802) (not e!170913))))

(assert (=> b!263778 (= res!128802 (= (getValueByKey!320 (toList!1961 lt!133562) (_1!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 lt!133513 (minValue!4684 lt!133015))))))))

(declare-fun b!263779 () Bool)

(assert (=> b!263779 (= e!170913 (contains!1914 (toList!1961 lt!133562) (tuple2!4979 lt!133513 (minValue!4684 lt!133015))))))

(assert (= (and d!63437 res!128801) b!263778))

(assert (= (and b!263778 res!128802) b!263779))

(declare-fun m!280289 () Bool)

(assert (=> d!63437 m!280289))

(declare-fun m!280291 () Bool)

(assert (=> d!63437 m!280291))

(declare-fun m!280293 () Bool)

(assert (=> d!63437 m!280293))

(declare-fun m!280295 () Bool)

(assert (=> d!63437 m!280295))

(declare-fun m!280297 () Bool)

(assert (=> b!263778 m!280297))

(declare-fun m!280299 () Bool)

(assert (=> b!263779 m!280299))

(assert (=> b!263696 d!63437))

(declare-fun d!63439 () Bool)

(assert (=> d!63439 (= (apply!262 (+!710 lt!133504 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015))) lt!133509) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133504 (tuple2!4979 lt!133505 (zeroValue!4684 lt!133015)))) lt!133509)))))

(declare-fun bs!9290 () Bool)

(assert (= bs!9290 d!63439))

(declare-fun m!280301 () Bool)

(assert (=> bs!9290 m!280301))

(assert (=> bs!9290 m!280301))

(declare-fun m!280303 () Bool)

(assert (=> bs!9290 m!280303))

(assert (=> b!263696 d!63439))

(declare-fun d!63441 () Bool)

(declare-fun e!170914 () Bool)

(assert (=> d!63441 e!170914))

(declare-fun res!128803 () Bool)

(assert (=> d!63441 (=> res!128803 e!170914)))

(declare-fun lt!133565 () Bool)

(assert (=> d!63441 (= res!128803 (not lt!133565))))

(declare-fun lt!133564 () Bool)

(assert (=> d!63441 (= lt!133565 lt!133564)))

(declare-fun lt!133566 () Unit!8190)

(declare-fun e!170915 () Unit!8190)

(assert (=> d!63441 (= lt!133566 e!170915)))

(declare-fun c!45042 () Bool)

(assert (=> d!63441 (= c!45042 lt!133564)))

(assert (=> d!63441 (= lt!133564 (containsKey!312 (toList!1961 lt!133258) lt!133241))))

(assert (=> d!63441 (= (contains!1912 lt!133258 lt!133241) lt!133565)))

(declare-fun b!263780 () Bool)

(declare-fun lt!133567 () Unit!8190)

(assert (=> b!263780 (= e!170915 lt!133567)))

(assert (=> b!263780 (= lt!133567 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133258) lt!133241))))

(assert (=> b!263780 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133258) lt!133241))))

(declare-fun b!263781 () Bool)

(declare-fun Unit!8220 () Unit!8190)

(assert (=> b!263781 (= e!170915 Unit!8220)))

(declare-fun b!263782 () Bool)

(assert (=> b!263782 (= e!170914 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133258) lt!133241)))))

(assert (= (and d!63441 c!45042) b!263780))

(assert (= (and d!63441 (not c!45042)) b!263781))

(assert (= (and d!63441 (not res!128803)) b!263782))

(declare-fun m!280305 () Bool)

(assert (=> d!63441 m!280305))

(declare-fun m!280307 () Bool)

(assert (=> b!263780 m!280307))

(assert (=> b!263780 m!279993))

(assert (=> b!263780 m!279993))

(declare-fun m!280309 () Bool)

(assert (=> b!263780 m!280309))

(assert (=> b!263782 m!279993))

(assert (=> b!263782 m!279993))

(assert (=> b!263782 m!280309))

(assert (=> d!63329 d!63441))

(assert (=> d!63329 d!63351))

(declare-fun d!63443 () Bool)

(assert (=> d!63443 (= (apply!262 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) lt!133241) (apply!262 lt!133258 lt!133241))))

(assert (=> d!63443 true))

(declare-fun _$34!1134 () Unit!8190)

(assert (=> d!63443 (= (choose!1295 lt!133258 lt!133257 (minValue!4684 thiss!1504) lt!133241) _$34!1134)))

(declare-fun bs!9291 () Bool)

(assert (= bs!9291 d!63443))

(assert (=> bs!9291 m!279343))

(assert (=> bs!9291 m!279343))

(assert (=> bs!9291 m!279345))

(assert (=> bs!9291 m!279353))

(assert (=> d!63329 d!63443))

(assert (=> d!63329 d!63353))

(assert (=> d!63329 d!63355))

(declare-fun d!63445 () Bool)

(declare-fun lt!133568 () Bool)

(assert (=> d!63445 (= lt!133568 (select (content!176 (toList!1961 lt!133443)) (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))

(declare-fun e!170917 () Bool)

(assert (=> d!63445 (= lt!133568 e!170917)))

(declare-fun res!128805 () Bool)

(assert (=> d!63445 (=> (not res!128805) (not e!170917))))

(assert (=> d!63445 (= res!128805 ((_ is Cons!3848) (toList!1961 lt!133443)))))

(assert (=> d!63445 (= (contains!1914 (toList!1961 lt!133443) (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) lt!133568)))

(declare-fun b!263784 () Bool)

(declare-fun e!170916 () Bool)

(assert (=> b!263784 (= e!170917 e!170916)))

(declare-fun res!128804 () Bool)

(assert (=> b!263784 (=> res!128804 e!170916)))

(assert (=> b!263784 (= res!128804 (= (h!4514 (toList!1961 lt!133443)) (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))

(declare-fun b!263785 () Bool)

(assert (=> b!263785 (= e!170916 (contains!1914 (t!8929 (toList!1961 lt!133443)) (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))

(assert (= (and d!63445 res!128805) b!263784))

(assert (= (and b!263784 (not res!128804)) b!263785))

(declare-fun m!280311 () Bool)

(assert (=> d!63445 m!280311))

(declare-fun m!280313 () Bool)

(assert (=> d!63445 m!280313))

(declare-fun m!280315 () Bool)

(assert (=> b!263785 m!280315))

(assert (=> b!263617 d!63445))

(declare-fun d!63447 () Bool)

(declare-fun res!128806 () Bool)

(declare-fun e!170918 () Bool)

(assert (=> d!63447 (=> res!128806 e!170918)))

(assert (=> d!63447 (= res!128806 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (= (_1!2500 (h!4514 (toList!1961 lt!133201))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63447 (= (containsKey!312 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000) e!170918)))

(declare-fun b!263786 () Bool)

(declare-fun e!170919 () Bool)

(assert (=> b!263786 (= e!170918 e!170919)))

(declare-fun res!128807 () Bool)

(assert (=> b!263786 (=> (not res!128807) (not e!170919))))

(assert (=> b!263786 (= res!128807 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133201))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133201))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3848) (toList!1961 lt!133201)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133201))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263787 () Bool)

(assert (=> b!263787 (= e!170919 (containsKey!312 (t!8929 (toList!1961 lt!133201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63447 (not res!128806)) b!263786))

(assert (= (and b!263786 res!128807) b!263787))

(declare-fun m!280317 () Bool)

(assert (=> b!263787 m!280317))

(assert (=> d!63175 d!63447))

(declare-fun b!263790 () Bool)

(declare-fun e!170921 () Option!326)

(assert (=> b!263790 (= e!170921 (getValueByKey!320 (t!8929 (toList!1961 lt!133420)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!263788 () Bool)

(declare-fun e!170920 () Option!326)

(assert (=> b!263788 (= e!170920 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133420)))))))

(declare-fun d!63449 () Bool)

(declare-fun c!45043 () Bool)

(assert (=> d!63449 (= c!45043 (and ((_ is Cons!3848) (toList!1961 lt!133420)) (= (_1!2500 (h!4514 (toList!1961 lt!133420))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63449 (= (getValueByKey!320 (toList!1961 lt!133420) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) e!170920)))

(declare-fun b!263791 () Bool)

(assert (=> b!263791 (= e!170921 None!324)))

(declare-fun b!263789 () Bool)

(assert (=> b!263789 (= e!170920 e!170921)))

(declare-fun c!45044 () Bool)

(assert (=> b!263789 (= c!45044 (and ((_ is Cons!3848) (toList!1961 lt!133420)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133420))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63449 c!45043) b!263788))

(assert (= (and d!63449 (not c!45043)) b!263789))

(assert (= (and b!263789 c!45044) b!263790))

(assert (= (and b!263789 (not c!45044)) b!263791))

(declare-fun m!280319 () Bool)

(assert (=> b!263790 m!280319))

(assert (=> b!263584 d!63449))

(assert (=> d!63179 d!63077))

(declare-fun d!63451 () Bool)

(assert (=> d!63451 (= (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133009) key!932)) (not ((_ is Some!325) (getValueByKey!320 (toList!1961 lt!133009) key!932))))))

(assert (=> d!63273 d!63451))

(declare-fun d!63453 () Bool)

(assert (=> d!63453 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133569 () Unit!8190)

(assert (=> d!63453 (= lt!133569 (choose!1293 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170922 () Bool)

(assert (=> d!63453 e!170922))

(declare-fun res!128808 () Bool)

(assert (=> d!63453 (=> (not res!128808) (not e!170922))))

(assert (=> d!63453 (= res!128808 (isStrictlySorted!377 (toList!1961 lt!133201)))))

(assert (=> d!63453 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000) lt!133569)))

(declare-fun b!263792 () Bool)

(assert (=> b!263792 (= e!170922 (containsKey!312 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63453 res!128808) b!263792))

(assert (=> d!63453 m!279623))

(assert (=> d!63453 m!279623))

(assert (=> d!63453 m!279625))

(declare-fun m!280321 () Bool)

(assert (=> d!63453 m!280321))

(declare-fun m!280323 () Bool)

(assert (=> d!63453 m!280323))

(assert (=> b!263792 m!279619))

(assert (=> b!263457 d!63453))

(declare-fun d!63455 () Bool)

(assert (=> d!63455 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9292 () Bool)

(assert (= bs!9292 d!63455))

(assert (=> bs!9292 m!279623))

(declare-fun m!280325 () Bool)

(assert (=> bs!9292 m!280325))

(assert (=> b!263457 d!63455))

(declare-fun b!263795 () Bool)

(declare-fun e!170924 () Option!326)

(assert (=> b!263795 (= e!170924 (getValueByKey!320 (t!8929 (toList!1961 lt!133201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263793 () Bool)

(declare-fun e!170923 () Option!326)

(assert (=> b!263793 (= e!170923 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133201)))))))

(declare-fun d!63457 () Bool)

(declare-fun c!45045 () Bool)

(assert (=> d!63457 (= c!45045 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (= (_1!2500 (h!4514 (toList!1961 lt!133201))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63457 (= (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000) e!170923)))

(declare-fun b!263796 () Bool)

(assert (=> b!263796 (= e!170924 None!324)))

(declare-fun b!263794 () Bool)

(assert (=> b!263794 (= e!170923 e!170924)))

(declare-fun c!45046 () Bool)

(assert (=> b!263794 (= c!45046 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133201))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!63457 c!45045) b!263793))

(assert (= (and d!63457 (not c!45045)) b!263794))

(assert (= (and b!263794 c!45046) b!263795))

(assert (= (and b!263794 (not c!45046)) b!263796))

(declare-fun m!280327 () Bool)

(assert (=> b!263795 m!280327))

(assert (=> b!263457 d!63457))

(declare-fun d!63459 () Bool)

(declare-fun e!170925 () Bool)

(assert (=> d!63459 e!170925))

(declare-fun res!128809 () Bool)

(assert (=> d!63459 (=> res!128809 e!170925)))

(declare-fun lt!133571 () Bool)

(assert (=> d!63459 (= res!128809 (not lt!133571))))

(declare-fun lt!133570 () Bool)

(assert (=> d!63459 (= lt!133571 lt!133570)))

(declare-fun lt!133572 () Unit!8190)

(declare-fun e!170926 () Unit!8190)

(assert (=> d!63459 (= lt!133572 e!170926)))

(declare-fun c!45047 () Bool)

(assert (=> d!63459 (= c!45047 lt!133570)))

(assert (=> d!63459 (= lt!133570 (containsKey!312 (toList!1961 lt!133460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63459 (= (contains!1912 lt!133460 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133571)))

(declare-fun b!263797 () Bool)

(declare-fun lt!133573 () Unit!8190)

(assert (=> b!263797 (= e!170926 lt!133573)))

(assert (=> b!263797 (= lt!133573 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263797 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263798 () Bool)

(declare-fun Unit!8221 () Unit!8190)

(assert (=> b!263798 (= e!170926 Unit!8221)))

(declare-fun b!263799 () Bool)

(assert (=> b!263799 (= e!170925 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133460) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63459 c!45047) b!263797))

(assert (= (and d!63459 (not c!45047)) b!263798))

(assert (= (and d!63459 (not res!128809)) b!263799))

(declare-fun m!280329 () Bool)

(assert (=> d!63459 m!280329))

(declare-fun m!280331 () Bool)

(assert (=> b!263797 m!280331))

(declare-fun m!280333 () Bool)

(assert (=> b!263797 m!280333))

(assert (=> b!263797 m!280333))

(declare-fun m!280335 () Bool)

(assert (=> b!263797 m!280335))

(assert (=> b!263799 m!280333))

(assert (=> b!263799 m!280333))

(assert (=> b!263799 m!280335))

(assert (=> d!63337 d!63459))

(assert (=> d!63337 d!63181))

(declare-fun d!63461 () Bool)

(declare-fun res!128814 () Bool)

(declare-fun e!170931 () Bool)

(assert (=> d!63461 (=> res!128814 e!170931)))

(assert (=> d!63461 (= res!128814 (or ((_ is Nil!3849) lt!133489) ((_ is Nil!3849) (t!8929 lt!133489))))))

(assert (=> d!63461 (= (isStrictlySorted!377 lt!133489) e!170931)))

(declare-fun b!263804 () Bool)

(declare-fun e!170932 () Bool)

(assert (=> b!263804 (= e!170931 e!170932)))

(declare-fun res!128815 () Bool)

(assert (=> b!263804 (=> (not res!128815) (not e!170932))))

(assert (=> b!263804 (= res!128815 (bvslt (_1!2500 (h!4514 lt!133489)) (_1!2500 (h!4514 (t!8929 lt!133489)))))))

(declare-fun b!263805 () Bool)

(assert (=> b!263805 (= e!170932 (isStrictlySorted!377 (t!8929 lt!133489)))))

(assert (= (and d!63461 (not res!128814)) b!263804))

(assert (= (and b!263804 res!128815) b!263805))

(declare-fun m!280337 () Bool)

(assert (=> b!263805 m!280337))

(assert (=> d!63371 d!63461))

(declare-fun d!63463 () Bool)

(declare-fun res!128816 () Bool)

(declare-fun e!170933 () Bool)

(assert (=> d!63463 (=> res!128816 e!170933)))

(assert (=> d!63463 (= res!128816 (or ((_ is Nil!3849) (toList!1961 (map!2758 thiss!1504))) ((_ is Nil!3849) (t!8929 (toList!1961 (map!2758 thiss!1504))))))))

(assert (=> d!63463 (= (isStrictlySorted!377 (toList!1961 (map!2758 thiss!1504))) e!170933)))

(declare-fun b!263806 () Bool)

(declare-fun e!170934 () Bool)

(assert (=> b!263806 (= e!170933 e!170934)))

(declare-fun res!128817 () Bool)

(assert (=> b!263806 (=> (not res!128817) (not e!170934))))

(assert (=> b!263806 (= res!128817 (bvslt (_1!2500 (h!4514 (toList!1961 (map!2758 thiss!1504)))) (_1!2500 (h!4514 (t!8929 (toList!1961 (map!2758 thiss!1504)))))))))

(declare-fun b!263807 () Bool)

(assert (=> b!263807 (= e!170934 (isStrictlySorted!377 (t!8929 (toList!1961 (map!2758 thiss!1504)))))))

(assert (= (and d!63463 (not res!128816)) b!263806))

(assert (= (and b!263806 res!128817) b!263807))

(declare-fun m!280339 () Bool)

(assert (=> b!263807 m!280339))

(assert (=> d!63371 d!63463))

(declare-fun d!63465 () Bool)

(declare-fun lt!133574 () Bool)

(assert (=> d!63465 (= lt!133574 (select (content!176 (toList!1961 lt!133435)) (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))

(declare-fun e!170936 () Bool)

(assert (=> d!63465 (= lt!133574 e!170936)))

(declare-fun res!128819 () Bool)

(assert (=> d!63465 (=> (not res!128819) (not e!170936))))

(assert (=> d!63465 (= res!128819 ((_ is Cons!3848) (toList!1961 lt!133435)))))

(assert (=> d!63465 (= (contains!1914 (toList!1961 lt!133435) (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) lt!133574)))

(declare-fun b!263808 () Bool)

(declare-fun e!170935 () Bool)

(assert (=> b!263808 (= e!170936 e!170935)))

(declare-fun res!128818 () Bool)

(assert (=> b!263808 (=> res!128818 e!170935)))

(assert (=> b!263808 (= res!128818 (= (h!4514 (toList!1961 lt!133435)) (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))

(declare-fun b!263809 () Bool)

(assert (=> b!263809 (= e!170935 (contains!1914 (t!8929 (toList!1961 lt!133435)) (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63465 res!128819) b!263808))

(assert (= (and b!263808 (not res!128818)) b!263809))

(declare-fun m!280341 () Bool)

(assert (=> d!63465 m!280341))

(declare-fun m!280343 () Bool)

(assert (=> d!63465 m!280343))

(declare-fun m!280345 () Bool)

(assert (=> b!263809 m!280345))

(assert (=> b!263613 d!63465))

(assert (=> d!63373 d!63113))

(declare-fun d!63467 () Bool)

(assert (=> d!63467 (= (apply!262 lt!133386 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9293 () Bool)

(assert (= bs!9293 d!63467))

(declare-fun m!280347 () Bool)

(assert (=> bs!9293 m!280347))

(assert (=> bs!9293 m!280347))

(declare-fun m!280349 () Bool)

(assert (=> bs!9293 m!280349))

(assert (=> b!263480 d!63467))

(declare-fun d!63469 () Bool)

(assert (=> d!63469 (= (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133012) key!932)) (not ((_ is Some!325) (getValueByKey!320 (toList!1961 lt!133012) key!932))))))

(assert (=> d!63169 d!63469))

(assert (=> b!263431 d!63195))

(declare-fun d!63471 () Bool)

(assert (=> d!63471 (= (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263486 d!63471))

(declare-fun d!63473 () Bool)

(declare-fun res!128820 () Bool)

(declare-fun e!170937 () Bool)

(assert (=> d!63473 (=> res!128820 e!170937)))

(assert (=> d!63473 (= res!128820 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (= (_1!2500 (h!4514 (toList!1961 lt!133256))) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(assert (=> d!63473 (= (containsKey!312 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) e!170937)))

(declare-fun b!263810 () Bool)

(declare-fun e!170938 () Bool)

(assert (=> b!263810 (= e!170937 e!170938)))

(declare-fun res!128821 () Bool)

(assert (=> b!263810 (=> (not res!128821) (not e!170938))))

(assert (=> b!263810 (= res!128821 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133256))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133256))) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))) ((_ is Cons!3848) (toList!1961 lt!133256)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133256))) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(declare-fun b!263811 () Bool)

(assert (=> b!263811 (= e!170938 (containsKey!312 (t!8929 (toList!1961 lt!133256)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (= (and d!63473 (not res!128820)) b!263810))

(assert (= (and b!263810 res!128821) b!263811))

(assert (=> b!263811 m!279255))

(declare-fun m!280351 () Bool)

(assert (=> b!263811 m!280351))

(assert (=> d!63145 d!63473))

(declare-fun e!170939 () Bool)

(declare-fun b!263812 () Bool)

(assert (=> b!263812 (= e!170939 (contains!1915 (ite c!44918 (Cons!3849 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!263814 () Bool)

(declare-fun e!170942 () Bool)

(declare-fun call!25256 () Bool)

(assert (=> b!263814 (= e!170942 call!25256)))

(declare-fun b!263815 () Bool)

(declare-fun e!170940 () Bool)

(assert (=> b!263815 (= e!170940 e!170942)))

(declare-fun c!45048 () Bool)

(assert (=> b!263815 (= c!45048 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!263813 () Bool)

(declare-fun e!170941 () Bool)

(assert (=> b!263813 (= e!170941 e!170940)))

(declare-fun res!128823 () Bool)

(assert (=> b!263813 (=> (not res!128823) (not e!170940))))

(assert (=> b!263813 (= res!128823 (not e!170939))))

(declare-fun res!128824 () Bool)

(assert (=> b!263813 (=> (not res!128824) (not e!170939))))

(assert (=> b!263813 (= res!128824 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63475 () Bool)

(declare-fun res!128822 () Bool)

(assert (=> d!63475 (=> res!128822 e!170941)))

(assert (=> d!63475 (= res!128822 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!63475 (= (arrayNoDuplicates!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44918 (Cons!3849 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850))) e!170941)))

(declare-fun bm!25253 () Bool)

(assert (=> bm!25253 (= call!25256 (arrayNoDuplicates!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45048 (Cons!3849 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!44918 (Cons!3849 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850))) (ite c!44918 (Cons!3849 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)))))))

(declare-fun b!263816 () Bool)

(assert (=> b!263816 (= e!170942 call!25256)))

(assert (= (and d!63475 (not res!128822)) b!263813))

(assert (= (and b!263813 res!128824) b!263812))

(assert (= (and b!263813 res!128823) b!263815))

(assert (= (and b!263815 c!45048) b!263814))

(assert (= (and b!263815 (not c!45048)) b!263816))

(assert (= (or b!263814 b!263816) bm!25253))

(declare-fun m!280353 () Bool)

(assert (=> b!263812 m!280353))

(assert (=> b!263812 m!280353))

(declare-fun m!280355 () Bool)

(assert (=> b!263812 m!280355))

(assert (=> b!263815 m!280353))

(assert (=> b!263815 m!280353))

(declare-fun m!280357 () Bool)

(assert (=> b!263815 m!280357))

(assert (=> b!263813 m!280353))

(assert (=> b!263813 m!280353))

(assert (=> b!263813 m!280357))

(assert (=> bm!25253 m!280353))

(declare-fun m!280359 () Bool)

(assert (=> bm!25253 m!280359))

(assert (=> bm!25206 d!63475))

(assert (=> b!263637 d!63189))

(declare-fun d!63477 () Bool)

(assert (=> d!63477 (= (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263450 d!63477))

(declare-fun d!63479 () Bool)

(declare-fun e!170943 () Bool)

(assert (=> d!63479 e!170943))

(declare-fun res!128825 () Bool)

(assert (=> d!63479 (=> res!128825 e!170943)))

(declare-fun lt!133576 () Bool)

(assert (=> d!63479 (= res!128825 (not lt!133576))))

(declare-fun lt!133575 () Bool)

(assert (=> d!63479 (= lt!133576 lt!133575)))

(declare-fun lt!133577 () Unit!8190)

(declare-fun e!170944 () Unit!8190)

(assert (=> d!63479 (= lt!133577 e!170944)))

(declare-fun c!45049 () Bool)

(assert (=> d!63479 (= c!45049 lt!133575)))

(assert (=> d!63479 (= lt!133575 (containsKey!312 (toList!1961 lt!133512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63479 (= (contains!1912 lt!133512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133576)))

(declare-fun b!263817 () Bool)

(declare-fun lt!133578 () Unit!8190)

(assert (=> b!263817 (= e!170944 lt!133578)))

(assert (=> b!263817 (= lt!133578 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263817 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263818 () Bool)

(declare-fun Unit!8222 () Unit!8190)

(assert (=> b!263818 (= e!170944 Unit!8222)))

(declare-fun b!263819 () Bool)

(assert (=> b!263819 (= e!170943 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63479 c!45049) b!263817))

(assert (= (and d!63479 (not c!45049)) b!263818))

(assert (= (and d!63479 (not res!128825)) b!263819))

(declare-fun m!280361 () Bool)

(assert (=> d!63479 m!280361))

(declare-fun m!280363 () Bool)

(assert (=> b!263817 m!280363))

(declare-fun m!280365 () Bool)

(assert (=> b!263817 m!280365))

(assert (=> b!263817 m!280365))

(declare-fun m!280367 () Bool)

(assert (=> b!263817 m!280367))

(assert (=> b!263819 m!280365))

(assert (=> b!263819 m!280365))

(assert (=> b!263819 m!280367))

(assert (=> bm!25241 d!63479))

(declare-fun d!63481 () Bool)

(declare-fun res!128826 () Bool)

(declare-fun e!170945 () Bool)

(assert (=> d!63481 (=> res!128826 e!170945)))

(assert (=> d!63481 (= res!128826 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (= (_1!2500 (h!4514 (toList!1961 lt!133201))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63481 (= (containsKey!312 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000) e!170945)))

(declare-fun b!263820 () Bool)

(declare-fun e!170946 () Bool)

(assert (=> b!263820 (= e!170945 e!170946)))

(declare-fun res!128827 () Bool)

(assert (=> b!263820 (=> (not res!128827) (not e!170946))))

(assert (=> b!263820 (= res!128827 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133201))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133201))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3848) (toList!1961 lt!133201)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133201))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263821 () Bool)

(assert (=> b!263821 (= e!170946 (containsKey!312 (t!8929 (toList!1961 lt!133201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63481 (not res!128826)) b!263820))

(assert (= (and b!263820 res!128827) b!263821))

(declare-fun m!280369 () Bool)

(assert (=> b!263821 m!280369))

(assert (=> d!63225 d!63481))

(declare-fun d!63483 () Bool)

(declare-fun e!170947 () Bool)

(assert (=> d!63483 e!170947))

(declare-fun res!128828 () Bool)

(assert (=> d!63483 (=> res!128828 e!170947)))

(declare-fun lt!133580 () Bool)

(assert (=> d!63483 (= res!128828 (not lt!133580))))

(declare-fun lt!133579 () Bool)

(assert (=> d!63483 (= lt!133580 lt!133579)))

(declare-fun lt!133581 () Unit!8190)

(declare-fun e!170948 () Unit!8190)

(assert (=> d!63483 (= lt!133581 e!170948)))

(declare-fun c!45050 () Bool)

(assert (=> d!63483 (= c!45050 lt!133579)))

(assert (=> d!63483 (= lt!133579 (containsKey!312 (toList!1961 lt!133435) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63483 (= (contains!1912 lt!133435 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133580)))

(declare-fun b!263822 () Bool)

(declare-fun lt!133582 () Unit!8190)

(assert (=> b!263822 (= e!170948 lt!133582)))

(assert (=> b!263822 (= lt!133582 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133435) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(assert (=> b!263822 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133435) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263823 () Bool)

(declare-fun Unit!8223 () Unit!8190)

(assert (=> b!263823 (= e!170948 Unit!8223)))

(declare-fun b!263824 () Bool)

(assert (=> b!263824 (= e!170947 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133435) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63483 c!45050) b!263822))

(assert (= (and d!63483 (not c!45050)) b!263823))

(assert (= (and d!63483 (not res!128828)) b!263824))

(declare-fun m!280371 () Bool)

(assert (=> d!63483 m!280371))

(declare-fun m!280373 () Bool)

(assert (=> b!263822 m!280373))

(assert (=> b!263822 m!279839))

(assert (=> b!263822 m!279839))

(declare-fun m!280375 () Bool)

(assert (=> b!263822 m!280375))

(assert (=> b!263824 m!279839))

(assert (=> b!263824 m!279839))

(assert (=> b!263824 m!280375))

(assert (=> d!63301 d!63483))

(declare-fun e!170950 () Option!326)

(declare-fun b!263827 () Bool)

(assert (=> b!263827 (= e!170950 (getValueByKey!320 (t!8929 lt!133436) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263825 () Bool)

(declare-fun e!170949 () Option!326)

(assert (=> b!263825 (= e!170949 (Some!325 (_2!2500 (h!4514 lt!133436))))))

(declare-fun c!45051 () Bool)

(declare-fun d!63485 () Bool)

(assert (=> d!63485 (= c!45051 (and ((_ is Cons!3848) lt!133436) (= (_1!2500 (h!4514 lt!133436)) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63485 (= (getValueByKey!320 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) e!170949)))

(declare-fun b!263828 () Bool)

(assert (=> b!263828 (= e!170950 None!324)))

(declare-fun b!263826 () Bool)

(assert (=> b!263826 (= e!170949 e!170950)))

(declare-fun c!45052 () Bool)

(assert (=> b!263826 (= c!45052 (and ((_ is Cons!3848) lt!133436) (not (= (_1!2500 (h!4514 lt!133436)) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63485 c!45051) b!263825))

(assert (= (and d!63485 (not c!45051)) b!263826))

(assert (= (and b!263826 c!45052) b!263827))

(assert (= (and b!263826 (not c!45052)) b!263828))

(declare-fun m!280377 () Bool)

(assert (=> b!263827 m!280377))

(assert (=> d!63301 d!63485))

(declare-fun d!63487 () Bool)

(assert (=> d!63487 (= (getValueByKey!320 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133583 () Unit!8190)

(assert (=> d!63487 (= lt!133583 (choose!1294 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun e!170951 () Bool)

(assert (=> d!63487 e!170951))

(declare-fun res!128829 () Bool)

(assert (=> d!63487 (=> (not res!128829) (not e!170951))))

(assert (=> d!63487 (= res!128829 (isStrictlySorted!377 lt!133436))))

(assert (=> d!63487 (= (lemmaContainsTupThenGetReturnValue!176 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133583)))

(declare-fun b!263829 () Bool)

(declare-fun res!128830 () Bool)

(assert (=> b!263829 (=> (not res!128830) (not e!170951))))

(assert (=> b!263829 (= res!128830 (containsKey!312 lt!133436 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263830 () Bool)

(assert (=> b!263830 (= e!170951 (contains!1914 lt!133436 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63487 res!128829) b!263829))

(assert (= (and b!263829 res!128830) b!263830))

(assert (=> d!63487 m!279833))

(declare-fun m!280379 () Bool)

(assert (=> d!63487 m!280379))

(declare-fun m!280381 () Bool)

(assert (=> d!63487 m!280381))

(declare-fun m!280383 () Bool)

(assert (=> b!263829 m!280383))

(declare-fun m!280385 () Bool)

(assert (=> b!263830 m!280385))

(assert (=> d!63301 d!63487))

(declare-fun bm!25254 () Bool)

(declare-fun call!25259 () List!3852)

(declare-fun call!25258 () List!3852)

(assert (=> bm!25254 (= call!25259 call!25258)))

(declare-fun bm!25255 () Bool)

(declare-fun call!25257 () List!3852)

(assert (=> bm!25255 (= call!25257 call!25259)))

(declare-fun b!263831 () Bool)

(declare-fun res!128831 () Bool)

(declare-fun e!170956 () Bool)

(assert (=> b!263831 (=> (not res!128831) (not e!170956))))

(declare-fun lt!133584 () List!3852)

(assert (=> b!263831 (= res!128831 (containsKey!312 lt!133584 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun c!45053 () Bool)

(declare-fun b!263832 () Bool)

(assert (=> b!263832 (= c!45053 (and ((_ is Cons!3848) (toList!1961 lt!133193)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133193))) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(declare-fun e!170955 () List!3852)

(declare-fun e!170952 () List!3852)

(assert (=> b!263832 (= e!170955 e!170952)))

(declare-fun b!263833 () Bool)

(declare-fun e!170954 () List!3852)

(assert (=> b!263833 (= e!170954 e!170955)))

(declare-fun c!45056 () Bool)

(assert (=> b!263833 (= c!45056 (and ((_ is Cons!3848) (toList!1961 lt!133193)) (= (_1!2500 (h!4514 (toList!1961 lt!133193))) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263834 () Bool)

(assert (=> b!263834 (= e!170956 (contains!1914 lt!133584 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263835 () Bool)

(assert (=> b!263835 (= e!170954 call!25258)))

(declare-fun b!263836 () Bool)

(assert (=> b!263836 (= e!170955 call!25259)))

(declare-fun e!170953 () List!3852)

(declare-fun b!263837 () Bool)

(assert (=> b!263837 (= e!170953 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133193)) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263838 () Bool)

(assert (=> b!263838 (= e!170952 call!25257)))

(declare-fun c!45055 () Bool)

(declare-fun bm!25256 () Bool)

(assert (=> bm!25256 (= call!25258 ($colon$colon!108 e!170953 (ite c!45055 (h!4514 (toList!1961 lt!133193)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))))

(declare-fun c!45054 () Bool)

(assert (=> bm!25256 (= c!45054 c!45055)))

(declare-fun d!63489 () Bool)

(assert (=> d!63489 e!170956))

(declare-fun res!128832 () Bool)

(assert (=> d!63489 (=> (not res!128832) (not e!170956))))

(assert (=> d!63489 (= res!128832 (isStrictlySorted!377 lt!133584))))

(assert (=> d!63489 (= lt!133584 e!170954)))

(assert (=> d!63489 (= c!45055 (and ((_ is Cons!3848) (toList!1961 lt!133193)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133193))) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63489 (isStrictlySorted!377 (toList!1961 lt!133193))))

(assert (=> d!63489 (= (insertStrictlySorted!179 (toList!1961 lt!133193) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133584)))

(declare-fun b!263839 () Bool)

(assert (=> b!263839 (= e!170952 call!25257)))

(declare-fun b!263840 () Bool)

(assert (=> b!263840 (= e!170953 (ite c!45056 (t!8929 (toList!1961 lt!133193)) (ite c!45053 (Cons!3848 (h!4514 (toList!1961 lt!133193)) (t!8929 (toList!1961 lt!133193))) Nil!3849)))))

(assert (= (and d!63489 c!45055) b!263835))

(assert (= (and d!63489 (not c!45055)) b!263833))

(assert (= (and b!263833 c!45056) b!263836))

(assert (= (and b!263833 (not c!45056)) b!263832))

(assert (= (and b!263832 c!45053) b!263839))

(assert (= (and b!263832 (not c!45053)) b!263838))

(assert (= (or b!263839 b!263838) bm!25255))

(assert (= (or b!263836 bm!25255) bm!25254))

(assert (= (or b!263835 bm!25254) bm!25256))

(assert (= (and bm!25256 c!45054) b!263837))

(assert (= (and bm!25256 (not c!45054)) b!263840))

(assert (= (and d!63489 res!128832) b!263831))

(assert (= (and b!263831 res!128831) b!263834))

(declare-fun m!280387 () Bool)

(assert (=> bm!25256 m!280387))

(declare-fun m!280389 () Bool)

(assert (=> b!263837 m!280389))

(declare-fun m!280391 () Bool)

(assert (=> b!263834 m!280391))

(declare-fun m!280393 () Bool)

(assert (=> b!263831 m!280393))

(declare-fun m!280395 () Bool)

(assert (=> d!63489 m!280395))

(declare-fun m!280397 () Bool)

(assert (=> d!63489 m!280397))

(assert (=> d!63301 d!63489))

(declare-fun lt!133585 () Bool)

(declare-fun d!63491 () Bool)

(assert (=> d!63491 (= lt!133585 (select (content!176 (toList!1961 lt!133468)) (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))

(declare-fun e!170958 () Bool)

(assert (=> d!63491 (= lt!133585 e!170958)))

(declare-fun res!128834 () Bool)

(assert (=> d!63491 (=> (not res!128834) (not e!170958))))

(assert (=> d!63491 (= res!128834 ((_ is Cons!3848) (toList!1961 lt!133468)))))

(assert (=> d!63491 (= (contains!1914 (toList!1961 lt!133468) (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) lt!133585)))

(declare-fun b!263841 () Bool)

(declare-fun e!170957 () Bool)

(assert (=> b!263841 (= e!170958 e!170957)))

(declare-fun res!128833 () Bool)

(assert (=> b!263841 (=> res!128833 e!170957)))

(assert (=> b!263841 (= res!128833 (= (h!4514 (toList!1961 lt!133468)) (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))

(declare-fun b!263842 () Bool)

(assert (=> b!263842 (= e!170957 (contains!1914 (t!8929 (toList!1961 lt!133468)) (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63491 res!128834) b!263841))

(assert (= (and b!263841 (not res!128833)) b!263842))

(declare-fun m!280399 () Bool)

(assert (=> d!63491 m!280399))

(declare-fun m!280401 () Bool)

(assert (=> d!63491 m!280401))

(declare-fun m!280403 () Bool)

(assert (=> b!263842 m!280403))

(assert (=> b!263649 d!63491))

(declare-fun e!170964 () Bool)

(declare-fun lt!133587 () ListLongMap!3891)

(declare-fun b!263843 () Bool)

(assert (=> b!263843 (= e!170964 (= lt!133587 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504))))))

(declare-fun e!170962 () Bool)

(declare-fun b!263844 () Bool)

(assert (=> b!263844 (= e!170962 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263844 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263845 () Bool)

(declare-fun res!128835 () Bool)

(declare-fun e!170963 () Bool)

(assert (=> b!263845 (=> (not res!128835) (not e!170963))))

(assert (=> b!263845 (= res!128835 (not (contains!1912 lt!133587 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263846 () Bool)

(declare-fun e!170965 () Bool)

(assert (=> b!263846 (= e!170963 e!170965)))

(declare-fun c!45058 () Bool)

(assert (=> b!263846 (= c!45058 e!170962)))

(declare-fun res!128836 () Bool)

(assert (=> b!263846 (=> (not res!128836) (not e!170962))))

(assert (=> b!263846 (= res!128836 (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun b!263847 () Bool)

(declare-fun e!170961 () ListLongMap!3891)

(declare-fun e!170959 () ListLongMap!3891)

(assert (=> b!263847 (= e!170961 e!170959)))

(declare-fun c!45060 () Bool)

(assert (=> b!263847 (= c!45060 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263848 () Bool)

(assert (=> b!263848 (= e!170964 (isEmpty!541 lt!133587))))

(declare-fun call!25260 () ListLongMap!3891)

(declare-fun bm!25257 () Bool)

(assert (=> bm!25257 (= call!25260 (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)))))

(declare-fun d!63493 () Bool)

(assert (=> d!63493 e!170963))

(declare-fun res!128838 () Bool)

(assert (=> d!63493 (=> (not res!128838) (not e!170963))))

(assert (=> d!63493 (= res!128838 (not (contains!1912 lt!133587 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63493 (= lt!133587 e!170961)))

(declare-fun c!45057 () Bool)

(assert (=> d!63493 (= c!45057 (bvsge #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!63493 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63493 (= (getCurrentListMapNoExtraKeys!584 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)) lt!133587)))

(declare-fun b!263849 () Bool)

(assert (=> b!263849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> b!263849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6349 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504))))))))

(declare-fun e!170960 () Bool)

(assert (=> b!263849 (= e!170960 (= (apply!262 lt!133587 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) (get!3093 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263850 () Bool)

(assert (=> b!263850 (= e!170965 e!170964)))

(declare-fun c!45059 () Bool)

(assert (=> b!263850 (= c!45059 (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun b!263851 () Bool)

(assert (=> b!263851 (= e!170961 (ListLongMap!3892 Nil!3849))))

(declare-fun b!263852 () Bool)

(declare-fun lt!133586 () Unit!8190)

(declare-fun lt!133589 () Unit!8190)

(assert (=> b!263852 (= lt!133586 lt!133589)))

(declare-fun lt!133591 () (_ BitVec 64))

(declare-fun lt!133588 () V!8523)

(declare-fun lt!133592 () ListLongMap!3891)

(declare-fun lt!133590 () (_ BitVec 64))

(assert (=> b!263852 (not (contains!1912 (+!710 lt!133592 (tuple2!4979 lt!133591 lt!133588)) lt!133590))))

(assert (=> b!263852 (= lt!133589 (addStillNotContains!129 lt!133592 lt!133591 lt!133588 lt!133590))))

(assert (=> b!263852 (= lt!133590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263852 (= lt!133588 (get!3093 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263852 (= lt!133591 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!263852 (= lt!133592 call!25260)))

(assert (=> b!263852 (= e!170959 (+!710 call!25260 (tuple2!4979 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263853 () Bool)

(assert (=> b!263853 (= e!170959 call!25260)))

(declare-fun b!263854 () Bool)

(assert (=> b!263854 (= e!170965 e!170960)))

(assert (=> b!263854 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun res!128837 () Bool)

(assert (=> b!263854 (= res!128837 (contains!1912 lt!133587 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263854 (=> (not res!128837) (not e!170960))))

(assert (= (and d!63493 c!45057) b!263851))

(assert (= (and d!63493 (not c!45057)) b!263847))

(assert (= (and b!263847 c!45060) b!263852))

(assert (= (and b!263847 (not c!45060)) b!263853))

(assert (= (or b!263852 b!263853) bm!25257))

(assert (= (and d!63493 res!128838) b!263845))

(assert (= (and b!263845 res!128835) b!263846))

(assert (= (and b!263846 res!128836) b!263844))

(assert (= (and b!263846 c!45058) b!263854))

(assert (= (and b!263846 (not c!45058)) b!263850))

(assert (= (and b!263854 res!128837) b!263849))

(assert (= (and b!263850 c!45059) b!263843))

(assert (= (and b!263850 (not c!45059)) b!263848))

(declare-fun b_lambda!8365 () Bool)

(assert (=> (not b_lambda!8365) (not b!263849)))

(assert (=> b!263849 t!8933))

(declare-fun b_and!13961 () Bool)

(assert (= b_and!13959 (and (=> t!8933 result!5433) b_and!13961)))

(declare-fun b_lambda!8367 () Bool)

(assert (=> (not b_lambda!8367) (not b!263852)))

(assert (=> b!263852 t!8933))

(declare-fun b_and!13963 () Bool)

(assert (= b_and!13961 (and (=> t!8933 result!5433) b_and!13963)))

(declare-fun m!280405 () Bool)

(assert (=> bm!25257 m!280405))

(assert (=> b!263844 m!279647))

(assert (=> b!263844 m!279647))

(assert (=> b!263844 m!279649))

(assert (=> b!263843 m!280405))

(declare-fun m!280407 () Bool)

(assert (=> b!263852 m!280407))

(assert (=> b!263852 m!279251))

(declare-fun m!280409 () Bool)

(assert (=> b!263852 m!280409))

(assert (=> b!263852 m!279647))

(assert (=> b!263852 m!279697))

(declare-fun m!280411 () Bool)

(assert (=> b!263852 m!280411))

(declare-fun m!280413 () Bool)

(assert (=> b!263852 m!280413))

(assert (=> b!263852 m!280411))

(assert (=> b!263852 m!279697))

(assert (=> b!263852 m!279251))

(assert (=> b!263852 m!279699))

(declare-fun m!280415 () Bool)

(assert (=> b!263848 m!280415))

(assert (=> b!263854 m!279647))

(assert (=> b!263854 m!279647))

(declare-fun m!280417 () Bool)

(assert (=> b!263854 m!280417))

(declare-fun m!280419 () Bool)

(assert (=> b!263845 m!280419))

(assert (=> b!263847 m!279647))

(assert (=> b!263847 m!279647))

(assert (=> b!263847 m!279649))

(declare-fun m!280421 () Bool)

(assert (=> d!63493 m!280421))

(assert (=> d!63493 m!279139))

(assert (=> b!263849 m!279251))

(assert (=> b!263849 m!279647))

(assert (=> b!263849 m!279697))

(assert (=> b!263849 m!279647))

(declare-fun m!280423 () Bool)

(assert (=> b!263849 m!280423))

(assert (=> b!263849 m!279697))

(assert (=> b!263849 m!279251))

(assert (=> b!263849 m!279699))

(assert (=> bm!25212 d!63493))

(declare-fun b!263856 () Bool)

(declare-fun e!170966 () Bool)

(declare-fun call!25261 () Bool)

(assert (=> b!263856 (= e!170966 call!25261)))

(declare-fun b!263857 () Bool)

(declare-fun e!170967 () Bool)

(assert (=> b!263857 (= e!170966 e!170967)))

(declare-fun lt!133593 () (_ BitVec 64))

(assert (=> b!263857 (= lt!133593 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133594 () Unit!8190)

(assert (=> b!263857 (= lt!133594 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7035 lt!133015) lt!133593 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263857 (arrayContainsKey!0 (_keys!7035 lt!133015) lt!133593 #b00000000000000000000000000000000)))

(declare-fun lt!133595 () Unit!8190)

(assert (=> b!263857 (= lt!133595 lt!133594)))

(declare-fun res!128840 () Bool)

(assert (=> b!263857 (= res!128840 (= (seekEntryOrOpen!0 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!7035 lt!133015) (mask!11209 lt!133015)) (Found!1200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263857 (=> (not res!128840) (not e!170967))))

(declare-fun b!263858 () Bool)

(assert (=> b!263858 (= e!170967 call!25261)))

(declare-fun bm!25258 () Bool)

(assert (=> bm!25258 (= call!25261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!7035 lt!133015) (mask!11209 lt!133015)))))

(declare-fun b!263855 () Bool)

(declare-fun e!170968 () Bool)

(assert (=> b!263855 (= e!170968 e!170966)))

(declare-fun c!45061 () Bool)

(assert (=> b!263855 (= c!45061 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63495 () Bool)

(declare-fun res!128839 () Bool)

(assert (=> d!63495 (=> res!128839 e!170968)))

(assert (=> d!63495 (= res!128839 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63495 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7035 lt!133015) (mask!11209 lt!133015)) e!170968)))

(assert (= (and d!63495 (not res!128839)) b!263855))

(assert (= (and b!263855 c!45061) b!263857))

(assert (= (and b!263855 (not c!45061)) b!263856))

(assert (= (and b!263857 res!128840) b!263858))

(assert (= (or b!263858 b!263856) bm!25258))

(assert (=> b!263857 m!280181))

(declare-fun m!280425 () Bool)

(assert (=> b!263857 m!280425))

(declare-fun m!280427 () Bool)

(assert (=> b!263857 m!280427))

(assert (=> b!263857 m!280181))

(declare-fun m!280429 () Bool)

(assert (=> b!263857 m!280429))

(declare-fun m!280431 () Bool)

(assert (=> bm!25258 m!280431))

(assert (=> b!263855 m!280181))

(assert (=> b!263855 m!280181))

(assert (=> b!263855 m!280185))

(assert (=> bm!25238 d!63495))

(declare-fun d!63497 () Bool)

(declare-fun res!128841 () Bool)

(declare-fun e!170969 () Bool)

(assert (=> d!63497 (=> res!128841 e!170969)))

(assert (=> d!63497 (= res!128841 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) key!932)))))

(assert (=> d!63497 (= (containsKey!312 (t!8929 (toList!1961 lt!133012)) key!932) e!170969)))

(declare-fun b!263859 () Bool)

(declare-fun e!170970 () Bool)

(assert (=> b!263859 (= e!170969 e!170970)))

(declare-fun res!128842 () Bool)

(assert (=> b!263859 (=> (not res!128842) (not e!170970))))

(assert (=> b!263859 (= res!128842 (and (or (not ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012)))) (bvsle (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) key!932)) ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (bvslt (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) key!932)))))

(declare-fun b!263860 () Bool)

(assert (=> b!263860 (= e!170970 (containsKey!312 (t!8929 (t!8929 (toList!1961 lt!133012))) key!932))))

(assert (= (and d!63497 (not res!128841)) b!263859))

(assert (= (and b!263859 res!128842) b!263860))

(declare-fun m!280433 () Bool)

(assert (=> b!263860 m!280433))

(assert (=> b!263446 d!63497))

(declare-fun d!63499 () Bool)

(assert (=> d!63499 (= (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133025) key!932)) (not ((_ is Some!325) (getValueByKey!320 (toList!1961 lt!133025) key!932))))))

(assert (=> d!63221 d!63499))

(declare-fun b!263861 () Bool)

(declare-fun e!170971 () Bool)

(assert (=> b!263861 (= e!170971 (contains!1915 (ite c!44995 (Cons!3849 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) Nil!3850) Nil!3850) (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263863 () Bool)

(declare-fun e!170974 () Bool)

(declare-fun call!25262 () Bool)

(assert (=> b!263863 (= e!170974 call!25262)))

(declare-fun b!263864 () Bool)

(declare-fun e!170972 () Bool)

(assert (=> b!263864 (= e!170972 e!170974)))

(declare-fun c!45062 () Bool)

(assert (=> b!263864 (= c!45062 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263862 () Bool)

(declare-fun e!170973 () Bool)

(assert (=> b!263862 (= e!170973 e!170972)))

(declare-fun res!128844 () Bool)

(assert (=> b!263862 (=> (not res!128844) (not e!170972))))

(assert (=> b!263862 (= res!128844 (not e!170971))))

(declare-fun res!128845 () Bool)

(assert (=> b!263862 (=> (not res!128845) (not e!170971))))

(assert (=> b!263862 (= res!128845 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63501 () Bool)

(declare-fun res!128843 () Bool)

(assert (=> d!63501 (=> res!128843 e!170973)))

(assert (=> d!63501 (= res!128843 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63501 (= (arrayNoDuplicates!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44995 (Cons!3849 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) e!170973)))

(declare-fun bm!25259 () Bool)

(assert (=> bm!25259 (= call!25262 (arrayNoDuplicates!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45062 (Cons!3849 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44995 (Cons!3849 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44995 (Cons!3849 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) Nil!3850) Nil!3850))))))

(declare-fun b!263865 () Bool)

(assert (=> b!263865 (= e!170974 call!25262)))

(assert (= (and d!63501 (not res!128843)) b!263862))

(assert (= (and b!263862 res!128845) b!263861))

(assert (= (and b!263862 res!128844) b!263864))

(assert (= (and b!263864 c!45062) b!263863))

(assert (= (and b!263864 (not c!45062)) b!263865))

(assert (= (or b!263863 b!263865) bm!25259))

(assert (=> b!263861 m!279597))

(assert (=> b!263861 m!279597))

(declare-fun m!280435 () Bool)

(assert (=> b!263861 m!280435))

(assert (=> b!263864 m!279597))

(assert (=> b!263864 m!279597))

(assert (=> b!263864 m!279783))

(assert (=> b!263862 m!279597))

(assert (=> b!263862 m!279597))

(assert (=> b!263862 m!279783))

(assert (=> bm!25259 m!279597))

(declare-fun m!280437 () Bool)

(assert (=> bm!25259 m!280437))

(assert (=> bm!25232 d!63501))

(assert (=> d!63361 d!63201))

(assert (=> d!63361 d!63129))

(declare-fun d!63503 () Bool)

(assert (=> d!63503 (= (size!6353 lt!133015) (bvadd (_size!1984 lt!133015) (bvsdiv (bvadd (extraKeys!4580 lt!133015) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!263575 d!63503))

(declare-fun d!63505 () Bool)

(declare-fun res!128846 () Bool)

(declare-fun e!170975 () Bool)

(assert (=> d!63505 (=> res!128846 e!170975)))

(assert (=> d!63505 (= res!128846 (= (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133220))))

(assert (=> d!63505 (= (arrayContainsKey!0 lt!133026 lt!133220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170975)))

(declare-fun b!263866 () Bool)

(declare-fun e!170976 () Bool)

(assert (=> b!263866 (= e!170975 e!170976)))

(declare-fun res!128847 () Bool)

(assert (=> b!263866 (=> (not res!128847) (not e!170976))))

(assert (=> b!263866 (= res!128847 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263867 () Bool)

(assert (=> b!263867 (= e!170976 (arrayContainsKey!0 lt!133026 lt!133220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63505 (not res!128846)) b!263866))

(assert (= (and b!263866 res!128847) b!263867))

(assert (=> d!63505 m!279457))

(declare-fun m!280439 () Bool)

(assert (=> b!263867 m!280439))

(assert (=> b!263273 d!63505))

(declare-fun d!63507 () Bool)

(declare-fun e!170977 () Bool)

(assert (=> d!63507 e!170977))

(declare-fun res!128848 () Bool)

(assert (=> d!63507 (=> res!128848 e!170977)))

(declare-fun lt!133597 () Bool)

(assert (=> d!63507 (= res!128848 (not lt!133597))))

(declare-fun lt!133596 () Bool)

(assert (=> d!63507 (= lt!133597 lt!133596)))

(declare-fun lt!133598 () Unit!8190)

(declare-fun e!170978 () Unit!8190)

(assert (=> d!63507 (= lt!133598 e!170978)))

(declare-fun c!45063 () Bool)

(assert (=> d!63507 (= c!45063 lt!133596)))

(assert (=> d!63507 (= lt!133596 (containsKey!312 (toList!1961 lt!133352) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63507 (= (contains!1912 lt!133352 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) lt!133597)))

(declare-fun b!263868 () Bool)

(declare-fun lt!133599 () Unit!8190)

(assert (=> b!263868 (= e!170978 lt!133599)))

(assert (=> b!263868 (= lt!133599 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133352) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263868 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133352) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263869 () Bool)

(declare-fun Unit!8224 () Unit!8190)

(assert (=> b!263869 (= e!170978 Unit!8224)))

(declare-fun b!263870 () Bool)

(assert (=> b!263870 (= e!170977 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133352) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!63507 c!45063) b!263868))

(assert (= (and d!63507 (not c!45063)) b!263869))

(assert (= (and d!63507 (not res!128848)) b!263870))

(assert (=> d!63507 m!279199))

(declare-fun m!280441 () Bool)

(assert (=> d!63507 m!280441))

(assert (=> b!263868 m!279199))

(declare-fun m!280443 () Bool)

(assert (=> b!263868 m!280443))

(assert (=> b!263868 m!279199))

(declare-fun m!280445 () Bool)

(assert (=> b!263868 m!280445))

(assert (=> b!263868 m!280445))

(declare-fun m!280447 () Bool)

(assert (=> b!263868 m!280447))

(assert (=> b!263870 m!279199))

(assert (=> b!263870 m!280445))

(assert (=> b!263870 m!280445))

(assert (=> b!263870 m!280447))

(assert (=> b!263438 d!63507))

(declare-fun d!63509 () Bool)

(declare-fun e!170979 () Bool)

(assert (=> d!63509 e!170979))

(declare-fun res!128849 () Bool)

(assert (=> d!63509 (=> res!128849 e!170979)))

(declare-fun lt!133601 () Bool)

(assert (=> d!63509 (= res!128849 (not lt!133601))))

(declare-fun lt!133600 () Bool)

(assert (=> d!63509 (= lt!133601 lt!133600)))

(declare-fun lt!133602 () Unit!8190)

(declare-fun e!170980 () Unit!8190)

(assert (=> d!63509 (= lt!133602 e!170980)))

(declare-fun c!45064 () Bool)

(assert (=> d!63509 (= c!45064 lt!133600)))

(assert (=> d!63509 (= lt!133600 (containsKey!312 (toList!1961 lt!133443) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(assert (=> d!63509 (= (contains!1912 lt!133443 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133601)))

(declare-fun b!263871 () Bool)

(declare-fun lt!133603 () Unit!8190)

(assert (=> b!263871 (= e!170980 lt!133603)))

(assert (=> b!263871 (= lt!133603 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133443) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(assert (=> b!263871 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133443) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun b!263872 () Bool)

(declare-fun Unit!8225 () Unit!8190)

(assert (=> b!263872 (= e!170980 Unit!8225)))

(declare-fun b!263873 () Bool)

(assert (=> b!263873 (= e!170979 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133443) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63509 c!45064) b!263871))

(assert (= (and d!63509 (not c!45064)) b!263872))

(assert (= (and d!63509 (not res!128849)) b!263873))

(declare-fun m!280449 () Bool)

(assert (=> d!63509 m!280449))

(declare-fun m!280451 () Bool)

(assert (=> b!263871 m!280451))

(assert (=> b!263871 m!279875))

(assert (=> b!263871 m!279875))

(declare-fun m!280453 () Bool)

(assert (=> b!263871 m!280453))

(assert (=> b!263873 m!279875))

(assert (=> b!263873 m!279875))

(assert (=> b!263873 m!280453))

(assert (=> d!63311 d!63509))

(declare-fun e!170982 () Option!326)

(declare-fun b!263876 () Bool)

(assert (=> b!263876 (= e!170982 (getValueByKey!320 (t!8929 lt!133444) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun b!263874 () Bool)

(declare-fun e!170981 () Option!326)

(assert (=> b!263874 (= e!170981 (Some!325 (_2!2500 (h!4514 lt!133444))))))

(declare-fun d!63511 () Bool)

(declare-fun c!45065 () Bool)

(assert (=> d!63511 (= c!45065 (and ((_ is Cons!3848) lt!133444) (= (_1!2500 (h!4514 lt!133444)) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(assert (=> d!63511 (= (getValueByKey!320 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) e!170981)))

(declare-fun b!263877 () Bool)

(assert (=> b!263877 (= e!170982 None!324)))

(declare-fun b!263875 () Bool)

(assert (=> b!263875 (= e!170981 e!170982)))

(declare-fun c!45066 () Bool)

(assert (=> b!263875 (= c!45066 (and ((_ is Cons!3848) lt!133444) (not (= (_1!2500 (h!4514 lt!133444)) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63511 c!45065) b!263874))

(assert (= (and d!63511 (not c!45065)) b!263875))

(assert (= (and b!263875 c!45066) b!263876))

(assert (= (and b!263875 (not c!45066)) b!263877))

(declare-fun m!280455 () Bool)

(assert (=> b!263876 m!280455))

(assert (=> d!63311 d!63511))

(declare-fun d!63513 () Bool)

(assert (=> d!63513 (= (getValueByKey!320 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133604 () Unit!8190)

(assert (=> d!63513 (= lt!133604 (choose!1294 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun e!170983 () Bool)

(assert (=> d!63513 e!170983))

(declare-fun res!128850 () Bool)

(assert (=> d!63513 (=> (not res!128850) (not e!170983))))

(assert (=> d!63513 (= res!128850 (isStrictlySorted!377 lt!133444))))

(assert (=> d!63513 (= (lemmaContainsTupThenGetReturnValue!176 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133604)))

(declare-fun b!263878 () Bool)

(declare-fun res!128851 () Bool)

(assert (=> b!263878 (=> (not res!128851) (not e!170983))))

(assert (=> b!263878 (= res!128851 (containsKey!312 lt!133444 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun b!263879 () Bool)

(assert (=> b!263879 (= e!170983 (contains!1914 lt!133444 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63513 res!128850) b!263878))

(assert (= (and b!263878 res!128851) b!263879))

(assert (=> d!63513 m!279869))

(declare-fun m!280457 () Bool)

(assert (=> d!63513 m!280457))

(declare-fun m!280459 () Bool)

(assert (=> d!63513 m!280459))

(declare-fun m!280461 () Bool)

(assert (=> b!263878 m!280461))

(declare-fun m!280463 () Bool)

(assert (=> b!263879 m!280463))

(assert (=> d!63311 d!63513))

(declare-fun bm!25260 () Bool)

(declare-fun call!25265 () List!3852)

(declare-fun call!25264 () List!3852)

(assert (=> bm!25260 (= call!25265 call!25264)))

(declare-fun bm!25261 () Bool)

(declare-fun call!25263 () List!3852)

(assert (=> bm!25261 (= call!25263 call!25265)))

(declare-fun b!263880 () Bool)

(declare-fun res!128852 () Bool)

(declare-fun e!170988 () Bool)

(assert (=> b!263880 (=> (not res!128852) (not e!170988))))

(declare-fun lt!133605 () List!3852)

(assert (=> b!263880 (= res!128852 (containsKey!312 lt!133605 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun c!45067 () Bool)

(declare-fun b!263881 () Bool)

(assert (=> b!263881 (= c!45067 (and ((_ is Cons!3848) (toList!1961 lt!133199)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133199))) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(declare-fun e!170987 () List!3852)

(declare-fun e!170984 () List!3852)

(assert (=> b!263881 (= e!170987 e!170984)))

(declare-fun b!263882 () Bool)

(declare-fun e!170986 () List!3852)

(assert (=> b!263882 (= e!170986 e!170987)))

(declare-fun c!45070 () Bool)

(assert (=> b!263882 (= c!45070 (and ((_ is Cons!3848) (toList!1961 lt!133199)) (= (_1!2500 (h!4514 (toList!1961 lt!133199))) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(declare-fun b!263883 () Bool)

(assert (=> b!263883 (= e!170988 (contains!1914 lt!133605 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(declare-fun b!263884 () Bool)

(assert (=> b!263884 (= e!170986 call!25264)))

(declare-fun b!263885 () Bool)

(assert (=> b!263885 (= e!170987 call!25265)))

(declare-fun b!263886 () Bool)

(declare-fun e!170985 () List!3852)

(assert (=> b!263886 (= e!170985 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133199)) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun b!263887 () Bool)

(assert (=> b!263887 (= e!170984 call!25263)))

(declare-fun bm!25262 () Bool)

(declare-fun c!45069 () Bool)

(assert (=> bm!25262 (= call!25264 ($colon$colon!108 e!170985 (ite c!45069 (h!4514 (toList!1961 lt!133199)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))))

(declare-fun c!45068 () Bool)

(assert (=> bm!25262 (= c!45068 c!45069)))

(declare-fun d!63515 () Bool)

(assert (=> d!63515 e!170988))

(declare-fun res!128853 () Bool)

(assert (=> d!63515 (=> (not res!128853) (not e!170988))))

(assert (=> d!63515 (= res!128853 (isStrictlySorted!377 lt!133605))))

(assert (=> d!63515 (= lt!133605 e!170986)))

(assert (=> d!63515 (= c!45069 (and ((_ is Cons!3848) (toList!1961 lt!133199)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133199))) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(assert (=> d!63515 (isStrictlySorted!377 (toList!1961 lt!133199))))

(assert (=> d!63515 (= (insertStrictlySorted!179 (toList!1961 lt!133199) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133605)))

(declare-fun b!263888 () Bool)

(assert (=> b!263888 (= e!170984 call!25263)))

(declare-fun b!263889 () Bool)

(assert (=> b!263889 (= e!170985 (ite c!45070 (t!8929 (toList!1961 lt!133199)) (ite c!45067 (Cons!3848 (h!4514 (toList!1961 lt!133199)) (t!8929 (toList!1961 lt!133199))) Nil!3849)))))

(assert (= (and d!63515 c!45069) b!263884))

(assert (= (and d!63515 (not c!45069)) b!263882))

(assert (= (and b!263882 c!45070) b!263885))

(assert (= (and b!263882 (not c!45070)) b!263881))

(assert (= (and b!263881 c!45067) b!263888))

(assert (= (and b!263881 (not c!45067)) b!263887))

(assert (= (or b!263888 b!263887) bm!25261))

(assert (= (or b!263885 bm!25261) bm!25260))

(assert (= (or b!263884 bm!25260) bm!25262))

(assert (= (and bm!25262 c!45068) b!263886))

(assert (= (and bm!25262 (not c!45068)) b!263889))

(assert (= (and d!63515 res!128853) b!263880))

(assert (= (and b!263880 res!128852) b!263883))

(declare-fun m!280465 () Bool)

(assert (=> bm!25262 m!280465))

(declare-fun m!280467 () Bool)

(assert (=> b!263886 m!280467))

(declare-fun m!280469 () Bool)

(assert (=> b!263883 m!280469))

(declare-fun m!280471 () Bool)

(assert (=> b!263880 m!280471))

(declare-fun m!280473 () Bool)

(assert (=> d!63515 m!280473))

(declare-fun m!280475 () Bool)

(assert (=> d!63515 m!280475))

(assert (=> d!63311 d!63515))

(declare-fun b!263892 () Bool)

(declare-fun e!170990 () Option!326)

(assert (=> b!263892 (= e!170990 (getValueByKey!320 (t!8929 (t!8929 lt!133266)) (_1!2500 lt!133020)))))

(declare-fun b!263890 () Bool)

(declare-fun e!170989 () Option!326)

(assert (=> b!263890 (= e!170989 (Some!325 (_2!2500 (h!4514 (t!8929 lt!133266)))))))

(declare-fun d!63517 () Bool)

(declare-fun c!45071 () Bool)

(assert (=> d!63517 (= c!45071 (and ((_ is Cons!3848) (t!8929 lt!133266)) (= (_1!2500 (h!4514 (t!8929 lt!133266))) (_1!2500 lt!133020))))))

(assert (=> d!63517 (= (getValueByKey!320 (t!8929 lt!133266) (_1!2500 lt!133020)) e!170989)))

(declare-fun b!263893 () Bool)

(assert (=> b!263893 (= e!170990 None!324)))

(declare-fun b!263891 () Bool)

(assert (=> b!263891 (= e!170989 e!170990)))

(declare-fun c!45072 () Bool)

(assert (=> b!263891 (= c!45072 (and ((_ is Cons!3848) (t!8929 lt!133266)) (not (= (_1!2500 (h!4514 (t!8929 lt!133266))) (_1!2500 lt!133020)))))))

(assert (= (and d!63517 c!45071) b!263890))

(assert (= (and d!63517 (not c!45071)) b!263891))

(assert (= (and b!263891 c!45072) b!263892))

(assert (= (and b!263891 (not c!45072)) b!263893))

(declare-fun m!280477 () Bool)

(assert (=> b!263892 m!280477))

(assert (=> b!263525 d!63517))

(declare-fun e!170996 () Bool)

(declare-fun b!263894 () Bool)

(declare-fun lt!133607 () ListLongMap!3891)

(assert (=> b!263894 (= e!170996 (= lt!133607 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504))))))

(declare-fun b!263895 () Bool)

(declare-fun e!170994 () Bool)

(assert (=> b!263895 (= e!170994 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263895 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!263896 () Bool)

(declare-fun res!128854 () Bool)

(declare-fun e!170995 () Bool)

(assert (=> b!263896 (=> (not res!128854) (not e!170995))))

(assert (=> b!263896 (= res!128854 (not (contains!1912 lt!133607 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263897 () Bool)

(declare-fun e!170997 () Bool)

(assert (=> b!263897 (= e!170995 e!170997)))

(declare-fun c!45074 () Bool)

(assert (=> b!263897 (= c!45074 e!170994)))

(declare-fun res!128855 () Bool)

(assert (=> b!263897 (=> (not res!128855) (not e!170994))))

(assert (=> b!263897 (= res!128855 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263898 () Bool)

(declare-fun e!170993 () ListLongMap!3891)

(declare-fun e!170991 () ListLongMap!3891)

(assert (=> b!263898 (= e!170993 e!170991)))

(declare-fun c!45076 () Bool)

(assert (=> b!263898 (= c!45076 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263899 () Bool)

(assert (=> b!263899 (= e!170996 (isEmpty!541 lt!133607))))

(declare-fun bm!25263 () Bool)

(declare-fun call!25266 () ListLongMap!3891)

(assert (=> bm!25263 (= call!25266 (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)))))

(declare-fun d!63519 () Bool)

(assert (=> d!63519 e!170995))

(declare-fun res!128857 () Bool)

(assert (=> d!63519 (=> (not res!128857) (not e!170995))))

(assert (=> d!63519 (= res!128857 (not (contains!1912 lt!133607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63519 (= lt!133607 e!170993)))

(declare-fun c!45073 () Bool)

(assert (=> d!63519 (= c!45073 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!63519 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63519 (= (getCurrentListMapNoExtraKeys!584 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)) lt!133607)))

(declare-fun b!263900 () Bool)

(assert (=> b!263900 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> b!263900 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6349 lt!133023)))))

(declare-fun e!170992 () Bool)

(assert (=> b!263900 (= e!170992 (= (apply!262 lt!133607 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!3093 (select (arr!5998 lt!133023) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263901 () Bool)

(assert (=> b!263901 (= e!170997 e!170996)))

(declare-fun c!45075 () Bool)

(assert (=> b!263901 (= c!45075 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263902 () Bool)

(assert (=> b!263902 (= e!170993 (ListLongMap!3892 Nil!3849))))

(declare-fun b!263903 () Bool)

(declare-fun lt!133606 () Unit!8190)

(declare-fun lt!133609 () Unit!8190)

(assert (=> b!263903 (= lt!133606 lt!133609)))

(declare-fun lt!133611 () (_ BitVec 64))

(declare-fun lt!133610 () (_ BitVec 64))

(declare-fun lt!133612 () ListLongMap!3891)

(declare-fun lt!133608 () V!8523)

(assert (=> b!263903 (not (contains!1912 (+!710 lt!133612 (tuple2!4979 lt!133611 lt!133608)) lt!133610))))

(assert (=> b!263903 (= lt!133609 (addStillNotContains!129 lt!133612 lt!133611 lt!133608 lt!133610))))

(assert (=> b!263903 (= lt!133610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263903 (= lt!133608 (get!3093 (select (arr!5998 lt!133023) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263903 (= lt!133611 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263903 (= lt!133612 call!25266)))

(assert (=> b!263903 (= e!170991 (+!710 call!25266 (tuple2!4979 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!3093 (select (arr!5998 lt!133023) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263904 () Bool)

(assert (=> b!263904 (= e!170991 call!25266)))

(declare-fun b!263905 () Bool)

(assert (=> b!263905 (= e!170997 e!170992)))

(assert (=> b!263905 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun res!128856 () Bool)

(assert (=> b!263905 (= res!128856 (contains!1912 lt!133607 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263905 (=> (not res!128856) (not e!170992))))

(assert (= (and d!63519 c!45073) b!263902))

(assert (= (and d!63519 (not c!45073)) b!263898))

(assert (= (and b!263898 c!45076) b!263903))

(assert (= (and b!263898 (not c!45076)) b!263904))

(assert (= (or b!263903 b!263904) bm!25263))

(assert (= (and d!63519 res!128857) b!263896))

(assert (= (and b!263896 res!128854) b!263897))

(assert (= (and b!263897 res!128855) b!263895))

(assert (= (and b!263897 c!45074) b!263905))

(assert (= (and b!263897 (not c!45074)) b!263901))

(assert (= (and b!263905 res!128856) b!263900))

(assert (= (and b!263901 c!45075) b!263894))

(assert (= (and b!263901 (not c!45075)) b!263899))

(declare-fun b_lambda!8369 () Bool)

(assert (=> (not b_lambda!8369) (not b!263900)))

(assert (=> b!263900 t!8933))

(declare-fun b_and!13965 () Bool)

(assert (= b_and!13963 (and (=> t!8933 result!5433) b_and!13965)))

(declare-fun b_lambda!8371 () Bool)

(assert (=> (not b_lambda!8371) (not b!263903)))

(assert (=> b!263903 t!8933))

(declare-fun b_and!13967 () Bool)

(assert (= b_and!13965 (and (=> t!8933 result!5433) b_and!13967)))

(declare-fun m!280479 () Bool)

(assert (=> bm!25263 m!280479))

(assert (=> b!263895 m!279457))

(assert (=> b!263895 m!279457))

(assert (=> b!263895 m!279467))

(assert (=> b!263894 m!280479))

(declare-fun m!280481 () Bool)

(assert (=> b!263903 m!280481))

(assert (=> b!263903 m!279251))

(declare-fun m!280483 () Bool)

(assert (=> b!263903 m!280483))

(assert (=> b!263903 m!279457))

(declare-fun m!280485 () Bool)

(assert (=> b!263903 m!280485))

(declare-fun m!280487 () Bool)

(assert (=> b!263903 m!280487))

(declare-fun m!280489 () Bool)

(assert (=> b!263903 m!280489))

(assert (=> b!263903 m!280487))

(assert (=> b!263903 m!280485))

(assert (=> b!263903 m!279251))

(declare-fun m!280491 () Bool)

(assert (=> b!263903 m!280491))

(declare-fun m!280493 () Bool)

(assert (=> b!263899 m!280493))

(assert (=> b!263905 m!279457))

(assert (=> b!263905 m!279457))

(declare-fun m!280495 () Bool)

(assert (=> b!263905 m!280495))

(declare-fun m!280497 () Bool)

(assert (=> b!263896 m!280497))

(assert (=> b!263898 m!279457))

(assert (=> b!263898 m!279457))

(assert (=> b!263898 m!279467))

(declare-fun m!280499 () Bool)

(assert (=> d!63519 m!280499))

(assert (=> d!63519 m!279139))

(assert (=> b!263900 m!279251))

(assert (=> b!263900 m!279457))

(assert (=> b!263900 m!280485))

(assert (=> b!263900 m!279457))

(declare-fun m!280501 () Bool)

(assert (=> b!263900 m!280501))

(assert (=> b!263900 m!280485))

(assert (=> b!263900 m!279251))

(assert (=> b!263900 m!280491))

(assert (=> b!263636 d!63519))

(declare-fun d!63521 () Bool)

(assert (=> d!63521 (= (inRange!0 (index!6971 lt!133366) (mask!11209 thiss!1504)) (and (bvsge (index!6971 lt!133366) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133366) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!263466 d!63521))

(declare-fun d!63523 () Bool)

(declare-fun e!170998 () Bool)

(assert (=> d!63523 e!170998))

(declare-fun res!128858 () Bool)

(assert (=> d!63523 (=> res!128858 e!170998)))

(declare-fun lt!133614 () Bool)

(assert (=> d!63523 (= res!128858 (not lt!133614))))

(declare-fun lt!133613 () Bool)

(assert (=> d!63523 (= lt!133614 lt!133613)))

(declare-fun lt!133615 () Unit!8190)

(declare-fun e!170999 () Unit!8190)

(assert (=> d!63523 (= lt!133615 e!170999)))

(declare-fun c!45077 () Bool)

(assert (=> d!63523 (= c!45077 lt!133613)))

(assert (=> d!63523 (= lt!133613 (containsKey!312 (toList!1961 lt!133468) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63523 (= (contains!1912 lt!133468 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133614)))

(declare-fun b!263906 () Bool)

(declare-fun lt!133616 () Unit!8190)

(assert (=> b!263906 (= e!170999 lt!133616)))

(assert (=> b!263906 (= lt!133616 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133468) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(assert (=> b!263906 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133468) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263907 () Bool)

(declare-fun Unit!8226 () Unit!8190)

(assert (=> b!263907 (= e!170999 Unit!8226)))

(declare-fun b!263908 () Bool)

(assert (=> b!263908 (= e!170998 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133468) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63523 c!45077) b!263906))

(assert (= (and d!63523 (not c!45077)) b!263907))

(assert (= (and d!63523 (not res!128858)) b!263908))

(declare-fun m!280503 () Bool)

(assert (=> d!63523 m!280503))

(declare-fun m!280505 () Bool)

(assert (=> b!263906 m!280505))

(assert (=> b!263906 m!279957))

(assert (=> b!263906 m!279957))

(declare-fun m!280507 () Bool)

(assert (=> b!263906 m!280507))

(assert (=> b!263908 m!279957))

(assert (=> b!263908 m!279957))

(assert (=> b!263908 m!280507))

(assert (=> d!63339 d!63523))

(declare-fun e!171001 () Option!326)

(declare-fun b!263911 () Bool)

(assert (=> b!263911 (= e!171001 (getValueByKey!320 (t!8929 lt!133469) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263909 () Bool)

(declare-fun e!171000 () Option!326)

(assert (=> b!263909 (= e!171000 (Some!325 (_2!2500 (h!4514 lt!133469))))))

(declare-fun d!63525 () Bool)

(declare-fun c!45078 () Bool)

(assert (=> d!63525 (= c!45078 (and ((_ is Cons!3848) lt!133469) (= (_1!2500 (h!4514 lt!133469)) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63525 (= (getValueByKey!320 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) e!171000)))

(declare-fun b!263912 () Bool)

(assert (=> b!263912 (= e!171001 None!324)))

(declare-fun b!263910 () Bool)

(assert (=> b!263910 (= e!171000 e!171001)))

(declare-fun c!45079 () Bool)

(assert (=> b!263910 (= c!45079 (and ((_ is Cons!3848) lt!133469) (not (= (_1!2500 (h!4514 lt!133469)) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63525 c!45078) b!263909))

(assert (= (and d!63525 (not c!45078)) b!263910))

(assert (= (and b!263910 c!45079) b!263911))

(assert (= (and b!263910 (not c!45079)) b!263912))

(declare-fun m!280509 () Bool)

(assert (=> b!263911 m!280509))

(assert (=> d!63339 d!63525))

(declare-fun d!63527 () Bool)

(assert (=> d!63527 (= (getValueByKey!320 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133617 () Unit!8190)

(assert (=> d!63527 (= lt!133617 (choose!1294 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun e!171002 () Bool)

(assert (=> d!63527 e!171002))

(declare-fun res!128859 () Bool)

(assert (=> d!63527 (=> (not res!128859) (not e!171002))))

(assert (=> d!63527 (= res!128859 (isStrictlySorted!377 lt!133469))))

(assert (=> d!63527 (= (lemmaContainsTupThenGetReturnValue!176 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133617)))

(declare-fun b!263913 () Bool)

(declare-fun res!128860 () Bool)

(assert (=> b!263913 (=> (not res!128860) (not e!171002))))

(assert (=> b!263913 (= res!128860 (containsKey!312 lt!133469 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263914 () Bool)

(assert (=> b!263914 (= e!171002 (contains!1914 lt!133469 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63527 res!128859) b!263913))

(assert (= (and b!263913 res!128860) b!263914))

(assert (=> d!63527 m!279951))

(declare-fun m!280511 () Bool)

(assert (=> d!63527 m!280511))

(declare-fun m!280513 () Bool)

(assert (=> d!63527 m!280513))

(declare-fun m!280515 () Bool)

(assert (=> b!263913 m!280515))

(declare-fun m!280517 () Bool)

(assert (=> b!263914 m!280517))

(assert (=> d!63339 d!63527))

(declare-fun bm!25264 () Bool)

(declare-fun call!25269 () List!3852)

(declare-fun call!25268 () List!3852)

(assert (=> bm!25264 (= call!25269 call!25268)))

(declare-fun bm!25265 () Bool)

(declare-fun call!25267 () List!3852)

(assert (=> bm!25265 (= call!25267 call!25269)))

(declare-fun b!263915 () Bool)

(declare-fun res!128861 () Bool)

(declare-fun e!171007 () Bool)

(assert (=> b!263915 (=> (not res!128861) (not e!171007))))

(declare-fun lt!133618 () List!3852)

(assert (=> b!263915 (= res!128861 (containsKey!312 lt!133618 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun c!45080 () Bool)

(declare-fun b!263916 () Bool)

(assert (=> b!263916 (= c!45080 (and ((_ is Cons!3848) (toList!1961 lt!133248)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133248))) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(declare-fun e!171006 () List!3852)

(declare-fun e!171003 () List!3852)

(assert (=> b!263916 (= e!171006 e!171003)))

(declare-fun b!263917 () Bool)

(declare-fun e!171005 () List!3852)

(assert (=> b!263917 (= e!171005 e!171006)))

(declare-fun c!45083 () Bool)

(assert (=> b!263917 (= c!45083 (and ((_ is Cons!3848) (toList!1961 lt!133248)) (= (_1!2500 (h!4514 (toList!1961 lt!133248))) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263918 () Bool)

(assert (=> b!263918 (= e!171007 (contains!1914 lt!133618 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!263919 () Bool)

(assert (=> b!263919 (= e!171005 call!25268)))

(declare-fun b!263920 () Bool)

(assert (=> b!263920 (= e!171006 call!25269)))

(declare-fun e!171004 () List!3852)

(declare-fun b!263921 () Bool)

(assert (=> b!263921 (= e!171004 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133248)) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263922 () Bool)

(assert (=> b!263922 (= e!171003 call!25267)))

(declare-fun c!45082 () Bool)

(declare-fun bm!25266 () Bool)

(assert (=> bm!25266 (= call!25268 ($colon$colon!108 e!171004 (ite c!45082 (h!4514 (toList!1961 lt!133248)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))))

(declare-fun c!45081 () Bool)

(assert (=> bm!25266 (= c!45081 c!45082)))

(declare-fun d!63529 () Bool)

(assert (=> d!63529 e!171007))

(declare-fun res!128862 () Bool)

(assert (=> d!63529 (=> (not res!128862) (not e!171007))))

(assert (=> d!63529 (= res!128862 (isStrictlySorted!377 lt!133618))))

(assert (=> d!63529 (= lt!133618 e!171005)))

(assert (=> d!63529 (= c!45082 (and ((_ is Cons!3848) (toList!1961 lt!133248)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133248))) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63529 (isStrictlySorted!377 (toList!1961 lt!133248))))

(assert (=> d!63529 (= (insertStrictlySorted!179 (toList!1961 lt!133248) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133618)))

(declare-fun b!263923 () Bool)

(assert (=> b!263923 (= e!171003 call!25267)))

(declare-fun b!263924 () Bool)

(assert (=> b!263924 (= e!171004 (ite c!45083 (t!8929 (toList!1961 lt!133248)) (ite c!45080 (Cons!3848 (h!4514 (toList!1961 lt!133248)) (t!8929 (toList!1961 lt!133248))) Nil!3849)))))

(assert (= (and d!63529 c!45082) b!263919))

(assert (= (and d!63529 (not c!45082)) b!263917))

(assert (= (and b!263917 c!45083) b!263920))

(assert (= (and b!263917 (not c!45083)) b!263916))

(assert (= (and b!263916 c!45080) b!263923))

(assert (= (and b!263916 (not c!45080)) b!263922))

(assert (= (or b!263923 b!263922) bm!25265))

(assert (= (or b!263920 bm!25265) bm!25264))

(assert (= (or b!263919 bm!25264) bm!25266))

(assert (= (and bm!25266 c!45081) b!263921))

(assert (= (and bm!25266 (not c!45081)) b!263924))

(assert (= (and d!63529 res!128862) b!263915))

(assert (= (and b!263915 res!128861) b!263918))

(declare-fun m!280519 () Bool)

(assert (=> bm!25266 m!280519))

(declare-fun m!280521 () Bool)

(assert (=> b!263921 m!280521))

(declare-fun m!280523 () Bool)

(assert (=> b!263918 m!280523))

(declare-fun m!280525 () Bool)

(assert (=> b!263915 m!280525))

(declare-fun m!280527 () Bool)

(assert (=> d!63529 m!280527))

(declare-fun m!280529 () Bool)

(assert (=> d!63529 m!280529))

(assert (=> d!63339 d!63529))

(declare-fun bm!25267 () Bool)

(declare-fun call!25272 () List!3852)

(declare-fun call!25271 () List!3852)

(assert (=> bm!25267 (= call!25272 call!25271)))

(declare-fun bm!25268 () Bool)

(declare-fun call!25270 () List!3852)

(assert (=> bm!25268 (= call!25270 call!25272)))

(declare-fun b!263925 () Bool)

(declare-fun res!128863 () Bool)

(declare-fun e!171012 () Bool)

(assert (=> b!263925 (=> (not res!128863) (not e!171012))))

(declare-fun lt!133619 () List!3852)

(assert (=> b!263925 (= res!128863 (containsKey!312 lt!133619 (_1!2500 lt!133020)))))

(declare-fun b!263926 () Bool)

(declare-fun c!45084 () Bool)

(assert (=> b!263926 (= c!45084 (and ((_ is Cons!3848) (t!8929 (toList!1961 (map!2758 thiss!1504)))) (bvsgt (_1!2500 (h!4514 (t!8929 (toList!1961 (map!2758 thiss!1504))))) (_1!2500 lt!133020))))))

(declare-fun e!171011 () List!3852)

(declare-fun e!171008 () List!3852)

(assert (=> b!263926 (= e!171011 e!171008)))

(declare-fun b!263927 () Bool)

(declare-fun e!171010 () List!3852)

(assert (=> b!263927 (= e!171010 e!171011)))

(declare-fun c!45087 () Bool)

(assert (=> b!263927 (= c!45087 (and ((_ is Cons!3848) (t!8929 (toList!1961 (map!2758 thiss!1504)))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 (map!2758 thiss!1504))))) (_1!2500 lt!133020))))))

(declare-fun b!263928 () Bool)

(assert (=> b!263928 (= e!171012 (contains!1914 lt!133619 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!263929 () Bool)

(assert (=> b!263929 (= e!171010 call!25271)))

(declare-fun b!263930 () Bool)

(assert (=> b!263930 (= e!171011 call!25272)))

(declare-fun b!263931 () Bool)

(declare-fun e!171009 () List!3852)

(assert (=> b!263931 (= e!171009 (insertStrictlySorted!179 (t!8929 (t!8929 (toList!1961 (map!2758 thiss!1504)))) (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun b!263932 () Bool)

(assert (=> b!263932 (= e!171008 call!25270)))

(declare-fun bm!25269 () Bool)

(declare-fun c!45086 () Bool)

(assert (=> bm!25269 (= call!25271 ($colon$colon!108 e!171009 (ite c!45086 (h!4514 (t!8929 (toList!1961 (map!2758 thiss!1504)))) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020)))))))

(declare-fun c!45085 () Bool)

(assert (=> bm!25269 (= c!45085 c!45086)))

(declare-fun d!63531 () Bool)

(assert (=> d!63531 e!171012))

(declare-fun res!128864 () Bool)

(assert (=> d!63531 (=> (not res!128864) (not e!171012))))

(assert (=> d!63531 (= res!128864 (isStrictlySorted!377 lt!133619))))

(assert (=> d!63531 (= lt!133619 e!171010)))

(assert (=> d!63531 (= c!45086 (and ((_ is Cons!3848) (t!8929 (toList!1961 (map!2758 thiss!1504)))) (bvslt (_1!2500 (h!4514 (t!8929 (toList!1961 (map!2758 thiss!1504))))) (_1!2500 lt!133020))))))

(assert (=> d!63531 (isStrictlySorted!377 (t!8929 (toList!1961 (map!2758 thiss!1504))))))

(assert (=> d!63531 (= (insertStrictlySorted!179 (t!8929 (toList!1961 (map!2758 thiss!1504))) (_1!2500 lt!133020) (_2!2500 lt!133020)) lt!133619)))

(declare-fun b!263933 () Bool)

(assert (=> b!263933 (= e!171008 call!25270)))

(declare-fun b!263934 () Bool)

(assert (=> b!263934 (= e!171009 (ite c!45087 (t!8929 (t!8929 (toList!1961 (map!2758 thiss!1504)))) (ite c!45084 (Cons!3848 (h!4514 (t!8929 (toList!1961 (map!2758 thiss!1504)))) (t!8929 (t!8929 (toList!1961 (map!2758 thiss!1504))))) Nil!3849)))))

(assert (= (and d!63531 c!45086) b!263929))

(assert (= (and d!63531 (not c!45086)) b!263927))

(assert (= (and b!263927 c!45087) b!263930))

(assert (= (and b!263927 (not c!45087)) b!263926))

(assert (= (and b!263926 c!45084) b!263933))

(assert (= (and b!263926 (not c!45084)) b!263932))

(assert (= (or b!263933 b!263932) bm!25268))

(assert (= (or b!263930 bm!25268) bm!25267))

(assert (= (or b!263929 bm!25267) bm!25269))

(assert (= (and bm!25269 c!45085) b!263931))

(assert (= (and bm!25269 (not c!45085)) b!263934))

(assert (= (and d!63531 res!128864) b!263925))

(assert (= (and b!263925 res!128863) b!263928))

(declare-fun m!280531 () Bool)

(assert (=> bm!25269 m!280531))

(declare-fun m!280533 () Bool)

(assert (=> b!263931 m!280533))

(declare-fun m!280535 () Bool)

(assert (=> b!263928 m!280535))

(declare-fun m!280537 () Bool)

(assert (=> b!263925 m!280537))

(declare-fun m!280539 () Bool)

(assert (=> d!63531 m!280539))

(assert (=> d!63531 m!280339))

(assert (=> b!263673 d!63531))

(declare-fun b!263936 () Bool)

(declare-fun e!171013 () Bool)

(declare-fun call!25273 () Bool)

(assert (=> b!263936 (= e!171013 call!25273)))

(declare-fun b!263937 () Bool)

(declare-fun e!171014 () Bool)

(assert (=> b!263937 (= e!171013 e!171014)))

(declare-fun lt!133620 () (_ BitVec 64))

(assert (=> b!263937 (= lt!133620 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133621 () Unit!8190)

(assert (=> b!263937 (= lt!133621 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133620 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263937 (arrayContainsKey!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133620 #b00000000000000000000000000000000)))

(declare-fun lt!133622 () Unit!8190)

(assert (=> b!263937 (= lt!133622 lt!133621)))

(declare-fun res!128866 () Bool)

(assert (=> b!263937 (= res!128866 (= (seekEntryOrOpen!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)) (Found!1200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263937 (=> (not res!128866) (not e!171014))))

(declare-fun b!263938 () Bool)

(assert (=> b!263938 (= e!171014 call!25273)))

(declare-fun bm!25270 () Bool)

(assert (=> bm!25270 (= call!25273 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)))))

(declare-fun b!263935 () Bool)

(declare-fun e!171015 () Bool)

(assert (=> b!263935 (= e!171015 e!171013)))

(declare-fun c!45088 () Bool)

(assert (=> b!263935 (= c!45088 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63533 () Bool)

(declare-fun res!128865 () Bool)

(assert (=> d!63533 (=> res!128865 e!171015)))

(assert (=> d!63533 (= res!128865 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!63533 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)) e!171015)))

(assert (= (and d!63533 (not res!128865)) b!263935))

(assert (= (and b!263935 c!45088) b!263937))

(assert (= (and b!263935 (not c!45088)) b!263936))

(assert (= (and b!263937 res!128866) b!263938))

(assert (= (or b!263938 b!263936) bm!25270))

(declare-fun m!280541 () Bool)

(assert (=> b!263937 m!280541))

(declare-fun m!280543 () Bool)

(assert (=> b!263937 m!280543))

(declare-fun m!280545 () Bool)

(assert (=> b!263937 m!280545))

(assert (=> b!263937 m!280541))

(declare-fun m!280547 () Bool)

(assert (=> b!263937 m!280547))

(declare-fun m!280549 () Bool)

(assert (=> bm!25270 m!280549))

(assert (=> b!263935 m!280541))

(assert (=> b!263935 m!280541))

(declare-fun m!280551 () Bool)

(assert (=> b!263935 m!280551))

(assert (=> bm!25239 d!63533))

(declare-fun d!63535 () Bool)

(assert (=> d!63535 (= (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297))) (not (isEmpty!540 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))))

(declare-fun bs!9294 () Bool)

(assert (= bs!9294 d!63535))

(assert (=> bs!9294 m!279559))

(declare-fun m!280553 () Bool)

(assert (=> bs!9294 m!280553))

(assert (=> b!263375 d!63535))

(declare-fun b!263941 () Bool)

(declare-fun e!171017 () Option!326)

(assert (=> b!263941 (= e!171017 (getValueByKey!320 (t!8929 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (select (arr!5999 lt!133026) index!297)))))

(declare-fun b!263939 () Bool)

(declare-fun e!171016 () Option!326)

(assert (=> b!263939 (= e!171016 (Some!325 (_2!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))))))

(declare-fun d!63537 () Bool)

(declare-fun c!45089 () Bool)

(assert (=> d!63537 (= c!45089 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (select (arr!5999 lt!133026) index!297))))))

(assert (=> d!63537 (= (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)) e!171016)))

(declare-fun b!263942 () Bool)

(assert (=> b!263942 (= e!171017 None!324)))

(declare-fun b!263940 () Bool)

(assert (=> b!263940 (= e!171016 e!171017)))

(declare-fun c!45090 () Bool)

(assert (=> b!263940 (= c!45090 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (not (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (select (arr!5999 lt!133026) index!297)))))))

(assert (= (and d!63537 c!45089) b!263939))

(assert (= (and d!63537 (not c!45089)) b!263940))

(assert (= (and b!263940 c!45090) b!263941))

(assert (= (and b!263940 (not c!45090)) b!263942))

(assert (=> b!263941 m!279307))

(declare-fun m!280555 () Bool)

(assert (=> b!263941 m!280555))

(assert (=> b!263375 d!63537))

(declare-fun b!263945 () Bool)

(declare-fun e!171019 () Option!326)

(assert (=> b!263945 (= e!171019 (getValueByKey!320 (t!8929 (toList!1961 lt!133443)) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))

(declare-fun b!263943 () Bool)

(declare-fun e!171018 () Option!326)

(assert (=> b!263943 (= e!171018 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133443)))))))

(declare-fun d!63539 () Bool)

(declare-fun c!45091 () Bool)

(assert (=> d!63539 (= c!45091 (and ((_ is Cons!3848) (toList!1961 lt!133443)) (= (_1!2500 (h!4514 (toList!1961 lt!133443))) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))

(assert (=> d!63539 (= (getValueByKey!320 (toList!1961 lt!133443) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) e!171018)))

(declare-fun b!263946 () Bool)

(assert (=> b!263946 (= e!171019 None!324)))

(declare-fun b!263944 () Bool)

(assert (=> b!263944 (= e!171018 e!171019)))

(declare-fun c!45092 () Bool)

(assert (=> b!263944 (= c!45092 (and ((_ is Cons!3848) (toList!1961 lt!133443)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133443))) (_1!2500 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63539 c!45091) b!263943))

(assert (= (and d!63539 (not c!45091)) b!263944))

(assert (= (and b!263944 c!45092) b!263945))

(assert (= (and b!263944 (not c!45092)) b!263946))

(declare-fun m!280557 () Bool)

(assert (=> b!263945 m!280557))

(assert (=> b!263616 d!63539))

(declare-fun d!63541 () Bool)

(assert (=> d!63541 (= (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133245)) (v!5508 (getValueByKey!320 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133245)))))

(assert (=> d!63349 d!63541))

(declare-fun b!263949 () Bool)

(declare-fun e!171021 () Option!326)

(assert (=> b!263949 (= e!171021 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))) lt!133245))))

(declare-fun b!263947 () Bool)

(declare-fun e!171020 () Option!326)

(assert (=> b!263947 (= e!171020 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))))

(declare-fun d!63543 () Bool)

(declare-fun c!45093 () Bool)

(assert (=> d!63543 (= c!45093 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))) lt!133245)))))

(assert (=> d!63543 (= (getValueByKey!320 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133245) e!171020)))

(declare-fun b!263950 () Bool)

(assert (=> b!263950 (= e!171021 None!324)))

(declare-fun b!263948 () Bool)

(assert (=> b!263948 (= e!171020 e!171021)))

(declare-fun c!45094 () Bool)

(assert (=> b!263948 (= c!45094 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))) lt!133245))))))

(assert (= (and d!63543 c!45093) b!263947))

(assert (= (and d!63543 (not c!45093)) b!263948))

(assert (= (and b!263948 c!45094) b!263949))

(assert (= (and b!263948 (not c!45094)) b!263950))

(declare-fun m!280559 () Bool)

(assert (=> b!263949 m!280559))

(assert (=> d!63349 d!63543))

(declare-fun d!63545 () Bool)

(assert (=> d!63545 (arrayContainsKey!0 (_keys!7035 thiss!1504) lt!133294 #b00000000000000000000000000000000)))

(declare-fun lt!133623 () Unit!8190)

(assert (=> d!63545 (= lt!133623 (choose!13 (_keys!7035 thiss!1504) lt!133294 #b00000000000000000000000000000000))))

(assert (=> d!63545 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63545 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7035 thiss!1504) lt!133294 #b00000000000000000000000000000000) lt!133623)))

(declare-fun bs!9295 () Bool)

(assert (= bs!9295 d!63545))

(assert (=> bs!9295 m!279477))

(declare-fun m!280561 () Bool)

(assert (=> bs!9295 m!280561))

(assert (=> b!263304 d!63545))

(declare-fun d!63547 () Bool)

(declare-fun res!128867 () Bool)

(declare-fun e!171022 () Bool)

(assert (=> d!63547 (=> res!128867 e!171022)))

(assert (=> d!63547 (= res!128867 (= (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) lt!133294))))

(assert (=> d!63547 (= (arrayContainsKey!0 (_keys!7035 thiss!1504) lt!133294 #b00000000000000000000000000000000) e!171022)))

(declare-fun b!263951 () Bool)

(declare-fun e!171023 () Bool)

(assert (=> b!263951 (= e!171022 e!171023)))

(declare-fun res!128868 () Bool)

(assert (=> b!263951 (=> (not res!128868) (not e!171023))))

(assert (=> b!263951 (= res!128868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!263952 () Bool)

(assert (=> b!263952 (= e!171023 (arrayContainsKey!0 (_keys!7035 thiss!1504) lt!133294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63547 (not res!128867)) b!263951))

(assert (= (and b!263951 res!128868) b!263952))

(assert (=> d!63547 m!279199))

(declare-fun m!280563 () Bool)

(assert (=> b!263952 m!280563))

(assert (=> b!263304 d!63547))

(declare-fun b!263953 () Bool)

(declare-fun e!171026 () SeekEntryResult!1200)

(declare-fun lt!133625 () SeekEntryResult!1200)

(assert (=> b!263953 (= e!171026 (MissingZero!1200 (index!6972 lt!133625)))))

(declare-fun b!263954 () Bool)

(declare-fun e!171025 () SeekEntryResult!1200)

(declare-fun e!171024 () SeekEntryResult!1200)

(assert (=> b!263954 (= e!171025 e!171024)))

(declare-fun lt!133626 () (_ BitVec 64))

(assert (=> b!263954 (= lt!133626 (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133625)))))

(declare-fun c!45097 () Bool)

(assert (=> b!263954 (= c!45097 (= lt!133626 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263955 () Bool)

(declare-fun c!45095 () Bool)

(assert (=> b!263955 (= c!45095 (= lt!133626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263955 (= e!171024 e!171026)))

(declare-fun b!263956 () Bool)

(assert (=> b!263956 (= e!171024 (Found!1200 (index!6972 lt!133625)))))

(declare-fun b!263957 () Bool)

(assert (=> b!263957 (= e!171026 (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133625) (index!6972 lt!133625) (index!6972 lt!133625) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun d!63549 () Bool)

(declare-fun lt!133624 () SeekEntryResult!1200)

(assert (=> d!63549 (and (or ((_ is Undefined!1200) lt!133624) (not ((_ is Found!1200) lt!133624)) (and (bvsge (index!6971 lt!133624) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133624) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133624) ((_ is Found!1200) lt!133624) (not ((_ is MissingZero!1200) lt!133624)) (and (bvsge (index!6970 lt!133624) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133624) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133624) ((_ is Found!1200) lt!133624) ((_ is MissingZero!1200) lt!133624) (not ((_ is MissingVacant!1200) lt!133624)) (and (bvsge (index!6973 lt!133624) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133624) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133624) (ite ((_ is Found!1200) lt!133624) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6971 lt!133624)) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1200) lt!133624) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6970 lt!133624)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1200) lt!133624) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133624)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63549 (= lt!133624 e!171025)))

(declare-fun c!45096 () Bool)

(assert (=> d!63549 (= c!45096 (and ((_ is Intermediate!1200) lt!133625) (undefined!2012 lt!133625)))))

(assert (=> d!63549 (= lt!133625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(assert (=> d!63549 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63549 (= (seekEntryOrOpen!0 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) lt!133624)))

(declare-fun b!263958 () Bool)

(assert (=> b!263958 (= e!171025 Undefined!1200)))

(assert (= (and d!63549 c!45096) b!263958))

(assert (= (and d!63549 (not c!45096)) b!263954))

(assert (= (and b!263954 c!45097) b!263956))

(assert (= (and b!263954 (not c!45097)) b!263955))

(assert (= (and b!263955 c!45095) b!263953))

(assert (= (and b!263955 (not c!45095)) b!263957))

(declare-fun m!280565 () Bool)

(assert (=> b!263954 m!280565))

(assert (=> b!263957 m!279199))

(declare-fun m!280567 () Bool)

(assert (=> b!263957 m!280567))

(declare-fun m!280569 () Bool)

(assert (=> d!63549 m!280569))

(assert (=> d!63549 m!279139))

(declare-fun m!280571 () Bool)

(assert (=> d!63549 m!280571))

(assert (=> d!63549 m!279199))

(declare-fun m!280573 () Bool)

(assert (=> d!63549 m!280573))

(declare-fun m!280575 () Bool)

(assert (=> d!63549 m!280575))

(assert (=> d!63549 m!280573))

(assert (=> d!63549 m!279199))

(declare-fun m!280577 () Bool)

(assert (=> d!63549 m!280577))

(assert (=> b!263304 d!63549))

(declare-fun d!63551 () Bool)

(assert (=> d!63551 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5508 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63217 d!63551))

(declare-fun b!263961 () Bool)

(declare-fun e!171028 () Option!326)

(assert (=> b!263961 (= e!171028 (getValueByKey!320 (t!8929 (toList!1961 lt!133256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263959 () Bool)

(declare-fun e!171027 () Option!326)

(assert (=> b!263959 (= e!171027 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133256)))))))

(declare-fun d!63553 () Bool)

(declare-fun c!45098 () Bool)

(assert (=> d!63553 (= c!45098 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (= (_1!2500 (h!4514 (toList!1961 lt!133256))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63553 (= (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000) e!171027)))

(declare-fun b!263962 () Bool)

(assert (=> b!263962 (= e!171028 None!324)))

(declare-fun b!263960 () Bool)

(assert (=> b!263960 (= e!171027 e!171028)))

(declare-fun c!45099 () Bool)

(assert (=> b!263960 (= c!45099 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133256))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!63553 c!45098) b!263959))

(assert (= (and d!63553 (not c!45098)) b!263960))

(assert (= (and b!263960 c!45099) b!263961))

(assert (= (and b!263960 (not c!45099)) b!263962))

(declare-fun m!280579 () Bool)

(assert (=> b!263961 m!280579))

(assert (=> d!63217 d!63553))

(declare-fun d!63555 () Bool)

(assert (=> d!63555 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133199) lt!133190)) (v!5508 (getValueByKey!320 (toList!1961 lt!133199) lt!133190)))))

(assert (=> d!63289 d!63555))

(declare-fun b!263965 () Bool)

(declare-fun e!171030 () Option!326)

(assert (=> b!263965 (= e!171030 (getValueByKey!320 (t!8929 (toList!1961 lt!133199)) lt!133190))))

(declare-fun b!263963 () Bool)

(declare-fun e!171029 () Option!326)

(assert (=> b!263963 (= e!171029 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133199)))))))

(declare-fun d!63557 () Bool)

(declare-fun c!45100 () Bool)

(assert (=> d!63557 (= c!45100 (and ((_ is Cons!3848) (toList!1961 lt!133199)) (= (_1!2500 (h!4514 (toList!1961 lt!133199))) lt!133190)))))

(assert (=> d!63557 (= (getValueByKey!320 (toList!1961 lt!133199) lt!133190) e!171029)))

(declare-fun b!263966 () Bool)

(assert (=> b!263966 (= e!171030 None!324)))

(declare-fun b!263964 () Bool)

(assert (=> b!263964 (= e!171029 e!171030)))

(declare-fun c!45101 () Bool)

(assert (=> b!263964 (= c!45101 (and ((_ is Cons!3848) (toList!1961 lt!133199)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133199))) lt!133190))))))

(assert (= (and d!63557 c!45100) b!263963))

(assert (= (and d!63557 (not c!45100)) b!263964))

(assert (= (and b!263964 c!45101) b!263965))

(assert (= (and b!263964 (not c!45101)) b!263966))

(declare-fun m!280581 () Bool)

(assert (=> b!263965 m!280581))

(assert (=> d!63289 d!63557))

(declare-fun d!63559 () Bool)

(assert (=> d!63559 (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))

(declare-fun lt!133627 () Unit!8190)

(assert (=> d!63559 (= lt!133627 (choose!1293 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))

(declare-fun e!171031 () Bool)

(assert (=> d!63559 e!171031))

(declare-fun res!128869 () Bool)

(assert (=> d!63559 (=> (not res!128869) (not e!171031))))

(assert (=> d!63559 (= res!128869 (isStrictlySorted!377 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))))

(assert (=> d!63559 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932) lt!133627)))

(declare-fun b!263967 () Bool)

(assert (=> b!263967 (= e!171031 (containsKey!312 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))

(assert (= (and d!63559 res!128869) b!263967))

(assert (=> d!63559 m!279529))

(assert (=> d!63559 m!279529))

(assert (=> d!63559 m!279531))

(declare-fun m!280583 () Bool)

(assert (=> d!63559 m!280583))

(declare-fun m!280585 () Bool)

(assert (=> d!63559 m!280585))

(assert (=> b!263967 m!279525))

(assert (=> b!263359 d!63559))

(declare-fun d!63561 () Bool)

(assert (=> d!63561 (= (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932))))))

(declare-fun bs!9296 () Bool)

(assert (= bs!9296 d!63561))

(assert (=> bs!9296 m!279529))

(declare-fun m!280587 () Bool)

(assert (=> bs!9296 m!280587))

(assert (=> b!263359 d!63561))

(declare-fun b!263970 () Bool)

(declare-fun e!171033 () Option!326)

(assert (=> b!263970 (= e!171033 (getValueByKey!320 (t!8929 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) key!932))))

(declare-fun b!263968 () Bool)

(declare-fun e!171032 () Option!326)

(assert (=> b!263968 (= e!171032 (Some!325 (_2!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))))))

(declare-fun d!63563 () Bool)

(declare-fun c!45102 () Bool)

(assert (=> d!63563 (= c!45102 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) key!932)))))

(assert (=> d!63563 (= (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932) e!171032)))

(declare-fun b!263971 () Bool)

(assert (=> b!263971 (= e!171033 None!324)))

(declare-fun b!263969 () Bool)

(assert (=> b!263969 (= e!171032 e!171033)))

(declare-fun c!45103 () Bool)

(assert (=> b!263969 (= c!45103 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (not (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) key!932))))))

(assert (= (and d!63563 c!45102) b!263968))

(assert (= (and d!63563 (not c!45102)) b!263969))

(assert (= (and b!263969 c!45103) b!263970))

(assert (= (and b!263969 (not c!45103)) b!263971))

(declare-fun m!280589 () Bool)

(assert (=> b!263970 m!280589))

(assert (=> b!263359 d!63563))

(declare-fun e!171035 () Option!326)

(declare-fun b!263974 () Bool)

(assert (=> b!263974 (= e!171035 (getValueByKey!320 (t!8929 (toList!1961 lt!133435)) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263972 () Bool)

(declare-fun e!171034 () Option!326)

(assert (=> b!263972 (= e!171034 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133435)))))))

(declare-fun d!63565 () Bool)

(declare-fun c!45104 () Bool)

(assert (=> d!63565 (= c!45104 (and ((_ is Cons!3848) (toList!1961 lt!133435)) (= (_1!2500 (h!4514 (toList!1961 lt!133435))) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63565 (= (getValueByKey!320 (toList!1961 lt!133435) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) e!171034)))

(declare-fun b!263975 () Bool)

(assert (=> b!263975 (= e!171035 None!324)))

(declare-fun b!263973 () Bool)

(assert (=> b!263973 (= e!171034 e!171035)))

(declare-fun c!45105 () Bool)

(assert (=> b!263973 (= c!45105 (and ((_ is Cons!3848) (toList!1961 lt!133435)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133435))) (_1!2500 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63565 c!45104) b!263972))

(assert (= (and d!63565 (not c!45104)) b!263973))

(assert (= (and b!263973 c!45105) b!263974))

(assert (= (and b!263973 (not c!45105)) b!263975))

(declare-fun m!280591 () Bool)

(assert (=> b!263974 m!280591))

(assert (=> b!263612 d!63565))

(declare-fun d!63567 () Bool)

(assert (=> d!63567 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020)))))

(declare-fun lt!133628 () Unit!8190)

(assert (=> d!63567 (= lt!133628 (choose!1293 (toList!1961 lt!133265) (_1!2500 lt!133020)))))

(declare-fun e!171036 () Bool)

(assert (=> d!63567 e!171036))

(declare-fun res!128870 () Bool)

(assert (=> d!63567 (=> (not res!128870) (not e!171036))))

(assert (=> d!63567 (= res!128870 (isStrictlySorted!377 (toList!1961 lt!133265)))))

(assert (=> d!63567 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133265) (_1!2500 lt!133020)) lt!133628)))

(declare-fun b!263976 () Bool)

(assert (=> b!263976 (= e!171036 (containsKey!312 (toList!1961 lt!133265) (_1!2500 lt!133020)))))

(assert (= (and d!63567 res!128870) b!263976))

(assert (=> d!63567 m!279389))

(assert (=> d!63567 m!279389))

(assert (=> d!63567 m!279723))

(declare-fun m!280593 () Bool)

(assert (=> d!63567 m!280593))

(declare-fun m!280595 () Bool)

(assert (=> d!63567 m!280595))

(assert (=> b!263976 m!279719))

(assert (=> b!263520 d!63567))

(declare-fun d!63569 () Bool)

(assert (=> d!63569 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020))) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133265) (_1!2500 lt!133020)))))))

(declare-fun bs!9297 () Bool)

(assert (= bs!9297 d!63569))

(assert (=> bs!9297 m!279389))

(declare-fun m!280597 () Bool)

(assert (=> bs!9297 m!280597))

(assert (=> b!263520 d!63569))

(assert (=> b!263520 d!63325))

(assert (=> d!63323 d!63181))

(assert (=> b!263580 d!63471))

(declare-fun d!63571 () Bool)

(assert (=> d!63571 (= (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263588 d!63571))

(declare-fun d!63573 () Bool)

(assert (=> d!63573 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133248) lt!133253)) (v!5508 (getValueByKey!320 (toList!1961 lt!133248) lt!133253)))))

(assert (=> d!63345 d!63573))

(declare-fun b!263979 () Bool)

(declare-fun e!171038 () Option!326)

(assert (=> b!263979 (= e!171038 (getValueByKey!320 (t!8929 (toList!1961 lt!133248)) lt!133253))))

(declare-fun b!263977 () Bool)

(declare-fun e!171037 () Option!326)

(assert (=> b!263977 (= e!171037 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133248)))))))

(declare-fun d!63575 () Bool)

(declare-fun c!45106 () Bool)

(assert (=> d!63575 (= c!45106 (and ((_ is Cons!3848) (toList!1961 lt!133248)) (= (_1!2500 (h!4514 (toList!1961 lt!133248))) lt!133253)))))

(assert (=> d!63575 (= (getValueByKey!320 (toList!1961 lt!133248) lt!133253) e!171037)))

(declare-fun b!263980 () Bool)

(assert (=> b!263980 (= e!171038 None!324)))

(declare-fun b!263978 () Bool)

(assert (=> b!263978 (= e!171037 e!171038)))

(declare-fun c!45107 () Bool)

(assert (=> b!263978 (= c!45107 (and ((_ is Cons!3848) (toList!1961 lt!133248)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133248))) lt!133253))))))

(assert (= (and d!63575 c!45106) b!263977))

(assert (= (and d!63575 (not c!45106)) b!263978))

(assert (= (and b!263978 c!45107) b!263979))

(assert (= (and b!263978 (not c!45107)) b!263980))

(declare-fun m!280599 () Bool)

(assert (=> b!263979 m!280599))

(assert (=> d!63345 d!63575))

(declare-fun d!63577 () Bool)

(declare-fun res!128871 () Bool)

(declare-fun e!171039 () Bool)

(assert (=> d!63577 (=> res!128871 e!171039)))

(assert (=> d!63577 (= res!128871 (and ((_ is Cons!3848) lt!133413) (= (_1!2500 (h!4514 lt!133413)) (_1!2500 lt!133020))))))

(assert (=> d!63577 (= (containsKey!312 lt!133413 (_1!2500 lt!133020)) e!171039)))

(declare-fun b!263981 () Bool)

(declare-fun e!171040 () Bool)

(assert (=> b!263981 (= e!171039 e!171040)))

(declare-fun res!128872 () Bool)

(assert (=> b!263981 (=> (not res!128872) (not e!171040))))

(assert (=> b!263981 (= res!128872 (and (or (not ((_ is Cons!3848) lt!133413)) (bvsle (_1!2500 (h!4514 lt!133413)) (_1!2500 lt!133020))) ((_ is Cons!3848) lt!133413) (bvslt (_1!2500 (h!4514 lt!133413)) (_1!2500 lt!133020))))))

(declare-fun b!263982 () Bool)

(assert (=> b!263982 (= e!171040 (containsKey!312 (t!8929 lt!133413) (_1!2500 lt!133020)))))

(assert (= (and d!63577 (not res!128871)) b!263981))

(assert (= (and b!263981 res!128872) b!263982))

(declare-fun m!280601 () Bool)

(assert (=> b!263982 m!280601))

(assert (=> b!263553 d!63577))

(assert (=> b!263357 d!63389))

(declare-fun b!263983 () Bool)

(declare-fun e!171041 () (_ BitVec 32))

(assert (=> b!263983 (= e!171041 #b00000000000000000000000000000000)))

(declare-fun b!263985 () Bool)

(declare-fun e!171042 () (_ BitVec 32))

(assert (=> b!263985 (= e!171041 e!171042)))

(declare-fun c!45109 () Bool)

(assert (=> b!263985 (= c!45109 (validKeyInArray!0 (select (arr!5999 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263986 () Bool)

(declare-fun call!25274 () (_ BitVec 32))

(assert (=> b!263986 (= e!171042 call!25274)))

(declare-fun bm!25271 () Bool)

(assert (=> bm!25271 (= call!25274 (arrayCountValidKeys!0 (_keys!7035 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))))))

(declare-fun d!63579 () Bool)

(declare-fun lt!133629 () (_ BitVec 32))

(assert (=> d!63579 (and (bvsge lt!133629 #b00000000000000000000000000000000) (bvsle lt!133629 (bvsub (size!6350 (_keys!7035 lt!133015)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63579 (= lt!133629 e!171041)))

(declare-fun c!45108 () Bool)

(assert (=> d!63579 (= c!45108 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63579 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 lt!133015)) (size!6350 (_keys!7035 lt!133015))))))

(assert (=> d!63579 (= (arrayCountValidKeys!0 (_keys!7035 lt!133015) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))) lt!133629)))

(declare-fun b!263984 () Bool)

(assert (=> b!263984 (= e!171042 (bvadd #b00000000000000000000000000000001 call!25274))))

(assert (= (and d!63579 c!45108) b!263983))

(assert (= (and d!63579 (not c!45108)) b!263985))

(assert (= (and b!263985 c!45109) b!263984))

(assert (= (and b!263985 (not c!45109)) b!263986))

(assert (= (or b!263984 b!263986) bm!25271))

(assert (=> b!263985 m!280181))

(assert (=> b!263985 m!280181))

(assert (=> b!263985 m!280185))

(declare-fun m!280603 () Bool)

(assert (=> bm!25271 m!280603))

(assert (=> bm!25210 d!63579))

(assert (=> d!63271 d!63273))

(assert (=> d!63271 d!63275))

(declare-fun d!63581 () Bool)

(assert (=> d!63581 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133009) key!932))))

(assert (=> d!63581 true))

(declare-fun _$12!454 () Unit!8190)

(assert (=> d!63581 (= (choose!1293 (toList!1961 lt!133009) key!932) _$12!454)))

(declare-fun bs!9298 () Bool)

(assert (= bs!9298 d!63581))

(assert (=> bs!9298 m!279159))

(assert (=> bs!9298 m!279159))

(assert (=> bs!9298 m!279161))

(assert (=> d!63271 d!63581))

(declare-fun d!63583 () Bool)

(declare-fun res!128873 () Bool)

(declare-fun e!171043 () Bool)

(assert (=> d!63583 (=> res!128873 e!171043)))

(assert (=> d!63583 (= res!128873 (or ((_ is Nil!3849) (toList!1961 lt!133009)) ((_ is Nil!3849) (t!8929 (toList!1961 lt!133009)))))))

(assert (=> d!63583 (= (isStrictlySorted!377 (toList!1961 lt!133009)) e!171043)))

(declare-fun b!263987 () Bool)

(declare-fun e!171044 () Bool)

(assert (=> b!263987 (= e!171043 e!171044)))

(declare-fun res!128874 () Bool)

(assert (=> b!263987 (=> (not res!128874) (not e!171044))))

(assert (=> b!263987 (= res!128874 (bvslt (_1!2500 (h!4514 (toList!1961 lt!133009))) (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133009))))))))

(declare-fun b!263988 () Bool)

(assert (=> b!263988 (= e!171044 (isStrictlySorted!377 (t!8929 (toList!1961 lt!133009))))))

(assert (= (and d!63583 (not res!128873)) b!263987))

(assert (= (and b!263987 res!128874) b!263988))

(declare-fun m!280605 () Bool)

(assert (=> b!263988 m!280605))

(assert (=> d!63271 d!63583))

(declare-fun d!63585 () Bool)

(assert (=> d!63585 (= ($colon$colon!108 e!170784 (ite c!44985 (h!4514 (toList!1961 lt!133012)) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020)))) (Cons!3848 (ite c!44985 (h!4514 (toList!1961 lt!133012)) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))) e!170784))))

(assert (=> bm!25228 d!63585))

(declare-fun d!63587 () Bool)

(declare-fun res!128875 () Bool)

(declare-fun e!171045 () Bool)

(assert (=> d!63587 (=> res!128875 e!171045)))

(assert (=> d!63587 (= res!128875 (= (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63587 (= (arrayContainsKey!0 lt!133026 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!171045)))

(declare-fun b!263989 () Bool)

(declare-fun e!171046 () Bool)

(assert (=> b!263989 (= e!171045 e!171046)))

(declare-fun res!128876 () Bool)

(assert (=> b!263989 (=> (not res!128876) (not e!171046))))

(assert (=> b!263989 (= res!128876 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!263990 () Bool)

(assert (=> b!263990 (= e!171046 (arrayContainsKey!0 lt!133026 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63587 (not res!128875)) b!263989))

(assert (= (and b!263989 res!128876) b!263990))

(assert (=> d!63587 m!280353))

(declare-fun m!280607 () Bool)

(assert (=> b!263990 m!280607))

(assert (=> b!263461 d!63587))

(declare-fun d!63589 () Bool)

(declare-fun res!128877 () Bool)

(declare-fun e!171047 () Bool)

(assert (=> d!63589 (=> res!128877 e!171047)))

(assert (=> d!63589 (= res!128877 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) key!932)))))

(assert (=> d!63589 (= (containsKey!312 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) key!932) e!171047)))

(declare-fun b!263991 () Bool)

(declare-fun e!171048 () Bool)

(assert (=> b!263991 (= e!171047 e!171048)))

(declare-fun res!128878 () Bool)

(assert (=> b!263991 (=> (not res!128878) (not e!171048))))

(assert (=> b!263991 (= res!128878 (and (or (not ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (bvsle (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) key!932)) ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (bvslt (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) key!932)))))

(declare-fun b!263992 () Bool)

(assert (=> b!263992 (= e!171048 (containsKey!312 (t!8929 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) key!932))))

(assert (= (and d!63589 (not res!128877)) b!263991))

(assert (= (and b!263991 res!128878) b!263992))

(declare-fun m!280609 () Bool)

(assert (=> b!263992 m!280609))

(assert (=> d!63185 d!63589))

(declare-fun d!63591 () Bool)

(assert (=> d!63591 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5508 (getValueByKey!320 (toList!1961 lt!133201) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63363 d!63591))

(assert (=> d!63363 d!63457))

(declare-fun d!63593 () Bool)

(assert (=> d!63593 (= (get!3096 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263578 d!63593))

(declare-fun d!63595 () Bool)

(declare-fun lt!133630 () Bool)

(assert (=> d!63595 (= lt!133630 (select (content!176 lt!133128) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun e!171050 () Bool)

(assert (=> d!63595 (= lt!133630 e!171050)))

(declare-fun res!128880 () Bool)

(assert (=> d!63595 (=> (not res!128880) (not e!171050))))

(assert (=> d!63595 (= res!128880 ((_ is Cons!3848) lt!133128))))

(assert (=> d!63595 (= (contains!1914 lt!133128 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))) lt!133630)))

(declare-fun b!263993 () Bool)

(declare-fun e!171049 () Bool)

(assert (=> b!263993 (= e!171050 e!171049)))

(declare-fun res!128879 () Bool)

(assert (=> b!263993 (=> res!128879 e!171049)))

(assert (=> b!263993 (= res!128879 (= (h!4514 lt!133128) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!263994 () Bool)

(assert (=> b!263994 (= e!171049 (contains!1914 (t!8929 lt!133128) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(assert (= (and d!63595 res!128880) b!263993))

(assert (= (and b!263993 (not res!128879)) b!263994))

(declare-fun m!280611 () Bool)

(assert (=> d!63595 m!280611))

(declare-fun m!280613 () Bool)

(assert (=> d!63595 m!280613))

(declare-fun m!280615 () Bool)

(assert (=> b!263994 m!280615))

(assert (=> b!263666 d!63595))

(declare-fun d!63597 () Bool)

(declare-fun res!128881 () Bool)

(declare-fun e!171051 () Bool)

(assert (=> d!63597 (=> res!128881 e!171051)))

(assert (=> d!63597 (= res!128881 (and ((_ is Cons!3848) (toList!1961 lt!133265)) (= (_1!2500 (h!4514 (toList!1961 lt!133265))) (_1!2500 lt!133020))))))

(assert (=> d!63597 (= (containsKey!312 (toList!1961 lt!133265) (_1!2500 lt!133020)) e!171051)))

(declare-fun b!263995 () Bool)

(declare-fun e!171052 () Bool)

(assert (=> b!263995 (= e!171051 e!171052)))

(declare-fun res!128882 () Bool)

(assert (=> b!263995 (=> (not res!128882) (not e!171052))))

(assert (=> b!263995 (= res!128882 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133265))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133265))) (_1!2500 lt!133020))) ((_ is Cons!3848) (toList!1961 lt!133265)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133265))) (_1!2500 lt!133020))))))

(declare-fun b!263996 () Bool)

(assert (=> b!263996 (= e!171052 (containsKey!312 (t!8929 (toList!1961 lt!133265)) (_1!2500 lt!133020)))))

(assert (= (and d!63597 (not res!128881)) b!263995))

(assert (= (and b!263995 res!128882) b!263996))

(declare-fun m!280617 () Bool)

(assert (=> b!263996 m!280617))

(assert (=> d!63247 d!63597))

(declare-fun b!263999 () Bool)

(declare-fun e!171054 () Option!326)

(assert (=> b!263999 (= e!171054 (getValueByKey!320 (t!8929 (toList!1961 lt!133468)) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!263997 () Bool)

(declare-fun e!171053 () Option!326)

(assert (=> b!263997 (= e!171053 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133468)))))))

(declare-fun c!45110 () Bool)

(declare-fun d!63599 () Bool)

(assert (=> d!63599 (= c!45110 (and ((_ is Cons!3848) (toList!1961 lt!133468)) (= (_1!2500 (h!4514 (toList!1961 lt!133468))) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63599 (= (getValueByKey!320 (toList!1961 lt!133468) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) e!171053)))

(declare-fun b!264000 () Bool)

(assert (=> b!264000 (= e!171054 None!324)))

(declare-fun b!263998 () Bool)

(assert (=> b!263998 (= e!171053 e!171054)))

(declare-fun c!45111 () Bool)

(assert (=> b!263998 (= c!45111 (and ((_ is Cons!3848) (toList!1961 lt!133468)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133468))) (_1!2500 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63599 c!45110) b!263997))

(assert (= (and d!63599 (not c!45110)) b!263998))

(assert (= (and b!263998 c!45111) b!263999))

(assert (= (and b!263998 (not c!45111)) b!264000))

(declare-fun m!280619 () Bool)

(assert (=> b!263999 m!280619))

(assert (=> b!263648 d!63599))

(declare-fun d!63601 () Bool)

(assert (=> d!63601 (= (apply!262 lt!133386 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9299 () Bool)

(assert (= bs!9299 d!63601))

(declare-fun m!280621 () Bool)

(assert (=> bs!9299 m!280621))

(assert (=> bs!9299 m!280621))

(declare-fun m!280623 () Bool)

(assert (=> bs!9299 m!280623))

(assert (=> b!263474 d!63601))

(declare-fun d!63603 () Bool)

(declare-fun lt!133631 () Bool)

(assert (=> d!63603 (= lt!133631 (select (content!176 (toList!1961 lt!133451)) (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))

(declare-fun e!171056 () Bool)

(assert (=> d!63603 (= lt!133631 e!171056)))

(declare-fun res!128884 () Bool)

(assert (=> d!63603 (=> (not res!128884) (not e!171056))))

(assert (=> d!63603 (= res!128884 ((_ is Cons!3848) (toList!1961 lt!133451)))))

(assert (=> d!63603 (= (contains!1914 (toList!1961 lt!133451) (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) lt!133631)))

(declare-fun b!264001 () Bool)

(declare-fun e!171055 () Bool)

(assert (=> b!264001 (= e!171056 e!171055)))

(declare-fun res!128883 () Bool)

(assert (=> b!264001 (=> res!128883 e!171055)))

(assert (=> b!264001 (= res!128883 (= (h!4514 (toList!1961 lt!133451)) (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))

(declare-fun b!264002 () Bool)

(assert (=> b!264002 (= e!171055 (contains!1914 (t!8929 (toList!1961 lt!133451)) (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63603 res!128884) b!264001))

(assert (= (and b!264001 (not res!128883)) b!264002))

(declare-fun m!280625 () Bool)

(assert (=> d!63603 m!280625))

(declare-fun m!280627 () Bool)

(assert (=> d!63603 m!280627))

(declare-fun m!280629 () Bool)

(assert (=> b!264002 m!280629))

(assert (=> b!263621 d!63603))

(declare-fun d!63605 () Bool)

(declare-fun res!128885 () Bool)

(declare-fun e!171057 () Bool)

(assert (=> d!63605 (=> res!128885 e!171057)))

(assert (=> d!63605 (= res!128885 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (= (_1!2500 (h!4514 (toList!1961 lt!133256))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63605 (= (containsKey!312 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000) e!171057)))

(declare-fun b!264003 () Bool)

(declare-fun e!171058 () Bool)

(assert (=> b!264003 (= e!171057 e!171058)))

(declare-fun res!128886 () Bool)

(assert (=> b!264003 (=> (not res!128886) (not e!171058))))

(assert (=> b!264003 (= res!128886 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133256))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133256))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3848) (toList!1961 lt!133256)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133256))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264004 () Bool)

(assert (=> b!264004 (= e!171058 (containsKey!312 (t!8929 (toList!1961 lt!133256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63605 (not res!128885)) b!264003))

(assert (= (and b!264003 res!128886) b!264004))

(declare-fun m!280631 () Bool)

(assert (=> b!264004 m!280631))

(assert (=> d!63197 d!63605))

(assert (=> b!263590 d!63153))

(declare-fun d!63607 () Bool)

(assert (=> d!63607 (= (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133241)) (v!5508 (getValueByKey!320 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133241)))))

(assert (=> d!63355 d!63607))

(declare-fun b!264007 () Bool)

(declare-fun e!171060 () Option!326)

(assert (=> b!264007 (= e!171060 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))) lt!133241))))

(declare-fun e!171059 () Option!326)

(declare-fun b!264005 () Bool)

(assert (=> b!264005 (= e!171059 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))))

(declare-fun c!45112 () Bool)

(declare-fun d!63609 () Bool)

(assert (=> d!63609 (= c!45112 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))) lt!133241)))))

(assert (=> d!63609 (= (getValueByKey!320 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133241) e!171059)))

(declare-fun b!264008 () Bool)

(assert (=> b!264008 (= e!171060 None!324)))

(declare-fun b!264006 () Bool)

(assert (=> b!264006 (= e!171059 e!171060)))

(declare-fun c!45113 () Bool)

(assert (=> b!264006 (= c!45113 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133258 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))) lt!133241))))))

(assert (= (and d!63609 c!45112) b!264005))

(assert (= (and d!63609 (not c!45112)) b!264006))

(assert (= (and b!264006 c!45113) b!264007))

(assert (= (and b!264006 (not c!45113)) b!264008))

(declare-fun m!280633 () Bool)

(assert (=> b!264007 m!280633))

(assert (=> d!63355 d!63609))

(assert (=> b!263271 d!63393))

(assert (=> b!263271 d!63395))

(assert (=> b!263308 d!63213))

(assert (=> d!63233 d!63077))

(declare-fun d!63611 () Bool)

(declare-fun e!171061 () Bool)

(assert (=> d!63611 e!171061))

(declare-fun res!128887 () Bool)

(assert (=> d!63611 (=> res!128887 e!171061)))

(declare-fun lt!133633 () Bool)

(assert (=> d!63611 (= res!128887 (not lt!133633))))

(declare-fun lt!133632 () Bool)

(assert (=> d!63611 (= lt!133633 lt!133632)))

(declare-fun lt!133634 () Unit!8190)

(declare-fun e!171062 () Unit!8190)

(assert (=> d!63611 (= lt!133634 e!171062)))

(declare-fun c!45114 () Bool)

(assert (=> d!63611 (= c!45114 lt!133632)))

(assert (=> d!63611 (= lt!133632 (containsKey!312 (toList!1961 lt!133460) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> d!63611 (= (contains!1912 lt!133460 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) lt!133633)))

(declare-fun b!264009 () Bool)

(declare-fun lt!133635 () Unit!8190)

(assert (=> b!264009 (= e!171062 lt!133635)))

(assert (=> b!264009 (= lt!133635 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133460) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> b!264009 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133460) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(declare-fun b!264010 () Bool)

(declare-fun Unit!8227 () Unit!8190)

(assert (=> b!264010 (= e!171062 Unit!8227)))

(declare-fun b!264011 () Bool)

(assert (=> b!264011 (= e!171061 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133460) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(assert (= (and d!63611 c!45114) b!264009))

(assert (= (and d!63611 (not c!45114)) b!264010))

(assert (= (and d!63611 (not res!128887)) b!264011))

(assert (=> d!63611 m!279255))

(declare-fun m!280635 () Bool)

(assert (=> d!63611 m!280635))

(assert (=> b!264009 m!279255))

(declare-fun m!280637 () Bool)

(assert (=> b!264009 m!280637))

(assert (=> b!264009 m!279255))

(declare-fun m!280639 () Bool)

(assert (=> b!264009 m!280639))

(assert (=> b!264009 m!280639))

(declare-fun m!280641 () Bool)

(assert (=> b!264009 m!280641))

(assert (=> b!264011 m!279255))

(assert (=> b!264011 m!280639))

(assert (=> b!264011 m!280639))

(assert (=> b!264011 m!280641))

(assert (=> b!263647 d!63611))

(declare-fun d!63613 () Bool)

(assert (=> d!63613 (= (apply!262 (+!710 lt!133254 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) lt!133245) (apply!262 lt!133254 lt!133245))))

(assert (=> d!63613 true))

(declare-fun _$34!1135 () Unit!8190)

(assert (=> d!63613 (= (choose!1295 lt!133254 lt!133243 (minValue!4684 thiss!1504) lt!133245) _$34!1135)))

(declare-fun bs!9300 () Bool)

(assert (= bs!9300 d!63613))

(assert (=> bs!9300 m!279363))

(assert (=> bs!9300 m!279363))

(assert (=> bs!9300 m!279367))

(assert (=> bs!9300 m!279369))

(assert (=> d!63331 d!63613))

(assert (=> d!63331 d!63349))

(assert (=> d!63331 d!63335))

(assert (=> d!63331 d!63341))

(declare-fun d!63615 () Bool)

(declare-fun e!171063 () Bool)

(assert (=> d!63615 e!171063))

(declare-fun res!128888 () Bool)

(assert (=> d!63615 (=> res!128888 e!171063)))

(declare-fun lt!133637 () Bool)

(assert (=> d!63615 (= res!128888 (not lt!133637))))

(declare-fun lt!133636 () Bool)

(assert (=> d!63615 (= lt!133637 lt!133636)))

(declare-fun lt!133638 () Unit!8190)

(declare-fun e!171064 () Unit!8190)

(assert (=> d!63615 (= lt!133638 e!171064)))

(declare-fun c!45115 () Bool)

(assert (=> d!63615 (= c!45115 lt!133636)))

(assert (=> d!63615 (= lt!133636 (containsKey!312 (toList!1961 lt!133254) lt!133245))))

(assert (=> d!63615 (= (contains!1912 lt!133254 lt!133245) lt!133637)))

(declare-fun b!264012 () Bool)

(declare-fun lt!133639 () Unit!8190)

(assert (=> b!264012 (= e!171064 lt!133639)))

(assert (=> b!264012 (= lt!133639 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133254) lt!133245))))

(assert (=> b!264012 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133254) lt!133245))))

(declare-fun b!264013 () Bool)

(declare-fun Unit!8228 () Unit!8190)

(assert (=> b!264013 (= e!171064 Unit!8228)))

(declare-fun b!264014 () Bool)

(assert (=> b!264014 (= e!171063 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133254) lt!133245)))))

(assert (= (and d!63615 c!45115) b!264012))

(assert (= (and d!63615 (not c!45115)) b!264013))

(assert (= (and d!63615 (not res!128888)) b!264014))

(declare-fun m!280643 () Bool)

(assert (=> d!63615 m!280643))

(declare-fun m!280645 () Bool)

(assert (=> b!264012 m!280645))

(assert (=> b!264012 m!279925))

(assert (=> b!264012 m!279925))

(declare-fun m!280647 () Bool)

(assert (=> b!264012 m!280647))

(assert (=> b!264014 m!279925))

(assert (=> b!264014 m!279925))

(assert (=> b!264014 m!280647))

(assert (=> d!63331 d!63615))

(assert (=> b!263459 d!63455))

(assert (=> b!263459 d!63457))

(declare-fun d!63617 () Bool)

(declare-fun res!128889 () Bool)

(declare-fun e!171065 () Bool)

(assert (=> d!63617 (=> res!128889 e!171065)))

(assert (=> d!63617 (= res!128889 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))) lt!133200)))))

(assert (=> d!63617 (= (containsKey!312 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200) e!171065)))

(declare-fun b!264015 () Bool)

(declare-fun e!171066 () Bool)

(assert (=> b!264015 (= e!171065 e!171066)))

(declare-fun res!128890 () Bool)

(assert (=> b!264015 (=> (not res!128890) (not e!171066))))

(assert (=> b!264015 (= res!128890 (and (or (not ((_ is Cons!3848) (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))) (bvsle (_1!2500 (h!4514 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))) lt!133200)) ((_ is Cons!3848) (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))) (bvslt (_1!2500 (h!4514 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))) lt!133200)))))

(declare-fun b!264016 () Bool)

(assert (=> b!264016 (= e!171066 (containsKey!312 (t!8929 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))) lt!133200))))

(assert (= (and d!63617 (not res!128889)) b!264015))

(assert (= (and b!264015 res!128890) b!264016))

(declare-fun m!280649 () Bool)

(assert (=> b!264016 m!280649))

(assert (=> d!63297 d!63617))

(declare-fun d!63619 () Bool)

(declare-fun e!171067 () Bool)

(assert (=> d!63619 e!171067))

(declare-fun res!128891 () Bool)

(assert (=> d!63619 (=> res!128891 e!171067)))

(declare-fun lt!133641 () Bool)

(assert (=> d!63619 (= res!128891 (not lt!133641))))

(declare-fun lt!133640 () Bool)

(assert (=> d!63619 (= lt!133641 lt!133640)))

(declare-fun lt!133642 () Unit!8190)

(declare-fun e!171068 () Unit!8190)

(assert (=> d!63619 (= lt!133642 e!171068)))

(declare-fun c!45116 () Bool)

(assert (=> d!63619 (= c!45116 lt!133640)))

(assert (=> d!63619 (= lt!133640 (containsKey!312 (toList!1961 lt!133512) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (=> d!63619 (= (contains!1912 lt!133512 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) lt!133641)))

(declare-fun b!264017 () Bool)

(declare-fun lt!133643 () Unit!8190)

(assert (=> b!264017 (= e!171068 lt!133643)))

(assert (=> b!264017 (= lt!133643 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133512) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (=> b!264017 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133512) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!264018 () Bool)

(declare-fun Unit!8229 () Unit!8190)

(assert (=> b!264018 (= e!171068 Unit!8229)))

(declare-fun b!264019 () Bool)

(assert (=> b!264019 (= e!171067 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133512) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))))

(assert (= (and d!63619 c!45116) b!264017))

(assert (= (and d!63619 (not c!45116)) b!264018))

(assert (= (and d!63619 (not res!128891)) b!264019))

(assert (=> d!63619 m!279591))

(declare-fun m!280651 () Bool)

(assert (=> d!63619 m!280651))

(assert (=> b!264017 m!279591))

(declare-fun m!280653 () Bool)

(assert (=> b!264017 m!280653))

(assert (=> b!264017 m!279591))

(declare-fun m!280655 () Bool)

(assert (=> b!264017 m!280655))

(assert (=> b!264017 m!280655))

(declare-fun m!280657 () Bool)

(assert (=> b!264017 m!280657))

(assert (=> b!264019 m!279591))

(assert (=> b!264019 m!280655))

(assert (=> b!264019 m!280655))

(assert (=> b!264019 m!280657))

(assert (=> b!263703 d!63619))

(assert (=> b!263292 d!63389))

(declare-fun d!63621 () Bool)

(assert (=> d!63621 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133193) lt!133198)) (v!5508 (getValueByKey!320 (toList!1961 lt!133193) lt!133198)))))

(assert (=> d!63307 d!63621))

(declare-fun b!264022 () Bool)

(declare-fun e!171070 () Option!326)

(assert (=> b!264022 (= e!171070 (getValueByKey!320 (t!8929 (toList!1961 lt!133193)) lt!133198))))

(declare-fun b!264020 () Bool)

(declare-fun e!171069 () Option!326)

(assert (=> b!264020 (= e!171069 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133193)))))))

(declare-fun d!63623 () Bool)

(declare-fun c!45117 () Bool)

(assert (=> d!63623 (= c!45117 (and ((_ is Cons!3848) (toList!1961 lt!133193)) (= (_1!2500 (h!4514 (toList!1961 lt!133193))) lt!133198)))))

(assert (=> d!63623 (= (getValueByKey!320 (toList!1961 lt!133193) lt!133198) e!171069)))

(declare-fun b!264023 () Bool)

(assert (=> b!264023 (= e!171070 None!324)))

(declare-fun b!264021 () Bool)

(assert (=> b!264021 (= e!171069 e!171070)))

(declare-fun c!45118 () Bool)

(assert (=> b!264021 (= c!45118 (and ((_ is Cons!3848) (toList!1961 lt!133193)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133193))) lt!133198))))))

(assert (= (and d!63623 c!45117) b!264020))

(assert (= (and d!63623 (not c!45117)) b!264021))

(assert (= (and b!264021 c!45118) b!264022))

(assert (= (and b!264021 (not c!45118)) b!264023))

(declare-fun m!280659 () Bool)

(assert (=> b!264022 m!280659))

(assert (=> d!63307 d!63623))

(declare-fun d!63625 () Bool)

(declare-fun e!171071 () Bool)

(assert (=> d!63625 e!171071))

(declare-fun res!128892 () Bool)

(assert (=> d!63625 (=> res!128892 e!171071)))

(declare-fun lt!133645 () Bool)

(assert (=> d!63625 (= res!128892 (not lt!133645))))

(declare-fun lt!133644 () Bool)

(assert (=> d!63625 (= lt!133645 lt!133644)))

(declare-fun lt!133646 () Unit!8190)

(declare-fun e!171072 () Unit!8190)

(assert (=> d!63625 (= lt!133646 e!171072)))

(declare-fun c!45119 () Bool)

(assert (=> d!63625 (= c!45119 lt!133644)))

(assert (=> d!63625 (= lt!133644 (containsKey!312 (toList!1961 lt!133307) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63625 (= (contains!1912 lt!133307 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) lt!133645)))

(declare-fun b!264024 () Bool)

(declare-fun lt!133647 () Unit!8190)

(assert (=> b!264024 (= e!171072 lt!133647)))

(assert (=> b!264024 (= lt!133647 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133307) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> b!264024 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133307) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264025 () Bool)

(declare-fun Unit!8230 () Unit!8190)

(assert (=> b!264025 (= e!171072 Unit!8230)))

(declare-fun b!264026 () Bool)

(assert (=> b!264026 (= e!171071 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133307) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63625 c!45119) b!264024))

(assert (= (and d!63625 (not c!45119)) b!264025))

(assert (= (and d!63625 (not res!128892)) b!264026))

(declare-fun m!280661 () Bool)

(assert (=> d!63625 m!280661))

(declare-fun m!280663 () Bool)

(assert (=> b!264024 m!280663))

(assert (=> b!264024 m!279511))

(assert (=> b!264024 m!279511))

(declare-fun m!280665 () Bool)

(assert (=> b!264024 m!280665))

(assert (=> b!264026 m!279511))

(assert (=> b!264026 m!279511))

(assert (=> b!264026 m!280665))

(assert (=> d!63177 d!63625))

(declare-fun b!264029 () Bool)

(declare-fun e!171074 () Option!326)

(assert (=> b!264029 (= e!171074 (getValueByKey!320 (t!8929 lt!133308) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264027 () Bool)

(declare-fun e!171073 () Option!326)

(assert (=> b!264027 (= e!171073 (Some!325 (_2!2500 (h!4514 lt!133308))))))

(declare-fun c!45120 () Bool)

(declare-fun d!63627 () Bool)

(assert (=> d!63627 (= c!45120 (and ((_ is Cons!3848) lt!133308) (= (_1!2500 (h!4514 lt!133308)) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (=> d!63627 (= (getValueByKey!320 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) e!171073)))

(declare-fun b!264030 () Bool)

(assert (=> b!264030 (= e!171074 None!324)))

(declare-fun b!264028 () Bool)

(assert (=> b!264028 (= e!171073 e!171074)))

(declare-fun c!45121 () Bool)

(assert (=> b!264028 (= c!45121 (and ((_ is Cons!3848) lt!133308) (not (= (_1!2500 (h!4514 lt!133308)) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))))

(assert (= (and d!63627 c!45120) b!264027))

(assert (= (and d!63627 (not c!45120)) b!264028))

(assert (= (and b!264028 c!45121) b!264029))

(assert (= (and b!264028 (not c!45121)) b!264030))

(declare-fun m!280667 () Bool)

(assert (=> b!264029 m!280667))

(assert (=> d!63177 d!63627))

(declare-fun d!63629 () Bool)

(assert (=> d!63629 (= (getValueByKey!320 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun lt!133648 () Unit!8190)

(assert (=> d!63629 (= lt!133648 (choose!1294 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun e!171075 () Bool)

(assert (=> d!63629 e!171075))

(declare-fun res!128893 () Bool)

(assert (=> d!63629 (=> (not res!128893) (not e!171075))))

(assert (=> d!63629 (= res!128893 (isStrictlySorted!377 lt!133308))))

(assert (=> d!63629 (= (lemmaContainsTupThenGetReturnValue!176 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) lt!133648)))

(declare-fun b!264031 () Bool)

(declare-fun res!128894 () Bool)

(assert (=> b!264031 (=> (not res!128894) (not e!171075))))

(assert (=> b!264031 (= res!128894 (containsKey!312 lt!133308 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264032 () Bool)

(assert (=> b!264032 (= e!171075 (contains!1914 lt!133308 (tuple2!4979 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63629 res!128893) b!264031))

(assert (= (and b!264031 res!128894) b!264032))

(assert (=> d!63629 m!279505))

(declare-fun m!280669 () Bool)

(assert (=> d!63629 m!280669))

(declare-fun m!280671 () Bool)

(assert (=> d!63629 m!280671))

(declare-fun m!280673 () Bool)

(assert (=> b!264031 m!280673))

(declare-fun m!280675 () Bool)

(assert (=> b!264032 m!280675))

(assert (=> d!63177 d!63629))

(declare-fun bm!25272 () Bool)

(declare-fun call!25277 () List!3852)

(declare-fun call!25276 () List!3852)

(assert (=> bm!25272 (= call!25277 call!25276)))

(declare-fun bm!25273 () Bool)

(declare-fun call!25275 () List!3852)

(assert (=> bm!25273 (= call!25275 call!25277)))

(declare-fun b!264033 () Bool)

(declare-fun res!128895 () Bool)

(declare-fun e!171080 () Bool)

(assert (=> b!264033 (=> (not res!128895) (not e!171080))))

(declare-fun lt!133649 () List!3852)

(assert (=> b!264033 (= res!128895 (containsKey!312 lt!133649 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264034 () Bool)

(declare-fun c!45122 () Bool)

(assert (=> b!264034 (= c!45122 (and ((_ is Cons!3848) (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (bvsgt (_1!2500 (h!4514 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun e!171079 () List!3852)

(declare-fun e!171076 () List!3852)

(assert (=> b!264034 (= e!171079 e!171076)))

(declare-fun b!264035 () Bool)

(declare-fun e!171078 () List!3852)

(assert (=> b!264035 (= e!171078 e!171079)))

(declare-fun c!45125 () Bool)

(assert (=> b!264035 (= c!45125 (and ((_ is Cons!3848) (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (= (_1!2500 (h!4514 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!264036 () Bool)

(assert (=> b!264036 (= e!171080 (contains!1914 lt!133649 (tuple2!4979 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!264037 () Bool)

(assert (=> b!264037 (= e!171078 call!25276)))

(declare-fun b!264038 () Bool)

(assert (=> b!264038 (= e!171079 call!25277)))

(declare-fun b!264039 () Bool)

(declare-fun e!171077 () List!3852)

(assert (=> b!264039 (= e!171077 (insertStrictlySorted!179 (t!8929 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264040 () Bool)

(assert (=> b!264040 (= e!171076 call!25275)))

(declare-fun c!45124 () Bool)

(declare-fun bm!25274 () Bool)

(assert (=> bm!25274 (= call!25276 ($colon$colon!108 e!171077 (ite c!45124 (h!4514 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (tuple2!4979 (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))))

(declare-fun c!45123 () Bool)

(assert (=> bm!25274 (= c!45123 c!45124)))

(declare-fun d!63631 () Bool)

(assert (=> d!63631 e!171080))

(declare-fun res!128896 () Bool)

(assert (=> d!63631 (=> (not res!128896) (not e!171080))))

(assert (=> d!63631 (= res!128896 (isStrictlySorted!377 lt!133649))))

(assert (=> d!63631 (= lt!133649 e!171078)))

(assert (=> d!63631 (= c!45124 (and ((_ is Cons!3848) (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (bvslt (_1!2500 (h!4514 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (=> d!63631 (isStrictlySorted!377 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))))))

(assert (=> d!63631 (= (insertStrictlySorted!179 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) lt!133649)))

(declare-fun b!264041 () Bool)

(assert (=> b!264041 (= e!171076 call!25275)))

(declare-fun b!264042 () Bool)

(assert (=> b!264042 (= e!171077 (ite c!45125 (t!8929 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (ite c!45122 (Cons!3848 (h!4514 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194)))) (t!8929 (toList!1961 (ite c!44895 call!25195 (ite c!44892 call!25193 call!25194))))) Nil!3849)))))

(assert (= (and d!63631 c!45124) b!264037))

(assert (= (and d!63631 (not c!45124)) b!264035))

(assert (= (and b!264035 c!45125) b!264038))

(assert (= (and b!264035 (not c!45125)) b!264034))

(assert (= (and b!264034 c!45122) b!264041))

(assert (= (and b!264034 (not c!45122)) b!264040))

(assert (= (or b!264041 b!264040) bm!25273))

(assert (= (or b!264038 bm!25273) bm!25272))

(assert (= (or b!264037 bm!25272) bm!25274))

(assert (= (and bm!25274 c!45123) b!264039))

(assert (= (and bm!25274 (not c!45123)) b!264042))

(assert (= (and d!63631 res!128896) b!264033))

(assert (= (and b!264033 res!128895) b!264036))

(declare-fun m!280677 () Bool)

(assert (=> bm!25274 m!280677))

(declare-fun m!280679 () Bool)

(assert (=> b!264039 m!280679))

(declare-fun m!280681 () Bool)

(assert (=> b!264036 m!280681))

(declare-fun m!280683 () Bool)

(assert (=> b!264033 m!280683))

(declare-fun m!280685 () Bool)

(assert (=> d!63631 m!280685))

(declare-fun m!280687 () Bool)

(assert (=> d!63631 m!280687))

(assert (=> d!63177 d!63631))

(declare-fun d!63633 () Bool)

(declare-fun lt!133650 () Bool)

(assert (=> d!63633 (= lt!133650 (select (content!176 lt!133266) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun e!171082 () Bool)

(assert (=> d!63633 (= lt!133650 e!171082)))

(declare-fun res!128898 () Bool)

(assert (=> d!63633 (=> (not res!128898) (not e!171082))))

(assert (=> d!63633 (= res!128898 ((_ is Cons!3848) lt!133266))))

(assert (=> d!63633 (= (contains!1914 lt!133266 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))) lt!133650)))

(declare-fun b!264043 () Bool)

(declare-fun e!171081 () Bool)

(assert (=> b!264043 (= e!171082 e!171081)))

(declare-fun res!128897 () Bool)

(assert (=> b!264043 (=> res!128897 e!171081)))

(assert (=> b!264043 (= res!128897 (= (h!4514 lt!133266) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!264044 () Bool)

(assert (=> b!264044 (= e!171081 (contains!1914 (t!8929 lt!133266) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(assert (= (and d!63633 res!128898) b!264043))

(assert (= (and b!264043 (not res!128897)) b!264044))

(declare-fun m!280689 () Bool)

(assert (=> d!63633 m!280689))

(declare-fun m!280691 () Bool)

(assert (=> d!63633 m!280691))

(declare-fun m!280693 () Bool)

(assert (=> b!264044 m!280693))

(assert (=> b!263532 d!63633))

(declare-fun b!264045 () Bool)

(declare-fun e!171083 () (_ BitVec 32))

(assert (=> b!264045 (= e!171083 #b00000000000000000000000000000000)))

(declare-fun b!264047 () Bool)

(declare-fun e!171084 () (_ BitVec 32))

(assert (=> b!264047 (= e!171083 e!171084)))

(declare-fun c!45127 () Bool)

(assert (=> b!264047 (= c!45127 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264048 () Bool)

(declare-fun call!25278 () (_ BitVec 32))

(assert (=> b!264048 (= e!171084 call!25278)))

(declare-fun bm!25275 () Bool)

(assert (=> bm!25275 (= call!25278 (arrayCountValidKeys!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63635 () Bool)

(declare-fun lt!133651 () (_ BitVec 32))

(assert (=> d!63635 (and (bvsge lt!133651 #b00000000000000000000000000000000) (bvsle lt!133651 (bvsub (size!6350 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63635 (= lt!133651 e!171083)))

(declare-fun c!45126 () Bool)

(assert (=> d!63635 (= c!45126 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63635 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 lt!133026)))))

(assert (=> d!63635 (= (arrayCountValidKeys!0 lt!133026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) lt!133651)))

(declare-fun b!264046 () Bool)

(assert (=> b!264046 (= e!171084 (bvadd #b00000000000000000000000000000001 call!25278))))

(assert (= (and d!63635 c!45126) b!264045))

(assert (= (and d!63635 (not c!45126)) b!264047))

(assert (= (and b!264047 c!45127) b!264046))

(assert (= (and b!264047 (not c!45127)) b!264048))

(assert (= (or b!264046 b!264048) bm!25275))

(assert (=> b!264047 m!280353))

(assert (=> b!264047 m!280353))

(assert (=> b!264047 m!280357))

(declare-fun m!280695 () Bool)

(assert (=> bm!25275 m!280695))

(assert (=> bm!25219 d!63635))

(declare-fun d!63637 () Bool)

(declare-fun lt!133652 () Bool)

(assert (=> d!63637 (= lt!133652 (select (content!176 (toList!1961 lt!133275)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun e!171086 () Bool)

(assert (=> d!63637 (= lt!133652 e!171086)))

(declare-fun res!128900 () Bool)

(assert (=> d!63637 (=> (not res!128900) (not e!171086))))

(assert (=> d!63637 (= res!128900 ((_ is Cons!3848) (toList!1961 lt!133275)))))

(assert (=> d!63637 (= (contains!1914 (toList!1961 lt!133275) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) lt!133652)))

(declare-fun b!264049 () Bool)

(declare-fun e!171085 () Bool)

(assert (=> b!264049 (= e!171086 e!171085)))

(declare-fun res!128899 () Bool)

(assert (=> b!264049 (=> res!128899 e!171085)))

(assert (=> b!264049 (= res!128899 (= (h!4514 (toList!1961 lt!133275)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun b!264050 () Bool)

(assert (=> b!264050 (= e!171085 (contains!1914 (t!8929 (toList!1961 lt!133275)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(assert (= (and d!63637 res!128900) b!264049))

(assert (= (and b!264049 (not res!128899)) b!264050))

(declare-fun m!280697 () Bool)

(assert (=> d!63637 m!280697))

(declare-fun m!280699 () Bool)

(assert (=> d!63637 m!280699))

(declare-fun m!280701 () Bool)

(assert (=> b!264050 m!280701))

(assert (=> b!263268 d!63637))

(declare-fun e!171088 () Option!326)

(declare-fun b!264053 () Bool)

(assert (=> b!264053 (= e!171088 (getValueByKey!320 (t!8929 (toList!1961 lt!133307)) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264051 () Bool)

(declare-fun e!171087 () Option!326)

(assert (=> b!264051 (= e!171087 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133307)))))))

(declare-fun c!45128 () Bool)

(declare-fun d!63639 () Bool)

(assert (=> d!63639 (= c!45128 (and ((_ is Cons!3848) (toList!1961 lt!133307)) (= (_1!2500 (h!4514 (toList!1961 lt!133307))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (=> d!63639 (= (getValueByKey!320 (toList!1961 lt!133307) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) e!171087)))

(declare-fun b!264054 () Bool)

(assert (=> b!264054 (= e!171088 None!324)))

(declare-fun b!264052 () Bool)

(assert (=> b!264052 (= e!171087 e!171088)))

(declare-fun c!45129 () Bool)

(assert (=> b!264052 (= c!45129 (and ((_ is Cons!3848) (toList!1961 lt!133307)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133307))) (_1!2500 (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))))

(assert (= (and d!63639 c!45128) b!264051))

(assert (= (and d!63639 (not c!45128)) b!264052))

(assert (= (and b!264052 c!45129) b!264053))

(assert (= (and b!264052 (not c!45129)) b!264054))

(declare-fun m!280703 () Bool)

(assert (=> b!264053 m!280703))

(assert (=> b!263328 d!63639))

(declare-fun d!63641 () Bool)

(declare-fun e!171089 () Bool)

(assert (=> d!63641 e!171089))

(declare-fun res!128901 () Bool)

(assert (=> d!63641 (=> res!128901 e!171089)))

(declare-fun lt!133654 () Bool)

(assert (=> d!63641 (= res!128901 (not lt!133654))))

(declare-fun lt!133653 () Bool)

(assert (=> d!63641 (= lt!133654 lt!133653)))

(declare-fun lt!133655 () Unit!8190)

(declare-fun e!171090 () Unit!8190)

(assert (=> d!63641 (= lt!133655 e!171090)))

(declare-fun c!45130 () Bool)

(assert (=> d!63641 (= c!45130 lt!133653)))

(assert (=> d!63641 (= lt!133653 (containsKey!312 (toList!1961 lt!133275) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63641 (= (contains!1912 lt!133275 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133654)))

(declare-fun b!264055 () Bool)

(declare-fun lt!133656 () Unit!8190)

(assert (=> b!264055 (= e!171090 lt!133656)))

(assert (=> b!264055 (= lt!133656 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133275) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> b!264055 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133275) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264056 () Bool)

(declare-fun Unit!8231 () Unit!8190)

(assert (=> b!264056 (= e!171090 Unit!8231)))

(declare-fun b!264057 () Bool)

(assert (=> b!264057 (= e!171089 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133275) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63641 c!45130) b!264055))

(assert (= (and d!63641 (not c!45130)) b!264056))

(assert (= (and d!63641 (not res!128901)) b!264057))

(declare-fun m!280705 () Bool)

(assert (=> d!63641 m!280705))

(declare-fun m!280707 () Bool)

(assert (=> b!264055 m!280707))

(assert (=> b!264055 m!279415))

(assert (=> b!264055 m!279415))

(declare-fun m!280709 () Bool)

(assert (=> b!264055 m!280709))

(assert (=> b!264057 m!279415))

(assert (=> b!264057 m!279415))

(assert (=> b!264057 m!280709))

(assert (=> d!63143 d!63641))

(declare-fun b!264060 () Bool)

(declare-fun e!171092 () Option!326)

(assert (=> b!264060 (= e!171092 (getValueByKey!320 (t!8929 lt!133276) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264058 () Bool)

(declare-fun e!171091 () Option!326)

(assert (=> b!264058 (= e!171091 (Some!325 (_2!2500 (h!4514 lt!133276))))))

(declare-fun d!63643 () Bool)

(declare-fun c!45131 () Bool)

(assert (=> d!63643 (= c!45131 (and ((_ is Cons!3848) lt!133276) (= (_1!2500 (h!4514 lt!133276)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63643 (= (getValueByKey!320 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) e!171091)))

(declare-fun b!264061 () Bool)

(assert (=> b!264061 (= e!171092 None!324)))

(declare-fun b!264059 () Bool)

(assert (=> b!264059 (= e!171091 e!171092)))

(declare-fun c!45132 () Bool)

(assert (=> b!264059 (= c!45132 (and ((_ is Cons!3848) lt!133276) (not (= (_1!2500 (h!4514 lt!133276)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63643 c!45131) b!264058))

(assert (= (and d!63643 (not c!45131)) b!264059))

(assert (= (and b!264059 c!45132) b!264060))

(assert (= (and b!264059 (not c!45132)) b!264061))

(declare-fun m!280711 () Bool)

(assert (=> b!264060 m!280711))

(assert (=> d!63143 d!63643))

(declare-fun d!63645 () Bool)

(assert (=> d!63645 (= (getValueByKey!320 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133657 () Unit!8190)

(assert (=> d!63645 (= lt!133657 (choose!1294 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun e!171093 () Bool)

(assert (=> d!63645 e!171093))

(declare-fun res!128902 () Bool)

(assert (=> d!63645 (=> (not res!128902) (not e!171093))))

(assert (=> d!63645 (= res!128902 (isStrictlySorted!377 lt!133276))))

(assert (=> d!63645 (= (lemmaContainsTupThenGetReturnValue!176 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133657)))

(declare-fun b!264062 () Bool)

(declare-fun res!128903 () Bool)

(assert (=> b!264062 (=> (not res!128903) (not e!171093))))

(assert (=> b!264062 (= res!128903 (containsKey!312 lt!133276 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264063 () Bool)

(assert (=> b!264063 (= e!171093 (contains!1914 lt!133276 (tuple2!4979 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63645 res!128902) b!264062))

(assert (= (and b!264062 res!128903) b!264063))

(assert (=> d!63645 m!279409))

(declare-fun m!280713 () Bool)

(assert (=> d!63645 m!280713))

(declare-fun m!280715 () Bool)

(assert (=> d!63645 m!280715))

(declare-fun m!280717 () Bool)

(assert (=> b!264062 m!280717))

(declare-fun m!280719 () Bool)

(assert (=> b!264063 m!280719))

(assert (=> d!63143 d!63645))

(declare-fun bm!25276 () Bool)

(declare-fun call!25281 () List!3852)

(declare-fun call!25280 () List!3852)

(assert (=> bm!25276 (= call!25281 call!25280)))

(declare-fun bm!25277 () Bool)

(declare-fun call!25279 () List!3852)

(assert (=> bm!25277 (= call!25279 call!25281)))

(declare-fun b!264064 () Bool)

(declare-fun res!128904 () Bool)

(declare-fun e!171098 () Bool)

(assert (=> b!264064 (=> (not res!128904) (not e!171098))))

(declare-fun lt!133658 () List!3852)

(assert (=> b!264064 (= res!128904 (containsKey!312 lt!133658 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264065 () Bool)

(declare-fun c!45133 () Bool)

(assert (=> b!264065 (= c!45133 (and ((_ is Cons!3848) (toList!1961 call!25181)) (bvsgt (_1!2500 (h!4514 (toList!1961 call!25181))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun e!171097 () List!3852)

(declare-fun e!171094 () List!3852)

(assert (=> b!264065 (= e!171097 e!171094)))

(declare-fun b!264066 () Bool)

(declare-fun e!171096 () List!3852)

(assert (=> b!264066 (= e!171096 e!171097)))

(declare-fun c!45136 () Bool)

(assert (=> b!264066 (= c!45136 (and ((_ is Cons!3848) (toList!1961 call!25181)) (= (_1!2500 (h!4514 (toList!1961 call!25181))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264067 () Bool)

(assert (=> b!264067 (= e!171098 (contains!1914 lt!133658 (tuple2!4979 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264068 () Bool)

(assert (=> b!264068 (= e!171096 call!25280)))

(declare-fun b!264069 () Bool)

(assert (=> b!264069 (= e!171097 call!25281)))

(declare-fun b!264070 () Bool)

(declare-fun e!171095 () List!3852)

(assert (=> b!264070 (= e!171095 (insertStrictlySorted!179 (t!8929 (toList!1961 call!25181)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264071 () Bool)

(assert (=> b!264071 (= e!171094 call!25279)))

(declare-fun c!45135 () Bool)

(declare-fun bm!25278 () Bool)

(assert (=> bm!25278 (= call!25280 ($colon$colon!108 e!171095 (ite c!45135 (h!4514 (toList!1961 call!25181)) (tuple2!4979 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun c!45134 () Bool)

(assert (=> bm!25278 (= c!45134 c!45135)))

(declare-fun d!63647 () Bool)

(assert (=> d!63647 e!171098))

(declare-fun res!128905 () Bool)

(assert (=> d!63647 (=> (not res!128905) (not e!171098))))

(assert (=> d!63647 (= res!128905 (isStrictlySorted!377 lt!133658))))

(assert (=> d!63647 (= lt!133658 e!171096)))

(assert (=> d!63647 (= c!45135 (and ((_ is Cons!3848) (toList!1961 call!25181)) (bvslt (_1!2500 (h!4514 (toList!1961 call!25181))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63647 (isStrictlySorted!377 (toList!1961 call!25181))))

(assert (=> d!63647 (= (insertStrictlySorted!179 (toList!1961 call!25181) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133658)))

(declare-fun b!264072 () Bool)

(assert (=> b!264072 (= e!171094 call!25279)))

(declare-fun b!264073 () Bool)

(assert (=> b!264073 (= e!171095 (ite c!45136 (t!8929 (toList!1961 call!25181)) (ite c!45133 (Cons!3848 (h!4514 (toList!1961 call!25181)) (t!8929 (toList!1961 call!25181))) Nil!3849)))))

(assert (= (and d!63647 c!45135) b!264068))

(assert (= (and d!63647 (not c!45135)) b!264066))

(assert (= (and b!264066 c!45136) b!264069))

(assert (= (and b!264066 (not c!45136)) b!264065))

(assert (= (and b!264065 c!45133) b!264072))

(assert (= (and b!264065 (not c!45133)) b!264071))

(assert (= (or b!264072 b!264071) bm!25277))

(assert (= (or b!264069 bm!25277) bm!25276))

(assert (= (or b!264068 bm!25276) bm!25278))

(assert (= (and bm!25278 c!45134) b!264070))

(assert (= (and bm!25278 (not c!45134)) b!264073))

(assert (= (and d!63647 res!128905) b!264064))

(assert (= (and b!264064 res!128904) b!264067))

(declare-fun m!280721 () Bool)

(assert (=> bm!25278 m!280721))

(declare-fun m!280723 () Bool)

(assert (=> b!264070 m!280723))

(declare-fun m!280725 () Bool)

(assert (=> b!264067 m!280725))

(declare-fun m!280727 () Bool)

(assert (=> b!264064 m!280727))

(declare-fun m!280729 () Bool)

(assert (=> d!63647 m!280729))

(declare-fun m!280731 () Bool)

(assert (=> d!63647 m!280731))

(assert (=> d!63143 d!63647))

(declare-fun b!264076 () Bool)

(declare-fun e!171100 () Option!326)

(assert (=> b!264076 (= e!171100 (getValueByKey!320 (t!8929 (t!8929 (toList!1961 lt!133265))) (_1!2500 lt!133020)))))

(declare-fun b!264074 () Bool)

(declare-fun e!171099 () Option!326)

(assert (=> b!264074 (= e!171099 (Some!325 (_2!2500 (h!4514 (t!8929 (toList!1961 lt!133265))))))))

(declare-fun d!63649 () Bool)

(declare-fun c!45137 () Bool)

(assert (=> d!63649 (= c!45137 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133265))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133265)))) (_1!2500 lt!133020))))))

(assert (=> d!63649 (= (getValueByKey!320 (t!8929 (toList!1961 lt!133265)) (_1!2500 lt!133020)) e!171099)))

(declare-fun b!264077 () Bool)

(assert (=> b!264077 (= e!171100 None!324)))

(declare-fun b!264075 () Bool)

(assert (=> b!264075 (= e!171099 e!171100)))

(declare-fun c!45138 () Bool)

(assert (=> b!264075 (= c!45138 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133265))) (not (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133265)))) (_1!2500 lt!133020)))))))

(assert (= (and d!63649 c!45137) b!264074))

(assert (= (and d!63649 (not c!45137)) b!264075))

(assert (= (and b!264075 c!45138) b!264076))

(assert (= (and b!264075 (not c!45138)) b!264077))

(declare-fun m!280733 () Bool)

(assert (=> b!264076 m!280733))

(assert (=> b!263630 d!63649))

(declare-fun d!63651 () Bool)

(declare-fun lt!133659 () Bool)

(assert (=> d!63651 (= lt!133659 (select (content!176 lt!133413) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun e!171102 () Bool)

(assert (=> d!63651 (= lt!133659 e!171102)))

(declare-fun res!128907 () Bool)

(assert (=> d!63651 (=> (not res!128907) (not e!171102))))

(assert (=> d!63651 (= res!128907 ((_ is Cons!3848) lt!133413))))

(assert (=> d!63651 (= (contains!1914 lt!133413 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))) lt!133659)))

(declare-fun b!264078 () Bool)

(declare-fun e!171101 () Bool)

(assert (=> b!264078 (= e!171102 e!171101)))

(declare-fun res!128906 () Bool)

(assert (=> b!264078 (=> res!128906 e!171101)))

(assert (=> b!264078 (= res!128906 (= (h!4514 lt!133413) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!264079 () Bool)

(assert (=> b!264079 (= e!171101 (contains!1914 (t!8929 lt!133413) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(assert (= (and d!63651 res!128907) b!264078))

(assert (= (and b!264078 (not res!128906)) b!264079))

(declare-fun m!280735 () Bool)

(assert (=> d!63651 m!280735))

(declare-fun m!280737 () Bool)

(assert (=> d!63651 m!280737))

(declare-fun m!280739 () Bool)

(assert (=> b!264079 m!280739))

(assert (=> b!263556 d!63651))

(declare-fun b!264082 () Bool)

(declare-fun e!171104 () Option!326)

(assert (=> b!264082 (= e!171104 (getValueByKey!320 (t!8929 (t!8929 (toList!1961 lt!133127))) (_1!2500 lt!133020)))))

(declare-fun b!264080 () Bool)

(declare-fun e!171103 () Option!326)

(assert (=> b!264080 (= e!171103 (Some!325 (_2!2500 (h!4514 (t!8929 (toList!1961 lt!133127))))))))

(declare-fun d!63653 () Bool)

(declare-fun c!45139 () Bool)

(assert (=> d!63653 (= c!45139 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133127))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133127)))) (_1!2500 lt!133020))))))

(assert (=> d!63653 (= (getValueByKey!320 (t!8929 (toList!1961 lt!133127)) (_1!2500 lt!133020)) e!171103)))

(declare-fun b!264083 () Bool)

(assert (=> b!264083 (= e!171104 None!324)))

(declare-fun b!264081 () Bool)

(assert (=> b!264081 (= e!171103 e!171104)))

(declare-fun c!45140 () Bool)

(assert (=> b!264081 (= c!45140 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133127))) (not (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133127)))) (_1!2500 lt!133020)))))))

(assert (= (and d!63653 c!45139) b!264080))

(assert (= (and d!63653 (not c!45139)) b!264081))

(assert (= (and b!264081 c!45140) b!264082))

(assert (= (and b!264081 (not c!45140)) b!264083))

(declare-fun m!280741 () Bool)

(assert (=> b!264082 m!280741))

(assert (=> b!263518 d!63653))

(assert (=> b!263452 d!63321))

(declare-fun d!63655 () Bool)

(assert (=> d!63655 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133660 () Unit!8190)

(assert (=> d!63655 (= lt!133660 (choose!1293 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171105 () Bool)

(assert (=> d!63655 e!171105))

(declare-fun res!128908 () Bool)

(assert (=> d!63655 (=> (not res!128908) (not e!171105))))

(assert (=> d!63655 (= res!128908 (isStrictlySorted!377 (toList!1961 lt!133256)))))

(assert (=> d!63655 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000) lt!133660)))

(declare-fun b!264084 () Bool)

(assert (=> b!264084 (= e!171105 (containsKey!312 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63655 res!128908) b!264084))

(assert (=> d!63655 m!279607))

(assert (=> d!63655 m!279607))

(assert (=> d!63655 m!279715))

(declare-fun m!280743 () Bool)

(assert (=> d!63655 m!280743))

(assert (=> d!63655 m!280141))

(assert (=> b!264084 m!279711))

(assert (=> b!263513 d!63655))

(declare-fun d!63657 () Bool)

(assert (=> d!63657 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9301 () Bool)

(assert (= bs!9301 d!63657))

(assert (=> bs!9301 m!279607))

(declare-fun m!280745 () Bool)

(assert (=> bs!9301 m!280745))

(assert (=> b!263513 d!63657))

(assert (=> b!263513 d!63553))

(declare-fun e!171106 () Bool)

(declare-fun b!264085 () Bool)

(assert (=> b!264085 (= e!171106 (contains!1915 (ite c!44988 (Cons!3849 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) Nil!3850) Nil!3850) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264087 () Bool)

(declare-fun e!171109 () Bool)

(declare-fun call!25282 () Bool)

(assert (=> b!264087 (= e!171109 call!25282)))

(declare-fun b!264088 () Bool)

(declare-fun e!171107 () Bool)

(assert (=> b!264088 (= e!171107 e!171109)))

(declare-fun c!45141 () Bool)

(assert (=> b!264088 (= c!45141 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264086 () Bool)

(declare-fun e!171108 () Bool)

(assert (=> b!264086 (= e!171108 e!171107)))

(declare-fun res!128910 () Bool)

(assert (=> b!264086 (=> (not res!128910) (not e!171107))))

(assert (=> b!264086 (= res!128910 (not e!171106))))

(declare-fun res!128911 () Bool)

(assert (=> b!264086 (=> (not res!128911) (not e!171106))))

(assert (=> b!264086 (= res!128911 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63659 () Bool)

(declare-fun res!128909 () Bool)

(assert (=> d!63659 (=> res!128909 e!171108)))

(assert (=> d!63659 (= res!128909 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!63659 (= (arrayNoDuplicates!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44988 (Cons!3849 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) e!171108)))

(declare-fun bm!25279 () Bool)

(assert (=> bm!25279 (= call!25282 (arrayNoDuplicates!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45141 (Cons!3849 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44988 (Cons!3849 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (ite c!44988 (Cons!3849 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) Nil!3850) Nil!3850))))))

(declare-fun b!264089 () Bool)

(assert (=> b!264089 (= e!171109 call!25282)))

(assert (= (and d!63659 (not res!128909)) b!264086))

(assert (= (and b!264086 res!128911) b!264085))

(assert (= (and b!264086 res!128910) b!264088))

(assert (= (and b!264088 c!45141) b!264087))

(assert (= (and b!264088 (not c!45141)) b!264089))

(assert (= (or b!264087 b!264089) bm!25279))

(assert (=> b!264085 m!280541))

(assert (=> b!264085 m!280541))

(declare-fun m!280747 () Bool)

(assert (=> b!264085 m!280747))

(assert (=> b!264088 m!280541))

(assert (=> b!264088 m!280541))

(assert (=> b!264088 m!280551))

(assert (=> b!264086 m!280541))

(assert (=> b!264086 m!280541))

(assert (=> b!264086 m!280551))

(assert (=> bm!25279 m!280541))

(declare-fun m!280749 () Bool)

(assert (=> bm!25279 m!280749))

(assert (=> bm!25229 d!63659))

(declare-fun d!63661 () Bool)

(assert (=> d!63661 (= (get!3095 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5504 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263366 d!63661))

(declare-fun b!264090 () Bool)

(declare-fun e!171115 () Bool)

(declare-fun lt!133662 () ListLongMap!3891)

(assert (=> b!264090 (= e!171115 (= lt!133662 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504))))))

(declare-fun b!264091 () Bool)

(declare-fun e!171113 () Bool)

(assert (=> b!264091 (= e!171113 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264091 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!264092 () Bool)

(declare-fun res!128912 () Bool)

(declare-fun e!171114 () Bool)

(assert (=> b!264092 (=> (not res!128912) (not e!171114))))

(assert (=> b!264092 (= res!128912 (not (contains!1912 lt!133662 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264093 () Bool)

(declare-fun e!171116 () Bool)

(assert (=> b!264093 (= e!171114 e!171116)))

(declare-fun c!45143 () Bool)

(assert (=> b!264093 (= c!45143 e!171113)))

(declare-fun res!128913 () Bool)

(assert (=> b!264093 (=> (not res!128913) (not e!171113))))

(assert (=> b!264093 (= res!128913 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!264094 () Bool)

(declare-fun e!171112 () ListLongMap!3891)

(declare-fun e!171110 () ListLongMap!3891)

(assert (=> b!264094 (= e!171112 e!171110)))

(declare-fun c!45145 () Bool)

(assert (=> b!264094 (= c!45145 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264095 () Bool)

(assert (=> b!264095 (= e!171115 (isEmpty!541 lt!133662))))

(declare-fun bm!25280 () Bool)

(declare-fun call!25283 () ListLongMap!3891)

(assert (=> bm!25280 (= call!25283 (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)))))

(declare-fun d!63663 () Bool)

(assert (=> d!63663 e!171114))

(declare-fun res!128915 () Bool)

(assert (=> d!63663 (=> (not res!128915) (not e!171114))))

(assert (=> d!63663 (= res!128915 (not (contains!1912 lt!133662 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63663 (= lt!133662 e!171112)))

(declare-fun c!45142 () Bool)

(assert (=> d!63663 (= c!45142 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63663 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63663 (= (getCurrentListMapNoExtraKeys!584 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4843 thiss!1504)) lt!133662)))

(declare-fun b!264096 () Bool)

(assert (=> b!264096 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> b!264096 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6349 (_values!4826 thiss!1504))))))

(declare-fun e!171111 () Bool)

(assert (=> b!264096 (= e!171111 (= (apply!262 lt!133662 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264097 () Bool)

(assert (=> b!264097 (= e!171116 e!171115)))

(declare-fun c!45144 () Bool)

(assert (=> b!264097 (= c!45144 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!264098 () Bool)

(assert (=> b!264098 (= e!171112 (ListLongMap!3892 Nil!3849))))

(declare-fun b!264099 () Bool)

(declare-fun lt!133661 () Unit!8190)

(declare-fun lt!133664 () Unit!8190)

(assert (=> b!264099 (= lt!133661 lt!133664)))

(declare-fun lt!133663 () V!8523)

(declare-fun lt!133666 () (_ BitVec 64))

(declare-fun lt!133667 () ListLongMap!3891)

(declare-fun lt!133665 () (_ BitVec 64))

(assert (=> b!264099 (not (contains!1912 (+!710 lt!133667 (tuple2!4979 lt!133666 lt!133663)) lt!133665))))

(assert (=> b!264099 (= lt!133664 (addStillNotContains!129 lt!133667 lt!133666 lt!133663 lt!133665))))

(assert (=> b!264099 (= lt!133665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!264099 (= lt!133663 (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!264099 (= lt!133666 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264099 (= lt!133667 call!25283)))

(assert (=> b!264099 (= e!171110 (+!710 call!25283 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!264100 () Bool)

(assert (=> b!264100 (= e!171110 call!25283)))

(declare-fun b!264101 () Bool)

(assert (=> b!264101 (= e!171116 e!171111)))

(assert (=> b!264101 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128914 () Bool)

(assert (=> b!264101 (= res!128914 (contains!1912 lt!133662 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264101 (=> (not res!128914) (not e!171111))))

(assert (= (and d!63663 c!45142) b!264098))

(assert (= (and d!63663 (not c!45142)) b!264094))

(assert (= (and b!264094 c!45145) b!264099))

(assert (= (and b!264094 (not c!45145)) b!264100))

(assert (= (or b!264099 b!264100) bm!25280))

(assert (= (and d!63663 res!128915) b!264092))

(assert (= (and b!264092 res!128912) b!264093))

(assert (= (and b!264093 res!128913) b!264091))

(assert (= (and b!264093 c!45143) b!264101))

(assert (= (and b!264093 (not c!45143)) b!264097))

(assert (= (and b!264101 res!128914) b!264096))

(assert (= (and b!264097 c!45144) b!264090))

(assert (= (and b!264097 (not c!45144)) b!264095))

(declare-fun b_lambda!8373 () Bool)

(assert (=> (not b_lambda!8373) (not b!264096)))

(assert (=> b!264096 t!8933))

(declare-fun b_and!13969 () Bool)

(assert (= b_and!13967 (and (=> t!8933 result!5433) b_and!13969)))

(declare-fun b_lambda!8375 () Bool)

(assert (=> (not b_lambda!8375) (not b!264099)))

(assert (=> b!264099 t!8933))

(declare-fun b_and!13971 () Bool)

(assert (= b_and!13969 (and (=> t!8933 result!5433) b_and!13971)))

(declare-fun m!280751 () Bool)

(assert (=> bm!25280 m!280751))

(assert (=> b!264091 m!279597))

(assert (=> b!264091 m!279597))

(assert (=> b!264091 m!279783))

(assert (=> b!264090 m!280751))

(declare-fun m!280753 () Bool)

(assert (=> b!264099 m!280753))

(assert (=> b!264099 m!279251))

(declare-fun m!280755 () Bool)

(assert (=> b!264099 m!280755))

(assert (=> b!264099 m!279597))

(declare-fun m!280757 () Bool)

(assert (=> b!264099 m!280757))

(declare-fun m!280759 () Bool)

(assert (=> b!264099 m!280759))

(declare-fun m!280761 () Bool)

(assert (=> b!264099 m!280761))

(assert (=> b!264099 m!280759))

(assert (=> b!264099 m!280757))

(assert (=> b!264099 m!279251))

(declare-fun m!280763 () Bool)

(assert (=> b!264099 m!280763))

(declare-fun m!280765 () Bool)

(assert (=> b!264095 m!280765))

(assert (=> b!264101 m!279597))

(assert (=> b!264101 m!279597))

(declare-fun m!280767 () Bool)

(assert (=> b!264101 m!280767))

(declare-fun m!280769 () Bool)

(assert (=> b!264092 m!280769))

(assert (=> b!264094 m!279597))

(assert (=> b!264094 m!279597))

(assert (=> b!264094 m!279783))

(declare-fun m!280771 () Bool)

(assert (=> d!63663 m!280771))

(assert (=> d!63663 m!279139))

(assert (=> b!264096 m!279251))

(assert (=> b!264096 m!279597))

(assert (=> b!264096 m!280757))

(assert (=> b!264096 m!279597))

(declare-fun m!280773 () Bool)

(assert (=> b!264096 m!280773))

(assert (=> b!264096 m!280757))

(assert (=> b!264096 m!279251))

(assert (=> b!264096 m!280763))

(assert (=> bm!25209 d!63663))

(declare-fun d!63665 () Bool)

(declare-fun res!128916 () Bool)

(declare-fun e!171117 () Bool)

(assert (=> d!63665 (=> res!128916 e!171117)))

(assert (=> d!63665 (= res!128916 (and ((_ is Cons!3848) lt!133489) (= (_1!2500 (h!4514 lt!133489)) (_1!2500 lt!133020))))))

(assert (=> d!63665 (= (containsKey!312 lt!133489 (_1!2500 lt!133020)) e!171117)))

(declare-fun b!264102 () Bool)

(declare-fun e!171118 () Bool)

(assert (=> b!264102 (= e!171117 e!171118)))

(declare-fun res!128917 () Bool)

(assert (=> b!264102 (=> (not res!128917) (not e!171118))))

(assert (=> b!264102 (= res!128917 (and (or (not ((_ is Cons!3848) lt!133489)) (bvsle (_1!2500 (h!4514 lt!133489)) (_1!2500 lt!133020))) ((_ is Cons!3848) lt!133489) (bvslt (_1!2500 (h!4514 lt!133489)) (_1!2500 lt!133020))))))

(declare-fun b!264103 () Bool)

(assert (=> b!264103 (= e!171118 (containsKey!312 (t!8929 lt!133489) (_1!2500 lt!133020)))))

(assert (= (and d!63665 (not res!128916)) b!264102))

(assert (= (and b!264102 res!128917) b!264103))

(declare-fun m!280775 () Bool)

(assert (=> b!264103 m!280775))

(assert (=> b!263667 d!63665))

(assert (=> bm!25204 d!63121))

(declare-fun d!63667 () Bool)

(assert (=> d!63667 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133254) lt!133245)) (v!5508 (getValueByKey!320 (toList!1961 lt!133254) lt!133245)))))

(assert (=> d!63335 d!63667))

(declare-fun b!264106 () Bool)

(declare-fun e!171120 () Option!326)

(assert (=> b!264106 (= e!171120 (getValueByKey!320 (t!8929 (toList!1961 lt!133254)) lt!133245))))

(declare-fun b!264104 () Bool)

(declare-fun e!171119 () Option!326)

(assert (=> b!264104 (= e!171119 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133254)))))))

(declare-fun d!63669 () Bool)

(declare-fun c!45146 () Bool)

(assert (=> d!63669 (= c!45146 (and ((_ is Cons!3848) (toList!1961 lt!133254)) (= (_1!2500 (h!4514 (toList!1961 lt!133254))) lt!133245)))))

(assert (=> d!63669 (= (getValueByKey!320 (toList!1961 lt!133254) lt!133245) e!171119)))

(declare-fun b!264107 () Bool)

(assert (=> b!264107 (= e!171120 None!324)))

(declare-fun b!264105 () Bool)

(assert (=> b!264105 (= e!171119 e!171120)))

(declare-fun c!45147 () Bool)

(assert (=> b!264105 (= c!45147 (and ((_ is Cons!3848) (toList!1961 lt!133254)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133254))) lt!133245))))))

(assert (= (and d!63669 c!45146) b!264104))

(assert (= (and d!63669 (not c!45146)) b!264105))

(assert (= (and b!264105 c!45147) b!264106))

(assert (= (and b!264105 (not c!45147)) b!264107))

(declare-fun m!280777 () Bool)

(assert (=> b!264106 m!280777))

(assert (=> d!63335 d!63669))

(assert (=> d!63357 d!63343))

(assert (=> d!63357 d!63333))

(declare-fun d!63671 () Bool)

(assert (=> d!63671 (contains!1912 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) lt!133255)))

(assert (=> d!63671 true))

(declare-fun _$35!420 () Unit!8190)

(assert (=> d!63671 (= (choose!1296 lt!133262 lt!133242 (zeroValue!4684 thiss!1504) lt!133255) _$35!420)))

(declare-fun bs!9302 () Bool)

(assert (= bs!9302 d!63671))

(assert (=> bs!9302 m!279347))

(assert (=> bs!9302 m!279347))

(assert (=> bs!9302 m!279349))

(assert (=> d!63357 d!63671))

(declare-fun d!63673 () Bool)

(declare-fun e!171121 () Bool)

(assert (=> d!63673 e!171121))

(declare-fun res!128918 () Bool)

(assert (=> d!63673 (=> res!128918 e!171121)))

(declare-fun lt!133669 () Bool)

(assert (=> d!63673 (= res!128918 (not lt!133669))))

(declare-fun lt!133668 () Bool)

(assert (=> d!63673 (= lt!133669 lt!133668)))

(declare-fun lt!133670 () Unit!8190)

(declare-fun e!171122 () Unit!8190)

(assert (=> d!63673 (= lt!133670 e!171122)))

(declare-fun c!45148 () Bool)

(assert (=> d!63673 (= c!45148 lt!133668)))

(assert (=> d!63673 (= lt!133668 (containsKey!312 (toList!1961 lt!133262) lt!133255))))

(assert (=> d!63673 (= (contains!1912 lt!133262 lt!133255) lt!133669)))

(declare-fun b!264109 () Bool)

(declare-fun lt!133671 () Unit!8190)

(assert (=> b!264109 (= e!171122 lt!133671)))

(assert (=> b!264109 (= lt!133671 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133262) lt!133255))))

(assert (=> b!264109 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133262) lt!133255))))

(declare-fun b!264110 () Bool)

(declare-fun Unit!8232 () Unit!8190)

(assert (=> b!264110 (= e!171122 Unit!8232)))

(declare-fun b!264111 () Bool)

(assert (=> b!264111 (= e!171121 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133262) lt!133255)))))

(assert (= (and d!63673 c!45148) b!264109))

(assert (= (and d!63673 (not c!45148)) b!264110))

(assert (= (and d!63673 (not res!128918)) b!264111))

(declare-fun m!280779 () Bool)

(assert (=> d!63673 m!280779))

(declare-fun m!280781 () Bool)

(assert (=> b!264109 m!280781))

(declare-fun m!280783 () Bool)

(assert (=> b!264109 m!280783))

(assert (=> b!264109 m!280783))

(declare-fun m!280785 () Bool)

(assert (=> b!264109 m!280785))

(assert (=> b!264111 m!280783))

(assert (=> b!264111 m!280783))

(assert (=> b!264111 m!280785))

(assert (=> d!63357 d!63673))

(assert (=> b!263361 d!63561))

(assert (=> b!263361 d!63563))

(declare-fun d!63675 () Bool)

(declare-fun res!128919 () Bool)

(declare-fun e!171123 () Bool)

(assert (=> d!63675 (=> res!128919 e!171123)))

(assert (=> d!63675 (= res!128919 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (= (_1!2500 (h!4514 (toList!1961 lt!133256))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63675 (= (containsKey!312 (toList!1961 lt!133256) #b0000000000000000000000000000000000000000000000000000000000000000) e!171123)))

(declare-fun b!264112 () Bool)

(declare-fun e!171124 () Bool)

(assert (=> b!264112 (= e!171123 e!171124)))

(declare-fun res!128920 () Bool)

(assert (=> b!264112 (=> (not res!128920) (not e!171124))))

(assert (=> b!264112 (= res!128920 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133256))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133256))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3848) (toList!1961 lt!133256)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133256))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264113 () Bool)

(assert (=> b!264113 (= e!171124 (containsKey!312 (t!8929 (toList!1961 lt!133256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63675 (not res!128919)) b!264112))

(assert (= (and b!264112 res!128920) b!264113))

(declare-fun m!280787 () Bool)

(assert (=> b!264113 m!280787))

(assert (=> d!63243 d!63675))

(assert (=> b!263522 d!63569))

(assert (=> b!263522 d!63325))

(declare-fun b!264116 () Bool)

(declare-fun e!171126 () Option!326)

(assert (=> b!264116 (= e!171126 (getValueByKey!320 (t!8929 (t!8929 (toList!1961 lt!133012))) key!932))))

(declare-fun b!264114 () Bool)

(declare-fun e!171125 () Option!326)

(assert (=> b!264114 (= e!171125 (Some!325 (_2!2500 (h!4514 (t!8929 (toList!1961 lt!133012))))))))

(declare-fun d!63677 () Bool)

(declare-fun c!45149 () Bool)

(assert (=> d!63677 (= c!45149 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) key!932)))))

(assert (=> d!63677 (= (getValueByKey!320 (t!8929 (toList!1961 lt!133012)) key!932) e!171125)))

(declare-fun b!264117 () Bool)

(assert (=> b!264117 (= e!171126 None!324)))

(declare-fun b!264115 () Bool)

(assert (=> b!264115 (= e!171125 e!171126)))

(declare-fun c!45150 () Bool)

(assert (=> b!264115 (= c!45150 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (not (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) key!932))))))

(assert (= (and d!63677 c!45149) b!264114))

(assert (= (and d!63677 (not c!45149)) b!264115))

(assert (= (and b!264115 c!45150) b!264116))

(assert (= (and b!264115 (not c!45150)) b!264117))

(declare-fun m!280789 () Bool)

(assert (=> b!264116 m!280789))

(assert (=> b!263319 d!63677))

(declare-fun d!63679 () Bool)

(declare-fun res!128921 () Bool)

(declare-fun e!171127 () Bool)

(assert (=> d!63679 (=> res!128921 e!171127)))

(assert (=> d!63679 (= res!128921 (and ((_ is Cons!3848) lt!133266) (= (_1!2500 (h!4514 lt!133266)) (_1!2500 lt!133020))))))

(assert (=> d!63679 (= (containsKey!312 lt!133266 (_1!2500 lt!133020)) e!171127)))

(declare-fun b!264118 () Bool)

(declare-fun e!171128 () Bool)

(assert (=> b!264118 (= e!171127 e!171128)))

(declare-fun res!128922 () Bool)

(assert (=> b!264118 (=> (not res!128922) (not e!171128))))

(assert (=> b!264118 (= res!128922 (and (or (not ((_ is Cons!3848) lt!133266)) (bvsle (_1!2500 (h!4514 lt!133266)) (_1!2500 lt!133020))) ((_ is Cons!3848) lt!133266) (bvslt (_1!2500 (h!4514 lt!133266)) (_1!2500 lt!133020))))))

(declare-fun b!264119 () Bool)

(assert (=> b!264119 (= e!171128 (containsKey!312 (t!8929 lt!133266) (_1!2500 lt!133020)))))

(assert (= (and d!63679 (not res!128921)) b!264118))

(assert (= (and b!264118 res!128922) b!264119))

(declare-fun m!280791 () Bool)

(assert (=> b!264119 m!280791))

(assert (=> b!263531 d!63679))

(declare-fun d!63681 () Bool)

(assert (=> d!63681 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun lt!133672 () Unit!8190)

(assert (=> d!63681 (= lt!133672 (choose!1293 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!171129 () Bool)

(assert (=> d!63681 e!171129))

(declare-fun res!128923 () Bool)

(assert (=> d!63681 (=> (not res!128923) (not e!171129))))

(assert (=> d!63681 (= res!128923 (isStrictlySorted!377 (toList!1961 lt!133201)))))

(assert (=> d!63681 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) lt!133672)))

(declare-fun b!264120 () Bool)

(assert (=> b!264120 (= e!171129 (containsKey!312 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63681 res!128923) b!264120))

(assert (=> d!63681 m!279199))

(assert (=> d!63681 m!279533))

(assert (=> d!63681 m!279533))

(assert (=> d!63681 m!280127))

(assert (=> d!63681 m!279199))

(declare-fun m!280793 () Bool)

(assert (=> d!63681 m!280793))

(assert (=> d!63681 m!280323))

(assert (=> b!264120 m!279199))

(assert (=> b!264120 m!280123))

(assert (=> b!263710 d!63681))

(declare-fun d!63683 () Bool)

(assert (=> d!63683 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))))

(declare-fun bs!9303 () Bool)

(assert (= bs!9303 d!63683))

(assert (=> bs!9303 m!279533))

(declare-fun m!280795 () Bool)

(assert (=> bs!9303 m!280795))

(assert (=> b!263710 d!63683))

(declare-fun b!264123 () Bool)

(declare-fun e!171131 () Option!326)

(assert (=> b!264123 (= e!171131 (getValueByKey!320 (t!8929 (toList!1961 lt!133201)) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!264121 () Bool)

(declare-fun e!171130 () Option!326)

(assert (=> b!264121 (= e!171130 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133201)))))))

(declare-fun d!63685 () Bool)

(declare-fun c!45151 () Bool)

(assert (=> d!63685 (= c!45151 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (= (_1!2500 (h!4514 (toList!1961 lt!133201))) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63685 (= (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) e!171130)))

(declare-fun b!264124 () Bool)

(assert (=> b!264124 (= e!171131 None!324)))

(declare-fun b!264122 () Bool)

(assert (=> b!264122 (= e!171130 e!171131)))

(declare-fun c!45152 () Bool)

(assert (=> b!264122 (= c!45152 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133201))) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))))

(assert (= (and d!63685 c!45151) b!264121))

(assert (= (and d!63685 (not c!45151)) b!264122))

(assert (= (and b!264122 c!45152) b!264123))

(assert (= (and b!264122 (not c!45152)) b!264124))

(assert (=> b!264123 m!279199))

(declare-fun m!280797 () Bool)

(assert (=> b!264123 m!280797))

(assert (=> b!263710 d!63685))

(declare-fun b!264127 () Bool)

(declare-fun e!171133 () Option!326)

(assert (=> b!264127 (= e!171133 (getValueByKey!320 (t!8929 (toList!1961 lt!133275)) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264125 () Bool)

(declare-fun e!171132 () Option!326)

(assert (=> b!264125 (= e!171132 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133275)))))))

(declare-fun d!63687 () Bool)

(declare-fun c!45153 () Bool)

(assert (=> d!63687 (= c!45153 (and ((_ is Cons!3848) (toList!1961 lt!133275)) (= (_1!2500 (h!4514 (toList!1961 lt!133275))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63687 (= (getValueByKey!320 (toList!1961 lt!133275) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) e!171132)))

(declare-fun b!264128 () Bool)

(assert (=> b!264128 (= e!171133 None!324)))

(declare-fun b!264126 () Bool)

(assert (=> b!264126 (= e!171132 e!171133)))

(declare-fun c!45154 () Bool)

(assert (=> b!264126 (= c!45154 (and ((_ is Cons!3848) (toList!1961 lt!133275)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133275))) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63687 c!45153) b!264125))

(assert (= (and d!63687 (not c!45153)) b!264126))

(assert (= (and b!264126 c!45154) b!264127))

(assert (= (and b!264126 (not c!45154)) b!264128))

(declare-fun m!280799 () Bool)

(assert (=> b!264127 m!280799))

(assert (=> b!263267 d!63687))

(declare-fun d!63689 () Bool)

(declare-fun e!171134 () Bool)

(assert (=> d!63689 e!171134))

(declare-fun res!128924 () Bool)

(assert (=> d!63689 (=> (not res!128924) (not e!171134))))

(declare-fun lt!133675 () ListLongMap!3891)

(assert (=> d!63689 (= res!128924 (contains!1912 lt!133675 (_1!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun lt!133676 () List!3852)

(assert (=> d!63689 (= lt!133675 (ListLongMap!3892 lt!133676))))

(declare-fun lt!133674 () Unit!8190)

(declare-fun lt!133673 () Unit!8190)

(assert (=> d!63689 (= lt!133674 lt!133673)))

(assert (=> d!63689 (= (getValueByKey!320 lt!133676 (_1!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63689 (= lt!133673 (lemmaContainsTupThenGetReturnValue!176 lt!133676 (_1!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63689 (= lt!133676 (insertStrictlySorted!179 (toList!1961 (ite c!44956 call!25217 (ite c!44953 call!25215 call!25216))) (_1!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63689 (= (+!710 (ite c!44956 call!25217 (ite c!44953 call!25215 call!25216)) (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133675)))

(declare-fun b!264129 () Bool)

(declare-fun res!128925 () Bool)

(assert (=> b!264129 (=> (not res!128925) (not e!171134))))

(assert (=> b!264129 (= res!128925 (= (getValueByKey!320 (toList!1961 lt!133675) (_1!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!264130 () Bool)

(assert (=> b!264130 (= e!171134 (contains!1914 (toList!1961 lt!133675) (ite (or c!44956 c!44953) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (= (and d!63689 res!128924) b!264129))

(assert (= (and b!264129 res!128925) b!264130))

(declare-fun m!280801 () Bool)

(assert (=> d!63689 m!280801))

(declare-fun m!280803 () Bool)

(assert (=> d!63689 m!280803))

(declare-fun m!280805 () Bool)

(assert (=> d!63689 m!280805))

(declare-fun m!280807 () Bool)

(assert (=> d!63689 m!280807))

(declare-fun m!280809 () Bool)

(assert (=> b!264129 m!280809))

(declare-fun m!280811 () Bool)

(assert (=> b!264130 m!280811))

(assert (=> bm!25216 d!63689))

(declare-fun b!264132 () Bool)

(declare-fun e!171135 () Bool)

(declare-fun call!25284 () Bool)

(assert (=> b!264132 (= e!171135 call!25284)))

(declare-fun b!264133 () Bool)

(declare-fun e!171136 () Bool)

(assert (=> b!264133 (= e!171135 e!171136)))

(declare-fun lt!133677 () (_ BitVec 64))

(assert (=> b!264133 (= lt!133677 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133678 () Unit!8190)

(assert (=> b!264133 (= lt!133678 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7035 thiss!1504) lt!133677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264133 (arrayContainsKey!0 (_keys!7035 thiss!1504) lt!133677 #b00000000000000000000000000000000)))

(declare-fun lt!133679 () Unit!8190)

(assert (=> b!264133 (= lt!133679 lt!133678)))

(declare-fun res!128927 () Bool)

(assert (=> b!264133 (= res!128927 (= (seekEntryOrOpen!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) (Found!1200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264133 (=> (not res!128927) (not e!171136))))

(declare-fun b!264134 () Bool)

(assert (=> b!264134 (= e!171136 call!25284)))

(declare-fun bm!25281 () Bool)

(assert (=> bm!25281 (= call!25284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!264131 () Bool)

(declare-fun e!171137 () Bool)

(assert (=> b!264131 (= e!171137 e!171135)))

(declare-fun c!45155 () Bool)

(assert (=> b!264131 (= c!45155 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63691 () Bool)

(declare-fun res!128926 () Bool)

(assert (=> d!63691 (=> res!128926 e!171137)))

(assert (=> d!63691 (= res!128926 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63691 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) e!171137)))

(assert (= (and d!63691 (not res!128926)) b!264131))

(assert (= (and b!264131 c!45155) b!264133))

(assert (= (and b!264131 (not c!45155)) b!264132))

(assert (= (and b!264133 res!128927) b!264134))

(assert (= (or b!264134 b!264132) bm!25281))

(assert (=> b!264133 m!279597))

(declare-fun m!280813 () Bool)

(assert (=> b!264133 m!280813))

(declare-fun m!280815 () Bool)

(assert (=> b!264133 m!280815))

(assert (=> b!264133 m!279597))

(declare-fun m!280817 () Bool)

(assert (=> b!264133 m!280817))

(declare-fun m!280819 () Bool)

(assert (=> bm!25281 m!280819))

(assert (=> b!264131 m!279597))

(assert (=> b!264131 m!279597))

(assert (=> b!264131 m!279783))

(assert (=> bm!25198 d!63691))

(declare-fun d!63693 () Bool)

(assert (=> d!63693 (= (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133190)) (v!5508 (getValueByKey!320 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133190)))))

(assert (=> d!63309 d!63693))

(declare-fun b!264137 () Bool)

(declare-fun e!171139 () Option!326)

(assert (=> b!264137 (= e!171139 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))) lt!133190))))

(declare-fun b!264135 () Bool)

(declare-fun e!171138 () Option!326)

(assert (=> b!264135 (= e!171138 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))))))))

(declare-fun d!63695 () Bool)

(declare-fun c!45156 () Bool)

(assert (=> d!63695 (= c!45156 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))) lt!133190)))))

(assert (=> d!63695 (= (getValueByKey!320 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))) lt!133190) e!171138)))

(declare-fun b!264138 () Bool)

(assert (=> b!264138 (= e!171139 None!324)))

(declare-fun b!264136 () Bool)

(assert (=> b!264136 (= e!171138 e!171139)))

(declare-fun c!45157 () Bool)

(assert (=> b!264136 (= c!45157 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504)))))) lt!133190))))))

(assert (= (and d!63695 c!45156) b!264135))

(assert (= (and d!63695 (not c!45156)) b!264136))

(assert (= (and b!264136 c!45157) b!264137))

(assert (= (and b!264136 (not c!45157)) b!264138))

(declare-fun m!280821 () Bool)

(assert (=> b!264137 m!280821))

(assert (=> d!63309 d!63695))

(declare-fun d!63697 () Bool)

(declare-fun isEmpty!542 (List!3852) Bool)

(assert (=> d!63697 (= (isEmpty!541 lt!133352) (isEmpty!542 (toList!1961 lt!133352)))))

(declare-fun bs!9304 () Bool)

(assert (= bs!9304 d!63697))

(declare-fun m!280823 () Bool)

(assert (=> bs!9304 m!280823))

(assert (=> b!263432 d!63697))

(assert (=> b!263582 d!63471))

(declare-fun b!264139 () Bool)

(declare-fun e!171140 () (_ BitVec 32))

(assert (=> b!264139 (= e!171140 #b00000000000000000000000000000000)))

(declare-fun b!264141 () Bool)

(declare-fun e!171141 () (_ BitVec 32))

(assert (=> b!264141 (= e!171140 e!171141)))

(declare-fun c!45159 () Bool)

(assert (=> b!264141 (= c!45159 (validKeyInArray!0 (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264142 () Bool)

(declare-fun call!25285 () (_ BitVec 32))

(assert (=> b!264142 (= e!171141 call!25285)))

(declare-fun bm!25282 () Bool)

(assert (=> bm!25282 (= call!25285 (arrayCountValidKeys!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!63699 () Bool)

(declare-fun lt!133680 () (_ BitVec 32))

(assert (=> d!63699 (and (bvsge lt!133680 #b00000000000000000000000000000000) (bvsle lt!133680 (bvsub (size!6350 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63699 (= lt!133680 e!171140)))

(declare-fun c!45158 () Bool)

(assert (=> d!63699 (= c!45158 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63699 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!63699 (= (arrayCountValidKeys!0 (_keys!7035 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) lt!133680)))

(declare-fun b!264140 () Bool)

(assert (=> b!264140 (= e!171141 (bvadd #b00000000000000000000000000000001 call!25285))))

(assert (= (and d!63699 c!45158) b!264139))

(assert (= (and d!63699 (not c!45158)) b!264141))

(assert (= (and b!264141 c!45159) b!264140))

(assert (= (and b!264141 (not c!45159)) b!264142))

(assert (= (or b!264140 b!264142) bm!25282))

(declare-fun m!280825 () Bool)

(assert (=> b!264141 m!280825))

(assert (=> b!264141 m!280825))

(declare-fun m!280827 () Bool)

(assert (=> b!264141 m!280827))

(declare-fun m!280829 () Bool)

(assert (=> bm!25282 m!280829))

(assert (=> bm!25230 d!63699))

(declare-fun d!63701 () Bool)

(assert (=> d!63701 (= (apply!262 lt!133512 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) (get!3094 (getValueByKey!320 (toList!1961 lt!133512) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000))))))

(declare-fun bs!9305 () Bool)

(assert (= bs!9305 d!63701))

(assert (=> bs!9305 m!279591))

(assert (=> bs!9305 m!280655))

(assert (=> bs!9305 m!280655))

(declare-fun m!280831 () Bool)

(assert (=> bs!9305 m!280831))

(assert (=> b!263690 d!63701))

(declare-fun d!63703 () Bool)

(declare-fun c!45160 () Bool)

(assert (=> d!63703 (= c!45160 ((_ is ValueCellFull!2985) (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun e!171142 () V!8523)

(assert (=> d!63703 (= (get!3093 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000)) e!171142)))

(declare-fun b!264143 () Bool)

(assert (=> b!264143 (= e!171142 (get!3095 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264144 () Bool)

(assert (=> b!264144 (= e!171142 (get!3096 (select (arr!5998 (_values!4826 lt!133015)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 lt!133015) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63703 c!45160) b!264143))

(assert (= (and d!63703 (not c!45160)) b!264144))

(assert (=> b!264143 m!280117))

(assert (=> b!264143 m!280119))

(declare-fun m!280833 () Bool)

(assert (=> b!264143 m!280833))

(assert (=> b!264144 m!280117))

(assert (=> b!264144 m!280119))

(declare-fun m!280835 () Bool)

(assert (=> b!264144 m!280835))

(assert (=> b!263690 d!63703))

(declare-fun d!63705 () Bool)

(declare-fun e!171143 () Bool)

(assert (=> d!63705 e!171143))

(declare-fun res!128928 () Bool)

(assert (=> d!63705 (=> res!128928 e!171143)))

(declare-fun lt!133682 () Bool)

(assert (=> d!63705 (= res!128928 (not lt!133682))))

(declare-fun lt!133681 () Bool)

(assert (=> d!63705 (= lt!133682 lt!133681)))

(declare-fun lt!133683 () Unit!8190)

(declare-fun e!171144 () Unit!8190)

(assert (=> d!63705 (= lt!133683 e!171144)))

(declare-fun c!45161 () Bool)

(assert (=> d!63705 (= c!45161 lt!133681)))

(assert (=> d!63705 (= lt!133681 (containsKey!312 (toList!1961 lt!133460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63705 (= (contains!1912 lt!133460 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133682)))

(declare-fun b!264145 () Bool)

(declare-fun lt!133684 () Unit!8190)

(assert (=> b!264145 (= e!171144 lt!133684)))

(assert (=> b!264145 (= lt!133684 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264145 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133460) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264146 () Bool)

(declare-fun Unit!8233 () Unit!8190)

(assert (=> b!264146 (= e!171144 Unit!8233)))

(declare-fun b!264147 () Bool)

(assert (=> b!264147 (= e!171143 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63705 c!45161) b!264145))

(assert (= (and d!63705 (not c!45161)) b!264146))

(assert (= (and d!63705 (not res!128928)) b!264147))

(declare-fun m!280837 () Bool)

(assert (=> d!63705 m!280837))

(declare-fun m!280839 () Bool)

(assert (=> b!264145 m!280839))

(declare-fun m!280841 () Bool)

(assert (=> b!264145 m!280841))

(assert (=> b!264145 m!280841))

(declare-fun m!280843 () Bool)

(assert (=> b!264145 m!280843))

(assert (=> b!264147 m!280841))

(assert (=> b!264147 m!280841))

(assert (=> b!264147 m!280843))

(assert (=> b!263638 d!63705))

(assert (=> d!63369 d!63367))

(declare-fun d!63707 () Bool)

(assert (=> d!63707 (= (getValueByKey!320 lt!133128 (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020)))))

(assert (=> d!63707 true))

(declare-fun _$22!543 () Unit!8190)

(assert (=> d!63707 (= (choose!1294 lt!133128 (_1!2500 lt!133020) (_2!2500 lt!133020)) _$22!543)))

(declare-fun bs!9306 () Bool)

(assert (= bs!9306 d!63707))

(assert (=> bs!9306 m!279167))

(assert (=> d!63369 d!63707))

(declare-fun d!63709 () Bool)

(declare-fun res!128929 () Bool)

(declare-fun e!171145 () Bool)

(assert (=> d!63709 (=> res!128929 e!171145)))

(assert (=> d!63709 (= res!128929 (or ((_ is Nil!3849) lt!133128) ((_ is Nil!3849) (t!8929 lt!133128))))))

(assert (=> d!63709 (= (isStrictlySorted!377 lt!133128) e!171145)))

(declare-fun b!264148 () Bool)

(declare-fun e!171146 () Bool)

(assert (=> b!264148 (= e!171145 e!171146)))

(declare-fun res!128930 () Bool)

(assert (=> b!264148 (=> (not res!128930) (not e!171146))))

(assert (=> b!264148 (= res!128930 (bvslt (_1!2500 (h!4514 lt!133128)) (_1!2500 (h!4514 (t!8929 lt!133128)))))))

(declare-fun b!264149 () Bool)

(assert (=> b!264149 (= e!171146 (isStrictlySorted!377 (t!8929 lt!133128)))))

(assert (= (and d!63709 (not res!128929)) b!264148))

(assert (= (and b!264148 res!128930) b!264149))

(declare-fun m!280845 () Bool)

(assert (=> b!264149 m!280845))

(assert (=> d!63369 d!63709))

(declare-fun d!63711 () Bool)

(declare-fun lt!133685 () Bool)

(assert (=> d!63711 (= lt!133685 (select (content!176 (toList!1961 lt!133420)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun e!171148 () Bool)

(assert (=> d!63711 (= lt!133685 e!171148)))

(declare-fun res!128932 () Bool)

(assert (=> d!63711 (=> (not res!128932) (not e!171148))))

(assert (=> d!63711 (= res!128932 ((_ is Cons!3848) (toList!1961 lt!133420)))))

(assert (=> d!63711 (= (contains!1914 (toList!1961 lt!133420) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) lt!133685)))

(declare-fun b!264150 () Bool)

(declare-fun e!171147 () Bool)

(assert (=> b!264150 (= e!171148 e!171147)))

(declare-fun res!128931 () Bool)

(assert (=> b!264150 (=> res!128931 e!171147)))

(assert (=> b!264150 (= res!128931 (= (h!4514 (toList!1961 lt!133420)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(declare-fun b!264151 () Bool)

(assert (=> b!264151 (= e!171147 (contains!1914 (t!8929 (toList!1961 lt!133420)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(assert (= (and d!63711 res!128932) b!264150))

(assert (= (and b!264150 (not res!128931)) b!264151))

(declare-fun m!280847 () Bool)

(assert (=> d!63711 m!280847))

(declare-fun m!280849 () Bool)

(assert (=> d!63711 m!280849))

(declare-fun m!280851 () Bool)

(assert (=> b!264151 m!280851))

(assert (=> b!263585 d!63711))

(declare-fun d!63713 () Bool)

(assert (=> d!63713 (= ($colon$colon!108 e!170847 (ite c!45009 (h!4514 (toList!1961 (map!2758 thiss!1504))) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020)))) (Cons!3848 (ite c!45009 (h!4514 (toList!1961 (map!2758 thiss!1504))) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))) e!170847))))

(assert (=> bm!25236 d!63713))

(declare-fun d!63715 () Bool)

(declare-fun res!128933 () Bool)

(declare-fun e!171149 () Bool)

(assert (=> d!63715 (=> res!128933 e!171149)))

(assert (=> d!63715 (= res!128933 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (= (_1!2500 (h!4514 (toList!1961 lt!133201))) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63715 (= (containsKey!312 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) e!171149)))

(declare-fun b!264152 () Bool)

(declare-fun e!171150 () Bool)

(assert (=> b!264152 (= e!171149 e!171150)))

(declare-fun res!128934 () Bool)

(assert (=> b!264152 (=> (not res!128934) (not e!171150))))

(assert (=> b!264152 (= res!128934 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133201))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133201))) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))) ((_ is Cons!3848) (toList!1961 lt!133201)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133201))) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun b!264153 () Bool)

(assert (=> b!264153 (= e!171150 (containsKey!312 (t!8929 (toList!1961 lt!133201)) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63715 (not res!128933)) b!264152))

(assert (= (and b!264152 res!128934) b!264153))

(assert (=> b!264153 m!279199))

(declare-fun m!280853 () Bool)

(assert (=> b!264153 m!280853))

(assert (=> d!63383 d!63715))

(assert (=> b!263645 d!63263))

(declare-fun d!63717 () Bool)

(assert (=> d!63717 (not (contains!1912 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461)) lt!133463))))

(declare-fun lt!133688 () Unit!8190)

(declare-fun choose!1297 (ListLongMap!3891 (_ BitVec 64) V!8523 (_ BitVec 64)) Unit!8190)

(assert (=> d!63717 (= lt!133688 (choose!1297 lt!133465 lt!133464 lt!133461 lt!133463))))

(declare-fun e!171153 () Bool)

(assert (=> d!63717 e!171153))

(declare-fun res!128937 () Bool)

(assert (=> d!63717 (=> (not res!128937) (not e!171153))))

(assert (=> d!63717 (= res!128937 (not (contains!1912 lt!133465 lt!133463)))))

(assert (=> d!63717 (= (addStillNotContains!129 lt!133465 lt!133464 lt!133461 lt!133463) lt!133688)))

(declare-fun b!264157 () Bool)

(assert (=> b!264157 (= e!171153 (not (= lt!133464 lt!133463)))))

(assert (= (and d!63717 res!128937) b!264157))

(assert (=> d!63717 m!279935))

(assert (=> d!63717 m!279935))

(assert (=> d!63717 m!279937))

(declare-fun m!280855 () Bool)

(assert (=> d!63717 m!280855))

(declare-fun m!280857 () Bool)

(assert (=> d!63717 m!280857))

(assert (=> b!263645 d!63717))

(declare-fun d!63719 () Bool)

(declare-fun e!171154 () Bool)

(assert (=> d!63719 e!171154))

(declare-fun res!128938 () Bool)

(assert (=> d!63719 (=> (not res!128938) (not e!171154))))

(declare-fun lt!133691 () ListLongMap!3891)

(assert (=> d!63719 (= res!128938 (contains!1912 lt!133691 (_1!2500 (tuple2!4979 lt!133464 lt!133461))))))

(declare-fun lt!133692 () List!3852)

(assert (=> d!63719 (= lt!133691 (ListLongMap!3892 lt!133692))))

(declare-fun lt!133690 () Unit!8190)

(declare-fun lt!133689 () Unit!8190)

(assert (=> d!63719 (= lt!133690 lt!133689)))

(assert (=> d!63719 (= (getValueByKey!320 lt!133692 (_1!2500 (tuple2!4979 lt!133464 lt!133461))) (Some!325 (_2!2500 (tuple2!4979 lt!133464 lt!133461))))))

(assert (=> d!63719 (= lt!133689 (lemmaContainsTupThenGetReturnValue!176 lt!133692 (_1!2500 (tuple2!4979 lt!133464 lt!133461)) (_2!2500 (tuple2!4979 lt!133464 lt!133461))))))

(assert (=> d!63719 (= lt!133692 (insertStrictlySorted!179 (toList!1961 lt!133465) (_1!2500 (tuple2!4979 lt!133464 lt!133461)) (_2!2500 (tuple2!4979 lt!133464 lt!133461))))))

(assert (=> d!63719 (= (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461)) lt!133691)))

(declare-fun b!264158 () Bool)

(declare-fun res!128939 () Bool)

(assert (=> b!264158 (=> (not res!128939) (not e!171154))))

(assert (=> b!264158 (= res!128939 (= (getValueByKey!320 (toList!1961 lt!133691) (_1!2500 (tuple2!4979 lt!133464 lt!133461))) (Some!325 (_2!2500 (tuple2!4979 lt!133464 lt!133461)))))))

(declare-fun b!264159 () Bool)

(assert (=> b!264159 (= e!171154 (contains!1914 (toList!1961 lt!133691) (tuple2!4979 lt!133464 lt!133461)))))

(assert (= (and d!63719 res!128938) b!264158))

(assert (= (and b!264158 res!128939) b!264159))

(declare-fun m!280859 () Bool)

(assert (=> d!63719 m!280859))

(declare-fun m!280861 () Bool)

(assert (=> d!63719 m!280861))

(declare-fun m!280863 () Bool)

(assert (=> d!63719 m!280863))

(declare-fun m!280865 () Bool)

(assert (=> d!63719 m!280865))

(declare-fun m!280867 () Bool)

(assert (=> b!264158 m!280867))

(declare-fun m!280869 () Bool)

(assert (=> b!264159 m!280869))

(assert (=> b!263645 d!63719))

(declare-fun d!63721 () Bool)

(declare-fun e!171155 () Bool)

(assert (=> d!63721 e!171155))

(declare-fun res!128940 () Bool)

(assert (=> d!63721 (=> (not res!128940) (not e!171155))))

(declare-fun lt!133695 () ListLongMap!3891)

(assert (=> d!63721 (= res!128940 (contains!1912 lt!133695 (_1!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!133696 () List!3852)

(assert (=> d!63721 (= lt!133695 (ListLongMap!3892 lt!133696))))

(declare-fun lt!133694 () Unit!8190)

(declare-fun lt!133693 () Unit!8190)

(assert (=> d!63721 (= lt!133694 lt!133693)))

(assert (=> d!63721 (= (getValueByKey!320 lt!133696 (_1!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!325 (_2!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63721 (= lt!133693 (lemmaContainsTupThenGetReturnValue!176 lt!133696 (_1!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63721 (= lt!133696 (insertStrictlySorted!179 (toList!1961 call!25236) (_1!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63721 (= (+!710 call!25236 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!133695)))

(declare-fun b!264160 () Bool)

(declare-fun res!128941 () Bool)

(assert (=> b!264160 (=> (not res!128941) (not e!171155))))

(assert (=> b!264160 (= res!128941 (= (getValueByKey!320 (toList!1961 lt!133695) (_1!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!325 (_2!2500 (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!264161 () Bool)

(assert (=> b!264161 (= e!171155 (contains!1914 (toList!1961 lt!133695) (tuple2!4979 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!63721 res!128940) b!264160))

(assert (= (and b!264160 res!128941) b!264161))

(declare-fun m!280871 () Bool)

(assert (=> d!63721 m!280871))

(declare-fun m!280873 () Bool)

(assert (=> d!63721 m!280873))

(declare-fun m!280875 () Bool)

(assert (=> d!63721 m!280875))

(declare-fun m!280877 () Bool)

(assert (=> d!63721 m!280877))

(declare-fun m!280879 () Bool)

(assert (=> b!264160 m!280879))

(declare-fun m!280881 () Bool)

(assert (=> b!264161 m!280881))

(assert (=> b!263645 d!63721))

(declare-fun d!63723 () Bool)

(declare-fun e!171156 () Bool)

(assert (=> d!63723 e!171156))

(declare-fun res!128942 () Bool)

(assert (=> d!63723 (=> res!128942 e!171156)))

(declare-fun lt!133698 () Bool)

(assert (=> d!63723 (= res!128942 (not lt!133698))))

(declare-fun lt!133697 () Bool)

(assert (=> d!63723 (= lt!133698 lt!133697)))

(declare-fun lt!133699 () Unit!8190)

(declare-fun e!171157 () Unit!8190)

(assert (=> d!63723 (= lt!133699 e!171157)))

(declare-fun c!45162 () Bool)

(assert (=> d!63723 (= c!45162 lt!133697)))

(assert (=> d!63723 (= lt!133697 (containsKey!312 (toList!1961 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461))) lt!133463))))

(assert (=> d!63723 (= (contains!1912 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461)) lt!133463) lt!133698)))

(declare-fun b!264162 () Bool)

(declare-fun lt!133700 () Unit!8190)

(assert (=> b!264162 (= e!171157 lt!133700)))

(assert (=> b!264162 (= lt!133700 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461))) lt!133463))))

(assert (=> b!264162 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461))) lt!133463))))

(declare-fun b!264163 () Bool)

(declare-fun Unit!8234 () Unit!8190)

(assert (=> b!264163 (= e!171157 Unit!8234)))

(declare-fun b!264164 () Bool)

(assert (=> b!264164 (= e!171156 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133465 (tuple2!4979 lt!133464 lt!133461))) lt!133463)))))

(assert (= (and d!63723 c!45162) b!264162))

(assert (= (and d!63723 (not c!45162)) b!264163))

(assert (= (and d!63723 (not res!128942)) b!264164))

(declare-fun m!280883 () Bool)

(assert (=> d!63723 m!280883))

(declare-fun m!280885 () Bool)

(assert (=> b!264162 m!280885))

(declare-fun m!280887 () Bool)

(assert (=> b!264162 m!280887))

(assert (=> b!264162 m!280887))

(declare-fun m!280889 () Bool)

(assert (=> b!264162 m!280889))

(assert (=> b!264164 m!280887))

(assert (=> b!264164 m!280887))

(assert (=> b!264164 m!280889))

(assert (=> b!263645 d!63723))

(declare-fun d!63725 () Bool)

(assert (=> d!63725 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133701 () Unit!8190)

(assert (=> d!63725 (= lt!133701 (choose!1293 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171158 () Bool)

(assert (=> d!63725 e!171158))

(declare-fun res!128943 () Bool)

(assert (=> d!63725 (=> (not res!128943) (not e!171158))))

(assert (=> d!63725 (= res!128943 (isStrictlySorted!377 (toList!1961 lt!133201)))))

(assert (=> d!63725 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000) lt!133701)))

(declare-fun b!264165 () Bool)

(assert (=> b!264165 (= e!171158 (containsKey!312 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63725 res!128943) b!264165))

(assert (=> d!63725 m!279453))

(assert (=> d!63725 m!279453))

(assert (=> d!63725 m!279501))

(declare-fun m!280891 () Bool)

(assert (=> d!63725 m!280891))

(assert (=> d!63725 m!280323))

(assert (=> b!264165 m!279497))

(assert (=> b!263325 d!63725))

(declare-fun d!63727 () Bool)

(assert (=> d!63727 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9307 () Bool)

(assert (= bs!9307 d!63727))

(assert (=> bs!9307 m!279453))

(declare-fun m!280893 () Bool)

(assert (=> bs!9307 m!280893))

(assert (=> b!263325 d!63727))

(declare-fun b!264168 () Bool)

(declare-fun e!171160 () Option!326)

(assert (=> b!264168 (= e!171160 (getValueByKey!320 (t!8929 (toList!1961 lt!133201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264166 () Bool)

(declare-fun e!171159 () Option!326)

(assert (=> b!264166 (= e!171159 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133201)))))))

(declare-fun d!63729 () Bool)

(declare-fun c!45163 () Bool)

(assert (=> d!63729 (= c!45163 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (= (_1!2500 (h!4514 (toList!1961 lt!133201))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63729 (= (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000) e!171159)))

(declare-fun b!264169 () Bool)

(assert (=> b!264169 (= e!171160 None!324)))

(declare-fun b!264167 () Bool)

(assert (=> b!264167 (= e!171159 e!171160)))

(declare-fun c!45164 () Bool)

(assert (=> b!264167 (= c!45164 (and ((_ is Cons!3848) (toList!1961 lt!133201)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133201))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!63729 c!45163) b!264166))

(assert (= (and d!63729 (not c!45163)) b!264167))

(assert (= (and b!264167 c!45164) b!264168))

(assert (= (and b!264167 (not c!45164)) b!264169))

(declare-fun m!280895 () Bool)

(assert (=> b!264168 m!280895))

(assert (=> b!263325 d!63729))

(assert (=> d!63203 d!63181))

(declare-fun d!63731 () Bool)

(assert (=> d!63731 (= (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133253)) (v!5508 (getValueByKey!320 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133253)))))

(assert (=> d!63359 d!63731))

(declare-fun e!171162 () Option!326)

(declare-fun b!264172 () Bool)

(assert (=> b!264172 (= e!171162 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))) lt!133253))))

(declare-fun e!171161 () Option!326)

(declare-fun b!264170 () Bool)

(assert (=> b!264170 (= e!171161 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))))))))

(declare-fun d!63733 () Bool)

(declare-fun c!45165 () Bool)

(assert (=> d!63733 (= c!45165 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))) lt!133253)))))

(assert (=> d!63733 (= (getValueByKey!320 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))) lt!133253) e!171161)))

(declare-fun b!264173 () Bool)

(assert (=> b!264173 (= e!171162 None!324)))

(declare-fun b!264171 () Bool)

(assert (=> b!264171 (= e!171161 e!171162)))

(declare-fun c!45166 () Bool)

(assert (=> b!264171 (= c!45166 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504)))))) lt!133253))))))

(assert (= (and d!63733 c!45165) b!264170))

(assert (= (and d!63733 (not c!45165)) b!264171))

(assert (= (and b!264171 c!45166) b!264172))

(assert (= (and b!264171 (not c!45166)) b!264173))

(declare-fun m!280897 () Bool)

(assert (=> b!264172 m!280897))

(assert (=> d!63359 d!63733))

(declare-fun d!63735 () Bool)

(assert (=> d!63735 (= (validMask!0 (mask!11209 lt!133015)) (and (or (= (mask!11209 lt!133015) #b00000000000000000000000000000111) (= (mask!11209 lt!133015) #b00000000000000000000000000001111) (= (mask!11209 lt!133015) #b00000000000000000000000000011111) (= (mask!11209 lt!133015) #b00000000000000000000000000111111) (= (mask!11209 lt!133015) #b00000000000000000000000001111111) (= (mask!11209 lt!133015) #b00000000000000000000000011111111) (= (mask!11209 lt!133015) #b00000000000000000000000111111111) (= (mask!11209 lt!133015) #b00000000000000000000001111111111) (= (mask!11209 lt!133015) #b00000000000000000000011111111111) (= (mask!11209 lt!133015) #b00000000000000000000111111111111) (= (mask!11209 lt!133015) #b00000000000000000001111111111111) (= (mask!11209 lt!133015) #b00000000000000000011111111111111) (= (mask!11209 lt!133015) #b00000000000000000111111111111111) (= (mask!11209 lt!133015) #b00000000000000001111111111111111) (= (mask!11209 lt!133015) #b00000000000000011111111111111111) (= (mask!11209 lt!133015) #b00000000000000111111111111111111) (= (mask!11209 lt!133015) #b00000000000001111111111111111111) (= (mask!11209 lt!133015) #b00000000000011111111111111111111) (= (mask!11209 lt!133015) #b00000000000111111111111111111111) (= (mask!11209 lt!133015) #b00000000001111111111111111111111) (= (mask!11209 lt!133015) #b00000000011111111111111111111111) (= (mask!11209 lt!133015) #b00000000111111111111111111111111) (= (mask!11209 lt!133015) #b00000001111111111111111111111111) (= (mask!11209 lt!133015) #b00000011111111111111111111111111) (= (mask!11209 lt!133015) #b00000111111111111111111111111111) (= (mask!11209 lt!133015) #b00001111111111111111111111111111) (= (mask!11209 lt!133015) #b00011111111111111111111111111111) (= (mask!11209 lt!133015) #b00111111111111111111111111111111)) (bvsle (mask!11209 lt!133015) #b00111111111111111111111111111111)))))

(assert (=> d!63381 d!63735))

(assert (=> b!263709 d!63477))

(declare-fun d!63737 () Bool)

(declare-fun e!171163 () Bool)

(assert (=> d!63737 e!171163))

(declare-fun res!128944 () Bool)

(assert (=> d!63737 (=> res!128944 e!171163)))

(declare-fun lt!133703 () Bool)

(assert (=> d!63737 (= res!128944 (not lt!133703))))

(declare-fun lt!133702 () Bool)

(assert (=> d!63737 (= lt!133703 lt!133702)))

(declare-fun lt!133704 () Unit!8190)

(declare-fun e!171164 () Unit!8190)

(assert (=> d!63737 (= lt!133704 e!171164)))

(declare-fun c!45167 () Bool)

(assert (=> d!63737 (= c!45167 lt!133702)))

(assert (=> d!63737 (= lt!133702 (containsKey!312 (toList!1961 lt!133481) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(assert (=> d!63737 (= (contains!1912 lt!133481 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133703)))

(declare-fun b!264174 () Bool)

(declare-fun lt!133705 () Unit!8190)

(assert (=> b!264174 (= e!171164 lt!133705)))

(assert (=> b!264174 (= lt!133705 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133481) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(assert (=> b!264174 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133481) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun b!264175 () Bool)

(declare-fun Unit!8235 () Unit!8190)

(assert (=> b!264175 (= e!171164 Unit!8235)))

(declare-fun b!264176 () Bool)

(assert (=> b!264176 (= e!171163 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133481) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63737 c!45167) b!264174))

(assert (= (and d!63737 (not c!45167)) b!264175))

(assert (= (and d!63737 (not res!128944)) b!264176))

(declare-fun m!280899 () Bool)

(assert (=> d!63737 m!280899))

(declare-fun m!280901 () Bool)

(assert (=> b!264174 m!280901))

(assert (=> b!264174 m!280005))

(assert (=> b!264174 m!280005))

(declare-fun m!280903 () Bool)

(assert (=> b!264174 m!280903))

(assert (=> b!264176 m!280005))

(assert (=> b!264176 m!280005))

(assert (=> b!264176 m!280903))

(assert (=> d!63353 d!63737))

(declare-fun e!171166 () Option!326)

(declare-fun b!264179 () Bool)

(assert (=> b!264179 (= e!171166 (getValueByKey!320 (t!8929 lt!133482) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun b!264177 () Bool)

(declare-fun e!171165 () Option!326)

(assert (=> b!264177 (= e!171165 (Some!325 (_2!2500 (h!4514 lt!133482))))))

(declare-fun c!45168 () Bool)

(declare-fun d!63739 () Bool)

(assert (=> d!63739 (= c!45168 (and ((_ is Cons!3848) lt!133482) (= (_1!2500 (h!4514 lt!133482)) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(assert (=> d!63739 (= (getValueByKey!320 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) e!171165)))

(declare-fun b!264180 () Bool)

(assert (=> b!264180 (= e!171166 None!324)))

(declare-fun b!264178 () Bool)

(assert (=> b!264178 (= e!171165 e!171166)))

(declare-fun c!45169 () Bool)

(assert (=> b!264178 (= c!45169 (and ((_ is Cons!3848) lt!133482) (not (= (_1!2500 (h!4514 lt!133482)) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63739 c!45168) b!264177))

(assert (= (and d!63739 (not c!45168)) b!264178))

(assert (= (and b!264178 c!45169) b!264179))

(assert (= (and b!264178 (not c!45169)) b!264180))

(declare-fun m!280905 () Bool)

(assert (=> b!264179 m!280905))

(assert (=> d!63353 d!63739))

(declare-fun d!63741 () Bool)

(assert (=> d!63741 (= (getValueByKey!320 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133706 () Unit!8190)

(assert (=> d!63741 (= lt!133706 (choose!1294 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun e!171167 () Bool)

(assert (=> d!63741 e!171167))

(declare-fun res!128945 () Bool)

(assert (=> d!63741 (=> (not res!128945) (not e!171167))))

(assert (=> d!63741 (= res!128945 (isStrictlySorted!377 lt!133482))))

(assert (=> d!63741 (= (lemmaContainsTupThenGetReturnValue!176 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133706)))

(declare-fun b!264181 () Bool)

(declare-fun res!128946 () Bool)

(assert (=> b!264181 (=> (not res!128946) (not e!171167))))

(assert (=> b!264181 (= res!128946 (containsKey!312 lt!133482 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun b!264182 () Bool)

(assert (=> b!264182 (= e!171167 (contains!1914 lt!133482 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63741 res!128945) b!264181))

(assert (= (and b!264181 res!128946) b!264182))

(assert (=> d!63741 m!279999))

(declare-fun m!280907 () Bool)

(assert (=> d!63741 m!280907))

(declare-fun m!280909 () Bool)

(assert (=> d!63741 m!280909))

(declare-fun m!280911 () Bool)

(assert (=> b!264181 m!280911))

(declare-fun m!280913 () Bool)

(assert (=> b!264182 m!280913))

(assert (=> d!63353 d!63741))

(declare-fun bm!25283 () Bool)

(declare-fun call!25288 () List!3852)

(declare-fun call!25287 () List!3852)

(assert (=> bm!25283 (= call!25288 call!25287)))

(declare-fun bm!25284 () Bool)

(declare-fun call!25286 () List!3852)

(assert (=> bm!25284 (= call!25286 call!25288)))

(declare-fun b!264183 () Bool)

(declare-fun res!128947 () Bool)

(declare-fun e!171172 () Bool)

(assert (=> b!264183 (=> (not res!128947) (not e!171172))))

(declare-fun lt!133707 () List!3852)

(assert (=> b!264183 (= res!128947 (containsKey!312 lt!133707 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun c!45170 () Bool)

(declare-fun b!264184 () Bool)

(assert (=> b!264184 (= c!45170 (and ((_ is Cons!3848) (toList!1961 lt!133258)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133258))) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(declare-fun e!171171 () List!3852)

(declare-fun e!171168 () List!3852)

(assert (=> b!264184 (= e!171171 e!171168)))

(declare-fun b!264185 () Bool)

(declare-fun e!171170 () List!3852)

(assert (=> b!264185 (= e!171170 e!171171)))

(declare-fun c!45173 () Bool)

(assert (=> b!264185 (= c!45173 (and ((_ is Cons!3848) (toList!1961 lt!133258)) (= (_1!2500 (h!4514 (toList!1961 lt!133258))) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(declare-fun b!264186 () Bool)

(assert (=> b!264186 (= e!171172 (contains!1914 lt!133707 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(declare-fun b!264187 () Bool)

(assert (=> b!264187 (= e!171170 call!25287)))

(declare-fun b!264188 () Bool)

(assert (=> b!264188 (= e!171171 call!25288)))

(declare-fun e!171169 () List!3852)

(declare-fun b!264189 () Bool)

(assert (=> b!264189 (= e!171169 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133258)) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun b!264190 () Bool)

(assert (=> b!264190 (= e!171168 call!25286)))

(declare-fun bm!25285 () Bool)

(declare-fun c!45172 () Bool)

(assert (=> bm!25285 (= call!25287 ($colon$colon!108 e!171169 (ite c!45172 (h!4514 (toList!1961 lt!133258)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))))

(declare-fun c!45171 () Bool)

(assert (=> bm!25285 (= c!45171 c!45172)))

(declare-fun d!63743 () Bool)

(assert (=> d!63743 e!171172))

(declare-fun res!128948 () Bool)

(assert (=> d!63743 (=> (not res!128948) (not e!171172))))

(assert (=> d!63743 (= res!128948 (isStrictlySorted!377 lt!133707))))

(assert (=> d!63743 (= lt!133707 e!171170)))

(assert (=> d!63743 (= c!45172 (and ((_ is Cons!3848) (toList!1961 lt!133258)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133258))) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(assert (=> d!63743 (isStrictlySorted!377 (toList!1961 lt!133258))))

(assert (=> d!63743 (= (insertStrictlySorted!179 (toList!1961 lt!133258) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) lt!133707)))

(declare-fun b!264191 () Bool)

(assert (=> b!264191 (= e!171168 call!25286)))

(declare-fun b!264192 () Bool)

(assert (=> b!264192 (= e!171169 (ite c!45173 (t!8929 (toList!1961 lt!133258)) (ite c!45170 (Cons!3848 (h!4514 (toList!1961 lt!133258)) (t!8929 (toList!1961 lt!133258))) Nil!3849)))))

(assert (= (and d!63743 c!45172) b!264187))

(assert (= (and d!63743 (not c!45172)) b!264185))

(assert (= (and b!264185 c!45173) b!264188))

(assert (= (and b!264185 (not c!45173)) b!264184))

(assert (= (and b!264184 c!45170) b!264191))

(assert (= (and b!264184 (not c!45170)) b!264190))

(assert (= (or b!264191 b!264190) bm!25284))

(assert (= (or b!264188 bm!25284) bm!25283))

(assert (= (or b!264187 bm!25283) bm!25285))

(assert (= (and bm!25285 c!45171) b!264189))

(assert (= (and bm!25285 (not c!45171)) b!264192))

(assert (= (and d!63743 res!128948) b!264183))

(assert (= (and b!264183 res!128947) b!264186))

(declare-fun m!280915 () Bool)

(assert (=> bm!25285 m!280915))

(declare-fun m!280917 () Bool)

(assert (=> b!264189 m!280917))

(declare-fun m!280919 () Bool)

(assert (=> b!264186 m!280919))

(declare-fun m!280921 () Bool)

(assert (=> b!264183 m!280921))

(declare-fun m!280923 () Bool)

(assert (=> d!63743 m!280923))

(declare-fun m!280925 () Bool)

(assert (=> d!63743 m!280925))

(assert (=> d!63353 d!63743))

(assert (=> b!263600 d!63195))

(assert (=> b!263427 d!63663))

(declare-fun b!264195 () Bool)

(declare-fun e!171174 () Option!326)

(assert (=> b!264195 (= e!171174 (getValueByKey!320 (t!8929 (toList!1961 lt!133481)) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))

(declare-fun b!264193 () Bool)

(declare-fun e!171173 () Option!326)

(assert (=> b!264193 (= e!171173 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133481)))))))

(declare-fun c!45174 () Bool)

(declare-fun d!63745 () Bool)

(assert (=> d!63745 (= c!45174 (and ((_ is Cons!3848) (toList!1961 lt!133481)) (= (_1!2500 (h!4514 (toList!1961 lt!133481))) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))))

(assert (=> d!63745 (= (getValueByKey!320 (toList!1961 lt!133481) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))) e!171173)))

(declare-fun b!264196 () Bool)

(assert (=> b!264196 (= e!171174 None!324)))

(declare-fun b!264194 () Bool)

(assert (=> b!264194 (= e!171173 e!171174)))

(declare-fun c!45175 () Bool)

(assert (=> b!264194 (= c!45175 (and ((_ is Cons!3848) (toList!1961 lt!133481)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133481))) (_1!2500 (tuple2!4979 lt!133257 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63745 c!45174) b!264193))

(assert (= (and d!63745 (not c!45174)) b!264194))

(assert (= (and b!264194 c!45175) b!264195))

(assert (= (and b!264194 (not c!45175)) b!264196))

(declare-fun m!280927 () Bool)

(assert (=> b!264195 m!280927))

(assert (=> b!263656 d!63745))

(assert (=> d!63319 d!63235))

(assert (=> d!63319 d!63099))

(assert (=> d!63319 d!63237))

(declare-fun d!63747 () Bool)

(declare-fun lt!133708 () Bool)

(assert (=> d!63747 (= lt!133708 (select (content!177 (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!171175 () Bool)

(assert (=> d!63747 (= lt!133708 e!171175)))

(declare-fun res!128950 () Bool)

(assert (=> d!63747 (=> (not res!128950) (not e!171175))))

(assert (=> d!63747 (= res!128950 ((_ is Cons!3849) (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)))))

(assert (=> d!63747 (= (contains!1915 (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!133708)))

(declare-fun b!264197 () Bool)

(declare-fun e!171176 () Bool)

(assert (=> b!264197 (= e!171175 e!171176)))

(declare-fun res!128949 () Bool)

(assert (=> b!264197 (=> res!128949 e!171176)))

(assert (=> b!264197 (= res!128949 (= (h!4515 (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264198 () Bool)

(assert (=> b!264198 (= e!171176 (contains!1915 (t!8930 (ite c!44885 (Cons!3849 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) Nil!3850) Nil!3850)) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!63747 res!128950) b!264197))

(assert (= (and b!264197 (not res!128949)) b!264198))

(declare-fun m!280929 () Bool)

(assert (=> d!63747 m!280929))

(assert (=> d!63747 m!279457))

(declare-fun m!280931 () Bool)

(assert (=> d!63747 m!280931))

(assert (=> b!264198 m!279457))

(declare-fun m!280933 () Bool)

(assert (=> b!264198 m!280933))

(assert (=> b!263354 d!63747))

(declare-fun b!264201 () Bool)

(declare-fun e!171178 () Option!326)

(assert (=> b!264201 (= e!171178 (getValueByKey!320 (t!8929 (t!8929 lt!133128)) (_1!2500 lt!133020)))))

(declare-fun b!264199 () Bool)

(declare-fun e!171177 () Option!326)

(assert (=> b!264199 (= e!171177 (Some!325 (_2!2500 (h!4514 (t!8929 lt!133128)))))))

(declare-fun d!63749 () Bool)

(declare-fun c!45176 () Bool)

(assert (=> d!63749 (= c!45176 (and ((_ is Cons!3848) (t!8929 lt!133128)) (= (_1!2500 (h!4514 (t!8929 lt!133128))) (_1!2500 lt!133020))))))

(assert (=> d!63749 (= (getValueByKey!320 (t!8929 lt!133128) (_1!2500 lt!133020)) e!171177)))

(declare-fun b!264202 () Bool)

(assert (=> b!264202 (= e!171178 None!324)))

(declare-fun b!264200 () Bool)

(assert (=> b!264200 (= e!171177 e!171178)))

(declare-fun c!45177 () Bool)

(assert (=> b!264200 (= c!45177 (and ((_ is Cons!3848) (t!8929 lt!133128)) (not (= (_1!2500 (h!4514 (t!8929 lt!133128))) (_1!2500 lt!133020)))))))

(assert (= (and d!63749 c!45176) b!264199))

(assert (= (and d!63749 (not c!45176)) b!264200))

(assert (= (and b!264200 c!45177) b!264201))

(assert (= (and b!264200 (not c!45177)) b!264202))

(declare-fun m!280935 () Bool)

(assert (=> b!264201 m!280935))

(assert (=> b!263663 d!63749))

(declare-fun lt!133709 () Bool)

(declare-fun d!63751 () Bool)

(assert (=> d!63751 (= lt!133709 (select (content!176 (toList!1961 lt!133457)) (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))

(declare-fun e!171180 () Bool)

(assert (=> d!63751 (= lt!133709 e!171180)))

(declare-fun res!128952 () Bool)

(assert (=> d!63751 (=> (not res!128952) (not e!171180))))

(assert (=> d!63751 (= res!128952 ((_ is Cons!3848) (toList!1961 lt!133457)))))

(assert (=> d!63751 (= (contains!1914 (toList!1961 lt!133457) (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) lt!133709)))

(declare-fun b!264203 () Bool)

(declare-fun e!171179 () Bool)

(assert (=> b!264203 (= e!171180 e!171179)))

(declare-fun res!128951 () Bool)

(assert (=> b!264203 (=> res!128951 e!171179)))

(assert (=> b!264203 (= res!128951 (= (h!4514 (toList!1961 lt!133457)) (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))

(declare-fun b!264204 () Bool)

(assert (=> b!264204 (= e!171179 (contains!1914 (t!8929 (toList!1961 lt!133457)) (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63751 res!128952) b!264203))

(assert (= (and b!264203 (not res!128951)) b!264204))

(declare-fun m!280937 () Bool)

(assert (=> d!63751 m!280937))

(declare-fun m!280939 () Bool)

(assert (=> d!63751 m!280939))

(declare-fun m!280941 () Bool)

(assert (=> b!264204 m!280941))

(assert (=> b!263635 d!63751))

(declare-fun d!63753 () Bool)

(declare-fun lt!133710 () Bool)

(assert (=> d!63753 (= lt!133710 (select (content!176 lt!133489) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun e!171182 () Bool)

(assert (=> d!63753 (= lt!133710 e!171182)))

(declare-fun res!128954 () Bool)

(assert (=> d!63753 (=> (not res!128954) (not e!171182))))

(assert (=> d!63753 (= res!128954 ((_ is Cons!3848) lt!133489))))

(assert (=> d!63753 (= (contains!1914 lt!133489 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))) lt!133710)))

(declare-fun b!264205 () Bool)

(declare-fun e!171181 () Bool)

(assert (=> b!264205 (= e!171182 e!171181)))

(declare-fun res!128953 () Bool)

(assert (=> b!264205 (=> res!128953 e!171181)))

(assert (=> b!264205 (= res!128953 (= (h!4514 lt!133489) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!264206 () Bool)

(assert (=> b!264206 (= e!171181 (contains!1914 (t!8929 lt!133489) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(assert (= (and d!63753 res!128954) b!264205))

(assert (= (and b!264205 (not res!128953)) b!264206))

(declare-fun m!280943 () Bool)

(assert (=> d!63753 m!280943))

(declare-fun m!280945 () Bool)

(assert (=> d!63753 m!280945))

(declare-fun m!280947 () Bool)

(assert (=> b!264206 m!280947))

(assert (=> b!263670 d!63753))

(declare-fun d!63755 () Bool)

(declare-fun e!171183 () Bool)

(assert (=> d!63755 e!171183))

(declare-fun res!128955 () Bool)

(assert (=> d!63755 (=> res!128955 e!171183)))

(declare-fun lt!133712 () Bool)

(assert (=> d!63755 (= res!128955 (not lt!133712))))

(declare-fun lt!133711 () Bool)

(assert (=> d!63755 (= lt!133712 lt!133711)))

(declare-fun lt!133713 () Unit!8190)

(declare-fun e!171184 () Unit!8190)

(assert (=> d!63755 (= lt!133713 e!171184)))

(declare-fun c!45178 () Bool)

(assert (=> d!63755 (= c!45178 lt!133711)))

(assert (=> d!63755 (= lt!133711 (containsKey!312 (toList!1961 lt!133439) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(assert (=> d!63755 (= (contains!1912 lt!133439 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133712)))

(declare-fun b!264207 () Bool)

(declare-fun lt!133714 () Unit!8190)

(assert (=> b!264207 (= e!171184 lt!133714)))

(assert (=> b!264207 (= lt!133714 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133439) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(assert (=> b!264207 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133439) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun b!264208 () Bool)

(declare-fun Unit!8236 () Unit!8190)

(assert (=> b!264208 (= e!171184 Unit!8236)))

(declare-fun b!264209 () Bool)

(assert (=> b!264209 (= e!171183 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133439) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63755 c!45178) b!264207))

(assert (= (and d!63755 (not c!45178)) b!264208))

(assert (= (and d!63755 (not res!128955)) b!264209))

(declare-fun m!280949 () Bool)

(assert (=> d!63755 m!280949))

(declare-fun m!280951 () Bool)

(assert (=> b!264207 m!280951))

(assert (=> b!264207 m!279855))

(assert (=> b!264207 m!279855))

(declare-fun m!280953 () Bool)

(assert (=> b!264207 m!280953))

(assert (=> b!264209 m!279855))

(assert (=> b!264209 m!279855))

(assert (=> b!264209 m!280953))

(assert (=> d!63305 d!63755))

(declare-fun b!264212 () Bool)

(declare-fun e!171186 () Option!326)

(assert (=> b!264212 (= e!171186 (getValueByKey!320 (t!8929 lt!133440) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun b!264210 () Bool)

(declare-fun e!171185 () Option!326)

(assert (=> b!264210 (= e!171185 (Some!325 (_2!2500 (h!4514 lt!133440))))))

(declare-fun d!63757 () Bool)

(declare-fun c!45179 () Bool)

(assert (=> d!63757 (= c!45179 (and ((_ is Cons!3848) lt!133440) (= (_1!2500 (h!4514 lt!133440)) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(assert (=> d!63757 (= (getValueByKey!320 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) e!171185)))

(declare-fun b!264213 () Bool)

(assert (=> b!264213 (= e!171186 None!324)))

(declare-fun b!264211 () Bool)

(assert (=> b!264211 (= e!171185 e!171186)))

(declare-fun c!45180 () Bool)

(assert (=> b!264211 (= c!45180 (and ((_ is Cons!3848) lt!133440) (not (= (_1!2500 (h!4514 lt!133440)) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63757 c!45179) b!264210))

(assert (= (and d!63757 (not c!45179)) b!264211))

(assert (= (and b!264211 c!45180) b!264212))

(assert (= (and b!264211 (not c!45180)) b!264213))

(declare-fun m!280955 () Bool)

(assert (=> b!264212 m!280955))

(assert (=> d!63305 d!63757))

(declare-fun d!63759 () Bool)

(assert (=> d!63759 (= (getValueByKey!320 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133715 () Unit!8190)

(assert (=> d!63759 (= lt!133715 (choose!1294 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun e!171187 () Bool)

(assert (=> d!63759 e!171187))

(declare-fun res!128956 () Bool)

(assert (=> d!63759 (=> (not res!128956) (not e!171187))))

(assert (=> d!63759 (= res!128956 (isStrictlySorted!377 lt!133440))))

(assert (=> d!63759 (= (lemmaContainsTupThenGetReturnValue!176 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133715)))

(declare-fun b!264214 () Bool)

(declare-fun res!128957 () Bool)

(assert (=> b!264214 (=> (not res!128957) (not e!171187))))

(assert (=> b!264214 (= res!128957 (containsKey!312 lt!133440 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun b!264215 () Bool)

(assert (=> b!264215 (= e!171187 (contains!1914 lt!133440 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(assert (= (and d!63759 res!128956) b!264214))

(assert (= (and b!264214 res!128957) b!264215))

(assert (=> d!63759 m!279849))

(declare-fun m!280957 () Bool)

(assert (=> d!63759 m!280957))

(declare-fun m!280959 () Bool)

(assert (=> d!63759 m!280959))

(declare-fun m!280961 () Bool)

(assert (=> b!264214 m!280961))

(declare-fun m!280963 () Bool)

(assert (=> b!264215 m!280963))

(assert (=> d!63305 d!63759))

(declare-fun bm!25286 () Bool)

(declare-fun call!25291 () List!3852)

(declare-fun call!25290 () List!3852)

(assert (=> bm!25286 (= call!25291 call!25290)))

(declare-fun bm!25287 () Bool)

(declare-fun call!25289 () List!3852)

(assert (=> bm!25287 (= call!25289 call!25291)))

(declare-fun b!264216 () Bool)

(declare-fun res!128958 () Bool)

(declare-fun e!171192 () Bool)

(assert (=> b!264216 (=> (not res!128958) (not e!171192))))

(declare-fun lt!133716 () List!3852)

(assert (=> b!264216 (= res!128958 (containsKey!312 lt!133716 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun c!45181 () Bool)

(declare-fun b!264217 () Bool)

(assert (=> b!264217 (= c!45181 (and ((_ is Cons!3848) (toList!1961 lt!133203)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133203))) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(declare-fun e!171191 () List!3852)

(declare-fun e!171188 () List!3852)

(assert (=> b!264217 (= e!171191 e!171188)))

(declare-fun b!264218 () Bool)

(declare-fun e!171190 () List!3852)

(assert (=> b!264218 (= e!171190 e!171191)))

(declare-fun c!45184 () Bool)

(assert (=> b!264218 (= c!45184 (and ((_ is Cons!3848) (toList!1961 lt!133203)) (= (_1!2500 (h!4514 (toList!1961 lt!133203))) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(declare-fun b!264219 () Bool)

(assert (=> b!264219 (= e!171192 (contains!1914 lt!133716 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(declare-fun b!264220 () Bool)

(assert (=> b!264220 (= e!171190 call!25290)))

(declare-fun b!264221 () Bool)

(assert (=> b!264221 (= e!171191 call!25291)))

(declare-fun b!264222 () Bool)

(declare-fun e!171189 () List!3852)

(assert (=> b!264222 (= e!171189 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133203)) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun b!264223 () Bool)

(assert (=> b!264223 (= e!171188 call!25289)))

(declare-fun c!45183 () Bool)

(declare-fun bm!25288 () Bool)

(assert (=> bm!25288 (= call!25290 ($colon$colon!108 e!171189 (ite c!45183 (h!4514 (toList!1961 lt!133203)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))))

(declare-fun c!45182 () Bool)

(assert (=> bm!25288 (= c!45182 c!45183)))

(declare-fun d!63761 () Bool)

(assert (=> d!63761 e!171192))

(declare-fun res!128959 () Bool)

(assert (=> d!63761 (=> (not res!128959) (not e!171192))))

(assert (=> d!63761 (= res!128959 (isStrictlySorted!377 lt!133716))))

(assert (=> d!63761 (= lt!133716 e!171190)))

(assert (=> d!63761 (= c!45183 (and ((_ is Cons!3848) (toList!1961 lt!133203)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133203))) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(assert (=> d!63761 (isStrictlySorted!377 (toList!1961 lt!133203))))

(assert (=> d!63761 (= (insertStrictlySorted!179 (toList!1961 lt!133203) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133716)))

(declare-fun b!264224 () Bool)

(assert (=> b!264224 (= e!171188 call!25289)))

(declare-fun b!264225 () Bool)

(assert (=> b!264225 (= e!171189 (ite c!45184 (t!8929 (toList!1961 lt!133203)) (ite c!45181 (Cons!3848 (h!4514 (toList!1961 lt!133203)) (t!8929 (toList!1961 lt!133203))) Nil!3849)))))

(assert (= (and d!63761 c!45183) b!264220))

(assert (= (and d!63761 (not c!45183)) b!264218))

(assert (= (and b!264218 c!45184) b!264221))

(assert (= (and b!264218 (not c!45184)) b!264217))

(assert (= (and b!264217 c!45181) b!264224))

(assert (= (and b!264217 (not c!45181)) b!264223))

(assert (= (or b!264224 b!264223) bm!25287))

(assert (= (or b!264221 bm!25287) bm!25286))

(assert (= (or b!264220 bm!25286) bm!25288))

(assert (= (and bm!25288 c!45182) b!264222))

(assert (= (and bm!25288 (not c!45182)) b!264225))

(assert (= (and d!63761 res!128959) b!264216))

(assert (= (and b!264216 res!128958) b!264219))

(declare-fun m!280965 () Bool)

(assert (=> bm!25288 m!280965))

(declare-fun m!280967 () Bool)

(assert (=> b!264222 m!280967))

(declare-fun m!280969 () Bool)

(assert (=> b!264219 m!280969))

(declare-fun m!280971 () Bool)

(assert (=> b!264216 m!280971))

(declare-fun m!280973 () Bool)

(assert (=> d!63761 m!280973))

(declare-fun m!280975 () Bool)

(assert (=> d!63761 m!280975))

(assert (=> d!63305 d!63761))

(assert (=> d!63251 d!63249))

(declare-fun d!63763 () Bool)

(assert (=> d!63763 (= (getValueByKey!320 lt!133266 (_1!2500 lt!133020)) (Some!325 (_2!2500 lt!133020)))))

(assert (=> d!63763 true))

(declare-fun _$22!544 () Unit!8190)

(assert (=> d!63763 (= (choose!1294 lt!133266 (_1!2500 lt!133020) (_2!2500 lt!133020)) _$22!544)))

(declare-fun bs!9308 () Bool)

(assert (= bs!9308 d!63763))

(assert (=> bs!9308 m!279383))

(assert (=> d!63251 d!63763))

(declare-fun d!63765 () Bool)

(declare-fun res!128960 () Bool)

(declare-fun e!171193 () Bool)

(assert (=> d!63765 (=> res!128960 e!171193)))

(assert (=> d!63765 (= res!128960 (or ((_ is Nil!3849) lt!133266) ((_ is Nil!3849) (t!8929 lt!133266))))))

(assert (=> d!63765 (= (isStrictlySorted!377 lt!133266) e!171193)))

(declare-fun b!264226 () Bool)

(declare-fun e!171194 () Bool)

(assert (=> b!264226 (= e!171193 e!171194)))

(declare-fun res!128961 () Bool)

(assert (=> b!264226 (=> (not res!128961) (not e!171194))))

(assert (=> b!264226 (= res!128961 (bvslt (_1!2500 (h!4514 lt!133266)) (_1!2500 (h!4514 (t!8929 lt!133266)))))))

(declare-fun b!264227 () Bool)

(assert (=> b!264227 (= e!171194 (isStrictlySorted!377 (t!8929 lt!133266)))))

(assert (= (and d!63765 (not res!128960)) b!264226))

(assert (= (and b!264226 res!128961) b!264227))

(declare-fun m!280977 () Bool)

(assert (=> b!264227 m!280977))

(assert (=> d!63251 d!63765))

(declare-fun d!63767 () Bool)

(assert (=> d!63767 (arrayContainsKey!0 lt!133026 lt!133288 #b00000000000000000000000000000000)))

(declare-fun lt!133717 () Unit!8190)

(assert (=> d!63767 (= lt!133717 (choose!13 lt!133026 lt!133288 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!63767 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!63767 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 lt!133288 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133717)))

(declare-fun bs!9309 () Bool)

(assert (= bs!9309 d!63767))

(assert (=> bs!9309 m!279461))

(declare-fun m!280979 () Bool)

(assert (=> bs!9309 m!280979))

(assert (=> b!263294 d!63767))

(declare-fun d!63769 () Bool)

(declare-fun res!128962 () Bool)

(declare-fun e!171195 () Bool)

(assert (=> d!63769 (=> res!128962 e!171195)))

(assert (=> d!63769 (= res!128962 (= (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133288))))

(assert (=> d!63769 (= (arrayContainsKey!0 lt!133026 lt!133288 #b00000000000000000000000000000000) e!171195)))

(declare-fun b!264228 () Bool)

(declare-fun e!171196 () Bool)

(assert (=> b!264228 (= e!171195 e!171196)))

(declare-fun res!128963 () Bool)

(assert (=> b!264228 (=> (not res!128963) (not e!171196))))

(assert (=> b!264228 (= res!128963 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(declare-fun b!264229 () Bool)

(assert (=> b!264229 (= e!171196 (arrayContainsKey!0 lt!133026 lt!133288 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63769 (not res!128962)) b!264228))

(assert (= (and b!264228 res!128963) b!264229))

(assert (=> d!63769 m!279255))

(declare-fun m!280981 () Bool)

(assert (=> b!264229 m!280981))

(assert (=> b!263294 d!63769))

(declare-fun b!264230 () Bool)

(declare-fun e!171199 () SeekEntryResult!1200)

(declare-fun lt!133719 () SeekEntryResult!1200)

(assert (=> b!264230 (= e!171199 (MissingZero!1200 (index!6972 lt!133719)))))

(declare-fun b!264231 () Bool)

(declare-fun e!171198 () SeekEntryResult!1200)

(declare-fun e!171197 () SeekEntryResult!1200)

(assert (=> b!264231 (= e!171198 e!171197)))

(declare-fun lt!133720 () (_ BitVec 64))

(assert (=> b!264231 (= lt!133720 (select (arr!5999 lt!133026) (index!6972 lt!133719)))))

(declare-fun c!45187 () Bool)

(assert (=> b!264231 (= c!45187 (= lt!133720 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264232 () Bool)

(declare-fun c!45185 () Bool)

(assert (=> b!264232 (= c!45185 (= lt!133720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264232 (= e!171197 e!171199)))

(declare-fun b!264233 () Bool)

(assert (=> b!264233 (= e!171197 (Found!1200 (index!6972 lt!133719)))))

(declare-fun b!264234 () Bool)

(assert (=> b!264234 (= e!171199 (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133719) (index!6972 lt!133719) (index!6972 lt!133719) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun d!63771 () Bool)

(declare-fun lt!133718 () SeekEntryResult!1200)

(assert (=> d!63771 (and (or ((_ is Undefined!1200) lt!133718) (not ((_ is Found!1200) lt!133718)) (and (bvsge (index!6971 lt!133718) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133718) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133718) ((_ is Found!1200) lt!133718) (not ((_ is MissingZero!1200) lt!133718)) (and (bvsge (index!6970 lt!133718) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133718) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133718) ((_ is Found!1200) lt!133718) ((_ is MissingZero!1200) lt!133718) (not ((_ is MissingVacant!1200) lt!133718)) (and (bvsge (index!6973 lt!133718) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133718) (size!6350 lt!133026)))) (or ((_ is Undefined!1200) lt!133718) (ite ((_ is Found!1200) lt!133718) (= (select (arr!5999 lt!133026) (index!6971 lt!133718)) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!1200) lt!133718) (= (select (arr!5999 lt!133026) (index!6970 lt!133718)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1200) lt!133718) (= (select (arr!5999 lt!133026) (index!6973 lt!133718)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63771 (= lt!133718 e!171198)))

(declare-fun c!45186 () Bool)

(assert (=> d!63771 (= c!45186 (and ((_ is Intermediate!1200) lt!133719) (undefined!2012 lt!133719)))))

(assert (=> d!63771 (= lt!133719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (mask!11209 thiss!1504)) (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133026 (mask!11209 thiss!1504)))))

(assert (=> d!63771 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63771 (= (seekEntryOrOpen!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133026 (mask!11209 thiss!1504)) lt!133718)))

(declare-fun b!264235 () Bool)

(assert (=> b!264235 (= e!171198 Undefined!1200)))

(assert (= (and d!63771 c!45186) b!264235))

(assert (= (and d!63771 (not c!45186)) b!264231))

(assert (= (and b!264231 c!45187) b!264233))

(assert (= (and b!264231 (not c!45187)) b!264232))

(assert (= (and b!264232 c!45185) b!264230))

(assert (= (and b!264232 (not c!45185)) b!264234))

(declare-fun m!280983 () Bool)

(assert (=> b!264231 m!280983))

(assert (=> b!264234 m!279457))

(declare-fun m!280985 () Bool)

(assert (=> b!264234 m!280985))

(declare-fun m!280987 () Bool)

(assert (=> d!63771 m!280987))

(assert (=> d!63771 m!279139))

(declare-fun m!280989 () Bool)

(assert (=> d!63771 m!280989))

(assert (=> d!63771 m!279457))

(declare-fun m!280991 () Bool)

(assert (=> d!63771 m!280991))

(declare-fun m!280993 () Bool)

(assert (=> d!63771 m!280993))

(assert (=> d!63771 m!280991))

(assert (=> d!63771 m!279457))

(declare-fun m!280995 () Bool)

(assert (=> d!63771 m!280995))

(assert (=> b!263294 d!63771))

(assert (=> d!63259 d!63735))

(declare-fun e!171201 () Option!326)

(declare-fun b!264238 () Bool)

(assert (=> b!264238 (= e!171201 (getValueByKey!320 (t!8929 (toList!1961 lt!133439)) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))

(declare-fun b!264236 () Bool)

(declare-fun e!171200 () Option!326)

(assert (=> b!264236 (= e!171200 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133439)))))))

(declare-fun d!63773 () Bool)

(declare-fun c!45188 () Bool)

(assert (=> d!63773 (= c!45188 (and ((_ is Cons!3848) (toList!1961 lt!133439)) (= (_1!2500 (h!4514 (toList!1961 lt!133439))) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))

(assert (=> d!63773 (= (getValueByKey!320 (toList!1961 lt!133439) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) e!171200)))

(declare-fun b!264239 () Bool)

(assert (=> b!264239 (= e!171201 None!324)))

(declare-fun b!264237 () Bool)

(assert (=> b!264237 (= e!171200 e!171201)))

(declare-fun c!45189 () Bool)

(assert (=> b!264237 (= c!45189 (and ((_ is Cons!3848) (toList!1961 lt!133439)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133439))) (_1!2500 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63773 c!45188) b!264236))

(assert (= (and d!63773 (not c!45188)) b!264237))

(assert (= (and b!264237 c!45189) b!264238))

(assert (= (and b!264237 (not c!45189)) b!264239))

(declare-fun m!280997 () Bool)

(assert (=> b!264238 m!280997))

(assert (=> b!263614 d!63773))

(declare-fun d!63775 () Bool)

(assert (=> d!63775 (= (isEmpty!541 lt!133460) (isEmpty!542 (toList!1961 lt!133460)))))

(declare-fun bs!9310 () Bool)

(assert (= bs!9310 d!63775))

(declare-fun m!280999 () Bool)

(assert (=> bs!9310 m!280999))

(assert (=> b!263641 d!63775))

(declare-fun d!63777 () Bool)

(assert (=> d!63777 (= (apply!262 lt!133386 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) (get!3094 (getValueByKey!320 (toList!1961 lt!133386) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))))

(declare-fun bs!9311 () Bool)

(assert (= bs!9311 d!63777))

(assert (=> bs!9311 m!279647))

(declare-fun m!281001 () Bool)

(assert (=> bs!9311 m!281001))

(assert (=> bs!9311 m!281001))

(declare-fun m!281003 () Bool)

(assert (=> bs!9311 m!281003))

(assert (=> b!263471 d!63777))

(declare-fun c!45190 () Bool)

(declare-fun d!63779 () Bool)

(assert (=> d!63779 (= c!45190 ((_ is ValueCellFull!2985) (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!171202 () V!8523)

(assert (=> d!63779 (= (get!3093 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!171202)))

(declare-fun b!264240 () Bool)

(assert (=> b!264240 (= e!171202 (get!3095 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264241 () Bool)

(assert (=> b!264241 (= e!171202 (get!3096 (select (arr!5998 (array!12676 (store (arr!5998 (_values!4826 thiss!1504)) index!297 (ValueCellFull!2985 v!346)) (size!6349 (_values!4826 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63779 c!45190) b!264240))

(assert (= (and d!63779 (not c!45190)) b!264241))

(assert (=> b!264240 m!279697))

(assert (=> b!264240 m!279251))

(declare-fun m!281005 () Bool)

(assert (=> b!264240 m!281005))

(assert (=> b!264241 m!279697))

(assert (=> b!264241 m!279251))

(declare-fun m!281007 () Bool)

(assert (=> b!264241 m!281007))

(assert (=> b!263471 d!63779))

(declare-fun d!63781 () Bool)

(declare-fun res!128964 () Bool)

(declare-fun e!171203 () Bool)

(assert (=> d!63781 (=> res!128964 e!171203)))

(assert (=> d!63781 (= res!128964 (= (select (arr!5999 (_keys!7035 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63781 (= (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!171203)))

(declare-fun b!264242 () Bool)

(declare-fun e!171204 () Bool)

(assert (=> b!264242 (= e!171203 e!171204)))

(declare-fun res!128965 () Bool)

(assert (=> b!264242 (=> (not res!128965) (not e!171204))))

(assert (=> b!264242 (= res!128965 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun b!264243 () Bool)

(assert (=> b!264243 (= e!171204 (arrayContainsKey!0 (_keys!7035 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63781 (not res!128964)) b!264242))

(assert (= (and b!264242 res!128965) b!264243))

(assert (=> d!63781 m!280825))

(declare-fun m!281009 () Bool)

(assert (=> b!264243 m!281009))

(assert (=> b!263444 d!63781))

(assert (=> d!63147 d!63149))

(declare-fun d!63783 () Bool)

(assert (=> d!63783 (arrayContainsKey!0 lt!133026 lt!133220 #b00000000000000000000000000000000)))

(assert (=> d!63783 true))

(declare-fun _$60!391 () Unit!8190)

(assert (=> d!63783 (= (choose!13 lt!133026 lt!133220 #b00000000000000000000000000000000) _$60!391)))

(declare-fun bs!9312 () Bool)

(assert (= bs!9312 d!63783))

(assert (=> bs!9312 m!279273))

(assert (=> d!63147 d!63783))

(declare-fun d!63785 () Bool)

(assert (=> d!63785 (= (content!177 Nil!3850) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!63163 d!63785))

(declare-fun d!63787 () Bool)

(assert (=> d!63787 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020)))))

(declare-fun lt!133721 () Unit!8190)

(assert (=> d!63787 (= lt!133721 (choose!1293 (toList!1961 lt!133127) (_1!2500 lt!133020)))))

(declare-fun e!171205 () Bool)

(assert (=> d!63787 e!171205))

(declare-fun res!128966 () Bool)

(assert (=> d!63787 (=> (not res!128966) (not e!171205))))

(assert (=> d!63787 (= res!128966 (isStrictlySorted!377 (toList!1961 lt!133127)))))

(assert (=> d!63787 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133127) (_1!2500 lt!133020)) lt!133721)))

(declare-fun b!264244 () Bool)

(assert (=> b!264244 (= e!171205 (containsKey!312 (toList!1961 lt!133127) (_1!2500 lt!133020)))))

(assert (= (and d!63787 res!128966) b!264244))

(assert (=> d!63787 m!279173))

(assert (=> d!63787 m!279173))

(assert (=> d!63787 m!280027))

(declare-fun m!281011 () Bool)

(assert (=> d!63787 m!281011))

(declare-fun m!281013 () Bool)

(assert (=> d!63787 m!281013))

(assert (=> b!264244 m!280023))

(assert (=> b!263658 d!63787))

(declare-fun d!63789 () Bool)

(assert (=> d!63789 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020))) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133127) (_1!2500 lt!133020)))))))

(declare-fun bs!9313 () Bool)

(assert (= bs!9313 d!63789))

(assert (=> bs!9313 m!279173))

(declare-fun m!281015 () Bool)

(assert (=> bs!9313 m!281015))

(assert (=> b!263658 d!63789))

(assert (=> b!263658 d!63245))

(declare-fun d!63791 () Bool)

(declare-fun lt!133722 () Bool)

(assert (=> d!63791 (= lt!133722 (select (content!177 Nil!3850) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!171206 () Bool)

(assert (=> d!63791 (= lt!133722 e!171206)))

(declare-fun res!128968 () Bool)

(assert (=> d!63791 (=> (not res!128968) (not e!171206))))

(assert (=> d!63791 (= res!128968 ((_ is Cons!3849) Nil!3850))))

(assert (=> d!63791 (= (contains!1915 Nil!3850 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) lt!133722)))

(declare-fun b!264245 () Bool)

(declare-fun e!171207 () Bool)

(assert (=> b!264245 (= e!171206 e!171207)))

(declare-fun res!128967 () Bool)

(assert (=> b!264245 (=> res!128967 e!171207)))

(assert (=> b!264245 (= res!128967 (= (h!4515 Nil!3850) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!264246 () Bool)

(assert (=> b!264246 (= e!171207 (contains!1915 (t!8930 Nil!3850) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63791 res!128968) b!264245))

(assert (= (and b!264245 (not res!128967)) b!264246))

(assert (=> d!63791 m!279469))

(assert (=> d!63791 m!279199))

(declare-fun m!281017 () Bool)

(assert (=> d!63791 m!281017))

(assert (=> b!264246 m!279199))

(declare-fun m!281019 () Bool)

(assert (=> b!264246 m!281019))

(assert (=> b!263599 d!63791))

(declare-fun d!63793 () Bool)

(declare-fun e!171208 () Bool)

(assert (=> d!63793 e!171208))

(declare-fun res!128969 () Bool)

(assert (=> d!63793 (=> res!128969 e!171208)))

(declare-fun lt!133724 () Bool)

(assert (=> d!63793 (= res!128969 (not lt!133724))))

(declare-fun lt!133723 () Bool)

(assert (=> d!63793 (= lt!133724 lt!133723)))

(declare-fun lt!133725 () Unit!8190)

(declare-fun e!171209 () Unit!8190)

(assert (=> d!63793 (= lt!133725 e!171209)))

(declare-fun c!45191 () Bool)

(assert (=> d!63793 (= c!45191 lt!133723)))

(assert (=> d!63793 (= lt!133723 (containsKey!312 (toList!1961 lt!133457) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63793 (= (contains!1912 lt!133457 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133724)))

(declare-fun b!264247 () Bool)

(declare-fun lt!133726 () Unit!8190)

(assert (=> b!264247 (= e!171209 lt!133726)))

(assert (=> b!264247 (= lt!133726 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133457) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(assert (=> b!264247 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133457) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264248 () Bool)

(declare-fun Unit!8237 () Unit!8190)

(assert (=> b!264248 (= e!171209 Unit!8237)))

(declare-fun b!264249 () Bool)

(assert (=> b!264249 (= e!171208 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133457) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63793 c!45191) b!264247))

(assert (= (and d!63793 (not c!45191)) b!264248))

(assert (= (and d!63793 (not res!128969)) b!264249))

(declare-fun m!281021 () Bool)

(assert (=> d!63793 m!281021))

(declare-fun m!281023 () Bool)

(assert (=> b!264247 m!281023))

(assert (=> b!264247 m!279921))

(assert (=> b!264247 m!279921))

(declare-fun m!281025 () Bool)

(assert (=> b!264247 m!281025))

(assert (=> b!264249 m!279921))

(assert (=> b!264249 m!279921))

(assert (=> b!264249 m!281025))

(assert (=> d!63333 d!63793))

(declare-fun b!264252 () Bool)

(declare-fun e!171211 () Option!326)

(assert (=> b!264252 (= e!171211 (getValueByKey!320 (t!8929 lt!133458) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264250 () Bool)

(declare-fun e!171210 () Option!326)

(assert (=> b!264250 (= e!171210 (Some!325 (_2!2500 (h!4514 lt!133458))))))

(declare-fun c!45192 () Bool)

(declare-fun d!63795 () Bool)

(assert (=> d!63795 (= c!45192 (and ((_ is Cons!3848) lt!133458) (= (_1!2500 (h!4514 lt!133458)) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63795 (= (getValueByKey!320 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) e!171210)))

(declare-fun b!264253 () Bool)

(assert (=> b!264253 (= e!171211 None!324)))

(declare-fun b!264251 () Bool)

(assert (=> b!264251 (= e!171210 e!171211)))

(declare-fun c!45193 () Bool)

(assert (=> b!264251 (= c!45193 (and ((_ is Cons!3848) lt!133458) (not (= (_1!2500 (h!4514 lt!133458)) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63795 c!45192) b!264250))

(assert (= (and d!63795 (not c!45192)) b!264251))

(assert (= (and b!264251 c!45193) b!264252))

(assert (= (and b!264251 (not c!45193)) b!264253))

(declare-fun m!281027 () Bool)

(assert (=> b!264252 m!281027))

(assert (=> d!63333 d!63795))

(declare-fun d!63797 () Bool)

(assert (=> d!63797 (= (getValueByKey!320 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133727 () Unit!8190)

(assert (=> d!63797 (= lt!133727 (choose!1294 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun e!171212 () Bool)

(assert (=> d!63797 e!171212))

(declare-fun res!128970 () Bool)

(assert (=> d!63797 (=> (not res!128970) (not e!171212))))

(assert (=> d!63797 (= res!128970 (isStrictlySorted!377 lt!133458))))

(assert (=> d!63797 (= (lemmaContainsTupThenGetReturnValue!176 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133727)))

(declare-fun b!264254 () Bool)

(declare-fun res!128971 () Bool)

(assert (=> b!264254 (=> (not res!128971) (not e!171212))))

(assert (=> b!264254 (= res!128971 (containsKey!312 lt!133458 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264255 () Bool)

(assert (=> b!264255 (= e!171212 (contains!1914 lt!133458 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63797 res!128970) b!264254))

(assert (= (and b!264254 res!128971) b!264255))

(assert (=> d!63797 m!279915))

(declare-fun m!281029 () Bool)

(assert (=> d!63797 m!281029))

(declare-fun m!281031 () Bool)

(assert (=> d!63797 m!281031))

(declare-fun m!281033 () Bool)

(assert (=> b!264254 m!281033))

(declare-fun m!281035 () Bool)

(assert (=> b!264255 m!281035))

(assert (=> d!63333 d!63797))

(declare-fun bm!25289 () Bool)

(declare-fun call!25294 () List!3852)

(declare-fun call!25293 () List!3852)

(assert (=> bm!25289 (= call!25294 call!25293)))

(declare-fun bm!25290 () Bool)

(declare-fun call!25292 () List!3852)

(assert (=> bm!25290 (= call!25292 call!25294)))

(declare-fun b!264256 () Bool)

(declare-fun res!128972 () Bool)

(declare-fun e!171217 () Bool)

(assert (=> b!264256 (=> (not res!128972) (not e!171217))))

(declare-fun lt!133728 () List!3852)

(assert (=> b!264256 (= res!128972 (containsKey!312 lt!133728 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun c!45194 () Bool)

(declare-fun b!264257 () Bool)

(assert (=> b!264257 (= c!45194 (and ((_ is Cons!3848) (toList!1961 lt!133262)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133262))) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(declare-fun e!171216 () List!3852)

(declare-fun e!171213 () List!3852)

(assert (=> b!264257 (= e!171216 e!171213)))

(declare-fun b!264258 () Bool)

(declare-fun e!171215 () List!3852)

(assert (=> b!264258 (= e!171215 e!171216)))

(declare-fun c!45197 () Bool)

(assert (=> b!264258 (= c!45197 (and ((_ is Cons!3848) (toList!1961 lt!133262)) (= (_1!2500 (h!4514 (toList!1961 lt!133262))) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!264259 () Bool)

(assert (=> b!264259 (= e!171217 (contains!1914 lt!133728 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!264260 () Bool)

(assert (=> b!264260 (= e!171215 call!25293)))

(declare-fun b!264261 () Bool)

(assert (=> b!264261 (= e!171216 call!25294)))

(declare-fun b!264262 () Bool)

(declare-fun e!171214 () List!3852)

(assert (=> b!264262 (= e!171214 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133262)) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264263 () Bool)

(assert (=> b!264263 (= e!171213 call!25292)))

(declare-fun bm!25291 () Bool)

(declare-fun c!45196 () Bool)

(assert (=> bm!25291 (= call!25293 ($colon$colon!108 e!171214 (ite c!45196 (h!4514 (toList!1961 lt!133262)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))))

(declare-fun c!45195 () Bool)

(assert (=> bm!25291 (= c!45195 c!45196)))

(declare-fun d!63799 () Bool)

(assert (=> d!63799 e!171217))

(declare-fun res!128973 () Bool)

(assert (=> d!63799 (=> (not res!128973) (not e!171217))))

(assert (=> d!63799 (= res!128973 (isStrictlySorted!377 lt!133728))))

(assert (=> d!63799 (= lt!133728 e!171215)))

(assert (=> d!63799 (= c!45196 (and ((_ is Cons!3848) (toList!1961 lt!133262)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133262))) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63799 (isStrictlySorted!377 (toList!1961 lt!133262))))

(assert (=> d!63799 (= (insertStrictlySorted!179 (toList!1961 lt!133262) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133728)))

(declare-fun b!264264 () Bool)

(assert (=> b!264264 (= e!171213 call!25292)))

(declare-fun b!264265 () Bool)

(assert (=> b!264265 (= e!171214 (ite c!45197 (t!8929 (toList!1961 lt!133262)) (ite c!45194 (Cons!3848 (h!4514 (toList!1961 lt!133262)) (t!8929 (toList!1961 lt!133262))) Nil!3849)))))

(assert (= (and d!63799 c!45196) b!264260))

(assert (= (and d!63799 (not c!45196)) b!264258))

(assert (= (and b!264258 c!45197) b!264261))

(assert (= (and b!264258 (not c!45197)) b!264257))

(assert (= (and b!264257 c!45194) b!264264))

(assert (= (and b!264257 (not c!45194)) b!264263))

(assert (= (or b!264264 b!264263) bm!25290))

(assert (= (or b!264261 bm!25290) bm!25289))

(assert (= (or b!264260 bm!25289) bm!25291))

(assert (= (and bm!25291 c!45195) b!264262))

(assert (= (and bm!25291 (not c!45195)) b!264265))

(assert (= (and d!63799 res!128973) b!264256))

(assert (= (and b!264256 res!128972) b!264259))

(declare-fun m!281037 () Bool)

(assert (=> bm!25291 m!281037))

(declare-fun m!281039 () Bool)

(assert (=> b!264262 m!281039))

(declare-fun m!281041 () Bool)

(assert (=> b!264259 m!281041))

(declare-fun m!281043 () Bool)

(assert (=> b!264256 m!281043))

(declare-fun m!281045 () Bool)

(assert (=> d!63799 m!281045))

(declare-fun m!281047 () Bool)

(assert (=> d!63799 m!281047))

(assert (=> d!63333 d!63799))

(assert (=> b!263515 d!63657))

(assert (=> b!263515 d!63553))

(assert (=> d!63237 d!63181))

(assert (=> b!263490 d!63471))

(declare-fun d!63801 () Bool)

(declare-fun res!128974 () Bool)

(declare-fun e!171218 () Bool)

(assert (=> d!63801 (=> res!128974 e!171218)))

(assert (=> d!63801 (= res!128974 (or ((_ is Nil!3849) lt!133413) ((_ is Nil!3849) (t!8929 lt!133413))))))

(assert (=> d!63801 (= (isStrictlySorted!377 lt!133413) e!171218)))

(declare-fun b!264266 () Bool)

(declare-fun e!171219 () Bool)

(assert (=> b!264266 (= e!171218 e!171219)))

(declare-fun res!128975 () Bool)

(assert (=> b!264266 (=> (not res!128975) (not e!171219))))

(assert (=> b!264266 (= res!128975 (bvslt (_1!2500 (h!4514 lt!133413)) (_1!2500 (h!4514 (t!8929 lt!133413)))))))

(declare-fun b!264267 () Bool)

(assert (=> b!264267 (= e!171219 (isStrictlySorted!377 (t!8929 lt!133413)))))

(assert (= (and d!63801 (not res!128974)) b!264266))

(assert (= (and b!264266 res!128975) b!264267))

(declare-fun m!281049 () Bool)

(assert (=> b!264267 m!281049))

(assert (=> d!63253 d!63801))

(declare-fun d!63803 () Bool)

(declare-fun res!128976 () Bool)

(declare-fun e!171220 () Bool)

(assert (=> d!63803 (=> res!128976 e!171220)))

(assert (=> d!63803 (= res!128976 (or ((_ is Nil!3849) (toList!1961 lt!133012)) ((_ is Nil!3849) (t!8929 (toList!1961 lt!133012)))))))

(assert (=> d!63803 (= (isStrictlySorted!377 (toList!1961 lt!133012)) e!171220)))

(declare-fun b!264268 () Bool)

(declare-fun e!171221 () Bool)

(assert (=> b!264268 (= e!171220 e!171221)))

(declare-fun res!128977 () Bool)

(assert (=> b!264268 (=> (not res!128977) (not e!171221))))

(assert (=> b!264268 (= res!128977 (bvslt (_1!2500 (h!4514 (toList!1961 lt!133012))) (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012))))))))

(declare-fun b!264269 () Bool)

(assert (=> b!264269 (= e!171221 (isStrictlySorted!377 (t!8929 (toList!1961 lt!133012))))))

(assert (= (and d!63803 (not res!128976)) b!264268))

(assert (= (and b!264268 res!128977) b!264269))

(declare-fun m!281051 () Bool)

(assert (=> b!264269 m!281051))

(assert (=> d!63253 d!63803))

(declare-fun d!63805 () Bool)

(assert (=> d!63805 (= (apply!262 lt!133512 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9314 () Bool)

(assert (= bs!9314 d!63805))

(declare-fun m!281053 () Bool)

(assert (=> bs!9314 m!281053))

(assert (=> bs!9314 m!281053))

(declare-fun m!281055 () Bool)

(assert (=> bs!9314 m!281055))

(assert (=> b!263693 d!63805))

(assert (=> b!263679 d!63471))

(assert (=> b!263685 d!63471))

(declare-fun d!63807 () Bool)

(declare-fun e!171222 () Bool)

(assert (=> d!63807 e!171222))

(declare-fun res!128978 () Bool)

(assert (=> d!63807 (=> (not res!128978) (not e!171222))))

(declare-fun lt!133731 () ListLongMap!3891)

(assert (=> d!63807 (= res!128978 (contains!1912 lt!133731 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))

(declare-fun lt!133732 () List!3852)

(assert (=> d!63807 (= lt!133731 (ListLongMap!3892 lt!133732))))

(declare-fun lt!133730 () Unit!8190)

(declare-fun lt!133729 () Unit!8190)

(assert (=> d!63807 (= lt!133730 lt!133729)))

(assert (=> d!63807 (= (getValueByKey!320 lt!133732 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))

(assert (=> d!63807 (= lt!133729 (lemmaContainsTupThenGetReturnValue!176 lt!133732 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))

(assert (=> d!63807 (= lt!133732 (insertStrictlySorted!179 (toList!1961 call!25249) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))

(assert (=> d!63807 (= (+!710 call!25249 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))) lt!133731)))

(declare-fun b!264270 () Bool)

(declare-fun res!128979 () Bool)

(assert (=> b!264270 (=> (not res!128979) (not e!171222))))

(assert (=> b!264270 (= res!128979 (= (getValueByKey!320 (toList!1961 lt!133731) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))))

(declare-fun b!264271 () Bool)

(assert (=> b!264271 (= e!171222 (contains!1914 (toList!1961 lt!133731) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))

(assert (= (and d!63807 res!128978) b!264270))

(assert (= (and b!264270 res!128979) b!264271))

(declare-fun m!281057 () Bool)

(assert (=> d!63807 m!281057))

(declare-fun m!281059 () Bool)

(assert (=> d!63807 m!281059))

(declare-fun m!281061 () Bool)

(assert (=> d!63807 m!281061))

(declare-fun m!281063 () Bool)

(assert (=> d!63807 m!281063))

(declare-fun m!281065 () Bool)

(assert (=> b!264270 m!281065))

(declare-fun m!281067 () Bool)

(assert (=> b!264271 m!281067))

(assert (=> b!263698 d!63807))

(declare-fun b!264272 () Bool)

(declare-fun e!171226 () Bool)

(declare-fun e!171223 () Bool)

(assert (=> b!264272 (= e!171226 e!171223)))

(declare-fun res!128981 () Bool)

(declare-fun lt!133734 () SeekEntryResult!1200)

(assert (=> b!264272 (= res!128981 (and ((_ is Intermediate!1200) lt!133734) (not (undefined!2012 lt!133734)) (bvslt (x!25242 lt!133734) #b01111111111111111111111111111110) (bvsge (x!25242 lt!133734) #b00000000000000000000000000000000) (bvsge (x!25242 lt!133734) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264272 (=> (not res!128981) (not e!171223))))

(declare-fun b!264273 () Bool)

(declare-fun e!171227 () SeekEntryResult!1200)

(declare-fun e!171225 () SeekEntryResult!1200)

(assert (=> b!264273 (= e!171227 e!171225)))

(declare-fun c!45198 () Bool)

(declare-fun lt!133733 () (_ BitVec 64))

(assert (=> b!264273 (= c!45198 (or (= lt!133733 key!932) (= (bvadd lt!133733 lt!133733) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264274 () Bool)

(assert (=> b!264274 (and (bvsge (index!6972 lt!133734) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133734) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun e!171224 () Bool)

(assert (=> b!264274 (= e!171224 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133734)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264275 () Bool)

(assert (=> b!264275 (and (bvsge (index!6972 lt!133734) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133734) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128980 () Bool)

(assert (=> b!264275 (= res!128980 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133734)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264275 (=> res!128980 e!171224)))

(declare-fun b!264276 () Bool)

(assert (=> b!264276 (= e!171227 (Intermediate!1200 true (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!264277 () Bool)

(assert (=> b!264277 (= e!171225 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11209 thiss!1504)) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!264278 () Bool)

(assert (=> b!264278 (= e!171226 (bvsge (x!25242 lt!133734) #b01111111111111111111111111111110))))

(declare-fun d!63809 () Bool)

(assert (=> d!63809 e!171226))

(declare-fun c!45199 () Bool)

(assert (=> d!63809 (= c!45199 (and ((_ is Intermediate!1200) lt!133734) (undefined!2012 lt!133734)))))

(assert (=> d!63809 (= lt!133734 e!171227)))

(declare-fun c!45200 () Bool)

(assert (=> d!63809 (= c!45200 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!63809 (= lt!133733 (select (arr!5999 (_keys!7035 thiss!1504)) (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504))))))

(assert (=> d!63809 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63809 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) lt!133734)))

(declare-fun b!264279 () Bool)

(assert (=> b!264279 (and (bvsge (index!6972 lt!133734) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133734) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun res!128982 () Bool)

(assert (=> b!264279 (= res!128982 (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6972 lt!133734)) key!932))))

(assert (=> b!264279 (=> res!128982 e!171224)))

(assert (=> b!264279 (= e!171223 e!171224)))

(declare-fun b!264280 () Bool)

(assert (=> b!264280 (= e!171225 (Intermediate!1200 false (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63809 c!45200) b!264276))

(assert (= (and d!63809 (not c!45200)) b!264273))

(assert (= (and b!264273 c!45198) b!264280))

(assert (= (and b!264273 (not c!45198)) b!264277))

(assert (= (and d!63809 c!45199) b!264278))

(assert (= (and d!63809 (not c!45199)) b!264272))

(assert (= (and b!264272 res!128981) b!264279))

(assert (= (and b!264279 (not res!128982)) b!264275))

(assert (= (and b!264275 (not res!128980)) b!264274))

(assert (=> b!264277 m!279563))

(declare-fun m!281069 () Bool)

(assert (=> b!264277 m!281069))

(assert (=> b!264277 m!281069))

(declare-fun m!281071 () Bool)

(assert (=> b!264277 m!281071))

(declare-fun m!281073 () Bool)

(assert (=> b!264274 m!281073))

(assert (=> b!264275 m!281073))

(assert (=> b!264279 m!281073))

(assert (=> d!63809 m!279563))

(declare-fun m!281075 () Bool)

(assert (=> d!63809 m!281075))

(assert (=> d!63809 m!279139))

(assert (=> b!263399 d!63809))

(declare-fun d!63811 () Bool)

(declare-fun lt!133737 () (_ BitVec 32))

(assert (=> d!63811 (and (bvsge lt!133737 #b00000000000000000000000000000000) (bvslt lt!133737 (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63811 (= lt!133737 (choose!52 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)))))

(assert (=> d!63811 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63811 (= (nextIndex!0 (toIndex!0 key!932 (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) lt!133737)))

(declare-fun bs!9315 () Bool)

(assert (= bs!9315 d!63811))

(assert (=> bs!9315 m!279143))

(declare-fun m!281077 () Bool)

(assert (=> bs!9315 m!281077))

(assert (=> bs!9315 m!279139))

(assert (=> b!263399 d!63811))

(declare-fun d!63813 () Bool)

(assert (=> d!63813 (= (inRange!0 (ite c!44917 (index!6970 lt!133311) (index!6973 lt!133311)) (mask!11209 thiss!1504)) (and (bvsge (ite c!44917 (index!6970 lt!133311) (index!6973 lt!133311)) #b00000000000000000000000000000000) (bvslt (ite c!44917 (index!6970 lt!133311) (index!6973 lt!133311)) (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25205 d!63813))

(declare-fun d!63815 () Bool)

(declare-fun res!128983 () Bool)

(declare-fun e!171228 () Bool)

(assert (=> d!63815 (=> res!128983 e!171228)))

(assert (=> d!63815 (= res!128983 (and ((_ is Cons!3848) (toList!1961 lt!133127)) (= (_1!2500 (h!4514 (toList!1961 lt!133127))) (_1!2500 lt!133020))))))

(assert (=> d!63815 (= (containsKey!312 (toList!1961 lt!133127) (_1!2500 lt!133020)) e!171228)))

(declare-fun b!264281 () Bool)

(declare-fun e!171229 () Bool)

(assert (=> b!264281 (= e!171228 e!171229)))

(declare-fun res!128984 () Bool)

(assert (=> b!264281 (=> (not res!128984) (not e!171229))))

(assert (=> b!264281 (= res!128984 (and (or (not ((_ is Cons!3848) (toList!1961 lt!133127))) (bvsle (_1!2500 (h!4514 (toList!1961 lt!133127))) (_1!2500 lt!133020))) ((_ is Cons!3848) (toList!1961 lt!133127)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133127))) (_1!2500 lt!133020))))))

(declare-fun b!264282 () Bool)

(assert (=> b!264282 (= e!171229 (containsKey!312 (t!8929 (toList!1961 lt!133127)) (_1!2500 lt!133020)))))

(assert (= (and d!63815 (not res!128983)) b!264281))

(assert (= (and b!264281 res!128984) b!264282))

(declare-fun m!281079 () Bool)

(assert (=> b!264282 m!281079))

(assert (=> d!63365 d!63815))

(declare-fun d!63817 () Bool)

(assert (=> d!63817 (= (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133186)) (v!5508 (getValueByKey!320 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133186)))))

(assert (=> d!63295 d!63817))

(declare-fun e!171231 () Option!326)

(declare-fun b!264285 () Bool)

(assert (=> b!264285 (= e!171231 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))) lt!133186))))

(declare-fun b!264283 () Bool)

(declare-fun e!171230 () Option!326)

(assert (=> b!264283 (= e!171230 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))))))

(declare-fun d!63819 () Bool)

(declare-fun c!45201 () Bool)

(assert (=> d!63819 (= c!45201 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))) lt!133186)))))

(assert (=> d!63819 (= (getValueByKey!320 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))) lt!133186) e!171230)))

(declare-fun b!264286 () Bool)

(assert (=> b!264286 (= e!171231 None!324)))

(declare-fun b!264284 () Bool)

(assert (=> b!264284 (= e!171230 e!171231)))

(declare-fun c!45202 () Bool)

(assert (=> b!264284 (= c!45202 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504)))))) lt!133186))))))

(assert (= (and d!63819 c!45201) b!264283))

(assert (= (and d!63819 (not c!45201)) b!264284))

(assert (= (and b!264284 c!45202) b!264285))

(assert (= (and b!264284 (not c!45202)) b!264286))

(declare-fun m!281081 () Bool)

(assert (=> b!264285 m!281081))

(assert (=> d!63295 d!63819))

(assert (=> b!263681 d!63477))

(declare-fun d!63821 () Bool)

(assert (=> d!63821 (= (apply!262 (+!710 lt!133378 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))) lt!133383) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133378 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))) lt!133383)))))

(declare-fun bs!9316 () Bool)

(assert (= bs!9316 d!63821))

(declare-fun m!281083 () Bool)

(assert (=> bs!9316 m!281083))

(assert (=> bs!9316 m!281083))

(declare-fun m!281085 () Bool)

(assert (=> bs!9316 m!281085))

(assert (=> b!263477 d!63821))

(declare-fun d!63823 () Bool)

(assert (=> d!63823 (= (apply!262 lt!133388 lt!133371) (get!3094 (getValueByKey!320 (toList!1961 lt!133388) lt!133371)))))

(declare-fun bs!9317 () Bool)

(assert (= bs!9317 d!63823))

(declare-fun m!281087 () Bool)

(assert (=> bs!9317 m!281087))

(assert (=> bs!9317 m!281087))

(declare-fun m!281089 () Bool)

(assert (=> bs!9317 m!281089))

(assert (=> b!263477 d!63823))

(declare-fun d!63825 () Bool)

(assert (=> d!63825 (= (apply!262 lt!133378 lt!133383) (get!3094 (getValueByKey!320 (toList!1961 lt!133378) lt!133383)))))

(declare-fun bs!9318 () Bool)

(assert (= bs!9318 d!63825))

(declare-fun m!281091 () Bool)

(assert (=> bs!9318 m!281091))

(assert (=> bs!9318 m!281091))

(declare-fun m!281093 () Bool)

(assert (=> bs!9318 m!281093))

(assert (=> b!263477 d!63825))

(assert (=> b!263477 d!63493))

(declare-fun d!63827 () Bool)

(assert (=> d!63827 (= (apply!262 (+!710 lt!133378 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))) lt!133383) (apply!262 lt!133378 lt!133383))))

(declare-fun lt!133738 () Unit!8190)

(assert (=> d!63827 (= lt!133738 (choose!1295 lt!133378 lt!133379 (zeroValue!4684 thiss!1504) lt!133383))))

(declare-fun e!171232 () Bool)

(assert (=> d!63827 e!171232))

(declare-fun res!128985 () Bool)

(assert (=> d!63827 (=> (not res!128985) (not e!171232))))

(assert (=> d!63827 (= res!128985 (contains!1912 lt!133378 lt!133383))))

(assert (=> d!63827 (= (addApplyDifferent!238 lt!133378 lt!133379 (zeroValue!4684 thiss!1504) lt!133383) lt!133738)))

(declare-fun b!264287 () Bool)

(assert (=> b!264287 (= e!171232 (not (= lt!133383 lt!133379)))))

(assert (= (and d!63827 res!128985) b!264287))

(assert (=> d!63827 m!279691))

(assert (=> d!63827 m!279671))

(assert (=> d!63827 m!279671))

(assert (=> d!63827 m!279675))

(declare-fun m!281095 () Bool)

(assert (=> d!63827 m!281095))

(declare-fun m!281097 () Bool)

(assert (=> d!63827 m!281097))

(assert (=> b!263477 d!63827))

(declare-fun d!63829 () Bool)

(declare-fun e!171233 () Bool)

(assert (=> d!63829 e!171233))

(declare-fun res!128986 () Bool)

(assert (=> d!63829 (=> (not res!128986) (not e!171233))))

(declare-fun lt!133741 () ListLongMap!3891)

(assert (=> d!63829 (= res!128986 (contains!1912 lt!133741 (_1!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133742 () List!3852)

(assert (=> d!63829 (= lt!133741 (ListLongMap!3892 lt!133742))))

(declare-fun lt!133740 () Unit!8190)

(declare-fun lt!133739 () Unit!8190)

(assert (=> d!63829 (= lt!133740 lt!133739)))

(assert (=> d!63829 (= (getValueByKey!320 lt!133742 (_1!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63829 (= lt!133739 (lemmaContainsTupThenGetReturnValue!176 lt!133742 (_1!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63829 (= lt!133742 (insertStrictlySorted!179 (toList!1961 lt!133392) (_1!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63829 (= (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))) lt!133741)))

(declare-fun b!264288 () Bool)

(declare-fun res!128987 () Bool)

(assert (=> b!264288 (=> (not res!128987) (not e!171233))))

(assert (=> b!264288 (= res!128987 (= (getValueByKey!320 (toList!1961 lt!133741) (_1!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!264289 () Bool)

(assert (=> b!264289 (= e!171233 (contains!1914 (toList!1961 lt!133741) (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63829 res!128986) b!264288))

(assert (= (and b!264288 res!128987) b!264289))

(declare-fun m!281099 () Bool)

(assert (=> d!63829 m!281099))

(declare-fun m!281101 () Bool)

(assert (=> d!63829 m!281101))

(declare-fun m!281103 () Bool)

(assert (=> d!63829 m!281103))

(declare-fun m!281105 () Bool)

(assert (=> d!63829 m!281105))

(declare-fun m!281107 () Bool)

(assert (=> b!264288 m!281107))

(declare-fun m!281109 () Bool)

(assert (=> b!264289 m!281109))

(assert (=> b!263477 d!63829))

(declare-fun d!63831 () Bool)

(assert (=> d!63831 (= (apply!262 lt!133384 lt!133375) (get!3094 (getValueByKey!320 (toList!1961 lt!133384) lt!133375)))))

(declare-fun bs!9319 () Bool)

(assert (= bs!9319 d!63831))

(declare-fun m!281111 () Bool)

(assert (=> bs!9319 m!281111))

(assert (=> bs!9319 m!281111))

(declare-fun m!281113 () Bool)

(assert (=> bs!9319 m!281113))

(assert (=> b!263477 d!63831))

(declare-fun d!63833 () Bool)

(assert (=> d!63833 (= (apply!262 (+!710 lt!133388 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))) lt!133371) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133388 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))) lt!133371)))))

(declare-fun bs!9320 () Bool)

(assert (= bs!9320 d!63833))

(declare-fun m!281115 () Bool)

(assert (=> bs!9320 m!281115))

(assert (=> bs!9320 m!281115))

(declare-fun m!281117 () Bool)

(assert (=> bs!9320 m!281117))

(assert (=> b!263477 d!63833))

(declare-fun d!63835 () Bool)

(assert (=> d!63835 (= (apply!262 (+!710 lt!133384 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))) lt!133375) (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133384 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))) lt!133375)))))

(declare-fun bs!9321 () Bool)

(assert (= bs!9321 d!63835))

(declare-fun m!281119 () Bool)

(assert (=> bs!9321 m!281119))

(assert (=> bs!9321 m!281119))

(declare-fun m!281121 () Bool)

(assert (=> bs!9321 m!281121))

(assert (=> b!263477 d!63835))

(declare-fun d!63837 () Bool)

(assert (=> d!63837 (= (apply!262 (+!710 lt!133384 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))) lt!133375) (apply!262 lt!133384 lt!133375))))

(declare-fun lt!133743 () Unit!8190)

(assert (=> d!63837 (= lt!133743 (choose!1295 lt!133384 lt!133373 (minValue!4684 thiss!1504) lt!133375))))

(declare-fun e!171234 () Bool)

(assert (=> d!63837 e!171234))

(declare-fun res!128988 () Bool)

(assert (=> d!63837 (=> (not res!128988) (not e!171234))))

(assert (=> d!63837 (= res!128988 (contains!1912 lt!133384 lt!133375))))

(assert (=> d!63837 (= (addApplyDifferent!238 lt!133384 lt!133373 (minValue!4684 thiss!1504) lt!133375) lt!133743)))

(declare-fun b!264290 () Bool)

(assert (=> b!264290 (= e!171234 (not (= lt!133375 lt!133373)))))

(assert (= (and d!63837 res!128988) b!264290))

(assert (=> d!63837 m!279689))

(assert (=> d!63837 m!279683))

(assert (=> d!63837 m!279683))

(assert (=> d!63837 m!279687))

(declare-fun m!281123 () Bool)

(assert (=> d!63837 m!281123))

(declare-fun m!281125 () Bool)

(assert (=> d!63837 m!281125))

(assert (=> b!263477 d!63837))

(declare-fun d!63839 () Bool)

(declare-fun e!171235 () Bool)

(assert (=> d!63839 e!171235))

(declare-fun res!128989 () Bool)

(assert (=> d!63839 (=> (not res!128989) (not e!171235))))

(declare-fun lt!133746 () ListLongMap!3891)

(assert (=> d!63839 (= res!128989 (contains!1912 lt!133746 (_1!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133747 () List!3852)

(assert (=> d!63839 (= lt!133746 (ListLongMap!3892 lt!133747))))

(declare-fun lt!133745 () Unit!8190)

(declare-fun lt!133744 () Unit!8190)

(assert (=> d!63839 (= lt!133745 lt!133744)))

(assert (=> d!63839 (= (getValueByKey!320 lt!133747 (_1!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))))))

(assert (=> d!63839 (= lt!133744 (lemmaContainsTupThenGetReturnValue!176 lt!133747 (_1!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))))))

(assert (=> d!63839 (= lt!133747 (insertStrictlySorted!179 (toList!1961 lt!133388) (_1!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))))))

(assert (=> d!63839 (= (+!710 lt!133388 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))) lt!133746)))

(declare-fun b!264291 () Bool)

(declare-fun res!128990 () Bool)

(assert (=> b!264291 (=> (not res!128990) (not e!171235))))

(assert (=> b!264291 (= res!128990 (= (getValueByKey!320 (toList!1961 lt!133746) (_1!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))))))))

(declare-fun b!264292 () Bool)

(assert (=> b!264292 (= e!171235 (contains!1914 (toList!1961 lt!133746) (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))))))

(assert (= (and d!63839 res!128989) b!264291))

(assert (= (and b!264291 res!128990) b!264292))

(declare-fun m!281127 () Bool)

(assert (=> d!63839 m!281127))

(declare-fun m!281129 () Bool)

(assert (=> d!63839 m!281129))

(declare-fun m!281131 () Bool)

(assert (=> d!63839 m!281131))

(declare-fun m!281133 () Bool)

(assert (=> d!63839 m!281133))

(declare-fun m!281135 () Bool)

(assert (=> b!264291 m!281135))

(declare-fun m!281137 () Bool)

(assert (=> b!264292 m!281137))

(assert (=> b!263477 d!63839))

(declare-fun d!63841 () Bool)

(assert (=> d!63841 (contains!1912 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))) lt!133385)))

(declare-fun lt!133748 () Unit!8190)

(assert (=> d!63841 (= lt!133748 (choose!1296 lt!133392 lt!133372 (zeroValue!4684 thiss!1504) lt!133385))))

(assert (=> d!63841 (contains!1912 lt!133392 lt!133385)))

(assert (=> d!63841 (= (addStillContains!238 lt!133392 lt!133372 (zeroValue!4684 thiss!1504) lt!133385) lt!133748)))

(declare-fun bs!9322 () Bool)

(assert (= bs!9322 d!63841))

(assert (=> bs!9322 m!279667))

(assert (=> bs!9322 m!279667))

(assert (=> bs!9322 m!279669))

(declare-fun m!281139 () Bool)

(assert (=> bs!9322 m!281139))

(declare-fun m!281141 () Bool)

(assert (=> bs!9322 m!281141))

(assert (=> b!263477 d!63841))

(declare-fun d!63843 () Bool)

(assert (=> d!63843 (= (apply!262 (+!710 lt!133388 (tuple2!4979 lt!133387 (minValue!4684 thiss!1504))) lt!133371) (apply!262 lt!133388 lt!133371))))

(declare-fun lt!133749 () Unit!8190)

(assert (=> d!63843 (= lt!133749 (choose!1295 lt!133388 lt!133387 (minValue!4684 thiss!1504) lt!133371))))

(declare-fun e!171236 () Bool)

(assert (=> d!63843 e!171236))

(declare-fun res!128991 () Bool)

(assert (=> d!63843 (=> (not res!128991) (not e!171236))))

(assert (=> d!63843 (= res!128991 (contains!1912 lt!133388 lt!133371))))

(assert (=> d!63843 (= (addApplyDifferent!238 lt!133388 lt!133387 (minValue!4684 thiss!1504) lt!133371) lt!133749)))

(declare-fun b!264293 () Bool)

(assert (=> b!264293 (= e!171236 (not (= lt!133371 lt!133387)))))

(assert (= (and d!63843 res!128991) b!264293))

(assert (=> d!63843 m!279673))

(assert (=> d!63843 m!279663))

(assert (=> d!63843 m!279663))

(assert (=> d!63843 m!279665))

(declare-fun m!281143 () Bool)

(assert (=> d!63843 m!281143))

(declare-fun m!281145 () Bool)

(assert (=> d!63843 m!281145))

(assert (=> b!263477 d!63843))

(declare-fun d!63845 () Bool)

(declare-fun e!171237 () Bool)

(assert (=> d!63845 e!171237))

(declare-fun res!128992 () Bool)

(assert (=> d!63845 (=> (not res!128992) (not e!171237))))

(declare-fun lt!133752 () ListLongMap!3891)

(assert (=> d!63845 (= res!128992 (contains!1912 lt!133752 (_1!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133753 () List!3852)

(assert (=> d!63845 (= lt!133752 (ListLongMap!3892 lt!133753))))

(declare-fun lt!133751 () Unit!8190)

(declare-fun lt!133750 () Unit!8190)

(assert (=> d!63845 (= lt!133751 lt!133750)))

(assert (=> d!63845 (= (getValueByKey!320 lt!133753 (_1!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63845 (= lt!133750 (lemmaContainsTupThenGetReturnValue!176 lt!133753 (_1!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63845 (= lt!133753 (insertStrictlySorted!179 (toList!1961 lt!133378) (_1!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63845 (= (+!710 lt!133378 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))) lt!133752)))

(declare-fun b!264294 () Bool)

(declare-fun res!128993 () Bool)

(assert (=> b!264294 (=> (not res!128993) (not e!171237))))

(assert (=> b!264294 (= res!128993 (= (getValueByKey!320 (toList!1961 lt!133752) (_1!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!264295 () Bool)

(assert (=> b!264295 (= e!171237 (contains!1914 (toList!1961 lt!133752) (tuple2!4979 lt!133379 (zeroValue!4684 thiss!1504))))))

(assert (= (and d!63845 res!128992) b!264294))

(assert (= (and b!264294 res!128993) b!264295))

(declare-fun m!281147 () Bool)

(assert (=> d!63845 m!281147))

(declare-fun m!281149 () Bool)

(assert (=> d!63845 m!281149))

(declare-fun m!281151 () Bool)

(assert (=> d!63845 m!281151))

(declare-fun m!281153 () Bool)

(assert (=> d!63845 m!281153))

(declare-fun m!281155 () Bool)

(assert (=> b!264294 m!281155))

(declare-fun m!281157 () Bool)

(assert (=> b!264295 m!281157))

(assert (=> b!263477 d!63845))

(declare-fun d!63847 () Bool)

(declare-fun e!171238 () Bool)

(assert (=> d!63847 e!171238))

(declare-fun res!128994 () Bool)

(assert (=> d!63847 (=> (not res!128994) (not e!171238))))

(declare-fun lt!133756 () ListLongMap!3891)

(assert (=> d!63847 (= res!128994 (contains!1912 lt!133756 (_1!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133757 () List!3852)

(assert (=> d!63847 (= lt!133756 (ListLongMap!3892 lt!133757))))

(declare-fun lt!133755 () Unit!8190)

(declare-fun lt!133754 () Unit!8190)

(assert (=> d!63847 (= lt!133755 lt!133754)))

(assert (=> d!63847 (= (getValueByKey!320 lt!133757 (_1!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))))))

(assert (=> d!63847 (= lt!133754 (lemmaContainsTupThenGetReturnValue!176 lt!133757 (_1!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))))))

(assert (=> d!63847 (= lt!133757 (insertStrictlySorted!179 (toList!1961 lt!133384) (_1!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))))))

(assert (=> d!63847 (= (+!710 lt!133384 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))) lt!133756)))

(declare-fun b!264296 () Bool)

(declare-fun res!128995 () Bool)

(assert (=> b!264296 (=> (not res!128995) (not e!171238))))

(assert (=> b!264296 (= res!128995 (= (getValueByKey!320 (toList!1961 lt!133756) (_1!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))))))))

(declare-fun b!264297 () Bool)

(assert (=> b!264297 (= e!171238 (contains!1914 (toList!1961 lt!133756) (tuple2!4979 lt!133373 (minValue!4684 thiss!1504))))))

(assert (= (and d!63847 res!128994) b!264296))

(assert (= (and b!264296 res!128995) b!264297))

(declare-fun m!281159 () Bool)

(assert (=> d!63847 m!281159))

(declare-fun m!281161 () Bool)

(assert (=> d!63847 m!281161))

(declare-fun m!281163 () Bool)

(assert (=> d!63847 m!281163))

(declare-fun m!281165 () Bool)

(assert (=> d!63847 m!281165))

(declare-fun m!281167 () Bool)

(assert (=> b!264296 m!281167))

(declare-fun m!281169 () Bool)

(assert (=> b!264297 m!281169))

(assert (=> b!263477 d!63847))

(declare-fun d!63849 () Bool)

(declare-fun e!171239 () Bool)

(assert (=> d!63849 e!171239))

(declare-fun res!128996 () Bool)

(assert (=> d!63849 (=> res!128996 e!171239)))

(declare-fun lt!133759 () Bool)

(assert (=> d!63849 (= res!128996 (not lt!133759))))

(declare-fun lt!133758 () Bool)

(assert (=> d!63849 (= lt!133759 lt!133758)))

(declare-fun lt!133760 () Unit!8190)

(declare-fun e!171240 () Unit!8190)

(assert (=> d!63849 (= lt!133760 e!171240)))

(declare-fun c!45203 () Bool)

(assert (=> d!63849 (= c!45203 lt!133758)))

(assert (=> d!63849 (= lt!133758 (containsKey!312 (toList!1961 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))) lt!133385))))

(assert (=> d!63849 (= (contains!1912 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504))) lt!133385) lt!133759)))

(declare-fun b!264298 () Bool)

(declare-fun lt!133761 () Unit!8190)

(assert (=> b!264298 (= e!171240 lt!133761)))

(assert (=> b!264298 (= lt!133761 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))) lt!133385))))

(assert (=> b!264298 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))) lt!133385))))

(declare-fun b!264299 () Bool)

(declare-fun Unit!8238 () Unit!8190)

(assert (=> b!264299 (= e!171240 Unit!8238)))

(declare-fun b!264300 () Bool)

(assert (=> b!264300 (= e!171239 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133392 (tuple2!4979 lt!133372 (zeroValue!4684 thiss!1504)))) lt!133385)))))

(assert (= (and d!63849 c!45203) b!264298))

(assert (= (and d!63849 (not c!45203)) b!264299))

(assert (= (and d!63849 (not res!128996)) b!264300))

(declare-fun m!281171 () Bool)

(assert (=> d!63849 m!281171))

(declare-fun m!281173 () Bool)

(assert (=> b!264298 m!281173))

(declare-fun m!281175 () Bool)

(assert (=> b!264298 m!281175))

(assert (=> b!264298 m!281175))

(declare-fun m!281177 () Bool)

(assert (=> b!264298 m!281177))

(assert (=> b!264300 m!281175))

(assert (=> b!264300 m!281175))

(assert (=> b!264300 m!281177))

(assert (=> b!263477 d!63849))

(declare-fun d!63851 () Bool)

(assert (=> d!63851 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))

(declare-fun lt!133762 () Unit!8190)

(assert (=> d!63851 (= lt!133762 (choose!1293 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))

(declare-fun e!171241 () Bool)

(assert (=> d!63851 e!171241))

(declare-fun res!128997 () Bool)

(assert (=> d!63851 (=> (not res!128997) (not e!171241))))

(assert (=> d!63851 (= res!128997 (isStrictlySorted!377 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63851 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255) lt!133762)))

(declare-fun b!264301 () Bool)

(assert (=> b!264301 (= e!171241 (containsKey!312 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))

(assert (= (and d!63851 res!128997) b!264301))

(assert (=> d!63851 m!279977))

(assert (=> d!63851 m!279977))

(assert (=> d!63851 m!279979))

(declare-fun m!281179 () Bool)

(assert (=> d!63851 m!281179))

(declare-fun m!281181 () Bool)

(assert (=> d!63851 m!281181))

(assert (=> b!264301 m!279973))

(assert (=> b!263652 d!63851))

(declare-fun d!63853 () Bool)

(assert (=> d!63853 (= (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255))))))

(declare-fun bs!9323 () Bool)

(assert (= bs!9323 d!63853))

(assert (=> bs!9323 m!279977))

(declare-fun m!281183 () Bool)

(assert (=> bs!9323 m!281183))

(assert (=> b!263652 d!63853))

(declare-fun b!264304 () Bool)

(declare-fun e!171243 () Option!326)

(assert (=> b!264304 (= e!171243 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))) lt!133255))))

(declare-fun b!264302 () Bool)

(declare-fun e!171242 () Option!326)

(assert (=> b!264302 (= e!171242 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))))

(declare-fun d!63855 () Bool)

(declare-fun c!45204 () Bool)

(assert (=> d!63855 (= c!45204 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))) lt!133255)))))

(assert (=> d!63855 (= (getValueByKey!320 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255) e!171242)))

(declare-fun b!264305 () Bool)

(assert (=> b!264305 (= e!171243 None!324)))

(declare-fun b!264303 () Bool)

(assert (=> b!264303 (= e!171242 e!171243)))

(declare-fun c!45205 () Bool)

(assert (=> b!264303 (= c!45205 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))) lt!133255))))))

(assert (= (and d!63855 c!45204) b!264302))

(assert (= (and d!63855 (not c!45204)) b!264303))

(assert (= (and b!264303 c!45205) b!264304))

(assert (= (and b!264303 (not c!45205)) b!264305))

(declare-fun m!281185 () Bool)

(assert (=> b!264304 m!281185))

(assert (=> b!263652 d!63855))

(declare-fun b!264308 () Bool)

(declare-fun e!171245 () Option!326)

(assert (=> b!264308 (= e!171245 (getValueByKey!320 (t!8929 (t!8929 (toList!1961 lt!133009))) key!932))))

(declare-fun b!264306 () Bool)

(declare-fun e!171244 () Option!326)

(assert (=> b!264306 (= e!171244 (Some!325 (_2!2500 (h!4514 (t!8929 (toList!1961 lt!133009))))))))

(declare-fun d!63857 () Bool)

(declare-fun c!45206 () Bool)

(assert (=> d!63857 (= c!45206 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133009))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133009)))) key!932)))))

(assert (=> d!63857 (= (getValueByKey!320 (t!8929 (toList!1961 lt!133009)) key!932) e!171244)))

(declare-fun b!264309 () Bool)

(assert (=> b!264309 (= e!171245 None!324)))

(declare-fun b!264307 () Bool)

(assert (=> b!264307 (= e!171244 e!171245)))

(declare-fun c!45207 () Bool)

(assert (=> b!264307 (= c!45207 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133009))) (not (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133009)))) key!932))))))

(assert (= (and d!63857 c!45206) b!264306))

(assert (= (and d!63857 (not c!45206)) b!264307))

(assert (= (and b!264307 c!45207) b!264308))

(assert (= (and b!264307 (not c!45207)) b!264309))

(declare-fun m!281187 () Bool)

(assert (=> b!264308 m!281187))

(assert (=> b!263593 d!63857))

(assert (=> b!263712 d!63683))

(assert (=> b!263712 d!63685))

(declare-fun d!63859 () Bool)

(assert (not d!63859))

(assert (=> b!263301 d!63859))

(declare-fun b!264312 () Bool)

(declare-fun e!171247 () Option!326)

(assert (=> b!264312 (= e!171247 (getValueByKey!320 (t!8929 (toList!1961 lt!133457)) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264310 () Bool)

(declare-fun e!171246 () Option!326)

(assert (=> b!264310 (= e!171246 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133457)))))))

(declare-fun c!45208 () Bool)

(declare-fun d!63861 () Bool)

(assert (=> d!63861 (= c!45208 (and ((_ is Cons!3848) (toList!1961 lt!133457)) (= (_1!2500 (h!4514 (toList!1961 lt!133457))) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63861 (= (getValueByKey!320 (toList!1961 lt!133457) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) e!171246)))

(declare-fun b!264313 () Bool)

(assert (=> b!264313 (= e!171247 None!324)))

(declare-fun b!264311 () Bool)

(assert (=> b!264311 (= e!171246 e!171247)))

(declare-fun c!45209 () Bool)

(assert (=> b!264311 (= c!45209 (and ((_ is Cons!3848) (toList!1961 lt!133457)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133457))) (_1!2500 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63861 c!45208) b!264310))

(assert (= (and d!63861 (not c!45208)) b!264311))

(assert (= (and b!264311 c!45209) b!264312))

(assert (= (and b!264311 (not c!45209)) b!264313))

(declare-fun m!281189 () Bool)

(assert (=> b!264312 m!281189))

(assert (=> b!263634 d!63861))

(declare-fun b!264316 () Bool)

(declare-fun e!171249 () Option!326)

(assert (=> b!264316 (= e!171249 (getValueByKey!320 (t!8929 (t!8929 (toList!1961 lt!133025))) key!932))))

(declare-fun b!264314 () Bool)

(declare-fun e!171248 () Option!326)

(assert (=> b!264314 (= e!171248 (Some!325 (_2!2500 (h!4514 (t!8929 (toList!1961 lt!133025))))))))

(declare-fun d!63863 () Bool)

(declare-fun c!45210 () Bool)

(assert (=> d!63863 (= c!45210 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133025))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133025)))) key!932)))))

(assert (=> d!63863 (= (getValueByKey!320 (t!8929 (toList!1961 lt!133025)) key!932) e!171248)))

(declare-fun b!264317 () Bool)

(assert (=> b!264317 (= e!171249 None!324)))

(declare-fun b!264315 () Bool)

(assert (=> b!264315 (= e!171248 e!171249)))

(declare-fun c!45211 () Bool)

(assert (=> b!264315 (= c!45211 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133025))) (not (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133025)))) key!932))))))

(assert (= (and d!63863 c!45210) b!264314))

(assert (= (and d!63863 (not c!45210)) b!264315))

(assert (= (and b!264315 c!45211) b!264316))

(assert (= (and b!264315 (not c!45211)) b!264317))

(declare-fun m!281191 () Bool)

(assert (=> b!264316 m!281191))

(assert (=> b!263455 d!63863))

(assert (=> d!63287 d!63265))

(declare-fun lt!133763 () SeekEntryResult!1200)

(declare-fun d!63865 () Bool)

(assert (=> d!63865 (and (or ((_ is Undefined!1200) lt!133763) (not ((_ is Found!1200) lt!133763)) (and (bvsge (index!6971 lt!133763) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133763) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133763) ((_ is Found!1200) lt!133763) (not ((_ is MissingVacant!1200) lt!133763)) (not (= (index!6973 lt!133763) (index!6972 lt!133097))) (and (bvsge (index!6973 lt!133763) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133763) (size!6350 (_keys!7035 thiss!1504))))) (or ((_ is Undefined!1200) lt!133763) (ite ((_ is Found!1200) lt!133763) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6971 lt!133763)) key!932) (and ((_ is MissingVacant!1200) lt!133763) (= (index!6973 lt!133763) (index!6972 lt!133097)) (= (select (arr!5999 (_keys!7035 thiss!1504)) (index!6973 lt!133763)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!171252 () SeekEntryResult!1200)

(assert (=> d!63865 (= lt!133763 e!171252)))

(declare-fun c!45212 () Bool)

(assert (=> d!63865 (= c!45212 (bvsge (bvadd (x!25242 lt!133097) #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!133764 () (_ BitVec 64))

(assert (=> d!63865 (= lt!133764 (select (arr!5999 (_keys!7035 thiss!1504)) (nextIndex!0 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504))))))

(assert (=> d!63865 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63865 (= (seekKeyOrZeroReturnVacant!0 (bvadd (x!25242 lt!133097) #b00000000000000000000000000000001) (nextIndex!0 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504)) (index!6972 lt!133097) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)) lt!133763)))

(declare-fun b!264318 () Bool)

(declare-fun e!171251 () SeekEntryResult!1200)

(assert (=> b!264318 (= e!171251 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25242 lt!133097) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504)) (bvadd (x!25242 lt!133097) #b00000000000000000000000000000001) (mask!11209 thiss!1504)) (index!6972 lt!133097) key!932 (_keys!7035 thiss!1504) (mask!11209 thiss!1504)))))

(declare-fun b!264319 () Bool)

(assert (=> b!264319 (= e!171251 (MissingVacant!1200 (index!6972 lt!133097)))))

(declare-fun b!264320 () Bool)

(declare-fun c!45214 () Bool)

(assert (=> b!264320 (= c!45214 (= lt!133764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171250 () SeekEntryResult!1200)

(assert (=> b!264320 (= e!171250 e!171251)))

(declare-fun b!264321 () Bool)

(assert (=> b!264321 (= e!171252 e!171250)))

(declare-fun c!45213 () Bool)

(assert (=> b!264321 (= c!45213 (= lt!133764 key!932))))

(declare-fun b!264322 () Bool)

(assert (=> b!264322 (= e!171250 (Found!1200 (nextIndex!0 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504))))))

(declare-fun b!264323 () Bool)

(assert (=> b!264323 (= e!171252 Undefined!1200)))

(assert (= (and d!63865 c!45212) b!264323))

(assert (= (and d!63865 (not c!45212)) b!264321))

(assert (= (and b!264321 c!45213) b!264322))

(assert (= (and b!264321 (not c!45213)) b!264320))

(assert (= (and b!264320 c!45214) b!264319))

(assert (= (and b!264320 (not c!45214)) b!264318))

(declare-fun m!281193 () Bool)

(assert (=> d!63865 m!281193))

(declare-fun m!281195 () Bool)

(assert (=> d!63865 m!281195))

(assert (=> d!63865 m!279707))

(declare-fun m!281197 () Bool)

(assert (=> d!63865 m!281197))

(assert (=> d!63865 m!279139))

(assert (=> b!264318 m!279707))

(declare-fun m!281199 () Bool)

(assert (=> b!264318 m!281199))

(assert (=> b!264318 m!281199))

(declare-fun m!281201 () Bool)

(assert (=> b!264318 m!281201))

(assert (=> b!263507 d!63865))

(declare-fun d!63867 () Bool)

(declare-fun lt!133765 () (_ BitVec 32))

(assert (=> d!63867 (and (bvsge lt!133765 #b00000000000000000000000000000000) (bvslt lt!133765 (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001)))))

(assert (=> d!63867 (= lt!133765 (choose!52 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504)))))

(assert (=> d!63867 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63867 (= (nextIndex!0 (index!6972 lt!133097) (x!25242 lt!133097) (mask!11209 thiss!1504)) lt!133765)))

(declare-fun bs!9324 () Bool)

(assert (= bs!9324 d!63867))

(declare-fun m!281203 () Bool)

(assert (=> bs!9324 m!281203))

(assert (=> bs!9324 m!279139))

(assert (=> b!263507 d!63867))

(assert (=> b!263640 d!63189))

(declare-fun d!63869 () Bool)

(assert (=> d!63869 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133766 () Unit!8190)

(assert (=> d!63869 (= lt!133766 (choose!1293 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171253 () Bool)

(assert (=> d!63869 e!171253))

(declare-fun res!128998 () Bool)

(assert (=> d!63869 (=> (not res!128998) (not e!171253))))

(assert (=> d!63869 (= res!128998 (isStrictlySorted!377 (toList!1961 lt!133256)))))

(assert (=> d!63869 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000) lt!133766)))

(declare-fun b!264324 () Bool)

(assert (=> b!264324 (= e!171253 (containsKey!312 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63869 res!128998) b!264324))

(assert (=> d!63869 m!279545))

(assert (=> d!63869 m!279545))

(assert (=> d!63869 m!279547))

(declare-fun m!281205 () Bool)

(assert (=> d!63869 m!281205))

(assert (=> d!63869 m!280141))

(assert (=> b!264324 m!279541))

(assert (=> b!263368 d!63869))

(declare-fun d!63871 () Bool)

(assert (=> d!63871 (= (isDefined!261 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9325 () Bool)

(assert (= bs!9325 d!63871))

(assert (=> bs!9325 m!279545))

(declare-fun m!281207 () Bool)

(assert (=> bs!9325 m!281207))

(assert (=> b!263368 d!63871))

(declare-fun b!264327 () Bool)

(declare-fun e!171255 () Option!326)

(assert (=> b!264327 (= e!171255 (getValueByKey!320 (t!8929 (toList!1961 lt!133256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264325 () Bool)

(declare-fun e!171254 () Option!326)

(assert (=> b!264325 (= e!171254 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133256)))))))

(declare-fun d!63873 () Bool)

(declare-fun c!45215 () Bool)

(assert (=> d!63873 (= c!45215 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (= (_1!2500 (h!4514 (toList!1961 lt!133256))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63873 (= (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000) e!171254)))

(declare-fun b!264328 () Bool)

(assert (=> b!264328 (= e!171255 None!324)))

(declare-fun b!264326 () Bool)

(assert (=> b!264326 (= e!171254 e!171255)))

(declare-fun c!45216 () Bool)

(assert (=> b!264326 (= c!45216 (and ((_ is Cons!3848) (toList!1961 lt!133256)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133256))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!63873 c!45215) b!264325))

(assert (= (and d!63873 (not c!45215)) b!264326))

(assert (= (and b!264326 c!45216) b!264327))

(assert (= (and b!264326 (not c!45216)) b!264328))

(declare-fun m!281209 () Bool)

(assert (=> b!264327 m!281209))

(assert (=> b!263368 d!63873))

(declare-fun d!63875 () Bool)

(declare-fun res!128999 () Bool)

(declare-fun e!171256 () Bool)

(assert (=> d!63875 (=> res!128999 e!171256)))

(assert (=> d!63875 (= res!128999 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))) lt!133255)))))

(assert (=> d!63875 (= (containsKey!312 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))) lt!133255) e!171256)))

(declare-fun b!264329 () Bool)

(declare-fun e!171257 () Bool)

(assert (=> b!264329 (= e!171256 e!171257)))

(declare-fun res!129000 () Bool)

(assert (=> b!264329 (=> (not res!129000) (not e!171257))))

(assert (=> b!264329 (= res!129000 (and (or (not ((_ is Cons!3848) (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))) (bvsle (_1!2500 (h!4514 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))) lt!133255)) ((_ is Cons!3848) (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))) (bvslt (_1!2500 (h!4514 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504)))))) lt!133255)))))

(declare-fun b!264330 () Bool)

(assert (=> b!264330 (= e!171257 (containsKey!312 (t!8929 (toList!1961 (+!710 lt!133262 (tuple2!4979 lt!133242 (zeroValue!4684 thiss!1504))))) lt!133255))))

(assert (= (and d!63875 (not res!128999)) b!264329))

(assert (= (and b!264329 res!129000) b!264330))

(declare-fun m!281211 () Bool)

(assert (=> b!264330 m!281211))

(assert (=> d!63343 d!63875))

(declare-fun d!63877 () Bool)

(declare-fun e!171258 () Bool)

(assert (=> d!63877 e!171258))

(declare-fun res!129001 () Bool)

(assert (=> d!63877 (=> res!129001 e!171258)))

(declare-fun lt!133768 () Bool)

(assert (=> d!63877 (= res!129001 (not lt!133768))))

(declare-fun lt!133767 () Bool)

(assert (=> d!63877 (= lt!133768 lt!133767)))

(declare-fun lt!133769 () Unit!8190)

(declare-fun e!171259 () Unit!8190)

(assert (=> d!63877 (= lt!133769 e!171259)))

(declare-fun c!45217 () Bool)

(assert (=> d!63877 (= c!45217 lt!133767)))

(assert (=> d!63877 (= lt!133767 (containsKey!312 (toList!1961 lt!133512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63877 (= (contains!1912 lt!133512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133768)))

(declare-fun b!264331 () Bool)

(declare-fun lt!133770 () Unit!8190)

(assert (=> b!264331 (= e!171259 lt!133770)))

(assert (=> b!264331 (= lt!133770 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264331 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264332 () Bool)

(declare-fun Unit!8239 () Unit!8190)

(assert (=> b!264332 (= e!171259 Unit!8239)))

(declare-fun b!264333 () Bool)

(assert (=> b!264333 (= e!171258 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63877 c!45217) b!264331))

(assert (= (and d!63877 (not c!45217)) b!264332))

(assert (= (and d!63877 (not res!129001)) b!264333))

(declare-fun m!281213 () Bool)

(assert (=> d!63877 m!281213))

(declare-fun m!281215 () Bool)

(assert (=> b!264331 m!281215))

(assert (=> b!264331 m!281053))

(assert (=> b!264331 m!281053))

(declare-fun m!281217 () Bool)

(assert (=> b!264331 m!281217))

(assert (=> b!264333 m!281053))

(assert (=> b!264333 m!281053))

(assert (=> b!264333 m!281217))

(assert (=> bm!25245 d!63877))

(declare-fun d!63879 () Bool)

(declare-fun res!129002 () Bool)

(declare-fun e!171260 () Bool)

(assert (=> d!63879 (=> res!129002 e!171260)))

(assert (=> d!63879 (= res!129002 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133025))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133025)))) key!932)))))

(assert (=> d!63879 (= (containsKey!312 (t!8929 (toList!1961 lt!133025)) key!932) e!171260)))

(declare-fun b!264334 () Bool)

(declare-fun e!171261 () Bool)

(assert (=> b!264334 (= e!171260 e!171261)))

(declare-fun res!129003 () Bool)

(assert (=> b!264334 (=> (not res!129003) (not e!171261))))

(assert (=> b!264334 (= res!129003 (and (or (not ((_ is Cons!3848) (t!8929 (toList!1961 lt!133025)))) (bvsle (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133025)))) key!932)) ((_ is Cons!3848) (t!8929 (toList!1961 lt!133025))) (bvslt (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133025)))) key!932)))))

(declare-fun b!264335 () Bool)

(assert (=> b!264335 (= e!171261 (containsKey!312 (t!8929 (t!8929 (toList!1961 lt!133025))) key!932))))

(assert (= (and d!63879 (not res!129002)) b!264334))

(assert (= (and b!264334 res!129003) b!264335))

(declare-fun m!281219 () Bool)

(assert (=> b!264335 m!281219))

(assert (=> b!263623 d!63879))

(assert (=> b!263327 d!63727))

(assert (=> b!263327 d!63729))

(declare-fun d!63881 () Bool)

(declare-fun e!171262 () Bool)

(assert (=> d!63881 e!171262))

(declare-fun res!129004 () Bool)

(assert (=> d!63881 (=> res!129004 e!171262)))

(declare-fun lt!133772 () Bool)

(assert (=> d!63881 (= res!129004 (not lt!133772))))

(declare-fun lt!133771 () Bool)

(assert (=> d!63881 (= lt!133772 lt!133771)))

(declare-fun lt!133773 () Unit!8190)

(declare-fun e!171263 () Unit!8190)

(assert (=> d!63881 (= lt!133773 e!171263)))

(declare-fun c!45218 () Bool)

(assert (=> d!63881 (= c!45218 lt!133771)))

(assert (=> d!63881 (= lt!133771 (containsKey!312 (toList!1961 lt!133386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63881 (= (contains!1912 lt!133386 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133772)))

(declare-fun b!264336 () Bool)

(declare-fun lt!133774 () Unit!8190)

(assert (=> b!264336 (= e!171263 lt!133774)))

(assert (=> b!264336 (= lt!133774 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264336 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264337 () Bool)

(declare-fun Unit!8240 () Unit!8190)

(assert (=> b!264337 (= e!171263 Unit!8240)))

(declare-fun b!264338 () Bool)

(assert (=> b!264338 (= e!171262 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63881 c!45218) b!264336))

(assert (= (and d!63881 (not c!45218)) b!264337))

(assert (= (and d!63881 (not res!129004)) b!264338))

(declare-fun m!281221 () Bool)

(assert (=> d!63881 m!281221))

(declare-fun m!281223 () Bool)

(assert (=> b!264336 m!281223))

(assert (=> b!264336 m!280347))

(assert (=> b!264336 m!280347))

(declare-fun m!281225 () Bool)

(assert (=> b!264336 m!281225))

(assert (=> b!264338 m!280347))

(assert (=> b!264338 m!280347))

(assert (=> b!264338 m!281225))

(assert (=> bm!25213 d!63881))

(declare-fun d!63883 () Bool)

(assert (=> d!63883 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))

(declare-fun lt!133775 () Unit!8190)

(assert (=> d!63883 (= lt!133775 (choose!1293 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))

(declare-fun e!171264 () Bool)

(assert (=> d!63883 e!171264))

(declare-fun res!129005 () Bool)

(assert (=> d!63883 (=> (not res!129005) (not e!171264))))

(assert (=> d!63883 (= res!129005 (isStrictlySorted!377 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63883 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200) lt!133775)))

(declare-fun b!264339 () Bool)

(assert (=> b!264339 (= e!171264 (containsKey!312 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))

(assert (= (and d!63883 res!129005) b!264339))

(assert (=> d!63883 m!279823))

(assert (=> d!63883 m!279823))

(assert (=> d!63883 m!279825))

(declare-fun m!281227 () Bool)

(assert (=> d!63883 m!281227))

(declare-fun m!281229 () Bool)

(assert (=> d!63883 m!281229))

(assert (=> b!264339 m!279819))

(assert (=> b!263608 d!63883))

(declare-fun d!63885 () Bool)

(assert (=> d!63885 (= (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200)) (not (isEmpty!540 (getValueByKey!320 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200))))))

(declare-fun bs!9326 () Bool)

(assert (= bs!9326 d!63885))

(assert (=> bs!9326 m!279823))

(declare-fun m!281231 () Bool)

(assert (=> bs!9326 m!281231))

(assert (=> b!263608 d!63885))

(declare-fun b!264342 () Bool)

(declare-fun e!171266 () Option!326)

(assert (=> b!264342 (= e!171266 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))) lt!133200))))

(declare-fun b!264340 () Bool)

(declare-fun e!171265 () Option!326)

(assert (=> b!264340 (= e!171265 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))))

(declare-fun c!45219 () Bool)

(declare-fun d!63887 () Bool)

(assert (=> d!63887 (= c!45219 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))) lt!133200)))))

(assert (=> d!63887 (= (getValueByKey!320 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133200) e!171265)))

(declare-fun b!264343 () Bool)

(assert (=> b!264343 (= e!171266 None!324)))

(declare-fun b!264341 () Bool)

(assert (=> b!264341 (= e!171265 e!171266)))

(declare-fun c!45220 () Bool)

(assert (=> b!264341 (= c!45220 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))) lt!133200))))))

(assert (= (and d!63887 c!45219) b!264340))

(assert (= (and d!63887 (not c!45219)) b!264341))

(assert (= (and b!264341 c!45220) b!264342))

(assert (= (and b!264341 (not c!45220)) b!264343))

(declare-fun m!281233 () Bool)

(assert (=> b!264342 m!281233))

(assert (=> b!263608 d!63887))

(declare-fun b!264344 () Bool)

(declare-fun e!171270 () Bool)

(declare-fun e!171267 () Bool)

(assert (=> b!264344 (= e!171270 e!171267)))

(declare-fun res!129007 () Bool)

(declare-fun lt!133777 () SeekEntryResult!1200)

(assert (=> b!264344 (= res!129007 (and ((_ is Intermediate!1200) lt!133777) (not (undefined!2012 lt!133777)) (bvslt (x!25242 lt!133777) #b01111111111111111111111111111110) (bvsge (x!25242 lt!133777) #b00000000000000000000000000000000) (bvsge (x!25242 lt!133777) #b00000000000000000000000000000000)))))

(assert (=> b!264344 (=> (not res!129007) (not e!171267))))

(declare-fun b!264345 () Bool)

(declare-fun e!171271 () SeekEntryResult!1200)

(declare-fun e!171269 () SeekEntryResult!1200)

(assert (=> b!264345 (= e!171271 e!171269)))

(declare-fun c!45221 () Bool)

(declare-fun lt!133776 () (_ BitVec 64))

(assert (=> b!264345 (= c!45221 (or (= lt!133776 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (= (bvadd lt!133776 lt!133776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264346 () Bool)

(assert (=> b!264346 (and (bvsge (index!6972 lt!133777) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133777) (size!6350 lt!133026)))))

(declare-fun e!171268 () Bool)

(assert (=> b!264346 (= e!171268 (= (select (arr!5999 lt!133026) (index!6972 lt!133777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264347 () Bool)

(assert (=> b!264347 (and (bvsge (index!6972 lt!133777) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133777) (size!6350 lt!133026)))))

(declare-fun res!129006 () Bool)

(assert (=> b!264347 (= res!129006 (= (select (arr!5999 lt!133026) (index!6972 lt!133777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264347 (=> res!129006 e!171268)))

(declare-fun b!264348 () Bool)

(assert (=> b!264348 (= e!171271 (Intermediate!1200 true (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!264349 () Bool)

(assert (=> b!264349 (= e!171269 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) #b00000000000000000000000000000000 (mask!11209 thiss!1504)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun b!264350 () Bool)

(assert (=> b!264350 (= e!171270 (bvsge (x!25242 lt!133777) #b01111111111111111111111111111110))))

(declare-fun d!63889 () Bool)

(assert (=> d!63889 e!171270))

(declare-fun c!45222 () Bool)

(assert (=> d!63889 (= c!45222 (and ((_ is Intermediate!1200) lt!133777) (undefined!2012 lt!133777)))))

(assert (=> d!63889 (= lt!133777 e!171271)))

(declare-fun c!45223 () Bool)

(assert (=> d!63889 (= c!45223 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!63889 (= lt!133776 (select (arr!5999 lt!133026) (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504))))))

(assert (=> d!63889 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!63889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000) lt!133026 (mask!11209 thiss!1504)) lt!133777)))

(declare-fun b!264351 () Bool)

(assert (=> b!264351 (and (bvsge (index!6972 lt!133777) #b00000000000000000000000000000000) (bvslt (index!6972 lt!133777) (size!6350 lt!133026)))))

(declare-fun res!129008 () Bool)

(assert (=> b!264351 (= res!129008 (= (select (arr!5999 lt!133026) (index!6972 lt!133777)) (select (arr!5999 lt!133026) #b00000000000000000000000000000000)))))

(assert (=> b!264351 (=> res!129008 e!171268)))

(assert (=> b!264351 (= e!171267 e!171268)))

(declare-fun b!264352 () Bool)

(assert (=> b!264352 (= e!171269 (Intermediate!1200 false (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!63889 c!45223) b!264348))

(assert (= (and d!63889 (not c!45223)) b!264345))

(assert (= (and b!264345 c!45221) b!264352))

(assert (= (and b!264345 (not c!45221)) b!264349))

(assert (= (and d!63889 c!45222) b!264350))

(assert (= (and d!63889 (not c!45222)) b!264344))

(assert (= (and b!264344 res!129007) b!264351))

(assert (= (and b!264351 (not res!129008)) b!264347))

(assert (= (and b!264347 (not res!129006)) b!264346))

(assert (=> b!264349 m!279439))

(declare-fun m!281235 () Bool)

(assert (=> b!264349 m!281235))

(assert (=> b!264349 m!281235))

(assert (=> b!264349 m!279255))

(declare-fun m!281237 () Bool)

(assert (=> b!264349 m!281237))

(declare-fun m!281239 () Bool)

(assert (=> b!264346 m!281239))

(assert (=> b!264347 m!281239))

(assert (=> b!264351 m!281239))

(assert (=> d!63889 m!279439))

(declare-fun m!281241 () Bool)

(assert (=> d!63889 m!281241))

(assert (=> d!63889 m!279139))

(assert (=> d!63151 d!63889))

(declare-fun d!63891 () Bool)

(declare-fun lt!133779 () (_ BitVec 32))

(declare-fun lt!133778 () (_ BitVec 32))

(assert (=> d!63891 (= lt!133779 (bvmul (bvxor lt!133778 (bvlshr lt!133778 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63891 (= lt!133778 ((_ extract 31 0) (bvand (bvxor (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (bvlshr (select (arr!5999 lt!133026) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63891 (and (bvsge (mask!11209 thiss!1504) #b00000000000000000000000000000000) (let ((res!128645 (let ((h!4517 ((_ extract 31 0) (bvand (bvxor (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (bvlshr (select (arr!5999 lt!133026) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25267 (bvmul (bvxor h!4517 (bvlshr h!4517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25267 (bvlshr x!25267 #b00000000000000000000000000001101)) (mask!11209 thiss!1504)))))) (and (bvslt res!128645 (bvadd (mask!11209 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!128645 #b00000000000000000000000000000000))))))

(assert (=> d!63891 (= (toIndex!0 (select (arr!5999 lt!133026) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) (bvand (bvxor lt!133779 (bvlshr lt!133779 #b00000000000000000000000000001101)) (mask!11209 thiss!1504)))))

(assert (=> d!63151 d!63891))

(assert (=> d!63151 d!63181))

(assert (=> d!63187 d!63185))

(assert (=> d!63187 d!63099))

(assert (=> d!63385 d!63375))

(assert (=> d!63385 d!63109))

(declare-fun d!63893 () Bool)

(assert (=> d!63893 (= (get!3096 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263367 d!63893))

(assert (=> d!63167 d!63169))

(assert (=> d!63167 d!63171))

(declare-fun d!63895 () Bool)

(assert (=> d!63895 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133012) key!932))))

(assert (=> d!63895 true))

(declare-fun _$12!455 () Unit!8190)

(assert (=> d!63895 (= (choose!1293 (toList!1961 lt!133012) key!932) _$12!455)))

(declare-fun bs!9327 () Bool)

(assert (= bs!9327 d!63895))

(assert (=> bs!9327 m!279193))

(assert (=> bs!9327 m!279193))

(assert (=> bs!9327 m!279195))

(assert (=> d!63167 d!63895))

(assert (=> d!63167 d!63803))

(declare-fun d!63897 () Bool)

(assert (=> d!63897 (= (apply!262 lt!133352 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000)) (get!3094 (getValueByKey!320 (toList!1961 lt!133352) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9328 () Bool)

(assert (= bs!9328 d!63897))

(assert (=> bs!9328 m!279199))

(assert (=> bs!9328 m!280445))

(assert (=> bs!9328 m!280445))

(declare-fun m!281243 () Bool)

(assert (=> bs!9328 m!281243))

(assert (=> b!263433 d!63897))

(assert (=> b!263433 d!63193))

(declare-fun lt!133780 () Bool)

(declare-fun d!63899 () Bool)

(assert (=> d!63899 (= lt!133780 (select (content!176 (toList!1961 lt!133307)) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun e!171273 () Bool)

(assert (=> d!63899 (= lt!133780 e!171273)))

(declare-fun res!129010 () Bool)

(assert (=> d!63899 (=> (not res!129010) (not e!171273))))

(assert (=> d!63899 (= res!129010 ((_ is Cons!3848) (toList!1961 lt!133307)))))

(assert (=> d!63899 (= (contains!1914 (toList!1961 lt!133307) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133780)))

(declare-fun b!264353 () Bool)

(declare-fun e!171272 () Bool)

(assert (=> b!264353 (= e!171273 e!171272)))

(declare-fun res!129009 () Bool)

(assert (=> b!264353 (=> res!129009 e!171272)))

(assert (=> b!264353 (= res!129009 (= (h!4514 (toList!1961 lt!133307)) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264354 () Bool)

(assert (=> b!264354 (= e!171272 (contains!1914 (t!8929 (toList!1961 lt!133307)) (ite (or c!44895 c!44892) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (= (and d!63899 res!129010) b!264353))

(assert (= (and b!264353 (not res!129009)) b!264354))

(declare-fun m!281245 () Bool)

(assert (=> d!63899 m!281245))

(declare-fun m!281247 () Bool)

(assert (=> d!63899 m!281247))

(declare-fun m!281249 () Bool)

(assert (=> b!264354 m!281249))

(assert (=> b!263329 d!63899))

(assert (=> b!263597 d!63277))

(declare-fun d!63901 () Bool)

(declare-fun lt!133781 () Bool)

(assert (=> d!63901 (= lt!133781 (select (content!176 (toList!1961 lt!133369)) (tuple2!4979 key!932 v!346)))))

(declare-fun e!171275 () Bool)

(assert (=> d!63901 (= lt!133781 e!171275)))

(declare-fun res!129012 () Bool)

(assert (=> d!63901 (=> (not res!129012) (not e!171275))))

(assert (=> d!63901 (= res!129012 ((_ is Cons!3848) (toList!1961 lt!133369)))))

(assert (=> d!63901 (= (contains!1914 (toList!1961 lt!133369) (tuple2!4979 key!932 v!346)) lt!133781)))

(declare-fun b!264355 () Bool)

(declare-fun e!171274 () Bool)

(assert (=> b!264355 (= e!171275 e!171274)))

(declare-fun res!129011 () Bool)

(assert (=> b!264355 (=> res!129011 e!171274)))

(assert (=> b!264355 (= res!129011 (= (h!4514 (toList!1961 lt!133369)) (tuple2!4979 key!932 v!346)))))

(declare-fun b!264356 () Bool)

(assert (=> b!264356 (= e!171274 (contains!1914 (t!8929 (toList!1961 lt!133369)) (tuple2!4979 key!932 v!346)))))

(assert (= (and d!63901 res!129012) b!264355))

(assert (= (and b!264355 (not res!129011)) b!264356))

(declare-fun m!281251 () Bool)

(assert (=> d!63901 m!281251))

(declare-fun m!281253 () Bool)

(assert (=> d!63901 m!281253))

(declare-fun m!281255 () Bool)

(assert (=> b!264356 m!281255))

(assert (=> b!263469 d!63901))

(declare-fun b!264358 () Bool)

(declare-fun e!171276 () Bool)

(declare-fun call!25295 () Bool)

(assert (=> b!264358 (= e!171276 call!25295)))

(declare-fun b!264359 () Bool)

(declare-fun e!171277 () Bool)

(assert (=> b!264359 (= e!171276 e!171277)))

(declare-fun lt!133782 () (_ BitVec 64))

(assert (=> b!264359 (= lt!133782 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!133783 () Unit!8190)

(assert (=> b!264359 (= lt!133783 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133026 lt!133782 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!264359 (arrayContainsKey!0 lt!133026 lt!133782 #b00000000000000000000000000000000)))

(declare-fun lt!133784 () Unit!8190)

(assert (=> b!264359 (= lt!133784 lt!133783)))

(declare-fun res!129014 () Bool)

(assert (=> b!264359 (= res!129014 (= (seekEntryOrOpen!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!133026 (mask!11209 thiss!1504)) (Found!1200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!264359 (=> (not res!129014) (not e!171277))))

(declare-fun b!264360 () Bool)

(assert (=> b!264360 (= e!171277 call!25295)))

(declare-fun bm!25292 () Bool)

(assert (=> bm!25292 (= call!25295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!133026 (mask!11209 thiss!1504)))))

(declare-fun b!264357 () Bool)

(declare-fun e!171278 () Bool)

(assert (=> b!264357 (= e!171278 e!171276)))

(declare-fun c!45224 () Bool)

(assert (=> b!264357 (= c!45224 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63903 () Bool)

(declare-fun res!129013 () Bool)

(assert (=> d!63903 (=> res!129013 e!171278)))

(assert (=> d!63903 (= res!129013 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!63903 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!133026 (mask!11209 thiss!1504)) e!171278)))

(assert (= (and d!63903 (not res!129013)) b!264357))

(assert (= (and b!264357 c!45224) b!264359))

(assert (= (and b!264357 (not c!45224)) b!264358))

(assert (= (and b!264359 res!129014) b!264360))

(assert (= (or b!264360 b!264358) bm!25292))

(assert (=> b!264359 m!280353))

(declare-fun m!281257 () Bool)

(assert (=> b!264359 m!281257))

(declare-fun m!281259 () Bool)

(assert (=> b!264359 m!281259))

(assert (=> b!264359 m!280353))

(declare-fun m!281261 () Bool)

(assert (=> b!264359 m!281261))

(declare-fun m!281263 () Bool)

(assert (=> bm!25292 m!281263))

(assert (=> b!264357 m!280353))

(assert (=> b!264357 m!280353))

(assert (=> b!264357 m!280357))

(assert (=> bm!25197 d!63903))

(declare-fun d!63905 () Bool)

(declare-fun c!45227 () Bool)

(assert (=> d!63905 (= c!45227 ((_ is Nil!3849) (toList!1961 lt!133265)))))

(declare-fun e!171281 () (InoxSet tuple2!4978))

(assert (=> d!63905 (= (content!176 (toList!1961 lt!133265)) e!171281)))

(declare-fun b!264365 () Bool)

(assert (=> b!264365 (= e!171281 ((as const (Array tuple2!4978 Bool)) false))))

(declare-fun b!264366 () Bool)

(assert (=> b!264366 (= e!171281 ((_ map or) (store ((as const (Array tuple2!4978 Bool)) false) (h!4514 (toList!1961 lt!133265)) true) (content!176 (t!8929 (toList!1961 lt!133265)))))))

(assert (= (and d!63905 c!45227) b!264365))

(assert (= (and d!63905 (not c!45227)) b!264366))

(declare-fun m!281265 () Bool)

(assert (=> b!264366 m!281265))

(declare-fun m!281267 () Bool)

(assert (=> b!264366 m!281267))

(assert (=> d!63199 d!63905))

(declare-fun d!63907 () Bool)

(declare-fun e!171282 () Bool)

(assert (=> d!63907 e!171282))

(declare-fun res!129015 () Bool)

(assert (=> d!63907 (=> (not res!129015) (not e!171282))))

(declare-fun lt!133787 () ListLongMap!3891)

(assert (=> d!63907 (= res!129015 (contains!1912 lt!133787 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133788 () List!3852)

(assert (=> d!63907 (= lt!133787 (ListLongMap!3892 lt!133788))))

(declare-fun lt!133786 () Unit!8190)

(declare-fun lt!133785 () Unit!8190)

(assert (=> d!63907 (= lt!133786 lt!133785)))

(assert (=> d!63907 (= (getValueByKey!320 lt!133788 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63907 (= lt!133785 (lemmaContainsTupThenGetReturnValue!176 lt!133788 (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63907 (= lt!133788 (insertStrictlySorted!179 (toList!1961 call!25221) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (=> d!63907 (= (+!710 call!25221 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))) lt!133787)))

(declare-fun b!264367 () Bool)

(declare-fun res!129016 () Bool)

(assert (=> b!264367 (=> (not res!129016) (not e!171282))))

(assert (=> b!264367 (= res!129016 (= (getValueByKey!320 (toList!1961 lt!133787) (_1!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264368 () Bool)

(assert (=> b!264368 (= e!171282 (contains!1914 (toList!1961 lt!133787) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))

(assert (= (and d!63907 res!129015) b!264367))

(assert (= (and b!264367 res!129016) b!264368))

(declare-fun m!281269 () Bool)

(assert (=> d!63907 m!281269))

(declare-fun m!281271 () Bool)

(assert (=> d!63907 m!281271))

(declare-fun m!281273 () Bool)

(assert (=> d!63907 m!281273))

(declare-fun m!281275 () Bool)

(assert (=> d!63907 m!281275))

(declare-fun m!281277 () Bool)

(assert (=> b!264367 m!281277))

(declare-fun m!281279 () Bool)

(assert (=> b!264368 m!281279))

(assert (=> b!263479 d!63907))

(assert (=> b!263602 d!63195))

(declare-fun d!63909 () Bool)

(assert (=> d!63909 (= (size!6353 thiss!1504) (bvadd (_size!1984 thiss!1504) (bvsdiv (bvadd (extraKeys!4580 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!263626 d!63909))

(declare-fun lt!133789 () Bool)

(declare-fun d!63911 () Bool)

(assert (=> d!63911 (= lt!133789 (select (content!176 (toList!1961 lt!133416)) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun e!171284 () Bool)

(assert (=> d!63911 (= lt!133789 e!171284)))

(declare-fun res!129018 () Bool)

(assert (=> d!63911 (=> (not res!129018) (not e!171284))))

(assert (=> d!63911 (= res!129018 ((_ is Cons!3848) (toList!1961 lt!133416)))))

(assert (=> d!63911 (= (contains!1914 (toList!1961 lt!133416) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) lt!133789)))

(declare-fun b!264369 () Bool)

(declare-fun e!171283 () Bool)

(assert (=> b!264369 (= e!171284 e!171283)))

(declare-fun res!129017 () Bool)

(assert (=> b!264369 (=> res!129017 e!171283)))

(assert (=> b!264369 (= res!129017 (= (h!4514 (toList!1961 lt!133416)) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(declare-fun b!264370 () Bool)

(assert (=> b!264370 (= e!171283 (contains!1914 (t!8929 (toList!1961 lt!133416)) (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))

(assert (= (and d!63911 res!129018) b!264369))

(assert (= (and b!264369 (not res!129017)) b!264370))

(declare-fun m!281281 () Bool)

(assert (=> d!63911 m!281281))

(declare-fun m!281283 () Bool)

(assert (=> d!63911 m!281283))

(declare-fun m!281285 () Bool)

(assert (=> b!264370 m!281285))

(assert (=> b!263564 d!63911))

(assert (=> b!263574 d!63503))

(declare-fun d!63913 () Bool)

(assert (=> d!63913 (= (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd index!297 #b00000000000000000000000000000001))) (and (not (= (select (arr!5999 lt!133026) (bvadd index!297 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5999 lt!133026) (bvadd index!297 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263323 d!63913))

(assert (=> d!63241 d!63181))

(declare-fun d!63915 () Bool)

(declare-fun e!171285 () Bool)

(assert (=> d!63915 e!171285))

(declare-fun res!129019 () Bool)

(assert (=> d!63915 (=> res!129019 e!171285)))

(declare-fun lt!133791 () Bool)

(assert (=> d!63915 (= res!129019 (not lt!133791))))

(declare-fun lt!133790 () Bool)

(assert (=> d!63915 (= lt!133791 lt!133790)))

(declare-fun lt!133792 () Unit!8190)

(declare-fun e!171286 () Unit!8190)

(assert (=> d!63915 (= lt!133792 e!171286)))

(declare-fun c!45228 () Bool)

(assert (=> d!63915 (= c!45228 lt!133790)))

(assert (=> d!63915 (= lt!133790 (containsKey!312 (toList!1961 lt!133352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63915 (= (contains!1912 lt!133352 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133791)))

(declare-fun b!264371 () Bool)

(declare-fun lt!133793 () Unit!8190)

(assert (=> b!264371 (= e!171286 lt!133793)))

(assert (=> b!264371 (= lt!133793 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264371 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264372 () Bool)

(declare-fun Unit!8241 () Unit!8190)

(assert (=> b!264372 (= e!171286 Unit!8241)))

(declare-fun b!264373 () Bool)

(assert (=> b!264373 (= e!171285 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133352) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63915 c!45228) b!264371))

(assert (= (and d!63915 (not c!45228)) b!264372))

(assert (= (and d!63915 (not res!129019)) b!264373))

(declare-fun m!281287 () Bool)

(assert (=> d!63915 m!281287))

(declare-fun m!281289 () Bool)

(assert (=> b!264371 m!281289))

(declare-fun m!281291 () Bool)

(assert (=> b!264371 m!281291))

(assert (=> b!264371 m!281291))

(declare-fun m!281293 () Bool)

(assert (=> b!264371 m!281293))

(assert (=> b!264373 m!281291))

(assert (=> b!264373 m!281291))

(assert (=> b!264373 m!281293))

(assert (=> d!63207 d!63915))

(assert (=> d!63207 d!63181))

(assert (=> d!63299 d!63289))

(assert (=> d!63299 d!63311))

(declare-fun d!63917 () Bool)

(assert (=> d!63917 (= (apply!262 (+!710 lt!133199 (tuple2!4979 lt!133188 (minValue!4684 thiss!1504))) lt!133190) (apply!262 lt!133199 lt!133190))))

(assert (=> d!63917 true))

(declare-fun _$34!1136 () Unit!8190)

(assert (=> d!63917 (= (choose!1295 lt!133199 lt!133188 (minValue!4684 thiss!1504) lt!133190) _$34!1136)))

(declare-fun bs!9329 () Bool)

(assert (= bs!9329 d!63917))

(assert (=> bs!9329 m!279235))

(assert (=> bs!9329 m!279235))

(assert (=> bs!9329 m!279239))

(assert (=> bs!9329 m!279241))

(assert (=> d!63299 d!63917))

(declare-fun d!63919 () Bool)

(declare-fun e!171287 () Bool)

(assert (=> d!63919 e!171287))

(declare-fun res!129020 () Bool)

(assert (=> d!63919 (=> res!129020 e!171287)))

(declare-fun lt!133795 () Bool)

(assert (=> d!63919 (= res!129020 (not lt!133795))))

(declare-fun lt!133794 () Bool)

(assert (=> d!63919 (= lt!133795 lt!133794)))

(declare-fun lt!133796 () Unit!8190)

(declare-fun e!171288 () Unit!8190)

(assert (=> d!63919 (= lt!133796 e!171288)))

(declare-fun c!45229 () Bool)

(assert (=> d!63919 (= c!45229 lt!133794)))

(assert (=> d!63919 (= lt!133794 (containsKey!312 (toList!1961 lt!133199) lt!133190))))

(assert (=> d!63919 (= (contains!1912 lt!133199 lt!133190) lt!133795)))

(declare-fun b!264374 () Bool)

(declare-fun lt!133797 () Unit!8190)

(assert (=> b!264374 (= e!171288 lt!133797)))

(assert (=> b!264374 (= lt!133797 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133199) lt!133190))))

(assert (=> b!264374 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133199) lt!133190))))

(declare-fun b!264375 () Bool)

(declare-fun Unit!8242 () Unit!8190)

(assert (=> b!264375 (= e!171288 Unit!8242)))

(declare-fun b!264376 () Bool)

(assert (=> b!264376 (= e!171287 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133199) lt!133190)))))

(assert (= (and d!63919 c!45229) b!264374))

(assert (= (and d!63919 (not c!45229)) b!264375))

(assert (= (and d!63919 (not res!129020)) b!264376))

(declare-fun m!281295 () Bool)

(assert (=> d!63919 m!281295))

(declare-fun m!281297 () Bool)

(assert (=> b!264374 m!281297))

(assert (=> b!264374 m!279803))

(assert (=> b!264374 m!279803))

(declare-fun m!281299 () Bool)

(assert (=> b!264374 m!281299))

(assert (=> b!264376 m!279803))

(assert (=> b!264376 m!279803))

(assert (=> b!264376 m!281299))

(assert (=> d!63299 d!63919))

(assert (=> d!63299 d!63309))

(declare-fun d!63921 () Bool)

(assert (=> d!63921 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))) (v!5508 (getValueByKey!320 (toList!1961 lt!133256) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(assert (=> d!63261 d!63921))

(assert (=> d!63261 d!63395))

(declare-fun d!63923 () Bool)

(declare-fun e!171289 () Bool)

(assert (=> d!63923 e!171289))

(declare-fun res!129021 () Bool)

(assert (=> d!63923 (=> res!129021 e!171289)))

(declare-fun lt!133799 () Bool)

(assert (=> d!63923 (= res!129021 (not lt!133799))))

(declare-fun lt!133798 () Bool)

(assert (=> d!63923 (= lt!133799 lt!133798)))

(declare-fun lt!133800 () Unit!8190)

(declare-fun e!171290 () Unit!8190)

(assert (=> d!63923 (= lt!133800 e!171290)))

(declare-fun c!45230 () Bool)

(assert (=> d!63923 (= c!45230 lt!133798)))

(assert (=> d!63923 (= lt!133798 (containsKey!312 (toList!1961 lt!133451) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(assert (=> d!63923 (= (contains!1912 lt!133451 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133799)))

(declare-fun b!264377 () Bool)

(declare-fun lt!133801 () Unit!8190)

(assert (=> b!264377 (= e!171290 lt!133801)))

(assert (=> b!264377 (= lt!133801 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133451) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(assert (=> b!264377 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133451) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264378 () Bool)

(declare-fun Unit!8243 () Unit!8190)

(assert (=> b!264378 (= e!171290 Unit!8243)))

(declare-fun b!264379 () Bool)

(assert (=> b!264379 (= e!171289 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133451) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63923 c!45230) b!264377))

(assert (= (and d!63923 (not c!45230)) b!264378))

(assert (= (and d!63923 (not res!129021)) b!264379))

(declare-fun m!281301 () Bool)

(assert (=> d!63923 m!281301))

(declare-fun m!281303 () Bool)

(assert (=> b!264377 m!281303))

(assert (=> b!264377 m!279895))

(assert (=> b!264377 m!279895))

(declare-fun m!281305 () Bool)

(assert (=> b!264377 m!281305))

(assert (=> b!264379 m!279895))

(assert (=> b!264379 m!279895))

(assert (=> b!264379 m!281305))

(assert (=> d!63317 d!63923))

(declare-fun b!264382 () Bool)

(declare-fun e!171292 () Option!326)

(assert (=> b!264382 (= e!171292 (getValueByKey!320 (t!8929 lt!133452) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264380 () Bool)

(declare-fun e!171291 () Option!326)

(assert (=> b!264380 (= e!171291 (Some!325 (_2!2500 (h!4514 lt!133452))))))

(declare-fun d!63925 () Bool)

(declare-fun c!45231 () Bool)

(assert (=> d!63925 (= c!45231 (and ((_ is Cons!3848) lt!133452) (= (_1!2500 (h!4514 lt!133452)) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63925 (= (getValueByKey!320 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) e!171291)))

(declare-fun b!264383 () Bool)

(assert (=> b!264383 (= e!171292 None!324)))

(declare-fun b!264381 () Bool)

(assert (=> b!264381 (= e!171291 e!171292)))

(declare-fun c!45232 () Bool)

(assert (=> b!264381 (= c!45232 (and ((_ is Cons!3848) lt!133452) (not (= (_1!2500 (h!4514 lt!133452)) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63925 c!45231) b!264380))

(assert (= (and d!63925 (not c!45231)) b!264381))

(assert (= (and b!264381 c!45232) b!264382))

(assert (= (and b!264381 (not c!45232)) b!264383))

(declare-fun m!281307 () Bool)

(assert (=> b!264382 m!281307))

(assert (=> d!63317 d!63925))

(declare-fun d!63927 () Bool)

(assert (=> d!63927 (= (getValueByKey!320 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun lt!133802 () Unit!8190)

(assert (=> d!63927 (= lt!133802 (choose!1294 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun e!171293 () Bool)

(assert (=> d!63927 e!171293))

(declare-fun res!129022 () Bool)

(assert (=> d!63927 (=> (not res!129022) (not e!171293))))

(assert (=> d!63927 (= res!129022 (isStrictlySorted!377 lt!133452))))

(assert (=> d!63927 (= (lemmaContainsTupThenGetReturnValue!176 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133802)))

(declare-fun b!264384 () Bool)

(declare-fun res!129023 () Bool)

(assert (=> b!264384 (=> (not res!129023) (not e!171293))))

(assert (=> b!264384 (= res!129023 (containsKey!312 lt!133452 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264385 () Bool)

(assert (=> b!264385 (= e!171293 (contains!1914 lt!133452 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(assert (= (and d!63927 res!129022) b!264384))

(assert (= (and b!264384 res!129023) b!264385))

(assert (=> d!63927 m!279889))

(declare-fun m!281309 () Bool)

(assert (=> d!63927 m!281309))

(declare-fun m!281311 () Bool)

(assert (=> d!63927 m!281311))

(declare-fun m!281313 () Bool)

(assert (=> b!264384 m!281313))

(declare-fun m!281315 () Bool)

(assert (=> b!264385 m!281315))

(assert (=> d!63317 d!63927))

(declare-fun bm!25293 () Bool)

(declare-fun call!25298 () List!3852)

(declare-fun call!25297 () List!3852)

(assert (=> bm!25293 (= call!25298 call!25297)))

(declare-fun bm!25294 () Bool)

(declare-fun call!25296 () List!3852)

(assert (=> bm!25294 (= call!25296 call!25298)))

(declare-fun b!264386 () Bool)

(declare-fun res!129024 () Bool)

(declare-fun e!171298 () Bool)

(assert (=> b!264386 (=> (not res!129024) (not e!171298))))

(declare-fun lt!133803 () List!3852)

(assert (=> b!264386 (= res!129024 (containsKey!312 lt!133803 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264387 () Bool)

(declare-fun c!45233 () Bool)

(assert (=> b!264387 (= c!45233 (and ((_ is Cons!3848) (toList!1961 lt!133207)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133207))) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(declare-fun e!171297 () List!3852)

(declare-fun e!171294 () List!3852)

(assert (=> b!264387 (= e!171297 e!171294)))

(declare-fun b!264388 () Bool)

(declare-fun e!171296 () List!3852)

(assert (=> b!264388 (= e!171296 e!171297)))

(declare-fun c!45236 () Bool)

(assert (=> b!264388 (= c!45236 (and ((_ is Cons!3848) (toList!1961 lt!133207)) (= (_1!2500 (h!4514 (toList!1961 lt!133207))) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!264389 () Bool)

(assert (=> b!264389 (= e!171298 (contains!1914 lt!133803 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(declare-fun b!264390 () Bool)

(assert (=> b!264390 (= e!171296 call!25297)))

(declare-fun b!264391 () Bool)

(assert (=> b!264391 (= e!171297 call!25298)))

(declare-fun b!264392 () Bool)

(declare-fun e!171295 () List!3852)

(assert (=> b!264392 (= e!171295 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133207)) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264393 () Bool)

(assert (=> b!264393 (= e!171294 call!25296)))

(declare-fun bm!25295 () Bool)

(declare-fun c!45235 () Bool)

(assert (=> bm!25295 (= call!25297 ($colon$colon!108 e!171295 (ite c!45235 (h!4514 (toList!1961 lt!133207)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))))

(declare-fun c!45234 () Bool)

(assert (=> bm!25295 (= c!45234 c!45235)))

(declare-fun d!63929 () Bool)

(assert (=> d!63929 e!171298))

(declare-fun res!129025 () Bool)

(assert (=> d!63929 (=> (not res!129025) (not e!171298))))

(assert (=> d!63929 (= res!129025 (isStrictlySorted!377 lt!133803))))

(assert (=> d!63929 (= lt!133803 e!171296)))

(assert (=> d!63929 (= c!45235 (and ((_ is Cons!3848) (toList!1961 lt!133207)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133207))) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63929 (isStrictlySorted!377 (toList!1961 lt!133207))))

(assert (=> d!63929 (= (insertStrictlySorted!179 (toList!1961 lt!133207) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) lt!133803)))

(declare-fun b!264394 () Bool)

(assert (=> b!264394 (= e!171294 call!25296)))

(declare-fun b!264395 () Bool)

(assert (=> b!264395 (= e!171295 (ite c!45236 (t!8929 (toList!1961 lt!133207)) (ite c!45233 (Cons!3848 (h!4514 (toList!1961 lt!133207)) (t!8929 (toList!1961 lt!133207))) Nil!3849)))))

(assert (= (and d!63929 c!45235) b!264390))

(assert (= (and d!63929 (not c!45235)) b!264388))

(assert (= (and b!264388 c!45236) b!264391))

(assert (= (and b!264388 (not c!45236)) b!264387))

(assert (= (and b!264387 c!45233) b!264394))

(assert (= (and b!264387 (not c!45233)) b!264393))

(assert (= (or b!264394 b!264393) bm!25294))

(assert (= (or b!264391 bm!25294) bm!25293))

(assert (= (or b!264390 bm!25293) bm!25295))

(assert (= (and bm!25295 c!45234) b!264392))

(assert (= (and bm!25295 (not c!45234)) b!264395))

(assert (= (and d!63929 res!129025) b!264386))

(assert (= (and b!264386 res!129024) b!264389))

(declare-fun m!281317 () Bool)

(assert (=> bm!25295 m!281317))

(declare-fun m!281319 () Bool)

(assert (=> b!264392 m!281319))

(declare-fun m!281321 () Bool)

(assert (=> b!264389 m!281321))

(declare-fun m!281323 () Bool)

(assert (=> b!264386 m!281323))

(declare-fun m!281325 () Bool)

(assert (=> d!63929 m!281325))

(declare-fun m!281327 () Bool)

(assert (=> d!63929 m!281327))

(assert (=> d!63317 d!63929))

(declare-fun d!63931 () Bool)

(declare-fun e!171299 () Bool)

(assert (=> d!63931 e!171299))

(declare-fun res!129026 () Bool)

(assert (=> d!63931 (=> (not res!129026) (not e!171299))))

(declare-fun lt!133806 () ListLongMap!3891)

(assert (=> d!63931 (= res!129026 (contains!1912 lt!133806 (_1!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))))

(declare-fun lt!133807 () List!3852)

(assert (=> d!63931 (= lt!133806 (ListLongMap!3892 lt!133807))))

(declare-fun lt!133805 () Unit!8190)

(declare-fun lt!133804 () Unit!8190)

(assert (=> d!63931 (= lt!133805 lt!133804)))

(assert (=> d!63931 (= (getValueByKey!320 lt!133807 (_1!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))) (Some!325 (_2!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))))

(assert (=> d!63931 (= lt!133804 (lemmaContainsTupThenGetReturnValue!176 lt!133807 (_1!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))) (_2!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))))

(assert (=> d!63931 (= lt!133807 (insertStrictlySorted!179 (toList!1961 (ite c!45019 call!25245 (ite c!45016 call!25243 call!25244))) (_1!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))) (_2!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))))))

(assert (=> d!63931 (= (+!710 (ite c!45019 call!25245 (ite c!45016 call!25243 call!25244)) (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))) lt!133806)))

(declare-fun b!264396 () Bool)

(declare-fun res!129027 () Bool)

(assert (=> b!264396 (=> (not res!129027) (not e!171299))))

(assert (=> b!264396 (= res!129027 (= (getValueByKey!320 (toList!1961 lt!133806) (_1!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015))))) (Some!325 (_2!2500 (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))))

(declare-fun b!264397 () Bool)

(assert (=> b!264397 (= e!171299 (contains!1914 (toList!1961 lt!133806) (ite (or c!45019 c!45016) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 lt!133015)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 lt!133015)))))))

(assert (= (and d!63931 res!129026) b!264396))

(assert (= (and b!264396 res!129027) b!264397))

(declare-fun m!281329 () Bool)

(assert (=> d!63931 m!281329))

(declare-fun m!281331 () Bool)

(assert (=> d!63931 m!281331))

(declare-fun m!281333 () Bool)

(assert (=> d!63931 m!281333))

(declare-fun m!281335 () Bool)

(assert (=> d!63931 m!281335))

(declare-fun m!281337 () Bool)

(assert (=> b!264396 m!281337))

(declare-fun m!281339 () Bool)

(assert (=> b!264397 m!281339))

(assert (=> bm!25244 d!63931))

(declare-fun b!264400 () Bool)

(declare-fun e!171301 () Option!326)

(assert (=> b!264400 (= e!171301 (getValueByKey!320 (t!8929 (toList!1961 lt!133451)) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))

(declare-fun b!264398 () Bool)

(declare-fun e!171300 () Option!326)

(assert (=> b!264398 (= e!171300 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133451)))))))

(declare-fun d!63933 () Bool)

(declare-fun c!45237 () Bool)

(assert (=> d!63933 (= c!45237 (and ((_ is Cons!3848) (toList!1961 lt!133451)) (= (_1!2500 (h!4514 (toList!1961 lt!133451))) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))))))))

(assert (=> d!63933 (= (getValueByKey!320 (toList!1961 lt!133451) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))) e!171300)))

(declare-fun b!264401 () Bool)

(assert (=> b!264401 (= e!171301 None!324)))

(declare-fun b!264399 () Bool)

(assert (=> b!264399 (= e!171300 e!171301)))

(declare-fun c!45238 () Bool)

(assert (=> b!264399 (= c!45238 (and ((_ is Cons!3848) (toList!1961 lt!133451)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133451))) (_1!2500 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504)))))))))

(assert (= (and d!63933 c!45237) b!264398))

(assert (= (and d!63933 (not c!45237)) b!264399))

(assert (= (and b!264399 c!45238) b!264400))

(assert (= (and b!264399 (not c!45238)) b!264401))

(declare-fun m!281341 () Bool)

(assert (=> b!264400 m!281341))

(assert (=> b!263620 d!63933))

(assert (=> d!63219 d!63221))

(assert (=> d!63219 d!63223))

(declare-fun d!63935 () Bool)

(assert (=> d!63935 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133025) key!932))))

(assert (=> d!63935 true))

(declare-fun _$12!456 () Unit!8190)

(assert (=> d!63935 (= (choose!1293 (toList!1961 lt!133025) key!932) _$12!456)))

(declare-fun bs!9330 () Bool)

(assert (= bs!9330 d!63935))

(assert (=> bs!9330 m!279289))

(assert (=> bs!9330 m!279289))

(assert (=> bs!9330 m!279291))

(assert (=> d!63219 d!63935))

(declare-fun d!63937 () Bool)

(declare-fun res!129028 () Bool)

(declare-fun e!171302 () Bool)

(assert (=> d!63937 (=> res!129028 e!171302)))

(assert (=> d!63937 (= res!129028 (or ((_ is Nil!3849) (toList!1961 lt!133025)) ((_ is Nil!3849) (t!8929 (toList!1961 lt!133025)))))))

(assert (=> d!63937 (= (isStrictlySorted!377 (toList!1961 lt!133025)) e!171302)))

(declare-fun b!264402 () Bool)

(declare-fun e!171303 () Bool)

(assert (=> b!264402 (= e!171302 e!171303)))

(declare-fun res!129029 () Bool)

(assert (=> b!264402 (=> (not res!129029) (not e!171303))))

(assert (=> b!264402 (= res!129029 (bvslt (_1!2500 (h!4514 (toList!1961 lt!133025))) (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133025))))))))

(declare-fun b!264403 () Bool)

(assert (=> b!264403 (= e!171303 (isStrictlySorted!377 (t!8929 (toList!1961 lt!133025))))))

(assert (= (and d!63937 (not res!129028)) b!264402))

(assert (= (and b!264402 res!129029) b!264403))

(declare-fun m!281343 () Bool)

(assert (=> b!264403 m!281343))

(assert (=> d!63219 d!63937))

(declare-fun d!63939 () Bool)

(assert (=> d!63939 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133258) lt!133241)) (v!5508 (getValueByKey!320 (toList!1961 lt!133258) lt!133241)))))

(assert (=> d!63351 d!63939))

(declare-fun b!264406 () Bool)

(declare-fun e!171305 () Option!326)

(assert (=> b!264406 (= e!171305 (getValueByKey!320 (t!8929 (toList!1961 lt!133258)) lt!133241))))

(declare-fun b!264404 () Bool)

(declare-fun e!171304 () Option!326)

(assert (=> b!264404 (= e!171304 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133258)))))))

(declare-fun d!63941 () Bool)

(declare-fun c!45239 () Bool)

(assert (=> d!63941 (= c!45239 (and ((_ is Cons!3848) (toList!1961 lt!133258)) (= (_1!2500 (h!4514 (toList!1961 lt!133258))) lt!133241)))))

(assert (=> d!63941 (= (getValueByKey!320 (toList!1961 lt!133258) lt!133241) e!171304)))

(declare-fun b!264407 () Bool)

(assert (=> b!264407 (= e!171305 None!324)))

(declare-fun b!264405 () Bool)

(assert (=> b!264405 (= e!171304 e!171305)))

(declare-fun c!45240 () Bool)

(assert (=> b!264405 (= c!45240 (and ((_ is Cons!3848) (toList!1961 lt!133258)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133258))) lt!133241))))))

(assert (= (and d!63941 c!45239) b!264404))

(assert (= (and d!63941 (not c!45239)) b!264405))

(assert (= (and b!264405 c!45240) b!264406))

(assert (= (and b!264405 (not c!45240)) b!264407))

(declare-fun m!281345 () Bool)

(assert (=> b!264406 m!281345))

(assert (=> d!63351 d!63941))

(declare-fun d!63943 () Bool)

(declare-fun e!171306 () Bool)

(assert (=> d!63943 e!171306))

(declare-fun res!129030 () Bool)

(assert (=> d!63943 (=> res!129030 e!171306)))

(declare-fun lt!133809 () Bool)

(assert (=> d!63943 (= res!129030 (not lt!133809))))

(declare-fun lt!133808 () Bool)

(assert (=> d!63943 (= lt!133809 lt!133808)))

(declare-fun lt!133810 () Unit!8190)

(declare-fun e!171307 () Unit!8190)

(assert (=> d!63943 (= lt!133810 e!171307)))

(declare-fun c!45241 () Bool)

(assert (=> d!63943 (= c!45241 lt!133808)))

(assert (=> d!63943 (= lt!133808 (containsKey!312 (toList!1961 lt!133416) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> d!63943 (= (contains!1912 lt!133416 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) lt!133809)))

(declare-fun b!264408 () Bool)

(declare-fun lt!133811 () Unit!8190)

(assert (=> b!264408 (= e!171307 lt!133811)))

(assert (=> b!264408 (= lt!133811 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133416) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(assert (=> b!264408 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133416) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264409 () Bool)

(declare-fun Unit!8244 () Unit!8190)

(assert (=> b!264409 (= e!171307 Unit!8244)))

(declare-fun b!264410 () Bool)

(assert (=> b!264410 (= e!171306 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133416) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63943 c!45241) b!264408))

(assert (= (and d!63943 (not c!45241)) b!264409))

(assert (= (and d!63943 (not res!129030)) b!264410))

(declare-fun m!281347 () Bool)

(assert (=> d!63943 m!281347))

(declare-fun m!281349 () Bool)

(assert (=> b!264408 m!281349))

(assert (=> b!264408 m!279753))

(assert (=> b!264408 m!279753))

(declare-fun m!281351 () Bool)

(assert (=> b!264408 m!281351))

(assert (=> b!264410 m!279753))

(assert (=> b!264410 m!279753))

(assert (=> b!264410 m!281351))

(assert (=> d!63257 d!63943))

(declare-fun e!171309 () Option!326)

(declare-fun b!264413 () Bool)

(assert (=> b!264413 (= e!171309 (getValueByKey!320 (t!8929 lt!133417) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264411 () Bool)

(declare-fun e!171308 () Option!326)

(assert (=> b!264411 (= e!171308 (Some!325 (_2!2500 (h!4514 lt!133417))))))

(declare-fun c!45242 () Bool)

(declare-fun d!63945 () Bool)

(assert (=> d!63945 (= c!45242 (and ((_ is Cons!3848) lt!133417) (= (_1!2500 (h!4514 lt!133417)) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (=> d!63945 (= (getValueByKey!320 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) e!171308)))

(declare-fun b!264414 () Bool)

(assert (=> b!264414 (= e!171309 None!324)))

(declare-fun b!264412 () Bool)

(assert (=> b!264412 (= e!171308 e!171309)))

(declare-fun c!45243 () Bool)

(assert (=> b!264412 (= c!45243 (and ((_ is Cons!3848) lt!133417) (not (= (_1!2500 (h!4514 lt!133417)) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))))

(assert (= (and d!63945 c!45242) b!264411))

(assert (= (and d!63945 (not c!45242)) b!264412))

(assert (= (and b!264412 c!45243) b!264413))

(assert (= (and b!264412 (not c!45243)) b!264414))

(declare-fun m!281353 () Bool)

(assert (=> b!264413 m!281353))

(assert (=> d!63257 d!63945))

(declare-fun d!63947 () Bool)

(assert (=> d!63947 (= (getValueByKey!320 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) (Some!325 (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun lt!133812 () Unit!8190)

(assert (=> d!63947 (= lt!133812 (choose!1294 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun e!171310 () Bool)

(assert (=> d!63947 e!171310))

(declare-fun res!129031 () Bool)

(assert (=> d!63947 (=> (not res!129031) (not e!171310))))

(assert (=> d!63947 (= res!129031 (isStrictlySorted!377 lt!133417))))

(assert (=> d!63947 (= (lemmaContainsTupThenGetReturnValue!176 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) lt!133812)))

(declare-fun b!264415 () Bool)

(declare-fun res!129032 () Bool)

(assert (=> b!264415 (=> (not res!129032) (not e!171310))))

(assert (=> b!264415 (= res!129032 (containsKey!312 lt!133417 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264416 () Bool)

(assert (=> b!264416 (= e!171310 (contains!1914 lt!133417 (tuple2!4979 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!63947 res!129031) b!264415))

(assert (= (and b!264415 res!129032) b!264416))

(assert (=> d!63947 m!279747))

(declare-fun m!281355 () Bool)

(assert (=> d!63947 m!281355))

(declare-fun m!281357 () Bool)

(assert (=> d!63947 m!281357))

(declare-fun m!281359 () Bool)

(assert (=> b!264415 m!281359))

(declare-fun m!281361 () Bool)

(assert (=> b!264416 m!281361))

(assert (=> d!63257 d!63947))

(declare-fun bm!25296 () Bool)

(declare-fun call!25301 () List!3852)

(declare-fun call!25300 () List!3852)

(assert (=> bm!25296 (= call!25301 call!25300)))

(declare-fun bm!25297 () Bool)

(declare-fun call!25299 () List!3852)

(assert (=> bm!25297 (= call!25299 call!25301)))

(declare-fun b!264417 () Bool)

(declare-fun res!129033 () Bool)

(declare-fun e!171315 () Bool)

(assert (=> b!264417 (=> (not res!129033) (not e!171315))))

(declare-fun lt!133813 () List!3852)

(assert (=> b!264417 (= res!129033 (containsKey!312 lt!133813 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun c!45244 () Bool)

(declare-fun b!264418 () Bool)

(assert (=> b!264418 (= c!45244 (and ((_ is Cons!3848) (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (bvsgt (_1!2500 (h!4514 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun e!171314 () List!3852)

(declare-fun e!171311 () List!3852)

(assert (=> b!264418 (= e!171314 e!171311)))

(declare-fun b!264419 () Bool)

(declare-fun e!171313 () List!3852)

(assert (=> b!264419 (= e!171313 e!171314)))

(declare-fun c!45247 () Bool)

(assert (=> b!264419 (= c!45247 (and ((_ is Cons!3848) (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (= (_1!2500 (h!4514 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!264420 () Bool)

(assert (=> b!264420 (= e!171315 (contains!1914 lt!133813 (tuple2!4979 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(declare-fun b!264421 () Bool)

(assert (=> b!264421 (= e!171313 call!25300)))

(declare-fun b!264422 () Bool)

(assert (=> b!264422 (= e!171314 call!25301)))

(declare-fun b!264423 () Bool)

(declare-fun e!171312 () List!3852)

(assert (=> b!264423 (= e!171312 (insertStrictlySorted!179 (t!8929 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264424 () Bool)

(assert (=> b!264424 (= e!171311 call!25299)))

(declare-fun bm!25298 () Bool)

(declare-fun c!45246 () Bool)

(assert (=> bm!25298 (= call!25300 ($colon$colon!108 e!171312 (ite c!45246 (h!4514 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (tuple2!4979 (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))))

(declare-fun c!45245 () Bool)

(assert (=> bm!25298 (= c!45245 c!45246)))

(declare-fun d!63949 () Bool)

(assert (=> d!63949 e!171315))

(declare-fun res!129034 () Bool)

(assert (=> d!63949 (=> (not res!129034) (not e!171315))))

(assert (=> d!63949 (= res!129034 (isStrictlySorted!377 lt!133813))))

(assert (=> d!63949 (= lt!133813 e!171313)))

(assert (=> d!63949 (= c!45246 (and ((_ is Cons!3848) (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (bvslt (_1!2500 (h!4514 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (=> d!63949 (isStrictlySorted!377 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))))))

(assert (=> d!63949 (= (insertStrictlySorted!179 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))) (_2!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) lt!133813)))

(declare-fun b!264425 () Bool)

(assert (=> b!264425 (= e!171311 call!25299)))

(declare-fun b!264426 () Bool)

(assert (=> b!264426 (= e!171312 (ite c!45247 (t!8929 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (ite c!45244 (Cons!3848 (h!4514 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176)))) (t!8929 (toList!1961 (ite c!44872 call!25177 (ite c!44869 call!25175 call!25176))))) Nil!3849)))))

(assert (= (and d!63949 c!45246) b!264421))

(assert (= (and d!63949 (not c!45246)) b!264419))

(assert (= (and b!264419 c!45247) b!264422))

(assert (= (and b!264419 (not c!45247)) b!264418))

(assert (= (and b!264418 c!45244) b!264425))

(assert (= (and b!264418 (not c!45244)) b!264424))

(assert (= (or b!264425 b!264424) bm!25297))

(assert (= (or b!264422 bm!25297) bm!25296))

(assert (= (or b!264421 bm!25296) bm!25298))

(assert (= (and bm!25298 c!45245) b!264423))

(assert (= (and bm!25298 (not c!45245)) b!264426))

(assert (= (and d!63949 res!129034) b!264417))

(assert (= (and b!264417 res!129033) b!264420))

(declare-fun m!281363 () Bool)

(assert (=> bm!25298 m!281363))

(declare-fun m!281365 () Bool)

(assert (=> b!264423 m!281365))

(declare-fun m!281367 () Bool)

(assert (=> b!264420 m!281367))

(declare-fun m!281369 () Bool)

(assert (=> b!264417 m!281369))

(declare-fun m!281371 () Bool)

(assert (=> d!63949 m!281371))

(declare-fun m!281373 () Bool)

(assert (=> d!63949 m!281373))

(assert (=> d!63257 d!63949))

(declare-fun d!63951 () Bool)

(assert (=> d!63951 (= (apply!262 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))) lt!133198) (apply!262 lt!133193 lt!133198))))

(assert (=> d!63951 true))

(declare-fun _$34!1137 () Unit!8190)

(assert (=> d!63951 (= (choose!1295 lt!133193 lt!133194 (zeroValue!4684 thiss!1504) lt!133198) _$34!1137)))

(declare-fun bs!9331 () Bool)

(assert (= bs!9331 d!63951))

(assert (=> bs!9331 m!279223))

(assert (=> bs!9331 m!279223))

(assert (=> bs!9331 m!279227))

(assert (=> bs!9331 m!279243))

(assert (=> d!63291 d!63951))

(declare-fun d!63953 () Bool)

(declare-fun e!171316 () Bool)

(assert (=> d!63953 e!171316))

(declare-fun res!129035 () Bool)

(assert (=> d!63953 (=> res!129035 e!171316)))

(declare-fun lt!133815 () Bool)

(assert (=> d!63953 (= res!129035 (not lt!133815))))

(declare-fun lt!133814 () Bool)

(assert (=> d!63953 (= lt!133815 lt!133814)))

(declare-fun lt!133816 () Unit!8190)

(declare-fun e!171317 () Unit!8190)

(assert (=> d!63953 (= lt!133816 e!171317)))

(declare-fun c!45248 () Bool)

(assert (=> d!63953 (= c!45248 lt!133814)))

(assert (=> d!63953 (= lt!133814 (containsKey!312 (toList!1961 lt!133193) lt!133198))))

(assert (=> d!63953 (= (contains!1912 lt!133193 lt!133198) lt!133815)))

(declare-fun b!264427 () Bool)

(declare-fun lt!133817 () Unit!8190)

(assert (=> b!264427 (= e!171317 lt!133817)))

(assert (=> b!264427 (= lt!133817 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133193) lt!133198))))

(assert (=> b!264427 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133193) lt!133198))))

(declare-fun b!264428 () Bool)

(declare-fun Unit!8245 () Unit!8190)

(assert (=> b!264428 (= e!171317 Unit!8245)))

(declare-fun b!264429 () Bool)

(assert (=> b!264429 (= e!171316 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133193) lt!133198)))))

(assert (= (and d!63953 c!45248) b!264427))

(assert (= (and d!63953 (not c!45248)) b!264428))

(assert (= (and d!63953 (not res!129035)) b!264429))

(declare-fun m!281375 () Bool)

(assert (=> d!63953 m!281375))

(declare-fun m!281377 () Bool)

(assert (=> b!264427 m!281377))

(assert (=> b!264427 m!279859))

(assert (=> b!264427 m!279859))

(declare-fun m!281379 () Bool)

(assert (=> b!264427 m!281379))

(assert (=> b!264429 m!279859))

(assert (=> b!264429 m!279859))

(assert (=> b!264429 m!281379))

(assert (=> d!63291 d!63953))

(assert (=> d!63291 d!63301))

(assert (=> d!63291 d!63303))

(assert (=> d!63291 d!63307))

(assert (=> b!263660 d!63789))

(assert (=> b!263660 d!63245))

(declare-fun d!63955 () Bool)

(declare-fun lt!133818 () Bool)

(assert (=> d!63955 (= lt!133818 (select (content!177 Nil!3850) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!171318 () Bool)

(assert (=> d!63955 (= lt!133818 e!171318)))

(declare-fun res!129037 () Bool)

(assert (=> d!63955 (=> (not res!129037) (not e!171318))))

(assert (=> d!63955 (= res!129037 ((_ is Cons!3849) Nil!3850))))

(assert (=> d!63955 (= (contains!1915 Nil!3850 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) lt!133818)))

(declare-fun b!264430 () Bool)

(declare-fun e!171319 () Bool)

(assert (=> b!264430 (= e!171318 e!171319)))

(declare-fun res!129036 () Bool)

(assert (=> b!264430 (=> res!129036 e!171319)))

(assert (=> b!264430 (= res!129036 (= (h!4515 Nil!3850) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!264431 () Bool)

(assert (=> b!264431 (= e!171319 (contains!1915 (t!8930 Nil!3850) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!63955 res!129037) b!264430))

(assert (= (and b!264430 (not res!129036)) b!264431))

(assert (=> d!63955 m!279469))

(assert (=> d!63955 m!279647))

(declare-fun m!281381 () Bool)

(assert (=> d!63955 m!281381))

(assert (=> b!264431 m!279647))

(declare-fun m!281383 () Bool)

(assert (=> b!264431 m!281383))

(assert (=> b!263579 d!63955))

(declare-fun d!63957 () Bool)

(declare-fun e!171320 () Bool)

(assert (=> d!63957 e!171320))

(declare-fun res!129038 () Bool)

(assert (=> d!63957 (=> res!129038 e!171320)))

(declare-fun lt!133820 () Bool)

(assert (=> d!63957 (= res!129038 (not lt!133820))))

(declare-fun lt!133819 () Bool)

(assert (=> d!63957 (= lt!133820 lt!133819)))

(declare-fun lt!133821 () Unit!8190)

(declare-fun e!171321 () Unit!8190)

(assert (=> d!63957 (= lt!133821 e!171321)))

(declare-fun c!45249 () Bool)

(assert (=> d!63957 (= c!45249 lt!133819)))

(assert (=> d!63957 (= lt!133819 (containsKey!312 (toList!1961 lt!133352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63957 (= (contains!1912 lt!133352 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133820)))

(declare-fun b!264432 () Bool)

(declare-fun lt!133822 () Unit!8190)

(assert (=> b!264432 (= e!171321 lt!133822)))

(assert (=> b!264432 (= lt!133822 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264432 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264433 () Bool)

(declare-fun Unit!8246 () Unit!8190)

(assert (=> b!264433 (= e!171321 Unit!8246)))

(declare-fun b!264434 () Bool)

(assert (=> b!264434 (= e!171320 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63957 c!45249) b!264432))

(assert (= (and d!63957 (not c!45249)) b!264433))

(assert (= (and d!63957 (not res!129038)) b!264434))

(declare-fun m!281385 () Bool)

(assert (=> d!63957 m!281385))

(declare-fun m!281387 () Bool)

(assert (=> b!264432 m!281387))

(declare-fun m!281389 () Bool)

(assert (=> b!264432 m!281389))

(assert (=> b!264432 m!281389))

(declare-fun m!281391 () Bool)

(assert (=> b!264432 m!281391))

(assert (=> b!264434 m!281389))

(assert (=> b!264434 m!281389))

(assert (=> b!264434 m!281391))

(assert (=> b!263429 d!63957))

(declare-fun d!63959 () Bool)

(declare-fun e!171322 () Bool)

(assert (=> d!63959 e!171322))

(declare-fun res!129039 () Bool)

(assert (=> d!63959 (=> res!129039 e!171322)))

(declare-fun lt!133824 () Bool)

(assert (=> d!63959 (= res!129039 (not lt!133824))))

(declare-fun lt!133823 () Bool)

(assert (=> d!63959 (= lt!133824 lt!133823)))

(declare-fun lt!133825 () Unit!8190)

(declare-fun e!171323 () Unit!8190)

(assert (=> d!63959 (= lt!133825 e!171323)))

(declare-fun c!45250 () Bool)

(assert (=> d!63959 (= c!45250 lt!133823)))

(assert (=> d!63959 (= lt!133823 (containsKey!312 (toList!1961 lt!133386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63959 (= (contains!1912 lt!133386 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133824)))

(declare-fun b!264435 () Bool)

(declare-fun lt!133826 () Unit!8190)

(assert (=> b!264435 (= e!171323 lt!133826)))

(assert (=> b!264435 (= lt!133826 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264435 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264436 () Bool)

(declare-fun Unit!8247 () Unit!8190)

(assert (=> b!264436 (= e!171323 Unit!8247)))

(declare-fun b!264437 () Bool)

(assert (=> b!264437 (= e!171322 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63959 c!45250) b!264435))

(assert (= (and d!63959 (not c!45250)) b!264436))

(assert (= (and d!63959 (not res!129039)) b!264437))

(declare-fun m!281393 () Bool)

(assert (=> d!63959 m!281393))

(declare-fun m!281395 () Bool)

(assert (=> b!264435 m!281395))

(assert (=> b!264435 m!280621))

(assert (=> b!264435 m!280621))

(declare-fun m!281397 () Bool)

(assert (=> b!264435 m!281397))

(assert (=> b!264437 m!280621))

(assert (=> b!264437 m!280621))

(assert (=> b!264437 m!281397))

(assert (=> bm!25217 d!63959))

(declare-fun d!63961 () Bool)

(assert (=> d!63961 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!5508 (getValueByKey!320 (toList!1961 lt!133256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63285 d!63961))

(assert (=> d!63285 d!63873))

(declare-fun d!63963 () Bool)

(assert (=> d!63963 (= (get!3094 (getValueByKey!320 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133198)) (v!5508 (getValueByKey!320 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133198)))))

(assert (=> d!63303 d!63963))

(declare-fun e!171325 () Option!326)

(declare-fun b!264440 () Bool)

(assert (=> b!264440 (= e!171325 (getValueByKey!320 (t!8929 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))) lt!133198))))

(declare-fun e!171324 () Option!326)

(declare-fun b!264438 () Bool)

(assert (=> b!264438 (= e!171324 (Some!325 (_2!2500 (h!4514 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))))))))

(declare-fun c!45251 () Bool)

(declare-fun d!63965 () Bool)

(assert (=> d!63965 (= c!45251 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))) (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))) lt!133198)))))

(assert (=> d!63965 (= (getValueByKey!320 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))) lt!133198) e!171324)))

(declare-fun b!264441 () Bool)

(assert (=> b!264441 (= e!171325 None!324)))

(declare-fun b!264439 () Bool)

(assert (=> b!264439 (= e!171324 e!171325)))

(declare-fun c!45252 () Bool)

(assert (=> b!264439 (= c!45252 (and ((_ is Cons!3848) (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504))))) (not (= (_1!2500 (h!4514 (toList!1961 (+!710 lt!133193 (tuple2!4979 lt!133194 (zeroValue!4684 thiss!1504)))))) lt!133198))))))

(assert (= (and d!63965 c!45251) b!264438))

(assert (= (and d!63965 (not c!45251)) b!264439))

(assert (= (and b!264439 c!45252) b!264440))

(assert (= (and b!264439 (not c!45252)) b!264441))

(declare-fun m!281399 () Bool)

(assert (=> b!264440 m!281399))

(assert (=> d!63303 d!63965))

(declare-fun d!63967 () Bool)

(declare-fun c!45253 () Bool)

(assert (=> d!63967 (= c!45253 ((_ is Nil!3849) (toList!1961 lt!133127)))))

(declare-fun e!171326 () (InoxSet tuple2!4978))

(assert (=> d!63967 (= (content!176 (toList!1961 lt!133127)) e!171326)))

(declare-fun b!264442 () Bool)

(assert (=> b!264442 (= e!171326 ((as const (Array tuple2!4978 Bool)) false))))

(declare-fun b!264443 () Bool)

(assert (=> b!264443 (= e!171326 ((_ map or) (store ((as const (Array tuple2!4978 Bool)) false) (h!4514 (toList!1961 lt!133127)) true) (content!176 (t!8929 (toList!1961 lt!133127)))))))

(assert (= (and d!63967 c!45253) b!264442))

(assert (= (and d!63967 (not c!45253)) b!264443))

(declare-fun m!281401 () Bool)

(assert (=> b!264443 m!281401))

(declare-fun m!281403 () Bool)

(assert (=> b!264443 m!281403))

(assert (=> d!63157 d!63967))

(declare-fun d!63969 () Bool)

(declare-fun e!171327 () Bool)

(assert (=> d!63969 e!171327))

(declare-fun res!129040 () Bool)

(assert (=> d!63969 (=> res!129040 e!171327)))

(declare-fun lt!133828 () Bool)

(assert (=> d!63969 (= res!129040 (not lt!133828))))

(declare-fun lt!133827 () Bool)

(assert (=> d!63969 (= lt!133828 lt!133827)))

(declare-fun lt!133829 () Unit!8190)

(declare-fun e!171328 () Unit!8190)

(assert (=> d!63969 (= lt!133829 e!171328)))

(declare-fun c!45254 () Bool)

(assert (=> d!63969 (= c!45254 lt!133827)))

(assert (=> d!63969 (= lt!133827 (containsKey!312 (toList!1961 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353))) lt!133355))))

(assert (=> d!63969 (= (contains!1912 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353)) lt!133355) lt!133828)))

(declare-fun b!264444 () Bool)

(declare-fun lt!133830 () Unit!8190)

(assert (=> b!264444 (= e!171328 lt!133830)))

(assert (=> b!264444 (= lt!133830 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353))) lt!133355))))

(assert (=> b!264444 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353))) lt!133355))))

(declare-fun b!264445 () Bool)

(declare-fun Unit!8248 () Unit!8190)

(assert (=> b!264445 (= e!171328 Unit!8248)))

(declare-fun b!264446 () Bool)

(assert (=> b!264446 (= e!171327 (isDefined!261 (getValueByKey!320 (toList!1961 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353))) lt!133355)))))

(assert (= (and d!63969 c!45254) b!264444))

(assert (= (and d!63969 (not c!45254)) b!264445))

(assert (= (and d!63969 (not res!129040)) b!264446))

(declare-fun m!281405 () Bool)

(assert (=> d!63969 m!281405))

(declare-fun m!281407 () Bool)

(assert (=> b!264444 m!281407))

(declare-fun m!281409 () Bool)

(assert (=> b!264444 m!281409))

(assert (=> b!264444 m!281409))

(declare-fun m!281411 () Bool)

(assert (=> b!264444 m!281411))

(assert (=> b!264446 m!281409))

(assert (=> b!264446 m!281409))

(assert (=> b!264446 m!281411))

(assert (=> b!263436 d!63969))

(declare-fun d!63971 () Bool)

(assert (=> d!63971 (not (contains!1912 (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353)) lt!133355))))

(declare-fun lt!133831 () Unit!8190)

(assert (=> d!63971 (= lt!133831 (choose!1297 lt!133357 lt!133356 lt!133353 lt!133355))))

(declare-fun e!171329 () Bool)

(assert (=> d!63971 e!171329))

(declare-fun res!129041 () Bool)

(assert (=> d!63971 (=> (not res!129041) (not e!171329))))

(assert (=> d!63971 (= res!129041 (not (contains!1912 lt!133357 lt!133355)))))

(assert (=> d!63971 (= (addStillNotContains!129 lt!133357 lt!133356 lt!133353 lt!133355) lt!133831)))

(declare-fun b!264447 () Bool)

(assert (=> b!264447 (= e!171329 (not (= lt!133356 lt!133355)))))

(assert (= (and d!63971 res!129041) b!264447))

(assert (=> d!63971 m!279577))

(assert (=> d!63971 m!279577))

(assert (=> d!63971 m!279579))

(declare-fun m!281413 () Bool)

(assert (=> d!63971 m!281413))

(declare-fun m!281415 () Bool)

(assert (=> d!63971 m!281415))

(assert (=> b!263436 d!63971))

(assert (=> b!263436 d!63193))

(declare-fun d!63973 () Bool)

(declare-fun e!171330 () Bool)

(assert (=> d!63973 e!171330))

(declare-fun res!129042 () Bool)

(assert (=> d!63973 (=> (not res!129042) (not e!171330))))

(declare-fun lt!133834 () ListLongMap!3891)

(assert (=> d!63973 (= res!129042 (contains!1912 lt!133834 (_1!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!133835 () List!3852)

(assert (=> d!63973 (= lt!133834 (ListLongMap!3892 lt!133835))))

(declare-fun lt!133833 () Unit!8190)

(declare-fun lt!133832 () Unit!8190)

(assert (=> d!63973 (= lt!133833 lt!133832)))

(assert (=> d!63973 (= (getValueByKey!320 lt!133835 (_1!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!325 (_2!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63973 (= lt!133832 (lemmaContainsTupThenGetReturnValue!176 lt!133835 (_1!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63973 (= lt!133835 (insertStrictlySorted!179 (toList!1961 call!25212) (_1!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63973 (= (+!710 call!25212 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!133834)))

(declare-fun b!264448 () Bool)

(declare-fun res!129043 () Bool)

(assert (=> b!264448 (=> (not res!129043) (not e!171330))))

(assert (=> b!264448 (= res!129043 (= (getValueByKey!320 (toList!1961 lt!133834) (_1!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!325 (_2!2500 (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!264449 () Bool)

(assert (=> b!264449 (= e!171330 (contains!1914 (toList!1961 lt!133834) (tuple2!4979 (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000) (get!3093 (select (arr!5998 (_values!4826 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!63973 res!129042) b!264448))

(assert (= (and b!264448 res!129043) b!264449))

(declare-fun m!281417 () Bool)

(assert (=> d!63973 m!281417))

(declare-fun m!281419 () Bool)

(assert (=> d!63973 m!281419))

(declare-fun m!281421 () Bool)

(assert (=> d!63973 m!281421))

(declare-fun m!281423 () Bool)

(assert (=> d!63973 m!281423))

(declare-fun m!281425 () Bool)

(assert (=> b!264448 m!281425))

(declare-fun m!281427 () Bool)

(assert (=> b!264449 m!281427))

(assert (=> b!263436 d!63973))

(declare-fun d!63975 () Bool)

(declare-fun e!171331 () Bool)

(assert (=> d!63975 e!171331))

(declare-fun res!129044 () Bool)

(assert (=> d!63975 (=> (not res!129044) (not e!171331))))

(declare-fun lt!133838 () ListLongMap!3891)

(assert (=> d!63975 (= res!129044 (contains!1912 lt!133838 (_1!2500 (tuple2!4979 lt!133356 lt!133353))))))

(declare-fun lt!133839 () List!3852)

(assert (=> d!63975 (= lt!133838 (ListLongMap!3892 lt!133839))))

(declare-fun lt!133837 () Unit!8190)

(declare-fun lt!133836 () Unit!8190)

(assert (=> d!63975 (= lt!133837 lt!133836)))

(assert (=> d!63975 (= (getValueByKey!320 lt!133839 (_1!2500 (tuple2!4979 lt!133356 lt!133353))) (Some!325 (_2!2500 (tuple2!4979 lt!133356 lt!133353))))))

(assert (=> d!63975 (= lt!133836 (lemmaContainsTupThenGetReturnValue!176 lt!133839 (_1!2500 (tuple2!4979 lt!133356 lt!133353)) (_2!2500 (tuple2!4979 lt!133356 lt!133353))))))

(assert (=> d!63975 (= lt!133839 (insertStrictlySorted!179 (toList!1961 lt!133357) (_1!2500 (tuple2!4979 lt!133356 lt!133353)) (_2!2500 (tuple2!4979 lt!133356 lt!133353))))))

(assert (=> d!63975 (= (+!710 lt!133357 (tuple2!4979 lt!133356 lt!133353)) lt!133838)))

(declare-fun b!264450 () Bool)

(declare-fun res!129045 () Bool)

(assert (=> b!264450 (=> (not res!129045) (not e!171331))))

(assert (=> b!264450 (= res!129045 (= (getValueByKey!320 (toList!1961 lt!133838) (_1!2500 (tuple2!4979 lt!133356 lt!133353))) (Some!325 (_2!2500 (tuple2!4979 lt!133356 lt!133353)))))))

(declare-fun b!264451 () Bool)

(assert (=> b!264451 (= e!171331 (contains!1914 (toList!1961 lt!133838) (tuple2!4979 lt!133356 lt!133353)))))

(assert (= (and d!63975 res!129044) b!264450))

(assert (= (and b!264450 res!129045) b!264451))

(declare-fun m!281429 () Bool)

(assert (=> d!63975 m!281429))

(declare-fun m!281431 () Bool)

(assert (=> d!63975 m!281431))

(declare-fun m!281433 () Bool)

(assert (=> d!63975 m!281433))

(declare-fun m!281435 () Bool)

(assert (=> d!63975 m!281435))

(declare-fun m!281437 () Bool)

(assert (=> b!264450 m!281437))

(declare-fun m!281439 () Bool)

(assert (=> b!264451 m!281439))

(assert (=> b!263436 d!63975))

(declare-fun d!63977 () Bool)

(declare-fun lt!133840 () Bool)

(assert (=> d!63977 (= lt!133840 (select (content!176 (toList!1961 lt!133472)) (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))

(declare-fun e!171333 () Bool)

(assert (=> d!63977 (= lt!133840 e!171333)))

(declare-fun res!129047 () Bool)

(assert (=> d!63977 (=> (not res!129047) (not e!171333))))

(assert (=> d!63977 (= res!129047 ((_ is Cons!3848) (toList!1961 lt!133472)))))

(assert (=> d!63977 (= (contains!1914 (toList!1961 lt!133472) (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) lt!133840)))

(declare-fun b!264452 () Bool)

(declare-fun e!171332 () Bool)

(assert (=> b!264452 (= e!171333 e!171332)))

(declare-fun res!129046 () Bool)

(assert (=> b!264452 (=> res!129046 e!171332)))

(assert (=> b!264452 (= res!129046 (= (h!4514 (toList!1961 lt!133472)) (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))

(declare-fun b!264453 () Bool)

(assert (=> b!264453 (= e!171332 (contains!1914 (t!8929 (toList!1961 lt!133472)) (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))

(assert (= (and d!63977 res!129047) b!264452))

(assert (= (and b!264452 (not res!129046)) b!264453))

(declare-fun m!281441 () Bool)

(assert (=> d!63977 m!281441))

(declare-fun m!281443 () Bool)

(assert (=> d!63977 m!281443))

(declare-fun m!281445 () Bool)

(assert (=> b!264453 m!281445))

(assert (=> b!263651 d!63977))

(assert (=> d!63347 d!63345))

(declare-fun d!63979 () Bool)

(declare-fun e!171334 () Bool)

(assert (=> d!63979 e!171334))

(declare-fun res!129048 () Bool)

(assert (=> d!63979 (=> res!129048 e!171334)))

(declare-fun lt!133842 () Bool)

(assert (=> d!63979 (= res!129048 (not lt!133842))))

(declare-fun lt!133841 () Bool)

(assert (=> d!63979 (= lt!133842 lt!133841)))

(declare-fun lt!133843 () Unit!8190)

(declare-fun e!171335 () Unit!8190)

(assert (=> d!63979 (= lt!133843 e!171335)))

(declare-fun c!45255 () Bool)

(assert (=> d!63979 (= c!45255 lt!133841)))

(assert (=> d!63979 (= lt!133841 (containsKey!312 (toList!1961 lt!133248) lt!133253))))

(assert (=> d!63979 (= (contains!1912 lt!133248 lt!133253) lt!133842)))

(declare-fun b!264454 () Bool)

(declare-fun lt!133844 () Unit!8190)

(assert (=> b!264454 (= e!171335 lt!133844)))

(assert (=> b!264454 (= lt!133844 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133248) lt!133253))))

(assert (=> b!264454 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133248) lt!133253))))

(declare-fun b!264455 () Bool)

(declare-fun Unit!8249 () Unit!8190)

(assert (=> b!264455 (= e!171335 Unit!8249)))

(declare-fun b!264456 () Bool)

(assert (=> b!264456 (= e!171334 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133248) lt!133253)))))

(assert (= (and d!63979 c!45255) b!264454))

(assert (= (and d!63979 (not c!45255)) b!264455))

(assert (= (and d!63979 (not res!129048)) b!264456))

(declare-fun m!281447 () Bool)

(assert (=> d!63979 m!281447))

(declare-fun m!281449 () Bool)

(assert (=> b!264454 m!281449))

(assert (=> b!264454 m!279981))

(assert (=> b!264454 m!279981))

(declare-fun m!281451 () Bool)

(assert (=> b!264454 m!281451))

(assert (=> b!264456 m!279981))

(assert (=> b!264456 m!279981))

(assert (=> b!264456 m!281451))

(assert (=> d!63347 d!63979))

(assert (=> d!63347 d!63339))

(declare-fun d!63981 () Bool)

(assert (=> d!63981 (= (apply!262 (+!710 lt!133248 (tuple2!4979 lt!133249 (zeroValue!4684 thiss!1504))) lt!133253) (apply!262 lt!133248 lt!133253))))

(assert (=> d!63981 true))

(declare-fun _$34!1138 () Unit!8190)

(assert (=> d!63981 (= (choose!1295 lt!133248 lt!133249 (zeroValue!4684 thiss!1504) lt!133253) _$34!1138)))

(declare-fun bs!9332 () Bool)

(assert (= bs!9332 d!63981))

(assert (=> bs!9332 m!279351))

(assert (=> bs!9332 m!279351))

(assert (=> bs!9332 m!279355))

(assert (=> bs!9332 m!279371))

(assert (=> d!63347 d!63981))

(assert (=> d!63347 d!63359))

(assert (=> b!263448 d!63477))

(declare-fun d!63983 () Bool)

(declare-fun res!129049 () Bool)

(declare-fun e!171336 () Bool)

(assert (=> d!63983 (=> res!129049 e!171336)))

(assert (=> d!63983 (= res!129049 (and ((_ is Cons!3848) lt!133128) (= (_1!2500 (h!4514 lt!133128)) (_1!2500 lt!133020))))))

(assert (=> d!63983 (= (containsKey!312 lt!133128 (_1!2500 lt!133020)) e!171336)))

(declare-fun b!264457 () Bool)

(declare-fun e!171337 () Bool)

(assert (=> b!264457 (= e!171336 e!171337)))

(declare-fun res!129050 () Bool)

(assert (=> b!264457 (=> (not res!129050) (not e!171337))))

(assert (=> b!264457 (= res!129050 (and (or (not ((_ is Cons!3848) lt!133128)) (bvsle (_1!2500 (h!4514 lt!133128)) (_1!2500 lt!133020))) ((_ is Cons!3848) lt!133128) (bvslt (_1!2500 (h!4514 lt!133128)) (_1!2500 lt!133020))))))

(declare-fun b!264458 () Bool)

(assert (=> b!264458 (= e!171337 (containsKey!312 (t!8929 lt!133128) (_1!2500 lt!133020)))))

(assert (= (and d!63983 (not res!129049)) b!264457))

(assert (= (and b!264457 res!129050) b!264458))

(declare-fun m!281453 () Bool)

(assert (=> b!264458 m!281453))

(assert (=> b!263665 d!63983))

(declare-fun d!63985 () Bool)

(declare-fun e!171338 () Bool)

(assert (=> d!63985 e!171338))

(declare-fun res!129051 () Bool)

(assert (=> d!63985 (=> res!129051 e!171338)))

(declare-fun lt!133846 () Bool)

(assert (=> d!63985 (= res!129051 (not lt!133846))))

(declare-fun lt!133845 () Bool)

(assert (=> d!63985 (= lt!133846 lt!133845)))

(declare-fun lt!133847 () Unit!8190)

(declare-fun e!171339 () Unit!8190)

(assert (=> d!63985 (= lt!133847 e!171339)))

(declare-fun c!45256 () Bool)

(assert (=> d!63985 (= c!45256 lt!133845)))

(assert (=> d!63985 (= lt!133845 (containsKey!312 (toList!1961 lt!133369) (_1!2500 (tuple2!4979 key!932 v!346))))))

(assert (=> d!63985 (= (contains!1912 lt!133369 (_1!2500 (tuple2!4979 key!932 v!346))) lt!133846)))

(declare-fun b!264459 () Bool)

(declare-fun lt!133848 () Unit!8190)

(assert (=> b!264459 (= e!171339 lt!133848)))

(assert (=> b!264459 (= lt!133848 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133369) (_1!2500 (tuple2!4979 key!932 v!346))))))

(assert (=> b!264459 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133369) (_1!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun b!264460 () Bool)

(declare-fun Unit!8250 () Unit!8190)

(assert (=> b!264460 (= e!171339 Unit!8250)))

(declare-fun b!264461 () Bool)

(assert (=> b!264461 (= e!171338 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133369) (_1!2500 (tuple2!4979 key!932 v!346)))))))

(assert (= (and d!63985 c!45256) b!264459))

(assert (= (and d!63985 (not c!45256)) b!264460))

(assert (= (and d!63985 (not res!129051)) b!264461))

(declare-fun m!281455 () Bool)

(assert (=> d!63985 m!281455))

(declare-fun m!281457 () Bool)

(assert (=> b!264459 m!281457))

(assert (=> b!264459 m!279641))

(assert (=> b!264459 m!279641))

(declare-fun m!281459 () Bool)

(assert (=> b!264459 m!281459))

(assert (=> b!264461 m!279641))

(assert (=> b!264461 m!279641))

(assert (=> b!264461 m!281459))

(assert (=> d!63235 d!63985))

(declare-fun e!171341 () Option!326)

(declare-fun b!264464 () Bool)

(assert (=> b!264464 (= e!171341 (getValueByKey!320 (t!8929 lt!133370) (_1!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun b!264462 () Bool)

(declare-fun e!171340 () Option!326)

(assert (=> b!264462 (= e!171340 (Some!325 (_2!2500 (h!4514 lt!133370))))))

(declare-fun c!45257 () Bool)

(declare-fun d!63987 () Bool)

(assert (=> d!63987 (= c!45257 (and ((_ is Cons!3848) lt!133370) (= (_1!2500 (h!4514 lt!133370)) (_1!2500 (tuple2!4979 key!932 v!346)))))))

(assert (=> d!63987 (= (getValueByKey!320 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346))) e!171340)))

(declare-fun b!264465 () Bool)

(assert (=> b!264465 (= e!171341 None!324)))

(declare-fun b!264463 () Bool)

(assert (=> b!264463 (= e!171340 e!171341)))

(declare-fun c!45258 () Bool)

(assert (=> b!264463 (= c!45258 (and ((_ is Cons!3848) lt!133370) (not (= (_1!2500 (h!4514 lt!133370)) (_1!2500 (tuple2!4979 key!932 v!346))))))))

(assert (= (and d!63987 c!45257) b!264462))

(assert (= (and d!63987 (not c!45257)) b!264463))

(assert (= (and b!264463 c!45258) b!264464))

(assert (= (and b!264463 (not c!45258)) b!264465))

(declare-fun m!281461 () Bool)

(assert (=> b!264464 m!281461))

(assert (=> d!63235 d!63987))

(declare-fun d!63989 () Bool)

(assert (=> d!63989 (= (getValueByKey!320 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346))) (Some!325 (_2!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun lt!133849 () Unit!8190)

(assert (=> d!63989 (= lt!133849 (choose!1294 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun e!171342 () Bool)

(assert (=> d!63989 e!171342))

(declare-fun res!129052 () Bool)

(assert (=> d!63989 (=> (not res!129052) (not e!171342))))

(assert (=> d!63989 (= res!129052 (isStrictlySorted!377 lt!133370))))

(assert (=> d!63989 (= (lemmaContainsTupThenGetReturnValue!176 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))) lt!133849)))

(declare-fun b!264466 () Bool)

(declare-fun res!129053 () Bool)

(assert (=> b!264466 (=> (not res!129053) (not e!171342))))

(assert (=> b!264466 (= res!129053 (containsKey!312 lt!133370 (_1!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun b!264467 () Bool)

(assert (=> b!264467 (= e!171342 (contains!1914 lt!133370 (tuple2!4979 (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346)))))))

(assert (= (and d!63989 res!129052) b!264466))

(assert (= (and b!264466 res!129053) b!264467))

(assert (=> d!63989 m!279635))

(declare-fun m!281463 () Bool)

(assert (=> d!63989 m!281463))

(declare-fun m!281465 () Bool)

(assert (=> d!63989 m!281465))

(declare-fun m!281467 () Bool)

(assert (=> b!264466 m!281467))

(declare-fun m!281469 () Bool)

(assert (=> b!264467 m!281469))

(assert (=> d!63235 d!63989))

(declare-fun bm!25299 () Bool)

(declare-fun call!25304 () List!3852)

(declare-fun call!25303 () List!3852)

(assert (=> bm!25299 (= call!25304 call!25303)))

(declare-fun bm!25300 () Bool)

(declare-fun call!25302 () List!3852)

(assert (=> bm!25300 (= call!25302 call!25304)))

(declare-fun b!264468 () Bool)

(declare-fun res!129054 () Bool)

(declare-fun e!171347 () Bool)

(assert (=> b!264468 (=> (not res!129054) (not e!171347))))

(declare-fun lt!133850 () List!3852)

(assert (=> b!264468 (= res!129054 (containsKey!312 lt!133850 (_1!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun c!45259 () Bool)

(declare-fun b!264469 () Bool)

(assert (=> b!264469 (= c!45259 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (bvsgt (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (_1!2500 (tuple2!4979 key!932 v!346)))))))

(declare-fun e!171346 () List!3852)

(declare-fun e!171343 () List!3852)

(assert (=> b!264469 (= e!171346 e!171343)))

(declare-fun b!264470 () Bool)

(declare-fun e!171345 () List!3852)

(assert (=> b!264470 (= e!171345 e!171346)))

(declare-fun c!45262 () Bool)

(assert (=> b!264470 (= c!45262 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (_1!2500 (tuple2!4979 key!932 v!346)))))))

(declare-fun b!264471 () Bool)

(assert (=> b!264471 (= e!171347 (contains!1914 lt!133850 (tuple2!4979 (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346)))))))

(declare-fun b!264472 () Bool)

(assert (=> b!264472 (= e!171345 call!25303)))

(declare-fun b!264473 () Bool)

(assert (=> b!264473 (= e!171346 call!25304)))

(declare-fun e!171344 () List!3852)

(declare-fun b!264474 () Bool)

(assert (=> b!264474 (= e!171344 (insertStrictlySorted!179 (t!8929 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun b!264475 () Bool)

(assert (=> b!264475 (= e!171343 call!25302)))

(declare-fun c!45261 () Bool)

(declare-fun bm!25301 () Bool)

(assert (=> bm!25301 (= call!25303 ($colon$colon!108 e!171344 (ite c!45261 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (tuple2!4979 (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))))))))

(declare-fun c!45260 () Bool)

(assert (=> bm!25301 (= c!45260 c!45261)))

(declare-fun d!63991 () Bool)

(assert (=> d!63991 e!171347))

(declare-fun res!129055 () Bool)

(assert (=> d!63991 (=> (not res!129055) (not e!171347))))

(assert (=> d!63991 (= res!129055 (isStrictlySorted!377 lt!133850))))

(assert (=> d!63991 (= lt!133850 e!171345)))

(assert (=> d!63991 (= c!45261 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (bvslt (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (_1!2500 (tuple2!4979 key!932 v!346)))))))

(assert (=> d!63991 (isStrictlySorted!377 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))))

(assert (=> d!63991 (= (insertStrictlySorted!179 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (_1!2500 (tuple2!4979 key!932 v!346)) (_2!2500 (tuple2!4979 key!932 v!346))) lt!133850)))

(declare-fun b!264476 () Bool)

(assert (=> b!264476 (= e!171343 call!25302)))

(declare-fun b!264477 () Bool)

(assert (=> b!264477 (= e!171344 (ite c!45262 (t!8929 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (ite c!45259 (Cons!3848 (h!4514 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (t!8929 (toList!1961 (getCurrentListMap!1489 (_keys!7035 thiss!1504) (_values!4826 thiss!1504) (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) Nil!3849)))))

(assert (= (and d!63991 c!45261) b!264472))

(assert (= (and d!63991 (not c!45261)) b!264470))

(assert (= (and b!264470 c!45262) b!264473))

(assert (= (and b!264470 (not c!45262)) b!264469))

(assert (= (and b!264469 c!45259) b!264476))

(assert (= (and b!264469 (not c!45259)) b!264475))

(assert (= (or b!264476 b!264475) bm!25300))

(assert (= (or b!264473 bm!25300) bm!25299))

(assert (= (or b!264472 bm!25299) bm!25301))

(assert (= (and bm!25301 c!45260) b!264474))

(assert (= (and bm!25301 (not c!45260)) b!264477))

(assert (= (and d!63991 res!129055) b!264468))

(assert (= (and b!264468 res!129054) b!264471))

(declare-fun m!281471 () Bool)

(assert (=> bm!25301 m!281471))

(declare-fun m!281473 () Bool)

(assert (=> b!264474 m!281473))

(declare-fun m!281475 () Bool)

(assert (=> b!264471 m!281475))

(declare-fun m!281477 () Bool)

(assert (=> b!264468 m!281477))

(declare-fun m!281479 () Bool)

(assert (=> d!63991 m!281479))

(assert (=> d!63991 m!280585))

(assert (=> d!63235 d!63991))

(declare-fun d!63993 () Bool)

(declare-fun lt!133851 () Bool)

(assert (=> d!63993 (= lt!133851 (select (content!176 (t!8929 (toList!1961 lt!133127))) lt!133020))))

(declare-fun e!171349 () Bool)

(assert (=> d!63993 (= lt!133851 e!171349)))

(declare-fun res!129057 () Bool)

(assert (=> d!63993 (=> (not res!129057) (not e!171349))))

(assert (=> d!63993 (= res!129057 ((_ is Cons!3848) (t!8929 (toList!1961 lt!133127))))))

(assert (=> d!63993 (= (contains!1914 (t!8929 (toList!1961 lt!133127)) lt!133020) lt!133851)))

(declare-fun b!264478 () Bool)

(declare-fun e!171348 () Bool)

(assert (=> b!264478 (= e!171349 e!171348)))

(declare-fun res!129056 () Bool)

(assert (=> b!264478 (=> res!129056 e!171348)))

(assert (=> b!264478 (= res!129056 (= (h!4514 (t!8929 (toList!1961 lt!133127))) lt!133020))))

(declare-fun b!264479 () Bool)

(assert (=> b!264479 (= e!171348 (contains!1914 (t!8929 (t!8929 (toList!1961 lt!133127))) lt!133020))))

(assert (= (and d!63993 res!129057) b!264478))

(assert (= (and b!264478 (not res!129056)) b!264479))

(assert (=> d!63993 m!281403))

(declare-fun m!281481 () Bool)

(assert (=> d!63993 m!281481))

(declare-fun m!281483 () Bool)

(assert (=> b!264479 m!281483))

(assert (=> b!263291 d!63993))

(declare-fun d!63995 () Bool)

(assert (=> d!63995 (= (apply!262 lt!133460 (select (arr!5999 lt!133026) #b00000000000000000000000000000000)) (get!3094 (getValueByKey!320 (toList!1961 lt!133460) (select (arr!5999 lt!133026) #b00000000000000000000000000000000))))))

(declare-fun bs!9333 () Bool)

(assert (= bs!9333 d!63995))

(assert (=> bs!9333 m!279255))

(assert (=> bs!9333 m!280639))

(assert (=> bs!9333 m!280639))

(declare-fun m!281485 () Bool)

(assert (=> bs!9333 m!281485))

(assert (=> b!263642 d!63995))

(assert (=> b!263642 d!63263))

(declare-fun d!63997 () Bool)

(assert (=> d!63997 (= (get!3095 (select (arr!5998 lt!133023) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4843 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5504 (select (arr!5998 lt!133023) #b00000000000000000000000000000000)))))

(assert (=> b!263577 d!63997))

(declare-fun d!63999 () Bool)

(assert (=> d!63999 (= (apply!262 lt!133512 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3094 (getValueByKey!320 (toList!1961 lt!133512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9334 () Bool)

(assert (= bs!9334 d!63999))

(assert (=> bs!9334 m!280365))

(assert (=> bs!9334 m!280365))

(declare-fun m!281487 () Bool)

(assert (=> bs!9334 m!281487))

(assert (=> b!263699 d!63999))

(declare-fun e!171351 () Option!326)

(declare-fun b!264482 () Bool)

(assert (=> b!264482 (= e!171351 (getValueByKey!320 (t!8929 (toList!1961 lt!133369)) (_1!2500 (tuple2!4979 key!932 v!346))))))

(declare-fun b!264480 () Bool)

(declare-fun e!171350 () Option!326)

(assert (=> b!264480 (= e!171350 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133369)))))))

(declare-fun d!64001 () Bool)

(declare-fun c!45263 () Bool)

(assert (=> d!64001 (= c!45263 (and ((_ is Cons!3848) (toList!1961 lt!133369)) (= (_1!2500 (h!4514 (toList!1961 lt!133369))) (_1!2500 (tuple2!4979 key!932 v!346)))))))

(assert (=> d!64001 (= (getValueByKey!320 (toList!1961 lt!133369) (_1!2500 (tuple2!4979 key!932 v!346))) e!171350)))

(declare-fun b!264483 () Bool)

(assert (=> b!264483 (= e!171351 None!324)))

(declare-fun b!264481 () Bool)

(assert (=> b!264481 (= e!171350 e!171351)))

(declare-fun c!45264 () Bool)

(assert (=> b!264481 (= c!45264 (and ((_ is Cons!3848) (toList!1961 lt!133369)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133369))) (_1!2500 (tuple2!4979 key!932 v!346))))))))

(assert (= (and d!64001 c!45263) b!264480))

(assert (= (and d!64001 (not c!45263)) b!264481))

(assert (= (and b!264481 c!45264) b!264482))

(assert (= (and b!264481 (not c!45264)) b!264483))

(declare-fun m!281489 () Bool)

(assert (=> b!264482 m!281489))

(assert (=> b!263468 d!64001))

(declare-fun d!64003 () Bool)

(assert (=> d!64003 (arrayContainsKey!0 (_keys!7035 lt!133015) lt!133491 #b00000000000000000000000000000000)))

(declare-fun lt!133852 () Unit!8190)

(assert (=> d!64003 (= lt!133852 (choose!13 (_keys!7035 lt!133015) lt!133491 #b00000000000000000000000000000000))))

(assert (=> d!64003 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!64003 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7035 lt!133015) lt!133491 #b00000000000000000000000000000000) lt!133852)))

(declare-fun bs!9335 () Bool)

(assert (= bs!9335 d!64003))

(assert (=> bs!9335 m!280055))

(declare-fun m!281491 () Bool)

(assert (=> bs!9335 m!281491))

(assert (=> b!263683 d!64003))

(declare-fun d!64005 () Bool)

(declare-fun res!129058 () Bool)

(declare-fun e!171352 () Bool)

(assert (=> d!64005 (=> res!129058 e!171352)))

(assert (=> d!64005 (= res!129058 (= (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) lt!133491))))

(assert (=> d!64005 (= (arrayContainsKey!0 (_keys!7035 lt!133015) lt!133491 #b00000000000000000000000000000000) e!171352)))

(declare-fun b!264484 () Bool)

(declare-fun e!171353 () Bool)

(assert (=> b!264484 (= e!171352 e!171353)))

(declare-fun res!129059 () Bool)

(assert (=> b!264484 (=> (not res!129059) (not e!171353))))

(assert (=> b!264484 (= res!129059 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 lt!133015))))))

(declare-fun b!264485 () Bool)

(assert (=> b!264485 (= e!171353 (arrayContainsKey!0 (_keys!7035 lt!133015) lt!133491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64005 (not res!129058)) b!264484))

(assert (= (and b!264484 res!129059) b!264485))

(assert (=> d!64005 m!279591))

(declare-fun m!281493 () Bool)

(assert (=> b!264485 m!281493))

(assert (=> b!263683 d!64005))

(declare-fun b!264486 () Bool)

(declare-fun e!171356 () SeekEntryResult!1200)

(declare-fun lt!133854 () SeekEntryResult!1200)

(assert (=> b!264486 (= e!171356 (MissingZero!1200 (index!6972 lt!133854)))))

(declare-fun b!264487 () Bool)

(declare-fun e!171355 () SeekEntryResult!1200)

(declare-fun e!171354 () SeekEntryResult!1200)

(assert (=> b!264487 (= e!171355 e!171354)))

(declare-fun lt!133855 () (_ BitVec 64))

(assert (=> b!264487 (= lt!133855 (select (arr!5999 (_keys!7035 lt!133015)) (index!6972 lt!133854)))))

(declare-fun c!45267 () Bool)

(assert (=> b!264487 (= c!45267 (= lt!133855 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!264488 () Bool)

(declare-fun c!45265 () Bool)

(assert (=> b!264488 (= c!45265 (= lt!133855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264488 (= e!171354 e!171356)))

(declare-fun b!264489 () Bool)

(assert (=> b!264489 (= e!171354 (Found!1200 (index!6972 lt!133854)))))

(declare-fun b!264490 () Bool)

(assert (=> b!264490 (= e!171356 (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133854) (index!6972 lt!133854) (index!6972 lt!133854) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) (_keys!7035 lt!133015) (mask!11209 lt!133015)))))

(declare-fun d!64007 () Bool)

(declare-fun lt!133853 () SeekEntryResult!1200)

(assert (=> d!64007 (and (or ((_ is Undefined!1200) lt!133853) (not ((_ is Found!1200) lt!133853)) (and (bvsge (index!6971 lt!133853) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133853) (size!6350 (_keys!7035 lt!133015))))) (or ((_ is Undefined!1200) lt!133853) ((_ is Found!1200) lt!133853) (not ((_ is MissingZero!1200) lt!133853)) (and (bvsge (index!6970 lt!133853) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133853) (size!6350 (_keys!7035 lt!133015))))) (or ((_ is Undefined!1200) lt!133853) ((_ is Found!1200) lt!133853) ((_ is MissingZero!1200) lt!133853) (not ((_ is MissingVacant!1200) lt!133853)) (and (bvsge (index!6973 lt!133853) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133853) (size!6350 (_keys!7035 lt!133015))))) (or ((_ is Undefined!1200) lt!133853) (ite ((_ is Found!1200) lt!133853) (= (select (arr!5999 (_keys!7035 lt!133015)) (index!6971 lt!133853)) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1200) lt!133853) (= (select (arr!5999 (_keys!7035 lt!133015)) (index!6970 lt!133853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1200) lt!133853) (= (select (arr!5999 (_keys!7035 lt!133015)) (index!6973 lt!133853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64007 (= lt!133853 e!171355)))

(declare-fun c!45266 () Bool)

(assert (=> d!64007 (= c!45266 (and ((_ is Intermediate!1200) lt!133854) (undefined!2012 lt!133854)))))

(assert (=> d!64007 (= lt!133854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) (mask!11209 lt!133015)) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) (_keys!7035 lt!133015) (mask!11209 lt!133015)))))

(assert (=> d!64007 (validMask!0 (mask!11209 lt!133015))))

(assert (=> d!64007 (= (seekEntryOrOpen!0 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000) (_keys!7035 lt!133015) (mask!11209 lt!133015)) lt!133853)))

(declare-fun b!264491 () Bool)

(assert (=> b!264491 (= e!171355 Undefined!1200)))

(assert (= (and d!64007 c!45266) b!264491))

(assert (= (and d!64007 (not c!45266)) b!264487))

(assert (= (and b!264487 c!45267) b!264489))

(assert (= (and b!264487 (not c!45267)) b!264488))

(assert (= (and b!264488 c!45265) b!264486))

(assert (= (and b!264488 (not c!45265)) b!264490))

(declare-fun m!281495 () Bool)

(assert (=> b!264487 m!281495))

(assert (=> b!264490 m!279591))

(declare-fun m!281497 () Bool)

(assert (=> b!264490 m!281497))

(declare-fun m!281499 () Bool)

(assert (=> d!64007 m!281499))

(assert (=> d!64007 m!279757))

(declare-fun m!281501 () Bool)

(assert (=> d!64007 m!281501))

(assert (=> d!64007 m!279591))

(declare-fun m!281503 () Bool)

(assert (=> d!64007 m!281503))

(declare-fun m!281505 () Bool)

(assert (=> d!64007 m!281505))

(assert (=> d!64007 m!281503))

(assert (=> d!64007 m!279591))

(declare-fun m!281507 () Bool)

(assert (=> d!64007 m!281507))

(assert (=> b!263683 d!64007))

(assert (=> d!63313 d!63297))

(assert (=> d!63313 d!63317))

(declare-fun d!64009 () Bool)

(assert (=> d!64009 (contains!1912 (+!710 lt!133207 (tuple2!4979 lt!133187 (zeroValue!4684 thiss!1504))) lt!133200)))

(assert (=> d!64009 true))

(declare-fun _$35!421 () Unit!8190)

(assert (=> d!64009 (= (choose!1296 lt!133207 lt!133187 (zeroValue!4684 thiss!1504) lt!133200) _$35!421)))

(declare-fun bs!9336 () Bool)

(assert (= bs!9336 d!64009))

(assert (=> bs!9336 m!279219))

(assert (=> bs!9336 m!279219))

(assert (=> bs!9336 m!279221))

(assert (=> d!63313 d!64009))

(declare-fun d!64011 () Bool)

(declare-fun e!171357 () Bool)

(assert (=> d!64011 e!171357))

(declare-fun res!129060 () Bool)

(assert (=> d!64011 (=> res!129060 e!171357)))

(declare-fun lt!133857 () Bool)

(assert (=> d!64011 (= res!129060 (not lt!133857))))

(declare-fun lt!133856 () Bool)

(assert (=> d!64011 (= lt!133857 lt!133856)))

(declare-fun lt!133858 () Unit!8190)

(declare-fun e!171358 () Unit!8190)

(assert (=> d!64011 (= lt!133858 e!171358)))

(declare-fun c!45268 () Bool)

(assert (=> d!64011 (= c!45268 lt!133856)))

(assert (=> d!64011 (= lt!133856 (containsKey!312 (toList!1961 lt!133207) lt!133200))))

(assert (=> d!64011 (= (contains!1912 lt!133207 lt!133200) lt!133857)))

(declare-fun b!264492 () Bool)

(declare-fun lt!133859 () Unit!8190)

(assert (=> b!264492 (= e!171358 lt!133859)))

(assert (=> b!264492 (= lt!133859 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133207) lt!133200))))

(assert (=> b!264492 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133207) lt!133200))))

(declare-fun b!264493 () Bool)

(declare-fun Unit!8251 () Unit!8190)

(assert (=> b!264493 (= e!171358 Unit!8251)))

(declare-fun b!264494 () Bool)

(assert (=> b!264494 (= e!171357 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133207) lt!133200)))))

(assert (= (and d!64011 c!45268) b!264492))

(assert (= (and d!64011 (not c!45268)) b!264493))

(assert (= (and d!64011 (not res!129060)) b!264494))

(declare-fun m!281509 () Bool)

(assert (=> d!64011 m!281509))

(declare-fun m!281511 () Bool)

(assert (=> b!264492 m!281511))

(declare-fun m!281513 () Bool)

(assert (=> b!264492 m!281513))

(assert (=> b!264492 m!281513))

(declare-fun m!281515 () Bool)

(assert (=> b!264492 m!281515))

(assert (=> b!264494 m!281513))

(assert (=> b!264494 m!281513))

(assert (=> b!264494 m!281515))

(assert (=> d!63313 d!64011))

(assert (=> b!263654 d!63853))

(assert (=> b!263654 d!63855))

(assert (=> b!263625 d!63909))

(declare-fun b!264497 () Bool)

(declare-fun e!171360 () Option!326)

(assert (=> b!264497 (= e!171360 (getValueByKey!320 (t!8929 (toList!1961 lt!133416)) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))

(declare-fun b!264495 () Bool)

(declare-fun e!171359 () Option!326)

(assert (=> b!264495 (= e!171359 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133416)))))))

(declare-fun d!64013 () Bool)

(declare-fun c!45269 () Bool)

(assert (=> d!64013 (= c!45269 (and ((_ is Cons!3848) (toList!1961 lt!133416)) (= (_1!2500 (h!4514 (toList!1961 lt!133416))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504)))))))))

(assert (=> d!64013 (= (getValueByKey!320 (toList!1961 lt!133416) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))) e!171359)))

(declare-fun b!264498 () Bool)

(assert (=> b!264498 (= e!171360 None!324)))

(declare-fun b!264496 () Bool)

(assert (=> b!264496 (= e!171359 e!171360)))

(declare-fun c!45270 () Bool)

(assert (=> b!264496 (= c!45270 (and ((_ is Cons!3848) (toList!1961 lt!133416)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133416))) (_1!2500 (ite (or c!44872 c!44869) (tuple2!4979 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4684 thiss!1504)) (tuple2!4979 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4684 thiss!1504))))))))))

(assert (= (and d!64013 c!45269) b!264495))

(assert (= (and d!64013 (not c!45269)) b!264496))

(assert (= (and b!264496 c!45270) b!264497))

(assert (= (and b!264496 (not c!45270)) b!264498))

(declare-fun m!281517 () Bool)

(assert (=> b!264497 m!281517))

(assert (=> b!263563 d!64013))

(assert (=> d!63229 d!63379))

(declare-fun d!64015 () Bool)

(declare-fun e!171361 () Bool)

(assert (=> d!64015 e!171361))

(declare-fun res!129061 () Bool)

(assert (=> d!64015 (=> res!129061 e!171361)))

(declare-fun lt!133861 () Bool)

(assert (=> d!64015 (= res!129061 (not lt!133861))))

(declare-fun lt!133860 () Bool)

(assert (=> d!64015 (= lt!133861 lt!133860)))

(declare-fun lt!133862 () Unit!8190)

(declare-fun e!171362 () Unit!8190)

(assert (=> d!64015 (= lt!133862 e!171362)))

(declare-fun c!45271 () Bool)

(assert (=> d!64015 (= c!45271 lt!133860)))

(assert (=> d!64015 (= lt!133860 (containsKey!312 (toList!1961 lt!133386) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!64015 (= (contains!1912 lt!133386 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) lt!133861)))

(declare-fun b!264499 () Bool)

(declare-fun lt!133863 () Unit!8190)

(assert (=> b!264499 (= e!171362 lt!133863)))

(assert (=> b!264499 (= lt!133863 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133386) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!264499 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133386) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!264500 () Bool)

(declare-fun Unit!8252 () Unit!8190)

(assert (=> b!264500 (= e!171362 Unit!8252)))

(declare-fun b!264501 () Bool)

(assert (=> b!264501 (= e!171361 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133386) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000))))))

(assert (= (and d!64015 c!45271) b!264499))

(assert (= (and d!64015 (not c!45271)) b!264500))

(assert (= (and d!64015 (not res!129061)) b!264501))

(assert (=> d!64015 m!279647))

(declare-fun m!281519 () Bool)

(assert (=> d!64015 m!281519))

(assert (=> b!264499 m!279647))

(declare-fun m!281521 () Bool)

(assert (=> b!264499 m!281521))

(assert (=> b!264499 m!279647))

(assert (=> b!264499 m!281001))

(assert (=> b!264499 m!281001))

(declare-fun m!281523 () Bool)

(assert (=> b!264499 m!281523))

(assert (=> b!264501 m!279647))

(assert (=> b!264501 m!281001))

(assert (=> b!264501 m!281001))

(assert (=> b!264501 m!281523))

(assert (=> b!263484 d!64015))

(assert (=> b!263302 d!63195))

(declare-fun d!64017 () Bool)

(declare-fun lt!133864 () Bool)

(assert (=> d!64017 (= lt!133864 (select (content!176 (toList!1961 lt!133481)) (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))

(declare-fun e!171364 () Bool)

(assert (=> d!64017 (= lt!133864 e!171364)))

(declare-fun res!129063 () Bool)

(assert (=> d!64017 (=> (not res!129063) (not e!171364))))

(assert (=> d!64017 (= res!129063 ((_ is Cons!3848) (toList!1961 lt!133481)))))

(assert (=> d!64017 (= (contains!1914 (toList!1961 lt!133481) (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))) lt!133864)))

(declare-fun b!264502 () Bool)

(declare-fun e!171363 () Bool)

(assert (=> b!264502 (= e!171364 e!171363)))

(declare-fun res!129062 () Bool)

(assert (=> b!264502 (=> res!129062 e!171363)))

(assert (=> b!264502 (= res!129062 (= (h!4514 (toList!1961 lt!133481)) (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))

(declare-fun b!264503 () Bool)

(assert (=> b!264503 (= e!171363 (contains!1914 (t!8929 (toList!1961 lt!133481)) (tuple2!4979 lt!133257 (minValue!4684 thiss!1504))))))

(assert (= (and d!64017 res!129063) b!264502))

(assert (= (and b!264502 (not res!129062)) b!264503))

(declare-fun m!281525 () Bool)

(assert (=> d!64017 m!281525))

(declare-fun m!281527 () Bool)

(assert (=> d!64017 m!281527))

(declare-fun m!281529 () Bool)

(assert (=> b!264503 m!281529))

(assert (=> b!263657 d!64017))

(declare-fun d!64019 () Bool)

(assert (=> d!64019 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!5508 (getValueByKey!320 (toList!1961 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63159 d!64019))

(assert (=> d!63159 d!63729))

(assert (=> b!263355 d!63389))

(declare-fun d!64021 () Bool)

(declare-fun res!129064 () Bool)

(declare-fun e!171365 () Bool)

(assert (=> d!64021 (=> res!129064 e!171365)))

(assert (=> d!64021 (= res!129064 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133009))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133009)))) key!932)))))

(assert (=> d!64021 (= (containsKey!312 (t!8929 (toList!1961 lt!133009)) key!932) e!171365)))

(declare-fun b!264504 () Bool)

(declare-fun e!171366 () Bool)

(assert (=> b!264504 (= e!171365 e!171366)))

(declare-fun res!129065 () Bool)

(assert (=> b!264504 (=> (not res!129065) (not e!171366))))

(assert (=> b!264504 (= res!129065 (and (or (not ((_ is Cons!3848) (t!8929 (toList!1961 lt!133009)))) (bvsle (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133009)))) key!932)) ((_ is Cons!3848) (t!8929 (toList!1961 lt!133009))) (bvslt (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133009)))) key!932)))))

(declare-fun b!264505 () Bool)

(assert (=> b!264505 (= e!171366 (containsKey!312 (t!8929 (t!8929 (toList!1961 lt!133009))) key!932))))

(assert (= (and d!64021 (not res!129064)) b!264504))

(assert (= (and b!264504 res!129065) b!264505))

(declare-fun m!281531 () Bool)

(assert (=> b!264505 m!281531))

(assert (=> b!263285 d!64021))

(declare-fun d!64023 () Bool)

(assert (=> d!64023 (isDefined!261 (getValueByKey!320 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))

(declare-fun lt!133865 () Unit!8190)

(assert (=> d!64023 (= lt!133865 (choose!1293 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))

(declare-fun e!171367 () Bool)

(assert (=> d!64023 e!171367))

(declare-fun res!129066 () Bool)

(assert (=> d!64023 (=> (not res!129066) (not e!171367))))

(assert (=> d!64023 (= res!129066 (isStrictlySorted!377 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))))))

(assert (=> d!64023 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)) lt!133865)))

(declare-fun b!264506 () Bool)

(assert (=> b!264506 (= e!171367 (containsKey!312 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)))))

(assert (= (and d!64023 res!129066) b!264506))

(assert (=> d!64023 m!279307))

(assert (=> d!64023 m!279559))

(assert (=> d!64023 m!279559))

(assert (=> d!64023 m!279561))

(assert (=> d!64023 m!279307))

(declare-fun m!281533 () Bool)

(assert (=> d!64023 m!281533))

(declare-fun m!281535 () Bool)

(assert (=> d!64023 m!281535))

(assert (=> b!264506 m!279307))

(assert (=> b!264506 m!279555))

(assert (=> b!263373 d!64023))

(assert (=> b!263373 d!63535))

(assert (=> b!263373 d!63537))

(declare-fun b!264507 () Bool)

(declare-fun e!171368 () (_ BitVec 32))

(assert (=> b!264507 (= e!171368 #b00000000000000000000000000000000)))

(declare-fun b!264509 () Bool)

(declare-fun e!171369 () (_ BitVec 32))

(assert (=> b!264509 (= e!171368 e!171369)))

(declare-fun c!45273 () Bool)

(assert (=> b!264509 (= c!45273 (validKeyInArray!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264510 () Bool)

(declare-fun call!25305 () (_ BitVec 32))

(assert (=> b!264510 (= e!171369 call!25305)))

(declare-fun bm!25302 () Bool)

(assert (=> bm!25302 (= call!25305 (arrayCountValidKeys!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(declare-fun d!64025 () Bool)

(declare-fun lt!133866 () (_ BitVec 32))

(assert (=> d!64025 (and (bvsge lt!133866 #b00000000000000000000000000000000) (bvsle lt!133866 (bvsub (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!64025 (= lt!133866 e!171368)))

(declare-fun c!45272 () Bool)

(assert (=> d!64025 (= c!45272 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))))))

(assert (=> d!64025 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6350 (_keys!7035 thiss!1504)) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(assert (=> d!64025 (= (arrayCountValidKeys!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (_keys!7035 thiss!1504))) lt!133866)))

(declare-fun b!264508 () Bool)

(assert (=> b!264508 (= e!171369 (bvadd #b00000000000000000000000000000001 call!25305))))

(assert (= (and d!64025 c!45272) b!264507))

(assert (= (and d!64025 (not c!45272)) b!264509))

(assert (= (and b!264509 c!45273) b!264508))

(assert (= (and b!264509 (not c!45273)) b!264510))

(assert (= (or b!264508 b!264510) bm!25302))

(assert (=> b!264509 m!280541))

(assert (=> b!264509 m!280541))

(assert (=> b!264509 m!280551))

(declare-fun m!281537 () Bool)

(assert (=> bm!25302 m!281537))

(assert (=> bm!25237 d!64025))

(declare-fun d!64027 () Bool)

(assert (=> d!64027 (arrayContainsKey!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 #b00000000000000000000000000000000)))

(declare-fun lt!133867 () Unit!8190)

(assert (=> d!64027 (= lt!133867 (choose!13 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 #b00000000000000000000000000000000))))

(assert (=> d!64027 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!64027 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 #b00000000000000000000000000000000) lt!133867)))

(declare-fun bs!9337 () Bool)

(assert (= bs!9337 d!64027))

(assert (=> bs!9337 m!280063))

(declare-fun m!281539 () Bool)

(assert (=> bs!9337 m!281539))

(assert (=> b!263687 d!64027))

(declare-fun d!64029 () Bool)

(declare-fun res!129067 () Bool)

(declare-fun e!171370 () Bool)

(assert (=> d!64029 (=> res!129067 e!171370)))

(assert (=> d!64029 (= res!129067 (= (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) lt!133494))))

(assert (=> d!64029 (= (arrayContainsKey!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 #b00000000000000000000000000000000) e!171370)))

(declare-fun b!264511 () Bool)

(declare-fun e!171371 () Bool)

(assert (=> b!264511 (= e!171370 e!171371)))

(declare-fun res!129068 () Bool)

(assert (=> b!264511 (=> (not res!129068) (not e!171371))))

(assert (=> b!264511 (= res!129068 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))))

(declare-fun b!264512 () Bool)

(assert (=> b!264512 (= e!171371 (arrayContainsKey!0 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) lt!133494 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64029 (not res!129067)) b!264511))

(assert (= (and b!264511 res!129068) b!264512))

(assert (=> d!64029 m!279647))

(declare-fun m!281541 () Bool)

(assert (=> b!264512 m!281541))

(assert (=> b!263687 d!64029))

(declare-fun b!264513 () Bool)

(declare-fun e!171374 () SeekEntryResult!1200)

(declare-fun lt!133869 () SeekEntryResult!1200)

(assert (=> b!264513 (= e!171374 (MissingZero!1200 (index!6972 lt!133869)))))

(declare-fun b!264514 () Bool)

(declare-fun e!171373 () SeekEntryResult!1200)

(declare-fun e!171372 () SeekEntryResult!1200)

(assert (=> b!264514 (= e!171373 e!171372)))

(declare-fun lt!133870 () (_ BitVec 64))

(assert (=> b!264514 (= lt!133870 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (index!6972 lt!133869)))))

(declare-fun c!45276 () Bool)

(assert (=> b!264514 (= c!45276 (= lt!133870 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!264515 () Bool)

(declare-fun c!45274 () Bool)

(assert (=> b!264515 (= c!45274 (= lt!133870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264515 (= e!171372 e!171374)))

(declare-fun b!264516 () Bool)

(assert (=> b!264516 (= e!171372 (Found!1200 (index!6972 lt!133869)))))

(declare-fun b!264517 () Bool)

(assert (=> b!264517 (= e!171374 (seekKeyOrZeroReturnVacant!0 (x!25242 lt!133869) (index!6972 lt!133869) (index!6972 lt!133869) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)))))

(declare-fun d!64031 () Bool)

(declare-fun lt!133868 () SeekEntryResult!1200)

(assert (=> d!64031 (and (or ((_ is Undefined!1200) lt!133868) (not ((_ is Found!1200) lt!133868)) (and (bvsge (index!6971 lt!133868) #b00000000000000000000000000000000) (bvslt (index!6971 lt!133868) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))) (or ((_ is Undefined!1200) lt!133868) ((_ is Found!1200) lt!133868) (not ((_ is MissingZero!1200) lt!133868)) (and (bvsge (index!6970 lt!133868) #b00000000000000000000000000000000) (bvslt (index!6970 lt!133868) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))) (or ((_ is Undefined!1200) lt!133868) ((_ is Found!1200) lt!133868) ((_ is MissingZero!1200) lt!133868) (not ((_ is MissingVacant!1200) lt!133868)) (and (bvsge (index!6973 lt!133868) #b00000000000000000000000000000000) (bvslt (index!6973 lt!133868) (size!6350 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))))))) (or ((_ is Undefined!1200) lt!133868) (ite ((_ is Found!1200) lt!133868) (= (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (index!6971 lt!133868)) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1200) lt!133868) (= (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (index!6970 lt!133868)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1200) lt!133868) (= (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) (index!6973 lt!133868)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64031 (= lt!133868 e!171373)))

(declare-fun c!45275 () Bool)

(assert (=> d!64031 (= c!45275 (and ((_ is Intermediate!1200) lt!133869) (undefined!2012 lt!133869)))))

(assert (=> d!64031 (= lt!133869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) (mask!11209 thiss!1504)) (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)))))

(assert (=> d!64031 (validMask!0 (mask!11209 thiss!1504))))

(assert (=> d!64031 (= (seekEntryOrOpen!0 (select (arr!5999 (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504)))) #b00000000000000000000000000000000) (array!12678 (store (arr!5999 (_keys!7035 thiss!1504)) index!297 key!932) (size!6350 (_keys!7035 thiss!1504))) (mask!11209 thiss!1504)) lt!133868)))

(declare-fun b!264518 () Bool)

(assert (=> b!264518 (= e!171373 Undefined!1200)))

(assert (= (and d!64031 c!45275) b!264518))

(assert (= (and d!64031 (not c!45275)) b!264514))

(assert (= (and b!264514 c!45276) b!264516))

(assert (= (and b!264514 (not c!45276)) b!264515))

(assert (= (and b!264515 c!45274) b!264513))

(assert (= (and b!264515 (not c!45274)) b!264517))

(declare-fun m!281543 () Bool)

(assert (=> b!264514 m!281543))

(assert (=> b!264517 m!279647))

(declare-fun m!281545 () Bool)

(assert (=> b!264517 m!281545))

(declare-fun m!281547 () Bool)

(assert (=> d!64031 m!281547))

(assert (=> d!64031 m!279139))

(declare-fun m!281549 () Bool)

(assert (=> d!64031 m!281549))

(assert (=> d!64031 m!279647))

(declare-fun m!281551 () Bool)

(assert (=> d!64031 m!281551))

(declare-fun m!281553 () Bool)

(assert (=> d!64031 m!281553))

(assert (=> d!64031 m!281551))

(assert (=> d!64031 m!279647))

(declare-fun m!281555 () Bool)

(assert (=> d!64031 m!281555))

(assert (=> b!263687 d!64031))

(assert (=> b!263370 d!63871))

(assert (=> b!263370 d!63873))

(declare-fun lt!133871 () Bool)

(declare-fun d!64033 () Bool)

(assert (=> d!64033 (= lt!133871 (select (content!176 (toList!1961 lt!133439)) (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))

(declare-fun e!171376 () Bool)

(assert (=> d!64033 (= lt!133871 e!171376)))

(declare-fun res!129070 () Bool)

(assert (=> d!64033 (=> (not res!129070) (not e!171376))))

(assert (=> d!64033 (= res!129070 ((_ is Cons!3848) (toList!1961 lt!133439)))))

(assert (=> d!64033 (= (contains!1914 (toList!1961 lt!133439) (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) lt!133871)))

(declare-fun b!264519 () Bool)

(declare-fun e!171375 () Bool)

(assert (=> b!264519 (= e!171376 e!171375)))

(declare-fun res!129069 () Bool)

(assert (=> b!264519 (=> res!129069 e!171375)))

(assert (=> b!264519 (= res!129069 (= (h!4514 (toList!1961 lt!133439)) (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))

(declare-fun b!264520 () Bool)

(assert (=> b!264520 (= e!171375 (contains!1914 (t!8929 (toList!1961 lt!133439)) (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))))))

(assert (= (and d!64033 res!129070) b!264519))

(assert (= (and b!264519 (not res!129069)) b!264520))

(declare-fun m!281557 () Bool)

(assert (=> d!64033 m!281557))

(declare-fun m!281559 () Bool)

(assert (=> d!64033 m!281559))

(declare-fun m!281561 () Bool)

(assert (=> b!264520 m!281561))

(assert (=> b!263615 d!64033))

(assert (=> b!263705 d!63477))

(assert (=> b!263428 d!63195))

(declare-fun d!64035 () Bool)

(declare-fun lt!133872 () Bool)

(assert (=> d!64035 (= lt!133872 (select (content!176 (t!8929 (toList!1961 lt!133265))) lt!133020))))

(declare-fun e!171378 () Bool)

(assert (=> d!64035 (= lt!133872 e!171378)))

(declare-fun res!129072 () Bool)

(assert (=> d!64035 (=> (not res!129072) (not e!171378))))

(assert (=> d!64035 (= res!129072 ((_ is Cons!3848) (t!8929 (toList!1961 lt!133265))))))

(assert (=> d!64035 (= (contains!1914 (t!8929 (toList!1961 lt!133265)) lt!133020) lt!133872)))

(declare-fun b!264521 () Bool)

(declare-fun e!171377 () Bool)

(assert (=> b!264521 (= e!171378 e!171377)))

(declare-fun res!129071 () Bool)

(assert (=> b!264521 (=> res!129071 e!171377)))

(assert (=> b!264521 (= res!129071 (= (h!4514 (t!8929 (toList!1961 lt!133265))) lt!133020))))

(declare-fun b!264522 () Bool)

(assert (=> b!264522 (= e!171377 (contains!1914 (t!8929 (t!8929 (toList!1961 lt!133265))) lt!133020))))

(assert (= (and d!64035 res!129072) b!264521))

(assert (= (and b!264521 (not res!129071)) b!264522))

(assert (=> d!64035 m!281267))

(declare-fun m!281563 () Bool)

(assert (=> d!64035 m!281563))

(declare-fun m!281565 () Bool)

(assert (=> b!264522 m!281565))

(assert (=> b!263372 d!64035))

(declare-fun d!64037 () Bool)

(declare-fun e!171379 () Bool)

(assert (=> d!64037 e!171379))

(declare-fun res!129073 () Bool)

(assert (=> d!64037 (=> res!129073 e!171379)))

(declare-fun lt!133874 () Bool)

(assert (=> d!64037 (= res!129073 (not lt!133874))))

(declare-fun lt!133873 () Bool)

(assert (=> d!64037 (= lt!133874 lt!133873)))

(declare-fun lt!133875 () Unit!8190)

(declare-fun e!171380 () Unit!8190)

(assert (=> d!64037 (= lt!133875 e!171380)))

(declare-fun c!45277 () Bool)

(assert (=> d!64037 (= c!45277 lt!133873)))

(assert (=> d!64037 (= lt!133873 (containsKey!312 (toList!1961 lt!133472) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(assert (=> d!64037 (= (contains!1912 lt!133472 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133874)))

(declare-fun b!264523 () Bool)

(declare-fun lt!133876 () Unit!8190)

(assert (=> b!264523 (= e!171380 lt!133876)))

(assert (=> b!264523 (= lt!133876 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133472) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(assert (=> b!264523 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133472) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun b!264524 () Bool)

(declare-fun Unit!8253 () Unit!8190)

(assert (=> b!264524 (= e!171380 Unit!8253)))

(declare-fun b!264525 () Bool)

(assert (=> b!264525 (= e!171379 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133472) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(assert (= (and d!64037 c!45277) b!264523))

(assert (= (and d!64037 (not c!45277)) b!264524))

(assert (= (and d!64037 (not res!129073)) b!264525))

(declare-fun m!281567 () Bool)

(assert (=> d!64037 m!281567))

(declare-fun m!281569 () Bool)

(assert (=> b!264523 m!281569))

(assert (=> b!264523 m!279969))

(assert (=> b!264523 m!279969))

(declare-fun m!281571 () Bool)

(assert (=> b!264523 m!281571))

(assert (=> b!264525 m!279969))

(assert (=> b!264525 m!279969))

(assert (=> b!264525 m!281571))

(assert (=> d!63341 d!64037))

(declare-fun e!171382 () Option!326)

(declare-fun b!264528 () Bool)

(assert (=> b!264528 (= e!171382 (getValueByKey!320 (t!8929 lt!133473) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun b!264526 () Bool)

(declare-fun e!171381 () Option!326)

(assert (=> b!264526 (= e!171381 (Some!325 (_2!2500 (h!4514 lt!133473))))))

(declare-fun c!45278 () Bool)

(declare-fun d!64039 () Bool)

(assert (=> d!64039 (= c!45278 (and ((_ is Cons!3848) lt!133473) (= (_1!2500 (h!4514 lt!133473)) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(assert (=> d!64039 (= (getValueByKey!320 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) e!171381)))

(declare-fun b!264529 () Bool)

(assert (=> b!264529 (= e!171382 None!324)))

(declare-fun b!264527 () Bool)

(assert (=> b!264527 (= e!171381 e!171382)))

(declare-fun c!45279 () Bool)

(assert (=> b!264527 (= c!45279 (and ((_ is Cons!3848) lt!133473) (not (= (_1!2500 (h!4514 lt!133473)) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!64039 c!45278) b!264526))

(assert (= (and d!64039 (not c!45278)) b!264527))

(assert (= (and b!264527 c!45279) b!264528))

(assert (= (and b!264527 (not c!45279)) b!264529))

(declare-fun m!281573 () Bool)

(assert (=> b!264528 m!281573))

(assert (=> d!63341 d!64039))

(declare-fun d!64041 () Bool)

(assert (=> d!64041 (= (getValueByKey!320 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) (Some!325 (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun lt!133877 () Unit!8190)

(assert (=> d!64041 (= lt!133877 (choose!1294 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun e!171383 () Bool)

(assert (=> d!64041 e!171383))

(declare-fun res!129074 () Bool)

(assert (=> d!64041 (=> (not res!129074) (not e!171383))))

(assert (=> d!64041 (= res!129074 (isStrictlySorted!377 lt!133473))))

(assert (=> d!64041 (= (lemmaContainsTupThenGetReturnValue!176 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133877)))

(declare-fun b!264530 () Bool)

(declare-fun res!129075 () Bool)

(assert (=> b!264530 (=> (not res!129075) (not e!171383))))

(assert (=> b!264530 (= res!129075 (containsKey!312 lt!133473 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun b!264531 () Bool)

(assert (=> b!264531 (= e!171383 (contains!1914 lt!133473 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(assert (= (and d!64041 res!129074) b!264530))

(assert (= (and b!264530 res!129075) b!264531))

(assert (=> d!64041 m!279963))

(declare-fun m!281575 () Bool)

(assert (=> d!64041 m!281575))

(declare-fun m!281577 () Bool)

(assert (=> d!64041 m!281577))

(declare-fun m!281579 () Bool)

(assert (=> b!264530 m!281579))

(declare-fun m!281581 () Bool)

(assert (=> b!264531 m!281581))

(assert (=> d!63341 d!64041))

(declare-fun bm!25303 () Bool)

(declare-fun call!25308 () List!3852)

(declare-fun call!25307 () List!3852)

(assert (=> bm!25303 (= call!25308 call!25307)))

(declare-fun bm!25304 () Bool)

(declare-fun call!25306 () List!3852)

(assert (=> bm!25304 (= call!25306 call!25308)))

(declare-fun b!264532 () Bool)

(declare-fun res!129076 () Bool)

(declare-fun e!171388 () Bool)

(assert (=> b!264532 (=> (not res!129076) (not e!171388))))

(declare-fun lt!133878 () List!3852)

(assert (=> b!264532 (= res!129076 (containsKey!312 lt!133878 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun c!45280 () Bool)

(declare-fun b!264533 () Bool)

(assert (=> b!264533 (= c!45280 (and ((_ is Cons!3848) (toList!1961 lt!133254)) (bvsgt (_1!2500 (h!4514 (toList!1961 lt!133254))) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(declare-fun e!171387 () List!3852)

(declare-fun e!171384 () List!3852)

(assert (=> b!264533 (= e!171387 e!171384)))

(declare-fun b!264534 () Bool)

(declare-fun e!171386 () List!3852)

(assert (=> b!264534 (= e!171386 e!171387)))

(declare-fun c!45283 () Bool)

(assert (=> b!264534 (= c!45283 (and ((_ is Cons!3848) (toList!1961 lt!133254)) (= (_1!2500 (h!4514 (toList!1961 lt!133254))) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(declare-fun b!264535 () Bool)

(assert (=> b!264535 (= e!171388 (contains!1914 lt!133878 (tuple2!4979 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(declare-fun b!264536 () Bool)

(assert (=> b!264536 (= e!171386 call!25307)))

(declare-fun b!264537 () Bool)

(assert (=> b!264537 (= e!171387 call!25308)))

(declare-fun e!171385 () List!3852)

(declare-fun b!264538 () Bool)

(assert (=> b!264538 (= e!171385 (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133254)) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun b!264539 () Bool)

(assert (=> b!264539 (= e!171384 call!25306)))

(declare-fun c!45282 () Bool)

(declare-fun bm!25305 () Bool)

(assert (=> bm!25305 (= call!25307 ($colon$colon!108 e!171385 (ite c!45282 (h!4514 (toList!1961 lt!133254)) (tuple2!4979 (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))))

(declare-fun c!45281 () Bool)

(assert (=> bm!25305 (= c!45281 c!45282)))

(declare-fun d!64043 () Bool)

(assert (=> d!64043 e!171388))

(declare-fun res!129077 () Bool)

(assert (=> d!64043 (=> (not res!129077) (not e!171388))))

(assert (=> d!64043 (= res!129077 (isStrictlySorted!377 lt!133878))))

(assert (=> d!64043 (= lt!133878 e!171386)))

(assert (=> d!64043 (= c!45282 (and ((_ is Cons!3848) (toList!1961 lt!133254)) (bvslt (_1!2500 (h!4514 (toList!1961 lt!133254))) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(assert (=> d!64043 (isStrictlySorted!377 (toList!1961 lt!133254))))

(assert (=> d!64043 (= (insertStrictlySorted!179 (toList!1961 lt!133254) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))) (_2!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) lt!133878)))

(declare-fun b!264540 () Bool)

(assert (=> b!264540 (= e!171384 call!25306)))

(declare-fun b!264541 () Bool)

(assert (=> b!264541 (= e!171385 (ite c!45283 (t!8929 (toList!1961 lt!133254)) (ite c!45280 (Cons!3848 (h!4514 (toList!1961 lt!133254)) (t!8929 (toList!1961 lt!133254))) Nil!3849)))))

(assert (= (and d!64043 c!45282) b!264536))

(assert (= (and d!64043 (not c!45282)) b!264534))

(assert (= (and b!264534 c!45283) b!264537))

(assert (= (and b!264534 (not c!45283)) b!264533))

(assert (= (and b!264533 c!45280) b!264540))

(assert (= (and b!264533 (not c!45280)) b!264539))

(assert (= (or b!264540 b!264539) bm!25304))

(assert (= (or b!264537 bm!25304) bm!25303))

(assert (= (or b!264536 bm!25303) bm!25305))

(assert (= (and bm!25305 c!45281) b!264538))

(assert (= (and bm!25305 (not c!45281)) b!264541))

(assert (= (and d!64043 res!129077) b!264532))

(assert (= (and b!264532 res!129076) b!264535))

(declare-fun m!281583 () Bool)

(assert (=> bm!25305 m!281583))

(declare-fun m!281585 () Bool)

(assert (=> b!264538 m!281585))

(declare-fun m!281587 () Bool)

(assert (=> b!264535 m!281587))

(declare-fun m!281589 () Bool)

(assert (=> b!264532 m!281589))

(declare-fun m!281591 () Bool)

(assert (=> d!64043 m!281591))

(declare-fun m!281593 () Bool)

(assert (=> d!64043 m!281593))

(assert (=> d!63341 d!64043))

(assert (=> b!263610 d!63885))

(assert (=> b!263610 d!63887))

(declare-fun d!64045 () Bool)

(declare-fun res!129078 () Bool)

(declare-fun e!171389 () Bool)

(assert (=> d!64045 (=> res!129078 e!171389)))

(assert (=> d!64045 (= res!129078 (and ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (= (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (select (arr!5999 lt!133026) index!297))))))

(assert (=> d!64045 (= (containsKey!312 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))) (select (arr!5999 lt!133026) index!297)) e!171389)))

(declare-fun b!264542 () Bool)

(declare-fun e!171390 () Bool)

(assert (=> b!264542 (= e!171389 e!171390)))

(declare-fun res!129079 () Bool)

(assert (=> b!264542 (=> (not res!129079) (not e!171390))))

(assert (=> b!264542 (= res!129079 (and (or (not ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (bvsle (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (select (arr!5999 lt!133026) index!297))) ((_ is Cons!3848) (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (bvslt (_1!2500 (h!4514 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504))))) (select (arr!5999 lt!133026) index!297))))))

(declare-fun b!264543 () Bool)

(assert (=> b!264543 (= e!171390 (containsKey!312 (t!8929 (toList!1961 (getCurrentListMap!1489 lt!133026 lt!133023 (mask!11209 thiss!1504) (extraKeys!4580 thiss!1504) (zeroValue!4684 thiss!1504) (minValue!4684 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4843 thiss!1504)))) (select (arr!5999 lt!133026) index!297)))))

(assert (= (and d!64045 (not res!129078)) b!264542))

(assert (= (and b!264542 res!129079) b!264543))

(assert (=> b!264543 m!279307))

(declare-fun m!281595 () Bool)

(assert (=> b!264543 m!281595))

(assert (=> d!63201 d!64045))

(assert (=> d!63315 d!63293))

(declare-fun d!64047 () Bool)

(assert (=> d!64047 (= (apply!262 (+!710 lt!133203 (tuple2!4979 lt!133202 (minValue!4684 thiss!1504))) lt!133186) (apply!262 lt!133203 lt!133186))))

(assert (=> d!64047 true))

(declare-fun _$34!1139 () Unit!8190)

(assert (=> d!64047 (= (choose!1295 lt!133203 lt!133202 (minValue!4684 thiss!1504) lt!133186) _$34!1139)))

(declare-fun bs!9338 () Bool)

(assert (= bs!9338 d!64047))

(assert (=> bs!9338 m!279215))

(assert (=> bs!9338 m!279215))

(assert (=> bs!9338 m!279217))

(assert (=> bs!9338 m!279225))

(assert (=> d!63315 d!64047))

(assert (=> d!63315 d!63305))

(assert (=> d!63315 d!63295))

(declare-fun d!64049 () Bool)

(declare-fun e!171391 () Bool)

(assert (=> d!64049 e!171391))

(declare-fun res!129080 () Bool)

(assert (=> d!64049 (=> res!129080 e!171391)))

(declare-fun lt!133880 () Bool)

(assert (=> d!64049 (= res!129080 (not lt!133880))))

(declare-fun lt!133879 () Bool)

(assert (=> d!64049 (= lt!133880 lt!133879)))

(declare-fun lt!133881 () Unit!8190)

(declare-fun e!171392 () Unit!8190)

(assert (=> d!64049 (= lt!133881 e!171392)))

(declare-fun c!45284 () Bool)

(assert (=> d!64049 (= c!45284 lt!133879)))

(assert (=> d!64049 (= lt!133879 (containsKey!312 (toList!1961 lt!133203) lt!133186))))

(assert (=> d!64049 (= (contains!1912 lt!133203 lt!133186) lt!133880)))

(declare-fun b!264544 () Bool)

(declare-fun lt!133882 () Unit!8190)

(assert (=> b!264544 (= e!171392 lt!133882)))

(assert (=> b!264544 (= lt!133882 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1961 lt!133203) lt!133186))))

(assert (=> b!264544 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133203) lt!133186))))

(declare-fun b!264545 () Bool)

(declare-fun Unit!8254 () Unit!8190)

(assert (=> b!264545 (= e!171392 Unit!8254)))

(declare-fun b!264546 () Bool)

(assert (=> b!264546 (= e!171391 (isDefined!261 (getValueByKey!320 (toList!1961 lt!133203) lt!133186)))))

(assert (= (and d!64049 c!45284) b!264544))

(assert (= (and d!64049 (not c!45284)) b!264545))

(assert (= (and d!64049 (not res!129080)) b!264546))

(declare-fun m!281597 () Bool)

(assert (=> d!64049 m!281597))

(declare-fun m!281599 () Bool)

(assert (=> b!264544 m!281599))

(assert (=> b!264544 m!279811))

(assert (=> b!264544 m!279811))

(declare-fun m!281601 () Bool)

(assert (=> b!264544 m!281601))

(assert (=> b!264546 m!279811))

(assert (=> b!264546 m!279811))

(assert (=> b!264546 m!281601))

(assert (=> d!63315 d!64049))

(assert (=> b!263441 d!63477))

(declare-fun e!171394 () Option!326)

(declare-fun b!264549 () Bool)

(assert (=> b!264549 (= e!171394 (getValueByKey!320 (t!8929 (toList!1961 lt!133472)) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))

(declare-fun b!264547 () Bool)

(declare-fun e!171393 () Option!326)

(assert (=> b!264547 (= e!171393 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133472)))))))

(declare-fun c!45285 () Bool)

(declare-fun d!64051 () Bool)

(assert (=> d!64051 (= c!45285 (and ((_ is Cons!3848) (toList!1961 lt!133472)) (= (_1!2500 (h!4514 (toList!1961 lt!133472))) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504))))))))

(assert (=> d!64051 (= (getValueByKey!320 (toList!1961 lt!133472) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))) e!171393)))

(declare-fun b!264550 () Bool)

(assert (=> b!264550 (= e!171394 None!324)))

(declare-fun b!264548 () Bool)

(assert (=> b!264548 (= e!171393 e!171394)))

(declare-fun c!45286 () Bool)

(assert (=> b!264548 (= c!45286 (and ((_ is Cons!3848) (toList!1961 lt!133472)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133472))) (_1!2500 (tuple2!4979 lt!133243 (minValue!4684 thiss!1504)))))))))

(assert (= (and d!64051 c!45285) b!264547))

(assert (= (and d!64051 (not c!45285)) b!264548))

(assert (= (and b!264548 c!45286) b!264549))

(assert (= (and b!264548 (not c!45286)) b!264550))

(declare-fun m!281603 () Bool)

(assert (=> b!264549 m!281603))

(assert (=> b!263650 d!64051))

(declare-fun d!64053 () Bool)

(declare-fun lt!133883 () Bool)

(assert (=> d!64053 (= lt!133883 (select (content!177 Nil!3850) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun e!171395 () Bool)

(assert (=> d!64053 (= lt!133883 e!171395)))

(declare-fun res!129082 () Bool)

(assert (=> d!64053 (=> (not res!129082) (not e!171395))))

(assert (=> d!64053 (= res!129082 ((_ is Cons!3849) Nil!3850))))

(assert (=> d!64053 (= (contains!1915 Nil!3850 (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)) lt!133883)))

(declare-fun b!264551 () Bool)

(declare-fun e!171396 () Bool)

(assert (=> b!264551 (= e!171395 e!171396)))

(declare-fun res!129081 () Bool)

(assert (=> b!264551 (=> res!129081 e!171396)))

(assert (=> b!264551 (= res!129081 (= (h!4515 Nil!3850) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(declare-fun b!264552 () Bool)

(assert (=> b!264552 (= e!171396 (contains!1915 (t!8930 Nil!3850) (select (arr!5999 (_keys!7035 lt!133015)) #b00000000000000000000000000000000)))))

(assert (= (and d!64053 res!129082) b!264551))

(assert (= (and b!264551 (not res!129081)) b!264552))

(assert (=> d!64053 m!279469))

(assert (=> d!64053 m!279591))

(declare-fun m!281605 () Bool)

(assert (=> d!64053 m!281605))

(assert (=> b!264552 m!279591))

(declare-fun m!281607 () Bool)

(assert (=> b!264552 m!281607))

(assert (=> b!263447 d!64053))

(declare-fun b!264553 () Bool)

(declare-fun e!171397 () (_ BitVec 32))

(assert (=> b!264553 (= e!171397 #b00000000000000000000000000000000)))

(declare-fun b!264555 () Bool)

(declare-fun e!171398 () (_ BitVec 32))

(assert (=> b!264555 (= e!171397 e!171398)))

(declare-fun c!45288 () Bool)

(assert (=> b!264555 (= c!45288 (validKeyInArray!0 (select (arr!5999 lt!133026) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!264556 () Bool)

(declare-fun call!25309 () (_ BitVec 32))

(assert (=> b!264556 (= e!171398 call!25309)))

(declare-fun bm!25306 () Bool)

(assert (=> bm!25306 (= call!25309 (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun d!64055 () Bool)

(declare-fun lt!133884 () (_ BitVec 32))

(assert (=> d!64055 (and (bvsge lt!133884 #b00000000000000000000000000000000) (bvsle lt!133884 (bvsub (size!6350 lt!133026) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!64055 (= lt!133884 e!171397)))

(declare-fun c!45287 () Bool)

(assert (=> d!64055 (= c!45287 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!64055 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6350 lt!133026)))))

(assert (=> d!64055 (= (arrayCountValidKeys!0 lt!133026 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)) lt!133884)))

(declare-fun b!264554 () Bool)

(assert (=> b!264554 (= e!171398 (bvadd #b00000000000000000000000000000001 call!25309))))

(assert (= (and d!64055 c!45287) b!264553))

(assert (= (and d!64055 (not c!45287)) b!264555))

(assert (= (and b!264555 c!45288) b!264554))

(assert (= (and b!264555 (not c!45288)) b!264556))

(assert (= (or b!264554 b!264556) bm!25306))

(assert (=> b!264555 m!279491))

(assert (=> b!264555 m!279491))

(assert (=> b!264555 m!279493))

(declare-fun m!281609 () Bool)

(assert (=> bm!25306 m!281609))

(assert (=> bm!25231 d!64055))

(assert (=> bm!25240 d!63425))

(declare-fun bm!25307 () Bool)

(declare-fun call!25312 () List!3852)

(declare-fun call!25311 () List!3852)

(assert (=> bm!25307 (= call!25312 call!25311)))

(declare-fun bm!25308 () Bool)

(declare-fun call!25310 () List!3852)

(assert (=> bm!25308 (= call!25310 call!25312)))

(declare-fun b!264557 () Bool)

(declare-fun res!129083 () Bool)

(declare-fun e!171403 () Bool)

(assert (=> b!264557 (=> (not res!129083) (not e!171403))))

(declare-fun lt!133885 () List!3852)

(assert (=> b!264557 (= res!129083 (containsKey!312 lt!133885 (_1!2500 lt!133020)))))

(declare-fun b!264558 () Bool)

(declare-fun c!45289 () Bool)

(assert (=> b!264558 (= c!45289 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (bvsgt (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) (_1!2500 lt!133020))))))

(declare-fun e!171402 () List!3852)

(declare-fun e!171399 () List!3852)

(assert (=> b!264558 (= e!171402 e!171399)))

(declare-fun b!264559 () Bool)

(declare-fun e!171401 () List!3852)

(assert (=> b!264559 (= e!171401 e!171402)))

(declare-fun c!45292 () Bool)

(assert (=> b!264559 (= c!45292 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (= (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) (_1!2500 lt!133020))))))

(declare-fun b!264560 () Bool)

(assert (=> b!264560 (= e!171403 (contains!1914 lt!133885 (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020))))))

(declare-fun b!264561 () Bool)

(assert (=> b!264561 (= e!171401 call!25311)))

(declare-fun b!264562 () Bool)

(assert (=> b!264562 (= e!171402 call!25312)))

(declare-fun b!264563 () Bool)

(declare-fun e!171400 () List!3852)

(assert (=> b!264563 (= e!171400 (insertStrictlySorted!179 (t!8929 (t!8929 (toList!1961 lt!133012))) (_1!2500 lt!133020) (_2!2500 lt!133020)))))

(declare-fun b!264564 () Bool)

(assert (=> b!264564 (= e!171399 call!25310)))

(declare-fun c!45291 () Bool)

(declare-fun bm!25309 () Bool)

(assert (=> bm!25309 (= call!25311 ($colon$colon!108 e!171400 (ite c!45291 (h!4514 (t!8929 (toList!1961 lt!133012))) (tuple2!4979 (_1!2500 lt!133020) (_2!2500 lt!133020)))))))

(declare-fun c!45290 () Bool)

(assert (=> bm!25309 (= c!45290 c!45291)))

(declare-fun d!64057 () Bool)

(assert (=> d!64057 e!171403))

(declare-fun res!129084 () Bool)

(assert (=> d!64057 (=> (not res!129084) (not e!171403))))

(assert (=> d!64057 (= res!129084 (isStrictlySorted!377 lt!133885))))

(assert (=> d!64057 (= lt!133885 e!171401)))

(assert (=> d!64057 (= c!45291 (and ((_ is Cons!3848) (t!8929 (toList!1961 lt!133012))) (bvslt (_1!2500 (h!4514 (t!8929 (toList!1961 lt!133012)))) (_1!2500 lt!133020))))))

(assert (=> d!64057 (isStrictlySorted!377 (t!8929 (toList!1961 lt!133012)))))

(assert (=> d!64057 (= (insertStrictlySorted!179 (t!8929 (toList!1961 lt!133012)) (_1!2500 lt!133020) (_2!2500 lt!133020)) lt!133885)))

(declare-fun b!264565 () Bool)

(assert (=> b!264565 (= e!171399 call!25310)))

(declare-fun b!264566 () Bool)

(assert (=> b!264566 (= e!171400 (ite c!45292 (t!8929 (t!8929 (toList!1961 lt!133012))) (ite c!45289 (Cons!3848 (h!4514 (t!8929 (toList!1961 lt!133012))) (t!8929 (t!8929 (toList!1961 lt!133012)))) Nil!3849)))))

(assert (= (and d!64057 c!45291) b!264561))

(assert (= (and d!64057 (not c!45291)) b!264559))

(assert (= (and b!264559 c!45292) b!264562))

(assert (= (and b!264559 (not c!45292)) b!264558))

(assert (= (and b!264558 c!45289) b!264565))

(assert (= (and b!264558 (not c!45289)) b!264564))

(assert (= (or b!264565 b!264564) bm!25308))

(assert (= (or b!264562 bm!25308) bm!25307))

(assert (= (or b!264561 bm!25307) bm!25309))

(assert (= (and bm!25309 c!45290) b!264563))

(assert (= (and bm!25309 (not c!45290)) b!264566))

(assert (= (and d!64057 res!129084) b!264557))

(assert (= (and b!264557 res!129083) b!264560))

(declare-fun m!281611 () Bool)

(assert (=> bm!25309 m!281611))

(declare-fun m!281613 () Bool)

(assert (=> b!264563 m!281613))

(declare-fun m!281615 () Bool)

(assert (=> b!264560 m!281615))

(declare-fun m!281617 () Bool)

(assert (=> b!264557 m!281617))

(declare-fun m!281619 () Bool)

(assert (=> d!64057 m!281619))

(assert (=> d!64057 m!281051))

(assert (=> b!263559 d!64057))

(declare-fun d!64059 () Bool)

(assert (=> d!64059 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133203) lt!133186)) (v!5508 (getValueByKey!320 (toList!1961 lt!133203) lt!133186)))))

(assert (=> d!63293 d!64059))

(declare-fun b!264569 () Bool)

(declare-fun e!171405 () Option!326)

(assert (=> b!264569 (= e!171405 (getValueByKey!320 (t!8929 (toList!1961 lt!133203)) lt!133186))))

(declare-fun b!264567 () Bool)

(declare-fun e!171404 () Option!326)

(assert (=> b!264567 (= e!171404 (Some!325 (_2!2500 (h!4514 (toList!1961 lt!133203)))))))

(declare-fun d!64061 () Bool)

(declare-fun c!45293 () Bool)

(assert (=> d!64061 (= c!45293 (and ((_ is Cons!3848) (toList!1961 lt!133203)) (= (_1!2500 (h!4514 (toList!1961 lt!133203))) lt!133186)))))

(assert (=> d!64061 (= (getValueByKey!320 (toList!1961 lt!133203) lt!133186) e!171404)))

(declare-fun b!264570 () Bool)

(assert (=> b!264570 (= e!171405 None!324)))

(declare-fun b!264568 () Bool)

(assert (=> b!264568 (= e!171404 e!171405)))

(declare-fun c!45294 () Bool)

(assert (=> b!264568 (= c!45294 (and ((_ is Cons!3848) (toList!1961 lt!133203)) (not (= (_1!2500 (h!4514 (toList!1961 lt!133203))) lt!133186))))))

(assert (= (and d!64061 c!45293) b!264567))

(assert (= (and d!64061 (not c!45293)) b!264568))

(assert (= (and b!264568 c!45294) b!264569))

(assert (= (and b!264568 (not c!45294)) b!264570))

(declare-fun m!281621 () Bool)

(assert (=> b!264569 m!281621))

(assert (=> d!63293 d!64061))

(assert (=> bm!25233 d!63519))

(declare-fun d!64063 () Bool)

(assert (=> d!64063 (= (get!3094 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))) (v!5508 (getValueByKey!320 (toList!1961 lt!133201) (select (arr!5999 (_keys!7035 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63191 d!64063))

(assert (=> d!63191 d!63685))

(declare-fun condMapEmpty!11358 () Bool)

(declare-fun mapDefault!11358 () ValueCell!2985)

(assert (=> mapNonEmpty!11357 (= condMapEmpty!11358 (= mapRest!11357 ((as const (Array (_ BitVec 32) ValueCell!2985)) mapDefault!11358)))))

(declare-fun e!171406 () Bool)

(declare-fun mapRes!11358 () Bool)

(assert (=> mapNonEmpty!11357 (= tp!23732 (and e!171406 mapRes!11358))))

(declare-fun b!264572 () Bool)

(assert (=> b!264572 (= e!171406 tp_is_empty!6657)))

(declare-fun mapIsEmpty!11358 () Bool)

(assert (=> mapIsEmpty!11358 mapRes!11358))

(declare-fun mapNonEmpty!11358 () Bool)

(declare-fun tp!23733 () Bool)

(declare-fun e!171407 () Bool)

(assert (=> mapNonEmpty!11358 (= mapRes!11358 (and tp!23733 e!171407))))

(declare-fun mapRest!11358 () (Array (_ BitVec 32) ValueCell!2985))

(declare-fun mapKey!11358 () (_ BitVec 32))

(declare-fun mapValue!11358 () ValueCell!2985)

(assert (=> mapNonEmpty!11358 (= mapRest!11357 (store mapRest!11358 mapKey!11358 mapValue!11358))))

(declare-fun b!264571 () Bool)

(assert (=> b!264571 (= e!171407 tp_is_empty!6657)))

(assert (= (and mapNonEmpty!11357 condMapEmpty!11358) mapIsEmpty!11358))

(assert (= (and mapNonEmpty!11357 (not condMapEmpty!11358)) mapNonEmpty!11358))

(assert (= (and mapNonEmpty!11358 ((_ is ValueCellFull!2985) mapValue!11358)) b!264571))

(assert (= (and mapNonEmpty!11357 ((_ is ValueCellFull!2985) mapDefault!11358)) b!264572))

(declare-fun m!281623 () Bool)

(assert (=> mapNonEmpty!11358 m!281623))

(declare-fun b_lambda!8377 () Bool)

(assert (= b_lambda!8375 (or (and b!262934 b_free!6795) b_lambda!8377)))

(declare-fun b_lambda!8379 () Bool)

(assert (= b_lambda!8365 (or (and b!262934 b_free!6795) b_lambda!8379)))

(declare-fun b_lambda!8381 () Bool)

(assert (= b_lambda!8367 (or (and b!262934 b_free!6795) b_lambda!8381)))

(declare-fun b_lambda!8383 () Bool)

(assert (= b_lambda!8369 (or (and b!262934 b_free!6795) b_lambda!8383)))

(declare-fun b_lambda!8385 () Bool)

(assert (= b_lambda!8371 (or (and b!262934 b_free!6795) b_lambda!8385)))

(declare-fun b_lambda!8387 () Bool)

(assert (= b_lambda!8349 (or (and b!262934 b_free!6795 (= (defaultEntry!4843 thiss!1504) (defaultEntry!4843 lt!133015))) b_lambda!8387)))

(declare-fun b_lambda!8389 () Bool)

(assert (= b_lambda!8373 (or (and b!262934 b_free!6795) b_lambda!8389)))

(check-sat (not b!264252) (not d!63851) (not b!264497) (not d!63823) (not b!264557) (not d!63825) (not b!264227) (not b!263755) (not b!263903) (not b!263829) (not d!63633) (not b!263976) (not d!63721) (not b!264288) (not b!263756) (not b!263847) (not d!63753) (not b!263819) (not b!263967) (not b!263737) (not b!264444) (not b!263721) (not b!264255) (not d!63647) (not d!63453) (not b!264454) (not d!63927) (not d!63853) (not d!63791) (not d!63993) (not d!63689) (not d!63761) (not b!263807) (not b!264377) (not b!264022) (not b!264443) (not b!264549) (not b!264079) (not b!264133) (not b!264053) (not b!264408) (not b!263867) (not b!264198) (not bm!25274) (not d!63615) (not b!264129) (not d!63957) (not bm!25301) (not bm!25305) (not b!263774) (not b!263898) (not d!63409) (not b!263779) (not b!263775) (not d!63719) (not b!263873) (not b!264246) (not d!63595) (not d!63393) (not b!264062) (not b!264076) (not b!264219) (not d!63845) (not d!63741) (not b!264367) (not bm!25291) (not b_lambda!8355) (not b_lambda!8377) (not d!63737) (not d!63895) (not b!264494) (not b!264406) (not b!264141) (not b!263834) (not bm!25295) (not d!63645) (not b!264304) (not b_lambda!8385) (not d!63919) (not b!264461) (not b!264240) (not d!63843) (not d!64057) (not d!63837) (not b!263899) (not b!264466) (not b!264116) (not d!63883) (not b!264506) (not b!264145) (not b!264349) (not b!264366) (not b!263849) (not b!264523) (not b!264456) (not d!63975) (not b!264149) (not d!63507) (not b!264525) (not d!63931) (not d!63867) (not b!264160) (not b!263931) (not b!264386) (not b!263941) (not b!263988) (not b!264374) (not d!63847) (not b!264143) (not b!264033) (not b!264431) (not d!63759) (not b!264212) (not b!264503) (not b!263771) (not b!264113) (not d!64011) (not d!63465) (not d!63809) (not b!264403) (not d!64033) (not b!264336) (not b!264451) (not d!63911) (not d!63433) (not d!63959) (not d!63413) (not d!63425) (not b!264060) (not d!64031) (not b_next!6795) (not b!263811) (not d!63955) (not b!264522) (not b!264427) (not bm!25269) (not b!263896) (not d!63681) (not b!263845) (not d!64023) (not b!264373) (not b!263952) (not b!264468) (not b!264256) (not d!63763) (not b!264195) (not d!63611) (not d!63559) (not b!263764) (not bm!25292) (not b!264183) (not b!263992) (not d!64007) (not b!263768) (not d!63835) (not d!63805) (not b!263831) (not b!263809) (not b_lambda!8363) (not b!264552) (not b!263742) (not b!264471) (not d!63625) (not bm!25306) (not d!64009) (not b!263974) (not d!63671) (not b!263965) (not b!264234) (not b!264151) (not b_lambda!8357) (not b!264012) (not b!264153) (not d!64027) (not d!63619) (not b!264036) (not b!264204) (not b!264335) (not d!63953) (not b!263982) (not b!263822) (not b!264222) (not b!263862) (not b!264331) (not b!263732) (not b!263815) (not b!264090) (not b!264435) (not bm!25275) (not b!263880) (not d!63885) (not b!263728) (not b!264103) (not b!263935) (not b!264359) (not b!264047) (not d!63455) (not d!63999) (not d!63711) (not d!63767) (not b_lambda!8383) (not d!63569) (not b!264449) (not bm!25309) (not d!63747) (not b!264017) (not b!264216) (not b!264044) (not b!264269) (not b!263913) (not b!264084) (not d!63771) (not d!63631) (not d!63549) (not bm!25279) (not d!63445) (not b!263906) (not b!263778) (not bm!25298) (not b!263813) (not b!264485) (not b!264099) (not d!63531) (not mapNonEmpty!11358) (not b!263843) (not b!264440) (not d!63629) (not b!264277) (not b!263900) (not b!263886) (not b!264241) (not d!63811) (not d!63985) (not d!64037) (not b!264063) (not b!264270) (not bm!25281) (not b!264569) (not b!263894) (not bm!25288) (not b_lambda!8353) (not b!264106) tp_is_empty!6657 (not d!63971) (not b!264338) (not b!264254) (not d!63969) (not b!264164) (not b!263985) (not b!264530) (not bm!25270) (not b_lambda!8337) (not d!63793) (not b!264067) (not b!264026) (not b!264482) (not b!264002) (not b!264560) (not b!264024) (not d!63827) (not b_lambda!8379) (not b!264130) (not b!263795) (not b!263767) (not d!63527) (not d!63727) (not b!263762) (not b!263999) (not b!264423) (not b!263759) (not b!264459) (not d!63655) (not b!264354) (not b!264137) (not b!264267) (not b!264517) (not b!264109) (not d!63467) (not b!263861) (not b!264082) (not b!263817) (not d!63439) (not d!63807) (not b!264259) (not b!264158) (not d!63947) (not d!63897) (not b!264289) (not b!264528) (not b!264201) (not b!263921) (not b!264247) (not b!264147) (not b!264416) (not b!264555) (not d!63797) (not b!264144) (not b!263957) (not bm!25280) (not b!263797) (not d!64041) (not b!263773) (not d!63743) (not d!63403) (not b!264039) (not b!264176) (not b!264450) (not b!263860) (not b!264396) (not b!264094) (not d!63663) (not b!264357) (not b!264123) (not d!63877) (not b!263979) (not d!63707) (not d!63515) (not b!264095) (not b!263868) (not b!264292) (not d!63991) (not b!263864) (not b!264446) (not d!63697) (not d!63871) (not b!264458) (not b!264096) (not b!264434) (not b!263848) (not d!64035) (not d!63651) (not b!264312) (not b!264249) (not d!63391) (not b!264432) (not d!63535) (not b!264229) (not b!264417) (not b!264086) (not b!264285) (not d!63421) (not b!264370) (not b!264271) (not d!63419) (not b!264327) (not b!264410) (not d!63777) (not b_lambda!8361) (not d!63989) (not b!263830) (not b!264009) (not b!264316) (not b!264479) (not b!264563) (not d!63603) (not d!63973) (not b!264400) (not b!263790) (not b_lambda!8351) (not b!264214) (not b!263870) (not d!63923) (not d!63673) (not d!63917) (not b!264127) (not d!63657) (not d!63995) (not d!63683) (not d!63423) (not b!263785) (not b!264131) (not b!263752) (not d!63601) (not d!63529) (not d!63841) (not b!264437) (not b!263749) (not b!263879) (not b!264111) (not b!264172) (not b!264004) (not b!263892) (not b!264492) (not d!63411) (not d!63889) (not b!264538) (not b!264453) (not b!264499) (not b!264064) (not bm!25262) (not b!264535) (not b!264546) (not b!264301) (not b!263787) (not b!264413) (not d!63459) (not b!264291) (not b_lambda!8381) (not b!263854) (not b!264531) (not bm!25266) (not b!263945) (not d!63415) (not d!63831) (not b!264544) (not d!63567) (not b!264318) (not b!264324) (not bm!25282) (not b!263827) (not bm!25252) (not bm!25251) (not b!264029) (not b!264356) (not b!264296) (not b!264161) (not bm!25285) (not b!264014) (not d!63829) (not b!264376) (not bm!25247) (not b!264505) (not b!263895) (not b!264371) (not b!264512) (not b!264392) (not b!263878) (not b!263937) (not b!264019) (not d!63783) (not b!263757) (not d!63943) (not d!63399) (not b!264339) (not d!63429) (not b!264159) (not b!264016) (not b_lambda!8359) (not b!264298) (not d!63725) (not b!263824) (not b!264070) (not d!63979) (not d!63865) (not b!263782) (not d!63977) (not d!63487) (not bm!25263) (not d!63935) (not b!263994) (not d!63483) (not b!263970) (not b!263996) (not b!263780) (not b!264467) (not d!63509) (not b!264243) (not b!264011) (not d!64017) (not d!63519) (not b!264238) (not bm!25278) (not d!63493) (not b!263876) (not d!63787) (not d!63441) (not b!263905) (not b_lambda!8335) (not bm!25258) (not bm!25259) (not d!63833) (not b!264368) (not d!63949) (not b!264532) (not b!263855) (not b!264501) (not d!64003) (not b!263949) (not b!264032) (not d!63705) (not b!263792) (not d!64053) (not d!63437) (not b_lambda!8387) (not b!263739) (not b!264186) (not b!264209) (not d!63479) (not b!263724) (not b!263763) (not b!263799) (not d!63561) (not d!63387) (not b!263857) (not b!264294) (not bm!25257) (not b!263738) (not b!264162) (not b!264448) (not d!63839) (not b!263928) (not b!263990) (not d!63613) (not d!63641) (not d!63523) (not d!63907) (not b!264389) (not d!63427) (not b!264050) (not b!264179) (not d!63637) (not d!63513) (not d!64015) (not b!264057) (not b!264189) (not b!263883) (not b!264415) (not d!63723) (not d!63491) (not b!263821) (not b!263745) (not d!63717) (not b!264207) (not b!264007) (not b!264091) (not d!63899) (not b!263715) (not b!263758) (not bm!25271) (not b!264429) (not b!263735) (not b!264215) (not d!63581) (not d!63775) (not b!264308) (not d!63789) (not b!264282) (not b!264379) (not b!263915) (not bm!25250) (not d!63545) (not b!264543) (not b!264206) (not b!264342) (not b!264119) (not b!263918) (not d!63881) (not b!264297) (not b_lambda!8389) (not d!64043) (not b!263852) (not b!263837) (not b!263844) (not b!263871) (not b!263766) (not bm!25256) (not b!263925) (not d!63821) (not b!264165) (not b!264101) (not bm!25253) (not b!264031) (not b!264085) (not b!264174) (not d!63755) (not b!264181) (not b!264055) (not d!63435) (not bm!25302) (not b!264092) (not b!263908) (not b!263730) (not b!264382) (not d!63417) (not d!63431) (not d!63951) (not d!63443) (not b!264385) (not d!63869) (not b!264420) (not b!264244) (not d!63489) b_and!13971 (not b!263842) (not b!264168) (not d!63751) (not b!264397) (not b!264262) (not b!263961) (not d!63701) (not d!63915) (not b!264300) (not b!264490) (not d!63799) (not b!263761) (not b!264295) (not d!63929) (not b!263805) (not b!264384) (not d!63981) (not b!264474) (not d!64047) (not b!264120) (not b!263914) (not d!63849) (not b!263911) (not b!263750) (not b!264182) (not d!64049) (not b!264464) (not b!264520) (not b!263812) (not d!63405) (not d!63901) (not b!264509) (not b!264088) (not b!264330) (not b!264333))
(check-sat b_and!13971 (not b_next!6795))
