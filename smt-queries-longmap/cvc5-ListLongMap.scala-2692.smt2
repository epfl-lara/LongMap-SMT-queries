; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39970 () Bool)

(assert start!39970)

(declare-fun b_free!10237 () Bool)

(declare-fun b_next!10237 () Bool)

(assert (=> start!39970 (= b_free!10237 (not b_next!10237))))

(declare-fun tp!36240 () Bool)

(declare-fun b_and!18133 () Bool)

(assert (=> start!39970 (= tp!36240 b_and!18133)))

(declare-fun b!434548 () Bool)

(declare-fun e!256819 () Bool)

(declare-fun tp_is_empty!11389 () Bool)

(assert (=> b!434548 (= e!256819 tp_is_empty!11389)))

(declare-fun b!434549 () Bool)

(declare-fun e!256820 () Bool)

(declare-fun e!256813 () Bool)

(declare-fun mapRes!18705 () Bool)

(assert (=> b!434549 (= e!256820 (and e!256813 mapRes!18705))))

(declare-fun condMapEmpty!18705 () Bool)

(declare-datatypes ((V!16291 0))(
  ( (V!16292 (val!5739 Int)) )
))
(declare-datatypes ((ValueCell!5351 0))(
  ( (ValueCellFull!5351 (v!7986 V!16291)) (EmptyCell!5351) )
))
(declare-datatypes ((array!26611 0))(
  ( (array!26612 (arr!12755 (Array (_ BitVec 32) ValueCell!5351)) (size!13107 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26611)

(declare-fun mapDefault!18705 () ValueCell!5351)

