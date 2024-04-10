; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110160 () Bool)

(assert start!110160)

(declare-fun b_free!29283 () Bool)

(declare-fun b_next!29283 () Bool)

(assert (=> start!110160 (= b_free!29283 (not b_next!29283))))

(declare-fun tp!103007 () Bool)

(declare-fun b_and!47463 () Bool)

(assert (=> start!110160 (= tp!103007 b_and!47463)))

(declare-fun res!866226 () Bool)

(declare-fun e!743977 () Bool)

(assert (=> start!110160 (=> (not res!866226) (not e!743977))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110160 (= res!866226 (validMask!0 mask!2175))))

(assert (=> start!110160 e!743977))

(declare-fun tp_is_empty!34923 () Bool)

(assert (=> start!110160 tp_is_empty!34923))

(assert (=> start!110160 true))

(declare-datatypes ((V!51667 0))(
  ( (V!51668 (val!17536 Int)) )
))
(declare-datatypes ((ValueCell!16563 0))(
  ( (ValueCellFull!16563 (v!20155 V!51667)) (EmptyCell!16563) )
))
(declare-datatypes ((array!86860 0))(
  ( (array!86861 (arr!41919 (Array (_ BitVec 32) ValueCell!16563)) (size!42469 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86860)

(declare-fun e!743978 () Bool)

(declare-fun array_inv!31699 (array!86860) Bool)

(assert (=> start!110160 (and (array_inv!31699 _values!1445) e!743978)))

(declare-datatypes ((array!86862 0))(
  ( (array!86863 (arr!41920 (Array (_ BitVec 32) (_ BitVec 64))) (size!42470 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86862)

(declare-fun array_inv!31700 (array!86862) Bool)

(assert (=> start!110160 (array_inv!31700 _keys!1741)))

(assert (=> start!110160 tp!103007))

(declare-fun b!1304308 () Bool)

(declare-fun res!866229 () Bool)

(assert (=> b!1304308 (=> (not res!866229) (not e!743977))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1304308 (= res!866229 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42470 _keys!1741))))))

(declare-fun b!1304309 () Bool)

(declare-fun res!866225 () Bool)

(assert (=> b!1304309 (=> (not res!866225) (not e!743977))))

(declare-fun zeroValue!1387 () V!51667)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!51667)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22634 0))(
  ( (tuple2!22635 (_1!11328 (_ BitVec 64)) (_2!11328 V!51667)) )
))
(declare-datatypes ((List!29755 0))(
  ( (Nil!29752) (Cons!29751 (h!30960 tuple2!22634) (t!43353 List!29755)) )
))
(declare-datatypes ((ListLongMap!20291 0))(
  ( (ListLongMap!20292 (toList!10161 List!29755)) )
))
(declare-fun contains!8301 (ListLongMap!20291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5179 (array!86862 array!86860 (_ BitVec 32) (_ BitVec 32) V!51667 V!51667 (_ BitVec 32) Int) ListLongMap!20291)

(assert (=> b!1304309 (= res!866225 (contains!8301 (getCurrentListMap!5179 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304310 () Bool)

(declare-fun res!866227 () Bool)

(assert (=> b!1304310 (=> (not res!866227) (not e!743977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304310 (= res!866227 (not (validKeyInArray!0 (select (arr!41920 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53984 () Bool)

(declare-fun mapRes!53984 () Bool)

(assert (=> mapIsEmpty!53984 mapRes!53984))

(declare-fun b!1304311 () Bool)

(declare-fun e!743980 () Bool)

(assert (=> b!1304311 (= e!743977 (not e!743980))))

(declare-fun res!866231 () Bool)

(assert (=> b!1304311 (=> res!866231 e!743980)))

(assert (=> b!1304311 (= res!866231 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304311 (not (contains!8301 (ListLongMap!20292 Nil!29752) k0!1205))))

(declare-datatypes ((Unit!43190 0))(
  ( (Unit!43191) )
))
(declare-fun lt!583765 () Unit!43190)

(declare-fun emptyContainsNothing!224 ((_ BitVec 64)) Unit!43190)

(assert (=> b!1304311 (= lt!583765 (emptyContainsNothing!224 k0!1205))))

(declare-fun b!1304312 () Bool)

(declare-fun res!866230 () Bool)

(assert (=> b!1304312 (=> (not res!866230) (not e!743977))))

(assert (=> b!1304312 (= res!866230 (and (= (size!42469 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42470 _keys!1741) (size!42469 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53984 () Bool)

(declare-fun tp!103006 () Bool)

(declare-fun e!743979 () Bool)

(assert (=> mapNonEmpty!53984 (= mapRes!53984 (and tp!103006 e!743979))))

(declare-fun mapKey!53984 () (_ BitVec 32))

(declare-fun mapValue!53984 () ValueCell!16563)

(declare-fun mapRest!53984 () (Array (_ BitVec 32) ValueCell!16563))

(assert (=> mapNonEmpty!53984 (= (arr!41919 _values!1445) (store mapRest!53984 mapKey!53984 mapValue!53984))))

(declare-fun b!1304313 () Bool)

(declare-fun res!866228 () Bool)

(assert (=> b!1304313 (=> (not res!866228) (not e!743977))))

(declare-datatypes ((List!29756 0))(
  ( (Nil!29753) (Cons!29752 (h!30961 (_ BitVec 64)) (t!43354 List!29756)) )
))
(declare-fun arrayNoDuplicates!0 (array!86862 (_ BitVec 32) List!29756) Bool)

(assert (=> b!1304313 (= res!866228 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29753))))

(declare-fun b!1304314 () Bool)

(declare-fun e!743981 () Bool)

(assert (=> b!1304314 (= e!743981 tp_is_empty!34923)))

(declare-fun b!1304315 () Bool)

(declare-fun res!866232 () Bool)

(assert (=> b!1304315 (=> (not res!866232) (not e!743977))))

(assert (=> b!1304315 (= res!866232 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42470 _keys!1741))))))

(declare-fun b!1304316 () Bool)

(declare-fun res!866233 () Bool)

(assert (=> b!1304316 (=> (not res!866233) (not e!743977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86862 (_ BitVec 32)) Bool)

(assert (=> b!1304316 (= res!866233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304317 () Bool)

(assert (=> b!1304317 (= e!743979 tp_is_empty!34923)))

(declare-fun b!1304318 () Bool)

(assert (=> b!1304318 (= e!743980 true)))

(declare-fun lt!583766 () ListLongMap!20291)

(declare-fun +!4484 (ListLongMap!20291 tuple2!22634) ListLongMap!20291)

(assert (=> b!1304318 (not (contains!8301 (+!4484 lt!583766 (tuple2!22635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583767 () Unit!43190)

(declare-fun addStillNotContains!481 (ListLongMap!20291 (_ BitVec 64) V!51667 (_ BitVec 64)) Unit!43190)

(assert (=> b!1304318 (= lt!583767 (addStillNotContains!481 lt!583766 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6119 (array!86862 array!86860 (_ BitVec 32) (_ BitVec 32) V!51667 V!51667 (_ BitVec 32) Int) ListLongMap!20291)

(assert (=> b!1304318 (= lt!583766 (getCurrentListMapNoExtraKeys!6119 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304319 () Bool)

(assert (=> b!1304319 (= e!743978 (and e!743981 mapRes!53984))))

(declare-fun condMapEmpty!53984 () Bool)

(declare-fun mapDefault!53984 () ValueCell!16563)

(assert (=> b!1304319 (= condMapEmpty!53984 (= (arr!41919 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16563)) mapDefault!53984)))))

(assert (= (and start!110160 res!866226) b!1304312))

(assert (= (and b!1304312 res!866230) b!1304316))

(assert (= (and b!1304316 res!866233) b!1304313))

(assert (= (and b!1304313 res!866228) b!1304315))

(assert (= (and b!1304315 res!866232) b!1304309))

(assert (= (and b!1304309 res!866225) b!1304308))

(assert (= (and b!1304308 res!866229) b!1304310))

(assert (= (and b!1304310 res!866227) b!1304311))

(assert (= (and b!1304311 (not res!866231)) b!1304318))

(assert (= (and b!1304319 condMapEmpty!53984) mapIsEmpty!53984))

(assert (= (and b!1304319 (not condMapEmpty!53984)) mapNonEmpty!53984))

(get-info :version)

(assert (= (and mapNonEmpty!53984 ((_ is ValueCellFull!16563) mapValue!53984)) b!1304317))

(assert (= (and b!1304319 ((_ is ValueCellFull!16563) mapDefault!53984)) b!1304314))

(assert (= start!110160 b!1304319))

(declare-fun m!1195289 () Bool)

(assert (=> b!1304310 m!1195289))

(assert (=> b!1304310 m!1195289))

(declare-fun m!1195291 () Bool)

(assert (=> b!1304310 m!1195291))

(declare-fun m!1195293 () Bool)

(assert (=> mapNonEmpty!53984 m!1195293))

(declare-fun m!1195295 () Bool)

(assert (=> b!1304318 m!1195295))

(assert (=> b!1304318 m!1195295))

(declare-fun m!1195297 () Bool)

(assert (=> b!1304318 m!1195297))

(declare-fun m!1195299 () Bool)

(assert (=> b!1304318 m!1195299))

(declare-fun m!1195301 () Bool)

(assert (=> b!1304318 m!1195301))

(declare-fun m!1195303 () Bool)

(assert (=> b!1304316 m!1195303))

(declare-fun m!1195305 () Bool)

(assert (=> start!110160 m!1195305))

(declare-fun m!1195307 () Bool)

(assert (=> start!110160 m!1195307))

(declare-fun m!1195309 () Bool)

(assert (=> start!110160 m!1195309))

(declare-fun m!1195311 () Bool)

(assert (=> b!1304309 m!1195311))

(assert (=> b!1304309 m!1195311))

(declare-fun m!1195313 () Bool)

(assert (=> b!1304309 m!1195313))

(declare-fun m!1195315 () Bool)

(assert (=> b!1304311 m!1195315))

(declare-fun m!1195317 () Bool)

(assert (=> b!1304311 m!1195317))

(declare-fun m!1195319 () Bool)

(assert (=> b!1304313 m!1195319))

(check-sat (not b_next!29283) (not b!1304309) (not b!1304318) tp_is_empty!34923 (not b!1304316) b_and!47463 (not b!1304311) (not b!1304313) (not b!1304310) (not mapNonEmpty!53984) (not start!110160))
(check-sat b_and!47463 (not b_next!29283))
