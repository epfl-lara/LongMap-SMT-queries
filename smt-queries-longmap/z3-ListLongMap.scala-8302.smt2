; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101162 () Bool)

(assert start!101162)

(declare-fun b_free!26085 () Bool)

(declare-fun b_next!26085 () Bool)

(assert (=> start!101162 (= b_free!26085 (not b_next!26085))))

(declare-fun tp!91277 () Bool)

(declare-fun b_and!43287 () Bool)

(assert (=> start!101162 (= tp!91277 b_and!43287)))

(declare-fun b!1213936 () Bool)

(declare-fun e!689404 () Bool)

(declare-datatypes ((V!46179 0))(
  ( (V!46180 (val!15451 Int)) )
))
(declare-datatypes ((tuple2!19862 0))(
  ( (tuple2!19863 (_1!9942 (_ BitVec 64)) (_2!9942 V!46179)) )
))
(declare-datatypes ((List!26660 0))(
  ( (Nil!26657) (Cons!26656 (h!27865 tuple2!19862) (t!39725 List!26660)) )
))
(declare-datatypes ((ListLongMap!17831 0))(
  ( (ListLongMap!17832 (toList!8931 List!26660)) )
))
(declare-fun call!60503 () ListLongMap!17831)

(declare-fun call!60505 () ListLongMap!17831)

(assert (=> b!1213936 (= e!689404 (= call!60503 call!60505))))

(declare-fun mapIsEmpty!48058 () Bool)

(declare-fun mapRes!48058 () Bool)

(assert (=> mapIsEmpty!48058 mapRes!48058))

(declare-fun b!1213937 () Bool)

(declare-fun call!60506 () ListLongMap!17831)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!7001 (ListLongMap!17831 (_ BitVec 64)) Bool)

(assert (=> b!1213937 (contains!7001 call!60506 k0!934)))

(declare-datatypes ((Unit!40255 0))(
  ( (Unit!40256) )
))
(declare-fun lt!552031 () Unit!40255)

(declare-fun lt!552040 () ListLongMap!17831)

(declare-fun minValue!944 () V!46179)

(declare-fun addStillContains!1071 (ListLongMap!17831 (_ BitVec 64) V!46179 (_ BitVec 64)) Unit!40255)

