; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109602 () Bool)

(assert start!109602)

(declare-fun b_free!28867 () Bool)

(declare-fun b_next!28867 () Bool)

(assert (=> start!109602 (= b_free!28867 (not b_next!28867))))

(declare-fun tp!101719 () Bool)

(declare-fun b_and!46959 () Bool)

(assert (=> start!109602 (= tp!101719 b_and!46959)))

(declare-fun mapIsEmpty!53321 () Bool)

(declare-fun mapRes!53321 () Bool)

(assert (=> mapIsEmpty!53321 mapRes!53321))

(declare-fun b!1296039 () Bool)

(declare-fun res!860970 () Bool)

(declare-fun e!739635 () Bool)

(assert (=> b!1296039 (=> (not res!860970) (not e!739635))))

(declare-datatypes ((V!51113 0))(
  ( (V!51114 (val!17328 Int)) )
))
(declare-datatypes ((ValueCell!16355 0))(
  ( (ValueCellFull!16355 (v!19926 V!51113)) (EmptyCell!16355) )
))
(declare-datatypes ((array!86067 0))(
  ( (array!86068 (arr!41530 (Array (_ BitVec 32) ValueCell!16355)) (size!42081 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86067)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86069 0))(
  ( (array!86070 (arr!41531 (Array (_ BitVec 32) (_ BitVec 64))) (size!42082 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86069)

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1296039 (= res!860970 (and (= (size!42081 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42082 _keys!1741) (size!42081 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296040 () Bool)

(declare-fun e!739633 () Bool)

(declare-fun tp_is_empty!34507 () Bool)

(assert (=> b!1296040 (= e!739633 tp_is_empty!34507)))

(declare-fun b!1296041 () Bool)

(declare-fun res!860974 () Bool)

(assert (=> b!1296041 (=> (not res!860974) (not e!739635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86069 (_ BitVec 32)) Bool)

(assert (=> b!1296041 (= res!860974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296042 () Bool)

(declare-fun e!739634 () Bool)

(assert (=> b!1296042 (= e!739634 (and e!739633 mapRes!53321))))

(declare-fun condMapEmpty!53321 () Bool)

(declare-fun mapDefault!53321 () ValueCell!16355)

(assert (=> b!1296042 (= condMapEmpty!53321 (= (arr!41530 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16355)) mapDefault!53321)))))

(declare-fun b!1296043 () Bool)

(declare-fun res!860971 () Bool)

(assert (=> b!1296043 (=> (not res!860971) (not e!739635))))

(declare-fun minValue!1387 () V!51113)

(declare-fun zeroValue!1387 () V!51113)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22312 0))(
  ( (tuple2!22313 (_1!11167 (_ BitVec 64)) (_2!11167 V!51113)) )
))
(declare-datatypes ((List!29479 0))(
  ( (Nil!29476) (Cons!29475 (h!30693 tuple2!22312) (t!43035 List!29479)) )
))
(declare-datatypes ((ListLongMap!19977 0))(
  ( (ListLongMap!19978 (toList!10004 List!29479)) )
))
(declare-fun contains!8135 (ListLongMap!19977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5031 (array!86069 array!86067 (_ BitVec 32) (_ BitVec 32) V!51113 V!51113 (_ BitVec 32) Int) ListLongMap!19977)

(assert (=> b!1296043 (= res!860971 (contains!8135 (getCurrentListMap!5031 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!860973 () Bool)

(assert (=> start!109602 (=> (not res!860973) (not e!739635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109602 (= res!860973 (validMask!0 mask!2175))))

(assert (=> start!109602 e!739635))

(assert (=> start!109602 tp_is_empty!34507))

(assert (=> start!109602 true))

(declare-fun array_inv!31681 (array!86067) Bool)

(assert (=> start!109602 (and (array_inv!31681 _values!1445) e!739634)))

(declare-fun array_inv!31682 (array!86069) Bool)

(assert (=> start!109602 (array_inv!31682 _keys!1741)))

(assert (=> start!109602 tp!101719))

(declare-fun b!1296044 () Bool)

(declare-fun res!860977 () Bool)

(assert (=> b!1296044 (=> (not res!860977) (not e!739635))))

(declare-datatypes ((List!29480 0))(
  ( (Nil!29477) (Cons!29476 (h!30694 (_ BitVec 64)) (t!43036 List!29480)) )
))
(declare-fun arrayNoDuplicates!0 (array!86069 (_ BitVec 32) List!29480) Bool)

(assert (=> b!1296044 (= res!860977 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29477))))

(declare-fun b!1296045 () Bool)

(declare-fun res!860975 () Bool)

(assert (=> b!1296045 (=> (not res!860975) (not e!739635))))

(assert (=> b!1296045 (= res!860975 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42082 _keys!1741))))))

(declare-fun b!1296046 () Bool)

(declare-fun res!860976 () Bool)

(assert (=> b!1296046 (=> (not res!860976) (not e!739635))))

(assert (=> b!1296046 (= res!860976 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42082 _keys!1741))))))

(declare-fun b!1296047 () Bool)

(declare-fun e!739632 () Bool)

(assert (=> b!1296047 (= e!739632 tp_is_empty!34507)))

(declare-fun b!1296048 () Bool)

(declare-fun res!860972 () Bool)

(assert (=> b!1296048 (=> (not res!860972) (not e!739635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296048 (= res!860972 (not (validKeyInArray!0 (select (arr!41531 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53321 () Bool)

(declare-fun tp!101720 () Bool)

(assert (=> mapNonEmpty!53321 (= mapRes!53321 (and tp!101720 e!739632))))

(declare-fun mapValue!53321 () ValueCell!16355)

(declare-fun mapRest!53321 () (Array (_ BitVec 32) ValueCell!16355))

(declare-fun mapKey!53321 () (_ BitVec 32))

(assert (=> mapNonEmpty!53321 (= (arr!41530 _values!1445) (store mapRest!53321 mapKey!53321 mapValue!53321))))

(declare-fun b!1296049 () Bool)

(assert (=> b!1296049 (= e!739635 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle from!2144 (size!42082 _keys!1741)))))))

(assert (=> b!1296049 (not (contains!8135 (ListLongMap!19978 Nil!29476) k0!1205))))

(declare-datatypes ((Unit!42839 0))(
  ( (Unit!42840) )
))
(declare-fun lt!580227 () Unit!42839)

(declare-fun emptyContainsNothing!162 ((_ BitVec 64)) Unit!42839)

(assert (=> b!1296049 (= lt!580227 (emptyContainsNothing!162 k0!1205))))

(assert (= (and start!109602 res!860973) b!1296039))

(assert (= (and b!1296039 res!860970) b!1296041))

(assert (= (and b!1296041 res!860974) b!1296044))

(assert (= (and b!1296044 res!860977) b!1296045))

(assert (= (and b!1296045 res!860975) b!1296043))

(assert (= (and b!1296043 res!860971) b!1296046))

(assert (= (and b!1296046 res!860976) b!1296048))

(assert (= (and b!1296048 res!860972) b!1296049))

(assert (= (and b!1296042 condMapEmpty!53321) mapIsEmpty!53321))

(assert (= (and b!1296042 (not condMapEmpty!53321)) mapNonEmpty!53321))

(get-info :version)

(assert (= (and mapNonEmpty!53321 ((_ is ValueCellFull!16355) mapValue!53321)) b!1296047))

(assert (= (and b!1296042 ((_ is ValueCellFull!16355) mapDefault!53321)) b!1296040))

(assert (= start!109602 b!1296042))

(declare-fun m!1188477 () Bool)

(assert (=> start!109602 m!1188477))

(declare-fun m!1188479 () Bool)

(assert (=> start!109602 m!1188479))

(declare-fun m!1188481 () Bool)

(assert (=> start!109602 m!1188481))

(declare-fun m!1188483 () Bool)

(assert (=> mapNonEmpty!53321 m!1188483))

(declare-fun m!1188485 () Bool)

(assert (=> b!1296049 m!1188485))

(declare-fun m!1188487 () Bool)

(assert (=> b!1296049 m!1188487))

(declare-fun m!1188489 () Bool)

(assert (=> b!1296041 m!1188489))

(declare-fun m!1188491 () Bool)

(assert (=> b!1296044 m!1188491))

(declare-fun m!1188493 () Bool)

(assert (=> b!1296043 m!1188493))

(assert (=> b!1296043 m!1188493))

(declare-fun m!1188495 () Bool)

(assert (=> b!1296043 m!1188495))

(declare-fun m!1188497 () Bool)

(assert (=> b!1296048 m!1188497))

(assert (=> b!1296048 m!1188497))

(declare-fun m!1188499 () Bool)

(assert (=> b!1296048 m!1188499))

(check-sat (not start!109602) (not b!1296049) (not b!1296041) (not b!1296044) (not b!1296048) (not b!1296043) tp_is_empty!34507 (not mapNonEmpty!53321) (not b_next!28867) b_and!46959)
(check-sat b_and!46959 (not b_next!28867))
