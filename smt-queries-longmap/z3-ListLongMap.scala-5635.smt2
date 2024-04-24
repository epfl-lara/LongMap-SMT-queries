; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73762 () Bool)

(assert start!73762)

(declare-fun b_free!14509 () Bool)

(declare-fun b_next!14509 () Bool)

(assert (=> start!73762 (= b_free!14509 (not b_next!14509))))

(declare-fun tp!51032 () Bool)

(declare-fun b_and!24007 () Bool)

(assert (=> start!73762 (= tp!51032 b_and!24007)))

(declare-fun b!861948 () Bool)

(declare-fun res!585511 () Bool)

(declare-fun e!480348 () Bool)

(assert (=> b!861948 (=> (not res!585511) (not e!480348))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861948 (= res!585511 (validKeyInArray!0 k0!854))))

(declare-fun b!861949 () Bool)

(declare-fun res!585514 () Bool)

(assert (=> b!861949 (=> (not res!585514) (not e!480348))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49515 0))(
  ( (array!49516 (arr!23784 (Array (_ BitVec 32) (_ BitVec 64))) (size!24225 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49515)

(assert (=> b!861949 (= res!585514 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24225 _keys!868))))))

(declare-fun b!861950 () Bool)

(declare-fun res!585520 () Bool)

(assert (=> b!861950 (=> (not res!585520) (not e!480348))))

(declare-datatypes ((List!16830 0))(
  ( (Nil!16827) (Cons!16826 (h!17963 (_ BitVec 64)) (t!23597 List!16830)) )
))
(declare-fun arrayNoDuplicates!0 (array!49515 (_ BitVec 32) List!16830) Bool)

(assert (=> b!861950 (= res!585520 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16827))))

(declare-fun b!861951 () Bool)

(declare-fun e!480353 () Bool)

