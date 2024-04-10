; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98986 () Bool)

(assert start!98986)

(declare-fun b_free!24591 () Bool)

(declare-fun b_next!24591 () Bool)

(assert (=> start!98986 (= b_free!24591 (not b_next!24591))))

(declare-fun tp!86484 () Bool)

(declare-fun b_and!40031 () Bool)

(assert (=> start!98986 (= tp!86484 b_and!40031)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!660855 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!523241 () Bool)

(declare-fun b!1162198 () Bool)

(assert (=> b!1162198 (= e!660855 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523241) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162199 () Bool)

(declare-fun c!116182 () Bool)

(assert (=> b!1162199 (= c!116182 (and (not lt!523241) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38339 0))(
  ( (Unit!38340) )
))
(declare-fun e!660869 () Unit!38339)

(declare-fun e!660867 () Unit!38339)

(assert (=> b!1162199 (= e!660869 e!660867)))

(declare-fun b!1162200 () Bool)

(declare-fun e!660868 () Bool)

(declare-fun e!660856 () Bool)

(assert (=> b!1162200 (= e!660868 e!660856)))

(declare-fun res!770967 () Bool)

(assert (=> b!1162200 (=> res!770967 e!660856)))

(declare-datatypes ((array!75081 0))(
  ( (array!75082 (arr!36191 (Array (_ BitVec 32) (_ BitVec 64))) (size!36727 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75081)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1162200 (= res!770967 (not (= (select (arr!36191 _keys!1208) from!1455) k0!934)))))

(declare-fun e!660860 () Bool)

(assert (=> b!1162200 e!660860))

(declare-fun c!116179 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162200 (= c!116179 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43955 0))(
  ( (V!43956 (val!14617 Int)) )
))
(declare-fun zeroValue!944 () V!43955)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13851 0))(
  ( (ValueCellFull!13851 (v!17254 V!43955)) (EmptyCell!13851) )
))
(declare-datatypes ((array!75083 0))(
  ( (array!75084 (arr!36192 (Array (_ BitVec 32) ValueCell!13851)) (size!36728 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75083)

(declare-fun minValue!944 () V!43955)

(declare-fun lt!523236 () Unit!38339)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!650 (array!75081 array!75083 (_ BitVec 32) (_ BitVec 32) V!43955 V!43955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38339)

(assert (=> b!1162200 (= lt!523236 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162201 () Bool)

(declare-fun res!770964 () Bool)

(declare-fun e!660862 () Bool)

(assert (=> b!1162201 (=> (not res!770964) (not e!660862))))

(assert (=> b!1162201 (= res!770964 (and (= (size!36728 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36727 _keys!1208) (size!36728 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162202 () Bool)

(declare-fun res!770966 () Bool)

(assert (=> b!1162202 (=> (not res!770966) (not e!660862))))

(declare-datatypes ((List!25364 0))(
  ( (Nil!25361) (Cons!25360 (h!26569 (_ BitVec 64)) (t!36947 List!25364)) )
))
(declare-fun arrayNoDuplicates!0 (array!75081 (_ BitVec 32) List!25364) Bool)

(assert (=> b!1162202 (= res!770966 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25361))))

(declare-fun bm!56631 () Bool)

(declare-fun c!116181 () Bool)

(declare-datatypes ((tuple2!18630 0))(
  ( (tuple2!18631 (_1!9326 (_ BitVec 64)) (_2!9326 V!43955)) )
))
(declare-datatypes ((List!25365 0))(
  ( (Nil!25362) (Cons!25361 (h!26570 tuple2!18630) (t!36948 List!25365)) )
))
(declare-datatypes ((ListLongMap!16599 0))(
  ( (ListLongMap!16600 (toList!8315 List!25365)) )
))
(declare-fun call!56641 () ListLongMap!16599)

(declare-fun call!56637 () Bool)

(declare-fun lt!523238 () ListLongMap!16599)

(declare-fun contains!6820 (ListLongMap!16599 (_ BitVec 64)) Bool)

(assert (=> bm!56631 (= call!56637 (contains!6820 (ite c!116181 lt!523238 call!56641) k0!934))))

(declare-fun b!1162203 () Bool)

(declare-fun e!660857 () Unit!38339)

(assert (=> b!1162203 (= e!660867 e!660857)))

(declare-fun c!116178 () Bool)

(assert (=> b!1162203 (= c!116178 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523241))))

(declare-fun bm!56632 () Bool)

(declare-fun call!56639 () ListLongMap!16599)

(declare-fun lt!523249 () ListLongMap!16599)

(declare-fun +!3719 (ListLongMap!16599 tuple2!18630) ListLongMap!16599)

(assert (=> bm!56632 (= call!56639 (+!3719 (ite c!116181 lt!523238 lt!523249) (ite c!116181 (tuple2!18631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116182 (tuple2!18631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1162204 () Bool)

(assert (=> b!1162204 (contains!6820 call!56639 k0!934)))

(declare-fun lt!523255 () Unit!38339)

(declare-fun call!56635 () Unit!38339)

(assert (=> b!1162204 (= lt!523255 call!56635)))

(assert (=> b!1162204 call!56637))

(assert (=> b!1162204 (= lt!523238 (+!3719 lt!523249 (tuple2!18631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523245 () Unit!38339)

(declare-fun addStillContains!960 (ListLongMap!16599 (_ BitVec 64) V!43955 (_ BitVec 64)) Unit!38339)

(assert (=> b!1162204 (= lt!523245 (addStillContains!960 lt!523249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1162204 (= e!660869 lt!523255)))

(declare-fun bm!56633 () Bool)

(declare-fun call!56634 () Bool)

(assert (=> bm!56633 (= call!56634 call!56637)))

(declare-fun b!1162205 () Bool)

(declare-fun res!770970 () Bool)

(assert (=> b!1162205 (=> (not res!770970) (not e!660862))))

(assert (=> b!1162205 (= res!770970 (= (select (arr!36191 _keys!1208) i!673) k0!934))))

(declare-fun bm!56634 () Bool)

(assert (=> bm!56634 (= call!56635 (addStillContains!960 (ite c!116181 lt!523238 lt!523249) (ite c!116181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116182 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116181 minValue!944 (ite c!116182 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1162206 () Bool)

(declare-fun e!660861 () Bool)

(declare-fun tp_is_empty!29121 () Bool)

(assert (=> b!1162206 (= e!660861 tp_is_empty!29121)))

(declare-fun b!1162207 () Bool)

(declare-fun res!770976 () Bool)

(assert (=> b!1162207 (=> (not res!770976) (not e!660862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162207 (= res!770976 (validKeyInArray!0 k0!934))))

(declare-fun bm!56635 () Bool)

(declare-fun call!56640 () ListLongMap!16599)

(declare-fun lt!523243 () array!75081)

(declare-fun lt!523257 () array!75083)

(declare-fun getCurrentListMapNoExtraKeys!4779 (array!75081 array!75083 (_ BitVec 32) (_ BitVec 32) V!43955 V!43955 (_ BitVec 32) Int) ListLongMap!16599)

(assert (=> bm!56635 (= call!56640 (getCurrentListMapNoExtraKeys!4779 lt!523243 lt!523257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162208 () Bool)

(declare-fun e!660863 () Bool)

(declare-fun mapRes!45506 () Bool)

(assert (=> b!1162208 (= e!660863 (and e!660861 mapRes!45506))))

(declare-fun condMapEmpty!45506 () Bool)

(declare-fun mapDefault!45506 () ValueCell!13851)

(assert (=> b!1162208 (= condMapEmpty!45506 (= (arr!36192 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13851)) mapDefault!45506)))))

(declare-fun b!1162209 () Bool)

(declare-fun call!56638 () ListLongMap!16599)

(assert (=> b!1162209 (= e!660860 (= call!56640 call!56638))))

(declare-fun b!1162210 () Bool)

(declare-fun res!770978 () Bool)

(declare-fun e!660865 () Bool)

(assert (=> b!1162210 (=> (not res!770978) (not e!660865))))

(assert (=> b!1162210 (= res!770978 (arrayNoDuplicates!0 lt!523243 #b00000000000000000000000000000000 Nil!25361))))

(declare-fun b!1162211 () Bool)

(declare-fun res!770969 () Bool)

(assert (=> b!1162211 (=> (not res!770969) (not e!660862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75081 (_ BitVec 32)) Bool)

(assert (=> b!1162211 (= res!770969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45506 () Bool)

(assert (=> mapIsEmpty!45506 mapRes!45506))

(declare-fun b!1162212 () Bool)

(declare-fun e!660859 () Bool)

(assert (=> b!1162212 (= e!660865 (not e!660859))))

(declare-fun res!770972 () Bool)

(assert (=> b!1162212 (=> res!770972 e!660859)))

(assert (=> b!1162212 (= res!770972 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162212 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523250 () Unit!38339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75081 (_ BitVec 64) (_ BitVec 32)) Unit!38339)

(assert (=> b!1162212 (= lt!523250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162213 () Bool)

(declare-fun e!660864 () Unit!38339)

(declare-fun Unit!38341 () Unit!38339)

(assert (=> b!1162213 (= e!660864 Unit!38341)))

(assert (=> b!1162213 (= lt!523241 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162213 (= c!116181 (and (not lt!523241) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523252 () Unit!38339)

(assert (=> b!1162213 (= lt!523252 e!660869)))

(declare-fun lt!523239 () Unit!38339)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!545 (array!75081 array!75083 (_ BitVec 32) (_ BitVec 32) V!43955 V!43955 (_ BitVec 64) (_ BitVec 32) Int) Unit!38339)

(assert (=> b!1162213 (= lt!523239 (lemmaListMapContainsThenArrayContainsFrom!545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116177 () Bool)

(assert (=> b!1162213 (= c!116177 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770971 () Bool)

(assert (=> b!1162213 (= res!770971 e!660855)))

(declare-fun e!660866 () Bool)

(assert (=> b!1162213 (=> (not res!770971) (not e!660866))))

(assert (=> b!1162213 e!660866))

(declare-fun lt!523248 () Unit!38339)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75081 (_ BitVec 32) (_ BitVec 32)) Unit!38339)

(assert (=> b!1162213 (= lt!523248 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162213 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25361)))

(declare-fun lt!523256 () Unit!38339)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75081 (_ BitVec 64) (_ BitVec 32) List!25364) Unit!38339)

(assert (=> b!1162213 (= lt!523256 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25361))))

(assert (=> b!1162213 false))

(declare-fun b!1162214 () Bool)

(assert (=> b!1162214 (= e!660862 e!660865)))

(declare-fun res!770973 () Bool)

(assert (=> b!1162214 (=> (not res!770973) (not e!660865))))

(assert (=> b!1162214 (= res!770973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523243 mask!1564))))

(assert (=> b!1162214 (= lt!523243 (array!75082 (store (arr!36191 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36727 _keys!1208)))))

(declare-fun b!1162215 () Bool)

(declare-fun res!770965 () Bool)

(assert (=> b!1162215 (=> (not res!770965) (not e!660862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162215 (= res!770965 (validMask!0 mask!1564))))

(declare-fun b!1162216 () Bool)

(assert (=> b!1162216 (= e!660856 true)))

(declare-fun e!660858 () Bool)

(assert (=> b!1162216 e!660858))

(declare-fun res!770968 () Bool)

(assert (=> b!1162216 (=> (not res!770968) (not e!660858))))

(declare-fun lt!523244 () ListLongMap!16599)

(assert (=> b!1162216 (= res!770968 (= lt!523244 lt!523249))))

(declare-fun lt!523254 () ListLongMap!16599)

(declare-fun -!1421 (ListLongMap!16599 (_ BitVec 64)) ListLongMap!16599)

(assert (=> b!1162216 (= lt!523244 (-!1421 lt!523254 k0!934))))

(declare-fun lt!523251 () V!43955)

(assert (=> b!1162216 (= (-!1421 (+!3719 lt!523249 (tuple2!18631 (select (arr!36191 _keys!1208) from!1455) lt!523251)) (select (arr!36191 _keys!1208) from!1455)) lt!523249)))

(declare-fun lt!523247 () Unit!38339)

(declare-fun addThenRemoveForNewKeyIsSame!255 (ListLongMap!16599 (_ BitVec 64) V!43955) Unit!38339)

(assert (=> b!1162216 (= lt!523247 (addThenRemoveForNewKeyIsSame!255 lt!523249 (select (arr!36191 _keys!1208) from!1455) lt!523251))))

(declare-fun lt!523242 () V!43955)

(declare-fun get!18465 (ValueCell!13851 V!43955) V!43955)

(assert (=> b!1162216 (= lt!523251 (get!18465 (select (arr!36192 _values!996) from!1455) lt!523242))))

(declare-fun lt!523237 () Unit!38339)

(assert (=> b!1162216 (= lt!523237 e!660864)))

(declare-fun c!116180 () Bool)

(assert (=> b!1162216 (= c!116180 (contains!6820 lt!523249 k0!934))))

(assert (=> b!1162216 (= lt!523249 (getCurrentListMapNoExtraKeys!4779 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770975 () Bool)

(assert (=> start!98986 (=> (not res!770975) (not e!660862))))

(assert (=> start!98986 (= res!770975 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36727 _keys!1208))))))

(assert (=> start!98986 e!660862))

(assert (=> start!98986 tp_is_empty!29121))

(declare-fun array_inv!27694 (array!75081) Bool)

(assert (=> start!98986 (array_inv!27694 _keys!1208)))

(assert (=> start!98986 true))

(assert (=> start!98986 tp!86484))

(declare-fun array_inv!27695 (array!75083) Bool)

(assert (=> start!98986 (and (array_inv!27695 _values!996) e!660863)))

(declare-fun b!1162217 () Bool)

(assert (=> b!1162217 (= e!660860 (= call!56640 (-!1421 call!56638 k0!934)))))

(declare-fun b!1162218 () Bool)

(assert (=> b!1162218 (= e!660859 e!660868)))

(declare-fun res!770977 () Bool)

(assert (=> b!1162218 (=> res!770977 e!660868)))

(assert (=> b!1162218 (= res!770977 (not (= from!1455 i!673)))))

(declare-fun lt!523253 () ListLongMap!16599)

(assert (=> b!1162218 (= lt!523253 (getCurrentListMapNoExtraKeys!4779 lt!523243 lt!523257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1162218 (= lt!523257 (array!75084 (store (arr!36192 _values!996) i!673 (ValueCellFull!13851 lt!523242)) (size!36728 _values!996)))))

(declare-fun dynLambda!2775 (Int (_ BitVec 64)) V!43955)

(assert (=> b!1162218 (= lt!523242 (dynLambda!2775 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1162218 (= lt!523254 (getCurrentListMapNoExtraKeys!4779 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162219 () Bool)

(declare-fun Unit!38342 () Unit!38339)

(assert (=> b!1162219 (= e!660864 Unit!38342)))

(declare-fun bm!56636 () Bool)

(assert (=> bm!56636 (= call!56638 (getCurrentListMapNoExtraKeys!4779 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162220 () Bool)

(declare-fun res!770974 () Bool)

(assert (=> b!1162220 (=> (not res!770974) (not e!660862))))

(assert (=> b!1162220 (= res!770974 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36727 _keys!1208))))))

(declare-fun b!1162221 () Bool)

(assert (=> b!1162221 call!56634))

(declare-fun lt!523246 () Unit!38339)

(declare-fun call!56636 () Unit!38339)

(assert (=> b!1162221 (= lt!523246 call!56636)))

(assert (=> b!1162221 (= e!660857 lt!523246)))

(declare-fun b!1162222 () Bool)

(declare-fun Unit!38343 () Unit!38339)

(assert (=> b!1162222 (= e!660857 Unit!38343)))

(declare-fun bm!56637 () Bool)

(assert (=> bm!56637 (= call!56641 call!56639)))

(declare-fun bm!56638 () Bool)

(assert (=> bm!56638 (= call!56636 call!56635)))

(declare-fun b!1162223 () Bool)

(assert (=> b!1162223 (= e!660866 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45506 () Bool)

(declare-fun tp!86483 () Bool)

(declare-fun e!660854 () Bool)

(assert (=> mapNonEmpty!45506 (= mapRes!45506 (and tp!86483 e!660854))))

(declare-fun mapKey!45506 () (_ BitVec 32))

(declare-fun mapRest!45506 () (Array (_ BitVec 32) ValueCell!13851))

(declare-fun mapValue!45506 () ValueCell!13851)

(assert (=> mapNonEmpty!45506 (= (arr!36192 _values!996) (store mapRest!45506 mapKey!45506 mapValue!45506))))

(declare-fun b!1162224 () Bool)

(assert (=> b!1162224 (= e!660855 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162225 () Bool)

(declare-fun lt!523240 () Unit!38339)

(assert (=> b!1162225 (= e!660867 lt!523240)))

(assert (=> b!1162225 (= lt!523240 call!56636)))

(assert (=> b!1162225 call!56634))

(declare-fun b!1162226 () Bool)

(assert (=> b!1162226 (= e!660858 (= lt!523244 (getCurrentListMapNoExtraKeys!4779 lt!523243 lt!523257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162227 () Bool)

(assert (=> b!1162227 (= e!660854 tp_is_empty!29121)))

(assert (= (and start!98986 res!770975) b!1162215))

(assert (= (and b!1162215 res!770965) b!1162201))

(assert (= (and b!1162201 res!770964) b!1162211))

(assert (= (and b!1162211 res!770969) b!1162202))

(assert (= (and b!1162202 res!770966) b!1162220))

(assert (= (and b!1162220 res!770974) b!1162207))

(assert (= (and b!1162207 res!770976) b!1162205))

(assert (= (and b!1162205 res!770970) b!1162214))

(assert (= (and b!1162214 res!770973) b!1162210))

(assert (= (and b!1162210 res!770978) b!1162212))

(assert (= (and b!1162212 (not res!770972)) b!1162218))

(assert (= (and b!1162218 (not res!770977)) b!1162200))

(assert (= (and b!1162200 c!116179) b!1162217))

(assert (= (and b!1162200 (not c!116179)) b!1162209))

(assert (= (or b!1162217 b!1162209) bm!56636))

(assert (= (or b!1162217 b!1162209) bm!56635))

(assert (= (and b!1162200 (not res!770967)) b!1162216))

(assert (= (and b!1162216 c!116180) b!1162213))

(assert (= (and b!1162216 (not c!116180)) b!1162219))

(assert (= (and b!1162213 c!116181) b!1162204))

(assert (= (and b!1162213 (not c!116181)) b!1162199))

(assert (= (and b!1162199 c!116182) b!1162225))

(assert (= (and b!1162199 (not c!116182)) b!1162203))

(assert (= (and b!1162203 c!116178) b!1162221))

(assert (= (and b!1162203 (not c!116178)) b!1162222))

(assert (= (or b!1162225 b!1162221) bm!56638))

(assert (= (or b!1162225 b!1162221) bm!56637))

(assert (= (or b!1162225 b!1162221) bm!56633))

(assert (= (or b!1162204 bm!56633) bm!56631))

(assert (= (or b!1162204 bm!56638) bm!56634))

(assert (= (or b!1162204 bm!56637) bm!56632))

(assert (= (and b!1162213 c!116177) b!1162224))

(assert (= (and b!1162213 (not c!116177)) b!1162198))

(assert (= (and b!1162213 res!770971) b!1162223))

(assert (= (and b!1162216 res!770968) b!1162226))

(assert (= (and b!1162208 condMapEmpty!45506) mapIsEmpty!45506))

(assert (= (and b!1162208 (not condMapEmpty!45506)) mapNonEmpty!45506))

(get-info :version)

(assert (= (and mapNonEmpty!45506 ((_ is ValueCellFull!13851) mapValue!45506)) b!1162227))

(assert (= (and b!1162208 ((_ is ValueCellFull!13851) mapDefault!45506)) b!1162206))

(assert (= start!98986 b!1162208))

(declare-fun b_lambda!19697 () Bool)

(assert (=> (not b_lambda!19697) (not b!1162218)))

(declare-fun t!36946 () Bool)

(declare-fun tb!9403 () Bool)

(assert (=> (and start!98986 (= defaultEntry!1004 defaultEntry!1004) t!36946) tb!9403))

(declare-fun result!19371 () Bool)

(assert (=> tb!9403 (= result!19371 tp_is_empty!29121)))

(assert (=> b!1162218 t!36946))

(declare-fun b_and!40033 () Bool)

(assert (= b_and!40031 (and (=> t!36946 result!19371) b_and!40033)))

(declare-fun m!1070925 () Bool)

(assert (=> b!1162224 m!1070925))

(declare-fun m!1070927 () Bool)

(assert (=> b!1162212 m!1070927))

(declare-fun m!1070929 () Bool)

(assert (=> b!1162212 m!1070929))

(declare-fun m!1070931 () Bool)

(assert (=> bm!56634 m!1070931))

(declare-fun m!1070933 () Bool)

(assert (=> bm!56636 m!1070933))

(declare-fun m!1070935 () Bool)

(assert (=> b!1162217 m!1070935))

(declare-fun m!1070937 () Bool)

(assert (=> start!98986 m!1070937))

(declare-fun m!1070939 () Bool)

(assert (=> start!98986 m!1070939))

(declare-fun m!1070941 () Bool)

(assert (=> b!1162218 m!1070941))

(declare-fun m!1070943 () Bool)

(assert (=> b!1162218 m!1070943))

(declare-fun m!1070945 () Bool)

(assert (=> b!1162218 m!1070945))

(declare-fun m!1070947 () Bool)

(assert (=> b!1162218 m!1070947))

(declare-fun m!1070949 () Bool)

(assert (=> b!1162211 m!1070949))

(declare-fun m!1070951 () Bool)

(assert (=> b!1162215 m!1070951))

(assert (=> b!1162223 m!1070925))

(declare-fun m!1070953 () Bool)

(assert (=> b!1162207 m!1070953))

(declare-fun m!1070955 () Bool)

(assert (=> b!1162226 m!1070955))

(declare-fun m!1070957 () Bool)

(assert (=> b!1162213 m!1070957))

(declare-fun m!1070959 () Bool)

(assert (=> b!1162213 m!1070959))

(declare-fun m!1070961 () Bool)

(assert (=> b!1162213 m!1070961))

(declare-fun m!1070963 () Bool)

(assert (=> b!1162213 m!1070963))

(assert (=> b!1162216 m!1070933))

(declare-fun m!1070965 () Bool)

(assert (=> b!1162216 m!1070965))

(declare-fun m!1070967 () Bool)

(assert (=> b!1162216 m!1070967))

(assert (=> b!1162216 m!1070967))

(declare-fun m!1070969 () Bool)

(assert (=> b!1162216 m!1070969))

(declare-fun m!1070971 () Bool)

(assert (=> b!1162216 m!1070971))

(declare-fun m!1070973 () Bool)

(assert (=> b!1162216 m!1070973))

(assert (=> b!1162216 m!1070969))

(declare-fun m!1070975 () Bool)

(assert (=> b!1162216 m!1070975))

(assert (=> b!1162216 m!1070965))

(declare-fun m!1070977 () Bool)

(assert (=> b!1162216 m!1070977))

(assert (=> b!1162216 m!1070969))

(declare-fun m!1070979 () Bool)

(assert (=> b!1162216 m!1070979))

(declare-fun m!1070981 () Bool)

(assert (=> b!1162204 m!1070981))

(declare-fun m!1070983 () Bool)

(assert (=> b!1162204 m!1070983))

(declare-fun m!1070985 () Bool)

(assert (=> b!1162204 m!1070985))

(assert (=> b!1162200 m!1070969))

(declare-fun m!1070987 () Bool)

(assert (=> b!1162200 m!1070987))

(declare-fun m!1070989 () Bool)

(assert (=> b!1162205 m!1070989))

(declare-fun m!1070991 () Bool)

(assert (=> bm!56632 m!1070991))

(declare-fun m!1070993 () Bool)

(assert (=> b!1162210 m!1070993))

(declare-fun m!1070995 () Bool)

(assert (=> mapNonEmpty!45506 m!1070995))

(declare-fun m!1070997 () Bool)

(assert (=> b!1162214 m!1070997))

(declare-fun m!1070999 () Bool)

(assert (=> b!1162214 m!1070999))

(declare-fun m!1071001 () Bool)

(assert (=> bm!56631 m!1071001))

(declare-fun m!1071003 () Bool)

(assert (=> b!1162202 m!1071003))

(assert (=> bm!56635 m!1070955))

(check-sat (not b!1162217) (not b!1162216) (not b!1162210) (not b!1162214) (not b!1162212) (not bm!56631) (not bm!56635) (not b!1162224) (not b!1162202) tp_is_empty!29121 (not b!1162226) (not b!1162200) (not b!1162213) (not b_lambda!19697) (not mapNonEmpty!45506) (not bm!56636) (not b!1162215) b_and!40033 (not start!98986) (not bm!56632) (not b!1162223) (not bm!56634) (not b!1162207) (not b!1162218) (not b_next!24591) (not b!1162211) (not b!1162204))
(check-sat b_and!40033 (not b_next!24591))
