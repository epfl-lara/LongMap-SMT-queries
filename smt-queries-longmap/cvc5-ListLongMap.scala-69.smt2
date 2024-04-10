; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!946 () Bool)

(assert start!946)

(declare-fun b_free!319 () Bool)

(declare-fun b_next!319 () Bool)

(assert (=> start!946 (= b_free!319 (not b_next!319))))

(declare-fun tp!1190 () Bool)

(declare-fun b_and!467 () Bool)

(assert (=> start!946 (= tp!1190 b_and!467)))

(declare-fun res!7735 () Bool)

(declare-fun e!4535 () Bool)

(assert (=> start!946 (=> (not res!7735) (not e!4535))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!946 (= res!7735 (validMask!0 mask!2250))))

(assert (=> start!946 e!4535))

(assert (=> start!946 tp!1190))

(assert (=> start!946 true))

(declare-datatypes ((V!707 0))(
  ( (V!708 (val!204 Int)) )
))
(declare-datatypes ((ValueCell!182 0))(
  ( (ValueCellFull!182 (v!1296 V!707)) (EmptyCell!182) )
))
(declare-datatypes ((array!725 0))(
  ( (array!726 (arr!350 (Array (_ BitVec 32) ValueCell!182)) (size!412 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!725)

(declare-fun e!4534 () Bool)

(declare-fun array_inv!257 (array!725) Bool)

(assert (=> start!946 (and (array_inv!257 _values!1492) e!4534)))

(declare-fun tp_is_empty!397 () Bool)

(assert (=> start!946 tp_is_empty!397))

(declare-datatypes ((array!727 0))(
  ( (array!728 (arr!351 (Array (_ BitVec 32) (_ BitVec 64))) (size!413 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!727)

(declare-fun array_inv!258 (array!727) Bool)

(assert (=> start!946 (array_inv!258 _keys!1806)))

(declare-fun b!8005 () Bool)

(declare-fun e!4536 () Bool)

(assert (=> b!8005 (= e!4536 tp_is_empty!397)))

(declare-fun b!8006 () Bool)

(declare-fun res!7734 () Bool)

(assert (=> b!8006 (=> (not res!7734) (not e!4535))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!707)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!707)

(declare-datatypes ((tuple2!226 0))(
  ( (tuple2!227 (_1!113 (_ BitVec 64)) (_2!113 V!707)) )
))
(declare-datatypes ((List!238 0))(
  ( (Nil!235) (Cons!234 (h!800 tuple2!226) (t!2375 List!238)) )
))
(declare-datatypes ((ListLongMap!231 0))(
  ( (ListLongMap!232 (toList!131 List!238)) )
))
(declare-fun contains!106 (ListLongMap!231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!90 (array!727 array!725 (_ BitVec 32) (_ BitVec 32) V!707 V!707 (_ BitVec 32) Int) ListLongMap!231)

(assert (=> b!8006 (= res!7734 (contains!106 (getCurrentListMap!90 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8007 () Bool)

(declare-fun e!4532 () Bool)

(assert (=> b!8007 (= e!4532 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8008 () Bool)

(declare-fun e!4533 () Bool)

(declare-fun mapRes!569 () Bool)

(assert (=> b!8008 (= e!4534 (and e!4533 mapRes!569))))

(declare-fun condMapEmpty!569 () Bool)

(declare-fun mapDefault!569 () ValueCell!182)

