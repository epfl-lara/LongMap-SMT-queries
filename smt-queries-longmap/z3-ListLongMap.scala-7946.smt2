; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98752 () Bool)

(assert start!98752)

(declare-fun b_free!24121 () Bool)

(declare-fun b_next!24121 () Bool)

(assert (=> start!98752 (= b_free!24121 (not b_next!24121))))

(declare-fun tp!85074 () Bool)

(declare-fun b_and!39093 () Bool)

(assert (=> start!98752 (= tp!85074 b_and!39093)))

(declare-fun b!1141982 () Bool)

(declare-datatypes ((Unit!37387 0))(
  ( (Unit!37388) )
))
(declare-fun e!649816 () Unit!37387)

(declare-fun Unit!37389 () Unit!37387)

(assert (=> b!1141982 (= e!649816 Unit!37389)))

(declare-fun bm!51056 () Bool)

(declare-fun call!51060 () Unit!37387)

(declare-fun call!51063 () Unit!37387)

(assert (=> bm!51056 (= call!51060 call!51063)))

(declare-fun b!1141983 () Bool)

(declare-fun res!761020 () Bool)

(declare-fun e!649830 () Bool)

(assert (=> b!1141983 (=> (not res!761020) (not e!649830))))

(declare-datatypes ((array!74203 0))(
  ( (array!74204 (arr!35746 (Array (_ BitVec 32) (_ BitVec 64))) (size!36283 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74203)

(declare-datatypes ((List!24964 0))(
  ( (Nil!24961) (Cons!24960 (h!26178 (_ BitVec 64)) (t!36069 List!24964)) )
))
(declare-fun arrayNoDuplicates!0 (array!74203 (_ BitVec 32) List!24964) Bool)

(assert (=> b!1141983 (= res!761020 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24961))))

(declare-fun res!761018 () Bool)

(assert (=> start!98752 (=> (not res!761018) (not e!649830))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98752 (= res!761018 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36283 _keys!1208))))))

(assert (=> start!98752 e!649830))

(declare-fun tp_is_empty!28651 () Bool)

(assert (=> start!98752 tp_is_empty!28651))

(declare-fun array_inv!27448 (array!74203) Bool)

(assert (=> start!98752 (array_inv!27448 _keys!1208)))

(assert (=> start!98752 true))

(assert (=> start!98752 tp!85074))

