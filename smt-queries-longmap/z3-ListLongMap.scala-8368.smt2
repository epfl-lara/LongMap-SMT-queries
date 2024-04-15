; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101784 () Bool)

(assert start!101784)

(declare-fun b_free!26479 () Bool)

(declare-fun b_next!26479 () Bool)

(assert (=> start!101784 (= b_free!26479 (not b_next!26479))))

(declare-fun tp!92482 () Bool)

(declare-fun b_and!44201 () Bool)

(assert (=> start!101784 (= tp!92482 b_and!44201)))

(declare-fun b!1226024 () Bool)

(declare-fun res!814833 () Bool)

(declare-fun e!696303 () Bool)

(assert (=> b!1226024 (=> (not res!814833) (not e!696303))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226024 (= res!814833 (validMask!0 mask!1564))))

(declare-datatypes ((V!46705 0))(
  ( (V!46706 (val!15648 Int)) )
))
(declare-datatypes ((tuple2!20254 0))(
  ( (tuple2!20255 (_1!10138 (_ BitVec 64)) (_2!10138 V!46705)) )
))
(declare-datatypes ((List!27035 0))(
  ( (Nil!27032) (Cons!27031 (h!28240 tuple2!20254) (t!40485 List!27035)) )
))
(declare-datatypes ((ListLongMap!18223 0))(
  ( (ListLongMap!18224 (toList!9127 List!27035)) )
))
(declare-fun lt!558526 () ListLongMap!18223)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!558527 () ListLongMap!18223)

(declare-fun b!1226025 () Bool)

(declare-fun e!696307 () Bool)

(declare-fun -!1942 (ListLongMap!18223 (_ BitVec 64)) ListLongMap!18223)

(assert (=> b!1226025 (= e!696307 (= lt!558526 (-!1942 lt!558527 k0!934)))))

(declare-fun b!1226026 () Bool)

(declare-fun e!696305 () Bool)

(assert (=> b!1226026 (= e!696305 e!696307)))

(declare-fun res!814829 () Bool)

(assert (=> b!1226026 (=> res!814829 e!696307)))

(declare-datatypes ((array!79064 0))(
  ( (array!79065 (arr!38159 (Array (_ BitVec 32) (_ BitVec 64))) (size!38697 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79064)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226026 (= res!814829 (validKeyInArray!0 (select (arr!38159 _keys!1208) from!1455)))))

(declare-fun zeroValue!944 () V!46705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!558528 () array!79064)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14882 0))(
  ( (ValueCellFull!14882 (v!18309 V!46705)) (EmptyCell!14882) )
))
(declare-datatypes ((array!79066 0))(
  ( (array!79067 (arr!38160 (Array (_ BitVec 32) ValueCell!14882)) (size!38698 (_ BitVec 32))) )
))
(declare-fun lt!558524 () array!79066)

(declare-fun _values!996 () array!79066)

(declare-fun minValue!944 () V!46705)

(declare-fun getCurrentListMapNoExtraKeys!5556 (array!79064 array!79066 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) Int) ListLongMap!18223)

