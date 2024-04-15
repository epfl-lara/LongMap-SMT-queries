; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107924 () Bool)

(assert start!107924)

(declare-fun b!1275212 () Bool)

(declare-fun e!727936 () Bool)

(declare-fun tp_is_empty!33241 () Bool)

(assert (=> b!1275212 (= e!727936 tp_is_empty!33241)))

(declare-fun b!1275213 () Bool)

(declare-fun e!727938 () Bool)

(assert (=> b!1275213 (= e!727938 tp_is_empty!33241)))

(declare-fun mapNonEmpty!51374 () Bool)

(declare-fun mapRes!51374 () Bool)

(declare-fun tp!98133 () Bool)

(assert (=> mapNonEmpty!51374 (= mapRes!51374 (and tp!98133 e!727936))))

(declare-datatypes ((V!49425 0))(
  ( (V!49426 (val!16695 Int)) )
))
(declare-datatypes ((ValueCell!15722 0))(
  ( (ValueCellFull!15722 (v!19290 V!49425)) (EmptyCell!15722) )
))
(declare-fun mapValue!51374 () ValueCell!15722)

(declare-fun mapKey!51374 () (_ BitVec 32))

(declare-datatypes ((array!83487 0))(
  ( (array!83488 (arr!40261 (Array (_ BitVec 32) ValueCell!15722)) (size!40813 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83487)

(declare-fun mapRest!51374 () (Array (_ BitVec 32) ValueCell!15722))

(assert (=> mapNonEmpty!51374 (= (arr!40261 _values!1187) (store mapRest!51374 mapKey!51374 mapValue!51374))))

(declare-fun b!1275214 () Bool)

(declare-fun e!727940 () Bool)

(assert (=> b!1275214 (= e!727940 (and e!727938 mapRes!51374))))

(declare-fun condMapEmpty!51374 () Bool)

(declare-fun mapDefault!51374 () ValueCell!15722)

(assert (=> b!1275214 (= condMapEmpty!51374 (= (arr!40261 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15722)) mapDefault!51374)))))

(declare-fun mapIsEmpty!51374 () Bool)

(assert (=> mapIsEmpty!51374 mapRes!51374))

(declare-fun res!847654 () Bool)

(declare-fun e!727937 () Bool)

(assert (=> start!107924 (=> (not res!847654) (not e!727937))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107924 (= res!847654 (validMask!0 mask!1805))))

(assert (=> start!107924 e!727937))

(assert (=> start!107924 true))

(declare-fun array_inv!30757 (array!83487) Bool)

(assert (=> start!107924 (and (array_inv!30757 _values!1187) e!727940)))

(declare-datatypes ((array!83489 0))(
  ( (array!83490 (arr!40262 (Array (_ BitVec 32) (_ BitVec 64))) (size!40814 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83489)

(declare-fun array_inv!30758 (array!83489) Bool)

(assert (=> start!107924 (array_inv!30758 _keys!1427)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun b!1275215 () Bool)

(assert (=> b!1275215 (= e!727937 (and (= (size!40813 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40814 _keys!1427) (size!40813 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (= (size!40814 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)) (bvsgt #b00000000000000000000000000000000 (size!40814 _keys!1427))))))

(assert (= (and start!107924 res!847654) b!1275215))

(assert (= (and b!1275214 condMapEmpty!51374) mapIsEmpty!51374))

(assert (= (and b!1275214 (not condMapEmpty!51374)) mapNonEmpty!51374))

(get-info :version)

(assert (= (and mapNonEmpty!51374 ((_ is ValueCellFull!15722) mapValue!51374)) b!1275212))

(assert (= (and b!1275214 ((_ is ValueCellFull!15722) mapDefault!51374)) b!1275213))

(assert (= start!107924 b!1275214))

(declare-fun m!1171091 () Bool)

(assert (=> mapNonEmpty!51374 m!1171091))

(declare-fun m!1171093 () Bool)

(assert (=> start!107924 m!1171093))

(declare-fun m!1171095 () Bool)

(assert (=> start!107924 m!1171095))

(declare-fun m!1171097 () Bool)

(assert (=> start!107924 m!1171097))

(check-sat (not start!107924) (not mapNonEmpty!51374) tp_is_empty!33241)
(check-sat)
(get-model)

(declare-fun d!140227 () Bool)

(assert (=> d!140227 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107924 d!140227))

(declare-fun d!140229 () Bool)

(assert (=> d!140229 (= (array_inv!30757 _values!1187) (bvsge (size!40813 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107924 d!140229))

(declare-fun d!140231 () Bool)

(assert (=> d!140231 (= (array_inv!30758 _keys!1427) (bvsge (size!40814 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107924 d!140231))

(declare-fun b!1275246 () Bool)

(declare-fun e!727976 () Bool)

(assert (=> b!1275246 (= e!727976 tp_is_empty!33241)))

(declare-fun b!1275247 () Bool)

(declare-fun e!727975 () Bool)

(assert (=> b!1275247 (= e!727975 tp_is_empty!33241)))

(declare-fun mapNonEmpty!51383 () Bool)

(declare-fun mapRes!51383 () Bool)

(declare-fun tp!98142 () Bool)

(assert (=> mapNonEmpty!51383 (= mapRes!51383 (and tp!98142 e!727976))))

(declare-fun mapRest!51383 () (Array (_ BitVec 32) ValueCell!15722))

(declare-fun mapKey!51383 () (_ BitVec 32))

(declare-fun mapValue!51383 () ValueCell!15722)

(assert (=> mapNonEmpty!51383 (= mapRest!51374 (store mapRest!51383 mapKey!51383 mapValue!51383))))

(declare-fun condMapEmpty!51383 () Bool)

(declare-fun mapDefault!51383 () ValueCell!15722)

(assert (=> mapNonEmpty!51374 (= condMapEmpty!51383 (= mapRest!51374 ((as const (Array (_ BitVec 32) ValueCell!15722)) mapDefault!51383)))))

(assert (=> mapNonEmpty!51374 (= tp!98133 (and e!727975 mapRes!51383))))

(declare-fun mapIsEmpty!51383 () Bool)

(assert (=> mapIsEmpty!51383 mapRes!51383))

(assert (= (and mapNonEmpty!51374 condMapEmpty!51383) mapIsEmpty!51383))

(assert (= (and mapNonEmpty!51374 (not condMapEmpty!51383)) mapNonEmpty!51383))

(assert (= (and mapNonEmpty!51383 ((_ is ValueCellFull!15722) mapValue!51383)) b!1275246))

(assert (= (and mapNonEmpty!51374 ((_ is ValueCellFull!15722) mapDefault!51383)) b!1275247))

(declare-fun m!1171115 () Bool)

(assert (=> mapNonEmpty!51383 m!1171115))

(check-sat (not mapNonEmpty!51383) tp_is_empty!33241)
(check-sat)
