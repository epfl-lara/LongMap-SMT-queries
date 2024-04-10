; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99490 () Bool)

(assert start!99490)

(declare-fun b_free!25069 () Bool)

(declare-fun b_next!25069 () Bool)

(assert (=> start!99490 (= b_free!25069 (not b_next!25069))))

(declare-fun tp!87920 () Bool)

(declare-fun b_and!41005 () Bool)

(assert (=> start!99490 (= tp!87920 b_and!41005)))

(declare-fun b!1176085 () Bool)

(declare-fun e!668533 () Bool)

(assert (=> b!1176085 (= e!668533 true)))

(declare-fun e!668526 () Bool)

(assert (=> b!1176085 e!668526))

(declare-fun res!781119 () Bool)

(assert (=> b!1176085 (=> (not res!781119) (not e!668526))))

(declare-datatypes ((array!76005 0))(
  ( (array!76006 (arr!36652 (Array (_ BitVec 32) (_ BitVec 64))) (size!37188 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76005)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176085 (= res!781119 (not (= (select (arr!36652 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38818 0))(
  ( (Unit!38819) )
))
(declare-fun lt!530733 () Unit!38818)

(declare-fun e!668525 () Unit!38818)

(assert (=> b!1176085 (= lt!530733 e!668525)))

(declare-fun c!116727 () Bool)

(assert (=> b!1176085 (= c!116727 (= (select (arr!36652 _keys!1208) from!1455) k!934))))

(declare-fun e!668528 () Bool)

(assert (=> b!1176085 e!668528))

(declare-fun res!781116 () Bool)

(assert (=> b!1176085 (=> (not res!781116) (not e!668528))))

(declare-datatypes ((V!44593 0))(
  ( (V!44594 (val!14856 Int)) )
))
(declare-datatypes ((tuple2!18994 0))(
  ( (tuple2!18995 (_1!9508 (_ BitVec 64)) (_2!9508 V!44593)) )
))
(declare-datatypes ((List!25734 0))(
  ( (Nil!25731) (Cons!25730 (h!26939 tuple2!18994) (t!37795 List!25734)) )
))
(declare-datatypes ((ListLongMap!16963 0))(
  ( (ListLongMap!16964 (toList!8497 List!25734)) )
))
(declare-fun lt!530727 () ListLongMap!16963)

(declare-fun lt!530732 () tuple2!18994)

(declare-fun lt!530728 () ListLongMap!16963)

(declare-fun +!3813 (ListLongMap!16963 tuple2!18994) ListLongMap!16963)

(assert (=> b!1176085 (= res!781116 (= lt!530727 (+!3813 lt!530728 lt!530732)))))

(declare-fun lt!530725 () V!44593)

(declare-datatypes ((ValueCell!14090 0))(
  ( (ValueCellFull!14090 (v!17494 V!44593)) (EmptyCell!14090) )
))
(declare-datatypes ((array!76007 0))(
  ( (array!76008 (arr!36653 (Array (_ BitVec 32) ValueCell!14090)) (size!37189 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76007)

(declare-fun get!18717 (ValueCell!14090 V!44593) V!44593)

(assert (=> b!1176085 (= lt!530732 (tuple2!18995 (select (arr!36652 _keys!1208) from!1455) (get!18717 (select (arr!36653 _values!996) from!1455) lt!530725)))))

(declare-fun b!1176086 () Bool)

(declare-fun e!668527 () Bool)

(assert (=> b!1176086 (= e!668527 e!668533)))

(declare-fun res!781121 () Bool)

(assert (=> b!1176086 (=> res!781121 e!668533)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176086 (= res!781121 (not (validKeyInArray!0 (select (arr!36652 _keys!1208) from!1455))))))

(declare-fun lt!530730 () ListLongMap!16963)

(assert (=> b!1176086 (= lt!530730 lt!530728)))

(declare-fun lt!530731 () ListLongMap!16963)

(declare-fun -!1551 (ListLongMap!16963 (_ BitVec 64)) ListLongMap!16963)

(assert (=> b!1176086 (= lt!530728 (-!1551 lt!530731 k!934))))

(declare-fun zeroValue!944 () V!44593)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!530729 () array!76007)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530723 () array!76005)

(declare-fun minValue!944 () V!44593)

(declare-fun getCurrentListMapNoExtraKeys!4956 (array!76005 array!76007 (_ BitVec 32) (_ BitVec 32) V!44593 V!44593 (_ BitVec 32) Int) ListLongMap!16963)

(assert (=> b!1176086 (= lt!530730 (getCurrentListMapNoExtraKeys!4956 lt!530723 lt!530729 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176086 (= lt!530731 (getCurrentListMapNoExtraKeys!4956 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!530719 () Unit!38818)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!778 (array!76005 array!76007 (_ BitVec 32) (_ BitVec 32) V!44593 V!44593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38818)

(assert (=> b!1176086 (= lt!530719 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176087 () Bool)

(declare-fun res!781117 () Bool)

(declare-fun e!668532 () Bool)

(assert (=> b!1176087 (=> (not res!781117) (not e!668532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176087 (= res!781117 (validMask!0 mask!1564))))

(declare-fun b!1176088 () Bool)

(declare-fun e!668522 () Bool)

(assert (=> b!1176088 (= e!668522 e!668527)))

(declare-fun res!781126 () Bool)

(assert (=> b!1176088 (=> res!781126 e!668527)))

(assert (=> b!1176088 (= res!781126 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176088 (= lt!530727 (getCurrentListMapNoExtraKeys!4956 lt!530723 lt!530729 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176088 (= lt!530729 (array!76008 (store (arr!36653 _values!996) i!673 (ValueCellFull!14090 lt!530725)) (size!37189 _values!996)))))

(declare-fun dynLambda!2922 (Int (_ BitVec 64)) V!44593)

(assert (=> b!1176088 (= lt!530725 (dynLambda!2922 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530724 () ListLongMap!16963)

(assert (=> b!1176088 (= lt!530724 (getCurrentListMapNoExtraKeys!4956 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176089 () Bool)

(declare-fun e!668524 () Bool)

(declare-fun e!668530 () Bool)

(declare-fun mapRes!46226 () Bool)

(assert (=> b!1176089 (= e!668524 (and e!668530 mapRes!46226))))

(declare-fun condMapEmpty!46226 () Bool)

(declare-fun mapDefault!46226 () ValueCell!14090)

