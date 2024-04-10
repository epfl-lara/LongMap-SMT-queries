; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97484 () Bool)

(assert start!97484)

(declare-fun mapNonEmpty!43390 () Bool)

(declare-fun mapRes!43390 () Bool)

(declare-fun tp!82634 () Bool)

(declare-fun e!634358 () Bool)

(assert (=> mapNonEmpty!43390 (= mapRes!43390 (and tp!82634 e!634358))))

(declare-fun mapKey!43390 () (_ BitVec 32))

(declare-datatypes ((V!42081 0))(
  ( (V!42082 (val!13914 Int)) )
))
(declare-datatypes ((ValueCell!13148 0))(
  ( (ValueCellFull!13148 (v!16547 V!42081)) (EmptyCell!13148) )
))
(declare-fun mapRest!43390 () (Array (_ BitVec 32) ValueCell!13148))

(declare-datatypes ((array!72343 0))(
  ( (array!72344 (arr!34824 (Array (_ BitVec 32) ValueCell!13148)) (size!35360 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72343)

(declare-fun mapValue!43390 () ValueCell!13148)

(assert (=> mapNonEmpty!43390 (= (arr!34824 _values!996) (store mapRest!43390 mapKey!43390 mapValue!43390))))

(declare-fun b!1112676 () Bool)

(declare-fun res!742551 () Bool)

(declare-fun e!634355 () Bool)

(assert (=> b!1112676 (=> (not res!742551) (not e!634355))))

(declare-datatypes ((array!72345 0))(
  ( (array!72346 (arr!34825 (Array (_ BitVec 32) (_ BitVec 64))) (size!35361 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72345)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72345 (_ BitVec 32)) Bool)

(assert (=> b!1112676 (= res!742551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43390 () Bool)

(assert (=> mapIsEmpty!43390 mapRes!43390))

(declare-fun b!1112677 () Bool)

(declare-fun res!742545 () Bool)

(assert (=> b!1112677 (=> (not res!742545) (not e!634355))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1112677 (= res!742545 (= (select (arr!34825 _keys!1208) i!673) k!934))))

(declare-fun b!1112678 () Bool)

(declare-fun res!742549 () Bool)

(declare-fun e!634356 () Bool)

(assert (=> b!1112678 (=> (not res!742549) (not e!634356))))

(declare-fun lt!496555 () array!72345)

(declare-datatypes ((List!24296 0))(
  ( (Nil!24293) (Cons!24292 (h!25501 (_ BitVec 64)) (t!34777 List!24296)) )
))
(declare-fun arrayNoDuplicates!0 (array!72345 (_ BitVec 32) List!24296) Bool)

(assert (=> b!1112678 (= res!742549 (arrayNoDuplicates!0 lt!496555 #b00000000000000000000000000000000 Nil!24293))))

(declare-fun b!1112679 () Bool)

(declare-fun res!742544 () Bool)

(assert (=> b!1112679 (=> (not res!742544) (not e!634355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112679 (= res!742544 (validMask!0 mask!1564))))

(declare-fun res!742547 () Bool)

(assert (=> start!97484 (=> (not res!742547) (not e!634355))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97484 (= res!742547 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35361 _keys!1208))))))

(assert (=> start!97484 e!634355))

(declare-fun array_inv!26782 (array!72345) Bool)

(assert (=> start!97484 (array_inv!26782 _keys!1208)))

(assert (=> start!97484 true))

(declare-fun e!634354 () Bool)

(declare-fun array_inv!26783 (array!72343) Bool)

(assert (=> start!97484 (and (array_inv!26783 _values!996) e!634354)))

(declare-fun b!1112680 () Bool)

(declare-fun e!634359 () Bool)

(assert (=> b!1112680 (= e!634354 (and e!634359 mapRes!43390))))

(declare-fun condMapEmpty!43390 () Bool)

(declare-fun mapDefault!43390 () ValueCell!13148)

