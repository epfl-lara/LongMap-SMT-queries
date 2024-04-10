; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101644 () Bool)

(assert start!101644)

(declare-fun b_free!26365 () Bool)

(declare-fun b_next!26365 () Bool)

(assert (=> start!101644 (= b_free!26365 (not b_next!26365))))

(declare-fun tp!92138 () Bool)

(declare-fun b_and!43973 () Bool)

(assert (=> start!101644 (= tp!92138 b_and!43973)))

(declare-fun b!1222543 () Bool)

(declare-fun res!812278 () Bool)

(declare-fun e!694306 () Bool)

(assert (=> b!1222543 (=> (not res!812278) (not e!694306))))

(declare-datatypes ((array!78921 0))(
  ( (array!78922 (arr!38088 (Array (_ BitVec 32) (_ BitVec 64))) (size!38624 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78921)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1222543 (= res!812278 (= (select (arr!38088 _keys!1208) i!673) k!934))))

(declare-fun b!1222544 () Bool)

(declare-fun res!812280 () Bool)

(assert (=> b!1222544 (=> (not res!812280) (not e!694306))))

(assert (=> b!1222544 (= res!812280 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38624 _keys!1208))))))

(declare-fun b!1222545 () Bool)

(declare-fun res!812286 () Bool)

(assert (=> b!1222545 (=> (not res!812286) (not e!694306))))

(declare-datatypes ((List!26882 0))(
  ( (Nil!26879) (Cons!26878 (h!28087 (_ BitVec 64)) (t!40227 List!26882)) )
))
(declare-fun arrayNoDuplicates!0 (array!78921 (_ BitVec 32) List!26882) Bool)

(assert (=> b!1222545 (= res!812286 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26879))))

(declare-fun b!1222546 () Bool)

(declare-fun e!694304 () Bool)

(declare-fun e!694307 () Bool)

(assert (=> b!1222546 (= e!694304 e!694307)))

(declare-fun res!812284 () Bool)

(assert (=> b!1222546 (=> res!812284 e!694307)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222546 (= res!812284 (not (validKeyInArray!0 (select (arr!38088 _keys!1208) from!1455))))))

(declare-datatypes ((V!46553 0))(
  ( (V!46554 (val!15591 Int)) )
))
(declare-datatypes ((tuple2!20082 0))(
  ( (tuple2!20083 (_1!10052 (_ BitVec 64)) (_2!10052 V!46553)) )
))
(declare-datatypes ((List!26883 0))(
  ( (Nil!26880) (Cons!26879 (h!28088 tuple2!20082) (t!40228 List!26883)) )
))
(declare-datatypes ((ListLongMap!18051 0))(
  ( (ListLongMap!18052 (toList!9041 List!26883)) )
))
(declare-fun lt!556249 () ListLongMap!18051)

(declare-fun lt!556252 () ListLongMap!18051)

(assert (=> b!1222546 (= lt!556249 lt!556252)))

(declare-fun lt!556240 () ListLongMap!18051)

(declare-fun -!1945 (ListLongMap!18051 (_ BitVec 64)) ListLongMap!18051)

(assert (=> b!1222546 (= lt!556252 (-!1945 lt!556240 k!934))))

(declare-fun zeroValue!944 () V!46553)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!556246 () array!78921)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14825 0))(
  ( (ValueCellFull!14825 (v!18252 V!46553)) (EmptyCell!14825) )
))
(declare-datatypes ((array!78923 0))(
  ( (array!78924 (arr!38089 (Array (_ BitVec 32) ValueCell!14825)) (size!38625 (_ BitVec 32))) )
))
(declare-fun lt!556244 () array!78923)

(declare-fun minValue!944 () V!46553)

(declare-fun getCurrentListMapNoExtraKeys!5463 (array!78921 array!78923 (_ BitVec 32) (_ BitVec 32) V!46553 V!46553 (_ BitVec 32) Int) ListLongMap!18051)

