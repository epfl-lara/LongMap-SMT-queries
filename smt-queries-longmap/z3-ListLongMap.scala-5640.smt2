; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73606 () Bool)

(assert start!73606)

(declare-fun b_free!14539 () Bool)

(declare-fun b_next!14539 () Bool)

(assert (=> start!73606 (= b_free!14539 (not b_next!14539))))

(declare-fun tp!51122 () Bool)

(declare-fun b_and!24031 () Bool)

(assert (=> start!73606 (= tp!51122 b_and!24031)))

(declare-fun b!861512 () Bool)

(declare-fun res!585514 () Bool)

(declare-fun e!479985 () Bool)

(assert (=> b!861512 (=> (not res!585514) (not e!479985))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861512 (= res!585514 (validKeyInArray!0 k0!854))))

(declare-fun b!861513 () Bool)

(declare-datatypes ((Unit!29328 0))(
  ( (Unit!29329) )
))
(declare-fun e!479983 () Unit!29328)

(declare-fun Unit!29330 () Unit!29328)

(assert (=> b!861513 (= e!479983 Unit!29330)))

(declare-fun b!861514 () Bool)

(declare-fun res!585513 () Bool)

(assert (=> b!861514 (=> (not res!585513) (not e!479985))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49505 0))(
  ( (array!49506 (arr!23784 (Array (_ BitVec 32) (_ BitVec 64))) (size!24226 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49505)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861514 (= res!585513 (and (= (select (arr!23784 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861515 () Bool)

(declare-fun e!479981 () Bool)

(assert (=> b!861515 (= e!479985 e!479981)))

(declare-fun res!585508 () Bool)

(assert (=> b!861515 (=> (not res!585508) (not e!479981))))

(assert (=> b!861515 (= res!585508 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27281 0))(
  ( (V!27282 (val!8385 Int)) )
))
(declare-datatypes ((ValueCell!7898 0))(
  ( (ValueCellFull!7898 (v!10804 V!27281)) (EmptyCell!7898) )
))
(declare-datatypes ((array!49507 0))(
  ( (array!49508 (arr!23785 (Array (_ BitVec 32) ValueCell!7898)) (size!24227 (_ BitVec 32))) )
))
(declare-fun lt!388474 () array!49507)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11096 0))(
  ( (tuple2!11097 (_1!5559 (_ BitVec 64)) (_2!5559 V!27281)) )
))
(declare-datatypes ((List!16894 0))(
  ( (Nil!16891) (Cons!16890 (h!18021 tuple2!11096) (t!23690 List!16894)) )
))
(declare-datatypes ((ListLongMap!9855 0))(
  ( (ListLongMap!9856 (toList!4943 List!16894)) )
))
(declare-fun lt!388476 () ListLongMap!9855)

(declare-fun minValue!654 () V!27281)

(declare-fun zeroValue!654 () V!27281)

(declare-fun getCurrentListMapNoExtraKeys!2946 (array!49505 array!49507 (_ BitVec 32) (_ BitVec 32) V!27281 V!27281 (_ BitVec 32) Int) ListLongMap!9855)

(assert (=> b!861515 (= lt!388476 (getCurrentListMapNoExtraKeys!2946 _keys!868 lt!388474 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27281)

(declare-fun _values!688 () array!49507)

(assert (=> b!861515 (= lt!388474 (array!49508 (store (arr!23785 _values!688) i!612 (ValueCellFull!7898 v!557)) (size!24227 _values!688)))))

(declare-fun lt!388477 () ListLongMap!9855)

(assert (=> b!861515 (= lt!388477 (getCurrentListMapNoExtraKeys!2946 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861516 () Bool)

(declare-fun res!585510 () Bool)

(assert (=> b!861516 (=> (not res!585510) (not e!479985))))

(assert (=> b!861516 (= res!585510 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24226 _keys!868))))))

(declare-fun b!861517 () Bool)

(declare-fun e!479980 () Bool)

(assert (=> b!861517 (= e!479980 true)))

(assert (=> b!861517 (not (= (select (arr!23784 _keys!868) from!1053) k0!854))))

(declare-fun lt!388475 () Unit!29328)

(assert (=> b!861517 (= lt!388475 e!479983)))

(declare-fun c!91964 () Bool)

(assert (=> b!861517 (= c!91964 (= (select (arr!23784 _keys!868) from!1053) k0!854))))

(declare-fun lt!388484 () ListLongMap!9855)

(declare-fun +!2312 (ListLongMap!9855 tuple2!11096) ListLongMap!9855)

(declare-fun get!12548 (ValueCell!7898 V!27281) V!27281)

(declare-fun dynLambda!1121 (Int (_ BitVec 64)) V!27281)

(assert (=> b!861517 (= lt!388476 (+!2312 lt!388484 (tuple2!11097 (select (arr!23784 _keys!868) from!1053) (get!12548 (select (arr!23785 _values!688) from!1053) (dynLambda!1121 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861518 () Bool)

(declare-fun Unit!29331 () Unit!29328)

(assert (=> b!861518 (= e!479983 Unit!29331)))

(declare-fun lt!388482 () Unit!29328)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49505 (_ BitVec 32) (_ BitVec 32)) Unit!29328)

(assert (=> b!861518 (= lt!388482 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16895 0))(
  ( (Nil!16892) (Cons!16891 (h!18022 (_ BitVec 64)) (t!23691 List!16895)) )
))
(declare-fun arrayNoDuplicates!0 (array!49505 (_ BitVec 32) List!16895) Bool)

(assert (=> b!861518 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16892)))

(declare-fun lt!388480 () Unit!29328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29328)

(assert (=> b!861518 (= lt!388480 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861518 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388479 () Unit!29328)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49505 (_ BitVec 64) (_ BitVec 32) List!16895) Unit!29328)

(assert (=> b!861518 (= lt!388479 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16892))))

(assert (=> b!861518 false))

(declare-fun b!861519 () Bool)

(declare-fun e!479978 () Bool)

(declare-fun tp_is_empty!16675 () Bool)

(assert (=> b!861519 (= e!479978 tp_is_empty!16675)))

(declare-fun b!861520 () Bool)

(declare-fun res!585509 () Bool)

(assert (=> b!861520 (=> (not res!585509) (not e!479985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861520 (= res!585509 (validMask!0 mask!1196))))

(declare-fun b!861521 () Bool)

(declare-fun e!479984 () Bool)

(assert (=> b!861521 (= e!479984 tp_is_empty!16675)))

(declare-fun b!861522 () Bool)

(declare-fun res!585512 () Bool)

(assert (=> b!861522 (=> (not res!585512) (not e!479985))))

(assert (=> b!861522 (= res!585512 (and (= (size!24227 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24226 _keys!868) (size!24227 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861511 () Bool)

(assert (=> b!861511 (= e!479981 (not e!479980))))

(declare-fun res!585515 () Bool)

(assert (=> b!861511 (=> res!585515 e!479980)))

(assert (=> b!861511 (= res!585515 (not (validKeyInArray!0 (select (arr!23784 _keys!868) from!1053))))))

(declare-fun lt!388481 () ListLongMap!9855)

(assert (=> b!861511 (= lt!388481 lt!388484)))

(declare-fun lt!388483 () ListLongMap!9855)

(assert (=> b!861511 (= lt!388484 (+!2312 lt!388483 (tuple2!11097 k0!854 v!557)))))

(assert (=> b!861511 (= lt!388481 (getCurrentListMapNoExtraKeys!2946 _keys!868 lt!388474 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861511 (= lt!388483 (getCurrentListMapNoExtraKeys!2946 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388478 () Unit!29328)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!502 (array!49505 array!49507 (_ BitVec 32) (_ BitVec 32) V!27281 V!27281 (_ BitVec 32) (_ BitVec 64) V!27281 (_ BitVec 32) Int) Unit!29328)

(assert (=> b!861511 (= lt!388478 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!502 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!585511 () Bool)

(assert (=> start!73606 (=> (not res!585511) (not e!479985))))

(assert (=> start!73606 (= res!585511 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24226 _keys!868))))))

(assert (=> start!73606 e!479985))

(assert (=> start!73606 tp_is_empty!16675))

(assert (=> start!73606 true))

(assert (=> start!73606 tp!51122))

(declare-fun array_inv!18894 (array!49505) Bool)

(assert (=> start!73606 (array_inv!18894 _keys!868)))

(declare-fun e!479979 () Bool)

(declare-fun array_inv!18895 (array!49507) Bool)

(assert (=> start!73606 (and (array_inv!18895 _values!688) e!479979)))

(declare-fun mapIsEmpty!26612 () Bool)

(declare-fun mapRes!26612 () Bool)

(assert (=> mapIsEmpty!26612 mapRes!26612))

(declare-fun b!861523 () Bool)

(declare-fun res!585507 () Bool)

(assert (=> b!861523 (=> (not res!585507) (not e!479985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49505 (_ BitVec 32)) Bool)

(assert (=> b!861523 (= res!585507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26612 () Bool)

(declare-fun tp!51121 () Bool)

(assert (=> mapNonEmpty!26612 (= mapRes!26612 (and tp!51121 e!479984))))

(declare-fun mapRest!26612 () (Array (_ BitVec 32) ValueCell!7898))

(declare-fun mapValue!26612 () ValueCell!7898)

(declare-fun mapKey!26612 () (_ BitVec 32))

(assert (=> mapNonEmpty!26612 (= (arr!23785 _values!688) (store mapRest!26612 mapKey!26612 mapValue!26612))))

(declare-fun b!861524 () Bool)

(declare-fun res!585516 () Bool)

(assert (=> b!861524 (=> (not res!585516) (not e!479985))))

(assert (=> b!861524 (= res!585516 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16892))))

(declare-fun b!861525 () Bool)

(assert (=> b!861525 (= e!479979 (and e!479978 mapRes!26612))))

(declare-fun condMapEmpty!26612 () Bool)

(declare-fun mapDefault!26612 () ValueCell!7898)

(assert (=> b!861525 (= condMapEmpty!26612 (= (arr!23785 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7898)) mapDefault!26612)))))

(assert (= (and start!73606 res!585511) b!861520))

(assert (= (and b!861520 res!585509) b!861522))

(assert (= (and b!861522 res!585512) b!861523))

(assert (= (and b!861523 res!585507) b!861524))

(assert (= (and b!861524 res!585516) b!861516))

(assert (= (and b!861516 res!585510) b!861512))

(assert (= (and b!861512 res!585514) b!861514))

(assert (= (and b!861514 res!585513) b!861515))

(assert (= (and b!861515 res!585508) b!861511))

(assert (= (and b!861511 (not res!585515)) b!861517))

(assert (= (and b!861517 c!91964) b!861518))

(assert (= (and b!861517 (not c!91964)) b!861513))

(assert (= (and b!861525 condMapEmpty!26612) mapIsEmpty!26612))

(assert (= (and b!861525 (not condMapEmpty!26612)) mapNonEmpty!26612))

(get-info :version)

(assert (= (and mapNonEmpty!26612 ((_ is ValueCellFull!7898) mapValue!26612)) b!861521))

(assert (= (and b!861525 ((_ is ValueCellFull!7898) mapDefault!26612)) b!861519))

(assert (= start!73606 b!861525))

(declare-fun b_lambda!11873 () Bool)

(assert (=> (not b_lambda!11873) (not b!861517)))

(declare-fun t!23689 () Bool)

(declare-fun tb!4653 () Bool)

(assert (=> (and start!73606 (= defaultEntry!696 defaultEntry!696) t!23689) tb!4653))

(declare-fun result!8925 () Bool)

(assert (=> tb!4653 (= result!8925 tp_is_empty!16675)))

(assert (=> b!861517 t!23689))

(declare-fun b_and!24033 () Bool)

(assert (= b_and!24031 (and (=> t!23689 result!8925) b_and!24033)))

(declare-fun m!801927 () Bool)

(assert (=> b!861517 m!801927))

(declare-fun m!801929 () Bool)

(assert (=> b!861517 m!801929))

(declare-fun m!801931 () Bool)

(assert (=> b!861517 m!801931))

(assert (=> b!861517 m!801927))

(declare-fun m!801933 () Bool)

(assert (=> b!861517 m!801933))

(declare-fun m!801935 () Bool)

(assert (=> b!861517 m!801935))

(assert (=> b!861517 m!801929))

(declare-fun m!801937 () Bool)

(assert (=> b!861520 m!801937))

(declare-fun m!801939 () Bool)

(assert (=> b!861511 m!801939))

(declare-fun m!801941 () Bool)

(assert (=> b!861511 m!801941))

(assert (=> b!861511 m!801935))

(declare-fun m!801943 () Bool)

(assert (=> b!861511 m!801943))

(assert (=> b!861511 m!801935))

(declare-fun m!801945 () Bool)

(assert (=> b!861511 m!801945))

(declare-fun m!801947 () Bool)

(assert (=> b!861511 m!801947))

(declare-fun m!801949 () Bool)

(assert (=> mapNonEmpty!26612 m!801949))

(declare-fun m!801951 () Bool)

(assert (=> start!73606 m!801951))

(declare-fun m!801953 () Bool)

(assert (=> start!73606 m!801953))

(declare-fun m!801955 () Bool)

(assert (=> b!861518 m!801955))

(declare-fun m!801957 () Bool)

(assert (=> b!861518 m!801957))

(declare-fun m!801959 () Bool)

(assert (=> b!861518 m!801959))

(declare-fun m!801961 () Bool)

(assert (=> b!861518 m!801961))

(declare-fun m!801963 () Bool)

(assert (=> b!861518 m!801963))

(declare-fun m!801965 () Bool)

(assert (=> b!861523 m!801965))

(declare-fun m!801967 () Bool)

(assert (=> b!861515 m!801967))

(declare-fun m!801969 () Bool)

(assert (=> b!861515 m!801969))

(declare-fun m!801971 () Bool)

(assert (=> b!861515 m!801971))

(declare-fun m!801973 () Bool)

(assert (=> b!861514 m!801973))

(declare-fun m!801975 () Bool)

(assert (=> b!861512 m!801975))

(declare-fun m!801977 () Bool)

(assert (=> b!861524 m!801977))

(check-sat b_and!24033 (not b!861524) tp_is_empty!16675 (not b!861511) (not start!73606) (not b!861520) (not b_lambda!11873) (not b!861517) (not b_next!14539) (not mapNonEmpty!26612) (not b!861512) (not b!861515) (not b!861523) (not b!861518))
(check-sat b_and!24033 (not b_next!14539))
