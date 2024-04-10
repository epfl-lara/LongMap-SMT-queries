; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74822 () Bool)

(assert start!74822)

(declare-fun b_free!15399 () Bool)

(declare-fun b_next!15399 () Bool)

(assert (=> start!74822 (= b_free!15399 (not b_next!15399))))

(declare-fun tp!53894 () Bool)

(declare-fun b_and!25465 () Bool)

(assert (=> start!74822 (= tp!53894 b_and!25465)))

(declare-fun b!882221 () Bool)

(declare-fun e!490981 () Bool)

(declare-datatypes ((List!17553 0))(
  ( (Nil!17550) (Cons!17549 (h!18680 (_ BitVec 64)) (t!24754 List!17553)) )
))
(declare-fun noDuplicate!1319 (List!17553) Bool)

(assert (=> b!882221 (= e!490981 (noDuplicate!1319 Nil!17550))))

(declare-fun b!882223 () Bool)

(declare-fun e!490977 () Bool)

(declare-fun e!490978 () Bool)

(assert (=> b!882223 (= e!490977 e!490978)))

(declare-fun res!599374 () Bool)

(assert (=> b!882223 (=> (not res!599374) (not e!490978))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882223 (= res!599374 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28571 0))(
  ( (V!28572 (val!8869 Int)) )
))
(declare-datatypes ((ValueCell!8382 0))(
  ( (ValueCellFull!8382 (v!11329 V!28571)) (EmptyCell!8382) )
))
(declare-datatypes ((array!51412 0))(
  ( (array!51413 (arr!24727 (Array (_ BitVec 32) ValueCell!8382)) (size!25167 (_ BitVec 32))) )
))
(declare-fun lt!399131 () array!51412)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28571)

(declare-fun zeroValue!654 () V!28571)

