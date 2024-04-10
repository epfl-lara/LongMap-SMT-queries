; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!928 () Bool)

(assert start!928)

(declare-fun b_free!301 () Bool)

(declare-fun b_next!301 () Bool)

(assert (=> start!928 (= b_free!301 (not b_next!301))))

(declare-fun tp!1136 () Bool)

(declare-fun b_and!449 () Bool)

(assert (=> start!928 (= tp!1136 b_and!449)))

(declare-fun b!7806 () Bool)

(declare-fun e!4397 () Bool)

(assert (=> b!7806 (= e!4397 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!683 0))(
  ( (V!684 (val!195 Int)) )
))
(declare-datatypes ((ValueCell!173 0))(
  ( (ValueCellFull!173 (v!1287 V!683)) (EmptyCell!173) )
))
(declare-datatypes ((array!691 0))(
  ( (array!692 (arr!333 (Array (_ BitVec 32) ValueCell!173)) (size!395 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!691)

(declare-fun minValue!1434 () V!683)

(declare-datatypes ((array!693 0))(
  ( (array!694 (arr!334 (Array (_ BitVec 32) (_ BitVec 64))) (size!396 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!693)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!683)

(declare-fun lt!1590 () Bool)

(declare-datatypes ((tuple2!216 0))(
  ( (tuple2!217 (_1!108 (_ BitVec 64)) (_2!108 V!683)) )
))
(declare-datatypes ((List!226 0))(
  ( (Nil!223) (Cons!222 (h!788 tuple2!216) (t!2363 List!226)) )
))
(declare-datatypes ((ListLongMap!221 0))(
  ( (ListLongMap!222 (toList!126 List!226)) )
))
(declare-fun contains!101 (ListLongMap!221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!85 (array!693 array!691 (_ BitVec 32) (_ BitVec 32) V!683 V!683 (_ BitVec 32) Int) ListLongMap!221)

(assert (=> b!7806 (= lt!1590 (contains!101 (getCurrentListMap!85 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun mapIsEmpty!542 () Bool)

(declare-fun mapRes!542 () Bool)

(assert (=> mapIsEmpty!542 mapRes!542))

(declare-fun mapNonEmpty!542 () Bool)

(declare-fun tp!1135 () Bool)

(declare-fun e!4394 () Bool)

(assert (=> mapNonEmpty!542 (= mapRes!542 (and tp!1135 e!4394))))

(declare-fun mapKey!542 () (_ BitVec 32))

(declare-fun mapValue!542 () ValueCell!173)

(declare-fun mapRest!542 () (Array (_ BitVec 32) ValueCell!173))

(assert (=> mapNonEmpty!542 (= (arr!333 _values!1492) (store mapRest!542 mapKey!542 mapValue!542))))

(declare-fun b!7807 () Bool)

(declare-fun e!4393 () Bool)

(declare-fun e!4395 () Bool)

(assert (=> b!7807 (= e!4393 (and e!4395 mapRes!542))))

(declare-fun condMapEmpty!542 () Bool)

(declare-fun mapDefault!542 () ValueCell!173)

