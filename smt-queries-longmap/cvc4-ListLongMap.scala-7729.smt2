; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97090 () Bool)

(assert start!97090)

(declare-fun b!1104324 () Bool)

(declare-fun e!630349 () Bool)

(declare-fun tp_is_empty!27353 () Bool)

(assert (=> b!1104324 (= e!630349 tp_is_empty!27353)))

(declare-fun b!1104325 () Bool)

(declare-fun res!736770 () Bool)

(declare-fun e!630350 () Bool)

(assert (=> b!1104325 (=> (not res!736770) (not e!630350))))

(declare-datatypes ((array!71629 0))(
  ( (array!71630 (arr!34469 (Array (_ BitVec 32) (_ BitVec 64))) (size!35005 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71629)

(declare-datatypes ((List!24056 0))(
  ( (Nil!24053) (Cons!24052 (h!25261 (_ BitVec 64)) (t!34321 List!24056)) )
))
(declare-fun arrayNoDuplicates!0 (array!71629 (_ BitVec 32) List!24056) Bool)

(assert (=> b!1104325 (= res!736770 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24053))))

(declare-fun b!1104326 () Bool)

(declare-fun res!736776 () Bool)

(assert (=> b!1104326 (=> (not res!736776) (not e!630350))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71629 (_ BitVec 32)) Bool)

(assert (=> b!1104326 (= res!736776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!736771 () Bool)

(assert (=> start!97090 (=> (not res!736771) (not e!630350))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97090 (= res!736771 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35005 _keys!1208))))))

(assert (=> start!97090 e!630350))

(declare-fun array_inv!26536 (array!71629) Bool)

(assert (=> start!97090 (array_inv!26536 _keys!1208)))

(assert (=> start!97090 true))

(declare-datatypes ((V!41597 0))(
  ( (V!41598 (val!13733 Int)) )
))
(declare-datatypes ((ValueCell!12967 0))(
  ( (ValueCellFull!12967 (v!16365 V!41597)) (EmptyCell!12967) )
))
(declare-datatypes ((array!71631 0))(
  ( (array!71632 (arr!34470 (Array (_ BitVec 32) ValueCell!12967)) (size!35006 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71631)

(declare-fun e!630348 () Bool)

(declare-fun array_inv!26537 (array!71631) Bool)

(assert (=> start!97090 (and (array_inv!26537 _values!996) e!630348)))

(declare-fun b!1104327 () Bool)

(declare-fun e!630351 () Bool)

(assert (=> b!1104327 (= e!630351 tp_is_empty!27353)))

(declare-fun b!1104328 () Bool)

(declare-fun e!630346 () Bool)

(declare-fun contains!6418 (List!24056 (_ BitVec 64)) Bool)

(assert (=> b!1104328 (= e!630346 (contains!6418 Nil!24053 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104329 () Bool)

(declare-fun res!736767 () Bool)

(assert (=> b!1104329 (=> (not res!736767) (not e!630350))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1104329 (= res!736767 (= (select (arr!34469 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!42841 () Bool)

(declare-fun mapRes!42841 () Bool)

(assert (=> mapIsEmpty!42841 mapRes!42841))

(declare-fun b!1104330 () Bool)

(assert (=> b!1104330 (= e!630348 (and e!630349 mapRes!42841))))

(declare-fun condMapEmpty!42841 () Bool)

(declare-fun mapDefault!42841 () ValueCell!12967)

