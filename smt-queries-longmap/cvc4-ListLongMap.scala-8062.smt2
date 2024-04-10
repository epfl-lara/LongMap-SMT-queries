; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99216 () Bool)

(assert start!99216)

(declare-fun b_free!24821 () Bool)

(declare-fun b_next!24821 () Bool)

(assert (=> start!99216 (= b_free!24821 (not b_next!24821))))

(declare-fun tp!87173 () Bool)

(declare-fun b_and!40491 () Bool)

(assert (=> start!99216 (= tp!87173 b_and!40491)))

(declare-fun mapIsEmpty!45851 () Bool)

(declare-fun mapRes!45851 () Bool)

(assert (=> mapIsEmpty!45851 mapRes!45851))

(declare-fun b!1168355 () Bool)

(declare-fun e!664020 () Bool)

(declare-fun e!664022 () Bool)

(assert (=> b!1168355 (= e!664020 e!664022)))

(declare-fun res!775165 () Bool)

(assert (=> b!1168355 (=> (not res!775165) (not e!664022))))

(declare-datatypes ((array!75523 0))(
  ( (array!75524 (arr!36412 (Array (_ BitVec 32) (_ BitVec 64))) (size!36948 (_ BitVec 32))) )
))
(declare-fun lt!525984 () array!75523)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75523 (_ BitVec 32)) Bool)

(assert (=> b!1168355 (= res!775165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525984 mask!1564))))

(declare-fun _keys!1208 () array!75523)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168355 (= lt!525984 (array!75524 (store (arr!36412 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36948 _keys!1208)))))

(declare-fun b!1168356 () Bool)

(declare-fun res!775169 () Bool)

(assert (=> b!1168356 (=> (not res!775169) (not e!664020))))

(assert (=> b!1168356 (= res!775169 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36948 _keys!1208))))))

(declare-fun b!1168357 () Bool)

(declare-fun e!664025 () Bool)

(declare-fun tp_is_empty!29351 () Bool)

(assert (=> b!1168357 (= e!664025 tp_is_empty!29351)))

(declare-fun b!1168358 () Bool)

(declare-fun res!775168 () Bool)

(assert (=> b!1168358 (=> (not res!775168) (not e!664020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168358 (= res!775168 (validMask!0 mask!1564))))

(declare-fun res!775167 () Bool)

(assert (=> start!99216 (=> (not res!775167) (not e!664020))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99216 (= res!775167 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36948 _keys!1208))))))

(assert (=> start!99216 e!664020))

(assert (=> start!99216 tp_is_empty!29351))

(declare-fun array_inv!27834 (array!75523) Bool)

(assert (=> start!99216 (array_inv!27834 _keys!1208)))

(assert (=> start!99216 true))

(assert (=> start!99216 tp!87173))

