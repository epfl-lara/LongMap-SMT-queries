; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109278 () Bool)

(assert start!109278)

(declare-fun b_free!28767 () Bool)

(declare-fun b_next!28767 () Bool)

(assert (=> start!109278 (= b_free!28767 (not b_next!28767))))

(declare-fun tp!101419 () Bool)

(declare-fun b_and!46857 () Bool)

(assert (=> start!109278 (= tp!101419 b_and!46857)))

(declare-fun mapNonEmpty!53171 () Bool)

(declare-fun mapRes!53171 () Bool)

(declare-fun tp!101420 () Bool)

(declare-fun e!737963 () Bool)

(assert (=> mapNonEmpty!53171 (= mapRes!53171 (and tp!101420 e!737963))))

(declare-datatypes ((V!50979 0))(
  ( (V!50980 (val!17278 Int)) )
))
(declare-datatypes ((ValueCell!16305 0))(
  ( (ValueCellFull!16305 (v!19881 V!50979)) (EmptyCell!16305) )
))
(declare-fun mapRest!53171 () (Array (_ BitVec 32) ValueCell!16305))

(declare-fun mapValue!53171 () ValueCell!16305)

(declare-fun mapKey!53171 () (_ BitVec 32))

(declare-datatypes ((array!85844 0))(
  ( (array!85845 (arr!41423 (Array (_ BitVec 32) ValueCell!16305)) (size!41973 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85844)

(assert (=> mapNonEmpty!53171 (= (arr!41423 _values!1445) (store mapRest!53171 mapKey!53171 mapValue!53171))))

(declare-fun b!1293008 () Bool)

(declare-fun e!737958 () Bool)

(declare-fun e!737961 () Bool)

(assert (=> b!1293008 (= e!737958 (and e!737961 mapRes!53171))))

(declare-fun condMapEmpty!53171 () Bool)

(declare-fun mapDefault!53171 () ValueCell!16305)

(assert (=> b!1293008 (= condMapEmpty!53171 (= (arr!41423 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16305)) mapDefault!53171)))))

(declare-fun b!1293009 () Bool)

(declare-fun res!859179 () Bool)

(declare-fun e!737959 () Bool)

(assert (=> b!1293009 (=> (not res!859179) (not e!737959))))

(declare-datatypes ((array!85846 0))(
  ( (array!85847 (arr!41424 (Array (_ BitVec 32) (_ BitVec 64))) (size!41974 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85846)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85846 (_ BitVec 32)) Bool)

(assert (=> b!1293009 (= res!859179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293010 () Bool)

(declare-fun res!859181 () Bool)

(assert (=> b!1293010 (=> (not res!859181) (not e!737959))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293010 (= res!859181 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41974 _keys!1741))))))

(declare-fun b!1293011 () Bool)

(declare-fun res!859182 () Bool)

(assert (=> b!1293011 (=> (not res!859182) (not e!737959))))

(declare-fun minValue!1387 () V!50979)

(declare-fun zeroValue!1387 () V!50979)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22234 0))(
  ( (tuple2!22235 (_1!11128 (_ BitVec 64)) (_2!11128 V!50979)) )
))
(declare-datatypes ((List!29384 0))(
  ( (Nil!29381) (Cons!29380 (h!30589 tuple2!22234) (t!42948 List!29384)) )
))
(declare-datatypes ((ListLongMap!19891 0))(
  ( (ListLongMap!19892 (toList!9961 List!29384)) )
))
(declare-fun contains!8079 (ListLongMap!19891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5005 (array!85846 array!85844 (_ BitVec 32) (_ BitVec 32) V!50979 V!50979 (_ BitVec 32) Int) ListLongMap!19891)

(assert (=> b!1293011 (= res!859182 (contains!8079 (getCurrentListMap!5005 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293012 () Bool)

(declare-fun e!737960 () Bool)

(assert (=> b!1293012 (= e!737959 (not e!737960))))

(declare-fun res!859175 () Bool)

(assert (=> b!1293012 (=> res!859175 e!737960)))

(assert (=> b!1293012 (= res!859175 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293012 (not (contains!8079 (ListLongMap!19892 Nil!29381) k0!1205))))

(declare-datatypes ((Unit!42820 0))(
  ( (Unit!42821) )
))
(declare-fun lt!579441 () Unit!42820)

(declare-fun emptyContainsNothing!132 ((_ BitVec 64)) Unit!42820)

(assert (=> b!1293012 (= lt!579441 (emptyContainsNothing!132 k0!1205))))

(declare-fun b!1293013 () Bool)

(declare-fun res!859174 () Bool)

(assert (=> b!1293013 (=> (not res!859174) (not e!737959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293013 (= res!859174 (not (validKeyInArray!0 (select (arr!41424 _keys!1741) from!2144))))))

(declare-fun b!1293014 () Bool)

(assert (=> b!1293014 (= e!737960 true)))

(declare-fun lt!579442 () ListLongMap!19891)

(declare-fun +!4396 (ListLongMap!19891 tuple2!22234) ListLongMap!19891)

(assert (=> b!1293014 (not (contains!8079 (+!4396 lt!579442 (tuple2!22235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579443 () Unit!42820)

(declare-fun addStillNotContains!414 (ListLongMap!19891 (_ BitVec 64) V!50979 (_ BitVec 64)) Unit!42820)

(assert (=> b!1293014 (= lt!579443 (addStillNotContains!414 lt!579442 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6028 (array!85846 array!85844 (_ BitVec 32) (_ BitVec 32) V!50979 V!50979 (_ BitVec 32) Int) ListLongMap!19891)

(assert (=> b!1293014 (= lt!579442 (getCurrentListMapNoExtraKeys!6028 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293015 () Bool)

(declare-fun res!859176 () Bool)

(assert (=> b!1293015 (=> (not res!859176) (not e!737959))))

(assert (=> b!1293015 (= res!859176 (and (= (size!41973 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41974 _keys!1741) (size!41973 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293017 () Bool)

(declare-fun res!859180 () Bool)

(assert (=> b!1293017 (=> (not res!859180) (not e!737959))))

(declare-datatypes ((List!29385 0))(
  ( (Nil!29382) (Cons!29381 (h!30590 (_ BitVec 64)) (t!42949 List!29385)) )
))
(declare-fun arrayNoDuplicates!0 (array!85846 (_ BitVec 32) List!29385) Bool)

(assert (=> b!1293017 (= res!859180 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29382))))

(declare-fun b!1293018 () Bool)

(declare-fun res!859178 () Bool)

(assert (=> b!1293018 (=> (not res!859178) (not e!737959))))

(assert (=> b!1293018 (= res!859178 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41974 _keys!1741))))))

(declare-fun res!859177 () Bool)

(assert (=> start!109278 (=> (not res!859177) (not e!737959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109278 (= res!859177 (validMask!0 mask!2175))))

(assert (=> start!109278 e!737959))

(declare-fun tp_is_empty!34407 () Bool)

(assert (=> start!109278 tp_is_empty!34407))

(assert (=> start!109278 true))

(declare-fun array_inv!31385 (array!85844) Bool)

(assert (=> start!109278 (and (array_inv!31385 _values!1445) e!737958)))

(declare-fun array_inv!31386 (array!85846) Bool)

(assert (=> start!109278 (array_inv!31386 _keys!1741)))

(assert (=> start!109278 tp!101419))

(declare-fun b!1293016 () Bool)

(assert (=> b!1293016 (= e!737961 tp_is_empty!34407)))

(declare-fun b!1293019 () Bool)

(assert (=> b!1293019 (= e!737963 tp_is_empty!34407)))

(declare-fun mapIsEmpty!53171 () Bool)

(assert (=> mapIsEmpty!53171 mapRes!53171))

(assert (= (and start!109278 res!859177) b!1293015))

(assert (= (and b!1293015 res!859176) b!1293009))

(assert (= (and b!1293009 res!859179) b!1293017))

(assert (= (and b!1293017 res!859180) b!1293018))

(assert (= (and b!1293018 res!859178) b!1293011))

(assert (= (and b!1293011 res!859182) b!1293010))

(assert (= (and b!1293010 res!859181) b!1293013))

(assert (= (and b!1293013 res!859174) b!1293012))

(assert (= (and b!1293012 (not res!859175)) b!1293014))

(assert (= (and b!1293008 condMapEmpty!53171) mapIsEmpty!53171))

(assert (= (and b!1293008 (not condMapEmpty!53171)) mapNonEmpty!53171))

(get-info :version)

(assert (= (and mapNonEmpty!53171 ((_ is ValueCellFull!16305) mapValue!53171)) b!1293019))

(assert (= (and b!1293008 ((_ is ValueCellFull!16305) mapDefault!53171)) b!1293016))

(assert (= start!109278 b!1293008))

(declare-fun m!1185451 () Bool)

(assert (=> b!1293011 m!1185451))

(assert (=> b!1293011 m!1185451))

(declare-fun m!1185453 () Bool)

(assert (=> b!1293011 m!1185453))

(declare-fun m!1185455 () Bool)

(assert (=> b!1293014 m!1185455))

(assert (=> b!1293014 m!1185455))

(declare-fun m!1185457 () Bool)

(assert (=> b!1293014 m!1185457))

(declare-fun m!1185459 () Bool)

(assert (=> b!1293014 m!1185459))

(declare-fun m!1185461 () Bool)

(assert (=> b!1293014 m!1185461))

(declare-fun m!1185463 () Bool)

(assert (=> b!1293013 m!1185463))

(assert (=> b!1293013 m!1185463))

(declare-fun m!1185465 () Bool)

(assert (=> b!1293013 m!1185465))

(declare-fun m!1185467 () Bool)

(assert (=> b!1293017 m!1185467))

(declare-fun m!1185469 () Bool)

(assert (=> b!1293009 m!1185469))

(declare-fun m!1185471 () Bool)

(assert (=> b!1293012 m!1185471))

(declare-fun m!1185473 () Bool)

(assert (=> b!1293012 m!1185473))

(declare-fun m!1185475 () Bool)

(assert (=> start!109278 m!1185475))

(declare-fun m!1185477 () Bool)

(assert (=> start!109278 m!1185477))

(declare-fun m!1185479 () Bool)

(assert (=> start!109278 m!1185479))

(declare-fun m!1185481 () Bool)

(assert (=> mapNonEmpty!53171 m!1185481))

(check-sat (not mapNonEmpty!53171) (not b!1293009) tp_is_empty!34407 (not start!109278) (not b!1293013) (not b!1293011) (not b!1293012) (not b!1293014) (not b!1293017) (not b_next!28767) b_and!46857)
(check-sat b_and!46857 (not b_next!28767))
