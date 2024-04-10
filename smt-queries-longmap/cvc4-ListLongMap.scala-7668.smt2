; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96332 () Bool)

(assert start!96332)

(declare-fun res!730615 () Bool)

(declare-fun e!625053 () Bool)

(assert (=> start!96332 (=> (not res!730615) (not e!625053))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96332 (= res!730615 (validMask!0 mask!1414))))

(assert (=> start!96332 e!625053))

(assert (=> start!96332 true))

(declare-datatypes ((array!70887 0))(
  ( (array!70888 (arr!34117 (Array (_ BitVec 32) (_ BitVec 64))) (size!34653 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70887)

(declare-fun array_inv!26290 (array!70887) Bool)

(assert (=> start!96332 (array_inv!26290 _keys!1070)))

(declare-datatypes ((V!41109 0))(
  ( (V!41110 (val!13550 Int)) )
))
(declare-datatypes ((ValueCell!12784 0))(
  ( (ValueCellFull!12784 (v!16171 V!41109)) (EmptyCell!12784) )
))
(declare-datatypes ((array!70889 0))(
  ( (array!70890 (arr!34118 (Array (_ BitVec 32) ValueCell!12784)) (size!34654 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70889)

(declare-fun e!625054 () Bool)

(declare-fun array_inv!26291 (array!70889) Bool)

(assert (=> start!96332 (and (array_inv!26291 _values!874) e!625054)))

(declare-fun b!1094812 () Bool)

(declare-fun res!730618 () Bool)

(assert (=> b!1094812 (=> (not res!730618) (not e!625053))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094812 (= res!730618 (= (select (arr!34117 _keys!1070) i!650) k!904))))

(declare-fun b!1094813 () Bool)

(declare-fun res!730613 () Bool)

(assert (=> b!1094813 (=> (not res!730613) (not e!625053))))

(declare-datatypes ((List!23829 0))(
  ( (Nil!23826) (Cons!23825 (h!25034 (_ BitVec 64)) (t!33836 List!23829)) )
))
(declare-fun arrayNoDuplicates!0 (array!70887 (_ BitVec 32) List!23829) Bool)

(assert (=> b!1094813 (= res!730613 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23826))))

(declare-fun mapIsEmpty!42235 () Bool)

(declare-fun mapRes!42235 () Bool)

(assert (=> mapIsEmpty!42235 mapRes!42235))

(declare-fun b!1094814 () Bool)

(declare-fun e!625050 () Bool)

(assert (=> b!1094814 (= e!625050 false)))

(declare-fun lt!489708 () Bool)

(declare-fun lt!489709 () array!70887)

(assert (=> b!1094814 (= lt!489708 (arrayNoDuplicates!0 lt!489709 #b00000000000000000000000000000000 Nil!23826))))

(declare-fun b!1094815 () Bool)

(declare-fun e!625055 () Bool)

(declare-fun tp_is_empty!26987 () Bool)

(assert (=> b!1094815 (= e!625055 tp_is_empty!26987)))

(declare-fun b!1094816 () Bool)

(declare-fun res!730616 () Bool)

(assert (=> b!1094816 (=> (not res!730616) (not e!625053))))

(assert (=> b!1094816 (= res!730616 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34653 _keys!1070))))))

(declare-fun b!1094817 () Bool)

(declare-fun e!625052 () Bool)

(assert (=> b!1094817 (= e!625052 tp_is_empty!26987)))

(declare-fun b!1094818 () Bool)

(declare-fun res!730619 () Bool)

(assert (=> b!1094818 (=> (not res!730619) (not e!625053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70887 (_ BitVec 32)) Bool)

(assert (=> b!1094818 (= res!730619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094819 () Bool)

(assert (=> b!1094819 (= e!625053 e!625050)))

(declare-fun res!730614 () Bool)

(assert (=> b!1094819 (=> (not res!730614) (not e!625050))))

(assert (=> b!1094819 (= res!730614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489709 mask!1414))))

(assert (=> b!1094819 (= lt!489709 (array!70888 (store (arr!34117 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34653 _keys!1070)))))

(declare-fun b!1094820 () Bool)

(declare-fun res!730617 () Bool)

(assert (=> b!1094820 (=> (not res!730617) (not e!625053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094820 (= res!730617 (validKeyInArray!0 k!904))))

(declare-fun b!1094821 () Bool)

(declare-fun res!730620 () Bool)

(assert (=> b!1094821 (=> (not res!730620) (not e!625053))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094821 (= res!730620 (and (= (size!34654 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34653 _keys!1070) (size!34654 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094822 () Bool)

(assert (=> b!1094822 (= e!625054 (and e!625052 mapRes!42235))))

(declare-fun condMapEmpty!42235 () Bool)

(declare-fun mapDefault!42235 () ValueCell!12784)

