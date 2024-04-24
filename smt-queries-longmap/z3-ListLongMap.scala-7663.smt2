; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96534 () Bool)

(assert start!96534)

(declare-fun b!1095670 () Bool)

(declare-fun res!730827 () Bool)

(declare-fun e!625631 () Bool)

(assert (=> b!1095670 (=> (not res!730827) (not e!625631))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095670 (= res!730827 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42184 () Bool)

(declare-fun mapRes!42184 () Bool)

(declare-fun tp!80699 () Bool)

(declare-fun e!625626 () Bool)

(assert (=> mapNonEmpty!42184 (= mapRes!42184 (and tp!80699 e!625626))))

(declare-datatypes ((V!41065 0))(
  ( (V!41066 (val!13533 Int)) )
))
(declare-datatypes ((ValueCell!12767 0))(
  ( (ValueCellFull!12767 (v!16150 V!41065)) (EmptyCell!12767) )
))
(declare-fun mapValue!42184 () ValueCell!12767)

(declare-fun mapRest!42184 () (Array (_ BitVec 32) ValueCell!12767))

(declare-fun mapKey!42184 () (_ BitVec 32))

(declare-datatypes ((array!70851 0))(
  ( (array!70852 (arr!34093 (Array (_ BitVec 32) ValueCell!12767)) (size!34630 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70851)

(assert (=> mapNonEmpty!42184 (= (arr!34093 _values!874) (store mapRest!42184 mapKey!42184 mapValue!42184))))

(declare-fun b!1095671 () Bool)

(declare-fun res!730825 () Bool)

(assert (=> b!1095671 (=> (not res!730825) (not e!625631))))

(declare-datatypes ((array!70853 0))(
  ( (array!70854 (arr!34094 (Array (_ BitVec 32) (_ BitVec 64))) (size!34631 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70853)

(declare-datatypes ((List!23826 0))(
  ( (Nil!23823) (Cons!23822 (h!25040 (_ BitVec 64)) (t!33825 List!23826)) )
))
(declare-fun arrayNoDuplicates!0 (array!70853 (_ BitVec 32) List!23826) Bool)

(assert (=> b!1095671 (= res!730825 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23823))))

(declare-fun b!1095673 () Bool)

(declare-fun res!730820 () Bool)

(declare-fun e!625628 () Bool)

(assert (=> b!1095673 (=> (not res!730820) (not e!625628))))

(declare-fun lt!490148 () array!70853)

(assert (=> b!1095673 (= res!730820 (arrayNoDuplicates!0 lt!490148 #b00000000000000000000000000000000 Nil!23823))))

(declare-fun b!1095674 () Bool)

(declare-fun res!730822 () Bool)

(assert (=> b!1095674 (=> (not res!730822) (not e!625631))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095674 (= res!730822 (= (select (arr!34094 _keys!1070) i!650) k0!904))))

(declare-fun b!1095675 () Bool)

(declare-fun e!625630 () Bool)

(declare-fun tp_is_empty!26953 () Bool)

(assert (=> b!1095675 (= e!625630 tp_is_empty!26953)))

(declare-fun b!1095676 () Bool)

(declare-fun res!730819 () Bool)

(assert (=> b!1095676 (=> (not res!730819) (not e!625631))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70853 (_ BitVec 32)) Bool)

(assert (=> b!1095676 (= res!730819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095677 () Bool)

(declare-fun res!730823 () Bool)

(assert (=> b!1095677 (=> (not res!730823) (not e!625631))))

(assert (=> b!1095677 (= res!730823 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34631 _keys!1070))))))

(declare-fun b!1095678 () Bool)

(declare-fun res!730826 () Bool)

(assert (=> b!1095678 (=> (not res!730826) (not e!625631))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095678 (= res!730826 (and (= (size!34630 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34631 _keys!1070) (size!34630 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42184 () Bool)

(assert (=> mapIsEmpty!42184 mapRes!42184))

(declare-fun b!1095679 () Bool)

(assert (=> b!1095679 (= e!625626 tp_is_empty!26953)))

(declare-fun res!730821 () Bool)

(assert (=> start!96534 (=> (not res!730821) (not e!625631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96534 (= res!730821 (validMask!0 mask!1414))))

(assert (=> start!96534 e!625631))

(assert (=> start!96534 true))

(declare-fun array_inv!26312 (array!70853) Bool)

(assert (=> start!96534 (array_inv!26312 _keys!1070)))

(declare-fun e!625629 () Bool)

(declare-fun array_inv!26313 (array!70851) Bool)

(assert (=> start!96534 (and (array_inv!26313 _values!874) e!625629)))

(declare-fun b!1095672 () Bool)

(assert (=> b!1095672 (= e!625631 e!625628)))

(declare-fun res!730824 () Bool)

(assert (=> b!1095672 (=> (not res!730824) (not e!625628))))

(assert (=> b!1095672 (= res!730824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490148 mask!1414))))

(assert (=> b!1095672 (= lt!490148 (array!70854 (store (arr!34094 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34631 _keys!1070)))))

(declare-fun b!1095680 () Bool)

(assert (=> b!1095680 (= e!625628 (not true))))

(declare-fun arrayContainsKey!0 (array!70853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095680 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36013 0))(
  ( (Unit!36014) )
))
(declare-fun lt!490149 () Unit!36013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70853 (_ BitVec 64) (_ BitVec 32)) Unit!36013)

(assert (=> b!1095680 (= lt!490149 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095681 () Bool)

(assert (=> b!1095681 (= e!625629 (and e!625630 mapRes!42184))))

(declare-fun condMapEmpty!42184 () Bool)

(declare-fun mapDefault!42184 () ValueCell!12767)

(assert (=> b!1095681 (= condMapEmpty!42184 (= (arr!34093 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12767)) mapDefault!42184)))))

(assert (= (and start!96534 res!730821) b!1095678))

(assert (= (and b!1095678 res!730826) b!1095676))

(assert (= (and b!1095676 res!730819) b!1095671))

(assert (= (and b!1095671 res!730825) b!1095677))

(assert (= (and b!1095677 res!730823) b!1095670))

(assert (= (and b!1095670 res!730827) b!1095674))

(assert (= (and b!1095674 res!730822) b!1095672))

(assert (= (and b!1095672 res!730824) b!1095673))

(assert (= (and b!1095673 res!730820) b!1095680))

(assert (= (and b!1095681 condMapEmpty!42184) mapIsEmpty!42184))

(assert (= (and b!1095681 (not condMapEmpty!42184)) mapNonEmpty!42184))

(get-info :version)

(assert (= (and mapNonEmpty!42184 ((_ is ValueCellFull!12767) mapValue!42184)) b!1095679))

(assert (= (and b!1095681 ((_ is ValueCellFull!12767) mapDefault!42184)) b!1095675))

(assert (= start!96534 b!1095681))

(declare-fun m!1015979 () Bool)

(assert (=> b!1095680 m!1015979))

(declare-fun m!1015981 () Bool)

(assert (=> b!1095680 m!1015981))

(declare-fun m!1015983 () Bool)

(assert (=> start!96534 m!1015983))

(declare-fun m!1015985 () Bool)

(assert (=> start!96534 m!1015985))

(declare-fun m!1015987 () Bool)

(assert (=> start!96534 m!1015987))

(declare-fun m!1015989 () Bool)

(assert (=> b!1095673 m!1015989))

(declare-fun m!1015991 () Bool)

(assert (=> b!1095674 m!1015991))

(declare-fun m!1015993 () Bool)

(assert (=> mapNonEmpty!42184 m!1015993))

(declare-fun m!1015995 () Bool)

(assert (=> b!1095676 m!1015995))

(declare-fun m!1015997 () Bool)

(assert (=> b!1095671 m!1015997))

(declare-fun m!1015999 () Bool)

(assert (=> b!1095672 m!1015999))

(declare-fun m!1016001 () Bool)

(assert (=> b!1095672 m!1016001))

(declare-fun m!1016003 () Bool)

(assert (=> b!1095670 m!1016003))

(check-sat (not b!1095676) (not mapNonEmpty!42184) (not b!1095671) (not b!1095672) (not b!1095673) (not start!96534) tp_is_empty!26953 (not b!1095670) (not b!1095680))
(check-sat)
