; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109090 () Bool)

(assert start!109090)

(declare-fun b_free!28579 () Bool)

(declare-fun b_next!28579 () Bool)

(assert (=> start!109090 (= b_free!28579 (not b_next!28579))))

(declare-fun tp!100856 () Bool)

(declare-fun b_and!46651 () Bool)

(assert (=> start!109090 (= tp!100856 b_and!46651)))

(declare-fun res!856697 () Bool)

(declare-fun e!736321 () Bool)

(assert (=> start!109090 (=> (not res!856697) (not e!736321))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109090 (= res!856697 (validMask!0 mask!2175))))

(assert (=> start!109090 e!736321))

(declare-fun tp_is_empty!34219 () Bool)

(assert (=> start!109090 tp_is_empty!34219))

(assert (=> start!109090 true))

(declare-datatypes ((V!50729 0))(
  ( (V!50730 (val!17184 Int)) )
))
(declare-datatypes ((ValueCell!16211 0))(
  ( (ValueCellFull!16211 (v!19786 V!50729)) (EmptyCell!16211) )
))
(declare-datatypes ((array!85367 0))(
  ( (array!85368 (arr!41185 (Array (_ BitVec 32) ValueCell!16211)) (size!41737 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85367)

(declare-fun e!736320 () Bool)

(declare-fun array_inv!31379 (array!85367) Bool)

(assert (=> start!109090 (and (array_inv!31379 _values!1445) e!736320)))

(declare-datatypes ((array!85369 0))(
  ( (array!85370 (arr!41186 (Array (_ BitVec 32) (_ BitVec 64))) (size!41738 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85369)

(declare-fun array_inv!31380 (array!85369) Bool)

(assert (=> start!109090 (array_inv!31380 _keys!1741)))

(assert (=> start!109090 tp!100856))

(declare-fun b!1289641 () Bool)

(declare-fun res!856695 () Bool)

(assert (=> b!1289641 (=> (not res!856695) (not e!736321))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289641 (= res!856695 (not (validKeyInArray!0 (select (arr!41186 _keys!1741) from!2144))))))

(declare-fun b!1289642 () Bool)

(declare-fun e!736318 () Bool)

(assert (=> b!1289642 (= e!736321 (not e!736318))))

(declare-fun res!856694 () Bool)

(assert (=> b!1289642 (=> res!856694 e!736318)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289642 (= res!856694 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22124 0))(
  ( (tuple2!22125 (_1!11073 (_ BitVec 64)) (_2!11073 V!50729)) )
))
(declare-datatypes ((List!29286 0))(
  ( (Nil!29283) (Cons!29282 (h!30491 tuple2!22124) (t!42842 List!29286)) )
))
(declare-datatypes ((ListLongMap!19781 0))(
  ( (ListLongMap!19782 (toList!9906 List!29286)) )
))
(declare-fun contains!7954 (ListLongMap!19781 (_ BitVec 64)) Bool)

(assert (=> b!1289642 (not (contains!7954 (ListLongMap!19782 Nil!29283) k0!1205))))

(declare-datatypes ((Unit!42512 0))(
  ( (Unit!42513) )
))
(declare-fun lt!578168 () Unit!42512)

(declare-fun emptyContainsNothing!57 ((_ BitVec 64)) Unit!42512)

(assert (=> b!1289642 (= lt!578168 (emptyContainsNothing!57 k0!1205))))

(declare-fun mapIsEmpty!52889 () Bool)

(declare-fun mapRes!52889 () Bool)

(assert (=> mapIsEmpty!52889 mapRes!52889))

(declare-fun b!1289643 () Bool)

(declare-fun e!736323 () Bool)

(assert (=> b!1289643 (= e!736320 (and e!736323 mapRes!52889))))

(declare-fun condMapEmpty!52889 () Bool)

(declare-fun mapDefault!52889 () ValueCell!16211)

(assert (=> b!1289643 (= condMapEmpty!52889 (= (arr!41185 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16211)) mapDefault!52889)))))

(declare-fun b!1289644 () Bool)

(declare-fun res!856698 () Bool)

(assert (=> b!1289644 (=> (not res!856698) (not e!736321))))

(assert (=> b!1289644 (= res!856698 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41738 _keys!1741))))))

(declare-fun b!1289645 () Bool)

(assert (=> b!1289645 (= e!736323 tp_is_empty!34219)))

(declare-fun b!1289646 () Bool)

(declare-fun res!856692 () Bool)

(assert (=> b!1289646 (=> (not res!856692) (not e!736321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85369 (_ BitVec 32)) Bool)

(assert (=> b!1289646 (= res!856692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289647 () Bool)

(declare-fun res!856690 () Bool)

(assert (=> b!1289647 (=> (not res!856690) (not e!736321))))

(declare-fun minValue!1387 () V!50729)

(declare-fun zeroValue!1387 () V!50729)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4857 (array!85369 array!85367 (_ BitVec 32) (_ BitVec 32) V!50729 V!50729 (_ BitVec 32) Int) ListLongMap!19781)

(assert (=> b!1289647 (= res!856690 (contains!7954 (getCurrentListMap!4857 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289648 () Bool)

(declare-fun res!856693 () Bool)

(assert (=> b!1289648 (=> (not res!856693) (not e!736321))))

(assert (=> b!1289648 (= res!856693 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41738 _keys!1741))))))

(declare-fun b!1289649 () Bool)

(declare-fun res!856696 () Bool)

(assert (=> b!1289649 (=> (not res!856696) (not e!736321))))

(declare-datatypes ((List!29287 0))(
  ( (Nil!29284) (Cons!29283 (h!30492 (_ BitVec 64)) (t!42843 List!29287)) )
))
(declare-fun arrayNoDuplicates!0 (array!85369 (_ BitVec 32) List!29287) Bool)

(assert (=> b!1289649 (= res!856696 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29284))))

(declare-fun b!1289650 () Bool)

(declare-fun res!856691 () Bool)

(assert (=> b!1289650 (=> (not res!856691) (not e!736321))))

(assert (=> b!1289650 (= res!856691 (and (= (size!41737 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41738 _keys!1741) (size!41737 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52889 () Bool)

(declare-fun tp!100857 () Bool)

(declare-fun e!736319 () Bool)

(assert (=> mapNonEmpty!52889 (= mapRes!52889 (and tp!100857 e!736319))))

(declare-fun mapValue!52889 () ValueCell!16211)

(declare-fun mapKey!52889 () (_ BitVec 32))

(declare-fun mapRest!52889 () (Array (_ BitVec 32) ValueCell!16211))

(assert (=> mapNonEmpty!52889 (= (arr!41185 _values!1445) (store mapRest!52889 mapKey!52889 mapValue!52889))))

(declare-fun b!1289651 () Bool)

(assert (=> b!1289651 (= e!736319 tp_is_empty!34219)))

(declare-fun b!1289652 () Bool)

(assert (=> b!1289652 (= e!736318 true)))

(declare-fun lt!578169 () ListLongMap!19781)

(declare-fun +!4388 (ListLongMap!19781 tuple2!22124) ListLongMap!19781)

(assert (=> b!1289652 (not (contains!7954 (+!4388 lt!578169 (tuple2!22125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578170 () Unit!42512)

(declare-fun addStillNotContains!365 (ListLongMap!19781 (_ BitVec 64) V!50729 (_ BitVec 64)) Unit!42512)

(assert (=> b!1289652 (= lt!578170 (addStillNotContains!365 lt!578169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1289652 (not (contains!7954 (+!4388 lt!578169 (tuple2!22125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578167 () Unit!42512)

(assert (=> b!1289652 (= lt!578167 (addStillNotContains!365 lt!578169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6019 (array!85369 array!85367 (_ BitVec 32) (_ BitVec 32) V!50729 V!50729 (_ BitVec 32) Int) ListLongMap!19781)

(assert (=> b!1289652 (= lt!578169 (getCurrentListMapNoExtraKeys!6019 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109090 res!856697) b!1289650))

(assert (= (and b!1289650 res!856691) b!1289646))

(assert (= (and b!1289646 res!856692) b!1289649))

(assert (= (and b!1289649 res!856696) b!1289648))

(assert (= (and b!1289648 res!856693) b!1289647))

(assert (= (and b!1289647 res!856690) b!1289644))

(assert (= (and b!1289644 res!856698) b!1289641))

(assert (= (and b!1289641 res!856695) b!1289642))

(assert (= (and b!1289642 (not res!856694)) b!1289652))

(assert (= (and b!1289643 condMapEmpty!52889) mapIsEmpty!52889))

(assert (= (and b!1289643 (not condMapEmpty!52889)) mapNonEmpty!52889))

(get-info :version)

(assert (= (and mapNonEmpty!52889 ((_ is ValueCellFull!16211) mapValue!52889)) b!1289651))

(assert (= (and b!1289643 ((_ is ValueCellFull!16211) mapDefault!52889)) b!1289645))

(assert (= start!109090 b!1289643))

(declare-fun m!1181739 () Bool)

(assert (=> b!1289642 m!1181739))

(declare-fun m!1181741 () Bool)

(assert (=> b!1289642 m!1181741))

(declare-fun m!1181743 () Bool)

(assert (=> mapNonEmpty!52889 m!1181743))

(declare-fun m!1181745 () Bool)

(assert (=> b!1289647 m!1181745))

(assert (=> b!1289647 m!1181745))

(declare-fun m!1181747 () Bool)

(assert (=> b!1289647 m!1181747))

(declare-fun m!1181749 () Bool)

(assert (=> b!1289649 m!1181749))

(declare-fun m!1181751 () Bool)

(assert (=> b!1289652 m!1181751))

(declare-fun m!1181753 () Bool)

(assert (=> b!1289652 m!1181753))

(declare-fun m!1181755 () Bool)

(assert (=> b!1289652 m!1181755))

(assert (=> b!1289652 m!1181753))

(declare-fun m!1181757 () Bool)

(assert (=> b!1289652 m!1181757))

(declare-fun m!1181759 () Bool)

(assert (=> b!1289652 m!1181759))

(declare-fun m!1181761 () Bool)

(assert (=> b!1289652 m!1181761))

(assert (=> b!1289652 m!1181751))

(declare-fun m!1181763 () Bool)

(assert (=> b!1289652 m!1181763))

(declare-fun m!1181765 () Bool)

(assert (=> start!109090 m!1181765))

(declare-fun m!1181767 () Bool)

(assert (=> start!109090 m!1181767))

(declare-fun m!1181769 () Bool)

(assert (=> start!109090 m!1181769))

(declare-fun m!1181771 () Bool)

(assert (=> b!1289646 m!1181771))

(declare-fun m!1181773 () Bool)

(assert (=> b!1289641 m!1181773))

(assert (=> b!1289641 m!1181773))

(declare-fun m!1181775 () Bool)

(assert (=> b!1289641 m!1181775))

(check-sat (not mapNonEmpty!52889) b_and!46651 (not start!109090) (not b!1289646) (not b!1289652) (not b!1289641) (not b!1289647) tp_is_empty!34219 (not b!1289642) (not b!1289649) (not b_next!28579))
(check-sat b_and!46651 (not b_next!28579))