(assert (=> b!861951 (= e!480353 true)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861951 (not (= (select (arr!23784 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29362 0))(
  ( (Unit!29363) )
))
(declare-fun lt!388583 () Unit!29362)

(declare-fun e!480355 () Unit!29362)

(assert (=> b!861951 (= lt!388583 e!480355)))

(declare-fun c!92266 () Bool)

(assert (=> b!861951 (= c!92266 (= (select (arr!23784 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27241 0))(
  ( (V!27242 (val!8370 Int)) )
))
(declare-datatypes ((tuple2!10990 0))(
  ( (tuple2!10991 (_1!5506 (_ BitVec 64)) (_2!5506 V!27241)) )
))
(declare-datatypes ((List!16831 0))(
  ( (Nil!16828) (Cons!16827 (h!17964 tuple2!10990) (t!23598 List!16831)) )
))
(declare-datatypes ((ListLongMap!9761 0))(
  ( (ListLongMap!9762 (toList!4896 List!16831)) )
))
(declare-fun lt!388578 () ListLongMap!9761)

(declare-fun lt!388576 () ListLongMap!9761)

(declare-datatypes ((ValueCell!7883 0))(
  ( (ValueCellFull!7883 (v!10795 V!27241)) (EmptyCell!7883) )
))
(declare-datatypes ((array!49517 0))(
  ( (array!49518 (arr!23785 (Array (_ BitVec 32) ValueCell!7883)) (size!24226 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49517)

(declare-fun +!2300 (ListLongMap!9761 tuple2!10990) ListLongMap!9761)

(declare-fun get!12548 (ValueCell!7883 V!27241) V!27241)

(declare-fun dynLambda!1128 (Int (_ BitVec 64)) V!27241)

(assert (=> b!861951 (= lt!388576 (+!2300 lt!388578 (tuple2!10991 (select (arr!23784 _keys!868) from!1053) (get!12548 (select (arr!23785 _values!688) from!1053) (dynLambda!1128 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26567 () Bool)

(declare-fun mapRes!26567 () Bool)

(assert (=> mapIsEmpty!26567 mapRes!26567))

(declare-fun b!861953 () Bool)

(declare-fun Unit!29364 () Unit!29362)

(assert (=> b!861953 (= e!480355 Unit!29364)))

(declare-fun b!861954 () Bool)

(declare-fun Unit!29365 () Unit!29362)

(assert (=> b!861954 (= e!480355 Unit!29365)))

(declare-fun lt!388585 () Unit!29362)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49515 (_ BitVec 32) (_ BitVec 32)) Unit!29362)

(assert (=> b!861954 (= lt!388585 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861954 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16827)))

(declare-fun lt!388584 () Unit!29362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29362)

(assert (=> b!861954 (= lt!388584 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861954 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388586 () Unit!29362)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49515 (_ BitVec 64) (_ BitVec 32) List!16830) Unit!29362)

(assert (=> b!861954 (= lt!388586 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16827))))

(assert (=> b!861954 false))

(declare-fun b!861955 () Bool)

(declare-fun res!585516 () Bool)

(assert (=> b!861955 (=> (not res!585516) (not e!480348))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49515 (_ BitVec 32)) Bool)

(assert (=> b!861955 (= res!585516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861956 () Bool)

(declare-fun e!480349 () Bool)

(declare-fun tp_is_empty!16645 () Bool)

(assert (=> b!861956 (= e!480349 tp_is_empty!16645)))

(declare-fun b!861957 () Bool)

(declare-fun e!480354 () Bool)

(assert (=> b!861957 (= e!480354 (and e!480349 mapRes!26567))))

(declare-fun condMapEmpty!26567 () Bool)

(declare-fun mapDefault!26567 () ValueCell!7883)

(assert (=> b!861957 (= condMapEmpty!26567 (= (arr!23785 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7883)) mapDefault!26567)))))

(declare-fun mapNonEmpty!26567 () Bool)

(declare-fun tp!51031 () Bool)

(declare-fun e!480350 () Bool)

(assert (=> mapNonEmpty!26567 (= mapRes!26567 (and tp!51031 e!480350))))

(declare-fun mapValue!26567 () ValueCell!7883)

(declare-fun mapRest!26567 () (Array (_ BitVec 32) ValueCell!7883))

(declare-fun mapKey!26567 () (_ BitVec 32))

(assert (=> mapNonEmpty!26567 (= (arr!23785 _values!688) (store mapRest!26567 mapKey!26567 mapValue!26567))))

(declare-fun b!861958 () Bool)

(declare-fun e!480352 () Bool)

(assert (=> b!861958 (= e!480348 e!480352)))

(declare-fun res!585512 () Bool)

(assert (=> b!861958 (=> (not res!585512) (not e!480352))))

(assert (=> b!861958 (= res!585512 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!388577 () array!49517)

(declare-fun minValue!654 () V!27241)

(declare-fun zeroValue!654 () V!27241)

(declare-fun getCurrentListMapNoExtraKeys!2949 (array!49515 array!49517 (_ BitVec 32) (_ BitVec 32) V!27241 V!27241 (_ BitVec 32) Int) ListLongMap!9761)

(assert (=> b!861958 (= lt!388576 (getCurrentListMapNoExtraKeys!2949 _keys!868 lt!388577 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27241)

(assert (=> b!861958 (= lt!388577 (array!49518 (store (arr!23785 _values!688) i!612 (ValueCellFull!7883 v!557)) (size!24226 _values!688)))))

(declare-fun lt!388580 () ListLongMap!9761)

(assert (=> b!861958 (= lt!388580 (getCurrentListMapNoExtraKeys!2949 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861952 () Bool)

(assert (=> b!861952 (= e!480352 (not e!480353))))

(declare-fun res!585515 () Bool)

(assert (=> b!861952 (=> res!585515 e!480353)))

(assert (=> b!861952 (= res!585515 (not (validKeyInArray!0 (select (arr!23784 _keys!868) from!1053))))))

(declare-fun lt!388581 () ListLongMap!9761)

(assert (=> b!861952 (= lt!388581 lt!388578)))

(declare-fun lt!388579 () ListLongMap!9761)

(assert (=> b!861952 (= lt!388578 (+!2300 lt!388579 (tuple2!10991 k0!854 v!557)))))

(assert (=> b!861952 (= lt!388581 (getCurrentListMapNoExtraKeys!2949 _keys!868 lt!388577 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861952 (= lt!388579 (getCurrentListMapNoExtraKeys!2949 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388582 () Unit!29362)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!490 (array!49515 array!49517 (_ BitVec 32) (_ BitVec 32) V!27241 V!27241 (_ BitVec 32) (_ BitVec 64) V!27241 (_ BitVec 32) Int) Unit!29362)

(assert (=> b!861952 (= lt!388582 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!490 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!585518 () Bool)

(assert (=> start!73762 (=> (not res!585518) (not e!480348))))

(assert (=> start!73762 (= res!585518 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24225 _keys!868))))))

(assert (=> start!73762 e!480348))

(assert (=> start!73762 tp_is_empty!16645))

(assert (=> start!73762 true))

(assert (=> start!73762 tp!51032))

(declare-fun array_inv!18872 (array!49515) Bool)

(assert (=> start!73762 (array_inv!18872 _keys!868)))

(declare-fun array_inv!18873 (array!49517) Bool)

(assert (=> start!73762 (and (array_inv!18873 _values!688) e!480354)))

(declare-fun b!861959 () Bool)

(assert (=> b!861959 (= e!480350 tp_is_empty!16645)))

(declare-fun b!861960 () Bool)

(declare-fun res!585517 () Bool)

(assert (=> b!861960 (=> (not res!585517) (not e!480348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861960 (= res!585517 (validMask!0 mask!1196))))

(declare-fun b!861961 () Bool)

(declare-fun res!585519 () Bool)

(assert (=> b!861961 (=> (not res!585519) (not e!480348))))

(assert (=> b!861961 (= res!585519 (and (= (select (arr!23784 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861962 () Bool)

(declare-fun res!585513 () Bool)

(assert (=> b!861962 (=> (not res!585513) (not e!480348))))

(assert (=> b!861962 (= res!585513 (and (= (size!24226 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24225 _keys!868) (size!24226 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73762 res!585518) b!861960))

(assert (= (and b!861960 res!585517) b!861962))

(assert (= (and b!861962 res!585513) b!861955))

(assert (= (and b!861955 res!585516) b!861950))

(assert (= (and b!861950 res!585520) b!861949))

(assert (= (and b!861949 res!585514) b!861948))

(assert (= (and b!861948 res!585511) b!861961))

(assert (= (and b!861961 res!585519) b!861958))

(assert (= (and b!861958 res!585512) b!861952))

(assert (= (and b!861952 (not res!585515)) b!861951))

(assert (= (and b!861951 c!92266) b!861954))

(assert (= (and b!861951 (not c!92266)) b!861953))

(assert (= (and b!861957 condMapEmpty!26567) mapIsEmpty!26567))

(assert (= (and b!861957 (not condMapEmpty!26567)) mapNonEmpty!26567))

(get-info :version)

(assert (= (and mapNonEmpty!26567 ((_ is ValueCellFull!7883) mapValue!26567)) b!861959))

(assert (= (and b!861957 ((_ is ValueCellFull!7883) mapDefault!26567)) b!861956))

(assert (= start!73762 b!861957))

(declare-fun b_lambda!11875 () Bool)

(assert (=> (not b_lambda!11875) (not b!861951)))

(declare-fun t!23596 () Bool)

(declare-fun tb!4623 () Bool)

(assert (=> (and start!73762 (= defaultEntry!696 defaultEntry!696) t!23596) tb!4623))

(declare-fun result!8865 () Bool)

(assert (=> tb!4623 (= result!8865 tp_is_empty!16645)))

(assert (=> b!861951 t!23596))

(declare-fun b_and!24009 () Bool)

(assert (= b_and!24007 (and (=> t!23596 result!8865) b_and!24009)))

(declare-fun m!803195 () Bool)

(assert (=> b!861958 m!803195))

(declare-fun m!803197 () Bool)

(assert (=> b!861958 m!803197))

(declare-fun m!803199 () Bool)

(assert (=> b!861958 m!803199))

(declare-fun m!803201 () Bool)

(assert (=> b!861951 m!803201))

(declare-fun m!803203 () Bool)

(assert (=> b!861951 m!803203))

(declare-fun m!803205 () Bool)

(assert (=> b!861951 m!803205))

(declare-fun m!803207 () Bool)

(assert (=> b!861951 m!803207))

(assert (=> b!861951 m!803203))

(declare-fun m!803209 () Bool)

(assert (=> b!861951 m!803209))

(assert (=> b!861951 m!803205))

(declare-fun m!803211 () Bool)

(assert (=> b!861955 m!803211))

(declare-fun m!803213 () Bool)

(assert (=> mapNonEmpty!26567 m!803213))

(declare-fun m!803215 () Bool)

(assert (=> start!73762 m!803215))

(declare-fun m!803217 () Bool)

(assert (=> start!73762 m!803217))

(declare-fun m!803219 () Bool)

(assert (=> b!861948 m!803219))

(declare-fun m!803221 () Bool)

(assert (=> b!861950 m!803221))

(declare-fun m!803223 () Bool)

(assert (=> b!861954 m!803223))

(declare-fun m!803225 () Bool)

(assert (=> b!861954 m!803225))

(declare-fun m!803227 () Bool)

(assert (=> b!861954 m!803227))

(declare-fun m!803229 () Bool)

(assert (=> b!861954 m!803229))

(declare-fun m!803231 () Bool)

(assert (=> b!861954 m!803231))

(declare-fun m!803233 () Bool)

(assert (=> b!861961 m!803233))

(declare-fun m!803235 () Bool)

(assert (=> b!861952 m!803235))

(declare-fun m!803237 () Bool)

(assert (=> b!861952 m!803237))

(declare-fun m!803239 () Bool)

(assert (=> b!861952 m!803239))

(assert (=> b!861952 m!803209))

(declare-fun m!803241 () Bool)

(assert (=> b!861952 m!803241))

(assert (=> b!861952 m!803209))

(declare-fun m!803243 () Bool)

(assert (=> b!861952 m!803243))

(declare-fun m!803245 () Bool)

(assert (=> b!861960 m!803245))

(check-sat (not b!861955) (not start!73762) (not b!861951) (not b!861950) (not b_lambda!11875) (not b!861958) (not b!861960) (not mapNonEmpty!26567) tp_is_empty!16645 (not b!861954) (not b!861948) (not b_next!14509) (not b!861952) b_and!24009)
(check-sat b_and!24009 (not b_next!14509))
