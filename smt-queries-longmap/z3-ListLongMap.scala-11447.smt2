; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133482 () Bool)

(assert start!133482)

(declare-fun b!1560504 () Bool)

(declare-fun res!1067073 () Bool)

(declare-fun e!869566 () Bool)

(assert (=> b!1560504 (=> (not res!1067073) (not e!869566))))

(declare-datatypes ((array!103852 0))(
  ( (array!103853 (arr!50118 (Array (_ BitVec 32) (_ BitVec 64))) (size!50668 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103852)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103852 (_ BitVec 32)) Bool)

(assert (=> b!1560504 (= res!1067073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560505 () Bool)

(declare-fun e!869565 () Bool)

(declare-fun tp_is_empty!38565 () Bool)

(assert (=> b!1560505 (= e!869565 tp_is_empty!38565)))

(declare-fun b!1560506 () Bool)

(assert (=> b!1560506 (= e!869566 false)))

(declare-fun lt!671004 () Bool)

(declare-datatypes ((List!36399 0))(
  ( (Nil!36396) (Cons!36395 (h!37841 (_ BitVec 64)) (t!51132 List!36399)) )
))
(declare-fun arrayNoDuplicates!0 (array!103852 (_ BitVec 32) List!36399) Bool)

(assert (=> b!1560506 (= lt!671004 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36396))))

(declare-fun mapNonEmpty!59223 () Bool)

(declare-fun mapRes!59223 () Bool)

(declare-fun tp!112878 () Bool)

(assert (=> mapNonEmpty!59223 (= mapRes!59223 (and tp!112878 e!869565))))

(declare-datatypes ((V!59627 0))(
  ( (V!59628 (val!19366 Int)) )
))
(declare-datatypes ((ValueCell!18252 0))(
  ( (ValueCellFull!18252 (v!22118 V!59627)) (EmptyCell!18252) )
))
(declare-fun mapValue!59223 () ValueCell!18252)

(declare-datatypes ((array!103854 0))(
  ( (array!103855 (arr!50119 (Array (_ BitVec 32) ValueCell!18252)) (size!50669 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103854)

(declare-fun mapKey!59223 () (_ BitVec 32))

(declare-fun mapRest!59223 () (Array (_ BitVec 32) ValueCell!18252))

(assert (=> mapNonEmpty!59223 (= (arr!50119 _values!487) (store mapRest!59223 mapKey!59223 mapValue!59223))))

(declare-fun b!1560507 () Bool)

(declare-fun e!869568 () Bool)

(assert (=> b!1560507 (= e!869568 tp_is_empty!38565)))

(declare-fun mapIsEmpty!59223 () Bool)

(assert (=> mapIsEmpty!59223 mapRes!59223))

(declare-fun b!1560509 () Bool)

(declare-fun e!869567 () Bool)

(assert (=> b!1560509 (= e!869567 (and e!869568 mapRes!59223))))

(declare-fun condMapEmpty!59223 () Bool)

(declare-fun mapDefault!59223 () ValueCell!18252)

(assert (=> b!1560509 (= condMapEmpty!59223 (= (arr!50119 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18252)) mapDefault!59223)))))

(declare-fun res!1067072 () Bool)

(assert (=> start!133482 (=> (not res!1067072) (not e!869566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133482 (= res!1067072 (validMask!0 mask!947))))

(assert (=> start!133482 e!869566))

(assert (=> start!133482 true))

(declare-fun array_inv!38959 (array!103854) Bool)

(assert (=> start!133482 (and (array_inv!38959 _values!487) e!869567)))

(declare-fun array_inv!38960 (array!103852) Bool)

(assert (=> start!133482 (array_inv!38960 _keys!637)))

(declare-fun b!1560508 () Bool)

(declare-fun res!1067071 () Bool)

(assert (=> b!1560508 (=> (not res!1067071) (not e!869566))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560508 (= res!1067071 (and (= (size!50669 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50668 _keys!637) (size!50669 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133482 res!1067072) b!1560508))

(assert (= (and b!1560508 res!1067071) b!1560504))

(assert (= (and b!1560504 res!1067073) b!1560506))

(assert (= (and b!1560509 condMapEmpty!59223) mapIsEmpty!59223))

(assert (= (and b!1560509 (not condMapEmpty!59223)) mapNonEmpty!59223))

(get-info :version)

(assert (= (and mapNonEmpty!59223 ((_ is ValueCellFull!18252) mapValue!59223)) b!1560505))

(assert (= (and b!1560509 ((_ is ValueCellFull!18252) mapDefault!59223)) b!1560507))

(assert (= start!133482 b!1560509))

(declare-fun m!1436329 () Bool)

(assert (=> b!1560504 m!1436329))

(declare-fun m!1436331 () Bool)

(assert (=> b!1560506 m!1436331))

(declare-fun m!1436333 () Bool)

(assert (=> mapNonEmpty!59223 m!1436333))

(declare-fun m!1436335 () Bool)

(assert (=> start!133482 m!1436335))

(declare-fun m!1436337 () Bool)

(assert (=> start!133482 m!1436337))

(declare-fun m!1436339 () Bool)

(assert (=> start!133482 m!1436339))

(check-sat (not b!1560504) (not b!1560506) tp_is_empty!38565 (not mapNonEmpty!59223) (not start!133482))
(check-sat)
