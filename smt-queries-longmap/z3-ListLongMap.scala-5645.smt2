; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73636 () Bool)

(assert start!73636)

(declare-fun b_free!14569 () Bool)

(declare-fun b_next!14569 () Bool)

(assert (=> start!73636 (= b_free!14569 (not b_next!14569))))

(declare-fun tp!51212 () Bool)

(declare-fun b_and!24091 () Bool)

(assert (=> start!73636 (= tp!51212 b_and!24091)))

(declare-fun b!862236 () Bool)

(declare-fun e!480364 () Bool)

(declare-fun e!480363 () Bool)

(assert (=> b!862236 (= e!480364 (not e!480363))))

(declare-fun res!585981 () Bool)

(assert (=> b!862236 (=> res!585981 e!480363)))

(declare-datatypes ((array!49563 0))(
  ( (array!49564 (arr!23813 (Array (_ BitVec 32) (_ BitVec 64))) (size!24255 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49563)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862236 (= res!585981 (not (validKeyInArray!0 (select (arr!23813 _keys!868) from!1053))))))

(declare-datatypes ((V!27321 0))(
  ( (V!27322 (val!8400 Int)) )
))
(declare-datatypes ((tuple2!11122 0))(
  ( (tuple2!11123 (_1!5572 (_ BitVec 64)) (_2!5572 V!27321)) )
))
(declare-datatypes ((List!16918 0))(
  ( (Nil!16915) (Cons!16914 (h!18045 tuple2!11122) (t!23744 List!16918)) )
))
(declare-datatypes ((ListLongMap!9881 0))(
  ( (ListLongMap!9882 (toList!4956 List!16918)) )
))
(declare-fun lt!389077 () ListLongMap!9881)

(declare-fun lt!389072 () ListLongMap!9881)

(assert (=> b!862236 (= lt!389077 lt!389072)))

(declare-fun lt!389083 () ListLongMap!9881)

(declare-fun lt!389070 () tuple2!11122)

(declare-fun +!2325 (ListLongMap!9881 tuple2!11122) ListLongMap!9881)

(assert (=> b!862236 (= lt!389072 (+!2325 lt!389083 lt!389070))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27321)

(declare-fun zeroValue!654 () V!27321)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7913 0))(
  ( (ValueCellFull!7913 (v!10819 V!27321)) (EmptyCell!7913) )
))
(declare-datatypes ((array!49565 0))(
  ( (array!49566 (arr!23814 (Array (_ BitVec 32) ValueCell!7913)) (size!24256 (_ BitVec 32))) )
))
(declare-fun lt!389079 () array!49565)

(declare-fun getCurrentListMapNoExtraKeys!2958 (array!49563 array!49565 (_ BitVec 32) (_ BitVec 32) V!27321 V!27321 (_ BitVec 32) Int) ListLongMap!9881)

