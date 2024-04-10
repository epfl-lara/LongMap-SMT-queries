; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!926 () Bool)

(assert start!926)

(declare-fun b_free!299 () Bool)

(declare-fun b_next!299 () Bool)

(assert (=> start!926 (= b_free!299 (not b_next!299))))

(declare-fun tp!1129 () Bool)

(declare-fun b_and!447 () Bool)

(assert (=> start!926 (= tp!1129 b_and!447)))

(declare-fun b!7785 () Bool)

(declare-fun res!7603 () Bool)

(declare-fun e!4379 () Bool)

(assert (=> b!7785 (=> (not res!7603) (not e!4379))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!679 0))(
  ( (V!680 (val!194 Int)) )
))
(declare-datatypes ((ValueCell!172 0))(
  ( (ValueCellFull!172 (v!1286 V!679)) (EmptyCell!172) )
))
(declare-datatypes ((array!687 0))(
  ( (array!688 (arr!331 (Array (_ BitVec 32) ValueCell!172)) (size!393 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!687)

(declare-datatypes ((array!689 0))(
  ( (array!690 (arr!332 (Array (_ BitVec 32) (_ BitVec 64))) (size!394 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!689)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7785 (= res!7603 (and (= (size!393 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!394 _keys!1806) (size!393 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7786 () Bool)

(assert (=> b!7786 (= e!4379 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!679)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!679)

(declare-fun lt!1587 () Bool)

(declare-datatypes ((tuple2!214 0))(
  ( (tuple2!215 (_1!107 (_ BitVec 64)) (_2!107 V!679)) )
))
(declare-datatypes ((List!224 0))(
  ( (Nil!221) (Cons!220 (h!786 tuple2!214) (t!2361 List!224)) )
))
(declare-datatypes ((ListLongMap!219 0))(
  ( (ListLongMap!220 (toList!125 List!224)) )
))
(declare-fun contains!100 (ListLongMap!219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!84 (array!689 array!687 (_ BitVec 32) (_ BitVec 32) V!679 V!679 (_ BitVec 32) Int) ListLongMap!219)

(assert (=> b!7786 (= lt!1587 (contains!100 (getCurrentListMap!84 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7787 () Bool)

(declare-fun res!7605 () Bool)

(assert (=> b!7787 (=> (not res!7605) (not e!4379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!689 (_ BitVec 32)) Bool)

(assert (=> b!7787 (= res!7605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7788 () Bool)

(declare-fun e!4382 () Bool)

(declare-fun tp_is_empty!377 () Bool)

(assert (=> b!7788 (= e!4382 tp_is_empty!377)))

(declare-fun b!7789 () Bool)

(declare-fun res!7606 () Bool)

(assert (=> b!7789 (=> (not res!7606) (not e!4379))))

(declare-datatypes ((List!225 0))(
  ( (Nil!222) (Cons!221 (h!787 (_ BitVec 64)) (t!2362 List!225)) )
))
(declare-fun arrayNoDuplicates!0 (array!689 (_ BitVec 32) List!225) Bool)

(assert (=> b!7789 (= res!7606 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!222))))

(declare-fun b!7790 () Bool)

(declare-fun e!4381 () Bool)

(declare-fun e!4380 () Bool)

(declare-fun mapRes!539 () Bool)

(assert (=> b!7790 (= e!4381 (and e!4380 mapRes!539))))

(declare-fun condMapEmpty!539 () Bool)

(declare-fun mapDefault!539 () ValueCell!172)

