; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99908 () Bool)

(assert start!99908)

(declare-fun b_free!25487 () Bool)

(declare-fun b_next!25487 () Bool)

(assert (=> start!99908 (= b_free!25487 (not b_next!25487))))

(declare-fun tp!89174 () Bool)

(declare-fun b_and!41841 () Bool)

(assert (=> start!99908 (= tp!89174 b_and!41841)))

(declare-fun mapIsEmpty!46853 () Bool)

(declare-fun mapRes!46853 () Bool)

(assert (=> mapIsEmpty!46853 mapRes!46853))

(declare-fun b!1189118 () Bool)

(declare-fun res!790702 () Bool)

(declare-fun e!676085 () Bool)

(assert (=> b!1189118 (=> (not res!790702) (not e!676085))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189118 (= res!790702 (validMask!0 mask!1564))))

(declare-fun b!1189120 () Bool)

(declare-fun res!790700 () Bool)

(declare-fun e!676088 () Bool)

(assert (=> b!1189120 (=> (not res!790700) (not e!676088))))

(declare-datatypes ((array!76829 0))(
  ( (array!76830 (arr!37064 (Array (_ BitVec 32) (_ BitVec 64))) (size!37600 (_ BitVec 32))) )
))
(declare-fun lt!540946 () array!76829)

(declare-datatypes ((List!26093 0))(
  ( (Nil!26090) (Cons!26089 (h!27298 (_ BitVec 64)) (t!38572 List!26093)) )
))
(declare-fun arrayNoDuplicates!0 (array!76829 (_ BitVec 32) List!26093) Bool)

