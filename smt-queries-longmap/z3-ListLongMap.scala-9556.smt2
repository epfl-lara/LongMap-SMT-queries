; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113198 () Bool)

(assert start!113198)

(declare-fun b_free!31249 () Bool)

(declare-fun b_next!31249 () Bool)

(assert (=> start!113198 (= b_free!31249 (not b_next!31249))))

(declare-fun tp!109552 () Bool)

(declare-fun b_and!50387 () Bool)

(assert (=> start!113198 (= tp!109552 b_and!50387)))

(declare-fun b!1342555 () Bool)

(declare-fun res!890730 () Bool)

(declare-fun e!764312 () Bool)

(assert (=> b!1342555 (=> (not res!890730) (not e!764312))))

(declare-datatypes ((V!54769 0))(
  ( (V!54770 (val!18699 Int)) )
))
(declare-fun minValue!1245 () V!54769)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91289 0))(
  ( (array!91290 (arr!44101 (Array (_ BitVec 32) (_ BitVec 64))) (size!44653 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91289)

(declare-fun zeroValue!1245 () V!54769)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17726 0))(
  ( (ValueCellFull!17726 (v!21346 V!54769)) (EmptyCell!17726) )
))
(declare-datatypes ((array!91291 0))(
  ( (array!91292 (arr!44102 (Array (_ BitVec 32) ValueCell!17726)) (size!44654 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91291)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24146 0))(
  ( (tuple2!24147 (_1!12084 (_ BitVec 64)) (_2!12084 V!54769)) )
))
(declare-datatypes ((List!31291 0))(
  ( (Nil!31288) (Cons!31287 (h!32496 tuple2!24146) (t!45743 List!31291)) )
))
(declare-datatypes ((ListLongMap!21803 0))(
  ( (ListLongMap!21804 (toList!10917 List!31291)) )
))
(declare-fun contains!9022 (ListLongMap!21803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5767 (array!91289 array!91291 (_ BitVec 32) (_ BitVec 32) V!54769 V!54769 (_ BitVec 32) Int) ListLongMap!21803)

(assert (=> b!1342555 (= res!890730 (contains!9022 (getCurrentListMap!5767 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342556 () Bool)

(declare-fun res!890732 () Bool)

(assert (=> b!1342556 (=> (not res!890732) (not e!764312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342556 (= res!890732 (validKeyInArray!0 (select (arr!44101 _keys!1571) from!1960)))))

(declare-fun b!1342557 () Bool)

(declare-fun e!764313 () Bool)

(declare-fun e!764311 () Bool)

(declare-fun mapRes!57580 () Bool)

(assert (=> b!1342557 (= e!764313 (and e!764311 mapRes!57580))))

(declare-fun condMapEmpty!57580 () Bool)

(declare-fun mapDefault!57580 () ValueCell!17726)

(assert (=> b!1342557 (= condMapEmpty!57580 (= (arr!44102 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17726)) mapDefault!57580)))))

(declare-fun b!1342558 () Bool)

(declare-fun res!890735 () Bool)

(assert (=> b!1342558 (=> (not res!890735) (not e!764312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91289 (_ BitVec 32)) Bool)

(assert (=> b!1342558 (= res!890735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342559 () Bool)

(declare-fun e!764315 () Bool)

(declare-fun tp_is_empty!37249 () Bool)

(assert (=> b!1342559 (= e!764315 tp_is_empty!37249)))

(declare-fun b!1342560 () Bool)

(declare-fun res!890737 () Bool)

(assert (=> b!1342560 (=> (not res!890737) (not e!764312))))

(assert (=> b!1342560 (= res!890737 (and (= (size!44654 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44653 _keys!1571) (size!44654 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890736 () Bool)

(assert (=> start!113198 (=> (not res!890736) (not e!764312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113198 (= res!890736 (validMask!0 mask!1977))))

(assert (=> start!113198 e!764312))

(assert (=> start!113198 tp_is_empty!37249))

(assert (=> start!113198 true))

(declare-fun array_inv!33437 (array!91289) Bool)

(assert (=> start!113198 (array_inv!33437 _keys!1571)))

(declare-fun array_inv!33438 (array!91291) Bool)

(assert (=> start!113198 (and (array_inv!33438 _values!1303) e!764313)))

(assert (=> start!113198 tp!109552))

(declare-fun mapIsEmpty!57580 () Bool)

(assert (=> mapIsEmpty!57580 mapRes!57580))

(declare-fun b!1342561 () Bool)

(declare-fun res!890731 () Bool)

(assert (=> b!1342561 (=> (not res!890731) (not e!764312))))

(declare-datatypes ((List!31292 0))(
  ( (Nil!31289) (Cons!31288 (h!32497 (_ BitVec 64)) (t!45744 List!31292)) )
))
(declare-fun arrayNoDuplicates!0 (array!91289 (_ BitVec 32) List!31292) Bool)

(assert (=> b!1342561 (= res!890731 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31289))))

(declare-fun b!1342562 () Bool)

(declare-fun res!890733 () Bool)

(assert (=> b!1342562 (=> (not res!890733) (not e!764312))))

(assert (=> b!1342562 (= res!890733 (not (= (select (arr!44101 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342563 () Bool)

(assert (=> b!1342563 (= e!764312 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun lt!594370 () ListLongMap!21803)

(assert (=> b!1342563 (contains!9022 lt!594370 k0!1142)))

(declare-fun lt!594371 () V!54769)

(declare-datatypes ((Unit!43882 0))(
  ( (Unit!43883) )
))
(declare-fun lt!594368 () Unit!43882)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!359 ((_ BitVec 64) (_ BitVec 64) V!54769 ListLongMap!21803) Unit!43882)

(assert (=> b!1342563 (= lt!594368 (lemmaInListMapAfterAddingDiffThenInBefore!359 k0!1142 (select (arr!44101 _keys!1571) from!1960) lt!594371 lt!594370))))

(declare-fun lt!594369 () ListLongMap!21803)

(assert (=> b!1342563 (contains!9022 lt!594369 k0!1142)))

(declare-fun lt!594372 () Unit!43882)

(assert (=> b!1342563 (= lt!594372 (lemmaInListMapAfterAddingDiffThenInBefore!359 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594369))))

(declare-fun +!4820 (ListLongMap!21803 tuple2!24146) ListLongMap!21803)

(assert (=> b!1342563 (= lt!594369 (+!4820 lt!594370 (tuple2!24147 (select (arr!44101 _keys!1571) from!1960) lt!594371)))))

(declare-fun get!22276 (ValueCell!17726 V!54769) V!54769)

(declare-fun dynLambda!3750 (Int (_ BitVec 64)) V!54769)

(assert (=> b!1342563 (= lt!594371 (get!22276 (select (arr!44102 _values!1303) from!1960) (dynLambda!3750 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6463 (array!91289 array!91291 (_ BitVec 32) (_ BitVec 32) V!54769 V!54769 (_ BitVec 32) Int) ListLongMap!21803)

(assert (=> b!1342563 (= lt!594370 (getCurrentListMapNoExtraKeys!6463 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342564 () Bool)

(declare-fun res!890734 () Bool)

(assert (=> b!1342564 (=> (not res!890734) (not e!764312))))

(assert (=> b!1342564 (= res!890734 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44653 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57580 () Bool)

(declare-fun tp!109553 () Bool)

(assert (=> mapNonEmpty!57580 (= mapRes!57580 (and tp!109553 e!764315))))

(declare-fun mapKey!57580 () (_ BitVec 32))

(declare-fun mapRest!57580 () (Array (_ BitVec 32) ValueCell!17726))

(declare-fun mapValue!57580 () ValueCell!17726)

(assert (=> mapNonEmpty!57580 (= (arr!44102 _values!1303) (store mapRest!57580 mapKey!57580 mapValue!57580))))

(declare-fun b!1342565 () Bool)

(declare-fun res!890729 () Bool)

(assert (=> b!1342565 (=> (not res!890729) (not e!764312))))

(assert (=> b!1342565 (= res!890729 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342566 () Bool)

(assert (=> b!1342566 (= e!764311 tp_is_empty!37249)))

(assert (= (and start!113198 res!890736) b!1342560))

(assert (= (and b!1342560 res!890737) b!1342558))

(assert (= (and b!1342558 res!890735) b!1342561))

(assert (= (and b!1342561 res!890731) b!1342564))

(assert (= (and b!1342564 res!890734) b!1342555))

(assert (= (and b!1342555 res!890730) b!1342562))

(assert (= (and b!1342562 res!890733) b!1342556))

(assert (= (and b!1342556 res!890732) b!1342565))

(assert (= (and b!1342565 res!890729) b!1342563))

(assert (= (and b!1342557 condMapEmpty!57580) mapIsEmpty!57580))

(assert (= (and b!1342557 (not condMapEmpty!57580)) mapNonEmpty!57580))

(get-info :version)

(assert (= (and mapNonEmpty!57580 ((_ is ValueCellFull!17726) mapValue!57580)) b!1342559))

(assert (= (and b!1342557 ((_ is ValueCellFull!17726) mapDefault!57580)) b!1342566))

(assert (= start!113198 b!1342557))

(declare-fun b_lambda!24415 () Bool)

(assert (=> (not b_lambda!24415) (not b!1342563)))

(declare-fun t!45742 () Bool)

(declare-fun tb!12255 () Bool)

(assert (=> (and start!113198 (= defaultEntry!1306 defaultEntry!1306) t!45742) tb!12255))

(declare-fun result!25609 () Bool)

(assert (=> tb!12255 (= result!25609 tp_is_empty!37249)))

(assert (=> b!1342563 t!45742))

(declare-fun b_and!50389 () Bool)

(assert (= b_and!50387 (and (=> t!45742 result!25609) b_and!50389)))

(declare-fun m!1229731 () Bool)

(assert (=> b!1342562 m!1229731))

(assert (=> b!1342556 m!1229731))

(assert (=> b!1342556 m!1229731))

(declare-fun m!1229733 () Bool)

(assert (=> b!1342556 m!1229733))

(declare-fun m!1229735 () Bool)

(assert (=> mapNonEmpty!57580 m!1229735))

(declare-fun m!1229737 () Bool)

(assert (=> b!1342555 m!1229737))

(assert (=> b!1342555 m!1229737))

(declare-fun m!1229739 () Bool)

(assert (=> b!1342555 m!1229739))

(declare-fun m!1229741 () Bool)

(assert (=> b!1342558 m!1229741))

(assert (=> b!1342563 m!1229731))

(declare-fun m!1229743 () Bool)

(assert (=> b!1342563 m!1229743))

(declare-fun m!1229745 () Bool)

(assert (=> b!1342563 m!1229745))

(declare-fun m!1229747 () Bool)

(assert (=> b!1342563 m!1229747))

(declare-fun m!1229749 () Bool)

(assert (=> b!1342563 m!1229749))

(declare-fun m!1229751 () Bool)

(assert (=> b!1342563 m!1229751))

(assert (=> b!1342563 m!1229747))

(declare-fun m!1229753 () Bool)

(assert (=> b!1342563 m!1229753))

(declare-fun m!1229755 () Bool)

(assert (=> b!1342563 m!1229755))

(assert (=> b!1342563 m!1229731))

(declare-fun m!1229757 () Bool)

(assert (=> b!1342563 m!1229757))

(assert (=> b!1342563 m!1229749))

(declare-fun m!1229759 () Bool)

(assert (=> b!1342563 m!1229759))

(declare-fun m!1229761 () Bool)

(assert (=> start!113198 m!1229761))

(declare-fun m!1229763 () Bool)

(assert (=> start!113198 m!1229763))

(declare-fun m!1229765 () Bool)

(assert (=> start!113198 m!1229765))

(declare-fun m!1229767 () Bool)

(assert (=> b!1342561 m!1229767))

(check-sat (not b!1342558) (not b_next!31249) (not b!1342555) (not b!1342556) (not start!113198) b_and!50389 (not b_lambda!24415) (not b!1342561) tp_is_empty!37249 (not mapNonEmpty!57580) (not b!1342563))
(check-sat b_and!50389 (not b_next!31249))
