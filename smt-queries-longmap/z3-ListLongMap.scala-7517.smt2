; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95556 () Bool)

(assert start!95556)

(declare-fun b!1078331 () Bool)

(declare-fun e!616572 () Bool)

(declare-fun tp_is_empty!26077 () Bool)

(assert (=> b!1078331 (= e!616572 tp_is_empty!26077)))

(declare-fun b!1078332 () Bool)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun e!616569 () Bool)

(declare-datatypes ((array!69141 0))(
  ( (array!69142 (arr!33247 (Array (_ BitVec 32) (_ BitVec 64))) (size!33784 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69141)

(declare-datatypes ((V!39897 0))(
  ( (V!39898 (val!13095 Int)) )
))
(declare-datatypes ((ValueCell!12329 0))(
  ( (ValueCellFull!12329 (v!15710 V!39897)) (EmptyCell!12329) )
))
(declare-datatypes ((array!69143 0))(
  ( (array!69144 (arr!33248 (Array (_ BitVec 32) ValueCell!12329)) (size!33785 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69143)

(assert (=> b!1078332 (= e!616569 (and (= (size!33785 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33784 _keys!1070) (size!33785 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (= (size!33784 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33784 _keys!1070))))))

(declare-fun mapNonEmpty!40843 () Bool)

(declare-fun mapRes!40843 () Bool)

(declare-fun tp!78305 () Bool)

(assert (=> mapNonEmpty!40843 (= mapRes!40843 (and tp!78305 e!616572))))

(declare-fun mapRest!40843 () (Array (_ BitVec 32) ValueCell!12329))

(declare-fun mapKey!40843 () (_ BitVec 32))

(declare-fun mapValue!40843 () ValueCell!12329)

(assert (=> mapNonEmpty!40843 (= (arr!33248 _values!874) (store mapRest!40843 mapKey!40843 mapValue!40843))))

(declare-fun mapIsEmpty!40843 () Bool)

(assert (=> mapIsEmpty!40843 mapRes!40843))

(declare-fun b!1078333 () Bool)

(declare-fun e!616570 () Bool)

(declare-fun e!616568 () Bool)

(assert (=> b!1078333 (= e!616570 (and e!616568 mapRes!40843))))

(declare-fun condMapEmpty!40843 () Bool)

(declare-fun mapDefault!40843 () ValueCell!12329)

(assert (=> b!1078333 (= condMapEmpty!40843 (= (arr!33248 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12329)) mapDefault!40843)))))

(declare-fun b!1078334 () Bool)

(assert (=> b!1078334 (= e!616568 tp_is_empty!26077)))

(declare-fun res!718224 () Bool)

(assert (=> start!95556 (=> (not res!718224) (not e!616569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95556 (= res!718224 (validMask!0 mask!1414))))

(assert (=> start!95556 e!616569))

(assert (=> start!95556 true))

(declare-fun array_inv!25730 (array!69143) Bool)

(assert (=> start!95556 (and (array_inv!25730 _values!874) e!616570)))

(declare-fun array_inv!25731 (array!69141) Bool)

(assert (=> start!95556 (array_inv!25731 _keys!1070)))

(assert (= (and start!95556 res!718224) b!1078332))

(assert (= (and b!1078333 condMapEmpty!40843) mapIsEmpty!40843))

(assert (= (and b!1078333 (not condMapEmpty!40843)) mapNonEmpty!40843))

(get-info :version)

(assert (= (and mapNonEmpty!40843 ((_ is ValueCellFull!12329) mapValue!40843)) b!1078331))

(assert (= (and b!1078333 ((_ is ValueCellFull!12329) mapDefault!40843)) b!1078334))

(assert (= start!95556 b!1078333))

(declare-fun m!997703 () Bool)

(assert (=> mapNonEmpty!40843 m!997703))

(declare-fun m!997705 () Bool)

(assert (=> start!95556 m!997705))

(declare-fun m!997707 () Bool)

(assert (=> start!95556 m!997707))

(declare-fun m!997709 () Bool)

(assert (=> start!95556 m!997709))

(check-sat (not start!95556) (not mapNonEmpty!40843) tp_is_empty!26077)
(check-sat)
(get-model)

(declare-fun d!130261 () Bool)

(assert (=> d!130261 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95556 d!130261))

(declare-fun d!130263 () Bool)

(assert (=> d!130263 (= (array_inv!25730 _values!874) (bvsge (size!33785 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95556 d!130263))

(declare-fun d!130265 () Bool)

(assert (=> d!130265 (= (array_inv!25731 _keys!1070) (bvsge (size!33784 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95556 d!130265))

(declare-fun b!1078366 () Bool)

(declare-fun e!616607 () Bool)

(assert (=> b!1078366 (= e!616607 tp_is_empty!26077)))

(declare-fun b!1078365 () Bool)

(declare-fun e!616608 () Bool)

(assert (=> b!1078365 (= e!616608 tp_is_empty!26077)))

(declare-fun mapIsEmpty!40852 () Bool)

(declare-fun mapRes!40852 () Bool)

(assert (=> mapIsEmpty!40852 mapRes!40852))

(declare-fun mapNonEmpty!40852 () Bool)

(declare-fun tp!78314 () Bool)

(assert (=> mapNonEmpty!40852 (= mapRes!40852 (and tp!78314 e!616608))))

(declare-fun mapValue!40852 () ValueCell!12329)

(declare-fun mapRest!40852 () (Array (_ BitVec 32) ValueCell!12329))

(declare-fun mapKey!40852 () (_ BitVec 32))

(assert (=> mapNonEmpty!40852 (= mapRest!40843 (store mapRest!40852 mapKey!40852 mapValue!40852))))

(declare-fun condMapEmpty!40852 () Bool)

(declare-fun mapDefault!40852 () ValueCell!12329)

(assert (=> mapNonEmpty!40843 (= condMapEmpty!40852 (= mapRest!40843 ((as const (Array (_ BitVec 32) ValueCell!12329)) mapDefault!40852)))))

(assert (=> mapNonEmpty!40843 (= tp!78305 (and e!616607 mapRes!40852))))

(assert (= (and mapNonEmpty!40843 condMapEmpty!40852) mapIsEmpty!40852))

(assert (= (and mapNonEmpty!40843 (not condMapEmpty!40852)) mapNonEmpty!40852))

(assert (= (and mapNonEmpty!40852 ((_ is ValueCellFull!12329) mapValue!40852)) b!1078365))

(assert (= (and mapNonEmpty!40843 ((_ is ValueCellFull!12329) mapDefault!40852)) b!1078366))

(declare-fun m!997727 () Bool)

(assert (=> mapNonEmpty!40852 m!997727))

(check-sat (not mapNonEmpty!40852) tp_is_empty!26077)
(check-sat)
