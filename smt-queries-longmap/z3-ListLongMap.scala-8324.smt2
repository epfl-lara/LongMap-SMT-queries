; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101294 () Bool)

(assert start!101294)

(declare-fun b_free!26217 () Bool)

(declare-fun b_next!26217 () Bool)

(assert (=> start!101294 (= b_free!26217 (not b_next!26217))))

(declare-fun tp!91672 () Bool)

(declare-fun b_and!43551 () Bool)

(assert (=> start!101294 (= tp!91672 b_and!43551)))

(declare-fun b!1217130 () Bool)

(declare-fun res!808293 () Bool)

(declare-fun e!690994 () Bool)

(assert (=> b!1217130 (=> (not res!808293) (not e!690994))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217130 (= res!808293 (validMask!0 mask!1564))))

(declare-fun b!1217131 () Bool)

(declare-fun res!808296 () Bool)

(assert (=> b!1217131 (=> (not res!808296) (not e!690994))))

(declare-datatypes ((array!78613 0))(
  ( (array!78614 (arr!37941 (Array (_ BitVec 32) (_ BitVec 64))) (size!38477 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78613)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1217131 (= res!808296 (= (select (arr!37941 _keys!1208) i!673) k0!934))))

(declare-fun b!1217132 () Bool)

(declare-fun res!808292 () Bool)

(assert (=> b!1217132 (=> (not res!808292) (not e!690994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217132 (= res!808292 (validKeyInArray!0 k0!934))))

(declare-datatypes ((V!46355 0))(
  ( (V!46356 (val!15517 Int)) )
))
(declare-datatypes ((tuple2!19950 0))(
  ( (tuple2!19951 (_1!9986 (_ BitVec 64)) (_2!9986 V!46355)) )
))
(declare-datatypes ((List!26754 0))(
  ( (Nil!26751) (Cons!26750 (h!27959 tuple2!19950) (t!39951 List!26754)) )
))
(declare-datatypes ((ListLongMap!17919 0))(
  ( (ListLongMap!17920 (toList!8975 List!26754)) )
))
(declare-fun lt!553179 () ListLongMap!17919)

(declare-fun lt!553173 () ListLongMap!17919)

(declare-fun lt!553178 () V!46355)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14751 0))(
  ( (ValueCellFull!14751 (v!18170 V!46355)) (EmptyCell!14751) )
))
(declare-datatypes ((array!78615 0))(
  ( (array!78616 (arr!37942 (Array (_ BitVec 32) ValueCell!14751)) (size!38478 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78615)

(declare-fun e!690993 () Bool)

(declare-fun b!1217133 () Bool)

(declare-fun +!4048 (ListLongMap!17919 tuple2!19950) ListLongMap!17919)

(declare-fun get!19327 (ValueCell!14751 V!46355) V!46355)

(assert (=> b!1217133 (= e!690993 (= lt!553173 (+!4048 lt!553179 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))))))

(declare-fun b!1217134 () Bool)

(declare-fun e!690999 () Bool)

(declare-fun e!691000 () Bool)

(assert (=> b!1217134 (= e!690999 (not e!691000))))

(declare-fun res!808302 () Bool)

(assert (=> b!1217134 (=> res!808302 e!691000)))

(assert (=> b!1217134 (= res!808302 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217134 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40356 0))(
  ( (Unit!40357) )
))
(declare-fun lt!553180 () Unit!40356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78613 (_ BitVec 64) (_ BitVec 32)) Unit!40356)

(assert (=> b!1217134 (= lt!553180 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217136 () Bool)

(declare-fun res!808295 () Bool)

(assert (=> b!1217136 (=> (not res!808295) (not e!690999))))

(declare-fun lt!553176 () array!78613)

(declare-datatypes ((List!26755 0))(
  ( (Nil!26752) (Cons!26751 (h!27960 (_ BitVec 64)) (t!39952 List!26755)) )
))
(declare-fun arrayNoDuplicates!0 (array!78613 (_ BitVec 32) List!26755) Bool)

(assert (=> b!1217136 (= res!808295 (arrayNoDuplicates!0 lt!553176 #b00000000000000000000000000000000 Nil!26752))))

(declare-fun mapIsEmpty!48256 () Bool)

(declare-fun mapRes!48256 () Bool)

(assert (=> mapIsEmpty!48256 mapRes!48256))

(declare-fun b!1217137 () Bool)

(declare-fun e!690996 () Bool)

(declare-fun tp_is_empty!30921 () Bool)

(assert (=> b!1217137 (= e!690996 tp_is_empty!30921)))

(declare-fun b!1217138 () Bool)

(declare-fun e!690998 () Bool)

(assert (=> b!1217138 (= e!690998 (and e!690996 mapRes!48256))))

(declare-fun condMapEmpty!48256 () Bool)

(declare-fun mapDefault!48256 () ValueCell!14751)

(assert (=> b!1217138 (= condMapEmpty!48256 (= (arr!37942 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14751)) mapDefault!48256)))))

(declare-fun b!1217139 () Bool)

(declare-fun e!690997 () Bool)

(assert (=> b!1217139 (= e!691000 e!690997)))

(declare-fun res!808294 () Bool)

(assert (=> b!1217139 (=> res!808294 e!690997)))

(assert (=> b!1217139 (= res!808294 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46355)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46355)

(declare-fun lt!553181 () array!78615)

(declare-fun getCurrentListMapNoExtraKeys!5402 (array!78613 array!78615 (_ BitVec 32) (_ BitVec 32) V!46355 V!46355 (_ BitVec 32) Int) ListLongMap!17919)

(assert (=> b!1217139 (= lt!553173 (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1217139 (= lt!553181 (array!78616 (store (arr!37942 _values!996) i!673 (ValueCellFull!14751 lt!553178)) (size!38478 _values!996)))))

(declare-fun dynLambda!3289 (Int (_ BitVec 64)) V!46355)

(assert (=> b!1217139 (= lt!553178 (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553175 () ListLongMap!17919)

(assert (=> b!1217139 (= lt!553175 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217140 () Bool)

(declare-fun res!808297 () Bool)

(assert (=> b!1217140 (=> (not res!808297) (not e!690994))))

(assert (=> b!1217140 (= res!808297 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38477 _keys!1208))))))

(declare-fun b!1217141 () Bool)

(declare-fun e!690995 () Bool)

(assert (=> b!1217141 (= e!690995 tp_is_empty!30921)))

(declare-fun b!1217142 () Bool)

(declare-fun res!808299 () Bool)

(assert (=> b!1217142 (=> (not res!808299) (not e!690994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78613 (_ BitVec 32)) Bool)

(assert (=> b!1217142 (= res!808299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217143 () Bool)

(assert (=> b!1217143 (= e!690997 e!690993)))

(declare-fun res!808301 () Bool)

(assert (=> b!1217143 (=> res!808301 e!690993)))

(assert (=> b!1217143 (= res!808301 (not (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455))))))

(declare-fun lt!553182 () ListLongMap!17919)

(assert (=> b!1217143 (= lt!553182 lt!553179)))

(declare-fun lt!553174 () ListLongMap!17919)

(declare-fun -!1892 (ListLongMap!17919 (_ BitVec 64)) ListLongMap!17919)

(assert (=> b!1217143 (= lt!553179 (-!1892 lt!553174 k0!934))))

(assert (=> b!1217143 (= lt!553182 (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217143 (= lt!553174 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553177 () Unit!40356)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1099 (array!78613 array!78615 (_ BitVec 32) (_ BitVec 32) V!46355 V!46355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40356)

(assert (=> b!1217143 (= lt!553177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48256 () Bool)

(declare-fun tp!91673 () Bool)

(assert (=> mapNonEmpty!48256 (= mapRes!48256 (and tp!91673 e!690995))))

(declare-fun mapValue!48256 () ValueCell!14751)

(declare-fun mapRest!48256 () (Array (_ BitVec 32) ValueCell!14751))

(declare-fun mapKey!48256 () (_ BitVec 32))

(assert (=> mapNonEmpty!48256 (= (arr!37942 _values!996) (store mapRest!48256 mapKey!48256 mapValue!48256))))

(declare-fun b!1217144 () Bool)

(declare-fun res!808304 () Bool)

(assert (=> b!1217144 (=> (not res!808304) (not e!690994))))

(assert (=> b!1217144 (= res!808304 (and (= (size!38478 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38477 _keys!1208) (size!38478 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217145 () Bool)

(assert (=> b!1217145 (= e!690994 e!690999)))

(declare-fun res!808298 () Bool)

(assert (=> b!1217145 (=> (not res!808298) (not e!690999))))

(assert (=> b!1217145 (= res!808298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553176 mask!1564))))

(assert (=> b!1217145 (= lt!553176 (array!78614 (store (arr!37941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38477 _keys!1208)))))

(declare-fun res!808303 () Bool)

(assert (=> start!101294 (=> (not res!808303) (not e!690994))))

(assert (=> start!101294 (= res!808303 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38477 _keys!1208))))))

(assert (=> start!101294 e!690994))

(assert (=> start!101294 tp_is_empty!30921))

(declare-fun array_inv!28882 (array!78613) Bool)

(assert (=> start!101294 (array_inv!28882 _keys!1208)))

(assert (=> start!101294 true))

(assert (=> start!101294 tp!91672))

(declare-fun array_inv!28883 (array!78615) Bool)

(assert (=> start!101294 (and (array_inv!28883 _values!996) e!690998)))

(declare-fun b!1217135 () Bool)

(declare-fun res!808300 () Bool)

(assert (=> b!1217135 (=> (not res!808300) (not e!690994))))

(assert (=> b!1217135 (= res!808300 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26752))))

(assert (= (and start!101294 res!808303) b!1217130))

(assert (= (and b!1217130 res!808293) b!1217144))

(assert (= (and b!1217144 res!808304) b!1217142))

(assert (= (and b!1217142 res!808299) b!1217135))

(assert (= (and b!1217135 res!808300) b!1217140))

(assert (= (and b!1217140 res!808297) b!1217132))

(assert (= (and b!1217132 res!808292) b!1217131))

(assert (= (and b!1217131 res!808296) b!1217145))

(assert (= (and b!1217145 res!808298) b!1217136))

(assert (= (and b!1217136 res!808295) b!1217134))

(assert (= (and b!1217134 (not res!808302)) b!1217139))

(assert (= (and b!1217139 (not res!808294)) b!1217143))

(assert (= (and b!1217143 (not res!808301)) b!1217133))

(assert (= (and b!1217138 condMapEmpty!48256) mapIsEmpty!48256))

(assert (= (and b!1217138 (not condMapEmpty!48256)) mapNonEmpty!48256))

(get-info :version)

(assert (= (and mapNonEmpty!48256 ((_ is ValueCellFull!14751) mapValue!48256)) b!1217141))

(assert (= (and b!1217138 ((_ is ValueCellFull!14751) mapDefault!48256)) b!1217137))

(assert (= start!101294 b!1217138))

(declare-fun b_lambda!21893 () Bool)

(assert (=> (not b_lambda!21893) (not b!1217139)))

(declare-fun t!39950 () Bool)

(declare-fun tb!11017 () Bool)

(assert (=> (and start!101294 (= defaultEntry!1004 defaultEntry!1004) t!39950) tb!11017))

(declare-fun result!22631 () Bool)

(assert (=> tb!11017 (= result!22631 tp_is_empty!30921)))

(assert (=> b!1217139 t!39950))

(declare-fun b_and!43553 () Bool)

(assert (= b_and!43551 (and (=> t!39950 result!22631) b_and!43553)))

(declare-fun m!1121827 () Bool)

(assert (=> b!1217135 m!1121827))

(declare-fun m!1121829 () Bool)

(assert (=> mapNonEmpty!48256 m!1121829))

(declare-fun m!1121831 () Bool)

(assert (=> b!1217145 m!1121831))

(declare-fun m!1121833 () Bool)

(assert (=> b!1217145 m!1121833))

(declare-fun m!1121835 () Bool)

(assert (=> b!1217132 m!1121835))

(declare-fun m!1121837 () Bool)

(assert (=> b!1217143 m!1121837))

(declare-fun m!1121839 () Bool)

(assert (=> b!1217143 m!1121839))

(declare-fun m!1121841 () Bool)

(assert (=> b!1217143 m!1121841))

(declare-fun m!1121843 () Bool)

(assert (=> b!1217143 m!1121843))

(declare-fun m!1121845 () Bool)

(assert (=> b!1217143 m!1121845))

(declare-fun m!1121847 () Bool)

(assert (=> b!1217143 m!1121847))

(assert (=> b!1217143 m!1121845))

(declare-fun m!1121849 () Bool)

(assert (=> b!1217130 m!1121849))

(declare-fun m!1121851 () Bool)

(assert (=> b!1217136 m!1121851))

(declare-fun m!1121853 () Bool)

(assert (=> b!1217134 m!1121853))

(declare-fun m!1121855 () Bool)

(assert (=> b!1217134 m!1121855))

(assert (=> b!1217133 m!1121845))

(declare-fun m!1121857 () Bool)

(assert (=> b!1217133 m!1121857))

(assert (=> b!1217133 m!1121857))

(declare-fun m!1121859 () Bool)

(assert (=> b!1217133 m!1121859))

(declare-fun m!1121861 () Bool)

(assert (=> b!1217133 m!1121861))

(declare-fun m!1121863 () Bool)

(assert (=> start!101294 m!1121863))

(declare-fun m!1121865 () Bool)

(assert (=> start!101294 m!1121865))

(declare-fun m!1121867 () Bool)

(assert (=> b!1217139 m!1121867))

(declare-fun m!1121869 () Bool)

(assert (=> b!1217139 m!1121869))

(declare-fun m!1121871 () Bool)

(assert (=> b!1217139 m!1121871))

(declare-fun m!1121873 () Bool)

(assert (=> b!1217139 m!1121873))

(declare-fun m!1121875 () Bool)

(assert (=> b!1217131 m!1121875))

(declare-fun m!1121877 () Bool)

(assert (=> b!1217142 m!1121877))

(check-sat tp_is_empty!30921 (not b!1217143) (not b!1217139) (not b!1217136) (not b!1217130) (not b!1217134) (not b_next!26217) (not b!1217145) b_and!43553 (not b_lambda!21893) (not b!1217142) (not mapNonEmpty!48256) (not b!1217135) (not b!1217133) (not b!1217132) (not start!101294))
(check-sat b_and!43553 (not b_next!26217))
(get-model)

(declare-fun b_lambda!21897 () Bool)

(assert (= b_lambda!21893 (or (and start!101294 b_free!26217) b_lambda!21897)))

(check-sat tp_is_empty!30921 (not b!1217143) b_and!43553 (not b!1217139) (not b!1217136) (not b_lambda!21897) (not b!1217130) (not b!1217134) (not b_next!26217) (not b!1217145) (not b!1217142) (not mapNonEmpty!48256) (not b!1217135) (not b!1217133) (not b!1217132) (not start!101294))
(check-sat b_and!43553 (not b_next!26217))
(get-model)

(declare-fun b!1217222 () Bool)

(declare-fun res!808355 () Bool)

(declare-fun e!691047 () Bool)

(assert (=> b!1217222 (=> (not res!808355) (not e!691047))))

(declare-fun lt!553231 () ListLongMap!17919)

(declare-fun contains!7005 (ListLongMap!17919 (_ BitVec 64)) Bool)

(assert (=> b!1217222 (= res!808355 (not (contains!7005 lt!553231 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217223 () Bool)

(declare-fun e!691043 () Bool)

(assert (=> b!1217223 (= e!691043 (validKeyInArray!0 (select (arr!37941 lt!553176) from!1455)))))

(assert (=> b!1217223 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1217224 () Bool)

(declare-fun lt!553233 () Unit!40356)

(declare-fun lt!553232 () Unit!40356)

(assert (=> b!1217224 (= lt!553233 lt!553232)))

(declare-fun lt!553229 () V!46355)

(declare-fun lt!553230 () (_ BitVec 64))

(declare-fun lt!553228 () (_ BitVec 64))

(declare-fun lt!553227 () ListLongMap!17919)

(assert (=> b!1217224 (not (contains!7005 (+!4048 lt!553227 (tuple2!19951 lt!553230 lt!553229)) lt!553228))))

(declare-fun addStillNotContains!298 (ListLongMap!17919 (_ BitVec 64) V!46355 (_ BitVec 64)) Unit!40356)

(assert (=> b!1217224 (= lt!553232 (addStillNotContains!298 lt!553227 lt!553230 lt!553229 lt!553228))))

(assert (=> b!1217224 (= lt!553228 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217224 (= lt!553229 (get!19327 (select (arr!37942 lt!553181) from!1455) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217224 (= lt!553230 (select (arr!37941 lt!553176) from!1455))))

(declare-fun call!60609 () ListLongMap!17919)

(assert (=> b!1217224 (= lt!553227 call!60609)))

(declare-fun e!691044 () ListLongMap!17919)

(assert (=> b!1217224 (= e!691044 (+!4048 call!60609 (tuple2!19951 (select (arr!37941 lt!553176) from!1455) (get!19327 (select (arr!37942 lt!553181) from!1455) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217225 () Bool)

(assert (=> b!1217225 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38477 lt!553176)))))

(assert (=> b!1217225 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38478 lt!553181)))))

(declare-fun e!691046 () Bool)

(declare-fun apply!970 (ListLongMap!17919 (_ BitVec 64)) V!46355)

(assert (=> b!1217225 (= e!691046 (= (apply!970 lt!553231 (select (arr!37941 lt!553176) from!1455)) (get!19327 (select (arr!37942 lt!553181) from!1455) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217226 () Bool)

(declare-fun e!691045 () Bool)

(declare-fun isEmpty!994 (ListLongMap!17919) Bool)

(assert (=> b!1217226 (= e!691045 (isEmpty!994 lt!553231))))

(declare-fun b!1217227 () Bool)

(declare-fun e!691048 () ListLongMap!17919)

(assert (=> b!1217227 (= e!691048 e!691044)))

(declare-fun c!120060 () Bool)

(assert (=> b!1217227 (= c!120060 (validKeyInArray!0 (select (arr!37941 lt!553176) from!1455)))))

(declare-fun d!133549 () Bool)

(assert (=> d!133549 e!691047))

(declare-fun res!808353 () Bool)

(assert (=> d!133549 (=> (not res!808353) (not e!691047))))

(assert (=> d!133549 (= res!808353 (not (contains!7005 lt!553231 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133549 (= lt!553231 e!691048)))

(declare-fun c!120059 () Bool)

(assert (=> d!133549 (= c!120059 (bvsge from!1455 (size!38477 lt!553176)))))

(assert (=> d!133549 (validMask!0 mask!1564)))

(assert (=> d!133549 (= (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553231)))

(declare-fun b!1217228 () Bool)

(assert (=> b!1217228 (= e!691048 (ListLongMap!17920 Nil!26751))))

(declare-fun b!1217229 () Bool)

(declare-fun e!691042 () Bool)

(assert (=> b!1217229 (= e!691042 e!691045)))

(declare-fun c!120058 () Bool)

(assert (=> b!1217229 (= c!120058 (bvslt from!1455 (size!38477 lt!553176)))))

(declare-fun b!1217230 () Bool)

(assert (=> b!1217230 (= e!691047 e!691042)))

(declare-fun c!120057 () Bool)

(assert (=> b!1217230 (= c!120057 e!691043)))

(declare-fun res!808354 () Bool)

(assert (=> b!1217230 (=> (not res!808354) (not e!691043))))

(assert (=> b!1217230 (= res!808354 (bvslt from!1455 (size!38477 lt!553176)))))

(declare-fun b!1217231 () Bool)

(assert (=> b!1217231 (= e!691042 e!691046)))

(assert (=> b!1217231 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38477 lt!553176)))))

(declare-fun res!808352 () Bool)

(assert (=> b!1217231 (= res!808352 (contains!7005 lt!553231 (select (arr!37941 lt!553176) from!1455)))))

(assert (=> b!1217231 (=> (not res!808352) (not e!691046))))

(declare-fun b!1217232 () Bool)

(assert (=> b!1217232 (= e!691045 (= lt!553231 (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217233 () Bool)

(assert (=> b!1217233 (= e!691044 call!60609)))

(declare-fun bm!60606 () Bool)

(assert (=> bm!60606 (= call!60609 (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!133549 c!120059) b!1217228))

(assert (= (and d!133549 (not c!120059)) b!1217227))

(assert (= (and b!1217227 c!120060) b!1217224))

(assert (= (and b!1217227 (not c!120060)) b!1217233))

(assert (= (or b!1217224 b!1217233) bm!60606))

(assert (= (and d!133549 res!808353) b!1217222))

(assert (= (and b!1217222 res!808355) b!1217230))

(assert (= (and b!1217230 res!808354) b!1217223))

(assert (= (and b!1217230 c!120057) b!1217231))

(assert (= (and b!1217230 (not c!120057)) b!1217229))

(assert (= (and b!1217231 res!808352) b!1217225))

(assert (= (and b!1217229 c!120058) b!1217232))

(assert (= (and b!1217229 (not c!120058)) b!1217226))

(declare-fun b_lambda!21899 () Bool)

(assert (=> (not b_lambda!21899) (not b!1217224)))

(assert (=> b!1217224 t!39950))

(declare-fun b_and!43559 () Bool)

(assert (= b_and!43553 (and (=> t!39950 result!22631) b_and!43559)))

(declare-fun b_lambda!21901 () Bool)

(assert (=> (not b_lambda!21901) (not b!1217225)))

(assert (=> b!1217225 t!39950))

(declare-fun b_and!43561 () Bool)

(assert (= b_and!43559 (and (=> t!39950 result!22631) b_and!43561)))

(declare-fun m!1121931 () Bool)

(assert (=> b!1217226 m!1121931))

(declare-fun m!1121933 () Bool)

(assert (=> bm!60606 m!1121933))

(declare-fun m!1121935 () Bool)

(assert (=> b!1217227 m!1121935))

(assert (=> b!1217227 m!1121935))

(declare-fun m!1121937 () Bool)

(assert (=> b!1217227 m!1121937))

(assert (=> b!1217231 m!1121935))

(assert (=> b!1217231 m!1121935))

(declare-fun m!1121939 () Bool)

(assert (=> b!1217231 m!1121939))

(assert (=> b!1217223 m!1121935))

(assert (=> b!1217223 m!1121935))

(assert (=> b!1217223 m!1121937))

(declare-fun m!1121941 () Bool)

(assert (=> b!1217222 m!1121941))

(declare-fun m!1121943 () Bool)

(assert (=> b!1217225 m!1121943))

(assert (=> b!1217225 m!1121935))

(declare-fun m!1121945 () Bool)

(assert (=> b!1217225 m!1121945))

(assert (=> b!1217225 m!1121935))

(assert (=> b!1217225 m!1121871))

(assert (=> b!1217225 m!1121943))

(assert (=> b!1217225 m!1121871))

(declare-fun m!1121947 () Bool)

(assert (=> b!1217225 m!1121947))

(declare-fun m!1121949 () Bool)

(assert (=> d!133549 m!1121949))

(assert (=> d!133549 m!1121849))

(assert (=> b!1217224 m!1121935))

(declare-fun m!1121951 () Bool)

(assert (=> b!1217224 m!1121951))

(declare-fun m!1121953 () Bool)

(assert (=> b!1217224 m!1121953))

(assert (=> b!1217224 m!1121951))

(declare-fun m!1121955 () Bool)

(assert (=> b!1217224 m!1121955))

(assert (=> b!1217224 m!1121871))

(assert (=> b!1217224 m!1121943))

(assert (=> b!1217224 m!1121871))

(assert (=> b!1217224 m!1121947))

(assert (=> b!1217224 m!1121943))

(declare-fun m!1121957 () Bool)

(assert (=> b!1217224 m!1121957))

(assert (=> b!1217232 m!1121933))

(assert (=> b!1217139 d!133549))

(declare-fun b!1217234 () Bool)

(declare-fun res!808359 () Bool)

(declare-fun e!691054 () Bool)

(assert (=> b!1217234 (=> (not res!808359) (not e!691054))))

(declare-fun lt!553238 () ListLongMap!17919)

(assert (=> b!1217234 (= res!808359 (not (contains!7005 lt!553238 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217235 () Bool)

(declare-fun e!691050 () Bool)

(assert (=> b!1217235 (= e!691050 (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455)))))

(assert (=> b!1217235 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1217236 () Bool)

(declare-fun lt!553240 () Unit!40356)

(declare-fun lt!553239 () Unit!40356)

(assert (=> b!1217236 (= lt!553240 lt!553239)))

(declare-fun lt!553236 () V!46355)

(declare-fun lt!553237 () (_ BitVec 64))

(declare-fun lt!553234 () ListLongMap!17919)

(declare-fun lt!553235 () (_ BitVec 64))

(assert (=> b!1217236 (not (contains!7005 (+!4048 lt!553234 (tuple2!19951 lt!553237 lt!553236)) lt!553235))))

(assert (=> b!1217236 (= lt!553239 (addStillNotContains!298 lt!553234 lt!553237 lt!553236 lt!553235))))

(assert (=> b!1217236 (= lt!553235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217236 (= lt!553236 (get!19327 (select (arr!37942 _values!996) from!1455) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217236 (= lt!553237 (select (arr!37941 _keys!1208) from!1455))))

(declare-fun call!60610 () ListLongMap!17919)

(assert (=> b!1217236 (= lt!553234 call!60610)))

(declare-fun e!691051 () ListLongMap!17919)

(assert (=> b!1217236 (= e!691051 (+!4048 call!60610 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217237 () Bool)

(assert (=> b!1217237 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38477 _keys!1208)))))

(assert (=> b!1217237 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38478 _values!996)))))

(declare-fun e!691053 () Bool)

(assert (=> b!1217237 (= e!691053 (= (apply!970 lt!553238 (select (arr!37941 _keys!1208) from!1455)) (get!19327 (select (arr!37942 _values!996) from!1455) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217238 () Bool)

(declare-fun e!691052 () Bool)

(assert (=> b!1217238 (= e!691052 (isEmpty!994 lt!553238))))

(declare-fun b!1217239 () Bool)

(declare-fun e!691055 () ListLongMap!17919)

(assert (=> b!1217239 (= e!691055 e!691051)))

(declare-fun c!120064 () Bool)

(assert (=> b!1217239 (= c!120064 (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455)))))

(declare-fun d!133551 () Bool)

(assert (=> d!133551 e!691054))

(declare-fun res!808357 () Bool)

(assert (=> d!133551 (=> (not res!808357) (not e!691054))))

(assert (=> d!133551 (= res!808357 (not (contains!7005 lt!553238 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133551 (= lt!553238 e!691055)))

(declare-fun c!120063 () Bool)

(assert (=> d!133551 (= c!120063 (bvsge from!1455 (size!38477 _keys!1208)))))

(assert (=> d!133551 (validMask!0 mask!1564)))

(assert (=> d!133551 (= (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553238)))

(declare-fun b!1217240 () Bool)

(assert (=> b!1217240 (= e!691055 (ListLongMap!17920 Nil!26751))))

(declare-fun b!1217241 () Bool)

(declare-fun e!691049 () Bool)

(assert (=> b!1217241 (= e!691049 e!691052)))

(declare-fun c!120062 () Bool)

(assert (=> b!1217241 (= c!120062 (bvslt from!1455 (size!38477 _keys!1208)))))

(declare-fun b!1217242 () Bool)

(assert (=> b!1217242 (= e!691054 e!691049)))

(declare-fun c!120061 () Bool)

(assert (=> b!1217242 (= c!120061 e!691050)))

(declare-fun res!808358 () Bool)

(assert (=> b!1217242 (=> (not res!808358) (not e!691050))))

(assert (=> b!1217242 (= res!808358 (bvslt from!1455 (size!38477 _keys!1208)))))

(declare-fun b!1217243 () Bool)

(assert (=> b!1217243 (= e!691049 e!691053)))

(assert (=> b!1217243 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38477 _keys!1208)))))

(declare-fun res!808356 () Bool)

(assert (=> b!1217243 (= res!808356 (contains!7005 lt!553238 (select (arr!37941 _keys!1208) from!1455)))))

(assert (=> b!1217243 (=> (not res!808356) (not e!691053))))

(declare-fun b!1217244 () Bool)

(assert (=> b!1217244 (= e!691052 (= lt!553238 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217245 () Bool)

(assert (=> b!1217245 (= e!691051 call!60610)))

(declare-fun bm!60607 () Bool)

(assert (=> bm!60607 (= call!60610 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!133551 c!120063) b!1217240))

(assert (= (and d!133551 (not c!120063)) b!1217239))

(assert (= (and b!1217239 c!120064) b!1217236))

(assert (= (and b!1217239 (not c!120064)) b!1217245))

(assert (= (or b!1217236 b!1217245) bm!60607))

(assert (= (and d!133551 res!808357) b!1217234))

(assert (= (and b!1217234 res!808359) b!1217242))

(assert (= (and b!1217242 res!808358) b!1217235))

(assert (= (and b!1217242 c!120061) b!1217243))

(assert (= (and b!1217242 (not c!120061)) b!1217241))

(assert (= (and b!1217243 res!808356) b!1217237))

(assert (= (and b!1217241 c!120062) b!1217244))

(assert (= (and b!1217241 (not c!120062)) b!1217238))

(declare-fun b_lambda!21903 () Bool)

(assert (=> (not b_lambda!21903) (not b!1217236)))

(assert (=> b!1217236 t!39950))

(declare-fun b_and!43563 () Bool)

(assert (= b_and!43561 (and (=> t!39950 result!22631) b_and!43563)))

(declare-fun b_lambda!21905 () Bool)

(assert (=> (not b_lambda!21905) (not b!1217237)))

(assert (=> b!1217237 t!39950))

(declare-fun b_and!43565 () Bool)

(assert (= b_and!43563 (and (=> t!39950 result!22631) b_and!43565)))

(declare-fun m!1121959 () Bool)

(assert (=> b!1217238 m!1121959))

(declare-fun m!1121961 () Bool)

(assert (=> bm!60607 m!1121961))

(assert (=> b!1217239 m!1121845))

(assert (=> b!1217239 m!1121845))

(assert (=> b!1217239 m!1121847))

(assert (=> b!1217243 m!1121845))

(assert (=> b!1217243 m!1121845))

(declare-fun m!1121963 () Bool)

(assert (=> b!1217243 m!1121963))

(assert (=> b!1217235 m!1121845))

(assert (=> b!1217235 m!1121845))

(assert (=> b!1217235 m!1121847))

(declare-fun m!1121965 () Bool)

(assert (=> b!1217234 m!1121965))

(assert (=> b!1217237 m!1121857))

(assert (=> b!1217237 m!1121845))

(declare-fun m!1121967 () Bool)

(assert (=> b!1217237 m!1121967))

(assert (=> b!1217237 m!1121845))

(assert (=> b!1217237 m!1121871))

(assert (=> b!1217237 m!1121857))

(assert (=> b!1217237 m!1121871))

(declare-fun m!1121969 () Bool)

(assert (=> b!1217237 m!1121969))

(declare-fun m!1121971 () Bool)

(assert (=> d!133551 m!1121971))

(assert (=> d!133551 m!1121849))

(assert (=> b!1217236 m!1121845))

(declare-fun m!1121973 () Bool)

(assert (=> b!1217236 m!1121973))

(declare-fun m!1121975 () Bool)

(assert (=> b!1217236 m!1121975))

(assert (=> b!1217236 m!1121973))

(declare-fun m!1121977 () Bool)

(assert (=> b!1217236 m!1121977))

(assert (=> b!1217236 m!1121871))

(assert (=> b!1217236 m!1121857))

(assert (=> b!1217236 m!1121871))

(assert (=> b!1217236 m!1121969))

(assert (=> b!1217236 m!1121857))

(declare-fun m!1121979 () Bool)

(assert (=> b!1217236 m!1121979))

(assert (=> b!1217244 m!1121961))

(assert (=> b!1217139 d!133551))

(declare-fun b!1217256 () Bool)

(declare-fun e!691064 () Bool)

(declare-fun e!691067 () Bool)

(assert (=> b!1217256 (= e!691064 e!691067)))

(declare-fun c!120067 () Bool)

(assert (=> b!1217256 (= c!120067 (validKeyInArray!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60610 () Bool)

(declare-fun call!60613 () Bool)

(assert (=> bm!60610 (= call!60613 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120067 (Cons!26751 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000) Nil!26752) Nil!26752)))))

(declare-fun b!1217257 () Bool)

(assert (=> b!1217257 (= e!691067 call!60613)))

(declare-fun b!1217258 () Bool)

(assert (=> b!1217258 (= e!691067 call!60613)))

(declare-fun d!133553 () Bool)

(declare-fun res!808366 () Bool)

(declare-fun e!691065 () Bool)

(assert (=> d!133553 (=> res!808366 e!691065)))

(assert (=> d!133553 (= res!808366 (bvsge #b00000000000000000000000000000000 (size!38477 _keys!1208)))))

(assert (=> d!133553 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26752) e!691065)))

(declare-fun b!1217259 () Bool)

(declare-fun e!691066 () Bool)

(declare-fun contains!7006 (List!26755 (_ BitVec 64)) Bool)

(assert (=> b!1217259 (= e!691066 (contains!7006 Nil!26752 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217260 () Bool)

(assert (=> b!1217260 (= e!691065 e!691064)))

(declare-fun res!808367 () Bool)

(assert (=> b!1217260 (=> (not res!808367) (not e!691064))))

(assert (=> b!1217260 (= res!808367 (not e!691066))))

(declare-fun res!808368 () Bool)

(assert (=> b!1217260 (=> (not res!808368) (not e!691066))))

(assert (=> b!1217260 (= res!808368 (validKeyInArray!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133553 (not res!808366)) b!1217260))

(assert (= (and b!1217260 res!808368) b!1217259))

(assert (= (and b!1217260 res!808367) b!1217256))

(assert (= (and b!1217256 c!120067) b!1217258))

(assert (= (and b!1217256 (not c!120067)) b!1217257))

(assert (= (or b!1217258 b!1217257) bm!60610))

(declare-fun m!1121981 () Bool)

(assert (=> b!1217256 m!1121981))

(assert (=> b!1217256 m!1121981))

(declare-fun m!1121983 () Bool)

(assert (=> b!1217256 m!1121983))

(assert (=> bm!60610 m!1121981))

(declare-fun m!1121985 () Bool)

(assert (=> bm!60610 m!1121985))

(assert (=> b!1217259 m!1121981))

(assert (=> b!1217259 m!1121981))

(declare-fun m!1121987 () Bool)

(assert (=> b!1217259 m!1121987))

(assert (=> b!1217260 m!1121981))

(assert (=> b!1217260 m!1121981))

(assert (=> b!1217260 m!1121983))

(assert (=> b!1217135 d!133553))

(declare-fun d!133555 () Bool)

(assert (=> d!133555 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1217130 d!133555))

(declare-fun b!1217261 () Bool)

(declare-fun e!691068 () Bool)

(declare-fun e!691071 () Bool)

(assert (=> b!1217261 (= e!691068 e!691071)))

(declare-fun c!120068 () Bool)

(assert (=> b!1217261 (= c!120068 (validKeyInArray!0 (select (arr!37941 lt!553176) #b00000000000000000000000000000000)))))

(declare-fun bm!60611 () Bool)

(declare-fun call!60614 () Bool)

(assert (=> bm!60611 (= call!60614 (arrayNoDuplicates!0 lt!553176 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120068 (Cons!26751 (select (arr!37941 lt!553176) #b00000000000000000000000000000000) Nil!26752) Nil!26752)))))

(declare-fun b!1217262 () Bool)

(assert (=> b!1217262 (= e!691071 call!60614)))

(declare-fun b!1217263 () Bool)

(assert (=> b!1217263 (= e!691071 call!60614)))

(declare-fun d!133557 () Bool)

(declare-fun res!808369 () Bool)

(declare-fun e!691069 () Bool)

(assert (=> d!133557 (=> res!808369 e!691069)))

(assert (=> d!133557 (= res!808369 (bvsge #b00000000000000000000000000000000 (size!38477 lt!553176)))))

(assert (=> d!133557 (= (arrayNoDuplicates!0 lt!553176 #b00000000000000000000000000000000 Nil!26752) e!691069)))

(declare-fun b!1217264 () Bool)

(declare-fun e!691070 () Bool)

(assert (=> b!1217264 (= e!691070 (contains!7006 Nil!26752 (select (arr!37941 lt!553176) #b00000000000000000000000000000000)))))

(declare-fun b!1217265 () Bool)

(assert (=> b!1217265 (= e!691069 e!691068)))

(declare-fun res!808370 () Bool)

(assert (=> b!1217265 (=> (not res!808370) (not e!691068))))

(assert (=> b!1217265 (= res!808370 (not e!691070))))

(declare-fun res!808371 () Bool)

(assert (=> b!1217265 (=> (not res!808371) (not e!691070))))

(assert (=> b!1217265 (= res!808371 (validKeyInArray!0 (select (arr!37941 lt!553176) #b00000000000000000000000000000000)))))

(assert (= (and d!133557 (not res!808369)) b!1217265))

(assert (= (and b!1217265 res!808371) b!1217264))

(assert (= (and b!1217265 res!808370) b!1217261))

(assert (= (and b!1217261 c!120068) b!1217263))

(assert (= (and b!1217261 (not c!120068)) b!1217262))

(assert (= (or b!1217263 b!1217262) bm!60611))

(declare-fun m!1121989 () Bool)

(assert (=> b!1217261 m!1121989))

(assert (=> b!1217261 m!1121989))

(declare-fun m!1121991 () Bool)

(assert (=> b!1217261 m!1121991))

(assert (=> bm!60611 m!1121989))

(declare-fun m!1121993 () Bool)

(assert (=> bm!60611 m!1121993))

(assert (=> b!1217264 m!1121989))

(assert (=> b!1217264 m!1121989))

(declare-fun m!1121995 () Bool)

(assert (=> b!1217264 m!1121995))

(assert (=> b!1217265 m!1121989))

(assert (=> b!1217265 m!1121989))

(assert (=> b!1217265 m!1121991))

(assert (=> b!1217136 d!133557))

(declare-fun d!133559 () Bool)

(assert (=> d!133559 (= (array_inv!28882 _keys!1208) (bvsge (size!38477 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101294 d!133559))

(declare-fun d!133561 () Bool)

(assert (=> d!133561 (= (array_inv!28883 _values!996) (bvsge (size!38478 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101294 d!133561))

(declare-fun b!1217274 () Bool)

(declare-fun e!691078 () Bool)

(declare-fun e!691079 () Bool)

(assert (=> b!1217274 (= e!691078 e!691079)))

(declare-fun lt!553249 () (_ BitVec 64))

(assert (=> b!1217274 (= lt!553249 (select (arr!37941 lt!553176) #b00000000000000000000000000000000))))

(declare-fun lt!553248 () Unit!40356)

(assert (=> b!1217274 (= lt!553248 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553176 lt!553249 #b00000000000000000000000000000000))))

(assert (=> b!1217274 (arrayContainsKey!0 lt!553176 lt!553249 #b00000000000000000000000000000000)))

(declare-fun lt!553247 () Unit!40356)

(assert (=> b!1217274 (= lt!553247 lt!553248)))

(declare-fun res!808376 () Bool)

(declare-datatypes ((SeekEntryResult!9943 0))(
  ( (MissingZero!9943 (index!42143 (_ BitVec 32))) (Found!9943 (index!42144 (_ BitVec 32))) (Intermediate!9943 (undefined!10755 Bool) (index!42145 (_ BitVec 32)) (x!107232 (_ BitVec 32))) (Undefined!9943) (MissingVacant!9943 (index!42146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78613 (_ BitVec 32)) SeekEntryResult!9943)

(assert (=> b!1217274 (= res!808376 (= (seekEntryOrOpen!0 (select (arr!37941 lt!553176) #b00000000000000000000000000000000) lt!553176 mask!1564) (Found!9943 #b00000000000000000000000000000000)))))

(assert (=> b!1217274 (=> (not res!808376) (not e!691079))))

(declare-fun b!1217276 () Bool)

(declare-fun e!691080 () Bool)

(assert (=> b!1217276 (= e!691080 e!691078)))

(declare-fun c!120071 () Bool)

(assert (=> b!1217276 (= c!120071 (validKeyInArray!0 (select (arr!37941 lt!553176) #b00000000000000000000000000000000)))))

(declare-fun b!1217277 () Bool)

(declare-fun call!60617 () Bool)

(assert (=> b!1217277 (= e!691079 call!60617)))

(declare-fun bm!60614 () Bool)

(assert (=> bm!60614 (= call!60617 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553176 mask!1564))))

(declare-fun d!133563 () Bool)

(declare-fun res!808377 () Bool)

(assert (=> d!133563 (=> res!808377 e!691080)))

(assert (=> d!133563 (= res!808377 (bvsge #b00000000000000000000000000000000 (size!38477 lt!553176)))))

(assert (=> d!133563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553176 mask!1564) e!691080)))

(declare-fun b!1217275 () Bool)

(assert (=> b!1217275 (= e!691078 call!60617)))

(assert (= (and d!133563 (not res!808377)) b!1217276))

(assert (= (and b!1217276 c!120071) b!1217274))

(assert (= (and b!1217276 (not c!120071)) b!1217275))

(assert (= (and b!1217274 res!808376) b!1217277))

(assert (= (or b!1217277 b!1217275) bm!60614))

(assert (=> b!1217274 m!1121989))

(declare-fun m!1121997 () Bool)

(assert (=> b!1217274 m!1121997))

(declare-fun m!1121999 () Bool)

(assert (=> b!1217274 m!1121999))

(assert (=> b!1217274 m!1121989))

(declare-fun m!1122001 () Bool)

(assert (=> b!1217274 m!1122001))

(assert (=> b!1217276 m!1121989))

(assert (=> b!1217276 m!1121989))

(assert (=> b!1217276 m!1121991))

(declare-fun m!1122003 () Bool)

(assert (=> bm!60614 m!1122003))

(assert (=> b!1217145 d!133563))

(declare-fun d!133565 () Bool)

(assert (=> d!133565 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1217132 d!133565))

(declare-fun b!1217278 () Bool)

(declare-fun e!691081 () Bool)

(declare-fun e!691082 () Bool)

(assert (=> b!1217278 (= e!691081 e!691082)))

(declare-fun lt!553252 () (_ BitVec 64))

(assert (=> b!1217278 (= lt!553252 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553251 () Unit!40356)

(assert (=> b!1217278 (= lt!553251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!553252 #b00000000000000000000000000000000))))

(assert (=> b!1217278 (arrayContainsKey!0 _keys!1208 lt!553252 #b00000000000000000000000000000000)))

(declare-fun lt!553250 () Unit!40356)

(assert (=> b!1217278 (= lt!553250 lt!553251)))

(declare-fun res!808378 () Bool)

(assert (=> b!1217278 (= res!808378 (= (seekEntryOrOpen!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9943 #b00000000000000000000000000000000)))))

(assert (=> b!1217278 (=> (not res!808378) (not e!691082))))

(declare-fun b!1217280 () Bool)

(declare-fun e!691083 () Bool)

(assert (=> b!1217280 (= e!691083 e!691081)))

(declare-fun c!120072 () Bool)

(assert (=> b!1217280 (= c!120072 (validKeyInArray!0 (select (arr!37941 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217281 () Bool)

(declare-fun call!60618 () Bool)

(assert (=> b!1217281 (= e!691082 call!60618)))

(declare-fun bm!60615 () Bool)

(assert (=> bm!60615 (= call!60618 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!133567 () Bool)

(declare-fun res!808379 () Bool)

(assert (=> d!133567 (=> res!808379 e!691083)))

(assert (=> d!133567 (= res!808379 (bvsge #b00000000000000000000000000000000 (size!38477 _keys!1208)))))

(assert (=> d!133567 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!691083)))

(declare-fun b!1217279 () Bool)

(assert (=> b!1217279 (= e!691081 call!60618)))

(assert (= (and d!133567 (not res!808379)) b!1217280))

(assert (= (and b!1217280 c!120072) b!1217278))

(assert (= (and b!1217280 (not c!120072)) b!1217279))

(assert (= (and b!1217278 res!808378) b!1217281))

(assert (= (or b!1217281 b!1217279) bm!60615))

(assert (=> b!1217278 m!1121981))

(declare-fun m!1122005 () Bool)

(assert (=> b!1217278 m!1122005))

(declare-fun m!1122007 () Bool)

(assert (=> b!1217278 m!1122007))

(assert (=> b!1217278 m!1121981))

(declare-fun m!1122009 () Bool)

(assert (=> b!1217278 m!1122009))

(assert (=> b!1217280 m!1121981))

(assert (=> b!1217280 m!1121981))

(assert (=> b!1217280 m!1121983))

(declare-fun m!1122011 () Bool)

(assert (=> bm!60615 m!1122011))

(assert (=> b!1217142 d!133567))

(declare-fun d!133569 () Bool)

(declare-fun e!691086 () Bool)

(assert (=> d!133569 e!691086))

(declare-fun res!808385 () Bool)

(assert (=> d!133569 (=> (not res!808385) (not e!691086))))

(declare-fun lt!553261 () ListLongMap!17919)

(assert (=> d!133569 (= res!808385 (contains!7005 lt!553261 (_1!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))))))

(declare-fun lt!553264 () List!26754)

(assert (=> d!133569 (= lt!553261 (ListLongMap!17920 lt!553264))))

(declare-fun lt!553262 () Unit!40356)

(declare-fun lt!553263 () Unit!40356)

(assert (=> d!133569 (= lt!553262 lt!553263)))

(declare-datatypes ((Option!692 0))(
  ( (Some!691 (v!18172 V!46355)) (None!690) )
))
(declare-fun getValueByKey!641 (List!26754 (_ BitVec 64)) Option!692)

(assert (=> d!133569 (= (getValueByKey!641 lt!553264 (_1!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))) (Some!691 (_2!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!318 (List!26754 (_ BitVec 64) V!46355) Unit!40356)

(assert (=> d!133569 (= lt!553263 (lemmaContainsTupThenGetReturnValue!318 lt!553264 (_1!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178))) (_2!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))))))

(declare-fun insertStrictlySorted!411 (List!26754 (_ BitVec 64) V!46355) List!26754)

(assert (=> d!133569 (= lt!553264 (insertStrictlySorted!411 (toList!8975 lt!553179) (_1!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178))) (_2!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))))))

(assert (=> d!133569 (= (+!4048 lt!553179 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178))) lt!553261)))

(declare-fun b!1217286 () Bool)

(declare-fun res!808384 () Bool)

(assert (=> b!1217286 (=> (not res!808384) (not e!691086))))

(assert (=> b!1217286 (= res!808384 (= (getValueByKey!641 (toList!8975 lt!553261) (_1!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178)))) (Some!691 (_2!9986 (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178))))))))

(declare-fun b!1217287 () Bool)

(declare-fun contains!7007 (List!26754 tuple2!19950) Bool)

(assert (=> b!1217287 (= e!691086 (contains!7007 (toList!8975 lt!553261) (tuple2!19951 (select (arr!37941 _keys!1208) from!1455) (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178))))))

(assert (= (and d!133569 res!808385) b!1217286))

(assert (= (and b!1217286 res!808384) b!1217287))

(declare-fun m!1122013 () Bool)

(assert (=> d!133569 m!1122013))

(declare-fun m!1122015 () Bool)

(assert (=> d!133569 m!1122015))

(declare-fun m!1122017 () Bool)

(assert (=> d!133569 m!1122017))

(declare-fun m!1122019 () Bool)

(assert (=> d!133569 m!1122019))

(declare-fun m!1122021 () Bool)

(assert (=> b!1217286 m!1122021))

(declare-fun m!1122023 () Bool)

(assert (=> b!1217287 m!1122023))

(assert (=> b!1217133 d!133569))

(declare-fun d!133571 () Bool)

(declare-fun c!120075 () Bool)

(assert (=> d!133571 (= c!120075 ((_ is ValueCellFull!14751) (select (arr!37942 _values!996) from!1455)))))

(declare-fun e!691089 () V!46355)

(assert (=> d!133571 (= (get!19327 (select (arr!37942 _values!996) from!1455) lt!553178) e!691089)))

(declare-fun b!1217292 () Bool)

(declare-fun get!19329 (ValueCell!14751 V!46355) V!46355)

(assert (=> b!1217292 (= e!691089 (get!19329 (select (arr!37942 _values!996) from!1455) lt!553178))))

(declare-fun b!1217293 () Bool)

(declare-fun get!19330 (ValueCell!14751 V!46355) V!46355)

(assert (=> b!1217293 (= e!691089 (get!19330 (select (arr!37942 _values!996) from!1455) lt!553178))))

(assert (= (and d!133571 c!120075) b!1217292))

(assert (= (and d!133571 (not c!120075)) b!1217293))

(assert (=> b!1217292 m!1121857))

(declare-fun m!1122025 () Bool)

(assert (=> b!1217292 m!1122025))

(assert (=> b!1217293 m!1121857))

(declare-fun m!1122027 () Bool)

(assert (=> b!1217293 m!1122027))

(assert (=> b!1217133 d!133571))

(declare-fun bm!60621 () Bool)

(declare-fun call!60623 () ListLongMap!17919)

(assert (=> bm!60621 (= call!60623 (getCurrentListMapNoExtraKeys!5402 (array!78614 (store (arr!37941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38477 _keys!1208)) (array!78616 (store (arr!37942 _values!996) i!673 (ValueCellFull!14751 (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38478 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217300 () Bool)

(declare-fun e!691094 () Bool)

(declare-fun e!691095 () Bool)

(assert (=> b!1217300 (= e!691094 e!691095)))

(declare-fun c!120078 () Bool)

(assert (=> b!1217300 (= c!120078 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1217301 () Bool)

(declare-fun call!60624 () ListLongMap!17919)

(assert (=> b!1217301 (= e!691095 (= call!60623 call!60624))))

(assert (=> b!1217301 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38478 _values!996)))))

(declare-fun b!1217302 () Bool)

(assert (=> b!1217302 (= e!691095 (= call!60623 (-!1892 call!60624 k0!934)))))

(assert (=> b!1217302 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38478 _values!996)))))

(declare-fun d!133573 () Bool)

(assert (=> d!133573 e!691094))

(declare-fun res!808388 () Bool)

(assert (=> d!133573 (=> (not res!808388) (not e!691094))))

(assert (=> d!133573 (= res!808388 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38477 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38477 _keys!1208))))))))

(declare-fun lt!553267 () Unit!40356)

(declare-fun choose!1821 (array!78613 array!78615 (_ BitVec 32) (_ BitVec 32) V!46355 V!46355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40356)

(assert (=> d!133573 (= lt!553267 (choose!1821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133573 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 _keys!1208)))))

(assert (=> d!133573 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553267)))

(declare-fun bm!60620 () Bool)

(assert (=> bm!60620 (= call!60624 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133573 res!808388) b!1217300))

(assert (= (and b!1217300 c!120078) b!1217302))

(assert (= (and b!1217300 (not c!120078)) b!1217301))

(assert (= (or b!1217302 b!1217301) bm!60620))

(assert (= (or b!1217302 b!1217301) bm!60621))

(declare-fun b_lambda!21907 () Bool)

(assert (=> (not b_lambda!21907) (not bm!60621)))

(assert (=> bm!60621 t!39950))

(declare-fun b_and!43567 () Bool)

(assert (= b_and!43565 (and (=> t!39950 result!22631) b_and!43567)))

(assert (=> bm!60621 m!1121833))

(assert (=> bm!60621 m!1121871))

(declare-fun m!1122029 () Bool)

(assert (=> bm!60621 m!1122029))

(declare-fun m!1122031 () Bool)

(assert (=> bm!60621 m!1122031))

(declare-fun m!1122033 () Bool)

(assert (=> b!1217302 m!1122033))

(declare-fun m!1122035 () Bool)

(assert (=> d!133573 m!1122035))

(assert (=> bm!60620 m!1121837))

(assert (=> b!1217143 d!133573))

(declare-fun b!1217303 () Bool)

(declare-fun res!808392 () Bool)

(declare-fun e!691101 () Bool)

(assert (=> b!1217303 (=> (not res!808392) (not e!691101))))

(declare-fun lt!553272 () ListLongMap!17919)

(assert (=> b!1217303 (= res!808392 (not (contains!7005 lt!553272 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217304 () Bool)

(declare-fun e!691097 () Bool)

(assert (=> b!1217304 (= e!691097 (validKeyInArray!0 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217304 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1217305 () Bool)

(declare-fun lt!553274 () Unit!40356)

(declare-fun lt!553273 () Unit!40356)

(assert (=> b!1217305 (= lt!553274 lt!553273)))

(declare-fun lt!553268 () ListLongMap!17919)

(declare-fun lt!553270 () V!46355)

(declare-fun lt!553269 () (_ BitVec 64))

(declare-fun lt!553271 () (_ BitVec 64))

(assert (=> b!1217305 (not (contains!7005 (+!4048 lt!553268 (tuple2!19951 lt!553271 lt!553270)) lt!553269))))

(assert (=> b!1217305 (= lt!553273 (addStillNotContains!298 lt!553268 lt!553271 lt!553270 lt!553269))))

(assert (=> b!1217305 (= lt!553269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217305 (= lt!553270 (get!19327 (select (arr!37942 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217305 (= lt!553271 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60625 () ListLongMap!17919)

(assert (=> b!1217305 (= lt!553268 call!60625)))

(declare-fun e!691098 () ListLongMap!17919)

(assert (=> b!1217305 (= e!691098 (+!4048 call!60625 (tuple2!19951 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19327 (select (arr!37942 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217306 () Bool)

(assert (=> b!1217306 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 _keys!1208)))))

(assert (=> b!1217306 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38478 _values!996)))))

(declare-fun e!691100 () Bool)

(assert (=> b!1217306 (= e!691100 (= (apply!970 lt!553272 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19327 (select (arr!37942 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217307 () Bool)

(declare-fun e!691099 () Bool)

(assert (=> b!1217307 (= e!691099 (isEmpty!994 lt!553272))))

(declare-fun b!1217308 () Bool)

(declare-fun e!691102 () ListLongMap!17919)

(assert (=> b!1217308 (= e!691102 e!691098)))

(declare-fun c!120082 () Bool)

(assert (=> b!1217308 (= c!120082 (validKeyInArray!0 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133575 () Bool)

(assert (=> d!133575 e!691101))

(declare-fun res!808390 () Bool)

(assert (=> d!133575 (=> (not res!808390) (not e!691101))))

(assert (=> d!133575 (= res!808390 (not (contains!7005 lt!553272 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133575 (= lt!553272 e!691102)))

(declare-fun c!120081 () Bool)

(assert (=> d!133575 (= c!120081 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 _keys!1208)))))

(assert (=> d!133575 (validMask!0 mask!1564)))

(assert (=> d!133575 (= (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553272)))

(declare-fun b!1217309 () Bool)

(assert (=> b!1217309 (= e!691102 (ListLongMap!17920 Nil!26751))))

(declare-fun b!1217310 () Bool)

(declare-fun e!691096 () Bool)

(assert (=> b!1217310 (= e!691096 e!691099)))

(declare-fun c!120080 () Bool)

(assert (=> b!1217310 (= c!120080 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 _keys!1208)))))

(declare-fun b!1217311 () Bool)

(assert (=> b!1217311 (= e!691101 e!691096)))

(declare-fun c!120079 () Bool)

(assert (=> b!1217311 (= c!120079 e!691097)))

(declare-fun res!808391 () Bool)

(assert (=> b!1217311 (=> (not res!808391) (not e!691097))))

(assert (=> b!1217311 (= res!808391 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 _keys!1208)))))

(declare-fun b!1217312 () Bool)

(assert (=> b!1217312 (= e!691096 e!691100)))

(assert (=> b!1217312 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 _keys!1208)))))

(declare-fun res!808389 () Bool)

(assert (=> b!1217312 (= res!808389 (contains!7005 lt!553272 (select (arr!37941 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217312 (=> (not res!808389) (not e!691100))))

(declare-fun b!1217313 () Bool)

(assert (=> b!1217313 (= e!691099 (= lt!553272 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217314 () Bool)

(assert (=> b!1217314 (= e!691098 call!60625)))

(declare-fun bm!60622 () Bool)

(assert (=> bm!60622 (= call!60625 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!133575 c!120081) b!1217309))

(assert (= (and d!133575 (not c!120081)) b!1217308))

(assert (= (and b!1217308 c!120082) b!1217305))

(assert (= (and b!1217308 (not c!120082)) b!1217314))

(assert (= (or b!1217305 b!1217314) bm!60622))

(assert (= (and d!133575 res!808390) b!1217303))

(assert (= (and b!1217303 res!808392) b!1217311))

(assert (= (and b!1217311 res!808391) b!1217304))

(assert (= (and b!1217311 c!120079) b!1217312))

(assert (= (and b!1217311 (not c!120079)) b!1217310))

(assert (= (and b!1217312 res!808389) b!1217306))

(assert (= (and b!1217310 c!120080) b!1217313))

(assert (= (and b!1217310 (not c!120080)) b!1217307))

(declare-fun b_lambda!21909 () Bool)

(assert (=> (not b_lambda!21909) (not b!1217305)))

(assert (=> b!1217305 t!39950))

(declare-fun b_and!43569 () Bool)

(assert (= b_and!43567 (and (=> t!39950 result!22631) b_and!43569)))

(declare-fun b_lambda!21911 () Bool)

(assert (=> (not b_lambda!21911) (not b!1217306)))

(assert (=> b!1217306 t!39950))

(declare-fun b_and!43571 () Bool)

(assert (= b_and!43569 (and (=> t!39950 result!22631) b_and!43571)))

(declare-fun m!1122037 () Bool)

(assert (=> b!1217307 m!1122037))

(declare-fun m!1122039 () Bool)

(assert (=> bm!60622 m!1122039))

(declare-fun m!1122041 () Bool)

(assert (=> b!1217308 m!1122041))

(assert (=> b!1217308 m!1122041))

(declare-fun m!1122043 () Bool)

(assert (=> b!1217308 m!1122043))

(assert (=> b!1217312 m!1122041))

(assert (=> b!1217312 m!1122041))

(declare-fun m!1122045 () Bool)

(assert (=> b!1217312 m!1122045))

(assert (=> b!1217304 m!1122041))

(assert (=> b!1217304 m!1122041))

(assert (=> b!1217304 m!1122043))

(declare-fun m!1122047 () Bool)

(assert (=> b!1217303 m!1122047))

(declare-fun m!1122049 () Bool)

(assert (=> b!1217306 m!1122049))

(assert (=> b!1217306 m!1122041))

(declare-fun m!1122051 () Bool)

(assert (=> b!1217306 m!1122051))

(assert (=> b!1217306 m!1122041))

(assert (=> b!1217306 m!1121871))

(assert (=> b!1217306 m!1122049))

(assert (=> b!1217306 m!1121871))

(declare-fun m!1122053 () Bool)

(assert (=> b!1217306 m!1122053))

(declare-fun m!1122055 () Bool)

(assert (=> d!133575 m!1122055))

(assert (=> d!133575 m!1121849))

(assert (=> b!1217305 m!1122041))

(declare-fun m!1122057 () Bool)

(assert (=> b!1217305 m!1122057))

(declare-fun m!1122059 () Bool)

(assert (=> b!1217305 m!1122059))

(assert (=> b!1217305 m!1122057))

(declare-fun m!1122061 () Bool)

(assert (=> b!1217305 m!1122061))

(assert (=> b!1217305 m!1121871))

(assert (=> b!1217305 m!1122049))

(assert (=> b!1217305 m!1121871))

(assert (=> b!1217305 m!1122053))

(assert (=> b!1217305 m!1122049))

(declare-fun m!1122063 () Bool)

(assert (=> b!1217305 m!1122063))

(assert (=> b!1217313 m!1122039))

(assert (=> b!1217143 d!133575))

(declare-fun d!133577 () Bool)

(declare-fun lt!553277 () ListLongMap!17919)

(assert (=> d!133577 (not (contains!7005 lt!553277 k0!934))))

(declare-fun removeStrictlySorted!103 (List!26754 (_ BitVec 64)) List!26754)

(assert (=> d!133577 (= lt!553277 (ListLongMap!17920 (removeStrictlySorted!103 (toList!8975 lt!553174) k0!934)))))

(assert (=> d!133577 (= (-!1892 lt!553174 k0!934) lt!553277)))

(declare-fun bs!34306 () Bool)

(assert (= bs!34306 d!133577))

(declare-fun m!1122065 () Bool)

(assert (=> bs!34306 m!1122065))

(declare-fun m!1122067 () Bool)

(assert (=> bs!34306 m!1122067))

(assert (=> b!1217143 d!133577))

(declare-fun d!133579 () Bool)

(assert (=> d!133579 (= (validKeyInArray!0 (select (arr!37941 _keys!1208) from!1455)) (and (not (= (select (arr!37941 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37941 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1217143 d!133579))

(declare-fun b!1217315 () Bool)

(declare-fun res!808396 () Bool)

(declare-fun e!691108 () Bool)

(assert (=> b!1217315 (=> (not res!808396) (not e!691108))))

(declare-fun lt!553282 () ListLongMap!17919)

(assert (=> b!1217315 (= res!808396 (not (contains!7005 lt!553282 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217316 () Bool)

(declare-fun e!691104 () Bool)

(assert (=> b!1217316 (= e!691104 (validKeyInArray!0 (select (arr!37941 lt!553176) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217316 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1217317 () Bool)

(declare-fun lt!553284 () Unit!40356)

(declare-fun lt!553283 () Unit!40356)

(assert (=> b!1217317 (= lt!553284 lt!553283)))

(declare-fun lt!553281 () (_ BitVec 64))

(declare-fun lt!553280 () V!46355)

(declare-fun lt!553278 () ListLongMap!17919)

(declare-fun lt!553279 () (_ BitVec 64))

(assert (=> b!1217317 (not (contains!7005 (+!4048 lt!553278 (tuple2!19951 lt!553281 lt!553280)) lt!553279))))

(assert (=> b!1217317 (= lt!553283 (addStillNotContains!298 lt!553278 lt!553281 lt!553280 lt!553279))))

(assert (=> b!1217317 (= lt!553279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217317 (= lt!553280 (get!19327 (select (arr!37942 lt!553181) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217317 (= lt!553281 (select (arr!37941 lt!553176) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60626 () ListLongMap!17919)

(assert (=> b!1217317 (= lt!553278 call!60626)))

(declare-fun e!691105 () ListLongMap!17919)

(assert (=> b!1217317 (= e!691105 (+!4048 call!60626 (tuple2!19951 (select (arr!37941 lt!553176) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19327 (select (arr!37942 lt!553181) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217318 () Bool)

(assert (=> b!1217318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 lt!553176)))))

(assert (=> b!1217318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38478 lt!553181)))))

(declare-fun e!691107 () Bool)

(assert (=> b!1217318 (= e!691107 (= (apply!970 lt!553282 (select (arr!37941 lt!553176) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19327 (select (arr!37942 lt!553181) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217319 () Bool)

(declare-fun e!691106 () Bool)

(assert (=> b!1217319 (= e!691106 (isEmpty!994 lt!553282))))

(declare-fun b!1217320 () Bool)

(declare-fun e!691109 () ListLongMap!17919)

(assert (=> b!1217320 (= e!691109 e!691105)))

(declare-fun c!120086 () Bool)

(assert (=> b!1217320 (= c!120086 (validKeyInArray!0 (select (arr!37941 lt!553176) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133581 () Bool)

(assert (=> d!133581 e!691108))

(declare-fun res!808394 () Bool)

(assert (=> d!133581 (=> (not res!808394) (not e!691108))))

(assert (=> d!133581 (= res!808394 (not (contains!7005 lt!553282 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133581 (= lt!553282 e!691109)))

(declare-fun c!120085 () Bool)

(assert (=> d!133581 (= c!120085 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 lt!553176)))))

(assert (=> d!133581 (validMask!0 mask!1564)))

(assert (=> d!133581 (= (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553282)))

(declare-fun b!1217321 () Bool)

(assert (=> b!1217321 (= e!691109 (ListLongMap!17920 Nil!26751))))

(declare-fun b!1217322 () Bool)

(declare-fun e!691103 () Bool)

(assert (=> b!1217322 (= e!691103 e!691106)))

(declare-fun c!120084 () Bool)

(assert (=> b!1217322 (= c!120084 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 lt!553176)))))

(declare-fun b!1217323 () Bool)

(assert (=> b!1217323 (= e!691108 e!691103)))

(declare-fun c!120083 () Bool)

(assert (=> b!1217323 (= c!120083 e!691104)))

(declare-fun res!808395 () Bool)

(assert (=> b!1217323 (=> (not res!808395) (not e!691104))))

(assert (=> b!1217323 (= res!808395 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 lt!553176)))))

(declare-fun b!1217324 () Bool)

(assert (=> b!1217324 (= e!691103 e!691107)))

(assert (=> b!1217324 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38477 lt!553176)))))

(declare-fun res!808393 () Bool)

(assert (=> b!1217324 (= res!808393 (contains!7005 lt!553282 (select (arr!37941 lt!553176) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217324 (=> (not res!808393) (not e!691107))))

(declare-fun b!1217325 () Bool)

(assert (=> b!1217325 (= e!691106 (= lt!553282 (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217326 () Bool)

(assert (=> b!1217326 (= e!691105 call!60626)))

(declare-fun bm!60623 () Bool)

(assert (=> bm!60623 (= call!60626 (getCurrentListMapNoExtraKeys!5402 lt!553176 lt!553181 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!133581 c!120085) b!1217321))

(assert (= (and d!133581 (not c!120085)) b!1217320))

(assert (= (and b!1217320 c!120086) b!1217317))

(assert (= (and b!1217320 (not c!120086)) b!1217326))

(assert (= (or b!1217317 b!1217326) bm!60623))

(assert (= (and d!133581 res!808394) b!1217315))

(assert (= (and b!1217315 res!808396) b!1217323))

(assert (= (and b!1217323 res!808395) b!1217316))

(assert (= (and b!1217323 c!120083) b!1217324))

(assert (= (and b!1217323 (not c!120083)) b!1217322))

(assert (= (and b!1217324 res!808393) b!1217318))

(assert (= (and b!1217322 c!120084) b!1217325))

(assert (= (and b!1217322 (not c!120084)) b!1217319))

(declare-fun b_lambda!21913 () Bool)

(assert (=> (not b_lambda!21913) (not b!1217317)))

(assert (=> b!1217317 t!39950))

(declare-fun b_and!43573 () Bool)

(assert (= b_and!43571 (and (=> t!39950 result!22631) b_and!43573)))

(declare-fun b_lambda!21915 () Bool)

(assert (=> (not b_lambda!21915) (not b!1217318)))

(assert (=> b!1217318 t!39950))

(declare-fun b_and!43575 () Bool)

(assert (= b_and!43573 (and (=> t!39950 result!22631) b_and!43575)))

(declare-fun m!1122069 () Bool)

(assert (=> b!1217319 m!1122069))

(declare-fun m!1122071 () Bool)

(assert (=> bm!60623 m!1122071))

(declare-fun m!1122073 () Bool)

(assert (=> b!1217320 m!1122073))

(assert (=> b!1217320 m!1122073))

(declare-fun m!1122075 () Bool)

(assert (=> b!1217320 m!1122075))

(assert (=> b!1217324 m!1122073))

(assert (=> b!1217324 m!1122073))

(declare-fun m!1122077 () Bool)

(assert (=> b!1217324 m!1122077))

(assert (=> b!1217316 m!1122073))

(assert (=> b!1217316 m!1122073))

(assert (=> b!1217316 m!1122075))

(declare-fun m!1122079 () Bool)

(assert (=> b!1217315 m!1122079))

(declare-fun m!1122081 () Bool)

(assert (=> b!1217318 m!1122081))

(assert (=> b!1217318 m!1122073))

(declare-fun m!1122083 () Bool)

(assert (=> b!1217318 m!1122083))

(assert (=> b!1217318 m!1122073))

(assert (=> b!1217318 m!1121871))

(assert (=> b!1217318 m!1122081))

(assert (=> b!1217318 m!1121871))

(declare-fun m!1122085 () Bool)

(assert (=> b!1217318 m!1122085))

(declare-fun m!1122087 () Bool)

(assert (=> d!133581 m!1122087))

(assert (=> d!133581 m!1121849))

(assert (=> b!1217317 m!1122073))

(declare-fun m!1122089 () Bool)

(assert (=> b!1217317 m!1122089))

(declare-fun m!1122091 () Bool)

(assert (=> b!1217317 m!1122091))

(assert (=> b!1217317 m!1122089))

(declare-fun m!1122093 () Bool)

(assert (=> b!1217317 m!1122093))

(assert (=> b!1217317 m!1121871))

(assert (=> b!1217317 m!1122081))

(assert (=> b!1217317 m!1121871))

(assert (=> b!1217317 m!1122085))

(assert (=> b!1217317 m!1122081))

(declare-fun m!1122095 () Bool)

(assert (=> b!1217317 m!1122095))

(assert (=> b!1217325 m!1122071))

(assert (=> b!1217143 d!133581))

(declare-fun d!133583 () Bool)

(declare-fun res!808401 () Bool)

(declare-fun e!691114 () Bool)

(assert (=> d!133583 (=> res!808401 e!691114)))

(assert (=> d!133583 (= res!808401 (= (select (arr!37941 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133583 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691114)))

(declare-fun b!1217331 () Bool)

(declare-fun e!691115 () Bool)

(assert (=> b!1217331 (= e!691114 e!691115)))

(declare-fun res!808402 () Bool)

(assert (=> b!1217331 (=> (not res!808402) (not e!691115))))

(assert (=> b!1217331 (= res!808402 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38477 _keys!1208)))))

(declare-fun b!1217332 () Bool)

(assert (=> b!1217332 (= e!691115 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133583 (not res!808401)) b!1217331))

(assert (= (and b!1217331 res!808402) b!1217332))

(assert (=> d!133583 m!1121981))

(declare-fun m!1122097 () Bool)

(assert (=> b!1217332 m!1122097))

(assert (=> b!1217134 d!133583))

(declare-fun d!133585 () Bool)

(assert (=> d!133585 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553287 () Unit!40356)

(declare-fun choose!13 (array!78613 (_ BitVec 64) (_ BitVec 32)) Unit!40356)

(assert (=> d!133585 (= lt!553287 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133585 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133585 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553287)))

(declare-fun bs!34307 () Bool)

(assert (= bs!34307 d!133585))

(assert (=> bs!34307 m!1121853))

(declare-fun m!1122099 () Bool)

(assert (=> bs!34307 m!1122099))

(assert (=> b!1217134 d!133585))

(declare-fun mapIsEmpty!48262 () Bool)

(declare-fun mapRes!48262 () Bool)

(assert (=> mapIsEmpty!48262 mapRes!48262))

(declare-fun b!1217340 () Bool)

(declare-fun e!691121 () Bool)

(assert (=> b!1217340 (= e!691121 tp_is_empty!30921)))

(declare-fun mapNonEmpty!48262 () Bool)

(declare-fun tp!91682 () Bool)

(declare-fun e!691120 () Bool)

(assert (=> mapNonEmpty!48262 (= mapRes!48262 (and tp!91682 e!691120))))

(declare-fun mapKey!48262 () (_ BitVec 32))

(declare-fun mapRest!48262 () (Array (_ BitVec 32) ValueCell!14751))

(declare-fun mapValue!48262 () ValueCell!14751)

(assert (=> mapNonEmpty!48262 (= mapRest!48256 (store mapRest!48262 mapKey!48262 mapValue!48262))))

(declare-fun condMapEmpty!48262 () Bool)

(declare-fun mapDefault!48262 () ValueCell!14751)

(assert (=> mapNonEmpty!48256 (= condMapEmpty!48262 (= mapRest!48256 ((as const (Array (_ BitVec 32) ValueCell!14751)) mapDefault!48262)))))

(assert (=> mapNonEmpty!48256 (= tp!91673 (and e!691121 mapRes!48262))))

(declare-fun b!1217339 () Bool)

(assert (=> b!1217339 (= e!691120 tp_is_empty!30921)))

(assert (= (and mapNonEmpty!48256 condMapEmpty!48262) mapIsEmpty!48262))

(assert (= (and mapNonEmpty!48256 (not condMapEmpty!48262)) mapNonEmpty!48262))

(assert (= (and mapNonEmpty!48262 ((_ is ValueCellFull!14751) mapValue!48262)) b!1217339))

(assert (= (and mapNonEmpty!48256 ((_ is ValueCellFull!14751) mapDefault!48262)) b!1217340))

(declare-fun m!1122101 () Bool)

(assert (=> mapNonEmpty!48262 m!1122101))

(declare-fun b_lambda!21917 () Bool)

(assert (= b_lambda!21903 (or (and start!101294 b_free!26217) b_lambda!21917)))

(declare-fun b_lambda!21919 () Bool)

(assert (= b_lambda!21911 (or (and start!101294 b_free!26217) b_lambda!21919)))

(declare-fun b_lambda!21921 () Bool)

(assert (= b_lambda!21899 (or (and start!101294 b_free!26217) b_lambda!21921)))

(declare-fun b_lambda!21923 () Bool)

(assert (= b_lambda!21907 (or (and start!101294 b_free!26217) b_lambda!21923)))

(declare-fun b_lambda!21925 () Bool)

(assert (= b_lambda!21913 (or (and start!101294 b_free!26217) b_lambda!21925)))

(declare-fun b_lambda!21927 () Bool)

(assert (= b_lambda!21901 (or (and start!101294 b_free!26217) b_lambda!21927)))

(declare-fun b_lambda!21929 () Bool)

(assert (= b_lambda!21915 (or (and start!101294 b_free!26217) b_lambda!21929)))

(declare-fun b_lambda!21931 () Bool)

(assert (= b_lambda!21909 (or (and start!101294 b_free!26217) b_lambda!21931)))

(declare-fun b_lambda!21933 () Bool)

(assert (= b_lambda!21905 (or (and start!101294 b_free!26217) b_lambda!21933)))

(check-sat (not b!1217278) (not b!1217287) (not b!1217239) (not b!1217319) (not b!1217225) (not bm!60606) (not b!1217244) (not b!1217312) (not b!1217315) (not bm!60621) tp_is_empty!30921 (not b!1217222) (not b_lambda!21917) (not b!1217317) (not b!1217332) (not b!1217302) (not b!1217308) (not b!1217325) (not bm!60610) (not b!1217280) (not b!1217276) (not b!1217243) (not b!1217261) (not b!1217324) (not d!133573) (not b!1217316) (not b!1217235) (not bm!60607) (not b_lambda!21921) b_and!43575 (not b!1217305) (not b!1217234) (not bm!60615) (not d!133575) (not b!1217307) (not bm!60623) (not b!1217226) (not d!133585) (not b!1217238) (not b!1217259) (not d!133569) (not d!133549) (not b!1217260) (not bm!60611) (not d!133581) (not bm!60614) (not d!133551) (not b!1217303) (not b!1217232) (not bm!60620) (not b_lambda!21927) (not b_lambda!21925) (not b_lambda!21897) (not bm!60622) (not b!1217293) (not b_lambda!21923) (not b!1217227) (not b!1217304) (not b!1217318) (not b_lambda!21929) (not b!1217224) (not b!1217306) (not b!1217264) (not b!1217320) (not b!1217237) (not b!1217256) (not mapNonEmpty!48262) (not b!1217274) (not b!1217236) (not b_lambda!21933) (not b!1217223) (not b_next!26217) (not d!133577) (not b!1217265) (not b!1217286) (not b!1217292) (not b!1217313) (not b_lambda!21931) (not b!1217231) (not b_lambda!21919))
(check-sat b_and!43575 (not b_next!26217))
