; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22030 () Bool)

(assert start!22030)

(declare-fun b!227264 () Bool)

(declare-fun b_free!6097 () Bool)

(declare-fun b_next!6097 () Bool)

(assert (=> b!227264 (= b_free!6097 (not b_next!6097))))

(declare-fun tp!21433 () Bool)

(declare-fun b_and!12995 () Bool)

(assert (=> b!227264 (= tp!21433 b_and!12995)))

(declare-fun b!227262 () Bool)

(declare-fun e!147437 () Bool)

(declare-fun call!21125 () Bool)

(assert (=> b!227262 (= e!147437 (not call!21125))))

(declare-fun b!227263 () Bool)

(declare-datatypes ((Unit!6885 0))(
  ( (Unit!6886) )
))
(declare-fun e!147444 () Unit!6885)

(declare-fun Unit!6887 () Unit!6885)

(assert (=> b!227263 (= e!147444 Unit!6887)))

(declare-fun lt!114368 () Unit!6885)

(declare-datatypes ((V!7593 0))(
  ( (V!7594 (val!3024 Int)) )
))
(declare-datatypes ((ValueCell!2636 0))(
  ( (ValueCellFull!2636 (v!5044 V!7593)) (EmptyCell!2636) )
))
(declare-datatypes ((array!11161 0))(
  ( (array!11162 (arr!5300 (Array (_ BitVec 32) ValueCell!2636)) (size!5633 (_ BitVec 32))) )
))
(declare-datatypes ((array!11163 0))(
  ( (array!11164 (arr!5301 (Array (_ BitVec 32) (_ BitVec 64))) (size!5634 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3172 0))(
  ( (LongMapFixedSize!3173 (defaultEntry!4245 Int) (mask!10105 (_ BitVec 32)) (extraKeys!3982 (_ BitVec 32)) (zeroValue!4086 V!7593) (minValue!4086 V!7593) (_size!1635 (_ BitVec 32)) (_keys!6299 array!11163) (_values!4228 array!11161) (_vacant!1635 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3172)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!101 (array!11163 array!11161 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) (_ BitVec 32) Int) Unit!6885)

(assert (=> b!227263 (= lt!114368 (lemmaArrayContainsKeyThenInListMap!101 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227263 false))

(declare-fun tp_is_empty!5959 () Bool)

(declare-fun e!147445 () Bool)

(declare-fun e!147436 () Bool)

(declare-fun array_inv!3503 (array!11163) Bool)

(declare-fun array_inv!3504 (array!11161) Bool)

(assert (=> b!227264 (= e!147436 (and tp!21433 tp_is_empty!5959 (array_inv!3503 (_keys!6299 thiss!1504)) (array_inv!3504 (_values!4228 thiss!1504)) e!147445))))

(declare-fun b!227265 () Bool)

(declare-fun res!111876 () Bool)

(declare-fun e!147447 () Bool)

(assert (=> b!227265 (=> (not res!111876) (not e!147447))))

(declare-fun call!21126 () Bool)

(assert (=> b!227265 (= res!111876 call!21126)))

(declare-fun e!147448 () Bool)

(assert (=> b!227265 (= e!147448 e!147447)))

(declare-fun bm!21122 () Bool)

(declare-fun arrayContainsKey!0 (array!11163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21122 (= call!21125 (arrayContainsKey!0 (_keys!6299 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227266 () Bool)

(declare-fun Unit!6888 () Unit!6885)

(assert (=> b!227266 (= e!147444 Unit!6888)))

(declare-fun res!111884 () Bool)

(declare-fun e!147441 () Bool)

(assert (=> start!22030 (=> (not res!111884) (not e!147441))))

(declare-fun valid!1273 (LongMapFixedSize!3172) Bool)

(assert (=> start!22030 (= res!111884 (valid!1273 thiss!1504))))

(assert (=> start!22030 e!147441))

(assert (=> start!22030 e!147436))

(assert (=> start!22030 true))

(declare-fun b!227267 () Bool)

(declare-fun res!111877 () Bool)

(declare-datatypes ((SeekEntryResult!892 0))(
  ( (MissingZero!892 (index!5738 (_ BitVec 32))) (Found!892 (index!5739 (_ BitVec 32))) (Intermediate!892 (undefined!1704 Bool) (index!5740 (_ BitVec 32)) (x!23272 (_ BitVec 32))) (Undefined!892) (MissingVacant!892 (index!5741 (_ BitVec 32))) )
))
(declare-fun lt!114373 () SeekEntryResult!892)

(assert (=> b!227267 (= res!111877 (= (select (arr!5301 (_keys!6299 thiss!1504)) (index!5741 lt!114373)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227267 (=> (not res!111877) (not e!147437))))

(declare-fun b!227268 () Bool)

(declare-fun e!147443 () Bool)

(declare-fun e!147446 () Bool)

(assert (=> b!227268 (= e!147443 (not e!147446))))

(declare-fun res!111885 () Bool)

(assert (=> b!227268 (=> res!111885 e!147446)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227268 (= res!111885 (not (validMask!0 (mask!10105 thiss!1504))))))

(declare-fun lt!114370 () array!11163)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11163 (_ BitVec 32)) Bool)

(assert (=> b!227268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114370 (mask!10105 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114366 () Unit!6885)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11163 (_ BitVec 32) (_ BitVec 32)) Unit!6885)

(assert (=> b!227268 (= lt!114366 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6299 thiss!1504) index!297 (mask!10105 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227268 (= (arrayCountValidKeys!0 lt!114370 #b00000000000000000000000000000000 (size!5634 (_keys!6299 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6299 thiss!1504) #b00000000000000000000000000000000 (size!5634 (_keys!6299 thiss!1504)))))))

(declare-fun lt!114372 () Unit!6885)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11163 (_ BitVec 32) (_ BitVec 64)) Unit!6885)

(assert (=> b!227268 (= lt!114372 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6299 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3387 0))(
  ( (Nil!3384) (Cons!3383 (h!4031 (_ BitVec 64)) (t!8346 List!3387)) )
))
(declare-fun arrayNoDuplicates!0 (array!11163 (_ BitVec 32) List!3387) Bool)

(assert (=> b!227268 (arrayNoDuplicates!0 lt!114370 #b00000000000000000000000000000000 Nil!3384)))

(assert (=> b!227268 (= lt!114370 (array!11164 (store (arr!5301 (_keys!6299 thiss!1504)) index!297 key!932) (size!5634 (_keys!6299 thiss!1504))))))

(declare-fun lt!114374 () Unit!6885)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11163 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3387) Unit!6885)

(assert (=> b!227268 (= lt!114374 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6299 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3384))))

(declare-fun lt!114371 () Unit!6885)

(assert (=> b!227268 (= lt!114371 e!147444)))

(declare-fun c!37680 () Bool)

(assert (=> b!227268 (= c!37680 (arrayContainsKey!0 (_keys!6299 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227269 () Bool)

(declare-fun e!147440 () Unit!6885)

(declare-fun lt!114369 () Unit!6885)

(assert (=> b!227269 (= e!147440 lt!114369)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!276 (array!11163 array!11161 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) Int) Unit!6885)

(assert (=> b!227269 (= lt!114369 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!276 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 (defaultEntry!4245 thiss!1504)))))

(declare-fun c!37677 () Bool)

(assert (=> b!227269 (= c!37677 (is-MissingZero!892 lt!114373))))

(assert (=> b!227269 e!147448))

(declare-fun b!227270 () Bool)

(declare-fun e!147439 () Bool)

(assert (=> b!227270 (= e!147439 e!147443)))

(declare-fun res!111880 () Bool)

(assert (=> b!227270 (=> (not res!111880) (not e!147443))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227270 (= res!111880 (inRange!0 index!297 (mask!10105 thiss!1504)))))

(declare-fun lt!114365 () Unit!6885)

(assert (=> b!227270 (= lt!114365 e!147440)))

(declare-fun c!37678 () Bool)

(declare-datatypes ((tuple2!4468 0))(
  ( (tuple2!4469 (_1!2245 (_ BitVec 64)) (_2!2245 V!7593)) )
))
(declare-datatypes ((List!3388 0))(
  ( (Nil!3385) (Cons!3384 (h!4032 tuple2!4468) (t!8347 List!3388)) )
))
(declare-datatypes ((ListLongMap!3381 0))(
  ( (ListLongMap!3382 (toList!1706 List!3388)) )
))
(declare-fun contains!1580 (ListLongMap!3381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1234 (array!11163 array!11161 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 32) Int) ListLongMap!3381)

(assert (=> b!227270 (= c!37678 (contains!1580 (getCurrentListMap!1234 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4245 thiss!1504)) key!932))))

(declare-fun b!227271 () Bool)

(assert (=> b!227271 (= e!147447 (not call!21125))))

(declare-fun b!227272 () Bool)

(declare-fun res!111886 () Bool)

(assert (=> b!227272 (=> (not res!111886) (not e!147441))))

(assert (=> b!227272 (= res!111886 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227273 () Bool)

(declare-fun res!111882 () Bool)

(assert (=> b!227273 (=> res!111882 e!147446)))

(assert (=> b!227273 (= res!111882 (or (not (= (size!5633 (_values!4228 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10105 thiss!1504)))) (not (= (size!5634 (_keys!6299 thiss!1504)) (size!5633 (_values!4228 thiss!1504)))) (bvslt (mask!10105 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3982 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3982 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227274 () Bool)

(declare-fun e!147442 () Bool)

(assert (=> b!227274 (= e!147442 e!147437)))

(declare-fun res!111879 () Bool)

(assert (=> b!227274 (= res!111879 call!21126)))

(assert (=> b!227274 (=> (not res!111879) (not e!147437))))

(declare-fun b!227275 () Bool)

(declare-fun res!111881 () Bool)

(assert (=> b!227275 (=> (not res!111881) (not e!147447))))

(assert (=> b!227275 (= res!111881 (= (select (arr!5301 (_keys!6299 thiss!1504)) (index!5738 lt!114373)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227276 () Bool)

(declare-fun e!147438 () Bool)

(assert (=> b!227276 (= e!147438 tp_is_empty!5959)))

(declare-fun b!227277 () Bool)

(assert (=> b!227277 (= e!147442 (is-Undefined!892 lt!114373))))

(declare-fun b!227278 () Bool)

(declare-fun Unit!6889 () Unit!6885)

(assert (=> b!227278 (= e!147440 Unit!6889)))

(declare-fun lt!114367 () Unit!6885)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!262 (array!11163 array!11161 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) Int) Unit!6885)

(assert (=> b!227278 (= lt!114367 (lemmaInListMapThenSeekEntryOrOpenFindsIt!262 (_keys!6299 thiss!1504) (_values!4228 thiss!1504) (mask!10105 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227278 false))

(declare-fun b!227279 () Bool)

(declare-fun c!37679 () Bool)

(assert (=> b!227279 (= c!37679 (is-MissingVacant!892 lt!114373))))

(assert (=> b!227279 (= e!147448 e!147442)))

(declare-fun b!227280 () Bool)

(assert (=> b!227280 (= e!147446 true)))

(declare-fun lt!114364 () Bool)

(assert (=> b!227280 (= lt!114364 (arrayNoDuplicates!0 (_keys!6299 thiss!1504) #b00000000000000000000000000000000 Nil!3384))))

(declare-fun mapNonEmpty!10108 () Bool)

(declare-fun mapRes!10108 () Bool)

(declare-fun tp!21432 () Bool)

(assert (=> mapNonEmpty!10108 (= mapRes!10108 (and tp!21432 e!147438))))

(declare-fun mapRest!10108 () (Array (_ BitVec 32) ValueCell!2636))

(declare-fun mapKey!10108 () (_ BitVec 32))

(declare-fun mapValue!10108 () ValueCell!2636)

(assert (=> mapNonEmpty!10108 (= (arr!5300 (_values!4228 thiss!1504)) (store mapRest!10108 mapKey!10108 mapValue!10108))))

(declare-fun mapIsEmpty!10108 () Bool)

(assert (=> mapIsEmpty!10108 mapRes!10108))

(declare-fun b!227281 () Bool)

(declare-fun res!111883 () Bool)

(assert (=> b!227281 (=> res!111883 e!147446)))

(assert (=> b!227281 (= res!111883 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6299 thiss!1504) (mask!10105 thiss!1504))))))

(declare-fun bm!21123 () Bool)

(assert (=> bm!21123 (= call!21126 (inRange!0 (ite c!37677 (index!5738 lt!114373) (index!5741 lt!114373)) (mask!10105 thiss!1504)))))

(declare-fun b!227282 () Bool)

(assert (=> b!227282 (= e!147441 e!147439)))

(declare-fun res!111878 () Bool)

(assert (=> b!227282 (=> (not res!111878) (not e!147439))))

(assert (=> b!227282 (= res!111878 (or (= lt!114373 (MissingZero!892 index!297)) (= lt!114373 (MissingVacant!892 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11163 (_ BitVec 32)) SeekEntryResult!892)

(assert (=> b!227282 (= lt!114373 (seekEntryOrOpen!0 key!932 (_keys!6299 thiss!1504) (mask!10105 thiss!1504)))))

(declare-fun b!227283 () Bool)

(declare-fun e!147435 () Bool)

(assert (=> b!227283 (= e!147445 (and e!147435 mapRes!10108))))

(declare-fun condMapEmpty!10108 () Bool)

(declare-fun mapDefault!10108 () ValueCell!2636)

