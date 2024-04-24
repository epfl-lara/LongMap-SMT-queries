; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133910 () Bool)

(assert start!133910)

(declare-fun b!1563084 () Bool)

(declare-fun res!1068004 () Bool)

(declare-fun e!871195 () Bool)

(assert (=> b!1563084 (=> (not res!1068004) (not e!871195))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104004 0))(
  ( (array!104005 (arr!50187 (Array (_ BitVec 32) (_ BitVec 64))) (size!50738 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104004)

(declare-datatypes ((V!59649 0))(
  ( (V!59650 (val!19374 Int)) )
))
(declare-datatypes ((ValueCell!18260 0))(
  ( (ValueCellFull!18260 (v!22118 V!59649)) (EmptyCell!18260) )
))
(declare-datatypes ((array!104006 0))(
  ( (array!104007 (arr!50188 (Array (_ BitVec 32) ValueCell!18260)) (size!50739 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104006)

(assert (=> b!1563084 (= res!1068004 (and (= (size!50739 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50738 _keys!637) (size!50739 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563085 () Bool)

(declare-fun e!871194 () Bool)

(declare-fun tp_is_empty!38581 () Bool)

(assert (=> b!1563085 (= e!871194 tp_is_empty!38581)))

(declare-fun res!1068003 () Bool)

(assert (=> start!133910 (=> (not res!1068003) (not e!871195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133910 (= res!1068003 (validMask!0 mask!947))))

(assert (=> start!133910 e!871195))

(assert (=> start!133910 true))

(declare-fun e!871196 () Bool)

(declare-fun array_inv!39261 (array!104006) Bool)

(assert (=> start!133910 (and (array_inv!39261 _values!487) e!871196)))

(declare-fun array_inv!39262 (array!104004) Bool)

(assert (=> start!133910 (array_inv!39262 _keys!637)))

(declare-fun b!1563086 () Bool)

(assert (=> b!1563086 (= e!871195 false)))

(declare-fun lt!671936 () Bool)

(declare-datatypes ((List!36430 0))(
  ( (Nil!36427) (Cons!36426 (h!37890 (_ BitVec 64)) (t!51155 List!36430)) )
))
(declare-fun arrayNoDuplicates!0 (array!104004 (_ BitVec 32) List!36430) Bool)

(assert (=> b!1563086 (= lt!671936 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36427))))

(declare-fun mapIsEmpty!59247 () Bool)

(declare-fun mapRes!59247 () Bool)

(assert (=> mapIsEmpty!59247 mapRes!59247))

(declare-fun b!1563087 () Bool)

(declare-fun e!871198 () Bool)

(assert (=> b!1563087 (= e!871198 tp_is_empty!38581)))

(declare-fun b!1563088 () Bool)

(declare-fun res!1068005 () Bool)

(assert (=> b!1563088 (=> (not res!1068005) (not e!871195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104004 (_ BitVec 32)) Bool)

(assert (=> b!1563088 (= res!1068005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59247 () Bool)

(declare-fun tp!112902 () Bool)

(assert (=> mapNonEmpty!59247 (= mapRes!59247 (and tp!112902 e!871194))))

(declare-fun mapKey!59247 () (_ BitVec 32))

(declare-fun mapValue!59247 () ValueCell!18260)

(declare-fun mapRest!59247 () (Array (_ BitVec 32) ValueCell!18260))

(assert (=> mapNonEmpty!59247 (= (arr!50188 _values!487) (store mapRest!59247 mapKey!59247 mapValue!59247))))

(declare-fun b!1563089 () Bool)

(assert (=> b!1563089 (= e!871196 (and e!871198 mapRes!59247))))

(declare-fun condMapEmpty!59247 () Bool)

(declare-fun mapDefault!59247 () ValueCell!18260)

(assert (=> b!1563089 (= condMapEmpty!59247 (= (arr!50188 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18260)) mapDefault!59247)))))

(assert (= (and start!133910 res!1068003) b!1563084))

(assert (= (and b!1563084 res!1068004) b!1563088))

(assert (= (and b!1563088 res!1068005) b!1563086))

(assert (= (and b!1563089 condMapEmpty!59247) mapIsEmpty!59247))

(assert (= (and b!1563089 (not condMapEmpty!59247)) mapNonEmpty!59247))

(get-info :version)

(assert (= (and mapNonEmpty!59247 ((_ is ValueCellFull!18260) mapValue!59247)) b!1563085))

(assert (= (and b!1563089 ((_ is ValueCellFull!18260) mapDefault!59247)) b!1563087))

(assert (= start!133910 b!1563089))

(declare-fun m!1438683 () Bool)

(assert (=> start!133910 m!1438683))

(declare-fun m!1438685 () Bool)

(assert (=> start!133910 m!1438685))

(declare-fun m!1438687 () Bool)

(assert (=> start!133910 m!1438687))

(declare-fun m!1438689 () Bool)

(assert (=> b!1563086 m!1438689))

(declare-fun m!1438691 () Bool)

(assert (=> b!1563088 m!1438691))

(declare-fun m!1438693 () Bool)

(assert (=> mapNonEmpty!59247 m!1438693))

(check-sat (not start!133910) (not b!1563086) (not mapNonEmpty!59247) tp_is_empty!38581 (not b!1563088))
(check-sat)
