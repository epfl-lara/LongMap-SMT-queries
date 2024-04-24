; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101856 () Bool)

(assert start!101856)

(declare-fun b_free!26341 () Bool)

(declare-fun b_next!26341 () Bool)

(assert (=> start!101856 (= b_free!26341 (not b_next!26341))))

(declare-fun tp!92065 () Bool)

(declare-fun b_and!43927 () Bool)

(assert (=> start!101856 (= tp!92065 b_and!43927)))

(declare-fun mapIsEmpty!48463 () Bool)

(declare-fun mapRes!48463 () Bool)

(assert (=> mapIsEmpty!48463 mapRes!48463))

(declare-fun res!812185 () Bool)

(declare-fun e!694685 () Bool)

(assert (=> start!101856 (=> (not res!812185) (not e!694685))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78911 0))(
  ( (array!78912 (arr!38077 (Array (_ BitVec 32) (_ BitVec 64))) (size!38614 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78911)

(assert (=> start!101856 (= res!812185 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38614 _keys!1208))))))

(assert (=> start!101856 e!694685))

(declare-fun tp_is_empty!31045 () Bool)

(assert (=> start!101856 tp_is_empty!31045))

(declare-fun array_inv!29054 (array!78911) Bool)

(assert (=> start!101856 (array_inv!29054 _keys!1208)))

(assert (=> start!101856 true))

(assert (=> start!101856 tp!92065))

