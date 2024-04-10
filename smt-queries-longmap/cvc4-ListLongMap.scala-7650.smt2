; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96224 () Bool)

(assert start!96224)

(declare-fun b_free!22877 () Bool)

(declare-fun b_next!22877 () Bool)

(assert (=> start!96224 (= b_free!22877 (not b_next!22877))))

(declare-fun tp!80480 () Bool)

(declare-fun b_and!36429 () Bool)

(assert (=> start!96224 (= tp!80480 b_and!36429)))

(declare-fun b!1092937 () Bool)

(declare-fun res!729302 () Bool)

(declare-fun e!624106 () Bool)

(assert (=> b!1092937 (=> (not res!729302) (not e!624106))))

(declare-datatypes ((array!70677 0))(
  ( (array!70678 (arr!34012 (Array (_ BitVec 32) (_ BitVec 64))) (size!34548 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70677)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70677 (_ BitVec 32)) Bool)

(assert (=> b!1092937 (= res!729302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092938 () Bool)

(declare-fun res!729304 () Bool)

(assert (=> b!1092938 (=> (not res!729304) (not e!624106))))

(declare-datatypes ((List!23762 0))(
  ( (Nil!23759) (Cons!23758 (h!24967 (_ BitVec 64)) (t!33697 List!23762)) )
))
(declare-fun arrayNoDuplicates!0 (array!70677 (_ BitVec 32) List!23762) Bool)

(assert (=> b!1092938 (= res!729304 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23759))))

(declare-fun b!1092939 () Bool)

(declare-fun res!729303 () Bool)

(assert (=> b!1092939 (=> (not res!729303) (not e!624106))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092939 (= res!729303 (validKeyInArray!0 k!904))))

(declare-fun b!1092940 () Bool)

(declare-fun e!624105 () Bool)

(declare-fun tp_is_empty!26879 () Bool)

(assert (=> b!1092940 (= e!624105 tp_is_empty!26879)))

(declare-fun b!1092941 () Bool)

(declare-fun e!624110 () Bool)

(declare-fun mapRes!42073 () Bool)

(assert (=> b!1092941 (= e!624110 (and e!624105 mapRes!42073))))

(declare-fun condMapEmpty!42073 () Bool)

(declare-datatypes ((V!40965 0))(
  ( (V!40966 (val!13496 Int)) )
))
(declare-datatypes ((ValueCell!12730 0))(
  ( (ValueCellFull!12730 (v!16117 V!40965)) (EmptyCell!12730) )
))
(declare-datatypes ((array!70679 0))(
  ( (array!70680 (arr!34013 (Array (_ BitVec 32) ValueCell!12730)) (size!34549 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70679)

(declare-fun mapDefault!42073 () ValueCell!12730)

