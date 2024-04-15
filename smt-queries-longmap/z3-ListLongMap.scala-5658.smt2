; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73714 () Bool)

(assert start!73714)

(declare-fun b_free!14647 () Bool)

(declare-fun b_next!14647 () Bool)

(assert (=> start!73714 (= b_free!14647 (not b_next!14647))))

(declare-fun tp!51445 () Bool)

(declare-fun b_and!24247 () Bool)

(assert (=> start!73714 (= tp!51445 b_and!24247)))

(declare-fun b!864186 () Bool)

(declare-fun e!481414 () Bool)

(declare-fun e!481411 () Bool)

(assert (=> b!864186 (= e!481414 e!481411)))

(declare-fun res!587271 () Bool)

(assert (=> b!864186 (=> (not res!587271) (not e!481411))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864186 (= res!587271 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27425 0))(
  ( (V!27426 (val!8439 Int)) )
))
(declare-datatypes ((tuple2!11188 0))(
  ( (tuple2!11189 (_1!5605 (_ BitVec 64)) (_2!5605 V!27425)) )
))
(declare-datatypes ((List!16982 0))(
  ( (Nil!16979) (Cons!16978 (h!18109 tuple2!11188) (t!23886 List!16982)) )
))
(declare-datatypes ((ListLongMap!9947 0))(
  ( (ListLongMap!9948 (toList!4989 List!16982)) )
))
(declare-fun lt!390943 () ListLongMap!9947)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7952 0))(
  ( (ValueCellFull!7952 (v!10858 V!27425)) (EmptyCell!7952) )
))
(declare-datatypes ((array!49719 0))(
  ( (array!49720 (arr!23891 (Array (_ BitVec 32) ValueCell!7952)) (size!24333 (_ BitVec 32))) )
))
(declare-fun lt!390951 () array!49719)

