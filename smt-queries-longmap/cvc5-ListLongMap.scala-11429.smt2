; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133328 () Bool)

(assert start!133328)

(declare-fun b!1559132 () Bool)

(declare-fun e!868645 () Bool)

(declare-fun tp_is_empty!38455 () Bool)

(assert (=> b!1559132 (= e!868645 tp_is_empty!38455)))

(declare-fun res!1066258 () Bool)

(declare-fun e!868647 () Bool)

(assert (=> start!133328 (=> (not res!1066258) (not e!868647))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133328 (= res!1066258 (validMask!0 mask!947))))

(assert (=> start!133328 e!868647))

(assert (=> start!133328 true))

(declare-datatypes ((V!59481 0))(
  ( (V!59482 (val!19311 Int)) )
))
(declare-datatypes ((ValueCell!18197 0))(
  ( (ValueCellFull!18197 (v!22062 V!59481)) (EmptyCell!18197) )
))
(declare-datatypes ((array!103634 0))(
  ( (array!103635 (arr!50014 (Array (_ BitVec 32) ValueCell!18197)) (size!50564 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103634)

(declare-fun e!868646 () Bool)

(declare-fun array_inv!38879 (array!103634) Bool)

(assert (=> start!133328 (and (array_inv!38879 _values!487) e!868646)))

(declare-datatypes ((array!103636 0))(
  ( (array!103637 (arr!50015 (Array (_ BitVec 32) (_ BitVec 64))) (size!50565 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103636)

(declare-fun array_inv!38880 (array!103636) Bool)

(assert (=> start!133328 (array_inv!38880 _keys!637)))

(declare-fun b!1559133 () Bool)

(declare-fun e!868648 () Bool)

(assert (=> b!1559133 (= e!868648 tp_is_empty!38455)))

(declare-fun mapIsEmpty!59043 () Bool)

(declare-fun mapRes!59043 () Bool)

(assert (=> mapIsEmpty!59043 mapRes!59043))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun b!1559134 () Bool)

(assert (=> b!1559134 (= e!868647 (and (= (size!50564 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50565 _keys!637) (size!50564 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (not (= (size!50565 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)))))))

(declare-fun b!1559135 () Bool)

(assert (=> b!1559135 (= e!868646 (and e!868645 mapRes!59043))))

(declare-fun condMapEmpty!59043 () Bool)

(declare-fun mapDefault!59043 () ValueCell!18197)

