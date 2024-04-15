; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101160 () Bool)

(assert start!101160)

(declare-fun b_free!26089 () Bool)

(declare-fun b_next!26089 () Bool)

(assert (=> start!101160 (= b_free!26089 (not b_next!26089))))

(declare-fun tp!91288 () Bool)

(declare-fun b_and!43277 () Bool)

(assert (=> start!101160 (= tp!91288 b_and!43277)))

(declare-fun mapIsEmpty!48064 () Bool)

(declare-fun mapRes!48064 () Bool)

(assert (=> mapIsEmpty!48064 mapRes!48064))

(declare-fun b!1214011 () Bool)

(declare-datatypes ((Unit!40111 0))(
  ( (Unit!40112) )
))
(declare-fun e!689439 () Unit!40111)

(declare-fun Unit!40113 () Unit!40111)

(assert (=> b!1214011 (= e!689439 Unit!40113)))

(declare-fun b!1214012 () Bool)

(declare-datatypes ((V!46185 0))(
  ( (V!46186 (val!15453 Int)) )
))
(declare-datatypes ((tuple2!19940 0))(
  ( (tuple2!19941 (_1!9981 (_ BitVec 64)) (_2!9981 V!46185)) )
))
(declare-datatypes ((List!26717 0))(
  ( (Nil!26714) (Cons!26713 (h!27922 tuple2!19940) (t!39777 List!26717)) )
))
(declare-datatypes ((ListLongMap!17909 0))(
  ( (ListLongMap!17910 (toList!8970 List!26717)) )
))
(declare-fun call!60532 () ListLongMap!17909)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6977 (ListLongMap!17909 (_ BitVec 64)) Bool)

(assert (=> b!1214012 (contains!6977 call!60532 k0!934)))

(declare-fun lt!551985 () Unit!40111)

(declare-fun lt!551980 () ListLongMap!17909)

(declare-fun minValue!944 () V!46185)

(declare-fun addStillContains!1072 (ListLongMap!17909 (_ BitVec 64) V!46185 (_ BitVec 64)) Unit!40111)

