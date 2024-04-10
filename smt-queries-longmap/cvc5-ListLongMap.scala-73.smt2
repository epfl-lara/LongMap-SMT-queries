; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1014 () Bool)

(assert start!1014)

(declare-fun b_free!343 () Bool)

(declare-fun b_next!343 () Bool)

(assert (=> start!1014 (= b_free!343 (not b_next!343))))

(declare-fun tp!1268 () Bool)

(declare-fun b_and!495 () Bool)

(assert (=> start!1014 (= tp!1268 b_and!495)))

(declare-fun b!8691 () Bool)

(declare-fun e!4954 () Bool)

(declare-fun tp_is_empty!421 () Bool)

(assert (=> b!8691 (= e!4954 tp_is_empty!421)))

(declare-fun b!8692 () Bool)

(declare-fun res!8085 () Bool)

(declare-fun e!4956 () Bool)

(assert (=> b!8692 (=> (not res!8085) (not e!4956))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!739 0))(
  ( (V!740 (val!216 Int)) )
))
(declare-datatypes ((ValueCell!194 0))(
  ( (ValueCellFull!194 (v!1310 V!739)) (EmptyCell!194) )
))
(declare-datatypes ((array!775 0))(
  ( (array!776 (arr!373 (Array (_ BitVec 32) ValueCell!194)) (size!435 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!775)

(declare-datatypes ((array!777 0))(
  ( (array!778 (arr!374 (Array (_ BitVec 32) (_ BitVec 64))) (size!436 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!777)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!739)

(declare-fun minValue!1434 () V!739)

(declare-datatypes ((tuple2!248 0))(
  ( (tuple2!249 (_1!124 (_ BitVec 64)) (_2!124 V!739)) )
))
(declare-datatypes ((List!258 0))(
  ( (Nil!255) (Cons!254 (h!820 tuple2!248) (t!2399 List!258)) )
))
(declare-datatypes ((ListLongMap!253 0))(
  ( (ListLongMap!254 (toList!142 List!258)) )
))
(declare-fun contains!119 (ListLongMap!253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!101 (array!777 array!775 (_ BitVec 32) (_ BitVec 32) V!739 V!739 (_ BitVec 32) Int) ListLongMap!253)

(assert (=> b!8692 (= res!8085 (contains!119 (getCurrentListMap!101 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8693 () Bool)

(declare-fun e!4953 () Bool)

(assert (=> b!8693 (= e!4953 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8694 () Bool)

(declare-fun e!4957 () Bool)

(assert (=> b!8694 (= e!4957 tp_is_empty!421)))

(declare-fun res!8084 () Bool)

(assert (=> start!1014 (=> (not res!8084) (not e!4956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1014 (= res!8084 (validMask!0 mask!2250))))

(assert (=> start!1014 e!4956))

(assert (=> start!1014 tp!1268))

(assert (=> start!1014 true))

(declare-fun e!4952 () Bool)

(declare-fun array_inv!277 (array!775) Bool)

(assert (=> start!1014 (and (array_inv!277 _values!1492) e!4952)))

(assert (=> start!1014 tp_is_empty!421))

(declare-fun array_inv!278 (array!777) Bool)

(assert (=> start!1014 (array_inv!278 _keys!1806)))

(declare-fun b!8695 () Bool)

(declare-fun res!8083 () Bool)

(assert (=> b!8695 (=> (not res!8083) (not e!4956))))

(declare-datatypes ((List!259 0))(
  ( (Nil!256) (Cons!255 (h!821 (_ BitVec 64)) (t!2400 List!259)) )
))
(declare-fun arrayNoDuplicates!0 (array!777 (_ BitVec 32) List!259) Bool)

(assert (=> b!8695 (= res!8083 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!256))))

(declare-fun b!8696 () Bool)

(declare-fun res!8086 () Bool)

(assert (=> b!8696 (=> (not res!8086) (not e!4956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!777 (_ BitVec 32)) Bool)

(assert (=> b!8696 (= res!8086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8697 () Bool)

(declare-fun mapRes!611 () Bool)

(assert (=> b!8697 (= e!4952 (and e!4954 mapRes!611))))

(declare-fun condMapEmpty!611 () Bool)

(declare-fun mapDefault!611 () ValueCell!194)

