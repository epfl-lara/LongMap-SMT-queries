; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99314 () Bool)

(assert start!99314)

(declare-fun b_free!24893 () Bool)

(declare-fun b_next!24893 () Bool)

(assert (=> start!99314 (= b_free!24893 (not b_next!24893))))

(declare-fun tp!87392 () Bool)

(declare-fun b_and!40653 () Bool)

(assert (=> start!99314 (= tp!87392 b_and!40653)))

(declare-fun mapNonEmpty!45962 () Bool)

(declare-fun mapRes!45962 () Bool)

(declare-fun tp!87393 () Bool)

(declare-fun e!665272 () Bool)

(assert (=> mapNonEmpty!45962 (= mapRes!45962 (and tp!87393 e!665272))))

(declare-datatypes ((V!44357 0))(
  ( (V!44358 (val!14768 Int)) )
))
(declare-datatypes ((ValueCell!14002 0))(
  ( (ValueCellFull!14002 (v!17406 V!44357)) (EmptyCell!14002) )
))
(declare-fun mapRest!45962 () (Array (_ BitVec 32) ValueCell!14002))

(declare-fun mapKey!45962 () (_ BitVec 32))

(declare-datatypes ((array!75665 0))(
  ( (array!75666 (arr!36482 (Array (_ BitVec 32) ValueCell!14002)) (size!37018 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75665)

(declare-fun mapValue!45962 () ValueCell!14002)

(assert (=> mapNonEmpty!45962 (= (arr!36482 _values!996) (store mapRest!45962 mapKey!45962 mapValue!45962))))

(declare-fun b!1170484 () Bool)

(declare-fun res!776812 () Bool)

(declare-fun e!665276 () Bool)

(assert (=> b!1170484 (=> (not res!776812) (not e!665276))))

(declare-datatypes ((array!75667 0))(
  ( (array!75668 (arr!36483 (Array (_ BitVec 32) (_ BitVec 64))) (size!37019 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75667)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1170484 (= res!776812 (= (select (arr!36483 _keys!1208) i!673) k!934))))

(declare-fun b!1170485 () Bool)

(declare-fun e!665270 () Bool)

(declare-fun e!665281 () Bool)

(assert (=> b!1170485 (= e!665270 e!665281)))

(declare-fun res!776816 () Bool)

(assert (=> b!1170485 (=> res!776816 e!665281)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170485 (= res!776816 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18860 0))(
  ( (tuple2!18861 (_1!9441 (_ BitVec 64)) (_2!9441 V!44357)) )
))
(declare-datatypes ((List!25596 0))(
  ( (Nil!25593) (Cons!25592 (h!26801 tuple2!18860) (t!37481 List!25596)) )
))
(declare-datatypes ((ListLongMap!16829 0))(
  ( (ListLongMap!16830 (toList!8430 List!25596)) )
))
(declare-fun lt!527162 () ListLongMap!16829)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527166 () array!75667)

(declare-fun minValue!944 () V!44357)

(declare-fun lt!527159 () array!75665)

(declare-fun zeroValue!944 () V!44357)

(declare-fun getCurrentListMapNoExtraKeys!4894 (array!75667 array!75665 (_ BitVec 32) (_ BitVec 32) V!44357 V!44357 (_ BitVec 32) Int) ListLongMap!16829)

(assert (=> b!1170485 (= lt!527162 (getCurrentListMapNoExtraKeys!4894 lt!527166 lt!527159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527167 () V!44357)

(assert (=> b!1170485 (= lt!527159 (array!75666 (store (arr!36482 _values!996) i!673 (ValueCellFull!14002 lt!527167)) (size!37018 _values!996)))))

(declare-fun dynLambda!2871 (Int (_ BitVec 64)) V!44357)

(assert (=> b!1170485 (= lt!527167 (dynLambda!2871 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527163 () ListLongMap!16829)

(assert (=> b!1170485 (= lt!527163 (getCurrentListMapNoExtraKeys!4894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170486 () Bool)

(declare-fun res!776814 () Bool)

(assert (=> b!1170486 (=> (not res!776814) (not e!665276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170486 (= res!776814 (validKeyInArray!0 k!934))))

(declare-fun b!1170487 () Bool)

(declare-fun e!665277 () Bool)

(declare-fun e!665275 () Bool)

(assert (=> b!1170487 (= e!665277 e!665275)))

(declare-fun res!776823 () Bool)

(assert (=> b!1170487 (=> res!776823 e!665275)))

(assert (=> b!1170487 (= res!776823 (not (= (select (arr!36483 _keys!1208) from!1455) k!934)))))

(declare-fun b!1170488 () Bool)

(declare-fun res!776811 () Bool)

(declare-fun e!665273 () Bool)

(assert (=> b!1170488 (=> (not res!776811) (not e!665273))))

(declare-datatypes ((List!25597 0))(
  ( (Nil!25594) (Cons!25593 (h!26802 (_ BitVec 64)) (t!37482 List!25597)) )
))
(declare-fun arrayNoDuplicates!0 (array!75667 (_ BitVec 32) List!25597) Bool)

(assert (=> b!1170488 (= res!776811 (arrayNoDuplicates!0 lt!527166 #b00000000000000000000000000000000 Nil!25594))))

(declare-fun b!1170489 () Bool)

(assert (=> b!1170489 (= e!665273 (not e!665270))))

(declare-fun res!776818 () Bool)

(assert (=> b!1170489 (=> res!776818 e!665270)))

(assert (=> b!1170489 (= res!776818 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170489 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38614 0))(
  ( (Unit!38615) )
))
(declare-fun lt!527165 () Unit!38614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75667 (_ BitVec 64) (_ BitVec 32)) Unit!38614)

(assert (=> b!1170489 (= lt!527165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170490 () Bool)

(declare-fun res!776809 () Bool)

(assert (=> b!1170490 (=> (not res!776809) (not e!665276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170490 (= res!776809 (validMask!0 mask!1564))))

(declare-fun b!1170491 () Bool)

(declare-fun e!665274 () Bool)

(declare-fun tp_is_empty!29423 () Bool)

(assert (=> b!1170491 (= e!665274 tp_is_empty!29423)))

(declare-fun b!1170492 () Bool)

(declare-fun e!665271 () Bool)

(assert (=> b!1170492 (= e!665271 (and e!665274 mapRes!45962))))

(declare-fun condMapEmpty!45962 () Bool)

(declare-fun mapDefault!45962 () ValueCell!14002)

