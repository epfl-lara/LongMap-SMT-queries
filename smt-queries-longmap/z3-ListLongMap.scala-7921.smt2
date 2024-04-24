; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98602 () Bool)

(assert start!98602)

(declare-fun b_free!23971 () Bool)

(declare-fun b_next!23971 () Bool)

(assert (=> start!98602 (= b_free!23971 (not b_next!23971))))

(declare-fun tp!84624 () Bool)

(declare-fun b_and!38793 () Bool)

(assert (=> start!98602 (= tp!84624 b_and!38793)))

(declare-fun b!1135152 () Bool)

(declare-datatypes ((Unit!37119 0))(
  ( (Unit!37120) )
))
(declare-fun e!646136 () Unit!37119)

(declare-fun e!646144 () Unit!37119)

(assert (=> b!1135152 (= e!646136 e!646144)))

(declare-fun c!111083 () Bool)

(declare-fun lt!504399 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1135152 (= c!111083 (and (not lt!504399) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1135153 () Bool)

(declare-fun res!757535 () Bool)

(declare-fun e!646143 () Bool)

(assert (=> b!1135153 (=> (not res!757535) (not e!646143))))

(declare-datatypes ((array!73905 0))(
  ( (array!73906 (arr!35597 (Array (_ BitVec 32) (_ BitVec 64))) (size!36134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73905)

(declare-datatypes ((List!24823 0))(
  ( (Nil!24820) (Cons!24819 (h!26037 (_ BitVec 64)) (t!35778 List!24823)) )
))
(declare-fun arrayNoDuplicates!0 (array!73905 (_ BitVec 32) List!24823) Bool)

(assert (=> b!1135153 (= res!757535 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24820))))

(declare-fun bm!49256 () Bool)

(declare-fun call!49261 () Unit!37119)

(declare-fun call!49266 () Unit!37119)

(assert (=> bm!49256 (= call!49261 call!49266)))

(declare-fun b!1135154 () Bool)

(declare-fun res!757541 () Bool)

(assert (=> b!1135154 (=> (not res!757541) (not e!646143))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135154 (= res!757541 (validMask!0 mask!1564))))

(declare-fun b!1135155 () Bool)

(declare-fun e!646149 () Bool)

(declare-fun e!646145 () Bool)

(assert (=> b!1135155 (= e!646149 e!646145)))

(declare-fun res!757542 () Bool)

(assert (=> b!1135155 (=> res!757542 e!646145)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1135155 (= res!757542 (not (= (select (arr!35597 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646138 () Bool)

(assert (=> b!1135155 e!646138))

(declare-fun c!111085 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135155 (= c!111085 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43129 0))(
  ( (V!43130 (val!14307 Int)) )
))
(declare-fun zeroValue!944 () V!43129)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13541 0))(
  ( (ValueCellFull!13541 (v!16940 V!43129)) (EmptyCell!13541) )
))
(declare-datatypes ((array!73907 0))(
  ( (array!73908 (arr!35598 (Array (_ BitVec 32) ValueCell!13541)) (size!36135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73907)

(declare-fun lt!504400 () Unit!37119)

(declare-fun minValue!944 () V!43129)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!441 (array!73905 array!73907 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37119)

(assert (=> b!1135155 (= lt!504400 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!441 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!18056 0))(
  ( (tuple2!18057 (_1!9039 (_ BitVec 64)) (_2!9039 V!43129)) )
))
(declare-datatypes ((List!24824 0))(
  ( (Nil!24821) (Cons!24820 (h!26038 tuple2!18056) (t!35779 List!24824)) )
))
(declare-datatypes ((ListLongMap!16033 0))(
  ( (ListLongMap!16034 (toList!8032 List!24824)) )
))
(declare-fun lt!504394 () ListLongMap!16033)

(declare-fun bm!49257 () Bool)

(declare-fun c!111084 () Bool)

(declare-fun call!49263 () ListLongMap!16033)

(declare-fun +!3492 (ListLongMap!16033 tuple2!18056) ListLongMap!16033)

(assert (=> bm!49257 (= call!49263 (+!3492 lt!504394 (ite (or c!111084 c!111083) (tuple2!18057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!44576 () Bool)

(declare-fun mapRes!44576 () Bool)

(assert (=> mapIsEmpty!44576 mapRes!44576))

(declare-fun e!646135 () Bool)

(declare-fun b!1135156 () Bool)

(declare-fun arrayContainsKey!0 (array!73905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135156 (= e!646135 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135157 () Bool)

(declare-fun e!646146 () Bool)

(assert (=> b!1135157 (= e!646146 e!646149)))

(declare-fun res!757539 () Bool)

(assert (=> b!1135157 (=> res!757539 e!646149)))

(assert (=> b!1135157 (= res!757539 (not (= from!1455 i!673)))))

(declare-fun lt!504398 () array!73905)

(declare-fun lt!504397 () ListLongMap!16033)

(declare-fun lt!504393 () array!73907)

(declare-fun getCurrentListMapNoExtraKeys!4546 (array!73905 array!73907 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 32) Int) ListLongMap!16033)

(assert (=> b!1135157 (= lt!504397 (getCurrentListMapNoExtraKeys!4546 lt!504398 lt!504393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2603 (Int (_ BitVec 64)) V!43129)

(assert (=> b!1135157 (= lt!504393 (array!73908 (store (arr!35598 _values!996) i!673 (ValueCellFull!13541 (dynLambda!2603 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36135 _values!996)))))

(declare-fun lt!504390 () ListLongMap!16033)

(assert (=> b!1135157 (= lt!504390 (getCurrentListMapNoExtraKeys!4546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!49265 () ListLongMap!16033)

(declare-fun bm!49258 () Bool)

(assert (=> bm!49258 (= call!49265 (getCurrentListMapNoExtraKeys!4546 lt!504398 lt!504393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135158 () Bool)

(declare-fun e!646137 () Bool)

(assert (=> b!1135158 (= e!646145 e!646137)))

(declare-fun res!757538 () Bool)

(assert (=> b!1135158 (=> res!757538 e!646137)))

(declare-fun contains!6567 (ListLongMap!16033 (_ BitVec 64)) Bool)

(assert (=> b!1135158 (= res!757538 (not (contains!6567 lt!504394 k0!934)))))

(assert (=> b!1135158 (= lt!504394 (getCurrentListMapNoExtraKeys!4546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135159 () Bool)

(declare-fun res!757540 () Bool)

(assert (=> b!1135159 (=> (not res!757540) (not e!646143))))

(assert (=> b!1135159 (= res!757540 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36134 _keys!1208))))))

(declare-fun b!1135160 () Bool)

(declare-fun call!49260 () ListLongMap!16033)

(declare-fun -!1184 (ListLongMap!16033 (_ BitVec 64)) ListLongMap!16033)

(assert (=> b!1135160 (= e!646138 (= call!49265 (-!1184 call!49260 k0!934)))))

(declare-fun b!1135161 () Bool)

(assert (=> b!1135161 (= e!646138 (= call!49265 call!49260))))

(declare-fun bm!49259 () Bool)

(declare-fun call!49264 () ListLongMap!16033)

(assert (=> bm!49259 (= call!49264 call!49263)))

(declare-fun b!1135162 () Bool)

(declare-fun e!646140 () Unit!37119)

(declare-fun Unit!37121 () Unit!37119)

(assert (=> b!1135162 (= e!646140 Unit!37121)))

(declare-fun b!1135163 () Bool)

(declare-fun e!646150 () Bool)

(declare-fun e!646147 () Bool)

(assert (=> b!1135163 (= e!646150 (and e!646147 mapRes!44576))))

(declare-fun condMapEmpty!44576 () Bool)

(declare-fun mapDefault!44576 () ValueCell!13541)

(assert (=> b!1135163 (= condMapEmpty!44576 (= (arr!35598 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13541)) mapDefault!44576)))))

(declare-fun b!1135164 () Bool)

(declare-fun res!757543 () Bool)

(declare-fun e!646139 () Bool)

(assert (=> b!1135164 (=> (not res!757543) (not e!646139))))

(assert (=> b!1135164 (= res!757543 (arrayNoDuplicates!0 lt!504398 #b00000000000000000000000000000000 Nil!24820))))

(declare-fun b!1135165 () Bool)

(assert (=> b!1135165 (= e!646137 true)))

(declare-fun e!646142 () Bool)

(assert (=> b!1135165 e!646142))

(declare-fun res!757544 () Bool)

(assert (=> b!1135165 (=> (not res!757544) (not e!646142))))

(assert (=> b!1135165 (= res!757544 e!646135)))

(declare-fun c!111087 () Bool)

(assert (=> b!1135165 (= c!111087 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504389 () Unit!37119)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!328 (array!73905 array!73907 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 64) (_ BitVec 32) Int) Unit!37119)

(assert (=> b!1135165 (= lt!504389 (lemmaListMapContainsThenArrayContainsFrom!328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504403 () Unit!37119)

(assert (=> b!1135165 (= lt!504403 e!646136)))

(assert (=> b!1135165 (= c!111084 (and (not lt!504399) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135165 (= lt!504399 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1135166 () Bool)

(assert (=> b!1135166 (= e!646143 e!646139)))

(declare-fun res!757531 () Bool)

(assert (=> b!1135166 (=> (not res!757531) (not e!646139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73905 (_ BitVec 32)) Bool)

(assert (=> b!1135166 (= res!757531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504398 mask!1564))))

(assert (=> b!1135166 (= lt!504398 (array!73906 (store (arr!35597 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36134 _keys!1208)))))

(declare-fun b!1135167 () Bool)

(declare-fun c!111086 () Bool)

(assert (=> b!1135167 (= c!111086 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504399))))

(assert (=> b!1135167 (= e!646144 e!646140)))

(declare-fun bm!49260 () Bool)

(declare-fun addStillContains!718 (ListLongMap!16033 (_ BitVec 64) V!43129 (_ BitVec 64)) Unit!37119)

(assert (=> bm!49260 (= call!49266 (addStillContains!718 lt!504394 (ite (or c!111084 c!111083) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111084 c!111083) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1135168 () Bool)

(declare-fun res!757536 () Bool)

(assert (=> b!1135168 (=> (not res!757536) (not e!646143))))

(assert (=> b!1135168 (= res!757536 (= (select (arr!35597 _keys!1208) i!673) k0!934))))

(declare-fun b!1135169 () Bool)

(declare-fun lt!504401 () Unit!37119)

(assert (=> b!1135169 (= e!646140 lt!504401)))

(assert (=> b!1135169 (= lt!504401 call!49261)))

(declare-fun call!49262 () Bool)

(assert (=> b!1135169 call!49262))

(declare-fun mapNonEmpty!44576 () Bool)

(declare-fun tp!84623 () Bool)

(declare-fun e!646141 () Bool)

(assert (=> mapNonEmpty!44576 (= mapRes!44576 (and tp!84623 e!646141))))

(declare-fun mapValue!44576 () ValueCell!13541)

(declare-fun mapKey!44576 () (_ BitVec 32))

(declare-fun mapRest!44576 () (Array (_ BitVec 32) ValueCell!13541))

(assert (=> mapNonEmpty!44576 (= (arr!35598 _values!996) (store mapRest!44576 mapKey!44576 mapValue!44576))))

(declare-fun b!1135170 () Bool)

(assert (=> b!1135170 (= e!646135 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504399) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!757532 () Bool)

(assert (=> start!98602 (=> (not res!757532) (not e!646143))))

(assert (=> start!98602 (= res!757532 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36134 _keys!1208))))))

(assert (=> start!98602 e!646143))

(declare-fun tp_is_empty!28501 () Bool)

(assert (=> start!98602 tp_is_empty!28501))

(declare-fun array_inv!27354 (array!73905) Bool)

(assert (=> start!98602 (array_inv!27354 _keys!1208)))

(assert (=> start!98602 true))

(assert (=> start!98602 tp!84624))

(declare-fun array_inv!27355 (array!73907) Bool)

(assert (=> start!98602 (and (array_inv!27355 _values!996) e!646150)))

(declare-fun b!1135171 () Bool)

(assert (=> b!1135171 (= e!646142 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135172 () Bool)

(declare-fun res!757545 () Bool)

(assert (=> b!1135172 (=> (not res!757545) (not e!646143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135172 (= res!757545 (validKeyInArray!0 k0!934))))

(declare-fun b!1135173 () Bool)

(declare-fun lt!504395 () Unit!37119)

(assert (=> b!1135173 (= e!646136 lt!504395)))

(declare-fun lt!504391 () Unit!37119)

(assert (=> b!1135173 (= lt!504391 call!49266)))

(declare-fun lt!504396 () ListLongMap!16033)

(assert (=> b!1135173 (= lt!504396 call!49263)))

(declare-fun call!49259 () Bool)

(assert (=> b!1135173 call!49259))

(assert (=> b!1135173 (= lt!504395 (addStillContains!718 lt!504396 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1135173 (contains!6567 (+!3492 lt!504396 (tuple2!18057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1135174 () Bool)

(assert (=> b!1135174 (= e!646147 tp_is_empty!28501)))

(declare-fun b!1135175 () Bool)

(assert (=> b!1135175 (= e!646141 tp_is_empty!28501)))

(declare-fun b!1135176 () Bool)

(assert (=> b!1135176 (= e!646139 (not e!646146))))

(declare-fun res!757537 () Bool)

(assert (=> b!1135176 (=> res!757537 e!646146)))

(assert (=> b!1135176 (= res!757537 (bvsgt from!1455 i!673))))

(assert (=> b!1135176 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504392 () Unit!37119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73905 (_ BitVec 64) (_ BitVec 32)) Unit!37119)

(assert (=> b!1135176 (= lt!504392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49261 () Bool)

(assert (=> bm!49261 (= call!49262 call!49259)))

(declare-fun bm!49262 () Bool)

(assert (=> bm!49262 (= call!49259 (contains!6567 (ite c!111084 lt!504396 call!49264) k0!934))))

(declare-fun b!1135177 () Bool)

(declare-fun res!757534 () Bool)

(assert (=> b!1135177 (=> (not res!757534) (not e!646143))))

(assert (=> b!1135177 (= res!757534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135178 () Bool)

(assert (=> b!1135178 call!49262))

(declare-fun lt!504402 () Unit!37119)

(assert (=> b!1135178 (= lt!504402 call!49261)))

(assert (=> b!1135178 (= e!646144 lt!504402)))

(declare-fun bm!49263 () Bool)

(assert (=> bm!49263 (= call!49260 (getCurrentListMapNoExtraKeys!4546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135179 () Bool)

(declare-fun res!757533 () Bool)

(assert (=> b!1135179 (=> (not res!757533) (not e!646143))))

(assert (=> b!1135179 (= res!757533 (and (= (size!36135 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36134 _keys!1208) (size!36135 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98602 res!757532) b!1135154))

(assert (= (and b!1135154 res!757541) b!1135179))

(assert (= (and b!1135179 res!757533) b!1135177))

(assert (= (and b!1135177 res!757534) b!1135153))

(assert (= (and b!1135153 res!757535) b!1135159))

(assert (= (and b!1135159 res!757540) b!1135172))

(assert (= (and b!1135172 res!757545) b!1135168))

(assert (= (and b!1135168 res!757536) b!1135166))

(assert (= (and b!1135166 res!757531) b!1135164))

(assert (= (and b!1135164 res!757543) b!1135176))

(assert (= (and b!1135176 (not res!757537)) b!1135157))

(assert (= (and b!1135157 (not res!757539)) b!1135155))

(assert (= (and b!1135155 c!111085) b!1135160))

(assert (= (and b!1135155 (not c!111085)) b!1135161))

(assert (= (or b!1135160 b!1135161) bm!49258))

(assert (= (or b!1135160 b!1135161) bm!49263))

(assert (= (and b!1135155 (not res!757542)) b!1135158))

(assert (= (and b!1135158 (not res!757538)) b!1135165))

(assert (= (and b!1135165 c!111084) b!1135173))

(assert (= (and b!1135165 (not c!111084)) b!1135152))

(assert (= (and b!1135152 c!111083) b!1135178))

(assert (= (and b!1135152 (not c!111083)) b!1135167))

(assert (= (and b!1135167 c!111086) b!1135169))

(assert (= (and b!1135167 (not c!111086)) b!1135162))

(assert (= (or b!1135178 b!1135169) bm!49256))

(assert (= (or b!1135178 b!1135169) bm!49259))

(assert (= (or b!1135178 b!1135169) bm!49261))

(assert (= (or b!1135173 bm!49261) bm!49262))

(assert (= (or b!1135173 bm!49256) bm!49260))

(assert (= (or b!1135173 bm!49259) bm!49257))

(assert (= (and b!1135165 c!111087) b!1135156))

(assert (= (and b!1135165 (not c!111087)) b!1135170))

(assert (= (and b!1135165 res!757544) b!1135171))

(assert (= (and b!1135163 condMapEmpty!44576) mapIsEmpty!44576))

(assert (= (and b!1135163 (not condMapEmpty!44576)) mapNonEmpty!44576))

(get-info :version)

(assert (= (and mapNonEmpty!44576 ((_ is ValueCellFull!13541) mapValue!44576)) b!1135175))

(assert (= (and b!1135163 ((_ is ValueCellFull!13541) mapDefault!44576)) b!1135174))

(assert (= start!98602 b!1135163))

(declare-fun b_lambda!19071 () Bool)

(assert (=> (not b_lambda!19071) (not b!1135157)))

(declare-fun t!35777 () Bool)

(declare-fun tb!8775 () Bool)

(assert (=> (and start!98602 (= defaultEntry!1004 defaultEntry!1004) t!35777) tb!8775))

(declare-fun result!18123 () Bool)

(assert (=> tb!8775 (= result!18123 tp_is_empty!28501)))

(assert (=> b!1135157 t!35777))

(declare-fun b_and!38795 () Bool)

(assert (= b_and!38793 (and (=> t!35777 result!18123) b_and!38795)))

(declare-fun m!1048401 () Bool)

(assert (=> bm!49257 m!1048401))

(declare-fun m!1048403 () Bool)

(assert (=> b!1135153 m!1048403))

(declare-fun m!1048405 () Bool)

(assert (=> b!1135165 m!1048405))

(declare-fun m!1048407 () Bool)

(assert (=> b!1135168 m!1048407))

(declare-fun m!1048409 () Bool)

(assert (=> bm!49262 m!1048409))

(declare-fun m!1048411 () Bool)

(assert (=> b!1135177 m!1048411))

(declare-fun m!1048413 () Bool)

(assert (=> b!1135155 m!1048413))

(declare-fun m!1048415 () Bool)

(assert (=> b!1135155 m!1048415))

(declare-fun m!1048417 () Bool)

(assert (=> b!1135164 m!1048417))

(declare-fun m!1048419 () Bool)

(assert (=> b!1135160 m!1048419))

(declare-fun m!1048421 () Bool)

(assert (=> b!1135166 m!1048421))

(declare-fun m!1048423 () Bool)

(assert (=> b!1135166 m!1048423))

(declare-fun m!1048425 () Bool)

(assert (=> b!1135176 m!1048425))

(declare-fun m!1048427 () Bool)

(assert (=> b!1135176 m!1048427))

(declare-fun m!1048429 () Bool)

(assert (=> b!1135172 m!1048429))

(declare-fun m!1048431 () Bool)

(assert (=> start!98602 m!1048431))

(declare-fun m!1048433 () Bool)

(assert (=> start!98602 m!1048433))

(declare-fun m!1048435 () Bool)

(assert (=> bm!49260 m!1048435))

(declare-fun m!1048437 () Bool)

(assert (=> bm!49258 m!1048437))

(declare-fun m!1048439 () Bool)

(assert (=> mapNonEmpty!44576 m!1048439))

(declare-fun m!1048441 () Bool)

(assert (=> b!1135158 m!1048441))

(declare-fun m!1048443 () Bool)

(assert (=> b!1135158 m!1048443))

(declare-fun m!1048445 () Bool)

(assert (=> b!1135173 m!1048445))

(declare-fun m!1048447 () Bool)

(assert (=> b!1135173 m!1048447))

(assert (=> b!1135173 m!1048447))

(declare-fun m!1048449 () Bool)

(assert (=> b!1135173 m!1048449))

(declare-fun m!1048451 () Bool)

(assert (=> b!1135154 m!1048451))

(declare-fun m!1048453 () Bool)

(assert (=> b!1135171 m!1048453))

(declare-fun m!1048455 () Bool)

(assert (=> b!1135157 m!1048455))

(declare-fun m!1048457 () Bool)

(assert (=> b!1135157 m!1048457))

(declare-fun m!1048459 () Bool)

(assert (=> b!1135157 m!1048459))

(declare-fun m!1048461 () Bool)

(assert (=> b!1135157 m!1048461))

(assert (=> b!1135156 m!1048453))

(assert (=> bm!49263 m!1048443))

(check-sat (not b!1135172) (not b_lambda!19071) (not b!1135164) (not b!1135155) (not bm!49258) (not b_next!23971) (not bm!49260) (not b!1135157) (not bm!49262) (not b!1135173) tp_is_empty!28501 (not mapNonEmpty!44576) (not start!98602) (not bm!49263) (not b!1135160) (not b!1135153) (not b!1135177) (not b!1135166) (not b!1135156) (not b!1135158) (not b!1135171) b_and!38795 (not b!1135154) (not b!1135165) (not bm!49257) (not b!1135176))
(check-sat b_and!38795 (not b_next!23971))
