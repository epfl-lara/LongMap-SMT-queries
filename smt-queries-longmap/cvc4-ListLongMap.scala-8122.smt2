; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99602 () Bool)

(assert start!99602)

(declare-fun b_free!25181 () Bool)

(declare-fun b_next!25181 () Bool)

(assert (=> start!99602 (= b_free!25181 (not b_next!25181))))

(declare-fun tp!88256 () Bool)

(declare-fun b_and!41229 () Bool)

(assert (=> start!99602 (= tp!88256 b_and!41229)))

(declare-fun b!1179733 () Bool)

(declare-fun e!670714 () Bool)

(declare-fun e!670706 () Bool)

(assert (=> b!1179733 (= e!670714 (not e!670706))))

(declare-fun res!783811 () Bool)

(assert (=> b!1179733 (=> res!783811 e!670706)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179733 (= res!783811 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76225 0))(
  ( (array!76226 (arr!36762 (Array (_ BitVec 32) (_ BitVec 64))) (size!37298 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76225)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179733 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38986 0))(
  ( (Unit!38987) )
))
(declare-fun lt!533251 () Unit!38986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76225 (_ BitVec 64) (_ BitVec 32)) Unit!38986)

(assert (=> b!1179733 (= lt!533251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179734 () Bool)

(declare-fun e!670711 () Bool)

(assert (=> b!1179734 (= e!670711 e!670714)))

(declare-fun res!783814 () Bool)

(assert (=> b!1179734 (=> (not res!783814) (not e!670714))))

(declare-fun lt!533239 () array!76225)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76225 (_ BitVec 32)) Bool)

(assert (=> b!1179734 (= res!783814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533239 mask!1564))))

