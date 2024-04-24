; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73882 () Bool)

(assert start!73882)

(declare-fun b_free!14629 () Bool)

(declare-fun b_next!14629 () Bool)

(assert (=> start!73882 (= b_free!14629 (not b_next!14629))))

(declare-fun tp!51391 () Bool)

(declare-fun b_and!24247 () Bool)

(assert (=> start!73882 (= tp!51391 b_and!24247)))

(declare-fun b!864878 () Bool)

(declare-fun res!587425 () Bool)

(declare-fun e!481899 () Bool)

(assert (=> b!864878 (=> (not res!587425) (not e!481899))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49741 0))(
  ( (array!49742 (arr!23897 (Array (_ BitVec 32) (_ BitVec 64))) (size!24338 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49741)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864878 (= res!587425 (and (= (select (arr!23897 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864879 () Bool)

(declare-fun res!587428 () Bool)

(assert (=> b!864879 (=> (not res!587428) (not e!481899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864879 (= res!587428 (validKeyInArray!0 k0!854))))

(declare-fun b!864880 () Bool)

(declare-fun e!481900 () Bool)

(assert (=> b!864880 (= e!481899 e!481900)))

(declare-fun res!587426 () Bool)

(assert (=> b!864880 (=> (not res!587426) (not e!481900))))

(assert (=> b!864880 (= res!587426 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27401 0))(
  ( (V!27402 (val!8430 Int)) )
))
(declare-datatypes ((tuple2!11080 0))(
  ( (tuple2!11081 (_1!5551 (_ BitVec 64)) (_2!5551 V!27401)) )
))
(declare-datatypes ((List!16912 0))(
  ( (Nil!16909) (Cons!16908 (h!18045 tuple2!11080) (t!23799 List!16912)) )
))
(declare-datatypes ((ListLongMap!9851 0))(
  ( (ListLongMap!9852 (toList!4941 List!16912)) )
))
(declare-fun lt!391115 () ListLongMap!9851)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7943 0))(
  ( (ValueCellFull!7943 (v!10855 V!27401)) (EmptyCell!7943) )
))
(declare-datatypes ((array!49743 0))(
  ( (array!49744 (arr!23898 (Array (_ BitVec 32) ValueCell!7943)) (size!24339 (_ BitVec 32))) )
))
(declare-fun lt!391114 () array!49743)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27401)

(declare-fun zeroValue!654 () V!27401)

(declare-fun getCurrentListMapNoExtraKeys!2991 (array!49741 array!49743 (_ BitVec 32) (_ BitVec 32) V!27401 V!27401 (_ BitVec 32) Int) ListLongMap!9851)

(assert (=> b!864880 (= lt!391115 (getCurrentListMapNoExtraKeys!2991 _keys!868 lt!391114 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27401)

(declare-fun _values!688 () array!49743)

(assert (=> b!864880 (= lt!391114 (array!49744 (store (arr!23898 _values!688) i!612 (ValueCellFull!7943 v!557)) (size!24339 _values!688)))))

(declare-fun lt!391108 () ListLongMap!9851)

(assert (=> b!864880 (= lt!391108 (getCurrentListMapNoExtraKeys!2991 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!587429 () Bool)

(assert (=> start!73882 (=> (not res!587429) (not e!481899))))

(assert (=> start!73882 (= res!587429 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24338 _keys!868))))))

(assert (=> start!73882 e!481899))

(declare-fun tp_is_empty!16765 () Bool)

(assert (=> start!73882 tp_is_empty!16765))

(assert (=> start!73882 true))

(assert (=> start!73882 tp!51391))

(declare-fun array_inv!18952 (array!49741) Bool)

(assert (=> start!73882 (array_inv!18952 _keys!868)))

(declare-fun e!481905 () Bool)

(declare-fun array_inv!18953 (array!49743) Bool)

(assert (=> start!73882 (and (array_inv!18953 _values!688) e!481905)))

(declare-fun b!864881 () Bool)

(declare-fun res!587424 () Bool)

(assert (=> b!864881 (=> (not res!587424) (not e!481899))))

(assert (=> b!864881 (= res!587424 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24338 _keys!868))))))

(declare-fun b!864882 () Bool)

(declare-fun e!481902 () Bool)

(assert (=> b!864882 (= e!481900 (not e!481902))))

(declare-fun res!587421 () Bool)

(assert (=> b!864882 (=> res!587421 e!481902)))

(assert (=> b!864882 (= res!587421 (not (validKeyInArray!0 (select (arr!23897 _keys!868) from!1053))))))

(declare-fun lt!391118 () ListLongMap!9851)

(declare-fun lt!391107 () ListLongMap!9851)

(assert (=> b!864882 (= lt!391118 lt!391107)))

(declare-fun lt!391111 () ListLongMap!9851)

(declare-fun lt!391109 () tuple2!11080)

(declare-fun +!2344 (ListLongMap!9851 tuple2!11080) ListLongMap!9851)

(assert (=> b!864882 (= lt!391107 (+!2344 lt!391111 lt!391109))))

(assert (=> b!864882 (= lt!391118 (getCurrentListMapNoExtraKeys!2991 _keys!868 lt!391114 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864882 (= lt!391109 (tuple2!11081 k0!854 v!557))))

(assert (=> b!864882 (= lt!391111 (getCurrentListMapNoExtraKeys!2991 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29530 0))(
  ( (Unit!29531) )
))
(declare-fun lt!391110 () Unit!29530)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!529 (array!49741 array!49743 (_ BitVec 32) (_ BitVec 32) V!27401 V!27401 (_ BitVec 32) (_ BitVec 64) V!27401 (_ BitVec 32) Int) Unit!29530)

(assert (=> b!864882 (= lt!391110 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!529 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864883 () Bool)

(declare-fun e!481903 () Bool)

(assert (=> b!864883 (= e!481902 e!481903)))

(declare-fun res!587427 () Bool)

(assert (=> b!864883 (=> res!587427 e!481903)))

(assert (=> b!864883 (= res!587427 (= k0!854 (select (arr!23897 _keys!868) from!1053)))))

(assert (=> b!864883 (not (= (select (arr!23897 _keys!868) from!1053) k0!854))))

(declare-fun lt!391119 () Unit!29530)

(declare-fun e!481901 () Unit!29530)

(assert (=> b!864883 (= lt!391119 e!481901)))

(declare-fun c!92446 () Bool)

(assert (=> b!864883 (= c!92446 (= (select (arr!23897 _keys!868) from!1053) k0!854))))

(declare-fun lt!391117 () ListLongMap!9851)

(assert (=> b!864883 (= lt!391115 lt!391117)))

(declare-fun lt!391113 () tuple2!11080)

(assert (=> b!864883 (= lt!391117 (+!2344 lt!391107 lt!391113))))

(declare-fun lt!391112 () V!27401)

(assert (=> b!864883 (= lt!391113 (tuple2!11081 (select (arr!23897 _keys!868) from!1053) lt!391112))))

(declare-fun get!12629 (ValueCell!7943 V!27401) V!27401)

(declare-fun dynLambda!1169 (Int (_ BitVec 64)) V!27401)

(assert (=> b!864883 (= lt!391112 (get!12629 (select (arr!23898 _values!688) from!1053) (dynLambda!1169 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26747 () Bool)

(declare-fun mapRes!26747 () Bool)

(declare-fun tp!51392 () Bool)

(declare-fun e!481906 () Bool)

(assert (=> mapNonEmpty!26747 (= mapRes!26747 (and tp!51392 e!481906))))

(declare-fun mapValue!26747 () ValueCell!7943)

(declare-fun mapKey!26747 () (_ BitVec 32))

(declare-fun mapRest!26747 () (Array (_ BitVec 32) ValueCell!7943))

(assert (=> mapNonEmpty!26747 (= (arr!23898 _values!688) (store mapRest!26747 mapKey!26747 mapValue!26747))))

(declare-fun b!864884 () Bool)

(declare-fun res!587423 () Bool)

(assert (=> b!864884 (=> (not res!587423) (not e!481899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864884 (= res!587423 (validMask!0 mask!1196))))

(declare-fun b!864885 () Bool)

(declare-fun res!587422 () Bool)

(assert (=> b!864885 (=> (not res!587422) (not e!481899))))

(assert (=> b!864885 (= res!587422 (and (= (size!24339 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24338 _keys!868) (size!24339 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864886 () Bool)

(declare-fun res!587431 () Bool)

(assert (=> b!864886 (=> (not res!587431) (not e!481899))))

(declare-datatypes ((List!16913 0))(
  ( (Nil!16910) (Cons!16909 (h!18046 (_ BitVec 64)) (t!23800 List!16913)) )
))
(declare-fun arrayNoDuplicates!0 (array!49741 (_ BitVec 32) List!16913) Bool)

(assert (=> b!864886 (= res!587431 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16910))))

(declare-fun mapIsEmpty!26747 () Bool)

(assert (=> mapIsEmpty!26747 mapRes!26747))

(declare-fun b!864887 () Bool)

(declare-fun e!481904 () Bool)

(assert (=> b!864887 (= e!481904 tp_is_empty!16765)))

(declare-fun b!864888 () Bool)

(declare-fun Unit!29532 () Unit!29530)

(assert (=> b!864888 (= e!481901 Unit!29532)))

(declare-fun lt!391121 () Unit!29530)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49741 (_ BitVec 32) (_ BitVec 32)) Unit!29530)

(assert (=> b!864888 (= lt!391121 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864888 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16910)))

(declare-fun lt!391120 () Unit!29530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49741 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29530)

(assert (=> b!864888 (= lt!391120 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864888 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391106 () Unit!29530)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49741 (_ BitVec 64) (_ BitVec 32) List!16913) Unit!29530)

(assert (=> b!864888 (= lt!391106 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16910))))

(assert (=> b!864888 false))

(declare-fun b!864889 () Bool)

(assert (=> b!864889 (= e!481906 tp_is_empty!16765)))

(declare-fun b!864890 () Bool)

(declare-fun Unit!29533 () Unit!29530)

(assert (=> b!864890 (= e!481901 Unit!29533)))

(declare-fun b!864891 () Bool)

(assert (=> b!864891 (= e!481905 (and e!481904 mapRes!26747))))

(declare-fun condMapEmpty!26747 () Bool)

(declare-fun mapDefault!26747 () ValueCell!7943)

(assert (=> b!864891 (= condMapEmpty!26747 (= (arr!23898 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7943)) mapDefault!26747)))))

(declare-fun b!864892 () Bool)

(declare-fun res!587430 () Bool)

(assert (=> b!864892 (=> (not res!587430) (not e!481899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49741 (_ BitVec 32)) Bool)

(assert (=> b!864892 (= res!587430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864893 () Bool)

(assert (=> b!864893 (= e!481903 true)))

(assert (=> b!864893 (= lt!391117 (+!2344 (+!2344 lt!391111 lt!391113) lt!391109))))

(declare-fun lt!391116 () Unit!29530)

(declare-fun addCommutativeForDiffKeys!495 (ListLongMap!9851 (_ BitVec 64) V!27401 (_ BitVec 64) V!27401) Unit!29530)

(assert (=> b!864893 (= lt!391116 (addCommutativeForDiffKeys!495 lt!391111 k0!854 v!557 (select (arr!23897 _keys!868) from!1053) lt!391112))))

(assert (= (and start!73882 res!587429) b!864884))

(assert (= (and b!864884 res!587423) b!864885))

(assert (= (and b!864885 res!587422) b!864892))

(assert (= (and b!864892 res!587430) b!864886))

(assert (= (and b!864886 res!587431) b!864881))

(assert (= (and b!864881 res!587424) b!864879))

(assert (= (and b!864879 res!587428) b!864878))

(assert (= (and b!864878 res!587425) b!864880))

(assert (= (and b!864880 res!587426) b!864882))

(assert (= (and b!864882 (not res!587421)) b!864883))

(assert (= (and b!864883 c!92446) b!864888))

(assert (= (and b!864883 (not c!92446)) b!864890))

(assert (= (and b!864883 (not res!587427)) b!864893))

(assert (= (and b!864891 condMapEmpty!26747) mapIsEmpty!26747))

(assert (= (and b!864891 (not condMapEmpty!26747)) mapNonEmpty!26747))

(get-info :version)

(assert (= (and mapNonEmpty!26747 ((_ is ValueCellFull!7943) mapValue!26747)) b!864889))

(assert (= (and b!864891 ((_ is ValueCellFull!7943) mapDefault!26747)) b!864887))

(assert (= start!73882 b!864891))

(declare-fun b_lambda!11995 () Bool)

(assert (=> (not b_lambda!11995) (not b!864883)))

(declare-fun t!23798 () Bool)

(declare-fun tb!4743 () Bool)

(assert (=> (and start!73882 (= defaultEntry!696 defaultEntry!696) t!23798) tb!4743))

(declare-fun result!9105 () Bool)

(assert (=> tb!4743 (= result!9105 tp_is_empty!16765)))

(assert (=> b!864883 t!23798))

(declare-fun b_and!24249 () Bool)

(assert (= b_and!24247 (and (=> t!23798 result!9105) b_and!24249)))

(declare-fun m!806531 () Bool)

(assert (=> start!73882 m!806531))

(declare-fun m!806533 () Bool)

(assert (=> start!73882 m!806533))

(declare-fun m!806535 () Bool)

(assert (=> b!864886 m!806535))

(declare-fun m!806537 () Bool)

(assert (=> b!864883 m!806537))

(declare-fun m!806539 () Bool)

(assert (=> b!864883 m!806539))

(declare-fun m!806541 () Bool)

(assert (=> b!864883 m!806541))

(assert (=> b!864883 m!806537))

(declare-fun m!806543 () Bool)

(assert (=> b!864883 m!806543))

(declare-fun m!806545 () Bool)

(assert (=> b!864883 m!806545))

(assert (=> b!864883 m!806539))

(declare-fun m!806547 () Bool)

(assert (=> b!864884 m!806547))

(declare-fun m!806549 () Bool)

(assert (=> b!864893 m!806549))

(assert (=> b!864893 m!806549))

(declare-fun m!806551 () Bool)

(assert (=> b!864893 m!806551))

(assert (=> b!864893 m!806545))

(assert (=> b!864893 m!806545))

(declare-fun m!806553 () Bool)

(assert (=> b!864893 m!806553))

(declare-fun m!806555 () Bool)

(assert (=> b!864879 m!806555))

(declare-fun m!806557 () Bool)

(assert (=> b!864878 m!806557))

(declare-fun m!806559 () Bool)

(assert (=> b!864882 m!806559))

(assert (=> b!864882 m!806545))

(declare-fun m!806561 () Bool)

(assert (=> b!864882 m!806561))

(assert (=> b!864882 m!806545))

(declare-fun m!806563 () Bool)

(assert (=> b!864882 m!806563))

(declare-fun m!806565 () Bool)

(assert (=> b!864882 m!806565))

(declare-fun m!806567 () Bool)

(assert (=> b!864882 m!806567))

(declare-fun m!806569 () Bool)

(assert (=> b!864880 m!806569))

(declare-fun m!806571 () Bool)

(assert (=> b!864880 m!806571))

(declare-fun m!806573 () Bool)

(assert (=> b!864880 m!806573))

(declare-fun m!806575 () Bool)

(assert (=> b!864888 m!806575))

(declare-fun m!806577 () Bool)

(assert (=> b!864888 m!806577))

(declare-fun m!806579 () Bool)

(assert (=> b!864888 m!806579))

(declare-fun m!806581 () Bool)

(assert (=> b!864888 m!806581))

(declare-fun m!806583 () Bool)

(assert (=> b!864888 m!806583))

(declare-fun m!806585 () Bool)

(assert (=> b!864892 m!806585))

(declare-fun m!806587 () Bool)

(assert (=> mapNonEmpty!26747 m!806587))

(check-sat (not b!864893) (not b!864883) (not start!73882) (not b!864888) (not b!864882) (not b_next!14629) tp_is_empty!16765 (not b!864884) (not b!864880) b_and!24249 (not b!864886) (not mapNonEmpty!26747) (not b!864879) (not b_lambda!11995) (not b!864892))
(check-sat b_and!24249 (not b_next!14629))
