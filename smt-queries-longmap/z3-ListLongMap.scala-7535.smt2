; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95516 () Bool)

(assert start!95516)

(declare-fun b!1078795 () Bool)

(declare-fun res!718875 () Bool)

(declare-fun e!616805 () Bool)

(assert (=> b!1078795 (=> (not res!718875) (not e!616805))))

(declare-datatypes ((array!69329 0))(
  ( (array!69330 (arr!33339 (Array (_ BitVec 32) (_ BitVec 64))) (size!33875 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69329)

(declare-datatypes ((List!23249 0))(
  ( (Nil!23246) (Cons!23245 (h!24454 (_ BitVec 64)) (t!32608 List!23249)) )
))
(declare-fun arrayNoDuplicates!0 (array!69329 (_ BitVec 32) List!23249) Bool)

(assert (=> b!1078795 (= res!718875 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23246))))

(declare-fun res!718874 () Bool)

(assert (=> start!95516 (=> (not res!718874) (not e!616805))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95516 (= res!718874 (validMask!0 mask!1414))))

(assert (=> start!95516 e!616805))

(assert (=> start!95516 true))

(declare-fun array_inv!25754 (array!69329) Bool)

(assert (=> start!95516 (array_inv!25754 _keys!1070)))

(declare-datatypes ((V!40043 0))(
  ( (V!40044 (val!13150 Int)) )
))
(declare-datatypes ((ValueCell!12384 0))(
  ( (ValueCellFull!12384 (v!15771 V!40043)) (EmptyCell!12384) )
))
(declare-datatypes ((array!69331 0))(
  ( (array!69332 (arr!33340 (Array (_ BitVec 32) ValueCell!12384)) (size!33876 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69331)

(declare-fun e!616803 () Bool)

(declare-fun array_inv!25755 (array!69331) Bool)

(assert (=> start!95516 (and (array_inv!25755 _values!874) e!616803)))

(declare-fun b!1078796 () Bool)

(declare-fun res!718869 () Bool)

(assert (=> b!1078796 (=> (not res!718869) (not e!616805))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078796 (= res!718869 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41032 () Bool)

(declare-fun mapRes!41032 () Bool)

(declare-fun tp!78494 () Bool)

(declare-fun e!616802 () Bool)

(assert (=> mapNonEmpty!41032 (= mapRes!41032 (and tp!78494 e!616802))))

(declare-fun mapValue!41032 () ValueCell!12384)

(declare-fun mapRest!41032 () (Array (_ BitVec 32) ValueCell!12384))

(declare-fun mapKey!41032 () (_ BitVec 32))

(assert (=> mapNonEmpty!41032 (= (arr!33340 _values!874) (store mapRest!41032 mapKey!41032 mapValue!41032))))

(declare-fun b!1078797 () Bool)

(declare-fun res!718873 () Bool)

(assert (=> b!1078797 (=> (not res!718873) (not e!616805))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078797 (= res!718873 (and (= (size!33876 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33875 _keys!1070) (size!33876 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078798 () Bool)

(declare-fun res!718868 () Bool)

(declare-fun e!616807 () Bool)

(assert (=> b!1078798 (=> (not res!718868) (not e!616807))))

(declare-fun lt!478698 () array!69329)

(assert (=> b!1078798 (= res!718868 (arrayNoDuplicates!0 lt!478698 #b00000000000000000000000000000000 Nil!23246))))

(declare-fun b!1078799 () Bool)

(assert (=> b!1078799 (= e!616805 e!616807)))

(declare-fun res!718870 () Bool)

(assert (=> b!1078799 (=> (not res!718870) (not e!616807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69329 (_ BitVec 32)) Bool)

(assert (=> b!1078799 (= res!718870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478698 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078799 (= lt!478698 (array!69330 (store (arr!33339 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33875 _keys!1070)))))

(declare-fun b!1078800 () Bool)

(assert (=> b!1078800 (= e!616807 (not (bvslt #b00000000000000000000000000000000 (size!33875 _keys!1070))))))

(declare-fun arrayContainsKey!0 (array!69329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078800 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35472 0))(
  ( (Unit!35473) )
))
(declare-fun lt!478699 () Unit!35472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69329 (_ BitVec 64) (_ BitVec 32)) Unit!35472)

(assert (=> b!1078800 (= lt!478699 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078801 () Bool)

(declare-fun res!718876 () Bool)

(assert (=> b!1078801 (=> (not res!718876) (not e!616805))))

(assert (=> b!1078801 (= res!718876 (= (select (arr!33339 _keys!1070) i!650) k0!904))))

(declare-fun b!1078802 () Bool)

(declare-fun tp_is_empty!26187 () Bool)

(assert (=> b!1078802 (= e!616802 tp_is_empty!26187)))

(declare-fun b!1078803 () Bool)

(declare-fun res!718871 () Bool)

(assert (=> b!1078803 (=> (not res!718871) (not e!616805))))

(assert (=> b!1078803 (= res!718871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078804 () Bool)

(declare-fun e!616806 () Bool)

(assert (=> b!1078804 (= e!616806 tp_is_empty!26187)))

(declare-fun mapIsEmpty!41032 () Bool)

(assert (=> mapIsEmpty!41032 mapRes!41032))

(declare-fun b!1078805 () Bool)

(assert (=> b!1078805 (= e!616803 (and e!616806 mapRes!41032))))

(declare-fun condMapEmpty!41032 () Bool)

(declare-fun mapDefault!41032 () ValueCell!12384)

(assert (=> b!1078805 (= condMapEmpty!41032 (= (arr!33340 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12384)) mapDefault!41032)))))

(declare-fun b!1078806 () Bool)

(declare-fun res!718872 () Bool)

(assert (=> b!1078806 (=> (not res!718872) (not e!616805))))

(assert (=> b!1078806 (= res!718872 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33875 _keys!1070))))))

(assert (= (and start!95516 res!718874) b!1078797))

(assert (= (and b!1078797 res!718873) b!1078803))

(assert (= (and b!1078803 res!718871) b!1078795))

(assert (= (and b!1078795 res!718875) b!1078806))

(assert (= (and b!1078806 res!718872) b!1078796))

(assert (= (and b!1078796 res!718869) b!1078801))

(assert (= (and b!1078801 res!718876) b!1078799))

(assert (= (and b!1078799 res!718870) b!1078798))

(assert (= (and b!1078798 res!718868) b!1078800))

(assert (= (and b!1078805 condMapEmpty!41032) mapIsEmpty!41032))

(assert (= (and b!1078805 (not condMapEmpty!41032)) mapNonEmpty!41032))

(get-info :version)

(assert (= (and mapNonEmpty!41032 ((_ is ValueCellFull!12384) mapValue!41032)) b!1078802))

(assert (= (and b!1078805 ((_ is ValueCellFull!12384) mapDefault!41032)) b!1078804))

(assert (= start!95516 b!1078805))

(declare-fun m!997183 () Bool)

(assert (=> b!1078800 m!997183))

(declare-fun m!997185 () Bool)

(assert (=> b!1078800 m!997185))

(declare-fun m!997187 () Bool)

(assert (=> mapNonEmpty!41032 m!997187))

(declare-fun m!997189 () Bool)

(assert (=> b!1078798 m!997189))

(declare-fun m!997191 () Bool)

(assert (=> b!1078801 m!997191))

(declare-fun m!997193 () Bool)

(assert (=> b!1078803 m!997193))

(declare-fun m!997195 () Bool)

(assert (=> b!1078795 m!997195))

(declare-fun m!997197 () Bool)

(assert (=> start!95516 m!997197))

(declare-fun m!997199 () Bool)

(assert (=> start!95516 m!997199))

(declare-fun m!997201 () Bool)

(assert (=> start!95516 m!997201))

(declare-fun m!997203 () Bool)

(assert (=> b!1078796 m!997203))

(declare-fun m!997205 () Bool)

(assert (=> b!1078799 m!997205))

(declare-fun m!997207 () Bool)

(assert (=> b!1078799 m!997207))

(check-sat (not b!1078798) (not b!1078799) tp_is_empty!26187 (not b!1078803) (not b!1078800) (not start!95516) (not b!1078796) (not b!1078795) (not mapNonEmpty!41032))
(check-sat)
