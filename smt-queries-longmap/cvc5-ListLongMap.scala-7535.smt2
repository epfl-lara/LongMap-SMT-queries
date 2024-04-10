; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95514 () Bool)

(assert start!95514)

(declare-fun b!1078759 () Bool)

(declare-fun e!616784 () Bool)

(declare-fun tp_is_empty!26185 () Bool)

(assert (=> b!1078759 (= e!616784 tp_is_empty!26185)))

(declare-fun b!1078760 () Bool)

(declare-fun e!616786 () Bool)

(declare-datatypes ((array!69325 0))(
  ( (array!69326 (arr!33337 (Array (_ BitVec 32) (_ BitVec 64))) (size!33873 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69325)

(assert (=> b!1078760 (= e!616786 (not (bvslt #b00000000000000000000000000000000 (size!33873 _keys!1070))))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078760 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35470 0))(
  ( (Unit!35471) )
))
(declare-fun lt!478693 () Unit!35470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69325 (_ BitVec 64) (_ BitVec 32)) Unit!35470)

(assert (=> b!1078760 (= lt!478693 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41029 () Bool)

(declare-fun mapRes!41029 () Bool)

(assert (=> mapIsEmpty!41029 mapRes!41029))

(declare-fun b!1078761 () Bool)

(declare-fun res!718844 () Bool)

(declare-fun e!616789 () Bool)

(assert (=> b!1078761 (=> (not res!718844) (not e!616789))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69325 (_ BitVec 32)) Bool)

(assert (=> b!1078761 (= res!718844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078762 () Bool)

(declare-fun res!718845 () Bool)

(assert (=> b!1078762 (=> (not res!718845) (not e!616789))))

(declare-datatypes ((List!23248 0))(
  ( (Nil!23245) (Cons!23244 (h!24453 (_ BitVec 64)) (t!32607 List!23248)) )
))
(declare-fun arrayNoDuplicates!0 (array!69325 (_ BitVec 32) List!23248) Bool)

(assert (=> b!1078762 (= res!718845 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23245))))

(declare-fun b!1078763 () Bool)

(declare-fun res!718843 () Bool)

(assert (=> b!1078763 (=> (not res!718843) (not e!616789))))

(assert (=> b!1078763 (= res!718843 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33873 _keys!1070))))))

(declare-fun res!718842 () Bool)

(assert (=> start!95514 (=> (not res!718842) (not e!616789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95514 (= res!718842 (validMask!0 mask!1414))))

(assert (=> start!95514 e!616789))

(assert (=> start!95514 true))

(declare-fun array_inv!25752 (array!69325) Bool)

(assert (=> start!95514 (array_inv!25752 _keys!1070)))

(declare-datatypes ((V!40041 0))(
  ( (V!40042 (val!13149 Int)) )
))
(declare-datatypes ((ValueCell!12383 0))(
  ( (ValueCellFull!12383 (v!15770 V!40041)) (EmptyCell!12383) )
))
(declare-datatypes ((array!69327 0))(
  ( (array!69328 (arr!33338 (Array (_ BitVec 32) ValueCell!12383)) (size!33874 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69327)

(declare-fun e!616785 () Bool)

(declare-fun array_inv!25753 (array!69327) Bool)

(assert (=> start!95514 (and (array_inv!25753 _values!874) e!616785)))

(declare-fun mapNonEmpty!41029 () Bool)

(declare-fun tp!78491 () Bool)

(assert (=> mapNonEmpty!41029 (= mapRes!41029 (and tp!78491 e!616784))))

(declare-fun mapRest!41029 () (Array (_ BitVec 32) ValueCell!12383))

(declare-fun mapKey!41029 () (_ BitVec 32))

(declare-fun mapValue!41029 () ValueCell!12383)

(assert (=> mapNonEmpty!41029 (= (arr!33338 _values!874) (store mapRest!41029 mapKey!41029 mapValue!41029))))

(declare-fun b!1078764 () Bool)

(declare-fun e!616787 () Bool)

(assert (=> b!1078764 (= e!616787 tp_is_empty!26185)))

(declare-fun b!1078765 () Bool)

(declare-fun res!718846 () Bool)

(assert (=> b!1078765 (=> (not res!718846) (not e!616789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078765 (= res!718846 (validKeyInArray!0 k!904))))

(declare-fun b!1078766 () Bool)

(declare-fun res!718849 () Bool)

(assert (=> b!1078766 (=> (not res!718849) (not e!616786))))

(declare-fun lt!478692 () array!69325)

(assert (=> b!1078766 (= res!718849 (arrayNoDuplicates!0 lt!478692 #b00000000000000000000000000000000 Nil!23245))))

(declare-fun b!1078767 () Bool)

(declare-fun res!718847 () Bool)

(assert (=> b!1078767 (=> (not res!718847) (not e!616789))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078767 (= res!718847 (and (= (size!33874 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33873 _keys!1070) (size!33874 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078768 () Bool)

(declare-fun res!718848 () Bool)

(assert (=> b!1078768 (=> (not res!718848) (not e!616789))))

(assert (=> b!1078768 (= res!718848 (= (select (arr!33337 _keys!1070) i!650) k!904))))

(declare-fun b!1078769 () Bool)

(assert (=> b!1078769 (= e!616785 (and e!616787 mapRes!41029))))

(declare-fun condMapEmpty!41029 () Bool)

(declare-fun mapDefault!41029 () ValueCell!12383)

