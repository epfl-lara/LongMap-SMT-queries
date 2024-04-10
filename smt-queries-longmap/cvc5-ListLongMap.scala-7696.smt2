; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96628 () Bool)

(assert start!96628)

(declare-fun b_free!23101 () Bool)

(declare-fun b_next!23101 () Bool)

(assert (=> start!96628 (= b_free!23101 (not b_next!23101))))

(declare-fun tp!81241 () Bool)

(declare-fun b_and!36921 () Bool)

(assert (=> start!96628 (= tp!81241 b_and!36921)))

(declare-fun b!1098914 () Bool)

(declare-fun e!627217 () Bool)

(declare-fun e!627218 () Bool)

(assert (=> b!1098914 (= e!627217 e!627218)))

(declare-fun res!733357 () Bool)

(assert (=> b!1098914 (=> (not res!733357) (not e!627218))))

(declare-datatypes ((array!71217 0))(
  ( (array!71218 (arr!34276 (Array (_ BitVec 32) (_ BitVec 64))) (size!34812 (_ BitVec 32))) )
))
(declare-fun lt!491830 () array!71217)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71217 (_ BitVec 32)) Bool)

(assert (=> b!1098914 (= res!733357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491830 mask!1414))))

(declare-fun _keys!1070 () array!71217)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098914 (= lt!491830 (array!71218 (store (arr!34276 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34812 _keys!1070)))))

(declare-fun b!1098915 () Bool)

(declare-fun e!627215 () Bool)

(declare-fun tp_is_empty!27151 () Bool)

(assert (=> b!1098915 (= e!627215 tp_is_empty!27151)))

(declare-fun res!733358 () Bool)

(assert (=> start!96628 (=> (not res!733358) (not e!627217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96628 (= res!733358 (validMask!0 mask!1414))))

(assert (=> start!96628 e!627217))

(assert (=> start!96628 tp!81241))

(assert (=> start!96628 true))

(assert (=> start!96628 tp_is_empty!27151))

(declare-fun array_inv!26402 (array!71217) Bool)

(assert (=> start!96628 (array_inv!26402 _keys!1070)))

(declare-datatypes ((V!41329 0))(
  ( (V!41330 (val!13632 Int)) )
))
(declare-datatypes ((ValueCell!12866 0))(
  ( (ValueCellFull!12866 (v!16257 V!41329)) (EmptyCell!12866) )
))
(declare-datatypes ((array!71219 0))(
  ( (array!71220 (arr!34277 (Array (_ BitVec 32) ValueCell!12866)) (size!34813 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71219)

(declare-fun e!627221 () Bool)

(declare-fun array_inv!26403 (array!71219) Bool)

(assert (=> start!96628 (and (array_inv!26403 _values!874) e!627221)))

(declare-fun b!1098916 () Bool)

(declare-fun res!733359 () Bool)

(assert (=> b!1098916 (=> (not res!733359) (not e!627217))))

(declare-datatypes ((List!23937 0))(
  ( (Nil!23934) (Cons!23933 (h!25142 (_ BitVec 64)) (t!34084 List!23937)) )
))
(declare-fun arrayNoDuplicates!0 (array!71217 (_ BitVec 32) List!23937) Bool)

(assert (=> b!1098916 (= res!733359 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23934))))

(declare-fun b!1098917 () Bool)

(declare-fun res!733353 () Bool)

(assert (=> b!1098917 (=> (not res!733353) (not e!627217))))

(assert (=> b!1098917 (= res!733353 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34812 _keys!1070))))))

(declare-fun b!1098918 () Bool)

(declare-fun e!627216 () Bool)

(declare-fun mapRes!42499 () Bool)

(assert (=> b!1098918 (= e!627221 (and e!627216 mapRes!42499))))

(declare-fun condMapEmpty!42499 () Bool)

(declare-fun mapDefault!42499 () ValueCell!12866)

