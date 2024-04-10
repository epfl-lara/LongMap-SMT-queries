; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109730 () Bool)

(assert start!109730)

(declare-fun b_free!29163 () Bool)

(declare-fun b_next!29163 () Bool)

(assert (=> start!109730 (= b_free!29163 (not b_next!29163))))

(declare-fun tp!102617 () Bool)

(declare-fun b_and!47265 () Bool)

(assert (=> start!109730 (= tp!102617 b_and!47265)))

(declare-fun b!1299781 () Bool)

(declare-fun e!741477 () Bool)

(declare-fun tp_is_empty!34803 () Bool)

(assert (=> b!1299781 (= e!741477 tp_is_empty!34803)))

(declare-fun b!1299782 () Bool)

(declare-fun res!863770 () Bool)

(declare-fun e!741481 () Bool)

(assert (=> b!1299782 (=> (not res!863770) (not e!741481))))

(declare-datatypes ((array!86614 0))(
  ( (array!86615 (arr!41805 (Array (_ BitVec 32) (_ BitVec 64))) (size!42355 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86614)

(declare-datatypes ((List!29669 0))(
  ( (Nil!29666) (Cons!29665 (h!30874 (_ BitVec 64)) (t!43239 List!29669)) )
))
(declare-fun arrayNoDuplicates!0 (array!86614 (_ BitVec 32) List!29669) Bool)

(assert (=> b!1299782 (= res!863770 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29666))))

(declare-fun b!1299783 () Bool)

(declare-fun res!863769 () Bool)

(assert (=> b!1299783 (=> (not res!863769) (not e!741481))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51507 0))(
  ( (V!51508 (val!17476 Int)) )
))
(declare-datatypes ((ValueCell!16503 0))(
  ( (ValueCellFull!16503 (v!20082 V!51507)) (EmptyCell!16503) )
))
(declare-datatypes ((array!86616 0))(
  ( (array!86617 (arr!41806 (Array (_ BitVec 32) ValueCell!16503)) (size!42356 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86616)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299783 (= res!863769 (and (= (size!42356 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42355 _keys!1741) (size!42356 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53774 () Bool)

(declare-fun mapRes!53774 () Bool)

(declare-fun tp!102616 () Bool)

(assert (=> mapNonEmpty!53774 (= mapRes!53774 (and tp!102616 e!741477))))

(declare-fun mapRest!53774 () (Array (_ BitVec 32) ValueCell!16503))

(declare-fun mapValue!53774 () ValueCell!16503)

(declare-fun mapKey!53774 () (_ BitVec 32))

(assert (=> mapNonEmpty!53774 (= (arr!41806 _values!1445) (store mapRest!53774 mapKey!53774 mapValue!53774))))

(declare-fun b!1299784 () Bool)

(declare-fun res!863767 () Bool)

(assert (=> b!1299784 (=> (not res!863767) (not e!741481))))

(assert (=> b!1299784 (= res!863767 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299785 () Bool)

(declare-fun e!741480 () Bool)

(declare-fun e!741479 () Bool)

(assert (=> b!1299785 (= e!741480 (and e!741479 mapRes!53774))))

(declare-fun condMapEmpty!53774 () Bool)

(declare-fun mapDefault!53774 () ValueCell!16503)

(assert (=> b!1299785 (= condMapEmpty!53774 (= (arr!41806 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16503)) mapDefault!53774)))))

(declare-fun b!1299786 () Bool)

(assert (=> b!1299786 (= e!741481 (not true))))

(declare-datatypes ((tuple2!22538 0))(
  ( (tuple2!22539 (_1!11280 (_ BitVec 64)) (_2!11280 V!51507)) )
))
(declare-datatypes ((List!29670 0))(
  ( (Nil!29667) (Cons!29666 (h!30875 tuple2!22538) (t!43240 List!29670)) )
))
(declare-datatypes ((ListLongMap!20195 0))(
  ( (ListLongMap!20196 (toList!10113 List!29670)) )
))
(declare-fun lt!581130 () ListLongMap!20195)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8235 (ListLongMap!20195 (_ BitVec 64)) Bool)

(assert (=> b!1299786 (contains!8235 lt!581130 k0!1205)))

(declare-fun minValue!1387 () V!51507)

(declare-datatypes ((Unit!43028 0))(
  ( (Unit!43029) )
))
(declare-fun lt!581129 () Unit!43028)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!74 ((_ BitVec 64) (_ BitVec 64) V!51507 ListLongMap!20195) Unit!43028)

(assert (=> b!1299786 (= lt!581129 (lemmaInListMapAfterAddingDiffThenInBefore!74 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581130))))

(declare-fun zeroValue!1387 () V!51507)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4445 (ListLongMap!20195 tuple2!22538) ListLongMap!20195)

(declare-fun getCurrentListMapNoExtraKeys!6076 (array!86614 array!86616 (_ BitVec 32) (_ BitVec 32) V!51507 V!51507 (_ BitVec 32) Int) ListLongMap!20195)

(assert (=> b!1299786 (= lt!581130 (+!4445 (getCurrentListMapNoExtraKeys!6076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1299787 () Bool)

(declare-fun res!863764 () Bool)

(assert (=> b!1299787 (=> (not res!863764) (not e!741481))))

(declare-fun getCurrentListMap!5141 (array!86614 array!86616 (_ BitVec 32) (_ BitVec 32) V!51507 V!51507 (_ BitVec 32) Int) ListLongMap!20195)

(assert (=> b!1299787 (= res!863764 (contains!8235 (getCurrentListMap!5141 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299788 () Bool)

(declare-fun res!863765 () Bool)

(assert (=> b!1299788 (=> (not res!863765) (not e!741481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86614 (_ BitVec 32)) Bool)

(assert (=> b!1299788 (= res!863765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299789 () Bool)

(declare-fun res!863771 () Bool)

(assert (=> b!1299789 (=> (not res!863771) (not e!741481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299789 (= res!863771 (validKeyInArray!0 (select (arr!41805 _keys!1741) from!2144)))))

(declare-fun b!1299790 () Bool)

(declare-fun res!863768 () Bool)

(assert (=> b!1299790 (=> (not res!863768) (not e!741481))))

(assert (=> b!1299790 (= res!863768 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42355 _keys!1741))))))

(declare-fun b!1299780 () Bool)

(declare-fun res!863772 () Bool)

(assert (=> b!1299780 (=> (not res!863772) (not e!741481))))

(assert (=> b!1299780 (= res!863772 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42355 _keys!1741))))))

(declare-fun res!863766 () Bool)

(assert (=> start!109730 (=> (not res!863766) (not e!741481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109730 (= res!863766 (validMask!0 mask!2175))))

(assert (=> start!109730 e!741481))

(assert (=> start!109730 tp_is_empty!34803))

(assert (=> start!109730 true))

(declare-fun array_inv!31635 (array!86616) Bool)

(assert (=> start!109730 (and (array_inv!31635 _values!1445) e!741480)))

(declare-fun array_inv!31636 (array!86614) Bool)

(assert (=> start!109730 (array_inv!31636 _keys!1741)))

(assert (=> start!109730 tp!102617))

(declare-fun mapIsEmpty!53774 () Bool)

(assert (=> mapIsEmpty!53774 mapRes!53774))

(declare-fun b!1299791 () Bool)

(assert (=> b!1299791 (= e!741479 tp_is_empty!34803)))

(assert (= (and start!109730 res!863766) b!1299783))

(assert (= (and b!1299783 res!863769) b!1299788))

(assert (= (and b!1299788 res!863765) b!1299782))

(assert (= (and b!1299782 res!863770) b!1299790))

(assert (= (and b!1299790 res!863768) b!1299787))

(assert (= (and b!1299787 res!863764) b!1299780))

(assert (= (and b!1299780 res!863772) b!1299789))

(assert (= (and b!1299789 res!863771) b!1299784))

(assert (= (and b!1299784 res!863767) b!1299786))

(assert (= (and b!1299785 condMapEmpty!53774) mapIsEmpty!53774))

(assert (= (and b!1299785 (not condMapEmpty!53774)) mapNonEmpty!53774))

(get-info :version)

(assert (= (and mapNonEmpty!53774 ((_ is ValueCellFull!16503) mapValue!53774)) b!1299781))

(assert (= (and b!1299785 ((_ is ValueCellFull!16503) mapDefault!53774)) b!1299791))

(assert (= start!109730 b!1299785))

(declare-fun m!1190877 () Bool)

(assert (=> b!1299782 m!1190877))

(declare-fun m!1190879 () Bool)

(assert (=> b!1299788 m!1190879))

(declare-fun m!1190881 () Bool)

(assert (=> mapNonEmpty!53774 m!1190881))

(declare-fun m!1190883 () Bool)

(assert (=> b!1299787 m!1190883))

(assert (=> b!1299787 m!1190883))

(declare-fun m!1190885 () Bool)

(assert (=> b!1299787 m!1190885))

(declare-fun m!1190887 () Bool)

(assert (=> b!1299786 m!1190887))

(declare-fun m!1190889 () Bool)

(assert (=> b!1299786 m!1190889))

(declare-fun m!1190891 () Bool)

(assert (=> b!1299786 m!1190891))

(assert (=> b!1299786 m!1190891))

(declare-fun m!1190893 () Bool)

(assert (=> b!1299786 m!1190893))

(declare-fun m!1190895 () Bool)

(assert (=> start!109730 m!1190895))

(declare-fun m!1190897 () Bool)

(assert (=> start!109730 m!1190897))

(declare-fun m!1190899 () Bool)

(assert (=> start!109730 m!1190899))

(declare-fun m!1190901 () Bool)

(assert (=> b!1299789 m!1190901))

(assert (=> b!1299789 m!1190901))

(declare-fun m!1190903 () Bool)

(assert (=> b!1299789 m!1190903))

(check-sat tp_is_empty!34803 (not b!1299788) (not b!1299787) (not b!1299786) (not start!109730) (not b_next!29163) b_and!47265 (not b!1299789) (not mapNonEmpty!53774) (not b!1299782))
(check-sat b_and!47265 (not b_next!29163))
