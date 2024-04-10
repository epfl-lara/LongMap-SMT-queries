; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24226 () Bool)

(assert start!24226)

(declare-fun b!253422 () Bool)

(declare-fun b_free!6665 () Bool)

(declare-fun b_next!6665 () Bool)

(assert (=> b!253422 (= b_free!6665 (not b_next!6665))))

(declare-fun tp!23279 () Bool)

(declare-fun b_and!13705 () Bool)

(assert (=> b!253422 (= tp!23279 b_and!13705)))

(declare-fun res!124037 () Bool)

(declare-fun e!164304 () Bool)

(assert (=> start!24226 (=> (not res!124037) (not e!164304))))

(declare-datatypes ((V!8349 0))(
  ( (V!8350 (val!3308 Int)) )
))
(declare-datatypes ((ValueCell!2920 0))(
  ( (ValueCellFull!2920 (v!5381 V!8349)) (EmptyCell!2920) )
))
(declare-datatypes ((array!12383 0))(
  ( (array!12384 (arr!5868 (Array (_ BitVec 32) ValueCell!2920)) (size!6215 (_ BitVec 32))) )
))
(declare-datatypes ((array!12385 0))(
  ( (array!12386 (arr!5869 (Array (_ BitVec 32) (_ BitVec 64))) (size!6216 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3740 0))(
  ( (LongMapFixedSize!3741 (defaultEntry!4679 Int) (mask!10912 (_ BitVec 32)) (extraKeys!4416 (_ BitVec 32)) (zeroValue!4520 V!8349) (minValue!4520 V!8349) (_size!1919 (_ BitVec 32)) (_keys!6831 array!12385) (_values!4662 array!12383) (_vacant!1919 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3740)

(declare-fun valid!1464 (LongMapFixedSize!3740) Bool)

(assert (=> start!24226 (= res!124037 (valid!1464 thiss!1504))))

(assert (=> start!24226 e!164304))

(declare-fun e!164294 () Bool)

(assert (=> start!24226 e!164294))

(assert (=> start!24226 true))

(declare-fun b!253402 () Bool)

(declare-fun e!164295 () Bool)

(declare-fun e!164298 () Bool)

(declare-fun mapRes!11103 () Bool)

(assert (=> b!253402 (= e!164295 (and e!164298 mapRes!11103))))

(declare-fun condMapEmpty!11103 () Bool)

(declare-fun mapDefault!11103 () ValueCell!2920)