(assert (=> b!1189120 (= res!790700 (arrayNoDuplicates!0 lt!540946 #b00000000000000000000000000000000 Nil!26090))))

(declare-fun mapNonEmpty!46853 () Bool)

(declare-fun tp!89175 () Bool)

(declare-fun e!676083 () Bool)

(assert (=> mapNonEmpty!46853 (= mapRes!46853 (and tp!89175 e!676083))))

(declare-datatypes ((V!45149 0))(
  ( (V!45150 (val!15065 Int)) )
))
(declare-datatypes ((ValueCell!14299 0))(
  ( (ValueCellFull!14299 (v!17703 V!45149)) (EmptyCell!14299) )
))
(declare-fun mapRest!46853 () (Array (_ BitVec 32) ValueCell!14299))

(declare-fun mapKey!46853 () (_ BitVec 32))

(declare-fun mapValue!46853 () ValueCell!14299)

(declare-datatypes ((array!76831 0))(
  ( (array!76832 (arr!37065 (Array (_ BitVec 32) ValueCell!14299)) (size!37601 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76831)

(assert (=> mapNonEmpty!46853 (= (arr!37065 _values!996) (store mapRest!46853 mapKey!46853 mapValue!46853))))

(declare-fun b!1189121 () Bool)

(declare-fun res!790704 () Bool)

(assert (=> b!1189121 (=> (not res!790704) (not e!676085))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!76829)

(assert (=> b!1189121 (= res!790704 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37600 _keys!1208))))))

(declare-fun b!1189122 () Bool)

(declare-fun res!790711 () Bool)

(assert (=> b!1189122 (=> (not res!790711) (not e!676085))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1189122 (= res!790711 (and (= (size!37601 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37600 _keys!1208) (size!37601 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189123 () Bool)

(declare-fun e!676087 () Bool)

(assert (=> b!1189123 (= e!676088 (not e!676087))))

(declare-fun res!790706 () Bool)

(assert (=> b!1189123 (=> res!790706 e!676087)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189123 (= res!790706 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189123 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39448 0))(
  ( (Unit!39449) )
))
(declare-fun lt!540945 () Unit!39448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76829 (_ BitVec 64) (_ BitVec 32)) Unit!39448)

(assert (=> b!1189123 (= lt!540945 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1189124 () Bool)

(declare-fun e!676090 () Bool)

(assert (=> b!1189124 (= e!676087 e!676090)))

(declare-fun res!790707 () Bool)

(assert (=> b!1189124 (=> res!790707 e!676090)))

(assert (=> b!1189124 (= res!790707 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45149)

(declare-fun lt!540943 () array!76831)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19348 0))(
  ( (tuple2!19349 (_1!9685 (_ BitVec 64)) (_2!9685 V!45149)) )
))
(declare-datatypes ((List!26094 0))(
  ( (Nil!26091) (Cons!26090 (h!27299 tuple2!19348) (t!38573 List!26094)) )
))
(declare-datatypes ((ListLongMap!17317 0))(
  ( (ListLongMap!17318 (toList!8674 List!26094)) )
))
(declare-fun lt!540948 () ListLongMap!17317)

(declare-fun minValue!944 () V!45149)

(declare-fun getCurrentListMapNoExtraKeys!5115 (array!76829 array!76831 (_ BitVec 32) (_ BitVec 32) V!45149 V!45149 (_ BitVec 32) Int) ListLongMap!17317)

(assert (=> b!1189124 (= lt!540948 (getCurrentListMapNoExtraKeys!5115 lt!540946 lt!540943 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3059 (Int (_ BitVec 64)) V!45149)

(assert (=> b!1189124 (= lt!540943 (array!76832 (store (arr!37065 _values!996) i!673 (ValueCellFull!14299 (dynLambda!3059 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37601 _values!996)))))

(declare-fun lt!540947 () ListLongMap!17317)

(assert (=> b!1189124 (= lt!540947 (getCurrentListMapNoExtraKeys!5115 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189125 () Bool)

(declare-fun res!790709 () Bool)

(assert (=> b!1189125 (=> (not res!790709) (not e!676085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76829 (_ BitVec 32)) Bool)

(assert (=> b!1189125 (= res!790709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189126 () Bool)

(declare-fun res!790705 () Bool)

(assert (=> b!1189126 (=> (not res!790705) (not e!676085))))

(assert (=> b!1189126 (= res!790705 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26090))))

(declare-fun b!1189119 () Bool)

(assert (=> b!1189119 (= e!676085 e!676088)))

(declare-fun res!790710 () Bool)

(assert (=> b!1189119 (=> (not res!790710) (not e!676088))))

(assert (=> b!1189119 (= res!790710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540946 mask!1564))))

(assert (=> b!1189119 (= lt!540946 (array!76830 (store (arr!37064 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37600 _keys!1208)))))

(declare-fun res!790708 () Bool)

(assert (=> start!99908 (=> (not res!790708) (not e!676085))))

(assert (=> start!99908 (= res!790708 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37600 _keys!1208))))))

(assert (=> start!99908 e!676085))

(declare-fun tp_is_empty!30017 () Bool)

(assert (=> start!99908 tp_is_empty!30017))

(declare-fun array_inv!28270 (array!76829) Bool)

(assert (=> start!99908 (array_inv!28270 _keys!1208)))

(assert (=> start!99908 true))

(assert (=> start!99908 tp!89174))

(declare-fun e!676084 () Bool)

(declare-fun array_inv!28271 (array!76831) Bool)

(assert (=> start!99908 (and (array_inv!28271 _values!996) e!676084)))

(declare-fun b!1189127 () Bool)

(declare-fun e!676086 () Bool)

(assert (=> b!1189127 (= e!676086 tp_is_empty!30017)))

(declare-fun b!1189128 () Bool)

(assert (=> b!1189128 (= e!676090 true)))

(declare-fun -!1704 (ListLongMap!17317 (_ BitVec 64)) ListLongMap!17317)

(assert (=> b!1189128 (= (getCurrentListMapNoExtraKeys!5115 lt!540946 lt!540943 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1704 (getCurrentListMapNoExtraKeys!5115 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!540944 () Unit!39448)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!913 (array!76829 array!76831 (_ BitVec 32) (_ BitVec 32) V!45149 V!45149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39448)

(assert (=> b!1189128 (= lt!540944 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!913 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189129 () Bool)

(assert (=> b!1189129 (= e!676083 tp_is_empty!30017)))

(declare-fun b!1189130 () Bool)

(declare-fun res!790703 () Bool)

(assert (=> b!1189130 (=> (not res!790703) (not e!676085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189130 (= res!790703 (validKeyInArray!0 k!934))))

(declare-fun b!1189131 () Bool)

(assert (=> b!1189131 (= e!676084 (and e!676086 mapRes!46853))))

(declare-fun condMapEmpty!46853 () Bool)

(declare-fun mapDefault!46853 () ValueCell!14299)

