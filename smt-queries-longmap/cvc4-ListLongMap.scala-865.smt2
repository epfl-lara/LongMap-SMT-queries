; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20290 () Bool)

(assert start!20290)

(declare-fun b_free!4949 () Bool)

(declare-fun b_next!4949 () Bool)

(assert (=> start!20290 (= b_free!4949 (not b_next!4949))))

(declare-fun tp!17878 () Bool)

(declare-fun b_and!11695 () Bool)

(assert (=> start!20290 (= tp!17878 b_and!11695)))

(declare-fun b!199784 () Bool)

(declare-fun e!131098 () Bool)

(declare-fun tp_is_empty!4805 () Bool)

(assert (=> b!199784 (= e!131098 tp_is_empty!4805)))

(declare-fun b!199785 () Bool)

(declare-fun e!131097 () Bool)

(declare-fun mapRes!8276 () Bool)

(assert (=> b!199785 (= e!131097 (and e!131098 mapRes!8276))))

(declare-fun condMapEmpty!8276 () Bool)

(declare-datatypes ((V!6053 0))(
  ( (V!6054 (val!2447 Int)) )
))
(declare-datatypes ((ValueCell!2059 0))(
  ( (ValueCellFull!2059 (v!4417 V!6053)) (EmptyCell!2059) )
))
(declare-datatypes ((array!8849 0))(
  ( (array!8850 (arr!4175 (Array (_ BitVec 32) ValueCell!2059)) (size!4500 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8849)

(declare-fun mapDefault!8276 () ValueCell!2059)

