; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98422 () Bool)

(assert start!98422)

(declare-fun b_free!23887 () Bool)

(declare-fun b_next!23887 () Bool)

(assert (=> start!98422 (= b_free!23887 (not b_next!23887))))

(declare-fun tp!84365 () Bool)

(declare-fun b_and!38567 () Bool)

(assert (=> start!98422 (= tp!84365 b_and!38567)))

(declare-datatypes ((V!43017 0))(
  ( (V!43018 (val!14265 Int)) )
))
(declare-fun zeroValue!944 () V!43017)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!48181 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!43017)

(declare-datatypes ((array!73737 0))(
  ( (array!73738 (arr!35515 (Array (_ BitVec 32) (_ BitVec 64))) (size!36052 (_ BitVec 32))) )
))
(declare-fun lt!502087 () array!73737)

(declare-datatypes ((tuple2!17978 0))(
  ( (tuple2!17979 (_1!9000 (_ BitVec 64)) (_2!9000 V!43017)) )
))
(declare-datatypes ((List!24756 0))(
  ( (Nil!24753) (Cons!24752 (h!25970 tuple2!17978) (t!35627 List!24756)) )
))
(declare-datatypes ((ListLongMap!15955 0))(
  ( (ListLongMap!15956 (toList!7993 List!24756)) )
))
(declare-fun call!48189 () ListLongMap!15955)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13499 0))(
  ( (ValueCellFull!13499 (v!16894 V!43017)) (EmptyCell!13499) )
))
(declare-datatypes ((array!73739 0))(
  ( (array!73740 (arr!35516 (Array (_ BitVec 32) ValueCell!13499)) (size!36053 (_ BitVec 32))) )
))
(declare-fun lt!502078 () array!73739)

(declare-fun getCurrentListMapNoExtraKeys!4513 (array!73737 array!73739 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) Int) ListLongMap!15955)

(assert (=> bm!48181 (= call!48189 (getCurrentListMapNoExtraKeys!4513 lt!502087 lt!502078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131004 () Bool)

(declare-fun e!643769 () Bool)

(declare-fun e!643774 () Bool)

(assert (=> b!1131004 (= e!643769 e!643774)))

(declare-fun res!755409 () Bool)

(assert (=> b!1131004 (=> res!755409 e!643774)))

(declare-fun _keys!1208 () array!73737)

(assert (=> b!1131004 (= res!755409 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208))))))

(declare-datatypes ((Unit!36986 0))(
  ( (Unit!36987) )
))
(declare-fun lt!502076 () Unit!36986)

(declare-fun e!643773 () Unit!36986)

(assert (=> b!1131004 (= lt!502076 e!643773)))

(declare-fun c!110321 () Bool)

(declare-fun lt!502085 () Bool)

