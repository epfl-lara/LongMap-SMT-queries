; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95574 () Bool)

(assert start!95574)

(declare-fun b!1079601 () Bool)

(declare-fun res!719461 () Bool)

(declare-fun e!617220 () Bool)

(assert (=> b!1079601 (=> (not res!719461) (not e!617220))))

(declare-datatypes ((array!69413 0))(
  ( (array!69414 (arr!33380 (Array (_ BitVec 32) (_ BitVec 64))) (size!33916 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69413)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079601 (= res!719461 (= (select (arr!33380 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41098 () Bool)

(declare-fun mapRes!41098 () Bool)

(declare-fun tp!78560 () Bool)

(declare-fun e!617224 () Bool)

(assert (=> mapNonEmpty!41098 (= mapRes!41098 (and tp!78560 e!617224))))

(declare-datatypes ((V!40099 0))(
  ( (V!40100 (val!13171 Int)) )
))
(declare-datatypes ((ValueCell!12405 0))(
  ( (ValueCellFull!12405 (v!15792 V!40099)) (EmptyCell!12405) )
))
(declare-datatypes ((array!69415 0))(
  ( (array!69416 (arr!33381 (Array (_ BitVec 32) ValueCell!12405)) (size!33917 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69415)

(declare-fun mapValue!41098 () ValueCell!12405)

(declare-fun mapRest!41098 () (Array (_ BitVec 32) ValueCell!12405))

(declare-fun mapKey!41098 () (_ BitVec 32))

(assert (=> mapNonEmpty!41098 (= (arr!33381 _values!874) (store mapRest!41098 mapKey!41098 mapValue!41098))))

(declare-fun b!1079602 () Bool)

(declare-fun res!719468 () Bool)

(assert (=> b!1079602 (=> (not res!719468) (not e!617220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079602 (= res!719468 (validKeyInArray!0 k0!904))))

(declare-fun b!1079604 () Bool)

(declare-fun res!719463 () Bool)

(assert (=> b!1079604 (=> (not res!719463) (not e!617220))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69413 (_ BitVec 32)) Bool)

(assert (=> b!1079604 (= res!719463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079605 () Bool)

(declare-fun res!719464 () Bool)

(assert (=> b!1079605 (=> (not res!719464) (not e!617220))))

(assert (=> b!1079605 (= res!719464 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33916 _keys!1070))))))

(declare-fun b!1079606 () Bool)

(declare-fun res!719462 () Bool)

(assert (=> b!1079606 (=> (not res!719462) (not e!617220))))

(declare-datatypes ((List!23264 0))(
  ( (Nil!23261) (Cons!23260 (h!24469 (_ BitVec 64)) (t!32623 List!23264)) )
))
(declare-fun arrayNoDuplicates!0 (array!69413 (_ BitVec 32) List!23264) Bool)

(assert (=> b!1079606 (= res!719462 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23261))))

(declare-fun b!1079607 () Bool)

(declare-fun res!719466 () Bool)

(declare-fun e!617221 () Bool)

(assert (=> b!1079607 (=> (not res!719466) (not e!617221))))

(declare-fun lt!478839 () array!69413)

(assert (=> b!1079607 (= res!719466 (arrayNoDuplicates!0 lt!478839 #b00000000000000000000000000000000 Nil!23261))))

(declare-fun b!1079608 () Bool)

(declare-fun tp_is_empty!26229 () Bool)

(assert (=> b!1079608 (= e!617224 tp_is_empty!26229)))

(declare-fun b!1079609 () Bool)

(declare-fun e!617225 () Bool)

(declare-fun e!617222 () Bool)

(assert (=> b!1079609 (= e!617225 (and e!617222 mapRes!41098))))

(declare-fun condMapEmpty!41098 () Bool)

(declare-fun mapDefault!41098 () ValueCell!12405)

(assert (=> b!1079609 (= condMapEmpty!41098 (= (arr!33381 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12405)) mapDefault!41098)))))

(declare-fun mapIsEmpty!41098 () Bool)

(assert (=> mapIsEmpty!41098 mapRes!41098))

(declare-fun b!1079610 () Bool)

(assert (=> b!1079610 (= e!617220 e!617221)))

(declare-fun res!719467 () Bool)

(assert (=> b!1079610 (=> (not res!719467) (not e!617221))))

(assert (=> b!1079610 (= res!719467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478839 mask!1414))))

(assert (=> b!1079610 (= lt!478839 (array!69414 (store (arr!33380 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33916 _keys!1070)))))

(declare-fun b!1079603 () Bool)

(assert (=> b!1079603 (= e!617221 (not true))))

(declare-fun arrayContainsKey!0 (array!69413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079603 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35498 0))(
  ( (Unit!35499) )
))
(declare-fun lt!478840 () Unit!35498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69413 (_ BitVec 64) (_ BitVec 32)) Unit!35498)

(assert (=> b!1079603 (= lt!478840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!719465 () Bool)

(assert (=> start!95574 (=> (not res!719465) (not e!617220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95574 (= res!719465 (validMask!0 mask!1414))))

(assert (=> start!95574 e!617220))

(assert (=> start!95574 true))

(declare-fun array_inv!25778 (array!69413) Bool)

(assert (=> start!95574 (array_inv!25778 _keys!1070)))

(declare-fun array_inv!25779 (array!69415) Bool)

(assert (=> start!95574 (and (array_inv!25779 _values!874) e!617225)))

(declare-fun b!1079611 () Bool)

(assert (=> b!1079611 (= e!617222 tp_is_empty!26229)))

(declare-fun b!1079612 () Bool)

(declare-fun res!719469 () Bool)

(assert (=> b!1079612 (=> (not res!719469) (not e!617220))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079612 (= res!719469 (and (= (size!33917 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33916 _keys!1070) (size!33917 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95574 res!719465) b!1079612))

(assert (= (and b!1079612 res!719469) b!1079604))

(assert (= (and b!1079604 res!719463) b!1079606))

(assert (= (and b!1079606 res!719462) b!1079605))

(assert (= (and b!1079605 res!719464) b!1079602))

(assert (= (and b!1079602 res!719468) b!1079601))

(assert (= (and b!1079601 res!719461) b!1079610))

(assert (= (and b!1079610 res!719467) b!1079607))

(assert (= (and b!1079607 res!719466) b!1079603))

(assert (= (and b!1079609 condMapEmpty!41098) mapIsEmpty!41098))

(assert (= (and b!1079609 (not condMapEmpty!41098)) mapNonEmpty!41098))

(get-info :version)

(assert (= (and mapNonEmpty!41098 ((_ is ValueCellFull!12405) mapValue!41098)) b!1079608))

(assert (= (and b!1079609 ((_ is ValueCellFull!12405) mapDefault!41098)) b!1079611))

(assert (= start!95574 b!1079609))

(declare-fun m!997767 () Bool)

(assert (=> b!1079604 m!997767))

(declare-fun m!997769 () Bool)

(assert (=> b!1079603 m!997769))

(declare-fun m!997771 () Bool)

(assert (=> b!1079603 m!997771))

(declare-fun m!997773 () Bool)

(assert (=> b!1079610 m!997773))

(declare-fun m!997775 () Bool)

(assert (=> b!1079610 m!997775))

(declare-fun m!997777 () Bool)

(assert (=> b!1079601 m!997777))

(declare-fun m!997779 () Bool)

(assert (=> mapNonEmpty!41098 m!997779))

(declare-fun m!997781 () Bool)

(assert (=> b!1079602 m!997781))

(declare-fun m!997783 () Bool)

(assert (=> b!1079607 m!997783))

(declare-fun m!997785 () Bool)

(assert (=> start!95574 m!997785))

(declare-fun m!997787 () Bool)

(assert (=> start!95574 m!997787))

(declare-fun m!997789 () Bool)

(assert (=> start!95574 m!997789))

(declare-fun m!997791 () Bool)

(assert (=> b!1079606 m!997791))

(check-sat tp_is_empty!26229 (not mapNonEmpty!41098) (not b!1079602) (not b!1079607) (not b!1079603) (not b!1079610) (not b!1079604) (not start!95574) (not b!1079606))
(check-sat)
