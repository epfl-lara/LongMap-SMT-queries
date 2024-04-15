; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73060 () Bool)

(assert start!73060)

(declare-fun b_free!13993 () Bool)

(declare-fun b_next!13993 () Bool)

(assert (=> start!73060 (= b_free!13993 (not b_next!13993))))

(declare-fun tp!49483 () Bool)

(declare-fun b_and!23119 () Bool)

(assert (=> start!73060 (= tp!49483 b_and!23119)))

(declare-fun b!849751 () Bool)

(declare-fun res!577312 () Bool)

(declare-fun e!474033 () Bool)

(assert (=> b!849751 (=> (not res!577312) (not e!474033))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849751 (= res!577312 (validMask!0 mask!1196))))

(declare-fun b!849752 () Bool)

(declare-fun e!474034 () Bool)

(declare-fun e!474030 () Bool)

(declare-fun mapRes!25793 () Bool)

(assert (=> b!849752 (= e!474034 (and e!474030 mapRes!25793))))

(declare-fun condMapEmpty!25793 () Bool)

(declare-datatypes ((V!26553 0))(
  ( (V!26554 (val!8112 Int)) )
))
(declare-datatypes ((ValueCell!7625 0))(
  ( (ValueCellFull!7625 (v!10531 V!26553)) (EmptyCell!7625) )
))
(declare-datatypes ((array!48453 0))(
  ( (array!48454 (arr!23258 (Array (_ BitVec 32) ValueCell!7625)) (size!23700 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48453)

(declare-fun mapDefault!25793 () ValueCell!7625)

(assert (=> b!849752 (= condMapEmpty!25793 (= (arr!23258 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7625)) mapDefault!25793)))))

(declare-fun b!849753 () Bool)

(declare-fun e!474035 () Bool)

(assert (=> b!849753 (= e!474035 true)))

(declare-datatypes ((tuple2!10648 0))(
  ( (tuple2!10649 (_1!5335 (_ BitVec 64)) (_2!5335 V!26553)) )
))
(declare-datatypes ((List!16492 0))(
  ( (Nil!16489) (Cons!16488 (h!17619 tuple2!10648) (t!22922 List!16492)) )
))
(declare-datatypes ((ListLongMap!9407 0))(
  ( (ListLongMap!9408 (toList!4719 List!16492)) )
))
(declare-fun lt!382301 () ListLongMap!9407)

(declare-fun lt!382300 () tuple2!10648)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!382307 () V!26553)

(declare-fun +!2145 (ListLongMap!9407 tuple2!10648) ListLongMap!9407)

(assert (=> b!849753 (= (+!2145 lt!382301 lt!382300) (+!2145 (+!2145 lt!382301 (tuple2!10649 k0!854 lt!382307)) lt!382300))))

(declare-fun lt!382302 () V!26553)

(assert (=> b!849753 (= lt!382300 (tuple2!10649 k0!854 lt!382302))))

(declare-datatypes ((Unit!28961 0))(
  ( (Unit!28962) )
))
(declare-fun lt!382299 () Unit!28961)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!259 (ListLongMap!9407 (_ BitVec 64) V!26553 V!26553) Unit!28961)

(assert (=> b!849753 (= lt!382299 (addSameAsAddTwiceSameKeyDiffValues!259 lt!382301 k0!854 lt!382307 lt!382302))))

(declare-fun lt!382304 () V!26553)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12254 (ValueCell!7625 V!26553) V!26553)

(assert (=> b!849753 (= lt!382307 (get!12254 (select (arr!23258 _values!688) from!1053) lt!382304))))

(declare-fun lt!382306 () ListLongMap!9407)

