; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73204 () Bool)

(assert start!73204)

(declare-fun b_free!13951 () Bool)

(declare-fun b_next!13951 () Bool)

(assert (=> start!73204 (= b_free!13951 (not b_next!13951))))

(declare-fun tp!49357 () Bool)

(declare-fun b_and!23071 () Bool)

(assert (=> start!73204 (= tp!49357 b_and!23071)))

(declare-fun b!849906 () Bool)

(declare-fun e!474261 () Bool)

(declare-fun tp_is_empty!16087 () Bool)

(assert (=> b!849906 (= e!474261 tp_is_empty!16087)))

(declare-fun bm!37750 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun c!91879 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((V!26497 0))(
  ( (V!26498 (val!8091 Int)) )
))
(declare-fun minValue!654 () V!26497)

(declare-fun zeroValue!654 () V!26497)

(declare-datatypes ((array!48433 0))(
  ( (array!48434 (arr!23243 (Array (_ BitVec 32) (_ BitVec 64))) (size!23684 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48433)

(declare-datatypes ((ValueCell!7604 0))(
  ( (ValueCellFull!7604 (v!10516 V!26497)) (EmptyCell!7604) )
))
(declare-datatypes ((array!48435 0))(
  ( (array!48436 (arr!23244 (Array (_ BitVec 32) ValueCell!7604)) (size!23685 (_ BitVec 32))) )
))
(declare-fun lt!382526 () array!48435)

(declare-fun _values!688 () array!48435)

(declare-datatypes ((tuple2!10516 0))(
  ( (tuple2!10517 (_1!5269 (_ BitVec 64)) (_2!5269 V!26497)) )
))
(declare-datatypes ((List!16384 0))(
  ( (Nil!16381) (Cons!16380 (h!17517 tuple2!10516) (t!22773 List!16384)) )
))
(declare-datatypes ((ListLongMap!9287 0))(
  ( (ListLongMap!9288 (toList!4659 List!16384)) )
))
(declare-fun call!37754 () ListLongMap!9287)

(declare-fun getCurrentListMapNoExtraKeys!2717 (array!48433 array!48435 (_ BitVec 32) (_ BitVec 32) V!26497 V!26497 (_ BitVec 32) Int) ListLongMap!9287)

(assert (=> bm!37750 (= call!37754 (getCurrentListMapNoExtraKeys!2717 _keys!868 (ite c!91879 _values!688 lt!382526) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37751 () Bool)

(declare-fun call!37753 () ListLongMap!9287)

(assert (=> bm!37751 (= call!37753 (getCurrentListMapNoExtraKeys!2717 _keys!868 (ite c!91879 lt!382526 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849907 () Bool)

(declare-fun res!577139 () Bool)

(declare-fun e!474257 () Bool)

(assert (=> b!849907 (=> (not res!577139) (not e!474257))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849907 (= res!577139 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23684 _keys!868))))))

(declare-fun e!474260 () Bool)

(declare-fun v!557 () V!26497)

(declare-fun b!849908 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2113 (ListLongMap!9287 tuple2!10516) ListLongMap!9287)

(assert (=> b!849908 (= e!474260 (= call!37753 (+!2113 call!37754 (tuple2!10517 k0!854 v!557))))))

(declare-fun mapNonEmpty!25730 () Bool)

(declare-fun mapRes!25730 () Bool)

(declare-fun tp!49358 () Bool)

(declare-fun e!474258 () Bool)

(assert (=> mapNonEmpty!25730 (= mapRes!25730 (and tp!49358 e!474258))))

(declare-fun mapValue!25730 () ValueCell!7604)

(declare-fun mapRest!25730 () (Array (_ BitVec 32) ValueCell!7604))

(declare-fun mapKey!25730 () (_ BitVec 32))

(assert (=> mapNonEmpty!25730 (= (arr!23244 _values!688) (store mapRest!25730 mapKey!25730 mapValue!25730))))

(declare-fun b!849909 () Bool)

(declare-fun e!474255 () Bool)

(assert (=> b!849909 (= e!474255 (and e!474261 mapRes!25730))))

(declare-fun condMapEmpty!25730 () Bool)

(declare-fun mapDefault!25730 () ValueCell!7604)

(assert (=> b!849909 (= condMapEmpty!25730 (= (arr!23244 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7604)) mapDefault!25730)))))

(declare-fun b!849910 () Bool)

(declare-fun res!577137 () Bool)

(assert (=> b!849910 (=> (not res!577137) (not e!474257))))

(assert (=> b!849910 (= res!577137 (and (= (size!23685 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23684 _keys!868) (size!23685 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849911 () Bool)

(declare-fun res!577134 () Bool)

(assert (=> b!849911 (=> (not res!577134) (not e!474257))))

(declare-datatypes ((List!16385 0))(
  ( (Nil!16382) (Cons!16381 (h!17518 (_ BitVec 64)) (t!22774 List!16385)) )
))
(declare-fun arrayNoDuplicates!0 (array!48433 (_ BitVec 32) List!16385) Bool)

(assert (=> b!849911 (= res!577134 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16382))))

(declare-fun b!849912 () Bool)

(declare-fun res!577136 () Bool)

(assert (=> b!849912 (=> (not res!577136) (not e!474257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48433 (_ BitVec 32)) Bool)

(assert (=> b!849912 (= res!577136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25730 () Bool)

(assert (=> mapIsEmpty!25730 mapRes!25730))

(declare-fun res!577140 () Bool)

(assert (=> start!73204 (=> (not res!577140) (not e!474257))))

(assert (=> start!73204 (= res!577140 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23684 _keys!868))))))

(assert (=> start!73204 e!474257))

(assert (=> start!73204 tp_is_empty!16087))

(assert (=> start!73204 true))

(assert (=> start!73204 tp!49357))

(declare-fun array_inv!18504 (array!48433) Bool)

(assert (=> start!73204 (array_inv!18504 _keys!868)))

(declare-fun array_inv!18505 (array!48435) Bool)

(assert (=> start!73204 (and (array_inv!18505 _values!688) e!474255)))

(declare-fun b!849913 () Bool)

(declare-fun e!474259 () Bool)

(assert (=> b!849913 (= e!474257 e!474259)))

(declare-fun res!577141 () Bool)

(assert (=> b!849913 (=> (not res!577141) (not e!474259))))

(assert (=> b!849913 (= res!577141 (= from!1053 i!612))))

(declare-fun lt!382525 () ListLongMap!9287)

(assert (=> b!849913 (= lt!382525 (getCurrentListMapNoExtraKeys!2717 _keys!868 lt!382526 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849913 (= lt!382526 (array!48436 (store (arr!23244 _values!688) i!612 (ValueCellFull!7604 v!557)) (size!23685 _values!688)))))

(declare-fun lt!382524 () ListLongMap!9287)

(assert (=> b!849913 (= lt!382524 (getCurrentListMapNoExtraKeys!2717 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849914 () Bool)

(assert (=> b!849914 (= e!474260 (= call!37754 call!37753))))

(declare-fun b!849915 () Bool)

(declare-fun res!577133 () Bool)

(assert (=> b!849915 (=> (not res!577133) (not e!474257))))

(assert (=> b!849915 (= res!577133 (and (= (select (arr!23243 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849916 () Bool)

(declare-fun res!577135 () Bool)

(assert (=> b!849916 (=> (not res!577135) (not e!474257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849916 (= res!577135 (validMask!0 mask!1196))))

(declare-fun b!849917 () Bool)

(declare-fun res!577138 () Bool)

(assert (=> b!849917 (=> (not res!577138) (not e!474257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849917 (= res!577138 (validKeyInArray!0 k0!854))))

(declare-fun b!849918 () Bool)

(declare-fun e!474256 () Bool)

(assert (=> b!849918 (= e!474256 true)))

(declare-fun get!12226 (ValueCell!7604 V!26497) V!26497)

(declare-fun dynLambda!992 (Int (_ BitVec 64)) V!26497)

(assert (=> b!849918 (= lt!382525 (+!2113 (getCurrentListMapNoExtraKeys!2717 _keys!868 lt!382526 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10517 (select (arr!23243 _keys!868) from!1053) (get!12226 (select (arr!23244 lt!382526) from!1053) (dynLambda!992 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849919 () Bool)

(assert (=> b!849919 (= e!474258 tp_is_empty!16087)))

(declare-fun b!849920 () Bool)

(assert (=> b!849920 (= e!474259 (not e!474256))))

(declare-fun res!577132 () Bool)

(assert (=> b!849920 (=> res!577132 e!474256)))

(assert (=> b!849920 (= res!577132 (not (validKeyInArray!0 (select (arr!23243 _keys!868) from!1053))))))

(assert (=> b!849920 e!474260))

(assert (=> b!849920 (= c!91879 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28996 0))(
  ( (Unit!28997) )
))
(declare-fun lt!382523 () Unit!28996)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!334 (array!48433 array!48435 (_ BitVec 32) (_ BitVec 32) V!26497 V!26497 (_ BitVec 32) (_ BitVec 64) V!26497 (_ BitVec 32) Int) Unit!28996)

(assert (=> b!849920 (= lt!382523 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!334 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73204 res!577140) b!849916))

(assert (= (and b!849916 res!577135) b!849910))

(assert (= (and b!849910 res!577137) b!849912))

(assert (= (and b!849912 res!577136) b!849911))

(assert (= (and b!849911 res!577134) b!849907))

(assert (= (and b!849907 res!577139) b!849917))

(assert (= (and b!849917 res!577138) b!849915))

(assert (= (and b!849915 res!577133) b!849913))

(assert (= (and b!849913 res!577141) b!849920))

(assert (= (and b!849920 c!91879) b!849908))

(assert (= (and b!849920 (not c!91879)) b!849914))

(assert (= (or b!849908 b!849914) bm!37750))

(assert (= (or b!849908 b!849914) bm!37751))

(assert (= (and b!849920 (not res!577132)) b!849918))

(assert (= (and b!849909 condMapEmpty!25730) mapIsEmpty!25730))

(assert (= (and b!849909 (not condMapEmpty!25730)) mapNonEmpty!25730))

(get-info :version)

(assert (= (and mapNonEmpty!25730 ((_ is ValueCellFull!7604) mapValue!25730)) b!849919))

(assert (= (and b!849909 ((_ is ValueCellFull!7604) mapDefault!25730)) b!849906))

(assert (= start!73204 b!849909))

(declare-fun b_lambda!11497 () Bool)

(assert (=> (not b_lambda!11497) (not b!849918)))

(declare-fun t!22772 () Bool)

(declare-fun tb!4245 () Bool)

(assert (=> (and start!73204 (= defaultEntry!696 defaultEntry!696) t!22772) tb!4245))

(declare-fun result!8109 () Bool)

(assert (=> tb!4245 (= result!8109 tp_is_empty!16087)))

(assert (=> b!849918 t!22772))

(declare-fun b_and!23073 () Bool)

(assert (= b_and!23071 (and (=> t!22772 result!8109) b_and!23073)))

(declare-fun m!791021 () Bool)

(assert (=> b!849915 m!791021))

(declare-fun m!791023 () Bool)

(assert (=> bm!37750 m!791023))

(declare-fun m!791025 () Bool)

(assert (=> b!849911 m!791025))

(declare-fun m!791027 () Bool)

(assert (=> b!849916 m!791027))

(declare-fun m!791029 () Bool)

(assert (=> b!849908 m!791029))

(declare-fun m!791031 () Bool)

(assert (=> b!849912 m!791031))

(declare-fun m!791033 () Bool)

(assert (=> mapNonEmpty!25730 m!791033))

(declare-fun m!791035 () Bool)

(assert (=> b!849920 m!791035))

(assert (=> b!849920 m!791035))

(declare-fun m!791037 () Bool)

(assert (=> b!849920 m!791037))

(declare-fun m!791039 () Bool)

(assert (=> b!849920 m!791039))

(declare-fun m!791041 () Bool)

(assert (=> b!849917 m!791041))

(declare-fun m!791043 () Bool)

(assert (=> b!849918 m!791043))

(declare-fun m!791045 () Bool)

(assert (=> b!849918 m!791045))

(declare-fun m!791047 () Bool)

(assert (=> b!849918 m!791047))

(declare-fun m!791049 () Bool)

(assert (=> b!849918 m!791049))

(assert (=> b!849918 m!791043))

(declare-fun m!791051 () Bool)

(assert (=> b!849918 m!791051))

(assert (=> b!849918 m!791045))

(assert (=> b!849918 m!791035))

(assert (=> b!849918 m!791047))

(declare-fun m!791053 () Bool)

(assert (=> bm!37751 m!791053))

(declare-fun m!791055 () Bool)

(assert (=> b!849913 m!791055))

(declare-fun m!791057 () Bool)

(assert (=> b!849913 m!791057))

(declare-fun m!791059 () Bool)

(assert (=> b!849913 m!791059))

(declare-fun m!791061 () Bool)

(assert (=> start!73204 m!791061))

(declare-fun m!791063 () Bool)

(assert (=> start!73204 m!791063))

(check-sat (not b!849913) (not b!849908) (not bm!37750) (not mapNonEmpty!25730) (not b!849920) (not b!849917) tp_is_empty!16087 (not bm!37751) (not b_next!13951) (not b!849916) (not start!73204) (not b!849911) (not b_lambda!11497) (not b!849918) b_and!23073 (not b!849912))
(check-sat b_and!23073 (not b_next!13951))
