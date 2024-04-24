; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99166 () Bool)

(assert start!99166)

(declare-fun b_free!24535 () Bool)

(declare-fun b_next!24535 () Bool)

(assert (=> start!99166 (= b_free!24535 (not b_next!24535))))

(declare-fun tp!86316 () Bool)

(declare-fun b_and!39921 () Bool)

(assert (=> start!99166 (= tp!86316 b_and!39921)))

(declare-datatypes ((V!43881 0))(
  ( (V!43882 (val!14589 Int)) )
))
(declare-fun zeroValue!944 () V!43881)

(declare-datatypes ((tuple2!18602 0))(
  ( (tuple2!18603 (_1!9312 (_ BitVec 64)) (_2!9312 V!43881)) )
))
(declare-datatypes ((List!25340 0))(
  ( (Nil!25337) (Cons!25336 (h!26554 tuple2!18602) (t!36859 List!25340)) )
))
(declare-datatypes ((ListLongMap!16579 0))(
  ( (ListLongMap!16580 (toList!8305 List!25340)) )
))
(declare-fun lt!521889 () ListLongMap!16579)

(declare-fun c!116074 () Bool)

(declare-datatypes ((Unit!38210 0))(
  ( (Unit!38211) )
))
(declare-fun call!56028 () Unit!38210)

(declare-fun c!116076 () Bool)

(declare-fun bm!56024 () Bool)

(declare-fun minValue!944 () V!43881)

(declare-fun lt!521875 () ListLongMap!16579)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!942 (ListLongMap!16579 (_ BitVec 64) V!43881 (_ BitVec 64)) Unit!38210)

