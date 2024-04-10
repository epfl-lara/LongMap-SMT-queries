; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99128 () Bool)

(assert start!99128)

(declare-fun b_free!24733 () Bool)

(declare-fun b_next!24733 () Bool)

(assert (=> start!99128 (= b_free!24733 (not b_next!24733))))

(declare-fun tp!86910 () Bool)

(declare-fun b_and!40315 () Bool)

(assert (=> start!99128 (= tp!86910 b_and!40315)))

(declare-fun b!1166279 () Bool)

(declare-fun res!773571 () Bool)

(declare-fun e!662957 () Bool)

(assert (=> b!1166279 (=> (not res!773571) (not e!662957))))

(declare-datatypes ((array!75357 0))(
  ( (array!75358 (arr!36329 (Array (_ BitVec 32) (_ BitVec 64))) (size!36865 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75357)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75357 (_ BitVec 32)) Bool)

(assert (=> b!1166279 (= res!773571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166280 () Bool)

(declare-fun res!773573 () Bool)

(declare-fun e!662961 () Bool)

(assert (=> b!1166280 (=> (not res!773573) (not e!662961))))

(declare-fun lt!525192 () array!75357)

(declare-datatypes ((List!25471 0))(
  ( (Nil!25468) (Cons!25467 (h!26676 (_ BitVec 64)) (t!37196 List!25471)) )
))
(declare-fun arrayNoDuplicates!0 (array!75357 (_ BitVec 32) List!25471) Bool)

(assert (=> b!1166280 (= res!773573 (arrayNoDuplicates!0 lt!525192 #b00000000000000000000000000000000 Nil!25468))))

(declare-fun b!1166281 () Bool)

(declare-fun res!773577 () Bool)

(assert (=> b!1166281 (=> (not res!773577) (not e!662957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166281 (= res!773577 (validMask!0 mask!1564))))

(declare-fun b!1166282 () Bool)

(declare-fun res!773572 () Bool)

(assert (=> b!1166282 (=> (not res!773572) (not e!662957))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166282 (= res!773572 (= (select (arr!36329 _keys!1208) i!673) k!934))))

(declare-fun res!773579 () Bool)

(assert (=> start!99128 (=> (not res!773579) (not e!662957))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99128 (= res!773579 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36865 _keys!1208))))))

(assert (=> start!99128 e!662957))

(declare-fun tp_is_empty!29263 () Bool)

(assert (=> start!99128 tp_is_empty!29263))

(declare-fun array_inv!27784 (array!75357) Bool)

(assert (=> start!99128 (array_inv!27784 _keys!1208)))

(assert (=> start!99128 true))

(assert (=> start!99128 tp!86910))

(declare-datatypes ((V!44145 0))(
  ( (V!44146 (val!14688 Int)) )
))
(declare-datatypes ((ValueCell!13922 0))(
  ( (ValueCellFull!13922 (v!17325 V!44145)) (EmptyCell!13922) )
))
(declare-datatypes ((array!75359 0))(
  ( (array!75360 (arr!36330 (Array (_ BitVec 32) ValueCell!13922)) (size!36866 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75359)

(declare-fun e!662958 () Bool)

(declare-fun array_inv!27785 (array!75359) Bool)

(assert (=> start!99128 (and (array_inv!27785 _values!996) e!662958)))

(declare-fun mapIsEmpty!45719 () Bool)

(declare-fun mapRes!45719 () Bool)

(assert (=> mapIsEmpty!45719 mapRes!45719))

(declare-fun b!1166283 () Bool)

(declare-fun e!662955 () Bool)

(assert (=> b!1166283 (= e!662955 tp_is_empty!29263)))

(declare-fun b!1166284 () Bool)

(declare-fun res!773576 () Bool)

(assert (=> b!1166284 (=> (not res!773576) (not e!662957))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166284 (= res!773576 (and (= (size!36866 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36865 _keys!1208) (size!36866 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166285 () Bool)

(assert (=> b!1166285 (= e!662957 e!662961)))

(declare-fun res!773570 () Bool)

(assert (=> b!1166285 (=> (not res!773570) (not e!662961))))

(assert (=> b!1166285 (= res!773570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525192 mask!1564))))

(assert (=> b!1166285 (= lt!525192 (array!75358 (store (arr!36329 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36865 _keys!1208)))))

(declare-fun b!1166286 () Bool)

(declare-fun res!773569 () Bool)

(assert (=> b!1166286 (=> (not res!773569) (not e!662957))))

(assert (=> b!1166286 (= res!773569 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25468))))

(declare-fun b!1166287 () Bool)

(declare-fun e!662959 () Bool)

(assert (=> b!1166287 (= e!662959 true)))

(declare-fun zeroValue!944 () V!44145)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44145)

(declare-fun lt!525195 () array!75359)

(declare-datatypes ((tuple2!18732 0))(
  ( (tuple2!18733 (_1!9377 (_ BitVec 64)) (_2!9377 V!44145)) )
))
(declare-datatypes ((List!25472 0))(
  ( (Nil!25469) (Cons!25468 (h!26677 tuple2!18732) (t!37197 List!25472)) )
))
(declare-datatypes ((ListLongMap!16701 0))(
  ( (ListLongMap!16702 (toList!8366 List!25472)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4830 (array!75357 array!75359 (_ BitVec 32) (_ BitVec 32) V!44145 V!44145 (_ BitVec 32) Int) ListLongMap!16701)

(declare-fun -!1443 (ListLongMap!16701 (_ BitVec 64)) ListLongMap!16701)

(assert (=> b!1166287 (= (getCurrentListMapNoExtraKeys!4830 lt!525192 lt!525195 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1443 (getCurrentListMapNoExtraKeys!4830 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38486 0))(
  ( (Unit!38487) )
))
(declare-fun lt!525194 () Unit!38486)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!670 (array!75357 array!75359 (_ BitVec 32) (_ BitVec 32) V!44145 V!44145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38486)

(assert (=> b!1166287 (= lt!525194 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166288 () Bool)

(declare-fun res!773578 () Bool)

(assert (=> b!1166288 (=> (not res!773578) (not e!662957))))

(assert (=> b!1166288 (= res!773578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36865 _keys!1208))))))

(declare-fun b!1166289 () Bool)

(declare-fun e!662956 () Bool)

(assert (=> b!1166289 (= e!662956 e!662959)))

(declare-fun res!773575 () Bool)

(assert (=> b!1166289 (=> res!773575 e!662959)))

(assert (=> b!1166289 (= res!773575 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525193 () ListLongMap!16701)

(assert (=> b!1166289 (= lt!525193 (getCurrentListMapNoExtraKeys!4830 lt!525192 lt!525195 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2819 (Int (_ BitVec 64)) V!44145)

(assert (=> b!1166289 (= lt!525195 (array!75360 (store (arr!36330 _values!996) i!673 (ValueCellFull!13922 (dynLambda!2819 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36866 _values!996)))))

(declare-fun lt!525191 () ListLongMap!16701)

(assert (=> b!1166289 (= lt!525191 (getCurrentListMapNoExtraKeys!4830 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166290 () Bool)

(assert (=> b!1166290 (= e!662961 (not e!662956))))

(declare-fun res!773568 () Bool)

(assert (=> b!1166290 (=> res!773568 e!662956)))

(assert (=> b!1166290 (= res!773568 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166290 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!525190 () Unit!38486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75357 (_ BitVec 64) (_ BitVec 32)) Unit!38486)

(assert (=> b!1166290 (= lt!525190 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1166291 () Bool)

(declare-fun res!773574 () Bool)

(assert (=> b!1166291 (=> (not res!773574) (not e!662957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166291 (= res!773574 (validKeyInArray!0 k!934))))

(declare-fun b!1166292 () Bool)

(declare-fun e!662960 () Bool)

(assert (=> b!1166292 (= e!662960 tp_is_empty!29263)))

(declare-fun mapNonEmpty!45719 () Bool)

(declare-fun tp!86909 () Bool)

(assert (=> mapNonEmpty!45719 (= mapRes!45719 (and tp!86909 e!662955))))

(declare-fun mapValue!45719 () ValueCell!13922)

(declare-fun mapKey!45719 () (_ BitVec 32))

(declare-fun mapRest!45719 () (Array (_ BitVec 32) ValueCell!13922))

(assert (=> mapNonEmpty!45719 (= (arr!36330 _values!996) (store mapRest!45719 mapKey!45719 mapValue!45719))))

(declare-fun b!1166293 () Bool)

(assert (=> b!1166293 (= e!662958 (and e!662960 mapRes!45719))))

(declare-fun condMapEmpty!45719 () Bool)

(declare-fun mapDefault!45719 () ValueCell!13922)

