; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100554 () Bool)

(assert start!100554)

(declare-fun b_free!25705 () Bool)

(declare-fun b_next!25705 () Bool)

(assert (=> start!100554 (= b_free!25705 (not b_next!25705))))

(declare-fun tp!90062 () Bool)

(declare-fun b_and!42279 () Bool)

(assert (=> start!100554 (= tp!90062 b_and!42279)))

(declare-datatypes ((V!45641 0))(
  ( (V!45642 (val!15249 Int)) )
))
(declare-fun zeroValue!944 () V!45641)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57298 () Bool)

(declare-datatypes ((array!77585 0))(
  ( (array!77586 (arr!37433 (Array (_ BitVec 32) (_ BitVec 64))) (size!37970 (_ BitVec 32))) )
))
(declare-fun lt!543701 () array!77585)

(declare-datatypes ((ValueCell!14483 0))(
  ( (ValueCellFull!14483 (v!17883 V!45641)) (EmptyCell!14483) )
))
(declare-datatypes ((array!77587 0))(
  ( (array!77588 (arr!37434 (Array (_ BitVec 32) ValueCell!14483)) (size!37971 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77587)

(declare-fun minValue!944 () V!45641)

(declare-datatypes ((tuple2!19550 0))(
  ( (tuple2!19551 (_1!9786 (_ BitVec 64)) (_2!9786 V!45641)) )
))
(declare-datatypes ((List!26350 0))(
  ( (Nil!26347) (Cons!26346 (h!27564 tuple2!19550) (t!39039 List!26350)) )
))
(declare-datatypes ((ListLongMap!17527 0))(
  ( (ListLongMap!17528 (toList!8779 List!26350)) )
))
(declare-fun call!57301 () ListLongMap!17527)

(declare-fun getCurrentListMapNoExtraKeys!5246 (array!77585 array!77587 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) Int) ListLongMap!17527)

(declare-fun dynLambda!3194 (Int (_ BitVec 64)) V!45641)

(assert (=> bm!57298 (= call!57301 (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198503 () Bool)

(declare-fun res!797267 () Bool)

(declare-fun e!680974 () Bool)

(assert (=> b!1198503 (=> (not res!797267) (not e!680974))))

(declare-fun _keys!1208 () array!77585)

(assert (=> b!1198503 (= res!797267 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37970 _keys!1208))))))

(declare-fun b!1198504 () Bool)

(declare-fun res!797264 () Bool)

(assert (=> b!1198504 (=> (not res!797264) (not e!680974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198504 (= res!797264 (validMask!0 mask!1564))))

(declare-fun b!1198505 () Bool)

(declare-fun e!680971 () Bool)

(declare-fun tp_is_empty!30385 () Bool)

(assert (=> b!1198505 (= e!680971 tp_is_empty!30385)))

(declare-fun b!1198506 () Bool)

(declare-fun res!797272 () Bool)

(assert (=> b!1198506 (=> (not res!797272) (not e!680974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77585 (_ BitVec 32)) Bool)

(assert (=> b!1198506 (= res!797272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198507 () Bool)

(declare-fun e!680972 () Bool)

(assert (=> b!1198507 (= e!680974 e!680972)))

(declare-fun res!797263 () Bool)

(assert (=> b!1198507 (=> (not res!797263) (not e!680972))))

(assert (=> b!1198507 (= res!797263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543701 mask!1564))))

(assert (=> b!1198507 (= lt!543701 (array!77586 (store (arr!37433 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37970 _keys!1208)))))

(declare-fun b!1198508 () Bool)

(declare-fun res!797266 () Bool)

(assert (=> b!1198508 (=> (not res!797266) (not e!680974))))

(declare-datatypes ((List!26351 0))(
  ( (Nil!26348) (Cons!26347 (h!27565 (_ BitVec 64)) (t!39040 List!26351)) )
))
(declare-fun arrayNoDuplicates!0 (array!77585 (_ BitVec 32) List!26351) Bool)

(assert (=> b!1198508 (= res!797266 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26348))))

(declare-fun b!1198509 () Bool)

(declare-fun res!797268 () Bool)

(assert (=> b!1198509 (=> (not res!797268) (not e!680974))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198509 (= res!797268 (= (select (arr!37433 _keys!1208) i!673) k0!934))))

(declare-fun b!1198510 () Bool)

(declare-fun e!680973 () Bool)

(assert (=> b!1198510 (= e!680973 (= (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun e!680968 () Bool)

(assert (=> b!1198510 e!680968))

(declare-fun c!117770 () Bool)

(assert (=> b!1198510 (= c!117770 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39665 0))(
  ( (Unit!39666) )
))
(declare-fun lt!543702 () Unit!39665)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 (array!77585 array!77587 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39665)

(assert (=> b!1198510 (= lt!543702 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198511 () Bool)

(declare-fun res!797269 () Bool)

(assert (=> b!1198511 (=> (not res!797269) (not e!680974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198511 (= res!797269 (validKeyInArray!0 k0!934))))

(declare-fun b!1198512 () Bool)

(declare-fun e!680969 () Bool)

(declare-fun e!680975 () Bool)

(declare-fun mapRes!47414 () Bool)

(assert (=> b!1198512 (= e!680969 (and e!680975 mapRes!47414))))

(declare-fun condMapEmpty!47414 () Bool)

(declare-fun mapDefault!47414 () ValueCell!14483)

(assert (=> b!1198512 (= condMapEmpty!47414 (= (arr!37434 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14483)) mapDefault!47414)))))

(declare-fun b!1198502 () Bool)

(assert (=> b!1198502 (= e!680975 tp_is_empty!30385)))

(declare-fun res!797270 () Bool)

(assert (=> start!100554 (=> (not res!797270) (not e!680974))))

(assert (=> start!100554 (= res!797270 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37970 _keys!1208))))))

(assert (=> start!100554 e!680974))

(assert (=> start!100554 tp_is_empty!30385))

(declare-fun array_inv!28600 (array!77585) Bool)

(assert (=> start!100554 (array_inv!28600 _keys!1208)))

(assert (=> start!100554 true))

(assert (=> start!100554 tp!90062))

(declare-fun array_inv!28601 (array!77587) Bool)

(assert (=> start!100554 (and (array_inv!28601 _values!996) e!680969)))

(declare-fun b!1198513 () Bool)

(declare-fun res!797271 () Bool)

(assert (=> b!1198513 (=> (not res!797271) (not e!680974))))

(assert (=> b!1198513 (= res!797271 (and (= (size!37971 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37970 _keys!1208) (size!37971 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57299 () Bool)

(declare-fun call!57302 () ListLongMap!17527)

(assert (=> bm!57299 (= call!57302 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198514 () Bool)

(assert (=> b!1198514 (= e!680968 (= call!57301 call!57302))))

(declare-fun mapNonEmpty!47414 () Bool)

(declare-fun tp!90063 () Bool)

(assert (=> mapNonEmpty!47414 (= mapRes!47414 (and tp!90063 e!680971))))

(declare-fun mapRest!47414 () (Array (_ BitVec 32) ValueCell!14483))

(declare-fun mapValue!47414 () ValueCell!14483)

(declare-fun mapKey!47414 () (_ BitVec 32))

(assert (=> mapNonEmpty!47414 (= (arr!37434 _values!996) (store mapRest!47414 mapKey!47414 mapValue!47414))))

(declare-fun b!1198515 () Bool)

(assert (=> b!1198515 (= e!680972 (not e!680973))))

(declare-fun res!797265 () Bool)

(assert (=> b!1198515 (=> res!797265 e!680973)))

(assert (=> b!1198515 (= res!797265 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198515 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543703 () Unit!39665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77585 (_ BitVec 64) (_ BitVec 32)) Unit!39665)

(assert (=> b!1198515 (= lt!543703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198516 () Bool)

(declare-fun res!797273 () Bool)

(assert (=> b!1198516 (=> (not res!797273) (not e!680972))))

(assert (=> b!1198516 (= res!797273 (arrayNoDuplicates!0 lt!543701 #b00000000000000000000000000000000 Nil!26348))))

(declare-fun mapIsEmpty!47414 () Bool)

(assert (=> mapIsEmpty!47414 mapRes!47414))

(declare-fun b!1198517 () Bool)

(declare-fun -!1778 (ListLongMap!17527 (_ BitVec 64)) ListLongMap!17527)

(assert (=> b!1198517 (= e!680968 (= call!57301 (-!1778 call!57302 k0!934)))))

(assert (= (and start!100554 res!797270) b!1198504))

(assert (= (and b!1198504 res!797264) b!1198513))

(assert (= (and b!1198513 res!797271) b!1198506))

(assert (= (and b!1198506 res!797272) b!1198508))

(assert (= (and b!1198508 res!797266) b!1198503))

(assert (= (and b!1198503 res!797267) b!1198511))

(assert (= (and b!1198511 res!797269) b!1198509))

(assert (= (and b!1198509 res!797268) b!1198507))

(assert (= (and b!1198507 res!797263) b!1198516))

(assert (= (and b!1198516 res!797273) b!1198515))

(assert (= (and b!1198515 (not res!797265)) b!1198510))

(assert (= (and b!1198510 c!117770) b!1198517))

(assert (= (and b!1198510 (not c!117770)) b!1198514))

(assert (= (or b!1198517 b!1198514) bm!57298))

(assert (= (or b!1198517 b!1198514) bm!57299))

(assert (= (and b!1198512 condMapEmpty!47414) mapIsEmpty!47414))

(assert (= (and b!1198512 (not condMapEmpty!47414)) mapNonEmpty!47414))

(get-info :version)

(assert (= (and mapNonEmpty!47414 ((_ is ValueCellFull!14483) mapValue!47414)) b!1198505))

(assert (= (and b!1198512 ((_ is ValueCellFull!14483) mapDefault!47414)) b!1198502))

(assert (= start!100554 b!1198512))

(declare-fun b_lambda!20843 () Bool)

(assert (=> (not b_lambda!20843) (not bm!57298)))

(declare-fun t!39038 () Bool)

(declare-fun tb!10509 () Bool)

(assert (=> (and start!100554 (= defaultEntry!1004 defaultEntry!1004) t!39038) tb!10509))

(declare-fun result!21599 () Bool)

(assert (=> tb!10509 (= result!21599 tp_is_empty!30385)))

(assert (=> bm!57298 t!39038))

(declare-fun b_and!42281 () Bool)

(assert (= b_and!42279 (and (=> t!39038 result!21599) b_and!42281)))

(declare-fun b_lambda!20845 () Bool)

(assert (=> (not b_lambda!20845) (not b!1198510)))

(assert (=> b!1198510 t!39038))

(declare-fun b_and!42283 () Bool)

(assert (= b_and!42281 (and (=> t!39038 result!21599) b_and!42283)))

(declare-fun m!1105815 () Bool)

(assert (=> start!100554 m!1105815))

(declare-fun m!1105817 () Bool)

(assert (=> start!100554 m!1105817))

(declare-fun m!1105819 () Bool)

(assert (=> bm!57298 m!1105819))

(declare-fun m!1105821 () Bool)

(assert (=> bm!57298 m!1105821))

(declare-fun m!1105823 () Bool)

(assert (=> bm!57298 m!1105823))

(declare-fun m!1105825 () Bool)

(assert (=> b!1198508 m!1105825))

(assert (=> b!1198510 m!1105819))

(assert (=> b!1198510 m!1105821))

(declare-fun m!1105827 () Bool)

(assert (=> b!1198510 m!1105827))

(declare-fun m!1105829 () Bool)

(assert (=> b!1198510 m!1105829))

(declare-fun m!1105831 () Bool)

(assert (=> b!1198510 m!1105831))

(declare-fun m!1105833 () Bool)

(assert (=> b!1198509 m!1105833))

(declare-fun m!1105835 () Bool)

(assert (=> bm!57299 m!1105835))

(declare-fun m!1105837 () Bool)

(assert (=> b!1198516 m!1105837))

(declare-fun m!1105839 () Bool)

(assert (=> b!1198511 m!1105839))

(declare-fun m!1105841 () Bool)

(assert (=> b!1198507 m!1105841))

(declare-fun m!1105843 () Bool)

(assert (=> b!1198507 m!1105843))

(declare-fun m!1105845 () Bool)

(assert (=> b!1198506 m!1105845))

(declare-fun m!1105847 () Bool)

(assert (=> b!1198515 m!1105847))

(declare-fun m!1105849 () Bool)

(assert (=> b!1198515 m!1105849))

(declare-fun m!1105851 () Bool)

(assert (=> mapNonEmpty!47414 m!1105851))

(declare-fun m!1105853 () Bool)

(assert (=> b!1198504 m!1105853))

(declare-fun m!1105855 () Bool)

(assert (=> b!1198517 m!1105855))

(check-sat (not b!1198506) (not b!1198516) (not b!1198510) tp_is_empty!30385 (not b_lambda!20843) (not bm!57298) (not mapNonEmpty!47414) (not b!1198504) (not start!100554) (not bm!57299) (not b!1198515) (not b!1198517) b_and!42283 (not b_lambda!20845) (not b!1198508) (not b!1198511) (not b_next!25705) (not b!1198507))
(check-sat b_and!42283 (not b_next!25705))
(get-model)

(declare-fun b_lambda!20855 () Bool)

(assert (= b_lambda!20843 (or (and start!100554 b_free!25705) b_lambda!20855)))

(declare-fun b_lambda!20857 () Bool)

(assert (= b_lambda!20845 (or (and start!100554 b_free!25705) b_lambda!20857)))

(check-sat (not b!1198506) (not b!1198516) (not b!1198510) tp_is_empty!30385 b_and!42283 (not bm!57298) (not mapNonEmpty!47414) (not b!1198504) (not b_lambda!20855) (not start!100554) (not bm!57299) (not b!1198515) (not b!1198517) (not b!1198508) (not b!1198511) (not b_lambda!20857) (not b_next!25705) (not b!1198507))
(check-sat b_and!42283 (not b_next!25705))
(get-model)

(declare-fun d!132797 () Bool)

(assert (=> d!132797 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1198511 d!132797))

(declare-fun b!1198644 () Bool)

(declare-fun e!681043 () Bool)

(assert (=> b!1198644 (= e!681043 (validKeyInArray!0 (select (arr!37433 lt!543701) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1198644 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1198645 () Bool)

(declare-fun e!681041 () Bool)

(declare-fun e!681038 () Bool)

(assert (=> b!1198645 (= e!681041 e!681038)))

(declare-fun c!117787 () Bool)

(assert (=> b!1198645 (= c!117787 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 lt!543701)))))

(declare-fun b!1198646 () Bool)

(declare-fun lt!543737 () ListLongMap!17527)

(assert (=> b!1198646 (= e!681038 (= lt!543737 (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198647 () Bool)

(declare-fun res!797351 () Bool)

(declare-fun e!681039 () Bool)

(assert (=> b!1198647 (=> (not res!797351) (not e!681039))))

(declare-fun contains!6896 (ListLongMap!17527 (_ BitVec 64)) Bool)

(assert (=> b!1198647 (= res!797351 (not (contains!6896 lt!543737 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1198648 () Bool)

(declare-fun isEmpty!982 (ListLongMap!17527) Bool)

(assert (=> b!1198648 (= e!681038 (isEmpty!982 lt!543737))))

(declare-fun b!1198649 () Bool)

(assert (=> b!1198649 (= e!681039 e!681041)))

(declare-fun c!117786 () Bool)

(assert (=> b!1198649 (= c!117786 e!681043)))

(declare-fun res!797349 () Bool)

(assert (=> b!1198649 (=> (not res!797349) (not e!681043))))

(assert (=> b!1198649 (= res!797349 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 lt!543701)))))

(declare-fun b!1198650 () Bool)

(declare-fun e!681040 () ListLongMap!17527)

(declare-fun call!57317 () ListLongMap!17527)

(assert (=> b!1198650 (= e!681040 call!57317)))

(declare-fun b!1198651 () Bool)

(declare-fun lt!543739 () Unit!39665)

(declare-fun lt!543738 () Unit!39665)

(assert (=> b!1198651 (= lt!543739 lt!543738)))

(declare-fun lt!543740 () ListLongMap!17527)

(declare-fun lt!543742 () (_ BitVec 64))

(declare-fun lt!543736 () (_ BitVec 64))

(declare-fun lt!543741 () V!45641)

(declare-fun +!3996 (ListLongMap!17527 tuple2!19550) ListLongMap!17527)

(assert (=> b!1198651 (not (contains!6896 (+!3996 lt!543740 (tuple2!19551 lt!543736 lt!543741)) lt!543742))))

(declare-fun addStillNotContains!288 (ListLongMap!17527 (_ BitVec 64) V!45641 (_ BitVec 64)) Unit!39665)

(assert (=> b!1198651 (= lt!543738 (addStillNotContains!288 lt!543740 lt!543736 lt!543741 lt!543742))))

(assert (=> b!1198651 (= lt!543742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19159 (ValueCell!14483 V!45641) V!45641)

(assert (=> b!1198651 (= lt!543741 (get!19159 (select (arr!37434 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198651 (= lt!543736 (select (arr!37433 lt!543701) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1198651 (= lt!543740 call!57317)))

(assert (=> b!1198651 (= e!681040 (+!3996 call!57317 (tuple2!19551 (select (arr!37433 lt!543701) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19159 (select (arr!37434 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198652 () Bool)

(declare-fun e!681042 () ListLongMap!17527)

(assert (=> b!1198652 (= e!681042 e!681040)))

(declare-fun c!117785 () Bool)

(assert (=> b!1198652 (= c!117785 (validKeyInArray!0 (select (arr!37433 lt!543701) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!132799 () Bool)

(assert (=> d!132799 e!681039))

(declare-fun res!797348 () Bool)

(assert (=> d!132799 (=> (not res!797348) (not e!681039))))

(assert (=> d!132799 (= res!797348 (not (contains!6896 lt!543737 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132799 (= lt!543737 e!681042)))

(declare-fun c!117788 () Bool)

(assert (=> d!132799 (= c!117788 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 lt!543701)))))

(assert (=> d!132799 (validMask!0 mask!1564)))

(assert (=> d!132799 (= (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543737)))

(declare-fun bm!57314 () Bool)

(assert (=> bm!57314 (= call!57317 (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1198653 () Bool)

(assert (=> b!1198653 (= e!681042 (ListLongMap!17528 Nil!26347))))

(declare-fun b!1198654 () Bool)

(assert (=> b!1198654 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 lt!543701)))))

(assert (=> b!1198654 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37971 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)))))))

(declare-fun e!681044 () Bool)

(declare-fun apply!967 (ListLongMap!17527 (_ BitVec 64)) V!45641)

(assert (=> b!1198654 (= e!681044 (= (apply!967 lt!543737 (select (arr!37433 lt!543701) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19159 (select (arr!37434 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1198655 () Bool)

(assert (=> b!1198655 (= e!681041 e!681044)))

(assert (=> b!1198655 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 lt!543701)))))

(declare-fun res!797350 () Bool)

(assert (=> b!1198655 (= res!797350 (contains!6896 lt!543737 (select (arr!37433 lt!543701) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1198655 (=> (not res!797350) (not e!681044))))

(assert (= (and d!132799 c!117788) b!1198653))

(assert (= (and d!132799 (not c!117788)) b!1198652))

(assert (= (and b!1198652 c!117785) b!1198651))

(assert (= (and b!1198652 (not c!117785)) b!1198650))

(assert (= (or b!1198651 b!1198650) bm!57314))

(assert (= (and d!132799 res!797348) b!1198647))

(assert (= (and b!1198647 res!797351) b!1198649))

(assert (= (and b!1198649 res!797349) b!1198644))

(assert (= (and b!1198649 c!117786) b!1198655))

(assert (= (and b!1198649 (not c!117786)) b!1198645))

(assert (= (and b!1198655 res!797350) b!1198654))

(assert (= (and b!1198645 c!117787) b!1198646))

(assert (= (and b!1198645 (not c!117787)) b!1198648))

(declare-fun b_lambda!20859 () Bool)

(assert (=> (not b_lambda!20859) (not b!1198651)))

(assert (=> b!1198651 t!39038))

(declare-fun b_and!42297 () Bool)

(assert (= b_and!42283 (and (=> t!39038 result!21599) b_and!42297)))

(declare-fun b_lambda!20861 () Bool)

(assert (=> (not b_lambda!20861) (not b!1198654)))

(assert (=> b!1198654 t!39038))

(declare-fun b_and!42299 () Bool)

(assert (= b_and!42297 (and (=> t!39038 result!21599) b_and!42299)))

(declare-fun m!1105941 () Bool)

(assert (=> b!1198652 m!1105941))

(assert (=> b!1198652 m!1105941))

(declare-fun m!1105943 () Bool)

(assert (=> b!1198652 m!1105943))

(declare-fun m!1105945 () Bool)

(assert (=> b!1198647 m!1105945))

(assert (=> b!1198655 m!1105941))

(assert (=> b!1198655 m!1105941))

(declare-fun m!1105947 () Bool)

(assert (=> b!1198655 m!1105947))

(assert (=> b!1198654 m!1105941))

(declare-fun m!1105949 () Bool)

(assert (=> b!1198654 m!1105949))

(declare-fun m!1105951 () Bool)

(assert (=> b!1198654 m!1105951))

(assert (=> b!1198654 m!1105941))

(assert (=> b!1198654 m!1105951))

(assert (=> b!1198654 m!1105819))

(declare-fun m!1105953 () Bool)

(assert (=> b!1198654 m!1105953))

(assert (=> b!1198654 m!1105819))

(declare-fun m!1105955 () Bool)

(assert (=> b!1198651 m!1105955))

(declare-fun m!1105957 () Bool)

(assert (=> b!1198651 m!1105957))

(assert (=> b!1198651 m!1105951))

(assert (=> b!1198651 m!1105955))

(assert (=> b!1198651 m!1105941))

(declare-fun m!1105959 () Bool)

(assert (=> b!1198651 m!1105959))

(assert (=> b!1198651 m!1105951))

(assert (=> b!1198651 m!1105819))

(assert (=> b!1198651 m!1105953))

(assert (=> b!1198651 m!1105819))

(declare-fun m!1105961 () Bool)

(assert (=> b!1198651 m!1105961))

(declare-fun m!1105963 () Bool)

(assert (=> bm!57314 m!1105963))

(declare-fun m!1105965 () Bool)

(assert (=> b!1198648 m!1105965))

(assert (=> b!1198644 m!1105941))

(assert (=> b!1198644 m!1105941))

(assert (=> b!1198644 m!1105943))

(assert (=> b!1198646 m!1105963))

(declare-fun m!1105967 () Bool)

(assert (=> d!132799 m!1105967))

(assert (=> d!132799 m!1105853))

(assert (=> bm!57298 d!132799))

(declare-fun b!1198656 () Bool)

(declare-fun e!681050 () Bool)

(assert (=> b!1198656 (= e!681050 (validKeyInArray!0 (select (arr!37433 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1198656 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1198657 () Bool)

(declare-fun e!681048 () Bool)

(declare-fun e!681045 () Bool)

(assert (=> b!1198657 (= e!681048 e!681045)))

(declare-fun c!117791 () Bool)

(assert (=> b!1198657 (= c!117791 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)))))

(declare-fun lt!543744 () ListLongMap!17527)

(declare-fun b!1198658 () Bool)

(assert (=> b!1198658 (= e!681045 (= lt!543744 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198659 () Bool)

(declare-fun res!797355 () Bool)

(declare-fun e!681046 () Bool)

(assert (=> b!1198659 (=> (not res!797355) (not e!681046))))

(assert (=> b!1198659 (= res!797355 (not (contains!6896 lt!543744 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1198660 () Bool)

(assert (=> b!1198660 (= e!681045 (isEmpty!982 lt!543744))))

(declare-fun b!1198661 () Bool)

(assert (=> b!1198661 (= e!681046 e!681048)))

(declare-fun c!117790 () Bool)

(assert (=> b!1198661 (= c!117790 e!681050)))

(declare-fun res!797353 () Bool)

(assert (=> b!1198661 (=> (not res!797353) (not e!681050))))

(assert (=> b!1198661 (= res!797353 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)))))

(declare-fun b!1198662 () Bool)

(declare-fun e!681047 () ListLongMap!17527)

(declare-fun call!57318 () ListLongMap!17527)

(assert (=> b!1198662 (= e!681047 call!57318)))

(declare-fun b!1198663 () Bool)

(declare-fun lt!543746 () Unit!39665)

(declare-fun lt!543745 () Unit!39665)

(assert (=> b!1198663 (= lt!543746 lt!543745)))

(declare-fun lt!543748 () V!45641)

(declare-fun lt!543749 () (_ BitVec 64))

(declare-fun lt!543743 () (_ BitVec 64))

(declare-fun lt!543747 () ListLongMap!17527)

(assert (=> b!1198663 (not (contains!6896 (+!3996 lt!543747 (tuple2!19551 lt!543743 lt!543748)) lt!543749))))

(assert (=> b!1198663 (= lt!543745 (addStillNotContains!288 lt!543747 lt!543743 lt!543748 lt!543749))))

(assert (=> b!1198663 (= lt!543749 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1198663 (= lt!543748 (get!19159 (select (arr!37434 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198663 (= lt!543743 (select (arr!37433 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1198663 (= lt!543747 call!57318)))

(assert (=> b!1198663 (= e!681047 (+!3996 call!57318 (tuple2!19551 (select (arr!37433 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19159 (select (arr!37434 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198664 () Bool)

(declare-fun e!681049 () ListLongMap!17527)

(assert (=> b!1198664 (= e!681049 e!681047)))

(declare-fun c!117789 () Bool)

(assert (=> b!1198664 (= c!117789 (validKeyInArray!0 (select (arr!37433 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!132801 () Bool)

(assert (=> d!132801 e!681046))

(declare-fun res!797352 () Bool)

(assert (=> d!132801 (=> (not res!797352) (not e!681046))))

(assert (=> d!132801 (= res!797352 (not (contains!6896 lt!543744 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132801 (= lt!543744 e!681049)))

(declare-fun c!117792 () Bool)

(assert (=> d!132801 (= c!117792 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)))))

(assert (=> d!132801 (validMask!0 mask!1564)))

(assert (=> d!132801 (= (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543744)))

(declare-fun bm!57315 () Bool)

(assert (=> bm!57315 (= call!57318 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1198665 () Bool)

(assert (=> b!1198665 (= e!681049 (ListLongMap!17528 Nil!26347))))

(declare-fun b!1198666 () Bool)

(assert (=> b!1198666 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)))))

(assert (=> b!1198666 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37971 _values!996)))))

(declare-fun e!681051 () Bool)

(assert (=> b!1198666 (= e!681051 (= (apply!967 lt!543744 (select (arr!37433 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19159 (select (arr!37434 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1198667 () Bool)

(assert (=> b!1198667 (= e!681048 e!681051)))

(assert (=> b!1198667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)))))

(declare-fun res!797354 () Bool)

(assert (=> b!1198667 (= res!797354 (contains!6896 lt!543744 (select (arr!37433 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1198667 (=> (not res!797354) (not e!681051))))

(assert (= (and d!132801 c!117792) b!1198665))

(assert (= (and d!132801 (not c!117792)) b!1198664))

(assert (= (and b!1198664 c!117789) b!1198663))

(assert (= (and b!1198664 (not c!117789)) b!1198662))

(assert (= (or b!1198663 b!1198662) bm!57315))

(assert (= (and d!132801 res!797352) b!1198659))

(assert (= (and b!1198659 res!797355) b!1198661))

(assert (= (and b!1198661 res!797353) b!1198656))

(assert (= (and b!1198661 c!117790) b!1198667))

(assert (= (and b!1198661 (not c!117790)) b!1198657))

(assert (= (and b!1198667 res!797354) b!1198666))

(assert (= (and b!1198657 c!117791) b!1198658))

(assert (= (and b!1198657 (not c!117791)) b!1198660))

(declare-fun b_lambda!20863 () Bool)

(assert (=> (not b_lambda!20863) (not b!1198663)))

(assert (=> b!1198663 t!39038))

(declare-fun b_and!42301 () Bool)

(assert (= b_and!42299 (and (=> t!39038 result!21599) b_and!42301)))

(declare-fun b_lambda!20865 () Bool)

(assert (=> (not b_lambda!20865) (not b!1198666)))

(assert (=> b!1198666 t!39038))

(declare-fun b_and!42303 () Bool)

(assert (= b_and!42301 (and (=> t!39038 result!21599) b_and!42303)))

(declare-fun m!1105969 () Bool)

(assert (=> b!1198664 m!1105969))

(assert (=> b!1198664 m!1105969))

(declare-fun m!1105971 () Bool)

(assert (=> b!1198664 m!1105971))

(declare-fun m!1105973 () Bool)

(assert (=> b!1198659 m!1105973))

(assert (=> b!1198667 m!1105969))

(assert (=> b!1198667 m!1105969))

(declare-fun m!1105975 () Bool)

(assert (=> b!1198667 m!1105975))

(assert (=> b!1198666 m!1105969))

(declare-fun m!1105977 () Bool)

(assert (=> b!1198666 m!1105977))

(declare-fun m!1105979 () Bool)

(assert (=> b!1198666 m!1105979))

(assert (=> b!1198666 m!1105969))

(assert (=> b!1198666 m!1105979))

(assert (=> b!1198666 m!1105819))

(declare-fun m!1105981 () Bool)

(assert (=> b!1198666 m!1105981))

(assert (=> b!1198666 m!1105819))

(declare-fun m!1105983 () Bool)

(assert (=> b!1198663 m!1105983))

(declare-fun m!1105985 () Bool)

(assert (=> b!1198663 m!1105985))

(assert (=> b!1198663 m!1105979))

(assert (=> b!1198663 m!1105983))

(assert (=> b!1198663 m!1105969))

(declare-fun m!1105987 () Bool)

(assert (=> b!1198663 m!1105987))

(assert (=> b!1198663 m!1105979))

(assert (=> b!1198663 m!1105819))

(assert (=> b!1198663 m!1105981))

(assert (=> b!1198663 m!1105819))

(declare-fun m!1105989 () Bool)

(assert (=> b!1198663 m!1105989))

(declare-fun m!1105991 () Bool)

(assert (=> bm!57315 m!1105991))

(declare-fun m!1105993 () Bool)

(assert (=> b!1198660 m!1105993))

(assert (=> b!1198656 m!1105969))

(assert (=> b!1198656 m!1105969))

(assert (=> b!1198656 m!1105971))

(assert (=> b!1198658 m!1105991))

(declare-fun m!1105995 () Bool)

(assert (=> d!132801 m!1105995))

(assert (=> d!132801 m!1105853))

(assert (=> bm!57299 d!132801))

(declare-fun d!132803 () Bool)

(assert (=> d!132803 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1198504 d!132803))

(declare-fun b!1198676 () Bool)

(declare-fun e!681059 () Bool)

(declare-fun call!57321 () Bool)

(assert (=> b!1198676 (= e!681059 call!57321)))

(declare-fun b!1198678 () Bool)

(declare-fun e!681058 () Bool)

(assert (=> b!1198678 (= e!681058 e!681059)))

(declare-fun c!117795 () Bool)

(assert (=> b!1198678 (= c!117795 (validKeyInArray!0 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1198679 () Bool)

(declare-fun e!681060 () Bool)

(assert (=> b!1198679 (= e!681059 e!681060)))

(declare-fun lt!543756 () (_ BitVec 64))

(assert (=> b!1198679 (= lt!543756 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543758 () Unit!39665)

(assert (=> b!1198679 (= lt!543758 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543756 #b00000000000000000000000000000000))))

(assert (=> b!1198679 (arrayContainsKey!0 _keys!1208 lt!543756 #b00000000000000000000000000000000)))

(declare-fun lt!543757 () Unit!39665)

(assert (=> b!1198679 (= lt!543757 lt!543758)))

(declare-fun res!797361 () Bool)

(declare-datatypes ((SeekEntryResult!9887 0))(
  ( (MissingZero!9887 (index!41919 (_ BitVec 32))) (Found!9887 (index!41920 (_ BitVec 32))) (Intermediate!9887 (undefined!10699 Bool) (index!41921 (_ BitVec 32)) (x!105848 (_ BitVec 32))) (Undefined!9887) (MissingVacant!9887 (index!41922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77585 (_ BitVec 32)) SeekEntryResult!9887)

(assert (=> b!1198679 (= res!797361 (= (seekEntryOrOpen!0 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9887 #b00000000000000000000000000000000)))))

(assert (=> b!1198679 (=> (not res!797361) (not e!681060))))

(declare-fun bm!57318 () Bool)

(assert (=> bm!57318 (= call!57321 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!132805 () Bool)

(declare-fun res!797360 () Bool)

(assert (=> d!132805 (=> res!797360 e!681058)))

(assert (=> d!132805 (= res!797360 (bvsge #b00000000000000000000000000000000 (size!37970 _keys!1208)))))

(assert (=> d!132805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!681058)))

(declare-fun b!1198677 () Bool)

(assert (=> b!1198677 (= e!681060 call!57321)))

(assert (= (and d!132805 (not res!797360)) b!1198678))

(assert (= (and b!1198678 c!117795) b!1198679))

(assert (= (and b!1198678 (not c!117795)) b!1198676))

(assert (= (and b!1198679 res!797361) b!1198677))

(assert (= (or b!1198677 b!1198676) bm!57318))

(declare-fun m!1105997 () Bool)

(assert (=> b!1198678 m!1105997))

(assert (=> b!1198678 m!1105997))

(declare-fun m!1105999 () Bool)

(assert (=> b!1198678 m!1105999))

(assert (=> b!1198679 m!1105997))

(declare-fun m!1106001 () Bool)

(assert (=> b!1198679 m!1106001))

(declare-fun m!1106003 () Bool)

(assert (=> b!1198679 m!1106003))

(assert (=> b!1198679 m!1105997))

(declare-fun m!1106005 () Bool)

(assert (=> b!1198679 m!1106005))

(declare-fun m!1106007 () Bool)

(assert (=> bm!57318 m!1106007))

(assert (=> b!1198506 d!132805))

(declare-fun b!1198680 () Bool)

(declare-fun e!681062 () Bool)

(declare-fun call!57322 () Bool)

(assert (=> b!1198680 (= e!681062 call!57322)))

(declare-fun b!1198682 () Bool)

(declare-fun e!681061 () Bool)

(assert (=> b!1198682 (= e!681061 e!681062)))

(declare-fun c!117796 () Bool)

(assert (=> b!1198682 (= c!117796 (validKeyInArray!0 (select (arr!37433 lt!543701) #b00000000000000000000000000000000)))))

(declare-fun b!1198683 () Bool)

(declare-fun e!681063 () Bool)

(assert (=> b!1198683 (= e!681062 e!681063)))

(declare-fun lt!543759 () (_ BitVec 64))

(assert (=> b!1198683 (= lt!543759 (select (arr!37433 lt!543701) #b00000000000000000000000000000000))))

(declare-fun lt!543761 () Unit!39665)

(assert (=> b!1198683 (= lt!543761 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543701 lt!543759 #b00000000000000000000000000000000))))

(assert (=> b!1198683 (arrayContainsKey!0 lt!543701 lt!543759 #b00000000000000000000000000000000)))

(declare-fun lt!543760 () Unit!39665)

(assert (=> b!1198683 (= lt!543760 lt!543761)))

(declare-fun res!797363 () Bool)

(assert (=> b!1198683 (= res!797363 (= (seekEntryOrOpen!0 (select (arr!37433 lt!543701) #b00000000000000000000000000000000) lt!543701 mask!1564) (Found!9887 #b00000000000000000000000000000000)))))

(assert (=> b!1198683 (=> (not res!797363) (not e!681063))))

(declare-fun bm!57319 () Bool)

(assert (=> bm!57319 (= call!57322 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543701 mask!1564))))

(declare-fun d!132807 () Bool)

(declare-fun res!797362 () Bool)

(assert (=> d!132807 (=> res!797362 e!681061)))

(assert (=> d!132807 (= res!797362 (bvsge #b00000000000000000000000000000000 (size!37970 lt!543701)))))

(assert (=> d!132807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543701 mask!1564) e!681061)))

(declare-fun b!1198681 () Bool)

(assert (=> b!1198681 (= e!681063 call!57322)))

(assert (= (and d!132807 (not res!797362)) b!1198682))

(assert (= (and b!1198682 c!117796) b!1198683))

(assert (= (and b!1198682 (not c!117796)) b!1198680))

(assert (= (and b!1198683 res!797363) b!1198681))

(assert (= (or b!1198681 b!1198680) bm!57319))

(declare-fun m!1106009 () Bool)

(assert (=> b!1198682 m!1106009))

(assert (=> b!1198682 m!1106009))

(declare-fun m!1106011 () Bool)

(assert (=> b!1198682 m!1106011))

(assert (=> b!1198683 m!1106009))

(declare-fun m!1106013 () Bool)

(assert (=> b!1198683 m!1106013))

(declare-fun m!1106015 () Bool)

(assert (=> b!1198683 m!1106015))

(assert (=> b!1198683 m!1106009))

(declare-fun m!1106017 () Bool)

(assert (=> b!1198683 m!1106017))

(declare-fun m!1106019 () Bool)

(assert (=> bm!57319 m!1106019))

(assert (=> b!1198507 d!132807))

(declare-fun b!1198694 () Bool)

(declare-fun e!681073 () Bool)

(declare-fun e!681072 () Bool)

(assert (=> b!1198694 (= e!681073 e!681072)))

(declare-fun c!117799 () Bool)

(assert (=> b!1198694 (= c!117799 (validKeyInArray!0 (select (arr!37433 lt!543701) #b00000000000000000000000000000000)))))

(declare-fun b!1198695 () Bool)

(declare-fun call!57325 () Bool)

(assert (=> b!1198695 (= e!681072 call!57325)))

(declare-fun b!1198696 () Bool)

(assert (=> b!1198696 (= e!681072 call!57325)))

(declare-fun d!132809 () Bool)

(declare-fun res!797371 () Bool)

(declare-fun e!681074 () Bool)

(assert (=> d!132809 (=> res!797371 e!681074)))

(assert (=> d!132809 (= res!797371 (bvsge #b00000000000000000000000000000000 (size!37970 lt!543701)))))

(assert (=> d!132809 (= (arrayNoDuplicates!0 lt!543701 #b00000000000000000000000000000000 Nil!26348) e!681074)))

(declare-fun b!1198697 () Bool)

(assert (=> b!1198697 (= e!681074 e!681073)))

(declare-fun res!797372 () Bool)

(assert (=> b!1198697 (=> (not res!797372) (not e!681073))))

(declare-fun e!681075 () Bool)

(assert (=> b!1198697 (= res!797372 (not e!681075))))

(declare-fun res!797370 () Bool)

(assert (=> b!1198697 (=> (not res!797370) (not e!681075))))

(assert (=> b!1198697 (= res!797370 (validKeyInArray!0 (select (arr!37433 lt!543701) #b00000000000000000000000000000000)))))

(declare-fun b!1198698 () Bool)

(declare-fun contains!6897 (List!26351 (_ BitVec 64)) Bool)

(assert (=> b!1198698 (= e!681075 (contains!6897 Nil!26348 (select (arr!37433 lt!543701) #b00000000000000000000000000000000)))))

(declare-fun bm!57322 () Bool)

(assert (=> bm!57322 (= call!57325 (arrayNoDuplicates!0 lt!543701 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117799 (Cons!26347 (select (arr!37433 lt!543701) #b00000000000000000000000000000000) Nil!26348) Nil!26348)))))

(assert (= (and d!132809 (not res!797371)) b!1198697))

(assert (= (and b!1198697 res!797370) b!1198698))

(assert (= (and b!1198697 res!797372) b!1198694))

(assert (= (and b!1198694 c!117799) b!1198696))

(assert (= (and b!1198694 (not c!117799)) b!1198695))

(assert (= (or b!1198696 b!1198695) bm!57322))

(assert (=> b!1198694 m!1106009))

(assert (=> b!1198694 m!1106009))

(assert (=> b!1198694 m!1106011))

(assert (=> b!1198697 m!1106009))

(assert (=> b!1198697 m!1106009))

(assert (=> b!1198697 m!1106011))

(assert (=> b!1198698 m!1106009))

(assert (=> b!1198698 m!1106009))

(declare-fun m!1106021 () Bool)

(assert (=> b!1198698 m!1106021))

(assert (=> bm!57322 m!1106009))

(declare-fun m!1106023 () Bool)

(assert (=> bm!57322 m!1106023))

(assert (=> b!1198516 d!132809))

(declare-fun d!132811 () Bool)

(declare-fun res!797377 () Bool)

(declare-fun e!681080 () Bool)

(assert (=> d!132811 (=> res!797377 e!681080)))

(assert (=> d!132811 (= res!797377 (= (select (arr!37433 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132811 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!681080)))

(declare-fun b!1198703 () Bool)

(declare-fun e!681081 () Bool)

(assert (=> b!1198703 (= e!681080 e!681081)))

(declare-fun res!797378 () Bool)

(assert (=> b!1198703 (=> (not res!797378) (not e!681081))))

(assert (=> b!1198703 (= res!797378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37970 _keys!1208)))))

(declare-fun b!1198704 () Bool)

(assert (=> b!1198704 (= e!681081 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132811 (not res!797377)) b!1198703))

(assert (= (and b!1198703 res!797378) b!1198704))

(assert (=> d!132811 m!1105997))

(declare-fun m!1106025 () Bool)

(assert (=> b!1198704 m!1106025))

(assert (=> b!1198515 d!132811))

(declare-fun d!132813 () Bool)

(assert (=> d!132813 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543764 () Unit!39665)

(declare-fun choose!13 (array!77585 (_ BitVec 64) (_ BitVec 32)) Unit!39665)

(assert (=> d!132813 (= lt!543764 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132813 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132813 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543764)))

(declare-fun bs!33965 () Bool)

(assert (= bs!33965 d!132813))

(assert (=> bs!33965 m!1105847))

(declare-fun m!1106027 () Bool)

(assert (=> bs!33965 m!1106027))

(assert (=> b!1198515 d!132813))

(declare-fun d!132815 () Bool)

(assert (=> d!132815 (= (array_inv!28600 _keys!1208) (bvsge (size!37970 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100554 d!132815))

(declare-fun d!132817 () Bool)

(assert (=> d!132817 (= (array_inv!28601 _values!996) (bvsge (size!37971 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100554 d!132817))

(declare-fun b!1198705 () Bool)

(declare-fun e!681083 () Bool)

(declare-fun e!681082 () Bool)

(assert (=> b!1198705 (= e!681083 e!681082)))

(declare-fun c!117800 () Bool)

(assert (=> b!1198705 (= c!117800 (validKeyInArray!0 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1198706 () Bool)

(declare-fun call!57326 () Bool)

(assert (=> b!1198706 (= e!681082 call!57326)))

(declare-fun b!1198707 () Bool)

(assert (=> b!1198707 (= e!681082 call!57326)))

(declare-fun d!132819 () Bool)

(declare-fun res!797380 () Bool)

(declare-fun e!681084 () Bool)

(assert (=> d!132819 (=> res!797380 e!681084)))

(assert (=> d!132819 (= res!797380 (bvsge #b00000000000000000000000000000000 (size!37970 _keys!1208)))))

(assert (=> d!132819 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26348) e!681084)))

(declare-fun b!1198708 () Bool)

(assert (=> b!1198708 (= e!681084 e!681083)))

(declare-fun res!797381 () Bool)

(assert (=> b!1198708 (=> (not res!797381) (not e!681083))))

(declare-fun e!681085 () Bool)

(assert (=> b!1198708 (= res!797381 (not e!681085))))

(declare-fun res!797379 () Bool)

(assert (=> b!1198708 (=> (not res!797379) (not e!681085))))

(assert (=> b!1198708 (= res!797379 (validKeyInArray!0 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1198709 () Bool)

(assert (=> b!1198709 (= e!681085 (contains!6897 Nil!26348 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57323 () Bool)

(assert (=> bm!57323 (= call!57326 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117800 (Cons!26347 (select (arr!37433 _keys!1208) #b00000000000000000000000000000000) Nil!26348) Nil!26348)))))

(assert (= (and d!132819 (not res!797380)) b!1198708))

(assert (= (and b!1198708 res!797379) b!1198709))

(assert (= (and b!1198708 res!797381) b!1198705))

(assert (= (and b!1198705 c!117800) b!1198707))

(assert (= (and b!1198705 (not c!117800)) b!1198706))

(assert (= (or b!1198707 b!1198706) bm!57323))

(assert (=> b!1198705 m!1105997))

(assert (=> b!1198705 m!1105997))

(assert (=> b!1198705 m!1105999))

(assert (=> b!1198708 m!1105997))

(assert (=> b!1198708 m!1105997))

(assert (=> b!1198708 m!1105999))

(assert (=> b!1198709 m!1105997))

(assert (=> b!1198709 m!1105997))

(declare-fun m!1106029 () Bool)

(assert (=> b!1198709 m!1106029))

(assert (=> bm!57323 m!1105997))

(declare-fun m!1106031 () Bool)

(assert (=> bm!57323 m!1106031))

(assert (=> b!1198508 d!132819))

(declare-fun b!1198710 () Bool)

(declare-fun e!681091 () Bool)

(assert (=> b!1198710 (= e!681091 (validKeyInArray!0 (select (arr!37433 lt!543701) from!1455)))))

(assert (=> b!1198710 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1198711 () Bool)

(declare-fun e!681089 () Bool)

(declare-fun e!681086 () Bool)

(assert (=> b!1198711 (= e!681089 e!681086)))

(declare-fun c!117803 () Bool)

(assert (=> b!1198711 (= c!117803 (bvslt from!1455 (size!37970 lt!543701)))))

(declare-fun b!1198712 () Bool)

(declare-fun lt!543766 () ListLongMap!17527)

(assert (=> b!1198712 (= e!681086 (= lt!543766 (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198713 () Bool)

(declare-fun res!797385 () Bool)

(declare-fun e!681087 () Bool)

(assert (=> b!1198713 (=> (not res!797385) (not e!681087))))

(assert (=> b!1198713 (= res!797385 (not (contains!6896 lt!543766 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1198714 () Bool)

(assert (=> b!1198714 (= e!681086 (isEmpty!982 lt!543766))))

(declare-fun b!1198715 () Bool)

(assert (=> b!1198715 (= e!681087 e!681089)))

(declare-fun c!117802 () Bool)

(assert (=> b!1198715 (= c!117802 e!681091)))

(declare-fun res!797383 () Bool)

(assert (=> b!1198715 (=> (not res!797383) (not e!681091))))

(assert (=> b!1198715 (= res!797383 (bvslt from!1455 (size!37970 lt!543701)))))

(declare-fun b!1198716 () Bool)

(declare-fun e!681088 () ListLongMap!17527)

(declare-fun call!57327 () ListLongMap!17527)

(assert (=> b!1198716 (= e!681088 call!57327)))

(declare-fun b!1198717 () Bool)

(declare-fun lt!543768 () Unit!39665)

(declare-fun lt!543767 () Unit!39665)

(assert (=> b!1198717 (= lt!543768 lt!543767)))

(declare-fun lt!543771 () (_ BitVec 64))

(declare-fun lt!543765 () (_ BitVec 64))

(declare-fun lt!543770 () V!45641)

(declare-fun lt!543769 () ListLongMap!17527)

(assert (=> b!1198717 (not (contains!6896 (+!3996 lt!543769 (tuple2!19551 lt!543765 lt!543770)) lt!543771))))

(assert (=> b!1198717 (= lt!543767 (addStillNotContains!288 lt!543769 lt!543765 lt!543770 lt!543771))))

(assert (=> b!1198717 (= lt!543771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1198717 (= lt!543770 (get!19159 (select (arr!37434 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996))) from!1455) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198717 (= lt!543765 (select (arr!37433 lt!543701) from!1455))))

(assert (=> b!1198717 (= lt!543769 call!57327)))

(assert (=> b!1198717 (= e!681088 (+!3996 call!57327 (tuple2!19551 (select (arr!37433 lt!543701) from!1455) (get!19159 (select (arr!37434 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996))) from!1455) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198718 () Bool)

(declare-fun e!681090 () ListLongMap!17527)

(assert (=> b!1198718 (= e!681090 e!681088)))

(declare-fun c!117801 () Bool)

(assert (=> b!1198718 (= c!117801 (validKeyInArray!0 (select (arr!37433 lt!543701) from!1455)))))

(declare-fun d!132821 () Bool)

(assert (=> d!132821 e!681087))

(declare-fun res!797382 () Bool)

(assert (=> d!132821 (=> (not res!797382) (not e!681087))))

(assert (=> d!132821 (= res!797382 (not (contains!6896 lt!543766 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132821 (= lt!543766 e!681090)))

(declare-fun c!117804 () Bool)

(assert (=> d!132821 (= c!117804 (bvsge from!1455 (size!37970 lt!543701)))))

(assert (=> d!132821 (validMask!0 mask!1564)))

(assert (=> d!132821 (= (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543766)))

(declare-fun bm!57324 () Bool)

(assert (=> bm!57324 (= call!57327 (getCurrentListMapNoExtraKeys!5246 lt!543701 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1198719 () Bool)

(assert (=> b!1198719 (= e!681090 (ListLongMap!17528 Nil!26347))))

(declare-fun b!1198720 () Bool)

(assert (=> b!1198720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37970 lt!543701)))))

(assert (=> b!1198720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37971 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)))))))

(declare-fun e!681092 () Bool)

(assert (=> b!1198720 (= e!681092 (= (apply!967 lt!543766 (select (arr!37433 lt!543701) from!1455)) (get!19159 (select (arr!37434 (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996))) from!1455) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1198721 () Bool)

(assert (=> b!1198721 (= e!681089 e!681092)))

(assert (=> b!1198721 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37970 lt!543701)))))

(declare-fun res!797384 () Bool)

(assert (=> b!1198721 (= res!797384 (contains!6896 lt!543766 (select (arr!37433 lt!543701) from!1455)))))

(assert (=> b!1198721 (=> (not res!797384) (not e!681092))))

(assert (= (and d!132821 c!117804) b!1198719))

(assert (= (and d!132821 (not c!117804)) b!1198718))

(assert (= (and b!1198718 c!117801) b!1198717))

(assert (= (and b!1198718 (not c!117801)) b!1198716))

(assert (= (or b!1198717 b!1198716) bm!57324))

(assert (= (and d!132821 res!797382) b!1198713))

(assert (= (and b!1198713 res!797385) b!1198715))

(assert (= (and b!1198715 res!797383) b!1198710))

(assert (= (and b!1198715 c!117802) b!1198721))

(assert (= (and b!1198715 (not c!117802)) b!1198711))

(assert (= (and b!1198721 res!797384) b!1198720))

(assert (= (and b!1198711 c!117803) b!1198712))

(assert (= (and b!1198711 (not c!117803)) b!1198714))

(declare-fun b_lambda!20867 () Bool)

(assert (=> (not b_lambda!20867) (not b!1198717)))

(assert (=> b!1198717 t!39038))

(declare-fun b_and!42305 () Bool)

(assert (= b_and!42303 (and (=> t!39038 result!21599) b_and!42305)))

(declare-fun b_lambda!20869 () Bool)

(assert (=> (not b_lambda!20869) (not b!1198720)))

(assert (=> b!1198720 t!39038))

(declare-fun b_and!42307 () Bool)

(assert (= b_and!42305 (and (=> t!39038 result!21599) b_and!42307)))

(declare-fun m!1106033 () Bool)

(assert (=> b!1198718 m!1106033))

(assert (=> b!1198718 m!1106033))

(declare-fun m!1106035 () Bool)

(assert (=> b!1198718 m!1106035))

(declare-fun m!1106037 () Bool)

(assert (=> b!1198713 m!1106037))

(assert (=> b!1198721 m!1106033))

(assert (=> b!1198721 m!1106033))

(declare-fun m!1106039 () Bool)

(assert (=> b!1198721 m!1106039))

(assert (=> b!1198720 m!1106033))

(declare-fun m!1106041 () Bool)

(assert (=> b!1198720 m!1106041))

(declare-fun m!1106043 () Bool)

(assert (=> b!1198720 m!1106043))

(assert (=> b!1198720 m!1106033))

(assert (=> b!1198720 m!1106043))

(assert (=> b!1198720 m!1105819))

(declare-fun m!1106045 () Bool)

(assert (=> b!1198720 m!1106045))

(assert (=> b!1198720 m!1105819))

(declare-fun m!1106047 () Bool)

(assert (=> b!1198717 m!1106047))

(declare-fun m!1106049 () Bool)

(assert (=> b!1198717 m!1106049))

(assert (=> b!1198717 m!1106043))

(assert (=> b!1198717 m!1106047))

(assert (=> b!1198717 m!1106033))

(declare-fun m!1106051 () Bool)

(assert (=> b!1198717 m!1106051))

(assert (=> b!1198717 m!1106043))

(assert (=> b!1198717 m!1105819))

(assert (=> b!1198717 m!1106045))

(assert (=> b!1198717 m!1105819))

(declare-fun m!1106053 () Bool)

(assert (=> b!1198717 m!1106053))

(declare-fun m!1106055 () Bool)

(assert (=> bm!57324 m!1106055))

(declare-fun m!1106057 () Bool)

(assert (=> b!1198714 m!1106057))

(assert (=> b!1198710 m!1106033))

(assert (=> b!1198710 m!1106033))

(assert (=> b!1198710 m!1106035))

(assert (=> b!1198712 m!1106055))

(declare-fun m!1106059 () Bool)

(assert (=> d!132821 m!1106059))

(assert (=> d!132821 m!1105853))

(assert (=> b!1198510 d!132821))

(declare-fun b!1198722 () Bool)

(declare-fun e!681098 () Bool)

(assert (=> b!1198722 (= e!681098 (validKeyInArray!0 (select (arr!37433 _keys!1208) from!1455)))))

(assert (=> b!1198722 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1198723 () Bool)

(declare-fun e!681096 () Bool)

(declare-fun e!681093 () Bool)

(assert (=> b!1198723 (= e!681096 e!681093)))

(declare-fun c!117807 () Bool)

(assert (=> b!1198723 (= c!117807 (bvslt from!1455 (size!37970 _keys!1208)))))

(declare-fun lt!543773 () ListLongMap!17527)

(declare-fun b!1198724 () Bool)

(assert (=> b!1198724 (= e!681093 (= lt!543773 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198725 () Bool)

(declare-fun res!797389 () Bool)

(declare-fun e!681094 () Bool)

(assert (=> b!1198725 (=> (not res!797389) (not e!681094))))

(assert (=> b!1198725 (= res!797389 (not (contains!6896 lt!543773 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1198726 () Bool)

(assert (=> b!1198726 (= e!681093 (isEmpty!982 lt!543773))))

(declare-fun b!1198727 () Bool)

(assert (=> b!1198727 (= e!681094 e!681096)))

(declare-fun c!117806 () Bool)

(assert (=> b!1198727 (= c!117806 e!681098)))

(declare-fun res!797387 () Bool)

(assert (=> b!1198727 (=> (not res!797387) (not e!681098))))

(assert (=> b!1198727 (= res!797387 (bvslt from!1455 (size!37970 _keys!1208)))))

(declare-fun b!1198728 () Bool)

(declare-fun e!681095 () ListLongMap!17527)

(declare-fun call!57328 () ListLongMap!17527)

(assert (=> b!1198728 (= e!681095 call!57328)))

(declare-fun b!1198729 () Bool)

(declare-fun lt!543775 () Unit!39665)

(declare-fun lt!543774 () Unit!39665)

(assert (=> b!1198729 (= lt!543775 lt!543774)))

(declare-fun lt!543777 () V!45641)

(declare-fun lt!543776 () ListLongMap!17527)

(declare-fun lt!543772 () (_ BitVec 64))

(declare-fun lt!543778 () (_ BitVec 64))

(assert (=> b!1198729 (not (contains!6896 (+!3996 lt!543776 (tuple2!19551 lt!543772 lt!543777)) lt!543778))))

(assert (=> b!1198729 (= lt!543774 (addStillNotContains!288 lt!543776 lt!543772 lt!543777 lt!543778))))

(assert (=> b!1198729 (= lt!543778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1198729 (= lt!543777 (get!19159 (select (arr!37434 _values!996) from!1455) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198729 (= lt!543772 (select (arr!37433 _keys!1208) from!1455))))

(assert (=> b!1198729 (= lt!543776 call!57328)))

(assert (=> b!1198729 (= e!681095 (+!3996 call!57328 (tuple2!19551 (select (arr!37433 _keys!1208) from!1455) (get!19159 (select (arr!37434 _values!996) from!1455) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198730 () Bool)

(declare-fun e!681097 () ListLongMap!17527)

(assert (=> b!1198730 (= e!681097 e!681095)))

(declare-fun c!117805 () Bool)

(assert (=> b!1198730 (= c!117805 (validKeyInArray!0 (select (arr!37433 _keys!1208) from!1455)))))

(declare-fun d!132823 () Bool)

(assert (=> d!132823 e!681094))

(declare-fun res!797386 () Bool)

(assert (=> d!132823 (=> (not res!797386) (not e!681094))))

(assert (=> d!132823 (= res!797386 (not (contains!6896 lt!543773 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132823 (= lt!543773 e!681097)))

(declare-fun c!117808 () Bool)

(assert (=> d!132823 (= c!117808 (bvsge from!1455 (size!37970 _keys!1208)))))

(assert (=> d!132823 (validMask!0 mask!1564)))

(assert (=> d!132823 (= (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543773)))

(declare-fun bm!57325 () Bool)

(assert (=> bm!57325 (= call!57328 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1198731 () Bool)

(assert (=> b!1198731 (= e!681097 (ListLongMap!17528 Nil!26347))))

(declare-fun b!1198732 () Bool)

(assert (=> b!1198732 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37970 _keys!1208)))))

(assert (=> b!1198732 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37971 _values!996)))))

(declare-fun e!681099 () Bool)

(assert (=> b!1198732 (= e!681099 (= (apply!967 lt!543773 (select (arr!37433 _keys!1208) from!1455)) (get!19159 (select (arr!37434 _values!996) from!1455) (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1198733 () Bool)

(assert (=> b!1198733 (= e!681096 e!681099)))

(assert (=> b!1198733 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37970 _keys!1208)))))

(declare-fun res!797388 () Bool)

(assert (=> b!1198733 (= res!797388 (contains!6896 lt!543773 (select (arr!37433 _keys!1208) from!1455)))))

(assert (=> b!1198733 (=> (not res!797388) (not e!681099))))

(assert (= (and d!132823 c!117808) b!1198731))

(assert (= (and d!132823 (not c!117808)) b!1198730))

(assert (= (and b!1198730 c!117805) b!1198729))

(assert (= (and b!1198730 (not c!117805)) b!1198728))

(assert (= (or b!1198729 b!1198728) bm!57325))

(assert (= (and d!132823 res!797386) b!1198725))

(assert (= (and b!1198725 res!797389) b!1198727))

(assert (= (and b!1198727 res!797387) b!1198722))

(assert (= (and b!1198727 c!117806) b!1198733))

(assert (= (and b!1198727 (not c!117806)) b!1198723))

(assert (= (and b!1198733 res!797388) b!1198732))

(assert (= (and b!1198723 c!117807) b!1198724))

(assert (= (and b!1198723 (not c!117807)) b!1198726))

(declare-fun b_lambda!20871 () Bool)

(assert (=> (not b_lambda!20871) (not b!1198729)))

(assert (=> b!1198729 t!39038))

(declare-fun b_and!42309 () Bool)

(assert (= b_and!42307 (and (=> t!39038 result!21599) b_and!42309)))

(declare-fun b_lambda!20873 () Bool)

(assert (=> (not b_lambda!20873) (not b!1198732)))

(assert (=> b!1198732 t!39038))

(declare-fun b_and!42311 () Bool)

(assert (= b_and!42309 (and (=> t!39038 result!21599) b_and!42311)))

(declare-fun m!1106061 () Bool)

(assert (=> b!1198730 m!1106061))

(assert (=> b!1198730 m!1106061))

(declare-fun m!1106063 () Bool)

(assert (=> b!1198730 m!1106063))

(declare-fun m!1106065 () Bool)

(assert (=> b!1198725 m!1106065))

(assert (=> b!1198733 m!1106061))

(assert (=> b!1198733 m!1106061))

(declare-fun m!1106067 () Bool)

(assert (=> b!1198733 m!1106067))

(assert (=> b!1198732 m!1106061))

(declare-fun m!1106069 () Bool)

(assert (=> b!1198732 m!1106069))

(declare-fun m!1106071 () Bool)

(assert (=> b!1198732 m!1106071))

(assert (=> b!1198732 m!1106061))

(assert (=> b!1198732 m!1106071))

(assert (=> b!1198732 m!1105819))

(declare-fun m!1106073 () Bool)

(assert (=> b!1198732 m!1106073))

(assert (=> b!1198732 m!1105819))

(declare-fun m!1106075 () Bool)

(assert (=> b!1198729 m!1106075))

(declare-fun m!1106077 () Bool)

(assert (=> b!1198729 m!1106077))

(assert (=> b!1198729 m!1106071))

(assert (=> b!1198729 m!1106075))

(assert (=> b!1198729 m!1106061))

(declare-fun m!1106079 () Bool)

(assert (=> b!1198729 m!1106079))

(assert (=> b!1198729 m!1106071))

(assert (=> b!1198729 m!1105819))

(assert (=> b!1198729 m!1106073))

(assert (=> b!1198729 m!1105819))

(declare-fun m!1106081 () Bool)

(assert (=> b!1198729 m!1106081))

(declare-fun m!1106083 () Bool)

(assert (=> bm!57325 m!1106083))

(declare-fun m!1106085 () Bool)

(assert (=> b!1198726 m!1106085))

(assert (=> b!1198722 m!1106061))

(assert (=> b!1198722 m!1106061))

(assert (=> b!1198722 m!1106063))

(assert (=> b!1198724 m!1106083))

(declare-fun m!1106087 () Bool)

(assert (=> d!132823 m!1106087))

(assert (=> d!132823 m!1105853))

(assert (=> b!1198510 d!132823))

(declare-fun call!57333 () ListLongMap!17527)

(declare-fun bm!57330 () Bool)

(assert (=> bm!57330 (= call!57333 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57334 () ListLongMap!17527)

(declare-fun bm!57331 () Bool)

(assert (=> bm!57331 (= call!57334 (getCurrentListMapNoExtraKeys!5246 (array!77586 (store (arr!37433 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37970 _keys!1208)) (array!77588 (store (arr!37434 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37971 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!132825 () Bool)

(declare-fun e!681105 () Bool)

(assert (=> d!132825 e!681105))

(declare-fun res!797392 () Bool)

(assert (=> d!132825 (=> (not res!797392) (not e!681105))))

(assert (=> d!132825 (= res!797392 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37970 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37970 _keys!1208))))))))

(declare-fun lt!543781 () Unit!39665)

(declare-fun choose!1789 (array!77585 array!77587 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39665)

(assert (=> d!132825 (= lt!543781 (choose!1789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132825 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37970 _keys!1208)))))

(assert (=> d!132825 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543781)))

(declare-fun b!1198740 () Bool)

(declare-fun e!681104 () Bool)

(assert (=> b!1198740 (= e!681104 (= call!57334 call!57333))))

(assert (=> b!1198740 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37971 _values!996)))))

(declare-fun b!1198741 () Bool)

(assert (=> b!1198741 (= e!681105 e!681104)))

(declare-fun c!117811 () Bool)

(assert (=> b!1198741 (= c!117811 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1198742 () Bool)

(assert (=> b!1198742 (= e!681104 (= call!57334 (-!1778 call!57333 k0!934)))))

(assert (=> b!1198742 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37971 _values!996)))))

(assert (= (and d!132825 res!797392) b!1198741))

(assert (= (and b!1198741 c!117811) b!1198742))

(assert (= (and b!1198741 (not c!117811)) b!1198740))

(assert (= (or b!1198742 b!1198740) bm!57330))

(assert (= (or b!1198742 b!1198740) bm!57331))

(declare-fun b_lambda!20875 () Bool)

(assert (=> (not b_lambda!20875) (not bm!57331)))

(assert (=> bm!57331 t!39038))

(declare-fun b_and!42313 () Bool)

(assert (= b_and!42311 (and (=> t!39038 result!21599) b_and!42313)))

(assert (=> bm!57330 m!1105835))

(assert (=> bm!57331 m!1105843))

(assert (=> bm!57331 m!1105819))

(assert (=> bm!57331 m!1105821))

(declare-fun m!1106089 () Bool)

(assert (=> bm!57331 m!1106089))

(declare-fun m!1106091 () Bool)

(assert (=> d!132825 m!1106091))

(declare-fun m!1106093 () Bool)

(assert (=> b!1198742 m!1106093))

(assert (=> b!1198510 d!132825))

(declare-fun d!132827 () Bool)

(declare-fun lt!543784 () ListLongMap!17527)

(assert (=> d!132827 (not (contains!6896 lt!543784 k0!934))))

(declare-fun removeStrictlySorted!91 (List!26350 (_ BitVec 64)) List!26350)

(assert (=> d!132827 (= lt!543784 (ListLongMap!17528 (removeStrictlySorted!91 (toList!8779 call!57302) k0!934)))))

(assert (=> d!132827 (= (-!1778 call!57302 k0!934) lt!543784)))

(declare-fun bs!33966 () Bool)

(assert (= bs!33966 d!132827))

(declare-fun m!1106095 () Bool)

(assert (=> bs!33966 m!1106095))

(declare-fun m!1106097 () Bool)

(assert (=> bs!33966 m!1106097))

(assert (=> b!1198517 d!132827))

(declare-fun b!1198749 () Bool)

(declare-fun e!681111 () Bool)

(assert (=> b!1198749 (= e!681111 tp_is_empty!30385)))

(declare-fun mapNonEmpty!47423 () Bool)

(declare-fun mapRes!47423 () Bool)

(declare-fun tp!90078 () Bool)

(assert (=> mapNonEmpty!47423 (= mapRes!47423 (and tp!90078 e!681111))))

(declare-fun mapKey!47423 () (_ BitVec 32))

(declare-fun mapValue!47423 () ValueCell!14483)

(declare-fun mapRest!47423 () (Array (_ BitVec 32) ValueCell!14483))

(assert (=> mapNonEmpty!47423 (= mapRest!47414 (store mapRest!47423 mapKey!47423 mapValue!47423))))

(declare-fun mapIsEmpty!47423 () Bool)

(assert (=> mapIsEmpty!47423 mapRes!47423))

(declare-fun b!1198750 () Bool)

(declare-fun e!681110 () Bool)

(assert (=> b!1198750 (= e!681110 tp_is_empty!30385)))

(declare-fun condMapEmpty!47423 () Bool)

(declare-fun mapDefault!47423 () ValueCell!14483)

(assert (=> mapNonEmpty!47414 (= condMapEmpty!47423 (= mapRest!47414 ((as const (Array (_ BitVec 32) ValueCell!14483)) mapDefault!47423)))))

(assert (=> mapNonEmpty!47414 (= tp!90063 (and e!681110 mapRes!47423))))

(assert (= (and mapNonEmpty!47414 condMapEmpty!47423) mapIsEmpty!47423))

(assert (= (and mapNonEmpty!47414 (not condMapEmpty!47423)) mapNonEmpty!47423))

(assert (= (and mapNonEmpty!47423 ((_ is ValueCellFull!14483) mapValue!47423)) b!1198749))

(assert (= (and mapNonEmpty!47414 ((_ is ValueCellFull!14483) mapDefault!47423)) b!1198750))

(declare-fun m!1106099 () Bool)

(assert (=> mapNonEmpty!47423 m!1106099))

(declare-fun b_lambda!20877 () Bool)

(assert (= b_lambda!20867 (or (and start!100554 b_free!25705) b_lambda!20877)))

(declare-fun b_lambda!20879 () Bool)

(assert (= b_lambda!20861 (or (and start!100554 b_free!25705) b_lambda!20879)))

(declare-fun b_lambda!20881 () Bool)

(assert (= b_lambda!20869 (or (and start!100554 b_free!25705) b_lambda!20881)))

(declare-fun b_lambda!20883 () Bool)

(assert (= b_lambda!20873 (or (and start!100554 b_free!25705) b_lambda!20883)))

(declare-fun b_lambda!20885 () Bool)

(assert (= b_lambda!20875 (or (and start!100554 b_free!25705) b_lambda!20885)))

(declare-fun b_lambda!20887 () Bool)

(assert (= b_lambda!20865 (or (and start!100554 b_free!25705) b_lambda!20887)))

(declare-fun b_lambda!20889 () Bool)

(assert (= b_lambda!20863 (or (and start!100554 b_free!25705) b_lambda!20889)))

(declare-fun b_lambda!20891 () Bool)

(assert (= b_lambda!20871 (or (and start!100554 b_free!25705) b_lambda!20891)))

(declare-fun b_lambda!20893 () Bool)

(assert (= b_lambda!20859 (or (and start!100554 b_free!25705) b_lambda!20893)))

(check-sat (not b!1198720) (not bm!57324) b_and!42313 (not d!132801) (not b!1198654) (not b_lambda!20881) (not b_next!25705) (not bm!57330) (not b!1198678) (not d!132823) (not b!1198717) (not b!1198660) (not b!1198730) (not b!1198647) (not d!132827) (not b!1198726) (not b!1198705) (not b!1198704) (not b!1198709) (not b!1198708) (not b!1198658) (not b!1198646) (not d!132813) (not bm!57325) (not b!1198663) (not b!1198683) (not b!1198655) (not bm!57315) (not b!1198713) (not b_lambda!20885) tp_is_empty!30385 (not b!1198667) (not b!1198724) (not b!1198694) (not b!1198742) (not bm!57318) (not b!1198733) (not b!1198648) (not bm!57314) (not bm!57331) (not b!1198651) (not b!1198729) (not d!132799) (not bm!57322) (not d!132825) (not b!1198714) (not b_lambda!20857) (not b_lambda!20879) (not d!132821) (not b!1198698) (not b!1198644) (not b!1198679) (not b_lambda!20889) (not b_lambda!20887) (not b!1198666) (not b_lambda!20855) (not b_lambda!20877) (not b!1198682) (not b!1198725) (not mapNonEmpty!47423) (not b!1198697) (not b!1198710) (not bm!57319) (not b!1198721) (not b!1198652) (not b!1198722) (not b!1198664) (not b!1198659) (not b_lambda!20891) (not b!1198732) (not b!1198656) (not bm!57323) (not b!1198712) (not b_lambda!20893) (not b_lambda!20883) (not b!1198718))
(check-sat b_and!42313 (not b_next!25705))
