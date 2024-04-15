; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109114 () Bool)

(assert start!109114)

(declare-fun b_free!28603 () Bool)

(declare-fun b_next!28603 () Bool)

(assert (=> start!109114 (= b_free!28603 (not b_next!28603))))

(declare-fun tp!100928 () Bool)

(declare-fun b_and!46675 () Bool)

(assert (=> start!109114 (= tp!100928 b_and!46675)))

(declare-fun b!1290073 () Bool)

(declare-fun e!736536 () Bool)

(declare-fun e!736534 () Bool)

(declare-fun mapRes!52925 () Bool)

(assert (=> b!1290073 (= e!736536 (and e!736534 mapRes!52925))))

(declare-fun condMapEmpty!52925 () Bool)

(declare-datatypes ((V!50761 0))(
  ( (V!50762 (val!17196 Int)) )
))
(declare-datatypes ((ValueCell!16223 0))(
  ( (ValueCellFull!16223 (v!19798 V!50761)) (EmptyCell!16223) )
))
(declare-datatypes ((array!85415 0))(
  ( (array!85416 (arr!41209 (Array (_ BitVec 32) ValueCell!16223)) (size!41761 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85415)

(declare-fun mapDefault!52925 () ValueCell!16223)

(assert (=> b!1290073 (= condMapEmpty!52925 (= (arr!41209 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16223)) mapDefault!52925)))))

(declare-fun b!1290074 () Bool)

(declare-fun e!736538 () Bool)

(assert (=> b!1290074 (= e!736538 true)))

(declare-datatypes ((tuple2!22144 0))(
  ( (tuple2!22145 (_1!11083 (_ BitVec 64)) (_2!11083 V!50761)) )
))
(declare-datatypes ((List!29303 0))(
  ( (Nil!29300) (Cons!29299 (h!30508 tuple2!22144) (t!42859 List!29303)) )
))
(declare-datatypes ((ListLongMap!19801 0))(
  ( (ListLongMap!19802 (toList!9916 List!29303)) )
))
(declare-fun lt!578313 () ListLongMap!19801)

(declare-fun minValue!1387 () V!50761)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7964 (ListLongMap!19801 (_ BitVec 64)) Bool)

(declare-fun +!4396 (ListLongMap!19801 tuple2!22144) ListLongMap!19801)

(assert (=> b!1290074 (not (contains!7964 (+!4396 lt!578313 (tuple2!22145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42530 0))(
  ( (Unit!42531) )
))
(declare-fun lt!578314 () Unit!42530)

(declare-fun addStillNotContains!373 (ListLongMap!19801 (_ BitVec 64) V!50761 (_ BitVec 64)) Unit!42530)

(assert (=> b!1290074 (= lt!578314 (addStillNotContains!373 lt!578313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50761)

(assert (=> b!1290074 (not (contains!7964 (+!4396 lt!578313 (tuple2!22145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578312 () Unit!42530)

(assert (=> b!1290074 (= lt!578312 (addStillNotContains!373 lt!578313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85417 0))(
  ( (array!85418 (arr!41210 (Array (_ BitVec 32) (_ BitVec 64))) (size!41762 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85417)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6027 (array!85417 array!85415 (_ BitVec 32) (_ BitVec 32) V!50761 V!50761 (_ BitVec 32) Int) ListLongMap!19801)

(assert (=> b!1290074 (= lt!578313 (getCurrentListMapNoExtraKeys!6027 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290075 () Bool)

(declare-fun res!857018 () Bool)

(declare-fun e!736537 () Bool)

(assert (=> b!1290075 (=> (not res!857018) (not e!736537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85417 (_ BitVec 32)) Bool)

(assert (=> b!1290075 (= res!857018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290076 () Bool)

(assert (=> b!1290076 (= e!736537 (not e!736538))))

(declare-fun res!857014 () Bool)

(assert (=> b!1290076 (=> res!857014 e!736538)))

(assert (=> b!1290076 (= res!857014 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290076 (not (contains!7964 (ListLongMap!19802 Nil!29300) k0!1205))))

(declare-fun lt!578311 () Unit!42530)

(declare-fun emptyContainsNothing!65 ((_ BitVec 64)) Unit!42530)

(assert (=> b!1290076 (= lt!578311 (emptyContainsNothing!65 k0!1205))))

(declare-fun b!1290077 () Bool)

(declare-fun res!857019 () Bool)

(assert (=> b!1290077 (=> (not res!857019) (not e!736537))))

(declare-fun getCurrentListMap!4866 (array!85417 array!85415 (_ BitVec 32) (_ BitVec 32) V!50761 V!50761 (_ BitVec 32) Int) ListLongMap!19801)

(assert (=> b!1290077 (= res!857019 (contains!7964 (getCurrentListMap!4866 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290078 () Bool)

(declare-fun tp_is_empty!34243 () Bool)

(assert (=> b!1290078 (= e!736534 tp_is_empty!34243)))

(declare-fun b!1290079 () Bool)

(declare-fun e!736539 () Bool)

(assert (=> b!1290079 (= e!736539 tp_is_empty!34243)))

(declare-fun res!857016 () Bool)

(assert (=> start!109114 (=> (not res!857016) (not e!736537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109114 (= res!857016 (validMask!0 mask!2175))))

(assert (=> start!109114 e!736537))

(assert (=> start!109114 tp_is_empty!34243))

(assert (=> start!109114 true))

(declare-fun array_inv!31397 (array!85415) Bool)

(assert (=> start!109114 (and (array_inv!31397 _values!1445) e!736536)))

(declare-fun array_inv!31398 (array!85417) Bool)

(assert (=> start!109114 (array_inv!31398 _keys!1741)))

(assert (=> start!109114 tp!100928))

(declare-fun b!1290080 () Bool)

(declare-fun res!857021 () Bool)

(assert (=> b!1290080 (=> (not res!857021) (not e!736537))))

(assert (=> b!1290080 (= res!857021 (and (= (size!41761 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41762 _keys!1741) (size!41761 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290081 () Bool)

(declare-fun res!857022 () Bool)

(assert (=> b!1290081 (=> (not res!857022) (not e!736537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290081 (= res!857022 (not (validKeyInArray!0 (select (arr!41210 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52925 () Bool)

(assert (=> mapIsEmpty!52925 mapRes!52925))

(declare-fun mapNonEmpty!52925 () Bool)

(declare-fun tp!100929 () Bool)

(assert (=> mapNonEmpty!52925 (= mapRes!52925 (and tp!100929 e!736539))))

(declare-fun mapRest!52925 () (Array (_ BitVec 32) ValueCell!16223))

(declare-fun mapKey!52925 () (_ BitVec 32))

(declare-fun mapValue!52925 () ValueCell!16223)

(assert (=> mapNonEmpty!52925 (= (arr!41209 _values!1445) (store mapRest!52925 mapKey!52925 mapValue!52925))))

(declare-fun b!1290082 () Bool)

(declare-fun res!857017 () Bool)

(assert (=> b!1290082 (=> (not res!857017) (not e!736537))))

(declare-datatypes ((List!29304 0))(
  ( (Nil!29301) (Cons!29300 (h!30509 (_ BitVec 64)) (t!42860 List!29304)) )
))
(declare-fun arrayNoDuplicates!0 (array!85417 (_ BitVec 32) List!29304) Bool)

(assert (=> b!1290082 (= res!857017 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29301))))

(declare-fun b!1290083 () Bool)

(declare-fun res!857020 () Bool)

(assert (=> b!1290083 (=> (not res!857020) (not e!736537))))

(assert (=> b!1290083 (= res!857020 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41762 _keys!1741))))))

(declare-fun b!1290084 () Bool)

(declare-fun res!857015 () Bool)

(assert (=> b!1290084 (=> (not res!857015) (not e!736537))))

(assert (=> b!1290084 (= res!857015 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41762 _keys!1741))))))

(assert (= (and start!109114 res!857016) b!1290080))

(assert (= (and b!1290080 res!857021) b!1290075))

(assert (= (and b!1290075 res!857018) b!1290082))

(assert (= (and b!1290082 res!857017) b!1290084))

(assert (= (and b!1290084 res!857015) b!1290077))

(assert (= (and b!1290077 res!857019) b!1290083))

(assert (= (and b!1290083 res!857020) b!1290081))

(assert (= (and b!1290081 res!857022) b!1290076))

(assert (= (and b!1290076 (not res!857014)) b!1290074))

(assert (= (and b!1290073 condMapEmpty!52925) mapIsEmpty!52925))

(assert (= (and b!1290073 (not condMapEmpty!52925)) mapNonEmpty!52925))

(get-info :version)

(assert (= (and mapNonEmpty!52925 ((_ is ValueCellFull!16223) mapValue!52925)) b!1290079))

(assert (= (and b!1290073 ((_ is ValueCellFull!16223) mapDefault!52925)) b!1290078))

(assert (= start!109114 b!1290073))

(declare-fun m!1182195 () Bool)

(assert (=> mapNonEmpty!52925 m!1182195))

(declare-fun m!1182197 () Bool)

(assert (=> b!1290075 m!1182197))

(declare-fun m!1182199 () Bool)

(assert (=> b!1290081 m!1182199))

(assert (=> b!1290081 m!1182199))

(declare-fun m!1182201 () Bool)

(assert (=> b!1290081 m!1182201))

(declare-fun m!1182203 () Bool)

(assert (=> b!1290082 m!1182203))

(declare-fun m!1182205 () Bool)

(assert (=> b!1290076 m!1182205))

(declare-fun m!1182207 () Bool)

(assert (=> b!1290076 m!1182207))

(declare-fun m!1182209 () Bool)

(assert (=> b!1290077 m!1182209))

(assert (=> b!1290077 m!1182209))

(declare-fun m!1182211 () Bool)

(assert (=> b!1290077 m!1182211))

(declare-fun m!1182213 () Bool)

(assert (=> start!109114 m!1182213))

(declare-fun m!1182215 () Bool)

(assert (=> start!109114 m!1182215))

(declare-fun m!1182217 () Bool)

(assert (=> start!109114 m!1182217))

(declare-fun m!1182219 () Bool)

(assert (=> b!1290074 m!1182219))

(declare-fun m!1182221 () Bool)

(assert (=> b!1290074 m!1182221))

(assert (=> b!1290074 m!1182219))

(declare-fun m!1182223 () Bool)

(assert (=> b!1290074 m!1182223))

(declare-fun m!1182225 () Bool)

(assert (=> b!1290074 m!1182225))

(assert (=> b!1290074 m!1182225))

(declare-fun m!1182227 () Bool)

(assert (=> b!1290074 m!1182227))

(declare-fun m!1182229 () Bool)

(assert (=> b!1290074 m!1182229))

(declare-fun m!1182231 () Bool)

(assert (=> b!1290074 m!1182231))

(check-sat tp_is_empty!34243 (not b!1290075) (not b!1290074) (not b_next!28603) (not start!109114) (not b!1290082) (not b!1290077) (not b!1290081) (not b!1290076) (not mapNonEmpty!52925) b_and!46675)
(check-sat b_and!46675 (not b_next!28603))
