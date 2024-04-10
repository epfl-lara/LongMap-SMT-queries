; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99812 () Bool)

(assert start!99812)

(declare-fun b_free!25391 () Bool)

(declare-fun b_next!25391 () Bool)

(assert (=> start!99812 (= b_free!25391 (not b_next!25391))))

(declare-fun tp!88887 () Bool)

(declare-fun b_and!41649 () Bool)

(assert (=> start!99812 (= tp!88887 b_and!41649)))

(declare-fun b!1186407 () Bool)

(declare-fun e!674578 () Bool)

(declare-fun e!674573 () Bool)

(assert (=> b!1186407 (= e!674578 e!674573)))

(declare-fun res!788699 () Bool)

(assert (=> b!1186407 (=> (not res!788699) (not e!674573))))

(declare-datatypes ((array!76637 0))(
  ( (array!76638 (arr!36968 (Array (_ BitVec 32) (_ BitVec 64))) (size!37504 (_ BitVec 32))) )
))
(declare-fun lt!538900 () array!76637)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76637 (_ BitVec 32)) Bool)

(assert (=> b!1186407 (= res!788699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538900 mask!1564))))

(declare-fun _keys!1208 () array!76637)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186407 (= lt!538900 (array!76638 (store (arr!36968 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37504 _keys!1208)))))

(declare-fun b!1186408 () Bool)

(declare-fun e!674575 () Bool)

(declare-fun e!674577 () Bool)

(assert (=> b!1186408 (= e!674575 e!674577)))

(declare-fun res!788712 () Bool)

(assert (=> b!1186408 (=> res!788712 e!674577)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186408 (= res!788712 (not (validKeyInArray!0 (select (arr!36968 _keys!1208) from!1455))))))

(declare-datatypes ((V!45021 0))(
  ( (V!45022 (val!15017 Int)) )
))
(declare-datatypes ((tuple2!19270 0))(
  ( (tuple2!19271 (_1!9646 (_ BitVec 64)) (_2!9646 V!45021)) )
))
(declare-datatypes ((List!26010 0))(
  ( (Nil!26007) (Cons!26006 (h!27215 tuple2!19270) (t!38393 List!26010)) )
))
(declare-datatypes ((ListLongMap!17239 0))(
  ( (ListLongMap!17240 (toList!8635 List!26010)) )
))
(declare-fun lt!538913 () ListLongMap!17239)

(declare-fun lt!538910 () ListLongMap!17239)

(assert (=> b!1186408 (= lt!538913 lt!538910)))

(declare-fun lt!538911 () ListLongMap!17239)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1667 (ListLongMap!17239 (_ BitVec 64)) ListLongMap!17239)

(assert (=> b!1186408 (= lt!538910 (-!1667 lt!538911 k!934))))

(declare-fun zeroValue!944 () V!45021)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14251 0))(
  ( (ValueCellFull!14251 (v!17655 V!45021)) (EmptyCell!14251) )
))
(declare-datatypes ((array!76639 0))(
  ( (array!76640 (arr!36969 (Array (_ BitVec 32) ValueCell!14251)) (size!37505 (_ BitVec 32))) )
))
(declare-fun lt!538906 () array!76639)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45021)

(declare-fun getCurrentListMapNoExtraKeys!5079 (array!76637 array!76639 (_ BitVec 32) (_ BitVec 32) V!45021 V!45021 (_ BitVec 32) Int) ListLongMap!17239)

(assert (=> b!1186408 (= lt!538913 (getCurrentListMapNoExtraKeys!5079 lt!538900 lt!538906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76639)

(assert (=> b!1186408 (= lt!538911 (getCurrentListMapNoExtraKeys!5079 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39324 0))(
  ( (Unit!39325) )
))
(declare-fun lt!538908 () Unit!39324)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!881 (array!76637 array!76639 (_ BitVec 32) (_ BitVec 32) V!45021 V!45021 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39324)

(assert (=> b!1186408 (= lt!538908 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!881 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186409 () Bool)

(declare-fun e!674570 () Unit!39324)

(declare-fun Unit!39326 () Unit!39324)

(assert (=> b!1186409 (= e!674570 Unit!39326)))

(declare-fun b!1186410 () Bool)

(declare-fun Unit!39327 () Unit!39324)

(assert (=> b!1186410 (= e!674570 Unit!39327)))

(declare-fun lt!538905 () Unit!39324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39324)

(assert (=> b!1186410 (= lt!538905 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186410 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538896 () Unit!39324)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76637 (_ BitVec 32) (_ BitVec 32)) Unit!39324)

(assert (=> b!1186410 (= lt!538896 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26011 0))(
  ( (Nil!26008) (Cons!26007 (h!27216 (_ BitVec 64)) (t!38394 List!26011)) )
))
(declare-fun arrayNoDuplicates!0 (array!76637 (_ BitVec 32) List!26011) Bool)

(assert (=> b!1186410 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26008)))

(declare-fun lt!538907 () Unit!39324)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76637 (_ BitVec 64) (_ BitVec 32) List!26011) Unit!39324)

(assert (=> b!1186410 (= lt!538907 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26008))))

(assert (=> b!1186410 false))

(declare-fun b!1186411 () Bool)

(declare-fun e!674568 () Bool)

(assert (=> b!1186411 (= e!674568 e!674575)))

(declare-fun res!788703 () Bool)

(assert (=> b!1186411 (=> res!788703 e!674575)))

(assert (=> b!1186411 (= res!788703 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!538909 () ListLongMap!17239)

(assert (=> b!1186411 (= lt!538909 (getCurrentListMapNoExtraKeys!5079 lt!538900 lt!538906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538904 () V!45021)

(assert (=> b!1186411 (= lt!538906 (array!76640 (store (arr!36969 _values!996) i!673 (ValueCellFull!14251 lt!538904)) (size!37505 _values!996)))))

(declare-fun dynLambda!3028 (Int (_ BitVec 64)) V!45021)

(assert (=> b!1186411 (= lt!538904 (dynLambda!3028 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538902 () ListLongMap!17239)

(assert (=> b!1186411 (= lt!538902 (getCurrentListMapNoExtraKeys!5079 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186412 () Bool)

(declare-fun e!674567 () Bool)

(declare-fun e!674572 () Bool)

(declare-fun mapRes!46709 () Bool)

(assert (=> b!1186412 (= e!674567 (and e!674572 mapRes!46709))))

(declare-fun condMapEmpty!46709 () Bool)

(declare-fun mapDefault!46709 () ValueCell!14251)

