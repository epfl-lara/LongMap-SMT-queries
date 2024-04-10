; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77828 () Bool)

(assert start!77828)

(declare-fun b_free!16387 () Bool)

(declare-fun b_next!16387 () Bool)

(assert (=> start!77828 (= b_free!16387 (not b_next!16387))))

(declare-fun tp!57426 () Bool)

(declare-fun b_and!26931 () Bool)

(assert (=> start!77828 (= tp!57426 b_and!26931)))

(declare-fun b!908596 () Bool)

(declare-fun e!509242 () Bool)

(declare-fun tp_is_empty!18805 () Bool)

(assert (=> b!908596 (= e!509242 tp_is_empty!18805)))

(declare-fun b!908597 () Bool)

(declare-fun e!509246 () Bool)

(declare-fun e!509240 () Bool)

(declare-fun mapRes!29923 () Bool)

(assert (=> b!908597 (= e!509246 (and e!509240 mapRes!29923))))

(declare-fun condMapEmpty!29923 () Bool)

(declare-datatypes ((V!30039 0))(
  ( (V!30040 (val!9453 Int)) )
))
(declare-datatypes ((ValueCell!8921 0))(
  ( (ValueCellFull!8921 (v!11960 V!30039)) (EmptyCell!8921) )
))
(declare-datatypes ((array!53642 0))(
  ( (array!53643 (arr!25779 (Array (_ BitVec 32) ValueCell!8921)) (size!26238 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53642)

(declare-fun mapDefault!29923 () ValueCell!8921)

