; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99272 () Bool)

(assert start!99272)

(declare-fun b_free!24851 () Bool)

(declare-fun b_next!24851 () Bool)

(assert (=> start!99272 (= b_free!24851 (not b_next!24851))))

(declare-fun tp!87267 () Bool)

(declare-fun b_and!40569 () Bool)

(assert (=> start!99272 (= tp!87267 b_and!40569)))

(declare-fun b!1169282 () Bool)

(declare-fun e!664554 () Bool)

(declare-fun e!664553 () Bool)

(assert (=> b!1169282 (= e!664554 e!664553)))

(declare-fun res!775851 () Bool)

(assert (=> b!1169282 (=> res!775851 e!664553)))

(declare-datatypes ((array!75585 0))(
  ( (array!75586 (arr!36442 (Array (_ BitVec 32) (_ BitVec 64))) (size!36978 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75585)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169282 (= res!775851 (not (validKeyInArray!0 (select (arr!36442 _keys!1208) from!1455))))))

(declare-datatypes ((V!44301 0))(
  ( (V!44302 (val!14747 Int)) )
))
(declare-datatypes ((tuple2!18828 0))(
  ( (tuple2!18829 (_1!9425 (_ BitVec 64)) (_2!9425 V!44301)) )
))
(declare-datatypes ((List!25565 0))(
  ( (Nil!25562) (Cons!25561 (h!26770 tuple2!18828) (t!37408 List!25565)) )
))
(declare-datatypes ((ListLongMap!16797 0))(
  ( (ListLongMap!16798 (toList!8414 List!25565)) )
))
(declare-fun lt!526511 () ListLongMap!16797)

(declare-fun lt!526504 () ListLongMap!16797)

(assert (=> b!1169282 (= lt!526511 lt!526504)))

(declare-fun lt!526512 () ListLongMap!16797)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1486 (ListLongMap!16797 (_ BitVec 64)) ListLongMap!16797)

(assert (=> b!1169282 (= lt!526504 (-!1486 lt!526512 k!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44301)

(declare-fun zeroValue!944 () V!44301)

(declare-fun lt!526507 () array!75585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13981 0))(
  ( (ValueCellFull!13981 (v!17385 V!44301)) (EmptyCell!13981) )
))
(declare-datatypes ((array!75587 0))(
  ( (array!75588 (arr!36443 (Array (_ BitVec 32) ValueCell!13981)) (size!36979 (_ BitVec 32))) )
))
(declare-fun lt!526508 () array!75587)

(declare-fun getCurrentListMapNoExtraKeys!4878 (array!75585 array!75587 (_ BitVec 32) (_ BitVec 32) V!44301 V!44301 (_ BitVec 32) Int) ListLongMap!16797)

(assert (=> b!1169282 (= lt!526511 (getCurrentListMapNoExtraKeys!4878 lt!526507 lt!526508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75587)

(assert (=> b!1169282 (= lt!526512 (getCurrentListMapNoExtraKeys!4878 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38580 0))(
  ( (Unit!38581) )
))
(declare-fun lt!526510 () Unit!38580)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!713 (array!75585 array!75587 (_ BitVec 32) (_ BitVec 32) V!44301 V!44301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38580)

(assert (=> b!1169282 (= lt!526510 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!713 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169283 () Bool)

(declare-fun e!664555 () Bool)

(declare-fun tp_is_empty!29381 () Bool)

(assert (=> b!1169283 (= e!664555 tp_is_empty!29381)))

(declare-fun b!1169284 () Bool)

(declare-fun e!664560 () Bool)

(declare-fun e!664559 () Bool)

(assert (=> b!1169284 (= e!664560 e!664559)))

(declare-fun res!775843 () Bool)

(assert (=> b!1169284 (=> res!775843 e!664559)))

(assert (=> b!1169284 (= res!775843 (not (= (select (arr!36442 _keys!1208) from!1455) k!934)))))

(declare-fun b!1169285 () Bool)

(declare-fun res!775850 () Bool)

(declare-fun e!664558 () Bool)

(assert (=> b!1169285 (=> (not res!775850) (not e!664558))))

(assert (=> b!1169285 (= res!775850 (and (= (size!36979 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36978 _keys!1208) (size!36979 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!775842 () Bool)

(assert (=> start!99272 (=> (not res!775842) (not e!664558))))

(assert (=> start!99272 (= res!775842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36978 _keys!1208))))))

(assert (=> start!99272 e!664558))

(assert (=> start!99272 tp_is_empty!29381))

(declare-fun array_inv!27854 (array!75585) Bool)

(assert (=> start!99272 (array_inv!27854 _keys!1208)))

(assert (=> start!99272 true))

(assert (=> start!99272 tp!87267))

(declare-fun e!664556 () Bool)

(declare-fun array_inv!27855 (array!75587) Bool)

(assert (=> start!99272 (and (array_inv!27855 _values!996) e!664556)))

(declare-fun b!1169286 () Bool)

(declare-fun e!664557 () Bool)

(assert (=> b!1169286 (= e!664557 tp_is_empty!29381)))

(declare-fun b!1169287 () Bool)

(declare-fun e!664552 () Bool)

(assert (=> b!1169287 (= e!664558 e!664552)))

(declare-fun res!775849 () Bool)

(assert (=> b!1169287 (=> (not res!775849) (not e!664552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75585 (_ BitVec 32)) Bool)

(assert (=> b!1169287 (= res!775849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526507 mask!1564))))

(assert (=> b!1169287 (= lt!526507 (array!75586 (store (arr!36442 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36978 _keys!1208)))))

(declare-fun b!1169288 () Bool)

(declare-fun res!775838 () Bool)

(assert (=> b!1169288 (=> (not res!775838) (not e!664552))))

(declare-datatypes ((List!25566 0))(
  ( (Nil!25563) (Cons!25562 (h!26771 (_ BitVec 64)) (t!37409 List!25566)) )
))
(declare-fun arrayNoDuplicates!0 (array!75585 (_ BitVec 32) List!25566) Bool)

(assert (=> b!1169288 (= res!775838 (arrayNoDuplicates!0 lt!526507 #b00000000000000000000000000000000 Nil!25563))))

(declare-fun b!1169289 () Bool)

(declare-fun mapRes!45899 () Bool)

(assert (=> b!1169289 (= e!664556 (and e!664557 mapRes!45899))))

(declare-fun condMapEmpty!45899 () Bool)

(declare-fun mapDefault!45899 () ValueCell!13981)

