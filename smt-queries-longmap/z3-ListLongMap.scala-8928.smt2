; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108258 () Bool)

(assert start!108258)

(declare-fun res!849219 () Bool)

(declare-fun e!730099 () Bool)

(assert (=> start!108258 (=> (not res!849219) (not e!730099))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108258 (= res!849219 (validMask!0 mask!2175))))

(assert (=> start!108258 e!730099))

(assert (=> start!108258 true))

(declare-datatypes ((V!49747 0))(
  ( (V!49748 (val!16816 Int)) )
))
(declare-datatypes ((ValueCell!15843 0))(
  ( (ValueCellFull!15843 (v!19415 V!49747)) (EmptyCell!15843) )
))
(declare-datatypes ((array!84056 0))(
  ( (array!84057 (arr!40536 (Array (_ BitVec 32) ValueCell!15843)) (size!41086 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84056)

(declare-fun e!730097 () Bool)

(declare-fun array_inv!30795 (array!84056) Bool)

(assert (=> start!108258 (and (array_inv!30795 _values!1445) e!730097)))

(declare-datatypes ((array!84058 0))(
  ( (array!84059 (arr!40537 (Array (_ BitVec 32) (_ BitVec 64))) (size!41087 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84058)

(declare-fun array_inv!30796 (array!84058) Bool)

(assert (=> start!108258 (array_inv!30796 _keys!1741)))

(declare-fun mapIsEmpty!51764 () Bool)

(declare-fun mapRes!51764 () Bool)

(assert (=> mapIsEmpty!51764 mapRes!51764))

(declare-fun b!1278199 () Bool)

(declare-fun res!849218 () Bool)

(assert (=> b!1278199 (=> (not res!849218) (not e!730099))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278199 (= res!849218 (and (= (size!41086 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41087 _keys!1741) (size!41086 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278200 () Bool)

(declare-fun e!730100 () Bool)

(declare-fun tp_is_empty!33483 () Bool)

(assert (=> b!1278200 (= e!730100 tp_is_empty!33483)))

(declare-fun mapNonEmpty!51764 () Bool)

(declare-fun tp!98738 () Bool)

(declare-fun e!730101 () Bool)

(assert (=> mapNonEmpty!51764 (= mapRes!51764 (and tp!98738 e!730101))))

(declare-fun mapValue!51764 () ValueCell!15843)

(declare-fun mapRest!51764 () (Array (_ BitVec 32) ValueCell!15843))

(declare-fun mapKey!51764 () (_ BitVec 32))

(assert (=> mapNonEmpty!51764 (= (arr!40536 _values!1445) (store mapRest!51764 mapKey!51764 mapValue!51764))))

(declare-fun b!1278201 () Bool)

(assert (=> b!1278201 (= e!730101 tp_is_empty!33483)))

(declare-fun b!1278202 () Bool)

(assert (=> b!1278202 (= e!730097 (and e!730100 mapRes!51764))))

(declare-fun condMapEmpty!51764 () Bool)

(declare-fun mapDefault!51764 () ValueCell!15843)

(assert (=> b!1278202 (= condMapEmpty!51764 (= (arr!40536 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15843)) mapDefault!51764)))))

(declare-fun b!1278203 () Bool)

(declare-fun res!849217 () Bool)

(assert (=> b!1278203 (=> (not res!849217) (not e!730099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84058 (_ BitVec 32)) Bool)

(assert (=> b!1278203 (= res!849217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278204 () Bool)

(assert (=> b!1278204 (= e!730099 (bvsgt #b00000000000000000000000000000000 (size!41087 _keys!1741)))))

(assert (= (and start!108258 res!849219) b!1278199))

(assert (= (and b!1278199 res!849218) b!1278203))

(assert (= (and b!1278203 res!849217) b!1278204))

(assert (= (and b!1278202 condMapEmpty!51764) mapIsEmpty!51764))

(assert (= (and b!1278202 (not condMapEmpty!51764)) mapNonEmpty!51764))

(get-info :version)

(assert (= (and mapNonEmpty!51764 ((_ is ValueCellFull!15843) mapValue!51764)) b!1278201))

(assert (= (and b!1278202 ((_ is ValueCellFull!15843) mapDefault!51764)) b!1278200))

(assert (= start!108258 b!1278202))

(declare-fun m!1173601 () Bool)

(assert (=> start!108258 m!1173601))

(declare-fun m!1173603 () Bool)

(assert (=> start!108258 m!1173603))

(declare-fun m!1173605 () Bool)

(assert (=> start!108258 m!1173605))

(declare-fun m!1173607 () Bool)

(assert (=> mapNonEmpty!51764 m!1173607))

(declare-fun m!1173609 () Bool)

(assert (=> b!1278203 m!1173609))

(check-sat (not b!1278203) (not start!108258) (not mapNonEmpty!51764) tp_is_empty!33483)
(check-sat)
(get-model)

(declare-fun b!1278231 () Bool)

(declare-fun e!730125 () Bool)

(declare-fun call!62707 () Bool)

(assert (=> b!1278231 (= e!730125 call!62707)))

(declare-fun bm!62704 () Bool)

(assert (=> bm!62704 (= call!62707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!140513 () Bool)

(declare-fun res!849234 () Bool)

(declare-fun e!730124 () Bool)

(assert (=> d!140513 (=> res!849234 e!730124)))

(assert (=> d!140513 (= res!849234 (bvsge #b00000000000000000000000000000000 (size!41087 _keys!1741)))))

(assert (=> d!140513 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730124)))

(declare-fun b!1278232 () Bool)

(assert (=> b!1278232 (= e!730124 e!730125)))

(declare-fun c!124029 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278232 (= c!124029 (validKeyInArray!0 (select (arr!40537 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1278233 () Bool)

(declare-fun e!730123 () Bool)

(assert (=> b!1278233 (= e!730123 call!62707)))

(declare-fun b!1278234 () Bool)

(assert (=> b!1278234 (= e!730125 e!730123)))

(declare-fun lt!575854 () (_ BitVec 64))

(assert (=> b!1278234 (= lt!575854 (select (arr!40537 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42385 0))(
  ( (Unit!42386) )
))
(declare-fun lt!575853 () Unit!42385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84058 (_ BitVec 64) (_ BitVec 32)) Unit!42385)

(assert (=> b!1278234 (= lt!575853 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575854 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278234 (arrayContainsKey!0 _keys!1741 lt!575854 #b00000000000000000000000000000000)))

(declare-fun lt!575852 () Unit!42385)

(assert (=> b!1278234 (= lt!575852 lt!575853)))

(declare-fun res!849233 () Bool)

(declare-datatypes ((SeekEntryResult!10008 0))(
  ( (MissingZero!10008 (index!42403 (_ BitVec 32))) (Found!10008 (index!42404 (_ BitVec 32))) (Intermediate!10008 (undefined!10820 Bool) (index!42405 (_ BitVec 32)) (x!113297 (_ BitVec 32))) (Undefined!10008) (MissingVacant!10008 (index!42406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84058 (_ BitVec 32)) SeekEntryResult!10008)

(assert (=> b!1278234 (= res!849233 (= (seekEntryOrOpen!0 (select (arr!40537 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10008 #b00000000000000000000000000000000)))))

(assert (=> b!1278234 (=> (not res!849233) (not e!730123))))

(assert (= (and d!140513 (not res!849234)) b!1278232))

(assert (= (and b!1278232 c!124029) b!1278234))

(assert (= (and b!1278232 (not c!124029)) b!1278231))

(assert (= (and b!1278234 res!849233) b!1278233))

(assert (= (or b!1278233 b!1278231) bm!62704))

(declare-fun m!1173621 () Bool)

(assert (=> bm!62704 m!1173621))

(declare-fun m!1173623 () Bool)

(assert (=> b!1278232 m!1173623))

(assert (=> b!1278232 m!1173623))

(declare-fun m!1173625 () Bool)

(assert (=> b!1278232 m!1173625))

(assert (=> b!1278234 m!1173623))

(declare-fun m!1173627 () Bool)

(assert (=> b!1278234 m!1173627))

(declare-fun m!1173629 () Bool)

(assert (=> b!1278234 m!1173629))

(assert (=> b!1278234 m!1173623))

(declare-fun m!1173631 () Bool)

(assert (=> b!1278234 m!1173631))

(assert (=> b!1278203 d!140513))

(declare-fun d!140515 () Bool)

(assert (=> d!140515 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108258 d!140515))

(declare-fun d!140517 () Bool)

(assert (=> d!140517 (= (array_inv!30795 _values!1445) (bvsge (size!41086 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108258 d!140517))

(declare-fun d!140519 () Bool)

(assert (=> d!140519 (= (array_inv!30796 _keys!1741) (bvsge (size!41087 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108258 d!140519))

(declare-fun b!1278241 () Bool)

(declare-fun e!730130 () Bool)

(assert (=> b!1278241 (= e!730130 tp_is_empty!33483)))

(declare-fun mapNonEmpty!51770 () Bool)

(declare-fun mapRes!51770 () Bool)

(declare-fun tp!98744 () Bool)

(assert (=> mapNonEmpty!51770 (= mapRes!51770 (and tp!98744 e!730130))))

(declare-fun mapValue!51770 () ValueCell!15843)

(declare-fun mapKey!51770 () (_ BitVec 32))

(declare-fun mapRest!51770 () (Array (_ BitVec 32) ValueCell!15843))

(assert (=> mapNonEmpty!51770 (= mapRest!51764 (store mapRest!51770 mapKey!51770 mapValue!51770))))

(declare-fun mapIsEmpty!51770 () Bool)

(assert (=> mapIsEmpty!51770 mapRes!51770))

(declare-fun condMapEmpty!51770 () Bool)

(declare-fun mapDefault!51770 () ValueCell!15843)

(assert (=> mapNonEmpty!51764 (= condMapEmpty!51770 (= mapRest!51764 ((as const (Array (_ BitVec 32) ValueCell!15843)) mapDefault!51770)))))

(declare-fun e!730131 () Bool)

(assert (=> mapNonEmpty!51764 (= tp!98738 (and e!730131 mapRes!51770))))

(declare-fun b!1278242 () Bool)

(assert (=> b!1278242 (= e!730131 tp_is_empty!33483)))

(assert (= (and mapNonEmpty!51764 condMapEmpty!51770) mapIsEmpty!51770))

(assert (= (and mapNonEmpty!51764 (not condMapEmpty!51770)) mapNonEmpty!51770))

(assert (= (and mapNonEmpty!51770 ((_ is ValueCellFull!15843) mapValue!51770)) b!1278241))

(assert (= (and mapNonEmpty!51764 ((_ is ValueCellFull!15843) mapDefault!51770)) b!1278242))

(declare-fun m!1173633 () Bool)

(assert (=> mapNonEmpty!51770 m!1173633))

(check-sat (not bm!62704) (not mapNonEmpty!51770) (not b!1278232) tp_is_empty!33483 (not b!1278234))
(check-sat)
