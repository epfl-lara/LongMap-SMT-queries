; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110582 () Bool)

(assert start!110582)

(declare-fun b_free!29417 () Bool)

(declare-fun b_next!29417 () Bool)

(assert (=> start!110582 (= b_free!29417 (not b_next!29417))))

(declare-fun tp!103573 () Bool)

(declare-fun b_and!47625 () Bool)

(assert (=> start!110582 (= tp!103573 b_and!47625)))

(declare-fun b!1308283 () Bool)

(declare-fun res!868453 () Bool)

(declare-fun e!746489 () Bool)

(assert (=> b!1308283 (=> (not res!868453) (not e!746489))))

(declare-datatypes ((array!87292 0))(
  ( (array!87293 (arr!42126 (Array (_ BitVec 32) (_ BitVec 64))) (size!42676 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87292)

(declare-datatypes ((List!29865 0))(
  ( (Nil!29862) (Cons!29861 (h!31070 (_ BitVec 64)) (t!43471 List!29865)) )
))
(declare-fun arrayNoDuplicates!0 (array!87292 (_ BitVec 32) List!29865) Bool)

(assert (=> b!1308283 (= res!868453 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29862))))

(declare-fun b!1308284 () Bool)

(declare-fun res!868456 () Bool)

(assert (=> b!1308284 (=> (not res!868456) (not e!746489))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308284 (= res!868456 (validKeyInArray!0 (select (arr!42126 _keys!1628) from!2020)))))

(declare-fun mapIsEmpty!54349 () Bool)

(declare-fun mapRes!54349 () Bool)

(assert (=> mapIsEmpty!54349 mapRes!54349))

(declare-fun b!1308285 () Bool)

(declare-fun e!746488 () Bool)

(declare-fun tp_is_empty!35147 () Bool)

(assert (=> b!1308285 (= e!746488 tp_is_empty!35147)))

(declare-fun res!868458 () Bool)

(assert (=> start!110582 (=> (not res!868458) (not e!746489))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110582 (= res!868458 (validMask!0 mask!2040))))

(assert (=> start!110582 e!746489))

(assert (=> start!110582 tp!103573))

(declare-fun array_inv!31839 (array!87292) Bool)

(assert (=> start!110582 (array_inv!31839 _keys!1628)))

(assert (=> start!110582 true))

(assert (=> start!110582 tp_is_empty!35147))

(declare-datatypes ((V!51965 0))(
  ( (V!51966 (val!17648 Int)) )
))
(declare-datatypes ((ValueCell!16675 0))(
  ( (ValueCellFull!16675 (v!20275 V!51965)) (EmptyCell!16675) )
))
(declare-datatypes ((array!87294 0))(
  ( (array!87295 (arr!42127 (Array (_ BitVec 32) ValueCell!16675)) (size!42677 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87294)

(declare-fun e!746490 () Bool)

(declare-fun array_inv!31840 (array!87294) Bool)

(assert (=> start!110582 (and (array_inv!31840 _values!1354) e!746490)))

(declare-fun b!1308286 () Bool)

(declare-fun res!868455 () Bool)

(assert (=> b!1308286 (=> (not res!868455) (not e!746489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87292 (_ BitVec 32)) Bool)

(assert (=> b!1308286 (= res!868455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308287 () Bool)

(declare-fun res!868452 () Bool)

(assert (=> b!1308287 (=> (not res!868452) (not e!746489))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51965)

(declare-fun zeroValue!1296 () V!51965)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22724 0))(
  ( (tuple2!22725 (_1!11373 (_ BitVec 64)) (_2!11373 V!51965)) )
))
(declare-datatypes ((List!29866 0))(
  ( (Nil!29863) (Cons!29862 (h!31071 tuple2!22724) (t!43472 List!29866)) )
))
(declare-datatypes ((ListLongMap!20381 0))(
  ( (ListLongMap!20382 (toList!10206 List!29866)) )
))
(declare-fun contains!8356 (ListLongMap!20381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5219 (array!87292 array!87294 (_ BitVec 32) (_ BitVec 32) V!51965 V!51965 (_ BitVec 32) Int) ListLongMap!20381)

(assert (=> b!1308287 (= res!868452 (contains!8356 (getCurrentListMap!5219 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1308288 () Bool)

(declare-fun e!746492 () Bool)

(assert (=> b!1308288 (= e!746492 tp_is_empty!35147)))

(declare-fun b!1308289 () Bool)

(assert (=> b!1308289 (= e!746490 (and e!746492 mapRes!54349))))

(declare-fun condMapEmpty!54349 () Bool)

(declare-fun mapDefault!54349 () ValueCell!16675)

