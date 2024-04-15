; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73066 () Bool)

(assert start!73066)

(declare-fun b_free!13999 () Bool)

(declare-fun b_next!13999 () Bool)

(assert (=> start!73066 (= b_free!13999 (not b_next!13999))))

(declare-fun tp!49501 () Bool)

(declare-fun b_and!23131 () Bool)

(assert (=> start!73066 (= tp!49501 b_and!23131)))

(declare-fun b!849893 () Bool)

(declare-fun res!577403 () Bool)

(declare-fun e!474104 () Bool)

(assert (=> b!849893 (=> (not res!577403) (not e!474104))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849893 (= res!577403 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25802 () Bool)

(declare-fun mapRes!25802 () Bool)

(assert (=> mapIsEmpty!25802 mapRes!25802))

(declare-fun b!849894 () Bool)

(declare-fun e!474108 () Bool)

(assert (=> b!849894 (= e!474104 e!474108)))

(declare-fun res!577401 () Bool)

(assert (=> b!849894 (=> (not res!577401) (not e!474108))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849894 (= res!577401 (= from!1053 i!612))))

(declare-datatypes ((V!26561 0))(
  ( (V!26562 (val!8115 Int)) )
))
(declare-datatypes ((tuple2!10654 0))(
  ( (tuple2!10655 (_1!5338 (_ BitVec 64)) (_2!5338 V!26561)) )
))
(declare-datatypes ((List!16496 0))(
  ( (Nil!16493) (Cons!16492 (h!17623 tuple2!10654) (t!22932 List!16496)) )
))
(declare-datatypes ((ListLongMap!9413 0))(
  ( (ListLongMap!9414 (toList!4722 List!16496)) )
))
(declare-fun lt!382397 () ListLongMap!9413)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26561)

(declare-fun zeroValue!654 () V!26561)

(declare-datatypes ((array!48465 0))(
  ( (array!48466 (arr!23264 (Array (_ BitVec 32) (_ BitVec 64))) (size!23706 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48465)

(declare-datatypes ((ValueCell!7628 0))(
  ( (ValueCellFull!7628 (v!10534 V!26561)) (EmptyCell!7628) )
))
(declare-datatypes ((array!48467 0))(
  ( (array!48468 (arr!23265 (Array (_ BitVec 32) ValueCell!7628)) (size!23707 (_ BitVec 32))) )
))
(declare-fun lt!382388 () array!48467)

(declare-fun getCurrentListMapNoExtraKeys!2730 (array!48465 array!48467 (_ BitVec 32) (_ BitVec 32) V!26561 V!26561 (_ BitVec 32) Int) ListLongMap!9413)

(assert (=> b!849894 (= lt!382397 (getCurrentListMapNoExtraKeys!2730 _keys!868 lt!382388 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26561)

(declare-fun _values!688 () array!48467)

(assert (=> b!849894 (= lt!382388 (array!48468 (store (arr!23265 _values!688) i!612 (ValueCellFull!7628 v!557)) (size!23707 _values!688)))))

(declare-fun lt!382390 () ListLongMap!9413)

(assert (=> b!849894 (= lt!382390 (getCurrentListMapNoExtraKeys!2730 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849895 () Bool)

(declare-fun e!474101 () Bool)

(assert (=> b!849895 (= e!474108 (not e!474101))))

(declare-fun res!577407 () Bool)

(assert (=> b!849895 (=> res!577407 e!474101)))

(assert (=> b!849895 (= res!577407 (not (validKeyInArray!0 (select (arr!23264 _keys!868) from!1053))))))

(declare-fun e!474103 () Bool)

(assert (=> b!849895 e!474103))

(declare-fun c!91604 () Bool)

(assert (=> b!849895 (= c!91604 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28965 0))(
  ( (Unit!28966) )
))
(declare-fun lt!382394 () Unit!28965)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!357 (array!48465 array!48467 (_ BitVec 32) (_ BitVec 32) V!26561 V!26561 (_ BitVec 32) (_ BitVec 64) V!26561 (_ BitVec 32) Int) Unit!28965)

(assert (=> b!849895 (= lt!382394 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!357 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849896 () Bool)

(declare-fun e!474107 () Bool)

(declare-fun tp_is_empty!16135 () Bool)

(assert (=> b!849896 (= e!474107 tp_is_empty!16135)))

(declare-fun call!37827 () ListLongMap!9413)

(declare-fun call!37826 () ListLongMap!9413)

(declare-fun b!849897 () Bool)

(declare-fun +!2147 (ListLongMap!9413 tuple2!10654) ListLongMap!9413)

(assert (=> b!849897 (= e!474103 (= call!37826 (+!2147 call!37827 (tuple2!10655 k0!854 v!557))))))

(declare-fun b!849898 () Bool)

(declare-fun res!577405 () Bool)

(assert (=> b!849898 (=> (not res!577405) (not e!474104))))

(declare-datatypes ((List!16497 0))(
  ( (Nil!16494) (Cons!16493 (h!17624 (_ BitVec 64)) (t!22933 List!16497)) )
))
(declare-fun arrayNoDuplicates!0 (array!48465 (_ BitVec 32) List!16497) Bool)

(assert (=> b!849898 (= res!577405 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16494))))

(declare-fun b!849899 () Bool)

(declare-fun e!474102 () Bool)

(assert (=> b!849899 (= e!474102 tp_is_empty!16135)))

(declare-fun mapNonEmpty!25802 () Bool)

(declare-fun tp!49502 () Bool)

(assert (=> mapNonEmpty!25802 (= mapRes!25802 (and tp!49502 e!474102))))

(declare-fun mapKey!25802 () (_ BitVec 32))

(declare-fun mapValue!25802 () ValueCell!7628)

(declare-fun mapRest!25802 () (Array (_ BitVec 32) ValueCell!7628))

(assert (=> mapNonEmpty!25802 (= (arr!23265 _values!688) (store mapRest!25802 mapKey!25802 mapValue!25802))))

(declare-fun bm!37823 () Bool)

(assert (=> bm!37823 (= call!37826 (getCurrentListMapNoExtraKeys!2730 _keys!868 lt!382388 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849900 () Bool)

(declare-fun res!577400 () Bool)

(assert (=> b!849900 (=> (not res!577400) (not e!474104))))

(assert (=> b!849900 (= res!577400 (and (= (select (arr!23264 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849901 () Bool)

(declare-fun res!577404 () Bool)

(assert (=> b!849901 (=> (not res!577404) (not e!474104))))

(assert (=> b!849901 (= res!577404 (and (= (size!23707 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23706 _keys!868) (size!23707 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849902 () Bool)

(assert (=> b!849902 (= e!474103 (= call!37826 call!37827))))

(declare-fun res!577398 () Bool)

(assert (=> start!73066 (=> (not res!577398) (not e!474104))))

(assert (=> start!73066 (= res!577398 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23706 _keys!868))))))

(assert (=> start!73066 e!474104))

(assert (=> start!73066 tp_is_empty!16135))

(assert (=> start!73066 true))

(assert (=> start!73066 tp!49501))

(declare-fun array_inv!18546 (array!48465) Bool)

(assert (=> start!73066 (array_inv!18546 _keys!868)))

(declare-fun e!474106 () Bool)

(declare-fun array_inv!18547 (array!48467) Bool)

(assert (=> start!73066 (and (array_inv!18547 _values!688) e!474106)))

(declare-fun b!849892 () Bool)

(declare-fun res!577399 () Bool)

(assert (=> b!849892 (=> (not res!577399) (not e!474104))))

(assert (=> b!849892 (= res!577399 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23706 _keys!868))))))

(declare-fun b!849903 () Bool)

(assert (=> b!849903 (= e!474106 (and e!474107 mapRes!25802))))

(declare-fun condMapEmpty!25802 () Bool)

(declare-fun mapDefault!25802 () ValueCell!7628)

(assert (=> b!849903 (= condMapEmpty!25802 (= (arr!23265 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7628)) mapDefault!25802)))))

(declare-fun b!849904 () Bool)

(declare-fun res!577406 () Bool)

(assert (=> b!849904 (=> (not res!577406) (not e!474104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48465 (_ BitVec 32)) Bool)

(assert (=> b!849904 (= res!577406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37824 () Bool)

(assert (=> bm!37824 (= call!37827 (getCurrentListMapNoExtraKeys!2730 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849905 () Bool)

(assert (=> b!849905 (= e!474101 true)))

(declare-fun lt!382392 () tuple2!10654)

(declare-fun lt!382389 () ListLongMap!9413)

(declare-fun lt!382395 () V!26561)

(assert (=> b!849905 (= (+!2147 lt!382389 lt!382392) (+!2147 (+!2147 lt!382389 (tuple2!10655 k0!854 lt!382395)) lt!382392))))

(declare-fun lt!382391 () V!26561)

(assert (=> b!849905 (= lt!382392 (tuple2!10655 k0!854 lt!382391))))

(declare-fun lt!382393 () Unit!28965)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!261 (ListLongMap!9413 (_ BitVec 64) V!26561 V!26561) Unit!28965)

(assert (=> b!849905 (= lt!382393 (addSameAsAddTwiceSameKeyDiffValues!261 lt!382389 k0!854 lt!382395 lt!382391))))

(declare-fun lt!382396 () V!26561)

(declare-fun get!12258 (ValueCell!7628 V!26561) V!26561)

(assert (=> b!849905 (= lt!382395 (get!12258 (select (arr!23265 _values!688) from!1053) lt!382396))))

(assert (=> b!849905 (= lt!382397 (+!2147 lt!382389 (tuple2!10655 (select (arr!23264 _keys!868) from!1053) lt!382391)))))

(assert (=> b!849905 (= lt!382391 (get!12258 (select (store (arr!23265 _values!688) i!612 (ValueCellFull!7628 v!557)) from!1053) lt!382396))))

(declare-fun dynLambda!1011 (Int (_ BitVec 64)) V!26561)

(assert (=> b!849905 (= lt!382396 (dynLambda!1011 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!849905 (= lt!382389 (getCurrentListMapNoExtraKeys!2730 _keys!868 lt!382388 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849906 () Bool)

(declare-fun res!577402 () Bool)

(assert (=> b!849906 (=> (not res!577402) (not e!474104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849906 (= res!577402 (validMask!0 mask!1196))))

(assert (= (and start!73066 res!577398) b!849906))

(assert (= (and b!849906 res!577402) b!849901))

(assert (= (and b!849901 res!577404) b!849904))

(assert (= (and b!849904 res!577406) b!849898))

(assert (= (and b!849898 res!577405) b!849892))

(assert (= (and b!849892 res!577399) b!849893))

(assert (= (and b!849893 res!577403) b!849900))

(assert (= (and b!849900 res!577400) b!849894))

(assert (= (and b!849894 res!577401) b!849895))

(assert (= (and b!849895 c!91604) b!849897))

(assert (= (and b!849895 (not c!91604)) b!849902))

(assert (= (or b!849897 b!849902) bm!37824))

(assert (= (or b!849897 b!849902) bm!37823))

(assert (= (and b!849895 (not res!577407)) b!849905))

(assert (= (and b!849903 condMapEmpty!25802) mapIsEmpty!25802))

(assert (= (and b!849903 (not condMapEmpty!25802)) mapNonEmpty!25802))

(get-info :version)

(assert (= (and mapNonEmpty!25802 ((_ is ValueCellFull!7628) mapValue!25802)) b!849899))

(assert (= (and b!849903 ((_ is ValueCellFull!7628) mapDefault!25802)) b!849896))

(assert (= start!73066 b!849903))

(declare-fun b_lambda!11513 () Bool)

(assert (=> (not b_lambda!11513) (not b!849905)))

(declare-fun t!22931 () Bool)

(declare-fun tb!4293 () Bool)

(assert (=> (and start!73066 (= defaultEntry!696 defaultEntry!696) t!22931) tb!4293))

(declare-fun result!8205 () Bool)

(assert (=> tb!4293 (= result!8205 tp_is_empty!16135)))

(assert (=> b!849905 t!22931))

(declare-fun b_and!23133 () Bool)

(assert (= b_and!23131 (and (=> t!22931 result!8205) b_and!23133)))

(declare-fun m!790093 () Bool)

(assert (=> start!73066 m!790093))

(declare-fun m!790095 () Bool)

(assert (=> start!73066 m!790095))

(declare-fun m!790097 () Bool)

(assert (=> b!849893 m!790097))

(declare-fun m!790099 () Bool)

(assert (=> mapNonEmpty!25802 m!790099))

(declare-fun m!790101 () Bool)

(assert (=> b!849905 m!790101))

(declare-fun m!790103 () Bool)

(assert (=> b!849905 m!790103))

(declare-fun m!790105 () Bool)

(assert (=> b!849905 m!790105))

(declare-fun m!790107 () Bool)

(assert (=> b!849905 m!790107))

(declare-fun m!790109 () Bool)

(assert (=> b!849905 m!790109))

(declare-fun m!790111 () Bool)

(assert (=> b!849905 m!790111))

(declare-fun m!790113 () Bool)

(assert (=> b!849905 m!790113))

(assert (=> b!849905 m!790101))

(declare-fun m!790115 () Bool)

(assert (=> b!849905 m!790115))

(declare-fun m!790117 () Bool)

(assert (=> b!849905 m!790117))

(assert (=> b!849905 m!790107))

(declare-fun m!790119 () Bool)

(assert (=> b!849905 m!790119))

(assert (=> b!849905 m!790105))

(declare-fun m!790121 () Bool)

(assert (=> b!849905 m!790121))

(declare-fun m!790123 () Bool)

(assert (=> b!849905 m!790123))

(declare-fun m!790125 () Bool)

(assert (=> b!849905 m!790125))

(declare-fun m!790127 () Bool)

(assert (=> b!849906 m!790127))

(declare-fun m!790129 () Bool)

(assert (=> b!849898 m!790129))

(declare-fun m!790131 () Bool)

(assert (=> b!849900 m!790131))

(declare-fun m!790133 () Bool)

(assert (=> bm!37824 m!790133))

(declare-fun m!790135 () Bool)

(assert (=> b!849894 m!790135))

(assert (=> b!849894 m!790125))

(declare-fun m!790137 () Bool)

(assert (=> b!849894 m!790137))

(assert (=> b!849895 m!790115))

(assert (=> b!849895 m!790115))

(declare-fun m!790139 () Bool)

(assert (=> b!849895 m!790139))

(declare-fun m!790141 () Bool)

(assert (=> b!849895 m!790141))

(assert (=> bm!37823 m!790109))

(declare-fun m!790143 () Bool)

(assert (=> b!849897 m!790143))

(declare-fun m!790145 () Bool)

(assert (=> b!849904 m!790145))

(check-sat (not b!849895) (not b_next!13999) (not mapNonEmpty!25802) (not bm!37823) (not b_lambda!11513) (not b!849893) (not b!849905) (not b!849898) tp_is_empty!16135 b_and!23133 (not b!849897) (not b!849894) (not bm!37824) (not b!849906) (not b!849904) (not start!73066))
(check-sat b_and!23133 (not b_next!13999))
