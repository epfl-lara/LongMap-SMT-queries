; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99162 () Bool)

(assert start!99162)

(declare-fun b_free!24767 () Bool)

(declare-fun b_next!24767 () Bool)

(assert (=> start!99162 (= b_free!24767 (not b_next!24767))))

(declare-fun tp!87012 () Bool)

(declare-fun b_and!40383 () Bool)

(assert (=> start!99162 (= tp!87012 b_and!40383)))

(declare-fun b!1167078 () Bool)

(declare-fun res!774184 () Bool)

(declare-fun e!663366 () Bool)

(assert (=> b!1167078 (=> (not res!774184) (not e!663366))))

(declare-datatypes ((array!75423 0))(
  ( (array!75424 (arr!36362 (Array (_ BitVec 32) (_ BitVec 64))) (size!36898 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75423)

(declare-datatypes ((List!25498 0))(
  ( (Nil!25495) (Cons!25494 (h!26703 (_ BitVec 64)) (t!37257 List!25498)) )
))
(declare-fun arrayNoDuplicates!0 (array!75423 (_ BitVec 32) List!25498) Bool)

(assert (=> b!1167078 (= res!774184 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25495))))

(declare-fun b!1167079 () Bool)

(declare-fun e!663362 () Bool)

(declare-fun e!663363 () Bool)

(assert (=> b!1167079 (= e!663362 (not e!663363))))

(declare-fun res!774186 () Bool)

(assert (=> b!1167079 (=> res!774186 e!663363)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167079 (= res!774186 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167079 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38512 0))(
  ( (Unit!38513) )
))
(declare-fun lt!525500 () Unit!38512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75423 (_ BitVec 64) (_ BitVec 32)) Unit!38512)

(assert (=> b!1167079 (= lt!525500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1167080 () Bool)

(declare-fun res!774181 () Bool)

(assert (=> b!1167080 (=> (not res!774181) (not e!663362))))

(declare-fun lt!525496 () array!75423)

(assert (=> b!1167080 (= res!774181 (arrayNoDuplicates!0 lt!525496 #b00000000000000000000000000000000 Nil!25495))))

(declare-fun b!1167081 () Bool)

(declare-fun e!663369 () Bool)

(assert (=> b!1167081 (= e!663369 true)))

(declare-datatypes ((V!44189 0))(
  ( (V!44190 (val!14705 Int)) )
))
(declare-fun zeroValue!944 () V!44189)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44189)

(declare-datatypes ((ValueCell!13939 0))(
  ( (ValueCellFull!13939 (v!17342 V!44189)) (EmptyCell!13939) )
))
(declare-datatypes ((array!75425 0))(
  ( (array!75426 (arr!36363 (Array (_ BitVec 32) ValueCell!13939)) (size!36899 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75425)

(declare-fun lt!525498 () array!75425)

(declare-datatypes ((tuple2!18758 0))(
  ( (tuple2!18759 (_1!9390 (_ BitVec 64)) (_2!9390 V!44189)) )
))
(declare-datatypes ((List!25499 0))(
  ( (Nil!25496) (Cons!25495 (h!26704 tuple2!18758) (t!37258 List!25499)) )
))
(declare-datatypes ((ListLongMap!16727 0))(
  ( (ListLongMap!16728 (toList!8379 List!25499)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4843 (array!75423 array!75425 (_ BitVec 32) (_ BitVec 32) V!44189 V!44189 (_ BitVec 32) Int) ListLongMap!16727)

(declare-fun -!1455 (ListLongMap!16727 (_ BitVec 64)) ListLongMap!16727)

(assert (=> b!1167081 (= (getCurrentListMapNoExtraKeys!4843 lt!525496 lt!525498 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1455 (getCurrentListMapNoExtraKeys!4843 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!525499 () Unit!38512)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!682 (array!75423 array!75425 (_ BitVec 32) (_ BitVec 32) V!44189 V!44189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38512)

(assert (=> b!1167081 (= lt!525499 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!682 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167082 () Bool)

(assert (=> b!1167082 (= e!663366 e!663362)))

(declare-fun res!774188 () Bool)

(assert (=> b!1167082 (=> (not res!774188) (not e!663362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75423 (_ BitVec 32)) Bool)

(assert (=> b!1167082 (= res!774188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525496 mask!1564))))

(assert (=> b!1167082 (= lt!525496 (array!75424 (store (arr!36362 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36898 _keys!1208)))))

(declare-fun b!1167083 () Bool)

(declare-fun res!774185 () Bool)

(assert (=> b!1167083 (=> (not res!774185) (not e!663366))))

(assert (=> b!1167083 (= res!774185 (= (select (arr!36362 _keys!1208) i!673) k!934))))

(declare-fun b!1167084 () Bool)

(declare-fun e!663365 () Bool)

(declare-fun e!663368 () Bool)

(declare-fun mapRes!45770 () Bool)

(assert (=> b!1167084 (= e!663365 (and e!663368 mapRes!45770))))

(declare-fun condMapEmpty!45770 () Bool)

(declare-fun mapDefault!45770 () ValueCell!13939)

