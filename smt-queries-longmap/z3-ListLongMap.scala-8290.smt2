; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101006 () Bool)

(assert start!101006)

(declare-fun b_free!26011 () Bool)

(declare-fun b_next!26011 () Bool)

(assert (=> start!101006 (= b_free!26011 (not b_next!26011))))

(declare-fun tp!91049 () Bool)

(declare-fun b_and!43077 () Bool)

(assert (=> start!101006 (= tp!91049 b_and!43077)))

(declare-fun b!1210081 () Bool)

(declare-datatypes ((Unit!39949 0))(
  ( (Unit!39950) )
))
(declare-fun e!687242 () Unit!39949)

(declare-fun Unit!39951 () Unit!39949)

(assert (=> b!1210081 (= e!687242 Unit!39951)))

(declare-fun b!1210082 () Bool)

(declare-fun call!59550 () Bool)

(assert (=> b!1210082 call!59550))

(declare-fun lt!549252 () Unit!39949)

(declare-fun call!59549 () Unit!39949)

(assert (=> b!1210082 (= lt!549252 call!59549)))

(declare-fun e!687236 () Unit!39949)

(assert (=> b!1210082 (= e!687236 lt!549252)))

(declare-fun mapNonEmpty!47941 () Bool)

(declare-fun mapRes!47941 () Bool)

(declare-fun tp!91048 () Bool)

(declare-fun e!687231 () Bool)

(assert (=> mapNonEmpty!47941 (= mapRes!47941 (and tp!91048 e!687231))))

(declare-fun mapKey!47941 () (_ BitVec 32))

(declare-datatypes ((V!46081 0))(
  ( (V!46082 (val!15414 Int)) )
))
(declare-datatypes ((ValueCell!14648 0))(
  ( (ValueCellFull!14648 (v!18064 V!46081)) (EmptyCell!14648) )
))
(declare-datatypes ((array!78128 0))(
  ( (array!78129 (arr!37701 (Array (_ BitVec 32) ValueCell!14648)) (size!38239 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78128)

(declare-fun mapValue!47941 () ValueCell!14648)

(declare-fun mapRest!47941 () (Array (_ BitVec 32) ValueCell!14648))

(assert (=> mapNonEmpty!47941 (= (arr!37701 _values!996) (store mapRest!47941 mapKey!47941 mapValue!47941))))

(declare-fun bm!59546 () Bool)

(declare-datatypes ((tuple2!19868 0))(
  ( (tuple2!19869 (_1!9945 (_ BitVec 64)) (_2!9945 V!46081)) )
))
(declare-datatypes ((List!26647 0))(
  ( (Nil!26644) (Cons!26643 (h!27852 tuple2!19868) (t!39629 List!26647)) )
))
(declare-datatypes ((ListLongMap!17837 0))(
  ( (ListLongMap!17838 (toList!8934 List!26647)) )
))
(declare-fun call!59556 () ListLongMap!17837)

(declare-fun call!59555 () ListLongMap!17837)

(assert (=> bm!59546 (= call!59556 call!59555)))

(declare-fun b!1210083 () Bool)

(declare-fun e!687233 () Bool)

(declare-fun e!687237 () Bool)

(assert (=> b!1210083 (= e!687233 e!687237)))

(declare-fun res!804136 () Bool)

(assert (=> b!1210083 (=> (not res!804136) (not e!687237))))

(declare-datatypes ((array!78130 0))(
  ( (array!78131 (arr!37702 (Array (_ BitVec 32) (_ BitVec 64))) (size!38240 (_ BitVec 32))) )
))
(declare-fun lt!549240 () array!78130)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78130 (_ BitVec 32)) Bool)

(assert (=> b!1210083 (= res!804136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549240 mask!1564))))

(declare-fun _keys!1208 () array!78130)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210083 (= lt!549240 (array!78131 (store (arr!37702 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38240 _keys!1208)))))

