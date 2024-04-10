; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97578 () Bool)

(assert start!97578)

(declare-fun res!743962 () Bool)

(declare-fun e!635200 () Bool)

(assert (=> start!97578 (=> (not res!743962) (not e!635200))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72525 0))(
  ( (array!72526 (arr!34915 (Array (_ BitVec 32) (_ BitVec 64))) (size!35451 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72525)

(assert (=> start!97578 (= res!743962 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35451 _keys!1208))))))

(assert (=> start!97578 e!635200))

(declare-fun array_inv!26840 (array!72525) Bool)

(assert (=> start!97578 (array_inv!26840 _keys!1208)))

(assert (=> start!97578 true))

(declare-datatypes ((V!42205 0))(
  ( (V!42206 (val!13961 Int)) )
))
(declare-datatypes ((ValueCell!13195 0))(
  ( (ValueCellFull!13195 (v!16594 V!42205)) (EmptyCell!13195) )
))
(declare-datatypes ((array!72527 0))(
  ( (array!72528 (arr!34916 (Array (_ BitVec 32) ValueCell!13195)) (size!35452 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72527)

(declare-fun e!635202 () Bool)

(declare-fun array_inv!26841 (array!72527) Bool)

(assert (=> start!97578 (and (array_inv!26841 _values!996) e!635202)))

(declare-fun mapNonEmpty!43531 () Bool)

(declare-fun mapRes!43531 () Bool)

(declare-fun tp!82775 () Bool)

(declare-fun e!635204 () Bool)

(assert (=> mapNonEmpty!43531 (= mapRes!43531 (and tp!82775 e!635204))))

(declare-fun mapKey!43531 () (_ BitVec 32))

(declare-fun mapValue!43531 () ValueCell!13195)

(declare-fun mapRest!43531 () (Array (_ BitVec 32) ValueCell!13195))

(assert (=> mapNonEmpty!43531 (= (arr!34916 _values!996) (store mapRest!43531 mapKey!43531 mapValue!43531))))

(declare-fun b!1114509 () Bool)

(declare-fun res!743954 () Bool)

(assert (=> b!1114509 (=> (not res!743954) (not e!635200))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114509 (= res!743954 (validKeyInArray!0 k!934))))

(declare-fun b!1114510 () Bool)

(declare-fun e!635205 () Bool)

(assert (=> b!1114510 (= e!635202 (and e!635205 mapRes!43531))))

(declare-fun condMapEmpty!43531 () Bool)

(declare-fun mapDefault!43531 () ValueCell!13195)

