; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98988 () Bool)

(assert start!98988)

(declare-fun b_free!24593 () Bool)

(declare-fun b_next!24593 () Bool)

(assert (=> start!98988 (= b_free!24593 (not b_next!24593))))

(declare-fun tp!86490 () Bool)

(declare-fun b_and!40035 () Bool)

(assert (=> start!98988 (= tp!86490 b_and!40035)))

(declare-fun b!1162290 () Bool)

(declare-fun e!660919 () Bool)

(declare-fun e!660905 () Bool)

(assert (=> b!1162290 (= e!660919 e!660905)))

(declare-fun res!771021 () Bool)

(assert (=> b!1162290 (=> (not res!771021) (not e!660905))))

(declare-datatypes ((array!75085 0))(
  ( (array!75086 (arr!36193 (Array (_ BitVec 32) (_ BitVec 64))) (size!36729 (_ BitVec 32))) )
))
(declare-fun lt!523307 () array!75085)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75085 (_ BitVec 32)) Bool)

(assert (=> b!1162290 (= res!771021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523307 mask!1564))))

(declare-fun _keys!1208 () array!75085)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162290 (= lt!523307 (array!75086 (store (arr!36193 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36729 _keys!1208)))))

(declare-fun e!660912 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1162291 () Bool)

(declare-datatypes ((V!43957 0))(
  ( (V!43958 (val!14618 Int)) )
))
(declare-datatypes ((tuple2!18632 0))(
  ( (tuple2!18633 (_1!9327 (_ BitVec 64)) (_2!9327 V!43957)) )
))
(declare-datatypes ((List!25366 0))(
  ( (Nil!25363) (Cons!25362 (h!26571 tuple2!18632) (t!36951 List!25366)) )
))
(declare-datatypes ((ListLongMap!16601 0))(
  ( (ListLongMap!16602 (toList!8316 List!25366)) )
))
(declare-fun call!56659 () ListLongMap!16601)

(declare-fun call!56664 () ListLongMap!16601)

(declare-fun -!1422 (ListLongMap!16601 (_ BitVec 64)) ListLongMap!16601)

(assert (=> b!1162291 (= e!660912 (= call!56664 (-!1422 call!56659 k!934)))))

(declare-fun b!1162292 () Bool)

(declare-datatypes ((Unit!38344 0))(
  ( (Unit!38345) )
))
(declare-fun e!660916 () Unit!38344)

(declare-fun Unit!38346 () Unit!38344)

(assert (=> b!1162292 (= e!660916 Unit!38346)))

(declare-fun b!1162293 () Bool)

(declare-fun e!660915 () Unit!38344)

(declare-fun lt!523303 () Unit!38344)

(assert (=> b!1162293 (= e!660915 lt!523303)))

(declare-fun call!56660 () Unit!38344)

(assert (=> b!1162293 (= lt!523303 call!56660)))

(declare-fun call!56663 () Bool)

(assert (=> b!1162293 call!56663))

(declare-fun b!1162294 () Bool)

(declare-fun res!771023 () Bool)

(assert (=> b!1162294 (=> (not res!771023) (not e!660919))))

(assert (=> b!1162294 (= res!771023 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36729 _keys!1208))))))

(declare-fun b!1162295 () Bool)

