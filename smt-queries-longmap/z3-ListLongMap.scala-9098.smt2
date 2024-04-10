; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109374 () Bool)

(assert start!109374)

(declare-fun b_free!28863 () Bool)

(declare-fun b_next!28863 () Bool)

(assert (=> start!109374 (= b_free!28863 (not b_next!28863))))

(declare-fun tp!101708 () Bool)

(declare-fun b_and!46953 () Bool)

(assert (=> start!109374 (= tp!101708 b_and!46953)))

(declare-fun b!1294668 () Bool)

(declare-fun res!860405 () Bool)

(declare-fun e!738754 () Bool)

(assert (=> b!1294668 (=> (not res!860405) (not e!738754))))

(declare-datatypes ((V!51107 0))(
  ( (V!51108 (val!17326 Int)) )
))
(declare-fun minValue!1387 () V!51107)

(declare-fun zeroValue!1387 () V!51107)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86026 0))(
  ( (array!86027 (arr!41514 (Array (_ BitVec 32) (_ BitVec 64))) (size!42064 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86026)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16353 0))(
  ( (ValueCellFull!16353 (v!19929 V!51107)) (EmptyCell!16353) )
))
(declare-datatypes ((array!86028 0))(
  ( (array!86029 (arr!41515 (Array (_ BitVec 32) ValueCell!16353)) (size!42065 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86028)

(declare-datatypes ((tuple2!22306 0))(
  ( (tuple2!22307 (_1!11164 (_ BitVec 64)) (_2!11164 V!51107)) )
))
(declare-datatypes ((List!29449 0))(
  ( (Nil!29446) (Cons!29445 (h!30654 tuple2!22306) (t!43013 List!29449)) )
))
(declare-datatypes ((ListLongMap!19963 0))(
  ( (ListLongMap!19964 (toList!9997 List!29449)) )
))
(declare-fun contains!8115 (ListLongMap!19963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5034 (array!86026 array!86028 (_ BitVec 32) (_ BitVec 32) V!51107 V!51107 (_ BitVec 32) Int) ListLongMap!19963)

(assert (=> b!1294668 (= res!860405 (contains!8115 (getCurrentListMap!5034 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294669 () Bool)

(declare-fun res!860403 () Bool)

(assert (=> b!1294669 (=> (not res!860403) (not e!738754))))

(assert (=> b!1294669 (= res!860403 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42064 _keys!1741))))))

(declare-fun mapNonEmpty!53315 () Bool)

(declare-fun mapRes!53315 () Bool)

(declare-fun tp!101707 () Bool)

(declare-fun e!738757 () Bool)

(assert (=> mapNonEmpty!53315 (= mapRes!53315 (and tp!101707 e!738757))))

(declare-fun mapKey!53315 () (_ BitVec 32))

(declare-fun mapValue!53315 () ValueCell!16353)

(declare-fun mapRest!53315 () (Array (_ BitVec 32) ValueCell!16353))

(assert (=> mapNonEmpty!53315 (= (arr!41515 _values!1445) (store mapRest!53315 mapKey!53315 mapValue!53315))))

(declare-fun b!1294670 () Bool)

(declare-fun res!860404 () Bool)

(assert (=> b!1294670 (=> (not res!860404) (not e!738754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86026 (_ BitVec 32)) Bool)

(assert (=> b!1294670 (= res!860404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294671 () Bool)

(declare-fun res!860406 () Bool)

(assert (=> b!1294671 (=> (not res!860406) (not e!738754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294671 (= res!860406 (not (validKeyInArray!0 (select (arr!41514 _keys!1741) from!2144))))))

(declare-fun b!1294673 () Bool)

(declare-fun tp_is_empty!34503 () Bool)

(assert (=> b!1294673 (= e!738757 tp_is_empty!34503)))

(declare-fun b!1294674 () Bool)

(declare-fun res!860408 () Bool)

(assert (=> b!1294674 (=> (not res!860408) (not e!738754))))

(assert (=> b!1294674 (= res!860408 (and (= (size!42065 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42064 _keys!1741) (size!42065 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294675 () Bool)

(declare-fun res!860402 () Bool)

(assert (=> b!1294675 (=> (not res!860402) (not e!738754))))

(assert (=> b!1294675 (= res!860402 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42064 _keys!1741))))))

(declare-fun mapIsEmpty!53315 () Bool)

(assert (=> mapIsEmpty!53315 mapRes!53315))

(declare-fun b!1294676 () Bool)

(declare-fun e!738758 () Bool)

(declare-fun e!738755 () Bool)

(assert (=> b!1294676 (= e!738758 (and e!738755 mapRes!53315))))

(declare-fun condMapEmpty!53315 () Bool)

(declare-fun mapDefault!53315 () ValueCell!16353)

(assert (=> b!1294676 (= condMapEmpty!53315 (= (arr!41515 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16353)) mapDefault!53315)))))

(declare-fun res!860407 () Bool)

(assert (=> start!109374 (=> (not res!860407) (not e!738754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109374 (= res!860407 (validMask!0 mask!2175))))

(assert (=> start!109374 e!738754))

(assert (=> start!109374 tp_is_empty!34503))

(assert (=> start!109374 true))

(declare-fun array_inv!31439 (array!86028) Bool)

(assert (=> start!109374 (and (array_inv!31439 _values!1445) e!738758)))

(declare-fun array_inv!31440 (array!86026) Bool)

(assert (=> start!109374 (array_inv!31440 _keys!1741)))

(assert (=> start!109374 tp!101708))

(declare-fun b!1294672 () Bool)

(declare-fun res!860409 () Bool)

(assert (=> b!1294672 (=> (not res!860409) (not e!738754))))

(declare-datatypes ((List!29450 0))(
  ( (Nil!29447) (Cons!29446 (h!30655 (_ BitVec 64)) (t!43014 List!29450)) )
))
(declare-fun arrayNoDuplicates!0 (array!86026 (_ BitVec 32) List!29450) Bool)

(assert (=> b!1294672 (= res!860409 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29447))))

(declare-fun b!1294677 () Bool)

(assert (=> b!1294677 (= e!738754 (not true))))

(assert (=> b!1294677 (not (contains!8115 (ListLongMap!19964 Nil!29446) k0!1205))))

(declare-datatypes ((Unit!42880 0))(
  ( (Unit!42881) )
))
(declare-fun lt!579737 () Unit!42880)

(declare-fun emptyContainsNothing!161 ((_ BitVec 64)) Unit!42880)

(assert (=> b!1294677 (= lt!579737 (emptyContainsNothing!161 k0!1205))))

(declare-fun b!1294678 () Bool)

(assert (=> b!1294678 (= e!738755 tp_is_empty!34503)))

(assert (= (and start!109374 res!860407) b!1294674))

(assert (= (and b!1294674 res!860408) b!1294670))

(assert (= (and b!1294670 res!860404) b!1294672))

(assert (= (and b!1294672 res!860409) b!1294675))

(assert (= (and b!1294675 res!860402) b!1294668))

(assert (= (and b!1294668 res!860405) b!1294669))

(assert (= (and b!1294669 res!860403) b!1294671))

(assert (= (and b!1294671 res!860406) b!1294677))

(assert (= (and b!1294676 condMapEmpty!53315) mapIsEmpty!53315))

(assert (= (and b!1294676 (not condMapEmpty!53315)) mapNonEmpty!53315))

(get-info :version)

(assert (= (and mapNonEmpty!53315 ((_ is ValueCellFull!16353) mapValue!53315)) b!1294673))

(assert (= (and b!1294676 ((_ is ValueCellFull!16353) mapDefault!53315)) b!1294678))

(assert (= start!109374 b!1294676))

(declare-fun m!1186811 () Bool)

(assert (=> b!1294670 m!1186811))

(declare-fun m!1186813 () Bool)

(assert (=> b!1294677 m!1186813))

(declare-fun m!1186815 () Bool)

(assert (=> b!1294677 m!1186815))

(declare-fun m!1186817 () Bool)

(assert (=> b!1294671 m!1186817))

(assert (=> b!1294671 m!1186817))

(declare-fun m!1186819 () Bool)

(assert (=> b!1294671 m!1186819))

(declare-fun m!1186821 () Bool)

(assert (=> start!109374 m!1186821))

(declare-fun m!1186823 () Bool)

(assert (=> start!109374 m!1186823))

(declare-fun m!1186825 () Bool)

(assert (=> start!109374 m!1186825))

(declare-fun m!1186827 () Bool)

(assert (=> b!1294668 m!1186827))

(assert (=> b!1294668 m!1186827))

(declare-fun m!1186829 () Bool)

(assert (=> b!1294668 m!1186829))

(declare-fun m!1186831 () Bool)

(assert (=> b!1294672 m!1186831))

(declare-fun m!1186833 () Bool)

(assert (=> mapNonEmpty!53315 m!1186833))

(check-sat (not b_next!28863) (not mapNonEmpty!53315) (not b!1294672) (not start!109374) (not b!1294671) tp_is_empty!34503 b_and!46953 (not b!1294677) (not b!1294670) (not b!1294668))
(check-sat b_and!46953 (not b_next!28863))
