; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1030 () Bool)

(assert start!1030)

(declare-fun b_free!359 () Bool)

(declare-fun b_next!359 () Bool)

(assert (=> start!1030 (= b_free!359 (not b_next!359))))

(declare-fun tp!1315 () Bool)

(declare-fun b_and!511 () Bool)

(assert (=> start!1030 (= tp!1315 b_and!511)))

(declare-fun mapIsEmpty!635 () Bool)

(declare-fun mapRes!635 () Bool)

(assert (=> mapIsEmpty!635 mapRes!635))

(declare-fun b!8979 () Bool)

(declare-fun res!8254 () Bool)

(declare-fun e!5120 () Bool)

(assert (=> b!8979 (=> (not res!8254) (not e!5120))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!759 0))(
  ( (V!760 (val!224 Int)) )
))
(declare-datatypes ((ValueCell!202 0))(
  ( (ValueCellFull!202 (v!1318 V!759)) (EmptyCell!202) )
))
(declare-datatypes ((array!807 0))(
  ( (array!808 (arr!389 (Array (_ BitVec 32) ValueCell!202)) (size!451 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!807)

(declare-fun minValue!1434 () V!759)

(declare-datatypes ((array!809 0))(
  ( (array!810 (arr!390 (Array (_ BitVec 32) (_ BitVec 64))) (size!452 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!809)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!759)

(declare-fun k!1278 () (_ BitVec 64))

(declare-datatypes ((tuple2!260 0))(
  ( (tuple2!261 (_1!130 (_ BitVec 64)) (_2!130 V!759)) )
))
(declare-datatypes ((List!270 0))(
  ( (Nil!267) (Cons!266 (h!832 tuple2!260) (t!2411 List!270)) )
))
(declare-datatypes ((ListLongMap!265 0))(
  ( (ListLongMap!266 (toList!148 List!270)) )
))
(declare-fun contains!125 (ListLongMap!265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!107 (array!809 array!807 (_ BitVec 32) (_ BitVec 32) V!759 V!759 (_ BitVec 32) Int) ListLongMap!265)

(assert (=> b!8979 (= res!8254 (contains!125 (getCurrentListMap!107 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8980 () Bool)

(declare-fun res!8257 () Bool)

(assert (=> b!8980 (=> (not res!8257) (not e!5120))))

(declare-datatypes ((List!271 0))(
  ( (Nil!268) (Cons!267 (h!833 (_ BitVec 64)) (t!2412 List!271)) )
))
(declare-fun arrayNoDuplicates!0 (array!809 (_ BitVec 32) List!271) Bool)

(assert (=> b!8980 (= res!8257 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!268))))

(declare-fun b!8981 () Bool)

(declare-fun res!8255 () Bool)

(assert (=> b!8981 (=> (not res!8255) (not e!5120))))

(assert (=> b!8981 (= res!8255 (and (= (size!451 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!452 _keys!1806) (size!451 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8982 () Bool)

(declare-fun e!5123 () Bool)

(assert (=> b!8982 (= e!5123 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8983 () Bool)

(declare-fun e!5124 () Bool)

(declare-fun tp_is_empty!437 () Bool)

(assert (=> b!8983 (= e!5124 tp_is_empty!437)))

(declare-fun b!8984 () Bool)

(declare-fun e!5122 () Bool)

(assert (=> b!8984 (= e!5122 (and e!5124 mapRes!635))))

(declare-fun condMapEmpty!635 () Bool)

(declare-fun mapDefault!635 () ValueCell!202)

