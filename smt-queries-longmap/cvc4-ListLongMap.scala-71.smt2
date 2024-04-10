; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!962 () Bool)

(assert start!962)

(declare-fun b_free!335 () Bool)

(declare-fun b_next!335 () Bool)

(assert (=> start!962 (= b_free!335 (not b_next!335))))

(declare-fun tp!1238 () Bool)

(declare-fun b_and!483 () Bool)

(assert (=> start!962 (= tp!1238 b_and!483)))

(declare-fun b!8293 () Bool)

(declare-fun res!7901 () Bool)

(declare-fun e!4703 () Bool)

(assert (=> b!8293 (=> (not res!7901) (not e!4703))))

(declare-datatypes ((array!755 0))(
  ( (array!756 (arr!365 (Array (_ BitVec 32) (_ BitVec 64))) (size!427 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!755)

(declare-datatypes ((List!251 0))(
  ( (Nil!248) (Cons!247 (h!813 (_ BitVec 64)) (t!2388 List!251)) )
))
(declare-fun arrayNoDuplicates!0 (array!755 (_ BitVec 32) List!251) Bool)

(assert (=> b!8293 (= res!7901 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!248))))

(declare-fun b!8294 () Bool)

(declare-fun res!7902 () Bool)

(assert (=> b!8294 (=> (not res!7902) (not e!4703))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!727 0))(
  ( (V!728 (val!212 Int)) )
))
(declare-datatypes ((ValueCell!190 0))(
  ( (ValueCellFull!190 (v!1304 V!727)) (EmptyCell!190) )
))
(declare-datatypes ((array!757 0))(
  ( (array!758 (arr!366 (Array (_ BitVec 32) ValueCell!190)) (size!428 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!757)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8294 (= res!7902 (and (= (size!428 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!427 _keys!1806) (size!428 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8295 () Bool)

(declare-fun e!4700 () Bool)

(declare-fun tp_is_empty!413 () Bool)

(assert (=> b!8295 (= e!4700 tp_is_empty!413)))

(declare-fun b!8296 () Bool)

(declare-fun e!4701 () Bool)

(assert (=> b!8296 (= e!4701 (or (not (= (size!427 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsle #b00000000000000000000000000000000 (size!427 _keys!1806))))))

(declare-fun lt!1668 () (_ BitVec 32))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!755 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8296 (= lt!1668 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8297 () Bool)

(declare-fun e!4704 () Bool)

(declare-fun arrayContainsKey!0 (array!755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8297 (= e!4704 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun res!7898 () Bool)

(assert (=> start!962 (=> (not res!7898) (not e!4703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!962 (= res!7898 (validMask!0 mask!2250))))

(assert (=> start!962 e!4703))

(assert (=> start!962 tp!1238))

(assert (=> start!962 true))

(declare-fun e!4702 () Bool)

(declare-fun array_inv!271 (array!757) Bool)

(assert (=> start!962 (and (array_inv!271 _values!1492) e!4702)))

(assert (=> start!962 tp_is_empty!413))

(declare-fun array_inv!272 (array!755) Bool)

(assert (=> start!962 (array_inv!272 _keys!1806)))

(declare-fun b!8298 () Bool)

(assert (=> b!8298 (= e!4703 (not e!4701))))

(declare-fun res!7900 () Bool)

(assert (=> b!8298 (=> res!7900 e!4701)))

(assert (=> b!8298 (= res!7900 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8298 e!4704))

(declare-fun c!584 () Bool)

(assert (=> b!8298 (= c!584 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!727)

(declare-datatypes ((Unit!161 0))(
  ( (Unit!162) )
))
(declare-fun lt!1667 () Unit!161)

(declare-fun zeroValue!1434 () V!727)

(declare-fun lemmaKeyInListMapIsInArray!61 (array!755 array!757 (_ BitVec 32) (_ BitVec 32) V!727 V!727 (_ BitVec 64) Int) Unit!161)

(assert (=> b!8298 (= lt!1667 (lemmaKeyInListMapIsInArray!61 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!593 () Bool)

(declare-fun mapRes!593 () Bool)

(declare-fun tp!1237 () Bool)

(declare-fun e!4705 () Bool)

(assert (=> mapNonEmpty!593 (= mapRes!593 (and tp!1237 e!4705))))

(declare-fun mapValue!593 () ValueCell!190)

(declare-fun mapKey!593 () (_ BitVec 32))

(declare-fun mapRest!593 () (Array (_ BitVec 32) ValueCell!190))

(assert (=> mapNonEmpty!593 (= (arr!366 _values!1492) (store mapRest!593 mapKey!593 mapValue!593))))

(declare-fun b!8299 () Bool)

(declare-fun res!7897 () Bool)

(assert (=> b!8299 (=> (not res!7897) (not e!4703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8299 (= res!7897 (validKeyInArray!0 k!1278))))

(declare-fun b!8300 () Bool)

(declare-fun res!7903 () Bool)

(assert (=> b!8300 (=> (not res!7903) (not e!4703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!755 (_ BitVec 32)) Bool)

(assert (=> b!8300 (= res!7903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!593 () Bool)

(assert (=> mapIsEmpty!593 mapRes!593))

(declare-fun b!8301 () Bool)

(assert (=> b!8301 (= e!4705 tp_is_empty!413)))

(declare-fun b!8302 () Bool)

(declare-fun res!7899 () Bool)

(assert (=> b!8302 (=> (not res!7899) (not e!4703))))

(declare-datatypes ((tuple2!240 0))(
  ( (tuple2!241 (_1!120 (_ BitVec 64)) (_2!120 V!727)) )
))
(declare-datatypes ((List!252 0))(
  ( (Nil!249) (Cons!248 (h!814 tuple2!240) (t!2389 List!252)) )
))
(declare-datatypes ((ListLongMap!245 0))(
  ( (ListLongMap!246 (toList!138 List!252)) )
))
(declare-fun contains!113 (ListLongMap!245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!97 (array!755 array!757 (_ BitVec 32) (_ BitVec 32) V!727 V!727 (_ BitVec 32) Int) ListLongMap!245)

(assert (=> b!8302 (= res!7899 (contains!113 (getCurrentListMap!97 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8303 () Bool)

(assert (=> b!8303 (= e!4702 (and e!4700 mapRes!593))))

(declare-fun condMapEmpty!593 () Bool)

(declare-fun mapDefault!593 () ValueCell!190)

