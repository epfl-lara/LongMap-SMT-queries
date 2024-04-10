; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97584 () Bool)

(assert start!97584)

(declare-fun res!744049 () Bool)

(declare-fun e!635255 () Bool)

(assert (=> start!97584 (=> (not res!744049) (not e!635255))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72537 0))(
  ( (array!72538 (arr!34921 (Array (_ BitVec 32) (_ BitVec 64))) (size!35457 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72537)

(assert (=> start!97584 (= res!744049 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35457 _keys!1208))))))

(assert (=> start!97584 e!635255))

(declare-fun array_inv!26846 (array!72537) Bool)

(assert (=> start!97584 (array_inv!26846 _keys!1208)))

(assert (=> start!97584 true))

(declare-datatypes ((V!42213 0))(
  ( (V!42214 (val!13964 Int)) )
))
(declare-datatypes ((ValueCell!13198 0))(
  ( (ValueCellFull!13198 (v!16597 V!42213)) (EmptyCell!13198) )
))
(declare-datatypes ((array!72539 0))(
  ( (array!72540 (arr!34922 (Array (_ BitVec 32) ValueCell!13198)) (size!35458 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72539)

(declare-fun e!635258 () Bool)

(declare-fun array_inv!26847 (array!72539) Bool)

(assert (=> start!97584 (and (array_inv!26847 _values!996) e!635258)))

(declare-fun b!1114626 () Bool)

(declare-fun e!635257 () Bool)

(assert (=> b!1114626 (= e!635257 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114626 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36582 0))(
  ( (Unit!36583) )
))
(declare-fun lt!496855 () Unit!36582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72537 (_ BitVec 64) (_ BitVec 32)) Unit!36582)

(assert (=> b!1114626 (= lt!496855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114627 () Bool)

(declare-fun res!744047 () Bool)

(assert (=> b!1114627 (=> (not res!744047) (not e!635255))))

(declare-datatypes ((List!24333 0))(
  ( (Nil!24330) (Cons!24329 (h!25538 (_ BitVec 64)) (t!34814 List!24333)) )
))
(declare-fun arrayNoDuplicates!0 (array!72537 (_ BitVec 32) List!24333) Bool)

(assert (=> b!1114627 (= res!744047 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24330))))

(declare-fun mapNonEmpty!43540 () Bool)

(declare-fun mapRes!43540 () Bool)

(declare-fun tp!82784 () Bool)

(declare-fun e!635254 () Bool)

(assert (=> mapNonEmpty!43540 (= mapRes!43540 (and tp!82784 e!635254))))

(declare-fun mapRest!43540 () (Array (_ BitVec 32) ValueCell!13198))

(declare-fun mapValue!43540 () ValueCell!13198)

(declare-fun mapKey!43540 () (_ BitVec 32))

(assert (=> mapNonEmpty!43540 (= (arr!34922 _values!996) (store mapRest!43540 mapKey!43540 mapValue!43540))))

(declare-fun b!1114628 () Bool)

(declare-fun res!744044 () Bool)

(assert (=> b!1114628 (=> (not res!744044) (not e!635255))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72537 (_ BitVec 32)) Bool)

(assert (=> b!1114628 (= res!744044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114629 () Bool)

(declare-fun res!744052 () Bool)

(assert (=> b!1114629 (=> (not res!744052) (not e!635255))))

(assert (=> b!1114629 (= res!744052 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35457 _keys!1208))))))

(declare-fun mapIsEmpty!43540 () Bool)

(assert (=> mapIsEmpty!43540 mapRes!43540))

(declare-fun b!1114630 () Bool)

(declare-fun res!744043 () Bool)

(assert (=> b!1114630 (=> (not res!744043) (not e!635255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114630 (= res!744043 (validMask!0 mask!1564))))

(declare-fun b!1114631 () Bool)

(declare-fun res!744051 () Bool)

(assert (=> b!1114631 (=> (not res!744051) (not e!635257))))

(declare-fun lt!496856 () array!72537)

(assert (=> b!1114631 (= res!744051 (arrayNoDuplicates!0 lt!496856 #b00000000000000000000000000000000 Nil!24330))))

(declare-fun b!1114632 () Bool)

(declare-fun tp_is_empty!27815 () Bool)

(assert (=> b!1114632 (= e!635254 tp_is_empty!27815)))

(declare-fun b!1114633 () Bool)

(declare-fun res!744045 () Bool)

(assert (=> b!1114633 (=> (not res!744045) (not e!635255))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114633 (= res!744045 (and (= (size!35458 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35457 _keys!1208) (size!35458 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114634 () Bool)

(declare-fun e!635259 () Bool)

(assert (=> b!1114634 (= e!635258 (and e!635259 mapRes!43540))))

(declare-fun condMapEmpty!43540 () Bool)

(declare-fun mapDefault!43540 () ValueCell!13198)

