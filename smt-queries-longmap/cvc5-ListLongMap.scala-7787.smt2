; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97466 () Bool)

(assert start!97466)

(declare-fun b!1112325 () Bool)

(declare-fun e!634197 () Bool)

(assert (=> b!1112325 (= e!634197 (not true))))

(declare-datatypes ((array!72307 0))(
  ( (array!72308 (arr!34806 (Array (_ BitVec 32) (_ BitVec 64))) (size!35342 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72307)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112325 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36500 0))(
  ( (Unit!36501) )
))
(declare-fun lt!496502 () Unit!36500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72307 (_ BitVec 64) (_ BitVec 32)) Unit!36500)

(assert (=> b!1112325 (= lt!496502 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43363 () Bool)

(declare-fun mapRes!43363 () Bool)

(declare-fun tp!82607 () Bool)

(declare-fun e!634194 () Bool)

(assert (=> mapNonEmpty!43363 (= mapRes!43363 (and tp!82607 e!634194))))

(declare-datatypes ((V!42057 0))(
  ( (V!42058 (val!13905 Int)) )
))
(declare-datatypes ((ValueCell!13139 0))(
  ( (ValueCellFull!13139 (v!16538 V!42057)) (EmptyCell!13139) )
))
(declare-fun mapValue!43363 () ValueCell!13139)

(declare-fun mapRest!43363 () (Array (_ BitVec 32) ValueCell!13139))

(declare-datatypes ((array!72309 0))(
  ( (array!72310 (arr!34807 (Array (_ BitVec 32) ValueCell!13139)) (size!35343 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72309)

(declare-fun mapKey!43363 () (_ BitVec 32))

(assert (=> mapNonEmpty!43363 (= (arr!34807 _values!996) (store mapRest!43363 mapKey!43363 mapValue!43363))))

(declare-fun b!1112326 () Bool)

(declare-fun res!742277 () Bool)

(declare-fun e!634195 () Bool)

(assert (=> b!1112326 (=> (not res!742277) (not e!634195))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1112326 (= res!742277 (and (= (size!35343 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35342 _keys!1208) (size!35343 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112327 () Bool)

(declare-fun res!742275 () Bool)

(assert (=> b!1112327 (=> (not res!742275) (not e!634195))))

(declare-datatypes ((List!24287 0))(
  ( (Nil!24284) (Cons!24283 (h!25492 (_ BitVec 64)) (t!34768 List!24287)) )
))
(declare-fun arrayNoDuplicates!0 (array!72307 (_ BitVec 32) List!24287) Bool)

(assert (=> b!1112327 (= res!742275 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24284))))

(declare-fun res!742279 () Bool)

(assert (=> start!97466 (=> (not res!742279) (not e!634195))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97466 (= res!742279 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35342 _keys!1208))))))

(assert (=> start!97466 e!634195))

(declare-fun array_inv!26766 (array!72307) Bool)

(assert (=> start!97466 (array_inv!26766 _keys!1208)))

(assert (=> start!97466 true))

(declare-fun e!634196 () Bool)

(declare-fun array_inv!26767 (array!72309) Bool)

(assert (=> start!97466 (and (array_inv!26767 _values!996) e!634196)))

(declare-fun b!1112328 () Bool)

(declare-fun res!742274 () Bool)

(assert (=> b!1112328 (=> (not res!742274) (not e!634195))))

(assert (=> b!1112328 (= res!742274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35342 _keys!1208))))))

(declare-fun b!1112329 () Bool)

(declare-fun res!742281 () Bool)

(assert (=> b!1112329 (=> (not res!742281) (not e!634195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72307 (_ BitVec 32)) Bool)

(assert (=> b!1112329 (= res!742281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112330 () Bool)

(assert (=> b!1112330 (= e!634195 e!634197)))

(declare-fun res!742278 () Bool)

(assert (=> b!1112330 (=> (not res!742278) (not e!634197))))

(declare-fun lt!496501 () array!72307)

(assert (=> b!1112330 (= res!742278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496501 mask!1564))))

(assert (=> b!1112330 (= lt!496501 (array!72308 (store (arr!34806 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35342 _keys!1208)))))

(declare-fun b!1112331 () Bool)

(declare-fun e!634193 () Bool)

(assert (=> b!1112331 (= e!634196 (and e!634193 mapRes!43363))))

(declare-fun condMapEmpty!43363 () Bool)

(declare-fun mapDefault!43363 () ValueCell!13139)