(assert (=> b!1214012 (= lt!551985 (addStillContains!1072 lt!551980 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!60536 () Bool)

(assert (=> b!1214012 call!60536))

(declare-fun lt!551978 () ListLongMap!17909)

(declare-fun zeroValue!944 () V!46185)

(declare-fun +!4087 (ListLongMap!17909 tuple2!19940) ListLongMap!17909)

(assert (=> b!1214012 (= lt!551980 (+!4087 lt!551978 (tuple2!19941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551999 () Unit!40111)

(declare-fun call!60533 () Unit!40111)

(assert (=> b!1214012 (= lt!551999 call!60533)))

(declare-fun e!689431 () Unit!40111)

(assert (=> b!1214012 (= e!689431 lt!551985)))

(declare-fun b!1214013 () Bool)

(declare-fun res!806014 () Bool)

(declare-fun e!689430 () Bool)

(assert (=> b!1214013 (=> (not res!806014) (not e!689430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214013 (= res!806014 (validKeyInArray!0 k0!934))))

(declare-fun b!1214014 () Bool)

(declare-fun e!689442 () Unit!40111)

(declare-fun Unit!40114 () Unit!40111)

(assert (=> b!1214014 (= e!689442 Unit!40114)))

(declare-fun b!1214015 () Bool)

(declare-fun res!806016 () Bool)

(assert (=> b!1214015 (=> (not res!806016) (not e!689430))))

(declare-datatypes ((array!78288 0))(
  ( (array!78289 (arr!37779 (Array (_ BitVec 32) (_ BitVec 64))) (size!38317 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78288)

(declare-datatypes ((List!26718 0))(
  ( (Nil!26715) (Cons!26714 (h!27923 (_ BitVec 64)) (t!39778 List!26718)) )
))
(declare-fun arrayNoDuplicates!0 (array!78288 (_ BitVec 32) List!26718) Bool)

(assert (=> b!1214015 (= res!806016 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26715))))

(declare-fun b!1214016 () Bool)

(declare-fun res!806020 () Bool)

(assert (=> b!1214016 (=> (not res!806020) (not e!689430))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214016 (= res!806020 (validMask!0 mask!1564))))

(declare-fun b!1214017 () Bool)

(declare-fun res!806009 () Bool)

(assert (=> b!1214017 (=> (not res!806009) (not e!689430))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214017 (= res!806009 (= (select (arr!37779 _keys!1208) i!673) k0!934))))

(declare-fun b!1214018 () Bool)

(declare-fun e!689438 () Bool)

(declare-fun lt!551993 () ListLongMap!17909)

(declare-fun lt!551997 () ListLongMap!17909)

(assert (=> b!1214018 (= e!689438 (or (not (= lt!551993 lt!551997)) (= lt!551997 lt!551993)))))

(declare-fun e!689428 () Bool)

(assert (=> b!1214018 e!689428))

(declare-fun res!806012 () Bool)

(assert (=> b!1214018 (=> (not res!806012) (not e!689428))))

(assert (=> b!1214018 (= res!806012 (= lt!551993 lt!551978))))

(declare-fun lt!551992 () ListLongMap!17909)

(declare-fun -!1845 (ListLongMap!17909 (_ BitVec 64)) ListLongMap!17909)

(assert (=> b!1214018 (= lt!551993 (-!1845 lt!551992 k0!934))))

(declare-fun lt!551994 () V!46185)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1214018 (= (-!1845 (+!4087 lt!551978 (tuple2!19941 (select (arr!37779 _keys!1208) from!1455) lt!551994)) (select (arr!37779 _keys!1208) from!1455)) lt!551978)))

(declare-fun lt!551984 () Unit!40111)

(declare-fun addThenRemoveForNewKeyIsSame!276 (ListLongMap!17909 (_ BitVec 64) V!46185) Unit!40111)

(assert (=> b!1214018 (= lt!551984 (addThenRemoveForNewKeyIsSame!276 lt!551978 (select (arr!37779 _keys!1208) from!1455) lt!551994))))

(declare-fun lt!551981 () V!46185)

(declare-datatypes ((ValueCell!14687 0))(
  ( (ValueCellFull!14687 (v!18105 V!46185)) (EmptyCell!14687) )
))
(declare-datatypes ((array!78290 0))(
  ( (array!78291 (arr!37780 (Array (_ BitVec 32) ValueCell!14687)) (size!38318 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78290)

(declare-fun get!19277 (ValueCell!14687 V!46185) V!46185)

(assert (=> b!1214018 (= lt!551994 (get!19277 (select (arr!37780 _values!996) from!1455) lt!551981))))

(declare-fun lt!551989 () Unit!40111)

(assert (=> b!1214018 (= lt!551989 e!689439)))

(declare-fun c!119987 () Bool)

(assert (=> b!1214018 (= c!119987 (contains!6977 lt!551978 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5410 (array!78288 array!78290 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 32) Int) ListLongMap!17909)

(assert (=> b!1214018 (= lt!551978 (getCurrentListMapNoExtraKeys!5410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60534 () ListLongMap!17909)

(declare-fun b!1214019 () Bool)

(declare-fun e!689436 () Bool)

(declare-fun call!60531 () ListLongMap!17909)

(assert (=> b!1214019 (= e!689436 (= call!60531 (-!1845 call!60534 k0!934)))))

(declare-fun b!1214020 () Bool)

(declare-fun e!689427 () Bool)

(declare-fun arrayContainsKey!0 (array!78288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214020 (= e!689427 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214021 () Bool)

(declare-fun res!806021 () Bool)

(assert (=> b!1214021 (=> (not res!806021) (not e!689430))))

(assert (=> b!1214021 (= res!806021 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38317 _keys!1208))))))

(declare-fun b!1214022 () Bool)

(declare-fun e!689437 () Bool)

(declare-fun tp_is_empty!30793 () Bool)

(assert (=> b!1214022 (= e!689437 tp_is_empty!30793)))

(declare-fun c!119989 () Bool)

(declare-fun c!119991 () Bool)

(declare-fun bm!60527 () Bool)

(assert (=> bm!60527 (= call!60533 (addStillContains!1072 lt!551978 (ite (or c!119989 c!119991) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119989 c!119991) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!60528 () Bool)

(declare-fun call!60529 () ListLongMap!17909)

(assert (=> bm!60528 (= call!60529 call!60532)))

(declare-fun b!1214023 () Bool)

(declare-fun e!689433 () Bool)

(declare-fun e!689441 () Bool)

(assert (=> b!1214023 (= e!689433 (and e!689441 mapRes!48064))))

(declare-fun condMapEmpty!48064 () Bool)

(declare-fun mapDefault!48064 () ValueCell!14687)

(assert (=> b!1214023 (= condMapEmpty!48064 (= (arr!37780 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14687)) mapDefault!48064)))))

(declare-fun b!1214024 () Bool)

(declare-fun lt!551995 () Bool)

(assert (=> b!1214024 (= c!119991 (and (not lt!551995) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!689440 () Unit!40111)

(assert (=> b!1214024 (= e!689431 e!689440)))

(declare-fun res!806013 () Bool)

(assert (=> start!101160 (=> (not res!806013) (not e!689430))))

(assert (=> start!101160 (= res!806013 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38317 _keys!1208))))))

(assert (=> start!101160 e!689430))

(assert (=> start!101160 tp_is_empty!30793))

(declare-fun array_inv!28882 (array!78288) Bool)

(assert (=> start!101160 (array_inv!28882 _keys!1208)))

(assert (=> start!101160 true))

(assert (=> start!101160 tp!91288))

(declare-fun array_inv!28883 (array!78290) Bool)

(assert (=> start!101160 (and (array_inv!28883 _values!996) e!689433)))

(declare-fun bm!60526 () Bool)

(declare-fun call!60530 () Unit!40111)

(assert (=> bm!60526 (= call!60530 call!60533)))

(declare-fun b!1214025 () Bool)

(declare-fun e!689443 () Bool)

(assert (=> b!1214025 (= e!689443 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551995) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60529 () Bool)

(declare-fun call!60535 () Bool)

(assert (=> bm!60529 (= call!60535 call!60536)))

(declare-fun b!1214026 () Bool)

(declare-fun lt!551996 () Unit!40111)

(assert (=> b!1214026 (= e!689440 lt!551996)))

(assert (=> b!1214026 (= lt!551996 call!60530)))

(assert (=> b!1214026 call!60535))

(declare-fun bm!60530 () Bool)

(assert (=> bm!60530 (= call!60532 (+!4087 (ite c!119989 lt!551980 lt!551978) (ite c!119989 (tuple2!19941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119991 (tuple2!19941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1214027 () Bool)

(declare-fun e!689429 () Bool)

(assert (=> b!1214027 (= e!689430 e!689429)))

(declare-fun res!806010 () Bool)

(assert (=> b!1214027 (=> (not res!806010) (not e!689429))))

(declare-fun lt!551987 () array!78288)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78288 (_ BitVec 32)) Bool)

(assert (=> b!1214027 (= res!806010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551987 mask!1564))))

(assert (=> b!1214027 (= lt!551987 (array!78289 (store (arr!37779 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38317 _keys!1208)))))

(declare-fun bm!60531 () Bool)

(assert (=> bm!60531 (= call!60536 (contains!6977 (ite c!119989 lt!551980 call!60529) k0!934))))

(declare-fun b!1214028 () Bool)

(assert (=> b!1214028 call!60535))

(declare-fun lt!551986 () Unit!40111)

(assert (=> b!1214028 (= lt!551986 call!60530)))

(assert (=> b!1214028 (= e!689442 lt!551986)))

(declare-fun b!1214029 () Bool)

(declare-fun e!689435 () Bool)

(assert (=> b!1214029 (= e!689435 e!689438)))

(declare-fun res!806017 () Bool)

(assert (=> b!1214029 (=> res!806017 e!689438)))

(assert (=> b!1214029 (= res!806017 (not (= (select (arr!37779 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1214029 e!689436))

(declare-fun c!119986 () Bool)

(assert (=> b!1214029 (= c!119986 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551979 () Unit!40111)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1080 (array!78288 array!78290 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40111)

(assert (=> b!1214029 (= lt!551979 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214030 () Bool)

(declare-fun e!689432 () Bool)

(assert (=> b!1214030 (= e!689432 e!689435)))

(declare-fun res!806022 () Bool)

(assert (=> b!1214030 (=> res!806022 e!689435)))

(assert (=> b!1214030 (= res!806022 (not (= from!1455 i!673)))))

(declare-fun lt!551991 () array!78290)

(assert (=> b!1214030 (= lt!551997 (getCurrentListMapNoExtraKeys!5410 lt!551987 lt!551991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1214030 (= lt!551991 (array!78291 (store (arr!37780 _values!996) i!673 (ValueCellFull!14687 lt!551981)) (size!38318 _values!996)))))

(declare-fun dynLambda!3263 (Int (_ BitVec 64)) V!46185)

(assert (=> b!1214030 (= lt!551981 (dynLambda!3263 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1214030 (= lt!551992 (getCurrentListMapNoExtraKeys!5410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214031 () Bool)

(assert (=> b!1214031 (= e!689443 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214032 () Bool)

(assert (=> b!1214032 (= e!689441 tp_is_empty!30793)))

(declare-fun b!1214033 () Bool)

(assert (=> b!1214033 (= e!689436 (= call!60531 call!60534))))

(declare-fun bm!60532 () Bool)

(assert (=> bm!60532 (= call!60531 (getCurrentListMapNoExtraKeys!5410 lt!551987 lt!551991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214034 () Bool)

(assert (=> b!1214034 (= e!689429 (not e!689432))))

(declare-fun res!806018 () Bool)

(assert (=> b!1214034 (=> res!806018 e!689432)))

(assert (=> b!1214034 (= res!806018 (bvsgt from!1455 i!673))))

(assert (=> b!1214034 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551988 () Unit!40111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78288 (_ BitVec 64) (_ BitVec 32)) Unit!40111)

(assert (=> b!1214034 (= lt!551988 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214035 () Bool)

(assert (=> b!1214035 (= e!689428 (= lt!551993 (getCurrentListMapNoExtraKeys!5410 lt!551987 lt!551991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1214036 () Bool)

(assert (=> b!1214036 (= e!689440 e!689442)))

(declare-fun c!119988 () Bool)

(assert (=> b!1214036 (= c!119988 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551995))))

(declare-fun b!1214037 () Bool)

(declare-fun res!806011 () Bool)

(assert (=> b!1214037 (=> (not res!806011) (not e!689430))))

(assert (=> b!1214037 (= res!806011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214038 () Bool)

(declare-fun res!806015 () Bool)

(assert (=> b!1214038 (=> (not res!806015) (not e!689429))))

(assert (=> b!1214038 (= res!806015 (arrayNoDuplicates!0 lt!551987 #b00000000000000000000000000000000 Nil!26715))))

(declare-fun mapNonEmpty!48064 () Bool)

(declare-fun tp!91289 () Bool)

(assert (=> mapNonEmpty!48064 (= mapRes!48064 (and tp!91289 e!689437))))

(declare-fun mapValue!48064 () ValueCell!14687)

(declare-fun mapKey!48064 () (_ BitVec 32))

(declare-fun mapRest!48064 () (Array (_ BitVec 32) ValueCell!14687))

(assert (=> mapNonEmpty!48064 (= (arr!37780 _values!996) (store mapRest!48064 mapKey!48064 mapValue!48064))))

(declare-fun bm!60533 () Bool)

(assert (=> bm!60533 (= call!60534 (getCurrentListMapNoExtraKeys!5410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214039 () Bool)

(declare-fun res!806019 () Bool)

(assert (=> b!1214039 (=> (not res!806019) (not e!689430))))

(assert (=> b!1214039 (= res!806019 (and (= (size!38318 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38317 _keys!1208) (size!38318 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214040 () Bool)

(declare-fun Unit!40115 () Unit!40111)

(assert (=> b!1214040 (= e!689439 Unit!40115)))

(assert (=> b!1214040 (= lt!551995 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1214040 (= c!119989 (and (not lt!551995) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551990 () Unit!40111)

(assert (=> b!1214040 (= lt!551990 e!689431)))

(declare-fun lt!551998 () Unit!40111)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!612 (array!78288 array!78290 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 64) (_ BitVec 32) Int) Unit!40111)

(assert (=> b!1214040 (= lt!551998 (lemmaListMapContainsThenArrayContainsFrom!612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119990 () Bool)

(assert (=> b!1214040 (= c!119990 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806023 () Bool)

(assert (=> b!1214040 (= res!806023 e!689443)))

(assert (=> b!1214040 (=> (not res!806023) (not e!689427))))

(assert (=> b!1214040 e!689427))

(declare-fun lt!551983 () Unit!40111)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78288 (_ BitVec 32) (_ BitVec 32)) Unit!40111)

(assert (=> b!1214040 (= lt!551983 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1214040 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26715)))

(declare-fun lt!551982 () Unit!40111)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78288 (_ BitVec 64) (_ BitVec 32) List!26718) Unit!40111)

(assert (=> b!1214040 (= lt!551982 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26715))))

(assert (=> b!1214040 false))

(assert (= (and start!101160 res!806013) b!1214016))

(assert (= (and b!1214016 res!806020) b!1214039))

(assert (= (and b!1214039 res!806019) b!1214037))

(assert (= (and b!1214037 res!806011) b!1214015))

(assert (= (and b!1214015 res!806016) b!1214021))

(assert (= (and b!1214021 res!806021) b!1214013))

(assert (= (and b!1214013 res!806014) b!1214017))

(assert (= (and b!1214017 res!806009) b!1214027))

(assert (= (and b!1214027 res!806010) b!1214038))

(assert (= (and b!1214038 res!806015) b!1214034))

(assert (= (and b!1214034 (not res!806018)) b!1214030))

(assert (= (and b!1214030 (not res!806022)) b!1214029))

(assert (= (and b!1214029 c!119986) b!1214019))

(assert (= (and b!1214029 (not c!119986)) b!1214033))

(assert (= (or b!1214019 b!1214033) bm!60532))

(assert (= (or b!1214019 b!1214033) bm!60533))

(assert (= (and b!1214029 (not res!806017)) b!1214018))

(assert (= (and b!1214018 c!119987) b!1214040))

(assert (= (and b!1214018 (not c!119987)) b!1214011))

(assert (= (and b!1214040 c!119989) b!1214012))

(assert (= (and b!1214040 (not c!119989)) b!1214024))

(assert (= (and b!1214024 c!119991) b!1214026))

(assert (= (and b!1214024 (not c!119991)) b!1214036))

(assert (= (and b!1214036 c!119988) b!1214028))

(assert (= (and b!1214036 (not c!119988)) b!1214014))

(assert (= (or b!1214026 b!1214028) bm!60526))

(assert (= (or b!1214026 b!1214028) bm!60528))

(assert (= (or b!1214026 b!1214028) bm!60529))

(assert (= (or b!1214012 bm!60529) bm!60531))

(assert (= (or b!1214012 bm!60526) bm!60527))

(assert (= (or b!1214012 bm!60528) bm!60530))

(assert (= (and b!1214040 c!119990) b!1214031))

(assert (= (and b!1214040 (not c!119990)) b!1214025))

(assert (= (and b!1214040 res!806023) b!1214020))

(assert (= (and b!1214018 res!806012) b!1214035))

(assert (= (and b!1214023 condMapEmpty!48064) mapIsEmpty!48064))

(assert (= (and b!1214023 (not condMapEmpty!48064)) mapNonEmpty!48064))

(get-info :version)

(assert (= (and mapNonEmpty!48064 ((_ is ValueCellFull!14687) mapValue!48064)) b!1214022))

(assert (= (and b!1214023 ((_ is ValueCellFull!14687) mapDefault!48064)) b!1214032))

(assert (= start!101160 b!1214023))

(declare-fun b_lambda!21755 () Bool)

(assert (=> (not b_lambda!21755) (not b!1214030)))

(declare-fun t!39776 () Bool)

(declare-fun tb!10881 () Bool)

(assert (=> (and start!101160 (= defaultEntry!1004 defaultEntry!1004) t!39776) tb!10881))

(declare-fun result!22367 () Bool)

(assert (=> tb!10881 (= result!22367 tp_is_empty!30793)))

(assert (=> b!1214030 t!39776))

(declare-fun b_and!43279 () Bool)

(assert (= b_and!43277 (and (=> t!39776 result!22367) b_and!43279)))

(declare-fun m!1118775 () Bool)

(assert (=> b!1214034 m!1118775))

(declare-fun m!1118777 () Bool)

(assert (=> b!1214034 m!1118777))

(declare-fun m!1118779 () Bool)

(assert (=> bm!60533 m!1118779))

(declare-fun m!1118781 () Bool)

(assert (=> b!1214037 m!1118781))

(declare-fun m!1118783 () Bool)

(assert (=> b!1214038 m!1118783))

(declare-fun m!1118785 () Bool)

(assert (=> mapNonEmpty!48064 m!1118785))

(declare-fun m!1118787 () Bool)

(assert (=> start!101160 m!1118787))

(declare-fun m!1118789 () Bool)

(assert (=> start!101160 m!1118789))

(declare-fun m!1118791 () Bool)

(assert (=> b!1214016 m!1118791))

(declare-fun m!1118793 () Bool)

(assert (=> b!1214012 m!1118793))

(declare-fun m!1118795 () Bool)

(assert (=> b!1214012 m!1118795))

(declare-fun m!1118797 () Bool)

(assert (=> b!1214012 m!1118797))

(declare-fun m!1118799 () Bool)

(assert (=> b!1214035 m!1118799))

(declare-fun m!1118801 () Bool)

(assert (=> b!1214029 m!1118801))

(declare-fun m!1118803 () Bool)

(assert (=> b!1214029 m!1118803))

(declare-fun m!1118805 () Bool)

(assert (=> b!1214040 m!1118805))

(declare-fun m!1118807 () Bool)

(assert (=> b!1214040 m!1118807))

(declare-fun m!1118809 () Bool)

(assert (=> b!1214040 m!1118809))

(declare-fun m!1118811 () Bool)

(assert (=> b!1214040 m!1118811))

(declare-fun m!1118813 () Bool)

(assert (=> b!1214031 m!1118813))

(declare-fun m!1118815 () Bool)

(assert (=> bm!60531 m!1118815))

(assert (=> b!1214018 m!1118779))

(assert (=> b!1214018 m!1118801))

(declare-fun m!1118817 () Bool)

(assert (=> b!1214018 m!1118817))

(declare-fun m!1118819 () Bool)

(assert (=> b!1214018 m!1118819))

(declare-fun m!1118821 () Bool)

(assert (=> b!1214018 m!1118821))

(declare-fun m!1118823 () Bool)

(assert (=> b!1214018 m!1118823))

(assert (=> b!1214018 m!1118801))

(declare-fun m!1118825 () Bool)

(assert (=> b!1214018 m!1118825))

(assert (=> b!1214018 m!1118823))

(declare-fun m!1118827 () Bool)

(assert (=> b!1214018 m!1118827))

(assert (=> b!1214018 m!1118801))

(assert (=> b!1214018 m!1118819))

(declare-fun m!1118829 () Bool)

(assert (=> b!1214018 m!1118829))

(declare-fun m!1118831 () Bool)

(assert (=> b!1214030 m!1118831))

(declare-fun m!1118833 () Bool)

(assert (=> b!1214030 m!1118833))

(declare-fun m!1118835 () Bool)

(assert (=> b!1214030 m!1118835))

(declare-fun m!1118837 () Bool)

(assert (=> b!1214030 m!1118837))

(declare-fun m!1118839 () Bool)

(assert (=> bm!60527 m!1118839))

(declare-fun m!1118841 () Bool)

(assert (=> b!1214019 m!1118841))

(declare-fun m!1118843 () Bool)

(assert (=> b!1214013 m!1118843))

(assert (=> bm!60532 m!1118799))

(assert (=> b!1214020 m!1118813))

(declare-fun m!1118845 () Bool)

(assert (=> bm!60530 m!1118845))

(declare-fun m!1118847 () Bool)

(assert (=> b!1214015 m!1118847))

(declare-fun m!1118849 () Bool)

(assert (=> b!1214027 m!1118849))

(declare-fun m!1118851 () Bool)

(assert (=> b!1214027 m!1118851))

(declare-fun m!1118853 () Bool)

(assert (=> b!1214017 m!1118853))

(check-sat (not bm!60530) (not b!1214018) (not b!1214016) (not b!1214027) (not b!1214037) (not b!1214034) (not b_next!26089) (not b_lambda!21755) (not b!1214035) (not b!1214030) (not b!1214031) (not start!101160) (not b!1214040) (not b!1214038) (not mapNonEmpty!48064) (not b!1214012) tp_is_empty!30793 (not bm!60527) (not bm!60531) (not b!1214029) (not b!1214013) b_and!43279 (not bm!60532) (not b!1214020) (not b!1214019) (not bm!60533) (not b!1214015))
(check-sat b_and!43279 (not b_next!26089))
