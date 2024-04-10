; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95594 () Bool)

(assert start!95594)

(declare-fun res!719738 () Bool)

(declare-fun e!617402 () Bool)

(assert (=> start!95594 (=> (not res!719738) (not e!617402))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95594 (= res!719738 (validMask!0 mask!1414))))

(assert (=> start!95594 e!617402))

(assert (=> start!95594 true))

(declare-datatypes ((array!69451 0))(
  ( (array!69452 (arr!33399 (Array (_ BitVec 32) (_ BitVec 64))) (size!33935 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69451)

(declare-fun array_inv!25788 (array!69451) Bool)

(assert (=> start!95594 (array_inv!25788 _keys!1070)))

(declare-datatypes ((V!40125 0))(
  ( (V!40126 (val!13181 Int)) )
))
(declare-datatypes ((ValueCell!12415 0))(
  ( (ValueCellFull!12415 (v!15802 V!40125)) (EmptyCell!12415) )
))
(declare-datatypes ((array!69453 0))(
  ( (array!69454 (arr!33400 (Array (_ BitVec 32) ValueCell!12415)) (size!33936 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69453)

(declare-fun e!617400 () Bool)

(declare-fun array_inv!25789 (array!69453) Bool)

(assert (=> start!95594 (and (array_inv!25789 _values!874) e!617400)))

(declare-fun b!1079961 () Bool)

(declare-fun e!617401 () Bool)

(assert (=> b!1079961 (= e!617402 e!617401)))

(declare-fun res!719733 () Bool)

(assert (=> b!1079961 (=> (not res!719733) (not e!617401))))

(declare-fun lt!478900 () array!69451)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69451 (_ BitVec 32)) Bool)

(assert (=> b!1079961 (= res!719733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478900 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079961 (= lt!478900 (array!69452 (store (arr!33399 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33935 _keys!1070)))))

(declare-fun b!1079962 () Bool)

(assert (=> b!1079962 (= e!617401 (not (bvsle #b00000000000000000000000000000000 (size!33935 _keys!1070))))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079962 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35512 0))(
  ( (Unit!35513) )
))
(declare-fun lt!478899 () Unit!35512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69451 (_ BitVec 64) (_ BitVec 32)) Unit!35512)

(assert (=> b!1079962 (= lt!478899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079963 () Bool)

(declare-fun res!719732 () Bool)

(assert (=> b!1079963 (=> (not res!719732) (not e!617402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079963 (= res!719732 (validKeyInArray!0 k!904))))

(declare-fun b!1079964 () Bool)

(declare-fun res!719731 () Bool)

(assert (=> b!1079964 (=> (not res!719731) (not e!617402))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079964 (= res!719731 (and (= (size!33936 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33935 _keys!1070) (size!33936 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41128 () Bool)

(declare-fun mapRes!41128 () Bool)

(declare-fun tp!78590 () Bool)

(declare-fun e!617404 () Bool)

(assert (=> mapNonEmpty!41128 (= mapRes!41128 (and tp!78590 e!617404))))

(declare-fun mapKey!41128 () (_ BitVec 32))

(declare-fun mapValue!41128 () ValueCell!12415)

(declare-fun mapRest!41128 () (Array (_ BitVec 32) ValueCell!12415))

(assert (=> mapNonEmpty!41128 (= (arr!33400 _values!874) (store mapRest!41128 mapKey!41128 mapValue!41128))))

(declare-fun b!1079965 () Bool)

(declare-fun e!617405 () Bool)

(assert (=> b!1079965 (= e!617400 (and e!617405 mapRes!41128))))

(declare-fun condMapEmpty!41128 () Bool)

(declare-fun mapDefault!41128 () ValueCell!12415)

