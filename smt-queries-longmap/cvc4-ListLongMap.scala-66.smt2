; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!932 () Bool)

(assert start!932)

(declare-fun b_free!305 () Bool)

(declare-fun b_next!305 () Bool)

(assert (=> start!932 (= b_free!305 (not b_next!305))))

(declare-fun tp!1148 () Bool)

(declare-fun b_and!453 () Bool)

(assert (=> start!932 (= tp!1148 b_and!453)))

(declare-fun b!7848 () Bool)

(declare-fun res!7641 () Bool)

(declare-fun e!4424 () Bool)

(assert (=> b!7848 (=> (not res!7641) (not e!4424))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!687 0))(
  ( (V!688 (val!197 Int)) )
))
(declare-datatypes ((ValueCell!175 0))(
  ( (ValueCellFull!175 (v!1289 V!687)) (EmptyCell!175) )
))
(declare-datatypes ((array!699 0))(
  ( (array!700 (arr!337 (Array (_ BitVec 32) ValueCell!175)) (size!399 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!699)

(declare-datatypes ((array!701 0))(
  ( (array!702 (arr!338 (Array (_ BitVec 32) (_ BitVec 64))) (size!400 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!701)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7848 (= res!7641 (and (= (size!399 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!400 _keys!1806) (size!399 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!7639 () Bool)

(assert (=> start!932 (=> (not res!7639) (not e!4424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!932 (= res!7639 (validMask!0 mask!2250))))

(assert (=> start!932 e!4424))

(assert (=> start!932 tp!1148))

(assert (=> start!932 true))

(declare-fun e!4423 () Bool)

(declare-fun array_inv!249 (array!699) Bool)

(assert (=> start!932 (and (array_inv!249 _values!1492) e!4423)))

(declare-fun tp_is_empty!383 () Bool)

(assert (=> start!932 tp_is_empty!383))

(declare-fun array_inv!250 (array!701) Bool)

(assert (=> start!932 (array_inv!250 _keys!1806)))

(declare-fun b!7849 () Bool)

(declare-fun res!7642 () Bool)

(assert (=> b!7849 (=> (not res!7642) (not e!4424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!701 (_ BitVec 32)) Bool)

(assert (=> b!7849 (= res!7642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!548 () Bool)

(declare-fun mapRes!548 () Bool)

(assert (=> mapIsEmpty!548 mapRes!548))

(declare-fun b!7850 () Bool)

(declare-fun e!4426 () Bool)

(assert (=> b!7850 (= e!4426 tp_is_empty!383)))

(declare-fun b!7851 () Bool)

(declare-fun e!4427 () Bool)

(assert (=> b!7851 (= e!4427 tp_is_empty!383)))

(declare-fun b!7852 () Bool)

(declare-fun res!7640 () Bool)

(assert (=> b!7852 (=> (not res!7640) (not e!4424))))

(declare-datatypes ((List!229 0))(
  ( (Nil!226) (Cons!225 (h!791 (_ BitVec 64)) (t!2366 List!229)) )
))
(declare-fun arrayNoDuplicates!0 (array!701 (_ BitVec 32) List!229) Bool)

(assert (=> b!7852 (= res!7640 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!226))))

(declare-fun mapNonEmpty!548 () Bool)

(declare-fun tp!1147 () Bool)

(assert (=> mapNonEmpty!548 (= mapRes!548 (and tp!1147 e!4427))))

(declare-fun mapKey!548 () (_ BitVec 32))

(declare-fun mapRest!548 () (Array (_ BitVec 32) ValueCell!175))

(declare-fun mapValue!548 () ValueCell!175)

(assert (=> mapNonEmpty!548 (= (arr!337 _values!1492) (store mapRest!548 mapKey!548 mapValue!548))))

(declare-fun b!7853 () Bool)

(assert (=> b!7853 (= e!4423 (and e!4426 mapRes!548))))

(declare-fun condMapEmpty!548 () Bool)

(declare-fun mapDefault!548 () ValueCell!175)

