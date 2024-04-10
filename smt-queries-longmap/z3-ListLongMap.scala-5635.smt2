; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73596 () Bool)

(assert start!73596)

(declare-fun b_free!14511 () Bool)

(declare-fun b_next!14511 () Bool)

(assert (=> start!73596 (= b_free!14511 (not b_next!14511))))

(declare-fun tp!51037 () Bool)

(declare-fun b_and!24001 () Bool)

(assert (=> start!73596 (= tp!51037 b_and!24001)))

(declare-fun b!861092 () Bool)

(declare-fun e!479795 () Bool)

(assert (=> b!861092 (= e!479795 true)))

(declare-datatypes ((array!49464 0))(
  ( (array!49465 (arr!23763 (Array (_ BitVec 32) (_ BitVec 64))) (size!24203 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49464)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!861092 (not (= (select (arr!23763 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29362 0))(
  ( (Unit!29363) )
))
(declare-fun lt!388258 () Unit!29362)

(declare-fun e!479791 () Unit!29362)

(assert (=> b!861092 (= lt!388258 e!479791)))

(declare-fun c!91987 () Bool)

(assert (=> b!861092 (= c!91987 (= (select (arr!23763 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27243 0))(
  ( (V!27244 (val!8371 Int)) )
))
(declare-datatypes ((tuple2!11062 0))(
  ( (tuple2!11063 (_1!5542 (_ BitVec 64)) (_2!5542 V!27243)) )
))
(declare-datatypes ((List!16872 0))(
  ( (Nil!16869) (Cons!16868 (h!17999 tuple2!11062) (t!23649 List!16872)) )
))
(declare-datatypes ((ListLongMap!9831 0))(
  ( (ListLongMap!9832 (toList!4931 List!16872)) )
))
(declare-fun lt!388248 () ListLongMap!9831)

(declare-fun lt!388250 () ListLongMap!9831)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7884 0))(
  ( (ValueCellFull!7884 (v!10796 V!27243)) (EmptyCell!7884) )
))
(declare-datatypes ((array!49466 0))(
  ( (array!49467 (arr!23764 (Array (_ BitVec 32) ValueCell!7884)) (size!24204 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49466)

(declare-fun +!2282 (ListLongMap!9831 tuple2!11062) ListLongMap!9831)

(declare-fun get!12532 (ValueCell!7884 V!27243) V!27243)

(declare-fun dynLambda!1118 (Int (_ BitVec 64)) V!27243)

(assert (=> b!861092 (= lt!388248 (+!2282 lt!388250 (tuple2!11063 (select (arr!23763 _keys!868) from!1053) (get!12532 (select (arr!23764 _values!688) from!1053) (dynLambda!1118 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861093 () Bool)

(declare-fun res!585199 () Bool)

(declare-fun e!479793 () Bool)

(assert (=> b!861093 (=> (not res!585199) (not e!479793))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861093 (= res!585199 (validMask!0 mask!1196))))

(declare-fun b!861094 () Bool)

(declare-fun e!479794 () Bool)

(assert (=> b!861094 (= e!479794 (not e!479795))))

(declare-fun res!585198 () Bool)

(assert (=> b!861094 (=> res!585198 e!479795)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861094 (= res!585198 (not (validKeyInArray!0 (select (arr!23763 _keys!868) from!1053))))))

(declare-fun lt!388249 () ListLongMap!9831)

(assert (=> b!861094 (= lt!388249 lt!388250)))

(declare-fun v!557 () V!27243)

(declare-fun lt!388253 () ListLongMap!9831)

(assert (=> b!861094 (= lt!388250 (+!2282 lt!388253 (tuple2!11063 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!388256 () array!49466)

(declare-fun minValue!654 () V!27243)

(declare-fun zeroValue!654 () V!27243)

(declare-fun getCurrentListMapNoExtraKeys!2908 (array!49464 array!49466 (_ BitVec 32) (_ BitVec 32) V!27243 V!27243 (_ BitVec 32) Int) ListLongMap!9831)

(assert (=> b!861094 (= lt!388249 (getCurrentListMapNoExtraKeys!2908 _keys!868 lt!388256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861094 (= lt!388253 (getCurrentListMapNoExtraKeys!2908 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388254 () Unit!29362)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!494 (array!49464 array!49466 (_ BitVec 32) (_ BitVec 32) V!27243 V!27243 (_ BitVec 32) (_ BitVec 64) V!27243 (_ BitVec 32) Int) Unit!29362)

(assert (=> b!861094 (= lt!388254 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!494 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861095 () Bool)

(declare-fun res!585201 () Bool)

(assert (=> b!861095 (=> (not res!585201) (not e!479793))))

(declare-datatypes ((List!16873 0))(
  ( (Nil!16870) (Cons!16869 (h!18000 (_ BitVec 64)) (t!23650 List!16873)) )
))
(declare-fun arrayNoDuplicates!0 (array!49464 (_ BitVec 32) List!16873) Bool)

(assert (=> b!861095 (= res!585201 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16870))))

(declare-fun b!861096 () Bool)

(declare-fun e!479796 () Bool)

(declare-fun e!479797 () Bool)

(declare-fun mapRes!26570 () Bool)

(assert (=> b!861096 (= e!479796 (and e!479797 mapRes!26570))))

(declare-fun condMapEmpty!26570 () Bool)

(declare-fun mapDefault!26570 () ValueCell!7884)

(assert (=> b!861096 (= condMapEmpty!26570 (= (arr!23764 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7884)) mapDefault!26570)))))

(declare-fun b!861097 () Bool)

(declare-fun res!585200 () Bool)

(assert (=> b!861097 (=> (not res!585200) (not e!479793))))

(assert (=> b!861097 (= res!585200 (and (= (size!24204 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24203 _keys!868) (size!24204 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26570 () Bool)

(declare-fun tp!51036 () Bool)

(declare-fun e!479792 () Bool)

(assert (=> mapNonEmpty!26570 (= mapRes!26570 (and tp!51036 e!479792))))

(declare-fun mapRest!26570 () (Array (_ BitVec 32) ValueCell!7884))

(declare-fun mapKey!26570 () (_ BitVec 32))

(declare-fun mapValue!26570 () ValueCell!7884)

(assert (=> mapNonEmpty!26570 (= (arr!23764 _values!688) (store mapRest!26570 mapKey!26570 mapValue!26570))))

(declare-fun b!861098 () Bool)

(declare-fun tp_is_empty!16647 () Bool)

(assert (=> b!861098 (= e!479792 tp_is_empty!16647)))

(declare-fun b!861099 () Bool)

(declare-fun res!585197 () Bool)

(assert (=> b!861099 (=> (not res!585197) (not e!479793))))

(assert (=> b!861099 (= res!585197 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24203 _keys!868))))))

(declare-fun b!861100 () Bool)

(assert (=> b!861100 (= e!479797 tp_is_empty!16647)))

(declare-fun b!861101 () Bool)

(assert (=> b!861101 (= e!479793 e!479794)))

(declare-fun res!585203 () Bool)

(assert (=> b!861101 (=> (not res!585203) (not e!479794))))

(assert (=> b!861101 (= res!585203 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861101 (= lt!388248 (getCurrentListMapNoExtraKeys!2908 _keys!868 lt!388256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861101 (= lt!388256 (array!49467 (store (arr!23764 _values!688) i!612 (ValueCellFull!7884 v!557)) (size!24204 _values!688)))))

(declare-fun lt!388257 () ListLongMap!9831)

(assert (=> b!861101 (= lt!388257 (getCurrentListMapNoExtraKeys!2908 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861102 () Bool)

(declare-fun Unit!29364 () Unit!29362)

(assert (=> b!861102 (= e!479791 Unit!29364)))

(declare-fun lt!388255 () Unit!29362)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49464 (_ BitVec 32) (_ BitVec 32)) Unit!29362)

(assert (=> b!861102 (= lt!388255 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861102 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16870)))

(declare-fun lt!388252 () Unit!29362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29362)

(assert (=> b!861102 (= lt!388252 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861102 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388251 () Unit!29362)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49464 (_ BitVec 64) (_ BitVec 32) List!16873) Unit!29362)

(assert (=> b!861102 (= lt!388251 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16870))))

(assert (=> b!861102 false))

(declare-fun res!585204 () Bool)

(assert (=> start!73596 (=> (not res!585204) (not e!479793))))

(assert (=> start!73596 (= res!585204 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24203 _keys!868))))))

(assert (=> start!73596 e!479793))

(assert (=> start!73596 tp_is_empty!16647))

(assert (=> start!73596 true))

(assert (=> start!73596 tp!51037))

(declare-fun array_inv!18808 (array!49464) Bool)

(assert (=> start!73596 (array_inv!18808 _keys!868)))

(declare-fun array_inv!18809 (array!49466) Bool)

(assert (=> start!73596 (and (array_inv!18809 _values!688) e!479796)))

(declare-fun b!861103 () Bool)

(declare-fun res!585202 () Bool)

(assert (=> b!861103 (=> (not res!585202) (not e!479793))))

(assert (=> b!861103 (= res!585202 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26570 () Bool)

(assert (=> mapIsEmpty!26570 mapRes!26570))

(declare-fun b!861104 () Bool)

(declare-fun res!585205 () Bool)

(assert (=> b!861104 (=> (not res!585205) (not e!479793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49464 (_ BitVec 32)) Bool)

(assert (=> b!861104 (= res!585205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861105 () Bool)

(declare-fun Unit!29365 () Unit!29362)

(assert (=> b!861105 (= e!479791 Unit!29365)))

(declare-fun b!861106 () Bool)

(declare-fun res!585206 () Bool)

(assert (=> b!861106 (=> (not res!585206) (not e!479793))))

(assert (=> b!861106 (= res!585206 (and (= (select (arr!23763 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73596 res!585204) b!861093))

(assert (= (and b!861093 res!585199) b!861097))

(assert (= (and b!861097 res!585200) b!861104))

(assert (= (and b!861104 res!585205) b!861095))

(assert (= (and b!861095 res!585201) b!861099))

(assert (= (and b!861099 res!585197) b!861103))

(assert (= (and b!861103 res!585202) b!861106))

(assert (= (and b!861106 res!585206) b!861101))

(assert (= (and b!861101 res!585203) b!861094))

(assert (= (and b!861094 (not res!585198)) b!861092))

(assert (= (and b!861092 c!91987) b!861102))

(assert (= (and b!861092 (not c!91987)) b!861105))

(assert (= (and b!861096 condMapEmpty!26570) mapIsEmpty!26570))

(assert (= (and b!861096 (not condMapEmpty!26570)) mapNonEmpty!26570))

(get-info :version)

(assert (= (and mapNonEmpty!26570 ((_ is ValueCellFull!7884) mapValue!26570)) b!861098))

(assert (= (and b!861096 ((_ is ValueCellFull!7884) mapDefault!26570)) b!861100))

(assert (= start!73596 b!861096))

(declare-fun b_lambda!11863 () Bool)

(assert (=> (not b_lambda!11863) (not b!861092)))

(declare-fun t!23648 () Bool)

(declare-fun tb!4633 () Bool)

(assert (=> (and start!73596 (= defaultEntry!696 defaultEntry!696) t!23648) tb!4633))

(declare-fun result!8877 () Bool)

(assert (=> tb!4633 (= result!8877 tp_is_empty!16647)))

(assert (=> b!861092 t!23648))

(declare-fun b_and!24003 () Bool)

(assert (= b_and!24001 (and (=> t!23648 result!8877) b_and!24003)))

(declare-fun m!801957 () Bool)

(assert (=> b!861103 m!801957))

(declare-fun m!801959 () Bool)

(assert (=> b!861101 m!801959))

(declare-fun m!801961 () Bool)

(assert (=> b!861101 m!801961))

(declare-fun m!801963 () Bool)

(assert (=> b!861101 m!801963))

(declare-fun m!801965 () Bool)

(assert (=> mapNonEmpty!26570 m!801965))

(declare-fun m!801967 () Bool)

(assert (=> b!861093 m!801967))

(declare-fun m!801969 () Bool)

(assert (=> b!861095 m!801969))

(declare-fun m!801971 () Bool)

(assert (=> b!861102 m!801971))

(declare-fun m!801973 () Bool)

(assert (=> b!861102 m!801973))

(declare-fun m!801975 () Bool)

(assert (=> b!861102 m!801975))

(declare-fun m!801977 () Bool)

(assert (=> b!861102 m!801977))

(declare-fun m!801979 () Bool)

(assert (=> b!861102 m!801979))

(declare-fun m!801981 () Bool)

(assert (=> start!73596 m!801981))

(declare-fun m!801983 () Bool)

(assert (=> start!73596 m!801983))

(declare-fun m!801985 () Bool)

(assert (=> b!861106 m!801985))

(declare-fun m!801987 () Bool)

(assert (=> b!861104 m!801987))

(declare-fun m!801989 () Bool)

(assert (=> b!861092 m!801989))

(declare-fun m!801991 () Bool)

(assert (=> b!861092 m!801991))

(declare-fun m!801993 () Bool)

(assert (=> b!861092 m!801993))

(declare-fun m!801995 () Bool)

(assert (=> b!861092 m!801995))

(assert (=> b!861092 m!801991))

(declare-fun m!801997 () Bool)

(assert (=> b!861092 m!801997))

(assert (=> b!861092 m!801993))

(declare-fun m!801999 () Bool)

(assert (=> b!861094 m!801999))

(declare-fun m!802001 () Bool)

(assert (=> b!861094 m!802001))

(assert (=> b!861094 m!801997))

(declare-fun m!802003 () Bool)

(assert (=> b!861094 m!802003))

(assert (=> b!861094 m!801997))

(declare-fun m!802005 () Bool)

(assert (=> b!861094 m!802005))

(declare-fun m!802007 () Bool)

(assert (=> b!861094 m!802007))

(check-sat (not b!861094) (not b!861102) (not b!861093) (not b!861104) (not b!861092) (not b!861095) (not b!861101) (not start!73596) tp_is_empty!16647 (not b_next!14511) (not b_lambda!11863) (not mapNonEmpty!26570) (not b!861103) b_and!24003)
(check-sat b_and!24003 (not b_next!14511))
