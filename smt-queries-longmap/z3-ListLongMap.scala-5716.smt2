; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74062 () Bool)

(assert start!74062)

(declare-fun b_free!14989 () Bool)

(declare-fun b_next!14989 () Bool)

(assert (=> start!74062 (= b_free!14989 (not b_next!14989))))

(declare-fun tp!52480 () Bool)

(declare-fun b_and!24715 () Bool)

(assert (=> start!74062 (= tp!52480 b_and!24715)))

(declare-fun b!871283 () Bool)

(declare-fun e!485099 () Bool)

(declare-fun tp_is_empty!17131 () Bool)

(assert (=> b!871283 (= e!485099 tp_is_empty!17131)))

(declare-fun mapNonEmpty!27296 () Bool)

(declare-fun mapRes!27296 () Bool)

(declare-fun tp!52481 () Bool)

(assert (=> mapNonEmpty!27296 (= mapRes!27296 (and tp!52481 e!485099))))

(declare-fun mapKey!27296 () (_ BitVec 32))

(declare-datatypes ((V!27889 0))(
  ( (V!27890 (val!8613 Int)) )
))
(declare-datatypes ((ValueCell!8126 0))(
  ( (ValueCellFull!8126 (v!11032 V!27889)) (EmptyCell!8126) )
))
(declare-fun mapRest!27296 () (Array (_ BitVec 32) ValueCell!8126))

(declare-fun mapValue!27296 () ValueCell!8126)

