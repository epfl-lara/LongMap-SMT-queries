; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96312 () Bool)

(assert start!96312)

(declare-fun b!1094511 () Bool)

(declare-fun e!624887 () Bool)

(declare-fun tp_is_empty!26967 () Bool)

(assert (=> b!1094511 (= e!624887 tp_is_empty!26967)))

(declare-fun b!1094512 () Bool)

(declare-fun e!624884 () Bool)

(assert (=> b!1094512 (= e!624884 tp_is_empty!26967)))

(declare-fun b!1094513 () Bool)

(declare-fun res!730404 () Bool)

(declare-fun e!624885 () Bool)

(assert (=> b!1094513 (=> (not res!730404) (not e!624885))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70849 0))(
  ( (array!70850 (arr!34098 (Array (_ BitVec 32) (_ BitVec 64))) (size!34634 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70849)

(declare-datatypes ((V!41083 0))(
  ( (V!41084 (val!13540 Int)) )
))
(declare-datatypes ((ValueCell!12774 0))(
  ( (ValueCellFull!12774 (v!16161 V!41083)) (EmptyCell!12774) )
))
(declare-datatypes ((array!70851 0))(
  ( (array!70852 (arr!34099 (Array (_ BitVec 32) ValueCell!12774)) (size!34635 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70851)

(assert (=> b!1094513 (= res!730404 (and (= (size!34635 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34634 _keys!1070) (size!34635 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!730403 () Bool)

(assert (=> start!96312 (=> (not res!730403) (not e!624885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96312 (= res!730403 (validMask!0 mask!1414))))

(assert (=> start!96312 e!624885))

(assert (=> start!96312 true))

(declare-fun e!624886 () Bool)

(declare-fun array_inv!26276 (array!70851) Bool)

(assert (=> start!96312 (and (array_inv!26276 _values!874) e!624886)))

(declare-fun array_inv!26277 (array!70849) Bool)

(assert (=> start!96312 (array_inv!26277 _keys!1070)))

(declare-fun b!1094514 () Bool)

(declare-fun res!730402 () Bool)

(assert (=> b!1094514 (=> (not res!730402) (not e!624885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70849 (_ BitVec 32)) Bool)

(assert (=> b!1094514 (= res!730402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094515 () Bool)

(assert (=> b!1094515 (= e!624885 false)))

(declare-fun lt!489661 () Bool)

(declare-datatypes ((List!23820 0))(
  ( (Nil!23817) (Cons!23816 (h!25025 (_ BitVec 64)) (t!33827 List!23820)) )
))
(declare-fun arrayNoDuplicates!0 (array!70849 (_ BitVec 32) List!23820) Bool)

(assert (=> b!1094515 (= lt!489661 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23817))))

(declare-fun mapIsEmpty!42205 () Bool)

(declare-fun mapRes!42205 () Bool)

(assert (=> mapIsEmpty!42205 mapRes!42205))

(declare-fun b!1094516 () Bool)

(assert (=> b!1094516 (= e!624886 (and e!624884 mapRes!42205))))

(declare-fun condMapEmpty!42205 () Bool)

(declare-fun mapDefault!42205 () ValueCell!12774)

(assert (=> b!1094516 (= condMapEmpty!42205 (= (arr!34099 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12774)) mapDefault!42205)))))

(declare-fun mapNonEmpty!42205 () Bool)

(declare-fun tp!80720 () Bool)

(assert (=> mapNonEmpty!42205 (= mapRes!42205 (and tp!80720 e!624887))))

(declare-fun mapKey!42205 () (_ BitVec 32))

(declare-fun mapValue!42205 () ValueCell!12774)

(declare-fun mapRest!42205 () (Array (_ BitVec 32) ValueCell!12774))

(assert (=> mapNonEmpty!42205 (= (arr!34099 _values!874) (store mapRest!42205 mapKey!42205 mapValue!42205))))

(assert (= (and start!96312 res!730403) b!1094513))

(assert (= (and b!1094513 res!730404) b!1094514))

(assert (= (and b!1094514 res!730402) b!1094515))

(assert (= (and b!1094516 condMapEmpty!42205) mapIsEmpty!42205))

(assert (= (and b!1094516 (not condMapEmpty!42205)) mapNonEmpty!42205))

(get-info :version)

(assert (= (and mapNonEmpty!42205 ((_ is ValueCellFull!12774) mapValue!42205)) b!1094511))

(assert (= (and b!1094516 ((_ is ValueCellFull!12774) mapDefault!42205)) b!1094512))

(assert (= start!96312 b!1094516))

(declare-fun m!1014433 () Bool)

(assert (=> start!96312 m!1014433))

(declare-fun m!1014435 () Bool)

(assert (=> start!96312 m!1014435))

(declare-fun m!1014437 () Bool)

(assert (=> start!96312 m!1014437))

(declare-fun m!1014439 () Bool)

(assert (=> b!1094514 m!1014439))

(declare-fun m!1014441 () Bool)

(assert (=> b!1094515 m!1014441))

(declare-fun m!1014443 () Bool)

(assert (=> mapNonEmpty!42205 m!1014443))

(check-sat (not b!1094514) tp_is_empty!26967 (not start!96312) (not mapNonEmpty!42205) (not b!1094515))
(check-sat)
