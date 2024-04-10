; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96188 () Bool)

(assert start!96188)

(declare-fun b_free!22841 () Bool)

(declare-fun b_next!22841 () Bool)

(assert (=> start!96188 (= b_free!22841 (not b_next!22841))))

(declare-fun tp!80371 () Bool)

(declare-fun b_and!36357 () Bool)

(assert (=> start!96188 (= tp!80371 b_and!36357)))

(declare-fun b!1092251 () Bool)

(declare-fun res!728816 () Bool)

(declare-fun e!623783 () Bool)

(assert (=> b!1092251 (=> (not res!728816) (not e!623783))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70605 0))(
  ( (array!70606 (arr!33976 (Array (_ BitVec 32) (_ BitVec 64))) (size!34512 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70605)

(assert (=> b!1092251 (= res!728816 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34512 _keys!1070))))))

(declare-fun b!1092253 () Bool)

(declare-fun res!728819 () Bool)

(assert (=> b!1092253 (=> (not res!728819) (not e!623783))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40917 0))(
  ( (V!40918 (val!13478 Int)) )
))
(declare-datatypes ((ValueCell!12712 0))(
  ( (ValueCellFull!12712 (v!16099 V!40917)) (EmptyCell!12712) )
))
(declare-datatypes ((array!70607 0))(
  ( (array!70608 (arr!33977 (Array (_ BitVec 32) ValueCell!12712)) (size!34513 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70607)

(assert (=> b!1092253 (= res!728819 (and (= (size!34513 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34512 _keys!1070) (size!34513 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092254 () Bool)

(declare-fun e!623785 () Bool)

(declare-fun e!623786 () Bool)

(declare-fun mapRes!42019 () Bool)

(assert (=> b!1092254 (= e!623785 (and e!623786 mapRes!42019))))

(declare-fun condMapEmpty!42019 () Bool)

(declare-fun mapDefault!42019 () ValueCell!12712)

