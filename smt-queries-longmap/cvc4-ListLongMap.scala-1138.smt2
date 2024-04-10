; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23528 () Bool)

(assert start!23528)

(declare-fun b!247179 () Bool)

(declare-fun b_free!6581 () Bool)

(declare-fun b_next!6581 () Bool)

(assert (=> b!247179 (= b_free!6581 (not b_next!6581))))

(declare-fun tp!22987 () Bool)

(declare-fun b_and!13581 () Bool)

(assert (=> b!247179 (= tp!22987 b_and!13581)))

(declare-fun b!247160 () Bool)

(declare-fun res!121165 () Bool)

(declare-fun e!160352 () Bool)

(assert (=> b!247160 (=> (not res!121165) (not e!160352))))

(declare-fun call!23130 () Bool)

(assert (=> b!247160 (= res!121165 call!23130)))

(declare-fun e!160342 () Bool)

(assert (=> b!247160 (= e!160342 e!160352)))

(declare-fun c!41364 () Bool)

(declare-fun bm!23127 () Bool)

(declare-datatypes ((V!8237 0))(
  ( (V!8238 (val!3266 Int)) )
))
(declare-datatypes ((ValueCell!2878 0))(
  ( (ValueCellFull!2878 (v!5323 V!8237)) (EmptyCell!2878) )
))
(declare-datatypes ((array!12191 0))(
  ( (array!12192 (arr!5784 (Array (_ BitVec 32) ValueCell!2878)) (size!6127 (_ BitVec 32))) )
))
(declare-datatypes ((array!12193 0))(
  ( (array!12194 (arr!5785 (Array (_ BitVec 32) (_ BitVec 64))) (size!6128 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3656 0))(
  ( (LongMapFixedSize!3657 (defaultEntry!4573 Int) (mask!10706 (_ BitVec 32)) (extraKeys!4310 (_ BitVec 32)) (zeroValue!4414 V!8237) (minValue!4414 V!8237) (_size!1877 (_ BitVec 32)) (_keys!6694 array!12193) (_values!4556 array!12191) (_vacant!1877 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3656)

(declare-datatypes ((SeekEntryResult!1099 0))(
  ( (MissingZero!1099 (index!6566 (_ BitVec 32))) (Found!1099 (index!6567 (_ BitVec 32))) (Intermediate!1099 (undefined!1911 Bool) (index!6568 (_ BitVec 32)) (x!24509 (_ BitVec 32))) (Undefined!1099) (MissingVacant!1099 (index!6569 (_ BitVec 32))) )
))
(declare-fun lt!123785 () SeekEntryResult!1099)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23127 (= call!23130 (inRange!0 (ite c!41364 (index!6566 lt!123785) (index!6569 lt!123785)) (mask!10706 thiss!1504)))))

(declare-fun b!247161 () Bool)

(declare-fun call!23131 () Bool)

(assert (=> b!247161 (= e!160352 (not call!23131))))

(declare-fun b!247162 () Bool)

(declare-fun e!160349 () Bool)

(declare-fun e!160340 () Bool)

(assert (=> b!247162 (= e!160349 e!160340)))

(declare-fun res!121159 () Bool)

(assert (=> b!247162 (= res!121159 call!23130)))

(assert (=> b!247162 (=> (not res!121159) (not e!160340))))

(declare-fun b!247163 () Bool)

(declare-fun e!160354 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247163 (= e!160354 (validKeyInArray!0 key!932))))

(declare-fun res!121164 () Bool)

(declare-fun e!160350 () Bool)

(assert (=> start!23528 (=> (not res!121164) (not e!160350))))

(declare-fun valid!1430 (LongMapFixedSize!3656) Bool)

(assert (=> start!23528 (= res!121164 (valid!1430 thiss!1504))))

(assert (=> start!23528 e!160350))

(declare-fun e!160344 () Bool)

(assert (=> start!23528 e!160344))

(assert (=> start!23528 true))

(declare-fun b!247164 () Bool)

(declare-fun e!160345 () Bool)

(declare-fun e!160341 () Bool)

(assert (=> b!247164 (= e!160345 e!160341)))

(declare-fun res!121161 () Bool)

(assert (=> b!247164 (=> (not res!121161) (not e!160341))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247164 (= res!121161 (inRange!0 index!297 (mask!10706 thiss!1504)))))

(declare-datatypes ((Unit!7636 0))(
  ( (Unit!7637) )
))
(declare-fun lt!123783 () Unit!7636)

(declare-fun e!160347 () Unit!7636)

(assert (=> b!247164 (= lt!123783 e!160347)))

(declare-fun c!41367 () Bool)

(declare-datatypes ((tuple2!4806 0))(
  ( (tuple2!4807 (_1!2414 (_ BitVec 64)) (_2!2414 V!8237)) )
))
(declare-datatypes ((List!3687 0))(
  ( (Nil!3684) (Cons!3683 (h!4341 tuple2!4806) (t!8708 List!3687)) )
))
(declare-datatypes ((ListLongMap!3719 0))(
  ( (ListLongMap!3720 (toList!1875 List!3687)) )
))
(declare-fun contains!1788 (ListLongMap!3719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1403 (array!12193 array!12191 (_ BitVec 32) (_ BitVec 32) V!8237 V!8237 (_ BitVec 32) Int) ListLongMap!3719)

(assert (=> b!247164 (= c!41367 (contains!1788 (getCurrentListMap!1403 (_keys!6694 thiss!1504) (_values!4556 thiss!1504) (mask!10706 thiss!1504) (extraKeys!4310 thiss!1504) (zeroValue!4414 thiss!1504) (minValue!4414 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4573 thiss!1504)) key!932))))

(declare-fun b!247165 () Bool)

(declare-fun e!160346 () Unit!7636)

(declare-fun Unit!7638 () Unit!7636)

(assert (=> b!247165 (= e!160346 Unit!7638)))

(declare-fun b!247166 () Bool)

(declare-fun e!160348 () Bool)

(declare-fun tp_is_empty!6443 () Bool)

(assert (=> b!247166 (= e!160348 tp_is_empty!6443)))

(declare-fun b!247167 () Bool)

(assert (=> b!247167 (= e!160350 e!160345)))

(declare-fun res!121163 () Bool)

(assert (=> b!247167 (=> (not res!121163) (not e!160345))))

(assert (=> b!247167 (= res!121163 (or (= lt!123785 (MissingZero!1099 index!297)) (= lt!123785 (MissingVacant!1099 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12193 (_ BitVec 32)) SeekEntryResult!1099)

(assert (=> b!247167 (= lt!123785 (seekEntryOrOpen!0 key!932 (_keys!6694 thiss!1504) (mask!10706 thiss!1504)))))

(declare-fun b!247168 () Bool)

(declare-fun res!121157 () Bool)

(assert (=> b!247168 (=> (not res!121157) (not e!160352))))

(assert (=> b!247168 (= res!121157 (= (select (arr!5785 (_keys!6694 thiss!1504)) (index!6566 lt!123785)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247169 () Bool)

(declare-fun c!41366 () Bool)

(assert (=> b!247169 (= c!41366 (is-MissingVacant!1099 lt!123785))))

(assert (=> b!247169 (= e!160342 e!160349)))

(declare-fun b!247170 () Bool)

(declare-fun res!121156 () Bool)

(assert (=> b!247170 (= res!121156 (= (select (arr!5785 (_keys!6694 thiss!1504)) (index!6569 lt!123785)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247170 (=> (not res!121156) (not e!160340))))

(declare-fun b!247171 () Bool)

(declare-fun e!160353 () Bool)

(assert (=> b!247171 (= e!160353 tp_is_empty!6443)))

(declare-fun b!247172 () Bool)

(assert (=> b!247172 (= e!160341 (not e!160354))))

(declare-fun res!121162 () Bool)

(assert (=> b!247172 (=> res!121162 e!160354)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247172 (= res!121162 (not (validMask!0 (mask!10706 thiss!1504))))))

(declare-fun lt!123784 () array!12193)

(declare-fun arrayCountValidKeys!0 (array!12193 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247172 (= (arrayCountValidKeys!0 lt!123784 #b00000000000000000000000000000000 (size!6128 (_keys!6694 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6694 thiss!1504) #b00000000000000000000000000000000 (size!6128 (_keys!6694 thiss!1504)))))))

(declare-fun lt!123781 () Unit!7636)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12193 (_ BitVec 32) (_ BitVec 64)) Unit!7636)

(assert (=> b!247172 (= lt!123781 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6694 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3688 0))(
  ( (Nil!3685) (Cons!3684 (h!4342 (_ BitVec 64)) (t!8709 List!3688)) )
))
(declare-fun arrayNoDuplicates!0 (array!12193 (_ BitVec 32) List!3688) Bool)

(assert (=> b!247172 (arrayNoDuplicates!0 lt!123784 #b00000000000000000000000000000000 Nil!3685)))

(assert (=> b!247172 (= lt!123784 (array!12194 (store (arr!5785 (_keys!6694 thiss!1504)) index!297 key!932) (size!6128 (_keys!6694 thiss!1504))))))

(declare-fun lt!123788 () Unit!7636)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12193 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3688) Unit!7636)

(assert (=> b!247172 (= lt!123788 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6694 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3685))))

(declare-fun lt!123786 () Unit!7636)

(assert (=> b!247172 (= lt!123786 e!160346)))

(declare-fun c!41365 () Bool)

(declare-fun arrayContainsKey!0 (array!12193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247172 (= c!41365 (arrayContainsKey!0 (_keys!6694 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247173 () Bool)

(assert (=> b!247173 (= e!160349 (is-Undefined!1099 lt!123785))))

(declare-fun b!247174 () Bool)

(declare-fun Unit!7639 () Unit!7636)

(assert (=> b!247174 (= e!160347 Unit!7639)))

(declare-fun lt!123787 () Unit!7636)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (array!12193 array!12191 (_ BitVec 32) (_ BitVec 32) V!8237 V!8237 (_ BitVec 64) Int) Unit!7636)

(assert (=> b!247174 (= lt!123787 (lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (_keys!6694 thiss!1504) (_values!4556 thiss!1504) (mask!10706 thiss!1504) (extraKeys!4310 thiss!1504) (zeroValue!4414 thiss!1504) (minValue!4414 thiss!1504) key!932 (defaultEntry!4573 thiss!1504)))))

(assert (=> b!247174 false))

(declare-fun b!247175 () Bool)

(declare-fun res!121158 () Bool)

(assert (=> b!247175 (=> res!121158 e!160354)))

(assert (=> b!247175 (= res!121158 (or (not (= (size!6128 (_keys!6694 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10706 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6128 (_keys!6694 thiss!1504)))))))

(declare-fun b!247176 () Bool)

(declare-fun res!121160 () Bool)

(assert (=> b!247176 (=> (not res!121160) (not e!160350))))

(assert (=> b!247176 (= res!121160 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247177 () Bool)

(assert (=> b!247177 (= e!160340 (not call!23131))))

(declare-fun mapNonEmpty!10937 () Bool)

(declare-fun mapRes!10937 () Bool)

(declare-fun tp!22988 () Bool)

(assert (=> mapNonEmpty!10937 (= mapRes!10937 (and tp!22988 e!160348))))

(declare-fun mapValue!10937 () ValueCell!2878)

(declare-fun mapRest!10937 () (Array (_ BitVec 32) ValueCell!2878))

(declare-fun mapKey!10937 () (_ BitVec 32))

(assert (=> mapNonEmpty!10937 (= (arr!5784 (_values!4556 thiss!1504)) (store mapRest!10937 mapKey!10937 mapValue!10937))))

(declare-fun bm!23128 () Bool)

(assert (=> bm!23128 (= call!23131 (arrayContainsKey!0 (_keys!6694 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247178 () Bool)

(declare-fun e!160343 () Bool)

(assert (=> b!247178 (= e!160343 (and e!160353 mapRes!10937))))

(declare-fun condMapEmpty!10937 () Bool)

(declare-fun mapDefault!10937 () ValueCell!2878)

