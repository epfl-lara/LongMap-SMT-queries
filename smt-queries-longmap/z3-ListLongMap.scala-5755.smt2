; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74360 () Bool)

(assert start!74360)

(declare-fun b_free!15123 () Bool)

(declare-fun b_next!15123 () Bool)

(assert (=> start!74360 (= b_free!15123 (not b_next!15123))))

(declare-fun tp!53043 () Bool)

(declare-fun b_and!24899 () Bool)

(assert (=> start!74360 (= tp!53043 b_and!24899)))

(declare-fun b!875287 () Bool)

(declare-fun res!594843 () Bool)

(declare-fun e!487283 () Bool)

(assert (=> b!875287 (=> (not res!594843) (not e!487283))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875287 (= res!594843 (validKeyInArray!0 k0!854))))

(declare-fun b!875288 () Bool)

(declare-fun e!487276 () Bool)

(declare-fun e!487282 () Bool)

(assert (=> b!875288 (= e!487276 (not e!487282))))

(declare-fun res!594847 () Bool)

(assert (=> b!875288 (=> res!594847 e!487282)))

(declare-datatypes ((array!50860 0))(
  ( (array!50861 (arr!24458 (Array (_ BitVec 32) (_ BitVec 64))) (size!24898 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50860)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875288 (= res!594847 (not (validKeyInArray!0 (select (arr!24458 _keys!868) from!1053))))))

(declare-fun e!487279 () Bool)

(assert (=> b!875288 e!487279))

(declare-fun c!92498 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875288 (= c!92498 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28203 0))(
  ( (V!28204 (val!8731 Int)) )
))
(declare-fun v!557 () V!28203)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29936 0))(
  ( (Unit!29937) )
))
(declare-fun lt!396128 () Unit!29936)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8244 0))(
  ( (ValueCellFull!8244 (v!11160 V!28203)) (EmptyCell!8244) )
))
(declare-datatypes ((array!50862 0))(
  ( (array!50863 (arr!24459 (Array (_ BitVec 32) ValueCell!8244)) (size!24899 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50862)

(declare-fun minValue!654 () V!28203)

(declare-fun zeroValue!654 () V!28203)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!661 (array!50860 array!50862 (_ BitVec 32) (_ BitVec 32) V!28203 V!28203 (_ BitVec 32) (_ BitVec 64) V!28203 (_ BitVec 32) Int) Unit!29936)

(assert (=> b!875288 (= lt!396128 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!661 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!594849 () Bool)

(assert (=> start!74360 (=> (not res!594849) (not e!487283))))

(assert (=> start!74360 (= res!594849 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24898 _keys!868))))))

(assert (=> start!74360 e!487283))

(declare-fun tp_is_empty!17367 () Bool)

(assert (=> start!74360 tp_is_empty!17367))

(assert (=> start!74360 true))

(assert (=> start!74360 tp!53043))

(declare-fun array_inv!19282 (array!50860) Bool)

(assert (=> start!74360 (array_inv!19282 _keys!868)))

(declare-fun e!487278 () Bool)

(declare-fun array_inv!19283 (array!50862) Bool)

(assert (=> start!74360 (and (array_inv!19283 _values!688) e!487278)))

(declare-fun b!875289 () Bool)

(declare-fun e!487281 () Bool)

(assert (=> b!875289 (= e!487281 tp_is_empty!17367)))

(declare-fun b!875290 () Bool)

(declare-fun res!594840 () Bool)

(assert (=> b!875290 (=> (not res!594840) (not e!487283))))

(assert (=> b!875290 (= res!594840 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24898 _keys!868))))))

(declare-datatypes ((tuple2!11532 0))(
  ( (tuple2!11533 (_1!5777 (_ BitVec 64)) (_2!5777 V!28203)) )
))
(declare-datatypes ((List!17356 0))(
  ( (Nil!17353) (Cons!17352 (h!18483 tuple2!11532) (t!24397 List!17356)) )
))
(declare-datatypes ((ListLongMap!10301 0))(
  ( (ListLongMap!10302 (toList!5166 List!17356)) )
))
(declare-fun call!38595 () ListLongMap!10301)

