; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1044 () Bool)

(assert start!1044)

(declare-fun b_free!373 () Bool)

(declare-fun b_next!373 () Bool)

(assert (=> start!1044 (= b_free!373 (not b_next!373))))

(declare-fun tp!1357 () Bool)

(declare-fun b_and!525 () Bool)

(assert (=> start!1044 (= tp!1357 b_and!525)))

(declare-fun b!9233 () Bool)

(declare-fun res!8404 () Bool)

(declare-fun e!5276 () Bool)

(assert (=> b!9233 (=> (not res!8404) (not e!5276))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9233 (= res!8404 (validKeyInArray!0 k!1278))))

(declare-fun b!9234 () Bool)

(declare-fun res!8402 () Bool)

(assert (=> b!9234 (=> (not res!8402) (not e!5276))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!779 0))(
  ( (V!780 (val!231 Int)) )
))
(declare-datatypes ((ValueCell!209 0))(
  ( (ValueCellFull!209 (v!1325 V!779)) (EmptyCell!209) )
))
(declare-datatypes ((array!831 0))(
  ( (array!832 (arr!401 (Array (_ BitVec 32) ValueCell!209)) (size!463 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!831)

(declare-fun minValue!1434 () V!779)

(declare-datatypes ((array!833 0))(
  ( (array!834 (arr!402 (Array (_ BitVec 32) (_ BitVec 64))) (size!464 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!833)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!779)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((tuple2!268 0))(
  ( (tuple2!269 (_1!134 (_ BitVec 64)) (_2!134 V!779)) )
))
(declare-datatypes ((List!279 0))(
  ( (Nil!276) (Cons!275 (h!841 tuple2!268) (t!2420 List!279)) )
))
(declare-datatypes ((ListLongMap!273 0))(
  ( (ListLongMap!274 (toList!152 List!279)) )
))
(declare-fun contains!129 (ListLongMap!273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!111 (array!833 array!831 (_ BitVec 32) (_ BitVec 32) V!779 V!779 (_ BitVec 32) Int) ListLongMap!273)

(assert (=> b!9234 (= res!8402 (contains!129 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!9235 () Bool)

(declare-fun res!8400 () Bool)

(assert (=> b!9235 (=> (not res!8400) (not e!5276))))

(assert (=> b!9235 (= res!8400 (and (= (size!463 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!464 _keys!1806) (size!463 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!656 () Bool)

(declare-fun mapRes!656 () Bool)

(declare-fun tp!1358 () Bool)

(declare-fun e!5273 () Bool)

(assert (=> mapNonEmpty!656 (= mapRes!656 (and tp!1358 e!5273))))

(declare-fun mapValue!656 () ValueCell!209)

(declare-fun mapKey!656 () (_ BitVec 32))

(declare-fun mapRest!656 () (Array (_ BitVec 32) ValueCell!209))

(assert (=> mapNonEmpty!656 (= (arr!401 _values!1492) (store mapRest!656 mapKey!656 mapValue!656))))

(declare-fun b!9236 () Bool)

(declare-fun res!8405 () Bool)

(assert (=> b!9236 (=> (not res!8405) (not e!5276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!833 (_ BitVec 32)) Bool)

(assert (=> b!9236 (= res!8405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9237 () Bool)

(declare-fun res!8403 () Bool)

(assert (=> b!9237 (=> (not res!8403) (not e!5276))))

(declare-datatypes ((List!280 0))(
  ( (Nil!277) (Cons!276 (h!842 (_ BitVec 64)) (t!2421 List!280)) )
))
(declare-fun arrayNoDuplicates!0 (array!833 (_ BitVec 32) List!280) Bool)

(assert (=> b!9237 (= res!8403 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!277))))

(declare-fun mapIsEmpty!656 () Bool)

(assert (=> mapIsEmpty!656 mapRes!656))

(declare-fun e!5269 () Bool)

(declare-fun lt!2007 () (_ BitVec 32))

(declare-fun b!9238 () Bool)

(declare-datatypes ((SeekEntryResult!33 0))(
  ( (MissingZero!33 (index!2251 (_ BitVec 32))) (Found!33 (index!2252 (_ BitVec 32))) (Intermediate!33 (undefined!845 Bool) (index!2253 (_ BitVec 32)) (x!2777 (_ BitVec 32))) (Undefined!33) (MissingVacant!33 (index!2254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!833 (_ BitVec 32)) SeekEntryResult!33)

(assert (=> b!9238 (= e!5269 (= (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250) (Found!33 lt!2007)))))

(declare-fun b!9239 () Bool)

(declare-fun e!5275 () Bool)

(declare-fun e!5272 () Bool)

(assert (=> b!9239 (= e!5275 (and e!5272 mapRes!656))))

(declare-fun condMapEmpty!656 () Bool)

(declare-fun mapDefault!656 () ValueCell!209)

