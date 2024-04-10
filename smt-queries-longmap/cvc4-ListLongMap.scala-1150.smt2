; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24142 () Bool)

(assert start!24142)

(declare-fun b!252537 () Bool)

(declare-fun b_free!6653 () Bool)

(declare-fun b_next!6653 () Bool)

(assert (=> b!252537 (= b_free!6653 (not b_next!6653))))

(declare-fun tp!23237 () Bool)

(declare-fun b_and!13689 () Bool)

(assert (=> b!252537 (= tp!23237 b_and!13689)))

(declare-fun b!252533 () Bool)

(declare-fun e!163758 () Bool)

(declare-fun e!163768 () Bool)

(assert (=> b!252533 (= e!163758 (not e!163768))))

(declare-fun res!123619 () Bool)

(assert (=> b!252533 (=> res!123619 e!163768)))

(declare-datatypes ((V!8333 0))(
  ( (V!8334 (val!3302 Int)) )
))
(declare-datatypes ((ValueCell!2914 0))(
  ( (ValueCellFull!2914 (v!5373 V!8333)) (EmptyCell!2914) )
))
(declare-datatypes ((array!12355 0))(
  ( (array!12356 (arr!5856 (Array (_ BitVec 32) ValueCell!2914)) (size!6203 (_ BitVec 32))) )
))
(declare-datatypes ((array!12357 0))(
  ( (array!12358 (arr!5857 (Array (_ BitVec 32) (_ BitVec 64))) (size!6204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3728 0))(
  ( (LongMapFixedSize!3729 (defaultEntry!4665 Int) (mask!10884 (_ BitVec 32)) (extraKeys!4402 (_ BitVec 32)) (zeroValue!4506 V!8333) (minValue!4506 V!8333) (_size!1913 (_ BitVec 32)) (_keys!6813 array!12357) (_values!4648 array!12355) (_vacant!1913 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3728)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252533 (= res!123619 (not (validMask!0 (mask!10884 thiss!1504))))))

(declare-fun lt!126583 () array!12357)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12357 (_ BitVec 32)) Bool)

(assert (=> b!252533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126583 (mask!10884 thiss!1504))))

(declare-datatypes ((Unit!7820 0))(
  ( (Unit!7821) )
))
(declare-fun lt!126577 () Unit!7820)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12357 (_ BitVec 32) (_ BitVec 32)) Unit!7820)