(declare-datatypes ((V!43329 0))(
  ( (V!43330 (val!14382 Int)) )
))
(declare-datatypes ((ValueCell!13616 0))(
  ( (ValueCellFull!13616 (v!17015 V!43329)) (EmptyCell!13616) )
))
(declare-datatypes ((array!74205 0))(
  ( (array!74206 (arr!35747 (Array (_ BitVec 32) ValueCell!13616)) (size!36284 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74205)

(declare-fun e!649817 () Bool)

(declare-fun array_inv!27449 (array!74205) Bool)

(assert (=> start!98752 (and (array_inv!27449 _values!996) e!649817)))

(declare-fun b!1141984 () Bool)

(declare-fun res!761016 () Bool)

(assert (=> b!1141984 (=> (not res!761016) (not e!649830))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1141984 (= res!761016 (= (select (arr!35746 _keys!1208) i!673) k0!934))))

(declare-fun b!1141985 () Bool)

(declare-fun e!649828 () Bool)

(declare-fun arrayContainsKey!0 (array!74203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141985 (= e!649828 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141986 () Bool)

(declare-fun res!761015 () Bool)

(declare-fun e!649825 () Bool)

(assert (=> b!1141986 (=> (not res!761015) (not e!649825))))

(declare-fun lt!508494 () array!74203)

(assert (=> b!1141986 (= res!761015 (arrayNoDuplicates!0 lt!508494 #b00000000000000000000000000000000 Nil!24961))))

(declare-fun b!1141987 () Bool)

(declare-fun e!649826 () Bool)

(assert (=> b!1141987 (= e!649825 (not e!649826))))

(declare-fun res!761014 () Bool)

(assert (=> b!1141987 (=> res!761014 e!649826)))

(assert (=> b!1141987 (= res!761014 (bvsgt from!1455 i!673))))

(assert (=> b!1141987 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508506 () Unit!37387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74203 (_ BitVec 64) (_ BitVec 32)) Unit!37387)

(assert (=> b!1141987 (= lt!508506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!43329)

(declare-datatypes ((tuple2!18202 0))(
  ( (tuple2!18203 (_1!9112 (_ BitVec 64)) (_2!9112 V!43329)) )
))
(declare-datatypes ((List!24965 0))(
  ( (Nil!24962) (Cons!24961 (h!26179 tuple2!18202) (t!36070 List!24965)) )
))
(declare-datatypes ((ListLongMap!16179 0))(
  ( (ListLongMap!16180 (toList!8105 List!24965)) )
))
(declare-fun call!51062 () ListLongMap!16179)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!508491 () array!74205)

(declare-fun minValue!944 () V!43329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!51057 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4613 (array!74203 array!74205 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 32) Int) ListLongMap!16179)

(assert (=> bm!51057 (= call!51062 (getCurrentListMapNoExtraKeys!4613 lt!508494 lt!508491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141988 () Bool)

(declare-fun res!761024 () Bool)

(assert (=> b!1141988 (=> (not res!761024) (not e!649830))))

(assert (=> b!1141988 (= res!761024 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36283 _keys!1208))))))

(declare-fun bm!51058 () Bool)

(declare-fun call!51066 () Bool)

(declare-fun call!51064 () Bool)

(assert (=> bm!51058 (= call!51066 call!51064)))

(declare-fun c!112349 () Bool)

(declare-fun bm!51059 () Bool)

(declare-fun lt!508488 () ListLongMap!16179)

(declare-fun c!112348 () Bool)

(declare-fun addStillContains!781 (ListLongMap!16179 (_ BitVec 64) V!43329 (_ BitVec 64)) Unit!37387)

(assert (=> bm!51059 (= call!51063 (addStillContains!781 lt!508488 (ite (or c!112348 c!112349) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112348 c!112349) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141989 () Bool)

(declare-fun call!51059 () ListLongMap!16179)

(declare-fun contains!6651 (ListLongMap!16179 (_ BitVec 64)) Bool)

(assert (=> b!1141989 (contains!6651 call!51059 k0!934)))

(declare-fun lt!508500 () ListLongMap!16179)

(declare-fun lt!508490 () Unit!37387)

(assert (=> b!1141989 (= lt!508490 (addStillContains!781 lt!508500 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141989 call!51064))

(declare-fun +!3553 (ListLongMap!16179 tuple2!18202) ListLongMap!16179)

(assert (=> b!1141989 (= lt!508500 (+!3553 lt!508488 (tuple2!18203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508503 () Unit!37387)

(assert (=> b!1141989 (= lt!508503 call!51063)))

(declare-fun e!649820 () Unit!37387)

(assert (=> b!1141989 (= e!649820 lt!508490)))

(declare-fun bm!51060 () Bool)

(declare-fun call!51065 () ListLongMap!16179)

(assert (=> bm!51060 (= call!51065 call!51059)))

(declare-fun b!1141990 () Bool)

(declare-fun call!51061 () ListLongMap!16179)

(declare-fun e!649829 () Bool)

(declare-fun -!1238 (ListLongMap!16179 (_ BitVec 64)) ListLongMap!16179)

(assert (=> b!1141990 (= e!649829 (= call!51062 (-!1238 call!51061 k0!934)))))

(declare-fun b!1141991 () Bool)

(declare-fun e!649824 () Unit!37387)

(declare-fun Unit!37390 () Unit!37387)

(assert (=> b!1141991 (= e!649824 Unit!37390)))

(declare-fun b!1141992 () Bool)

(assert (=> b!1141992 call!51066))

(declare-fun lt!508495 () Unit!37387)

(assert (=> b!1141992 (= lt!508495 call!51060)))

(assert (=> b!1141992 (= e!649824 lt!508495)))

(declare-fun b!1141993 () Bool)

(declare-fun e!649827 () Bool)

(assert (=> b!1141993 (= e!649827 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141994 () Bool)

(declare-fun e!649822 () Bool)

(assert (=> b!1141994 (= e!649822 tp_is_empty!28651)))

(declare-fun b!1141995 () Bool)

(declare-fun lt!508498 () Bool)

(assert (=> b!1141995 (= c!112349 (and (not lt!508498) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649819 () Unit!37387)

(assert (=> b!1141995 (= e!649820 e!649819)))

(declare-fun b!1141996 () Bool)

(declare-fun res!761017 () Bool)

(assert (=> b!1141996 (=> (not res!761017) (not e!649830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74203 (_ BitVec 32)) Bool)

(assert (=> b!1141996 (= res!761017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141997 () Bool)

(assert (=> b!1141997 (= e!649830 e!649825)))

(declare-fun res!761013 () Bool)

(assert (=> b!1141997 (=> (not res!761013) (not e!649825))))

(assert (=> b!1141997 (= res!761013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508494 mask!1564))))

(assert (=> b!1141997 (= lt!508494 (array!74204 (store (arr!35746 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36283 _keys!1208)))))

(declare-fun b!1141998 () Bool)

(declare-fun e!649818 () Bool)

(assert (=> b!1141998 (= e!649826 e!649818)))

(declare-fun res!761022 () Bool)

(assert (=> b!1141998 (=> res!761022 e!649818)))

(assert (=> b!1141998 (= res!761022 (not (= from!1455 i!673)))))

(declare-fun lt!508504 () ListLongMap!16179)

(assert (=> b!1141998 (= lt!508504 (getCurrentListMapNoExtraKeys!4613 lt!508494 lt!508491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508497 () V!43329)

(assert (=> b!1141998 (= lt!508491 (array!74206 (store (arr!35747 _values!996) i!673 (ValueCellFull!13616 lt!508497)) (size!36284 _values!996)))))

(declare-fun dynLambda!2655 (Int (_ BitVec 64)) V!43329)

(assert (=> b!1141998 (= lt!508497 (dynLambda!2655 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508507 () ListLongMap!16179)

(assert (=> b!1141998 (= lt!508507 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141999 () Bool)

(assert (=> b!1141999 (= e!649827 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508498) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142000 () Bool)

(assert (=> b!1142000 (= e!649819 e!649824)))

(declare-fun c!112345 () Bool)

(assert (=> b!1142000 (= c!112345 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508498))))

(declare-fun b!1142001 () Bool)

(assert (=> b!1142001 (= e!649829 (= call!51062 call!51061))))

(declare-fun b!1142002 () Bool)

(declare-fun e!649831 () Bool)

(assert (=> b!1142002 (= e!649831 tp_is_empty!28651)))

(declare-fun b!1142003 () Bool)

(declare-fun res!761012 () Bool)

(assert (=> b!1142003 (=> (not res!761012) (not e!649830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142003 (= res!761012 (validKeyInArray!0 k0!934))))

(declare-fun b!1142004 () Bool)

(declare-fun lt!508499 () Unit!37387)

(assert (=> b!1142004 (= e!649819 lt!508499)))

(assert (=> b!1142004 (= lt!508499 call!51060)))

(assert (=> b!1142004 call!51066))

(declare-fun bm!51061 () Bool)

(assert (=> bm!51061 (= call!51061 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44801 () Bool)

(declare-fun mapRes!44801 () Bool)

(declare-fun tp!85073 () Bool)

(assert (=> mapNonEmpty!44801 (= mapRes!44801 (and tp!85073 e!649822))))

(declare-fun mapValue!44801 () ValueCell!13616)

(declare-fun mapRest!44801 () (Array (_ BitVec 32) ValueCell!13616))

(declare-fun mapKey!44801 () (_ BitVec 32))

(assert (=> mapNonEmpty!44801 (= (arr!35747 _values!996) (store mapRest!44801 mapKey!44801 mapValue!44801))))

(declare-fun b!1142005 () Bool)

(declare-fun e!649821 () Bool)

(assert (=> b!1142005 (= e!649821 true)))

(declare-fun lt!508505 () V!43329)

(assert (=> b!1142005 (= (-!1238 (+!3553 lt!508488 (tuple2!18203 (select (arr!35746 _keys!1208) from!1455) lt!508505)) (select (arr!35746 _keys!1208) from!1455)) lt!508488)))

(declare-fun lt!508489 () Unit!37387)

(declare-fun addThenRemoveForNewKeyIsSame!98 (ListLongMap!16179 (_ BitVec 64) V!43329) Unit!37387)

(assert (=> b!1142005 (= lt!508489 (addThenRemoveForNewKeyIsSame!98 lt!508488 (select (arr!35746 _keys!1208) from!1455) lt!508505))))

(declare-fun get!18183 (ValueCell!13616 V!43329) V!43329)

(assert (=> b!1142005 (= lt!508505 (get!18183 (select (arr!35747 _values!996) from!1455) lt!508497))))

(declare-fun lt!508496 () Unit!37387)

(assert (=> b!1142005 (= lt!508496 e!649816)))

(declare-fun c!112350 () Bool)

(assert (=> b!1142005 (= c!112350 (contains!6651 lt!508488 k0!934))))

(assert (=> b!1142005 (= lt!508488 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51062 () Bool)

(assert (=> bm!51062 (= call!51064 (contains!6651 (ite c!112348 lt!508500 call!51065) k0!934))))

(declare-fun b!1142006 () Bool)

(declare-fun res!761025 () Bool)

(assert (=> b!1142006 (=> (not res!761025) (not e!649830))))

(assert (=> b!1142006 (= res!761025 (and (= (size!36284 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36283 _keys!1208) (size!36284 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142007 () Bool)

(declare-fun res!761021 () Bool)

(assert (=> b!1142007 (=> (not res!761021) (not e!649830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142007 (= res!761021 (validMask!0 mask!1564))))

(declare-fun b!1142008 () Bool)

(assert (=> b!1142008 (= e!649818 e!649821)))

(declare-fun res!761023 () Bool)

(assert (=> b!1142008 (=> res!761023 e!649821)))

(assert (=> b!1142008 (= res!761023 (not (= (select (arr!35746 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142008 e!649829))

(declare-fun c!112346 () Bool)

(assert (=> b!1142008 (= c!112346 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508493 () Unit!37387)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!495 (array!74203 array!74205 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37387)

(assert (=> b!1142008 (= lt!508493 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142009 () Bool)

(declare-fun Unit!37391 () Unit!37387)

(assert (=> b!1142009 (= e!649816 Unit!37391)))

(assert (=> b!1142009 (= lt!508498 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142009 (= c!112348 (and (not lt!508498) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508487 () Unit!37387)

(assert (=> b!1142009 (= lt!508487 e!649820)))

(declare-fun lt!508502 () Unit!37387)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!386 (array!74203 array!74205 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 64) (_ BitVec 32) Int) Unit!37387)

(assert (=> b!1142009 (= lt!508502 (lemmaListMapContainsThenArrayContainsFrom!386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112347 () Bool)

(assert (=> b!1142009 (= c!112347 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761019 () Bool)

(assert (=> b!1142009 (= res!761019 e!649827)))

(assert (=> b!1142009 (=> (not res!761019) (not e!649828))))

(assert (=> b!1142009 e!649828))

(declare-fun lt!508492 () Unit!37387)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74203 (_ BitVec 32) (_ BitVec 32)) Unit!37387)

(assert (=> b!1142009 (= lt!508492 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142009 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24961)))

(declare-fun lt!508501 () Unit!37387)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74203 (_ BitVec 64) (_ BitVec 32) List!24964) Unit!37387)

(assert (=> b!1142009 (= lt!508501 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24961))))

(assert (=> b!1142009 false))

(declare-fun bm!51063 () Bool)

(assert (=> bm!51063 (= call!51059 (+!3553 (ite c!112348 lt!508500 lt!508488) (ite c!112348 (tuple2!18203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112349 (tuple2!18203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1142010 () Bool)

(assert (=> b!1142010 (= e!649817 (and e!649831 mapRes!44801))))

(declare-fun condMapEmpty!44801 () Bool)

(declare-fun mapDefault!44801 () ValueCell!13616)

(assert (=> b!1142010 (= condMapEmpty!44801 (= (arr!35747 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13616)) mapDefault!44801)))))

(declare-fun mapIsEmpty!44801 () Bool)

(assert (=> mapIsEmpty!44801 mapRes!44801))

(assert (= (and start!98752 res!761018) b!1142007))

(assert (= (and b!1142007 res!761021) b!1142006))

(assert (= (and b!1142006 res!761025) b!1141996))

(assert (= (and b!1141996 res!761017) b!1141983))

(assert (= (and b!1141983 res!761020) b!1141988))

(assert (= (and b!1141988 res!761024) b!1142003))

(assert (= (and b!1142003 res!761012) b!1141984))

(assert (= (and b!1141984 res!761016) b!1141997))

(assert (= (and b!1141997 res!761013) b!1141986))

(assert (= (and b!1141986 res!761015) b!1141987))

(assert (= (and b!1141987 (not res!761014)) b!1141998))

(assert (= (and b!1141998 (not res!761022)) b!1142008))

(assert (= (and b!1142008 c!112346) b!1141990))

(assert (= (and b!1142008 (not c!112346)) b!1142001))

(assert (= (or b!1141990 b!1142001) bm!51057))

(assert (= (or b!1141990 b!1142001) bm!51061))

(assert (= (and b!1142008 (not res!761023)) b!1142005))

(assert (= (and b!1142005 c!112350) b!1142009))

(assert (= (and b!1142005 (not c!112350)) b!1141982))

(assert (= (and b!1142009 c!112348) b!1141989))

(assert (= (and b!1142009 (not c!112348)) b!1141995))

(assert (= (and b!1141995 c!112349) b!1142004))

(assert (= (and b!1141995 (not c!112349)) b!1142000))

(assert (= (and b!1142000 c!112345) b!1141992))

(assert (= (and b!1142000 (not c!112345)) b!1141991))

(assert (= (or b!1142004 b!1141992) bm!51056))

(assert (= (or b!1142004 b!1141992) bm!51060))

(assert (= (or b!1142004 b!1141992) bm!51058))

(assert (= (or b!1141989 bm!51058) bm!51062))

(assert (= (or b!1141989 bm!51056) bm!51059))

(assert (= (or b!1141989 bm!51060) bm!51063))

(assert (= (and b!1142009 c!112347) b!1141993))

(assert (= (and b!1142009 (not c!112347)) b!1141999))

(assert (= (and b!1142009 res!761019) b!1141985))

(assert (= (and b!1142010 condMapEmpty!44801) mapIsEmpty!44801))

(assert (= (and b!1142010 (not condMapEmpty!44801)) mapNonEmpty!44801))

(get-info :version)

(assert (= (and mapNonEmpty!44801 ((_ is ValueCellFull!13616) mapValue!44801)) b!1141994))

(assert (= (and b!1142010 ((_ is ValueCellFull!13616) mapDefault!44801)) b!1142002))

(assert (= start!98752 b!1142010))

(declare-fun b_lambda!19221 () Bool)

(assert (=> (not b_lambda!19221) (not b!1141998)))

(declare-fun t!36068 () Bool)

(declare-fun tb!8925 () Bool)

(assert (=> (and start!98752 (= defaultEntry!1004 defaultEntry!1004) t!36068) tb!8925))

(declare-fun result!18423 () Bool)

(assert (=> tb!8925 (= result!18423 tp_is_empty!28651)))

(assert (=> b!1141998 t!36068))

(declare-fun b_and!39095 () Bool)

(assert (= b_and!39093 (and (=> t!36068 result!18423) b_and!39095)))

(declare-fun m!1053749 () Bool)

(assert (=> b!1142005 m!1053749))

(declare-fun m!1053751 () Bool)

(assert (=> b!1142005 m!1053751))

(declare-fun m!1053753 () Bool)

(assert (=> b!1142005 m!1053753))

(assert (=> b!1142005 m!1053751))

(declare-fun m!1053755 () Bool)

(assert (=> b!1142005 m!1053755))

(assert (=> b!1142005 m!1053753))

(declare-fun m!1053757 () Bool)

(assert (=> b!1142005 m!1053757))

(declare-fun m!1053759 () Bool)

(assert (=> b!1142005 m!1053759))

(assert (=> b!1142005 m!1053757))

(declare-fun m!1053761 () Bool)

(assert (=> b!1142005 m!1053761))

(assert (=> b!1142005 m!1053757))

(declare-fun m!1053763 () Bool)

(assert (=> b!1142005 m!1053763))

(declare-fun m!1053765 () Bool)

(assert (=> b!1141997 m!1053765))

(declare-fun m!1053767 () Bool)

(assert (=> b!1141997 m!1053767))

(declare-fun m!1053769 () Bool)

(assert (=> bm!51063 m!1053769))

(declare-fun m!1053771 () Bool)

(assert (=> bm!51057 m!1053771))

(declare-fun m!1053773 () Bool)

(assert (=> b!1141983 m!1053773))

(declare-fun m!1053775 () Bool)

(assert (=> b!1142007 m!1053775))

(declare-fun m!1053777 () Bool)

(assert (=> b!1141998 m!1053777))

(declare-fun m!1053779 () Bool)

(assert (=> b!1141998 m!1053779))

(declare-fun m!1053781 () Bool)

(assert (=> b!1141998 m!1053781))

(declare-fun m!1053783 () Bool)

(assert (=> b!1141998 m!1053783))

(declare-fun m!1053785 () Bool)

(assert (=> start!98752 m!1053785))

(declare-fun m!1053787 () Bool)

(assert (=> start!98752 m!1053787))

(declare-fun m!1053789 () Bool)

(assert (=> bm!51059 m!1053789))

(declare-fun m!1053791 () Bool)

(assert (=> b!1141984 m!1053791))

(declare-fun m!1053793 () Bool)

(assert (=> bm!51062 m!1053793))

(declare-fun m!1053795 () Bool)

(assert (=> mapNonEmpty!44801 m!1053795))

(declare-fun m!1053797 () Bool)

(assert (=> b!1141996 m!1053797))

(declare-fun m!1053799 () Bool)

(assert (=> b!1142003 m!1053799))

(declare-fun m!1053801 () Bool)

(assert (=> b!1141985 m!1053801))

(assert (=> bm!51061 m!1053749))

(assert (=> b!1142008 m!1053757))

(declare-fun m!1053803 () Bool)

(assert (=> b!1142008 m!1053803))

(declare-fun m!1053805 () Bool)

(assert (=> b!1141989 m!1053805))

(declare-fun m!1053807 () Bool)

(assert (=> b!1141989 m!1053807))

(declare-fun m!1053809 () Bool)

(assert (=> b!1141989 m!1053809))

(declare-fun m!1053811 () Bool)

(assert (=> b!1141987 m!1053811))

(declare-fun m!1053813 () Bool)

(assert (=> b!1141987 m!1053813))

(declare-fun m!1053815 () Bool)

(assert (=> b!1142009 m!1053815))

(declare-fun m!1053817 () Bool)

(assert (=> b!1142009 m!1053817))

(declare-fun m!1053819 () Bool)

(assert (=> b!1142009 m!1053819))

(declare-fun m!1053821 () Bool)

(assert (=> b!1142009 m!1053821))

(assert (=> b!1141993 m!1053801))

(declare-fun m!1053823 () Bool)

(assert (=> b!1141986 m!1053823))

(declare-fun m!1053825 () Bool)

(assert (=> b!1141990 m!1053825))

(check-sat (not bm!51062) (not bm!51063) (not bm!51057) (not b!1141996) (not b!1141990) (not b!1142005) (not b!1141989) (not b!1141986) (not b!1142003) (not b!1142008) (not b!1142009) (not b!1141997) (not b!1142007) (not b!1141983) (not b_next!24121) (not b!1141993) (not b!1141987) (not start!98752) (not b_lambda!19221) (not b!1141998) (not bm!51059) (not b!1141985) tp_is_empty!28651 b_and!39095 (not mapNonEmpty!44801) (not bm!51061))
(check-sat b_and!39095 (not b_next!24121))
