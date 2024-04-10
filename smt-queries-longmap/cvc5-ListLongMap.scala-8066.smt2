; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99262 () Bool)

(assert start!99262)

(declare-fun b_free!24841 () Bool)

(declare-fun b_next!24841 () Bool)

(assert (=> start!99262 (= b_free!24841 (not b_next!24841))))

(declare-fun tp!87237 () Bool)

(declare-fun b_and!40549 () Bool)

(assert (=> start!99262 (= tp!87237 b_and!40549)))

(declare-fun b!1169002 () Bool)

(declare-fun e!664387 () Bool)

(declare-fun e!664388 () Bool)

(assert (=> b!1169002 (= e!664387 (not e!664388))))

(declare-fun res!775624 () Bool)

(assert (=> b!1169002 (=> res!775624 e!664388)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169002 (= res!775624 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75565 0))(
  ( (array!75566 (arr!36432 (Array (_ BitVec 32) (_ BitVec 64))) (size!36968 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75565)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169002 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38572 0))(
  ( (Unit!38573) )
))
(declare-fun lt!526359 () Unit!38572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75565 (_ BitVec 64) (_ BitVec 32)) Unit!38572)

(assert (=> b!1169002 (= lt!526359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!45884 () Bool)

(declare-fun mapRes!45884 () Bool)

(assert (=> mapIsEmpty!45884 mapRes!45884))

(declare-fun b!1169003 () Bool)

(declare-fun res!775621 () Bool)

(assert (=> b!1169003 (=> (not res!775621) (not e!664387))))

(declare-fun lt!526362 () array!75565)

(declare-datatypes ((List!25558 0))(
  ( (Nil!25555) (Cons!25554 (h!26763 (_ BitVec 64)) (t!37391 List!25558)) )
))
(declare-fun arrayNoDuplicates!0 (array!75565 (_ BitVec 32) List!25558) Bool)

(assert (=> b!1169003 (= res!775621 (arrayNoDuplicates!0 lt!526362 #b00000000000000000000000000000000 Nil!25555))))

(declare-fun b!1169004 () Bool)

(declare-fun e!664396 () Bool)

(declare-fun e!664392 () Bool)

(assert (=> b!1169004 (= e!664396 e!664392)))

(declare-fun res!775625 () Bool)

(assert (=> b!1169004 (=> res!775625 e!664392)))

(assert (=> b!1169004 (= res!775625 (not (= (select (arr!36432 _keys!1208) from!1455) k!934)))))

(declare-fun b!1169005 () Bool)

(declare-fun res!775620 () Bool)

(declare-fun e!664395 () Bool)

(assert (=> b!1169005 (=> (not res!775620) (not e!664395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169005 (= res!775620 (validKeyInArray!0 k!934))))

(declare-fun b!1169006 () Bool)

(declare-fun e!664393 () Bool)

(declare-fun e!664389 () Bool)

(assert (=> b!1169006 (= e!664393 e!664389)))

(declare-fun res!775613 () Bool)

(assert (=> b!1169006 (=> res!775613 e!664389)))

(assert (=> b!1169006 (= res!775613 (not (validKeyInArray!0 (select (arr!36432 _keys!1208) from!1455))))))

(declare-datatypes ((V!44289 0))(
  ( (V!44290 (val!14742 Int)) )
))
(declare-datatypes ((tuple2!18820 0))(
  ( (tuple2!18821 (_1!9421 (_ BitVec 64)) (_2!9421 V!44289)) )
))
(declare-datatypes ((List!25559 0))(
  ( (Nil!25556) (Cons!25555 (h!26764 tuple2!18820) (t!37392 List!25559)) )
))
(declare-datatypes ((ListLongMap!16789 0))(
  ( (ListLongMap!16790 (toList!8410 List!25559)) )
))
(declare-fun lt!526361 () ListLongMap!16789)

(declare-fun lt!526358 () ListLongMap!16789)

(assert (=> b!1169006 (= lt!526361 lt!526358)))

(declare-fun lt!526357 () ListLongMap!16789)

(declare-fun -!1482 (ListLongMap!16789 (_ BitVec 64)) ListLongMap!16789)

(assert (=> b!1169006 (= lt!526358 (-!1482 lt!526357 k!934))))

(declare-fun zeroValue!944 () V!44289)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!44289)

(declare-datatypes ((ValueCell!13976 0))(
  ( (ValueCellFull!13976 (v!17380 V!44289)) (EmptyCell!13976) )
))
(declare-datatypes ((array!75567 0))(
  ( (array!75568 (arr!36433 (Array (_ BitVec 32) ValueCell!13976)) (size!36969 (_ BitVec 32))) )
))
(declare-fun lt!526354 () array!75567)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4874 (array!75565 array!75567 (_ BitVec 32) (_ BitVec 32) V!44289 V!44289 (_ BitVec 32) Int) ListLongMap!16789)

(assert (=> b!1169006 (= lt!526361 (getCurrentListMapNoExtraKeys!4874 lt!526362 lt!526354 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75567)

(assert (=> b!1169006 (= lt!526357 (getCurrentListMapNoExtraKeys!4874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526353 () Unit!38572)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!709 (array!75565 array!75567 (_ BitVec 32) (_ BitVec 32) V!44289 V!44289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38572)

(assert (=> b!1169006 (= lt!526353 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!709 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169008 () Bool)

(declare-fun e!664394 () Bool)

(declare-fun tp_is_empty!29371 () Bool)

(assert (=> b!1169008 (= e!664394 tp_is_empty!29371)))

(declare-fun b!1169009 () Bool)

(declare-fun res!775616 () Bool)

(assert (=> b!1169009 (=> (not res!775616) (not e!664395))))

(assert (=> b!1169009 (= res!775616 (= (select (arr!36432 _keys!1208) i!673) k!934))))

(declare-fun b!1169010 () Bool)

(declare-fun res!775615 () Bool)

(assert (=> b!1169010 (=> (not res!775615) (not e!664395))))

(assert (=> b!1169010 (= res!775615 (and (= (size!36969 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36968 _keys!1208) (size!36969 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169011 () Bool)

(assert (=> b!1169011 (= e!664392 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169012 () Bool)

(assert (=> b!1169012 (= e!664395 e!664387)))

(declare-fun res!775618 () Bool)

(assert (=> b!1169012 (=> (not res!775618) (not e!664387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75565 (_ BitVec 32)) Bool)

(assert (=> b!1169012 (= res!775618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526362 mask!1564))))

(assert (=> b!1169012 (= lt!526362 (array!75566 (store (arr!36432 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36968 _keys!1208)))))

(declare-fun b!1169013 () Bool)

(assert (=> b!1169013 (= e!664388 e!664393)))

(declare-fun res!775623 () Bool)

(assert (=> b!1169013 (=> res!775623 e!664393)))

(assert (=> b!1169013 (= res!775623 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526355 () ListLongMap!16789)

(assert (=> b!1169013 (= lt!526355 (getCurrentListMapNoExtraKeys!4874 lt!526362 lt!526354 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526356 () V!44289)

(assert (=> b!1169013 (= lt!526354 (array!75568 (store (arr!36433 _values!996) i!673 (ValueCellFull!13976 lt!526356)) (size!36969 _values!996)))))

(declare-fun dynLambda!2853 (Int (_ BitVec 64)) V!44289)

(assert (=> b!1169013 (= lt!526356 (dynLambda!2853 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526360 () ListLongMap!16789)

(assert (=> b!1169013 (= lt!526360 (getCurrentListMapNoExtraKeys!4874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169014 () Bool)

(declare-fun res!775614 () Bool)

(assert (=> b!1169014 (=> (not res!775614) (not e!664395))))

(assert (=> b!1169014 (= res!775614 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25555))))

(declare-fun res!775626 () Bool)

(assert (=> start!99262 (=> (not res!775626) (not e!664395))))

(assert (=> start!99262 (= res!775626 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36968 _keys!1208))))))

(assert (=> start!99262 e!664395))

(assert (=> start!99262 tp_is_empty!29371))

(declare-fun array_inv!27846 (array!75565) Bool)

(assert (=> start!99262 (array_inv!27846 _keys!1208)))

(assert (=> start!99262 true))

(assert (=> start!99262 tp!87237))

(declare-fun e!664390 () Bool)

(declare-fun array_inv!27847 (array!75567) Bool)

(assert (=> start!99262 (and (array_inv!27847 _values!996) e!664390)))

(declare-fun b!1169007 () Bool)

(declare-fun e!664391 () Bool)

(assert (=> b!1169007 (= e!664391 tp_is_empty!29371)))

(declare-fun mapNonEmpty!45884 () Bool)

(declare-fun tp!87236 () Bool)

(assert (=> mapNonEmpty!45884 (= mapRes!45884 (and tp!87236 e!664394))))

(declare-fun mapValue!45884 () ValueCell!13976)

(declare-fun mapRest!45884 () (Array (_ BitVec 32) ValueCell!13976))

(declare-fun mapKey!45884 () (_ BitVec 32))

(assert (=> mapNonEmpty!45884 (= (arr!36433 _values!996) (store mapRest!45884 mapKey!45884 mapValue!45884))))

(declare-fun b!1169015 () Bool)

(assert (=> b!1169015 (= e!664390 (and e!664391 mapRes!45884))))

(declare-fun condMapEmpty!45884 () Bool)

(declare-fun mapDefault!45884 () ValueCell!13976)

