; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109386 () Bool)

(assert start!109386)

(declare-fun b_free!28651 () Bool)

(declare-fun b_next!28651 () Bool)

(assert (=> start!109386 (= b_free!28651 (not b_next!28651))))

(declare-fun tp!101071 () Bool)

(declare-fun b_and!46743 () Bool)

(assert (=> start!109386 (= tp!101071 b_and!46743)))

(declare-fun b!1292306 () Bool)

(declare-fun e!737843 () Bool)

(declare-fun tp_is_empty!34291 () Bool)

(assert (=> b!1292306 (= e!737843 tp_is_empty!34291)))

(declare-fun b!1292307 () Bool)

(declare-fun res!858211 () Bool)

(declare-fun e!737845 () Bool)

(assert (=> b!1292307 (=> (not res!858211) (not e!737845))))

(declare-datatypes ((array!85655 0))(
  ( (array!85656 (arr!41324 (Array (_ BitVec 32) (_ BitVec 64))) (size!41875 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85655)

(declare-datatypes ((List!29323 0))(
  ( (Nil!29320) (Cons!29319 (h!30537 (_ BitVec 64)) (t!42879 List!29323)) )
))
(declare-fun arrayNoDuplicates!0 (array!85655 (_ BitVec 32) List!29323) Bool)

(assert (=> b!1292307 (= res!858211 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29320))))

(declare-fun b!1292308 () Bool)

(declare-fun e!737847 () Bool)

(assert (=> b!1292308 (= e!737845 (not e!737847))))

(declare-fun res!858213 () Bool)

(assert (=> b!1292308 (=> res!858213 e!737847)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292308 (= res!858213 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50825 0))(
  ( (V!50826 (val!17220 Int)) )
))
(declare-datatypes ((tuple2!22150 0))(
  ( (tuple2!22151 (_1!11086 (_ BitVec 64)) (_2!11086 V!50825)) )
))
(declare-datatypes ((List!29324 0))(
  ( (Nil!29321) (Cons!29320 (h!30538 tuple2!22150) (t!42880 List!29324)) )
))
(declare-datatypes ((ListLongMap!19815 0))(
  ( (ListLongMap!19816 (toList!9923 List!29324)) )
))
(declare-fun contains!8054 (ListLongMap!19815 (_ BitVec 64)) Bool)

(assert (=> b!1292308 (not (contains!8054 (ListLongMap!19816 Nil!29321) k0!1205))))

(declare-datatypes ((Unit!42693 0))(
  ( (Unit!42694) )
))
(declare-fun lt!579394 () Unit!42693)

(declare-fun emptyContainsNothing!95 ((_ BitVec 64)) Unit!42693)

(assert (=> b!1292308 (= lt!579394 (emptyContainsNothing!95 k0!1205))))

(declare-fun b!1292309 () Bool)

(declare-fun res!858215 () Bool)

(assert (=> b!1292309 (=> (not res!858215) (not e!737845))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292309 (= res!858215 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41875 _keys!1741))))))

(declare-fun b!1292310 () Bool)

(declare-fun res!858214 () Bool)

