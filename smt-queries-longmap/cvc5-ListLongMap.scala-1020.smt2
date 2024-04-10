; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21720 () Bool)

(assert start!21720)

(declare-fun b!218360 () Bool)

(declare-fun b_free!5869 () Bool)

(declare-fun b_next!5869 () Bool)

(assert (=> b!218360 (= b_free!5869 (not b_next!5869))))

(declare-fun tp!20742 () Bool)

(declare-fun b_and!12759 () Bool)

(assert (=> b!218360 (= tp!20742 b_and!12759)))

(declare-fun b!218350 () Bool)

(declare-fun e!142037 () Bool)

(declare-fun e!142035 () Bool)

(declare-fun mapRes!9759 () Bool)

(assert (=> b!218350 (= e!142037 (and e!142035 mapRes!9759))))

(declare-fun condMapEmpty!9759 () Bool)

(declare-datatypes ((V!7289 0))(
  ( (V!7290 (val!2910 Int)) )
))
(declare-datatypes ((ValueCell!2522 0))(
  ( (ValueCellFull!2522 (v!4928 V!7289)) (EmptyCell!2522) )
))
(declare-datatypes ((array!10701 0))(
  ( (array!10702 (arr!5072 (Array (_ BitVec 32) ValueCell!2522)) (size!5404 (_ BitVec 32))) )
))
(declare-datatypes ((array!10703 0))(
  ( (array!10704 (arr!5073 (Array (_ BitVec 32) (_ BitVec 64))) (size!5405 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2944 0))(
  ( (LongMapFixedSize!2945 (defaultEntry!4122 Int) (mask!9897 (_ BitVec 32)) (extraKeys!3859 (_ BitVec 32)) (zeroValue!3963 V!7289) (minValue!3963 V!7289) (_size!1521 (_ BitVec 32)) (_keys!6171 array!10703) (_values!4105 array!10701) (_vacant!1521 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2944)

(declare-fun mapDefault!9759 () ValueCell!2522)

