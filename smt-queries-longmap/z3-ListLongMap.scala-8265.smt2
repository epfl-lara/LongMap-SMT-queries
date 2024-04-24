; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100774 () Bool)

(assert start!100774)

(declare-fun b_free!25861 () Bool)

(declare-fun b_next!25861 () Bool)

(assert (=> start!100774 (= b_free!25861 (not b_next!25861))))

(declare-fun tp!90573 () Bool)

(declare-fun b_and!42611 () Bool)

(assert (=> start!100774 (= tp!90573 b_and!42611)))

(declare-fun b!1203042 () Bool)

(declare-fun res!800451 () Bool)

(declare-fun e!683262 () Bool)

(assert (=> b!1203042 (=> (not res!800451) (not e!683262))))

(declare-datatypes ((array!77941 0))(
  ( (array!77942 (arr!37609 (Array (_ BitVec 32) (_ BitVec 64))) (size!38146 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77941)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1203042 (= res!800451 (= (select (arr!37609 _keys!1208) i!673) k0!934))))

(declare-fun bm!57594 () Bool)

(declare-fun call!57604 () Bool)

(declare-fun call!57600 () Bool)

(assert (=> bm!57594 (= call!57604 call!57600)))

(declare-fun b!1203043 () Bool)

(declare-fun e!683268 () Bool)

(declare-fun tp_is_empty!30565 () Bool)

(assert (=> b!1203043 (= e!683268 tp_is_empty!30565)))

(declare-fun bm!57595 () Bool)

(declare-datatypes ((V!45881 0))(
  ( (V!45882 (val!15339 Int)) )
))
(declare-datatypes ((tuple2!19666 0))(
  ( (tuple2!19667 (_1!9844 (_ BitVec 64)) (_2!9844 V!45881)) )
))
(declare-datatypes ((List!26481 0))(
  ( (Nil!26478) (Cons!26477 (h!27695 tuple2!19666) (t!39314 List!26481)) )
))
(declare-datatypes ((ListLongMap!17643 0))(
  ( (ListLongMap!17644 (toList!8837 List!26481)) )
))
(declare-fun call!57599 () ListLongMap!17643)

(declare-fun call!57602 () ListLongMap!17643)

(assert (=> bm!57595 (= call!57599 call!57602)))

(declare-fun b!1203044 () Bool)

(declare-fun e!683271 () Bool)

(declare-fun e!683273 () Bool)

(assert (=> b!1203044 (= e!683271 e!683273)))

(declare-fun res!800460 () Bool)

(assert (=> b!1203044 (=> res!800460 e!683273)))

(declare-fun lt!545107 () ListLongMap!17643)

(declare-fun contains!6916 (ListLongMap!17643 (_ BitVec 64)) Bool)

(assert (=> b!1203044 (= res!800460 (not (contains!6916 lt!545107 k0!934)))))

(declare-fun zeroValue!944 () V!45881)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14573 0))(
  ( (ValueCellFull!14573 (v!17973 V!45881)) (EmptyCell!14573) )
))
(declare-datatypes ((array!77943 0))(
  ( (array!77944 (arr!37610 (Array (_ BitVec 32) ValueCell!14573)) (size!38147 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77943)

(declare-fun minValue!944 () V!45881)

(declare-fun getCurrentListMapNoExtraKeys!5304 (array!77941 array!77943 (_ BitVec 32) (_ BitVec 32) V!45881 V!45881 (_ BitVec 32) Int) ListLongMap!17643)

(assert (=> b!1203044 (= lt!545107 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203045 () Bool)

(declare-fun e!683272 () Bool)

(assert (=> b!1203045 (= e!683272 tp_is_empty!30565)))

(declare-fun bm!57596 () Bool)

(declare-datatypes ((Unit!39804 0))(
  ( (Unit!39805) )
))
(declare-fun call!57597 () Unit!39804)

(declare-fun c!117964 () Bool)

(declare-fun lt!545120 () ListLongMap!17643)

(declare-fun c!117963 () Bool)

(declare-fun addStillContains!994 (ListLongMap!17643 (_ BitVec 64) V!45881 (_ BitVec 64)) Unit!39804)

(assert (=> bm!57596 (= call!57597 (addStillContains!994 (ite c!117963 lt!545120 lt!545107) (ite c!117963 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117964 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117963 minValue!944 (ite c!117964 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1203047 () Bool)

(declare-fun c!117961 () Bool)

(declare-fun lt!545115 () Bool)

(assert (=> b!1203047 (= c!117961 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545115))))

(declare-fun e!683263 () Unit!39804)

(declare-fun e!683266 () Unit!39804)

(assert (=> b!1203047 (= e!683263 e!683266)))

(declare-fun b!1203048 () Bool)

(declare-fun res!800463 () Bool)

(assert (=> b!1203048 (=> (not res!800463) (not e!683262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77941 (_ BitVec 32)) Bool)

(assert (=> b!1203048 (= res!800463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47690 () Bool)

(declare-fun mapRes!47690 () Bool)

(declare-fun tp!90572 () Bool)

(assert (=> mapNonEmpty!47690 (= mapRes!47690 (and tp!90572 e!683272))))

(declare-fun mapKey!47690 () (_ BitVec 32))

(declare-fun mapRest!47690 () (Array (_ BitVec 32) ValueCell!14573))

(declare-fun mapValue!47690 () ValueCell!14573)

(assert (=> mapNonEmpty!47690 (= (arr!37610 _values!996) (store mapRest!47690 mapKey!47690 mapValue!47690))))

(declare-fun b!1203049 () Bool)

(declare-fun e!683265 () Unit!39804)

(assert (=> b!1203049 (= e!683265 e!683263)))

(assert (=> b!1203049 (= c!117964 (and (not lt!545115) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203050 () Bool)

(assert (=> b!1203050 call!57604))

(declare-fun lt!545111 () Unit!39804)

(declare-fun call!57601 () Unit!39804)

(assert (=> b!1203050 (= lt!545111 call!57601)))

(assert (=> b!1203050 (= e!683263 lt!545111)))

(declare-fun bm!57597 () Bool)

(assert (=> bm!57597 (= call!57600 (contains!6916 (ite c!117963 lt!545120 call!57599) k0!934))))

(declare-fun call!57603 () ListLongMap!17643)

(declare-fun bm!57598 () Bool)

(assert (=> bm!57598 (= call!57603 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203051 () Bool)

(assert (=> b!1203051 (= e!683273 true)))

(declare-fun lt!545108 () Unit!39804)

(assert (=> b!1203051 (= lt!545108 e!683265)))

(assert (=> b!1203051 (= c!117963 (and (not lt!545115) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203051 (= lt!545115 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203052 () Bool)

(declare-fun res!800456 () Bool)

(assert (=> b!1203052 (=> (not res!800456) (not e!683262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203052 (= res!800456 (validMask!0 mask!1564))))

(declare-fun b!1203053 () Bool)

(declare-fun Unit!39806 () Unit!39804)

(assert (=> b!1203053 (= e!683266 Unit!39806)))

(declare-fun b!1203054 () Bool)

(declare-fun res!800454 () Bool)

(assert (=> b!1203054 (=> (not res!800454) (not e!683262))))

(assert (=> b!1203054 (= res!800454 (and (= (size!38147 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38146 _keys!1208) (size!38147 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203055 () Bool)

(declare-fun lt!545110 () Unit!39804)

(assert (=> b!1203055 (= e!683266 lt!545110)))

(assert (=> b!1203055 (= lt!545110 call!57601)))

(assert (=> b!1203055 call!57604))

(declare-fun b!1203056 () Bool)

(declare-fun e!683269 () Bool)

(declare-fun e!683264 () Bool)

(assert (=> b!1203056 (= e!683269 e!683264)))

(declare-fun res!800453 () Bool)

(assert (=> b!1203056 (=> res!800453 e!683264)))

(assert (=> b!1203056 (= res!800453 (not (= from!1455 i!673)))))

(declare-fun lt!545112 () ListLongMap!17643)

(declare-fun lt!545114 () array!77943)

(declare-fun lt!545117 () array!77941)

(assert (=> b!1203056 (= lt!545112 (getCurrentListMapNoExtraKeys!5304 lt!545117 lt!545114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3242 (Int (_ BitVec 64)) V!45881)

(assert (=> b!1203056 (= lt!545114 (array!77944 (store (arr!37610 _values!996) i!673 (ValueCellFull!14573 (dynLambda!3242 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38147 _values!996)))))

(declare-fun lt!545109 () ListLongMap!17643)

(assert (=> b!1203056 (= lt!545109 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203057 () Bool)

(declare-fun res!800459 () Bool)

(declare-fun e!683270 () Bool)

(assert (=> b!1203057 (=> (not res!800459) (not e!683270))))

(declare-datatypes ((List!26482 0))(
  ( (Nil!26479) (Cons!26478 (h!27696 (_ BitVec 64)) (t!39315 List!26482)) )
))
(declare-fun arrayNoDuplicates!0 (array!77941 (_ BitVec 32) List!26482) Bool)

(assert (=> b!1203057 (= res!800459 (arrayNoDuplicates!0 lt!545117 #b00000000000000000000000000000000 Nil!26479))))

(declare-fun b!1203058 () Bool)

(declare-fun res!800462 () Bool)

(assert (=> b!1203058 (=> (not res!800462) (not e!683262))))

(assert (=> b!1203058 (= res!800462 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38146 _keys!1208))))))

(declare-fun b!1203059 () Bool)

(assert (=> b!1203059 (= e!683264 e!683271)))

(declare-fun res!800452 () Bool)

(assert (=> b!1203059 (=> res!800452 e!683271)))

(assert (=> b!1203059 (= res!800452 (not (= (select (arr!37609 _keys!1208) from!1455) k0!934)))))

(declare-fun e!683261 () Bool)

(assert (=> b!1203059 e!683261))

(declare-fun c!117962 () Bool)

(assert (=> b!1203059 (= c!117962 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545119 () Unit!39804)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1012 (array!77941 array!77943 (_ BitVec 32) (_ BitVec 32) V!45881 V!45881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39804)

(assert (=> b!1203059 (= lt!545119 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203060 () Bool)

(assert (=> b!1203060 (= e!683262 e!683270)))

(declare-fun res!800464 () Bool)

(assert (=> b!1203060 (=> (not res!800464) (not e!683270))))

(assert (=> b!1203060 (= res!800464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545117 mask!1564))))

(assert (=> b!1203060 (= lt!545117 (array!77942 (store (arr!37609 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38146 _keys!1208)))))

(declare-fun bm!57599 () Bool)

(declare-fun call!57598 () ListLongMap!17643)

(assert (=> bm!57599 (= call!57598 (getCurrentListMapNoExtraKeys!5304 lt!545117 lt!545114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203061 () Bool)

(declare-fun lt!545116 () Unit!39804)

(assert (=> b!1203061 (= e!683265 lt!545116)))

(declare-fun lt!545113 () Unit!39804)

(assert (=> b!1203061 (= lt!545113 (addStillContains!994 lt!545107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun +!4007 (ListLongMap!17643 tuple2!19666) ListLongMap!17643)

(assert (=> b!1203061 (= lt!545120 (+!4007 lt!545107 (tuple2!19667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1203061 call!57600))

(assert (=> b!1203061 (= lt!545116 call!57597)))

(assert (=> b!1203061 (contains!6916 call!57602 k0!934)))

(declare-fun b!1203062 () Bool)

(declare-fun res!800457 () Bool)

(assert (=> b!1203062 (=> (not res!800457) (not e!683262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203062 (= res!800457 (validKeyInArray!0 k0!934))))

(declare-fun b!1203063 () Bool)

(assert (=> b!1203063 (= e!683270 (not e!683269))))

(declare-fun res!800461 () Bool)

(assert (=> b!1203063 (=> res!800461 e!683269)))

(assert (=> b!1203063 (= res!800461 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203063 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545118 () Unit!39804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77941 (_ BitVec 64) (_ BitVec 32)) Unit!39804)

(assert (=> b!1203063 (= lt!545118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1203064 () Bool)

(assert (=> b!1203064 (= e!683261 (= call!57598 call!57603))))

(declare-fun res!800455 () Bool)

(assert (=> start!100774 (=> (not res!800455) (not e!683262))))

(assert (=> start!100774 (= res!800455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38146 _keys!1208))))))

(assert (=> start!100774 e!683262))

(assert (=> start!100774 tp_is_empty!30565))

(declare-fun array_inv!28728 (array!77941) Bool)

(assert (=> start!100774 (array_inv!28728 _keys!1208)))

(assert (=> start!100774 true))

(assert (=> start!100774 tp!90573))

(declare-fun e!683267 () Bool)

(declare-fun array_inv!28729 (array!77943) Bool)

(assert (=> start!100774 (and (array_inv!28729 _values!996) e!683267)))

(declare-fun b!1203046 () Bool)

(assert (=> b!1203046 (= e!683267 (and e!683268 mapRes!47690))))

(declare-fun condMapEmpty!47690 () Bool)

(declare-fun mapDefault!47690 () ValueCell!14573)

(assert (=> b!1203046 (= condMapEmpty!47690 (= (arr!37610 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14573)) mapDefault!47690)))))

(declare-fun b!1203065 () Bool)

(declare-fun res!800458 () Bool)

(assert (=> b!1203065 (=> (not res!800458) (not e!683262))))

(assert (=> b!1203065 (= res!800458 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26479))))

(declare-fun mapIsEmpty!47690 () Bool)

(assert (=> mapIsEmpty!47690 mapRes!47690))

(declare-fun b!1203066 () Bool)

(declare-fun -!1791 (ListLongMap!17643 (_ BitVec 64)) ListLongMap!17643)

(assert (=> b!1203066 (= e!683261 (= call!57598 (-!1791 call!57603 k0!934)))))

(declare-fun bm!57600 () Bool)

(assert (=> bm!57600 (= call!57602 (+!4007 (ite c!117963 lt!545120 lt!545107) (ite c!117963 (tuple2!19667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117964 (tuple2!19667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!57601 () Bool)

(assert (=> bm!57601 (= call!57601 call!57597)))

(assert (= (and start!100774 res!800455) b!1203052))

(assert (= (and b!1203052 res!800456) b!1203054))

(assert (= (and b!1203054 res!800454) b!1203048))

(assert (= (and b!1203048 res!800463) b!1203065))

(assert (= (and b!1203065 res!800458) b!1203058))

(assert (= (and b!1203058 res!800462) b!1203062))

(assert (= (and b!1203062 res!800457) b!1203042))

(assert (= (and b!1203042 res!800451) b!1203060))

(assert (= (and b!1203060 res!800464) b!1203057))

(assert (= (and b!1203057 res!800459) b!1203063))

(assert (= (and b!1203063 (not res!800461)) b!1203056))

(assert (= (and b!1203056 (not res!800453)) b!1203059))

(assert (= (and b!1203059 c!117962) b!1203066))

(assert (= (and b!1203059 (not c!117962)) b!1203064))

(assert (= (or b!1203066 b!1203064) bm!57599))

(assert (= (or b!1203066 b!1203064) bm!57598))

(assert (= (and b!1203059 (not res!800452)) b!1203044))

(assert (= (and b!1203044 (not res!800460)) b!1203051))

(assert (= (and b!1203051 c!117963) b!1203061))

(assert (= (and b!1203051 (not c!117963)) b!1203049))

(assert (= (and b!1203049 c!117964) b!1203050))

(assert (= (and b!1203049 (not c!117964)) b!1203047))

(assert (= (and b!1203047 c!117961) b!1203055))

(assert (= (and b!1203047 (not c!117961)) b!1203053))

(assert (= (or b!1203050 b!1203055) bm!57601))

(assert (= (or b!1203050 b!1203055) bm!57595))

(assert (= (or b!1203050 b!1203055) bm!57594))

(assert (= (or b!1203061 bm!57594) bm!57597))

(assert (= (or b!1203061 bm!57601) bm!57596))

(assert (= (or b!1203061 bm!57595) bm!57600))

(assert (= (and b!1203046 condMapEmpty!47690) mapIsEmpty!47690))

(assert (= (and b!1203046 (not condMapEmpty!47690)) mapNonEmpty!47690))

(get-info :version)

(assert (= (and mapNonEmpty!47690 ((_ is ValueCellFull!14573) mapValue!47690)) b!1203045))

(assert (= (and b!1203046 ((_ is ValueCellFull!14573) mapDefault!47690)) b!1203043))

(assert (= start!100774 b!1203046))

(declare-fun b_lambda!21051 () Bool)

(assert (=> (not b_lambda!21051) (not b!1203056)))

(declare-fun t!39313 () Bool)

(declare-fun tb!10653 () Bool)

(assert (=> (and start!100774 (= defaultEntry!1004 defaultEntry!1004) t!39313) tb!10653))

(declare-fun result!21891 () Bool)

(assert (=> tb!10653 (= result!21891 tp_is_empty!30565)))

(assert (=> b!1203056 t!39313))

(declare-fun b_and!42613 () Bool)

(assert (= b_and!42611 (and (=> t!39313 result!21891) b_and!42613)))

(declare-fun m!1109351 () Bool)

(assert (=> b!1203063 m!1109351))

(declare-fun m!1109353 () Bool)

(assert (=> b!1203063 m!1109353))

(declare-fun m!1109355 () Bool)

(assert (=> bm!57598 m!1109355))

(declare-fun m!1109357 () Bool)

(assert (=> b!1203059 m!1109357))

(declare-fun m!1109359 () Bool)

(assert (=> b!1203059 m!1109359))

(declare-fun m!1109361 () Bool)

(assert (=> b!1203066 m!1109361))

(declare-fun m!1109363 () Bool)

(assert (=> b!1203061 m!1109363))

(declare-fun m!1109365 () Bool)

(assert (=> b!1203061 m!1109365))

(declare-fun m!1109367 () Bool)

(assert (=> b!1203061 m!1109367))

(declare-fun m!1109369 () Bool)

(assert (=> b!1203060 m!1109369))

(declare-fun m!1109371 () Bool)

(assert (=> b!1203060 m!1109371))

(declare-fun m!1109373 () Bool)

(assert (=> b!1203052 m!1109373))

(declare-fun m!1109375 () Bool)

(assert (=> b!1203062 m!1109375))

(declare-fun m!1109377 () Bool)

(assert (=> b!1203065 m!1109377))

(declare-fun m!1109379 () Bool)

(assert (=> bm!57599 m!1109379))

(declare-fun m!1109381 () Bool)

(assert (=> b!1203044 m!1109381))

(assert (=> b!1203044 m!1109355))

(declare-fun m!1109383 () Bool)

(assert (=> bm!57596 m!1109383))

(declare-fun m!1109385 () Bool)

(assert (=> b!1203056 m!1109385))

(declare-fun m!1109387 () Bool)

(assert (=> b!1203056 m!1109387))

(declare-fun m!1109389 () Bool)

(assert (=> b!1203056 m!1109389))

(declare-fun m!1109391 () Bool)

(assert (=> b!1203056 m!1109391))

(declare-fun m!1109393 () Bool)

(assert (=> bm!57597 m!1109393))

(declare-fun m!1109395 () Bool)

(assert (=> start!100774 m!1109395))

(declare-fun m!1109397 () Bool)

(assert (=> start!100774 m!1109397))

(declare-fun m!1109399 () Bool)

(assert (=> mapNonEmpty!47690 m!1109399))

(declare-fun m!1109401 () Bool)

(assert (=> b!1203057 m!1109401))

(declare-fun m!1109403 () Bool)

(assert (=> bm!57600 m!1109403))

(declare-fun m!1109405 () Bool)

(assert (=> b!1203048 m!1109405))

(declare-fun m!1109407 () Bool)

(assert (=> b!1203042 m!1109407))

(check-sat tp_is_empty!30565 (not b!1203066) (not b!1203061) (not b!1203056) (not start!100774) (not b_lambda!21051) (not b!1203048) (not b!1203063) (not b!1203062) (not b_next!25861) (not mapNonEmpty!47690) (not bm!57597) (not bm!57596) (not b!1203060) (not bm!57599) (not b!1203059) (not b!1203044) (not bm!57600) (not bm!57598) (not b!1203057) (not b!1203052) b_and!42613 (not b!1203065))
(check-sat b_and!42613 (not b_next!25861))
