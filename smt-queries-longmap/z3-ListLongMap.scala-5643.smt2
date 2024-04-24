; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73810 () Bool)

(assert start!73810)

(declare-fun b_free!14557 () Bool)

(declare-fun b_next!14557 () Bool)

(assert (=> start!73810 (= b_free!14557 (not b_next!14557))))

(declare-fun tp!51175 () Bool)

(declare-fun b_and!24103 () Bool)

(assert (=> start!73810 (= tp!51175 b_and!24103)))

(declare-fun mapNonEmpty!26639 () Bool)

(declare-fun mapRes!26639 () Bool)

(declare-fun tp!51176 () Bool)

(declare-fun e!480928 () Bool)

(assert (=> mapNonEmpty!26639 (= mapRes!26639 (and tp!51176 e!480928))))

(declare-datatypes ((V!27305 0))(
  ( (V!27306 (val!8394 Int)) )
))
(declare-datatypes ((ValueCell!7907 0))(
  ( (ValueCellFull!7907 (v!10819 V!27305)) (EmptyCell!7907) )
))
(declare-fun mapRest!26639 () (Array (_ BitVec 32) ValueCell!7907))

(declare-fun mapKey!26639 () (_ BitVec 32))

(declare-fun mapValue!26639 () ValueCell!7907)