(assert (=> b!1213937 (= lt!552031 (addStillContains!1071 lt!552040 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!60507 () Bool)

(assert (=> b!1213937 call!60507))

(declare-fun lt!552037 () ListLongMap!17831)

(declare-fun zeroValue!944 () V!46179)

(declare-fun +!4043 (ListLongMap!17831 tuple2!19862) ListLongMap!17831)

(assert (=> b!1213937 (= lt!552040 (+!4043 lt!552037 (tuple2!19863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!552027 () Unit!40255)

(declare-fun call!60504 () Unit!40255)

(assert (=> b!1213937 (= lt!552027 call!60504)))

(declare-fun e!689406 () Unit!40255)

(assert (=> b!1213937 (= e!689406 lt!552031)))

(declare-fun bm!60500 () Bool)

(declare-fun c!119973 () Bool)

(declare-fun call!60508 () ListLongMap!17831)

(assert (=> bm!60500 (= call!60507 (contains!7001 (ite c!119973 lt!552040 call!60508) k0!934))))

(declare-fun b!1213938 () Bool)

(declare-fun e!689409 () Bool)

(assert (=> b!1213938 (= e!689409 true)))

(declare-fun e!689396 () Bool)

(assert (=> b!1213938 e!689396))

(declare-fun res!805990 () Bool)

(assert (=> b!1213938 (=> (not res!805990) (not e!689396))))

(declare-fun lt!552039 () ListLongMap!17831)

(assert (=> b!1213938 (= res!805990 (= lt!552039 lt!552037))))

(declare-fun lt!552043 () ListLongMap!17831)

(declare-fun -!1876 (ListLongMap!17831 (_ BitVec 64)) ListLongMap!17831)

(assert (=> b!1213938 (= lt!552039 (-!1876 lt!552043 k0!934))))

(declare-datatypes ((array!78365 0))(
  ( (array!78366 (arr!37817 (Array (_ BitVec 32) (_ BitVec 64))) (size!38353 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78365)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!552041 () V!46179)

(assert (=> b!1213938 (= (-!1876 (+!4043 lt!552037 (tuple2!19863 (select (arr!37817 _keys!1208) from!1455) lt!552041)) (select (arr!37817 _keys!1208) from!1455)) lt!552037)))

(declare-fun lt!552038 () Unit!40255)

(declare-fun addThenRemoveForNewKeyIsSame!287 (ListLongMap!17831 (_ BitVec 64) V!46179) Unit!40255)

(assert (=> b!1213938 (= lt!552038 (addThenRemoveForNewKeyIsSame!287 lt!552037 (select (arr!37817 _keys!1208) from!1455) lt!552041))))

(declare-datatypes ((ValueCell!14685 0))(
  ( (ValueCellFull!14685 (v!18104 V!46179)) (EmptyCell!14685) )
))
(declare-datatypes ((array!78367 0))(
  ( (array!78368 (arr!37818 (Array (_ BitVec 32) ValueCell!14685)) (size!38354 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78367)

(declare-fun lt!552036 () V!46179)

(declare-fun get!19278 (ValueCell!14685 V!46179) V!46179)

(assert (=> b!1213938 (= lt!552041 (get!19278 (select (arr!37818 _values!996) from!1455) lt!552036))))

(declare-fun lt!552029 () Unit!40255)

(declare-fun e!689400 () Unit!40255)

(assert (=> b!1213938 (= lt!552029 e!689400)))

(declare-fun c!119971 () Bool)

(assert (=> b!1213938 (= c!119971 (contains!7001 lt!552037 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5358 (array!78365 array!78367 (_ BitVec 32) (_ BitVec 32) V!46179 V!46179 (_ BitVec 32) Int) ListLongMap!17831)

(assert (=> b!1213938 (= lt!552037 (getCurrentListMapNoExtraKeys!5358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213940 () Bool)

(declare-fun res!805981 () Bool)

(declare-fun e!689410 () Bool)

(assert (=> b!1213940 (=> (not res!805981) (not e!689410))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213940 (= res!805981 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38353 _keys!1208))))))

(declare-fun b!1213941 () Bool)

(declare-fun e!689397 () Bool)

(declare-fun tp_is_empty!30789 () Bool)

(assert (=> b!1213941 (= e!689397 tp_is_empty!30789)))

(declare-fun b!1213942 () Bool)

(declare-fun e!689403 () Unit!40255)

(declare-fun lt!552035 () Unit!40255)

(assert (=> b!1213942 (= e!689403 lt!552035)))

(declare-fun call!60509 () Unit!40255)

(assert (=> b!1213942 (= lt!552035 call!60509)))

(declare-fun call!60510 () Bool)

(assert (=> b!1213942 call!60510))

(declare-fun b!1213943 () Bool)

(declare-fun Unit!40257 () Unit!40255)

(assert (=> b!1213943 (= e!689400 Unit!40257)))

(declare-fun lt!552033 () Bool)

(assert (=> b!1213943 (= lt!552033 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213943 (= c!119973 (and (not lt!552033) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552045 () Unit!40255)

(assert (=> b!1213943 (= lt!552045 e!689406)))

(declare-fun lt!552044 () Unit!40255)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!619 (array!78365 array!78367 (_ BitVec 32) (_ BitVec 32) V!46179 V!46179 (_ BitVec 64) (_ BitVec 32) Int) Unit!40255)

(assert (=> b!1213943 (= lt!552044 (lemmaListMapContainsThenArrayContainsFrom!619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119976 () Bool)

(assert (=> b!1213943 (= c!119976 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805980 () Bool)

(declare-fun e!689408 () Bool)

(assert (=> b!1213943 (= res!805980 e!689408)))

(declare-fun e!689399 () Bool)

(assert (=> b!1213943 (=> (not res!805980) (not e!689399))))

(assert (=> b!1213943 e!689399))

(declare-fun lt!552030 () Unit!40255)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78365 (_ BitVec 32) (_ BitVec 32)) Unit!40255)

(assert (=> b!1213943 (= lt!552030 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26661 0))(
  ( (Nil!26658) (Cons!26657 (h!27866 (_ BitVec 64)) (t!39726 List!26661)) )
))
(declare-fun arrayNoDuplicates!0 (array!78365 (_ BitVec 32) List!26661) Bool)

(assert (=> b!1213943 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26658)))

(declare-fun lt!552046 () Unit!40255)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78365 (_ BitVec 64) (_ BitVec 32) List!26661) Unit!40255)

(assert (=> b!1213943 (= lt!552046 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26658))))

(assert (=> b!1213943 false))

(declare-fun b!1213944 () Bool)

(declare-fun Unit!40258 () Unit!40255)

(assert (=> b!1213944 (= e!689400 Unit!40258)))

(declare-fun b!1213945 () Bool)

(declare-fun res!805987 () Bool)

(assert (=> b!1213945 (=> (not res!805987) (not e!689410))))

(assert (=> b!1213945 (= res!805987 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26658))))

(declare-fun b!1213946 () Bool)

(declare-fun e!689398 () Bool)

(assert (=> b!1213946 (= e!689398 tp_is_empty!30789)))

(declare-fun b!1213947 () Bool)

(declare-fun c!119974 () Bool)

(assert (=> b!1213947 (= c!119974 (and (not lt!552033) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213947 (= e!689406 e!689403)))

(declare-fun b!1213948 () Bool)

(declare-fun arrayContainsKey!0 (array!78365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213948 (= e!689408 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213949 () Bool)

(declare-fun res!805982 () Bool)

(assert (=> b!1213949 (=> (not res!805982) (not e!689410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213949 (= res!805982 (validMask!0 mask!1564))))

(declare-fun b!1213950 () Bool)

(declare-fun e!689395 () Bool)

(declare-fun e!689402 () Bool)

(assert (=> b!1213950 (= e!689395 (not e!689402))))

(declare-fun res!805993 () Bool)

(assert (=> b!1213950 (=> res!805993 e!689402)))

(assert (=> b!1213950 (= res!805993 (bvsgt from!1455 i!673))))

(assert (=> b!1213950 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552047 () Unit!40255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78365 (_ BitVec 64) (_ BitVec 32)) Unit!40255)

(assert (=> b!1213950 (= lt!552047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!60501 () Bool)

(assert (=> bm!60501 (= call!60506 (+!4043 (ite c!119973 lt!552040 lt!552037) (ite c!119973 (tuple2!19863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119974 (tuple2!19863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1213951 () Bool)

(declare-fun res!805986 () Bool)

(assert (=> b!1213951 (=> (not res!805986) (not e!689410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78365 (_ BitVec 32)) Bool)

(assert (=> b!1213951 (= res!805986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213952 () Bool)

(declare-fun res!805991 () Bool)

(assert (=> b!1213952 (=> (not res!805991) (not e!689410))))

(assert (=> b!1213952 (= res!805991 (and (= (size!38354 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38353 _keys!1208) (size!38354 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213953 () Bool)

(assert (=> b!1213953 (= e!689408 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552033) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60502 () Bool)

(assert (=> bm!60502 (= call!60509 call!60504)))

(declare-fun b!1213954 () Bool)

(assert (=> b!1213954 (= e!689399 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213955 () Bool)

(declare-fun e!689401 () Bool)

(assert (=> b!1213955 (= e!689401 e!689409)))

(declare-fun res!805992 () Bool)

(assert (=> b!1213955 (=> res!805992 e!689409)))

(assert (=> b!1213955 (= res!805992 (not (= (select (arr!37817 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213955 e!689404))

(declare-fun c!119972 () Bool)

(assert (=> b!1213955 (= c!119972 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552048 () Unit!40255)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1083 (array!78365 array!78367 (_ BitVec 32) (_ BitVec 32) V!46179 V!46179 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40255)

(assert (=> b!1213955 (= lt!552048 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60503 () Bool)

(assert (=> bm!60503 (= call!60504 (addStillContains!1071 lt!552037 (ite (or c!119973 c!119974) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119973 c!119974) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1213956 () Bool)

(declare-fun res!805994 () Bool)

(assert (=> b!1213956 (=> (not res!805994) (not e!689395))))

(declare-fun lt!552034 () array!78365)

(assert (=> b!1213956 (= res!805994 (arrayNoDuplicates!0 lt!552034 #b00000000000000000000000000000000 Nil!26658))))

(declare-fun b!1213957 () Bool)

(assert (=> b!1213957 call!60510))

(declare-fun lt!552032 () Unit!40255)

(assert (=> b!1213957 (= lt!552032 call!60509)))

(declare-fun e!689407 () Unit!40255)

(assert (=> b!1213957 (= e!689407 lt!552032)))

(declare-fun res!805984 () Bool)

(assert (=> start!101162 (=> (not res!805984) (not e!689410))))

(assert (=> start!101162 (= res!805984 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38353 _keys!1208))))))

(assert (=> start!101162 e!689410))

(assert (=> start!101162 tp_is_empty!30789))

(declare-fun array_inv!28798 (array!78365) Bool)

(assert (=> start!101162 (array_inv!28798 _keys!1208)))

(assert (=> start!101162 true))

(assert (=> start!101162 tp!91277))

(declare-fun e!689394 () Bool)

(declare-fun array_inv!28799 (array!78367) Bool)

(assert (=> start!101162 (and (array_inv!28799 _values!996) e!689394)))

(declare-fun b!1213939 () Bool)

(declare-fun lt!552028 () array!78367)

(assert (=> b!1213939 (= e!689396 (= lt!552039 (getCurrentListMapNoExtraKeys!5358 lt!552034 lt!552028 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!60504 () Bool)

(assert (=> bm!60504 (= call!60505 (getCurrentListMapNoExtraKeys!5358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213958 () Bool)

(assert (=> b!1213958 (= e!689394 (and e!689398 mapRes!48058))))

(declare-fun condMapEmpty!48058 () Bool)

(declare-fun mapDefault!48058 () ValueCell!14685)

(assert (=> b!1213958 (= condMapEmpty!48058 (= (arr!37818 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14685)) mapDefault!48058)))))

(declare-fun b!1213959 () Bool)

(assert (=> b!1213959 (= e!689410 e!689395)))

(declare-fun res!805983 () Bool)

(assert (=> b!1213959 (=> (not res!805983) (not e!689395))))

(assert (=> b!1213959 (= res!805983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552034 mask!1564))))

(assert (=> b!1213959 (= lt!552034 (array!78366 (store (arr!37817 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38353 _keys!1208)))))

(declare-fun b!1213960 () Bool)

(declare-fun Unit!40259 () Unit!40255)

(assert (=> b!1213960 (= e!689407 Unit!40259)))

(declare-fun b!1213961 () Bool)

(assert (=> b!1213961 (= e!689402 e!689401)))

(declare-fun res!805988 () Bool)

(assert (=> b!1213961 (=> res!805988 e!689401)))

(assert (=> b!1213961 (= res!805988 (not (= from!1455 i!673)))))

(declare-fun lt!552042 () ListLongMap!17831)

(assert (=> b!1213961 (= lt!552042 (getCurrentListMapNoExtraKeys!5358 lt!552034 lt!552028 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1213961 (= lt!552028 (array!78368 (store (arr!37818 _values!996) i!673 (ValueCellFull!14685 lt!552036)) (size!38354 _values!996)))))

(declare-fun dynLambda!3248 (Int (_ BitVec 64)) V!46179)

(assert (=> b!1213961 (= lt!552036 (dynLambda!3248 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1213961 (= lt!552043 (getCurrentListMapNoExtraKeys!5358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48058 () Bool)

(declare-fun tp!91276 () Bool)

(assert (=> mapNonEmpty!48058 (= mapRes!48058 (and tp!91276 e!689397))))

(declare-fun mapRest!48058 () (Array (_ BitVec 32) ValueCell!14685))

(declare-fun mapValue!48058 () ValueCell!14685)

(declare-fun mapKey!48058 () (_ BitVec 32))

(assert (=> mapNonEmpty!48058 (= (arr!37818 _values!996) (store mapRest!48058 mapKey!48058 mapValue!48058))))

(declare-fun b!1213962 () Bool)

(assert (=> b!1213962 (= e!689403 e!689407)))

(declare-fun c!119975 () Bool)

(assert (=> b!1213962 (= c!119975 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552033))))

(declare-fun b!1213963 () Bool)

(assert (=> b!1213963 (= e!689404 (= call!60503 (-!1876 call!60505 k0!934)))))

(declare-fun b!1213964 () Bool)

(declare-fun res!805985 () Bool)

(assert (=> b!1213964 (=> (not res!805985) (not e!689410))))

(assert (=> b!1213964 (= res!805985 (= (select (arr!37817 _keys!1208) i!673) k0!934))))

(declare-fun bm!60505 () Bool)

(assert (=> bm!60505 (= call!60510 call!60507)))

(declare-fun bm!60506 () Bool)

(assert (=> bm!60506 (= call!60508 call!60506)))

(declare-fun bm!60507 () Bool)

(assert (=> bm!60507 (= call!60503 (getCurrentListMapNoExtraKeys!5358 lt!552034 lt!552028 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213965 () Bool)

(declare-fun res!805989 () Bool)

(assert (=> b!1213965 (=> (not res!805989) (not e!689410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213965 (= res!805989 (validKeyInArray!0 k0!934))))

(assert (= (and start!101162 res!805984) b!1213949))

(assert (= (and b!1213949 res!805982) b!1213952))

(assert (= (and b!1213952 res!805991) b!1213951))

(assert (= (and b!1213951 res!805986) b!1213945))

(assert (= (and b!1213945 res!805987) b!1213940))

(assert (= (and b!1213940 res!805981) b!1213965))

(assert (= (and b!1213965 res!805989) b!1213964))

(assert (= (and b!1213964 res!805985) b!1213959))

(assert (= (and b!1213959 res!805983) b!1213956))

(assert (= (and b!1213956 res!805994) b!1213950))

(assert (= (and b!1213950 (not res!805993)) b!1213961))

(assert (= (and b!1213961 (not res!805988)) b!1213955))

(assert (= (and b!1213955 c!119972) b!1213963))

(assert (= (and b!1213955 (not c!119972)) b!1213936))

(assert (= (or b!1213963 b!1213936) bm!60507))

(assert (= (or b!1213963 b!1213936) bm!60504))

(assert (= (and b!1213955 (not res!805992)) b!1213938))

(assert (= (and b!1213938 c!119971) b!1213943))

(assert (= (and b!1213938 (not c!119971)) b!1213944))

(assert (= (and b!1213943 c!119973) b!1213937))

(assert (= (and b!1213943 (not c!119973)) b!1213947))

(assert (= (and b!1213947 c!119974) b!1213942))

(assert (= (and b!1213947 (not c!119974)) b!1213962))

(assert (= (and b!1213962 c!119975) b!1213957))

(assert (= (and b!1213962 (not c!119975)) b!1213960))

(assert (= (or b!1213942 b!1213957) bm!60502))

(assert (= (or b!1213942 b!1213957) bm!60506))

(assert (= (or b!1213942 b!1213957) bm!60505))

(assert (= (or b!1213937 bm!60505) bm!60500))

(assert (= (or b!1213937 bm!60502) bm!60503))

(assert (= (or b!1213937 bm!60506) bm!60501))

(assert (= (and b!1213943 c!119976) b!1213948))

(assert (= (and b!1213943 (not c!119976)) b!1213953))

(assert (= (and b!1213943 res!805980) b!1213954))

(assert (= (and b!1213938 res!805990) b!1213939))

(assert (= (and b!1213958 condMapEmpty!48058) mapIsEmpty!48058))

(assert (= (and b!1213958 (not condMapEmpty!48058)) mapNonEmpty!48058))

(get-info :version)

(assert (= (and mapNonEmpty!48058 ((_ is ValueCellFull!14685) mapValue!48058)) b!1213941))

(assert (= (and b!1213958 ((_ is ValueCellFull!14685) mapDefault!48058)) b!1213946))

(assert (= start!101162 b!1213958))

(declare-fun b_lambda!21761 () Bool)

(assert (=> (not b_lambda!21761) (not b!1213961)))

(declare-fun t!39724 () Bool)

(declare-fun tb!10885 () Bool)

(assert (=> (and start!101162 (= defaultEntry!1004 defaultEntry!1004) t!39724) tb!10885))

(declare-fun result!22367 () Bool)

(assert (=> tb!10885 (= result!22367 tp_is_empty!30789)))

(assert (=> b!1213961 t!39724))

(declare-fun b_and!43289 () Bool)

(assert (= b_and!43287 (and (=> t!39724 result!22367) b_and!43289)))

(declare-fun m!1119179 () Bool)

(assert (=> bm!60507 m!1119179))

(declare-fun m!1119181 () Bool)

(assert (=> b!1213938 m!1119181))

(declare-fun m!1119183 () Bool)

(assert (=> b!1213938 m!1119183))

(declare-fun m!1119185 () Bool)

(assert (=> b!1213938 m!1119185))

(declare-fun m!1119187 () Bool)

(assert (=> b!1213938 m!1119187))

(declare-fun m!1119189 () Bool)

(assert (=> b!1213938 m!1119189))

(declare-fun m!1119191 () Bool)

(assert (=> b!1213938 m!1119191))

(assert (=> b!1213938 m!1119189))

(assert (=> b!1213938 m!1119181))

(declare-fun m!1119193 () Bool)

(assert (=> b!1213938 m!1119193))

(assert (=> b!1213938 m!1119193))

(assert (=> b!1213938 m!1119189))

(declare-fun m!1119195 () Bool)

(assert (=> b!1213938 m!1119195))

(declare-fun m!1119197 () Bool)

(assert (=> b!1213938 m!1119197))

(declare-fun m!1119199 () Bool)

(assert (=> b!1213954 m!1119199))

(declare-fun m!1119201 () Bool)

(assert (=> b!1213951 m!1119201))

(declare-fun m!1119203 () Bool)

(assert (=> b!1213937 m!1119203))

(declare-fun m!1119205 () Bool)

(assert (=> b!1213937 m!1119205))

(declare-fun m!1119207 () Bool)

(assert (=> b!1213937 m!1119207))

(declare-fun m!1119209 () Bool)

(assert (=> start!101162 m!1119209))

(declare-fun m!1119211 () Bool)

(assert (=> start!101162 m!1119211))

(declare-fun m!1119213 () Bool)

(assert (=> b!1213945 m!1119213))

(declare-fun m!1119215 () Bool)

(assert (=> bm!60501 m!1119215))

(declare-fun m!1119217 () Bool)

(assert (=> b!1213965 m!1119217))

(assert (=> b!1213955 m!1119189))

(declare-fun m!1119219 () Bool)

(assert (=> b!1213955 m!1119219))

(assert (=> b!1213948 m!1119199))

(declare-fun m!1119221 () Bool)

(assert (=> bm!60500 m!1119221))

(assert (=> b!1213939 m!1119179))

(declare-fun m!1119223 () Bool)

(assert (=> b!1213964 m!1119223))

(declare-fun m!1119225 () Bool)

(assert (=> b!1213943 m!1119225))

(declare-fun m!1119227 () Bool)

(assert (=> b!1213943 m!1119227))

(declare-fun m!1119229 () Bool)

(assert (=> b!1213943 m!1119229))

(declare-fun m!1119231 () Bool)

(assert (=> b!1213943 m!1119231))

(declare-fun m!1119233 () Bool)

(assert (=> mapNonEmpty!48058 m!1119233))

(declare-fun m!1119235 () Bool)

(assert (=> b!1213961 m!1119235))

(declare-fun m!1119237 () Bool)

(assert (=> b!1213961 m!1119237))

(declare-fun m!1119239 () Bool)

(assert (=> b!1213961 m!1119239))

(declare-fun m!1119241 () Bool)

(assert (=> b!1213961 m!1119241))

(declare-fun m!1119243 () Bool)

(assert (=> b!1213956 m!1119243))

(declare-fun m!1119245 () Bool)

(assert (=> b!1213963 m!1119245))

(declare-fun m!1119247 () Bool)

(assert (=> b!1213959 m!1119247))

(declare-fun m!1119249 () Bool)

(assert (=> b!1213959 m!1119249))

(assert (=> bm!60504 m!1119185))

(declare-fun m!1119251 () Bool)

(assert (=> b!1213950 m!1119251))

(declare-fun m!1119253 () Bool)

(assert (=> b!1213950 m!1119253))

(declare-fun m!1119255 () Bool)

(assert (=> b!1213949 m!1119255))

(declare-fun m!1119257 () Bool)

(assert (=> bm!60503 m!1119257))

(check-sat (not b!1213963) (not bm!60507) (not b_lambda!21761) (not b!1213950) (not start!101162) (not b!1213938) (not bm!60500) (not b!1213965) (not b_next!26085) (not b!1213939) (not b!1213943) (not b!1213959) (not b!1213951) (not bm!60501) (not mapNonEmpty!48058) (not bm!60503) (not b!1213955) (not b!1213945) b_and!43289 (not b!1213937) (not b!1213949) (not b!1213948) (not b!1213956) (not bm!60504) (not b!1213961) (not b!1213954) tp_is_empty!30789)
(check-sat b_and!43289 (not b_next!26085))
