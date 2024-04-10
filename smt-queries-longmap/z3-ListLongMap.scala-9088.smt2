; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109314 () Bool)

(assert start!109314)

(declare-fun b_free!28803 () Bool)

(declare-fun b_next!28803 () Bool)

(assert (=> start!109314 (= b_free!28803 (not b_next!28803))))

(declare-fun tp!101528 () Bool)

(declare-fun b_and!46893 () Bool)

(assert (=> start!109314 (= tp!101528 b_and!46893)))

(declare-fun b!1293656 () Bool)

(declare-fun e!738283 () Bool)

(declare-fun e!738286 () Bool)

(assert (=> b!1293656 (= e!738283 (not e!738286))))

(declare-fun res!859666 () Bool)

(assert (=> b!1293656 (=> res!859666 e!738286)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293656 (= res!859666 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51027 0))(
  ( (V!51028 (val!17296 Int)) )
))
(declare-datatypes ((tuple2!22262 0))(
  ( (tuple2!22263 (_1!11142 (_ BitVec 64)) (_2!11142 V!51027)) )
))
(declare-datatypes ((List!29409 0))(
  ( (Nil!29406) (Cons!29405 (h!30614 tuple2!22262) (t!42973 List!29409)) )
))
(declare-datatypes ((ListLongMap!19919 0))(
  ( (ListLongMap!19920 (toList!9975 List!29409)) )
))
(declare-fun contains!8093 (ListLongMap!19919 (_ BitVec 64)) Bool)

(assert (=> b!1293656 (not (contains!8093 (ListLongMap!19920 Nil!29406) k0!1205))))

(declare-datatypes ((Unit!42844 0))(
  ( (Unit!42845) )
))
(declare-fun lt!579605 () Unit!42844)

(declare-fun emptyContainsNothing!143 ((_ BitVec 64)) Unit!42844)

(assert (=> b!1293656 (= lt!579605 (emptyContainsNothing!143 k0!1205))))

(declare-fun b!1293657 () Bool)

(declare-fun res!859661 () Bool)

(assert (=> b!1293657 (=> (not res!859661) (not e!738283))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85914 0))(
  ( (array!85915 (arr!41458 (Array (_ BitVec 32) (_ BitVec 64))) (size!42008 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85914)

(assert (=> b!1293657 (= res!859661 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42008 _keys!1741))))))

(declare-fun b!1293658 () Bool)

(assert (=> b!1293658 (= e!738286 (bvsle from!2144 (size!42008 _keys!1741)))))

(declare-fun lt!579603 () ListLongMap!19919)

(declare-fun zeroValue!1387 () V!51027)

(declare-fun +!4404 (ListLongMap!19919 tuple2!22262) ListLongMap!19919)

