; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24868 () Bool)

(assert start!24868)

(declare-fun b!259691 () Bool)

(declare-fun b_free!6755 () Bool)

(declare-fun b_next!6755 () Bool)

(assert (=> b!259691 (= b_free!6755 (not b_next!6755))))

(declare-fun tp!23585 () Bool)

(declare-fun b_and!13857 () Bool)

(assert (=> b!259691 (= tp!23585 b_and!13857)))

(declare-fun b!259685 () Bool)

(declare-datatypes ((Unit!8078 0))(
  ( (Unit!8079) )
))
(declare-fun e!168314 () Unit!8078)

(declare-fun lt!130869 () Unit!8078)

(assert (=> b!259685 (= e!168314 lt!130869)))

(declare-datatypes ((V!8469 0))(
  ( (V!8470 (val!3353 Int)) )
))
(declare-datatypes ((ValueCell!2965 0))(
  ( (ValueCellFull!2965 (v!5463 V!8469)) (EmptyCell!2965) )
))
(declare-datatypes ((array!12585 0))(
  ( (array!12586 (arr!5958 (Array (_ BitVec 32) ValueCell!2965)) (size!6307 (_ BitVec 32))) )
))
(declare-datatypes ((array!12587 0))(
  ( (array!12588 (arr!5959 (Array (_ BitVec 32) (_ BitVec 64))) (size!6308 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3830 0))(
  ( (LongMapFixedSize!3831 (defaultEntry!4788 Int) (mask!11107 (_ BitVec 32)) (extraKeys!4525 (_ BitVec 32)) (zeroValue!4629 V!8469) (minValue!4629 V!8469) (_size!1964 (_ BitVec 32)) (_keys!6966 array!12587) (_values!4771 array!12585) (_vacant!1964 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3830)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!444 (array!12587 array!12585 (_ BitVec 32) (_ BitVec 32) V!8469 V!8469 (_ BitVec 64) Int) Unit!8078)

(assert (=> b!259685 (= lt!130869 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!444 (_keys!6966 thiss!1504) (_values!4771 thiss!1504) (mask!11107 thiss!1504) (extraKeys!4525 thiss!1504) (zeroValue!4629 thiss!1504) (minValue!4629 thiss!1504) key!932 (defaultEntry!4788 thiss!1504)))))

(declare-fun c!44092 () Bool)

(declare-datatypes ((SeekEntryResult!1181 0))(
  ( (MissingZero!1181 (index!6894 (_ BitVec 32))) (Found!1181 (index!6895 (_ BitVec 32))) (Intermediate!1181 (undefined!1993 Bool) (index!6896 (_ BitVec 32)) (x!25101 (_ BitVec 32))) (Undefined!1181) (MissingVacant!1181 (index!6897 (_ BitVec 32))) )
))
(declare-fun lt!130870 () SeekEntryResult!1181)

(assert (=> b!259685 (= c!44092 (is-MissingZero!1181 lt!130870))))

(declare-fun e!168317 () Bool)

(assert (=> b!259685 e!168317))

(declare-fun b!259686 () Bool)

(declare-fun e!168304 () Bool)

(declare-fun e!168305 () Bool)

(assert (=> b!259686 (= e!168304 (not e!168305))))

(declare-fun res!126945 () Bool)

(assert (=> b!259686 (=> res!126945 e!168305)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!259686 (= res!126945 (not (validMask!0 (mask!11107 thiss!1504))))))

(declare-fun lt!130882 () array!12587)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259686 (= (arrayCountValidKeys!0 lt!130882 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130871 () Unit!8078)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12587 (_ BitVec 32)) Unit!8078)

(assert (=> b!259686 (= lt!130871 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130882 index!297))))

(declare-fun arrayContainsKey!0 (array!12587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!259686 (arrayContainsKey!0 lt!130882 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130877 () Unit!8078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12587 (_ BitVec 64) (_ BitVec 32)) Unit!8078)

(assert (=> b!259686 (= lt!130877 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130882 key!932 index!297))))

(declare-datatypes ((tuple2!4946 0))(
  ( (tuple2!4947 (_1!2484 (_ BitVec 64)) (_2!2484 V!8469)) )
))
(declare-datatypes ((List!3824 0))(
  ( (Nil!3821) (Cons!3820 (h!4484 tuple2!4946) (t!8891 List!3824)) )
))
(declare-datatypes ((ListLongMap!3859 0))(
  ( (ListLongMap!3860 (toList!1945 List!3824)) )
))
(declare-fun lt!130881 () ListLongMap!3859)

(declare-fun v!346 () V!8469)

(declare-fun +!698 (ListLongMap!3859 tuple2!4946) ListLongMap!3859)

(declare-fun getCurrentListMap!1473 (array!12587 array!12585 (_ BitVec 32) (_ BitVec 32) V!8469 V!8469 (_ BitVec 32) Int) ListLongMap!3859)

(assert (=> b!259686 (= (+!698 lt!130881 (tuple2!4947 key!932 v!346)) (getCurrentListMap!1473 lt!130882 (array!12586 (store (arr!5958 (_values!4771 thiss!1504)) index!297 (ValueCellFull!2965 v!346)) (size!6307 (_values!4771 thiss!1504))) (mask!11107 thiss!1504) (extraKeys!4525 thiss!1504) (zeroValue!4629 thiss!1504) (minValue!4629 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4788 thiss!1504)))))

(declare-fun lt!130873 () Unit!8078)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!108 (array!12587 array!12585 (_ BitVec 32) (_ BitVec 32) V!8469 V!8469 (_ BitVec 32) (_ BitVec 64) V!8469 Int) Unit!8078)

(assert (=> b!259686 (= lt!130873 (lemmaAddValidKeyToArrayThenAddPairToListMap!108 (_keys!6966 thiss!1504) (_values!4771 thiss!1504) (mask!11107 thiss!1504) (extraKeys!4525 thiss!1504) (zeroValue!4629 thiss!1504) (minValue!4629 thiss!1504) index!297 key!932 v!346 (defaultEntry!4788 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12587 (_ BitVec 32)) Bool)

(assert (=> b!259686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130882 (mask!11107 thiss!1504))))

(declare-fun lt!130876 () Unit!8078)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12587 (_ BitVec 32) (_ BitVec 32)) Unit!8078)

(assert (=> b!259686 (= lt!130876 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6966 thiss!1504) index!297 (mask!11107 thiss!1504)))))

