; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100052 () Bool)

(assert start!100052)

(declare-fun b_free!25631 () Bool)

(declare-fun b_next!25631 () Bool)

(assert (=> start!100052 (= b_free!25631 (not b_next!25631))))

(declare-fun tp!89606 () Bool)

(declare-fun b_and!42129 () Bool)

(assert (=> start!100052 (= tp!89606 b_and!42129)))

(declare-fun mapNonEmpty!47069 () Bool)

(declare-fun mapRes!47069 () Bool)

(declare-fun tp!89607 () Bool)

(declare-fun e!677817 () Bool)

(assert (=> mapNonEmpty!47069 (= mapRes!47069 (and tp!89607 e!677817))))

(declare-datatypes ((V!45341 0))(
  ( (V!45342 (val!15137 Int)) )
))
(declare-datatypes ((ValueCell!14371 0))(
  ( (ValueCellFull!14371 (v!17775 V!45341)) (EmptyCell!14371) )
))
(declare-fun mapValue!47069 () ValueCell!14371)

(declare-fun mapRest!47069 () (Array (_ BitVec 32) ValueCell!14371))

(declare-fun mapKey!47069 () (_ BitVec 32))

(declare-datatypes ((array!77107 0))(
  ( (array!77108 (arr!37203 (Array (_ BitVec 32) ValueCell!14371)) (size!37739 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77107)

(assert (=> mapNonEmpty!47069 (= (arr!37203 _values!996) (store mapRest!47069 mapKey!47069 mapValue!47069))))

(declare-fun b!1192502 () Bool)

(declare-fun res!793293 () Bool)

(declare-fun e!677812 () Bool)

(assert (=> b!1192502 (=> (not res!793293) (not e!677812))))

(declare-datatypes ((array!77109 0))(
  ( (array!77110 (arr!37204 (Array (_ BitVec 32) (_ BitVec 64))) (size!37740 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77109)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1192502 (= res!793293 (= (select (arr!37204 _keys!1208) i!673) k!934))))

(declare-fun b!1192503 () Bool)

(declare-fun e!677813 () Bool)

(assert (=> b!1192503 (= e!677813 true)))

(declare-fun zeroValue!944 () V!45341)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!542242 () array!77109)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45341)

(declare-fun lt!542243 () array!77107)

(declare-datatypes ((tuple2!19456 0))(
  ( (tuple2!19457 (_1!9739 (_ BitVec 64)) (_2!9739 V!45341)) )
))
(declare-datatypes ((List!26199 0))(
  ( (Nil!26196) (Cons!26195 (h!27404 tuple2!19456) (t!38822 List!26199)) )
))
(declare-datatypes ((ListLongMap!17425 0))(
  ( (ListLongMap!17426 (toList!8728 List!26199)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5169 (array!77109 array!77107 (_ BitVec 32) (_ BitVec 32) V!45341 V!45341 (_ BitVec 32) Int) ListLongMap!17425)

(declare-fun -!1753 (ListLongMap!17425 (_ BitVec 64)) ListLongMap!17425)

(assert (=> b!1192503 (= (getCurrentListMapNoExtraKeys!5169 lt!542242 lt!542243 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1753 (getCurrentListMapNoExtraKeys!5169 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39560 0))(
  ( (Unit!39561) )
))
(declare-fun lt!542241 () Unit!39560)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!962 (array!77109 array!77107 (_ BitVec 32) (_ BitVec 32) V!45341 V!45341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39560)

(assert (=> b!1192503 (= lt!542241 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!962 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192504 () Bool)

(declare-fun res!793294 () Bool)

(assert (=> b!1192504 (=> (not res!793294) (not e!677812))))

(declare-datatypes ((List!26200 0))(
  ( (Nil!26197) (Cons!26196 (h!27405 (_ BitVec 64)) (t!38823 List!26200)) )
))
(declare-fun arrayNoDuplicates!0 (array!77109 (_ BitVec 32) List!26200) Bool)

(assert (=> b!1192504 (= res!793294 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26197))))

(declare-fun b!1192505 () Bool)

(declare-fun res!793296 () Bool)

(declare-fun e!677818 () Bool)

(assert (=> b!1192505 (=> (not res!793296) (not e!677818))))

(assert (=> b!1192505 (= res!793296 (arrayNoDuplicates!0 lt!542242 #b00000000000000000000000000000000 Nil!26197))))

(declare-fun b!1192506 () Bool)

(declare-fun e!677815 () Bool)

(declare-fun e!677816 () Bool)

(assert (=> b!1192506 (= e!677815 (and e!677816 mapRes!47069))))

(declare-fun condMapEmpty!47069 () Bool)

(declare-fun mapDefault!47069 () ValueCell!14371)

