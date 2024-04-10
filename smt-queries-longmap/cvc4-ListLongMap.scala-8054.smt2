; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99168 () Bool)

(assert start!99168)

(declare-fun b_free!24773 () Bool)

(declare-fun b_next!24773 () Bool)

(assert (=> start!99168 (= b_free!24773 (not b_next!24773))))

(declare-fun tp!87030 () Bool)

(declare-fun b_and!40395 () Bool)

(assert (=> start!99168 (= tp!87030 b_and!40395)))

(declare-fun mapIsEmpty!45779 () Bool)

(declare-fun mapRes!45779 () Bool)

(assert (=> mapIsEmpty!45779 mapRes!45779))

(declare-fun b!1167219 () Bool)

(declare-fun res!774296 () Bool)

(declare-fun e!663434 () Bool)

(assert (=> b!1167219 (=> (not res!774296) (not e!663434))))

(declare-datatypes ((array!75435 0))(
  ( (array!75436 (arr!36368 (Array (_ BitVec 32) (_ BitVec 64))) (size!36904 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75435)

(declare-datatypes ((List!25502 0))(
  ( (Nil!25499) (Cons!25498 (h!26707 (_ BitVec 64)) (t!37267 List!25502)) )
))
(declare-fun arrayNoDuplicates!0 (array!75435 (_ BitVec 32) List!25502) Bool)

(assert (=> b!1167219 (= res!774296 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25499))))

(declare-fun b!1167220 () Bool)

(declare-fun e!663437 () Bool)

(assert (=> b!1167220 (= e!663437 true)))

(declare-datatypes ((V!44197 0))(
  ( (V!44198 (val!14708 Int)) )
))
(declare-fun zeroValue!944 () V!44197)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!525555 () array!75435)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13942 0))(
  ( (ValueCellFull!13942 (v!17345 V!44197)) (EmptyCell!13942) )
))
(declare-datatypes ((array!75437 0))(
  ( (array!75438 (arr!36369 (Array (_ BitVec 32) ValueCell!13942)) (size!36905 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75437)

(declare-fun lt!525551 () array!75437)

(declare-fun minValue!944 () V!44197)

(declare-datatypes ((tuple2!18762 0))(
  ( (tuple2!18763 (_1!9392 (_ BitVec 64)) (_2!9392 V!44197)) )
))
(declare-datatypes ((List!25503 0))(
  ( (Nil!25500) (Cons!25499 (h!26708 tuple2!18762) (t!37268 List!25503)) )
))
(declare-datatypes ((ListLongMap!16731 0))(
  ( (ListLongMap!16732 (toList!8381 List!25503)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4845 (array!75435 array!75437 (_ BitVec 32) (_ BitVec 32) V!44197 V!44197 (_ BitVec 32) Int) ListLongMap!16731)

(declare-fun -!1457 (ListLongMap!16731 (_ BitVec 64)) ListLongMap!16731)

(assert (=> b!1167220 (= (getCurrentListMapNoExtraKeys!4845 lt!525555 lt!525551 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1457 (getCurrentListMapNoExtraKeys!4845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38516 0))(
  ( (Unit!38517) )
))
(declare-fun lt!525550 () Unit!38516)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!684 (array!75435 array!75437 (_ BitVec 32) (_ BitVec 32) V!44197 V!44197 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38516)

(assert (=> b!1167220 (= lt!525550 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167221 () Bool)

(declare-fun res!774291 () Bool)

(assert (=> b!1167221 (=> (not res!774291) (not e!663434))))

(assert (=> b!1167221 (= res!774291 (and (= (size!36905 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36904 _keys!1208) (size!36905 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167222 () Bool)

(declare-fun e!663440 () Bool)

(assert (=> b!1167222 (= e!663434 e!663440)))

(declare-fun res!774294 () Bool)

(assert (=> b!1167222 (=> (not res!774294) (not e!663440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75435 (_ BitVec 32)) Bool)

(assert (=> b!1167222 (= res!774294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525555 mask!1564))))

(assert (=> b!1167222 (= lt!525555 (array!75436 (store (arr!36368 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36904 _keys!1208)))))

(declare-fun b!1167223 () Bool)

(declare-fun res!774299 () Bool)

(assert (=> b!1167223 (=> (not res!774299) (not e!663440))))

(assert (=> b!1167223 (= res!774299 (arrayNoDuplicates!0 lt!525555 #b00000000000000000000000000000000 Nil!25499))))

(declare-fun b!1167224 () Bool)

(declare-fun res!774290 () Bool)

(assert (=> b!1167224 (=> (not res!774290) (not e!663434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167224 (= res!774290 (validKeyInArray!0 k!934))))

(declare-fun b!1167225 () Bool)

(declare-fun res!774293 () Bool)

(assert (=> b!1167225 (=> (not res!774293) (not e!663434))))

(assert (=> b!1167225 (= res!774293 (= (select (arr!36368 _keys!1208) i!673) k!934))))

(declare-fun b!1167226 () Bool)

(declare-fun e!663435 () Bool)

(declare-fun e!663441 () Bool)

(assert (=> b!1167226 (= e!663435 (and e!663441 mapRes!45779))))

(declare-fun condMapEmpty!45779 () Bool)

(declare-fun mapDefault!45779 () ValueCell!13942)