(assert (=> b!862236 (= lt!389077 (getCurrentListMapNoExtraKeys!2958 _keys!868 lt!389079 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27321)

(assert (=> b!862236 (= lt!389070 (tuple2!11123 k0!854 v!557))))

(declare-fun _values!688 () array!49565)

(assert (=> b!862236 (= lt!389083 (getCurrentListMapNoExtraKeys!2958 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29373 0))(
  ( (Unit!29374) )
))
(declare-fun lt!389084 () Unit!29373)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!512 (array!49563 array!49565 (_ BitVec 32) (_ BitVec 32) V!27321 V!27321 (_ BitVec 32) (_ BitVec 64) V!27321 (_ BitVec 32) Int) Unit!29373)

(assert (=> b!862236 (= lt!389084 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!512 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862237 () Bool)

(declare-fun e!480360 () Bool)

(declare-fun tp_is_empty!16705 () Bool)

(assert (=> b!862237 (= e!480360 tp_is_empty!16705)))

(declare-fun b!862238 () Bool)

(declare-fun res!585986 () Bool)

(declare-fun e!480358 () Bool)

(assert (=> b!862238 (=> (not res!585986) (not e!480358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49563 (_ BitVec 32)) Bool)

(assert (=> b!862238 (= res!585986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862239 () Bool)

(declare-fun res!585984 () Bool)

(assert (=> b!862239 (=> (not res!585984) (not e!480358))))

(assert (=> b!862239 (= res!585984 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24255 _keys!868))))))

(declare-fun b!862240 () Bool)

(declare-fun res!585985 () Bool)

(assert (=> b!862240 (=> (not res!585985) (not e!480358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862240 (= res!585985 (validMask!0 mask!1196))))

(declare-fun b!862241 () Bool)

(declare-fun res!585979 () Bool)

(assert (=> b!862241 (=> (not res!585979) (not e!480358))))

(assert (=> b!862241 (= res!585979 (and (= (select (arr!23813 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862242 () Bool)

(assert (=> b!862242 (= e!480358 e!480364)))

(declare-fun res!585977 () Bool)

(assert (=> b!862242 (=> (not res!585977) (not e!480364))))

(assert (=> b!862242 (= res!585977 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389076 () ListLongMap!9881)

(assert (=> b!862242 (= lt!389076 (getCurrentListMapNoExtraKeys!2958 _keys!868 lt!389079 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862242 (= lt!389079 (array!49566 (store (arr!23814 _values!688) i!612 (ValueCellFull!7913 v!557)) (size!24256 _values!688)))))

(declare-fun lt!389082 () ListLongMap!9881)

(assert (=> b!862242 (= lt!389082 (getCurrentListMapNoExtraKeys!2958 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862243 () Bool)

(declare-fun res!585983 () Bool)

(assert (=> b!862243 (=> (not res!585983) (not e!480358))))

(assert (=> b!862243 (= res!585983 (and (= (size!24256 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24255 _keys!868) (size!24256 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862244 () Bool)

(declare-fun res!585987 () Bool)

(assert (=> b!862244 (=> (not res!585987) (not e!480358))))

(declare-datatypes ((List!16919 0))(
  ( (Nil!16916) (Cons!16915 (h!18046 (_ BitVec 64)) (t!23745 List!16919)) )
))
(declare-fun arrayNoDuplicates!0 (array!49563 (_ BitVec 32) List!16919) Bool)

(assert (=> b!862244 (= res!585987 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16916))))

(declare-fun b!862245 () Bool)

(declare-fun e!480366 () Bool)

(assert (=> b!862245 (= e!480363 e!480366)))

(declare-fun res!585982 () Bool)

(assert (=> b!862245 (=> res!585982 e!480366)))

(assert (=> b!862245 (= res!585982 (= k0!854 (select (arr!23813 _keys!868) from!1053)))))

(assert (=> b!862245 (not (= (select (arr!23813 _keys!868) from!1053) k0!854))))

(declare-fun lt!389075 () Unit!29373)

(declare-fun e!480361 () Unit!29373)

(assert (=> b!862245 (= lt!389075 e!480361)))

(declare-fun c!92009 () Bool)

(assert (=> b!862245 (= c!92009 (= (select (arr!23813 _keys!868) from!1053) k0!854))))

(declare-fun lt!389074 () ListLongMap!9881)

(assert (=> b!862245 (= lt!389076 lt!389074)))

(declare-fun lt!389071 () tuple2!11122)

(assert (=> b!862245 (= lt!389074 (+!2325 lt!389072 lt!389071))))

(declare-fun lt!389069 () V!27321)

(assert (=> b!862245 (= lt!389071 (tuple2!11123 (select (arr!23813 _keys!868) from!1053) lt!389069))))

(declare-fun get!12568 (ValueCell!7913 V!27321) V!27321)

(declare-fun dynLambda!1131 (Int (_ BitVec 64)) V!27321)

(assert (=> b!862245 (= lt!389069 (get!12568 (select (arr!23814 _values!688) from!1053) (dynLambda!1131 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862246 () Bool)

(declare-fun Unit!29375 () Unit!29373)

(assert (=> b!862246 (= e!480361 Unit!29375)))

(declare-fun b!862247 () Bool)

(declare-fun Unit!29376 () Unit!29373)

(assert (=> b!862247 (= e!480361 Unit!29376)))

(declare-fun lt!389081 () Unit!29373)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49563 (_ BitVec 32) (_ BitVec 32)) Unit!29373)

(assert (=> b!862247 (= lt!389081 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862247 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16916)))

(declare-fun lt!389073 () Unit!29373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29373)

(assert (=> b!862247 (= lt!389073 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862247 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389078 () Unit!29373)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49563 (_ BitVec 64) (_ BitVec 32) List!16919) Unit!29373)

(assert (=> b!862247 (= lt!389078 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16916))))

(assert (=> b!862247 false))

(declare-fun b!862248 () Bool)

(declare-fun e!480362 () Bool)

(declare-fun mapRes!26657 () Bool)

(assert (=> b!862248 (= e!480362 (and e!480360 mapRes!26657))))

(declare-fun condMapEmpty!26657 () Bool)

(declare-fun mapDefault!26657 () ValueCell!7913)

(assert (=> b!862248 (= condMapEmpty!26657 (= (arr!23814 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7913)) mapDefault!26657)))))

(declare-fun mapIsEmpty!26657 () Bool)

(assert (=> mapIsEmpty!26657 mapRes!26657))

(declare-fun b!862249 () Bool)

(assert (=> b!862249 (= e!480366 true)))

(assert (=> b!862249 (= lt!389074 (+!2325 (+!2325 lt!389083 lt!389071) lt!389070))))

(declare-fun lt!389080 () Unit!29373)

(declare-fun addCommutativeForDiffKeys!476 (ListLongMap!9881 (_ BitVec 64) V!27321 (_ BitVec 64) V!27321) Unit!29373)

(assert (=> b!862249 (= lt!389080 (addCommutativeForDiffKeys!476 lt!389083 k0!854 v!557 (select (arr!23813 _keys!868) from!1053) lt!389069))))

(declare-fun b!862250 () Bool)

(declare-fun res!585980 () Bool)

(assert (=> b!862250 (=> (not res!585980) (not e!480358))))

(assert (=> b!862250 (= res!585980 (validKeyInArray!0 k0!854))))

(declare-fun b!862251 () Bool)

(declare-fun e!480359 () Bool)

(assert (=> b!862251 (= e!480359 tp_is_empty!16705)))

(declare-fun mapNonEmpty!26657 () Bool)

(declare-fun tp!51211 () Bool)

(assert (=> mapNonEmpty!26657 (= mapRes!26657 (and tp!51211 e!480359))))

(declare-fun mapValue!26657 () ValueCell!7913)

(declare-fun mapKey!26657 () (_ BitVec 32))

(declare-fun mapRest!26657 () (Array (_ BitVec 32) ValueCell!7913))

(assert (=> mapNonEmpty!26657 (= (arr!23814 _values!688) (store mapRest!26657 mapKey!26657 mapValue!26657))))

(declare-fun res!585978 () Bool)

(assert (=> start!73636 (=> (not res!585978) (not e!480358))))

(assert (=> start!73636 (= res!585978 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24255 _keys!868))))))

(assert (=> start!73636 e!480358))

(assert (=> start!73636 tp_is_empty!16705))

(assert (=> start!73636 true))

(assert (=> start!73636 tp!51212))

(declare-fun array_inv!18910 (array!49563) Bool)

(assert (=> start!73636 (array_inv!18910 _keys!868)))

(declare-fun array_inv!18911 (array!49565) Bool)

(assert (=> start!73636 (and (array_inv!18911 _values!688) e!480362)))

(assert (= (and start!73636 res!585978) b!862240))

(assert (= (and b!862240 res!585985) b!862243))

(assert (= (and b!862243 res!585983) b!862238))

(assert (= (and b!862238 res!585986) b!862244))

(assert (= (and b!862244 res!585987) b!862239))

(assert (= (and b!862239 res!585984) b!862250))

(assert (= (and b!862250 res!585980) b!862241))

(assert (= (and b!862241 res!585979) b!862242))

(assert (= (and b!862242 res!585977) b!862236))

(assert (= (and b!862236 (not res!585981)) b!862245))

(assert (= (and b!862245 c!92009) b!862247))

(assert (= (and b!862245 (not c!92009)) b!862246))

(assert (= (and b!862245 (not res!585982)) b!862249))

(assert (= (and b!862248 condMapEmpty!26657) mapIsEmpty!26657))

(assert (= (and b!862248 (not condMapEmpty!26657)) mapNonEmpty!26657))

(get-info :version)

(assert (= (and mapNonEmpty!26657 ((_ is ValueCellFull!7913) mapValue!26657)) b!862251))

(assert (= (and b!862248 ((_ is ValueCellFull!7913) mapDefault!26657)) b!862237))

(assert (= start!73636 b!862248))

(declare-fun b_lambda!11903 () Bool)

(assert (=> (not b_lambda!11903) (not b!862245)))

(declare-fun t!23743 () Bool)

(declare-fun tb!4683 () Bool)

(assert (=> (and start!73636 (= defaultEntry!696 defaultEntry!696) t!23743) tb!4683))

(declare-fun result!8985 () Bool)

(assert (=> tb!4683 (= result!8985 tp_is_empty!16705)))

(assert (=> b!862245 t!23743))

(declare-fun b_and!24093 () Bool)

(assert (= b_and!24091 (and (=> t!23743 result!8985) b_and!24093)))

(declare-fun m!802743 () Bool)

(assert (=> b!862249 m!802743))

(assert (=> b!862249 m!802743))

(declare-fun m!802745 () Bool)

(assert (=> b!862249 m!802745))

(declare-fun m!802747 () Bool)

(assert (=> b!862249 m!802747))

(assert (=> b!862249 m!802747))

(declare-fun m!802749 () Bool)

(assert (=> b!862249 m!802749))

(declare-fun m!802751 () Bool)

(assert (=> b!862240 m!802751))

(declare-fun m!802753 () Bool)

(assert (=> b!862242 m!802753))

(declare-fun m!802755 () Bool)

(assert (=> b!862242 m!802755))

(declare-fun m!802757 () Bool)

(assert (=> b!862242 m!802757))

(declare-fun m!802759 () Bool)

(assert (=> b!862250 m!802759))

(declare-fun m!802761 () Bool)

(assert (=> mapNonEmpty!26657 m!802761))

(declare-fun m!802763 () Bool)

(assert (=> b!862247 m!802763))

(declare-fun m!802765 () Bool)

(assert (=> b!862247 m!802765))

(declare-fun m!802767 () Bool)

(assert (=> b!862247 m!802767))

(declare-fun m!802769 () Bool)

(assert (=> b!862247 m!802769))

(declare-fun m!802771 () Bool)

(assert (=> b!862247 m!802771))

(declare-fun m!802773 () Bool)

(assert (=> b!862245 m!802773))

(assert (=> b!862245 m!802747))

(declare-fun m!802775 () Bool)

(assert (=> b!862245 m!802775))

(declare-fun m!802777 () Bool)

(assert (=> b!862245 m!802777))

(assert (=> b!862245 m!802773))

(assert (=> b!862245 m!802775))

(declare-fun m!802779 () Bool)

(assert (=> b!862245 m!802779))

(declare-fun m!802781 () Bool)

(assert (=> b!862238 m!802781))

(declare-fun m!802783 () Bool)

(assert (=> b!862241 m!802783))

(declare-fun m!802785 () Bool)

(assert (=> b!862244 m!802785))

(declare-fun m!802787 () Bool)

(assert (=> b!862236 m!802787))

(declare-fun m!802789 () Bool)

(assert (=> b!862236 m!802789))

(assert (=> b!862236 m!802747))

(declare-fun m!802791 () Bool)

(assert (=> b!862236 m!802791))

(assert (=> b!862236 m!802747))

(declare-fun m!802793 () Bool)

(assert (=> b!862236 m!802793))

(declare-fun m!802795 () Bool)

(assert (=> b!862236 m!802795))

(declare-fun m!802797 () Bool)

(assert (=> start!73636 m!802797))

(declare-fun m!802799 () Bool)

(assert (=> start!73636 m!802799))

(check-sat (not b!862236) tp_is_empty!16705 (not b_lambda!11903) (not mapNonEmpty!26657) (not start!73636) (not b!862250) (not b!862244) (not b!862247) (not b!862245) (not b!862240) (not b!862238) (not b_next!14569) (not b!862249) b_and!24093 (not b!862242))
(check-sat b_and!24093 (not b_next!14569))
