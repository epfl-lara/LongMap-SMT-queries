; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98726 () Bool)

(assert start!98726)

(declare-fun b_free!24331 () Bool)

(declare-fun b_next!24331 () Bool)

(assert (=> start!98726 (= b_free!24331 (not b_next!24331))))

(declare-fun tp!85704 () Bool)

(declare-fun b_and!39511 () Bool)

(assert (=> start!98726 (= tp!85704 b_and!39511)))

(declare-fun b!1150238 () Bool)

(declare-fun e!654239 () Bool)

(declare-fun e!654232 () Bool)

(assert (=> b!1150238 (= e!654239 e!654232)))

(declare-fun res!765127 () Bool)

(assert (=> b!1150238 (=> res!765127 e!654232)))

(declare-datatypes ((array!74569 0))(
  ( (array!74570 (arr!35935 (Array (_ BitVec 32) (_ BitVec 64))) (size!36471 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74569)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1150238 (= res!765127 (not (= (select (arr!35935 _keys!1208) from!1455) k!934)))))

(declare-fun e!654233 () Bool)

(assert (=> b!1150238 e!654233))

(declare-fun c!113839 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150238 (= c!113839 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43609 0))(
  ( (V!43610 (val!14487 Int)) )
))
(declare-fun zeroValue!944 () V!43609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13721 0))(
  ( (ValueCellFull!13721 (v!17124 V!43609)) (EmptyCell!13721) )
))
(declare-datatypes ((array!74571 0))(
  ( (array!74572 (arr!35936 (Array (_ BitVec 32) ValueCell!13721)) (size!36472 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74571)

(declare-fun minValue!944 () V!43609)

(declare-datatypes ((Unit!37821 0))(
  ( (Unit!37822) )
))
(declare-fun lt!514675 () Unit!37821)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!563 (array!74569 array!74571 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37821)

(assert (=> b!1150238 (= lt!514675 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150239 () Bool)

(declare-fun e!654228 () Unit!37821)

(declare-fun e!654224 () Unit!37821)

(assert (=> b!1150239 (= e!654228 e!654224)))

(declare-fun c!113841 () Bool)

(declare-fun lt!514656 () Bool)

(assert (=> b!1150239 (= c!113841 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514656))))

(declare-datatypes ((tuple2!18386 0))(
  ( (tuple2!18387 (_1!9204 (_ BitVec 64)) (_2!9204 V!43609)) )
))
(declare-datatypes ((List!25135 0))(
  ( (Nil!25132) (Cons!25131 (h!26340 tuple2!18386) (t!36458 List!25135)) )
))
(declare-datatypes ((ListLongMap!16355 0))(
  ( (ListLongMap!16356 (toList!8193 List!25135)) )
))
(declare-fun call!53514 () ListLongMap!16355)

(declare-fun lt!514677 () array!74569)

(declare-fun lt!514663 () array!74571)

(declare-fun bm!53511 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4665 (array!74569 array!74571 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 32) Int) ListLongMap!16355)

(assert (=> bm!53511 (= call!53514 (getCurrentListMapNoExtraKeys!4665 lt!514677 lt!514663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150240 () Bool)

(declare-fun res!765120 () Bool)

(declare-fun e!654231 () Bool)

(assert (=> b!1150240 (=> (not res!765120) (not e!654231))))

(assert (=> b!1150240 (= res!765120 (and (= (size!36472 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36471 _keys!1208) (size!36472 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150241 () Bool)

(declare-fun e!654229 () Bool)

(declare-fun arrayContainsKey!0 (array!74569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150241 (= e!654229 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150242 () Bool)

(declare-fun call!53518 () ListLongMap!16355)

(declare-fun -!1325 (ListLongMap!16355 (_ BitVec 64)) ListLongMap!16355)

(assert (=> b!1150242 (= e!654233 (= call!53514 (-!1325 call!53518 k!934)))))

(declare-fun b!1150243 () Bool)

(assert (=> b!1150243 (= e!654232 true)))

(declare-fun e!654235 () Bool)

(assert (=> b!1150243 e!654235))

(declare-fun res!765122 () Bool)

(assert (=> b!1150243 (=> (not res!765122) (not e!654235))))

(declare-fun lt!514660 () ListLongMap!16355)

(declare-fun lt!514673 () ListLongMap!16355)

(assert (=> b!1150243 (= res!765122 (= lt!514660 lt!514673))))

(declare-fun lt!514657 () ListLongMap!16355)

(assert (=> b!1150243 (= lt!514660 (-!1325 lt!514657 k!934))))

(declare-fun lt!514668 () V!43609)

(declare-fun +!3613 (ListLongMap!16355 tuple2!18386) ListLongMap!16355)

(assert (=> b!1150243 (= (-!1325 (+!3613 lt!514673 (tuple2!18387 (select (arr!35935 _keys!1208) from!1455) lt!514668)) (select (arr!35935 _keys!1208) from!1455)) lt!514673)))

(declare-fun lt!514667 () Unit!37821)

(declare-fun addThenRemoveForNewKeyIsSame!169 (ListLongMap!16355 (_ BitVec 64) V!43609) Unit!37821)

(assert (=> b!1150243 (= lt!514667 (addThenRemoveForNewKeyIsSame!169 lt!514673 (select (arr!35935 _keys!1208) from!1455) lt!514668))))

(declare-fun lt!514661 () V!43609)

(declare-fun get!18293 (ValueCell!13721 V!43609) V!43609)

(assert (=> b!1150243 (= lt!514668 (get!18293 (select (arr!35936 _values!996) from!1455) lt!514661))))

(declare-fun lt!514665 () Unit!37821)

(declare-fun e!654234 () Unit!37821)

(assert (=> b!1150243 (= lt!514665 e!654234)))

(declare-fun c!113837 () Bool)

(declare-fun contains!6714 (ListLongMap!16355 (_ BitVec 64)) Bool)

(assert (=> b!1150243 (= c!113837 (contains!6714 lt!514673 k!934))))

(assert (=> b!1150243 (= lt!514673 (getCurrentListMapNoExtraKeys!4665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150244 () Bool)

(declare-fun Unit!37823 () Unit!37821)

(assert (=> b!1150244 (= e!654234 Unit!37823)))

(declare-fun b!1150245 () Bool)

(declare-fun call!53519 () Bool)

(assert (=> b!1150245 call!53519))

(declare-fun lt!514664 () Unit!37821)

(declare-fun call!53515 () Unit!37821)

(assert (=> b!1150245 (= lt!514664 call!53515)))

(assert (=> b!1150245 (= e!654224 lt!514664)))

(declare-fun bm!53512 () Bool)

(assert (=> bm!53512 (= call!53518 (getCurrentListMapNoExtraKeys!4665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150246 () Bool)

(declare-fun e!654240 () Bool)

(declare-fun tp_is_empty!28861 () Bool)

(assert (=> b!1150246 (= e!654240 tp_is_empty!28861)))

(declare-fun b!1150247 () Bool)

(declare-fun res!765115 () Bool)

(assert (=> b!1150247 (=> (not res!765115) (not e!654231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150247 (= res!765115 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45116 () Bool)

(declare-fun mapRes!45116 () Bool)

(declare-fun tp!85703 () Bool)

(declare-fun e!654237 () Bool)

(assert (=> mapNonEmpty!45116 (= mapRes!45116 (and tp!85703 e!654237))))

(declare-fun mapKey!45116 () (_ BitVec 32))

(declare-fun mapRest!45116 () (Array (_ BitVec 32) ValueCell!13721))

(declare-fun mapValue!45116 () ValueCell!13721)

(assert (=> mapNonEmpty!45116 (= (arr!35936 _values!996) (store mapRest!45116 mapKey!45116 mapValue!45116))))

(declare-fun b!1150248 () Bool)

(declare-fun e!654226 () Bool)

(assert (=> b!1150248 (= e!654226 e!654239)))

(declare-fun res!765117 () Bool)

(assert (=> b!1150248 (=> res!765117 e!654239)))

(assert (=> b!1150248 (= res!765117 (not (= from!1455 i!673)))))

(declare-fun lt!514674 () ListLongMap!16355)

(assert (=> b!1150248 (= lt!514674 (getCurrentListMapNoExtraKeys!4665 lt!514677 lt!514663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150248 (= lt!514663 (array!74572 (store (arr!35936 _values!996) i!673 (ValueCellFull!13721 lt!514661)) (size!36472 _values!996)))))

(declare-fun dynLambda!2689 (Int (_ BitVec 64)) V!43609)

(assert (=> b!1150248 (= lt!514661 (dynLambda!2689 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150248 (= lt!514657 (getCurrentListMapNoExtraKeys!4665 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150249 () Bool)

(declare-fun res!765114 () Bool)

(assert (=> b!1150249 (=> (not res!765114) (not e!654231))))

(assert (=> b!1150249 (= res!765114 (= (select (arr!35935 _keys!1208) i!673) k!934))))

(declare-fun b!1150250 () Bool)

(declare-fun res!765123 () Bool)

(assert (=> b!1150250 (=> (not res!765123) (not e!654231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74569 (_ BitVec 32)) Bool)

(assert (=> b!1150250 (= res!765123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150251 () Bool)

(declare-fun Unit!37824 () Unit!37821)

(assert (=> b!1150251 (= e!654234 Unit!37824)))

(assert (=> b!1150251 (= lt!514656 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113840 () Bool)

(assert (=> b!1150251 (= c!113840 (and (not lt!514656) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514669 () Unit!37821)

(declare-fun e!654236 () Unit!37821)

(assert (=> b!1150251 (= lt!514669 e!654236)))

(declare-fun lt!514666 () Unit!37821)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!455 (array!74569 array!74571 (_ BitVec 32) (_ BitVec 32) V!43609 V!43609 (_ BitVec 64) (_ BitVec 32) Int) Unit!37821)

(assert (=> b!1150251 (= lt!514666 (lemmaListMapContainsThenArrayContainsFrom!455 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113838 () Bool)

(assert (=> b!1150251 (= c!113838 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765124 () Bool)

(declare-fun e!654238 () Bool)

(assert (=> b!1150251 (= res!765124 e!654238)))

(assert (=> b!1150251 (=> (not res!765124) (not e!654229))))

(assert (=> b!1150251 e!654229))

(declare-fun lt!514662 () Unit!37821)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74569 (_ BitVec 32) (_ BitVec 32)) Unit!37821)

(assert (=> b!1150251 (= lt!514662 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25136 0))(
  ( (Nil!25133) (Cons!25132 (h!26341 (_ BitVec 64)) (t!36459 List!25136)) )
))
(declare-fun arrayNoDuplicates!0 (array!74569 (_ BitVec 32) List!25136) Bool)

(assert (=> b!1150251 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25133)))

(declare-fun lt!514676 () Unit!37821)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74569 (_ BitVec 64) (_ BitVec 32) List!25136) Unit!37821)

(assert (=> b!1150251 (= lt!514676 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25133))))

(assert (=> b!1150251 false))

(declare-fun b!1150252 () Bool)

(declare-fun lt!514671 () Unit!37821)

(assert (=> b!1150252 (= e!654228 lt!514671)))

(assert (=> b!1150252 (= lt!514671 call!53515)))

(assert (=> b!1150252 call!53519))

(declare-fun b!1150253 () Bool)

(declare-fun res!765126 () Bool)

(assert (=> b!1150253 (=> (not res!765126) (not e!654231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150253 (= res!765126 (validKeyInArray!0 k!934))))

(declare-fun b!1150254 () Bool)

(assert (=> b!1150254 (= e!654233 (= call!53514 call!53518))))

(declare-fun bm!53513 () Bool)

(declare-fun call!53516 () Unit!37821)

(declare-fun c!113842 () Bool)

(declare-fun lt!514672 () ListLongMap!16355)

(declare-fun addStillContains!863 (ListLongMap!16355 (_ BitVec 64) V!43609 (_ BitVec 64)) Unit!37821)

(assert (=> bm!53513 (= call!53516 (addStillContains!863 (ite c!113840 lt!514672 lt!514673) (ite c!113840 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113842 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113840 minValue!944 (ite c!113842 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1150255 () Bool)

(assert (=> b!1150255 (= e!654235 (= lt!514660 (getCurrentListMapNoExtraKeys!4665 lt!514677 lt!514663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1150256 () Bool)

(declare-fun res!765116 () Bool)

(assert (=> b!1150256 (=> (not res!765116) (not e!654231))))

(assert (=> b!1150256 (= res!765116 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25133))))

(declare-fun bm!53514 () Bool)

(assert (=> bm!53514 (= call!53515 call!53516)))

(declare-fun mapIsEmpty!45116 () Bool)

(assert (=> mapIsEmpty!45116 mapRes!45116))

(declare-fun b!1150257 () Bool)

(assert (=> b!1150257 (= e!654238 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53515 () Bool)

(declare-fun call!53520 () Bool)

(assert (=> bm!53515 (= call!53519 call!53520)))

(declare-fun b!1150258 () Bool)

(declare-fun res!765121 () Bool)

(assert (=> b!1150258 (=> (not res!765121) (not e!654231))))

(assert (=> b!1150258 (= res!765121 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36471 _keys!1208))))))

(declare-fun b!1150259 () Bool)

(assert (=> b!1150259 (= e!654237 tp_is_empty!28861)))

(declare-fun b!1150260 () Bool)

(assert (=> b!1150260 (= e!654238 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514656) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!53521 () ListLongMap!16355)

(declare-fun bm!53516 () Bool)

(assert (=> bm!53516 (= call!53520 (contains!6714 (ite c!113840 lt!514672 call!53521) k!934))))

(declare-fun b!1150261 () Bool)

(declare-fun Unit!37825 () Unit!37821)

(assert (=> b!1150261 (= e!654224 Unit!37825)))

(declare-fun b!1150262 () Bool)

(declare-fun e!654225 () Bool)

(assert (=> b!1150262 (= e!654231 e!654225)))

(declare-fun res!765118 () Bool)

(assert (=> b!1150262 (=> (not res!765118) (not e!654225))))

(assert (=> b!1150262 (= res!765118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514677 mask!1564))))

(assert (=> b!1150262 (= lt!514677 (array!74570 (store (arr!35935 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36471 _keys!1208)))))

(declare-fun bm!53517 () Bool)

(declare-fun call!53517 () ListLongMap!16355)

(assert (=> bm!53517 (= call!53521 call!53517)))

(declare-fun res!765125 () Bool)

(assert (=> start!98726 (=> (not res!765125) (not e!654231))))

(assert (=> start!98726 (= res!765125 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36471 _keys!1208))))))

(assert (=> start!98726 e!654231))

(assert (=> start!98726 tp_is_empty!28861))

(declare-fun array_inv!27522 (array!74569) Bool)

(assert (=> start!98726 (array_inv!27522 _keys!1208)))

(assert (=> start!98726 true))

(assert (=> start!98726 tp!85704))

(declare-fun e!654227 () Bool)

(declare-fun array_inv!27523 (array!74571) Bool)

(assert (=> start!98726 (and (array_inv!27523 _values!996) e!654227)))

(declare-fun b!1150263 () Bool)

(assert (=> b!1150263 (= e!654225 (not e!654226))))

(declare-fun res!765119 () Bool)

(assert (=> b!1150263 (=> res!765119 e!654226)))

(assert (=> b!1150263 (= res!765119 (bvsgt from!1455 i!673))))

(assert (=> b!1150263 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!514659 () Unit!37821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74569 (_ BitVec 64) (_ BitVec 32)) Unit!37821)

(assert (=> b!1150263 (= lt!514659 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1150264 () Bool)

(assert (=> b!1150264 (= c!113842 (and (not lt!514656) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1150264 (= e!654236 e!654228)))

(declare-fun bm!53518 () Bool)

(assert (=> bm!53518 (= call!53517 (+!3613 lt!514673 (ite (or c!113840 c!113842) (tuple2!18387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150265 () Bool)

(assert (=> b!1150265 (= e!654227 (and e!654240 mapRes!45116))))

(declare-fun condMapEmpty!45116 () Bool)

(declare-fun mapDefault!45116 () ValueCell!13721)

