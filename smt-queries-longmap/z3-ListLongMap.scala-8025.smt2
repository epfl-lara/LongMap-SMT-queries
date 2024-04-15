; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98984 () Bool)

(assert start!98984)

(declare-fun b_free!24595 () Bool)

(declare-fun b_next!24595 () Bool)

(assert (=> start!98984 (= b_free!24595 (not b_next!24595))))

(declare-fun tp!86496 () Bool)

(declare-fun b_and!40017 () Bool)

(assert (=> start!98984 (= tp!86496 b_and!40017)))

(declare-fun b!1162258 () Bool)

(declare-datatypes ((Unit!38184 0))(
  ( (Unit!38185) )
))
(declare-fun e!660893 () Unit!38184)

(declare-fun Unit!38186 () Unit!38184)

(assert (=> b!1162258 (= e!660893 Unit!38186)))

(declare-fun lt!523178 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1162258 (= lt!523178 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116187 () Bool)

(assert (=> b!1162258 (= c!116187 (and (not lt!523178) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523196 () Unit!38184)

(declare-fun e!660890 () Unit!38184)

(assert (=> b!1162258 (= lt!523196 e!660890)))

(declare-datatypes ((V!43961 0))(
  ( (V!43962 (val!14619 Int)) )
))
(declare-fun zeroValue!944 () V!43961)

(declare-fun lt!523191 () Unit!38184)

(declare-datatypes ((array!75008 0))(
  ( (array!75009 (arr!36155 (Array (_ BitVec 32) (_ BitVec 64))) (size!36693 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75008)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13853 0))(
  ( (ValueCellFull!13853 (v!17255 V!43961)) (EmptyCell!13853) )
))
(declare-datatypes ((array!75010 0))(
  ( (array!75011 (arr!36156 (Array (_ BitVec 32) ValueCell!13853)) (size!36694 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75010)

(declare-fun minValue!944 () V!43961)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!542 (array!75008 array!75010 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 64) (_ BitVec 32) Int) Unit!38184)

(assert (=> b!1162258 (= lt!523191 (lemmaListMapContainsThenArrayContainsFrom!542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116188 () Bool)

(assert (=> b!1162258 (= c!116188 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770998 () Bool)

(declare-fun e!660888 () Bool)

(assert (=> b!1162258 (= res!770998 e!660888)))

(declare-fun e!660884 () Bool)

(assert (=> b!1162258 (=> (not res!770998) (not e!660884))))

(assert (=> b!1162258 e!660884))

(declare-fun lt!523176 () Unit!38184)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75008 (_ BitVec 32) (_ BitVec 32)) Unit!38184)

(assert (=> b!1162258 (= lt!523176 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25437 0))(
  ( (Nil!25434) (Cons!25433 (h!26642 (_ BitVec 64)) (t!37015 List!25437)) )
))
(declare-fun arrayNoDuplicates!0 (array!75008 (_ BitVec 32) List!25437) Bool)

(assert (=> b!1162258 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25434)))

(declare-fun lt!523185 () Unit!38184)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75008 (_ BitVec 64) (_ BitVec 32) List!25437) Unit!38184)

(assert (=> b!1162258 (= lt!523185 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25434))))

(assert (=> b!1162258 false))

(declare-fun b!1162259 () Bool)

(declare-fun arrayContainsKey!0 (array!75008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162259 (= e!660884 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162260 () Bool)

(declare-fun res!770994 () Bool)

(declare-fun e!660879 () Bool)

(assert (=> b!1162260 (=> (not res!770994) (not e!660879))))

(assert (=> b!1162260 (= res!770994 (and (= (size!36694 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36693 _keys!1208) (size!36694 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162261 () Bool)

(declare-fun res!770993 () Bool)

(declare-fun e!660891 () Bool)

(assert (=> b!1162261 (=> (not res!770993) (not e!660891))))

(declare-fun lt!523182 () array!75008)

(assert (=> b!1162261 (= res!770993 (arrayNoDuplicates!0 lt!523182 #b00000000000000000000000000000000 Nil!25434))))

(declare-fun b!1162262 () Bool)

(assert (=> b!1162262 (= e!660888 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162263 () Bool)

(declare-datatypes ((tuple2!18720 0))(
  ( (tuple2!18721 (_1!9371 (_ BitVec 64)) (_2!9371 V!43961)) )
))
(declare-datatypes ((List!25438 0))(
  ( (Nil!25435) (Cons!25434 (h!26643 tuple2!18720) (t!37016 List!25438)) )
))
(declare-datatypes ((ListLongMap!16689 0))(
  ( (ListLongMap!16690 (toList!8360 List!25438)) )
))
(declare-fun call!56663 () ListLongMap!16689)

(declare-fun e!660887 () Bool)

(declare-fun call!56662 () ListLongMap!16689)

(declare-fun -!1407 (ListLongMap!16689 (_ BitVec 64)) ListLongMap!16689)

(assert (=> b!1162263 (= e!660887 (= call!56662 (-!1407 call!56663 k0!934)))))

(declare-fun lt!523197 () array!75010)

(declare-fun bm!56656 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4838 (array!75008 array!75010 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 32) Int) ListLongMap!16689)

(assert (=> bm!56656 (= call!56662 (getCurrentListMapNoExtraKeys!4838 lt!523182 lt!523197 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162264 () Bool)

(declare-fun res!770991 () Bool)

(assert (=> b!1162264 (=> (not res!770991) (not e!660879))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162264 (= res!770991 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36693 _keys!1208))))))

(declare-fun b!1162265 () Bool)

(declare-fun e!660878 () Bool)

(declare-fun e!660894 () Bool)

(assert (=> b!1162265 (= e!660878 e!660894)))

(declare-fun res!770995 () Bool)

(assert (=> b!1162265 (=> res!770995 e!660894)))

(assert (=> b!1162265 (= res!770995 (not (= from!1455 i!673)))))

(declare-fun lt!523181 () ListLongMap!16689)

(assert (=> b!1162265 (= lt!523181 (getCurrentListMapNoExtraKeys!4838 lt!523182 lt!523197 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523193 () V!43961)

(assert (=> b!1162265 (= lt!523197 (array!75011 (store (arr!36156 _values!996) i!673 (ValueCellFull!13853 lt!523193)) (size!36694 _values!996)))))

(declare-fun dynLambda!2774 (Int (_ BitVec 64)) V!43961)

(assert (=> b!1162265 (= lt!523193 (dynLambda!2774 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523188 () ListLongMap!16689)

(assert (=> b!1162265 (= lt!523188 (getCurrentListMapNoExtraKeys!4838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!56665 () ListLongMap!16689)

(declare-fun lt!523195 () ListLongMap!16689)

(declare-fun c!116189 () Bool)

(declare-fun bm!56657 () Bool)

(declare-fun lt!523183 () ListLongMap!16689)

(declare-fun +!3763 (ListLongMap!16689 tuple2!18720) ListLongMap!16689)

(assert (=> bm!56657 (= call!56665 (+!3763 (ite c!116187 lt!523183 lt!523195) (ite c!116187 (tuple2!18721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116189 (tuple2!18721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1162266 () Bool)

(assert (=> b!1162266 (= c!116189 (and (not lt!523178) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660880 () Unit!38184)

(assert (=> b!1162266 (= e!660890 e!660880)))

(declare-fun mapNonEmpty!45512 () Bool)

(declare-fun mapRes!45512 () Bool)

(declare-fun tp!86495 () Bool)

(declare-fun e!660885 () Bool)

(assert (=> mapNonEmpty!45512 (= mapRes!45512 (and tp!86495 e!660885))))

(declare-fun mapValue!45512 () ValueCell!13853)

(declare-fun mapRest!45512 () (Array (_ BitVec 32) ValueCell!13853))

(declare-fun mapKey!45512 () (_ BitVec 32))

(assert (=> mapNonEmpty!45512 (= (arr!36156 _values!996) (store mapRest!45512 mapKey!45512 mapValue!45512))))

(declare-fun b!1162268 () Bool)

(assert (=> b!1162268 (= e!660887 (= call!56662 call!56663))))

(declare-fun b!1162269 () Bool)

(declare-fun res!770990 () Bool)

(assert (=> b!1162269 (=> (not res!770990) (not e!660879))))

(assert (=> b!1162269 (= res!770990 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25434))))

(declare-fun bm!56658 () Bool)

(declare-fun call!56661 () Unit!38184)

(declare-fun call!56660 () Unit!38184)

(assert (=> bm!56658 (= call!56661 call!56660)))

(declare-fun b!1162270 () Bool)

(declare-fun e!660883 () Bool)

(declare-fun tp_is_empty!29125 () Bool)

(assert (=> b!1162270 (= e!660883 tp_is_empty!29125)))

(declare-fun e!660889 () Bool)

(declare-fun b!1162271 () Bool)

(declare-fun lt!523189 () ListLongMap!16689)

(assert (=> b!1162271 (= e!660889 (= lt!523189 (getCurrentListMapNoExtraKeys!4838 lt!523182 lt!523197 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162272 () Bool)

(assert (=> b!1162272 (= e!660885 tp_is_empty!29125)))

(declare-fun b!1162273 () Bool)

(declare-fun e!660881 () Unit!38184)

(declare-fun Unit!38187 () Unit!38184)

(assert (=> b!1162273 (= e!660881 Unit!38187)))

(declare-fun mapIsEmpty!45512 () Bool)

(assert (=> mapIsEmpty!45512 mapRes!45512))

(declare-fun call!56659 () ListLongMap!16689)

(declare-fun bm!56659 () Bool)

(declare-fun call!56666 () Bool)

(declare-fun contains!6806 (ListLongMap!16689 (_ BitVec 64)) Bool)

(assert (=> bm!56659 (= call!56666 (contains!6806 (ite c!116187 lt!523183 call!56659) k0!934))))

(declare-fun bm!56660 () Bool)

(assert (=> bm!56660 (= call!56659 call!56665)))

(declare-fun b!1162274 () Bool)

(assert (=> b!1162274 (= e!660891 (not e!660878))))

(declare-fun res!770988 () Bool)

(assert (=> b!1162274 (=> res!770988 e!660878)))

(assert (=> b!1162274 (= res!770988 (bvsgt from!1455 i!673))))

(assert (=> b!1162274 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523190 () Unit!38184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75008 (_ BitVec 64) (_ BitVec 32)) Unit!38184)

(assert (=> b!1162274 (= lt!523190 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162275 () Bool)

(declare-fun call!56664 () Bool)

(assert (=> b!1162275 call!56664))

(declare-fun lt!523180 () Unit!38184)

(assert (=> b!1162275 (= lt!523180 call!56661)))

(assert (=> b!1162275 (= e!660881 lt!523180)))

(declare-fun b!1162276 () Bool)

(assert (=> b!1162276 (= e!660888 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523178) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162277 () Bool)

(declare-fun res!770996 () Bool)

(assert (=> b!1162277 (=> (not res!770996) (not e!660879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75008 (_ BitVec 32)) Bool)

(assert (=> b!1162277 (= res!770996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162278 () Bool)

(declare-fun lt!523184 () Unit!38184)

(assert (=> b!1162278 (= e!660880 lt!523184)))

(assert (=> b!1162278 (= lt!523184 call!56661)))

(assert (=> b!1162278 call!56664))

(declare-fun b!1162279 () Bool)

(assert (=> b!1162279 (contains!6806 call!56665 k0!934)))

(declare-fun lt!523177 () Unit!38184)

(assert (=> b!1162279 (= lt!523177 call!56660)))

(assert (=> b!1162279 call!56666))

(assert (=> b!1162279 (= lt!523183 (+!3763 lt!523195 (tuple2!18721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523192 () Unit!38184)

(declare-fun addStillContains!971 (ListLongMap!16689 (_ BitVec 64) V!43961 (_ BitVec 64)) Unit!38184)

(assert (=> b!1162279 (= lt!523192 (addStillContains!971 lt!523195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1162279 (= e!660890 lt!523177)))

(declare-fun b!1162280 () Bool)

(assert (=> b!1162280 (= e!660879 e!660891)))

(declare-fun res!771002 () Bool)

(assert (=> b!1162280 (=> (not res!771002) (not e!660891))))

(assert (=> b!1162280 (= res!771002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523182 mask!1564))))

(assert (=> b!1162280 (= lt!523182 (array!75009 (store (arr!36155 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36693 _keys!1208)))))

(declare-fun b!1162267 () Bool)

(declare-fun e!660882 () Bool)

(assert (=> b!1162267 (= e!660882 true)))

(assert (=> b!1162267 e!660889))

(declare-fun res!770999 () Bool)

(assert (=> b!1162267 (=> (not res!770999) (not e!660889))))

(assert (=> b!1162267 (= res!770999 (= lt!523189 lt!523195))))

(assert (=> b!1162267 (= lt!523189 (-!1407 lt!523188 k0!934))))

(declare-fun lt!523187 () V!43961)

(assert (=> b!1162267 (= (-!1407 (+!3763 lt!523195 (tuple2!18721 (select (arr!36155 _keys!1208) from!1455) lt!523187)) (select (arr!36155 _keys!1208) from!1455)) lt!523195)))

(declare-fun lt!523194 () Unit!38184)

(declare-fun addThenRemoveForNewKeyIsSame!249 (ListLongMap!16689 (_ BitVec 64) V!43961) Unit!38184)

(assert (=> b!1162267 (= lt!523194 (addThenRemoveForNewKeyIsSame!249 lt!523195 (select (arr!36155 _keys!1208) from!1455) lt!523187))))

(declare-fun get!18461 (ValueCell!13853 V!43961) V!43961)

(assert (=> b!1162267 (= lt!523187 (get!18461 (select (arr!36156 _values!996) from!1455) lt!523193))))

(declare-fun lt!523186 () Unit!38184)

(assert (=> b!1162267 (= lt!523186 e!660893)))

(declare-fun c!116190 () Bool)

(assert (=> b!1162267 (= c!116190 (contains!6806 lt!523195 k0!934))))

(assert (=> b!1162267 (= lt!523195 (getCurrentListMapNoExtraKeys!4838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770992 () Bool)

(assert (=> start!98984 (=> (not res!770992) (not e!660879))))

(assert (=> start!98984 (= res!770992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36693 _keys!1208))))))

(assert (=> start!98984 e!660879))

(assert (=> start!98984 tp_is_empty!29125))

(declare-fun array_inv!27776 (array!75008) Bool)

(assert (=> start!98984 (array_inv!27776 _keys!1208)))

(assert (=> start!98984 true))

(assert (=> start!98984 tp!86496))

(declare-fun e!660892 () Bool)

(declare-fun array_inv!27777 (array!75010) Bool)

(assert (=> start!98984 (and (array_inv!27777 _values!996) e!660892)))

(declare-fun bm!56661 () Bool)

(assert (=> bm!56661 (= call!56663 (getCurrentListMapNoExtraKeys!4838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162281 () Bool)

(assert (=> b!1162281 (= e!660892 (and e!660883 mapRes!45512))))

(declare-fun condMapEmpty!45512 () Bool)

(declare-fun mapDefault!45512 () ValueCell!13853)

(assert (=> b!1162281 (= condMapEmpty!45512 (= (arr!36156 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13853)) mapDefault!45512)))))

(declare-fun b!1162282 () Bool)

(assert (=> b!1162282 (= e!660894 e!660882)))

(declare-fun res!770989 () Bool)

(assert (=> b!1162282 (=> res!770989 e!660882)))

(assert (=> b!1162282 (= res!770989 (not (= (select (arr!36155 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162282 e!660887))

(declare-fun c!116192 () Bool)

(assert (=> b!1162282 (= c!116192 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523179 () Unit!38184)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!674 (array!75008 array!75010 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38184)

(assert (=> b!1162282 (= lt!523179 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!674 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56662 () Bool)

(assert (=> bm!56662 (= call!56660 (addStillContains!971 (ite c!116187 lt!523183 lt!523195) (ite c!116187 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116189 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116187 minValue!944 (ite c!116189 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1162283 () Bool)

(declare-fun res!771000 () Bool)

(assert (=> b!1162283 (=> (not res!771000) (not e!660879))))

(assert (=> b!1162283 (= res!771000 (= (select (arr!36155 _keys!1208) i!673) k0!934))))

(declare-fun b!1162284 () Bool)

(declare-fun res!770997 () Bool)

(assert (=> b!1162284 (=> (not res!770997) (not e!660879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162284 (= res!770997 (validMask!0 mask!1564))))

(declare-fun b!1162285 () Bool)

(declare-fun res!771001 () Bool)

(assert (=> b!1162285 (=> (not res!771001) (not e!660879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162285 (= res!771001 (validKeyInArray!0 k0!934))))

(declare-fun bm!56663 () Bool)

(assert (=> bm!56663 (= call!56664 call!56666)))

(declare-fun b!1162286 () Bool)

(assert (=> b!1162286 (= e!660880 e!660881)))

(declare-fun c!116191 () Bool)

(assert (=> b!1162286 (= c!116191 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523178))))

(declare-fun b!1162287 () Bool)

(declare-fun Unit!38188 () Unit!38184)

(assert (=> b!1162287 (= e!660893 Unit!38188)))

(assert (= (and start!98984 res!770992) b!1162284))

(assert (= (and b!1162284 res!770997) b!1162260))

(assert (= (and b!1162260 res!770994) b!1162277))

(assert (= (and b!1162277 res!770996) b!1162269))

(assert (= (and b!1162269 res!770990) b!1162264))

(assert (= (and b!1162264 res!770991) b!1162285))

(assert (= (and b!1162285 res!771001) b!1162283))

(assert (= (and b!1162283 res!771000) b!1162280))

(assert (= (and b!1162280 res!771002) b!1162261))

(assert (= (and b!1162261 res!770993) b!1162274))

(assert (= (and b!1162274 (not res!770988)) b!1162265))

(assert (= (and b!1162265 (not res!770995)) b!1162282))

(assert (= (and b!1162282 c!116192) b!1162263))

(assert (= (and b!1162282 (not c!116192)) b!1162268))

(assert (= (or b!1162263 b!1162268) bm!56656))

(assert (= (or b!1162263 b!1162268) bm!56661))

(assert (= (and b!1162282 (not res!770989)) b!1162267))

(assert (= (and b!1162267 c!116190) b!1162258))

(assert (= (and b!1162267 (not c!116190)) b!1162287))

(assert (= (and b!1162258 c!116187) b!1162279))

(assert (= (and b!1162258 (not c!116187)) b!1162266))

(assert (= (and b!1162266 c!116189) b!1162278))

(assert (= (and b!1162266 (not c!116189)) b!1162286))

(assert (= (and b!1162286 c!116191) b!1162275))

(assert (= (and b!1162286 (not c!116191)) b!1162273))

(assert (= (or b!1162278 b!1162275) bm!56658))

(assert (= (or b!1162278 b!1162275) bm!56660))

(assert (= (or b!1162278 b!1162275) bm!56663))

(assert (= (or b!1162279 bm!56663) bm!56659))

(assert (= (or b!1162279 bm!56658) bm!56662))

(assert (= (or b!1162279 bm!56660) bm!56657))

(assert (= (and b!1162258 c!116188) b!1162262))

(assert (= (and b!1162258 (not c!116188)) b!1162276))

(assert (= (and b!1162258 res!770998) b!1162259))

(assert (= (and b!1162267 res!770999) b!1162271))

(assert (= (and b!1162281 condMapEmpty!45512) mapIsEmpty!45512))

(assert (= (and b!1162281 (not condMapEmpty!45512)) mapNonEmpty!45512))

(get-info :version)

(assert (= (and mapNonEmpty!45512 ((_ is ValueCellFull!13853) mapValue!45512)) b!1162272))

(assert (= (and b!1162281 ((_ is ValueCellFull!13853) mapDefault!45512)) b!1162270))

(assert (= start!98984 b!1162281))

(declare-fun b_lambda!19683 () Bool)

(assert (=> (not b_lambda!19683) (not b!1162265)))

(declare-fun t!37014 () Bool)

(declare-fun tb!9399 () Bool)

(assert (=> (and start!98984 (= defaultEntry!1004 defaultEntry!1004) t!37014) tb!9399))

(declare-fun result!19371 () Bool)

(assert (=> tb!9399 (= result!19371 tp_is_empty!29125)))

(assert (=> b!1162265 t!37014))

(declare-fun b_and!40019 () Bool)

(assert (= b_and!40017 (and (=> t!37014 result!19371) b_and!40019)))

(declare-fun m!1070475 () Bool)

(assert (=> b!1162279 m!1070475))

(declare-fun m!1070477 () Bool)

(assert (=> b!1162279 m!1070477))

(declare-fun m!1070479 () Bool)

(assert (=> b!1162279 m!1070479))

(declare-fun m!1070481 () Bool)

(assert (=> b!1162265 m!1070481))

(declare-fun m!1070483 () Bool)

(assert (=> b!1162265 m!1070483))

(declare-fun m!1070485 () Bool)

(assert (=> b!1162265 m!1070485))

(declare-fun m!1070487 () Bool)

(assert (=> b!1162265 m!1070487))

(declare-fun m!1070489 () Bool)

(assert (=> b!1162284 m!1070489))

(declare-fun m!1070491 () Bool)

(assert (=> bm!56662 m!1070491))

(declare-fun m!1070493 () Bool)

(assert (=> bm!56657 m!1070493))

(declare-fun m!1070495 () Bool)

(assert (=> start!98984 m!1070495))

(declare-fun m!1070497 () Bool)

(assert (=> start!98984 m!1070497))

(declare-fun m!1070499 () Bool)

(assert (=> b!1162271 m!1070499))

(declare-fun m!1070501 () Bool)

(assert (=> b!1162269 m!1070501))

(declare-fun m!1070503 () Bool)

(assert (=> b!1162274 m!1070503))

(declare-fun m!1070505 () Bool)

(assert (=> b!1162274 m!1070505))

(declare-fun m!1070507 () Bool)

(assert (=> bm!56659 m!1070507))

(declare-fun m!1070509 () Bool)

(assert (=> b!1162261 m!1070509))

(declare-fun m!1070511 () Bool)

(assert (=> b!1162283 m!1070511))

(declare-fun m!1070513 () Bool)

(assert (=> b!1162285 m!1070513))

(declare-fun m!1070515 () Bool)

(assert (=> b!1162262 m!1070515))

(declare-fun m!1070517 () Bool)

(assert (=> bm!56661 m!1070517))

(declare-fun m!1070519 () Bool)

(assert (=> b!1162263 m!1070519))

(assert (=> bm!56656 m!1070499))

(declare-fun m!1070521 () Bool)

(assert (=> b!1162280 m!1070521))

(declare-fun m!1070523 () Bool)

(assert (=> b!1162280 m!1070523))

(declare-fun m!1070525 () Bool)

(assert (=> b!1162282 m!1070525))

(declare-fun m!1070527 () Bool)

(assert (=> b!1162282 m!1070527))

(assert (=> b!1162259 m!1070515))

(declare-fun m!1070529 () Bool)

(assert (=> b!1162258 m!1070529))

(declare-fun m!1070531 () Bool)

(assert (=> b!1162258 m!1070531))

(declare-fun m!1070533 () Bool)

(assert (=> b!1162258 m!1070533))

(declare-fun m!1070535 () Bool)

(assert (=> b!1162258 m!1070535))

(declare-fun m!1070537 () Bool)

(assert (=> mapNonEmpty!45512 m!1070537))

(declare-fun m!1070539 () Bool)

(assert (=> b!1162277 m!1070539))

(declare-fun m!1070541 () Bool)

(assert (=> b!1162267 m!1070541))

(assert (=> b!1162267 m!1070525))

(declare-fun m!1070543 () Bool)

(assert (=> b!1162267 m!1070543))

(declare-fun m!1070545 () Bool)

(assert (=> b!1162267 m!1070545))

(assert (=> b!1162267 m!1070525))

(declare-fun m!1070547 () Bool)

(assert (=> b!1162267 m!1070547))

(assert (=> b!1162267 m!1070545))

(assert (=> b!1162267 m!1070525))

(assert (=> b!1162267 m!1070541))

(declare-fun m!1070549 () Bool)

(assert (=> b!1162267 m!1070549))

(assert (=> b!1162267 m!1070517))

(declare-fun m!1070551 () Bool)

(assert (=> b!1162267 m!1070551))

(declare-fun m!1070553 () Bool)

(assert (=> b!1162267 m!1070553))

(check-sat (not b!1162269) (not b!1162259) (not b!1162285) (not b!1162282) (not b!1162271) (not b!1162267) (not b!1162277) tp_is_empty!29125 (not b_next!24595) (not b!1162258) (not start!98984) (not b!1162265) (not b!1162263) b_and!40019 (not bm!56659) (not bm!56657) (not mapNonEmpty!45512) (not bm!56656) (not b!1162261) (not b!1162284) (not b_lambda!19683) (not b!1162280) (not b!1162279) (not b!1162274) (not bm!56661) (not bm!56662) (not b!1162262))
(check-sat b_and!40019 (not b_next!24595))