(assert (=> b!1292310 (=> (not res!858214) (not e!737845))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16247 0))(
  ( (ValueCellFull!16247 (v!19818 V!50825)) (EmptyCell!16247) )
))
(declare-datatypes ((array!85657 0))(
  ( (array!85658 (arr!41325 (Array (_ BitVec 32) ValueCell!16247)) (size!41876 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85657)

(assert (=> b!1292310 (= res!858214 (and (= (size!41876 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41875 _keys!1741) (size!41876 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52997 () Bool)

(declare-fun mapRes!52997 () Bool)

(declare-fun tp!101072 () Bool)

(assert (=> mapNonEmpty!52997 (= mapRes!52997 (and tp!101072 e!737843))))

(declare-fun mapValue!52997 () ValueCell!16247)

(declare-fun mapRest!52997 () (Array (_ BitVec 32) ValueCell!16247))

(declare-fun mapKey!52997 () (_ BitVec 32))

(assert (=> mapNonEmpty!52997 (= (arr!41325 _values!1445) (store mapRest!52997 mapKey!52997 mapValue!52997))))

(declare-fun b!1292311 () Bool)

(declare-fun e!737842 () Bool)

(assert (=> b!1292311 (= e!737842 tp_is_empty!34291)))

(declare-fun b!1292312 () Bool)

(declare-fun res!858216 () Bool)

(assert (=> b!1292312 (=> (not res!858216) (not e!737845))))

(declare-fun minValue!1387 () V!50825)

(declare-fun zeroValue!1387 () V!50825)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4960 (array!85655 array!85657 (_ BitVec 32) (_ BitVec 32) V!50825 V!50825 (_ BitVec 32) Int) ListLongMap!19815)

(assert (=> b!1292312 (= res!858216 (contains!8054 (getCurrentListMap!4960 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!858217 () Bool)

(assert (=> start!109386 (=> (not res!858217) (not e!737845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109386 (= res!858217 (validMask!0 mask!2175))))

(assert (=> start!109386 e!737845))

(assert (=> start!109386 tp_is_empty!34291))

(assert (=> start!109386 true))

(declare-fun e!737844 () Bool)

(declare-fun array_inv!31545 (array!85657) Bool)

(assert (=> start!109386 (and (array_inv!31545 _values!1445) e!737844)))

(declare-fun array_inv!31546 (array!85655) Bool)

(assert (=> start!109386 (array_inv!31546 _keys!1741)))

(assert (=> start!109386 tp!101071))

(declare-fun mapIsEmpty!52997 () Bool)

(assert (=> mapIsEmpty!52997 mapRes!52997))

(declare-fun b!1292313 () Bool)

(declare-fun res!858209 () Bool)

(assert (=> b!1292313 (=> (not res!858209) (not e!737845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292313 (= res!858209 (not (validKeyInArray!0 (select (arr!41324 _keys!1741) from!2144))))))

(declare-fun b!1292314 () Bool)

(assert (=> b!1292314 (= e!737844 (and e!737842 mapRes!52997))))

(declare-fun condMapEmpty!52997 () Bool)

(declare-fun mapDefault!52997 () ValueCell!16247)

(assert (=> b!1292314 (= condMapEmpty!52997 (= (arr!41325 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16247)) mapDefault!52997)))))

(declare-fun b!1292315 () Bool)

(declare-fun res!858210 () Bool)

(assert (=> b!1292315 (=> (not res!858210) (not e!737845))))

(assert (=> b!1292315 (= res!858210 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41875 _keys!1741))))))

(declare-fun b!1292316 () Bool)

(declare-fun res!858212 () Bool)

(assert (=> b!1292316 (=> (not res!858212) (not e!737845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85655 (_ BitVec 32)) Bool)

(assert (=> b!1292316 (= res!858212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292317 () Bool)

(assert (=> b!1292317 (= e!737847 true)))

(assert (=> b!1292317 false))

(declare-fun lt!579391 () ListLongMap!19815)

(declare-fun lt!579393 () Unit!42693)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!50 ((_ BitVec 64) (_ BitVec 64) V!50825 ListLongMap!19815) Unit!42693)

(assert (=> b!1292317 (= lt!579393 (lemmaInListMapAfterAddingDiffThenInBefore!50 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579391))))

(declare-fun lt!579392 () ListLongMap!19815)

(declare-fun +!4421 (ListLongMap!19815 tuple2!22150) ListLongMap!19815)

(assert (=> b!1292317 (not (contains!8054 (+!4421 lt!579392 (tuple2!22151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579396 () Unit!42693)

(declare-fun addStillNotContains!397 (ListLongMap!19815 (_ BitVec 64) V!50825 (_ BitVec 64)) Unit!42693)

(assert (=> b!1292317 (= lt!579396 (addStillNotContains!397 lt!579392 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292317 (not (contains!8054 lt!579391 k0!1205))))

(assert (=> b!1292317 (= lt!579391 (+!4421 lt!579392 (tuple2!22151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579395 () Unit!42693)

(assert (=> b!1292317 (= lt!579395 (addStillNotContains!397 lt!579392 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6059 (array!85655 array!85657 (_ BitVec 32) (_ BitVec 32) V!50825 V!50825 (_ BitVec 32) Int) ListLongMap!19815)

(assert (=> b!1292317 (= lt!579392 (getCurrentListMapNoExtraKeys!6059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109386 res!858217) b!1292310))

(assert (= (and b!1292310 res!858214) b!1292316))

(assert (= (and b!1292316 res!858212) b!1292307))

(assert (= (and b!1292307 res!858211) b!1292309))

(assert (= (and b!1292309 res!858215) b!1292312))

(assert (= (and b!1292312 res!858216) b!1292315))

(assert (= (and b!1292315 res!858210) b!1292313))

(assert (= (and b!1292313 res!858209) b!1292308))

(assert (= (and b!1292308 (not res!858213)) b!1292317))

(assert (= (and b!1292314 condMapEmpty!52997) mapIsEmpty!52997))

(assert (= (and b!1292314 (not condMapEmpty!52997)) mapNonEmpty!52997))

(get-info :version)

(assert (= (and mapNonEmpty!52997 ((_ is ValueCellFull!16247) mapValue!52997)) b!1292306))

(assert (= (and b!1292314 ((_ is ValueCellFull!16247) mapDefault!52997)) b!1292311))

(assert (= start!109386 b!1292314))

(declare-fun m!1185273 () Bool)

(assert (=> b!1292313 m!1185273))

(assert (=> b!1292313 m!1185273))

(declare-fun m!1185275 () Bool)

(assert (=> b!1292313 m!1185275))

(declare-fun m!1185277 () Bool)

(assert (=> b!1292307 m!1185277))

(declare-fun m!1185279 () Bool)

(assert (=> start!109386 m!1185279))

(declare-fun m!1185281 () Bool)

(assert (=> start!109386 m!1185281))

(declare-fun m!1185283 () Bool)

(assert (=> start!109386 m!1185283))

(declare-fun m!1185285 () Bool)

(assert (=> b!1292316 m!1185285))

(declare-fun m!1185287 () Bool)

(assert (=> b!1292312 m!1185287))

(assert (=> b!1292312 m!1185287))

(declare-fun m!1185289 () Bool)

(assert (=> b!1292312 m!1185289))

(declare-fun m!1185291 () Bool)

(assert (=> mapNonEmpty!52997 m!1185291))

(declare-fun m!1185293 () Bool)

(assert (=> b!1292317 m!1185293))

(declare-fun m!1185295 () Bool)

(assert (=> b!1292317 m!1185295))

(declare-fun m!1185297 () Bool)

(assert (=> b!1292317 m!1185297))

(declare-fun m!1185299 () Bool)

(assert (=> b!1292317 m!1185299))

(declare-fun m!1185301 () Bool)

(assert (=> b!1292317 m!1185301))

(declare-fun m!1185303 () Bool)

(assert (=> b!1292317 m!1185303))

(assert (=> b!1292317 m!1185299))

(declare-fun m!1185305 () Bool)

(assert (=> b!1292317 m!1185305))

(declare-fun m!1185307 () Bool)

(assert (=> b!1292317 m!1185307))

(declare-fun m!1185309 () Bool)

(assert (=> b!1292308 m!1185309))

(declare-fun m!1185311 () Bool)

(assert (=> b!1292308 m!1185311))

(check-sat (not start!109386) (not b!1292307) (not b!1292316) (not b!1292312) tp_is_empty!34291 (not b!1292317) b_and!46743 (not b!1292313) (not b_next!28651) (not b!1292308) (not mapNonEmpty!52997))
(check-sat b_and!46743 (not b_next!28651))
