; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!950 () Bool)

(assert start!950)

(declare-fun b_free!323 () Bool)

(declare-fun b_next!323 () Bool)

(assert (=> start!950 (= b_free!323 (not b_next!323))))

(declare-fun tp!1201 () Bool)

(declare-fun b_and!471 () Bool)

(assert (=> start!950 (= tp!1201 b_and!471)))

(declare-fun mapNonEmpty!575 () Bool)

(declare-fun mapRes!575 () Bool)

(declare-fun tp!1202 () Bool)

(declare-fun e!4574 () Bool)

(assert (=> mapNonEmpty!575 (= mapRes!575 (and tp!1202 e!4574))))

(declare-datatypes ((V!711 0))(
  ( (V!712 (val!206 Int)) )
))
(declare-datatypes ((ValueCell!184 0))(
  ( (ValueCellFull!184 (v!1298 V!711)) (EmptyCell!184) )
))
(declare-fun mapValue!575 () ValueCell!184)

(declare-fun mapRest!575 () (Array (_ BitVec 32) ValueCell!184))

(declare-fun mapKey!575 () (_ BitVec 32))

(declare-datatypes ((array!733 0))(
  ( (array!734 (arr!354 (Array (_ BitVec 32) ValueCell!184)) (size!416 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!733)

(assert (=> mapNonEmpty!575 (= (arr!354 _values!1492) (store mapRest!575 mapKey!575 mapValue!575))))

(declare-fun res!7776 () Bool)

(declare-fun e!4579 () Bool)

(assert (=> start!950 (=> (not res!7776) (not e!4579))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!950 (= res!7776 (validMask!0 mask!2250))))

(assert (=> start!950 e!4579))

(assert (=> start!950 tp!1201))

(assert (=> start!950 true))

(declare-fun e!4578 () Bool)

(declare-fun array_inv!261 (array!733) Bool)

(assert (=> start!950 (and (array_inv!261 _values!1492) e!4578)))

(declare-fun tp_is_empty!401 () Bool)

(assert (=> start!950 tp_is_empty!401))

(declare-datatypes ((array!735 0))(
  ( (array!736 (arr!355 (Array (_ BitVec 32) (_ BitVec 64))) (size!417 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!735)

(declare-fun array_inv!262 (array!735) Bool)

(assert (=> start!950 (array_inv!262 _keys!1806)))

(declare-fun b!8077 () Bool)

(declare-fun res!7771 () Bool)

(assert (=> b!8077 (=> (not res!7771) (not e!4579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!735 (_ BitVec 32)) Bool)

(assert (=> b!8077 (= res!7771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8078 () Bool)

(declare-fun res!7774 () Bool)

(assert (=> b!8078 (=> (not res!7774) (not e!4579))))

(declare-datatypes ((List!241 0))(
  ( (Nil!238) (Cons!237 (h!803 (_ BitVec 64)) (t!2378 List!241)) )
))
(declare-fun arrayNoDuplicates!0 (array!735 (_ BitVec 32) List!241) Bool)

(assert (=> b!8078 (= res!7774 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!238))))

(declare-fun b!8079 () Bool)

(declare-fun res!7773 () Bool)

(assert (=> b!8079 (=> (not res!7773) (not e!4579))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8079 (= res!7773 (and (= (size!416 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!417 _keys!1806) (size!416 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!575 () Bool)

(assert (=> mapIsEmpty!575 mapRes!575))

(declare-fun b!8080 () Bool)

(declare-fun e!4575 () Bool)

(assert (=> b!8080 (= e!4579 (not e!4575))))

(declare-fun res!7772 () Bool)

(assert (=> b!8080 (=> res!7772 e!4575)))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8080 (= res!7772 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!4580 () Bool)

(assert (=> b!8080 e!4580))

(declare-fun c!566 () Bool)

(assert (=> b!8080 (= c!566 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!711)

(declare-fun zeroValue!1434 () V!711)

(declare-datatypes ((Unit!151 0))(
  ( (Unit!152) )
))
(declare-fun lt!1632 () Unit!151)

(declare-fun lemmaKeyInListMapIsInArray!56 (array!735 array!733 (_ BitVec 32) (_ BitVec 32) V!711 V!711 (_ BitVec 64) Int) Unit!151)

(assert (=> b!8080 (= lt!1632 (lemmaKeyInListMapIsInArray!56 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!8081 () Bool)

(declare-fun res!7775 () Bool)

(assert (=> b!8081 (=> (not res!7775) (not e!4579))))

(declare-datatypes ((tuple2!230 0))(
  ( (tuple2!231 (_1!115 (_ BitVec 64)) (_2!115 V!711)) )
))
(declare-datatypes ((List!242 0))(
  ( (Nil!239) (Cons!238 (h!804 tuple2!230) (t!2379 List!242)) )
))
(declare-datatypes ((ListLongMap!235 0))(
  ( (ListLongMap!236 (toList!133 List!242)) )
))
(declare-fun contains!108 (ListLongMap!235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!92 (array!735 array!733 (_ BitVec 32) (_ BitVec 32) V!711 V!711 (_ BitVec 32) Int) ListLongMap!235)

(assert (=> b!8081 (= res!7775 (contains!108 (getCurrentListMap!92 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8082 () Bool)

(declare-fun e!4576 () Bool)

(assert (=> b!8082 (= e!4576 tp_is_empty!401)))

(declare-fun b!8083 () Bool)

(declare-fun res!7777 () Bool)

(assert (=> b!8083 (=> (not res!7777) (not e!4579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8083 (= res!7777 (validKeyInArray!0 k!1278))))

(declare-fun b!8084 () Bool)

(assert (=> b!8084 (= e!4574 tp_is_empty!401)))

(declare-fun b!8085 () Bool)

(assert (=> b!8085 (= e!4575 true)))

(declare-fun lt!1631 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!735 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8085 (= lt!1631 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8086 () Bool)

(assert (=> b!8086 (= e!4580 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8087 () Bool)

(assert (=> b!8087 (= e!4578 (and e!4576 mapRes!575))))

(declare-fun condMapEmpty!575 () Bool)

(declare-fun mapDefault!575 () ValueCell!184)