(declare-datatypes ((array!49607 0))(
  ( (array!49608 (arr!23830 (Array (_ BitVec 32) ValueCell!7907)) (size!24271 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49607)

(assert (=> mapNonEmpty!26639 (= (arr!23830 _values!688) (store mapRest!26639 mapKey!26639 mapValue!26639))))

(declare-fun b!863078 () Bool)

(declare-fun res!586237 () Bool)

(declare-fun e!480931 () Bool)

(assert (=> b!863078 (=> (not res!586237) (not e!480931))))

(declare-datatypes ((array!49609 0))(
  ( (array!49610 (arr!23831 (Array (_ BitVec 32) (_ BitVec 64))) (size!24272 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49609)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49609 (_ BitVec 32)) Bool)

(assert (=> b!863078 (= res!586237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863079 () Bool)

(declare-fun e!480934 () Bool)

(declare-fun e!480926 () Bool)

(assert (=> b!863079 (= e!480934 (and e!480926 mapRes!26639))))

(declare-fun condMapEmpty!26639 () Bool)

(declare-fun mapDefault!26639 () ValueCell!7907)

(assert (=> b!863079 (= condMapEmpty!26639 (= (arr!23830 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7907)) mapDefault!26639)))))

(declare-fun b!863080 () Bool)

(declare-fun e!480929 () Bool)

(assert (=> b!863080 (= e!480931 e!480929)))

(declare-fun res!586242 () Bool)

(assert (=> b!863080 (=> (not res!586242) (not e!480929))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863080 (= res!586242 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11028 0))(
  ( (tuple2!11029 (_1!5525 (_ BitVec 64)) (_2!5525 V!27305)) )
))
(declare-datatypes ((List!16864 0))(
  ( (Nil!16861) (Cons!16860 (h!17997 tuple2!11028) (t!23679 List!16864)) )
))
(declare-datatypes ((ListLongMap!9799 0))(
  ( (ListLongMap!9800 (toList!4915 List!16864)) )
))
(declare-fun lt!389387 () ListLongMap!9799)

(declare-fun lt!389381 () array!49607)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27305)

(declare-fun zeroValue!654 () V!27305)

(declare-fun getCurrentListMapNoExtraKeys!2966 (array!49609 array!49607 (_ BitVec 32) (_ BitVec 32) V!27305 V!27305 (_ BitVec 32) Int) ListLongMap!9799)

(assert (=> b!863080 (= lt!389387 (getCurrentListMapNoExtraKeys!2966 _keys!868 lt!389381 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27305)

(assert (=> b!863080 (= lt!389381 (array!49608 (store (arr!23830 _values!688) i!612 (ValueCellFull!7907 v!557)) (size!24271 _values!688)))))

(declare-fun lt!389389 () ListLongMap!9799)

(assert (=> b!863080 (= lt!389389 (getCurrentListMapNoExtraKeys!2966 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!586233 () Bool)

(assert (=> start!73810 (=> (not res!586233) (not e!480931))))

(assert (=> start!73810 (= res!586233 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24272 _keys!868))))))

(assert (=> start!73810 e!480931))

(declare-fun tp_is_empty!16693 () Bool)

(assert (=> start!73810 tp_is_empty!16693))

(assert (=> start!73810 true))

(assert (=> start!73810 tp!51175))

(declare-fun array_inv!18906 (array!49609) Bool)

(assert (=> start!73810 (array_inv!18906 _keys!868)))

(declare-fun array_inv!18907 (array!49607) Bool)

(assert (=> start!73810 (and (array_inv!18907 _values!688) e!480934)))

(declare-fun b!863081 () Bool)

(assert (=> b!863081 (= e!480926 tp_is_empty!16693)))

(declare-fun b!863082 () Bool)

(declare-fun e!480933 () Bool)

(assert (=> b!863082 (= e!480933 true)))

(declare-fun lt!389383 () ListLongMap!9799)

(declare-fun lt!389386 () tuple2!11028)

(declare-fun lt!389392 () tuple2!11028)

(declare-fun lt!389393 () ListLongMap!9799)

(declare-fun +!2319 (ListLongMap!9799 tuple2!11028) ListLongMap!9799)

(assert (=> b!863082 (= lt!389383 (+!2319 (+!2319 lt!389393 lt!389392) lt!389386))))

(declare-fun lt!389380 () V!27305)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29433 0))(
  ( (Unit!29434) )
))
(declare-fun lt!389385 () Unit!29433)

(declare-fun addCommutativeForDiffKeys!474 (ListLongMap!9799 (_ BitVec 64) V!27305 (_ BitVec 64) V!27305) Unit!29433)

(assert (=> b!863082 (= lt!389385 (addCommutativeForDiffKeys!474 lt!389393 k0!854 v!557 (select (arr!23831 _keys!868) from!1053) lt!389380))))

(declare-fun b!863083 () Bool)

(declare-fun res!586236 () Bool)

(assert (=> b!863083 (=> (not res!586236) (not e!480931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863083 (= res!586236 (validMask!0 mask!1196))))

(declare-fun b!863084 () Bool)

(declare-fun res!586235 () Bool)

(assert (=> b!863084 (=> (not res!586235) (not e!480931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863084 (= res!586235 (validKeyInArray!0 k0!854))))

(declare-fun b!863085 () Bool)

(declare-fun res!586239 () Bool)

(assert (=> b!863085 (=> (not res!586239) (not e!480931))))

(assert (=> b!863085 (= res!586239 (and (= (select (arr!23831 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26639 () Bool)

(assert (=> mapIsEmpty!26639 mapRes!26639))

(declare-fun b!863086 () Bool)

(declare-fun res!586240 () Bool)

(assert (=> b!863086 (=> (not res!586240) (not e!480931))))

(declare-datatypes ((List!16865 0))(
  ( (Nil!16862) (Cons!16861 (h!17998 (_ BitVec 64)) (t!23680 List!16865)) )
))
(declare-fun arrayNoDuplicates!0 (array!49609 (_ BitVec 32) List!16865) Bool)

(assert (=> b!863086 (= res!586240 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16862))))

(declare-fun b!863087 () Bool)

(declare-fun res!586238 () Bool)

(assert (=> b!863087 (=> (not res!586238) (not e!480931))))

(assert (=> b!863087 (= res!586238 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24272 _keys!868))))))

(declare-fun b!863088 () Bool)

(declare-fun res!586243 () Bool)

(assert (=> b!863088 (=> (not res!586243) (not e!480931))))

(assert (=> b!863088 (= res!586243 (and (= (size!24271 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24272 _keys!868) (size!24271 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863089 () Bool)

(declare-fun e!480930 () Bool)

(assert (=> b!863089 (= e!480930 e!480933)))

(declare-fun res!586234 () Bool)

(assert (=> b!863089 (=> res!586234 e!480933)))

(assert (=> b!863089 (= res!586234 (= k0!854 (select (arr!23831 _keys!868) from!1053)))))

(assert (=> b!863089 (not (= (select (arr!23831 _keys!868) from!1053) k0!854))))

(declare-fun lt!389388 () Unit!29433)

(declare-fun e!480932 () Unit!29433)

(assert (=> b!863089 (= lt!389388 e!480932)))

(declare-fun c!92338 () Bool)

(assert (=> b!863089 (= c!92338 (= (select (arr!23831 _keys!868) from!1053) k0!854))))

(assert (=> b!863089 (= lt!389387 lt!389383)))

(declare-fun lt!389390 () ListLongMap!9799)

(assert (=> b!863089 (= lt!389383 (+!2319 lt!389390 lt!389392))))

(assert (=> b!863089 (= lt!389392 (tuple2!11029 (select (arr!23831 _keys!868) from!1053) lt!389380))))

(declare-fun get!12583 (ValueCell!7907 V!27305) V!27305)

(declare-fun dynLambda!1147 (Int (_ BitVec 64)) V!27305)

(assert (=> b!863089 (= lt!389380 (get!12583 (select (arr!23830 _values!688) from!1053) (dynLambda!1147 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863090 () Bool)

(declare-fun Unit!29435 () Unit!29433)

(assert (=> b!863090 (= e!480932 Unit!29435)))

(declare-fun lt!389384 () Unit!29433)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49609 (_ BitVec 32) (_ BitVec 32)) Unit!29433)

(assert (=> b!863090 (= lt!389384 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863090 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16862)))

(declare-fun lt!389391 () Unit!29433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49609 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29433)

(assert (=> b!863090 (= lt!389391 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863090 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389378 () Unit!29433)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49609 (_ BitVec 64) (_ BitVec 32) List!16865) Unit!29433)

(assert (=> b!863090 (= lt!389378 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16862))))

(assert (=> b!863090 false))

(declare-fun b!863091 () Bool)

(declare-fun Unit!29436 () Unit!29433)

(assert (=> b!863091 (= e!480932 Unit!29436)))

(declare-fun b!863092 () Bool)

(assert (=> b!863092 (= e!480929 (not e!480930))))

(declare-fun res!586241 () Bool)

(assert (=> b!863092 (=> res!586241 e!480930)))

(assert (=> b!863092 (= res!586241 (not (validKeyInArray!0 (select (arr!23831 _keys!868) from!1053))))))

(declare-fun lt!389382 () ListLongMap!9799)

(assert (=> b!863092 (= lt!389382 lt!389390)))

(assert (=> b!863092 (= lt!389390 (+!2319 lt!389393 lt!389386))))

(assert (=> b!863092 (= lt!389382 (getCurrentListMapNoExtraKeys!2966 _keys!868 lt!389381 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863092 (= lt!389386 (tuple2!11029 k0!854 v!557))))

(assert (=> b!863092 (= lt!389393 (getCurrentListMapNoExtraKeys!2966 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389379 () Unit!29433)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!506 (array!49609 array!49607 (_ BitVec 32) (_ BitVec 32) V!27305 V!27305 (_ BitVec 32) (_ BitVec 64) V!27305 (_ BitVec 32) Int) Unit!29433)

(assert (=> b!863092 (= lt!389379 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!506 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863093 () Bool)

(assert (=> b!863093 (= e!480928 tp_is_empty!16693)))

(assert (= (and start!73810 res!586233) b!863083))

(assert (= (and b!863083 res!586236) b!863088))

(assert (= (and b!863088 res!586243) b!863078))

(assert (= (and b!863078 res!586237) b!863086))

(assert (= (and b!863086 res!586240) b!863087))

(assert (= (and b!863087 res!586238) b!863084))

(assert (= (and b!863084 res!586235) b!863085))

(assert (= (and b!863085 res!586239) b!863080))

(assert (= (and b!863080 res!586242) b!863092))

(assert (= (and b!863092 (not res!586241)) b!863089))

(assert (= (and b!863089 c!92338) b!863090))

(assert (= (and b!863089 (not c!92338)) b!863091))

(assert (= (and b!863089 (not res!586234)) b!863082))

(assert (= (and b!863079 condMapEmpty!26639) mapIsEmpty!26639))

(assert (= (and b!863079 (not condMapEmpty!26639)) mapNonEmpty!26639))

(get-info :version)

(assert (= (and mapNonEmpty!26639 ((_ is ValueCellFull!7907) mapValue!26639)) b!863093))

(assert (= (and b!863079 ((_ is ValueCellFull!7907) mapDefault!26639)) b!863081))

(assert (= start!73810 b!863079))

(declare-fun b_lambda!11923 () Bool)

(assert (=> (not b_lambda!11923) (not b!863089)))

(declare-fun t!23678 () Bool)

(declare-fun tb!4671 () Bool)

(assert (=> (and start!73810 (= defaultEntry!696 defaultEntry!696) t!23678) tb!4671))

(declare-fun result!8961 () Bool)

(assert (=> tb!4671 (= result!8961 tp_is_empty!16693)))

(assert (=> b!863089 t!23678))

(declare-fun b_and!24105 () Bool)

(assert (= b_and!24103 (and (=> t!23678 result!8961) b_and!24105)))

(declare-fun m!804443 () Bool)

(assert (=> b!863082 m!804443))

(assert (=> b!863082 m!804443))

(declare-fun m!804445 () Bool)

(assert (=> b!863082 m!804445))

(declare-fun m!804447 () Bool)

(assert (=> b!863082 m!804447))

(assert (=> b!863082 m!804447))

(declare-fun m!804449 () Bool)

(assert (=> b!863082 m!804449))

(declare-fun m!804451 () Bool)

(assert (=> b!863085 m!804451))

(declare-fun m!804453 () Bool)

(assert (=> b!863083 m!804453))

(declare-fun m!804455 () Bool)

(assert (=> b!863090 m!804455))

(declare-fun m!804457 () Bool)

(assert (=> b!863090 m!804457))

(declare-fun m!804459 () Bool)

(assert (=> b!863090 m!804459))

(declare-fun m!804461 () Bool)

(assert (=> b!863090 m!804461))

(declare-fun m!804463 () Bool)

(assert (=> b!863090 m!804463))

(declare-fun m!804465 () Bool)

(assert (=> b!863080 m!804465))

(declare-fun m!804467 () Bool)

(assert (=> b!863080 m!804467))

(declare-fun m!804469 () Bool)

(assert (=> b!863080 m!804469))

(declare-fun m!804471 () Bool)

(assert (=> b!863086 m!804471))

(declare-fun m!804473 () Bool)

(assert (=> b!863078 m!804473))

(declare-fun m!804475 () Bool)

(assert (=> b!863092 m!804475))

(assert (=> b!863092 m!804447))

(declare-fun m!804477 () Bool)

(assert (=> b!863092 m!804477))

(assert (=> b!863092 m!804447))

(declare-fun m!804479 () Bool)

(assert (=> b!863092 m!804479))

(declare-fun m!804481 () Bool)

(assert (=> b!863092 m!804481))

(declare-fun m!804483 () Bool)

(assert (=> b!863092 m!804483))

(declare-fun m!804485 () Bool)

(assert (=> b!863084 m!804485))

(declare-fun m!804487 () Bool)

(assert (=> start!73810 m!804487))

(declare-fun m!804489 () Bool)

(assert (=> start!73810 m!804489))

(declare-fun m!804491 () Bool)

(assert (=> b!863089 m!804491))

(declare-fun m!804493 () Bool)

(assert (=> b!863089 m!804493))

(declare-fun m!804495 () Bool)

(assert (=> b!863089 m!804495))

(declare-fun m!804497 () Bool)

(assert (=> b!863089 m!804497))

(assert (=> b!863089 m!804493))

(assert (=> b!863089 m!804447))

(assert (=> b!863089 m!804495))

(declare-fun m!804499 () Bool)

(assert (=> mapNonEmpty!26639 m!804499))

(check-sat (not b!863080) tp_is_empty!16693 (not mapNonEmpty!26639) (not b_next!14557) (not b!863078) (not b!863083) (not start!73810) (not b!863082) (not b!863092) b_and!24105 (not b_lambda!11923) (not b!863086) (not b!863090) (not b!863084) (not b!863089))
(check-sat b_and!24105 (not b_next!14557))
