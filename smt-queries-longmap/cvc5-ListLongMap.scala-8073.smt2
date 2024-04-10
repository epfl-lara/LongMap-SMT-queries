; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99304 () Bool)

(assert start!99304)

(declare-fun b_free!24883 () Bool)

(declare-fun b_next!24883 () Bool)

(assert (=> start!99304 (= b_free!24883 (not b_next!24883))))

(declare-fun tp!87362 () Bool)

(declare-fun b_and!40633 () Bool)

(assert (=> start!99304 (= tp!87362 b_and!40633)))

(declare-fun mapIsEmpty!45947 () Bool)

(declare-fun mapRes!45947 () Bool)

(assert (=> mapIsEmpty!45947 mapRes!45947))

(declare-fun b!1170189 () Bool)

(declare-fun res!776580 () Bool)

(declare-fun e!665098 () Bool)

(assert (=> b!1170189 (=> (not res!776580) (not e!665098))))

(declare-datatypes ((array!75645 0))(
  ( (array!75646 (arr!36472 (Array (_ BitVec 32) (_ BitVec 64))) (size!37008 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75645)

(declare-datatypes ((List!25588 0))(
  ( (Nil!25585) (Cons!25584 (h!26793 (_ BitVec 64)) (t!37463 List!25588)) )
))
(declare-fun arrayNoDuplicates!0 (array!75645 (_ BitVec 32) List!25588) Bool)

(assert (=> b!1170189 (= res!776580 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25585))))

(declare-fun b!1170190 () Bool)

(declare-fun res!776579 () Bool)

(assert (=> b!1170190 (=> (not res!776579) (not e!665098))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170190 (= res!776579 (validKeyInArray!0 k!934))))

(declare-fun b!1170191 () Bool)

(declare-fun e!665092 () Bool)

(declare-fun tp_is_empty!29413 () Bool)

(assert (=> b!1170191 (= e!665092 tp_is_empty!29413)))

(declare-fun b!1170192 () Bool)

(declare-fun res!776584 () Bool)

(assert (=> b!1170192 (=> (not res!776584) (not e!665098))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170192 (= res!776584 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37008 _keys!1208))))))

(declare-fun b!1170193 () Bool)

(declare-fun e!665094 () Bool)

(declare-fun e!665096 () Bool)

(assert (=> b!1170193 (= e!665094 e!665096)))

(declare-fun res!776573 () Bool)

(assert (=> b!1170193 (=> res!776573 e!665096)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170193 (= res!776573 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44345 0))(
  ( (V!44346 (val!14763 Int)) )
))
(declare-fun zeroValue!944 () V!44345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13997 0))(
  ( (ValueCellFull!13997 (v!17401 V!44345)) (EmptyCell!13997) )
))
(declare-datatypes ((array!75647 0))(
  ( (array!75648 (arr!36473 (Array (_ BitVec 32) ValueCell!13997)) (size!37009 (_ BitVec 32))) )
))
(declare-fun lt!526995 () array!75647)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!526999 () array!75645)

(declare-fun minValue!944 () V!44345)

(declare-datatypes ((tuple2!18852 0))(
  ( (tuple2!18853 (_1!9437 (_ BitVec 64)) (_2!9437 V!44345)) )
))
(declare-datatypes ((List!25589 0))(
  ( (Nil!25586) (Cons!25585 (h!26794 tuple2!18852) (t!37464 List!25589)) )
))
(declare-datatypes ((ListLongMap!16821 0))(
  ( (ListLongMap!16822 (toList!8426 List!25589)) )
))
(declare-fun lt!526994 () ListLongMap!16821)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4890 (array!75645 array!75647 (_ BitVec 32) (_ BitVec 32) V!44345 V!44345 (_ BitVec 32) Int) ListLongMap!16821)

