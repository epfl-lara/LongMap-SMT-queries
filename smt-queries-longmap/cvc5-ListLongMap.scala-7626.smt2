; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96076 () Bool)

(assert start!96076)

(declare-fun b_free!22729 () Bool)

(declare-fun b_next!22729 () Bool)

(assert (=> start!96076 (= b_free!22729 (not b_next!22729))))

(declare-fun tp!80036 () Bool)

(declare-fun b_and!36133 () Bool)

(assert (=> start!96076 (= tp!80036 b_and!36133)))

(declare-fun b!1089780 () Bool)

(declare-fun e!622442 () Bool)

(declare-fun tp_is_empty!26731 () Bool)

(assert (=> b!1089780 (= e!622442 tp_is_empty!26731)))

(declare-fun b!1089781 () Bool)

(declare-fun res!726964 () Bool)

(declare-fun e!622438 () Bool)

(assert (=> b!1089781 (=> (not res!726964) (not e!622438))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70385 0))(
  ( (array!70386 (arr!33866 (Array (_ BitVec 32) (_ BitVec 64))) (size!34402 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70385)

(declare-datatypes ((V!40769 0))(
  ( (V!40770 (val!13422 Int)) )
))
(declare-datatypes ((ValueCell!12656 0))(
  ( (ValueCellFull!12656 (v!16043 V!40769)) (EmptyCell!12656) )
))
(declare-datatypes ((array!70387 0))(
  ( (array!70388 (arr!33867 (Array (_ BitVec 32) ValueCell!12656)) (size!34403 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70387)

(assert (=> b!1089781 (= res!726964 (and (= (size!34403 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34402 _keys!1070) (size!34403 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089782 () Bool)

(declare-fun e!622439 () Bool)

(declare-fun e!622435 () Bool)

(declare-fun mapRes!41851 () Bool)

(assert (=> b!1089782 (= e!622439 (and e!622435 mapRes!41851))))

(declare-fun condMapEmpty!41851 () Bool)

(declare-fun mapDefault!41851 () ValueCell!12656)

