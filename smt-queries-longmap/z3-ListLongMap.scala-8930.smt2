; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108286 () Bool)

(assert start!108286)

(declare-fun mapIsEmpty!51788 () Bool)

(declare-fun mapRes!51788 () Bool)

(assert (=> mapIsEmpty!51788 mapRes!51788))

(declare-fun b!1278352 () Bool)

(declare-fun res!849289 () Bool)

(declare-fun e!730220 () Bool)

(assert (=> b!1278352 (=> (not res!849289) (not e!730220))))

(declare-datatypes ((array!84082 0))(
  ( (array!84083 (arr!40547 (Array (_ BitVec 32) (_ BitVec 64))) (size!41097 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84082)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84082 (_ BitVec 32)) Bool)

(assert (=> b!1278352 (= res!849289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278353 () Bool)

(declare-fun e!730217 () Bool)

(declare-fun e!730221 () Bool)

(assert (=> b!1278353 (= e!730217 (and e!730221 mapRes!51788))))

(declare-fun condMapEmpty!51788 () Bool)

(declare-datatypes ((V!49763 0))(
  ( (V!49764 (val!16822 Int)) )
))
(declare-datatypes ((ValueCell!15849 0))(
  ( (ValueCellFull!15849 (v!19421 V!49763)) (EmptyCell!15849) )
))
(declare-datatypes ((array!84084 0))(
  ( (array!84085 (arr!40548 (Array (_ BitVec 32) ValueCell!15849)) (size!41098 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84084)

(declare-fun mapDefault!51788 () ValueCell!15849)

(assert (=> b!1278353 (= condMapEmpty!51788 (= (arr!40548 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15849)) mapDefault!51788)))))

(declare-fun b!1278354 () Bool)

(declare-fun e!730219 () Bool)

(declare-fun tp_is_empty!33495 () Bool)

(assert (=> b!1278354 (= e!730219 tp_is_empty!33495)))

(declare-fun b!1278355 () Bool)

(declare-datatypes ((List!28737 0))(
  ( (Nil!28734) (Cons!28733 (h!29942 (_ BitVec 64)) (t!42277 List!28737)) )
))
(declare-fun noDuplicate!2054 (List!28737) Bool)

(assert (=> b!1278355 (= e!730220 (not (noDuplicate!2054 Nil!28734)))))

(declare-fun b!1278356 () Bool)

(declare-fun res!849291 () Bool)

(assert (=> b!1278356 (=> (not res!849291) (not e!730220))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278356 (= res!849291 (and (= (size!41098 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41097 _keys!1741) (size!41098 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278357 () Bool)

(assert (=> b!1278357 (= e!730221 tp_is_empty!33495)))

(declare-fun mapNonEmpty!51788 () Bool)

(declare-fun tp!98762 () Bool)

(assert (=> mapNonEmpty!51788 (= mapRes!51788 (and tp!98762 e!730219))))

(declare-fun mapRest!51788 () (Array (_ BitVec 32) ValueCell!15849))

(declare-fun mapValue!51788 () ValueCell!15849)

(declare-fun mapKey!51788 () (_ BitVec 32))

(assert (=> mapNonEmpty!51788 (= (arr!40548 _values!1445) (store mapRest!51788 mapKey!51788 mapValue!51788))))

(declare-fun b!1278358 () Bool)

(declare-fun res!849290 () Bool)

(assert (=> b!1278358 (=> (not res!849290) (not e!730220))))

(assert (=> b!1278358 (= res!849290 (and (bvsle #b00000000000000000000000000000000 (size!41097 _keys!1741)) (bvslt (size!41097 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun res!849288 () Bool)

(assert (=> start!108286 (=> (not res!849288) (not e!730220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108286 (= res!849288 (validMask!0 mask!2175))))

(assert (=> start!108286 e!730220))

(assert (=> start!108286 true))

(declare-fun array_inv!30799 (array!84084) Bool)

(assert (=> start!108286 (and (array_inv!30799 _values!1445) e!730217)))

(declare-fun array_inv!30800 (array!84082) Bool)

(assert (=> start!108286 (array_inv!30800 _keys!1741)))

(assert (= (and start!108286 res!849288) b!1278356))

(assert (= (and b!1278356 res!849291) b!1278352))

(assert (= (and b!1278352 res!849289) b!1278358))

(assert (= (and b!1278358 res!849290) b!1278355))

(assert (= (and b!1278353 condMapEmpty!51788) mapIsEmpty!51788))

(assert (= (and b!1278353 (not condMapEmpty!51788)) mapNonEmpty!51788))

(get-info :version)

(assert (= (and mapNonEmpty!51788 ((_ is ValueCellFull!15849) mapValue!51788)) b!1278354))

(assert (= (and b!1278353 ((_ is ValueCellFull!15849) mapDefault!51788)) b!1278357))

(assert (= start!108286 b!1278353))

(declare-fun m!1173691 () Bool)

(assert (=> b!1278352 m!1173691))

(declare-fun m!1173693 () Bool)

(assert (=> b!1278355 m!1173693))

(declare-fun m!1173695 () Bool)

(assert (=> mapNonEmpty!51788 m!1173695))

(declare-fun m!1173697 () Bool)

(assert (=> start!108286 m!1173697))

(declare-fun m!1173699 () Bool)

(assert (=> start!108286 m!1173699))

(declare-fun m!1173701 () Bool)

(assert (=> start!108286 m!1173701))

(check-sat (not start!108286) (not mapNonEmpty!51788) (not b!1278355) (not b!1278352) tp_is_empty!33495)
(check-sat)
(get-model)

(declare-fun d!140533 () Bool)

(declare-fun res!849308 () Bool)

(declare-fun e!730241 () Bool)

(assert (=> d!140533 (=> res!849308 e!730241)))

(assert (=> d!140533 (= res!849308 ((_ is Nil!28734) Nil!28734))))

(assert (=> d!140533 (= (noDuplicate!2054 Nil!28734) e!730241)))

(declare-fun b!1278384 () Bool)

(declare-fun e!730242 () Bool)

(assert (=> b!1278384 (= e!730241 e!730242)))

(declare-fun res!849309 () Bool)

(assert (=> b!1278384 (=> (not res!849309) (not e!730242))))

(declare-fun contains!7735 (List!28737 (_ BitVec 64)) Bool)

(assert (=> b!1278384 (= res!849309 (not (contains!7735 (t!42277 Nil!28734) (h!29942 Nil!28734))))))

(declare-fun b!1278385 () Bool)

(assert (=> b!1278385 (= e!730242 (noDuplicate!2054 (t!42277 Nil!28734)))))

(assert (= (and d!140533 (not res!849308)) b!1278384))

(assert (= (and b!1278384 res!849309) b!1278385))

(declare-fun m!1173715 () Bool)

(assert (=> b!1278384 m!1173715))

(declare-fun m!1173717 () Bool)

(assert (=> b!1278385 m!1173717))

(assert (=> b!1278355 d!140533))

(declare-fun d!140535 () Bool)

(assert (=> d!140535 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108286 d!140535))

(declare-fun d!140537 () Bool)

(assert (=> d!140537 (= (array_inv!30799 _values!1445) (bvsge (size!41098 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108286 d!140537))

(declare-fun d!140539 () Bool)

(assert (=> d!140539 (= (array_inv!30800 _keys!1741) (bvsge (size!41097 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108286 d!140539))

(declare-fun b!1278394 () Bool)

(declare-fun e!730249 () Bool)

(declare-fun call!62713 () Bool)

(assert (=> b!1278394 (= e!730249 call!62713)))

(declare-fun d!140541 () Bool)

(declare-fun res!849314 () Bool)

(declare-fun e!730251 () Bool)

(assert (=> d!140541 (=> res!849314 e!730251)))

(assert (=> d!140541 (= res!849314 (bvsge #b00000000000000000000000000000000 (size!41097 _keys!1741)))))

(assert (=> d!140541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730251)))

(declare-fun b!1278395 () Bool)

(declare-fun e!730250 () Bool)

(assert (=> b!1278395 (= e!730250 call!62713)))

(declare-fun b!1278396 () Bool)

(assert (=> b!1278396 (= e!730251 e!730249)))

(declare-fun c!124035 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278396 (= c!124035 (validKeyInArray!0 (select (arr!40547 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62710 () Bool)

(assert (=> bm!62710 (= call!62713 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1278397 () Bool)

(assert (=> b!1278397 (= e!730249 e!730250)))

(declare-fun lt!575872 () (_ BitVec 64))

(assert (=> b!1278397 (= lt!575872 (select (arr!40547 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42389 0))(
  ( (Unit!42390) )
))
(declare-fun lt!575870 () Unit!42389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84082 (_ BitVec 64) (_ BitVec 32)) Unit!42389)

(assert (=> b!1278397 (= lt!575870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575872 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278397 (arrayContainsKey!0 _keys!1741 lt!575872 #b00000000000000000000000000000000)))

(declare-fun lt!575871 () Unit!42389)

(assert (=> b!1278397 (= lt!575871 lt!575870)))

(declare-fun res!849315 () Bool)

(declare-datatypes ((SeekEntryResult!10010 0))(
  ( (MissingZero!10010 (index!42411 (_ BitVec 32))) (Found!10010 (index!42412 (_ BitVec 32))) (Intermediate!10010 (undefined!10822 Bool) (index!42413 (_ BitVec 32)) (x!113319 (_ BitVec 32))) (Undefined!10010) (MissingVacant!10010 (index!42414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84082 (_ BitVec 32)) SeekEntryResult!10010)

(assert (=> b!1278397 (= res!849315 (= (seekEntryOrOpen!0 (select (arr!40547 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10010 #b00000000000000000000000000000000)))))

(assert (=> b!1278397 (=> (not res!849315) (not e!730250))))

(assert (= (and d!140541 (not res!849314)) b!1278396))

(assert (= (and b!1278396 c!124035) b!1278397))

(assert (= (and b!1278396 (not c!124035)) b!1278394))

(assert (= (and b!1278397 res!849315) b!1278395))

(assert (= (or b!1278395 b!1278394) bm!62710))

(declare-fun m!1173719 () Bool)

(assert (=> b!1278396 m!1173719))

(assert (=> b!1278396 m!1173719))

(declare-fun m!1173721 () Bool)

(assert (=> b!1278396 m!1173721))

(declare-fun m!1173723 () Bool)

(assert (=> bm!62710 m!1173723))

(assert (=> b!1278397 m!1173719))

(declare-fun m!1173725 () Bool)

(assert (=> b!1278397 m!1173725))

(declare-fun m!1173727 () Bool)

(assert (=> b!1278397 m!1173727))

(assert (=> b!1278397 m!1173719))

(declare-fun m!1173729 () Bool)

(assert (=> b!1278397 m!1173729))

(assert (=> b!1278352 d!140541))

(declare-fun mapNonEmpty!51794 () Bool)

(declare-fun mapRes!51794 () Bool)

(declare-fun tp!98768 () Bool)

(declare-fun e!730256 () Bool)

(assert (=> mapNonEmpty!51794 (= mapRes!51794 (and tp!98768 e!730256))))

(declare-fun mapKey!51794 () (_ BitVec 32))

(declare-fun mapValue!51794 () ValueCell!15849)

(declare-fun mapRest!51794 () (Array (_ BitVec 32) ValueCell!15849))

(assert (=> mapNonEmpty!51794 (= mapRest!51788 (store mapRest!51794 mapKey!51794 mapValue!51794))))

(declare-fun mapIsEmpty!51794 () Bool)

(assert (=> mapIsEmpty!51794 mapRes!51794))

(declare-fun b!1278405 () Bool)

(declare-fun e!730257 () Bool)

(assert (=> b!1278405 (= e!730257 tp_is_empty!33495)))

(declare-fun condMapEmpty!51794 () Bool)

(declare-fun mapDefault!51794 () ValueCell!15849)

(assert (=> mapNonEmpty!51788 (= condMapEmpty!51794 (= mapRest!51788 ((as const (Array (_ BitVec 32) ValueCell!15849)) mapDefault!51794)))))

(assert (=> mapNonEmpty!51788 (= tp!98762 (and e!730257 mapRes!51794))))

(declare-fun b!1278404 () Bool)

(assert (=> b!1278404 (= e!730256 tp_is_empty!33495)))

(assert (= (and mapNonEmpty!51788 condMapEmpty!51794) mapIsEmpty!51794))

(assert (= (and mapNonEmpty!51788 (not condMapEmpty!51794)) mapNonEmpty!51794))

(assert (= (and mapNonEmpty!51794 ((_ is ValueCellFull!15849) mapValue!51794)) b!1278404))

(assert (= (and mapNonEmpty!51788 ((_ is ValueCellFull!15849) mapDefault!51794)) b!1278405))

(declare-fun m!1173731 () Bool)

(assert (=> mapNonEmpty!51794 m!1173731))

(check-sat (not mapNonEmpty!51794) (not b!1278384) (not b!1278397) (not b!1278396) (not bm!62710) tp_is_empty!33495 (not b!1278385))
(check-sat)
