; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108272 () Bool)

(assert start!108272)

(declare-fun b!1278273 () Bool)

(declare-fun e!730159 () Bool)

(declare-fun e!730160 () Bool)

(declare-fun mapRes!51776 () Bool)

(assert (=> b!1278273 (= e!730159 (and e!730160 mapRes!51776))))

(declare-fun condMapEmpty!51776 () Bool)

(declare-datatypes ((V!49755 0))(
  ( (V!49756 (val!16819 Int)) )
))
(declare-datatypes ((ValueCell!15846 0))(
  ( (ValueCellFull!15846 (v!19418 V!49755)) (EmptyCell!15846) )
))
(declare-datatypes ((array!84070 0))(
  ( (array!84071 (arr!40542 (Array (_ BitVec 32) ValueCell!15846)) (size!41092 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84070)

(declare-fun mapDefault!51776 () ValueCell!15846)

(assert (=> b!1278273 (= condMapEmpty!51776 (= (arr!40542 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15846)) mapDefault!51776)))))

(declare-fun b!1278274 () Bool)

(declare-fun e!730158 () Bool)

(declare-datatypes ((array!84072 0))(
  ( (array!84073 (arr!40543 (Array (_ BitVec 32) (_ BitVec 64))) (size!41093 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84072)

(assert (=> b!1278274 (= e!730158 (and (bvsle #b00000000000000000000000000000000 (size!41093 _keys!1741)) (bvsge (size!41093 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun b!1278275 () Bool)

(declare-fun res!849252 () Bool)

(assert (=> b!1278275 (=> (not res!849252) (not e!730158))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84072 (_ BitVec 32)) Bool)

(assert (=> b!1278275 (= res!849252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!849251 () Bool)

(assert (=> start!108272 (=> (not res!849251) (not e!730158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108272 (= res!849251 (validMask!0 mask!2175))))

(assert (=> start!108272 e!730158))

(assert (=> start!108272 true))

(declare-fun array_inv!30797 (array!84070) Bool)

(assert (=> start!108272 (and (array_inv!30797 _values!1445) e!730159)))

(declare-fun array_inv!30798 (array!84072) Bool)

(assert (=> start!108272 (array_inv!30798 _keys!1741)))

(declare-fun b!1278276 () Bool)

(declare-fun e!730157 () Bool)

(declare-fun tp_is_empty!33489 () Bool)

(assert (=> b!1278276 (= e!730157 tp_is_empty!33489)))

(declare-fun mapIsEmpty!51776 () Bool)

(assert (=> mapIsEmpty!51776 mapRes!51776))

(declare-fun b!1278277 () Bool)

(assert (=> b!1278277 (= e!730160 tp_is_empty!33489)))

(declare-fun mapNonEmpty!51776 () Bool)

(declare-fun tp!98750 () Bool)

(assert (=> mapNonEmpty!51776 (= mapRes!51776 (and tp!98750 e!730157))))

(declare-fun mapKey!51776 () (_ BitVec 32))

(declare-fun mapValue!51776 () ValueCell!15846)

(declare-fun mapRest!51776 () (Array (_ BitVec 32) ValueCell!15846))

(assert (=> mapNonEmpty!51776 (= (arr!40542 _values!1445) (store mapRest!51776 mapKey!51776 mapValue!51776))))

(declare-fun b!1278278 () Bool)

(declare-fun res!849250 () Bool)

(assert (=> b!1278278 (=> (not res!849250) (not e!730158))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278278 (= res!849250 (and (= (size!41092 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41093 _keys!1741) (size!41092 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108272 res!849251) b!1278278))

(assert (= (and b!1278278 res!849250) b!1278275))

(assert (= (and b!1278275 res!849252) b!1278274))

(assert (= (and b!1278273 condMapEmpty!51776) mapIsEmpty!51776))

(assert (= (and b!1278273 (not condMapEmpty!51776)) mapNonEmpty!51776))

(get-info :version)

(assert (= (and mapNonEmpty!51776 ((_ is ValueCellFull!15846) mapValue!51776)) b!1278276))

(assert (= (and b!1278273 ((_ is ValueCellFull!15846) mapDefault!51776)) b!1278277))

(assert (= start!108272 b!1278273))

(declare-fun m!1173645 () Bool)

(assert (=> b!1278275 m!1173645))

(declare-fun m!1173647 () Bool)

(assert (=> start!108272 m!1173647))

(declare-fun m!1173649 () Bool)

(assert (=> start!108272 m!1173649))

(declare-fun m!1173651 () Bool)

(assert (=> start!108272 m!1173651))

(declare-fun m!1173653 () Bool)

(assert (=> mapNonEmpty!51776 m!1173653))

(check-sat (not start!108272) (not b!1278275) (not mapNonEmpty!51776) tp_is_empty!33489)
(check-sat)
(get-model)

(declare-fun d!140523 () Bool)

(assert (=> d!140523 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108272 d!140523))

(declare-fun d!140525 () Bool)

(assert (=> d!140525 (= (array_inv!30797 _values!1445) (bvsge (size!41092 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108272 d!140525))

(declare-fun d!140527 () Bool)

(assert (=> d!140527 (= (array_inv!30798 _keys!1741) (bvsge (size!41093 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108272 d!140527))

(declare-fun b!1278305 () Bool)

(declare-fun e!730184 () Bool)

(declare-fun call!62710 () Bool)

(assert (=> b!1278305 (= e!730184 call!62710)))

(declare-fun b!1278306 () Bool)

(declare-fun e!730183 () Bool)

(assert (=> b!1278306 (= e!730184 e!730183)))

(declare-fun lt!575862 () (_ BitVec 64))

(assert (=> b!1278306 (= lt!575862 (select (arr!40543 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42387 0))(
  ( (Unit!42388) )
))
(declare-fun lt!575863 () Unit!42387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84072 (_ BitVec 64) (_ BitVec 32)) Unit!42387)

(assert (=> b!1278306 (= lt!575863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575862 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278306 (arrayContainsKey!0 _keys!1741 lt!575862 #b00000000000000000000000000000000)))

(declare-fun lt!575861 () Unit!42387)

(assert (=> b!1278306 (= lt!575861 lt!575863)))

(declare-fun res!849267 () Bool)

(declare-datatypes ((SeekEntryResult!10009 0))(
  ( (MissingZero!10009 (index!42407 (_ BitVec 32))) (Found!10009 (index!42408 (_ BitVec 32))) (Intermediate!10009 (undefined!10821 Bool) (index!42409 (_ BitVec 32)) (x!113308 (_ BitVec 32))) (Undefined!10009) (MissingVacant!10009 (index!42410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84072 (_ BitVec 32)) SeekEntryResult!10009)

(assert (=> b!1278306 (= res!849267 (= (seekEntryOrOpen!0 (select (arr!40543 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10009 #b00000000000000000000000000000000)))))

(assert (=> b!1278306 (=> (not res!849267) (not e!730183))))

(declare-fun b!1278308 () Bool)

(declare-fun e!730185 () Bool)

(assert (=> b!1278308 (= e!730185 e!730184)))

(declare-fun c!124032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278308 (= c!124032 (validKeyInArray!0 (select (arr!40543 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62707 () Bool)

(assert (=> bm!62707 (= call!62710 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!140529 () Bool)

(declare-fun res!849266 () Bool)

(assert (=> d!140529 (=> res!849266 e!730185)))

(assert (=> d!140529 (= res!849266 (bvsge #b00000000000000000000000000000000 (size!41093 _keys!1741)))))

(assert (=> d!140529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730185)))

(declare-fun b!1278307 () Bool)

(assert (=> b!1278307 (= e!730183 call!62710)))

(assert (= (and d!140529 (not res!849266)) b!1278308))

(assert (= (and b!1278308 c!124032) b!1278306))

(assert (= (and b!1278308 (not c!124032)) b!1278305))

(assert (= (and b!1278306 res!849267) b!1278307))

(assert (= (or b!1278307 b!1278305) bm!62707))

(declare-fun m!1173665 () Bool)

(assert (=> b!1278306 m!1173665))

(declare-fun m!1173667 () Bool)

(assert (=> b!1278306 m!1173667))

(declare-fun m!1173669 () Bool)

(assert (=> b!1278306 m!1173669))

(assert (=> b!1278306 m!1173665))

(declare-fun m!1173671 () Bool)

(assert (=> b!1278306 m!1173671))

(assert (=> b!1278308 m!1173665))

(assert (=> b!1278308 m!1173665))

(declare-fun m!1173673 () Bool)

(assert (=> b!1278308 m!1173673))

(declare-fun m!1173675 () Bool)

(assert (=> bm!62707 m!1173675))

(assert (=> b!1278275 d!140529))

(declare-fun mapIsEmpty!51782 () Bool)

(declare-fun mapRes!51782 () Bool)

(assert (=> mapIsEmpty!51782 mapRes!51782))

(declare-fun condMapEmpty!51782 () Bool)

(declare-fun mapDefault!51782 () ValueCell!15846)

(assert (=> mapNonEmpty!51776 (= condMapEmpty!51782 (= mapRest!51776 ((as const (Array (_ BitVec 32) ValueCell!15846)) mapDefault!51782)))))

(declare-fun e!730190 () Bool)

(assert (=> mapNonEmpty!51776 (= tp!98750 (and e!730190 mapRes!51782))))

(declare-fun b!1278316 () Bool)

(assert (=> b!1278316 (= e!730190 tp_is_empty!33489)))

(declare-fun mapNonEmpty!51782 () Bool)

(declare-fun tp!98756 () Bool)

(declare-fun e!730191 () Bool)

(assert (=> mapNonEmpty!51782 (= mapRes!51782 (and tp!98756 e!730191))))

(declare-fun mapValue!51782 () ValueCell!15846)

(declare-fun mapRest!51782 () (Array (_ BitVec 32) ValueCell!15846))

(declare-fun mapKey!51782 () (_ BitVec 32))

(assert (=> mapNonEmpty!51782 (= mapRest!51776 (store mapRest!51782 mapKey!51782 mapValue!51782))))

(declare-fun b!1278315 () Bool)

(assert (=> b!1278315 (= e!730191 tp_is_empty!33489)))

(assert (= (and mapNonEmpty!51776 condMapEmpty!51782) mapIsEmpty!51782))

(assert (= (and mapNonEmpty!51776 (not condMapEmpty!51782)) mapNonEmpty!51782))

(assert (= (and mapNonEmpty!51782 ((_ is ValueCellFull!15846) mapValue!51782)) b!1278315))

(assert (= (and mapNonEmpty!51776 ((_ is ValueCellFull!15846) mapDefault!51782)) b!1278316))

(declare-fun m!1173677 () Bool)

(assert (=> mapNonEmpty!51782 m!1173677))

(check-sat (not b!1278308) (not mapNonEmpty!51782) (not bm!62707) (not b!1278306) tp_is_empty!33489)
(check-sat)
