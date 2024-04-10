; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133360 () Bool)

(assert start!133360)

(declare-fun b!1559290 () Bool)

(declare-fun res!1066315 () Bool)

(declare-fun e!868804 () Bool)

(assert (=> b!1559290 (=> (not res!1066315) (not e!868804))))

(declare-datatypes ((array!103668 0))(
  ( (array!103669 (arr!50029 (Array (_ BitVec 32) (_ BitVec 64))) (size!50579 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103668)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103668 (_ BitVec 32)) Bool)

(assert (=> b!1559290 (= res!1066315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559291 () Bool)

(declare-fun e!868802 () Bool)

(declare-fun tp_is_empty!38473 () Bool)

(assert (=> b!1559291 (= e!868802 tp_is_empty!38473)))

(declare-fun b!1559292 () Bool)

(declare-fun e!868803 () Bool)

(assert (=> b!1559292 (= e!868803 tp_is_empty!38473)))

(declare-fun b!1559293 () Bool)

(declare-fun e!868801 () Bool)

(declare-fun mapRes!59076 () Bool)

(assert (=> b!1559293 (= e!868801 (and e!868803 mapRes!59076))))

(declare-fun condMapEmpty!59076 () Bool)

(declare-datatypes ((V!59505 0))(
  ( (V!59506 (val!19320 Int)) )
))
(declare-datatypes ((ValueCell!18206 0))(
  ( (ValueCellFull!18206 (v!22071 V!59505)) (EmptyCell!18206) )
))
(declare-datatypes ((array!103670 0))(
  ( (array!103671 (arr!50030 (Array (_ BitVec 32) ValueCell!18206)) (size!50580 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103670)

(declare-fun mapDefault!59076 () ValueCell!18206)

