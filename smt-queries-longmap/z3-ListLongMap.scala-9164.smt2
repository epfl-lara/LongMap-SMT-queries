; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110058 () Bool)

(assert start!110058)

(declare-fun b_free!29257 () Bool)

(declare-fun b_next!29257 () Bool)

(assert (=> start!110058 (= b_free!29257 (not b_next!29257))))

(declare-fun tp!102922 () Bool)

(declare-fun b_and!47403 () Bool)

(assert (=> start!110058 (= tp!102922 b_and!47403)))

(declare-fun b!1303300 () Bool)

(declare-fun res!865641 () Bool)

(declare-fun e!743406 () Bool)

(assert (=> b!1303300 (=> (not res!865641) (not e!743406))))

(declare-datatypes ((array!86711 0))(
  ( (array!86712 (arr!41847 (Array (_ BitVec 32) (_ BitVec 64))) (size!42399 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86711)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86711 (_ BitVec 32)) Bool)

(assert (=> b!1303300 (= res!865641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303301 () Bool)

(declare-fun res!865643 () Bool)

(assert (=> b!1303301 (=> (not res!865643) (not e!743406))))

(declare-datatypes ((List!29780 0))(
  ( (Nil!29777) (Cons!29776 (h!30985 (_ BitVec 64)) (t!43366 List!29780)) )
))
(declare-fun arrayNoDuplicates!0 (array!86711 (_ BitVec 32) List!29780) Bool)

(assert (=> b!1303301 (= res!865643 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29777))))

(declare-fun res!865640 () Bool)

(assert (=> start!110058 (=> (not res!865640) (not e!743406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110058 (= res!865640 (validMask!0 mask!2175))))

(assert (=> start!110058 e!743406))

(declare-fun tp_is_empty!34897 () Bool)

(assert (=> start!110058 tp_is_empty!34897))

(assert (=> start!110058 true))

(declare-datatypes ((V!51633 0))(
  ( (V!51634 (val!17523 Int)) )
))
(declare-datatypes ((ValueCell!16550 0))(
  ( (ValueCellFull!16550 (v!20138 V!51633)) (EmptyCell!16550) )
))
(declare-datatypes ((array!86713 0))(
  ( (array!86714 (arr!41848 (Array (_ BitVec 32) ValueCell!16550)) (size!42400 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86713)

(declare-fun e!743405 () Bool)

(declare-fun array_inv!31833 (array!86713) Bool)

(assert (=> start!110058 (and (array_inv!31833 _values!1445) e!743405)))

(declare-fun array_inv!31834 (array!86711) Bool)

(assert (=> start!110058 (array_inv!31834 _keys!1741)))

(assert (=> start!110058 tp!102922))

(declare-fun b!1303302 () Bool)

(declare-fun res!865642 () Bool)

(assert (=> b!1303302 (=> (not res!865642) (not e!743406))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1303302 (= res!865642 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42399 _keys!1741))))))

(declare-fun b!1303303 () Bool)

(declare-fun res!865639 () Bool)

(assert (=> b!1303303 (=> (not res!865639) (not e!743406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303303 (= res!865639 (not (validKeyInArray!0 (select (arr!41847 _keys!1741) from!2144))))))

(declare-fun b!1303304 () Bool)

(declare-fun e!743403 () Bool)

(assert (=> b!1303304 (= e!743403 tp_is_empty!34897)))

(declare-fun b!1303305 () Bool)

(declare-fun res!865644 () Bool)

(assert (=> b!1303305 (=> (not res!865644) (not e!743406))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303305 (= res!865644 (and (= (size!42400 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42399 _keys!1741) (size!42400 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303306 () Bool)

(declare-fun e!743404 () Bool)

(assert (=> b!1303306 (= e!743404 tp_is_empty!34897)))

(declare-fun b!1303307 () Bool)

(declare-fun res!865638 () Bool)

(assert (=> b!1303307 (=> (not res!865638) (not e!743406))))

(assert (=> b!1303307 (= res!865638 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42399 _keys!1741))))))

(declare-fun b!1303308 () Bool)

(declare-fun e!743407 () Bool)

(assert (=> b!1303308 (= e!743406 (not e!743407))))

(declare-fun res!865637 () Bool)

(assert (=> b!1303308 (=> res!865637 e!743407)))

(assert (=> b!1303308 (= res!865637 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22670 0))(
  ( (tuple2!22671 (_1!11346 (_ BitVec 64)) (_2!11346 V!51633)) )
))
(declare-datatypes ((List!29781 0))(
  ( (Nil!29778) (Cons!29777 (h!30986 tuple2!22670) (t!43367 List!29781)) )
))
(declare-datatypes ((ListLongMap!20327 0))(
  ( (ListLongMap!20328 (toList!10179 List!29781)) )
))
(declare-fun contains!8243 (ListLongMap!20327 (_ BitVec 64)) Bool)

(assert (=> b!1303308 (not (contains!8243 (ListLongMap!20328 Nil!29778) k0!1205))))

(declare-datatypes ((Unit!42997 0))(
  ( (Unit!42998) )
))
(declare-fun lt!583070 () Unit!42997)

(declare-fun emptyContainsNothing!210 ((_ BitVec 64)) Unit!42997)

(assert (=> b!1303308 (= lt!583070 (emptyContainsNothing!210 k0!1205))))

(declare-fun b!1303309 () Bool)

(assert (=> b!1303309 (= e!743407 true)))

(assert (=> b!1303309 false))

(declare-fun minValue!1387 () V!51633)

(declare-fun lt!583067 () Unit!42997)

(declare-fun lt!583069 () ListLongMap!20327)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!91 ((_ BitVec 64) (_ BitVec 64) V!51633 ListLongMap!20327) Unit!42997)

(assert (=> b!1303309 (= lt!583067 (lemmaInListMapAfterAddingDiffThenInBefore!91 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583069))))

(declare-fun lt!583071 () ListLongMap!20327)

(declare-fun +!4511 (ListLongMap!20327 tuple2!22670) ListLongMap!20327)

(assert (=> b!1303309 (not (contains!8243 (+!4511 lt!583071 (tuple2!22671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583068 () Unit!42997)

(declare-fun addStillNotContains!464 (ListLongMap!20327 (_ BitVec 64) V!51633 (_ BitVec 64)) Unit!42997)

(assert (=> b!1303309 (= lt!583068 (addStillNotContains!464 lt!583071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303309 (not (contains!8243 lt!583069 k0!1205))))

(declare-fun zeroValue!1387 () V!51633)

(assert (=> b!1303309 (= lt!583069 (+!4511 lt!583071 (tuple2!22671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583066 () Unit!42997)

(assert (=> b!1303309 (= lt!583066 (addStillNotContains!464 lt!583071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6143 (array!86711 array!86713 (_ BitVec 32) (_ BitVec 32) V!51633 V!51633 (_ BitVec 32) Int) ListLongMap!20327)

(assert (=> b!1303309 (= lt!583071 (getCurrentListMapNoExtraKeys!6143 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53938 () Bool)

(declare-fun mapRes!53938 () Bool)

(declare-fun tp!102923 () Bool)

(assert (=> mapNonEmpty!53938 (= mapRes!53938 (and tp!102923 e!743404))))

(declare-fun mapRest!53938 () (Array (_ BitVec 32) ValueCell!16550))

(declare-fun mapKey!53938 () (_ BitVec 32))

(declare-fun mapValue!53938 () ValueCell!16550)

(assert (=> mapNonEmpty!53938 (= (arr!41848 _values!1445) (store mapRest!53938 mapKey!53938 mapValue!53938))))

(declare-fun b!1303310 () Bool)

(assert (=> b!1303310 (= e!743405 (and e!743403 mapRes!53938))))

(declare-fun condMapEmpty!53938 () Bool)

(declare-fun mapDefault!53938 () ValueCell!16550)

(assert (=> b!1303310 (= condMapEmpty!53938 (= (arr!41848 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16550)) mapDefault!53938)))))

(declare-fun b!1303311 () Bool)

(declare-fun res!865645 () Bool)

(assert (=> b!1303311 (=> (not res!865645) (not e!743406))))

(declare-fun getCurrentListMap!5083 (array!86711 array!86713 (_ BitVec 32) (_ BitVec 32) V!51633 V!51633 (_ BitVec 32) Int) ListLongMap!20327)

(assert (=> b!1303311 (= res!865645 (contains!8243 (getCurrentListMap!5083 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53938 () Bool)

(assert (=> mapIsEmpty!53938 mapRes!53938))

(assert (= (and start!110058 res!865640) b!1303305))

(assert (= (and b!1303305 res!865644) b!1303300))

(assert (= (and b!1303300 res!865641) b!1303301))

(assert (= (and b!1303301 res!865643) b!1303307))

(assert (= (and b!1303307 res!865638) b!1303311))

(assert (= (and b!1303311 res!865645) b!1303302))

(assert (= (and b!1303302 res!865642) b!1303303))

(assert (= (and b!1303303 res!865639) b!1303308))

(assert (= (and b!1303308 (not res!865637)) b!1303309))

(assert (= (and b!1303310 condMapEmpty!53938) mapIsEmpty!53938))

(assert (= (and b!1303310 (not condMapEmpty!53938)) mapNonEmpty!53938))

(get-info :version)

(assert (= (and mapNonEmpty!53938 ((_ is ValueCellFull!16550) mapValue!53938)) b!1303306))

(assert (= (and b!1303310 ((_ is ValueCellFull!16550) mapDefault!53938)) b!1303304))

(assert (= start!110058 b!1303310))

(declare-fun m!1193755 () Bool)

(assert (=> start!110058 m!1193755))

(declare-fun m!1193757 () Bool)

(assert (=> start!110058 m!1193757))

(declare-fun m!1193759 () Bool)

(assert (=> start!110058 m!1193759))

(declare-fun m!1193761 () Bool)

(assert (=> b!1303300 m!1193761))

(declare-fun m!1193763 () Bool)

(assert (=> b!1303301 m!1193763))

(declare-fun m!1193765 () Bool)

(assert (=> b!1303309 m!1193765))

(declare-fun m!1193767 () Bool)

(assert (=> b!1303309 m!1193767))

(declare-fun m!1193769 () Bool)

(assert (=> b!1303309 m!1193769))

(declare-fun m!1193771 () Bool)

(assert (=> b!1303309 m!1193771))

(declare-fun m!1193773 () Bool)

(assert (=> b!1303309 m!1193773))

(assert (=> b!1303309 m!1193773))

(declare-fun m!1193775 () Bool)

(assert (=> b!1303309 m!1193775))

(declare-fun m!1193777 () Bool)

(assert (=> b!1303309 m!1193777))

(declare-fun m!1193779 () Bool)

(assert (=> b!1303309 m!1193779))

(declare-fun m!1193781 () Bool)

(assert (=> b!1303303 m!1193781))

(assert (=> b!1303303 m!1193781))

(declare-fun m!1193783 () Bool)

(assert (=> b!1303303 m!1193783))

(declare-fun m!1193785 () Bool)

(assert (=> mapNonEmpty!53938 m!1193785))

(declare-fun m!1193787 () Bool)

(assert (=> b!1303308 m!1193787))

(declare-fun m!1193789 () Bool)

(assert (=> b!1303308 m!1193789))

(declare-fun m!1193791 () Bool)

(assert (=> b!1303311 m!1193791))

(assert (=> b!1303311 m!1193791))

(declare-fun m!1193793 () Bool)

(assert (=> b!1303311 m!1193793))

(check-sat (not b!1303301) (not b!1303303) (not mapNonEmpty!53938) (not b!1303311) (not b!1303309) (not b_next!29257) (not b!1303300) (not start!110058) b_and!47403 tp_is_empty!34897 (not b!1303308))
(check-sat b_and!47403 (not b_next!29257))
