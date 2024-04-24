; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109332 () Bool)

(assert start!109332)

(declare-fun b_free!28597 () Bool)

(declare-fun b_next!28597 () Bool)

(assert (=> start!109332 (= b_free!28597 (not b_next!28597))))

(declare-fun tp!100910 () Bool)

(declare-fun b_and!46689 () Bool)

(assert (=> start!109332 (= tp!100910 b_and!46689)))

(declare-fun mapIsEmpty!52916 () Bool)

(declare-fun mapRes!52916 () Bool)

(assert (=> mapIsEmpty!52916 mapRes!52916))

(declare-fun b!1291335 () Bool)

(declare-fun res!857481 () Bool)

(declare-fun e!737359 () Bool)

(assert (=> b!1291335 (=> (not res!857481) (not e!737359))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50753 0))(
  ( (V!50754 (val!17193 Int)) )
))
(declare-datatypes ((ValueCell!16220 0))(
  ( (ValueCellFull!16220 (v!19791 V!50753)) (EmptyCell!16220) )
))
(declare-datatypes ((array!85553 0))(
  ( (array!85554 (arr!41273 (Array (_ BitVec 32) ValueCell!16220)) (size!41824 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85553)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85555 0))(
  ( (array!85556 (arr!41274 (Array (_ BitVec 32) (_ BitVec 64))) (size!41825 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85555)

(assert (=> b!1291335 (= res!857481 (and (= (size!41824 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41825 _keys!1741) (size!41824 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291336 () Bool)

(declare-fun res!857484 () Bool)

(assert (=> b!1291336 (=> (not res!857484) (not e!737359))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291336 (= res!857484 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41825 _keys!1741))))))

(declare-fun b!1291337 () Bool)

(declare-fun res!857480 () Bool)

(assert (=> b!1291337 (=> (not res!857480) (not e!737359))))

(declare-fun minValue!1387 () V!50753)

(declare-fun zeroValue!1387 () V!50753)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22102 0))(
  ( (tuple2!22103 (_1!11062 (_ BitVec 64)) (_2!11062 V!50753)) )
))
(declare-datatypes ((List!29282 0))(
  ( (Nil!29279) (Cons!29278 (h!30496 tuple2!22102) (t!42838 List!29282)) )
))
(declare-datatypes ((ListLongMap!19767 0))(
  ( (ListLongMap!19768 (toList!9899 List!29282)) )
))
(declare-fun contains!8030 (ListLongMap!19767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4942 (array!85555 array!85553 (_ BitVec 32) (_ BitVec 32) V!50753 V!50753 (_ BitVec 32) Int) ListLongMap!19767)

(assert (=> b!1291337 (= res!857480 (contains!8030 (getCurrentListMap!4942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291338 () Bool)

(declare-fun e!737357 () Bool)

(assert (=> b!1291338 (= e!737357 true)))

(declare-fun lt!578938 () ListLongMap!19767)

(declare-fun +!4401 (ListLongMap!19767 tuple2!22102) ListLongMap!19767)

(assert (=> b!1291338 (not (contains!8030 (+!4401 lt!578938 (tuple2!22103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42647 0))(
  ( (Unit!42648) )
))
(declare-fun lt!578939 () Unit!42647)

(declare-fun addStillNotContains!377 (ListLongMap!19767 (_ BitVec 64) V!50753 (_ BitVec 64)) Unit!42647)

(assert (=> b!1291338 (= lt!578939 (addStillNotContains!377 lt!578938 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291338 (not (contains!8030 (+!4401 lt!578938 (tuple2!22103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578940 () Unit!42647)

(assert (=> b!1291338 (= lt!578940 (addStillNotContains!377 lt!578938 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6039 (array!85555 array!85553 (_ BitVec 32) (_ BitVec 32) V!50753 V!50753 (_ BitVec 32) Int) ListLongMap!19767)

(assert (=> b!1291338 (= lt!578938 (getCurrentListMapNoExtraKeys!6039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291339 () Bool)

(assert (=> b!1291339 (= e!737359 (not e!737357))))

(declare-fun res!857486 () Bool)

(assert (=> b!1291339 (=> res!857486 e!737357)))

(assert (=> b!1291339 (= res!857486 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291339 (not (contains!8030 (ListLongMap!19768 Nil!29279) k0!1205))))

(declare-fun lt!578937 () Unit!42647)

(declare-fun emptyContainsNothing!74 ((_ BitVec 64)) Unit!42647)

(assert (=> b!1291339 (= lt!578937 (emptyContainsNothing!74 k0!1205))))

(declare-fun b!1291340 () Bool)

(declare-fun res!857487 () Bool)

(assert (=> b!1291340 (=> (not res!857487) (not e!737359))))

(declare-datatypes ((List!29283 0))(
  ( (Nil!29280) (Cons!29279 (h!30497 (_ BitVec 64)) (t!42839 List!29283)) )
))
(declare-fun arrayNoDuplicates!0 (array!85555 (_ BitVec 32) List!29283) Bool)

(assert (=> b!1291340 (= res!857487 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29280))))

(declare-fun b!1291341 () Bool)

(declare-fun res!857483 () Bool)

(assert (=> b!1291341 (=> (not res!857483) (not e!737359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85555 (_ BitVec 32)) Bool)

(assert (=> b!1291341 (= res!857483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291342 () Bool)

(declare-fun res!857488 () Bool)

(assert (=> b!1291342 (=> (not res!857488) (not e!737359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291342 (= res!857488 (not (validKeyInArray!0 (select (arr!41274 _keys!1741) from!2144))))))

(declare-fun b!1291343 () Bool)

(declare-fun e!737361 () Bool)

(declare-fun tp_is_empty!34237 () Bool)

(assert (=> b!1291343 (= e!737361 tp_is_empty!34237)))

(declare-fun mapNonEmpty!52916 () Bool)

(declare-fun tp!100909 () Bool)

(assert (=> mapNonEmpty!52916 (= mapRes!52916 (and tp!100909 e!737361))))

(declare-fun mapValue!52916 () ValueCell!16220)

(declare-fun mapKey!52916 () (_ BitVec 32))

(declare-fun mapRest!52916 () (Array (_ BitVec 32) ValueCell!16220))

(assert (=> mapNonEmpty!52916 (= (arr!41273 _values!1445) (store mapRest!52916 mapKey!52916 mapValue!52916))))

(declare-fun res!857482 () Bool)

(assert (=> start!109332 (=> (not res!857482) (not e!737359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109332 (= res!857482 (validMask!0 mask!2175))))

(assert (=> start!109332 e!737359))

(assert (=> start!109332 tp_is_empty!34237))

(assert (=> start!109332 true))

(declare-fun e!737358 () Bool)

(declare-fun array_inv!31501 (array!85553) Bool)

(assert (=> start!109332 (and (array_inv!31501 _values!1445) e!737358)))

(declare-fun array_inv!31502 (array!85555) Bool)

(assert (=> start!109332 (array_inv!31502 _keys!1741)))

(assert (=> start!109332 tp!100910))

(declare-fun b!1291334 () Bool)

(declare-fun e!737356 () Bool)

(assert (=> b!1291334 (= e!737358 (and e!737356 mapRes!52916))))

(declare-fun condMapEmpty!52916 () Bool)

(declare-fun mapDefault!52916 () ValueCell!16220)

(assert (=> b!1291334 (= condMapEmpty!52916 (= (arr!41273 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16220)) mapDefault!52916)))))

(declare-fun b!1291344 () Bool)

(declare-fun res!857485 () Bool)

(assert (=> b!1291344 (=> (not res!857485) (not e!737359))))

(assert (=> b!1291344 (= res!857485 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41825 _keys!1741))))))

(declare-fun b!1291345 () Bool)

(assert (=> b!1291345 (= e!737356 tp_is_empty!34237)))

(assert (= (and start!109332 res!857482) b!1291335))

(assert (= (and b!1291335 res!857481) b!1291341))

(assert (= (and b!1291341 res!857483) b!1291340))

(assert (= (and b!1291340 res!857487) b!1291336))

(assert (= (and b!1291336 res!857484) b!1291337))

(assert (= (and b!1291337 res!857480) b!1291344))

(assert (= (and b!1291344 res!857485) b!1291342))

(assert (= (and b!1291342 res!857488) b!1291339))

(assert (= (and b!1291339 (not res!857486)) b!1291338))

(assert (= (and b!1291334 condMapEmpty!52916) mapIsEmpty!52916))

(assert (= (and b!1291334 (not condMapEmpty!52916)) mapNonEmpty!52916))

(get-info :version)

(assert (= (and mapNonEmpty!52916 ((_ is ValueCellFull!16220) mapValue!52916)) b!1291343))

(assert (= (and b!1291334 ((_ is ValueCellFull!16220) mapDefault!52916)) b!1291345))

(assert (= start!109332 b!1291334))

(declare-fun m!1184199 () Bool)

(assert (=> b!1291342 m!1184199))

(assert (=> b!1291342 m!1184199))

(declare-fun m!1184201 () Bool)

(assert (=> b!1291342 m!1184201))

(declare-fun m!1184203 () Bool)

(assert (=> b!1291340 m!1184203))

(declare-fun m!1184205 () Bool)

(assert (=> b!1291337 m!1184205))

(assert (=> b!1291337 m!1184205))

(declare-fun m!1184207 () Bool)

(assert (=> b!1291337 m!1184207))

(declare-fun m!1184209 () Bool)

(assert (=> mapNonEmpty!52916 m!1184209))

(declare-fun m!1184211 () Bool)

(assert (=> b!1291338 m!1184211))

(declare-fun m!1184213 () Bool)

(assert (=> b!1291338 m!1184213))

(declare-fun m!1184215 () Bool)

(assert (=> b!1291338 m!1184215))

(assert (=> b!1291338 m!1184211))

(declare-fun m!1184217 () Bool)

(assert (=> b!1291338 m!1184217))

(declare-fun m!1184219 () Bool)

(assert (=> b!1291338 m!1184219))

(assert (=> b!1291338 m!1184215))

(declare-fun m!1184221 () Bool)

(assert (=> b!1291338 m!1184221))

(declare-fun m!1184223 () Bool)

(assert (=> b!1291338 m!1184223))

(declare-fun m!1184225 () Bool)

(assert (=> start!109332 m!1184225))

(declare-fun m!1184227 () Bool)

(assert (=> start!109332 m!1184227))

(declare-fun m!1184229 () Bool)

(assert (=> start!109332 m!1184229))

(declare-fun m!1184231 () Bool)

(assert (=> b!1291339 m!1184231))

(declare-fun m!1184233 () Bool)

(assert (=> b!1291339 m!1184233))

(declare-fun m!1184235 () Bool)

(assert (=> b!1291341 m!1184235))

(check-sat b_and!46689 (not b!1291338) (not b!1291342) (not b_next!28597) (not start!109332) (not b!1291337) (not b!1291339) (not mapNonEmpty!52916) (not b!1291340) tp_is_empty!34237 (not b!1291341))
(check-sat b_and!46689 (not b_next!28597))
