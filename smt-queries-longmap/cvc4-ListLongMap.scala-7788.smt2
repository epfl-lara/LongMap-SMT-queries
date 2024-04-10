; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97476 () Bool)

(assert start!97476)

(declare-fun b!1112520 () Bool)

(declare-fun res!742431 () Bool)

(declare-fun e!634283 () Bool)

(assert (=> b!1112520 (=> (not res!742431) (not e!634283))))

(declare-datatypes ((array!72327 0))(
  ( (array!72328 (arr!34816 (Array (_ BitVec 32) (_ BitVec 64))) (size!35352 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72327)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72327 (_ BitVec 32)) Bool)

(assert (=> b!1112520 (= res!742431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112521 () Bool)

(declare-fun e!634282 () Bool)

(declare-fun tp_is_empty!27707 () Bool)

(assert (=> b!1112521 (= e!634282 tp_is_empty!27707)))

(declare-fun b!1112522 () Bool)

(declare-fun res!742425 () Bool)

(assert (=> b!1112522 (=> (not res!742425) (not e!634283))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1112522 (= res!742425 (= (select (arr!34816 _keys!1208) i!673) k!934))))

(declare-fun b!1112523 () Bool)

(declare-fun e!634287 () Bool)

(assert (=> b!1112523 (= e!634287 (not true))))

(declare-fun arrayContainsKey!0 (array!72327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112523 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36508 0))(
  ( (Unit!36509) )
))
(declare-fun lt!496531 () Unit!36508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72327 (_ BitVec 64) (_ BitVec 32)) Unit!36508)

(assert (=> b!1112523 (= lt!496531 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43378 () Bool)

(declare-fun mapRes!43378 () Bool)

(assert (=> mapIsEmpty!43378 mapRes!43378))

(declare-fun b!1112524 () Bool)

(declare-fun res!742429 () Bool)

(assert (=> b!1112524 (=> (not res!742429) (not e!634283))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42069 0))(
  ( (V!42070 (val!13910 Int)) )
))
(declare-datatypes ((ValueCell!13144 0))(
  ( (ValueCellFull!13144 (v!16543 V!42069)) (EmptyCell!13144) )
))
(declare-datatypes ((array!72329 0))(
  ( (array!72330 (arr!34817 (Array (_ BitVec 32) ValueCell!13144)) (size!35353 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72329)

(assert (=> b!1112524 (= res!742429 (and (= (size!35353 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35352 _keys!1208) (size!35353 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112525 () Bool)

(declare-fun res!742423 () Bool)

(assert (=> b!1112525 (=> (not res!742423) (not e!634287))))

(declare-fun lt!496532 () array!72327)

(declare-datatypes ((List!24292 0))(
  ( (Nil!24289) (Cons!24288 (h!25497 (_ BitVec 64)) (t!34773 List!24292)) )
))
(declare-fun arrayNoDuplicates!0 (array!72327 (_ BitVec 32) List!24292) Bool)

(assert (=> b!1112525 (= res!742423 (arrayNoDuplicates!0 lt!496532 #b00000000000000000000000000000000 Nil!24289))))

(declare-fun b!1112526 () Bool)

(declare-fun e!634286 () Bool)

(assert (=> b!1112526 (= e!634286 tp_is_empty!27707)))

(declare-fun b!1112527 () Bool)

(assert (=> b!1112527 (= e!634283 e!634287)))

(declare-fun res!742430 () Bool)

(assert (=> b!1112527 (=> (not res!742430) (not e!634287))))

(assert (=> b!1112527 (= res!742430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496532 mask!1564))))

(assert (=> b!1112527 (= lt!496532 (array!72328 (store (arr!34816 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35352 _keys!1208)))))

(declare-fun res!742432 () Bool)

(assert (=> start!97476 (=> (not res!742432) (not e!634283))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97476 (= res!742432 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35352 _keys!1208))))))

(assert (=> start!97476 e!634283))

(declare-fun array_inv!26774 (array!72327) Bool)

(assert (=> start!97476 (array_inv!26774 _keys!1208)))

(assert (=> start!97476 true))

(declare-fun e!634285 () Bool)

(declare-fun array_inv!26775 (array!72329) Bool)

(assert (=> start!97476 (and (array_inv!26775 _values!996) e!634285)))

(declare-fun b!1112528 () Bool)

(declare-fun res!742424 () Bool)

(assert (=> b!1112528 (=> (not res!742424) (not e!634283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112528 (= res!742424 (validKeyInArray!0 k!934))))

(declare-fun b!1112529 () Bool)

(declare-fun res!742426 () Bool)

(assert (=> b!1112529 (=> (not res!742426) (not e!634283))))

(assert (=> b!1112529 (= res!742426 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35352 _keys!1208))))))

(declare-fun b!1112530 () Bool)

(declare-fun res!742427 () Bool)

(assert (=> b!1112530 (=> (not res!742427) (not e!634283))))

(assert (=> b!1112530 (= res!742427 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24289))))

(declare-fun mapNonEmpty!43378 () Bool)

(declare-fun tp!82622 () Bool)

(assert (=> mapNonEmpty!43378 (= mapRes!43378 (and tp!82622 e!634286))))

(declare-fun mapValue!43378 () ValueCell!13144)

(declare-fun mapRest!43378 () (Array (_ BitVec 32) ValueCell!13144))

(declare-fun mapKey!43378 () (_ BitVec 32))

(assert (=> mapNonEmpty!43378 (= (arr!34817 _values!996) (store mapRest!43378 mapKey!43378 mapValue!43378))))

(declare-fun b!1112531 () Bool)

(assert (=> b!1112531 (= e!634285 (and e!634282 mapRes!43378))))

(declare-fun condMapEmpty!43378 () Bool)

(declare-fun mapDefault!43378 () ValueCell!13144)

