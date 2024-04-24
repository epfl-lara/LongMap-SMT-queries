; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110282 () Bool)

(assert start!110282)

(declare-fun b_free!29257 () Bool)

(declare-fun b_next!29257 () Bool)

(assert (=> start!110282 (= b_free!29257 (not b_next!29257))))

(declare-fun tp!102922 () Bool)

(declare-fun b_and!47423 () Bool)

(assert (=> start!110282 (= tp!102922 b_and!47423)))

(declare-fun b!1304669 () Bool)

(declare-fun e!744282 () Bool)

(assert (=> b!1304669 (= e!744282 true)))

(assert (=> b!1304669 false))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!43122 0))(
  ( (Unit!43123) )
))
(declare-fun lt!583730 () Unit!43122)

(declare-datatypes ((V!51633 0))(
  ( (V!51634 (val!17523 Int)) )
))
(declare-fun minValue!1387 () V!51633)

(declare-datatypes ((tuple2!22632 0))(
  ( (tuple2!22633 (_1!11327 (_ BitVec 64)) (_2!11327 V!51633)) )
))
(declare-datatypes ((List!29780 0))(
  ( (Nil!29777) (Cons!29776 (h!30994 tuple2!22632) (t!43366 List!29780)) )
))
(declare-datatypes ((ListLongMap!20297 0))(
  ( (ListLongMap!20298 (toList!10164 List!29780)) )
))
(declare-fun lt!583733 () ListLongMap!20297)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!94 ((_ BitVec 64) (_ BitVec 64) V!51633 ListLongMap!20297) Unit!43122)

(assert (=> b!1304669 (= lt!583730 (lemmaInListMapAfterAddingDiffThenInBefore!94 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583733))))

(declare-fun lt!583731 () ListLongMap!20297)

(declare-fun contains!8312 (ListLongMap!20297 (_ BitVec 64)) Bool)

(declare-fun +!4525 (ListLongMap!20297 tuple2!22632) ListLongMap!20297)

