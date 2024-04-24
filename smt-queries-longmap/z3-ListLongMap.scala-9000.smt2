; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108984 () Bool)

(assert start!108984)

(declare-fun b_free!28273 () Bool)

(declare-fun b_next!28273 () Bool)

(assert (=> start!108984 (= b_free!28273 (not b_next!28273))))

(declare-fun tp!99934 () Bool)

(declare-fun b_and!46341 () Bool)

(assert (=> start!108984 (= tp!99934 b_and!46341)))

(declare-fun b!1285613 () Bool)

(declare-fun res!853709 () Bool)

(declare-fun e!734456 () Bool)

(assert (=> b!1285613 (=> (not res!853709) (not e!734456))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50321 0))(
  ( (V!50322 (val!17031 Int)) )
))
(declare-datatypes ((ValueCell!16058 0))(
  ( (ValueCellFull!16058 (v!19628 V!50321)) (EmptyCell!16058) )
))
(declare-datatypes ((array!84913 0))(
  ( (array!84914 (arr!40954 (Array (_ BitVec 32) ValueCell!16058)) (size!41505 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84913)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84915 0))(
  ( (array!84916 (arr!40955 (Array (_ BitVec 32) (_ BitVec 64))) (size!41506 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84915)

(assert (=> b!1285613 (= res!853709 (and (= (size!41505 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41506 _keys!1741) (size!41505 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285614 () Bool)

(declare-fun e!734455 () Bool)

(declare-fun e!734457 () Bool)

(declare-fun mapRes!52427 () Bool)

(assert (=> b!1285614 (= e!734455 (and e!734457 mapRes!52427))))

(declare-fun condMapEmpty!52427 () Bool)

(declare-fun mapDefault!52427 () ValueCell!16058)

(assert (=> b!1285614 (= condMapEmpty!52427 (= (arr!40954 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16058)) mapDefault!52427)))))

(declare-fun mapNonEmpty!52427 () Bool)

(declare-fun tp!99935 () Bool)

(declare-fun e!734454 () Bool)

(assert (=> mapNonEmpty!52427 (= mapRes!52427 (and tp!99935 e!734454))))

(declare-fun mapKey!52427 () (_ BitVec 32))

(declare-fun mapRest!52427 () (Array (_ BitVec 32) ValueCell!16058))

(declare-fun mapValue!52427 () ValueCell!16058)

(assert (=> mapNonEmpty!52427 (= (arr!40954 _values!1445) (store mapRest!52427 mapKey!52427 mapValue!52427))))

(declare-fun b!1285615 () Bool)

(declare-fun res!853707 () Bool)

(assert (=> b!1285615 (=> (not res!853707) (not e!734456))))

(declare-datatypes ((List!29046 0))(
  ( (Nil!29043) (Cons!29042 (h!30260 (_ BitVec 64)) (t!42582 List!29046)) )
))
(declare-fun arrayNoDuplicates!0 (array!84915 (_ BitVec 32) List!29046) Bool)

(assert (=> b!1285615 (= res!853707 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29043))))

(declare-fun mapIsEmpty!52427 () Bool)

(assert (=> mapIsEmpty!52427 mapRes!52427))

(declare-fun res!853708 () Bool)

(assert (=> start!108984 (=> (not res!853708) (not e!734456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108984 (= res!853708 (validMask!0 mask!2175))))

(assert (=> start!108984 e!734456))

(declare-fun tp_is_empty!33913 () Bool)

(assert (=> start!108984 tp_is_empty!33913))

(assert (=> start!108984 true))

(declare-fun array_inv!31277 (array!84913) Bool)

(assert (=> start!108984 (and (array_inv!31277 _values!1445) e!734455)))

(declare-fun array_inv!31278 (array!84915) Bool)

(assert (=> start!108984 (array_inv!31278 _keys!1741)))

(assert (=> start!108984 tp!99934))

(declare-fun b!1285616 () Bool)

(assert (=> b!1285616 (= e!734457 tp_is_empty!33913)))

(declare-fun b!1285617 () Bool)

(assert (=> b!1285617 (= e!734454 tp_is_empty!33913)))

(declare-fun b!1285618 () Bool)

(assert (=> b!1285618 (= e!734456 false)))

(declare-fun minValue!1387 () V!50321)

(declare-fun zeroValue!1387 () V!50321)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!577280 () Bool)

(declare-datatypes ((tuple2!21840 0))(
  ( (tuple2!21841 (_1!10931 (_ BitVec 64)) (_2!10931 V!50321)) )
))
(declare-datatypes ((List!29047 0))(
  ( (Nil!29044) (Cons!29043 (h!30261 tuple2!21840) (t!42583 List!29047)) )
))
(declare-datatypes ((ListLongMap!19505 0))(
  ( (ListLongMap!19506 (toList!9768 List!29047)) )
))
(declare-fun contains!7899 (ListLongMap!19505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4832 (array!84915 array!84913 (_ BitVec 32) (_ BitVec 32) V!50321 V!50321 (_ BitVec 32) Int) ListLongMap!19505)

(assert (=> b!1285618 (= lt!577280 (contains!7899 (getCurrentListMap!4832 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285619 () Bool)

(declare-fun res!853710 () Bool)

(assert (=> b!1285619 (=> (not res!853710) (not e!734456))))

(assert (=> b!1285619 (= res!853710 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41506 _keys!1741))))))

(declare-fun b!1285620 () Bool)

(declare-fun res!853711 () Bool)

(assert (=> b!1285620 (=> (not res!853711) (not e!734456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84915 (_ BitVec 32)) Bool)

(assert (=> b!1285620 (= res!853711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108984 res!853708) b!1285613))

(assert (= (and b!1285613 res!853709) b!1285620))

(assert (= (and b!1285620 res!853711) b!1285615))

(assert (= (and b!1285615 res!853707) b!1285619))

(assert (= (and b!1285619 res!853710) b!1285618))

(assert (= (and b!1285614 condMapEmpty!52427) mapIsEmpty!52427))

(assert (= (and b!1285614 (not condMapEmpty!52427)) mapNonEmpty!52427))

(get-info :version)

(assert (= (and mapNonEmpty!52427 ((_ is ValueCellFull!16058) mapValue!52427)) b!1285617))

(assert (= (and b!1285614 ((_ is ValueCellFull!16058) mapDefault!52427)) b!1285616))

(assert (= start!108984 b!1285614))

(declare-fun m!1179649 () Bool)

(assert (=> mapNonEmpty!52427 m!1179649))

(declare-fun m!1179651 () Bool)

(assert (=> b!1285620 m!1179651))

(declare-fun m!1179653 () Bool)

(assert (=> start!108984 m!1179653))

(declare-fun m!1179655 () Bool)

(assert (=> start!108984 m!1179655))

(declare-fun m!1179657 () Bool)

(assert (=> start!108984 m!1179657))

(declare-fun m!1179659 () Bool)

(assert (=> b!1285618 m!1179659))

(assert (=> b!1285618 m!1179659))

(declare-fun m!1179661 () Bool)

(assert (=> b!1285618 m!1179661))

(declare-fun m!1179663 () Bool)

(assert (=> b!1285615 m!1179663))

(check-sat (not b_next!28273) (not b!1285620) (not start!108984) (not b!1285618) (not b!1285615) tp_is_empty!33913 b_and!46341 (not mapNonEmpty!52427))
(check-sat b_and!46341 (not b_next!28273))
