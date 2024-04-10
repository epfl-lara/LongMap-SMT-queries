; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95678 () Bool)

(assert start!95678)

(declare-fun b_free!22331 () Bool)

(declare-fun b_next!22331 () Bool)

(assert (=> start!95678 (= b_free!22331 (not b_next!22331))))

(declare-fun tp!78842 () Bool)

(declare-fun b_and!35337 () Bool)

(assert (=> start!95678 (= tp!78842 b_and!35337)))

(declare-fun b!1081501 () Bool)

(declare-fun res!720867 () Bool)

(declare-fun e!618161 () Bool)

(assert (=> b!1081501 (=> (not res!720867) (not e!618161))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69613 0))(
  ( (array!69614 (arr!33480 (Array (_ BitVec 32) (_ BitVec 64))) (size!34016 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69613)

(assert (=> b!1081501 (= res!720867 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34016 _keys!1070))))))

(declare-fun b!1081502 () Bool)

(declare-fun e!618160 () Bool)

(declare-fun tp_is_empty!26333 () Bool)

(assert (=> b!1081502 (= e!618160 tp_is_empty!26333)))

(declare-fun res!720869 () Bool)

(assert (=> start!95678 (=> (not res!720869) (not e!618161))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95678 (= res!720869 (validMask!0 mask!1414))))

(assert (=> start!95678 e!618161))

(assert (=> start!95678 tp!78842))

(assert (=> start!95678 true))

(assert (=> start!95678 tp_is_empty!26333))

(declare-fun array_inv!25846 (array!69613) Bool)

(assert (=> start!95678 (array_inv!25846 _keys!1070)))

(declare-datatypes ((V!40237 0))(
  ( (V!40238 (val!13223 Int)) )
))
(declare-datatypes ((ValueCell!12457 0))(
  ( (ValueCellFull!12457 (v!15844 V!40237)) (EmptyCell!12457) )
))
(declare-datatypes ((array!69615 0))(
  ( (array!69616 (arr!33481 (Array (_ BitVec 32) ValueCell!12457)) (size!34017 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69615)

(declare-fun e!618159 () Bool)

(declare-fun array_inv!25847 (array!69615) Bool)

(assert (=> start!95678 (and (array_inv!25847 _values!874) e!618159)))

(declare-fun b!1081503 () Bool)

(declare-fun res!720870 () Bool)

(assert (=> b!1081503 (=> (not res!720870) (not e!618161))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081503 (= res!720870 (and (= (size!34017 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34016 _keys!1070) (size!34017 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081504 () Bool)

(declare-fun e!618158 () Bool)

(declare-fun mapRes!41254 () Bool)

(assert (=> b!1081504 (= e!618159 (and e!618158 mapRes!41254))))

(declare-fun condMapEmpty!41254 () Bool)

(declare-fun mapDefault!41254 () ValueCell!12457)

