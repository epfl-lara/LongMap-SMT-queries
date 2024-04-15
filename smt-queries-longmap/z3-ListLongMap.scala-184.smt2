; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3670 () Bool)

(assert start!3670)

(declare-fun b!25726 () Bool)

(declare-fun e!16646 () Bool)

(declare-fun e!16645 () Bool)

(declare-fun mapRes!1069 () Bool)

(assert (=> b!25726 (= e!16646 (and e!16645 mapRes!1069))))

(declare-fun condMapEmpty!1069 () Bool)

(declare-datatypes ((V!1219 0))(
  ( (V!1220 (val!549 Int)) )
))
(declare-datatypes ((ValueCell!323 0))(
  ( (ValueCellFull!323 (v!1633 V!1219)) (EmptyCell!323) )
))
(declare-datatypes ((array!1311 0))(
  ( (array!1312 (arr!618 (Array (_ BitVec 32) ValueCell!323)) (size!719 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1311)

(declare-fun mapDefault!1069 () ValueCell!323)

(assert (=> b!25726 (= condMapEmpty!1069 (= (arr!618 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!323)) mapDefault!1069)))))

(declare-fun mapNonEmpty!1069 () Bool)

(declare-fun tp!3589 () Bool)

(declare-fun e!16642 () Bool)

(assert (=> mapNonEmpty!1069 (= mapRes!1069 (and tp!3589 e!16642))))

(declare-fun mapRest!1069 () (Array (_ BitVec 32) ValueCell!323))

(declare-fun mapValue!1069 () ValueCell!323)

(declare-fun mapKey!1069 () (_ BitVec 32))

(assert (=> mapNonEmpty!1069 (= (arr!618 _values!1501) (store mapRest!1069 mapKey!1069 mapValue!1069))))

(declare-fun b!25727 () Bool)

(declare-fun tp_is_empty!1045 () Bool)

(assert (=> b!25727 (= e!16642 tp_is_empty!1045)))

(declare-fun res!15332 () Bool)

(declare-fun e!16644 () Bool)

(assert (=> start!3670 (=> (not res!15332) (not e!16644))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3670 (= res!15332 (validMask!0 mask!2294))))

(assert (=> start!3670 e!16644))

(assert (=> start!3670 true))

(declare-fun array_inv!433 (array!1311) Bool)

(assert (=> start!3670 (and (array_inv!433 _values!1501) e!16646)))

(declare-datatypes ((array!1313 0))(
  ( (array!1314 (arr!619 (Array (_ BitVec 32) (_ BitVec 64))) (size!720 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1313)

(declare-fun array_inv!434 (array!1313) Bool)

(assert (=> start!3670 (array_inv!434 _keys!1833)))

(declare-fun mapIsEmpty!1069 () Bool)

(assert (=> mapIsEmpty!1069 mapRes!1069))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun b!25728 () Bool)

(assert (=> b!25728 (= e!16644 (and (= (size!719 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!720 _keys!1833) (size!719 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (= (size!720 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)) (bvsgt #b00000000000000000000000000000000 (size!720 _keys!1833))))))

(declare-fun b!25729 () Bool)

(assert (=> b!25729 (= e!16645 tp_is_empty!1045)))

(assert (= (and start!3670 res!15332) b!25728))

(assert (= (and b!25726 condMapEmpty!1069) mapIsEmpty!1069))

(assert (= (and b!25726 (not condMapEmpty!1069)) mapNonEmpty!1069))

(get-info :version)

(assert (= (and mapNonEmpty!1069 ((_ is ValueCellFull!323) mapValue!1069)) b!25727))

(assert (= (and b!25726 ((_ is ValueCellFull!323) mapDefault!1069)) b!25729))

(assert (= start!3670 b!25726))

(declare-fun m!20727 () Bool)

(assert (=> mapNonEmpty!1069 m!20727))

(declare-fun m!20729 () Bool)

(assert (=> start!3670 m!20729))

(declare-fun m!20731 () Bool)

(assert (=> start!3670 m!20731))

(declare-fun m!20733 () Bool)

(assert (=> start!3670 m!20733))

(check-sat (not start!3670) (not mapNonEmpty!1069) tp_is_empty!1045)
(check-sat)
(get-model)

(declare-fun d!4785 () Bool)

(assert (=> d!4785 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3670 d!4785))

(declare-fun d!4787 () Bool)

(assert (=> d!4787 (= (array_inv!433 _values!1501) (bvsge (size!719 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3670 d!4787))

(declare-fun d!4789 () Bool)

(assert (=> d!4789 (= (array_inv!434 _keys!1833) (bvsge (size!720 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3670 d!4789))

(declare-fun b!25761 () Bool)

(declare-fun e!16681 () Bool)

(assert (=> b!25761 (= e!16681 tp_is_empty!1045)))

(declare-fun condMapEmpty!1078 () Bool)

(declare-fun mapDefault!1078 () ValueCell!323)

(assert (=> mapNonEmpty!1069 (= condMapEmpty!1078 (= mapRest!1069 ((as const (Array (_ BitVec 32) ValueCell!323)) mapDefault!1078)))))

(declare-fun mapRes!1078 () Bool)

(assert (=> mapNonEmpty!1069 (= tp!3589 (and e!16681 mapRes!1078))))

(declare-fun b!25760 () Bool)

(declare-fun e!16682 () Bool)

(assert (=> b!25760 (= e!16682 tp_is_empty!1045)))

(declare-fun mapNonEmpty!1078 () Bool)

(declare-fun tp!3598 () Bool)

(assert (=> mapNonEmpty!1078 (= mapRes!1078 (and tp!3598 e!16682))))

(declare-fun mapValue!1078 () ValueCell!323)

(declare-fun mapKey!1078 () (_ BitVec 32))

(declare-fun mapRest!1078 () (Array (_ BitVec 32) ValueCell!323))

(assert (=> mapNonEmpty!1078 (= mapRest!1069 (store mapRest!1078 mapKey!1078 mapValue!1078))))

(declare-fun mapIsEmpty!1078 () Bool)

(assert (=> mapIsEmpty!1078 mapRes!1078))

(assert (= (and mapNonEmpty!1069 condMapEmpty!1078) mapIsEmpty!1078))

(assert (= (and mapNonEmpty!1069 (not condMapEmpty!1078)) mapNonEmpty!1078))

(assert (= (and mapNonEmpty!1078 ((_ is ValueCellFull!323) mapValue!1078)) b!25760))

(assert (= (and mapNonEmpty!1069 ((_ is ValueCellFull!323) mapDefault!1078)) b!25761))

(declare-fun m!20751 () Bool)

(assert (=> mapNonEmpty!1078 m!20751))

(check-sat (not mapNonEmpty!1078) tp_is_empty!1045)
(check-sat)
