; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109188 () Bool)

(assert start!109188)

(declare-fun b_free!28677 () Bool)

(declare-fun b_next!28677 () Bool)

(assert (=> start!109188 (= b_free!28677 (not b_next!28677))))

(declare-fun tp!101150 () Bool)

(declare-fun b_and!46767 () Bool)

(assert (=> start!109188 (= tp!101150 b_and!46767)))

(declare-fun b!1291469 () Bool)

(declare-fun e!737232 () Bool)

(declare-fun tp_is_empty!34317 () Bool)

(assert (=> b!1291469 (= e!737232 tp_is_empty!34317)))

(declare-fun b!1291470 () Bool)

(declare-fun res!858043 () Bool)

(declare-fun e!737229 () Bool)

(assert (=> b!1291470 (=> (not res!858043) (not e!737229))))

(declare-datatypes ((array!85670 0))(
  ( (array!85671 (arr!41336 (Array (_ BitVec 32) (_ BitVec 64))) (size!41886 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85670)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291470 (= res!858043 (not (validKeyInArray!0 (select (arr!41336 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53036 () Bool)

(declare-fun mapRes!53036 () Bool)

(declare-fun tp!101149 () Bool)

(assert (=> mapNonEmpty!53036 (= mapRes!53036 (and tp!101149 e!737232))))

(declare-fun mapKey!53036 () (_ BitVec 32))

(declare-datatypes ((V!50859 0))(
  ( (V!50860 (val!17233 Int)) )
))
(declare-datatypes ((ValueCell!16260 0))(
  ( (ValueCellFull!16260 (v!19836 V!50859)) (EmptyCell!16260) )
))
(declare-fun mapValue!53036 () ValueCell!16260)

(declare-datatypes ((array!85672 0))(
  ( (array!85673 (arr!41337 (Array (_ BitVec 32) ValueCell!16260)) (size!41887 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85672)

(declare-fun mapRest!53036 () (Array (_ BitVec 32) ValueCell!16260))

(assert (=> mapNonEmpty!53036 (= (arr!41337 _values!1445) (store mapRest!53036 mapKey!53036 mapValue!53036))))

(declare-fun b!1291471 () Bool)

(declare-fun e!737233 () Bool)

(assert (=> b!1291471 (= e!737233 tp_is_empty!34317)))

(declare-fun b!1291472 () Bool)

(declare-fun e!737230 () Bool)

(assert (=> b!1291472 (= e!737229 (not e!737230))))

(declare-fun res!858048 () Bool)

(assert (=> b!1291472 (=> res!858048 e!737230)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291472 (= res!858048 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22158 0))(
  ( (tuple2!22159 (_1!11090 (_ BitVec 64)) (_2!11090 V!50859)) )
))
(declare-datatypes ((List!29315 0))(
  ( (Nil!29312) (Cons!29311 (h!30520 tuple2!22158) (t!42879 List!29315)) )
))
(declare-datatypes ((ListLongMap!19815 0))(
  ( (ListLongMap!19816 (toList!9923 List!29315)) )
))
(declare-fun contains!8041 (ListLongMap!19815 (_ BitVec 64)) Bool)

(assert (=> b!1291472 (not (contains!8041 (ListLongMap!19816 Nil!29312) k0!1205))))

(declare-datatypes ((Unit!42758 0))(
  ( (Unit!42759) )
))
(declare-fun lt!579146 () Unit!42758)

(declare-fun emptyContainsNothing!101 ((_ BitVec 64)) Unit!42758)

(assert (=> b!1291472 (= lt!579146 (emptyContainsNothing!101 k0!1205))))

(declare-fun b!1291473 () Bool)

(assert (=> b!1291473 (= e!737230 true)))

(assert (=> b!1291473 false))

(declare-fun minValue!1387 () V!50859)

(declare-fun lt!579141 () ListLongMap!19815)

(declare-fun lt!579143 () Unit!42758)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!61 ((_ BitVec 64) (_ BitVec 64) V!50859 ListLongMap!19815) Unit!42758)

(assert (=> b!1291473 (= lt!579143 (lemmaInListMapAfterAddingDiffThenInBefore!61 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579141))))

(declare-fun lt!579142 () ListLongMap!19815)

(declare-fun +!4387 (ListLongMap!19815 tuple2!22158) ListLongMap!19815)

(assert (=> b!1291473 (not (contains!8041 (+!4387 lt!579142 (tuple2!22159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579144 () Unit!42758)

(declare-fun addStillNotContains!405 (ListLongMap!19815 (_ BitVec 64) V!50859 (_ BitVec 64)) Unit!42758)

(assert (=> b!1291473 (= lt!579144 (addStillNotContains!405 lt!579142 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291473 (not (contains!8041 lt!579141 k0!1205))))

(declare-fun zeroValue!1387 () V!50859)

(assert (=> b!1291473 (= lt!579141 (+!4387 lt!579142 (tuple2!22159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579145 () Unit!42758)

(assert (=> b!1291473 (= lt!579145 (addStillNotContains!405 lt!579142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6018 (array!85670 array!85672 (_ BitVec 32) (_ BitVec 32) V!50859 V!50859 (_ BitVec 32) Int) ListLongMap!19815)

(assert (=> b!1291473 (= lt!579142 (getCurrentListMapNoExtraKeys!6018 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!858045 () Bool)

(assert (=> start!109188 (=> (not res!858045) (not e!737229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109188 (= res!858045 (validMask!0 mask!2175))))

(assert (=> start!109188 e!737229))

(assert (=> start!109188 tp_is_empty!34317))

(assert (=> start!109188 true))

(declare-fun e!737234 () Bool)

(declare-fun array_inv!31323 (array!85672) Bool)

(assert (=> start!109188 (and (array_inv!31323 _values!1445) e!737234)))

(declare-fun array_inv!31324 (array!85670) Bool)

(assert (=> start!109188 (array_inv!31324 _keys!1741)))

(assert (=> start!109188 tp!101150))

(declare-fun mapIsEmpty!53036 () Bool)

(assert (=> mapIsEmpty!53036 mapRes!53036))

(declare-fun b!1291474 () Bool)

(declare-fun res!858041 () Bool)

(assert (=> b!1291474 (=> (not res!858041) (not e!737229))))

(assert (=> b!1291474 (= res!858041 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41886 _keys!1741))))))

(declare-fun b!1291475 () Bool)

(declare-fun res!858046 () Bool)

(assert (=> b!1291475 (=> (not res!858046) (not e!737229))))

(assert (=> b!1291475 (= res!858046 (and (= (size!41887 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41886 _keys!1741) (size!41887 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291476 () Bool)

(declare-fun res!858040 () Bool)

(assert (=> b!1291476 (=> (not res!858040) (not e!737229))))

(assert (=> b!1291476 (= res!858040 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41886 _keys!1741))))))

(declare-fun b!1291477 () Bool)

(declare-fun res!858047 () Bool)

(assert (=> b!1291477 (=> (not res!858047) (not e!737229))))

(declare-datatypes ((List!29316 0))(
  ( (Nil!29313) (Cons!29312 (h!30521 (_ BitVec 64)) (t!42880 List!29316)) )
))
(declare-fun arrayNoDuplicates!0 (array!85670 (_ BitVec 32) List!29316) Bool)

(assert (=> b!1291477 (= res!858047 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29313))))

(declare-fun b!1291478 () Bool)

(assert (=> b!1291478 (= e!737234 (and e!737233 mapRes!53036))))

(declare-fun condMapEmpty!53036 () Bool)

(declare-fun mapDefault!53036 () ValueCell!16260)

(assert (=> b!1291478 (= condMapEmpty!53036 (= (arr!41337 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16260)) mapDefault!53036)))))

(declare-fun b!1291479 () Bool)

(declare-fun res!858044 () Bool)

(assert (=> b!1291479 (=> (not res!858044) (not e!737229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85670 (_ BitVec 32)) Bool)

(assert (=> b!1291479 (= res!858044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291480 () Bool)

(declare-fun res!858042 () Bool)

(assert (=> b!1291480 (=> (not res!858042) (not e!737229))))

(declare-fun getCurrentListMap!4974 (array!85670 array!85672 (_ BitVec 32) (_ BitVec 32) V!50859 V!50859 (_ BitVec 32) Int) ListLongMap!19815)

(assert (=> b!1291480 (= res!858042 (contains!8041 (getCurrentListMap!4974 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109188 res!858045) b!1291475))

(assert (= (and b!1291475 res!858046) b!1291479))

(assert (= (and b!1291479 res!858044) b!1291477))

(assert (= (and b!1291477 res!858047) b!1291476))

(assert (= (and b!1291476 res!858040) b!1291480))

(assert (= (and b!1291480 res!858042) b!1291474))

(assert (= (and b!1291474 res!858041) b!1291470))

(assert (= (and b!1291470 res!858043) b!1291472))

(assert (= (and b!1291472 (not res!858048)) b!1291473))

(assert (= (and b!1291478 condMapEmpty!53036) mapIsEmpty!53036))

(assert (= (and b!1291478 (not condMapEmpty!53036)) mapNonEmpty!53036))

(get-info :version)

(assert (= (and mapNonEmpty!53036 ((_ is ValueCellFull!16260) mapValue!53036)) b!1291469))

(assert (= (and b!1291478 ((_ is ValueCellFull!16260) mapDefault!53036)) b!1291471))

(assert (= start!109188 b!1291478))

(declare-fun m!1184175 () Bool)

(assert (=> b!1291479 m!1184175))

(declare-fun m!1184177 () Bool)

(assert (=> b!1291472 m!1184177))

(declare-fun m!1184179 () Bool)

(assert (=> b!1291472 m!1184179))

(declare-fun m!1184181 () Bool)

(assert (=> b!1291477 m!1184181))

(declare-fun m!1184183 () Bool)

(assert (=> mapNonEmpty!53036 m!1184183))

(declare-fun m!1184185 () Bool)

(assert (=> b!1291480 m!1184185))

(assert (=> b!1291480 m!1184185))

(declare-fun m!1184187 () Bool)

(assert (=> b!1291480 m!1184187))

(declare-fun m!1184189 () Bool)

(assert (=> b!1291470 m!1184189))

(assert (=> b!1291470 m!1184189))

(declare-fun m!1184191 () Bool)

(assert (=> b!1291470 m!1184191))

(declare-fun m!1184193 () Bool)

(assert (=> b!1291473 m!1184193))

(declare-fun m!1184195 () Bool)

(assert (=> b!1291473 m!1184195))

(assert (=> b!1291473 m!1184195))

(declare-fun m!1184197 () Bool)

(assert (=> b!1291473 m!1184197))

(declare-fun m!1184199 () Bool)

(assert (=> b!1291473 m!1184199))

(declare-fun m!1184201 () Bool)

(assert (=> b!1291473 m!1184201))

(declare-fun m!1184203 () Bool)

(assert (=> b!1291473 m!1184203))

(declare-fun m!1184205 () Bool)

(assert (=> b!1291473 m!1184205))

(declare-fun m!1184207 () Bool)

(assert (=> b!1291473 m!1184207))

(declare-fun m!1184209 () Bool)

(assert (=> start!109188 m!1184209))

(declare-fun m!1184211 () Bool)

(assert (=> start!109188 m!1184211))

(declare-fun m!1184213 () Bool)

(assert (=> start!109188 m!1184213))

(check-sat (not b!1291479) (not b!1291472) (not start!109188) (not b!1291480) (not b!1291470) (not b_next!28677) (not b!1291477) tp_is_empty!34317 b_and!46767 (not mapNonEmpty!53036) (not b!1291473))
(check-sat b_and!46767 (not b_next!28677))
