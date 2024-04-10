; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99376 () Bool)

(assert start!99376)

(declare-fun b_free!24955 () Bool)

(declare-fun b_next!24955 () Bool)

(assert (=> start!99376 (= b_free!24955 (not b_next!24955))))

(declare-fun tp!87579 () Bool)

(declare-fun b_and!40777 () Bool)

(assert (=> start!99376 (= tp!87579 b_and!40777)))

(declare-fun mapIsEmpty!46055 () Bool)

(declare-fun mapRes!46055 () Bool)

(assert (=> mapIsEmpty!46055 mapRes!46055))

(declare-fun b!1172535 () Bool)

(declare-fun res!778521 () Bool)

(declare-fun e!666469 () Bool)

(assert (=> b!1172535 (=> (not res!778521) (not e!666469))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75783 0))(
  ( (array!75784 (arr!36541 (Array (_ BitVec 32) (_ BitVec 64))) (size!37077 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75783)

(assert (=> b!1172535 (= res!778521 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37077 _keys!1208))))))

(declare-fun b!1172536 () Bool)

(declare-fun e!666465 () Bool)

(declare-fun tp_is_empty!29485 () Bool)

(assert (=> b!1172536 (= e!666465 tp_is_empty!29485)))

(declare-fun b!1172537 () Bool)

(declare-fun res!778537 () Bool)

(assert (=> b!1172537 (=> (not res!778537) (not e!666469))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172537 (= res!778537 (validKeyInArray!0 k!934))))

(declare-fun b!1172538 () Bool)

(declare-fun e!666467 () Bool)

(assert (=> b!1172538 (= e!666469 e!666467)))

(declare-fun res!778531 () Bool)

(assert (=> b!1172538 (=> (not res!778531) (not e!666467))))

(declare-fun lt!528338 () array!75783)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75783 (_ BitVec 32)) Bool)

(assert (=> b!1172538 (= res!778531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528338 mask!1564))))

