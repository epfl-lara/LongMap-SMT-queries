; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1080 () Bool)

(assert start!1080)

(declare-fun b_free!383 () Bool)

(declare-fun b_next!383 () Bool)

(assert (=> start!1080 (= b_free!383 (not b_next!383))))

(declare-fun tp!1390 () Bool)

(declare-fun b_and!537 () Bool)

(assert (=> start!1080 (= tp!1390 b_and!537)))

(declare-fun b!9601 () Bool)

(declare-fun res!8606 () Bool)

(declare-fun e!5495 () Bool)

(assert (=> b!9601 (=> res!8606 e!5495)))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!2174 () (_ BitVec 32))

(declare-datatypes ((array!853 0))(
  ( (array!854 (arr!411 (Array (_ BitVec 32) (_ BitVec 64))) (size!473 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!853)

(declare-fun k!1278 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!36 0))(
  ( (MissingZero!36 (index!2263 (_ BitVec 32))) (Found!36 (index!2264 (_ BitVec 32))) (Intermediate!36 (undefined!848 Bool) (index!2265 (_ BitVec 32)) (x!2798 (_ BitVec 32))) (Undefined!36) (MissingVacant!36 (index!2266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!853 (_ BitVec 32)) SeekEntryResult!36)

(assert (=> b!9601 (= res!8606 (not (= (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250) (Found!36 lt!2174))))))

(declare-fun b!9602 () Bool)

(declare-fun res!8599 () Bool)

(declare-fun e!5494 () Bool)

(assert (=> b!9602 (=> (not res!8599) (not e!5494))))

(declare-datatypes ((List!286 0))(
  ( (Nil!283) (Cons!282 (h!848 (_ BitVec 64)) (t!2429 List!286)) )
))
(declare-fun arrayNoDuplicates!0 (array!853 (_ BitVec 32) List!286) Bool)

(assert (=> b!9602 (= res!8599 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!283))))

(declare-fun b!9604 () Bool)

(declare-fun res!8598 () Bool)

(assert (=> b!9604 (=> (not res!8598) (not e!5494))))

(declare-datatypes ((V!791 0))(
  ( (V!792 (val!236 Int)) )
))
(declare-datatypes ((ValueCell!214 0))(
  ( (ValueCellFull!214 (v!1331 V!791)) (EmptyCell!214) )
))
(declare-datatypes ((array!855 0))(
  ( (array!856 (arr!412 (Array (_ BitVec 32) ValueCell!214)) (size!474 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!855)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9604 (= res!8598 (and (= (size!474 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!473 _keys!1806) (size!474 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9605 () Bool)

(declare-fun e!5499 () Bool)

(declare-fun arrayContainsKey!0 (array!853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9605 (= e!5499 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!9606 () Bool)

(declare-fun e!5501 () Bool)

(declare-fun tp_is_empty!461 () Bool)

(assert (=> b!9606 (= e!5501 tp_is_empty!461)))

(declare-fun b!9607 () Bool)

(declare-fun res!8607 () Bool)

(assert (=> b!9607 (=> (not res!8607) (not e!5494))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!791)

(declare-fun zeroValue!1434 () V!791)

(declare-datatypes ((tuple2!274 0))(
  ( (tuple2!275 (_1!137 (_ BitVec 64)) (_2!137 V!791)) )
))
(declare-datatypes ((List!287 0))(
  ( (Nil!284) (Cons!283 (h!849 tuple2!274) (t!2430 List!287)) )
))
(declare-datatypes ((ListLongMap!279 0))(
  ( (ListLongMap!280 (toList!155 List!287)) )
))
(declare-fun contains!133 (ListLongMap!279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!114 (array!853 array!855 (_ BitVec 32) (_ BitVec 32) V!791 V!791 (_ BitVec 32) Int) ListLongMap!279)

(assert (=> b!9607 (= res!8607 (contains!133 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!9608 () Bool)

(declare-fun e!5500 () Bool)

(declare-fun mapRes!674 () Bool)

(assert (=> b!9608 (= e!5500 (and e!5501 mapRes!674))))

(declare-fun condMapEmpty!674 () Bool)

(declare-fun mapDefault!674 () ValueCell!214)

