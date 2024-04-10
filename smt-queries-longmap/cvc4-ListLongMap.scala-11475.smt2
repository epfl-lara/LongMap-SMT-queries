; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133652 () Bool)

(assert start!133652)

(declare-fun b!1562724 () Bool)

(declare-fun e!870852 () Bool)

(declare-fun tp_is_empty!38735 () Bool)

(assert (=> b!1562724 (= e!870852 tp_is_empty!38735)))

(declare-fun b!1562725 () Bool)

(declare-fun e!870851 () Bool)

(declare-fun e!870849 () Bool)

(declare-fun mapRes!59478 () Bool)

(assert (=> b!1562725 (= e!870851 (and e!870849 mapRes!59478))))

(declare-fun condMapEmpty!59478 () Bool)

(declare-datatypes ((V!59853 0))(
  ( (V!59854 (val!19451 Int)) )
))
(declare-datatypes ((ValueCell!18337 0))(
  ( (ValueCellFull!18337 (v!22203 V!59853)) (EmptyCell!18337) )
))
(declare-datatypes ((array!104184 0))(
  ( (array!104185 (arr!50284 (Array (_ BitVec 32) ValueCell!18337)) (size!50834 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104184)

(declare-fun mapDefault!59478 () ValueCell!18337)

