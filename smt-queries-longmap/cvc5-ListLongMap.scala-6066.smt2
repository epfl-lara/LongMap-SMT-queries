; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78504 () Bool)

(assert start!78504)

(declare-fun b!915228 () Bool)

(declare-fun res!617103 () Bool)

(declare-fun e!513598 () Bool)

(assert (=> b!915228 (=> (not res!617103) (not e!513598))))

(declare-datatypes ((array!54448 0))(
  ( (array!54449 (arr!26169 (Array (_ BitVec 32) (_ BitVec 64))) (size!26628 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54448)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54448 (_ BitVec 32)) Bool)

(assert (=> b!915228 (= res!617103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915229 () Bool)

(declare-fun e!513601 () Bool)

(declare-fun tp_is_empty!19225 () Bool)

(assert (=> b!915229 (= e!513601 tp_is_empty!19225)))

(declare-fun mapNonEmpty!30594 () Bool)

(declare-fun mapRes!30594 () Bool)

(declare-fun tp!58661 () Bool)

(assert (=> mapNonEmpty!30594 (= mapRes!30594 (and tp!58661 e!513601))))

(declare-datatypes ((V!30599 0))(
  ( (V!30600 (val!9663 Int)) )
))
(declare-datatypes ((ValueCell!9131 0))(
  ( (ValueCellFull!9131 (v!12181 V!30599)) (EmptyCell!9131) )
))
(declare-fun mapRest!30594 () (Array (_ BitVec 32) ValueCell!9131))

(declare-fun mapValue!30594 () ValueCell!9131)

(declare-datatypes ((array!54450 0))(
  ( (array!54451 (arr!26170 (Array (_ BitVec 32) ValueCell!9131)) (size!26629 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54450)

(declare-fun mapKey!30594 () (_ BitVec 32))

(assert (=> mapNonEmpty!30594 (= (arr!26170 _values!1231) (store mapRest!30594 mapKey!30594 mapValue!30594))))

(declare-fun mapIsEmpty!30594 () Bool)

(assert (=> mapIsEmpty!30594 mapRes!30594))

(declare-fun b!915231 () Bool)

(declare-fun res!617102 () Bool)

(assert (=> b!915231 (=> (not res!617102) (not e!513598))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915231 (= res!617102 (and (= (size!26629 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26628 _keys!1487) (size!26629 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915232 () Bool)

(declare-fun e!513597 () Bool)

(declare-fun e!513600 () Bool)

(assert (=> b!915232 (= e!513597 (and e!513600 mapRes!30594))))

(declare-fun condMapEmpty!30594 () Bool)

(declare-fun mapDefault!30594 () ValueCell!9131)

