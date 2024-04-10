; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21726 () Bool)

(assert start!21726)

(declare-fun b!218472 () Bool)

(declare-fun b_free!5875 () Bool)

(declare-fun b_next!5875 () Bool)

(assert (=> b!218472 (= b_free!5875 (not b_next!5875))))

(declare-fun tp!20759 () Bool)

(declare-fun b_and!12765 () Bool)

(assert (=> b!218472 (= tp!20759 b_and!12765)))

(declare-fun b!218461 () Bool)

(declare-datatypes ((Unit!6508 0))(
  ( (Unit!6509) )
))
(declare-fun e!142117 () Unit!6508)

(declare-fun lt!111536 () Unit!6508)

(assert (=> b!218461 (= e!142117 lt!111536)))

(declare-datatypes ((V!7297 0))(
  ( (V!7298 (val!2913 Int)) )
))
(declare-datatypes ((ValueCell!2525 0))(
  ( (ValueCellFull!2525 (v!4931 V!7297)) (EmptyCell!2525) )
))
(declare-datatypes ((array!10713 0))(
  ( (array!10714 (arr!5078 (Array (_ BitVec 32) ValueCell!2525)) (size!5410 (_ BitVec 32))) )
))
(declare-datatypes ((array!10715 0))(
  ( (array!10716 (arr!5079 (Array (_ BitVec 32) (_ BitVec 64))) (size!5411 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2950 0))(
  ( (LongMapFixedSize!2951 (defaultEntry!4125 Int) (mask!9902 (_ BitVec 32)) (extraKeys!3862 (_ BitVec 32)) (zeroValue!3966 V!7297) (minValue!3966 V!7297) (_size!1524 (_ BitVec 32)) (_keys!6174 array!10715) (_values!4108 array!10713) (_vacant!1524 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2950)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!198 (array!10715 array!10713 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 64) Int) Unit!6508)

(assert (=> b!218461 (= lt!111536 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!198 (_keys!6174 thiss!1504) (_values!4108 thiss!1504) (mask!9902 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) key!932 (defaultEntry!4125 thiss!1504)))))

(declare-fun c!36338 () Bool)

(declare-datatypes ((SeekEntryResult!788 0))(
  ( (MissingZero!788 (index!5322 (_ BitVec 32))) (Found!788 (index!5323 (_ BitVec 32))) (Intermediate!788 (undefined!1600 Bool) (index!5324 (_ BitVec 32)) (x!22844 (_ BitVec 32))) (Undefined!788) (MissingVacant!788 (index!5325 (_ BitVec 32))) )
))
(declare-fun lt!111535 () SeekEntryResult!788)

(assert (=> b!218461 (= c!36338 (is-MissingZero!788 lt!111535))))

(declare-fun e!142109 () Bool)

(assert (=> b!218461 e!142109))

(declare-fun b!218462 () Bool)

(declare-fun e!142112 () Bool)

(declare-fun tp_is_empty!5737 () Bool)

(assert (=> b!218462 (= e!142112 tp_is_empty!5737)))

(declare-fun b!218463 () Bool)

(declare-fun e!142116 () Bool)

(declare-fun call!20387 () Bool)

(assert (=> b!218463 (= e!142116 (not call!20387))))

(declare-fun b!218464 () Bool)

(declare-fun e!142115 () Bool)

(assert (=> b!218464 (= e!142115 (is-Undefined!788 lt!111535))))

(declare-fun b!218465 () Bool)

(declare-fun c!36337 () Bool)

(assert (=> b!218465 (= c!36337 (is-MissingVacant!788 lt!111535))))

(assert (=> b!218465 (= e!142109 e!142115)))

(declare-fun bm!20384 () Bool)

(declare-fun call!20388 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20384 (= call!20388 (inRange!0 (ite c!36338 (index!5322 lt!111535) (index!5325 lt!111535)) (mask!9902 thiss!1504)))))

(declare-fun b!218466 () Bool)

(declare-fun res!107118 () Bool)

(declare-fun e!142113 () Bool)

(assert (=> b!218466 (=> (not res!107118) (not e!142113))))

(assert (=> b!218466 (= res!107118 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218467 () Bool)

(declare-fun e!142114 () Bool)

(assert (=> b!218467 (= e!142113 e!142114)))

(declare-fun res!107115 () Bool)

(assert (=> b!218467 (=> (not res!107115) (not e!142114))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218467 (= res!107115 (or (= lt!111535 (MissingZero!788 index!297)) (= lt!111535 (MissingVacant!788 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10715 (_ BitVec 32)) SeekEntryResult!788)

(assert (=> b!218467 (= lt!111535 (seekEntryOrOpen!0 key!932 (_keys!6174 thiss!1504) (mask!9902 thiss!1504)))))

(declare-fun b!218468 () Bool)

(declare-fun e!142108 () Bool)

(declare-fun e!142106 () Bool)

(declare-fun mapRes!9768 () Bool)

(assert (=> b!218468 (= e!142108 (and e!142106 mapRes!9768))))

(declare-fun condMapEmpty!9768 () Bool)

(declare-fun mapDefault!9768 () ValueCell!2525)

