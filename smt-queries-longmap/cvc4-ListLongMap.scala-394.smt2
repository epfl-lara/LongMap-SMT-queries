; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7408 () Bool)

(assert start!7408)

(declare-fun b!47560 () Bool)

(declare-fun e!30478 () Bool)

(declare-fun tp_is_empty!2045 () Bool)

(assert (=> b!47560 (= e!30478 tp_is_empty!2045)))

(declare-fun res!27665 () Bool)

(declare-fun e!30476 () Bool)

(assert (=> start!7408 (=> (not res!27665) (not e!30476))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7408 (= res!27665 (validMask!0 mask!2458))))

(assert (=> start!7408 e!30476))

(assert (=> start!7408 true))

(declare-datatypes ((V!2459 0))(
  ( (V!2460 (val!1061 Int)) )
))
(declare-datatypes ((ValueCell!733 0))(
  ( (ValueCellFull!733 (v!2122 V!2459)) (EmptyCell!733) )
))
(declare-datatypes ((array!3153 0))(
  ( (array!3154 (arr!1511 (Array (_ BitVec 32) ValueCell!733)) (size!1733 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3153)

(declare-fun e!30477 () Bool)

(declare-fun array_inv!910 (array!3153) Bool)

(assert (=> start!7408 (and (array_inv!910 _values!1550) e!30477)))

(declare-datatypes ((array!3155 0))(
  ( (array!3156 (arr!1512 (Array (_ BitVec 32) (_ BitVec 64))) (size!1734 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3155)

(declare-fun array_inv!911 (array!3155) Bool)

(assert (=> start!7408 (array_inv!911 _keys!1940)))

(declare-fun mapIsEmpty!2111 () Bool)

(declare-fun mapRes!2111 () Bool)

(assert (=> mapIsEmpty!2111 mapRes!2111))

(declare-fun b!47561 () Bool)

(assert (=> b!47561 (= e!30476 false)))

(declare-fun lt!20438 () Bool)

(declare-datatypes ((List!1263 0))(
  ( (Nil!1260) (Cons!1259 (h!1839 (_ BitVec 64)) (t!4291 List!1263)) )
))
(declare-fun arrayNoDuplicates!0 (array!3155 (_ BitVec 32) List!1263) Bool)

(assert (=> b!47561 (= lt!20438 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1260))))

(declare-fun b!47562 () Bool)

(declare-fun res!27663 () Bool)

(assert (=> b!47562 (=> (not res!27663) (not e!30476))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47562 (= res!27663 (and (= (size!1733 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1734 _keys!1940) (size!1733 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47563 () Bool)

(declare-fun e!30475 () Bool)

(assert (=> b!47563 (= e!30475 tp_is_empty!2045)))

(declare-fun mapNonEmpty!2111 () Bool)

(declare-fun tp!6260 () Bool)

(assert (=> mapNonEmpty!2111 (= mapRes!2111 (and tp!6260 e!30478))))

(declare-fun mapValue!2111 () ValueCell!733)

(declare-fun mapRest!2111 () (Array (_ BitVec 32) ValueCell!733))

(declare-fun mapKey!2111 () (_ BitVec 32))

(assert (=> mapNonEmpty!2111 (= (arr!1511 _values!1550) (store mapRest!2111 mapKey!2111 mapValue!2111))))

(declare-fun b!47564 () Bool)

(declare-fun res!27664 () Bool)

(assert (=> b!47564 (=> (not res!27664) (not e!30476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3155 (_ BitVec 32)) Bool)

(assert (=> b!47564 (= res!27664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47565 () Bool)

(assert (=> b!47565 (= e!30477 (and e!30475 mapRes!2111))))

(declare-fun condMapEmpty!2111 () Bool)

(declare-fun mapDefault!2111 () ValueCell!733)

