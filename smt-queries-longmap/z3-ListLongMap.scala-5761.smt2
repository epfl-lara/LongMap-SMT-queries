; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74396 () Bool)

(assert start!74396)

(declare-fun b_free!15157 () Bool)

(declare-fun b_next!15157 () Bool)

(assert (=> start!74396 (= b_free!15157 (not b_next!15157))))

(declare-fun tp!53149 () Bool)

(declare-fun b_and!24941 () Bool)

(assert (=> start!74396 (= tp!53149 b_and!24941)))

(declare-fun mapNonEmpty!27713 () Bool)

(declare-fun mapRes!27713 () Bool)

(declare-fun tp!53150 () Bool)

(declare-fun e!487619 () Bool)

(assert (=> mapNonEmpty!27713 (= mapRes!27713 (and tp!53150 e!487619))))

(declare-datatypes ((V!28249 0))(
  ( (V!28250 (val!8748 Int)) )
))
(declare-datatypes ((ValueCell!8261 0))(
  ( (ValueCellFull!8261 (v!11175 V!28249)) (EmptyCell!8261) )
))
(declare-fun mapValue!27713 () ValueCell!8261)

(declare-fun mapKey!27713 () (_ BitVec 32))

(declare-datatypes ((array!50907 0))(
  ( (array!50908 (arr!24481 (Array (_ BitVec 32) ValueCell!8261)) (size!24923 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50907)

(declare-fun mapRest!27713 () (Array (_ BitVec 32) ValueCell!8261))

(assert (=> mapNonEmpty!27713 (= (arr!24481 _values!688) (store mapRest!27713 mapKey!27713 mapValue!27713))))

(declare-fun b!875961 () Bool)

(declare-fun e!487623 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875961 (= e!487623 (bvslt from!1053 (size!24923 _values!688)))))

(declare-datatypes ((tuple2!11570 0))(
  ( (tuple2!11571 (_1!5796 (_ BitVec 64)) (_2!5796 V!28249)) )
))
(declare-datatypes ((List!17377 0))(
  ( (Nil!17374) (Cons!17373 (h!18504 tuple2!11570) (t!24429 List!17377)) )
))
(declare-datatypes ((ListLongMap!10329 0))(
  ( (ListLongMap!10330 (toList!5180 List!17377)) )
))
(declare-fun lt!396184 () ListLongMap!10329)

(declare-fun lt!396185 () array!50907)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50909 0))(
  ( (array!50910 (arr!24482 (Array (_ BitVec 32) (_ BitVec 64))) (size!24924 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50909)

(declare-fun minValue!654 () V!28249)

(declare-fun zeroValue!654 () V!28249)

(declare-fun +!2507 (ListLongMap!10329 tuple2!11570) ListLongMap!10329)

(declare-fun getCurrentListMapNoExtraKeys!3173 (array!50909 array!50907 (_ BitVec 32) (_ BitVec 32) V!28249 V!28249 (_ BitVec 32) Int) ListLongMap!10329)

(declare-fun get!12882 (ValueCell!8261 V!28249) V!28249)

(declare-fun dynLambda!1211 (Int (_ BitVec 64)) V!28249)

(assert (=> b!875961 (= lt!396184 (+!2507 (getCurrentListMapNoExtraKeys!3173 _keys!868 lt!396185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11571 (select (arr!24482 _keys!868) from!1053) (get!12882 (select (arr!24481 lt!396185) from!1053) (dynLambda!1211 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875962 () Bool)

(declare-fun res!595296 () Bool)

(declare-fun e!487618 () Bool)

(assert (=> b!875962 (=> (not res!595296) (not e!487618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50909 (_ BitVec 32)) Bool)

(assert (=> b!875962 (= res!595296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875963 () Bool)

(declare-fun res!595297 () Bool)

(assert (=> b!875963 (=> (not res!595297) (not e!487618))))

(assert (=> b!875963 (= res!595297 (and (= (size!24923 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24924 _keys!868) (size!24923 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875964 () Bool)

(declare-fun res!595292 () Bool)

(assert (=> b!875964 (=> (not res!595292) (not e!487618))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875964 (= res!595292 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24924 _keys!868))))))

(declare-fun mapIsEmpty!27713 () Bool)

(assert (=> mapIsEmpty!27713 mapRes!27713))

(declare-fun b!875965 () Bool)

(declare-fun res!595291 () Bool)

(assert (=> b!875965 (=> (not res!595291) (not e!487618))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875965 (= res!595291 (and (= (select (arr!24482 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875966 () Bool)

(declare-fun e!487621 () Bool)

(declare-fun call!38688 () ListLongMap!10329)

(declare-fun call!38689 () ListLongMap!10329)

(assert (=> b!875966 (= e!487621 (= call!38688 call!38689))))

(declare-fun b!875967 () Bool)

(declare-fun e!487620 () Bool)

(assert (=> b!875967 (= e!487618 e!487620)))

(declare-fun res!595295 () Bool)

(assert (=> b!875967 (=> (not res!595295) (not e!487620))))

(assert (=> b!875967 (= res!595295 (= from!1053 i!612))))

(assert (=> b!875967 (= lt!396184 (getCurrentListMapNoExtraKeys!3173 _keys!868 lt!396185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28249)

(assert (=> b!875967 (= lt!396185 (array!50908 (store (arr!24481 _values!688) i!612 (ValueCellFull!8261 v!557)) (size!24923 _values!688)))))

(declare-fun lt!396186 () ListLongMap!10329)

(assert (=> b!875967 (= lt!396186 (getCurrentListMapNoExtraKeys!3173 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!595293 () Bool)

(assert (=> start!74396 (=> (not res!595293) (not e!487618))))

(assert (=> start!74396 (= res!595293 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24924 _keys!868))))))

(assert (=> start!74396 e!487618))

(declare-fun tp_is_empty!17401 () Bool)

(assert (=> start!74396 tp_is_empty!17401))

(assert (=> start!74396 true))

(assert (=> start!74396 tp!53149))

(declare-fun array_inv!19344 (array!50909) Bool)

(assert (=> start!74396 (array_inv!19344 _keys!868)))

(declare-fun e!487625 () Bool)

(declare-fun array_inv!19345 (array!50907) Bool)

(assert (=> start!74396 (and (array_inv!19345 _values!688) e!487625)))

(declare-fun b!875968 () Bool)

(declare-fun res!595290 () Bool)

(assert (=> b!875968 (=> (not res!595290) (not e!487618))))

(declare-datatypes ((List!17378 0))(
  ( (Nil!17375) (Cons!17374 (h!18505 (_ BitVec 64)) (t!24430 List!17378)) )
))
(declare-fun arrayNoDuplicates!0 (array!50909 (_ BitVec 32) List!17378) Bool)

(assert (=> b!875968 (= res!595290 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17375))))

(declare-fun b!875969 () Bool)

(declare-fun res!595299 () Bool)

(assert (=> b!875969 (=> (not res!595299) (not e!487618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875969 (= res!595299 (validKeyInArray!0 k0!854))))

(declare-fun b!875970 () Bool)

(assert (=> b!875970 (= e!487621 (= call!38688 (+!2507 call!38689 (tuple2!11571 k0!854 v!557))))))

(declare-fun b!875971 () Bool)

(assert (=> b!875971 (= e!487619 tp_is_empty!17401)))

(declare-fun b!875972 () Bool)

(assert (=> b!875972 (= e!487620 (not e!487623))))

(declare-fun res!595294 () Bool)

(assert (=> b!875972 (=> res!595294 e!487623)))

(assert (=> b!875972 (= res!595294 (not (validKeyInArray!0 (select (arr!24482 _keys!868) from!1053))))))

(assert (=> b!875972 e!487621))

(declare-fun c!92520 () Bool)

(assert (=> b!875972 (= c!92520 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29907 0))(
  ( (Unit!29908) )
))
(declare-fun lt!396187 () Unit!29907)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!676 (array!50909 array!50907 (_ BitVec 32) (_ BitVec 32) V!28249 V!28249 (_ BitVec 32) (_ BitVec 64) V!28249 (_ BitVec 32) Int) Unit!29907)

(assert (=> b!875972 (= lt!396187 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!676 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38685 () Bool)

(assert (=> bm!38685 (= call!38688 (getCurrentListMapNoExtraKeys!3173 _keys!868 lt!396185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875973 () Bool)

(declare-fun e!487624 () Bool)

(assert (=> b!875973 (= e!487625 (and e!487624 mapRes!27713))))

(declare-fun condMapEmpty!27713 () Bool)

(declare-fun mapDefault!27713 () ValueCell!8261)

(assert (=> b!875973 (= condMapEmpty!27713 (= (arr!24481 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8261)) mapDefault!27713)))))

(declare-fun b!875974 () Bool)

(declare-fun res!595298 () Bool)

(assert (=> b!875974 (=> (not res!595298) (not e!487618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875974 (= res!595298 (validMask!0 mask!1196))))

(declare-fun bm!38686 () Bool)

(assert (=> bm!38686 (= call!38689 (getCurrentListMapNoExtraKeys!3173 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875975 () Bool)

(assert (=> b!875975 (= e!487624 tp_is_empty!17401)))

(assert (= (and start!74396 res!595293) b!875974))

(assert (= (and b!875974 res!595298) b!875963))

(assert (= (and b!875963 res!595297) b!875962))

(assert (= (and b!875962 res!595296) b!875968))

(assert (= (and b!875968 res!595290) b!875964))

(assert (= (and b!875964 res!595292) b!875969))

(assert (= (and b!875969 res!595299) b!875965))

(assert (= (and b!875965 res!595291) b!875967))

(assert (= (and b!875967 res!595295) b!875972))

(assert (= (and b!875972 c!92520) b!875970))

(assert (= (and b!875972 (not c!92520)) b!875966))

(assert (= (or b!875970 b!875966) bm!38685))

(assert (= (or b!875970 b!875966) bm!38686))

(assert (= (and b!875972 (not res!595294)) b!875961))

(assert (= (and b!875973 condMapEmpty!27713) mapIsEmpty!27713))

(assert (= (and b!875973 (not condMapEmpty!27713)) mapNonEmpty!27713))

(get-info :version)

(assert (= (and mapNonEmpty!27713 ((_ is ValueCellFull!8261) mapValue!27713)) b!875971))

(assert (= (and b!875973 ((_ is ValueCellFull!8261) mapDefault!27713)) b!875975))

(assert (= start!74396 b!875973))

(declare-fun b_lambda!12207 () Bool)

(assert (=> (not b_lambda!12207) (not b!875961)))

(declare-fun t!24428 () Bool)

(declare-fun tb!4909 () Bool)

(assert (=> (and start!74396 (= defaultEntry!696 defaultEntry!696) t!24428) tb!4909))

(declare-fun result!9445 () Bool)

(assert (=> tb!4909 (= result!9445 tp_is_empty!17401)))

(assert (=> b!875961 t!24428))

(declare-fun b_and!24943 () Bool)

(assert (= b_and!24941 (and (=> t!24428 result!9445) b_and!24943)))

(declare-fun m!815229 () Bool)

(assert (=> b!875969 m!815229))

(declare-fun m!815231 () Bool)

(assert (=> b!875970 m!815231))

(declare-fun m!815233 () Bool)

(assert (=> b!875972 m!815233))

(assert (=> b!875972 m!815233))

(declare-fun m!815235 () Bool)

(assert (=> b!875972 m!815235))

(declare-fun m!815237 () Bool)

(assert (=> b!875972 m!815237))

(declare-fun m!815239 () Bool)

(assert (=> b!875962 m!815239))

(declare-fun m!815241 () Bool)

(assert (=> bm!38686 m!815241))

(declare-fun m!815243 () Bool)

(assert (=> start!74396 m!815243))

(declare-fun m!815245 () Bool)

(assert (=> start!74396 m!815245))

(declare-fun m!815247 () Bool)

(assert (=> b!875974 m!815247))

(declare-fun m!815249 () Bool)

(assert (=> b!875965 m!815249))

(declare-fun m!815251 () Bool)

(assert (=> b!875967 m!815251))

(declare-fun m!815253 () Bool)

(assert (=> b!875967 m!815253))

(declare-fun m!815255 () Bool)

(assert (=> b!875967 m!815255))

(declare-fun m!815257 () Bool)

(assert (=> bm!38685 m!815257))

(declare-fun m!815259 () Bool)

(assert (=> mapNonEmpty!27713 m!815259))

(declare-fun m!815261 () Bool)

(assert (=> b!875961 m!815261))

(declare-fun m!815263 () Bool)

(assert (=> b!875961 m!815263))

(declare-fun m!815265 () Bool)

(assert (=> b!875961 m!815265))

(assert (=> b!875961 m!815261))

(assert (=> b!875961 m!815257))

(declare-fun m!815267 () Bool)

(assert (=> b!875961 m!815267))

(assert (=> b!875961 m!815257))

(assert (=> b!875961 m!815233))

(assert (=> b!875961 m!815263))

(declare-fun m!815269 () Bool)

(assert (=> b!875968 m!815269))

(check-sat (not b!875968) (not b!875972) (not start!74396) (not bm!38685) (not bm!38686) (not b!875974) tp_is_empty!17401 (not b!875969) (not b!875970) (not b!875967) (not b_lambda!12207) (not b!875961) (not b!875962) b_and!24943 (not mapNonEmpty!27713) (not b_next!15157))
(check-sat b_and!24943 (not b_next!15157))
