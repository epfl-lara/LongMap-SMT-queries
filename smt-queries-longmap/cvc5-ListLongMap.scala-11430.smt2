; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133334 () Bool)

(assert start!133334)

(declare-fun res!1066267 () Bool)

(declare-fun e!868694 () Bool)

(assert (=> start!133334 (=> (not res!1066267) (not e!868694))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133334 (= res!1066267 (validMask!0 mask!947))))

(assert (=> start!133334 e!868694))

(assert (=> start!133334 true))

(declare-datatypes ((V!59489 0))(
  ( (V!59490 (val!19314 Int)) )
))
(declare-datatypes ((ValueCell!18200 0))(
  ( (ValueCellFull!18200 (v!22065 V!59489)) (EmptyCell!18200) )
))
(declare-datatypes ((array!103644 0))(
  ( (array!103645 (arr!50019 (Array (_ BitVec 32) ValueCell!18200)) (size!50569 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103644)

(declare-fun e!868693 () Bool)

(declare-fun array_inv!38883 (array!103644) Bool)

(assert (=> start!133334 (and (array_inv!38883 _values!487) e!868693)))

(declare-datatypes ((array!103646 0))(
  ( (array!103647 (arr!50020 (Array (_ BitVec 32) (_ BitVec 64))) (size!50570 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103646)

(declare-fun array_inv!38884 (array!103646) Bool)

(assert (=> start!133334 (array_inv!38884 _keys!637)))

(declare-fun b!1559168 () Bool)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559168 (= e!868694 (and (= (size!50569 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50570 _keys!637) (size!50569 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (= (size!50570 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)) (bvsgt #b00000000000000000000000000000000 (size!50570 _keys!637))))))

(declare-fun b!1559169 () Bool)

(declare-fun e!868690 () Bool)

(declare-fun tp_is_empty!38461 () Bool)

(assert (=> b!1559169 (= e!868690 tp_is_empty!38461)))

(declare-fun b!1559170 () Bool)

(declare-fun e!868691 () Bool)

(assert (=> b!1559170 (= e!868691 tp_is_empty!38461)))

(declare-fun mapNonEmpty!59052 () Bool)

(declare-fun mapRes!59052 () Bool)

(declare-fun tp!112707 () Bool)

(assert (=> mapNonEmpty!59052 (= mapRes!59052 (and tp!112707 e!868690))))

(declare-fun mapValue!59052 () ValueCell!18200)

(declare-fun mapKey!59052 () (_ BitVec 32))

(declare-fun mapRest!59052 () (Array (_ BitVec 32) ValueCell!18200))

(assert (=> mapNonEmpty!59052 (= (arr!50019 _values!487) (store mapRest!59052 mapKey!59052 mapValue!59052))))

(declare-fun b!1559171 () Bool)

(assert (=> b!1559171 (= e!868693 (and e!868691 mapRes!59052))))

(declare-fun condMapEmpty!59052 () Bool)

(declare-fun mapDefault!59052 () ValueCell!18200)

