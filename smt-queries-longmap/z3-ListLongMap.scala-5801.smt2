; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74802 () Bool)

(assert start!74802)

(declare-fun b_free!15397 () Bool)

(declare-fun b_next!15397 () Bool)

(assert (=> start!74802 (= b_free!15397 (not b_next!15397))))

(declare-fun tp!53888 () Bool)

(declare-fun b_and!25435 () Bool)

(assert (=> start!74802 (= tp!53888 b_and!25435)))

(declare-fun b!881935 () Bool)

(declare-fun res!599229 () Bool)

(declare-fun e!490807 () Bool)

(assert (=> b!881935 (=> (not res!599229) (not e!490807))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51391 0))(
  ( (array!51392 (arr!24717 (Array (_ BitVec 32) (_ BitVec 64))) (size!25159 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51391)

(assert (=> b!881935 (= res!599229 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25159 _keys!868))))))

(declare-fun res!599227 () Bool)

(assert (=> start!74802 (=> (not res!599227) (not e!490807))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74802 (= res!599227 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25159 _keys!868))))))

(assert (=> start!74802 e!490807))

(declare-fun tp_is_empty!17641 () Bool)

(assert (=> start!74802 tp_is_empty!17641))

(assert (=> start!74802 true))

(assert (=> start!74802 tp!53888))

(declare-fun array_inv!19512 (array!51391) Bool)

(assert (=> start!74802 (array_inv!19512 _keys!868)))

