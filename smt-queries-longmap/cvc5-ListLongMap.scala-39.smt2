; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!706 () Bool)

(assert start!706)

(declare-fun b_free!139 () Bool)

(declare-fun b_next!139 () Bool)

(assert (=> start!706 (= b_free!139 (not b_next!139))))

(declare-fun tp!641 () Bool)

(declare-fun b_and!281 () Bool)

(assert (=> start!706 (= tp!641 b_and!281)))

(declare-fun b!4751 () Bool)

(declare-fun res!5873 () Bool)

(declare-fun e!2533 () Bool)

(assert (=> b!4751 (=> (not res!5873) (not e!2533))))

(declare-datatypes ((array!367 0))(
  ( (array!368 (arr!174 (Array (_ BitVec 32) (_ BitVec 64))) (size!236 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!367)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!367 (_ BitVec 32)) Bool)

(assert (=> b!4751 (= res!5873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4752 () Bool)

(declare-fun res!5874 () Bool)

(assert (=> b!4752 (=> (not res!5874) (not e!2533))))

(declare-datatypes ((List!111 0))(
  ( (Nil!108) (Cons!107 (h!673 (_ BitVec 64)) (t!2242 List!111)) )
))
(declare-fun arrayNoDuplicates!0 (array!367 (_ BitVec 32) List!111) Bool)

(assert (=> b!4752 (= res!5874 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!108))))

(declare-fun b!4753 () Bool)

(declare-fun e!2535 () Bool)

(declare-fun tp_is_empty!217 () Bool)

(assert (=> b!4753 (= e!2535 tp_is_empty!217)))

(declare-fun mapIsEmpty!290 () Bool)

(declare-fun mapRes!290 () Bool)

(assert (=> mapIsEmpty!290 mapRes!290))

(declare-fun b!4754 () Bool)

(assert (=> b!4754 (= e!2533 (not true))))

(declare-fun e!2537 () Bool)

(assert (=> b!4754 e!2537))

(declare-fun c!281 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(assert (=> b!4754 (= c!281 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((Unit!49 0))(
  ( (Unit!50) )
))
(declare-fun lt!789 () Unit!49)

(declare-datatypes ((V!467 0))(
  ( (V!468 (val!114 Int)) )
))
(declare-datatypes ((ValueCell!92 0))(
  ( (ValueCellFull!92 (v!1203 V!467)) (EmptyCell!92) )
))
(declare-datatypes ((array!369 0))(
  ( (array!370 (arr!175 (Array (_ BitVec 32) ValueCell!92)) (size!237 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!369)

(declare-fun minValue!1434 () V!467)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!467)

(declare-fun lemmaKeyInListMapIsInArray!12 (array!367 array!369 (_ BitVec 32) (_ BitVec 32) V!467 V!467 (_ BitVec 64) Int) Unit!49)

(assert (=> b!4754 (= lt!789 (lemmaKeyInListMapIsInArray!12 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!4755 () Bool)

(declare-fun e!2532 () Bool)

(assert (=> b!4755 (= e!2532 tp_is_empty!217)))

(declare-fun b!4756 () Bool)

(assert (=> b!4756 (= e!2537 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4757 () Bool)

(declare-fun res!5875 () Bool)

(assert (=> b!4757 (=> (not res!5875) (not e!2533))))

(declare-datatypes ((tuple2!102 0))(
  ( (tuple2!103 (_1!51 (_ BitVec 64)) (_2!51 V!467)) )
))
(declare-datatypes ((List!112 0))(
  ( (Nil!109) (Cons!108 (h!674 tuple2!102) (t!2243 List!112)) )
))
(declare-datatypes ((ListLongMap!107 0))(
  ( (ListLongMap!108 (toList!69 List!112)) )
))
(declare-fun contains!41 (ListLongMap!107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!28 (array!367 array!369 (_ BitVec 32) (_ BitVec 32) V!467 V!467 (_ BitVec 32) Int) ListLongMap!107)

(assert (=> b!4757 (= res!5875 (contains!41 (getCurrentListMap!28 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun res!5878 () Bool)

(assert (=> start!706 (=> (not res!5878) (not e!2533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!706 (= res!5878 (validMask!0 mask!2250))))

(assert (=> start!706 e!2533))

(assert (=> start!706 tp!641))

(assert (=> start!706 true))

(declare-fun e!2536 () Bool)

(declare-fun array_inv!127 (array!369) Bool)

(assert (=> start!706 (and (array_inv!127 _values!1492) e!2536)))

(assert (=> start!706 tp_is_empty!217))

(declare-fun array_inv!128 (array!367) Bool)

(assert (=> start!706 (array_inv!128 _keys!1806)))

(declare-fun b!4758 () Bool)

(declare-fun arrayContainsKey!0 (array!367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4758 (= e!2537 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!4759 () Bool)

(declare-fun res!5877 () Bool)

(assert (=> b!4759 (=> (not res!5877) (not e!2533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4759 (= res!5877 (validKeyInArray!0 k!1278))))

(declare-fun b!4760 () Bool)

(declare-fun res!5876 () Bool)

(assert (=> b!4760 (=> (not res!5876) (not e!2533))))

(assert (=> b!4760 (= res!5876 (and (= (size!237 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!236 _keys!1806) (size!237 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4761 () Bool)

(assert (=> b!4761 (= e!2536 (and e!2535 mapRes!290))))

(declare-fun condMapEmpty!290 () Bool)

(declare-fun mapDefault!290 () ValueCell!92)

