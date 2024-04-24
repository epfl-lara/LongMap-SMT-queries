; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73840 () Bool)

(assert start!73840)

(declare-fun b_free!14587 () Bool)

(declare-fun b_next!14587 () Bool)

(assert (=> start!73840 (= b_free!14587 (not b_next!14587))))

(declare-fun tp!51265 () Bool)

(declare-fun b_and!24163 () Bool)

(assert (=> start!73840 (= tp!51265 b_and!24163)))

(declare-fun b!863828 () Bool)

(declare-fun res!586736 () Bool)

(declare-fun e!481334 () Bool)

(assert (=> b!863828 (=> (not res!586736) (not e!481334))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49665 0))(
  ( (array!49666 (arr!23859 (Array (_ BitVec 32) (_ BitVec 64))) (size!24300 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49665)

(declare-datatypes ((V!27345 0))(
  ( (V!27346 (val!8409 Int)) )
))
(declare-datatypes ((ValueCell!7922 0))(
  ( (ValueCellFull!7922 (v!10834 V!27345)) (EmptyCell!7922) )
))
(declare-datatypes ((array!49667 0))(
  ( (array!49668 (arr!23860 (Array (_ BitVec 32) ValueCell!7922)) (size!24301 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49667)

(assert (=> b!863828 (= res!586736 (and (= (size!24301 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24300 _keys!868) (size!24301 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863829 () Bool)

(declare-fun res!586731 () Bool)

(assert (=> b!863829 (=> (not res!586731) (not e!481334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49665 (_ BitVec 32)) Bool)

(assert (=> b!863829 (= res!586731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863830 () Bool)

(declare-fun res!586735 () Bool)

(assert (=> b!863830 (=> (not res!586735) (not e!481334))))

(declare-datatypes ((List!16888 0))(
  ( (Nil!16885) (Cons!16884 (h!18021 (_ BitVec 64)) (t!23733 List!16888)) )
))
(declare-fun arrayNoDuplicates!0 (array!49665 (_ BitVec 32) List!16888) Bool)

(assert (=> b!863830 (= res!586735 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16885))))

(declare-fun b!863831 () Bool)

(declare-fun res!586734 () Bool)

(assert (=> b!863831 (=> (not res!586734) (not e!481334))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863831 (= res!586734 (validKeyInArray!0 k0!854))))

(declare-fun b!863832 () Bool)

(declare-datatypes ((Unit!29481 0))(
  ( (Unit!29482) )
))
(declare-fun e!481337 () Unit!29481)

(declare-fun Unit!29483 () Unit!29481)

(assert (=> b!863832 (= e!481337 Unit!29483)))

(declare-fun b!863833 () Bool)

(declare-fun e!481339 () Bool)

(declare-fun e!481331 () Bool)

(declare-fun mapRes!26684 () Bool)

(assert (=> b!863833 (= e!481339 (and e!481331 mapRes!26684))))

(declare-fun condMapEmpty!26684 () Bool)

(declare-fun mapDefault!26684 () ValueCell!7922)

(assert (=> b!863833 (= condMapEmpty!26684 (= (arr!23860 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7922)) mapDefault!26684)))))

(declare-fun b!863834 () Bool)

(declare-fun e!481338 () Bool)

(assert (=> b!863834 (= e!481334 e!481338)))

(declare-fun res!586730 () Bool)

(assert (=> b!863834 (=> (not res!586730) (not e!481338))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863834 (= res!586730 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11054 0))(
  ( (tuple2!11055 (_1!5538 (_ BitVec 64)) (_2!5538 V!27345)) )
))
(declare-datatypes ((List!16889 0))(
  ( (Nil!16886) (Cons!16885 (h!18022 tuple2!11054) (t!23734 List!16889)) )
))
(declare-datatypes ((ListLongMap!9825 0))(
  ( (ListLongMap!9826 (toList!4928 List!16889)) )
))
(declare-fun lt!390106 () ListLongMap!9825)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!390109 () array!49667)

(declare-fun minValue!654 () V!27345)

(declare-fun zeroValue!654 () V!27345)

(declare-fun getCurrentListMapNoExtraKeys!2979 (array!49665 array!49667 (_ BitVec 32) (_ BitVec 32) V!27345 V!27345 (_ BitVec 32) Int) ListLongMap!9825)

(assert (=> b!863834 (= lt!390106 (getCurrentListMapNoExtraKeys!2979 _keys!868 lt!390109 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27345)

(assert (=> b!863834 (= lt!390109 (array!49668 (store (arr!23860 _values!688) i!612 (ValueCellFull!7922 v!557)) (size!24301 _values!688)))))

(declare-fun lt!390103 () ListLongMap!9825)

(assert (=> b!863834 (= lt!390103 (getCurrentListMapNoExtraKeys!2979 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!586738 () Bool)

(assert (=> start!73840 (=> (not res!586738) (not e!481334))))

(assert (=> start!73840 (= res!586738 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24300 _keys!868))))))

(assert (=> start!73840 e!481334))

(declare-fun tp_is_empty!16723 () Bool)

(assert (=> start!73840 tp_is_empty!16723))

(assert (=> start!73840 true))

(assert (=> start!73840 tp!51265))

(declare-fun array_inv!18928 (array!49665) Bool)

(assert (=> start!73840 (array_inv!18928 _keys!868)))

(declare-fun array_inv!18929 (array!49667) Bool)

(assert (=> start!73840 (and (array_inv!18929 _values!688) e!481339)))

(declare-fun b!863835 () Bool)

(declare-fun e!481336 () Bool)

(assert (=> b!863835 (= e!481336 true)))

(declare-fun lt!390105 () tuple2!11054)

(declare-fun lt!390099 () tuple2!11054)

(declare-fun lt!390113 () ListLongMap!9825)

(declare-fun lt!390098 () ListLongMap!9825)

(declare-fun +!2332 (ListLongMap!9825 tuple2!11054) ListLongMap!9825)

(assert (=> b!863835 (= lt!390113 (+!2332 (+!2332 lt!390098 lt!390099) lt!390105))))

(declare-fun lt!390110 () Unit!29481)

(declare-fun lt!390100 () V!27345)

(declare-fun addCommutativeForDiffKeys!485 (ListLongMap!9825 (_ BitVec 64) V!27345 (_ BitVec 64) V!27345) Unit!29481)

(assert (=> b!863835 (= lt!390110 (addCommutativeForDiffKeys!485 lt!390098 k0!854 v!557 (select (arr!23859 _keys!868) from!1053) lt!390100))))

(declare-fun b!863836 () Bool)

(assert (=> b!863836 (= e!481331 tp_is_empty!16723)))

(declare-fun b!863837 () Bool)

(declare-fun e!481335 () Bool)

(assert (=> b!863837 (= e!481335 tp_is_empty!16723)))

(declare-fun b!863838 () Bool)

(declare-fun res!586733 () Bool)

(assert (=> b!863838 (=> (not res!586733) (not e!481334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863838 (= res!586733 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26684 () Bool)

(declare-fun tp!51266 () Bool)

(assert (=> mapNonEmpty!26684 (= mapRes!26684 (and tp!51266 e!481335))))

(declare-fun mapValue!26684 () ValueCell!7922)

(declare-fun mapKey!26684 () (_ BitVec 32))

(declare-fun mapRest!26684 () (Array (_ BitVec 32) ValueCell!7922))

(assert (=> mapNonEmpty!26684 (= (arr!23860 _values!688) (store mapRest!26684 mapKey!26684 mapValue!26684))))

(declare-fun b!863839 () Bool)

(declare-fun Unit!29484 () Unit!29481)

(assert (=> b!863839 (= e!481337 Unit!29484)))

(declare-fun lt!390101 () Unit!29481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49665 (_ BitVec 32) (_ BitVec 32)) Unit!29481)

(assert (=> b!863839 (= lt!390101 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863839 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16885)))

(declare-fun lt!390102 () Unit!29481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29481)

(assert (=> b!863839 (= lt!390102 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863839 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390108 () Unit!29481)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49665 (_ BitVec 64) (_ BitVec 32) List!16888) Unit!29481)

(assert (=> b!863839 (= lt!390108 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16885))))

(assert (=> b!863839 false))

(declare-fun mapIsEmpty!26684 () Bool)

(assert (=> mapIsEmpty!26684 mapRes!26684))

(declare-fun b!863840 () Bool)

(declare-fun e!481332 () Bool)

(assert (=> b!863840 (= e!481332 e!481336)))

(declare-fun res!586737 () Bool)

(assert (=> b!863840 (=> res!586737 e!481336)))

(assert (=> b!863840 (= res!586737 (= k0!854 (select (arr!23859 _keys!868) from!1053)))))

(assert (=> b!863840 (not (= (select (arr!23859 _keys!868) from!1053) k0!854))))

(declare-fun lt!390104 () Unit!29481)

(assert (=> b!863840 (= lt!390104 e!481337)))

(declare-fun c!92383 () Bool)

(assert (=> b!863840 (= c!92383 (= (select (arr!23859 _keys!868) from!1053) k0!854))))

(assert (=> b!863840 (= lt!390106 lt!390113)))

(declare-fun lt!390112 () ListLongMap!9825)

(assert (=> b!863840 (= lt!390113 (+!2332 lt!390112 lt!390099))))

(assert (=> b!863840 (= lt!390099 (tuple2!11055 (select (arr!23859 _keys!868) from!1053) lt!390100))))

(declare-fun get!12604 (ValueCell!7922 V!27345) V!27345)

(declare-fun dynLambda!1158 (Int (_ BitVec 64)) V!27345)

(assert (=> b!863840 (= lt!390100 (get!12604 (select (arr!23860 _values!688) from!1053) (dynLambda!1158 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863841 () Bool)

(declare-fun res!586728 () Bool)

(assert (=> b!863841 (=> (not res!586728) (not e!481334))))

(assert (=> b!863841 (= res!586728 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24300 _keys!868))))))

(declare-fun b!863842 () Bool)

(assert (=> b!863842 (= e!481338 (not e!481332))))

(declare-fun res!586732 () Bool)

(assert (=> b!863842 (=> res!586732 e!481332)))

(assert (=> b!863842 (= res!586732 (not (validKeyInArray!0 (select (arr!23859 _keys!868) from!1053))))))

(declare-fun lt!390111 () ListLongMap!9825)

(assert (=> b!863842 (= lt!390111 lt!390112)))

(assert (=> b!863842 (= lt!390112 (+!2332 lt!390098 lt!390105))))

(assert (=> b!863842 (= lt!390111 (getCurrentListMapNoExtraKeys!2979 _keys!868 lt!390109 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863842 (= lt!390105 (tuple2!11055 k0!854 v!557))))

(assert (=> b!863842 (= lt!390098 (getCurrentListMapNoExtraKeys!2979 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390107 () Unit!29481)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!518 (array!49665 array!49667 (_ BitVec 32) (_ BitVec 32) V!27345 V!27345 (_ BitVec 32) (_ BitVec 64) V!27345 (_ BitVec 32) Int) Unit!29481)

(assert (=> b!863842 (= lt!390107 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!518 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863843 () Bool)

(declare-fun res!586729 () Bool)

(assert (=> b!863843 (=> (not res!586729) (not e!481334))))

(assert (=> b!863843 (= res!586729 (and (= (select (arr!23859 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73840 res!586738) b!863838))

(assert (= (and b!863838 res!586733) b!863828))

(assert (= (and b!863828 res!586736) b!863829))

(assert (= (and b!863829 res!586731) b!863830))

(assert (= (and b!863830 res!586735) b!863841))

(assert (= (and b!863841 res!586728) b!863831))

(assert (= (and b!863831 res!586734) b!863843))

(assert (= (and b!863843 res!586729) b!863834))

(assert (= (and b!863834 res!586730) b!863842))

(assert (= (and b!863842 (not res!586732)) b!863840))

(assert (= (and b!863840 c!92383) b!863839))

(assert (= (and b!863840 (not c!92383)) b!863832))

(assert (= (and b!863840 (not res!586737)) b!863835))

(assert (= (and b!863833 condMapEmpty!26684) mapIsEmpty!26684))

(assert (= (and b!863833 (not condMapEmpty!26684)) mapNonEmpty!26684))

(get-info :version)

(assert (= (and mapNonEmpty!26684 ((_ is ValueCellFull!7922) mapValue!26684)) b!863837))

(assert (= (and b!863833 ((_ is ValueCellFull!7922) mapDefault!26684)) b!863836))

(assert (= start!73840 b!863833))

(declare-fun b_lambda!11953 () Bool)

(assert (=> (not b_lambda!11953) (not b!863840)))

(declare-fun t!23732 () Bool)

(declare-fun tb!4701 () Bool)

(assert (=> (and start!73840 (= defaultEntry!696 defaultEntry!696) t!23732) tb!4701))

(declare-fun result!9021 () Bool)

(assert (=> tb!4701 (= result!9021 tp_is_empty!16723)))

(assert (=> b!863840 t!23732))

(declare-fun b_and!24165 () Bool)

(assert (= b_and!24163 (and (=> t!23732 result!9021) b_and!24165)))

(declare-fun m!805313 () Bool)

(assert (=> b!863840 m!805313))

(declare-fun m!805315 () Bool)

(assert (=> b!863840 m!805315))

(declare-fun m!805317 () Bool)

(assert (=> b!863840 m!805317))

(assert (=> b!863840 m!805313))

(declare-fun m!805319 () Bool)

(assert (=> b!863840 m!805319))

(declare-fun m!805321 () Bool)

(assert (=> b!863840 m!805321))

(assert (=> b!863840 m!805315))

(declare-fun m!805323 () Bool)

(assert (=> b!863829 m!805323))

(declare-fun m!805325 () Bool)

(assert (=> mapNonEmpty!26684 m!805325))

(declare-fun m!805327 () Bool)

(assert (=> b!863839 m!805327))

(declare-fun m!805329 () Bool)

(assert (=> b!863839 m!805329))

(declare-fun m!805331 () Bool)

(assert (=> b!863839 m!805331))

(declare-fun m!805333 () Bool)

(assert (=> b!863839 m!805333))

(declare-fun m!805335 () Bool)

(assert (=> b!863839 m!805335))

(declare-fun m!805337 () Bool)

(assert (=> b!863834 m!805337))

(declare-fun m!805339 () Bool)

(assert (=> b!863834 m!805339))

(declare-fun m!805341 () Bool)

(assert (=> b!863834 m!805341))

(declare-fun m!805343 () Bool)

(assert (=> b!863830 m!805343))

(declare-fun m!805345 () Bool)

(assert (=> start!73840 m!805345))

(declare-fun m!805347 () Bool)

(assert (=> start!73840 m!805347))

(declare-fun m!805349 () Bool)

(assert (=> b!863843 m!805349))

(declare-fun m!805351 () Bool)

(assert (=> b!863838 m!805351))

(declare-fun m!805353 () Bool)

(assert (=> b!863842 m!805353))

(declare-fun m!805355 () Bool)

(assert (=> b!863842 m!805355))

(assert (=> b!863842 m!805321))

(declare-fun m!805357 () Bool)

(assert (=> b!863842 m!805357))

(assert (=> b!863842 m!805321))

(declare-fun m!805359 () Bool)

(assert (=> b!863842 m!805359))

(declare-fun m!805361 () Bool)

(assert (=> b!863842 m!805361))

(declare-fun m!805363 () Bool)

(assert (=> b!863835 m!805363))

(assert (=> b!863835 m!805363))

(declare-fun m!805365 () Bool)

(assert (=> b!863835 m!805365))

(assert (=> b!863835 m!805321))

(assert (=> b!863835 m!805321))

(declare-fun m!805367 () Bool)

(assert (=> b!863835 m!805367))

(declare-fun m!805369 () Bool)

(assert (=> b!863831 m!805369))

(check-sat tp_is_empty!16723 (not b!863829) (not b!863839) (not b!863835) (not mapNonEmpty!26684) (not b_next!14587) (not b!863842) (not b!863830) (not b!863840) (not start!73840) (not b!863838) (not b_lambda!11953) b_and!24165 (not b!863834) (not b!863831))
(check-sat b_and!24165 (not b_next!14587))
