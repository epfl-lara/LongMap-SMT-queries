; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108258 () Bool)

(assert start!108258)

(declare-fun b!1277305 () Bool)

(declare-fun e!729402 () Bool)

(assert (=> b!1277305 (= e!729402 false)))

(declare-fun lt!575912 () Bool)

(declare-datatypes ((array!83737 0))(
  ( (array!83738 (arr!40376 (Array (_ BitVec 32) (_ BitVec 64))) (size!40927 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83737)

(declare-datatypes ((List!28662 0))(
  ( (Nil!28659) (Cons!28658 (h!29876 (_ BitVec 64)) (t!42190 List!28662)) )
))
(declare-fun arrayNoDuplicates!0 (array!83737 (_ BitVec 32) List!28662) Bool)

(assert (=> b!1277305 (= lt!575912 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28659))))

(declare-fun res!848565 () Bool)

(assert (=> start!108258 (=> (not res!848565) (not e!729402))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108258 (= res!848565 (validMask!0 mask!1805))))

(assert (=> start!108258 e!729402))

(assert (=> start!108258 true))

(declare-datatypes ((V!49513 0))(
  ( (V!49514 (val!16728 Int)) )
))
(declare-datatypes ((ValueCell!15755 0))(
  ( (ValueCellFull!15755 (v!19320 V!49513)) (EmptyCell!15755) )
))
(declare-datatypes ((array!83739 0))(
  ( (array!83740 (arr!40377 (Array (_ BitVec 32) ValueCell!15755)) (size!40928 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83739)

(declare-fun e!729403 () Bool)

(declare-fun array_inv!30875 (array!83739) Bool)

(assert (=> start!108258 (and (array_inv!30875 _values!1187) e!729403)))

(declare-fun array_inv!30876 (array!83737) Bool)

(assert (=> start!108258 (array_inv!30876 _keys!1427)))

(declare-fun b!1277306 () Bool)

(declare-fun e!729405 () Bool)

(declare-fun tp_is_empty!33307 () Bool)

(assert (=> b!1277306 (= e!729405 tp_is_empty!33307)))

(declare-fun b!1277307 () Bool)

(declare-fun mapRes!51488 () Bool)

(assert (=> b!1277307 (= e!729403 (and e!729405 mapRes!51488))))

(declare-fun condMapEmpty!51488 () Bool)

(declare-fun mapDefault!51488 () ValueCell!15755)

(assert (=> b!1277307 (= condMapEmpty!51488 (= (arr!40377 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15755)) mapDefault!51488)))))

(declare-fun b!1277308 () Bool)

(declare-fun e!729406 () Bool)

(assert (=> b!1277308 (= e!729406 tp_is_empty!33307)))

(declare-fun b!1277309 () Bool)

(declare-fun res!848566 () Bool)

(assert (=> b!1277309 (=> (not res!848566) (not e!729402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83737 (_ BitVec 32)) Bool)

(assert (=> b!1277309 (= res!848566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51488 () Bool)

(assert (=> mapIsEmpty!51488 mapRes!51488))

(declare-fun b!1277310 () Bool)

(declare-fun res!848564 () Bool)

(assert (=> b!1277310 (=> (not res!848564) (not e!729402))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277310 (= res!848564 (and (= (size!40928 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40927 _keys!1427) (size!40928 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51488 () Bool)

(declare-fun tp!98246 () Bool)

(assert (=> mapNonEmpty!51488 (= mapRes!51488 (and tp!98246 e!729406))))

(declare-fun mapRest!51488 () (Array (_ BitVec 32) ValueCell!15755))

(declare-fun mapKey!51488 () (_ BitVec 32))

(declare-fun mapValue!51488 () ValueCell!15755)

(assert (=> mapNonEmpty!51488 (= (arr!40377 _values!1187) (store mapRest!51488 mapKey!51488 mapValue!51488))))

(assert (= (and start!108258 res!848565) b!1277310))

(assert (= (and b!1277310 res!848564) b!1277309))

(assert (= (and b!1277309 res!848566) b!1277305))

(assert (= (and b!1277307 condMapEmpty!51488) mapIsEmpty!51488))

(assert (= (and b!1277307 (not condMapEmpty!51488)) mapNonEmpty!51488))

(get-info :version)

(assert (= (and mapNonEmpty!51488 ((_ is ValueCellFull!15755) mapValue!51488)) b!1277308))

(assert (= (and b!1277307 ((_ is ValueCellFull!15755) mapDefault!51488)) b!1277306))

(assert (= start!108258 b!1277307))

(declare-fun m!1173663 () Bool)

(assert (=> b!1277305 m!1173663))

(declare-fun m!1173665 () Bool)

(assert (=> start!108258 m!1173665))

(declare-fun m!1173667 () Bool)

(assert (=> start!108258 m!1173667))

(declare-fun m!1173669 () Bool)

(assert (=> start!108258 m!1173669))

(declare-fun m!1173671 () Bool)

(assert (=> b!1277309 m!1173671))

(declare-fun m!1173673 () Bool)

(assert (=> mapNonEmpty!51488 m!1173673))

(check-sat (not start!108258) (not b!1277309) tp_is_empty!33307 (not b!1277305) (not mapNonEmpty!51488))
(check-sat)