(declare-datatypes ((V!28569 0))(
  ( (V!28570 (val!8868 Int)) )
))
(declare-datatypes ((ValueCell!8381 0))(
  ( (ValueCellFull!8381 (v!11322 V!28569)) (EmptyCell!8381) )
))
(declare-datatypes ((array!51393 0))(
  ( (array!51394 (arr!24718 (Array (_ BitVec 32) ValueCell!8381)) (size!25160 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51393)

(declare-fun e!490804 () Bool)

(declare-fun array_inv!19513 (array!51393) Bool)

(assert (=> start!74802 (and (array_inv!19513 _values!688) e!490804)))

(declare-fun b!881936 () Bool)

(declare-fun e!490801 () Bool)

(declare-fun e!490803 () Bool)

(assert (=> b!881936 (= e!490801 e!490803)))

(declare-fun res!599230 () Bool)

(assert (=> b!881936 (=> res!599230 e!490803)))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!881936 (= res!599230 (not (= (select (arr!24717 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11764 0))(
  ( (tuple2!11765 (_1!5893 (_ BitVec 64)) (_2!5893 V!28569)) )
))
(declare-datatypes ((List!17558 0))(
  ( (Nil!17555) (Cons!17554 (h!18685 tuple2!11764) (t!24748 List!17558)) )
))
(declare-datatypes ((ListLongMap!10523 0))(
  ( (ListLongMap!10524 (toList!5277 List!17558)) )
))
(declare-fun lt!398869 () ListLongMap!10523)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398868 () ListLongMap!10523)

(declare-fun +!2569 (ListLongMap!10523 tuple2!11764) ListLongMap!10523)

(declare-fun get!13021 (ValueCell!8381 V!28569) V!28569)

(declare-fun dynLambda!1257 (Int (_ BitVec 64)) V!28569)

(assert (=> b!881936 (= lt!398868 (+!2569 lt!398869 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881937 () Bool)

(declare-fun res!599233 () Bool)

(assert (=> b!881937 (=> (not res!599233) (not e!490807))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51391 (_ BitVec 32)) Bool)

(assert (=> b!881937 (= res!599233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881938 () Bool)

(declare-fun e!490808 () Bool)

(declare-fun mapRes!28092 () Bool)

(assert (=> b!881938 (= e!490804 (and e!490808 mapRes!28092))))

(declare-fun condMapEmpty!28092 () Bool)

(declare-fun mapDefault!28092 () ValueCell!8381)

(assert (=> b!881938 (= condMapEmpty!28092 (= (arr!24718 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8381)) mapDefault!28092)))))

(declare-fun b!881939 () Bool)

(declare-fun res!599232 () Bool)

(assert (=> b!881939 (=> (not res!599232) (not e!490807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881939 (= res!599232 (validKeyInArray!0 k0!854))))

(declare-fun b!881940 () Bool)

(assert (=> b!881940 (= e!490808 tp_is_empty!17641)))

(declare-fun mapNonEmpty!28092 () Bool)

(declare-fun tp!53889 () Bool)

(declare-fun e!490805 () Bool)

(assert (=> mapNonEmpty!28092 (= mapRes!28092 (and tp!53889 e!490805))))

(declare-fun mapKey!28092 () (_ BitVec 32))

(declare-fun mapValue!28092 () ValueCell!8381)

(declare-fun mapRest!28092 () (Array (_ BitVec 32) ValueCell!8381))

(assert (=> mapNonEmpty!28092 (= (arr!24718 _values!688) (store mapRest!28092 mapKey!28092 mapValue!28092))))

(declare-fun b!881941 () Bool)

(declare-fun res!599235 () Bool)

(assert (=> b!881941 (=> (not res!599235) (not e!490807))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!881941 (= res!599235 (and (= (size!25160 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25159 _keys!868) (size!25160 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881942 () Bool)

(declare-fun res!599236 () Bool)

(assert (=> b!881942 (=> (not res!599236) (not e!490807))))

(declare-datatypes ((List!17559 0))(
  ( (Nil!17556) (Cons!17555 (h!18686 (_ BitVec 64)) (t!24749 List!17559)) )
))
(declare-fun arrayNoDuplicates!0 (array!51391 (_ BitVec 32) List!17559) Bool)

(assert (=> b!881942 (= res!599236 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17556))))

(declare-fun b!881943 () Bool)

(declare-fun res!599231 () Bool)

(assert (=> b!881943 (=> (not res!599231) (not e!490807))))

(assert (=> b!881943 (= res!599231 (and (= (select (arr!24717 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881944 () Bool)

(declare-fun e!490800 () Bool)

(declare-fun noDuplicate!1322 (List!17559) Bool)

(assert (=> b!881944 (= e!490800 (noDuplicate!1322 Nil!17556))))

(declare-fun b!881945 () Bool)

(declare-fun res!599226 () Bool)

(assert (=> b!881945 (=> (not res!599226) (not e!490807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881945 (= res!599226 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28092 () Bool)

(assert (=> mapIsEmpty!28092 mapRes!28092))

(declare-fun b!881946 () Bool)

(declare-fun e!490806 () Bool)

(assert (=> b!881946 (= e!490806 (not e!490801))))

(declare-fun res!599225 () Bool)

(assert (=> b!881946 (=> res!599225 e!490801)))

(assert (=> b!881946 (= res!599225 (not (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053))))))

(declare-fun lt!398866 () ListLongMap!10523)

(assert (=> b!881946 (= lt!398866 lt!398869)))

(declare-fun v!557 () V!28569)

(declare-fun lt!398870 () ListLongMap!10523)

(assert (=> b!881946 (= lt!398869 (+!2569 lt!398870 (tuple2!11765 k0!854 v!557)))))

(declare-fun minValue!654 () V!28569)

(declare-fun zeroValue!654 () V!28569)

(declare-fun lt!398867 () array!51393)

(declare-fun getCurrentListMapNoExtraKeys!3268 (array!51391 array!51393 (_ BitVec 32) (_ BitVec 32) V!28569 V!28569 (_ BitVec 32) Int) ListLongMap!10523)

(assert (=> b!881946 (= lt!398866 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881946 (= lt!398870 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30049 0))(
  ( (Unit!30050) )
))
(declare-fun lt!398871 () Unit!30049)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!734 (array!51391 array!51393 (_ BitVec 32) (_ BitVec 32) V!28569 V!28569 (_ BitVec 32) (_ BitVec 64) V!28569 (_ BitVec 32) Int) Unit!30049)

(assert (=> b!881946 (= lt!398871 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!734 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881947 () Bool)

(assert (=> b!881947 (= e!490807 e!490806)))

(declare-fun res!599228 () Bool)

(assert (=> b!881947 (=> (not res!599228) (not e!490806))))

(assert (=> b!881947 (= res!599228 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!881947 (= lt!398868 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881947 (= lt!398867 (array!51394 (store (arr!24718 _values!688) i!612 (ValueCellFull!8381 v!557)) (size!25160 _values!688)))))

(declare-fun lt!398874 () ListLongMap!10523)

(assert (=> b!881947 (= lt!398874 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881948 () Bool)

(assert (=> b!881948 (= e!490803 e!490800)))

(declare-fun res!599234 () Bool)

(assert (=> b!881948 (=> res!599234 e!490800)))

(assert (=> b!881948 (= res!599234 (or (bvsge (size!25159 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)) (bvsge from!1053 (size!25159 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881948 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398872 () Unit!30049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30049)

(assert (=> b!881948 (= lt!398872 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881948 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17556)))

(declare-fun lt!398873 () Unit!30049)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51391 (_ BitVec 32) (_ BitVec 32)) Unit!30049)

(assert (=> b!881948 (= lt!398873 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881949 () Bool)

(assert (=> b!881949 (= e!490805 tp_is_empty!17641)))

(assert (= (and start!74802 res!599227) b!881945))

(assert (= (and b!881945 res!599226) b!881941))

(assert (= (and b!881941 res!599235) b!881937))

(assert (= (and b!881937 res!599233) b!881942))

(assert (= (and b!881942 res!599236) b!881935))

(assert (= (and b!881935 res!599229) b!881939))

(assert (= (and b!881939 res!599232) b!881943))

(assert (= (and b!881943 res!599231) b!881947))

(assert (= (and b!881947 res!599228) b!881946))

(assert (= (and b!881946 (not res!599225)) b!881936))

(assert (= (and b!881936 (not res!599230)) b!881948))

(assert (= (and b!881948 (not res!599234)) b!881944))

(assert (= (and b!881938 condMapEmpty!28092) mapIsEmpty!28092))

(assert (= (and b!881938 (not condMapEmpty!28092)) mapNonEmpty!28092))

(get-info :version)

(assert (= (and mapNonEmpty!28092 ((_ is ValueCellFull!8381) mapValue!28092)) b!881949))

(assert (= (and b!881938 ((_ is ValueCellFull!8381) mapDefault!28092)) b!881940))

(assert (= start!74802 b!881938))

(declare-fun b_lambda!12589 () Bool)

(assert (=> (not b_lambda!12589) (not b!881936)))

(declare-fun t!24747 () Bool)

(declare-fun tb!5047 () Bool)

(assert (=> (and start!74802 (= defaultEntry!696 defaultEntry!696) t!24747) tb!5047))

(declare-fun result!9733 () Bool)

(assert (=> tb!5047 (= result!9733 tp_is_empty!17641)))

(assert (=> b!881936 t!24747))

(declare-fun b_and!25437 () Bool)

(assert (= b_and!25435 (and (=> t!24747 result!9733) b_and!25437)))

(declare-fun m!821357 () Bool)

(assert (=> b!881947 m!821357))

(declare-fun m!821359 () Bool)

(assert (=> b!881947 m!821359))

(declare-fun m!821361 () Bool)

(assert (=> b!881947 m!821361))

(declare-fun m!821363 () Bool)

(assert (=> b!881936 m!821363))

(declare-fun m!821365 () Bool)

(assert (=> b!881936 m!821365))

(declare-fun m!821367 () Bool)

(assert (=> b!881936 m!821367))

(declare-fun m!821369 () Bool)

(assert (=> b!881936 m!821369))

(assert (=> b!881936 m!821365))

(declare-fun m!821371 () Bool)

(assert (=> b!881936 m!821371))

(assert (=> b!881936 m!821367))

(declare-fun m!821373 () Bool)

(assert (=> b!881942 m!821373))

(declare-fun m!821375 () Bool)

(assert (=> b!881948 m!821375))

(declare-fun m!821377 () Bool)

(assert (=> b!881948 m!821377))

(declare-fun m!821379 () Bool)

(assert (=> b!881948 m!821379))

(declare-fun m!821381 () Bool)

(assert (=> b!881948 m!821381))

(declare-fun m!821383 () Bool)

(assert (=> b!881943 m!821383))

(declare-fun m!821385 () Bool)

(assert (=> start!74802 m!821385))

(declare-fun m!821387 () Bool)

(assert (=> start!74802 m!821387))

(declare-fun m!821389 () Bool)

(assert (=> b!881944 m!821389))

(declare-fun m!821391 () Bool)

(assert (=> b!881945 m!821391))

(declare-fun m!821393 () Bool)

(assert (=> mapNonEmpty!28092 m!821393))

(declare-fun m!821395 () Bool)

(assert (=> b!881939 m!821395))

(declare-fun m!821397 () Bool)

(assert (=> b!881946 m!821397))

(declare-fun m!821399 () Bool)

(assert (=> b!881946 m!821399))

(assert (=> b!881946 m!821371))

(declare-fun m!821401 () Bool)

(assert (=> b!881946 m!821401))

(assert (=> b!881946 m!821371))

(declare-fun m!821403 () Bool)

(assert (=> b!881946 m!821403))

(declare-fun m!821405 () Bool)

(assert (=> b!881946 m!821405))

(declare-fun m!821407 () Bool)

(assert (=> b!881937 m!821407))

(check-sat (not b!881942) (not mapNonEmpty!28092) (not b_lambda!12589) (not b!881946) (not b!881939) (not b!881936) (not b!881947) tp_is_empty!17641 (not b!881937) (not b!881945) (not start!74802) (not b_next!15397) (not b!881944) b_and!25437 (not b!881948))
(check-sat b_and!25437 (not b_next!15397))
(get-model)

(declare-fun b_lambda!12595 () Bool)

(assert (= b_lambda!12589 (or (and start!74802 b_free!15397) b_lambda!12595)))

(check-sat (not b!881942) (not mapNonEmpty!28092) (not b!881946) (not b!881939) (not b!881936) (not b!881947) tp_is_empty!17641 (not b!881945) (not start!74802) (not b_next!15397) (not b!881944) b_and!25437 (not b!881948) (not b!881937) (not b_lambda!12595))
(check-sat b_and!25437 (not b_next!15397))
(get-model)

(declare-fun d!108901 () Bool)

(assert (=> d!108901 (= (array_inv!19512 _keys!868) (bvsge (size!25159 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74802 d!108901))

(declare-fun d!108903 () Bool)

(assert (=> d!108903 (= (array_inv!19513 _values!688) (bvsge (size!25160 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74802 d!108903))

(declare-fun b!882071 () Bool)

(declare-fun e!490877 () ListLongMap!10523)

(declare-fun e!490880 () ListLongMap!10523)

(assert (=> b!882071 (= e!490877 e!490880)))

(declare-fun c!92916 () Bool)

(assert (=> b!882071 (= c!92916 (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)))))

(declare-fun b!882072 () Bool)

(declare-fun call!38924 () ListLongMap!10523)

(assert (=> b!882072 (= e!490880 call!38924)))

(declare-fun b!882073 () Bool)

(declare-fun e!490881 () Bool)

(declare-fun e!490878 () Bool)

(assert (=> b!882073 (= e!490881 e!490878)))

(declare-fun c!92914 () Bool)

(assert (=> b!882073 (= c!92914 (bvslt from!1053 (size!25159 _keys!868)))))

(declare-fun b!882074 () Bool)

(declare-fun lt!398947 () ListLongMap!10523)

(declare-fun isEmpty!675 (ListLongMap!10523) Bool)

(assert (=> b!882074 (= e!490878 (isEmpty!675 lt!398947))))

(declare-fun b!882075 () Bool)

(declare-fun e!490883 () Bool)

(assert (=> b!882075 (= e!490883 e!490881)))

(declare-fun c!92915 () Bool)

(declare-fun e!490879 () Bool)

(assert (=> b!882075 (= c!92915 e!490879)))

(declare-fun res!599317 () Bool)

(assert (=> b!882075 (=> (not res!599317) (not e!490879))))

(assert (=> b!882075 (= res!599317 (bvslt from!1053 (size!25159 _keys!868)))))

(declare-fun b!882076 () Bool)

(declare-fun lt!398948 () Unit!30049)

(declare-fun lt!398946 () Unit!30049)

(assert (=> b!882076 (= lt!398948 lt!398946)))

(declare-fun lt!398949 () ListLongMap!10523)

(declare-fun lt!398944 () V!28569)

(declare-fun lt!398943 () (_ BitVec 64))

(declare-fun lt!398945 () (_ BitVec 64))

(declare-fun contains!4240 (ListLongMap!10523 (_ BitVec 64)) Bool)

(assert (=> b!882076 (not (contains!4240 (+!2569 lt!398949 (tuple2!11765 lt!398945 lt!398944)) lt!398943))))

(declare-fun addStillNotContains!209 (ListLongMap!10523 (_ BitVec 64) V!28569 (_ BitVec 64)) Unit!30049)

(assert (=> b!882076 (= lt!398946 (addStillNotContains!209 lt!398949 lt!398945 lt!398944 lt!398943))))

(assert (=> b!882076 (= lt!398943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882076 (= lt!398944 (get!13021 (select (arr!24718 lt!398867) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882076 (= lt!398945 (select (arr!24717 _keys!868) from!1053))))

(assert (=> b!882076 (= lt!398949 call!38924)))

(assert (=> b!882076 (= e!490880 (+!2569 call!38924 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 lt!398867) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882077 () Bool)

(assert (=> b!882077 (= e!490878 (= lt!398947 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882078 () Bool)

(assert (=> b!882078 (= e!490879 (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)))))

(assert (=> b!882078 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882079 () Bool)

(assert (=> b!882079 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25159 _keys!868)))))

(assert (=> b!882079 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25160 lt!398867)))))

(declare-fun e!490882 () Bool)

(declare-fun apply!383 (ListLongMap!10523 (_ BitVec 64)) V!28569)

(assert (=> b!882079 (= e!490882 (= (apply!383 lt!398947 (select (arr!24717 _keys!868) from!1053)) (get!13021 (select (arr!24718 lt!398867) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882080 () Bool)

(declare-fun res!599320 () Bool)

(assert (=> b!882080 (=> (not res!599320) (not e!490883))))

(assert (=> b!882080 (= res!599320 (not (contains!4240 lt!398947 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882070 () Bool)

(assert (=> b!882070 (= e!490877 (ListLongMap!10524 Nil!17555))))

(declare-fun d!108905 () Bool)

(assert (=> d!108905 e!490883))

(declare-fun res!599318 () Bool)

(assert (=> d!108905 (=> (not res!599318) (not e!490883))))

(assert (=> d!108905 (= res!599318 (not (contains!4240 lt!398947 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108905 (= lt!398947 e!490877)))

(declare-fun c!92913 () Bool)

(assert (=> d!108905 (= c!92913 (bvsge from!1053 (size!25159 _keys!868)))))

(assert (=> d!108905 (validMask!0 mask!1196)))

(assert (=> d!108905 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398947)))

(declare-fun b!882081 () Bool)

(assert (=> b!882081 (= e!490881 e!490882)))

(assert (=> b!882081 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25159 _keys!868)))))

(declare-fun res!599319 () Bool)

(assert (=> b!882081 (= res!599319 (contains!4240 lt!398947 (select (arr!24717 _keys!868) from!1053)))))

(assert (=> b!882081 (=> (not res!599319) (not e!490882))))

(declare-fun bm!38921 () Bool)

(assert (=> bm!38921 (= call!38924 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108905 c!92913) b!882070))

(assert (= (and d!108905 (not c!92913)) b!882071))

(assert (= (and b!882071 c!92916) b!882076))

(assert (= (and b!882071 (not c!92916)) b!882072))

(assert (= (or b!882076 b!882072) bm!38921))

(assert (= (and d!108905 res!599318) b!882080))

(assert (= (and b!882080 res!599320) b!882075))

(assert (= (and b!882075 res!599317) b!882078))

(assert (= (and b!882075 c!92915) b!882081))

(assert (= (and b!882075 (not c!92915)) b!882073))

(assert (= (and b!882081 res!599319) b!882079))

(assert (= (and b!882073 c!92914) b!882077))

(assert (= (and b!882073 (not c!92914)) b!882074))

(declare-fun b_lambda!12597 () Bool)

(assert (=> (not b_lambda!12597) (not b!882076)))

(assert (=> b!882076 t!24747))

(declare-fun b_and!25447 () Bool)

(assert (= b_and!25437 (and (=> t!24747 result!9733) b_and!25447)))

(declare-fun b_lambda!12599 () Bool)

(assert (=> (not b_lambda!12599) (not b!882079)))

(assert (=> b!882079 t!24747))

(declare-fun b_and!25449 () Bool)

(assert (= b_and!25447 (and (=> t!24747 result!9733) b_and!25449)))

(declare-fun m!821513 () Bool)

(assert (=> b!882076 m!821513))

(declare-fun m!821515 () Bool)

(assert (=> b!882076 m!821515))

(assert (=> b!882076 m!821367))

(assert (=> b!882076 m!821513))

(declare-fun m!821517 () Bool)

(assert (=> b!882076 m!821517))

(declare-fun m!821519 () Bool)

(assert (=> b!882076 m!821519))

(declare-fun m!821521 () Bool)

(assert (=> b!882076 m!821521))

(assert (=> b!882076 m!821371))

(assert (=> b!882076 m!821521))

(assert (=> b!882076 m!821367))

(declare-fun m!821523 () Bool)

(assert (=> b!882076 m!821523))

(declare-fun m!821525 () Bool)

(assert (=> b!882077 m!821525))

(assert (=> bm!38921 m!821525))

(declare-fun m!821527 () Bool)

(assert (=> b!882074 m!821527))

(declare-fun m!821529 () Bool)

(assert (=> d!108905 m!821529))

(assert (=> d!108905 m!821391))

(assert (=> b!882079 m!821371))

(declare-fun m!821531 () Bool)

(assert (=> b!882079 m!821531))

(assert (=> b!882079 m!821367))

(assert (=> b!882079 m!821521))

(assert (=> b!882079 m!821371))

(assert (=> b!882079 m!821521))

(assert (=> b!882079 m!821367))

(assert (=> b!882079 m!821523))

(assert (=> b!882071 m!821371))

(assert (=> b!882071 m!821371))

(assert (=> b!882071 m!821401))

(assert (=> b!882078 m!821371))

(assert (=> b!882078 m!821371))

(assert (=> b!882078 m!821401))

(assert (=> b!882081 m!821371))

(assert (=> b!882081 m!821371))

(declare-fun m!821533 () Bool)

(assert (=> b!882081 m!821533))

(declare-fun m!821535 () Bool)

(assert (=> b!882080 m!821535))

(assert (=> b!881947 d!108905))

(declare-fun b!882083 () Bool)

(declare-fun e!490884 () ListLongMap!10523)

(declare-fun e!490887 () ListLongMap!10523)

(assert (=> b!882083 (= e!490884 e!490887)))

(declare-fun c!92920 () Bool)

(assert (=> b!882083 (= c!92920 (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)))))

(declare-fun b!882084 () Bool)

(declare-fun call!38925 () ListLongMap!10523)

(assert (=> b!882084 (= e!490887 call!38925)))

(declare-fun b!882085 () Bool)

(declare-fun e!490888 () Bool)

(declare-fun e!490885 () Bool)

(assert (=> b!882085 (= e!490888 e!490885)))

(declare-fun c!92918 () Bool)

(assert (=> b!882085 (= c!92918 (bvslt from!1053 (size!25159 _keys!868)))))

(declare-fun b!882086 () Bool)

(declare-fun lt!398954 () ListLongMap!10523)

(assert (=> b!882086 (= e!490885 (isEmpty!675 lt!398954))))

(declare-fun b!882087 () Bool)

(declare-fun e!490890 () Bool)

(assert (=> b!882087 (= e!490890 e!490888)))

(declare-fun c!92919 () Bool)

(declare-fun e!490886 () Bool)

(assert (=> b!882087 (= c!92919 e!490886)))

(declare-fun res!599321 () Bool)

(assert (=> b!882087 (=> (not res!599321) (not e!490886))))

(assert (=> b!882087 (= res!599321 (bvslt from!1053 (size!25159 _keys!868)))))

(declare-fun b!882088 () Bool)

(declare-fun lt!398955 () Unit!30049)

(declare-fun lt!398953 () Unit!30049)

(assert (=> b!882088 (= lt!398955 lt!398953)))

(declare-fun lt!398950 () (_ BitVec 64))

(declare-fun lt!398952 () (_ BitVec 64))

(declare-fun lt!398951 () V!28569)

(declare-fun lt!398956 () ListLongMap!10523)

(assert (=> b!882088 (not (contains!4240 (+!2569 lt!398956 (tuple2!11765 lt!398952 lt!398951)) lt!398950))))

(assert (=> b!882088 (= lt!398953 (addStillNotContains!209 lt!398956 lt!398952 lt!398951 lt!398950))))

(assert (=> b!882088 (= lt!398950 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882088 (= lt!398951 (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882088 (= lt!398952 (select (arr!24717 _keys!868) from!1053))))

(assert (=> b!882088 (= lt!398956 call!38925)))

(assert (=> b!882088 (= e!490887 (+!2569 call!38925 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882089 () Bool)

(assert (=> b!882089 (= e!490885 (= lt!398954 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882090 () Bool)

(assert (=> b!882090 (= e!490886 (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)))))

(assert (=> b!882090 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882091 () Bool)

(assert (=> b!882091 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25159 _keys!868)))))

(assert (=> b!882091 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25160 _values!688)))))

(declare-fun e!490889 () Bool)

(assert (=> b!882091 (= e!490889 (= (apply!383 lt!398954 (select (arr!24717 _keys!868) from!1053)) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882092 () Bool)

(declare-fun res!599324 () Bool)

(assert (=> b!882092 (=> (not res!599324) (not e!490890))))

(assert (=> b!882092 (= res!599324 (not (contains!4240 lt!398954 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882082 () Bool)

(assert (=> b!882082 (= e!490884 (ListLongMap!10524 Nil!17555))))

(declare-fun d!108907 () Bool)

(assert (=> d!108907 e!490890))

(declare-fun res!599322 () Bool)

(assert (=> d!108907 (=> (not res!599322) (not e!490890))))

(assert (=> d!108907 (= res!599322 (not (contains!4240 lt!398954 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108907 (= lt!398954 e!490884)))

(declare-fun c!92917 () Bool)

(assert (=> d!108907 (= c!92917 (bvsge from!1053 (size!25159 _keys!868)))))

(assert (=> d!108907 (validMask!0 mask!1196)))

(assert (=> d!108907 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398954)))

(declare-fun b!882093 () Bool)

(assert (=> b!882093 (= e!490888 e!490889)))

(assert (=> b!882093 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25159 _keys!868)))))

(declare-fun res!599323 () Bool)

(assert (=> b!882093 (= res!599323 (contains!4240 lt!398954 (select (arr!24717 _keys!868) from!1053)))))

(assert (=> b!882093 (=> (not res!599323) (not e!490889))))

(declare-fun bm!38922 () Bool)

(assert (=> bm!38922 (= call!38925 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108907 c!92917) b!882082))

(assert (= (and d!108907 (not c!92917)) b!882083))

(assert (= (and b!882083 c!92920) b!882088))

(assert (= (and b!882083 (not c!92920)) b!882084))

(assert (= (or b!882088 b!882084) bm!38922))

(assert (= (and d!108907 res!599322) b!882092))

(assert (= (and b!882092 res!599324) b!882087))

(assert (= (and b!882087 res!599321) b!882090))

(assert (= (and b!882087 c!92919) b!882093))

(assert (= (and b!882087 (not c!92919)) b!882085))

(assert (= (and b!882093 res!599323) b!882091))

(assert (= (and b!882085 c!92918) b!882089))

(assert (= (and b!882085 (not c!92918)) b!882086))

(declare-fun b_lambda!12601 () Bool)

(assert (=> (not b_lambda!12601) (not b!882088)))

(assert (=> b!882088 t!24747))

(declare-fun b_and!25451 () Bool)

(assert (= b_and!25449 (and (=> t!24747 result!9733) b_and!25451)))

(declare-fun b_lambda!12603 () Bool)

(assert (=> (not b_lambda!12603) (not b!882091)))

(assert (=> b!882091 t!24747))

(declare-fun b_and!25453 () Bool)

(assert (= b_and!25451 (and (=> t!24747 result!9733) b_and!25453)))

(declare-fun m!821537 () Bool)

(assert (=> b!882088 m!821537))

(declare-fun m!821539 () Bool)

(assert (=> b!882088 m!821539))

(assert (=> b!882088 m!821367))

(assert (=> b!882088 m!821537))

(declare-fun m!821541 () Bool)

(assert (=> b!882088 m!821541))

(declare-fun m!821543 () Bool)

(assert (=> b!882088 m!821543))

(assert (=> b!882088 m!821365))

(assert (=> b!882088 m!821371))

(assert (=> b!882088 m!821365))

(assert (=> b!882088 m!821367))

(assert (=> b!882088 m!821369))

(declare-fun m!821545 () Bool)

(assert (=> b!882089 m!821545))

(assert (=> bm!38922 m!821545))

(declare-fun m!821547 () Bool)

(assert (=> b!882086 m!821547))

(declare-fun m!821549 () Bool)

(assert (=> d!108907 m!821549))

(assert (=> d!108907 m!821391))

(assert (=> b!882091 m!821371))

(declare-fun m!821551 () Bool)

(assert (=> b!882091 m!821551))

(assert (=> b!882091 m!821367))

(assert (=> b!882091 m!821365))

(assert (=> b!882091 m!821371))

(assert (=> b!882091 m!821365))

(assert (=> b!882091 m!821367))

(assert (=> b!882091 m!821369))

(assert (=> b!882083 m!821371))

(assert (=> b!882083 m!821371))

(assert (=> b!882083 m!821401))

(assert (=> b!882090 m!821371))

(assert (=> b!882090 m!821371))

(assert (=> b!882090 m!821401))

(assert (=> b!882093 m!821371))

(assert (=> b!882093 m!821371))

(declare-fun m!821553 () Bool)

(assert (=> b!882093 m!821553))

(declare-fun m!821555 () Bool)

(assert (=> b!882092 m!821555))

(assert (=> b!881947 d!108907))

(declare-fun b!882104 () Bool)

(declare-fun e!490901 () Bool)

(declare-fun contains!4241 (List!17559 (_ BitVec 64)) Bool)

(assert (=> b!882104 (= e!490901 (contains!4241 Nil!17556 (select (arr!24717 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882105 () Bool)

(declare-fun e!490899 () Bool)

(declare-fun e!490902 () Bool)

(assert (=> b!882105 (= e!490899 e!490902)))

(declare-fun c!92923 () Bool)

(assert (=> b!882105 (= c!92923 (validKeyInArray!0 (select (arr!24717 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38925 () Bool)

(declare-fun call!38928 () Bool)

(assert (=> bm!38925 (= call!38928 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92923 (Cons!17555 (select (arr!24717 _keys!868) #b00000000000000000000000000000000) Nil!17556) Nil!17556)))))

(declare-fun d!108909 () Bool)

(declare-fun res!599333 () Bool)

(declare-fun e!490900 () Bool)

(assert (=> d!108909 (=> res!599333 e!490900)))

(assert (=> d!108909 (= res!599333 (bvsge #b00000000000000000000000000000000 (size!25159 _keys!868)))))

(assert (=> d!108909 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17556) e!490900)))

(declare-fun b!882106 () Bool)

(assert (=> b!882106 (= e!490902 call!38928)))

(declare-fun b!882107 () Bool)

(assert (=> b!882107 (= e!490900 e!490899)))

(declare-fun res!599332 () Bool)

(assert (=> b!882107 (=> (not res!599332) (not e!490899))))

(assert (=> b!882107 (= res!599332 (not e!490901))))

(declare-fun res!599331 () Bool)

(assert (=> b!882107 (=> (not res!599331) (not e!490901))))

(assert (=> b!882107 (= res!599331 (validKeyInArray!0 (select (arr!24717 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882108 () Bool)

(assert (=> b!882108 (= e!490902 call!38928)))

(assert (= (and d!108909 (not res!599333)) b!882107))

(assert (= (and b!882107 res!599331) b!882104))

(assert (= (and b!882107 res!599332) b!882105))

(assert (= (and b!882105 c!92923) b!882108))

(assert (= (and b!882105 (not c!92923)) b!882106))

(assert (= (or b!882108 b!882106) bm!38925))

(declare-fun m!821557 () Bool)

(assert (=> b!882104 m!821557))

(assert (=> b!882104 m!821557))

(declare-fun m!821559 () Bool)

(assert (=> b!882104 m!821559))

(assert (=> b!882105 m!821557))

(assert (=> b!882105 m!821557))

(declare-fun m!821561 () Bool)

(assert (=> b!882105 m!821561))

(assert (=> bm!38925 m!821557))

(declare-fun m!821563 () Bool)

(assert (=> bm!38925 m!821563))

(assert (=> b!882107 m!821557))

(assert (=> b!882107 m!821557))

(assert (=> b!882107 m!821561))

(assert (=> b!881942 d!108909))

(declare-fun d!108911 () Bool)

(declare-fun res!599338 () Bool)

(declare-fun e!490907 () Bool)

(assert (=> d!108911 (=> res!599338 e!490907)))

(assert (=> d!108911 (= res!599338 ((_ is Nil!17556) Nil!17556))))

(assert (=> d!108911 (= (noDuplicate!1322 Nil!17556) e!490907)))

(declare-fun b!882113 () Bool)

(declare-fun e!490908 () Bool)

(assert (=> b!882113 (= e!490907 e!490908)))

(declare-fun res!599339 () Bool)

(assert (=> b!882113 (=> (not res!599339) (not e!490908))))

(assert (=> b!882113 (= res!599339 (not (contains!4241 (t!24749 Nil!17556) (h!18686 Nil!17556))))))

(declare-fun b!882114 () Bool)

(assert (=> b!882114 (= e!490908 (noDuplicate!1322 (t!24749 Nil!17556)))))

(assert (= (and d!108911 (not res!599338)) b!882113))

(assert (= (and b!882113 res!599339) b!882114))

(declare-fun m!821565 () Bool)

(assert (=> b!882113 m!821565))

(declare-fun m!821567 () Bool)

(assert (=> b!882114 m!821567))

(assert (=> b!881944 d!108911))

(declare-fun d!108913 () Bool)

(declare-fun res!599344 () Bool)

(declare-fun e!490913 () Bool)

(assert (=> d!108913 (=> res!599344 e!490913)))

(assert (=> d!108913 (= res!599344 (= (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!108913 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!490913)))

(declare-fun b!882119 () Bool)

(declare-fun e!490914 () Bool)

(assert (=> b!882119 (= e!490913 e!490914)))

(declare-fun res!599345 () Bool)

(assert (=> b!882119 (=> (not res!599345) (not e!490914))))

(assert (=> b!882119 (= res!599345 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25159 _keys!868)))))

(declare-fun b!882120 () Bool)

(assert (=> b!882120 (= e!490914 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!108913 (not res!599344)) b!882119))

(assert (= (and b!882119 res!599345) b!882120))

(declare-fun m!821569 () Bool)

(assert (=> d!108913 m!821569))

(declare-fun m!821571 () Bool)

(assert (=> b!882120 m!821571))

(assert (=> b!881948 d!108913))

(declare-fun d!108915 () Bool)

(assert (=> d!108915 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398959 () Unit!30049)

(declare-fun choose!114 (array!51391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30049)

(assert (=> d!108915 (= lt!398959 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!108915 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!108915 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!398959)))

(declare-fun bs!24709 () Bool)

(assert (= bs!24709 d!108915))

(assert (=> bs!24709 m!821375))

(declare-fun m!821573 () Bool)

(assert (=> bs!24709 m!821573))

(assert (=> b!881948 d!108915))

(declare-fun b!882121 () Bool)

(declare-fun e!490917 () Bool)

(assert (=> b!882121 (= e!490917 (contains!4241 Nil!17556 (select (arr!24717 _keys!868) from!1053)))))

(declare-fun b!882122 () Bool)

(declare-fun e!490915 () Bool)

(declare-fun e!490918 () Bool)

(assert (=> b!882122 (= e!490915 e!490918)))

(declare-fun c!92924 () Bool)

(assert (=> b!882122 (= c!92924 (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)))))

(declare-fun call!38929 () Bool)

(declare-fun bm!38926 () Bool)

(assert (=> bm!38926 (= call!38929 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92924 (Cons!17555 (select (arr!24717 _keys!868) from!1053) Nil!17556) Nil!17556)))))

(declare-fun d!108917 () Bool)

(declare-fun res!599348 () Bool)

(declare-fun e!490916 () Bool)

(assert (=> d!108917 (=> res!599348 e!490916)))

(assert (=> d!108917 (= res!599348 (bvsge from!1053 (size!25159 _keys!868)))))

(assert (=> d!108917 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17556) e!490916)))

(declare-fun b!882123 () Bool)

(assert (=> b!882123 (= e!490918 call!38929)))

(declare-fun b!882124 () Bool)

(assert (=> b!882124 (= e!490916 e!490915)))

(declare-fun res!599347 () Bool)

(assert (=> b!882124 (=> (not res!599347) (not e!490915))))

(assert (=> b!882124 (= res!599347 (not e!490917))))

(declare-fun res!599346 () Bool)

(assert (=> b!882124 (=> (not res!599346) (not e!490917))))

(assert (=> b!882124 (= res!599346 (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)))))

(declare-fun b!882125 () Bool)

(assert (=> b!882125 (= e!490918 call!38929)))

(assert (= (and d!108917 (not res!599348)) b!882124))

(assert (= (and b!882124 res!599346) b!882121))

(assert (= (and b!882124 res!599347) b!882122))

(assert (= (and b!882122 c!92924) b!882125))

(assert (= (and b!882122 (not c!92924)) b!882123))

(assert (= (or b!882125 b!882123) bm!38926))

(assert (=> b!882121 m!821371))

(assert (=> b!882121 m!821371))

(declare-fun m!821575 () Bool)

(assert (=> b!882121 m!821575))

(assert (=> b!882122 m!821371))

(assert (=> b!882122 m!821371))

(assert (=> b!882122 m!821401))

(assert (=> bm!38926 m!821371))

(declare-fun m!821577 () Bool)

(assert (=> bm!38926 m!821577))

(assert (=> b!882124 m!821371))

(assert (=> b!882124 m!821371))

(assert (=> b!882124 m!821401))

(assert (=> b!881948 d!108917))

(declare-fun d!108919 () Bool)

(assert (=> d!108919 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17556)))

(declare-fun lt!398962 () Unit!30049)

(declare-fun choose!39 (array!51391 (_ BitVec 32) (_ BitVec 32)) Unit!30049)

(assert (=> d!108919 (= lt!398962 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!108919 (bvslt (size!25159 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!108919 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398962)))

(declare-fun bs!24710 () Bool)

(assert (= bs!24710 d!108919))

(assert (=> bs!24710 m!821379))

(declare-fun m!821579 () Bool)

(assert (=> bs!24710 m!821579))

(assert (=> b!881948 d!108919))

(declare-fun d!108921 () Bool)

(assert (=> d!108921 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881939 d!108921))

(declare-fun d!108923 () Bool)

(declare-fun e!490921 () Bool)

(assert (=> d!108923 e!490921))

(declare-fun res!599354 () Bool)

(assert (=> d!108923 (=> (not res!599354) (not e!490921))))

(declare-fun lt!398974 () ListLongMap!10523)

(assert (=> d!108923 (= res!599354 (contains!4240 lt!398974 (_1!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398971 () List!17558)

(assert (=> d!108923 (= lt!398974 (ListLongMap!10524 lt!398971))))

(declare-fun lt!398973 () Unit!30049)

(declare-fun lt!398972 () Unit!30049)

(assert (=> d!108923 (= lt!398973 lt!398972)))

(declare-datatypes ((Option!429 0))(
  ( (Some!428 (v!11328 V!28569)) (None!427) )
))
(declare-fun getValueByKey!423 (List!17558 (_ BitVec 64)) Option!429)

(assert (=> d!108923 (= (getValueByKey!423 lt!398971 (_1!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!428 (_2!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!240 (List!17558 (_ BitVec 64) V!28569) Unit!30049)

(assert (=> d!108923 (= lt!398972 (lemmaContainsTupThenGetReturnValue!240 lt!398971 (_1!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!279 (List!17558 (_ BitVec 64) V!28569) List!17558)

(assert (=> d!108923 (= lt!398971 (insertStrictlySorted!279 (toList!5277 lt!398869) (_1!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108923 (= (+!2569 lt!398869 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398974)))

(declare-fun b!882130 () Bool)

(declare-fun res!599353 () Bool)

(assert (=> b!882130 (=> (not res!599353) (not e!490921))))

(assert (=> b!882130 (= res!599353 (= (getValueByKey!423 (toList!5277 lt!398974) (_1!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!428 (_2!5893 (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!882131 () Bool)

(declare-fun contains!4242 (List!17558 tuple2!11764) Bool)

(assert (=> b!882131 (= e!490921 (contains!4242 (toList!5277 lt!398974) (tuple2!11765 (select (arr!24717 _keys!868) from!1053) (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108923 res!599354) b!882130))

(assert (= (and b!882130 res!599353) b!882131))

(declare-fun m!821581 () Bool)

(assert (=> d!108923 m!821581))

(declare-fun m!821583 () Bool)

(assert (=> d!108923 m!821583))

(declare-fun m!821585 () Bool)

(assert (=> d!108923 m!821585))

(declare-fun m!821587 () Bool)

(assert (=> d!108923 m!821587))

(declare-fun m!821589 () Bool)

(assert (=> b!882130 m!821589))

(declare-fun m!821591 () Bool)

(assert (=> b!882131 m!821591))

(assert (=> b!881936 d!108923))

(declare-fun d!108925 () Bool)

(declare-fun c!92927 () Bool)

(assert (=> d!108925 (= c!92927 ((_ is ValueCellFull!8381) (select (arr!24718 _values!688) from!1053)))))

(declare-fun e!490924 () V!28569)

(assert (=> d!108925 (= (get!13021 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490924)))

(declare-fun b!882136 () Bool)

(declare-fun get!13024 (ValueCell!8381 V!28569) V!28569)

(assert (=> b!882136 (= e!490924 (get!13024 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882137 () Bool)

(declare-fun get!13025 (ValueCell!8381 V!28569) V!28569)

(assert (=> b!882137 (= e!490924 (get!13025 (select (arr!24718 _values!688) from!1053) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108925 c!92927) b!882136))

(assert (= (and d!108925 (not c!92927)) b!882137))

(assert (=> b!882136 m!821365))

(assert (=> b!882136 m!821367))

(declare-fun m!821593 () Bool)

(assert (=> b!882136 m!821593))

(assert (=> b!882137 m!821365))

(assert (=> b!882137 m!821367))

(declare-fun m!821595 () Bool)

(assert (=> b!882137 m!821595))

(assert (=> b!881936 d!108925))

(declare-fun d!108927 () Bool)

(assert (=> d!108927 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!881945 d!108927))

(declare-fun b!882139 () Bool)

(declare-fun e!490925 () ListLongMap!10523)

(declare-fun e!490928 () ListLongMap!10523)

(assert (=> b!882139 (= e!490925 e!490928)))

(declare-fun c!92931 () Bool)

(assert (=> b!882139 (= c!92931 (validKeyInArray!0 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882140 () Bool)

(declare-fun call!38930 () ListLongMap!10523)

(assert (=> b!882140 (= e!490928 call!38930)))

(declare-fun b!882141 () Bool)

(declare-fun e!490929 () Bool)

(declare-fun e!490926 () Bool)

(assert (=> b!882141 (= e!490929 e!490926)))

(declare-fun c!92929 () Bool)

(assert (=> b!882141 (= c!92929 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(declare-fun b!882142 () Bool)

(declare-fun lt!398979 () ListLongMap!10523)

(assert (=> b!882142 (= e!490926 (isEmpty!675 lt!398979))))

(declare-fun b!882143 () Bool)

(declare-fun e!490931 () Bool)

(assert (=> b!882143 (= e!490931 e!490929)))

(declare-fun c!92930 () Bool)

(declare-fun e!490927 () Bool)

(assert (=> b!882143 (= c!92930 e!490927)))

(declare-fun res!599355 () Bool)

(assert (=> b!882143 (=> (not res!599355) (not e!490927))))

(assert (=> b!882143 (= res!599355 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(declare-fun b!882144 () Bool)

(declare-fun lt!398980 () Unit!30049)

(declare-fun lt!398978 () Unit!30049)

(assert (=> b!882144 (= lt!398980 lt!398978)))

(declare-fun lt!398975 () (_ BitVec 64))

(declare-fun lt!398977 () (_ BitVec 64))

(declare-fun lt!398981 () ListLongMap!10523)

(declare-fun lt!398976 () V!28569)

(assert (=> b!882144 (not (contains!4240 (+!2569 lt!398981 (tuple2!11765 lt!398977 lt!398976)) lt!398975))))

(assert (=> b!882144 (= lt!398978 (addStillNotContains!209 lt!398981 lt!398977 lt!398976 lt!398975))))

(assert (=> b!882144 (= lt!398975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882144 (= lt!398976 (get!13021 (select (arr!24718 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882144 (= lt!398977 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882144 (= lt!398981 call!38930)))

(assert (=> b!882144 (= e!490928 (+!2569 call!38930 (tuple2!11765 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13021 (select (arr!24718 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882145 () Bool)

(assert (=> b!882145 (= e!490926 (= lt!398979 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882146 () Bool)

(assert (=> b!882146 (= e!490927 (validKeyInArray!0 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882146 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882147 () Bool)

(assert (=> b!882147 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(assert (=> b!882147 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25160 _values!688)))))

(declare-fun e!490930 () Bool)

(assert (=> b!882147 (= e!490930 (= (apply!383 lt!398979 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13021 (select (arr!24718 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882148 () Bool)

(declare-fun res!599358 () Bool)

(assert (=> b!882148 (=> (not res!599358) (not e!490931))))

(assert (=> b!882148 (= res!599358 (not (contains!4240 lt!398979 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882138 () Bool)

(assert (=> b!882138 (= e!490925 (ListLongMap!10524 Nil!17555))))

(declare-fun d!108929 () Bool)

(assert (=> d!108929 e!490931))

(declare-fun res!599356 () Bool)

(assert (=> d!108929 (=> (not res!599356) (not e!490931))))

(assert (=> d!108929 (= res!599356 (not (contains!4240 lt!398979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108929 (= lt!398979 e!490925)))

(declare-fun c!92928 () Bool)

(assert (=> d!108929 (= c!92928 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(assert (=> d!108929 (validMask!0 mask!1196)))

(assert (=> d!108929 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398979)))

(declare-fun b!882149 () Bool)

(assert (=> b!882149 (= e!490929 e!490930)))

(assert (=> b!882149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(declare-fun res!599357 () Bool)

(assert (=> b!882149 (= res!599357 (contains!4240 lt!398979 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882149 (=> (not res!599357) (not e!490930))))

(declare-fun bm!38927 () Bool)

(assert (=> bm!38927 (= call!38930 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108929 c!92928) b!882138))

(assert (= (and d!108929 (not c!92928)) b!882139))

(assert (= (and b!882139 c!92931) b!882144))

(assert (= (and b!882139 (not c!92931)) b!882140))

(assert (= (or b!882144 b!882140) bm!38927))

(assert (= (and d!108929 res!599356) b!882148))

(assert (= (and b!882148 res!599358) b!882143))

(assert (= (and b!882143 res!599355) b!882146))

(assert (= (and b!882143 c!92930) b!882149))

(assert (= (and b!882143 (not c!92930)) b!882141))

(assert (= (and b!882149 res!599357) b!882147))

(assert (= (and b!882141 c!92929) b!882145))

(assert (= (and b!882141 (not c!92929)) b!882142))

(declare-fun b_lambda!12605 () Bool)

(assert (=> (not b_lambda!12605) (not b!882144)))

(assert (=> b!882144 t!24747))

(declare-fun b_and!25455 () Bool)

(assert (= b_and!25453 (and (=> t!24747 result!9733) b_and!25455)))

(declare-fun b_lambda!12607 () Bool)

(assert (=> (not b_lambda!12607) (not b!882147)))

(assert (=> b!882147 t!24747))

(declare-fun b_and!25457 () Bool)

(assert (= b_and!25455 (and (=> t!24747 result!9733) b_and!25457)))

(declare-fun m!821597 () Bool)

(assert (=> b!882144 m!821597))

(declare-fun m!821599 () Bool)

(assert (=> b!882144 m!821599))

(assert (=> b!882144 m!821367))

(assert (=> b!882144 m!821597))

(declare-fun m!821601 () Bool)

(assert (=> b!882144 m!821601))

(declare-fun m!821603 () Bool)

(assert (=> b!882144 m!821603))

(declare-fun m!821605 () Bool)

(assert (=> b!882144 m!821605))

(assert (=> b!882144 m!821569))

(assert (=> b!882144 m!821605))

(assert (=> b!882144 m!821367))

(declare-fun m!821607 () Bool)

(assert (=> b!882144 m!821607))

(declare-fun m!821609 () Bool)

(assert (=> b!882145 m!821609))

(assert (=> bm!38927 m!821609))

(declare-fun m!821611 () Bool)

(assert (=> b!882142 m!821611))

(declare-fun m!821613 () Bool)

(assert (=> d!108929 m!821613))

(assert (=> d!108929 m!821391))

(assert (=> b!882147 m!821569))

(declare-fun m!821615 () Bool)

(assert (=> b!882147 m!821615))

(assert (=> b!882147 m!821367))

(assert (=> b!882147 m!821605))

(assert (=> b!882147 m!821569))

(assert (=> b!882147 m!821605))

(assert (=> b!882147 m!821367))

(assert (=> b!882147 m!821607))

(assert (=> b!882139 m!821569))

(assert (=> b!882139 m!821569))

(declare-fun m!821617 () Bool)

(assert (=> b!882139 m!821617))

(assert (=> b!882146 m!821569))

(assert (=> b!882146 m!821569))

(assert (=> b!882146 m!821617))

(assert (=> b!882149 m!821569))

(assert (=> b!882149 m!821569))

(declare-fun m!821619 () Bool)

(assert (=> b!882149 m!821619))

(declare-fun m!821621 () Bool)

(assert (=> b!882148 m!821621))

(assert (=> b!881946 d!108929))

(declare-fun b!882151 () Bool)

(declare-fun e!490932 () ListLongMap!10523)

(declare-fun e!490935 () ListLongMap!10523)

(assert (=> b!882151 (= e!490932 e!490935)))

(declare-fun c!92935 () Bool)

(assert (=> b!882151 (= c!92935 (validKeyInArray!0 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882152 () Bool)

(declare-fun call!38931 () ListLongMap!10523)

(assert (=> b!882152 (= e!490935 call!38931)))

(declare-fun b!882153 () Bool)

(declare-fun e!490936 () Bool)

(declare-fun e!490933 () Bool)

(assert (=> b!882153 (= e!490936 e!490933)))

(declare-fun c!92933 () Bool)

(assert (=> b!882153 (= c!92933 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(declare-fun b!882154 () Bool)

(declare-fun lt!398986 () ListLongMap!10523)

(assert (=> b!882154 (= e!490933 (isEmpty!675 lt!398986))))

(declare-fun b!882155 () Bool)

(declare-fun e!490938 () Bool)

(assert (=> b!882155 (= e!490938 e!490936)))

(declare-fun c!92934 () Bool)

(declare-fun e!490934 () Bool)

(assert (=> b!882155 (= c!92934 e!490934)))

(declare-fun res!599359 () Bool)

(assert (=> b!882155 (=> (not res!599359) (not e!490934))))

(assert (=> b!882155 (= res!599359 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(declare-fun b!882156 () Bool)

(declare-fun lt!398987 () Unit!30049)

(declare-fun lt!398985 () Unit!30049)

(assert (=> b!882156 (= lt!398987 lt!398985)))

(declare-fun lt!398982 () (_ BitVec 64))

(declare-fun lt!398988 () ListLongMap!10523)

(declare-fun lt!398984 () (_ BitVec 64))

(declare-fun lt!398983 () V!28569)

(assert (=> b!882156 (not (contains!4240 (+!2569 lt!398988 (tuple2!11765 lt!398984 lt!398983)) lt!398982))))

(assert (=> b!882156 (= lt!398985 (addStillNotContains!209 lt!398988 lt!398984 lt!398983 lt!398982))))

(assert (=> b!882156 (= lt!398982 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882156 (= lt!398983 (get!13021 (select (arr!24718 lt!398867) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882156 (= lt!398984 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882156 (= lt!398988 call!38931)))

(assert (=> b!882156 (= e!490935 (+!2569 call!38931 (tuple2!11765 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13021 (select (arr!24718 lt!398867) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882157 () Bool)

(assert (=> b!882157 (= e!490933 (= lt!398986 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882158 () Bool)

(assert (=> b!882158 (= e!490934 (validKeyInArray!0 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882158 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882159 () Bool)

(assert (=> b!882159 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(assert (=> b!882159 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25160 lt!398867)))))

(declare-fun e!490937 () Bool)

(assert (=> b!882159 (= e!490937 (= (apply!383 lt!398986 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13021 (select (arr!24718 lt!398867) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1257 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882160 () Bool)

(declare-fun res!599362 () Bool)

(assert (=> b!882160 (=> (not res!599362) (not e!490938))))

(assert (=> b!882160 (= res!599362 (not (contains!4240 lt!398986 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882150 () Bool)

(assert (=> b!882150 (= e!490932 (ListLongMap!10524 Nil!17555))))

(declare-fun d!108931 () Bool)

(assert (=> d!108931 e!490938))

(declare-fun res!599360 () Bool)

(assert (=> d!108931 (=> (not res!599360) (not e!490938))))

(assert (=> d!108931 (= res!599360 (not (contains!4240 lt!398986 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108931 (= lt!398986 e!490932)))

(declare-fun c!92932 () Bool)

(assert (=> d!108931 (= c!92932 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(assert (=> d!108931 (validMask!0 mask!1196)))

(assert (=> d!108931 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398986)))

(declare-fun b!882161 () Bool)

(assert (=> b!882161 (= e!490936 e!490937)))

(assert (=> b!882161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(declare-fun res!599361 () Bool)

(assert (=> b!882161 (= res!599361 (contains!4240 lt!398986 (select (arr!24717 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882161 (=> (not res!599361) (not e!490937))))

(declare-fun bm!38928 () Bool)

(assert (=> bm!38928 (= call!38931 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398867 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108931 c!92932) b!882150))

(assert (= (and d!108931 (not c!92932)) b!882151))

(assert (= (and b!882151 c!92935) b!882156))

(assert (= (and b!882151 (not c!92935)) b!882152))

(assert (= (or b!882156 b!882152) bm!38928))

(assert (= (and d!108931 res!599360) b!882160))

(assert (= (and b!882160 res!599362) b!882155))

(assert (= (and b!882155 res!599359) b!882158))

(assert (= (and b!882155 c!92934) b!882161))

(assert (= (and b!882155 (not c!92934)) b!882153))

(assert (= (and b!882161 res!599361) b!882159))

(assert (= (and b!882153 c!92933) b!882157))

(assert (= (and b!882153 (not c!92933)) b!882154))

(declare-fun b_lambda!12609 () Bool)

(assert (=> (not b_lambda!12609) (not b!882156)))

(assert (=> b!882156 t!24747))

(declare-fun b_and!25459 () Bool)

(assert (= b_and!25457 (and (=> t!24747 result!9733) b_and!25459)))

(declare-fun b_lambda!12611 () Bool)

(assert (=> (not b_lambda!12611) (not b!882159)))

(assert (=> b!882159 t!24747))

(declare-fun b_and!25461 () Bool)

(assert (= b_and!25459 (and (=> t!24747 result!9733) b_and!25461)))

(declare-fun m!821623 () Bool)

(assert (=> b!882156 m!821623))

(declare-fun m!821625 () Bool)

(assert (=> b!882156 m!821625))

(assert (=> b!882156 m!821367))

(assert (=> b!882156 m!821623))

(declare-fun m!821627 () Bool)

(assert (=> b!882156 m!821627))

(declare-fun m!821629 () Bool)

(assert (=> b!882156 m!821629))

(declare-fun m!821631 () Bool)

(assert (=> b!882156 m!821631))

(assert (=> b!882156 m!821569))

(assert (=> b!882156 m!821631))

(assert (=> b!882156 m!821367))

(declare-fun m!821633 () Bool)

(assert (=> b!882156 m!821633))

(declare-fun m!821635 () Bool)

(assert (=> b!882157 m!821635))

(assert (=> bm!38928 m!821635))

(declare-fun m!821637 () Bool)

(assert (=> b!882154 m!821637))

(declare-fun m!821639 () Bool)

(assert (=> d!108931 m!821639))

(assert (=> d!108931 m!821391))

(assert (=> b!882159 m!821569))

(declare-fun m!821641 () Bool)

(assert (=> b!882159 m!821641))

(assert (=> b!882159 m!821367))

(assert (=> b!882159 m!821631))

(assert (=> b!882159 m!821569))

(assert (=> b!882159 m!821631))

(assert (=> b!882159 m!821367))

(assert (=> b!882159 m!821633))

(assert (=> b!882151 m!821569))

(assert (=> b!882151 m!821569))

(assert (=> b!882151 m!821617))

(assert (=> b!882158 m!821569))

(assert (=> b!882158 m!821569))

(assert (=> b!882158 m!821617))

(assert (=> b!882161 m!821569))

(assert (=> b!882161 m!821569))

(declare-fun m!821643 () Bool)

(assert (=> b!882161 m!821643))

(declare-fun m!821645 () Bool)

(assert (=> b!882160 m!821645))

(assert (=> b!881946 d!108931))

(declare-fun d!108933 () Bool)

(assert (=> d!108933 (= (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053)) (and (not (= (select (arr!24717 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24717 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881946 d!108933))

(declare-fun b!882168 () Bool)

(declare-fun e!490943 () Bool)

(declare-fun call!38936 () ListLongMap!10523)

(declare-fun call!38937 () ListLongMap!10523)

(assert (=> b!882168 (= e!490943 (= call!38936 call!38937))))

(declare-fun bm!38933 () Bool)

(assert (=> bm!38933 (= call!38936 (getCurrentListMapNoExtraKeys!3268 _keys!868 (array!51394 (store (arr!24718 _values!688) i!612 (ValueCellFull!8381 v!557)) (size!25160 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882169 () Bool)

(declare-fun e!490944 () Bool)

(assert (=> b!882169 (= e!490944 e!490943)))

(declare-fun c!92938 () Bool)

(assert (=> b!882169 (= c!92938 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!882170 () Bool)

(assert (=> b!882170 (= e!490943 (= call!38936 (+!2569 call!38937 (tuple2!11765 k0!854 v!557))))))

(declare-fun d!108935 () Bool)

(assert (=> d!108935 e!490944))

(declare-fun res!599365 () Bool)

(assert (=> d!108935 (=> (not res!599365) (not e!490944))))

(assert (=> d!108935 (= res!599365 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25160 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25160 _values!688))))))))

(declare-fun lt!398991 () Unit!30049)

(declare-fun choose!1448 (array!51391 array!51393 (_ BitVec 32) (_ BitVec 32) V!28569 V!28569 (_ BitVec 32) (_ BitVec 64) V!28569 (_ BitVec 32) Int) Unit!30049)

(assert (=> d!108935 (= lt!398991 (choose!1448 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108935 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25159 _keys!868)))))

(assert (=> d!108935 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!734 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398991)))

(declare-fun bm!38934 () Bool)

(assert (=> bm!38934 (= call!38937 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108935 res!599365) b!882169))

(assert (= (and b!882169 c!92938) b!882170))

(assert (= (and b!882169 (not c!92938)) b!882168))

(assert (= (or b!882170 b!882168) bm!38934))

(assert (= (or b!882170 b!882168) bm!38933))

(assert (=> bm!38933 m!821359))

(declare-fun m!821647 () Bool)

(assert (=> bm!38933 m!821647))

(declare-fun m!821649 () Bool)

(assert (=> b!882170 m!821649))

(declare-fun m!821651 () Bool)

(assert (=> d!108935 m!821651))

(assert (=> bm!38934 m!821397))

(assert (=> b!881946 d!108935))

(declare-fun d!108937 () Bool)

(declare-fun e!490945 () Bool)

(assert (=> d!108937 e!490945))

(declare-fun res!599367 () Bool)

(assert (=> d!108937 (=> (not res!599367) (not e!490945))))

(declare-fun lt!398995 () ListLongMap!10523)

(assert (=> d!108937 (= res!599367 (contains!4240 lt!398995 (_1!5893 (tuple2!11765 k0!854 v!557))))))

(declare-fun lt!398992 () List!17558)

(assert (=> d!108937 (= lt!398995 (ListLongMap!10524 lt!398992))))

(declare-fun lt!398994 () Unit!30049)

(declare-fun lt!398993 () Unit!30049)

(assert (=> d!108937 (= lt!398994 lt!398993)))

(assert (=> d!108937 (= (getValueByKey!423 lt!398992 (_1!5893 (tuple2!11765 k0!854 v!557))) (Some!428 (_2!5893 (tuple2!11765 k0!854 v!557))))))

(assert (=> d!108937 (= lt!398993 (lemmaContainsTupThenGetReturnValue!240 lt!398992 (_1!5893 (tuple2!11765 k0!854 v!557)) (_2!5893 (tuple2!11765 k0!854 v!557))))))

(assert (=> d!108937 (= lt!398992 (insertStrictlySorted!279 (toList!5277 lt!398870) (_1!5893 (tuple2!11765 k0!854 v!557)) (_2!5893 (tuple2!11765 k0!854 v!557))))))

(assert (=> d!108937 (= (+!2569 lt!398870 (tuple2!11765 k0!854 v!557)) lt!398995)))

(declare-fun b!882171 () Bool)

(declare-fun res!599366 () Bool)

(assert (=> b!882171 (=> (not res!599366) (not e!490945))))

(assert (=> b!882171 (= res!599366 (= (getValueByKey!423 (toList!5277 lt!398995) (_1!5893 (tuple2!11765 k0!854 v!557))) (Some!428 (_2!5893 (tuple2!11765 k0!854 v!557)))))))

(declare-fun b!882172 () Bool)

(assert (=> b!882172 (= e!490945 (contains!4242 (toList!5277 lt!398995) (tuple2!11765 k0!854 v!557)))))

(assert (= (and d!108937 res!599367) b!882171))

(assert (= (and b!882171 res!599366) b!882172))

(declare-fun m!821653 () Bool)

(assert (=> d!108937 m!821653))

(declare-fun m!821655 () Bool)

(assert (=> d!108937 m!821655))

(declare-fun m!821657 () Bool)

(assert (=> d!108937 m!821657))

(declare-fun m!821659 () Bool)

(assert (=> d!108937 m!821659))

(declare-fun m!821661 () Bool)

(assert (=> b!882171 m!821661))

(declare-fun m!821663 () Bool)

(assert (=> b!882172 m!821663))

(assert (=> b!881946 d!108937))

(declare-fun b!882181 () Bool)

(declare-fun e!490952 () Bool)

(declare-fun call!38940 () Bool)

(assert (=> b!882181 (= e!490952 call!38940)))

(declare-fun b!882182 () Bool)

(declare-fun e!490953 () Bool)

(assert (=> b!882182 (= e!490953 call!38940)))

(declare-fun bm!38937 () Bool)

(assert (=> bm!38937 (= call!38940 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108939 () Bool)

(declare-fun res!599372 () Bool)

(declare-fun e!490954 () Bool)

(assert (=> d!108939 (=> res!599372 e!490954)))

(assert (=> d!108939 (= res!599372 (bvsge #b00000000000000000000000000000000 (size!25159 _keys!868)))))

(assert (=> d!108939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490954)))

(declare-fun b!882183 () Bool)

(assert (=> b!882183 (= e!490954 e!490953)))

(declare-fun c!92941 () Bool)

(assert (=> b!882183 (= c!92941 (validKeyInArray!0 (select (arr!24717 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882184 () Bool)

(assert (=> b!882184 (= e!490953 e!490952)))

(declare-fun lt!399002 () (_ BitVec 64))

(assert (=> b!882184 (= lt!399002 (select (arr!24717 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399004 () Unit!30049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51391 (_ BitVec 64) (_ BitVec 32)) Unit!30049)

(assert (=> b!882184 (= lt!399004 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399002 #b00000000000000000000000000000000))))

(assert (=> b!882184 (arrayContainsKey!0 _keys!868 lt!399002 #b00000000000000000000000000000000)))

(declare-fun lt!399003 () Unit!30049)

(assert (=> b!882184 (= lt!399003 lt!399004)))

(declare-fun res!599373 () Bool)

(declare-datatypes ((SeekEntryResult!8755 0))(
  ( (MissingZero!8755 (index!37391 (_ BitVec 32))) (Found!8755 (index!37392 (_ BitVec 32))) (Intermediate!8755 (undefined!9567 Bool) (index!37393 (_ BitVec 32)) (x!74775 (_ BitVec 32))) (Undefined!8755) (MissingVacant!8755 (index!37394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51391 (_ BitVec 32)) SeekEntryResult!8755)

(assert (=> b!882184 (= res!599373 (= (seekEntryOrOpen!0 (select (arr!24717 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8755 #b00000000000000000000000000000000)))))

(assert (=> b!882184 (=> (not res!599373) (not e!490952))))

(assert (= (and d!108939 (not res!599372)) b!882183))

(assert (= (and b!882183 c!92941) b!882184))

(assert (= (and b!882183 (not c!92941)) b!882182))

(assert (= (and b!882184 res!599373) b!882181))

(assert (= (or b!882181 b!882182) bm!38937))

(declare-fun m!821665 () Bool)

(assert (=> bm!38937 m!821665))

(assert (=> b!882183 m!821557))

(assert (=> b!882183 m!821557))

(assert (=> b!882183 m!821561))

(assert (=> b!882184 m!821557))

(declare-fun m!821667 () Bool)

(assert (=> b!882184 m!821667))

(declare-fun m!821669 () Bool)

(assert (=> b!882184 m!821669))

(assert (=> b!882184 m!821557))

(declare-fun m!821671 () Bool)

(assert (=> b!882184 m!821671))

(assert (=> b!881937 d!108939))

(declare-fun b!882191 () Bool)

(declare-fun e!490959 () Bool)

(assert (=> b!882191 (= e!490959 tp_is_empty!17641)))

(declare-fun mapIsEmpty!28101 () Bool)

(declare-fun mapRes!28101 () Bool)

(assert (=> mapIsEmpty!28101 mapRes!28101))

(declare-fun condMapEmpty!28101 () Bool)

(declare-fun mapDefault!28101 () ValueCell!8381)

(assert (=> mapNonEmpty!28092 (= condMapEmpty!28101 (= mapRest!28092 ((as const (Array (_ BitVec 32) ValueCell!8381)) mapDefault!28101)))))

(declare-fun e!490960 () Bool)

(assert (=> mapNonEmpty!28092 (= tp!53889 (and e!490960 mapRes!28101))))

(declare-fun mapNonEmpty!28101 () Bool)

(declare-fun tp!53904 () Bool)

(assert (=> mapNonEmpty!28101 (= mapRes!28101 (and tp!53904 e!490959))))

(declare-fun mapKey!28101 () (_ BitVec 32))

(declare-fun mapValue!28101 () ValueCell!8381)

(declare-fun mapRest!28101 () (Array (_ BitVec 32) ValueCell!8381))

(assert (=> mapNonEmpty!28101 (= mapRest!28092 (store mapRest!28101 mapKey!28101 mapValue!28101))))

(declare-fun b!882192 () Bool)

(assert (=> b!882192 (= e!490960 tp_is_empty!17641)))

(assert (= (and mapNonEmpty!28092 condMapEmpty!28101) mapIsEmpty!28101))

(assert (= (and mapNonEmpty!28092 (not condMapEmpty!28101)) mapNonEmpty!28101))

(assert (= (and mapNonEmpty!28101 ((_ is ValueCellFull!8381) mapValue!28101)) b!882191))

(assert (= (and mapNonEmpty!28092 ((_ is ValueCellFull!8381) mapDefault!28101)) b!882192))

(declare-fun m!821673 () Bool)

(assert (=> mapNonEmpty!28101 m!821673))

(declare-fun b_lambda!12613 () Bool)

(assert (= b_lambda!12611 (or (and start!74802 b_free!15397) b_lambda!12613)))

(declare-fun b_lambda!12615 () Bool)

(assert (= b_lambda!12605 (or (and start!74802 b_free!15397) b_lambda!12615)))

(declare-fun b_lambda!12617 () Bool)

(assert (= b_lambda!12597 (or (and start!74802 b_free!15397) b_lambda!12617)))

(declare-fun b_lambda!12619 () Bool)

(assert (= b_lambda!12599 (or (and start!74802 b_free!15397) b_lambda!12619)))

(declare-fun b_lambda!12621 () Bool)

(assert (= b_lambda!12603 (or (and start!74802 b_free!15397) b_lambda!12621)))

(declare-fun b_lambda!12623 () Bool)

(assert (= b_lambda!12609 (or (and start!74802 b_free!15397) b_lambda!12623)))

(declare-fun b_lambda!12625 () Bool)

(assert (= b_lambda!12607 (or (and start!74802 b_free!15397) b_lambda!12625)))

(declare-fun b_lambda!12627 () Bool)

(assert (= b_lambda!12601 (or (and start!74802 b_free!15397) b_lambda!12627)))

(check-sat (not bm!38933) (not b!882145) (not b_lambda!12627) (not b!882107) (not b!882149) (not d!108923) (not b!882154) (not b!882137) (not b_lambda!12613) (not b!882089) (not b!882184) (not b!882091) (not b!882114) (not b!882090) b_and!25461 (not b!882158) (not bm!38928) (not b!882144) (not d!108915) (not bm!38937) (not b!882078) (not d!108905) (not b!882124) (not b!882086) (not b!882121) (not bm!38921) (not bm!38934) (not d!108907) (not b_lambda!12625) (not d!108935) (not b!882083) (not b!882071) (not b!882076) (not d!108929) (not bm!38927) (not b!882080) (not d!108931) (not b!882170) (not b!882122) (not b!882130) (not b!882148) (not b!882157) (not b!882113) (not b!882092) (not b!882159) (not b!882136) (not b!882142) (not b!882120) (not mapNonEmpty!28101) (not d!108937) (not b!882077) (not b_lambda!12621) (not b_lambda!12615) (not b!882139) tp_is_empty!17641 (not b!882093) (not b!882081) (not b!882156) (not b!882105) (not b!882079) (not b!882088) (not b_lambda!12617) (not b_lambda!12595) (not b!882161) (not b_lambda!12619) (not b!882146) (not b!882172) (not b!882104) (not bm!38926) (not b!882151) (not b!882183) (not b!882160) (not bm!38925) (not b!882171) (not bm!38922) (not d!108919) (not b!882131) (not b_next!15397) (not b!882074) (not b!882147) (not b_lambda!12623))
(check-sat b_and!25461 (not b_next!15397))
