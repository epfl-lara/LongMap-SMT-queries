; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95512 () Bool)

(assert start!95512)

(declare-fun b!1078723 () Bool)

(declare-fun e!616769 () Bool)

(declare-fun tp_is_empty!26183 () Bool)

(assert (=> b!1078723 (= e!616769 tp_is_empty!26183)))

(declare-fun b!1078724 () Bool)

(declare-fun res!718815 () Bool)

(declare-fun e!616766 () Bool)

(assert (=> b!1078724 (=> (not res!718815) (not e!616766))))

(declare-datatypes ((array!69321 0))(
  ( (array!69322 (arr!33335 (Array (_ BitVec 32) (_ BitVec 64))) (size!33871 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69321)

(declare-datatypes ((List!23247 0))(
  ( (Nil!23244) (Cons!23243 (h!24452 (_ BitVec 64)) (t!32606 List!23247)) )
))
(declare-fun arrayNoDuplicates!0 (array!69321 (_ BitVec 32) List!23247) Bool)

(assert (=> b!1078724 (= res!718815 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23244))))

(declare-fun b!1078725 () Bool)

(declare-fun res!718822 () Bool)

(assert (=> b!1078725 (=> (not res!718822) (not e!616766))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078725 (= res!718822 (= (select (arr!33335 _keys!1070) i!650) k!904))))

(declare-fun b!1078726 () Bool)

(declare-fun e!616770 () Bool)

(assert (=> b!1078726 (= e!616766 e!616770)))

(declare-fun res!718816 () Bool)

(assert (=> b!1078726 (=> (not res!718816) (not e!616770))))

(declare-fun lt!478687 () array!69321)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69321 (_ BitVec 32)) Bool)

(assert (=> b!1078726 (= res!718816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478687 mask!1414))))

(assert (=> b!1078726 (= lt!478687 (array!69322 (store (arr!33335 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33871 _keys!1070)))))

(declare-fun res!718821 () Bool)

(assert (=> start!95512 (=> (not res!718821) (not e!616766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95512 (= res!718821 (validMask!0 mask!1414))))

(assert (=> start!95512 e!616766))

(assert (=> start!95512 true))

(declare-fun array_inv!25750 (array!69321) Bool)

(assert (=> start!95512 (array_inv!25750 _keys!1070)))

(declare-datatypes ((V!40037 0))(
  ( (V!40038 (val!13148 Int)) )
))
(declare-datatypes ((ValueCell!12382 0))(
  ( (ValueCellFull!12382 (v!15769 V!40037)) (EmptyCell!12382) )
))
(declare-datatypes ((array!69323 0))(
  ( (array!69324 (arr!33336 (Array (_ BitVec 32) ValueCell!12382)) (size!33872 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69323)

(declare-fun e!616767 () Bool)

(declare-fun array_inv!25751 (array!69323) Bool)

(assert (=> start!95512 (and (array_inv!25751 _values!874) e!616767)))

(declare-fun b!1078727 () Bool)

(declare-fun e!616768 () Bool)

(assert (=> b!1078727 (= e!616768 tp_is_empty!26183)))

(declare-fun b!1078728 () Bool)

(declare-fun res!718820 () Bool)

(assert (=> b!1078728 (=> (not res!718820) (not e!616766))))

(assert (=> b!1078728 (= res!718820 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33871 _keys!1070))))))

(declare-fun mapIsEmpty!41026 () Bool)

(declare-fun mapRes!41026 () Bool)

(assert (=> mapIsEmpty!41026 mapRes!41026))

(declare-fun b!1078729 () Bool)

(declare-fun res!718818 () Bool)

(assert (=> b!1078729 (=> (not res!718818) (not e!616770))))

(assert (=> b!1078729 (= res!718818 (arrayNoDuplicates!0 lt!478687 #b00000000000000000000000000000000 Nil!23244))))

(declare-fun b!1078730 () Bool)

(declare-fun res!718817 () Bool)

(assert (=> b!1078730 (=> (not res!718817) (not e!616766))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078730 (= res!718817 (and (= (size!33872 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33871 _keys!1070) (size!33872 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078731 () Bool)

(declare-fun res!718814 () Bool)

(assert (=> b!1078731 (=> (not res!718814) (not e!616766))))

(assert (=> b!1078731 (= res!718814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078732 () Bool)

(declare-fun res!718819 () Bool)

(assert (=> b!1078732 (=> (not res!718819) (not e!616766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078732 (= res!718819 (validKeyInArray!0 k!904))))

(declare-fun b!1078733 () Bool)

(assert (=> b!1078733 (= e!616770 (not true))))

(declare-fun arrayContainsKey!0 (array!69321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078733 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35468 0))(
  ( (Unit!35469) )
))
(declare-fun lt!478686 () Unit!35468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69321 (_ BitVec 64) (_ BitVec 32)) Unit!35468)

(assert (=> b!1078733 (= lt!478686 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!41026 () Bool)

(declare-fun tp!78488 () Bool)

(assert (=> mapNonEmpty!41026 (= mapRes!41026 (and tp!78488 e!616769))))

(declare-fun mapRest!41026 () (Array (_ BitVec 32) ValueCell!12382))

(declare-fun mapValue!41026 () ValueCell!12382)

(declare-fun mapKey!41026 () (_ BitVec 32))

(assert (=> mapNonEmpty!41026 (= (arr!33336 _values!874) (store mapRest!41026 mapKey!41026 mapValue!41026))))

(declare-fun b!1078734 () Bool)

(assert (=> b!1078734 (= e!616767 (and e!616768 mapRes!41026))))

(declare-fun condMapEmpty!41026 () Bool)

(declare-fun mapDefault!41026 () ValueCell!12382)

