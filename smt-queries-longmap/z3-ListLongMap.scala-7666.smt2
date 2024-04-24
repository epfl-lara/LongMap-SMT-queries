; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96552 () Bool)

(assert start!96552)

(declare-fun b!1095882 () Bool)

(declare-fun e!625768 () Bool)

(declare-fun tp_is_empty!26971 () Bool)

(assert (=> b!1095882 (= e!625768 tp_is_empty!26971)))

(declare-fun b!1095883 () Bool)

(declare-fun res!730950 () Bool)

(declare-fun e!625771 () Bool)

(assert (=> b!1095883 (=> (not res!730950) (not e!625771))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70887 0))(
  ( (array!70888 (arr!34111 (Array (_ BitVec 32) (_ BitVec 64))) (size!34648 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70887)

(declare-datatypes ((V!41089 0))(
  ( (V!41090 (val!13542 Int)) )
))
(declare-datatypes ((ValueCell!12776 0))(
  ( (ValueCellFull!12776 (v!16159 V!41089)) (EmptyCell!12776) )
))
(declare-datatypes ((array!70889 0))(
  ( (array!70890 (arr!34112 (Array (_ BitVec 32) ValueCell!12776)) (size!34649 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70889)

(assert (=> b!1095883 (= res!730950 (and (= (size!34649 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34648 _keys!1070) (size!34649 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095884 () Bool)

(declare-fun res!730951 () Bool)

(assert (=> b!1095884 (=> (not res!730951) (not e!625771))))

(declare-datatypes ((List!23834 0))(
  ( (Nil!23831) (Cons!23830 (h!25048 (_ BitVec 64)) (t!33833 List!23834)) )
))
(declare-fun arrayNoDuplicates!0 (array!70887 (_ BitVec 32) List!23834) Bool)

(assert (=> b!1095884 (= res!730951 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23831))))

(declare-fun b!1095885 () Bool)

(declare-fun res!730955 () Bool)

(assert (=> b!1095885 (=> (not res!730955) (not e!625771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70887 (_ BitVec 32)) Bool)

(assert (=> b!1095885 (= res!730955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42211 () Bool)

(declare-fun mapRes!42211 () Bool)

(assert (=> mapIsEmpty!42211 mapRes!42211))

(declare-fun b!1095886 () Bool)

(assert (=> b!1095886 (= e!625771 false)))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!490182 () Bool)

(assert (=> b!1095886 (= lt!490182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!70888 (store (arr!34111 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34648 _keys!1070)) mask!1414))))

(declare-fun mapNonEmpty!42211 () Bool)

(declare-fun tp!80726 () Bool)

(assert (=> mapNonEmpty!42211 (= mapRes!42211 (and tp!80726 e!625768))))

(declare-fun mapValue!42211 () ValueCell!12776)

(declare-fun mapKey!42211 () (_ BitVec 32))

(declare-fun mapRest!42211 () (Array (_ BitVec 32) ValueCell!12776))

(assert (=> mapNonEmpty!42211 (= (arr!34112 _values!874) (store mapRest!42211 mapKey!42211 mapValue!42211))))

(declare-fun b!1095888 () Bool)

(declare-fun res!730956 () Bool)

(assert (=> b!1095888 (=> (not res!730956) (not e!625771))))

(assert (=> b!1095888 (= res!730956 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34648 _keys!1070))))))

(declare-fun b!1095889 () Bool)

(declare-fun e!625772 () Bool)

(declare-fun e!625770 () Bool)

(assert (=> b!1095889 (= e!625772 (and e!625770 mapRes!42211))))

(declare-fun condMapEmpty!42211 () Bool)

(declare-fun mapDefault!42211 () ValueCell!12776)

(assert (=> b!1095889 (= condMapEmpty!42211 (= (arr!34112 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12776)) mapDefault!42211)))))

(declare-fun b!1095887 () Bool)

(declare-fun res!730954 () Bool)

(assert (=> b!1095887 (=> (not res!730954) (not e!625771))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1095887 (= res!730954 (= (select (arr!34111 _keys!1070) i!650) k0!904))))

(declare-fun res!730952 () Bool)

(assert (=> start!96552 (=> (not res!730952) (not e!625771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96552 (= res!730952 (validMask!0 mask!1414))))

(assert (=> start!96552 e!625771))

(assert (=> start!96552 true))

(declare-fun array_inv!26328 (array!70887) Bool)

(assert (=> start!96552 (array_inv!26328 _keys!1070)))

(declare-fun array_inv!26329 (array!70889) Bool)

(assert (=> start!96552 (and (array_inv!26329 _values!874) e!625772)))

(declare-fun b!1095890 () Bool)

(declare-fun res!730953 () Bool)

(assert (=> b!1095890 (=> (not res!730953) (not e!625771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095890 (= res!730953 (validKeyInArray!0 k0!904))))

(declare-fun b!1095891 () Bool)

(assert (=> b!1095891 (= e!625770 tp_is_empty!26971)))

(assert (= (and start!96552 res!730952) b!1095883))

(assert (= (and b!1095883 res!730950) b!1095885))

(assert (= (and b!1095885 res!730955) b!1095884))

(assert (= (and b!1095884 res!730951) b!1095888))

(assert (= (and b!1095888 res!730956) b!1095890))

(assert (= (and b!1095890 res!730953) b!1095887))

(assert (= (and b!1095887 res!730954) b!1095886))

(assert (= (and b!1095889 condMapEmpty!42211) mapIsEmpty!42211))

(assert (= (and b!1095889 (not condMapEmpty!42211)) mapNonEmpty!42211))

(get-info :version)

(assert (= (and mapNonEmpty!42211 ((_ is ValueCellFull!12776) mapValue!42211)) b!1095882))

(assert (= (and b!1095889 ((_ is ValueCellFull!12776) mapDefault!42211)) b!1095891))

(assert (= start!96552 b!1095889))

(declare-fun m!1016129 () Bool)

(assert (=> b!1095887 m!1016129))

(declare-fun m!1016131 () Bool)

(assert (=> start!96552 m!1016131))

(declare-fun m!1016133 () Bool)

(assert (=> start!96552 m!1016133))

(declare-fun m!1016135 () Bool)

(assert (=> start!96552 m!1016135))

(declare-fun m!1016137 () Bool)

(assert (=> b!1095885 m!1016137))

(declare-fun m!1016139 () Bool)

(assert (=> b!1095886 m!1016139))

(declare-fun m!1016141 () Bool)

(assert (=> b!1095886 m!1016141))

(declare-fun m!1016143 () Bool)

(assert (=> b!1095890 m!1016143))

(declare-fun m!1016145 () Bool)

(assert (=> b!1095884 m!1016145))

(declare-fun m!1016147 () Bool)

(assert (=> mapNonEmpty!42211 m!1016147))

(check-sat (not b!1095886) (not b!1095885) tp_is_empty!26971 (not b!1095884) (not start!96552) (not b!1095890) (not mapNonEmpty!42211))
(check-sat)
