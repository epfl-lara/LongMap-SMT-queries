; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73564 () Bool)

(assert start!73564)

(declare-fun b_free!14497 () Bool)

(declare-fun b_next!14497 () Bool)

(assert (=> start!73564 (= b_free!14497 (not b_next!14497))))

(declare-fun tp!50995 () Bool)

(declare-fun b_and!23947 () Bool)

(assert (=> start!73564 (= tp!50995 b_and!23947)))

(declare-fun b!860524 () Bool)

(declare-fun res!584883 () Bool)

(declare-fun e!479480 () Bool)

(assert (=> b!860524 (=> (not res!584883) (not e!479480))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860524 (= res!584883 (validKeyInArray!0 k0!854))))

(declare-fun b!860525 () Bool)

(declare-fun res!584877 () Bool)

(assert (=> b!860525 (=> (not res!584877) (not e!479480))))

(declare-datatypes ((array!49425 0))(
  ( (array!49426 (arr!23744 (Array (_ BitVec 32) (_ BitVec 64))) (size!24186 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49425)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49425 (_ BitVec 32)) Bool)

(assert (=> b!860525 (= res!584877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860526 () Bool)

(declare-fun res!584879 () Bool)

(assert (=> b!860526 (=> (not res!584879) (not e!479480))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860526 (= res!584879 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24186 _keys!868))))))

(declare-fun mapNonEmpty!26549 () Bool)

(declare-fun mapRes!26549 () Bool)

(declare-fun tp!50996 () Bool)

(declare-fun e!479475 () Bool)

(assert (=> mapNonEmpty!26549 (= mapRes!26549 (and tp!50996 e!479475))))

(declare-datatypes ((V!27225 0))(
  ( (V!27226 (val!8364 Int)) )
))
(declare-datatypes ((ValueCell!7877 0))(
  ( (ValueCellFull!7877 (v!10783 V!27225)) (EmptyCell!7877) )
))
(declare-fun mapRest!26549 () (Array (_ BitVec 32) ValueCell!7877))

(declare-fun mapValue!26549 () ValueCell!7877)

(declare-datatypes ((array!49427 0))(
  ( (array!49428 (arr!23745 (Array (_ BitVec 32) ValueCell!7877)) (size!24187 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49427)

(declare-fun mapKey!26549 () (_ BitVec 32))

(assert (=> mapNonEmpty!26549 (= (arr!23745 _values!688) (store mapRest!26549 mapKey!26549 mapValue!26549))))

(declare-fun b!860527 () Bool)

(declare-fun e!479481 () Bool)

(assert (=> b!860527 (= e!479481 true)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860527 (not (= (select (arr!23744 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29263 0))(
  ( (Unit!29264) )
))
(declare-fun lt!387791 () Unit!29263)

(declare-fun e!479478 () Unit!29263)

(assert (=> b!860527 (= lt!387791 e!479478)))

(declare-fun c!91901 () Bool)

(assert (=> b!860527 (= c!91901 (= (select (arr!23744 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11060 0))(
  ( (tuple2!11061 (_1!5541 (_ BitVec 64)) (_2!5541 V!27225)) )
))
(declare-datatypes ((List!16859 0))(
  ( (Nil!16856) (Cons!16855 (h!17986 tuple2!11060) (t!23613 List!16859)) )
))
(declare-datatypes ((ListLongMap!9819 0))(
  ( (ListLongMap!9820 (toList!4925 List!16859)) )
))
(declare-fun lt!387787 () ListLongMap!9819)

(declare-fun lt!387785 () ListLongMap!9819)

(declare-fun defaultEntry!696 () Int)

(declare-fun +!2298 (ListLongMap!9819 tuple2!11060) ListLongMap!9819)

(declare-fun get!12523 (ValueCell!7877 V!27225) V!27225)

(declare-fun dynLambda!1110 (Int (_ BitVec 64)) V!27225)

(assert (=> b!860527 (= lt!387787 (+!2298 lt!387785 (tuple2!11061 (select (arr!23744 _keys!868) from!1053) (get!12523 (select (arr!23745 _values!688) from!1053) (dynLambda!1110 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!584884 () Bool)

(assert (=> start!73564 (=> (not res!584884) (not e!479480))))

(assert (=> start!73564 (= res!584884 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24186 _keys!868))))))

(assert (=> start!73564 e!479480))

(declare-fun tp_is_empty!16633 () Bool)

(assert (=> start!73564 tp_is_empty!16633))

(assert (=> start!73564 true))

(assert (=> start!73564 tp!50995))

(declare-fun array_inv!18860 (array!49425) Bool)

(assert (=> start!73564 (array_inv!18860 _keys!868)))

(declare-fun e!479476 () Bool)

(declare-fun array_inv!18861 (array!49427) Bool)

(assert (=> start!73564 (and (array_inv!18861 _values!688) e!479476)))

(declare-fun b!860528 () Bool)

(declare-fun e!479477 () Bool)

(assert (=> b!860528 (= e!479480 e!479477)))

(declare-fun res!584878 () Bool)

(assert (=> b!860528 (=> (not res!584878) (not e!479477))))

(assert (=> b!860528 (= res!584878 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!387788 () array!49427)

(declare-fun minValue!654 () V!27225)

(declare-fun zeroValue!654 () V!27225)

(declare-fun getCurrentListMapNoExtraKeys!2928 (array!49425 array!49427 (_ BitVec 32) (_ BitVec 32) V!27225 V!27225 (_ BitVec 32) Int) ListLongMap!9819)

(assert (=> b!860528 (= lt!387787 (getCurrentListMapNoExtraKeys!2928 _keys!868 lt!387788 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27225)

(assert (=> b!860528 (= lt!387788 (array!49428 (store (arr!23745 _values!688) i!612 (ValueCellFull!7877 v!557)) (size!24187 _values!688)))))

(declare-fun lt!387783 () ListLongMap!9819)

(assert (=> b!860528 (= lt!387783 (getCurrentListMapNoExtraKeys!2928 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860529 () Bool)

(declare-fun Unit!29265 () Unit!29263)

(assert (=> b!860529 (= e!479478 Unit!29265)))

(declare-fun lt!387784 () Unit!29263)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49425 (_ BitVec 32) (_ BitVec 32)) Unit!29263)

(assert (=> b!860529 (= lt!387784 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16860 0))(
  ( (Nil!16857) (Cons!16856 (h!17987 (_ BitVec 64)) (t!23614 List!16860)) )
))
(declare-fun arrayNoDuplicates!0 (array!49425 (_ BitVec 32) List!16860) Bool)

(assert (=> b!860529 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16857)))

(declare-fun lt!387790 () Unit!29263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29263)

(assert (=> b!860529 (= lt!387790 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860529 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387781 () Unit!29263)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49425 (_ BitVec 64) (_ BitVec 32) List!16860) Unit!29263)

(assert (=> b!860529 (= lt!387781 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16857))))

(assert (=> b!860529 false))

(declare-fun b!860530 () Bool)

(assert (=> b!860530 (= e!479477 (not e!479481))))

(declare-fun res!584886 () Bool)

(assert (=> b!860530 (=> res!584886 e!479481)))

(assert (=> b!860530 (= res!584886 (not (validKeyInArray!0 (select (arr!23744 _keys!868) from!1053))))))

(declare-fun lt!387782 () ListLongMap!9819)

(assert (=> b!860530 (= lt!387782 lt!387785)))

(declare-fun lt!387786 () ListLongMap!9819)

(assert (=> b!860530 (= lt!387785 (+!2298 lt!387786 (tuple2!11061 k0!854 v!557)))))

(assert (=> b!860530 (= lt!387782 (getCurrentListMapNoExtraKeys!2928 _keys!868 lt!387788 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860530 (= lt!387786 (getCurrentListMapNoExtraKeys!2928 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387789 () Unit!29263)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!489 (array!49425 array!49427 (_ BitVec 32) (_ BitVec 32) V!27225 V!27225 (_ BitVec 32) (_ BitVec 64) V!27225 (_ BitVec 32) Int) Unit!29263)

(assert (=> b!860530 (= lt!387789 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!489 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860531 () Bool)

(declare-fun e!479479 () Bool)

(assert (=> b!860531 (= e!479479 tp_is_empty!16633)))

(declare-fun mapIsEmpty!26549 () Bool)

(assert (=> mapIsEmpty!26549 mapRes!26549))

(declare-fun b!860532 () Bool)

(declare-fun res!584880 () Bool)

(assert (=> b!860532 (=> (not res!584880) (not e!479480))))

(assert (=> b!860532 (= res!584880 (and (= (size!24187 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24186 _keys!868) (size!24187 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860533 () Bool)

(declare-fun res!584881 () Bool)

(assert (=> b!860533 (=> (not res!584881) (not e!479480))))

(assert (=> b!860533 (= res!584881 (and (= (select (arr!23744 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860534 () Bool)

(assert (=> b!860534 (= e!479476 (and e!479479 mapRes!26549))))

(declare-fun condMapEmpty!26549 () Bool)

(declare-fun mapDefault!26549 () ValueCell!7877)

(assert (=> b!860534 (= condMapEmpty!26549 (= (arr!23745 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7877)) mapDefault!26549)))))

(declare-fun b!860535 () Bool)

(assert (=> b!860535 (= e!479475 tp_is_empty!16633)))

(declare-fun b!860536 () Bool)

(declare-fun Unit!29266 () Unit!29263)

(assert (=> b!860536 (= e!479478 Unit!29266)))

(declare-fun b!860537 () Bool)

(declare-fun res!584885 () Bool)

(assert (=> b!860537 (=> (not res!584885) (not e!479480))))

(assert (=> b!860537 (= res!584885 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16857))))

(declare-fun b!860538 () Bool)

(declare-fun res!584882 () Bool)

(assert (=> b!860538 (=> (not res!584882) (not e!479480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860538 (= res!584882 (validMask!0 mask!1196))))

(assert (= (and start!73564 res!584884) b!860538))

(assert (= (and b!860538 res!584882) b!860532))

(assert (= (and b!860532 res!584880) b!860525))

(assert (= (and b!860525 res!584877) b!860537))

(assert (= (and b!860537 res!584885) b!860526))

(assert (= (and b!860526 res!584879) b!860524))

(assert (= (and b!860524 res!584883) b!860533))

(assert (= (and b!860533 res!584881) b!860528))

(assert (= (and b!860528 res!584878) b!860530))

(assert (= (and b!860530 (not res!584886)) b!860527))

(assert (= (and b!860527 c!91901) b!860529))

(assert (= (and b!860527 (not c!91901)) b!860536))

(assert (= (and b!860534 condMapEmpty!26549) mapIsEmpty!26549))

(assert (= (and b!860534 (not condMapEmpty!26549)) mapNonEmpty!26549))

(get-info :version)

(assert (= (and mapNonEmpty!26549 ((_ is ValueCellFull!7877) mapValue!26549)) b!860535))

(assert (= (and b!860534 ((_ is ValueCellFull!7877) mapDefault!26549)) b!860531))

(assert (= start!73564 b!860534))

(declare-fun b_lambda!11831 () Bool)

(assert (=> (not b_lambda!11831) (not b!860527)))

(declare-fun t!23612 () Bool)

(declare-fun tb!4611 () Bool)

(assert (=> (and start!73564 (= defaultEntry!696 defaultEntry!696) t!23612) tb!4611))

(declare-fun result!8841 () Bool)

(assert (=> tb!4611 (= result!8841 tp_is_empty!16633)))

(assert (=> b!860527 t!23612))

(declare-fun b_and!23949 () Bool)

(assert (= b_and!23947 (and (=> t!23612 result!8841) b_and!23949)))

(declare-fun m!800835 () Bool)

(assert (=> b!860533 m!800835))

(declare-fun m!800837 () Bool)

(assert (=> b!860525 m!800837))

(declare-fun m!800839 () Bool)

(assert (=> b!860527 m!800839))

(declare-fun m!800841 () Bool)

(assert (=> b!860527 m!800841))

(declare-fun m!800843 () Bool)

(assert (=> b!860527 m!800843))

(declare-fun m!800845 () Bool)

(assert (=> b!860527 m!800845))

(assert (=> b!860527 m!800841))

(declare-fun m!800847 () Bool)

(assert (=> b!860527 m!800847))

(assert (=> b!860527 m!800843))

(declare-fun m!800849 () Bool)

(assert (=> b!860528 m!800849))

(declare-fun m!800851 () Bool)

(assert (=> b!860528 m!800851))

(declare-fun m!800853 () Bool)

(assert (=> b!860528 m!800853))

(declare-fun m!800855 () Bool)

(assert (=> b!860529 m!800855))

(declare-fun m!800857 () Bool)

(assert (=> b!860529 m!800857))

(declare-fun m!800859 () Bool)

(assert (=> b!860529 m!800859))

(declare-fun m!800861 () Bool)

(assert (=> b!860529 m!800861))

(declare-fun m!800863 () Bool)

(assert (=> b!860529 m!800863))

(declare-fun m!800865 () Bool)

(assert (=> b!860530 m!800865))

(assert (=> b!860530 m!800847))

(declare-fun m!800867 () Bool)

(assert (=> b!860530 m!800867))

(assert (=> b!860530 m!800847))

(declare-fun m!800869 () Bool)

(assert (=> b!860530 m!800869))

(declare-fun m!800871 () Bool)

(assert (=> b!860530 m!800871))

(declare-fun m!800873 () Bool)

(assert (=> b!860530 m!800873))

(declare-fun m!800875 () Bool)

(assert (=> b!860537 m!800875))

(declare-fun m!800877 () Bool)

(assert (=> start!73564 m!800877))

(declare-fun m!800879 () Bool)

(assert (=> start!73564 m!800879))

(declare-fun m!800881 () Bool)

(assert (=> mapNonEmpty!26549 m!800881))

(declare-fun m!800883 () Bool)

(assert (=> b!860524 m!800883))

(declare-fun m!800885 () Bool)

(assert (=> b!860538 m!800885))

(check-sat (not b!860537) b_and!23949 tp_is_empty!16633 (not b!860529) (not mapNonEmpty!26549) (not start!73564) (not b!860528) (not b!860524) (not b!860527) (not b_lambda!11831) (not b!860530) (not b!860525) (not b_next!14497) (not b!860538))
(check-sat b_and!23949 (not b_next!14497))
