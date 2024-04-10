; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97108 () Bool)

(assert start!97108)

(declare-fun mapIsEmpty!42847 () Bool)

(declare-fun mapRes!42847 () Bool)

(assert (=> mapIsEmpty!42847 mapRes!42847))

(declare-fun b!1104416 () Bool)

(declare-fun res!736830 () Bool)

(declare-fun e!630412 () Bool)

(assert (=> b!1104416 (=> (not res!736830) (not e!630412))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104416 (= res!736830 (validKeyInArray!0 k!934))))

(declare-fun b!1104417 () Bool)

(declare-fun e!630413 () Bool)

(assert (=> b!1104417 (= e!630413 false)))

(declare-fun lt!495136 () Bool)

(declare-datatypes ((array!71635 0))(
  ( (array!71636 (arr!34471 (Array (_ BitVec 32) (_ BitVec 64))) (size!35007 (_ BitVec 32))) )
))
(declare-fun lt!495137 () array!71635)

(declare-datatypes ((List!24057 0))(
  ( (Nil!24054) (Cons!24053 (h!25262 (_ BitVec 64)) (t!34322 List!24057)) )
))
(declare-fun arrayNoDuplicates!0 (array!71635 (_ BitVec 32) List!24057) Bool)

(assert (=> b!1104417 (= lt!495136 (arrayNoDuplicates!0 lt!495137 #b00000000000000000000000000000000 Nil!24054))))

(declare-fun b!1104418 () Bool)

(declare-fun res!736828 () Bool)

(assert (=> b!1104418 (=> (not res!736828) (not e!630412))))

(declare-fun _keys!1208 () array!71635)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71635 (_ BitVec 32)) Bool)

(assert (=> b!1104418 (= res!736828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42847 () Bool)

(declare-fun tp!81767 () Bool)

(declare-fun e!630411 () Bool)

(assert (=> mapNonEmpty!42847 (= mapRes!42847 (and tp!81767 e!630411))))

(declare-datatypes ((V!41601 0))(
  ( (V!41602 (val!13734 Int)) )
))
(declare-datatypes ((ValueCell!12968 0))(
  ( (ValueCellFull!12968 (v!16367 V!41601)) (EmptyCell!12968) )
))
(declare-fun mapValue!42847 () ValueCell!12968)

(declare-fun mapRest!42847 () (Array (_ BitVec 32) ValueCell!12968))

(declare-datatypes ((array!71637 0))(
  ( (array!71638 (arr!34472 (Array (_ BitVec 32) ValueCell!12968)) (size!35008 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71637)

(declare-fun mapKey!42847 () (_ BitVec 32))

(assert (=> mapNonEmpty!42847 (= (arr!34472 _values!996) (store mapRest!42847 mapKey!42847 mapValue!42847))))

(declare-fun b!1104419 () Bool)

(declare-fun res!736834 () Bool)

(assert (=> b!1104419 (=> (not res!736834) (not e!630412))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104419 (= res!736834 (and (= (size!35008 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35007 _keys!1208) (size!35008 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104420 () Bool)

(declare-fun e!630408 () Bool)

(declare-fun tp_is_empty!27355 () Bool)

(assert (=> b!1104420 (= e!630408 tp_is_empty!27355)))

(declare-fun b!1104421 () Bool)

(assert (=> b!1104421 (= e!630412 e!630413)))

(declare-fun res!736831 () Bool)

(assert (=> b!1104421 (=> (not res!736831) (not e!630413))))

(assert (=> b!1104421 (= res!736831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495137 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104421 (= lt!495137 (array!71636 (store (arr!34471 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)))))

(declare-fun res!736827 () Bool)

(assert (=> start!97108 (=> (not res!736827) (not e!630412))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97108 (= res!736827 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35007 _keys!1208))))))

(assert (=> start!97108 e!630412))

(declare-fun array_inv!26538 (array!71635) Bool)

(assert (=> start!97108 (array_inv!26538 _keys!1208)))

(assert (=> start!97108 true))

(declare-fun e!630409 () Bool)

(declare-fun array_inv!26539 (array!71637) Bool)

(assert (=> start!97108 (and (array_inv!26539 _values!996) e!630409)))

(declare-fun b!1104422 () Bool)

(assert (=> b!1104422 (= e!630411 tp_is_empty!27355)))

(declare-fun b!1104423 () Bool)

(declare-fun res!736833 () Bool)

(assert (=> b!1104423 (=> (not res!736833) (not e!630412))))

(assert (=> b!1104423 (= res!736833 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35007 _keys!1208))))))

(declare-fun b!1104424 () Bool)

(assert (=> b!1104424 (= e!630409 (and e!630408 mapRes!42847))))

(declare-fun condMapEmpty!42847 () Bool)

(declare-fun mapDefault!42847 () ValueCell!12968)

