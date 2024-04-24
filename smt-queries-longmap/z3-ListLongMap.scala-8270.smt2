; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100804 () Bool)

(assert start!100804)

(declare-fun b_free!25891 () Bool)

(declare-fun b_next!25891 () Bool)

(assert (=> start!100804 (= b_free!25891 (not b_next!25891))))

(declare-fun tp!90663 () Bool)

(declare-fun b_and!42671 () Bool)

(assert (=> start!100804 (= tp!90663 b_and!42671)))

(declare-fun b!1204197 () Bool)

(declare-fun e!683898 () Bool)

(declare-fun e!683891 () Bool)

(assert (=> b!1204197 (= e!683898 e!683891)))

(declare-fun res!801089 () Bool)

(assert (=> b!1204197 (=> res!801089 e!683891)))

(declare-datatypes ((array!77999 0))(
  ( (array!78000 (arr!37638 (Array (_ BitVec 32) (_ BitVec 64))) (size!38175 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77999)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1204197 (= res!801089 (not (= (select (arr!37638 _keys!1208) from!1455) k0!934)))))

(declare-fun e!683903 () Bool)

(assert (=> b!1204197 e!683903))

(declare-fun c!118141 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204197 (= c!118141 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45921 0))(
  ( (V!45922 (val!15354 Int)) )
))
(declare-fun zeroValue!944 () V!45921)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14588 0))(
  ( (ValueCellFull!14588 (v!17988 V!45921)) (EmptyCell!14588) )
))
(declare-datatypes ((array!78001 0))(
  ( (array!78002 (arr!37639 (Array (_ BitVec 32) ValueCell!14588)) (size!38176 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78001)

(declare-fun minValue!944 () V!45921)

(declare-datatypes ((Unit!39839 0))(
  ( (Unit!39840) )
))
(declare-fun lt!545746 () Unit!39839)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1019 (array!77999 array!78001 (_ BitVec 32) (_ BitVec 32) V!45921 V!45921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39839)

(assert (=> b!1204197 (= lt!545746 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204198 () Bool)

(declare-fun e!683897 () Bool)

(declare-fun e!683893 () Bool)

(assert (=> b!1204198 (= e!683897 (not e!683893))))

(declare-fun res!801084 () Bool)

(assert (=> b!1204198 (=> res!801084 e!683893)))

(assert (=> b!1204198 (= res!801084 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204198 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545739 () Unit!39839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77999 (_ BitVec 64) (_ BitVec 32)) Unit!39839)

(assert (=> b!1204198 (= lt!545739 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1204199 () Bool)

(declare-fun e!683902 () Bool)

(assert (=> b!1204199 (= e!683902 e!683897)))

(declare-fun res!801090 () Bool)

(assert (=> b!1204199 (=> (not res!801090) (not e!683897))))

(declare-fun lt!545737 () array!77999)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77999 (_ BitVec 32)) Bool)

(assert (=> b!1204199 (= res!801090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545737 mask!1564))))

(assert (=> b!1204199 (= lt!545737 (array!78000 (store (arr!37638 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38175 _keys!1208)))))

(declare-fun b!1204200 () Bool)

(declare-fun res!801088 () Bool)

(assert (=> b!1204200 (=> (not res!801088) (not e!683902))))

(declare-datatypes ((List!26506 0))(
  ( (Nil!26503) (Cons!26502 (h!27720 (_ BitVec 64)) (t!39369 List!26506)) )
))
(declare-fun arrayNoDuplicates!0 (array!77999 (_ BitVec 32) List!26506) Bool)

(assert (=> b!1204200 (= res!801088 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26503))))

(declare-fun b!1204201 () Bool)

(declare-fun res!801083 () Bool)

(assert (=> b!1204201 (=> (not res!801083) (not e!683902))))

(assert (=> b!1204201 (= res!801083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204202 () Bool)

(declare-fun e!683895 () Bool)

(declare-fun e!683896 () Bool)

(declare-fun mapRes!47735 () Bool)

(assert (=> b!1204202 (= e!683895 (and e!683896 mapRes!47735))))

(declare-fun condMapEmpty!47735 () Bool)

(declare-fun mapDefault!47735 () ValueCell!14588)

(assert (=> b!1204202 (= condMapEmpty!47735 (= (arr!37639 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14588)) mapDefault!47735)))))

(declare-fun b!1204203 () Bool)

(assert (=> b!1204203 (= e!683893 e!683898)))

(declare-fun res!801093 () Bool)

(assert (=> b!1204203 (=> res!801093 e!683898)))

(assert (=> b!1204203 (= res!801093 (not (= from!1455 i!673)))))

(declare-datatypes ((tuple2!19694 0))(
  ( (tuple2!19695 (_1!9858 (_ BitVec 64)) (_2!9858 V!45921)) )
))
(declare-datatypes ((List!26507 0))(
  ( (Nil!26504) (Cons!26503 (h!27721 tuple2!19694) (t!39370 List!26507)) )
))
(declare-datatypes ((ListLongMap!17671 0))(
  ( (ListLongMap!17672 (toList!8851 List!26507)) )
))
(declare-fun lt!545743 () ListLongMap!17671)

(declare-fun lt!545749 () array!78001)

(declare-fun getCurrentListMapNoExtraKeys!5318 (array!77999 array!78001 (_ BitVec 32) (_ BitVec 32) V!45921 V!45921 (_ BitVec 32) Int) ListLongMap!17671)

(assert (=> b!1204203 (= lt!545743 (getCurrentListMapNoExtraKeys!5318 lt!545737 lt!545749 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3248 (Int (_ BitVec 64)) V!45921)

(assert (=> b!1204203 (= lt!545749 (array!78002 (store (arr!37639 _values!996) i!673 (ValueCellFull!14588 (dynLambda!3248 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38176 _values!996)))))

(declare-fun lt!545742 () ListLongMap!17671)

(assert (=> b!1204203 (= lt!545742 (getCurrentListMapNoExtraKeys!5318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!57964 () ListLongMap!17671)

(declare-fun bm!57954 () Bool)

(assert (=> bm!57954 (= call!57964 (getCurrentListMapNoExtraKeys!5318 (ite c!118141 _keys!1208 lt!545737) (ite c!118141 _values!996 lt!545749) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47735 () Bool)

(assert (=> mapIsEmpty!47735 mapRes!47735))

(declare-fun call!57959 () ListLongMap!17671)

(declare-fun b!1204204 () Bool)

(declare-fun -!1798 (ListLongMap!17671 (_ BitVec 64)) ListLongMap!17671)

(assert (=> b!1204204 (= e!683903 (= call!57959 (-!1798 call!57964 k0!934)))))

(declare-fun bm!57955 () Bool)

(declare-fun call!57962 () Bool)

(declare-fun call!57961 () Bool)

(assert (=> bm!57955 (= call!57962 call!57961)))

(declare-fun bm!57956 () Bool)

(assert (=> bm!57956 (= call!57959 (getCurrentListMapNoExtraKeys!5318 (ite c!118141 lt!545737 _keys!1208) (ite c!118141 lt!545749 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57957 () ListLongMap!17671)

(declare-fun bm!57957 () Bool)

(declare-fun lt!545745 () ListLongMap!17671)

(declare-fun c!118144 () Bool)

(declare-fun c!118142 () Bool)

(declare-fun +!4018 (ListLongMap!17671 tuple2!19694) ListLongMap!17671)

(assert (=> bm!57957 (= call!57957 (+!4018 lt!545745 (ite (or c!118144 c!118142) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204205 () Bool)

(declare-fun e!683900 () Bool)

(assert (=> b!1204205 (= e!683891 e!683900)))

(declare-fun res!801081 () Bool)

(assert (=> b!1204205 (=> res!801081 e!683900)))

(declare-fun contains!6926 (ListLongMap!17671 (_ BitVec 64)) Bool)

(assert (=> b!1204205 (= res!801081 (not (contains!6926 lt!545745 k0!934)))))

(assert (=> b!1204205 (= lt!545745 (getCurrentListMapNoExtraKeys!5318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204206 () Bool)

(declare-fun res!801085 () Bool)

(assert (=> b!1204206 (=> (not res!801085) (not e!683902))))

(assert (=> b!1204206 (= res!801085 (= (select (arr!37638 _keys!1208) i!673) k0!934))))

(declare-fun b!1204207 () Bool)

(declare-fun res!801086 () Bool)

(assert (=> b!1204207 (=> (not res!801086) (not e!683902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204207 (= res!801086 (validMask!0 mask!1564))))

(declare-fun b!1204208 () Bool)

(declare-fun e!683894 () Unit!39839)

(declare-fun lt!545748 () Unit!39839)

(assert (=> b!1204208 (= e!683894 lt!545748)))

(declare-fun lt!545750 () Unit!39839)

(declare-fun addStillContains!1003 (ListLongMap!17671 (_ BitVec 64) V!45921 (_ BitVec 64)) Unit!39839)

(assert (=> b!1204208 (= lt!545750 (addStillContains!1003 lt!545745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!545740 () ListLongMap!17671)

(assert (=> b!1204208 (= lt!545740 call!57957)))

(assert (=> b!1204208 call!57961))

(declare-fun call!57963 () Unit!39839)

(assert (=> b!1204208 (= lt!545748 call!57963)))

(assert (=> b!1204208 (contains!6926 (+!4018 lt!545740 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!57959 () Bool)

(assert (=> bm!57959 (= call!57963 (addStillContains!1003 (ite c!118144 lt!545740 lt!545745) (ite c!118144 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118142 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118144 minValue!944 (ite c!118142 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!57960 () Bool)

(declare-fun call!57958 () ListLongMap!17671)

(assert (=> bm!57960 (= call!57958 call!57957)))

(declare-fun bm!57961 () Bool)

(declare-fun call!57960 () Unit!39839)

(assert (=> bm!57961 (= call!57960 call!57963)))

(declare-fun b!1204209 () Bool)

(declare-fun res!801087 () Bool)

(assert (=> b!1204209 (=> (not res!801087) (not e!683897))))

(assert (=> b!1204209 (= res!801087 (arrayNoDuplicates!0 lt!545737 #b00000000000000000000000000000000 Nil!26503))))

(declare-fun b!1204210 () Bool)

(declare-fun e!683899 () Unit!39839)

(declare-fun lt!545744 () Unit!39839)

(assert (=> b!1204210 (= e!683899 lt!545744)))

(assert (=> b!1204210 (= lt!545744 call!57960)))

(assert (=> b!1204210 call!57962))

(declare-fun b!1204211 () Bool)

(assert (=> b!1204211 (= e!683900 true)))

(declare-fun lt!545738 () Unit!39839)

(assert (=> b!1204211 (= lt!545738 e!683894)))

(declare-fun lt!545741 () Bool)

(assert (=> b!1204211 (= c!118144 (and (not lt!545741) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204211 (= lt!545741 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1204212 () Bool)

(assert (=> b!1204212 (= e!683903 (= call!57964 call!57959))))

(declare-fun b!1204213 () Bool)

(declare-fun res!801082 () Bool)

(assert (=> b!1204213 (=> (not res!801082) (not e!683902))))

(assert (=> b!1204213 (= res!801082 (and (= (size!38176 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38175 _keys!1208) (size!38176 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1204214 () Bool)

(declare-fun Unit!39841 () Unit!39839)

(assert (=> b!1204214 (= e!683899 Unit!39841)))

(declare-fun b!1204215 () Bool)

(declare-fun e!683901 () Bool)

(declare-fun tp_is_empty!30595 () Bool)

(assert (=> b!1204215 (= e!683901 tp_is_empty!30595)))

(declare-fun mapNonEmpty!47735 () Bool)

(declare-fun tp!90662 () Bool)

(assert (=> mapNonEmpty!47735 (= mapRes!47735 (and tp!90662 e!683901))))

(declare-fun mapValue!47735 () ValueCell!14588)

(declare-fun mapKey!47735 () (_ BitVec 32))

(declare-fun mapRest!47735 () (Array (_ BitVec 32) ValueCell!14588))

(assert (=> mapNonEmpty!47735 (= (arr!37639 _values!996) (store mapRest!47735 mapKey!47735 mapValue!47735))))

(declare-fun b!1204216 () Bool)

(assert (=> b!1204216 (= e!683896 tp_is_empty!30595)))

(declare-fun b!1204217 () Bool)

(declare-fun res!801092 () Bool)

(assert (=> b!1204217 (=> (not res!801092) (not e!683902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204217 (= res!801092 (validKeyInArray!0 k0!934))))

(declare-fun b!1204218 () Bool)

(assert (=> b!1204218 call!57962))

(declare-fun lt!545747 () Unit!39839)

(assert (=> b!1204218 (= lt!545747 call!57960)))

(declare-fun e!683890 () Unit!39839)

(assert (=> b!1204218 (= e!683890 lt!545747)))

(declare-fun b!1204219 () Bool)

(declare-fun c!118143 () Bool)

(assert (=> b!1204219 (= c!118143 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545741))))

(assert (=> b!1204219 (= e!683890 e!683899)))

(declare-fun b!1204220 () Bool)

(declare-fun res!801091 () Bool)

(assert (=> b!1204220 (=> (not res!801091) (not e!683902))))

(assert (=> b!1204220 (= res!801091 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38175 _keys!1208))))))

(declare-fun b!1204221 () Bool)

(assert (=> b!1204221 (= e!683894 e!683890)))

(assert (=> b!1204221 (= c!118142 (and (not lt!545741) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!801094 () Bool)

(assert (=> start!100804 (=> (not res!801094) (not e!683902))))

(assert (=> start!100804 (= res!801094 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38175 _keys!1208))))))

(assert (=> start!100804 e!683902))

(assert (=> start!100804 tp_is_empty!30595))

(declare-fun array_inv!28746 (array!77999) Bool)

(assert (=> start!100804 (array_inv!28746 _keys!1208)))

(assert (=> start!100804 true))

(assert (=> start!100804 tp!90663))

(declare-fun array_inv!28747 (array!78001) Bool)

(assert (=> start!100804 (and (array_inv!28747 _values!996) e!683895)))

(declare-fun bm!57958 () Bool)

(assert (=> bm!57958 (= call!57961 (contains!6926 (ite c!118144 lt!545740 call!57958) k0!934))))

(assert (= (and start!100804 res!801094) b!1204207))

(assert (= (and b!1204207 res!801086) b!1204213))

(assert (= (and b!1204213 res!801082) b!1204201))

(assert (= (and b!1204201 res!801083) b!1204200))

(assert (= (and b!1204200 res!801088) b!1204220))

(assert (= (and b!1204220 res!801091) b!1204217))

(assert (= (and b!1204217 res!801092) b!1204206))

(assert (= (and b!1204206 res!801085) b!1204199))

(assert (= (and b!1204199 res!801090) b!1204209))

(assert (= (and b!1204209 res!801087) b!1204198))

(assert (= (and b!1204198 (not res!801084)) b!1204203))

(assert (= (and b!1204203 (not res!801093)) b!1204197))

(assert (= (and b!1204197 c!118141) b!1204204))

(assert (= (and b!1204197 (not c!118141)) b!1204212))

(assert (= (or b!1204204 b!1204212) bm!57954))

(assert (= (or b!1204204 b!1204212) bm!57956))

(assert (= (and b!1204197 (not res!801089)) b!1204205))

(assert (= (and b!1204205 (not res!801081)) b!1204211))

(assert (= (and b!1204211 c!118144) b!1204208))

(assert (= (and b!1204211 (not c!118144)) b!1204221))

(assert (= (and b!1204221 c!118142) b!1204218))

(assert (= (and b!1204221 (not c!118142)) b!1204219))

(assert (= (and b!1204219 c!118143) b!1204210))

(assert (= (and b!1204219 (not c!118143)) b!1204214))

(assert (= (or b!1204218 b!1204210) bm!57961))

(assert (= (or b!1204218 b!1204210) bm!57960))

(assert (= (or b!1204218 b!1204210) bm!57955))

(assert (= (or b!1204208 bm!57955) bm!57958))

(assert (= (or b!1204208 bm!57961) bm!57959))

(assert (= (or b!1204208 bm!57960) bm!57957))

(assert (= (and b!1204202 condMapEmpty!47735) mapIsEmpty!47735))

(assert (= (and b!1204202 (not condMapEmpty!47735)) mapNonEmpty!47735))

(get-info :version)

(assert (= (and mapNonEmpty!47735 ((_ is ValueCellFull!14588) mapValue!47735)) b!1204215))

(assert (= (and b!1204202 ((_ is ValueCellFull!14588) mapDefault!47735)) b!1204216))

(assert (= start!100804 b!1204202))

(declare-fun b_lambda!21081 () Bool)

(assert (=> (not b_lambda!21081) (not b!1204203)))

(declare-fun t!39368 () Bool)

(declare-fun tb!10683 () Bool)

(assert (=> (and start!100804 (= defaultEntry!1004 defaultEntry!1004) t!39368) tb!10683))

(declare-fun result!21951 () Bool)

(assert (=> tb!10683 (= result!21951 tp_is_empty!30595)))

(assert (=> b!1204203 t!39368))

(declare-fun b_and!42673 () Bool)

(assert (= b_and!42671 (and (=> t!39368 result!21951) b_and!42673)))

(declare-fun m!1110221 () Bool)

(assert (=> bm!57959 m!1110221))

(declare-fun m!1110223 () Bool)

(assert (=> b!1204208 m!1110223))

(declare-fun m!1110225 () Bool)

(assert (=> b!1204208 m!1110225))

(assert (=> b!1204208 m!1110225))

(declare-fun m!1110227 () Bool)

(assert (=> b!1204208 m!1110227))

(declare-fun m!1110229 () Bool)

(assert (=> b!1204205 m!1110229))

(declare-fun m!1110231 () Bool)

(assert (=> b!1204205 m!1110231))

(declare-fun m!1110233 () Bool)

(assert (=> b!1204203 m!1110233))

(declare-fun m!1110235 () Bool)

(assert (=> b!1204203 m!1110235))

(declare-fun m!1110237 () Bool)

(assert (=> b!1204203 m!1110237))

(declare-fun m!1110239 () Bool)

(assert (=> b!1204203 m!1110239))

(declare-fun m!1110241 () Bool)

(assert (=> b!1204217 m!1110241))

(declare-fun m!1110243 () Bool)

(assert (=> bm!57957 m!1110243))

(declare-fun m!1110245 () Bool)

(assert (=> bm!57954 m!1110245))

(declare-fun m!1110247 () Bool)

(assert (=> b!1204198 m!1110247))

(declare-fun m!1110249 () Bool)

(assert (=> b!1204198 m!1110249))

(declare-fun m!1110251 () Bool)

(assert (=> b!1204201 m!1110251))

(declare-fun m!1110253 () Bool)

(assert (=> b!1204200 m!1110253))

(declare-fun m!1110255 () Bool)

(assert (=> b!1204204 m!1110255))

(declare-fun m!1110257 () Bool)

(assert (=> b!1204206 m!1110257))

(declare-fun m!1110259 () Bool)

(assert (=> start!100804 m!1110259))

(declare-fun m!1110261 () Bool)

(assert (=> start!100804 m!1110261))

(declare-fun m!1110263 () Bool)

(assert (=> b!1204207 m!1110263))

(declare-fun m!1110265 () Bool)

(assert (=> mapNonEmpty!47735 m!1110265))

(declare-fun m!1110267 () Bool)

(assert (=> b!1204209 m!1110267))

(declare-fun m!1110269 () Bool)

(assert (=> bm!57956 m!1110269))

(declare-fun m!1110271 () Bool)

(assert (=> b!1204197 m!1110271))

(declare-fun m!1110273 () Bool)

(assert (=> b!1204197 m!1110273))

(declare-fun m!1110275 () Bool)

(assert (=> b!1204199 m!1110275))

(declare-fun m!1110277 () Bool)

(assert (=> b!1204199 m!1110277))

(declare-fun m!1110279 () Bool)

(assert (=> bm!57958 m!1110279))

(check-sat (not b!1204197) (not bm!57958) (not b!1204198) (not b!1204200) (not b!1204203) (not mapNonEmpty!47735) (not bm!57956) (not bm!57954) (not bm!57957) (not b!1204204) (not b!1204217) (not start!100804) (not b!1204208) b_and!42673 (not b!1204201) (not b!1204207) (not b_lambda!21081) (not b_next!25891) (not b!1204199) (not b!1204209) (not b!1204205) tp_is_empty!30595 (not bm!57959))
(check-sat b_and!42673 (not b_next!25891))
