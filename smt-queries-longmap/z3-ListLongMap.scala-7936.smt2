; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98458 () Bool)

(assert start!98458)

(declare-fun b_free!24063 () Bool)

(declare-fun b_next!24063 () Bool)

(assert (=> start!98458 (= b_free!24063 (not b_next!24063))))

(declare-fun tp!84900 () Bool)

(declare-fun b_and!38975 () Bool)

(assert (=> start!98458 (= tp!84900 b_and!38975)))

(declare-datatypes ((array!74045 0))(
  ( (array!74046 (arr!35673 (Array (_ BitVec 32) (_ BitVec 64))) (size!36209 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74045)

(declare-fun e!647592 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1138112 () Bool)

(declare-fun arrayContainsKey!0 (array!74045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138112 (= e!647592 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138113 () Bool)

(declare-datatypes ((Unit!37285 0))(
  ( (Unit!37286) )
))
(declare-fun e!647607 () Unit!37285)

(declare-fun e!647594 () Unit!37285)

(assert (=> b!1138113 (= e!647607 e!647594)))

(declare-fun c!111428 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!506298 () Bool)

(assert (=> b!1138113 (= c!111428 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506298))))

(declare-fun b!1138114 () Bool)

(declare-fun res!759296 () Bool)

(declare-fun e!647600 () Bool)

(assert (=> b!1138114 (=> (not res!759296) (not e!647600))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138114 (= res!759296 (validMask!0 mask!1564))))

(declare-fun b!1138115 () Bool)

(declare-fun res!759286 () Bool)

(assert (=> b!1138115 (=> (not res!759286) (not e!647600))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138115 (= res!759286 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36209 _keys!1208))))))

(declare-fun b!1138116 () Bool)

(declare-fun e!647604 () Bool)

(declare-fun e!647603 () Bool)

(assert (=> b!1138116 (= e!647604 (not e!647603))))

(declare-fun res!759291 () Bool)

(assert (=> b!1138116 (=> res!759291 e!647603)))

(assert (=> b!1138116 (= res!759291 (bvsgt from!1455 i!673))))

(assert (=> b!1138116 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506291 () Unit!37285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74045 (_ BitVec 64) (_ BitVec 32)) Unit!37285)

(assert (=> b!1138116 (= lt!506291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138117 () Bool)

(declare-fun e!647606 () Bool)

(declare-fun e!647595 () Bool)

(declare-fun mapRes!44714 () Bool)

(assert (=> b!1138117 (= e!647606 (and e!647595 mapRes!44714))))

(declare-fun condMapEmpty!44714 () Bool)

(declare-datatypes ((V!43251 0))(
  ( (V!43252 (val!14353 Int)) )
))
(declare-datatypes ((ValueCell!13587 0))(
  ( (ValueCellFull!13587 (v!16990 V!43251)) (EmptyCell!13587) )
))
(declare-datatypes ((array!74047 0))(
  ( (array!74048 (arr!35674 (Array (_ BitVec 32) ValueCell!13587)) (size!36210 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74047)

(declare-fun mapDefault!44714 () ValueCell!13587)

(assert (=> b!1138117 (= condMapEmpty!44714 (= (arr!35674 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13587)) mapDefault!44714)))))

(declare-fun b!1138118 () Bool)

(declare-datatypes ((tuple2!18132 0))(
  ( (tuple2!18133 (_1!9077 (_ BitVec 64)) (_2!9077 V!43251)) )
))
(declare-datatypes ((List!24889 0))(
  ( (Nil!24886) (Cons!24885 (h!26094 tuple2!18132) (t!35944 List!24889)) )
))
(declare-datatypes ((ListLongMap!16101 0))(
  ( (ListLongMap!16102 (toList!8066 List!24889)) )
))
(declare-fun lt!506297 () ListLongMap!16101)

(declare-fun minValue!944 () V!43251)

(declare-fun contains!6604 (ListLongMap!16101 (_ BitVec 64)) Bool)

(declare-fun +!3501 (ListLongMap!16101 tuple2!18132) ListLongMap!16101)

(assert (=> b!1138118 (contains!6604 (+!3501 lt!506297 (tuple2!18133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506296 () Unit!37285)

(declare-fun addStillContains!760 (ListLongMap!16101 (_ BitVec 64) V!43251 (_ BitVec 64)) Unit!37285)

(assert (=> b!1138118 (= lt!506296 (addStillContains!760 lt!506297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50300 () Bool)

(assert (=> b!1138118 call!50300))

(declare-fun call!50301 () ListLongMap!16101)

(assert (=> b!1138118 (= lt!506297 call!50301)))

(declare-fun lt!506295 () Unit!37285)

(declare-fun call!50299 () Unit!37285)

(assert (=> b!1138118 (= lt!506295 call!50299)))

(declare-fun e!647599 () Unit!37285)

(assert (=> b!1138118 (= e!647599 lt!506296)))

(declare-fun b!1138119 () Bool)

(declare-fun res!759298 () Bool)

(assert (=> b!1138119 (=> (not res!759298) (not e!647600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74045 (_ BitVec 32)) Bool)

(assert (=> b!1138119 (= res!759298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun zeroValue!944 () V!43251)

(declare-fun call!50298 () ListLongMap!16101)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!506287 () array!74047)

(declare-fun bm!50295 () Bool)

(declare-fun lt!506301 () array!74045)

(declare-fun getCurrentListMapNoExtraKeys!4550 (array!74045 array!74047 (_ BitVec 32) (_ BitVec 32) V!43251 V!43251 (_ BitVec 32) Int) ListLongMap!16101)

(assert (=> bm!50295 (= call!50298 (getCurrentListMapNoExtraKeys!4550 lt!506301 lt!506287 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!759289 () Bool)

(assert (=> start!98458 (=> (not res!759289) (not e!647600))))

(assert (=> start!98458 (= res!759289 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36209 _keys!1208))))))

(assert (=> start!98458 e!647600))

(declare-fun tp_is_empty!28593 () Bool)

(assert (=> start!98458 tp_is_empty!28593))

(declare-fun array_inv!27350 (array!74045) Bool)

(assert (=> start!98458 (array_inv!27350 _keys!1208)))

(assert (=> start!98458 true))

(assert (=> start!98458 tp!84900))

(declare-fun array_inv!27351 (array!74047) Bool)

(assert (=> start!98458 (and (array_inv!27351 _values!996) e!647606)))

(declare-fun b!1138120 () Bool)

(declare-fun Unit!37287 () Unit!37285)

(assert (=> b!1138120 (= e!647594 Unit!37287)))

(declare-fun bm!50296 () Bool)

(declare-fun call!50304 () Bool)

(assert (=> bm!50296 (= call!50304 call!50300)))

(declare-fun mapNonEmpty!44714 () Bool)

(declare-fun tp!84899 () Bool)

(declare-fun e!647598 () Bool)

(assert (=> mapNonEmpty!44714 (= mapRes!44714 (and tp!84899 e!647598))))

(declare-fun mapRest!44714 () (Array (_ BitVec 32) ValueCell!13587))

(declare-fun mapValue!44714 () ValueCell!13587)

(declare-fun mapKey!44714 () (_ BitVec 32))

(assert (=> mapNonEmpty!44714 (= (arr!35674 _values!996) (store mapRest!44714 mapKey!44714 mapValue!44714))))

(declare-fun b!1138121 () Bool)

(assert (=> b!1138121 (= e!647598 tp_is_empty!28593)))

(declare-fun b!1138122 () Bool)

(assert (=> b!1138122 (= e!647600 e!647604)))

(declare-fun res!759290 () Bool)

(assert (=> b!1138122 (=> (not res!759290) (not e!647604))))

(assert (=> b!1138122 (= res!759290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506301 mask!1564))))

(assert (=> b!1138122 (= lt!506301 (array!74046 (store (arr!35673 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36209 _keys!1208)))))

(declare-fun b!1138123 () Bool)

(declare-fun res!759297 () Bool)

(assert (=> b!1138123 (=> (not res!759297) (not e!647600))))

(declare-datatypes ((List!24890 0))(
  ( (Nil!24887) (Cons!24886 (h!26095 (_ BitVec 64)) (t!35945 List!24890)) )
))
(declare-fun arrayNoDuplicates!0 (array!74045 (_ BitVec 32) List!24890) Bool)

(assert (=> b!1138123 (= res!759297 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24887))))

(declare-fun mapIsEmpty!44714 () Bool)

(assert (=> mapIsEmpty!44714 mapRes!44714))

(declare-fun b!1138124 () Bool)

(declare-fun e!647593 () Bool)

(assert (=> b!1138124 (= e!647593 true)))

(declare-fun lt!506292 () Unit!37285)

(declare-fun e!647596 () Unit!37285)

(assert (=> b!1138124 (= lt!506292 e!647596)))

(declare-fun c!111427 () Bool)

(declare-fun lt!506303 () ListLongMap!16101)

(assert (=> b!1138124 (= c!111427 (contains!6604 lt!506303 k0!934))))

(assert (=> b!1138124 (= lt!506303 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50297 () Bool)

(declare-fun call!50303 () Unit!37285)

(assert (=> bm!50297 (= call!50303 call!50299)))

(declare-fun bm!50298 () Bool)

(declare-fun call!50302 () ListLongMap!16101)

(assert (=> bm!50298 (= call!50302 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138125 () Bool)

(declare-fun lt!506294 () Unit!37285)

(assert (=> b!1138125 (= e!647607 lt!506294)))

(assert (=> b!1138125 (= lt!506294 call!50303)))

(assert (=> b!1138125 call!50304))

(declare-fun b!1138126 () Bool)

(declare-fun e!647602 () Bool)

(assert (=> b!1138126 (= e!647602 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50299 () Bool)

(declare-fun call!50305 () ListLongMap!16101)

(assert (=> bm!50299 (= call!50305 call!50301)))

(declare-fun b!1138127 () Bool)

(declare-fun res!759288 () Bool)

(assert (=> b!1138127 (=> (not res!759288) (not e!647600))))

(assert (=> b!1138127 (= res!759288 (and (= (size!36210 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36209 _keys!1208) (size!36210 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138128 () Bool)

(assert (=> b!1138128 (= e!647592 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506298) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138129 () Bool)

(declare-fun Unit!37288 () Unit!37285)

(assert (=> b!1138129 (= e!647596 Unit!37288)))

(declare-fun b!1138130 () Bool)

(declare-fun res!759294 () Bool)

(assert (=> b!1138130 (=> (not res!759294) (not e!647600))))

(assert (=> b!1138130 (= res!759294 (= (select (arr!35673 _keys!1208) i!673) k0!934))))

(declare-fun b!1138131 () Bool)

(declare-fun c!111425 () Bool)

(assert (=> b!1138131 (= c!111425 (and (not lt!506298) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138131 (= e!647599 e!647607)))

(declare-fun b!1138132 () Bool)

(declare-fun res!759287 () Bool)

(assert (=> b!1138132 (=> (not res!759287) (not e!647600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138132 (= res!759287 (validKeyInArray!0 k0!934))))

(declare-fun b!1138133 () Bool)

(declare-fun e!647597 () Bool)

(assert (=> b!1138133 (= e!647603 e!647597)))

(declare-fun res!759295 () Bool)

(assert (=> b!1138133 (=> res!759295 e!647597)))

(assert (=> b!1138133 (= res!759295 (not (= from!1455 i!673)))))

(declare-fun lt!506302 () ListLongMap!16101)

(assert (=> b!1138133 (= lt!506302 (getCurrentListMapNoExtraKeys!4550 lt!506301 lt!506287 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2603 (Int (_ BitVec 64)) V!43251)

(assert (=> b!1138133 (= lt!506287 (array!74048 (store (arr!35674 _values!996) i!673 (ValueCellFull!13587 (dynLambda!2603 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36210 _values!996)))))

(declare-fun lt!506289 () ListLongMap!16101)

(assert (=> b!1138133 (= lt!506289 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138134 () Bool)

(assert (=> b!1138134 call!50304))

(declare-fun lt!506300 () Unit!37285)

(assert (=> b!1138134 (= lt!506300 call!50303)))

(assert (=> b!1138134 (= e!647594 lt!506300)))

(declare-fun b!1138135 () Bool)

(declare-fun e!647605 () Bool)

(assert (=> b!1138135 (= e!647605 (= call!50298 call!50302))))

(declare-fun bm!50300 () Bool)

(declare-fun c!111430 () Bool)

(assert (=> bm!50300 (= call!50301 (+!3501 lt!506303 (ite (or c!111430 c!111425) (tuple2!18133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1138136 () Bool)

(assert (=> b!1138136 (= e!647595 tp_is_empty!28593)))

(declare-fun bm!50301 () Bool)

(assert (=> bm!50301 (= call!50299 (addStillContains!760 lt!506303 (ite (or c!111430 c!111425) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111430 c!111425) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1138137 () Bool)

(declare-fun -!1220 (ListLongMap!16101 (_ BitVec 64)) ListLongMap!16101)

(assert (=> b!1138137 (= e!647605 (= call!50298 (-!1220 call!50302 k0!934)))))

(declare-fun bm!50302 () Bool)

(assert (=> bm!50302 (= call!50300 (contains!6604 (ite c!111430 lt!506297 call!50305) k0!934))))

(declare-fun b!1138138 () Bool)

(assert (=> b!1138138 (= e!647597 e!647593)))

(declare-fun res!759299 () Bool)

(assert (=> b!1138138 (=> res!759299 e!647593)))

(assert (=> b!1138138 (= res!759299 (not (= (select (arr!35673 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1138138 e!647605))

(declare-fun c!111426 () Bool)

(assert (=> b!1138138 (= c!111426 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506293 () Unit!37285)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!469 (array!74045 array!74047 (_ BitVec 32) (_ BitVec 32) V!43251 V!43251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37285)

(assert (=> b!1138138 (= lt!506293 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138139 () Bool)

(declare-fun res!759292 () Bool)

(assert (=> b!1138139 (=> (not res!759292) (not e!647604))))

(assert (=> b!1138139 (= res!759292 (arrayNoDuplicates!0 lt!506301 #b00000000000000000000000000000000 Nil!24887))))

(declare-fun b!1138140 () Bool)

(declare-fun Unit!37289 () Unit!37285)

(assert (=> b!1138140 (= e!647596 Unit!37289)))

(assert (=> b!1138140 (= lt!506298 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138140 (= c!111430 (and (not lt!506298) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506288 () Unit!37285)

(assert (=> b!1138140 (= lt!506288 e!647599)))

(declare-fun lt!506299 () Unit!37285)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!363 (array!74045 array!74047 (_ BitVec 32) (_ BitVec 32) V!43251 V!43251 (_ BitVec 64) (_ BitVec 32) Int) Unit!37285)

(assert (=> b!1138140 (= lt!506299 (lemmaListMapContainsThenArrayContainsFrom!363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111429 () Bool)

(assert (=> b!1138140 (= c!111429 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759293 () Bool)

(assert (=> b!1138140 (= res!759293 e!647592)))

(assert (=> b!1138140 (=> (not res!759293) (not e!647602))))

(assert (=> b!1138140 e!647602))

(declare-fun lt!506304 () Unit!37285)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74045 (_ BitVec 32) (_ BitVec 32)) Unit!37285)

(assert (=> b!1138140 (= lt!506304 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138140 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24887)))

(declare-fun lt!506290 () Unit!37285)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74045 (_ BitVec 64) (_ BitVec 32) List!24890) Unit!37285)

(assert (=> b!1138140 (= lt!506290 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24887))))

(assert (=> b!1138140 false))

(assert (= (and start!98458 res!759289) b!1138114))

(assert (= (and b!1138114 res!759296) b!1138127))

(assert (= (and b!1138127 res!759288) b!1138119))

(assert (= (and b!1138119 res!759298) b!1138123))

(assert (= (and b!1138123 res!759297) b!1138115))

(assert (= (and b!1138115 res!759286) b!1138132))

(assert (= (and b!1138132 res!759287) b!1138130))

(assert (= (and b!1138130 res!759294) b!1138122))

(assert (= (and b!1138122 res!759290) b!1138139))

(assert (= (and b!1138139 res!759292) b!1138116))

(assert (= (and b!1138116 (not res!759291)) b!1138133))

(assert (= (and b!1138133 (not res!759295)) b!1138138))

(assert (= (and b!1138138 c!111426) b!1138137))

(assert (= (and b!1138138 (not c!111426)) b!1138135))

(assert (= (or b!1138137 b!1138135) bm!50295))

(assert (= (or b!1138137 b!1138135) bm!50298))

(assert (= (and b!1138138 (not res!759299)) b!1138124))

(assert (= (and b!1138124 c!111427) b!1138140))

(assert (= (and b!1138124 (not c!111427)) b!1138129))

(assert (= (and b!1138140 c!111430) b!1138118))

(assert (= (and b!1138140 (not c!111430)) b!1138131))

(assert (= (and b!1138131 c!111425) b!1138125))

(assert (= (and b!1138131 (not c!111425)) b!1138113))

(assert (= (and b!1138113 c!111428) b!1138134))

(assert (= (and b!1138113 (not c!111428)) b!1138120))

(assert (= (or b!1138125 b!1138134) bm!50297))

(assert (= (or b!1138125 b!1138134) bm!50299))

(assert (= (or b!1138125 b!1138134) bm!50296))

(assert (= (or b!1138118 bm!50296) bm!50302))

(assert (= (or b!1138118 bm!50297) bm!50301))

(assert (= (or b!1138118 bm!50299) bm!50300))

(assert (= (and b!1138140 c!111429) b!1138112))

(assert (= (and b!1138140 (not c!111429)) b!1138128))

(assert (= (and b!1138140 res!759293) b!1138126))

(assert (= (and b!1138117 condMapEmpty!44714) mapIsEmpty!44714))

(assert (= (and b!1138117 (not condMapEmpty!44714)) mapNonEmpty!44714))

(get-info :version)

(assert (= (and mapNonEmpty!44714 ((_ is ValueCellFull!13587) mapValue!44714)) b!1138121))

(assert (= (and b!1138117 ((_ is ValueCellFull!13587) mapDefault!44714)) b!1138136))

(assert (= start!98458 b!1138117))

(declare-fun b_lambda!19169 () Bool)

(assert (=> (not b_lambda!19169) (not b!1138133)))

(declare-fun t!35943 () Bool)

(declare-fun tb!8875 () Bool)

(assert (=> (and start!98458 (= defaultEntry!1004 defaultEntry!1004) t!35943) tb!8875))

(declare-fun result!18315 () Bool)

(assert (=> tb!8875 (= result!18315 tp_is_empty!28593)))

(assert (=> b!1138133 t!35943))

(declare-fun b_and!38977 () Bool)

(assert (= b_and!38975 (and (=> t!35943 result!18315) b_and!38977)))

(declare-fun m!1050041 () Bool)

(assert (=> b!1138140 m!1050041))

(declare-fun m!1050043 () Bool)

(assert (=> b!1138140 m!1050043))

(declare-fun m!1050045 () Bool)

(assert (=> b!1138140 m!1050045))

(declare-fun m!1050047 () Bool)

(assert (=> b!1138140 m!1050047))

(declare-fun m!1050049 () Bool)

(assert (=> b!1138119 m!1050049))

(declare-fun m!1050051 () Bool)

(assert (=> b!1138112 m!1050051))

(declare-fun m!1050053 () Bool)

(assert (=> b!1138122 m!1050053))

(declare-fun m!1050055 () Bool)

(assert (=> b!1138122 m!1050055))

(declare-fun m!1050057 () Bool)

(assert (=> b!1138124 m!1050057))

(declare-fun m!1050059 () Bool)

(assert (=> b!1138124 m!1050059))

(declare-fun m!1050061 () Bool)

(assert (=> b!1138132 m!1050061))

(declare-fun m!1050063 () Bool)

(assert (=> b!1138133 m!1050063))

(declare-fun m!1050065 () Bool)

(assert (=> b!1138133 m!1050065))

(declare-fun m!1050067 () Bool)

(assert (=> b!1138133 m!1050067))

(declare-fun m!1050069 () Bool)

(assert (=> b!1138133 m!1050069))

(declare-fun m!1050071 () Bool)

(assert (=> b!1138137 m!1050071))

(declare-fun m!1050073 () Bool)

(assert (=> start!98458 m!1050073))

(declare-fun m!1050075 () Bool)

(assert (=> start!98458 m!1050075))

(declare-fun m!1050077 () Bool)

(assert (=> bm!50302 m!1050077))

(declare-fun m!1050079 () Bool)

(assert (=> bm!50301 m!1050079))

(declare-fun m!1050081 () Bool)

(assert (=> b!1138139 m!1050081))

(assert (=> bm!50298 m!1050059))

(declare-fun m!1050083 () Bool)

(assert (=> b!1138118 m!1050083))

(assert (=> b!1138118 m!1050083))

(declare-fun m!1050085 () Bool)

(assert (=> b!1138118 m!1050085))

(declare-fun m!1050087 () Bool)

(assert (=> b!1138118 m!1050087))

(declare-fun m!1050089 () Bool)

(assert (=> b!1138130 m!1050089))

(declare-fun m!1050091 () Bool)

(assert (=> b!1138114 m!1050091))

(declare-fun m!1050093 () Bool)

(assert (=> b!1138138 m!1050093))

(declare-fun m!1050095 () Bool)

(assert (=> b!1138138 m!1050095))

(declare-fun m!1050097 () Bool)

(assert (=> bm!50295 m!1050097))

(declare-fun m!1050099 () Bool)

(assert (=> mapNonEmpty!44714 m!1050099))

(declare-fun m!1050101 () Bool)

(assert (=> b!1138116 m!1050101))

(declare-fun m!1050103 () Bool)

(assert (=> b!1138116 m!1050103))

(assert (=> b!1138126 m!1050051))

(declare-fun m!1050105 () Bool)

(assert (=> bm!50300 m!1050105))

(declare-fun m!1050107 () Bool)

(assert (=> b!1138123 m!1050107))

(check-sat tp_is_empty!28593 (not b!1138126) (not b!1138122) (not b!1138114) (not b!1138137) (not bm!50298) (not bm!50300) (not bm!50295) (not b!1138118) (not start!98458) (not bm!50302) (not b!1138132) (not b!1138112) (not b_next!24063) (not bm!50301) (not b!1138124) (not b!1138119) (not b_lambda!19169) (not mapNonEmpty!44714) (not b!1138116) (not b!1138139) (not b!1138123) (not b!1138140) (not b!1138138) (not b!1138133) b_and!38977)
(check-sat b_and!38977 (not b_next!24063))
