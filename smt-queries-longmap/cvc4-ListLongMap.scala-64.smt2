; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!920 () Bool)

(assert start!920)

(declare-fun b_free!293 () Bool)

(declare-fun b_next!293 () Bool)

(assert (=> start!920 (= b_free!293 (not b_next!293))))

(declare-fun tp!1111 () Bool)

(declare-fun b_and!441 () Bool)

(assert (=> start!920 (= tp!1111 b_and!441)))

(declare-fun b!7722 () Bool)

(declare-fun e!4336 () Bool)

(declare-fun tp_is_empty!371 () Bool)

(assert (=> b!7722 (= e!4336 tp_is_empty!371)))

(declare-fun res!7568 () Bool)

(declare-fun e!4337 () Bool)

(assert (=> start!920 (=> (not res!7568) (not e!4337))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!920 (= res!7568 (validMask!0 mask!2250))))

(assert (=> start!920 e!4337))

(assert (=> start!920 tp!1111))

(assert (=> start!920 true))

(declare-datatypes ((V!671 0))(
  ( (V!672 (val!191 Int)) )
))
(declare-datatypes ((ValueCell!169 0))(
  ( (ValueCellFull!169 (v!1283 V!671)) (EmptyCell!169) )
))
(declare-datatypes ((array!675 0))(
  ( (array!676 (arr!325 (Array (_ BitVec 32) ValueCell!169)) (size!387 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!675)

(declare-fun e!4335 () Bool)

(declare-fun array_inv!241 (array!675) Bool)

(assert (=> start!920 (and (array_inv!241 _values!1492) e!4335)))

(assert (=> start!920 tp_is_empty!371))

(declare-datatypes ((array!677 0))(
  ( (array!678 (arr!326 (Array (_ BitVec 32) (_ BitVec 64))) (size!388 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!677)

(declare-fun array_inv!242 (array!677) Bool)

(assert (=> start!920 (array_inv!242 _keys!1806)))

(declare-fun mapIsEmpty!530 () Bool)

(declare-fun mapRes!530 () Bool)

(assert (=> mapIsEmpty!530 mapRes!530))

(declare-fun b!7723 () Bool)

(declare-fun res!7569 () Bool)

(assert (=> b!7723 (=> (not res!7569) (not e!4337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!677 (_ BitVec 32)) Bool)

(assert (=> b!7723 (= res!7569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7724 () Bool)

(declare-fun e!4333 () Bool)

(assert (=> b!7724 (= e!4333 tp_is_empty!371)))

(declare-fun b!7725 () Bool)

(assert (=> b!7725 (= e!4337 false)))

(declare-fun lt!1578 () Bool)

(declare-fun minValue!1434 () V!671)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!671)

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((tuple2!210 0))(
  ( (tuple2!211 (_1!105 (_ BitVec 64)) (_2!105 V!671)) )
))
(declare-datatypes ((List!220 0))(
  ( (Nil!217) (Cons!216 (h!782 tuple2!210) (t!2357 List!220)) )
))
(declare-datatypes ((ListLongMap!215 0))(
  ( (ListLongMap!216 (toList!123 List!220)) )
))
(declare-fun contains!98 (ListLongMap!215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!82 (array!677 array!675 (_ BitVec 32) (_ BitVec 32) V!671 V!671 (_ BitVec 32) Int) ListLongMap!215)

(assert (=> b!7725 (= lt!1578 (contains!98 (getCurrentListMap!82 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7726 () Bool)

(declare-fun res!7570 () Bool)

(assert (=> b!7726 (=> (not res!7570) (not e!4337))))

(assert (=> b!7726 (= res!7570 (and (= (size!387 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!388 _keys!1806) (size!387 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7727 () Bool)

(assert (=> b!7727 (= e!4335 (and e!4333 mapRes!530))))

(declare-fun condMapEmpty!530 () Bool)

(declare-fun mapDefault!530 () ValueCell!169)

