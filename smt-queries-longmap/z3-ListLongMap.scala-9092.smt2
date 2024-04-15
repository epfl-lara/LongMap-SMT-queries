; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109336 () Bool)

(assert start!109336)

(declare-fun b_free!28825 () Bool)

(declare-fun b_next!28825 () Bool)

(assert (=> start!109336 (= b_free!28825 (not b_next!28825))))

(declare-fun tp!101595 () Bool)

(declare-fun b_and!46897 () Bool)

(assert (=> start!109336 (= tp!101595 b_and!46897)))

(declare-fun b!1293977 () Bool)

(declare-fun e!738440 () Bool)

(declare-fun tp_is_empty!34465 () Bool)

(assert (=> b!1293977 (= e!738440 tp_is_empty!34465)))

(declare-fun b!1293978 () Bool)

(declare-fun res!859919 () Bool)

(declare-fun e!738441 () Bool)

(assert (=> b!1293978 (=> (not res!859919) (not e!738441))))

(declare-datatypes ((array!85843 0))(
  ( (array!85844 (arr!41423 (Array (_ BitVec 32) (_ BitVec 64))) (size!41975 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85843)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85843 (_ BitVec 32)) Bool)

(assert (=> b!1293978 (= res!859919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293979 () Bool)

(declare-fun res!859924 () Bool)

(assert (=> b!1293979 (=> (not res!859924) (not e!738441))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1293979 (= res!859924 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41975 _keys!1741))))))

(declare-fun b!1293980 () Bool)

(declare-fun res!859922 () Bool)

(assert (=> b!1293980 (=> (not res!859922) (not e!738441))))

(declare-datatypes ((List!29461 0))(
  ( (Nil!29458) (Cons!29457 (h!30666 (_ BitVec 64)) (t!43017 List!29461)) )
))
(declare-fun arrayNoDuplicates!0 (array!85843 (_ BitVec 32) List!29461) Bool)

(assert (=> b!1293980 (= res!859922 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29458))))

(declare-fun b!1293981 () Bool)

(declare-fun res!859921 () Bool)

(assert (=> b!1293981 (=> (not res!859921) (not e!738441))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293981 (= res!859921 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41975 _keys!1741))))))

(declare-fun b!1293982 () Bool)

(declare-fun res!859920 () Bool)

