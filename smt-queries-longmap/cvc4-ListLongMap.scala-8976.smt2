; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108606 () Bool)

(assert start!108606)

(declare-fun b_free!28133 () Bool)

(declare-fun b_next!28133 () Bool)

(assert (=> start!108606 (= b_free!28133 (not b_next!28133))))

(declare-fun tp!99512 () Bool)

(declare-fun b_and!46197 () Bool)

(assert (=> start!108606 (= tp!99512 b_and!46197)))

(declare-fun b!1282023 () Bool)

(declare-fun e!732485 () Bool)

(declare-fun tp_is_empty!33773 () Bool)

(assert (=> b!1282023 (= e!732485 tp_is_empty!33773)))

(declare-fun b!1282025 () Bool)

(declare-fun res!851599 () Bool)

(declare-fun e!732484 () Bool)

(assert (=> b!1282025 (=> (not res!851599) (not e!732484))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50133 0))(
  ( (V!50134 (val!16961 Int)) )
))
(declare-datatypes ((ValueCell!15988 0))(
  ( (ValueCellFull!15988 (v!19562 V!50133)) (EmptyCell!15988) )
))
(declare-datatypes ((array!84614 0))(
  ( (array!84615 (arr!40810 (Array (_ BitVec 32) ValueCell!15988)) (size!41360 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84614)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84616 0))(
  ( (array!84617 (arr!40811 (Array (_ BitVec 32) (_ BitVec 64))) (size!41361 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84616)

(assert (=> b!1282025 (= res!851599 (and (= (size!41360 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41361 _keys!1741) (size!41360 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282026 () Bool)

(declare-fun e!732488 () Bool)

(declare-fun e!732487 () Bool)

(declare-fun mapRes!52214 () Bool)

(assert (=> b!1282026 (= e!732488 (and e!732487 mapRes!52214))))

(declare-fun condMapEmpty!52214 () Bool)

(declare-fun mapDefault!52214 () ValueCell!15988)

