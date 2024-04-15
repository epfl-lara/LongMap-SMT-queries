; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133436 () Bool)

(assert start!133436)

(declare-fun b!1560227 () Bool)

(declare-fun res!1066961 () Bool)

(declare-fun e!869401 () Bool)

(assert (=> b!1560227 (=> (not res!1066961) (not e!869401))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59633 0))(
  ( (V!59634 (val!19368 Int)) )
))
(declare-datatypes ((ValueCell!18254 0))(
  ( (ValueCellFull!18254 (v!22116 V!59633)) (EmptyCell!18254) )
))
(declare-datatypes ((array!103780 0))(
  ( (array!103781 (arr!50083 (Array (_ BitVec 32) ValueCell!18254)) (size!50635 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103780)

(declare-datatypes ((array!103782 0))(
  ( (array!103783 (arr!50084 (Array (_ BitVec 32) (_ BitVec 64))) (size!50636 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103782)

(assert (=> b!1560227 (= res!1066961 (and (= (size!50635 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50636 _keys!637) (size!50635 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560228 () Bool)

(declare-fun res!1066960 () Bool)

(assert (=> b!1560228 (=> (not res!1066960) (not e!869401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103782 (_ BitVec 32)) Bool)

(assert (=> b!1560228 (= res!1066960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59229 () Bool)

(declare-fun mapRes!59229 () Bool)

(assert (=> mapIsEmpty!59229 mapRes!59229))

(declare-fun b!1560230 () Bool)

(assert (=> b!1560230 (= e!869401 false)))

(declare-fun lt!670724 () Bool)

(declare-datatypes ((List!36440 0))(
  ( (Nil!36437) (Cons!36436 (h!37883 (_ BitVec 64)) (t!51165 List!36440)) )
))
(declare-fun arrayNoDuplicates!0 (array!103782 (_ BitVec 32) List!36440) Bool)

(assert (=> b!1560230 (= lt!670724 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36437))))

(declare-fun b!1560231 () Bool)

(declare-fun e!869399 () Bool)

(declare-fun e!869397 () Bool)

(assert (=> b!1560231 (= e!869399 (and e!869397 mapRes!59229))))

(declare-fun condMapEmpty!59229 () Bool)

(declare-fun mapDefault!59229 () ValueCell!18254)

(assert (=> b!1560231 (= condMapEmpty!59229 (= (arr!50083 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18254)) mapDefault!59229)))))

(declare-fun b!1560229 () Bool)

(declare-fun tp_is_empty!38569 () Bool)

(assert (=> b!1560229 (= e!869397 tp_is_empty!38569)))

(declare-fun res!1066962 () Bool)

(assert (=> start!133436 (=> (not res!1066962) (not e!869401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133436 (= res!1066962 (validMask!0 mask!947))))

(assert (=> start!133436 e!869401))

(assert (=> start!133436 true))

(declare-fun array_inv!39129 (array!103780) Bool)

(assert (=> start!133436 (and (array_inv!39129 _values!487) e!869399)))

(declare-fun array_inv!39130 (array!103782) Bool)

(assert (=> start!133436 (array_inv!39130 _keys!637)))

(declare-fun mapNonEmpty!59229 () Bool)

(declare-fun tp!112885 () Bool)

(declare-fun e!869398 () Bool)

(assert (=> mapNonEmpty!59229 (= mapRes!59229 (and tp!112885 e!869398))))

(declare-fun mapRest!59229 () (Array (_ BitVec 32) ValueCell!18254))

(declare-fun mapValue!59229 () ValueCell!18254)

(declare-fun mapKey!59229 () (_ BitVec 32))

(assert (=> mapNonEmpty!59229 (= (arr!50083 _values!487) (store mapRest!59229 mapKey!59229 mapValue!59229))))

(declare-fun b!1560232 () Bool)

(assert (=> b!1560232 (= e!869398 tp_is_empty!38569)))

(assert (= (and start!133436 res!1066962) b!1560227))

(assert (= (and b!1560227 res!1066961) b!1560228))

(assert (= (and b!1560228 res!1066960) b!1560230))

(assert (= (and b!1560231 condMapEmpty!59229) mapIsEmpty!59229))

(assert (= (and b!1560231 (not condMapEmpty!59229)) mapNonEmpty!59229))

(get-info :version)

(assert (= (and mapNonEmpty!59229 ((_ is ValueCellFull!18254) mapValue!59229)) b!1560232))

(assert (= (and b!1560231 ((_ is ValueCellFull!18254) mapDefault!59229)) b!1560229))

(assert (= start!133436 b!1560231))

(declare-fun m!1435461 () Bool)

(assert (=> b!1560228 m!1435461))

(declare-fun m!1435463 () Bool)

(assert (=> b!1560230 m!1435463))

(declare-fun m!1435465 () Bool)

(assert (=> start!133436 m!1435465))

(declare-fun m!1435467 () Bool)

(assert (=> start!133436 m!1435467))

(declare-fun m!1435469 () Bool)

(assert (=> start!133436 m!1435469))

(declare-fun m!1435471 () Bool)

(assert (=> mapNonEmpty!59229 m!1435471))

(check-sat (not b!1560228) tp_is_empty!38569 (not b!1560230) (not start!133436) (not mapNonEmpty!59229))
(check-sat)
