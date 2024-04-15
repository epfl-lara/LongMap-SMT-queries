; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109222 () Bool)

(assert start!109222)

(declare-fun b_free!28711 () Bool)

(declare-fun b_next!28711 () Bool)

(assert (=> start!109222 (= b_free!28711 (not b_next!28711))))

(declare-fun tp!101253 () Bool)

(declare-fun b_and!46783 () Bool)

(assert (=> start!109222 (= tp!101253 b_and!46783)))

(declare-fun b!1291988 () Bool)

(declare-fun e!737478 () Bool)

(declare-fun tp_is_empty!34351 () Bool)

(assert (=> b!1291988 (= e!737478 tp_is_empty!34351)))

(declare-fun b!1291989 () Bool)

(declare-fun res!858448 () Bool)

(declare-fun e!737480 () Bool)

(assert (=> b!1291989 (=> (not res!858448) (not e!737480))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85619 0))(
  ( (array!85620 (arr!41311 (Array (_ BitVec 32) (_ BitVec 64))) (size!41863 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85619)

(assert (=> b!1291989 (= res!858448 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41863 _keys!1741))))))

(declare-fun mapIsEmpty!53087 () Bool)

(declare-fun mapRes!53087 () Bool)

(assert (=> mapIsEmpty!53087 mapRes!53087))

(declare-fun mapNonEmpty!53087 () Bool)

(declare-fun tp!101252 () Bool)

(declare-fun e!737481 () Bool)

(assert (=> mapNonEmpty!53087 (= mapRes!53087 (and tp!101252 e!737481))))

(declare-datatypes ((V!50905 0))(
  ( (V!50906 (val!17250 Int)) )
))
(declare-datatypes ((ValueCell!16277 0))(
  ( (ValueCellFull!16277 (v!19852 V!50905)) (EmptyCell!16277) )
))
(declare-fun mapValue!53087 () ValueCell!16277)

(declare-fun mapRest!53087 () (Array (_ BitVec 32) ValueCell!16277))

