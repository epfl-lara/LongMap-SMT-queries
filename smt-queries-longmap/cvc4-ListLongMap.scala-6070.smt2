; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78532 () Bool)

(assert start!78532)

(declare-fun res!617230 () Bool)

(declare-fun e!513809 () Bool)

(assert (=> start!78532 (=> (not res!617230) (not e!513809))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78532 (= res!617230 (validMask!0 mask!1881))))

(assert (=> start!78532 e!513809))

(assert (=> start!78532 true))

(declare-datatypes ((V!30635 0))(
  ( (V!30636 (val!9677 Int)) )
))
(declare-datatypes ((ValueCell!9145 0))(
  ( (ValueCellFull!9145 (v!12195 V!30635)) (EmptyCell!9145) )
))
(declare-datatypes ((array!54502 0))(
  ( (array!54503 (arr!26196 (Array (_ BitVec 32) ValueCell!9145)) (size!26655 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54502)

(declare-fun e!513811 () Bool)

(declare-fun array_inv!20448 (array!54502) Bool)

(assert (=> start!78532 (and (array_inv!20448 _values!1231) e!513811)))

(declare-datatypes ((array!54504 0))(
  ( (array!54505 (arr!26197 (Array (_ BitVec 32) (_ BitVec 64))) (size!26656 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54504)

(declare-fun array_inv!20449 (array!54504) Bool)

(assert (=> start!78532 (array_inv!20449 _keys!1487)))

(declare-fun b!915480 () Bool)

(assert (=> b!915480 (= e!513809 false)))

(declare-fun lt!411679 () Bool)

(declare-datatypes ((List!18374 0))(
  ( (Nil!18371) (Cons!18370 (h!19516 (_ BitVec 64)) (t!25987 List!18374)) )
))
(declare-fun arrayNoDuplicates!0 (array!54504 (_ BitVec 32) List!18374) Bool)

(assert (=> b!915480 (= lt!411679 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18371))))

(declare-fun mapNonEmpty!30636 () Bool)

(declare-fun mapRes!30636 () Bool)

(declare-fun tp!58703 () Bool)

(declare-fun e!513807 () Bool)

(assert (=> mapNonEmpty!30636 (= mapRes!30636 (and tp!58703 e!513807))))

(declare-fun mapKey!30636 () (_ BitVec 32))

(declare-fun mapRest!30636 () (Array (_ BitVec 32) ValueCell!9145))

(declare-fun mapValue!30636 () ValueCell!9145)

(assert (=> mapNonEmpty!30636 (= (arr!26196 _values!1231) (store mapRest!30636 mapKey!30636 mapValue!30636))))

(declare-fun b!915481 () Bool)

(declare-fun res!617229 () Bool)

(assert (=> b!915481 (=> (not res!617229) (not e!513809))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915481 (= res!617229 (and (= (size!26655 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26656 _keys!1487) (size!26655 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30636 () Bool)

(assert (=> mapIsEmpty!30636 mapRes!30636))

(declare-fun b!915482 () Bool)

(declare-fun e!513808 () Bool)

(declare-fun tp_is_empty!19253 () Bool)

(assert (=> b!915482 (= e!513808 tp_is_empty!19253)))

(declare-fun b!915483 () Bool)

(assert (=> b!915483 (= e!513811 (and e!513808 mapRes!30636))))

(declare-fun condMapEmpty!30636 () Bool)

(declare-fun mapDefault!30636 () ValueCell!9145)

