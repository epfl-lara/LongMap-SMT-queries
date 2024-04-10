; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83118 () Bool)

(assert start!83118)

(declare-fun b_free!19111 () Bool)

(declare-fun b_next!19111 () Bool)

(assert (=> start!83118 (= b_free!19111 (not b_next!19111))))

(declare-fun tp!66611 () Bool)

(declare-fun b_and!30599 () Bool)

(assert (=> start!83118 (= tp!66611 b_and!30599)))

(declare-fun mapIsEmpty!35023 () Bool)

(declare-fun mapRes!35023 () Bool)

(assert (=> mapIsEmpty!35023 mapRes!35023))

(declare-fun b!969593 () Bool)

(declare-fun res!648966 () Bool)

(declare-fun e!546631 () Bool)

(assert (=> b!969593 (=> (not res!648966) (not e!546631))))

(declare-datatypes ((array!60083 0))(
  ( (array!60084 (arr!28905 (Array (_ BitVec 32) (_ BitVec 64))) (size!29384 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60083)

(declare-datatypes ((List!20032 0))(
  ( (Nil!20029) (Cons!20028 (h!21190 (_ BitVec 64)) (t!28395 List!20032)) )
))
(declare-fun arrayNoDuplicates!0 (array!60083 (_ BitVec 32) List!20032) Bool)

(assert (=> b!969593 (= res!648966 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20029))))

(declare-fun b!969594 () Bool)

(declare-fun res!648963 () Bool)

(assert (=> b!969594 (=> (not res!648963) (not e!546631))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969594 (= res!648963 (validKeyInArray!0 (select (arr!28905 _keys!1717) i!822)))))

(declare-fun b!969595 () Bool)

(declare-fun res!648965 () Bool)

(assert (=> b!969595 (=> (not res!648965) (not e!546631))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34329 0))(
  ( (V!34330 (val!11055 Int)) )
))
(declare-datatypes ((ValueCell!10523 0))(
  ( (ValueCellFull!10523 (v!13614 V!34329)) (EmptyCell!10523) )
))
(declare-datatypes ((array!60085 0))(
  ( (array!60086 (arr!28906 (Array (_ BitVec 32) ValueCell!10523)) (size!29385 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60085)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969595 (= res!648965 (and (= (size!29385 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29384 _keys!1717) (size!29385 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969596 () Bool)

(declare-fun e!546633 () Bool)

(declare-fun tp_is_empty!22009 () Bool)

(assert (=> b!969596 (= e!546633 tp_is_empty!22009)))

(declare-fun mapNonEmpty!35023 () Bool)

(declare-fun tp!66612 () Bool)

(declare-fun e!546632 () Bool)

(assert (=> mapNonEmpty!35023 (= mapRes!35023 (and tp!66612 e!546632))))

(declare-fun mapValue!35023 () ValueCell!10523)

(declare-fun mapRest!35023 () (Array (_ BitVec 32) ValueCell!10523))

(declare-fun mapKey!35023 () (_ BitVec 32))

(assert (=> mapNonEmpty!35023 (= (arr!28906 _values!1425) (store mapRest!35023 mapKey!35023 mapValue!35023))))

(declare-fun b!969597 () Bool)

(declare-fun e!546634 () Bool)

(assert (=> b!969597 (= e!546634 (and e!546633 mapRes!35023))))

(declare-fun condMapEmpty!35023 () Bool)

(declare-fun mapDefault!35023 () ValueCell!10523)

