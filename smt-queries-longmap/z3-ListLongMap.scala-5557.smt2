; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73108 () Bool)

(assert start!73108)

(declare-fun b_free!14041 () Bool)

(declare-fun b_next!14041 () Bool)

(assert (=> start!73108 (= b_free!14041 (not b_next!14041))))

(declare-fun tp!49627 () Bool)

(declare-fun b_and!23215 () Bool)

(assert (=> start!73108 (= tp!49627 b_and!23215)))

(declare-fun mapNonEmpty!25865 () Bool)

(declare-fun mapRes!25865 () Bool)

(declare-fun tp!49628 () Bool)

(declare-fun e!474606 () Bool)

(assert (=> mapNonEmpty!25865 (= mapRes!25865 (and tp!49628 e!474606))))

(declare-fun mapKey!25865 () (_ BitVec 32))

(declare-datatypes ((V!26617 0))(
  ( (V!26618 (val!8136 Int)) )
))
(declare-datatypes ((ValueCell!7649 0))(
  ( (ValueCellFull!7649 (v!10555 V!26617)) (EmptyCell!7649) )
))
(declare-fun mapValue!25865 () ValueCell!7649)

(declare-fun mapRest!25865 () (Array (_ BitVec 32) ValueCell!7649))

(declare-datatypes ((array!48545 0))(
  ( (array!48546 (arr!23304 (Array (_ BitVec 32) ValueCell!7649)) (size!23746 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48545)

(assert (=> mapNonEmpty!25865 (= (arr!23304 _values!688) (store mapRest!25865 mapKey!25865 mapValue!25865))))

(declare-fun b!850879 () Bool)

(declare-fun res!578036 () Bool)

(declare-fun e!474609 () Bool)

(assert (=> b!850879 (=> (not res!578036) (not e!474609))))

(declare-datatypes ((array!48547 0))(
  ( (array!48548 (arr!23305 (Array (_ BitVec 32) (_ BitVec 64))) (size!23747 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48547)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48547 (_ BitVec 32)) Bool)

(assert (=> b!850879 (= res!578036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!578037 () Bool)

(assert (=> start!73108 (=> (not res!578037) (not e!474609))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73108 (= res!578037 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23747 _keys!868))))))

(assert (=> start!73108 e!474609))

(declare-fun tp_is_empty!16177 () Bool)

(assert (=> start!73108 tp_is_empty!16177))

(assert (=> start!73108 true))

(assert (=> start!73108 tp!49627))

(declare-fun array_inv!18568 (array!48547) Bool)

(assert (=> start!73108 (array_inv!18568 _keys!868)))

(declare-fun e!474612 () Bool)

(declare-fun array_inv!18569 (array!48545) Bool)

(assert (=> start!73108 (and (array_inv!18569 _values!688) e!474612)))

(declare-fun b!850880 () Bool)

(declare-fun res!578034 () Bool)

(assert (=> b!850880 (=> (not res!578034) (not e!474609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850880 (= res!578034 (validMask!0 mask!1196))))

(declare-fun b!850881 () Bool)

(declare-fun e!474607 () Bool)

(assert (=> b!850881 (= e!474607 true)))

(declare-datatypes ((tuple2!10688 0))(
  ( (tuple2!10689 (_1!5355 (_ BitVec 64)) (_2!5355 V!26617)) )
))
(declare-fun lt!383025 () tuple2!10688)

(declare-datatypes ((List!16525 0))(
  ( (Nil!16522) (Cons!16521 (h!17652 tuple2!10688) (t!23003 List!16525)) )
))
(declare-datatypes ((ListLongMap!9447 0))(
  ( (ListLongMap!9448 (toList!4739 List!16525)) )
))
(declare-fun lt!383023 () ListLongMap!9447)

(declare-fun lt!383019 () V!26617)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2159 (ListLongMap!9447 tuple2!10688) ListLongMap!9447)

(assert (=> b!850881 (= (+!2159 lt!383023 lt!383025) (+!2159 (+!2159 lt!383023 (tuple2!10689 k0!854 lt!383019)) lt!383025))))

(declare-fun lt!383026 () V!26617)

(assert (=> b!850881 (= lt!383025 (tuple2!10689 k0!854 lt!383026))))

(declare-datatypes ((Unit!28991 0))(
  ( (Unit!28992) )
))
(declare-fun lt!383021 () Unit!28991)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!273 (ListLongMap!9447 (_ BitVec 64) V!26617 V!26617) Unit!28991)

(assert (=> b!850881 (= lt!383021 (addSameAsAddTwiceSameKeyDiffValues!273 lt!383023 k0!854 lt!383019 lt!383026))))

(declare-fun lt!383027 () V!26617)

(declare-fun get!12284 (ValueCell!7649 V!26617) V!26617)

(assert (=> b!850881 (= lt!383019 (get!12284 (select (arr!23304 _values!688) from!1053) lt!383027))))

(declare-fun lt!383022 () ListLongMap!9447)

(assert (=> b!850881 (= lt!383022 (+!2159 lt!383023 (tuple2!10689 (select (arr!23305 _keys!868) from!1053) lt!383026)))))

(declare-fun v!557 () V!26617)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850881 (= lt!383026 (get!12284 (select (store (arr!23304 _values!688) i!612 (ValueCellFull!7649 v!557)) from!1053) lt!383027))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1023 (Int (_ BitVec 64)) V!26617)

(assert (=> b!850881 (= lt!383027 (dynLambda!1023 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26617)

(declare-fun lt!383018 () array!48545)

(declare-fun zeroValue!654 () V!26617)

(declare-fun getCurrentListMapNoExtraKeys!2747 (array!48547 array!48545 (_ BitVec 32) (_ BitVec 32) V!26617 V!26617 (_ BitVec 32) Int) ListLongMap!9447)

(assert (=> b!850881 (= lt!383023 (getCurrentListMapNoExtraKeys!2747 _keys!868 lt!383018 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37949 () Bool)

(declare-fun call!37953 () ListLongMap!9447)

(assert (=> bm!37949 (= call!37953 (getCurrentListMapNoExtraKeys!2747 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37950 () Bool)

(declare-fun call!37952 () ListLongMap!9447)

(assert (=> bm!37950 (= call!37952 (getCurrentListMapNoExtraKeys!2747 _keys!868 lt!383018 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850882 () Bool)

(declare-fun res!578035 () Bool)

(assert (=> b!850882 (=> (not res!578035) (not e!474609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850882 (= res!578035 (validKeyInArray!0 k0!854))))

(declare-fun b!850883 () Bool)

(declare-fun res!578030 () Bool)

(assert (=> b!850883 (=> (not res!578030) (not e!474609))))

(assert (=> b!850883 (= res!578030 (and (= (size!23746 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23747 _keys!868) (size!23746 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850884 () Bool)

(declare-fun e!474611 () Bool)

(assert (=> b!850884 (= e!474611 (not e!474607))))

(declare-fun res!578031 () Bool)

(assert (=> b!850884 (=> res!578031 e!474607)))

(assert (=> b!850884 (= res!578031 (not (validKeyInArray!0 (select (arr!23305 _keys!868) from!1053))))))

(declare-fun e!474605 () Bool)

(assert (=> b!850884 e!474605))

(declare-fun c!91667 () Bool)

(assert (=> b!850884 (= c!91667 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383024 () Unit!28991)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!367 (array!48547 array!48545 (_ BitVec 32) (_ BitVec 32) V!26617 V!26617 (_ BitVec 32) (_ BitVec 64) V!26617 (_ BitVec 32) Int) Unit!28991)

(assert (=> b!850884 (= lt!383024 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!367 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850885 () Bool)

(declare-fun res!578028 () Bool)

(assert (=> b!850885 (=> (not res!578028) (not e!474609))))

(assert (=> b!850885 (= res!578028 (and (= (select (arr!23305 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850886 () Bool)

(declare-fun res!578032 () Bool)

(assert (=> b!850886 (=> (not res!578032) (not e!474609))))

(assert (=> b!850886 (= res!578032 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23747 _keys!868))))))

(declare-fun b!850887 () Bool)

(declare-fun e!474610 () Bool)

(assert (=> b!850887 (= e!474612 (and e!474610 mapRes!25865))))

(declare-fun condMapEmpty!25865 () Bool)

(declare-fun mapDefault!25865 () ValueCell!7649)

(assert (=> b!850887 (= condMapEmpty!25865 (= (arr!23304 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7649)) mapDefault!25865)))))

(declare-fun b!850888 () Bool)

(assert (=> b!850888 (= e!474609 e!474611)))

(declare-fun res!578029 () Bool)

(assert (=> b!850888 (=> (not res!578029) (not e!474611))))

(assert (=> b!850888 (= res!578029 (= from!1053 i!612))))

(assert (=> b!850888 (= lt!383022 (getCurrentListMapNoExtraKeys!2747 _keys!868 lt!383018 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850888 (= lt!383018 (array!48546 (store (arr!23304 _values!688) i!612 (ValueCellFull!7649 v!557)) (size!23746 _values!688)))))

(declare-fun lt!383020 () ListLongMap!9447)

(assert (=> b!850888 (= lt!383020 (getCurrentListMapNoExtraKeys!2747 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850889 () Bool)

(declare-fun res!578033 () Bool)

(assert (=> b!850889 (=> (not res!578033) (not e!474609))))

(declare-datatypes ((List!16526 0))(
  ( (Nil!16523) (Cons!16522 (h!17653 (_ BitVec 64)) (t!23004 List!16526)) )
))
(declare-fun arrayNoDuplicates!0 (array!48547 (_ BitVec 32) List!16526) Bool)

(assert (=> b!850889 (= res!578033 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16523))))

(declare-fun mapIsEmpty!25865 () Bool)

(assert (=> mapIsEmpty!25865 mapRes!25865))

(declare-fun b!850890 () Bool)

(assert (=> b!850890 (= e!474605 (= call!37952 call!37953))))

(declare-fun b!850891 () Bool)

(assert (=> b!850891 (= e!474606 tp_is_empty!16177)))

(declare-fun b!850892 () Bool)

(assert (=> b!850892 (= e!474605 (= call!37952 (+!2159 call!37953 (tuple2!10689 k0!854 v!557))))))

(declare-fun b!850893 () Bool)

(assert (=> b!850893 (= e!474610 tp_is_empty!16177)))

(assert (= (and start!73108 res!578037) b!850880))

(assert (= (and b!850880 res!578034) b!850883))

(assert (= (and b!850883 res!578030) b!850879))

(assert (= (and b!850879 res!578036) b!850889))

(assert (= (and b!850889 res!578033) b!850886))

(assert (= (and b!850886 res!578032) b!850882))

(assert (= (and b!850882 res!578035) b!850885))

(assert (= (and b!850885 res!578028) b!850888))

(assert (= (and b!850888 res!578029) b!850884))

(assert (= (and b!850884 c!91667) b!850892))

(assert (= (and b!850884 (not c!91667)) b!850890))

(assert (= (or b!850892 b!850890) bm!37950))

(assert (= (or b!850892 b!850890) bm!37949))

(assert (= (and b!850884 (not res!578031)) b!850881))

(assert (= (and b!850887 condMapEmpty!25865) mapIsEmpty!25865))

(assert (= (and b!850887 (not condMapEmpty!25865)) mapNonEmpty!25865))

(get-info :version)

(assert (= (and mapNonEmpty!25865 ((_ is ValueCellFull!7649) mapValue!25865)) b!850891))

(assert (= (and b!850887 ((_ is ValueCellFull!7649) mapDefault!25865)) b!850893))

(assert (= start!73108 b!850887))

(declare-fun b_lambda!11555 () Bool)

(assert (=> (not b_lambda!11555) (not b!850881)))

(declare-fun t!23002 () Bool)

(declare-fun tb!4335 () Bool)

(assert (=> (and start!73108 (= defaultEntry!696 defaultEntry!696) t!23002) tb!4335))

(declare-fun result!8289 () Bool)

(assert (=> tb!4335 (= result!8289 tp_is_empty!16177)))

(assert (=> b!850881 t!23002))

(declare-fun b_and!23217 () Bool)

(assert (= b_and!23215 (and (=> t!23002 result!8289) b_and!23217)))

(declare-fun m!791227 () Bool)

(assert (=> bm!37949 m!791227))

(declare-fun m!791229 () Bool)

(assert (=> b!850888 m!791229))

(declare-fun m!791231 () Bool)

(assert (=> b!850888 m!791231))

(declare-fun m!791233 () Bool)

(assert (=> b!850888 m!791233))

(declare-fun m!791235 () Bool)

(assert (=> bm!37950 m!791235))

(declare-fun m!791237 () Bool)

(assert (=> b!850892 m!791237))

(declare-fun m!791239 () Bool)

(assert (=> mapNonEmpty!25865 m!791239))

(declare-fun m!791241 () Bool)

(assert (=> b!850882 m!791241))

(declare-fun m!791243 () Bool)

(assert (=> b!850884 m!791243))

(assert (=> b!850884 m!791243))

(declare-fun m!791245 () Bool)

(assert (=> b!850884 m!791245))

(declare-fun m!791247 () Bool)

(assert (=> b!850884 m!791247))

(declare-fun m!791249 () Bool)

(assert (=> b!850880 m!791249))

(declare-fun m!791251 () Bool)

(assert (=> b!850889 m!791251))

(declare-fun m!791253 () Bool)

(assert (=> b!850881 m!791253))

(declare-fun m!791255 () Bool)

(assert (=> b!850881 m!791255))

(declare-fun m!791257 () Bool)

(assert (=> b!850881 m!791257))

(declare-fun m!791259 () Bool)

(assert (=> b!850881 m!791259))

(assert (=> b!850881 m!791235))

(declare-fun m!791261 () Bool)

(assert (=> b!850881 m!791261))

(assert (=> b!850881 m!791253))

(assert (=> b!850881 m!791257))

(declare-fun m!791263 () Bool)

(assert (=> b!850881 m!791263))

(assert (=> b!850881 m!791231))

(assert (=> b!850881 m!791261))

(declare-fun m!791265 () Bool)

(assert (=> b!850881 m!791265))

(declare-fun m!791267 () Bool)

(assert (=> b!850881 m!791267))

(assert (=> b!850881 m!791243))

(declare-fun m!791269 () Bool)

(assert (=> b!850881 m!791269))

(declare-fun m!791271 () Bool)

(assert (=> b!850881 m!791271))

(declare-fun m!791273 () Bool)

(assert (=> b!850879 m!791273))

(declare-fun m!791275 () Bool)

(assert (=> b!850885 m!791275))

(declare-fun m!791277 () Bool)

(assert (=> start!73108 m!791277))

(declare-fun m!791279 () Bool)

(assert (=> start!73108 m!791279))

(check-sat b_and!23217 (not b!850888) (not mapNonEmpty!25865) (not bm!37949) (not b!850892) (not b_lambda!11555) (not start!73108) (not b!850881) tp_is_empty!16177 (not b!850880) (not b_next!14041) (not bm!37950) (not b!850882) (not b!850884) (not b!850879) (not b!850889))
(check-sat b_and!23217 (not b_next!14041))
