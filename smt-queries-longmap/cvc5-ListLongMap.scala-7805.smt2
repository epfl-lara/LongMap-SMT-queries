; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97574 () Bool)

(assert start!97574)

(declare-fun b!1114431 () Bool)

(declare-fun res!743898 () Bool)

(declare-fun e!635169 () Bool)

(assert (=> b!1114431 (=> (not res!743898) (not e!635169))))

(declare-datatypes ((array!72517 0))(
  ( (array!72518 (arr!34911 (Array (_ BitVec 32) (_ BitVec 64))) (size!35447 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72517)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1114431 (= res!743898 (= (select (arr!34911 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43525 () Bool)

(declare-fun mapRes!43525 () Bool)

(declare-fun tp!82769 () Bool)

(declare-fun e!635168 () Bool)

(assert (=> mapNonEmpty!43525 (= mapRes!43525 (and tp!82769 e!635168))))

(declare-datatypes ((V!42201 0))(
  ( (V!42202 (val!13959 Int)) )
))
(declare-datatypes ((ValueCell!13193 0))(
  ( (ValueCellFull!13193 (v!16592 V!42201)) (EmptyCell!13193) )
))
(declare-fun mapValue!43525 () ValueCell!13193)

(declare-fun mapKey!43525 () (_ BitVec 32))

(declare-fun mapRest!43525 () (Array (_ BitVec 32) ValueCell!13193))

(declare-datatypes ((array!72519 0))(
  ( (array!72520 (arr!34912 (Array (_ BitVec 32) ValueCell!13193)) (size!35448 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72519)

(assert (=> mapNonEmpty!43525 (= (arr!34912 _values!996) (store mapRest!43525 mapKey!43525 mapValue!43525))))

(declare-fun b!1114432 () Bool)

(declare-fun e!635167 () Bool)

(assert (=> b!1114432 (= e!635169 e!635167)))

(declare-fun res!743893 () Bool)

(assert (=> b!1114432 (=> (not res!743893) (not e!635167))))

(declare-fun lt!496826 () array!72517)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72517 (_ BitVec 32)) Bool)

(assert (=> b!1114432 (= res!743893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496826 mask!1564))))

(assert (=> b!1114432 (= lt!496826 (array!72518 (store (arr!34911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35447 _keys!1208)))))

(declare-fun b!1114433 () Bool)

(declare-fun res!743902 () Bool)

(assert (=> b!1114433 (=> (not res!743902) (not e!635169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114433 (= res!743902 (validKeyInArray!0 k!934))))

(declare-fun res!743901 () Bool)

(assert (=> start!97574 (=> (not res!743901) (not e!635169))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97574 (= res!743901 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35447 _keys!1208))))))

(assert (=> start!97574 e!635169))

(declare-fun array_inv!26836 (array!72517) Bool)

(assert (=> start!97574 (array_inv!26836 _keys!1208)))

(assert (=> start!97574 true))

(declare-fun e!635165 () Bool)

(declare-fun array_inv!26837 (array!72519) Bool)

(assert (=> start!97574 (and (array_inv!26837 _values!996) e!635165)))

(declare-fun b!1114434 () Bool)

(declare-fun res!743897 () Bool)

(assert (=> b!1114434 (=> (not res!743897) (not e!635169))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114434 (= res!743897 (and (= (size!35448 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35447 _keys!1208) (size!35448 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114435 () Bool)

(declare-fun tp_is_empty!27805 () Bool)

(assert (=> b!1114435 (= e!635168 tp_is_empty!27805)))

(declare-fun b!1114436 () Bool)

(declare-fun e!635164 () Bool)

(assert (=> b!1114436 (= e!635165 (and e!635164 mapRes!43525))))

(declare-fun condMapEmpty!43525 () Bool)

(declare-fun mapDefault!43525 () ValueCell!13193)

