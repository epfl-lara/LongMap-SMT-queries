; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!810 () Bool)

(assert start!810)

(declare-fun b_free!203 () Bool)

(declare-fun b_next!203 () Bool)

(assert (=> start!810 (= b_free!203 (not b_next!203))))

(declare-fun tp!839 () Bool)

(declare-fun b_and!349 () Bool)

(assert (=> start!810 (= tp!839 b_and!349)))

(declare-fun b!6120 () Bool)

(declare-fun e!3345 () Bool)

(declare-fun tp_is_empty!281 () Bool)

(assert (=> b!6120 (= e!3345 tp_is_empty!281)))

(declare-fun b!6121 () Bool)

(declare-fun res!6627 () Bool)

(declare-fun e!3344 () Bool)

(assert (=> b!6121 (=> (not res!6627) (not e!3344))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6121 (= res!6627 (validKeyInArray!0 k!1278))))

(declare-fun b!6122 () Bool)

(declare-fun e!3347 () Bool)

(assert (=> b!6122 (= e!3347 true)))

(declare-fun lt!1109 () (_ BitVec 32))

(declare-datatypes ((array!495 0))(
  ( (array!496 (arr!236 (Array (_ BitVec 32) (_ BitVec 64))) (size!298 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!495)

(declare-fun arrayScanForKey!0 (array!495 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6122 (= lt!1109 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!392 () Bool)

(declare-fun mapRes!392 () Bool)

(declare-fun tp!838 () Bool)

(declare-fun e!3341 () Bool)

(assert (=> mapNonEmpty!392 (= mapRes!392 (and tp!838 e!3341))))

(declare-datatypes ((V!551 0))(
  ( (V!552 (val!146 Int)) )
))
(declare-datatypes ((ValueCell!124 0))(
  ( (ValueCellFull!124 (v!1237 V!551)) (EmptyCell!124) )
))
(declare-fun mapValue!392 () ValueCell!124)

(declare-datatypes ((array!497 0))(
  ( (array!498 (arr!237 (Array (_ BitVec 32) ValueCell!124)) (size!299 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!497)

(declare-fun mapRest!392 () (Array (_ BitVec 32) ValueCell!124))

(declare-fun mapKey!392 () (_ BitVec 32))

(assert (=> mapNonEmpty!392 (= (arr!237 _values!1492) (store mapRest!392 mapKey!392 mapValue!392))))

(declare-fun b!6123 () Bool)

(declare-fun res!6626 () Bool)

(assert (=> b!6123 (=> (not res!6626) (not e!3344))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!551)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!551)

(declare-datatypes ((tuple2!148 0))(
  ( (tuple2!149 (_1!74 (_ BitVec 64)) (_2!74 V!551)) )
))
(declare-datatypes ((List!158 0))(
  ( (Nil!155) (Cons!154 (h!720 tuple2!148) (t!2293 List!158)) )
))
(declare-datatypes ((ListLongMap!153 0))(
  ( (ListLongMap!154 (toList!92 List!158)) )
))
(declare-fun contains!66 (ListLongMap!153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!51 (array!495 array!497 (_ BitVec 32) (_ BitVec 32) V!551 V!551 (_ BitVec 32) Int) ListLongMap!153)

(assert (=> b!6123 (= res!6626 (contains!66 (getCurrentListMap!51 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6124 () Bool)

(declare-fun e!3343 () Bool)

(assert (=> b!6124 (= e!3343 (and e!3345 mapRes!392))))

(declare-fun condMapEmpty!392 () Bool)

(declare-fun mapDefault!392 () ValueCell!124)

