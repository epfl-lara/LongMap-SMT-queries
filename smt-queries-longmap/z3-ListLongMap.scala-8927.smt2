; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108246 () Bool)

(assert start!108246)

(declare-fun b!1278145 () Bool)

(declare-fun e!730046 () Bool)

(declare-fun tp_is_empty!33477 () Bool)

(assert (=> b!1278145 (= e!730046 tp_is_empty!33477)))

(declare-fun b!1278146 () Bool)

(declare-fun e!730049 () Bool)

(declare-fun e!730050 () Bool)

(declare-fun mapRes!51752 () Bool)

(assert (=> b!1278146 (= e!730049 (and e!730050 mapRes!51752))))

(declare-fun condMapEmpty!51752 () Bool)

(declare-datatypes ((V!49739 0))(
  ( (V!49740 (val!16813 Int)) )
))
(declare-datatypes ((ValueCell!15840 0))(
  ( (ValueCellFull!15840 (v!19412 V!49739)) (EmptyCell!15840) )
))
(declare-datatypes ((array!84042 0))(
  ( (array!84043 (arr!40530 (Array (_ BitVec 32) ValueCell!15840)) (size!41080 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84042)

(declare-fun mapDefault!51752 () ValueCell!15840)

(assert (=> b!1278146 (= condMapEmpty!51752 (= (arr!40530 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15840)) mapDefault!51752)))))

(declare-fun res!849198 () Bool)

(declare-fun e!730048 () Bool)

(assert (=> start!108246 (=> (not res!849198) (not e!730048))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108246 (= res!849198 (validMask!0 mask!2175))))

(assert (=> start!108246 e!730048))

(assert (=> start!108246 true))

(declare-fun array_inv!30789 (array!84042) Bool)

(assert (=> start!108246 (and (array_inv!30789 _values!1445) e!730049)))

(declare-datatypes ((array!84044 0))(
  ( (array!84045 (arr!40531 (Array (_ BitVec 32) (_ BitVec 64))) (size!41081 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84044)

(declare-fun array_inv!30790 (array!84044) Bool)

(assert (=> start!108246 (array_inv!30790 _keys!1741)))

(declare-fun mapIsEmpty!51752 () Bool)

(assert (=> mapIsEmpty!51752 mapRes!51752))

(declare-fun b!1278147 () Bool)

(assert (=> b!1278147 (= e!730050 tp_is_empty!33477)))

(declare-fun mapNonEmpty!51752 () Bool)

(declare-fun tp!98726 () Bool)

(assert (=> mapNonEmpty!51752 (= mapRes!51752 (and tp!98726 e!730046))))

(declare-fun mapValue!51752 () ValueCell!15840)

(declare-fun mapRest!51752 () (Array (_ BitVec 32) ValueCell!15840))

(declare-fun mapKey!51752 () (_ BitVec 32))

(assert (=> mapNonEmpty!51752 (= (arr!40530 _values!1445) (store mapRest!51752 mapKey!51752 mapValue!51752))))

(declare-fun b!1278148 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278148 (= e!730048 (and (= (size!41080 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41081 _keys!1741) (size!41080 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (= (size!41081 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)) (bvsgt #b00000000000000000000000000000000 (size!41081 _keys!1741))))))

(assert (= (and start!108246 res!849198) b!1278148))

(assert (= (and b!1278146 condMapEmpty!51752) mapIsEmpty!51752))

(assert (= (and b!1278146 (not condMapEmpty!51752)) mapNonEmpty!51752))

(get-info :version)

(assert (= (and mapNonEmpty!51752 ((_ is ValueCellFull!15840) mapValue!51752)) b!1278145))

(assert (= (and b!1278146 ((_ is ValueCellFull!15840) mapDefault!51752)) b!1278147))

(assert (= start!108246 b!1278146))

(declare-fun m!1173573 () Bool)

(assert (=> start!108246 m!1173573))

(declare-fun m!1173575 () Bool)

(assert (=> start!108246 m!1173575))

(declare-fun m!1173577 () Bool)

(assert (=> start!108246 m!1173577))

(declare-fun m!1173579 () Bool)

(assert (=> mapNonEmpty!51752 m!1173579))

(check-sat (not start!108246) (not mapNonEmpty!51752) tp_is_empty!33477)
(check-sat)
(get-model)

(declare-fun d!140505 () Bool)

(assert (=> d!140505 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108246 d!140505))

(declare-fun d!140507 () Bool)

(assert (=> d!140507 (= (array_inv!30789 _values!1445) (bvsge (size!41080 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108246 d!140507))

(declare-fun d!140509 () Bool)

(assert (=> d!140509 (= (array_inv!30790 _keys!1741) (bvsge (size!41081 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108246 d!140509))

(declare-fun b!1278168 () Bool)

(declare-fun e!730071 () Bool)

(assert (=> b!1278168 (= e!730071 tp_is_empty!33477)))

(declare-fun mapIsEmpty!51758 () Bool)

(declare-fun mapRes!51758 () Bool)

(assert (=> mapIsEmpty!51758 mapRes!51758))

(declare-fun condMapEmpty!51758 () Bool)

(declare-fun mapDefault!51758 () ValueCell!15840)

(assert (=> mapNonEmpty!51752 (= condMapEmpty!51758 (= mapRest!51752 ((as const (Array (_ BitVec 32) ValueCell!15840)) mapDefault!51758)))))

(assert (=> mapNonEmpty!51752 (= tp!98726 (and e!730071 mapRes!51758))))

(declare-fun b!1278167 () Bool)

(declare-fun e!730070 () Bool)

(assert (=> b!1278167 (= e!730070 tp_is_empty!33477)))

(declare-fun mapNonEmpty!51758 () Bool)

(declare-fun tp!98732 () Bool)

(assert (=> mapNonEmpty!51758 (= mapRes!51758 (and tp!98732 e!730070))))

(declare-fun mapValue!51758 () ValueCell!15840)

(declare-fun mapRest!51758 () (Array (_ BitVec 32) ValueCell!15840))

(declare-fun mapKey!51758 () (_ BitVec 32))

(assert (=> mapNonEmpty!51758 (= mapRest!51752 (store mapRest!51758 mapKey!51758 mapValue!51758))))

(assert (= (and mapNonEmpty!51752 condMapEmpty!51758) mapIsEmpty!51758))

(assert (= (and mapNonEmpty!51752 (not condMapEmpty!51758)) mapNonEmpty!51758))

(assert (= (and mapNonEmpty!51758 ((_ is ValueCellFull!15840) mapValue!51758)) b!1278167))

(assert (= (and mapNonEmpty!51752 ((_ is ValueCellFull!15840) mapDefault!51758)) b!1278168))

(declare-fun m!1173589 () Bool)

(assert (=> mapNonEmpty!51758 m!1173589))

(check-sat (not mapNonEmpty!51758) tp_is_empty!33477)
(check-sat)
