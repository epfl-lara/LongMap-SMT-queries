; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133820 () Bool)

(assert start!133820)

(declare-fun mapIsEmpty!59112 () Bool)

(declare-fun mapRes!59112 () Bool)

(assert (=> mapIsEmpty!59112 mapRes!59112))

(declare-fun b!1562010 () Bool)

(declare-fun e!870519 () Bool)

(declare-fun tp_is_empty!38491 () Bool)

(assert (=> b!1562010 (= e!870519 tp_is_empty!38491)))

(declare-fun b!1562011 () Bool)

(declare-fun e!870523 () Bool)

(assert (=> b!1562011 (= e!870523 tp_is_empty!38491)))

(declare-fun b!1562012 () Bool)

(declare-fun res!1067334 () Bool)

(declare-fun e!870520 () Bool)

(assert (=> b!1562012 (=> (not res!1067334) (not e!870520))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103838 0))(
  ( (array!103839 (arr!50104 (Array (_ BitVec 32) (_ BitVec 64))) (size!50655 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103838)

(assert (=> b!1562012 (= res!1067334 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50655 _keys!637)) (bvsge from!782 (size!50655 _keys!637))))))

(declare-fun b!1562013 () Bool)

(assert (=> b!1562013 (= e!870520 false)))

(declare-fun lt!671801 () Bool)

(declare-datatypes ((V!59529 0))(
  ( (V!59530 (val!19329 Int)) )
))
(declare-datatypes ((tuple2!25052 0))(
  ( (tuple2!25053 (_1!12537 (_ BitVec 64)) (_2!12537 V!59529)) )
))
(declare-datatypes ((List!36380 0))(
  ( (Nil!36377) (Cons!36376 (h!37840 tuple2!25052) (t!51105 List!36380)) )
))
(declare-datatypes ((ListLongMap!22495 0))(
  ( (ListLongMap!22496 (toList!11263 List!36380)) )
))
(declare-fun contains!10264 (ListLongMap!22495 (_ BitVec 64)) Bool)

(assert (=> b!1562013 (= lt!671801 (contains!10264 (ListLongMap!22496 Nil!36377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562014 () Bool)

(declare-fun res!1067335 () Bool)

(assert (=> b!1562014 (=> (not res!1067335) (not e!870520))))

(assert (=> b!1562014 (= res!1067335 (not (contains!10264 (ListLongMap!22496 Nil!36377) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562015 () Bool)

(declare-fun res!1067338 () Bool)

(assert (=> b!1562015 (=> (not res!1067338) (not e!870520))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18215 0))(
  ( (ValueCellFull!18215 (v!22073 V!59529)) (EmptyCell!18215) )
))
(declare-datatypes ((array!103840 0))(
  ( (array!103841 (arr!50105 (Array (_ BitVec 32) ValueCell!18215)) (size!50656 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103840)

(assert (=> b!1562015 (= res!1067338 (and (= (size!50656 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50655 _keys!637) (size!50656 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562016 () Bool)

(declare-fun e!870522 () Bool)

(assert (=> b!1562016 (= e!870522 (and e!870519 mapRes!59112))))

(declare-fun condMapEmpty!59112 () Bool)

(declare-fun mapDefault!59112 () ValueCell!18215)

(assert (=> b!1562016 (= condMapEmpty!59112 (= (arr!50105 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18215)) mapDefault!59112)))))

(declare-fun b!1562018 () Bool)

(declare-fun res!1067336 () Bool)

(assert (=> b!1562018 (=> (not res!1067336) (not e!870520))))

(declare-datatypes ((List!36381 0))(
  ( (Nil!36378) (Cons!36377 (h!37841 (_ BitVec 64)) (t!51106 List!36381)) )
))
(declare-fun arrayNoDuplicates!0 (array!103838 (_ BitVec 32) List!36381) Bool)

(assert (=> b!1562018 (= res!1067336 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36378))))

(declare-fun mapNonEmpty!59112 () Bool)

(declare-fun tp!112767 () Bool)

(assert (=> mapNonEmpty!59112 (= mapRes!59112 (and tp!112767 e!870523))))

(declare-fun mapKey!59112 () (_ BitVec 32))

(declare-fun mapRest!59112 () (Array (_ BitVec 32) ValueCell!18215))

(declare-fun mapValue!59112 () ValueCell!18215)

(assert (=> mapNonEmpty!59112 (= (arr!50105 _values!487) (store mapRest!59112 mapKey!59112 mapValue!59112))))

(declare-fun b!1562017 () Bool)

(declare-fun res!1067339 () Bool)

(assert (=> b!1562017 (=> (not res!1067339) (not e!870520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103838 (_ BitVec 32)) Bool)

(assert (=> b!1562017 (= res!1067339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067337 () Bool)

(assert (=> start!133820 (=> (not res!1067337) (not e!870520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133820 (= res!1067337 (validMask!0 mask!947))))

(assert (=> start!133820 e!870520))

(assert (=> start!133820 true))

(declare-fun array_inv!39207 (array!103838) Bool)

(assert (=> start!133820 (array_inv!39207 _keys!637)))

(declare-fun array_inv!39208 (array!103840) Bool)

(assert (=> start!133820 (and (array_inv!39208 _values!487) e!870522)))

(assert (= (and start!133820 res!1067337) b!1562015))

(assert (= (and b!1562015 res!1067338) b!1562017))

(assert (= (and b!1562017 res!1067339) b!1562018))

(assert (= (and b!1562018 res!1067336) b!1562012))

(assert (= (and b!1562012 res!1067334) b!1562014))

(assert (= (and b!1562014 res!1067335) b!1562013))

(assert (= (and b!1562016 condMapEmpty!59112) mapIsEmpty!59112))

(assert (= (and b!1562016 (not condMapEmpty!59112)) mapNonEmpty!59112))

(get-info :version)

(assert (= (and mapNonEmpty!59112 ((_ is ValueCellFull!18215) mapValue!59112)) b!1562011))

(assert (= (and b!1562016 ((_ is ValueCellFull!18215) mapDefault!59112)) b!1562010))

(assert (= start!133820 b!1562016))

(declare-fun m!1438023 () Bool)

(assert (=> b!1562018 m!1438023))

(declare-fun m!1438025 () Bool)

(assert (=> mapNonEmpty!59112 m!1438025))

(declare-fun m!1438027 () Bool)

(assert (=> b!1562013 m!1438027))

(declare-fun m!1438029 () Bool)

(assert (=> b!1562017 m!1438029))

(declare-fun m!1438031 () Bool)

(assert (=> start!133820 m!1438031))

(declare-fun m!1438033 () Bool)

(assert (=> start!133820 m!1438033))

(declare-fun m!1438035 () Bool)

(assert (=> start!133820 m!1438035))

(declare-fun m!1438037 () Bool)

(assert (=> b!1562014 m!1438037))

(check-sat (not start!133820) (not b!1562018) (not b!1562013) (not b!1562014) tp_is_empty!38491 (not mapNonEmpty!59112) (not b!1562017))
(check-sat)
