; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97760 () Bool)

(assert start!97760)

(declare-fun b_free!23461 () Bool)

(declare-fun b_next!23461 () Bool)

(assert (=> start!97760 (= b_free!23461 (not b_next!23461))))

(declare-fun tp!83087 () Bool)

(declare-fun b_and!37735 () Bool)

(assert (=> start!97760 (= tp!83087 b_and!37735)))

(declare-fun res!746729 () Bool)

(declare-fun e!636879 () Bool)

(assert (=> start!97760 (=> (not res!746729) (not e!636879))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72873 0))(
  ( (array!72874 (arr!35089 (Array (_ BitVec 32) (_ BitVec 64))) (size!35625 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72873)

(assert (=> start!97760 (= res!746729 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35625 _keys!1208))))))

(assert (=> start!97760 e!636879))

(declare-fun tp_is_empty!27991 () Bool)

(assert (=> start!97760 tp_is_empty!27991))

(declare-fun array_inv!26958 (array!72873) Bool)

(assert (=> start!97760 (array_inv!26958 _keys!1208)))

(assert (=> start!97760 true))

(assert (=> start!97760 tp!83087))

(declare-datatypes ((V!42449 0))(
  ( (V!42450 (val!14052 Int)) )
))
(declare-datatypes ((ValueCell!13286 0))(
  ( (ValueCellFull!13286 (v!16685 V!42449)) (EmptyCell!13286) )
))
(declare-datatypes ((array!72875 0))(
  ( (array!72876 (arr!35090 (Array (_ BitVec 32) ValueCell!13286)) (size!35626 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72875)

(declare-fun e!636880 () Bool)

(declare-fun array_inv!26959 (array!72875) Bool)

(assert (=> start!97760 (and (array_inv!26959 _values!996) e!636880)))

(declare-fun b!1118096 () Bool)

(declare-fun res!746730 () Bool)

(assert (=> b!1118096 (=> (not res!746730) (not e!636879))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118096 (= res!746730 (validMask!0 mask!1564))))

(declare-fun b!1118097 () Bool)

(declare-fun res!746726 () Bool)

(assert (=> b!1118097 (=> (not res!746726) (not e!636879))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118097 (= res!746726 (and (= (size!35626 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35625 _keys!1208) (size!35626 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118098 () Bool)

(declare-fun e!636877 () Bool)

(assert (=> b!1118098 (= e!636877 tp_is_empty!27991)))

(declare-fun b!1118099 () Bool)

(declare-fun e!636876 () Bool)

(declare-fun e!636878 () Bool)

(assert (=> b!1118099 (= e!636876 (not e!636878))))

(declare-fun res!746724 () Bool)

(assert (=> b!1118099 (=> res!746724 e!636878)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118099 (= res!746724 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118099 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36694 0))(
  ( (Unit!36695) )
))
(declare-fun lt!497422 () Unit!36694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72873 (_ BitVec 64) (_ BitVec 32)) Unit!36694)

(assert (=> b!1118099 (= lt!497422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118100 () Bool)

(declare-fun res!746722 () Bool)

(assert (=> b!1118100 (=> (not res!746722) (not e!636879))))

(assert (=> b!1118100 (= res!746722 (= (select (arr!35089 _keys!1208) i!673) k!934))))

(declare-fun b!1118101 () Bool)

(declare-fun res!746727 () Bool)

(assert (=> b!1118101 (=> (not res!746727) (not e!636879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118101 (= res!746727 (validKeyInArray!0 k!934))))

(declare-fun b!1118102 () Bool)

(declare-fun e!636882 () Bool)

(declare-fun mapRes!43804 () Bool)

(assert (=> b!1118102 (= e!636880 (and e!636882 mapRes!43804))))

(declare-fun condMapEmpty!43804 () Bool)

(declare-fun mapDefault!43804 () ValueCell!13286)

