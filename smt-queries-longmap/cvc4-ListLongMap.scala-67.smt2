; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!938 () Bool)

(assert start!938)

(declare-fun b_free!311 () Bool)

(declare-fun b_next!311 () Bool)

(assert (=> start!938 (= b_free!311 (not b_next!311))))

(declare-fun tp!1166 () Bool)

(declare-fun b_and!459 () Bool)

(assert (=> start!938 (= tp!1166 b_and!459)))

(declare-fun b!7911 () Bool)

(declare-fun res!7678 () Bool)

(declare-fun e!4472 () Bool)

(assert (=> b!7911 (=> (not res!7678) (not e!4472))))

(declare-datatypes ((array!709 0))(
  ( (array!710 (arr!342 (Array (_ BitVec 32) (_ BitVec 64))) (size!404 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!709)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!709 (_ BitVec 32)) Bool)

(assert (=> b!7911 (= res!7678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7912 () Bool)

(declare-fun res!7676 () Bool)

(assert (=> b!7912 (=> (not res!7676) (not e!4472))))

(declare-datatypes ((List!232 0))(
  ( (Nil!229) (Cons!228 (h!794 (_ BitVec 64)) (t!2369 List!232)) )
))
(declare-fun arrayNoDuplicates!0 (array!709 (_ BitVec 32) List!232) Bool)

(assert (=> b!7912 (= res!7676 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!229))))

(declare-fun b!7913 () Bool)

(assert (=> b!7913 (= e!4472 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1605 () Bool)

(declare-datatypes ((V!695 0))(
  ( (V!696 (val!200 Int)) )
))
(declare-datatypes ((ValueCell!178 0))(
  ( (ValueCellFull!178 (v!1292 V!695)) (EmptyCell!178) )
))
(declare-datatypes ((array!711 0))(
  ( (array!712 (arr!343 (Array (_ BitVec 32) ValueCell!178)) (size!405 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!711)

(declare-fun minValue!1434 () V!695)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!695)

(declare-datatypes ((tuple2!222 0))(
  ( (tuple2!223 (_1!111 (_ BitVec 64)) (_2!111 V!695)) )
))
(declare-datatypes ((List!233 0))(
  ( (Nil!230) (Cons!229 (h!795 tuple2!222) (t!2370 List!233)) )
))
(declare-datatypes ((ListLongMap!227 0))(
  ( (ListLongMap!228 (toList!129 List!233)) )
))
(declare-fun contains!104 (ListLongMap!227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!88 (array!709 array!711 (_ BitVec 32) (_ BitVec 32) V!695 V!695 (_ BitVec 32) Int) ListLongMap!227)

(assert (=> b!7913 (= lt!1605 (contains!104 (getCurrentListMap!88 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun mapIsEmpty!557 () Bool)

(declare-fun mapRes!557 () Bool)

(assert (=> mapIsEmpty!557 mapRes!557))

(declare-fun b!7914 () Bool)

(declare-fun res!7675 () Bool)

(assert (=> b!7914 (=> (not res!7675) (not e!4472))))

(assert (=> b!7914 (= res!7675 (and (= (size!405 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!404 _keys!1806) (size!405 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7915 () Bool)

(declare-fun e!4469 () Bool)

(declare-fun tp_is_empty!389 () Bool)

(assert (=> b!7915 (= e!4469 tp_is_empty!389)))

(declare-fun b!7916 () Bool)

(declare-fun e!4471 () Bool)

(declare-fun e!4468 () Bool)

(assert (=> b!7916 (= e!4471 (and e!4468 mapRes!557))))

(declare-fun condMapEmpty!557 () Bool)

(declare-fun mapDefault!557 () ValueCell!178)

