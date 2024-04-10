; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98834 () Bool)

(assert start!98834)

(declare-fun b_free!24439 () Bool)

(declare-fun b_next!24439 () Bool)

(assert (=> start!98834 (= b_free!24439 (not b_next!24439))))

(declare-fun tp!86028 () Bool)

(declare-fun b_and!39727 () Bool)

(assert (=> start!98834 (= tp!86028 b_and!39727)))

(declare-fun b!1155206 () Bool)

(declare-fun c!114813 () Bool)

(declare-fun lt!518222 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155206 (= c!114813 (and (not lt!518222) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38038 0))(
  ( (Unit!38039) )
))
(declare-fun e!656978 () Unit!38038)

(declare-fun e!656983 () Unit!38038)

(assert (=> b!1155206 (= e!656978 e!656983)))

(declare-fun b!1155207 () Bool)

(declare-datatypes ((V!43753 0))(
  ( (V!43754 (val!14541 Int)) )
))
(declare-datatypes ((tuple2!18490 0))(
  ( (tuple2!18491 (_1!9256 (_ BitVec 64)) (_2!9256 V!43753)) )
))
(declare-datatypes ((List!25233 0))(
  ( (Nil!25230) (Cons!25229 (h!26438 tuple2!18490) (t!36664 List!25233)) )
))
(declare-datatypes ((ListLongMap!16459 0))(
  ( (ListLongMap!16460 (toList!8245 List!25233)) )
))
(declare-fun call!54810 () ListLongMap!16459)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6758 (ListLongMap!16459 (_ BitVec 64)) Bool)

(assert (=> b!1155207 (contains!6758 call!54810 k!934)))

(declare-fun lt!518223 () Unit!38038)

(declare-fun lt!518240 () ListLongMap!16459)

(declare-fun minValue!944 () V!43753)

(declare-fun addStillContains!902 (ListLongMap!16459 (_ BitVec 64) V!43753 (_ BitVec 64)) Unit!38038)

