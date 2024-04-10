; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97470 () Bool)

(assert start!97470)

(declare-fun mapNonEmpty!43369 () Bool)

(declare-fun mapRes!43369 () Bool)

(declare-fun tp!82613 () Bool)

(declare-fun e!634233 () Bool)

(assert (=> mapNonEmpty!43369 (= mapRes!43369 (and tp!82613 e!634233))))

(declare-datatypes ((V!42061 0))(
  ( (V!42062 (val!13907 Int)) )
))
(declare-datatypes ((ValueCell!13141 0))(
  ( (ValueCellFull!13141 (v!16540 V!42061)) (EmptyCell!13141) )
))
(declare-fun mapValue!43369 () ValueCell!13141)

(declare-fun mapKey!43369 () (_ BitVec 32))

(declare-datatypes ((array!72315 0))(
  ( (array!72316 (arr!34810 (Array (_ BitVec 32) ValueCell!13141)) (size!35346 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72315)

(declare-fun mapRest!43369 () (Array (_ BitVec 32) ValueCell!13141))

(assert (=> mapNonEmpty!43369 (= (arr!34810 _values!996) (store mapRest!43369 mapKey!43369 mapValue!43369))))

(declare-fun res!742341 () Bool)

(declare-fun e!634230 () Bool)

(assert (=> start!97470 (=> (not res!742341) (not e!634230))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72317 0))(
  ( (array!72318 (arr!34811 (Array (_ BitVec 32) (_ BitVec 64))) (size!35347 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72317)

(assert (=> start!97470 (= res!742341 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35347 _keys!1208))))))

(assert (=> start!97470 e!634230))

(declare-fun array_inv!26770 (array!72317) Bool)

(assert (=> start!97470 (array_inv!26770 _keys!1208)))

(assert (=> start!97470 true))

(declare-fun e!634231 () Bool)

(declare-fun array_inv!26771 (array!72315) Bool)

(assert (=> start!97470 (and (array_inv!26771 _values!996) e!634231)))

(declare-fun b!1112403 () Bool)

(declare-fun e!634232 () Bool)

(assert (=> b!1112403 (= e!634230 e!634232)))

(declare-fun res!742338 () Bool)

(assert (=> b!1112403 (=> (not res!742338) (not e!634232))))

(declare-fun lt!496514 () array!72317)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72317 (_ BitVec 32)) Bool)

(assert (=> b!1112403 (= res!742338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496514 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112403 (= lt!496514 (array!72318 (store (arr!34811 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35347 _keys!1208)))))

(declare-fun b!1112404 () Bool)

(declare-fun res!742339 () Bool)

(assert (=> b!1112404 (=> (not res!742339) (not e!634232))))

(declare-datatypes ((List!24289 0))(
  ( (Nil!24286) (Cons!24285 (h!25494 (_ BitVec 64)) (t!34770 List!24289)) )
))
(declare-fun arrayNoDuplicates!0 (array!72317 (_ BitVec 32) List!24289) Bool)

(assert (=> b!1112404 (= res!742339 (arrayNoDuplicates!0 lt!496514 #b00000000000000000000000000000000 Nil!24286))))

(declare-fun mapIsEmpty!43369 () Bool)

(assert (=> mapIsEmpty!43369 mapRes!43369))

(declare-fun b!1112405 () Bool)

(declare-fun tp_is_empty!27701 () Bool)

(assert (=> b!1112405 (= e!634233 tp_is_empty!27701)))

(declare-fun b!1112406 () Bool)

(declare-fun res!742337 () Bool)

(assert (=> b!1112406 (=> (not res!742337) (not e!634230))))

(assert (=> b!1112406 (= res!742337 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35347 _keys!1208))))))

(declare-fun b!1112407 () Bool)

(declare-fun res!742334 () Bool)

(assert (=> b!1112407 (=> (not res!742334) (not e!634230))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112407 (= res!742334 (validKeyInArray!0 k!934))))

(declare-fun b!1112408 () Bool)

(declare-fun res!742333 () Bool)

(assert (=> b!1112408 (=> (not res!742333) (not e!634230))))

(assert (=> b!1112408 (= res!742333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112409 () Bool)

(assert (=> b!1112409 (= e!634232 (not true))))

(declare-fun arrayContainsKey!0 (array!72317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112409 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36504 0))(
  ( (Unit!36505) )
))
(declare-fun lt!496513 () Unit!36504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72317 (_ BitVec 64) (_ BitVec 32)) Unit!36504)

(assert (=> b!1112409 (= lt!496513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1112410 () Bool)

(declare-fun res!742336 () Bool)

(assert (=> b!1112410 (=> (not res!742336) (not e!634230))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112410 (= res!742336 (and (= (size!35346 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35347 _keys!1208) (size!35346 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112411 () Bool)

(declare-fun res!742340 () Bool)

(assert (=> b!1112411 (=> (not res!742340) (not e!634230))))

(assert (=> b!1112411 (= res!742340 (= (select (arr!34811 _keys!1208) i!673) k!934))))

(declare-fun b!1112412 () Bool)

(declare-fun res!742342 () Bool)

(assert (=> b!1112412 (=> (not res!742342) (not e!634230))))

(assert (=> b!1112412 (= res!742342 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24286))))

(declare-fun b!1112413 () Bool)

(declare-fun e!634229 () Bool)

(assert (=> b!1112413 (= e!634231 (and e!634229 mapRes!43369))))

(declare-fun condMapEmpty!43369 () Bool)

(declare-fun mapDefault!43369 () ValueCell!13141)

