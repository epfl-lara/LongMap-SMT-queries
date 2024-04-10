; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99494 () Bool)

(assert start!99494)

(declare-fun b_free!25073 () Bool)

(declare-fun b_next!25073 () Bool)

(assert (=> start!99494 (= b_free!25073 (not b_next!25073))))

(declare-fun tp!87932 () Bool)

(declare-fun b_and!41013 () Bool)

(assert (=> start!99494 (= tp!87932 b_and!41013)))

(declare-fun b!1176215 () Bool)

(declare-fun res!781224 () Bool)

(declare-fun e!668601 () Bool)

(assert (=> b!1176215 (=> (not res!781224) (not e!668601))))

(declare-datatypes ((array!76013 0))(
  ( (array!76014 (arr!36656 (Array (_ BitVec 32) (_ BitVec 64))) (size!37192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76013)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76013 (_ BitVec 32)) Bool)

(assert (=> b!1176215 (= res!781224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176216 () Bool)

(declare-fun e!668607 () Bool)

(declare-fun e!668599 () Bool)

(assert (=> b!1176216 (= e!668607 e!668599)))

(declare-fun res!781217 () Bool)

(assert (=> b!1176216 (=> res!781217 e!668599)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176216 (= res!781217 (not (validKeyInArray!0 (select (arr!36656 _keys!1208) from!1455))))))

(declare-datatypes ((V!44597 0))(
  ( (V!44598 (val!14858 Int)) )
))
(declare-datatypes ((tuple2!18998 0))(
  ( (tuple2!18999 (_1!9510 (_ BitVec 64)) (_2!9510 V!44597)) )
))
(declare-datatypes ((List!25737 0))(
  ( (Nil!25734) (Cons!25733 (h!26942 tuple2!18998) (t!37802 List!25737)) )
))
(declare-datatypes ((ListLongMap!16967 0))(
  ( (ListLongMap!16968 (toList!8499 List!25737)) )
))
(declare-fun lt!530819 () ListLongMap!16967)

(declare-fun lt!530823 () ListLongMap!16967)

(assert (=> b!1176216 (= lt!530819 lt!530823)))

(declare-fun lt!530816 () ListLongMap!16967)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1553 (ListLongMap!16967 (_ BitVec 64)) ListLongMap!16967)

(assert (=> b!1176216 (= lt!530823 (-!1553 lt!530816 k!934))))

(declare-datatypes ((ValueCell!14092 0))(
  ( (ValueCellFull!14092 (v!17496 V!44597)) (EmptyCell!14092) )
))
(declare-datatypes ((array!76015 0))(
  ( (array!76016 (arr!36657 (Array (_ BitVec 32) ValueCell!14092)) (size!37193 (_ BitVec 32))) )
))
(declare-fun lt!530810 () array!76015)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44597)

(declare-fun zeroValue!944 () V!44597)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530809 () array!76013)

(declare-fun getCurrentListMapNoExtraKeys!4958 (array!76013 array!76015 (_ BitVec 32) (_ BitVec 32) V!44597 V!44597 (_ BitVec 32) Int) ListLongMap!16967)

(assert (=> b!1176216 (= lt!530819 (getCurrentListMapNoExtraKeys!4958 lt!530809 lt!530810 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76015)

(assert (=> b!1176216 (= lt!530816 (getCurrentListMapNoExtraKeys!4958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38824 0))(
  ( (Unit!38825) )
))
(declare-fun lt!530813 () Unit!38824)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!780 (array!76013 array!76015 (_ BitVec 32) (_ BitVec 32) V!44597 V!44597 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38824)

(assert (=> b!1176216 (= lt!530813 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!780 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!668606 () Bool)

(declare-fun b!1176217 () Bool)

(declare-fun arrayContainsKey!0 (array!76013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176217 (= e!668606 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176219 () Bool)

(declare-fun e!668600 () Unit!38824)

(declare-fun Unit!38826 () Unit!38824)

(assert (=> b!1176219 (= e!668600 Unit!38826)))

(declare-fun b!1176220 () Bool)

(declare-fun e!668609 () Bool)

(declare-fun tp_is_empty!29603 () Bool)

(assert (=> b!1176220 (= e!668609 tp_is_empty!29603)))

(declare-fun b!1176221 () Bool)

(declare-fun res!781211 () Bool)

(assert (=> b!1176221 (=> (not res!781211) (not e!668601))))

(assert (=> b!1176221 (= res!781211 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37192 _keys!1208))))))

(declare-fun b!1176222 () Bool)

(assert (=> b!1176222 (= e!668599 true)))

(declare-fun e!668611 () Bool)

(assert (=> b!1176222 e!668611))

(declare-fun res!781213 () Bool)

(assert (=> b!1176222 (=> (not res!781213) (not e!668611))))

(assert (=> b!1176222 (= res!781213 (not (= (select (arr!36656 _keys!1208) from!1455) k!934)))))

(declare-fun lt!530822 () Unit!38824)

(assert (=> b!1176222 (= lt!530822 e!668600)))

(declare-fun c!116733 () Bool)

(assert (=> b!1176222 (= c!116733 (= (select (arr!36656 _keys!1208) from!1455) k!934))))

(declare-fun e!668610 () Bool)

(assert (=> b!1176222 e!668610))

(declare-fun res!781223 () Bool)

(assert (=> b!1176222 (=> (not res!781223) (not e!668610))))

(declare-fun lt!530820 () ListLongMap!16967)

(declare-fun lt!530818 () tuple2!18998)

(declare-fun +!3815 (ListLongMap!16967 tuple2!18998) ListLongMap!16967)

(assert (=> b!1176222 (= res!781223 (= lt!530820 (+!3815 lt!530823 lt!530818)))))

(declare-fun lt!530814 () V!44597)

(declare-fun get!18719 (ValueCell!14092 V!44597) V!44597)

(assert (=> b!1176222 (= lt!530818 (tuple2!18999 (select (arr!36656 _keys!1208) from!1455) (get!18719 (select (arr!36657 _values!996) from!1455) lt!530814)))))

(declare-fun b!1176223 () Bool)

(declare-fun res!781221 () Bool)

(assert (=> b!1176223 (=> (not res!781221) (not e!668601))))

(assert (=> b!1176223 (= res!781221 (and (= (size!37193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37192 _keys!1208) (size!37193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176224 () Bool)

(declare-fun e!668603 () Bool)

(declare-fun e!668604 () Bool)

(declare-fun mapRes!46232 () Bool)

(assert (=> b!1176224 (= e!668603 (and e!668604 mapRes!46232))))

(declare-fun condMapEmpty!46232 () Bool)

(declare-fun mapDefault!46232 () ValueCell!14092)