(assert (=> b!1293658 (not (contains!8093 (+!4404 lt!579603 (tuple2!22263 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579604 () Unit!42844)

(declare-fun addStillNotContains!422 (ListLongMap!19919 (_ BitVec 64) V!51027 (_ BitVec 64)) Unit!42844)

(assert (=> b!1293658 (= lt!579604 (addStillNotContains!422 lt!579603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-datatypes ((ValueCell!16323 0))(
  ( (ValueCellFull!16323 (v!19899 V!51027)) (EmptyCell!16323) )
))
(declare-datatypes ((array!85916 0))(
  ( (array!85917 (arr!41459 (Array (_ BitVec 32) ValueCell!16323)) (size!42009 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85916)

(declare-fun minValue!1387 () V!51027)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6036 (array!85914 array!85916 (_ BitVec 32) (_ BitVec 32) V!51027 V!51027 (_ BitVec 32) Int) ListLongMap!19919)

(assert (=> b!1293658 (= lt!579603 (getCurrentListMapNoExtraKeys!6036 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293659 () Bool)

(declare-fun res!859665 () Bool)

(assert (=> b!1293659 (=> (not res!859665) (not e!738283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85914 (_ BitVec 32)) Bool)

(assert (=> b!1293659 (= res!859665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!859660 () Bool)

(assert (=> start!109314 (=> (not res!859660) (not e!738283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109314 (= res!859660 (validMask!0 mask!2175))))

(assert (=> start!109314 e!738283))

(declare-fun tp_is_empty!34443 () Bool)

(assert (=> start!109314 tp_is_empty!34443))

(assert (=> start!109314 true))

(declare-fun e!738287 () Bool)

(declare-fun array_inv!31403 (array!85916) Bool)

(assert (=> start!109314 (and (array_inv!31403 _values!1445) e!738287)))

(declare-fun array_inv!31404 (array!85914) Bool)

(assert (=> start!109314 (array_inv!31404 _keys!1741)))

(assert (=> start!109314 tp!101528))

(declare-fun b!1293660 () Bool)

(declare-fun e!738282 () Bool)

(assert (=> b!1293660 (= e!738282 tp_is_empty!34443)))

(declare-fun b!1293661 () Bool)

(declare-fun e!738285 () Bool)

(assert (=> b!1293661 (= e!738285 tp_is_empty!34443)))

(declare-fun b!1293662 () Bool)

(declare-fun res!859667 () Bool)

(assert (=> b!1293662 (=> (not res!859667) (not e!738283))))

(assert (=> b!1293662 (= res!859667 (and (= (size!42009 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42008 _keys!1741) (size!42009 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293663 () Bool)

(declare-fun res!859663 () Bool)

(assert (=> b!1293663 (=> (not res!859663) (not e!738283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293663 (= res!859663 (not (validKeyInArray!0 (select (arr!41458 _keys!1741) from!2144))))))

(declare-fun b!1293664 () Bool)

(declare-fun res!859668 () Bool)

(assert (=> b!1293664 (=> (not res!859668) (not e!738283))))

(assert (=> b!1293664 (= res!859668 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42008 _keys!1741))))))

(declare-fun mapNonEmpty!53225 () Bool)

(declare-fun mapRes!53225 () Bool)

(declare-fun tp!101527 () Bool)

(assert (=> mapNonEmpty!53225 (= mapRes!53225 (and tp!101527 e!738285))))

(declare-fun mapValue!53225 () ValueCell!16323)

(declare-fun mapKey!53225 () (_ BitVec 32))

(declare-fun mapRest!53225 () (Array (_ BitVec 32) ValueCell!16323))

(assert (=> mapNonEmpty!53225 (= (arr!41459 _values!1445) (store mapRest!53225 mapKey!53225 mapValue!53225))))

(declare-fun b!1293665 () Bool)

(declare-fun res!859662 () Bool)

(assert (=> b!1293665 (=> (not res!859662) (not e!738283))))

(declare-fun getCurrentListMap!5016 (array!85914 array!85916 (_ BitVec 32) (_ BitVec 32) V!51027 V!51027 (_ BitVec 32) Int) ListLongMap!19919)

(assert (=> b!1293665 (= res!859662 (contains!8093 (getCurrentListMap!5016 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293666 () Bool)

(declare-fun res!859664 () Bool)

(assert (=> b!1293666 (=> (not res!859664) (not e!738283))))

(declare-datatypes ((List!29410 0))(
  ( (Nil!29407) (Cons!29406 (h!30615 (_ BitVec 64)) (t!42974 List!29410)) )
))
(declare-fun arrayNoDuplicates!0 (array!85914 (_ BitVec 32) List!29410) Bool)

(assert (=> b!1293666 (= res!859664 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29407))))

(declare-fun mapIsEmpty!53225 () Bool)

(assert (=> mapIsEmpty!53225 mapRes!53225))

(declare-fun b!1293667 () Bool)

(assert (=> b!1293667 (= e!738287 (and e!738282 mapRes!53225))))

(declare-fun condMapEmpty!53225 () Bool)

(declare-fun mapDefault!53225 () ValueCell!16323)

(assert (=> b!1293667 (= condMapEmpty!53225 (= (arr!41459 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16323)) mapDefault!53225)))))

(assert (= (and start!109314 res!859660) b!1293662))

(assert (= (and b!1293662 res!859667) b!1293659))

(assert (= (and b!1293659 res!859665) b!1293666))

(assert (= (and b!1293666 res!859664) b!1293664))

(assert (= (and b!1293664 res!859668) b!1293665))

(assert (= (and b!1293665 res!859662) b!1293657))

(assert (= (and b!1293657 res!859661) b!1293663))

(assert (= (and b!1293663 res!859663) b!1293656))

(assert (= (and b!1293656 (not res!859666)) b!1293658))

(assert (= (and b!1293667 condMapEmpty!53225) mapIsEmpty!53225))

(assert (= (and b!1293667 (not condMapEmpty!53225)) mapNonEmpty!53225))

(get-info :version)

(assert (= (and mapNonEmpty!53225 ((_ is ValueCellFull!16323) mapValue!53225)) b!1293661))

(assert (= (and b!1293667 ((_ is ValueCellFull!16323) mapDefault!53225)) b!1293660))

(assert (= start!109314 b!1293667))

(declare-fun m!1186027 () Bool)

(assert (=> b!1293659 m!1186027))

(declare-fun m!1186029 () Bool)

(assert (=> b!1293665 m!1186029))

(assert (=> b!1293665 m!1186029))

(declare-fun m!1186031 () Bool)

(assert (=> b!1293665 m!1186031))

(declare-fun m!1186033 () Bool)

(assert (=> b!1293658 m!1186033))

(assert (=> b!1293658 m!1186033))

(declare-fun m!1186035 () Bool)

(assert (=> b!1293658 m!1186035))

(declare-fun m!1186037 () Bool)

(assert (=> b!1293658 m!1186037))

(declare-fun m!1186039 () Bool)

(assert (=> b!1293658 m!1186039))

(declare-fun m!1186041 () Bool)

(assert (=> start!109314 m!1186041))

(declare-fun m!1186043 () Bool)

(assert (=> start!109314 m!1186043))

(declare-fun m!1186045 () Bool)

(assert (=> start!109314 m!1186045))

(declare-fun m!1186047 () Bool)

(assert (=> b!1293663 m!1186047))

(assert (=> b!1293663 m!1186047))

(declare-fun m!1186049 () Bool)

(assert (=> b!1293663 m!1186049))

(declare-fun m!1186051 () Bool)

(assert (=> b!1293656 m!1186051))

(declare-fun m!1186053 () Bool)

(assert (=> b!1293656 m!1186053))

(declare-fun m!1186055 () Bool)

(assert (=> b!1293666 m!1186055))

(declare-fun m!1186057 () Bool)

(assert (=> mapNonEmpty!53225 m!1186057))

(check-sat (not b!1293663) (not start!109314) (not b_next!28803) (not b!1293665) (not mapNonEmpty!53225) (not b!1293658) (not b!1293656) tp_is_empty!34443 b_and!46893 (not b!1293666) (not b!1293659))
(check-sat b_and!46893 (not b_next!28803))
