; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16636 () Bool)

(assert start!16636)

(declare-fun b!166166 () Bool)

(declare-fun b_free!3941 () Bool)

(declare-fun b_next!3941 () Bool)

(assert (=> b!166166 (= b_free!3941 (not b_next!3941))))

(declare-fun tp!14423 () Bool)

(declare-fun b_and!10355 () Bool)

(assert (=> b!166166 (= tp!14423 b_and!10355)))

(declare-fun b!166163 () Bool)

(declare-fun e!108983 () Bool)

(declare-fun e!108987 () Bool)

(declare-fun mapRes!6333 () Bool)

(assert (=> b!166163 (= e!108983 (and e!108987 mapRes!6333))))

(declare-fun condMapEmpty!6333 () Bool)

(declare-datatypes ((V!4637 0))(
  ( (V!4638 (val!1916 Int)) )
))
(declare-datatypes ((ValueCell!1528 0))(
  ( (ValueCellFull!1528 (v!3781 V!4637)) (EmptyCell!1528) )
))
(declare-datatypes ((array!6583 0))(
  ( (array!6584 (arr!3127 (Array (_ BitVec 32) (_ BitVec 64))) (size!3415 (_ BitVec 32))) )
))
(declare-datatypes ((array!6585 0))(
  ( (array!6586 (arr!3128 (Array (_ BitVec 32) ValueCell!1528)) (size!3416 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1964 0))(
  ( (LongMapFixedSize!1965 (defaultEntry!3424 Int) (mask!8149 (_ BitVec 32)) (extraKeys!3165 (_ BitVec 32)) (zeroValue!3267 V!4637) (minValue!3267 V!4637) (_size!1031 (_ BitVec 32)) (_keys!5249 array!6583) (_values!3407 array!6585) (_vacant!1031 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1964)

(declare-fun mapDefault!6333 () ValueCell!1528)

