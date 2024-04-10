; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99832 () Bool)

(assert start!99832)

(declare-fun b_free!25411 () Bool)

(declare-fun b_next!25411 () Bool)

(assert (=> start!99832 (= b_free!25411 (not b_next!25411))))

(declare-fun tp!88946 () Bool)

(declare-fun b_and!41689 () Bool)

(assert (=> start!99832 (= tp!88946 b_and!41689)))

(declare-fun b!1187027 () Bool)

(declare-fun res!789161 () Bool)

(declare-fun e!674938 () Bool)

(assert (=> b!1187027 (=> (not res!789161) (not e!674938))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187027 (= res!789161 (validKeyInArray!0 k!934))))

(declare-fun b!1187028 () Bool)

(declare-fun e!674936 () Bool)

(declare-fun tp_is_empty!29941 () Bool)

(assert (=> b!1187028 (= e!674936 tp_is_empty!29941)))

(declare-fun b!1187029 () Bool)

(declare-fun e!674931 () Bool)

(declare-fun e!674935 () Bool)

(assert (=> b!1187029 (= e!674931 e!674935)))

(declare-fun res!789156 () Bool)

(assert (=> b!1187029 (=> res!789156 e!674935)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187029 (= res!789156 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45049 0))(
  ( (V!45050 (val!15027 Int)) )
))
(declare-fun zeroValue!944 () V!45049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14261 0))(
  ( (ValueCellFull!14261 (v!17665 V!45049)) (EmptyCell!14261) )
))
(declare-datatypes ((array!76677 0))(
  ( (array!76678 (arr!36988 (Array (_ BitVec 32) ValueCell!14261)) (size!37524 (_ BitVec 32))) )
))
(declare-fun lt!539482 () array!76677)

(declare-fun minValue!944 () V!45049)

(declare-datatypes ((array!76679 0))(
  ( (array!76680 (arr!36989 (Array (_ BitVec 32) (_ BitVec 64))) (size!37525 (_ BitVec 32))) )
))
(declare-fun lt!539470 () array!76679)

(declare-datatypes ((tuple2!19286 0))(
  ( (tuple2!19287 (_1!9654 (_ BitVec 64)) (_2!9654 V!45049)) )
))
(declare-datatypes ((List!26026 0))(
  ( (Nil!26023) (Cons!26022 (h!27231 tuple2!19286) (t!38429 List!26026)) )
))
(declare-datatypes ((ListLongMap!17255 0))(
  ( (ListLongMap!17256 (toList!8643 List!26026)) )
))
(declare-fun lt!539469 () ListLongMap!17255)

(declare-fun getCurrentListMapNoExtraKeys!5086 (array!76679 array!76677 (_ BitVec 32) (_ BitVec 32) V!45049 V!45049 (_ BitVec 32) Int) ListLongMap!17255)

(assert (=> b!1187029 (= lt!539469 (getCurrentListMapNoExtraKeys!5086 lt!539470 lt!539482 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539476 () V!45049)

(declare-fun _values!996 () array!76677)

(assert (=> b!1187029 (= lt!539482 (array!76678 (store (arr!36988 _values!996) i!673 (ValueCellFull!14261 lt!539476)) (size!37524 _values!996)))))

(declare-fun dynLambda!3035 (Int (_ BitVec 64)) V!45049)

(assert (=> b!1187029 (= lt!539476 (dynLambda!3035 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539484 () ListLongMap!17255)

(declare-fun _keys!1208 () array!76679)

(assert (=> b!1187029 (= lt!539484 (getCurrentListMapNoExtraKeys!5086 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187030 () Bool)

(declare-datatypes ((Unit!39354 0))(
  ( (Unit!39355) )
))
(declare-fun e!674934 () Unit!39354)

(declare-fun Unit!39356 () Unit!39354)

(assert (=> b!1187030 (= e!674934 Unit!39356)))

(declare-fun lt!539473 () Unit!39354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76679 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39354)

(assert (=> b!1187030 (= lt!539473 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187030 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539466 () Unit!39354)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76679 (_ BitVec 32) (_ BitVec 32)) Unit!39354)

(assert (=> b!1187030 (= lt!539466 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26027 0))(
  ( (Nil!26024) (Cons!26023 (h!27232 (_ BitVec 64)) (t!38430 List!26027)) )
))
(declare-fun arrayNoDuplicates!0 (array!76679 (_ BitVec 32) List!26027) Bool)

(assert (=> b!1187030 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26024)))

(declare-fun lt!539478 () Unit!39354)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76679 (_ BitVec 64) (_ BitVec 32) List!26027) Unit!39354)

(assert (=> b!1187030 (= lt!539478 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26024))))

(assert (=> b!1187030 false))

(declare-fun b!1187031 () Bool)

(declare-fun e!674928 () Bool)

(declare-fun e!674930 () Bool)

(declare-fun mapRes!46739 () Bool)

(assert (=> b!1187031 (= e!674928 (and e!674930 mapRes!46739))))

(declare-fun condMapEmpty!46739 () Bool)

(declare-fun mapDefault!46739 () ValueCell!14261)

