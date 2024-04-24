; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101136 () Bool)

(assert start!101136)

(declare-fun b_free!25969 () Bool)

(declare-fun b_next!25969 () Bool)

(assert (=> start!101136 (= b_free!25969 (not b_next!25969))))

(declare-fun tp!90916 () Bool)

(declare-fun b_and!42985 () Bool)

(assert (=> start!101136 (= tp!90916 b_and!42985)))

(declare-datatypes ((V!46025 0))(
  ( (V!46026 (val!15393 Int)) )
))
(declare-fun zeroValue!944 () V!46025)

(declare-fun c!119198 () Bool)

(declare-datatypes ((Unit!40005 0))(
  ( (Unit!40006) )
))
(declare-fun call!59095 () Unit!40005)

(declare-fun c!119197 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!46025)

(declare-fun bm!59089 () Bool)

(declare-datatypes ((tuple2!19768 0))(
  ( (tuple2!19769 (_1!9895 (_ BitVec 64)) (_2!9895 V!46025)) )
))
(declare-datatypes ((List!26575 0))(
  ( (Nil!26572) (Cons!26571 (h!27789 tuple2!19768) (t!39516 List!26575)) )
))
(declare-datatypes ((ListLongMap!17745 0))(
  ( (ListLongMap!17746 (toList!8888 List!26575)) )
))
(declare-fun lt!548637 () ListLongMap!17745)

(declare-fun lt!548647 () ListLongMap!17745)

(declare-fun addStillContains!1034 (ListLongMap!17745 (_ BitVec 64) V!46025 (_ BitVec 64)) Unit!40005)

