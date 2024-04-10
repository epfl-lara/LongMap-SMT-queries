; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95720 () Bool)

(assert start!95720)

(declare-fun b_free!22373 () Bool)

(declare-fun b_next!22373 () Bool)

(assert (=> start!95720 (= b_free!22373 (not b_next!22373))))

(declare-fun tp!78967 () Bool)

(declare-fun b_and!35421 () Bool)

(assert (=> start!95720 (= tp!78967 b_and!35421)))

(declare-fun b!1082299 () Bool)

(declare-fun e!618539 () Bool)

(declare-fun tp_is_empty!26375 () Bool)

(assert (=> b!1082299 (= e!618539 tp_is_empty!26375)))

(declare-fun b!1082300 () Bool)

(declare-fun res!721438 () Bool)

(declare-fun e!618536 () Bool)

(assert (=> b!1082300 (=> (not res!721438) (not e!618536))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69697 0))(
  ( (array!69698 (arr!33522 (Array (_ BitVec 32) (_ BitVec 64))) (size!34058 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69697)

(declare-datatypes ((V!40293 0))(
  ( (V!40294 (val!13244 Int)) )
))
(declare-datatypes ((ValueCell!12478 0))(
  ( (ValueCellFull!12478 (v!15865 V!40293)) (EmptyCell!12478) )
))
(declare-datatypes ((array!69699 0))(
  ( (array!69700 (arr!33523 (Array (_ BitVec 32) ValueCell!12478)) (size!34059 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69699)

(assert (=> b!1082300 (= res!721438 (and (= (size!34059 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34058 _keys!1070) (size!34059 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082301 () Bool)

(declare-fun res!721433 () Bool)

(assert (=> b!1082301 (=> (not res!721433) (not e!618536))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082301 (= res!721433 (= (select (arr!33522 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41317 () Bool)

(declare-fun mapRes!41317 () Bool)

(assert (=> mapIsEmpty!41317 mapRes!41317))

(declare-fun res!721440 () Bool)

(assert (=> start!95720 (=> (not res!721440) (not e!618536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95720 (= res!721440 (validMask!0 mask!1414))))

(assert (=> start!95720 e!618536))

(assert (=> start!95720 tp!78967))

(assert (=> start!95720 true))

(assert (=> start!95720 tp_is_empty!26375))

(declare-fun array_inv!25878 (array!69697) Bool)

(assert (=> start!95720 (array_inv!25878 _keys!1070)))

(declare-fun e!618535 () Bool)

(declare-fun array_inv!25879 (array!69699) Bool)

(assert (=> start!95720 (and (array_inv!25879 _values!874) e!618535)))

(declare-fun b!1082302 () Bool)

(declare-fun res!721439 () Bool)

(declare-fun e!618538 () Bool)

(assert (=> b!1082302 (=> (not res!721439) (not e!618538))))

(declare-fun lt!479573 () array!69697)

(declare-datatypes ((List!23363 0))(
  ( (Nil!23360) (Cons!23359 (h!24568 (_ BitVec 64)) (t!32794 List!23363)) )
))
(declare-fun arrayNoDuplicates!0 (array!69697 (_ BitVec 32) List!23363) Bool)

(assert (=> b!1082302 (= res!721439 (arrayNoDuplicates!0 lt!479573 #b00000000000000000000000000000000 Nil!23360))))

(declare-fun b!1082303 () Bool)

(declare-fun e!618537 () Bool)

(assert (=> b!1082303 (= e!618535 (and e!618537 mapRes!41317))))

(declare-fun condMapEmpty!41317 () Bool)

(declare-fun mapDefault!41317 () ValueCell!12478)

