; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99710 () Bool)

(assert start!99710)

(declare-fun b_free!25289 () Bool)

(declare-fun b_next!25289 () Bool)

(assert (=> start!99710 (= b_free!25289 (not b_next!25289))))

(declare-fun tp!88581 () Bool)

(declare-fun b_and!41445 () Bool)

(assert (=> start!99710 (= tp!88581 b_and!41445)))

(declare-fun b!1183245 () Bool)

(declare-fun res!786417 () Bool)

(declare-fun e!672733 () Bool)

(assert (=> b!1183245 (=> (not res!786417) (not e!672733))))

(declare-datatypes ((array!76439 0))(
  ( (array!76440 (arr!36869 (Array (_ BitVec 32) (_ BitVec 64))) (size!37405 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76439)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44885 0))(
  ( (V!44886 (val!14966 Int)) )
))
(declare-datatypes ((ValueCell!14200 0))(
  ( (ValueCellFull!14200 (v!17604 V!44885)) (EmptyCell!14200) )
))
(declare-datatypes ((array!76441 0))(
  ( (array!76442 (arr!36870 (Array (_ BitVec 32) ValueCell!14200)) (size!37406 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76441)

(assert (=> b!1183245 (= res!786417 (and (= (size!37406 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37405 _keys!1208) (size!37406 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183246 () Bool)

(declare-datatypes ((Unit!39158 0))(
  ( (Unit!39159) )
))
(declare-fun e!672740 () Unit!39158)

(declare-fun Unit!39160 () Unit!39158)

(assert (=> b!1183246 (= e!672740 Unit!39160)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!535995 () Unit!39158)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39158)

(assert (=> b!1183246 (= lt!535995 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183246 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536001 () Unit!39158)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76439 (_ BitVec 32) (_ BitVec 32)) Unit!39158)

(assert (=> b!1183246 (= lt!536001 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25926 0))(
  ( (Nil!25923) (Cons!25922 (h!27131 (_ BitVec 64)) (t!38207 List!25926)) )
))
(declare-fun arrayNoDuplicates!0 (array!76439 (_ BitVec 32) List!25926) Bool)

(assert (=> b!1183246 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25923)))

(declare-fun lt!535989 () Unit!39158)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76439 (_ BitVec 64) (_ BitVec 32) List!25926) Unit!39158)

(assert (=> b!1183246 (= lt!535989 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25923))))

(assert (=> b!1183246 false))

(declare-fun b!1183247 () Bool)

(declare-fun res!786416 () Bool)

(assert (=> b!1183247 (=> (not res!786416) (not e!672733))))

(assert (=> b!1183247 (= res!786416 (= (select (arr!36869 _keys!1208) i!673) k!934))))

(declare-fun b!1183248 () Bool)

(declare-fun res!786410 () Bool)

(declare-fun e!672731 () Bool)

(assert (=> b!1183248 (=> (not res!786410) (not e!672731))))

(declare-fun lt!535993 () array!76439)

(assert (=> b!1183248 (= res!786410 (arrayNoDuplicates!0 lt!535993 #b00000000000000000000000000000000 Nil!25923))))

(declare-fun b!1183249 () Bool)

(declare-fun e!672736 () Bool)

(assert (=> b!1183249 (= e!672736 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183250 () Bool)

(declare-fun e!672737 () Bool)

(declare-fun e!672738 () Bool)

(assert (=> b!1183250 (= e!672737 e!672738)))

(declare-fun res!786412 () Bool)

(assert (=> b!1183250 (=> res!786412 e!672738)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183250 (= res!786412 (not (validKeyInArray!0 (select (arr!36869 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19186 0))(
  ( (tuple2!19187 (_1!9604 (_ BitVec 64)) (_2!9604 V!44885)) )
))
(declare-datatypes ((List!25927 0))(
  ( (Nil!25924) (Cons!25923 (h!27132 tuple2!19186) (t!38208 List!25927)) )
))
(declare-datatypes ((ListLongMap!17155 0))(
  ( (ListLongMap!17156 (toList!8593 List!25927)) )
))
(declare-fun lt!536000 () ListLongMap!17155)

(declare-fun lt!535992 () ListLongMap!17155)

(assert (=> b!1183250 (= lt!536000 lt!535992)))

(declare-fun lt!536006 () ListLongMap!17155)

(declare-fun -!1628 (ListLongMap!17155 (_ BitVec 64)) ListLongMap!17155)

(assert (=> b!1183250 (= lt!535992 (-!1628 lt!536006 k!934))))

(declare-fun zeroValue!944 () V!44885)

(declare-fun minValue!944 () V!44885)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!535994 () array!76441)

(declare-fun getCurrentListMapNoExtraKeys!5044 (array!76439 array!76441 (_ BitVec 32) (_ BitVec 32) V!44885 V!44885 (_ BitVec 32) Int) ListLongMap!17155)

(assert (=> b!1183250 (= lt!536000 (getCurrentListMapNoExtraKeys!5044 lt!535993 lt!535994 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183250 (= lt!536006 (getCurrentListMapNoExtraKeys!5044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535999 () Unit!39158)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!850 (array!76439 array!76441 (_ BitVec 32) (_ BitVec 32) V!44885 V!44885 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39158)

(assert (=> b!1183250 (= lt!535999 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!850 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183252 () Bool)

(declare-fun e!672734 () Bool)

(declare-fun e!672732 () Bool)

(declare-fun mapRes!46556 () Bool)

(assert (=> b!1183252 (= e!672734 (and e!672732 mapRes!46556))))

(declare-fun condMapEmpty!46556 () Bool)

(declare-fun mapDefault!46556 () ValueCell!14200)