(assert (=> b!1131004 (= c!110321 (and (not lt!502085) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131004 (= lt!502085 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131005 () Bool)

(declare-fun res!755402 () Bool)

(declare-fun e!643779 () Bool)

(assert (=> b!1131005 (=> (not res!755402) (not e!643779))))

(declare-fun _values!996 () array!73739)

(assert (=> b!1131005 (= res!755402 (and (= (size!36053 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36052 _keys!1208) (size!36053 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131006 () Bool)

(declare-fun res!755407 () Bool)

(assert (=> b!1131006 (=> (not res!755407) (not e!643779))))

(declare-datatypes ((List!24757 0))(
  ( (Nil!24754) (Cons!24753 (h!25971 (_ BitVec 64)) (t!35628 List!24757)) )
))
(declare-fun arrayNoDuplicates!0 (array!73737 (_ BitVec 32) List!24757) Bool)

(assert (=> b!1131006 (= res!755407 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24754))))

(declare-fun b!1131007 () Bool)

(declare-fun res!755400 () Bool)

(declare-fun e!643780 () Bool)

(assert (=> b!1131007 (=> (not res!755400) (not e!643780))))

(assert (=> b!1131007 (= res!755400 (arrayNoDuplicates!0 lt!502087 #b00000000000000000000000000000000 Nil!24754))))

(declare-fun mapNonEmpty!44443 () Bool)

(declare-fun mapRes!44443 () Bool)

(declare-fun tp!84364 () Bool)

(declare-fun e!643778 () Bool)

(assert (=> mapNonEmpty!44443 (= mapRes!44443 (and tp!84364 e!643778))))

(declare-fun mapRest!44443 () (Array (_ BitVec 32) ValueCell!13499))

(declare-fun mapValue!44443 () ValueCell!13499)

(declare-fun mapKey!44443 () (_ BitVec 32))

(assert (=> mapNonEmpty!44443 (= (arr!35516 _values!996) (store mapRest!44443 mapKey!44443 mapValue!44443))))

(declare-fun b!1131008 () Bool)

(declare-fun c!110319 () Bool)

(assert (=> b!1131008 (= c!110319 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502085))))

(declare-fun e!643775 () Unit!36986)

(declare-fun e!643771 () Unit!36986)

(assert (=> b!1131008 (= e!643775 e!643771)))

(declare-fun b!1131009 () Bool)

(declare-fun e!643770 () Bool)

(declare-fun call!48187 () ListLongMap!15955)

(assert (=> b!1131009 (= e!643770 (= call!48189 call!48187))))

(declare-fun bm!48182 () Bool)

(declare-fun call!48184 () Bool)

(declare-fun call!48190 () Bool)

(assert (=> bm!48182 (= call!48184 call!48190)))

(declare-fun b!1131010 () Bool)

(assert (=> b!1131010 (= e!643779 e!643780)))

(declare-fun res!755404 () Bool)

(assert (=> b!1131010 (=> (not res!755404) (not e!643780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73737 (_ BitVec 32)) Bool)

(assert (=> b!1131010 (= res!755404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502087 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131010 (= lt!502087 (array!73738 (store (arr!35515 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36052 _keys!1208)))))

(declare-fun b!1131011 () Bool)

(declare-fun res!755406 () Bool)

(assert (=> b!1131011 (=> (not res!755406) (not e!643779))))

(assert (=> b!1131011 (= res!755406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131012 () Bool)

(declare-fun e!643772 () Bool)

(declare-fun e!643781 () Bool)

(assert (=> b!1131012 (= e!643772 e!643781)))

(declare-fun res!755396 () Bool)

(assert (=> b!1131012 (=> res!755396 e!643781)))

(assert (=> b!1131012 (= res!755396 (not (= from!1455 i!673)))))

(declare-fun lt!502077 () ListLongMap!15955)

(assert (=> b!1131012 (= lt!502077 (getCurrentListMapNoExtraKeys!4513 lt!502087 lt!502078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2575 (Int (_ BitVec 64)) V!43017)

(assert (=> b!1131012 (= lt!502078 (array!73740 (store (arr!35516 _values!996) i!673 (ValueCellFull!13499 (dynLambda!2575 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36053 _values!996)))))

(declare-fun lt!502073 () ListLongMap!15955)

(assert (=> b!1131012 (= lt!502073 (getCurrentListMapNoExtraKeys!4513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!48188 () Unit!36986)

(declare-fun c!110320 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!502079 () ListLongMap!15955)

(declare-fun lt!502082 () ListLongMap!15955)

(declare-fun bm!48183 () Bool)

(declare-fun addStillContains!688 (ListLongMap!15955 (_ BitVec 64) V!43017 (_ BitVec 64)) Unit!36986)

(assert (=> bm!48183 (= call!48188 (addStillContains!688 (ite c!110321 lt!502082 lt!502079) (ite c!110321 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110320 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110321 minValue!944 (ite c!110320 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131013 () Bool)

(declare-fun lt!502075 () Unit!36986)

(assert (=> b!1131013 (= e!643771 lt!502075)))

(declare-fun call!48186 () Unit!36986)

(assert (=> b!1131013 (= lt!502075 call!48186)))

(assert (=> b!1131013 call!48184))

(declare-fun b!1131014 () Bool)

(declare-fun e!643776 () Bool)

(declare-fun tp_is_empty!28417 () Bool)

(assert (=> b!1131014 (= e!643776 tp_is_empty!28417)))

(declare-fun b!1131015 () Bool)

(assert (=> b!1131015 call!48184))

(declare-fun lt!502086 () Unit!36986)

(assert (=> b!1131015 (= lt!502086 call!48186)))

(assert (=> b!1131015 (= e!643775 lt!502086)))

(declare-fun b!1131016 () Bool)

(assert (=> b!1131016 (= e!643778 tp_is_empty!28417)))

(declare-fun b!1131017 () Bool)

(declare-fun res!755405 () Bool)

(assert (=> b!1131017 (=> (not res!755405) (not e!643779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131017 (= res!755405 (validKeyInArray!0 k0!934))))

(declare-fun b!1131018 () Bool)

(declare-fun res!755410 () Bool)

(assert (=> b!1131018 (=> (not res!755410) (not e!643779))))

(assert (=> b!1131018 (= res!755410 (= (select (arr!35515 _keys!1208) i!673) k0!934))))

(declare-fun b!1131019 () Bool)

(assert (=> b!1131019 (= e!643773 e!643775)))

(assert (=> b!1131019 (= c!110320 (and (not lt!502085) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131020 () Bool)

(declare-fun e!643782 () Bool)

(assert (=> b!1131020 (= e!643781 e!643782)))

(declare-fun res!755403 () Bool)

(assert (=> b!1131020 (=> res!755403 e!643782)))

(assert (=> b!1131020 (= res!755403 (not (= (select (arr!35515 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1131020 e!643770))

(declare-fun c!110318 () Bool)

(assert (=> b!1131020 (= c!110318 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502083 () Unit!36986)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!416 (array!73737 array!73739 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36986)

(assert (=> b!1131020 (= lt!502083 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131021 () Bool)

(declare-fun e!643777 () Bool)

(assert (=> b!1131021 (= e!643777 (and e!643776 mapRes!44443))))

(declare-fun condMapEmpty!44443 () Bool)

(declare-fun mapDefault!44443 () ValueCell!13499)

(assert (=> b!1131021 (= condMapEmpty!44443 (= (arr!35516 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13499)) mapDefault!44443)))))

(declare-fun b!1131022 () Bool)

(assert (=> b!1131022 (= e!643782 e!643769)))

(declare-fun res!755397 () Bool)

(assert (=> b!1131022 (=> res!755397 e!643769)))

(declare-fun contains!6528 (ListLongMap!15955 (_ BitVec 64)) Bool)

(assert (=> b!1131022 (= res!755397 (not (contains!6528 lt!502079 k0!934)))))

(assert (=> b!1131022 (= lt!502079 (getCurrentListMapNoExtraKeys!4513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131023 () Bool)

(declare-fun res!755398 () Bool)

(assert (=> b!1131023 (=> (not res!755398) (not e!643779))))

(assert (=> b!1131023 (= res!755398 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36052 _keys!1208))))))

(declare-fun b!1131024 () Bool)

(assert (=> b!1131024 (= e!643774 true)))

(declare-fun lt!502074 () Bool)

(declare-fun getCurrentListMap!4424 (array!73737 array!73739 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) Int) ListLongMap!15955)

(assert (=> b!1131024 (= lt!502074 (contains!6528 (getCurrentListMap!4424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun res!755401 () Bool)

(assert (=> start!98422 (=> (not res!755401) (not e!643779))))

(assert (=> start!98422 (= res!755401 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36052 _keys!1208))))))

(assert (=> start!98422 e!643779))

(assert (=> start!98422 tp_is_empty!28417))

(declare-fun array_inv!27304 (array!73737) Bool)

(assert (=> start!98422 (array_inv!27304 _keys!1208)))

(assert (=> start!98422 true))

(assert (=> start!98422 tp!84365))

(declare-fun array_inv!27305 (array!73739) Bool)

(assert (=> start!98422 (and (array_inv!27305 _values!996) e!643777)))

(declare-fun b!1131003 () Bool)

(declare-fun lt!502084 () Unit!36986)

(assert (=> b!1131003 (= e!643773 lt!502084)))

(declare-fun lt!502081 () Unit!36986)

(assert (=> b!1131003 (= lt!502081 (addStillContains!688 lt!502079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!48185 () ListLongMap!15955)

(assert (=> b!1131003 (= lt!502082 call!48185)))

(assert (=> b!1131003 call!48190))

(assert (=> b!1131003 (= lt!502084 call!48188)))

(declare-fun +!3462 (ListLongMap!15955 tuple2!17978) ListLongMap!15955)

(assert (=> b!1131003 (contains!6528 (+!3462 lt!502082 (tuple2!17979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!48184 () Bool)

(declare-fun call!48191 () ListLongMap!15955)

(assert (=> bm!48184 (= call!48191 call!48185)))

(declare-fun mapIsEmpty!44443 () Bool)

(assert (=> mapIsEmpty!44443 mapRes!44443))

(declare-fun bm!48185 () Bool)

(assert (=> bm!48185 (= call!48187 (getCurrentListMapNoExtraKeys!4513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131025 () Bool)

(declare-fun res!755408 () Bool)

(assert (=> b!1131025 (=> (not res!755408) (not e!643779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131025 (= res!755408 (validMask!0 mask!1564))))

(declare-fun bm!48186 () Bool)

(assert (=> bm!48186 (= call!48186 call!48188)))

(declare-fun b!1131026 () Bool)

(declare-fun Unit!36988 () Unit!36986)

(assert (=> b!1131026 (= e!643771 Unit!36988)))

(declare-fun b!1131027 () Bool)

(declare-fun -!1157 (ListLongMap!15955 (_ BitVec 64)) ListLongMap!15955)

(assert (=> b!1131027 (= e!643770 (= call!48189 (-!1157 call!48187 k0!934)))))

(declare-fun bm!48187 () Bool)

(assert (=> bm!48187 (= call!48185 (+!3462 lt!502079 (ite (or c!110321 c!110320) (tuple2!17979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1131028 () Bool)

(assert (=> b!1131028 (= e!643780 (not e!643772))))

(declare-fun res!755399 () Bool)

(assert (=> b!1131028 (=> res!755399 e!643772)))

(assert (=> b!1131028 (= res!755399 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131028 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502080 () Unit!36986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73737 (_ BitVec 64) (_ BitVec 32)) Unit!36986)

(assert (=> b!1131028 (= lt!502080 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48188 () Bool)

(assert (=> bm!48188 (= call!48190 (contains!6528 (ite c!110321 lt!502082 call!48191) k0!934))))

(assert (= (and start!98422 res!755401) b!1131025))

(assert (= (and b!1131025 res!755408) b!1131005))

(assert (= (and b!1131005 res!755402) b!1131011))

(assert (= (and b!1131011 res!755406) b!1131006))

(assert (= (and b!1131006 res!755407) b!1131023))

(assert (= (and b!1131023 res!755398) b!1131017))

(assert (= (and b!1131017 res!755405) b!1131018))

(assert (= (and b!1131018 res!755410) b!1131010))

(assert (= (and b!1131010 res!755404) b!1131007))

(assert (= (and b!1131007 res!755400) b!1131028))

(assert (= (and b!1131028 (not res!755399)) b!1131012))

(assert (= (and b!1131012 (not res!755396)) b!1131020))

(assert (= (and b!1131020 c!110318) b!1131027))

(assert (= (and b!1131020 (not c!110318)) b!1131009))

(assert (= (or b!1131027 b!1131009) bm!48181))

(assert (= (or b!1131027 b!1131009) bm!48185))

(assert (= (and b!1131020 (not res!755403)) b!1131022))

(assert (= (and b!1131022 (not res!755397)) b!1131004))

(assert (= (and b!1131004 c!110321) b!1131003))

(assert (= (and b!1131004 (not c!110321)) b!1131019))

(assert (= (and b!1131019 c!110320) b!1131015))

(assert (= (and b!1131019 (not c!110320)) b!1131008))

(assert (= (and b!1131008 c!110319) b!1131013))

(assert (= (and b!1131008 (not c!110319)) b!1131026))

(assert (= (or b!1131015 b!1131013) bm!48186))

(assert (= (or b!1131015 b!1131013) bm!48184))

(assert (= (or b!1131015 b!1131013) bm!48182))

(assert (= (or b!1131003 bm!48182) bm!48188))

(assert (= (or b!1131003 bm!48186) bm!48183))

(assert (= (or b!1131003 bm!48184) bm!48187))

(assert (= (and b!1131004 (not res!755409)) b!1131024))

(assert (= (and b!1131021 condMapEmpty!44443) mapIsEmpty!44443))

(assert (= (and b!1131021 (not condMapEmpty!44443)) mapNonEmpty!44443))

(get-info :version)

(assert (= (and mapNonEmpty!44443 ((_ is ValueCellFull!13499) mapValue!44443)) b!1131016))

(assert (= (and b!1131021 ((_ is ValueCellFull!13499) mapDefault!44443)) b!1131014))

(assert (= start!98422 b!1131021))

(declare-fun b_lambda!18867 () Bool)

(assert (=> (not b_lambda!18867) (not b!1131012)))

(declare-fun t!35626 () Bool)

(declare-fun tb!8691 () Bool)

(assert (=> (and start!98422 (= defaultEntry!1004 defaultEntry!1004) t!35626) tb!8691))

(declare-fun result!17951 () Bool)

(assert (=> tb!8691 (= result!17951 tp_is_empty!28417)))

(assert (=> b!1131012 t!35626))

(declare-fun b_and!38569 () Bool)

(assert (= b_and!38567 (and (=> t!35626 result!17951) b_and!38569)))

(declare-fun m!1044681 () Bool)

(assert (=> b!1131018 m!1044681))

(declare-fun m!1044683 () Bool)

(assert (=> bm!48185 m!1044683))

(declare-fun m!1044685 () Bool)

(assert (=> b!1131022 m!1044685))

(assert (=> b!1131022 m!1044683))

(declare-fun m!1044687 () Bool)

(assert (=> bm!48188 m!1044687))

(declare-fun m!1044689 () Bool)

(assert (=> b!1131017 m!1044689))

(declare-fun m!1044691 () Bool)

(assert (=> bm!48183 m!1044691))

(declare-fun m!1044693 () Bool)

(assert (=> b!1131025 m!1044693))

(declare-fun m!1044695 () Bool)

(assert (=> b!1131012 m!1044695))

(declare-fun m!1044697 () Bool)

(assert (=> b!1131012 m!1044697))

(declare-fun m!1044699 () Bool)

(assert (=> b!1131012 m!1044699))

(declare-fun m!1044701 () Bool)

(assert (=> b!1131012 m!1044701))

(declare-fun m!1044703 () Bool)

(assert (=> start!98422 m!1044703))

(declare-fun m!1044705 () Bool)

(assert (=> start!98422 m!1044705))

(declare-fun m!1044707 () Bool)

(assert (=> b!1131006 m!1044707))

(declare-fun m!1044709 () Bool)

(assert (=> b!1131024 m!1044709))

(assert (=> b!1131024 m!1044709))

(declare-fun m!1044711 () Bool)

(assert (=> b!1131024 m!1044711))

(declare-fun m!1044713 () Bool)

(assert (=> b!1131027 m!1044713))

(declare-fun m!1044715 () Bool)

(assert (=> bm!48181 m!1044715))

(declare-fun m!1044717 () Bool)

(assert (=> b!1131011 m!1044717))

(declare-fun m!1044719 () Bool)

(assert (=> b!1131007 m!1044719))

(declare-fun m!1044721 () Bool)

(assert (=> b!1131028 m!1044721))

(declare-fun m!1044723 () Bool)

(assert (=> b!1131028 m!1044723))

(declare-fun m!1044725 () Bool)

(assert (=> bm!48187 m!1044725))

(declare-fun m!1044727 () Bool)

(assert (=> b!1131003 m!1044727))

(declare-fun m!1044729 () Bool)

(assert (=> b!1131003 m!1044729))

(assert (=> b!1131003 m!1044729))

(declare-fun m!1044731 () Bool)

(assert (=> b!1131003 m!1044731))

(declare-fun m!1044733 () Bool)

(assert (=> b!1131010 m!1044733))

(declare-fun m!1044735 () Bool)

(assert (=> b!1131010 m!1044735))

(declare-fun m!1044737 () Bool)

(assert (=> mapNonEmpty!44443 m!1044737))

(declare-fun m!1044739 () Bool)

(assert (=> b!1131020 m!1044739))

(declare-fun m!1044741 () Bool)

(assert (=> b!1131020 m!1044741))

(check-sat (not start!98422) (not bm!48187) (not b_lambda!18867) (not bm!48183) (not bm!48188) (not b!1131007) (not b!1131012) (not b!1131003) (not b!1131010) (not mapNonEmpty!44443) (not b!1131011) (not b_next!23887) (not b!1131006) (not bm!48181) (not b!1131025) (not b!1131024) tp_is_empty!28417 (not b!1131017) (not b!1131022) (not b!1131027) (not b!1131028) (not b!1131020) (not bm!48185) b_and!38569)
(check-sat b_and!38569 (not b_next!23887))