(declare-datatypes ((array!48455 0))(
  ( (array!48456 (arr!23259 (Array (_ BitVec 32) (_ BitVec 64))) (size!23701 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48455)

(assert (=> b!849753 (= lt!382306 (+!2145 lt!382301 (tuple2!10649 (select (arr!23259 _keys!868) from!1053) lt!382302)))))

(declare-fun v!557 () V!26553)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849753 (= lt!382302 (get!12254 (select (store (arr!23258 _values!688) i!612 (ValueCellFull!7625 v!557)) from!1053) lt!382304))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1009 (Int (_ BitVec 64)) V!26553)

(assert (=> b!849753 (= lt!382304 (dynLambda!1009 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26553)

(declare-fun zeroValue!654 () V!26553)

(declare-fun lt!382305 () array!48453)

(declare-fun getCurrentListMapNoExtraKeys!2728 (array!48455 array!48453 (_ BitVec 32) (_ BitVec 32) V!26553 V!26553 (_ BitVec 32) Int) ListLongMap!9407)

(assert (=> b!849753 (= lt!382301 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!382305 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37808 () ListLongMap!9407)

(declare-fun call!37809 () ListLongMap!9407)

(declare-fun e!474029 () Bool)

(declare-fun b!849754 () Bool)

(assert (=> b!849754 (= e!474029 (= call!37808 (+!2145 call!37809 (tuple2!10649 k0!854 v!557))))))

(declare-fun b!849755 () Bool)

(declare-fun e!474032 () Bool)

(declare-fun tp_is_empty!16129 () Bool)

(assert (=> b!849755 (= e!474032 tp_is_empty!16129)))

(declare-fun b!849757 () Bool)

(declare-fun res!577308 () Bool)

(assert (=> b!849757 (=> (not res!577308) (not e!474033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48455 (_ BitVec 32)) Bool)

(assert (=> b!849757 (= res!577308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849758 () Bool)

(declare-fun res!577315 () Bool)

(assert (=> b!849758 (=> (not res!577315) (not e!474033))))

(declare-datatypes ((List!16493 0))(
  ( (Nil!16490) (Cons!16489 (h!17620 (_ BitVec 64)) (t!22923 List!16493)) )
))
(declare-fun arrayNoDuplicates!0 (array!48455 (_ BitVec 32) List!16493) Bool)

(assert (=> b!849758 (= res!577315 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16490))))

(declare-fun mapNonEmpty!25793 () Bool)

(declare-fun tp!49484 () Bool)

(assert (=> mapNonEmpty!25793 (= mapRes!25793 (and tp!49484 e!474032))))

(declare-fun mapRest!25793 () (Array (_ BitVec 32) ValueCell!7625))

(declare-fun mapValue!25793 () ValueCell!7625)

(declare-fun mapKey!25793 () (_ BitVec 32))

(assert (=> mapNonEmpty!25793 (= (arr!23258 _values!688) (store mapRest!25793 mapKey!25793 mapValue!25793))))

(declare-fun b!849759 () Bool)

(declare-fun e!474031 () Bool)

(assert (=> b!849759 (= e!474033 e!474031)))

(declare-fun res!577316 () Bool)

(assert (=> b!849759 (=> (not res!577316) (not e!474031))))

(assert (=> b!849759 (= res!577316 (= from!1053 i!612))))

(assert (=> b!849759 (= lt!382306 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!382305 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849759 (= lt!382305 (array!48454 (store (arr!23258 _values!688) i!612 (ValueCellFull!7625 v!557)) (size!23700 _values!688)))))

(declare-fun lt!382303 () ListLongMap!9407)

(assert (=> b!849759 (= lt!382303 (getCurrentListMapNoExtraKeys!2728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25793 () Bool)

(assert (=> mapIsEmpty!25793 mapRes!25793))

(declare-fun b!849760 () Bool)

(assert (=> b!849760 (= e!474030 tp_is_empty!16129)))

(declare-fun b!849761 () Bool)

(declare-fun res!577314 () Bool)

(assert (=> b!849761 (=> (not res!577314) (not e!474033))))

(assert (=> b!849761 (= res!577314 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23701 _keys!868))))))

(declare-fun b!849762 () Bool)

(declare-fun res!577309 () Bool)

(assert (=> b!849762 (=> (not res!577309) (not e!474033))))

(assert (=> b!849762 (= res!577309 (and (= (select (arr!23259 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37805 () Bool)

(assert (=> bm!37805 (= call!37808 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!382305 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37806 () Bool)

(assert (=> bm!37806 (= call!37809 (getCurrentListMapNoExtraKeys!2728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849763 () Bool)

(assert (=> b!849763 (= e!474029 (= call!37808 call!37809))))

(declare-fun b!849764 () Bool)

(declare-fun res!577317 () Bool)

(assert (=> b!849764 (=> (not res!577317) (not e!474033))))

(assert (=> b!849764 (= res!577317 (and (= (size!23700 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23701 _keys!868) (size!23700 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849765 () Bool)

(assert (=> b!849765 (= e!474031 (not e!474035))))

(declare-fun res!577313 () Bool)

(assert (=> b!849765 (=> res!577313 e!474035)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849765 (= res!577313 (not (validKeyInArray!0 (select (arr!23259 _keys!868) from!1053))))))

(assert (=> b!849765 e!474029))

(declare-fun c!91595 () Bool)

(assert (=> b!849765 (= c!91595 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382298 () Unit!28961)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!355 (array!48455 array!48453 (_ BitVec 32) (_ BitVec 32) V!26553 V!26553 (_ BitVec 32) (_ BitVec 64) V!26553 (_ BitVec 32) Int) Unit!28961)

(assert (=> b!849765 (= lt!382298 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!355 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849756 () Bool)

(declare-fun res!577310 () Bool)

(assert (=> b!849756 (=> (not res!577310) (not e!474033))))

(assert (=> b!849756 (= res!577310 (validKeyInArray!0 k0!854))))

(declare-fun res!577311 () Bool)

(assert (=> start!73060 (=> (not res!577311) (not e!474033))))

(assert (=> start!73060 (= res!577311 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23701 _keys!868))))))

(assert (=> start!73060 e!474033))

(assert (=> start!73060 tp_is_empty!16129))

(assert (=> start!73060 true))

(assert (=> start!73060 tp!49483))

(declare-fun array_inv!18542 (array!48455) Bool)

(assert (=> start!73060 (array_inv!18542 _keys!868)))

(declare-fun array_inv!18543 (array!48453) Bool)

(assert (=> start!73060 (and (array_inv!18543 _values!688) e!474034)))

(assert (= (and start!73060 res!577311) b!849751))

(assert (= (and b!849751 res!577312) b!849764))

(assert (= (and b!849764 res!577317) b!849757))

(assert (= (and b!849757 res!577308) b!849758))

(assert (= (and b!849758 res!577315) b!849761))

(assert (= (and b!849761 res!577314) b!849756))

(assert (= (and b!849756 res!577310) b!849762))

(assert (= (and b!849762 res!577309) b!849759))

(assert (= (and b!849759 res!577316) b!849765))

(assert (= (and b!849765 c!91595) b!849754))

(assert (= (and b!849765 (not c!91595)) b!849763))

(assert (= (or b!849754 b!849763) bm!37805))

(assert (= (or b!849754 b!849763) bm!37806))

(assert (= (and b!849765 (not res!577313)) b!849753))

(assert (= (and b!849752 condMapEmpty!25793) mapIsEmpty!25793))

(assert (= (and b!849752 (not condMapEmpty!25793)) mapNonEmpty!25793))

(get-info :version)

(assert (= (and mapNonEmpty!25793 ((_ is ValueCellFull!7625) mapValue!25793)) b!849755))

(assert (= (and b!849752 ((_ is ValueCellFull!7625) mapDefault!25793)) b!849760))

(assert (= start!73060 b!849752))

(declare-fun b_lambda!11507 () Bool)

(assert (=> (not b_lambda!11507) (not b!849753)))

(declare-fun t!22921 () Bool)

(declare-fun tb!4287 () Bool)

(assert (=> (and start!73060 (= defaultEntry!696 defaultEntry!696) t!22921) tb!4287))

(declare-fun result!8193 () Bool)

(assert (=> tb!4287 (= result!8193 tp_is_empty!16129)))

(assert (=> b!849753 t!22921))

(declare-fun b_and!23121 () Bool)

(assert (= b_and!23119 (and (=> t!22921 result!8193) b_and!23121)))

(declare-fun m!789929 () Bool)

(assert (=> b!849762 m!789929))

(declare-fun m!789931 () Bool)

(assert (=> b!849754 m!789931))

(declare-fun m!789933 () Bool)

(assert (=> b!849753 m!789933))

(declare-fun m!789935 () Bool)

(assert (=> b!849753 m!789935))

(declare-fun m!789937 () Bool)

(assert (=> b!849753 m!789937))

(declare-fun m!789939 () Bool)

(assert (=> b!849753 m!789939))

(declare-fun m!789941 () Bool)

(assert (=> b!849753 m!789941))

(declare-fun m!789943 () Bool)

(assert (=> b!849753 m!789943))

(declare-fun m!789945 () Bool)

(assert (=> b!849753 m!789945))

(declare-fun m!789947 () Bool)

(assert (=> b!849753 m!789947))

(assert (=> b!849753 m!789933))

(declare-fun m!789949 () Bool)

(assert (=> b!849753 m!789949))

(declare-fun m!789951 () Bool)

(assert (=> b!849753 m!789951))

(declare-fun m!789953 () Bool)

(assert (=> b!849753 m!789953))

(declare-fun m!789955 () Bool)

(assert (=> b!849753 m!789955))

(assert (=> b!849753 m!789951))

(assert (=> b!849753 m!789941))

(declare-fun m!789957 () Bool)

(assert (=> b!849753 m!789957))

(assert (=> b!849765 m!789945))

(assert (=> b!849765 m!789945))

(declare-fun m!789959 () Bool)

(assert (=> b!849765 m!789959))

(declare-fun m!789961 () Bool)

(assert (=> b!849765 m!789961))

(declare-fun m!789963 () Bool)

(assert (=> mapNonEmpty!25793 m!789963))

(assert (=> bm!37805 m!789943))

(declare-fun m!789965 () Bool)

(assert (=> bm!37806 m!789965))

(declare-fun m!789967 () Bool)

(assert (=> b!849759 m!789967))

(assert (=> b!849759 m!789939))

(declare-fun m!789969 () Bool)

(assert (=> b!849759 m!789969))

(declare-fun m!789971 () Bool)

(assert (=> start!73060 m!789971))

(declare-fun m!789973 () Bool)

(assert (=> start!73060 m!789973))

(declare-fun m!789975 () Bool)

(assert (=> b!849758 m!789975))

(declare-fun m!789977 () Bool)

(assert (=> b!849751 m!789977))

(declare-fun m!789979 () Bool)

(assert (=> b!849757 m!789979))

(declare-fun m!789981 () Bool)

(assert (=> b!849756 m!789981))

(check-sat (not b!849751) (not b!849756) (not b!849754) (not b!849757) (not mapNonEmpty!25793) tp_is_empty!16129 (not b!849758) (not bm!37806) b_and!23121 (not b!849753) (not start!73060) (not b_lambda!11507) (not b!849759) (not b_next!13993) (not bm!37805) (not b!849765))
(check-sat b_and!23121 (not b_next!13993))
