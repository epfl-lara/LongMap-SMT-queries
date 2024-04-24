; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108480 () Bool)

(assert start!108480)

(declare-fun b!1279486 () Bool)

(declare-fun res!849730 () Bool)

(declare-fun e!730932 () Bool)

(assert (=> b!1279486 (=> (not res!849730) (not e!730932))))

(declare-datatypes ((V!49745 0))(
  ( (V!49746 (val!16815 Int)) )
))
(declare-datatypes ((ValueCell!15842 0))(
  ( (ValueCellFull!15842 (v!19409 V!49745)) (EmptyCell!15842) )
))
(declare-datatypes ((array!84083 0))(
  ( (array!84084 (arr!40545 (Array (_ BitVec 32) ValueCell!15842)) (size!41096 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84083)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84085 0))(
  ( (array!84086 (arr!40546 (Array (_ BitVec 32) (_ BitVec 64))) (size!41097 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84085)

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1279486 (= res!849730 (and (= (size!41096 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41097 _keys!1741) (size!41096 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51761 () Bool)

(declare-fun mapRes!51761 () Bool)

(assert (=> mapIsEmpty!51761 mapRes!51761))

(declare-fun res!849728 () Bool)

(assert (=> start!108480 (=> (not res!849728) (not e!730932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108480 (= res!849728 (validMask!0 mask!2175))))

(assert (=> start!108480 e!730932))

(assert (=> start!108480 true))

(declare-fun e!730931 () Bool)

(declare-fun array_inv!30987 (array!84083) Bool)

(assert (=> start!108480 (and (array_inv!30987 _values!1445) e!730931)))

(declare-fun array_inv!30988 (array!84085) Bool)

(assert (=> start!108480 (array_inv!30988 _keys!1741)))

(declare-fun b!1279487 () Bool)

(declare-fun e!730933 () Bool)

(declare-fun tp_is_empty!33481 () Bool)

(assert (=> b!1279487 (= e!730933 tp_is_empty!33481)))

(declare-fun b!1279488 () Bool)

(declare-fun e!730929 () Bool)

(assert (=> b!1279488 (= e!730931 (and e!730929 mapRes!51761))))

(declare-fun condMapEmpty!51761 () Bool)

(declare-fun mapDefault!51761 () ValueCell!15842)

(assert (=> b!1279488 (= condMapEmpty!51761 (= (arr!40545 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15842)) mapDefault!51761)))))

(declare-fun b!1279489 () Bool)

(assert (=> b!1279489 (= e!730929 tp_is_empty!33481)))

(declare-fun b!1279490 () Bool)

(assert (=> b!1279490 (= e!730932 (bvsgt #b00000000000000000000000000000000 (size!41097 _keys!1741)))))

(declare-fun mapNonEmpty!51761 () Bool)

(declare-fun tp!98735 () Bool)

(assert (=> mapNonEmpty!51761 (= mapRes!51761 (and tp!98735 e!730933))))

(declare-fun mapKey!51761 () (_ BitVec 32))

(declare-fun mapValue!51761 () ValueCell!15842)

(declare-fun mapRest!51761 () (Array (_ BitVec 32) ValueCell!15842))

(assert (=> mapNonEmpty!51761 (= (arr!40545 _values!1445) (store mapRest!51761 mapKey!51761 mapValue!51761))))

(declare-fun b!1279491 () Bool)

(declare-fun res!849729 () Bool)

(assert (=> b!1279491 (=> (not res!849729) (not e!730932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84085 (_ BitVec 32)) Bool)

(assert (=> b!1279491 (= res!849729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108480 res!849728) b!1279486))

(assert (= (and b!1279486 res!849730) b!1279491))

(assert (= (and b!1279491 res!849729) b!1279490))

(assert (= (and b!1279488 condMapEmpty!51761) mapIsEmpty!51761))

(assert (= (and b!1279488 (not condMapEmpty!51761)) mapNonEmpty!51761))

(get-info :version)

(assert (= (and mapNonEmpty!51761 ((_ is ValueCellFull!15842) mapValue!51761)) b!1279487))

(assert (= (and b!1279488 ((_ is ValueCellFull!15842) mapDefault!51761)) b!1279489))

(assert (= start!108480 b!1279488))

(declare-fun m!1175203 () Bool)

(assert (=> start!108480 m!1175203))

(declare-fun m!1175205 () Bool)

(assert (=> start!108480 m!1175205))

(declare-fun m!1175207 () Bool)

(assert (=> start!108480 m!1175207))

(declare-fun m!1175209 () Bool)

(assert (=> mapNonEmpty!51761 m!1175209))

(declare-fun m!1175211 () Bool)

(assert (=> b!1279491 m!1175211))

(check-sat (not start!108480) (not b!1279491) (not mapNonEmpty!51761) tp_is_empty!33481)
(check-sat)
(get-model)

(declare-fun d!140961 () Bool)

(assert (=> d!140961 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108480 d!140961))

(declare-fun d!140963 () Bool)

(assert (=> d!140963 (= (array_inv!30987 _values!1445) (bvsge (size!41096 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108480 d!140963))

(declare-fun d!140965 () Bool)

(assert (=> d!140965 (= (array_inv!30988 _keys!1741) (bvsge (size!41097 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108480 d!140965))

(declare-fun b!1279536 () Bool)

(declare-fun e!730970 () Bool)

(declare-fun e!730972 () Bool)

(assert (=> b!1279536 (= e!730970 e!730972)))

(declare-fun lt!576336 () (_ BitVec 64))

(assert (=> b!1279536 (= lt!576336 (select (arr!40546 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42352 0))(
  ( (Unit!42353) )
))
(declare-fun lt!576338 () Unit!42352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84085 (_ BitVec 64) (_ BitVec 32)) Unit!42352)

(assert (=> b!1279536 (= lt!576338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576336 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1279536 (arrayContainsKey!0 _keys!1741 lt!576336 #b00000000000000000000000000000000)))

(declare-fun lt!576337 () Unit!42352)

(assert (=> b!1279536 (= lt!576337 lt!576338)))

(declare-fun res!849754 () Bool)

(declare-datatypes ((SeekEntryResult!9964 0))(
  ( (MissingZero!9964 (index!42227 (_ BitVec 32))) (Found!9964 (index!42228 (_ BitVec 32))) (Intermediate!9964 (undefined!10776 Bool) (index!42229 (_ BitVec 32)) (x!113275 (_ BitVec 32))) (Undefined!9964) (MissingVacant!9964 (index!42230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84085 (_ BitVec 32)) SeekEntryResult!9964)

(assert (=> b!1279536 (= res!849754 (= (seekEntryOrOpen!0 (select (arr!40546 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9964 #b00000000000000000000000000000000)))))

(assert (=> b!1279536 (=> (not res!849754) (not e!730972))))

(declare-fun bm!62769 () Bool)

(declare-fun call!62772 () Bool)

(assert (=> bm!62769 (= call!62772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!140967 () Bool)

(declare-fun res!849753 () Bool)

(declare-fun e!730971 () Bool)

(assert (=> d!140967 (=> res!849753 e!730971)))

(assert (=> d!140967 (= res!849753 (bvsge #b00000000000000000000000000000000 (size!41097 _keys!1741)))))

(assert (=> d!140967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730971)))

(declare-fun b!1279537 () Bool)

(assert (=> b!1279537 (= e!730972 call!62772)))

(declare-fun b!1279538 () Bool)

(assert (=> b!1279538 (= e!730971 e!730970)))

(declare-fun c!124429 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1279538 (= c!124429 (validKeyInArray!0 (select (arr!40546 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1279539 () Bool)

(assert (=> b!1279539 (= e!730970 call!62772)))

(assert (= (and d!140967 (not res!849753)) b!1279538))

(assert (= (and b!1279538 c!124429) b!1279536))

(assert (= (and b!1279538 (not c!124429)) b!1279539))

(assert (= (and b!1279536 res!849754) b!1279537))

(assert (= (or b!1279537 b!1279539) bm!62769))

(declare-fun m!1175233 () Bool)

(assert (=> b!1279536 m!1175233))

(declare-fun m!1175235 () Bool)

(assert (=> b!1279536 m!1175235))

(declare-fun m!1175237 () Bool)

(assert (=> b!1279536 m!1175237))

(assert (=> b!1279536 m!1175233))

(declare-fun m!1175239 () Bool)

(assert (=> b!1279536 m!1175239))

(declare-fun m!1175241 () Bool)

(assert (=> bm!62769 m!1175241))

(assert (=> b!1279538 m!1175233))

(assert (=> b!1279538 m!1175233))

(declare-fun m!1175243 () Bool)

(assert (=> b!1279538 m!1175243))

(assert (=> b!1279491 d!140967))

(declare-fun b!1279547 () Bool)

(declare-fun e!730978 () Bool)

(assert (=> b!1279547 (= e!730978 tp_is_empty!33481)))

(declare-fun mapNonEmpty!51770 () Bool)

(declare-fun mapRes!51770 () Bool)

(declare-fun tp!98744 () Bool)

(declare-fun e!730977 () Bool)

(assert (=> mapNonEmpty!51770 (= mapRes!51770 (and tp!98744 e!730977))))

(declare-fun mapValue!51770 () ValueCell!15842)

(declare-fun mapKey!51770 () (_ BitVec 32))

(declare-fun mapRest!51770 () (Array (_ BitVec 32) ValueCell!15842))

(assert (=> mapNonEmpty!51770 (= mapRest!51761 (store mapRest!51770 mapKey!51770 mapValue!51770))))

(declare-fun mapIsEmpty!51770 () Bool)

(assert (=> mapIsEmpty!51770 mapRes!51770))

(declare-fun b!1279546 () Bool)

(assert (=> b!1279546 (= e!730977 tp_is_empty!33481)))

(declare-fun condMapEmpty!51770 () Bool)

(declare-fun mapDefault!51770 () ValueCell!15842)

(assert (=> mapNonEmpty!51761 (= condMapEmpty!51770 (= mapRest!51761 ((as const (Array (_ BitVec 32) ValueCell!15842)) mapDefault!51770)))))

(assert (=> mapNonEmpty!51761 (= tp!98735 (and e!730978 mapRes!51770))))

(assert (= (and mapNonEmpty!51761 condMapEmpty!51770) mapIsEmpty!51770))

(assert (= (and mapNonEmpty!51761 (not condMapEmpty!51770)) mapNonEmpty!51770))

(assert (= (and mapNonEmpty!51770 ((_ is ValueCellFull!15842) mapValue!51770)) b!1279546))

(assert (= (and mapNonEmpty!51761 ((_ is ValueCellFull!15842) mapDefault!51770)) b!1279547))

(declare-fun m!1175245 () Bool)

(assert (=> mapNonEmpty!51770 m!1175245))

(check-sat tp_is_empty!33481 (not b!1279536) (not bm!62769) (not b!1279538) (not mapNonEmpty!51770))
(check-sat)
