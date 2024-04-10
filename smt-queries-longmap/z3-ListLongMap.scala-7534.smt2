; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95510 () Bool)

(assert start!95510)

(declare-fun b!1078687 () Bool)

(declare-fun e!616748 () Bool)

(assert (=> b!1078687 (= e!616748 (not true))))

(declare-datatypes ((array!69317 0))(
  ( (array!69318 (arr!33333 (Array (_ BitVec 32) (_ BitVec 64))) (size!33869 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69317)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078687 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35466 0))(
  ( (Unit!35467) )
))
(declare-fun lt!478680 () Unit!35466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69317 (_ BitVec 64) (_ BitVec 32)) Unit!35466)

(assert (=> b!1078687 (= lt!478680 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078688 () Bool)

(declare-fun res!718789 () Bool)

(declare-fun e!616753 () Bool)

(assert (=> b!1078688 (=> (not res!718789) (not e!616753))))

(assert (=> b!1078688 (= res!718789 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33869 _keys!1070))))))

(declare-fun b!1078689 () Bool)

(declare-fun res!718794 () Bool)

(assert (=> b!1078689 (=> (not res!718794) (not e!616748))))

(declare-fun lt!478681 () array!69317)

(declare-datatypes ((List!23246 0))(
  ( (Nil!23243) (Cons!23242 (h!24451 (_ BitVec 64)) (t!32605 List!23246)) )
))
(declare-fun arrayNoDuplicates!0 (array!69317 (_ BitVec 32) List!23246) Bool)

