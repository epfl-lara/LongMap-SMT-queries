; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133694 () Bool)

(assert start!133694)

(declare-fun b_free!32107 () Bool)

(declare-fun b_next!32107 () Bool)

(assert (=> start!133694 (= b_free!32107 (not b_next!32107))))

(declare-fun tp!113527 () Bool)

(declare-fun b_and!51659 () Bool)

(assert (=> start!133694 (= tp!113527 b_and!51659)))

(declare-fun mapIsEmpty!59616 () Bool)

(declare-fun mapRes!59616 () Bool)

(assert (=> mapIsEmpty!59616 mapRes!59616))

(declare-fun mapNonEmpty!59616 () Bool)

(declare-fun tp!113526 () Bool)

(declare-fun e!871416 () Bool)

(assert (=> mapNonEmpty!59616 (= mapRes!59616 (and tp!113526 e!871416))))

(declare-datatypes ((V!59977 0))(
  ( (V!59978 (val!19497 Int)) )
))
(declare-datatypes ((ValueCell!18383 0))(
  ( (ValueCellFull!18383 (v!22245 V!59977)) (EmptyCell!18383) )
))
(declare-fun mapValue!59616 () ValueCell!18383)

(declare-fun mapRest!59616 () (Array (_ BitVec 32) ValueCell!18383))

(declare-fun mapKey!59616 () (_ BitVec 32))

