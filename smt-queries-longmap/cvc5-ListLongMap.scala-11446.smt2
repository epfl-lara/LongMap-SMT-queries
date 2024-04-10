; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133474 () Bool)

(assert start!133474)

(declare-fun mapIsEmpty!59211 () Bool)

(declare-fun mapRes!59211 () Bool)

(assert (=> mapIsEmpty!59211 mapRes!59211))

(declare-fun b!1560432 () Bool)

(declare-fun res!1067037 () Bool)

(declare-fun e!869508 () Bool)

(assert (=> b!1560432 (=> (not res!1067037) (not e!869508))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103838 0))(
  ( (array!103839 (arr!50111 (Array (_ BitVec 32) (_ BitVec 64))) (size!50661 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103838)

(declare-datatypes ((V!59617 0))(
  ( (V!59618 (val!19362 Int)) )
))
(declare-datatypes ((ValueCell!18248 0))(
  ( (ValueCellFull!18248 (v!22114 V!59617)) (EmptyCell!18248) )
))
(declare-datatypes ((array!103840 0))(
  ( (array!103841 (arr!50112 (Array (_ BitVec 32) ValueCell!18248)) (size!50662 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103840)

(assert (=> b!1560432 (= res!1067037 (and (= (size!50662 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50661 _keys!637) (size!50662 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067035 () Bool)

(assert (=> start!133474 (=> (not res!1067035) (not e!869508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133474 (= res!1067035 (validMask!0 mask!947))))

(assert (=> start!133474 e!869508))

(assert (=> start!133474 true))

(declare-fun e!869509 () Bool)

(declare-fun array_inv!38953 (array!103840) Bool)

(assert (=> start!133474 (and (array_inv!38953 _values!487) e!869509)))

(declare-fun array_inv!38954 (array!103838) Bool)

(assert (=> start!133474 (array_inv!38954 _keys!637)))

(declare-fun b!1560433 () Bool)

(declare-fun e!869507 () Bool)

(declare-fun tp_is_empty!38557 () Bool)

(assert (=> b!1560433 (= e!869507 tp_is_empty!38557)))

(declare-fun b!1560434 () Bool)

(declare-fun res!1067036 () Bool)

(assert (=> b!1560434 (=> (not res!1067036) (not e!869508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103838 (_ BitVec 32)) Bool)

(assert (=> b!1560434 (= res!1067036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59211 () Bool)

(declare-fun tp!112866 () Bool)

(declare-fun e!869506 () Bool)

(assert (=> mapNonEmpty!59211 (= mapRes!59211 (and tp!112866 e!869506))))

(declare-fun mapRest!59211 () (Array (_ BitVec 32) ValueCell!18248))

(declare-fun mapKey!59211 () (_ BitVec 32))

(declare-fun mapValue!59211 () ValueCell!18248)

(assert (=> mapNonEmpty!59211 (= (arr!50112 _values!487) (store mapRest!59211 mapKey!59211 mapValue!59211))))

(declare-fun b!1560435 () Bool)

(assert (=> b!1560435 (= e!869509 (and e!869507 mapRes!59211))))

(declare-fun condMapEmpty!59211 () Bool)

(declare-fun mapDefault!59211 () ValueCell!18248)