(assert (=> b!1226026 (= (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1942 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40485 0))(
  ( (Unit!40486) )
))
(declare-fun lt!558529 () Unit!40485)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1173 (array!79064 array!79066 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40485)

(assert (=> b!1226026 (= lt!558529 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226027 () Bool)

(declare-fun e!696301 () Bool)

(assert (=> b!1226027 (= e!696303 e!696301)))

(declare-fun res!814836 () Bool)

(assert (=> b!1226027 (=> (not res!814836) (not e!696301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79064 (_ BitVec 32)) Bool)

(assert (=> b!1226027 (= res!814836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558528 mask!1564))))

(assert (=> b!1226027 (= lt!558528 (array!79065 (store (arr!38159 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38697 _keys!1208)))))

(declare-fun b!1226028 () Bool)

(declare-fun e!696304 () Bool)

(declare-fun tp_is_empty!31183 () Bool)

(assert (=> b!1226028 (= e!696304 tp_is_empty!31183)))

(declare-fun b!1226029 () Bool)

(declare-fun res!814824 () Bool)

(assert (=> b!1226029 (=> (not res!814824) (not e!696303))))

(assert (=> b!1226029 (= res!814824 (validKeyInArray!0 k0!934))))

(declare-fun b!1226030 () Bool)

(declare-fun e!696300 () Bool)

(assert (=> b!1226030 (= e!696301 (not e!696300))))

(declare-fun res!814826 () Bool)

(assert (=> b!1226030 (=> res!814826 e!696300)))

(assert (=> b!1226030 (= res!814826 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226030 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558525 () Unit!40485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79064 (_ BitVec 64) (_ BitVec 32)) Unit!40485)

(assert (=> b!1226030 (= lt!558525 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226031 () Bool)

(declare-fun res!814832 () Bool)

(assert (=> b!1226031 (=> (not res!814832) (not e!696303))))

(assert (=> b!1226031 (= res!814832 (and (= (size!38698 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38697 _keys!1208) (size!38698 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226032 () Bool)

(assert (=> b!1226032 (= e!696300 e!696305)))

(declare-fun res!814827 () Bool)

(assert (=> b!1226032 (=> res!814827 e!696305)))

(assert (=> b!1226032 (= res!814827 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1226032 (= lt!558526 (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3400 (Int (_ BitVec 64)) V!46705)

(assert (=> b!1226032 (= lt!558524 (array!79067 (store (arr!38160 _values!996) i!673 (ValueCellFull!14882 (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38698 _values!996)))))

(assert (=> b!1226032 (= lt!558527 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226033 () Bool)

(declare-fun e!696302 () Bool)

(declare-fun e!696299 () Bool)

(declare-fun mapRes!48673 () Bool)

(assert (=> b!1226033 (= e!696302 (and e!696299 mapRes!48673))))

(declare-fun condMapEmpty!48673 () Bool)

(declare-fun mapDefault!48673 () ValueCell!14882)

(assert (=> b!1226033 (= condMapEmpty!48673 (= (arr!38160 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14882)) mapDefault!48673)))))

(declare-fun mapIsEmpty!48673 () Bool)

(assert (=> mapIsEmpty!48673 mapRes!48673))

(declare-fun mapNonEmpty!48673 () Bool)

(declare-fun tp!92483 () Bool)

(assert (=> mapNonEmpty!48673 (= mapRes!48673 (and tp!92483 e!696304))))

(declare-fun mapKey!48673 () (_ BitVec 32))

(declare-fun mapRest!48673 () (Array (_ BitVec 32) ValueCell!14882))

(declare-fun mapValue!48673 () ValueCell!14882)

(assert (=> mapNonEmpty!48673 (= (arr!38160 _values!996) (store mapRest!48673 mapKey!48673 mapValue!48673))))

(declare-fun b!1226034 () Bool)

(declare-fun res!814828 () Bool)

(assert (=> b!1226034 (=> (not res!814828) (not e!696303))))

(assert (=> b!1226034 (= res!814828 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38697 _keys!1208))))))

(declare-fun res!814825 () Bool)

(assert (=> start!101784 (=> (not res!814825) (not e!696303))))

(assert (=> start!101784 (= res!814825 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38697 _keys!1208))))))

(assert (=> start!101784 e!696303))

(assert (=> start!101784 tp_is_empty!31183))

(declare-fun array_inv!29144 (array!79064) Bool)

(assert (=> start!101784 (array_inv!29144 _keys!1208)))

(assert (=> start!101784 true))

(assert (=> start!101784 tp!92482))

(declare-fun array_inv!29145 (array!79066) Bool)

(assert (=> start!101784 (and (array_inv!29145 _values!996) e!696302)))

(declare-fun b!1226023 () Bool)

(declare-fun res!814830 () Bool)

(assert (=> b!1226023 (=> (not res!814830) (not e!696303))))

(assert (=> b!1226023 (= res!814830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226035 () Bool)

(declare-fun res!814831 () Bool)

(assert (=> b!1226035 (=> (not res!814831) (not e!696303))))

(assert (=> b!1226035 (= res!814831 (= (select (arr!38159 _keys!1208) i!673) k0!934))))

(declare-fun b!1226036 () Bool)

(declare-fun res!814835 () Bool)

(assert (=> b!1226036 (=> (not res!814835) (not e!696301))))

(declare-datatypes ((List!27036 0))(
  ( (Nil!27033) (Cons!27032 (h!28241 (_ BitVec 64)) (t!40486 List!27036)) )
))
(declare-fun arrayNoDuplicates!0 (array!79064 (_ BitVec 32) List!27036) Bool)

(assert (=> b!1226036 (= res!814835 (arrayNoDuplicates!0 lt!558528 #b00000000000000000000000000000000 Nil!27033))))

(declare-fun b!1226037 () Bool)

(assert (=> b!1226037 (= e!696299 tp_is_empty!31183)))

(declare-fun b!1226038 () Bool)

(declare-fun res!814834 () Bool)

(assert (=> b!1226038 (=> (not res!814834) (not e!696303))))

(assert (=> b!1226038 (= res!814834 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27033))))

(assert (= (and start!101784 res!814825) b!1226024))

(assert (= (and b!1226024 res!814833) b!1226031))

(assert (= (and b!1226031 res!814832) b!1226023))

(assert (= (and b!1226023 res!814830) b!1226038))

(assert (= (and b!1226038 res!814834) b!1226034))

(assert (= (and b!1226034 res!814828) b!1226029))

(assert (= (and b!1226029 res!814824) b!1226035))

(assert (= (and b!1226035 res!814831) b!1226027))

(assert (= (and b!1226027 res!814836) b!1226036))

(assert (= (and b!1226036 res!814835) b!1226030))

(assert (= (and b!1226030 (not res!814826)) b!1226032))

(assert (= (and b!1226032 (not res!814827)) b!1226026))

(assert (= (and b!1226026 (not res!814829)) b!1226025))

(assert (= (and b!1226033 condMapEmpty!48673) mapIsEmpty!48673))

(assert (= (and b!1226033 (not condMapEmpty!48673)) mapNonEmpty!48673))

(get-info :version)

(assert (= (and mapNonEmpty!48673 ((_ is ValueCellFull!14882) mapValue!48673)) b!1226028))

(assert (= (and b!1226033 ((_ is ValueCellFull!14882) mapDefault!48673)) b!1226037))

(assert (= start!101784 b!1226033))

(declare-fun b_lambda!22449 () Bool)

(assert (=> (not b_lambda!22449) (not b!1226032)))

(declare-fun t!40484 () Bool)

(declare-fun tb!11271 () Bool)

(assert (=> (and start!101784 (= defaultEntry!1004 defaultEntry!1004) t!40484) tb!11271))

(declare-fun result!23163 () Bool)

(assert (=> tb!11271 (= result!23163 tp_is_empty!31183)))

(assert (=> b!1226032 t!40484))

(declare-fun b_and!44203 () Bool)

(assert (= b_and!44201 (and (=> t!40484 result!23163) b_and!44203)))

(declare-fun m!1130645 () Bool)

(assert (=> b!1226030 m!1130645))

(declare-fun m!1130647 () Bool)

(assert (=> b!1226030 m!1130647))

(declare-fun m!1130649 () Bool)

(assert (=> mapNonEmpty!48673 m!1130649))

(declare-fun m!1130651 () Bool)

(assert (=> b!1226026 m!1130651))

(declare-fun m!1130653 () Bool)

(assert (=> b!1226026 m!1130653))

(assert (=> b!1226026 m!1130651))

(declare-fun m!1130655 () Bool)

(assert (=> b!1226026 m!1130655))

(declare-fun m!1130657 () Bool)

(assert (=> b!1226026 m!1130657))

(declare-fun m!1130659 () Bool)

(assert (=> b!1226026 m!1130659))

(declare-fun m!1130661 () Bool)

(assert (=> b!1226026 m!1130661))

(assert (=> b!1226026 m!1130659))

(declare-fun m!1130663 () Bool)

(assert (=> b!1226025 m!1130663))

(declare-fun m!1130665 () Bool)

(assert (=> start!101784 m!1130665))

(declare-fun m!1130667 () Bool)

(assert (=> start!101784 m!1130667))

(declare-fun m!1130669 () Bool)

(assert (=> b!1226023 m!1130669))

(declare-fun m!1130671 () Bool)

(assert (=> b!1226038 m!1130671))

(declare-fun m!1130673 () Bool)

(assert (=> b!1226036 m!1130673))

(declare-fun m!1130675 () Bool)

(assert (=> b!1226029 m!1130675))

(declare-fun m!1130677 () Bool)

(assert (=> b!1226024 m!1130677))

(declare-fun m!1130679 () Bool)

(assert (=> b!1226035 m!1130679))

(declare-fun m!1130681 () Bool)

(assert (=> b!1226032 m!1130681))

(declare-fun m!1130683 () Bool)

(assert (=> b!1226032 m!1130683))

(declare-fun m!1130685 () Bool)

(assert (=> b!1226032 m!1130685))

(declare-fun m!1130687 () Bool)

(assert (=> b!1226032 m!1130687))

(declare-fun m!1130689 () Bool)

(assert (=> b!1226027 m!1130689))

(declare-fun m!1130691 () Bool)

(assert (=> b!1226027 m!1130691))

(check-sat (not b!1226025) (not b!1226038) b_and!44203 (not b!1226032) (not b!1226024) (not b!1226027) (not b!1226029) (not b!1226023) (not mapNonEmpty!48673) (not b!1226026) (not b!1226036) (not b!1226030) (not b_lambda!22449) tp_is_empty!31183 (not b_next!26479) (not start!101784))
(check-sat b_and!44203 (not b_next!26479))
(get-model)

(declare-fun b_lambda!22455 () Bool)

(assert (= b_lambda!22449 (or (and start!101784 b_free!26479) b_lambda!22455)))

(check-sat (not b!1226025) (not b!1226038) b_and!44203 (not b_lambda!22455) (not b!1226032) (not b!1226024) tp_is_empty!31183 (not b!1226027) (not b!1226029) (not b!1226023) (not mapNonEmpty!48673) (not b!1226026) (not b!1226036) (not b!1226030) (not b_next!26479) (not start!101784))
(check-sat b_and!44203 (not b_next!26479))
(get-model)

(declare-fun d!133855 () Bool)

(assert (=> d!133855 (= (array_inv!29144 _keys!1208) (bvsge (size!38697 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101784 d!133855))

(declare-fun d!133857 () Bool)

(assert (=> d!133857 (= (array_inv!29145 _values!996) (bvsge (size!38698 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101784 d!133857))

(declare-fun d!133859 () Bool)

(assert (=> d!133859 (= (validKeyInArray!0 (select (arr!38159 _keys!1208) from!1455)) (and (not (= (select (arr!38159 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38159 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226026 d!133859))

(declare-fun b!1226165 () Bool)

(declare-fun e!696376 () ListLongMap!18223)

(assert (=> b!1226165 (= e!696376 (ListLongMap!18224 Nil!27032))))

(declare-fun b!1226166 () Bool)

(declare-fun lt!558582 () Unit!40485)

(declare-fun lt!558586 () Unit!40485)

(assert (=> b!1226166 (= lt!558582 lt!558586)))

(declare-fun lt!558583 () ListLongMap!18223)

(declare-fun lt!558580 () V!46705)

(declare-fun lt!558581 () (_ BitVec 64))

(declare-fun lt!558584 () (_ BitVec 64))

(declare-fun contains!7009 (ListLongMap!18223 (_ BitVec 64)) Bool)

(declare-fun +!4179 (ListLongMap!18223 tuple2!20254) ListLongMap!18223)

(assert (=> b!1226166 (not (contains!7009 (+!4179 lt!558583 (tuple2!20255 lt!558581 lt!558580)) lt!558584))))

(declare-fun addStillNotContains!307 (ListLongMap!18223 (_ BitVec 64) V!46705 (_ BitVec 64)) Unit!40485)

(assert (=> b!1226166 (= lt!558586 (addStillNotContains!307 lt!558583 lt!558581 lt!558580 lt!558584))))

(assert (=> b!1226166 (= lt!558584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19512 (ValueCell!14882 V!46705) V!46705)

(assert (=> b!1226166 (= lt!558580 (get!19512 (select (arr!38160 lt!558524) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226166 (= lt!558581 (select (arr!38159 lt!558528) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60751 () ListLongMap!18223)

(assert (=> b!1226166 (= lt!558583 call!60751)))

(declare-fun e!696378 () ListLongMap!18223)

(assert (=> b!1226166 (= e!696378 (+!4179 call!60751 (tuple2!20255 (select (arr!38159 lt!558528) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19512 (select (arr!38160 lt!558524) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226167 () Bool)

(declare-fun e!696377 () Bool)

(declare-fun e!696382 () Bool)

(assert (=> b!1226167 (= e!696377 e!696382)))

(assert (=> b!1226167 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 lt!558528)))))

(declare-fun lt!558585 () ListLongMap!18223)

(declare-fun res!814926 () Bool)

(assert (=> b!1226167 (= res!814926 (contains!7009 lt!558585 (select (arr!38159 lt!558528) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226167 (=> (not res!814926) (not e!696382))))

(declare-fun b!1226168 () Bool)

(declare-fun e!696379 () Bool)

(assert (=> b!1226168 (= e!696377 e!696379)))

(declare-fun c!120489 () Bool)

(assert (=> b!1226168 (= c!120489 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 lt!558528)))))

(declare-fun bm!60748 () Bool)

(assert (=> bm!60748 (= call!60751 (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226170 () Bool)

(assert (=> b!1226170 (= e!696378 call!60751)))

(declare-fun b!1226171 () Bool)

(declare-fun isEmpty!1007 (ListLongMap!18223) Bool)

(assert (=> b!1226171 (= e!696379 (isEmpty!1007 lt!558585))))

(declare-fun b!1226172 () Bool)

(assert (=> b!1226172 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 lt!558528)))))

(assert (=> b!1226172 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38698 lt!558524)))))

(declare-fun apply!971 (ListLongMap!18223 (_ BitVec 64)) V!46705)

(assert (=> b!1226172 (= e!696382 (= (apply!971 lt!558585 (select (arr!38159 lt!558528) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19512 (select (arr!38160 lt!558524) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1226173 () Bool)

(assert (=> b!1226173 (= e!696376 e!696378)))

(declare-fun c!120488 () Bool)

(assert (=> b!1226173 (= c!120488 (validKeyInArray!0 (select (arr!38159 lt!558528) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1226174 () Bool)

(declare-fun e!696381 () Bool)

(assert (=> b!1226174 (= e!696381 (validKeyInArray!0 (select (arr!38159 lt!558528) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226174 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133861 () Bool)

(declare-fun e!696380 () Bool)

(assert (=> d!133861 e!696380))

(declare-fun res!814923 () Bool)

(assert (=> d!133861 (=> (not res!814923) (not e!696380))))

(assert (=> d!133861 (= res!814923 (not (contains!7009 lt!558585 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133861 (= lt!558585 e!696376)))

(declare-fun c!120490 () Bool)

(assert (=> d!133861 (= c!120490 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 lt!558528)))))

(assert (=> d!133861 (validMask!0 mask!1564)))

(assert (=> d!133861 (= (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!558585)))

(declare-fun b!1226169 () Bool)

(declare-fun res!814924 () Bool)

(assert (=> b!1226169 (=> (not res!814924) (not e!696380))))

(assert (=> b!1226169 (= res!814924 (not (contains!7009 lt!558585 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226175 () Bool)

(assert (=> b!1226175 (= e!696379 (= lt!558585 (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226176 () Bool)

(assert (=> b!1226176 (= e!696380 e!696377)))

(declare-fun c!120491 () Bool)

(assert (=> b!1226176 (= c!120491 e!696381)))

(declare-fun res!814925 () Bool)

(assert (=> b!1226176 (=> (not res!814925) (not e!696381))))

(assert (=> b!1226176 (= res!814925 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 lt!558528)))))

(assert (= (and d!133861 c!120490) b!1226165))

(assert (= (and d!133861 (not c!120490)) b!1226173))

(assert (= (and b!1226173 c!120488) b!1226166))

(assert (= (and b!1226173 (not c!120488)) b!1226170))

(assert (= (or b!1226166 b!1226170) bm!60748))

(assert (= (and d!133861 res!814923) b!1226169))

(assert (= (and b!1226169 res!814924) b!1226176))

(assert (= (and b!1226176 res!814925) b!1226174))

(assert (= (and b!1226176 c!120491) b!1226167))

(assert (= (and b!1226176 (not c!120491)) b!1226168))

(assert (= (and b!1226167 res!814926) b!1226172))

(assert (= (and b!1226168 c!120489) b!1226175))

(assert (= (and b!1226168 (not c!120489)) b!1226171))

(declare-fun b_lambda!22457 () Bool)

(assert (=> (not b_lambda!22457) (not b!1226166)))

(assert (=> b!1226166 t!40484))

(declare-fun b_and!44213 () Bool)

(assert (= b_and!44203 (and (=> t!40484 result!23163) b_and!44213)))

(declare-fun b_lambda!22459 () Bool)

(assert (=> (not b_lambda!22459) (not b!1226172)))

(assert (=> b!1226172 t!40484))

(declare-fun b_and!44215 () Bool)

(assert (= b_and!44213 (and (=> t!40484 result!23163) b_and!44215)))

(declare-fun m!1130789 () Bool)

(assert (=> b!1226169 m!1130789))

(declare-fun m!1130791 () Bool)

(assert (=> b!1226167 m!1130791))

(assert (=> b!1226167 m!1130791))

(declare-fun m!1130793 () Bool)

(assert (=> b!1226167 m!1130793))

(assert (=> b!1226173 m!1130791))

(assert (=> b!1226173 m!1130791))

(declare-fun m!1130795 () Bool)

(assert (=> b!1226173 m!1130795))

(declare-fun m!1130797 () Bool)

(assert (=> bm!60748 m!1130797))

(declare-fun m!1130799 () Bool)

(assert (=> b!1226171 m!1130799))

(assert (=> b!1226174 m!1130791))

(assert (=> b!1226174 m!1130791))

(assert (=> b!1226174 m!1130795))

(assert (=> b!1226172 m!1130791))

(assert (=> b!1226172 m!1130683))

(assert (=> b!1226172 m!1130791))

(declare-fun m!1130801 () Bool)

(assert (=> b!1226172 m!1130801))

(declare-fun m!1130803 () Bool)

(assert (=> b!1226172 m!1130803))

(assert (=> b!1226172 m!1130803))

(assert (=> b!1226172 m!1130683))

(declare-fun m!1130805 () Bool)

(assert (=> b!1226172 m!1130805))

(assert (=> b!1226175 m!1130797))

(declare-fun m!1130807 () Bool)

(assert (=> d!133861 m!1130807))

(assert (=> d!133861 m!1130677))

(declare-fun m!1130809 () Bool)

(assert (=> b!1226166 m!1130809))

(declare-fun m!1130811 () Bool)

(assert (=> b!1226166 m!1130811))

(assert (=> b!1226166 m!1130791))

(declare-fun m!1130813 () Bool)

(assert (=> b!1226166 m!1130813))

(assert (=> b!1226166 m!1130683))

(declare-fun m!1130815 () Bool)

(assert (=> b!1226166 m!1130815))

(assert (=> b!1226166 m!1130809))

(assert (=> b!1226166 m!1130803))

(assert (=> b!1226166 m!1130803))

(assert (=> b!1226166 m!1130683))

(assert (=> b!1226166 m!1130805))

(assert (=> b!1226026 d!133861))

(declare-fun call!60756 () ListLongMap!18223)

(declare-fun bm!60753 () Bool)

(assert (=> bm!60753 (= call!60756 (getCurrentListMapNoExtraKeys!5556 (array!79065 (store (arr!38159 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38697 _keys!1208)) (array!79067 (store (arr!38160 _values!996) i!673 (ValueCellFull!14882 (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38698 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226183 () Bool)

(declare-fun e!696387 () Bool)

(declare-fun call!60757 () ListLongMap!18223)

(assert (=> b!1226183 (= e!696387 (= call!60756 call!60757))))

(assert (=> b!1226183 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38698 _values!996)))))

(declare-fun b!1226184 () Bool)

(assert (=> b!1226184 (= e!696387 (= call!60756 (-!1942 call!60757 k0!934)))))

(assert (=> b!1226184 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38698 _values!996)))))

(declare-fun d!133863 () Bool)

(declare-fun e!696388 () Bool)

(assert (=> d!133863 e!696388))

(declare-fun res!814929 () Bool)

(assert (=> d!133863 (=> (not res!814929) (not e!696388))))

(assert (=> d!133863 (= res!814929 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38697 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38697 _keys!1208))))))))

(declare-fun lt!558589 () Unit!40485)

(declare-fun choose!1837 (array!79064 array!79066 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40485)

(assert (=> d!133863 (= lt!558589 (choose!1837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133863 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 _keys!1208)))))

(assert (=> d!133863 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!558589)))

(declare-fun bm!60754 () Bool)

(assert (=> bm!60754 (= call!60757 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226185 () Bool)

(assert (=> b!1226185 (= e!696388 e!696387)))

(declare-fun c!120494 () Bool)

(assert (=> b!1226185 (= c!120494 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!133863 res!814929) b!1226185))

(assert (= (and b!1226185 c!120494) b!1226184))

(assert (= (and b!1226185 (not c!120494)) b!1226183))

(assert (= (or b!1226184 b!1226183) bm!60754))

(assert (= (or b!1226184 b!1226183) bm!60753))

(declare-fun b_lambda!22461 () Bool)

(assert (=> (not b_lambda!22461) (not bm!60753)))

(assert (=> bm!60753 t!40484))

(declare-fun b_and!44217 () Bool)

(assert (= b_and!44215 (and (=> t!40484 result!23163) b_and!44217)))

(assert (=> bm!60753 m!1130691))

(assert (=> bm!60753 m!1130683))

(assert (=> bm!60753 m!1130685))

(declare-fun m!1130817 () Bool)

(assert (=> bm!60753 m!1130817))

(declare-fun m!1130819 () Bool)

(assert (=> b!1226184 m!1130819))

(declare-fun m!1130821 () Bool)

(assert (=> d!133863 m!1130821))

(assert (=> bm!60754 m!1130651))

(assert (=> b!1226026 d!133863))

(declare-fun b!1226186 () Bool)

(declare-fun e!696389 () ListLongMap!18223)

(assert (=> b!1226186 (= e!696389 (ListLongMap!18224 Nil!27032))))

(declare-fun b!1226187 () Bool)

(declare-fun lt!558592 () Unit!40485)

(declare-fun lt!558596 () Unit!40485)

(assert (=> b!1226187 (= lt!558592 lt!558596)))

(declare-fun lt!558593 () ListLongMap!18223)

(declare-fun lt!558590 () V!46705)

(declare-fun lt!558591 () (_ BitVec 64))

(declare-fun lt!558594 () (_ BitVec 64))

(assert (=> b!1226187 (not (contains!7009 (+!4179 lt!558593 (tuple2!20255 lt!558591 lt!558590)) lt!558594))))

(assert (=> b!1226187 (= lt!558596 (addStillNotContains!307 lt!558593 lt!558591 lt!558590 lt!558594))))

(assert (=> b!1226187 (= lt!558594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1226187 (= lt!558590 (get!19512 (select (arr!38160 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226187 (= lt!558591 (select (arr!38159 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60758 () ListLongMap!18223)

(assert (=> b!1226187 (= lt!558593 call!60758)))

(declare-fun e!696391 () ListLongMap!18223)

(assert (=> b!1226187 (= e!696391 (+!4179 call!60758 (tuple2!20255 (select (arr!38159 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19512 (select (arr!38160 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226188 () Bool)

(declare-fun e!696390 () Bool)

(declare-fun e!696395 () Bool)

(assert (=> b!1226188 (= e!696390 e!696395)))

(assert (=> b!1226188 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 _keys!1208)))))

(declare-fun lt!558595 () ListLongMap!18223)

(declare-fun res!814933 () Bool)

(assert (=> b!1226188 (= res!814933 (contains!7009 lt!558595 (select (arr!38159 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226188 (=> (not res!814933) (not e!696395))))

(declare-fun b!1226189 () Bool)

(declare-fun e!696392 () Bool)

(assert (=> b!1226189 (= e!696390 e!696392)))

(declare-fun c!120496 () Bool)

(assert (=> b!1226189 (= c!120496 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 _keys!1208)))))

(declare-fun bm!60755 () Bool)

(assert (=> bm!60755 (= call!60758 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226191 () Bool)

(assert (=> b!1226191 (= e!696391 call!60758)))

(declare-fun b!1226192 () Bool)

(assert (=> b!1226192 (= e!696392 (isEmpty!1007 lt!558595))))

(declare-fun b!1226193 () Bool)

(assert (=> b!1226193 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 _keys!1208)))))

(assert (=> b!1226193 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38698 _values!996)))))

(assert (=> b!1226193 (= e!696395 (= (apply!971 lt!558595 (select (arr!38159 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19512 (select (arr!38160 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1226194 () Bool)

(assert (=> b!1226194 (= e!696389 e!696391)))

(declare-fun c!120495 () Bool)

(assert (=> b!1226194 (= c!120495 (validKeyInArray!0 (select (arr!38159 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1226195 () Bool)

(declare-fun e!696394 () Bool)

(assert (=> b!1226195 (= e!696394 (validKeyInArray!0 (select (arr!38159 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226195 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133865 () Bool)

(declare-fun e!696393 () Bool)

(assert (=> d!133865 e!696393))

(declare-fun res!814930 () Bool)

(assert (=> d!133865 (=> (not res!814930) (not e!696393))))

(assert (=> d!133865 (= res!814930 (not (contains!7009 lt!558595 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133865 (= lt!558595 e!696389)))

(declare-fun c!120497 () Bool)

(assert (=> d!133865 (= c!120497 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 _keys!1208)))))

(assert (=> d!133865 (validMask!0 mask!1564)))

(assert (=> d!133865 (= (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!558595)))

(declare-fun b!1226190 () Bool)

(declare-fun res!814931 () Bool)

(assert (=> b!1226190 (=> (not res!814931) (not e!696393))))

(assert (=> b!1226190 (= res!814931 (not (contains!7009 lt!558595 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226196 () Bool)

(assert (=> b!1226196 (= e!696392 (= lt!558595 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226197 () Bool)

(assert (=> b!1226197 (= e!696393 e!696390)))

(declare-fun c!120498 () Bool)

(assert (=> b!1226197 (= c!120498 e!696394)))

(declare-fun res!814932 () Bool)

(assert (=> b!1226197 (=> (not res!814932) (not e!696394))))

(assert (=> b!1226197 (= res!814932 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38697 _keys!1208)))))

(assert (= (and d!133865 c!120497) b!1226186))

(assert (= (and d!133865 (not c!120497)) b!1226194))

(assert (= (and b!1226194 c!120495) b!1226187))

(assert (= (and b!1226194 (not c!120495)) b!1226191))

(assert (= (or b!1226187 b!1226191) bm!60755))

(assert (= (and d!133865 res!814930) b!1226190))

(assert (= (and b!1226190 res!814931) b!1226197))

(assert (= (and b!1226197 res!814932) b!1226195))

(assert (= (and b!1226197 c!120498) b!1226188))

(assert (= (and b!1226197 (not c!120498)) b!1226189))

(assert (= (and b!1226188 res!814933) b!1226193))

(assert (= (and b!1226189 c!120496) b!1226196))

(assert (= (and b!1226189 (not c!120496)) b!1226192))

(declare-fun b_lambda!22463 () Bool)

(assert (=> (not b_lambda!22463) (not b!1226187)))

(assert (=> b!1226187 t!40484))

(declare-fun b_and!44219 () Bool)

(assert (= b_and!44217 (and (=> t!40484 result!23163) b_and!44219)))

(declare-fun b_lambda!22465 () Bool)

(assert (=> (not b_lambda!22465) (not b!1226193)))

(assert (=> b!1226193 t!40484))

(declare-fun b_and!44221 () Bool)

(assert (= b_and!44219 (and (=> t!40484 result!23163) b_and!44221)))

(declare-fun m!1130823 () Bool)

(assert (=> b!1226190 m!1130823))

(declare-fun m!1130825 () Bool)

(assert (=> b!1226188 m!1130825))

(assert (=> b!1226188 m!1130825))

(declare-fun m!1130827 () Bool)

(assert (=> b!1226188 m!1130827))

(assert (=> b!1226194 m!1130825))

(assert (=> b!1226194 m!1130825))

(declare-fun m!1130829 () Bool)

(assert (=> b!1226194 m!1130829))

(declare-fun m!1130831 () Bool)

(assert (=> bm!60755 m!1130831))

(declare-fun m!1130833 () Bool)

(assert (=> b!1226192 m!1130833))

(assert (=> b!1226195 m!1130825))

(assert (=> b!1226195 m!1130825))

(assert (=> b!1226195 m!1130829))

(assert (=> b!1226193 m!1130825))

(assert (=> b!1226193 m!1130683))

(assert (=> b!1226193 m!1130825))

(declare-fun m!1130835 () Bool)

(assert (=> b!1226193 m!1130835))

(declare-fun m!1130837 () Bool)

(assert (=> b!1226193 m!1130837))

(assert (=> b!1226193 m!1130837))

(assert (=> b!1226193 m!1130683))

(declare-fun m!1130839 () Bool)

(assert (=> b!1226193 m!1130839))

(assert (=> b!1226196 m!1130831))

(declare-fun m!1130841 () Bool)

(assert (=> d!133865 m!1130841))

(assert (=> d!133865 m!1130677))

(declare-fun m!1130843 () Bool)

(assert (=> b!1226187 m!1130843))

(declare-fun m!1130845 () Bool)

(assert (=> b!1226187 m!1130845))

(assert (=> b!1226187 m!1130825))

(declare-fun m!1130847 () Bool)

(assert (=> b!1226187 m!1130847))

(assert (=> b!1226187 m!1130683))

(declare-fun m!1130849 () Bool)

(assert (=> b!1226187 m!1130849))

(assert (=> b!1226187 m!1130843))

(assert (=> b!1226187 m!1130837))

(assert (=> b!1226187 m!1130837))

(assert (=> b!1226187 m!1130683))

(assert (=> b!1226187 m!1130839))

(assert (=> b!1226026 d!133865))

(declare-fun d!133867 () Bool)

(declare-fun lt!558599 () ListLongMap!18223)

(assert (=> d!133867 (not (contains!7009 lt!558599 k0!934))))

(declare-fun removeStrictlySorted!111 (List!27035 (_ BitVec 64)) List!27035)

(assert (=> d!133867 (= lt!558599 (ListLongMap!18224 (removeStrictlySorted!111 (toList!9127 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934)))))

(assert (=> d!133867 (= (-!1942 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934) lt!558599)))

(declare-fun bs!34435 () Bool)

(assert (= bs!34435 d!133867))

(declare-fun m!1130851 () Bool)

(assert (=> bs!34435 m!1130851))

(declare-fun m!1130853 () Bool)

(assert (=> bs!34435 m!1130853))

(assert (=> b!1226026 d!133867))

(declare-fun d!133869 () Bool)

(assert (=> d!133869 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1226024 d!133869))

(declare-fun b!1226209 () Bool)

(declare-fun e!696407 () Bool)

(declare-fun call!60761 () Bool)

(assert (=> b!1226209 (= e!696407 call!60761)))

(declare-fun b!1226210 () Bool)

(declare-fun e!696406 () Bool)

(declare-fun e!696404 () Bool)

(assert (=> b!1226210 (= e!696406 e!696404)))

(declare-fun res!814942 () Bool)

(assert (=> b!1226210 (=> (not res!814942) (not e!696404))))

(declare-fun e!696405 () Bool)

(assert (=> b!1226210 (= res!814942 (not e!696405))))

(declare-fun res!814941 () Bool)

(assert (=> b!1226210 (=> (not res!814941) (not e!696405))))

(assert (=> b!1226210 (= res!814941 (validKeyInArray!0 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1226211 () Bool)

(assert (=> b!1226211 (= e!696404 e!696407)))

(declare-fun c!120501 () Bool)

(assert (=> b!1226211 (= c!120501 (validKeyInArray!0 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1226212 () Bool)

(assert (=> b!1226212 (= e!696407 call!60761)))

(declare-fun bm!60758 () Bool)

(assert (=> bm!60758 (= call!60761 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120501 (Cons!27032 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000) Nil!27033) Nil!27033)))))

(declare-fun d!133871 () Bool)

(declare-fun res!814940 () Bool)

(assert (=> d!133871 (=> res!814940 e!696406)))

(assert (=> d!133871 (= res!814940 (bvsge #b00000000000000000000000000000000 (size!38697 _keys!1208)))))

(assert (=> d!133871 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27033) e!696406)))

(declare-fun b!1226208 () Bool)

(declare-fun contains!7010 (List!27036 (_ BitVec 64)) Bool)

(assert (=> b!1226208 (= e!696405 (contains!7010 Nil!27033 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133871 (not res!814940)) b!1226210))

(assert (= (and b!1226210 res!814941) b!1226208))

(assert (= (and b!1226210 res!814942) b!1226211))

(assert (= (and b!1226211 c!120501) b!1226212))

(assert (= (and b!1226211 (not c!120501)) b!1226209))

(assert (= (or b!1226212 b!1226209) bm!60758))

(declare-fun m!1130855 () Bool)

(assert (=> b!1226210 m!1130855))

(assert (=> b!1226210 m!1130855))

(declare-fun m!1130857 () Bool)

(assert (=> b!1226210 m!1130857))

(assert (=> b!1226211 m!1130855))

(assert (=> b!1226211 m!1130855))

(assert (=> b!1226211 m!1130857))

(assert (=> bm!60758 m!1130855))

(declare-fun m!1130859 () Bool)

(assert (=> bm!60758 m!1130859))

(assert (=> b!1226208 m!1130855))

(assert (=> b!1226208 m!1130855))

(declare-fun m!1130861 () Bool)

(assert (=> b!1226208 m!1130861))

(assert (=> b!1226038 d!133871))

(declare-fun d!133873 () Bool)

(declare-fun res!814947 () Bool)

(declare-fun e!696412 () Bool)

(assert (=> d!133873 (=> res!814947 e!696412)))

(assert (=> d!133873 (= res!814947 (= (select (arr!38159 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133873 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!696412)))

(declare-fun b!1226217 () Bool)

(declare-fun e!696413 () Bool)

(assert (=> b!1226217 (= e!696412 e!696413)))

(declare-fun res!814948 () Bool)

(assert (=> b!1226217 (=> (not res!814948) (not e!696413))))

(assert (=> b!1226217 (= res!814948 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38697 _keys!1208)))))

(declare-fun b!1226218 () Bool)

(assert (=> b!1226218 (= e!696413 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133873 (not res!814947)) b!1226217))

(assert (= (and b!1226217 res!814948) b!1226218))

(assert (=> d!133873 m!1130855))

(declare-fun m!1130863 () Bool)

(assert (=> b!1226218 m!1130863))

(assert (=> b!1226030 d!133873))

(declare-fun d!133875 () Bool)

(assert (=> d!133875 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558602 () Unit!40485)

(declare-fun choose!13 (array!79064 (_ BitVec 64) (_ BitVec 32)) Unit!40485)

(assert (=> d!133875 (= lt!558602 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133875 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133875 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!558602)))

(declare-fun bs!34436 () Bool)

(assert (= bs!34436 d!133875))

(assert (=> bs!34436 m!1130645))

(declare-fun m!1130865 () Bool)

(assert (=> bs!34436 m!1130865))

(assert (=> b!1226030 d!133875))

(declare-fun d!133877 () Bool)

(declare-fun lt!558603 () ListLongMap!18223)

(assert (=> d!133877 (not (contains!7009 lt!558603 k0!934))))

(assert (=> d!133877 (= lt!558603 (ListLongMap!18224 (removeStrictlySorted!111 (toList!9127 lt!558527) k0!934)))))

(assert (=> d!133877 (= (-!1942 lt!558527 k0!934) lt!558603)))

(declare-fun bs!34437 () Bool)

(assert (= bs!34437 d!133877))

(declare-fun m!1130867 () Bool)

(assert (=> bs!34437 m!1130867))

(declare-fun m!1130869 () Bool)

(assert (=> bs!34437 m!1130869))

(assert (=> b!1226025 d!133877))

(declare-fun b!1226227 () Bool)

(declare-fun e!696421 () Bool)

(declare-fun e!696422 () Bool)

(assert (=> b!1226227 (= e!696421 e!696422)))

(declare-fun c!120504 () Bool)

(assert (=> b!1226227 (= c!120504 (validKeyInArray!0 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1226228 () Bool)

(declare-fun call!60764 () Bool)

(assert (=> b!1226228 (= e!696422 call!60764)))

(declare-fun b!1226229 () Bool)

(declare-fun e!696420 () Bool)

(assert (=> b!1226229 (= e!696422 e!696420)))

(declare-fun lt!558612 () (_ BitVec 64))

(assert (=> b!1226229 (= lt!558612 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!558611 () Unit!40485)

(assert (=> b!1226229 (= lt!558611 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!558612 #b00000000000000000000000000000000))))

(assert (=> b!1226229 (arrayContainsKey!0 _keys!1208 lt!558612 #b00000000000000000000000000000000)))

(declare-fun lt!558610 () Unit!40485)

(assert (=> b!1226229 (= lt!558610 lt!558611)))

(declare-fun res!814953 () Bool)

(declare-datatypes ((SeekEntryResult!9950 0))(
  ( (MissingZero!9950 (index!42171 (_ BitVec 32))) (Found!9950 (index!42172 (_ BitVec 32))) (Intermediate!9950 (undefined!10762 Bool) (index!42173 (_ BitVec 32)) (x!107940 (_ BitVec 32))) (Undefined!9950) (MissingVacant!9950 (index!42174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!79064 (_ BitVec 32)) SeekEntryResult!9950)

(assert (=> b!1226229 (= res!814953 (= (seekEntryOrOpen!0 (select (arr!38159 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9950 #b00000000000000000000000000000000)))))

(assert (=> b!1226229 (=> (not res!814953) (not e!696420))))

(declare-fun d!133879 () Bool)

(declare-fun res!814954 () Bool)

(assert (=> d!133879 (=> res!814954 e!696421)))

(assert (=> d!133879 (= res!814954 (bvsge #b00000000000000000000000000000000 (size!38697 _keys!1208)))))

(assert (=> d!133879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!696421)))

(declare-fun b!1226230 () Bool)

(assert (=> b!1226230 (= e!696420 call!60764)))

(declare-fun bm!60761 () Bool)

(assert (=> bm!60761 (= call!60764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133879 (not res!814954)) b!1226227))

(assert (= (and b!1226227 c!120504) b!1226229))

(assert (= (and b!1226227 (not c!120504)) b!1226228))

(assert (= (and b!1226229 res!814953) b!1226230))

(assert (= (or b!1226230 b!1226228) bm!60761))

(assert (=> b!1226227 m!1130855))

(assert (=> b!1226227 m!1130855))

(assert (=> b!1226227 m!1130857))

(assert (=> b!1226229 m!1130855))

(declare-fun m!1130871 () Bool)

(assert (=> b!1226229 m!1130871))

(declare-fun m!1130873 () Bool)

(assert (=> b!1226229 m!1130873))

(assert (=> b!1226229 m!1130855))

(declare-fun m!1130875 () Bool)

(assert (=> b!1226229 m!1130875))

(declare-fun m!1130877 () Bool)

(assert (=> bm!60761 m!1130877))

(assert (=> b!1226023 d!133879))

(declare-fun d!133881 () Bool)

(assert (=> d!133881 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226029 d!133881))

(declare-fun b!1226231 () Bool)

(declare-fun e!696423 () ListLongMap!18223)

(assert (=> b!1226231 (= e!696423 (ListLongMap!18224 Nil!27032))))

(declare-fun b!1226232 () Bool)

(declare-fun lt!558615 () Unit!40485)

(declare-fun lt!558619 () Unit!40485)

(assert (=> b!1226232 (= lt!558615 lt!558619)))

(declare-fun lt!558613 () V!46705)

(declare-fun lt!558614 () (_ BitVec 64))

(declare-fun lt!558617 () (_ BitVec 64))

(declare-fun lt!558616 () ListLongMap!18223)

(assert (=> b!1226232 (not (contains!7009 (+!4179 lt!558616 (tuple2!20255 lt!558614 lt!558613)) lt!558617))))

(assert (=> b!1226232 (= lt!558619 (addStillNotContains!307 lt!558616 lt!558614 lt!558613 lt!558617))))

(assert (=> b!1226232 (= lt!558617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1226232 (= lt!558613 (get!19512 (select (arr!38160 lt!558524) from!1455) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226232 (= lt!558614 (select (arr!38159 lt!558528) from!1455))))

(declare-fun call!60765 () ListLongMap!18223)

(assert (=> b!1226232 (= lt!558616 call!60765)))

(declare-fun e!696425 () ListLongMap!18223)

(assert (=> b!1226232 (= e!696425 (+!4179 call!60765 (tuple2!20255 (select (arr!38159 lt!558528) from!1455) (get!19512 (select (arr!38160 lt!558524) from!1455) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226233 () Bool)

(declare-fun e!696424 () Bool)

(declare-fun e!696429 () Bool)

(assert (=> b!1226233 (= e!696424 e!696429)))

(assert (=> b!1226233 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38697 lt!558528)))))

(declare-fun lt!558618 () ListLongMap!18223)

(declare-fun res!814958 () Bool)

(assert (=> b!1226233 (= res!814958 (contains!7009 lt!558618 (select (arr!38159 lt!558528) from!1455)))))

(assert (=> b!1226233 (=> (not res!814958) (not e!696429))))

(declare-fun b!1226234 () Bool)

(declare-fun e!696426 () Bool)

(assert (=> b!1226234 (= e!696424 e!696426)))

(declare-fun c!120506 () Bool)

(assert (=> b!1226234 (= c!120506 (bvslt from!1455 (size!38697 lt!558528)))))

(declare-fun bm!60762 () Bool)

(assert (=> bm!60762 (= call!60765 (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226236 () Bool)

(assert (=> b!1226236 (= e!696425 call!60765)))

(declare-fun b!1226237 () Bool)

(assert (=> b!1226237 (= e!696426 (isEmpty!1007 lt!558618))))

(declare-fun b!1226238 () Bool)

(assert (=> b!1226238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38697 lt!558528)))))

(assert (=> b!1226238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38698 lt!558524)))))

(assert (=> b!1226238 (= e!696429 (= (apply!971 lt!558618 (select (arr!38159 lt!558528) from!1455)) (get!19512 (select (arr!38160 lt!558524) from!1455) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1226239 () Bool)

(assert (=> b!1226239 (= e!696423 e!696425)))

(declare-fun c!120505 () Bool)

(assert (=> b!1226239 (= c!120505 (validKeyInArray!0 (select (arr!38159 lt!558528) from!1455)))))

(declare-fun b!1226240 () Bool)

(declare-fun e!696428 () Bool)

(assert (=> b!1226240 (= e!696428 (validKeyInArray!0 (select (arr!38159 lt!558528) from!1455)))))

(assert (=> b!1226240 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133883 () Bool)

(declare-fun e!696427 () Bool)

(assert (=> d!133883 e!696427))

(declare-fun res!814955 () Bool)

(assert (=> d!133883 (=> (not res!814955) (not e!696427))))

(assert (=> d!133883 (= res!814955 (not (contains!7009 lt!558618 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133883 (= lt!558618 e!696423)))

(declare-fun c!120507 () Bool)

(assert (=> d!133883 (= c!120507 (bvsge from!1455 (size!38697 lt!558528)))))

(assert (=> d!133883 (validMask!0 mask!1564)))

(assert (=> d!133883 (= (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!558618)))

(declare-fun b!1226235 () Bool)

(declare-fun res!814956 () Bool)

(assert (=> b!1226235 (=> (not res!814956) (not e!696427))))

(assert (=> b!1226235 (= res!814956 (not (contains!7009 lt!558618 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226241 () Bool)

(assert (=> b!1226241 (= e!696426 (= lt!558618 (getCurrentListMapNoExtraKeys!5556 lt!558528 lt!558524 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226242 () Bool)

(assert (=> b!1226242 (= e!696427 e!696424)))

(declare-fun c!120508 () Bool)

(assert (=> b!1226242 (= c!120508 e!696428)))

(declare-fun res!814957 () Bool)

(assert (=> b!1226242 (=> (not res!814957) (not e!696428))))

(assert (=> b!1226242 (= res!814957 (bvslt from!1455 (size!38697 lt!558528)))))

(assert (= (and d!133883 c!120507) b!1226231))

(assert (= (and d!133883 (not c!120507)) b!1226239))

(assert (= (and b!1226239 c!120505) b!1226232))

(assert (= (and b!1226239 (not c!120505)) b!1226236))

(assert (= (or b!1226232 b!1226236) bm!60762))

(assert (= (and d!133883 res!814955) b!1226235))

(assert (= (and b!1226235 res!814956) b!1226242))

(assert (= (and b!1226242 res!814957) b!1226240))

(assert (= (and b!1226242 c!120508) b!1226233))

(assert (= (and b!1226242 (not c!120508)) b!1226234))

(assert (= (and b!1226233 res!814958) b!1226238))

(assert (= (and b!1226234 c!120506) b!1226241))

(assert (= (and b!1226234 (not c!120506)) b!1226237))

(declare-fun b_lambda!22467 () Bool)

(assert (=> (not b_lambda!22467) (not b!1226232)))

(assert (=> b!1226232 t!40484))

(declare-fun b_and!44223 () Bool)

(assert (= b_and!44221 (and (=> t!40484 result!23163) b_and!44223)))

(declare-fun b_lambda!22469 () Bool)

(assert (=> (not b_lambda!22469) (not b!1226238)))

(assert (=> b!1226238 t!40484))

(declare-fun b_and!44225 () Bool)

(assert (= b_and!44223 (and (=> t!40484 result!23163) b_and!44225)))

(declare-fun m!1130879 () Bool)

(assert (=> b!1226235 m!1130879))

(declare-fun m!1130881 () Bool)

(assert (=> b!1226233 m!1130881))

(assert (=> b!1226233 m!1130881))

(declare-fun m!1130883 () Bool)

(assert (=> b!1226233 m!1130883))

(assert (=> b!1226239 m!1130881))

(assert (=> b!1226239 m!1130881))

(declare-fun m!1130885 () Bool)

(assert (=> b!1226239 m!1130885))

(declare-fun m!1130887 () Bool)

(assert (=> bm!60762 m!1130887))

(declare-fun m!1130889 () Bool)

(assert (=> b!1226237 m!1130889))

(assert (=> b!1226240 m!1130881))

(assert (=> b!1226240 m!1130881))

(assert (=> b!1226240 m!1130885))

(assert (=> b!1226238 m!1130881))

(assert (=> b!1226238 m!1130683))

(assert (=> b!1226238 m!1130881))

(declare-fun m!1130891 () Bool)

(assert (=> b!1226238 m!1130891))

(declare-fun m!1130893 () Bool)

(assert (=> b!1226238 m!1130893))

(assert (=> b!1226238 m!1130893))

(assert (=> b!1226238 m!1130683))

(declare-fun m!1130895 () Bool)

(assert (=> b!1226238 m!1130895))

(assert (=> b!1226241 m!1130887))

(declare-fun m!1130897 () Bool)

(assert (=> d!133883 m!1130897))

(assert (=> d!133883 m!1130677))

(declare-fun m!1130899 () Bool)

(assert (=> b!1226232 m!1130899))

(declare-fun m!1130901 () Bool)

(assert (=> b!1226232 m!1130901))

(assert (=> b!1226232 m!1130881))

(declare-fun m!1130903 () Bool)

(assert (=> b!1226232 m!1130903))

(assert (=> b!1226232 m!1130683))

(declare-fun m!1130905 () Bool)

(assert (=> b!1226232 m!1130905))

(assert (=> b!1226232 m!1130899))

(assert (=> b!1226232 m!1130893))

(assert (=> b!1226232 m!1130893))

(assert (=> b!1226232 m!1130683))

(assert (=> b!1226232 m!1130895))

(assert (=> b!1226032 d!133883))

(declare-fun b!1226243 () Bool)

(declare-fun e!696430 () ListLongMap!18223)

(assert (=> b!1226243 (= e!696430 (ListLongMap!18224 Nil!27032))))

(declare-fun b!1226244 () Bool)

(declare-fun lt!558622 () Unit!40485)

(declare-fun lt!558626 () Unit!40485)

(assert (=> b!1226244 (= lt!558622 lt!558626)))

(declare-fun lt!558620 () V!46705)

(declare-fun lt!558624 () (_ BitVec 64))

(declare-fun lt!558623 () ListLongMap!18223)

(declare-fun lt!558621 () (_ BitVec 64))

(assert (=> b!1226244 (not (contains!7009 (+!4179 lt!558623 (tuple2!20255 lt!558621 lt!558620)) lt!558624))))

(assert (=> b!1226244 (= lt!558626 (addStillNotContains!307 lt!558623 lt!558621 lt!558620 lt!558624))))

(assert (=> b!1226244 (= lt!558624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1226244 (= lt!558620 (get!19512 (select (arr!38160 _values!996) from!1455) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226244 (= lt!558621 (select (arr!38159 _keys!1208) from!1455))))

(declare-fun call!60766 () ListLongMap!18223)

(assert (=> b!1226244 (= lt!558623 call!60766)))

(declare-fun e!696432 () ListLongMap!18223)

(assert (=> b!1226244 (= e!696432 (+!4179 call!60766 (tuple2!20255 (select (arr!38159 _keys!1208) from!1455) (get!19512 (select (arr!38160 _values!996) from!1455) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226245 () Bool)

(declare-fun e!696431 () Bool)

(declare-fun e!696436 () Bool)

(assert (=> b!1226245 (= e!696431 e!696436)))

(assert (=> b!1226245 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38697 _keys!1208)))))

(declare-fun res!814962 () Bool)

(declare-fun lt!558625 () ListLongMap!18223)

(assert (=> b!1226245 (= res!814962 (contains!7009 lt!558625 (select (arr!38159 _keys!1208) from!1455)))))

(assert (=> b!1226245 (=> (not res!814962) (not e!696436))))

(declare-fun b!1226246 () Bool)

(declare-fun e!696433 () Bool)

(assert (=> b!1226246 (= e!696431 e!696433)))

(declare-fun c!120510 () Bool)

(assert (=> b!1226246 (= c!120510 (bvslt from!1455 (size!38697 _keys!1208)))))

(declare-fun bm!60763 () Bool)

(assert (=> bm!60763 (= call!60766 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226248 () Bool)

(assert (=> b!1226248 (= e!696432 call!60766)))

(declare-fun b!1226249 () Bool)

(assert (=> b!1226249 (= e!696433 (isEmpty!1007 lt!558625))))

(declare-fun b!1226250 () Bool)

(assert (=> b!1226250 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38697 _keys!1208)))))

(assert (=> b!1226250 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38698 _values!996)))))

(assert (=> b!1226250 (= e!696436 (= (apply!971 lt!558625 (select (arr!38159 _keys!1208) from!1455)) (get!19512 (select (arr!38160 _values!996) from!1455) (dynLambda!3400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1226251 () Bool)

(assert (=> b!1226251 (= e!696430 e!696432)))

(declare-fun c!120509 () Bool)

(assert (=> b!1226251 (= c!120509 (validKeyInArray!0 (select (arr!38159 _keys!1208) from!1455)))))

(declare-fun b!1226252 () Bool)

(declare-fun e!696435 () Bool)

(assert (=> b!1226252 (= e!696435 (validKeyInArray!0 (select (arr!38159 _keys!1208) from!1455)))))

(assert (=> b!1226252 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133885 () Bool)

(declare-fun e!696434 () Bool)

(assert (=> d!133885 e!696434))

(declare-fun res!814959 () Bool)

(assert (=> d!133885 (=> (not res!814959) (not e!696434))))

(assert (=> d!133885 (= res!814959 (not (contains!7009 lt!558625 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133885 (= lt!558625 e!696430)))

(declare-fun c!120511 () Bool)

(assert (=> d!133885 (= c!120511 (bvsge from!1455 (size!38697 _keys!1208)))))

(assert (=> d!133885 (validMask!0 mask!1564)))

(assert (=> d!133885 (= (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!558625)))

(declare-fun b!1226247 () Bool)

(declare-fun res!814960 () Bool)

(assert (=> b!1226247 (=> (not res!814960) (not e!696434))))

(assert (=> b!1226247 (= res!814960 (not (contains!7009 lt!558625 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226253 () Bool)

(assert (=> b!1226253 (= e!696433 (= lt!558625 (getCurrentListMapNoExtraKeys!5556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226254 () Bool)

(assert (=> b!1226254 (= e!696434 e!696431)))

(declare-fun c!120512 () Bool)

(assert (=> b!1226254 (= c!120512 e!696435)))

(declare-fun res!814961 () Bool)

(assert (=> b!1226254 (=> (not res!814961) (not e!696435))))

(assert (=> b!1226254 (= res!814961 (bvslt from!1455 (size!38697 _keys!1208)))))

(assert (= (and d!133885 c!120511) b!1226243))

(assert (= (and d!133885 (not c!120511)) b!1226251))

(assert (= (and b!1226251 c!120509) b!1226244))

(assert (= (and b!1226251 (not c!120509)) b!1226248))

(assert (= (or b!1226244 b!1226248) bm!60763))

(assert (= (and d!133885 res!814959) b!1226247))

(assert (= (and b!1226247 res!814960) b!1226254))

(assert (= (and b!1226254 res!814961) b!1226252))

(assert (= (and b!1226254 c!120512) b!1226245))

(assert (= (and b!1226254 (not c!120512)) b!1226246))

(assert (= (and b!1226245 res!814962) b!1226250))

(assert (= (and b!1226246 c!120510) b!1226253))

(assert (= (and b!1226246 (not c!120510)) b!1226249))

(declare-fun b_lambda!22471 () Bool)

(assert (=> (not b_lambda!22471) (not b!1226244)))

(assert (=> b!1226244 t!40484))

(declare-fun b_and!44227 () Bool)

(assert (= b_and!44225 (and (=> t!40484 result!23163) b_and!44227)))

(declare-fun b_lambda!22473 () Bool)

(assert (=> (not b_lambda!22473) (not b!1226250)))

(assert (=> b!1226250 t!40484))

(declare-fun b_and!44229 () Bool)

(assert (= b_and!44227 (and (=> t!40484 result!23163) b_and!44229)))

(declare-fun m!1130907 () Bool)

(assert (=> b!1226247 m!1130907))

(assert (=> b!1226245 m!1130659))

(assert (=> b!1226245 m!1130659))

(declare-fun m!1130909 () Bool)

(assert (=> b!1226245 m!1130909))

(assert (=> b!1226251 m!1130659))

(assert (=> b!1226251 m!1130659))

(assert (=> b!1226251 m!1130661))

(declare-fun m!1130911 () Bool)

(assert (=> bm!60763 m!1130911))

(declare-fun m!1130913 () Bool)

(assert (=> b!1226249 m!1130913))

(assert (=> b!1226252 m!1130659))

(assert (=> b!1226252 m!1130659))

(assert (=> b!1226252 m!1130661))

(assert (=> b!1226250 m!1130659))

(assert (=> b!1226250 m!1130683))

(assert (=> b!1226250 m!1130659))

(declare-fun m!1130915 () Bool)

(assert (=> b!1226250 m!1130915))

(declare-fun m!1130917 () Bool)

(assert (=> b!1226250 m!1130917))

(assert (=> b!1226250 m!1130917))

(assert (=> b!1226250 m!1130683))

(declare-fun m!1130919 () Bool)

(assert (=> b!1226250 m!1130919))

(assert (=> b!1226253 m!1130911))

(declare-fun m!1130921 () Bool)

(assert (=> d!133885 m!1130921))

(assert (=> d!133885 m!1130677))

(declare-fun m!1130923 () Bool)

(assert (=> b!1226244 m!1130923))

(declare-fun m!1130925 () Bool)

(assert (=> b!1226244 m!1130925))

(assert (=> b!1226244 m!1130659))

(declare-fun m!1130927 () Bool)

(assert (=> b!1226244 m!1130927))

(assert (=> b!1226244 m!1130683))

(declare-fun m!1130929 () Bool)

(assert (=> b!1226244 m!1130929))

(assert (=> b!1226244 m!1130923))

(assert (=> b!1226244 m!1130917))

(assert (=> b!1226244 m!1130917))

(assert (=> b!1226244 m!1130683))

(assert (=> b!1226244 m!1130919))

(assert (=> b!1226032 d!133885))

(declare-fun b!1226255 () Bool)

(declare-fun e!696438 () Bool)

(declare-fun e!696439 () Bool)

(assert (=> b!1226255 (= e!696438 e!696439)))

(declare-fun c!120513 () Bool)

(assert (=> b!1226255 (= c!120513 (validKeyInArray!0 (select (arr!38159 lt!558528) #b00000000000000000000000000000000)))))

(declare-fun b!1226256 () Bool)

(declare-fun call!60767 () Bool)

(assert (=> b!1226256 (= e!696439 call!60767)))

(declare-fun b!1226257 () Bool)

(declare-fun e!696437 () Bool)

(assert (=> b!1226257 (= e!696439 e!696437)))

(declare-fun lt!558629 () (_ BitVec 64))

(assert (=> b!1226257 (= lt!558629 (select (arr!38159 lt!558528) #b00000000000000000000000000000000))))

(declare-fun lt!558628 () Unit!40485)

(assert (=> b!1226257 (= lt!558628 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!558528 lt!558629 #b00000000000000000000000000000000))))

(assert (=> b!1226257 (arrayContainsKey!0 lt!558528 lt!558629 #b00000000000000000000000000000000)))

(declare-fun lt!558627 () Unit!40485)

(assert (=> b!1226257 (= lt!558627 lt!558628)))

(declare-fun res!814963 () Bool)

(assert (=> b!1226257 (= res!814963 (= (seekEntryOrOpen!0 (select (arr!38159 lt!558528) #b00000000000000000000000000000000) lt!558528 mask!1564) (Found!9950 #b00000000000000000000000000000000)))))

(assert (=> b!1226257 (=> (not res!814963) (not e!696437))))

(declare-fun d!133887 () Bool)

(declare-fun res!814964 () Bool)

(assert (=> d!133887 (=> res!814964 e!696438)))

(assert (=> d!133887 (= res!814964 (bvsge #b00000000000000000000000000000000 (size!38697 lt!558528)))))

(assert (=> d!133887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558528 mask!1564) e!696438)))

(declare-fun b!1226258 () Bool)

(assert (=> b!1226258 (= e!696437 call!60767)))

(declare-fun bm!60764 () Bool)

(assert (=> bm!60764 (= call!60767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!558528 mask!1564))))

(assert (= (and d!133887 (not res!814964)) b!1226255))

(assert (= (and b!1226255 c!120513) b!1226257))

(assert (= (and b!1226255 (not c!120513)) b!1226256))

(assert (= (and b!1226257 res!814963) b!1226258))

(assert (= (or b!1226258 b!1226256) bm!60764))

(declare-fun m!1130931 () Bool)

(assert (=> b!1226255 m!1130931))

(assert (=> b!1226255 m!1130931))

(declare-fun m!1130933 () Bool)

(assert (=> b!1226255 m!1130933))

(assert (=> b!1226257 m!1130931))

(declare-fun m!1130935 () Bool)

(assert (=> b!1226257 m!1130935))

(declare-fun m!1130937 () Bool)

(assert (=> b!1226257 m!1130937))

(assert (=> b!1226257 m!1130931))

(declare-fun m!1130939 () Bool)

(assert (=> b!1226257 m!1130939))

(declare-fun m!1130941 () Bool)

(assert (=> bm!60764 m!1130941))

(assert (=> b!1226027 d!133887))

(declare-fun b!1226260 () Bool)

(declare-fun e!696443 () Bool)

(declare-fun call!60768 () Bool)

(assert (=> b!1226260 (= e!696443 call!60768)))

(declare-fun b!1226261 () Bool)

(declare-fun e!696442 () Bool)

(declare-fun e!696440 () Bool)

(assert (=> b!1226261 (= e!696442 e!696440)))

(declare-fun res!814967 () Bool)

(assert (=> b!1226261 (=> (not res!814967) (not e!696440))))

(declare-fun e!696441 () Bool)

(assert (=> b!1226261 (= res!814967 (not e!696441))))

(declare-fun res!814966 () Bool)

(assert (=> b!1226261 (=> (not res!814966) (not e!696441))))

(assert (=> b!1226261 (= res!814966 (validKeyInArray!0 (select (arr!38159 lt!558528) #b00000000000000000000000000000000)))))

(declare-fun b!1226262 () Bool)

(assert (=> b!1226262 (= e!696440 e!696443)))

(declare-fun c!120514 () Bool)

(assert (=> b!1226262 (= c!120514 (validKeyInArray!0 (select (arr!38159 lt!558528) #b00000000000000000000000000000000)))))

(declare-fun b!1226263 () Bool)

(assert (=> b!1226263 (= e!696443 call!60768)))

(declare-fun bm!60765 () Bool)

(assert (=> bm!60765 (= call!60768 (arrayNoDuplicates!0 lt!558528 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120514 (Cons!27032 (select (arr!38159 lt!558528) #b00000000000000000000000000000000) Nil!27033) Nil!27033)))))

(declare-fun d!133889 () Bool)

(declare-fun res!814965 () Bool)

(assert (=> d!133889 (=> res!814965 e!696442)))

(assert (=> d!133889 (= res!814965 (bvsge #b00000000000000000000000000000000 (size!38697 lt!558528)))))

(assert (=> d!133889 (= (arrayNoDuplicates!0 lt!558528 #b00000000000000000000000000000000 Nil!27033) e!696442)))

(declare-fun b!1226259 () Bool)

(assert (=> b!1226259 (= e!696441 (contains!7010 Nil!27033 (select (arr!38159 lt!558528) #b00000000000000000000000000000000)))))

(assert (= (and d!133889 (not res!814965)) b!1226261))

(assert (= (and b!1226261 res!814966) b!1226259))

(assert (= (and b!1226261 res!814967) b!1226262))

(assert (= (and b!1226262 c!120514) b!1226263))

(assert (= (and b!1226262 (not c!120514)) b!1226260))

(assert (= (or b!1226263 b!1226260) bm!60765))

(assert (=> b!1226261 m!1130931))

(assert (=> b!1226261 m!1130931))

(assert (=> b!1226261 m!1130933))

(assert (=> b!1226262 m!1130931))

(assert (=> b!1226262 m!1130931))

(assert (=> b!1226262 m!1130933))

(assert (=> bm!60765 m!1130931))

(declare-fun m!1130943 () Bool)

(assert (=> bm!60765 m!1130943))

(assert (=> b!1226259 m!1130931))

(assert (=> b!1226259 m!1130931))

(declare-fun m!1130945 () Bool)

(assert (=> b!1226259 m!1130945))

(assert (=> b!1226036 d!133889))

(declare-fun mapNonEmpty!48682 () Bool)

(declare-fun mapRes!48682 () Bool)

(declare-fun tp!92498 () Bool)

(declare-fun e!696448 () Bool)

(assert (=> mapNonEmpty!48682 (= mapRes!48682 (and tp!92498 e!696448))))

(declare-fun mapRest!48682 () (Array (_ BitVec 32) ValueCell!14882))

(declare-fun mapValue!48682 () ValueCell!14882)

(declare-fun mapKey!48682 () (_ BitVec 32))

(assert (=> mapNonEmpty!48682 (= mapRest!48673 (store mapRest!48682 mapKey!48682 mapValue!48682))))

(declare-fun mapIsEmpty!48682 () Bool)

(assert (=> mapIsEmpty!48682 mapRes!48682))

(declare-fun b!1226271 () Bool)

(declare-fun e!696449 () Bool)

(assert (=> b!1226271 (= e!696449 tp_is_empty!31183)))

(declare-fun b!1226270 () Bool)

(assert (=> b!1226270 (= e!696448 tp_is_empty!31183)))

(declare-fun condMapEmpty!48682 () Bool)

(declare-fun mapDefault!48682 () ValueCell!14882)

(assert (=> mapNonEmpty!48673 (= condMapEmpty!48682 (= mapRest!48673 ((as const (Array (_ BitVec 32) ValueCell!14882)) mapDefault!48682)))))

(assert (=> mapNonEmpty!48673 (= tp!92483 (and e!696449 mapRes!48682))))

(assert (= (and mapNonEmpty!48673 condMapEmpty!48682) mapIsEmpty!48682))

(assert (= (and mapNonEmpty!48673 (not condMapEmpty!48682)) mapNonEmpty!48682))

(assert (= (and mapNonEmpty!48682 ((_ is ValueCellFull!14882) mapValue!48682)) b!1226270))

(assert (= (and mapNonEmpty!48673 ((_ is ValueCellFull!14882) mapDefault!48682)) b!1226271))

(declare-fun m!1130947 () Bool)

(assert (=> mapNonEmpty!48682 m!1130947))

(declare-fun b_lambda!22475 () Bool)

(assert (= b_lambda!22467 (or (and start!101784 b_free!26479) b_lambda!22475)))

(declare-fun b_lambda!22477 () Bool)

(assert (= b_lambda!22461 (or (and start!101784 b_free!26479) b_lambda!22477)))

(declare-fun b_lambda!22479 () Bool)

(assert (= b_lambda!22459 (or (and start!101784 b_free!26479) b_lambda!22479)))

(declare-fun b_lambda!22481 () Bool)

(assert (= b_lambda!22469 (or (and start!101784 b_free!26479) b_lambda!22481)))

(declare-fun b_lambda!22483 () Bool)

(assert (= b_lambda!22463 (or (and start!101784 b_free!26479) b_lambda!22483)))

(declare-fun b_lambda!22485 () Bool)

(assert (= b_lambda!22473 (or (and start!101784 b_free!26479) b_lambda!22485)))

(declare-fun b_lambda!22487 () Bool)

(assert (= b_lambda!22457 (or (and start!101784 b_free!26479) b_lambda!22487)))

(declare-fun b_lambda!22489 () Bool)

(assert (= b_lambda!22465 (or (and start!101784 b_free!26479) b_lambda!22489)))

(declare-fun b_lambda!22491 () Bool)

(assert (= b_lambda!22471 (or (and start!101784 b_free!26479) b_lambda!22491)))

(check-sat (not b!1226255) (not bm!60754) (not b!1226233) (not b!1226173) (not d!133867) (not b!1226241) (not b!1226252) (not b_lambda!22479) (not b!1226193) (not mapNonEmpty!48682) (not b!1226238) (not b!1226259) (not b!1226227) (not b_lambda!22487) (not bm!60765) (not b_lambda!22477) (not b!1226261) (not b!1226192) (not bm!60762) (not b!1226251) (not b!1226194) (not b!1226188) (not b!1226184) (not b!1226166) (not d!133877) (not b_lambda!22483) (not b_lambda!22485) (not d!133885) (not b!1226171) (not b_lambda!22489) (not bm!60763) (not b_lambda!22455) (not b!1226262) (not bm!60761) (not b!1226196) (not b!1226237) (not b_lambda!22491) (not b!1226195) tp_is_empty!31183 (not b!1226250) (not b!1226249) (not b!1226174) (not bm!60755) (not b!1226218) (not b!1226245) (not b!1226244) (not d!133861) (not d!133863) (not b!1226232) (not b!1226239) b_and!44229 (not b!1226235) (not b!1226229) (not b!1226175) (not b!1226253) (not d!133875) (not bm!60764) (not b!1226208) (not b_next!26479) (not b!1226247) (not b!1226240) (not b!1226190) (not b!1226167) (not b!1226210) (not bm!60748) (not d!133883) (not b!1226257) (not b_lambda!22481) (not bm!60753) (not d!133865) (not bm!60758) (not b!1226187) (not b!1226172) (not b!1226169) (not b_lambda!22475) (not b!1226211))
(check-sat b_and!44229 (not b_next!26479))
