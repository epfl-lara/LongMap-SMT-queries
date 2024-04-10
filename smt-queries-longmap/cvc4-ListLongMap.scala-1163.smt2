; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24562 () Bool)

(assert start!24562)

(declare-fun b!257213 () Bool)

(declare-fun b_free!6731 () Bool)

(declare-fun b_next!6731 () Bool)

(assert (=> b!257213 (= b_free!6731 (not b_next!6731))))

(declare-fun tp!23499 () Bool)

(declare-fun b_and!13797 () Bool)

(assert (=> b!257213 (= tp!23499 b_and!13797)))

(declare-fun call!24403 () Bool)

(declare-fun c!43511 () Bool)

(declare-datatypes ((V!8437 0))(
  ( (V!8438 (val!3341 Int)) )
))
(declare-datatypes ((ValueCell!2953 0))(
  ( (ValueCellFull!2953 (v!5433 V!8437)) (EmptyCell!2953) )
))
(declare-datatypes ((array!12529 0))(
  ( (array!12530 (arr!5934 (Array (_ BitVec 32) ValueCell!2953)) (size!6281 (_ BitVec 32))) )
))
(declare-datatypes ((array!12531 0))(
  ( (array!12532 (arr!5935 (Array (_ BitVec 32) (_ BitVec 64))) (size!6282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3806 0))(
  ( (LongMapFixedSize!3807 (defaultEntry!4746 Int) (mask!11030 (_ BitVec 32)) (extraKeys!4483 (_ BitVec 32)) (zeroValue!4587 V!8437) (minValue!4587 V!8437) (_size!1952 (_ BitVec 32)) (_keys!6912 array!12531) (_values!4729 array!12529) (_vacant!1952 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3806)

(declare-fun bm!24399 () Bool)

(declare-datatypes ((SeekEntryResult!1169 0))(
  ( (MissingZero!1169 (index!6846 (_ BitVec 32))) (Found!1169 (index!6847 (_ BitVec 32))) (Intermediate!1169 (undefined!1981 Bool) (index!6848 (_ BitVec 32)) (x!25001 (_ BitVec 32))) (Undefined!1169) (MissingVacant!1169 (index!6849 (_ BitVec 32))) )
))
(declare-fun lt!129280 () SeekEntryResult!1169)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24399 (= call!24403 (inRange!0 (ite c!43511 (index!6846 lt!129280) (index!6849 lt!129280)) (mask!11030 thiss!1504)))))

(declare-fun b!257211 () Bool)

(declare-fun res!125811 () Bool)

(declare-fun e!166732 () Bool)

(assert (=> b!257211 (=> (not res!125811) (not e!166732))))

(assert (=> b!257211 (= res!125811 call!24403)))

(declare-fun e!166736 () Bool)

(assert (=> b!257211 (= e!166736 e!166732)))

(declare-fun b!257212 () Bool)

(declare-fun e!166741 () Bool)

(declare-fun e!166739 () Bool)

(assert (=> b!257212 (= e!166741 e!166739)))

(declare-fun res!125815 () Bool)

(assert (=> b!257212 (=> (not res!125815) (not e!166739))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!257212 (= res!125815 (inRange!0 index!297 (mask!11030 thiss!1504)))))

(declare-datatypes ((Unit!7990 0))(
  ( (Unit!7991) )
))
(declare-fun lt!129274 () Unit!7990)

(declare-fun e!166742 () Unit!7990)

(assert (=> b!257212 (= lt!129274 e!166742)))

(declare-fun c!43513 () Bool)

(declare-datatypes ((tuple2!4922 0))(
  ( (tuple2!4923 (_1!2472 (_ BitVec 64)) (_2!2472 V!8437)) )
))
(declare-datatypes ((List!3801 0))(
  ( (Nil!3798) (Cons!3797 (h!4459 tuple2!4922) (t!8860 List!3801)) )
))
(declare-datatypes ((ListLongMap!3835 0))(
  ( (ListLongMap!3836 (toList!1933 List!3801)) )
))
(declare-fun lt!129272 () ListLongMap!3835)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1872 (ListLongMap!3835 (_ BitVec 64)) Bool)

(assert (=> b!257212 (= c!43513 (contains!1872 lt!129272 key!932))))

(declare-fun getCurrentListMap!1461 (array!12531 array!12529 (_ BitVec 32) (_ BitVec 32) V!8437 V!8437 (_ BitVec 32) Int) ListLongMap!3835)

(assert (=> b!257212 (= lt!129272 (getCurrentListMap!1461 (_keys!6912 thiss!1504) (_values!4729 thiss!1504) (mask!11030 thiss!1504) (extraKeys!4483 thiss!1504) (zeroValue!4587 thiss!1504) (minValue!4587 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4746 thiss!1504)))))

(declare-fun e!166740 () Bool)

(declare-fun tp_is_empty!6593 () Bool)

(declare-fun e!166745 () Bool)

(declare-fun array_inv!3921 (array!12531) Bool)

(declare-fun array_inv!3922 (array!12529) Bool)

(assert (=> b!257213 (= e!166740 (and tp!23499 tp_is_empty!6593 (array_inv!3921 (_keys!6912 thiss!1504)) (array_inv!3922 (_values!4729 thiss!1504)) e!166745))))

(declare-fun b!257214 () Bool)

(declare-fun e!166738 () Bool)

(assert (=> b!257214 (= e!166738 e!166741)))

(declare-fun res!125816 () Bool)

(assert (=> b!257214 (=> (not res!125816) (not e!166741))))

(assert (=> b!257214 (= res!125816 (or (= lt!129280 (MissingZero!1169 index!297)) (= lt!129280 (MissingVacant!1169 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12531 (_ BitVec 32)) SeekEntryResult!1169)

(assert (=> b!257214 (= lt!129280 (seekEntryOrOpen!0 key!932 (_keys!6912 thiss!1504) (mask!11030 thiss!1504)))))

(declare-fun b!257215 () Bool)

(declare-fun res!125813 () Bool)

(assert (=> b!257215 (= res!125813 (= (select (arr!5935 (_keys!6912 thiss!1504)) (index!6849 lt!129280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166733 () Bool)

(assert (=> b!257215 (=> (not res!125813) (not e!166733))))

(declare-fun mapIsEmpty!11223 () Bool)

(declare-fun mapRes!11223 () Bool)

(assert (=> mapIsEmpty!11223 mapRes!11223))

(declare-fun b!257216 () Bool)

(declare-fun e!166743 () Unit!7990)

(declare-fun Unit!7992 () Unit!7990)

(assert (=> b!257216 (= e!166743 Unit!7992)))

(declare-fun lt!129275 () Unit!7990)

(declare-fun lemmaArrayContainsKeyThenInListMap!239 (array!12531 array!12529 (_ BitVec 32) (_ BitVec 32) V!8437 V!8437 (_ BitVec 64) (_ BitVec 32) Int) Unit!7990)

(assert (=> b!257216 (= lt!129275 (lemmaArrayContainsKeyThenInListMap!239 (_keys!6912 thiss!1504) (_values!4729 thiss!1504) (mask!11030 thiss!1504) (extraKeys!4483 thiss!1504) (zeroValue!4587 thiss!1504) (minValue!4587 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4746 thiss!1504)))))

(assert (=> b!257216 false))

(declare-fun b!257217 () Bool)

(declare-fun res!125814 () Bool)

(assert (=> b!257217 (=> (not res!125814) (not e!166732))))

(assert (=> b!257217 (= res!125814 (= (select (arr!5935 (_keys!6912 thiss!1504)) (index!6846 lt!129280)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257218 () Bool)

(declare-fun Unit!7993 () Unit!7990)

(assert (=> b!257218 (= e!166743 Unit!7993)))

(declare-fun res!125812 () Bool)

(assert (=> start!24562 (=> (not res!125812) (not e!166738))))

(declare-fun valid!1488 (LongMapFixedSize!3806) Bool)

(assert (=> start!24562 (= res!125812 (valid!1488 thiss!1504))))

(assert (=> start!24562 e!166738))

(assert (=> start!24562 e!166740))

(assert (=> start!24562 true))

(assert (=> start!24562 tp_is_empty!6593))

(declare-fun b!257219 () Bool)

(declare-fun call!24402 () Bool)

(assert (=> b!257219 (= e!166733 (not call!24402))))

(declare-fun bm!24400 () Bool)

(declare-fun arrayContainsKey!0 (array!12531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24400 (= call!24402 (arrayContainsKey!0 (_keys!6912 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257220 () Bool)

(declare-fun Unit!7994 () Unit!7990)

(assert (=> b!257220 (= e!166742 Unit!7994)))

(declare-fun lt!129276 () Unit!7990)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (array!12531 array!12529 (_ BitVec 32) (_ BitVec 32) V!8437 V!8437 (_ BitVec 64) Int) Unit!7990)

(assert (=> b!257220 (= lt!129276 (lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (_keys!6912 thiss!1504) (_values!4729 thiss!1504) (mask!11030 thiss!1504) (extraKeys!4483 thiss!1504) (zeroValue!4587 thiss!1504) (minValue!4587 thiss!1504) key!932 (defaultEntry!4746 thiss!1504)))))

(assert (=> b!257220 false))

(declare-fun b!257221 () Bool)

(declare-fun e!166735 () Bool)

(assert (=> b!257221 (= e!166735 tp_is_empty!6593)))

(declare-fun b!257222 () Bool)

(declare-fun res!125818 () Bool)

(assert (=> b!257222 (=> (not res!125818) (not e!166738))))

(assert (=> b!257222 (= res!125818 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!257223 () Bool)

(declare-fun c!43514 () Bool)

(assert (=> b!257223 (= c!43514 (is-MissingVacant!1169 lt!129280))))

(declare-fun e!166737 () Bool)

(assert (=> b!257223 (= e!166736 e!166737)))

(declare-fun b!257224 () Bool)

(assert (=> b!257224 (= e!166737 e!166733)))

(declare-fun res!125817 () Bool)

(assert (=> b!257224 (= res!125817 call!24403)))

(assert (=> b!257224 (=> (not res!125817) (not e!166733))))

(declare-fun b!257225 () Bool)

(assert (=> b!257225 (= e!166739 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6281 (_values!4729 thiss!1504))))))))

(declare-fun lt!129271 () array!12531)

(declare-fun arrayCountValidKeys!0 (array!12531 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257225 (= (arrayCountValidKeys!0 lt!129271 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129282 () Unit!7990)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12531 (_ BitVec 32)) Unit!7990)

(assert (=> b!257225 (= lt!129282 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129271 index!297))))

(assert (=> b!257225 (arrayContainsKey!0 lt!129271 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129277 () Unit!7990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12531 (_ BitVec 64) (_ BitVec 32)) Unit!7990)

(assert (=> b!257225 (= lt!129277 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129271 key!932 index!297))))

(declare-fun v!346 () V!8437)

(declare-fun +!687 (ListLongMap!3835 tuple2!4922) ListLongMap!3835)

(assert (=> b!257225 (= (+!687 lt!129272 (tuple2!4923 key!932 v!346)) (getCurrentListMap!1461 lt!129271 (array!12530 (store (arr!5934 (_values!4729 thiss!1504)) index!297 (ValueCellFull!2953 v!346)) (size!6281 (_values!4729 thiss!1504))) (mask!11030 thiss!1504) (extraKeys!4483 thiss!1504) (zeroValue!4587 thiss!1504) (minValue!4587 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4746 thiss!1504)))))

(declare-fun lt!129279 () Unit!7990)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!97 (array!12531 array!12529 (_ BitVec 32) (_ BitVec 32) V!8437 V!8437 (_ BitVec 32) (_ BitVec 64) V!8437 Int) Unit!7990)

(assert (=> b!257225 (= lt!129279 (lemmaAddValidKeyToArrayThenAddPairToListMap!97 (_keys!6912 thiss!1504) (_values!4729 thiss!1504) (mask!11030 thiss!1504) (extraKeys!4483 thiss!1504) (zeroValue!4587 thiss!1504) (minValue!4587 thiss!1504) index!297 key!932 v!346 (defaultEntry!4746 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12531 (_ BitVec 32)) Bool)

(assert (=> b!257225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129271 (mask!11030 thiss!1504))))

(declare-fun lt!129278 () Unit!7990)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12531 (_ BitVec 32) (_ BitVec 32)) Unit!7990)

(assert (=> b!257225 (= lt!129278 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6912 thiss!1504) index!297 (mask!11030 thiss!1504)))))

(assert (=> b!257225 (= (arrayCountValidKeys!0 lt!129271 #b00000000000000000000000000000000 (size!6282 (_keys!6912 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6912 thiss!1504) #b00000000000000000000000000000000 (size!6282 (_keys!6912 thiss!1504)))))))

(declare-fun lt!129284 () Unit!7990)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12531 (_ BitVec 32) (_ BitVec 64)) Unit!7990)

(assert (=> b!257225 (= lt!129284 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6912 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3802 0))(
  ( (Nil!3799) (Cons!3798 (h!4460 (_ BitVec 64)) (t!8861 List!3802)) )
))
(declare-fun arrayNoDuplicates!0 (array!12531 (_ BitVec 32) List!3802) Bool)

(assert (=> b!257225 (arrayNoDuplicates!0 lt!129271 #b00000000000000000000000000000000 Nil!3799)))

(assert (=> b!257225 (= lt!129271 (array!12532 (store (arr!5935 (_keys!6912 thiss!1504)) index!297 key!932) (size!6282 (_keys!6912 thiss!1504))))))

(declare-fun lt!129273 () Unit!7990)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3802) Unit!7990)

(assert (=> b!257225 (= lt!129273 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6912 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3799))))

(declare-fun lt!129283 () Unit!7990)

(assert (=> b!257225 (= lt!129283 e!166743)))

(declare-fun c!43512 () Bool)

(assert (=> b!257225 (= c!43512 (arrayContainsKey!0 (_keys!6912 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257226 () Bool)

(declare-fun lt!129281 () Unit!7990)

(assert (=> b!257226 (= e!166742 lt!129281)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!435 (array!12531 array!12529 (_ BitVec 32) (_ BitVec 32) V!8437 V!8437 (_ BitVec 64) Int) Unit!7990)

(assert (=> b!257226 (= lt!129281 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!435 (_keys!6912 thiss!1504) (_values!4729 thiss!1504) (mask!11030 thiss!1504) (extraKeys!4483 thiss!1504) (zeroValue!4587 thiss!1504) (minValue!4587 thiss!1504) key!932 (defaultEntry!4746 thiss!1504)))))

(assert (=> b!257226 (= c!43511 (is-MissingZero!1169 lt!129280))))

(assert (=> b!257226 e!166736))

(declare-fun b!257227 () Bool)

(assert (=> b!257227 (= e!166732 (not call!24402))))

(declare-fun b!257228 () Bool)

(declare-fun e!166744 () Bool)

(assert (=> b!257228 (= e!166745 (and e!166744 mapRes!11223))))

(declare-fun condMapEmpty!11223 () Bool)

(declare-fun mapDefault!11223 () ValueCell!2953)

