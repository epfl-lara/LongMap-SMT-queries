; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73236 () Bool)

(assert start!73236)

(declare-fun b_free!14151 () Bool)

(declare-fun b_next!14151 () Bool)

(assert (=> start!73236 (= b_free!14151 (not b_next!14151))))

(declare-fun tp!49956 () Bool)

(declare-fun b_and!23461 () Bool)

(assert (=> start!73236 (= tp!49956 b_and!23461)))

(declare-fun b!853703 () Bool)

(declare-fun e!476075 () Bool)

(declare-fun tp_is_empty!16287 () Bool)

(assert (=> b!853703 (= e!476075 tp_is_empty!16287)))

(declare-fun b!853704 () Bool)

(declare-fun res!579793 () Bool)

(declare-fun e!476078 () Bool)

(assert (=> b!853704 (=> (not res!579793) (not e!476078))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48772 0))(
  ( (array!48773 (arr!23417 (Array (_ BitVec 32) (_ BitVec 64))) (size!23857 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48772)

(assert (=> b!853704 (= res!579793 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23857 _keys!868))))))

(declare-fun b!853705 () Bool)

(declare-fun res!579796 () Bool)

(assert (=> b!853705 (=> (not res!579796) (not e!476078))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853705 (= res!579796 (validMask!0 mask!1196))))

(declare-fun b!853706 () Bool)

(declare-fun res!579797 () Bool)

