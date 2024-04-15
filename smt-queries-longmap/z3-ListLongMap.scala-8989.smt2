; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108694 () Bool)

(assert start!108694)

(declare-fun b_free!28207 () Bool)

(declare-fun b_next!28207 () Bool)

(assert (=> start!108694 (= b_free!28207 (not b_next!28207))))

(declare-fun tp!99738 () Bool)

(declare-fun b_and!46255 () Bool)

(assert (=> start!108694 (= tp!99738 b_and!46255)))

(declare-fun b!1283101 () Bool)

(declare-fun e!733086 () Bool)

(declare-fun tp_is_empty!33847 () Bool)

(assert (=> b!1283101 (= e!733086 tp_is_empty!33847)))

(declare-fun b!1283102 () Bool)

(declare-fun res!852316 () Bool)

(declare-fun e!733085 () Bool)

(assert (=> b!1283102 (=> (not res!852316) (not e!733085))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84655 0))(
  ( (array!84656 (arr!40830 (Array (_ BitVec 32) (_ BitVec 64))) (size!41382 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84655)

(assert (=> b!1283102 (= res!852316 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41382 _keys!1741))))))

(declare-fun b!1283103 () Bool)

(declare-fun res!852321 () Bool)

(assert (=> b!1283103 (=> (not res!852321) (not e!733085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283103 (= res!852321 (validKeyInArray!0 (select (arr!40830 _keys!1741) from!2144)))))

(declare-fun b!1283104 () Bool)

(declare-fun res!852313 () Bool)

(assert (=> b!1283104 (=> (not res!852313) (not e!733085))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50233 0))(
  ( (V!50234 (val!16998 Int)) )
))
(declare-datatypes ((ValueCell!16025 0))(
  ( (ValueCellFull!16025 (v!19599 V!50233)) (EmptyCell!16025) )
))
(declare-datatypes ((array!84657 0))(
  ( (array!84658 (arr!40831 (Array (_ BitVec 32) ValueCell!16025)) (size!41383 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84657)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283104 (= res!852313 (and (= (size!41383 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41382 _keys!1741) (size!41383 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283105 () Bool)

(declare-fun res!852319 () Bool)

(assert (=> b!1283105 (=> (not res!852319) (not e!733085))))

(assert (=> b!1283105 (= res!852319 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41382 _keys!1741))))))

(declare-fun mapIsEmpty!52328 () Bool)

(declare-fun mapRes!52328 () Bool)

(assert (=> mapIsEmpty!52328 mapRes!52328))

(declare-fun b!1283106 () Bool)

(declare-fun res!852317 () Bool)

(assert (=> b!1283106 (=> (not res!852317) (not e!733085))))

(declare-datatypes ((List!29021 0))(
  ( (Nil!29018) (Cons!29017 (h!30226 (_ BitVec 64)) (t!42557 List!29021)) )
))
(declare-fun arrayNoDuplicates!0 (array!84655 (_ BitVec 32) List!29021) Bool)

(assert (=> b!1283106 (= res!852317 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29018))))

(declare-fun b!1283107 () Bool)

(declare-fun e!733082 () Bool)

(assert (=> b!1283107 (= e!733082 tp_is_empty!33847)))

(declare-fun res!852315 () Bool)

(assert (=> start!108694 (=> (not res!852315) (not e!733085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108694 (= res!852315 (validMask!0 mask!2175))))

(assert (=> start!108694 e!733085))

(assert (=> start!108694 tp_is_empty!33847))

(assert (=> start!108694 true))

(declare-fun e!733083 () Bool)

(declare-fun array_inv!31127 (array!84657) Bool)

(assert (=> start!108694 (and (array_inv!31127 _values!1445) e!733083)))

(declare-fun array_inv!31128 (array!84655) Bool)

(assert (=> start!108694 (array_inv!31128 _keys!1741)))

(assert (=> start!108694 tp!99738))

(declare-fun b!1283100 () Bool)

(declare-fun res!852320 () Bool)

(assert (=> b!1283100 (=> (not res!852320) (not e!733085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84655 (_ BitVec 32)) Bool)

(assert (=> b!1283100 (= res!852320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283108 () Bool)

(declare-fun res!852314 () Bool)

(assert (=> b!1283108 (=> (not res!852314) (not e!733085))))

(declare-fun minValue!1387 () V!50233)

(declare-fun zeroValue!1387 () V!50233)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21832 0))(
  ( (tuple2!21833 (_1!10927 (_ BitVec 64)) (_2!10927 V!50233)) )
))
(declare-datatypes ((List!29022 0))(
  ( (Nil!29019) (Cons!29018 (h!30227 tuple2!21832) (t!42558 List!29022)) )
))
(declare-datatypes ((ListLongMap!19489 0))(
  ( (ListLongMap!19490 (toList!9760 List!29022)) )
))
(declare-fun contains!7807 (ListLongMap!19489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4734 (array!84655 array!84657 (_ BitVec 32) (_ BitVec 32) V!50233 V!50233 (_ BitVec 32) Int) ListLongMap!19489)

(assert (=> b!1283108 (= res!852314 (contains!7807 (getCurrentListMap!4734 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52328 () Bool)

(declare-fun tp!99737 () Bool)

(assert (=> mapNonEmpty!52328 (= mapRes!52328 (and tp!99737 e!733082))))

(declare-fun mapValue!52328 () ValueCell!16025)

(declare-fun mapRest!52328 () (Array (_ BitVec 32) ValueCell!16025))

(declare-fun mapKey!52328 () (_ BitVec 32))

(assert (=> mapNonEmpty!52328 (= (arr!40831 _values!1445) (store mapRest!52328 mapKey!52328 mapValue!52328))))

(declare-fun b!1283109 () Bool)

(assert (=> b!1283109 (= e!733085 (not true))))

(declare-fun lt!576431 () ListLongMap!19489)

(assert (=> b!1283109 (contains!7807 lt!576431 k0!1205)))

(declare-datatypes ((Unit!42305 0))(
  ( (Unit!42306) )
))
(declare-fun lt!576432 () Unit!42305)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!3 ((_ BitVec 64) (_ BitVec 64) V!50233 ListLongMap!19489) Unit!42305)

(assert (=> b!1283109 (= lt!576432 (lemmaInListMapAfterAddingDiffThenInBefore!3 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576431))))

(declare-fun +!4318 (ListLongMap!19489 tuple2!21832) ListLongMap!19489)

(declare-fun getCurrentListMapNoExtraKeys!5949 (array!84655 array!84657 (_ BitVec 32) (_ BitVec 32) V!50233 V!50233 (_ BitVec 32) Int) ListLongMap!19489)

(assert (=> b!1283109 (= lt!576431 (+!4318 (getCurrentListMapNoExtraKeys!5949 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283110 () Bool)

(assert (=> b!1283110 (= e!733083 (and e!733086 mapRes!52328))))

(declare-fun condMapEmpty!52328 () Bool)

(declare-fun mapDefault!52328 () ValueCell!16025)

(assert (=> b!1283110 (= condMapEmpty!52328 (= (arr!40831 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16025)) mapDefault!52328)))))

(declare-fun b!1283111 () Bool)

(declare-fun res!852318 () Bool)

(assert (=> b!1283111 (=> (not res!852318) (not e!733085))))

(assert (=> b!1283111 (= res!852318 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108694 res!852315) b!1283104))

(assert (= (and b!1283104 res!852313) b!1283100))

(assert (= (and b!1283100 res!852320) b!1283106))

(assert (= (and b!1283106 res!852317) b!1283105))

(assert (= (and b!1283105 res!852319) b!1283108))

(assert (= (and b!1283108 res!852314) b!1283102))

(assert (= (and b!1283102 res!852316) b!1283103))

(assert (= (and b!1283103 res!852321) b!1283111))

(assert (= (and b!1283111 res!852318) b!1283109))

(assert (= (and b!1283110 condMapEmpty!52328) mapIsEmpty!52328))

(assert (= (and b!1283110 (not condMapEmpty!52328)) mapNonEmpty!52328))

(get-info :version)

(assert (= (and mapNonEmpty!52328 ((_ is ValueCellFull!16025) mapValue!52328)) b!1283107))

(assert (= (and b!1283110 ((_ is ValueCellFull!16025) mapDefault!52328)) b!1283101))

(assert (= start!108694 b!1283110))

(declare-fun m!1176649 () Bool)

(assert (=> start!108694 m!1176649))

(declare-fun m!1176651 () Bool)

(assert (=> start!108694 m!1176651))

(declare-fun m!1176653 () Bool)

(assert (=> start!108694 m!1176653))

(declare-fun m!1176655 () Bool)

(assert (=> b!1283108 m!1176655))

(assert (=> b!1283108 m!1176655))

(declare-fun m!1176657 () Bool)

(assert (=> b!1283108 m!1176657))

(declare-fun m!1176659 () Bool)

(assert (=> mapNonEmpty!52328 m!1176659))

(declare-fun m!1176661 () Bool)

(assert (=> b!1283106 m!1176661))

(declare-fun m!1176663 () Bool)

(assert (=> b!1283103 m!1176663))

(assert (=> b!1283103 m!1176663))

(declare-fun m!1176665 () Bool)

(assert (=> b!1283103 m!1176665))

(declare-fun m!1176667 () Bool)

(assert (=> b!1283109 m!1176667))

(declare-fun m!1176669 () Bool)

(assert (=> b!1283109 m!1176669))

(declare-fun m!1176671 () Bool)

(assert (=> b!1283109 m!1176671))

(assert (=> b!1283109 m!1176671))

(declare-fun m!1176673 () Bool)

(assert (=> b!1283109 m!1176673))

(declare-fun m!1176675 () Bool)

(assert (=> b!1283100 m!1176675))

(check-sat (not b!1283108) (not b_next!28207) (not start!108694) (not mapNonEmpty!52328) (not b!1283106) tp_is_empty!33847 (not b!1283103) (not b!1283100) (not b!1283109) b_and!46255)
(check-sat b_and!46255 (not b_next!28207))