(declare-datatypes ((array!85621 0))(
  ( (array!85622 (arr!41312 (Array (_ BitVec 32) ValueCell!16277)) (size!41864 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85621)

(declare-fun mapKey!53087 () (_ BitVec 32))

(assert (=> mapNonEmpty!53087 (= (arr!41312 _values!1445) (store mapRest!53087 mapKey!53087 mapValue!53087))))

(declare-fun b!1291990 () Bool)

(assert (=> b!1291990 (= e!737480 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22224 0))(
  ( (tuple2!22225 (_1!11123 (_ BitVec 64)) (_2!11123 V!50905)) )
))
(declare-datatypes ((List!29379 0))(
  ( (Nil!29376) (Cons!29375 (h!30584 tuple2!22224) (t!42935 List!29379)) )
))
(declare-datatypes ((ListLongMap!19881 0))(
  ( (ListLongMap!19882 (toList!9956 List!29379)) )
))
(declare-fun contains!8004 (ListLongMap!19881 (_ BitVec 64)) Bool)

(assert (=> b!1291990 (not (contains!8004 (ListLongMap!19882 Nil!29376) k0!1205))))

(declare-datatypes ((Unit!42602 0))(
  ( (Unit!42603) )
))
(declare-fun lt!579124 () Unit!42602)

(declare-fun emptyContainsNothing!98 ((_ BitVec 64)) Unit!42602)

(assert (=> b!1291990 (= lt!579124 (emptyContainsNothing!98 k0!1205))))

(declare-fun res!858444 () Bool)

(assert (=> start!109222 (=> (not res!858444) (not e!737480))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109222 (= res!858444 (validMask!0 mask!2175))))

(assert (=> start!109222 e!737480))

(assert (=> start!109222 tp_is_empty!34351))

(assert (=> start!109222 true))

(declare-fun e!737477 () Bool)

(declare-fun array_inv!31461 (array!85621) Bool)

(assert (=> start!109222 (and (array_inv!31461 _values!1445) e!737477)))

(declare-fun array_inv!31462 (array!85619) Bool)

(assert (=> start!109222 (array_inv!31462 _keys!1741)))

(assert (=> start!109222 tp!101253))

(declare-fun b!1291991 () Bool)

(declare-fun res!858449 () Bool)

(assert (=> b!1291991 (=> (not res!858449) (not e!737480))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291991 (= res!858449 (and (= (size!41864 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41863 _keys!1741) (size!41864 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291992 () Bool)

(declare-fun res!858446 () Bool)

(assert (=> b!1291992 (=> (not res!858446) (not e!737480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85619 (_ BitVec 32)) Bool)

(assert (=> b!1291992 (= res!858446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291993 () Bool)

(assert (=> b!1291993 (= e!737481 tp_is_empty!34351)))

(declare-fun b!1291994 () Bool)

(declare-fun res!858450 () Bool)

(assert (=> b!1291994 (=> (not res!858450) (not e!737480))))

(assert (=> b!1291994 (= res!858450 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41863 _keys!1741))))))

(declare-fun b!1291995 () Bool)

(declare-fun res!858447 () Bool)

(assert (=> b!1291995 (=> (not res!858447) (not e!737480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291995 (= res!858447 (not (validKeyInArray!0 (select (arr!41311 _keys!1741) from!2144))))))

(declare-fun b!1291996 () Bool)

(declare-fun res!858445 () Bool)

(assert (=> b!1291996 (=> (not res!858445) (not e!737480))))

(declare-fun minValue!1387 () V!50905)

(declare-fun zeroValue!1387 () V!50905)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4901 (array!85619 array!85621 (_ BitVec 32) (_ BitVec 32) V!50905 V!50905 (_ BitVec 32) Int) ListLongMap!19881)

(assert (=> b!1291996 (= res!858445 (contains!8004 (getCurrentListMap!4901 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291997 () Bool)

(declare-fun res!858443 () Bool)

(assert (=> b!1291997 (=> (not res!858443) (not e!737480))))

(declare-datatypes ((List!29380 0))(
  ( (Nil!29377) (Cons!29376 (h!30585 (_ BitVec 64)) (t!42936 List!29380)) )
))
(declare-fun arrayNoDuplicates!0 (array!85619 (_ BitVec 32) List!29380) Bool)

(assert (=> b!1291997 (= res!858443 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29377))))

(declare-fun b!1291998 () Bool)

(assert (=> b!1291998 (= e!737477 (and e!737478 mapRes!53087))))

(declare-fun condMapEmpty!53087 () Bool)

(declare-fun mapDefault!53087 () ValueCell!16277)

(assert (=> b!1291998 (= condMapEmpty!53087 (= (arr!41312 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16277)) mapDefault!53087)))))

(assert (= (and start!109222 res!858444) b!1291991))

(assert (= (and b!1291991 res!858449) b!1291992))

(assert (= (and b!1291992 res!858446) b!1291997))

(assert (= (and b!1291997 res!858443) b!1291989))

(assert (= (and b!1291989 res!858448) b!1291996))

(assert (= (and b!1291996 res!858445) b!1291994))

(assert (= (and b!1291994 res!858450) b!1291995))

(assert (= (and b!1291995 res!858447) b!1291990))

(assert (= (and b!1291998 condMapEmpty!53087) mapIsEmpty!53087))

(assert (= (and b!1291998 (not condMapEmpty!53087)) mapNonEmpty!53087))

(get-info :version)

(assert (= (and mapNonEmpty!53087 ((_ is ValueCellFull!16277) mapValue!53087)) b!1291993))

(assert (= (and b!1291998 ((_ is ValueCellFull!16277) mapDefault!53087)) b!1291988))

(assert (= start!109222 b!1291998))

(declare-fun m!1184211 () Bool)

(assert (=> b!1291990 m!1184211))

(declare-fun m!1184213 () Bool)

(assert (=> b!1291990 m!1184213))

(declare-fun m!1184215 () Bool)

(assert (=> mapNonEmpty!53087 m!1184215))

(declare-fun m!1184217 () Bool)

(assert (=> b!1291996 m!1184217))

(assert (=> b!1291996 m!1184217))

(declare-fun m!1184219 () Bool)

(assert (=> b!1291996 m!1184219))

(declare-fun m!1184221 () Bool)

(assert (=> b!1291995 m!1184221))

(assert (=> b!1291995 m!1184221))

(declare-fun m!1184223 () Bool)

(assert (=> b!1291995 m!1184223))

(declare-fun m!1184225 () Bool)

(assert (=> b!1291992 m!1184225))

(declare-fun m!1184227 () Bool)

(assert (=> start!109222 m!1184227))

(declare-fun m!1184229 () Bool)

(assert (=> start!109222 m!1184229))

(declare-fun m!1184231 () Bool)

(assert (=> start!109222 m!1184231))

(declare-fun m!1184233 () Bool)

(assert (=> b!1291997 m!1184233))

(check-sat (not start!109222) (not b!1291990) (not b!1291995) (not b_next!28711) tp_is_empty!34351 (not b!1291996) (not b!1291992) (not b!1291997) (not mapNonEmpty!53087) b_and!46783)
(check-sat b_and!46783 (not b_next!28711))