(assert (=> b!1293982 (=> (not res!859920) (not e!738441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293982 (= res!859920 (not (validKeyInArray!0 (select (arr!41423 _keys!1741) from!2144))))))

(declare-fun b!1293983 () Bool)

(declare-fun e!738442 () Bool)

(assert (=> b!1293983 (= e!738442 tp_is_empty!34465)))

(declare-fun b!1293984 () Bool)

(declare-fun e!738443 () Bool)

(declare-fun mapRes!53258 () Bool)

(assert (=> b!1293984 (= e!738443 (and e!738440 mapRes!53258))))

(declare-fun condMapEmpty!53258 () Bool)

(declare-datatypes ((V!51057 0))(
  ( (V!51058 (val!17307 Int)) )
))
(declare-datatypes ((ValueCell!16334 0))(
  ( (ValueCellFull!16334 (v!19909 V!51057)) (EmptyCell!16334) )
))
(declare-datatypes ((array!85845 0))(
  ( (array!85846 (arr!41424 (Array (_ BitVec 32) ValueCell!16334)) (size!41976 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85845)

(declare-fun mapDefault!53258 () ValueCell!16334)

(assert (=> b!1293984 (= condMapEmpty!53258 (= (arr!41424 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16334)) mapDefault!53258)))))

(declare-fun b!1293986 () Bool)

(assert (=> b!1293986 (= e!738441 (not true))))

(declare-datatypes ((tuple2!22318 0))(
  ( (tuple2!22319 (_1!11170 (_ BitVec 64)) (_2!11170 V!51057)) )
))
(declare-datatypes ((List!29462 0))(
  ( (Nil!29459) (Cons!29458 (h!30667 tuple2!22318) (t!43018 List!29462)) )
))
(declare-datatypes ((ListLongMap!19975 0))(
  ( (ListLongMap!19976 (toList!10003 List!29462)) )
))
(declare-fun contains!8051 (ListLongMap!19975 (_ BitVec 64)) Bool)

(assert (=> b!1293986 (not (contains!8051 (ListLongMap!19976 Nil!29459) k0!1205))))

(declare-datatypes ((Unit!42682 0))(
  ( (Unit!42683) )
))
(declare-fun lt!579502 () Unit!42682)

(declare-fun emptyContainsNothing!134 ((_ BitVec 64)) Unit!42682)

(assert (=> b!1293986 (= lt!579502 (emptyContainsNothing!134 k0!1205))))

(declare-fun mapNonEmpty!53258 () Bool)

(declare-fun tp!101594 () Bool)

(assert (=> mapNonEmpty!53258 (= mapRes!53258 (and tp!101594 e!738442))))

(declare-fun mapValue!53258 () ValueCell!16334)

(declare-fun mapKey!53258 () (_ BitVec 32))

(declare-fun mapRest!53258 () (Array (_ BitVec 32) ValueCell!16334))

(assert (=> mapNonEmpty!53258 (= (arr!41424 _values!1445) (store mapRest!53258 mapKey!53258 mapValue!53258))))

(declare-fun mapIsEmpty!53258 () Bool)

(assert (=> mapIsEmpty!53258 mapRes!53258))

(declare-fun b!1293987 () Bool)

(declare-fun res!859925 () Bool)

(assert (=> b!1293987 (=> (not res!859925) (not e!738441))))

(declare-fun minValue!1387 () V!51057)

(declare-fun zeroValue!1387 () V!51057)

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMap!4935 (array!85843 array!85845 (_ BitVec 32) (_ BitVec 32) V!51057 V!51057 (_ BitVec 32) Int) ListLongMap!19975)

(assert (=> b!1293987 (= res!859925 (contains!8051 (getCurrentListMap!4935 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293985 () Bool)

(declare-fun res!859923 () Bool)

(assert (=> b!1293985 (=> (not res!859923) (not e!738441))))

(assert (=> b!1293985 (= res!859923 (and (= (size!41976 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41975 _keys!1741) (size!41976 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!859926 () Bool)

(assert (=> start!109336 (=> (not res!859926) (not e!738441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109336 (= res!859926 (validMask!0 mask!2175))))

(assert (=> start!109336 e!738441))

(assert (=> start!109336 tp_is_empty!34465))

(assert (=> start!109336 true))

(declare-fun array_inv!31535 (array!85845) Bool)

(assert (=> start!109336 (and (array_inv!31535 _values!1445) e!738443)))

(declare-fun array_inv!31536 (array!85843) Bool)

(assert (=> start!109336 (array_inv!31536 _keys!1741)))

(assert (=> start!109336 tp!101595))

(assert (= (and start!109336 res!859926) b!1293985))

(assert (= (and b!1293985 res!859923) b!1293978))

(assert (= (and b!1293978 res!859919) b!1293980))

(assert (= (and b!1293980 res!859922) b!1293979))

(assert (= (and b!1293979 res!859924) b!1293987))

(assert (= (and b!1293987 res!859925) b!1293981))

(assert (= (and b!1293981 res!859921) b!1293982))

(assert (= (and b!1293982 res!859920) b!1293986))

(assert (= (and b!1293984 condMapEmpty!53258) mapIsEmpty!53258))

(assert (= (and b!1293984 (not condMapEmpty!53258)) mapNonEmpty!53258))

(get-info :version)

(assert (= (and mapNonEmpty!53258 ((_ is ValueCellFull!16334) mapValue!53258)) b!1293983))

(assert (= (and b!1293984 ((_ is ValueCellFull!16334) mapDefault!53258)) b!1293977))

(assert (= start!109336 b!1293984))

(declare-fun m!1185855 () Bool)

(assert (=> mapNonEmpty!53258 m!1185855))

(declare-fun m!1185857 () Bool)

(assert (=> b!1293986 m!1185857))

(declare-fun m!1185859 () Bool)

(assert (=> b!1293986 m!1185859))

(declare-fun m!1185861 () Bool)

(assert (=> b!1293987 m!1185861))

(assert (=> b!1293987 m!1185861))

(declare-fun m!1185863 () Bool)

(assert (=> b!1293987 m!1185863))

(declare-fun m!1185865 () Bool)

(assert (=> b!1293978 m!1185865))

(declare-fun m!1185867 () Bool)

(assert (=> b!1293980 m!1185867))

(declare-fun m!1185869 () Bool)

(assert (=> b!1293982 m!1185869))

(assert (=> b!1293982 m!1185869))

(declare-fun m!1185871 () Bool)

(assert (=> b!1293982 m!1185871))

(declare-fun m!1185873 () Bool)

(assert (=> start!109336 m!1185873))

(declare-fun m!1185875 () Bool)

(assert (=> start!109336 m!1185875))

(declare-fun m!1185877 () Bool)

(assert (=> start!109336 m!1185877))

(check-sat b_and!46897 (not b!1293982) (not start!109336) tp_is_empty!34465 (not b!1293978) (not b!1293986) (not mapNonEmpty!53258) (not b!1293980) (not b!1293987) (not b_next!28825))
(check-sat b_and!46897 (not b_next!28825))
