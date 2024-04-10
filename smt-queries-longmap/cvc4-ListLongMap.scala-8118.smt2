; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99578 () Bool)

(assert start!99578)

(declare-fun b_free!25157 () Bool)

(declare-fun b_next!25157 () Bool)

(assert (=> start!99578 (= b_free!25157 (not b_next!25157))))

(declare-fun tp!88185 () Bool)

(declare-fun b_and!41181 () Bool)

(assert (=> start!99578 (= tp!88185 b_and!41181)))

(declare-fun b!1178945 () Bool)

(declare-fun e!670238 () Bool)

(declare-fun e!670248 () Bool)

(assert (=> b!1178945 (= e!670238 e!670248)))

(declare-fun res!783232 () Bool)

(assert (=> b!1178945 (=> res!783232 e!670248)))

(declare-datatypes ((array!76177 0))(
  ( (array!76178 (arr!36738 (Array (_ BitVec 32) (_ BitVec 64))) (size!37274 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76177)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178945 (= res!783232 (not (= (select (arr!36738 _keys!1208) from!1455) k!934)))))

(declare-fun b!1178946 () Bool)

(declare-fun e!670243 () Bool)

(declare-fun e!670239 () Bool)

(assert (=> b!1178946 (= e!670243 e!670239)))

(declare-fun res!783241 () Bool)

(assert (=> b!1178946 (=> res!783241 e!670239)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178946 (= res!783241 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44709 0))(
  ( (V!44710 (val!14900 Int)) )
))
(declare-fun zeroValue!944 () V!44709)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14134 0))(
  ( (ValueCellFull!14134 (v!17538 V!44709)) (EmptyCell!14134) )
))
(declare-datatypes ((array!76179 0))(
  ( (array!76180 (arr!36739 (Array (_ BitVec 32) ValueCell!14134)) (size!37275 (_ BitVec 32))) )
))
(declare-fun lt!532713 () array!76179)

(declare-datatypes ((tuple2!19070 0))(
  ( (tuple2!19071 (_1!9546 (_ BitVec 64)) (_2!9546 V!44709)) )
))
(declare-datatypes ((List!25807 0))(
  ( (Nil!25804) (Cons!25803 (h!27012 tuple2!19070) (t!37956 List!25807)) )
))
(declare-datatypes ((ListLongMap!17039 0))(
  ( (ListLongMap!17040 (toList!8535 List!25807)) )
))
(declare-fun lt!532703 () ListLongMap!17039)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532700 () array!76177)

(declare-fun minValue!944 () V!44709)

(declare-fun getCurrentListMapNoExtraKeys!4990 (array!76177 array!76179 (_ BitVec 32) (_ BitVec 32) V!44709 V!44709 (_ BitVec 32) Int) ListLongMap!17039)