(declare-datatypes ((array!104270 0))(
  ( (array!104271 (arr!50328 (Array (_ BitVec 32) ValueCell!18383)) (size!50880 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104270)

(assert (=> mapNonEmpty!59616 (= (arr!50328 _values!487) (store mapRest!59616 mapKey!59616 mapValue!59616))))

(declare-fun b!1563562 () Bool)

(declare-fun res!1069021 () Bool)

(declare-fun e!871418 () Bool)

(assert (=> b!1563562 (=> (not res!1069021) (not e!871418))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104272 0))(
  ( (array!104273 (arr!50329 (Array (_ BitVec 32) (_ BitVec 64))) (size!50881 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104272)

(assert (=> b!1563562 (= res!1069021 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50881 _keys!637)) (bvslt from!782 (size!50881 _keys!637))))))

(declare-fun b!1563563 () Bool)

(declare-fun e!871415 () Bool)

(assert (=> b!1563563 (= e!871418 e!871415)))

(declare-fun res!1069025 () Bool)

(assert (=> b!1563563 (=> (not res!1069025) (not e!871415))))

(declare-datatypes ((tuple2!25234 0))(
  ( (tuple2!25235 (_1!12628 (_ BitVec 64)) (_2!12628 V!59977)) )
))
(declare-datatypes ((List!36590 0))(
  ( (Nil!36587) (Cons!36586 (h!38033 tuple2!25234) (t!51429 List!36590)) )
))
(declare-datatypes ((ListLongMap!22669 0))(
  ( (ListLongMap!22670 (toList!11350 List!36590)) )
))
(declare-fun lt!671690 () ListLongMap!22669)

(declare-fun contains!10260 (ListLongMap!22669 (_ BitVec 64)) Bool)

(assert (=> b!1563563 (= res!1069025 (not (contains!10260 lt!671690 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59977)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59977)

(declare-fun getCurrentListMapNoExtraKeys!6719 (array!104272 array!104270 (_ BitVec 32) (_ BitVec 32) V!59977 V!59977 (_ BitVec 32) Int) ListLongMap!22669)

(assert (=> b!1563563 (= lt!671690 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563564 () Bool)

(assert (=> b!1563564 (= e!871415 false)))

(declare-fun lt!671689 () Bool)

(assert (=> b!1563564 (= lt!671689 (contains!10260 lt!671690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563566 () Bool)

(declare-fun e!871417 () Bool)

(declare-fun tp_is_empty!38827 () Bool)

(assert (=> b!1563566 (= e!871417 tp_is_empty!38827)))

(declare-fun b!1563567 () Bool)

(declare-fun res!1069024 () Bool)

(assert (=> b!1563567 (=> (not res!1069024) (not e!871418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104272 (_ BitVec 32)) Bool)

(assert (=> b!1563567 (= res!1069024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563568 () Bool)

(declare-fun res!1069020 () Bool)

(assert (=> b!1563568 (=> (not res!1069020) (not e!871418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563568 (= res!1069020 (not (validKeyInArray!0 (select (arr!50329 _keys!637) from!782))))))

(declare-fun b!1563569 () Bool)

(assert (=> b!1563569 (= e!871416 tp_is_empty!38827)))

(declare-fun b!1563565 () Bool)

(declare-fun res!1069026 () Bool)

(assert (=> b!1563565 (=> (not res!1069026) (not e!871418))))

(declare-datatypes ((List!36591 0))(
  ( (Nil!36588) (Cons!36587 (h!38034 (_ BitVec 64)) (t!51430 List!36591)) )
))
(declare-fun arrayNoDuplicates!0 (array!104272 (_ BitVec 32) List!36591) Bool)

(assert (=> b!1563565 (= res!1069026 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36588))))

(declare-fun res!1069022 () Bool)

(assert (=> start!133694 (=> (not res!1069022) (not e!871418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133694 (= res!1069022 (validMask!0 mask!947))))

(assert (=> start!133694 e!871418))

(assert (=> start!133694 tp!113527))

(assert (=> start!133694 tp_is_empty!38827))

(assert (=> start!133694 true))

(declare-fun array_inv!39307 (array!104272) Bool)

(assert (=> start!133694 (array_inv!39307 _keys!637)))

(declare-fun e!871420 () Bool)

(declare-fun array_inv!39308 (array!104270) Bool)

(assert (=> start!133694 (and (array_inv!39308 _values!487) e!871420)))

(declare-fun b!1563570 () Bool)

(assert (=> b!1563570 (= e!871420 (and e!871417 mapRes!59616))))

(declare-fun condMapEmpty!59616 () Bool)

(declare-fun mapDefault!59616 () ValueCell!18383)

(assert (=> b!1563570 (= condMapEmpty!59616 (= (arr!50328 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18383)) mapDefault!59616)))))

(declare-fun b!1563571 () Bool)

(declare-fun res!1069023 () Bool)

(assert (=> b!1563571 (=> (not res!1069023) (not e!871418))))

(assert (=> b!1563571 (= res!1069023 (and (= (size!50880 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50881 _keys!637) (size!50880 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133694 res!1069022) b!1563571))

(assert (= (and b!1563571 res!1069023) b!1563567))

(assert (= (and b!1563567 res!1069024) b!1563565))

(assert (= (and b!1563565 res!1069026) b!1563562))

(assert (= (and b!1563562 res!1069021) b!1563568))

(assert (= (and b!1563568 res!1069020) b!1563563))

(assert (= (and b!1563563 res!1069025) b!1563564))

(assert (= (and b!1563570 condMapEmpty!59616) mapIsEmpty!59616))

(assert (= (and b!1563570 (not condMapEmpty!59616)) mapNonEmpty!59616))

(get-info :version)

(assert (= (and mapNonEmpty!59616 ((_ is ValueCellFull!18383) mapValue!59616)) b!1563569))

(assert (= (and b!1563570 ((_ is ValueCellFull!18383) mapDefault!59616)) b!1563566))

(assert (= start!133694 b!1563570))

(declare-fun m!1438389 () Bool)

(assert (=> b!1563564 m!1438389))

(declare-fun m!1438391 () Bool)

(assert (=> b!1563568 m!1438391))

(assert (=> b!1563568 m!1438391))

(declare-fun m!1438393 () Bool)

(assert (=> b!1563568 m!1438393))

(declare-fun m!1438395 () Bool)

(assert (=> b!1563567 m!1438395))

(declare-fun m!1438397 () Bool)

(assert (=> b!1563565 m!1438397))

(declare-fun m!1438399 () Bool)

(assert (=> mapNonEmpty!59616 m!1438399))

(declare-fun m!1438401 () Bool)

(assert (=> start!133694 m!1438401))

(declare-fun m!1438403 () Bool)

(assert (=> start!133694 m!1438403))

(declare-fun m!1438405 () Bool)

(assert (=> start!133694 m!1438405))

(declare-fun m!1438407 () Bool)

(assert (=> b!1563563 m!1438407))

(declare-fun m!1438409 () Bool)

(assert (=> b!1563563 m!1438409))

(check-sat b_and!51659 (not b!1563565) (not b_next!32107) (not mapNonEmpty!59616) (not b!1563567) (not b!1563564) tp_is_empty!38827 (not start!133694) (not b!1563568) (not b!1563563))
(check-sat b_and!51659 (not b_next!32107))
