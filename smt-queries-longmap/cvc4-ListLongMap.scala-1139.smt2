; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23568 () Bool)

(assert start!23568)

(declare-fun b!247576 () Bool)

(declare-fun b_free!6587 () Bool)

(declare-fun b_next!6587 () Bool)

(assert (=> b!247576 (= b_free!6587 (not b_next!6587))))

(declare-fun tp!23008 () Bool)

(declare-fun b_and!13589 () Bool)

(assert (=> b!247576 (= tp!23008 b_and!13589)))

(declare-fun b!247557 () Bool)

(declare-datatypes ((Unit!7652 0))(
  ( (Unit!7653) )
))
(declare-fun e!160592 () Unit!7652)

(declare-fun lt!123987 () Unit!7652)

(assert (=> b!247557 (= e!160592 lt!123987)))

(declare-datatypes ((V!8245 0))(
  ( (V!8246 (val!3269 Int)) )
))
(declare-datatypes ((ValueCell!2881 0))(
  ( (ValueCellFull!2881 (v!5327 V!8245)) (EmptyCell!2881) )
))
(declare-datatypes ((array!12205 0))(
  ( (array!12206 (arr!5790 (Array (_ BitVec 32) ValueCell!2881)) (size!6133 (_ BitVec 32))) )
))
(declare-datatypes ((array!12207 0))(
  ( (array!12208 (arr!5791 (Array (_ BitVec 32) (_ BitVec 64))) (size!6134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3662 0))(
  ( (LongMapFixedSize!3663 (defaultEntry!4580 Int) (mask!10718 (_ BitVec 32)) (extraKeys!4317 (_ BitVec 32)) (zeroValue!4421 V!8245) (minValue!4421 V!8245) (_size!1880 (_ BitVec 32)) (_keys!6702 array!12207) (_values!4563 array!12205) (_vacant!1880 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3662)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!387 (array!12207 array!12205 (_ BitVec 32) (_ BitVec 32) V!8245 V!8245 (_ BitVec 64) Int) Unit!7652)

(assert (=> b!247557 (= lt!123987 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!387 (_keys!6702 thiss!1504) (_values!4563 thiss!1504) (mask!10718 thiss!1504) (extraKeys!4317 thiss!1504) (zeroValue!4421 thiss!1504) (minValue!4421 thiss!1504) key!932 (defaultEntry!4580 thiss!1504)))))

(declare-fun c!41447 () Bool)

(declare-datatypes ((SeekEntryResult!1102 0))(
  ( (MissingZero!1102 (index!6578 (_ BitVec 32))) (Found!1102 (index!6579 (_ BitVec 32))) (Intermediate!1102 (undefined!1914 Bool) (index!6580 (_ BitVec 32)) (x!24530 (_ BitVec 32))) (Undefined!1102) (MissingVacant!1102 (index!6581 (_ BitVec 32))) )
))
(declare-fun lt!123982 () SeekEntryResult!1102)

(assert (=> b!247557 (= c!41447 (is-MissingZero!1102 lt!123982))))

(declare-fun e!160600 () Bool)

(assert (=> b!247557 e!160600))

(declare-fun b!247558 () Bool)

(declare-fun e!160593 () Bool)

(declare-fun e!160594 () Bool)

(assert (=> b!247558 (= e!160593 e!160594)))

(declare-fun res!121347 () Bool)

(declare-fun call!23183 () Bool)

(assert (=> b!247558 (= res!121347 call!23183)))

(assert (=> b!247558 (=> (not res!121347) (not e!160594))))

(declare-fun b!247559 () Bool)

(declare-fun e!160588 () Unit!7652)

(declare-fun Unit!7654 () Unit!7652)

(assert (=> b!247559 (= e!160588 Unit!7654)))

(declare-fun b!247560 () Bool)

(declare-fun res!121350 () Bool)

(declare-fun e!160590 () Bool)

(assert (=> b!247560 (=> (not res!121350) (not e!160590))))

(assert (=> b!247560 (= res!121350 (= (select (arr!5791 (_keys!6702 thiss!1504)) (index!6578 lt!123982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247561 () Bool)

(declare-fun res!121344 () Bool)

(declare-fun e!160599 () Bool)

(assert (=> b!247561 (=> res!121344 e!160599)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247561 (= res!121344 (or (not (= (size!6134 (_keys!6702 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10718 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6134 (_keys!6702 thiss!1504)))))))

(declare-fun b!247562 () Bool)

(declare-fun e!160589 () Bool)

(declare-fun tp_is_empty!6449 () Bool)

(assert (=> b!247562 (= e!160589 tp_is_empty!6449)))

(declare-fun res!121341 () Bool)

(declare-fun e!160598 () Bool)

(assert (=> start!23568 (=> (not res!121341) (not e!160598))))

(declare-fun valid!1432 (LongMapFixedSize!3662) Bool)

(assert (=> start!23568 (= res!121341 (valid!1432 thiss!1504))))

(assert (=> start!23568 e!160598))

(declare-fun e!160601 () Bool)

(assert (=> start!23568 e!160601))

(assert (=> start!23568 true))

(declare-fun b!247563 () Bool)

(declare-fun lt!123983 () Bool)

(assert (=> b!247563 (= e!160599 (not lt!123983))))

(declare-fun b!247564 () Bool)

(declare-fun c!41449 () Bool)

(assert (=> b!247564 (= c!41449 (is-MissingVacant!1102 lt!123982))))

(assert (=> b!247564 (= e!160600 e!160593)))

(declare-fun b!247565 () Bool)

(declare-fun call!23182 () Bool)

(assert (=> b!247565 (= e!160590 (not call!23182))))

(declare-fun b!247566 () Bool)

(declare-fun e!160596 () Bool)

(assert (=> b!247566 (= e!160596 (not e!160599))))

(declare-fun res!121345 () Bool)

(assert (=> b!247566 (=> res!121345 e!160599)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247566 (= res!121345 (not (validMask!0 (mask!10718 thiss!1504))))))

(declare-fun lt!123986 () array!12207)

(declare-fun arrayCountValidKeys!0 (array!12207 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247566 (= (arrayCountValidKeys!0 lt!123986 #b00000000000000000000000000000000 (size!6134 (_keys!6702 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6702 thiss!1504) #b00000000000000000000000000000000 (size!6134 (_keys!6702 thiss!1504)))))))

(declare-fun lt!123984 () Unit!7652)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12207 (_ BitVec 32) (_ BitVec 64)) Unit!7652)

(assert (=> b!247566 (= lt!123984 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6702 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3693 0))(
  ( (Nil!3690) (Cons!3689 (h!4347 (_ BitVec 64)) (t!8716 List!3693)) )
))
(declare-fun arrayNoDuplicates!0 (array!12207 (_ BitVec 32) List!3693) Bool)

(assert (=> b!247566 (arrayNoDuplicates!0 lt!123986 #b00000000000000000000000000000000 Nil!3690)))

(assert (=> b!247566 (= lt!123986 (array!12208 (store (arr!5791 (_keys!6702 thiss!1504)) index!297 key!932) (size!6134 (_keys!6702 thiss!1504))))))

(declare-fun lt!123989 () Unit!7652)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12207 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3693) Unit!7652)

(assert (=> b!247566 (= lt!123989 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6702 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3690))))

(declare-fun lt!123990 () Unit!7652)

(assert (=> b!247566 (= lt!123990 e!160588)))

(declare-fun c!41450 () Bool)

(assert (=> b!247566 (= c!41450 lt!123983)))

(declare-fun arrayContainsKey!0 (array!12207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247566 (= lt!123983 (arrayContainsKey!0 (_keys!6702 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247567 () Bool)

(declare-fun e!160602 () Bool)

(assert (=> b!247567 (= e!160602 e!160596)))

(declare-fun res!121343 () Bool)

(assert (=> b!247567 (=> (not res!121343) (not e!160596))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247567 (= res!121343 (inRange!0 index!297 (mask!10718 thiss!1504)))))

(declare-fun lt!123988 () Unit!7652)

(assert (=> b!247567 (= lt!123988 e!160592)))

(declare-fun c!41448 () Bool)

(declare-datatypes ((tuple2!4812 0))(
  ( (tuple2!4813 (_1!2417 (_ BitVec 64)) (_2!2417 V!8245)) )
))
(declare-datatypes ((List!3694 0))(
  ( (Nil!3691) (Cons!3690 (h!4348 tuple2!4812) (t!8717 List!3694)) )
))
(declare-datatypes ((ListLongMap!3725 0))(
  ( (ListLongMap!3726 (toList!1878 List!3694)) )
))
(declare-fun contains!1792 (ListLongMap!3725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1406 (array!12207 array!12205 (_ BitVec 32) (_ BitVec 32) V!8245 V!8245 (_ BitVec 32) Int) ListLongMap!3725)

(assert (=> b!247567 (= c!41448 (contains!1792 (getCurrentListMap!1406 (_keys!6702 thiss!1504) (_values!4563 thiss!1504) (mask!10718 thiss!1504) (extraKeys!4317 thiss!1504) (zeroValue!4421 thiss!1504) (minValue!4421 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4580 thiss!1504)) key!932))))

(declare-fun b!247568 () Bool)

(declare-fun res!121349 () Bool)

(assert (=> b!247568 (= res!121349 (= (select (arr!5791 (_keys!6702 thiss!1504)) (index!6581 lt!123982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247568 (=> (not res!121349) (not e!160594))))

(declare-fun mapIsEmpty!10949 () Bool)

(declare-fun mapRes!10949 () Bool)

(assert (=> mapIsEmpty!10949 mapRes!10949))

(declare-fun b!247569 () Bool)

(declare-fun Unit!7655 () Unit!7652)

(assert (=> b!247569 (= e!160592 Unit!7655)))

(declare-fun lt!123981 () Unit!7652)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (array!12207 array!12205 (_ BitVec 32) (_ BitVec 32) V!8245 V!8245 (_ BitVec 64) Int) Unit!7652)

(assert (=> b!247569 (= lt!123981 (lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (_keys!6702 thiss!1504) (_values!4563 thiss!1504) (mask!10718 thiss!1504) (extraKeys!4317 thiss!1504) (zeroValue!4421 thiss!1504) (minValue!4421 thiss!1504) key!932 (defaultEntry!4580 thiss!1504)))))

(assert (=> b!247569 false))

(declare-fun b!247570 () Bool)

(declare-fun e!160591 () Bool)

(assert (=> b!247570 (= e!160591 (and e!160589 mapRes!10949))))

(declare-fun condMapEmpty!10949 () Bool)

(declare-fun mapDefault!10949 () ValueCell!2881)