(assert (=> b!259686 (= (arrayCountValidKeys!0 lt!130882 #b00000000000000000000000000000000 (size!6308 (_keys!6966 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6966 thiss!1504) #b00000000000000000000000000000000 (size!6308 (_keys!6966 thiss!1504)))))))

(declare-fun lt!130872 () Unit!8078)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12587 (_ BitVec 32) (_ BitVec 64)) Unit!8078)

(assert (=> b!259686 (= lt!130872 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6966 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3825 0))(
  ( (Nil!3822) (Cons!3821 (h!4485 (_ BitVec 64)) (t!8892 List!3825)) )
))
(declare-fun arrayNoDuplicates!0 (array!12587 (_ BitVec 32) List!3825) Bool)

(assert (=> b!259686 (arrayNoDuplicates!0 lt!130882 #b00000000000000000000000000000000 Nil!3822)))

(assert (=> b!259686 (= lt!130882 (array!12588 (store (arr!5959 (_keys!6966 thiss!1504)) index!297 key!932) (size!6308 (_keys!6966 thiss!1504))))))

(declare-fun lt!130874 () Unit!8078)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3825) Unit!8078)

(assert (=> b!259686 (= lt!130874 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6966 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3822))))

(declare-fun lt!130880 () Unit!8078)

(declare-fun e!168309 () Unit!8078)

(assert (=> b!259686 (= lt!130880 e!168309)))

(declare-fun c!44089 () Bool)

(assert (=> b!259686 (= c!44089 (arrayContainsKey!0 (_keys!6966 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!126941 () Bool)

(declare-fun e!168308 () Bool)

(assert (=> start!24868 (=> (not res!126941) (not e!168308))))

(declare-fun valid!1496 (LongMapFixedSize!3830) Bool)

(assert (=> start!24868 (= res!126941 (valid!1496 thiss!1504))))

(assert (=> start!24868 e!168308))

(declare-fun e!168306 () Bool)

(assert (=> start!24868 e!168306))

(assert (=> start!24868 true))

(declare-fun tp_is_empty!6617 () Bool)

(assert (=> start!24868 tp_is_empty!6617))

(declare-fun mapIsEmpty!11273 () Bool)

(declare-fun mapRes!11273 () Bool)

(assert (=> mapIsEmpty!11273 mapRes!11273))

(declare-fun b!259687 () Bool)

(declare-fun e!168318 () Bool)

(assert (=> b!259687 (= e!168318 e!168304)))

(declare-fun res!126944 () Bool)

(assert (=> b!259687 (=> (not res!126944) (not e!168304))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!259687 (= res!126944 (inRange!0 index!297 (mask!11107 thiss!1504)))))

(declare-fun lt!130875 () Unit!8078)

(assert (=> b!259687 (= lt!130875 e!168314)))

(declare-fun c!44090 () Bool)

(declare-fun contains!1888 (ListLongMap!3859 (_ BitVec 64)) Bool)

(assert (=> b!259687 (= c!44090 (contains!1888 lt!130881 key!932))))

(assert (=> b!259687 (= lt!130881 (getCurrentListMap!1473 (_keys!6966 thiss!1504) (_values!4771 thiss!1504) (mask!11107 thiss!1504) (extraKeys!4525 thiss!1504) (zeroValue!4629 thiss!1504) (minValue!4629 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4788 thiss!1504)))))

(declare-fun b!259688 () Bool)

(declare-fun c!44091 () Bool)

(assert (=> b!259688 (= c!44091 (is-MissingVacant!1181 lt!130870))))

(declare-fun e!168312 () Bool)

(assert (=> b!259688 (= e!168317 e!168312)))

(declare-fun mapNonEmpty!11273 () Bool)

(declare-fun tp!23584 () Bool)

(declare-fun e!168316 () Bool)

(assert (=> mapNonEmpty!11273 (= mapRes!11273 (and tp!23584 e!168316))))

(declare-fun mapRest!11273 () (Array (_ BitVec 32) ValueCell!2965))

(declare-fun mapKey!11273 () (_ BitVec 32))

(declare-fun mapValue!11273 () ValueCell!2965)

(assert (=> mapNonEmpty!11273 (= (arr!5958 (_values!4771 thiss!1504)) (store mapRest!11273 mapKey!11273 mapValue!11273))))

(declare-fun b!259689 () Bool)

(declare-fun Unit!8080 () Unit!8078)

(assert (=> b!259689 (= e!168309 Unit!8080)))

(declare-fun lt!130878 () Unit!8078)

(declare-fun lemmaArrayContainsKeyThenInListMap!250 (array!12587 array!12585 (_ BitVec 32) (_ BitVec 32) V!8469 V!8469 (_ BitVec 64) (_ BitVec 32) Int) Unit!8078)

(assert (=> b!259689 (= lt!130878 (lemmaArrayContainsKeyThenInListMap!250 (_keys!6966 thiss!1504) (_values!4771 thiss!1504) (mask!11107 thiss!1504) (extraKeys!4525 thiss!1504) (zeroValue!4629 thiss!1504) (minValue!4629 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4788 thiss!1504)))))

(assert (=> b!259689 false))

(declare-fun b!259690 () Bool)

(declare-fun res!126943 () Bool)

(assert (=> b!259690 (=> (not res!126943) (not e!168308))))

(assert (=> b!259690 (= res!126943 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!168311 () Bool)

(declare-fun array_inv!3937 (array!12587) Bool)

(declare-fun array_inv!3938 (array!12585) Bool)

(assert (=> b!259691 (= e!168306 (and tp!23585 tp_is_empty!6617 (array_inv!3937 (_keys!6966 thiss!1504)) (array_inv!3938 (_values!4771 thiss!1504)) e!168311))))

(declare-fun b!259692 () Bool)

(declare-fun e!168315 () Bool)

(declare-fun call!24729 () Bool)

(assert (=> b!259692 (= e!168315 (not call!24729))))

(declare-fun b!259693 () Bool)

(declare-fun e!168313 () Bool)

(assert (=> b!259693 (= e!168311 (and e!168313 mapRes!11273))))

(declare-fun condMapEmpty!11273 () Bool)

(declare-fun mapDefault!11273 () ValueCell!2965)

