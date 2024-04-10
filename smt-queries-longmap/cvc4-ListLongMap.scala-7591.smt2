; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95870 () Bool)

(assert start!95870)

(declare-fun b_free!22523 () Bool)

(declare-fun b_next!22523 () Bool)

(assert (=> start!95870 (= b_free!22523 (not b_next!22523))))

(declare-fun tp!79417 () Bool)

(declare-fun b_and!35721 () Bool)

(assert (=> start!95870 (= tp!79417 b_and!35721)))

(declare-fun b!1085237 () Bool)

(declare-fun res!723553 () Bool)

(declare-fun e!619967 () Bool)

(assert (=> b!1085237 (=> (not res!723553) (not e!619967))))

(declare-datatypes ((array!69985 0))(
  ( (array!69986 (arr!33666 (Array (_ BitVec 32) (_ BitVec 64))) (size!34202 (_ BitVec 32))) )
))
(declare-fun lt!481451 () array!69985)

(declare-datatypes ((List!23476 0))(
  ( (Nil!23473) (Cons!23472 (h!24681 (_ BitVec 64)) (t!33057 List!23476)) )
))
(declare-fun arrayNoDuplicates!0 (array!69985 (_ BitVec 32) List!23476) Bool)

(assert (=> b!1085237 (= res!723553 (arrayNoDuplicates!0 lt!481451 #b00000000000000000000000000000000 Nil!23473))))

(declare-fun b!1085238 () Bool)

(declare-fun res!723549 () Bool)

(declare-fun e!619965 () Bool)

(assert (=> b!1085238 (=> (not res!723549) (not e!619965))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69985)

(declare-datatypes ((V!40493 0))(
  ( (V!40494 (val!13319 Int)) )
))
(declare-datatypes ((ValueCell!12553 0))(
  ( (ValueCellFull!12553 (v!15940 V!40493)) (EmptyCell!12553) )
))
(declare-datatypes ((array!69987 0))(
  ( (array!69988 (arr!33667 (Array (_ BitVec 32) ValueCell!12553)) (size!34203 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69987)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1085238 (= res!723549 (and (= (size!34203 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34202 _keys!1070) (size!34203 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085239 () Bool)

(declare-fun res!723551 () Bool)

(assert (=> b!1085239 (=> (not res!723551) (not e!619965))))

(assert (=> b!1085239 (= res!723551 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23473))))

(declare-fun b!1085240 () Bool)

(assert (=> b!1085240 (= e!619965 e!619967)))

(declare-fun res!723548 () Bool)

(assert (=> b!1085240 (=> (not res!723548) (not e!619967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69985 (_ BitVec 32)) Bool)

(assert (=> b!1085240 (= res!723548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481451 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085240 (= lt!481451 (array!69986 (store (arr!33666 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34202 _keys!1070)))))

(declare-fun b!1085241 () Bool)

(declare-fun e!619963 () Bool)

(declare-fun e!619966 () Bool)

(declare-fun mapRes!41542 () Bool)

(assert (=> b!1085241 (= e!619963 (and e!619966 mapRes!41542))))

(declare-fun condMapEmpty!41542 () Bool)

(declare-fun mapDefault!41542 () ValueCell!12553)