(declare-datatypes ((array!49721 0))(
  ( (array!49722 (arr!23892 (Array (_ BitVec 32) (_ BitVec 64))) (size!24334 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49721)

(declare-fun minValue!654 () V!27425)

(declare-fun zeroValue!654 () V!27425)

(declare-fun getCurrentListMapNoExtraKeys!2988 (array!49721 array!49719 (_ BitVec 32) (_ BitVec 32) V!27425 V!27425 (_ BitVec 32) Int) ListLongMap!9947)

(assert (=> b!864186 (= lt!390943 (getCurrentListMapNoExtraKeys!2988 _keys!868 lt!390951 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27425)

(declare-fun _values!688 () array!49719)

(assert (=> b!864186 (= lt!390951 (array!49720 (store (arr!23891 _values!688) i!612 (ValueCellFull!7952 v!557)) (size!24333 _values!688)))))

(declare-fun lt!390955 () ListLongMap!9947)

(assert (=> b!864186 (= lt!390955 (getCurrentListMapNoExtraKeys!2988 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864187 () Bool)

(declare-fun e!481418 () Bool)

(declare-fun tp_is_empty!16783 () Bool)

(assert (=> b!864187 (= e!481418 tp_is_empty!16783)))

(declare-fun mapIsEmpty!26774 () Bool)

(declare-fun mapRes!26774 () Bool)

(assert (=> mapIsEmpty!26774 mapRes!26774))

(declare-fun b!864188 () Bool)

(declare-fun e!481412 () Bool)

(assert (=> b!864188 (= e!481412 tp_is_empty!16783)))

(declare-fun mapNonEmpty!26774 () Bool)

(declare-fun tp!51446 () Bool)

(assert (=> mapNonEmpty!26774 (= mapRes!26774 (and tp!51446 e!481412))))

(declare-fun mapRest!26774 () (Array (_ BitVec 32) ValueCell!7952))

(declare-fun mapKey!26774 () (_ BitVec 32))

(declare-fun mapValue!26774 () ValueCell!7952)

(assert (=> mapNonEmpty!26774 (= (arr!23891 _values!688) (store mapRest!26774 mapKey!26774 mapValue!26774))))

(declare-fun b!864189 () Bool)

(declare-fun e!481413 () Bool)

(assert (=> b!864189 (= e!481411 (not e!481413))))

(declare-fun res!587267 () Bool)

(assert (=> b!864189 (=> res!587267 e!481413)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864189 (= res!587267 (not (validKeyInArray!0 (select (arr!23892 _keys!868) from!1053))))))

(declare-fun lt!390952 () ListLongMap!9947)

(declare-fun lt!390945 () ListLongMap!9947)

(assert (=> b!864189 (= lt!390952 lt!390945)))

(declare-fun lt!390941 () ListLongMap!9947)

(declare-fun lt!390947 () tuple2!11188)

(declare-fun +!2358 (ListLongMap!9947 tuple2!11188) ListLongMap!9947)

(assert (=> b!864189 (= lt!390945 (+!2358 lt!390941 lt!390947))))

(assert (=> b!864189 (= lt!390952 (getCurrentListMapNoExtraKeys!2988 _keys!868 lt!390951 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!864189 (= lt!390947 (tuple2!11189 k0!854 v!557))))

(assert (=> b!864189 (= lt!390941 (getCurrentListMapNoExtraKeys!2988 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29498 0))(
  ( (Unit!29499) )
))
(declare-fun lt!390956 () Unit!29498)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!537 (array!49721 array!49719 (_ BitVec 32) (_ BitVec 32) V!27425 V!27425 (_ BitVec 32) (_ BitVec 64) V!27425 (_ BitVec 32) Int) Unit!29498)

(assert (=> b!864189 (= lt!390956 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!537 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864190 () Bool)

(declare-fun res!587266 () Bool)

(assert (=> b!864190 (=> (not res!587266) (not e!481414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864190 (= res!587266 (validMask!0 mask!1196))))

(declare-fun b!864191 () Bool)

(declare-fun e!481417 () Bool)

(assert (=> b!864191 (= e!481413 e!481417)))

(declare-fun res!587273 () Bool)

(assert (=> b!864191 (=> res!587273 e!481417)))

(assert (=> b!864191 (= res!587273 (= k0!854 (select (arr!23892 _keys!868) from!1053)))))

(assert (=> b!864191 (not (= (select (arr!23892 _keys!868) from!1053) k0!854))))

(declare-fun lt!390944 () Unit!29498)

(declare-fun e!481416 () Unit!29498)

(assert (=> b!864191 (= lt!390944 e!481416)))

(declare-fun c!92126 () Bool)

(assert (=> b!864191 (= c!92126 (= (select (arr!23892 _keys!868) from!1053) k0!854))))

(declare-fun lt!390954 () ListLongMap!9947)

(assert (=> b!864191 (= lt!390943 lt!390954)))

(declare-fun lt!390953 () tuple2!11188)

(assert (=> b!864191 (= lt!390954 (+!2358 lt!390945 lt!390953))))

(declare-fun lt!390942 () V!27425)

(assert (=> b!864191 (= lt!390953 (tuple2!11189 (select (arr!23892 _keys!868) from!1053) lt!390942))))

(declare-fun get!12622 (ValueCell!7952 V!27425) V!27425)

(declare-fun dynLambda!1159 (Int (_ BitVec 64)) V!27425)

(assert (=> b!864191 (= lt!390942 (get!12622 (select (arr!23891 _values!688) from!1053) (dynLambda!1159 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864192 () Bool)

(declare-fun res!587274 () Bool)

(assert (=> b!864192 (=> (not res!587274) (not e!481414))))

(assert (=> b!864192 (= res!587274 (validKeyInArray!0 k0!854))))

(declare-fun b!864193 () Bool)

(declare-fun res!587268 () Bool)

(assert (=> b!864193 (=> (not res!587268) (not e!481414))))

(assert (=> b!864193 (= res!587268 (and (= (select (arr!23892 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864194 () Bool)

(declare-fun e!481419 () Bool)

(assert (=> b!864194 (= e!481419 (and e!481418 mapRes!26774))))

(declare-fun condMapEmpty!26774 () Bool)

(declare-fun mapDefault!26774 () ValueCell!7952)

(assert (=> b!864194 (= condMapEmpty!26774 (= (arr!23891 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7952)) mapDefault!26774)))))

(declare-fun b!864195 () Bool)

(declare-fun Unit!29500 () Unit!29498)

(assert (=> b!864195 (= e!481416 Unit!29500)))

(declare-fun lt!390946 () Unit!29498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49721 (_ BitVec 32) (_ BitVec 32)) Unit!29498)

(assert (=> b!864195 (= lt!390946 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16983 0))(
  ( (Nil!16980) (Cons!16979 (h!18110 (_ BitVec 64)) (t!23887 List!16983)) )
))
(declare-fun arrayNoDuplicates!0 (array!49721 (_ BitVec 32) List!16983) Bool)

(assert (=> b!864195 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16980)))

(declare-fun lt!390949 () Unit!29498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49721 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29498)

(assert (=> b!864195 (= lt!390949 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864195 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390950 () Unit!29498)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49721 (_ BitVec 64) (_ BitVec 32) List!16983) Unit!29498)

(assert (=> b!864195 (= lt!390950 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16980))))

(assert (=> b!864195 false))

(declare-fun b!864196 () Bool)

(declare-fun res!587265 () Bool)

(assert (=> b!864196 (=> (not res!587265) (not e!481414))))

(assert (=> b!864196 (= res!587265 (and (= (size!24333 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24334 _keys!868) (size!24333 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!587264 () Bool)

(assert (=> start!73714 (=> (not res!587264) (not e!481414))))

(assert (=> start!73714 (= res!587264 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24334 _keys!868))))))

(assert (=> start!73714 e!481414))

(assert (=> start!73714 tp_is_empty!16783))

(assert (=> start!73714 true))

(assert (=> start!73714 tp!51445))

(declare-fun array_inv!18968 (array!49721) Bool)

(assert (=> start!73714 (array_inv!18968 _keys!868)))

(declare-fun array_inv!18969 (array!49719) Bool)

(assert (=> start!73714 (and (array_inv!18969 _values!688) e!481419)))

(declare-fun b!864197 () Bool)

(declare-fun res!587272 () Bool)

(assert (=> b!864197 (=> (not res!587272) (not e!481414))))

(assert (=> b!864197 (= res!587272 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24334 _keys!868))))))

(declare-fun b!864198 () Bool)

(assert (=> b!864198 (= e!481417 true)))

(assert (=> b!864198 (= lt!390954 (+!2358 (+!2358 lt!390941 lt!390953) lt!390947))))

(declare-fun lt!390948 () Unit!29498)

(declare-fun addCommutativeForDiffKeys!501 (ListLongMap!9947 (_ BitVec 64) V!27425 (_ BitVec 64) V!27425) Unit!29498)

(assert (=> b!864198 (= lt!390948 (addCommutativeForDiffKeys!501 lt!390941 k0!854 v!557 (select (arr!23892 _keys!868) from!1053) lt!390942))))

(declare-fun b!864199 () Bool)

(declare-fun Unit!29501 () Unit!29498)

(assert (=> b!864199 (= e!481416 Unit!29501)))

(declare-fun b!864200 () Bool)

(declare-fun res!587269 () Bool)

(assert (=> b!864200 (=> (not res!587269) (not e!481414))))

(assert (=> b!864200 (= res!587269 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16980))))

(declare-fun b!864201 () Bool)

(declare-fun res!587270 () Bool)

(assert (=> b!864201 (=> (not res!587270) (not e!481414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49721 (_ BitVec 32)) Bool)

(assert (=> b!864201 (= res!587270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73714 res!587264) b!864190))

(assert (= (and b!864190 res!587266) b!864196))

(assert (= (and b!864196 res!587265) b!864201))

(assert (= (and b!864201 res!587270) b!864200))

(assert (= (and b!864200 res!587269) b!864197))

(assert (= (and b!864197 res!587272) b!864192))

(assert (= (and b!864192 res!587274) b!864193))

(assert (= (and b!864193 res!587268) b!864186))

(assert (= (and b!864186 res!587271) b!864189))

(assert (= (and b!864189 (not res!587267)) b!864191))

(assert (= (and b!864191 c!92126) b!864195))

(assert (= (and b!864191 (not c!92126)) b!864199))

(assert (= (and b!864191 (not res!587273)) b!864198))

(assert (= (and b!864194 condMapEmpty!26774) mapIsEmpty!26774))

(assert (= (and b!864194 (not condMapEmpty!26774)) mapNonEmpty!26774))

(get-info :version)

(assert (= (and mapNonEmpty!26774 ((_ is ValueCellFull!7952) mapValue!26774)) b!864188))

(assert (= (and b!864194 ((_ is ValueCellFull!7952) mapDefault!26774)) b!864187))

(assert (= start!73714 b!864194))

(declare-fun b_lambda!11981 () Bool)

(assert (=> (not b_lambda!11981) (not b!864191)))

(declare-fun t!23885 () Bool)

(declare-fun tb!4761 () Bool)

(assert (=> (and start!73714 (= defaultEntry!696 defaultEntry!696) t!23885) tb!4761))

(declare-fun result!9141 () Bool)

(assert (=> tb!4761 (= result!9141 tp_is_empty!16783)))

(assert (=> b!864191 t!23885))

(declare-fun b_and!24249 () Bool)

(assert (= b_and!24247 (and (=> t!23885 result!9141) b_and!24249)))

(declare-fun m!805005 () Bool)

(assert (=> b!864186 m!805005))

(declare-fun m!805007 () Bool)

(assert (=> b!864186 m!805007))

(declare-fun m!805009 () Bool)

(assert (=> b!864186 m!805009))

(declare-fun m!805011 () Bool)

(assert (=> b!864201 m!805011))

(declare-fun m!805013 () Bool)

(assert (=> mapNonEmpty!26774 m!805013))

(declare-fun m!805015 () Bool)

(assert (=> b!864190 m!805015))

(declare-fun m!805017 () Bool)

(assert (=> b!864191 m!805017))

(declare-fun m!805019 () Bool)

(assert (=> b!864191 m!805019))

(declare-fun m!805021 () Bool)

(assert (=> b!864191 m!805021))

(declare-fun m!805023 () Bool)

(assert (=> b!864191 m!805023))

(assert (=> b!864191 m!805019))

(declare-fun m!805025 () Bool)

(assert (=> b!864191 m!805025))

(assert (=> b!864191 m!805021))

(declare-fun m!805027 () Bool)

(assert (=> b!864192 m!805027))

(declare-fun m!805029 () Bool)

(assert (=> b!864200 m!805029))

(declare-fun m!805031 () Bool)

(assert (=> start!73714 m!805031))

(declare-fun m!805033 () Bool)

(assert (=> start!73714 m!805033))

(declare-fun m!805035 () Bool)

(assert (=> b!864189 m!805035))

(declare-fun m!805037 () Bool)

(assert (=> b!864189 m!805037))

(declare-fun m!805039 () Bool)

(assert (=> b!864189 m!805039))

(assert (=> b!864189 m!805025))

(declare-fun m!805041 () Bool)

(assert (=> b!864189 m!805041))

(assert (=> b!864189 m!805025))

(declare-fun m!805043 () Bool)

(assert (=> b!864189 m!805043))

(declare-fun m!805045 () Bool)

(assert (=> b!864193 m!805045))

(declare-fun m!805047 () Bool)

(assert (=> b!864195 m!805047))

(declare-fun m!805049 () Bool)

(assert (=> b!864195 m!805049))

(declare-fun m!805051 () Bool)

(assert (=> b!864195 m!805051))

(declare-fun m!805053 () Bool)

(assert (=> b!864195 m!805053))

(declare-fun m!805055 () Bool)

(assert (=> b!864195 m!805055))

(declare-fun m!805057 () Bool)

(assert (=> b!864198 m!805057))

(assert (=> b!864198 m!805057))

(declare-fun m!805059 () Bool)

(assert (=> b!864198 m!805059))

(assert (=> b!864198 m!805025))

(assert (=> b!864198 m!805025))

(declare-fun m!805061 () Bool)

(assert (=> b!864198 m!805061))

(check-sat (not b!864200) (not mapNonEmpty!26774) tp_is_empty!16783 (not b!864198) (not b_next!14647) (not b_lambda!11981) (not b!864195) (not b!864190) (not b!864201) (not b!864189) (not b!864186) b_and!24249 (not b!864191) (not start!73714) (not b!864192))
(check-sat b_and!24249 (not b_next!14647))
