; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108468 () Bool)

(assert start!108468)

(declare-fun b!1279438 () Bool)

(declare-fun e!730879 () Bool)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49737 0))(
  ( (V!49738 (val!16812 Int)) )
))
(declare-datatypes ((ValueCell!15839 0))(
  ( (ValueCellFull!15839 (v!19406 V!49737)) (EmptyCell!15839) )
))
(declare-datatypes ((array!84071 0))(
  ( (array!84072 (arr!40540 (Array (_ BitVec 32) ValueCell!15839)) (size!41091 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84071)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84073 0))(
  ( (array!84074 (arr!40541 (Array (_ BitVec 32) (_ BitVec 64))) (size!41092 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84073)

(assert (=> b!1279438 (= e!730879 (and (= (size!41091 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41092 _keys!1741) (size!41091 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (= (size!41092 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)) (bvsgt #b00000000000000000000000000000000 (size!41092 _keys!1741))))))

(declare-fun mapNonEmpty!51749 () Bool)

(declare-fun mapRes!51749 () Bool)

(declare-fun tp!98723 () Bool)

(declare-fun e!730880 () Bool)

(assert (=> mapNonEmpty!51749 (= mapRes!51749 (and tp!98723 e!730880))))

(declare-fun mapValue!51749 () ValueCell!15839)

(declare-fun mapRest!51749 () (Array (_ BitVec 32) ValueCell!15839))

(declare-fun mapKey!51749 () (_ BitVec 32))

(assert (=> mapNonEmpty!51749 (= (arr!40540 _values!1445) (store mapRest!51749 mapKey!51749 mapValue!51749))))

(declare-fun b!1279439 () Bool)

(declare-fun tp_is_empty!33475 () Bool)

(assert (=> b!1279439 (= e!730880 tp_is_empty!33475)))

(declare-fun b!1279440 () Bool)

(declare-fun e!730878 () Bool)

(assert (=> b!1279440 (= e!730878 tp_is_empty!33475)))

(declare-fun mapIsEmpty!51749 () Bool)

(assert (=> mapIsEmpty!51749 mapRes!51749))

(declare-fun res!849715 () Bool)

(assert (=> start!108468 (=> (not res!849715) (not e!730879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108468 (= res!849715 (validMask!0 mask!2175))))

(assert (=> start!108468 e!730879))

(assert (=> start!108468 true))

(declare-fun e!730882 () Bool)

(declare-fun array_inv!30983 (array!84071) Bool)

(assert (=> start!108468 (and (array_inv!30983 _values!1445) e!730882)))

(declare-fun array_inv!30984 (array!84073) Bool)

(assert (=> start!108468 (array_inv!30984 _keys!1741)))

(declare-fun b!1279441 () Bool)

(assert (=> b!1279441 (= e!730882 (and e!730878 mapRes!51749))))

(declare-fun condMapEmpty!51749 () Bool)

(declare-fun mapDefault!51749 () ValueCell!15839)

(assert (=> b!1279441 (= condMapEmpty!51749 (= (arr!40540 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15839)) mapDefault!51749)))))

(assert (= (and start!108468 res!849715) b!1279438))

(assert (= (and b!1279441 condMapEmpty!51749) mapIsEmpty!51749))

(assert (= (and b!1279441 (not condMapEmpty!51749)) mapNonEmpty!51749))

(get-info :version)

(assert (= (and mapNonEmpty!51749 ((_ is ValueCellFull!15839) mapValue!51749)) b!1279439))

(assert (= (and b!1279441 ((_ is ValueCellFull!15839) mapDefault!51749)) b!1279440))

(assert (= start!108468 b!1279441))

(declare-fun m!1175177 () Bool)

(assert (=> mapNonEmpty!51749 m!1175177))

(declare-fun m!1175179 () Bool)

(assert (=> start!108468 m!1175179))

(declare-fun m!1175181 () Bool)

(assert (=> start!108468 m!1175181))

(declare-fun m!1175183 () Bool)

(assert (=> start!108468 m!1175183))

(check-sat (not start!108468) (not mapNonEmpty!51749) tp_is_empty!33475)
(check-sat)
(get-model)

(declare-fun d!140953 () Bool)

(assert (=> d!140953 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108468 d!140953))

(declare-fun d!140955 () Bool)

(assert (=> d!140955 (= (array_inv!30983 _values!1445) (bvsge (size!41091 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108468 d!140955))

(declare-fun d!140957 () Bool)

(assert (=> d!140957 (= (array_inv!30984 _keys!1741) (bvsge (size!41092 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108468 d!140957))

(declare-fun b!1279473 () Bool)

(declare-fun e!730918 () Bool)

(assert (=> b!1279473 (= e!730918 tp_is_empty!33475)))

(declare-fun mapNonEmpty!51758 () Bool)

(declare-fun mapRes!51758 () Bool)

(declare-fun tp!98732 () Bool)

(declare-fun e!730917 () Bool)

(assert (=> mapNonEmpty!51758 (= mapRes!51758 (and tp!98732 e!730917))))

(declare-fun mapValue!51758 () ValueCell!15839)

(declare-fun mapRest!51758 () (Array (_ BitVec 32) ValueCell!15839))

(declare-fun mapKey!51758 () (_ BitVec 32))

(assert (=> mapNonEmpty!51758 (= mapRest!51749 (store mapRest!51758 mapKey!51758 mapValue!51758))))

(declare-fun condMapEmpty!51758 () Bool)

(declare-fun mapDefault!51758 () ValueCell!15839)

(assert (=> mapNonEmpty!51749 (= condMapEmpty!51758 (= mapRest!51749 ((as const (Array (_ BitVec 32) ValueCell!15839)) mapDefault!51758)))))

(assert (=> mapNonEmpty!51749 (= tp!98723 (and e!730918 mapRes!51758))))

(declare-fun mapIsEmpty!51758 () Bool)

(assert (=> mapIsEmpty!51758 mapRes!51758))

(declare-fun b!1279472 () Bool)

(assert (=> b!1279472 (= e!730917 tp_is_empty!33475)))

(assert (= (and mapNonEmpty!51749 condMapEmpty!51758) mapIsEmpty!51758))

(assert (= (and mapNonEmpty!51749 (not condMapEmpty!51758)) mapNonEmpty!51758))

(assert (= (and mapNonEmpty!51758 ((_ is ValueCellFull!15839) mapValue!51758)) b!1279472))

(assert (= (and mapNonEmpty!51749 ((_ is ValueCellFull!15839) mapDefault!51758)) b!1279473))

(declare-fun m!1175201 () Bool)

(assert (=> mapNonEmpty!51758 m!1175201))

(check-sat (not mapNonEmpty!51758) tp_is_empty!33475)
(check-sat)