(assert (=> b!1172538 (= lt!528338 (array!75784 (store (arr!36541 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37077 _keys!1208)))))

(declare-fun b!1172539 () Bool)

(declare-fun e!666460 () Bool)

(declare-fun e!666472 () Bool)

(assert (=> b!1172539 (= e!666460 e!666472)))

(declare-fun res!778519 () Bool)

(assert (=> b!1172539 (=> res!778519 e!666472)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172539 (= res!778519 (not (validKeyInArray!0 (select (arr!36541 _keys!1208) from!1455))))))

(declare-datatypes ((V!44441 0))(
  ( (V!44442 (val!14799 Int)) )
))
(declare-datatypes ((tuple2!18908 0))(
  ( (tuple2!18909 (_1!9465 (_ BitVec 64)) (_2!9465 V!44441)) )
))
(declare-datatypes ((List!25645 0))(
  ( (Nil!25642) (Cons!25641 (h!26850 tuple2!18908) (t!37592 List!25645)) )
))
(declare-datatypes ((ListLongMap!16877 0))(
  ( (ListLongMap!16878 (toList!8454 List!25645)) )
))
(declare-fun lt!528330 () ListLongMap!16877)

(declare-fun lt!528331 () ListLongMap!16877)

(assert (=> b!1172539 (= lt!528330 lt!528331)))

(declare-fun lt!528340 () ListLongMap!16877)

(declare-fun -!1521 (ListLongMap!16877 (_ BitVec 64)) ListLongMap!16877)

(assert (=> b!1172539 (= lt!528331 (-!1521 lt!528340 k!934))))

(declare-fun zeroValue!944 () V!44441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44441)

(declare-datatypes ((ValueCell!14033 0))(
  ( (ValueCellFull!14033 (v!17437 V!44441)) (EmptyCell!14033) )
))
(declare-datatypes ((array!75785 0))(
  ( (array!75786 (arr!36542 (Array (_ BitVec 32) ValueCell!14033)) (size!37078 (_ BitVec 32))) )
))
(declare-fun lt!528332 () array!75785)

(declare-fun getCurrentListMapNoExtraKeys!4918 (array!75783 array!75785 (_ BitVec 32) (_ BitVec 32) V!44441 V!44441 (_ BitVec 32) Int) ListLongMap!16877)

(assert (=> b!1172539 (= lt!528330 (getCurrentListMapNoExtraKeys!4918 lt!528338 lt!528332 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75785)

(assert (=> b!1172539 (= lt!528340 (getCurrentListMapNoExtraKeys!4918 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38662 0))(
  ( (Unit!38663) )
))
(declare-fun lt!528333 () Unit!38662)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!748 (array!75783 array!75785 (_ BitVec 32) (_ BitVec 32) V!44441 V!44441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38662)

(assert (=> b!1172539 (= lt!528333 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!748 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!666464 () Bool)

(declare-fun b!1172540 () Bool)

(declare-fun arrayContainsKey!0 (array!75783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172540 (= e!666464 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1172541 () Bool)

(declare-fun e!666468 () Bool)

(declare-fun e!666466 () Bool)

(assert (=> b!1172541 (= e!666468 e!666466)))

(declare-fun res!778526 () Bool)

(assert (=> b!1172541 (=> res!778526 e!666466)))

(assert (=> b!1172541 (= res!778526 (or (bvsge (size!37077 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37077 _keys!1208)) (bvsge from!1455 (size!37077 _keys!1208))))))

(declare-datatypes ((List!25646 0))(
  ( (Nil!25643) (Cons!25642 (h!26851 (_ BitVec 64)) (t!37593 List!25646)) )
))
(declare-fun arrayNoDuplicates!0 (array!75783 (_ BitVec 32) List!25646) Bool)

(assert (=> b!1172541 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25643)))

(declare-fun lt!528339 () Unit!38662)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75783 (_ BitVec 32) (_ BitVec 32)) Unit!38662)

(assert (=> b!1172541 (= lt!528339 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172541 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528337 () Unit!38662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75783 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38662)

(assert (=> b!1172541 (= lt!528337 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172542 () Bool)

(declare-fun res!778529 () Bool)

(assert (=> b!1172542 (=> res!778529 e!666466)))

(declare-fun contains!6858 (List!25646 (_ BitVec 64)) Bool)

(assert (=> b!1172542 (= res!778529 (contains!6858 Nil!25643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!778535 () Bool)

(assert (=> start!99376 (=> (not res!778535) (not e!666469))))

(assert (=> start!99376 (= res!778535 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37077 _keys!1208))))))

(assert (=> start!99376 e!666469))

(assert (=> start!99376 tp_is_empty!29485))

(declare-fun array_inv!27922 (array!75783) Bool)

(assert (=> start!99376 (array_inv!27922 _keys!1208)))

(assert (=> start!99376 true))

(assert (=> start!99376 tp!87579))

(declare-fun e!666462 () Bool)

(declare-fun array_inv!27923 (array!75785) Bool)

(assert (=> start!99376 (and (array_inv!27923 _values!996) e!666462)))

(declare-fun b!1172543 () Bool)

(declare-fun res!778534 () Bool)

(assert (=> b!1172543 (=> res!778534 e!666466)))

(declare-fun noDuplicate!1620 (List!25646) Bool)

(assert (=> b!1172543 (= res!778534 (not (noDuplicate!1620 Nil!25643)))))

(declare-fun b!1172544 () Bool)

(declare-fun res!778520 () Bool)

(assert (=> b!1172544 (=> (not res!778520) (not e!666469))))

(assert (=> b!1172544 (= res!778520 (= (select (arr!36541 _keys!1208) i!673) k!934))))

(declare-fun b!1172545 () Bool)

(assert (=> b!1172545 (= e!666466 true)))

(declare-fun lt!528336 () Bool)

(assert (=> b!1172545 (= lt!528336 (contains!6858 Nil!25643 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172546 () Bool)

(declare-fun e!666461 () Bool)

(assert (=> b!1172546 (= e!666462 (and e!666461 mapRes!46055))))

(declare-fun condMapEmpty!46055 () Bool)

(declare-fun mapDefault!46055 () ValueCell!14033)

