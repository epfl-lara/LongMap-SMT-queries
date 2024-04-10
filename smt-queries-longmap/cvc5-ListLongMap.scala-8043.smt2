; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99098 () Bool)

(assert start!99098)

(declare-fun b_free!24703 () Bool)

(declare-fun b_next!24703 () Bool)

(assert (=> start!99098 (= b_free!24703 (not b_next!24703))))

(declare-fun tp!86819 () Bool)

(declare-fun b_and!40255 () Bool)

(assert (=> start!99098 (= tp!86819 b_and!40255)))

(declare-fun b!1165590 () Bool)

(declare-fun res!773049 () Bool)

(declare-fun e!662615 () Bool)

(assert (=> b!1165590 (=> (not res!773049) (not e!662615))))

(declare-datatypes ((array!75297 0))(
  ( (array!75298 (arr!36299 (Array (_ BitVec 32) (_ BitVec 64))) (size!36835 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75297)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44105 0))(
  ( (V!44106 (val!14673 Int)) )
))
(declare-datatypes ((ValueCell!13907 0))(
  ( (ValueCellFull!13907 (v!17310 V!44105)) (EmptyCell!13907) )
))
(declare-datatypes ((array!75299 0))(
  ( (array!75300 (arr!36300 (Array (_ BitVec 32) ValueCell!13907)) (size!36836 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75299)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1165590 (= res!773049 (and (= (size!36836 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36835 _keys!1208) (size!36836 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165591 () Bool)

(declare-fun res!773045 () Bool)

(assert (=> b!1165591 (=> (not res!773045) (not e!662615))))

(declare-datatypes ((List!25446 0))(
  ( (Nil!25443) (Cons!25442 (h!26651 (_ BitVec 64)) (t!37141 List!25446)) )
))
(declare-fun arrayNoDuplicates!0 (array!75297 (_ BitVec 32) List!25446) Bool)

(assert (=> b!1165591 (= res!773045 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25443))))

(declare-fun b!1165592 () Bool)

(declare-fun res!773046 () Bool)

(assert (=> b!1165592 (=> (not res!773046) (not e!662615))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165592 (= res!773046 (validKeyInArray!0 k!934))))

(declare-fun b!1165593 () Bool)

(declare-fun e!662612 () Bool)

(assert (=> b!1165593 (= e!662612 true)))

(declare-fun zeroValue!944 () V!44105)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44105)

(declare-fun lt!524954 () array!75297)

(declare-datatypes ((tuple2!18710 0))(
  ( (tuple2!18711 (_1!9366 (_ BitVec 64)) (_2!9366 V!44105)) )
))
(declare-datatypes ((List!25447 0))(
  ( (Nil!25444) (Cons!25443 (h!26652 tuple2!18710) (t!37142 List!25447)) )
))
(declare-datatypes ((ListLongMap!16679 0))(
  ( (ListLongMap!16680 (toList!8355 List!25447)) )
))
(declare-fun lt!524955 () ListLongMap!16679)

(declare-fun getCurrentListMapNoExtraKeys!4819 (array!75297 array!75299 (_ BitVec 32) (_ BitVec 32) V!44105 V!44105 (_ BitVec 32) Int) ListLongMap!16679)

(declare-fun dynLambda!2809 (Int (_ BitVec 64)) V!44105)

(assert (=> b!1165593 (= lt!524955 (getCurrentListMapNoExtraKeys!4819 lt!524954 (array!75300 (store (arr!36300 _values!996) i!673 (ValueCellFull!13907 (dynLambda!2809 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36836 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524953 () ListLongMap!16679)

(assert (=> b!1165593 (= lt!524953 (getCurrentListMapNoExtraKeys!4819 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165594 () Bool)

(declare-fun e!662616 () Bool)

(declare-fun tp_is_empty!29233 () Bool)

(assert (=> b!1165594 (= e!662616 tp_is_empty!29233)))

(declare-fun b!1165595 () Bool)

(declare-fun res!773044 () Bool)

(declare-fun e!662610 () Bool)

(assert (=> b!1165595 (=> (not res!773044) (not e!662610))))

(assert (=> b!1165595 (= res!773044 (arrayNoDuplicates!0 lt!524954 #b00000000000000000000000000000000 Nil!25443))))

(declare-fun b!1165596 () Bool)

(declare-fun res!773053 () Bool)

(assert (=> b!1165596 (=> (not res!773053) (not e!662615))))

(assert (=> b!1165596 (= res!773053 (= (select (arr!36299 _keys!1208) i!673) k!934))))

(declare-fun b!1165597 () Bool)

(declare-fun e!662613 () Bool)

(assert (=> b!1165597 (= e!662613 tp_is_empty!29233)))

(declare-fun mapNonEmpty!45674 () Bool)

(declare-fun mapRes!45674 () Bool)

(declare-fun tp!86820 () Bool)

(assert (=> mapNonEmpty!45674 (= mapRes!45674 (and tp!86820 e!662613))))

(declare-fun mapValue!45674 () ValueCell!13907)

(declare-fun mapKey!45674 () (_ BitVec 32))

(declare-fun mapRest!45674 () (Array (_ BitVec 32) ValueCell!13907))

(assert (=> mapNonEmpty!45674 (= (arr!36300 _values!996) (store mapRest!45674 mapKey!45674 mapValue!45674))))

(declare-fun b!1165598 () Bool)

(declare-fun res!773054 () Bool)

(assert (=> b!1165598 (=> (not res!773054) (not e!662615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165598 (= res!773054 (validMask!0 mask!1564))))

(declare-fun b!1165599 () Bool)

(declare-fun res!773051 () Bool)

(assert (=> b!1165599 (=> (not res!773051) (not e!662615))))

(assert (=> b!1165599 (= res!773051 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36835 _keys!1208))))))

(declare-fun b!1165601 () Bool)

(assert (=> b!1165601 (= e!662615 e!662610)))

(declare-fun res!773052 () Bool)

(assert (=> b!1165601 (=> (not res!773052) (not e!662610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75297 (_ BitVec 32)) Bool)

(assert (=> b!1165601 (= res!773052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524954 mask!1564))))

(assert (=> b!1165601 (= lt!524954 (array!75298 (store (arr!36299 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36835 _keys!1208)))))

(declare-fun b!1165602 () Bool)

(declare-fun res!773050 () Bool)

(assert (=> b!1165602 (=> (not res!773050) (not e!662615))))

(assert (=> b!1165602 (= res!773050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45674 () Bool)

(assert (=> mapIsEmpty!45674 mapRes!45674))

(declare-fun b!1165603 () Bool)

(assert (=> b!1165603 (= e!662610 (not e!662612))))

(declare-fun res!773048 () Bool)

(assert (=> b!1165603 (=> res!773048 e!662612)))

(assert (=> b!1165603 (= res!773048 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165603 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38462 0))(
  ( (Unit!38463) )
))
(declare-fun lt!524952 () Unit!38462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75297 (_ BitVec 64) (_ BitVec 32)) Unit!38462)

(assert (=> b!1165603 (= lt!524952 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1165600 () Bool)

(declare-fun e!662611 () Bool)

(assert (=> b!1165600 (= e!662611 (and e!662616 mapRes!45674))))

(declare-fun condMapEmpty!45674 () Bool)

(declare-fun mapDefault!45674 () ValueCell!13907)