(assert (=> bm!59089 (= call!59095 (addStillContains!1034 (ite c!119197 lt!548637 lt!548647) (ite c!119197 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119198 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119197 minValue!944 (ite c!119198 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209238 () Bool)

(declare-fun e!686858 () Bool)

(declare-datatypes ((array!78163 0))(
  ( (array!78164 (arr!37714 (Array (_ BitVec 32) (_ BitVec 64))) (size!38251 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78163)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1209238 (= e!686858 (or (bvsge (size!38251 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)) (bvslt from!1455 (size!38251 _keys!1208))))))

(declare-datatypes ((List!26576 0))(
  ( (Nil!26573) (Cons!26572 (h!27790 (_ BitVec 64)) (t!39517 List!26576)) )
))
(declare-fun arrayNoDuplicates!0 (array!78163 (_ BitVec 32) List!26576) Bool)

(assert (=> b!1209238 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26573)))

(declare-fun lt!548644 () Unit!40005)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78163 (_ BitVec 32) (_ BitVec 32)) Unit!40005)

(assert (=> b!1209238 (= lt!548644 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686860 () Bool)

(assert (=> b!1209238 e!686860))

(declare-fun res!803524 () Bool)

(assert (=> b!1209238 (=> (not res!803524) (not e!686860))))

(declare-fun e!686862 () Bool)

(assert (=> b!1209238 (= res!803524 e!686862)))

(declare-fun c!119196 () Bool)

(assert (=> b!1209238 (= c!119196 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!548650 () Unit!40005)

(declare-datatypes ((ValueCell!14627 0))(
  ( (ValueCellFull!14627 (v!18037 V!46025)) (EmptyCell!14627) )
))
(declare-datatypes ((array!78165 0))(
  ( (array!78166 (arr!37715 (Array (_ BitVec 32) ValueCell!14627)) (size!38252 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78165)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!587 (array!78163 array!78165 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 64) (_ BitVec 32) Int) Unit!40005)

(assert (=> b!1209238 (= lt!548650 (lemmaListMapContainsThenArrayContainsFrom!587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548639 () Unit!40005)

(declare-fun e!686854 () Unit!40005)

(assert (=> b!1209238 (= lt!548639 e!686854)))

(declare-fun lt!548645 () Bool)

(assert (=> b!1209238 (= c!119197 (and (not lt!548645) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209238 (= lt!548645 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209239 () Bool)

(declare-fun res!803534 () Bool)

(declare-fun e!686853 () Bool)

(assert (=> b!1209239 (=> (not res!803534) (not e!686853))))

(assert (=> b!1209239 (= res!803534 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26573))))

(declare-fun b!1209240 () Bool)

(declare-fun res!803529 () Bool)

(assert (=> b!1209240 (=> (not res!803529) (not e!686853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78163 (_ BitVec 32)) Bool)

(assert (=> b!1209240 (= res!803529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47872 () Bool)

(declare-fun mapRes!47872 () Bool)

(declare-fun tp!90917 () Bool)

(declare-fun e!686857 () Bool)

(assert (=> mapNonEmpty!47872 (= mapRes!47872 (and tp!90917 e!686857))))

(declare-fun mapRest!47872 () (Array (_ BitVec 32) ValueCell!14627))

(declare-fun mapKey!47872 () (_ BitVec 32))

(declare-fun mapValue!47872 () ValueCell!14627)

(assert (=> mapNonEmpty!47872 (= (arr!37715 _values!996) (store mapRest!47872 mapKey!47872 mapValue!47872))))

(declare-fun b!1209242 () Bool)

(declare-fun res!803528 () Bool)

(declare-fun e!686848 () Bool)

(assert (=> b!1209242 (=> (not res!803528) (not e!686848))))

(declare-fun lt!548638 () array!78163)

(assert (=> b!1209242 (= res!803528 (arrayNoDuplicates!0 lt!548638 #b00000000000000000000000000000000 Nil!26573))))

(declare-fun b!1209243 () Bool)

(declare-fun res!803535 () Bool)

(assert (=> b!1209243 (=> (not res!803535) (not e!686853))))

(assert (=> b!1209243 (= res!803535 (and (= (size!38252 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38251 _keys!1208) (size!38252 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!59090 () Bool)

(declare-fun call!59096 () Bool)

(declare-fun call!59097 () Bool)

(assert (=> bm!59090 (= call!59096 call!59097)))

(declare-fun b!1209244 () Bool)

(assert (=> b!1209244 (= e!686853 e!686848)))

(declare-fun res!803526 () Bool)

(assert (=> b!1209244 (=> (not res!803526) (not e!686848))))

(assert (=> b!1209244 (= res!803526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548638 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209244 (= lt!548638 (array!78164 (store (arr!37714 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38251 _keys!1208)))))

(declare-fun b!1209245 () Bool)

(declare-fun c!119195 () Bool)

(assert (=> b!1209245 (= c!119195 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548645))))

(declare-fun e!686851 () Unit!40005)

(declare-fun e!686861 () Unit!40005)

(assert (=> b!1209245 (= e!686851 e!686861)))

(declare-fun b!1209246 () Bool)

(declare-fun e!686859 () Bool)

(declare-fun e!686852 () Bool)

(assert (=> b!1209246 (= e!686859 (and e!686852 mapRes!47872))))

(declare-fun condMapEmpty!47872 () Bool)

(declare-fun mapDefault!47872 () ValueCell!14627)

(assert (=> b!1209246 (= condMapEmpty!47872 (= (arr!37715 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14627)) mapDefault!47872)))))

(declare-fun b!1209247 () Bool)

(declare-fun tp_is_empty!30673 () Bool)

(assert (=> b!1209247 (= e!686852 tp_is_empty!30673)))

(declare-fun b!1209248 () Bool)

(declare-fun lt!548635 () Unit!40005)

(assert (=> b!1209248 (= e!686854 lt!548635)))

(declare-fun lt!548641 () Unit!40005)

(assert (=> b!1209248 (= lt!548641 (addStillContains!1034 lt!548647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!59099 () ListLongMap!17745)

(assert (=> b!1209248 (= lt!548637 call!59099)))

(assert (=> b!1209248 call!59097))

(assert (=> b!1209248 (= lt!548635 call!59095)))

(declare-fun contains!6971 (ListLongMap!17745 (_ BitVec 64)) Bool)

(declare-fun +!4050 (ListLongMap!17745 tuple2!19768) ListLongMap!17745)

(assert (=> b!1209248 (contains!6971 (+!4050 lt!548637 (tuple2!19769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun mapIsEmpty!47872 () Bool)

(assert (=> mapIsEmpty!47872 mapRes!47872))

(declare-fun bm!59091 () Bool)

(declare-fun call!59093 () ListLongMap!17745)

(assert (=> bm!59091 (= call!59097 (contains!6971 (ite c!119197 lt!548637 call!59093) k0!934))))

(declare-fun b!1209249 () Bool)

(assert (=> b!1209249 call!59096))

(declare-fun lt!548636 () Unit!40005)

(declare-fun call!59092 () Unit!40005)

(assert (=> b!1209249 (= lt!548636 call!59092)))

(assert (=> b!1209249 (= e!686851 lt!548636)))

(declare-fun bm!59092 () Bool)

(assert (=> bm!59092 (= call!59093 call!59099)))

(declare-fun bm!59093 () Bool)

(assert (=> bm!59093 (= call!59092 call!59095)))

(declare-fun b!1209250 () Bool)

(declare-fun res!803533 () Bool)

(assert (=> b!1209250 (=> (not res!803533) (not e!686853))))

(assert (=> b!1209250 (= res!803533 (= (select (arr!37714 _keys!1208) i!673) k0!934))))

(declare-fun b!1209251 () Bool)

(declare-fun Unit!40007 () Unit!40005)

(assert (=> b!1209251 (= e!686861 Unit!40007)))

(declare-fun b!1209252 () Bool)

(declare-fun e!686850 () Bool)

(declare-fun call!59098 () ListLongMap!17745)

(declare-fun call!59094 () ListLongMap!17745)

(assert (=> b!1209252 (= e!686850 (= call!59098 call!59094))))

(declare-fun b!1209253 () Bool)

(declare-fun arrayContainsKey!0 (array!78163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209253 (= e!686860 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59094 () Bool)

(declare-fun lt!548646 () array!78165)

(declare-fun getCurrentListMapNoExtraKeys!5350 (array!78163 array!78165 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 32) Int) ListLongMap!17745)

(assert (=> bm!59094 (= call!59098 (getCurrentListMapNoExtraKeys!5350 lt!548638 lt!548646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209254 () Bool)

(declare-fun res!803537 () Bool)

(assert (=> b!1209254 (=> (not res!803537) (not e!686853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209254 (= res!803537 (validMask!0 mask!1564))))

(declare-fun res!803536 () Bool)

(assert (=> start!101136 (=> (not res!803536) (not e!686853))))

(assert (=> start!101136 (= res!803536 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38251 _keys!1208))))))

(assert (=> start!101136 e!686853))

(assert (=> start!101136 tp_is_empty!30673))

(declare-fun array_inv!28794 (array!78163) Bool)

(assert (=> start!101136 (array_inv!28794 _keys!1208)))

(assert (=> start!101136 true))

(assert (=> start!101136 tp!90916))

(declare-fun array_inv!28795 (array!78165) Bool)

(assert (=> start!101136 (and (array_inv!28795 _values!996) e!686859)))

(declare-fun b!1209241 () Bool)

(declare-fun e!686847 () Bool)

(assert (=> b!1209241 (= e!686848 (not e!686847))))

(declare-fun res!803532 () Bool)

(assert (=> b!1209241 (=> res!803532 e!686847)))

(assert (=> b!1209241 (= res!803532 (bvsgt from!1455 i!673))))

(assert (=> b!1209241 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548643 () Unit!40005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78163 (_ BitVec 64) (_ BitVec 32)) Unit!40005)

(assert (=> b!1209241 (= lt!548643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209255 () Bool)

(declare-fun e!686856 () Bool)

(assert (=> b!1209255 (= e!686856 e!686858)))

(declare-fun res!803525 () Bool)

(assert (=> b!1209255 (=> res!803525 e!686858)))

(assert (=> b!1209255 (= res!803525 (not (contains!6971 lt!548647 k0!934)))))

(assert (=> b!1209255 (= lt!548647 (getCurrentListMapNoExtraKeys!5350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209256 () Bool)

(assert (=> b!1209256 (= e!686857 tp_is_empty!30673)))

(declare-fun b!1209257 () Bool)

(declare-fun -!1824 (ListLongMap!17745 (_ BitVec 64)) ListLongMap!17745)

(assert (=> b!1209257 (= e!686850 (= call!59098 (-!1824 call!59094 k0!934)))))

(declare-fun b!1209258 () Bool)

(assert (=> b!1209258 (= e!686862 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548645) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!59095 () Bool)

(assert (=> bm!59095 (= call!59099 (+!4050 lt!548647 (ite (or c!119197 c!119198) (tuple2!19769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!59096 () Bool)

(assert (=> bm!59096 (= call!59094 (getCurrentListMapNoExtraKeys!5350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209259 () Bool)

(declare-fun lt!548642 () Unit!40005)

(assert (=> b!1209259 (= e!686861 lt!548642)))

(assert (=> b!1209259 (= lt!548642 call!59092)))

(assert (=> b!1209259 call!59096))

(declare-fun b!1209260 () Bool)

(assert (=> b!1209260 (= e!686862 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209261 () Bool)

(declare-fun e!686855 () Bool)

(assert (=> b!1209261 (= e!686855 e!686856)))

(declare-fun res!803530 () Bool)

(assert (=> b!1209261 (=> res!803530 e!686856)))

(assert (=> b!1209261 (= res!803530 (not (= (select (arr!37714 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1209261 e!686850))

(declare-fun c!119199 () Bool)

(assert (=> b!1209261 (= c!119199 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548640 () Unit!40005)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 (array!78163 array!78165 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40005)

(assert (=> b!1209261 (= lt!548640 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209262 () Bool)

(assert (=> b!1209262 (= e!686854 e!686851)))

(assert (=> b!1209262 (= c!119198 (and (not lt!548645) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1209263 () Bool)

(declare-fun res!803531 () Bool)

(assert (=> b!1209263 (=> (not res!803531) (not e!686853))))

(assert (=> b!1209263 (= res!803531 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38251 _keys!1208))))))

(declare-fun b!1209264 () Bool)

(assert (=> b!1209264 (= e!686847 e!686855)))

(declare-fun res!803527 () Bool)

(assert (=> b!1209264 (=> res!803527 e!686855)))

(assert (=> b!1209264 (= res!803527 (not (= from!1455 i!673)))))

(declare-fun lt!548648 () ListLongMap!17745)

(assert (=> b!1209264 (= lt!548648 (getCurrentListMapNoExtraKeys!5350 lt!548638 lt!548646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3270 (Int (_ BitVec 64)) V!46025)

(assert (=> b!1209264 (= lt!548646 (array!78166 (store (arr!37715 _values!996) i!673 (ValueCellFull!14627 (dynLambda!3270 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38252 _values!996)))))

(declare-fun lt!548649 () ListLongMap!17745)

(assert (=> b!1209264 (= lt!548649 (getCurrentListMapNoExtraKeys!5350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1209265 () Bool)

(declare-fun res!803523 () Bool)

(assert (=> b!1209265 (=> (not res!803523) (not e!686853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209265 (= res!803523 (validKeyInArray!0 k0!934))))

(assert (= (and start!101136 res!803536) b!1209254))

(assert (= (and b!1209254 res!803537) b!1209243))

(assert (= (and b!1209243 res!803535) b!1209240))

(assert (= (and b!1209240 res!803529) b!1209239))

(assert (= (and b!1209239 res!803534) b!1209263))

(assert (= (and b!1209263 res!803531) b!1209265))

(assert (= (and b!1209265 res!803523) b!1209250))

(assert (= (and b!1209250 res!803533) b!1209244))

(assert (= (and b!1209244 res!803526) b!1209242))

(assert (= (and b!1209242 res!803528) b!1209241))

(assert (= (and b!1209241 (not res!803532)) b!1209264))

(assert (= (and b!1209264 (not res!803527)) b!1209261))

(assert (= (and b!1209261 c!119199) b!1209257))

(assert (= (and b!1209261 (not c!119199)) b!1209252))

(assert (= (or b!1209257 b!1209252) bm!59094))

(assert (= (or b!1209257 b!1209252) bm!59096))

(assert (= (and b!1209261 (not res!803530)) b!1209255))

(assert (= (and b!1209255 (not res!803525)) b!1209238))

(assert (= (and b!1209238 c!119197) b!1209248))

(assert (= (and b!1209238 (not c!119197)) b!1209262))

(assert (= (and b!1209262 c!119198) b!1209249))

(assert (= (and b!1209262 (not c!119198)) b!1209245))

(assert (= (and b!1209245 c!119195) b!1209259))

(assert (= (and b!1209245 (not c!119195)) b!1209251))

(assert (= (or b!1209249 b!1209259) bm!59093))

(assert (= (or b!1209249 b!1209259) bm!59092))

(assert (= (or b!1209249 b!1209259) bm!59090))

(assert (= (or b!1209248 bm!59090) bm!59091))

(assert (= (or b!1209248 bm!59093) bm!59089))

(assert (= (or b!1209248 bm!59092) bm!59095))

(assert (= (and b!1209238 c!119196) b!1209260))

(assert (= (and b!1209238 (not c!119196)) b!1209258))

(assert (= (and b!1209238 res!803524) b!1209253))

(assert (= (and b!1209246 condMapEmpty!47872) mapIsEmpty!47872))

(assert (= (and b!1209246 (not condMapEmpty!47872)) mapNonEmpty!47872))

(get-info :version)

(assert (= (and mapNonEmpty!47872 ((_ is ValueCellFull!14627) mapValue!47872)) b!1209256))

(assert (= (and b!1209246 ((_ is ValueCellFull!14627) mapDefault!47872)) b!1209247))

(assert (= start!101136 b!1209246))

(declare-fun b_lambda!21487 () Bool)

(assert (=> (not b_lambda!21487) (not b!1209264)))

(declare-fun t!39515 () Bool)

(declare-fun tb!10761 () Bool)

(assert (=> (and start!101136 (= defaultEntry!1004 defaultEntry!1004) t!39515) tb!10761))

(declare-fun result!22119 () Bool)

(assert (=> tb!10761 (= result!22119 tp_is_empty!30673)))

(assert (=> b!1209264 t!39515))

(declare-fun b_and!42987 () Bool)

(assert (= b_and!42985 (and (=> t!39515 result!22119) b_and!42987)))

(declare-fun m!1115403 () Bool)

(assert (=> b!1209253 m!1115403))

(declare-fun m!1115405 () Bool)

(assert (=> b!1209254 m!1115405))

(declare-fun m!1115407 () Bool)

(assert (=> bm!59096 m!1115407))

(declare-fun m!1115409 () Bool)

(assert (=> b!1209250 m!1115409))

(declare-fun m!1115411 () Bool)

(assert (=> bm!59094 m!1115411))

(declare-fun m!1115413 () Bool)

(assert (=> b!1209242 m!1115413))

(declare-fun m!1115415 () Bool)

(assert (=> b!1209241 m!1115415))

(declare-fun m!1115417 () Bool)

(assert (=> b!1209241 m!1115417))

(declare-fun m!1115419 () Bool)

(assert (=> b!1209248 m!1115419))

(declare-fun m!1115421 () Bool)

(assert (=> b!1209248 m!1115421))

(assert (=> b!1209248 m!1115421))

(declare-fun m!1115423 () Bool)

(assert (=> b!1209248 m!1115423))

(declare-fun m!1115425 () Bool)

(assert (=> b!1209257 m!1115425))

(declare-fun m!1115427 () Bool)

(assert (=> b!1209239 m!1115427))

(declare-fun m!1115429 () Bool)

(assert (=> b!1209264 m!1115429))

(declare-fun m!1115431 () Bool)

(assert (=> b!1209264 m!1115431))

(declare-fun m!1115433 () Bool)

(assert (=> b!1209264 m!1115433))

(declare-fun m!1115435 () Bool)

(assert (=> b!1209264 m!1115435))

(assert (=> b!1209260 m!1115403))

(declare-fun m!1115437 () Bool)

(assert (=> bm!59089 m!1115437))

(declare-fun m!1115439 () Bool)

(assert (=> mapNonEmpty!47872 m!1115439))

(declare-fun m!1115441 () Bool)

(assert (=> bm!59091 m!1115441))

(declare-fun m!1115443 () Bool)

(assert (=> start!101136 m!1115443))

(declare-fun m!1115445 () Bool)

(assert (=> start!101136 m!1115445))

(declare-fun m!1115447 () Bool)

(assert (=> b!1209244 m!1115447))

(declare-fun m!1115449 () Bool)

(assert (=> b!1209244 m!1115449))

(declare-fun m!1115451 () Bool)

(assert (=> b!1209261 m!1115451))

(declare-fun m!1115453 () Bool)

(assert (=> b!1209261 m!1115453))

(declare-fun m!1115455 () Bool)

(assert (=> b!1209240 m!1115455))

(declare-fun m!1115457 () Bool)

(assert (=> b!1209255 m!1115457))

(assert (=> b!1209255 m!1115407))

(declare-fun m!1115459 () Bool)

(assert (=> bm!59095 m!1115459))

(declare-fun m!1115461 () Bool)

(assert (=> b!1209265 m!1115461))

(declare-fun m!1115463 () Bool)

(assert (=> b!1209238 m!1115463))

(declare-fun m!1115465 () Bool)

(assert (=> b!1209238 m!1115465))

(declare-fun m!1115467 () Bool)

(assert (=> b!1209238 m!1115467))

(check-sat (not b!1209241) (not start!101136) (not b!1209261) (not b_next!25969) (not b!1209257) tp_is_empty!30673 (not bm!59091) (not bm!59096) (not mapNonEmpty!47872) (not b!1209239) (not b!1209242) (not b_lambda!21487) (not b!1209260) (not b!1209244) (not bm!59095) (not b!1209238) (not b!1209240) (not bm!59089) (not b!1209264) (not b!1209248) (not b!1209254) (not b!1209255) (not b!1209265) (not bm!59094) (not b!1209253) b_and!42987)
(check-sat b_and!42987 (not b_next!25969))
