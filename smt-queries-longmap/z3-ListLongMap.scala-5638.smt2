; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73594 () Bool)

(assert start!73594)

(declare-fun b_free!14527 () Bool)

(declare-fun b_next!14527 () Bool)

(assert (=> start!73594 (= b_free!14527 (not b_next!14527))))

(declare-fun tp!51086 () Bool)

(declare-fun b_and!24007 () Bool)

(assert (=> start!73594 (= tp!51086 b_and!24007)))

(declare-fun b!861229 () Bool)

(declare-fun e!479839 () Bool)

(declare-fun tp_is_empty!16663 () Bool)

(assert (=> b!861229 (= e!479839 tp_is_empty!16663)))

(declare-fun b!861230 () Bool)

(declare-fun res!585331 () Bool)

(declare-fun e!479840 () Bool)

(assert (=> b!861230 (=> (not res!585331) (not e!479840))))

(declare-datatypes ((array!49483 0))(
  ( (array!49484 (arr!23773 (Array (_ BitVec 32) (_ BitVec 64))) (size!24215 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49483)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49483 (_ BitVec 32)) Bool)

(assert (=> b!861230 (= res!585331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861231 () Bool)

(declare-fun res!585330 () Bool)

(assert (=> b!861231 (=> (not res!585330) (not e!479840))))

(declare-datatypes ((List!16887 0))(
  ( (Nil!16884) (Cons!16883 (h!18014 (_ BitVec 64)) (t!23671 List!16887)) )
))
(declare-fun arrayNoDuplicates!0 (array!49483 (_ BitVec 32) List!16887) Bool)

(assert (=> b!861231 (= res!585330 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16884))))

(declare-fun b!861232 () Bool)

(declare-fun e!479835 () Bool)

(declare-fun e!479837 () Bool)

(assert (=> b!861232 (= e!479835 (not e!479837))))

(declare-fun res!585333 () Bool)

(assert (=> b!861232 (=> res!585333 e!479837)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861232 (= res!585333 (not (validKeyInArray!0 (select (arr!23773 _keys!868) from!1053))))))

(declare-datatypes ((V!27265 0))(
  ( (V!27266 (val!8379 Int)) )
))
(declare-datatypes ((tuple2!11088 0))(
  ( (tuple2!11089 (_1!5555 (_ BitVec 64)) (_2!5555 V!27265)) )
))
(declare-datatypes ((List!16888 0))(
  ( (Nil!16885) (Cons!16884 (h!18015 tuple2!11088) (t!23672 List!16888)) )
))
(declare-datatypes ((ListLongMap!9847 0))(
  ( (ListLongMap!9848 (toList!4939 List!16888)) )
))
(declare-fun lt!388278 () ListLongMap!9847)

(declare-fun lt!388286 () ListLongMap!9847)

(assert (=> b!861232 (= lt!388278 lt!388286)))

(declare-fun lt!388277 () ListLongMap!9847)

(declare-fun v!557 () V!27265)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2309 (ListLongMap!9847 tuple2!11088) ListLongMap!9847)

(assert (=> b!861232 (= lt!388286 (+!2309 lt!388277 (tuple2!11089 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7892 0))(
  ( (ValueCellFull!7892 (v!10798 V!27265)) (EmptyCell!7892) )
))
(declare-datatypes ((array!49485 0))(
  ( (array!49486 (arr!23774 (Array (_ BitVec 32) ValueCell!7892)) (size!24216 (_ BitVec 32))) )
))
(declare-fun lt!388283 () array!49485)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27265)

(declare-fun zeroValue!654 () V!27265)

(declare-fun getCurrentListMapNoExtraKeys!2942 (array!49483 array!49485 (_ BitVec 32) (_ BitVec 32) V!27265 V!27265 (_ BitVec 32) Int) ListLongMap!9847)

(assert (=> b!861232 (= lt!388278 (getCurrentListMapNoExtraKeys!2942 _keys!868 lt!388283 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49485)

(assert (=> b!861232 (= lt!388277 (getCurrentListMapNoExtraKeys!2942 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29311 0))(
  ( (Unit!29312) )
))
(declare-fun lt!388279 () Unit!29311)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!499 (array!49483 array!49485 (_ BitVec 32) (_ BitVec 32) V!27265 V!27265 (_ BitVec 32) (_ BitVec 64) V!27265 (_ BitVec 32) Int) Unit!29311)

(assert (=> b!861232 (= lt!388279 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!499 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861233 () Bool)

(assert (=> b!861233 (= e!479837 true)))

(assert (=> b!861233 (not (= (select (arr!23773 _keys!868) from!1053) k0!854))))

(declare-fun lt!388282 () Unit!29311)

(declare-fun e!479838 () Unit!29311)

(assert (=> b!861233 (= lt!388282 e!479838)))

(declare-fun c!91946 () Bool)

(assert (=> b!861233 (= c!91946 (= (select (arr!23773 _keys!868) from!1053) k0!854))))

(declare-fun lt!388280 () ListLongMap!9847)

(declare-fun get!12542 (ValueCell!7892 V!27265) V!27265)

(declare-fun dynLambda!1119 (Int (_ BitVec 64)) V!27265)

(assert (=> b!861233 (= lt!388280 (+!2309 lt!388286 (tuple2!11089 (select (arr!23773 _keys!868) from!1053) (get!12542 (select (arr!23774 _values!688) from!1053) (dynLambda!1119 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861235 () Bool)

(declare-fun e!479834 () Bool)

(assert (=> b!861235 (= e!479834 tp_is_empty!16663)))

(declare-fun b!861236 () Bool)

(declare-fun res!585335 () Bool)

(assert (=> b!861236 (=> (not res!585335) (not e!479840))))

(assert (=> b!861236 (= res!585335 (and (= (size!24216 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24215 _keys!868) (size!24216 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861237 () Bool)

(declare-fun e!479836 () Bool)

(declare-fun mapRes!26594 () Bool)

(assert (=> b!861237 (= e!479836 (and e!479839 mapRes!26594))))

(declare-fun condMapEmpty!26594 () Bool)

(declare-fun mapDefault!26594 () ValueCell!7892)

(assert (=> b!861237 (= condMapEmpty!26594 (= (arr!23774 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7892)) mapDefault!26594)))))

(declare-fun mapNonEmpty!26594 () Bool)

(declare-fun tp!51085 () Bool)

(assert (=> mapNonEmpty!26594 (= mapRes!26594 (and tp!51085 e!479834))))

(declare-fun mapValue!26594 () ValueCell!7892)

(declare-fun mapKey!26594 () (_ BitVec 32))

(declare-fun mapRest!26594 () (Array (_ BitVec 32) ValueCell!7892))

(assert (=> mapNonEmpty!26594 (= (arr!23774 _values!688) (store mapRest!26594 mapKey!26594 mapValue!26594))))

(declare-fun b!861238 () Bool)

(declare-fun res!585336 () Bool)

(assert (=> b!861238 (=> (not res!585336) (not e!479840))))

(assert (=> b!861238 (= res!585336 (validKeyInArray!0 k0!854))))

(declare-fun b!861239 () Bool)

(declare-fun res!585332 () Bool)

(assert (=> b!861239 (=> (not res!585332) (not e!479840))))

(assert (=> b!861239 (= res!585332 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24215 _keys!868))))))

(declare-fun b!861240 () Bool)

(declare-fun Unit!29313 () Unit!29311)

(assert (=> b!861240 (= e!479838 Unit!29313)))

(declare-fun b!861241 () Bool)

(assert (=> b!861241 (= e!479840 e!479835)))

(declare-fun res!585327 () Bool)

(assert (=> b!861241 (=> (not res!585327) (not e!479835))))

(assert (=> b!861241 (= res!585327 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861241 (= lt!388280 (getCurrentListMapNoExtraKeys!2942 _keys!868 lt!388283 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861241 (= lt!388283 (array!49486 (store (arr!23774 _values!688) i!612 (ValueCellFull!7892 v!557)) (size!24216 _values!688)))))

(declare-fun lt!388276 () ListLongMap!9847)

(assert (=> b!861241 (= lt!388276 (getCurrentListMapNoExtraKeys!2942 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861242 () Bool)

(declare-fun res!585328 () Bool)

(assert (=> b!861242 (=> (not res!585328) (not e!479840))))

(assert (=> b!861242 (= res!585328 (and (= (select (arr!23773 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26594 () Bool)

(assert (=> mapIsEmpty!26594 mapRes!26594))

(declare-fun b!861243 () Bool)

(declare-fun res!585334 () Bool)

(assert (=> b!861243 (=> (not res!585334) (not e!479840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861243 (= res!585334 (validMask!0 mask!1196))))

(declare-fun b!861234 () Bool)

(declare-fun Unit!29314 () Unit!29311)

(assert (=> b!861234 (= e!479838 Unit!29314)))

(declare-fun lt!388285 () Unit!29311)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49483 (_ BitVec 32) (_ BitVec 32)) Unit!29311)

(assert (=> b!861234 (= lt!388285 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861234 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16884)))

(declare-fun lt!388281 () Unit!29311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29311)

(assert (=> b!861234 (= lt!388281 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861234 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388284 () Unit!29311)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49483 (_ BitVec 64) (_ BitVec 32) List!16887) Unit!29311)

(assert (=> b!861234 (= lt!388284 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16884))))

(assert (=> b!861234 false))

(declare-fun res!585329 () Bool)

(assert (=> start!73594 (=> (not res!585329) (not e!479840))))

(assert (=> start!73594 (= res!585329 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24215 _keys!868))))))

(assert (=> start!73594 e!479840))

(assert (=> start!73594 tp_is_empty!16663))

(assert (=> start!73594 true))

(assert (=> start!73594 tp!51086))

(declare-fun array_inv!18886 (array!49483) Bool)

(assert (=> start!73594 (array_inv!18886 _keys!868)))

(declare-fun array_inv!18887 (array!49485) Bool)

(assert (=> start!73594 (and (array_inv!18887 _values!688) e!479836)))

(assert (= (and start!73594 res!585329) b!861243))

(assert (= (and b!861243 res!585334) b!861236))

(assert (= (and b!861236 res!585335) b!861230))

(assert (= (and b!861230 res!585331) b!861231))

(assert (= (and b!861231 res!585330) b!861239))

(assert (= (and b!861239 res!585332) b!861238))

(assert (= (and b!861238 res!585336) b!861242))

(assert (= (and b!861242 res!585328) b!861241))

(assert (= (and b!861241 res!585327) b!861232))

(assert (= (and b!861232 (not res!585333)) b!861233))

(assert (= (and b!861233 c!91946) b!861234))

(assert (= (and b!861233 (not c!91946)) b!861240))

(assert (= (and b!861237 condMapEmpty!26594) mapIsEmpty!26594))

(assert (= (and b!861237 (not condMapEmpty!26594)) mapNonEmpty!26594))

(get-info :version)

(assert (= (and mapNonEmpty!26594 ((_ is ValueCellFull!7892) mapValue!26594)) b!861235))

(assert (= (and b!861237 ((_ is ValueCellFull!7892) mapDefault!26594)) b!861229))

(assert (= start!73594 b!861237))

(declare-fun b_lambda!11861 () Bool)

(assert (=> (not b_lambda!11861) (not b!861233)))

(declare-fun t!23670 () Bool)

(declare-fun tb!4641 () Bool)

(assert (=> (and start!73594 (= defaultEntry!696 defaultEntry!696) t!23670) tb!4641))

(declare-fun result!8901 () Bool)

(assert (=> tb!4641 (= result!8901 tp_is_empty!16663)))

(assert (=> b!861233 t!23670))

(declare-fun b_and!24009 () Bool)

(assert (= b_and!24007 (and (=> t!23670 result!8901) b_and!24009)))

(declare-fun m!801615 () Bool)

(assert (=> b!861241 m!801615))

(declare-fun m!801617 () Bool)

(assert (=> b!861241 m!801617))

(declare-fun m!801619 () Bool)

(assert (=> b!861241 m!801619))

(declare-fun m!801621 () Bool)

(assert (=> b!861234 m!801621))

(declare-fun m!801623 () Bool)

(assert (=> b!861234 m!801623))

(declare-fun m!801625 () Bool)

(assert (=> b!861234 m!801625))

(declare-fun m!801627 () Bool)

(assert (=> b!861234 m!801627))

(declare-fun m!801629 () Bool)

(assert (=> b!861234 m!801629))

(declare-fun m!801631 () Bool)

(assert (=> b!861238 m!801631))

(declare-fun m!801633 () Bool)

(assert (=> b!861243 m!801633))

(declare-fun m!801635 () Bool)

(assert (=> b!861232 m!801635))

(declare-fun m!801637 () Bool)

(assert (=> b!861232 m!801637))

(declare-fun m!801639 () Bool)

(assert (=> b!861232 m!801639))

(declare-fun m!801641 () Bool)

(assert (=> b!861232 m!801641))

(assert (=> b!861232 m!801639))

(declare-fun m!801643 () Bool)

(assert (=> b!861232 m!801643))

(declare-fun m!801645 () Bool)

(assert (=> b!861232 m!801645))

(declare-fun m!801647 () Bool)

(assert (=> b!861230 m!801647))

(declare-fun m!801649 () Bool)

(assert (=> b!861231 m!801649))

(declare-fun m!801651 () Bool)

(assert (=> start!73594 m!801651))

(declare-fun m!801653 () Bool)

(assert (=> start!73594 m!801653))

(declare-fun m!801655 () Bool)

(assert (=> b!861233 m!801655))

(declare-fun m!801657 () Bool)

(assert (=> b!861233 m!801657))

(declare-fun m!801659 () Bool)

(assert (=> b!861233 m!801659))

(declare-fun m!801661 () Bool)

(assert (=> b!861233 m!801661))

(assert (=> b!861233 m!801657))

(assert (=> b!861233 m!801639))

(assert (=> b!861233 m!801659))

(declare-fun m!801663 () Bool)

(assert (=> mapNonEmpty!26594 m!801663))

(declare-fun m!801665 () Bool)

(assert (=> b!861242 m!801665))

(check-sat (not b!861231) (not b!861238) (not mapNonEmpty!26594) tp_is_empty!16663 (not start!73594) (not b_next!14527) (not b!861243) (not b_lambda!11861) (not b!861232) b_and!24009 (not b!861230) (not b!861234) (not b!861233) (not b!861241))
(check-sat b_and!24009 (not b_next!14527))