(assert (=> b!1179734 (= lt!533239 (array!76226 (store (arr!36762 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37298 _keys!1208)))))

(declare-fun b!1179735 () Bool)

(declare-fun e!670709 () Bool)

(assert (=> b!1179735 (= e!670709 true)))

(declare-fun e!670708 () Bool)

(assert (=> b!1179735 e!670708))

(declare-fun res!783824 () Bool)

(assert (=> b!1179735 (=> (not res!783824) (not e!670708))))

(assert (=> b!1179735 (= res!783824 (not (= (select (arr!36762 _keys!1208) from!1455) k!934)))))

(declare-fun lt!533247 () Unit!38986)

(declare-fun e!670715 () Unit!38986)

(assert (=> b!1179735 (= lt!533247 e!670715)))

(declare-fun c!116895 () Bool)

(assert (=> b!1179735 (= c!116895 (= (select (arr!36762 _keys!1208) from!1455) k!934))))

(declare-fun e!670705 () Bool)

(assert (=> b!1179735 e!670705))

(declare-fun res!783822 () Bool)

(assert (=> b!1179735 (=> (not res!783822) (not e!670705))))

(declare-datatypes ((V!44741 0))(
  ( (V!44742 (val!14912 Int)) )
))
(declare-datatypes ((tuple2!19090 0))(
  ( (tuple2!19091 (_1!9556 (_ BitVec 64)) (_2!9556 V!44741)) )
))
(declare-datatypes ((List!25828 0))(
  ( (Nil!25825) (Cons!25824 (h!27033 tuple2!19090) (t!38001 List!25828)) )
))
(declare-datatypes ((ListLongMap!17059 0))(
  ( (ListLongMap!17060 (toList!8545 List!25828)) )
))
(declare-fun lt!533249 () ListLongMap!17059)

(declare-fun lt!533244 () ListLongMap!17059)

(declare-fun lt!533245 () tuple2!19090)

(declare-fun +!3857 (ListLongMap!17059 tuple2!19090) ListLongMap!17059)

(assert (=> b!1179735 (= res!783822 (= lt!533244 (+!3857 lt!533249 lt!533245)))))

(declare-datatypes ((ValueCell!14146 0))(
  ( (ValueCellFull!14146 (v!17550 V!44741)) (EmptyCell!14146) )
))
(declare-datatypes ((array!76227 0))(
  ( (array!76228 (arr!36763 (Array (_ BitVec 32) ValueCell!14146)) (size!37299 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76227)

(declare-fun lt!533253 () V!44741)

(declare-fun get!18795 (ValueCell!14146 V!44741) V!44741)

(assert (=> b!1179735 (= lt!533245 (tuple2!19091 (select (arr!36762 _keys!1208) from!1455) (get!18795 (select (arr!36763 _values!996) from!1455) lt!533253)))))

(declare-fun b!1179736 () Bool)

(declare-fun e!670717 () Bool)

(declare-fun tp_is_empty!29711 () Bool)

(assert (=> b!1179736 (= e!670717 tp_is_empty!29711)))

(declare-fun b!1179737 () Bool)

(declare-fun res!783812 () Bool)

(assert (=> b!1179737 (=> (not res!783812) (not e!670711))))

(assert (=> b!1179737 (= res!783812 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37298 _keys!1208))))))

(declare-fun b!1179738 () Bool)

(declare-fun lt!533250 () ListLongMap!17059)

(assert (=> b!1179738 (= e!670708 (= lt!533249 lt!533250))))

(declare-fun b!1179739 () Bool)

(declare-fun Unit!38988 () Unit!38986)

(assert (=> b!1179739 (= e!670715 Unit!38988)))

(declare-fun b!1179740 () Bool)

(declare-fun e!670716 () Bool)

(assert (=> b!1179740 (= e!670716 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun res!783825 () Bool)

(assert (=> start!99602 (=> (not res!783825) (not e!670711))))

(assert (=> start!99602 (= res!783825 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37298 _keys!1208))))))

(assert (=> start!99602 e!670711))

(assert (=> start!99602 tp_is_empty!29711))

(declare-fun array_inv!28070 (array!76225) Bool)

(assert (=> start!99602 (array_inv!28070 _keys!1208)))

(assert (=> start!99602 true))

(assert (=> start!99602 tp!88256))

(declare-fun e!670707 () Bool)

(declare-fun array_inv!28071 (array!76227) Bool)

(assert (=> start!99602 (and (array_inv!28071 _values!996) e!670707)))

(declare-fun mapNonEmpty!46394 () Bool)

(declare-fun mapRes!46394 () Bool)

(declare-fun tp!88257 () Bool)

(declare-fun e!670710 () Bool)

(assert (=> mapNonEmpty!46394 (= mapRes!46394 (and tp!88257 e!670710))))

(declare-fun mapValue!46394 () ValueCell!14146)

(declare-fun mapKey!46394 () (_ BitVec 32))

(declare-fun mapRest!46394 () (Array (_ BitVec 32) ValueCell!14146))

(assert (=> mapNonEmpty!46394 (= (arr!36763 _values!996) (store mapRest!46394 mapKey!46394 mapValue!46394))))

(declare-fun b!1179741 () Bool)

(declare-fun res!783823 () Bool)

(assert (=> b!1179741 (=> (not res!783823) (not e!670711))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1179741 (= res!783823 (and (= (size!37299 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37298 _keys!1208) (size!37299 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179742 () Bool)

(declare-fun res!783813 () Bool)

(assert (=> b!1179742 (=> (not res!783813) (not e!670714))))

(declare-datatypes ((List!25829 0))(
  ( (Nil!25826) (Cons!25825 (h!27034 (_ BitVec 64)) (t!38002 List!25829)) )
))
(declare-fun arrayNoDuplicates!0 (array!76225 (_ BitVec 32) List!25829) Bool)

(assert (=> b!1179742 (= res!783813 (arrayNoDuplicates!0 lt!533239 #b00000000000000000000000000000000 Nil!25826))))

(declare-fun b!1179743 () Bool)

(declare-fun res!783810 () Bool)

(assert (=> b!1179743 (=> (not res!783810) (not e!670708))))

(declare-fun lt!533252 () ListLongMap!17059)

(declare-fun lt!533240 () ListLongMap!17059)

(assert (=> b!1179743 (= res!783810 (= lt!533252 (+!3857 lt!533240 lt!533245)))))

(declare-fun b!1179744 () Bool)

(declare-fun e!670712 () Bool)

(assert (=> b!1179744 (= e!670706 e!670712)))

(declare-fun res!783818 () Bool)

(assert (=> b!1179744 (=> res!783818 e!670712)))

(assert (=> b!1179744 (= res!783818 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44741)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533243 () array!76227)

(declare-fun minValue!944 () V!44741)

(declare-fun getCurrentListMapNoExtraKeys!5000 (array!76225 array!76227 (_ BitVec 32) (_ BitVec 32) V!44741 V!44741 (_ BitVec 32) Int) ListLongMap!17059)

(assert (=> b!1179744 (= lt!533244 (getCurrentListMapNoExtraKeys!5000 lt!533239 lt!533243 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179744 (= lt!533243 (array!76228 (store (arr!36763 _values!996) i!673 (ValueCellFull!14146 lt!533253)) (size!37299 _values!996)))))

(declare-fun dynLambda!2960 (Int (_ BitVec 64)) V!44741)

(assert (=> b!1179744 (= lt!533253 (dynLambda!2960 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179744 (= lt!533252 (getCurrentListMapNoExtraKeys!5000 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179745 () Bool)

(assert (=> b!1179745 (= e!670705 e!670716)))

(declare-fun res!783816 () Bool)

(assert (=> b!1179745 (=> res!783816 e!670716)))

(assert (=> b!1179745 (= res!783816 (not (= (select (arr!36762 _keys!1208) from!1455) k!934)))))

(declare-fun b!1179746 () Bool)

(declare-fun res!783815 () Bool)

(assert (=> b!1179746 (=> (not res!783815) (not e!670711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179746 (= res!783815 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46394 () Bool)

(assert (=> mapIsEmpty!46394 mapRes!46394))

(declare-fun b!1179747 () Bool)

(declare-fun res!783820 () Bool)

(assert (=> b!1179747 (=> (not res!783820) (not e!670711))))

(assert (=> b!1179747 (= res!783820 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25826))))

(declare-fun b!1179748 () Bool)

(assert (=> b!1179748 (= e!670710 tp_is_empty!29711)))

(declare-fun b!1179749 () Bool)

(assert (=> b!1179749 (= e!670712 e!670709)))

(declare-fun res!783819 () Bool)

(assert (=> b!1179749 (=> res!783819 e!670709)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179749 (= res!783819 (not (validKeyInArray!0 (select (arr!36762 _keys!1208) from!1455))))))

(assert (=> b!1179749 (= lt!533250 lt!533249)))

(declare-fun -!1588 (ListLongMap!17059 (_ BitVec 64)) ListLongMap!17059)

(assert (=> b!1179749 (= lt!533249 (-!1588 lt!533240 k!934))))

(assert (=> b!1179749 (= lt!533250 (getCurrentListMapNoExtraKeys!5000 lt!533239 lt!533243 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179749 (= lt!533240 (getCurrentListMapNoExtraKeys!5000 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533246 () Unit!38986)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!815 (array!76225 array!76227 (_ BitVec 32) (_ BitVec 32) V!44741 V!44741 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38986)

(assert (=> b!1179749 (= lt!533246 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179750 () Bool)

(declare-fun res!783817 () Bool)

(assert (=> b!1179750 (=> (not res!783817) (not e!670711))))

(assert (=> b!1179750 (= res!783817 (= (select (arr!36762 _keys!1208) i!673) k!934))))

(declare-fun b!1179751 () Bool)

(declare-fun res!783821 () Bool)

(assert (=> b!1179751 (=> (not res!783821) (not e!670711))))

(assert (=> b!1179751 (= res!783821 (validKeyInArray!0 k!934))))

(declare-fun b!1179752 () Bool)

(declare-fun Unit!38989 () Unit!38986)

(assert (=> b!1179752 (= e!670715 Unit!38989)))

(declare-fun lt!533242 () Unit!38986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76225 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38986)

(assert (=> b!1179752 (= lt!533242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179752 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533248 () Unit!38986)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76225 (_ BitVec 32) (_ BitVec 32)) Unit!38986)

(assert (=> b!1179752 (= lt!533248 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179752 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25826)))

(declare-fun lt!533241 () Unit!38986)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76225 (_ BitVec 64) (_ BitVec 32) List!25829) Unit!38986)

(assert (=> b!1179752 (= lt!533241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25826))))

(assert (=> b!1179752 false))

(declare-fun b!1179753 () Bool)

(assert (=> b!1179753 (= e!670707 (and e!670717 mapRes!46394))))

(declare-fun condMapEmpty!46394 () Bool)

(declare-fun mapDefault!46394 () ValueCell!14146)

