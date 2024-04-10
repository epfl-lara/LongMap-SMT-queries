; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98682 () Bool)

(assert start!98682)

(declare-fun b_free!24287 () Bool)

(declare-fun b_next!24287 () Bool)

(assert (=> start!98682 (= b_free!24287 (not b_next!24287))))

(declare-fun tp!85572 () Bool)

(declare-fun b_and!39423 () Bool)

(assert (=> start!98682 (= tp!85572 b_and!39423)))

(declare-fun b!1148214 () Bool)

(declare-datatypes ((Unit!37727 0))(
  ( (Unit!37728) )
))
(declare-fun e!653116 () Unit!37727)

(declare-fun Unit!37729 () Unit!37727)

(assert (=> b!1148214 (= e!653116 Unit!37729)))

(declare-fun lt!513244 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1148214 (= lt!513244 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113441 () Bool)

(assert (=> b!1148214 (= c!113441 (and (not lt!513244) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513250 () Unit!37727)

(declare-fun e!653117 () Unit!37727)

(assert (=> b!1148214 (= lt!513250 e!653117)))

(declare-datatypes ((V!43549 0))(
  ( (V!43550 (val!14465 Int)) )
))
(declare-fun zeroValue!944 () V!43549)

(declare-datatypes ((array!74481 0))(
  ( (array!74482 (arr!35891 (Array (_ BitVec 32) (_ BitVec 64))) (size!36427 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74481)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13699 0))(
  ( (ValueCellFull!13699 (v!17102 V!43549)) (EmptyCell!13699) )
))
(declare-datatypes ((array!74483 0))(
  ( (array!74484 (arr!35892 (Array (_ BitVec 32) ValueCell!13699)) (size!36428 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74483)

(declare-fun minValue!944 () V!43549)

(declare-fun lt!513247 () Unit!37727)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!439 (array!74481 array!74483 (_ BitVec 32) (_ BitVec 32) V!43549 V!43549 (_ BitVec 64) (_ BitVec 32) Int) Unit!37727)

(assert (=> b!1148214 (= lt!513247 (lemmaListMapContainsThenArrayContainsFrom!439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113444 () Bool)

(assert (=> b!1148214 (= c!113444 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764126 () Bool)

(declare-fun e!653110 () Bool)

(assert (=> b!1148214 (= res!764126 e!653110)))

(declare-fun e!653107 () Bool)

(assert (=> b!1148214 (=> (not res!764126) (not e!653107))))

(assert (=> b!1148214 e!653107))

(declare-fun lt!513241 () Unit!37727)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74481 (_ BitVec 32) (_ BitVec 32)) Unit!37727)

(assert (=> b!1148214 (= lt!513241 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25093 0))(
  ( (Nil!25090) (Cons!25089 (h!26298 (_ BitVec 64)) (t!36372 List!25093)) )
))
(declare-fun arrayNoDuplicates!0 (array!74481 (_ BitVec 32) List!25093) Bool)

(assert (=> b!1148214 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25090)))

(declare-fun lt!513251 () Unit!37727)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74481 (_ BitVec 64) (_ BitVec 32) List!25093) Unit!37727)

(assert (=> b!1148214 (= lt!513251 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25090))))

(assert (=> b!1148214 false))

(declare-fun res!764134 () Bool)

(declare-fun e!653104 () Bool)

(assert (=> start!98682 (=> (not res!764134) (not e!653104))))

(assert (=> start!98682 (= res!764134 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36427 _keys!1208))))))

(assert (=> start!98682 e!653104))

(declare-fun tp_is_empty!28817 () Bool)

(assert (=> start!98682 tp_is_empty!28817))

(declare-fun array_inv!27492 (array!74481) Bool)

(assert (=> start!98682 (array_inv!27492 _keys!1208)))

(assert (=> start!98682 true))

(assert (=> start!98682 tp!85572))

(declare-fun e!653113 () Bool)

(declare-fun array_inv!27493 (array!74483) Bool)

(assert (=> start!98682 (and (array_inv!27493 _values!996) e!653113)))

(declare-fun b!1148215 () Bool)

(declare-fun e!653103 () Unit!37727)

(declare-fun Unit!37730 () Unit!37727)

(assert (=> b!1148215 (= e!653103 Unit!37730)))

(declare-fun call!52993 () Bool)

(declare-datatypes ((tuple2!18342 0))(
  ( (tuple2!18343 (_1!9182 (_ BitVec 64)) (_2!9182 V!43549)) )
))
(declare-datatypes ((List!25094 0))(
  ( (Nil!25091) (Cons!25090 (h!26299 tuple2!18342) (t!36373 List!25094)) )
))
(declare-datatypes ((ListLongMap!16311 0))(
  ( (ListLongMap!16312 (toList!8171 List!25094)) )
))
(declare-fun lt!513249 () ListLongMap!16311)

(declare-fun call!52991 () ListLongMap!16311)

(declare-fun bm!52983 () Bool)

(declare-fun contains!6694 (ListLongMap!16311 (_ BitVec 64)) Bool)

(assert (=> bm!52983 (= call!52993 (contains!6694 (ite c!113441 lt!513249 call!52991) k!934))))

(declare-fun b!1148216 () Bool)

(declare-fun c!113446 () Bool)

(assert (=> b!1148216 (= c!113446 (and (not lt!513244) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653111 () Unit!37727)

(assert (=> b!1148216 (= e!653117 e!653111)))

(declare-fun b!1148217 () Bool)

(declare-fun e!653108 () Bool)

(assert (=> b!1148217 (= e!653104 e!653108)))

(declare-fun res!764130 () Bool)

(assert (=> b!1148217 (=> (not res!764130) (not e!653108))))

(declare-fun lt!513243 () array!74481)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74481 (_ BitVec 32)) Bool)

(assert (=> b!1148217 (= res!764130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513243 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148217 (= lt!513243 (array!74482 (store (arr!35891 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36427 _keys!1208)))))

(declare-fun b!1148218 () Bool)

(declare-fun res!764125 () Bool)

(assert (=> b!1148218 (=> (not res!764125) (not e!653104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148218 (= res!764125 (validMask!0 mask!1564))))

(declare-fun b!1148219 () Bool)

(declare-fun res!764138 () Bool)

(assert (=> b!1148219 (=> (not res!764138) (not e!653104))))

(assert (=> b!1148219 (= res!764138 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36427 _keys!1208))))))

(declare-fun b!1148220 () Bool)

(assert (=> b!1148220 (= e!653111 e!653103)))

(declare-fun c!113443 () Bool)

(assert (=> b!1148220 (= c!113443 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513244))))

(declare-fun bm!52984 () Bool)

(declare-fun call!52986 () Unit!37727)

(declare-fun call!52990 () Unit!37727)

(assert (=> bm!52984 (= call!52986 call!52990)))

(declare-fun b!1148221 () Bool)

(declare-fun e!653114 () Bool)

(assert (=> b!1148221 (= e!653114 tp_is_empty!28817)))

(declare-fun b!1148222 () Bool)

(declare-fun arrayContainsKey!0 (array!74481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148222 (= e!653107 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148223 () Bool)

(declare-fun res!764133 () Bool)

(assert (=> b!1148223 (=> (not res!764133) (not e!653104))))

(assert (=> b!1148223 (= res!764133 (and (= (size!36428 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36427 _keys!1208) (size!36428 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!653112 () Bool)

(declare-fun b!1148224 () Bool)

(declare-fun call!52987 () ListLongMap!16311)

(declare-fun call!52988 () ListLongMap!16311)

(declare-fun -!1306 (ListLongMap!16311 (_ BitVec 64)) ListLongMap!16311)

(assert (=> b!1148224 (= e!653112 (= call!52988 (-!1306 call!52987 k!934)))))

(declare-fun b!1148225 () Bool)

(assert (=> b!1148225 (= e!653110 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148226 () Bool)

(declare-fun res!764132 () Bool)

(assert (=> b!1148226 (=> (not res!764132) (not e!653104))))

(assert (=> b!1148226 (= res!764132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148227 () Bool)

(declare-fun e!653106 () Bool)

(declare-fun e!653105 () Bool)

(assert (=> b!1148227 (= e!653106 e!653105)))

(declare-fun res!764127 () Bool)

(assert (=> b!1148227 (=> res!764127 e!653105)))

(assert (=> b!1148227 (= res!764127 (not (= (select (arr!35891 _keys!1208) from!1455) k!934)))))

(assert (=> b!1148227 e!653112))

(declare-fun c!113442 () Bool)

(assert (=> b!1148227 (= c!113442 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513245 () Unit!37727)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!544 (array!74481 array!74483 (_ BitVec 32) (_ BitVec 32) V!43549 V!43549 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37727)

(assert (=> b!1148227 (= lt!513245 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148228 () Bool)

(declare-fun call!52992 () Bool)

(assert (=> b!1148228 call!52992))

(declare-fun lt!513248 () Unit!37727)

(assert (=> b!1148228 (= lt!513248 call!52986)))

(assert (=> b!1148228 (= e!653103 lt!513248)))

(declare-fun mapNonEmpty!45050 () Bool)

(declare-fun mapRes!45050 () Bool)

(declare-fun tp!85571 () Bool)

(assert (=> mapNonEmpty!45050 (= mapRes!45050 (and tp!85571 e!653114))))

(declare-fun mapValue!45050 () ValueCell!13699)

(declare-fun mapRest!45050 () (Array (_ BitVec 32) ValueCell!13699))

(declare-fun mapKey!45050 () (_ BitVec 32))

(assert (=> mapNonEmpty!45050 (= (arr!35892 _values!996) (store mapRest!45050 mapKey!45050 mapValue!45050))))

(declare-fun b!1148229 () Bool)

(declare-fun e!653118 () Bool)

(assert (=> b!1148229 (= e!653113 (and e!653118 mapRes!45050))))

(declare-fun condMapEmpty!45050 () Bool)

(declare-fun mapDefault!45050 () ValueCell!13699)