(declare-fun e!660918 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!75085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162295 (= e!660918 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162296 () Bool)

(declare-fun Unit!38347 () Unit!38344)

(assert (=> b!1162296 (= e!660916 Unit!38347)))

(declare-fun lt!523305 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1162296 (= lt!523305 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116196 () Bool)

(assert (=> b!1162296 (= c!116196 (and (not lt!523305) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523304 () Unit!38344)

(declare-fun e!660909 () Unit!38344)

(assert (=> b!1162296 (= lt!523304 e!660909)))

(declare-fun zeroValue!944 () V!43957)

(declare-datatypes ((ValueCell!13852 0))(
  ( (ValueCellFull!13852 (v!17255 V!43957)) (EmptyCell!13852) )
))
(declare-datatypes ((array!75087 0))(
  ( (array!75088 (arr!36194 (Array (_ BitVec 32) ValueCell!13852)) (size!36730 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75087)

(declare-fun minValue!944 () V!43957)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!523317 () Unit!38344)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!546 (array!75085 array!75087 (_ BitVec 32) (_ BitVec 32) V!43957 V!43957 (_ BitVec 64) (_ BitVec 32) Int) Unit!38344)

(assert (=> b!1162296 (= lt!523317 (lemmaListMapContainsThenArrayContainsFrom!546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116200 () Bool)

(assert (=> b!1162296 (= c!116200 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771019 () Bool)

(declare-fun e!660914 () Bool)

(assert (=> b!1162296 (= res!771019 e!660914)))

(assert (=> b!1162296 (=> (not res!771019) (not e!660918))))

(assert (=> b!1162296 e!660918))

(declare-fun lt!523322 () Unit!38344)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75085 (_ BitVec 32) (_ BitVec 32)) Unit!38344)

(assert (=> b!1162296 (= lt!523322 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25367 0))(
  ( (Nil!25364) (Cons!25363 (h!26572 (_ BitVec 64)) (t!36952 List!25367)) )
))
(declare-fun arrayNoDuplicates!0 (array!75085 (_ BitVec 32) List!25367) Bool)

(assert (=> b!1162296 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25364)))

(declare-fun lt!523320 () Unit!38344)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75085 (_ BitVec 64) (_ BitVec 32) List!25367) Unit!38344)

(assert (=> b!1162296 (= lt!523320 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25364))))

(assert (=> b!1162296 false))

(declare-fun b!1162297 () Bool)

(declare-fun e!660921 () Bool)

(declare-fun e!660911 () Bool)

(assert (=> b!1162297 (= e!660921 e!660911)))

(declare-fun res!771013 () Bool)

(assert (=> b!1162297 (=> res!771013 e!660911)))

(assert (=> b!1162297 (= res!771013 (not (= (select (arr!36193 _keys!1208) from!1455) k!934)))))

(assert (=> b!1162297 e!660912))

(declare-fun c!116197 () Bool)

(assert (=> b!1162297 (= c!116197 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523323 () Unit!38344)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!651 (array!75085 array!75087 (_ BitVec 32) (_ BitVec 32) V!43957 V!43957 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38344)

(assert (=> b!1162297 (= lt!523323 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162298 () Bool)

(declare-fun e!660913 () Bool)

(assert (=> b!1162298 (= e!660913 e!660921)))

(declare-fun res!771014 () Bool)

(assert (=> b!1162298 (=> res!771014 e!660921)))

(assert (=> b!1162298 (= res!771014 (not (= from!1455 i!673)))))

(declare-fun lt!523302 () ListLongMap!16601)

(declare-fun lt!523319 () array!75087)

(declare-fun getCurrentListMapNoExtraKeys!4780 (array!75085 array!75087 (_ BitVec 32) (_ BitVec 32) V!43957 V!43957 (_ BitVec 32) Int) ListLongMap!16601)

(assert (=> b!1162298 (= lt!523302 (getCurrentListMapNoExtraKeys!4780 lt!523307 lt!523319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523321 () V!43957)

(assert (=> b!1162298 (= lt!523319 (array!75088 (store (arr!36194 _values!996) i!673 (ValueCellFull!13852 lt!523321)) (size!36730 _values!996)))))

(declare-fun dynLambda!2776 (Int (_ BitVec 64)) V!43957)

(assert (=> b!1162298 (= lt!523321 (dynLambda!2776 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523316 () ListLongMap!16601)

(assert (=> b!1162298 (= lt!523316 (getCurrentListMapNoExtraKeys!4780 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162299 () Bool)

(assert (=> b!1162299 (= e!660914 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523305) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162300 () Bool)

(assert (=> b!1162300 call!56663))

(declare-fun lt!523315 () Unit!38344)

(assert (=> b!1162300 (= lt!523315 call!56660)))

(declare-fun e!660906 () Unit!38344)

(assert (=> b!1162300 (= e!660906 lt!523315)))

(declare-fun b!1162301 () Bool)

(declare-fun Unit!38348 () Unit!38344)

(assert (=> b!1162301 (= e!660906 Unit!38348)))

(declare-fun mapNonEmpty!45509 () Bool)

(declare-fun mapRes!45509 () Bool)

(declare-fun tp!86489 () Bool)

(declare-fun e!660917 () Bool)

(assert (=> mapNonEmpty!45509 (= mapRes!45509 (and tp!86489 e!660917))))

(declare-fun mapRest!45509 () (Array (_ BitVec 32) ValueCell!13852))

(declare-fun mapKey!45509 () (_ BitVec 32))

(declare-fun mapValue!45509 () ValueCell!13852)

(assert (=> mapNonEmpty!45509 (= (arr!36194 _values!996) (store mapRest!45509 mapKey!45509 mapValue!45509))))

(declare-fun b!1162302 () Bool)

(assert (=> b!1162302 (= e!660914 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45509 () Bool)

(assert (=> mapIsEmpty!45509 mapRes!45509))

(declare-fun bm!56655 () Bool)

(declare-fun call!56662 () Unit!38344)

(assert (=> bm!56655 (= call!56660 call!56662)))

(declare-fun b!1162303 () Bool)

(assert (=> b!1162303 (= e!660905 (not e!660913))))

(declare-fun res!771018 () Bool)

(assert (=> b!1162303 (=> res!771018 e!660913)))

(assert (=> b!1162303 (= res!771018 (bvsgt from!1455 i!673))))

(assert (=> b!1162303 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!523309 () Unit!38344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75085 (_ BitVec 64) (_ BitVec 32)) Unit!38344)

(assert (=> b!1162303 (= lt!523309 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1162304 () Bool)

(declare-fun res!771011 () Bool)

(assert (=> b!1162304 (=> (not res!771011) (not e!660919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162304 (= res!771011 (validMask!0 mask!1564))))

(declare-fun bm!56656 () Bool)

(declare-fun c!116199 () Bool)

(declare-fun lt!523311 () ListLongMap!16601)

(declare-fun lt!523314 () ListLongMap!16601)

(declare-fun addStillContains!961 (ListLongMap!16601 (_ BitVec 64) V!43957 (_ BitVec 64)) Unit!38344)

(assert (=> bm!56656 (= call!56662 (addStillContains!961 (ite c!116196 lt!523314 lt!523311) (ite c!116196 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116199 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116196 minValue!944 (ite c!116199 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1162305 () Bool)

(declare-fun res!771010 () Bool)

(assert (=> b!1162305 (=> (not res!771010) (not e!660905))))

(assert (=> b!1162305 (= res!771010 (arrayNoDuplicates!0 lt!523307 #b00000000000000000000000000000000 Nil!25364))))

(declare-fun b!1162306 () Bool)

(declare-fun res!771022 () Bool)

(assert (=> b!1162306 (=> (not res!771022) (not e!660919))))

(assert (=> b!1162306 (= res!771022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162307 () Bool)

(assert (=> b!1162307 (= e!660911 true)))

(declare-fun e!660910 () Bool)

(assert (=> b!1162307 e!660910))

(declare-fun res!771012 () Bool)

(assert (=> b!1162307 (=> (not res!771012) (not e!660910))))

(declare-fun lt!523308 () ListLongMap!16601)

(assert (=> b!1162307 (= res!771012 (= lt!523308 lt!523311))))

(assert (=> b!1162307 (= lt!523308 (-!1422 lt!523316 k!934))))

(declare-fun lt!523306 () V!43957)

(declare-fun +!3720 (ListLongMap!16601 tuple2!18632) ListLongMap!16601)

(assert (=> b!1162307 (= (-!1422 (+!3720 lt!523311 (tuple2!18633 (select (arr!36193 _keys!1208) from!1455) lt!523306)) (select (arr!36193 _keys!1208) from!1455)) lt!523311)))

(declare-fun lt!523318 () Unit!38344)

(declare-fun addThenRemoveForNewKeyIsSame!256 (ListLongMap!16601 (_ BitVec 64) V!43957) Unit!38344)

(assert (=> b!1162307 (= lt!523318 (addThenRemoveForNewKeyIsSame!256 lt!523311 (select (arr!36193 _keys!1208) from!1455) lt!523306))))

(declare-fun get!18466 (ValueCell!13852 V!43957) V!43957)

(assert (=> b!1162307 (= lt!523306 (get!18466 (select (arr!36194 _values!996) from!1455) lt!523321))))

(declare-fun lt!523310 () Unit!38344)

(assert (=> b!1162307 (= lt!523310 e!660916)))

(declare-fun c!116195 () Bool)

(declare-fun contains!6821 (ListLongMap!16601 (_ BitVec 64)) Bool)

(assert (=> b!1162307 (= c!116195 (contains!6821 lt!523311 k!934))))

(assert (=> b!1162307 (= lt!523311 (getCurrentListMapNoExtraKeys!4780 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162308 () Bool)

(declare-fun res!771020 () Bool)

(assert (=> b!1162308 (=> (not res!771020) (not e!660919))))

(assert (=> b!1162308 (= res!771020 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25364))))

(declare-fun b!1162309 () Bool)

(assert (=> b!1162309 (= e!660910 (= lt!523308 (getCurrentListMapNoExtraKeys!4780 lt!523307 lt!523319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56657 () Bool)

(declare-fun call!56658 () ListLongMap!16601)

(declare-fun call!56665 () ListLongMap!16601)

(assert (=> bm!56657 (= call!56658 call!56665)))

(declare-fun b!1162310 () Bool)

(assert (=> b!1162310 (= e!660915 e!660906)))

(declare-fun c!116198 () Bool)

(assert (=> b!1162310 (= c!116198 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523305))))

(declare-fun bm!56658 () Bool)

(assert (=> bm!56658 (= call!56665 (+!3720 lt!523311 (ite (or c!116196 c!116199) (tuple2!18633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1162311 () Bool)

(declare-fun e!660920 () Bool)

(declare-fun e!660908 () Bool)

(assert (=> b!1162311 (= e!660920 (and e!660908 mapRes!45509))))

(declare-fun condMapEmpty!45509 () Bool)

(declare-fun mapDefault!45509 () ValueCell!13852)