(assert (=> b!1304669 (not (contains!8312 (+!4525 lt!583731 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583732 () Unit!43122)

(declare-fun addStillNotContains!476 (ListLongMap!20297 (_ BitVec 64) V!51633 (_ BitVec 64)) Unit!43122)

(assert (=> b!1304669 (= lt!583732 (addStillNotContains!476 lt!583731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1304669 (not (contains!8312 lt!583733 k0!1205))))

(declare-fun zeroValue!1387 () V!51633)

(assert (=> b!1304669 (= lt!583733 (+!4525 lt!583731 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583728 () Unit!43122)

(assert (=> b!1304669 (= lt!583728 (addStillNotContains!476 lt!583731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16550 0))(
  ( (ValueCellFull!16550 (v!20134 V!51633)) (EmptyCell!16550) )
))
(declare-datatypes ((array!86847 0))(
  ( (array!86848 (arr!41910 (Array (_ BitVec 32) ValueCell!16550)) (size!42461 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86847)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86849 0))(
  ( (array!86850 (arr!41911 (Array (_ BitVec 32) (_ BitVec 64))) (size!42462 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86849)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6163 (array!86849 array!86847 (_ BitVec 32) (_ BitVec 32) V!51633 V!51633 (_ BitVec 32) Int) ListLongMap!20297)

(assert (=> b!1304669 (= lt!583731 (getCurrentListMapNoExtraKeys!6163 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53938 () Bool)

(declare-fun mapRes!53938 () Bool)

(declare-fun tp!102921 () Bool)

(declare-fun e!744281 () Bool)

(assert (=> mapNonEmpty!53938 (= mapRes!53938 (and tp!102921 e!744281))))

(declare-fun mapRest!53938 () (Array (_ BitVec 32) ValueCell!16550))

(declare-fun mapValue!53938 () ValueCell!16550)

(declare-fun mapKey!53938 () (_ BitVec 32))

(assert (=> mapNonEmpty!53938 (= (arr!41910 _values!1445) (store mapRest!53938 mapKey!53938 mapValue!53938))))

(declare-fun b!1304670 () Bool)

(declare-fun res!866184 () Bool)

(declare-fun e!744279 () Bool)

(assert (=> b!1304670 (=> (not res!866184) (not e!744279))))

(assert (=> b!1304670 (= res!866184 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42462 _keys!1741))))))

(declare-fun b!1304671 () Bool)

(declare-fun res!866185 () Bool)

(assert (=> b!1304671 (=> (not res!866185) (not e!744279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304671 (= res!866185 (not (validKeyInArray!0 (select (arr!41911 _keys!1741) from!2144))))))

(declare-fun b!1304672 () Bool)

(declare-fun res!866186 () Bool)

(assert (=> b!1304672 (=> (not res!866186) (not e!744279))))

(declare-datatypes ((List!29781 0))(
  ( (Nil!29778) (Cons!29777 (h!30995 (_ BitVec 64)) (t!43367 List!29781)) )
))
(declare-fun arrayNoDuplicates!0 (array!86849 (_ BitVec 32) List!29781) Bool)

(assert (=> b!1304672 (= res!866186 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29778))))

(declare-fun b!1304673 () Bool)

(declare-fun res!866190 () Bool)

(assert (=> b!1304673 (=> (not res!866190) (not e!744279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86849 (_ BitVec 32)) Bool)

(assert (=> b!1304673 (= res!866190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304674 () Bool)

(declare-fun res!866188 () Bool)

(assert (=> b!1304674 (=> (not res!866188) (not e!744279))))

(assert (=> b!1304674 (= res!866188 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42462 _keys!1741))))))

(declare-fun b!1304675 () Bool)

(declare-fun e!744278 () Bool)

(declare-fun tp_is_empty!34897 () Bool)

(assert (=> b!1304675 (= e!744278 tp_is_empty!34897)))

(declare-fun b!1304676 () Bool)

(assert (=> b!1304676 (= e!744281 tp_is_empty!34897)))

(declare-fun b!1304677 () Bool)

(declare-fun res!866191 () Bool)

(assert (=> b!1304677 (=> (not res!866191) (not e!744279))))

(declare-fun getCurrentListMap!5175 (array!86849 array!86847 (_ BitVec 32) (_ BitVec 32) V!51633 V!51633 (_ BitVec 32) Int) ListLongMap!20297)

(assert (=> b!1304677 (= res!866191 (contains!8312 (getCurrentListMap!5175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304678 () Bool)

(declare-fun res!866192 () Bool)

(assert (=> b!1304678 (=> (not res!866192) (not e!744279))))

(assert (=> b!1304678 (= res!866192 (and (= (size!42461 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42462 _keys!1741) (size!42461 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!866187 () Bool)

(assert (=> start!110282 (=> (not res!866187) (not e!744279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110282 (= res!866187 (validMask!0 mask!2175))))

(assert (=> start!110282 e!744279))

(assert (=> start!110282 tp_is_empty!34897))

(assert (=> start!110282 true))

(declare-fun e!744280 () Bool)

(declare-fun array_inv!31947 (array!86847) Bool)

(assert (=> start!110282 (and (array_inv!31947 _values!1445) e!744280)))

(declare-fun array_inv!31948 (array!86849) Bool)

(assert (=> start!110282 (array_inv!31948 _keys!1741)))

(assert (=> start!110282 tp!102922))

(declare-fun b!1304679 () Bool)

(assert (=> b!1304679 (= e!744280 (and e!744278 mapRes!53938))))

(declare-fun condMapEmpty!53938 () Bool)

(declare-fun mapDefault!53938 () ValueCell!16550)

(assert (=> b!1304679 (= condMapEmpty!53938 (= (arr!41910 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16550)) mapDefault!53938)))))

(declare-fun b!1304680 () Bool)

(assert (=> b!1304680 (= e!744279 (not e!744282))))

(declare-fun res!866189 () Bool)

(assert (=> b!1304680 (=> res!866189 e!744282)))

(assert (=> b!1304680 (= res!866189 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304680 (not (contains!8312 (ListLongMap!20298 Nil!29777) k0!1205))))

(declare-fun lt!583729 () Unit!43122)

(declare-fun emptyContainsNothing!218 ((_ BitVec 64)) Unit!43122)

(assert (=> b!1304680 (= lt!583729 (emptyContainsNothing!218 k0!1205))))

(declare-fun mapIsEmpty!53938 () Bool)

(assert (=> mapIsEmpty!53938 mapRes!53938))

(assert (= (and start!110282 res!866187) b!1304678))

(assert (= (and b!1304678 res!866192) b!1304673))

(assert (= (and b!1304673 res!866190) b!1304672))

(assert (= (and b!1304672 res!866186) b!1304674))

(assert (= (and b!1304674 res!866188) b!1304677))

(assert (= (and b!1304677 res!866191) b!1304670))

(assert (= (and b!1304670 res!866184) b!1304671))

(assert (= (and b!1304671 res!866185) b!1304680))

(assert (= (and b!1304680 (not res!866189)) b!1304669))

(assert (= (and b!1304679 condMapEmpty!53938) mapIsEmpty!53938))

(assert (= (and b!1304679 (not condMapEmpty!53938)) mapNonEmpty!53938))

(get-info :version)

(assert (= (and mapNonEmpty!53938 ((_ is ValueCellFull!16550) mapValue!53938)) b!1304676))

(assert (= (and b!1304679 ((_ is ValueCellFull!16550) mapDefault!53938)) b!1304675))

(assert (= start!110282 b!1304679))

(declare-fun m!1195869 () Bool)

(assert (=> b!1304677 m!1195869))

(assert (=> b!1304677 m!1195869))

(declare-fun m!1195871 () Bool)

(assert (=> b!1304677 m!1195871))

(declare-fun m!1195873 () Bool)

(assert (=> b!1304672 m!1195873))

(declare-fun m!1195875 () Bool)

(assert (=> b!1304680 m!1195875))

(declare-fun m!1195877 () Bool)

(assert (=> b!1304680 m!1195877))

(declare-fun m!1195879 () Bool)

(assert (=> b!1304673 m!1195879))

(declare-fun m!1195881 () Bool)

(assert (=> mapNonEmpty!53938 m!1195881))

(declare-fun m!1195883 () Bool)

(assert (=> b!1304671 m!1195883))

(assert (=> b!1304671 m!1195883))

(declare-fun m!1195885 () Bool)

(assert (=> b!1304671 m!1195885))

(declare-fun m!1195887 () Bool)

(assert (=> b!1304669 m!1195887))

(declare-fun m!1195889 () Bool)

(assert (=> b!1304669 m!1195889))

(declare-fun m!1195891 () Bool)

(assert (=> b!1304669 m!1195891))

(assert (=> b!1304669 m!1195887))

(declare-fun m!1195893 () Bool)

(assert (=> b!1304669 m!1195893))

(declare-fun m!1195895 () Bool)

(assert (=> b!1304669 m!1195895))

(declare-fun m!1195897 () Bool)

(assert (=> b!1304669 m!1195897))

(declare-fun m!1195899 () Bool)

(assert (=> b!1304669 m!1195899))

(declare-fun m!1195901 () Bool)

(assert (=> b!1304669 m!1195901))

(declare-fun m!1195903 () Bool)

(assert (=> start!110282 m!1195903))

(declare-fun m!1195905 () Bool)

(assert (=> start!110282 m!1195905))

(declare-fun m!1195907 () Bool)

(assert (=> start!110282 m!1195907))

(check-sat (not b!1304673) (not b!1304677) b_and!47423 (not b!1304672) (not mapNonEmpty!53938) (not b_next!29257) (not b!1304671) tp_is_empty!34897 (not b!1304669) (not b!1304680) (not start!110282))
(check-sat b_and!47423 (not b_next!29257))