(declare-datatypes ((V!44261 0))(
  ( (V!44262 (val!14732 Int)) )
))
(declare-datatypes ((ValueCell!13966 0))(
  ( (ValueCellFull!13966 (v!17369 V!44261)) (EmptyCell!13966) )
))
(declare-datatypes ((array!75525 0))(
  ( (array!75526 (arr!36413 (Array (_ BitVec 32) ValueCell!13966)) (size!36949 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75525)

(declare-fun e!664024 () Bool)

(declare-fun array_inv!27835 (array!75525) Bool)

(assert (=> start!99216 (and (array_inv!27835 _values!996) e!664024)))

(declare-fun mapNonEmpty!45851 () Bool)

(declare-fun tp!87174 () Bool)

(declare-fun e!664026 () Bool)

(assert (=> mapNonEmpty!45851 (= mapRes!45851 (and tp!87174 e!664026))))

(declare-fun mapKey!45851 () (_ BitVec 32))

(declare-fun mapValue!45851 () ValueCell!13966)

(declare-fun mapRest!45851 () (Array (_ BitVec 32) ValueCell!13966))

(assert (=> mapNonEmpty!45851 (= (arr!36413 _values!996) (store mapRest!45851 mapKey!45851 mapValue!45851))))

(declare-fun b!1168359 () Bool)

(declare-fun e!664023 () Bool)

(declare-fun e!664019 () Bool)

(assert (=> b!1168359 (= e!664023 e!664019)))

(declare-fun res!775172 () Bool)

(assert (=> b!1168359 (=> res!775172 e!664019)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168359 (= res!775172 (not (validKeyInArray!0 (select (arr!36412 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!44261)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525985 () array!75525)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!44261)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18800 0))(
  ( (tuple2!18801 (_1!9411 (_ BitVec 64)) (_2!9411 V!44261)) )
))
(declare-datatypes ((List!25540 0))(
  ( (Nil!25537) (Cons!25536 (h!26745 tuple2!18800) (t!37353 List!25540)) )
))
(declare-datatypes ((ListLongMap!16769 0))(
  ( (ListLongMap!16770 (toList!8400 List!25540)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4864 (array!75523 array!75525 (_ BitVec 32) (_ BitVec 32) V!44261 V!44261 (_ BitVec 32) Int) ListLongMap!16769)

(declare-fun -!1473 (ListLongMap!16769 (_ BitVec 64)) ListLongMap!16769)

(assert (=> b!1168359 (= (getCurrentListMapNoExtraKeys!4864 lt!525984 lt!525985 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1473 (getCurrentListMapNoExtraKeys!4864 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38552 0))(
  ( (Unit!38553) )
))
(declare-fun lt!525983 () Unit!38552)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!700 (array!75523 array!75525 (_ BitVec 32) (_ BitVec 32) V!44261 V!44261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38552)

(assert (=> b!1168359 (= lt!525983 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168360 () Bool)

(declare-fun res!775171 () Bool)

(assert (=> b!1168360 (=> (not res!775171) (not e!664020))))

(declare-datatypes ((List!25541 0))(
  ( (Nil!25538) (Cons!25537 (h!26746 (_ BitVec 64)) (t!37354 List!25541)) )
))
(declare-fun arrayNoDuplicates!0 (array!75523 (_ BitVec 32) List!25541) Bool)

(assert (=> b!1168360 (= res!775171 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25538))))

(declare-fun b!1168361 () Bool)

(assert (=> b!1168361 (= e!664019 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36948 _keys!1208))))))

(declare-fun b!1168362 () Bool)

(declare-fun res!775161 () Bool)

(assert (=> b!1168362 (=> (not res!775161) (not e!664020))))

(assert (=> b!1168362 (= res!775161 (and (= (size!36949 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36948 _keys!1208) (size!36949 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168363 () Bool)

(declare-fun e!664018 () Bool)

(assert (=> b!1168363 (= e!664018 e!664023)))

(declare-fun res!775160 () Bool)

(assert (=> b!1168363 (=> res!775160 e!664023)))

(assert (=> b!1168363 (= res!775160 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525982 () ListLongMap!16769)

(assert (=> b!1168363 (= lt!525982 (getCurrentListMapNoExtraKeys!4864 lt!525984 lt!525985 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2845 (Int (_ BitVec 64)) V!44261)

(assert (=> b!1168363 (= lt!525985 (array!75526 (store (arr!36413 _values!996) i!673 (ValueCellFull!13966 (dynLambda!2845 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36949 _values!996)))))

(declare-fun lt!525987 () ListLongMap!16769)

(assert (=> b!1168363 (= lt!525987 (getCurrentListMapNoExtraKeys!4864 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168364 () Bool)

(declare-fun res!775170 () Bool)

(assert (=> b!1168364 (=> (not res!775170) (not e!664020))))

(assert (=> b!1168364 (= res!775170 (= (select (arr!36412 _keys!1208) i!673) k!934))))

(declare-fun b!1168365 () Bool)

(assert (=> b!1168365 (= e!664026 tp_is_empty!29351)))

(declare-fun b!1168366 () Bool)

(assert (=> b!1168366 (= e!664022 (not e!664018))))

(declare-fun res!775166 () Bool)

(assert (=> b!1168366 (=> res!775166 e!664018)))

(assert (=> b!1168366 (= res!775166 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168366 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!525986 () Unit!38552)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75523 (_ BitVec 64) (_ BitVec 32)) Unit!38552)

(assert (=> b!1168366 (= lt!525986 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1168367 () Bool)

(assert (=> b!1168367 (= e!664024 (and e!664025 mapRes!45851))))

(declare-fun condMapEmpty!45851 () Bool)

(declare-fun mapDefault!45851 () ValueCell!13966)

