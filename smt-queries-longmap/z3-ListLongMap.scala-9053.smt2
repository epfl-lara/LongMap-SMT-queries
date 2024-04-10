; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109104 () Bool)

(assert start!109104)

(declare-fun b_free!28593 () Bool)

(declare-fun b_next!28593 () Bool)

(assert (=> start!109104 (= b_free!28593 (not b_next!28593))))

(declare-fun tp!100897 () Bool)

(declare-fun b_and!46683 () Bool)

(assert (=> start!109104 (= tp!100897 b_and!46683)))

(declare-fun b!1289957 () Bool)

(declare-fun e!736477 () Bool)

(assert (=> b!1289957 (= e!736477 true)))

(declare-datatypes ((V!50747 0))(
  ( (V!50748 (val!17191 Int)) )
))
(declare-datatypes ((tuple2!22084 0))(
  ( (tuple2!22085 (_1!11053 (_ BitVec 64)) (_2!11053 V!50747)) )
))
(declare-datatypes ((List!29252 0))(
  ( (Nil!29249) (Cons!29248 (h!30457 tuple2!22084) (t!42816 List!29252)) )
))
(declare-datatypes ((ListLongMap!19741 0))(
  ( (ListLongMap!19742 (toList!9886 List!29252)) )
))
(declare-fun lt!578429 () ListLongMap!19741)

(declare-fun minValue!1387 () V!50747)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8004 (ListLongMap!19741 (_ BitVec 64)) Bool)

(declare-fun +!4355 (ListLongMap!19741 tuple2!22084) ListLongMap!19741)

