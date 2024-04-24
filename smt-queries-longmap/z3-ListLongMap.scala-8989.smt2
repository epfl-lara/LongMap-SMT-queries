; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108918 () Bool)

(assert start!108918)

(declare-fun b_free!28207 () Bool)

(declare-fun b_next!28207 () Bool)

(assert (=> start!108918 (= b_free!28207 (not b_next!28207))))

(declare-fun tp!99737 () Bool)

(declare-fun b_and!46275 () Bool)

(assert (=> start!108918 (= tp!99737 b_and!46275)))

(declare-fun b!1284469 () Bool)

(declare-fun res!852868 () Bool)

(declare-fun e!733961 () Bool)

(assert (=> b!1284469 (=> (not res!852868) (not e!733961))))

(declare-datatypes ((array!84787 0))(
  ( (array!84788 (arr!40891 (Array (_ BitVec 32) (_ BitVec 64))) (size!41442 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84787)

(declare-datatypes ((List!28998 0))(
  ( (Nil!28995) (Cons!28994 (h!30212 (_ BitVec 64)) (t!42534 List!28998)) )
))
(declare-fun arrayNoDuplicates!0 (array!84787 (_ BitVec 32) List!28998) Bool)

(assert (=> b!1284469 (= res!852868 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28995))))

(declare-fun b!1284470 () Bool)

(declare-fun res!852861 () Bool)

(assert (=> b!1284470 (=> (not res!852861) (not e!733961))))

(declare-datatypes ((V!50233 0))(
  ( (V!50234 (val!16998 Int)) )
))
(declare-fun minValue!1387 () V!50233)

(declare-fun zeroValue!1387 () V!50233)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16025 0))(
  ( (ValueCellFull!16025 (v!19595 V!50233)) (EmptyCell!16025) )
))
(declare-datatypes ((array!84789 0))(
  ( (array!84790 (arr!40892 (Array (_ BitVec 32) ValueCell!16025)) (size!41443 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84789)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21786 0))(
  ( (tuple2!21787 (_1!10904 (_ BitVec 64)) (_2!10904 V!50233)) )
))
(declare-datatypes ((List!28999 0))(
  ( (Nil!28996) (Cons!28995 (h!30213 tuple2!21786) (t!42535 List!28999)) )
))
(declare-datatypes ((ListLongMap!19451 0))(
  ( (ListLongMap!19452 (toList!9741 List!28999)) )
))
(declare-fun contains!7872 (ListLongMap!19451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4809 (array!84787 array!84789 (_ BitVec 32) (_ BitVec 32) V!50233 V!50233 (_ BitVec 32) Int) ListLongMap!19451)

(assert (=> b!1284470 (= res!852861 (contains!7872 (getCurrentListMap!4809 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284471 () Bool)

(declare-fun res!852860 () Bool)

(assert (=> b!1284471 (=> (not res!852860) (not e!733961))))

(assert (=> b!1284471 (= res!852860 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284472 () Bool)

(declare-fun res!852864 () Bool)

(assert (=> b!1284472 (=> (not res!852864) (not e!733961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84787 (_ BitVec 32)) Bool)

(assert (=> b!1284472 (= res!852864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284473 () Bool)

(declare-fun e!733958 () Bool)

(declare-fun e!733960 () Bool)

(declare-fun mapRes!52328 () Bool)

(assert (=> b!1284473 (= e!733958 (and e!733960 mapRes!52328))))

(declare-fun condMapEmpty!52328 () Bool)

(declare-fun mapDefault!52328 () ValueCell!16025)

(assert (=> b!1284473 (= condMapEmpty!52328 (= (arr!40892 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16025)) mapDefault!52328)))))

(declare-fun b!1284474 () Bool)

(declare-fun res!852866 () Bool)

(assert (=> b!1284474 (=> (not res!852866) (not e!733961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284474 (= res!852866 (validKeyInArray!0 (select (arr!40891 _keys!1741) from!2144)))))

(declare-fun b!1284475 () Bool)

(declare-fun tp_is_empty!33847 () Bool)

(assert (=> b!1284475 (= e!733960 tp_is_empty!33847)))

(declare-fun mapIsEmpty!52328 () Bool)

(assert (=> mapIsEmpty!52328 mapRes!52328))

(declare-fun b!1284476 () Bool)

(declare-fun e!733962 () Bool)

(assert (=> b!1284476 (= e!733962 tp_is_empty!33847)))

(declare-fun res!852862 () Bool)

(assert (=> start!108918 (=> (not res!852862) (not e!733961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108918 (= res!852862 (validMask!0 mask!2175))))

(assert (=> start!108918 e!733961))

(assert (=> start!108918 tp_is_empty!33847))

(assert (=> start!108918 true))

(declare-fun array_inv!31229 (array!84789) Bool)

(assert (=> start!108918 (and (array_inv!31229 _values!1445) e!733958)))

(declare-fun array_inv!31230 (array!84787) Bool)

(assert (=> start!108918 (array_inv!31230 _keys!1741)))

(assert (=> start!108918 tp!99737))

(declare-fun mapNonEmpty!52328 () Bool)

(declare-fun tp!99736 () Bool)

(assert (=> mapNonEmpty!52328 (= mapRes!52328 (and tp!99736 e!733962))))

(declare-fun mapKey!52328 () (_ BitVec 32))

(declare-fun mapValue!52328 () ValueCell!16025)

(declare-fun mapRest!52328 () (Array (_ BitVec 32) ValueCell!16025))

(assert (=> mapNonEmpty!52328 (= (arr!40892 _values!1445) (store mapRest!52328 mapKey!52328 mapValue!52328))))

(declare-fun b!1284477 () Bool)

(assert (=> b!1284477 (= e!733961 (not true))))

(declare-fun lt!577093 () ListLongMap!19451)

(assert (=> b!1284477 (contains!7872 lt!577093 k0!1205)))

(declare-datatypes ((Unit!42426 0))(
  ( (Unit!42427) )
))
(declare-fun lt!577094 () Unit!42426)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!3 ((_ BitVec 64) (_ BitVec 64) V!50233 ListLongMap!19451) Unit!42426)

(assert (=> b!1284477 (= lt!577094 (lemmaInListMapAfterAddingDiffThenInBefore!3 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577093))))

(declare-fun +!4328 (ListLongMap!19451 tuple2!21786) ListLongMap!19451)

(declare-fun getCurrentListMapNoExtraKeys!5960 (array!84787 array!84789 (_ BitVec 32) (_ BitVec 32) V!50233 V!50233 (_ BitVec 32) Int) ListLongMap!19451)

(assert (=> b!1284477 (= lt!577093 (+!4328 (getCurrentListMapNoExtraKeys!5960 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284478 () Bool)

(declare-fun res!852863 () Bool)

(assert (=> b!1284478 (=> (not res!852863) (not e!733961))))

(assert (=> b!1284478 (= res!852863 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41442 _keys!1741))))))

(declare-fun b!1284479 () Bool)

(declare-fun res!852867 () Bool)

(assert (=> b!1284479 (=> (not res!852867) (not e!733961))))

(assert (=> b!1284479 (= res!852867 (and (= (size!41443 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41442 _keys!1741) (size!41443 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284480 () Bool)

(declare-fun res!852865 () Bool)

(assert (=> b!1284480 (=> (not res!852865) (not e!733961))))

(assert (=> b!1284480 (= res!852865 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41442 _keys!1741))))))

(assert (= (and start!108918 res!852862) b!1284479))

(assert (= (and b!1284479 res!852867) b!1284472))

(assert (= (and b!1284472 res!852864) b!1284469))

(assert (= (and b!1284469 res!852868) b!1284480))

(assert (= (and b!1284480 res!852865) b!1284470))

(assert (= (and b!1284470 res!852861) b!1284478))

(assert (= (and b!1284478 res!852863) b!1284474))

(assert (= (and b!1284474 res!852866) b!1284471))

(assert (= (and b!1284471 res!852860) b!1284477))

(assert (= (and b!1284473 condMapEmpty!52328) mapIsEmpty!52328))

(assert (= (and b!1284473 (not condMapEmpty!52328)) mapNonEmpty!52328))

(get-info :version)

(assert (= (and mapNonEmpty!52328 ((_ is ValueCellFull!16025) mapValue!52328)) b!1284476))

(assert (= (and b!1284473 ((_ is ValueCellFull!16025) mapDefault!52328)) b!1284475))

(assert (= start!108918 b!1284473))

(declare-fun m!1178761 () Bool)

(assert (=> b!1284474 m!1178761))

(assert (=> b!1284474 m!1178761))

(declare-fun m!1178763 () Bool)

(assert (=> b!1284474 m!1178763))

(declare-fun m!1178765 () Bool)

(assert (=> b!1284469 m!1178765))

(declare-fun m!1178767 () Bool)

(assert (=> b!1284472 m!1178767))

(declare-fun m!1178769 () Bool)

(assert (=> b!1284470 m!1178769))

(assert (=> b!1284470 m!1178769))

(declare-fun m!1178771 () Bool)

(assert (=> b!1284470 m!1178771))

(declare-fun m!1178773 () Bool)

(assert (=> start!108918 m!1178773))

(declare-fun m!1178775 () Bool)

(assert (=> start!108918 m!1178775))

(declare-fun m!1178777 () Bool)

(assert (=> start!108918 m!1178777))

(declare-fun m!1178779 () Bool)

(assert (=> mapNonEmpty!52328 m!1178779))

(declare-fun m!1178781 () Bool)

(assert (=> b!1284477 m!1178781))

(declare-fun m!1178783 () Bool)

(assert (=> b!1284477 m!1178783))

(declare-fun m!1178785 () Bool)

(assert (=> b!1284477 m!1178785))

(assert (=> b!1284477 m!1178785))

(declare-fun m!1178787 () Bool)

(assert (=> b!1284477 m!1178787))

(check-sat (not mapNonEmpty!52328) (not b!1284470) (not start!108918) (not b!1284474) b_and!46275 (not b!1284472) (not b_next!28207) (not b!1284477) tp_is_empty!33847 (not b!1284469))
(check-sat b_and!46275 (not b_next!28207))
