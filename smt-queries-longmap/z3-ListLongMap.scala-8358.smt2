; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101724 () Bool)

(assert start!101724)

(declare-fun b_free!26419 () Bool)

(declare-fun b_next!26419 () Bool)

(assert (=> start!101724 (= b_free!26419 (not b_next!26419))))

(declare-fun tp!92303 () Bool)

(declare-fun b_and!44081 () Bool)

(assert (=> start!101724 (= tp!92303 b_and!44081)))

(declare-fun b!1224328 () Bool)

(declare-fun res!813578 () Bool)

(declare-fun e!695360 () Bool)

(assert (=> b!1224328 (=> (not res!813578) (not e!695360))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224328 (= res!813578 (validMask!0 mask!1564))))

(declare-fun b!1224329 () Bool)

(declare-fun e!695359 () Bool)

(declare-datatypes ((V!46625 0))(
  ( (V!46626 (val!15618 Int)) )
))
(declare-datatypes ((tuple2!20210 0))(
  ( (tuple2!20211 (_1!10116 (_ BitVec 64)) (_2!10116 V!46625)) )
))
(declare-datatypes ((List!26989 0))(
  ( (Nil!26986) (Cons!26985 (h!28194 tuple2!20210) (t!40379 List!26989)) )
))
(declare-datatypes ((ListLongMap!18179 0))(
  ( (ListLongMap!18180 (toList!9105 List!26989)) )
))
(declare-fun lt!557342 () ListLongMap!18179)

(declare-fun lt!557337 () ListLongMap!18179)

(assert (=> b!1224329 (= e!695359 (= lt!557342 lt!557337))))

(declare-fun b!1224330 () Bool)

(declare-fun e!695361 () Bool)

(declare-fun e!695355 () Bool)

(assert (=> b!1224330 (= e!695361 e!695355)))

(declare-fun res!813579 () Bool)

(assert (=> b!1224330 (=> res!813579 e!695355)))

