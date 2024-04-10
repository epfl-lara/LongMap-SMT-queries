; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24422 () Bool)

(assert start!24422)

(declare-fun b!255826 () Bool)

(declare-fun b_free!6709 () Bool)

(declare-fun b_next!6709 () Bool)

(assert (=> b!255826 (= b_free!6709 (not b_next!6709))))

(declare-fun tp!23423 () Bool)

(declare-fun b_and!13763 () Bool)

(assert (=> b!255826 (= tp!23423 b_and!13763)))

(declare-fun b!255812 () Bool)

(declare-fun res!125177 () Bool)

(declare-datatypes ((V!8409 0))(
  ( (V!8410 (val!3330 Int)) )
))
(declare-datatypes ((ValueCell!2942 0))(
  ( (ValueCellFull!2942 (v!5413 V!8409)) (EmptyCell!2942) )
))
(declare-datatypes ((array!12479 0))(
  ( (array!12480 (arr!5912 (Array (_ BitVec 32) ValueCell!2942)) (size!6259 (_ BitVec 32))) )
))
(declare-datatypes ((array!12481 0))(
  ( (array!12482 (arr!5913 (Array (_ BitVec 32) (_ BitVec 64))) (size!6260 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3784 0))(
  ( (LongMapFixedSize!3785 (defaultEntry!4720 Int) (mask!10986 (_ BitVec 32)) (extraKeys!4457 (_ BitVec 32)) (zeroValue!4561 V!8409) (minValue!4561 V!8409) (_size!1941 (_ BitVec 32)) (_keys!6880 array!12481) (_values!4703 array!12479) (_vacant!1941 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3784)

(declare-datatypes ((SeekEntryResult!1159 0))(
  ( (MissingZero!1159 (index!6806 (_ BitVec 32))) (Found!1159 (index!6807 (_ BitVec 32))) (Intermediate!1159 (undefined!1971 Bool) (index!6808 (_ BitVec 32)) (x!24937 (_ BitVec 32))) (Undefined!1159) (MissingVacant!1159 (index!6809 (_ BitVec 32))) )
))
(declare-fun lt!128370 () SeekEntryResult!1159)

(assert (=> b!255812 (= res!125177 (= (select (arr!5913 (_keys!6880 thiss!1504)) (index!6809 lt!128370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165826 () Bool)

(assert (=> b!255812 (=> (not res!125177) (not e!165826))))

(declare-fun mapNonEmpty!11181 () Bool)

(declare-fun mapRes!11181 () Bool)

(declare-fun tp!23424 () Bool)

(declare-fun e!165829 () Bool)

(assert (=> mapNonEmpty!11181 (= mapRes!11181 (and tp!23424 e!165829))))

(declare-fun mapValue!11181 () ValueCell!2942)

(declare-fun mapKey!11181 () (_ BitVec 32))

(declare-fun mapRest!11181 () (Array (_ BitVec 32) ValueCell!2942))

(assert (=> mapNonEmpty!11181 (= (arr!5912 (_values!4703 thiss!1504)) (store mapRest!11181 mapKey!11181 mapValue!11181))))

(declare-fun b!255813 () Bool)

(declare-fun res!125179 () Bool)

(declare-fun e!165821 () Bool)

(assert (=> b!255813 (=> (not res!125179) (not e!165821))))

(declare-fun call!24205 () Bool)

(assert (=> b!255813 (= res!125179 call!24205)))

(declare-fun e!165816 () Bool)

(assert (=> b!255813 (= e!165816 e!165821)))

(declare-fun b!255814 () Bool)

(declare-fun call!24204 () Bool)

(assert (=> b!255814 (= e!165826 (not call!24204))))

(declare-fun b!255815 () Bool)

(declare-fun e!165819 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255815 (= e!165819 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6260 (_keys!6880 thiss!1504))) (bvslt (size!6260 (_keys!6880 thiss!1504)) #b01111111111111111111111111111111))))))

(declare-fun lt!128368 () array!12481)

(declare-datatypes ((tuple2!4904 0))(
  ( (tuple2!4905 (_1!2463 (_ BitVec 64)) (_2!2463 V!8409)) )
))
(declare-datatypes ((List!3784 0))(
  ( (Nil!3781) (Cons!3780 (h!4442 tuple2!4904) (t!8837 List!3784)) )
))
(declare-datatypes ((ListLongMap!3817 0))(
  ( (ListLongMap!3818 (toList!1924 List!3784)) )
))
(declare-fun lt!128373 () ListLongMap!3817)

(declare-fun v!346 () V!8409)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!679 (ListLongMap!3817 tuple2!4904) ListLongMap!3817)

(declare-fun getCurrentListMap!1452 (array!12481 array!12479 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) Int) ListLongMap!3817)

(assert (=> b!255815 (= (+!679 lt!128373 (tuple2!4905 key!932 v!346)) (getCurrentListMap!1452 lt!128368 (array!12480 (store (arr!5912 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6259 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-datatypes ((Unit!7936 0))(
  ( (Unit!7937) )
))
(declare-fun lt!128365 () Unit!7936)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!89 (array!12481 array!12479 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) (_ BitVec 64) V!8409 Int) Unit!7936)

(assert (=> b!255815 (= lt!128365 (lemmaAddValidKeyToArrayThenAddPairToListMap!89 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12481 (_ BitVec 32)) Bool)

(assert (=> b!255815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128368 (mask!10986 thiss!1504))))

(declare-fun lt!128369 () Unit!7936)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12481 (_ BitVec 32) (_ BitVec 32)) Unit!7936)

(assert (=> b!255815 (= lt!128369 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) index!297 (mask!10986 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12481 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255815 (= (arrayCountValidKeys!0 lt!128368 #b00000000000000000000000000000000 (size!6260 (_keys!6880 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6880 thiss!1504) #b00000000000000000000000000000000 (size!6260 (_keys!6880 thiss!1504)))))))

(declare-fun lt!128371 () Unit!7936)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12481 (_ BitVec 32) (_ BitVec 64)) Unit!7936)

(assert (=> b!255815 (= lt!128371 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6880 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3785 0))(
  ( (Nil!3782) (Cons!3781 (h!4443 (_ BitVec 64)) (t!8838 List!3785)) )
))
(declare-fun arrayNoDuplicates!0 (array!12481 (_ BitVec 32) List!3785) Bool)

(assert (=> b!255815 (arrayNoDuplicates!0 lt!128368 #b00000000000000000000000000000000 Nil!3782)))

(assert (=> b!255815 (= lt!128368 (array!12482 (store (arr!5913 (_keys!6880 thiss!1504)) index!297 key!932) (size!6260 (_keys!6880 thiss!1504))))))

(declare-fun lt!128374 () Unit!7936)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3785) Unit!7936)

(assert (=> b!255815 (= lt!128374 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6880 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3782))))

(declare-fun lt!128375 () Unit!7936)

(declare-fun e!165818 () Unit!7936)

(assert (=> b!255815 (= lt!128375 e!165818)))

(declare-fun c!43213 () Bool)

(declare-fun arrayContainsKey!0 (array!12481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255815 (= c!43213 (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255816 () Bool)

(declare-fun e!165822 () Bool)

(assert (=> b!255816 (= e!165822 (is-Undefined!1159 lt!128370))))

(declare-fun b!255817 () Bool)

(declare-fun e!165823 () Bool)

(assert (=> b!255817 (= e!165823 e!165819)))

(declare-fun res!125181 () Bool)

(assert (=> b!255817 (=> (not res!125181) (not e!165819))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255817 (= res!125181 (inRange!0 index!297 (mask!10986 thiss!1504)))))

(declare-fun lt!128364 () Unit!7936)

(declare-fun e!165825 () Unit!7936)

(assert (=> b!255817 (= lt!128364 e!165825)))

(declare-fun c!43211 () Bool)

(declare-fun contains!1860 (ListLongMap!3817 (_ BitVec 64)) Bool)

(assert (=> b!255817 (= c!43211 (contains!1860 lt!128373 key!932))))

(assert (=> b!255817 (= lt!128373 (getCurrentListMap!1452 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!255818 () Bool)

(declare-fun Unit!7938 () Unit!7936)

(assert (=> b!255818 (= e!165818 Unit!7938)))

(declare-fun lt!128367 () Unit!7936)

(declare-fun lemmaArrayContainsKeyThenInListMap!231 (array!12481 array!12479 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) (_ BitVec 32) Int) Unit!7936)

(assert (=> b!255818 (= lt!128367 (lemmaArrayContainsKeyThenInListMap!231 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(assert (=> b!255818 false))

(declare-fun b!255819 () Bool)

(declare-fun Unit!7939 () Unit!7936)

(assert (=> b!255819 (= e!165818 Unit!7939)))

(declare-fun b!255820 () Bool)

(declare-fun lt!128366 () Unit!7936)

(assert (=> b!255820 (= e!165825 lt!128366)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!428 (array!12481 array!12479 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7936)

(assert (=> b!255820 (= lt!128366 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!428 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(declare-fun c!43214 () Bool)

(assert (=> b!255820 (= c!43214 (is-MissingZero!1159 lt!128370))))

(assert (=> b!255820 e!165816))

(declare-fun b!255821 () Bool)

(declare-fun Unit!7940 () Unit!7936)

(assert (=> b!255821 (= e!165825 Unit!7940)))

(declare-fun lt!128372 () Unit!7936)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (array!12481 array!12479 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7936)

(assert (=> b!255821 (= lt!128372 (lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> b!255821 false))

(declare-fun res!125178 () Bool)

(declare-fun e!165824 () Bool)

(assert (=> start!24422 (=> (not res!125178) (not e!165824))))

(declare-fun valid!1479 (LongMapFixedSize!3784) Bool)

(assert (=> start!24422 (= res!125178 (valid!1479 thiss!1504))))

(assert (=> start!24422 e!165824))

(declare-fun e!165828 () Bool)

(assert (=> start!24422 e!165828))

(assert (=> start!24422 true))

(declare-fun tp_is_empty!6571 () Bool)

(assert (=> start!24422 tp_is_empty!6571))

(declare-fun b!255822 () Bool)

(declare-fun res!125175 () Bool)

(assert (=> b!255822 (=> (not res!125175) (not e!165824))))

(assert (=> b!255822 (= res!125175 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255823 () Bool)

(assert (=> b!255823 (= e!165821 (not call!24204))))

(declare-fun b!255824 () Bool)

(assert (=> b!255824 (= e!165829 tp_is_empty!6571)))

(declare-fun b!255825 () Bool)

(assert (=> b!255825 (= e!165824 e!165823)))

(declare-fun res!125174 () Bool)

(assert (=> b!255825 (=> (not res!125174) (not e!165823))))

(assert (=> b!255825 (= res!125174 (or (= lt!128370 (MissingZero!1159 index!297)) (= lt!128370 (MissingVacant!1159 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12481 (_ BitVec 32)) SeekEntryResult!1159)

(assert (=> b!255825 (= lt!128370 (seekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(declare-fun bm!24201 () Bool)

(assert (=> bm!24201 (= call!24205 (inRange!0 (ite c!43214 (index!6806 lt!128370) (index!6809 lt!128370)) (mask!10986 thiss!1504)))))

(declare-fun e!165820 () Bool)

(declare-fun array_inv!3909 (array!12481) Bool)

(declare-fun array_inv!3910 (array!12479) Bool)

(assert (=> b!255826 (= e!165828 (and tp!23423 tp_is_empty!6571 (array_inv!3909 (_keys!6880 thiss!1504)) (array_inv!3910 (_values!4703 thiss!1504)) e!165820))))

(declare-fun bm!24202 () Bool)

(assert (=> bm!24202 (= call!24204 (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255827 () Bool)

(declare-fun res!125180 () Bool)

(assert (=> b!255827 (=> (not res!125180) (not e!165821))))

(assert (=> b!255827 (= res!125180 (= (select (arr!5913 (_keys!6880 thiss!1504)) (index!6806 lt!128370)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255828 () Bool)

(declare-fun e!165817 () Bool)

(assert (=> b!255828 (= e!165817 tp_is_empty!6571)))

(declare-fun mapIsEmpty!11181 () Bool)

(assert (=> mapIsEmpty!11181 mapRes!11181))

(declare-fun b!255829 () Bool)

(declare-fun c!43212 () Bool)

(assert (=> b!255829 (= c!43212 (is-MissingVacant!1159 lt!128370))))

(assert (=> b!255829 (= e!165816 e!165822)))

(declare-fun b!255830 () Bool)

(assert (=> b!255830 (= e!165822 e!165826)))

(declare-fun res!125176 () Bool)

(assert (=> b!255830 (= res!125176 call!24205)))

(assert (=> b!255830 (=> (not res!125176) (not e!165826))))

(declare-fun b!255831 () Bool)

(assert (=> b!255831 (= e!165820 (and e!165817 mapRes!11181))))

(declare-fun condMapEmpty!11181 () Bool)

(declare-fun mapDefault!11181 () ValueCell!2942)

