; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109342 () Bool)

(assert start!109342)

(declare-fun b_free!28831 () Bool)

(declare-fun b_next!28831 () Bool)

(assert (=> start!109342 (= b_free!28831 (not b_next!28831))))

(declare-fun tp!101612 () Bool)

(declare-fun b_and!46903 () Bool)

(assert (=> start!109342 (= tp!101612 b_and!46903)))

(declare-fun b!1294076 () Bool)

(declare-fun res!859998 () Bool)

(declare-fun e!738486 () Bool)

(assert (=> b!1294076 (=> (not res!859998) (not e!738486))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85855 0))(
  ( (array!85856 (arr!41429 (Array (_ BitVec 32) (_ BitVec 64))) (size!41981 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85855)

(assert (=> b!1294076 (= res!859998 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41981 _keys!1741))))))

(declare-fun res!859992 () Bool)

(assert (=> start!109342 (=> (not res!859992) (not e!738486))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109342 (= res!859992 (validMask!0 mask!2175))))

(assert (=> start!109342 e!738486))

(declare-fun tp_is_empty!34471 () Bool)

(assert (=> start!109342 tp_is_empty!34471))

(assert (=> start!109342 true))

(declare-datatypes ((V!51065 0))(
  ( (V!51066 (val!17310 Int)) )
))
(declare-datatypes ((ValueCell!16337 0))(
  ( (ValueCellFull!16337 (v!19912 V!51065)) (EmptyCell!16337) )
))
(declare-datatypes ((array!85857 0))(
  ( (array!85858 (arr!41430 (Array (_ BitVec 32) ValueCell!16337)) (size!41982 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85857)

(declare-fun e!738487 () Bool)

(declare-fun array_inv!31539 (array!85857) Bool)

(assert (=> start!109342 (and (array_inv!31539 _values!1445) e!738487)))

(declare-fun array_inv!31540 (array!85855) Bool)

(assert (=> start!109342 (array_inv!31540 _keys!1741)))

(assert (=> start!109342 tp!101612))

(declare-fun mapNonEmpty!53267 () Bool)

(declare-fun mapRes!53267 () Bool)

(declare-fun tp!101613 () Bool)

(declare-fun e!738488 () Bool)

(assert (=> mapNonEmpty!53267 (= mapRes!53267 (and tp!101613 e!738488))))

(declare-fun mapKey!53267 () (_ BitVec 32))

(declare-fun mapValue!53267 () ValueCell!16337)

(declare-fun mapRest!53267 () (Array (_ BitVec 32) ValueCell!16337))

(assert (=> mapNonEmpty!53267 (= (arr!41430 _values!1445) (store mapRest!53267 mapKey!53267 mapValue!53267))))

(declare-fun b!1294077 () Bool)

(declare-fun res!859996 () Bool)

(assert (=> b!1294077 (=> (not res!859996) (not e!738486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294077 (= res!859996 (not (validKeyInArray!0 (select (arr!41429 _keys!1741) from!2144))))))

(declare-fun b!1294078 () Bool)

(declare-fun e!738489 () Bool)

(assert (=> b!1294078 (= e!738489 tp_is_empty!34471)))

(declare-fun b!1294079 () Bool)

(declare-fun res!859997 () Bool)

(assert (=> b!1294079 (=> (not res!859997) (not e!738486))))

(declare-datatypes ((List!29464 0))(
  ( (Nil!29461) (Cons!29460 (h!30669 (_ BitVec 64)) (t!43020 List!29464)) )
))
(declare-fun arrayNoDuplicates!0 (array!85855 (_ BitVec 32) List!29464) Bool)

(assert (=> b!1294079 (= res!859997 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29461))))

(declare-fun b!1294080 () Bool)

(assert (=> b!1294080 (= e!738488 tp_is_empty!34471)))

(declare-fun b!1294081 () Bool)

(assert (=> b!1294081 (= e!738486 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22322 0))(
  ( (tuple2!22323 (_1!11172 (_ BitVec 64)) (_2!11172 V!51065)) )
))
(declare-datatypes ((List!29465 0))(
  ( (Nil!29462) (Cons!29461 (h!30670 tuple2!22322) (t!43021 List!29465)) )
))
(declare-datatypes ((ListLongMap!19979 0))(
  ( (ListLongMap!19980 (toList!10005 List!29465)) )
))
(declare-fun contains!8053 (ListLongMap!19979 (_ BitVec 64)) Bool)

(assert (=> b!1294081 (not (contains!8053 (ListLongMap!19980 Nil!29462) k0!1205))))

(declare-datatypes ((Unit!42686 0))(
  ( (Unit!42687) )
))
(declare-fun lt!579511 () Unit!42686)

(declare-fun emptyContainsNothing!136 ((_ BitVec 64)) Unit!42686)

(assert (=> b!1294081 (= lt!579511 (emptyContainsNothing!136 k0!1205))))

(declare-fun b!1294082 () Bool)

(declare-fun res!859994 () Bool)

(assert (=> b!1294082 (=> (not res!859994) (not e!738486))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294082 (= res!859994 (and (= (size!41982 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41981 _keys!1741) (size!41982 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294083 () Bool)

(assert (=> b!1294083 (= e!738487 (and e!738489 mapRes!53267))))

(declare-fun condMapEmpty!53267 () Bool)

(declare-fun mapDefault!53267 () ValueCell!16337)

(assert (=> b!1294083 (= condMapEmpty!53267 (= (arr!41430 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16337)) mapDefault!53267)))))

(declare-fun mapIsEmpty!53267 () Bool)

(assert (=> mapIsEmpty!53267 mapRes!53267))

(declare-fun b!1294084 () Bool)

(declare-fun res!859993 () Bool)

(assert (=> b!1294084 (=> (not res!859993) (not e!738486))))

(assert (=> b!1294084 (= res!859993 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41981 _keys!1741))))))

(declare-fun b!1294085 () Bool)

(declare-fun res!859995 () Bool)

(assert (=> b!1294085 (=> (not res!859995) (not e!738486))))

(declare-fun minValue!1387 () V!51065)

(declare-fun zeroValue!1387 () V!51065)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4936 (array!85855 array!85857 (_ BitVec 32) (_ BitVec 32) V!51065 V!51065 (_ BitVec 32) Int) ListLongMap!19979)

(assert (=> b!1294085 (= res!859995 (contains!8053 (getCurrentListMap!4936 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294086 () Bool)

(declare-fun res!859991 () Bool)

(assert (=> b!1294086 (=> (not res!859991) (not e!738486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85855 (_ BitVec 32)) Bool)

(assert (=> b!1294086 (= res!859991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109342 res!859992) b!1294082))

(assert (= (and b!1294082 res!859994) b!1294086))

(assert (= (and b!1294086 res!859991) b!1294079))

(assert (= (and b!1294079 res!859997) b!1294076))

(assert (= (and b!1294076 res!859998) b!1294085))

(assert (= (and b!1294085 res!859995) b!1294084))

(assert (= (and b!1294084 res!859993) b!1294077))

(assert (= (and b!1294077 res!859996) b!1294081))

(assert (= (and b!1294083 condMapEmpty!53267) mapIsEmpty!53267))

(assert (= (and b!1294083 (not condMapEmpty!53267)) mapNonEmpty!53267))

(get-info :version)

(assert (= (and mapNonEmpty!53267 ((_ is ValueCellFull!16337) mapValue!53267)) b!1294080))

(assert (= (and b!1294083 ((_ is ValueCellFull!16337) mapDefault!53267)) b!1294078))

(assert (= start!109342 b!1294083))

(declare-fun m!1185927 () Bool)

(assert (=> b!1294077 m!1185927))

(assert (=> b!1294077 m!1185927))

(declare-fun m!1185929 () Bool)

(assert (=> b!1294077 m!1185929))

(declare-fun m!1185931 () Bool)

(assert (=> start!109342 m!1185931))

(declare-fun m!1185933 () Bool)

(assert (=> start!109342 m!1185933))

(declare-fun m!1185935 () Bool)

(assert (=> start!109342 m!1185935))

(declare-fun m!1185937 () Bool)

(assert (=> b!1294086 m!1185937))

(declare-fun m!1185939 () Bool)

(assert (=> mapNonEmpty!53267 m!1185939))

(declare-fun m!1185941 () Bool)

(assert (=> b!1294081 m!1185941))

(declare-fun m!1185943 () Bool)

(assert (=> b!1294081 m!1185943))

(declare-fun m!1185945 () Bool)

(assert (=> b!1294085 m!1185945))

(assert (=> b!1294085 m!1185945))

(declare-fun m!1185947 () Bool)

(assert (=> b!1294085 m!1185947))

(declare-fun m!1185949 () Bool)

(assert (=> b!1294079 m!1185949))

(check-sat (not b!1294079) (not b!1294081) (not b!1294086) tp_is_empty!34471 b_and!46903 (not start!109342) (not b!1294077) (not b!1294085) (not b_next!28831) (not mapNonEmpty!53267))
(check-sat b_and!46903 (not b_next!28831))
