; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133418 () Bool)

(assert start!133418)

(declare-fun res!1066880 () Bool)

(declare-fun e!869262 () Bool)

(assert (=> start!133418 (=> (not res!1066880) (not e!869262))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133418 (= res!1066880 (validMask!0 mask!947))))

(assert (=> start!133418 e!869262))

(assert (=> start!133418 true))

(declare-datatypes ((V!59609 0))(
  ( (V!59610 (val!19359 Int)) )
))
(declare-datatypes ((ValueCell!18245 0))(
  ( (ValueCellFull!18245 (v!22107 V!59609)) (EmptyCell!18245) )
))
(declare-datatypes ((array!103744 0))(
  ( (array!103745 (arr!50065 (Array (_ BitVec 32) ValueCell!18245)) (size!50617 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103744)

(declare-fun e!869266 () Bool)

(declare-fun array_inv!39117 (array!103744) Bool)

(assert (=> start!133418 (and (array_inv!39117 _values!487) e!869266)))

(declare-datatypes ((array!103746 0))(
  ( (array!103747 (arr!50066 (Array (_ BitVec 32) (_ BitVec 64))) (size!50618 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103746)

(declare-fun array_inv!39118 (array!103746) Bool)

(assert (=> start!133418 (array_inv!39118 _keys!637)))

(declare-fun b!1560065 () Bool)

(assert (=> b!1560065 (= e!869262 false)))

(declare-fun lt!670697 () Bool)

(declare-datatypes ((List!36433 0))(
  ( (Nil!36430) (Cons!36429 (h!37876 (_ BitVec 64)) (t!51158 List!36433)) )
))
(declare-fun arrayNoDuplicates!0 (array!103746 (_ BitVec 32) List!36433) Bool)

(assert (=> b!1560065 (= lt!670697 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36430))))

(declare-fun b!1560066 () Bool)

(declare-fun e!869263 () Bool)

(declare-fun tp_is_empty!38551 () Bool)

(assert (=> b!1560066 (= e!869263 tp_is_empty!38551)))

(declare-fun mapIsEmpty!59202 () Bool)

(declare-fun mapRes!59202 () Bool)

(assert (=> mapIsEmpty!59202 mapRes!59202))

(declare-fun b!1560067 () Bool)

(declare-fun e!869265 () Bool)

(assert (=> b!1560067 (= e!869265 tp_is_empty!38551)))

(declare-fun b!1560068 () Bool)

(assert (=> b!1560068 (= e!869266 (and e!869265 mapRes!59202))))

(declare-fun condMapEmpty!59202 () Bool)

(declare-fun mapDefault!59202 () ValueCell!18245)

(assert (=> b!1560068 (= condMapEmpty!59202 (= (arr!50065 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18245)) mapDefault!59202)))))

(declare-fun b!1560069 () Bool)

(declare-fun res!1066881 () Bool)

(assert (=> b!1560069 (=> (not res!1066881) (not e!869262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103746 (_ BitVec 32)) Bool)

(assert (=> b!1560069 (= res!1066881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560070 () Bool)

(declare-fun res!1066879 () Bool)

(assert (=> b!1560070 (=> (not res!1066879) (not e!869262))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560070 (= res!1066879 (and (= (size!50617 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50618 _keys!637) (size!50617 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59202 () Bool)

(declare-fun tp!112858 () Bool)

(assert (=> mapNonEmpty!59202 (= mapRes!59202 (and tp!112858 e!869263))))

(declare-fun mapKey!59202 () (_ BitVec 32))

(declare-fun mapRest!59202 () (Array (_ BitVec 32) ValueCell!18245))

(declare-fun mapValue!59202 () ValueCell!18245)

(assert (=> mapNonEmpty!59202 (= (arr!50065 _values!487) (store mapRest!59202 mapKey!59202 mapValue!59202))))

(assert (= (and start!133418 res!1066880) b!1560070))

(assert (= (and b!1560070 res!1066879) b!1560069))

(assert (= (and b!1560069 res!1066881) b!1560065))

(assert (= (and b!1560068 condMapEmpty!59202) mapIsEmpty!59202))

(assert (= (and b!1560068 (not condMapEmpty!59202)) mapNonEmpty!59202))

(get-info :version)

(assert (= (and mapNonEmpty!59202 ((_ is ValueCellFull!18245) mapValue!59202)) b!1560066))

(assert (= (and b!1560068 ((_ is ValueCellFull!18245) mapDefault!59202)) b!1560067))

(assert (= start!133418 b!1560068))

(declare-fun m!1435353 () Bool)

(assert (=> start!133418 m!1435353))

(declare-fun m!1435355 () Bool)

(assert (=> start!133418 m!1435355))

(declare-fun m!1435357 () Bool)

(assert (=> start!133418 m!1435357))

(declare-fun m!1435359 () Bool)

(assert (=> b!1560065 m!1435359))

(declare-fun m!1435361 () Bool)

(assert (=> b!1560069 m!1435361))

(declare-fun m!1435363 () Bool)

(assert (=> mapNonEmpty!59202 m!1435363))

(check-sat (not mapNonEmpty!59202) (not start!133418) (not b!1560065) tp_is_empty!38551 (not b!1560069))
(check-sat)
