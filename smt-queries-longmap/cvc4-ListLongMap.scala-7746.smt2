; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97224 () Bool)

(assert start!97224)

(declare-fun b!1106382 () Bool)

(declare-fun res!738323 () Bool)

(declare-fun e!631348 () Bool)

(assert (=> b!1106382 (=> (not res!738323) (not e!631348))))

(declare-datatypes ((array!71827 0))(
  ( (array!71828 (arr!34566 (Array (_ BitVec 32) (_ BitVec 64))) (size!35102 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71827)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41733 0))(
  ( (V!41734 (val!13784 Int)) )
))
(declare-datatypes ((ValueCell!13018 0))(
  ( (ValueCellFull!13018 (v!16417 V!41733)) (EmptyCell!13018) )
))
(declare-datatypes ((array!71829 0))(
  ( (array!71830 (arr!34567 (Array (_ BitVec 32) ValueCell!13018)) (size!35103 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71829)

(assert (=> b!1106382 (= res!738323 (and (= (size!35103 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35102 _keys!1208) (size!35103 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106383 () Bool)

(declare-fun e!631349 () Bool)

(declare-fun tp_is_empty!27455 () Bool)

(assert (=> b!1106383 (= e!631349 tp_is_empty!27455)))

(declare-fun b!1106384 () Bool)

(declare-fun res!738324 () Bool)

(assert (=> b!1106384 (=> (not res!738324) (not e!631348))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106384 (= res!738324 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!43000 () Bool)

(declare-fun mapRes!43000 () Bool)

(assert (=> mapIsEmpty!43000 mapRes!43000))

(declare-fun b!1106385 () Bool)

(declare-fun e!631353 () Bool)

(assert (=> b!1106385 (= e!631353 tp_is_empty!27455)))

(declare-fun b!1106386 () Bool)

(declare-fun res!738326 () Bool)

(assert (=> b!1106386 (=> (not res!738326) (not e!631348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71827 (_ BitVec 32)) Bool)

(assert (=> b!1106386 (= res!738326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106387 () Bool)

(declare-fun res!738325 () Bool)

(assert (=> b!1106387 (=> (not res!738325) (not e!631348))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106387 (= res!738325 (= (select (arr!34566 _keys!1208) i!673) k!934))))

(declare-fun b!1106388 () Bool)

(declare-fun res!738319 () Bool)

(assert (=> b!1106388 (=> (not res!738319) (not e!631348))))

(declare-datatypes ((List!24095 0))(
  ( (Nil!24092) (Cons!24091 (h!25300 (_ BitVec 64)) (t!34360 List!24095)) )
))
(declare-fun arrayNoDuplicates!0 (array!71827 (_ BitVec 32) List!24095) Bool)

(assert (=> b!1106388 (= res!738319 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24092))))

(declare-fun mapNonEmpty!43000 () Bool)

(declare-fun tp!81920 () Bool)

(assert (=> mapNonEmpty!43000 (= mapRes!43000 (and tp!81920 e!631353))))

(declare-fun mapValue!43000 () ValueCell!13018)

(declare-fun mapRest!43000 () (Array (_ BitVec 32) ValueCell!13018))

(declare-fun mapKey!43000 () (_ BitVec 32))

(assert (=> mapNonEmpty!43000 (= (arr!34567 _values!996) (store mapRest!43000 mapKey!43000 mapValue!43000))))

(declare-fun b!1106389 () Bool)

(declare-fun e!631352 () Bool)

(assert (=> b!1106389 (= e!631352 (not true))))

(declare-fun arrayContainsKey!0 (array!71827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106389 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36306 0))(
  ( (Unit!36307) )
))
(declare-fun lt!495452 () Unit!36306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71827 (_ BitVec 64) (_ BitVec 32)) Unit!36306)

(assert (=> b!1106389 (= lt!495452 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106390 () Bool)

(declare-fun res!738322 () Bool)

(assert (=> b!1106390 (=> (not res!738322) (not e!631348))))

(assert (=> b!1106390 (= res!738322 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35102 _keys!1208))))))

(declare-fun b!1106391 () Bool)

(assert (=> b!1106391 (= e!631348 e!631352)))

(declare-fun res!738321 () Bool)

(assert (=> b!1106391 (=> (not res!738321) (not e!631352))))

(declare-fun lt!495451 () array!71827)

(assert (=> b!1106391 (= res!738321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495451 mask!1564))))

(assert (=> b!1106391 (= lt!495451 (array!71828 (store (arr!34566 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35102 _keys!1208)))))

(declare-fun b!1106392 () Bool)

(declare-fun res!738320 () Bool)

(assert (=> b!1106392 (=> (not res!738320) (not e!631352))))

(assert (=> b!1106392 (= res!738320 (arrayNoDuplicates!0 lt!495451 #b00000000000000000000000000000000 Nil!24092))))

(declare-fun res!738327 () Bool)

(assert (=> start!97224 (=> (not res!738327) (not e!631348))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97224 (= res!738327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35102 _keys!1208))))))

(assert (=> start!97224 e!631348))

(declare-fun array_inv!26602 (array!71827) Bool)

(assert (=> start!97224 (array_inv!26602 _keys!1208)))

(assert (=> start!97224 true))

(declare-fun e!631351 () Bool)

(declare-fun array_inv!26603 (array!71829) Bool)

(assert (=> start!97224 (and (array_inv!26603 _values!996) e!631351)))

(declare-fun b!1106393 () Bool)

(assert (=> b!1106393 (= e!631351 (and e!631349 mapRes!43000))))

(declare-fun condMapEmpty!43000 () Bool)

(declare-fun mapDefault!43000 () ValueCell!13018)

