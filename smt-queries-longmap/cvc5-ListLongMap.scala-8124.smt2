; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99610 () Bool)

(assert start!99610)

(declare-fun b_free!25189 () Bool)

(declare-fun b_next!25189 () Bool)

(assert (=> start!99610 (= b_free!25189 (not b_next!25189))))

(declare-fun tp!88280 () Bool)

(declare-fun b_and!41245 () Bool)

(assert (=> start!99610 (= tp!88280 b_and!41245)))

(declare-fun b!1180005 () Bool)

(declare-fun res!784030 () Bool)

(declare-fun e!670873 () Bool)

(assert (=> b!1180005 (=> (not res!784030) (not e!670873))))

(declare-datatypes ((array!76241 0))(
  ( (array!76242 (arr!36770 (Array (_ BitVec 32) (_ BitVec 64))) (size!37306 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76241)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1180005 (= res!784030 (= (select (arr!36770 _keys!1208) i!673) k!934))))

(declare-fun b!1180006 () Bool)

(declare-fun res!784018 () Bool)

(declare-fun e!670864 () Bool)

(assert (=> b!1180006 (=> (not res!784018) (not e!670864))))

(declare-fun lt!533420 () array!76241)

(declare-datatypes ((List!25836 0))(
  ( (Nil!25833) (Cons!25832 (h!27041 (_ BitVec 64)) (t!38017 List!25836)) )
))
(declare-fun arrayNoDuplicates!0 (array!76241 (_ BitVec 32) List!25836) Bool)

(assert (=> b!1180006 (= res!784018 (arrayNoDuplicates!0 lt!533420 #b00000000000000000000000000000000 Nil!25833))))

(declare-fun b!1180007 () Bool)

(declare-fun e!670861 () Bool)

(declare-fun tp_is_empty!29719 () Bool)

(assert (=> b!1180007 (= e!670861 tp_is_empty!29719)))

(declare-fun b!1180008 () Bool)

(declare-fun res!784023 () Bool)

(assert (=> b!1180008 (=> (not res!784023) (not e!670873))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180008 (= res!784023 (validMask!0 mask!1564))))

(declare-fun b!1180009 () Bool)

(declare-fun res!784020 () Bool)

(assert (=> b!1180009 (=> (not res!784020) (not e!670873))))

(assert (=> b!1180009 (= res!784020 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37306 _keys!1208))))))

(declare-fun b!1180010 () Bool)

(declare-fun res!784026 () Bool)

(assert (=> b!1180010 (=> (not res!784026) (not e!670873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76241 (_ BitVec 32)) Bool)

(assert (=> b!1180010 (= res!784026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180011 () Bool)

(declare-fun res!784024 () Bool)

(assert (=> b!1180011 (=> (not res!784024) (not e!670873))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44753 0))(
  ( (V!44754 (val!14916 Int)) )
))
(declare-datatypes ((ValueCell!14150 0))(
  ( (ValueCellFull!14150 (v!17554 V!44753)) (EmptyCell!14150) )
))
(declare-datatypes ((array!76243 0))(
  ( (array!76244 (arr!36771 (Array (_ BitVec 32) ValueCell!14150)) (size!37307 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76243)

(assert (=> b!1180011 (= res!784024 (and (= (size!37307 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37306 _keys!1208) (size!37307 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46406 () Bool)

(declare-fun mapRes!46406 () Bool)

(declare-fun tp!88281 () Bool)

(declare-fun e!670866 () Bool)

(assert (=> mapNonEmpty!46406 (= mapRes!46406 (and tp!88281 e!670866))))

(declare-fun mapKey!46406 () (_ BitVec 32))

(declare-fun mapRest!46406 () (Array (_ BitVec 32) ValueCell!14150))

(declare-fun mapValue!46406 () ValueCell!14150)

(assert (=> mapNonEmpty!46406 (= (arr!36771 _values!996) (store mapRest!46406 mapKey!46406 mapValue!46406))))

(declare-fun b!1180012 () Bool)

(declare-fun e!670869 () Bool)

(declare-fun e!670862 () Bool)

(assert (=> b!1180012 (= e!670869 e!670862)))

(declare-fun res!784025 () Bool)

(assert (=> b!1180012 (=> res!784025 e!670862)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180012 (= res!784025 (not (= (select (arr!36770 _keys!1208) from!1455) k!934)))))

(declare-fun b!1180013 () Bool)

(declare-fun e!670871 () Bool)

(declare-fun e!670867 () Bool)

(assert (=> b!1180013 (= e!670871 e!670867)))

(declare-fun res!784016 () Bool)

(assert (=> b!1180013 (=> res!784016 e!670867)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180013 (= res!784016 (not (validKeyInArray!0 (select (arr!36770 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19098 0))(
  ( (tuple2!19099 (_1!9560 (_ BitVec 64)) (_2!9560 V!44753)) )
))
(declare-datatypes ((List!25837 0))(
  ( (Nil!25834) (Cons!25833 (h!27042 tuple2!19098) (t!38018 List!25837)) )
))
(declare-datatypes ((ListLongMap!17067 0))(
  ( (ListLongMap!17068 (toList!8549 List!25837)) )
))
(declare-fun lt!533423 () ListLongMap!17067)

(declare-fun lt!533422 () ListLongMap!17067)

(assert (=> b!1180013 (= lt!533423 lt!533422)))

(declare-fun lt!533427 () ListLongMap!17067)

(declare-fun -!1591 (ListLongMap!17067 (_ BitVec 64)) ListLongMap!17067)

(assert (=> b!1180013 (= lt!533422 (-!1591 lt!533427 k!934))))

(declare-fun zeroValue!944 () V!44753)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533432 () array!76243)

(declare-fun minValue!944 () V!44753)

(declare-fun getCurrentListMapNoExtraKeys!5003 (array!76241 array!76243 (_ BitVec 32) (_ BitVec 32) V!44753 V!44753 (_ BitVec 32) Int) ListLongMap!17067)

(assert (=> b!1180013 (= lt!533423 (getCurrentListMapNoExtraKeys!5003 lt!533420 lt!533432 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180013 (= lt!533427 (getCurrentListMapNoExtraKeys!5003 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39000 0))(
  ( (Unit!39001) )
))
(declare-fun lt!533424 () Unit!39000)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!818 (array!76241 array!76243 (_ BitVec 32) (_ BitVec 32) V!44753 V!44753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39000)

(assert (=> b!1180013 (= lt!533424 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180014 () Bool)

(assert (=> b!1180014 (= e!670873 e!670864)))

(declare-fun res!784019 () Bool)

(assert (=> b!1180014 (=> (not res!784019) (not e!670864))))

(assert (=> b!1180014 (= res!784019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533420 mask!1564))))

(assert (=> b!1180014 (= lt!533420 (array!76242 (store (arr!36770 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37306 _keys!1208)))))

(declare-fun b!1180015 () Bool)

(declare-fun e!670870 () Bool)

(assert (=> b!1180015 (= e!670870 e!670871)))

(declare-fun res!784015 () Bool)

(assert (=> b!1180015 (=> res!784015 e!670871)))

(assert (=> b!1180015 (= res!784015 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!533426 () ListLongMap!17067)

(assert (=> b!1180015 (= lt!533426 (getCurrentListMapNoExtraKeys!5003 lt!533420 lt!533432 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533429 () V!44753)

(assert (=> b!1180015 (= lt!533432 (array!76244 (store (arr!36771 _values!996) i!673 (ValueCellFull!14150 lt!533429)) (size!37307 _values!996)))))

(declare-fun dynLambda!2963 (Int (_ BitVec 64)) V!44753)

(assert (=> b!1180015 (= lt!533429 (dynLambda!2963 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533430 () ListLongMap!17067)

(assert (=> b!1180015 (= lt!533430 (getCurrentListMapNoExtraKeys!5003 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180016 () Bool)

(declare-fun res!784017 () Bool)

(assert (=> b!1180016 (=> (not res!784017) (not e!670873))))

(assert (=> b!1180016 (= res!784017 (validKeyInArray!0 k!934))))

(declare-fun b!1180017 () Bool)

(declare-fun e!670868 () Unit!39000)

(declare-fun Unit!39002 () Unit!39000)

(assert (=> b!1180017 (= e!670868 Unit!39002)))

(declare-fun b!1180018 () Bool)

(assert (=> b!1180018 (= e!670864 (not e!670870))))

(declare-fun res!784014 () Bool)

(assert (=> b!1180018 (=> res!784014 e!670870)))

(assert (=> b!1180018 (= res!784014 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180018 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!533428 () Unit!39000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76241 (_ BitVec 64) (_ BitVec 32)) Unit!39000)

(assert (=> b!1180018 (= lt!533428 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1180019 () Bool)

(declare-fun res!784027 () Bool)

(declare-fun e!670863 () Bool)

(assert (=> b!1180019 (=> (not res!784027) (not e!670863))))

(declare-fun lt!533433 () tuple2!19098)

(declare-fun +!3860 (ListLongMap!17067 tuple2!19098) ListLongMap!17067)

(assert (=> b!1180019 (= res!784027 (= lt!533430 (+!3860 lt!533427 lt!533433)))))

(declare-fun b!1180020 () Bool)

(assert (=> b!1180020 (= e!670866 tp_is_empty!29719)))

(declare-fun res!784022 () Bool)

(assert (=> start!99610 (=> (not res!784022) (not e!670873))))

(assert (=> start!99610 (= res!784022 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37306 _keys!1208))))))

(assert (=> start!99610 e!670873))

(assert (=> start!99610 tp_is_empty!29719))

(declare-fun array_inv!28076 (array!76241) Bool)

(assert (=> start!99610 (array_inv!28076 _keys!1208)))

(assert (=> start!99610 true))

(assert (=> start!99610 tp!88280))

(declare-fun e!670872 () Bool)

(declare-fun array_inv!28077 (array!76243) Bool)

(assert (=> start!99610 (and (array_inv!28077 _values!996) e!670872)))

(declare-fun b!1180021 () Bool)

(assert (=> b!1180021 (= e!670863 (= lt!533422 lt!533423))))

(declare-fun mapIsEmpty!46406 () Bool)

(assert (=> mapIsEmpty!46406 mapRes!46406))

(declare-fun b!1180022 () Bool)

(declare-fun res!784028 () Bool)

(assert (=> b!1180022 (=> (not res!784028) (not e!670873))))

(assert (=> b!1180022 (= res!784028 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25833))))

(declare-fun b!1180023 () Bool)

(assert (=> b!1180023 (= e!670872 (and e!670861 mapRes!46406))))

(declare-fun condMapEmpty!46406 () Bool)

(declare-fun mapDefault!46406 () ValueCell!14150)

