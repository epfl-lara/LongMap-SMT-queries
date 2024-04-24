; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73906 () Bool)

(assert start!73906)

(declare-fun b_free!14653 () Bool)

(declare-fun b_next!14653 () Bool)

(assert (=> start!73906 (= b_free!14653 (not b_next!14653))))

(declare-fun tp!51463 () Bool)

(declare-fun b_and!24295 () Bool)

(assert (=> start!73906 (= tp!51463 b_and!24295)))

(declare-fun b!865478 () Bool)

(declare-fun res!587820 () Bool)

(declare-fun e!482224 () Bool)

(assert (=> b!865478 (=> (not res!587820) (not e!482224))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49789 0))(
  ( (array!49790 (arr!23921 (Array (_ BitVec 32) (_ BitVec 64))) (size!24362 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49789)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865478 (= res!587820 (and (= (select (arr!23921 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865479 () Bool)

(declare-fun res!587827 () Bool)

(assert (=> b!865479 (=> (not res!587827) (not e!482224))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865479 (= res!587827 (validMask!0 mask!1196))))

(declare-fun b!865480 () Bool)

(declare-fun e!482226 () Bool)

(declare-fun e!482222 () Bool)

(assert (=> b!865480 (= e!482226 (not e!482222))))

(declare-fun res!587823 () Bool)

(assert (=> b!865480 (=> res!587823 e!482222)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865480 (= res!587823 (not (validKeyInArray!0 (select (arr!23921 _keys!868) from!1053))))))

(declare-datatypes ((V!27433 0))(
  ( (V!27434 (val!8442 Int)) )
))
(declare-datatypes ((tuple2!11102 0))(
  ( (tuple2!11103 (_1!5562 (_ BitVec 64)) (_2!5562 V!27433)) )
))
(declare-datatypes ((List!16932 0))(
  ( (Nil!16929) (Cons!16928 (h!18065 tuple2!11102) (t!23843 List!16932)) )
))
(declare-datatypes ((ListLongMap!9873 0))(
  ( (ListLongMap!9874 (toList!4952 List!16932)) )
))
(declare-fun lt!391686 () ListLongMap!9873)

(declare-fun lt!391689 () ListLongMap!9873)

(assert (=> b!865480 (= lt!391686 lt!391689)))

(declare-fun lt!391691 () ListLongMap!9873)

(declare-fun lt!391684 () tuple2!11102)

(declare-fun +!2355 (ListLongMap!9873 tuple2!11102) ListLongMap!9873)

(assert (=> b!865480 (= lt!391689 (+!2355 lt!391691 lt!391684))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7955 0))(
  ( (ValueCellFull!7955 (v!10867 V!27433)) (EmptyCell!7955) )
))
(declare-datatypes ((array!49791 0))(
  ( (array!49792 (arr!23922 (Array (_ BitVec 32) ValueCell!7955)) (size!24363 (_ BitVec 32))) )
))
(declare-fun lt!391692 () array!49791)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27433)

(declare-fun zeroValue!654 () V!27433)

(declare-fun getCurrentListMapNoExtraKeys!3002 (array!49789 array!49791 (_ BitVec 32) (_ BitVec 32) V!27433 V!27433 (_ BitVec 32) Int) ListLongMap!9873)

(assert (=> b!865480 (= lt!391686 (getCurrentListMapNoExtraKeys!3002 _keys!868 lt!391692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27433)

(assert (=> b!865480 (= lt!391684 (tuple2!11103 k0!854 v!557))))

(declare-fun _values!688 () array!49791)

(assert (=> b!865480 (= lt!391691 (getCurrentListMapNoExtraKeys!3002 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29570 0))(
  ( (Unit!29571) )
))
(declare-fun lt!391694 () Unit!29570)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!538 (array!49789 array!49791 (_ BitVec 32) (_ BitVec 32) V!27433 V!27433 (_ BitVec 32) (_ BitVec 64) V!27433 (_ BitVec 32) Int) Unit!29570)

(assert (=> b!865480 (= lt!391694 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!538 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865481 () Bool)

(declare-fun e!482223 () Bool)

(assert (=> b!865481 (= e!482222 e!482223)))

(declare-fun res!587826 () Bool)

(assert (=> b!865481 (=> res!587826 e!482223)))

(assert (=> b!865481 (= res!587826 (= k0!854 (select (arr!23921 _keys!868) from!1053)))))

(assert (=> b!865481 (not (= (select (arr!23921 _keys!868) from!1053) k0!854))))

(declare-fun lt!391687 () Unit!29570)

(declare-fun e!482228 () Unit!29570)

(assert (=> b!865481 (= lt!391687 e!482228)))

(declare-fun c!92482 () Bool)

(assert (=> b!865481 (= c!92482 (= (select (arr!23921 _keys!868) from!1053) k0!854))))

(declare-fun lt!391683 () ListLongMap!9873)

(declare-fun lt!391696 () ListLongMap!9873)

(assert (=> b!865481 (= lt!391683 lt!391696)))

(declare-fun lt!391693 () tuple2!11102)

(assert (=> b!865481 (= lt!391696 (+!2355 lt!391689 lt!391693))))

(declare-fun lt!391685 () V!27433)

(assert (=> b!865481 (= lt!391693 (tuple2!11103 (select (arr!23921 _keys!868) from!1053) lt!391685))))

(declare-fun get!12646 (ValueCell!7955 V!27433) V!27433)

(declare-fun dynLambda!1178 (Int (_ BitVec 64)) V!27433)

(assert (=> b!865481 (= lt!391685 (get!12646 (select (arr!23922 _values!688) from!1053) (dynLambda!1178 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865482 () Bool)

(declare-fun res!587819 () Bool)

(assert (=> b!865482 (=> (not res!587819) (not e!482224))))

(assert (=> b!865482 (= res!587819 (validKeyInArray!0 k0!854))))

(declare-fun res!587825 () Bool)

(assert (=> start!73906 (=> (not res!587825) (not e!482224))))

(assert (=> start!73906 (= res!587825 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24362 _keys!868))))))

(assert (=> start!73906 e!482224))

(declare-fun tp_is_empty!16789 () Bool)

(assert (=> start!73906 tp_is_empty!16789))

(assert (=> start!73906 true))

(assert (=> start!73906 tp!51463))

(declare-fun array_inv!18968 (array!49789) Bool)

(assert (=> start!73906 (array_inv!18968 _keys!868)))

(declare-fun e!482225 () Bool)

(declare-fun array_inv!18969 (array!49791) Bool)

(assert (=> start!73906 (and (array_inv!18969 _values!688) e!482225)))

(declare-fun b!865483 () Bool)

(declare-fun e!482229 () Bool)

(assert (=> b!865483 (= e!482229 tp_is_empty!16789)))

(declare-fun b!865484 () Bool)

(declare-fun res!587822 () Bool)

(assert (=> b!865484 (=> (not res!587822) (not e!482224))))

(assert (=> b!865484 (= res!587822 (and (= (size!24363 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24362 _keys!868) (size!24363 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26783 () Bool)

(declare-fun mapRes!26783 () Bool)

(declare-fun tp!51464 () Bool)

(declare-fun e!482227 () Bool)

(assert (=> mapNonEmpty!26783 (= mapRes!26783 (and tp!51464 e!482227))))

(declare-fun mapValue!26783 () ValueCell!7955)

(declare-fun mapKey!26783 () (_ BitVec 32))

(declare-fun mapRest!26783 () (Array (_ BitVec 32) ValueCell!7955))

(assert (=> mapNonEmpty!26783 (= (arr!23922 _values!688) (store mapRest!26783 mapKey!26783 mapValue!26783))))

(declare-fun b!865485 () Bool)

(assert (=> b!865485 (= e!482227 tp_is_empty!16789)))

(declare-fun b!865486 () Bool)

(assert (=> b!865486 (= e!482223 true)))

(assert (=> b!865486 (= lt!391696 (+!2355 (+!2355 lt!391691 lt!391693) lt!391684))))

(declare-fun lt!391690 () Unit!29570)

(declare-fun addCommutativeForDiffKeys!506 (ListLongMap!9873 (_ BitVec 64) V!27433 (_ BitVec 64) V!27433) Unit!29570)

(assert (=> b!865486 (= lt!391690 (addCommutativeForDiffKeys!506 lt!391691 k0!854 v!557 (select (arr!23921 _keys!868) from!1053) lt!391685))))

(declare-fun b!865487 () Bool)

(declare-fun res!587817 () Bool)

(assert (=> b!865487 (=> (not res!587817) (not e!482224))))

(declare-datatypes ((List!16933 0))(
  ( (Nil!16930) (Cons!16929 (h!18066 (_ BitVec 64)) (t!23844 List!16933)) )
))
(declare-fun arrayNoDuplicates!0 (array!49789 (_ BitVec 32) List!16933) Bool)

(assert (=> b!865487 (= res!587817 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16930))))

(declare-fun b!865488 () Bool)

(declare-fun res!587818 () Bool)

(assert (=> b!865488 (=> (not res!587818) (not e!482224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49789 (_ BitVec 32)) Bool)

(assert (=> b!865488 (= res!587818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865489 () Bool)

(declare-fun Unit!29572 () Unit!29570)

(assert (=> b!865489 (= e!482228 Unit!29572)))

(declare-fun b!865490 () Bool)

(declare-fun res!587821 () Bool)

(assert (=> b!865490 (=> (not res!587821) (not e!482224))))

(assert (=> b!865490 (= res!587821 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24362 _keys!868))))))

(declare-fun mapIsEmpty!26783 () Bool)

(assert (=> mapIsEmpty!26783 mapRes!26783))

(declare-fun b!865491 () Bool)

(assert (=> b!865491 (= e!482224 e!482226)))

(declare-fun res!587824 () Bool)

(assert (=> b!865491 (=> (not res!587824) (not e!482226))))

(assert (=> b!865491 (= res!587824 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865491 (= lt!391683 (getCurrentListMapNoExtraKeys!3002 _keys!868 lt!391692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865491 (= lt!391692 (array!49792 (store (arr!23922 _values!688) i!612 (ValueCellFull!7955 v!557)) (size!24363 _values!688)))))

(declare-fun lt!391682 () ListLongMap!9873)

(assert (=> b!865491 (= lt!391682 (getCurrentListMapNoExtraKeys!3002 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865492 () Bool)

(assert (=> b!865492 (= e!482225 (and e!482229 mapRes!26783))))

(declare-fun condMapEmpty!26783 () Bool)

(declare-fun mapDefault!26783 () ValueCell!7955)

(assert (=> b!865492 (= condMapEmpty!26783 (= (arr!23922 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7955)) mapDefault!26783)))))

(declare-fun b!865493 () Bool)

(declare-fun Unit!29573 () Unit!29570)

(assert (=> b!865493 (= e!482228 Unit!29573)))

(declare-fun lt!391695 () Unit!29570)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49789 (_ BitVec 32) (_ BitVec 32)) Unit!29570)

(assert (=> b!865493 (= lt!391695 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865493 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16930)))

(declare-fun lt!391688 () Unit!29570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49789 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29570)

(assert (=> b!865493 (= lt!391688 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865493 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391697 () Unit!29570)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49789 (_ BitVec 64) (_ BitVec 32) List!16933) Unit!29570)

(assert (=> b!865493 (= lt!391697 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16930))))

(assert (=> b!865493 false))

(assert (= (and start!73906 res!587825) b!865479))

(assert (= (and b!865479 res!587827) b!865484))

(assert (= (and b!865484 res!587822) b!865488))

(assert (= (and b!865488 res!587818) b!865487))

(assert (= (and b!865487 res!587817) b!865490))

(assert (= (and b!865490 res!587821) b!865482))

(assert (= (and b!865482 res!587819) b!865478))

(assert (= (and b!865478 res!587820) b!865491))

(assert (= (and b!865491 res!587824) b!865480))

(assert (= (and b!865480 (not res!587823)) b!865481))

(assert (= (and b!865481 c!92482) b!865493))

(assert (= (and b!865481 (not c!92482)) b!865489))

(assert (= (and b!865481 (not res!587826)) b!865486))

(assert (= (and b!865492 condMapEmpty!26783) mapIsEmpty!26783))

(assert (= (and b!865492 (not condMapEmpty!26783)) mapNonEmpty!26783))

(get-info :version)

(assert (= (and mapNonEmpty!26783 ((_ is ValueCellFull!7955) mapValue!26783)) b!865485))

(assert (= (and b!865492 ((_ is ValueCellFull!7955) mapDefault!26783)) b!865483))

(assert (= start!73906 b!865492))

(declare-fun b_lambda!12019 () Bool)

(assert (=> (not b_lambda!12019) (not b!865481)))

(declare-fun t!23842 () Bool)

(declare-fun tb!4767 () Bool)

(assert (=> (and start!73906 (= defaultEntry!696 defaultEntry!696) t!23842) tb!4767))

(declare-fun result!9153 () Bool)

(assert (=> tb!4767 (= result!9153 tp_is_empty!16789)))

(assert (=> b!865481 t!23842))

(declare-fun b_and!24297 () Bool)

(assert (= b_and!24295 (and (=> t!23842 result!9153) b_and!24297)))

(declare-fun m!807227 () Bool)

(assert (=> b!865481 m!807227))

(declare-fun m!807229 () Bool)

(assert (=> b!865481 m!807229))

(declare-fun m!807231 () Bool)

(assert (=> b!865481 m!807231))

(declare-fun m!807233 () Bool)

(assert (=> b!865481 m!807233))

(assert (=> b!865481 m!807229))

(declare-fun m!807235 () Bool)

(assert (=> b!865481 m!807235))

(assert (=> b!865481 m!807231))

(declare-fun m!807237 () Bool)

(assert (=> start!73906 m!807237))

(declare-fun m!807239 () Bool)

(assert (=> start!73906 m!807239))

(declare-fun m!807241 () Bool)

(assert (=> b!865482 m!807241))

(declare-fun m!807243 () Bool)

(assert (=> b!865478 m!807243))

(declare-fun m!807245 () Bool)

(assert (=> b!865491 m!807245))

(declare-fun m!807247 () Bool)

(assert (=> b!865491 m!807247))

(declare-fun m!807249 () Bool)

(assert (=> b!865491 m!807249))

(declare-fun m!807251 () Bool)

(assert (=> b!865479 m!807251))

(declare-fun m!807253 () Bool)

(assert (=> b!865493 m!807253))

(declare-fun m!807255 () Bool)

(assert (=> b!865493 m!807255))

(declare-fun m!807257 () Bool)

(assert (=> b!865493 m!807257))

(declare-fun m!807259 () Bool)

(assert (=> b!865493 m!807259))

(declare-fun m!807261 () Bool)

(assert (=> b!865493 m!807261))

(declare-fun m!807263 () Bool)

(assert (=> b!865480 m!807263))

(declare-fun m!807265 () Bool)

(assert (=> b!865480 m!807265))

(assert (=> b!865480 m!807235))

(declare-fun m!807267 () Bool)

(assert (=> b!865480 m!807267))

(declare-fun m!807269 () Bool)

(assert (=> b!865480 m!807269))

(assert (=> b!865480 m!807235))

(declare-fun m!807271 () Bool)

(assert (=> b!865480 m!807271))

(declare-fun m!807273 () Bool)

(assert (=> b!865487 m!807273))

(declare-fun m!807275 () Bool)

(assert (=> mapNonEmpty!26783 m!807275))

(declare-fun m!807277 () Bool)

(assert (=> b!865486 m!807277))

(assert (=> b!865486 m!807277))

(declare-fun m!807279 () Bool)

(assert (=> b!865486 m!807279))

(assert (=> b!865486 m!807235))

(assert (=> b!865486 m!807235))

(declare-fun m!807281 () Bool)

(assert (=> b!865486 m!807281))

(declare-fun m!807283 () Bool)

(assert (=> b!865488 m!807283))

(check-sat (not b!865488) b_and!24297 (not b!865486) (not start!73906) (not b!865481) (not b!865493) (not b!865480) (not b_lambda!12019) (not mapNonEmpty!26783) tp_is_empty!16789 (not b!865482) (not b_next!14653) (not b!865491) (not b!865487) (not b!865479))
(check-sat b_and!24297 (not b_next!14653))
