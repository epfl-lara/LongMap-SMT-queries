; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98758 () Bool)

(assert start!98758)

(declare-fun b_free!24127 () Bool)

(declare-fun b_next!24127 () Bool)

(assert (=> start!98758 (= b_free!24127 (not b_next!24127))))

(declare-fun tp!85091 () Bool)

(declare-fun b_and!39105 () Bool)

(assert (=> start!98758 (= tp!85091 b_and!39105)))

(declare-datatypes ((array!74215 0))(
  ( (array!74216 (arr!35752 (Array (_ BitVec 32) (_ BitVec 64))) (size!36289 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74215)

(declare-fun b!1142249 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!649967 () Bool)

(declare-fun arrayContainsKey!0 (array!74215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142249 (= e!649967 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!649966 () Bool)

(declare-fun b!1142251 () Bool)

(declare-datatypes ((V!43337 0))(
  ( (V!43338 (val!14385 Int)) )
))
(declare-datatypes ((tuple2!18208 0))(
  ( (tuple2!18209 (_1!9115 (_ BitVec 64)) (_2!9115 V!43337)) )
))
(declare-datatypes ((List!24970 0))(
  ( (Nil!24967) (Cons!24966 (h!26184 tuple2!18208) (t!36081 List!24970)) )
))
(declare-datatypes ((ListLongMap!16185 0))(
  ( (ListLongMap!16186 (toList!8108 List!24970)) )
))
(declare-fun call!51137 () ListLongMap!16185)

(declare-fun call!51136 () ListLongMap!16185)

(declare-fun -!1241 (ListLongMap!16185 (_ BitVec 64)) ListLongMap!16185)

(assert (=> b!1142251 (= e!649966 (= call!51136 (-!1241 call!51137 k0!934)))))

(declare-fun zeroValue!944 () V!43337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13619 0))(
  ( (ValueCellFull!13619 (v!17018 V!43337)) (EmptyCell!13619) )
))
(declare-datatypes ((array!74217 0))(
  ( (array!74218 (arr!35753 (Array (_ BitVec 32) ValueCell!13619)) (size!36290 (_ BitVec 32))) )
))
(declare-fun lt!508694 () array!74217)

(declare-fun bm!51128 () Bool)

(declare-fun lt!508676 () array!74215)

(declare-fun minValue!944 () V!43337)

(declare-fun getCurrentListMapNoExtraKeys!4616 (array!74215 array!74217 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 32) Int) ListLongMap!16185)

(assert (=> bm!51128 (= call!51136 (getCurrentListMapNoExtraKeys!4616 lt!508676 lt!508694 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142252 () Bool)

(declare-datatypes ((Unit!37400 0))(
  ( (Unit!37401) )
))
(declare-fun e!649963 () Unit!37400)

(declare-fun Unit!37402 () Unit!37400)

(assert (=> b!1142252 (= e!649963 Unit!37402)))

(declare-fun lt!508692 () Bool)

(assert (=> b!1142252 (= lt!508692 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112399 () Bool)

(assert (=> b!1142252 (= c!112399 (and (not lt!508692) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508679 () Unit!37400)

(declare-fun e!649969 () Unit!37400)

(assert (=> b!1142252 (= lt!508679 e!649969)))

(declare-fun lt!508687 () Unit!37400)

(declare-fun _values!996 () array!74217)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!389 (array!74215 array!74217 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 64) (_ BitVec 32) Int) Unit!37400)

(assert (=> b!1142252 (= lt!508687 (lemmaListMapContainsThenArrayContainsFrom!389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112400 () Bool)

(assert (=> b!1142252 (= c!112400 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761141 () Bool)

(assert (=> b!1142252 (= res!761141 e!649967)))

(declare-fun e!649961 () Bool)

(assert (=> b!1142252 (=> (not res!761141) (not e!649961))))

(assert (=> b!1142252 e!649961))

(declare-fun lt!508680 () Unit!37400)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74215 (_ BitVec 32) (_ BitVec 32)) Unit!37400)

(assert (=> b!1142252 (= lt!508680 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24971 0))(
  ( (Nil!24968) (Cons!24967 (h!26185 (_ BitVec 64)) (t!36082 List!24971)) )
))
(declare-fun arrayNoDuplicates!0 (array!74215 (_ BitVec 32) List!24971) Bool)

(assert (=> b!1142252 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24968)))

(declare-fun lt!508682 () Unit!37400)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74215 (_ BitVec 64) (_ BitVec 32) List!24971) Unit!37400)

(assert (=> b!1142252 (= lt!508682 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24968))))

(assert (=> b!1142252 false))

(declare-fun bm!51129 () Bool)

(declare-fun c!112403 () Bool)

(declare-fun lt!508689 () ListLongMap!16185)

(declare-fun call!51138 () ListLongMap!16185)

(declare-fun +!3556 (ListLongMap!16185 tuple2!18208) ListLongMap!16185)

(assert (=> bm!51129 (= call!51138 (+!3556 lt!508689 (ite (or c!112399 c!112403) (tuple2!18209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1142253 () Bool)

(assert (=> b!1142253 (= e!649961 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142254 () Bool)

(declare-fun e!649968 () Bool)

(declare-fun tp_is_empty!28657 () Bool)

(assert (=> b!1142254 (= e!649968 tp_is_empty!28657)))

(declare-fun b!1142255 () Bool)

(declare-fun res!761142 () Bool)

(declare-fun e!649965 () Bool)

(assert (=> b!1142255 (=> (not res!761142) (not e!649965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142255 (= res!761142 (validMask!0 mask!1564))))

(declare-fun bm!51130 () Bool)

(declare-fun call!51132 () Unit!37400)

(declare-fun addStillContains!783 (ListLongMap!16185 (_ BitVec 64) V!43337 (_ BitVec 64)) Unit!37400)

(assert (=> bm!51130 (= call!51132 (addStillContains!783 lt!508689 (ite (or c!112399 c!112403) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112399 c!112403) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1142256 () Bool)

(declare-fun res!761145 () Bool)

(assert (=> b!1142256 (=> (not res!761145) (not e!649965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74215 (_ BitVec 32)) Bool)

(assert (=> b!1142256 (= res!761145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142257 () Bool)

(declare-fun call!51133 () Bool)

(assert (=> b!1142257 call!51133))

(declare-fun lt!508685 () Unit!37400)

(declare-fun call!51135 () Unit!37400)

(assert (=> b!1142257 (= lt!508685 call!51135)))

(declare-fun e!649973 () Unit!37400)

(assert (=> b!1142257 (= e!649973 lt!508685)))

(declare-fun bm!51131 () Bool)

(declare-fun call!51134 () Bool)

(assert (=> bm!51131 (= call!51133 call!51134)))

(declare-fun b!1142258 () Bool)

(declare-fun e!649962 () Bool)

(assert (=> b!1142258 (= e!649962 true)))

(declare-fun lt!508696 () V!43337)

(assert (=> b!1142258 (= (-!1241 (+!3556 lt!508689 (tuple2!18209 (select (arr!35752 _keys!1208) from!1455) lt!508696)) (select (arr!35752 _keys!1208) from!1455)) lt!508689)))

(declare-fun lt!508684 () Unit!37400)

(declare-fun addThenRemoveForNewKeyIsSame!101 (ListLongMap!16185 (_ BitVec 64) V!43337) Unit!37400)

(assert (=> b!1142258 (= lt!508684 (addThenRemoveForNewKeyIsSame!101 lt!508689 (select (arr!35752 _keys!1208) from!1455) lt!508696))))

(declare-fun lt!508678 () V!43337)

(declare-fun get!18188 (ValueCell!13619 V!43337) V!43337)

(assert (=> b!1142258 (= lt!508696 (get!18188 (select (arr!35753 _values!996) from!1455) lt!508678))))

(declare-fun lt!508690 () Unit!37400)

(assert (=> b!1142258 (= lt!508690 e!649963)))

(declare-fun c!112404 () Bool)

(declare-fun contains!6654 (ListLongMap!16185 (_ BitVec 64)) Bool)

(assert (=> b!1142258 (= c!112404 (contains!6654 lt!508689 k0!934))))

(assert (=> b!1142258 (= lt!508689 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142259 () Bool)

(declare-fun e!649972 () Unit!37400)

(declare-fun lt!508677 () Unit!37400)

(assert (=> b!1142259 (= e!649972 lt!508677)))

(assert (=> b!1142259 (= lt!508677 call!51135)))

(assert (=> b!1142259 call!51133))

(declare-fun b!1142260 () Bool)

(declare-fun res!761139 () Bool)

(assert (=> b!1142260 (=> (not res!761139) (not e!649965))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142260 (= res!761139 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36289 _keys!1208))))))

(declare-fun mapIsEmpty!44810 () Bool)

(declare-fun mapRes!44810 () Bool)

(assert (=> mapIsEmpty!44810 mapRes!44810))

(declare-fun b!1142261 () Bool)

(declare-fun e!649964 () Bool)

(declare-fun e!649971 () Bool)

(assert (=> b!1142261 (= e!649964 e!649971)))

(declare-fun res!761138 () Bool)

(assert (=> b!1142261 (=> res!761138 e!649971)))

(assert (=> b!1142261 (= res!761138 (not (= from!1455 i!673)))))

(declare-fun lt!508683 () ListLongMap!16185)

(assert (=> b!1142261 (= lt!508683 (getCurrentListMapNoExtraKeys!4616 lt!508676 lt!508694 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142261 (= lt!508694 (array!74218 (store (arr!35753 _values!996) i!673 (ValueCellFull!13619 lt!508678)) (size!36290 _values!996)))))

(declare-fun dynLambda!2657 (Int (_ BitVec 64)) V!43337)

(assert (=> b!1142261 (= lt!508678 (dynLambda!2657 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508681 () ListLongMap!16185)

(assert (=> b!1142261 (= lt!508681 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142262 () Bool)

(declare-fun res!761144 () Bool)

(assert (=> b!1142262 (=> (not res!761144) (not e!649965))))

(assert (=> b!1142262 (= res!761144 (and (= (size!36290 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36289 _keys!1208) (size!36290 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51132 () Bool)

(assert (=> bm!51132 (= call!51137 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142263 () Bool)

(assert (=> b!1142263 (= c!112403 (and (not lt!508692) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1142263 (= e!649969 e!649972)))

(declare-fun b!1142264 () Bool)

(assert (=> b!1142264 (= e!649966 (= call!51136 call!51137))))

(declare-fun b!1142265 () Bool)

(declare-fun lt!508693 () ListLongMap!16185)

(assert (=> b!1142265 (contains!6654 (+!3556 lt!508693 (tuple2!18209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!508686 () Unit!37400)

(assert (=> b!1142265 (= lt!508686 (addStillContains!783 lt!508693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1142265 call!51134))

(assert (=> b!1142265 (= lt!508693 call!51138)))

(declare-fun lt!508691 () Unit!37400)

(assert (=> b!1142265 (= lt!508691 call!51132)))

(assert (=> b!1142265 (= e!649969 lt!508686)))

(declare-fun b!1142250 () Bool)

(declare-fun res!761146 () Bool)

(assert (=> b!1142250 (=> (not res!761146) (not e!649965))))

(assert (=> b!1142250 (= res!761146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24968))))

(declare-fun res!761148 () Bool)

(assert (=> start!98758 (=> (not res!761148) (not e!649965))))

(assert (=> start!98758 (= res!761148 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36289 _keys!1208))))))

(assert (=> start!98758 e!649965))

(assert (=> start!98758 tp_is_empty!28657))

(declare-fun array_inv!27454 (array!74215) Bool)

(assert (=> start!98758 (array_inv!27454 _keys!1208)))

(assert (=> start!98758 true))

(assert (=> start!98758 tp!85091))

(declare-fun e!649974 () Bool)

(declare-fun array_inv!27455 (array!74217) Bool)

(assert (=> start!98758 (and (array_inv!27455 _values!996) e!649974)))

(declare-fun b!1142266 () Bool)

(declare-fun e!649960 () Bool)

(assert (=> b!1142266 (= e!649960 (not e!649964))))

(declare-fun res!761151 () Bool)

(assert (=> b!1142266 (=> res!761151 e!649964)))

(assert (=> b!1142266 (= res!761151 (bvsgt from!1455 i!673))))

(assert (=> b!1142266 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508688 () Unit!37400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74215 (_ BitVec 64) (_ BitVec 32)) Unit!37400)

(assert (=> b!1142266 (= lt!508688 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1142267 () Bool)

(declare-fun e!649975 () Bool)

(assert (=> b!1142267 (= e!649975 tp_is_empty!28657)))

(declare-fun mapNonEmpty!44810 () Bool)

(declare-fun tp!85092 () Bool)

(assert (=> mapNonEmpty!44810 (= mapRes!44810 (and tp!85092 e!649975))))

(declare-fun mapKey!44810 () (_ BitVec 32))

(declare-fun mapValue!44810 () ValueCell!13619)

(declare-fun mapRest!44810 () (Array (_ BitVec 32) ValueCell!13619))

(assert (=> mapNonEmpty!44810 (= (arr!35753 _values!996) (store mapRest!44810 mapKey!44810 mapValue!44810))))

(declare-fun bm!51133 () Bool)

(declare-fun call!51131 () ListLongMap!16185)

(assert (=> bm!51133 (= call!51134 (contains!6654 (ite c!112399 lt!508693 call!51131) k0!934))))

(declare-fun b!1142268 () Bool)

(assert (=> b!1142268 (= e!649967 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508692) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142269 () Bool)

(declare-fun Unit!37403 () Unit!37400)

(assert (=> b!1142269 (= e!649973 Unit!37403)))

(declare-fun b!1142270 () Bool)

(declare-fun res!761149 () Bool)

(assert (=> b!1142270 (=> (not res!761149) (not e!649965))))

(assert (=> b!1142270 (= res!761149 (= (select (arr!35752 _keys!1208) i!673) k0!934))))

(declare-fun b!1142271 () Bool)

(declare-fun res!761140 () Bool)

(assert (=> b!1142271 (=> (not res!761140) (not e!649965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142271 (= res!761140 (validKeyInArray!0 k0!934))))

(declare-fun b!1142272 () Bool)

(assert (=> b!1142272 (= e!649965 e!649960)))

(declare-fun res!761147 () Bool)

(assert (=> b!1142272 (=> (not res!761147) (not e!649960))))

(assert (=> b!1142272 (= res!761147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508676 mask!1564))))

(assert (=> b!1142272 (= lt!508676 (array!74216 (store (arr!35752 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36289 _keys!1208)))))

(declare-fun bm!51134 () Bool)

(assert (=> bm!51134 (= call!51135 call!51132)))

(declare-fun b!1142273 () Bool)

(declare-fun Unit!37404 () Unit!37400)

(assert (=> b!1142273 (= e!649963 Unit!37404)))

(declare-fun b!1142274 () Bool)

(assert (=> b!1142274 (= e!649974 (and e!649968 mapRes!44810))))

(declare-fun condMapEmpty!44810 () Bool)

(declare-fun mapDefault!44810 () ValueCell!13619)

(assert (=> b!1142274 (= condMapEmpty!44810 (= (arr!35753 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13619)) mapDefault!44810)))))

(declare-fun b!1142275 () Bool)

(declare-fun res!761150 () Bool)

(assert (=> b!1142275 (=> (not res!761150) (not e!649960))))

(assert (=> b!1142275 (= res!761150 (arrayNoDuplicates!0 lt!508676 #b00000000000000000000000000000000 Nil!24968))))

(declare-fun bm!51135 () Bool)

(assert (=> bm!51135 (= call!51131 call!51138)))

(declare-fun b!1142276 () Bool)

(assert (=> b!1142276 (= e!649971 e!649962)))

(declare-fun res!761143 () Bool)

(assert (=> b!1142276 (=> res!761143 e!649962)))

(assert (=> b!1142276 (= res!761143 (not (= (select (arr!35752 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142276 e!649966))

(declare-fun c!112401 () Bool)

(assert (=> b!1142276 (= c!112401 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508695 () Unit!37400)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!497 (array!74215 array!74217 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37400)

(assert (=> b!1142276 (= lt!508695 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142277 () Bool)

(assert (=> b!1142277 (= e!649972 e!649973)))

(declare-fun c!112402 () Bool)

(assert (=> b!1142277 (= c!112402 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508692))))

(assert (= (and start!98758 res!761148) b!1142255))

(assert (= (and b!1142255 res!761142) b!1142262))

(assert (= (and b!1142262 res!761144) b!1142256))

(assert (= (and b!1142256 res!761145) b!1142250))

(assert (= (and b!1142250 res!761146) b!1142260))

(assert (= (and b!1142260 res!761139) b!1142271))

(assert (= (and b!1142271 res!761140) b!1142270))

(assert (= (and b!1142270 res!761149) b!1142272))

(assert (= (and b!1142272 res!761147) b!1142275))

(assert (= (and b!1142275 res!761150) b!1142266))

(assert (= (and b!1142266 (not res!761151)) b!1142261))

(assert (= (and b!1142261 (not res!761138)) b!1142276))

(assert (= (and b!1142276 c!112401) b!1142251))

(assert (= (and b!1142276 (not c!112401)) b!1142264))

(assert (= (or b!1142251 b!1142264) bm!51128))

(assert (= (or b!1142251 b!1142264) bm!51132))

(assert (= (and b!1142276 (not res!761143)) b!1142258))

(assert (= (and b!1142258 c!112404) b!1142252))

(assert (= (and b!1142258 (not c!112404)) b!1142273))

(assert (= (and b!1142252 c!112399) b!1142265))

(assert (= (and b!1142252 (not c!112399)) b!1142263))

(assert (= (and b!1142263 c!112403) b!1142259))

(assert (= (and b!1142263 (not c!112403)) b!1142277))

(assert (= (and b!1142277 c!112402) b!1142257))

(assert (= (and b!1142277 (not c!112402)) b!1142269))

(assert (= (or b!1142259 b!1142257) bm!51134))

(assert (= (or b!1142259 b!1142257) bm!51135))

(assert (= (or b!1142259 b!1142257) bm!51131))

(assert (= (or b!1142265 bm!51131) bm!51133))

(assert (= (or b!1142265 bm!51134) bm!51130))

(assert (= (or b!1142265 bm!51135) bm!51129))

(assert (= (and b!1142252 c!112400) b!1142249))

(assert (= (and b!1142252 (not c!112400)) b!1142268))

(assert (= (and b!1142252 res!761141) b!1142253))

(assert (= (and b!1142274 condMapEmpty!44810) mapIsEmpty!44810))

(assert (= (and b!1142274 (not condMapEmpty!44810)) mapNonEmpty!44810))

(get-info :version)

(assert (= (and mapNonEmpty!44810 ((_ is ValueCellFull!13619) mapValue!44810)) b!1142267))

(assert (= (and b!1142274 ((_ is ValueCellFull!13619) mapDefault!44810)) b!1142254))

(assert (= start!98758 b!1142274))

(declare-fun b_lambda!19227 () Bool)

(assert (=> (not b_lambda!19227) (not b!1142261)))

(declare-fun t!36080 () Bool)

(declare-fun tb!8931 () Bool)

(assert (=> (and start!98758 (= defaultEntry!1004 defaultEntry!1004) t!36080) tb!8931))

(declare-fun result!18435 () Bool)

(assert (=> tb!8931 (= result!18435 tp_is_empty!28657)))

(assert (=> b!1142261 t!36080))

(declare-fun b_and!39107 () Bool)

(assert (= b_and!39105 (and (=> t!36080 result!18435) b_and!39107)))

(declare-fun m!1053983 () Bool)

(assert (=> bm!51132 m!1053983))

(declare-fun m!1053985 () Bool)

(assert (=> b!1142270 m!1053985))

(declare-fun m!1053987 () Bool)

(assert (=> b!1142276 m!1053987))

(declare-fun m!1053989 () Bool)

(assert (=> b!1142276 m!1053989))

(declare-fun m!1053991 () Bool)

(assert (=> bm!51130 m!1053991))

(declare-fun m!1053993 () Bool)

(assert (=> b!1142266 m!1053993))

(declare-fun m!1053995 () Bool)

(assert (=> b!1142266 m!1053995))

(declare-fun m!1053997 () Bool)

(assert (=> b!1142250 m!1053997))

(declare-fun m!1053999 () Bool)

(assert (=> bm!51129 m!1053999))

(declare-fun m!1054001 () Bool)

(assert (=> b!1142256 m!1054001))

(assert (=> b!1142258 m!1053983))

(assert (=> b!1142258 m!1053987))

(declare-fun m!1054003 () Bool)

(assert (=> b!1142258 m!1054003))

(declare-fun m!1054005 () Bool)

(assert (=> b!1142258 m!1054005))

(declare-fun m!1054007 () Bool)

(assert (=> b!1142258 m!1054007))

(assert (=> b!1142258 m!1053987))

(declare-fun m!1054009 () Bool)

(assert (=> b!1142258 m!1054009))

(assert (=> b!1142258 m!1054005))

(declare-fun m!1054011 () Bool)

(assert (=> b!1142258 m!1054011))

(declare-fun m!1054013 () Bool)

(assert (=> b!1142258 m!1054013))

(assert (=> b!1142258 m!1054007))

(assert (=> b!1142258 m!1053987))

(declare-fun m!1054015 () Bool)

(assert (=> bm!51128 m!1054015))

(declare-fun m!1054017 () Bool)

(assert (=> b!1142271 m!1054017))

(declare-fun m!1054019 () Bool)

(assert (=> b!1142252 m!1054019))

(declare-fun m!1054021 () Bool)

(assert (=> b!1142252 m!1054021))

(declare-fun m!1054023 () Bool)

(assert (=> b!1142252 m!1054023))

(declare-fun m!1054025 () Bool)

(assert (=> b!1142252 m!1054025))

(declare-fun m!1054027 () Bool)

(assert (=> b!1142251 m!1054027))

(declare-fun m!1054029 () Bool)

(assert (=> b!1142272 m!1054029))

(declare-fun m!1054031 () Bool)

(assert (=> b!1142272 m!1054031))

(declare-fun m!1054033 () Bool)

(assert (=> b!1142253 m!1054033))

(declare-fun m!1054035 () Bool)

(assert (=> b!1142265 m!1054035))

(assert (=> b!1142265 m!1054035))

(declare-fun m!1054037 () Bool)

(assert (=> b!1142265 m!1054037))

(declare-fun m!1054039 () Bool)

(assert (=> b!1142265 m!1054039))

(assert (=> b!1142249 m!1054033))

(declare-fun m!1054041 () Bool)

(assert (=> b!1142275 m!1054041))

(declare-fun m!1054043 () Bool)

(assert (=> b!1142255 m!1054043))

(declare-fun m!1054045 () Bool)

(assert (=> start!98758 m!1054045))

(declare-fun m!1054047 () Bool)

(assert (=> start!98758 m!1054047))

(declare-fun m!1054049 () Bool)

(assert (=> b!1142261 m!1054049))

(declare-fun m!1054051 () Bool)

(assert (=> b!1142261 m!1054051))

(declare-fun m!1054053 () Bool)

(assert (=> b!1142261 m!1054053))

(declare-fun m!1054055 () Bool)

(assert (=> b!1142261 m!1054055))

(declare-fun m!1054057 () Bool)

(assert (=> bm!51133 m!1054057))

(declare-fun m!1054059 () Bool)

(assert (=> mapNonEmpty!44810 m!1054059))

(check-sat (not b!1142249) (not bm!51130) (not b!1142250) (not b!1142272) b_and!39107 (not b!1142261) (not b!1142251) (not b!1142276) (not b!1142258) (not b_lambda!19227) (not start!98758) (not bm!51133) (not b!1142271) (not b!1142252) (not bm!51132) (not mapNonEmpty!44810) (not b_next!24127) (not bm!51128) (not b!1142275) tp_is_empty!28657 (not b!1142266) (not b!1142256) (not bm!51129) (not b!1142265) (not b!1142253) (not b!1142255))
(check-sat b_and!39107 (not b_next!24127))
