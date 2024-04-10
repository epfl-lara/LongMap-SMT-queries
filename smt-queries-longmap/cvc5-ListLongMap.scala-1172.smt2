; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25134 () Bool)

(assert start!25134)

(declare-fun b!261970 () Bool)

(declare-fun b_free!6781 () Bool)

(declare-fun b_next!6781 () Bool)

(assert (=> b!261970 (= b_free!6781 (not b_next!6781))))

(declare-fun tp!23673 () Bool)

(declare-fun b_and!13915 () Bool)

(assert (=> b!261970 (= tp!23673 b_and!13915)))

(declare-fun b!261966 () Bool)

(declare-datatypes ((Unit!8155 0))(
  ( (Unit!8156) )
))
(declare-fun e!169764 () Unit!8155)

(declare-fun Unit!8157 () Unit!8155)

(assert (=> b!261966 (= e!169764 Unit!8157)))

(declare-fun b!261967 () Bool)

(declare-fun e!169767 () Bool)

(declare-fun e!169766 () Bool)

(assert (=> b!261967 (= e!169767 e!169766)))

(declare-fun res!127968 () Bool)

(assert (=> b!261967 (=> (not res!127968) (not e!169766))))

(declare-datatypes ((SeekEntryResult!1193 0))(
  ( (MissingZero!1193 (index!6942 (_ BitVec 32))) (Found!1193 (index!6943 (_ BitVec 32))) (Intermediate!1193 (undefined!2005 Bool) (index!6944 (_ BitVec 32)) (x!25199 (_ BitVec 32))) (Undefined!1193) (MissingVacant!1193 (index!6945 (_ BitVec 32))) )
))
(declare-fun lt!132341 () SeekEntryResult!1193)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261967 (= res!127968 (or (= lt!132341 (MissingZero!1193 index!297)) (= lt!132341 (MissingVacant!1193 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8505 0))(
  ( (V!8506 (val!3366 Int)) )
))
(declare-datatypes ((ValueCell!2978 0))(
  ( (ValueCellFull!2978 (v!5491 V!8505)) (EmptyCell!2978) )
))
(declare-datatypes ((array!12643 0))(
  ( (array!12644 (arr!5984 (Array (_ BitVec 32) ValueCell!2978)) (size!6335 (_ BitVec 32))) )
))
(declare-datatypes ((array!12645 0))(
  ( (array!12646 (arr!5985 (Array (_ BitVec 32) (_ BitVec 64))) (size!6336 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3856 0))(
  ( (LongMapFixedSize!3857 (defaultEntry!4826 Int) (mask!11178 (_ BitVec 32)) (extraKeys!4563 (_ BitVec 32)) (zeroValue!4667 V!8505) (minValue!4667 V!8505) (_size!1977 (_ BitVec 32)) (_keys!7014 array!12645) (_values!4809 array!12643) (_vacant!1977 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3856)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12645 (_ BitVec 32)) SeekEntryResult!1193)

(assert (=> b!261967 (= lt!132341 (seekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(declare-fun b!261968 () Bool)

(declare-fun res!127964 () Bool)

(assert (=> b!261968 (= res!127964 (= (select (arr!5985 (_keys!7014 thiss!1504)) (index!6945 lt!132341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169762 () Bool)

(assert (=> b!261968 (=> (not res!127964) (not e!169762))))

(declare-fun res!127969 () Bool)

(assert (=> start!25134 (=> (not res!127969) (not e!169767))))

(declare-fun valid!1503 (LongMapFixedSize!3856) Bool)

(assert (=> start!25134 (= res!127969 (valid!1503 thiss!1504))))

(assert (=> start!25134 e!169767))

(declare-fun e!169768 () Bool)

(assert (=> start!25134 e!169768))

(assert (=> start!25134 true))

(declare-fun tp_is_empty!6643 () Bool)

(assert (=> start!25134 tp_is_empty!6643))

(declare-fun bm!25012 () Bool)

(declare-fun c!44621 () Bool)

(declare-fun call!25016 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!25012 (= call!25016 (inRange!0 (ite c!44621 (index!6942 lt!132341) (index!6945 lt!132341)) (mask!11178 thiss!1504)))))

(declare-fun b!261969 () Bool)

(declare-fun res!127970 () Bool)

(declare-fun e!169774 () Bool)

(assert (=> b!261969 (=> (not res!127970) (not e!169774))))

(assert (=> b!261969 (= res!127970 call!25016)))

(declare-fun e!169763 () Bool)

(assert (=> b!261969 (= e!169763 e!169774)))

(declare-fun e!169776 () Bool)

(declare-fun array_inv!3955 (array!12645) Bool)

(declare-fun array_inv!3956 (array!12643) Bool)

(assert (=> b!261970 (= e!169768 (and tp!23673 tp_is_empty!6643 (array_inv!3955 (_keys!7014 thiss!1504)) (array_inv!3956 (_values!4809 thiss!1504)) e!169776))))

(declare-fun b!261971 () Bool)

(declare-fun e!169769 () Bool)

(assert (=> b!261971 (= e!169766 e!169769)))

(declare-fun res!127972 () Bool)

(assert (=> b!261971 (=> (not res!127972) (not e!169769))))

(assert (=> b!261971 (= res!127972 (inRange!0 index!297 (mask!11178 thiss!1504)))))

(declare-fun lt!132345 () Unit!8155)

(declare-fun e!169771 () Unit!8155)

(assert (=> b!261971 (= lt!132345 e!169771)))

(declare-fun c!44623 () Bool)

(declare-datatypes ((tuple2!4964 0))(
  ( (tuple2!4965 (_1!2493 (_ BitVec 64)) (_2!2493 V!8505)) )
))
(declare-datatypes ((List!3840 0))(
  ( (Nil!3837) (Cons!3836 (h!4502 tuple2!4964) (t!8913 List!3840)) )
))
(declare-datatypes ((ListLongMap!3877 0))(
  ( (ListLongMap!3878 (toList!1954 List!3840)) )
))
(declare-fun lt!132352 () ListLongMap!3877)

(declare-fun contains!1901 (ListLongMap!3877 (_ BitVec 64)) Bool)

(assert (=> b!261971 (= c!44623 (contains!1901 lt!132352 key!932))))

(declare-fun getCurrentListMap!1482 (array!12645 array!12643 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) Int) ListLongMap!3877)

(assert (=> b!261971 (= lt!132352 (getCurrentListMap!1482 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun b!261972 () Bool)

(declare-fun c!44622 () Bool)

(assert (=> b!261972 (= c!44622 (is-MissingVacant!1193 lt!132341))))

(declare-fun e!169773 () Bool)

(assert (=> b!261972 (= e!169763 e!169773)))

(declare-fun b!261973 () Bool)

(declare-fun Unit!8158 () Unit!8155)

(assert (=> b!261973 (= e!169771 Unit!8158)))

(declare-fun lt!132343 () Unit!8155)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!450 (array!12645 array!12643 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8155)

(assert (=> b!261973 (= lt!132343 (lemmaInListMapThenSeekEntryOrOpenFindsIt!450 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!261973 false))

(declare-fun b!261974 () Bool)

(declare-fun Unit!8159 () Unit!8155)

(assert (=> b!261974 (= e!169764 Unit!8159)))

(declare-fun lt!132350 () Unit!8155)

(declare-fun lemmaArrayContainsKeyThenInListMap!257 (array!12645 array!12643 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) (_ BitVec 32) Int) Unit!8155)

(assert (=> b!261974 (= lt!132350 (lemmaArrayContainsKeyThenInListMap!257 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!261974 false))

(declare-fun b!261975 () Bool)

(declare-fun e!169765 () Bool)

(assert (=> b!261975 (= e!169769 (not e!169765))))

(declare-fun res!127971 () Bool)

(assert (=> b!261975 (=> res!127971 e!169765)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!261975 (= res!127971 (not (validMask!0 (mask!11178 thiss!1504))))))

(declare-fun lt!132344 () array!12645)

(declare-fun arrayCountValidKeys!0 (array!12645 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261975 (= (arrayCountValidKeys!0 lt!132344 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132348 () Unit!8155)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12645 (_ BitVec 32)) Unit!8155)

(assert (=> b!261975 (= lt!132348 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132344 index!297))))

(declare-fun arrayContainsKey!0 (array!12645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!261975 (arrayContainsKey!0 lt!132344 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132351 () Unit!8155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12645 (_ BitVec 64) (_ BitVec 32)) Unit!8155)

(assert (=> b!261975 (= lt!132351 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132344 key!932 index!297))))

(declare-fun v!346 () V!8505)

(declare-fun +!705 (ListLongMap!3877 tuple2!4964) ListLongMap!3877)

(assert (=> b!261975 (= (+!705 lt!132352 (tuple2!4965 key!932 v!346)) (getCurrentListMap!1482 lt!132344 (array!12644 (store (arr!5984 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6335 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132342 () Unit!8155)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!115 (array!12645 array!12643 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) (_ BitVec 64) V!8505 Int) Unit!8155)

(assert (=> b!261975 (= lt!132342 (lemmaAddValidKeyToArrayThenAddPairToListMap!115 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12645 (_ BitVec 32)) Bool)

(assert (=> b!261975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132344 (mask!11178 thiss!1504))))

(declare-fun lt!132354 () Unit!8155)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12645 (_ BitVec 32) (_ BitVec 32)) Unit!8155)

(assert (=> b!261975 (= lt!132354 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) index!297 (mask!11178 thiss!1504)))))

(assert (=> b!261975 (= (arrayCountValidKeys!0 lt!132344 #b00000000000000000000000000000000 (size!6336 (_keys!7014 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7014 thiss!1504) #b00000000000000000000000000000000 (size!6336 (_keys!7014 thiss!1504)))))))

(declare-fun lt!132346 () Unit!8155)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12645 (_ BitVec 32) (_ BitVec 64)) Unit!8155)

(assert (=> b!261975 (= lt!132346 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7014 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3841 0))(
  ( (Nil!3838) (Cons!3837 (h!4503 (_ BitVec 64)) (t!8914 List!3841)) )
))
(declare-fun arrayNoDuplicates!0 (array!12645 (_ BitVec 32) List!3841) Bool)

(assert (=> b!261975 (arrayNoDuplicates!0 lt!132344 #b00000000000000000000000000000000 Nil!3838)))

(assert (=> b!261975 (= lt!132344 (array!12646 (store (arr!5985 (_keys!7014 thiss!1504)) index!297 key!932) (size!6336 (_keys!7014 thiss!1504))))))

(declare-fun lt!132349 () Unit!8155)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12645 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3841) Unit!8155)

(assert (=> b!261975 (= lt!132349 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7014 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3838))))

(declare-fun lt!132347 () Unit!8155)

(assert (=> b!261975 (= lt!132347 e!169764)))

(declare-fun c!44624 () Bool)

(assert (=> b!261975 (= c!44624 (arrayContainsKey!0 (_keys!7014 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261976 () Bool)

(declare-fun e!169772 () Bool)

(declare-fun mapRes!11323 () Bool)

(assert (=> b!261976 (= e!169776 (and e!169772 mapRes!11323))))

(declare-fun condMapEmpty!11323 () Bool)

(declare-fun mapDefault!11323 () ValueCell!2978)

