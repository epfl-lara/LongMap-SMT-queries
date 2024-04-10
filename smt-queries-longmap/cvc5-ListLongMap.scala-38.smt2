; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!680 () Bool)

(assert start!680)

(declare-fun b_free!133 () Bool)

(declare-fun b_next!133 () Bool)

(assert (=> start!680 (= b_free!133 (not b_next!133))))

(declare-fun tp!620 () Bool)

(declare-fun b_and!273 () Bool)

(assert (=> start!680 (= tp!620 b_and!273)))

(declare-fun b!4531 () Bool)

(declare-fun e!2400 () Bool)

(declare-fun tp_is_empty!211 () Bool)

(assert (=> b!4531 (= e!2400 tp_is_empty!211)))

(declare-fun res!5773 () Bool)

(declare-fun e!2399 () Bool)

(assert (=> start!680 (=> (not res!5773) (not e!2399))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!680 (= res!5773 (validMask!0 mask!2250))))

(assert (=> start!680 e!2399))

(assert (=> start!680 tp!620))

(assert (=> start!680 true))

(declare-datatypes ((V!459 0))(
  ( (V!460 (val!111 Int)) )
))
(declare-datatypes ((ValueCell!89 0))(
  ( (ValueCellFull!89 (v!1199 V!459)) (EmptyCell!89) )
))
(declare-datatypes ((array!355 0))(
  ( (array!356 (arr!169 (Array (_ BitVec 32) ValueCell!89)) (size!231 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!355)

(declare-fun e!2402 () Bool)

(declare-fun array_inv!123 (array!355) Bool)

(assert (=> start!680 (and (array_inv!123 _values!1492) e!2402)))

(assert (=> start!680 tp_is_empty!211))

(declare-datatypes ((array!357 0))(
  ( (array!358 (arr!170 (Array (_ BitVec 32) (_ BitVec 64))) (size!232 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!357)

(declare-fun array_inv!124 (array!357) Bool)

(assert (=> start!680 (array_inv!124 _keys!1806)))

(declare-fun b!4532 () Bool)

(declare-fun e!2397 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4532 (= e!2397 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4533 () Bool)

(declare-fun res!5770 () Bool)

(assert (=> b!4533 (=> (not res!5770) (not e!2399))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!459)

(declare-fun zeroValue!1434 () V!459)

(declare-datatypes ((tuple2!98 0))(
  ( (tuple2!99 (_1!49 (_ BitVec 64)) (_2!49 V!459)) )
))
(declare-datatypes ((List!107 0))(
  ( (Nil!104) (Cons!103 (h!669 tuple2!98) (t!2236 List!107)) )
))
(declare-datatypes ((ListLongMap!103 0))(
  ( (ListLongMap!104 (toList!67 List!107)) )
))
(declare-fun contains!38 (ListLongMap!103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!26 (array!357 array!355 (_ BitVec 32) (_ BitVec 32) V!459 V!459 (_ BitVec 32) Int) ListLongMap!103)

(assert (=> b!4533 (= res!5770 (contains!38 (getCurrentListMap!26 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4534 () Bool)

(assert (=> b!4534 (= e!2399 (not (or (bvsge #b00000000000000000000000000000000 (size!232 _keys!1806)) (bvslt (size!232 _keys!1806) #b01111111111111111111111111111111))))))

(assert (=> b!4534 e!2397))

(declare-fun c!242 () Bool)

(assert (=> b!4534 (= c!242 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!43 0))(
  ( (Unit!44) )
))
(declare-fun lt!690 () Unit!43)

(declare-fun lemmaKeyInListMapIsInArray!10 (array!357 array!355 (_ BitVec 32) (_ BitVec 32) V!459 V!459 (_ BitVec 64) Int) Unit!43)

(assert (=> b!4534 (= lt!690 (lemmaKeyInListMapIsInArray!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!4535 () Bool)

(declare-fun res!5768 () Bool)

(assert (=> b!4535 (=> (not res!5768) (not e!2399))))

(assert (=> b!4535 (= res!5768 (and (= (size!231 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!232 _keys!1806) (size!231 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4536 () Bool)

(declare-fun res!5771 () Bool)

(assert (=> b!4536 (=> (not res!5771) (not e!2399))))

(declare-datatypes ((List!108 0))(
  ( (Nil!105) (Cons!104 (h!670 (_ BitVec 64)) (t!2237 List!108)) )
))
(declare-fun arrayNoDuplicates!0 (array!357 (_ BitVec 32) List!108) Bool)

(assert (=> b!4536 (= res!5771 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!105))))

(declare-fun b!4537 () Bool)

(declare-fun arrayContainsKey!0 (array!357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4537 (= e!2397 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!4538 () Bool)

(declare-fun e!2401 () Bool)

(assert (=> b!4538 (= e!2401 tp_is_empty!211)))

(declare-fun mapIsEmpty!278 () Bool)

(declare-fun mapRes!278 () Bool)

(assert (=> mapIsEmpty!278 mapRes!278))

(declare-fun b!4539 () Bool)

(declare-fun res!5772 () Bool)

(assert (=> b!4539 (=> (not res!5772) (not e!2399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!357 (_ BitVec 32)) Bool)

(assert (=> b!4539 (= res!5772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!278 () Bool)

(declare-fun tp!619 () Bool)

(assert (=> mapNonEmpty!278 (= mapRes!278 (and tp!619 e!2400))))

(declare-fun mapKey!278 () (_ BitVec 32))

(declare-fun mapValue!278 () ValueCell!89)

(declare-fun mapRest!278 () (Array (_ BitVec 32) ValueCell!89))

(assert (=> mapNonEmpty!278 (= (arr!169 _values!1492) (store mapRest!278 mapKey!278 mapValue!278))))

(declare-fun b!4540 () Bool)

(assert (=> b!4540 (= e!2402 (and e!2401 mapRes!278))))

(declare-fun condMapEmpty!278 () Bool)

(declare-fun mapDefault!278 () ValueCell!89)

