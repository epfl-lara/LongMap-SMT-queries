; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73828 () Bool)

(assert start!73828)

(declare-fun b_free!14575 () Bool)

(declare-fun b_next!14575 () Bool)

(assert (=> start!73828 (= b_free!14575 (not b_next!14575))))

(declare-fun tp!51230 () Bool)

(declare-fun b_and!24139 () Bool)

(assert (=> start!73828 (= tp!51230 b_and!24139)))

(declare-fun res!586533 () Bool)

(declare-fun e!481174 () Bool)

(assert (=> start!73828 (=> (not res!586533) (not e!481174))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49641 0))(
  ( (array!49642 (arr!23847 (Array (_ BitVec 32) (_ BitVec 64))) (size!24288 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49641)

(assert (=> start!73828 (= res!586533 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24288 _keys!868))))))

(assert (=> start!73828 e!481174))

(declare-fun tp_is_empty!16711 () Bool)

(assert (=> start!73828 tp_is_empty!16711))

(assert (=> start!73828 true))

(assert (=> start!73828 tp!51230))

(declare-fun array_inv!18918 (array!49641) Bool)

(assert (=> start!73828 (array_inv!18918 _keys!868)))

(declare-datatypes ((V!27329 0))(
  ( (V!27330 (val!8403 Int)) )
))
(declare-datatypes ((ValueCell!7916 0))(
  ( (ValueCellFull!7916 (v!10828 V!27329)) (EmptyCell!7916) )
))
(declare-datatypes ((array!49643 0))(
  ( (array!49644 (arr!23848 (Array (_ BitVec 32) ValueCell!7916)) (size!24289 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49643)

(declare-fun e!481173 () Bool)

(declare-fun array_inv!18919 (array!49643) Bool)

(assert (=> start!73828 (and (array_inv!18919 _values!688) e!481173)))

(declare-fun b!863528 () Bool)

(declare-fun res!586535 () Bool)

(assert (=> b!863528 (=> (not res!586535) (not e!481174))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49641 (_ BitVec 32)) Bool)

(assert (=> b!863528 (= res!586535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863529 () Bool)

(declare-fun e!481175 () Bool)

(declare-fun e!481177 () Bool)

(assert (=> b!863529 (= e!481175 (not e!481177))))

(declare-fun res!586538 () Bool)

(assert (=> b!863529 (=> res!586538 e!481177)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863529 (= res!586538 (not (validKeyInArray!0 (select (arr!23847 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11042 0))(
  ( (tuple2!11043 (_1!5532 (_ BitVec 64)) (_2!5532 V!27329)) )
))
(declare-datatypes ((List!16878 0))(
  ( (Nil!16875) (Cons!16874 (h!18011 tuple2!11042) (t!23711 List!16878)) )
))
(declare-datatypes ((ListLongMap!9813 0))(
  ( (ListLongMap!9814 (toList!4922 List!16878)) )
))
(declare-fun lt!389820 () ListLongMap!9813)

(declare-fun lt!389810 () ListLongMap!9813)

(assert (=> b!863529 (= lt!389820 lt!389810)))

(declare-fun lt!389812 () ListLongMap!9813)

(declare-fun lt!389818 () tuple2!11042)

(declare-fun +!2326 (ListLongMap!9813 tuple2!11042) ListLongMap!9813)

(assert (=> b!863529 (= lt!389810 (+!2326 lt!389812 lt!389818))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!389819 () array!49643)

(declare-fun minValue!654 () V!27329)

(declare-fun zeroValue!654 () V!27329)

(declare-fun getCurrentListMapNoExtraKeys!2973 (array!49641 array!49643 (_ BitVec 32) (_ BitVec 32) V!27329 V!27329 (_ BitVec 32) Int) ListLongMap!9813)

(assert (=> b!863529 (= lt!389820 (getCurrentListMapNoExtraKeys!2973 _keys!868 lt!389819 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27329)

(assert (=> b!863529 (= lt!389818 (tuple2!11043 k0!854 v!557))))

(assert (=> b!863529 (= lt!389812 (getCurrentListMapNoExtraKeys!2973 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29460 0))(
  ( (Unit!29461) )
))
(declare-fun lt!389825 () Unit!29460)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!513 (array!49641 array!49643 (_ BitVec 32) (_ BitVec 32) V!27329 V!27329 (_ BitVec 32) (_ BitVec 64) V!27329 (_ BitVec 32) Int) Unit!29460)

(assert (=> b!863529 (= lt!389825 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!513 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863530 () Bool)

(declare-fun e!481172 () Bool)

(assert (=> b!863530 (= e!481172 true)))

(declare-fun lt!389817 () ListLongMap!9813)

(declare-fun lt!389811 () tuple2!11042)

(assert (=> b!863530 (= lt!389817 (+!2326 (+!2326 lt!389812 lt!389811) lt!389818))))

(declare-fun lt!389814 () Unit!29460)

(declare-fun lt!389822 () V!27329)

(declare-fun addCommutativeForDiffKeys!480 (ListLongMap!9813 (_ BitVec 64) V!27329 (_ BitVec 64) V!27329) Unit!29460)

(assert (=> b!863530 (= lt!389814 (addCommutativeForDiffKeys!480 lt!389812 k0!854 v!557 (select (arr!23847 _keys!868) from!1053) lt!389822))))

(declare-fun b!863531 () Bool)

(declare-fun res!586531 () Bool)

(assert (=> b!863531 (=> (not res!586531) (not e!481174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863531 (= res!586531 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26666 () Bool)

(declare-fun mapRes!26666 () Bool)

(declare-fun tp!51229 () Bool)

(declare-fun e!481169 () Bool)

(assert (=> mapNonEmpty!26666 (= mapRes!26666 (and tp!51229 e!481169))))

(declare-fun mapRest!26666 () (Array (_ BitVec 32) ValueCell!7916))

(declare-fun mapValue!26666 () ValueCell!7916)

(declare-fun mapKey!26666 () (_ BitVec 32))

(assert (=> mapNonEmpty!26666 (= (arr!23848 _values!688) (store mapRest!26666 mapKey!26666 mapValue!26666))))

(declare-fun b!863532 () Bool)

(declare-fun res!586536 () Bool)

(assert (=> b!863532 (=> (not res!586536) (not e!481174))))

(assert (=> b!863532 (= res!586536 (and (= (size!24289 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24288 _keys!868) (size!24289 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863533 () Bool)

(declare-fun res!586534 () Bool)

(assert (=> b!863533 (=> (not res!586534) (not e!481174))))

(declare-datatypes ((List!16879 0))(
  ( (Nil!16876) (Cons!16875 (h!18012 (_ BitVec 64)) (t!23712 List!16879)) )
))
(declare-fun arrayNoDuplicates!0 (array!49641 (_ BitVec 32) List!16879) Bool)

(assert (=> b!863533 (= res!586534 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16876))))

(declare-fun b!863534 () Bool)

(declare-fun res!586539 () Bool)

(assert (=> b!863534 (=> (not res!586539) (not e!481174))))

(assert (=> b!863534 (= res!586539 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24288 _keys!868))))))

(declare-fun b!863535 () Bool)

(declare-fun e!481176 () Unit!29460)

(declare-fun Unit!29462 () Unit!29460)

(assert (=> b!863535 (= e!481176 Unit!29462)))

(declare-fun b!863536 () Bool)

(declare-fun Unit!29463 () Unit!29460)

(assert (=> b!863536 (= e!481176 Unit!29463)))

(declare-fun lt!389816 () Unit!29460)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49641 (_ BitVec 32) (_ BitVec 32)) Unit!29460)

(assert (=> b!863536 (= lt!389816 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863536 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16876)))

(declare-fun lt!389824 () Unit!29460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29460)

(assert (=> b!863536 (= lt!389824 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863536 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389821 () Unit!29460)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49641 (_ BitVec 64) (_ BitVec 32) List!16879) Unit!29460)

(assert (=> b!863536 (= lt!389821 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16876))))

(assert (=> b!863536 false))

(declare-fun mapIsEmpty!26666 () Bool)

(assert (=> mapIsEmpty!26666 mapRes!26666))

(declare-fun b!863537 () Bool)

(assert (=> b!863537 (= e!481177 e!481172)))

(declare-fun res!586532 () Bool)

(assert (=> b!863537 (=> res!586532 e!481172)))

(assert (=> b!863537 (= res!586532 (= k0!854 (select (arr!23847 _keys!868) from!1053)))))

(assert (=> b!863537 (not (= (select (arr!23847 _keys!868) from!1053) k0!854))))

(declare-fun lt!389815 () Unit!29460)

(assert (=> b!863537 (= lt!389815 e!481176)))

(declare-fun c!92365 () Bool)

(assert (=> b!863537 (= c!92365 (= (select (arr!23847 _keys!868) from!1053) k0!854))))

(declare-fun lt!389813 () ListLongMap!9813)

(assert (=> b!863537 (= lt!389813 lt!389817)))

(assert (=> b!863537 (= lt!389817 (+!2326 lt!389810 lt!389811))))

(assert (=> b!863537 (= lt!389811 (tuple2!11043 (select (arr!23847 _keys!868) from!1053) lt!389822))))

(declare-fun get!12594 (ValueCell!7916 V!27329) V!27329)

(declare-fun dynLambda!1152 (Int (_ BitVec 64)) V!27329)

(assert (=> b!863537 (= lt!389822 (get!12594 (select (arr!23848 _values!688) from!1053) (dynLambda!1152 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863538 () Bool)

(declare-fun res!586530 () Bool)

(assert (=> b!863538 (=> (not res!586530) (not e!481174))))

(assert (=> b!863538 (= res!586530 (validKeyInArray!0 k0!854))))

(declare-fun b!863539 () Bool)

(assert (=> b!863539 (= e!481169 tp_is_empty!16711)))

(declare-fun b!863540 () Bool)

(assert (=> b!863540 (= e!481174 e!481175)))

(declare-fun res!586537 () Bool)

(assert (=> b!863540 (=> (not res!586537) (not e!481175))))

(assert (=> b!863540 (= res!586537 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863540 (= lt!389813 (getCurrentListMapNoExtraKeys!2973 _keys!868 lt!389819 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863540 (= lt!389819 (array!49644 (store (arr!23848 _values!688) i!612 (ValueCellFull!7916 v!557)) (size!24289 _values!688)))))

(declare-fun lt!389823 () ListLongMap!9813)

(assert (=> b!863540 (= lt!389823 (getCurrentListMapNoExtraKeys!2973 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863541 () Bool)

(declare-fun e!481171 () Bool)

(assert (=> b!863541 (= e!481173 (and e!481171 mapRes!26666))))

(declare-fun condMapEmpty!26666 () Bool)

(declare-fun mapDefault!26666 () ValueCell!7916)

(assert (=> b!863541 (= condMapEmpty!26666 (= (arr!23848 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7916)) mapDefault!26666)))))

(declare-fun b!863542 () Bool)

(declare-fun res!586540 () Bool)

(assert (=> b!863542 (=> (not res!586540) (not e!481174))))

(assert (=> b!863542 (= res!586540 (and (= (select (arr!23847 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863543 () Bool)

(assert (=> b!863543 (= e!481171 tp_is_empty!16711)))

(assert (= (and start!73828 res!586533) b!863531))

(assert (= (and b!863531 res!586531) b!863532))

(assert (= (and b!863532 res!586536) b!863528))

(assert (= (and b!863528 res!586535) b!863533))

(assert (= (and b!863533 res!586534) b!863534))

(assert (= (and b!863534 res!586539) b!863538))

(assert (= (and b!863538 res!586530) b!863542))

(assert (= (and b!863542 res!586540) b!863540))

(assert (= (and b!863540 res!586537) b!863529))

(assert (= (and b!863529 (not res!586538)) b!863537))

(assert (= (and b!863537 c!92365) b!863536))

(assert (= (and b!863537 (not c!92365)) b!863535))

(assert (= (and b!863537 (not res!586532)) b!863530))

(assert (= (and b!863541 condMapEmpty!26666) mapIsEmpty!26666))

(assert (= (and b!863541 (not condMapEmpty!26666)) mapNonEmpty!26666))

(get-info :version)

(assert (= (and mapNonEmpty!26666 ((_ is ValueCellFull!7916) mapValue!26666)) b!863539))

(assert (= (and b!863541 ((_ is ValueCellFull!7916) mapDefault!26666)) b!863543))

(assert (= start!73828 b!863541))

(declare-fun b_lambda!11941 () Bool)

(assert (=> (not b_lambda!11941) (not b!863537)))

(declare-fun t!23710 () Bool)

(declare-fun tb!4689 () Bool)

(assert (=> (and start!73828 (= defaultEntry!696 defaultEntry!696) t!23710) tb!4689))

(declare-fun result!8997 () Bool)

(assert (=> tb!4689 (= result!8997 tp_is_empty!16711)))

(assert (=> b!863537 t!23710))

(declare-fun b_and!24141 () Bool)

(assert (= b_and!24139 (and (=> t!23710 result!8997) b_and!24141)))

(declare-fun m!804965 () Bool)

(assert (=> b!863533 m!804965))

(declare-fun m!804967 () Bool)

(assert (=> b!863531 m!804967))

(declare-fun m!804969 () Bool)

(assert (=> b!863536 m!804969))

(declare-fun m!804971 () Bool)

(assert (=> b!863536 m!804971))

(declare-fun m!804973 () Bool)

(assert (=> b!863536 m!804973))

(declare-fun m!804975 () Bool)

(assert (=> b!863536 m!804975))

(declare-fun m!804977 () Bool)

(assert (=> b!863536 m!804977))

(declare-fun m!804979 () Bool)

(assert (=> b!863540 m!804979))

(declare-fun m!804981 () Bool)

(assert (=> b!863540 m!804981))

(declare-fun m!804983 () Bool)

(assert (=> b!863540 m!804983))

(declare-fun m!804985 () Bool)

(assert (=> b!863538 m!804985))

(declare-fun m!804987 () Bool)

(assert (=> b!863530 m!804987))

(assert (=> b!863530 m!804987))

(declare-fun m!804989 () Bool)

(assert (=> b!863530 m!804989))

(declare-fun m!804991 () Bool)

(assert (=> b!863530 m!804991))

(assert (=> b!863530 m!804991))

(declare-fun m!804993 () Bool)

(assert (=> b!863530 m!804993))

(declare-fun m!804995 () Bool)

(assert (=> mapNonEmpty!26666 m!804995))

(declare-fun m!804997 () Bool)

(assert (=> b!863537 m!804997))

(declare-fun m!804999 () Bool)

(assert (=> b!863537 m!804999))

(declare-fun m!805001 () Bool)

(assert (=> b!863537 m!805001))

(declare-fun m!805003 () Bool)

(assert (=> b!863537 m!805003))

(assert (=> b!863537 m!804999))

(assert (=> b!863537 m!804991))

(assert (=> b!863537 m!805001))

(declare-fun m!805005 () Bool)

(assert (=> b!863529 m!805005))

(assert (=> b!863529 m!804991))

(declare-fun m!805007 () Bool)

(assert (=> b!863529 m!805007))

(assert (=> b!863529 m!804991))

(declare-fun m!805009 () Bool)

(assert (=> b!863529 m!805009))

(declare-fun m!805011 () Bool)

(assert (=> b!863529 m!805011))

(declare-fun m!805013 () Bool)

(assert (=> b!863529 m!805013))

(declare-fun m!805015 () Bool)

(assert (=> b!863528 m!805015))

(declare-fun m!805017 () Bool)

(assert (=> b!863542 m!805017))

(declare-fun m!805019 () Bool)

(assert (=> start!73828 m!805019))

(declare-fun m!805021 () Bool)

(assert (=> start!73828 m!805021))

(check-sat (not b!863529) (not start!73828) (not mapNonEmpty!26666) (not b!863538) (not b!863537) tp_is_empty!16711 (not b!863530) (not b!863533) b_and!24141 (not b!863528) (not b_lambda!11941) (not b!863540) (not b!863531) (not b_next!14575) (not b!863536))
(check-sat b_and!24141 (not b_next!14575))
