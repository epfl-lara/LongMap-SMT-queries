; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97522 () Bool)

(assert start!97522)

(declare-fun b_free!23257 () Bool)

(declare-fun b_next!23257 () Bool)

(assert (=> start!97522 (= b_free!23257 (not b_next!23257))))

(declare-fun tp!82069 () Bool)

(declare-fun b_and!37357 () Bool)

(assert (=> start!97522 (= tp!82069 b_and!37357)))

(declare-fun b!1109134 () Bool)

(declare-fun res!739830 () Bool)

(declare-fun e!632879 () Bool)

(assert (=> b!1109134 (=> (not res!739830) (not e!632879))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41817 0))(
  ( (V!41818 (val!13815 Int)) )
))
(declare-datatypes ((ValueCell!13049 0))(
  ( (ValueCellFull!13049 (v!16444 V!41817)) (EmptyCell!13049) )
))
(declare-datatypes ((array!71985 0))(
  ( (array!71986 (arr!34639 (Array (_ BitVec 32) ValueCell!13049)) (size!35176 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71985)

(declare-datatypes ((array!71987 0))(
  ( (array!71988 (arr!34640 (Array (_ BitVec 32) (_ BitVec 64))) (size!35177 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71987)

(assert (=> b!1109134 (= res!739830 (and (= (size!35176 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35177 _keys!1208) (size!35176 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109135 () Bool)

(declare-fun e!632880 () Bool)

(declare-fun tp_is_empty!27517 () Bool)

(assert (=> b!1109135 (= e!632880 tp_is_empty!27517)))

(declare-datatypes ((tuple2!17466 0))(
  ( (tuple2!17467 (_1!8744 (_ BitVec 64)) (_2!8744 V!41817)) )
))
(declare-datatypes ((List!24153 0))(
  ( (Nil!24150) (Cons!24149 (h!25367 tuple2!17466) (t!34448 List!24153)) )
))
(declare-datatypes ((ListLongMap!15443 0))(
  ( (ListLongMap!15444 (toList!7737 List!24153)) )
))
(declare-fun call!46534 () ListLongMap!15443)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!632885 () Bool)

(declare-fun b!1109136 () Bool)

(declare-fun call!46535 () ListLongMap!15443)

(declare-fun -!996 (ListLongMap!15443 (_ BitVec 64)) ListLongMap!15443)

(assert (=> b!1109136 (= e!632885 (= call!46534 (-!996 call!46535 k0!934)))))

(declare-fun zeroValue!944 () V!41817)

(declare-fun lt!496208 () array!71987)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46531 () Bool)

(declare-fun minValue!944 () V!41817)

(declare-fun getCurrentListMapNoExtraKeys!4273 (array!71987 array!71985 (_ BitVec 32) (_ BitVec 32) V!41817 V!41817 (_ BitVec 32) Int) ListLongMap!15443)

(declare-fun dynLambda!2389 (Int (_ BitVec 64)) V!41817)

(assert (=> bm!46531 (= call!46534 (getCurrentListMapNoExtraKeys!4273 lt!496208 (array!71986 (store (arr!34639 _values!996) i!673 (ValueCellFull!13049 (dynLambda!2389 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35176 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739835 () Bool)

(assert (=> start!97522 (=> (not res!739835) (not e!632879))))

(assert (=> start!97522 (= res!739835 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35177 _keys!1208))))))

(assert (=> start!97522 e!632879))

(assert (=> start!97522 tp_is_empty!27517))

(declare-fun array_inv!26688 (array!71987) Bool)

(assert (=> start!97522 (array_inv!26688 _keys!1208)))

(assert (=> start!97522 true))

(assert (=> start!97522 tp!82069))

(declare-fun e!632884 () Bool)

(declare-fun array_inv!26689 (array!71985) Bool)

(assert (=> start!97522 (and (array_inv!26689 _values!996) e!632884)))

(declare-fun b!1109137 () Bool)

(declare-fun res!739831 () Bool)

(assert (=> b!1109137 (=> (not res!739831) (not e!632879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109137 (= res!739831 (validMask!0 mask!1564))))

(declare-fun b!1109138 () Bool)

(declare-fun res!739833 () Bool)

(assert (=> b!1109138 (=> (not res!739833) (not e!632879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109138 (= res!739833 (validKeyInArray!0 k0!934))))

(declare-fun bm!46532 () Bool)

(assert (=> bm!46532 (= call!46535 (getCurrentListMapNoExtraKeys!4273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109139 () Bool)

(declare-fun res!739829 () Bool)

(assert (=> b!1109139 (=> (not res!739829) (not e!632879))))

(assert (=> b!1109139 (= res!739829 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35177 _keys!1208))))))

(declare-fun b!1109140 () Bool)

(declare-fun e!632881 () Bool)

(assert (=> b!1109140 (= e!632879 e!632881)))

(declare-fun res!739834 () Bool)

(assert (=> b!1109140 (=> (not res!739834) (not e!632881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71987 (_ BitVec 32)) Bool)

(assert (=> b!1109140 (= res!739834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496208 mask!1564))))

(assert (=> b!1109140 (= lt!496208 (array!71988 (store (arr!34640 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35177 _keys!1208)))))

(declare-fun b!1109141 () Bool)

(declare-fun e!632886 () Bool)

(assert (=> b!1109141 (= e!632886 tp_is_empty!27517)))

(declare-fun b!1109142 () Bool)

(declare-fun res!739828 () Bool)

(assert (=> b!1109142 (=> (not res!739828) (not e!632881))))

(declare-datatypes ((List!24154 0))(
  ( (Nil!24151) (Cons!24150 (h!25368 (_ BitVec 64)) (t!34449 List!24154)) )
))
(declare-fun arrayNoDuplicates!0 (array!71987 (_ BitVec 32) List!24154) Bool)

(assert (=> b!1109142 (= res!739828 (arrayNoDuplicates!0 lt!496208 #b00000000000000000000000000000000 Nil!24151))))

(declare-fun b!1109143 () Bool)

(declare-fun res!739827 () Bool)

(assert (=> b!1109143 (=> (not res!739827) (not e!632879))))

(assert (=> b!1109143 (= res!739827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109144 () Bool)

(declare-fun res!739837 () Bool)

(assert (=> b!1109144 (=> (not res!739837) (not e!632879))))

(assert (=> b!1109144 (= res!739837 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24151))))

(declare-fun b!1109145 () Bool)

(declare-fun mapRes!43093 () Bool)

(assert (=> b!1109145 (= e!632884 (and e!632886 mapRes!43093))))

(declare-fun condMapEmpty!43093 () Bool)

(declare-fun mapDefault!43093 () ValueCell!13049)

(assert (=> b!1109145 (= condMapEmpty!43093 (= (arr!34639 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13049)) mapDefault!43093)))))

(declare-fun b!1109146 () Bool)

(declare-fun e!632883 () Bool)

(assert (=> b!1109146 (= e!632883 true)))

(assert (=> b!1109146 e!632885))

(declare-fun c!109481 () Bool)

(assert (=> b!1109146 (= c!109481 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36335 0))(
  ( (Unit!36336) )
))
(declare-fun lt!496210 () Unit!36335)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!265 (array!71987 array!71985 (_ BitVec 32) (_ BitVec 32) V!41817 V!41817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36335)

(assert (=> b!1109146 (= lt!496210 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43093 () Bool)

(declare-fun tp!82070 () Bool)

(assert (=> mapNonEmpty!43093 (= mapRes!43093 (and tp!82070 e!632880))))

(declare-fun mapKey!43093 () (_ BitVec 32))

(declare-fun mapValue!43093 () ValueCell!13049)

(declare-fun mapRest!43093 () (Array (_ BitVec 32) ValueCell!13049))

(assert (=> mapNonEmpty!43093 (= (arr!34639 _values!996) (store mapRest!43093 mapKey!43093 mapValue!43093))))

(declare-fun b!1109147 () Bool)

(declare-fun res!739832 () Bool)

(assert (=> b!1109147 (=> (not res!739832) (not e!632879))))

(assert (=> b!1109147 (= res!739832 (= (select (arr!34640 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43093 () Bool)

(assert (=> mapIsEmpty!43093 mapRes!43093))

(declare-fun b!1109148 () Bool)

(assert (=> b!1109148 (= e!632881 (not e!632883))))

(declare-fun res!739836 () Bool)

(assert (=> b!1109148 (=> res!739836 e!632883)))

(assert (=> b!1109148 (= res!739836 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35177 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109148 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496209 () Unit!36335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71987 (_ BitVec 64) (_ BitVec 32)) Unit!36335)

(assert (=> b!1109148 (= lt!496209 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109149 () Bool)

(assert (=> b!1109149 (= e!632885 (= call!46534 call!46535))))

(assert (= (and start!97522 res!739835) b!1109137))

(assert (= (and b!1109137 res!739831) b!1109134))

(assert (= (and b!1109134 res!739830) b!1109143))

(assert (= (and b!1109143 res!739827) b!1109144))

(assert (= (and b!1109144 res!739837) b!1109139))

(assert (= (and b!1109139 res!739829) b!1109138))

(assert (= (and b!1109138 res!739833) b!1109147))

(assert (= (and b!1109147 res!739832) b!1109140))

(assert (= (and b!1109140 res!739834) b!1109142))

(assert (= (and b!1109142 res!739828) b!1109148))

(assert (= (and b!1109148 (not res!739836)) b!1109146))

(assert (= (and b!1109146 c!109481) b!1109136))

(assert (= (and b!1109146 (not c!109481)) b!1109149))

(assert (= (or b!1109136 b!1109149) bm!46531))

(assert (= (or b!1109136 b!1109149) bm!46532))

(assert (= (and b!1109145 condMapEmpty!43093) mapIsEmpty!43093))

(assert (= (and b!1109145 (not condMapEmpty!43093)) mapNonEmpty!43093))

(get-info :version)

(assert (= (and mapNonEmpty!43093 ((_ is ValueCellFull!13049) mapValue!43093)) b!1109135))

(assert (= (and b!1109145 ((_ is ValueCellFull!13049) mapDefault!43093)) b!1109141))

(assert (= start!97522 b!1109145))

(declare-fun b_lambda!18287 () Bool)

(assert (=> (not b_lambda!18287) (not bm!46531)))

(declare-fun t!34447 () Bool)

(declare-fun tb!8115 () Bool)

(assert (=> (and start!97522 (= defaultEntry!1004 defaultEntry!1004) t!34447) tb!8115))

(declare-fun result!16799 () Bool)

(assert (=> tb!8115 (= result!16799 tp_is_empty!27517)))

(assert (=> bm!46531 t!34447))

(declare-fun b_and!37359 () Bool)

(assert (= b_and!37357 (and (=> t!34447 result!16799) b_and!37359)))

(declare-fun m!1028157 () Bool)

(assert (=> bm!46531 m!1028157))

(declare-fun m!1028159 () Bool)

(assert (=> bm!46531 m!1028159))

(declare-fun m!1028161 () Bool)

(assert (=> bm!46531 m!1028161))

(declare-fun m!1028163 () Bool)

(assert (=> b!1109143 m!1028163))

(declare-fun m!1028165 () Bool)

(assert (=> b!1109146 m!1028165))

(declare-fun m!1028167 () Bool)

(assert (=> start!97522 m!1028167))

(declare-fun m!1028169 () Bool)

(assert (=> start!97522 m!1028169))

(declare-fun m!1028171 () Bool)

(assert (=> b!1109144 m!1028171))

(declare-fun m!1028173 () Bool)

(assert (=> bm!46532 m!1028173))

(declare-fun m!1028175 () Bool)

(assert (=> mapNonEmpty!43093 m!1028175))

(declare-fun m!1028177 () Bool)

(assert (=> b!1109140 m!1028177))

(declare-fun m!1028179 () Bool)

(assert (=> b!1109140 m!1028179))

(declare-fun m!1028181 () Bool)

(assert (=> b!1109137 m!1028181))

(declare-fun m!1028183 () Bool)

(assert (=> b!1109142 m!1028183))

(declare-fun m!1028185 () Bool)

(assert (=> b!1109147 m!1028185))

(declare-fun m!1028187 () Bool)

(assert (=> b!1109136 m!1028187))

(declare-fun m!1028189 () Bool)

(assert (=> b!1109138 m!1028189))

(declare-fun m!1028191 () Bool)

(assert (=> b!1109148 m!1028191))

(declare-fun m!1028193 () Bool)

(assert (=> b!1109148 m!1028193))

(check-sat (not bm!46532) (not mapNonEmpty!43093) (not b!1109140) (not b_lambda!18287) (not b!1109146) (not b_next!23257) (not b!1109136) (not b!1109143) (not bm!46531) (not b!1109137) (not b!1109148) (not b!1109142) (not start!97522) (not b!1109138) (not b!1109144) b_and!37359 tp_is_empty!27517)
(check-sat b_and!37359 (not b_next!23257))
