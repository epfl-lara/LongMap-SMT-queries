; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99224 () Bool)

(assert start!99224)

(declare-fun b_free!24829 () Bool)

(declare-fun b_next!24829 () Bool)

(assert (=> start!99224 (= b_free!24829 (not b_next!24829))))

(declare-fun tp!87197 () Bool)

(declare-fun b_and!40507 () Bool)

(assert (=> start!99224 (= tp!87197 b_and!40507)))

(declare-fun b!1168555 () Bool)

(declare-fun res!775318 () Bool)

(declare-fun e!664131 () Bool)

(assert (=> b!1168555 (=> (not res!775318) (not e!664131))))

(declare-datatypes ((array!75539 0))(
  ( (array!75540 (arr!36420 (Array (_ BitVec 32) (_ BitVec 64))) (size!36956 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75539)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75539 (_ BitVec 32)) Bool)

(assert (=> b!1168555 (= res!775318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168556 () Bool)

(declare-fun e!664130 () Bool)

(declare-fun tp_is_empty!29359 () Bool)

(assert (=> b!1168556 (= e!664130 tp_is_empty!29359)))

(declare-fun b!1168557 () Bool)

(declare-fun e!664134 () Bool)

(assert (=> b!1168557 (= e!664131 e!664134)))

(declare-fun res!775324 () Bool)

(assert (=> b!1168557 (=> (not res!775324) (not e!664134))))

(declare-fun lt!526106 () array!75539)

(assert (=> b!1168557 (= res!775324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526106 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168557 (= lt!526106 (array!75540 (store (arr!36420 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36956 _keys!1208)))))

(declare-fun b!1168558 () Bool)

(declare-fun e!664132 () Bool)

(declare-fun e!664133 () Bool)

(assert (=> b!1168558 (= e!664132 e!664133)))

(declare-fun res!775322 () Bool)

(assert (=> b!1168558 (=> res!775322 e!664133)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168558 (= res!775322 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44273 0))(
  ( (V!44274 (val!14736 Int)) )
))
(declare-fun zeroValue!944 () V!44273)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18808 0))(
  ( (tuple2!18809 (_1!9415 (_ BitVec 64)) (_2!9415 V!44273)) )
))
(declare-datatypes ((List!25548 0))(
  ( (Nil!25545) (Cons!25544 (h!26753 tuple2!18808) (t!37369 List!25548)) )
))
(declare-datatypes ((ListLongMap!16777 0))(
  ( (ListLongMap!16778 (toList!8404 List!25548)) )
))
(declare-fun lt!526100 () ListLongMap!16777)

(declare-fun minValue!944 () V!44273)

(declare-datatypes ((ValueCell!13970 0))(
  ( (ValueCellFull!13970 (v!17373 V!44273)) (EmptyCell!13970) )
))
(declare-datatypes ((array!75541 0))(
  ( (array!75542 (arr!36421 (Array (_ BitVec 32) ValueCell!13970)) (size!36957 (_ BitVec 32))) )
))
(declare-fun lt!526102 () array!75541)

(declare-fun getCurrentListMapNoExtraKeys!4868 (array!75539 array!75541 (_ BitVec 32) (_ BitVec 32) V!44273 V!44273 (_ BitVec 32) Int) ListLongMap!16777)

(assert (=> b!1168558 (= lt!526100 (getCurrentListMapNoExtraKeys!4868 lt!526106 lt!526102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526105 () V!44273)

(declare-fun _values!996 () array!75541)

(assert (=> b!1168558 (= lt!526102 (array!75542 (store (arr!36421 _values!996) i!673 (ValueCellFull!13970 lt!526105)) (size!36957 _values!996)))))

(declare-fun dynLambda!2848 (Int (_ BitVec 64)) V!44273)

(assert (=> b!1168558 (= lt!526105 (dynLambda!2848 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526101 () ListLongMap!16777)

(assert (=> b!1168558 (= lt!526101 (getCurrentListMapNoExtraKeys!4868 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168559 () Bool)

(declare-fun e!664127 () Bool)

(assert (=> b!1168559 (= e!664127 true)))

(declare-fun lt!526107 () ListLongMap!16777)

(declare-fun +!3739 (ListLongMap!16777 tuple2!18808) ListLongMap!16777)

(declare-fun get!18561 (ValueCell!13970 V!44273) V!44273)

(assert (=> b!1168559 (= lt!526100 (+!3739 lt!526107 (tuple2!18809 (select (arr!36420 _keys!1208) from!1455) (get!18561 (select (arr!36421 _values!996) from!1455) lt!526105))))))

(declare-fun b!1168560 () Bool)

(declare-fun res!775319 () Bool)

(assert (=> b!1168560 (=> (not res!775319) (not e!664131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168560 (= res!775319 (validMask!0 mask!1564))))

(declare-fun b!1168561 () Bool)

(declare-fun res!775328 () Bool)

(assert (=> b!1168561 (=> (not res!775328) (not e!664131))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1168561 (= res!775328 (= (select (arr!36420 _keys!1208) i!673) k!934))))

(declare-fun b!1168562 () Bool)

(declare-fun res!775320 () Bool)

(assert (=> b!1168562 (=> (not res!775320) (not e!664131))))

(assert (=> b!1168562 (= res!775320 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36956 _keys!1208))))))

(declare-fun res!775321 () Bool)

(assert (=> start!99224 (=> (not res!775321) (not e!664131))))

(assert (=> start!99224 (= res!775321 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36956 _keys!1208))))))

(assert (=> start!99224 e!664131))

(assert (=> start!99224 tp_is_empty!29359))

(declare-fun array_inv!27838 (array!75539) Bool)

(assert (=> start!99224 (array_inv!27838 _keys!1208)))

(assert (=> start!99224 true))

(assert (=> start!99224 tp!87197))

(declare-fun e!664129 () Bool)

(declare-fun array_inv!27839 (array!75541) Bool)

(assert (=> start!99224 (and (array_inv!27839 _values!996) e!664129)))

(declare-fun b!1168563 () Bool)

(declare-fun res!775317 () Bool)

(assert (=> b!1168563 (=> (not res!775317) (not e!664131))))

(assert (=> b!1168563 (= res!775317 (and (= (size!36957 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36956 _keys!1208) (size!36957 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168564 () Bool)

(assert (=> b!1168564 (= e!664134 (not e!664132))))

(declare-fun res!775326 () Bool)

(assert (=> b!1168564 (=> res!775326 e!664132)))

(assert (=> b!1168564 (= res!775326 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168564 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38560 0))(
  ( (Unit!38561) )
))
(declare-fun lt!526104 () Unit!38560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75539 (_ BitVec 64) (_ BitVec 32)) Unit!38560)

(assert (=> b!1168564 (= lt!526104 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!45863 () Bool)

(declare-fun mapRes!45863 () Bool)

(assert (=> mapIsEmpty!45863 mapRes!45863))

(declare-fun b!1168565 () Bool)

(assert (=> b!1168565 (= e!664133 e!664127)))

(declare-fun res!775325 () Bool)

(assert (=> b!1168565 (=> res!775325 e!664127)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168565 (= res!775325 (not (validKeyInArray!0 (select (arr!36420 _keys!1208) from!1455))))))

(declare-fun lt!526098 () ListLongMap!16777)

(assert (=> b!1168565 (= lt!526098 lt!526107)))

(declare-fun lt!526103 () ListLongMap!16777)

(declare-fun -!1476 (ListLongMap!16777 (_ BitVec 64)) ListLongMap!16777)

(assert (=> b!1168565 (= lt!526107 (-!1476 lt!526103 k!934))))

(assert (=> b!1168565 (= lt!526098 (getCurrentListMapNoExtraKeys!4868 lt!526106 lt!526102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1168565 (= lt!526103 (getCurrentListMapNoExtraKeys!4868 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526099 () Unit!38560)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!703 (array!75539 array!75541 (_ BitVec 32) (_ BitVec 32) V!44273 V!44273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38560)

(assert (=> b!1168565 (= lt!526099 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45863 () Bool)

(declare-fun tp!87198 () Bool)

(assert (=> mapNonEmpty!45863 (= mapRes!45863 (and tp!87198 e!664130))))

(declare-fun mapValue!45863 () ValueCell!13970)

(declare-fun mapKey!45863 () (_ BitVec 32))

(declare-fun mapRest!45863 () (Array (_ BitVec 32) ValueCell!13970))

(assert (=> mapNonEmpty!45863 (= (arr!36421 _values!996) (store mapRest!45863 mapKey!45863 mapValue!45863))))

(declare-fun b!1168566 () Bool)

(declare-fun e!664126 () Bool)

(assert (=> b!1168566 (= e!664126 tp_is_empty!29359)))

(declare-fun b!1168567 () Bool)

(declare-fun res!775323 () Bool)

(assert (=> b!1168567 (=> (not res!775323) (not e!664134))))

(declare-datatypes ((List!25549 0))(
  ( (Nil!25546) (Cons!25545 (h!26754 (_ BitVec 64)) (t!37370 List!25549)) )
))
(declare-fun arrayNoDuplicates!0 (array!75539 (_ BitVec 32) List!25549) Bool)

(assert (=> b!1168567 (= res!775323 (arrayNoDuplicates!0 lt!526106 #b00000000000000000000000000000000 Nil!25546))))

(declare-fun b!1168568 () Bool)

(declare-fun res!775316 () Bool)

(assert (=> b!1168568 (=> (not res!775316) (not e!664131))))

(assert (=> b!1168568 (= res!775316 (validKeyInArray!0 k!934))))

(declare-fun b!1168569 () Bool)

(assert (=> b!1168569 (= e!664129 (and e!664126 mapRes!45863))))

(declare-fun condMapEmpty!45863 () Bool)

(declare-fun mapDefault!45863 () ValueCell!13970)