(assert (=> b!1155207 (= lt!518223 (addStillContains!902 lt!518240 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!54814 () Bool)

(assert (=> b!1155207 call!54814))

(declare-fun lt!518238 () ListLongMap!16459)

(declare-fun zeroValue!944 () V!43753)

(declare-fun +!3658 (ListLongMap!16459 tuple2!18490) ListLongMap!16459)

(assert (=> b!1155207 (= lt!518240 (+!3658 lt!518238 (tuple2!18491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518230 () Unit!38038)

(declare-fun call!54816 () Unit!38038)

(assert (=> b!1155207 (= lt!518230 call!54816)))

(assert (=> b!1155207 (= e!656978 lt!518223)))

(declare-fun b!1155208 () Bool)

(declare-fun e!656987 () Bool)

(assert (=> b!1155208 (= e!656987 true)))

(declare-fun e!656984 () Bool)

(assert (=> b!1155208 e!656984))

(declare-fun res!767551 () Bool)

(assert (=> b!1155208 (=> (not res!767551) (not e!656984))))

(declare-fun lt!518234 () ListLongMap!16459)

(assert (=> b!1155208 (= res!767551 (= lt!518234 lt!518238))))

(declare-fun lt!518229 () ListLongMap!16459)

(declare-fun -!1365 (ListLongMap!16459 (_ BitVec 64)) ListLongMap!16459)

(assert (=> b!1155208 (= lt!518234 (-!1365 lt!518229 k!934))))

(declare-datatypes ((array!74785 0))(
  ( (array!74786 (arr!36043 (Array (_ BitVec 32) (_ BitVec 64))) (size!36579 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74785)

(declare-fun lt!518235 () V!43753)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1155208 (= (-!1365 (+!3658 lt!518238 (tuple2!18491 (select (arr!36043 _keys!1208) from!1455) lt!518235)) (select (arr!36043 _keys!1208) from!1455)) lt!518238)))

(declare-fun lt!518226 () Unit!38038)

(declare-fun addThenRemoveForNewKeyIsSame!205 (ListLongMap!16459 (_ BitVec 64) V!43753) Unit!38038)

(assert (=> b!1155208 (= lt!518226 (addThenRemoveForNewKeyIsSame!205 lt!518238 (select (arr!36043 _keys!1208) from!1455) lt!518235))))

(declare-fun lt!518231 () V!43753)

(declare-datatypes ((ValueCell!13775 0))(
  ( (ValueCellFull!13775 (v!17178 V!43753)) (EmptyCell!13775) )
))
(declare-datatypes ((array!74787 0))(
  ( (array!74788 (arr!36044 (Array (_ BitVec 32) ValueCell!13775)) (size!36580 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74787)

(declare-fun get!18365 (ValueCell!13775 V!43753) V!43753)

(assert (=> b!1155208 (= lt!518235 (get!18365 (select (arr!36044 _values!996) from!1455) lt!518231))))

(declare-fun lt!518241 () Unit!38038)

(declare-fun e!656982 () Unit!38038)

(assert (=> b!1155208 (= lt!518241 e!656982)))

(declare-fun c!114812 () Bool)

(assert (=> b!1155208 (= c!114812 (contains!6758 lt!518238 k!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4714 (array!74785 array!74787 (_ BitVec 32) (_ BitVec 32) V!43753 V!43753 (_ BitVec 32) Int) ListLongMap!16459)

(assert (=> b!1155208 (= lt!518238 (getCurrentListMapNoExtraKeys!4714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54807 () Bool)

(declare-fun c!114809 () Bool)

(assert (=> bm!54807 (= call!54816 (addStillContains!902 lt!518238 (ite (or c!114809 c!114813) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114809 c!114813) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1155209 () Bool)

(declare-fun e!656994 () Bool)

(declare-fun e!656988 () Bool)

(assert (=> b!1155209 (= e!656994 (not e!656988))))

(declare-fun res!767545 () Bool)

(assert (=> b!1155209 (=> res!767545 e!656988)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155209 (= res!767545 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155209 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!518237 () Unit!38038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74785 (_ BitVec 64) (_ BitVec 32)) Unit!38038)

(assert (=> b!1155209 (= lt!518237 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1155210 () Bool)

(declare-fun lt!518236 () Unit!38038)

(assert (=> b!1155210 (= e!656983 lt!518236)))

(declare-fun call!54817 () Unit!38038)

(assert (=> b!1155210 (= lt!518236 call!54817)))

(declare-fun call!54811 () Bool)

(assert (=> b!1155210 call!54811))

(declare-fun bm!54808 () Bool)

(declare-fun call!54815 () ListLongMap!16459)

(assert (=> bm!54808 (= call!54815 call!54810)))

(declare-fun b!1155211 () Bool)

(declare-fun res!767548 () Bool)

(assert (=> b!1155211 (=> (not res!767548) (not e!656994))))

(declare-fun lt!518232 () array!74785)

(declare-datatypes ((List!25234 0))(
  ( (Nil!25231) (Cons!25230 (h!26439 (_ BitVec 64)) (t!36665 List!25234)) )
))
(declare-fun arrayNoDuplicates!0 (array!74785 (_ BitVec 32) List!25234) Bool)

(assert (=> b!1155211 (= res!767548 (arrayNoDuplicates!0 lt!518232 #b00000000000000000000000000000000 Nil!25231))))

(declare-fun b!1155212 () Bool)

(declare-fun e!656993 () Unit!38038)

(assert (=> b!1155212 (= e!656983 e!656993)))

(declare-fun c!114814 () Bool)

(assert (=> b!1155212 (= c!114814 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518222))))

(declare-fun b!1155213 () Bool)

(declare-fun res!767557 () Bool)

(declare-fun e!656981 () Bool)

(assert (=> b!1155213 (=> (not res!767557) (not e!656981))))

(assert (=> b!1155213 (= res!767557 (and (= (size!36580 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36579 _keys!1208) (size!36580 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!656986 () Bool)

(declare-fun b!1155214 () Bool)

(assert (=> b!1155214 (= e!656986 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518222) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155215 () Bool)

(assert (=> b!1155215 (= e!656986 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155216 () Bool)

(declare-fun e!656985 () Bool)

(declare-fun call!54813 () ListLongMap!16459)

(declare-fun call!54812 () ListLongMap!16459)

(assert (=> b!1155216 (= e!656985 (= call!54813 call!54812))))

(declare-fun b!1155217 () Bool)

(declare-fun e!656991 () Bool)

(declare-fun tp_is_empty!28969 () Bool)

(assert (=> b!1155217 (= e!656991 tp_is_empty!28969)))

(declare-fun bm!54809 () Bool)

(assert (=> bm!54809 (= call!54810 (+!3658 (ite c!114809 lt!518240 lt!518238) (ite c!114809 (tuple2!18491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114813 (tuple2!18491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155218 () Bool)

(declare-fun e!656989 () Bool)

(assert (=> b!1155218 (= e!656989 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54810 () Bool)

(assert (=> bm!54810 (= call!54811 call!54814)))

(declare-fun bm!54811 () Bool)

(assert (=> bm!54811 (= call!54812 (getCurrentListMapNoExtraKeys!4714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155219 () Bool)

(declare-fun e!656980 () Bool)

(declare-fun e!656990 () Bool)

(declare-fun mapRes!45278 () Bool)

(assert (=> b!1155219 (= e!656980 (and e!656990 mapRes!45278))))

(declare-fun condMapEmpty!45278 () Bool)

(declare-fun mapDefault!45278 () ValueCell!13775)

