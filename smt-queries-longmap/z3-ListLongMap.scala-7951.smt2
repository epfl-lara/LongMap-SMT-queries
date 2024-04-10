; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98548 () Bool)

(assert start!98548)

(declare-fun b_free!24153 () Bool)

(declare-fun b_next!24153 () Bool)

(assert (=> start!98548 (= b_free!24153 (not b_next!24153))))

(declare-fun tp!85170 () Bool)

(declare-fun b_and!39155 () Bool)

(assert (=> start!98548 (= tp!85170 b_and!39155)))

(declare-datatypes ((V!43371 0))(
  ( (V!43372 (val!14398 Int)) )
))
(declare-datatypes ((tuple2!18216 0))(
  ( (tuple2!18217 (_1!9119 (_ BitVec 64)) (_2!9119 V!43371)) )
))
(declare-datatypes ((List!24971 0))(
  ( (Nil!24968) (Cons!24967 (h!26176 tuple2!18216) (t!36116 List!24971)) )
))
(declare-datatypes ((ListLongMap!16185 0))(
  ( (ListLongMap!16186 (toList!8108 List!24971)) )
))
(declare-fun lt!509025 () ListLongMap!16185)

(declare-fun call!51384 () ListLongMap!16185)

(declare-fun c!112238 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!51375 () Bool)

(declare-fun call!51378 () Bool)

(declare-fun contains!6643 (ListLongMap!16185 (_ BitVec 64)) Bool)

(assert (=> bm!51375 (= call!51378 (contains!6643 (ite c!112238 lt!509025 call!51384) k0!934))))

(declare-fun b!1142117 () Bool)

(declare-fun e!649759 () Bool)

(declare-fun e!649758 () Bool)

(assert (=> b!1142117 (= e!649759 (not e!649758))))

(declare-fun res!761186 () Bool)

