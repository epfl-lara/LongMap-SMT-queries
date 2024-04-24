; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108494 () Bool)

(assert start!108494)

(declare-fun b!1279560 () Bool)

(declare-fun res!849761 () Bool)

(declare-fun e!730990 () Bool)

(assert (=> b!1279560 (=> (not res!849761) (not e!730990))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49753 0))(
  ( (V!49754 (val!16818 Int)) )
))
(declare-datatypes ((ValueCell!15845 0))(
  ( (ValueCellFull!15845 (v!19412 V!49753)) (EmptyCell!15845) )
))
(declare-datatypes ((array!84097 0))(
  ( (array!84098 (arr!40551 (Array (_ BitVec 32) ValueCell!15845)) (size!41102 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84097)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84099 0))(
  ( (array!84100 (arr!40552 (Array (_ BitVec 32) (_ BitVec 64))) (size!41103 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84099)

(assert (=> b!1279560 (= res!849761 (and (= (size!41102 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41103 _keys!1741) (size!41102 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51773 () Bool)

(declare-fun mapRes!51773 () Bool)

(assert (=> mapIsEmpty!51773 mapRes!51773))

(declare-fun mapNonEmpty!51773 () Bool)

(declare-fun tp!98747 () Bool)

(declare-fun e!730993 () Bool)

(assert (=> mapNonEmpty!51773 (= mapRes!51773 (and tp!98747 e!730993))))

(declare-fun mapValue!51773 () ValueCell!15845)

(declare-fun mapKey!51773 () (_ BitVec 32))

(declare-fun mapRest!51773 () (Array (_ BitVec 32) ValueCell!15845))

(assert (=> mapNonEmpty!51773 (= (arr!40551 _values!1445) (store mapRest!51773 mapKey!51773 mapValue!51773))))

(declare-fun b!1279561 () Bool)

(declare-fun e!730989 () Bool)

(declare-fun e!730991 () Bool)

(assert (=> b!1279561 (= e!730989 (and e!730991 mapRes!51773))))

(declare-fun condMapEmpty!51773 () Bool)

(declare-fun mapDefault!51773 () ValueCell!15845)

(assert (=> b!1279561 (= condMapEmpty!51773 (= (arr!40551 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15845)) mapDefault!51773)))))

(declare-fun b!1279562 () Bool)

(declare-fun res!849763 () Bool)

(assert (=> b!1279562 (=> (not res!849763) (not e!730990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84099 (_ BitVec 32)) Bool)

(assert (=> b!1279562 (= res!849763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279563 () Bool)

(declare-fun tp_is_empty!33487 () Bool)

(assert (=> b!1279563 (= e!730993 tp_is_empty!33487)))

(declare-fun b!1279564 () Bool)

(assert (=> b!1279564 (= e!730991 tp_is_empty!33487)))

(declare-fun b!1279565 () Bool)

(assert (=> b!1279565 (= e!730990 (and (bvsle #b00000000000000000000000000000000 (size!41103 _keys!1741)) (bvsge (size!41103 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun res!849762 () Bool)

(assert (=> start!108494 (=> (not res!849762) (not e!730990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108494 (= res!849762 (validMask!0 mask!2175))))

(assert (=> start!108494 e!730990))

(assert (=> start!108494 true))

(declare-fun array_inv!30991 (array!84097) Bool)

(assert (=> start!108494 (and (array_inv!30991 _values!1445) e!730989)))

(declare-fun array_inv!30992 (array!84099) Bool)

(assert (=> start!108494 (array_inv!30992 _keys!1741)))

(assert (= (and start!108494 res!849762) b!1279560))

(assert (= (and b!1279560 res!849761) b!1279562))

(assert (= (and b!1279562 res!849763) b!1279565))

(assert (= (and b!1279561 condMapEmpty!51773) mapIsEmpty!51773))

(assert (= (and b!1279561 (not condMapEmpty!51773)) mapNonEmpty!51773))

(get-info :version)

(assert (= (and mapNonEmpty!51773 ((_ is ValueCellFull!15845) mapValue!51773)) b!1279563))

(assert (= (and b!1279561 ((_ is ValueCellFull!15845) mapDefault!51773)) b!1279564))

(assert (= start!108494 b!1279561))

(declare-fun m!1175247 () Bool)

(assert (=> mapNonEmpty!51773 m!1175247))

(declare-fun m!1175249 () Bool)

(assert (=> b!1279562 m!1175249))

(declare-fun m!1175251 () Bool)

(assert (=> start!108494 m!1175251))

(declare-fun m!1175253 () Bool)

(assert (=> start!108494 m!1175253))

(declare-fun m!1175255 () Bool)

(assert (=> start!108494 m!1175255))

(check-sat (not start!108494) (not b!1279562) (not mapNonEmpty!51773) tp_is_empty!33487)
(check-sat)
(get-model)

(declare-fun d!140971 () Bool)

(assert (=> d!140971 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108494 d!140971))

(declare-fun d!140973 () Bool)

(assert (=> d!140973 (= (array_inv!30991 _values!1445) (bvsge (size!41102 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108494 d!140973))

(declare-fun d!140975 () Bool)

(assert (=> d!140975 (= (array_inv!30992 _keys!1741) (bvsge (size!41103 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108494 d!140975))

(declare-fun b!1279610 () Bool)

(declare-fun e!731031 () Bool)

(declare-fun e!731032 () Bool)

(assert (=> b!1279610 (= e!731031 e!731032)))

(declare-fun lt!576346 () (_ BitVec 64))

(assert (=> b!1279610 (= lt!576346 (select (arr!40552 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42354 0))(
  ( (Unit!42355) )
))
(declare-fun lt!576345 () Unit!42354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84099 (_ BitVec 64) (_ BitVec 32)) Unit!42354)

(assert (=> b!1279610 (= lt!576345 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576346 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1279610 (arrayContainsKey!0 _keys!1741 lt!576346 #b00000000000000000000000000000000)))

(declare-fun lt!576347 () Unit!42354)

(assert (=> b!1279610 (= lt!576347 lt!576345)))

(declare-fun res!849787 () Bool)

(declare-datatypes ((SeekEntryResult!9965 0))(
  ( (MissingZero!9965 (index!42231 (_ BitVec 32))) (Found!9965 (index!42232 (_ BitVec 32))) (Intermediate!9965 (undefined!10777 Bool) (index!42233 (_ BitVec 32)) (x!113286 (_ BitVec 32))) (Undefined!9965) (MissingVacant!9965 (index!42234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84099 (_ BitVec 32)) SeekEntryResult!9965)

(assert (=> b!1279610 (= res!849787 (= (seekEntryOrOpen!0 (select (arr!40552 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9965 #b00000000000000000000000000000000)))))

(assert (=> b!1279610 (=> (not res!849787) (not e!731032))))

(declare-fun d!140977 () Bool)

(declare-fun res!849786 () Bool)

(declare-fun e!731030 () Bool)

(assert (=> d!140977 (=> res!849786 e!731030)))

(assert (=> d!140977 (= res!849786 (bvsge #b00000000000000000000000000000000 (size!41103 _keys!1741)))))

(assert (=> d!140977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!731030)))

(declare-fun b!1279611 () Bool)

(declare-fun call!62775 () Bool)

(assert (=> b!1279611 (= e!731031 call!62775)))

(declare-fun bm!62772 () Bool)

(assert (=> bm!62772 (= call!62775 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1279612 () Bool)

(assert (=> b!1279612 (= e!731032 call!62775)))

(declare-fun b!1279613 () Bool)

(assert (=> b!1279613 (= e!731030 e!731031)))

(declare-fun c!124432 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1279613 (= c!124432 (validKeyInArray!0 (select (arr!40552 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!140977 (not res!849786)) b!1279613))

(assert (= (and b!1279613 c!124432) b!1279610))

(assert (= (and b!1279613 (not c!124432)) b!1279611))

(assert (= (and b!1279610 res!849787) b!1279612))

(assert (= (or b!1279612 b!1279611) bm!62772))

(declare-fun m!1175277 () Bool)

(assert (=> b!1279610 m!1175277))

(declare-fun m!1175279 () Bool)

(assert (=> b!1279610 m!1175279))

(declare-fun m!1175281 () Bool)

(assert (=> b!1279610 m!1175281))

(assert (=> b!1279610 m!1175277))

(declare-fun m!1175283 () Bool)

(assert (=> b!1279610 m!1175283))

(declare-fun m!1175285 () Bool)

(assert (=> bm!62772 m!1175285))

(assert (=> b!1279613 m!1175277))

(assert (=> b!1279613 m!1175277))

(declare-fun m!1175287 () Bool)

(assert (=> b!1279613 m!1175287))

(assert (=> b!1279562 d!140977))

(declare-fun condMapEmpty!51782 () Bool)

(declare-fun mapDefault!51782 () ValueCell!15845)

(assert (=> mapNonEmpty!51773 (= condMapEmpty!51782 (= mapRest!51773 ((as const (Array (_ BitVec 32) ValueCell!15845)) mapDefault!51782)))))

(declare-fun e!731038 () Bool)

(declare-fun mapRes!51782 () Bool)

(assert (=> mapNonEmpty!51773 (= tp!98747 (and e!731038 mapRes!51782))))

(declare-fun mapNonEmpty!51782 () Bool)

(declare-fun tp!98756 () Bool)

(declare-fun e!731037 () Bool)

(assert (=> mapNonEmpty!51782 (= mapRes!51782 (and tp!98756 e!731037))))

(declare-fun mapKey!51782 () (_ BitVec 32))

(declare-fun mapValue!51782 () ValueCell!15845)

(declare-fun mapRest!51782 () (Array (_ BitVec 32) ValueCell!15845))

(assert (=> mapNonEmpty!51782 (= mapRest!51773 (store mapRest!51782 mapKey!51782 mapValue!51782))))

(declare-fun b!1279621 () Bool)

(assert (=> b!1279621 (= e!731038 tp_is_empty!33487)))

(declare-fun b!1279620 () Bool)

(assert (=> b!1279620 (= e!731037 tp_is_empty!33487)))

(declare-fun mapIsEmpty!51782 () Bool)

(assert (=> mapIsEmpty!51782 mapRes!51782))

(assert (= (and mapNonEmpty!51773 condMapEmpty!51782) mapIsEmpty!51782))

(assert (= (and mapNonEmpty!51773 (not condMapEmpty!51782)) mapNonEmpty!51782))

(assert (= (and mapNonEmpty!51782 ((_ is ValueCellFull!15845) mapValue!51782)) b!1279620))

(assert (= (and mapNonEmpty!51773 ((_ is ValueCellFull!15845) mapDefault!51782)) b!1279621))

(declare-fun m!1175289 () Bool)

(assert (=> mapNonEmpty!51782 m!1175289))

(check-sat tp_is_empty!33487 (not bm!62772) (not b!1279610) (not b!1279613) (not mapNonEmpty!51782))
(check-sat)
