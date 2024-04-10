; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99370 () Bool)

(assert start!99370)

(declare-fun b_free!24949 () Bool)

(declare-fun b_next!24949 () Bool)

(assert (=> start!99370 (= b_free!24949 (not b_next!24949))))

(declare-fun tp!87560 () Bool)

(declare-fun b_and!40765 () Bool)

(assert (=> start!99370 (= tp!87560 b_and!40765)))

(declare-fun b!1172331 () Bool)

(declare-fun res!778359 () Bool)

(declare-fun e!666351 () Bool)

(assert (=> b!1172331 (=> (not res!778359) (not e!666351))))

(declare-datatypes ((array!75771 0))(
  ( (array!75772 (arr!36535 (Array (_ BitVec 32) (_ BitVec 64))) (size!37071 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75771)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172331 (= res!778359 (= (select (arr!36535 _keys!1208) i!673) k!934))))

(declare-fun b!1172332 () Bool)

(declare-fun res!778351 () Bool)

(assert (=> b!1172332 (=> (not res!778351) (not e!666351))))

(declare-datatypes ((List!25640 0))(
  ( (Nil!25637) (Cons!25636 (h!26845 (_ BitVec 64)) (t!37581 List!25640)) )
))
(declare-fun arrayNoDuplicates!0 (array!75771 (_ BitVec 32) List!25640) Bool)

(assert (=> b!1172332 (= res!778351 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25637))))

(declare-fun b!1172333 () Bool)

(declare-fun e!666343 () Bool)

(declare-fun tp_is_empty!29479 () Bool)

(assert (=> b!1172333 (= e!666343 tp_is_empty!29479)))

(declare-fun b!1172334 () Bool)

(declare-fun res!778361 () Bool)

(declare-fun e!666354 () Bool)

(assert (=> b!1172334 (=> (not res!778361) (not e!666354))))

(declare-fun lt!528218 () array!75771)

(assert (=> b!1172334 (= res!778361 (arrayNoDuplicates!0 lt!528218 #b00000000000000000000000000000000 Nil!25637))))

(declare-fun b!1172335 () Bool)

(declare-fun res!778366 () Bool)

(assert (=> b!1172335 (=> (not res!778366) (not e!666351))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75771 (_ BitVec 32)) Bool)

(assert (=> b!1172335 (= res!778366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172336 () Bool)

(declare-fun e!666345 () Bool)

(declare-fun e!666352 () Bool)

(assert (=> b!1172336 (= e!666345 e!666352)))

(declare-fun res!778364 () Bool)

(assert (=> b!1172336 (=> res!778364 e!666352)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172336 (= res!778364 (or (bvsge (size!37071 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37071 _keys!1208)) (bvsge from!1455 (size!37071 _keys!1208))))))

(assert (=> b!1172336 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25637)))

(declare-datatypes ((Unit!38656 0))(
  ( (Unit!38657) )
))
(declare-fun lt!528221 () Unit!38656)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75771 (_ BitVec 32) (_ BitVec 32)) Unit!38656)

(assert (=> b!1172336 (= lt!528221 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172336 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528220 () Unit!38656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75771 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38656)

(assert (=> b!1172336 (= lt!528220 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172337 () Bool)

(declare-fun e!666350 () Bool)

(assert (=> b!1172337 (= e!666350 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1172338 () Bool)

(assert (=> b!1172338 (= e!666352 true)))

(declare-fun lt!528223 () Bool)

(declare-fun contains!6855 (List!25640 (_ BitVec 64)) Bool)

(assert (=> b!1172338 (= lt!528223 (contains!6855 Nil!25637 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172339 () Bool)

(declare-fun res!778350 () Bool)

(assert (=> b!1172339 (=> (not res!778350) (not e!666351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172339 (= res!778350 (validKeyInArray!0 k!934))))

(declare-fun b!1172340 () Bool)

(declare-fun e!666355 () Bool)

(assert (=> b!1172340 (= e!666355 tp_is_empty!29479)))

(declare-fun b!1172341 () Bool)

(assert (=> b!1172341 (= e!666351 e!666354)))

(declare-fun res!778365 () Bool)

(assert (=> b!1172341 (=> (not res!778365) (not e!666354))))

(assert (=> b!1172341 (= res!778365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528218 mask!1564))))

(assert (=> b!1172341 (= lt!528218 (array!75772 (store (arr!36535 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37071 _keys!1208)))))

(declare-fun b!1172342 () Bool)

(declare-fun e!666348 () Bool)

(declare-fun e!666349 () Bool)

(assert (=> b!1172342 (= e!666348 e!666349)))

(declare-fun res!778352 () Bool)

(assert (=> b!1172342 (=> res!778352 e!666349)))

(assert (=> b!1172342 (= res!778352 (not (validKeyInArray!0 (select (arr!36535 _keys!1208) from!1455))))))

(declare-datatypes ((V!44433 0))(
  ( (V!44434 (val!14796 Int)) )
))
(declare-datatypes ((tuple2!18904 0))(
  ( (tuple2!18905 (_1!9463 (_ BitVec 64)) (_2!9463 V!44433)) )
))
(declare-datatypes ((List!25641 0))(
  ( (Nil!25638) (Cons!25637 (h!26846 tuple2!18904) (t!37582 List!25641)) )
))
(declare-datatypes ((ListLongMap!16873 0))(
  ( (ListLongMap!16874 (toList!8452 List!25641)) )
))
(declare-fun lt!528224 () ListLongMap!16873)

(declare-fun lt!528222 () ListLongMap!16873)

(assert (=> b!1172342 (= lt!528224 lt!528222)))

(declare-fun lt!528225 () ListLongMap!16873)

(declare-fun -!1519 (ListLongMap!16873 (_ BitVec 64)) ListLongMap!16873)

(assert (=> b!1172342 (= lt!528222 (-!1519 lt!528225 k!934))))

(declare-fun zeroValue!944 () V!44433)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44433)

(declare-datatypes ((ValueCell!14030 0))(
  ( (ValueCellFull!14030 (v!17434 V!44433)) (EmptyCell!14030) )
))
(declare-datatypes ((array!75773 0))(
  ( (array!75774 (arr!36536 (Array (_ BitVec 32) ValueCell!14030)) (size!37072 (_ BitVec 32))) )
))
(declare-fun lt!528213 () array!75773)

(declare-fun getCurrentListMapNoExtraKeys!4916 (array!75771 array!75773 (_ BitVec 32) (_ BitVec 32) V!44433 V!44433 (_ BitVec 32) Int) ListLongMap!16873)

(assert (=> b!1172342 (= lt!528224 (getCurrentListMapNoExtraKeys!4916 lt!528218 lt!528213 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75773)

(assert (=> b!1172342 (= lt!528225 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528219 () Unit!38656)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!746 (array!75771 array!75773 (_ BitVec 32) (_ BitVec 32) V!44433 V!44433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38656)

(assert (=> b!1172342 (= lt!528219 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!746 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172343 () Bool)

(declare-fun e!666346 () Bool)

(assert (=> b!1172343 (= e!666346 e!666350)))

(declare-fun res!778349 () Bool)

(assert (=> b!1172343 (=> res!778349 e!666350)))

(assert (=> b!1172343 (= res!778349 (not (= (select (arr!36535 _keys!1208) from!1455) k!934)))))

(declare-fun b!1172344 () Bool)

(declare-fun res!778362 () Bool)

(assert (=> b!1172344 (=> (not res!778362) (not e!666351))))

(assert (=> b!1172344 (= res!778362 (and (= (size!37072 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37071 _keys!1208) (size!37072 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46046 () Bool)

(declare-fun mapRes!46046 () Bool)

(declare-fun tp!87561 () Bool)

(assert (=> mapNonEmpty!46046 (= mapRes!46046 (and tp!87561 e!666355))))

(declare-fun mapRest!46046 () (Array (_ BitVec 32) ValueCell!14030))

(declare-fun mapKey!46046 () (_ BitVec 32))

(declare-fun mapValue!46046 () ValueCell!14030)

(assert (=> mapNonEmpty!46046 (= (arr!36536 _values!996) (store mapRest!46046 mapKey!46046 mapValue!46046))))

(declare-fun res!778356 () Bool)

(assert (=> start!99370 (=> (not res!778356) (not e!666351))))

(assert (=> start!99370 (= res!778356 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37071 _keys!1208))))))

(assert (=> start!99370 e!666351))

(assert (=> start!99370 tp_is_empty!29479))

(declare-fun array_inv!27918 (array!75771) Bool)

(assert (=> start!99370 (array_inv!27918 _keys!1208)))

(assert (=> start!99370 true))

(assert (=> start!99370 tp!87560))

(declare-fun e!666344 () Bool)

(declare-fun array_inv!27919 (array!75773) Bool)

(assert (=> start!99370 (and (array_inv!27919 _values!996) e!666344)))

(declare-fun b!1172345 () Bool)

(declare-fun res!778357 () Bool)

(assert (=> b!1172345 (=> (not res!778357) (not e!666351))))

(assert (=> b!1172345 (= res!778357 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37071 _keys!1208))))))

(declare-fun b!1172346 () Bool)

(declare-fun res!778348 () Bool)

(assert (=> b!1172346 (=> res!778348 e!666352)))

(declare-fun noDuplicate!1617 (List!25640) Bool)

(assert (=> b!1172346 (= res!778348 (not (noDuplicate!1617 Nil!25637)))))

(declare-fun b!1172347 () Bool)

(declare-fun e!666353 () Bool)

(assert (=> b!1172347 (= e!666353 e!666348)))

(declare-fun res!778360 () Bool)

(assert (=> b!1172347 (=> res!778360 e!666348)))

(assert (=> b!1172347 (= res!778360 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!528214 () ListLongMap!16873)

(assert (=> b!1172347 (= lt!528214 (getCurrentListMapNoExtraKeys!4916 lt!528218 lt!528213 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528215 () V!44433)

(assert (=> b!1172347 (= lt!528213 (array!75774 (store (arr!36536 _values!996) i!673 (ValueCellFull!14030 lt!528215)) (size!37072 _values!996)))))

(declare-fun dynLambda!2888 (Int (_ BitVec 64)) V!44433)

(assert (=> b!1172347 (= lt!528215 (dynLambda!2888 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528216 () ListLongMap!16873)

(assert (=> b!1172347 (= lt!528216 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172348 () Bool)

(assert (=> b!1172348 (= e!666344 (and e!666343 mapRes!46046))))

(declare-fun condMapEmpty!46046 () Bool)

(declare-fun mapDefault!46046 () ValueCell!14030)