(assert (=> b!1142117 (=> res!761186 e!649758)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142117 (= res!761186 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74219 0))(
  ( (array!74220 (arr!35760 (Array (_ BitVec 32) (_ BitVec 64))) (size!36296 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74219)

(declare-fun arrayContainsKey!0 (array!74219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142117 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37463 0))(
  ( (Unit!37464) )
))
(declare-fun lt!509031 () Unit!37463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74219 (_ BitVec 64) (_ BitVec 32)) Unit!37463)

(assert (=> b!1142117 (= lt!509031 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1142118 () Bool)

(declare-fun res!761176 () Bool)

(declare-fun e!649761 () Bool)

(assert (=> b!1142118 (=> (not res!761176) (not e!649761))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142118 (= res!761176 (validMask!0 mask!1564))))

(declare-fun b!1142119 () Bool)

(declare-fun e!649755 () Bool)

(declare-fun tp_is_empty!28683 () Bool)

(assert (=> b!1142119 (= e!649755 tp_is_empty!28683)))

(declare-fun e!649767 () Bool)

(declare-fun b!1142120 () Bool)

(assert (=> b!1142120 (= e!649767 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142121 () Bool)

(declare-fun res!761177 () Bool)

(assert (=> b!1142121 (=> (not res!761177) (not e!649759))))

(declare-fun lt!509017 () array!74219)

(declare-datatypes ((List!24972 0))(
  ( (Nil!24969) (Cons!24968 (h!26177 (_ BitVec 64)) (t!36117 List!24972)) )
))
(declare-fun arrayNoDuplicates!0 (array!74219 (_ BitVec 32) List!24972) Bool)

(assert (=> b!1142121 (= res!761177 (arrayNoDuplicates!0 lt!509017 #b00000000000000000000000000000000 Nil!24969))))

(declare-fun b!1142122 () Bool)

(declare-fun e!649754 () Bool)

(declare-fun mapRes!44849 () Bool)

(assert (=> b!1142122 (= e!649754 (and e!649755 mapRes!44849))))

(declare-fun condMapEmpty!44849 () Bool)

(declare-datatypes ((ValueCell!13632 0))(
  ( (ValueCellFull!13632 (v!17035 V!43371)) (EmptyCell!13632) )
))
(declare-datatypes ((array!74221 0))(
  ( (array!74222 (arr!35761 (Array (_ BitVec 32) ValueCell!13632)) (size!36297 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74221)

(declare-fun mapDefault!44849 () ValueCell!13632)

(assert (=> b!1142122 (= condMapEmpty!44849 (= (arr!35761 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13632)) mapDefault!44849)))))

(declare-fun b!1142123 () Bool)

(declare-fun c!112236 () Bool)

(declare-fun lt!509029 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142123 (= c!112236 (and (not lt!509029) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649760 () Unit!37463)

(declare-fun e!649753 () Unit!37463)

(assert (=> b!1142123 (= e!649760 e!649753)))

(declare-fun b!1142124 () Bool)

(declare-fun res!761181 () Bool)

(assert (=> b!1142124 (=> (not res!761181) (not e!649761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142124 (= res!761181 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!43371)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!51376 () Bool)

(declare-fun lt!509020 () array!74221)

(declare-fun call!51385 () ListLongMap!16185)

(declare-fun minValue!944 () V!43371)

(declare-fun getCurrentListMapNoExtraKeys!4590 (array!74219 array!74221 (_ BitVec 32) (_ BitVec 32) V!43371 V!43371 (_ BitVec 32) Int) ListLongMap!16185)

(assert (=> bm!51376 (= call!51385 (getCurrentListMapNoExtraKeys!4590 lt!509017 lt!509020 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142125 () Bool)

(declare-fun res!761189 () Bool)

(assert (=> b!1142125 (=> (not res!761189) (not e!649761))))

(assert (=> b!1142125 (= res!761189 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24969))))

(declare-fun bm!51377 () Bool)

(declare-fun call!51380 () Unit!37463)

(declare-fun call!51383 () Unit!37463)

(assert (=> bm!51377 (= call!51380 call!51383)))

(declare-fun res!761188 () Bool)

(assert (=> start!98548 (=> (not res!761188) (not e!649761))))

(assert (=> start!98548 (= res!761188 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36296 _keys!1208))))))

(assert (=> start!98548 e!649761))

(assert (=> start!98548 tp_is_empty!28683))

(declare-fun array_inv!27408 (array!74219) Bool)

(assert (=> start!98548 (array_inv!27408 _keys!1208)))

(assert (=> start!98548 true))

(assert (=> start!98548 tp!85170))

(declare-fun array_inv!27409 (array!74221) Bool)

(assert (=> start!98548 (and (array_inv!27409 _values!996) e!649754)))

(declare-fun b!1142126 () Bool)

(declare-fun res!761184 () Bool)

(assert (=> b!1142126 (=> (not res!761184) (not e!649761))))

(assert (=> b!1142126 (= res!761184 (= (select (arr!35760 _keys!1208) i!673) k0!934))))

(declare-fun b!1142127 () Bool)

(declare-fun e!649763 () Unit!37463)

(declare-fun Unit!37465 () Unit!37463)

(assert (=> b!1142127 (= e!649763 Unit!37465)))

(declare-fun bm!51378 () Bool)

(declare-fun call!51379 () Bool)

(assert (=> bm!51378 (= call!51379 call!51378)))

(declare-fun mapIsEmpty!44849 () Bool)

(assert (=> mapIsEmpty!44849 mapRes!44849))

(declare-fun b!1142128 () Bool)

(declare-fun e!649752 () Bool)

(assert (=> b!1142128 (= e!649752 true)))

(declare-fun lt!509026 () V!43371)

(declare-fun lt!509018 () ListLongMap!16185)

(declare-fun -!1258 (ListLongMap!16185 (_ BitVec 64)) ListLongMap!16185)

(declare-fun +!3539 (ListLongMap!16185 tuple2!18216) ListLongMap!16185)

(assert (=> b!1142128 (= (-!1258 (+!3539 lt!509018 (tuple2!18217 (select (arr!35760 _keys!1208) from!1455) lt!509026)) (select (arr!35760 _keys!1208) from!1455)) lt!509018)))

(declare-fun lt!509016 () Unit!37463)

(declare-fun addThenRemoveForNewKeyIsSame!111 (ListLongMap!16185 (_ BitVec 64) V!43371) Unit!37463)

(assert (=> b!1142128 (= lt!509016 (addThenRemoveForNewKeyIsSame!111 lt!509018 (select (arr!35760 _keys!1208) from!1455) lt!509026))))

(declare-fun lt!509024 () V!43371)

(declare-fun get!18175 (ValueCell!13632 V!43371) V!43371)

(assert (=> b!1142128 (= lt!509026 (get!18175 (select (arr!35761 _values!996) from!1455) lt!509024))))

(declare-fun lt!509027 () Unit!37463)

(declare-fun e!649762 () Unit!37463)

(assert (=> b!1142128 (= lt!509027 e!649762)))

(declare-fun c!112237 () Bool)

(assert (=> b!1142128 (= c!112237 (contains!6643 lt!509018 k0!934))))

(assert (=> b!1142128 (= lt!509018 (getCurrentListMapNoExtraKeys!4590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142129 () Bool)

(declare-fun Unit!37466 () Unit!37463)

(assert (=> b!1142129 (= e!649762 Unit!37466)))

(declare-fun bm!51379 () Bool)

(declare-fun call!51382 () ListLongMap!16185)

(assert (=> bm!51379 (= call!51384 call!51382)))

(declare-fun b!1142130 () Bool)

(declare-fun lt!509011 () Unit!37463)

(assert (=> b!1142130 (= e!649753 lt!509011)))

(assert (=> b!1142130 (= lt!509011 call!51380)))

(assert (=> b!1142130 call!51379))

(declare-fun b!1142131 () Bool)

(assert (=> b!1142131 (contains!6643 (+!3539 lt!509025 (tuple2!18217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509021 () Unit!37463)

(assert (=> b!1142131 (= lt!509021 call!51383)))

(assert (=> b!1142131 call!51378))

(assert (=> b!1142131 (= lt!509025 call!51382)))

(declare-fun lt!509012 () Unit!37463)

(declare-fun addStillContains!796 (ListLongMap!16185 (_ BitVec 64) V!43371 (_ BitVec 64)) Unit!37463)

(assert (=> b!1142131 (= lt!509012 (addStillContains!796 lt!509018 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1142131 (= e!649760 lt!509021)))

(declare-fun b!1142132 () Bool)

(declare-fun e!649764 () Bool)

(assert (=> b!1142132 (= e!649764 tp_is_empty!28683)))

(declare-fun call!51381 () ListLongMap!16185)

(declare-fun e!649766 () Bool)

(declare-fun b!1142133 () Bool)

(assert (=> b!1142133 (= e!649766 (= call!51385 (-!1258 call!51381 k0!934)))))

(declare-fun b!1142134 () Bool)

(declare-fun e!649765 () Bool)

(assert (=> b!1142134 (= e!649765 e!649752)))

(declare-fun res!761187 () Bool)

(assert (=> b!1142134 (=> res!761187 e!649752)))

(assert (=> b!1142134 (= res!761187 (not (= (select (arr!35760 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142134 e!649766))

(declare-fun c!112240 () Bool)

(assert (=> b!1142134 (= c!112240 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509014 () Unit!37463)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!501 (array!74219 array!74221 (_ BitVec 32) (_ BitVec 32) V!43371 V!43371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37463)

(assert (=> b!1142134 (= lt!509014 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142135 () Bool)

(assert (=> b!1142135 (= e!649767 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509029) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142136 () Bool)

(assert (=> b!1142136 (= e!649766 (= call!51385 call!51381))))

(declare-fun b!1142137 () Bool)

(declare-fun Unit!37467 () Unit!37463)

(assert (=> b!1142137 (= e!649762 Unit!37467)))

(assert (=> b!1142137 (= lt!509029 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142137 (= c!112238 (and (not lt!509029) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509013 () Unit!37463)

(assert (=> b!1142137 (= lt!509013 e!649760)))

(declare-fun lt!509022 () Unit!37463)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!391 (array!74219 array!74221 (_ BitVec 32) (_ BitVec 32) V!43371 V!43371 (_ BitVec 64) (_ BitVec 32) Int) Unit!37463)

(assert (=> b!1142137 (= lt!509022 (lemmaListMapContainsThenArrayContainsFrom!391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112235 () Bool)

(assert (=> b!1142137 (= c!112235 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761179 () Bool)

(assert (=> b!1142137 (= res!761179 e!649767)))

(declare-fun e!649757 () Bool)

(assert (=> b!1142137 (=> (not res!761179) (not e!649757))))

(assert (=> b!1142137 e!649757))

(declare-fun lt!509023 () Unit!37463)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74219 (_ BitVec 32) (_ BitVec 32)) Unit!37463)

(assert (=> b!1142137 (= lt!509023 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142137 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24969)))

(declare-fun lt!509028 () Unit!37463)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74219 (_ BitVec 64) (_ BitVec 32) List!24972) Unit!37463)

(assert (=> b!1142137 (= lt!509028 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24969))))

(assert (=> b!1142137 false))

(declare-fun b!1142138 () Bool)

(declare-fun res!761183 () Bool)

(assert (=> b!1142138 (=> (not res!761183) (not e!649761))))

(assert (=> b!1142138 (= res!761183 (and (= (size!36297 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36296 _keys!1208) (size!36297 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142139 () Bool)

(assert (=> b!1142139 (= e!649757 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142140 () Bool)

(assert (=> b!1142140 (= e!649761 e!649759)))

(declare-fun res!761178 () Bool)

(assert (=> b!1142140 (=> (not res!761178) (not e!649759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74219 (_ BitVec 32)) Bool)

(assert (=> b!1142140 (= res!761178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509017 mask!1564))))

(assert (=> b!1142140 (= lt!509017 (array!74220 (store (arr!35760 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36296 _keys!1208)))))

(declare-fun b!1142141 () Bool)

(declare-fun res!761182 () Bool)

(assert (=> b!1142141 (=> (not res!761182) (not e!649761))))

(assert (=> b!1142141 (= res!761182 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36296 _keys!1208))))))

(declare-fun bm!51380 () Bool)

(assert (=> bm!51380 (= call!51383 (addStillContains!796 (ite c!112238 lt!509025 lt!509018) (ite c!112238 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112236 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112238 minValue!944 (ite c!112236 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!44849 () Bool)

(declare-fun tp!85169 () Bool)

(assert (=> mapNonEmpty!44849 (= mapRes!44849 (and tp!85169 e!649764))))

(declare-fun mapValue!44849 () ValueCell!13632)

(declare-fun mapKey!44849 () (_ BitVec 32))

(declare-fun mapRest!44849 () (Array (_ BitVec 32) ValueCell!13632))

(assert (=> mapNonEmpty!44849 (= (arr!35761 _values!996) (store mapRest!44849 mapKey!44849 mapValue!44849))))

(declare-fun b!1142142 () Bool)

(assert (=> b!1142142 (= e!649753 e!649763)))

(declare-fun c!112239 () Bool)

(assert (=> b!1142142 (= c!112239 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509029))))

(declare-fun b!1142143 () Bool)

(assert (=> b!1142143 call!51379))

(declare-fun lt!509015 () Unit!37463)

(assert (=> b!1142143 (= lt!509015 call!51380)))

(assert (=> b!1142143 (= e!649763 lt!509015)))

(declare-fun b!1142144 () Bool)

(declare-fun res!761180 () Bool)

(assert (=> b!1142144 (=> (not res!761180) (not e!649761))))

(assert (=> b!1142144 (= res!761180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51381 () Bool)

(assert (=> bm!51381 (= call!51381 (getCurrentListMapNoExtraKeys!4590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142145 () Bool)

(assert (=> b!1142145 (= e!649758 e!649765)))

(declare-fun res!761185 () Bool)

(assert (=> b!1142145 (=> res!761185 e!649765)))

(assert (=> b!1142145 (= res!761185 (not (= from!1455 i!673)))))

(declare-fun lt!509019 () ListLongMap!16185)

(assert (=> b!1142145 (= lt!509019 (getCurrentListMapNoExtraKeys!4590 lt!509017 lt!509020 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142145 (= lt!509020 (array!74222 (store (arr!35761 _values!996) i!673 (ValueCellFull!13632 lt!509024)) (size!36297 _values!996)))))

(declare-fun dynLambda!2632 (Int (_ BitVec 64)) V!43371)

(assert (=> b!1142145 (= lt!509024 (dynLambda!2632 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509030 () ListLongMap!16185)

(assert (=> b!1142145 (= lt!509030 (getCurrentListMapNoExtraKeys!4590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!51382 () Bool)

(assert (=> bm!51382 (= call!51382 (+!3539 lt!509018 (ite (or c!112238 c!112236) (tuple2!18217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98548 res!761188) b!1142118))

(assert (= (and b!1142118 res!761176) b!1142138))

(assert (= (and b!1142138 res!761183) b!1142144))

(assert (= (and b!1142144 res!761180) b!1142125))

(assert (= (and b!1142125 res!761189) b!1142141))

(assert (= (and b!1142141 res!761182) b!1142124))

(assert (= (and b!1142124 res!761181) b!1142126))

(assert (= (and b!1142126 res!761184) b!1142140))

(assert (= (and b!1142140 res!761178) b!1142121))

(assert (= (and b!1142121 res!761177) b!1142117))

(assert (= (and b!1142117 (not res!761186)) b!1142145))

(assert (= (and b!1142145 (not res!761185)) b!1142134))

(assert (= (and b!1142134 c!112240) b!1142133))

(assert (= (and b!1142134 (not c!112240)) b!1142136))

(assert (= (or b!1142133 b!1142136) bm!51376))

(assert (= (or b!1142133 b!1142136) bm!51381))

(assert (= (and b!1142134 (not res!761187)) b!1142128))

(assert (= (and b!1142128 c!112237) b!1142137))

(assert (= (and b!1142128 (not c!112237)) b!1142129))

(assert (= (and b!1142137 c!112238) b!1142131))

(assert (= (and b!1142137 (not c!112238)) b!1142123))

(assert (= (and b!1142123 c!112236) b!1142130))

(assert (= (and b!1142123 (not c!112236)) b!1142142))

(assert (= (and b!1142142 c!112239) b!1142143))

(assert (= (and b!1142142 (not c!112239)) b!1142127))

(assert (= (or b!1142130 b!1142143) bm!51377))

(assert (= (or b!1142130 b!1142143) bm!51379))

(assert (= (or b!1142130 b!1142143) bm!51378))

(assert (= (or b!1142131 bm!51378) bm!51375))

(assert (= (or b!1142131 bm!51377) bm!51380))

(assert (= (or b!1142131 bm!51379) bm!51382))

(assert (= (and b!1142137 c!112235) b!1142120))

(assert (= (and b!1142137 (not c!112235)) b!1142135))

(assert (= (and b!1142137 res!761179) b!1142139))

(assert (= (and b!1142122 condMapEmpty!44849) mapIsEmpty!44849))

(assert (= (and b!1142122 (not condMapEmpty!44849)) mapNonEmpty!44849))

(get-info :version)

(assert (= (and mapNonEmpty!44849 ((_ is ValueCellFull!13632) mapValue!44849)) b!1142132))

(assert (= (and b!1142122 ((_ is ValueCellFull!13632) mapDefault!44849)) b!1142119))

(assert (= start!98548 b!1142122))

(declare-fun b_lambda!19259 () Bool)

(assert (=> (not b_lambda!19259) (not b!1142145)))

(declare-fun t!36115 () Bool)

(declare-fun tb!8965 () Bool)

(assert (=> (and start!98548 (= defaultEntry!1004 defaultEntry!1004) t!36115) tb!8965))

(declare-fun result!18495 () Bool)

(assert (=> tb!8965 (= result!18495 tp_is_empty!28683)))

(assert (=> b!1142145 t!36115))

(declare-fun b_and!39157 () Bool)

(assert (= b_and!39155 (and (=> t!36115 result!18495) b_and!39157)))

(declare-fun m!1053421 () Bool)

(assert (=> start!98548 m!1053421))

(declare-fun m!1053423 () Bool)

(assert (=> start!98548 m!1053423))

(declare-fun m!1053425 () Bool)

(assert (=> bm!51380 m!1053425))

(declare-fun m!1053427 () Bool)

(assert (=> b!1142125 m!1053427))

(declare-fun m!1053429 () Bool)

(assert (=> b!1142137 m!1053429))

(declare-fun m!1053431 () Bool)

(assert (=> b!1142137 m!1053431))

(declare-fun m!1053433 () Bool)

(assert (=> b!1142137 m!1053433))

(declare-fun m!1053435 () Bool)

(assert (=> b!1142137 m!1053435))

(declare-fun m!1053437 () Bool)

(assert (=> bm!51375 m!1053437))

(declare-fun m!1053439 () Bool)

(assert (=> b!1142128 m!1053439))

(declare-fun m!1053441 () Bool)

(assert (=> b!1142128 m!1053441))

(declare-fun m!1053443 () Bool)

(assert (=> b!1142128 m!1053443))

(declare-fun m!1053445 () Bool)

(assert (=> b!1142128 m!1053445))

(declare-fun m!1053447 () Bool)

(assert (=> b!1142128 m!1053447))

(declare-fun m!1053449 () Bool)

(assert (=> b!1142128 m!1053449))

(assert (=> b!1142128 m!1053443))

(assert (=> b!1142128 m!1053445))

(declare-fun m!1053451 () Bool)

(assert (=> b!1142128 m!1053451))

(assert (=> b!1142128 m!1053445))

(assert (=> b!1142128 m!1053441))

(declare-fun m!1053453 () Bool)

(assert (=> b!1142128 m!1053453))

(declare-fun m!1053455 () Bool)

(assert (=> b!1142140 m!1053455))

(declare-fun m!1053457 () Bool)

(assert (=> b!1142140 m!1053457))

(declare-fun m!1053459 () Bool)

(assert (=> b!1142118 m!1053459))

(assert (=> b!1142134 m!1053445))

(declare-fun m!1053461 () Bool)

(assert (=> b!1142134 m!1053461))

(declare-fun m!1053463 () Bool)

(assert (=> bm!51376 m!1053463))

(declare-fun m!1053465 () Bool)

(assert (=> bm!51382 m!1053465))

(assert (=> bm!51381 m!1053439))

(declare-fun m!1053467 () Bool)

(assert (=> b!1142120 m!1053467))

(declare-fun m!1053469 () Bool)

(assert (=> b!1142133 m!1053469))

(declare-fun m!1053471 () Bool)

(assert (=> b!1142145 m!1053471))

(declare-fun m!1053473 () Bool)

(assert (=> b!1142145 m!1053473))

(declare-fun m!1053475 () Bool)

(assert (=> b!1142145 m!1053475))

(declare-fun m!1053477 () Bool)

(assert (=> b!1142145 m!1053477))

(declare-fun m!1053479 () Bool)

(assert (=> b!1142121 m!1053479))

(declare-fun m!1053481 () Bool)

(assert (=> b!1142126 m!1053481))

(declare-fun m!1053483 () Bool)

(assert (=> mapNonEmpty!44849 m!1053483))

(declare-fun m!1053485 () Bool)

(assert (=> b!1142131 m!1053485))

(assert (=> b!1142131 m!1053485))

(declare-fun m!1053487 () Bool)

(assert (=> b!1142131 m!1053487))

(declare-fun m!1053489 () Bool)

(assert (=> b!1142131 m!1053489))

(declare-fun m!1053491 () Bool)

(assert (=> b!1142144 m!1053491))

(assert (=> b!1142139 m!1053467))

(declare-fun m!1053493 () Bool)

(assert (=> b!1142124 m!1053493))

(declare-fun m!1053495 () Bool)

(assert (=> b!1142117 m!1053495))

(declare-fun m!1053497 () Bool)

(assert (=> b!1142117 m!1053497))

(check-sat (not b_lambda!19259) (not b!1142117) (not b!1142124) tp_is_empty!28683 (not start!98548) (not b!1142121) (not b!1142131) (not bm!51382) (not b!1142145) (not mapNonEmpty!44849) (not b!1142140) (not b!1142125) (not b!1142118) (not b!1142133) b_and!39157 (not bm!51380) (not b_next!24153) (not bm!51375) (not bm!51381) (not b!1142139) (not b!1142137) (not b!1142134) (not b!1142128) (not b!1142120) (not b!1142144) (not bm!51376))
(check-sat b_and!39157 (not b_next!24153))
