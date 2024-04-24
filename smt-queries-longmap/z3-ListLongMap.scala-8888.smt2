; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108148 () Bool)

(assert start!108148)

(declare-fun mapNonEmpty!51374 () Bool)

(declare-fun mapRes!51374 () Bool)

(declare-fun tp!98132 () Bool)

(declare-fun e!728815 () Bool)

(assert (=> mapNonEmpty!51374 (= mapRes!51374 (and tp!98132 e!728815))))

(declare-fun mapKey!51374 () (_ BitVec 32))

(declare-datatypes ((V!49425 0))(
  ( (V!49426 (val!16695 Int)) )
))
(declare-datatypes ((ValueCell!15722 0))(
  ( (ValueCellFull!15722 (v!19286 V!49425)) (EmptyCell!15722) )
))
(declare-fun mapValue!51374 () ValueCell!15722)

(declare-datatypes ((array!83603 0))(
  ( (array!83604 (arr!40314 (Array (_ BitVec 32) ValueCell!15722)) (size!40865 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83603)

(declare-fun mapRest!51374 () (Array (_ BitVec 32) ValueCell!15722))

(assert (=> mapNonEmpty!51374 (= (arr!40314 _values!1187) (store mapRest!51374 mapKey!51374 mapValue!51374))))

(declare-fun res!848201 () Bool)

(declare-fun e!728814 () Bool)

(assert (=> start!108148 (=> (not res!848201) (not e!728814))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108148 (= res!848201 (validMask!0 mask!1805))))

(assert (=> start!108148 e!728814))

(assert (=> start!108148 true))

(declare-fun e!728813 () Bool)

(declare-fun array_inv!30823 (array!83603) Bool)

(assert (=> start!108148 (and (array_inv!30823 _values!1187) e!728813)))

(declare-datatypes ((array!83605 0))(
  ( (array!83606 (arr!40315 (Array (_ BitVec 32) (_ BitVec 64))) (size!40866 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83605)

(declare-fun array_inv!30824 (array!83605) Bool)

(assert (=> start!108148 (array_inv!30824 _keys!1427)))

(declare-fun b!1276581 () Bool)

(declare-fun e!728812 () Bool)

(declare-fun tp_is_empty!33241 () Bool)

(assert (=> b!1276581 (= e!728812 tp_is_empty!33241)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun b!1276582 () Bool)

(assert (=> b!1276582 (= e!728814 (and (= (size!40865 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40866 _keys!1427) (size!40865 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (= (size!40866 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)) (bvsgt #b00000000000000000000000000000000 (size!40866 _keys!1427))))))

(declare-fun mapIsEmpty!51374 () Bool)

(assert (=> mapIsEmpty!51374 mapRes!51374))

(declare-fun b!1276583 () Bool)

(assert (=> b!1276583 (= e!728815 tp_is_empty!33241)))

(declare-fun b!1276584 () Bool)

(assert (=> b!1276584 (= e!728813 (and e!728812 mapRes!51374))))

(declare-fun condMapEmpty!51374 () Bool)

(declare-fun mapDefault!51374 () ValueCell!15722)

(assert (=> b!1276584 (= condMapEmpty!51374 (= (arr!40314 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15722)) mapDefault!51374)))))

(assert (= (and start!108148 res!848201) b!1276582))

(assert (= (and b!1276584 condMapEmpty!51374) mapIsEmpty!51374))

(assert (= (and b!1276584 (not condMapEmpty!51374)) mapNonEmpty!51374))

(get-info :version)

(assert (= (and mapNonEmpty!51374 ((_ is ValueCellFull!15722) mapValue!51374)) b!1276583))

(assert (= (and b!1276584 ((_ is ValueCellFull!15722) mapDefault!51374)) b!1276581))

(assert (= start!108148 b!1276584))

(declare-fun m!1173203 () Bool)

(assert (=> mapNonEmpty!51374 m!1173203))

(declare-fun m!1173205 () Bool)

(assert (=> start!108148 m!1173205))

(declare-fun m!1173207 () Bool)

(assert (=> start!108148 m!1173207))

(declare-fun m!1173209 () Bool)

(assert (=> start!108148 m!1173209))

(check-sat (not start!108148) (not mapNonEmpty!51374) tp_is_empty!33241)
(check-sat)
(get-model)

(declare-fun d!140787 () Bool)

(assert (=> d!140787 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108148 d!140787))

(declare-fun d!140789 () Bool)

(assert (=> d!140789 (= (array_inv!30823 _values!1187) (bvsge (size!40865 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108148 d!140789))

(declare-fun d!140791 () Bool)

(assert (=> d!140791 (= (array_inv!30824 _keys!1427) (bvsge (size!40866 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108148 d!140791))

(declare-fun b!1276616 () Bool)

(declare-fun e!728852 () Bool)

(assert (=> b!1276616 (= e!728852 tp_is_empty!33241)))

(declare-fun condMapEmpty!51383 () Bool)

(declare-fun mapDefault!51383 () ValueCell!15722)

(assert (=> mapNonEmpty!51374 (= condMapEmpty!51383 (= mapRest!51374 ((as const (Array (_ BitVec 32) ValueCell!15722)) mapDefault!51383)))))

(declare-fun mapRes!51383 () Bool)

(assert (=> mapNonEmpty!51374 (= tp!98132 (and e!728852 mapRes!51383))))

(declare-fun b!1276615 () Bool)

(declare-fun e!728851 () Bool)

(assert (=> b!1276615 (= e!728851 tp_is_empty!33241)))

(declare-fun mapIsEmpty!51383 () Bool)

(assert (=> mapIsEmpty!51383 mapRes!51383))

(declare-fun mapNonEmpty!51383 () Bool)

(declare-fun tp!98141 () Bool)

(assert (=> mapNonEmpty!51383 (= mapRes!51383 (and tp!98141 e!728851))))

(declare-fun mapValue!51383 () ValueCell!15722)

(declare-fun mapKey!51383 () (_ BitVec 32))

(declare-fun mapRest!51383 () (Array (_ BitVec 32) ValueCell!15722))

(assert (=> mapNonEmpty!51383 (= mapRest!51374 (store mapRest!51383 mapKey!51383 mapValue!51383))))

(assert (= (and mapNonEmpty!51374 condMapEmpty!51383) mapIsEmpty!51383))

(assert (= (and mapNonEmpty!51374 (not condMapEmpty!51383)) mapNonEmpty!51383))

(assert (= (and mapNonEmpty!51383 ((_ is ValueCellFull!15722) mapValue!51383)) b!1276615))

(assert (= (and mapNonEmpty!51374 ((_ is ValueCellFull!15722) mapDefault!51383)) b!1276616))

(declare-fun m!1173227 () Bool)

(assert (=> mapNonEmpty!51383 m!1173227))

(check-sat (not mapNonEmpty!51383) tp_is_empty!33241)
(check-sat)
