; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100568 () Bool)

(assert start!100568)

(declare-fun b_free!25897 () Bool)

(declare-fun b_next!25897 () Bool)

(assert (=> start!100568 (= b_free!25897 (not b_next!25897))))

(declare-fun tp!90680 () Bool)

(declare-fun b_and!42659 () Bool)

(assert (=> start!100568 (= tp!90680 b_and!42659)))

(declare-fun b!1203015 () Bool)

(declare-fun res!800637 () Bool)

(declare-fun e!683109 () Bool)

(assert (=> b!1203015 (=> (not res!800637) (not e!683109))))

(declare-datatypes ((array!77890 0))(
  ( (array!77891 (arr!37590 (Array (_ BitVec 32) (_ BitVec 64))) (size!38128 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77890)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77890 (_ BitVec 32)) Bool)

(assert (=> b!1203015 (= res!800637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57938 () Bool)

(declare-fun c!117753 () Bool)

(declare-datatypes ((V!45929 0))(
  ( (V!45930 (val!15357 Int)) )
))
(declare-datatypes ((tuple2!19758 0))(
  ( (tuple2!19759 (_1!9890 (_ BitVec 64)) (_2!9890 V!45929)) )
))
(declare-datatypes ((List!26545 0))(
  ( (Nil!26542) (Cons!26541 (h!27750 tuple2!19758) (t!39413 List!26545)) )
))
(declare-datatypes ((ListLongMap!17727 0))(
  ( (ListLongMap!17728 (toList!8879 List!26545)) )
))
(declare-fun lt!545190 () ListLongMap!17727)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!57946 () Bool)

(declare-fun call!57945 () ListLongMap!17727)

(declare-fun contains!6873 (ListLongMap!17727 (_ BitVec 64)) Bool)

(assert (=> bm!57938 (= call!57946 (contains!6873 (ite c!117753 lt!545190 call!57945) k0!934))))

(declare-fun bm!57939 () Bool)

(declare-fun call!57943 () Bool)

(assert (=> bm!57939 (= call!57943 call!57946)))

(declare-fun b!1203016 () Bool)

(declare-fun res!800633 () Bool)

(declare-fun e!683115 () Bool)

(assert (=> b!1203016 (=> (not res!800633) (not e!683115))))

(declare-fun lt!545191 () array!77890)

(declare-datatypes ((List!26546 0))(
  ( (Nil!26543) (Cons!26542 (h!27751 (_ BitVec 64)) (t!39414 List!26546)) )
))
(declare-fun arrayNoDuplicates!0 (array!77890 (_ BitVec 32) List!26546) Bool)

(assert (=> b!1203016 (= res!800633 (arrayNoDuplicates!0 lt!545191 #b00000000000000000000000000000000 Nil!26543))))

(declare-fun call!57941 () ListLongMap!17727)

(declare-fun e!683108 () Bool)

(declare-fun b!1203017 () Bool)

(declare-fun call!57947 () ListLongMap!17727)

(declare-fun -!1773 (ListLongMap!17727 (_ BitVec 64)) ListLongMap!17727)

(assert (=> b!1203017 (= e!683108 (= call!57947 (-!1773 call!57941 k0!934)))))

(declare-fun zeroValue!944 () V!45929)

(declare-fun lt!545196 () ListLongMap!17727)

(declare-fun call!57944 () ListLongMap!17727)

(declare-fun bm!57940 () Bool)

(declare-fun c!117755 () Bool)

(declare-fun minValue!944 () V!45929)

(declare-fun +!4013 (ListLongMap!17727 tuple2!19758) ListLongMap!17727)

(assert (=> bm!57940 (= call!57944 (+!4013 lt!545196 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!57941 () Bool)

(declare-datatypes ((Unit!39733 0))(
  ( (Unit!39734) )
))
(declare-fun call!57942 () Unit!39733)

(declare-fun call!57948 () Unit!39733)

(assert (=> bm!57941 (= call!57942 call!57948)))

(declare-fun b!1203019 () Bool)

(declare-fun e!683112 () Bool)

(declare-fun tp_is_empty!30601 () Bool)

(assert (=> b!1203019 (= e!683112 tp_is_empty!30601)))

(declare-fun b!1203020 () Bool)

(assert (=> b!1203020 call!57943))

(declare-fun lt!545189 () Unit!39733)

(assert (=> b!1203020 (= lt!545189 call!57942)))

(declare-fun e!683116 () Unit!39733)

(assert (=> b!1203020 (= e!683116 lt!545189)))

(declare-fun b!1203021 () Bool)

(declare-fun e!683106 () Unit!39733)

(declare-fun lt!545187 () Unit!39733)

(assert (=> b!1203021 (= e!683106 lt!545187)))

(declare-fun lt!545195 () Unit!39733)

(declare-fun addStillContains!998 (ListLongMap!17727 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39733)

(assert (=> b!1203021 (= lt!545195 (addStillContains!998 lt!545196 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1203021 (= lt!545190 call!57944)))

(assert (=> b!1203021 call!57946))

(assert (=> b!1203021 (= lt!545187 call!57948)))

(assert (=> b!1203021 (contains!6873 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun mapIsEmpty!47744 () Bool)

(declare-fun mapRes!47744 () Bool)

(assert (=> mapIsEmpty!47744 mapRes!47744))

(declare-fun b!1203022 () Bool)

(declare-fun res!800642 () Bool)

(assert (=> b!1203022 (=> (not res!800642) (not e!683109))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14591 0))(
  ( (ValueCellFull!14591 (v!17994 V!45929)) (EmptyCell!14591) )
))
(declare-datatypes ((array!77892 0))(
  ( (array!77893 (arr!37591 (Array (_ BitVec 32) ValueCell!14591)) (size!38129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77892)

(assert (=> b!1203022 (= res!800642 (and (= (size!38129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38128 _keys!1208) (size!38129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!545194 () array!77892)

(declare-fun bm!57942 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5325 (array!77890 array!77892 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) Int) ListLongMap!17727)

(assert (=> bm!57942 (= call!57947 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203023 () Bool)

(declare-fun res!800641 () Bool)

(assert (=> b!1203023 (=> (not res!800641) (not e!683109))))

(assert (=> b!1203023 (= res!800641 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26543))))

(declare-fun b!1203024 () Bool)

(declare-fun e!683110 () Unit!39733)

(declare-fun lt!545200 () Unit!39733)

(assert (=> b!1203024 (= e!683110 lt!545200)))

(assert (=> b!1203024 (= lt!545200 call!57942)))

(assert (=> b!1203024 call!57943))

(declare-fun b!1203025 () Bool)

(declare-fun c!117754 () Bool)

(declare-fun lt!545199 () Bool)

(assert (=> b!1203025 (= c!117754 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545199))))

(assert (=> b!1203025 (= e!683116 e!683110)))

(declare-fun b!1203026 () Bool)

(declare-fun e!683113 () Bool)

(assert (=> b!1203026 (= e!683115 (not e!683113))))

(declare-fun res!800635 () Bool)

(assert (=> b!1203026 (=> res!800635 e!683113)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203026 (= res!800635 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203026 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545193 () Unit!39733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77890 (_ BitVec 64) (_ BitVec 32)) Unit!39733)

(assert (=> b!1203026 (= lt!545193 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1203027 () Bool)

(declare-fun e!683119 () Bool)

(declare-fun e!683111 () Bool)

(assert (=> b!1203027 (= e!683119 (and e!683111 mapRes!47744))))

(declare-fun condMapEmpty!47744 () Bool)

(declare-fun mapDefault!47744 () ValueCell!14591)

(assert (=> b!1203027 (= condMapEmpty!47744 (= (arr!37591 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14591)) mapDefault!47744)))))

(declare-fun b!1203028 () Bool)

(declare-fun res!800645 () Bool)

(assert (=> b!1203028 (=> (not res!800645) (not e!683109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203028 (= res!800645 (validMask!0 mask!1564))))

(declare-fun b!1203029 () Bool)

(assert (=> b!1203029 (= e!683111 tp_is_empty!30601)))

(declare-fun bm!57943 () Bool)

(assert (=> bm!57943 (= call!57941 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203030 () Bool)

(declare-fun res!800646 () Bool)

(assert (=> b!1203030 (=> (not res!800646) (not e!683109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203030 (= res!800646 (validKeyInArray!0 k0!934))))

(declare-fun b!1203031 () Bool)

(declare-fun e!683117 () Bool)

(declare-fun e!683114 () Bool)

(assert (=> b!1203031 (= e!683117 e!683114)))

(declare-fun res!800639 () Bool)

(assert (=> b!1203031 (=> res!800639 e!683114)))

(assert (=> b!1203031 (= res!800639 (not (contains!6873 lt!545196 k0!934)))))

(assert (=> b!1203031 (= lt!545196 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203032 () Bool)

(declare-fun Unit!39735 () Unit!39733)

(assert (=> b!1203032 (= e!683110 Unit!39735)))

(declare-fun bm!57944 () Bool)

(assert (=> bm!57944 (= call!57945 call!57944)))

(declare-fun b!1203018 () Bool)

(assert (=> b!1203018 (= e!683106 e!683116)))

(assert (=> b!1203018 (= c!117755 (and (not lt!545199) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!800638 () Bool)

(assert (=> start!100568 (=> (not res!800638) (not e!683109))))

(assert (=> start!100568 (= res!800638 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38128 _keys!1208))))))

(assert (=> start!100568 e!683109))

(assert (=> start!100568 tp_is_empty!30601))

(declare-fun array_inv!28750 (array!77890) Bool)

(assert (=> start!100568 (array_inv!28750 _keys!1208)))

(assert (=> start!100568 true))

(assert (=> start!100568 tp!90680))

(declare-fun array_inv!28751 (array!77892) Bool)

(assert (=> start!100568 (and (array_inv!28751 _values!996) e!683119)))

(declare-fun b!1203033 () Bool)

(declare-fun res!800634 () Bool)

(assert (=> b!1203033 (=> (not res!800634) (not e!683109))))

(assert (=> b!1203033 (= res!800634 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38128 _keys!1208))))))

(declare-fun b!1203034 () Bool)

(declare-fun e!683107 () Bool)

(assert (=> b!1203034 (= e!683113 e!683107)))

(declare-fun res!800644 () Bool)

(assert (=> b!1203034 (=> res!800644 e!683107)))

(assert (=> b!1203034 (= res!800644 (not (= from!1455 i!673)))))

(declare-fun lt!545188 () ListLongMap!17727)

(assert (=> b!1203034 (= lt!545188 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3199 (Int (_ BitVec 64)) V!45929)

(assert (=> b!1203034 (= lt!545194 (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)))))

(declare-fun lt!545192 () ListLongMap!17727)

(assert (=> b!1203034 (= lt!545192 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203035 () Bool)

(assert (=> b!1203035 (= e!683107 e!683117)))

(declare-fun res!800636 () Bool)

(assert (=> b!1203035 (=> res!800636 e!683117)))

(assert (=> b!1203035 (= res!800636 (not (= (select (arr!37590 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203035 e!683108))

(declare-fun c!117756 () Bool)

(assert (=> b!1203035 (= c!117756 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545197 () Unit!39733)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 (array!77890 array!77892 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39733)

(assert (=> b!1203035 (= lt!545197 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203036 () Bool)

(assert (=> b!1203036 (= e!683108 (= call!57947 call!57941))))

(declare-fun b!1203037 () Bool)

(declare-fun res!800643 () Bool)

(assert (=> b!1203037 (=> (not res!800643) (not e!683109))))

(assert (=> b!1203037 (= res!800643 (= (select (arr!37590 _keys!1208) i!673) k0!934))))

(declare-fun bm!57945 () Bool)

(assert (=> bm!57945 (= call!57948 (addStillContains!998 (ite c!117753 lt!545190 lt!545196) (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1203038 () Bool)

(assert (=> b!1203038 (= e!683109 e!683115)))

(declare-fun res!800640 () Bool)

(assert (=> b!1203038 (=> (not res!800640) (not e!683115))))

(assert (=> b!1203038 (= res!800640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545191 mask!1564))))

(assert (=> b!1203038 (= lt!545191 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))

(declare-fun mapNonEmpty!47744 () Bool)

(declare-fun tp!90681 () Bool)

(assert (=> mapNonEmpty!47744 (= mapRes!47744 (and tp!90681 e!683112))))

(declare-fun mapRest!47744 () (Array (_ BitVec 32) ValueCell!14591))

(declare-fun mapKey!47744 () (_ BitVec 32))

(declare-fun mapValue!47744 () ValueCell!14591)

(assert (=> mapNonEmpty!47744 (= (arr!37591 _values!996) (store mapRest!47744 mapKey!47744 mapValue!47744))))

(declare-fun b!1203039 () Bool)

(assert (=> b!1203039 (= e!683114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208))))))

(declare-fun lt!545198 () Unit!39733)

(assert (=> b!1203039 (= lt!545198 e!683106)))

(assert (=> b!1203039 (= c!117753 (and (not lt!545199) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203039 (= lt!545199 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!100568 res!800638) b!1203028))

(assert (= (and b!1203028 res!800645) b!1203022))

(assert (= (and b!1203022 res!800642) b!1203015))

(assert (= (and b!1203015 res!800637) b!1203023))

(assert (= (and b!1203023 res!800641) b!1203033))

(assert (= (and b!1203033 res!800634) b!1203030))

(assert (= (and b!1203030 res!800646) b!1203037))

(assert (= (and b!1203037 res!800643) b!1203038))

(assert (= (and b!1203038 res!800640) b!1203016))

(assert (= (and b!1203016 res!800633) b!1203026))

(assert (= (and b!1203026 (not res!800635)) b!1203034))

(assert (= (and b!1203034 (not res!800644)) b!1203035))

(assert (= (and b!1203035 c!117756) b!1203017))

(assert (= (and b!1203035 (not c!117756)) b!1203036))

(assert (= (or b!1203017 b!1203036) bm!57942))

(assert (= (or b!1203017 b!1203036) bm!57943))

(assert (= (and b!1203035 (not res!800636)) b!1203031))

(assert (= (and b!1203031 (not res!800639)) b!1203039))

(assert (= (and b!1203039 c!117753) b!1203021))

(assert (= (and b!1203039 (not c!117753)) b!1203018))

(assert (= (and b!1203018 c!117755) b!1203020))

(assert (= (and b!1203018 (not c!117755)) b!1203025))

(assert (= (and b!1203025 c!117754) b!1203024))

(assert (= (and b!1203025 (not c!117754)) b!1203032))

(assert (= (or b!1203020 b!1203024) bm!57941))

(assert (= (or b!1203020 b!1203024) bm!57944))

(assert (= (or b!1203020 b!1203024) bm!57939))

(assert (= (or b!1203021 bm!57939) bm!57938))

(assert (= (or b!1203021 bm!57941) bm!57945))

(assert (= (or b!1203021 bm!57944) bm!57940))

(assert (= (and b!1203027 condMapEmpty!47744) mapIsEmpty!47744))

(assert (= (and b!1203027 (not condMapEmpty!47744)) mapNonEmpty!47744))

(get-info :version)

(assert (= (and mapNonEmpty!47744 ((_ is ValueCellFull!14591) mapValue!47744)) b!1203019))

(assert (= (and b!1203027 ((_ is ValueCellFull!14591) mapDefault!47744)) b!1203029))

(assert (= start!100568 b!1203027))

(declare-fun b_lambda!21075 () Bool)

(assert (=> (not b_lambda!21075) (not b!1203034)))

(declare-fun t!39412 () Bool)

(declare-fun tb!10689 () Bool)

(assert (=> (and start!100568 (= defaultEntry!1004 defaultEntry!1004) t!39412) tb!10689))

(declare-fun result!21963 () Bool)

(assert (=> tb!10689 (= result!21963 tp_is_empty!30601)))

(assert (=> b!1203034 t!39412))

(declare-fun b_and!42661 () Bool)

(assert (= b_and!42659 (and (=> t!39412 result!21963) b_and!42661)))

(declare-fun m!1108215 () Bool)

(assert (=> b!1203037 m!1108215))

(declare-fun m!1108217 () Bool)

(assert (=> bm!57945 m!1108217))

(declare-fun m!1108219 () Bool)

(assert (=> b!1203031 m!1108219))

(declare-fun m!1108221 () Bool)

(assert (=> b!1203031 m!1108221))

(declare-fun m!1108223 () Bool)

(assert (=> b!1203021 m!1108223))

(declare-fun m!1108225 () Bool)

(assert (=> b!1203021 m!1108225))

(assert (=> b!1203021 m!1108225))

(declare-fun m!1108227 () Bool)

(assert (=> b!1203021 m!1108227))

(declare-fun m!1108229 () Bool)

(assert (=> b!1203015 m!1108229))

(declare-fun m!1108231 () Bool)

(assert (=> b!1203028 m!1108231))

(declare-fun m!1108233 () Bool)

(assert (=> b!1203017 m!1108233))

(declare-fun m!1108235 () Bool)

(assert (=> b!1203030 m!1108235))

(assert (=> bm!57943 m!1108221))

(declare-fun m!1108237 () Bool)

(assert (=> b!1203023 m!1108237))

(declare-fun m!1108239 () Bool)

(assert (=> start!100568 m!1108239))

(declare-fun m!1108241 () Bool)

(assert (=> start!100568 m!1108241))

(declare-fun m!1108243 () Bool)

(assert (=> mapNonEmpty!47744 m!1108243))

(declare-fun m!1108245 () Bool)

(assert (=> b!1203016 m!1108245))

(declare-fun m!1108247 () Bool)

(assert (=> b!1203026 m!1108247))

(declare-fun m!1108249 () Bool)

(assert (=> b!1203026 m!1108249))

(declare-fun m!1108251 () Bool)

(assert (=> b!1203035 m!1108251))

(declare-fun m!1108253 () Bool)

(assert (=> b!1203035 m!1108253))

(declare-fun m!1108255 () Bool)

(assert (=> bm!57940 m!1108255))

(declare-fun m!1108257 () Bool)

(assert (=> bm!57938 m!1108257))

(declare-fun m!1108259 () Bool)

(assert (=> bm!57942 m!1108259))

(declare-fun m!1108261 () Bool)

(assert (=> b!1203034 m!1108261))

(declare-fun m!1108263 () Bool)

(assert (=> b!1203034 m!1108263))

(declare-fun m!1108265 () Bool)

(assert (=> b!1203034 m!1108265))

(declare-fun m!1108267 () Bool)

(assert (=> b!1203034 m!1108267))

(declare-fun m!1108269 () Bool)

(assert (=> b!1203038 m!1108269))

(declare-fun m!1108271 () Bool)

(assert (=> b!1203038 m!1108271))

(check-sat (not bm!57945) (not bm!57942) (not b_next!25897) (not b!1203017) (not b!1203034) (not bm!57940) (not b!1203031) (not b!1203030) (not bm!57943) (not start!100568) (not b_lambda!21075) (not bm!57938) (not b!1203026) (not b!1203023) (not b!1203038) (not b!1203035) tp_is_empty!30601 b_and!42661 (not mapNonEmpty!47744) (not b!1203016) (not b!1203028) (not b!1203021) (not b!1203015))
(check-sat b_and!42661 (not b_next!25897))
(get-model)

(declare-fun b_lambda!21081 () Bool)

(assert (= b_lambda!21075 (or (and start!100568 b_free!25897) b_lambda!21081)))

(check-sat (not bm!57945) (not bm!57942) (not b_next!25897) (not b!1203017) (not b!1203034) (not bm!57940) (not b!1203031) (not b!1203030) (not bm!57943) (not start!100568) (not bm!57938) (not b!1203026) (not b!1203023) (not b_lambda!21081) (not b!1203038) (not b!1203035) tp_is_empty!30601 b_and!42661 (not mapNonEmpty!47744) (not b!1203016) (not b!1203028) (not b!1203021) (not b!1203015))
(check-sat b_and!42661 (not b_next!25897))
(get-model)

(declare-fun b!1203220 () Bool)

(declare-fun e!683224 () Bool)

(assert (=> b!1203220 (= e!683224 (validKeyInArray!0 (select (arr!37590 lt!545191) from!1455)))))

(assert (=> b!1203220 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1203221 () Bool)

(declare-fun lt!545302 () Unit!39733)

(declare-fun lt!545305 () Unit!39733)

(assert (=> b!1203221 (= lt!545302 lt!545305)))

(declare-fun lt!545303 () (_ BitVec 64))

(declare-fun lt!545304 () V!45929)

(declare-fun lt!545301 () (_ BitVec 64))

(declare-fun lt!545299 () ListLongMap!17727)

(assert (=> b!1203221 (not (contains!6873 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304)) lt!545301))))

(declare-fun addStillNotContains!289 (ListLongMap!17727 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39733)

(assert (=> b!1203221 (= lt!545305 (addStillNotContains!289 lt!545299 lt!545303 lt!545304 lt!545301))))

(assert (=> b!1203221 (= lt!545301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19177 (ValueCell!14591 V!45929) V!45929)

(assert (=> b!1203221 (= lt!545304 (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203221 (= lt!545303 (select (arr!37590 lt!545191) from!1455))))

(declare-fun call!57999 () ListLongMap!17727)

(assert (=> b!1203221 (= lt!545299 call!57999)))

(declare-fun e!683221 () ListLongMap!17727)

(assert (=> b!1203221 (= e!683221 (+!4013 call!57999 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203222 () Bool)

(declare-fun e!683218 () ListLongMap!17727)

(assert (=> b!1203222 (= e!683218 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203223 () Bool)

(assert (=> b!1203223 (= e!683221 call!57999)))

(declare-fun b!1203224 () Bool)

(declare-fun e!683219 () Bool)

(declare-fun lt!545300 () ListLongMap!17727)

(declare-fun isEmpty!985 (ListLongMap!17727) Bool)

(assert (=> b!1203224 (= e!683219 (isEmpty!985 lt!545300))))

(declare-fun b!1203226 () Bool)

(declare-fun e!683220 () Bool)

(declare-fun e!683223 () Bool)

(assert (=> b!1203226 (= e!683220 e!683223)))

(assert (=> b!1203226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38128 lt!545191)))))

(declare-fun res!800740 () Bool)

(assert (=> b!1203226 (= res!800740 (contains!6873 lt!545300 (select (arr!37590 lt!545191) from!1455)))))

(assert (=> b!1203226 (=> (not res!800740) (not e!683223))))

(declare-fun bm!57996 () Bool)

(assert (=> bm!57996 (= call!57999 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203227 () Bool)

(declare-fun e!683222 () Bool)

(assert (=> b!1203227 (= e!683222 e!683220)))

(declare-fun c!117792 () Bool)

(assert (=> b!1203227 (= c!117792 e!683224)))

(declare-fun res!800739 () Bool)

(assert (=> b!1203227 (=> (not res!800739) (not e!683224))))

(assert (=> b!1203227 (= res!800739 (bvslt from!1455 (size!38128 lt!545191)))))

(declare-fun b!1203228 () Bool)

(assert (=> b!1203228 (= e!683219 (= lt!545300 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203229 () Bool)

(assert (=> b!1203229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38128 lt!545191)))))

(assert (=> b!1203229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38129 lt!545194)))))

(declare-fun apply!953 (ListLongMap!17727 (_ BitVec 64)) V!45929)

(assert (=> b!1203229 (= e!683223 (= (apply!953 lt!545300 (select (arr!37590 lt!545191) from!1455)) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132331 () Bool)

(assert (=> d!132331 e!683222))

(declare-fun res!800742 () Bool)

(assert (=> d!132331 (=> (not res!800742) (not e!683222))))

(assert (=> d!132331 (= res!800742 (not (contains!6873 lt!545300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132331 (= lt!545300 e!683218)))

(declare-fun c!117791 () Bool)

(assert (=> d!132331 (= c!117791 (bvsge from!1455 (size!38128 lt!545191)))))

(assert (=> d!132331 (validMask!0 mask!1564)))

(assert (=> d!132331 (= (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545300)))

(declare-fun b!1203225 () Bool)

(assert (=> b!1203225 (= e!683218 e!683221)))

(declare-fun c!117790 () Bool)

(assert (=> b!1203225 (= c!117790 (validKeyInArray!0 (select (arr!37590 lt!545191) from!1455)))))

(declare-fun b!1203230 () Bool)

(declare-fun res!800741 () Bool)

(assert (=> b!1203230 (=> (not res!800741) (not e!683222))))

(assert (=> b!1203230 (= res!800741 (not (contains!6873 lt!545300 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203231 () Bool)

(assert (=> b!1203231 (= e!683220 e!683219)))

(declare-fun c!117789 () Bool)

(assert (=> b!1203231 (= c!117789 (bvslt from!1455 (size!38128 lt!545191)))))

(assert (= (and d!132331 c!117791) b!1203222))

(assert (= (and d!132331 (not c!117791)) b!1203225))

(assert (= (and b!1203225 c!117790) b!1203221))

(assert (= (and b!1203225 (not c!117790)) b!1203223))

(assert (= (or b!1203221 b!1203223) bm!57996))

(assert (= (and d!132331 res!800742) b!1203230))

(assert (= (and b!1203230 res!800741) b!1203227))

(assert (= (and b!1203227 res!800739) b!1203220))

(assert (= (and b!1203227 c!117792) b!1203226))

(assert (= (and b!1203227 (not c!117792)) b!1203231))

(assert (= (and b!1203226 res!800740) b!1203229))

(assert (= (and b!1203231 c!117789) b!1203228))

(assert (= (and b!1203231 (not c!117789)) b!1203224))

(declare-fun b_lambda!21083 () Bool)

(assert (=> (not b_lambda!21083) (not b!1203221)))

(assert (=> b!1203221 t!39412))

(declare-fun b_and!42671 () Bool)

(assert (= b_and!42661 (and (=> t!39412 result!21963) b_and!42671)))

(declare-fun b_lambda!21085 () Bool)

(assert (=> (not b_lambda!21085) (not b!1203229)))

(assert (=> b!1203229 t!39412))

(declare-fun b_and!42673 () Bool)

(assert (= b_and!42671 (and (=> t!39412 result!21963) b_and!42673)))

(declare-fun m!1108389 () Bool)

(assert (=> b!1203226 m!1108389))

(assert (=> b!1203226 m!1108389))

(declare-fun m!1108391 () Bool)

(assert (=> b!1203226 m!1108391))

(declare-fun m!1108393 () Bool)

(assert (=> b!1203228 m!1108393))

(assert (=> b!1203229 m!1108389))

(assert (=> b!1203229 m!1108263))

(declare-fun m!1108395 () Bool)

(assert (=> b!1203229 m!1108395))

(assert (=> b!1203229 m!1108389))

(declare-fun m!1108397 () Bool)

(assert (=> b!1203229 m!1108397))

(assert (=> b!1203229 m!1108395))

(assert (=> b!1203229 m!1108263))

(declare-fun m!1108399 () Bool)

(assert (=> b!1203229 m!1108399))

(assert (=> bm!57996 m!1108393))

(declare-fun m!1108401 () Bool)

(assert (=> b!1203230 m!1108401))

(assert (=> b!1203220 m!1108389))

(assert (=> b!1203220 m!1108389))

(declare-fun m!1108403 () Bool)

(assert (=> b!1203220 m!1108403))

(declare-fun m!1108405 () Bool)

(assert (=> d!132331 m!1108405))

(assert (=> d!132331 m!1108231))

(declare-fun m!1108407 () Bool)

(assert (=> b!1203221 m!1108407))

(assert (=> b!1203221 m!1108389))

(assert (=> b!1203221 m!1108263))

(declare-fun m!1108409 () Bool)

(assert (=> b!1203221 m!1108409))

(assert (=> b!1203221 m!1108395))

(declare-fun m!1108411 () Bool)

(assert (=> b!1203221 m!1108411))

(assert (=> b!1203221 m!1108395))

(assert (=> b!1203221 m!1108263))

(assert (=> b!1203221 m!1108399))

(assert (=> b!1203221 m!1108407))

(declare-fun m!1108413 () Bool)

(assert (=> b!1203221 m!1108413))

(assert (=> b!1203225 m!1108389))

(assert (=> b!1203225 m!1108389))

(assert (=> b!1203225 m!1108403))

(declare-fun m!1108415 () Bool)

(assert (=> b!1203224 m!1108415))

(assert (=> b!1203034 d!132331))

(declare-fun b!1203232 () Bool)

(declare-fun e!683231 () Bool)

(assert (=> b!1203232 (= e!683231 (validKeyInArray!0 (select (arr!37590 _keys!1208) from!1455)))))

(assert (=> b!1203232 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1203233 () Bool)

(declare-fun lt!545309 () Unit!39733)

(declare-fun lt!545312 () Unit!39733)

(assert (=> b!1203233 (= lt!545309 lt!545312)))

(declare-fun lt!545308 () (_ BitVec 64))

(declare-fun lt!545310 () (_ BitVec 64))

(declare-fun lt!545306 () ListLongMap!17727)

(declare-fun lt!545311 () V!45929)

(assert (=> b!1203233 (not (contains!6873 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311)) lt!545308))))

(assert (=> b!1203233 (= lt!545312 (addStillNotContains!289 lt!545306 lt!545310 lt!545311 lt!545308))))

(assert (=> b!1203233 (= lt!545308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203233 (= lt!545311 (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203233 (= lt!545310 (select (arr!37590 _keys!1208) from!1455))))

(declare-fun call!58000 () ListLongMap!17727)

(assert (=> b!1203233 (= lt!545306 call!58000)))

(declare-fun e!683228 () ListLongMap!17727)

(assert (=> b!1203233 (= e!683228 (+!4013 call!58000 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203234 () Bool)

(declare-fun e!683225 () ListLongMap!17727)

(assert (=> b!1203234 (= e!683225 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203235 () Bool)

(assert (=> b!1203235 (= e!683228 call!58000)))

(declare-fun b!1203236 () Bool)

(declare-fun e!683226 () Bool)

(declare-fun lt!545307 () ListLongMap!17727)

(assert (=> b!1203236 (= e!683226 (isEmpty!985 lt!545307))))

(declare-fun b!1203238 () Bool)

(declare-fun e!683227 () Bool)

(declare-fun e!683230 () Bool)

(assert (=> b!1203238 (= e!683227 e!683230)))

(assert (=> b!1203238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38128 _keys!1208)))))

(declare-fun res!800744 () Bool)

(assert (=> b!1203238 (= res!800744 (contains!6873 lt!545307 (select (arr!37590 _keys!1208) from!1455)))))

(assert (=> b!1203238 (=> (not res!800744) (not e!683230))))

(declare-fun bm!57997 () Bool)

(assert (=> bm!57997 (= call!58000 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203239 () Bool)

(declare-fun e!683229 () Bool)

(assert (=> b!1203239 (= e!683229 e!683227)))

(declare-fun c!117796 () Bool)

(assert (=> b!1203239 (= c!117796 e!683231)))

(declare-fun res!800743 () Bool)

(assert (=> b!1203239 (=> (not res!800743) (not e!683231))))

(assert (=> b!1203239 (= res!800743 (bvslt from!1455 (size!38128 _keys!1208)))))

(declare-fun b!1203240 () Bool)

(assert (=> b!1203240 (= e!683226 (= lt!545307 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203241 () Bool)

(assert (=> b!1203241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38128 _keys!1208)))))

(assert (=> b!1203241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38129 _values!996)))))

(assert (=> b!1203241 (= e!683230 (= (apply!953 lt!545307 (select (arr!37590 _keys!1208) from!1455)) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132333 () Bool)

(assert (=> d!132333 e!683229))

(declare-fun res!800746 () Bool)

(assert (=> d!132333 (=> (not res!800746) (not e!683229))))

(assert (=> d!132333 (= res!800746 (not (contains!6873 lt!545307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132333 (= lt!545307 e!683225)))

(declare-fun c!117795 () Bool)

(assert (=> d!132333 (= c!117795 (bvsge from!1455 (size!38128 _keys!1208)))))

(assert (=> d!132333 (validMask!0 mask!1564)))

(assert (=> d!132333 (= (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545307)))

(declare-fun b!1203237 () Bool)

(assert (=> b!1203237 (= e!683225 e!683228)))

(declare-fun c!117794 () Bool)

(assert (=> b!1203237 (= c!117794 (validKeyInArray!0 (select (arr!37590 _keys!1208) from!1455)))))

(declare-fun b!1203242 () Bool)

(declare-fun res!800745 () Bool)

(assert (=> b!1203242 (=> (not res!800745) (not e!683229))))

(assert (=> b!1203242 (= res!800745 (not (contains!6873 lt!545307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203243 () Bool)

(assert (=> b!1203243 (= e!683227 e!683226)))

(declare-fun c!117793 () Bool)

(assert (=> b!1203243 (= c!117793 (bvslt from!1455 (size!38128 _keys!1208)))))

(assert (= (and d!132333 c!117795) b!1203234))

(assert (= (and d!132333 (not c!117795)) b!1203237))

(assert (= (and b!1203237 c!117794) b!1203233))

(assert (= (and b!1203237 (not c!117794)) b!1203235))

(assert (= (or b!1203233 b!1203235) bm!57997))

(assert (= (and d!132333 res!800746) b!1203242))

(assert (= (and b!1203242 res!800745) b!1203239))

(assert (= (and b!1203239 res!800743) b!1203232))

(assert (= (and b!1203239 c!117796) b!1203238))

(assert (= (and b!1203239 (not c!117796)) b!1203243))

(assert (= (and b!1203238 res!800744) b!1203241))

(assert (= (and b!1203243 c!117793) b!1203240))

(assert (= (and b!1203243 (not c!117793)) b!1203236))

(declare-fun b_lambda!21087 () Bool)

(assert (=> (not b_lambda!21087) (not b!1203233)))

(assert (=> b!1203233 t!39412))

(declare-fun b_and!42675 () Bool)

(assert (= b_and!42673 (and (=> t!39412 result!21963) b_and!42675)))

(declare-fun b_lambda!21089 () Bool)

(assert (=> (not b_lambda!21089) (not b!1203241)))

(assert (=> b!1203241 t!39412))

(declare-fun b_and!42677 () Bool)

(assert (= b_and!42675 (and (=> t!39412 result!21963) b_and!42677)))

(assert (=> b!1203238 m!1108251))

(assert (=> b!1203238 m!1108251))

(declare-fun m!1108417 () Bool)

(assert (=> b!1203238 m!1108417))

(declare-fun m!1108419 () Bool)

(assert (=> b!1203240 m!1108419))

(assert (=> b!1203241 m!1108251))

(assert (=> b!1203241 m!1108263))

(declare-fun m!1108421 () Bool)

(assert (=> b!1203241 m!1108421))

(assert (=> b!1203241 m!1108251))

(declare-fun m!1108423 () Bool)

(assert (=> b!1203241 m!1108423))

(assert (=> b!1203241 m!1108421))

(assert (=> b!1203241 m!1108263))

(declare-fun m!1108425 () Bool)

(assert (=> b!1203241 m!1108425))

(assert (=> bm!57997 m!1108419))

(declare-fun m!1108427 () Bool)

(assert (=> b!1203242 m!1108427))

(assert (=> b!1203232 m!1108251))

(assert (=> b!1203232 m!1108251))

(declare-fun m!1108429 () Bool)

(assert (=> b!1203232 m!1108429))

(declare-fun m!1108431 () Bool)

(assert (=> d!132333 m!1108431))

(assert (=> d!132333 m!1108231))

(declare-fun m!1108433 () Bool)

(assert (=> b!1203233 m!1108433))

(assert (=> b!1203233 m!1108251))

(assert (=> b!1203233 m!1108263))

(declare-fun m!1108435 () Bool)

(assert (=> b!1203233 m!1108435))

(assert (=> b!1203233 m!1108421))

(declare-fun m!1108437 () Bool)

(assert (=> b!1203233 m!1108437))

(assert (=> b!1203233 m!1108421))

(assert (=> b!1203233 m!1108263))

(assert (=> b!1203233 m!1108425))

(assert (=> b!1203233 m!1108433))

(declare-fun m!1108439 () Bool)

(assert (=> b!1203233 m!1108439))

(assert (=> b!1203237 m!1108251))

(assert (=> b!1203237 m!1108251))

(assert (=> b!1203237 m!1108429))

(declare-fun m!1108441 () Bool)

(assert (=> b!1203236 m!1108441))

(assert (=> b!1203034 d!132333))

(declare-fun d!132335 () Bool)

(declare-fun e!683234 () Bool)

(assert (=> d!132335 e!683234))

(declare-fun res!800751 () Bool)

(assert (=> d!132335 (=> (not res!800751) (not e!683234))))

(declare-fun lt!545322 () ListLongMap!17727)

(assert (=> d!132335 (= res!800751 (contains!6873 lt!545322 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!545324 () List!26545)

(assert (=> d!132335 (= lt!545322 (ListLongMap!17728 lt!545324))))

(declare-fun lt!545321 () Unit!39733)

(declare-fun lt!545323 () Unit!39733)

(assert (=> d!132335 (= lt!545321 lt!545323)))

(declare-datatypes ((Option!684 0))(
  ( (Some!683 (v!17997 V!45929)) (None!682) )
))
(declare-fun getValueByKey!633 (List!26545 (_ BitVec 64)) Option!684)

(assert (=> d!132335 (= (getValueByKey!633 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!683 (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!309 (List!26545 (_ BitVec 64) V!45929) Unit!39733)

(assert (=> d!132335 (= lt!545323 (lemmaContainsTupThenGetReturnValue!309 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!402 (List!26545 (_ BitVec 64) V!45929) List!26545)

(assert (=> d!132335 (= lt!545324 (insertStrictlySorted!402 (toList!8879 lt!545196) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132335 (= (+!4013 lt!545196 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545322)))

(declare-fun b!1203248 () Bool)

(declare-fun res!800752 () Bool)

(assert (=> b!1203248 (=> (not res!800752) (not e!683234))))

(assert (=> b!1203248 (= res!800752 (= (getValueByKey!633 (toList!8879 lt!545322) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!683 (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1203249 () Bool)

(declare-fun contains!6876 (List!26545 tuple2!19758) Bool)

(assert (=> b!1203249 (= e!683234 (contains!6876 (toList!8879 lt!545322) (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132335 res!800751) b!1203248))

(assert (= (and b!1203248 res!800752) b!1203249))

(declare-fun m!1108443 () Bool)

(assert (=> d!132335 m!1108443))

(declare-fun m!1108445 () Bool)

(assert (=> d!132335 m!1108445))

(declare-fun m!1108447 () Bool)

(assert (=> d!132335 m!1108447))

(declare-fun m!1108449 () Bool)

(assert (=> d!132335 m!1108449))

(declare-fun m!1108451 () Bool)

(assert (=> b!1203248 m!1108451))

(declare-fun m!1108453 () Bool)

(assert (=> b!1203249 m!1108453))

(assert (=> bm!57940 d!132335))

(declare-fun d!132337 () Bool)

(assert (=> d!132337 (= (array_inv!28750 _keys!1208) (bvsge (size!38128 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100568 d!132337))

(declare-fun d!132339 () Bool)

(assert (=> d!132339 (= (array_inv!28751 _values!996) (bvsge (size!38129 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100568 d!132339))

(declare-fun d!132341 () Bool)

(declare-fun lt!545327 () ListLongMap!17727)

(assert (=> d!132341 (not (contains!6873 lt!545327 k0!934))))

(declare-fun removeStrictlySorted!93 (List!26545 (_ BitVec 64)) List!26545)

(assert (=> d!132341 (= lt!545327 (ListLongMap!17728 (removeStrictlySorted!93 (toList!8879 call!57941) k0!934)))))

(assert (=> d!132341 (= (-!1773 call!57941 k0!934) lt!545327)))

(declare-fun bs!34029 () Bool)

(assert (= bs!34029 d!132341))

(declare-fun m!1108455 () Bool)

(assert (=> bs!34029 m!1108455))

(declare-fun m!1108457 () Bool)

(assert (=> bs!34029 m!1108457))

(assert (=> b!1203017 d!132341))

(declare-fun b!1203260 () Bool)

(declare-fun e!683246 () Bool)

(declare-fun e!683243 () Bool)

(assert (=> b!1203260 (= e!683246 e!683243)))

(declare-fun c!117799 () Bool)

(assert (=> b!1203260 (= c!117799 (validKeyInArray!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203261 () Bool)

(declare-fun call!58003 () Bool)

(assert (=> b!1203261 (= e!683243 call!58003)))

(declare-fun d!132343 () Bool)

(declare-fun res!800760 () Bool)

(declare-fun e!683244 () Bool)

(assert (=> d!132343 (=> res!800760 e!683244)))

(assert (=> d!132343 (= res!800760 (bvsge #b00000000000000000000000000000000 (size!38128 _keys!1208)))))

(assert (=> d!132343 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26543) e!683244)))

(declare-fun b!1203262 () Bool)

(assert (=> b!1203262 (= e!683243 call!58003)))

(declare-fun bm!58000 () Bool)

(assert (=> bm!58000 (= call!58003 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117799 (Cons!26542 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) Nil!26543) Nil!26543)))))

(declare-fun b!1203263 () Bool)

(declare-fun e!683245 () Bool)

(declare-fun contains!6877 (List!26546 (_ BitVec 64)) Bool)

(assert (=> b!1203263 (= e!683245 (contains!6877 Nil!26543 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203264 () Bool)

(assert (=> b!1203264 (= e!683244 e!683246)))

(declare-fun res!800759 () Bool)

(assert (=> b!1203264 (=> (not res!800759) (not e!683246))))

(assert (=> b!1203264 (= res!800759 (not e!683245))))

(declare-fun res!800761 () Bool)

(assert (=> b!1203264 (=> (not res!800761) (not e!683245))))

(assert (=> b!1203264 (= res!800761 (validKeyInArray!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132343 (not res!800760)) b!1203264))

(assert (= (and b!1203264 res!800761) b!1203263))

(assert (= (and b!1203264 res!800759) b!1203260))

(assert (= (and b!1203260 c!117799) b!1203261))

(assert (= (and b!1203260 (not c!117799)) b!1203262))

(assert (= (or b!1203261 b!1203262) bm!58000))

(declare-fun m!1108459 () Bool)

(assert (=> b!1203260 m!1108459))

(assert (=> b!1203260 m!1108459))

(declare-fun m!1108461 () Bool)

(assert (=> b!1203260 m!1108461))

(assert (=> bm!58000 m!1108459))

(declare-fun m!1108463 () Bool)

(assert (=> bm!58000 m!1108463))

(assert (=> b!1203263 m!1108459))

(assert (=> b!1203263 m!1108459))

(declare-fun m!1108465 () Bool)

(assert (=> b!1203263 m!1108465))

(assert (=> b!1203264 m!1108459))

(assert (=> b!1203264 m!1108459))

(assert (=> b!1203264 m!1108461))

(assert (=> b!1203023 d!132343))

(declare-fun d!132345 () Bool)

(assert (=> d!132345 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1203028 d!132345))

(declare-fun call!58009 () ListLongMap!17727)

(declare-fun bm!58005 () Bool)

(assert (=> bm!58005 (= call!58009 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203271 () Bool)

(declare-fun e!683251 () Bool)

(declare-fun e!683252 () Bool)

(assert (=> b!1203271 (= e!683251 e!683252)))

(declare-fun c!117802 () Bool)

(assert (=> b!1203271 (= c!117802 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!132347 () Bool)

(assert (=> d!132347 e!683251))

(declare-fun res!800764 () Bool)

(assert (=> d!132347 (=> (not res!800764) (not e!683251))))

(assert (=> d!132347 (= res!800764 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38128 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38128 _keys!1208))))))))

(declare-fun lt!545330 () Unit!39733)

(declare-fun choose!1793 (array!77890 array!77892 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39733)

(assert (=> d!132347 (= lt!545330 (choose!1793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132347 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208)))))

(assert (=> d!132347 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545330)))

(declare-fun b!1203272 () Bool)

(declare-fun call!58008 () ListLongMap!17727)

(assert (=> b!1203272 (= e!683252 (= call!58008 (-!1773 call!58009 k0!934)))))

(assert (=> b!1203272 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38129 _values!996)))))

(declare-fun b!1203273 () Bool)

(assert (=> b!1203273 (= e!683252 (= call!58008 call!58009))))

(assert (=> b!1203273 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38129 _values!996)))))

(declare-fun bm!58006 () Bool)

(assert (=> bm!58006 (= call!58008 (getCurrentListMapNoExtraKeys!5325 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)) (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!132347 res!800764) b!1203271))

(assert (= (and b!1203271 c!117802) b!1203272))

(assert (= (and b!1203271 (not c!117802)) b!1203273))

(assert (= (or b!1203272 b!1203273) bm!58005))

(assert (= (or b!1203272 b!1203273) bm!58006))

(declare-fun b_lambda!21091 () Bool)

(assert (=> (not b_lambda!21091) (not bm!58006)))

(assert (=> bm!58006 t!39412))

(declare-fun b_and!42679 () Bool)

(assert (= b_and!42677 (and (=> t!39412 result!21963) b_and!42679)))

(assert (=> bm!58005 m!1108221))

(declare-fun m!1108467 () Bool)

(assert (=> d!132347 m!1108467))

(declare-fun m!1108469 () Bool)

(assert (=> b!1203272 m!1108469))

(assert (=> bm!58006 m!1108271))

(assert (=> bm!58006 m!1108263))

(assert (=> bm!58006 m!1108265))

(declare-fun m!1108471 () Bool)

(assert (=> bm!58006 m!1108471))

(assert (=> b!1203035 d!132347))

(declare-fun d!132349 () Bool)

(declare-fun res!800769 () Bool)

(declare-fun e!683257 () Bool)

(assert (=> d!132349 (=> res!800769 e!683257)))

(assert (=> d!132349 (= res!800769 (= (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132349 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!683257)))

(declare-fun b!1203278 () Bool)

(declare-fun e!683258 () Bool)

(assert (=> b!1203278 (= e!683257 e!683258)))

(declare-fun res!800770 () Bool)

(assert (=> b!1203278 (=> (not res!800770) (not e!683258))))

(assert (=> b!1203278 (= res!800770 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun b!1203279 () Bool)

(assert (=> b!1203279 (= e!683258 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132349 (not res!800769)) b!1203278))

(assert (= (and b!1203278 res!800770) b!1203279))

(assert (=> d!132349 m!1108459))

(declare-fun m!1108473 () Bool)

(assert (=> b!1203279 m!1108473))

(assert (=> b!1203026 d!132349))

(declare-fun d!132351 () Bool)

(assert (=> d!132351 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545333 () Unit!39733)

(declare-fun choose!13 (array!77890 (_ BitVec 64) (_ BitVec 32)) Unit!39733)

(assert (=> d!132351 (= lt!545333 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132351 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132351 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!545333)))

(declare-fun bs!34030 () Bool)

(assert (= bs!34030 d!132351))

(assert (=> bs!34030 m!1108247))

(declare-fun m!1108475 () Bool)

(assert (=> bs!34030 m!1108475))

(assert (=> b!1203026 d!132351))

(declare-fun b!1203289 () Bool)

(declare-fun e!683266 () Bool)

(declare-fun e!683267 () Bool)

(assert (=> b!1203289 (= e!683266 e!683267)))

(declare-fun c!117805 () Bool)

(assert (=> b!1203289 (= c!117805 (validKeyInArray!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203290 () Bool)

(declare-fun e!683265 () Bool)

(assert (=> b!1203290 (= e!683267 e!683265)))

(declare-fun lt!545340 () (_ BitVec 64))

(assert (=> b!1203290 (= lt!545340 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!545342 () Unit!39733)

(assert (=> b!1203290 (= lt!545342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545340 #b00000000000000000000000000000000))))

(assert (=> b!1203290 (arrayContainsKey!0 _keys!1208 lt!545340 #b00000000000000000000000000000000)))

(declare-fun lt!545341 () Unit!39733)

(assert (=> b!1203290 (= lt!545341 lt!545342)))

(declare-fun res!800775 () Bool)

(declare-datatypes ((SeekEntryResult!9932 0))(
  ( (MissingZero!9932 (index!42099 (_ BitVec 32))) (Found!9932 (index!42100 (_ BitVec 32))) (Intermediate!9932 (undefined!10744 Bool) (index!42101 (_ BitVec 32)) (x!106358 (_ BitVec 32))) (Undefined!9932) (MissingVacant!9932 (index!42102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77890 (_ BitVec 32)) SeekEntryResult!9932)

(assert (=> b!1203290 (= res!800775 (= (seekEntryOrOpen!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9932 #b00000000000000000000000000000000)))))

(assert (=> b!1203290 (=> (not res!800775) (not e!683265))))

(declare-fun bm!58009 () Bool)

(declare-fun call!58012 () Bool)

(assert (=> bm!58009 (= call!58012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1203291 () Bool)

(assert (=> b!1203291 (= e!683267 call!58012)))

(declare-fun d!132353 () Bool)

(declare-fun res!800776 () Bool)

(assert (=> d!132353 (=> res!800776 e!683266)))

(assert (=> d!132353 (= res!800776 (bvsge #b00000000000000000000000000000000 (size!38128 _keys!1208)))))

(assert (=> d!132353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!683266)))

(declare-fun b!1203288 () Bool)

(assert (=> b!1203288 (= e!683265 call!58012)))

(assert (= (and d!132353 (not res!800776)) b!1203289))

(assert (= (and b!1203289 c!117805) b!1203290))

(assert (= (and b!1203289 (not c!117805)) b!1203291))

(assert (= (and b!1203290 res!800775) b!1203288))

(assert (= (or b!1203288 b!1203291) bm!58009))

(assert (=> b!1203289 m!1108459))

(assert (=> b!1203289 m!1108459))

(assert (=> b!1203289 m!1108461))

(assert (=> b!1203290 m!1108459))

(declare-fun m!1108477 () Bool)

(assert (=> b!1203290 m!1108477))

(declare-fun m!1108479 () Bool)

(assert (=> b!1203290 m!1108479))

(assert (=> b!1203290 m!1108459))

(declare-fun m!1108481 () Bool)

(assert (=> b!1203290 m!1108481))

(declare-fun m!1108483 () Bool)

(assert (=> bm!58009 m!1108483))

(assert (=> b!1203015 d!132353))

(declare-fun b!1203293 () Bool)

(declare-fun e!683269 () Bool)

(declare-fun e!683270 () Bool)

(assert (=> b!1203293 (= e!683269 e!683270)))

(declare-fun c!117806 () Bool)

(assert (=> b!1203293 (= c!117806 (validKeyInArray!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(declare-fun b!1203294 () Bool)

(declare-fun e!683268 () Bool)

(assert (=> b!1203294 (= e!683270 e!683268)))

(declare-fun lt!545343 () (_ BitVec 64))

(assert (=> b!1203294 (= lt!545343 (select (arr!37590 lt!545191) #b00000000000000000000000000000000))))

(declare-fun lt!545345 () Unit!39733)

(assert (=> b!1203294 (= lt!545345 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545191 lt!545343 #b00000000000000000000000000000000))))

(assert (=> b!1203294 (arrayContainsKey!0 lt!545191 lt!545343 #b00000000000000000000000000000000)))

(declare-fun lt!545344 () Unit!39733)

(assert (=> b!1203294 (= lt!545344 lt!545345)))

(declare-fun res!800777 () Bool)

(assert (=> b!1203294 (= res!800777 (= (seekEntryOrOpen!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) lt!545191 mask!1564) (Found!9932 #b00000000000000000000000000000000)))))

(assert (=> b!1203294 (=> (not res!800777) (not e!683268))))

(declare-fun bm!58010 () Bool)

(declare-fun call!58013 () Bool)

(assert (=> bm!58010 (= call!58013 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545191 mask!1564))))

(declare-fun b!1203295 () Bool)

(assert (=> b!1203295 (= e!683270 call!58013)))

(declare-fun d!132355 () Bool)

(declare-fun res!800778 () Bool)

(assert (=> d!132355 (=> res!800778 e!683269)))

(assert (=> d!132355 (= res!800778 (bvsge #b00000000000000000000000000000000 (size!38128 lt!545191)))))

(assert (=> d!132355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545191 mask!1564) e!683269)))

(declare-fun b!1203292 () Bool)

(assert (=> b!1203292 (= e!683268 call!58013)))

(assert (= (and d!132355 (not res!800778)) b!1203293))

(assert (= (and b!1203293 c!117806) b!1203294))

(assert (= (and b!1203293 (not c!117806)) b!1203295))

(assert (= (and b!1203294 res!800777) b!1203292))

(assert (= (or b!1203292 b!1203295) bm!58010))

(declare-fun m!1108485 () Bool)

(assert (=> b!1203293 m!1108485))

(assert (=> b!1203293 m!1108485))

(declare-fun m!1108487 () Bool)

(assert (=> b!1203293 m!1108487))

(assert (=> b!1203294 m!1108485))

(declare-fun m!1108489 () Bool)

(assert (=> b!1203294 m!1108489))

(declare-fun m!1108491 () Bool)

(assert (=> b!1203294 m!1108491))

(assert (=> b!1203294 m!1108485))

(declare-fun m!1108493 () Bool)

(assert (=> b!1203294 m!1108493))

(declare-fun m!1108495 () Bool)

(assert (=> bm!58010 m!1108495))

(assert (=> b!1203038 d!132355))

(declare-fun b!1203296 () Bool)

(declare-fun e!683277 () Bool)

(assert (=> b!1203296 (= e!683277 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203296 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1203297 () Bool)

(declare-fun lt!545349 () Unit!39733)

(declare-fun lt!545352 () Unit!39733)

(assert (=> b!1203297 (= lt!545349 lt!545352)))

(declare-fun lt!545351 () V!45929)

(declare-fun lt!545346 () ListLongMap!17727)

(declare-fun lt!545348 () (_ BitVec 64))

(declare-fun lt!545350 () (_ BitVec 64))

(assert (=> b!1203297 (not (contains!6873 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351)) lt!545348))))

(assert (=> b!1203297 (= lt!545352 (addStillNotContains!289 lt!545346 lt!545350 lt!545351 lt!545348))))

(assert (=> b!1203297 (= lt!545348 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203297 (= lt!545351 (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203297 (= lt!545350 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58014 () ListLongMap!17727)

(assert (=> b!1203297 (= lt!545346 call!58014)))

(declare-fun e!683274 () ListLongMap!17727)

(assert (=> b!1203297 (= e!683274 (+!4013 call!58014 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203298 () Bool)

(declare-fun e!683271 () ListLongMap!17727)

(assert (=> b!1203298 (= e!683271 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203299 () Bool)

(assert (=> b!1203299 (= e!683274 call!58014)))

(declare-fun b!1203300 () Bool)

(declare-fun e!683272 () Bool)

(declare-fun lt!545347 () ListLongMap!17727)

(assert (=> b!1203300 (= e!683272 (isEmpty!985 lt!545347))))

(declare-fun b!1203302 () Bool)

(declare-fun e!683273 () Bool)

(declare-fun e!683276 () Bool)

(assert (=> b!1203302 (= e!683273 e!683276)))

(assert (=> b!1203302 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208)))))

(declare-fun res!800780 () Bool)

(assert (=> b!1203302 (= res!800780 (contains!6873 lt!545347 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203302 (=> (not res!800780) (not e!683276))))

(declare-fun bm!58011 () Bool)

(assert (=> bm!58011 (= call!58014 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203303 () Bool)

(declare-fun e!683275 () Bool)

(assert (=> b!1203303 (= e!683275 e!683273)))

(declare-fun c!117810 () Bool)

(assert (=> b!1203303 (= c!117810 e!683277)))

(declare-fun res!800779 () Bool)

(assert (=> b!1203303 (=> (not res!800779) (not e!683277))))

(assert (=> b!1203303 (= res!800779 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208)))))

(declare-fun b!1203304 () Bool)

(assert (=> b!1203304 (= e!683272 (= lt!545347 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203305 () Bool)

(assert (=> b!1203305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208)))))

(assert (=> b!1203305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38129 _values!996)))))

(assert (=> b!1203305 (= e!683276 (= (apply!953 lt!545347 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132357 () Bool)

(assert (=> d!132357 e!683275))

(declare-fun res!800782 () Bool)

(assert (=> d!132357 (=> (not res!800782) (not e!683275))))

(assert (=> d!132357 (= res!800782 (not (contains!6873 lt!545347 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132357 (= lt!545347 e!683271)))

(declare-fun c!117809 () Bool)

(assert (=> d!132357 (= c!117809 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208)))))

(assert (=> d!132357 (validMask!0 mask!1564)))

(assert (=> d!132357 (= (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545347)))

(declare-fun b!1203301 () Bool)

(assert (=> b!1203301 (= e!683271 e!683274)))

(declare-fun c!117808 () Bool)

(assert (=> b!1203301 (= c!117808 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203306 () Bool)

(declare-fun res!800781 () Bool)

(assert (=> b!1203306 (=> (not res!800781) (not e!683275))))

(assert (=> b!1203306 (= res!800781 (not (contains!6873 lt!545347 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203307 () Bool)

(assert (=> b!1203307 (= e!683273 e!683272)))

(declare-fun c!117807 () Bool)

(assert (=> b!1203307 (= c!117807 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 _keys!1208)))))

(assert (= (and d!132357 c!117809) b!1203298))

(assert (= (and d!132357 (not c!117809)) b!1203301))

(assert (= (and b!1203301 c!117808) b!1203297))

(assert (= (and b!1203301 (not c!117808)) b!1203299))

(assert (= (or b!1203297 b!1203299) bm!58011))

(assert (= (and d!132357 res!800782) b!1203306))

(assert (= (and b!1203306 res!800781) b!1203303))

(assert (= (and b!1203303 res!800779) b!1203296))

(assert (= (and b!1203303 c!117810) b!1203302))

(assert (= (and b!1203303 (not c!117810)) b!1203307))

(assert (= (and b!1203302 res!800780) b!1203305))

(assert (= (and b!1203307 c!117807) b!1203304))

(assert (= (and b!1203307 (not c!117807)) b!1203300))

(declare-fun b_lambda!21093 () Bool)

(assert (=> (not b_lambda!21093) (not b!1203297)))

(assert (=> b!1203297 t!39412))

(declare-fun b_and!42681 () Bool)

(assert (= b_and!42679 (and (=> t!39412 result!21963) b_and!42681)))

(declare-fun b_lambda!21095 () Bool)

(assert (=> (not b_lambda!21095) (not b!1203305)))

(assert (=> b!1203305 t!39412))

(declare-fun b_and!42683 () Bool)

(assert (= b_and!42681 (and (=> t!39412 result!21963) b_and!42683)))

(declare-fun m!1108497 () Bool)

(assert (=> b!1203302 m!1108497))

(assert (=> b!1203302 m!1108497))

(declare-fun m!1108499 () Bool)

(assert (=> b!1203302 m!1108499))

(declare-fun m!1108501 () Bool)

(assert (=> b!1203304 m!1108501))

(assert (=> b!1203305 m!1108497))

(assert (=> b!1203305 m!1108263))

(declare-fun m!1108503 () Bool)

(assert (=> b!1203305 m!1108503))

(assert (=> b!1203305 m!1108497))

(declare-fun m!1108505 () Bool)

(assert (=> b!1203305 m!1108505))

(assert (=> b!1203305 m!1108503))

(assert (=> b!1203305 m!1108263))

(declare-fun m!1108507 () Bool)

(assert (=> b!1203305 m!1108507))

(assert (=> bm!58011 m!1108501))

(declare-fun m!1108509 () Bool)

(assert (=> b!1203306 m!1108509))

(assert (=> b!1203296 m!1108497))

(assert (=> b!1203296 m!1108497))

(declare-fun m!1108511 () Bool)

(assert (=> b!1203296 m!1108511))

(declare-fun m!1108513 () Bool)

(assert (=> d!132357 m!1108513))

(assert (=> d!132357 m!1108231))

(declare-fun m!1108515 () Bool)

(assert (=> b!1203297 m!1108515))

(assert (=> b!1203297 m!1108497))

(assert (=> b!1203297 m!1108263))

(declare-fun m!1108517 () Bool)

(assert (=> b!1203297 m!1108517))

(assert (=> b!1203297 m!1108503))

(declare-fun m!1108519 () Bool)

(assert (=> b!1203297 m!1108519))

(assert (=> b!1203297 m!1108503))

(assert (=> b!1203297 m!1108263))

(assert (=> b!1203297 m!1108507))

(assert (=> b!1203297 m!1108515))

(declare-fun m!1108521 () Bool)

(assert (=> b!1203297 m!1108521))

(assert (=> b!1203301 m!1108497))

(assert (=> b!1203301 m!1108497))

(assert (=> b!1203301 m!1108511))

(declare-fun m!1108523 () Bool)

(assert (=> b!1203300 m!1108523))

(assert (=> bm!57943 d!132357))

(declare-fun d!132359 () Bool)

(assert (=> d!132359 (contains!6873 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!545355 () Unit!39733)

(declare-fun choose!1794 (ListLongMap!17727 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39733)

(assert (=> d!132359 (= lt!545355 (choose!1794 lt!545196 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!132359 (contains!6873 lt!545196 k0!934)))

(assert (=> d!132359 (= (addStillContains!998 lt!545196 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!545355)))

(declare-fun bs!34031 () Bool)

(assert (= bs!34031 d!132359))

(declare-fun m!1108525 () Bool)

(assert (=> bs!34031 m!1108525))

(assert (=> bs!34031 m!1108525))

(declare-fun m!1108527 () Bool)

(assert (=> bs!34031 m!1108527))

(declare-fun m!1108529 () Bool)

(assert (=> bs!34031 m!1108529))

(assert (=> bs!34031 m!1108219))

(assert (=> b!1203021 d!132359))

(declare-fun d!132361 () Bool)

(declare-fun e!683282 () Bool)

(assert (=> d!132361 e!683282))

(declare-fun res!800785 () Bool)

(assert (=> d!132361 (=> res!800785 e!683282)))

(declare-fun lt!545366 () Bool)

(assert (=> d!132361 (= res!800785 (not lt!545366))))

(declare-fun lt!545367 () Bool)

(assert (=> d!132361 (= lt!545366 lt!545367)))

(declare-fun lt!545364 () Unit!39733)

(declare-fun e!683283 () Unit!39733)

(assert (=> d!132361 (= lt!545364 e!683283)))

(declare-fun c!117813 () Bool)

(assert (=> d!132361 (= c!117813 lt!545367)))

(declare-fun containsKey!587 (List!26545 (_ BitVec 64)) Bool)

(assert (=> d!132361 (= lt!545367 (containsKey!587 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132361 (= (contains!6873 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!545366)))

(declare-fun b!1203315 () Bool)

(declare-fun lt!545365 () Unit!39733)

(assert (=> b!1203315 (= e!683283 lt!545365)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!416 (List!26545 (_ BitVec 64)) Unit!39733)

(assert (=> b!1203315 (= lt!545365 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun isDefined!459 (Option!684) Bool)

(assert (=> b!1203315 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1203316 () Bool)

(declare-fun Unit!39740 () Unit!39733)

(assert (=> b!1203316 (= e!683283 Unit!39740)))

(declare-fun b!1203317 () Bool)

(assert (=> b!1203317 (= e!683282 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132361 c!117813) b!1203315))

(assert (= (and d!132361 (not c!117813)) b!1203316))

(assert (= (and d!132361 (not res!800785)) b!1203317))

(declare-fun m!1108531 () Bool)

(assert (=> d!132361 m!1108531))

(declare-fun m!1108533 () Bool)

(assert (=> b!1203315 m!1108533))

(declare-fun m!1108535 () Bool)

(assert (=> b!1203315 m!1108535))

(assert (=> b!1203315 m!1108535))

(declare-fun m!1108537 () Bool)

(assert (=> b!1203315 m!1108537))

(assert (=> b!1203317 m!1108535))

(assert (=> b!1203317 m!1108535))

(assert (=> b!1203317 m!1108537))

(assert (=> b!1203021 d!132361))

(declare-fun d!132363 () Bool)

(declare-fun e!683284 () Bool)

(assert (=> d!132363 e!683284))

(declare-fun res!800786 () Bool)

(assert (=> d!132363 (=> (not res!800786) (not e!683284))))

(declare-fun lt!545369 () ListLongMap!17727)

(assert (=> d!132363 (= res!800786 (contains!6873 lt!545369 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!545371 () List!26545)

(assert (=> d!132363 (= lt!545369 (ListLongMap!17728 lt!545371))))

(declare-fun lt!545368 () Unit!39733)

(declare-fun lt!545370 () Unit!39733)

(assert (=> d!132363 (= lt!545368 lt!545370)))

(assert (=> d!132363 (= (getValueByKey!633 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!683 (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132363 (= lt!545370 (lemmaContainsTupThenGetReturnValue!309 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132363 (= lt!545371 (insertStrictlySorted!402 (toList!8879 lt!545190) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132363 (= (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!545369)))

(declare-fun b!1203318 () Bool)

(declare-fun res!800787 () Bool)

(assert (=> b!1203318 (=> (not res!800787) (not e!683284))))

(assert (=> b!1203318 (= res!800787 (= (getValueByKey!633 (toList!8879 lt!545369) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!683 (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203319 () Bool)

(assert (=> b!1203319 (= e!683284 (contains!6876 (toList!8879 lt!545369) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132363 res!800786) b!1203318))

(assert (= (and b!1203318 res!800787) b!1203319))

(declare-fun m!1108539 () Bool)

(assert (=> d!132363 m!1108539))

(declare-fun m!1108541 () Bool)

(assert (=> d!132363 m!1108541))

(declare-fun m!1108543 () Bool)

(assert (=> d!132363 m!1108543))

(declare-fun m!1108545 () Bool)

(assert (=> d!132363 m!1108545))

(declare-fun m!1108547 () Bool)

(assert (=> b!1203318 m!1108547))

(declare-fun m!1108549 () Bool)

(assert (=> b!1203319 m!1108549))

(assert (=> b!1203021 d!132363))

(declare-fun d!132365 () Bool)

(assert (=> d!132365 (contains!6873 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!545372 () Unit!39733)

(assert (=> d!132365 (= lt!545372 (choose!1794 (ite c!117753 lt!545190 lt!545196) (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!132365 (contains!6873 (ite c!117753 lt!545190 lt!545196) k0!934)))

(assert (=> d!132365 (= (addStillContains!998 (ite c!117753 lt!545190 lt!545196) (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)) k0!934) lt!545372)))

(declare-fun bs!34032 () Bool)

(assert (= bs!34032 d!132365))

(declare-fun m!1108551 () Bool)

(assert (=> bs!34032 m!1108551))

(assert (=> bs!34032 m!1108551))

(declare-fun m!1108553 () Bool)

(assert (=> bs!34032 m!1108553))

(declare-fun m!1108555 () Bool)

(assert (=> bs!34032 m!1108555))

(declare-fun m!1108557 () Bool)

(assert (=> bs!34032 m!1108557))

(assert (=> bm!57945 d!132365))

(declare-fun b!1203320 () Bool)

(declare-fun e!683288 () Bool)

(declare-fun e!683285 () Bool)

(assert (=> b!1203320 (= e!683288 e!683285)))

(declare-fun c!117814 () Bool)

(assert (=> b!1203320 (= c!117814 (validKeyInArray!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(declare-fun b!1203321 () Bool)

(declare-fun call!58015 () Bool)

(assert (=> b!1203321 (= e!683285 call!58015)))

(declare-fun d!132367 () Bool)

(declare-fun res!800789 () Bool)

(declare-fun e!683286 () Bool)

(assert (=> d!132367 (=> res!800789 e!683286)))

(assert (=> d!132367 (= res!800789 (bvsge #b00000000000000000000000000000000 (size!38128 lt!545191)))))

(assert (=> d!132367 (= (arrayNoDuplicates!0 lt!545191 #b00000000000000000000000000000000 Nil!26543) e!683286)))

(declare-fun b!1203322 () Bool)

(assert (=> b!1203322 (= e!683285 call!58015)))

(declare-fun bm!58012 () Bool)

(assert (=> bm!58012 (= call!58015 (arrayNoDuplicates!0 lt!545191 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117814 (Cons!26542 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) Nil!26543) Nil!26543)))))

(declare-fun b!1203323 () Bool)

(declare-fun e!683287 () Bool)

(assert (=> b!1203323 (= e!683287 (contains!6877 Nil!26543 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(declare-fun b!1203324 () Bool)

(assert (=> b!1203324 (= e!683286 e!683288)))

(declare-fun res!800788 () Bool)

(assert (=> b!1203324 (=> (not res!800788) (not e!683288))))

(assert (=> b!1203324 (= res!800788 (not e!683287))))

(declare-fun res!800790 () Bool)

(assert (=> b!1203324 (=> (not res!800790) (not e!683287))))

(assert (=> b!1203324 (= res!800790 (validKeyInArray!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(assert (= (and d!132367 (not res!800789)) b!1203324))

(assert (= (and b!1203324 res!800790) b!1203323))

(assert (= (and b!1203324 res!800788) b!1203320))

(assert (= (and b!1203320 c!117814) b!1203321))

(assert (= (and b!1203320 (not c!117814)) b!1203322))

(assert (= (or b!1203321 b!1203322) bm!58012))

(assert (=> b!1203320 m!1108485))

(assert (=> b!1203320 m!1108485))

(assert (=> b!1203320 m!1108487))

(assert (=> bm!58012 m!1108485))

(declare-fun m!1108559 () Bool)

(assert (=> bm!58012 m!1108559))

(assert (=> b!1203323 m!1108485))

(assert (=> b!1203323 m!1108485))

(declare-fun m!1108561 () Bool)

(assert (=> b!1203323 m!1108561))

(assert (=> b!1203324 m!1108485))

(assert (=> b!1203324 m!1108485))

(assert (=> b!1203324 m!1108487))

(assert (=> b!1203016 d!132367))

(declare-fun b!1203325 () Bool)

(declare-fun e!683295 () Bool)

(assert (=> b!1203325 (= e!683295 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203325 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1203326 () Bool)

(declare-fun lt!545376 () Unit!39733)

(declare-fun lt!545379 () Unit!39733)

(assert (=> b!1203326 (= lt!545376 lt!545379)))

(declare-fun lt!545378 () V!45929)

(declare-fun lt!545375 () (_ BitVec 64))

(declare-fun lt!545373 () ListLongMap!17727)

(declare-fun lt!545377 () (_ BitVec 64))

(assert (=> b!1203326 (not (contains!6873 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378)) lt!545375))))

(assert (=> b!1203326 (= lt!545379 (addStillNotContains!289 lt!545373 lt!545377 lt!545378 lt!545375))))

(assert (=> b!1203326 (= lt!545375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203326 (= lt!545378 (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203326 (= lt!545377 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58016 () ListLongMap!17727)

(assert (=> b!1203326 (= lt!545373 call!58016)))

(declare-fun e!683292 () ListLongMap!17727)

(assert (=> b!1203326 (= e!683292 (+!4013 call!58016 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203327 () Bool)

(declare-fun e!683289 () ListLongMap!17727)

(assert (=> b!1203327 (= e!683289 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203328 () Bool)

(assert (=> b!1203328 (= e!683292 call!58016)))

(declare-fun b!1203329 () Bool)

(declare-fun e!683290 () Bool)

(declare-fun lt!545374 () ListLongMap!17727)

(assert (=> b!1203329 (= e!683290 (isEmpty!985 lt!545374))))

(declare-fun b!1203331 () Bool)

(declare-fun e!683291 () Bool)

(declare-fun e!683294 () Bool)

(assert (=> b!1203331 (= e!683291 e!683294)))

(assert (=> b!1203331 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 lt!545191)))))

(declare-fun res!800792 () Bool)

(assert (=> b!1203331 (= res!800792 (contains!6873 lt!545374 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203331 (=> (not res!800792) (not e!683294))))

(declare-fun bm!58013 () Bool)

(assert (=> bm!58013 (= call!58016 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203332 () Bool)

(declare-fun e!683293 () Bool)

(assert (=> b!1203332 (= e!683293 e!683291)))

(declare-fun c!117818 () Bool)

(assert (=> b!1203332 (= c!117818 e!683295)))

(declare-fun res!800791 () Bool)

(assert (=> b!1203332 (=> (not res!800791) (not e!683295))))

(assert (=> b!1203332 (= res!800791 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 lt!545191)))))

(declare-fun b!1203333 () Bool)

(assert (=> b!1203333 (= e!683290 (= lt!545374 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203334 () Bool)

(assert (=> b!1203334 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 lt!545191)))))

(assert (=> b!1203334 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38129 lt!545194)))))

(assert (=> b!1203334 (= e!683294 (= (apply!953 lt!545374 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132369 () Bool)

(assert (=> d!132369 e!683293))

(declare-fun res!800794 () Bool)

(assert (=> d!132369 (=> (not res!800794) (not e!683293))))

(assert (=> d!132369 (= res!800794 (not (contains!6873 lt!545374 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132369 (= lt!545374 e!683289)))

(declare-fun c!117817 () Bool)

(assert (=> d!132369 (= c!117817 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 lt!545191)))))

(assert (=> d!132369 (validMask!0 mask!1564)))

(assert (=> d!132369 (= (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545374)))

(declare-fun b!1203330 () Bool)

(assert (=> b!1203330 (= e!683289 e!683292)))

(declare-fun c!117816 () Bool)

(assert (=> b!1203330 (= c!117816 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203335 () Bool)

(declare-fun res!800793 () Bool)

(assert (=> b!1203335 (=> (not res!800793) (not e!683293))))

(assert (=> b!1203335 (= res!800793 (not (contains!6873 lt!545374 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203336 () Bool)

(assert (=> b!1203336 (= e!683291 e!683290)))

(declare-fun c!117815 () Bool)

(assert (=> b!1203336 (= c!117815 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 lt!545191)))))

(assert (= (and d!132369 c!117817) b!1203327))

(assert (= (and d!132369 (not c!117817)) b!1203330))

(assert (= (and b!1203330 c!117816) b!1203326))

(assert (= (and b!1203330 (not c!117816)) b!1203328))

(assert (= (or b!1203326 b!1203328) bm!58013))

(assert (= (and d!132369 res!800794) b!1203335))

(assert (= (and b!1203335 res!800793) b!1203332))

(assert (= (and b!1203332 res!800791) b!1203325))

(assert (= (and b!1203332 c!117818) b!1203331))

(assert (= (and b!1203332 (not c!117818)) b!1203336))

(assert (= (and b!1203331 res!800792) b!1203334))

(assert (= (and b!1203336 c!117815) b!1203333))

(assert (= (and b!1203336 (not c!117815)) b!1203329))

(declare-fun b_lambda!21097 () Bool)

(assert (=> (not b_lambda!21097) (not b!1203326)))

(assert (=> b!1203326 t!39412))

(declare-fun b_and!42685 () Bool)

(assert (= b_and!42683 (and (=> t!39412 result!21963) b_and!42685)))

(declare-fun b_lambda!21099 () Bool)

(assert (=> (not b_lambda!21099) (not b!1203334)))

(assert (=> b!1203334 t!39412))

(declare-fun b_and!42687 () Bool)

(assert (= b_and!42685 (and (=> t!39412 result!21963) b_and!42687)))

(declare-fun m!1108563 () Bool)

(assert (=> b!1203331 m!1108563))

(assert (=> b!1203331 m!1108563))

(declare-fun m!1108565 () Bool)

(assert (=> b!1203331 m!1108565))

(declare-fun m!1108567 () Bool)

(assert (=> b!1203333 m!1108567))

(assert (=> b!1203334 m!1108563))

(assert (=> b!1203334 m!1108263))

(declare-fun m!1108569 () Bool)

(assert (=> b!1203334 m!1108569))

(assert (=> b!1203334 m!1108563))

(declare-fun m!1108571 () Bool)

(assert (=> b!1203334 m!1108571))

(assert (=> b!1203334 m!1108569))

(assert (=> b!1203334 m!1108263))

(declare-fun m!1108573 () Bool)

(assert (=> b!1203334 m!1108573))

(assert (=> bm!58013 m!1108567))

(declare-fun m!1108575 () Bool)

(assert (=> b!1203335 m!1108575))

(assert (=> b!1203325 m!1108563))

(assert (=> b!1203325 m!1108563))

(declare-fun m!1108577 () Bool)

(assert (=> b!1203325 m!1108577))

(declare-fun m!1108579 () Bool)

(assert (=> d!132369 m!1108579))

(assert (=> d!132369 m!1108231))

(declare-fun m!1108581 () Bool)

(assert (=> b!1203326 m!1108581))

(assert (=> b!1203326 m!1108563))

(assert (=> b!1203326 m!1108263))

(declare-fun m!1108583 () Bool)

(assert (=> b!1203326 m!1108583))

(assert (=> b!1203326 m!1108569))

(declare-fun m!1108585 () Bool)

(assert (=> b!1203326 m!1108585))

(assert (=> b!1203326 m!1108569))

(assert (=> b!1203326 m!1108263))

(assert (=> b!1203326 m!1108573))

(assert (=> b!1203326 m!1108581))

(declare-fun m!1108587 () Bool)

(assert (=> b!1203326 m!1108587))

(assert (=> b!1203330 m!1108563))

(assert (=> b!1203330 m!1108563))

(assert (=> b!1203330 m!1108577))

(declare-fun m!1108589 () Bool)

(assert (=> b!1203329 m!1108589))

(assert (=> bm!57942 d!132369))

(declare-fun d!132371 () Bool)

(declare-fun e!683296 () Bool)

(assert (=> d!132371 e!683296))

(declare-fun res!800795 () Bool)

(assert (=> d!132371 (=> res!800795 e!683296)))

(declare-fun lt!545382 () Bool)

(assert (=> d!132371 (= res!800795 (not lt!545382))))

(declare-fun lt!545383 () Bool)

(assert (=> d!132371 (= lt!545382 lt!545383)))

(declare-fun lt!545380 () Unit!39733)

(declare-fun e!683297 () Unit!39733)

(assert (=> d!132371 (= lt!545380 e!683297)))

(declare-fun c!117819 () Bool)

(assert (=> d!132371 (= c!117819 lt!545383)))

(assert (=> d!132371 (= lt!545383 (containsKey!587 (toList!8879 lt!545196) k0!934))))

(assert (=> d!132371 (= (contains!6873 lt!545196 k0!934) lt!545382)))

(declare-fun b!1203337 () Bool)

(declare-fun lt!545381 () Unit!39733)

(assert (=> b!1203337 (= e!683297 lt!545381)))

(assert (=> b!1203337 (= lt!545381 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545196) k0!934))))

(assert (=> b!1203337 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545196) k0!934))))

(declare-fun b!1203338 () Bool)

(declare-fun Unit!39741 () Unit!39733)

(assert (=> b!1203338 (= e!683297 Unit!39741)))

(declare-fun b!1203339 () Bool)

(assert (=> b!1203339 (= e!683296 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545196) k0!934)))))

(assert (= (and d!132371 c!117819) b!1203337))

(assert (= (and d!132371 (not c!117819)) b!1203338))

(assert (= (and d!132371 (not res!800795)) b!1203339))

(declare-fun m!1108591 () Bool)

(assert (=> d!132371 m!1108591))

(declare-fun m!1108593 () Bool)

(assert (=> b!1203337 m!1108593))

(declare-fun m!1108595 () Bool)

(assert (=> b!1203337 m!1108595))

(assert (=> b!1203337 m!1108595))

(declare-fun m!1108597 () Bool)

(assert (=> b!1203337 m!1108597))

(assert (=> b!1203339 m!1108595))

(assert (=> b!1203339 m!1108595))

(assert (=> b!1203339 m!1108597))

(assert (=> b!1203031 d!132371))

(assert (=> b!1203031 d!132357))

(declare-fun d!132373 () Bool)

(declare-fun e!683298 () Bool)

(assert (=> d!132373 e!683298))

(declare-fun res!800796 () Bool)

(assert (=> d!132373 (=> res!800796 e!683298)))

(declare-fun lt!545386 () Bool)

(assert (=> d!132373 (= res!800796 (not lt!545386))))

(declare-fun lt!545387 () Bool)

(assert (=> d!132373 (= lt!545386 lt!545387)))

(declare-fun lt!545384 () Unit!39733)

(declare-fun e!683299 () Unit!39733)

(assert (=> d!132373 (= lt!545384 e!683299)))

(declare-fun c!117820 () Bool)

(assert (=> d!132373 (= c!117820 lt!545387)))

(assert (=> d!132373 (= lt!545387 (containsKey!587 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))

(assert (=> d!132373 (= (contains!6873 (ite c!117753 lt!545190 call!57945) k0!934) lt!545386)))

(declare-fun b!1203340 () Bool)

(declare-fun lt!545385 () Unit!39733)

(assert (=> b!1203340 (= e!683299 lt!545385)))

(assert (=> b!1203340 (= lt!545385 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))

(assert (=> b!1203340 (isDefined!459 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))

(declare-fun b!1203341 () Bool)

(declare-fun Unit!39742 () Unit!39733)

(assert (=> b!1203341 (= e!683299 Unit!39742)))

(declare-fun b!1203342 () Bool)

(assert (=> b!1203342 (= e!683298 (isDefined!459 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934)))))

(assert (= (and d!132373 c!117820) b!1203340))

(assert (= (and d!132373 (not c!117820)) b!1203341))

(assert (= (and d!132373 (not res!800796)) b!1203342))

(declare-fun m!1108599 () Bool)

(assert (=> d!132373 m!1108599))

(declare-fun m!1108601 () Bool)

(assert (=> b!1203340 m!1108601))

(declare-fun m!1108603 () Bool)

(assert (=> b!1203340 m!1108603))

(assert (=> b!1203340 m!1108603))

(declare-fun m!1108605 () Bool)

(assert (=> b!1203340 m!1108605))

(assert (=> b!1203342 m!1108603))

(assert (=> b!1203342 m!1108603))

(assert (=> b!1203342 m!1108605))

(assert (=> bm!57938 d!132373))

(declare-fun d!132375 () Bool)

(assert (=> d!132375 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203030 d!132375))

(declare-fun b!1203350 () Bool)

(declare-fun e!683305 () Bool)

(assert (=> b!1203350 (= e!683305 tp_is_empty!30601)))

(declare-fun condMapEmpty!47753 () Bool)

(declare-fun mapDefault!47753 () ValueCell!14591)

(assert (=> mapNonEmpty!47744 (= condMapEmpty!47753 (= mapRest!47744 ((as const (Array (_ BitVec 32) ValueCell!14591)) mapDefault!47753)))))

(declare-fun mapRes!47753 () Bool)

(assert (=> mapNonEmpty!47744 (= tp!90681 (and e!683305 mapRes!47753))))

(declare-fun mapNonEmpty!47753 () Bool)

(declare-fun tp!90696 () Bool)

(declare-fun e!683304 () Bool)

(assert (=> mapNonEmpty!47753 (= mapRes!47753 (and tp!90696 e!683304))))

(declare-fun mapRest!47753 () (Array (_ BitVec 32) ValueCell!14591))

(declare-fun mapKey!47753 () (_ BitVec 32))

(declare-fun mapValue!47753 () ValueCell!14591)

(assert (=> mapNonEmpty!47753 (= mapRest!47744 (store mapRest!47753 mapKey!47753 mapValue!47753))))

(declare-fun mapIsEmpty!47753 () Bool)

(assert (=> mapIsEmpty!47753 mapRes!47753))

(declare-fun b!1203349 () Bool)

(assert (=> b!1203349 (= e!683304 tp_is_empty!30601)))

(assert (= (and mapNonEmpty!47744 condMapEmpty!47753) mapIsEmpty!47753))

(assert (= (and mapNonEmpty!47744 (not condMapEmpty!47753)) mapNonEmpty!47753))

(assert (= (and mapNonEmpty!47753 ((_ is ValueCellFull!14591) mapValue!47753)) b!1203349))

(assert (= (and mapNonEmpty!47744 ((_ is ValueCellFull!14591) mapDefault!47753)) b!1203350))

(declare-fun m!1108607 () Bool)

(assert (=> mapNonEmpty!47753 m!1108607))

(declare-fun b_lambda!21101 () Bool)

(assert (= b_lambda!21085 (or (and start!100568 b_free!25897) b_lambda!21101)))

(declare-fun b_lambda!21103 () Bool)

(assert (= b_lambda!21099 (or (and start!100568 b_free!25897) b_lambda!21103)))

(declare-fun b_lambda!21105 () Bool)

(assert (= b_lambda!21097 (or (and start!100568 b_free!25897) b_lambda!21105)))

(declare-fun b_lambda!21107 () Bool)

(assert (= b_lambda!21089 (or (and start!100568 b_free!25897) b_lambda!21107)))

(declare-fun b_lambda!21109 () Bool)

(assert (= b_lambda!21083 (or (and start!100568 b_free!25897) b_lambda!21109)))

(declare-fun b_lambda!21111 () Bool)

(assert (= b_lambda!21087 (or (and start!100568 b_free!25897) b_lambda!21111)))

(declare-fun b_lambda!21113 () Bool)

(assert (= b_lambda!21093 (or (and start!100568 b_free!25897) b_lambda!21113)))

(declare-fun b_lambda!21115 () Bool)

(assert (= b_lambda!21095 (or (and start!100568 b_free!25897) b_lambda!21115)))

(declare-fun b_lambda!21117 () Bool)

(assert (= b_lambda!21091 (or (and start!100568 b_free!25897) b_lambda!21117)))

(check-sat (not d!132369) (not b!1203289) (not b!1203319) (not d!132371) (not d!132361) (not b!1203300) (not b_lambda!21117) (not b!1203224) (not b!1203325) (not d!132331) (not b!1203293) (not bm!58011) (not b!1203228) (not mapNonEmpty!47753) (not b!1203304) (not b!1203297) (not b!1203302) (not d!132363) (not b!1203318) b_and!42687 (not b!1203294) (not b!1203305) (not b!1203263) (not b!1203237) (not b!1203236) (not b_next!25897) (not b!1203242) (not b!1203220) (not b_lambda!21113) (not b!1203330) (not b!1203290) (not b!1203249) (not b!1203226) (not b!1203229) (not b!1203232) (not b!1203339) (not bm!58005) (not b!1203334) (not bm!58012) (not b!1203317) (not b!1203331) (not b_lambda!21081) (not b!1203329) (not b!1203233) tp_is_empty!30601 (not b!1203264) (not d!132341) (not b!1203333) (not b!1203272) (not bm!58006) (not b_lambda!21109) (not b!1203337) (not d!132373) (not b_lambda!21103) (not b!1203326) (not b!1203296) (not bm!57997) (not b!1203315) (not b_lambda!21105) (not bm!58009) (not bm!58010) (not d!132335) (not b!1203342) (not b!1203301) (not b!1203320) (not b_lambda!21111) (not b!1203241) (not b!1203324) (not d!132347) (not b!1203323) (not d!132351) (not b!1203230) (not d!132333) (not b!1203335) (not b!1203238) (not bm!58000) (not b_lambda!21101) (not bm!57996) (not b!1203248) (not bm!58013) (not b!1203306) (not b_lambda!21115) (not b_lambda!21107) (not b!1203221) (not b!1203240) (not b!1203225) (not d!132359) (not b!1203279) (not d!132357) (not d!132365) (not b!1203260) (not b!1203340))
(check-sat b_and!42687 (not b_next!25897))
(get-model)

(declare-fun d!132377 () Bool)

(assert (=> d!132377 (= (validKeyInArray!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)) (and (not (= (select (arr!37590 lt!545191) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37590 lt!545191) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203320 d!132377))

(declare-fun d!132379 () Bool)

(declare-fun e!683306 () Bool)

(assert (=> d!132379 e!683306))

(declare-fun res!800797 () Bool)

(assert (=> d!132379 (=> res!800797 e!683306)))

(declare-fun lt!545390 () Bool)

(assert (=> d!132379 (= res!800797 (not lt!545390))))

(declare-fun lt!545391 () Bool)

(assert (=> d!132379 (= lt!545390 lt!545391)))

(declare-fun lt!545388 () Unit!39733)

(declare-fun e!683307 () Unit!39733)

(assert (=> d!132379 (= lt!545388 e!683307)))

(declare-fun c!117821 () Bool)

(assert (=> d!132379 (= c!117821 lt!545391)))

(assert (=> d!132379 (= lt!545391 (containsKey!587 (toList!8879 lt!545347) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132379 (= (contains!6873 lt!545347 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545390)))

(declare-fun b!1203351 () Bool)

(declare-fun lt!545389 () Unit!39733)

(assert (=> b!1203351 (= e!683307 lt!545389)))

(assert (=> b!1203351 (= lt!545389 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545347) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203351 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545347) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203352 () Bool)

(declare-fun Unit!39743 () Unit!39733)

(assert (=> b!1203352 (= e!683307 Unit!39743)))

(declare-fun b!1203353 () Bool)

(assert (=> b!1203353 (= e!683306 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132379 c!117821) b!1203351))

(assert (= (and d!132379 (not c!117821)) b!1203352))

(assert (= (and d!132379 (not res!800797)) b!1203353))

(declare-fun m!1108609 () Bool)

(assert (=> d!132379 m!1108609))

(declare-fun m!1108611 () Bool)

(assert (=> b!1203351 m!1108611))

(declare-fun m!1108613 () Bool)

(assert (=> b!1203351 m!1108613))

(assert (=> b!1203351 m!1108613))

(declare-fun m!1108615 () Bool)

(assert (=> b!1203351 m!1108615))

(assert (=> b!1203353 m!1108613))

(assert (=> b!1203353 m!1108613))

(assert (=> b!1203353 m!1108615))

(assert (=> b!1203306 d!132379))

(declare-fun b!1203354 () Bool)

(declare-fun e!683314 () Bool)

(assert (=> b!1203354 (= e!683314 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203354 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203355 () Bool)

(declare-fun lt!545395 () Unit!39733)

(declare-fun lt!545398 () Unit!39733)

(assert (=> b!1203355 (= lt!545395 lt!545398)))

(declare-fun lt!545397 () V!45929)

(declare-fun lt!545394 () (_ BitVec 64))

(declare-fun lt!545392 () ListLongMap!17727)

(declare-fun lt!545396 () (_ BitVec 64))

(assert (=> b!1203355 (not (contains!6873 (+!4013 lt!545392 (tuple2!19759 lt!545396 lt!545397)) lt!545394))))

(assert (=> b!1203355 (= lt!545398 (addStillNotContains!289 lt!545392 lt!545396 lt!545397 lt!545394))))

(assert (=> b!1203355 (= lt!545394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203355 (= lt!545397 (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203355 (= lt!545396 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58017 () ListLongMap!17727)

(assert (=> b!1203355 (= lt!545392 call!58017)))

(declare-fun e!683311 () ListLongMap!17727)

(assert (=> b!1203355 (= e!683311 (+!4013 call!58017 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203356 () Bool)

(declare-fun e!683308 () ListLongMap!17727)

(assert (=> b!1203356 (= e!683308 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203357 () Bool)

(assert (=> b!1203357 (= e!683311 call!58017)))

(declare-fun b!1203358 () Bool)

(declare-fun e!683309 () Bool)

(declare-fun lt!545393 () ListLongMap!17727)

(assert (=> b!1203358 (= e!683309 (isEmpty!985 lt!545393))))

(declare-fun b!1203360 () Bool)

(declare-fun e!683310 () Bool)

(declare-fun e!683313 () Bool)

(assert (=> b!1203360 (= e!683310 e!683313)))

(assert (=> b!1203360 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(declare-fun res!800799 () Bool)

(assert (=> b!1203360 (= res!800799 (contains!6873 lt!545393 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203360 (=> (not res!800799) (not e!683313))))

(declare-fun bm!58014 () Bool)

(assert (=> bm!58014 (= call!58017 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203361 () Bool)

(declare-fun e!683312 () Bool)

(assert (=> b!1203361 (= e!683312 e!683310)))

(declare-fun c!117825 () Bool)

(assert (=> b!1203361 (= c!117825 e!683314)))

(declare-fun res!800798 () Bool)

(assert (=> b!1203361 (=> (not res!800798) (not e!683314))))

(assert (=> b!1203361 (= res!800798 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(declare-fun b!1203362 () Bool)

(assert (=> b!1203362 (= e!683309 (= lt!545393 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203363 () Bool)

(assert (=> b!1203363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (=> b!1203363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38129 lt!545194)))))

(assert (=> b!1203363 (= e!683313 (= (apply!953 lt!545393 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132381 () Bool)

(assert (=> d!132381 e!683312))

(declare-fun res!800801 () Bool)

(assert (=> d!132381 (=> (not res!800801) (not e!683312))))

(assert (=> d!132381 (= res!800801 (not (contains!6873 lt!545393 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132381 (= lt!545393 e!683308)))

(declare-fun c!117824 () Bool)

(assert (=> d!132381 (= c!117824 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (=> d!132381 (validMask!0 mask!1564)))

(assert (=> d!132381 (= (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545393)))

(declare-fun b!1203359 () Bool)

(assert (=> b!1203359 (= e!683308 e!683311)))

(declare-fun c!117823 () Bool)

(assert (=> b!1203359 (= c!117823 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203364 () Bool)

(declare-fun res!800800 () Bool)

(assert (=> b!1203364 (=> (not res!800800) (not e!683312))))

(assert (=> b!1203364 (= res!800800 (not (contains!6873 lt!545393 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203365 () Bool)

(assert (=> b!1203365 (= e!683310 e!683309)))

(declare-fun c!117822 () Bool)

(assert (=> b!1203365 (= c!117822 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (= (and d!132381 c!117824) b!1203356))

(assert (= (and d!132381 (not c!117824)) b!1203359))

(assert (= (and b!1203359 c!117823) b!1203355))

(assert (= (and b!1203359 (not c!117823)) b!1203357))

(assert (= (or b!1203355 b!1203357) bm!58014))

(assert (= (and d!132381 res!800801) b!1203364))

(assert (= (and b!1203364 res!800800) b!1203361))

(assert (= (and b!1203361 res!800798) b!1203354))

(assert (= (and b!1203361 c!117825) b!1203360))

(assert (= (and b!1203361 (not c!117825)) b!1203365))

(assert (= (and b!1203360 res!800799) b!1203363))

(assert (= (and b!1203365 c!117822) b!1203362))

(assert (= (and b!1203365 (not c!117822)) b!1203358))

(declare-fun b_lambda!21119 () Bool)

(assert (=> (not b_lambda!21119) (not b!1203355)))

(assert (=> b!1203355 t!39412))

(declare-fun b_and!42689 () Bool)

(assert (= b_and!42687 (and (=> t!39412 result!21963) b_and!42689)))

(declare-fun b_lambda!21121 () Bool)

(assert (=> (not b_lambda!21121) (not b!1203363)))

(assert (=> b!1203363 t!39412))

(declare-fun b_and!42691 () Bool)

(assert (= b_and!42689 (and (=> t!39412 result!21963) b_and!42691)))

(declare-fun m!1108617 () Bool)

(assert (=> b!1203360 m!1108617))

(assert (=> b!1203360 m!1108617))

(declare-fun m!1108619 () Bool)

(assert (=> b!1203360 m!1108619))

(declare-fun m!1108621 () Bool)

(assert (=> b!1203362 m!1108621))

(assert (=> b!1203363 m!1108617))

(assert (=> b!1203363 m!1108263))

(declare-fun m!1108623 () Bool)

(assert (=> b!1203363 m!1108623))

(assert (=> b!1203363 m!1108617))

(declare-fun m!1108625 () Bool)

(assert (=> b!1203363 m!1108625))

(assert (=> b!1203363 m!1108623))

(assert (=> b!1203363 m!1108263))

(declare-fun m!1108627 () Bool)

(assert (=> b!1203363 m!1108627))

(assert (=> bm!58014 m!1108621))

(declare-fun m!1108629 () Bool)

(assert (=> b!1203364 m!1108629))

(assert (=> b!1203354 m!1108617))

(assert (=> b!1203354 m!1108617))

(declare-fun m!1108631 () Bool)

(assert (=> b!1203354 m!1108631))

(declare-fun m!1108633 () Bool)

(assert (=> d!132381 m!1108633))

(assert (=> d!132381 m!1108231))

(declare-fun m!1108635 () Bool)

(assert (=> b!1203355 m!1108635))

(assert (=> b!1203355 m!1108617))

(assert (=> b!1203355 m!1108263))

(declare-fun m!1108637 () Bool)

(assert (=> b!1203355 m!1108637))

(assert (=> b!1203355 m!1108623))

(declare-fun m!1108639 () Bool)

(assert (=> b!1203355 m!1108639))

(assert (=> b!1203355 m!1108623))

(assert (=> b!1203355 m!1108263))

(assert (=> b!1203355 m!1108627))

(assert (=> b!1203355 m!1108635))

(declare-fun m!1108641 () Bool)

(assert (=> b!1203355 m!1108641))

(assert (=> b!1203359 m!1108617))

(assert (=> b!1203359 m!1108617))

(assert (=> b!1203359 m!1108631))

(declare-fun m!1108643 () Bool)

(assert (=> b!1203358 m!1108643))

(assert (=> bm!58013 d!132381))

(declare-fun d!132383 () Bool)

(declare-fun e!683315 () Bool)

(assert (=> d!132383 e!683315))

(declare-fun res!800802 () Bool)

(assert (=> d!132383 (=> res!800802 e!683315)))

(declare-fun lt!545401 () Bool)

(assert (=> d!132383 (= res!800802 (not lt!545401))))

(declare-fun lt!545402 () Bool)

(assert (=> d!132383 (= lt!545401 lt!545402)))

(declare-fun lt!545399 () Unit!39733)

(declare-fun e!683316 () Unit!39733)

(assert (=> d!132383 (= lt!545399 e!683316)))

(declare-fun c!117826 () Bool)

(assert (=> d!132383 (= c!117826 lt!545402)))

(assert (=> d!132383 (= lt!545402 (containsKey!587 (toList!8879 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311))) lt!545308))))

(assert (=> d!132383 (= (contains!6873 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311)) lt!545308) lt!545401)))

(declare-fun b!1203366 () Bool)

(declare-fun lt!545400 () Unit!39733)

(assert (=> b!1203366 (= e!683316 lt!545400)))

(assert (=> b!1203366 (= lt!545400 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311))) lt!545308))))

(assert (=> b!1203366 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311))) lt!545308))))

(declare-fun b!1203367 () Bool)

(declare-fun Unit!39744 () Unit!39733)

(assert (=> b!1203367 (= e!683316 Unit!39744)))

(declare-fun b!1203368 () Bool)

(assert (=> b!1203368 (= e!683315 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311))) lt!545308)))))

(assert (= (and d!132383 c!117826) b!1203366))

(assert (= (and d!132383 (not c!117826)) b!1203367))

(assert (= (and d!132383 (not res!800802)) b!1203368))

(declare-fun m!1108645 () Bool)

(assert (=> d!132383 m!1108645))

(declare-fun m!1108647 () Bool)

(assert (=> b!1203366 m!1108647))

(declare-fun m!1108649 () Bool)

(assert (=> b!1203366 m!1108649))

(assert (=> b!1203366 m!1108649))

(declare-fun m!1108651 () Bool)

(assert (=> b!1203366 m!1108651))

(assert (=> b!1203368 m!1108649))

(assert (=> b!1203368 m!1108649))

(assert (=> b!1203368 m!1108651))

(assert (=> b!1203233 d!132383))

(declare-fun d!132385 () Bool)

(declare-fun c!117829 () Bool)

(assert (=> d!132385 (= c!117829 ((_ is ValueCellFull!14591) (select (arr!37591 _values!996) from!1455)))))

(declare-fun e!683319 () V!45929)

(assert (=> d!132385 (= (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683319)))

(declare-fun b!1203373 () Bool)

(declare-fun get!19178 (ValueCell!14591 V!45929) V!45929)

(assert (=> b!1203373 (= e!683319 (get!19178 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203374 () Bool)

(declare-fun get!19179 (ValueCell!14591 V!45929) V!45929)

(assert (=> b!1203374 (= e!683319 (get!19179 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132385 c!117829) b!1203373))

(assert (= (and d!132385 (not c!117829)) b!1203374))

(assert (=> b!1203373 m!1108421))

(assert (=> b!1203373 m!1108263))

(declare-fun m!1108653 () Bool)

(assert (=> b!1203373 m!1108653))

(assert (=> b!1203374 m!1108421))

(assert (=> b!1203374 m!1108263))

(declare-fun m!1108655 () Bool)

(assert (=> b!1203374 m!1108655))

(assert (=> b!1203233 d!132385))

(declare-fun d!132387 () Bool)

(declare-fun e!683320 () Bool)

(assert (=> d!132387 e!683320))

(declare-fun res!800803 () Bool)

(assert (=> d!132387 (=> (not res!800803) (not e!683320))))

(declare-fun lt!545404 () ListLongMap!17727)

(assert (=> d!132387 (= res!800803 (contains!6873 lt!545404 (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545406 () List!26545)

(assert (=> d!132387 (= lt!545404 (ListLongMap!17728 lt!545406))))

(declare-fun lt!545403 () Unit!39733)

(declare-fun lt!545405 () Unit!39733)

(assert (=> d!132387 (= lt!545403 lt!545405)))

(assert (=> d!132387 (= (getValueByKey!633 lt!545406 (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132387 (= lt!545405 (lemmaContainsTupThenGetReturnValue!309 lt!545406 (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132387 (= lt!545406 (insertStrictlySorted!402 (toList!8879 call!58000) (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132387 (= (+!4013 call!58000 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545404)))

(declare-fun b!1203375 () Bool)

(declare-fun res!800804 () Bool)

(assert (=> b!1203375 (=> (not res!800804) (not e!683320))))

(assert (=> b!1203375 (= res!800804 (= (getValueByKey!633 (toList!8879 lt!545404) (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203376 () Bool)

(assert (=> b!1203376 (= e!683320 (contains!6876 (toList!8879 lt!545404) (tuple2!19759 (select (arr!37590 _keys!1208) from!1455) (get!19177 (select (arr!37591 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132387 res!800803) b!1203375))

(assert (= (and b!1203375 res!800804) b!1203376))

(declare-fun m!1108657 () Bool)

(assert (=> d!132387 m!1108657))

(declare-fun m!1108659 () Bool)

(assert (=> d!132387 m!1108659))

(declare-fun m!1108661 () Bool)

(assert (=> d!132387 m!1108661))

(declare-fun m!1108663 () Bool)

(assert (=> d!132387 m!1108663))

(declare-fun m!1108665 () Bool)

(assert (=> b!1203375 m!1108665))

(declare-fun m!1108667 () Bool)

(assert (=> b!1203376 m!1108667))

(assert (=> b!1203233 d!132387))

(declare-fun d!132389 () Bool)

(declare-fun e!683321 () Bool)

(assert (=> d!132389 e!683321))

(declare-fun res!800805 () Bool)

(assert (=> d!132389 (=> (not res!800805) (not e!683321))))

(declare-fun lt!545408 () ListLongMap!17727)

(assert (=> d!132389 (= res!800805 (contains!6873 lt!545408 (_1!9890 (tuple2!19759 lt!545310 lt!545311))))))

(declare-fun lt!545410 () List!26545)

(assert (=> d!132389 (= lt!545408 (ListLongMap!17728 lt!545410))))

(declare-fun lt!545407 () Unit!39733)

(declare-fun lt!545409 () Unit!39733)

(assert (=> d!132389 (= lt!545407 lt!545409)))

(assert (=> d!132389 (= (getValueByKey!633 lt!545410 (_1!9890 (tuple2!19759 lt!545310 lt!545311))) (Some!683 (_2!9890 (tuple2!19759 lt!545310 lt!545311))))))

(assert (=> d!132389 (= lt!545409 (lemmaContainsTupThenGetReturnValue!309 lt!545410 (_1!9890 (tuple2!19759 lt!545310 lt!545311)) (_2!9890 (tuple2!19759 lt!545310 lt!545311))))))

(assert (=> d!132389 (= lt!545410 (insertStrictlySorted!402 (toList!8879 lt!545306) (_1!9890 (tuple2!19759 lt!545310 lt!545311)) (_2!9890 (tuple2!19759 lt!545310 lt!545311))))))

(assert (=> d!132389 (= (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311)) lt!545408)))

(declare-fun b!1203377 () Bool)

(declare-fun res!800806 () Bool)

(assert (=> b!1203377 (=> (not res!800806) (not e!683321))))

(assert (=> b!1203377 (= res!800806 (= (getValueByKey!633 (toList!8879 lt!545408) (_1!9890 (tuple2!19759 lt!545310 lt!545311))) (Some!683 (_2!9890 (tuple2!19759 lt!545310 lt!545311)))))))

(declare-fun b!1203378 () Bool)

(assert (=> b!1203378 (= e!683321 (contains!6876 (toList!8879 lt!545408) (tuple2!19759 lt!545310 lt!545311)))))

(assert (= (and d!132389 res!800805) b!1203377))

(assert (= (and b!1203377 res!800806) b!1203378))

(declare-fun m!1108669 () Bool)

(assert (=> d!132389 m!1108669))

(declare-fun m!1108671 () Bool)

(assert (=> d!132389 m!1108671))

(declare-fun m!1108673 () Bool)

(assert (=> d!132389 m!1108673))

(declare-fun m!1108675 () Bool)

(assert (=> d!132389 m!1108675))

(declare-fun m!1108677 () Bool)

(assert (=> b!1203377 m!1108677))

(declare-fun m!1108679 () Bool)

(assert (=> b!1203378 m!1108679))

(assert (=> b!1203233 d!132389))

(declare-fun d!132391 () Bool)

(assert (=> d!132391 (not (contains!6873 (+!4013 lt!545306 (tuple2!19759 lt!545310 lt!545311)) lt!545308))))

(declare-fun lt!545413 () Unit!39733)

(declare-fun choose!1795 (ListLongMap!17727 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39733)

(assert (=> d!132391 (= lt!545413 (choose!1795 lt!545306 lt!545310 lt!545311 lt!545308))))

(declare-fun e!683324 () Bool)

(assert (=> d!132391 e!683324))

(declare-fun res!800809 () Bool)

(assert (=> d!132391 (=> (not res!800809) (not e!683324))))

(assert (=> d!132391 (= res!800809 (not (contains!6873 lt!545306 lt!545308)))))

(assert (=> d!132391 (= (addStillNotContains!289 lt!545306 lt!545310 lt!545311 lt!545308) lt!545413)))

(declare-fun b!1203382 () Bool)

(assert (=> b!1203382 (= e!683324 (not (= lt!545310 lt!545308)))))

(assert (= (and d!132391 res!800809) b!1203382))

(assert (=> d!132391 m!1108433))

(assert (=> d!132391 m!1108433))

(assert (=> d!132391 m!1108439))

(declare-fun m!1108681 () Bool)

(assert (=> d!132391 m!1108681))

(declare-fun m!1108683 () Bool)

(assert (=> d!132391 m!1108683))

(assert (=> b!1203233 d!132391))

(declare-fun b!1203383 () Bool)

(declare-fun e!683331 () Bool)

(assert (=> b!1203383 (= e!683331 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203383 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203384 () Bool)

(declare-fun lt!545417 () Unit!39733)

(declare-fun lt!545420 () Unit!39733)

(assert (=> b!1203384 (= lt!545417 lt!545420)))

(declare-fun lt!545418 () (_ BitVec 64))

(declare-fun lt!545419 () V!45929)

(declare-fun lt!545416 () (_ BitVec 64))

(declare-fun lt!545414 () ListLongMap!17727)

(assert (=> b!1203384 (not (contains!6873 (+!4013 lt!545414 (tuple2!19759 lt!545418 lt!545419)) lt!545416))))

(assert (=> b!1203384 (= lt!545420 (addStillNotContains!289 lt!545414 lt!545418 lt!545419 lt!545416))))

(assert (=> b!1203384 (= lt!545416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203384 (= lt!545419 (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203384 (= lt!545418 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58018 () ListLongMap!17727)

(assert (=> b!1203384 (= lt!545414 call!58018)))

(declare-fun e!683328 () ListLongMap!17727)

(assert (=> b!1203384 (= e!683328 (+!4013 call!58018 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203385 () Bool)

(declare-fun e!683325 () ListLongMap!17727)

(assert (=> b!1203385 (= e!683325 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203386 () Bool)

(assert (=> b!1203386 (= e!683328 call!58018)))

(declare-fun b!1203387 () Bool)

(declare-fun e!683326 () Bool)

(declare-fun lt!545415 () ListLongMap!17727)

(assert (=> b!1203387 (= e!683326 (isEmpty!985 lt!545415))))

(declare-fun b!1203389 () Bool)

(declare-fun e!683327 () Bool)

(declare-fun e!683330 () Bool)

(assert (=> b!1203389 (= e!683327 e!683330)))

(assert (=> b!1203389 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun res!800811 () Bool)

(assert (=> b!1203389 (= res!800811 (contains!6873 lt!545415 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203389 (=> (not res!800811) (not e!683330))))

(declare-fun bm!58015 () Bool)

(assert (=> bm!58015 (= call!58018 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203390 () Bool)

(declare-fun e!683329 () Bool)

(assert (=> b!1203390 (= e!683329 e!683327)))

(declare-fun c!117833 () Bool)

(assert (=> b!1203390 (= c!117833 e!683331)))

(declare-fun res!800810 () Bool)

(assert (=> b!1203390 (=> (not res!800810) (not e!683331))))

(assert (=> b!1203390 (= res!800810 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun b!1203391 () Bool)

(assert (=> b!1203391 (= e!683326 (= lt!545415 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203392 () Bool)

(assert (=> b!1203392 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (=> b!1203392 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38129 _values!996)))))

(assert (=> b!1203392 (= e!683330 (= (apply!953 lt!545415 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132393 () Bool)

(assert (=> d!132393 e!683329))

(declare-fun res!800813 () Bool)

(assert (=> d!132393 (=> (not res!800813) (not e!683329))))

(assert (=> d!132393 (= res!800813 (not (contains!6873 lt!545415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132393 (= lt!545415 e!683325)))

(declare-fun c!117832 () Bool)

(assert (=> d!132393 (= c!117832 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (=> d!132393 (validMask!0 mask!1564)))

(assert (=> d!132393 (= (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545415)))

(declare-fun b!1203388 () Bool)

(assert (=> b!1203388 (= e!683325 e!683328)))

(declare-fun c!117831 () Bool)

(assert (=> b!1203388 (= c!117831 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203393 () Bool)

(declare-fun res!800812 () Bool)

(assert (=> b!1203393 (=> (not res!800812) (not e!683329))))

(assert (=> b!1203393 (= res!800812 (not (contains!6873 lt!545415 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203394 () Bool)

(assert (=> b!1203394 (= e!683327 e!683326)))

(declare-fun c!117830 () Bool)

(assert (=> b!1203394 (= c!117830 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (= (and d!132393 c!117832) b!1203385))

(assert (= (and d!132393 (not c!117832)) b!1203388))

(assert (= (and b!1203388 c!117831) b!1203384))

(assert (= (and b!1203388 (not c!117831)) b!1203386))

(assert (= (or b!1203384 b!1203386) bm!58015))

(assert (= (and d!132393 res!800813) b!1203393))

(assert (= (and b!1203393 res!800812) b!1203390))

(assert (= (and b!1203390 res!800810) b!1203383))

(assert (= (and b!1203390 c!117833) b!1203389))

(assert (= (and b!1203390 (not c!117833)) b!1203394))

(assert (= (and b!1203389 res!800811) b!1203392))

(assert (= (and b!1203394 c!117830) b!1203391))

(assert (= (and b!1203394 (not c!117830)) b!1203387))

(declare-fun b_lambda!21123 () Bool)

(assert (=> (not b_lambda!21123) (not b!1203384)))

(assert (=> b!1203384 t!39412))

(declare-fun b_and!42693 () Bool)

(assert (= b_and!42691 (and (=> t!39412 result!21963) b_and!42693)))

(declare-fun b_lambda!21125 () Bool)

(assert (=> (not b_lambda!21125) (not b!1203392)))

(assert (=> b!1203392 t!39412))

(declare-fun b_and!42695 () Bool)

(assert (= b_and!42693 (and (=> t!39412 result!21963) b_and!42695)))

(declare-fun m!1108685 () Bool)

(assert (=> b!1203389 m!1108685))

(assert (=> b!1203389 m!1108685))

(declare-fun m!1108687 () Bool)

(assert (=> b!1203389 m!1108687))

(declare-fun m!1108689 () Bool)

(assert (=> b!1203391 m!1108689))

(assert (=> b!1203392 m!1108685))

(assert (=> b!1203392 m!1108263))

(declare-fun m!1108691 () Bool)

(assert (=> b!1203392 m!1108691))

(assert (=> b!1203392 m!1108685))

(declare-fun m!1108693 () Bool)

(assert (=> b!1203392 m!1108693))

(assert (=> b!1203392 m!1108691))

(assert (=> b!1203392 m!1108263))

(declare-fun m!1108695 () Bool)

(assert (=> b!1203392 m!1108695))

(assert (=> bm!58015 m!1108689))

(declare-fun m!1108697 () Bool)

(assert (=> b!1203393 m!1108697))

(assert (=> b!1203383 m!1108685))

(assert (=> b!1203383 m!1108685))

(declare-fun m!1108699 () Bool)

(assert (=> b!1203383 m!1108699))

(declare-fun m!1108701 () Bool)

(assert (=> d!132393 m!1108701))

(assert (=> d!132393 m!1108231))

(declare-fun m!1108703 () Bool)

(assert (=> b!1203384 m!1108703))

(assert (=> b!1203384 m!1108685))

(assert (=> b!1203384 m!1108263))

(declare-fun m!1108705 () Bool)

(assert (=> b!1203384 m!1108705))

(assert (=> b!1203384 m!1108691))

(declare-fun m!1108707 () Bool)

(assert (=> b!1203384 m!1108707))

(assert (=> b!1203384 m!1108691))

(assert (=> b!1203384 m!1108263))

(assert (=> b!1203384 m!1108695))

(assert (=> b!1203384 m!1108703))

(declare-fun m!1108709 () Bool)

(assert (=> b!1203384 m!1108709))

(assert (=> b!1203388 m!1108685))

(assert (=> b!1203388 m!1108685))

(assert (=> b!1203388 m!1108699))

(declare-fun m!1108711 () Bool)

(assert (=> b!1203387 m!1108711))

(assert (=> b!1203304 d!132393))

(declare-fun d!132395 () Bool)

(assert (=> d!132395 (= (validKeyInArray!0 (select (arr!37590 _keys!1208) from!1455)) (and (not (= (select (arr!37590 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37590 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203237 d!132395))

(assert (=> b!1203333 d!132381))

(declare-fun d!132397 () Bool)

(declare-fun e!683332 () Bool)

(assert (=> d!132397 e!683332))

(declare-fun res!800814 () Bool)

(assert (=> d!132397 (=> res!800814 e!683332)))

(declare-fun lt!545423 () Bool)

(assert (=> d!132397 (= res!800814 (not lt!545423))))

(declare-fun lt!545424 () Bool)

(assert (=> d!132397 (= lt!545423 lt!545424)))

(declare-fun lt!545421 () Unit!39733)

(declare-fun e!683333 () Unit!39733)

(assert (=> d!132397 (= lt!545421 e!683333)))

(declare-fun c!117834 () Bool)

(assert (=> d!132397 (= c!117834 lt!545424)))

(assert (=> d!132397 (= lt!545424 (containsKey!587 (toList!8879 lt!545307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132397 (= (contains!6873 lt!545307 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545423)))

(declare-fun b!1203395 () Bool)

(declare-fun lt!545422 () Unit!39733)

(assert (=> b!1203395 (= e!683333 lt!545422)))

(assert (=> b!1203395 (= lt!545422 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203395 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203396 () Bool)

(declare-fun Unit!39745 () Unit!39733)

(assert (=> b!1203396 (= e!683333 Unit!39745)))

(declare-fun b!1203397 () Bool)

(assert (=> b!1203397 (= e!683332 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132397 c!117834) b!1203395))

(assert (= (and d!132397 (not c!117834)) b!1203396))

(assert (= (and d!132397 (not res!800814)) b!1203397))

(declare-fun m!1108713 () Bool)

(assert (=> d!132397 m!1108713))

(declare-fun m!1108715 () Bool)

(assert (=> b!1203395 m!1108715))

(declare-fun m!1108717 () Bool)

(assert (=> b!1203395 m!1108717))

(assert (=> b!1203395 m!1108717))

(declare-fun m!1108719 () Bool)

(assert (=> b!1203395 m!1108719))

(assert (=> b!1203397 m!1108717))

(assert (=> b!1203397 m!1108717))

(assert (=> b!1203397 m!1108719))

(assert (=> d!132333 d!132397))

(assert (=> d!132333 d!132345))

(declare-fun e!683340 () Bool)

(declare-fun b!1203398 () Bool)

(assert (=> b!1203398 (= e!683340 (validKeyInArray!0 (select (arr!37590 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203398 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1203399 () Bool)

(declare-fun lt!545428 () Unit!39733)

(declare-fun lt!545431 () Unit!39733)

(assert (=> b!1203399 (= lt!545428 lt!545431)))

(declare-fun lt!545430 () V!45929)

(declare-fun lt!545427 () (_ BitVec 64))

(declare-fun lt!545429 () (_ BitVec 64))

(declare-fun lt!545425 () ListLongMap!17727)

(assert (=> b!1203399 (not (contains!6873 (+!4013 lt!545425 (tuple2!19759 lt!545429 lt!545430)) lt!545427))))

(assert (=> b!1203399 (= lt!545431 (addStillNotContains!289 lt!545425 lt!545429 lt!545430 lt!545427))))

(assert (=> b!1203399 (= lt!545427 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203399 (= lt!545430 (get!19177 (select (arr!37591 (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203399 (= lt!545429 (select (arr!37590 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58019 () ListLongMap!17727)

(assert (=> b!1203399 (= lt!545425 call!58019)))

(declare-fun e!683337 () ListLongMap!17727)

(assert (=> b!1203399 (= e!683337 (+!4013 call!58019 (tuple2!19759 (select (arr!37590 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203400 () Bool)

(declare-fun e!683334 () ListLongMap!17727)

(assert (=> b!1203400 (= e!683334 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203401 () Bool)

(assert (=> b!1203401 (= e!683337 call!58019)))

(declare-fun b!1203402 () Bool)

(declare-fun e!683335 () Bool)

(declare-fun lt!545426 () ListLongMap!17727)

(assert (=> b!1203402 (= e!683335 (isEmpty!985 lt!545426))))

(declare-fun b!1203404 () Bool)

(declare-fun e!683336 () Bool)

(declare-fun e!683339 () Bool)

(assert (=> b!1203404 (= e!683336 e!683339)))

(assert (=> b!1203404 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))))

(declare-fun res!800816 () Bool)

(assert (=> b!1203404 (= res!800816 (contains!6873 lt!545426 (select (arr!37590 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203404 (=> (not res!800816) (not e!683339))))

(declare-fun bm!58016 () Bool)

(assert (=> bm!58016 (= call!58019 (getCurrentListMapNoExtraKeys!5325 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)) (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203405 () Bool)

(declare-fun e!683338 () Bool)

(assert (=> b!1203405 (= e!683338 e!683336)))

(declare-fun c!117838 () Bool)

(assert (=> b!1203405 (= c!117838 e!683340)))

(declare-fun res!800815 () Bool)

(assert (=> b!1203405 (=> (not res!800815) (not e!683340))))

(assert (=> b!1203405 (= res!800815 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))))

(declare-fun b!1203406 () Bool)

(assert (=> b!1203406 (= e!683335 (= lt!545426 (getCurrentListMapNoExtraKeys!5325 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)) (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203407 () Bool)

(assert (=> b!1203407 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))))

(assert (=> b!1203407 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38129 (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)))))))

(assert (=> b!1203407 (= e!683339 (= (apply!953 lt!545426 (select (arr!37590 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19177 (select (arr!37591 (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132399 () Bool)

(assert (=> d!132399 e!683338))

(declare-fun res!800818 () Bool)

(assert (=> d!132399 (=> (not res!800818) (not e!683338))))

(assert (=> d!132399 (= res!800818 (not (contains!6873 lt!545426 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132399 (= lt!545426 e!683334)))

(declare-fun c!117837 () Bool)

(assert (=> d!132399 (= c!117837 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))))

(assert (=> d!132399 (validMask!0 mask!1564)))

(assert (=> d!132399 (= (getCurrentListMapNoExtraKeys!5325 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)) (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545426)))

(declare-fun b!1203403 () Bool)

(assert (=> b!1203403 (= e!683334 e!683337)))

(declare-fun c!117836 () Bool)

(assert (=> b!1203403 (= c!117836 (validKeyInArray!0 (select (arr!37590 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203408 () Bool)

(declare-fun res!800817 () Bool)

(assert (=> b!1203408 (=> (not res!800817) (not e!683338))))

(assert (=> b!1203408 (= res!800817 (not (contains!6873 lt!545426 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203409 () Bool)

(assert (=> b!1203409 (= e!683336 e!683335)))

(declare-fun c!117835 () Bool)

(assert (=> b!1203409 (= c!117835 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38128 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))))

(assert (= (and d!132399 c!117837) b!1203400))

(assert (= (and d!132399 (not c!117837)) b!1203403))

(assert (= (and b!1203403 c!117836) b!1203399))

(assert (= (and b!1203403 (not c!117836)) b!1203401))

(assert (= (or b!1203399 b!1203401) bm!58016))

(assert (= (and d!132399 res!800818) b!1203408))

(assert (= (and b!1203408 res!800817) b!1203405))

(assert (= (and b!1203405 res!800815) b!1203398))

(assert (= (and b!1203405 c!117838) b!1203404))

(assert (= (and b!1203405 (not c!117838)) b!1203409))

(assert (= (and b!1203404 res!800816) b!1203407))

(assert (= (and b!1203409 c!117835) b!1203406))

(assert (= (and b!1203409 (not c!117835)) b!1203402))

(declare-fun b_lambda!21127 () Bool)

(assert (=> (not b_lambda!21127) (not b!1203399)))

(assert (=> b!1203399 t!39412))

(declare-fun b_and!42697 () Bool)

(assert (= b_and!42695 (and (=> t!39412 result!21963) b_and!42697)))

(declare-fun b_lambda!21129 () Bool)

(assert (=> (not b_lambda!21129) (not b!1203407)))

(assert (=> b!1203407 t!39412))

(declare-fun b_and!42699 () Bool)

(assert (= b_and!42697 (and (=> t!39412 result!21963) b_and!42699)))

(declare-fun m!1108721 () Bool)

(assert (=> b!1203404 m!1108721))

(assert (=> b!1203404 m!1108721))

(declare-fun m!1108723 () Bool)

(assert (=> b!1203404 m!1108723))

(declare-fun m!1108725 () Bool)

(assert (=> b!1203406 m!1108725))

(assert (=> b!1203407 m!1108721))

(assert (=> b!1203407 m!1108263))

(declare-fun m!1108727 () Bool)

(assert (=> b!1203407 m!1108727))

(assert (=> b!1203407 m!1108721))

(declare-fun m!1108729 () Bool)

(assert (=> b!1203407 m!1108729))

(assert (=> b!1203407 m!1108727))

(assert (=> b!1203407 m!1108263))

(declare-fun m!1108731 () Bool)

(assert (=> b!1203407 m!1108731))

(assert (=> bm!58016 m!1108725))

(declare-fun m!1108733 () Bool)

(assert (=> b!1203408 m!1108733))

(assert (=> b!1203398 m!1108721))

(assert (=> b!1203398 m!1108721))

(declare-fun m!1108735 () Bool)

(assert (=> b!1203398 m!1108735))

(declare-fun m!1108737 () Bool)

(assert (=> d!132399 m!1108737))

(assert (=> d!132399 m!1108231))

(declare-fun m!1108739 () Bool)

(assert (=> b!1203399 m!1108739))

(assert (=> b!1203399 m!1108721))

(assert (=> b!1203399 m!1108263))

(declare-fun m!1108741 () Bool)

(assert (=> b!1203399 m!1108741))

(assert (=> b!1203399 m!1108727))

(declare-fun m!1108743 () Bool)

(assert (=> b!1203399 m!1108743))

(assert (=> b!1203399 m!1108727))

(assert (=> b!1203399 m!1108263))

(assert (=> b!1203399 m!1108731))

(assert (=> b!1203399 m!1108739))

(declare-fun m!1108745 () Bool)

(assert (=> b!1203399 m!1108745))

(assert (=> b!1203403 m!1108721))

(assert (=> b!1203403 m!1108721))

(assert (=> b!1203403 m!1108735))

(declare-fun m!1108747 () Bool)

(assert (=> b!1203402 m!1108747))

(assert (=> bm!58006 d!132399))

(declare-fun d!132401 () Bool)

(assert (=> d!132401 (= (validKeyInArray!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203264 d!132401))

(declare-fun d!132403 () Bool)

(assert (=> d!132403 (= (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203301 d!132403))

(declare-fun d!132405 () Bool)

(declare-fun res!800823 () Bool)

(declare-fun e!683345 () Bool)

(assert (=> d!132405 (=> res!800823 e!683345)))

(assert (=> d!132405 (= res!800823 (and ((_ is Cons!26541) (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9890 (h!27750 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!132405 (= (containsKey!587 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!683345)))

(declare-fun b!1203414 () Bool)

(declare-fun e!683346 () Bool)

(assert (=> b!1203414 (= e!683345 e!683346)))

(declare-fun res!800824 () Bool)

(assert (=> b!1203414 (=> (not res!800824) (not e!683346))))

(assert (=> b!1203414 (= res!800824 (and (or (not ((_ is Cons!26541) (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (bvsle (_1!9890 (h!27750 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)) ((_ is Cons!26541) (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (bvslt (_1!9890 (h!27750 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun b!1203415 () Bool)

(assert (=> b!1203415 (= e!683346 (containsKey!587 (t!39413 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!132405 (not res!800823)) b!1203414))

(assert (= (and b!1203414 res!800824) b!1203415))

(declare-fun m!1108749 () Bool)

(assert (=> b!1203415 m!1108749))

(assert (=> d!132361 d!132405))

(declare-fun d!132407 () Bool)

(assert (=> d!132407 (not (contains!6873 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378)) lt!545375))))

(declare-fun lt!545432 () Unit!39733)

(assert (=> d!132407 (= lt!545432 (choose!1795 lt!545373 lt!545377 lt!545378 lt!545375))))

(declare-fun e!683347 () Bool)

(assert (=> d!132407 e!683347))

(declare-fun res!800825 () Bool)

(assert (=> d!132407 (=> (not res!800825) (not e!683347))))

(assert (=> d!132407 (= res!800825 (not (contains!6873 lt!545373 lt!545375)))))

(assert (=> d!132407 (= (addStillNotContains!289 lt!545373 lt!545377 lt!545378 lt!545375) lt!545432)))

(declare-fun b!1203416 () Bool)

(assert (=> b!1203416 (= e!683347 (not (= lt!545377 lt!545375)))))

(assert (= (and d!132407 res!800825) b!1203416))

(assert (=> d!132407 m!1108581))

(assert (=> d!132407 m!1108581))

(assert (=> d!132407 m!1108587))

(declare-fun m!1108751 () Bool)

(assert (=> d!132407 m!1108751))

(declare-fun m!1108753 () Bool)

(assert (=> d!132407 m!1108753))

(assert (=> b!1203326 d!132407))

(declare-fun d!132409 () Bool)

(declare-fun e!683348 () Bool)

(assert (=> d!132409 e!683348))

(declare-fun res!800826 () Bool)

(assert (=> d!132409 (=> res!800826 e!683348)))

(declare-fun lt!545435 () Bool)

(assert (=> d!132409 (= res!800826 (not lt!545435))))

(declare-fun lt!545436 () Bool)

(assert (=> d!132409 (= lt!545435 lt!545436)))

(declare-fun lt!545433 () Unit!39733)

(declare-fun e!683349 () Unit!39733)

(assert (=> d!132409 (= lt!545433 e!683349)))

(declare-fun c!117839 () Bool)

(assert (=> d!132409 (= c!117839 lt!545436)))

(assert (=> d!132409 (= lt!545436 (containsKey!587 (toList!8879 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378))) lt!545375))))

(assert (=> d!132409 (= (contains!6873 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378)) lt!545375) lt!545435)))

(declare-fun b!1203417 () Bool)

(declare-fun lt!545434 () Unit!39733)

(assert (=> b!1203417 (= e!683349 lt!545434)))

(assert (=> b!1203417 (= lt!545434 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378))) lt!545375))))

(assert (=> b!1203417 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378))) lt!545375))))

(declare-fun b!1203418 () Bool)

(declare-fun Unit!39746 () Unit!39733)

(assert (=> b!1203418 (= e!683349 Unit!39746)))

(declare-fun b!1203419 () Bool)

(assert (=> b!1203419 (= e!683348 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378))) lt!545375)))))

(assert (= (and d!132409 c!117839) b!1203417))

(assert (= (and d!132409 (not c!117839)) b!1203418))

(assert (= (and d!132409 (not res!800826)) b!1203419))

(declare-fun m!1108755 () Bool)

(assert (=> d!132409 m!1108755))

(declare-fun m!1108757 () Bool)

(assert (=> b!1203417 m!1108757))

(declare-fun m!1108759 () Bool)

(assert (=> b!1203417 m!1108759))

(assert (=> b!1203417 m!1108759))

(declare-fun m!1108761 () Bool)

(assert (=> b!1203417 m!1108761))

(assert (=> b!1203419 m!1108759))

(assert (=> b!1203419 m!1108759))

(assert (=> b!1203419 m!1108761))

(assert (=> b!1203326 d!132409))

(declare-fun d!132411 () Bool)

(declare-fun e!683350 () Bool)

(assert (=> d!132411 e!683350))

(declare-fun res!800827 () Bool)

(assert (=> d!132411 (=> (not res!800827) (not e!683350))))

(declare-fun lt!545438 () ListLongMap!17727)

(assert (=> d!132411 (= res!800827 (contains!6873 lt!545438 (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545440 () List!26545)

(assert (=> d!132411 (= lt!545438 (ListLongMap!17728 lt!545440))))

(declare-fun lt!545437 () Unit!39733)

(declare-fun lt!545439 () Unit!39733)

(assert (=> d!132411 (= lt!545437 lt!545439)))

(assert (=> d!132411 (= (getValueByKey!633 lt!545440 (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132411 (= lt!545439 (lemmaContainsTupThenGetReturnValue!309 lt!545440 (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132411 (= lt!545440 (insertStrictlySorted!402 (toList!8879 call!58016) (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132411 (= (+!4013 call!58016 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545438)))

(declare-fun b!1203420 () Bool)

(declare-fun res!800828 () Bool)

(assert (=> b!1203420 (=> (not res!800828) (not e!683350))))

(assert (=> b!1203420 (= res!800828 (= (getValueByKey!633 (toList!8879 lt!545438) (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203421 () Bool)

(assert (=> b!1203421 (= e!683350 (contains!6876 (toList!8879 lt!545438) (tuple2!19759 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132411 res!800827) b!1203420))

(assert (= (and b!1203420 res!800828) b!1203421))

(declare-fun m!1108763 () Bool)

(assert (=> d!132411 m!1108763))

(declare-fun m!1108765 () Bool)

(assert (=> d!132411 m!1108765))

(declare-fun m!1108767 () Bool)

(assert (=> d!132411 m!1108767))

(declare-fun m!1108769 () Bool)

(assert (=> d!132411 m!1108769))

(declare-fun m!1108771 () Bool)

(assert (=> b!1203420 m!1108771))

(declare-fun m!1108773 () Bool)

(assert (=> b!1203421 m!1108773))

(assert (=> b!1203326 d!132411))

(declare-fun d!132413 () Bool)

(declare-fun e!683351 () Bool)

(assert (=> d!132413 e!683351))

(declare-fun res!800829 () Bool)

(assert (=> d!132413 (=> (not res!800829) (not e!683351))))

(declare-fun lt!545442 () ListLongMap!17727)

(assert (=> d!132413 (= res!800829 (contains!6873 lt!545442 (_1!9890 (tuple2!19759 lt!545377 lt!545378))))))

(declare-fun lt!545444 () List!26545)

(assert (=> d!132413 (= lt!545442 (ListLongMap!17728 lt!545444))))

(declare-fun lt!545441 () Unit!39733)

(declare-fun lt!545443 () Unit!39733)

(assert (=> d!132413 (= lt!545441 lt!545443)))

(assert (=> d!132413 (= (getValueByKey!633 lt!545444 (_1!9890 (tuple2!19759 lt!545377 lt!545378))) (Some!683 (_2!9890 (tuple2!19759 lt!545377 lt!545378))))))

(assert (=> d!132413 (= lt!545443 (lemmaContainsTupThenGetReturnValue!309 lt!545444 (_1!9890 (tuple2!19759 lt!545377 lt!545378)) (_2!9890 (tuple2!19759 lt!545377 lt!545378))))))

(assert (=> d!132413 (= lt!545444 (insertStrictlySorted!402 (toList!8879 lt!545373) (_1!9890 (tuple2!19759 lt!545377 lt!545378)) (_2!9890 (tuple2!19759 lt!545377 lt!545378))))))

(assert (=> d!132413 (= (+!4013 lt!545373 (tuple2!19759 lt!545377 lt!545378)) lt!545442)))

(declare-fun b!1203422 () Bool)

(declare-fun res!800830 () Bool)

(assert (=> b!1203422 (=> (not res!800830) (not e!683351))))

(assert (=> b!1203422 (= res!800830 (= (getValueByKey!633 (toList!8879 lt!545442) (_1!9890 (tuple2!19759 lt!545377 lt!545378))) (Some!683 (_2!9890 (tuple2!19759 lt!545377 lt!545378)))))))

(declare-fun b!1203423 () Bool)

(assert (=> b!1203423 (= e!683351 (contains!6876 (toList!8879 lt!545442) (tuple2!19759 lt!545377 lt!545378)))))

(assert (= (and d!132413 res!800829) b!1203422))

(assert (= (and b!1203422 res!800830) b!1203423))

(declare-fun m!1108775 () Bool)

(assert (=> d!132413 m!1108775))

(declare-fun m!1108777 () Bool)

(assert (=> d!132413 m!1108777))

(declare-fun m!1108779 () Bool)

(assert (=> d!132413 m!1108779))

(declare-fun m!1108781 () Bool)

(assert (=> d!132413 m!1108781))

(declare-fun m!1108783 () Bool)

(assert (=> b!1203422 m!1108783))

(declare-fun m!1108785 () Bool)

(assert (=> b!1203423 m!1108785))

(assert (=> b!1203326 d!132413))

(declare-fun d!132415 () Bool)

(declare-fun c!117840 () Bool)

(assert (=> d!132415 (= c!117840 ((_ is ValueCellFull!14591) (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!683352 () V!45929)

(assert (=> d!132415 (= (get!19177 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683352)))

(declare-fun b!1203424 () Bool)

(assert (=> b!1203424 (= e!683352 (get!19178 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203425 () Bool)

(assert (=> b!1203425 (= e!683352 (get!19179 (select (arr!37591 lt!545194) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132415 c!117840) b!1203424))

(assert (= (and d!132415 (not c!117840)) b!1203425))

(assert (=> b!1203424 m!1108569))

(assert (=> b!1203424 m!1108263))

(declare-fun m!1108787 () Bool)

(assert (=> b!1203424 m!1108787))

(assert (=> b!1203425 m!1108569))

(assert (=> b!1203425 m!1108263))

(declare-fun m!1108789 () Bool)

(assert (=> b!1203425 m!1108789))

(assert (=> b!1203326 d!132415))

(declare-fun d!132417 () Bool)

(declare-fun e!683353 () Bool)

(assert (=> d!132417 e!683353))

(declare-fun res!800831 () Bool)

(assert (=> d!132417 (=> res!800831 e!683353)))

(declare-fun lt!545447 () Bool)

(assert (=> d!132417 (= res!800831 (not lt!545447))))

(declare-fun lt!545448 () Bool)

(assert (=> d!132417 (= lt!545447 lt!545448)))

(declare-fun lt!545445 () Unit!39733)

(declare-fun e!683354 () Unit!39733)

(assert (=> d!132417 (= lt!545445 e!683354)))

(declare-fun c!117841 () Bool)

(assert (=> d!132417 (= c!117841 lt!545448)))

(assert (=> d!132417 (= lt!545448 (containsKey!587 (toList!8879 lt!545300) (select (arr!37590 lt!545191) from!1455)))))

(assert (=> d!132417 (= (contains!6873 lt!545300 (select (arr!37590 lt!545191) from!1455)) lt!545447)))

(declare-fun b!1203426 () Bool)

(declare-fun lt!545446 () Unit!39733)

(assert (=> b!1203426 (= e!683354 lt!545446)))

(assert (=> b!1203426 (= lt!545446 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545300) (select (arr!37590 lt!545191) from!1455)))))

(assert (=> b!1203426 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545300) (select (arr!37590 lt!545191) from!1455)))))

(declare-fun b!1203427 () Bool)

(declare-fun Unit!39747 () Unit!39733)

(assert (=> b!1203427 (= e!683354 Unit!39747)))

(declare-fun b!1203428 () Bool)

(assert (=> b!1203428 (= e!683353 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545300) (select (arr!37590 lt!545191) from!1455))))))

(assert (= (and d!132417 c!117841) b!1203426))

(assert (= (and d!132417 (not c!117841)) b!1203427))

(assert (= (and d!132417 (not res!800831)) b!1203428))

(assert (=> d!132417 m!1108389))

(declare-fun m!1108791 () Bool)

(assert (=> d!132417 m!1108791))

(assert (=> b!1203426 m!1108389))

(declare-fun m!1108793 () Bool)

(assert (=> b!1203426 m!1108793))

(assert (=> b!1203426 m!1108389))

(declare-fun m!1108795 () Bool)

(assert (=> b!1203426 m!1108795))

(assert (=> b!1203426 m!1108795))

(declare-fun m!1108797 () Bool)

(assert (=> b!1203426 m!1108797))

(assert (=> b!1203428 m!1108389))

(assert (=> b!1203428 m!1108795))

(assert (=> b!1203428 m!1108795))

(assert (=> b!1203428 m!1108797))

(assert (=> b!1203226 d!132417))

(declare-fun d!132419 () Bool)

(declare-fun lt!545449 () ListLongMap!17727)

(assert (=> d!132419 (not (contains!6873 lt!545449 k0!934))))

(assert (=> d!132419 (= lt!545449 (ListLongMap!17728 (removeStrictlySorted!93 (toList!8879 call!58009) k0!934)))))

(assert (=> d!132419 (= (-!1773 call!58009 k0!934) lt!545449)))

(declare-fun bs!34033 () Bool)

(assert (= bs!34033 d!132419))

(declare-fun m!1108799 () Bool)

(assert (=> bs!34033 m!1108799))

(declare-fun m!1108801 () Bool)

(assert (=> bs!34033 m!1108801))

(assert (=> b!1203272 d!132419))

(declare-fun b!1203430 () Bool)

(declare-fun e!683356 () Bool)

(declare-fun e!683357 () Bool)

(assert (=> b!1203430 (= e!683356 e!683357)))

(declare-fun c!117842 () Bool)

(assert (=> b!1203430 (= c!117842 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203431 () Bool)

(declare-fun e!683355 () Bool)

(assert (=> b!1203431 (= e!683357 e!683355)))

(declare-fun lt!545450 () (_ BitVec 64))

(assert (=> b!1203431 (= lt!545450 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!545452 () Unit!39733)

(assert (=> b!1203431 (= lt!545452 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545191 lt!545450 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1203431 (arrayContainsKey!0 lt!545191 lt!545450 #b00000000000000000000000000000000)))

(declare-fun lt!545451 () Unit!39733)

(assert (=> b!1203431 (= lt!545451 lt!545452)))

(declare-fun res!800832 () Bool)

(assert (=> b!1203431 (= res!800832 (= (seekEntryOrOpen!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!545191 mask!1564) (Found!9932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1203431 (=> (not res!800832) (not e!683355))))

(declare-fun bm!58017 () Bool)

(declare-fun call!58020 () Bool)

(assert (=> bm!58017 (= call!58020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!545191 mask!1564))))

(declare-fun b!1203432 () Bool)

(assert (=> b!1203432 (= e!683357 call!58020)))

(declare-fun d!132421 () Bool)

(declare-fun res!800833 () Bool)

(assert (=> d!132421 (=> res!800833 e!683356)))

(assert (=> d!132421 (= res!800833 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (=> d!132421 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545191 mask!1564) e!683356)))

(declare-fun b!1203429 () Bool)

(assert (=> b!1203429 (= e!683355 call!58020)))

(assert (= (and d!132421 (not res!800833)) b!1203430))

(assert (= (and b!1203430 c!117842) b!1203431))

(assert (= (and b!1203430 (not c!117842)) b!1203432))

(assert (= (and b!1203431 res!800832) b!1203429))

(assert (= (or b!1203429 b!1203432) bm!58017))

(declare-fun m!1108803 () Bool)

(assert (=> b!1203430 m!1108803))

(assert (=> b!1203430 m!1108803))

(declare-fun m!1108805 () Bool)

(assert (=> b!1203430 m!1108805))

(assert (=> b!1203431 m!1108803))

(declare-fun m!1108807 () Bool)

(assert (=> b!1203431 m!1108807))

(declare-fun m!1108809 () Bool)

(assert (=> b!1203431 m!1108809))

(assert (=> b!1203431 m!1108803))

(declare-fun m!1108811 () Bool)

(assert (=> b!1203431 m!1108811))

(declare-fun m!1108813 () Bool)

(assert (=> bm!58017 m!1108813))

(assert (=> bm!58010 d!132421))

(declare-fun d!132423 () Bool)

(assert (=> d!132423 (= (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203330 d!132423))

(declare-fun d!132425 () Bool)

(declare-fun get!19180 (Option!684) V!45929)

(assert (=> d!132425 (= (apply!953 lt!545300 (select (arr!37590 lt!545191) from!1455)) (get!19180 (getValueByKey!633 (toList!8879 lt!545300) (select (arr!37590 lt!545191) from!1455))))))

(declare-fun bs!34034 () Bool)

(assert (= bs!34034 d!132425))

(assert (=> bs!34034 m!1108389))

(assert (=> bs!34034 m!1108795))

(assert (=> bs!34034 m!1108795))

(declare-fun m!1108815 () Bool)

(assert (=> bs!34034 m!1108815))

(assert (=> b!1203229 d!132425))

(declare-fun d!132427 () Bool)

(declare-fun c!117843 () Bool)

(assert (=> d!132427 (= c!117843 ((_ is ValueCellFull!14591) (select (arr!37591 lt!545194) from!1455)))))

(declare-fun e!683358 () V!45929)

(assert (=> d!132427 (= (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683358)))

(declare-fun b!1203433 () Bool)

(assert (=> b!1203433 (= e!683358 (get!19178 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203434 () Bool)

(assert (=> b!1203434 (= e!683358 (get!19179 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132427 c!117843) b!1203433))

(assert (= (and d!132427 (not c!117843)) b!1203434))

(assert (=> b!1203433 m!1108395))

(assert (=> b!1203433 m!1108263))

(declare-fun m!1108817 () Bool)

(assert (=> b!1203433 m!1108817))

(assert (=> b!1203434 m!1108395))

(assert (=> b!1203434 m!1108263))

(declare-fun m!1108819 () Bool)

(assert (=> b!1203434 m!1108819))

(assert (=> b!1203229 d!132427))

(assert (=> bm!58011 d!132393))

(declare-fun b!1203436 () Bool)

(declare-fun e!683360 () Bool)

(declare-fun e!683361 () Bool)

(assert (=> b!1203436 (= e!683360 e!683361)))

(declare-fun c!117844 () Bool)

(assert (=> b!1203436 (= c!117844 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203437 () Bool)

(declare-fun e!683359 () Bool)

(assert (=> b!1203437 (= e!683361 e!683359)))

(declare-fun lt!545453 () (_ BitVec 64))

(assert (=> b!1203437 (= lt!545453 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!545455 () Unit!39733)

(assert (=> b!1203437 (= lt!545455 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545453 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1203437 (arrayContainsKey!0 _keys!1208 lt!545453 #b00000000000000000000000000000000)))

(declare-fun lt!545454 () Unit!39733)

(assert (=> b!1203437 (= lt!545454 lt!545455)))

(declare-fun res!800834 () Bool)

(assert (=> b!1203437 (= res!800834 (= (seekEntryOrOpen!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1203437 (=> (not res!800834) (not e!683359))))

(declare-fun bm!58018 () Bool)

(declare-fun call!58021 () Bool)

(assert (=> bm!58018 (= call!58021 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1203438 () Bool)

(assert (=> b!1203438 (= e!683361 call!58021)))

(declare-fun d!132429 () Bool)

(declare-fun res!800835 () Bool)

(assert (=> d!132429 (=> res!800835 e!683360)))

(assert (=> d!132429 (= res!800835 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (=> d!132429 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!683360)))

(declare-fun b!1203435 () Bool)

(assert (=> b!1203435 (= e!683359 call!58021)))

(assert (= (and d!132429 (not res!800835)) b!1203436))

(assert (= (and b!1203436 c!117844) b!1203437))

(assert (= (and b!1203436 (not c!117844)) b!1203438))

(assert (= (and b!1203437 res!800834) b!1203435))

(assert (= (or b!1203435 b!1203438) bm!58018))

(declare-fun m!1108821 () Bool)

(assert (=> b!1203436 m!1108821))

(assert (=> b!1203436 m!1108821))

(declare-fun m!1108823 () Bool)

(assert (=> b!1203436 m!1108823))

(assert (=> b!1203437 m!1108821))

(declare-fun m!1108825 () Bool)

(assert (=> b!1203437 m!1108825))

(declare-fun m!1108827 () Bool)

(assert (=> b!1203437 m!1108827))

(assert (=> b!1203437 m!1108821))

(declare-fun m!1108829 () Bool)

(assert (=> b!1203437 m!1108829))

(declare-fun m!1108831 () Bool)

(assert (=> bm!58018 m!1108831))

(assert (=> bm!58009 d!132429))

(declare-fun d!132431 () Bool)

(declare-fun e!683362 () Bool)

(assert (=> d!132431 e!683362))

(declare-fun res!800836 () Bool)

(assert (=> d!132431 (=> res!800836 e!683362)))

(declare-fun lt!545458 () Bool)

(assert (=> d!132431 (= res!800836 (not lt!545458))))

(declare-fun lt!545459 () Bool)

(assert (=> d!132431 (= lt!545458 lt!545459)))

(declare-fun lt!545456 () Unit!39733)

(declare-fun e!683363 () Unit!39733)

(assert (=> d!132431 (= lt!545456 e!683363)))

(declare-fun c!117845 () Bool)

(assert (=> d!132431 (= c!117845 lt!545459)))

(assert (=> d!132431 (= lt!545459 (containsKey!587 (toList!8879 lt!545374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132431 (= (contains!6873 lt!545374 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545458)))

(declare-fun b!1203439 () Bool)

(declare-fun lt!545457 () Unit!39733)

(assert (=> b!1203439 (= e!683363 lt!545457)))

(assert (=> b!1203439 (= lt!545457 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203439 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203440 () Bool)

(declare-fun Unit!39748 () Unit!39733)

(assert (=> b!1203440 (= e!683363 Unit!39748)))

(declare-fun b!1203441 () Bool)

(assert (=> b!1203441 (= e!683362 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545374) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132431 c!117845) b!1203439))

(assert (= (and d!132431 (not c!117845)) b!1203440))

(assert (= (and d!132431 (not res!800836)) b!1203441))

(declare-fun m!1108833 () Bool)

(assert (=> d!132431 m!1108833))

(declare-fun m!1108835 () Bool)

(assert (=> b!1203439 m!1108835))

(declare-fun m!1108837 () Bool)

(assert (=> b!1203439 m!1108837))

(assert (=> b!1203439 m!1108837))

(declare-fun m!1108839 () Bool)

(assert (=> b!1203439 m!1108839))

(assert (=> b!1203441 m!1108837))

(assert (=> b!1203441 m!1108837))

(assert (=> b!1203441 m!1108839))

(assert (=> d!132369 d!132431))

(assert (=> d!132369 d!132345))

(declare-fun d!132433 () Bool)

(declare-fun e!683364 () Bool)

(assert (=> d!132433 e!683364))

(declare-fun res!800837 () Bool)

(assert (=> d!132433 (=> res!800837 e!683364)))

(declare-fun lt!545462 () Bool)

(assert (=> d!132433 (= res!800837 (not lt!545462))))

(declare-fun lt!545463 () Bool)

(assert (=> d!132433 (= lt!545462 lt!545463)))

(declare-fun lt!545460 () Unit!39733)

(declare-fun e!683365 () Unit!39733)

(assert (=> d!132433 (= lt!545460 e!683365)))

(declare-fun c!117846 () Bool)

(assert (=> d!132433 (= c!117846 lt!545463)))

(assert (=> d!132433 (= lt!545463 (containsKey!587 (toList!8879 lt!545300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132433 (= (contains!6873 lt!545300 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545462)))

(declare-fun b!1203442 () Bool)

(declare-fun lt!545461 () Unit!39733)

(assert (=> b!1203442 (= e!683365 lt!545461)))

(assert (=> b!1203442 (= lt!545461 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203442 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203443 () Bool)

(declare-fun Unit!39749 () Unit!39733)

(assert (=> b!1203443 (= e!683365 Unit!39749)))

(declare-fun b!1203444 () Bool)

(assert (=> b!1203444 (= e!683364 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132433 c!117846) b!1203442))

(assert (= (and d!132433 (not c!117846)) b!1203443))

(assert (= (and d!132433 (not res!800837)) b!1203444))

(declare-fun m!1108841 () Bool)

(assert (=> d!132433 m!1108841))

(declare-fun m!1108843 () Bool)

(assert (=> b!1203442 m!1108843))

(declare-fun m!1108845 () Bool)

(assert (=> b!1203442 m!1108845))

(assert (=> b!1203442 m!1108845))

(declare-fun m!1108847 () Bool)

(assert (=> b!1203442 m!1108847))

(assert (=> b!1203444 m!1108845))

(assert (=> b!1203444 m!1108845))

(assert (=> b!1203444 m!1108847))

(assert (=> d!132331 d!132433))

(assert (=> d!132331 d!132345))

(assert (=> b!1203289 d!132401))

(declare-fun d!132435 () Bool)

(assert (=> d!132435 (= (validKeyInArray!0 (select (arr!37590 lt!545191) from!1455)) (and (not (= (select (arr!37590 lt!545191) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37590 lt!545191) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203220 d!132435))

(declare-fun call!58026 () ListLongMap!17727)

(declare-fun bm!58023 () Bool)

(assert (=> bm!58023 (= call!58026 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!58027 () ListLongMap!17727)

(declare-fun bm!58024 () Bool)

(assert (=> bm!58024 (= call!58027 (getCurrentListMapNoExtraKeys!5325 (array!77891 (store (arr!37590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)) (array!77893 (store (arr!37591 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!683368 () Bool)

(declare-fun b!1203449 () Bool)

(assert (=> b!1203449 (= e!683368 (= call!58027 (-!1773 call!58026 k0!934)))))

(declare-fun d!132437 () Bool)

(assert (=> d!132437 e!683368))

(declare-fun c!117849 () Bool)

(assert (=> d!132437 (= c!117849 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!132437 true))

(declare-fun _$12!465 () Unit!39733)

(assert (=> d!132437 (= (choose!1793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!465)))

(declare-fun b!1203450 () Bool)

(assert (=> b!1203450 (= e!683368 (= call!58027 call!58026))))

(assert (= (and d!132437 c!117849) b!1203449))

(assert (= (and d!132437 (not c!117849)) b!1203450))

(assert (= (or b!1203449 b!1203450) bm!58023))

(assert (= (or b!1203449 b!1203450) bm!58024))

(declare-fun b_lambda!21131 () Bool)

(assert (=> (not b_lambda!21131) (not bm!58024)))

(assert (=> bm!58024 t!39412))

(declare-fun b_and!42701 () Bool)

(assert (= b_and!42699 (and (=> t!39412 result!21963) b_and!42701)))

(assert (=> bm!58023 m!1108221))

(assert (=> bm!58024 m!1108271))

(assert (=> bm!58024 m!1108263))

(assert (=> bm!58024 m!1108265))

(assert (=> bm!58024 m!1108471))

(declare-fun m!1108849 () Bool)

(assert (=> b!1203449 m!1108849))

(assert (=> d!132347 d!132437))

(declare-fun b!1203451 () Bool)

(declare-fun e!683372 () Bool)

(declare-fun e!683369 () Bool)

(assert (=> b!1203451 (= e!683372 e!683369)))

(declare-fun c!117850 () Bool)

(assert (=> b!1203451 (= c!117850 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203452 () Bool)

(declare-fun call!58028 () Bool)

(assert (=> b!1203452 (= e!683369 call!58028)))

(declare-fun d!132439 () Bool)

(declare-fun res!800839 () Bool)

(declare-fun e!683370 () Bool)

(assert (=> d!132439 (=> res!800839 e!683370)))

(assert (=> d!132439 (= res!800839 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (=> d!132439 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117799 (Cons!26542 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) Nil!26543) Nil!26543)) e!683370)))

(declare-fun b!1203453 () Bool)

(assert (=> b!1203453 (= e!683369 call!58028)))

(declare-fun bm!58025 () Bool)

(assert (=> bm!58025 (= call!58028 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!117850 (Cons!26542 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!117799 (Cons!26542 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) Nil!26543) Nil!26543)) (ite c!117799 (Cons!26542 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) Nil!26543) Nil!26543))))))

(declare-fun b!1203454 () Bool)

(declare-fun e!683371 () Bool)

(assert (=> b!1203454 (= e!683371 (contains!6877 (ite c!117799 (Cons!26542 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) Nil!26543) Nil!26543) (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203455 () Bool)

(assert (=> b!1203455 (= e!683370 e!683372)))

(declare-fun res!800838 () Bool)

(assert (=> b!1203455 (=> (not res!800838) (not e!683372))))

(assert (=> b!1203455 (= res!800838 (not e!683371))))

(declare-fun res!800840 () Bool)

(assert (=> b!1203455 (=> (not res!800840) (not e!683371))))

(assert (=> b!1203455 (= res!800840 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!132439 (not res!800839)) b!1203455))

(assert (= (and b!1203455 res!800840) b!1203454))

(assert (= (and b!1203455 res!800838) b!1203451))

(assert (= (and b!1203451 c!117850) b!1203452))

(assert (= (and b!1203451 (not c!117850)) b!1203453))

(assert (= (or b!1203452 b!1203453) bm!58025))

(assert (=> b!1203451 m!1108821))

(assert (=> b!1203451 m!1108821))

(assert (=> b!1203451 m!1108823))

(assert (=> bm!58025 m!1108821))

(declare-fun m!1108851 () Bool)

(assert (=> bm!58025 m!1108851))

(assert (=> b!1203454 m!1108821))

(assert (=> b!1203454 m!1108821))

(declare-fun m!1108853 () Bool)

(assert (=> b!1203454 m!1108853))

(assert (=> b!1203455 m!1108821))

(assert (=> b!1203455 m!1108821))

(assert (=> b!1203455 m!1108823))

(assert (=> bm!58000 d!132439))

(declare-fun lt!545466 () Bool)

(declare-fun d!132441 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!540 (List!26545) (InoxSet tuple2!19758))

(assert (=> d!132441 (= lt!545466 (select (content!540 (toList!8879 lt!545322)) (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!683377 () Bool)

(assert (=> d!132441 (= lt!545466 e!683377)))

(declare-fun res!800846 () Bool)

(assert (=> d!132441 (=> (not res!800846) (not e!683377))))

(assert (=> d!132441 (= res!800846 ((_ is Cons!26541) (toList!8879 lt!545322)))))

(assert (=> d!132441 (= (contains!6876 (toList!8879 lt!545322) (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545466)))

(declare-fun b!1203460 () Bool)

(declare-fun e!683378 () Bool)

(assert (=> b!1203460 (= e!683377 e!683378)))

(declare-fun res!800845 () Bool)

(assert (=> b!1203460 (=> res!800845 e!683378)))

(assert (=> b!1203460 (= res!800845 (= (h!27750 (toList!8879 lt!545322)) (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203461 () Bool)

(assert (=> b!1203461 (= e!683378 (contains!6876 (t!39413 (toList!8879 lt!545322)) (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132441 res!800846) b!1203460))

(assert (= (and b!1203460 (not res!800845)) b!1203461))

(declare-fun m!1108855 () Bool)

(assert (=> d!132441 m!1108855))

(declare-fun m!1108857 () Bool)

(assert (=> d!132441 m!1108857))

(declare-fun m!1108859 () Bool)

(assert (=> b!1203461 m!1108859))

(assert (=> b!1203249 d!132441))

(declare-fun d!132443 () Bool)

(declare-fun isEmpty!986 (List!26545) Bool)

(assert (=> d!132443 (= (isEmpty!985 lt!545300) (isEmpty!986 (toList!8879 lt!545300)))))

(declare-fun bs!34035 () Bool)

(assert (= bs!34035 d!132443))

(declare-fun m!1108861 () Bool)

(assert (=> bs!34035 m!1108861))

(assert (=> b!1203224 d!132443))

(assert (=> bm!58005 d!132357))

(assert (=> b!1203293 d!132377))

(declare-fun d!132445 () Bool)

(declare-fun c!117851 () Bool)

(assert (=> d!132445 (= c!117851 ((_ is ValueCellFull!14591) (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!683379 () V!45929)

(assert (=> d!132445 (= (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683379)))

(declare-fun b!1203462 () Bool)

(assert (=> b!1203462 (= e!683379 (get!19178 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203463 () Bool)

(assert (=> b!1203463 (= e!683379 (get!19179 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132445 c!117851) b!1203462))

(assert (= (and d!132445 (not c!117851)) b!1203463))

(assert (=> b!1203462 m!1108503))

(assert (=> b!1203462 m!1108263))

(declare-fun m!1108863 () Bool)

(assert (=> b!1203462 m!1108863))

(assert (=> b!1203463 m!1108503))

(assert (=> b!1203463 m!1108263))

(declare-fun m!1108865 () Bool)

(assert (=> b!1203463 m!1108865))

(assert (=> b!1203297 d!132445))

(declare-fun d!132447 () Bool)

(declare-fun e!683380 () Bool)

(assert (=> d!132447 e!683380))

(declare-fun res!800847 () Bool)

(assert (=> d!132447 (=> res!800847 e!683380)))

(declare-fun lt!545469 () Bool)

(assert (=> d!132447 (= res!800847 (not lt!545469))))

(declare-fun lt!545470 () Bool)

(assert (=> d!132447 (= lt!545469 lt!545470)))

(declare-fun lt!545467 () Unit!39733)

(declare-fun e!683381 () Unit!39733)

(assert (=> d!132447 (= lt!545467 e!683381)))

(declare-fun c!117852 () Bool)

(assert (=> d!132447 (= c!117852 lt!545470)))

(assert (=> d!132447 (= lt!545470 (containsKey!587 (toList!8879 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351))) lt!545348))))

(assert (=> d!132447 (= (contains!6873 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351)) lt!545348) lt!545469)))

(declare-fun b!1203464 () Bool)

(declare-fun lt!545468 () Unit!39733)

(assert (=> b!1203464 (= e!683381 lt!545468)))

(assert (=> b!1203464 (= lt!545468 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351))) lt!545348))))

(assert (=> b!1203464 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351))) lt!545348))))

(declare-fun b!1203465 () Bool)

(declare-fun Unit!39750 () Unit!39733)

(assert (=> b!1203465 (= e!683381 Unit!39750)))

(declare-fun b!1203466 () Bool)

(assert (=> b!1203466 (= e!683380 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351))) lt!545348)))))

(assert (= (and d!132447 c!117852) b!1203464))

(assert (= (and d!132447 (not c!117852)) b!1203465))

(assert (= (and d!132447 (not res!800847)) b!1203466))

(declare-fun m!1108867 () Bool)

(assert (=> d!132447 m!1108867))

(declare-fun m!1108869 () Bool)

(assert (=> b!1203464 m!1108869))

(declare-fun m!1108871 () Bool)

(assert (=> b!1203464 m!1108871))

(assert (=> b!1203464 m!1108871))

(declare-fun m!1108873 () Bool)

(assert (=> b!1203464 m!1108873))

(assert (=> b!1203466 m!1108871))

(assert (=> b!1203466 m!1108871))

(assert (=> b!1203466 m!1108873))

(assert (=> b!1203297 d!132447))

(declare-fun d!132449 () Bool)

(declare-fun e!683382 () Bool)

(assert (=> d!132449 e!683382))

(declare-fun res!800848 () Bool)

(assert (=> d!132449 (=> (not res!800848) (not e!683382))))

(declare-fun lt!545472 () ListLongMap!17727)

(assert (=> d!132449 (= res!800848 (contains!6873 lt!545472 (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545474 () List!26545)

(assert (=> d!132449 (= lt!545472 (ListLongMap!17728 lt!545474))))

(declare-fun lt!545471 () Unit!39733)

(declare-fun lt!545473 () Unit!39733)

(assert (=> d!132449 (= lt!545471 lt!545473)))

(assert (=> d!132449 (= (getValueByKey!633 lt!545474 (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132449 (= lt!545473 (lemmaContainsTupThenGetReturnValue!309 lt!545474 (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132449 (= lt!545474 (insertStrictlySorted!402 (toList!8879 call!58014) (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132449 (= (+!4013 call!58014 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545472)))

(declare-fun b!1203467 () Bool)

(declare-fun res!800849 () Bool)

(assert (=> b!1203467 (=> (not res!800849) (not e!683382))))

(assert (=> b!1203467 (= res!800849 (= (getValueByKey!633 (toList!8879 lt!545472) (_1!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203468 () Bool)

(assert (=> b!1203468 (= e!683382 (contains!6876 (toList!8879 lt!545472) (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19177 (select (arr!37591 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132449 res!800848) b!1203467))

(assert (= (and b!1203467 res!800849) b!1203468))

(declare-fun m!1108875 () Bool)

(assert (=> d!132449 m!1108875))

(declare-fun m!1108877 () Bool)

(assert (=> d!132449 m!1108877))

(declare-fun m!1108879 () Bool)

(assert (=> d!132449 m!1108879))

(declare-fun m!1108881 () Bool)

(assert (=> d!132449 m!1108881))

(declare-fun m!1108883 () Bool)

(assert (=> b!1203467 m!1108883))

(declare-fun m!1108885 () Bool)

(assert (=> b!1203468 m!1108885))

(assert (=> b!1203297 d!132449))

(declare-fun d!132451 () Bool)

(declare-fun e!683383 () Bool)

(assert (=> d!132451 e!683383))

(declare-fun res!800850 () Bool)

(assert (=> d!132451 (=> (not res!800850) (not e!683383))))

(declare-fun lt!545476 () ListLongMap!17727)

(assert (=> d!132451 (= res!800850 (contains!6873 lt!545476 (_1!9890 (tuple2!19759 lt!545350 lt!545351))))))

(declare-fun lt!545478 () List!26545)

(assert (=> d!132451 (= lt!545476 (ListLongMap!17728 lt!545478))))

(declare-fun lt!545475 () Unit!39733)

(declare-fun lt!545477 () Unit!39733)

(assert (=> d!132451 (= lt!545475 lt!545477)))

(assert (=> d!132451 (= (getValueByKey!633 lt!545478 (_1!9890 (tuple2!19759 lt!545350 lt!545351))) (Some!683 (_2!9890 (tuple2!19759 lt!545350 lt!545351))))))

(assert (=> d!132451 (= lt!545477 (lemmaContainsTupThenGetReturnValue!309 lt!545478 (_1!9890 (tuple2!19759 lt!545350 lt!545351)) (_2!9890 (tuple2!19759 lt!545350 lt!545351))))))

(assert (=> d!132451 (= lt!545478 (insertStrictlySorted!402 (toList!8879 lt!545346) (_1!9890 (tuple2!19759 lt!545350 lt!545351)) (_2!9890 (tuple2!19759 lt!545350 lt!545351))))))

(assert (=> d!132451 (= (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351)) lt!545476)))

(declare-fun b!1203469 () Bool)

(declare-fun res!800851 () Bool)

(assert (=> b!1203469 (=> (not res!800851) (not e!683383))))

(assert (=> b!1203469 (= res!800851 (= (getValueByKey!633 (toList!8879 lt!545476) (_1!9890 (tuple2!19759 lt!545350 lt!545351))) (Some!683 (_2!9890 (tuple2!19759 lt!545350 lt!545351)))))))

(declare-fun b!1203470 () Bool)

(assert (=> b!1203470 (= e!683383 (contains!6876 (toList!8879 lt!545476) (tuple2!19759 lt!545350 lt!545351)))))

(assert (= (and d!132451 res!800850) b!1203469))

(assert (= (and b!1203469 res!800851) b!1203470))

(declare-fun m!1108887 () Bool)

(assert (=> d!132451 m!1108887))

(declare-fun m!1108889 () Bool)

(assert (=> d!132451 m!1108889))

(declare-fun m!1108891 () Bool)

(assert (=> d!132451 m!1108891))

(declare-fun m!1108893 () Bool)

(assert (=> d!132451 m!1108893))

(declare-fun m!1108895 () Bool)

(assert (=> b!1203469 m!1108895))

(declare-fun m!1108897 () Bool)

(assert (=> b!1203470 m!1108897))

(assert (=> b!1203297 d!132451))

(declare-fun d!132453 () Bool)

(assert (=> d!132453 (not (contains!6873 (+!4013 lt!545346 (tuple2!19759 lt!545350 lt!545351)) lt!545348))))

(declare-fun lt!545479 () Unit!39733)

(assert (=> d!132453 (= lt!545479 (choose!1795 lt!545346 lt!545350 lt!545351 lt!545348))))

(declare-fun e!683384 () Bool)

(assert (=> d!132453 e!683384))

(declare-fun res!800852 () Bool)

(assert (=> d!132453 (=> (not res!800852) (not e!683384))))

(assert (=> d!132453 (= res!800852 (not (contains!6873 lt!545346 lt!545348)))))

(assert (=> d!132453 (= (addStillNotContains!289 lt!545346 lt!545350 lt!545351 lt!545348) lt!545479)))

(declare-fun b!1203471 () Bool)

(assert (=> b!1203471 (= e!683384 (not (= lt!545350 lt!545348)))))

(assert (= (and d!132453 res!800852) b!1203471))

(assert (=> d!132453 m!1108515))

(assert (=> d!132453 m!1108515))

(assert (=> d!132453 m!1108521))

(declare-fun m!1108899 () Bool)

(assert (=> d!132453 m!1108899))

(declare-fun m!1108901 () Bool)

(assert (=> d!132453 m!1108901))

(assert (=> b!1203297 d!132453))

(declare-fun b!1203483 () Bool)

(declare-fun e!683390 () Option!684)

(assert (=> b!1203483 (= e!683390 None!682)))

(declare-fun b!1203480 () Bool)

(declare-fun e!683389 () Option!684)

(assert (=> b!1203480 (= e!683389 (Some!683 (_2!9890 (h!27750 (toList!8879 lt!545369)))))))

(declare-fun b!1203482 () Bool)

(assert (=> b!1203482 (= e!683390 (getValueByKey!633 (t!39413 (toList!8879 lt!545369)) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun d!132455 () Bool)

(declare-fun c!117857 () Bool)

(assert (=> d!132455 (= c!117857 (and ((_ is Cons!26541) (toList!8879 lt!545369)) (= (_1!9890 (h!27750 (toList!8879 lt!545369))) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132455 (= (getValueByKey!633 (toList!8879 lt!545369) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!683389)))

(declare-fun b!1203481 () Bool)

(assert (=> b!1203481 (= e!683389 e!683390)))

(declare-fun c!117858 () Bool)

(assert (=> b!1203481 (= c!117858 (and ((_ is Cons!26541) (toList!8879 lt!545369)) (not (= (_1!9890 (h!27750 (toList!8879 lt!545369))) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!132455 c!117857) b!1203480))

(assert (= (and d!132455 (not c!117857)) b!1203481))

(assert (= (and b!1203481 c!117858) b!1203482))

(assert (= (and b!1203481 (not c!117858)) b!1203483))

(declare-fun m!1108903 () Bool)

(assert (=> b!1203482 m!1108903))

(assert (=> b!1203318 d!132455))

(assert (=> b!1203324 d!132377))

(declare-fun d!132457 () Bool)

(declare-fun e!683391 () Bool)

(assert (=> d!132457 e!683391))

(declare-fun res!800853 () Bool)

(assert (=> d!132457 (=> res!800853 e!683391)))

(declare-fun lt!545482 () Bool)

(assert (=> d!132457 (= res!800853 (not lt!545482))))

(declare-fun lt!545483 () Bool)

(assert (=> d!132457 (= lt!545482 lt!545483)))

(declare-fun lt!545480 () Unit!39733)

(declare-fun e!683392 () Unit!39733)

(assert (=> d!132457 (= lt!545480 e!683392)))

(declare-fun c!117859 () Bool)

(assert (=> d!132457 (= c!117859 lt!545483)))

(assert (=> d!132457 (= lt!545483 (containsKey!587 (toList!8879 lt!545307) (select (arr!37590 _keys!1208) from!1455)))))

(assert (=> d!132457 (= (contains!6873 lt!545307 (select (arr!37590 _keys!1208) from!1455)) lt!545482)))

(declare-fun b!1203484 () Bool)

(declare-fun lt!545481 () Unit!39733)

(assert (=> b!1203484 (= e!683392 lt!545481)))

(assert (=> b!1203484 (= lt!545481 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545307) (select (arr!37590 _keys!1208) from!1455)))))

(assert (=> b!1203484 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545307) (select (arr!37590 _keys!1208) from!1455)))))

(declare-fun b!1203485 () Bool)

(declare-fun Unit!39751 () Unit!39733)

(assert (=> b!1203485 (= e!683392 Unit!39751)))

(declare-fun b!1203486 () Bool)

(assert (=> b!1203486 (= e!683391 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545307) (select (arr!37590 _keys!1208) from!1455))))))

(assert (= (and d!132457 c!117859) b!1203484))

(assert (= (and d!132457 (not c!117859)) b!1203485))

(assert (= (and d!132457 (not res!800853)) b!1203486))

(assert (=> d!132457 m!1108251))

(declare-fun m!1108905 () Bool)

(assert (=> d!132457 m!1108905))

(assert (=> b!1203484 m!1108251))

(declare-fun m!1108907 () Bool)

(assert (=> b!1203484 m!1108907))

(assert (=> b!1203484 m!1108251))

(declare-fun m!1108909 () Bool)

(assert (=> b!1203484 m!1108909))

(assert (=> b!1203484 m!1108909))

(declare-fun m!1108911 () Bool)

(assert (=> b!1203484 m!1108911))

(assert (=> b!1203486 m!1108251))

(assert (=> b!1203486 m!1108909))

(assert (=> b!1203486 m!1108909))

(assert (=> b!1203486 m!1108911))

(assert (=> b!1203238 d!132457))

(declare-fun d!132459 () Bool)

(declare-fun e!683393 () Bool)

(assert (=> d!132459 e!683393))

(declare-fun res!800854 () Bool)

(assert (=> d!132459 (=> res!800854 e!683393)))

(declare-fun lt!545486 () Bool)

(assert (=> d!132459 (= res!800854 (not lt!545486))))

(declare-fun lt!545487 () Bool)

(assert (=> d!132459 (= lt!545486 lt!545487)))

(declare-fun lt!545484 () Unit!39733)

(declare-fun e!683394 () Unit!39733)

(assert (=> d!132459 (= lt!545484 e!683394)))

(declare-fun c!117860 () Bool)

(assert (=> d!132459 (= c!117860 lt!545487)))

(assert (=> d!132459 (= lt!545487 (containsKey!587 (toList!8879 lt!545347) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132459 (= (contains!6873 lt!545347 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545486)))

(declare-fun b!1203487 () Bool)

(declare-fun lt!545485 () Unit!39733)

(assert (=> b!1203487 (= e!683394 lt!545485)))

(assert (=> b!1203487 (= lt!545485 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545347) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203487 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545347) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203488 () Bool)

(declare-fun Unit!39752 () Unit!39733)

(assert (=> b!1203488 (= e!683394 Unit!39752)))

(declare-fun b!1203489 () Bool)

(assert (=> b!1203489 (= e!683393 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132459 c!117860) b!1203487))

(assert (= (and d!132459 (not c!117860)) b!1203488))

(assert (= (and d!132459 (not res!800854)) b!1203489))

(declare-fun m!1108913 () Bool)

(assert (=> d!132459 m!1108913))

(declare-fun m!1108915 () Bool)

(assert (=> b!1203487 m!1108915))

(declare-fun m!1108917 () Bool)

(assert (=> b!1203487 m!1108917))

(assert (=> b!1203487 m!1108917))

(declare-fun m!1108919 () Bool)

(assert (=> b!1203487 m!1108919))

(assert (=> b!1203489 m!1108917))

(assert (=> b!1203489 m!1108917))

(assert (=> b!1203489 m!1108919))

(assert (=> d!132357 d!132459))

(assert (=> d!132357 d!132345))

(declare-fun d!132461 () Bool)

(assert (=> d!132461 (= (apply!953 lt!545307 (select (arr!37590 _keys!1208) from!1455)) (get!19180 (getValueByKey!633 (toList!8879 lt!545307) (select (arr!37590 _keys!1208) from!1455))))))

(declare-fun bs!34036 () Bool)

(assert (= bs!34036 d!132461))

(assert (=> bs!34036 m!1108251))

(assert (=> bs!34036 m!1108909))

(assert (=> bs!34036 m!1108909))

(declare-fun m!1108921 () Bool)

(assert (=> bs!34036 m!1108921))

(assert (=> b!1203241 d!132461))

(assert (=> b!1203241 d!132385))

(declare-fun d!132463 () Bool)

(assert (=> d!132463 (= (apply!953 lt!545347 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19180 (getValueByKey!633 (toList!8879 lt!545347) (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34037 () Bool)

(assert (= bs!34037 d!132463))

(assert (=> bs!34037 m!1108497))

(declare-fun m!1108923 () Bool)

(assert (=> bs!34037 m!1108923))

(assert (=> bs!34037 m!1108923))

(declare-fun m!1108925 () Bool)

(assert (=> bs!34037 m!1108925))

(assert (=> b!1203305 d!132463))

(assert (=> b!1203305 d!132445))

(declare-fun d!132465 () Bool)

(declare-fun e!683395 () Bool)

(assert (=> d!132465 e!683395))

(declare-fun res!800855 () Bool)

(assert (=> d!132465 (=> res!800855 e!683395)))

(declare-fun lt!545490 () Bool)

(assert (=> d!132465 (= res!800855 (not lt!545490))))

(declare-fun lt!545491 () Bool)

(assert (=> d!132465 (= lt!545490 lt!545491)))

(declare-fun lt!545488 () Unit!39733)

(declare-fun e!683396 () Unit!39733)

(assert (=> d!132465 (= lt!545488 e!683396)))

(declare-fun c!117861 () Bool)

(assert (=> d!132465 (= c!117861 lt!545491)))

(assert (=> d!132465 (= lt!545491 (containsKey!587 (toList!8879 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> d!132465 (= (contains!6873 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))) k0!934) lt!545490)))

(declare-fun b!1203490 () Bool)

(declare-fun lt!545489 () Unit!39733)

(assert (=> b!1203490 (= e!683396 lt!545489)))

(assert (=> b!1203490 (= lt!545489 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> b!1203490 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))) k0!934))))

(declare-fun b!1203491 () Bool)

(declare-fun Unit!39753 () Unit!39733)

(assert (=> b!1203491 (= e!683396 Unit!39753)))

(declare-fun b!1203492 () Bool)

(assert (=> b!1203492 (= e!683395 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))) k0!934)))))

(assert (= (and d!132465 c!117861) b!1203490))

(assert (= (and d!132465 (not c!117861)) b!1203491))

(assert (= (and d!132465 (not res!800855)) b!1203492))

(declare-fun m!1108927 () Bool)

(assert (=> d!132465 m!1108927))

(declare-fun m!1108929 () Bool)

(assert (=> b!1203490 m!1108929))

(declare-fun m!1108931 () Bool)

(assert (=> b!1203490 m!1108931))

(assert (=> b!1203490 m!1108931))

(declare-fun m!1108933 () Bool)

(assert (=> b!1203490 m!1108933))

(assert (=> b!1203492 m!1108931))

(assert (=> b!1203492 m!1108931))

(assert (=> b!1203492 m!1108933))

(assert (=> d!132365 d!132465))

(declare-fun d!132467 () Bool)

(declare-fun e!683397 () Bool)

(assert (=> d!132467 e!683397))

(declare-fun res!800856 () Bool)

(assert (=> d!132467 (=> (not res!800856) (not e!683397))))

(declare-fun lt!545493 () ListLongMap!17727)

(assert (=> d!132467 (= res!800856 (contains!6873 lt!545493 (_1!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))))))

(declare-fun lt!545495 () List!26545)

(assert (=> d!132467 (= lt!545493 (ListLongMap!17728 lt!545495))))

(declare-fun lt!545492 () Unit!39733)

(declare-fun lt!545494 () Unit!39733)

(assert (=> d!132467 (= lt!545492 lt!545494)))

(assert (=> d!132467 (= (getValueByKey!633 lt!545495 (_1!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))) (Some!683 (_2!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))))))

(assert (=> d!132467 (= lt!545494 (lemmaContainsTupThenGetReturnValue!309 lt!545495 (_1!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))) (_2!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))))))

(assert (=> d!132467 (= lt!545495 (insertStrictlySorted!402 (toList!8879 (ite c!117753 lt!545190 lt!545196)) (_1!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))) (_2!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))))))

(assert (=> d!132467 (= (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))) lt!545493)))

(declare-fun b!1203493 () Bool)

(declare-fun res!800857 () Bool)

(assert (=> b!1203493 (=> (not res!800857) (not e!683397))))

(assert (=> b!1203493 (= res!800857 (= (getValueByKey!633 (toList!8879 lt!545493) (_1!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944))))) (Some!683 (_2!9890 (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))))))))

(declare-fun b!1203494 () Bool)

(assert (=> b!1203494 (= e!683397 (contains!6876 (toList!8879 lt!545493) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))))))

(assert (= (and d!132467 res!800856) b!1203493))

(assert (= (and b!1203493 res!800857) b!1203494))

(declare-fun m!1108935 () Bool)

(assert (=> d!132467 m!1108935))

(declare-fun m!1108937 () Bool)

(assert (=> d!132467 m!1108937))

(declare-fun m!1108939 () Bool)

(assert (=> d!132467 m!1108939))

(declare-fun m!1108941 () Bool)

(assert (=> d!132467 m!1108941))

(declare-fun m!1108943 () Bool)

(assert (=> b!1203493 m!1108943))

(declare-fun m!1108945 () Bool)

(assert (=> b!1203494 m!1108945))

(assert (=> d!132365 d!132467))

(declare-fun d!132469 () Bool)

(assert (=> d!132469 (contains!6873 (+!4013 (ite c!117753 lt!545190 lt!545196) (tuple2!19759 (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)))) k0!934)))

(assert (=> d!132469 true))

(declare-fun _$35!455 () Unit!39733)

(assert (=> d!132469 (= (choose!1794 (ite c!117753 lt!545190 lt!545196) (ite c!117753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117755 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117753 minValue!944 (ite c!117755 zeroValue!944 minValue!944)) k0!934) _$35!455)))

(declare-fun bs!34038 () Bool)

(assert (= bs!34038 d!132469))

(assert (=> bs!34038 m!1108551))

(assert (=> bs!34038 m!1108551))

(assert (=> bs!34038 m!1108553))

(assert (=> d!132365 d!132469))

(declare-fun d!132471 () Bool)

(declare-fun e!683398 () Bool)

(assert (=> d!132471 e!683398))

(declare-fun res!800858 () Bool)

(assert (=> d!132471 (=> res!800858 e!683398)))

(declare-fun lt!545498 () Bool)

(assert (=> d!132471 (= res!800858 (not lt!545498))))

(declare-fun lt!545499 () Bool)

(assert (=> d!132471 (= lt!545498 lt!545499)))

(declare-fun lt!545496 () Unit!39733)

(declare-fun e!683399 () Unit!39733)

(assert (=> d!132471 (= lt!545496 e!683399)))

(declare-fun c!117862 () Bool)

(assert (=> d!132471 (= c!117862 lt!545499)))

(assert (=> d!132471 (= lt!545499 (containsKey!587 (toList!8879 (ite c!117753 lt!545190 lt!545196)) k0!934))))

(assert (=> d!132471 (= (contains!6873 (ite c!117753 lt!545190 lt!545196) k0!934) lt!545498)))

(declare-fun b!1203496 () Bool)

(declare-fun lt!545497 () Unit!39733)

(assert (=> b!1203496 (= e!683399 lt!545497)))

(assert (=> b!1203496 (= lt!545497 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (ite c!117753 lt!545190 lt!545196)) k0!934))))

(assert (=> b!1203496 (isDefined!459 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 lt!545196)) k0!934))))

(declare-fun b!1203497 () Bool)

(declare-fun Unit!39754 () Unit!39733)

(assert (=> b!1203497 (= e!683399 Unit!39754)))

(declare-fun b!1203498 () Bool)

(assert (=> b!1203498 (= e!683398 (isDefined!459 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 lt!545196)) k0!934)))))

(assert (= (and d!132471 c!117862) b!1203496))

(assert (= (and d!132471 (not c!117862)) b!1203497))

(assert (= (and d!132471 (not res!800858)) b!1203498))

(declare-fun m!1108947 () Bool)

(assert (=> d!132471 m!1108947))

(declare-fun m!1108949 () Bool)

(assert (=> b!1203496 m!1108949))

(declare-fun m!1108951 () Bool)

(assert (=> b!1203496 m!1108951))

(assert (=> b!1203496 m!1108951))

(declare-fun m!1108953 () Bool)

(assert (=> b!1203496 m!1108953))

(assert (=> b!1203498 m!1108951))

(assert (=> b!1203498 m!1108951))

(assert (=> b!1203498 m!1108953))

(assert (=> d!132365 d!132471))

(declare-fun d!132473 () Bool)

(declare-fun res!800859 () Bool)

(declare-fun e!683400 () Bool)

(assert (=> d!132473 (=> res!800859 e!683400)))

(assert (=> d!132473 (= res!800859 (and ((_ is Cons!26541) (toList!8879 (ite c!117753 lt!545190 call!57945))) (= (_1!9890 (h!27750 (toList!8879 (ite c!117753 lt!545190 call!57945)))) k0!934)))))

(assert (=> d!132473 (= (containsKey!587 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934) e!683400)))

(declare-fun b!1203499 () Bool)

(declare-fun e!683401 () Bool)

(assert (=> b!1203499 (= e!683400 e!683401)))

(declare-fun res!800860 () Bool)

(assert (=> b!1203499 (=> (not res!800860) (not e!683401))))

(assert (=> b!1203499 (= res!800860 (and (or (not ((_ is Cons!26541) (toList!8879 (ite c!117753 lt!545190 call!57945)))) (bvsle (_1!9890 (h!27750 (toList!8879 (ite c!117753 lt!545190 call!57945)))) k0!934)) ((_ is Cons!26541) (toList!8879 (ite c!117753 lt!545190 call!57945))) (bvslt (_1!9890 (h!27750 (toList!8879 (ite c!117753 lt!545190 call!57945)))) k0!934)))))

(declare-fun b!1203500 () Bool)

(assert (=> b!1203500 (= e!683401 (containsKey!587 (t!39413 (toList!8879 (ite c!117753 lt!545190 call!57945))) k0!934))))

(assert (= (and d!132473 (not res!800859)) b!1203499))

(assert (= (and b!1203499 res!800860) b!1203500))

(declare-fun m!1108955 () Bool)

(assert (=> b!1203500 m!1108955))

(assert (=> d!132373 d!132473))

(declare-fun d!132475 () Bool)

(declare-fun res!800861 () Bool)

(declare-fun e!683402 () Bool)

(assert (=> d!132475 (=> res!800861 e!683402)))

(assert (=> d!132475 (= res!800861 (and ((_ is Cons!26541) (toList!8879 lt!545196)) (= (_1!9890 (h!27750 (toList!8879 lt!545196))) k0!934)))))

(assert (=> d!132475 (= (containsKey!587 (toList!8879 lt!545196) k0!934) e!683402)))

(declare-fun b!1203501 () Bool)

(declare-fun e!683403 () Bool)

(assert (=> b!1203501 (= e!683402 e!683403)))

(declare-fun res!800862 () Bool)

(assert (=> b!1203501 (=> (not res!800862) (not e!683403))))

(assert (=> b!1203501 (= res!800862 (and (or (not ((_ is Cons!26541) (toList!8879 lt!545196))) (bvsle (_1!9890 (h!27750 (toList!8879 lt!545196))) k0!934)) ((_ is Cons!26541) (toList!8879 lt!545196)) (bvslt (_1!9890 (h!27750 (toList!8879 lt!545196))) k0!934)))))

(declare-fun b!1203502 () Bool)

(assert (=> b!1203502 (= e!683403 (containsKey!587 (t!39413 (toList!8879 lt!545196)) k0!934))))

(assert (= (and d!132475 (not res!800861)) b!1203501))

(assert (= (and b!1203501 res!800862) b!1203502))

(declare-fun m!1108957 () Bool)

(assert (=> b!1203502 m!1108957))

(assert (=> d!132371 d!132475))

(declare-fun d!132477 () Bool)

(declare-fun e!683404 () Bool)

(assert (=> d!132477 e!683404))

(declare-fun res!800863 () Bool)

(assert (=> d!132477 (=> res!800863 e!683404)))

(declare-fun lt!545502 () Bool)

(assert (=> d!132477 (= res!800863 (not lt!545502))))

(declare-fun lt!545503 () Bool)

(assert (=> d!132477 (= lt!545502 lt!545503)))

(declare-fun lt!545500 () Unit!39733)

(declare-fun e!683405 () Unit!39733)

(assert (=> d!132477 (= lt!545500 e!683405)))

(declare-fun c!117863 () Bool)

(assert (=> d!132477 (= c!117863 lt!545503)))

(assert (=> d!132477 (= lt!545503 (containsKey!587 (toList!8879 lt!545300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132477 (= (contains!6873 lt!545300 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545502)))

(declare-fun b!1203503 () Bool)

(declare-fun lt!545501 () Unit!39733)

(assert (=> b!1203503 (= e!683405 lt!545501)))

(assert (=> b!1203503 (= lt!545501 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203503 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203504 () Bool)

(declare-fun Unit!39755 () Unit!39733)

(assert (=> b!1203504 (= e!683405 Unit!39755)))

(declare-fun b!1203505 () Bool)

(assert (=> b!1203505 (= e!683404 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132477 c!117863) b!1203503))

(assert (= (and d!132477 (not c!117863)) b!1203504))

(assert (= (and d!132477 (not res!800863)) b!1203505))

(declare-fun m!1108959 () Bool)

(assert (=> d!132477 m!1108959))

(declare-fun m!1108961 () Bool)

(assert (=> b!1203503 m!1108961))

(declare-fun m!1108963 () Bool)

(assert (=> b!1203503 m!1108963))

(assert (=> b!1203503 m!1108963))

(declare-fun m!1108965 () Bool)

(assert (=> b!1203503 m!1108965))

(assert (=> b!1203505 m!1108963))

(assert (=> b!1203505 m!1108963))

(assert (=> b!1203505 m!1108965))

(assert (=> b!1203230 d!132477))

(declare-fun d!132479 () Bool)

(declare-fun e!683406 () Bool)

(assert (=> d!132479 e!683406))

(declare-fun res!800864 () Bool)

(assert (=> d!132479 (=> res!800864 e!683406)))

(declare-fun lt!545506 () Bool)

(assert (=> d!132479 (= res!800864 (not lt!545506))))

(declare-fun lt!545507 () Bool)

(assert (=> d!132479 (= lt!545506 lt!545507)))

(declare-fun lt!545504 () Unit!39733)

(declare-fun e!683407 () Unit!39733)

(assert (=> d!132479 (= lt!545504 e!683407)))

(declare-fun c!117864 () Bool)

(assert (=> d!132479 (= c!117864 lt!545507)))

(assert (=> d!132479 (= lt!545507 (containsKey!587 (toList!8879 lt!545374) (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132479 (= (contains!6873 lt!545374 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))) lt!545506)))

(declare-fun b!1203506 () Bool)

(declare-fun lt!545505 () Unit!39733)

(assert (=> b!1203506 (= e!683407 lt!545505)))

(assert (=> b!1203506 (= lt!545505 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545374) (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203506 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545374) (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203507 () Bool)

(declare-fun Unit!39756 () Unit!39733)

(assert (=> b!1203507 (= e!683407 Unit!39756)))

(declare-fun b!1203508 () Bool)

(assert (=> b!1203508 (= e!683406 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545374) (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132479 c!117864) b!1203506))

(assert (= (and d!132479 (not c!117864)) b!1203507))

(assert (= (and d!132479 (not res!800864)) b!1203508))

(assert (=> d!132479 m!1108563))

(declare-fun m!1108967 () Bool)

(assert (=> d!132479 m!1108967))

(assert (=> b!1203506 m!1108563))

(declare-fun m!1108969 () Bool)

(assert (=> b!1203506 m!1108969))

(assert (=> b!1203506 m!1108563))

(declare-fun m!1108971 () Bool)

(assert (=> b!1203506 m!1108971))

(assert (=> b!1203506 m!1108971))

(declare-fun m!1108973 () Bool)

(assert (=> b!1203506 m!1108973))

(assert (=> b!1203508 m!1108563))

(assert (=> b!1203508 m!1108971))

(assert (=> b!1203508 m!1108971))

(assert (=> b!1203508 m!1108973))

(assert (=> b!1203331 d!132479))

(declare-fun d!132481 () Bool)

(declare-fun e!683408 () Bool)

(assert (=> d!132481 e!683408))

(declare-fun res!800865 () Bool)

(assert (=> d!132481 (=> res!800865 e!683408)))

(declare-fun lt!545510 () Bool)

(assert (=> d!132481 (= res!800865 (not lt!545510))))

(declare-fun lt!545511 () Bool)

(assert (=> d!132481 (= lt!545510 lt!545511)))

(declare-fun lt!545508 () Unit!39733)

(declare-fun e!683409 () Unit!39733)

(assert (=> d!132481 (= lt!545508 e!683409)))

(declare-fun c!117865 () Bool)

(assert (=> d!132481 (= c!117865 lt!545511)))

(assert (=> d!132481 (= lt!545511 (containsKey!587 (toList!8879 lt!545322) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132481 (= (contains!6873 lt!545322 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!545510)))

(declare-fun b!1203509 () Bool)

(declare-fun lt!545509 () Unit!39733)

(assert (=> b!1203509 (= e!683409 lt!545509)))

(assert (=> b!1203509 (= lt!545509 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545322) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1203509 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545322) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203510 () Bool)

(declare-fun Unit!39757 () Unit!39733)

(assert (=> b!1203510 (= e!683409 Unit!39757)))

(declare-fun b!1203511 () Bool)

(assert (=> b!1203511 (= e!683408 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545322) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!132481 c!117865) b!1203509))

(assert (= (and d!132481 (not c!117865)) b!1203510))

(assert (= (and d!132481 (not res!800865)) b!1203511))

(declare-fun m!1108975 () Bool)

(assert (=> d!132481 m!1108975))

(declare-fun m!1108977 () Bool)

(assert (=> b!1203509 m!1108977))

(assert (=> b!1203509 m!1108451))

(assert (=> b!1203509 m!1108451))

(declare-fun m!1108979 () Bool)

(assert (=> b!1203509 m!1108979))

(assert (=> b!1203511 m!1108451))

(assert (=> b!1203511 m!1108451))

(assert (=> b!1203511 m!1108979))

(assert (=> d!132335 d!132481))

(declare-fun b!1203515 () Bool)

(declare-fun e!683411 () Option!684)

(assert (=> b!1203515 (= e!683411 None!682)))

(declare-fun b!1203512 () Bool)

(declare-fun e!683410 () Option!684)

(assert (=> b!1203512 (= e!683410 (Some!683 (_2!9890 (h!27750 lt!545324))))))

(declare-fun b!1203514 () Bool)

(assert (=> b!1203514 (= e!683411 (getValueByKey!633 (t!39413 lt!545324) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun d!132483 () Bool)

(declare-fun c!117866 () Bool)

(assert (=> d!132483 (= c!117866 (and ((_ is Cons!26541) lt!545324) (= (_1!9890 (h!27750 lt!545324)) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132483 (= (getValueByKey!633 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!683410)))

(declare-fun b!1203513 () Bool)

(assert (=> b!1203513 (= e!683410 e!683411)))

(declare-fun c!117867 () Bool)

(assert (=> b!1203513 (= c!117867 (and ((_ is Cons!26541) lt!545324) (not (= (_1!9890 (h!27750 lt!545324)) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!132483 c!117866) b!1203512))

(assert (= (and d!132483 (not c!117866)) b!1203513))

(assert (= (and b!1203513 c!117867) b!1203514))

(assert (= (and b!1203513 (not c!117867)) b!1203515))

(declare-fun m!1108981 () Bool)

(assert (=> b!1203514 m!1108981))

(assert (=> d!132335 d!132483))

(declare-fun d!132485 () Bool)

(assert (=> d!132485 (= (getValueByKey!633 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!683 (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!545514 () Unit!39733)

(declare-fun choose!1796 (List!26545 (_ BitVec 64) V!45929) Unit!39733)

(assert (=> d!132485 (= lt!545514 (choose!1796 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!683414 () Bool)

(assert (=> d!132485 e!683414))

(declare-fun res!800870 () Bool)

(assert (=> d!132485 (=> (not res!800870) (not e!683414))))

(declare-fun isStrictlySorted!724 (List!26545) Bool)

(assert (=> d!132485 (= res!800870 (isStrictlySorted!724 lt!545324))))

(assert (=> d!132485 (= (lemmaContainsTupThenGetReturnValue!309 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!545514)))

(declare-fun b!1203520 () Bool)

(declare-fun res!800871 () Bool)

(assert (=> b!1203520 (=> (not res!800871) (not e!683414))))

(assert (=> b!1203520 (= res!800871 (containsKey!587 lt!545324 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203521 () Bool)

(assert (=> b!1203521 (= e!683414 (contains!6876 lt!545324 (tuple2!19759 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!132485 res!800870) b!1203520))

(assert (= (and b!1203520 res!800871) b!1203521))

(assert (=> d!132485 m!1108445))

(declare-fun m!1108983 () Bool)

(assert (=> d!132485 m!1108983))

(declare-fun m!1108985 () Bool)

(assert (=> d!132485 m!1108985))

(declare-fun m!1108987 () Bool)

(assert (=> b!1203520 m!1108987))

(declare-fun m!1108989 () Bool)

(assert (=> b!1203521 m!1108989))

(assert (=> d!132335 d!132485))

(declare-fun b!1203542 () Bool)

(declare-fun e!683425 () List!26545)

(declare-fun call!58035 () List!26545)

(assert (=> b!1203542 (= e!683425 call!58035)))

(declare-fun lt!545517 () List!26545)

(declare-fun b!1203543 () Bool)

(declare-fun e!683426 () Bool)

(assert (=> b!1203543 (= e!683426 (contains!6876 lt!545517 (tuple2!19759 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun d!132487 () Bool)

(assert (=> d!132487 e!683426))

(declare-fun res!800877 () Bool)

(assert (=> d!132487 (=> (not res!800877) (not e!683426))))

(assert (=> d!132487 (= res!800877 (isStrictlySorted!724 lt!545517))))

(assert (=> d!132487 (= lt!545517 e!683425)))

(declare-fun c!117876 () Bool)

(assert (=> d!132487 (= c!117876 (and ((_ is Cons!26541) (toList!8879 lt!545196)) (bvslt (_1!9890 (h!27750 (toList!8879 lt!545196))) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132487 (isStrictlySorted!724 (toList!8879 lt!545196))))

(assert (=> d!132487 (= (insertStrictlySorted!402 (toList!8879 lt!545196) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!545517)))

(declare-fun b!1203544 () Bool)

(declare-fun e!683427 () List!26545)

(declare-fun call!58037 () List!26545)

(assert (=> b!1203544 (= e!683427 call!58037)))

(declare-fun c!117879 () Bool)

(declare-fun b!1203545 () Bool)

(assert (=> b!1203545 (= c!117879 (and ((_ is Cons!26541) (toList!8879 lt!545196)) (bvsgt (_1!9890 (h!27750 (toList!8879 lt!545196))) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!683428 () List!26545)

(assert (=> b!1203545 (= e!683428 e!683427)))

(declare-fun b!1203546 () Bool)

(assert (=> b!1203546 (= e!683427 call!58037)))

(declare-fun bm!58032 () Bool)

(declare-fun e!683429 () List!26545)

(declare-fun $colon$colon!611 (List!26545 tuple2!19758) List!26545)

(assert (=> bm!58032 (= call!58035 ($colon$colon!611 e!683429 (ite c!117876 (h!27750 (toList!8879 lt!545196)) (tuple2!19759 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!117878 () Bool)

(assert (=> bm!58032 (= c!117878 c!117876)))

(declare-fun c!117877 () Bool)

(declare-fun b!1203547 () Bool)

(assert (=> b!1203547 (= e!683429 (ite c!117877 (t!39413 (toList!8879 lt!545196)) (ite c!117879 (Cons!26541 (h!27750 (toList!8879 lt!545196)) (t!39413 (toList!8879 lt!545196))) Nil!26542)))))

(declare-fun bm!58033 () Bool)

(declare-fun call!58036 () List!26545)

(assert (=> bm!58033 (= call!58037 call!58036)))

(declare-fun b!1203548 () Bool)

(assert (=> b!1203548 (= e!683425 e!683428)))

(assert (=> b!1203548 (= c!117877 (and ((_ is Cons!26541) (toList!8879 lt!545196)) (= (_1!9890 (h!27750 (toList!8879 lt!545196))) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1203549 () Bool)

(declare-fun res!800876 () Bool)

(assert (=> b!1203549 (=> (not res!800876) (not e!683426))))

(assert (=> b!1203549 (= res!800876 (containsKey!587 lt!545517 (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!58034 () Bool)

(assert (=> bm!58034 (= call!58036 call!58035)))

(declare-fun b!1203550 () Bool)

(assert (=> b!1203550 (= e!683428 call!58036)))

(declare-fun b!1203551 () Bool)

(assert (=> b!1203551 (= e!683429 (insertStrictlySorted!402 (t!39413 (toList!8879 lt!545196)) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132487 c!117876) b!1203542))

(assert (= (and d!132487 (not c!117876)) b!1203548))

(assert (= (and b!1203548 c!117877) b!1203550))

(assert (= (and b!1203548 (not c!117877)) b!1203545))

(assert (= (and b!1203545 c!117879) b!1203546))

(assert (= (and b!1203545 (not c!117879)) b!1203544))

(assert (= (or b!1203546 b!1203544) bm!58033))

(assert (= (or b!1203550 bm!58033) bm!58034))

(assert (= (or b!1203542 bm!58034) bm!58032))

(assert (= (and bm!58032 c!117878) b!1203551))

(assert (= (and bm!58032 (not c!117878)) b!1203547))

(assert (= (and d!132487 res!800877) b!1203549))

(assert (= (and b!1203549 res!800876) b!1203543))

(declare-fun m!1108991 () Bool)

(assert (=> bm!58032 m!1108991))

(declare-fun m!1108993 () Bool)

(assert (=> d!132487 m!1108993))

(declare-fun m!1108995 () Bool)

(assert (=> d!132487 m!1108995))

(declare-fun m!1108997 () Bool)

(assert (=> b!1203549 m!1108997))

(declare-fun m!1108999 () Bool)

(assert (=> b!1203551 m!1108999))

(declare-fun m!1109001 () Bool)

(assert (=> b!1203543 m!1109001))

(assert (=> d!132335 d!132487))

(declare-fun b!1203552 () Bool)

(declare-fun e!683433 () Bool)

(declare-fun e!683430 () Bool)

(assert (=> b!1203552 (= e!683433 e!683430)))

(declare-fun c!117880 () Bool)

(assert (=> b!1203552 (= c!117880 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203553 () Bool)

(declare-fun call!58038 () Bool)

(assert (=> b!1203553 (= e!683430 call!58038)))

(declare-fun d!132489 () Bool)

(declare-fun res!800879 () Bool)

(declare-fun e!683431 () Bool)

(assert (=> d!132489 (=> res!800879 e!683431)))

(assert (=> d!132489 (= res!800879 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (=> d!132489 (= (arrayNoDuplicates!0 lt!545191 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117814 (Cons!26542 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) Nil!26543) Nil!26543)) e!683431)))

(declare-fun b!1203554 () Bool)

(assert (=> b!1203554 (= e!683430 call!58038)))

(declare-fun bm!58035 () Bool)

(assert (=> bm!58035 (= call!58038 (arrayNoDuplicates!0 lt!545191 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!117880 (Cons!26542 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!117814 (Cons!26542 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) Nil!26543) Nil!26543)) (ite c!117814 (Cons!26542 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) Nil!26543) Nil!26543))))))

(declare-fun b!1203555 () Bool)

(declare-fun e!683432 () Bool)

(assert (=> b!1203555 (= e!683432 (contains!6877 (ite c!117814 (Cons!26542 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) Nil!26543) Nil!26543) (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203556 () Bool)

(assert (=> b!1203556 (= e!683431 e!683433)))

(declare-fun res!800878 () Bool)

(assert (=> b!1203556 (=> (not res!800878) (not e!683433))))

(assert (=> b!1203556 (= res!800878 (not e!683432))))

(declare-fun res!800880 () Bool)

(assert (=> b!1203556 (=> (not res!800880) (not e!683432))))

(assert (=> b!1203556 (= res!800880 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!132489 (not res!800879)) b!1203556))

(assert (= (and b!1203556 res!800880) b!1203555))

(assert (= (and b!1203556 res!800878) b!1203552))

(assert (= (and b!1203552 c!117880) b!1203553))

(assert (= (and b!1203552 (not c!117880)) b!1203554))

(assert (= (or b!1203553 b!1203554) bm!58035))

(assert (=> b!1203552 m!1108803))

(assert (=> b!1203552 m!1108803))

(assert (=> b!1203552 m!1108805))

(assert (=> bm!58035 m!1108803))

(declare-fun m!1109003 () Bool)

(assert (=> bm!58035 m!1109003))

(assert (=> b!1203555 m!1108803))

(assert (=> b!1203555 m!1108803))

(declare-fun m!1109005 () Bool)

(assert (=> b!1203555 m!1109005))

(assert (=> b!1203556 m!1108803))

(assert (=> b!1203556 m!1108803))

(assert (=> b!1203556 m!1108805))

(assert (=> bm!58012 d!132489))

(declare-fun d!132491 () Bool)

(assert (=> d!132491 (= (apply!953 lt!545374 (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19180 (getValueByKey!633 (toList!8879 lt!545374) (select (arr!37590 lt!545191) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34039 () Bool)

(assert (= bs!34039 d!132491))

(assert (=> bs!34039 m!1108563))

(assert (=> bs!34039 m!1108971))

(assert (=> bs!34039 m!1108971))

(declare-fun m!1109007 () Bool)

(assert (=> bs!34039 m!1109007))

(assert (=> b!1203334 d!132491))

(assert (=> b!1203334 d!132415))

(declare-fun d!132493 () Bool)

(assert (=> d!132493 (= (isEmpty!985 lt!545307) (isEmpty!986 (toList!8879 lt!545307)))))

(declare-fun bs!34040 () Bool)

(assert (= bs!34040 d!132493))

(declare-fun m!1109009 () Bool)

(assert (=> bs!34040 m!1109009))

(assert (=> b!1203236 d!132493))

(declare-fun b!1203557 () Bool)

(declare-fun e!683440 () Bool)

(assert (=> b!1203557 (= e!683440 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203557 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203558 () Bool)

(declare-fun lt!545521 () Unit!39733)

(declare-fun lt!545524 () Unit!39733)

(assert (=> b!1203558 (= lt!545521 lt!545524)))

(declare-fun lt!545523 () V!45929)

(declare-fun lt!545518 () ListLongMap!17727)

(declare-fun lt!545522 () (_ BitVec 64))

(declare-fun lt!545520 () (_ BitVec 64))

(assert (=> b!1203558 (not (contains!6873 (+!4013 lt!545518 (tuple2!19759 lt!545522 lt!545523)) lt!545520))))

(assert (=> b!1203558 (= lt!545524 (addStillNotContains!289 lt!545518 lt!545522 lt!545523 lt!545520))))

(assert (=> b!1203558 (= lt!545520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203558 (= lt!545523 (get!19177 (select (arr!37591 lt!545194) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203558 (= lt!545522 (select (arr!37590 lt!545191) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58039 () ListLongMap!17727)

(assert (=> b!1203558 (= lt!545518 call!58039)))

(declare-fun e!683437 () ListLongMap!17727)

(assert (=> b!1203558 (= e!683437 (+!4013 call!58039 (tuple2!19759 (select (arr!37590 lt!545191) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19177 (select (arr!37591 lt!545194) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203559 () Bool)

(declare-fun e!683434 () ListLongMap!17727)

(assert (=> b!1203559 (= e!683434 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203560 () Bool)

(assert (=> b!1203560 (= e!683437 call!58039)))

(declare-fun b!1203561 () Bool)

(declare-fun e!683435 () Bool)

(declare-fun lt!545519 () ListLongMap!17727)

(assert (=> b!1203561 (= e!683435 (isEmpty!985 lt!545519))))

(declare-fun b!1203563 () Bool)

(declare-fun e!683436 () Bool)

(declare-fun e!683439 () Bool)

(assert (=> b!1203563 (= e!683436 e!683439)))

(assert (=> b!1203563 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(declare-fun res!800882 () Bool)

(assert (=> b!1203563 (= res!800882 (contains!6873 lt!545519 (select (arr!37590 lt!545191) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203563 (=> (not res!800882) (not e!683439))))

(declare-fun bm!58036 () Bool)

(assert (=> bm!58036 (= call!58039 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203564 () Bool)

(declare-fun e!683438 () Bool)

(assert (=> b!1203564 (= e!683438 e!683436)))

(declare-fun c!117884 () Bool)

(assert (=> b!1203564 (= c!117884 e!683440)))

(declare-fun res!800881 () Bool)

(assert (=> b!1203564 (=> (not res!800881) (not e!683440))))

(assert (=> b!1203564 (= res!800881 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(declare-fun b!1203565 () Bool)

(assert (=> b!1203565 (= e!683435 (= lt!545519 (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203566 () Bool)

(assert (=> b!1203566 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (=> b!1203566 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38129 lt!545194)))))

(assert (=> b!1203566 (= e!683439 (= (apply!953 lt!545519 (select (arr!37590 lt!545191) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19177 (select (arr!37591 lt!545194) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132495 () Bool)

(assert (=> d!132495 e!683438))

(declare-fun res!800884 () Bool)

(assert (=> d!132495 (=> (not res!800884) (not e!683438))))

(assert (=> d!132495 (= res!800884 (not (contains!6873 lt!545519 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132495 (= lt!545519 e!683434)))

(declare-fun c!117883 () Bool)

(assert (=> d!132495 (= c!117883 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (=> d!132495 (validMask!0 mask!1564)))

(assert (=> d!132495 (= (getCurrentListMapNoExtraKeys!5325 lt!545191 lt!545194 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545519)))

(declare-fun b!1203562 () Bool)

(assert (=> b!1203562 (= e!683434 e!683437)))

(declare-fun c!117882 () Bool)

(assert (=> b!1203562 (= c!117882 (validKeyInArray!0 (select (arr!37590 lt!545191) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203567 () Bool)

(declare-fun res!800883 () Bool)

(assert (=> b!1203567 (=> (not res!800883) (not e!683438))))

(assert (=> b!1203567 (= res!800883 (not (contains!6873 lt!545519 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203568 () Bool)

(assert (=> b!1203568 (= e!683436 e!683435)))

(declare-fun c!117881 () Bool)

(assert (=> b!1203568 (= c!117881 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(assert (= (and d!132495 c!117883) b!1203559))

(assert (= (and d!132495 (not c!117883)) b!1203562))

(assert (= (and b!1203562 c!117882) b!1203558))

(assert (= (and b!1203562 (not c!117882)) b!1203560))

(assert (= (or b!1203558 b!1203560) bm!58036))

(assert (= (and d!132495 res!800884) b!1203567))

(assert (= (and b!1203567 res!800883) b!1203564))

(assert (= (and b!1203564 res!800881) b!1203557))

(assert (= (and b!1203564 c!117884) b!1203563))

(assert (= (and b!1203564 (not c!117884)) b!1203568))

(assert (= (and b!1203563 res!800882) b!1203566))

(assert (= (and b!1203568 c!117881) b!1203565))

(assert (= (and b!1203568 (not c!117881)) b!1203561))

(declare-fun b_lambda!21133 () Bool)

(assert (=> (not b_lambda!21133) (not b!1203558)))

(assert (=> b!1203558 t!39412))

(declare-fun b_and!42703 () Bool)

(assert (= b_and!42701 (and (=> t!39412 result!21963) b_and!42703)))

(declare-fun b_lambda!21135 () Bool)

(assert (=> (not b_lambda!21135) (not b!1203566)))

(assert (=> b!1203566 t!39412))

(declare-fun b_and!42705 () Bool)

(assert (= b_and!42703 (and (=> t!39412 result!21963) b_and!42705)))

(declare-fun m!1109011 () Bool)

(assert (=> b!1203563 m!1109011))

(assert (=> b!1203563 m!1109011))

(declare-fun m!1109013 () Bool)

(assert (=> b!1203563 m!1109013))

(declare-fun m!1109015 () Bool)

(assert (=> b!1203565 m!1109015))

(assert (=> b!1203566 m!1109011))

(assert (=> b!1203566 m!1108263))

(declare-fun m!1109017 () Bool)

(assert (=> b!1203566 m!1109017))

(assert (=> b!1203566 m!1109011))

(declare-fun m!1109019 () Bool)

(assert (=> b!1203566 m!1109019))

(assert (=> b!1203566 m!1109017))

(assert (=> b!1203566 m!1108263))

(declare-fun m!1109021 () Bool)

(assert (=> b!1203566 m!1109021))

(assert (=> bm!58036 m!1109015))

(declare-fun m!1109023 () Bool)

(assert (=> b!1203567 m!1109023))

(assert (=> b!1203557 m!1109011))

(assert (=> b!1203557 m!1109011))

(declare-fun m!1109025 () Bool)

(assert (=> b!1203557 m!1109025))

(declare-fun m!1109027 () Bool)

(assert (=> d!132495 m!1109027))

(assert (=> d!132495 m!1108231))

(declare-fun m!1109029 () Bool)

(assert (=> b!1203558 m!1109029))

(assert (=> b!1203558 m!1109011))

(assert (=> b!1203558 m!1108263))

(declare-fun m!1109031 () Bool)

(assert (=> b!1203558 m!1109031))

(assert (=> b!1203558 m!1109017))

(declare-fun m!1109033 () Bool)

(assert (=> b!1203558 m!1109033))

(assert (=> b!1203558 m!1109017))

(assert (=> b!1203558 m!1108263))

(assert (=> b!1203558 m!1109021))

(assert (=> b!1203558 m!1109029))

(declare-fun m!1109035 () Bool)

(assert (=> b!1203558 m!1109035))

(assert (=> b!1203562 m!1109011))

(assert (=> b!1203562 m!1109011))

(assert (=> b!1203562 m!1109025))

(declare-fun m!1109037 () Bool)

(assert (=> b!1203561 m!1109037))

(assert (=> bm!57996 d!132495))

(declare-fun d!132497 () Bool)

(declare-fun e!683441 () Bool)

(assert (=> d!132497 e!683441))

(declare-fun res!800885 () Bool)

(assert (=> d!132497 (=> res!800885 e!683441)))

(declare-fun lt!545527 () Bool)

(assert (=> d!132497 (= res!800885 (not lt!545527))))

(declare-fun lt!545528 () Bool)

(assert (=> d!132497 (= lt!545527 lt!545528)))

(declare-fun lt!545525 () Unit!39733)

(declare-fun e!683442 () Unit!39733)

(assert (=> d!132497 (= lt!545525 e!683442)))

(declare-fun c!117885 () Bool)

(assert (=> d!132497 (= c!117885 lt!545528)))

(assert (=> d!132497 (= lt!545528 (containsKey!587 (toList!8879 lt!545327) k0!934))))

(assert (=> d!132497 (= (contains!6873 lt!545327 k0!934) lt!545527)))

(declare-fun b!1203569 () Bool)

(declare-fun lt!545526 () Unit!39733)

(assert (=> b!1203569 (= e!683442 lt!545526)))

(assert (=> b!1203569 (= lt!545526 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545327) k0!934))))

(assert (=> b!1203569 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545327) k0!934))))

(declare-fun b!1203570 () Bool)

(declare-fun Unit!39758 () Unit!39733)

(assert (=> b!1203570 (= e!683442 Unit!39758)))

(declare-fun b!1203571 () Bool)

(assert (=> b!1203571 (= e!683441 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545327) k0!934)))))

(assert (= (and d!132497 c!117885) b!1203569))

(assert (= (and d!132497 (not c!117885)) b!1203570))

(assert (= (and d!132497 (not res!800885)) b!1203571))

(declare-fun m!1109039 () Bool)

(assert (=> d!132497 m!1109039))

(declare-fun m!1109041 () Bool)

(assert (=> b!1203569 m!1109041))

(declare-fun m!1109043 () Bool)

(assert (=> b!1203569 m!1109043))

(assert (=> b!1203569 m!1109043))

(declare-fun m!1109045 () Bool)

(assert (=> b!1203569 m!1109045))

(assert (=> b!1203571 m!1109043))

(assert (=> b!1203571 m!1109043))

(assert (=> b!1203571 m!1109045))

(assert (=> d!132341 d!132497))

(declare-fun b!1203582 () Bool)

(declare-fun e!683449 () List!26545)

(assert (=> b!1203582 (= e!683449 ($colon$colon!611 (removeStrictlySorted!93 (t!39413 (toList!8879 call!57941)) k0!934) (h!27750 (toList!8879 call!57941))))))

(declare-fun b!1203583 () Bool)

(declare-fun e!683450 () List!26545)

(assert (=> b!1203583 (= e!683450 (t!39413 (toList!8879 call!57941)))))

(declare-fun b!1203584 () Bool)

(assert (=> b!1203584 (= e!683449 Nil!26542)))

(declare-fun b!1203585 () Bool)

(declare-fun e!683451 () Bool)

(declare-fun lt!545531 () List!26545)

(assert (=> b!1203585 (= e!683451 (not (containsKey!587 lt!545531 k0!934)))))

(declare-fun b!1203586 () Bool)

(assert (=> b!1203586 (= e!683450 e!683449)))

(declare-fun c!117890 () Bool)

(assert (=> b!1203586 (= c!117890 (and ((_ is Cons!26541) (toList!8879 call!57941)) (not (= (_1!9890 (h!27750 (toList!8879 call!57941))) k0!934))))))

(declare-fun d!132499 () Bool)

(assert (=> d!132499 e!683451))

(declare-fun res!800888 () Bool)

(assert (=> d!132499 (=> (not res!800888) (not e!683451))))

(assert (=> d!132499 (= res!800888 (isStrictlySorted!724 lt!545531))))

(assert (=> d!132499 (= lt!545531 e!683450)))

(declare-fun c!117891 () Bool)

(assert (=> d!132499 (= c!117891 (and ((_ is Cons!26541) (toList!8879 call!57941)) (= (_1!9890 (h!27750 (toList!8879 call!57941))) k0!934)))))

(assert (=> d!132499 (isStrictlySorted!724 (toList!8879 call!57941))))

(assert (=> d!132499 (= (removeStrictlySorted!93 (toList!8879 call!57941) k0!934) lt!545531)))

(assert (= (and d!132499 c!117891) b!1203583))

(assert (= (and d!132499 (not c!117891)) b!1203586))

(assert (= (and b!1203586 c!117890) b!1203582))

(assert (= (and b!1203586 (not c!117890)) b!1203584))

(assert (= (and d!132499 res!800888) b!1203585))

(declare-fun m!1109047 () Bool)

(assert (=> b!1203582 m!1109047))

(assert (=> b!1203582 m!1109047))

(declare-fun m!1109049 () Bool)

(assert (=> b!1203582 m!1109049))

(declare-fun m!1109051 () Bool)

(assert (=> b!1203585 m!1109051))

(declare-fun m!1109053 () Bool)

(assert (=> d!132499 m!1109053))

(declare-fun m!1109055 () Bool)

(assert (=> d!132499 m!1109055))

(assert (=> d!132341 d!132499))

(declare-fun d!132501 () Bool)

(assert (=> d!132501 (= (isEmpty!985 lt!545347) (isEmpty!986 (toList!8879 lt!545347)))))

(declare-fun bs!34041 () Bool)

(assert (= bs!34041 d!132501))

(declare-fun m!1109057 () Bool)

(assert (=> bs!34041 m!1109057))

(assert (=> b!1203300 d!132501))

(assert (=> b!1203225 d!132435))

(declare-fun d!132503 () Bool)

(declare-fun lt!545534 () Bool)

(declare-fun content!541 (List!26546) (InoxSet (_ BitVec 64)))

(assert (=> d!132503 (= lt!545534 (select (content!541 Nil!26543) (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!683456 () Bool)

(assert (=> d!132503 (= lt!545534 e!683456)))

(declare-fun res!800893 () Bool)

(assert (=> d!132503 (=> (not res!800893) (not e!683456))))

(assert (=> d!132503 (= res!800893 ((_ is Cons!26542) Nil!26543))))

(assert (=> d!132503 (= (contains!6877 Nil!26543 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)) lt!545534)))

(declare-fun b!1203591 () Bool)

(declare-fun e!683457 () Bool)

(assert (=> b!1203591 (= e!683456 e!683457)))

(declare-fun res!800894 () Bool)

(assert (=> b!1203591 (=> res!800894 e!683457)))

(assert (=> b!1203591 (= res!800894 (= (h!27751 Nil!26543) (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203592 () Bool)

(assert (=> b!1203592 (= e!683457 (contains!6877 (t!39414 Nil!26543) (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132503 res!800893) b!1203591))

(assert (= (and b!1203591 (not res!800894)) b!1203592))

(declare-fun m!1109059 () Bool)

(assert (=> d!132503 m!1109059))

(assert (=> d!132503 m!1108459))

(declare-fun m!1109061 () Bool)

(assert (=> d!132503 m!1109061))

(assert (=> b!1203592 m!1108459))

(declare-fun m!1109063 () Bool)

(assert (=> b!1203592 m!1109063))

(assert (=> b!1203263 d!132503))

(assert (=> b!1203232 d!132395))

(declare-fun d!132505 () Bool)

(declare-fun e!683458 () Bool)

(assert (=> d!132505 e!683458))

(declare-fun res!800895 () Bool)

(assert (=> d!132505 (=> res!800895 e!683458)))

(declare-fun lt!545537 () Bool)

(assert (=> d!132505 (= res!800895 (not lt!545537))))

(declare-fun lt!545538 () Bool)

(assert (=> d!132505 (= lt!545537 lt!545538)))

(declare-fun lt!545535 () Unit!39733)

(declare-fun e!683459 () Unit!39733)

(assert (=> d!132505 (= lt!545535 e!683459)))

(declare-fun c!117892 () Bool)

(assert (=> d!132505 (= c!117892 lt!545538)))

(assert (=> d!132505 (= lt!545538 (containsKey!587 (toList!8879 lt!545369) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132505 (= (contains!6873 lt!545369 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545537)))

(declare-fun b!1203593 () Bool)

(declare-fun lt!545536 () Unit!39733)

(assert (=> b!1203593 (= e!683459 lt!545536)))

(assert (=> b!1203593 (= lt!545536 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545369) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> b!1203593 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545369) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203594 () Bool)

(declare-fun Unit!39759 () Unit!39733)

(assert (=> b!1203594 (= e!683459 Unit!39759)))

(declare-fun b!1203595 () Bool)

(assert (=> b!1203595 (= e!683458 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545369) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132505 c!117892) b!1203593))

(assert (= (and d!132505 (not c!117892)) b!1203594))

(assert (= (and d!132505 (not res!800895)) b!1203595))

(declare-fun m!1109065 () Bool)

(assert (=> d!132505 m!1109065))

(declare-fun m!1109067 () Bool)

(assert (=> b!1203593 m!1109067))

(assert (=> b!1203593 m!1108547))

(assert (=> b!1203593 m!1108547))

(declare-fun m!1109069 () Bool)

(assert (=> b!1203593 m!1109069))

(assert (=> b!1203595 m!1108547))

(assert (=> b!1203595 m!1108547))

(assert (=> b!1203595 m!1109069))

(assert (=> d!132363 d!132505))

(declare-fun b!1203599 () Bool)

(declare-fun e!683461 () Option!684)

(assert (=> b!1203599 (= e!683461 None!682)))

(declare-fun b!1203596 () Bool)

(declare-fun e!683460 () Option!684)

(assert (=> b!1203596 (= e!683460 (Some!683 (_2!9890 (h!27750 lt!545371))))))

(declare-fun b!1203598 () Bool)

(assert (=> b!1203598 (= e!683461 (getValueByKey!633 (t!39413 lt!545371) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun d!132507 () Bool)

(declare-fun c!117893 () Bool)

(assert (=> d!132507 (= c!117893 (and ((_ is Cons!26541) lt!545371) (= (_1!9890 (h!27750 lt!545371)) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132507 (= (getValueByKey!633 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!683460)))

(declare-fun b!1203597 () Bool)

(assert (=> b!1203597 (= e!683460 e!683461)))

(declare-fun c!117894 () Bool)

(assert (=> b!1203597 (= c!117894 (and ((_ is Cons!26541) lt!545371) (not (= (_1!9890 (h!27750 lt!545371)) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!132507 c!117893) b!1203596))

(assert (= (and d!132507 (not c!117893)) b!1203597))

(assert (= (and b!1203597 c!117894) b!1203598))

(assert (= (and b!1203597 (not c!117894)) b!1203599))

(declare-fun m!1109071 () Bool)

(assert (=> b!1203598 m!1109071))

(assert (=> d!132363 d!132507))

(declare-fun d!132509 () Bool)

(assert (=> d!132509 (= (getValueByKey!633 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!683 (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!545539 () Unit!39733)

(assert (=> d!132509 (= lt!545539 (choose!1796 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!683462 () Bool)

(assert (=> d!132509 e!683462))

(declare-fun res!800896 () Bool)

(assert (=> d!132509 (=> (not res!800896) (not e!683462))))

(assert (=> d!132509 (= res!800896 (isStrictlySorted!724 lt!545371))))

(assert (=> d!132509 (= (lemmaContainsTupThenGetReturnValue!309 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545539)))

(declare-fun b!1203600 () Bool)

(declare-fun res!800897 () Bool)

(assert (=> b!1203600 (=> (not res!800897) (not e!683462))))

(assert (=> b!1203600 (= res!800897 (containsKey!587 lt!545371 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203601 () Bool)

(assert (=> b!1203601 (= e!683462 (contains!6876 lt!545371 (tuple2!19759 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132509 res!800896) b!1203600))

(assert (= (and b!1203600 res!800897) b!1203601))

(assert (=> d!132509 m!1108541))

(declare-fun m!1109073 () Bool)

(assert (=> d!132509 m!1109073))

(declare-fun m!1109075 () Bool)

(assert (=> d!132509 m!1109075))

(declare-fun m!1109077 () Bool)

(assert (=> b!1203600 m!1109077))

(declare-fun m!1109079 () Bool)

(assert (=> b!1203601 m!1109079))

(assert (=> d!132363 d!132509))

(declare-fun b!1203602 () Bool)

(declare-fun e!683463 () List!26545)

(declare-fun call!58040 () List!26545)

(assert (=> b!1203602 (= e!683463 call!58040)))

(declare-fun b!1203603 () Bool)

(declare-fun e!683464 () Bool)

(declare-fun lt!545540 () List!26545)

(assert (=> b!1203603 (= e!683464 (contains!6876 lt!545540 (tuple2!19759 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun d!132511 () Bool)

(assert (=> d!132511 e!683464))

(declare-fun res!800899 () Bool)

(assert (=> d!132511 (=> (not res!800899) (not e!683464))))

(assert (=> d!132511 (= res!800899 (isStrictlySorted!724 lt!545540))))

(assert (=> d!132511 (= lt!545540 e!683463)))

(declare-fun c!117895 () Bool)

(assert (=> d!132511 (= c!117895 (and ((_ is Cons!26541) (toList!8879 lt!545190)) (bvslt (_1!9890 (h!27750 (toList!8879 lt!545190))) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132511 (isStrictlySorted!724 (toList!8879 lt!545190))))

(assert (=> d!132511 (= (insertStrictlySorted!402 (toList!8879 lt!545190) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545540)))

(declare-fun b!1203604 () Bool)

(declare-fun e!683465 () List!26545)

(declare-fun call!58042 () List!26545)

(assert (=> b!1203604 (= e!683465 call!58042)))

(declare-fun b!1203605 () Bool)

(declare-fun c!117898 () Bool)

(assert (=> b!1203605 (= c!117898 (and ((_ is Cons!26541) (toList!8879 lt!545190)) (bvsgt (_1!9890 (h!27750 (toList!8879 lt!545190))) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!683466 () List!26545)

(assert (=> b!1203605 (= e!683466 e!683465)))

(declare-fun b!1203606 () Bool)

(assert (=> b!1203606 (= e!683465 call!58042)))

(declare-fun bm!58037 () Bool)

(declare-fun e!683467 () List!26545)

(assert (=> bm!58037 (= call!58040 ($colon$colon!611 e!683467 (ite c!117895 (h!27750 (toList!8879 lt!545190)) (tuple2!19759 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!117897 () Bool)

(assert (=> bm!58037 (= c!117897 c!117895)))

(declare-fun b!1203607 () Bool)

(declare-fun c!117896 () Bool)

(assert (=> b!1203607 (= e!683467 (ite c!117896 (t!39413 (toList!8879 lt!545190)) (ite c!117898 (Cons!26541 (h!27750 (toList!8879 lt!545190)) (t!39413 (toList!8879 lt!545190))) Nil!26542)))))

(declare-fun bm!58038 () Bool)

(declare-fun call!58041 () List!26545)

(assert (=> bm!58038 (= call!58042 call!58041)))

(declare-fun b!1203608 () Bool)

(assert (=> b!1203608 (= e!683463 e!683466)))

(assert (=> b!1203608 (= c!117896 (and ((_ is Cons!26541) (toList!8879 lt!545190)) (= (_1!9890 (h!27750 (toList!8879 lt!545190))) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203609 () Bool)

(declare-fun res!800898 () Bool)

(assert (=> b!1203609 (=> (not res!800898) (not e!683464))))

(assert (=> b!1203609 (= res!800898 (containsKey!587 lt!545540 (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!58039 () Bool)

(assert (=> bm!58039 (= call!58041 call!58040)))

(declare-fun b!1203610 () Bool)

(assert (=> b!1203610 (= e!683466 call!58041)))

(declare-fun b!1203611 () Bool)

(assert (=> b!1203611 (= e!683467 (insertStrictlySorted!402 (t!39413 (toList!8879 lt!545190)) (_1!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9890 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132511 c!117895) b!1203602))

(assert (= (and d!132511 (not c!117895)) b!1203608))

(assert (= (and b!1203608 c!117896) b!1203610))

(assert (= (and b!1203608 (not c!117896)) b!1203605))

(assert (= (and b!1203605 c!117898) b!1203606))

(assert (= (and b!1203605 (not c!117898)) b!1203604))

(assert (= (or b!1203606 b!1203604) bm!58038))

(assert (= (or b!1203610 bm!58038) bm!58039))

(assert (= (or b!1203602 bm!58039) bm!58037))

(assert (= (and bm!58037 c!117897) b!1203611))

(assert (= (and bm!58037 (not c!117897)) b!1203607))

(assert (= (and d!132511 res!800899) b!1203609))

(assert (= (and b!1203609 res!800898) b!1203603))

(declare-fun m!1109081 () Bool)

(assert (=> bm!58037 m!1109081))

(declare-fun m!1109083 () Bool)

(assert (=> d!132511 m!1109083))

(declare-fun m!1109085 () Bool)

(assert (=> d!132511 m!1109085))

(declare-fun m!1109087 () Bool)

(assert (=> b!1203609 m!1109087))

(declare-fun m!1109089 () Bool)

(assert (=> b!1203611 m!1109089))

(declare-fun m!1109091 () Bool)

(assert (=> b!1203603 m!1109091))

(assert (=> d!132363 d!132511))

(assert (=> b!1203228 d!132495))

(declare-fun d!132513 () Bool)

(declare-fun e!683468 () Bool)

(assert (=> d!132513 e!683468))

(declare-fun res!800900 () Bool)

(assert (=> d!132513 (=> res!800900 e!683468)))

(declare-fun lt!545543 () Bool)

(assert (=> d!132513 (= res!800900 (not lt!545543))))

(declare-fun lt!545544 () Bool)

(assert (=> d!132513 (= lt!545543 lt!545544)))

(declare-fun lt!545541 () Unit!39733)

(declare-fun e!683469 () Unit!39733)

(assert (=> d!132513 (= lt!545541 e!683469)))

(declare-fun c!117899 () Bool)

(assert (=> d!132513 (= c!117899 lt!545544)))

(assert (=> d!132513 (= lt!545544 (containsKey!587 (toList!8879 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> d!132513 (= (contains!6873 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934) lt!545543)))

(declare-fun b!1203612 () Bool)

(declare-fun lt!545542 () Unit!39733)

(assert (=> b!1203612 (= e!683469 lt!545542)))

(assert (=> b!1203612 (= lt!545542 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> b!1203612 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(declare-fun b!1203613 () Bool)

(declare-fun Unit!39760 () Unit!39733)

(assert (=> b!1203613 (= e!683469 Unit!39760)))

(declare-fun b!1203614 () Bool)

(assert (=> b!1203614 (= e!683468 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934)))))

(assert (= (and d!132513 c!117899) b!1203612))

(assert (= (and d!132513 (not c!117899)) b!1203613))

(assert (= (and d!132513 (not res!800900)) b!1203614))

(declare-fun m!1109093 () Bool)

(assert (=> d!132513 m!1109093))

(declare-fun m!1109095 () Bool)

(assert (=> b!1203612 m!1109095))

(declare-fun m!1109097 () Bool)

(assert (=> b!1203612 m!1109097))

(assert (=> b!1203612 m!1109097))

(declare-fun m!1109099 () Bool)

(assert (=> b!1203612 m!1109099))

(assert (=> b!1203614 m!1109097))

(assert (=> b!1203614 m!1109097))

(assert (=> b!1203614 m!1109099))

(assert (=> d!132359 d!132513))

(declare-fun d!132515 () Bool)

(declare-fun e!683470 () Bool)

(assert (=> d!132515 e!683470))

(declare-fun res!800901 () Bool)

(assert (=> d!132515 (=> (not res!800901) (not e!683470))))

(declare-fun lt!545546 () ListLongMap!17727)

(assert (=> d!132515 (= res!800901 (contains!6873 lt!545546 (_1!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!545548 () List!26545)

(assert (=> d!132515 (= lt!545546 (ListLongMap!17728 lt!545548))))

(declare-fun lt!545545 () Unit!39733)

(declare-fun lt!545547 () Unit!39733)

(assert (=> d!132515 (= lt!545545 lt!545547)))

(assert (=> d!132515 (= (getValueByKey!633 lt!545548 (_1!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!683 (_2!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132515 (= lt!545547 (lemmaContainsTupThenGetReturnValue!309 lt!545548 (_1!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132515 (= lt!545548 (insertStrictlySorted!402 (toList!8879 lt!545196) (_1!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132515 (= (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!545546)))

(declare-fun b!1203615 () Bool)

(declare-fun res!800902 () Bool)

(assert (=> b!1203615 (=> (not res!800902) (not e!683470))))

(assert (=> b!1203615 (= res!800902 (= (getValueByKey!633 (toList!8879 lt!545546) (_1!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!683 (_2!9890 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1203616 () Bool)

(assert (=> b!1203616 (= e!683470 (contains!6876 (toList!8879 lt!545546) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132515 res!800901) b!1203615))

(assert (= (and b!1203615 res!800902) b!1203616))

(declare-fun m!1109101 () Bool)

(assert (=> d!132515 m!1109101))

(declare-fun m!1109103 () Bool)

(assert (=> d!132515 m!1109103))

(declare-fun m!1109105 () Bool)

(assert (=> d!132515 m!1109105))

(declare-fun m!1109107 () Bool)

(assert (=> d!132515 m!1109107))

(declare-fun m!1109109 () Bool)

(assert (=> b!1203615 m!1109109))

(declare-fun m!1109111 () Bool)

(assert (=> b!1203616 m!1109111))

(assert (=> d!132359 d!132515))

(declare-fun d!132517 () Bool)

(assert (=> d!132517 (contains!6873 (+!4013 lt!545196 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(assert (=> d!132517 true))

(declare-fun _$35!456 () Unit!39733)

(assert (=> d!132517 (= (choose!1794 lt!545196 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) _$35!456)))

(declare-fun bs!34042 () Bool)

(assert (= bs!34042 d!132517))

(assert (=> bs!34042 m!1108525))

(assert (=> bs!34042 m!1108525))

(assert (=> bs!34042 m!1108527))

(assert (=> d!132359 d!132517))

(assert (=> d!132359 d!132371))

(declare-fun d!132519 () Bool)

(assert (=> d!132519 (= (isEmpty!985 lt!545374) (isEmpty!986 (toList!8879 lt!545374)))))

(declare-fun bs!34043 () Bool)

(assert (= bs!34043 d!132519))

(declare-fun m!1109113 () Bool)

(assert (=> bs!34043 m!1109113))

(assert (=> b!1203329 d!132519))

(declare-fun d!132521 () Bool)

(declare-fun e!683471 () Bool)

(assert (=> d!132521 e!683471))

(declare-fun res!800903 () Bool)

(assert (=> d!132521 (=> res!800903 e!683471)))

(declare-fun lt!545551 () Bool)

(assert (=> d!132521 (= res!800903 (not lt!545551))))

(declare-fun lt!545552 () Bool)

(assert (=> d!132521 (= lt!545551 lt!545552)))

(declare-fun lt!545549 () Unit!39733)

(declare-fun e!683472 () Unit!39733)

(assert (=> d!132521 (= lt!545549 e!683472)))

(declare-fun c!117900 () Bool)

(assert (=> d!132521 (= c!117900 lt!545552)))

(assert (=> d!132521 (= lt!545552 (containsKey!587 (toList!8879 lt!545347) (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132521 (= (contains!6873 lt!545347 (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!545551)))

(declare-fun b!1203617 () Bool)

(declare-fun lt!545550 () Unit!39733)

(assert (=> b!1203617 (= e!683472 lt!545550)))

(assert (=> b!1203617 (= lt!545550 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545347) (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203617 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545347) (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203618 () Bool)

(declare-fun Unit!39761 () Unit!39733)

(assert (=> b!1203618 (= e!683472 Unit!39761)))

(declare-fun b!1203619 () Bool)

(assert (=> b!1203619 (= e!683471 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545347) (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132521 c!117900) b!1203617))

(assert (= (and d!132521 (not c!117900)) b!1203618))

(assert (= (and d!132521 (not res!800903)) b!1203619))

(assert (=> d!132521 m!1108497))

(declare-fun m!1109115 () Bool)

(assert (=> d!132521 m!1109115))

(assert (=> b!1203617 m!1108497))

(declare-fun m!1109117 () Bool)

(assert (=> b!1203617 m!1109117))

(assert (=> b!1203617 m!1108497))

(assert (=> b!1203617 m!1108923))

(assert (=> b!1203617 m!1108923))

(declare-fun m!1109119 () Bool)

(assert (=> b!1203617 m!1109119))

(assert (=> b!1203619 m!1108497))

(assert (=> b!1203619 m!1108923))

(assert (=> b!1203619 m!1108923))

(assert (=> b!1203619 m!1109119))

(assert (=> b!1203302 d!132521))

(assert (=> b!1203296 d!132403))

(declare-fun d!132523 () Bool)

(declare-fun isEmpty!987 (Option!684) Bool)

(assert (=> d!132523 (= (isDefined!459 (getValueByKey!633 (toList!8879 lt!545196) k0!934)) (not (isEmpty!987 (getValueByKey!633 (toList!8879 lt!545196) k0!934))))))

(declare-fun bs!34044 () Bool)

(assert (= bs!34044 d!132523))

(assert (=> bs!34044 m!1108595))

(declare-fun m!1109121 () Bool)

(assert (=> bs!34044 m!1109121))

(assert (=> b!1203339 d!132523))

(declare-fun b!1203623 () Bool)

(declare-fun e!683474 () Option!684)

(assert (=> b!1203623 (= e!683474 None!682)))

(declare-fun b!1203620 () Bool)

(declare-fun e!683473 () Option!684)

(assert (=> b!1203620 (= e!683473 (Some!683 (_2!9890 (h!27750 (toList!8879 lt!545196)))))))

(declare-fun b!1203622 () Bool)

(assert (=> b!1203622 (= e!683474 (getValueByKey!633 (t!39413 (toList!8879 lt!545196)) k0!934))))

(declare-fun d!132525 () Bool)

(declare-fun c!117901 () Bool)

(assert (=> d!132525 (= c!117901 (and ((_ is Cons!26541) (toList!8879 lt!545196)) (= (_1!9890 (h!27750 (toList!8879 lt!545196))) k0!934)))))

(assert (=> d!132525 (= (getValueByKey!633 (toList!8879 lt!545196) k0!934) e!683473)))

(declare-fun b!1203621 () Bool)

(assert (=> b!1203621 (= e!683473 e!683474)))

(declare-fun c!117902 () Bool)

(assert (=> b!1203621 (= c!117902 (and ((_ is Cons!26541) (toList!8879 lt!545196)) (not (= (_1!9890 (h!27750 (toList!8879 lt!545196))) k0!934))))))

(assert (= (and d!132525 c!117901) b!1203620))

(assert (= (and d!132525 (not c!117901)) b!1203621))

(assert (= (and b!1203621 c!117902) b!1203622))

(assert (= (and b!1203621 (not c!117902)) b!1203623))

(declare-fun m!1109123 () Bool)

(assert (=> b!1203622 m!1109123))

(assert (=> b!1203339 d!132525))

(declare-fun d!132527 () Bool)

(declare-fun e!683475 () Bool)

(assert (=> d!132527 e!683475))

(declare-fun res!800904 () Bool)

(assert (=> d!132527 (=> (not res!800904) (not e!683475))))

(declare-fun lt!545554 () ListLongMap!17727)

(assert (=> d!132527 (= res!800904 (contains!6873 lt!545554 (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545556 () List!26545)

(assert (=> d!132527 (= lt!545554 (ListLongMap!17728 lt!545556))))

(declare-fun lt!545553 () Unit!39733)

(declare-fun lt!545555 () Unit!39733)

(assert (=> d!132527 (= lt!545553 lt!545555)))

(assert (=> d!132527 (= (getValueByKey!633 lt!545556 (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132527 (= lt!545555 (lemmaContainsTupThenGetReturnValue!309 lt!545556 (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132527 (= lt!545556 (insertStrictlySorted!402 (toList!8879 call!57999) (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132527 (= (+!4013 call!57999 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545554)))

(declare-fun b!1203624 () Bool)

(declare-fun res!800905 () Bool)

(assert (=> b!1203624 (=> (not res!800905) (not e!683475))))

(assert (=> b!1203624 (= res!800905 (= (getValueByKey!633 (toList!8879 lt!545554) (_1!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!683 (_2!9890 (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203625 () Bool)

(assert (=> b!1203625 (= e!683475 (contains!6876 (toList!8879 lt!545554) (tuple2!19759 (select (arr!37590 lt!545191) from!1455) (get!19177 (select (arr!37591 lt!545194) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132527 res!800904) b!1203624))

(assert (= (and b!1203624 res!800905) b!1203625))

(declare-fun m!1109125 () Bool)

(assert (=> d!132527 m!1109125))

(declare-fun m!1109127 () Bool)

(assert (=> d!132527 m!1109127))

(declare-fun m!1109129 () Bool)

(assert (=> d!132527 m!1109129))

(declare-fun m!1109131 () Bool)

(assert (=> d!132527 m!1109131))

(declare-fun m!1109133 () Bool)

(assert (=> b!1203624 m!1109133))

(declare-fun m!1109135 () Bool)

(assert (=> b!1203625 m!1109135))

(assert (=> b!1203221 d!132527))

(declare-fun d!132529 () Bool)

(assert (=> d!132529 (not (contains!6873 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304)) lt!545301))))

(declare-fun lt!545557 () Unit!39733)

(assert (=> d!132529 (= lt!545557 (choose!1795 lt!545299 lt!545303 lt!545304 lt!545301))))

(declare-fun e!683476 () Bool)

(assert (=> d!132529 e!683476))

(declare-fun res!800906 () Bool)

(assert (=> d!132529 (=> (not res!800906) (not e!683476))))

(assert (=> d!132529 (= res!800906 (not (contains!6873 lt!545299 lt!545301)))))

(assert (=> d!132529 (= (addStillNotContains!289 lt!545299 lt!545303 lt!545304 lt!545301) lt!545557)))

(declare-fun b!1203626 () Bool)

(assert (=> b!1203626 (= e!683476 (not (= lt!545303 lt!545301)))))

(assert (= (and d!132529 res!800906) b!1203626))

(assert (=> d!132529 m!1108407))

(assert (=> d!132529 m!1108407))

(assert (=> d!132529 m!1108413))

(declare-fun m!1109137 () Bool)

(assert (=> d!132529 m!1109137))

(declare-fun m!1109139 () Bool)

(assert (=> d!132529 m!1109139))

(assert (=> b!1203221 d!132529))

(assert (=> b!1203221 d!132427))

(declare-fun d!132531 () Bool)

(declare-fun e!683477 () Bool)

(assert (=> d!132531 e!683477))

(declare-fun res!800907 () Bool)

(assert (=> d!132531 (=> (not res!800907) (not e!683477))))

(declare-fun lt!545559 () ListLongMap!17727)

(assert (=> d!132531 (= res!800907 (contains!6873 lt!545559 (_1!9890 (tuple2!19759 lt!545303 lt!545304))))))

(declare-fun lt!545561 () List!26545)

(assert (=> d!132531 (= lt!545559 (ListLongMap!17728 lt!545561))))

(declare-fun lt!545558 () Unit!39733)

(declare-fun lt!545560 () Unit!39733)

(assert (=> d!132531 (= lt!545558 lt!545560)))

(assert (=> d!132531 (= (getValueByKey!633 lt!545561 (_1!9890 (tuple2!19759 lt!545303 lt!545304))) (Some!683 (_2!9890 (tuple2!19759 lt!545303 lt!545304))))))

(assert (=> d!132531 (= lt!545560 (lemmaContainsTupThenGetReturnValue!309 lt!545561 (_1!9890 (tuple2!19759 lt!545303 lt!545304)) (_2!9890 (tuple2!19759 lt!545303 lt!545304))))))

(assert (=> d!132531 (= lt!545561 (insertStrictlySorted!402 (toList!8879 lt!545299) (_1!9890 (tuple2!19759 lt!545303 lt!545304)) (_2!9890 (tuple2!19759 lt!545303 lt!545304))))))

(assert (=> d!132531 (= (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304)) lt!545559)))

(declare-fun b!1203627 () Bool)

(declare-fun res!800908 () Bool)

(assert (=> b!1203627 (=> (not res!800908) (not e!683477))))

(assert (=> b!1203627 (= res!800908 (= (getValueByKey!633 (toList!8879 lt!545559) (_1!9890 (tuple2!19759 lt!545303 lt!545304))) (Some!683 (_2!9890 (tuple2!19759 lt!545303 lt!545304)))))))

(declare-fun b!1203628 () Bool)

(assert (=> b!1203628 (= e!683477 (contains!6876 (toList!8879 lt!545559) (tuple2!19759 lt!545303 lt!545304)))))

(assert (= (and d!132531 res!800907) b!1203627))

(assert (= (and b!1203627 res!800908) b!1203628))

(declare-fun m!1109141 () Bool)

(assert (=> d!132531 m!1109141))

(declare-fun m!1109143 () Bool)

(assert (=> d!132531 m!1109143))

(declare-fun m!1109145 () Bool)

(assert (=> d!132531 m!1109145))

(declare-fun m!1109147 () Bool)

(assert (=> d!132531 m!1109147))

(declare-fun m!1109149 () Bool)

(assert (=> b!1203627 m!1109149))

(declare-fun m!1109151 () Bool)

(assert (=> b!1203628 m!1109151))

(assert (=> b!1203221 d!132531))

(declare-fun d!132533 () Bool)

(declare-fun e!683478 () Bool)

(assert (=> d!132533 e!683478))

(declare-fun res!800909 () Bool)

(assert (=> d!132533 (=> res!800909 e!683478)))

(declare-fun lt!545564 () Bool)

(assert (=> d!132533 (= res!800909 (not lt!545564))))

(declare-fun lt!545565 () Bool)

(assert (=> d!132533 (= lt!545564 lt!545565)))

(declare-fun lt!545562 () Unit!39733)

(declare-fun e!683479 () Unit!39733)

(assert (=> d!132533 (= lt!545562 e!683479)))

(declare-fun c!117903 () Bool)

(assert (=> d!132533 (= c!117903 lt!545565)))

(assert (=> d!132533 (= lt!545565 (containsKey!587 (toList!8879 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304))) lt!545301))))

(assert (=> d!132533 (= (contains!6873 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304)) lt!545301) lt!545564)))

(declare-fun b!1203629 () Bool)

(declare-fun lt!545563 () Unit!39733)

(assert (=> b!1203629 (= e!683479 lt!545563)))

(assert (=> b!1203629 (= lt!545563 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304))) lt!545301))))

(assert (=> b!1203629 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304))) lt!545301))))

(declare-fun b!1203630 () Bool)

(declare-fun Unit!39762 () Unit!39733)

(assert (=> b!1203630 (= e!683479 Unit!39762)))

(declare-fun b!1203631 () Bool)

(assert (=> b!1203631 (= e!683478 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545299 (tuple2!19759 lt!545303 lt!545304))) lt!545301)))))

(assert (= (and d!132533 c!117903) b!1203629))

(assert (= (and d!132533 (not c!117903)) b!1203630))

(assert (= (and d!132533 (not res!800909)) b!1203631))

(declare-fun m!1109153 () Bool)

(assert (=> d!132533 m!1109153))

(declare-fun m!1109155 () Bool)

(assert (=> b!1203629 m!1109155))

(declare-fun m!1109157 () Bool)

(assert (=> b!1203629 m!1109157))

(assert (=> b!1203629 m!1109157))

(declare-fun m!1109159 () Bool)

(assert (=> b!1203629 m!1109159))

(assert (=> b!1203631 m!1109157))

(assert (=> b!1203631 m!1109157))

(assert (=> b!1203631 m!1109159))

(assert (=> b!1203221 d!132533))

(assert (=> b!1203260 d!132401))

(declare-fun d!132535 () Bool)

(assert (=> d!132535 (= (isDefined!459 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934)) (not (isEmpty!987 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))))

(declare-fun bs!34045 () Bool)

(assert (= bs!34045 d!132535))

(assert (=> bs!34045 m!1108603))

(declare-fun m!1109161 () Bool)

(assert (=> bs!34045 m!1109161))

(assert (=> b!1203342 d!132535))

(declare-fun b!1203635 () Bool)

(declare-fun e!683481 () Option!684)

(assert (=> b!1203635 (= e!683481 None!682)))

(declare-fun b!1203632 () Bool)

(declare-fun e!683480 () Option!684)

(assert (=> b!1203632 (= e!683480 (Some!683 (_2!9890 (h!27750 (toList!8879 (ite c!117753 lt!545190 call!57945))))))))

(declare-fun b!1203634 () Bool)

(assert (=> b!1203634 (= e!683481 (getValueByKey!633 (t!39413 (toList!8879 (ite c!117753 lt!545190 call!57945))) k0!934))))

(declare-fun d!132537 () Bool)

(declare-fun c!117904 () Bool)

(assert (=> d!132537 (= c!117904 (and ((_ is Cons!26541) (toList!8879 (ite c!117753 lt!545190 call!57945))) (= (_1!9890 (h!27750 (toList!8879 (ite c!117753 lt!545190 call!57945)))) k0!934)))))

(assert (=> d!132537 (= (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934) e!683480)))

(declare-fun b!1203633 () Bool)

(assert (=> b!1203633 (= e!683480 e!683481)))

(declare-fun c!117905 () Bool)

(assert (=> b!1203633 (= c!117905 (and ((_ is Cons!26541) (toList!8879 (ite c!117753 lt!545190 call!57945))) (not (= (_1!9890 (h!27750 (toList!8879 (ite c!117753 lt!545190 call!57945)))) k0!934))))))

(assert (= (and d!132537 c!117904) b!1203632))

(assert (= (and d!132537 (not c!117904)) b!1203633))

(assert (= (and b!1203633 c!117905) b!1203634))

(assert (= (and b!1203633 (not c!117905)) b!1203635))

(declare-fun m!1109163 () Bool)

(assert (=> b!1203634 m!1109163))

(assert (=> b!1203342 d!132537))

(declare-fun d!132539 () Bool)

(assert (=> d!132539 (arrayContainsKey!0 _keys!1208 lt!545340 #b00000000000000000000000000000000)))

(declare-fun lt!545566 () Unit!39733)

(assert (=> d!132539 (= lt!545566 (choose!13 _keys!1208 lt!545340 #b00000000000000000000000000000000))))

(assert (=> d!132539 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!132539 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545340 #b00000000000000000000000000000000) lt!545566)))

(declare-fun bs!34046 () Bool)

(assert (= bs!34046 d!132539))

(assert (=> bs!34046 m!1108479))

(declare-fun m!1109165 () Bool)

(assert (=> bs!34046 m!1109165))

(assert (=> b!1203290 d!132539))

(declare-fun d!132541 () Bool)

(declare-fun res!800910 () Bool)

(declare-fun e!683482 () Bool)

(assert (=> d!132541 (=> res!800910 e!683482)))

(assert (=> d!132541 (= res!800910 (= (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) lt!545340))))

(assert (=> d!132541 (= (arrayContainsKey!0 _keys!1208 lt!545340 #b00000000000000000000000000000000) e!683482)))

(declare-fun b!1203636 () Bool)

(declare-fun e!683483 () Bool)

(assert (=> b!1203636 (= e!683482 e!683483)))

(declare-fun res!800911 () Bool)

(assert (=> b!1203636 (=> (not res!800911) (not e!683483))))

(assert (=> b!1203636 (= res!800911 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun b!1203637 () Bool)

(assert (=> b!1203637 (= e!683483 (arrayContainsKey!0 _keys!1208 lt!545340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132541 (not res!800910)) b!1203636))

(assert (= (and b!1203636 res!800911) b!1203637))

(assert (=> d!132541 m!1108459))

(declare-fun m!1109167 () Bool)

(assert (=> b!1203637 m!1109167))

(assert (=> b!1203290 d!132541))

(declare-fun b!1203650 () Bool)

(declare-fun e!683491 () SeekEntryResult!9932)

(declare-fun lt!545573 () SeekEntryResult!9932)

(assert (=> b!1203650 (= e!683491 (MissingZero!9932 (index!42101 lt!545573)))))

(declare-fun b!1203651 () Bool)

(declare-fun c!117912 () Bool)

(declare-fun lt!545574 () (_ BitVec 64))

(assert (=> b!1203651 (= c!117912 (= lt!545574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!683490 () SeekEntryResult!9932)

(assert (=> b!1203651 (= e!683490 e!683491)))

(declare-fun b!1203652 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!77890 (_ BitVec 32)) SeekEntryResult!9932)

(assert (=> b!1203652 (= e!683491 (seekKeyOrZeroReturnVacant!0 (x!106358 lt!545573) (index!42101 lt!545573) (index!42101 lt!545573) (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(declare-fun b!1203653 () Bool)

(declare-fun e!683492 () SeekEntryResult!9932)

(assert (=> b!1203653 (= e!683492 Undefined!9932)))

(declare-fun d!132543 () Bool)

(declare-fun lt!545575 () SeekEntryResult!9932)

(assert (=> d!132543 (and (or ((_ is Undefined!9932) lt!545575) (not ((_ is Found!9932) lt!545575)) (and (bvsge (index!42100 lt!545575) #b00000000000000000000000000000000) (bvslt (index!42100 lt!545575) (size!38128 _keys!1208)))) (or ((_ is Undefined!9932) lt!545575) ((_ is Found!9932) lt!545575) (not ((_ is MissingZero!9932) lt!545575)) (and (bvsge (index!42099 lt!545575) #b00000000000000000000000000000000) (bvslt (index!42099 lt!545575) (size!38128 _keys!1208)))) (or ((_ is Undefined!9932) lt!545575) ((_ is Found!9932) lt!545575) ((_ is MissingZero!9932) lt!545575) (not ((_ is MissingVacant!9932) lt!545575)) (and (bvsge (index!42102 lt!545575) #b00000000000000000000000000000000) (bvslt (index!42102 lt!545575) (size!38128 _keys!1208)))) (or ((_ is Undefined!9932) lt!545575) (ite ((_ is Found!9932) lt!545575) (= (select (arr!37590 _keys!1208) (index!42100 lt!545575)) (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9932) lt!545575) (= (select (arr!37590 _keys!1208) (index!42099 lt!545575)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9932) lt!545575) (= (select (arr!37590 _keys!1208) (index!42102 lt!545575)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132543 (= lt!545575 e!683492)))

(declare-fun c!117913 () Bool)

(assert (=> d!132543 (= c!117913 (and ((_ is Intermediate!9932) lt!545573) (undefined!10744 lt!545573)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!77890 (_ BitVec 32)) SeekEntryResult!9932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!132543 (= lt!545573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!132543 (validMask!0 mask!1564)))

(assert (=> d!132543 (= (seekEntryOrOpen!0 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!545575)))

(declare-fun b!1203654 () Bool)

(assert (=> b!1203654 (= e!683492 e!683490)))

(assert (=> b!1203654 (= lt!545574 (select (arr!37590 _keys!1208) (index!42101 lt!545573)))))

(declare-fun c!117914 () Bool)

(assert (=> b!1203654 (= c!117914 (= lt!545574 (select (arr!37590 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203655 () Bool)

(assert (=> b!1203655 (= e!683490 (Found!9932 (index!42101 lt!545573)))))

(assert (= (and d!132543 c!117913) b!1203653))

(assert (= (and d!132543 (not c!117913)) b!1203654))

(assert (= (and b!1203654 c!117914) b!1203655))

(assert (= (and b!1203654 (not c!117914)) b!1203651))

(assert (= (and b!1203651 c!117912) b!1203650))

(assert (= (and b!1203651 (not c!117912)) b!1203652))

(assert (=> b!1203652 m!1108459))

(declare-fun m!1109169 () Bool)

(assert (=> b!1203652 m!1109169))

(declare-fun m!1109171 () Bool)

(assert (=> d!132543 m!1109171))

(assert (=> d!132543 m!1108459))

(declare-fun m!1109173 () Bool)

(assert (=> d!132543 m!1109173))

(declare-fun m!1109175 () Bool)

(assert (=> d!132543 m!1109175))

(declare-fun m!1109177 () Bool)

(assert (=> d!132543 m!1109177))

(declare-fun m!1109179 () Bool)

(assert (=> d!132543 m!1109179))

(assert (=> d!132543 m!1108231))

(assert (=> d!132543 m!1108459))

(assert (=> d!132543 m!1109171))

(declare-fun m!1109181 () Bool)

(assert (=> b!1203654 m!1109181))

(assert (=> b!1203290 d!132543))

(declare-fun d!132545 () Bool)

(declare-fun e!683493 () Bool)

(assert (=> d!132545 e!683493))

(declare-fun res!800912 () Bool)

(assert (=> d!132545 (=> res!800912 e!683493)))

(declare-fun lt!545578 () Bool)

(assert (=> d!132545 (= res!800912 (not lt!545578))))

(declare-fun lt!545579 () Bool)

(assert (=> d!132545 (= lt!545578 lt!545579)))

(declare-fun lt!545576 () Unit!39733)

(declare-fun e!683494 () Unit!39733)

(assert (=> d!132545 (= lt!545576 e!683494)))

(declare-fun c!117915 () Bool)

(assert (=> d!132545 (= c!117915 lt!545579)))

(assert (=> d!132545 (= lt!545579 (containsKey!587 (toList!8879 lt!545307) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132545 (= (contains!6873 lt!545307 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545578)))

(declare-fun b!1203656 () Bool)

(declare-fun lt!545577 () Unit!39733)

(assert (=> b!1203656 (= e!683494 lt!545577)))

(assert (=> b!1203656 (= lt!545577 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545307) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203656 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545307) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203657 () Bool)

(declare-fun Unit!39763 () Unit!39733)

(assert (=> b!1203657 (= e!683494 Unit!39763)))

(declare-fun b!1203658 () Bool)

(assert (=> b!1203658 (= e!683493 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132545 c!117915) b!1203656))

(assert (= (and d!132545 (not c!117915)) b!1203657))

(assert (= (and d!132545 (not res!800912)) b!1203658))

(declare-fun m!1109183 () Bool)

(assert (=> d!132545 m!1109183))

(declare-fun m!1109185 () Bool)

(assert (=> b!1203656 m!1109185))

(declare-fun m!1109187 () Bool)

(assert (=> b!1203656 m!1109187))

(assert (=> b!1203656 m!1109187))

(declare-fun m!1109189 () Bool)

(assert (=> b!1203656 m!1109189))

(assert (=> b!1203658 m!1109187))

(assert (=> b!1203658 m!1109187))

(assert (=> b!1203658 m!1109189))

(assert (=> b!1203242 d!132545))

(declare-fun d!132547 () Bool)

(declare-fun res!800913 () Bool)

(declare-fun e!683495 () Bool)

(assert (=> d!132547 (=> res!800913 e!683495)))

(assert (=> d!132547 (= res!800913 (= (select (arr!37590 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!132547 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!683495)))

(declare-fun b!1203659 () Bool)

(declare-fun e!683496 () Bool)

(assert (=> b!1203659 (= e!683495 e!683496)))

(declare-fun res!800914 () Bool)

(assert (=> b!1203659 (=> (not res!800914) (not e!683496))))

(assert (=> b!1203659 (= res!800914 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun b!1203660 () Bool)

(assert (=> b!1203660 (= e!683496 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!132547 (not res!800913)) b!1203659))

(assert (= (and b!1203659 res!800914) b!1203660))

(assert (=> d!132547 m!1108821))

(declare-fun m!1109191 () Bool)

(assert (=> b!1203660 m!1109191))

(assert (=> b!1203279 d!132547))

(declare-fun d!132549 () Bool)

(assert (=> d!132549 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545196) k0!934))))

(declare-fun lt!545582 () Unit!39733)

(declare-fun choose!1797 (List!26545 (_ BitVec 64)) Unit!39733)

(assert (=> d!132549 (= lt!545582 (choose!1797 (toList!8879 lt!545196) k0!934))))

(declare-fun e!683499 () Bool)

(assert (=> d!132549 e!683499))

(declare-fun res!800917 () Bool)

(assert (=> d!132549 (=> (not res!800917) (not e!683499))))

(assert (=> d!132549 (= res!800917 (isStrictlySorted!724 (toList!8879 lt!545196)))))

(assert (=> d!132549 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545196) k0!934) lt!545582)))

(declare-fun b!1203663 () Bool)

(assert (=> b!1203663 (= e!683499 (containsKey!587 (toList!8879 lt!545196) k0!934))))

(assert (= (and d!132549 res!800917) b!1203663))

(assert (=> d!132549 m!1108595))

(assert (=> d!132549 m!1108595))

(assert (=> d!132549 m!1108597))

(declare-fun m!1109193 () Bool)

(assert (=> d!132549 m!1109193))

(assert (=> d!132549 m!1108995))

(assert (=> b!1203663 m!1108591))

(assert (=> b!1203337 d!132549))

(assert (=> b!1203337 d!132523))

(assert (=> b!1203337 d!132525))

(declare-fun d!132551 () Bool)

(assert (=> d!132551 (= (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)) (not (isEmpty!987 (getValueByKey!633 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))))

(declare-fun bs!34047 () Bool)

(assert (= bs!34047 d!132551))

(assert (=> bs!34047 m!1108535))

(declare-fun m!1109195 () Bool)

(assert (=> bs!34047 m!1109195))

(assert (=> b!1203317 d!132551))

(declare-fun b!1203667 () Bool)

(declare-fun e!683501 () Option!684)

(assert (=> b!1203667 (= e!683501 None!682)))

(declare-fun b!1203664 () Bool)

(declare-fun e!683500 () Option!684)

(assert (=> b!1203664 (= e!683500 (Some!683 (_2!9890 (h!27750 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1203666 () Bool)

(assert (=> b!1203666 (= e!683501 (getValueByKey!633 (t!39413 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(declare-fun d!132553 () Bool)

(declare-fun c!117916 () Bool)

(assert (=> d!132553 (= c!117916 (and ((_ is Cons!26541) (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9890 (h!27750 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!132553 (= (getValueByKey!633 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!683500)))

(declare-fun b!1203665 () Bool)

(assert (=> b!1203665 (= e!683500 e!683501)))

(declare-fun c!117917 () Bool)

(assert (=> b!1203665 (= c!117917 (and ((_ is Cons!26541) (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (not (= (_1!9890 (h!27750 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934))))))

(assert (= (and d!132553 c!117916) b!1203664))

(assert (= (and d!132553 (not c!117916)) b!1203665))

(assert (= (and b!1203665 c!117917) b!1203666))

(assert (= (and b!1203665 (not c!117917)) b!1203667))

(declare-fun m!1109197 () Bool)

(assert (=> b!1203666 m!1109197))

(assert (=> b!1203317 d!132553))

(declare-fun d!132555 () Bool)

(assert (=> d!132555 (arrayContainsKey!0 lt!545191 lt!545343 #b00000000000000000000000000000000)))

(declare-fun lt!545583 () Unit!39733)

(assert (=> d!132555 (= lt!545583 (choose!13 lt!545191 lt!545343 #b00000000000000000000000000000000))))

(assert (=> d!132555 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!132555 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545191 lt!545343 #b00000000000000000000000000000000) lt!545583)))

(declare-fun bs!34048 () Bool)

(assert (= bs!34048 d!132555))

(assert (=> bs!34048 m!1108491))

(declare-fun m!1109199 () Bool)

(assert (=> bs!34048 m!1109199))

(assert (=> b!1203294 d!132555))

(declare-fun d!132557 () Bool)

(declare-fun res!800918 () Bool)

(declare-fun e!683502 () Bool)

(assert (=> d!132557 (=> res!800918 e!683502)))

(assert (=> d!132557 (= res!800918 (= (select (arr!37590 lt!545191) #b00000000000000000000000000000000) lt!545343))))

(assert (=> d!132557 (= (arrayContainsKey!0 lt!545191 lt!545343 #b00000000000000000000000000000000) e!683502)))

(declare-fun b!1203668 () Bool)

(declare-fun e!683503 () Bool)

(assert (=> b!1203668 (= e!683502 e!683503)))

(declare-fun res!800919 () Bool)

(assert (=> b!1203668 (=> (not res!800919) (not e!683503))))

(assert (=> b!1203668 (= res!800919 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38128 lt!545191)))))

(declare-fun b!1203669 () Bool)

(assert (=> b!1203669 (= e!683503 (arrayContainsKey!0 lt!545191 lt!545343 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132557 (not res!800918)) b!1203668))

(assert (= (and b!1203668 res!800919) b!1203669))

(assert (=> d!132557 m!1108485))

(declare-fun m!1109201 () Bool)

(assert (=> b!1203669 m!1109201))

(assert (=> b!1203294 d!132557))

(declare-fun b!1203670 () Bool)

(declare-fun e!683505 () SeekEntryResult!9932)

(declare-fun lt!545584 () SeekEntryResult!9932)

(assert (=> b!1203670 (= e!683505 (MissingZero!9932 (index!42101 lt!545584)))))

(declare-fun b!1203671 () Bool)

(declare-fun c!117918 () Bool)

(declare-fun lt!545585 () (_ BitVec 64))

(assert (=> b!1203671 (= c!117918 (= lt!545585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!683504 () SeekEntryResult!9932)

(assert (=> b!1203671 (= e!683504 e!683505)))

(declare-fun b!1203672 () Bool)

(assert (=> b!1203672 (= e!683505 (seekKeyOrZeroReturnVacant!0 (x!106358 lt!545584) (index!42101 lt!545584) (index!42101 lt!545584) (select (arr!37590 lt!545191) #b00000000000000000000000000000000) lt!545191 mask!1564))))

(declare-fun b!1203673 () Bool)

(declare-fun e!683506 () SeekEntryResult!9932)

(assert (=> b!1203673 (= e!683506 Undefined!9932)))

(declare-fun d!132559 () Bool)

(declare-fun lt!545586 () SeekEntryResult!9932)

(assert (=> d!132559 (and (or ((_ is Undefined!9932) lt!545586) (not ((_ is Found!9932) lt!545586)) (and (bvsge (index!42100 lt!545586) #b00000000000000000000000000000000) (bvslt (index!42100 lt!545586) (size!38128 lt!545191)))) (or ((_ is Undefined!9932) lt!545586) ((_ is Found!9932) lt!545586) (not ((_ is MissingZero!9932) lt!545586)) (and (bvsge (index!42099 lt!545586) #b00000000000000000000000000000000) (bvslt (index!42099 lt!545586) (size!38128 lt!545191)))) (or ((_ is Undefined!9932) lt!545586) ((_ is Found!9932) lt!545586) ((_ is MissingZero!9932) lt!545586) (not ((_ is MissingVacant!9932) lt!545586)) (and (bvsge (index!42102 lt!545586) #b00000000000000000000000000000000) (bvslt (index!42102 lt!545586) (size!38128 lt!545191)))) (or ((_ is Undefined!9932) lt!545586) (ite ((_ is Found!9932) lt!545586) (= (select (arr!37590 lt!545191) (index!42100 lt!545586)) (select (arr!37590 lt!545191) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9932) lt!545586) (= (select (arr!37590 lt!545191) (index!42099 lt!545586)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9932) lt!545586) (= (select (arr!37590 lt!545191) (index!42102 lt!545586)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132559 (= lt!545586 e!683506)))

(declare-fun c!117919 () Bool)

(assert (=> d!132559 (= c!117919 (and ((_ is Intermediate!9932) lt!545584) (undefined!10744 lt!545584)))))

(assert (=> d!132559 (= lt!545584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) mask!1564) (select (arr!37590 lt!545191) #b00000000000000000000000000000000) lt!545191 mask!1564))))

(assert (=> d!132559 (validMask!0 mask!1564)))

(assert (=> d!132559 (= (seekEntryOrOpen!0 (select (arr!37590 lt!545191) #b00000000000000000000000000000000) lt!545191 mask!1564) lt!545586)))

(declare-fun b!1203674 () Bool)

(assert (=> b!1203674 (= e!683506 e!683504)))

(assert (=> b!1203674 (= lt!545585 (select (arr!37590 lt!545191) (index!42101 lt!545584)))))

(declare-fun c!117920 () Bool)

(assert (=> b!1203674 (= c!117920 (= lt!545585 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(declare-fun b!1203675 () Bool)

(assert (=> b!1203675 (= e!683504 (Found!9932 (index!42101 lt!545584)))))

(assert (= (and d!132559 c!117919) b!1203673))

(assert (= (and d!132559 (not c!117919)) b!1203674))

(assert (= (and b!1203674 c!117920) b!1203675))

(assert (= (and b!1203674 (not c!117920)) b!1203671))

(assert (= (and b!1203671 c!117918) b!1203670))

(assert (= (and b!1203671 (not c!117918)) b!1203672))

(assert (=> b!1203672 m!1108485))

(declare-fun m!1109203 () Bool)

(assert (=> b!1203672 m!1109203))

(declare-fun m!1109205 () Bool)

(assert (=> d!132559 m!1109205))

(assert (=> d!132559 m!1108485))

(declare-fun m!1109207 () Bool)

(assert (=> d!132559 m!1109207))

(declare-fun m!1109209 () Bool)

(assert (=> d!132559 m!1109209))

(declare-fun m!1109211 () Bool)

(assert (=> d!132559 m!1109211))

(declare-fun m!1109213 () Bool)

(assert (=> d!132559 m!1109213))

(assert (=> d!132559 m!1108231))

(assert (=> d!132559 m!1108485))

(assert (=> d!132559 m!1109205))

(declare-fun m!1109215 () Bool)

(assert (=> b!1203674 m!1109215))

(assert (=> b!1203294 d!132559))

(assert (=> b!1203325 d!132423))

(assert (=> d!132351 d!132349))

(declare-fun d!132561 () Bool)

(assert (=> d!132561 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!132561 true))

(declare-fun _$60!445 () Unit!39733)

(assert (=> d!132561 (= (choose!13 _keys!1208 k0!934 i!673) _$60!445)))

(declare-fun bs!34049 () Bool)

(assert (= bs!34049 d!132561))

(assert (=> bs!34049 m!1108247))

(assert (=> d!132351 d!132561))

(declare-fun b!1203679 () Bool)

(declare-fun e!683508 () Option!684)

(assert (=> b!1203679 (= e!683508 None!682)))

(declare-fun b!1203676 () Bool)

(declare-fun e!683507 () Option!684)

(assert (=> b!1203676 (= e!683507 (Some!683 (_2!9890 (h!27750 (toList!8879 lt!545322)))))))

(declare-fun b!1203678 () Bool)

(assert (=> b!1203678 (= e!683508 (getValueByKey!633 (t!39413 (toList!8879 lt!545322)) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun c!117921 () Bool)

(declare-fun d!132563 () Bool)

(assert (=> d!132563 (= c!117921 (and ((_ is Cons!26541) (toList!8879 lt!545322)) (= (_1!9890 (h!27750 (toList!8879 lt!545322))) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132563 (= (getValueByKey!633 (toList!8879 lt!545322) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!683507)))

(declare-fun b!1203677 () Bool)

(assert (=> b!1203677 (= e!683507 e!683508)))

(declare-fun c!117922 () Bool)

(assert (=> b!1203677 (= c!117922 (and ((_ is Cons!26541) (toList!8879 lt!545322)) (not (= (_1!9890 (h!27750 (toList!8879 lt!545322))) (_1!9890 (ite (or c!117753 c!117755) (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!132563 c!117921) b!1203676))

(assert (= (and d!132563 (not c!117921)) b!1203677))

(assert (= (and b!1203677 c!117922) b!1203678))

(assert (= (and b!1203677 (not c!117922)) b!1203679))

(declare-fun m!1109217 () Bool)

(assert (=> b!1203678 m!1109217))

(assert (=> b!1203248 d!132563))

(declare-fun b!1203680 () Bool)

(declare-fun e!683515 () Bool)

(assert (=> b!1203680 (= e!683515 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203680 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203681 () Bool)

(declare-fun lt!545590 () Unit!39733)

(declare-fun lt!545593 () Unit!39733)

(assert (=> b!1203681 (= lt!545590 lt!545593)))

(declare-fun lt!545592 () V!45929)

(declare-fun lt!545589 () (_ BitVec 64))

(declare-fun lt!545591 () (_ BitVec 64))

(declare-fun lt!545587 () ListLongMap!17727)

(assert (=> b!1203681 (not (contains!6873 (+!4013 lt!545587 (tuple2!19759 lt!545591 lt!545592)) lt!545589))))

(assert (=> b!1203681 (= lt!545593 (addStillNotContains!289 lt!545587 lt!545591 lt!545592 lt!545589))))

(assert (=> b!1203681 (= lt!545589 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203681 (= lt!545592 (get!19177 (select (arr!37591 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203681 (= lt!545591 (select (arr!37590 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58043 () ListLongMap!17727)

(assert (=> b!1203681 (= lt!545587 call!58043)))

(declare-fun e!683512 () ListLongMap!17727)

(assert (=> b!1203681 (= e!683512 (+!4013 call!58043 (tuple2!19759 (select (arr!37590 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19177 (select (arr!37591 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1203682 () Bool)

(declare-fun e!683509 () ListLongMap!17727)

(assert (=> b!1203682 (= e!683509 (ListLongMap!17728 Nil!26542))))

(declare-fun b!1203683 () Bool)

(assert (=> b!1203683 (= e!683512 call!58043)))

(declare-fun b!1203684 () Bool)

(declare-fun e!683510 () Bool)

(declare-fun lt!545588 () ListLongMap!17727)

(assert (=> b!1203684 (= e!683510 (isEmpty!985 lt!545588))))

(declare-fun b!1203686 () Bool)

(declare-fun e!683511 () Bool)

(declare-fun e!683514 () Bool)

(assert (=> b!1203686 (= e!683511 e!683514)))

(assert (=> b!1203686 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun res!800921 () Bool)

(assert (=> b!1203686 (= res!800921 (contains!6873 lt!545588 (select (arr!37590 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203686 (=> (not res!800921) (not e!683514))))

(declare-fun bm!58040 () Bool)

(assert (=> bm!58040 (= call!58043 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203687 () Bool)

(declare-fun e!683513 () Bool)

(assert (=> b!1203687 (= e!683513 e!683511)))

(declare-fun c!117926 () Bool)

(assert (=> b!1203687 (= c!117926 e!683515)))

(declare-fun res!800920 () Bool)

(assert (=> b!1203687 (=> (not res!800920) (not e!683515))))

(assert (=> b!1203687 (= res!800920 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(declare-fun b!1203688 () Bool)

(assert (=> b!1203688 (= e!683510 (= lt!545588 (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203689 () Bool)

(assert (=> b!1203689 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (=> b!1203689 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38129 _values!996)))))

(assert (=> b!1203689 (= e!683514 (= (apply!953 lt!545588 (select (arr!37590 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19177 (select (arr!37591 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132565 () Bool)

(assert (=> d!132565 e!683513))

(declare-fun res!800923 () Bool)

(assert (=> d!132565 (=> (not res!800923) (not e!683513))))

(assert (=> d!132565 (= res!800923 (not (contains!6873 lt!545588 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132565 (= lt!545588 e!683509)))

(declare-fun c!117925 () Bool)

(assert (=> d!132565 (= c!117925 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (=> d!132565 (validMask!0 mask!1564)))

(assert (=> d!132565 (= (getCurrentListMapNoExtraKeys!5325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545588)))

(declare-fun b!1203685 () Bool)

(assert (=> b!1203685 (= e!683509 e!683512)))

(declare-fun c!117924 () Bool)

(assert (=> b!1203685 (= c!117924 (validKeyInArray!0 (select (arr!37590 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203690 () Bool)

(declare-fun res!800922 () Bool)

(assert (=> b!1203690 (=> (not res!800922) (not e!683513))))

(assert (=> b!1203690 (= res!800922 (not (contains!6873 lt!545588 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203691 () Bool)

(assert (=> b!1203691 (= e!683511 e!683510)))

(declare-fun c!117923 () Bool)

(assert (=> b!1203691 (= c!117923 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38128 _keys!1208)))))

(assert (= (and d!132565 c!117925) b!1203682))

(assert (= (and d!132565 (not c!117925)) b!1203685))

(assert (= (and b!1203685 c!117924) b!1203681))

(assert (= (and b!1203685 (not c!117924)) b!1203683))

(assert (= (or b!1203681 b!1203683) bm!58040))

(assert (= (and d!132565 res!800923) b!1203690))

(assert (= (and b!1203690 res!800922) b!1203687))

(assert (= (and b!1203687 res!800920) b!1203680))

(assert (= (and b!1203687 c!117926) b!1203686))

(assert (= (and b!1203687 (not c!117926)) b!1203691))

(assert (= (and b!1203686 res!800921) b!1203689))

(assert (= (and b!1203691 c!117923) b!1203688))

(assert (= (and b!1203691 (not c!117923)) b!1203684))

(declare-fun b_lambda!21137 () Bool)

(assert (=> (not b_lambda!21137) (not b!1203681)))

(assert (=> b!1203681 t!39412))

(declare-fun b_and!42707 () Bool)

(assert (= b_and!42705 (and (=> t!39412 result!21963) b_and!42707)))

(declare-fun b_lambda!21139 () Bool)

(assert (=> (not b_lambda!21139) (not b!1203689)))

(assert (=> b!1203689 t!39412))

(declare-fun b_and!42709 () Bool)

(assert (= b_and!42707 (and (=> t!39412 result!21963) b_and!42709)))

(declare-fun m!1109219 () Bool)

(assert (=> b!1203686 m!1109219))

(assert (=> b!1203686 m!1109219))

(declare-fun m!1109221 () Bool)

(assert (=> b!1203686 m!1109221))

(declare-fun m!1109223 () Bool)

(assert (=> b!1203688 m!1109223))

(assert (=> b!1203689 m!1109219))

(assert (=> b!1203689 m!1108263))

(declare-fun m!1109225 () Bool)

(assert (=> b!1203689 m!1109225))

(assert (=> b!1203689 m!1109219))

(declare-fun m!1109227 () Bool)

(assert (=> b!1203689 m!1109227))

(assert (=> b!1203689 m!1109225))

(assert (=> b!1203689 m!1108263))

(declare-fun m!1109229 () Bool)

(assert (=> b!1203689 m!1109229))

(assert (=> bm!58040 m!1109223))

(declare-fun m!1109231 () Bool)

(assert (=> b!1203690 m!1109231))

(assert (=> b!1203680 m!1109219))

(assert (=> b!1203680 m!1109219))

(declare-fun m!1109233 () Bool)

(assert (=> b!1203680 m!1109233))

(declare-fun m!1109235 () Bool)

(assert (=> d!132565 m!1109235))

(assert (=> d!132565 m!1108231))

(declare-fun m!1109237 () Bool)

(assert (=> b!1203681 m!1109237))

(assert (=> b!1203681 m!1109219))

(assert (=> b!1203681 m!1108263))

(declare-fun m!1109239 () Bool)

(assert (=> b!1203681 m!1109239))

(assert (=> b!1203681 m!1109225))

(declare-fun m!1109241 () Bool)

(assert (=> b!1203681 m!1109241))

(assert (=> b!1203681 m!1109225))

(assert (=> b!1203681 m!1108263))

(assert (=> b!1203681 m!1109229))

(assert (=> b!1203681 m!1109237))

(declare-fun m!1109243 () Bool)

(assert (=> b!1203681 m!1109243))

(assert (=> b!1203685 m!1109219))

(assert (=> b!1203685 m!1109219))

(assert (=> b!1203685 m!1109233))

(declare-fun m!1109245 () Bool)

(assert (=> b!1203684 m!1109245))

(assert (=> bm!57997 d!132565))

(declare-fun d!132567 () Bool)

(declare-fun lt!545594 () Bool)

(assert (=> d!132567 (= lt!545594 (select (content!541 Nil!26543) (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(declare-fun e!683516 () Bool)

(assert (=> d!132567 (= lt!545594 e!683516)))

(declare-fun res!800924 () Bool)

(assert (=> d!132567 (=> (not res!800924) (not e!683516))))

(assert (=> d!132567 (= res!800924 ((_ is Cons!26542) Nil!26543))))

(assert (=> d!132567 (= (contains!6877 Nil!26543 (select (arr!37590 lt!545191) #b00000000000000000000000000000000)) lt!545594)))

(declare-fun b!1203692 () Bool)

(declare-fun e!683517 () Bool)

(assert (=> b!1203692 (= e!683516 e!683517)))

(declare-fun res!800925 () Bool)

(assert (=> b!1203692 (=> res!800925 e!683517)))

(assert (=> b!1203692 (= res!800925 (= (h!27751 Nil!26543) (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(declare-fun b!1203693 () Bool)

(assert (=> b!1203693 (= e!683517 (contains!6877 (t!39414 Nil!26543) (select (arr!37590 lt!545191) #b00000000000000000000000000000000)))))

(assert (= (and d!132567 res!800924) b!1203692))

(assert (= (and b!1203692 (not res!800925)) b!1203693))

(assert (=> d!132567 m!1109059))

(assert (=> d!132567 m!1108485))

(declare-fun m!1109247 () Bool)

(assert (=> d!132567 m!1109247))

(assert (=> b!1203693 m!1108485))

(declare-fun m!1109249 () Bool)

(assert (=> b!1203693 m!1109249))

(assert (=> b!1203323 d!132567))

(declare-fun d!132569 () Bool)

(declare-fun e!683518 () Bool)

(assert (=> d!132569 e!683518))

(declare-fun res!800926 () Bool)

(assert (=> d!132569 (=> res!800926 e!683518)))

(declare-fun lt!545597 () Bool)

(assert (=> d!132569 (= res!800926 (not lt!545597))))

(declare-fun lt!545598 () Bool)

(assert (=> d!132569 (= lt!545597 lt!545598)))

(declare-fun lt!545595 () Unit!39733)

(declare-fun e!683519 () Unit!39733)

(assert (=> d!132569 (= lt!545595 e!683519)))

(declare-fun c!117927 () Bool)

(assert (=> d!132569 (= c!117927 lt!545598)))

(assert (=> d!132569 (= lt!545598 (containsKey!587 (toList!8879 lt!545374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132569 (= (contains!6873 lt!545374 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545597)))

(declare-fun b!1203694 () Bool)

(declare-fun lt!545596 () Unit!39733)

(assert (=> b!1203694 (= e!683519 lt!545596)))

(assert (=> b!1203694 (= lt!545596 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 lt!545374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203694 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203695 () Bool)

(declare-fun Unit!39764 () Unit!39733)

(assert (=> b!1203695 (= e!683519 Unit!39764)))

(declare-fun b!1203696 () Bool)

(assert (=> b!1203696 (= e!683518 (isDefined!459 (getValueByKey!633 (toList!8879 lt!545374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132569 c!117927) b!1203694))

(assert (= (and d!132569 (not c!117927)) b!1203695))

(assert (= (and d!132569 (not res!800926)) b!1203696))

(declare-fun m!1109251 () Bool)

(assert (=> d!132569 m!1109251))

(declare-fun m!1109253 () Bool)

(assert (=> b!1203694 m!1109253))

(declare-fun m!1109255 () Bool)

(assert (=> b!1203694 m!1109255))

(assert (=> b!1203694 m!1109255))

(declare-fun m!1109257 () Bool)

(assert (=> b!1203694 m!1109257))

(assert (=> b!1203696 m!1109255))

(assert (=> b!1203696 m!1109255))

(assert (=> b!1203696 m!1109257))

(assert (=> b!1203335 d!132569))

(declare-fun d!132571 () Bool)

(assert (=> d!132571 (isDefined!459 (getValueByKey!633 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))

(declare-fun lt!545599 () Unit!39733)

(assert (=> d!132571 (= lt!545599 (choose!1797 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))

(declare-fun e!683520 () Bool)

(assert (=> d!132571 e!683520))

(declare-fun res!800927 () Bool)

(assert (=> d!132571 (=> (not res!800927) (not e!683520))))

(assert (=> d!132571 (= res!800927 (isStrictlySorted!724 (toList!8879 (ite c!117753 lt!545190 call!57945))))))

(assert (=> d!132571 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934) lt!545599)))

(declare-fun b!1203697 () Bool)

(assert (=> b!1203697 (= e!683520 (containsKey!587 (toList!8879 (ite c!117753 lt!545190 call!57945)) k0!934))))

(assert (= (and d!132571 res!800927) b!1203697))

(assert (=> d!132571 m!1108603))

(assert (=> d!132571 m!1108603))

(assert (=> d!132571 m!1108605))

(declare-fun m!1109259 () Bool)

(assert (=> d!132571 m!1109259))

(declare-fun m!1109261 () Bool)

(assert (=> d!132571 m!1109261))

(assert (=> b!1203697 m!1108599))

(assert (=> b!1203340 d!132571))

(assert (=> b!1203340 d!132535))

(assert (=> b!1203340 d!132537))

(assert (=> b!1203240 d!132565))

(declare-fun d!132573 () Bool)

(declare-fun lt!545600 () Bool)

(assert (=> d!132573 (= lt!545600 (select (content!540 (toList!8879 lt!545369)) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun e!683521 () Bool)

(assert (=> d!132573 (= lt!545600 e!683521)))

(declare-fun res!800929 () Bool)

(assert (=> d!132573 (=> (not res!800929) (not e!683521))))

(assert (=> d!132573 (= res!800929 ((_ is Cons!26541) (toList!8879 lt!545369)))))

(assert (=> d!132573 (= (contains!6876 (toList!8879 lt!545369) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!545600)))

(declare-fun b!1203698 () Bool)

(declare-fun e!683522 () Bool)

(assert (=> b!1203698 (= e!683521 e!683522)))

(declare-fun res!800928 () Bool)

(assert (=> b!1203698 (=> res!800928 e!683522)))

(assert (=> b!1203698 (= res!800928 (= (h!27750 (toList!8879 lt!545369)) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1203699 () Bool)

(assert (=> b!1203699 (= e!683522 (contains!6876 (t!39413 (toList!8879 lt!545369)) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132573 res!800929) b!1203698))

(assert (= (and b!1203698 (not res!800928)) b!1203699))

(declare-fun m!1109263 () Bool)

(assert (=> d!132573 m!1109263))

(declare-fun m!1109265 () Bool)

(assert (=> d!132573 m!1109265))

(declare-fun m!1109267 () Bool)

(assert (=> b!1203699 m!1109267))

(assert (=> b!1203319 d!132573))

(declare-fun d!132575 () Bool)

(assert (=> d!132575 (isDefined!459 (getValueByKey!633 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun lt!545601 () Unit!39733)

(assert (=> d!132575 (= lt!545601 (choose!1797 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun e!683523 () Bool)

(assert (=> d!132575 e!683523))

(declare-fun res!800930 () Bool)

(assert (=> d!132575 (=> (not res!800930) (not e!683523))))

(assert (=> d!132575 (= res!800930 (isStrictlySorted!724 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132575 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) lt!545601)))

(declare-fun b!1203700 () Bool)

(assert (=> b!1203700 (= e!683523 (containsKey!587 (toList!8879 (+!4013 lt!545190 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (= (and d!132575 res!800930) b!1203700))

(assert (=> d!132575 m!1108535))

(assert (=> d!132575 m!1108535))

(assert (=> d!132575 m!1108537))

(declare-fun m!1109269 () Bool)

(assert (=> d!132575 m!1109269))

(declare-fun m!1109271 () Bool)

(assert (=> d!132575 m!1109271))

(assert (=> b!1203700 m!1108531))

(assert (=> b!1203315 d!132575))

(assert (=> b!1203315 d!132551))

(assert (=> b!1203315 d!132553))

(declare-fun b!1203702 () Bool)

(declare-fun e!683525 () Bool)

(assert (=> b!1203702 (= e!683525 tp_is_empty!30601)))

(declare-fun condMapEmpty!47754 () Bool)

(declare-fun mapDefault!47754 () ValueCell!14591)

(assert (=> mapNonEmpty!47753 (= condMapEmpty!47754 (= mapRest!47753 ((as const (Array (_ BitVec 32) ValueCell!14591)) mapDefault!47754)))))

(declare-fun mapRes!47754 () Bool)

(assert (=> mapNonEmpty!47753 (= tp!90696 (and e!683525 mapRes!47754))))

(declare-fun mapNonEmpty!47754 () Bool)

(declare-fun tp!90697 () Bool)

(declare-fun e!683524 () Bool)

(assert (=> mapNonEmpty!47754 (= mapRes!47754 (and tp!90697 e!683524))))

(declare-fun mapRest!47754 () (Array (_ BitVec 32) ValueCell!14591))

(declare-fun mapKey!47754 () (_ BitVec 32))

(declare-fun mapValue!47754 () ValueCell!14591)

(assert (=> mapNonEmpty!47754 (= mapRest!47753 (store mapRest!47754 mapKey!47754 mapValue!47754))))

(declare-fun mapIsEmpty!47754 () Bool)

(assert (=> mapIsEmpty!47754 mapRes!47754))

(declare-fun b!1203701 () Bool)

(assert (=> b!1203701 (= e!683524 tp_is_empty!30601)))

(assert (= (and mapNonEmpty!47753 condMapEmpty!47754) mapIsEmpty!47754))

(assert (= (and mapNonEmpty!47753 (not condMapEmpty!47754)) mapNonEmpty!47754))

(assert (= (and mapNonEmpty!47754 ((_ is ValueCellFull!14591) mapValue!47754)) b!1203701))

(assert (= (and mapNonEmpty!47753 ((_ is ValueCellFull!14591) mapDefault!47754)) b!1203702))

(declare-fun m!1109273 () Bool)

(assert (=> mapNonEmpty!47754 m!1109273))

(declare-fun b_lambda!21141 () Bool)

(assert (= b_lambda!21137 (or (and start!100568 b_free!25897) b_lambda!21141)))

(declare-fun b_lambda!21143 () Bool)

(assert (= b_lambda!21119 (or (and start!100568 b_free!25897) b_lambda!21143)))

(declare-fun b_lambda!21145 () Bool)

(assert (= b_lambda!21127 (or (and start!100568 b_free!25897) b_lambda!21145)))

(declare-fun b_lambda!21147 () Bool)

(assert (= b_lambda!21131 (or (and start!100568 b_free!25897) b_lambda!21147)))

(declare-fun b_lambda!21149 () Bool)

(assert (= b_lambda!21133 (or (and start!100568 b_free!25897) b_lambda!21149)))

(declare-fun b_lambda!21151 () Bool)

(assert (= b_lambda!21125 (or (and start!100568 b_free!25897) b_lambda!21151)))

(declare-fun b_lambda!21153 () Bool)

(assert (= b_lambda!21121 (or (and start!100568 b_free!25897) b_lambda!21153)))

(declare-fun b_lambda!21155 () Bool)

(assert (= b_lambda!21129 (or (and start!100568 b_free!25897) b_lambda!21155)))

(declare-fun b_lambda!21157 () Bool)

(assert (= b_lambda!21139 (or (and start!100568 b_free!25897) b_lambda!21157)))

(declare-fun b_lambda!21159 () Bool)

(assert (= b_lambda!21135 (or (and start!100568 b_free!25897) b_lambda!21159)))

(declare-fun b_lambda!21161 () Bool)

(assert (= b_lambda!21123 (or (and start!100568 b_free!25897) b_lambda!21161)))

(check-sat (not d!132531) (not b_lambda!21149) (not b_lambda!21117) (not b!1203398) (not b_lambda!21161) (not bm!58014) (not b!1203420) (not d!132379) (not b!1203503) (not b!1203468) (not d!132443) (not b!1203487) (not b!1203592) (not b!1203551) (not d!132485) (not b_lambda!21143) (not b!1203684) (not b!1203437) (not b!1203395) (not b!1203436) (not d!132397) (not b!1203634) (not b!1203425) (not b_lambda!21147) (not d!132389) (not b!1203423) (not b!1203375) (not b!1203619) (not b!1203514) (not d!132495) (not bm!58017) (not d!132447) (not d!132497) (not b!1203502) (not b!1203428) (not b!1203625) (not b!1203417) (not b!1203616) (not b!1203454) (not b!1203669) (not b_next!25897) (not d!132453) (not d!132481) (not bm!58015) (not b_lambda!21153) (not d!132569) (not d!132571) (not b!1203555) b_and!42709 (not b!1203520) (not d!132399) (not b_lambda!21155) (not d!132521) (not d!132523) (not d!132463) (not b_lambda!21113) (not b!1203598) (not b!1203562) (not b!1203389) (not d!132431) (not b!1203442) (not b!1203470) (not b!1203571) (not b!1203699) (not b!1203658) (not b!1203397) (not b!1203666) (not b!1203660) (not b!1203611) (not bm!58016) (not b!1203561) (not b!1203681) (not b!1203431) (not b!1203600) (not b!1203383) (not d!132433) (not b!1203424) (not d!132535) (not b!1203393) (not b!1203378) (not b!1203694) (not b_lambda!21145) (not b!1203678) (not b!1203628) (not b_lambda!21081) (not b!1203622) (not d!132477) (not b!1203672) (not d!132471) (not b!1203552) (not d!132487) (not b!1203543) (not b!1203451) (not b!1203384) (not d!132575) (not b!1203521) (not d!132573) (not bm!58024) (not d!132543) (not d!132407) tp_is_empty!30601 (not d!132449) (not b!1203403) (not d!132419) (not b!1203582) (not d!132383) (not b!1203444) (not d!132515) (not b!1203624) (not d!132479) (not b!1203439) (not b!1203486) (not b!1203631) (not b!1203368) (not b!1203441) (not d!132513) (not b!1203680) (not b_lambda!21109) (not b!1203482) (not b!1203415) (not d!132529) (not d!132505) (not b!1203494) (not b!1203388) (not b!1203484) (not d!132509) (not b!1203406) (not b!1203627) (not b!1203656) (not b_lambda!21157) (not b_lambda!21103) (not b!1203689) (not b!1203496) (not b!1203509) (not b!1203595) (not b!1203511) (not bm!58036) (not b!1203399) (not d!132551) (not d!132393) (not b!1203601) (not b!1203565) (not bm!58018) (not bm!58037) (not b!1203603) (not b!1203355) (not b!1203493) (not b!1203408) (not b!1203377) (not b!1203690) (not d!132503) (not b!1203422) (not mapNonEmpty!47754) (not b_lambda!21105) (not b!1203506) (not b!1203360) (not b!1203609) (not d!132469) (not d!132559) (not b!1203549) (not b_lambda!21111) (not b!1203688) (not bm!58035) (not b!1203387) (not b!1203563) (not d!132391) (not b!1203351) (not b!1203686) (not d!132413) (not b!1203433) (not b!1203629) (not bm!58040) (not b!1203366) (not b!1203569) (not b!1203430) (not b!1203374) (not b!1203434) (not b_lambda!21151) (not b!1203354) (not b!1203693) (not d!132461) (not d!132549) (not d!132467) (not d!132465) (not d!132567) (not d!132451) (not b!1203407) (not b!1203508) (not d!132499) (not b!1203556) (not b!1203593) (not b!1203696) (not b!1203685) (not b!1203490) (not b_lambda!21101) (not d!132491) (not b!1203566) (not b!1203455) (not b!1203492) (not b!1203467) (not b_lambda!21141) (not b!1203402) (not b!1203615) (not b!1203700) (not b!1203463) (not b!1203652) (not b!1203557) (not b!1203663) (not b!1203614) (not b_lambda!21159) (not d!132511) (not b!1203469) (not b!1203462) (not d!132425) (not d!132493) (not b!1203391) (not b!1203363) (not b!1203426) (not b!1203637) (not b!1203359) (not d!132517) (not b!1203353) (not bm!58023) (not d!132545) (not b_lambda!21107) (not d!132561) (not b!1203404) (not d!132459) (not b!1203376) (not b_lambda!21115) (not b!1203364) (not b!1203466) (not b!1203373) (not b!1203697) (not b!1203449) (not b!1203489) (not d!132533) (not b!1203567) (not b!1203498) (not b!1203392) (not b!1203358) (not b!1203585) (not d!132539) (not b!1203362) (not b!1203505) (not d!132519) (not bm!58025) (not d!132527) (not b!1203612) (not b!1203558) (not d!132441) (not d!132565) (not b!1203617) (not b!1203421) (not b!1203500) (not b!1203419) (not bm!58032) (not b!1203461) (not d!132457) (not d!132501) (not d!132387) (not b!1203464) (not d!132409) (not d!132555) (not d!132381) (not d!132417) (not d!132411))
(check-sat b_and!42709 (not b_next!25897))