(assert (=> b!1078689 (= res!718794 (arrayNoDuplicates!0 lt!478681 #b00000000000000000000000000000000 Nil!23243))))

(declare-fun b!1078690 () Bool)

(declare-fun res!718793 () Bool)

(assert (=> b!1078690 (=> (not res!718793) (not e!616753))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69317 (_ BitVec 32)) Bool)

(assert (=> b!1078690 (= res!718793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078691 () Bool)

(declare-fun res!718791 () Bool)

(assert (=> b!1078691 (=> (not res!718791) (not e!616753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078691 (= res!718791 (validKeyInArray!0 k0!904))))

(declare-fun b!1078692 () Bool)

(declare-fun e!616751 () Bool)

(declare-fun e!616750 () Bool)

(declare-fun mapRes!41023 () Bool)

(assert (=> b!1078692 (= e!616751 (and e!616750 mapRes!41023))))

(declare-fun condMapEmpty!41023 () Bool)

(declare-datatypes ((V!40035 0))(
  ( (V!40036 (val!13147 Int)) )
))
(declare-datatypes ((ValueCell!12381 0))(
  ( (ValueCellFull!12381 (v!15768 V!40035)) (EmptyCell!12381) )
))
(declare-datatypes ((array!69319 0))(
  ( (array!69320 (arr!33334 (Array (_ BitVec 32) ValueCell!12381)) (size!33870 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69319)

(declare-fun mapDefault!41023 () ValueCell!12381)

(assert (=> b!1078692 (= condMapEmpty!41023 (= (arr!33334 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12381)) mapDefault!41023)))))

(declare-fun b!1078693 () Bool)

(declare-fun res!718788 () Bool)

(assert (=> b!1078693 (=> (not res!718788) (not e!616753))))

(assert (=> b!1078693 (= res!718788 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23243))))

(declare-fun b!1078694 () Bool)

(declare-fun tp_is_empty!26181 () Bool)

(assert (=> b!1078694 (= e!616750 tp_is_empty!26181)))

(declare-fun res!718795 () Bool)

(assert (=> start!95510 (=> (not res!718795) (not e!616753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95510 (= res!718795 (validMask!0 mask!1414))))

(assert (=> start!95510 e!616753))

(assert (=> start!95510 true))

(declare-fun array_inv!25748 (array!69317) Bool)

(assert (=> start!95510 (array_inv!25748 _keys!1070)))

(declare-fun array_inv!25749 (array!69319) Bool)

(assert (=> start!95510 (and (array_inv!25749 _values!874) e!616751)))

(declare-fun b!1078695 () Bool)

(declare-fun res!718790 () Bool)

(assert (=> b!1078695 (=> (not res!718790) (not e!616753))))

(assert (=> b!1078695 (= res!718790 (= (select (arr!33333 _keys!1070) i!650) k0!904))))

(declare-fun b!1078696 () Bool)

(assert (=> b!1078696 (= e!616753 e!616748)))

(declare-fun res!718792 () Bool)

(assert (=> b!1078696 (=> (not res!718792) (not e!616748))))

(assert (=> b!1078696 (= res!718792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478681 mask!1414))))

(assert (=> b!1078696 (= lt!478681 (array!69318 (store (arr!33333 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33869 _keys!1070)))))

(declare-fun mapIsEmpty!41023 () Bool)

(assert (=> mapIsEmpty!41023 mapRes!41023))

(declare-fun b!1078697 () Bool)

(declare-fun res!718787 () Bool)

(assert (=> b!1078697 (=> (not res!718787) (not e!616753))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078697 (= res!718787 (and (= (size!33870 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33869 _keys!1070) (size!33870 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078698 () Bool)

(declare-fun e!616749 () Bool)

(assert (=> b!1078698 (= e!616749 tp_is_empty!26181)))

(declare-fun mapNonEmpty!41023 () Bool)

(declare-fun tp!78485 () Bool)

(assert (=> mapNonEmpty!41023 (= mapRes!41023 (and tp!78485 e!616749))))

(declare-fun mapKey!41023 () (_ BitVec 32))

(declare-fun mapValue!41023 () ValueCell!12381)

(declare-fun mapRest!41023 () (Array (_ BitVec 32) ValueCell!12381))

(assert (=> mapNonEmpty!41023 (= (arr!33334 _values!874) (store mapRest!41023 mapKey!41023 mapValue!41023))))

(assert (= (and start!95510 res!718795) b!1078697))

(assert (= (and b!1078697 res!718787) b!1078690))

(assert (= (and b!1078690 res!718793) b!1078693))

(assert (= (and b!1078693 res!718788) b!1078688))

(assert (= (and b!1078688 res!718789) b!1078691))

(assert (= (and b!1078691 res!718791) b!1078695))

(assert (= (and b!1078695 res!718790) b!1078696))

(assert (= (and b!1078696 res!718792) b!1078689))

(assert (= (and b!1078689 res!718794) b!1078687))

(assert (= (and b!1078692 condMapEmpty!41023) mapIsEmpty!41023))

(assert (= (and b!1078692 (not condMapEmpty!41023)) mapNonEmpty!41023))

(get-info :version)

(assert (= (and mapNonEmpty!41023 ((_ is ValueCellFull!12381) mapValue!41023)) b!1078698))

(assert (= (and b!1078692 ((_ is ValueCellFull!12381) mapDefault!41023)) b!1078694))

(assert (= start!95510 b!1078692))

(declare-fun m!997105 () Bool)

(assert (=> b!1078689 m!997105))

(declare-fun m!997107 () Bool)

(assert (=> b!1078695 m!997107))

(declare-fun m!997109 () Bool)

(assert (=> b!1078696 m!997109))

(declare-fun m!997111 () Bool)

(assert (=> b!1078696 m!997111))

(declare-fun m!997113 () Bool)

(assert (=> b!1078693 m!997113))

(declare-fun m!997115 () Bool)

(assert (=> start!95510 m!997115))

(declare-fun m!997117 () Bool)

(assert (=> start!95510 m!997117))

(declare-fun m!997119 () Bool)

(assert (=> start!95510 m!997119))

(declare-fun m!997121 () Bool)

(assert (=> b!1078687 m!997121))

(declare-fun m!997123 () Bool)

(assert (=> b!1078687 m!997123))

(declare-fun m!997125 () Bool)

(assert (=> mapNonEmpty!41023 m!997125))

(declare-fun m!997127 () Bool)

(assert (=> b!1078691 m!997127))

(declare-fun m!997129 () Bool)

(assert (=> b!1078690 m!997129))

(check-sat (not b!1078696) (not b!1078691) (not mapNonEmpty!41023) tp_is_empty!26181 (not b!1078690) (not start!95510) (not b!1078693) (not b!1078689) (not b!1078687))
(check-sat)
