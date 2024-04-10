; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20836 () Bool)

(assert start!20836)

(declare-fun b_free!5489 () Bool)

(declare-fun b_next!5489 () Bool)

(assert (=> start!20836 (= b_free!5489 (not b_next!5489))))

(declare-fun tp!19508 () Bool)

(declare-fun b_and!12235 () Bool)

(assert (=> start!20836 (= tp!19508 b_and!12235)))

(declare-fun mapNonEmpty!9095 () Bool)

(declare-fun mapRes!9095 () Bool)

(declare-fun tp!19507 () Bool)

(declare-fun e!136225 () Bool)

(assert (=> mapNonEmpty!9095 (= mapRes!9095 (and tp!19507 e!136225))))

(declare-datatypes ((V!6781 0))(
  ( (V!6782 (val!2720 Int)) )
))
(declare-datatypes ((ValueCell!2332 0))(
  ( (ValueCellFull!2332 (v!4690 V!6781)) (EmptyCell!2332) )
))
(declare-fun mapValue!9095 () ValueCell!2332)

(declare-datatypes ((array!9905 0))(
  ( (array!9906 (arr!4703 (Array (_ BitVec 32) ValueCell!2332)) (size!5028 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9905)

(declare-fun mapRest!9095 () (Array (_ BitVec 32) ValueCell!2332))

(declare-fun mapKey!9095 () (_ BitVec 32))

(assert (=> mapNonEmpty!9095 (= (arr!4703 _values!649) (store mapRest!9095 mapKey!9095 mapValue!9095))))

(declare-fun b!209000 () Bool)

(declare-fun e!136226 () Bool)

(declare-fun e!136227 () Bool)

(assert (=> b!209000 (= e!136226 (and e!136227 mapRes!9095))))

(declare-fun condMapEmpty!9095 () Bool)

(declare-fun mapDefault!9095 () ValueCell!2332)

