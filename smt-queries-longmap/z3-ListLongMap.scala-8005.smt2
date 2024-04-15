; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98864 () Bool)

(assert start!98864)

(declare-fun b_free!24475 () Bool)

(declare-fun b_next!24475 () Bool)

(assert (=> start!98864 (= b_free!24475 (not b_next!24475))))

(declare-fun tp!86135 () Bool)

(declare-fun b_and!39777 () Bool)

(assert (=> start!98864 (= tp!86135 b_and!39777)))

(declare-fun b!1156738 () Bool)

(declare-fun res!768300 () Bool)

(declare-fun e!657834 () Bool)

(assert (=> b!1156738 (=> (not res!768300) (not e!657834))))

(declare-datatypes ((array!74772 0))(
  ( (array!74773 (arr!36037 (Array (_ BitVec 32) (_ BitVec 64))) (size!36575 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74772)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1156738 (= res!768300 (= (select (arr!36037 _keys!1208) i!673) k0!934))))

(declare-fun b!1156739 () Bool)

(declare-fun e!657832 () Bool)

(declare-fun e!657820 () Bool)

(assert (=> b!1156739 (= e!657832 (not e!657820))))

(declare-fun res!768293 () Bool)

(assert (=> b!1156739 (=> res!768293 e!657820)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1156739 (= res!768293 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156739 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37949 0))(
  ( (Unit!37950) )
))
(declare-fun lt!519219 () Unit!37949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74772 (_ BitVec 64) (_ BitVec 32)) Unit!37949)

(assert (=> b!1156739 (= lt!519219 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!43801 0))(
  ( (V!43802 (val!14559 Int)) )
))
(declare-fun zeroValue!944 () V!43801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!55216 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13793 0))(
  ( (ValueCellFull!13793 (v!17195 V!43801)) (EmptyCell!13793) )
))
(declare-datatypes ((array!74774 0))(
  ( (array!74775 (arr!36038 (Array (_ BitVec 32) ValueCell!13793)) (size!36576 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74774)

(declare-fun minValue!944 () V!43801)

(declare-datatypes ((tuple2!18602 0))(
  ( (tuple2!18603 (_1!9312 (_ BitVec 64)) (_2!9312 V!43801)) )
))
(declare-datatypes ((List!25330 0))(
  ( (Nil!25327) (Cons!25326 (h!26535 tuple2!18602) (t!36788 List!25330)) )
))
(declare-datatypes ((ListLongMap!16571 0))(
  ( (ListLongMap!16572 (toList!8301 List!25330)) )
))
(declare-fun call!55219 () ListLongMap!16571)

(declare-fun getCurrentListMapNoExtraKeys!4781 (array!74772 array!74774 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 32) Int) ListLongMap!16571)

(assert (=> bm!55216 (= call!55219 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156740 () Bool)

(declare-fun e!657829 () Unit!37949)

(declare-fun Unit!37951 () Unit!37949)

(assert (=> b!1156740 (= e!657829 Unit!37951)))

(declare-fun lt!519230 () Bool)

(assert (=> b!1156740 (= lt!519230 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115107 () Bool)

(assert (=> b!1156740 (= c!115107 (and (not lt!519230) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519221 () Unit!37949)

(declare-fun e!657826 () Unit!37949)

(assert (=> b!1156740 (= lt!519221 e!657826)))

(declare-fun lt!519220 () Unit!37949)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!503 (array!74772 array!74774 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 64) (_ BitVec 32) Int) Unit!37949)

(assert (=> b!1156740 (= lt!519220 (lemmaListMapContainsThenArrayContainsFrom!503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115108 () Bool)

(assert (=> b!1156740 (= c!115108 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768297 () Bool)

(declare-fun e!657827 () Bool)

(assert (=> b!1156740 (= res!768297 e!657827)))

(declare-fun e!657819 () Bool)

(assert (=> b!1156740 (=> (not res!768297) (not e!657819))))

(assert (=> b!1156740 e!657819))

(declare-fun lt!519217 () Unit!37949)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74772 (_ BitVec 32) (_ BitVec 32)) Unit!37949)

(assert (=> b!1156740 (= lt!519217 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25331 0))(
  ( (Nil!25328) (Cons!25327 (h!26536 (_ BitVec 64)) (t!36789 List!25331)) )
))
(declare-fun arrayNoDuplicates!0 (array!74772 (_ BitVec 32) List!25331) Bool)

(assert (=> b!1156740 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25328)))

(declare-fun lt!519232 () Unit!37949)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74772 (_ BitVec 64) (_ BitVec 32) List!25331) Unit!37949)

(assert (=> b!1156740 (= lt!519232 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25328))))

(assert (=> b!1156740 false))

(declare-fun b!1156741 () Bool)

(assert (=> b!1156741 (= e!657827 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!519226 () array!74772)

(declare-fun b!1156742 () Bool)

(declare-fun lt!519216 () array!74774)

(declare-fun e!657823 () Bool)

(declare-fun lt!519233 () ListLongMap!16571)

(assert (=> b!1156742 (= e!657823 (= lt!519233 (getCurrentListMapNoExtraKeys!4781 lt!519226 lt!519216 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156743 () Bool)

(declare-fun e!657825 () Bool)

(assert (=> b!1156743 (= e!657825 true)))

(assert (=> b!1156743 e!657823))

(declare-fun res!768295 () Bool)

(assert (=> b!1156743 (=> (not res!768295) (not e!657823))))

(declare-fun lt!519225 () ListLongMap!16571)

(assert (=> b!1156743 (= res!768295 (= lt!519233 lt!519225))))

(declare-fun lt!519228 () ListLongMap!16571)

(declare-fun -!1359 (ListLongMap!16571 (_ BitVec 64)) ListLongMap!16571)

(assert (=> b!1156743 (= lt!519233 (-!1359 lt!519228 k0!934))))

(declare-fun lt!519231 () V!43801)

(declare-fun +!3711 (ListLongMap!16571 tuple2!18602) ListLongMap!16571)

(assert (=> b!1156743 (= (-!1359 (+!3711 lt!519225 (tuple2!18603 (select (arr!36037 _keys!1208) from!1455) lt!519231)) (select (arr!36037 _keys!1208) from!1455)) lt!519225)))

(declare-fun lt!519227 () Unit!37949)

(declare-fun addThenRemoveForNewKeyIsSame!212 (ListLongMap!16571 (_ BitVec 64) V!43801) Unit!37949)

(assert (=> b!1156743 (= lt!519227 (addThenRemoveForNewKeyIsSame!212 lt!519225 (select (arr!36037 _keys!1208) from!1455) lt!519231))))

(declare-fun lt!519234 () V!43801)

(declare-fun get!18384 (ValueCell!13793 V!43801) V!43801)

(assert (=> b!1156743 (= lt!519231 (get!18384 (select (arr!36038 _values!996) from!1455) lt!519234))))

(declare-fun lt!519236 () Unit!37949)

(assert (=> b!1156743 (= lt!519236 e!657829)))

(declare-fun c!115111 () Bool)

(declare-fun contains!6753 (ListLongMap!16571 (_ BitVec 64)) Bool)

(assert (=> b!1156743 (= c!115111 (contains!6753 lt!519225 k0!934))))

(assert (=> b!1156743 (= lt!519225 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156744 () Bool)

(declare-fun e!657822 () Bool)

(declare-fun e!657828 () Bool)

(declare-fun mapRes!45332 () Bool)

(assert (=> b!1156744 (= e!657822 (and e!657828 mapRes!45332))))

(declare-fun condMapEmpty!45332 () Bool)

(declare-fun mapDefault!45332 () ValueCell!13793)

(assert (=> b!1156744 (= condMapEmpty!45332 (= (arr!36038 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13793)) mapDefault!45332)))))

(declare-fun c!115112 () Bool)

(declare-fun call!55223 () Unit!37949)

(declare-fun bm!55217 () Bool)

(declare-fun addStillContains!920 (ListLongMap!16571 (_ BitVec 64) V!43801 (_ BitVec 64)) Unit!37949)

(assert (=> bm!55217 (= call!55223 (addStillContains!920 lt!519225 (ite (or c!115107 c!115112) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115107 c!115112) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1156745 () Bool)

(declare-fun lt!519218 () ListLongMap!16571)

(assert (=> b!1156745 (contains!6753 (+!3711 lt!519218 (tuple2!18603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519235 () Unit!37949)

(assert (=> b!1156745 (= lt!519235 (addStillContains!920 lt!519218 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!55226 () Bool)

(assert (=> b!1156745 call!55226))

(declare-fun call!55220 () ListLongMap!16571)

(assert (=> b!1156745 (= lt!519218 call!55220)))

(declare-fun lt!519237 () Unit!37949)

(assert (=> b!1156745 (= lt!519237 call!55223)))

(assert (=> b!1156745 (= e!657826 lt!519235)))

(declare-fun b!1156746 () Bool)

(assert (=> b!1156746 (= e!657819 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156747 () Bool)

(declare-fun call!55221 () Bool)

(assert (=> b!1156747 call!55221))

(declare-fun lt!519229 () Unit!37949)

(declare-fun call!55222 () Unit!37949)

(assert (=> b!1156747 (= lt!519229 call!55222)))

(declare-fun e!657824 () Unit!37949)

(assert (=> b!1156747 (= e!657824 lt!519229)))

(declare-fun res!768301 () Bool)

(assert (=> start!98864 (=> (not res!768301) (not e!657834))))

(assert (=> start!98864 (= res!768301 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36575 _keys!1208))))))

(assert (=> start!98864 e!657834))

(declare-fun tp_is_empty!29005 () Bool)

(assert (=> start!98864 tp_is_empty!29005))

(declare-fun array_inv!27692 (array!74772) Bool)

(assert (=> start!98864 (array_inv!27692 _keys!1208)))

(assert (=> start!98864 true))

(assert (=> start!98864 tp!86135))

(declare-fun array_inv!27693 (array!74774) Bool)

(assert (=> start!98864 (and (array_inv!27693 _values!996) e!657822)))

(declare-fun call!55224 () ListLongMap!16571)

(declare-fun bm!55218 () Bool)

(assert (=> bm!55218 (= call!55224 (getCurrentListMapNoExtraKeys!4781 lt!519226 lt!519216 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156748 () Bool)

(declare-fun res!768290 () Bool)

(assert (=> b!1156748 (=> (not res!768290) (not e!657834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74772 (_ BitVec 32)) Bool)

(assert (=> b!1156748 (= res!768290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156749 () Bool)

(declare-fun Unit!37952 () Unit!37949)

(assert (=> b!1156749 (= e!657824 Unit!37952)))

(declare-fun mapNonEmpty!45332 () Bool)

(declare-fun tp!86136 () Bool)

(declare-fun e!657831 () Bool)

(assert (=> mapNonEmpty!45332 (= mapRes!45332 (and tp!86136 e!657831))))

(declare-fun mapKey!45332 () (_ BitVec 32))

(declare-fun mapValue!45332 () ValueCell!13793)

(declare-fun mapRest!45332 () (Array (_ BitVec 32) ValueCell!13793))

(assert (=> mapNonEmpty!45332 (= (arr!36038 _values!996) (store mapRest!45332 mapKey!45332 mapValue!45332))))

(declare-fun mapIsEmpty!45332 () Bool)

(assert (=> mapIsEmpty!45332 mapRes!45332))

(declare-fun b!1156750 () Bool)

(declare-fun e!657818 () Bool)

(assert (=> b!1156750 (= e!657820 e!657818)))

(declare-fun res!768296 () Bool)

(assert (=> b!1156750 (=> res!768296 e!657818)))

(assert (=> b!1156750 (= res!768296 (not (= from!1455 i!673)))))

(declare-fun lt!519222 () ListLongMap!16571)

(assert (=> b!1156750 (= lt!519222 (getCurrentListMapNoExtraKeys!4781 lt!519226 lt!519216 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1156750 (= lt!519216 (array!74775 (store (arr!36038 _values!996) i!673 (ValueCellFull!13793 lt!519234)) (size!36576 _values!996)))))

(declare-fun dynLambda!2736 (Int (_ BitVec 64)) V!43801)

(assert (=> b!1156750 (= lt!519234 (dynLambda!2736 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1156750 (= lt!519228 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156751 () Bool)

(declare-fun e!657833 () Unit!37949)

(assert (=> b!1156751 (= e!657833 e!657824)))

(declare-fun c!115110 () Bool)

(assert (=> b!1156751 (= c!115110 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519230))))

(declare-fun b!1156752 () Bool)

(declare-fun res!768289 () Bool)

(assert (=> b!1156752 (=> (not res!768289) (not e!657834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156752 (= res!768289 (validKeyInArray!0 k0!934))))

(declare-fun bm!55219 () Bool)

(declare-fun call!55225 () ListLongMap!16571)

(assert (=> bm!55219 (= call!55225 call!55220)))

(declare-fun b!1156753 () Bool)

(assert (=> b!1156753 (= e!657831 tp_is_empty!29005)))

(declare-fun b!1156754 () Bool)

(declare-fun res!768292 () Bool)

(assert (=> b!1156754 (=> (not res!768292) (not e!657834))))

(assert (=> b!1156754 (= res!768292 (and (= (size!36576 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36575 _keys!1208) (size!36576 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156755 () Bool)

(declare-fun res!768291 () Bool)

(assert (=> b!1156755 (=> (not res!768291) (not e!657832))))

(assert (=> b!1156755 (= res!768291 (arrayNoDuplicates!0 lt!519226 #b00000000000000000000000000000000 Nil!25328))))

(declare-fun b!1156756 () Bool)

(declare-fun e!657821 () Bool)

(assert (=> b!1156756 (= e!657821 (= call!55224 (-!1359 call!55219 k0!934)))))

(declare-fun bm!55220 () Bool)

(assert (=> bm!55220 (= call!55226 (contains!6753 (ite c!115107 lt!519218 call!55225) k0!934))))

(declare-fun b!1156757 () Bool)

(declare-fun res!768299 () Bool)

(assert (=> b!1156757 (=> (not res!768299) (not e!657834))))

(assert (=> b!1156757 (= res!768299 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25328))))

(declare-fun b!1156758 () Bool)

(assert (=> b!1156758 (= c!115112 (and (not lt!519230) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1156758 (= e!657826 e!657833)))

(declare-fun b!1156759 () Bool)

(assert (=> b!1156759 (= e!657821 (= call!55224 call!55219))))

(declare-fun b!1156760 () Bool)

(declare-fun res!768298 () Bool)

(assert (=> b!1156760 (=> (not res!768298) (not e!657834))))

(assert (=> b!1156760 (= res!768298 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36575 _keys!1208))))))

(declare-fun b!1156761 () Bool)

(assert (=> b!1156761 (= e!657834 e!657832)))

(declare-fun res!768302 () Bool)

(assert (=> b!1156761 (=> (not res!768302) (not e!657832))))

(assert (=> b!1156761 (= res!768302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519226 mask!1564))))

(assert (=> b!1156761 (= lt!519226 (array!74773 (store (arr!36037 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36575 _keys!1208)))))

(declare-fun b!1156762 () Bool)

(assert (=> b!1156762 (= e!657818 e!657825)))

(declare-fun res!768288 () Bool)

(assert (=> b!1156762 (=> res!768288 e!657825)))

(assert (=> b!1156762 (= res!768288 (not (= (select (arr!36037 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156762 e!657821))

(declare-fun c!115109 () Bool)

(assert (=> b!1156762 (= c!115109 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519224 () Unit!37949)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!630 (array!74772 array!74774 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37949)

(assert (=> b!1156762 (= lt!519224 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!630 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55221 () Bool)

(assert (=> bm!55221 (= call!55220 (+!3711 lt!519225 (ite (or c!115107 c!115112) (tuple2!18603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1156763 () Bool)

(assert (=> b!1156763 (= e!657828 tp_is_empty!29005)))

(declare-fun b!1156764 () Bool)

(declare-fun lt!519223 () Unit!37949)

(assert (=> b!1156764 (= e!657833 lt!519223)))

(assert (=> b!1156764 (= lt!519223 call!55222)))

(assert (=> b!1156764 call!55221))

(declare-fun bm!55222 () Bool)

(assert (=> bm!55222 (= call!55221 call!55226)))

(declare-fun b!1156765 () Bool)

(declare-fun res!768294 () Bool)

(assert (=> b!1156765 (=> (not res!768294) (not e!657834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156765 (= res!768294 (validMask!0 mask!1564))))

(declare-fun bm!55223 () Bool)

(assert (=> bm!55223 (= call!55222 call!55223)))

(declare-fun b!1156766 () Bool)

(assert (=> b!1156766 (= e!657827 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519230) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156767 () Bool)

(declare-fun Unit!37953 () Unit!37949)

(assert (=> b!1156767 (= e!657829 Unit!37953)))

(assert (= (and start!98864 res!768301) b!1156765))

(assert (= (and b!1156765 res!768294) b!1156754))

(assert (= (and b!1156754 res!768292) b!1156748))

(assert (= (and b!1156748 res!768290) b!1156757))

(assert (= (and b!1156757 res!768299) b!1156760))

(assert (= (and b!1156760 res!768298) b!1156752))

(assert (= (and b!1156752 res!768289) b!1156738))

(assert (= (and b!1156738 res!768300) b!1156761))

(assert (= (and b!1156761 res!768302) b!1156755))

(assert (= (and b!1156755 res!768291) b!1156739))

(assert (= (and b!1156739 (not res!768293)) b!1156750))

(assert (= (and b!1156750 (not res!768296)) b!1156762))

(assert (= (and b!1156762 c!115109) b!1156756))

(assert (= (and b!1156762 (not c!115109)) b!1156759))

(assert (= (or b!1156756 b!1156759) bm!55216))

(assert (= (or b!1156756 b!1156759) bm!55218))

(assert (= (and b!1156762 (not res!768288)) b!1156743))

(assert (= (and b!1156743 c!115111) b!1156740))

(assert (= (and b!1156743 (not c!115111)) b!1156767))

(assert (= (and b!1156740 c!115107) b!1156745))

(assert (= (and b!1156740 (not c!115107)) b!1156758))

(assert (= (and b!1156758 c!115112) b!1156764))

(assert (= (and b!1156758 (not c!115112)) b!1156751))

(assert (= (and b!1156751 c!115110) b!1156747))

(assert (= (and b!1156751 (not c!115110)) b!1156749))

(assert (= (or b!1156764 b!1156747) bm!55223))

(assert (= (or b!1156764 b!1156747) bm!55219))

(assert (= (or b!1156764 b!1156747) bm!55222))

(assert (= (or b!1156745 bm!55222) bm!55220))

(assert (= (or b!1156745 bm!55223) bm!55217))

(assert (= (or b!1156745 bm!55219) bm!55221))

(assert (= (and b!1156740 c!115108) b!1156741))

(assert (= (and b!1156740 (not c!115108)) b!1156766))

(assert (= (and b!1156740 res!768297) b!1156746))

(assert (= (and b!1156743 res!768295) b!1156742))

(assert (= (and b!1156744 condMapEmpty!45332) mapIsEmpty!45332))

(assert (= (and b!1156744 (not condMapEmpty!45332)) mapNonEmpty!45332))

(get-info :version)

(assert (= (and mapNonEmpty!45332 ((_ is ValueCellFull!13793) mapValue!45332)) b!1156753))

(assert (= (and b!1156744 ((_ is ValueCellFull!13793) mapDefault!45332)) b!1156763))

(assert (= start!98864 b!1156744))

(declare-fun b_lambda!19563 () Bool)

(assert (=> (not b_lambda!19563) (not b!1156750)))

(declare-fun t!36787 () Bool)

(declare-fun tb!9279 () Bool)

(assert (=> (and start!98864 (= defaultEntry!1004 defaultEntry!1004) t!36787) tb!9279))

(declare-fun result!19131 () Bool)

(assert (=> tb!9279 (= result!19131 tp_is_empty!29005)))

(assert (=> b!1156750 t!36787))

(declare-fun b_and!39779 () Bool)

(assert (= b_and!39777 (and (=> t!36787 result!19131) b_and!39779)))

(declare-fun m!1065675 () Bool)

(assert (=> b!1156745 m!1065675))

(assert (=> b!1156745 m!1065675))

(declare-fun m!1065677 () Bool)

(assert (=> b!1156745 m!1065677))

(declare-fun m!1065679 () Bool)

(assert (=> b!1156745 m!1065679))

(declare-fun m!1065681 () Bool)

(assert (=> b!1156742 m!1065681))

(declare-fun m!1065683 () Bool)

(assert (=> bm!55221 m!1065683))

(declare-fun m!1065685 () Bool)

(assert (=> b!1156756 m!1065685))

(declare-fun m!1065687 () Bool)

(assert (=> b!1156746 m!1065687))

(declare-fun m!1065689 () Bool)

(assert (=> bm!55216 m!1065689))

(assert (=> b!1156741 m!1065687))

(declare-fun m!1065691 () Bool)

(assert (=> b!1156761 m!1065691))

(declare-fun m!1065693 () Bool)

(assert (=> b!1156761 m!1065693))

(declare-fun m!1065695 () Bool)

(assert (=> b!1156752 m!1065695))

(assert (=> bm!55218 m!1065681))

(declare-fun m!1065697 () Bool)

(assert (=> bm!55220 m!1065697))

(declare-fun m!1065699 () Bool)

(assert (=> b!1156765 m!1065699))

(assert (=> b!1156743 m!1065689))

(declare-fun m!1065701 () Bool)

(assert (=> b!1156743 m!1065701))

(declare-fun m!1065703 () Bool)

(assert (=> b!1156743 m!1065703))

(declare-fun m!1065705 () Bool)

(assert (=> b!1156743 m!1065705))

(declare-fun m!1065707 () Bool)

(assert (=> b!1156743 m!1065707))

(assert (=> b!1156743 m!1065701))

(assert (=> b!1156743 m!1065703))

(declare-fun m!1065709 () Bool)

(assert (=> b!1156743 m!1065709))

(declare-fun m!1065711 () Bool)

(assert (=> b!1156743 m!1065711))

(declare-fun m!1065713 () Bool)

(assert (=> b!1156743 m!1065713))

(assert (=> b!1156743 m!1065703))

(assert (=> b!1156743 m!1065711))

(declare-fun m!1065715 () Bool)

(assert (=> b!1156743 m!1065715))

(declare-fun m!1065717 () Bool)

(assert (=> b!1156740 m!1065717))

(declare-fun m!1065719 () Bool)

(assert (=> b!1156740 m!1065719))

(declare-fun m!1065721 () Bool)

(assert (=> b!1156740 m!1065721))

(declare-fun m!1065723 () Bool)

(assert (=> b!1156740 m!1065723))

(declare-fun m!1065725 () Bool)

(assert (=> b!1156750 m!1065725))

(declare-fun m!1065727 () Bool)

(assert (=> b!1156750 m!1065727))

(declare-fun m!1065729 () Bool)

(assert (=> b!1156750 m!1065729))

(declare-fun m!1065731 () Bool)

(assert (=> b!1156750 m!1065731))

(declare-fun m!1065733 () Bool)

(assert (=> b!1156738 m!1065733))

(declare-fun m!1065735 () Bool)

(assert (=> start!98864 m!1065735))

(declare-fun m!1065737 () Bool)

(assert (=> start!98864 m!1065737))

(declare-fun m!1065739 () Bool)

(assert (=> b!1156739 m!1065739))

(declare-fun m!1065741 () Bool)

(assert (=> b!1156739 m!1065741))

(declare-fun m!1065743 () Bool)

(assert (=> b!1156748 m!1065743))

(declare-fun m!1065745 () Bool)

(assert (=> b!1156755 m!1065745))

(declare-fun m!1065747 () Bool)

(assert (=> b!1156757 m!1065747))

(declare-fun m!1065749 () Bool)

(assert (=> bm!55217 m!1065749))

(declare-fun m!1065751 () Bool)

(assert (=> mapNonEmpty!45332 m!1065751))

(assert (=> b!1156762 m!1065703))

(declare-fun m!1065753 () Bool)

(assert (=> b!1156762 m!1065753))

(check-sat (not bm!55220) (not bm!55217) (not b!1156745) (not b!1156742) (not b!1156743) (not b!1156761) (not b!1156756) (not start!98864) (not bm!55216) (not b!1156750) (not b!1156762) (not b_lambda!19563) (not b!1156755) (not b!1156740) (not bm!55221) (not b!1156739) b_and!39779 (not b!1156748) (not mapNonEmpty!45332) tp_is_empty!29005 (not b!1156765) (not b!1156757) (not b!1156752) (not bm!55218) (not b!1156746) (not b_next!24475) (not b!1156741))
(check-sat b_and!39779 (not b_next!24475))
