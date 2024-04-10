; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96382 () Bool)

(assert start!96382)

(declare-fun b_free!22961 () Bool)

(declare-fun b_next!22961 () Bool)

(assert (=> start!96382 (= b_free!22961 (not b_next!22961))))

(declare-fun tp!80809 () Bool)

(declare-fun b_and!36587 () Bool)

(assert (=> start!96382 (= tp!80809 b_and!36587)))

(declare-fun b!1095346 () Bool)

(declare-fun res!730992 () Bool)

(declare-fun e!625341 () Bool)

(assert (=> b!1095346 (=> (not res!730992) (not e!625341))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70935 0))(
  ( (array!70936 (arr!34139 (Array (_ BitVec 32) (_ BitVec 64))) (size!34675 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70935)

(assert (=> b!1095346 (= res!730992 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34675 _keys!1070))))))

(declare-fun b!1095347 () Bool)

(declare-fun res!730991 () Bool)

(assert (=> b!1095347 (=> (not res!730991) (not e!625341))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095347 (= res!730991 (validKeyInArray!0 k!904))))

(declare-fun b!1095348 () Bool)

(declare-fun res!730994 () Bool)

(declare-fun e!625343 () Bool)

(assert (=> b!1095348 (=> (not res!730994) (not e!625343))))

(declare-fun lt!489805 () array!70935)

(declare-datatypes ((List!23839 0))(
  ( (Nil!23836) (Cons!23835 (h!25044 (_ BitVec 64)) (t!33846 List!23839)) )
))
(declare-fun arrayNoDuplicates!0 (array!70935 (_ BitVec 32) List!23839) Bool)

(assert (=> b!1095348 (= res!730994 (arrayNoDuplicates!0 lt!489805 #b00000000000000000000000000000000 Nil!23836))))

(declare-fun mapIsEmpty!42277 () Bool)

(declare-fun mapRes!42277 () Bool)

(assert (=> mapIsEmpty!42277 mapRes!42277))

(declare-fun res!730997 () Bool)

(assert (=> start!96382 (=> (not res!730997) (not e!625341))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96382 (= res!730997 (validMask!0 mask!1414))))

(assert (=> start!96382 e!625341))

(assert (=> start!96382 tp!80809))

(assert (=> start!96382 true))

(declare-fun tp_is_empty!27011 () Bool)

(assert (=> start!96382 tp_is_empty!27011))

(declare-fun array_inv!26308 (array!70935) Bool)

(assert (=> start!96382 (array_inv!26308 _keys!1070)))

(declare-datatypes ((V!41141 0))(
  ( (V!41142 (val!13562 Int)) )
))
(declare-datatypes ((ValueCell!12796 0))(
  ( (ValueCellFull!12796 (v!16183 V!41141)) (EmptyCell!12796) )
))
(declare-datatypes ((array!70937 0))(
  ( (array!70938 (arr!34140 (Array (_ BitVec 32) ValueCell!12796)) (size!34676 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70937)

(declare-fun e!625342 () Bool)

(declare-fun array_inv!26309 (array!70937) Bool)

(assert (=> start!96382 (and (array_inv!26309 _values!874) e!625342)))

(declare-fun b!1095349 () Bool)

(declare-fun e!625340 () Bool)

(assert (=> b!1095349 (= e!625342 (and e!625340 mapRes!42277))))

(declare-fun condMapEmpty!42277 () Bool)

(declare-fun mapDefault!42277 () ValueCell!12796)

