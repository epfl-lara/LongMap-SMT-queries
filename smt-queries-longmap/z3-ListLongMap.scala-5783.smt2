; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74602 () Bool)

(assert start!74602)

(declare-fun b_free!15291 () Bool)

(declare-fun b_next!15291 () Bool)

(assert (=> start!74602 (= b_free!15291 (not b_next!15291))))

(declare-fun tp!53554 () Bool)

(declare-fun b_and!25169 () Bool)

(assert (=> start!74602 (= tp!53554 b_and!25169)))

(declare-fun b!879212 () Bool)

(declare-fun res!597370 () Bool)

(declare-fun e!489292 () Bool)

(assert (=> b!879212 (=> (not res!597370) (not e!489292))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879212 (= res!597370 (validMask!0 mask!1196))))

(declare-fun b!879213 () Bool)

(declare-fun res!597364 () Bool)

(assert (=> b!879213 (=> (not res!597364) (not e!489292))))

(declare-datatypes ((array!51196 0))(
  ( (array!51197 (arr!24624 (Array (_ BitVec 32) (_ BitVec 64))) (size!25064 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51196)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51196 (_ BitVec 32)) Bool)

(assert (=> b!879213 (= res!597364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879214 () Bool)

(declare-fun res!597362 () Bool)

(assert (=> b!879214 (=> (not res!597362) (not e!489292))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879214 (= res!597362 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25064 _keys!868))))))

(declare-fun b!879216 () Bool)

(declare-fun res!597365 () Bool)

(assert (=> b!879216 (=> (not res!597365) (not e!489292))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879216 (= res!597365 (validKeyInArray!0 k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-fun e!489295 () Bool)

(declare-datatypes ((V!28427 0))(
  ( (V!28428 (val!8815 Int)) )
))
(declare-datatypes ((tuple2!11658 0))(
  ( (tuple2!11659 (_1!5840 (_ BitVec 64)) (_2!5840 V!28427)) )
))
(declare-datatypes ((List!17476 0))(
  ( (Nil!17473) (Cons!17472 (h!18603 tuple2!11658) (t!24569 List!17476)) )
))
(declare-datatypes ((ListLongMap!10427 0))(
  ( (ListLongMap!10428 (toList!5229 List!17476)) )
))
(declare-fun lt!397480 () ListLongMap!10427)

(declare-fun lt!397485 () ListLongMap!10427)

(declare-datatypes ((ValueCell!8328 0))(
  ( (ValueCellFull!8328 (v!11255 V!28427)) (EmptyCell!8328) )
))
(declare-datatypes ((array!51198 0))(
  ( (array!51199 (arr!24625 (Array (_ BitVec 32) ValueCell!8328)) (size!25065 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51198)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!879217 () Bool)

(declare-fun +!2502 (ListLongMap!10427 tuple2!11658) ListLongMap!10427)

(declare-fun get!12936 (ValueCell!8328 V!28427) V!28427)

(declare-fun dynLambda!1221 (Int (_ BitVec 64)) V!28427)

(assert (=> b!879217 (= e!489295 (= lt!397485 (+!2502 lt!397480 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!879218 () Bool)

(declare-fun e!489291 () Bool)

(declare-fun tp_is_empty!17535 () Bool)

(assert (=> b!879218 (= e!489291 tp_is_empty!17535)))

(declare-fun mapIsEmpty!27918 () Bool)

(declare-fun mapRes!27918 () Bool)

(assert (=> mapIsEmpty!27918 mapRes!27918))

(declare-fun b!879219 () Bool)

(declare-fun res!597366 () Bool)

(assert (=> b!879219 (=> (not res!597366) (not e!489292))))

(declare-datatypes ((List!17477 0))(
  ( (Nil!17474) (Cons!17473 (h!18604 (_ BitVec 64)) (t!24570 List!17477)) )
))
(declare-fun arrayNoDuplicates!0 (array!51196 (_ BitVec 32) List!17477) Bool)

(assert (=> b!879219 (= res!597366 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17474))))

(declare-fun res!597363 () Bool)

(assert (=> start!74602 (=> (not res!597363) (not e!489292))))

(assert (=> start!74602 (= res!597363 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25064 _keys!868))))))

(assert (=> start!74602 e!489292))

(assert (=> start!74602 tp_is_empty!17535))

(assert (=> start!74602 true))

(assert (=> start!74602 tp!53554))

(declare-fun array_inv!19406 (array!51196) Bool)

(assert (=> start!74602 (array_inv!19406 _keys!868)))

(declare-fun e!489294 () Bool)

(declare-fun array_inv!19407 (array!51198) Bool)

(assert (=> start!74602 (and (array_inv!19407 _values!688) e!489294)))

(declare-fun b!879215 () Bool)

(declare-fun res!597369 () Bool)

(assert (=> b!879215 (=> (not res!597369) (not e!489292))))

(assert (=> b!879215 (= res!597369 (and (= (select (arr!24624 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879220 () Bool)

(declare-fun e!489290 () Bool)

(assert (=> b!879220 (= e!489290 tp_is_empty!17535)))

(declare-fun b!879221 () Bool)

(declare-fun e!489293 () Bool)

(assert (=> b!879221 (= e!489292 e!489293)))

(declare-fun res!597367 () Bool)

(assert (=> b!879221 (=> (not res!597367) (not e!489293))))

(assert (=> b!879221 (= res!597367 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397484 () array!51198)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28427)

(declare-fun zeroValue!654 () V!28427)

(declare-fun getCurrentListMapNoExtraKeys!3196 (array!51196 array!51198 (_ BitVec 32) (_ BitVec 32) V!28427 V!28427 (_ BitVec 32) Int) ListLongMap!10427)

(assert (=> b!879221 (= lt!397485 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28427)

(assert (=> b!879221 (= lt!397484 (array!51199 (store (arr!24625 _values!688) i!612 (ValueCellFull!8328 v!557)) (size!25065 _values!688)))))

(declare-fun lt!397481 () ListLongMap!10427)

(assert (=> b!879221 (= lt!397481 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27918 () Bool)

(declare-fun tp!53555 () Bool)

(assert (=> mapNonEmpty!27918 (= mapRes!27918 (and tp!53555 e!489290))))

(declare-fun mapKey!27918 () (_ BitVec 32))

(declare-fun mapRest!27918 () (Array (_ BitVec 32) ValueCell!8328))

(declare-fun mapValue!27918 () ValueCell!8328)

(assert (=> mapNonEmpty!27918 (= (arr!24625 _values!688) (store mapRest!27918 mapKey!27918 mapValue!27918))))

(declare-fun b!879222 () Bool)

(declare-fun res!597371 () Bool)

(assert (=> b!879222 (=> (not res!597371) (not e!489292))))

(assert (=> b!879222 (= res!597371 (and (= (size!25065 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25064 _keys!868) (size!25065 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879223 () Bool)

(assert (=> b!879223 (= e!489294 (and e!489291 mapRes!27918))))

(declare-fun condMapEmpty!27918 () Bool)

(declare-fun mapDefault!27918 () ValueCell!8328)

(assert (=> b!879223 (= condMapEmpty!27918 (= (arr!24625 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8328)) mapDefault!27918)))))

(declare-fun b!879224 () Bool)

(assert (=> b!879224 (= e!489293 (not e!489295))))

(declare-fun res!597368 () Bool)

(assert (=> b!879224 (=> res!597368 e!489295)))

(assert (=> b!879224 (= res!597368 (not (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053))))))

(declare-fun lt!397482 () ListLongMap!10427)

(assert (=> b!879224 (= lt!397482 lt!397480)))

(declare-fun lt!397479 () ListLongMap!10427)

(assert (=> b!879224 (= lt!397480 (+!2502 lt!397479 (tuple2!11659 k0!854 v!557)))))

(assert (=> b!879224 (= lt!397482 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879224 (= lt!397479 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30028 0))(
  ( (Unit!30029) )
))
(declare-fun lt!397483 () Unit!30028)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 (array!51196 array!51198 (_ BitVec 32) (_ BitVec 32) V!28427 V!28427 (_ BitVec 32) (_ BitVec 64) V!28427 (_ BitVec 32) Int) Unit!30028)

(assert (=> b!879224 (= lt!397483 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74602 res!597363) b!879212))

(assert (= (and b!879212 res!597370) b!879222))

(assert (= (and b!879222 res!597371) b!879213))

(assert (= (and b!879213 res!597364) b!879219))

(assert (= (and b!879219 res!597366) b!879214))

(assert (= (and b!879214 res!597362) b!879216))

(assert (= (and b!879216 res!597365) b!879215))

(assert (= (and b!879215 res!597369) b!879221))

(assert (= (and b!879221 res!597367) b!879224))

(assert (= (and b!879224 (not res!597368)) b!879217))

(assert (= (and b!879223 condMapEmpty!27918) mapIsEmpty!27918))

(assert (= (and b!879223 (not condMapEmpty!27918)) mapNonEmpty!27918))

(get-info :version)

(assert (= (and mapNonEmpty!27918 ((_ is ValueCellFull!8328) mapValue!27918)) b!879220))

(assert (= (and b!879223 ((_ is ValueCellFull!8328) mapDefault!27918)) b!879218))

(assert (= start!74602 b!879223))

(declare-fun b_lambda!12331 () Bool)

(assert (=> (not b_lambda!12331) (not b!879217)))

(declare-fun t!24568 () Bool)

(declare-fun tb!4949 () Bool)

(assert (=> (and start!74602 (= defaultEntry!696 defaultEntry!696) t!24568) tb!4949))

(declare-fun result!9519 () Bool)

(assert (=> tb!4949 (= result!9519 tp_is_empty!17535)))

(assert (=> b!879217 t!24568))

(declare-fun b_and!25171 () Bool)

(assert (= b_and!25169 (and (=> t!24568 result!9519) b_and!25171)))

(declare-fun m!818927 () Bool)

(assert (=> b!879213 m!818927))

(declare-fun m!818929 () Bool)

(assert (=> b!879215 m!818929))

(declare-fun m!818931 () Bool)

(assert (=> start!74602 m!818931))

(declare-fun m!818933 () Bool)

(assert (=> start!74602 m!818933))

(declare-fun m!818935 () Bool)

(assert (=> b!879219 m!818935))

(declare-fun m!818937 () Bool)

(assert (=> b!879221 m!818937))

(declare-fun m!818939 () Bool)

(assert (=> b!879221 m!818939))

(declare-fun m!818941 () Bool)

(assert (=> b!879221 m!818941))

(declare-fun m!818943 () Bool)

(assert (=> b!879217 m!818943))

(declare-fun m!818945 () Bool)

(assert (=> b!879217 m!818945))

(declare-fun m!818947 () Bool)

(assert (=> b!879217 m!818947))

(declare-fun m!818949 () Bool)

(assert (=> b!879217 m!818949))

(assert (=> b!879217 m!818945))

(declare-fun m!818951 () Bool)

(assert (=> b!879217 m!818951))

(assert (=> b!879217 m!818947))

(declare-fun m!818953 () Bool)

(assert (=> b!879224 m!818953))

(declare-fun m!818955 () Bool)

(assert (=> b!879224 m!818955))

(assert (=> b!879224 m!818951))

(declare-fun m!818957 () Bool)

(assert (=> b!879224 m!818957))

(assert (=> b!879224 m!818951))

(declare-fun m!818959 () Bool)

(assert (=> b!879224 m!818959))

(declare-fun m!818961 () Bool)

(assert (=> b!879224 m!818961))

(declare-fun m!818963 () Bool)

(assert (=> b!879212 m!818963))

(declare-fun m!818965 () Bool)

(assert (=> b!879216 m!818965))

(declare-fun m!818967 () Bool)

(assert (=> mapNonEmpty!27918 m!818967))

(check-sat (not b!879217) (not b!879213) (not b_next!15291) b_and!25171 (not b!879219) tp_is_empty!17535 (not b!879221) (not b_lambda!12331) (not mapNonEmpty!27918) (not b!879224) (not b!879216) (not start!74602) (not b!879212))
(check-sat b_and!25171 (not b_next!15291))
(get-model)

(declare-fun b_lambda!12335 () Bool)

(assert (= b_lambda!12331 (or (and start!74602 b_free!15291) b_lambda!12335)))

(check-sat (not b!879217) (not b!879213) (not b_next!15291) b_and!25171 (not b!879219) tp_is_empty!17535 (not b!879221) (not mapNonEmpty!27918) (not b!879224) (not start!74602) (not b!879212) (not b!879216) (not b_lambda!12335))
(check-sat b_and!25171 (not b_next!15291))
(get-model)

(declare-fun d!108895 () Bool)

(assert (=> d!108895 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!879216 d!108895))

(declare-fun d!108897 () Bool)

(assert (=> d!108897 (= (array_inv!19406 _keys!868) (bvsge (size!25064 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74602 d!108897))

(declare-fun d!108899 () Bool)

(assert (=> d!108899 (= (array_inv!19407 _values!688) (bvsge (size!25065 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74602 d!108899))

(declare-fun b!879292 () Bool)

(declare-fun res!597411 () Bool)

(declare-fun e!489335 () Bool)

(assert (=> b!879292 (=> (not res!597411) (not e!489335))))

(declare-fun lt!397526 () ListLongMap!10427)

(declare-fun contains!4251 (ListLongMap!10427 (_ BitVec 64)) Bool)

(assert (=> b!879292 (= res!597411 (not (contains!4251 lt!397526 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879293 () Bool)

(declare-fun e!489337 () Bool)

(assert (=> b!879293 (= e!489337 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879293 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879294 () Bool)

(declare-fun e!489333 () Bool)

(declare-fun isEmpty!665 (ListLongMap!10427) Bool)

(assert (=> b!879294 (= e!489333 (isEmpty!665 lt!397526))))

(declare-fun b!879295 () Bool)

(declare-fun e!489336 () ListLongMap!10427)

(assert (=> b!879295 (= e!489336 (ListLongMap!10428 Nil!17473))))

(declare-fun call!38857 () ListLongMap!10427)

(declare-fun bm!38854 () Bool)

(assert (=> bm!38854 (= call!38857 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!108901 () Bool)

(assert (=> d!108901 e!489335))

(declare-fun res!597413 () Bool)

(assert (=> d!108901 (=> (not res!597413) (not e!489335))))

(assert (=> d!108901 (= res!597413 (not (contains!4251 lt!397526 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108901 (= lt!397526 e!489336)))

(declare-fun c!92796 () Bool)

(assert (=> d!108901 (= c!92796 (bvsge from!1053 (size!25064 _keys!868)))))

(assert (=> d!108901 (validMask!0 mask!1196)))

(assert (=> d!108901 (= (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397526)))

(declare-fun b!879296 () Bool)

(declare-fun e!489334 () Bool)

(assert (=> b!879296 (= e!489334 e!489333)))

(declare-fun c!92797 () Bool)

(assert (=> b!879296 (= c!92797 (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun b!879297 () Bool)

(declare-fun e!489332 () ListLongMap!10427)

(assert (=> b!879297 (= e!489336 e!489332)))

(declare-fun c!92798 () Bool)

(assert (=> b!879297 (= c!92798 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(declare-fun b!879298 () Bool)

(assert (=> b!879298 (= e!489332 call!38857)))

(declare-fun b!879299 () Bool)

(declare-fun lt!397524 () Unit!30028)

(declare-fun lt!397522 () Unit!30028)

(assert (=> b!879299 (= lt!397524 lt!397522)))

(declare-fun lt!397527 () (_ BitVec 64))

(declare-fun lt!397525 () (_ BitVec 64))

(declare-fun lt!397523 () ListLongMap!10427)

(declare-fun lt!397521 () V!28427)

(assert (=> b!879299 (not (contains!4251 (+!2502 lt!397523 (tuple2!11659 lt!397525 lt!397521)) lt!397527))))

(declare-fun addStillNotContains!203 (ListLongMap!10427 (_ BitVec 64) V!28427 (_ BitVec 64)) Unit!30028)

(assert (=> b!879299 (= lt!397522 (addStillNotContains!203 lt!397523 lt!397525 lt!397521 lt!397527))))

(assert (=> b!879299 (= lt!397527 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879299 (= lt!397521 (get!12936 (select (arr!24625 lt!397484) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879299 (= lt!397525 (select (arr!24624 _keys!868) from!1053))))

(assert (=> b!879299 (= lt!397523 call!38857)))

(assert (=> b!879299 (= e!489332 (+!2502 call!38857 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 lt!397484) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879300 () Bool)

(assert (=> b!879300 (= e!489335 e!489334)))

(declare-fun c!92795 () Bool)

(assert (=> b!879300 (= c!92795 e!489337)))

(declare-fun res!597410 () Bool)

(assert (=> b!879300 (=> (not res!597410) (not e!489337))))

(assert (=> b!879300 (= res!597410 (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun b!879301 () Bool)

(assert (=> b!879301 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25064 _keys!868)))))

(assert (=> b!879301 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25065 lt!397484)))))

(declare-fun e!489331 () Bool)

(declare-fun apply!378 (ListLongMap!10427 (_ BitVec 64)) V!28427)

(assert (=> b!879301 (= e!489331 (= (apply!378 lt!397526 (select (arr!24624 _keys!868) from!1053)) (get!12936 (select (arr!24625 lt!397484) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879302 () Bool)

(assert (=> b!879302 (= e!489333 (= lt!397526 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879303 () Bool)

(assert (=> b!879303 (= e!489334 e!489331)))

(assert (=> b!879303 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun res!597412 () Bool)

(assert (=> b!879303 (= res!597412 (contains!4251 lt!397526 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879303 (=> (not res!597412) (not e!489331))))

(assert (= (and d!108901 c!92796) b!879295))

(assert (= (and d!108901 (not c!92796)) b!879297))

(assert (= (and b!879297 c!92798) b!879299))

(assert (= (and b!879297 (not c!92798)) b!879298))

(assert (= (or b!879299 b!879298) bm!38854))

(assert (= (and d!108901 res!597413) b!879292))

(assert (= (and b!879292 res!597411) b!879300))

(assert (= (and b!879300 res!597410) b!879293))

(assert (= (and b!879300 c!92795) b!879303))

(assert (= (and b!879300 (not c!92795)) b!879296))

(assert (= (and b!879303 res!597412) b!879301))

(assert (= (and b!879296 c!92797) b!879302))

(assert (= (and b!879296 (not c!92797)) b!879294))

(declare-fun b_lambda!12337 () Bool)

(assert (=> (not b_lambda!12337) (not b!879299)))

(assert (=> b!879299 t!24568))

(declare-fun b_and!25177 () Bool)

(assert (= b_and!25171 (and (=> t!24568 result!9519) b_and!25177)))

(declare-fun b_lambda!12339 () Bool)

(assert (=> (not b_lambda!12339) (not b!879301)))

(assert (=> b!879301 t!24568))

(declare-fun b_and!25179 () Bool)

(assert (= b_and!25177 (and (=> t!24568 result!9519) b_and!25179)))

(declare-fun m!819011 () Bool)

(assert (=> b!879302 m!819011))

(declare-fun m!819013 () Bool)

(assert (=> d!108901 m!819013))

(assert (=> d!108901 m!818963))

(declare-fun m!819015 () Bool)

(assert (=> b!879292 m!819015))

(assert (=> b!879303 m!818951))

(assert (=> b!879303 m!818951))

(declare-fun m!819017 () Bool)

(assert (=> b!879303 m!819017))

(declare-fun m!819019 () Bool)

(assert (=> b!879299 m!819019))

(declare-fun m!819021 () Bool)

(assert (=> b!879299 m!819021))

(declare-fun m!819023 () Bool)

(assert (=> b!879299 m!819023))

(assert (=> b!879299 m!819021))

(assert (=> b!879299 m!818947))

(declare-fun m!819025 () Bool)

(assert (=> b!879299 m!819025))

(assert (=> b!879299 m!818951))

(declare-fun m!819027 () Bool)

(assert (=> b!879299 m!819027))

(assert (=> b!879299 m!818947))

(assert (=> b!879299 m!819027))

(declare-fun m!819029 () Bool)

(assert (=> b!879299 m!819029))

(assert (=> bm!38854 m!819011))

(assert (=> b!879297 m!818951))

(assert (=> b!879297 m!818951))

(assert (=> b!879297 m!818957))

(declare-fun m!819031 () Bool)

(assert (=> b!879294 m!819031))

(assert (=> b!879293 m!818951))

(assert (=> b!879293 m!818951))

(assert (=> b!879293 m!818957))

(assert (=> b!879301 m!818951))

(declare-fun m!819033 () Bool)

(assert (=> b!879301 m!819033))

(assert (=> b!879301 m!819021))

(assert (=> b!879301 m!819021))

(assert (=> b!879301 m!818947))

(assert (=> b!879301 m!819025))

(assert (=> b!879301 m!818951))

(assert (=> b!879301 m!818947))

(assert (=> b!879221 d!108901))

(declare-fun b!879304 () Bool)

(declare-fun res!597415 () Bool)

(declare-fun e!489342 () Bool)

(assert (=> b!879304 (=> (not res!597415) (not e!489342))))

(declare-fun lt!397533 () ListLongMap!10427)

(assert (=> b!879304 (= res!597415 (not (contains!4251 lt!397533 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879305 () Bool)

(declare-fun e!489344 () Bool)

(assert (=> b!879305 (= e!489344 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879305 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879306 () Bool)

(declare-fun e!489340 () Bool)

(assert (=> b!879306 (= e!489340 (isEmpty!665 lt!397533))))

(declare-fun b!879307 () Bool)

(declare-fun e!489343 () ListLongMap!10427)

(assert (=> b!879307 (= e!489343 (ListLongMap!10428 Nil!17473))))

(declare-fun bm!38855 () Bool)

(declare-fun call!38858 () ListLongMap!10427)

(assert (=> bm!38855 (= call!38858 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!108903 () Bool)

(assert (=> d!108903 e!489342))

(declare-fun res!597417 () Bool)

(assert (=> d!108903 (=> (not res!597417) (not e!489342))))

(assert (=> d!108903 (= res!597417 (not (contains!4251 lt!397533 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108903 (= lt!397533 e!489343)))

(declare-fun c!92800 () Bool)

(assert (=> d!108903 (= c!92800 (bvsge from!1053 (size!25064 _keys!868)))))

(assert (=> d!108903 (validMask!0 mask!1196)))

(assert (=> d!108903 (= (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397533)))

(declare-fun b!879308 () Bool)

(declare-fun e!489341 () Bool)

(assert (=> b!879308 (= e!489341 e!489340)))

(declare-fun c!92801 () Bool)

(assert (=> b!879308 (= c!92801 (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun b!879309 () Bool)

(declare-fun e!489339 () ListLongMap!10427)

(assert (=> b!879309 (= e!489343 e!489339)))

(declare-fun c!92802 () Bool)

(assert (=> b!879309 (= c!92802 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(declare-fun b!879310 () Bool)

(assert (=> b!879310 (= e!489339 call!38858)))

(declare-fun b!879311 () Bool)

(declare-fun lt!397531 () Unit!30028)

(declare-fun lt!397529 () Unit!30028)

(assert (=> b!879311 (= lt!397531 lt!397529)))

(declare-fun lt!397530 () ListLongMap!10427)

(declare-fun lt!397532 () (_ BitVec 64))

(declare-fun lt!397528 () V!28427)

(declare-fun lt!397534 () (_ BitVec 64))

(assert (=> b!879311 (not (contains!4251 (+!2502 lt!397530 (tuple2!11659 lt!397532 lt!397528)) lt!397534))))

(assert (=> b!879311 (= lt!397529 (addStillNotContains!203 lt!397530 lt!397532 lt!397528 lt!397534))))

(assert (=> b!879311 (= lt!397534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879311 (= lt!397528 (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879311 (= lt!397532 (select (arr!24624 _keys!868) from!1053))))

(assert (=> b!879311 (= lt!397530 call!38858)))

(assert (=> b!879311 (= e!489339 (+!2502 call!38858 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879312 () Bool)

(assert (=> b!879312 (= e!489342 e!489341)))

(declare-fun c!92799 () Bool)

(assert (=> b!879312 (= c!92799 e!489344)))

(declare-fun res!597414 () Bool)

(assert (=> b!879312 (=> (not res!597414) (not e!489344))))

(assert (=> b!879312 (= res!597414 (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun b!879313 () Bool)

(assert (=> b!879313 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25064 _keys!868)))))

(assert (=> b!879313 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25065 _values!688)))))

(declare-fun e!489338 () Bool)

(assert (=> b!879313 (= e!489338 (= (apply!378 lt!397533 (select (arr!24624 _keys!868) from!1053)) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879314 () Bool)

(assert (=> b!879314 (= e!489340 (= lt!397533 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879315 () Bool)

(assert (=> b!879315 (= e!489341 e!489338)))

(assert (=> b!879315 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun res!597416 () Bool)

(assert (=> b!879315 (= res!597416 (contains!4251 lt!397533 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879315 (=> (not res!597416) (not e!489338))))

(assert (= (and d!108903 c!92800) b!879307))

(assert (= (and d!108903 (not c!92800)) b!879309))

(assert (= (and b!879309 c!92802) b!879311))

(assert (= (and b!879309 (not c!92802)) b!879310))

(assert (= (or b!879311 b!879310) bm!38855))

(assert (= (and d!108903 res!597417) b!879304))

(assert (= (and b!879304 res!597415) b!879312))

(assert (= (and b!879312 res!597414) b!879305))

(assert (= (and b!879312 c!92799) b!879315))

(assert (= (and b!879312 (not c!92799)) b!879308))

(assert (= (and b!879315 res!597416) b!879313))

(assert (= (and b!879308 c!92801) b!879314))

(assert (= (and b!879308 (not c!92801)) b!879306))

(declare-fun b_lambda!12341 () Bool)

(assert (=> (not b_lambda!12341) (not b!879311)))

(assert (=> b!879311 t!24568))

(declare-fun b_and!25181 () Bool)

(assert (= b_and!25179 (and (=> t!24568 result!9519) b_and!25181)))

(declare-fun b_lambda!12343 () Bool)

(assert (=> (not b_lambda!12343) (not b!879313)))

(assert (=> b!879313 t!24568))

(declare-fun b_and!25183 () Bool)

(assert (= b_and!25181 (and (=> t!24568 result!9519) b_and!25183)))

(declare-fun m!819035 () Bool)

(assert (=> b!879314 m!819035))

(declare-fun m!819037 () Bool)

(assert (=> d!108903 m!819037))

(assert (=> d!108903 m!818963))

(declare-fun m!819039 () Bool)

(assert (=> b!879304 m!819039))

(assert (=> b!879315 m!818951))

(assert (=> b!879315 m!818951))

(declare-fun m!819041 () Bool)

(assert (=> b!879315 m!819041))

(declare-fun m!819043 () Bool)

(assert (=> b!879311 m!819043))

(assert (=> b!879311 m!818945))

(declare-fun m!819045 () Bool)

(assert (=> b!879311 m!819045))

(assert (=> b!879311 m!818945))

(assert (=> b!879311 m!818947))

(assert (=> b!879311 m!818949))

(assert (=> b!879311 m!818951))

(declare-fun m!819047 () Bool)

(assert (=> b!879311 m!819047))

(assert (=> b!879311 m!818947))

(assert (=> b!879311 m!819047))

(declare-fun m!819049 () Bool)

(assert (=> b!879311 m!819049))

(assert (=> bm!38855 m!819035))

(assert (=> b!879309 m!818951))

(assert (=> b!879309 m!818951))

(assert (=> b!879309 m!818957))

(declare-fun m!819051 () Bool)

(assert (=> b!879306 m!819051))

(assert (=> b!879305 m!818951))

(assert (=> b!879305 m!818951))

(assert (=> b!879305 m!818957))

(assert (=> b!879313 m!818951))

(declare-fun m!819053 () Bool)

(assert (=> b!879313 m!819053))

(assert (=> b!879313 m!818945))

(assert (=> b!879313 m!818945))

(assert (=> b!879313 m!818947))

(assert (=> b!879313 m!818949))

(assert (=> b!879313 m!818951))

(assert (=> b!879313 m!818947))

(assert (=> b!879221 d!108903))

(declare-fun b!879326 () Bool)

(declare-fun e!489354 () Bool)

(declare-fun e!489353 () Bool)

(assert (=> b!879326 (= e!489354 e!489353)))

(declare-fun res!597424 () Bool)

(assert (=> b!879326 (=> (not res!597424) (not e!489353))))

(declare-fun e!489356 () Bool)

(assert (=> b!879326 (= res!597424 (not e!489356))))

(declare-fun res!597426 () Bool)

(assert (=> b!879326 (=> (not res!597426) (not e!489356))))

(assert (=> b!879326 (= res!597426 (validKeyInArray!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879327 () Bool)

(declare-fun contains!4252 (List!17477 (_ BitVec 64)) Bool)

(assert (=> b!879327 (= e!489356 (contains!4252 Nil!17474 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108905 () Bool)

(declare-fun res!597425 () Bool)

(assert (=> d!108905 (=> res!597425 e!489354)))

(assert (=> d!108905 (= res!597425 (bvsge #b00000000000000000000000000000000 (size!25064 _keys!868)))))

(assert (=> d!108905 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17474) e!489354)))

(declare-fun b!879328 () Bool)

(declare-fun e!489355 () Bool)

(declare-fun call!38861 () Bool)

(assert (=> b!879328 (= e!489355 call!38861)))

(declare-fun bm!38858 () Bool)

(declare-fun c!92805 () Bool)

(assert (=> bm!38858 (= call!38861 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92805 (Cons!17473 (select (arr!24624 _keys!868) #b00000000000000000000000000000000) Nil!17474) Nil!17474)))))

(declare-fun b!879329 () Bool)

(assert (=> b!879329 (= e!489353 e!489355)))

(assert (=> b!879329 (= c!92805 (validKeyInArray!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879330 () Bool)

(assert (=> b!879330 (= e!489355 call!38861)))

(assert (= (and d!108905 (not res!597425)) b!879326))

(assert (= (and b!879326 res!597426) b!879327))

(assert (= (and b!879326 res!597424) b!879329))

(assert (= (and b!879329 c!92805) b!879328))

(assert (= (and b!879329 (not c!92805)) b!879330))

(assert (= (or b!879328 b!879330) bm!38858))

(declare-fun m!819055 () Bool)

(assert (=> b!879326 m!819055))

(assert (=> b!879326 m!819055))

(declare-fun m!819057 () Bool)

(assert (=> b!879326 m!819057))

(assert (=> b!879327 m!819055))

(assert (=> b!879327 m!819055))

(declare-fun m!819059 () Bool)

(assert (=> b!879327 m!819059))

(assert (=> bm!38858 m!819055))

(declare-fun m!819061 () Bool)

(assert (=> bm!38858 m!819061))

(assert (=> b!879329 m!819055))

(assert (=> b!879329 m!819055))

(assert (=> b!879329 m!819057))

(assert (=> b!879219 d!108905))

(declare-fun b!879331 () Bool)

(declare-fun res!597428 () Bool)

(declare-fun e!489361 () Bool)

(assert (=> b!879331 (=> (not res!597428) (not e!489361))))

(declare-fun lt!397540 () ListLongMap!10427)

(assert (=> b!879331 (= res!597428 (not (contains!4251 lt!397540 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879332 () Bool)

(declare-fun e!489363 () Bool)

(assert (=> b!879332 (= e!489363 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879332 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879333 () Bool)

(declare-fun e!489359 () Bool)

(assert (=> b!879333 (= e!489359 (isEmpty!665 lt!397540))))

(declare-fun b!879334 () Bool)

(declare-fun e!489362 () ListLongMap!10427)

(assert (=> b!879334 (= e!489362 (ListLongMap!10428 Nil!17473))))

(declare-fun call!38862 () ListLongMap!10427)

(declare-fun bm!38859 () Bool)

(assert (=> bm!38859 (= call!38862 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!108907 () Bool)

(assert (=> d!108907 e!489361))

(declare-fun res!597430 () Bool)

(assert (=> d!108907 (=> (not res!597430) (not e!489361))))

(assert (=> d!108907 (= res!597430 (not (contains!4251 lt!397540 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108907 (= lt!397540 e!489362)))

(declare-fun c!92807 () Bool)

(assert (=> d!108907 (= c!92807 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(assert (=> d!108907 (validMask!0 mask!1196)))

(assert (=> d!108907 (= (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397540)))

(declare-fun b!879335 () Bool)

(declare-fun e!489360 () Bool)

(assert (=> b!879335 (= e!489360 e!489359)))

(declare-fun c!92808 () Bool)

(assert (=> b!879335 (= c!92808 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(declare-fun b!879336 () Bool)

(declare-fun e!489358 () ListLongMap!10427)

(assert (=> b!879336 (= e!489362 e!489358)))

(declare-fun c!92809 () Bool)

(assert (=> b!879336 (= c!92809 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!879337 () Bool)

(assert (=> b!879337 (= e!489358 call!38862)))

(declare-fun b!879338 () Bool)

(declare-fun lt!397538 () Unit!30028)

(declare-fun lt!397536 () Unit!30028)

(assert (=> b!879338 (= lt!397538 lt!397536)))

(declare-fun lt!397537 () ListLongMap!10427)

(declare-fun lt!397535 () V!28427)

(declare-fun lt!397541 () (_ BitVec 64))

(declare-fun lt!397539 () (_ BitVec 64))

(assert (=> b!879338 (not (contains!4251 (+!2502 lt!397537 (tuple2!11659 lt!397539 lt!397535)) lt!397541))))

(assert (=> b!879338 (= lt!397536 (addStillNotContains!203 lt!397537 lt!397539 lt!397535 lt!397541))))

(assert (=> b!879338 (= lt!397541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879338 (= lt!397535 (get!12936 (select (arr!24625 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879338 (= lt!397539 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!879338 (= lt!397537 call!38862)))

(assert (=> b!879338 (= e!489358 (+!2502 call!38862 (tuple2!11659 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12936 (select (arr!24625 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879339 () Bool)

(assert (=> b!879339 (= e!489361 e!489360)))

(declare-fun c!92806 () Bool)

(assert (=> b!879339 (= c!92806 e!489363)))

(declare-fun res!597427 () Bool)

(assert (=> b!879339 (=> (not res!597427) (not e!489363))))

(assert (=> b!879339 (= res!597427 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(declare-fun b!879340 () Bool)

(assert (=> b!879340 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(assert (=> b!879340 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25065 _values!688)))))

(declare-fun e!489357 () Bool)

(assert (=> b!879340 (= e!489357 (= (apply!378 lt!397540 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12936 (select (arr!24625 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879341 () Bool)

(assert (=> b!879341 (= e!489359 (= lt!397540 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879342 () Bool)

(assert (=> b!879342 (= e!489360 e!489357)))

(assert (=> b!879342 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(declare-fun res!597429 () Bool)

(assert (=> b!879342 (= res!597429 (contains!4251 lt!397540 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879342 (=> (not res!597429) (not e!489357))))

(assert (= (and d!108907 c!92807) b!879334))

(assert (= (and d!108907 (not c!92807)) b!879336))

(assert (= (and b!879336 c!92809) b!879338))

(assert (= (and b!879336 (not c!92809)) b!879337))

(assert (= (or b!879338 b!879337) bm!38859))

(assert (= (and d!108907 res!597430) b!879331))

(assert (= (and b!879331 res!597428) b!879339))

(assert (= (and b!879339 res!597427) b!879332))

(assert (= (and b!879339 c!92806) b!879342))

(assert (= (and b!879339 (not c!92806)) b!879335))

(assert (= (and b!879342 res!597429) b!879340))

(assert (= (and b!879335 c!92808) b!879341))

(assert (= (and b!879335 (not c!92808)) b!879333))

(declare-fun b_lambda!12345 () Bool)

(assert (=> (not b_lambda!12345) (not b!879338)))

(assert (=> b!879338 t!24568))

(declare-fun b_and!25185 () Bool)

(assert (= b_and!25183 (and (=> t!24568 result!9519) b_and!25185)))

(declare-fun b_lambda!12347 () Bool)

(assert (=> (not b_lambda!12347) (not b!879340)))

(assert (=> b!879340 t!24568))

(declare-fun b_and!25187 () Bool)

(assert (= b_and!25185 (and (=> t!24568 result!9519) b_and!25187)))

(declare-fun m!819063 () Bool)

(assert (=> b!879341 m!819063))

(declare-fun m!819065 () Bool)

(assert (=> d!108907 m!819065))

(assert (=> d!108907 m!818963))

(declare-fun m!819067 () Bool)

(assert (=> b!879331 m!819067))

(declare-fun m!819069 () Bool)

(assert (=> b!879342 m!819069))

(assert (=> b!879342 m!819069))

(declare-fun m!819071 () Bool)

(assert (=> b!879342 m!819071))

(declare-fun m!819073 () Bool)

(assert (=> b!879338 m!819073))

(declare-fun m!819075 () Bool)

(assert (=> b!879338 m!819075))

(declare-fun m!819077 () Bool)

(assert (=> b!879338 m!819077))

(assert (=> b!879338 m!819075))

(assert (=> b!879338 m!818947))

(declare-fun m!819079 () Bool)

(assert (=> b!879338 m!819079))

(assert (=> b!879338 m!819069))

(declare-fun m!819081 () Bool)

(assert (=> b!879338 m!819081))

(assert (=> b!879338 m!818947))

(assert (=> b!879338 m!819081))

(declare-fun m!819083 () Bool)

(assert (=> b!879338 m!819083))

(assert (=> bm!38859 m!819063))

(assert (=> b!879336 m!819069))

(assert (=> b!879336 m!819069))

(declare-fun m!819085 () Bool)

(assert (=> b!879336 m!819085))

(declare-fun m!819087 () Bool)

(assert (=> b!879333 m!819087))

(assert (=> b!879332 m!819069))

(assert (=> b!879332 m!819069))

(assert (=> b!879332 m!819085))

(assert (=> b!879340 m!819069))

(declare-fun m!819089 () Bool)

(assert (=> b!879340 m!819089))

(assert (=> b!879340 m!819075))

(assert (=> b!879340 m!819075))

(assert (=> b!879340 m!818947))

(assert (=> b!879340 m!819079))

(assert (=> b!879340 m!819069))

(assert (=> b!879340 m!818947))

(assert (=> b!879224 d!108907))

(declare-fun d!108909 () Bool)

(assert (=> d!108909 (= (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)) (and (not (= (select (arr!24624 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24624 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!879224 d!108909))

(declare-fun d!108911 () Bool)

(declare-fun e!489366 () Bool)

(assert (=> d!108911 e!489366))

(declare-fun res!597435 () Bool)

(assert (=> d!108911 (=> (not res!597435) (not e!489366))))

(declare-fun lt!397552 () ListLongMap!10427)

(assert (=> d!108911 (= res!597435 (contains!4251 lt!397552 (_1!5840 (tuple2!11659 k0!854 v!557))))))

(declare-fun lt!397550 () List!17476)

(assert (=> d!108911 (= lt!397552 (ListLongMap!10428 lt!397550))))

(declare-fun lt!397553 () Unit!30028)

(declare-fun lt!397551 () Unit!30028)

(assert (=> d!108911 (= lt!397553 lt!397551)))

(declare-datatypes ((Option!426 0))(
  ( (Some!425 (v!11260 V!28427)) (None!424) )
))
(declare-fun getValueByKey!420 (List!17476 (_ BitVec 64)) Option!426)

(assert (=> d!108911 (= (getValueByKey!420 lt!397550 (_1!5840 (tuple2!11659 k0!854 v!557))) (Some!425 (_2!5840 (tuple2!11659 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!234 (List!17476 (_ BitVec 64) V!28427) Unit!30028)

(assert (=> d!108911 (= lt!397551 (lemmaContainsTupThenGetReturnValue!234 lt!397550 (_1!5840 (tuple2!11659 k0!854 v!557)) (_2!5840 (tuple2!11659 k0!854 v!557))))))

(declare-fun insertStrictlySorted!273 (List!17476 (_ BitVec 64) V!28427) List!17476)

(assert (=> d!108911 (= lt!397550 (insertStrictlySorted!273 (toList!5229 lt!397479) (_1!5840 (tuple2!11659 k0!854 v!557)) (_2!5840 (tuple2!11659 k0!854 v!557))))))

(assert (=> d!108911 (= (+!2502 lt!397479 (tuple2!11659 k0!854 v!557)) lt!397552)))

(declare-fun b!879347 () Bool)

(declare-fun res!597436 () Bool)

(assert (=> b!879347 (=> (not res!597436) (not e!489366))))

(assert (=> b!879347 (= res!597436 (= (getValueByKey!420 (toList!5229 lt!397552) (_1!5840 (tuple2!11659 k0!854 v!557))) (Some!425 (_2!5840 (tuple2!11659 k0!854 v!557)))))))

(declare-fun b!879348 () Bool)

(declare-fun contains!4253 (List!17476 tuple2!11658) Bool)

(assert (=> b!879348 (= e!489366 (contains!4253 (toList!5229 lt!397552) (tuple2!11659 k0!854 v!557)))))

(assert (= (and d!108911 res!597435) b!879347))

(assert (= (and b!879347 res!597436) b!879348))

(declare-fun m!819091 () Bool)

(assert (=> d!108911 m!819091))

(declare-fun m!819093 () Bool)

(assert (=> d!108911 m!819093))

(declare-fun m!819095 () Bool)

(assert (=> d!108911 m!819095))

(declare-fun m!819097 () Bool)

(assert (=> d!108911 m!819097))

(declare-fun m!819099 () Bool)

(assert (=> b!879347 m!819099))

(declare-fun m!819101 () Bool)

(assert (=> b!879348 m!819101))

(assert (=> b!879224 d!108911))

(declare-fun d!108913 () Bool)

(declare-fun e!489372 () Bool)

(assert (=> d!108913 e!489372))

(declare-fun res!597439 () Bool)

(assert (=> d!108913 (=> (not res!597439) (not e!489372))))

(assert (=> d!108913 (= res!597439 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25065 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25065 _values!688))))))))

(declare-fun lt!397556 () Unit!30028)

(declare-fun choose!1434 (array!51196 array!51198 (_ BitVec 32) (_ BitVec 32) V!28427 V!28427 (_ BitVec 32) (_ BitVec 64) V!28427 (_ BitVec 32) Int) Unit!30028)

(assert (=> d!108913 (= lt!397556 (choose!1434 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108913 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(assert (=> d!108913 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397556)))

(declare-fun call!38868 () ListLongMap!10427)

(declare-fun bm!38864 () Bool)

(assert (=> bm!38864 (= call!38868 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879355 () Bool)

(declare-fun e!489371 () Bool)

(declare-fun call!38867 () ListLongMap!10427)

(assert (=> b!879355 (= e!489371 (= call!38867 call!38868))))

(declare-fun b!879356 () Bool)

(assert (=> b!879356 (= e!489371 (= call!38867 (+!2502 call!38868 (tuple2!11659 k0!854 v!557))))))

(declare-fun bm!38865 () Bool)

(assert (=> bm!38865 (= call!38867 (getCurrentListMapNoExtraKeys!3196 _keys!868 (array!51199 (store (arr!24625 _values!688) i!612 (ValueCellFull!8328 v!557)) (size!25065 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879357 () Bool)

(assert (=> b!879357 (= e!489372 e!489371)))

(declare-fun c!92812 () Bool)

(assert (=> b!879357 (= c!92812 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!108913 res!597439) b!879357))

(assert (= (and b!879357 c!92812) b!879356))

(assert (= (and b!879357 (not c!92812)) b!879355))

(assert (= (or b!879356 b!879355) bm!38864))

(assert (= (or b!879356 b!879355) bm!38865))

(declare-fun m!819103 () Bool)

(assert (=> d!108913 m!819103))

(assert (=> bm!38864 m!818953))

(declare-fun m!819105 () Bool)

(assert (=> b!879356 m!819105))

(assert (=> bm!38865 m!818939))

(declare-fun m!819107 () Bool)

(assert (=> bm!38865 m!819107))

(assert (=> b!879224 d!108913))

(declare-fun b!879358 () Bool)

(declare-fun res!597441 () Bool)

(declare-fun e!489377 () Bool)

(assert (=> b!879358 (=> (not res!597441) (not e!489377))))

(declare-fun lt!397562 () ListLongMap!10427)

(assert (=> b!879358 (= res!597441 (not (contains!4251 lt!397562 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879359 () Bool)

(declare-fun e!489379 () Bool)

(assert (=> b!879359 (= e!489379 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879359 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879360 () Bool)

(declare-fun e!489375 () Bool)

(assert (=> b!879360 (= e!489375 (isEmpty!665 lt!397562))))

(declare-fun b!879361 () Bool)

(declare-fun e!489378 () ListLongMap!10427)

(assert (=> b!879361 (= e!489378 (ListLongMap!10428 Nil!17473))))

(declare-fun call!38869 () ListLongMap!10427)

(declare-fun bm!38866 () Bool)

(assert (=> bm!38866 (= call!38869 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!108915 () Bool)

(assert (=> d!108915 e!489377))

(declare-fun res!597443 () Bool)

(assert (=> d!108915 (=> (not res!597443) (not e!489377))))

(assert (=> d!108915 (= res!597443 (not (contains!4251 lt!397562 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108915 (= lt!397562 e!489378)))

(declare-fun c!92814 () Bool)

(assert (=> d!108915 (= c!92814 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(assert (=> d!108915 (validMask!0 mask!1196)))

(assert (=> d!108915 (= (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397562)))

(declare-fun b!879362 () Bool)

(declare-fun e!489376 () Bool)

(assert (=> b!879362 (= e!489376 e!489375)))

(declare-fun c!92815 () Bool)

(assert (=> b!879362 (= c!92815 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(declare-fun b!879363 () Bool)

(declare-fun e!489374 () ListLongMap!10427)

(assert (=> b!879363 (= e!489378 e!489374)))

(declare-fun c!92816 () Bool)

(assert (=> b!879363 (= c!92816 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!879364 () Bool)

(assert (=> b!879364 (= e!489374 call!38869)))

(declare-fun b!879365 () Bool)

(declare-fun lt!397560 () Unit!30028)

(declare-fun lt!397558 () Unit!30028)

(assert (=> b!879365 (= lt!397560 lt!397558)))

(declare-fun lt!397557 () V!28427)

(declare-fun lt!397563 () (_ BitVec 64))

(declare-fun lt!397559 () ListLongMap!10427)

(declare-fun lt!397561 () (_ BitVec 64))

(assert (=> b!879365 (not (contains!4251 (+!2502 lt!397559 (tuple2!11659 lt!397561 lt!397557)) lt!397563))))

(assert (=> b!879365 (= lt!397558 (addStillNotContains!203 lt!397559 lt!397561 lt!397557 lt!397563))))

(assert (=> b!879365 (= lt!397563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879365 (= lt!397557 (get!12936 (select (arr!24625 lt!397484) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879365 (= lt!397561 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!879365 (= lt!397559 call!38869)))

(assert (=> b!879365 (= e!489374 (+!2502 call!38869 (tuple2!11659 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12936 (select (arr!24625 lt!397484) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879366 () Bool)

(assert (=> b!879366 (= e!489377 e!489376)))

(declare-fun c!92813 () Bool)

(assert (=> b!879366 (= c!92813 e!489379)))

(declare-fun res!597440 () Bool)

(assert (=> b!879366 (=> (not res!597440) (not e!489379))))

(assert (=> b!879366 (= res!597440 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(declare-fun b!879367 () Bool)

(assert (=> b!879367 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(assert (=> b!879367 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25065 lt!397484)))))

(declare-fun e!489373 () Bool)

(assert (=> b!879367 (= e!489373 (= (apply!378 lt!397562 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12936 (select (arr!24625 lt!397484) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879368 () Bool)

(assert (=> b!879368 (= e!489375 (= lt!397562 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!397484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879369 () Bool)

(assert (=> b!879369 (= e!489376 e!489373)))

(assert (=> b!879369 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25064 _keys!868)))))

(declare-fun res!597442 () Bool)

(assert (=> b!879369 (= res!597442 (contains!4251 lt!397562 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879369 (=> (not res!597442) (not e!489373))))

(assert (= (and d!108915 c!92814) b!879361))

(assert (= (and d!108915 (not c!92814)) b!879363))

(assert (= (and b!879363 c!92816) b!879365))

(assert (= (and b!879363 (not c!92816)) b!879364))

(assert (= (or b!879365 b!879364) bm!38866))

(assert (= (and d!108915 res!597443) b!879358))

(assert (= (and b!879358 res!597441) b!879366))

(assert (= (and b!879366 res!597440) b!879359))

(assert (= (and b!879366 c!92813) b!879369))

(assert (= (and b!879366 (not c!92813)) b!879362))

(assert (= (and b!879369 res!597442) b!879367))

(assert (= (and b!879362 c!92815) b!879368))

(assert (= (and b!879362 (not c!92815)) b!879360))

(declare-fun b_lambda!12349 () Bool)

(assert (=> (not b_lambda!12349) (not b!879365)))

(assert (=> b!879365 t!24568))

(declare-fun b_and!25189 () Bool)

(assert (= b_and!25187 (and (=> t!24568 result!9519) b_and!25189)))

(declare-fun b_lambda!12351 () Bool)

(assert (=> (not b_lambda!12351) (not b!879367)))

(assert (=> b!879367 t!24568))

(declare-fun b_and!25191 () Bool)

(assert (= b_and!25189 (and (=> t!24568 result!9519) b_and!25191)))

(declare-fun m!819109 () Bool)

(assert (=> b!879368 m!819109))

(declare-fun m!819111 () Bool)

(assert (=> d!108915 m!819111))

(assert (=> d!108915 m!818963))

(declare-fun m!819113 () Bool)

(assert (=> b!879358 m!819113))

(assert (=> b!879369 m!819069))

(assert (=> b!879369 m!819069))

(declare-fun m!819115 () Bool)

(assert (=> b!879369 m!819115))

(declare-fun m!819117 () Bool)

(assert (=> b!879365 m!819117))

(declare-fun m!819119 () Bool)

(assert (=> b!879365 m!819119))

(declare-fun m!819121 () Bool)

(assert (=> b!879365 m!819121))

(assert (=> b!879365 m!819119))

(assert (=> b!879365 m!818947))

(declare-fun m!819123 () Bool)

(assert (=> b!879365 m!819123))

(assert (=> b!879365 m!819069))

(declare-fun m!819125 () Bool)

(assert (=> b!879365 m!819125))

(assert (=> b!879365 m!818947))

(assert (=> b!879365 m!819125))

(declare-fun m!819127 () Bool)

(assert (=> b!879365 m!819127))

(assert (=> bm!38866 m!819109))

(assert (=> b!879363 m!819069))

(assert (=> b!879363 m!819069))

(assert (=> b!879363 m!819085))

(declare-fun m!819129 () Bool)

(assert (=> b!879360 m!819129))

(assert (=> b!879359 m!819069))

(assert (=> b!879359 m!819069))

(assert (=> b!879359 m!819085))

(assert (=> b!879367 m!819069))

(declare-fun m!819131 () Bool)

(assert (=> b!879367 m!819131))

(assert (=> b!879367 m!819119))

(assert (=> b!879367 m!819119))

(assert (=> b!879367 m!818947))

(assert (=> b!879367 m!819123))

(assert (=> b!879367 m!819069))

(assert (=> b!879367 m!818947))

(assert (=> b!879224 d!108915))

(declare-fun b!879378 () Bool)

(declare-fun e!489388 () Bool)

(declare-fun call!38872 () Bool)

(assert (=> b!879378 (= e!489388 call!38872)))

(declare-fun b!879379 () Bool)

(declare-fun e!489387 () Bool)

(assert (=> b!879379 (= e!489388 e!489387)))

(declare-fun lt!397571 () (_ BitVec 64))

(assert (=> b!879379 (= lt!397571 (select (arr!24624 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!397570 () Unit!30028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51196 (_ BitVec 64) (_ BitVec 32)) Unit!30028)

(assert (=> b!879379 (= lt!397570 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397571 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!879379 (arrayContainsKey!0 _keys!868 lt!397571 #b00000000000000000000000000000000)))

(declare-fun lt!397572 () Unit!30028)

(assert (=> b!879379 (= lt!397572 lt!397570)))

(declare-fun res!597449 () Bool)

(declare-datatypes ((SeekEntryResult!8754 0))(
  ( (MissingZero!8754 (index!37387 (_ BitVec 32))) (Found!8754 (index!37388 (_ BitVec 32))) (Intermediate!8754 (undefined!9566 Bool) (index!37389 (_ BitVec 32)) (x!74472 (_ BitVec 32))) (Undefined!8754) (MissingVacant!8754 (index!37390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51196 (_ BitVec 32)) SeekEntryResult!8754)

(assert (=> b!879379 (= res!597449 (= (seekEntryOrOpen!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8754 #b00000000000000000000000000000000)))))

(assert (=> b!879379 (=> (not res!597449) (not e!489387))))

(declare-fun b!879380 () Bool)

(assert (=> b!879380 (= e!489387 call!38872)))

(declare-fun d!108917 () Bool)

(declare-fun res!597448 () Bool)

(declare-fun e!489386 () Bool)

(assert (=> d!108917 (=> res!597448 e!489386)))

(assert (=> d!108917 (= res!597448 (bvsge #b00000000000000000000000000000000 (size!25064 _keys!868)))))

(assert (=> d!108917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!489386)))

(declare-fun bm!38869 () Bool)

(assert (=> bm!38869 (= call!38872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!879381 () Bool)

(assert (=> b!879381 (= e!489386 e!489388)))

(declare-fun c!92819 () Bool)

(assert (=> b!879381 (= c!92819 (validKeyInArray!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108917 (not res!597448)) b!879381))

(assert (= (and b!879381 c!92819) b!879379))

(assert (= (and b!879381 (not c!92819)) b!879378))

(assert (= (and b!879379 res!597449) b!879380))

(assert (= (or b!879380 b!879378) bm!38869))

(assert (=> b!879379 m!819055))

(declare-fun m!819133 () Bool)

(assert (=> b!879379 m!819133))

(declare-fun m!819135 () Bool)

(assert (=> b!879379 m!819135))

(assert (=> b!879379 m!819055))

(declare-fun m!819137 () Bool)

(assert (=> b!879379 m!819137))

(declare-fun m!819139 () Bool)

(assert (=> bm!38869 m!819139))

(assert (=> b!879381 m!819055))

(assert (=> b!879381 m!819055))

(assert (=> b!879381 m!819057))

(assert (=> b!879213 d!108917))

(declare-fun d!108919 () Bool)

(declare-fun e!489389 () Bool)

(assert (=> d!108919 e!489389))

(declare-fun res!597450 () Bool)

(assert (=> d!108919 (=> (not res!597450) (not e!489389))))

(declare-fun lt!397575 () ListLongMap!10427)

(assert (=> d!108919 (= res!597450 (contains!4251 lt!397575 (_1!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397573 () List!17476)

(assert (=> d!108919 (= lt!397575 (ListLongMap!10428 lt!397573))))

(declare-fun lt!397576 () Unit!30028)

(declare-fun lt!397574 () Unit!30028)

(assert (=> d!108919 (= lt!397576 lt!397574)))

(assert (=> d!108919 (= (getValueByKey!420 lt!397573 (_1!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108919 (= lt!397574 (lemmaContainsTupThenGetReturnValue!234 lt!397573 (_1!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108919 (= lt!397573 (insertStrictlySorted!273 (toList!5229 lt!397480) (_1!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108919 (= (+!2502 lt!397480 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397575)))

(declare-fun b!879382 () Bool)

(declare-fun res!597451 () Bool)

(assert (=> b!879382 (=> (not res!597451) (not e!489389))))

(assert (=> b!879382 (= res!597451 (= (getValueByKey!420 (toList!5229 lt!397575) (_1!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5840 (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!879383 () Bool)

(assert (=> b!879383 (= e!489389 (contains!4253 (toList!5229 lt!397575) (tuple2!11659 (select (arr!24624 _keys!868) from!1053) (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108919 res!597450) b!879382))

(assert (= (and b!879382 res!597451) b!879383))

(declare-fun m!819141 () Bool)

(assert (=> d!108919 m!819141))

(declare-fun m!819143 () Bool)

(assert (=> d!108919 m!819143))

(declare-fun m!819145 () Bool)

(assert (=> d!108919 m!819145))

(declare-fun m!819147 () Bool)

(assert (=> d!108919 m!819147))

(declare-fun m!819149 () Bool)

(assert (=> b!879382 m!819149))

(declare-fun m!819151 () Bool)

(assert (=> b!879383 m!819151))

(assert (=> b!879217 d!108919))

(declare-fun d!108921 () Bool)

(declare-fun c!92822 () Bool)

(assert (=> d!108921 (= c!92822 ((_ is ValueCellFull!8328) (select (arr!24625 _values!688) from!1053)))))

(declare-fun e!489392 () V!28427)

(assert (=> d!108921 (= (get!12936 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!489392)))

(declare-fun b!879388 () Bool)

(declare-fun get!12938 (ValueCell!8328 V!28427) V!28427)

(assert (=> b!879388 (= e!489392 (get!12938 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879389 () Bool)

(declare-fun get!12939 (ValueCell!8328 V!28427) V!28427)

(assert (=> b!879389 (= e!489392 (get!12939 (select (arr!24625 _values!688) from!1053) (dynLambda!1221 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108921 c!92822) b!879388))

(assert (= (and d!108921 (not c!92822)) b!879389))

(assert (=> b!879388 m!818945))

(assert (=> b!879388 m!818947))

(declare-fun m!819153 () Bool)

(assert (=> b!879388 m!819153))

(assert (=> b!879389 m!818945))

(assert (=> b!879389 m!818947))

(declare-fun m!819155 () Bool)

(assert (=> b!879389 m!819155))

(assert (=> b!879217 d!108921))

(declare-fun d!108923 () Bool)

(assert (=> d!108923 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!879212 d!108923))

(declare-fun mapNonEmpty!27924 () Bool)

(declare-fun mapRes!27924 () Bool)

(declare-fun tp!53564 () Bool)

(declare-fun e!489397 () Bool)

(assert (=> mapNonEmpty!27924 (= mapRes!27924 (and tp!53564 e!489397))))

(declare-fun mapKey!27924 () (_ BitVec 32))

(declare-fun mapRest!27924 () (Array (_ BitVec 32) ValueCell!8328))

(declare-fun mapValue!27924 () ValueCell!8328)

(assert (=> mapNonEmpty!27924 (= mapRest!27918 (store mapRest!27924 mapKey!27924 mapValue!27924))))

(declare-fun b!879397 () Bool)

(declare-fun e!489398 () Bool)

(assert (=> b!879397 (= e!489398 tp_is_empty!17535)))

(declare-fun mapIsEmpty!27924 () Bool)

(assert (=> mapIsEmpty!27924 mapRes!27924))

(declare-fun b!879396 () Bool)

(assert (=> b!879396 (= e!489397 tp_is_empty!17535)))

(declare-fun condMapEmpty!27924 () Bool)

(declare-fun mapDefault!27924 () ValueCell!8328)

(assert (=> mapNonEmpty!27918 (= condMapEmpty!27924 (= mapRest!27918 ((as const (Array (_ BitVec 32) ValueCell!8328)) mapDefault!27924)))))

(assert (=> mapNonEmpty!27918 (= tp!53555 (and e!489398 mapRes!27924))))

(assert (= (and mapNonEmpty!27918 condMapEmpty!27924) mapIsEmpty!27924))

(assert (= (and mapNonEmpty!27918 (not condMapEmpty!27924)) mapNonEmpty!27924))

(assert (= (and mapNonEmpty!27924 ((_ is ValueCellFull!8328) mapValue!27924)) b!879396))

(assert (= (and mapNonEmpty!27918 ((_ is ValueCellFull!8328) mapDefault!27924)) b!879397))

(declare-fun m!819157 () Bool)

(assert (=> mapNonEmpty!27924 m!819157))

(declare-fun b_lambda!12353 () Bool)

(assert (= b_lambda!12347 (or (and start!74602 b_free!15291) b_lambda!12353)))

(declare-fun b_lambda!12355 () Bool)

(assert (= b_lambda!12349 (or (and start!74602 b_free!15291) b_lambda!12355)))

(declare-fun b_lambda!12357 () Bool)

(assert (= b_lambda!12351 (or (and start!74602 b_free!15291) b_lambda!12357)))

(declare-fun b_lambda!12359 () Bool)

(assert (= b_lambda!12339 (or (and start!74602 b_free!15291) b_lambda!12359)))

(declare-fun b_lambda!12361 () Bool)

(assert (= b_lambda!12337 (or (and start!74602 b_free!15291) b_lambda!12361)))

(declare-fun b_lambda!12363 () Bool)

(assert (= b_lambda!12341 (or (and start!74602 b_free!15291) b_lambda!12363)))

(declare-fun b_lambda!12365 () Bool)

(assert (= b_lambda!12343 (or (and start!74602 b_free!15291) b_lambda!12365)))

(declare-fun b_lambda!12367 () Bool)

(assert (= b_lambda!12345 (or (and start!74602 b_free!15291) b_lambda!12367)))

(check-sat (not b!879332) (not b!879369) (not bm!38864) (not b_lambda!12365) (not b!879327) (not b!879331) (not b!879329) (not b!879293) (not d!108903) (not mapNonEmpty!27924) (not b!879297) (not b!879294) (not d!108919) (not b_next!15291) (not b!879360) (not b!879311) (not b!879347) (not b!879367) (not bm!38859) (not b!879342) (not b_lambda!12361) (not d!108901) (not b!879292) (not b!879381) (not bm!38858) (not b!879336) (not d!108915) (not b!879301) (not bm!38855) (not b!879358) (not b!879314) (not b!879338) (not bm!38866) (not b_lambda!12357) (not d!108911) (not b!879359) (not b!879388) (not bm!38854) (not b!879383) (not b!879302) (not b!879305) (not b!879341) tp_is_empty!17535 (not b!879313) (not b!879365) (not b_lambda!12363) b_and!25191 (not d!108907) (not b!879356) (not b!879326) (not b!879333) (not b!879389) (not b!879348) (not b_lambda!12355) (not b!879363) (not b!879309) (not b!879299) (not b!879315) (not b_lambda!12359) (not b!879379) (not bm!38865) (not b!879340) (not b!879304) (not b_lambda!12335) (not b!879368) (not b_lambda!12353) (not b!879306) (not b_lambda!12367) (not bm!38869) (not b!879303) (not b!879382) (not d!108913))
(check-sat b_and!25191 (not b_next!15291))
