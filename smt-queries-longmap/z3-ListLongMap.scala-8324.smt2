; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101286 () Bool)

(assert start!101286)

(declare-fun b_free!26215 () Bool)

(declare-fun b_next!26215 () Bool)

(assert (=> start!101286 (= b_free!26215 (not b_next!26215))))

(declare-fun tp!91667 () Bool)

(declare-fun b_and!43529 () Bool)

(assert (=> start!101286 (= tp!91667 b_and!43529)))

(declare-fun b!1216972 () Bool)

(declare-fun e!690902 () Bool)

(declare-fun e!690903 () Bool)

(assert (=> b!1216972 (= e!690902 e!690903)))

(declare-fun res!808201 () Bool)

(assert (=> b!1216972 (=> (not res!808201) (not e!690903))))

(declare-datatypes ((array!78530 0))(
  ( (array!78531 (arr!37900 (Array (_ BitVec 32) (_ BitVec 64))) (size!38438 (_ BitVec 32))) )
))
(declare-fun lt!552968 () array!78530)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78530 (_ BitVec 32)) Bool)

(assert (=> b!1216972 (= res!808201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552968 mask!1564))))

(declare-fun _keys!1208 () array!78530)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216972 (= lt!552968 (array!78531 (store (arr!37900 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38438 _keys!1208)))))

(declare-fun b!1216973 () Bool)

(declare-fun e!690904 () Bool)

(declare-fun tp_is_empty!30919 () Bool)

(assert (=> b!1216973 (= e!690904 tp_is_empty!30919)))

(declare-fun b!1216974 () Bool)

(declare-fun res!808204 () Bool)

(assert (=> b!1216974 (=> (not res!808204) (not e!690902))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1216974 (= res!808204 (= (select (arr!37900 _keys!1208) i!673) k0!934))))

(declare-fun b!1216975 () Bool)

(declare-fun res!808198 () Bool)

(assert (=> b!1216975 (=> (not res!808198) (not e!690902))))

(assert (=> b!1216975 (= res!808198 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38438 _keys!1208))))))

(declare-fun b!1216976 () Bool)

(declare-fun res!808202 () Bool)

(assert (=> b!1216976 (=> (not res!808202) (not e!690902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216976 (= res!808202 (validKeyInArray!0 k0!934))))

(declare-fun b!1216977 () Bool)

(declare-fun res!808200 () Bool)

(assert (=> b!1216977 (=> (not res!808200) (not e!690902))))

(declare-datatypes ((List!26818 0))(
  ( (Nil!26815) (Cons!26814 (h!28023 (_ BitVec 64)) (t!40004 List!26818)) )
))
(declare-fun arrayNoDuplicates!0 (array!78530 (_ BitVec 32) List!26818) Bool)

(assert (=> b!1216977 (= res!808200 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26815))))

(declare-fun b!1216978 () Bool)

(declare-fun e!690897 () Bool)

(declare-fun e!690899 () Bool)

(assert (=> b!1216978 (= e!690897 e!690899)))

(declare-fun res!808199 () Bool)

(assert (=> b!1216978 (=> res!808199 e!690899)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216978 (= res!808199 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46353 0))(
  ( (V!46354 (val!15516 Int)) )
))
(declare-fun zeroValue!944 () V!46353)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20040 0))(
  ( (tuple2!20041 (_1!10031 (_ BitVec 64)) (_2!10031 V!46353)) )
))
(declare-datatypes ((List!26819 0))(
  ( (Nil!26816) (Cons!26815 (h!28024 tuple2!20040) (t!40005 List!26819)) )
))
(declare-datatypes ((ListLongMap!18009 0))(
  ( (ListLongMap!18010 (toList!9020 List!26819)) )
))
(declare-fun lt!552964 () ListLongMap!18009)

(declare-fun minValue!944 () V!46353)

(declare-datatypes ((ValueCell!14750 0))(
  ( (ValueCellFull!14750 (v!18168 V!46353)) (EmptyCell!14750) )
))
(declare-datatypes ((array!78532 0))(
  ( (array!78533 (arr!37901 (Array (_ BitVec 32) ValueCell!14750)) (size!38439 (_ BitVec 32))) )
))
(declare-fun lt!552967 () array!78532)

(declare-fun getCurrentListMapNoExtraKeys!5459 (array!78530 array!78532 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) Int) ListLongMap!18009)

