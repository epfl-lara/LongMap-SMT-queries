; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74588 () Bool)

(assert start!74588)

(declare-fun b_free!15163 () Bool)

(declare-fun b_next!15163 () Bool)

(assert (=> start!74588 (= b_free!15163 (not b_next!15163))))

(declare-fun tp!53167 () Bool)

(declare-fun b_and!24989 () Bool)

(assert (=> start!74588 (= tp!53167 b_and!24989)))

(declare-fun bm!38774 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28257 0))(
  ( (V!28258 (val!8751 Int)) )
))
(declare-datatypes ((tuple2!11502 0))(
  ( (tuple2!11503 (_1!5762 (_ BitVec 64)) (_2!5762 V!28257)) )
))
(declare-datatypes ((List!17340 0))(
  ( (Nil!17337) (Cons!17336 (h!18473 tuple2!11502) (t!24399 List!17340)) )
))
(declare-datatypes ((ListLongMap!10273 0))(
  ( (ListLongMap!10274 (toList!5152 List!17340)) )
))
(declare-fun call!38777 () ListLongMap!10273)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28257)

(declare-fun zeroValue!654 () V!28257)

(declare-datatypes ((array!50985 0))(
  ( (array!50986 (arr!24515 (Array (_ BitVec 32) (_ BitVec 64))) (size!24956 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50985)

(declare-datatypes ((ValueCell!8264 0))(
  ( (ValueCellFull!8264 (v!11184 V!28257)) (EmptyCell!8264) )
))
(declare-datatypes ((array!50987 0))(
  ( (array!50988 (arr!24516 (Array (_ BitVec 32) ValueCell!8264)) (size!24957 (_ BitVec 32))) )
))
(declare-fun lt!396818 () array!50987)

(declare-fun getCurrentListMapNoExtraKeys!3194 (array!50985 array!50987 (_ BitVec 32) (_ BitVec 32) V!28257 V!28257 (_ BitVec 32) Int) ListLongMap!10273)

(assert (=> bm!38774 (= call!38777 (getCurrentListMapNoExtraKeys!3194 _keys!868 lt!396818 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877244 () Bool)

(declare-fun res!595843 () Bool)

(declare-fun e!488425 () Bool)

(assert (=> b!877244 (=> (not res!595843) (not e!488425))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877244 (= res!595843 (validKeyInArray!0 k0!854))))

(declare-fun b!877245 () Bool)

(declare-fun e!488421 () Bool)

(declare-fun e!488424 () Bool)

(assert (=> b!877245 (= e!488421 (not e!488424))))

(declare-fun res!595837 () Bool)

(assert (=> b!877245 (=> res!595837 e!488424)))

(assert (=> b!877245 (= res!595837 (not (validKeyInArray!0 (select (arr!24515 _keys!868) from!1053))))))

(declare-fun e!488427 () Bool)

(assert (=> b!877245 e!488427))

(declare-fun c!92876 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!877245 (= c!92876 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28257)

(declare-datatypes ((Unit!29944 0))(
  ( (Unit!29945) )
))
(declare-fun lt!396817 () Unit!29944)

(declare-fun _values!688 () array!50987)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!666 (array!50985 array!50987 (_ BitVec 32) (_ BitVec 32) V!28257 V!28257 (_ BitVec 32) (_ BitVec 64) V!28257 (_ BitVec 32) Int) Unit!29944)

(assert (=> b!877245 (= lt!396817 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!666 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877246 () Bool)

(declare-fun e!488426 () Bool)

(declare-fun tp_is_empty!17407 () Bool)

(assert (=> b!877246 (= e!488426 tp_is_empty!17407)))

(declare-fun b!877247 () Bool)

(declare-fun e!488423 () Bool)

(declare-fun mapRes!27722 () Bool)

(assert (=> b!877247 (= e!488423 (and e!488426 mapRes!27722))))

(declare-fun condMapEmpty!27722 () Bool)

(declare-fun mapDefault!27722 () ValueCell!8264)

(assert (=> b!877247 (= condMapEmpty!27722 (= (arr!24516 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8264)) mapDefault!27722)))))

(declare-fun b!877248 () Bool)

(declare-fun e!488420 () Bool)

(assert (=> b!877248 (= e!488420 tp_is_empty!17407)))

(declare-fun res!595835 () Bool)

(assert (=> start!74588 (=> (not res!595835) (not e!488425))))

(assert (=> start!74588 (= res!595835 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24956 _keys!868))))))

(assert (=> start!74588 e!488425))

(assert (=> start!74588 tp_is_empty!17407))

(assert (=> start!74588 true))

(assert (=> start!74588 tp!53167))

(declare-fun array_inv!19376 (array!50985) Bool)

(assert (=> start!74588 (array_inv!19376 _keys!868)))

(declare-fun array_inv!19377 (array!50987) Bool)

(assert (=> start!74588 (and (array_inv!19377 _values!688) e!488423)))

(declare-fun b!877249 () Bool)

(declare-fun res!595841 () Bool)

(assert (=> b!877249 (=> (not res!595841) (not e!488425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877249 (= res!595841 (validMask!0 mask!1196))))

(declare-fun b!877250 () Bool)

(assert (=> b!877250 (= e!488425 e!488421)))

(declare-fun res!595838 () Bool)

(assert (=> b!877250 (=> (not res!595838) (not e!488421))))

(assert (=> b!877250 (= res!595838 (= from!1053 i!612))))

(declare-fun lt!396819 () ListLongMap!10273)

(assert (=> b!877250 (= lt!396819 (getCurrentListMapNoExtraKeys!3194 _keys!868 lt!396818 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!877250 (= lt!396818 (array!50988 (store (arr!24516 _values!688) i!612 (ValueCellFull!8264 v!557)) (size!24957 _values!688)))))

(declare-fun lt!396820 () ListLongMap!10273)

(assert (=> b!877250 (= lt!396820 (getCurrentListMapNoExtraKeys!3194 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877251 () Bool)

(declare-fun res!595840 () Bool)

(assert (=> b!877251 (=> (not res!595840) (not e!488425))))

(declare-datatypes ((List!17341 0))(
  ( (Nil!17338) (Cons!17337 (h!18474 (_ BitVec 64)) (t!24400 List!17341)) )
))
(declare-fun arrayNoDuplicates!0 (array!50985 (_ BitVec 32) List!17341) Bool)

(assert (=> b!877251 (= res!595840 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17338))))

(declare-fun mapIsEmpty!27722 () Bool)

(assert (=> mapIsEmpty!27722 mapRes!27722))

(declare-fun mapNonEmpty!27722 () Bool)

(declare-fun tp!53168 () Bool)

(assert (=> mapNonEmpty!27722 (= mapRes!27722 (and tp!53168 e!488420))))

(declare-fun mapValue!27722 () ValueCell!8264)

(declare-fun mapRest!27722 () (Array (_ BitVec 32) ValueCell!8264))

(declare-fun mapKey!27722 () (_ BitVec 32))

(assert (=> mapNonEmpty!27722 (= (arr!24516 _values!688) (store mapRest!27722 mapKey!27722 mapValue!27722))))

(declare-fun call!38778 () ListLongMap!10273)

(declare-fun bm!38775 () Bool)

(assert (=> bm!38775 (= call!38778 (getCurrentListMapNoExtraKeys!3194 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877252 () Bool)

(declare-fun res!595834 () Bool)

(assert (=> b!877252 (=> (not res!595834) (not e!488425))))

(assert (=> b!877252 (= res!595834 (and (= (select (arr!24515 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877253 () Bool)

(declare-fun res!595836 () Bool)

(assert (=> b!877253 (=> (not res!595836) (not e!488425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50985 (_ BitVec 32)) Bool)

(assert (=> b!877253 (= res!595836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877254 () Bool)

(declare-fun res!595839 () Bool)

(assert (=> b!877254 (=> (not res!595839) (not e!488425))))

(assert (=> b!877254 (= res!595839 (and (= (size!24957 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24956 _keys!868) (size!24957 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877255 () Bool)

(assert (=> b!877255 (= e!488424 (bvslt from!1053 (size!24957 _values!688)))))

(declare-fun +!2499 (ListLongMap!10273 tuple2!11502) ListLongMap!10273)

(declare-fun get!12911 (ValueCell!8264 V!28257) V!28257)

(declare-fun dynLambda!1235 (Int (_ BitVec 64)) V!28257)

(assert (=> b!877255 (= lt!396819 (+!2499 (getCurrentListMapNoExtraKeys!3194 _keys!868 lt!396818 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11503 (select (arr!24515 _keys!868) from!1053) (get!12911 (select (arr!24516 lt!396818) from!1053) (dynLambda!1235 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877256 () Bool)

(declare-fun res!595842 () Bool)

(assert (=> b!877256 (=> (not res!595842) (not e!488425))))

(assert (=> b!877256 (= res!595842 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24956 _keys!868))))))

(declare-fun b!877257 () Bool)

(assert (=> b!877257 (= e!488427 (= call!38777 (+!2499 call!38778 (tuple2!11503 k0!854 v!557))))))

(declare-fun b!877258 () Bool)

(assert (=> b!877258 (= e!488427 (= call!38777 call!38778))))

(assert (= (and start!74588 res!595835) b!877249))

(assert (= (and b!877249 res!595841) b!877254))

(assert (= (and b!877254 res!595839) b!877253))

(assert (= (and b!877253 res!595836) b!877251))

(assert (= (and b!877251 res!595840) b!877256))

(assert (= (and b!877256 res!595842) b!877244))

(assert (= (and b!877244 res!595843) b!877252))

(assert (= (and b!877252 res!595834) b!877250))

(assert (= (and b!877250 res!595838) b!877245))

(assert (= (and b!877245 c!92876) b!877257))

(assert (= (and b!877245 (not c!92876)) b!877258))

(assert (= (or b!877257 b!877258) bm!38774))

(assert (= (or b!877257 b!877258) bm!38775))

(assert (= (and b!877245 (not res!595837)) b!877255))

(assert (= (and b!877247 condMapEmpty!27722) mapIsEmpty!27722))

(assert (= (and b!877247 (not condMapEmpty!27722)) mapNonEmpty!27722))

(get-info :version)

(assert (= (and mapNonEmpty!27722 ((_ is ValueCellFull!8264) mapValue!27722)) b!877248))

(assert (= (and b!877247 ((_ is ValueCellFull!8264) mapDefault!27722)) b!877246))

(assert (= start!74588 b!877247))

(declare-fun b_lambda!12245 () Bool)

(assert (=> (not b_lambda!12245) (not b!877255)))

(declare-fun t!24398 () Bool)

(declare-fun tb!4915 () Bool)

(assert (=> (and start!74588 (= defaultEntry!696 defaultEntry!696) t!24398) tb!4915))

(declare-fun result!9457 () Bool)

(assert (=> tb!4915 (= result!9457 tp_is_empty!17407)))

(assert (=> b!877255 t!24398))

(declare-fun b_and!24991 () Bool)

(assert (= b_and!24989 (and (=> t!24398 result!9457) b_and!24991)))

(declare-fun m!817403 () Bool)

(assert (=> b!877255 m!817403))

(declare-fun m!817405 () Bool)

(assert (=> b!877255 m!817405))

(declare-fun m!817407 () Bool)

(assert (=> b!877255 m!817407))

(declare-fun m!817409 () Bool)

(assert (=> b!877255 m!817409))

(assert (=> b!877255 m!817403))

(declare-fun m!817411 () Bool)

(assert (=> b!877255 m!817411))

(assert (=> b!877255 m!817405))

(declare-fun m!817413 () Bool)

(assert (=> b!877255 m!817413))

(assert (=> b!877255 m!817407))

(declare-fun m!817415 () Bool)

(assert (=> b!877257 m!817415))

(declare-fun m!817417 () Bool)

(assert (=> start!74588 m!817417))

(declare-fun m!817419 () Bool)

(assert (=> start!74588 m!817419))

(declare-fun m!817421 () Bool)

(assert (=> b!877244 m!817421))

(declare-fun m!817423 () Bool)

(assert (=> bm!38775 m!817423))

(declare-fun m!817425 () Bool)

(assert (=> b!877253 m!817425))

(declare-fun m!817427 () Bool)

(assert (=> mapNonEmpty!27722 m!817427))

(assert (=> bm!38774 m!817403))

(declare-fun m!817429 () Bool)

(assert (=> b!877251 m!817429))

(declare-fun m!817431 () Bool)

(assert (=> b!877250 m!817431))

(declare-fun m!817433 () Bool)

(assert (=> b!877250 m!817433))

(declare-fun m!817435 () Bool)

(assert (=> b!877250 m!817435))

(declare-fun m!817437 () Bool)

(assert (=> b!877252 m!817437))

(declare-fun m!817439 () Bool)

(assert (=> b!877249 m!817439))

(assert (=> b!877245 m!817413))

(assert (=> b!877245 m!817413))

(declare-fun m!817441 () Bool)

(assert (=> b!877245 m!817441))

(declare-fun m!817443 () Bool)

(assert (=> b!877245 m!817443))

(check-sat tp_is_empty!17407 (not b!877250) (not b!877245) (not b!877255) (not b!877249) (not b_lambda!12245) (not b!877257) (not b!877244) (not start!74588) (not b_next!15163) b_and!24991 (not b!877251) (not b!877253) (not bm!38775) (not mapNonEmpty!27722) (not bm!38774))
(check-sat b_and!24991 (not b_next!15163))