(assert (=> b!1170193 (= lt!526994 (getCurrentListMapNoExtraKeys!4890 lt!526999 lt!526995 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527002 () V!44345)

(declare-fun _values!996 () array!75647)

(assert (=> b!1170193 (= lt!526995 (array!75648 (store (arr!36473 _values!996) i!673 (ValueCellFull!13997 lt!527002)) (size!37009 _values!996)))))

(declare-fun dynLambda!2867 (Int (_ BitVec 64)) V!44345)

(assert (=> b!1170193 (= lt!527002 (dynLambda!2867 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527000 () ListLongMap!16821)

(assert (=> b!1170193 (= lt!527000 (getCurrentListMapNoExtraKeys!4890 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45947 () Bool)

(declare-fun tp!87363 () Bool)

(assert (=> mapNonEmpty!45947 (= mapRes!45947 (and tp!87363 e!665092))))

(declare-fun mapKey!45947 () (_ BitVec 32))

(declare-fun mapRest!45947 () (Array (_ BitVec 32) ValueCell!13997))

(declare-fun mapValue!45947 () ValueCell!13997)

(assert (=> mapNonEmpty!45947 (= (arr!36473 _values!996) (store mapRest!45947 mapKey!45947 mapValue!45947))))

(declare-fun b!1170194 () Bool)

(declare-fun e!665095 () Bool)

(declare-fun e!665101 () Bool)

(assert (=> b!1170194 (= e!665095 e!665101)))

(declare-fun res!776569 () Bool)

(assert (=> b!1170194 (=> res!776569 e!665101)))

(assert (=> b!1170194 (= res!776569 (not (= (select (arr!36472 _keys!1208) from!1455) k!934)))))

(declare-fun e!665090 () Bool)

(assert (=> b!1170194 e!665090))

(declare-fun res!776576 () Bool)

(assert (=> b!1170194 (=> (not res!776576) (not e!665090))))

(declare-fun lt!527001 () ListLongMap!16821)

(declare-fun +!3755 (ListLongMap!16821 tuple2!18852) ListLongMap!16821)

(declare-fun get!18597 (ValueCell!13997 V!44345) V!44345)

(assert (=> b!1170194 (= res!776576 (= lt!526994 (+!3755 lt!527001 (tuple2!18853 (select (arr!36472 _keys!1208) from!1455) (get!18597 (select (arr!36473 _values!996) from!1455) lt!527002)))))))

(declare-fun b!1170195 () Bool)

(declare-fun e!665091 () Bool)

(assert (=> b!1170195 (= e!665091 (not e!665094))))

(declare-fun res!776581 () Bool)

(assert (=> b!1170195 (=> res!776581 e!665094)))

(assert (=> b!1170195 (= res!776581 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170195 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38604 0))(
  ( (Unit!38605) )
))
(declare-fun lt!527004 () Unit!38604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75645 (_ BitVec 64) (_ BitVec 32)) Unit!38604)

(assert (=> b!1170195 (= lt!527004 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170197 () Bool)

(declare-fun res!776571 () Bool)

(assert (=> b!1170197 (=> (not res!776571) (not e!665098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170197 (= res!776571 (validMask!0 mask!1564))))

(declare-fun b!1170198 () Bool)

(declare-fun res!776572 () Bool)

(assert (=> b!1170198 (=> (not res!776572) (not e!665098))))

(assert (=> b!1170198 (= res!776572 (= (select (arr!36472 _keys!1208) i!673) k!934))))

(declare-fun b!1170199 () Bool)

(declare-fun res!776577 () Bool)

(assert (=> b!1170199 (=> (not res!776577) (not e!665098))))

(assert (=> b!1170199 (= res!776577 (and (= (size!37009 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37008 _keys!1208) (size!37009 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170200 () Bool)

(declare-fun res!776582 () Bool)

(assert (=> b!1170200 (=> (not res!776582) (not e!665091))))

(assert (=> b!1170200 (= res!776582 (arrayNoDuplicates!0 lt!526999 #b00000000000000000000000000000000 Nil!25585))))

(declare-fun b!1170201 () Bool)

(declare-fun e!665097 () Bool)

(assert (=> b!1170201 (= e!665097 tp_is_empty!29413)))

(declare-fun b!1170202 () Bool)

(declare-fun e!665100 () Bool)

(assert (=> b!1170202 (= e!665090 e!665100)))

(declare-fun res!776578 () Bool)

(assert (=> b!1170202 (=> res!776578 e!665100)))

(assert (=> b!1170202 (= res!776578 (not (= (select (arr!36472 _keys!1208) from!1455) k!934)))))

(declare-fun b!1170203 () Bool)

(assert (=> b!1170203 (= e!665101 true)))

(assert (=> b!1170203 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!526998 () Unit!38604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75645 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38604)

(assert (=> b!1170203 (= lt!526998 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170204 () Bool)

(assert (=> b!1170204 (= e!665096 e!665095)))

(declare-fun res!776574 () Bool)

(assert (=> b!1170204 (=> res!776574 e!665095)))

(assert (=> b!1170204 (= res!776574 (not (validKeyInArray!0 (select (arr!36472 _keys!1208) from!1455))))))

(declare-fun lt!526997 () ListLongMap!16821)

(assert (=> b!1170204 (= lt!526997 lt!527001)))

(declare-fun lt!526996 () ListLongMap!16821)

(declare-fun -!1497 (ListLongMap!16821 (_ BitVec 64)) ListLongMap!16821)

(assert (=> b!1170204 (= lt!527001 (-!1497 lt!526996 k!934))))

(assert (=> b!1170204 (= lt!526997 (getCurrentListMapNoExtraKeys!4890 lt!526999 lt!526995 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170204 (= lt!526996 (getCurrentListMapNoExtraKeys!4890 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527003 () Unit!38604)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!724 (array!75645 array!75647 (_ BitVec 32) (_ BitVec 32) V!44345 V!44345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38604)

(assert (=> b!1170204 (= lt!527003 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170205 () Bool)

(declare-fun res!776583 () Bool)

(assert (=> b!1170205 (=> (not res!776583) (not e!665098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75645 (_ BitVec 32)) Bool)

(assert (=> b!1170205 (= res!776583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170196 () Bool)

(declare-fun e!665093 () Bool)

(assert (=> b!1170196 (= e!665093 (and e!665097 mapRes!45947))))

(declare-fun condMapEmpty!45947 () Bool)

(declare-fun mapDefault!45947 () ValueCell!13997)