(assert (=> b!1178946 (= lt!532703 (getCurrentListMapNoExtraKeys!4990 lt!532700 lt!532713 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532701 () V!44709)

(declare-fun _values!996 () array!76179)

(assert (=> b!1178946 (= lt!532713 (array!76180 (store (arr!36739 _values!996) i!673 (ValueCellFull!14134 lt!532701)) (size!37275 _values!996)))))

(declare-fun dynLambda!2951 (Int (_ BitVec 64)) V!44709)

(assert (=> b!1178946 (= lt!532701 (dynLambda!2951 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532706 () ListLongMap!17039)

(assert (=> b!1178946 (= lt!532706 (getCurrentListMapNoExtraKeys!4990 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178947 () Bool)

(declare-fun res!783236 () Bool)

(declare-fun e!670247 () Bool)

(assert (=> b!1178947 (=> (not res!783236) (not e!670247))))

(declare-datatypes ((List!25808 0))(
  ( (Nil!25805) (Cons!25804 (h!27013 (_ BitVec 64)) (t!37957 List!25808)) )
))
(declare-fun arrayNoDuplicates!0 (array!76177 (_ BitVec 32) List!25808) Bool)

(assert (=> b!1178947 (= res!783236 (arrayNoDuplicates!0 lt!532700 #b00000000000000000000000000000000 Nil!25805))))

(declare-fun b!1178948 () Bool)

(declare-fun res!783227 () Bool)

(declare-fun e!670246 () Bool)

(assert (=> b!1178948 (=> (not res!783227) (not e!670246))))

(assert (=> b!1178948 (= res!783227 (and (= (size!37275 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37274 _keys!1208) (size!37275 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!783229 () Bool)

(assert (=> start!99578 (=> (not res!783229) (not e!670246))))

(assert (=> start!99578 (= res!783229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37274 _keys!1208))))))

(assert (=> start!99578 e!670246))

(declare-fun tp_is_empty!29687 () Bool)

(assert (=> start!99578 tp_is_empty!29687))

(declare-fun array_inv!28050 (array!76177) Bool)

(assert (=> start!99578 (array_inv!28050 _keys!1208)))

(assert (=> start!99578 true))

(assert (=> start!99578 tp!88185))

(declare-fun e!670241 () Bool)

(declare-fun array_inv!28051 (array!76179) Bool)

(assert (=> start!99578 (and (array_inv!28051 _values!996) e!670241)))

(declare-fun b!1178949 () Bool)

(declare-fun lt!532699 () tuple2!19070)

(declare-fun e!670242 () Bool)

(declare-fun lt!532709 () ListLongMap!17039)

(declare-fun +!3849 (ListLongMap!17039 tuple2!19070) ListLongMap!17039)

(assert (=> b!1178949 (= e!670242 (= lt!532706 (+!3849 lt!532709 lt!532699)))))

(declare-fun b!1178950 () Bool)

(declare-datatypes ((Unit!38950 0))(
  ( (Unit!38951) )
))
(declare-fun e!670249 () Unit!38950)

(declare-fun Unit!38952 () Unit!38950)

(assert (=> b!1178950 (= e!670249 Unit!38952)))

(declare-fun lt!532707 () Unit!38950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76177 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38950)

(assert (=> b!1178950 (= lt!532707 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178950 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532711 () Unit!38950)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76177 (_ BitVec 32) (_ BitVec 32)) Unit!38950)

(assert (=> b!1178950 (= lt!532711 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178950 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25805)))

(declare-fun lt!532710 () Unit!38950)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76177 (_ BitVec 64) (_ BitVec 32) List!25808) Unit!38950)

(assert (=> b!1178950 (= lt!532710 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25805))))

(assert (=> b!1178950 false))

(declare-fun b!1178951 () Bool)

(assert (=> b!1178951 (= e!670247 (not e!670243))))

(declare-fun res!783240 () Bool)

(assert (=> b!1178951 (=> res!783240 e!670243)))

(assert (=> b!1178951 (= res!783240 (bvsgt from!1455 i!673))))

(assert (=> b!1178951 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!532704 () Unit!38950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76177 (_ BitVec 64) (_ BitVec 32)) Unit!38950)

(assert (=> b!1178951 (= lt!532704 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178952 () Bool)

(declare-fun res!783234 () Bool)

(assert (=> b!1178952 (=> (not res!783234) (not e!670246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76177 (_ BitVec 32)) Bool)

(assert (=> b!1178952 (= res!783234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178953 () Bool)

(declare-fun res!783226 () Bool)

(assert (=> b!1178953 (=> (not res!783226) (not e!670246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178953 (= res!783226 (validMask!0 mask!1564))))

(declare-fun b!1178954 () Bool)

(declare-fun res!783228 () Bool)

(assert (=> b!1178954 (=> (not res!783228) (not e!670246))))

(assert (=> b!1178954 (= res!783228 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25805))))

(declare-fun b!1178955 () Bool)

(declare-fun res!783231 () Bool)

(assert (=> b!1178955 (=> (not res!783231) (not e!670246))))

(assert (=> b!1178955 (= res!783231 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37274 _keys!1208))))))

(declare-fun mapIsEmpty!46358 () Bool)

(declare-fun mapRes!46358 () Bool)

(assert (=> mapIsEmpty!46358 mapRes!46358))

(declare-fun b!1178956 () Bool)

(declare-fun e!670244 () Bool)

(assert (=> b!1178956 (= e!670244 true)))

(assert (=> b!1178956 e!670242))

(declare-fun res!783238 () Bool)

(assert (=> b!1178956 (=> (not res!783238) (not e!670242))))

(assert (=> b!1178956 (= res!783238 (not (= (select (arr!36738 _keys!1208) from!1455) k!934)))))

(declare-fun lt!532708 () Unit!38950)

(assert (=> b!1178956 (= lt!532708 e!670249)))

(declare-fun c!116859 () Bool)

(assert (=> b!1178956 (= c!116859 (= (select (arr!36738 _keys!1208) from!1455) k!934))))

(assert (=> b!1178956 e!670238))

(declare-fun res!783233 () Bool)

(assert (=> b!1178956 (=> (not res!783233) (not e!670238))))

(declare-fun lt!532712 () ListLongMap!17039)

(assert (=> b!1178956 (= res!783233 (= lt!532703 (+!3849 lt!532712 lt!532699)))))

(declare-fun get!18779 (ValueCell!14134 V!44709) V!44709)

(assert (=> b!1178956 (= lt!532699 (tuple2!19071 (select (arr!36738 _keys!1208) from!1455) (get!18779 (select (arr!36739 _values!996) from!1455) lt!532701)))))

(declare-fun mapNonEmpty!46358 () Bool)

(declare-fun tp!88184 () Bool)

(declare-fun e!670245 () Bool)

(assert (=> mapNonEmpty!46358 (= mapRes!46358 (and tp!88184 e!670245))))

(declare-fun mapRest!46358 () (Array (_ BitVec 32) ValueCell!14134))

(declare-fun mapKey!46358 () (_ BitVec 32))

(declare-fun mapValue!46358 () ValueCell!14134)

(assert (=> mapNonEmpty!46358 (= (arr!36739 _values!996) (store mapRest!46358 mapKey!46358 mapValue!46358))))

(declare-fun b!1178957 () Bool)

(assert (=> b!1178957 (= e!670239 e!670244)))

(declare-fun res!783239 () Bool)

(assert (=> b!1178957 (=> res!783239 e!670244)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178957 (= res!783239 (not (validKeyInArray!0 (select (arr!36738 _keys!1208) from!1455))))))

(declare-fun lt!532702 () ListLongMap!17039)

(assert (=> b!1178957 (= lt!532702 lt!532712)))

(declare-fun -!1580 (ListLongMap!17039 (_ BitVec 64)) ListLongMap!17039)

(assert (=> b!1178957 (= lt!532712 (-!1580 lt!532709 k!934))))

(assert (=> b!1178957 (= lt!532702 (getCurrentListMapNoExtraKeys!4990 lt!532700 lt!532713 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178957 (= lt!532709 (getCurrentListMapNoExtraKeys!4990 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532705 () Unit!38950)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!807 (array!76177 array!76179 (_ BitVec 32) (_ BitVec 32) V!44709 V!44709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38950)

(assert (=> b!1178957 (= lt!532705 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178958 () Bool)

(declare-fun res!783230 () Bool)

(assert (=> b!1178958 (=> (not res!783230) (not e!670246))))

(assert (=> b!1178958 (= res!783230 (validKeyInArray!0 k!934))))

(declare-fun b!1178959 () Bool)

(declare-fun Unit!38953 () Unit!38950)

(assert (=> b!1178959 (= e!670249 Unit!38953)))

(declare-fun b!1178960 () Bool)

(declare-fun res!783235 () Bool)

(assert (=> b!1178960 (=> (not res!783235) (not e!670246))))

(assert (=> b!1178960 (= res!783235 (= (select (arr!36738 _keys!1208) i!673) k!934))))

(declare-fun b!1178961 () Bool)

(assert (=> b!1178961 (= e!670245 tp_is_empty!29687)))

(declare-fun b!1178962 () Bool)

(assert (=> b!1178962 (= e!670248 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178963 () Bool)

(assert (=> b!1178963 (= e!670246 e!670247)))

(declare-fun res!783237 () Bool)

(assert (=> b!1178963 (=> (not res!783237) (not e!670247))))

(assert (=> b!1178963 (= res!783237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532700 mask!1564))))

(assert (=> b!1178963 (= lt!532700 (array!76178 (store (arr!36738 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37274 _keys!1208)))))

(declare-fun b!1178964 () Bool)

(declare-fun e!670240 () Bool)

(assert (=> b!1178964 (= e!670240 tp_is_empty!29687)))

(declare-fun b!1178965 () Bool)

(assert (=> b!1178965 (= e!670241 (and e!670240 mapRes!46358))))

(declare-fun condMapEmpty!46358 () Bool)

(declare-fun mapDefault!46358 () ValueCell!14134)