(assert (=> b!252533 (= lt!126577 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6813 thiss!1504) index!297 (mask!10884 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12357 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252533 (= (arrayCountValidKeys!0 lt!126583 #b00000000000000000000000000000000 (size!6204 (_keys!6813 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6813 thiss!1504) #b00000000000000000000000000000000 (size!6204 (_keys!6813 thiss!1504)))))))

(declare-fun lt!126578 () Unit!7820)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12357 (_ BitVec 32) (_ BitVec 64)) Unit!7820)

(assert (=> b!252533 (= lt!126578 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6813 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3744 0))(
  ( (Nil!3741) (Cons!3740 (h!4402 (_ BitVec 64)) (t!8785 List!3744)) )
))
(declare-fun arrayNoDuplicates!0 (array!12357 (_ BitVec 32) List!3744) Bool)

(assert (=> b!252533 (arrayNoDuplicates!0 lt!126583 #b00000000000000000000000000000000 Nil!3741)))

(assert (=> b!252533 (= lt!126583 (array!12358 (store (arr!5857 (_keys!6813 thiss!1504)) index!297 key!932) (size!6204 (_keys!6813 thiss!1504))))))

(declare-fun lt!126582 () Unit!7820)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3744) Unit!7820)

(assert (=> b!252533 (= lt!126582 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6813 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3741))))

(declare-fun lt!126580 () Unit!7820)

(declare-fun e!163760 () Unit!7820)

(assert (=> b!252533 (= lt!126580 e!163760)))

(declare-fun c!42552 () Bool)

(declare-fun arrayContainsKey!0 (array!12357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!252533 (= c!42552 (arrayContainsKey!0 (_keys!6813 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23784 () Bool)

(declare-fun c!42553 () Bool)

(declare-fun call!23787 () Bool)

(declare-datatypes ((SeekEntryResult!1134 0))(
  ( (MissingZero!1134 (index!6706 (_ BitVec 32))) (Found!1134 (index!6707 (_ BitVec 32))) (Intermediate!1134 (undefined!1946 Bool) (index!6708 (_ BitVec 32)) (x!24772 (_ BitVec 32))) (Undefined!1134) (MissingVacant!1134 (index!6709 (_ BitVec 32))) )
))
(declare-fun lt!126581 () SeekEntryResult!1134)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23784 (= call!23787 (inRange!0 (ite c!42553 (index!6706 lt!126581) (index!6709 lt!126581)) (mask!10884 thiss!1504)))))

(declare-fun bm!23785 () Bool)

(declare-fun call!23788 () Bool)

(assert (=> bm!23785 (= call!23788 (arrayContainsKey!0 (_keys!6813 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252534 () Bool)

(declare-fun e!163764 () Bool)

(assert (=> b!252534 (= e!163764 (is-Undefined!1134 lt!126581))))

(declare-fun b!252535 () Bool)

(declare-fun res!123621 () Bool)

(declare-fun e!163771 () Bool)

(assert (=> b!252535 (=> (not res!123621) (not e!163771))))

(assert (=> b!252535 (= res!123621 (= (select (arr!5857 (_keys!6813 thiss!1504)) (index!6706 lt!126581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252536 () Bool)

(declare-fun e!163770 () Bool)

(declare-fun tp_is_empty!6515 () Bool)

(assert (=> b!252536 (= e!163770 tp_is_empty!6515)))

(declare-fun e!163759 () Bool)

(declare-fun e!163767 () Bool)

(declare-fun array_inv!3871 (array!12357) Bool)

(declare-fun array_inv!3872 (array!12355) Bool)

(assert (=> b!252537 (= e!163767 (and tp!23237 tp_is_empty!6515 (array_inv!3871 (_keys!6813 thiss!1504)) (array_inv!3872 (_values!4648 thiss!1504)) e!163759))))

(declare-fun res!123613 () Bool)

(declare-fun e!163763 () Bool)

(assert (=> start!24142 (=> (not res!123613) (not e!163763))))

(declare-fun valid!1459 (LongMapFixedSize!3728) Bool)

(assert (=> start!24142 (= res!123613 (valid!1459 thiss!1504))))

(assert (=> start!24142 e!163763))

(assert (=> start!24142 e!163767))

(assert (=> start!24142 true))

(declare-fun b!252538 () Bool)

(declare-fun e!163766 () Bool)

(assert (=> b!252538 (= e!163766 e!163758)))

(declare-fun res!123620 () Bool)

(assert (=> b!252538 (=> (not res!123620) (not e!163758))))

(assert (=> b!252538 (= res!123620 (inRange!0 index!297 (mask!10884 thiss!1504)))))

(declare-fun lt!126579 () Unit!7820)

(declare-fun e!163769 () Unit!7820)

(assert (=> b!252538 (= lt!126579 e!163769)))

(declare-fun c!42551 () Bool)

(declare-datatypes ((tuple2!4864 0))(
  ( (tuple2!4865 (_1!2443 (_ BitVec 64)) (_2!2443 V!8333)) )
))
(declare-datatypes ((List!3745 0))(
  ( (Nil!3742) (Cons!3741 (h!4403 tuple2!4864) (t!8786 List!3745)) )
))
(declare-datatypes ((ListLongMap!3777 0))(
  ( (ListLongMap!3778 (toList!1904 List!3745)) )
))
(declare-fun contains!1831 (ListLongMap!3777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1432 (array!12357 array!12355 (_ BitVec 32) (_ BitVec 32) V!8333 V!8333 (_ BitVec 32) Int) ListLongMap!3777)

(assert (=> b!252538 (= c!42551 (contains!1831 (getCurrentListMap!1432 (_keys!6813 thiss!1504) (_values!4648 thiss!1504) (mask!10884 thiss!1504) (extraKeys!4402 thiss!1504) (zeroValue!4506 thiss!1504) (minValue!4506 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4665 thiss!1504)) key!932))))

(declare-fun b!252539 () Bool)

(assert (=> b!252539 (= e!163768 (arrayNoDuplicates!0 (_keys!6813 thiss!1504) #b00000000000000000000000000000000 Nil!3741))))

(declare-fun b!252540 () Bool)

(declare-fun Unit!7822 () Unit!7820)

(assert (=> b!252540 (= e!163769 Unit!7822)))

(declare-fun lt!126584 () Unit!7820)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (array!12357 array!12355 (_ BitVec 32) (_ BitVec 32) V!8333 V!8333 (_ BitVec 64) Int) Unit!7820)

(assert (=> b!252540 (= lt!126584 (lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (_keys!6813 thiss!1504) (_values!4648 thiss!1504) (mask!10884 thiss!1504) (extraKeys!4402 thiss!1504) (zeroValue!4506 thiss!1504) (minValue!4506 thiss!1504) key!932 (defaultEntry!4665 thiss!1504)))))

(assert (=> b!252540 false))

(declare-fun b!252541 () Bool)

(assert (=> b!252541 (= e!163771 (not call!23788))))

(declare-fun b!252542 () Bool)

(declare-fun e!163761 () Bool)

(assert (=> b!252542 (= e!163764 e!163761)))

(declare-fun res!123615 () Bool)

(assert (=> b!252542 (= res!123615 call!23787)))

(assert (=> b!252542 (=> (not res!123615) (not e!163761))))

(declare-fun b!252543 () Bool)

(declare-fun res!123618 () Bool)

(assert (=> b!252543 (=> (not res!123618) (not e!163763))))

(assert (=> b!252543 (= res!123618 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252544 () Bool)

(declare-fun res!123614 () Bool)

(assert (=> b!252544 (= res!123614 (= (select (arr!5857 (_keys!6813 thiss!1504)) (index!6709 lt!126581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252544 (=> (not res!123614) (not e!163761))))

(declare-fun b!252545 () Bool)

(declare-fun e!163765 () Bool)

(declare-fun mapRes!11079 () Bool)

(assert (=> b!252545 (= e!163759 (and e!163765 mapRes!11079))))

(declare-fun condMapEmpty!11079 () Bool)

(declare-fun mapDefault!11079 () ValueCell!2914)

