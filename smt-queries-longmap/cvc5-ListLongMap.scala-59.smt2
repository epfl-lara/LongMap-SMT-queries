; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!886 () Bool)

(assert start!886)

(declare-fun b_free!259 () Bool)

(declare-fun b_next!259 () Bool)

(assert (=> start!886 (= b_free!259 (not b_next!259))))

(declare-fun tp!1009 () Bool)

(declare-fun b_and!407 () Bool)

(assert (=> start!886 (= tp!1009 b_and!407)))

(declare-fun b!7337 () Bool)

(declare-fun res!7351 () Bool)

(declare-fun e!4072 () Bool)

(assert (=> b!7337 (=> (not res!7351) (not e!4072))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!7337 (= res!7351 (validKeyInArray!0 k!1278))))

(declare-fun b!7338 () Bool)

(declare-fun res!7352 () Bool)

(assert (=> b!7338 (=> (not res!7352) (not e!4072))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!627 0))(
  ( (V!628 (val!174 Int)) )
))
(declare-datatypes ((ValueCell!152 0))(
  ( (ValueCellFull!152 (v!1266 V!627)) (EmptyCell!152) )
))
(declare-datatypes ((array!607 0))(
  ( (array!608 (arr!291 (Array (_ BitVec 32) ValueCell!152)) (size!353 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!607)

(declare-fun minValue!1434 () V!627)

(declare-datatypes ((array!609 0))(
  ( (array!610 (arr!292 (Array (_ BitVec 32) (_ BitVec 64))) (size!354 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!609)

(declare-fun zeroValue!1434 () V!627)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((tuple2!186 0))(
  ( (tuple2!187 (_1!93 (_ BitVec 64)) (_2!93 V!627)) )
))
(declare-datatypes ((List!196 0))(
  ( (Nil!193) (Cons!192 (h!758 tuple2!186) (t!2333 List!196)) )
))
(declare-datatypes ((ListLongMap!191 0))(
  ( (ListLongMap!192 (toList!111 List!196)) )
))
(declare-fun contains!86 (ListLongMap!191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!70 (array!609 array!607 (_ BitVec 32) (_ BitVec 32) V!627 V!627 (_ BitVec 32) Int) ListLongMap!191)

(assert (=> b!7338 (= res!7352 (contains!86 (getCurrentListMap!70 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun mapIsEmpty!479 () Bool)

(declare-fun mapRes!479 () Bool)

(assert (=> mapIsEmpty!479 mapRes!479))

(declare-fun b!7339 () Bool)

(declare-fun res!7353 () Bool)

(assert (=> b!7339 (=> (not res!7353) (not e!4072))))

(assert (=> b!7339 (= res!7353 (and (= (size!353 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!354 _keys!1806) (size!353 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!7349 () Bool)

(assert (=> start!886 (=> (not res!7349) (not e!4072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!886 (= res!7349 (validMask!0 mask!2250))))

(assert (=> start!886 e!4072))

(assert (=> start!886 tp!1009))

(assert (=> start!886 true))

(declare-fun e!4071 () Bool)

(declare-fun array_inv!215 (array!607) Bool)

(assert (=> start!886 (and (array_inv!215 _values!1492) e!4071)))

(declare-fun tp_is_empty!337 () Bool)

(assert (=> start!886 tp_is_empty!337))

(declare-fun array_inv!216 (array!609) Bool)

(assert (=> start!886 (array_inv!216 _keys!1806)))

(declare-fun b!7340 () Bool)

(declare-fun res!7354 () Bool)

(assert (=> b!7340 (=> (not res!7354) (not e!4072))))

(declare-datatypes ((List!197 0))(
  ( (Nil!194) (Cons!193 (h!759 (_ BitVec 64)) (t!2334 List!197)) )
))
(declare-fun arrayNoDuplicates!0 (array!609 (_ BitVec 32) List!197) Bool)

(assert (=> b!7340 (= res!7354 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!194))))

(declare-fun mapNonEmpty!479 () Bool)

(declare-fun tp!1010 () Bool)

(declare-fun e!4075 () Bool)

(assert (=> mapNonEmpty!479 (= mapRes!479 (and tp!1010 e!4075))))

(declare-fun mapRest!479 () (Array (_ BitVec 32) ValueCell!152))

(declare-fun mapKey!479 () (_ BitVec 32))

(declare-fun mapValue!479 () ValueCell!152)

(assert (=> mapNonEmpty!479 (= (arr!291 _values!1492) (store mapRest!479 mapKey!479 mapValue!479))))

(declare-fun b!7341 () Bool)

(declare-fun res!7350 () Bool)

(assert (=> b!7341 (=> (not res!7350) (not e!4072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!609 (_ BitVec 32)) Bool)

(assert (=> b!7341 (= res!7350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7342 () Bool)

(assert (=> b!7342 (= e!4075 tp_is_empty!337)))

(declare-fun b!7343 () Bool)

(declare-fun e!4073 () Bool)

(declare-fun arrayContainsKey!0 (array!609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7343 (= e!4073 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!7344 () Bool)

(assert (=> b!7344 (= e!4073 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!7345 () Bool)

(declare-fun e!4076 () Bool)

(assert (=> b!7345 (= e!4076 tp_is_empty!337)))

(declare-fun b!7346 () Bool)

(assert (=> b!7346 (= e!4072 (not true))))

(assert (=> b!7346 e!4073))

(declare-fun c!551 () Bool)

(assert (=> b!7346 (= c!551 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!143 0))(
  ( (Unit!144) )
))
(declare-fun lt!1527 () Unit!143)

(declare-fun lemmaKeyInListMapIsInArray!52 (array!609 array!607 (_ BitVec 32) (_ BitVec 32) V!627 V!627 (_ BitVec 64) Int) Unit!143)

(assert (=> b!7346 (= lt!1527 (lemmaKeyInListMapIsInArray!52 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!7347 () Bool)

(assert (=> b!7347 (= e!4071 (and e!4076 mapRes!479))))

(declare-fun condMapEmpty!479 () Bool)

(declare-fun mapDefault!479 () ValueCell!152)