(assert (=> b!1289957 (not (contains!8004 (+!4355 lt!578429 (tuple2!22085 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42686 0))(
  ( (Unit!42687) )
))
(declare-fun lt!578431 () Unit!42686)

(declare-fun addStillNotContains!373 (ListLongMap!19741 (_ BitVec 64) V!50747 (_ BitVec 64)) Unit!42686)

(assert (=> b!1289957 (= lt!578431 (addStillNotContains!373 lt!578429 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50747)

(assert (=> b!1289957 (not (contains!8004 (+!4355 lt!578429 (tuple2!22085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578432 () Unit!42686)

(assert (=> b!1289957 (= lt!578432 (addStillNotContains!373 lt!578429 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16218 0))(
  ( (ValueCellFull!16218 (v!19794 V!50747)) (EmptyCell!16218) )
))
(declare-datatypes ((array!85508 0))(
  ( (array!85509 (arr!41255 (Array (_ BitVec 32) ValueCell!16218)) (size!41805 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85508)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85510 0))(
  ( (array!85511 (arr!41256 (Array (_ BitVec 32) (_ BitVec 64))) (size!41806 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85510)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5986 (array!85510 array!85508 (_ BitVec 32) (_ BitVec 32) V!50747 V!50747 (_ BitVec 32) Int) ListLongMap!19741)

(assert (=> b!1289957 (= lt!578429 (getCurrentListMapNoExtraKeys!5986 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289958 () Bool)

(declare-fun e!736476 () Bool)

(declare-fun tp_is_empty!34233 () Bool)

(assert (=> b!1289958 (= e!736476 tp_is_empty!34233)))

(declare-fun mapIsEmpty!52910 () Bool)

(declare-fun mapRes!52910 () Bool)

(assert (=> mapIsEmpty!52910 mapRes!52910))

(declare-fun b!1289959 () Bool)

(declare-fun res!856907 () Bool)

(declare-fun e!736475 () Bool)

(assert (=> b!1289959 (=> (not res!856907) (not e!736475))))

(declare-datatypes ((List!29253 0))(
  ( (Nil!29250) (Cons!29249 (h!30458 (_ BitVec 64)) (t!42817 List!29253)) )
))
(declare-fun arrayNoDuplicates!0 (array!85510 (_ BitVec 32) List!29253) Bool)

(assert (=> b!1289959 (= res!856907 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29250))))

(declare-fun b!1289960 () Bool)

(declare-fun res!856911 () Bool)

(assert (=> b!1289960 (=> (not res!856911) (not e!736475))))

(assert (=> b!1289960 (= res!856911 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41806 _keys!1741))))))

(declare-fun b!1289962 () Bool)

(declare-fun e!736478 () Bool)

(declare-fun e!736474 () Bool)

(assert (=> b!1289962 (= e!736478 (and e!736474 mapRes!52910))))

(declare-fun condMapEmpty!52910 () Bool)

(declare-fun mapDefault!52910 () ValueCell!16218)

(assert (=> b!1289962 (= condMapEmpty!52910 (= (arr!41255 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16218)) mapDefault!52910)))))

(declare-fun b!1289963 () Bool)

(assert (=> b!1289963 (= e!736475 (not e!736477))))

(declare-fun res!856908 () Bool)

(assert (=> b!1289963 (=> res!856908 e!736477)))

(assert (=> b!1289963 (= res!856908 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289963 (not (contains!8004 (ListLongMap!19742 Nil!29249) k0!1205))))

(declare-fun lt!578430 () Unit!42686)

(declare-fun emptyContainsNothing!71 ((_ BitVec 64)) Unit!42686)

(assert (=> b!1289963 (= lt!578430 (emptyContainsNothing!71 k0!1205))))

(declare-fun b!1289964 () Bool)

(declare-fun res!856906 () Bool)

(assert (=> b!1289964 (=> (not res!856906) (not e!736475))))

(assert (=> b!1289964 (= res!856906 (and (= (size!41805 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41806 _keys!1741) (size!41805 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289965 () Bool)

(declare-fun res!856910 () Bool)

(assert (=> b!1289965 (=> (not res!856910) (not e!736475))))

(declare-fun getCurrentListMap!4946 (array!85510 array!85508 (_ BitVec 32) (_ BitVec 32) V!50747 V!50747 (_ BitVec 32) Int) ListLongMap!19741)

(assert (=> b!1289965 (= res!856910 (contains!8004 (getCurrentListMap!4946 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289966 () Bool)

(declare-fun res!856909 () Bool)

(assert (=> b!1289966 (=> (not res!856909) (not e!736475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85510 (_ BitVec 32)) Bool)

(assert (=> b!1289966 (= res!856909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289967 () Bool)

(assert (=> b!1289967 (= e!736474 tp_is_empty!34233)))

(declare-fun res!856914 () Bool)

(assert (=> start!109104 (=> (not res!856914) (not e!736475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109104 (= res!856914 (validMask!0 mask!2175))))

(assert (=> start!109104 e!736475))

(assert (=> start!109104 tp_is_empty!34233))

(assert (=> start!109104 true))

(declare-fun array_inv!31269 (array!85508) Bool)

(assert (=> start!109104 (and (array_inv!31269 _values!1445) e!736478)))

(declare-fun array_inv!31270 (array!85510) Bool)

(assert (=> start!109104 (array_inv!31270 _keys!1741)))

(assert (=> start!109104 tp!100897))

(declare-fun b!1289961 () Bool)

(declare-fun res!856913 () Bool)

(assert (=> b!1289961 (=> (not res!856913) (not e!736475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289961 (= res!856913 (not (validKeyInArray!0 (select (arr!41256 _keys!1741) from!2144))))))

(declare-fun b!1289968 () Bool)

(declare-fun res!856912 () Bool)

(assert (=> b!1289968 (=> (not res!856912) (not e!736475))))

(assert (=> b!1289968 (= res!856912 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41806 _keys!1741))))))

(declare-fun mapNonEmpty!52910 () Bool)

(declare-fun tp!100898 () Bool)

(assert (=> mapNonEmpty!52910 (= mapRes!52910 (and tp!100898 e!736476))))

(declare-fun mapKey!52910 () (_ BitVec 32))

(declare-fun mapValue!52910 () ValueCell!16218)

(declare-fun mapRest!52910 () (Array (_ BitVec 32) ValueCell!16218))

(assert (=> mapNonEmpty!52910 (= (arr!41255 _values!1445) (store mapRest!52910 mapKey!52910 mapValue!52910))))

(assert (= (and start!109104 res!856914) b!1289964))

(assert (= (and b!1289964 res!856906) b!1289966))

(assert (= (and b!1289966 res!856909) b!1289959))

(assert (= (and b!1289959 res!856907) b!1289960))

(assert (= (and b!1289960 res!856911) b!1289965))

(assert (= (and b!1289965 res!856910) b!1289968))

(assert (= (and b!1289968 res!856912) b!1289961))

(assert (= (and b!1289961 res!856913) b!1289963))

(assert (= (and b!1289963 (not res!856908)) b!1289957))

(assert (= (and b!1289962 condMapEmpty!52910) mapIsEmpty!52910))

(assert (= (and b!1289962 (not condMapEmpty!52910)) mapNonEmpty!52910))

(get-info :version)

(assert (= (and mapNonEmpty!52910 ((_ is ValueCellFull!16218) mapValue!52910)) b!1289958))

(assert (= (and b!1289962 ((_ is ValueCellFull!16218) mapDefault!52910)) b!1289967))

(assert (= start!109104 b!1289962))

(declare-fun m!1182505 () Bool)

(assert (=> b!1289957 m!1182505))

(declare-fun m!1182507 () Bool)

(assert (=> b!1289957 m!1182507))

(declare-fun m!1182509 () Bool)

(assert (=> b!1289957 m!1182509))

(assert (=> b!1289957 m!1182505))

(declare-fun m!1182511 () Bool)

(assert (=> b!1289957 m!1182511))

(declare-fun m!1182513 () Bool)

(assert (=> b!1289957 m!1182513))

(declare-fun m!1182515 () Bool)

(assert (=> b!1289957 m!1182515))

(assert (=> b!1289957 m!1182513))

(declare-fun m!1182517 () Bool)

(assert (=> b!1289957 m!1182517))

(declare-fun m!1182519 () Bool)

(assert (=> b!1289963 m!1182519))

(declare-fun m!1182521 () Bool)

(assert (=> b!1289963 m!1182521))

(declare-fun m!1182523 () Bool)

(assert (=> b!1289966 m!1182523))

(declare-fun m!1182525 () Bool)

(assert (=> b!1289959 m!1182525))

(declare-fun m!1182527 () Bool)

(assert (=> mapNonEmpty!52910 m!1182527))

(declare-fun m!1182529 () Bool)

(assert (=> b!1289965 m!1182529))

(assert (=> b!1289965 m!1182529))

(declare-fun m!1182531 () Bool)

(assert (=> b!1289965 m!1182531))

(declare-fun m!1182533 () Bool)

(assert (=> b!1289961 m!1182533))

(assert (=> b!1289961 m!1182533))

(declare-fun m!1182535 () Bool)

(assert (=> b!1289961 m!1182535))

(declare-fun m!1182537 () Bool)

(assert (=> start!109104 m!1182537))

(declare-fun m!1182539 () Bool)

(assert (=> start!109104 m!1182539))

(declare-fun m!1182541 () Bool)

(assert (=> start!109104 m!1182541))

(check-sat (not b!1289957) (not b!1289963) (not b!1289966) (not b!1289965) (not b_next!28593) tp_is_empty!34233 b_and!46683 (not b!1289961) (not b!1289959) (not start!109104) (not mapNonEmpty!52910))
(check-sat b_and!46683 (not b_next!28593))
