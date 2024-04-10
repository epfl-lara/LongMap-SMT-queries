; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!898 () Bool)

(assert start!898)

(declare-fun b_free!271 () Bool)

(declare-fun b_next!271 () Bool)

(assert (=> start!898 (= b_free!271 (not b_next!271))))

(declare-fun tp!1046 () Bool)

(declare-fun b_and!419 () Bool)

(assert (=> start!898 (= tp!1046 b_and!419)))

(declare-fun b!7491 () Bool)

(declare-fun e!4168 () Bool)

(declare-fun tp_is_empty!349 () Bool)

(assert (=> b!7491 (= e!4168 tp_is_empty!349)))

(declare-fun b!7492 () Bool)

(declare-fun res!7435 () Bool)

(declare-fun e!4171 () Bool)

(assert (=> b!7492 (=> (not res!7435) (not e!4171))))

(declare-datatypes ((array!631 0))(
  ( (array!632 (arr!303 (Array (_ BitVec 32) (_ BitVec 64))) (size!365 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!631)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!631 (_ BitVec 32)) Bool)

(assert (=> b!7492 (= res!7435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!7437 () Bool)

(assert (=> start!898 (=> (not res!7437) (not e!4171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!898 (= res!7437 (validMask!0 mask!2250))))

(assert (=> start!898 e!4171))

(assert (=> start!898 tp!1046))

(assert (=> start!898 true))

(declare-datatypes ((V!643 0))(
  ( (V!644 (val!180 Int)) )
))
(declare-datatypes ((ValueCell!158 0))(
  ( (ValueCellFull!158 (v!1272 V!643)) (EmptyCell!158) )
))
(declare-datatypes ((array!633 0))(
  ( (array!634 (arr!304 (Array (_ BitVec 32) ValueCell!158)) (size!366 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!633)

(declare-fun e!4170 () Bool)

(declare-fun array_inv!223 (array!633) Bool)

(assert (=> start!898 (and (array_inv!223 _values!1492) e!4170)))

(assert (=> start!898 tp_is_empty!349))

(declare-fun array_inv!224 (array!631) Bool)

(assert (=> start!898 (array_inv!224 _keys!1806)))

(declare-fun b!7493 () Bool)

(declare-fun e!4169 () Bool)

(assert (=> b!7493 (= e!4169 tp_is_empty!349)))

(declare-fun b!7494 () Bool)

(assert (=> b!7494 (= e!4171 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!643)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lt!1545 () Bool)

(declare-fun zeroValue!1434 () V!643)

(declare-datatypes ((tuple2!194 0))(
  ( (tuple2!195 (_1!97 (_ BitVec 64)) (_2!97 V!643)) )
))
(declare-datatypes ((List!204 0))(
  ( (Nil!201) (Cons!200 (h!766 tuple2!194) (t!2341 List!204)) )
))
(declare-datatypes ((ListLongMap!199 0))(
  ( (ListLongMap!200 (toList!115 List!204)) )
))
(declare-fun contains!90 (ListLongMap!199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!74 (array!631 array!633 (_ BitVec 32) (_ BitVec 32) V!643 V!643 (_ BitVec 32) Int) ListLongMap!199)

(assert (=> b!7494 (= lt!1545 (contains!90 (getCurrentListMap!74 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun mapIsEmpty!497 () Bool)

(declare-fun mapRes!497 () Bool)

(assert (=> mapIsEmpty!497 mapRes!497))

(declare-fun b!7495 () Bool)

(assert (=> b!7495 (= e!4170 (and e!4169 mapRes!497))))

(declare-fun condMapEmpty!497 () Bool)

(declare-fun mapDefault!497 () ValueCell!158)