(declare-datatypes ((array!50389 0))(
  ( (array!50390 (arr!24226 (Array (_ BitVec 32) ValueCell!8126)) (size!24668 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50389)

(assert (=> mapNonEmpty!27296 (= (arr!24226 _values!688) (store mapRest!27296 mapKey!27296 mapValue!27296))))

(declare-fun b!871284 () Bool)

(declare-fun res!592296 () Bool)

(declare-fun e!485103 () Bool)

(assert (=> b!871284 (=> (not res!592296) (not e!485103))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871284 (= res!592296 (validKeyInArray!0 k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27889)

(declare-datatypes ((tuple2!11464 0))(
  ( (tuple2!11465 (_1!5743 (_ BitVec 64)) (_2!5743 V!27889)) )
))
(declare-datatypes ((List!17240 0))(
  ( (Nil!17237) (Cons!17236 (h!18367 tuple2!11464) (t!24268 List!17240)) )
))
(declare-datatypes ((ListLongMap!10223 0))(
  ( (ListLongMap!10224 (toList!5127 List!17240)) )
))
(declare-fun call!38421 () ListLongMap!10223)

(declare-fun zeroValue!654 () V!27889)

(declare-datatypes ((array!50391 0))(
  ( (array!50392 (arr!24227 (Array (_ BitVec 32) (_ BitVec 64))) (size!24669 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50391)

(declare-fun bm!38417 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3120 (array!50391 array!50389 (_ BitVec 32) (_ BitVec 32) V!27889 V!27889 (_ BitVec 32) Int) ListLongMap!10223)

(assert (=> bm!38417 (= call!38421 (getCurrentListMapNoExtraKeys!3120 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!395248 () array!50389)

(declare-fun bm!38418 () Bool)

(declare-fun call!38420 () ListLongMap!10223)

(assert (=> bm!38418 (= call!38420 (getCurrentListMapNoExtraKeys!3120 _keys!868 lt!395248 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27296 () Bool)

(assert (=> mapIsEmpty!27296 mapRes!27296))

(declare-fun b!871285 () Bool)

(declare-fun res!592294 () Bool)

(assert (=> b!871285 (=> (not res!592294) (not e!485103))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871285 (= res!592294 (and (= (select (arr!24227 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!592297 () Bool)

(assert (=> start!74062 (=> (not res!592297) (not e!485103))))

(assert (=> start!74062 (= res!592297 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24669 _keys!868))))))

(assert (=> start!74062 e!485103))

(assert (=> start!74062 tp_is_empty!17131))

(assert (=> start!74062 true))

(assert (=> start!74062 tp!52480))

(declare-fun array_inv!19190 (array!50391) Bool)

(assert (=> start!74062 (array_inv!19190 _keys!868)))

(declare-fun e!485101 () Bool)

(declare-fun array_inv!19191 (array!50389) Bool)

(assert (=> start!74062 (and (array_inv!19191 _values!688) e!485101)))

(declare-fun b!871286 () Bool)

(declare-fun res!592291 () Bool)

(assert (=> b!871286 (=> (not res!592291) (not e!485103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871286 (= res!592291 (validMask!0 mask!1196))))

(declare-fun b!871287 () Bool)

(declare-fun e!485100 () Bool)

(assert (=> b!871287 (= e!485100 (= call!38420 call!38421))))

(declare-fun b!871288 () Bool)

(declare-fun res!592292 () Bool)

(assert (=> b!871288 (=> (not res!592292) (not e!485103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50391 (_ BitVec 32)) Bool)

(assert (=> b!871288 (= res!592292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871289 () Bool)

(declare-fun e!485098 () Bool)

(assert (=> b!871289 (= e!485098 tp_is_empty!17131)))

(declare-fun b!871290 () Bool)

(assert (=> b!871290 (= e!485101 (and e!485098 mapRes!27296))))

(declare-fun condMapEmpty!27296 () Bool)

(declare-fun mapDefault!27296 () ValueCell!8126)

(assert (=> b!871290 (= condMapEmpty!27296 (= (arr!24226 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8126)) mapDefault!27296)))))

(declare-fun b!871291 () Bool)

(declare-fun res!592295 () Bool)

(assert (=> b!871291 (=> (not res!592295) (not e!485103))))

(declare-datatypes ((List!17241 0))(
  ( (Nil!17238) (Cons!17237 (h!18368 (_ BitVec 64)) (t!24269 List!17241)) )
))
(declare-fun arrayNoDuplicates!0 (array!50391 (_ BitVec 32) List!17241) Bool)

(assert (=> b!871291 (= res!592295 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17238))))

(declare-fun b!871292 () Bool)

(declare-fun res!592293 () Bool)

(assert (=> b!871292 (=> (not res!592293) (not e!485103))))

(assert (=> b!871292 (= res!592293 (and (= (size!24668 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24669 _keys!868) (size!24668 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871293 () Bool)

(declare-fun e!485102 () Bool)

(assert (=> b!871293 (= e!485103 e!485102)))

(declare-fun res!592298 () Bool)

(assert (=> b!871293 (=> (not res!592298) (not e!485102))))

(assert (=> b!871293 (= res!592298 (= from!1053 i!612))))

(declare-fun lt!395246 () ListLongMap!10223)

(assert (=> b!871293 (= lt!395246 (getCurrentListMapNoExtraKeys!3120 _keys!868 lt!395248 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27889)

(assert (=> b!871293 (= lt!395248 (array!50390 (store (arr!24226 _values!688) i!612 (ValueCellFull!8126 v!557)) (size!24668 _values!688)))))

(declare-fun lt!395249 () ListLongMap!10223)

(assert (=> b!871293 (= lt!395249 (getCurrentListMapNoExtraKeys!3120 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871294 () Bool)

(assert (=> b!871294 (= e!485102 (not (validKeyInArray!0 (select (arr!24227 _keys!868) from!1053))))))

(assert (=> b!871294 e!485100))

(declare-fun c!92315 () Bool)

(assert (=> b!871294 (= c!92315 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29855 0))(
  ( (Unit!29856) )
))
(declare-fun lt!395247 () Unit!29855)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!652 (array!50391 array!50389 (_ BitVec 32) (_ BitVec 32) V!27889 V!27889 (_ BitVec 32) (_ BitVec 64) V!27889 (_ BitVec 32) Int) Unit!29855)

(assert (=> b!871294 (= lt!395247 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!652 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871295 () Bool)

(declare-fun res!592299 () Bool)

(assert (=> b!871295 (=> (not res!592299) (not e!485103))))

(assert (=> b!871295 (= res!592299 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24669 _keys!868))))))

(declare-fun b!871296 () Bool)

(declare-fun +!2484 (ListLongMap!10223 tuple2!11464) ListLongMap!10223)

(assert (=> b!871296 (= e!485100 (= call!38420 (+!2484 call!38421 (tuple2!11465 k0!854 v!557))))))

(assert (= (and start!74062 res!592297) b!871286))

(assert (= (and b!871286 res!592291) b!871292))

(assert (= (and b!871292 res!592293) b!871288))

(assert (= (and b!871288 res!592292) b!871291))

(assert (= (and b!871291 res!592295) b!871295))

(assert (= (and b!871295 res!592299) b!871284))

(assert (= (and b!871284 res!592296) b!871285))

(assert (= (and b!871285 res!592294) b!871293))

(assert (= (and b!871293 res!592298) b!871294))

(assert (= (and b!871294 c!92315) b!871296))

(assert (= (and b!871294 (not c!92315)) b!871287))

(assert (= (or b!871296 b!871287) bm!38417))

(assert (= (or b!871296 b!871287) bm!38418))

(assert (= (and b!871290 condMapEmpty!27296) mapIsEmpty!27296))

(assert (= (and b!871290 (not condMapEmpty!27296)) mapNonEmpty!27296))

(get-info :version)

(assert (= (and mapNonEmpty!27296 ((_ is ValueCellFull!8126) mapValue!27296)) b!871283))

(assert (= (and b!871290 ((_ is ValueCellFull!8126) mapDefault!27296)) b!871289))

(assert (= start!74062 b!871290))

(declare-fun m!811935 () Bool)

(assert (=> b!871286 m!811935))

(declare-fun m!811937 () Bool)

(assert (=> b!871293 m!811937))

(declare-fun m!811939 () Bool)

(assert (=> b!871293 m!811939))

(declare-fun m!811941 () Bool)

(assert (=> b!871293 m!811941))

(declare-fun m!811943 () Bool)

(assert (=> b!871291 m!811943))

(declare-fun m!811945 () Bool)

(assert (=> b!871284 m!811945))

(declare-fun m!811947 () Bool)

(assert (=> b!871296 m!811947))

(declare-fun m!811949 () Bool)

(assert (=> b!871294 m!811949))

(assert (=> b!871294 m!811949))

(declare-fun m!811951 () Bool)

(assert (=> b!871294 m!811951))

(declare-fun m!811953 () Bool)

(assert (=> b!871294 m!811953))

(declare-fun m!811955 () Bool)

(assert (=> bm!38417 m!811955))

(declare-fun m!811957 () Bool)

(assert (=> bm!38418 m!811957))

(declare-fun m!811959 () Bool)

(assert (=> mapNonEmpty!27296 m!811959))

(declare-fun m!811961 () Bool)

(assert (=> start!74062 m!811961))

(declare-fun m!811963 () Bool)

(assert (=> start!74062 m!811963))

(declare-fun m!811965 () Bool)

(assert (=> b!871285 m!811965))

(declare-fun m!811967 () Bool)

(assert (=> b!871288 m!811967))

(check-sat (not bm!38417) (not b!871294) (not bm!38418) (not b!871296) (not b_next!14989) b_and!24715 tp_is_empty!17131 (not b!871286) (not b!871284) (not start!74062) (not mapNonEmpty!27296) (not b!871293) (not b!871288) (not b!871291))
(check-sat b_and!24715 (not b_next!14989))
