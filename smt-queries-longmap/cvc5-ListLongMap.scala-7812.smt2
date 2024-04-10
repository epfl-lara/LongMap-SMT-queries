; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97616 () Bool)

(assert start!97616)

(declare-fun b!1115250 () Bool)

(declare-fun res!744525 () Bool)

(declare-fun e!635542 () Bool)

(assert (=> b!1115250 (=> (not res!744525) (not e!635542))))

(declare-datatypes ((array!72595 0))(
  ( (array!72596 (arr!34950 (Array (_ BitVec 32) (_ BitVec 64))) (size!35486 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72595)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42257 0))(
  ( (V!42258 (val!13980 Int)) )
))
(declare-datatypes ((ValueCell!13214 0))(
  ( (ValueCellFull!13214 (v!16613 V!42257)) (EmptyCell!13214) )
))
(declare-datatypes ((array!72597 0))(
  ( (array!72598 (arr!34951 (Array (_ BitVec 32) ValueCell!13214)) (size!35487 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72597)

(assert (=> b!1115250 (= res!744525 (and (= (size!35487 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35486 _keys!1208) (size!35487 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115251 () Bool)

(declare-fun e!635543 () Bool)

(assert (=> b!1115251 (= e!635542 e!635543)))

(declare-fun res!744530 () Bool)

(assert (=> b!1115251 (=> (not res!744530) (not e!635543))))

(declare-fun lt!496952 () array!72595)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72595 (_ BitVec 32)) Bool)

(assert (=> b!1115251 (= res!744530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496952 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115251 (= lt!496952 (array!72596 (store (arr!34950 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35486 _keys!1208)))))

(declare-fun b!1115252 () Bool)

(declare-fun res!744528 () Bool)

(assert (=> b!1115252 (=> (not res!744528) (not e!635543))))

(declare-datatypes ((List!24343 0))(
  ( (Nil!24340) (Cons!24339 (h!25548 (_ BitVec 64)) (t!34824 List!24343)) )
))
(declare-fun arrayNoDuplicates!0 (array!72595 (_ BitVec 32) List!24343) Bool)

(assert (=> b!1115252 (= res!744528 (arrayNoDuplicates!0 lt!496952 #b00000000000000000000000000000000 Nil!24340))))

(declare-fun res!744524 () Bool)

(assert (=> start!97616 (=> (not res!744524) (not e!635542))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97616 (= res!744524 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35486 _keys!1208))))))

(assert (=> start!97616 e!635542))

(declare-fun array_inv!26870 (array!72595) Bool)

(assert (=> start!97616 (array_inv!26870 _keys!1208)))

(assert (=> start!97616 true))

(declare-fun e!635546 () Bool)

(declare-fun array_inv!26871 (array!72597) Bool)

(assert (=> start!97616 (and (array_inv!26871 _values!996) e!635546)))

(declare-fun b!1115253 () Bool)

(declare-fun e!635545 () Bool)

(declare-fun tp_is_empty!27847 () Bool)

(assert (=> b!1115253 (= e!635545 tp_is_empty!27847)))

(declare-fun b!1115254 () Bool)

(assert (=> b!1115254 (= e!635543 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115254 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36604 0))(
  ( (Unit!36605) )
))
(declare-fun lt!496951 () Unit!36604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72595 (_ BitVec 64) (_ BitVec 32)) Unit!36604)

(assert (=> b!1115254 (= lt!496951 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43588 () Bool)

(declare-fun mapRes!43588 () Bool)

(declare-fun tp!82832 () Bool)

(declare-fun e!635544 () Bool)

(assert (=> mapNonEmpty!43588 (= mapRes!43588 (and tp!82832 e!635544))))

(declare-fun mapValue!43588 () ValueCell!13214)

(declare-fun mapRest!43588 () (Array (_ BitVec 32) ValueCell!13214))

(declare-fun mapKey!43588 () (_ BitVec 32))

(assert (=> mapNonEmpty!43588 (= (arr!34951 _values!996) (store mapRest!43588 mapKey!43588 mapValue!43588))))

(declare-fun b!1115255 () Bool)

(declare-fun res!744531 () Bool)

(assert (=> b!1115255 (=> (not res!744531) (not e!635542))))

(assert (=> b!1115255 (= res!744531 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35486 _keys!1208))))))

(declare-fun b!1115256 () Bool)

(declare-fun res!744523 () Bool)

(assert (=> b!1115256 (=> (not res!744523) (not e!635542))))

(assert (=> b!1115256 (= res!744523 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24340))))

(declare-fun b!1115257 () Bool)

(declare-fun res!744532 () Bool)

(assert (=> b!1115257 (=> (not res!744532) (not e!635542))))

(assert (=> b!1115257 (= res!744532 (= (select (arr!34950 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43588 () Bool)

(assert (=> mapIsEmpty!43588 mapRes!43588))

(declare-fun b!1115258 () Bool)

(declare-fun res!744527 () Bool)

(assert (=> b!1115258 (=> (not res!744527) (not e!635542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115258 (= res!744527 (validKeyInArray!0 k!934))))

(declare-fun b!1115259 () Bool)

(declare-fun res!744529 () Bool)

(assert (=> b!1115259 (=> (not res!744529) (not e!635542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115259 (= res!744529 (validMask!0 mask!1564))))

(declare-fun b!1115260 () Bool)

(assert (=> b!1115260 (= e!635544 tp_is_empty!27847)))

(declare-fun b!1115261 () Bool)

(declare-fun res!744526 () Bool)

(assert (=> b!1115261 (=> (not res!744526) (not e!635542))))

(assert (=> b!1115261 (= res!744526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115262 () Bool)

(assert (=> b!1115262 (= e!635546 (and e!635545 mapRes!43588))))

(declare-fun condMapEmpty!43588 () Bool)

(declare-fun mapDefault!43588 () ValueCell!13214)