(declare-datatypes ((V!46521 0))(
  ( (V!46522 (val!15579 Int)) )
))
(declare-datatypes ((ValueCell!14813 0))(
  ( (ValueCellFull!14813 (v!18236 V!46521)) (EmptyCell!14813) )
))
(declare-datatypes ((array!78913 0))(
  ( (array!78914 (arr!38078 (Array (_ BitVec 32) ValueCell!14813)) (size!38615 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78913)

(declare-fun e!694692 () Bool)

(declare-fun array_inv!29055 (array!78913) Bool)

(assert (=> start!101856 (and (array_inv!29055 _values!996) e!694692)))

(declare-fun b!1223062 () Bool)

(declare-fun res!812169 () Bool)

(declare-fun e!694687 () Bool)

(assert (=> b!1223062 (=> res!812169 e!694687)))

(declare-datatypes ((List!26885 0))(
  ( (Nil!26882) (Cons!26881 (h!28099 (_ BitVec 64)) (t!40198 List!26885)) )
))
(declare-fun contains!7063 (List!26885 (_ BitVec 64)) Bool)

(assert (=> b!1223062 (= res!812169 (contains!7063 Nil!26882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1223063 () Bool)

(declare-fun e!694689 () Bool)

(assert (=> b!1223063 (= e!694692 (and e!694689 mapRes!48463))))

(declare-fun condMapEmpty!48463 () Bool)

(declare-fun mapDefault!48463 () ValueCell!14813)

(assert (=> b!1223063 (= condMapEmpty!48463 (= (arr!38078 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14813)) mapDefault!48463)))))

(declare-fun b!1223064 () Bool)

(declare-fun res!812183 () Bool)

(assert (=> b!1223064 (=> (not res!812183) (not e!694685))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1223064 (= res!812183 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38614 _keys!1208))))))

(declare-fun b!1223065 () Bool)

(declare-fun e!694683 () Bool)

(declare-fun e!694688 () Bool)

(assert (=> b!1223065 (= e!694683 (not e!694688))))

(declare-fun res!812168 () Bool)

(assert (=> b!1223065 (=> res!812168 e!694688)))

(assert (=> b!1223065 (= res!812168 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223065 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40438 0))(
  ( (Unit!40439) )
))
(declare-fun lt!556247 () Unit!40438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78911 (_ BitVec 64) (_ BitVec 32)) Unit!40438)

(assert (=> b!1223065 (= lt!556247 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223066 () Bool)

(declare-fun res!812174 () Bool)

(assert (=> b!1223066 (=> (not res!812174) (not e!694685))))

(declare-fun arrayNoDuplicates!0 (array!78911 (_ BitVec 32) List!26885) Bool)

(assert (=> b!1223066 (= res!812174 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26882))))

(declare-fun b!1223067 () Bool)

(assert (=> b!1223067 (= e!694689 tp_is_empty!31045)))

(declare-fun b!1223068 () Bool)

(declare-fun e!694693 () Bool)

(declare-fun e!694690 () Bool)

(assert (=> b!1223068 (= e!694693 e!694690)))

(declare-fun res!812181 () Bool)

(assert (=> b!1223068 (=> res!812181 e!694690)))

(assert (=> b!1223068 (= res!812181 (not (= (select (arr!38077 _keys!1208) from!1455) k0!934)))))

(declare-fun e!694686 () Bool)

(assert (=> b!1223068 e!694686))

(declare-fun res!812184 () Bool)

(assert (=> b!1223068 (=> (not res!812184) (not e!694686))))

(declare-datatypes ((tuple2!20074 0))(
  ( (tuple2!20075 (_1!10048 (_ BitVec 64)) (_2!10048 V!46521)) )
))
(declare-datatypes ((List!26886 0))(
  ( (Nil!26883) (Cons!26882 (h!28100 tuple2!20074) (t!40199 List!26886)) )
))
(declare-datatypes ((ListLongMap!18051 0))(
  ( (ListLongMap!18052 (toList!9041 List!26886)) )
))
(declare-fun lt!556245 () ListLongMap!18051)

(declare-fun lt!556242 () V!46521)

(declare-fun lt!556250 () ListLongMap!18051)

(declare-fun +!4146 (ListLongMap!18051 tuple2!20074) ListLongMap!18051)

(declare-fun get!19478 (ValueCell!14813 V!46521) V!46521)

(assert (=> b!1223068 (= res!812184 (= lt!556245 (+!4146 lt!556250 (tuple2!20075 (select (arr!38077 _keys!1208) from!1455) (get!19478 (select (arr!38078 _values!996) from!1455) lt!556242)))))))

(declare-fun b!1223069 () Bool)

(declare-fun res!812179 () Bool)

(assert (=> b!1223069 (=> (not res!812179) (not e!694685))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223069 (= res!812179 (validMask!0 mask!1564))))

(declare-fun b!1223070 () Bool)

(declare-fun res!812175 () Bool)

(assert (=> b!1223070 (=> (not res!812175) (not e!694685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78911 (_ BitVec 32)) Bool)

(assert (=> b!1223070 (= res!812175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223071 () Bool)

(declare-fun res!812182 () Bool)

(assert (=> b!1223071 (=> (not res!812182) (not e!694685))))

(assert (=> b!1223071 (= res!812182 (= (select (arr!38077 _keys!1208) i!673) k0!934))))

(declare-fun b!1223072 () Bool)

(declare-fun e!694695 () Bool)

(assert (=> b!1223072 (= e!694688 e!694695)))

(declare-fun res!812171 () Bool)

(assert (=> b!1223072 (=> res!812171 e!694695)))

(assert (=> b!1223072 (= res!812171 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46521)

(declare-fun lt!556252 () array!78911)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556241 () array!78913)

(declare-fun getCurrentListMapNoExtraKeys!5495 (array!78911 array!78913 (_ BitVec 32) (_ BitVec 32) V!46521 V!46521 (_ BitVec 32) Int) ListLongMap!18051)

(assert (=> b!1223072 (= lt!556245 (getCurrentListMapNoExtraKeys!5495 lt!556252 lt!556241 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223072 (= lt!556241 (array!78914 (store (arr!38078 _values!996) i!673 (ValueCellFull!14813 lt!556242)) (size!38615 _values!996)))))

(declare-fun dynLambda!3396 (Int (_ BitVec 64)) V!46521)

(assert (=> b!1223072 (= lt!556242 (dynLambda!3396 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556246 () ListLongMap!18051)

(assert (=> b!1223072 (= lt!556246 (getCurrentListMapNoExtraKeys!5495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!694684 () Bool)

(declare-fun b!1223073 () Bool)

(assert (=> b!1223073 (= e!694684 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223074 () Bool)

(declare-fun res!812173 () Bool)

(assert (=> b!1223074 (=> (not res!812173) (not e!694683))))

(assert (=> b!1223074 (= res!812173 (arrayNoDuplicates!0 lt!556252 #b00000000000000000000000000000000 Nil!26882))))

(declare-fun b!1223075 () Bool)

(assert (=> b!1223075 (= e!694695 e!694693)))

(declare-fun res!812167 () Bool)

(assert (=> b!1223075 (=> res!812167 e!694693)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223075 (= res!812167 (not (validKeyInArray!0 (select (arr!38077 _keys!1208) from!1455))))))

(declare-fun lt!556251 () ListLongMap!18051)

(assert (=> b!1223075 (= lt!556251 lt!556250)))

(declare-fun lt!556240 () ListLongMap!18051)

(declare-fun -!1924 (ListLongMap!18051 (_ BitVec 64)) ListLongMap!18051)

(assert (=> b!1223075 (= lt!556250 (-!1924 lt!556240 k0!934))))

(assert (=> b!1223075 (= lt!556251 (getCurrentListMapNoExtraKeys!5495 lt!556252 lt!556241 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223075 (= lt!556240 (getCurrentListMapNoExtraKeys!5495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556248 () Unit!40438)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1139 (array!78911 array!78913 (_ BitVec 32) (_ BitVec 32) V!46521 V!46521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40438)

(assert (=> b!1223075 (= lt!556248 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48463 () Bool)

(declare-fun tp!92066 () Bool)

(declare-fun e!694691 () Bool)

(assert (=> mapNonEmpty!48463 (= mapRes!48463 (and tp!92066 e!694691))))

(declare-fun mapValue!48463 () ValueCell!14813)

(declare-fun mapRest!48463 () (Array (_ BitVec 32) ValueCell!14813))

(declare-fun mapKey!48463 () (_ BitVec 32))

(assert (=> mapNonEmpty!48463 (= (arr!38078 _values!996) (store mapRest!48463 mapKey!48463 mapValue!48463))))

(declare-fun b!1223076 () Bool)

(declare-fun res!812172 () Bool)

(assert (=> b!1223076 (=> res!812172 e!694687)))

(declare-fun noDuplicate!1650 (List!26885) Bool)

(assert (=> b!1223076 (= res!812172 (not (noDuplicate!1650 Nil!26882)))))

(declare-fun b!1223077 () Bool)

(assert (=> b!1223077 (= e!694691 tp_is_empty!31045)))

(declare-fun b!1223078 () Bool)

(assert (=> b!1223078 (= e!694687 true)))

(declare-fun lt!556244 () Bool)

(assert (=> b!1223078 (= lt!556244 (contains!7063 Nil!26882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1223079 () Bool)

(assert (=> b!1223079 (= e!694686 e!694684)))

(declare-fun res!812176 () Bool)

(assert (=> b!1223079 (=> res!812176 e!694684)))

(assert (=> b!1223079 (= res!812176 (not (= (select (arr!38077 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223080 () Bool)

(declare-fun res!812170 () Bool)

(assert (=> b!1223080 (=> (not res!812170) (not e!694685))))

(assert (=> b!1223080 (= res!812170 (validKeyInArray!0 k0!934))))

(declare-fun b!1223081 () Bool)

(assert (=> b!1223081 (= e!694690 e!694687)))

(declare-fun res!812177 () Bool)

(assert (=> b!1223081 (=> res!812177 e!694687)))

(assert (=> b!1223081 (= res!812177 (or (bvsge (size!38614 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38614 _keys!1208)) (bvsge from!1455 (size!38614 _keys!1208))))))

(assert (=> b!1223081 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26882)))

(declare-fun lt!556243 () Unit!40438)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78911 (_ BitVec 32) (_ BitVec 32)) Unit!40438)

(assert (=> b!1223081 (= lt!556243 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223081 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556249 () Unit!40438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78911 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40438)

(assert (=> b!1223081 (= lt!556249 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1223082 () Bool)

(assert (=> b!1223082 (= e!694685 e!694683)))

(declare-fun res!812178 () Bool)

(assert (=> b!1223082 (=> (not res!812178) (not e!694683))))

(assert (=> b!1223082 (= res!812178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556252 mask!1564))))

(assert (=> b!1223082 (= lt!556252 (array!78912 (store (arr!38077 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38614 _keys!1208)))))

(declare-fun b!1223083 () Bool)

(declare-fun res!812180 () Bool)

(assert (=> b!1223083 (=> (not res!812180) (not e!694685))))

(assert (=> b!1223083 (= res!812180 (and (= (size!38615 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38614 _keys!1208) (size!38615 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101856 res!812185) b!1223069))

(assert (= (and b!1223069 res!812179) b!1223083))

(assert (= (and b!1223083 res!812180) b!1223070))

(assert (= (and b!1223070 res!812175) b!1223066))

(assert (= (and b!1223066 res!812174) b!1223064))

(assert (= (and b!1223064 res!812183) b!1223080))

(assert (= (and b!1223080 res!812170) b!1223071))

(assert (= (and b!1223071 res!812182) b!1223082))

(assert (= (and b!1223082 res!812178) b!1223074))

(assert (= (and b!1223074 res!812173) b!1223065))

(assert (= (and b!1223065 (not res!812168)) b!1223072))

(assert (= (and b!1223072 (not res!812171)) b!1223075))

(assert (= (and b!1223075 (not res!812167)) b!1223068))

(assert (= (and b!1223068 res!812184) b!1223079))

(assert (= (and b!1223079 (not res!812176)) b!1223073))

(assert (= (and b!1223068 (not res!812181)) b!1223081))

(assert (= (and b!1223081 (not res!812177)) b!1223076))

(assert (= (and b!1223076 (not res!812172)) b!1223062))

(assert (= (and b!1223062 (not res!812169)) b!1223078))

(assert (= (and b!1223063 condMapEmpty!48463) mapIsEmpty!48463))

(assert (= (and b!1223063 (not condMapEmpty!48463)) mapNonEmpty!48463))

(get-info :version)

(assert (= (and mapNonEmpty!48463 ((_ is ValueCellFull!14813) mapValue!48463)) b!1223077))

(assert (= (and b!1223063 ((_ is ValueCellFull!14813) mapDefault!48463)) b!1223067))

(assert (= start!101856 b!1223063))

(declare-fun b_lambda!22277 () Bool)

(assert (=> (not b_lambda!22277) (not b!1223072)))

(declare-fun t!40197 () Bool)

(declare-fun tb!11133 () Bool)

(assert (=> (and start!101856 (= defaultEntry!1004 defaultEntry!1004) t!40197) tb!11133))

(declare-fun result!22885 () Bool)

(assert (=> tb!11133 (= result!22885 tp_is_empty!31045)))

(assert (=> b!1223072 t!40197))

(declare-fun b_and!43929 () Bool)

(assert (= b_and!43927 (and (=> t!40197 result!22885) b_and!43929)))

(declare-fun m!1128275 () Bool)

(assert (=> b!1223076 m!1128275))

(declare-fun m!1128277 () Bool)

(assert (=> start!101856 m!1128277))

(declare-fun m!1128279 () Bool)

(assert (=> start!101856 m!1128279))

(declare-fun m!1128281 () Bool)

(assert (=> b!1223079 m!1128281))

(declare-fun m!1128283 () Bool)

(assert (=> b!1223071 m!1128283))

(declare-fun m!1128285 () Bool)

(assert (=> b!1223075 m!1128285))

(declare-fun m!1128287 () Bool)

(assert (=> b!1223075 m!1128287))

(declare-fun m!1128289 () Bool)

(assert (=> b!1223075 m!1128289))

(assert (=> b!1223075 m!1128281))

(assert (=> b!1223075 m!1128281))

(declare-fun m!1128291 () Bool)

(assert (=> b!1223075 m!1128291))

(declare-fun m!1128293 () Bool)

(assert (=> b!1223075 m!1128293))

(declare-fun m!1128295 () Bool)

(assert (=> b!1223062 m!1128295))

(declare-fun m!1128297 () Bool)

(assert (=> b!1223065 m!1128297))

(declare-fun m!1128299 () Bool)

(assert (=> b!1223065 m!1128299))

(declare-fun m!1128301 () Bool)

(assert (=> mapNonEmpty!48463 m!1128301))

(assert (=> b!1223068 m!1128281))

(declare-fun m!1128303 () Bool)

(assert (=> b!1223068 m!1128303))

(assert (=> b!1223068 m!1128303))

(declare-fun m!1128305 () Bool)

(assert (=> b!1223068 m!1128305))

(declare-fun m!1128307 () Bool)

(assert (=> b!1223068 m!1128307))

(declare-fun m!1128309 () Bool)

(assert (=> b!1223073 m!1128309))

(declare-fun m!1128311 () Bool)

(assert (=> b!1223069 m!1128311))

(declare-fun m!1128313 () Bool)

(assert (=> b!1223081 m!1128313))

(declare-fun m!1128315 () Bool)

(assert (=> b!1223081 m!1128315))

(declare-fun m!1128317 () Bool)

(assert (=> b!1223081 m!1128317))

(declare-fun m!1128319 () Bool)

(assert (=> b!1223081 m!1128319))

(declare-fun m!1128321 () Bool)

(assert (=> b!1223074 m!1128321))

(declare-fun m!1128323 () Bool)

(assert (=> b!1223078 m!1128323))

(declare-fun m!1128325 () Bool)

(assert (=> b!1223080 m!1128325))

(declare-fun m!1128327 () Bool)

(assert (=> b!1223066 m!1128327))

(declare-fun m!1128329 () Bool)

(assert (=> b!1223082 m!1128329))

(declare-fun m!1128331 () Bool)

(assert (=> b!1223082 m!1128331))

(declare-fun m!1128333 () Bool)

(assert (=> b!1223070 m!1128333))

(declare-fun m!1128335 () Bool)

(assert (=> b!1223072 m!1128335))

(declare-fun m!1128337 () Bool)

(assert (=> b!1223072 m!1128337))

(declare-fun m!1128339 () Bool)

(assert (=> b!1223072 m!1128339))

(declare-fun m!1128341 () Bool)

(assert (=> b!1223072 m!1128341))

(check-sat (not b!1223075) (not mapNonEmpty!48463) (not b!1223074) b_and!43929 (not b!1223080) (not b_next!26341) (not b!1223082) tp_is_empty!31045 (not b!1223076) (not start!101856) (not b!1223072) (not b!1223081) (not b!1223068) (not b!1223070) (not b_lambda!22277) (not b!1223069) (not b!1223065) (not b!1223066) (not b!1223073) (not b!1223078) (not b!1223062))
(check-sat b_and!43929 (not b_next!26341))
