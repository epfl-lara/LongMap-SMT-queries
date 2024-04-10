; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96220 () Bool)

(assert start!96220)

(declare-fun b_free!22873 () Bool)

(declare-fun b_next!22873 () Bool)

(assert (=> start!96220 (= b_free!22873 (not b_next!22873))))

(declare-fun tp!80467 () Bool)

(declare-fun b_and!36421 () Bool)

(assert (=> start!96220 (= tp!80467 b_and!36421)))

(declare-fun b!1092861 () Bool)

(declare-fun e!624073 () Bool)

(declare-fun tp_is_empty!26875 () Bool)

(assert (=> b!1092861 (= e!624073 tp_is_empty!26875)))

(declare-fun b!1092862 () Bool)

(declare-fun res!729246 () Bool)

(declare-fun e!624074 () Bool)

(assert (=> b!1092862 (=> (not res!729246) (not e!624074))))

(declare-datatypes ((array!70669 0))(
  ( (array!70670 (arr!34008 (Array (_ BitVec 32) (_ BitVec 64))) (size!34544 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70669)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70669 (_ BitVec 32)) Bool)

(assert (=> b!1092862 (= res!729246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092863 () Bool)

(declare-fun res!729250 () Bool)

(declare-fun e!624070 () Bool)

(assert (=> b!1092863 (=> (not res!729250) (not e!624070))))

(declare-fun lt!488579 () array!70669)

(declare-datatypes ((List!23759 0))(
  ( (Nil!23756) (Cons!23755 (h!24964 (_ BitVec 64)) (t!33690 List!23759)) )
))
(declare-fun arrayNoDuplicates!0 (array!70669 (_ BitVec 32) List!23759) Bool)

(assert (=> b!1092863 (= res!729250 (arrayNoDuplicates!0 lt!488579 #b00000000000000000000000000000000 Nil!23756))))

(declare-fun b!1092864 () Bool)

(declare-fun res!729251 () Bool)

(assert (=> b!1092864 (=> (not res!729251) (not e!624074))))

(declare-datatypes ((V!40961 0))(
  ( (V!40962 (val!13494 Int)) )
))
(declare-datatypes ((ValueCell!12728 0))(
  ( (ValueCellFull!12728 (v!16115 V!40961)) (EmptyCell!12728) )
))
(declare-datatypes ((array!70671 0))(
  ( (array!70672 (arr!34009 (Array (_ BitVec 32) ValueCell!12728)) (size!34545 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70671)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092864 (= res!729251 (and (= (size!34545 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34544 _keys!1070) (size!34545 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092865 () Bool)

(declare-fun res!729247 () Bool)

(assert (=> b!1092865 (=> (not res!729247) (not e!624074))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092865 (= res!729247 (validKeyInArray!0 k!904))))

(declare-fun b!1092866 () Bool)

(declare-fun res!729252 () Bool)

(assert (=> b!1092866 (=> (not res!729252) (not e!624074))))

(assert (=> b!1092866 (= res!729252 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23756))))

(declare-fun b!1092867 () Bool)

(declare-fun res!729245 () Bool)

(assert (=> b!1092867 (=> (not res!729245) (not e!624074))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092867 (= res!729245 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34544 _keys!1070))))))

(declare-fun res!729249 () Bool)

(assert (=> start!96220 (=> (not res!729249) (not e!624074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96220 (= res!729249 (validMask!0 mask!1414))))

(assert (=> start!96220 e!624074))

(assert (=> start!96220 tp!80467))

(assert (=> start!96220 true))

(assert (=> start!96220 tp_is_empty!26875))

(declare-fun array_inv!26214 (array!70669) Bool)

(assert (=> start!96220 (array_inv!26214 _keys!1070)))

(declare-fun e!624072 () Bool)

(declare-fun array_inv!26215 (array!70671) Bool)

(assert (=> start!96220 (and (array_inv!26215 _values!874) e!624072)))

(declare-fun b!1092868 () Bool)

(assert (=> b!1092868 (= e!624074 e!624070)))

(declare-fun res!729244 () Bool)

(assert (=> b!1092868 (=> (not res!729244) (not e!624070))))

(assert (=> b!1092868 (= res!729244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488579 mask!1414))))

(assert (=> b!1092868 (= lt!488579 (array!70670 (store (arr!34008 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34544 _keys!1070)))))

(declare-fun b!1092869 () Bool)

(declare-fun mapRes!42067 () Bool)

(assert (=> b!1092869 (= e!624072 (and e!624073 mapRes!42067))))

(declare-fun condMapEmpty!42067 () Bool)

(declare-fun mapDefault!42067 () ValueCell!12728)

