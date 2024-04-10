; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99704 () Bool)

(assert start!99704)

(declare-fun b_free!25283 () Bool)

(declare-fun b_next!25283 () Bool)

(assert (=> start!99704 (= b_free!25283 (not b_next!25283))))

(declare-fun tp!88562 () Bool)

(declare-fun b_and!41433 () Bool)

(assert (=> start!99704 (= tp!88562 b_and!41433)))

(declare-fun b!1183059 () Bool)

(declare-fun res!786273 () Bool)

(declare-fun e!672634 () Bool)

(assert (=> b!1183059 (=> (not res!786273) (not e!672634))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183059 (= res!786273 (validMask!0 mask!1564))))

(declare-fun b!1183060 () Bool)

(declare-datatypes ((Unit!39150 0))(
  ( (Unit!39151) )
))
(declare-fun e!672627 () Unit!39150)

(declare-fun Unit!39152 () Unit!39150)

(assert (=> b!1183060 (= e!672627 Unit!39152)))

(declare-datatypes ((array!76429 0))(
  ( (array!76430 (arr!36864 (Array (_ BitVec 32) (_ BitVec 64))) (size!37400 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76429)

(declare-fun lt!535819 () Unit!39150)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76429 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39150)

(assert (=> b!1183060 (= lt!535819 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183060 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535825 () Unit!39150)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76429 (_ BitVec 32) (_ BitVec 32)) Unit!39150)

(assert (=> b!1183060 (= lt!535825 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25922 0))(
  ( (Nil!25919) (Cons!25918 (h!27127 (_ BitVec 64)) (t!38197 List!25922)) )
))
(declare-fun arrayNoDuplicates!0 (array!76429 (_ BitVec 32) List!25922) Bool)

(assert (=> b!1183060 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25919)))

(declare-fun lt!535828 () Unit!39150)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76429 (_ BitVec 64) (_ BitVec 32) List!25922) Unit!39150)

(assert (=> b!1183060 (= lt!535828 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25919))))

(assert (=> b!1183060 false))

(declare-fun b!1183061 () Bool)

(declare-fun e!672626 () Bool)

(assert (=> b!1183061 (= e!672634 e!672626)))

(declare-fun res!786276 () Bool)

(assert (=> b!1183061 (=> (not res!786276) (not e!672626))))

(declare-fun lt!535836 () array!76429)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76429 (_ BitVec 32)) Bool)

(assert (=> b!1183061 (= res!786276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535836 mask!1564))))

(assert (=> b!1183061 (= lt!535836 (array!76430 (store (arr!36864 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37400 _keys!1208)))))

(declare-fun b!1183062 () Bool)

(declare-fun e!672629 () Bool)

(declare-fun e!672623 () Bool)

(assert (=> b!1183062 (= e!672629 e!672623)))

(declare-fun res!786282 () Bool)

(assert (=> b!1183062 (=> res!786282 e!672623)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183062 (= res!786282 (not (validKeyInArray!0 (select (arr!36864 _keys!1208) from!1455))))))

(declare-datatypes ((V!44877 0))(
  ( (V!44878 (val!14963 Int)) )
))
(declare-datatypes ((tuple2!19182 0))(
  ( (tuple2!19183 (_1!9602 (_ BitVec 64)) (_2!9602 V!44877)) )
))
(declare-datatypes ((List!25923 0))(
  ( (Nil!25920) (Cons!25919 (h!27128 tuple2!19182) (t!38198 List!25923)) )
))
(declare-datatypes ((ListLongMap!17151 0))(
  ( (ListLongMap!17152 (toList!8591 List!25923)) )
))
(declare-fun lt!535824 () ListLongMap!17151)

(declare-fun lt!535822 () ListLongMap!17151)

(assert (=> b!1183062 (= lt!535824 lt!535822)))

(declare-fun lt!535832 () ListLongMap!17151)

(declare-fun -!1626 (ListLongMap!17151 (_ BitVec 64)) ListLongMap!17151)

(assert (=> b!1183062 (= lt!535822 (-!1626 lt!535832 k!934))))

(declare-fun zeroValue!944 () V!44877)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44877)

(declare-datatypes ((ValueCell!14197 0))(
  ( (ValueCellFull!14197 (v!17601 V!44877)) (EmptyCell!14197) )
))
(declare-datatypes ((array!76431 0))(
  ( (array!76432 (arr!36865 (Array (_ BitVec 32) ValueCell!14197)) (size!37401 (_ BitVec 32))) )
))
(declare-fun lt!535823 () array!76431)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5042 (array!76429 array!76431 (_ BitVec 32) (_ BitVec 32) V!44877 V!44877 (_ BitVec 32) Int) ListLongMap!17151)

(assert (=> b!1183062 (= lt!535824 (getCurrentListMapNoExtraKeys!5042 lt!535836 lt!535823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76431)

(assert (=> b!1183062 (= lt!535832 (getCurrentListMapNoExtraKeys!5042 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535829 () Unit!39150)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!848 (array!76429 array!76431 (_ BitVec 32) (_ BitVec 32) V!44877 V!44877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39150)

(assert (=> b!1183062 (= lt!535829 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!848 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183063 () Bool)

(declare-fun res!786271 () Bool)

(assert (=> b!1183063 (=> (not res!786271) (not e!672626))))

(assert (=> b!1183063 (= res!786271 (arrayNoDuplicates!0 lt!535836 #b00000000000000000000000000000000 Nil!25919))))

(declare-fun mapNonEmpty!46547 () Bool)

(declare-fun mapRes!46547 () Bool)

(declare-fun tp!88563 () Bool)

(declare-fun e!672631 () Bool)

(assert (=> mapNonEmpty!46547 (= mapRes!46547 (and tp!88563 e!672631))))

(declare-fun mapRest!46547 () (Array (_ BitVec 32) ValueCell!14197))

(declare-fun mapValue!46547 () ValueCell!14197)

(declare-fun mapKey!46547 () (_ BitVec 32))

(assert (=> mapNonEmpty!46547 (= (arr!36865 _values!996) (store mapRest!46547 mapKey!46547 mapValue!46547))))

(declare-fun b!1183064 () Bool)

(declare-fun e!672632 () Bool)

(assert (=> b!1183064 (= e!672626 (not e!672632))))

(declare-fun res!786278 () Bool)

(assert (=> b!1183064 (=> res!786278 e!672632)))

(assert (=> b!1183064 (= res!786278 (bvsgt from!1455 i!673))))

(assert (=> b!1183064 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!535818 () Unit!39150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76429 (_ BitVec 64) (_ BitVec 32)) Unit!39150)

(assert (=> b!1183064 (= lt!535818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183065 () Bool)

(declare-fun Unit!39153 () Unit!39150)

(assert (=> b!1183065 (= e!672627 Unit!39153)))

(declare-fun b!1183066 () Bool)

(declare-fun e!672630 () Bool)

(declare-fun e!672625 () Bool)

(assert (=> b!1183066 (= e!672630 (and e!672625 mapRes!46547))))

(declare-fun condMapEmpty!46547 () Bool)

(declare-fun mapDefault!46547 () ValueCell!14197)

