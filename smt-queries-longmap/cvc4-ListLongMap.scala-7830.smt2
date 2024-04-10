; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97728 () Bool)

(assert start!97728)

(declare-fun mapNonEmpty!43756 () Bool)

(declare-fun mapRes!43756 () Bool)

(declare-fun tp!83000 () Bool)

(declare-fun e!636553 () Bool)

(assert (=> mapNonEmpty!43756 (= mapRes!43756 (and tp!83000 e!636553))))

(declare-datatypes ((V!42405 0))(
  ( (V!42406 (val!14036 Int)) )
))
(declare-datatypes ((ValueCell!13270 0))(
  ( (ValueCellFull!13270 (v!16669 V!42405)) (EmptyCell!13270) )
))
(declare-fun mapRest!43756 () (Array (_ BitVec 32) ValueCell!13270))

(declare-fun mapValue!43756 () ValueCell!13270)

(declare-fun mapKey!43756 () (_ BitVec 32))

(declare-datatypes ((array!72809 0))(
  ( (array!72810 (arr!35057 (Array (_ BitVec 32) ValueCell!13270)) (size!35593 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72809)

(assert (=> mapNonEmpty!43756 (= (arr!35057 _values!996) (store mapRest!43756 mapKey!43756 mapValue!43756))))

(declare-fun b!1117434 () Bool)

(declare-fun res!746211 () Bool)

(declare-fun e!636554 () Bool)

(assert (=> b!1117434 (=> (not res!746211) (not e!636554))))

(declare-datatypes ((array!72811 0))(
  ( (array!72812 (arr!35058 (Array (_ BitVec 32) (_ BitVec 64))) (size!35594 (_ BitVec 32))) )
))
(declare-fun lt!497287 () array!72811)

(declare-datatypes ((List!24386 0))(
  ( (Nil!24383) (Cons!24382 (h!25591 (_ BitVec 64)) (t!34867 List!24386)) )
))
(declare-fun arrayNoDuplicates!0 (array!72811 (_ BitVec 32) List!24386) Bool)

(assert (=> b!1117434 (= res!746211 (arrayNoDuplicates!0 lt!497287 #b00000000000000000000000000000000 Nil!24383))))

(declare-fun b!1117435 () Bool)

(declare-fun res!746209 () Bool)

(declare-fun e!636551 () Bool)

(assert (=> b!1117435 (=> (not res!746209) (not e!636551))))

(declare-fun _keys!1208 () array!72811)

(assert (=> b!1117435 (= res!746209 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24383))))

(declare-fun b!1117436 () Bool)

(declare-fun res!746203 () Bool)

(assert (=> b!1117436 (=> (not res!746203) (not e!636551))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117436 (= res!746203 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!43756 () Bool)

(assert (=> mapIsEmpty!43756 mapRes!43756))

(declare-fun b!1117437 () Bool)

(declare-fun tp_is_empty!27959 () Bool)

(assert (=> b!1117437 (= e!636553 tp_is_empty!27959)))

(declare-fun res!746206 () Bool)

(assert (=> start!97728 (=> (not res!746206) (not e!636551))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97728 (= res!746206 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35594 _keys!1208))))))

(assert (=> start!97728 e!636551))

(declare-fun array_inv!26938 (array!72811) Bool)

(assert (=> start!97728 (array_inv!26938 _keys!1208)))

(assert (=> start!97728 true))

(declare-fun e!636550 () Bool)

(declare-fun array_inv!26939 (array!72809) Bool)

(assert (=> start!97728 (and (array_inv!26939 _values!996) e!636550)))

(declare-fun b!1117438 () Bool)

(assert (=> b!1117438 (= e!636551 e!636554)))

(declare-fun res!746207 () Bool)

(assert (=> b!1117438 (=> (not res!746207) (not e!636554))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72811 (_ BitVec 32)) Bool)

(assert (=> b!1117438 (= res!746207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497287 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117438 (= lt!497287 (array!72812 (store (arr!35058 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35594 _keys!1208)))))

(declare-fun b!1117439 () Bool)

(declare-fun res!746204 () Bool)

(assert (=> b!1117439 (=> (not res!746204) (not e!636551))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117439 (= res!746204 (and (= (size!35593 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35594 _keys!1208) (size!35593 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117440 () Bool)

(declare-fun res!746205 () Bool)

(assert (=> b!1117440 (=> (not res!746205) (not e!636551))))

(assert (=> b!1117440 (= res!746205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117441 () Bool)

(declare-fun res!746208 () Bool)

(assert (=> b!1117441 (=> (not res!746208) (not e!636551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117441 (= res!746208 (validMask!0 mask!1564))))

(declare-fun b!1117442 () Bool)

(declare-fun res!746210 () Bool)

(assert (=> b!1117442 (=> (not res!746210) (not e!636551))))

(assert (=> b!1117442 (= res!746210 (= (select (arr!35058 _keys!1208) i!673) k!934))))

(declare-fun b!1117443 () Bool)

(assert (=> b!1117443 (= e!636554 (not true))))

(declare-fun arrayContainsKey!0 (array!72811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117443 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36670 0))(
  ( (Unit!36671) )
))
(declare-fun lt!497288 () Unit!36670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72811 (_ BitVec 64) (_ BitVec 32)) Unit!36670)

(assert (=> b!1117443 (= lt!497288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117444 () Bool)

(declare-fun e!636555 () Bool)

(assert (=> b!1117444 (= e!636555 tp_is_empty!27959)))

(declare-fun b!1117445 () Bool)

(declare-fun res!746212 () Bool)

(assert (=> b!1117445 (=> (not res!746212) (not e!636551))))

(assert (=> b!1117445 (= res!746212 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35594 _keys!1208))))))

(declare-fun b!1117446 () Bool)

(assert (=> b!1117446 (= e!636550 (and e!636555 mapRes!43756))))

(declare-fun condMapEmpty!43756 () Bool)

(declare-fun mapDefault!43756 () ValueCell!13270)

