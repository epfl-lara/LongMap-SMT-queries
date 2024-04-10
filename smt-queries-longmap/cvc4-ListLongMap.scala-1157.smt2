; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24294 () Bool)

(assert start!24294)

(declare-fun b!254695 () Bool)

(declare-fun b_free!6695 () Bool)

(declare-fun b_next!6695 () Bool)

(assert (=> b!254695 (= b_free!6695 (not b_next!6695))))

(declare-fun tp!23373 () Bool)

(declare-fun b_and!13737 () Bool)

(assert (=> b!254695 (= tp!23373 b_and!13737)))

(declare-fun c!42960 () Bool)

(declare-datatypes ((V!8389 0))(
  ( (V!8390 (val!3323 Int)) )
))
(declare-datatypes ((ValueCell!2935 0))(
  ( (ValueCellFull!2935 (v!5397 V!8389)) (EmptyCell!2935) )
))
(declare-datatypes ((array!12445 0))(
  ( (array!12446 (arr!5898 (Array (_ BitVec 32) ValueCell!2935)) (size!6245 (_ BitVec 32))) )
))
(declare-datatypes ((array!12447 0))(
  ( (array!12448 (arr!5899 (Array (_ BitVec 32) (_ BitVec 64))) (size!6246 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3770 0))(
  ( (LongMapFixedSize!3771 (defaultEntry!4698 Int) (mask!10946 (_ BitVec 32)) (extraKeys!4435 (_ BitVec 32)) (zeroValue!4539 V!8389) (minValue!4539 V!8389) (_size!1934 (_ BitVec 32)) (_keys!6852 array!12447) (_values!4681 array!12445) (_vacant!1934 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3770)

(declare-fun call!24031 () Bool)

(declare-datatypes ((SeekEntryResult!1153 0))(
  ( (MissingZero!1153 (index!6782 (_ BitVec 32))) (Found!1153 (index!6783 (_ BitVec 32))) (Intermediate!1153 (undefined!1965 Bool) (index!6784 (_ BitVec 32)) (x!24877 (_ BitVec 32))) (Undefined!1153) (MissingVacant!1153 (index!6785 (_ BitVec 32))) )
))
(declare-fun lt!127639 () SeekEntryResult!1153)

(declare-fun bm!24027 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24027 (= call!24031 (inRange!0 (ite c!42960 (index!6782 lt!127639) (index!6785 lt!127639)) (mask!10946 thiss!1504)))))

(declare-fun b!254684 () Bool)

(declare-datatypes ((Unit!7901 0))(
  ( (Unit!7902) )
))
(declare-fun e!165090 () Unit!7901)

(declare-fun lt!127629 () Unit!7901)

(assert (=> b!254684 (= e!165090 lt!127629)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!423 (array!12447 array!12445 (_ BitVec 32) (_ BitVec 32) V!8389 V!8389 (_ BitVec 64) Int) Unit!7901)

(assert (=> b!254684 (= lt!127629 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!423 (_keys!6852 thiss!1504) (_values!4681 thiss!1504) (mask!10946 thiss!1504) (extraKeys!4435 thiss!1504) (zeroValue!4539 thiss!1504) (minValue!4539 thiss!1504) key!932 (defaultEntry!4698 thiss!1504)))))

(assert (=> b!254684 (= c!42960 (is-MissingZero!1153 lt!127639))))

(declare-fun e!165095 () Bool)

(assert (=> b!254684 e!165095))

(declare-fun b!254685 () Bool)

(declare-fun Unit!7903 () Unit!7901)

(assert (=> b!254685 (= e!165090 Unit!7903)))

(declare-fun lt!127630 () Unit!7901)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!420 (array!12447 array!12445 (_ BitVec 32) (_ BitVec 32) V!8389 V!8389 (_ BitVec 64) Int) Unit!7901)

(assert (=> b!254685 (= lt!127630 (lemmaInListMapThenSeekEntryOrOpenFindsIt!420 (_keys!6852 thiss!1504) (_values!4681 thiss!1504) (mask!10946 thiss!1504) (extraKeys!4435 thiss!1504) (zeroValue!4539 thiss!1504) (minValue!4539 thiss!1504) key!932 (defaultEntry!4698 thiss!1504)))))

(assert (=> b!254685 false))

(declare-fun bm!24028 () Bool)

(declare-fun call!24030 () Bool)

(declare-fun arrayContainsKey!0 (array!12447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24028 (= call!24030 (arrayContainsKey!0 (_keys!6852 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254686 () Bool)

(declare-fun e!165099 () Unit!7901)

(declare-fun Unit!7904 () Unit!7901)

(assert (=> b!254686 (= e!165099 Unit!7904)))

(declare-fun lt!127637 () Unit!7901)

(declare-fun lemmaArrayContainsKeyThenInListMap!226 (array!12447 array!12445 (_ BitVec 32) (_ BitVec 32) V!8389 V!8389 (_ BitVec 64) (_ BitVec 32) Int) Unit!7901)

(assert (=> b!254686 (= lt!127637 (lemmaArrayContainsKeyThenInListMap!226 (_keys!6852 thiss!1504) (_values!4681 thiss!1504) (mask!10946 thiss!1504) (extraKeys!4435 thiss!1504) (zeroValue!4539 thiss!1504) (minValue!4539 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4698 thiss!1504)))))

(assert (=> b!254686 false))

(declare-fun b!254687 () Bool)

(declare-fun res!124667 () Bool)

(assert (=> b!254687 (= res!124667 (= (select (arr!5899 (_keys!6852 thiss!1504)) (index!6785 lt!127639)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165093 () Bool)

(assert (=> b!254687 (=> (not res!124667) (not e!165093))))

(declare-fun b!254688 () Bool)

(declare-fun e!165097 () Bool)

(declare-fun tp_is_empty!6557 () Bool)

(assert (=> b!254688 (= e!165097 tp_is_empty!6557)))

(declare-fun b!254689 () Bool)

(declare-fun Unit!7905 () Unit!7901)

(assert (=> b!254689 (= e!165099 Unit!7905)))

(declare-fun b!254690 () Bool)

(declare-fun e!165101 () Bool)

(declare-fun e!165096 () Bool)

(declare-fun mapRes!11151 () Bool)

(assert (=> b!254690 (= e!165101 (and e!165096 mapRes!11151))))

(declare-fun condMapEmpty!11151 () Bool)

(declare-fun mapDefault!11151 () ValueCell!2935)

