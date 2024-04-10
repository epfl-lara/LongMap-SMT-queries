; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73638 () Bool)

(assert start!73638)

(declare-fun b_free!14553 () Bool)

(declare-fun b_next!14553 () Bool)

(assert (=> start!73638 (= b_free!14553 (not b_next!14553))))

(declare-fun tp!51162 () Bool)

(declare-fun b_and!24085 () Bool)

(assert (=> start!73638 (= tp!51162 b_and!24085)))

(declare-fun mapNonEmpty!26633 () Bool)

(declare-fun mapRes!26633 () Bool)

(declare-fun tp!51163 () Bool)

(declare-fun e!480297 () Bool)

(assert (=> mapNonEmpty!26633 (= mapRes!26633 (and tp!51163 e!480297))))

(declare-datatypes ((V!27299 0))(
  ( (V!27300 (val!8392 Int)) )
))
(declare-datatypes ((ValueCell!7905 0))(
  ( (ValueCellFull!7905 (v!10817 V!27299)) (EmptyCell!7905) )
))
(declare-fun mapRest!26633 () (Array (_ BitVec 32) ValueCell!7905))

(declare-fun mapValue!26633 () ValueCell!7905)

(declare-fun mapKey!26633 () (_ BitVec 32))

(declare-datatypes ((array!49542 0))(
  ( (array!49543 (arr!23802 (Array (_ BitVec 32) ValueCell!7905)) (size!24242 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49542)

(assert (=> mapNonEmpty!26633 (= (arr!23802 _values!688) (store mapRest!26633 mapKey!26633 mapValue!26633))))

(declare-fun b!862080 () Bool)

(declare-fun e!480294 () Bool)

(assert (=> b!862080 (= e!480294 true)))

(declare-datatypes ((array!49544 0))(
  ( (array!49545 (arr!23803 (Array (_ BitVec 32) (_ BitVec 64))) (size!24243 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49544)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!862080 (not (= (select (arr!23803 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29425 0))(
  ( (Unit!29426) )
))
(declare-fun lt!388947 () Unit!29425)

(declare-fun e!480296 () Unit!29425)

(assert (=> b!862080 (= lt!388947 e!480296)))

(declare-fun c!92050 () Bool)

(assert (=> b!862080 (= c!92050 (= (select (arr!23803 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11096 0))(
  ( (tuple2!11097 (_1!5559 (_ BitVec 64)) (_2!5559 V!27299)) )
))
(declare-datatypes ((List!16905 0))(
  ( (Nil!16902) (Cons!16901 (h!18032 tuple2!11096) (t!23724 List!16905)) )
))
(declare-datatypes ((ListLongMap!9865 0))(
  ( (ListLongMap!9866 (toList!4948 List!16905)) )
))
(declare-fun lt!388942 () ListLongMap!9865)

(declare-fun lt!388943 () ListLongMap!9865)

(declare-fun +!2298 (ListLongMap!9865 tuple2!11096) ListLongMap!9865)

(declare-fun get!12561 (ValueCell!7905 V!27299) V!27299)

(declare-fun dynLambda!1133 (Int (_ BitVec 64)) V!27299)

(assert (=> b!862080 (= lt!388942 (+!2298 lt!388943 (tuple2!11097 (select (arr!23803 _keys!868) from!1053) (get!12561 (select (arr!23802 _values!688) from!1053) (dynLambda!1133 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862081 () Bool)

(declare-fun Unit!29427 () Unit!29425)

(assert (=> b!862081 (= e!480296 Unit!29427)))

(declare-fun b!862082 () Bool)

(declare-fun tp_is_empty!16689 () Bool)

(assert (=> b!862082 (= e!480297 tp_is_empty!16689)))

(declare-fun b!862083 () Bool)

(declare-fun res!585831 () Bool)

(declare-fun e!480301 () Bool)

(assert (=> b!862083 (=> (not res!585831) (not e!480301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862083 (= res!585831 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26633 () Bool)

(assert (=> mapIsEmpty!26633 mapRes!26633))

(declare-fun b!862084 () Bool)

(declare-fun res!585833 () Bool)

(assert (=> b!862084 (=> (not res!585833) (not e!480301))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862084 (= res!585833 (and (= (select (arr!23803 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862085 () Bool)

(declare-fun res!585827 () Bool)

(assert (=> b!862085 (=> (not res!585827) (not e!480301))))

(assert (=> b!862085 (= res!585827 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24243 _keys!868))))))

(declare-fun b!862086 () Bool)

(declare-fun e!480295 () Bool)

(assert (=> b!862086 (= e!480295 tp_is_empty!16689)))

(declare-fun b!862087 () Bool)

(declare-fun e!480298 () Bool)

(assert (=> b!862087 (= e!480298 (and e!480295 mapRes!26633))))

(declare-fun condMapEmpty!26633 () Bool)

(declare-fun mapDefault!26633 () ValueCell!7905)

(assert (=> b!862087 (= condMapEmpty!26633 (= (arr!23802 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7905)) mapDefault!26633)))))

(declare-fun b!862088 () Bool)

(declare-fun res!585836 () Bool)

(assert (=> b!862088 (=> (not res!585836) (not e!480301))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!862088 (= res!585836 (and (= (size!24242 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24243 _keys!868) (size!24242 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!585830 () Bool)

(assert (=> start!73638 (=> (not res!585830) (not e!480301))))

(assert (=> start!73638 (= res!585830 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24243 _keys!868))))))

(assert (=> start!73638 e!480301))

(assert (=> start!73638 tp_is_empty!16689))

(assert (=> start!73638 true))

(assert (=> start!73638 tp!51162))

(declare-fun array_inv!18832 (array!49544) Bool)

(assert (=> start!73638 (array_inv!18832 _keys!868)))

(declare-fun array_inv!18833 (array!49542) Bool)

(assert (=> start!73638 (and (array_inv!18833 _values!688) e!480298)))

(declare-fun b!862079 () Bool)

(declare-fun res!585829 () Bool)

(assert (=> b!862079 (=> (not res!585829) (not e!480301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49544 (_ BitVec 32)) Bool)

(assert (=> b!862079 (= res!585829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862089 () Bool)

(declare-fun res!585832 () Bool)

(assert (=> b!862089 (=> (not res!585832) (not e!480301))))

(declare-datatypes ((List!16906 0))(
  ( (Nil!16903) (Cons!16902 (h!18033 (_ BitVec 64)) (t!23725 List!16906)) )
))
(declare-fun arrayNoDuplicates!0 (array!49544 (_ BitVec 32) List!16906) Bool)

(assert (=> b!862089 (= res!585832 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16903))))

(declare-fun b!862090 () Bool)

(declare-fun res!585835 () Bool)

(assert (=> b!862090 (=> (not res!585835) (not e!480301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862090 (= res!585835 (validMask!0 mask!1196))))

(declare-fun b!862091 () Bool)

(declare-fun e!480300 () Bool)

(assert (=> b!862091 (= e!480300 (not e!480294))))

(declare-fun res!585834 () Bool)

(assert (=> b!862091 (=> res!585834 e!480294)))

(assert (=> b!862091 (= res!585834 (not (validKeyInArray!0 (select (arr!23803 _keys!868) from!1053))))))

(declare-fun lt!388941 () ListLongMap!9865)

(assert (=> b!862091 (= lt!388941 lt!388943)))

(declare-fun lt!388951 () ListLongMap!9865)

(declare-fun v!557 () V!27299)

(assert (=> b!862091 (= lt!388943 (+!2298 lt!388951 (tuple2!11097 k0!854 v!557)))))

(declare-fun lt!388949 () array!49542)

(declare-fun minValue!654 () V!27299)

(declare-fun zeroValue!654 () V!27299)

(declare-fun getCurrentListMapNoExtraKeys!2924 (array!49544 array!49542 (_ BitVec 32) (_ BitVec 32) V!27299 V!27299 (_ BitVec 32) Int) ListLongMap!9865)

(assert (=> b!862091 (= lt!388941 (getCurrentListMapNoExtraKeys!2924 _keys!868 lt!388949 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862091 (= lt!388951 (getCurrentListMapNoExtraKeys!2924 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388944 () Unit!29425)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!508 (array!49544 array!49542 (_ BitVec 32) (_ BitVec 32) V!27299 V!27299 (_ BitVec 32) (_ BitVec 64) V!27299 (_ BitVec 32) Int) Unit!29425)

(assert (=> b!862091 (= lt!388944 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!508 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862092 () Bool)

(assert (=> b!862092 (= e!480301 e!480300)))

(declare-fun res!585828 () Bool)

(assert (=> b!862092 (=> (not res!585828) (not e!480300))))

(assert (=> b!862092 (= res!585828 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862092 (= lt!388942 (getCurrentListMapNoExtraKeys!2924 _keys!868 lt!388949 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862092 (= lt!388949 (array!49543 (store (arr!23802 _values!688) i!612 (ValueCellFull!7905 v!557)) (size!24242 _values!688)))))

(declare-fun lt!388950 () ListLongMap!9865)

(assert (=> b!862092 (= lt!388950 (getCurrentListMapNoExtraKeys!2924 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862093 () Bool)

(declare-fun Unit!29428 () Unit!29425)

(assert (=> b!862093 (= e!480296 Unit!29428)))

(declare-fun lt!388948 () Unit!29425)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49544 (_ BitVec 32) (_ BitVec 32)) Unit!29425)

(assert (=> b!862093 (= lt!388948 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862093 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16903)))

(declare-fun lt!388946 () Unit!29425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29425)

(assert (=> b!862093 (= lt!388946 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862093 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388945 () Unit!29425)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49544 (_ BitVec 64) (_ BitVec 32) List!16906) Unit!29425)

(assert (=> b!862093 (= lt!388945 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16903))))

(assert (=> b!862093 false))

(assert (= (and start!73638 res!585830) b!862090))

(assert (= (and b!862090 res!585835) b!862088))

(assert (= (and b!862088 res!585836) b!862079))

(assert (= (and b!862079 res!585829) b!862089))

(assert (= (and b!862089 res!585832) b!862085))

(assert (= (and b!862085 res!585827) b!862083))

(assert (= (and b!862083 res!585831) b!862084))

(assert (= (and b!862084 res!585833) b!862092))

(assert (= (and b!862092 res!585828) b!862091))

(assert (= (and b!862091 (not res!585834)) b!862080))

(assert (= (and b!862080 c!92050) b!862093))

(assert (= (and b!862080 (not c!92050)) b!862081))

(assert (= (and b!862087 condMapEmpty!26633) mapIsEmpty!26633))

(assert (= (and b!862087 (not condMapEmpty!26633)) mapNonEmpty!26633))

(get-info :version)

(assert (= (and mapNonEmpty!26633 ((_ is ValueCellFull!7905) mapValue!26633)) b!862082))

(assert (= (and b!862087 ((_ is ValueCellFull!7905) mapDefault!26633)) b!862086))

(assert (= start!73638 b!862087))

(declare-fun b_lambda!11905 () Bool)

(assert (=> (not b_lambda!11905) (not b!862080)))

(declare-fun t!23723 () Bool)

(declare-fun tb!4675 () Bool)

(assert (=> (and start!73638 (= defaultEntry!696 defaultEntry!696) t!23723) tb!4675))

(declare-fun result!8961 () Bool)

(assert (=> tb!4675 (= result!8961 tp_is_empty!16689)))

(assert (=> b!862080 t!23723))

(declare-fun b_and!24087 () Bool)

(assert (= b_and!24085 (and (=> t!23723 result!8961) b_and!24087)))

(declare-fun m!803049 () Bool)

(assert (=> b!862092 m!803049))

(declare-fun m!803051 () Bool)

(assert (=> b!862092 m!803051))

(declare-fun m!803053 () Bool)

(assert (=> b!862092 m!803053))

(declare-fun m!803055 () Bool)

(assert (=> mapNonEmpty!26633 m!803055))

(declare-fun m!803057 () Bool)

(assert (=> b!862083 m!803057))

(declare-fun m!803059 () Bool)

(assert (=> b!862080 m!803059))

(declare-fun m!803061 () Bool)

(assert (=> b!862080 m!803061))

(declare-fun m!803063 () Bool)

(assert (=> b!862080 m!803063))

(assert (=> b!862080 m!803059))

(declare-fun m!803065 () Bool)

(assert (=> b!862080 m!803065))

(declare-fun m!803067 () Bool)

(assert (=> b!862080 m!803067))

(assert (=> b!862080 m!803061))

(declare-fun m!803069 () Bool)

(assert (=> b!862093 m!803069))

(declare-fun m!803071 () Bool)

(assert (=> b!862093 m!803071))

(declare-fun m!803073 () Bool)

(assert (=> b!862093 m!803073))

(declare-fun m!803075 () Bool)

(assert (=> b!862093 m!803075))

(declare-fun m!803077 () Bool)

(assert (=> b!862093 m!803077))

(declare-fun m!803079 () Bool)

(assert (=> start!73638 m!803079))

(declare-fun m!803081 () Bool)

(assert (=> start!73638 m!803081))

(declare-fun m!803083 () Bool)

(assert (=> b!862079 m!803083))

(declare-fun m!803085 () Bool)

(assert (=> b!862089 m!803085))

(declare-fun m!803087 () Bool)

(assert (=> b!862091 m!803087))

(declare-fun m!803089 () Bool)

(assert (=> b!862091 m!803089))

(assert (=> b!862091 m!803067))

(declare-fun m!803091 () Bool)

(assert (=> b!862091 m!803091))

(assert (=> b!862091 m!803067))

(declare-fun m!803093 () Bool)

(assert (=> b!862091 m!803093))

(declare-fun m!803095 () Bool)

(assert (=> b!862091 m!803095))

(declare-fun m!803097 () Bool)

(assert (=> b!862084 m!803097))

(declare-fun m!803099 () Bool)

(assert (=> b!862090 m!803099))

(check-sat (not b!862092) (not start!73638) tp_is_empty!16689 (not b!862090) (not b!862093) (not b!862089) (not b_next!14553) (not mapNonEmpty!26633) (not b!862080) (not b_lambda!11905) (not b!862091) b_and!24087 (not b!862083) (not b!862079))
(check-sat b_and!24087 (not b_next!14553))