(declare-datatypes ((tuple2!11744 0))(
  ( (tuple2!11745 (_1!5883 (_ BitVec 64)) (_2!5883 V!28571)) )
))
(declare-datatypes ((List!17554 0))(
  ( (Nil!17551) (Cons!17550 (h!18681 tuple2!11744) (t!24755 List!17554)) )
))
(declare-datatypes ((ListLongMap!10513 0))(
  ( (ListLongMap!10514 (toList!5272 List!17554)) )
))
(declare-fun lt!399129 () ListLongMap!10513)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((array!51414 0))(
  ( (array!51415 (arr!24728 (Array (_ BitVec 32) (_ BitVec 64))) (size!25168 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51414)

(declare-fun getCurrentListMapNoExtraKeys!3233 (array!51414 array!51412 (_ BitVec 32) (_ BitVec 32) V!28571 V!28571 (_ BitVec 32) Int) ListLongMap!10513)

(assert (=> b!882223 (= lt!399129 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28571)

(declare-fun _values!688 () array!51412)

(assert (=> b!882223 (= lt!399131 (array!51413 (store (arr!24727 _values!688) i!612 (ValueCellFull!8382 v!557)) (size!25167 _values!688)))))

(declare-fun lt!399136 () ListLongMap!10513)

(assert (=> b!882223 (= lt!399136 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882224 () Bool)

(declare-fun res!599371 () Bool)

(assert (=> b!882224 (=> (not res!599371) (not e!490977))))

(assert (=> b!882224 (= res!599371 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25168 _keys!868))))))

(declare-fun b!882225 () Bool)

(declare-fun e!490975 () Bool)

(assert (=> b!882225 (= e!490978 (not e!490975))))

(declare-fun res!599375 () Bool)

(assert (=> b!882225 (=> res!599375 e!490975)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882225 (= res!599375 (not (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053))))))

(declare-fun lt!399130 () ListLongMap!10513)

(declare-fun lt!399135 () ListLongMap!10513)

(assert (=> b!882225 (= lt!399130 lt!399135)))

(declare-fun lt!399137 () ListLongMap!10513)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2542 (ListLongMap!10513 tuple2!11744) ListLongMap!10513)

(assert (=> b!882225 (= lt!399135 (+!2542 lt!399137 (tuple2!11745 k0!854 v!557)))))

(assert (=> b!882225 (= lt!399130 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882225 (= lt!399137 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30100 0))(
  ( (Unit!30101) )
))
(declare-fun lt!399132 () Unit!30100)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 (array!51414 array!51412 (_ BitVec 32) (_ BitVec 32) V!28571 V!28571 (_ BitVec 32) (_ BitVec 64) V!28571 (_ BitVec 32) Int) Unit!30100)

(assert (=> b!882225 (= lt!399132 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28095 () Bool)

(declare-fun mapRes!28095 () Bool)

(declare-fun tp!53893 () Bool)

(declare-fun e!490980 () Bool)

(assert (=> mapNonEmpty!28095 (= mapRes!28095 (and tp!53893 e!490980))))

(declare-fun mapRest!28095 () (Array (_ BitVec 32) ValueCell!8382))

(declare-fun mapValue!28095 () ValueCell!8382)

(declare-fun mapKey!28095 () (_ BitVec 32))

(assert (=> mapNonEmpty!28095 (= (arr!24727 _values!688) (store mapRest!28095 mapKey!28095 mapValue!28095))))

(declare-fun b!882226 () Bool)

(declare-fun res!599373 () Bool)

(assert (=> b!882226 (=> (not res!599373) (not e!490977))))

(assert (=> b!882226 (= res!599373 (validKeyInArray!0 k0!854))))

(declare-fun b!882227 () Bool)

(declare-fun e!490979 () Bool)

(declare-fun tp_is_empty!17643 () Bool)

(assert (=> b!882227 (= e!490979 tp_is_empty!17643)))

(declare-fun b!882222 () Bool)

(declare-fun res!599377 () Bool)

(assert (=> b!882222 (=> (not res!599377) (not e!490977))))

(assert (=> b!882222 (= res!599377 (and (= (size!25167 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25168 _keys!868) (size!25167 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!599382 () Bool)

(assert (=> start!74822 (=> (not res!599382) (not e!490977))))

(assert (=> start!74822 (= res!599382 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25168 _keys!868))))))

(assert (=> start!74822 e!490977))

(assert (=> start!74822 tp_is_empty!17643))

(assert (=> start!74822 true))

(assert (=> start!74822 tp!53894))

(declare-fun array_inv!19470 (array!51414) Bool)

(assert (=> start!74822 (array_inv!19470 _keys!868)))

(declare-fun e!490983 () Bool)

(declare-fun array_inv!19471 (array!51412) Bool)

(assert (=> start!74822 (and (array_inv!19471 _values!688) e!490983)))

(declare-fun b!882228 () Bool)

(declare-fun res!599376 () Bool)

(assert (=> b!882228 (=> (not res!599376) (not e!490977))))

(assert (=> b!882228 (= res!599376 (and (= (select (arr!24728 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882229 () Bool)

(assert (=> b!882229 (= e!490980 tp_is_empty!17643)))

(declare-fun b!882230 () Bool)

(declare-fun e!490976 () Bool)

(assert (=> b!882230 (= e!490975 e!490976)))

(declare-fun res!599381 () Bool)

(assert (=> b!882230 (=> res!599381 e!490976)))

(assert (=> b!882230 (= res!599381 (not (= (select (arr!24728 _keys!868) from!1053) k0!854)))))

(declare-fun get!13017 (ValueCell!8382 V!28571) V!28571)

(declare-fun dynLambda!1256 (Int (_ BitVec 64)) V!28571)

(assert (=> b!882230 (= lt!399129 (+!2542 lt!399135 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!28095 () Bool)

(assert (=> mapIsEmpty!28095 mapRes!28095))

(declare-fun b!882231 () Bool)

(declare-fun res!599379 () Bool)

(assert (=> b!882231 (=> (not res!599379) (not e!490977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882231 (= res!599379 (validMask!0 mask!1196))))

(declare-fun b!882232 () Bool)

(assert (=> b!882232 (= e!490983 (and e!490979 mapRes!28095))))

(declare-fun condMapEmpty!28095 () Bool)

(declare-fun mapDefault!28095 () ValueCell!8382)

(assert (=> b!882232 (= condMapEmpty!28095 (= (arr!24727 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8382)) mapDefault!28095)))))

(declare-fun b!882233 () Bool)

(declare-fun res!599378 () Bool)

(assert (=> b!882233 (=> (not res!599378) (not e!490977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51414 (_ BitVec 32)) Bool)

(assert (=> b!882233 (= res!599378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882234 () Bool)

(assert (=> b!882234 (= e!490976 e!490981)))

(declare-fun res!599372 () Bool)

(assert (=> b!882234 (=> res!599372 e!490981)))

(assert (=> b!882234 (= res!599372 (or (bvsge (size!25168 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)) (bvsge from!1053 (size!25168 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882234 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399133 () Unit!30100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51414 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30100)

(assert (=> b!882234 (= lt!399133 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!51414 (_ BitVec 32) List!17553) Bool)

(assert (=> b!882234 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17550)))

(declare-fun lt!399134 () Unit!30100)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51414 (_ BitVec 32) (_ BitVec 32)) Unit!30100)

(assert (=> b!882234 (= lt!399134 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882235 () Bool)

(declare-fun res!599380 () Bool)

(assert (=> b!882235 (=> (not res!599380) (not e!490977))))

(assert (=> b!882235 (= res!599380 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17550))))

(assert (= (and start!74822 res!599382) b!882231))

(assert (= (and b!882231 res!599379) b!882222))

(assert (= (and b!882222 res!599377) b!882233))

(assert (= (and b!882233 res!599378) b!882235))

(assert (= (and b!882235 res!599380) b!882224))

(assert (= (and b!882224 res!599371) b!882226))

(assert (= (and b!882226 res!599373) b!882228))

(assert (= (and b!882228 res!599376) b!882223))

(assert (= (and b!882223 res!599374) b!882225))

(assert (= (and b!882225 (not res!599375)) b!882230))

(assert (= (and b!882230 (not res!599381)) b!882234))

(assert (= (and b!882234 (not res!599372)) b!882221))

(assert (= (and b!882232 condMapEmpty!28095) mapIsEmpty!28095))

(assert (= (and b!882232 (not condMapEmpty!28095)) mapNonEmpty!28095))

(get-info :version)

(assert (= (and mapNonEmpty!28095 ((_ is ValueCellFull!8382) mapValue!28095)) b!882229))

(assert (= (and b!882232 ((_ is ValueCellFull!8382) mapDefault!28095)) b!882227))

(assert (= start!74822 b!882232))

(declare-fun b_lambda!12609 () Bool)

(assert (=> (not b_lambda!12609) (not b!882230)))

(declare-fun t!24753 () Bool)

(declare-fun tb!5057 () Bool)

(assert (=> (and start!74822 (= defaultEntry!696 defaultEntry!696) t!24753) tb!5057))

(declare-fun result!9745 () Bool)

(assert (=> tb!5057 (= result!9745 tp_is_empty!17643)))

(assert (=> b!882230 t!24753))

(declare-fun b_and!25467 () Bool)

(assert (= b_and!25465 (and (=> t!24753 result!9745) b_and!25467)))

(declare-fun m!822167 () Bool)

(assert (=> b!882228 m!822167))

(declare-fun m!822169 () Bool)

(assert (=> b!882231 m!822169))

(declare-fun m!822171 () Bool)

(assert (=> start!74822 m!822171))

(declare-fun m!822173 () Bool)

(assert (=> start!74822 m!822173))

(declare-fun m!822175 () Bool)

(assert (=> b!882226 m!822175))

(declare-fun m!822177 () Bool)

(assert (=> mapNonEmpty!28095 m!822177))

(declare-fun m!822179 () Bool)

(assert (=> b!882221 m!822179))

(declare-fun m!822181 () Bool)

(assert (=> b!882225 m!822181))

(declare-fun m!822183 () Bool)

(assert (=> b!882225 m!822183))

(declare-fun m!822185 () Bool)

(assert (=> b!882225 m!822185))

(declare-fun m!822187 () Bool)

(assert (=> b!882225 m!822187))

(declare-fun m!822189 () Bool)

(assert (=> b!882225 m!822189))

(assert (=> b!882225 m!822187))

(declare-fun m!822191 () Bool)

(assert (=> b!882225 m!822191))

(declare-fun m!822193 () Bool)

(assert (=> b!882233 m!822193))

(declare-fun m!822195 () Bool)

(assert (=> b!882234 m!822195))

(declare-fun m!822197 () Bool)

(assert (=> b!882234 m!822197))

(declare-fun m!822199 () Bool)

(assert (=> b!882234 m!822199))

(declare-fun m!822201 () Bool)

(assert (=> b!882234 m!822201))

(declare-fun m!822203 () Bool)

(assert (=> b!882223 m!822203))

(declare-fun m!822205 () Bool)

(assert (=> b!882223 m!822205))

(declare-fun m!822207 () Bool)

(assert (=> b!882223 m!822207))

(declare-fun m!822209 () Bool)

(assert (=> b!882235 m!822209))

(declare-fun m!822211 () Bool)

(assert (=> b!882230 m!822211))

(assert (=> b!882230 m!822187))

(declare-fun m!822213 () Bool)

(assert (=> b!882230 m!822213))

(assert (=> b!882230 m!822211))

(assert (=> b!882230 m!822213))

(declare-fun m!822215 () Bool)

(assert (=> b!882230 m!822215))

(declare-fun m!822217 () Bool)

(assert (=> b!882230 m!822217))

(check-sat (not b!882233) (not b!882226) (not b!882230) (not b!882234) (not b!882225) (not b_lambda!12609) (not mapNonEmpty!28095) (not b!882235) (not b!882221) (not b!882231) b_and!25467 (not b_next!15399) (not start!74822) (not b!882223) tp_is_empty!17643)
(check-sat b_and!25467 (not b_next!15399))
(get-model)

(declare-fun b_lambda!12613 () Bool)

(assert (= b_lambda!12609 (or (and start!74822 b_free!15399) b_lambda!12613)))

(check-sat (not b!882233) (not b!882226) (not b!882230) (not b!882234) (not b!882225) (not b_lambda!12613) (not mapNonEmpty!28095) (not b!882235) (not b!882221) (not b!882231) b_and!25467 (not b_next!15399) (not start!74822) (not b!882223) tp_is_empty!17643)
(check-sat b_and!25467 (not b_next!15399))
(get-model)

(declare-fun d!109099 () Bool)

(assert (=> d!109099 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!882231 d!109099))

(declare-fun b!882309 () Bool)

(declare-fun lt!399180 () Unit!30100)

(declare-fun lt!399185 () Unit!30100)

(assert (=> b!882309 (= lt!399180 lt!399185)))

(declare-fun lt!399183 () V!28571)

(declare-fun lt!399182 () (_ BitVec 64))

(declare-fun lt!399179 () ListLongMap!10513)

(declare-fun lt!399181 () (_ BitVec 64))

(declare-fun contains!4266 (ListLongMap!10513 (_ BitVec 64)) Bool)

(assert (=> b!882309 (not (contains!4266 (+!2542 lt!399179 (tuple2!11745 lt!399182 lt!399183)) lt!399181))))

(declare-fun addStillNotContains!208 (ListLongMap!10513 (_ BitVec 64) V!28571 (_ BitVec 64)) Unit!30100)

(assert (=> b!882309 (= lt!399185 (addStillNotContains!208 lt!399179 lt!399182 lt!399183 lt!399181))))

(assert (=> b!882309 (= lt!399181 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882309 (= lt!399183 (get!13017 (select (arr!24727 lt!399131) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882309 (= lt!399182 (select (arr!24728 _keys!868) from!1053))))

(declare-fun call!38950 () ListLongMap!10513)

(assert (=> b!882309 (= lt!399179 call!38950)))

(declare-fun e!491026 () ListLongMap!10513)

(assert (=> b!882309 (= e!491026 (+!2542 call!38950 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 lt!399131) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882310 () Bool)

(declare-fun e!491031 () Bool)

(assert (=> b!882310 (= e!491031 (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)))))

(assert (=> b!882310 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882311 () Bool)

(assert (=> b!882311 (= e!491026 call!38950)))

(declare-fun b!882312 () Bool)

(declare-fun e!491027 () Bool)

(declare-fun e!491025 () Bool)

(assert (=> b!882312 (= e!491027 e!491025)))

(assert (=> b!882312 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25168 _keys!868)))))

(declare-fun lt!399184 () ListLongMap!10513)

(declare-fun res!599429 () Bool)

(assert (=> b!882312 (= res!599429 (contains!4266 lt!399184 (select (arr!24728 _keys!868) from!1053)))))

(assert (=> b!882312 (=> (not res!599429) (not e!491025))))

(declare-fun b!882313 () Bool)

(assert (=> b!882313 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25168 _keys!868)))))

(assert (=> b!882313 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25167 lt!399131)))))

(declare-fun apply!383 (ListLongMap!10513 (_ BitVec 64)) V!28571)

(assert (=> b!882313 (= e!491025 (= (apply!383 lt!399184 (select (arr!24728 _keys!868) from!1053)) (get!13017 (select (arr!24727 lt!399131) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882314 () Bool)

(declare-fun e!491028 () ListLongMap!10513)

(assert (=> b!882314 (= e!491028 (ListLongMap!10514 Nil!17551))))

(declare-fun b!882315 () Bool)

(declare-fun res!599430 () Bool)

(declare-fun e!491029 () Bool)

(assert (=> b!882315 (=> (not res!599430) (not e!491029))))

(assert (=> b!882315 (= res!599430 (not (contains!4266 lt!399184 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882316 () Bool)

(declare-fun e!491030 () Bool)

(assert (=> b!882316 (= e!491030 (= lt!399184 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882317 () Bool)

(assert (=> b!882317 (= e!491028 e!491026)))

(declare-fun c!92980 () Bool)

(assert (=> b!882317 (= c!92980 (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)))))

(declare-fun d!109101 () Bool)

(assert (=> d!109101 e!491029))

(declare-fun res!599428 () Bool)

(assert (=> d!109101 (=> (not res!599428) (not e!491029))))

(assert (=> d!109101 (= res!599428 (not (contains!4266 lt!399184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109101 (= lt!399184 e!491028)))

(declare-fun c!92979 () Bool)

(assert (=> d!109101 (= c!92979 (bvsge from!1053 (size!25168 _keys!868)))))

(assert (=> d!109101 (validMask!0 mask!1196)))

(assert (=> d!109101 (= (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399184)))

(declare-fun bm!38947 () Bool)

(assert (=> bm!38947 (= call!38950 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882318 () Bool)

(assert (=> b!882318 (= e!491029 e!491027)))

(declare-fun c!92981 () Bool)

(assert (=> b!882318 (= c!92981 e!491031)))

(declare-fun res!599427 () Bool)

(assert (=> b!882318 (=> (not res!599427) (not e!491031))))

(assert (=> b!882318 (= res!599427 (bvslt from!1053 (size!25168 _keys!868)))))

(declare-fun b!882319 () Bool)

(declare-fun isEmpty!670 (ListLongMap!10513) Bool)

(assert (=> b!882319 (= e!491030 (isEmpty!670 lt!399184))))

(declare-fun b!882320 () Bool)

(assert (=> b!882320 (= e!491027 e!491030)))

(declare-fun c!92978 () Bool)

(assert (=> b!882320 (= c!92978 (bvslt from!1053 (size!25168 _keys!868)))))

(assert (= (and d!109101 c!92979) b!882314))

(assert (= (and d!109101 (not c!92979)) b!882317))

(assert (= (and b!882317 c!92980) b!882309))

(assert (= (and b!882317 (not c!92980)) b!882311))

(assert (= (or b!882309 b!882311) bm!38947))

(assert (= (and d!109101 res!599428) b!882315))

(assert (= (and b!882315 res!599430) b!882318))

(assert (= (and b!882318 res!599427) b!882310))

(assert (= (and b!882318 c!92981) b!882312))

(assert (= (and b!882318 (not c!92981)) b!882320))

(assert (= (and b!882312 res!599429) b!882313))

(assert (= (and b!882320 c!92978) b!882316))

(assert (= (and b!882320 (not c!92978)) b!882319))

(declare-fun b_lambda!12615 () Bool)

(assert (=> (not b_lambda!12615) (not b!882309)))

(assert (=> b!882309 t!24753))

(declare-fun b_and!25473 () Bool)

(assert (= b_and!25467 (and (=> t!24753 result!9745) b_and!25473)))

(declare-fun b_lambda!12617 () Bool)

(assert (=> (not b_lambda!12617) (not b!882313)))

(assert (=> b!882313 t!24753))

(declare-fun b_and!25475 () Bool)

(assert (= b_and!25473 (and (=> t!24753 result!9745) b_and!25475)))

(declare-fun m!822271 () Bool)

(assert (=> d!109101 m!822271))

(assert (=> d!109101 m!822169))

(declare-fun m!822273 () Bool)

(assert (=> b!882313 m!822273))

(assert (=> b!882313 m!822187))

(declare-fun m!822275 () Bool)

(assert (=> b!882313 m!822275))

(assert (=> b!882313 m!822273))

(assert (=> b!882313 m!822213))

(declare-fun m!822277 () Bool)

(assert (=> b!882313 m!822277))

(assert (=> b!882313 m!822213))

(assert (=> b!882313 m!822187))

(assert (=> b!882310 m!822187))

(assert (=> b!882310 m!822187))

(assert (=> b!882310 m!822189))

(declare-fun m!822279 () Bool)

(assert (=> b!882315 m!822279))

(declare-fun m!822281 () Bool)

(assert (=> b!882309 m!822281))

(assert (=> b!882309 m!822273))

(declare-fun m!822283 () Bool)

(assert (=> b!882309 m!822283))

(assert (=> b!882309 m!822273))

(assert (=> b!882309 m!822213))

(assert (=> b!882309 m!822277))

(assert (=> b!882309 m!822213))

(assert (=> b!882309 m!822187))

(declare-fun m!822285 () Bool)

(assert (=> b!882309 m!822285))

(assert (=> b!882309 m!822281))

(declare-fun m!822287 () Bool)

(assert (=> b!882309 m!822287))

(declare-fun m!822289 () Bool)

(assert (=> b!882319 m!822289))

(assert (=> b!882312 m!822187))

(assert (=> b!882312 m!822187))

(declare-fun m!822291 () Bool)

(assert (=> b!882312 m!822291))

(declare-fun m!822293 () Bool)

(assert (=> b!882316 m!822293))

(assert (=> b!882317 m!822187))

(assert (=> b!882317 m!822187))

(assert (=> b!882317 m!822189))

(assert (=> bm!38947 m!822293))

(assert (=> b!882223 d!109101))

(declare-fun b!882321 () Bool)

(declare-fun lt!399187 () Unit!30100)

(declare-fun lt!399192 () Unit!30100)

(assert (=> b!882321 (= lt!399187 lt!399192)))

(declare-fun lt!399188 () (_ BitVec 64))

(declare-fun lt!399186 () ListLongMap!10513)

(declare-fun lt!399190 () V!28571)

(declare-fun lt!399189 () (_ BitVec 64))

(assert (=> b!882321 (not (contains!4266 (+!2542 lt!399186 (tuple2!11745 lt!399189 lt!399190)) lt!399188))))

(assert (=> b!882321 (= lt!399192 (addStillNotContains!208 lt!399186 lt!399189 lt!399190 lt!399188))))

(assert (=> b!882321 (= lt!399188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882321 (= lt!399190 (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882321 (= lt!399189 (select (arr!24728 _keys!868) from!1053))))

(declare-fun call!38951 () ListLongMap!10513)

(assert (=> b!882321 (= lt!399186 call!38951)))

(declare-fun e!491033 () ListLongMap!10513)

(assert (=> b!882321 (= e!491033 (+!2542 call!38951 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882322 () Bool)

(declare-fun e!491038 () Bool)

(assert (=> b!882322 (= e!491038 (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)))))

(assert (=> b!882322 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882323 () Bool)

(assert (=> b!882323 (= e!491033 call!38951)))

(declare-fun b!882324 () Bool)

(declare-fun e!491034 () Bool)

(declare-fun e!491032 () Bool)

(assert (=> b!882324 (= e!491034 e!491032)))

(assert (=> b!882324 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25168 _keys!868)))))

(declare-fun lt!399191 () ListLongMap!10513)

(declare-fun res!599433 () Bool)

(assert (=> b!882324 (= res!599433 (contains!4266 lt!399191 (select (arr!24728 _keys!868) from!1053)))))

(assert (=> b!882324 (=> (not res!599433) (not e!491032))))

(declare-fun b!882325 () Bool)

(assert (=> b!882325 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25168 _keys!868)))))

(assert (=> b!882325 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25167 _values!688)))))

(assert (=> b!882325 (= e!491032 (= (apply!383 lt!399191 (select (arr!24728 _keys!868) from!1053)) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882326 () Bool)

(declare-fun e!491035 () ListLongMap!10513)

(assert (=> b!882326 (= e!491035 (ListLongMap!10514 Nil!17551))))

(declare-fun b!882327 () Bool)

(declare-fun res!599434 () Bool)

(declare-fun e!491036 () Bool)

(assert (=> b!882327 (=> (not res!599434) (not e!491036))))

(assert (=> b!882327 (= res!599434 (not (contains!4266 lt!399191 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491037 () Bool)

(declare-fun b!882328 () Bool)

(assert (=> b!882328 (= e!491037 (= lt!399191 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882329 () Bool)

(assert (=> b!882329 (= e!491035 e!491033)))

(declare-fun c!92984 () Bool)

(assert (=> b!882329 (= c!92984 (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)))))

(declare-fun d!109103 () Bool)

(assert (=> d!109103 e!491036))

(declare-fun res!599432 () Bool)

(assert (=> d!109103 (=> (not res!599432) (not e!491036))))

(assert (=> d!109103 (= res!599432 (not (contains!4266 lt!399191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109103 (= lt!399191 e!491035)))

(declare-fun c!92983 () Bool)

(assert (=> d!109103 (= c!92983 (bvsge from!1053 (size!25168 _keys!868)))))

(assert (=> d!109103 (validMask!0 mask!1196)))

(assert (=> d!109103 (= (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399191)))

(declare-fun bm!38948 () Bool)

(assert (=> bm!38948 (= call!38951 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882330 () Bool)

(assert (=> b!882330 (= e!491036 e!491034)))

(declare-fun c!92985 () Bool)

(assert (=> b!882330 (= c!92985 e!491038)))

(declare-fun res!599431 () Bool)

(assert (=> b!882330 (=> (not res!599431) (not e!491038))))

(assert (=> b!882330 (= res!599431 (bvslt from!1053 (size!25168 _keys!868)))))

(declare-fun b!882331 () Bool)

(assert (=> b!882331 (= e!491037 (isEmpty!670 lt!399191))))

(declare-fun b!882332 () Bool)

(assert (=> b!882332 (= e!491034 e!491037)))

(declare-fun c!92982 () Bool)

(assert (=> b!882332 (= c!92982 (bvslt from!1053 (size!25168 _keys!868)))))

(assert (= (and d!109103 c!92983) b!882326))

(assert (= (and d!109103 (not c!92983)) b!882329))

(assert (= (and b!882329 c!92984) b!882321))

(assert (= (and b!882329 (not c!92984)) b!882323))

(assert (= (or b!882321 b!882323) bm!38948))

(assert (= (and d!109103 res!599432) b!882327))

(assert (= (and b!882327 res!599434) b!882330))

(assert (= (and b!882330 res!599431) b!882322))

(assert (= (and b!882330 c!92985) b!882324))

(assert (= (and b!882330 (not c!92985)) b!882332))

(assert (= (and b!882324 res!599433) b!882325))

(assert (= (and b!882332 c!92982) b!882328))

(assert (= (and b!882332 (not c!92982)) b!882331))

(declare-fun b_lambda!12619 () Bool)

(assert (=> (not b_lambda!12619) (not b!882321)))

(assert (=> b!882321 t!24753))

(declare-fun b_and!25477 () Bool)

(assert (= b_and!25475 (and (=> t!24753 result!9745) b_and!25477)))

(declare-fun b_lambda!12621 () Bool)

(assert (=> (not b_lambda!12621) (not b!882325)))

(assert (=> b!882325 t!24753))

(declare-fun b_and!25479 () Bool)

(assert (= b_and!25477 (and (=> t!24753 result!9745) b_and!25479)))

(declare-fun m!822295 () Bool)

(assert (=> d!109103 m!822295))

(assert (=> d!109103 m!822169))

(assert (=> b!882325 m!822211))

(assert (=> b!882325 m!822187))

(declare-fun m!822297 () Bool)

(assert (=> b!882325 m!822297))

(assert (=> b!882325 m!822211))

(assert (=> b!882325 m!822213))

(assert (=> b!882325 m!822215))

(assert (=> b!882325 m!822213))

(assert (=> b!882325 m!822187))

(assert (=> b!882322 m!822187))

(assert (=> b!882322 m!822187))

(assert (=> b!882322 m!822189))

(declare-fun m!822299 () Bool)

(assert (=> b!882327 m!822299))

(declare-fun m!822301 () Bool)

(assert (=> b!882321 m!822301))

(assert (=> b!882321 m!822211))

(declare-fun m!822303 () Bool)

(assert (=> b!882321 m!822303))

(assert (=> b!882321 m!822211))

(assert (=> b!882321 m!822213))

(assert (=> b!882321 m!822215))

(assert (=> b!882321 m!822213))

(assert (=> b!882321 m!822187))

(declare-fun m!822305 () Bool)

(assert (=> b!882321 m!822305))

(assert (=> b!882321 m!822301))

(declare-fun m!822307 () Bool)

(assert (=> b!882321 m!822307))

(declare-fun m!822309 () Bool)

(assert (=> b!882331 m!822309))

(assert (=> b!882324 m!822187))

(assert (=> b!882324 m!822187))

(declare-fun m!822311 () Bool)

(assert (=> b!882324 m!822311))

(declare-fun m!822313 () Bool)

(assert (=> b!882328 m!822313))

(assert (=> b!882329 m!822187))

(assert (=> b!882329 m!822187))

(assert (=> b!882329 m!822189))

(assert (=> bm!38948 m!822313))

(assert (=> b!882223 d!109103))

(declare-fun d!109105 () Bool)

(assert (=> d!109105 (= (array_inv!19470 _keys!868) (bvsge (size!25168 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74822 d!109105))

(declare-fun d!109107 () Bool)

(assert (=> d!109107 (= (array_inv!19471 _values!688) (bvsge (size!25167 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74822 d!109107))

(declare-fun b!882341 () Bool)

(declare-fun e!491046 () Bool)

(declare-fun call!38954 () Bool)

(assert (=> b!882341 (= e!491046 call!38954)))

(declare-fun bm!38951 () Bool)

(assert (=> bm!38951 (= call!38954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!109109 () Bool)

(declare-fun res!599440 () Bool)

(declare-fun e!491047 () Bool)

(assert (=> d!109109 (=> res!599440 e!491047)))

(assert (=> d!109109 (= res!599440 (bvsge #b00000000000000000000000000000000 (size!25168 _keys!868)))))

(assert (=> d!109109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!491047)))

(declare-fun b!882342 () Bool)

(declare-fun e!491045 () Bool)

(assert (=> b!882342 (= e!491047 e!491045)))

(declare-fun c!92988 () Bool)

(assert (=> b!882342 (= c!92988 (validKeyInArray!0 (select (arr!24728 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882343 () Bool)

(assert (=> b!882343 (= e!491045 call!38954)))

(declare-fun b!882344 () Bool)

(assert (=> b!882344 (= e!491045 e!491046)))

(declare-fun lt!399200 () (_ BitVec 64))

(assert (=> b!882344 (= lt!399200 (select (arr!24728 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399201 () Unit!30100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51414 (_ BitVec 64) (_ BitVec 32)) Unit!30100)

(assert (=> b!882344 (= lt!399201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399200 #b00000000000000000000000000000000))))

(assert (=> b!882344 (arrayContainsKey!0 _keys!868 lt!399200 #b00000000000000000000000000000000)))

(declare-fun lt!399199 () Unit!30100)

(assert (=> b!882344 (= lt!399199 lt!399201)))

(declare-fun res!599439 () Bool)

(declare-datatypes ((SeekEntryResult!8759 0))(
  ( (MissingZero!8759 (index!37407 (_ BitVec 32))) (Found!8759 (index!37408 (_ BitVec 32))) (Intermediate!8759 (undefined!9571 Bool) (index!37409 (_ BitVec 32)) (x!74784 (_ BitVec 32))) (Undefined!8759) (MissingVacant!8759 (index!37410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51414 (_ BitVec 32)) SeekEntryResult!8759)

(assert (=> b!882344 (= res!599439 (= (seekEntryOrOpen!0 (select (arr!24728 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8759 #b00000000000000000000000000000000)))))

(assert (=> b!882344 (=> (not res!599439) (not e!491046))))

(assert (= (and d!109109 (not res!599440)) b!882342))

(assert (= (and b!882342 c!92988) b!882344))

(assert (= (and b!882342 (not c!92988)) b!882343))

(assert (= (and b!882344 res!599439) b!882341))

(assert (= (or b!882341 b!882343) bm!38951))

(declare-fun m!822315 () Bool)

(assert (=> bm!38951 m!822315))

(declare-fun m!822317 () Bool)

(assert (=> b!882342 m!822317))

(assert (=> b!882342 m!822317))

(declare-fun m!822319 () Bool)

(assert (=> b!882342 m!822319))

(assert (=> b!882344 m!822317))

(declare-fun m!822321 () Bool)

(assert (=> b!882344 m!822321))

(declare-fun m!822323 () Bool)

(assert (=> b!882344 m!822323))

(assert (=> b!882344 m!822317))

(declare-fun m!822325 () Bool)

(assert (=> b!882344 m!822325))

(assert (=> b!882233 d!109109))

(declare-fun d!109111 () Bool)

(declare-fun res!599445 () Bool)

(declare-fun e!491052 () Bool)

(assert (=> d!109111 (=> res!599445 e!491052)))

(assert (=> d!109111 (= res!599445 (= (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109111 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!491052)))

(declare-fun b!882349 () Bool)

(declare-fun e!491053 () Bool)

(assert (=> b!882349 (= e!491052 e!491053)))

(declare-fun res!599446 () Bool)

(assert (=> b!882349 (=> (not res!599446) (not e!491053))))

(assert (=> b!882349 (= res!599446 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25168 _keys!868)))))

(declare-fun b!882350 () Bool)

(assert (=> b!882350 (= e!491053 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109111 (not res!599445)) b!882349))

(assert (= (and b!882349 res!599446) b!882350))

(declare-fun m!822327 () Bool)

(assert (=> d!109111 m!822327))

(declare-fun m!822329 () Bool)

(assert (=> b!882350 m!822329))

(assert (=> b!882234 d!109111))

(declare-fun d!109113 () Bool)

(assert (=> d!109113 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399204 () Unit!30100)

(declare-fun choose!114 (array!51414 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30100)

(assert (=> d!109113 (= lt!399204 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109113 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109113 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!399204)))

(declare-fun bs!24742 () Bool)

(assert (= bs!24742 d!109113))

(assert (=> bs!24742 m!822195))

(declare-fun m!822331 () Bool)

(assert (=> bs!24742 m!822331))

(assert (=> b!882234 d!109113))

(declare-fun b!882361 () Bool)

(declare-fun e!491063 () Bool)

(declare-fun contains!4267 (List!17553 (_ BitVec 64)) Bool)

(assert (=> b!882361 (= e!491063 (contains!4267 Nil!17550 (select (arr!24728 _keys!868) from!1053)))))

(declare-fun b!882362 () Bool)

(declare-fun e!491064 () Bool)

(declare-fun call!38957 () Bool)

(assert (=> b!882362 (= e!491064 call!38957)))

(declare-fun d!109115 () Bool)

(declare-fun res!599453 () Bool)

(declare-fun e!491062 () Bool)

(assert (=> d!109115 (=> res!599453 e!491062)))

(assert (=> d!109115 (= res!599453 (bvsge from!1053 (size!25168 _keys!868)))))

(assert (=> d!109115 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17550) e!491062)))

(declare-fun b!882363 () Bool)

(declare-fun e!491065 () Bool)

(assert (=> b!882363 (= e!491062 e!491065)))

(declare-fun res!599455 () Bool)

(assert (=> b!882363 (=> (not res!599455) (not e!491065))))

(assert (=> b!882363 (= res!599455 (not e!491063))))

(declare-fun res!599454 () Bool)

(assert (=> b!882363 (=> (not res!599454) (not e!491063))))

(assert (=> b!882363 (= res!599454 (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)))))

(declare-fun b!882364 () Bool)

(assert (=> b!882364 (= e!491065 e!491064)))

(declare-fun c!92991 () Bool)

(assert (=> b!882364 (= c!92991 (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)))))

(declare-fun b!882365 () Bool)

(assert (=> b!882365 (= e!491064 call!38957)))

(declare-fun bm!38954 () Bool)

(assert (=> bm!38954 (= call!38957 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92991 (Cons!17549 (select (arr!24728 _keys!868) from!1053) Nil!17550) Nil!17550)))))

(assert (= (and d!109115 (not res!599453)) b!882363))

(assert (= (and b!882363 res!599454) b!882361))

(assert (= (and b!882363 res!599455) b!882364))

(assert (= (and b!882364 c!92991) b!882365))

(assert (= (and b!882364 (not c!92991)) b!882362))

(assert (= (or b!882365 b!882362) bm!38954))

(assert (=> b!882361 m!822187))

(assert (=> b!882361 m!822187))

(declare-fun m!822333 () Bool)

(assert (=> b!882361 m!822333))

(assert (=> b!882363 m!822187))

(assert (=> b!882363 m!822187))

(assert (=> b!882363 m!822189))

(assert (=> b!882364 m!822187))

(assert (=> b!882364 m!822187))

(assert (=> b!882364 m!822189))

(assert (=> bm!38954 m!822187))

(declare-fun m!822335 () Bool)

(assert (=> bm!38954 m!822335))

(assert (=> b!882234 d!109115))

(declare-fun d!109117 () Bool)

(assert (=> d!109117 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17550)))

(declare-fun lt!399207 () Unit!30100)

(declare-fun choose!39 (array!51414 (_ BitVec 32) (_ BitVec 32)) Unit!30100)

(assert (=> d!109117 (= lt!399207 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109117 (bvslt (size!25168 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109117 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!399207)))

(declare-fun bs!24743 () Bool)

(assert (= bs!24743 d!109117))

(assert (=> bs!24743 m!822199))

(declare-fun m!822337 () Bool)

(assert (=> bs!24743 m!822337))

(assert (=> b!882234 d!109117))

(declare-fun d!109119 () Bool)

(assert (=> d!109119 (= (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053)) (and (not (= (select (arr!24728 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24728 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882225 d!109119))

(declare-fun d!109121 () Bool)

(declare-fun e!491068 () Bool)

(assert (=> d!109121 e!491068))

(declare-fun res!599461 () Bool)

(assert (=> d!109121 (=> (not res!599461) (not e!491068))))

(declare-fun lt!399217 () ListLongMap!10513)

(assert (=> d!109121 (= res!599461 (contains!4266 lt!399217 (_1!5883 (tuple2!11745 k0!854 v!557))))))

(declare-fun lt!399218 () List!17554)

(assert (=> d!109121 (= lt!399217 (ListLongMap!10514 lt!399218))))

(declare-fun lt!399219 () Unit!30100)

(declare-fun lt!399216 () Unit!30100)

(assert (=> d!109121 (= lt!399219 lt!399216)))

(declare-datatypes ((Option!431 0))(
  ( (Some!430 (v!11334 V!28571)) (None!429) )
))
(declare-fun getValueByKey!425 (List!17554 (_ BitVec 64)) Option!431)

(assert (=> d!109121 (= (getValueByKey!425 lt!399218 (_1!5883 (tuple2!11745 k0!854 v!557))) (Some!430 (_2!5883 (tuple2!11745 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!239 (List!17554 (_ BitVec 64) V!28571) Unit!30100)

(assert (=> d!109121 (= lt!399216 (lemmaContainsTupThenGetReturnValue!239 lt!399218 (_1!5883 (tuple2!11745 k0!854 v!557)) (_2!5883 (tuple2!11745 k0!854 v!557))))))

(declare-fun insertStrictlySorted!278 (List!17554 (_ BitVec 64) V!28571) List!17554)

(assert (=> d!109121 (= lt!399218 (insertStrictlySorted!278 (toList!5272 lt!399137) (_1!5883 (tuple2!11745 k0!854 v!557)) (_2!5883 (tuple2!11745 k0!854 v!557))))))

(assert (=> d!109121 (= (+!2542 lt!399137 (tuple2!11745 k0!854 v!557)) lt!399217)))

(declare-fun b!882370 () Bool)

(declare-fun res!599460 () Bool)

(assert (=> b!882370 (=> (not res!599460) (not e!491068))))

(assert (=> b!882370 (= res!599460 (= (getValueByKey!425 (toList!5272 lt!399217) (_1!5883 (tuple2!11745 k0!854 v!557))) (Some!430 (_2!5883 (tuple2!11745 k0!854 v!557)))))))

(declare-fun b!882371 () Bool)

(declare-fun contains!4268 (List!17554 tuple2!11744) Bool)

(assert (=> b!882371 (= e!491068 (contains!4268 (toList!5272 lt!399217) (tuple2!11745 k0!854 v!557)))))

(assert (= (and d!109121 res!599461) b!882370))

(assert (= (and b!882370 res!599460) b!882371))

(declare-fun m!822339 () Bool)

(assert (=> d!109121 m!822339))

(declare-fun m!822341 () Bool)

(assert (=> d!109121 m!822341))

(declare-fun m!822343 () Bool)

(assert (=> d!109121 m!822343))

(declare-fun m!822345 () Bool)

(assert (=> d!109121 m!822345))

(declare-fun m!822347 () Bool)

(assert (=> b!882370 m!822347))

(declare-fun m!822349 () Bool)

(assert (=> b!882371 m!822349))

(assert (=> b!882225 d!109121))

(declare-fun d!109123 () Bool)

(declare-fun e!491074 () Bool)

(assert (=> d!109123 e!491074))

(declare-fun res!599464 () Bool)

(assert (=> d!109123 (=> (not res!599464) (not e!491074))))

(assert (=> d!109123 (= res!599464 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25167 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25167 _values!688))))))))

(declare-fun lt!399222 () Unit!30100)

(declare-fun choose!1439 (array!51414 array!51412 (_ BitVec 32) (_ BitVec 32) V!28571 V!28571 (_ BitVec 32) (_ BitVec 64) V!28571 (_ BitVec 32) Int) Unit!30100)

(assert (=> d!109123 (= lt!399222 (choose!1439 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109123 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (=> d!109123 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399222)))

(declare-fun call!38963 () ListLongMap!10513)

(declare-fun bm!38959 () Bool)

(assert (=> bm!38959 (= call!38963 (getCurrentListMapNoExtraKeys!3233 _keys!868 (array!51413 (store (arr!24727 _values!688) i!612 (ValueCellFull!8382 v!557)) (size!25167 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882378 () Bool)

(declare-fun e!491073 () Bool)

(assert (=> b!882378 (= e!491074 e!491073)))

(declare-fun c!92994 () Bool)

(assert (=> b!882378 (= c!92994 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!882379 () Bool)

(declare-fun call!38962 () ListLongMap!10513)

(assert (=> b!882379 (= e!491073 (= call!38963 call!38962))))

(declare-fun bm!38960 () Bool)

(assert (=> bm!38960 (= call!38962 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882380 () Bool)

(assert (=> b!882380 (= e!491073 (= call!38963 (+!2542 call!38962 (tuple2!11745 k0!854 v!557))))))

(assert (= (and d!109123 res!599464) b!882378))

(assert (= (and b!882378 c!92994) b!882380))

(assert (= (and b!882378 (not c!92994)) b!882379))

(assert (= (or b!882380 b!882379) bm!38960))

(assert (= (or b!882380 b!882379) bm!38959))

(declare-fun m!822351 () Bool)

(assert (=> d!109123 m!822351))

(assert (=> bm!38959 m!822205))

(declare-fun m!822353 () Bool)

(assert (=> bm!38959 m!822353))

(assert (=> bm!38960 m!822185))

(declare-fun m!822355 () Bool)

(assert (=> b!882380 m!822355))

(assert (=> b!882225 d!109123))

(declare-fun b!882381 () Bool)

(declare-fun lt!399224 () Unit!30100)

(declare-fun lt!399229 () Unit!30100)

(assert (=> b!882381 (= lt!399224 lt!399229)))

(declare-fun lt!399225 () (_ BitVec 64))

(declare-fun lt!399223 () ListLongMap!10513)

(declare-fun lt!399227 () V!28571)

(declare-fun lt!399226 () (_ BitVec 64))

(assert (=> b!882381 (not (contains!4266 (+!2542 lt!399223 (tuple2!11745 lt!399226 lt!399227)) lt!399225))))

(assert (=> b!882381 (= lt!399229 (addStillNotContains!208 lt!399223 lt!399226 lt!399227 lt!399225))))

(assert (=> b!882381 (= lt!399225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882381 (= lt!399227 (get!13017 (select (arr!24727 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882381 (= lt!399226 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38964 () ListLongMap!10513)

(assert (=> b!882381 (= lt!399223 call!38964)))

(declare-fun e!491076 () ListLongMap!10513)

(assert (=> b!882381 (= e!491076 (+!2542 call!38964 (tuple2!11745 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13017 (select (arr!24727 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882382 () Bool)

(declare-fun e!491081 () Bool)

(assert (=> b!882382 (= e!491081 (validKeyInArray!0 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882382 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882383 () Bool)

(assert (=> b!882383 (= e!491076 call!38964)))

(declare-fun b!882384 () Bool)

(declare-fun e!491077 () Bool)

(declare-fun e!491075 () Bool)

(assert (=> b!882384 (= e!491077 e!491075)))

(assert (=> b!882384 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(declare-fun res!599467 () Bool)

(declare-fun lt!399228 () ListLongMap!10513)

(assert (=> b!882384 (= res!599467 (contains!4266 lt!399228 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882384 (=> (not res!599467) (not e!491075))))

(declare-fun b!882385 () Bool)

(assert (=> b!882385 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (=> b!882385 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25167 _values!688)))))

(assert (=> b!882385 (= e!491075 (= (apply!383 lt!399228 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13017 (select (arr!24727 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882386 () Bool)

(declare-fun e!491078 () ListLongMap!10513)

(assert (=> b!882386 (= e!491078 (ListLongMap!10514 Nil!17551))))

(declare-fun b!882387 () Bool)

(declare-fun res!599468 () Bool)

(declare-fun e!491079 () Bool)

(assert (=> b!882387 (=> (not res!599468) (not e!491079))))

(assert (=> b!882387 (= res!599468 (not (contains!4266 lt!399228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882388 () Bool)

(declare-fun e!491080 () Bool)

(assert (=> b!882388 (= e!491080 (= lt!399228 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882389 () Bool)

(assert (=> b!882389 (= e!491078 e!491076)))

(declare-fun c!92997 () Bool)

(assert (=> b!882389 (= c!92997 (validKeyInArray!0 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!109125 () Bool)

(assert (=> d!109125 e!491079))

(declare-fun res!599466 () Bool)

(assert (=> d!109125 (=> (not res!599466) (not e!491079))))

(assert (=> d!109125 (= res!599466 (not (contains!4266 lt!399228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109125 (= lt!399228 e!491078)))

(declare-fun c!92996 () Bool)

(assert (=> d!109125 (= c!92996 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (=> d!109125 (validMask!0 mask!1196)))

(assert (=> d!109125 (= (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399228)))

(declare-fun bm!38961 () Bool)

(assert (=> bm!38961 (= call!38964 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882390 () Bool)

(assert (=> b!882390 (= e!491079 e!491077)))

(declare-fun c!92998 () Bool)

(assert (=> b!882390 (= c!92998 e!491081)))

(declare-fun res!599465 () Bool)

(assert (=> b!882390 (=> (not res!599465) (not e!491081))))

(assert (=> b!882390 (= res!599465 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(declare-fun b!882391 () Bool)

(assert (=> b!882391 (= e!491080 (isEmpty!670 lt!399228))))

(declare-fun b!882392 () Bool)

(assert (=> b!882392 (= e!491077 e!491080)))

(declare-fun c!92995 () Bool)

(assert (=> b!882392 (= c!92995 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (= (and d!109125 c!92996) b!882386))

(assert (= (and d!109125 (not c!92996)) b!882389))

(assert (= (and b!882389 c!92997) b!882381))

(assert (= (and b!882389 (not c!92997)) b!882383))

(assert (= (or b!882381 b!882383) bm!38961))

(assert (= (and d!109125 res!599466) b!882387))

(assert (= (and b!882387 res!599468) b!882390))

(assert (= (and b!882390 res!599465) b!882382))

(assert (= (and b!882390 c!92998) b!882384))

(assert (= (and b!882390 (not c!92998)) b!882392))

(assert (= (and b!882384 res!599467) b!882385))

(assert (= (and b!882392 c!92995) b!882388))

(assert (= (and b!882392 (not c!92995)) b!882391))

(declare-fun b_lambda!12623 () Bool)

(assert (=> (not b_lambda!12623) (not b!882381)))

(assert (=> b!882381 t!24753))

(declare-fun b_and!25481 () Bool)

(assert (= b_and!25479 (and (=> t!24753 result!9745) b_and!25481)))

(declare-fun b_lambda!12625 () Bool)

(assert (=> (not b_lambda!12625) (not b!882385)))

(assert (=> b!882385 t!24753))

(declare-fun b_and!25483 () Bool)

(assert (= b_and!25481 (and (=> t!24753 result!9745) b_and!25483)))

(declare-fun m!822357 () Bool)

(assert (=> d!109125 m!822357))

(assert (=> d!109125 m!822169))

(declare-fun m!822359 () Bool)

(assert (=> b!882385 m!822359))

(assert (=> b!882385 m!822327))

(declare-fun m!822361 () Bool)

(assert (=> b!882385 m!822361))

(assert (=> b!882385 m!822359))

(assert (=> b!882385 m!822213))

(declare-fun m!822363 () Bool)

(assert (=> b!882385 m!822363))

(assert (=> b!882385 m!822213))

(assert (=> b!882385 m!822327))

(assert (=> b!882382 m!822327))

(assert (=> b!882382 m!822327))

(declare-fun m!822365 () Bool)

(assert (=> b!882382 m!822365))

(declare-fun m!822367 () Bool)

(assert (=> b!882387 m!822367))

(declare-fun m!822369 () Bool)

(assert (=> b!882381 m!822369))

(assert (=> b!882381 m!822359))

(declare-fun m!822371 () Bool)

(assert (=> b!882381 m!822371))

(assert (=> b!882381 m!822359))

(assert (=> b!882381 m!822213))

(assert (=> b!882381 m!822363))

(assert (=> b!882381 m!822213))

(assert (=> b!882381 m!822327))

(declare-fun m!822373 () Bool)

(assert (=> b!882381 m!822373))

(assert (=> b!882381 m!822369))

(declare-fun m!822375 () Bool)

(assert (=> b!882381 m!822375))

(declare-fun m!822377 () Bool)

(assert (=> b!882391 m!822377))

(assert (=> b!882384 m!822327))

(assert (=> b!882384 m!822327))

(declare-fun m!822379 () Bool)

(assert (=> b!882384 m!822379))

(declare-fun m!822381 () Bool)

(assert (=> b!882388 m!822381))

(assert (=> b!882389 m!822327))

(assert (=> b!882389 m!822327))

(assert (=> b!882389 m!822365))

(assert (=> bm!38961 m!822381))

(assert (=> b!882225 d!109125))

(declare-fun b!882393 () Bool)

(declare-fun lt!399231 () Unit!30100)

(declare-fun lt!399236 () Unit!30100)

(assert (=> b!882393 (= lt!399231 lt!399236)))

(declare-fun lt!399232 () (_ BitVec 64))

(declare-fun lt!399233 () (_ BitVec 64))

(declare-fun lt!399230 () ListLongMap!10513)

(declare-fun lt!399234 () V!28571)

(assert (=> b!882393 (not (contains!4266 (+!2542 lt!399230 (tuple2!11745 lt!399233 lt!399234)) lt!399232))))

(assert (=> b!882393 (= lt!399236 (addStillNotContains!208 lt!399230 lt!399233 lt!399234 lt!399232))))

(assert (=> b!882393 (= lt!399232 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882393 (= lt!399234 (get!13017 (select (arr!24727 lt!399131) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882393 (= lt!399233 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38965 () ListLongMap!10513)

(assert (=> b!882393 (= lt!399230 call!38965)))

(declare-fun e!491083 () ListLongMap!10513)

(assert (=> b!882393 (= e!491083 (+!2542 call!38965 (tuple2!11745 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13017 (select (arr!24727 lt!399131) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882394 () Bool)

(declare-fun e!491088 () Bool)

(assert (=> b!882394 (= e!491088 (validKeyInArray!0 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882394 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882395 () Bool)

(assert (=> b!882395 (= e!491083 call!38965)))

(declare-fun b!882396 () Bool)

(declare-fun e!491084 () Bool)

(declare-fun e!491082 () Bool)

(assert (=> b!882396 (= e!491084 e!491082)))

(assert (=> b!882396 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(declare-fun lt!399235 () ListLongMap!10513)

(declare-fun res!599471 () Bool)

(assert (=> b!882396 (= res!599471 (contains!4266 lt!399235 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882396 (=> (not res!599471) (not e!491082))))

(declare-fun b!882397 () Bool)

(assert (=> b!882397 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (=> b!882397 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25167 lt!399131)))))

(assert (=> b!882397 (= e!491082 (= (apply!383 lt!399235 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13017 (select (arr!24727 lt!399131) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882398 () Bool)

(declare-fun e!491085 () ListLongMap!10513)

(assert (=> b!882398 (= e!491085 (ListLongMap!10514 Nil!17551))))

(declare-fun b!882399 () Bool)

(declare-fun res!599472 () Bool)

(declare-fun e!491086 () Bool)

(assert (=> b!882399 (=> (not res!599472) (not e!491086))))

(assert (=> b!882399 (= res!599472 (not (contains!4266 lt!399235 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882400 () Bool)

(declare-fun e!491087 () Bool)

(assert (=> b!882400 (= e!491087 (= lt!399235 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882401 () Bool)

(assert (=> b!882401 (= e!491085 e!491083)))

(declare-fun c!93001 () Bool)

(assert (=> b!882401 (= c!93001 (validKeyInArray!0 (select (arr!24728 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!109127 () Bool)

(assert (=> d!109127 e!491086))

(declare-fun res!599470 () Bool)

(assert (=> d!109127 (=> (not res!599470) (not e!491086))))

(assert (=> d!109127 (= res!599470 (not (contains!4266 lt!399235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109127 (= lt!399235 e!491085)))

(declare-fun c!93000 () Bool)

(assert (=> d!109127 (= c!93000 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (=> d!109127 (validMask!0 mask!1196)))

(assert (=> d!109127 (= (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399235)))

(declare-fun bm!38962 () Bool)

(assert (=> bm!38962 (= call!38965 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!399131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882402 () Bool)

(assert (=> b!882402 (= e!491086 e!491084)))

(declare-fun c!93002 () Bool)

(assert (=> b!882402 (= c!93002 e!491088)))

(declare-fun res!599469 () Bool)

(assert (=> b!882402 (=> (not res!599469) (not e!491088))))

(assert (=> b!882402 (= res!599469 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(declare-fun b!882403 () Bool)

(assert (=> b!882403 (= e!491087 (isEmpty!670 lt!399235))))

(declare-fun b!882404 () Bool)

(assert (=> b!882404 (= e!491084 e!491087)))

(declare-fun c!92999 () Bool)

(assert (=> b!882404 (= c!92999 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25168 _keys!868)))))

(assert (= (and d!109127 c!93000) b!882398))

(assert (= (and d!109127 (not c!93000)) b!882401))

(assert (= (and b!882401 c!93001) b!882393))

(assert (= (and b!882401 (not c!93001)) b!882395))

(assert (= (or b!882393 b!882395) bm!38962))

(assert (= (and d!109127 res!599470) b!882399))

(assert (= (and b!882399 res!599472) b!882402))

(assert (= (and b!882402 res!599469) b!882394))

(assert (= (and b!882402 c!93002) b!882396))

(assert (= (and b!882402 (not c!93002)) b!882404))

(assert (= (and b!882396 res!599471) b!882397))

(assert (= (and b!882404 c!92999) b!882400))

(assert (= (and b!882404 (not c!92999)) b!882403))

(declare-fun b_lambda!12627 () Bool)

(assert (=> (not b_lambda!12627) (not b!882393)))

(assert (=> b!882393 t!24753))

(declare-fun b_and!25485 () Bool)

(assert (= b_and!25483 (and (=> t!24753 result!9745) b_and!25485)))

(declare-fun b_lambda!12629 () Bool)

(assert (=> (not b_lambda!12629) (not b!882397)))

(assert (=> b!882397 t!24753))

(declare-fun b_and!25487 () Bool)

(assert (= b_and!25485 (and (=> t!24753 result!9745) b_and!25487)))

(declare-fun m!822383 () Bool)

(assert (=> d!109127 m!822383))

(assert (=> d!109127 m!822169))

(declare-fun m!822385 () Bool)

(assert (=> b!882397 m!822385))

(assert (=> b!882397 m!822327))

(declare-fun m!822387 () Bool)

(assert (=> b!882397 m!822387))

(assert (=> b!882397 m!822385))

(assert (=> b!882397 m!822213))

(declare-fun m!822389 () Bool)

(assert (=> b!882397 m!822389))

(assert (=> b!882397 m!822213))

(assert (=> b!882397 m!822327))

(assert (=> b!882394 m!822327))

(assert (=> b!882394 m!822327))

(assert (=> b!882394 m!822365))

(declare-fun m!822391 () Bool)

(assert (=> b!882399 m!822391))

(declare-fun m!822393 () Bool)

(assert (=> b!882393 m!822393))

(assert (=> b!882393 m!822385))

(declare-fun m!822395 () Bool)

(assert (=> b!882393 m!822395))

(assert (=> b!882393 m!822385))

(assert (=> b!882393 m!822213))

(assert (=> b!882393 m!822389))

(assert (=> b!882393 m!822213))

(assert (=> b!882393 m!822327))

(declare-fun m!822397 () Bool)

(assert (=> b!882393 m!822397))

(assert (=> b!882393 m!822393))

(declare-fun m!822399 () Bool)

(assert (=> b!882393 m!822399))

(declare-fun m!822401 () Bool)

(assert (=> b!882403 m!822401))

(assert (=> b!882396 m!822327))

(assert (=> b!882396 m!822327))

(declare-fun m!822403 () Bool)

(assert (=> b!882396 m!822403))

(declare-fun m!822405 () Bool)

(assert (=> b!882400 m!822405))

(assert (=> b!882401 m!822327))

(assert (=> b!882401 m!822327))

(assert (=> b!882401 m!822365))

(assert (=> bm!38962 m!822405))

(assert (=> b!882225 d!109127))

(declare-fun d!109129 () Bool)

(declare-fun e!491089 () Bool)

(assert (=> d!109129 e!491089))

(declare-fun res!599474 () Bool)

(assert (=> d!109129 (=> (not res!599474) (not e!491089))))

(declare-fun lt!399238 () ListLongMap!10513)

(assert (=> d!109129 (= res!599474 (contains!4266 lt!399238 (_1!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!399239 () List!17554)

(assert (=> d!109129 (= lt!399238 (ListLongMap!10514 lt!399239))))

(declare-fun lt!399240 () Unit!30100)

(declare-fun lt!399237 () Unit!30100)

(assert (=> d!109129 (= lt!399240 lt!399237)))

(assert (=> d!109129 (= (getValueByKey!425 lt!399239 (_1!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!430 (_2!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109129 (= lt!399237 (lemmaContainsTupThenGetReturnValue!239 lt!399239 (_1!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109129 (= lt!399239 (insertStrictlySorted!278 (toList!5272 lt!399135) (_1!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109129 (= (+!2542 lt!399135 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!399238)))

(declare-fun b!882405 () Bool)

(declare-fun res!599473 () Bool)

(assert (=> b!882405 (=> (not res!599473) (not e!491089))))

(assert (=> b!882405 (= res!599473 (= (getValueByKey!425 (toList!5272 lt!399238) (_1!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!430 (_2!5883 (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!882406 () Bool)

(assert (=> b!882406 (= e!491089 (contains!4268 (toList!5272 lt!399238) (tuple2!11745 (select (arr!24728 _keys!868) from!1053) (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109129 res!599474) b!882405))

(assert (= (and b!882405 res!599473) b!882406))

(declare-fun m!822407 () Bool)

(assert (=> d!109129 m!822407))

(declare-fun m!822409 () Bool)

(assert (=> d!109129 m!822409))

(declare-fun m!822411 () Bool)

(assert (=> d!109129 m!822411))

(declare-fun m!822413 () Bool)

(assert (=> d!109129 m!822413))

(declare-fun m!822415 () Bool)

(assert (=> b!882405 m!822415))

(declare-fun m!822417 () Bool)

(assert (=> b!882406 m!822417))

(assert (=> b!882230 d!109129))

(declare-fun d!109131 () Bool)

(declare-fun c!93005 () Bool)

(assert (=> d!109131 (= c!93005 ((_ is ValueCellFull!8382) (select (arr!24727 _values!688) from!1053)))))

(declare-fun e!491092 () V!28571)

(assert (=> d!109131 (= (get!13017 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!491092)))

(declare-fun b!882411 () Bool)

(declare-fun get!13018 (ValueCell!8382 V!28571) V!28571)

(assert (=> b!882411 (= e!491092 (get!13018 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882412 () Bool)

(declare-fun get!13019 (ValueCell!8382 V!28571) V!28571)

(assert (=> b!882412 (= e!491092 (get!13019 (select (arr!24727 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109131 c!93005) b!882411))

(assert (= (and d!109131 (not c!93005)) b!882412))

(assert (=> b!882411 m!822211))

(assert (=> b!882411 m!822213))

(declare-fun m!822419 () Bool)

(assert (=> b!882411 m!822419))

(assert (=> b!882412 m!822211))

(assert (=> b!882412 m!822213))

(declare-fun m!822421 () Bool)

(assert (=> b!882412 m!822421))

(assert (=> b!882230 d!109131))

(declare-fun d!109133 () Bool)

(declare-fun res!599479 () Bool)

(declare-fun e!491097 () Bool)

(assert (=> d!109133 (=> res!599479 e!491097)))

(assert (=> d!109133 (= res!599479 ((_ is Nil!17550) Nil!17550))))

(assert (=> d!109133 (= (noDuplicate!1319 Nil!17550) e!491097)))

(declare-fun b!882417 () Bool)

(declare-fun e!491098 () Bool)

(assert (=> b!882417 (= e!491097 e!491098)))

(declare-fun res!599480 () Bool)

(assert (=> b!882417 (=> (not res!599480) (not e!491098))))

(assert (=> b!882417 (= res!599480 (not (contains!4267 (t!24754 Nil!17550) (h!18680 Nil!17550))))))

(declare-fun b!882418 () Bool)

(assert (=> b!882418 (= e!491098 (noDuplicate!1319 (t!24754 Nil!17550)))))

(assert (= (and d!109133 (not res!599479)) b!882417))

(assert (= (and b!882417 res!599480) b!882418))

(declare-fun m!822423 () Bool)

(assert (=> b!882417 m!822423))

(declare-fun m!822425 () Bool)

(assert (=> b!882418 m!822425))

(assert (=> b!882221 d!109133))

(declare-fun b!882419 () Bool)

(declare-fun e!491100 () Bool)

(assert (=> b!882419 (= e!491100 (contains!4267 Nil!17550 (select (arr!24728 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882420 () Bool)

(declare-fun e!491101 () Bool)

(declare-fun call!38966 () Bool)

(assert (=> b!882420 (= e!491101 call!38966)))

(declare-fun d!109135 () Bool)

(declare-fun res!599481 () Bool)

(declare-fun e!491099 () Bool)

(assert (=> d!109135 (=> res!599481 e!491099)))

(assert (=> d!109135 (= res!599481 (bvsge #b00000000000000000000000000000000 (size!25168 _keys!868)))))

(assert (=> d!109135 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17550) e!491099)))

(declare-fun b!882421 () Bool)

(declare-fun e!491102 () Bool)

(assert (=> b!882421 (= e!491099 e!491102)))

(declare-fun res!599483 () Bool)

(assert (=> b!882421 (=> (not res!599483) (not e!491102))))

(assert (=> b!882421 (= res!599483 (not e!491100))))

(declare-fun res!599482 () Bool)

(assert (=> b!882421 (=> (not res!599482) (not e!491100))))

(assert (=> b!882421 (= res!599482 (validKeyInArray!0 (select (arr!24728 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882422 () Bool)

(assert (=> b!882422 (= e!491102 e!491101)))

(declare-fun c!93006 () Bool)

(assert (=> b!882422 (= c!93006 (validKeyInArray!0 (select (arr!24728 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882423 () Bool)

(assert (=> b!882423 (= e!491101 call!38966)))

(declare-fun bm!38963 () Bool)

(assert (=> bm!38963 (= call!38966 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93006 (Cons!17549 (select (arr!24728 _keys!868) #b00000000000000000000000000000000) Nil!17550) Nil!17550)))))

(assert (= (and d!109135 (not res!599481)) b!882421))

(assert (= (and b!882421 res!599482) b!882419))

(assert (= (and b!882421 res!599483) b!882422))

(assert (= (and b!882422 c!93006) b!882423))

(assert (= (and b!882422 (not c!93006)) b!882420))

(assert (= (or b!882423 b!882420) bm!38963))

(assert (=> b!882419 m!822317))

(assert (=> b!882419 m!822317))

(declare-fun m!822427 () Bool)

(assert (=> b!882419 m!822427))

(assert (=> b!882421 m!822317))

(assert (=> b!882421 m!822317))

(assert (=> b!882421 m!822319))

(assert (=> b!882422 m!822317))

(assert (=> b!882422 m!822317))

(assert (=> b!882422 m!822319))

(assert (=> bm!38963 m!822317))

(declare-fun m!822429 () Bool)

(assert (=> bm!38963 m!822429))

(assert (=> b!882235 d!109135))

(declare-fun d!109137 () Bool)

(assert (=> d!109137 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882226 d!109137))

(declare-fun mapNonEmpty!28101 () Bool)

(declare-fun mapRes!28101 () Bool)

(declare-fun tp!53903 () Bool)

(declare-fun e!491108 () Bool)

(assert (=> mapNonEmpty!28101 (= mapRes!28101 (and tp!53903 e!491108))))

(declare-fun mapRest!28101 () (Array (_ BitVec 32) ValueCell!8382))

(declare-fun mapValue!28101 () ValueCell!8382)

(declare-fun mapKey!28101 () (_ BitVec 32))

(assert (=> mapNonEmpty!28101 (= mapRest!28095 (store mapRest!28101 mapKey!28101 mapValue!28101))))

(declare-fun mapIsEmpty!28101 () Bool)

(assert (=> mapIsEmpty!28101 mapRes!28101))

(declare-fun b!882431 () Bool)

(declare-fun e!491107 () Bool)

(assert (=> b!882431 (= e!491107 tp_is_empty!17643)))

(declare-fun b!882430 () Bool)

(assert (=> b!882430 (= e!491108 tp_is_empty!17643)))

(declare-fun condMapEmpty!28101 () Bool)

(declare-fun mapDefault!28101 () ValueCell!8382)

(assert (=> mapNonEmpty!28095 (= condMapEmpty!28101 (= mapRest!28095 ((as const (Array (_ BitVec 32) ValueCell!8382)) mapDefault!28101)))))

(assert (=> mapNonEmpty!28095 (= tp!53893 (and e!491107 mapRes!28101))))

(assert (= (and mapNonEmpty!28095 condMapEmpty!28101) mapIsEmpty!28101))

(assert (= (and mapNonEmpty!28095 (not condMapEmpty!28101)) mapNonEmpty!28101))

(assert (= (and mapNonEmpty!28101 ((_ is ValueCellFull!8382) mapValue!28101)) b!882430))

(assert (= (and mapNonEmpty!28095 ((_ is ValueCellFull!8382) mapDefault!28101)) b!882431))

(declare-fun m!822431 () Bool)

(assert (=> mapNonEmpty!28101 m!822431))

(declare-fun b_lambda!12631 () Bool)

(assert (= b_lambda!12617 (or (and start!74822 b_free!15399) b_lambda!12631)))

(declare-fun b_lambda!12633 () Bool)

(assert (= b_lambda!12627 (or (and start!74822 b_free!15399) b_lambda!12633)))

(declare-fun b_lambda!12635 () Bool)

(assert (= b_lambda!12619 (or (and start!74822 b_free!15399) b_lambda!12635)))

(declare-fun b_lambda!12637 () Bool)

(assert (= b_lambda!12629 (or (and start!74822 b_free!15399) b_lambda!12637)))

(declare-fun b_lambda!12639 () Bool)

(assert (= b_lambda!12623 (or (and start!74822 b_free!15399) b_lambda!12639)))

(declare-fun b_lambda!12641 () Bool)

(assert (= b_lambda!12621 (or (and start!74822 b_free!15399) b_lambda!12641)))

(declare-fun b_lambda!12643 () Bool)

(assert (= b_lambda!12625 (or (and start!74822 b_free!15399) b_lambda!12643)))

(declare-fun b_lambda!12645 () Bool)

(assert (= b_lambda!12615 (or (and start!74822 b_free!15399) b_lambda!12645)))

(check-sat (not b!882328) (not d!109129) (not b!882316) (not b!882403) (not b!882315) (not b!882380) (not b!882385) (not b_lambda!12635) (not b_lambda!12631) (not b_next!15399) (not b_lambda!12645) (not b_lambda!12633) (not b!882319) (not b!882394) (not b!882321) (not b!882406) (not bm!38959) (not b!882342) (not b!882384) (not b!882350) (not b!882361) (not b!882422) (not d!109113) (not b!882421) (not b!882397) (not b!882393) (not bm!38962) (not b!882391) (not b!882344) (not b!882322) (not b!882389) (not b!882312) (not b!882363) (not b!882327) (not bm!38948) (not b!882387) (not bm!38961) (not b!882310) (not b!882405) (not b!882412) (not b_lambda!12637) (not b!882411) (not bm!38951) (not mapNonEmpty!28101) (not b!882309) (not bm!38960) (not b!882417) (not b!882317) (not b_lambda!12613) (not b!882396) (not b!882419) (not b_lambda!12643) (not b!882313) (not d!109117) (not b!882364) (not b!882371) (not b!882324) (not bm!38954) (not b!882381) (not d!109103) (not b!882382) (not d!109101) (not bm!38947) (not b!882400) (not b_lambda!12639) (not d!109125) (not b!882388) (not d!109121) (not b_lambda!12641) (not d!109127) b_and!25487 (not b!882329) (not b!882331) (not d!109123) tp_is_empty!17643 (not b!882418) (not bm!38963) (not b!882370) (not b!882399) (not b!882401) (not b!882325))
(check-sat b_and!25487 (not b_next!15399))
