; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109308 () Bool)

(assert start!109308)

(declare-fun b_free!28797 () Bool)

(declare-fun b_next!28797 () Bool)

(assert (=> start!109308 (= b_free!28797 (not b_next!28797))))

(declare-fun tp!101510 () Bool)

(declare-fun b_and!46887 () Bool)

(assert (=> start!109308 (= tp!101510 b_and!46887)))

(declare-fun b!1293548 () Bool)

(declare-fun res!859580 () Bool)

(declare-fun e!738232 () Bool)

(assert (=> b!1293548 (=> (not res!859580) (not e!738232))))

(declare-datatypes ((array!85902 0))(
  ( (array!85903 (arr!41452 (Array (_ BitVec 32) (_ BitVec 64))) (size!42002 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85902)

(declare-datatypes ((List!29404 0))(
  ( (Nil!29401) (Cons!29400 (h!30609 (_ BitVec 64)) (t!42968 List!29404)) )
))
(declare-fun arrayNoDuplicates!0 (array!85902 (_ BitVec 32) List!29404) Bool)

(assert (=> b!1293548 (= res!859580 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29401))))

(declare-fun b!1293549 () Bool)

(declare-fun e!738228 () Bool)

(assert (=> b!1293549 (= e!738232 (not e!738228))))

(declare-fun res!859579 () Bool)

(assert (=> b!1293549 (=> res!859579 e!738228)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293549 (= res!859579 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51019 0))(
  ( (V!51020 (val!17293 Int)) )
))
(declare-datatypes ((tuple2!22256 0))(
  ( (tuple2!22257 (_1!11139 (_ BitVec 64)) (_2!11139 V!51019)) )
))
(declare-datatypes ((List!29405 0))(
  ( (Nil!29402) (Cons!29401 (h!30610 tuple2!22256) (t!42969 List!29405)) )
))
(declare-datatypes ((ListLongMap!19913 0))(
  ( (ListLongMap!19914 (toList!9972 List!29405)) )
))
(declare-fun contains!8090 (ListLongMap!19913 (_ BitVec 64)) Bool)

(assert (=> b!1293549 (not (contains!8090 (ListLongMap!19914 Nil!29402) k0!1205))))

(declare-datatypes ((Unit!42840 0))(
  ( (Unit!42841) )
))
(declare-fun lt!579578 () Unit!42840)

(declare-fun emptyContainsNothing!141 ((_ BitVec 64)) Unit!42840)

(assert (=> b!1293549 (= lt!579578 (emptyContainsNothing!141 k0!1205))))

(declare-fun b!1293550 () Bool)

(assert (=> b!1293550 (= e!738228 true)))

(declare-fun lt!579577 () ListLongMap!19913)

(declare-fun zeroValue!1387 () V!51019)

(declare-fun +!4403 (ListLongMap!19913 tuple2!22256) ListLongMap!19913)

(assert (=> b!1293550 (not (contains!8090 (+!4403 lt!579577 (tuple2!22257 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579576 () Unit!42840)

(declare-fun addStillNotContains!421 (ListLongMap!19913 (_ BitVec 64) V!51019 (_ BitVec 64)) Unit!42840)

(assert (=> b!1293550 (= lt!579576 (addStillNotContains!421 lt!579577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51019)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16320 0))(
  ( (ValueCellFull!16320 (v!19896 V!51019)) (EmptyCell!16320) )
))
(declare-datatypes ((array!85904 0))(
  ( (array!85905 (arr!41453 (Array (_ BitVec 32) ValueCell!16320)) (size!42003 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85904)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6035 (array!85902 array!85904 (_ BitVec 32) (_ BitVec 32) V!51019 V!51019 (_ BitVec 32) Int) ListLongMap!19913)

(assert (=> b!1293550 (= lt!579577 (getCurrentListMapNoExtraKeys!6035 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293551 () Bool)

(declare-fun res!859587 () Bool)

(assert (=> b!1293551 (=> (not res!859587) (not e!738232))))

(declare-fun getCurrentListMap!5014 (array!85902 array!85904 (_ BitVec 32) (_ BitVec 32) V!51019 V!51019 (_ BitVec 32) Int) ListLongMap!19913)

(assert (=> b!1293551 (= res!859587 (contains!8090 (getCurrentListMap!5014 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293552 () Bool)

(declare-fun e!738229 () Bool)

(declare-fun e!738230 () Bool)

(declare-fun mapRes!53216 () Bool)

(assert (=> b!1293552 (= e!738229 (and e!738230 mapRes!53216))))

(declare-fun condMapEmpty!53216 () Bool)

(declare-fun mapDefault!53216 () ValueCell!16320)

(assert (=> b!1293552 (= condMapEmpty!53216 (= (arr!41453 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16320)) mapDefault!53216)))))

(declare-fun b!1293553 () Bool)

(declare-fun tp_is_empty!34437 () Bool)

(assert (=> b!1293553 (= e!738230 tp_is_empty!34437)))

(declare-fun b!1293554 () Bool)

(declare-fun e!738231 () Bool)

(assert (=> b!1293554 (= e!738231 tp_is_empty!34437)))

(declare-fun b!1293555 () Bool)

(declare-fun res!859581 () Bool)

(assert (=> b!1293555 (=> (not res!859581) (not e!738232))))

(assert (=> b!1293555 (= res!859581 (and (= (size!42003 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42002 _keys!1741) (size!42003 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293556 () Bool)

(declare-fun res!859582 () Bool)

(assert (=> b!1293556 (=> (not res!859582) (not e!738232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85902 (_ BitVec 32)) Bool)

(assert (=> b!1293556 (= res!859582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293557 () Bool)

(declare-fun res!859583 () Bool)

(assert (=> b!1293557 (=> (not res!859583) (not e!738232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293557 (= res!859583 (not (validKeyInArray!0 (select (arr!41452 _keys!1741) from!2144))))))

(declare-fun b!1293558 () Bool)

(declare-fun res!859585 () Bool)

(assert (=> b!1293558 (=> (not res!859585) (not e!738232))))

(assert (=> b!1293558 (= res!859585 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42002 _keys!1741))))))

(declare-fun mapIsEmpty!53216 () Bool)

(assert (=> mapIsEmpty!53216 mapRes!53216))

(declare-fun res!859584 () Bool)

(assert (=> start!109308 (=> (not res!859584) (not e!738232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109308 (= res!859584 (validMask!0 mask!2175))))

(assert (=> start!109308 e!738232))

(assert (=> start!109308 tp_is_empty!34437))

(assert (=> start!109308 true))

(declare-fun array_inv!31401 (array!85904) Bool)

(assert (=> start!109308 (and (array_inv!31401 _values!1445) e!738229)))

(declare-fun array_inv!31402 (array!85902) Bool)

(assert (=> start!109308 (array_inv!31402 _keys!1741)))

(assert (=> start!109308 tp!101510))

(declare-fun mapNonEmpty!53216 () Bool)

(declare-fun tp!101509 () Bool)

(assert (=> mapNonEmpty!53216 (= mapRes!53216 (and tp!101509 e!738231))))

(declare-fun mapKey!53216 () (_ BitVec 32))

(declare-fun mapValue!53216 () ValueCell!16320)

(declare-fun mapRest!53216 () (Array (_ BitVec 32) ValueCell!16320))

(assert (=> mapNonEmpty!53216 (= (arr!41453 _values!1445) (store mapRest!53216 mapKey!53216 mapValue!53216))))

(declare-fun b!1293559 () Bool)

(declare-fun res!859586 () Bool)

(assert (=> b!1293559 (=> (not res!859586) (not e!738232))))

(assert (=> b!1293559 (= res!859586 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42002 _keys!1741))))))

(assert (= (and start!109308 res!859584) b!1293555))

(assert (= (and b!1293555 res!859581) b!1293556))

(assert (= (and b!1293556 res!859582) b!1293548))

(assert (= (and b!1293548 res!859580) b!1293558))

(assert (= (and b!1293558 res!859585) b!1293551))

(assert (= (and b!1293551 res!859587) b!1293559))

(assert (= (and b!1293559 res!859586) b!1293557))

(assert (= (and b!1293557 res!859583) b!1293549))

(assert (= (and b!1293549 (not res!859579)) b!1293550))

(assert (= (and b!1293552 condMapEmpty!53216) mapIsEmpty!53216))

(assert (= (and b!1293552 (not condMapEmpty!53216)) mapNonEmpty!53216))

(get-info :version)

(assert (= (and mapNonEmpty!53216 ((_ is ValueCellFull!16320) mapValue!53216)) b!1293554))

(assert (= (and b!1293552 ((_ is ValueCellFull!16320) mapDefault!53216)) b!1293553))

(assert (= start!109308 b!1293552))

(declare-fun m!1185931 () Bool)

(assert (=> mapNonEmpty!53216 m!1185931))

(declare-fun m!1185933 () Bool)

(assert (=> b!1293549 m!1185933))

(declare-fun m!1185935 () Bool)

(assert (=> b!1293549 m!1185935))

(declare-fun m!1185937 () Bool)

(assert (=> b!1293557 m!1185937))

(assert (=> b!1293557 m!1185937))

(declare-fun m!1185939 () Bool)

(assert (=> b!1293557 m!1185939))

(declare-fun m!1185941 () Bool)

(assert (=> b!1293550 m!1185941))

(assert (=> b!1293550 m!1185941))

(declare-fun m!1185943 () Bool)

(assert (=> b!1293550 m!1185943))

(declare-fun m!1185945 () Bool)

(assert (=> b!1293550 m!1185945))

(declare-fun m!1185947 () Bool)

(assert (=> b!1293550 m!1185947))

(declare-fun m!1185949 () Bool)

(assert (=> b!1293548 m!1185949))

(declare-fun m!1185951 () Bool)

(assert (=> b!1293551 m!1185951))

(assert (=> b!1293551 m!1185951))

(declare-fun m!1185953 () Bool)

(assert (=> b!1293551 m!1185953))

(declare-fun m!1185955 () Bool)

(assert (=> b!1293556 m!1185955))

(declare-fun m!1185957 () Bool)

(assert (=> start!109308 m!1185957))

(declare-fun m!1185959 () Bool)

(assert (=> start!109308 m!1185959))

(declare-fun m!1185961 () Bool)

(assert (=> start!109308 m!1185961))

(check-sat b_and!46887 (not b!1293551) (not b_next!28797) (not b!1293556) (not mapNonEmpty!53216) (not b!1293548) (not b!1293557) tp_is_empty!34437 (not start!109308) (not b!1293550) (not b!1293549))
(check-sat b_and!46887 (not b_next!28797))
