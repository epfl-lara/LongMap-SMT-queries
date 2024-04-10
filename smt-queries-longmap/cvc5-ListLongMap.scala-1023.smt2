; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21758 () Bool)

(assert start!21758)

(declare-fun b!218931 () Bool)

(declare-fun b_free!5887 () Bool)

(declare-fun b_next!5887 () Bool)

(assert (=> b!218931 (= b_free!5887 (not b_next!5887))))

(declare-fun tp!20799 () Bool)

(declare-fun b_and!12779 () Bool)

(assert (=> b!218931 (= tp!20799 b_and!12779)))

(declare-fun mapIsEmpty!9789 () Bool)

(declare-fun mapRes!9789 () Bool)

(assert (=> mapIsEmpty!9789 mapRes!9789))

(declare-fun b!218923 () Bool)

(declare-fun res!107313 () Bool)

(declare-datatypes ((V!7313 0))(
  ( (V!7314 (val!2919 Int)) )
))
(declare-datatypes ((ValueCell!2531 0))(
  ( (ValueCellFull!2531 (v!4938 V!7313)) (EmptyCell!2531) )
))
(declare-datatypes ((array!10739 0))(
  ( (array!10740 (arr!5090 (Array (_ BitVec 32) ValueCell!2531)) (size!5422 (_ BitVec 32))) )
))
(declare-datatypes ((array!10741 0))(
  ( (array!10742 (arr!5091 (Array (_ BitVec 32) (_ BitVec 64))) (size!5423 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2962 0))(
  ( (LongMapFixedSize!2963 (defaultEntry!4134 Int) (mask!9917 (_ BitVec 32)) (extraKeys!3871 (_ BitVec 32)) (zeroValue!3975 V!7313) (minValue!3975 V!7313) (_size!1530 (_ BitVec 32)) (_keys!6184 array!10741) (_values!4117 array!10739) (_vacant!1530 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2962)

(declare-datatypes ((SeekEntryResult!794 0))(
  ( (MissingZero!794 (index!5346 (_ BitVec 32))) (Found!794 (index!5347 (_ BitVec 32))) (Intermediate!794 (undefined!1606 Bool) (index!5348 (_ BitVec 32)) (x!22876 (_ BitVec 32))) (Undefined!794) (MissingVacant!794 (index!5349 (_ BitVec 32))) )
))
(declare-fun lt!111708 () SeekEntryResult!794)

(assert (=> b!218923 (= res!107313 (= (select (arr!5091 (_keys!6184 thiss!1504)) (index!5349 lt!111708)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142429 () Bool)

(assert (=> b!218923 (=> (not res!107313) (not e!142429))))

(declare-fun b!218924 () Bool)

(declare-datatypes ((Unit!6526 0))(
  ( (Unit!6527) )
))
(declare-fun e!142428 () Unit!6526)

(declare-fun Unit!6528 () Unit!6526)

(assert (=> b!218924 (= e!142428 Unit!6528)))

(declare-fun lt!111707 () Unit!6526)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!191 (array!10741 array!10739 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6526)

(assert (=> b!218924 (= lt!111707 (lemmaInListMapThenSeekEntryOrOpenFindsIt!191 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> b!218924 false))

(declare-fun mapNonEmpty!9789 () Bool)

(declare-fun tp!20798 () Bool)

(declare-fun e!142418 () Bool)

(assert (=> mapNonEmpty!9789 (= mapRes!9789 (and tp!20798 e!142418))))

(declare-fun mapValue!9789 () ValueCell!2531)

(declare-fun mapKey!9789 () (_ BitVec 32))

(declare-fun mapRest!9789 () (Array (_ BitVec 32) ValueCell!2531))

(assert (=> mapNonEmpty!9789 (= (arr!5090 (_values!4117 thiss!1504)) (store mapRest!9789 mapKey!9789 mapValue!9789))))

(declare-fun b!218925 () Bool)

(declare-fun res!107318 () Bool)

(declare-fun e!142423 () Bool)

(assert (=> b!218925 (=> (not res!107318) (not e!142423))))

(declare-fun call!20450 () Bool)

(assert (=> b!218925 (= res!107318 call!20450)))

(declare-fun e!142424 () Bool)

(assert (=> b!218925 (= e!142424 e!142423)))

(declare-fun b!218926 () Bool)

(declare-fun res!107316 () Bool)

(assert (=> b!218926 (=> (not res!107316) (not e!142423))))

(assert (=> b!218926 (= res!107316 (= (select (arr!5091 (_keys!6184 thiss!1504)) (index!5346 lt!111708)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218927 () Bool)

(declare-fun tp_is_empty!5749 () Bool)

(assert (=> b!218927 (= e!142418 tp_is_empty!5749)))

(declare-fun b!218929 () Bool)

(declare-fun e!142427 () Bool)

(assert (=> b!218929 (= e!142427 tp_is_empty!5749)))

(declare-fun b!218930 () Bool)

(declare-fun e!142425 () Bool)

(assert (=> b!218930 (= e!142425 (and e!142427 mapRes!9789))))

(declare-fun condMapEmpty!9789 () Bool)

(declare-fun mapDefault!9789 () ValueCell!2531)

