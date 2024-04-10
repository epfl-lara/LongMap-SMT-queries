; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95550 () Bool)

(assert start!95550)

(declare-fun b!1079169 () Bool)

(declare-fun e!617006 () Bool)

(declare-fun e!617005 () Bool)

(declare-fun mapRes!41062 () Bool)

(assert (=> b!1079169 (= e!617006 (and e!617005 mapRes!41062))))

(declare-fun condMapEmpty!41062 () Bool)

(declare-datatypes ((V!40067 0))(
  ( (V!40068 (val!13159 Int)) )
))
(declare-datatypes ((ValueCell!12393 0))(
  ( (ValueCellFull!12393 (v!15780 V!40067)) (EmptyCell!12393) )
))
(declare-datatypes ((array!69365 0))(
  ( (array!69366 (arr!33356 (Array (_ BitVec 32) ValueCell!12393)) (size!33892 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69365)

(declare-fun mapDefault!41062 () ValueCell!12393)

(assert (=> b!1079169 (= condMapEmpty!41062 (= (arr!33356 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12393)) mapDefault!41062)))))

(declare-fun b!1079170 () Bool)

(declare-fun res!719137 () Bool)

(declare-fun e!617008 () Bool)

(assert (=> b!1079170 (=> (not res!719137) (not e!617008))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69367 0))(
  ( (array!69368 (arr!33357 (Array (_ BitVec 32) (_ BitVec 64))) (size!33893 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69367)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1079170 (= res!719137 (and (= (size!33892 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33893 _keys!1070) (size!33892 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079171 () Bool)

(declare-fun res!719145 () Bool)

(assert (=> b!1079171 (=> (not res!719145) (not e!617008))))

(declare-datatypes ((List!23253 0))(
  ( (Nil!23250) (Cons!23249 (h!24458 (_ BitVec 64)) (t!32612 List!23253)) )
))
(declare-fun arrayNoDuplicates!0 (array!69367 (_ BitVec 32) List!23253) Bool)

(assert (=> b!1079171 (= res!719145 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23250))))

(declare-fun b!1079172 () Bool)

(declare-fun res!719144 () Bool)

(declare-fun e!617009 () Bool)

(assert (=> b!1079172 (=> (not res!719144) (not e!617009))))

(declare-fun lt!478768 () array!69367)

(assert (=> b!1079172 (= res!719144 (arrayNoDuplicates!0 lt!478768 #b00000000000000000000000000000000 Nil!23250))))

(declare-fun b!1079173 () Bool)

(declare-fun res!719138 () Bool)

(assert (=> b!1079173 (=> (not res!719138) (not e!617008))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079173 (= res!719138 (= (select (arr!33357 _keys!1070) i!650) k0!904))))

(declare-fun b!1079174 () Bool)

(declare-fun res!719143 () Bool)

(assert (=> b!1079174 (=> (not res!719143) (not e!617008))))

(assert (=> b!1079174 (= res!719143 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33893 _keys!1070))))))

(declare-fun mapIsEmpty!41062 () Bool)

(assert (=> mapIsEmpty!41062 mapRes!41062))

(declare-fun mapNonEmpty!41062 () Bool)

(declare-fun tp!78524 () Bool)

(declare-fun e!617007 () Bool)

(assert (=> mapNonEmpty!41062 (= mapRes!41062 (and tp!78524 e!617007))))

(declare-fun mapKey!41062 () (_ BitVec 32))

(declare-fun mapValue!41062 () ValueCell!12393)

(declare-fun mapRest!41062 () (Array (_ BitVec 32) ValueCell!12393))

(assert (=> mapNonEmpty!41062 (= (arr!33356 _values!874) (store mapRest!41062 mapKey!41062 mapValue!41062))))

(declare-fun b!1079176 () Bool)

(declare-fun tp_is_empty!26205 () Bool)

(assert (=> b!1079176 (= e!617005 tp_is_empty!26205)))

(declare-fun b!1079177 () Bool)

(assert (=> b!1079177 (= e!617008 e!617009)))

(declare-fun res!719141 () Bool)

(assert (=> b!1079177 (=> (not res!719141) (not e!617009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69367 (_ BitVec 32)) Bool)

(assert (=> b!1079177 (= res!719141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478768 mask!1414))))

(assert (=> b!1079177 (= lt!478768 (array!69368 (store (arr!33357 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33893 _keys!1070)))))

(declare-fun b!1079178 () Bool)

(declare-fun res!719139 () Bool)

(assert (=> b!1079178 (=> (not res!719139) (not e!617008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079178 (= res!719139 (validKeyInArray!0 k0!904))))

(declare-fun b!1079175 () Bool)

(assert (=> b!1079175 (= e!617009 (not true))))

(declare-fun arrayContainsKey!0 (array!69367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079175 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35484 0))(
  ( (Unit!35485) )
))
(declare-fun lt!478767 () Unit!35484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69367 (_ BitVec 64) (_ BitVec 32)) Unit!35484)

(assert (=> b!1079175 (= lt!478767 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!719140 () Bool)

(assert (=> start!95550 (=> (not res!719140) (not e!617008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95550 (= res!719140 (validMask!0 mask!1414))))

(assert (=> start!95550 e!617008))

(assert (=> start!95550 true))

(declare-fun array_inv!25766 (array!69367) Bool)

(assert (=> start!95550 (array_inv!25766 _keys!1070)))

(declare-fun array_inv!25767 (array!69365) Bool)

(assert (=> start!95550 (and (array_inv!25767 _values!874) e!617006)))

(declare-fun b!1079179 () Bool)

(assert (=> b!1079179 (= e!617007 tp_is_empty!26205)))

(declare-fun b!1079180 () Bool)

(declare-fun res!719142 () Bool)

(assert (=> b!1079180 (=> (not res!719142) (not e!617008))))

(assert (=> b!1079180 (= res!719142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95550 res!719140) b!1079170))

(assert (= (and b!1079170 res!719137) b!1079180))

(assert (= (and b!1079180 res!719142) b!1079171))

(assert (= (and b!1079171 res!719145) b!1079174))

(assert (= (and b!1079174 res!719143) b!1079178))

(assert (= (and b!1079178 res!719139) b!1079173))

(assert (= (and b!1079173 res!719138) b!1079177))

(assert (= (and b!1079177 res!719141) b!1079172))

(assert (= (and b!1079172 res!719144) b!1079175))

(assert (= (and b!1079169 condMapEmpty!41062) mapIsEmpty!41062))

(assert (= (and b!1079169 (not condMapEmpty!41062)) mapNonEmpty!41062))

(get-info :version)

(assert (= (and mapNonEmpty!41062 ((_ is ValueCellFull!12393) mapValue!41062)) b!1079179))

(assert (= (and b!1079169 ((_ is ValueCellFull!12393) mapDefault!41062)) b!1079176))

(assert (= start!95550 b!1079169))

(declare-fun m!997455 () Bool)

(assert (=> start!95550 m!997455))

(declare-fun m!997457 () Bool)

(assert (=> start!95550 m!997457))

(declare-fun m!997459 () Bool)

(assert (=> start!95550 m!997459))

(declare-fun m!997461 () Bool)

(assert (=> b!1079178 m!997461))

(declare-fun m!997463 () Bool)

(assert (=> b!1079180 m!997463))

(declare-fun m!997465 () Bool)

(assert (=> b!1079177 m!997465))

(declare-fun m!997467 () Bool)

(assert (=> b!1079177 m!997467))

(declare-fun m!997469 () Bool)

(assert (=> b!1079172 m!997469))

(declare-fun m!997471 () Bool)

(assert (=> mapNonEmpty!41062 m!997471))

(declare-fun m!997473 () Bool)

(assert (=> b!1079175 m!997473))

(declare-fun m!997475 () Bool)

(assert (=> b!1079175 m!997475))

(declare-fun m!997477 () Bool)

(assert (=> b!1079171 m!997477))

(declare-fun m!997479 () Bool)

(assert (=> b!1079173 m!997479))

(check-sat (not b!1079177) (not b!1079172) (not b!1079180) (not mapNonEmpty!41062) (not b!1079175) (not start!95550) (not b!1079171) tp_is_empty!26205 (not b!1079178))
(check-sat)
