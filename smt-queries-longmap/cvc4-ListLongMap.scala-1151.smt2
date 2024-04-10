; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24184 () Bool)

(assert start!24184)

(declare-fun b!252966 () Bool)

(declare-fun b_free!6659 () Bool)

(declare-fun b_next!6659 () Bool)

(assert (=> b!252966 (= b_free!6659 (not b_next!6659))))

(declare-fun tp!23259 () Bool)

(declare-fun b_and!13697 () Bool)

(assert (=> b!252966 (= tp!23259 b_and!13697)))

(declare-fun b!252963 () Bool)

(declare-fun e!164028 () Bool)

(declare-fun e!164026 () Bool)

(assert (=> b!252963 (= e!164028 e!164026)))

(declare-fun res!123820 () Bool)

(declare-fun call!23844 () Bool)

(assert (=> b!252963 (= res!123820 call!23844)))

(assert (=> b!252963 (=> (not res!123820) (not e!164026))))

(declare-fun b!252964 () Bool)

(declare-datatypes ((Unit!7835 0))(
  ( (Unit!7836) )
))
(declare-fun e!164031 () Unit!7835)

(declare-fun Unit!7837 () Unit!7835)

(assert (=> b!252964 (= e!164031 Unit!7837)))

(declare-fun lt!126798 () Unit!7835)

(declare-datatypes ((V!8341 0))(
  ( (V!8342 (val!3305 Int)) )
))
(declare-datatypes ((ValueCell!2917 0))(
  ( (ValueCellFull!2917 (v!5377 V!8341)) (EmptyCell!2917) )
))
(declare-datatypes ((array!12369 0))(
  ( (array!12370 (arr!5862 (Array (_ BitVec 32) ValueCell!2917)) (size!6209 (_ BitVec 32))) )
))
(declare-datatypes ((array!12371 0))(
  ( (array!12372 (arr!5863 (Array (_ BitVec 32) (_ BitVec 64))) (size!6210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3734 0))(
  ( (LongMapFixedSize!3735 (defaultEntry!4672 Int) (mask!10898 (_ BitVec 32)) (extraKeys!4409 (_ BitVec 32)) (zeroValue!4513 V!8341) (minValue!4513 V!8341) (_size!1916 (_ BitVec 32)) (_keys!6822 array!12371) (_values!4655 array!12369) (_vacant!1916 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3734)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!214 (array!12371 array!12369 (_ BitVec 32) (_ BitVec 32) V!8341 V!8341 (_ BitVec 64) (_ BitVec 32) Int) Unit!7835)

(assert (=> b!252964 (= lt!126798 (lemmaArrayContainsKeyThenInListMap!214 (_keys!6822 thiss!1504) (_values!4655 thiss!1504) (mask!10898 thiss!1504) (extraKeys!4409 thiss!1504) (zeroValue!4513 thiss!1504) (minValue!4513 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4672 thiss!1504)))))

(assert (=> b!252964 false))

(declare-fun b!252965 () Bool)

(declare-fun call!23845 () Bool)

(assert (=> b!252965 (= e!164026 (not call!23845))))

(declare-fun e!164030 () Bool)

(declare-fun tp_is_empty!6521 () Bool)

(declare-fun e!164025 () Bool)

(declare-fun array_inv!3877 (array!12371) Bool)

(declare-fun array_inv!3878 (array!12369) Bool)

(assert (=> b!252966 (= e!164030 (and tp!23259 tp_is_empty!6521 (array_inv!3877 (_keys!6822 thiss!1504)) (array_inv!3878 (_values!4655 thiss!1504)) e!164025))))

(declare-fun res!123824 () Bool)

(declare-fun e!164037 () Bool)

(assert (=> start!24184 (=> (not res!123824) (not e!164037))))

(declare-fun valid!1462 (LongMapFixedSize!3734) Bool)

(assert (=> start!24184 (= res!123824 (valid!1462 thiss!1504))))

(assert (=> start!24184 e!164037))

(assert (=> start!24184 e!164030))

(assert (=> start!24184 true))

(declare-fun b!252967 () Bool)

(declare-fun Unit!7838 () Unit!7835)

(assert (=> b!252967 (= e!164031 Unit!7838)))

(declare-fun b!252968 () Bool)

(declare-fun e!164027 () Unit!7835)

(declare-fun lt!126799 () Unit!7835)

(assert (=> b!252968 (= e!164027 lt!126799)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!413 (array!12371 array!12369 (_ BitVec 32) (_ BitVec 32) V!8341 V!8341 (_ BitVec 64) Int) Unit!7835)

(assert (=> b!252968 (= lt!126799 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!413 (_keys!6822 thiss!1504) (_values!4655 thiss!1504) (mask!10898 thiss!1504) (extraKeys!4409 thiss!1504) (zeroValue!4513 thiss!1504) (minValue!4513 thiss!1504) key!932 (defaultEntry!4672 thiss!1504)))))

(declare-fun c!42640 () Bool)

(declare-datatypes ((SeekEntryResult!1137 0))(
  ( (MissingZero!1137 (index!6718 (_ BitVec 32))) (Found!1137 (index!6719 (_ BitVec 32))) (Intermediate!1137 (undefined!1949 Bool) (index!6720 (_ BitVec 32)) (x!24793 (_ BitVec 32))) (Undefined!1137) (MissingVacant!1137 (index!6721 (_ BitVec 32))) )
))
(declare-fun lt!126792 () SeekEntryResult!1137)

(assert (=> b!252968 (= c!42640 (is-MissingZero!1137 lt!126792))))

(declare-fun e!164033 () Bool)

(assert (=> b!252968 e!164033))

(declare-fun b!252969 () Bool)

(declare-fun e!164035 () Bool)

(declare-fun mapRes!11091 () Bool)

(assert (=> b!252969 (= e!164025 (and e!164035 mapRes!11091))))

(declare-fun condMapEmpty!11091 () Bool)

(declare-fun mapDefault!11091 () ValueCell!2917)