(declare-fun b!1210084 () Bool)

(declare-fun c!119183 () Bool)

(declare-fun lt!549241 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1210084 (= c!119183 (and (not lt!549241) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687232 () Unit!39949)

(declare-fun e!687239 () Unit!39949)

(assert (=> b!1210084 (= e!687232 e!687239)))

(declare-fun zeroValue!944 () V!46081)

(declare-fun call!59553 () ListLongMap!17837)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!59547 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46081)

(declare-fun getCurrentListMapNoExtraKeys!5376 (array!78130 array!78128 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 32) Int) ListLongMap!17837)

(assert (=> bm!59547 (= call!59553 (getCurrentListMapNoExtraKeys!5376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119184 () Bool)

(declare-fun bm!59548 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!549254 () ListLongMap!17837)

(declare-fun call!59554 () Bool)

(declare-fun contains!6942 (ListLongMap!17837 (_ BitVec 64)) Bool)

(assert (=> bm!59548 (= call!59554 (contains!6942 (ite c!119184 lt!549254 call!59556) k0!934))))

(declare-fun e!687228 () Bool)

(declare-fun b!1210086 () Bool)

(declare-fun arrayContainsKey!0 (array!78130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210086 (= e!687228 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210087 () Bool)

(declare-fun e!687243 () Bool)

(assert (=> b!1210087 (= e!687243 (bvslt from!1455 (size!38239 _values!996)))))

(declare-fun lt!549244 () Unit!39949)

(assert (=> b!1210087 (= lt!549244 e!687242)))

(declare-fun c!119182 () Bool)

(declare-fun lt!549239 () ListLongMap!17837)

(assert (=> b!1210087 (= c!119182 (contains!6942 lt!549239 k0!934))))

(assert (=> b!1210087 (= lt!549239 (getCurrentListMapNoExtraKeys!5376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210088 () Bool)

(declare-fun e!687229 () Bool)

(declare-fun call!59551 () ListLongMap!17837)

(assert (=> b!1210088 (= e!687229 (= call!59551 call!59553))))

(declare-fun b!1210089 () Bool)

(declare-fun res!804139 () Bool)

(assert (=> b!1210089 (=> (not res!804139) (not e!687233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210089 (= res!804139 (validMask!0 mask!1564))))

(declare-fun bm!59549 () Bool)

(declare-fun +!4058 (ListLongMap!17837 tuple2!19868) ListLongMap!17837)

(assert (=> bm!59549 (= call!59555 (+!4058 lt!549239 (ite (or c!119184 c!119183) (tuple2!19869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210090 () Bool)

(declare-fun res!804138 () Bool)

(assert (=> b!1210090 (=> (not res!804138) (not e!687233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210090 (= res!804138 (validKeyInArray!0 k0!934))))

(declare-fun b!1210091 () Bool)

(declare-fun res!804137 () Bool)

(assert (=> b!1210091 (=> (not res!804137) (not e!687233))))

(assert (=> b!1210091 (= res!804137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210092 () Bool)

(declare-fun res!804142 () Bool)

(assert (=> b!1210092 (=> (not res!804142) (not e!687237))))

(declare-datatypes ((List!26648 0))(
  ( (Nil!26645) (Cons!26644 (h!27853 (_ BitVec 64)) (t!39630 List!26648)) )
))
(declare-fun arrayNoDuplicates!0 (array!78130 (_ BitVec 32) List!26648) Bool)

(assert (=> b!1210092 (= res!804142 (arrayNoDuplicates!0 lt!549240 #b00000000000000000000000000000000 Nil!26645))))

(declare-fun b!1210093 () Bool)

(declare-fun Unit!39952 () Unit!39949)

(assert (=> b!1210093 (= e!687242 Unit!39952)))

(assert (=> b!1210093 (= lt!549241 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210093 (= c!119184 (and (not lt!549241) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549256 () Unit!39949)

(assert (=> b!1210093 (= lt!549256 e!687232)))

(declare-fun lt!549250 () Unit!39949)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!585 (array!78130 array!78128 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 64) (_ BitVec 32) Int) Unit!39949)

(assert (=> b!1210093 (= lt!549250 (lemmaListMapContainsThenArrayContainsFrom!585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119186 () Bool)

(assert (=> b!1210093 (= c!119186 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804143 () Bool)

(declare-fun e!687230 () Bool)

(assert (=> b!1210093 (= res!804143 e!687230)))

(assert (=> b!1210093 (=> (not res!804143) (not e!687228))))

(assert (=> b!1210093 e!687228))

(declare-fun lt!549251 () Unit!39949)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78130 (_ BitVec 32) (_ BitVec 32)) Unit!39949)

(assert (=> b!1210093 (= lt!549251 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210093 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26645)))

(declare-fun lt!549253 () Unit!39949)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78130 (_ BitVec 64) (_ BitVec 32) List!26648) Unit!39949)

(assert (=> b!1210093 (= lt!549253 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26645))))

(assert (=> b!1210093 false))

(declare-fun b!1210094 () Bool)

(declare-fun lt!549242 () Unit!39949)

(assert (=> b!1210094 (= e!687239 lt!549242)))

(assert (=> b!1210094 (= lt!549242 call!59549)))

(assert (=> b!1210094 call!59550))

(declare-fun b!1210095 () Bool)

(declare-fun res!804146 () Bool)

(assert (=> b!1210095 (=> (not res!804146) (not e!687233))))

(assert (=> b!1210095 (= res!804146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26645))))

(declare-fun b!1210096 () Bool)

(assert (=> b!1210096 (= e!687230 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549241) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210097 () Bool)

(declare-fun res!804145 () Bool)

(assert (=> b!1210097 (=> (not res!804145) (not e!687233))))

(assert (=> b!1210097 (= res!804145 (and (= (size!38239 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38240 _keys!1208) (size!38239 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!59550 () Bool)

(declare-fun call!59552 () Unit!39949)

(assert (=> bm!59550 (= call!59549 call!59552)))

(declare-fun b!1210098 () Bool)

(declare-fun e!687241 () Bool)

(assert (=> b!1210098 (= e!687237 (not e!687241))))

(declare-fun res!804147 () Bool)

(assert (=> b!1210098 (=> res!804147 e!687241)))

(assert (=> b!1210098 (= res!804147 (bvsgt from!1455 i!673))))

(assert (=> b!1210098 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549249 () Unit!39949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78130 (_ BitVec 64) (_ BitVec 32)) Unit!39949)

(assert (=> b!1210098 (= lt!549249 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59551 () Bool)

(declare-fun addStillContains!1042 (ListLongMap!17837 (_ BitVec 64) V!46081 (_ BitVec 64)) Unit!39949)

(assert (=> bm!59551 (= call!59552 (addStillContains!1042 (ite c!119184 lt!549254 lt!549239) (ite c!119184 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119184 minValue!944 (ite c!119183 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!59552 () Bool)

(assert (=> bm!59552 (= call!59550 call!59554)))

(declare-fun b!1210085 () Bool)

(assert (=> b!1210085 (= e!687239 e!687236)))

(declare-fun c!119185 () Bool)

(assert (=> b!1210085 (= c!119185 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549241))))

(declare-fun res!804144 () Bool)

(assert (=> start!101006 (=> (not res!804144) (not e!687233))))

(assert (=> start!101006 (= res!804144 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38240 _keys!1208))))))

(assert (=> start!101006 e!687233))

(declare-fun tp_is_empty!30715 () Bool)

(assert (=> start!101006 tp_is_empty!30715))

(declare-fun array_inv!28828 (array!78130) Bool)

(assert (=> start!101006 (array_inv!28828 _keys!1208)))

(assert (=> start!101006 true))

(assert (=> start!101006 tp!91049))

(declare-fun e!687234 () Bool)

(declare-fun array_inv!28829 (array!78128) Bool)

(assert (=> start!101006 (and (array_inv!28829 _values!996) e!687234)))

(declare-fun b!1210099 () Bool)

(declare-fun -!1814 (ListLongMap!17837 (_ BitVec 64)) ListLongMap!17837)

(assert (=> b!1210099 (= e!687229 (= call!59551 (-!1814 call!59553 k0!934)))))

(declare-fun b!1210100 () Bool)

(declare-fun e!687238 () Bool)

(assert (=> b!1210100 (= e!687238 e!687243)))

(declare-fun res!804135 () Bool)

(assert (=> b!1210100 (=> res!804135 e!687243)))

(assert (=> b!1210100 (= res!804135 (not (= (select (arr!37702 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210100 e!687229))

(declare-fun c!119187 () Bool)

(assert (=> b!1210100 (= c!119187 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549248 () Unit!39949)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 (array!78130 array!78128 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39949)

(assert (=> b!1210100 (= lt!549248 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210101 () Bool)

(assert (=> b!1210101 (= e!687230 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210102 () Bool)

(assert (=> b!1210102 (contains!6942 (+!4058 lt!549254 (tuple2!19869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!549246 () Unit!39949)

(assert (=> b!1210102 (= lt!549246 call!59552)))

(assert (=> b!1210102 call!59554))

(assert (=> b!1210102 (= lt!549254 call!59555)))

(declare-fun lt!549247 () Unit!39949)

(assert (=> b!1210102 (= lt!549247 (addStillContains!1042 lt!549239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1210102 (= e!687232 lt!549246)))

(declare-fun b!1210103 () Bool)

(declare-fun res!804141 () Bool)

(assert (=> b!1210103 (=> (not res!804141) (not e!687233))))

(assert (=> b!1210103 (= res!804141 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38240 _keys!1208))))))

(declare-fun mapIsEmpty!47941 () Bool)

(assert (=> mapIsEmpty!47941 mapRes!47941))

(declare-fun b!1210104 () Bool)

(assert (=> b!1210104 (= e!687231 tp_is_empty!30715)))

(declare-fun lt!549255 () array!78128)

(declare-fun bm!59553 () Bool)

(assert (=> bm!59553 (= call!59551 (getCurrentListMapNoExtraKeys!5376 lt!549240 lt!549255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210105 () Bool)

(declare-fun e!687235 () Bool)

(assert (=> b!1210105 (= e!687234 (and e!687235 mapRes!47941))))

(declare-fun condMapEmpty!47941 () Bool)

(declare-fun mapDefault!47941 () ValueCell!14648)

(assert (=> b!1210105 (= condMapEmpty!47941 (= (arr!37701 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14648)) mapDefault!47941)))))

(declare-fun b!1210106 () Bool)

(assert (=> b!1210106 (= e!687241 e!687238)))

(declare-fun res!804134 () Bool)

(assert (=> b!1210106 (=> res!804134 e!687238)))

(assert (=> b!1210106 (= res!804134 (not (= from!1455 i!673)))))

(declare-fun lt!549245 () ListLongMap!17837)

(assert (=> b!1210106 (= lt!549245 (getCurrentListMapNoExtraKeys!5376 lt!549240 lt!549255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3237 (Int (_ BitVec 64)) V!46081)

(assert (=> b!1210106 (= lt!549255 (array!78129 (store (arr!37701 _values!996) i!673 (ValueCellFull!14648 (dynLambda!3237 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38239 _values!996)))))

(declare-fun lt!549243 () ListLongMap!17837)

(assert (=> b!1210106 (= lt!549243 (getCurrentListMapNoExtraKeys!5376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210107 () Bool)

(assert (=> b!1210107 (= e!687235 tp_is_empty!30715)))

(declare-fun b!1210108 () Bool)

(declare-fun Unit!39953 () Unit!39949)

(assert (=> b!1210108 (= e!687236 Unit!39953)))

(declare-fun b!1210109 () Bool)

(declare-fun res!804140 () Bool)

(assert (=> b!1210109 (=> (not res!804140) (not e!687233))))

(assert (=> b!1210109 (= res!804140 (= (select (arr!37702 _keys!1208) i!673) k0!934))))

(assert (= (and start!101006 res!804144) b!1210089))

(assert (= (and b!1210089 res!804139) b!1210097))

(assert (= (and b!1210097 res!804145) b!1210091))

(assert (= (and b!1210091 res!804137) b!1210095))

(assert (= (and b!1210095 res!804146) b!1210103))

(assert (= (and b!1210103 res!804141) b!1210090))

(assert (= (and b!1210090 res!804138) b!1210109))

(assert (= (and b!1210109 res!804140) b!1210083))

(assert (= (and b!1210083 res!804136) b!1210092))

(assert (= (and b!1210092 res!804142) b!1210098))

(assert (= (and b!1210098 (not res!804147)) b!1210106))

(assert (= (and b!1210106 (not res!804134)) b!1210100))

(assert (= (and b!1210100 c!119187) b!1210099))

(assert (= (and b!1210100 (not c!119187)) b!1210088))

(assert (= (or b!1210099 b!1210088) bm!59553))

(assert (= (or b!1210099 b!1210088) bm!59547))

(assert (= (and b!1210100 (not res!804135)) b!1210087))

(assert (= (and b!1210087 c!119182) b!1210093))

(assert (= (and b!1210087 (not c!119182)) b!1210081))

(assert (= (and b!1210093 c!119184) b!1210102))

(assert (= (and b!1210093 (not c!119184)) b!1210084))

(assert (= (and b!1210084 c!119183) b!1210094))

(assert (= (and b!1210084 (not c!119183)) b!1210085))

(assert (= (and b!1210085 c!119185) b!1210082))

(assert (= (and b!1210085 (not c!119185)) b!1210108))

(assert (= (or b!1210094 b!1210082) bm!59550))

(assert (= (or b!1210094 b!1210082) bm!59546))

(assert (= (or b!1210094 b!1210082) bm!59552))

(assert (= (or b!1210102 bm!59552) bm!59548))

(assert (= (or b!1210102 bm!59550) bm!59551))

(assert (= (or b!1210102 bm!59546) bm!59549))

(assert (= (and b!1210093 c!119186) b!1210101))

(assert (= (and b!1210093 (not c!119186)) b!1210096))

(assert (= (and b!1210093 res!804143) b!1210086))

(assert (= (and b!1210105 condMapEmpty!47941) mapIsEmpty!47941))

(assert (= (and b!1210105 (not condMapEmpty!47941)) mapNonEmpty!47941))

(get-info :version)

(assert (= (and mapNonEmpty!47941 ((_ is ValueCellFull!14648) mapValue!47941)) b!1210104))

(assert (= (and b!1210105 ((_ is ValueCellFull!14648) mapDefault!47941)) b!1210107))

(assert (= start!101006 b!1210105))

(declare-fun b_lambda!21585 () Bool)

(assert (=> (not b_lambda!21585) (not b!1210106)))

(declare-fun t!39628 () Bool)

(declare-fun tb!10803 () Bool)

(assert (=> (and start!101006 (= defaultEntry!1004 defaultEntry!1004) t!39628) tb!10803))

(declare-fun result!22207 () Bool)

(assert (=> tb!10803 (= result!22207 tp_is_empty!30715)))

(assert (=> b!1210106 t!39628))

(declare-fun b_and!43079 () Bool)

(assert (= b_and!43077 (and (=> t!39628 result!22207) b_and!43079)))

(declare-fun m!1115139 () Bool)

(assert (=> b!1210106 m!1115139))

(declare-fun m!1115141 () Bool)

(assert (=> b!1210106 m!1115141))

(declare-fun m!1115143 () Bool)

(assert (=> b!1210106 m!1115143))

(declare-fun m!1115145 () Bool)

(assert (=> b!1210106 m!1115145))

(declare-fun m!1115147 () Bool)

(assert (=> b!1210102 m!1115147))

(assert (=> b!1210102 m!1115147))

(declare-fun m!1115149 () Bool)

(assert (=> b!1210102 m!1115149))

(declare-fun m!1115151 () Bool)

(assert (=> b!1210102 m!1115151))

(declare-fun m!1115153 () Bool)

(assert (=> bm!59549 m!1115153))

(declare-fun m!1115155 () Bool)

(assert (=> b!1210091 m!1115155))

(declare-fun m!1115157 () Bool)

(assert (=> b!1210092 m!1115157))

(declare-fun m!1115159 () Bool)

(assert (=> b!1210099 m!1115159))

(declare-fun m!1115161 () Bool)

(assert (=> b!1210090 m!1115161))

(declare-fun m!1115163 () Bool)

(assert (=> b!1210095 m!1115163))

(declare-fun m!1115165 () Bool)

(assert (=> bm!59548 m!1115165))

(declare-fun m!1115167 () Bool)

(assert (=> start!101006 m!1115167))

(declare-fun m!1115169 () Bool)

(assert (=> start!101006 m!1115169))

(declare-fun m!1115171 () Bool)

(assert (=> bm!59547 m!1115171))

(declare-fun m!1115173 () Bool)

(assert (=> mapNonEmpty!47941 m!1115173))

(declare-fun m!1115175 () Bool)

(assert (=> b!1210083 m!1115175))

(declare-fun m!1115177 () Bool)

(assert (=> b!1210083 m!1115177))

(declare-fun m!1115179 () Bool)

(assert (=> b!1210100 m!1115179))

(declare-fun m!1115181 () Bool)

(assert (=> b!1210100 m!1115181))

(declare-fun m!1115183 () Bool)

(assert (=> bm!59553 m!1115183))

(declare-fun m!1115185 () Bool)

(assert (=> b!1210093 m!1115185))

(declare-fun m!1115187 () Bool)

(assert (=> b!1210093 m!1115187))

(declare-fun m!1115189 () Bool)

(assert (=> b!1210093 m!1115189))

(declare-fun m!1115191 () Bool)

(assert (=> b!1210093 m!1115191))

(declare-fun m!1115193 () Bool)

(assert (=> b!1210086 m!1115193))

(declare-fun m!1115195 () Bool)

(assert (=> b!1210109 m!1115195))

(assert (=> b!1210101 m!1115193))

(declare-fun m!1115197 () Bool)

(assert (=> b!1210098 m!1115197))

(declare-fun m!1115199 () Bool)

(assert (=> b!1210098 m!1115199))

(declare-fun m!1115201 () Bool)

(assert (=> b!1210087 m!1115201))

(assert (=> b!1210087 m!1115171))

(declare-fun m!1115203 () Bool)

(assert (=> b!1210089 m!1115203))

(declare-fun m!1115205 () Bool)

(assert (=> bm!59551 m!1115205))

(check-sat (not bm!59547) (not b!1210099) (not bm!59548) tp_is_empty!30715 b_and!43079 (not b!1210102) (not b!1210089) (not b_next!26011) (not start!101006) (not mapNonEmpty!47941) (not b!1210086) (not b!1210101) (not b!1210087) (not b!1210092) (not bm!59553) (not b!1210090) (not b!1210098) (not b!1210093) (not bm!59549) (not b!1210095) (not b!1210083) (not b!1210091) (not bm!59551) (not b!1210106) (not b!1210100) (not b_lambda!21585))
(check-sat b_and!43079 (not b_next!26011))
