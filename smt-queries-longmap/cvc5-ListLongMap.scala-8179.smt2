; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99940 () Bool)

(assert start!99940)

(declare-fun b_free!25519 () Bool)

(declare-fun b_next!25519 () Bool)

(assert (=> start!99940 (= b_free!25519 (not b_next!25519))))

(declare-fun tp!89271 () Bool)

(declare-fun b_and!41905 () Bool)

(assert (=> start!99940 (= tp!89271 b_and!41905)))

(declare-fun b!1189870 () Bool)

(declare-fun res!791280 () Bool)

(declare-fun e!676468 () Bool)

(assert (=> b!1189870 (=> (not res!791280) (not e!676468))))

(declare-datatypes ((array!76889 0))(
  ( (array!76890 (arr!37094 (Array (_ BitVec 32) (_ BitVec 64))) (size!37630 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76889)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189870 (= res!791280 (= (select (arr!37094 _keys!1208) i!673) k!934))))

(declare-fun b!1189871 () Bool)

(declare-fun res!791284 () Bool)

(assert (=> b!1189871 (=> (not res!791284) (not e!676468))))

(assert (=> b!1189871 (= res!791284 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37630 _keys!1208))))))

(declare-fun mapIsEmpty!46901 () Bool)

(declare-fun mapRes!46901 () Bool)

(assert (=> mapIsEmpty!46901 mapRes!46901))

(declare-fun b!1189872 () Bool)

(declare-fun res!791276 () Bool)

(assert (=> b!1189872 (=> (not res!791276) (not e!676468))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189872 (= res!791276 (validMask!0 mask!1564))))

(declare-fun b!1189873 () Bool)

(declare-fun e!676471 () Bool)

(assert (=> b!1189873 (= e!676471 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541231 () array!76889)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!45193 0))(
  ( (V!45194 (val!15081 Int)) )
))
(declare-datatypes ((ValueCell!14315 0))(
  ( (ValueCellFull!14315 (v!17719 V!45193)) (EmptyCell!14315) )
))
(declare-datatypes ((array!76891 0))(
  ( (array!76892 (arr!37095 (Array (_ BitVec 32) ValueCell!14315)) (size!37631 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76891)

(declare-fun minValue!944 () V!45193)

(declare-fun zeroValue!944 () V!45193)

(declare-fun lt!541232 () array!76891)

(declare-datatypes ((tuple2!19366 0))(
  ( (tuple2!19367 (_1!9694 (_ BitVec 64)) (_2!9694 V!45193)) )
))
(declare-datatypes ((List!26113 0))(
  ( (Nil!26110) (Cons!26109 (h!27318 tuple2!19366) (t!38624 List!26113)) )
))
(declare-datatypes ((ListLongMap!17335 0))(
  ( (ListLongMap!17336 (toList!8683 List!26113)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5124 (array!76889 array!76891 (_ BitVec 32) (_ BitVec 32) V!45193 V!45193 (_ BitVec 32) Int) ListLongMap!17335)

(declare-fun -!1712 (ListLongMap!17335 (_ BitVec 64)) ListLongMap!17335)

(assert (=> b!1189873 (= (getCurrentListMapNoExtraKeys!5124 lt!541231 lt!541232 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1712 (getCurrentListMapNoExtraKeys!5124 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39466 0))(
  ( (Unit!39467) )
))
(declare-fun lt!541234 () Unit!39466)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!921 (array!76889 array!76891 (_ BitVec 32) (_ BitVec 32) V!45193 V!45193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39466)

(assert (=> b!1189873 (= lt!541234 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!921 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189874 () Bool)

(declare-fun res!791283 () Bool)

(assert (=> b!1189874 (=> (not res!791283) (not e!676468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189874 (= res!791283 (validKeyInArray!0 k!934))))

(declare-fun b!1189875 () Bool)

(declare-fun e!676472 () Bool)

(assert (=> b!1189875 (= e!676468 e!676472)))

(declare-fun res!791277 () Bool)

(assert (=> b!1189875 (=> (not res!791277) (not e!676472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76889 (_ BitVec 32)) Bool)

(assert (=> b!1189875 (= res!791277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541231 mask!1564))))

(assert (=> b!1189875 (= lt!541231 (array!76890 (store (arr!37094 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37630 _keys!1208)))))

(declare-fun b!1189876 () Bool)

(declare-fun e!676467 () Bool)

(declare-fun e!676469 () Bool)

(assert (=> b!1189876 (= e!676467 (and e!676469 mapRes!46901))))

(declare-fun condMapEmpty!46901 () Bool)

(declare-fun mapDefault!46901 () ValueCell!14315)