(declare-fun lt!396130 () array!50862)

(declare-fun bm!38591 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3133 (array!50860 array!50862 (_ BitVec 32) (_ BitVec 32) V!28203 V!28203 (_ BitVec 32) Int) ListLongMap!10301)

(assert (=> bm!38591 (= call!38595 (getCurrentListMapNoExtraKeys!3133 _keys!868 lt!396130 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875291 () Bool)

(declare-fun mapRes!27659 () Bool)

(assert (=> b!875291 (= e!487278 (and e!487281 mapRes!27659))))

(declare-fun condMapEmpty!27659 () Bool)

(declare-fun mapDefault!27659 () ValueCell!8244)

(assert (=> b!875291 (= condMapEmpty!27659 (= (arr!24459 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8244)) mapDefault!27659)))))

(declare-fun b!875292 () Bool)

(declare-fun res!594844 () Bool)

(assert (=> b!875292 (=> (not res!594844) (not e!487283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875292 (= res!594844 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27659 () Bool)

(assert (=> mapIsEmpty!27659 mapRes!27659))

(declare-fun call!38594 () ListLongMap!10301)

(declare-fun bm!38592 () Bool)

(assert (=> bm!38592 (= call!38594 (getCurrentListMapNoExtraKeys!3133 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875293 () Bool)

(declare-fun +!2470 (ListLongMap!10301 tuple2!11532) ListLongMap!10301)

(assert (=> b!875293 (= e!487279 (= call!38595 (+!2470 call!38594 (tuple2!11533 k0!854 v!557))))))

(declare-fun b!875294 () Bool)

(declare-fun res!594842 () Bool)

(assert (=> b!875294 (=> (not res!594842) (not e!487283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50860 (_ BitVec 32)) Bool)

(assert (=> b!875294 (= res!594842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875295 () Bool)

(declare-fun res!594846 () Bool)

(assert (=> b!875295 (=> (not res!594846) (not e!487283))))

(assert (=> b!875295 (= res!594846 (and (= (size!24899 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24898 _keys!868) (size!24899 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875296 () Bool)

(declare-fun res!594845 () Bool)

(assert (=> b!875296 (=> (not res!594845) (not e!487283))))

(assert (=> b!875296 (= res!594845 (and (= (select (arr!24458 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875297 () Bool)

(assert (=> b!875297 (= e!487282 (bvslt i!612 (size!24899 _values!688)))))

(declare-fun b!875298 () Bool)

(declare-fun e!487280 () Bool)

(assert (=> b!875298 (= e!487280 tp_is_empty!17367)))

(declare-fun b!875299 () Bool)

(declare-fun res!594841 () Bool)

(assert (=> b!875299 (=> (not res!594841) (not e!487283))))

(declare-datatypes ((List!17357 0))(
  ( (Nil!17354) (Cons!17353 (h!18484 (_ BitVec 64)) (t!24398 List!17357)) )
))
(declare-fun arrayNoDuplicates!0 (array!50860 (_ BitVec 32) List!17357) Bool)

(assert (=> b!875299 (= res!594841 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17354))))

(declare-fun b!875300 () Bool)

(assert (=> b!875300 (= e!487283 e!487276)))

(declare-fun res!594848 () Bool)

(assert (=> b!875300 (=> (not res!594848) (not e!487276))))

(assert (=> b!875300 (= res!594848 (= from!1053 i!612))))

(declare-fun lt!396129 () ListLongMap!10301)

(assert (=> b!875300 (= lt!396129 (getCurrentListMapNoExtraKeys!3133 _keys!868 lt!396130 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875300 (= lt!396130 (array!50863 (store (arr!24459 _values!688) i!612 (ValueCellFull!8244 v!557)) (size!24899 _values!688)))))

(declare-fun lt!396131 () ListLongMap!10301)

(assert (=> b!875300 (= lt!396131 (getCurrentListMapNoExtraKeys!3133 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875301 () Bool)

(assert (=> b!875301 (= e!487279 (= call!38595 call!38594))))

(declare-fun mapNonEmpty!27659 () Bool)

(declare-fun tp!53044 () Bool)

(assert (=> mapNonEmpty!27659 (= mapRes!27659 (and tp!53044 e!487280))))

(declare-fun mapKey!27659 () (_ BitVec 32))

(declare-fun mapValue!27659 () ValueCell!8244)

(declare-fun mapRest!27659 () (Array (_ BitVec 32) ValueCell!8244))

(assert (=> mapNonEmpty!27659 (= (arr!24459 _values!688) (store mapRest!27659 mapKey!27659 mapValue!27659))))

(assert (= (and start!74360 res!594849) b!875292))

(assert (= (and b!875292 res!594844) b!875295))

(assert (= (and b!875295 res!594846) b!875294))

(assert (= (and b!875294 res!594842) b!875299))

(assert (= (and b!875299 res!594841) b!875290))

(assert (= (and b!875290 res!594840) b!875287))

(assert (= (and b!875287 res!594843) b!875296))

(assert (= (and b!875296 res!594845) b!875300))

(assert (= (and b!875300 res!594848) b!875288))

(assert (= (and b!875288 c!92498) b!875293))

(assert (= (and b!875288 (not c!92498)) b!875301))

(assert (= (or b!875293 b!875301) bm!38591))

(assert (= (or b!875293 b!875301) bm!38592))

(assert (= (and b!875288 (not res!594847)) b!875297))

(assert (= (and b!875291 condMapEmpty!27659) mapIsEmpty!27659))

(assert (= (and b!875291 (not condMapEmpty!27659)) mapNonEmpty!27659))

(get-info :version)

(assert (= (and mapNonEmpty!27659 ((_ is ValueCellFull!8244) mapValue!27659)) b!875298))

(assert (= (and b!875291 ((_ is ValueCellFull!8244) mapDefault!27659)) b!875289))

(assert (= start!74360 b!875291))

(declare-fun m!815189 () Bool)

(assert (=> bm!38591 m!815189))

(declare-fun m!815191 () Bool)

(assert (=> b!875293 m!815191))

(declare-fun m!815193 () Bool)

(assert (=> b!875300 m!815193))

(declare-fun m!815195 () Bool)

(assert (=> b!875300 m!815195))

(declare-fun m!815197 () Bool)

(assert (=> b!875300 m!815197))

(declare-fun m!815199 () Bool)

(assert (=> start!74360 m!815199))

(declare-fun m!815201 () Bool)

(assert (=> start!74360 m!815201))

(declare-fun m!815203 () Bool)

(assert (=> b!875299 m!815203))

(declare-fun m!815205 () Bool)

(assert (=> b!875294 m!815205))

(declare-fun m!815207 () Bool)

(assert (=> mapNonEmpty!27659 m!815207))

(declare-fun m!815209 () Bool)

(assert (=> b!875288 m!815209))

(assert (=> b!875288 m!815209))

(declare-fun m!815211 () Bool)

(assert (=> b!875288 m!815211))

(declare-fun m!815213 () Bool)

(assert (=> b!875288 m!815213))

(declare-fun m!815215 () Bool)

(assert (=> b!875296 m!815215))

(declare-fun m!815217 () Bool)

(assert (=> b!875292 m!815217))

(declare-fun m!815219 () Bool)

(assert (=> bm!38592 m!815219))

(declare-fun m!815221 () Bool)

(assert (=> b!875287 m!815221))

(check-sat (not b!875294) (not b!875293) tp_is_empty!17367 (not b!875288) (not b!875299) (not b!875300) (not b!875292) (not bm!38591) b_and!24899 (not bm!38592) (not mapNonEmpty!27659) (not start!74360) (not b_next!15123) (not b!875287))
(check-sat b_and!24899 (not b_next!15123))
