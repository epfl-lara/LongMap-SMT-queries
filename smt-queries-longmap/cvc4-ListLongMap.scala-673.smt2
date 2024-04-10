; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16546 () Bool)

(assert start!16546)

(declare-fun b!164681 () Bool)

(declare-fun b_free!3851 () Bool)

(declare-fun b_next!3851 () Bool)

(assert (=> b!164681 (= b_free!3851 (not b_next!3851))))

(declare-fun tp!14153 () Bool)

(declare-fun b_and!10265 () Bool)

(assert (=> b!164681 (= tp!14153 b_and!10265)))

(declare-fun b!164678 () Bool)

(declare-fun e!108044 () Bool)

(declare-fun e!108039 () Bool)

(declare-fun mapRes!6198 () Bool)

(assert (=> b!164678 (= e!108044 (and e!108039 mapRes!6198))))

(declare-fun condMapEmpty!6198 () Bool)

(declare-datatypes ((V!4517 0))(
  ( (V!4518 (val!1871 Int)) )
))
(declare-datatypes ((ValueCell!1483 0))(
  ( (ValueCellFull!1483 (v!3736 V!4517)) (EmptyCell!1483) )
))
(declare-datatypes ((array!6403 0))(
  ( (array!6404 (arr!3037 (Array (_ BitVec 32) (_ BitVec 64))) (size!3325 (_ BitVec 32))) )
))
(declare-datatypes ((array!6405 0))(
  ( (array!6406 (arr!3038 (Array (_ BitVec 32) ValueCell!1483)) (size!3326 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1874 0))(
  ( (LongMapFixedSize!1875 (defaultEntry!3379 Int) (mask!8074 (_ BitVec 32)) (extraKeys!3120 (_ BitVec 32)) (zeroValue!3222 V!4517) (minValue!3222 V!4517) (_size!986 (_ BitVec 32)) (_keys!5204 array!6403) (_values!3362 array!6405) (_vacant!986 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1874)

(declare-fun mapDefault!6198 () ValueCell!1483)

