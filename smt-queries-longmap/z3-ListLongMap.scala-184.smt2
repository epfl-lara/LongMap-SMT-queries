; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3676 () Bool)

(assert start!3676)

(declare-fun res!15324 () Bool)

(declare-fun e!16635 () Bool)

(assert (=> start!3676 (=> (not res!15324) (not e!16635))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3676 (= res!15324 (validMask!0 mask!2294))))

(assert (=> start!3676 e!16635))

(assert (=> start!3676 true))

(declare-datatypes ((V!1219 0))(
  ( (V!1220 (val!549 Int)) )
))
(declare-datatypes ((ValueCell!323 0))(
  ( (ValueCellFull!323 (v!1634 V!1219)) (EmptyCell!323) )
))
(declare-datatypes ((array!1315 0))(
  ( (array!1316 (arr!620 (Array (_ BitVec 32) ValueCell!323)) (size!721 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1315)

(declare-fun e!16633 () Bool)

(declare-fun array_inv!437 (array!1315) Bool)

(assert (=> start!3676 (and (array_inv!437 _values!1501) e!16633)))

(declare-datatypes ((array!1317 0))(
  ( (array!1318 (arr!621 (Array (_ BitVec 32) (_ BitVec 64))) (size!722 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1317)

(declare-fun array_inv!438 (array!1317) Bool)

(assert (=> start!3676 (array_inv!438 _keys!1833)))

(declare-fun b!25708 () Bool)

(declare-fun e!16637 () Bool)

(declare-fun tp_is_empty!1045 () Bool)

(assert (=> b!25708 (= e!16637 tp_is_empty!1045)))

(declare-fun mapIsEmpty!1069 () Bool)

(declare-fun mapRes!1069 () Bool)

(assert (=> mapIsEmpty!1069 mapRes!1069))

(declare-fun b!25709 () Bool)

(declare-fun e!16634 () Bool)

(assert (=> b!25709 (= e!16634 tp_is_empty!1045)))

(declare-fun mapNonEmpty!1069 () Bool)

(declare-fun tp!3589 () Bool)

(assert (=> mapNonEmpty!1069 (= mapRes!1069 (and tp!3589 e!16634))))

(declare-fun mapRest!1069 () (Array (_ BitVec 32) ValueCell!323))

(declare-fun mapValue!1069 () ValueCell!323)

(declare-fun mapKey!1069 () (_ BitVec 32))

(assert (=> mapNonEmpty!1069 (= (arr!620 _values!1501) (store mapRest!1069 mapKey!1069 mapValue!1069))))

(declare-fun b!25710 () Bool)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25710 (= e!16635 (and (= (size!721 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!722 _keys!1833) (size!721 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (= (size!722 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)) (bvsgt #b00000000000000000000000000000000 (size!722 _keys!1833))))))

(declare-fun b!25711 () Bool)

(assert (=> b!25711 (= e!16633 (and e!16637 mapRes!1069))))

(declare-fun condMapEmpty!1069 () Bool)

(declare-fun mapDefault!1069 () ValueCell!323)

(assert (=> b!25711 (= condMapEmpty!1069 (= (arr!620 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!323)) mapDefault!1069)))))

(assert (= (and start!3676 res!15324) b!25710))

(assert (= (and b!25711 condMapEmpty!1069) mapIsEmpty!1069))

(assert (= (and b!25711 (not condMapEmpty!1069)) mapNonEmpty!1069))

(get-info :version)

(assert (= (and mapNonEmpty!1069 ((_ is ValueCellFull!323) mapValue!1069)) b!25709))

(assert (= (and b!25711 ((_ is ValueCellFull!323) mapDefault!1069)) b!25708))

(assert (= start!3676 b!25711))

(declare-fun m!20645 () Bool)

(assert (=> start!3676 m!20645))

(declare-fun m!20647 () Bool)

(assert (=> start!3676 m!20647))

(declare-fun m!20649 () Bool)

(assert (=> start!3676 m!20649))

(declare-fun m!20651 () Bool)

(assert (=> mapNonEmpty!1069 m!20651))

(check-sat (not start!3676) (not mapNonEmpty!1069) tp_is_empty!1045)
(check-sat)
(get-model)

(declare-fun d!4787 () Bool)

(assert (=> d!4787 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3676 d!4787))

(declare-fun d!4789 () Bool)

(assert (=> d!4789 (= (array_inv!437 _values!1501) (bvsge (size!721 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3676 d!4789))

(declare-fun d!4791 () Bool)

(assert (=> d!4791 (= (array_inv!438 _keys!1833) (bvsge (size!722 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3676 d!4791))

(declare-fun mapNonEmpty!1078 () Bool)

(declare-fun mapRes!1078 () Bool)

(declare-fun tp!3598 () Bool)

(declare-fun e!16673 () Bool)

(assert (=> mapNonEmpty!1078 (= mapRes!1078 (and tp!3598 e!16673))))

(declare-fun mapKey!1078 () (_ BitVec 32))

(declare-fun mapValue!1078 () ValueCell!323)

(declare-fun mapRest!1078 () (Array (_ BitVec 32) ValueCell!323))

(assert (=> mapNonEmpty!1078 (= mapRest!1069 (store mapRest!1078 mapKey!1078 mapValue!1078))))

(declare-fun mapIsEmpty!1078 () Bool)

(assert (=> mapIsEmpty!1078 mapRes!1078))

(declare-fun b!25742 () Bool)

(assert (=> b!25742 (= e!16673 tp_is_empty!1045)))

(declare-fun b!25743 () Bool)

(declare-fun e!16672 () Bool)

(assert (=> b!25743 (= e!16672 tp_is_empty!1045)))

(declare-fun condMapEmpty!1078 () Bool)

(declare-fun mapDefault!1078 () ValueCell!323)

(assert (=> mapNonEmpty!1069 (= condMapEmpty!1078 (= mapRest!1069 ((as const (Array (_ BitVec 32) ValueCell!323)) mapDefault!1078)))))

(assert (=> mapNonEmpty!1069 (= tp!3589 (and e!16672 mapRes!1078))))

(assert (= (and mapNonEmpty!1069 condMapEmpty!1078) mapIsEmpty!1078))

(assert (= (and mapNonEmpty!1069 (not condMapEmpty!1078)) mapNonEmpty!1078))

(assert (= (and mapNonEmpty!1078 ((_ is ValueCellFull!323) mapValue!1078)) b!25742))

(assert (= (and mapNonEmpty!1069 ((_ is ValueCellFull!323) mapDefault!1078)) b!25743))

(declare-fun m!20669 () Bool)

(assert (=> mapNonEmpty!1078 m!20669))

(check-sat (not mapNonEmpty!1078) tp_is_empty!1045)
(check-sat)