(assert (=> b!1222546 (= lt!556249 (getCurrentListMapNoExtraKeys!5463 lt!556246 lt!556244 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78923)

(assert (=> b!1222546 (= lt!556240 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40489 0))(
  ( (Unit!40490) )
))
(declare-fun lt!556242 () Unit!40489)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1152 (array!78921 array!78923 (_ BitVec 32) (_ BitVec 32) V!46553 V!46553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40489)

(assert (=> b!1222546 (= lt!556242 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1152 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222547 () Bool)

(declare-fun res!812287 () Bool)

(assert (=> b!1222547 (=> (not res!812287) (not e!694306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222547 (= res!812287 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48499 () Bool)

(declare-fun mapRes!48499 () Bool)

(assert (=> mapIsEmpty!48499 mapRes!48499))

(declare-fun b!1222548 () Bool)

(declare-fun e!694302 () Bool)

(declare-fun tp_is_empty!31069 () Bool)

(assert (=> b!1222548 (= e!694302 tp_is_empty!31069)))

(declare-fun b!1222549 () Bool)

(assert (=> b!1222549 (= e!694307 (not (= (select (arr!38088 _keys!1208) from!1455) k!934)))))

(declare-fun lt!556250 () Unit!40489)

(declare-fun e!694303 () Unit!40489)

(assert (=> b!1222549 (= lt!556250 e!694303)))

(declare-fun c!120329 () Bool)

(assert (=> b!1222549 (= c!120329 (= (select (arr!38088 _keys!1208) from!1455) k!934))))

(declare-fun e!694309 () Bool)

(assert (=> b!1222549 e!694309))

(declare-fun res!812283 () Bool)

(assert (=> b!1222549 (=> (not res!812283) (not e!694309))))

(declare-fun lt!556243 () ListLongMap!18051)

(declare-fun lt!556241 () V!46553)

(declare-fun +!4101 (ListLongMap!18051 tuple2!20082) ListLongMap!18051)

(declare-fun get!19444 (ValueCell!14825 V!46553) V!46553)

(assert (=> b!1222549 (= res!812283 (= lt!556243 (+!4101 lt!556252 (tuple2!20083 (select (arr!38088 _keys!1208) from!1455) (get!19444 (select (arr!38089 _values!996) from!1455) lt!556241)))))))

(declare-fun b!1222550 () Bool)

(declare-fun res!812277 () Bool)

(declare-fun e!694305 () Bool)

(assert (=> b!1222550 (=> (not res!812277) (not e!694305))))

(assert (=> b!1222550 (= res!812277 (arrayNoDuplicates!0 lt!556246 #b00000000000000000000000000000000 Nil!26879))))

(declare-fun mapNonEmpty!48499 () Bool)

(declare-fun tp!92137 () Bool)

(assert (=> mapNonEmpty!48499 (= mapRes!48499 (and tp!92137 e!694302))))

(declare-fun mapRest!48499 () (Array (_ BitVec 32) ValueCell!14825))

(declare-fun mapKey!48499 () (_ BitVec 32))

(declare-fun mapValue!48499 () ValueCell!14825)

(assert (=> mapNonEmpty!48499 (= (arr!38089 _values!996) (store mapRest!48499 mapKey!48499 mapValue!48499))))

(declare-fun b!1222551 () Bool)

(declare-fun res!812275 () Bool)

(assert (=> b!1222551 (=> (not res!812275) (not e!694306))))

(assert (=> b!1222551 (= res!812275 (validKeyInArray!0 k!934))))

(declare-fun b!1222552 () Bool)

(declare-fun Unit!40491 () Unit!40489)

(assert (=> b!1222552 (= e!694303 Unit!40491)))

(declare-fun b!1222553 () Bool)

(declare-fun res!812282 () Bool)

(assert (=> b!1222553 (=> (not res!812282) (not e!694306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78921 (_ BitVec 32)) Bool)

(assert (=> b!1222553 (= res!812282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222542 () Bool)

(declare-fun e!694300 () Bool)

(assert (=> b!1222542 (= e!694305 (not e!694300))))

(declare-fun res!812274 () Bool)

(assert (=> b!1222542 (=> res!812274 e!694300)))

(assert (=> b!1222542 (= res!812274 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222542 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!556239 () Unit!40489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78921 (_ BitVec 64) (_ BitVec 32)) Unit!40489)

(assert (=> b!1222542 (= lt!556239 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!812281 () Bool)

(assert (=> start!101644 (=> (not res!812281) (not e!694306))))

(assert (=> start!101644 (= res!812281 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38624 _keys!1208))))))

(assert (=> start!101644 e!694306))

(assert (=> start!101644 tp_is_empty!31069))

(declare-fun array_inv!28980 (array!78921) Bool)

(assert (=> start!101644 (array_inv!28980 _keys!1208)))

(assert (=> start!101644 true))

(assert (=> start!101644 tp!92138))

(declare-fun e!694301 () Bool)

(declare-fun array_inv!28981 (array!78923) Bool)

(assert (=> start!101644 (and (array_inv!28981 _values!996) e!694301)))

(declare-fun b!1222554 () Bool)

(assert (=> b!1222554 (= e!694300 e!694304)))

(declare-fun res!812276 () Bool)

(assert (=> b!1222554 (=> res!812276 e!694304)))

(assert (=> b!1222554 (= res!812276 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222554 (= lt!556243 (getCurrentListMapNoExtraKeys!5463 lt!556246 lt!556244 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222554 (= lt!556244 (array!78924 (store (arr!38089 _values!996) i!673 (ValueCellFull!14825 lt!556241)) (size!38625 _values!996)))))

(declare-fun dynLambda!3339 (Int (_ BitVec 64)) V!46553)

(assert (=> b!1222554 (= lt!556241 (dynLambda!3339 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556247 () ListLongMap!18051)

(assert (=> b!1222554 (= lt!556247 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222555 () Bool)

(declare-fun res!812285 () Bool)

(assert (=> b!1222555 (=> (not res!812285) (not e!694306))))

(assert (=> b!1222555 (= res!812285 (and (= (size!38625 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38624 _keys!1208) (size!38625 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222556 () Bool)

(declare-fun e!694311 () Bool)

(assert (=> b!1222556 (= e!694309 e!694311)))

(declare-fun res!812279 () Bool)

(assert (=> b!1222556 (=> res!812279 e!694311)))

(assert (=> b!1222556 (= res!812279 (not (= (select (arr!38088 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222557 () Bool)

(declare-fun e!694308 () Bool)

(assert (=> b!1222557 (= e!694308 tp_is_empty!31069)))

(declare-fun b!1222558 () Bool)

(assert (=> b!1222558 (= e!694306 e!694305)))

(declare-fun res!812288 () Bool)

(assert (=> b!1222558 (=> (not res!812288) (not e!694305))))

(assert (=> b!1222558 (= res!812288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556246 mask!1564))))

(assert (=> b!1222558 (= lt!556246 (array!78922 (store (arr!38088 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38624 _keys!1208)))))

(declare-fun b!1222559 () Bool)

(assert (=> b!1222559 (= e!694311 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222560 () Bool)

(assert (=> b!1222560 (= e!694301 (and e!694308 mapRes!48499))))

(declare-fun condMapEmpty!48499 () Bool)

(declare-fun mapDefault!48499 () ValueCell!14825)