(declare-datatypes ((array!78950 0))(
  ( (array!78951 (arr!38102 (Array (_ BitVec 32) (_ BitVec 64))) (size!38640 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78950)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224330 (= res!813579 (not (validKeyInArray!0 (select (arr!38102 _keys!1208) from!1455))))))

(assert (=> b!1224330 (= lt!557337 lt!557342)))

(declare-fun lt!557347 () ListLongMap!18179)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1923 (ListLongMap!18179 (_ BitVec 64)) ListLongMap!18179)

(assert (=> b!1224330 (= lt!557342 (-!1923 lt!557347 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557349 () array!78950)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14852 0))(
  ( (ValueCellFull!14852 (v!18279 V!46625)) (EmptyCell!14852) )
))
(declare-datatypes ((array!78952 0))(
  ( (array!78953 (arr!38103 (Array (_ BitVec 32) ValueCell!14852)) (size!38641 (_ BitVec 32))) )
))
(declare-fun lt!557338 () array!78952)

(declare-fun minValue!944 () V!46625)

(declare-fun zeroValue!944 () V!46625)

(declare-fun getCurrentListMapNoExtraKeys!5536 (array!78950 array!78952 (_ BitVec 32) (_ BitVec 32) V!46625 V!46625 (_ BitVec 32) Int) ListLongMap!18179)

(assert (=> b!1224330 (= lt!557337 (getCurrentListMapNoExtraKeys!5536 lt!557349 lt!557338 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78952)

(assert (=> b!1224330 (= lt!557347 (getCurrentListMapNoExtraKeys!5536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40410 0))(
  ( (Unit!40411) )
))
(declare-fun lt!557343 () Unit!40410)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1158 (array!78950 array!78952 (_ BitVec 32) (_ BitVec 32) V!46625 V!46625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40410)

(assert (=> b!1224330 (= lt!557343 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1158 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224331 () Bool)

(declare-fun e!695353 () Bool)

(declare-fun e!695364 () Bool)

(declare-fun mapRes!48583 () Bool)

(assert (=> b!1224331 (= e!695353 (and e!695364 mapRes!48583))))

(declare-fun condMapEmpty!48583 () Bool)

(declare-fun mapDefault!48583 () ValueCell!14852)

(assert (=> b!1224331 (= condMapEmpty!48583 (= (arr!38103 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14852)) mapDefault!48583)))))

(declare-fun b!1224332 () Bool)

(declare-fun e!695362 () Bool)

(declare-fun arrayContainsKey!0 (array!78950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224332 (= e!695362 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224333 () Bool)

(declare-fun res!813569 () Bool)

(assert (=> b!1224333 (=> (not res!813569) (not e!695360))))

(assert (=> b!1224333 (= res!813569 (= (select (arr!38102 _keys!1208) i!673) k0!934))))

(declare-fun b!1224334 () Bool)

(declare-fun e!695365 () Bool)

(assert (=> b!1224334 (= e!695360 e!695365)))

(declare-fun res!813567 () Bool)

(assert (=> b!1224334 (=> (not res!813567) (not e!695365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78950 (_ BitVec 32)) Bool)

(assert (=> b!1224334 (= res!813567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557349 mask!1564))))

(assert (=> b!1224334 (= lt!557349 (array!78951 (store (arr!38102 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38640 _keys!1208)))))

(declare-fun b!1224335 () Bool)

(declare-fun res!813563 () Bool)

(assert (=> b!1224335 (=> (not res!813563) (not e!695365))))

(declare-datatypes ((List!26990 0))(
  ( (Nil!26987) (Cons!26986 (h!28195 (_ BitVec 64)) (t!40380 List!26990)) )
))
(declare-fun arrayNoDuplicates!0 (array!78950 (_ BitVec 32) List!26990) Bool)

(assert (=> b!1224335 (= res!813563 (arrayNoDuplicates!0 lt!557349 #b00000000000000000000000000000000 Nil!26987))))

(declare-fun b!1224336 () Bool)

(declare-fun tp_is_empty!31123 () Bool)

(assert (=> b!1224336 (= e!695364 tp_is_empty!31123)))

(declare-fun b!1224337 () Bool)

(declare-fun e!695363 () Bool)

(assert (=> b!1224337 (= e!695363 e!695362)))

(declare-fun res!813575 () Bool)

(assert (=> b!1224337 (=> res!813575 e!695362)))

(assert (=> b!1224337 (= res!813575 (not (= (select (arr!38102 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224338 () Bool)

(declare-fun res!813568 () Bool)

(assert (=> b!1224338 (=> (not res!813568) (not e!695360))))

(assert (=> b!1224338 (= res!813568 (and (= (size!38641 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38640 _keys!1208) (size!38641 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48583 () Bool)

(assert (=> mapIsEmpty!48583 mapRes!48583))

(declare-fun b!1224339 () Bool)

(declare-fun res!813566 () Bool)

(assert (=> b!1224339 (=> (not res!813566) (not e!695360))))

(assert (=> b!1224339 (= res!813566 (validKeyInArray!0 k0!934))))

(declare-fun b!1224340 () Bool)

(assert (=> b!1224340 (= e!695355 true)))

(assert (=> b!1224340 e!695359))

(declare-fun res!813577 () Bool)

(assert (=> b!1224340 (=> (not res!813577) (not e!695359))))

(assert (=> b!1224340 (= res!813577 (not (= (select (arr!38102 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557345 () Unit!40410)

(declare-fun e!695358 () Unit!40410)

(assert (=> b!1224340 (= lt!557345 e!695358)))

(declare-fun c!120428 () Bool)

(assert (=> b!1224340 (= c!120428 (= (select (arr!38102 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224340 e!695363))

(declare-fun res!813564 () Bool)

(assert (=> b!1224340 (=> (not res!813564) (not e!695363))))

(declare-fun lt!557348 () ListLongMap!18179)

(declare-fun lt!557340 () tuple2!20210)

(declare-fun +!4166 (ListLongMap!18179 tuple2!20210) ListLongMap!18179)

(assert (=> b!1224340 (= res!813564 (= lt!557348 (+!4166 lt!557342 lt!557340)))))

(declare-fun lt!557336 () V!46625)

(declare-fun get!19479 (ValueCell!14852 V!46625) V!46625)

(assert (=> b!1224340 (= lt!557340 (tuple2!20211 (select (arr!38102 _keys!1208) from!1455) (get!19479 (select (arr!38103 _values!996) from!1455) lt!557336)))))

(declare-fun b!1224341 () Bool)

(declare-fun e!695357 () Bool)

(assert (=> b!1224341 (= e!695357 tp_is_empty!31123)))

(declare-fun b!1224342 () Bool)

(declare-fun res!813574 () Bool)

(assert (=> b!1224342 (=> (not res!813574) (not e!695360))))

(assert (=> b!1224342 (= res!813574 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26987))))

(declare-fun res!813565 () Bool)

(assert (=> start!101724 (=> (not res!813565) (not e!695360))))

(assert (=> start!101724 (= res!813565 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38640 _keys!1208))))))

(assert (=> start!101724 e!695360))

(assert (=> start!101724 tp_is_empty!31123))

(declare-fun array_inv!29106 (array!78950) Bool)

(assert (=> start!101724 (array_inv!29106 _keys!1208)))

(assert (=> start!101724 true))

(assert (=> start!101724 tp!92303))

(declare-fun array_inv!29107 (array!78952) Bool)

(assert (=> start!101724 (and (array_inv!29107 _values!996) e!695353)))

(declare-fun b!1224343 () Bool)

(declare-fun e!695356 () Bool)

(assert (=> b!1224343 (= e!695356 e!695361)))

(declare-fun res!813571 () Bool)

(assert (=> b!1224343 (=> res!813571 e!695361)))

(assert (=> b!1224343 (= res!813571 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224343 (= lt!557348 (getCurrentListMapNoExtraKeys!5536 lt!557349 lt!557338 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224343 (= lt!557338 (array!78953 (store (arr!38103 _values!996) i!673 (ValueCellFull!14852 lt!557336)) (size!38641 _values!996)))))

(declare-fun dynLambda!3381 (Int (_ BitVec 64)) V!46625)

(assert (=> b!1224343 (= lt!557336 (dynLambda!3381 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557344 () ListLongMap!18179)

(assert (=> b!1224343 (= lt!557344 (getCurrentListMapNoExtraKeys!5536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224344 () Bool)

(declare-fun res!813573 () Bool)

(assert (=> b!1224344 (=> (not res!813573) (not e!695359))))

(assert (=> b!1224344 (= res!813573 (= lt!557344 (+!4166 lt!557347 lt!557340)))))

(declare-fun b!1224345 () Bool)

(declare-fun res!813576 () Bool)

(assert (=> b!1224345 (=> (not res!813576) (not e!695360))))

(assert (=> b!1224345 (= res!813576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224346 () Bool)

(declare-fun Unit!40412 () Unit!40410)

(assert (=> b!1224346 (= e!695358 Unit!40412)))

(declare-fun lt!557341 () Unit!40410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78950 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40410)

(assert (=> b!1224346 (= lt!557341 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224346 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557346 () Unit!40410)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78950 (_ BitVec 32) (_ BitVec 32)) Unit!40410)

(assert (=> b!1224346 (= lt!557346 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224346 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26987)))

(declare-fun lt!557339 () Unit!40410)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78950 (_ BitVec 64) (_ BitVec 32) List!26990) Unit!40410)

(assert (=> b!1224346 (= lt!557339 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26987))))

(assert (=> b!1224346 false))

(declare-fun mapNonEmpty!48583 () Bool)

(declare-fun tp!92302 () Bool)

(assert (=> mapNonEmpty!48583 (= mapRes!48583 (and tp!92302 e!695357))))

(declare-fun mapRest!48583 () (Array (_ BitVec 32) ValueCell!14852))

(declare-fun mapValue!48583 () ValueCell!14852)

(declare-fun mapKey!48583 () (_ BitVec 32))

(assert (=> mapNonEmpty!48583 (= (arr!38103 _values!996) (store mapRest!48583 mapKey!48583 mapValue!48583))))

(declare-fun b!1224347 () Bool)

(declare-fun res!813570 () Bool)

(assert (=> b!1224347 (=> (not res!813570) (not e!695360))))

(assert (=> b!1224347 (= res!813570 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38640 _keys!1208))))))

(declare-fun b!1224348 () Bool)

(declare-fun Unit!40413 () Unit!40410)

(assert (=> b!1224348 (= e!695358 Unit!40413)))

(declare-fun b!1224349 () Bool)

(assert (=> b!1224349 (= e!695365 (not e!695356))))

(declare-fun res!813572 () Bool)

(assert (=> b!1224349 (=> res!813572 e!695356)))

(assert (=> b!1224349 (= res!813572 (bvsgt from!1455 i!673))))

(assert (=> b!1224349 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557350 () Unit!40410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78950 (_ BitVec 64) (_ BitVec 32)) Unit!40410)

(assert (=> b!1224349 (= lt!557350 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101724 res!813565) b!1224328))

(assert (= (and b!1224328 res!813578) b!1224338))

(assert (= (and b!1224338 res!813568) b!1224345))

(assert (= (and b!1224345 res!813576) b!1224342))

(assert (= (and b!1224342 res!813574) b!1224347))

(assert (= (and b!1224347 res!813570) b!1224339))

(assert (= (and b!1224339 res!813566) b!1224333))

(assert (= (and b!1224333 res!813569) b!1224334))

(assert (= (and b!1224334 res!813567) b!1224335))

(assert (= (and b!1224335 res!813563) b!1224349))

(assert (= (and b!1224349 (not res!813572)) b!1224343))

(assert (= (and b!1224343 (not res!813571)) b!1224330))

(assert (= (and b!1224330 (not res!813579)) b!1224340))

(assert (= (and b!1224340 res!813564) b!1224337))

(assert (= (and b!1224337 (not res!813575)) b!1224332))

(assert (= (and b!1224340 c!120428) b!1224346))

(assert (= (and b!1224340 (not c!120428)) b!1224348))

(assert (= (and b!1224340 res!813577) b!1224344))

(assert (= (and b!1224344 res!813573) b!1224329))

(assert (= (and b!1224331 condMapEmpty!48583) mapIsEmpty!48583))

(assert (= (and b!1224331 (not condMapEmpty!48583)) mapNonEmpty!48583))

(get-info :version)

(assert (= (and mapNonEmpty!48583 ((_ is ValueCellFull!14852) mapValue!48583)) b!1224341))

(assert (= (and b!1224331 ((_ is ValueCellFull!14852) mapDefault!48583)) b!1224336))

(assert (= start!101724 b!1224331))

(declare-fun b_lambda!22389 () Bool)

(assert (=> (not b_lambda!22389) (not b!1224343)))

(declare-fun t!40378 () Bool)

(declare-fun tb!11211 () Bool)

(assert (=> (and start!101724 (= defaultEntry!1004 defaultEntry!1004) t!40378) tb!11211))

(declare-fun result!23043 () Bool)

(assert (=> tb!11211 (= result!23043 tp_is_empty!31123)))

(assert (=> b!1224343 t!40378))

(declare-fun b_and!44083 () Bool)

(assert (= b_and!44081 (and (=> t!40378 result!23043) b_and!44083)))

(declare-fun m!1128875 () Bool)

(assert (=> b!1224349 m!1128875))

(declare-fun m!1128877 () Bool)

(assert (=> b!1224349 m!1128877))

(declare-fun m!1128879 () Bool)

(assert (=> b!1224337 m!1128879))

(declare-fun m!1128881 () Bool)

(assert (=> b!1224330 m!1128881))

(declare-fun m!1128883 () Bool)

(assert (=> b!1224330 m!1128883))

(declare-fun m!1128885 () Bool)

(assert (=> b!1224330 m!1128885))

(assert (=> b!1224330 m!1128879))

(assert (=> b!1224330 m!1128879))

(declare-fun m!1128887 () Bool)

(assert (=> b!1224330 m!1128887))

(declare-fun m!1128889 () Bool)

(assert (=> b!1224330 m!1128889))

(declare-fun m!1128891 () Bool)

(assert (=> b!1224328 m!1128891))

(declare-fun m!1128893 () Bool)

(assert (=> b!1224343 m!1128893))

(declare-fun m!1128895 () Bool)

(assert (=> b!1224343 m!1128895))

(declare-fun m!1128897 () Bool)

(assert (=> b!1224343 m!1128897))

(declare-fun m!1128899 () Bool)

(assert (=> b!1224343 m!1128899))

(assert (=> b!1224340 m!1128879))

(declare-fun m!1128901 () Bool)

(assert (=> b!1224340 m!1128901))

(declare-fun m!1128903 () Bool)

(assert (=> b!1224340 m!1128903))

(assert (=> b!1224340 m!1128903))

(declare-fun m!1128905 () Bool)

(assert (=> b!1224340 m!1128905))

(declare-fun m!1128907 () Bool)

(assert (=> b!1224342 m!1128907))

(declare-fun m!1128909 () Bool)

(assert (=> b!1224344 m!1128909))

(declare-fun m!1128911 () Bool)

(assert (=> b!1224333 m!1128911))

(declare-fun m!1128913 () Bool)

(assert (=> b!1224334 m!1128913))

(declare-fun m!1128915 () Bool)

(assert (=> b!1224334 m!1128915))

(declare-fun m!1128917 () Bool)

(assert (=> mapNonEmpty!48583 m!1128917))

(declare-fun m!1128919 () Bool)

(assert (=> b!1224339 m!1128919))

(declare-fun m!1128921 () Bool)

(assert (=> b!1224332 m!1128921))

(declare-fun m!1128923 () Bool)

(assert (=> b!1224345 m!1128923))

(declare-fun m!1128925 () Bool)

(assert (=> b!1224346 m!1128925))

(declare-fun m!1128927 () Bool)

(assert (=> b!1224346 m!1128927))

(declare-fun m!1128929 () Bool)

(assert (=> b!1224346 m!1128929))

(declare-fun m!1128931 () Bool)

(assert (=> b!1224346 m!1128931))

(declare-fun m!1128933 () Bool)

(assert (=> b!1224346 m!1128933))

(declare-fun m!1128935 () Bool)

(assert (=> start!101724 m!1128935))

(declare-fun m!1128937 () Bool)

(assert (=> start!101724 m!1128937))

(declare-fun m!1128939 () Bool)

(assert (=> b!1224335 m!1128939))

(check-sat (not b_next!26419) (not start!101724) tp_is_empty!31123 (not b!1224349) (not b!1224345) (not b!1224346) (not b!1224343) (not b!1224344) (not b!1224342) (not b!1224332) (not b_lambda!22389) (not b!1224334) (not b!1224335) b_and!44083 (not b!1224340) (not b!1224339) (not b!1224330) (not mapNonEmpty!48583) (not b!1224328))
(check-sat b_and!44083 (not b_next!26419))