(assert (=> b!853706 (=> (not res!579797) (not e!476078))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26763 0))(
  ( (V!26764 (val!8191 Int)) )
))
(declare-datatypes ((ValueCell!7704 0))(
  ( (ValueCellFull!7704 (v!10616 V!26763)) (EmptyCell!7704) )
))
(declare-datatypes ((array!48774 0))(
  ( (array!48775 (arr!23418 (Array (_ BitVec 32) ValueCell!7704)) (size!23858 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48774)

(assert (=> b!853706 (= res!579797 (and (= (size!23858 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23857 _keys!868) (size!23858 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853707 () Bool)

(declare-fun e!476076 () Bool)

(assert (=> b!853707 (= e!476078 e!476076)))

(declare-fun res!579794 () Bool)

(assert (=> b!853707 (=> (not res!579794) (not e!476076))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!853707 (= res!579794 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10772 0))(
  ( (tuple2!10773 (_1!5397 (_ BitVec 64)) (_2!5397 V!26763)) )
))
(declare-datatypes ((List!16595 0))(
  ( (Nil!16592) (Cons!16591 (h!17722 tuple2!10772) (t!23192 List!16595)) )
))
(declare-datatypes ((ListLongMap!9541 0))(
  ( (ListLongMap!9542 (toList!4786 List!16595)) )
))
(declare-fun lt!384908 () ListLongMap!9541)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384907 () array!48774)

(declare-fun minValue!654 () V!26763)

(declare-fun zeroValue!654 () V!26763)

(declare-fun getCurrentListMapNoExtraKeys!2767 (array!48772 array!48774 (_ BitVec 32) (_ BitVec 32) V!26763 V!26763 (_ BitVec 32) Int) ListLongMap!9541)

(assert (=> b!853707 (= lt!384908 (getCurrentListMapNoExtraKeys!2767 _keys!868 lt!384907 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26763)

(assert (=> b!853707 (= lt!384907 (array!48775 (store (arr!23418 _values!688) i!612 (ValueCellFull!7704 v!557)) (size!23858 _values!688)))))

(declare-fun lt!384911 () ListLongMap!9541)

(assert (=> b!853707 (= lt!384911 (getCurrentListMapNoExtraKeys!2767 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853709 () Bool)

(declare-fun e!476080 () Bool)

(declare-fun mapRes!26030 () Bool)

(assert (=> b!853709 (= e!476080 (and e!476075 mapRes!26030))))

(declare-fun condMapEmpty!26030 () Bool)

(declare-fun mapDefault!26030 () ValueCell!7704)

(assert (=> b!853709 (= condMapEmpty!26030 (= (arr!23418 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7704)) mapDefault!26030)))))

(declare-fun b!853710 () Bool)

(declare-fun e!476073 () Bool)

(assert (=> b!853710 (= e!476073 tp_is_empty!16287)))

(declare-fun b!853711 () Bool)

(declare-fun res!579791 () Bool)

(assert (=> b!853711 (=> (not res!579791) (not e!476078))))

(declare-datatypes ((List!16596 0))(
  ( (Nil!16593) (Cons!16592 (h!17723 (_ BitVec 64)) (t!23193 List!16596)) )
))
(declare-fun arrayNoDuplicates!0 (array!48772 (_ BitVec 32) List!16596) Bool)

(assert (=> b!853711 (= res!579791 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16593))))

(declare-fun e!476077 () Bool)

(declare-fun call!38308 () ListLongMap!9541)

(declare-fun call!38309 () ListLongMap!9541)

(declare-fun b!853712 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2178 (ListLongMap!9541 tuple2!10772) ListLongMap!9541)

(assert (=> b!853712 (= e!476077 (= call!38309 (+!2178 call!38308 (tuple2!10773 k0!854 v!557))))))

(declare-fun b!853713 () Bool)

(declare-fun res!579790 () Bool)

(assert (=> b!853713 (=> (not res!579790) (not e!476078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853713 (= res!579790 (validKeyInArray!0 k0!854))))

(declare-fun b!853714 () Bool)

(declare-fun e!476079 () Bool)

(assert (=> b!853714 (= e!476076 (not e!476079))))

(declare-fun res!579792 () Bool)

(assert (=> b!853714 (=> res!579792 e!476079)))

(assert (=> b!853714 (= res!579792 (not (validKeyInArray!0 (select (arr!23417 _keys!868) from!1053))))))

(assert (=> b!853714 e!476077))

(declare-fun c!91897 () Bool)

(assert (=> b!853714 (= c!91897 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29139 0))(
  ( (Unit!29140) )
))
(declare-fun lt!384912 () Unit!29139)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!401 (array!48772 array!48774 (_ BitVec 32) (_ BitVec 32) V!26763 V!26763 (_ BitVec 32) (_ BitVec 64) V!26763 (_ BitVec 32) Int) Unit!29139)

(assert (=> b!853714 (= lt!384912 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!401 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853715 () Bool)

(declare-fun res!579788 () Bool)

(assert (=> b!853715 (=> (not res!579788) (not e!476078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48772 (_ BitVec 32)) Bool)

(assert (=> b!853715 (= res!579788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26030 () Bool)

(declare-fun tp!49957 () Bool)

(assert (=> mapNonEmpty!26030 (= mapRes!26030 (and tp!49957 e!476073))))

(declare-fun mapValue!26030 () ValueCell!7704)

(declare-fun mapRest!26030 () (Array (_ BitVec 32) ValueCell!7704))

(declare-fun mapKey!26030 () (_ BitVec 32))

(assert (=> mapNonEmpty!26030 (= (arr!23418 _values!688) (store mapRest!26030 mapKey!26030 mapValue!26030))))

(declare-fun b!853716 () Bool)

(declare-fun res!579795 () Bool)

(assert (=> b!853716 (=> (not res!579795) (not e!476078))))

(assert (=> b!853716 (= res!579795 (and (= (select (arr!23417 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!38305 () Bool)

(assert (=> bm!38305 (= call!38308 (getCurrentListMapNoExtraKeys!2767 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26030 () Bool)

(assert (=> mapIsEmpty!26030 mapRes!26030))

(declare-fun b!853717 () Bool)

(assert (=> b!853717 (= e!476079 true)))

(declare-fun lt!384906 () V!26763)

(declare-fun lt!384910 () ListLongMap!9541)

(declare-fun lt!384913 () tuple2!10772)

(assert (=> b!853717 (= (+!2178 lt!384910 lt!384913) (+!2178 (+!2178 lt!384910 (tuple2!10773 k0!854 lt!384906)) lt!384913))))

(declare-fun lt!384904 () V!26763)

(assert (=> b!853717 (= lt!384913 (tuple2!10773 k0!854 lt!384904))))

(declare-fun lt!384909 () Unit!29139)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!305 (ListLongMap!9541 (_ BitVec 64) V!26763 V!26763) Unit!29139)

(assert (=> b!853717 (= lt!384909 (addSameAsAddTwiceSameKeyDiffValues!305 lt!384910 k0!854 lt!384906 lt!384904))))

(declare-fun lt!384905 () V!26763)

(declare-fun get!12353 (ValueCell!7704 V!26763) V!26763)

(assert (=> b!853717 (= lt!384906 (get!12353 (select (arr!23418 _values!688) from!1053) lt!384905))))

(assert (=> b!853717 (= lt!384908 (+!2178 lt!384910 (tuple2!10773 (select (arr!23417 _keys!868) from!1053) lt!384904)))))

(assert (=> b!853717 (= lt!384904 (get!12353 (select (store (arr!23418 _values!688) i!612 (ValueCellFull!7704 v!557)) from!1053) lt!384905))))

(declare-fun dynLambda!1059 (Int (_ BitVec 64)) V!26763)

(assert (=> b!853717 (= lt!384905 (dynLambda!1059 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853717 (= lt!384910 (getCurrentListMapNoExtraKeys!2767 _keys!868 lt!384907 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38306 () Bool)

(assert (=> bm!38306 (= call!38309 (getCurrentListMapNoExtraKeys!2767 _keys!868 lt!384907 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853708 () Bool)

(assert (=> b!853708 (= e!476077 (= call!38309 call!38308))))

(declare-fun res!579789 () Bool)

(assert (=> start!73236 (=> (not res!579789) (not e!476078))))

(assert (=> start!73236 (= res!579789 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23857 _keys!868))))))

(assert (=> start!73236 e!476078))

(assert (=> start!73236 tp_is_empty!16287))

(assert (=> start!73236 true))

(assert (=> start!73236 tp!49956))

(declare-fun array_inv!18566 (array!48772) Bool)

(assert (=> start!73236 (array_inv!18566 _keys!868)))

(declare-fun array_inv!18567 (array!48774) Bool)

(assert (=> start!73236 (and (array_inv!18567 _values!688) e!476080)))

(assert (= (and start!73236 res!579789) b!853705))

(assert (= (and b!853705 res!579796) b!853706))

(assert (= (and b!853706 res!579797) b!853715))

(assert (= (and b!853715 res!579788) b!853711))

(assert (= (and b!853711 res!579791) b!853704))

(assert (= (and b!853704 res!579793) b!853713))

(assert (= (and b!853713 res!579790) b!853716))

(assert (= (and b!853716 res!579795) b!853707))

(assert (= (and b!853707 res!579794) b!853714))

(assert (= (and b!853714 c!91897) b!853712))

(assert (= (and b!853714 (not c!91897)) b!853708))

(assert (= (or b!853712 b!853708) bm!38306))

(assert (= (or b!853712 b!853708) bm!38305))

(assert (= (and b!853714 (not res!579792)) b!853717))

(assert (= (and b!853709 condMapEmpty!26030) mapIsEmpty!26030))

(assert (= (and b!853709 (not condMapEmpty!26030)) mapNonEmpty!26030))

(get-info :version)

(assert (= (and mapNonEmpty!26030 ((_ is ValueCellFull!7704) mapValue!26030)) b!853710))

(assert (= (and b!853709 ((_ is ValueCellFull!7704) mapDefault!26030)) b!853703))

(assert (= start!73236 b!853709))

(declare-fun b_lambda!11683 () Bool)

(assert (=> (not b_lambda!11683) (not b!853717)))

(declare-fun t!23191 () Bool)

(declare-fun tb!4453 () Bool)

(assert (=> (and start!73236 (= defaultEntry!696 defaultEntry!696) t!23191) tb!4453))

(declare-fun result!8517 () Bool)

(assert (=> tb!4453 (= result!8517 tp_is_empty!16287)))

(assert (=> b!853717 t!23191))

(declare-fun b_and!23463 () Bool)

(assert (= b_and!23461 (and (=> t!23191 result!8517) b_and!23463)))

(declare-fun m!794957 () Bool)

(assert (=> b!853711 m!794957))

(declare-fun m!794959 () Bool)

(assert (=> bm!38306 m!794959))

(declare-fun m!794961 () Bool)

(assert (=> start!73236 m!794961))

(declare-fun m!794963 () Bool)

(assert (=> start!73236 m!794963))

(declare-fun m!794965 () Bool)

(assert (=> b!853717 m!794965))

(declare-fun m!794967 () Bool)

(assert (=> b!853717 m!794967))

(declare-fun m!794969 () Bool)

(assert (=> b!853717 m!794969))

(declare-fun m!794971 () Bool)

(assert (=> b!853717 m!794971))

(assert (=> b!853717 m!794959))

(assert (=> b!853717 m!794969))

(declare-fun m!794973 () Bool)

(assert (=> b!853717 m!794973))

(declare-fun m!794975 () Bool)

(assert (=> b!853717 m!794975))

(declare-fun m!794977 () Bool)

(assert (=> b!853717 m!794977))

(declare-fun m!794979 () Bool)

(assert (=> b!853717 m!794979))

(assert (=> b!853717 m!794975))

(declare-fun m!794981 () Bool)

(assert (=> b!853717 m!794981))

(assert (=> b!853717 m!794965))

(declare-fun m!794983 () Bool)

(assert (=> b!853717 m!794983))

(declare-fun m!794985 () Bool)

(assert (=> b!853717 m!794985))

(declare-fun m!794987 () Bool)

(assert (=> b!853717 m!794987))

(declare-fun m!794989 () Bool)

(assert (=> b!853713 m!794989))

(declare-fun m!794991 () Bool)

(assert (=> b!853707 m!794991))

(assert (=> b!853707 m!794981))

(declare-fun m!794993 () Bool)

(assert (=> b!853707 m!794993))

(assert (=> b!853714 m!794985))

(assert (=> b!853714 m!794985))

(declare-fun m!794995 () Bool)

(assert (=> b!853714 m!794995))

(declare-fun m!794997 () Bool)

(assert (=> b!853714 m!794997))

(declare-fun m!794999 () Bool)

(assert (=> b!853705 m!794999))

(declare-fun m!795001 () Bool)

(assert (=> mapNonEmpty!26030 m!795001))

(declare-fun m!795003 () Bool)

(assert (=> b!853715 m!795003))

(declare-fun m!795005 () Bool)

(assert (=> b!853712 m!795005))

(declare-fun m!795007 () Bool)

(assert (=> bm!38305 m!795007))

(declare-fun m!795009 () Bool)

(assert (=> b!853716 m!795009))

(check-sat (not b!853707) (not b_lambda!11683) (not bm!38306) (not b_next!14151) b_and!23463 (not b!853705) tp_is_empty!16287 (not start!73236) (not b!853714) (not b!853715) (not bm!38305) (not b!853711) (not b!853717) (not b!853712) (not b!853713) (not mapNonEmpty!26030))
(check-sat b_and!23463 (not b_next!14151))
