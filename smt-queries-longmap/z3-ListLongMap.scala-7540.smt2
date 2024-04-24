; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95796 () Bool)

(assert start!95796)

(declare-fun b!1080676 () Bool)

(declare-fun e!617953 () Bool)

(declare-fun e!617951 () Bool)

(declare-fun mapRes!41077 () Bool)

(assert (=> b!1080676 (= e!617953 (and e!617951 mapRes!41077))))

(declare-fun condMapEmpty!41077 () Bool)

(declare-datatypes ((V!40081 0))(
  ( (V!40082 (val!13164 Int)) )
))
(declare-datatypes ((ValueCell!12398 0))(
  ( (ValueCellFull!12398 (v!15781 V!40081)) (EmptyCell!12398) )
))
(declare-datatypes ((array!69419 0))(
  ( (array!69420 (arr!33377 (Array (_ BitVec 32) ValueCell!12398)) (size!33914 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69419)

(declare-fun mapDefault!41077 () ValueCell!12398)

(assert (=> b!1080676 (= condMapEmpty!41077 (= (arr!33377 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12398)) mapDefault!41077)))))

(declare-fun b!1080677 () Bool)

(declare-fun res!719798 () Bool)

(declare-fun e!617950 () Bool)

(assert (=> b!1080677 (=> (not res!719798) (not e!617950))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69421 0))(
  ( (array!69422 (arr!33378 (Array (_ BitVec 32) (_ BitVec 64))) (size!33915 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69421)

(assert (=> b!1080677 (= res!719798 (and (= (size!33914 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33915 _keys!1070) (size!33914 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080678 () Bool)

(declare-fun res!719799 () Bool)

(assert (=> b!1080678 (=> (not res!719799) (not e!617950))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080678 (= res!719799 (validKeyInArray!0 k0!904))))

(declare-fun res!719800 () Bool)

(assert (=> start!95796 (=> (not res!719800) (not e!617950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95796 (= res!719800 (validMask!0 mask!1414))))

(assert (=> start!95796 e!617950))

(assert (=> start!95796 true))

(declare-fun array_inv!25812 (array!69421) Bool)

(assert (=> start!95796 (array_inv!25812 _keys!1070)))

(declare-fun array_inv!25813 (array!69419) Bool)

(assert (=> start!95796 (and (array_inv!25813 _values!874) e!617953)))

(declare-fun b!1080679 () Bool)

(declare-fun tp_is_empty!26215 () Bool)

(assert (=> b!1080679 (= e!617951 tp_is_empty!26215)))

(declare-fun b!1080680 () Bool)

(declare-fun res!719795 () Bool)

(assert (=> b!1080680 (=> (not res!719795) (not e!617950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69421 (_ BitVec 32)) Bool)

(assert (=> b!1080680 (= res!719795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080681 () Bool)

(declare-fun res!719801 () Bool)

(assert (=> b!1080681 (=> (not res!719801) (not e!617950))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080681 (= res!719801 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33915 _keys!1070))))))

(declare-fun b!1080682 () Bool)

(declare-fun e!617952 () Bool)

(assert (=> b!1080682 (= e!617950 e!617952)))

(declare-fun res!719794 () Bool)

(assert (=> b!1080682 (=> (not res!719794) (not e!617952))))

(declare-fun lt!479313 () array!69421)

(assert (=> b!1080682 (= res!719794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479313 mask!1414))))

(assert (=> b!1080682 (= lt!479313 (array!69422 (store (arr!33378 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33915 _keys!1070)))))

(declare-fun b!1080683 () Bool)

(declare-fun res!719802 () Bool)

(assert (=> b!1080683 (=> (not res!719802) (not e!617950))))

(declare-datatypes ((List!23265 0))(
  ( (Nil!23262) (Cons!23261 (h!24479 (_ BitVec 64)) (t!32616 List!23265)) )
))
(declare-fun arrayNoDuplicates!0 (array!69421 (_ BitVec 32) List!23265) Bool)

(assert (=> b!1080683 (= res!719802 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23262))))

(declare-fun mapIsEmpty!41077 () Bool)

(assert (=> mapIsEmpty!41077 mapRes!41077))

(declare-fun b!1080684 () Bool)

(declare-fun res!719797 () Bool)

(assert (=> b!1080684 (=> (not res!719797) (not e!617952))))

(assert (=> b!1080684 (= res!719797 (arrayNoDuplicates!0 lt!479313 #b00000000000000000000000000000000 Nil!23262))))

(declare-fun b!1080685 () Bool)

(declare-fun res!719796 () Bool)

(assert (=> b!1080685 (=> (not res!719796) (not e!617950))))

(assert (=> b!1080685 (= res!719796 (= (select (arr!33378 _keys!1070) i!650) k0!904))))

(declare-fun b!1080686 () Bool)

(declare-fun e!617954 () Bool)

(assert (=> b!1080686 (= e!617954 tp_is_empty!26215)))

(declare-fun b!1080687 () Bool)

(assert (=> b!1080687 (= e!617952 (not true))))

(declare-fun arrayContainsKey!0 (array!69421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080687 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35461 0))(
  ( (Unit!35462) )
))
(declare-fun lt!479312 () Unit!35461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69421 (_ BitVec 64) (_ BitVec 32)) Unit!35461)

(assert (=> b!1080687 (= lt!479312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41077 () Bool)

(declare-fun tp!78539 () Bool)

(assert (=> mapNonEmpty!41077 (= mapRes!41077 (and tp!78539 e!617954))))

(declare-fun mapRest!41077 () (Array (_ BitVec 32) ValueCell!12398))

(declare-fun mapValue!41077 () ValueCell!12398)

(declare-fun mapKey!41077 () (_ BitVec 32))

(assert (=> mapNonEmpty!41077 (= (arr!33377 _values!874) (store mapRest!41077 mapKey!41077 mapValue!41077))))

(assert (= (and start!95796 res!719800) b!1080677))

(assert (= (and b!1080677 res!719798) b!1080680))

(assert (= (and b!1080680 res!719795) b!1080683))

(assert (= (and b!1080683 res!719802) b!1080681))

(assert (= (and b!1080681 res!719801) b!1080678))

(assert (= (and b!1080678 res!719799) b!1080685))

(assert (= (and b!1080685 res!719796) b!1080682))

(assert (= (and b!1080682 res!719794) b!1080684))

(assert (= (and b!1080684 res!719797) b!1080687))

(assert (= (and b!1080676 condMapEmpty!41077) mapIsEmpty!41077))

(assert (= (and b!1080676 (not condMapEmpty!41077)) mapNonEmpty!41077))

(get-info :version)

(assert (= (and mapNonEmpty!41077 ((_ is ValueCellFull!12398) mapValue!41077)) b!1080686))

(assert (= (and b!1080676 ((_ is ValueCellFull!12398) mapDefault!41077)) b!1080679))

(assert (= start!95796 b!1080676))

(declare-fun m!999257 () Bool)

(assert (=> b!1080678 m!999257))

(declare-fun m!999259 () Bool)

(assert (=> b!1080684 m!999259))

(declare-fun m!999261 () Bool)

(assert (=> mapNonEmpty!41077 m!999261))

(declare-fun m!999263 () Bool)

(assert (=> b!1080682 m!999263))

(declare-fun m!999265 () Bool)

(assert (=> b!1080682 m!999265))

(declare-fun m!999267 () Bool)

(assert (=> start!95796 m!999267))

(declare-fun m!999269 () Bool)

(assert (=> start!95796 m!999269))

(declare-fun m!999271 () Bool)

(assert (=> start!95796 m!999271))

(declare-fun m!999273 () Bool)

(assert (=> b!1080683 m!999273))

(declare-fun m!999275 () Bool)

(assert (=> b!1080685 m!999275))

(declare-fun m!999277 () Bool)

(assert (=> b!1080680 m!999277))

(declare-fun m!999279 () Bool)

(assert (=> b!1080687 m!999279))

(declare-fun m!999281 () Bool)

(assert (=> b!1080687 m!999281))

(check-sat (not b!1080683) (not b!1080682) (not b!1080687) (not b!1080684) (not b!1080678) (not mapNonEmpty!41077) (not start!95796) tp_is_empty!26215 (not b!1080680))
(check-sat)
