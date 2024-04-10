; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97556 () Bool)

(assert start!97556)

(declare-fun b!1114080 () Bool)

(declare-fun res!743629 () Bool)

(declare-fun e!635002 () Bool)

(assert (=> b!1114080 (=> (not res!743629) (not e!635002))))

(declare-datatypes ((array!72481 0))(
  ( (array!72482 (arr!34893 (Array (_ BitVec 32) (_ BitVec 64))) (size!35429 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42177 0))(
  ( (V!42178 (val!13950 Int)) )
))
(declare-datatypes ((ValueCell!13184 0))(
  ( (ValueCellFull!13184 (v!16583 V!42177)) (EmptyCell!13184) )
))
(declare-datatypes ((array!72483 0))(
  ( (array!72484 (arr!34894 (Array (_ BitVec 32) ValueCell!13184)) (size!35430 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72483)

(assert (=> b!1114080 (= res!743629 (and (= (size!35430 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35429 _keys!1208) (size!35430 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114081 () Bool)

(declare-fun res!743627 () Bool)

(assert (=> b!1114081 (=> (not res!743627) (not e!635002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114081 (= res!743627 (validMask!0 mask!1564))))

(declare-fun b!1114082 () Bool)

(declare-fun res!743628 () Bool)

(declare-fun e!635005 () Bool)

(assert (=> b!1114082 (=> (not res!743628) (not e!635005))))

(declare-fun lt!496772 () array!72481)

(declare-datatypes ((List!24322 0))(
  ( (Nil!24319) (Cons!24318 (h!25527 (_ BitVec 64)) (t!34803 List!24322)) )
))
(declare-fun arrayNoDuplicates!0 (array!72481 (_ BitVec 32) List!24322) Bool)

(assert (=> b!1114082 (= res!743628 (arrayNoDuplicates!0 lt!496772 #b00000000000000000000000000000000 Nil!24319))))

(declare-fun res!743624 () Bool)

(assert (=> start!97556 (=> (not res!743624) (not e!635002))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97556 (= res!743624 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35429 _keys!1208))))))

(assert (=> start!97556 e!635002))

(declare-fun array_inv!26822 (array!72481) Bool)

(assert (=> start!97556 (array_inv!26822 _keys!1208)))

(assert (=> start!97556 true))

(declare-fun e!635003 () Bool)

(declare-fun array_inv!26823 (array!72483) Bool)

(assert (=> start!97556 (and (array_inv!26823 _values!996) e!635003)))

(declare-fun b!1114083 () Bool)

(declare-fun res!743623 () Bool)

(assert (=> b!1114083 (=> (not res!743623) (not e!635002))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114083 (= res!743623 (validKeyInArray!0 k!934))))

(declare-fun b!1114084 () Bool)

(declare-fun res!743630 () Bool)

(assert (=> b!1114084 (=> (not res!743630) (not e!635002))))

(assert (=> b!1114084 (= res!743630 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24319))))

(declare-fun mapIsEmpty!43498 () Bool)

(declare-fun mapRes!43498 () Bool)

(assert (=> mapIsEmpty!43498 mapRes!43498))

(declare-fun b!1114085 () Bool)

(declare-fun e!635004 () Bool)

(declare-fun tp_is_empty!27787 () Bool)

(assert (=> b!1114085 (= e!635004 tp_is_empty!27787)))

(declare-fun b!1114086 () Bool)

(assert (=> b!1114086 (= e!635002 e!635005)))

(declare-fun res!743625 () Bool)

(assert (=> b!1114086 (=> (not res!743625) (not e!635005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72481 (_ BitVec 32)) Bool)

(assert (=> b!1114086 (= res!743625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496772 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114086 (= lt!496772 (array!72482 (store (arr!34893 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35429 _keys!1208)))))

(declare-fun b!1114087 () Bool)

(declare-fun res!743632 () Bool)

(assert (=> b!1114087 (=> (not res!743632) (not e!635002))))

(assert (=> b!1114087 (= res!743632 (= (select (arr!34893 _keys!1208) i!673) k!934))))

(declare-fun b!1114088 () Bool)

(declare-fun e!635007 () Bool)

(assert (=> b!1114088 (= e!635007 tp_is_empty!27787)))

(declare-fun mapNonEmpty!43498 () Bool)

(declare-fun tp!82742 () Bool)

(assert (=> mapNonEmpty!43498 (= mapRes!43498 (and tp!82742 e!635007))))

(declare-fun mapKey!43498 () (_ BitVec 32))

(declare-fun mapValue!43498 () ValueCell!13184)

(declare-fun mapRest!43498 () (Array (_ BitVec 32) ValueCell!13184))

(assert (=> mapNonEmpty!43498 (= (arr!34894 _values!996) (store mapRest!43498 mapKey!43498 mapValue!43498))))

(declare-fun b!1114089 () Bool)

(assert (=> b!1114089 (= e!635005 (not true))))

(declare-fun arrayContainsKey!0 (array!72481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114089 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36566 0))(
  ( (Unit!36567) )
))
(declare-fun lt!496771 () Unit!36566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72481 (_ BitVec 64) (_ BitVec 32)) Unit!36566)

(assert (=> b!1114089 (= lt!496771 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114090 () Bool)

(declare-fun res!743631 () Bool)

(assert (=> b!1114090 (=> (not res!743631) (not e!635002))))

(assert (=> b!1114090 (= res!743631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114091 () Bool)

(assert (=> b!1114091 (= e!635003 (and e!635004 mapRes!43498))))

(declare-fun condMapEmpty!43498 () Bool)

(declare-fun mapDefault!43498 () ValueCell!13184)

