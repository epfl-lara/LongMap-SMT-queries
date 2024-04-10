; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99904 () Bool)

(assert start!99904)

(declare-fun b_free!25483 () Bool)

(declare-fun b_next!25483 () Bool)

(assert (=> start!99904 (= b_free!25483 (not b_next!25483))))

(declare-fun tp!89162 () Bool)

(declare-fun b_and!41833 () Bool)

(assert (=> start!99904 (= tp!89162 b_and!41833)))

(declare-fun b!1189024 () Bool)

(declare-fun res!790630 () Bool)

(declare-fun e!676035 () Bool)

(assert (=> b!1189024 (=> (not res!790630) (not e!676035))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76821 0))(
  ( (array!76822 (arr!37060 (Array (_ BitVec 32) (_ BitVec 64))) (size!37596 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76821)

(assert (=> b!1189024 (= res!790630 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37596 _keys!1208))))))

(declare-fun b!1189025 () Bool)

(declare-fun res!790635 () Bool)

(assert (=> b!1189025 (=> (not res!790635) (not e!676035))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189025 (= res!790635 (validKeyInArray!0 k!934))))

(declare-fun b!1189026 () Bool)

(declare-fun res!790639 () Bool)

(assert (=> b!1189026 (=> (not res!790639) (not e!676035))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76821 (_ BitVec 32)) Bool)

(assert (=> b!1189026 (= res!790639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46847 () Bool)

(declare-fun mapRes!46847 () Bool)

(assert (=> mapIsEmpty!46847 mapRes!46847))

(declare-fun b!1189027 () Bool)

(declare-fun res!790637 () Bool)

(declare-fun e!676036 () Bool)

(assert (=> b!1189027 (=> (not res!790637) (not e!676036))))

(declare-fun lt!540911 () array!76821)

(declare-datatypes ((List!26089 0))(
  ( (Nil!26086) (Cons!26085 (h!27294 (_ BitVec 64)) (t!38564 List!26089)) )
))
(declare-fun arrayNoDuplicates!0 (array!76821 (_ BitVec 32) List!26089) Bool)

(assert (=> b!1189027 (= res!790637 (arrayNoDuplicates!0 lt!540911 #b00000000000000000000000000000000 Nil!26086))))

(declare-fun b!1189028 () Bool)

(declare-fun e!676040 () Bool)

(declare-fun tp_is_empty!30013 () Bool)

(assert (=> b!1189028 (= e!676040 tp_is_empty!30013)))

(declare-fun b!1189029 () Bool)

(declare-fun e!676039 () Bool)

(declare-fun e!676037 () Bool)

(assert (=> b!1189029 (= e!676039 e!676037)))

(declare-fun res!790628 () Bool)

(assert (=> b!1189029 (=> res!790628 e!676037)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189029 (= res!790628 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45145 0))(
  ( (V!45146 (val!15063 Int)) )
))
(declare-fun zeroValue!944 () V!45145)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!45145)

(declare-datatypes ((ValueCell!14297 0))(
  ( (ValueCellFull!14297 (v!17701 V!45145)) (EmptyCell!14297) )
))
(declare-datatypes ((array!76823 0))(
  ( (array!76824 (arr!37061 (Array (_ BitVec 32) ValueCell!14297)) (size!37597 (_ BitVec 32))) )
))
(declare-fun lt!540912 () array!76823)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19344 0))(
  ( (tuple2!19345 (_1!9683 (_ BitVec 64)) (_2!9683 V!45145)) )
))
(declare-datatypes ((List!26090 0))(
  ( (Nil!26087) (Cons!26086 (h!27295 tuple2!19344) (t!38565 List!26090)) )
))
(declare-datatypes ((ListLongMap!17313 0))(
  ( (ListLongMap!17314 (toList!8672 List!26090)) )
))
(declare-fun lt!540908 () ListLongMap!17313)

(declare-fun getCurrentListMapNoExtraKeys!5113 (array!76821 array!76823 (_ BitVec 32) (_ BitVec 32) V!45145 V!45145 (_ BitVec 32) Int) ListLongMap!17313)

(assert (=> b!1189029 (= lt!540908 (getCurrentListMapNoExtraKeys!5113 lt!540911 lt!540912 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76823)

(declare-fun dynLambda!3057 (Int (_ BitVec 64)) V!45145)

(assert (=> b!1189029 (= lt!540912 (array!76824 (store (arr!37061 _values!996) i!673 (ValueCellFull!14297 (dynLambda!3057 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37597 _values!996)))))

(declare-fun lt!540909 () ListLongMap!17313)

(assert (=> b!1189029 (= lt!540909 (getCurrentListMapNoExtraKeys!5113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!790634 () Bool)

(assert (=> start!99904 (=> (not res!790634) (not e!676035))))

(assert (=> start!99904 (= res!790634 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37596 _keys!1208))))))

(assert (=> start!99904 e!676035))

(assert (=> start!99904 tp_is_empty!30013))

(declare-fun array_inv!28266 (array!76821) Bool)

(assert (=> start!99904 (array_inv!28266 _keys!1208)))

(assert (=> start!99904 true))

(assert (=> start!99904 tp!89162))

(declare-fun e!676041 () Bool)

(declare-fun array_inv!28267 (array!76823) Bool)

(assert (=> start!99904 (and (array_inv!28267 _values!996) e!676041)))

(declare-fun b!1189030 () Bool)

(declare-fun res!790636 () Bool)

(assert (=> b!1189030 (=> (not res!790636) (not e!676035))))

(assert (=> b!1189030 (= res!790636 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26086))))

(declare-fun b!1189031 () Bool)

(assert (=> b!1189031 (= e!676037 true)))

(declare-fun -!1702 (ListLongMap!17313 (_ BitVec 64)) ListLongMap!17313)

(assert (=> b!1189031 (= (getCurrentListMapNoExtraKeys!5113 lt!540911 lt!540912 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1702 (getCurrentListMapNoExtraKeys!5113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39444 0))(
  ( (Unit!39445) )
))
(declare-fun lt!540907 () Unit!39444)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!911 (array!76821 array!76823 (_ BitVec 32) (_ BitVec 32) V!45145 V!45145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39444)

(assert (=> b!1189031 (= lt!540907 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189032 () Bool)

(assert (=> b!1189032 (= e!676036 (not e!676039))))

(declare-fun res!790631 () Bool)

(assert (=> b!1189032 (=> res!790631 e!676039)))

(assert (=> b!1189032 (= res!790631 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189032 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!540910 () Unit!39444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76821 (_ BitVec 64) (_ BitVec 32)) Unit!39444)

(assert (=> b!1189032 (= lt!540910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1189033 () Bool)

(declare-fun e!676038 () Bool)

(assert (=> b!1189033 (= e!676041 (and e!676038 mapRes!46847))))

(declare-fun condMapEmpty!46847 () Bool)

(declare-fun mapDefault!46847 () ValueCell!14297)

