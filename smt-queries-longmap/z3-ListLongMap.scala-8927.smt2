; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108244 () Bool)

(assert start!108244)

(declare-fun b!1278069 () Bool)

(declare-fun e!730005 () Bool)

(declare-fun tp_is_empty!33475 () Bool)

(assert (=> b!1278069 (= e!730005 tp_is_empty!33475)))

(declare-fun mapNonEmpty!51749 () Bool)

(declare-fun mapRes!51749 () Bool)

(declare-fun tp!98724 () Bool)

(assert (=> mapNonEmpty!51749 (= mapRes!51749 (and tp!98724 e!730005))))

(declare-datatypes ((V!49737 0))(
  ( (V!49738 (val!16812 Int)) )
))
(declare-datatypes ((ValueCell!15839 0))(
  ( (ValueCellFull!15839 (v!19410 V!49737)) (EmptyCell!15839) )
))
(declare-fun mapValue!51749 () ValueCell!15839)

(declare-datatypes ((array!83937 0))(
  ( (array!83938 (arr!40478 (Array (_ BitVec 32) ValueCell!15839)) (size!41030 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!83937)

(declare-fun mapKey!51749 () (_ BitVec 32))

(declare-fun mapRest!51749 () (Array (_ BitVec 32) ValueCell!15839))

(assert (=> mapNonEmpty!51749 (= (arr!40478 _values!1445) (store mapRest!51749 mapKey!51749 mapValue!51749))))

(declare-fun res!849168 () Bool)

(declare-fun e!730004 () Bool)

(assert (=> start!108244 (=> (not res!849168) (not e!730004))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108244 (= res!849168 (validMask!0 mask!2175))))

(assert (=> start!108244 e!730004))

(assert (=> start!108244 true))

(declare-fun e!730006 () Bool)

(declare-fun array_inv!30909 (array!83937) Bool)

(assert (=> start!108244 (and (array_inv!30909 _values!1445) e!730006)))

(declare-datatypes ((array!83939 0))(
  ( (array!83940 (arr!40479 (Array (_ BitVec 32) (_ BitVec 64))) (size!41031 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83939)

(declare-fun array_inv!30910 (array!83939) Bool)

(assert (=> start!108244 (array_inv!30910 _keys!1741)))

(declare-fun b!1278070 () Bool)

(declare-fun e!730002 () Bool)

(assert (=> b!1278070 (= e!730002 tp_is_empty!33475)))

(declare-fun mapIsEmpty!51749 () Bool)

(assert (=> mapIsEmpty!51749 mapRes!51749))

(declare-fun b!1278071 () Bool)

(assert (=> b!1278071 (= e!730006 (and e!730002 mapRes!51749))))

(declare-fun condMapEmpty!51749 () Bool)

(declare-fun mapDefault!51749 () ValueCell!15839)

(assert (=> b!1278071 (= condMapEmpty!51749 (= (arr!40478 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15839)) mapDefault!51749)))))

(declare-fun b!1278072 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278072 (= e!730004 (and (= (size!41030 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41031 _keys!1741) (size!41030 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (= (size!41031 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)) (bvsgt #b00000000000000000000000000000000 (size!41031 _keys!1741))))))

(assert (= (and start!108244 res!849168) b!1278072))

(assert (= (and b!1278071 condMapEmpty!51749) mapIsEmpty!51749))

(assert (= (and b!1278071 (not condMapEmpty!51749)) mapNonEmpty!51749))

(get-info :version)

(assert (= (and mapNonEmpty!51749 ((_ is ValueCellFull!15839) mapValue!51749)) b!1278069))

(assert (= (and b!1278071 ((_ is ValueCellFull!15839) mapDefault!51749)) b!1278070))

(assert (= start!108244 b!1278071))

(declare-fun m!1173065 () Bool)

(assert (=> mapNonEmpty!51749 m!1173065))

(declare-fun m!1173067 () Bool)

(assert (=> start!108244 m!1173067))

(declare-fun m!1173069 () Bool)

(assert (=> start!108244 m!1173069))

(declare-fun m!1173071 () Bool)

(assert (=> start!108244 m!1173071))

(check-sat (not start!108244) (not mapNonEmpty!51749) tp_is_empty!33475)
(check-sat)
(get-model)

(declare-fun d!140393 () Bool)

(assert (=> d!140393 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108244 d!140393))

(declare-fun d!140395 () Bool)

(assert (=> d!140395 (= (array_inv!30909 _values!1445) (bvsge (size!41030 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108244 d!140395))

(declare-fun d!140397 () Bool)

(assert (=> d!140397 (= (array_inv!30910 _keys!1741) (bvsge (size!41031 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108244 d!140397))

(declare-fun condMapEmpty!51758 () Bool)

(declare-fun mapDefault!51758 () ValueCell!15839)

(assert (=> mapNonEmpty!51749 (= condMapEmpty!51758 (= mapRest!51749 ((as const (Array (_ BitVec 32) ValueCell!15839)) mapDefault!51758)))))

(declare-fun e!730041 () Bool)

(declare-fun mapRes!51758 () Bool)

(assert (=> mapNonEmpty!51749 (= tp!98724 (and e!730041 mapRes!51758))))

(declare-fun mapNonEmpty!51758 () Bool)

(declare-fun tp!98733 () Bool)

(declare-fun e!730042 () Bool)

(assert (=> mapNonEmpty!51758 (= mapRes!51758 (and tp!98733 e!730042))))

(declare-fun mapValue!51758 () ValueCell!15839)

(declare-fun mapKey!51758 () (_ BitVec 32))

(declare-fun mapRest!51758 () (Array (_ BitVec 32) ValueCell!15839))

(assert (=> mapNonEmpty!51758 (= mapRest!51749 (store mapRest!51758 mapKey!51758 mapValue!51758))))

(declare-fun b!1278104 () Bool)

(assert (=> b!1278104 (= e!730041 tp_is_empty!33475)))

(declare-fun mapIsEmpty!51758 () Bool)

(assert (=> mapIsEmpty!51758 mapRes!51758))

(declare-fun b!1278103 () Bool)

(assert (=> b!1278103 (= e!730042 tp_is_empty!33475)))

(assert (= (and mapNonEmpty!51749 condMapEmpty!51758) mapIsEmpty!51758))

(assert (= (and mapNonEmpty!51749 (not condMapEmpty!51758)) mapNonEmpty!51758))

(assert (= (and mapNonEmpty!51758 ((_ is ValueCellFull!15839) mapValue!51758)) b!1278103))

(assert (= (and mapNonEmpty!51749 ((_ is ValueCellFull!15839) mapDefault!51758)) b!1278104))

(declare-fun m!1173089 () Bool)

(assert (=> mapNonEmpty!51758 m!1173089))

(check-sat (not mapNonEmpty!51758) tp_is_empty!33475)
(check-sat)