(assert (=> bm!56024 (= call!56028 (addStillContains!942 (ite c!116074 lt!521875 lt!521889) (ite c!116074 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116076 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116074 minValue!944 (ite c!116076 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1160911 () Bool)

(declare-fun res!770216 () Bool)

(declare-fun e!660267 () Bool)

(assert (=> b!1160911 (=> (not res!770216) (not e!660267))))

(declare-datatypes ((array!75019 0))(
  ( (array!75020 (arr!36154 (Array (_ BitVec 32) (_ BitVec 64))) (size!36691 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75019)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75019 (_ BitVec 32)) Bool)

(assert (=> b!1160911 (= res!770216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160912 () Bool)

(declare-fun e!660262 () Bool)

(declare-fun e!660259 () Bool)

(assert (=> b!1160912 (= e!660262 e!660259)))

(declare-fun res!770225 () Bool)

(assert (=> b!1160912 (=> res!770225 e!660259)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160912 (= res!770225 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!521880 () array!75019)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13823 0))(
  ( (ValueCellFull!13823 (v!17222 V!43881)) (EmptyCell!13823) )
))
(declare-datatypes ((array!75021 0))(
  ( (array!75022 (arr!36155 (Array (_ BitVec 32) ValueCell!13823)) (size!36692 (_ BitVec 32))) )
))
(declare-fun lt!521872 () array!75021)

(declare-fun lt!521886 () ListLongMap!16579)

(declare-fun getCurrentListMapNoExtraKeys!4797 (array!75019 array!75021 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 32) Int) ListLongMap!16579)

(assert (=> b!1160912 (= lt!521886 (getCurrentListMapNoExtraKeys!4797 lt!521880 lt!521872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521879 () V!43881)

(declare-fun _values!996 () array!75021)

(assert (=> b!1160912 (= lt!521872 (array!75022 (store (arr!36155 _values!996) i!673 (ValueCellFull!13823 lt!521879)) (size!36692 _values!996)))))

(declare-fun dynLambda!2802 (Int (_ BitVec 64)) V!43881)

(assert (=> b!1160912 (= lt!521879 (dynLambda!2802 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521890 () ListLongMap!16579)

(assert (=> b!1160912 (= lt!521890 (getCurrentListMapNoExtraKeys!4797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160913 () Bool)

(declare-fun e!660268 () Bool)

(assert (=> b!1160913 (= e!660268 true)))

(declare-fun e!660261 () Bool)

(assert (=> b!1160913 e!660261))

(declare-fun res!770215 () Bool)

(assert (=> b!1160913 (=> (not res!770215) (not e!660261))))

(declare-fun lt!521876 () ListLongMap!16579)

(assert (=> b!1160913 (= res!770215 (= lt!521876 lt!521889))))

(declare-fun -!1404 (ListLongMap!16579 (_ BitVec 64)) ListLongMap!16579)

(assert (=> b!1160913 (= lt!521876 (-!1404 lt!521890 k0!934))))

(declare-fun lt!521873 () V!43881)

(declare-fun +!3723 (ListLongMap!16579 tuple2!18602) ListLongMap!16579)

(assert (=> b!1160913 (= (-!1404 (+!3723 lt!521889 (tuple2!18603 (select (arr!36154 _keys!1208) from!1455) lt!521873)) (select (arr!36154 _keys!1208) from!1455)) lt!521889)))

(declare-fun lt!521887 () Unit!38210)

(declare-fun addThenRemoveForNewKeyIsSame!234 (ListLongMap!16579 (_ BitVec 64) V!43881) Unit!38210)

(assert (=> b!1160913 (= lt!521887 (addThenRemoveForNewKeyIsSame!234 lt!521889 (select (arr!36154 _keys!1208) from!1455) lt!521873))))

(declare-fun get!18457 (ValueCell!13823 V!43881) V!43881)

(assert (=> b!1160913 (= lt!521873 (get!18457 (select (arr!36155 _values!996) from!1455) lt!521879))))

(declare-fun lt!521884 () Unit!38210)

(declare-fun e!660269 () Unit!38210)

(assert (=> b!1160913 (= lt!521884 e!660269)))

(declare-fun c!116072 () Bool)

(declare-fun contains!6824 (ListLongMap!16579 (_ BitVec 64)) Bool)

(assert (=> b!1160913 (= c!116072 (contains!6824 lt!521889 k0!934))))

(assert (=> b!1160913 (= lt!521889 (getCurrentListMapNoExtraKeys!4797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160914 () Bool)

(declare-fun res!770224 () Bool)

(assert (=> b!1160914 (=> (not res!770224) (not e!660267))))

(assert (=> b!1160914 (= res!770224 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36691 _keys!1208))))))

(declare-fun bm!56025 () Bool)

(declare-fun call!56031 () ListLongMap!16579)

(declare-fun call!56030 () ListLongMap!16579)

(assert (=> bm!56025 (= call!56031 call!56030)))

(declare-fun b!1160915 () Bool)

(declare-fun e!660258 () Bool)

(declare-fun tp_is_empty!29065 () Bool)

(assert (=> b!1160915 (= e!660258 tp_is_empty!29065)))

(declare-fun b!1160916 () Bool)

(declare-fun e!660271 () Unit!38210)

(declare-fun e!660264 () Unit!38210)

(assert (=> b!1160916 (= e!660271 e!660264)))

(declare-fun c!116075 () Bool)

(declare-fun lt!521877 () Bool)

(assert (=> b!1160916 (= c!116075 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521877))))

(declare-fun b!1160917 () Bool)

(assert (=> b!1160917 (contains!6824 (+!3723 lt!521875 (tuple2!18603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521891 () Unit!38210)

(assert (=> b!1160917 (= lt!521891 call!56028)))

(declare-fun call!56032 () Bool)

(assert (=> b!1160917 call!56032))

(assert (=> b!1160917 (= lt!521875 call!56030)))

(declare-fun lt!521881 () Unit!38210)

(assert (=> b!1160917 (= lt!521881 (addStillContains!942 lt!521889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!660265 () Unit!38210)

(assert (=> b!1160917 (= e!660265 lt!521891)))

(declare-fun e!660263 () Bool)

(declare-fun b!1160918 () Bool)

(assert (=> b!1160918 (= e!660263 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160919 () Bool)

(declare-fun e!660274 () Bool)

(declare-fun call!56034 () ListLongMap!16579)

(declare-fun call!56033 () ListLongMap!16579)

(assert (=> b!1160919 (= e!660274 (= call!56034 call!56033))))

(declare-fun b!1160920 () Bool)

(declare-fun e!660272 () Bool)

(declare-fun mapRes!45422 () Bool)

(assert (=> b!1160920 (= e!660272 (and e!660258 mapRes!45422))))

(declare-fun condMapEmpty!45422 () Bool)

(declare-fun mapDefault!45422 () ValueCell!13823)

(assert (=> b!1160920 (= condMapEmpty!45422 (= (arr!36155 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13823)) mapDefault!45422)))))

(declare-fun b!1160921 () Bool)

(declare-fun e!660266 () Bool)

(assert (=> b!1160921 (= e!660267 e!660266)))

(declare-fun res!770219 () Bool)

(assert (=> b!1160921 (=> (not res!770219) (not e!660266))))

(assert (=> b!1160921 (= res!770219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521880 mask!1564))))

(assert (=> b!1160921 (= lt!521880 (array!75020 (store (arr!36154 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36691 _keys!1208)))))

(declare-fun b!1160922 () Bool)

(declare-fun Unit!38212 () Unit!38210)

(assert (=> b!1160922 (= e!660269 Unit!38212)))

(assert (=> b!1160922 (= lt!521877 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160922 (= c!116074 (and (not lt!521877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521892 () Unit!38210)

(assert (=> b!1160922 (= lt!521892 e!660265)))

(declare-fun lt!521878 () Unit!38210)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!531 (array!75019 array!75021 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 64) (_ BitVec 32) Int) Unit!38210)

(assert (=> b!1160922 (= lt!521878 (lemmaListMapContainsThenArrayContainsFrom!531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116071 () Bool)

(assert (=> b!1160922 (= c!116071 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770218 () Bool)

(assert (=> b!1160922 (= res!770218 e!660263)))

(declare-fun e!660270 () Bool)

(assert (=> b!1160922 (=> (not res!770218) (not e!660270))))

(assert (=> b!1160922 e!660270))

(declare-fun lt!521883 () Unit!38210)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75019 (_ BitVec 32) (_ BitVec 32)) Unit!38210)

(assert (=> b!1160922 (= lt!521883 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25341 0))(
  ( (Nil!25338) (Cons!25337 (h!26555 (_ BitVec 64)) (t!36860 List!25341)) )
))
(declare-fun arrayNoDuplicates!0 (array!75019 (_ BitVec 32) List!25341) Bool)

(assert (=> b!1160922 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25338)))

(declare-fun lt!521885 () Unit!38210)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75019 (_ BitVec 64) (_ BitVec 32) List!25341) Unit!38210)

(assert (=> b!1160922 (= lt!521885 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25338))))

(assert (=> b!1160922 false))

(declare-fun bm!56027 () Bool)

(assert (=> bm!56027 (= call!56033 (getCurrentListMapNoExtraKeys!4797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160923 () Bool)

(declare-fun res!770217 () Bool)

(assert (=> b!1160923 (=> (not res!770217) (not e!660267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160923 (= res!770217 (validKeyInArray!0 k0!934))))

(declare-fun b!1160924 () Bool)

(declare-fun Unit!38213 () Unit!38210)

(assert (=> b!1160924 (= e!660269 Unit!38213)))

(declare-fun b!1160925 () Bool)

(assert (=> b!1160925 (= c!116076 (and (not lt!521877) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160925 (= e!660265 e!660271)))

(declare-fun b!1160926 () Bool)

(assert (=> b!1160926 (= e!660266 (not e!660262))))

(declare-fun res!770220 () Bool)

(assert (=> b!1160926 (=> res!770220 e!660262)))

(assert (=> b!1160926 (= res!770220 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160926 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521893 () Unit!38210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75019 (_ BitVec 64) (_ BitVec 32)) Unit!38210)

(assert (=> b!1160926 (= lt!521893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45422 () Bool)

(assert (=> mapIsEmpty!45422 mapRes!45422))

(declare-fun b!1160927 () Bool)

(declare-fun res!770222 () Bool)

(assert (=> b!1160927 (=> (not res!770222) (not e!660267))))

(assert (=> b!1160927 (= res!770222 (and (= (size!36692 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36691 _keys!1208) (size!36692 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56028 () Bool)

(assert (=> bm!56028 (= call!56034 (getCurrentListMapNoExtraKeys!4797 lt!521880 lt!521872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160928 () Bool)

(declare-fun res!770223 () Bool)

(assert (=> b!1160928 (=> (not res!770223) (not e!660267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160928 (= res!770223 (validMask!0 mask!1564))))

(declare-fun b!1160929 () Bool)

(declare-fun Unit!38214 () Unit!38210)

(assert (=> b!1160929 (= e!660264 Unit!38214)))

(declare-fun b!1160930 () Bool)

(declare-fun res!770213 () Bool)

(assert (=> b!1160930 (=> (not res!770213) (not e!660267))))

(assert (=> b!1160930 (= res!770213 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25338))))

(declare-fun mapNonEmpty!45422 () Bool)

(declare-fun tp!86315 () Bool)

(declare-fun e!660260 () Bool)

(assert (=> mapNonEmpty!45422 (= mapRes!45422 (and tp!86315 e!660260))))

(declare-fun mapRest!45422 () (Array (_ BitVec 32) ValueCell!13823))

(declare-fun mapKey!45422 () (_ BitVec 32))

(declare-fun mapValue!45422 () ValueCell!13823)

(assert (=> mapNonEmpty!45422 (= (arr!36155 _values!996) (store mapRest!45422 mapKey!45422 mapValue!45422))))

(declare-fun bm!56029 () Bool)

(assert (=> bm!56029 (= call!56030 (+!3723 lt!521889 (ite (or c!116074 c!116076) (tuple2!18603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1160931 () Bool)

(assert (=> b!1160931 (= e!660270 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56030 () Bool)

(declare-fun call!56029 () Unit!38210)

(assert (=> bm!56030 (= call!56029 call!56028)))

(declare-fun b!1160932 () Bool)

(declare-fun res!770226 () Bool)

(assert (=> b!1160932 (=> (not res!770226) (not e!660267))))

(assert (=> b!1160932 (= res!770226 (= (select (arr!36154 _keys!1208) i!673) k0!934))))

(declare-fun b!1160933 () Bool)

(assert (=> b!1160933 (= e!660260 tp_is_empty!29065)))

(declare-fun b!1160934 () Bool)

(assert (=> b!1160934 (= e!660261 (= lt!521876 (getCurrentListMapNoExtraKeys!4797 lt!521880 lt!521872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160935 () Bool)

(assert (=> b!1160935 (= e!660263 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160936 () Bool)

(declare-fun lt!521882 () Unit!38210)

(assert (=> b!1160936 (= e!660271 lt!521882)))

(assert (=> b!1160936 (= lt!521882 call!56029)))

(declare-fun call!56027 () Bool)

(assert (=> b!1160936 call!56027))

(declare-fun b!1160937 () Bool)

(assert (=> b!1160937 (= e!660259 e!660268)))

(declare-fun res!770212 () Bool)

(assert (=> b!1160937 (=> res!770212 e!660268)))

(assert (=> b!1160937 (= res!770212 (not (= (select (arr!36154 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160937 e!660274))

(declare-fun c!116073 () Bool)

(assert (=> b!1160937 (= c!116073 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521874 () Unit!38210)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!637 (array!75019 array!75021 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38210)

(assert (=> b!1160937 (= lt!521874 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160938 () Bool)

(declare-fun res!770214 () Bool)

(assert (=> b!1160938 (=> (not res!770214) (not e!660266))))

(assert (=> b!1160938 (= res!770214 (arrayNoDuplicates!0 lt!521880 #b00000000000000000000000000000000 Nil!25338))))

(declare-fun b!1160939 () Bool)

(assert (=> b!1160939 (= e!660274 (= call!56034 (-!1404 call!56033 k0!934)))))

(declare-fun bm!56031 () Bool)

(assert (=> bm!56031 (= call!56032 (contains!6824 (ite c!116074 lt!521875 call!56031) k0!934))))

(declare-fun b!1160940 () Bool)

(assert (=> b!1160940 call!56027))

(declare-fun lt!521888 () Unit!38210)

(assert (=> b!1160940 (= lt!521888 call!56029)))

(assert (=> b!1160940 (= e!660264 lt!521888)))

(declare-fun res!770221 () Bool)

(assert (=> start!99166 (=> (not res!770221) (not e!660267))))

(assert (=> start!99166 (= res!770221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36691 _keys!1208))))))

(assert (=> start!99166 e!660267))

(assert (=> start!99166 tp_is_empty!29065))

(declare-fun array_inv!27732 (array!75019) Bool)

(assert (=> start!99166 (array_inv!27732 _keys!1208)))

(assert (=> start!99166 true))

(assert (=> start!99166 tp!86316))

(declare-fun array_inv!27733 (array!75021) Bool)

(assert (=> start!99166 (and (array_inv!27733 _values!996) e!660272)))

(declare-fun bm!56026 () Bool)

(assert (=> bm!56026 (= call!56027 call!56032)))

(assert (= (and start!99166 res!770221) b!1160928))

(assert (= (and b!1160928 res!770223) b!1160927))

(assert (= (and b!1160927 res!770222) b!1160911))

(assert (= (and b!1160911 res!770216) b!1160930))

(assert (= (and b!1160930 res!770213) b!1160914))

(assert (= (and b!1160914 res!770224) b!1160923))

(assert (= (and b!1160923 res!770217) b!1160932))

(assert (= (and b!1160932 res!770226) b!1160921))

(assert (= (and b!1160921 res!770219) b!1160938))

(assert (= (and b!1160938 res!770214) b!1160926))

(assert (= (and b!1160926 (not res!770220)) b!1160912))

(assert (= (and b!1160912 (not res!770225)) b!1160937))

(assert (= (and b!1160937 c!116073) b!1160939))

(assert (= (and b!1160937 (not c!116073)) b!1160919))

(assert (= (or b!1160939 b!1160919) bm!56028))

(assert (= (or b!1160939 b!1160919) bm!56027))

(assert (= (and b!1160937 (not res!770212)) b!1160913))

(assert (= (and b!1160913 c!116072) b!1160922))

(assert (= (and b!1160913 (not c!116072)) b!1160924))

(assert (= (and b!1160922 c!116074) b!1160917))

(assert (= (and b!1160922 (not c!116074)) b!1160925))

(assert (= (and b!1160925 c!116076) b!1160936))

(assert (= (and b!1160925 (not c!116076)) b!1160916))

(assert (= (and b!1160916 c!116075) b!1160940))

(assert (= (and b!1160916 (not c!116075)) b!1160929))

(assert (= (or b!1160936 b!1160940) bm!56030))

(assert (= (or b!1160936 b!1160940) bm!56025))

(assert (= (or b!1160936 b!1160940) bm!56026))

(assert (= (or b!1160917 bm!56026) bm!56031))

(assert (= (or b!1160917 bm!56030) bm!56024))

(assert (= (or b!1160917 bm!56025) bm!56029))

(assert (= (and b!1160922 c!116071) b!1160935))

(assert (= (and b!1160922 (not c!116071)) b!1160918))

(assert (= (and b!1160922 res!770218) b!1160931))

(assert (= (and b!1160913 res!770215) b!1160934))

(assert (= (and b!1160920 condMapEmpty!45422) mapIsEmpty!45422))

(assert (= (and b!1160920 (not condMapEmpty!45422)) mapNonEmpty!45422))

(get-info :version)

(assert (= (and mapNonEmpty!45422 ((_ is ValueCellFull!13823) mapValue!45422)) b!1160933))

(assert (= (and b!1160920 ((_ is ValueCellFull!13823) mapDefault!45422)) b!1160915))

(assert (= start!99166 b!1160920))

(declare-fun b_lambda!19635 () Bool)

(assert (=> (not b_lambda!19635) (not b!1160912)))

(declare-fun t!36858 () Bool)

(declare-fun tb!9339 () Bool)

(assert (=> (and start!99166 (= defaultEntry!1004 defaultEntry!1004) t!36858) tb!9339))

(declare-fun result!19251 () Bool)

(assert (=> tb!9339 (= result!19251 tp_is_empty!29065)))

(assert (=> b!1160912 t!36858))

(declare-fun b_and!39923 () Bool)

(assert (= b_and!39921 (and (=> t!36858 result!19251) b_and!39923)))

(declare-fun m!1070245 () Bool)

(assert (=> bm!56031 m!1070245))

(declare-fun m!1070247 () Bool)

(assert (=> bm!56027 m!1070247))

(declare-fun m!1070249 () Bool)

(assert (=> b!1160913 m!1070249))

(assert (=> b!1160913 m!1070247))

(declare-fun m!1070251 () Bool)

(assert (=> b!1160913 m!1070251))

(assert (=> b!1160913 m!1070249))

(declare-fun m!1070253 () Bool)

(assert (=> b!1160913 m!1070253))

(declare-fun m!1070255 () Bool)

(assert (=> b!1160913 m!1070255))

(declare-fun m!1070257 () Bool)

(assert (=> b!1160913 m!1070257))

(assert (=> b!1160913 m!1070253))

(declare-fun m!1070259 () Bool)

(assert (=> b!1160913 m!1070259))

(declare-fun m!1070261 () Bool)

(assert (=> b!1160913 m!1070261))

(assert (=> b!1160913 m!1070251))

(declare-fun m!1070263 () Bool)

(assert (=> b!1160913 m!1070263))

(assert (=> b!1160913 m!1070253))

(declare-fun m!1070265 () Bool)

(assert (=> b!1160912 m!1070265))

(declare-fun m!1070267 () Bool)

(assert (=> b!1160912 m!1070267))

(declare-fun m!1070269 () Bool)

(assert (=> b!1160912 m!1070269))

(declare-fun m!1070271 () Bool)

(assert (=> b!1160912 m!1070271))

(declare-fun m!1070273 () Bool)

(assert (=> bm!56024 m!1070273))

(declare-fun m!1070275 () Bool)

(assert (=> b!1160935 m!1070275))

(declare-fun m!1070277 () Bool)

(assert (=> b!1160926 m!1070277))

(declare-fun m!1070279 () Bool)

(assert (=> b!1160926 m!1070279))

(assert (=> b!1160931 m!1070275))

(declare-fun m!1070281 () Bool)

(assert (=> b!1160939 m!1070281))

(declare-fun m!1070283 () Bool)

(assert (=> b!1160923 m!1070283))

(declare-fun m!1070285 () Bool)

(assert (=> b!1160934 m!1070285))

(declare-fun m!1070287 () Bool)

(assert (=> mapNonEmpty!45422 m!1070287))

(declare-fun m!1070289 () Bool)

(assert (=> b!1160917 m!1070289))

(assert (=> b!1160917 m!1070289))

(declare-fun m!1070291 () Bool)

(assert (=> b!1160917 m!1070291))

(declare-fun m!1070293 () Bool)

(assert (=> b!1160917 m!1070293))

(assert (=> bm!56028 m!1070285))

(declare-fun m!1070295 () Bool)

(assert (=> bm!56029 m!1070295))

(declare-fun m!1070297 () Bool)

(assert (=> b!1160932 m!1070297))

(declare-fun m!1070299 () Bool)

(assert (=> b!1160930 m!1070299))

(declare-fun m!1070301 () Bool)

(assert (=> b!1160921 m!1070301))

(declare-fun m!1070303 () Bool)

(assert (=> b!1160921 m!1070303))

(declare-fun m!1070305 () Bool)

(assert (=> start!99166 m!1070305))

(declare-fun m!1070307 () Bool)

(assert (=> start!99166 m!1070307))

(declare-fun m!1070309 () Bool)

(assert (=> b!1160928 m!1070309))

(declare-fun m!1070311 () Bool)

(assert (=> b!1160922 m!1070311))

(declare-fun m!1070313 () Bool)

(assert (=> b!1160922 m!1070313))

(declare-fun m!1070315 () Bool)

(assert (=> b!1160922 m!1070315))

(declare-fun m!1070317 () Bool)

(assert (=> b!1160922 m!1070317))

(declare-fun m!1070319 () Bool)

(assert (=> b!1160938 m!1070319))

(assert (=> b!1160937 m!1070253))

(declare-fun m!1070321 () Bool)

(assert (=> b!1160937 m!1070321))

(declare-fun m!1070323 () Bool)

(assert (=> b!1160911 m!1070323))

(check-sat tp_is_empty!29065 (not start!99166) (not mapNonEmpty!45422) (not bm!56029) (not bm!56024) (not b!1160922) (not b_lambda!19635) (not b!1160917) (not b!1160935) (not b!1160934) (not bm!56027) (not b!1160913) (not b!1160911) (not b!1160928) (not b!1160937) (not b!1160926) (not bm!56031) b_and!39923 (not b!1160939) (not b!1160923) (not b!1160930) (not b!1160931) (not b!1160921) (not b!1160912) (not b_next!24535) (not b!1160938) (not bm!56028))
(check-sat b_and!39923 (not b_next!24535))
