; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98046 () Bool)

(assert start!98046)

(declare-fun b_free!23747 () Bool)

(declare-fun b_next!23747 () Bool)

(assert (=> start!98046 (= b_free!23747 (not b_next!23747))))

(declare-fun tp!83944 () Bool)

(declare-fun b_and!38277 () Bool)

(assert (=> start!98046 (= tp!83944 b_and!38277)))

(declare-fun b!1125504 () Bool)

(declare-fun res!752075 () Bool)

(declare-fun e!640674 () Bool)

(assert (=> b!1125504 (=> (not res!752075) (not e!640674))))

(declare-datatypes ((array!73417 0))(
  ( (array!73418 (arr!35361 (Array (_ BitVec 32) (_ BitVec 64))) (size!35897 (_ BitVec 32))) )
))
(declare-fun lt!499877 () array!73417)

(declare-datatypes ((List!24617 0))(
  ( (Nil!24614) (Cons!24613 (h!25822 (_ BitVec 64)) (t!35356 List!24617)) )
))
(declare-fun arrayNoDuplicates!0 (array!73417 (_ BitVec 32) List!24617) Bool)

(assert (=> b!1125504 (= res!752075 (arrayNoDuplicates!0 lt!499877 #b00000000000000000000000000000000 Nil!24614))))

(declare-fun b!1125505 () Bool)

(declare-fun e!640668 () Bool)

(declare-fun e!640673 () Bool)

(assert (=> b!1125505 (= e!640668 e!640673)))

(declare-fun res!752070 () Bool)

(assert (=> b!1125505 (=> res!752070 e!640673)))

(declare-datatypes ((V!42829 0))(
  ( (V!42830 (val!14195 Int)) )
))
(declare-datatypes ((tuple2!17838 0))(
  ( (tuple2!17839 (_1!8930 (_ BitVec 64)) (_2!8930 V!42829)) )
))
(declare-datatypes ((List!24618 0))(
  ( (Nil!24615) (Cons!24614 (h!25823 tuple2!17838) (t!35357 List!24618)) )
))
(declare-datatypes ((ListLongMap!15807 0))(
  ( (ListLongMap!15808 (toList!7919 List!24618)) )
))
(declare-fun lt!499879 () ListLongMap!15807)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6456 (ListLongMap!15807 (_ BitVec 64)) Bool)

(assert (=> b!1125505 (= res!752070 (not (contains!6456 lt!499879 k!934)))))

(declare-fun zeroValue!944 () V!42829)

(declare-fun _keys!1208 () array!73417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13429 0))(
  ( (ValueCellFull!13429 (v!16828 V!42829)) (EmptyCell!13429) )
))
(declare-datatypes ((array!73419 0))(
  ( (array!73420 (arr!35362 (Array (_ BitVec 32) ValueCell!13429)) (size!35898 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73419)

(declare-fun minValue!944 () V!42829)

(declare-fun getCurrentListMapNoExtraKeys!4407 (array!73417 array!73419 (_ BitVec 32) (_ BitVec 32) V!42829 V!42829 (_ BitVec 32) Int) ListLongMap!15807)

(assert (=> b!1125505 (= lt!499879 (getCurrentListMapNoExtraKeys!4407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47520 () Bool)

(declare-fun call!47524 () ListLongMap!15807)

(declare-fun lt!499875 () array!73419)

(assert (=> bm!47520 (= call!47524 (getCurrentListMapNoExtraKeys!4407 lt!499877 lt!499875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125506 () Bool)

(declare-fun e!640667 () Bool)

(declare-fun call!47523 () ListLongMap!15807)

(assert (=> b!1125506 (= e!640667 (= call!47524 call!47523))))

(declare-fun b!1125507 () Bool)

(declare-fun res!752076 () Bool)

(declare-fun e!640677 () Bool)

(assert (=> b!1125507 (=> (not res!752076) (not e!640677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125507 (= res!752076 (validMask!0 mask!1564))))

(declare-fun b!1125508 () Bool)

(declare-fun e!640670 () Bool)

(assert (=> b!1125508 (= e!640674 (not e!640670))))

(declare-fun res!752077 () Bool)

(assert (=> b!1125508 (=> res!752077 e!640670)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125508 (= res!752077 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125508 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36888 0))(
  ( (Unit!36889) )
))
(declare-fun lt!499873 () Unit!36888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73417 (_ BitVec 64) (_ BitVec 32)) Unit!36888)

(assert (=> b!1125508 (= lt!499873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!752069 () Bool)

(assert (=> start!98046 (=> (not res!752069) (not e!640677))))

(assert (=> start!98046 (= res!752069 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35897 _keys!1208))))))

(assert (=> start!98046 e!640677))

(declare-fun tp_is_empty!28277 () Bool)

(assert (=> start!98046 tp_is_empty!28277))

(declare-fun array_inv!27146 (array!73417) Bool)

(assert (=> start!98046 (array_inv!27146 _keys!1208)))

(assert (=> start!98046 true))

(assert (=> start!98046 tp!83944))

(declare-fun e!640672 () Bool)

(declare-fun array_inv!27147 (array!73419) Bool)

(assert (=> start!98046 (and (array_inv!27147 _values!996) e!640672)))

(declare-fun b!1125509 () Bool)

(declare-fun res!752072 () Bool)

(assert (=> b!1125509 (=> (not res!752072) (not e!640677))))

(assert (=> b!1125509 (= res!752072 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35897 _keys!1208))))))

(declare-fun b!1125510 () Bool)

(declare-fun res!752068 () Bool)

(assert (=> b!1125510 (=> (not res!752068) (not e!640677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125510 (= res!752068 (validKeyInArray!0 k!934))))

(declare-fun b!1125511 () Bool)

(declare-fun res!752079 () Bool)

(assert (=> b!1125511 (=> (not res!752079) (not e!640677))))

(assert (=> b!1125511 (= res!752079 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24614))))

(declare-fun b!1125512 () Bool)

(declare-fun e!640675 () Bool)

(assert (=> b!1125512 (= e!640670 e!640675)))

(declare-fun res!752080 () Bool)

(assert (=> b!1125512 (=> res!752080 e!640675)))

(assert (=> b!1125512 (= res!752080 (not (= from!1455 i!673)))))

(declare-fun lt!499880 () ListLongMap!15807)

(assert (=> b!1125512 (= lt!499880 (getCurrentListMapNoExtraKeys!4407 lt!499877 lt!499875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2498 (Int (_ BitVec 64)) V!42829)

(assert (=> b!1125512 (= lt!499875 (array!73420 (store (arr!35362 _values!996) i!673 (ValueCellFull!13429 (dynLambda!2498 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35898 _values!996)))))

(declare-fun lt!499874 () ListLongMap!15807)

(assert (=> b!1125512 (= lt!499874 (getCurrentListMapNoExtraKeys!4407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125513 () Bool)

(declare-fun e!640669 () Bool)

(declare-fun mapRes!44233 () Bool)

(assert (=> b!1125513 (= e!640672 (and e!640669 mapRes!44233))))

(declare-fun condMapEmpty!44233 () Bool)

(declare-fun mapDefault!44233 () ValueCell!13429)

