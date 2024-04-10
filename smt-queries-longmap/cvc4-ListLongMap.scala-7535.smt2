; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95518 () Bool)

(assert start!95518)

(declare-fun b!1078831 () Bool)

(declare-fun res!718897 () Bool)

(declare-fun e!616820 () Bool)

(assert (=> b!1078831 (=> (not res!718897) (not e!616820))))

(declare-datatypes ((array!69333 0))(
  ( (array!69334 (arr!33341 (Array (_ BitVec 32) (_ BitVec 64))) (size!33877 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69333)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1078831 (= res!718897 (= (select (arr!33341 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41035 () Bool)

(declare-fun mapRes!41035 () Bool)

(assert (=> mapIsEmpty!41035 mapRes!41035))

(declare-fun b!1078832 () Bool)

(declare-fun res!718896 () Bool)

(assert (=> b!1078832 (=> (not res!718896) (not e!616820))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((V!40045 0))(
  ( (V!40046 (val!13151 Int)) )
))
(declare-datatypes ((ValueCell!12385 0))(
  ( (ValueCellFull!12385 (v!15772 V!40045)) (EmptyCell!12385) )
))
(declare-datatypes ((array!69335 0))(
  ( (array!69336 (arr!33342 (Array (_ BitVec 32) ValueCell!12385)) (size!33878 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69335)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078832 (= res!718896 (and (= (size!33878 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33877 _keys!1070) (size!33878 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078833 () Bool)

(declare-fun e!616824 () Bool)

(assert (=> b!1078833 (= e!616824 (not (bvslt #b00000000000000000000000000000000 (size!33877 _keys!1070))))))

(declare-fun arrayContainsKey!0 (array!69333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078833 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35474 0))(
  ( (Unit!35475) )
))
(declare-fun lt!478705 () Unit!35474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69333 (_ BitVec 64) (_ BitVec 32)) Unit!35474)

(assert (=> b!1078833 (= lt!478705 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1078834 () Bool)

(declare-fun res!718902 () Bool)

(assert (=> b!1078834 (=> (not res!718902) (not e!616820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078834 (= res!718902 (validKeyInArray!0 k!904))))

(declare-fun b!1078835 () Bool)

(declare-fun res!718901 () Bool)

(assert (=> b!1078835 (=> (not res!718901) (not e!616820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69333 (_ BitVec 32)) Bool)

(assert (=> b!1078835 (= res!718901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078836 () Bool)

(declare-fun e!616823 () Bool)

(declare-fun tp_is_empty!26189 () Bool)

(assert (=> b!1078836 (= e!616823 tp_is_empty!26189)))

(declare-fun b!1078837 () Bool)

(declare-fun res!718895 () Bool)

(assert (=> b!1078837 (=> (not res!718895) (not e!616820))))

(assert (=> b!1078837 (= res!718895 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33877 _keys!1070))))))

(declare-fun res!718900 () Bool)

(assert (=> start!95518 (=> (not res!718900) (not e!616820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95518 (= res!718900 (validMask!0 mask!1414))))

(assert (=> start!95518 e!616820))

(assert (=> start!95518 true))

(declare-fun array_inv!25756 (array!69333) Bool)

(assert (=> start!95518 (array_inv!25756 _keys!1070)))

(declare-fun e!616821 () Bool)

(declare-fun array_inv!25757 (array!69335) Bool)

(assert (=> start!95518 (and (array_inv!25757 _values!874) e!616821)))

(declare-fun b!1078838 () Bool)

(assert (=> b!1078838 (= e!616821 (and e!616823 mapRes!41035))))

(declare-fun condMapEmpty!41035 () Bool)

(declare-fun mapDefault!41035 () ValueCell!12385)

