; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24334 () Bool)

(assert start!24334)

(declare-fun b!254991 () Bool)

(declare-fun b_free!6697 () Bool)

(declare-fun b_next!6697 () Bool)

(assert (=> b!254991 (= b_free!6697 (not b_next!6697))))

(declare-fun tp!23381 () Bool)

(declare-fun b_and!13743 () Bool)

(assert (=> b!254991 (= tp!23381 b_and!13743)))

(declare-fun b!254980 () Bool)

(declare-datatypes ((Unit!7909 0))(
  ( (Unit!7910) )
))
(declare-fun e!165281 () Unit!7909)

(declare-fun lt!127828 () Unit!7909)

(assert (=> b!254980 (= e!165281 lt!127828)))

(declare-datatypes ((V!8393 0))(
  ( (V!8394 (val!3324 Int)) )
))
(declare-datatypes ((ValueCell!2936 0))(
  ( (ValueCellFull!2936 (v!5401 V!8393)) (EmptyCell!2936) )
))
(declare-datatypes ((array!12451 0))(
  ( (array!12452 (arr!5900 (Array (_ BitVec 32) ValueCell!2936)) (size!6247 (_ BitVec 32))) )
))
(declare-datatypes ((array!12453 0))(
  ( (array!12454 (arr!5901 (Array (_ BitVec 32) (_ BitVec 64))) (size!6248 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3772 0))(
  ( (LongMapFixedSize!3773 (defaultEntry!4704 Int) (mask!10958 (_ BitVec 32)) (extraKeys!4441 (_ BitVec 32)) (zeroValue!4545 V!8393) (minValue!4545 V!8393) (_size!1935 (_ BitVec 32)) (_keys!6860 array!12453) (_values!4687 array!12451) (_vacant!1935 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3772)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!424 (array!12453 array!12451 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7909)

(assert (=> b!254980 (= lt!127828 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!424 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(declare-fun c!43028 () Bool)

(declare-datatypes ((SeekEntryResult!1154 0))(
  ( (MissingZero!1154 (index!6786 (_ BitVec 32))) (Found!1154 (index!6787 (_ BitVec 32))) (Intermediate!1154 (undefined!1966 Bool) (index!6788 (_ BitVec 32)) (x!24896 (_ BitVec 32))) (Undefined!1154) (MissingVacant!1154 (index!6789 (_ BitVec 32))) )
))
(declare-fun lt!127832 () SeekEntryResult!1154)

(assert (=> b!254980 (= c!43028 (is-MissingZero!1154 lt!127832))))

(declare-fun e!165277 () Bool)

(assert (=> b!254980 e!165277))

(declare-fun mapIsEmpty!11157 () Bool)

(declare-fun mapRes!11157 () Bool)

(assert (=> mapIsEmpty!11157 mapRes!11157))

(declare-fun b!254981 () Bool)

(declare-fun e!165285 () Bool)

(declare-fun e!165288 () Bool)

(assert (=> b!254981 (= e!165285 e!165288)))

(declare-fun res!124807 () Bool)

(assert (=> b!254981 (=> (not res!124807) (not e!165288))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254981 (= res!124807 (inRange!0 index!297 (mask!10958 thiss!1504)))))

(declare-fun lt!127831 () Unit!7909)

(assert (=> b!254981 (= lt!127831 e!165281)))

(declare-fun c!43027 () Bool)

(declare-datatypes ((tuple2!4894 0))(
  ( (tuple2!4895 (_1!2458 (_ BitVec 64)) (_2!2458 V!8393)) )
))
(declare-datatypes ((List!3775 0))(
  ( (Nil!3772) (Cons!3771 (h!4433 tuple2!4894) (t!8824 List!3775)) )
))
(declare-datatypes ((ListLongMap!3807 0))(
  ( (ListLongMap!3808 (toList!1919 List!3775)) )
))
(declare-fun lt!127834 () ListLongMap!3807)

(declare-fun contains!1851 (ListLongMap!3807 (_ BitVec 64)) Bool)

(assert (=> b!254981 (= c!43027 (contains!1851 lt!127834 key!932))))

(declare-fun getCurrentListMap!1447 (array!12453 array!12451 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) Int) ListLongMap!3807)

(assert (=> b!254981 (= lt!127834 (getCurrentListMap!1447 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun b!254982 () Bool)

(declare-fun e!165276 () Unit!7909)

(declare-fun Unit!7911 () Unit!7909)

(assert (=> b!254982 (= e!165276 Unit!7911)))

(declare-fun b!254983 () Bool)

(declare-fun e!165286 () Bool)

(assert (=> b!254983 (= e!165286 e!165285)))

(declare-fun res!124809 () Bool)

(assert (=> b!254983 (=> (not res!124809) (not e!165285))))

(assert (=> b!254983 (= res!124809 (or (= lt!127832 (MissingZero!1154 index!297)) (= lt!127832 (MissingVacant!1154 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12453 (_ BitVec 32)) SeekEntryResult!1154)

(assert (=> b!254983 (= lt!127832 (seekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(declare-fun b!254984 () Bool)

(declare-fun Unit!7912 () Unit!7909)

(assert (=> b!254984 (= e!165281 Unit!7912)))

(declare-fun lt!127837 () Unit!7909)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!421 (array!12453 array!12451 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7909)

(assert (=> b!254984 (= lt!127837 (lemmaInListMapThenSeekEntryOrOpenFindsIt!421 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!254984 false))

(declare-fun bm!24078 () Bool)

(declare-fun call!24080 () Bool)

(declare-fun arrayContainsKey!0 (array!12453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24078 (= call!24080 (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!24081 () Bool)

(declare-fun bm!24077 () Bool)

(assert (=> bm!24077 (= call!24081 (inRange!0 (ite c!43028 (index!6786 lt!127832) (index!6789 lt!127832)) (mask!10958 thiss!1504)))))

(declare-fun res!124806 () Bool)

(assert (=> start!24334 (=> (not res!124806) (not e!165286))))

(declare-fun valid!1474 (LongMapFixedSize!3772) Bool)

(assert (=> start!24334 (= res!124806 (valid!1474 thiss!1504))))

(assert (=> start!24334 e!165286))

(declare-fun e!165284 () Bool)

(assert (=> start!24334 e!165284))

(assert (=> start!24334 true))

(declare-fun tp_is_empty!6559 () Bool)

(assert (=> start!24334 tp_is_empty!6559))

(declare-fun b!254985 () Bool)

(declare-fun res!124803 () Bool)

(declare-fun e!165289 () Bool)

(assert (=> b!254985 (=> (not res!124803) (not e!165289))))

(assert (=> b!254985 (= res!124803 (= (select (arr!5901 (_keys!6860 thiss!1504)) (index!6786 lt!127832)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254986 () Bool)

(declare-fun e!165280 () Bool)

(assert (=> b!254986 (= e!165280 tp_is_empty!6559)))

(declare-fun b!254987 () Bool)

(declare-fun e!165278 () Bool)

(declare-fun e!165287 () Bool)

(assert (=> b!254987 (= e!165278 e!165287)))

(declare-fun res!124804 () Bool)

(assert (=> b!254987 (= res!124804 call!24081)))

(assert (=> b!254987 (=> (not res!124804) (not e!165287))))

(declare-fun b!254988 () Bool)

(assert (=> b!254988 (= e!165278 (is-Undefined!1154 lt!127832))))

(declare-fun b!254989 () Bool)

(declare-fun res!124802 () Bool)

(assert (=> b!254989 (=> (not res!124802) (not e!165289))))

(assert (=> b!254989 (= res!124802 call!24081)))

(assert (=> b!254989 (= e!165277 e!165289)))

(declare-fun b!254990 () Bool)

(assert (=> b!254990 (= e!165289 (not call!24080))))

(declare-fun e!165282 () Bool)

(declare-fun array_inv!3901 (array!12453) Bool)

(declare-fun array_inv!3902 (array!12451) Bool)

(assert (=> b!254991 (= e!165284 (and tp!23381 tp_is_empty!6559 (array_inv!3901 (_keys!6860 thiss!1504)) (array_inv!3902 (_values!4687 thiss!1504)) e!165282))))

(declare-fun b!254992 () Bool)

(declare-fun res!124808 () Bool)

(assert (=> b!254992 (=> (not res!124808) (not e!165286))))

(assert (=> b!254992 (= res!124808 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254993 () Bool)

(declare-fun c!43029 () Bool)

(assert (=> b!254993 (= c!43029 (is-MissingVacant!1154 lt!127832))))

(assert (=> b!254993 (= e!165277 e!165278)))

(declare-fun b!254994 () Bool)

(assert (=> b!254994 (= e!165288 (not (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-fun lt!127836 () array!12453)

(declare-fun v!346 () V!8393)

(declare-fun +!675 (ListLongMap!3807 tuple2!4894) ListLongMap!3807)

(assert (=> b!254994 (= (+!675 lt!127834 (tuple2!4895 key!932 v!346)) (getCurrentListMap!1447 lt!127836 (array!12452 (store (arr!5900 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6247 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127833 () Unit!7909)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!85 (array!12453 array!12451 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) (_ BitVec 64) V!8393 Int) Unit!7909)

(assert (=> b!254994 (= lt!127833 (lemmaAddValidKeyToArrayThenAddPairToListMap!85 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12453 (_ BitVec 32)) Bool)

(assert (=> b!254994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127836 (mask!10958 thiss!1504))))

(declare-fun lt!127830 () Unit!7909)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12453 (_ BitVec 32) (_ BitVec 32)) Unit!7909)

(assert (=> b!254994 (= lt!127830 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) index!297 (mask!10958 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12453 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254994 (= (arrayCountValidKeys!0 lt!127836 #b00000000000000000000000000000000 (size!6248 (_keys!6860 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6860 thiss!1504) #b00000000000000000000000000000000 (size!6248 (_keys!6860 thiss!1504)))))))

(declare-fun lt!127835 () Unit!7909)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12453 (_ BitVec 32) (_ BitVec 64)) Unit!7909)

(assert (=> b!254994 (= lt!127835 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6860 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3776 0))(
  ( (Nil!3773) (Cons!3772 (h!4434 (_ BitVec 64)) (t!8825 List!3776)) )
))
(declare-fun arrayNoDuplicates!0 (array!12453 (_ BitVec 32) List!3776) Bool)

(assert (=> b!254994 (arrayNoDuplicates!0 lt!127836 #b00000000000000000000000000000000 Nil!3773)))

(assert (=> b!254994 (= lt!127836 (array!12454 (store (arr!5901 (_keys!6860 thiss!1504)) index!297 key!932) (size!6248 (_keys!6860 thiss!1504))))))

(declare-fun lt!127827 () Unit!7909)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12453 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3776) Unit!7909)

(assert (=> b!254994 (= lt!127827 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6860 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3773))))

(declare-fun lt!127829 () Unit!7909)

(assert (=> b!254994 (= lt!127829 e!165276)))

(declare-fun c!43030 () Bool)

(assert (=> b!254994 (= c!43030 (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254995 () Bool)

(declare-fun Unit!7913 () Unit!7909)

(assert (=> b!254995 (= e!165276 Unit!7913)))

(declare-fun lt!127826 () Unit!7909)

(declare-fun lemmaArrayContainsKeyThenInListMap!227 (array!12453 array!12451 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) (_ BitVec 32) Int) Unit!7909)

(assert (=> b!254995 (= lt!127826 (lemmaArrayContainsKeyThenInListMap!227 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!254995 false))

(declare-fun b!254996 () Bool)

(declare-fun e!165279 () Bool)

(assert (=> b!254996 (= e!165279 tp_is_empty!6559)))

(declare-fun b!254997 () Bool)

(assert (=> b!254997 (= e!165287 (not call!24080))))

(declare-fun b!254998 () Bool)

(declare-fun res!124805 () Bool)

(assert (=> b!254998 (= res!124805 (= (select (arr!5901 (_keys!6860 thiss!1504)) (index!6789 lt!127832)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254998 (=> (not res!124805) (not e!165287))))

(declare-fun mapNonEmpty!11157 () Bool)

(declare-fun tp!23382 () Bool)

(assert (=> mapNonEmpty!11157 (= mapRes!11157 (and tp!23382 e!165280))))

(declare-fun mapKey!11157 () (_ BitVec 32))

(declare-fun mapValue!11157 () ValueCell!2936)

(declare-fun mapRest!11157 () (Array (_ BitVec 32) ValueCell!2936))

(assert (=> mapNonEmpty!11157 (= (arr!5900 (_values!4687 thiss!1504)) (store mapRest!11157 mapKey!11157 mapValue!11157))))

(declare-fun b!254999 () Bool)

(assert (=> b!254999 (= e!165282 (and e!165279 mapRes!11157))))

(declare-fun condMapEmpty!11157 () Bool)

(declare-fun mapDefault!11157 () ValueCell!2936)

