; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133516 () Bool)

(assert start!133516)

(declare-fun mapNonEmpty!59274 () Bool)

(declare-fun mapRes!59274 () Bool)

(declare-fun tp!112929 () Bool)

(declare-fun e!869822 () Bool)

(assert (=> mapNonEmpty!59274 (= mapRes!59274 (and tp!112929 e!869822))))

(declare-datatypes ((V!59673 0))(
  ( (V!59674 (val!19383 Int)) )
))
(declare-datatypes ((ValueCell!18269 0))(
  ( (ValueCellFull!18269 (v!22135 V!59673)) (EmptyCell!18269) )
))
(declare-fun mapValue!59274 () ValueCell!18269)

(declare-datatypes ((array!103916 0))(
  ( (array!103917 (arr!50150 (Array (_ BitVec 32) ValueCell!18269)) (size!50700 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103916)

(declare-fun mapRest!59274 () (Array (_ BitVec 32) ValueCell!18269))

(declare-fun mapKey!59274 () (_ BitVec 32))

(assert (=> mapNonEmpty!59274 (= (arr!50150 _values!487) (store mapRest!59274 mapKey!59274 mapValue!59274))))

(declare-fun res!1067231 () Bool)

(declare-fun e!869824 () Bool)

(assert (=> start!133516 (=> (not res!1067231) (not e!869824))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133516 (= res!1067231 (validMask!0 mask!947))))

(assert (=> start!133516 e!869824))

(assert (=> start!133516 true))

(declare-datatypes ((array!103918 0))(
  ( (array!103919 (arr!50151 (Array (_ BitVec 32) (_ BitVec 64))) (size!50701 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103918)

(declare-fun array_inv!38985 (array!103918) Bool)

(assert (=> start!133516 (array_inv!38985 _keys!637)))

(declare-fun e!869820 () Bool)

(declare-fun array_inv!38986 (array!103916) Bool)

(assert (=> start!133516 (and (array_inv!38986 _values!487) e!869820)))

(declare-fun b!1560816 () Bool)

(declare-fun res!1067233 () Bool)

(assert (=> b!1560816 (=> (not res!1067233) (not e!869824))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560816 (= res!1067233 (and (= (size!50700 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50701 _keys!637) (size!50700 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560817 () Bool)

(declare-fun e!869823 () Bool)

(assert (=> b!1560817 (= e!869820 (and e!869823 mapRes!59274))))

(declare-fun condMapEmpty!59274 () Bool)

(declare-fun mapDefault!59274 () ValueCell!18269)

