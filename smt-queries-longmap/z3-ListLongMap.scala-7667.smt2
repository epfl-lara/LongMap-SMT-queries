; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96558 () Bool)

(assert start!96558)

(declare-fun b!1095974 () Bool)

(declare-fun res!731016 () Bool)

(declare-fun e!625815 () Bool)

(assert (=> b!1095974 (=> (not res!731016) (not e!625815))))

(declare-datatypes ((array!70899 0))(
  ( (array!70900 (arr!34117 (Array (_ BitVec 32) (_ BitVec 64))) (size!34654 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70899)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70899 (_ BitVec 32)) Bool)

(assert (=> b!1095974 (= res!731016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095975 () Bool)

(declare-fun res!731015 () Bool)

(assert (=> b!1095975 (=> (not res!731015) (not e!625815))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41097 0))(
  ( (V!41098 (val!13545 Int)) )
))
(declare-datatypes ((ValueCell!12779 0))(
  ( (ValueCellFull!12779 (v!16162 V!41097)) (EmptyCell!12779) )
))
(declare-datatypes ((array!70901 0))(
  ( (array!70902 (arr!34118 (Array (_ BitVec 32) ValueCell!12779)) (size!34655 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70901)

(assert (=> b!1095975 (= res!731015 (and (= (size!34655 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34654 _keys!1070) (size!34655 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095976 () Bool)

(declare-fun res!731019 () Bool)

(assert (=> b!1095976 (=> (not res!731019) (not e!625815))))

(declare-datatypes ((List!23836 0))(
  ( (Nil!23833) (Cons!23832 (h!25050 (_ BitVec 64)) (t!33835 List!23836)) )
))
(declare-fun arrayNoDuplicates!0 (array!70899 (_ BitVec 32) List!23836) Bool)

(assert (=> b!1095976 (= res!731019 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23833))))

(declare-fun b!1095977 () Bool)

(declare-fun res!731021 () Bool)

(assert (=> b!1095977 (=> (not res!731021) (not e!625815))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095977 (= res!731021 (validKeyInArray!0 k0!904))))

(declare-fun b!1095978 () Bool)

(declare-fun e!625819 () Bool)

(declare-fun e!625817 () Bool)

(declare-fun mapRes!42220 () Bool)

(assert (=> b!1095978 (= e!625819 (and e!625817 mapRes!42220))))

(declare-fun condMapEmpty!42220 () Bool)

(declare-fun mapDefault!42220 () ValueCell!12779)

(assert (=> b!1095978 (= condMapEmpty!42220 (= (arr!34118 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12779)) mapDefault!42220)))))

(declare-fun b!1095979 () Bool)

(declare-fun e!625816 () Bool)

(declare-fun tp_is_empty!26977 () Bool)

(assert (=> b!1095979 (= e!625816 tp_is_empty!26977)))

(declare-fun b!1095980 () Bool)

(declare-fun e!625820 () Bool)

(assert (=> b!1095980 (= e!625820 false)))

(declare-fun lt!490193 () Bool)

(declare-fun lt!490194 () array!70899)

(assert (=> b!1095980 (= lt!490193 (arrayNoDuplicates!0 lt!490194 #b00000000000000000000000000000000 Nil!23833))))

(declare-fun b!1095981 () Bool)

(declare-fun res!731022 () Bool)

(assert (=> b!1095981 (=> (not res!731022) (not e!625815))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095981 (= res!731022 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34654 _keys!1070))))))

(declare-fun b!1095982 () Bool)

(assert (=> b!1095982 (= e!625817 tp_is_empty!26977)))

(declare-fun mapNonEmpty!42220 () Bool)

(declare-fun tp!80735 () Bool)

(assert (=> mapNonEmpty!42220 (= mapRes!42220 (and tp!80735 e!625816))))

(declare-fun mapValue!42220 () ValueCell!12779)

(declare-fun mapRest!42220 () (Array (_ BitVec 32) ValueCell!12779))

(declare-fun mapKey!42220 () (_ BitVec 32))

(assert (=> mapNonEmpty!42220 (= (arr!34118 _values!874) (store mapRest!42220 mapKey!42220 mapValue!42220))))

(declare-fun b!1095983 () Bool)

(assert (=> b!1095983 (= e!625815 e!625820)))

(declare-fun res!731020 () Bool)

(assert (=> b!1095983 (=> (not res!731020) (not e!625820))))

(assert (=> b!1095983 (= res!731020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490194 mask!1414))))

(assert (=> b!1095983 (= lt!490194 (array!70900 (store (arr!34117 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34654 _keys!1070)))))

(declare-fun b!1095984 () Bool)

(declare-fun res!731018 () Bool)

(assert (=> b!1095984 (=> (not res!731018) (not e!625815))))

(assert (=> b!1095984 (= res!731018 (= (select (arr!34117 _keys!1070) i!650) k0!904))))

(declare-fun res!731017 () Bool)

(assert (=> start!96558 (=> (not res!731017) (not e!625815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96558 (= res!731017 (validMask!0 mask!1414))))

(assert (=> start!96558 e!625815))

(assert (=> start!96558 true))

(declare-fun array_inv!26332 (array!70899) Bool)

(assert (=> start!96558 (array_inv!26332 _keys!1070)))

(declare-fun array_inv!26333 (array!70901) Bool)

(assert (=> start!96558 (and (array_inv!26333 _values!874) e!625819)))

(declare-fun mapIsEmpty!42220 () Bool)

(assert (=> mapIsEmpty!42220 mapRes!42220))

(assert (= (and start!96558 res!731017) b!1095975))

(assert (= (and b!1095975 res!731015) b!1095974))

(assert (= (and b!1095974 res!731016) b!1095976))

(assert (= (and b!1095976 res!731019) b!1095981))

(assert (= (and b!1095981 res!731022) b!1095977))

(assert (= (and b!1095977 res!731021) b!1095984))

(assert (= (and b!1095984 res!731018) b!1095983))

(assert (= (and b!1095983 res!731020) b!1095980))

(assert (= (and b!1095978 condMapEmpty!42220) mapIsEmpty!42220))

(assert (= (and b!1095978 (not condMapEmpty!42220)) mapNonEmpty!42220))

(get-info :version)

(assert (= (and mapNonEmpty!42220 ((_ is ValueCellFull!12779) mapValue!42220)) b!1095979))

(assert (= (and b!1095978 ((_ is ValueCellFull!12779) mapDefault!42220)) b!1095982))

(assert (= start!96558 b!1095978))

(declare-fun m!1016189 () Bool)

(assert (=> b!1095977 m!1016189))

(declare-fun m!1016191 () Bool)

(assert (=> mapNonEmpty!42220 m!1016191))

(declare-fun m!1016193 () Bool)

(assert (=> b!1095980 m!1016193))

(declare-fun m!1016195 () Bool)

(assert (=> start!96558 m!1016195))

(declare-fun m!1016197 () Bool)

(assert (=> start!96558 m!1016197))

(declare-fun m!1016199 () Bool)

(assert (=> start!96558 m!1016199))

(declare-fun m!1016201 () Bool)

(assert (=> b!1095974 m!1016201))

(declare-fun m!1016203 () Bool)

(assert (=> b!1095976 m!1016203))

(declare-fun m!1016205 () Bool)

(assert (=> b!1095983 m!1016205))

(declare-fun m!1016207 () Bool)

(assert (=> b!1095983 m!1016207))

(declare-fun m!1016209 () Bool)

(assert (=> b!1095984 m!1016209))

(check-sat (not b!1095980) (not mapNonEmpty!42220) (not b!1095974) (not b!1095977) (not b!1095976) tp_is_empty!26977 (not start!96558) (not b!1095983))
(check-sat)
