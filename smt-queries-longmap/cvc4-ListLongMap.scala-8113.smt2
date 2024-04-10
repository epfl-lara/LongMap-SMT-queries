; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99548 () Bool)

(assert start!99548)

(declare-fun b_free!25127 () Bool)

(declare-fun b_next!25127 () Bool)

(assert (=> start!99548 (= b_free!25127 (not b_next!25127))))

(declare-fun tp!88095 () Bool)

(declare-fun b_and!41121 () Bool)

(assert (=> start!99548 (= tp!88095 b_and!41121)))

(declare-fun b!1177970 () Bool)

(declare-fun res!782508 () Bool)

(declare-fun e!669661 () Bool)

(assert (=> b!1177970 (=> (not res!782508) (not e!669661))))

(declare-datatypes ((array!76119 0))(
  ( (array!76120 (arr!36709 (Array (_ BitVec 32) (_ BitVec 64))) (size!37245 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76119)

(declare-datatypes ((List!25783 0))(
  ( (Nil!25780) (Cons!25779 (h!26988 (_ BitVec 64)) (t!37902 List!25783)) )
))
(declare-fun arrayNoDuplicates!0 (array!76119 (_ BitVec 32) List!25783) Bool)

(assert (=> b!1177970 (= res!782508 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25780))))

(declare-fun b!1177971 () Bool)

(declare-fun e!669664 () Bool)

(declare-fun e!669656 () Bool)

(assert (=> b!1177971 (= e!669664 e!669656)))

(declare-fun res!782507 () Bool)

(assert (=> b!1177971 (=> res!782507 e!669656)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177971 (= res!782507 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44669 0))(
  ( (V!44670 (val!14885 Int)) )
))
(declare-fun zeroValue!944 () V!44669)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532033 () array!76119)

(declare-datatypes ((tuple2!19046 0))(
  ( (tuple2!19047 (_1!9534 (_ BitVec 64)) (_2!9534 V!44669)) )
))
(declare-datatypes ((List!25784 0))(
  ( (Nil!25781) (Cons!25780 (h!26989 tuple2!19046) (t!37903 List!25784)) )
))
(declare-datatypes ((ListLongMap!17015 0))(
  ( (ListLongMap!17016 (toList!8523 List!25784)) )
))
(declare-fun lt!532037 () ListLongMap!17015)

(declare-fun minValue!944 () V!44669)

(declare-datatypes ((ValueCell!14119 0))(
  ( (ValueCellFull!14119 (v!17523 V!44669)) (EmptyCell!14119) )
))
(declare-datatypes ((array!76121 0))(
  ( (array!76122 (arr!36710 (Array (_ BitVec 32) ValueCell!14119)) (size!37246 (_ BitVec 32))) )
))
(declare-fun lt!532024 () array!76121)

(declare-fun getCurrentListMapNoExtraKeys!4980 (array!76119 array!76121 (_ BitVec 32) (_ BitVec 32) V!44669 V!44669 (_ BitVec 32) Int) ListLongMap!17015)

(assert (=> b!1177971 (= lt!532037 (getCurrentListMapNoExtraKeys!4980 lt!532033 lt!532024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532028 () V!44669)

(declare-fun _values!996 () array!76121)

(assert (=> b!1177971 (= lt!532024 (array!76122 (store (arr!36710 _values!996) i!673 (ValueCellFull!14119 lt!532028)) (size!37246 _values!996)))))

(declare-fun dynLambda!2942 (Int (_ BitVec 64)) V!44669)

(assert (=> b!1177971 (= lt!532028 (dynLambda!2942 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532036 () ListLongMap!17015)

(assert (=> b!1177971 (= lt!532036 (getCurrentListMapNoExtraKeys!4980 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!669654 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1177972 () Bool)

(declare-fun arrayContainsKey!0 (array!76119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177972 (= e!669654 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177973 () Bool)

(declare-fun e!669659 () Bool)

(declare-fun tp_is_empty!29657 () Bool)

(assert (=> b!1177973 (= e!669659 tp_is_empty!29657)))

(declare-fun b!1177974 () Bool)

(declare-fun res!782514 () Bool)

(assert (=> b!1177974 (=> (not res!782514) (not e!669661))))

(assert (=> b!1177974 (= res!782514 (and (= (size!37246 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37245 _keys!1208) (size!37246 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177975 () Bool)

(declare-fun res!782521 () Bool)

(assert (=> b!1177975 (=> (not res!782521) (not e!669661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177975 (= res!782521 (validKeyInArray!0 k!934))))

(declare-fun b!1177976 () Bool)

(declare-datatypes ((Unit!38908 0))(
  ( (Unit!38909) )
))
(declare-fun e!669655 () Unit!38908)

(declare-fun Unit!38910 () Unit!38908)

(assert (=> b!1177976 (= e!669655 Unit!38910)))

(declare-fun lt!532029 () Unit!38908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38908)

(assert (=> b!1177976 (= lt!532029 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177976 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532034 () Unit!38908)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76119 (_ BitVec 32) (_ BitVec 32)) Unit!38908)

(assert (=> b!1177976 (= lt!532034 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177976 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25780)))

(declare-fun lt!532032 () Unit!38908)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76119 (_ BitVec 64) (_ BitVec 32) List!25783) Unit!38908)

(assert (=> b!1177976 (= lt!532032 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25780))))

(assert (=> b!1177976 false))

(declare-fun b!1177977 () Bool)

(declare-fun res!782510 () Bool)

(declare-fun e!669663 () Bool)

(assert (=> b!1177977 (=> (not res!782510) (not e!669663))))

(assert (=> b!1177977 (= res!782510 (arrayNoDuplicates!0 lt!532033 #b00000000000000000000000000000000 Nil!25780))))

(declare-fun b!1177978 () Bool)

(declare-fun e!669662 () Bool)

(assert (=> b!1177978 (= e!669662 e!669654)))

(declare-fun res!782520 () Bool)

(assert (=> b!1177978 (=> res!782520 e!669654)))

(assert (=> b!1177978 (= res!782520 (not (= (select (arr!36709 _keys!1208) from!1455) k!934)))))

(declare-fun b!1177979 () Bool)

(declare-fun e!669653 () Bool)

(declare-fun mapRes!46313 () Bool)

(assert (=> b!1177979 (= e!669653 (and e!669659 mapRes!46313))))

(declare-fun condMapEmpty!46313 () Bool)

(declare-fun mapDefault!46313 () ValueCell!14119)

