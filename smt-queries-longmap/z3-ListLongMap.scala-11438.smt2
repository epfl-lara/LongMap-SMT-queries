; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133838 () Bool)

(assert start!133838)

(declare-fun b!1562253 () Bool)

(declare-fun res!1067500 () Bool)

(declare-fun e!870655 () Bool)

(assert (=> b!1562253 (=> (not res!1067500) (not e!870655))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103870 0))(
  ( (array!103871 (arr!50120 (Array (_ BitVec 32) (_ BitVec 64))) (size!50671 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103870)

(assert (=> b!1562253 (= res!1067500 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50671 _keys!637)) (bvsge from!782 (size!50671 _keys!637))))))

(declare-fun b!1562254 () Bool)

(declare-fun res!1067496 () Bool)

(assert (=> b!1562254 (=> (not res!1067496) (not e!870655))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103870 (_ BitVec 32)) Bool)

(assert (=> b!1562254 (= res!1067496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59139 () Bool)

(declare-fun mapRes!59139 () Bool)

(declare-fun tp!112794 () Bool)

(declare-fun e!870658 () Bool)

(assert (=> mapNonEmpty!59139 (= mapRes!59139 (and tp!112794 e!870658))))

(declare-datatypes ((V!59553 0))(
  ( (V!59554 (val!19338 Int)) )
))
(declare-datatypes ((ValueCell!18224 0))(
  ( (ValueCellFull!18224 (v!22082 V!59553)) (EmptyCell!18224) )
))
(declare-fun mapValue!59139 () ValueCell!18224)

(declare-fun mapRest!59139 () (Array (_ BitVec 32) ValueCell!18224))

(declare-datatypes ((array!103872 0))(
  ( (array!103873 (arr!50121 (Array (_ BitVec 32) ValueCell!18224)) (size!50672 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103872)

(declare-fun mapKey!59139 () (_ BitVec 32))

(assert (=> mapNonEmpty!59139 (= (arr!50121 _values!487) (store mapRest!59139 mapKey!59139 mapValue!59139))))

(declare-fun b!1562255 () Bool)

(declare-fun res!1067499 () Bool)

(assert (=> b!1562255 (=> (not res!1067499) (not e!870655))))

(declare-datatypes ((List!36389 0))(
  ( (Nil!36386) (Cons!36385 (h!37849 (_ BitVec 64)) (t!51114 List!36389)) )
))
(declare-fun arrayNoDuplicates!0 (array!103870 (_ BitVec 32) List!36389) Bool)

(assert (=> b!1562255 (= res!1067499 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36386))))

(declare-fun b!1562256 () Bool)

(declare-fun e!870654 () Bool)

(declare-fun e!870657 () Bool)

(assert (=> b!1562256 (= e!870654 (and e!870657 mapRes!59139))))

(declare-fun condMapEmpty!59139 () Bool)

(declare-fun mapDefault!59139 () ValueCell!18224)

(assert (=> b!1562256 (= condMapEmpty!59139 (= (arr!50121 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18224)) mapDefault!59139)))))

(declare-fun b!1562257 () Bool)

(assert (=> b!1562257 (= e!870655 false)))

(declare-fun lt!671828 () Bool)

(declare-datatypes ((tuple2!25062 0))(
  ( (tuple2!25063 (_1!12542 (_ BitVec 64)) (_2!12542 V!59553)) )
))
(declare-datatypes ((List!36390 0))(
  ( (Nil!36387) (Cons!36386 (h!37850 tuple2!25062) (t!51115 List!36390)) )
))
(declare-datatypes ((ListLongMap!22505 0))(
  ( (ListLongMap!22506 (toList!11268 List!36390)) )
))
(declare-fun contains!10269 (ListLongMap!22505 (_ BitVec 64)) Bool)

(assert (=> b!1562257 (= lt!671828 (contains!10269 (ListLongMap!22506 Nil!36387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562258 () Bool)

(declare-fun res!1067497 () Bool)

(assert (=> b!1562258 (=> (not res!1067497) (not e!870655))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562258 (= res!1067497 (and (= (size!50672 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50671 _keys!637) (size!50672 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067498 () Bool)

(assert (=> start!133838 (=> (not res!1067498) (not e!870655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133838 (= res!1067498 (validMask!0 mask!947))))

(assert (=> start!133838 e!870655))

(assert (=> start!133838 true))

(declare-fun array_inv!39217 (array!103870) Bool)

(assert (=> start!133838 (array_inv!39217 _keys!637)))

(declare-fun array_inv!39218 (array!103872) Bool)

(assert (=> start!133838 (and (array_inv!39218 _values!487) e!870654)))

(declare-fun b!1562259 () Bool)

(declare-fun tp_is_empty!38509 () Bool)

(assert (=> b!1562259 (= e!870658 tp_is_empty!38509)))

(declare-fun mapIsEmpty!59139 () Bool)

(assert (=> mapIsEmpty!59139 mapRes!59139))

(declare-fun b!1562260 () Bool)

(assert (=> b!1562260 (= e!870657 tp_is_empty!38509)))

(declare-fun b!1562261 () Bool)

(declare-fun res!1067501 () Bool)

(assert (=> b!1562261 (=> (not res!1067501) (not e!870655))))

(assert (=> b!1562261 (= res!1067501 (not (contains!10269 (ListLongMap!22506 Nil!36387) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!133838 res!1067498) b!1562258))

(assert (= (and b!1562258 res!1067497) b!1562254))

(assert (= (and b!1562254 res!1067496) b!1562255))

(assert (= (and b!1562255 res!1067499) b!1562253))

(assert (= (and b!1562253 res!1067500) b!1562261))

(assert (= (and b!1562261 res!1067501) b!1562257))

(assert (= (and b!1562256 condMapEmpty!59139) mapIsEmpty!59139))

(assert (= (and b!1562256 (not condMapEmpty!59139)) mapNonEmpty!59139))

(get-info :version)

(assert (= (and mapNonEmpty!59139 ((_ is ValueCellFull!18224) mapValue!59139)) b!1562259))

(assert (= (and b!1562256 ((_ is ValueCellFull!18224) mapDefault!59139)) b!1562260))

(assert (= start!133838 b!1562256))

(declare-fun m!1438167 () Bool)

(assert (=> start!133838 m!1438167))

(declare-fun m!1438169 () Bool)

(assert (=> start!133838 m!1438169))

(declare-fun m!1438171 () Bool)

(assert (=> start!133838 m!1438171))

(declare-fun m!1438173 () Bool)

(assert (=> mapNonEmpty!59139 m!1438173))

(declare-fun m!1438175 () Bool)

(assert (=> b!1562255 m!1438175))

(declare-fun m!1438177 () Bool)

(assert (=> b!1562257 m!1438177))

(declare-fun m!1438179 () Bool)

(assert (=> b!1562254 m!1438179))

(declare-fun m!1438181 () Bool)

(assert (=> b!1562261 m!1438181))

(check-sat (not b!1562254) (not b!1562261) (not b!1562257) (not b!1562255) tp_is_empty!38509 (not mapNonEmpty!59139) (not start!133838))
(check-sat)