(assert (=> b!1216978 (= lt!552964 (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552962 () V!46353)

(declare-fun _values!996 () array!78532)

(assert (=> b!1216978 (= lt!552967 (array!78533 (store (arr!37901 _values!996) i!673 (ValueCellFull!14750 lt!552962)) (size!38439 _values!996)))))

(declare-fun dynLambda!3310 (Int (_ BitVec 64)) V!46353)

(assert (=> b!1216978 (= lt!552962 (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!552971 () ListLongMap!18009)

(assert (=> b!1216978 (= lt!552971 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216979 () Bool)

(declare-fun e!690898 () Bool)

(assert (=> b!1216979 (= e!690898 tp_is_empty!30919)))

(declare-fun mapIsEmpty!48253 () Bool)

(declare-fun mapRes!48253 () Bool)

(assert (=> mapIsEmpty!48253 mapRes!48253))

(declare-fun b!1216980 () Bool)

(declare-fun res!808196 () Bool)

(assert (=> b!1216980 (=> (not res!808196) (not e!690902))))

(assert (=> b!1216980 (= res!808196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48253 () Bool)

(declare-fun tp!91666 () Bool)

(assert (=> mapNonEmpty!48253 (= mapRes!48253 (and tp!91666 e!690898))))

(declare-fun mapRest!48253 () (Array (_ BitVec 32) ValueCell!14750))

(declare-fun mapKey!48253 () (_ BitVec 32))

(declare-fun mapValue!48253 () ValueCell!14750)

(assert (=> mapNonEmpty!48253 (= (arr!37901 _values!996) (store mapRest!48253 mapKey!48253 mapValue!48253))))

(declare-fun b!1216981 () Bool)

(declare-fun e!690900 () Bool)

(declare-fun lt!552965 () ListLongMap!18009)

(declare-fun +!4090 (ListLongMap!18009 tuple2!20040) ListLongMap!18009)

(declare-fun get!19321 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1216981 (= e!690900 (= lt!552964 (+!4090 lt!552965 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))))))

(declare-fun b!1216982 () Bool)

(declare-fun res!808203 () Bool)

(assert (=> b!1216982 (=> (not res!808203) (not e!690902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216982 (= res!808203 (validMask!0 mask!1564))))

(declare-fun b!1216983 () Bool)

(declare-fun res!808194 () Bool)

(assert (=> b!1216983 (=> (not res!808194) (not e!690902))))

(assert (=> b!1216983 (= res!808194 (and (= (size!38439 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38438 _keys!1208) (size!38439 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216984 () Bool)

(assert (=> b!1216984 (= e!690899 e!690900)))

(declare-fun res!808192 () Bool)

(assert (=> b!1216984 (=> res!808192 e!690900)))

(assert (=> b!1216984 (= res!808192 (not (validKeyInArray!0 (select (arr!37900 _keys!1208) from!1455))))))

(declare-fun lt!552970 () ListLongMap!18009)

(assert (=> b!1216984 (= lt!552970 lt!552965)))

(declare-fun lt!552966 () ListLongMap!18009)

(declare-fun -!1858 (ListLongMap!18009 (_ BitVec 64)) ListLongMap!18009)

(assert (=> b!1216984 (= lt!552965 (-!1858 lt!552966 k0!934))))

(assert (=> b!1216984 (= lt!552970 (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1216984 (= lt!552966 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40211 0))(
  ( (Unit!40212) )
))
(declare-fun lt!552969 () Unit!40211)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1093 (array!78530 array!78532 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40211)

(assert (=> b!1216984 (= lt!552969 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216971 () Bool)

(declare-fun res!808193 () Bool)

(assert (=> b!1216971 (=> (not res!808193) (not e!690903))))

(assert (=> b!1216971 (= res!808193 (arrayNoDuplicates!0 lt!552968 #b00000000000000000000000000000000 Nil!26815))))

(declare-fun res!808197 () Bool)

(assert (=> start!101286 (=> (not res!808197) (not e!690902))))

(assert (=> start!101286 (= res!808197 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38438 _keys!1208))))))

(assert (=> start!101286 e!690902))

(assert (=> start!101286 tp_is_empty!30919))

(declare-fun array_inv!28972 (array!78530) Bool)

(assert (=> start!101286 (array_inv!28972 _keys!1208)))

(assert (=> start!101286 true))

(assert (=> start!101286 tp!91667))

(declare-fun e!690896 () Bool)

(declare-fun array_inv!28973 (array!78532) Bool)

(assert (=> start!101286 (and (array_inv!28973 _values!996) e!690896)))

(declare-fun b!1216985 () Bool)

(assert (=> b!1216985 (= e!690903 (not e!690897))))

(declare-fun res!808195 () Bool)

(assert (=> b!1216985 (=> res!808195 e!690897)))

(assert (=> b!1216985 (= res!808195 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216985 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552963 () Unit!40211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78530 (_ BitVec 64) (_ BitVec 32)) Unit!40211)

(assert (=> b!1216985 (= lt!552963 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216986 () Bool)

(assert (=> b!1216986 (= e!690896 (and e!690904 mapRes!48253))))

(declare-fun condMapEmpty!48253 () Bool)

(declare-fun mapDefault!48253 () ValueCell!14750)

(assert (=> b!1216986 (= condMapEmpty!48253 (= (arr!37901 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14750)) mapDefault!48253)))))

(assert (= (and start!101286 res!808197) b!1216982))

(assert (= (and b!1216982 res!808203) b!1216983))

(assert (= (and b!1216983 res!808194) b!1216980))

(assert (= (and b!1216980 res!808196) b!1216977))

(assert (= (and b!1216977 res!808200) b!1216975))

(assert (= (and b!1216975 res!808198) b!1216976))

(assert (= (and b!1216976 res!808202) b!1216974))

(assert (= (and b!1216974 res!808204) b!1216972))

(assert (= (and b!1216972 res!808201) b!1216971))

(assert (= (and b!1216971 res!808193) b!1216985))

(assert (= (and b!1216985 (not res!808195)) b!1216978))

(assert (= (and b!1216978 (not res!808199)) b!1216984))

(assert (= (and b!1216984 (not res!808192)) b!1216981))

(assert (= (and b!1216986 condMapEmpty!48253) mapIsEmpty!48253))

(assert (= (and b!1216986 (not condMapEmpty!48253)) mapNonEmpty!48253))

(get-info :version)

(assert (= (and mapNonEmpty!48253 ((_ is ValueCellFull!14750) mapValue!48253)) b!1216979))

(assert (= (and b!1216986 ((_ is ValueCellFull!14750) mapDefault!48253)) b!1216973))

(assert (= start!101286 b!1216986))

(declare-fun b_lambda!21881 () Bool)

(assert (=> (not b_lambda!21881) (not b!1216978)))

(declare-fun t!40003 () Bool)

(declare-fun tb!11007 () Bool)

(assert (=> (and start!101286 (= defaultEntry!1004 defaultEntry!1004) t!40003) tb!11007))

(declare-fun result!22619 () Bool)

(assert (=> tb!11007 (= result!22619 tp_is_empty!30919)))

(assert (=> b!1216978 t!40003))

(declare-fun b_and!43531 () Bool)

(assert (= b_and!43529 (and (=> t!40003 result!22619) b_and!43531)))

(declare-fun m!1121211 () Bool)

(assert (=> b!1216974 m!1121211))

(declare-fun m!1121213 () Bool)

(assert (=> start!101286 m!1121213))

(declare-fun m!1121215 () Bool)

(assert (=> start!101286 m!1121215))

(declare-fun m!1121217 () Bool)

(assert (=> b!1216977 m!1121217))

(declare-fun m!1121219 () Bool)

(assert (=> b!1216972 m!1121219))

(declare-fun m!1121221 () Bool)

(assert (=> b!1216972 m!1121221))

(declare-fun m!1121223 () Bool)

(assert (=> b!1216976 m!1121223))

(declare-fun m!1121225 () Bool)

(assert (=> mapNonEmpty!48253 m!1121225))

(declare-fun m!1121227 () Bool)

(assert (=> b!1216985 m!1121227))

(declare-fun m!1121229 () Bool)

(assert (=> b!1216985 m!1121229))

(declare-fun m!1121231 () Bool)

(assert (=> b!1216981 m!1121231))

(declare-fun m!1121233 () Bool)

(assert (=> b!1216981 m!1121233))

(assert (=> b!1216981 m!1121233))

(declare-fun m!1121235 () Bool)

(assert (=> b!1216981 m!1121235))

(declare-fun m!1121237 () Bool)

(assert (=> b!1216981 m!1121237))

(declare-fun m!1121239 () Bool)

(assert (=> b!1216980 m!1121239))

(declare-fun m!1121241 () Bool)

(assert (=> b!1216971 m!1121241))

(declare-fun m!1121243 () Bool)

(assert (=> b!1216982 m!1121243))

(declare-fun m!1121245 () Bool)

(assert (=> b!1216978 m!1121245))

(declare-fun m!1121247 () Bool)

(assert (=> b!1216978 m!1121247))

(declare-fun m!1121249 () Bool)

(assert (=> b!1216978 m!1121249))

(declare-fun m!1121251 () Bool)

(assert (=> b!1216978 m!1121251))

(declare-fun m!1121253 () Bool)

(assert (=> b!1216984 m!1121253))

(declare-fun m!1121255 () Bool)

(assert (=> b!1216984 m!1121255))

(declare-fun m!1121257 () Bool)

(assert (=> b!1216984 m!1121257))

(declare-fun m!1121259 () Bool)

(assert (=> b!1216984 m!1121259))

(assert (=> b!1216984 m!1121231))

(declare-fun m!1121261 () Bool)

(assert (=> b!1216984 m!1121261))

(assert (=> b!1216984 m!1121231))

(check-sat tp_is_empty!30919 (not b!1216984) (not b!1216971) (not b!1216976) (not b!1216981) (not b!1216978) (not start!101286) (not mapNonEmpty!48253) b_and!43531 (not b!1216982) (not b_next!26215) (not b!1216980) (not b!1216977) (not b!1216985) (not b_lambda!21881) (not b!1216972))
(check-sat b_and!43531 (not b_next!26215))
(get-model)

(declare-fun b_lambda!21887 () Bool)

(assert (= b_lambda!21881 (or (and start!101286 b_free!26215) b_lambda!21887)))

(check-sat tp_is_empty!30919 (not b!1216984) (not b!1216971) (not b!1216976) (not b!1216978) (not start!101286) (not mapNonEmpty!48253) b_and!43531 (not b!1216982) (not b_next!26215) (not b!1216972) (not b!1216980) (not b!1216977) (not b!1216985) (not b_lambda!21887) (not b!1216981))
(check-sat b_and!43531 (not b_next!26215))
(get-model)

(declare-fun d!133401 () Bool)

(declare-fun res!808287 () Bool)

(declare-fun e!690967 () Bool)

(assert (=> d!133401 (=> res!808287 e!690967)))

(assert (=> d!133401 (= res!808287 (bvsge #b00000000000000000000000000000000 (size!38438 _keys!1208)))))

(assert (=> d!133401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!690967)))

(declare-fun b!1217097 () Bool)

(declare-fun e!690966 () Bool)

(declare-fun call!60587 () Bool)

(assert (=> b!1217097 (= e!690966 call!60587)))

(declare-fun b!1217098 () Bool)

(declare-fun e!690965 () Bool)

(assert (=> b!1217098 (= e!690966 e!690965)))

(declare-fun lt!553040 () (_ BitVec 64))

(assert (=> b!1217098 (= lt!553040 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553038 () Unit!40211)

(assert (=> b!1217098 (= lt!553038 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!553040 #b00000000000000000000000000000000))))

(assert (=> b!1217098 (arrayContainsKey!0 _keys!1208 lt!553040 #b00000000000000000000000000000000)))

(declare-fun lt!553039 () Unit!40211)

(assert (=> b!1217098 (= lt!553039 lt!553038)))

(declare-fun res!808288 () Bool)

(declare-datatypes ((SeekEntryResult!9942 0))(
  ( (MissingZero!9942 (index!42139 (_ BitVec 32))) (Found!9942 (index!42140 (_ BitVec 32))) (Intermediate!9942 (undefined!10754 Bool) (index!42141 (_ BitVec 32)) (x!107228 (_ BitVec 32))) (Undefined!9942) (MissingVacant!9942 (index!42142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78530 (_ BitVec 32)) SeekEntryResult!9942)

(assert (=> b!1217098 (= res!808288 (= (seekEntryOrOpen!0 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9942 #b00000000000000000000000000000000)))))

(assert (=> b!1217098 (=> (not res!808288) (not e!690965))))

(declare-fun bm!60584 () Bool)

(assert (=> bm!60584 (= call!60587 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1217099 () Bool)

(assert (=> b!1217099 (= e!690967 e!690966)))

(declare-fun c!120030 () Bool)

(assert (=> b!1217099 (= c!120030 (validKeyInArray!0 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217100 () Bool)

(assert (=> b!1217100 (= e!690965 call!60587)))

(assert (= (and d!133401 (not res!808287)) b!1217099))

(assert (= (and b!1217099 c!120030) b!1217098))

(assert (= (and b!1217099 (not c!120030)) b!1217097))

(assert (= (and b!1217098 res!808288) b!1217100))

(assert (= (or b!1217100 b!1217097) bm!60584))

(declare-fun m!1121367 () Bool)

(assert (=> b!1217098 m!1121367))

(declare-fun m!1121369 () Bool)

(assert (=> b!1217098 m!1121369))

(declare-fun m!1121371 () Bool)

(assert (=> b!1217098 m!1121371))

(assert (=> b!1217098 m!1121367))

(declare-fun m!1121373 () Bool)

(assert (=> b!1217098 m!1121373))

(declare-fun m!1121375 () Bool)

(assert (=> bm!60584 m!1121375))

(assert (=> b!1217099 m!1121367))

(assert (=> b!1217099 m!1121367))

(declare-fun m!1121377 () Bool)

(assert (=> b!1217099 m!1121377))

(assert (=> b!1216980 d!133401))

(declare-fun bm!60587 () Bool)

(declare-fun call!60590 () Bool)

(declare-fun c!120033 () Bool)

(assert (=> bm!60587 (= call!60590 (arrayNoDuplicates!0 lt!552968 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120033 (Cons!26814 (select (arr!37900 lt!552968) #b00000000000000000000000000000000) Nil!26815) Nil!26815)))))

(declare-fun b!1217111 () Bool)

(declare-fun e!690978 () Bool)

(declare-fun e!690977 () Bool)

(assert (=> b!1217111 (= e!690978 e!690977)))

(declare-fun res!808297 () Bool)

(assert (=> b!1217111 (=> (not res!808297) (not e!690977))))

(declare-fun e!690976 () Bool)

(assert (=> b!1217111 (= res!808297 (not e!690976))))

(declare-fun res!808295 () Bool)

(assert (=> b!1217111 (=> (not res!808295) (not e!690976))))

(assert (=> b!1217111 (= res!808295 (validKeyInArray!0 (select (arr!37900 lt!552968) #b00000000000000000000000000000000)))))

(declare-fun b!1217112 () Bool)

(declare-fun e!690979 () Bool)

(assert (=> b!1217112 (= e!690977 e!690979)))

(assert (=> b!1217112 (= c!120033 (validKeyInArray!0 (select (arr!37900 lt!552968) #b00000000000000000000000000000000)))))

(declare-fun b!1217113 () Bool)

(declare-fun contains!6980 (List!26818 (_ BitVec 64)) Bool)

(assert (=> b!1217113 (= e!690976 (contains!6980 Nil!26815 (select (arr!37900 lt!552968) #b00000000000000000000000000000000)))))

(declare-fun d!133403 () Bool)

(declare-fun res!808296 () Bool)

(assert (=> d!133403 (=> res!808296 e!690978)))

(assert (=> d!133403 (= res!808296 (bvsge #b00000000000000000000000000000000 (size!38438 lt!552968)))))

(assert (=> d!133403 (= (arrayNoDuplicates!0 lt!552968 #b00000000000000000000000000000000 Nil!26815) e!690978)))

(declare-fun b!1217114 () Bool)

(assert (=> b!1217114 (= e!690979 call!60590)))

(declare-fun b!1217115 () Bool)

(assert (=> b!1217115 (= e!690979 call!60590)))

(assert (= (and d!133403 (not res!808296)) b!1217111))

(assert (= (and b!1217111 res!808295) b!1217113))

(assert (= (and b!1217111 res!808297) b!1217112))

(assert (= (and b!1217112 c!120033) b!1217114))

(assert (= (and b!1217112 (not c!120033)) b!1217115))

(assert (= (or b!1217114 b!1217115) bm!60587))

(declare-fun m!1121379 () Bool)

(assert (=> bm!60587 m!1121379))

(declare-fun m!1121381 () Bool)

(assert (=> bm!60587 m!1121381))

(assert (=> b!1217111 m!1121379))

(assert (=> b!1217111 m!1121379))

(declare-fun m!1121383 () Bool)

(assert (=> b!1217111 m!1121383))

(assert (=> b!1217112 m!1121379))

(assert (=> b!1217112 m!1121379))

(assert (=> b!1217112 m!1121383))

(assert (=> b!1217113 m!1121379))

(assert (=> b!1217113 m!1121379))

(declare-fun m!1121385 () Bool)

(assert (=> b!1217113 m!1121385))

(assert (=> b!1216971 d!133403))

(declare-fun d!133405 () Bool)

(declare-fun e!690982 () Bool)

(assert (=> d!133405 e!690982))

(declare-fun res!808302 () Bool)

(assert (=> d!133405 (=> (not res!808302) (not e!690982))))

(declare-fun lt!553052 () ListLongMap!18009)

(declare-fun contains!6981 (ListLongMap!18009 (_ BitVec 64)) Bool)

(assert (=> d!133405 (= res!808302 (contains!6981 lt!553052 (_1!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))))))

(declare-fun lt!553051 () List!26819)

(assert (=> d!133405 (= lt!553052 (ListLongMap!18010 lt!553051))))

(declare-fun lt!553050 () Unit!40211)

(declare-fun lt!553049 () Unit!40211)

(assert (=> d!133405 (= lt!553050 lt!553049)))

(declare-datatypes ((Option!694 0))(
  ( (Some!693 (v!18171 V!46353)) (None!692) )
))
(declare-fun getValueByKey!643 (List!26819 (_ BitVec 64)) Option!694)

(assert (=> d!133405 (= (getValueByKey!643 lt!553051 (_1!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))) (Some!693 (_2!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!319 (List!26819 (_ BitVec 64) V!46353) Unit!40211)

(assert (=> d!133405 (= lt!553049 (lemmaContainsTupThenGetReturnValue!319 lt!553051 (_1!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962))) (_2!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))))))

(declare-fun insertStrictlySorted!412 (List!26819 (_ BitVec 64) V!46353) List!26819)

(assert (=> d!133405 (= lt!553051 (insertStrictlySorted!412 (toList!9020 lt!552965) (_1!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962))) (_2!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))))))

(assert (=> d!133405 (= (+!4090 lt!552965 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962))) lt!553052)))

(declare-fun b!1217120 () Bool)

(declare-fun res!808303 () Bool)

(assert (=> b!1217120 (=> (not res!808303) (not e!690982))))

(assert (=> b!1217120 (= res!808303 (= (getValueByKey!643 (toList!9020 lt!553052) (_1!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962)))) (Some!693 (_2!10031 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962))))))))

(declare-fun b!1217121 () Bool)

(declare-fun contains!6982 (List!26819 tuple2!20040) Bool)

(assert (=> b!1217121 (= e!690982 (contains!6982 (toList!9020 lt!553052) (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962))))))

(assert (= (and d!133405 res!808302) b!1217120))

(assert (= (and b!1217120 res!808303) b!1217121))

(declare-fun m!1121387 () Bool)

(assert (=> d!133405 m!1121387))

(declare-fun m!1121389 () Bool)

(assert (=> d!133405 m!1121389))

(declare-fun m!1121391 () Bool)

(assert (=> d!133405 m!1121391))

(declare-fun m!1121393 () Bool)

(assert (=> d!133405 m!1121393))

(declare-fun m!1121395 () Bool)

(assert (=> b!1217120 m!1121395))

(declare-fun m!1121397 () Bool)

(assert (=> b!1217121 m!1121397))

(assert (=> b!1216981 d!133405))

(declare-fun d!133407 () Bool)

(declare-fun c!120036 () Bool)

(assert (=> d!133407 (= c!120036 ((_ is ValueCellFull!14750) (select (arr!37901 _values!996) from!1455)))))

(declare-fun e!690985 () V!46353)

(assert (=> d!133407 (= (get!19321 (select (arr!37901 _values!996) from!1455) lt!552962) e!690985)))

(declare-fun b!1217126 () Bool)

(declare-fun get!19324 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1217126 (= e!690985 (get!19324 (select (arr!37901 _values!996) from!1455) lt!552962))))

(declare-fun b!1217127 () Bool)

(declare-fun get!19325 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1217127 (= e!690985 (get!19325 (select (arr!37901 _values!996) from!1455) lt!552962))))

(assert (= (and d!133407 c!120036) b!1217126))

(assert (= (and d!133407 (not c!120036)) b!1217127))

(assert (=> b!1217126 m!1121233))

(declare-fun m!1121399 () Bool)

(assert (=> b!1217126 m!1121399))

(assert (=> b!1217127 m!1121233))

(declare-fun m!1121401 () Bool)

(assert (=> b!1217127 m!1121401))

(assert (=> b!1216981 d!133407))

(declare-fun d!133409 () Bool)

(assert (=> d!133409 (= (array_inv!28972 _keys!1208) (bvsge (size!38438 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101286 d!133409))

(declare-fun d!133411 () Bool)

(assert (=> d!133411 (= (array_inv!28973 _values!996) (bvsge (size!38439 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101286 d!133411))

(declare-fun d!133413 () Bool)

(declare-fun res!808304 () Bool)

(declare-fun e!690988 () Bool)

(assert (=> d!133413 (=> res!808304 e!690988)))

(assert (=> d!133413 (= res!808304 (bvsge #b00000000000000000000000000000000 (size!38438 lt!552968)))))

(assert (=> d!133413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552968 mask!1564) e!690988)))

(declare-fun b!1217128 () Bool)

(declare-fun e!690987 () Bool)

(declare-fun call!60591 () Bool)

(assert (=> b!1217128 (= e!690987 call!60591)))

(declare-fun b!1217129 () Bool)

(declare-fun e!690986 () Bool)

(assert (=> b!1217129 (= e!690987 e!690986)))

(declare-fun lt!553055 () (_ BitVec 64))

(assert (=> b!1217129 (= lt!553055 (select (arr!37900 lt!552968) #b00000000000000000000000000000000))))

(declare-fun lt!553053 () Unit!40211)

(assert (=> b!1217129 (= lt!553053 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!552968 lt!553055 #b00000000000000000000000000000000))))

(assert (=> b!1217129 (arrayContainsKey!0 lt!552968 lt!553055 #b00000000000000000000000000000000)))

(declare-fun lt!553054 () Unit!40211)

(assert (=> b!1217129 (= lt!553054 lt!553053)))

(declare-fun res!808305 () Bool)

(assert (=> b!1217129 (= res!808305 (= (seekEntryOrOpen!0 (select (arr!37900 lt!552968) #b00000000000000000000000000000000) lt!552968 mask!1564) (Found!9942 #b00000000000000000000000000000000)))))

(assert (=> b!1217129 (=> (not res!808305) (not e!690986))))

(declare-fun bm!60588 () Bool)

(assert (=> bm!60588 (= call!60591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!552968 mask!1564))))

(declare-fun b!1217130 () Bool)

(assert (=> b!1217130 (= e!690988 e!690987)))

(declare-fun c!120037 () Bool)

(assert (=> b!1217130 (= c!120037 (validKeyInArray!0 (select (arr!37900 lt!552968) #b00000000000000000000000000000000)))))

(declare-fun b!1217131 () Bool)

(assert (=> b!1217131 (= e!690986 call!60591)))

(assert (= (and d!133413 (not res!808304)) b!1217130))

(assert (= (and b!1217130 c!120037) b!1217129))

(assert (= (and b!1217130 (not c!120037)) b!1217128))

(assert (= (and b!1217129 res!808305) b!1217131))

(assert (= (or b!1217131 b!1217128) bm!60588))

(assert (=> b!1217129 m!1121379))

(declare-fun m!1121403 () Bool)

(assert (=> b!1217129 m!1121403))

(declare-fun m!1121405 () Bool)

(assert (=> b!1217129 m!1121405))

(assert (=> b!1217129 m!1121379))

(declare-fun m!1121407 () Bool)

(assert (=> b!1217129 m!1121407))

(declare-fun m!1121409 () Bool)

(assert (=> bm!60588 m!1121409))

(assert (=> b!1217130 m!1121379))

(assert (=> b!1217130 m!1121379))

(assert (=> b!1217130 m!1121383))

(assert (=> b!1216972 d!133413))

(declare-fun bm!60591 () Bool)

(declare-fun call!60594 () ListLongMap!18009)

(assert (=> bm!60591 (= call!60594 (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217156 () Bool)

(declare-fun e!691005 () Bool)

(assert (=> b!1217156 (= e!691005 (validKeyInArray!0 (select (arr!37900 lt!552968) from!1455)))))

(assert (=> b!1217156 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133415 () Bool)

(declare-fun e!691006 () Bool)

(assert (=> d!133415 e!691006))

(declare-fun res!808317 () Bool)

(assert (=> d!133415 (=> (not res!808317) (not e!691006))))

(declare-fun lt!553072 () ListLongMap!18009)

(assert (=> d!133415 (= res!808317 (not (contains!6981 lt!553072 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691004 () ListLongMap!18009)

(assert (=> d!133415 (= lt!553072 e!691004)))

(declare-fun c!120046 () Bool)

(assert (=> d!133415 (= c!120046 (bvsge from!1455 (size!38438 lt!552968)))))

(assert (=> d!133415 (validMask!0 mask!1564)))

(assert (=> d!133415 (= (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553072)))

(declare-fun b!1217157 () Bool)

(declare-fun e!691003 () Bool)

(declare-fun isEmpty!999 (ListLongMap!18009) Bool)

(assert (=> b!1217157 (= e!691003 (isEmpty!999 lt!553072))))

(declare-fun b!1217158 () Bool)

(declare-fun lt!553073 () Unit!40211)

(declare-fun lt!553075 () Unit!40211)

(assert (=> b!1217158 (= lt!553073 lt!553075)))

(declare-fun lt!553076 () (_ BitVec 64))

(declare-fun lt!553070 () (_ BitVec 64))

(declare-fun lt!553071 () ListLongMap!18009)

(declare-fun lt!553074 () V!46353)

(assert (=> b!1217158 (not (contains!6981 (+!4090 lt!553071 (tuple2!20041 lt!553070 lt!553074)) lt!553076))))

(declare-fun addStillNotContains!299 (ListLongMap!18009 (_ BitVec 64) V!46353 (_ BitVec 64)) Unit!40211)

(assert (=> b!1217158 (= lt!553075 (addStillNotContains!299 lt!553071 lt!553070 lt!553074 lt!553076))))

(assert (=> b!1217158 (= lt!553076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217158 (= lt!553074 (get!19321 (select (arr!37901 lt!552967) from!1455) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217158 (= lt!553070 (select (arr!37900 lt!552968) from!1455))))

(assert (=> b!1217158 (= lt!553071 call!60594)))

(declare-fun e!691007 () ListLongMap!18009)

(assert (=> b!1217158 (= e!691007 (+!4090 call!60594 (tuple2!20041 (select (arr!37900 lt!552968) from!1455) (get!19321 (select (arr!37901 lt!552967) from!1455) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217159 () Bool)

(declare-fun e!691009 () Bool)

(assert (=> b!1217159 (= e!691009 e!691003)))

(declare-fun c!120048 () Bool)

(assert (=> b!1217159 (= c!120048 (bvslt from!1455 (size!38438 lt!552968)))))

(declare-fun b!1217160 () Bool)

(assert (=> b!1217160 (= e!691004 e!691007)))

(declare-fun c!120047 () Bool)

(assert (=> b!1217160 (= c!120047 (validKeyInArray!0 (select (arr!37900 lt!552968) from!1455)))))

(declare-fun b!1217161 () Bool)

(assert (=> b!1217161 (= e!691007 call!60594)))

(declare-fun b!1217162 () Bool)

(assert (=> b!1217162 (= e!691004 (ListLongMap!18010 Nil!26816))))

(declare-fun b!1217163 () Bool)

(declare-fun e!691008 () Bool)

(assert (=> b!1217163 (= e!691009 e!691008)))

(assert (=> b!1217163 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38438 lt!552968)))))

(declare-fun res!808316 () Bool)

(assert (=> b!1217163 (= res!808316 (contains!6981 lt!553072 (select (arr!37900 lt!552968) from!1455)))))

(assert (=> b!1217163 (=> (not res!808316) (not e!691008))))

(declare-fun b!1217164 () Bool)

(assert (=> b!1217164 (= e!691006 e!691009)))

(declare-fun c!120049 () Bool)

(assert (=> b!1217164 (= c!120049 e!691005)))

(declare-fun res!808314 () Bool)

(assert (=> b!1217164 (=> (not res!808314) (not e!691005))))

(assert (=> b!1217164 (= res!808314 (bvslt from!1455 (size!38438 lt!552968)))))

(declare-fun b!1217165 () Bool)

(assert (=> b!1217165 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38438 lt!552968)))))

(assert (=> b!1217165 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38439 lt!552967)))))

(declare-fun apply!963 (ListLongMap!18009 (_ BitVec 64)) V!46353)

(assert (=> b!1217165 (= e!691008 (= (apply!963 lt!553072 (select (arr!37900 lt!552968) from!1455)) (get!19321 (select (arr!37901 lt!552967) from!1455) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217166 () Bool)

(assert (=> b!1217166 (= e!691003 (= lt!553072 (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217167 () Bool)

(declare-fun res!808315 () Bool)

(assert (=> b!1217167 (=> (not res!808315) (not e!691006))))

(assert (=> b!1217167 (= res!808315 (not (contains!6981 lt!553072 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133415 c!120046) b!1217162))

(assert (= (and d!133415 (not c!120046)) b!1217160))

(assert (= (and b!1217160 c!120047) b!1217158))

(assert (= (and b!1217160 (not c!120047)) b!1217161))

(assert (= (or b!1217158 b!1217161) bm!60591))

(assert (= (and d!133415 res!808317) b!1217167))

(assert (= (and b!1217167 res!808315) b!1217164))

(assert (= (and b!1217164 res!808314) b!1217156))

(assert (= (and b!1217164 c!120049) b!1217163))

(assert (= (and b!1217164 (not c!120049)) b!1217159))

(assert (= (and b!1217163 res!808316) b!1217165))

(assert (= (and b!1217159 c!120048) b!1217166))

(assert (= (and b!1217159 (not c!120048)) b!1217157))

(declare-fun b_lambda!21889 () Bool)

(assert (=> (not b_lambda!21889) (not b!1217158)))

(assert (=> b!1217158 t!40003))

(declare-fun b_and!43541 () Bool)

(assert (= b_and!43531 (and (=> t!40003 result!22619) b_and!43541)))

(declare-fun b_lambda!21891 () Bool)

(assert (=> (not b_lambda!21891) (not b!1217165)))

(assert (=> b!1217165 t!40003))

(declare-fun b_and!43543 () Bool)

(assert (= b_and!43541 (and (=> t!40003 result!22619) b_and!43543)))

(declare-fun m!1121411 () Bool)

(assert (=> b!1217167 m!1121411))

(declare-fun m!1121413 () Bool)

(assert (=> bm!60591 m!1121413))

(declare-fun m!1121415 () Bool)

(assert (=> d!133415 m!1121415))

(assert (=> d!133415 m!1121243))

(declare-fun m!1121417 () Bool)

(assert (=> b!1217165 m!1121417))

(declare-fun m!1121419 () Bool)

(assert (=> b!1217165 m!1121419))

(assert (=> b!1217165 m!1121249))

(declare-fun m!1121421 () Bool)

(assert (=> b!1217165 m!1121421))

(assert (=> b!1217165 m!1121249))

(assert (=> b!1217165 m!1121417))

(declare-fun m!1121423 () Bool)

(assert (=> b!1217165 m!1121423))

(assert (=> b!1217165 m!1121419))

(assert (=> b!1217163 m!1121417))

(assert (=> b!1217163 m!1121417))

(declare-fun m!1121425 () Bool)

(assert (=> b!1217163 m!1121425))

(declare-fun m!1121427 () Bool)

(assert (=> b!1217157 m!1121427))

(assert (=> b!1217156 m!1121417))

(assert (=> b!1217156 m!1121417))

(declare-fun m!1121429 () Bool)

(assert (=> b!1217156 m!1121429))

(assert (=> b!1217160 m!1121417))

(assert (=> b!1217160 m!1121417))

(assert (=> b!1217160 m!1121429))

(declare-fun m!1121431 () Bool)

(assert (=> b!1217158 m!1121431))

(assert (=> b!1217158 m!1121417))

(declare-fun m!1121433 () Bool)

(assert (=> b!1217158 m!1121433))

(declare-fun m!1121435 () Bool)

(assert (=> b!1217158 m!1121435))

(assert (=> b!1217158 m!1121419))

(assert (=> b!1217158 m!1121249))

(assert (=> b!1217158 m!1121421))

(assert (=> b!1217158 m!1121435))

(declare-fun m!1121437 () Bool)

(assert (=> b!1217158 m!1121437))

(assert (=> b!1217158 m!1121249))

(assert (=> b!1217158 m!1121419))

(assert (=> b!1217166 m!1121413))

(assert (=> b!1216978 d!133415))

(declare-fun bm!60592 () Bool)

(declare-fun call!60595 () ListLongMap!18009)

(assert (=> bm!60592 (= call!60595 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217168 () Bool)

(declare-fun e!691012 () Bool)

(assert (=> b!1217168 (= e!691012 (validKeyInArray!0 (select (arr!37900 _keys!1208) from!1455)))))

(assert (=> b!1217168 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133417 () Bool)

(declare-fun e!691013 () Bool)

(assert (=> d!133417 e!691013))

(declare-fun res!808321 () Bool)

(assert (=> d!133417 (=> (not res!808321) (not e!691013))))

(declare-fun lt!553079 () ListLongMap!18009)

(assert (=> d!133417 (= res!808321 (not (contains!6981 lt!553079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691011 () ListLongMap!18009)

(assert (=> d!133417 (= lt!553079 e!691011)))

(declare-fun c!120050 () Bool)

(assert (=> d!133417 (= c!120050 (bvsge from!1455 (size!38438 _keys!1208)))))

(assert (=> d!133417 (validMask!0 mask!1564)))

(assert (=> d!133417 (= (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553079)))

(declare-fun b!1217169 () Bool)

(declare-fun e!691010 () Bool)

(assert (=> b!1217169 (= e!691010 (isEmpty!999 lt!553079))))

(declare-fun b!1217170 () Bool)

(declare-fun lt!553080 () Unit!40211)

(declare-fun lt!553082 () Unit!40211)

(assert (=> b!1217170 (= lt!553080 lt!553082)))

(declare-fun lt!553083 () (_ BitVec 64))

(declare-fun lt!553081 () V!46353)

(declare-fun lt!553077 () (_ BitVec 64))

(declare-fun lt!553078 () ListLongMap!18009)

(assert (=> b!1217170 (not (contains!6981 (+!4090 lt!553078 (tuple2!20041 lt!553077 lt!553081)) lt!553083))))

(assert (=> b!1217170 (= lt!553082 (addStillNotContains!299 lt!553078 lt!553077 lt!553081 lt!553083))))

(assert (=> b!1217170 (= lt!553083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217170 (= lt!553081 (get!19321 (select (arr!37901 _values!996) from!1455) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217170 (= lt!553077 (select (arr!37900 _keys!1208) from!1455))))

(assert (=> b!1217170 (= lt!553078 call!60595)))

(declare-fun e!691014 () ListLongMap!18009)

(assert (=> b!1217170 (= e!691014 (+!4090 call!60595 (tuple2!20041 (select (arr!37900 _keys!1208) from!1455) (get!19321 (select (arr!37901 _values!996) from!1455) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217171 () Bool)

(declare-fun e!691016 () Bool)

(assert (=> b!1217171 (= e!691016 e!691010)))

(declare-fun c!120052 () Bool)

(assert (=> b!1217171 (= c!120052 (bvslt from!1455 (size!38438 _keys!1208)))))

(declare-fun b!1217172 () Bool)

(assert (=> b!1217172 (= e!691011 e!691014)))

(declare-fun c!120051 () Bool)

(assert (=> b!1217172 (= c!120051 (validKeyInArray!0 (select (arr!37900 _keys!1208) from!1455)))))

(declare-fun b!1217173 () Bool)

(assert (=> b!1217173 (= e!691014 call!60595)))

(declare-fun b!1217174 () Bool)

(assert (=> b!1217174 (= e!691011 (ListLongMap!18010 Nil!26816))))

(declare-fun b!1217175 () Bool)

(declare-fun e!691015 () Bool)

(assert (=> b!1217175 (= e!691016 e!691015)))

(assert (=> b!1217175 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38438 _keys!1208)))))

(declare-fun res!808320 () Bool)

(assert (=> b!1217175 (= res!808320 (contains!6981 lt!553079 (select (arr!37900 _keys!1208) from!1455)))))

(assert (=> b!1217175 (=> (not res!808320) (not e!691015))))

(declare-fun b!1217176 () Bool)

(assert (=> b!1217176 (= e!691013 e!691016)))

(declare-fun c!120053 () Bool)

(assert (=> b!1217176 (= c!120053 e!691012)))

(declare-fun res!808318 () Bool)

(assert (=> b!1217176 (=> (not res!808318) (not e!691012))))

(assert (=> b!1217176 (= res!808318 (bvslt from!1455 (size!38438 _keys!1208)))))

(declare-fun b!1217177 () Bool)

(assert (=> b!1217177 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38438 _keys!1208)))))

(assert (=> b!1217177 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38439 _values!996)))))

(assert (=> b!1217177 (= e!691015 (= (apply!963 lt!553079 (select (arr!37900 _keys!1208) from!1455)) (get!19321 (select (arr!37901 _values!996) from!1455) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217178 () Bool)

(assert (=> b!1217178 (= e!691010 (= lt!553079 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217179 () Bool)

(declare-fun res!808319 () Bool)

(assert (=> b!1217179 (=> (not res!808319) (not e!691013))))

(assert (=> b!1217179 (= res!808319 (not (contains!6981 lt!553079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133417 c!120050) b!1217174))

(assert (= (and d!133417 (not c!120050)) b!1217172))

(assert (= (and b!1217172 c!120051) b!1217170))

(assert (= (and b!1217172 (not c!120051)) b!1217173))

(assert (= (or b!1217170 b!1217173) bm!60592))

(assert (= (and d!133417 res!808321) b!1217179))

(assert (= (and b!1217179 res!808319) b!1217176))

(assert (= (and b!1217176 res!808318) b!1217168))

(assert (= (and b!1217176 c!120053) b!1217175))

(assert (= (and b!1217176 (not c!120053)) b!1217171))

(assert (= (and b!1217175 res!808320) b!1217177))

(assert (= (and b!1217171 c!120052) b!1217178))

(assert (= (and b!1217171 (not c!120052)) b!1217169))

(declare-fun b_lambda!21893 () Bool)

(assert (=> (not b_lambda!21893) (not b!1217170)))

(assert (=> b!1217170 t!40003))

(declare-fun b_and!43545 () Bool)

(assert (= b_and!43543 (and (=> t!40003 result!22619) b_and!43545)))

(declare-fun b_lambda!21895 () Bool)

(assert (=> (not b_lambda!21895) (not b!1217177)))

(assert (=> b!1217177 t!40003))

(declare-fun b_and!43547 () Bool)

(assert (= b_and!43545 (and (=> t!40003 result!22619) b_and!43547)))

(declare-fun m!1121439 () Bool)

(assert (=> b!1217179 m!1121439))

(declare-fun m!1121441 () Bool)

(assert (=> bm!60592 m!1121441))

(declare-fun m!1121443 () Bool)

(assert (=> d!133417 m!1121443))

(assert (=> d!133417 m!1121243))

(assert (=> b!1217177 m!1121231))

(assert (=> b!1217177 m!1121233))

(assert (=> b!1217177 m!1121249))

(declare-fun m!1121445 () Bool)

(assert (=> b!1217177 m!1121445))

(assert (=> b!1217177 m!1121249))

(assert (=> b!1217177 m!1121231))

(declare-fun m!1121447 () Bool)

(assert (=> b!1217177 m!1121447))

(assert (=> b!1217177 m!1121233))

(assert (=> b!1217175 m!1121231))

(assert (=> b!1217175 m!1121231))

(declare-fun m!1121449 () Bool)

(assert (=> b!1217175 m!1121449))

(declare-fun m!1121451 () Bool)

(assert (=> b!1217169 m!1121451))

(assert (=> b!1217168 m!1121231))

(assert (=> b!1217168 m!1121231))

(assert (=> b!1217168 m!1121261))

(assert (=> b!1217172 m!1121231))

(assert (=> b!1217172 m!1121231))

(assert (=> b!1217172 m!1121261))

(declare-fun m!1121453 () Bool)

(assert (=> b!1217170 m!1121453))

(assert (=> b!1217170 m!1121231))

(declare-fun m!1121455 () Bool)

(assert (=> b!1217170 m!1121455))

(declare-fun m!1121457 () Bool)

(assert (=> b!1217170 m!1121457))

(assert (=> b!1217170 m!1121233))

(assert (=> b!1217170 m!1121249))

(assert (=> b!1217170 m!1121445))

(assert (=> b!1217170 m!1121457))

(declare-fun m!1121459 () Bool)

(assert (=> b!1217170 m!1121459))

(assert (=> b!1217170 m!1121249))

(assert (=> b!1217170 m!1121233))

(assert (=> b!1217178 m!1121441))

(assert (=> b!1216978 d!133417))

(declare-fun d!133419 () Bool)

(assert (=> d!133419 (= (validKeyInArray!0 (select (arr!37900 _keys!1208) from!1455)) (and (not (= (select (arr!37900 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37900 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1216984 d!133419))

(declare-fun d!133421 () Bool)

(declare-fun lt!553086 () ListLongMap!18009)

(assert (=> d!133421 (not (contains!6981 lt!553086 k0!934))))

(declare-fun removeStrictlySorted!103 (List!26819 (_ BitVec 64)) List!26819)

(assert (=> d!133421 (= lt!553086 (ListLongMap!18010 (removeStrictlySorted!103 (toList!9020 lt!552966) k0!934)))))

(assert (=> d!133421 (= (-!1858 lt!552966 k0!934) lt!553086)))

(declare-fun bs!34277 () Bool)

(assert (= bs!34277 d!133421))

(declare-fun m!1121461 () Bool)

(assert (=> bs!34277 m!1121461))

(declare-fun m!1121463 () Bool)

(assert (=> bs!34277 m!1121463))

(assert (=> b!1216984 d!133421))

(declare-fun e!691021 () Bool)

(declare-fun call!60601 () ListLongMap!18009)

(declare-fun b!1217186 () Bool)

(declare-fun call!60600 () ListLongMap!18009)

(assert (=> b!1217186 (= e!691021 (= call!60601 (-!1858 call!60600 k0!934)))))

(assert (=> b!1217186 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38439 _values!996)))))

(declare-fun b!1217187 () Bool)

(assert (=> b!1217187 (= e!691021 (= call!60601 call!60600))))

(assert (=> b!1217187 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38439 _values!996)))))

(declare-fun d!133423 () Bool)

(declare-fun e!691022 () Bool)

(assert (=> d!133423 e!691022))

(declare-fun res!808324 () Bool)

(assert (=> d!133423 (=> (not res!808324) (not e!691022))))

(assert (=> d!133423 (= res!808324 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38438 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38438 _keys!1208))))))))

(declare-fun lt!553089 () Unit!40211)

(declare-fun choose!1829 (array!78530 array!78532 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40211)

(assert (=> d!133423 (= lt!553089 (choose!1829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133423 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 _keys!1208)))))

(assert (=> d!133423 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553089)))

(declare-fun bm!60597 () Bool)

(assert (=> bm!60597 (= call!60600 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217188 () Bool)

(assert (=> b!1217188 (= e!691022 e!691021)))

(declare-fun c!120056 () Bool)

(assert (=> b!1217188 (= c!120056 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60598 () Bool)

(assert (=> bm!60598 (= call!60601 (getCurrentListMapNoExtraKeys!5459 (array!78531 (store (arr!37900 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38438 _keys!1208)) (array!78533 (store (arr!37901 _values!996) i!673 (ValueCellFull!14750 (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38439 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133423 res!808324) b!1217188))

(assert (= (and b!1217188 c!120056) b!1217186))

(assert (= (and b!1217188 (not c!120056)) b!1217187))

(assert (= (or b!1217186 b!1217187) bm!60597))

(assert (= (or b!1217186 b!1217187) bm!60598))

(declare-fun b_lambda!21897 () Bool)

(assert (=> (not b_lambda!21897) (not bm!60598)))

(assert (=> bm!60598 t!40003))

(declare-fun b_and!43549 () Bool)

(assert (= b_and!43547 (and (=> t!40003 result!22619) b_and!43549)))

(declare-fun m!1121465 () Bool)

(assert (=> b!1217186 m!1121465))

(declare-fun m!1121467 () Bool)

(assert (=> d!133423 m!1121467))

(assert (=> bm!60597 m!1121253))

(assert (=> bm!60598 m!1121221))

(assert (=> bm!60598 m!1121249))

(declare-fun m!1121469 () Bool)

(assert (=> bm!60598 m!1121469))

(declare-fun m!1121471 () Bool)

(assert (=> bm!60598 m!1121471))

(assert (=> b!1216984 d!133423))

(declare-fun call!60602 () ListLongMap!18009)

(declare-fun bm!60599 () Bool)

(assert (=> bm!60599 (= call!60602 (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217189 () Bool)

(declare-fun e!691025 () Bool)

(assert (=> b!1217189 (= e!691025 (validKeyInArray!0 (select (arr!37900 lt!552968) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217189 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133425 () Bool)

(declare-fun e!691026 () Bool)

(assert (=> d!133425 e!691026))

(declare-fun res!808328 () Bool)

(assert (=> d!133425 (=> (not res!808328) (not e!691026))))

(declare-fun lt!553092 () ListLongMap!18009)

(assert (=> d!133425 (= res!808328 (not (contains!6981 lt!553092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691024 () ListLongMap!18009)

(assert (=> d!133425 (= lt!553092 e!691024)))

(declare-fun c!120057 () Bool)

(assert (=> d!133425 (= c!120057 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 lt!552968)))))

(assert (=> d!133425 (validMask!0 mask!1564)))

(assert (=> d!133425 (= (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553092)))

(declare-fun b!1217190 () Bool)

(declare-fun e!691023 () Bool)

(assert (=> b!1217190 (= e!691023 (isEmpty!999 lt!553092))))

(declare-fun b!1217191 () Bool)

(declare-fun lt!553093 () Unit!40211)

(declare-fun lt!553095 () Unit!40211)

(assert (=> b!1217191 (= lt!553093 lt!553095)))

(declare-fun lt!553090 () (_ BitVec 64))

(declare-fun lt!553091 () ListLongMap!18009)

(declare-fun lt!553096 () (_ BitVec 64))

(declare-fun lt!553094 () V!46353)

(assert (=> b!1217191 (not (contains!6981 (+!4090 lt!553091 (tuple2!20041 lt!553090 lt!553094)) lt!553096))))

(assert (=> b!1217191 (= lt!553095 (addStillNotContains!299 lt!553091 lt!553090 lt!553094 lt!553096))))

(assert (=> b!1217191 (= lt!553096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217191 (= lt!553094 (get!19321 (select (arr!37901 lt!552967) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217191 (= lt!553090 (select (arr!37900 lt!552968) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1217191 (= lt!553091 call!60602)))

(declare-fun e!691027 () ListLongMap!18009)

(assert (=> b!1217191 (= e!691027 (+!4090 call!60602 (tuple2!20041 (select (arr!37900 lt!552968) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19321 (select (arr!37901 lt!552967) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217192 () Bool)

(declare-fun e!691029 () Bool)

(assert (=> b!1217192 (= e!691029 e!691023)))

(declare-fun c!120059 () Bool)

(assert (=> b!1217192 (= c!120059 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 lt!552968)))))

(declare-fun b!1217193 () Bool)

(assert (=> b!1217193 (= e!691024 e!691027)))

(declare-fun c!120058 () Bool)

(assert (=> b!1217193 (= c!120058 (validKeyInArray!0 (select (arr!37900 lt!552968) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1217194 () Bool)

(assert (=> b!1217194 (= e!691027 call!60602)))

(declare-fun b!1217195 () Bool)

(assert (=> b!1217195 (= e!691024 (ListLongMap!18010 Nil!26816))))

(declare-fun b!1217196 () Bool)

(declare-fun e!691028 () Bool)

(assert (=> b!1217196 (= e!691029 e!691028)))

(assert (=> b!1217196 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 lt!552968)))))

(declare-fun res!808327 () Bool)

(assert (=> b!1217196 (= res!808327 (contains!6981 lt!553092 (select (arr!37900 lt!552968) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217196 (=> (not res!808327) (not e!691028))))

(declare-fun b!1217197 () Bool)

(assert (=> b!1217197 (= e!691026 e!691029)))

(declare-fun c!120060 () Bool)

(assert (=> b!1217197 (= c!120060 e!691025)))

(declare-fun res!808325 () Bool)

(assert (=> b!1217197 (=> (not res!808325) (not e!691025))))

(assert (=> b!1217197 (= res!808325 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 lt!552968)))))

(declare-fun b!1217198 () Bool)

(assert (=> b!1217198 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 lt!552968)))))

(assert (=> b!1217198 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38439 lt!552967)))))

(assert (=> b!1217198 (= e!691028 (= (apply!963 lt!553092 (select (arr!37900 lt!552968) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19321 (select (arr!37901 lt!552967) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217199 () Bool)

(assert (=> b!1217199 (= e!691023 (= lt!553092 (getCurrentListMapNoExtraKeys!5459 lt!552968 lt!552967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217200 () Bool)

(declare-fun res!808326 () Bool)

(assert (=> b!1217200 (=> (not res!808326) (not e!691026))))

(assert (=> b!1217200 (= res!808326 (not (contains!6981 lt!553092 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133425 c!120057) b!1217195))

(assert (= (and d!133425 (not c!120057)) b!1217193))

(assert (= (and b!1217193 c!120058) b!1217191))

(assert (= (and b!1217193 (not c!120058)) b!1217194))

(assert (= (or b!1217191 b!1217194) bm!60599))

(assert (= (and d!133425 res!808328) b!1217200))

(assert (= (and b!1217200 res!808326) b!1217197))

(assert (= (and b!1217197 res!808325) b!1217189))

(assert (= (and b!1217197 c!120060) b!1217196))

(assert (= (and b!1217197 (not c!120060)) b!1217192))

(assert (= (and b!1217196 res!808327) b!1217198))

(assert (= (and b!1217192 c!120059) b!1217199))

(assert (= (and b!1217192 (not c!120059)) b!1217190))

(declare-fun b_lambda!21899 () Bool)

(assert (=> (not b_lambda!21899) (not b!1217191)))

(assert (=> b!1217191 t!40003))

(declare-fun b_and!43551 () Bool)

(assert (= b_and!43549 (and (=> t!40003 result!22619) b_and!43551)))

(declare-fun b_lambda!21901 () Bool)

(assert (=> (not b_lambda!21901) (not b!1217198)))

(assert (=> b!1217198 t!40003))

(declare-fun b_and!43553 () Bool)

(assert (= b_and!43551 (and (=> t!40003 result!22619) b_and!43553)))

(declare-fun m!1121473 () Bool)

(assert (=> b!1217200 m!1121473))

(declare-fun m!1121475 () Bool)

(assert (=> bm!60599 m!1121475))

(declare-fun m!1121477 () Bool)

(assert (=> d!133425 m!1121477))

(assert (=> d!133425 m!1121243))

(declare-fun m!1121479 () Bool)

(assert (=> b!1217198 m!1121479))

(declare-fun m!1121481 () Bool)

(assert (=> b!1217198 m!1121481))

(assert (=> b!1217198 m!1121249))

(declare-fun m!1121483 () Bool)

(assert (=> b!1217198 m!1121483))

(assert (=> b!1217198 m!1121249))

(assert (=> b!1217198 m!1121479))

(declare-fun m!1121485 () Bool)

(assert (=> b!1217198 m!1121485))

(assert (=> b!1217198 m!1121481))

(assert (=> b!1217196 m!1121479))

(assert (=> b!1217196 m!1121479))

(declare-fun m!1121487 () Bool)

(assert (=> b!1217196 m!1121487))

(declare-fun m!1121489 () Bool)

(assert (=> b!1217190 m!1121489))

(assert (=> b!1217189 m!1121479))

(assert (=> b!1217189 m!1121479))

(declare-fun m!1121491 () Bool)

(assert (=> b!1217189 m!1121491))

(assert (=> b!1217193 m!1121479))

(assert (=> b!1217193 m!1121479))

(assert (=> b!1217193 m!1121491))

(declare-fun m!1121493 () Bool)

(assert (=> b!1217191 m!1121493))

(assert (=> b!1217191 m!1121479))

(declare-fun m!1121495 () Bool)

(assert (=> b!1217191 m!1121495))

(declare-fun m!1121497 () Bool)

(assert (=> b!1217191 m!1121497))

(assert (=> b!1217191 m!1121481))

(assert (=> b!1217191 m!1121249))

(assert (=> b!1217191 m!1121483))

(assert (=> b!1217191 m!1121497))

(declare-fun m!1121499 () Bool)

(assert (=> b!1217191 m!1121499))

(assert (=> b!1217191 m!1121249))

(assert (=> b!1217191 m!1121481))

(assert (=> b!1217199 m!1121475))

(assert (=> b!1216984 d!133425))

(declare-fun call!60603 () ListLongMap!18009)

(declare-fun bm!60600 () Bool)

(assert (=> bm!60600 (= call!60603 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217201 () Bool)

(declare-fun e!691032 () Bool)

(assert (=> b!1217201 (= e!691032 (validKeyInArray!0 (select (arr!37900 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217201 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133427 () Bool)

(declare-fun e!691033 () Bool)

(assert (=> d!133427 e!691033))

(declare-fun res!808332 () Bool)

(assert (=> d!133427 (=> (not res!808332) (not e!691033))))

(declare-fun lt!553099 () ListLongMap!18009)

(assert (=> d!133427 (= res!808332 (not (contains!6981 lt!553099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691031 () ListLongMap!18009)

(assert (=> d!133427 (= lt!553099 e!691031)))

(declare-fun c!120061 () Bool)

(assert (=> d!133427 (= c!120061 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 _keys!1208)))))

(assert (=> d!133427 (validMask!0 mask!1564)))

(assert (=> d!133427 (= (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553099)))

(declare-fun b!1217202 () Bool)

(declare-fun e!691030 () Bool)

(assert (=> b!1217202 (= e!691030 (isEmpty!999 lt!553099))))

(declare-fun b!1217203 () Bool)

(declare-fun lt!553100 () Unit!40211)

(declare-fun lt!553102 () Unit!40211)

(assert (=> b!1217203 (= lt!553100 lt!553102)))

(declare-fun lt!553097 () (_ BitVec 64))

(declare-fun lt!553103 () (_ BitVec 64))

(declare-fun lt!553098 () ListLongMap!18009)

(declare-fun lt!553101 () V!46353)

(assert (=> b!1217203 (not (contains!6981 (+!4090 lt!553098 (tuple2!20041 lt!553097 lt!553101)) lt!553103))))

(assert (=> b!1217203 (= lt!553102 (addStillNotContains!299 lt!553098 lt!553097 lt!553101 lt!553103))))

(assert (=> b!1217203 (= lt!553103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217203 (= lt!553101 (get!19321 (select (arr!37901 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217203 (= lt!553097 (select (arr!37900 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1217203 (= lt!553098 call!60603)))

(declare-fun e!691034 () ListLongMap!18009)

(assert (=> b!1217203 (= e!691034 (+!4090 call!60603 (tuple2!20041 (select (arr!37900 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19321 (select (arr!37901 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217204 () Bool)

(declare-fun e!691036 () Bool)

(assert (=> b!1217204 (= e!691036 e!691030)))

(declare-fun c!120063 () Bool)

(assert (=> b!1217204 (= c!120063 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 _keys!1208)))))

(declare-fun b!1217205 () Bool)

(assert (=> b!1217205 (= e!691031 e!691034)))

(declare-fun c!120062 () Bool)

(assert (=> b!1217205 (= c!120062 (validKeyInArray!0 (select (arr!37900 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1217206 () Bool)

(assert (=> b!1217206 (= e!691034 call!60603)))

(declare-fun b!1217207 () Bool)

(assert (=> b!1217207 (= e!691031 (ListLongMap!18010 Nil!26816))))

(declare-fun b!1217208 () Bool)

(declare-fun e!691035 () Bool)

(assert (=> b!1217208 (= e!691036 e!691035)))

(assert (=> b!1217208 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 _keys!1208)))))

(declare-fun res!808331 () Bool)

(assert (=> b!1217208 (= res!808331 (contains!6981 lt!553099 (select (arr!37900 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217208 (=> (not res!808331) (not e!691035))))

(declare-fun b!1217209 () Bool)

(assert (=> b!1217209 (= e!691033 e!691036)))

(declare-fun c!120064 () Bool)

(assert (=> b!1217209 (= c!120064 e!691032)))

(declare-fun res!808329 () Bool)

(assert (=> b!1217209 (=> (not res!808329) (not e!691032))))

(assert (=> b!1217209 (= res!808329 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 _keys!1208)))))

(declare-fun b!1217210 () Bool)

(assert (=> b!1217210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38438 _keys!1208)))))

(assert (=> b!1217210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38439 _values!996)))))

(assert (=> b!1217210 (= e!691035 (= (apply!963 lt!553099 (select (arr!37900 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19321 (select (arr!37901 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217211 () Bool)

(assert (=> b!1217211 (= e!691030 (= lt!553099 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217212 () Bool)

(declare-fun res!808330 () Bool)

(assert (=> b!1217212 (=> (not res!808330) (not e!691033))))

(assert (=> b!1217212 (= res!808330 (not (contains!6981 lt!553099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133427 c!120061) b!1217207))

(assert (= (and d!133427 (not c!120061)) b!1217205))

(assert (= (and b!1217205 c!120062) b!1217203))

(assert (= (and b!1217205 (not c!120062)) b!1217206))

(assert (= (or b!1217203 b!1217206) bm!60600))

(assert (= (and d!133427 res!808332) b!1217212))

(assert (= (and b!1217212 res!808330) b!1217209))

(assert (= (and b!1217209 res!808329) b!1217201))

(assert (= (and b!1217209 c!120064) b!1217208))

(assert (= (and b!1217209 (not c!120064)) b!1217204))

(assert (= (and b!1217208 res!808331) b!1217210))

(assert (= (and b!1217204 c!120063) b!1217211))

(assert (= (and b!1217204 (not c!120063)) b!1217202))

(declare-fun b_lambda!21903 () Bool)

(assert (=> (not b_lambda!21903) (not b!1217203)))

(assert (=> b!1217203 t!40003))

(declare-fun b_and!43555 () Bool)

(assert (= b_and!43553 (and (=> t!40003 result!22619) b_and!43555)))

(declare-fun b_lambda!21905 () Bool)

(assert (=> (not b_lambda!21905) (not b!1217210)))

(assert (=> b!1217210 t!40003))

(declare-fun b_and!43557 () Bool)

(assert (= b_and!43555 (and (=> t!40003 result!22619) b_and!43557)))

(declare-fun m!1121501 () Bool)

(assert (=> b!1217212 m!1121501))

(declare-fun m!1121503 () Bool)

(assert (=> bm!60600 m!1121503))

(declare-fun m!1121505 () Bool)

(assert (=> d!133427 m!1121505))

(assert (=> d!133427 m!1121243))

(declare-fun m!1121507 () Bool)

(assert (=> b!1217210 m!1121507))

(declare-fun m!1121509 () Bool)

(assert (=> b!1217210 m!1121509))

(assert (=> b!1217210 m!1121249))

(declare-fun m!1121511 () Bool)

(assert (=> b!1217210 m!1121511))

(assert (=> b!1217210 m!1121249))

(assert (=> b!1217210 m!1121507))

(declare-fun m!1121513 () Bool)

(assert (=> b!1217210 m!1121513))

(assert (=> b!1217210 m!1121509))

(assert (=> b!1217208 m!1121507))

(assert (=> b!1217208 m!1121507))

(declare-fun m!1121515 () Bool)

(assert (=> b!1217208 m!1121515))

(declare-fun m!1121517 () Bool)

(assert (=> b!1217202 m!1121517))

(assert (=> b!1217201 m!1121507))

(assert (=> b!1217201 m!1121507))

(declare-fun m!1121519 () Bool)

(assert (=> b!1217201 m!1121519))

(assert (=> b!1217205 m!1121507))

(assert (=> b!1217205 m!1121507))

(assert (=> b!1217205 m!1121519))

(declare-fun m!1121521 () Bool)

(assert (=> b!1217203 m!1121521))

(assert (=> b!1217203 m!1121507))

(declare-fun m!1121523 () Bool)

(assert (=> b!1217203 m!1121523))

(declare-fun m!1121525 () Bool)

(assert (=> b!1217203 m!1121525))

(assert (=> b!1217203 m!1121509))

(assert (=> b!1217203 m!1121249))

(assert (=> b!1217203 m!1121511))

(assert (=> b!1217203 m!1121525))

(declare-fun m!1121527 () Bool)

(assert (=> b!1217203 m!1121527))

(assert (=> b!1217203 m!1121249))

(assert (=> b!1217203 m!1121509))

(assert (=> b!1217211 m!1121503))

(assert (=> b!1216984 d!133427))

(declare-fun d!133429 () Bool)

(declare-fun res!808337 () Bool)

(declare-fun e!691041 () Bool)

(assert (=> d!133429 (=> res!808337 e!691041)))

(assert (=> d!133429 (= res!808337 (= (select (arr!37900 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133429 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691041)))

(declare-fun b!1217217 () Bool)

(declare-fun e!691042 () Bool)

(assert (=> b!1217217 (= e!691041 e!691042)))

(declare-fun res!808338 () Bool)

(assert (=> b!1217217 (=> (not res!808338) (not e!691042))))

(assert (=> b!1217217 (= res!808338 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38438 _keys!1208)))))

(declare-fun b!1217218 () Bool)

(assert (=> b!1217218 (= e!691042 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133429 (not res!808337)) b!1217217))

(assert (= (and b!1217217 res!808338) b!1217218))

(assert (=> d!133429 m!1121367))

(declare-fun m!1121529 () Bool)

(assert (=> b!1217218 m!1121529))

(assert (=> b!1216985 d!133429))

(declare-fun d!133431 () Bool)

(assert (=> d!133431 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553106 () Unit!40211)

(declare-fun choose!13 (array!78530 (_ BitVec 64) (_ BitVec 32)) Unit!40211)

(assert (=> d!133431 (= lt!553106 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133431 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133431 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553106)))

(declare-fun bs!34278 () Bool)

(assert (= bs!34278 d!133431))

(assert (=> bs!34278 m!1121227))

(declare-fun m!1121531 () Bool)

(assert (=> bs!34278 m!1121531))

(assert (=> b!1216985 d!133431))

(declare-fun d!133433 () Bool)

(assert (=> d!133433 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1216976 d!133433))

(declare-fun bm!60601 () Bool)

(declare-fun call!60604 () Bool)

(declare-fun c!120065 () Bool)

(assert (=> bm!60601 (= call!60604 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120065 (Cons!26814 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000) Nil!26815) Nil!26815)))))

(declare-fun b!1217219 () Bool)

(declare-fun e!691045 () Bool)

(declare-fun e!691044 () Bool)

(assert (=> b!1217219 (= e!691045 e!691044)))

(declare-fun res!808341 () Bool)

(assert (=> b!1217219 (=> (not res!808341) (not e!691044))))

(declare-fun e!691043 () Bool)

(assert (=> b!1217219 (= res!808341 (not e!691043))))

(declare-fun res!808339 () Bool)

(assert (=> b!1217219 (=> (not res!808339) (not e!691043))))

(assert (=> b!1217219 (= res!808339 (validKeyInArray!0 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217220 () Bool)

(declare-fun e!691046 () Bool)

(assert (=> b!1217220 (= e!691044 e!691046)))

(assert (=> b!1217220 (= c!120065 (validKeyInArray!0 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217221 () Bool)

(assert (=> b!1217221 (= e!691043 (contains!6980 Nil!26815 (select (arr!37900 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133435 () Bool)

(declare-fun res!808340 () Bool)

(assert (=> d!133435 (=> res!808340 e!691045)))

(assert (=> d!133435 (= res!808340 (bvsge #b00000000000000000000000000000000 (size!38438 _keys!1208)))))

(assert (=> d!133435 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26815) e!691045)))

(declare-fun b!1217222 () Bool)

(assert (=> b!1217222 (= e!691046 call!60604)))

(declare-fun b!1217223 () Bool)

(assert (=> b!1217223 (= e!691046 call!60604)))

(assert (= (and d!133435 (not res!808340)) b!1217219))

(assert (= (and b!1217219 res!808339) b!1217221))

(assert (= (and b!1217219 res!808341) b!1217220))

(assert (= (and b!1217220 c!120065) b!1217222))

(assert (= (and b!1217220 (not c!120065)) b!1217223))

(assert (= (or b!1217222 b!1217223) bm!60601))

(assert (=> bm!60601 m!1121367))

(declare-fun m!1121533 () Bool)

(assert (=> bm!60601 m!1121533))

(assert (=> b!1217219 m!1121367))

(assert (=> b!1217219 m!1121367))

(assert (=> b!1217219 m!1121377))

(assert (=> b!1217220 m!1121367))

(assert (=> b!1217220 m!1121367))

(assert (=> b!1217220 m!1121377))

(assert (=> b!1217221 m!1121367))

(assert (=> b!1217221 m!1121367))

(declare-fun m!1121535 () Bool)

(assert (=> b!1217221 m!1121535))

(assert (=> b!1216977 d!133435))

(declare-fun d!133437 () Bool)

(assert (=> d!133437 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1216982 d!133437))

(declare-fun mapIsEmpty!48262 () Bool)

(declare-fun mapRes!48262 () Bool)

(assert (=> mapIsEmpty!48262 mapRes!48262))

(declare-fun condMapEmpty!48262 () Bool)

(declare-fun mapDefault!48262 () ValueCell!14750)

(assert (=> mapNonEmpty!48253 (= condMapEmpty!48262 (= mapRest!48253 ((as const (Array (_ BitVec 32) ValueCell!14750)) mapDefault!48262)))))

(declare-fun e!691051 () Bool)

(assert (=> mapNonEmpty!48253 (= tp!91666 (and e!691051 mapRes!48262))))

(declare-fun b!1217231 () Bool)

(assert (=> b!1217231 (= e!691051 tp_is_empty!30919)))

(declare-fun b!1217230 () Bool)

(declare-fun e!691052 () Bool)

(assert (=> b!1217230 (= e!691052 tp_is_empty!30919)))

(declare-fun mapNonEmpty!48262 () Bool)

(declare-fun tp!91682 () Bool)

(assert (=> mapNonEmpty!48262 (= mapRes!48262 (and tp!91682 e!691052))))

(declare-fun mapRest!48262 () (Array (_ BitVec 32) ValueCell!14750))

(declare-fun mapKey!48262 () (_ BitVec 32))

(declare-fun mapValue!48262 () ValueCell!14750)

(assert (=> mapNonEmpty!48262 (= mapRest!48253 (store mapRest!48262 mapKey!48262 mapValue!48262))))

(assert (= (and mapNonEmpty!48253 condMapEmpty!48262) mapIsEmpty!48262))

(assert (= (and mapNonEmpty!48253 (not condMapEmpty!48262)) mapNonEmpty!48262))

(assert (= (and mapNonEmpty!48262 ((_ is ValueCellFull!14750) mapValue!48262)) b!1217230))

(assert (= (and mapNonEmpty!48253 ((_ is ValueCellFull!14750) mapDefault!48262)) b!1217231))

(declare-fun m!1121537 () Bool)

(assert (=> mapNonEmpty!48262 m!1121537))

(declare-fun b_lambda!21907 () Bool)

(assert (= b_lambda!21905 (or (and start!101286 b_free!26215) b_lambda!21907)))

(declare-fun b_lambda!21909 () Bool)

(assert (= b_lambda!21903 (or (and start!101286 b_free!26215) b_lambda!21909)))

(declare-fun b_lambda!21911 () Bool)

(assert (= b_lambda!21891 (or (and start!101286 b_free!26215) b_lambda!21911)))

(declare-fun b_lambda!21913 () Bool)

(assert (= b_lambda!21897 (or (and start!101286 b_free!26215) b_lambda!21913)))

(declare-fun b_lambda!21915 () Bool)

(assert (= b_lambda!21895 (or (and start!101286 b_free!26215) b_lambda!21915)))

(declare-fun b_lambda!21917 () Bool)

(assert (= b_lambda!21889 (or (and start!101286 b_free!26215) b_lambda!21917)))

(declare-fun b_lambda!21919 () Bool)

(assert (= b_lambda!21899 (or (and start!101286 b_free!26215) b_lambda!21919)))

(declare-fun b_lambda!21921 () Bool)

(assert (= b_lambda!21901 (or (and start!101286 b_free!26215) b_lambda!21921)))

(declare-fun b_lambda!21923 () Bool)

(assert (= b_lambda!21893 (or (and start!101286 b_free!26215) b_lambda!21923)))

(check-sat tp_is_empty!30919 (not b!1217200) (not bm!60588) (not b!1217201) (not b!1217168) (not b!1217158) (not bm!60600) (not b_lambda!21921) (not b!1217196) (not b_lambda!21907) (not b!1217203) (not b!1217208) (not b!1217190) (not b!1217211) (not b!1217127) (not d!133405) (not mapNonEmpty!48262) (not d!133417) (not bm!60592) (not b!1217160) (not b_lambda!21917) (not b!1217212) (not b!1217219) (not d!133423) (not b!1217198) (not b!1217129) (not d!133427) (not b_lambda!21887) (not b!1217126) (not b!1217179) (not b!1217113) (not bm!60599) (not b!1217121) (not b!1217175) (not bm!60584) (not b!1217157) (not bm!60598) (not b!1217170) (not b!1217172) (not b!1217218) (not b_lambda!21923) (not bm!60587) (not b!1217165) (not b!1217120) (not b_lambda!21915) (not b!1217221) (not b!1217193) (not b!1217191) (not b!1217189) (not b!1217202) (not b_lambda!21909) (not b!1217112) (not d!133431) (not b!1217156) (not bm!60601) (not bm!60597) (not d!133415) (not b!1217220) (not b!1217177) (not d!133425) (not b_lambda!21911) (not b!1217178) (not b!1217163) b_and!43557 (not b!1217111) (not b_next!26215) (not d!133421) (not b_lambda!21919) (not b!1217199) (not b_lambda!21913) (not b!1217167) (not b!1217130) (not bm!60591) (not b!1217099) (not b!1217210) (not b!1217205) (not b!1217098) (not b!1217166) (not b!1217186) (not b!1217169))
(check-sat b_and!43557 (not b_next!26215))
