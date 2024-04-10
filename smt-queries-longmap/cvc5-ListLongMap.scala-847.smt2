; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20178 () Bool)

(assert start!20178)

(declare-fun b_free!4837 () Bool)

(declare-fun b_next!4837 () Bool)

(assert (=> start!20178 (= b_free!4837 (not b_next!4837))))

(declare-fun tp!17542 () Bool)

(declare-fun b_and!11583 () Bool)

(assert (=> start!20178 (= tp!17542 b_and!11583)))

(declare-fun b!198104 () Bool)

(declare-fun e!130258 () Bool)

(declare-fun tp_is_empty!4693 () Bool)

(assert (=> b!198104 (= e!130258 tp_is_empty!4693)))

(declare-fun b!198105 () Bool)

(declare-fun e!130259 () Bool)

(declare-fun e!130257 () Bool)

(declare-fun mapRes!8108 () Bool)

(assert (=> b!198105 (= e!130259 (and e!130257 mapRes!8108))))

(declare-fun condMapEmpty!8108 () Bool)

(declare-datatypes ((V!5905 0))(
  ( (V!5906 (val!2391 Int)) )
))
(declare-datatypes ((ValueCell!2003 0))(
  ( (ValueCellFull!2003 (v!4361 V!5905)) (EmptyCell!2003) )
))
(declare-datatypes ((array!8637 0))(
  ( (array!8638 (arr!4069 (Array (_ BitVec 32) ValueCell!2003)) (size!4394 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8637)

(declare-fun mapDefault!8108 () ValueCell!2003)

