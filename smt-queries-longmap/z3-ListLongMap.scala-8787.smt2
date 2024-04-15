; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106908 () Bool)

(assert start!106908)

(declare-fun b!1268013 () Bool)

(declare-fun e!722480 () Bool)

(declare-datatypes ((array!82463 0))(
  ( (array!82464 (arr!39773 (Array (_ BitVec 32) (_ BitVec 64))) (size!40311 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82463)

(assert (=> b!1268013 (= e!722480 (bvsgt #b00000000000000000000000000000000 (size!40311 _keys!1364)))))

(declare-fun b!1268014 () Bool)

(declare-fun e!722476 () Bool)

(declare-fun tp_is_empty!32635 () Bool)

(assert (=> b!1268014 (= e!722476 tp_is_empty!32635)))

(declare-fun mapNonEmpty!50521 () Bool)

(declare-fun mapRes!50521 () Bool)

(declare-fun tp!96701 () Bool)

(declare-fun e!722477 () Bool)

(assert (=> mapNonEmpty!50521 (= mapRes!50521 (and tp!96701 e!722477))))

(declare-datatypes ((V!48707 0))(
  ( (V!48708 (val!16392 Int)) )
))
(declare-datatypes ((ValueCell!15464 0))(
  ( (ValueCellFull!15464 (v!19027 V!48707)) (EmptyCell!15464) )
))
(declare-datatypes ((array!82465 0))(
  ( (array!82466 (arr!39774 (Array (_ BitVec 32) ValueCell!15464)) (size!40312 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82465)

(declare-fun mapKey!50521 () (_ BitVec 32))

(declare-fun mapRest!50521 () (Array (_ BitVec 32) ValueCell!15464))

(declare-fun mapValue!50521 () ValueCell!15464)

(assert (=> mapNonEmpty!50521 (= (arr!39774 _values!1134) (store mapRest!50521 mapKey!50521 mapValue!50521))))

(declare-fun b!1268015 () Bool)

(declare-fun res!844030 () Bool)

(assert (=> b!1268015 (=> (not res!844030) (not e!722480))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268015 (= res!844030 (and (= (size!40312 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40311 _keys!1364) (size!40312 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844031 () Bool)

(assert (=> start!106908 (=> (not res!844031) (not e!722480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106908 (= res!844031 (validMask!0 mask!1730))))

(assert (=> start!106908 e!722480))

(declare-fun e!722478 () Bool)

(declare-fun array_inv!30433 (array!82465) Bool)

(assert (=> start!106908 (and (array_inv!30433 _values!1134) e!722478)))

(assert (=> start!106908 true))

(declare-fun array_inv!30434 (array!82463) Bool)

(assert (=> start!106908 (array_inv!30434 _keys!1364)))

(declare-fun mapIsEmpty!50521 () Bool)

(assert (=> mapIsEmpty!50521 mapRes!50521))

(declare-fun b!1268016 () Bool)

(assert (=> b!1268016 (= e!722478 (and e!722476 mapRes!50521))))

(declare-fun condMapEmpty!50521 () Bool)

(declare-fun mapDefault!50521 () ValueCell!15464)

(assert (=> b!1268016 (= condMapEmpty!50521 (= (arr!39774 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15464)) mapDefault!50521)))))

(declare-fun b!1268017 () Bool)

(declare-fun res!844032 () Bool)

(assert (=> b!1268017 (=> (not res!844032) (not e!722480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82463 (_ BitVec 32)) Bool)

(assert (=> b!1268017 (= res!844032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268018 () Bool)

(assert (=> b!1268018 (= e!722477 tp_is_empty!32635)))

(assert (= (and start!106908 res!844031) b!1268015))

(assert (= (and b!1268015 res!844030) b!1268017))

(assert (= (and b!1268017 res!844032) b!1268013))

(assert (= (and b!1268016 condMapEmpty!50521) mapIsEmpty!50521))

(assert (= (and b!1268016 (not condMapEmpty!50521)) mapNonEmpty!50521))

(get-info :version)

(assert (= (and mapNonEmpty!50521 ((_ is ValueCellFull!15464) mapValue!50521)) b!1268018))

(assert (= (and b!1268016 ((_ is ValueCellFull!15464) mapDefault!50521)) b!1268014))

(assert (= start!106908 b!1268016))

(declare-fun m!1166557 () Bool)

(assert (=> mapNonEmpty!50521 m!1166557))

(declare-fun m!1166559 () Bool)

(assert (=> start!106908 m!1166559))

(declare-fun m!1166561 () Bool)

(assert (=> start!106908 m!1166561))

(declare-fun m!1166563 () Bool)

(assert (=> start!106908 m!1166563))

(declare-fun m!1166565 () Bool)

(assert (=> b!1268017 m!1166565))

(check-sat (not b!1268017) (not start!106908) (not mapNonEmpty!50521) tp_is_empty!32635)
(check-sat)
(get-model)

(declare-fun b!1268063 () Bool)

(declare-fun e!722518 () Bool)

(declare-fun e!722519 () Bool)

(assert (=> b!1268063 (= e!722518 e!722519)))

(declare-fun lt!574212 () (_ BitVec 64))

(assert (=> b!1268063 (= lt!574212 (select (arr!39773 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42078 0))(
  ( (Unit!42079) )
))
(declare-fun lt!574211 () Unit!42078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82463 (_ BitVec 64) (_ BitVec 32)) Unit!42078)

(assert (=> b!1268063 (= lt!574211 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574212 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268063 (arrayContainsKey!0 _keys!1364 lt!574212 #b00000000000000000000000000000000)))

(declare-fun lt!574213 () Unit!42078)

(assert (=> b!1268063 (= lt!574213 lt!574211)))

(declare-fun res!844056 () Bool)

(declare-datatypes ((SeekEntryResult!9982 0))(
  ( (MissingZero!9982 (index!42299 (_ BitVec 32))) (Found!9982 (index!42300 (_ BitVec 32))) (Intermediate!9982 (undefined!10794 Bool) (index!42301 (_ BitVec 32)) (x!111830 (_ BitVec 32))) (Undefined!9982) (MissingVacant!9982 (index!42302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82463 (_ BitVec 32)) SeekEntryResult!9982)

(assert (=> b!1268063 (= res!844056 (= (seekEntryOrOpen!0 (select (arr!39773 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9982 #b00000000000000000000000000000000)))))

(assert (=> b!1268063 (=> (not res!844056) (not e!722519))))

(declare-fun bm!62484 () Bool)

(declare-fun call!62487 () Bool)

(assert (=> bm!62484 (= call!62487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1268065 () Bool)

(assert (=> b!1268065 (= e!722519 call!62487)))

(declare-fun b!1268066 () Bool)

(declare-fun e!722517 () Bool)

(assert (=> b!1268066 (= e!722517 e!722518)))

(declare-fun c!123607 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268066 (= c!123607 (validKeyInArray!0 (select (arr!39773 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1268064 () Bool)

(assert (=> b!1268064 (= e!722518 call!62487)))

(declare-fun d!139527 () Bool)

(declare-fun res!844055 () Bool)

(assert (=> d!139527 (=> res!844055 e!722517)))

(assert (=> d!139527 (= res!844055 (bvsge #b00000000000000000000000000000000 (size!40311 _keys!1364)))))

(assert (=> d!139527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722517)))

(assert (= (and d!139527 (not res!844055)) b!1268066))

(assert (= (and b!1268066 c!123607) b!1268063))

(assert (= (and b!1268066 (not c!123607)) b!1268064))

(assert (= (and b!1268063 res!844056) b!1268065))

(assert (= (or b!1268065 b!1268064) bm!62484))

(declare-fun m!1166587 () Bool)

(assert (=> b!1268063 m!1166587))

(declare-fun m!1166589 () Bool)

(assert (=> b!1268063 m!1166589))

(declare-fun m!1166591 () Bool)

(assert (=> b!1268063 m!1166591))

(assert (=> b!1268063 m!1166587))

(declare-fun m!1166593 () Bool)

(assert (=> b!1268063 m!1166593))

(declare-fun m!1166595 () Bool)

(assert (=> bm!62484 m!1166595))

(assert (=> b!1268066 m!1166587))

(assert (=> b!1268066 m!1166587))

(declare-fun m!1166597 () Bool)

(assert (=> b!1268066 m!1166597))

(assert (=> b!1268017 d!139527))

(declare-fun d!139529 () Bool)

(assert (=> d!139529 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106908 d!139529))

(declare-fun d!139531 () Bool)

(assert (=> d!139531 (= (array_inv!30433 _values!1134) (bvsge (size!40312 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106908 d!139531))

(declare-fun d!139533 () Bool)

(assert (=> d!139533 (= (array_inv!30434 _keys!1364) (bvsge (size!40311 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106908 d!139533))

(declare-fun b!1268073 () Bool)

(declare-fun e!722524 () Bool)

(assert (=> b!1268073 (= e!722524 tp_is_empty!32635)))

(declare-fun b!1268074 () Bool)

(declare-fun e!722525 () Bool)

(assert (=> b!1268074 (= e!722525 tp_is_empty!32635)))

(declare-fun mapIsEmpty!50530 () Bool)

(declare-fun mapRes!50530 () Bool)

(assert (=> mapIsEmpty!50530 mapRes!50530))

(declare-fun condMapEmpty!50530 () Bool)

(declare-fun mapDefault!50530 () ValueCell!15464)

(assert (=> mapNonEmpty!50521 (= condMapEmpty!50530 (= mapRest!50521 ((as const (Array (_ BitVec 32) ValueCell!15464)) mapDefault!50530)))))

(assert (=> mapNonEmpty!50521 (= tp!96701 (and e!722525 mapRes!50530))))

(declare-fun mapNonEmpty!50530 () Bool)

(declare-fun tp!96710 () Bool)

(assert (=> mapNonEmpty!50530 (= mapRes!50530 (and tp!96710 e!722524))))

(declare-fun mapValue!50530 () ValueCell!15464)

(declare-fun mapRest!50530 () (Array (_ BitVec 32) ValueCell!15464))

(declare-fun mapKey!50530 () (_ BitVec 32))

(assert (=> mapNonEmpty!50530 (= mapRest!50521 (store mapRest!50530 mapKey!50530 mapValue!50530))))

(assert (= (and mapNonEmpty!50521 condMapEmpty!50530) mapIsEmpty!50530))

(assert (= (and mapNonEmpty!50521 (not condMapEmpty!50530)) mapNonEmpty!50530))

(assert (= (and mapNonEmpty!50530 ((_ is ValueCellFull!15464) mapValue!50530)) b!1268073))

(assert (= (and mapNonEmpty!50521 ((_ is ValueCellFull!15464) mapDefault!50530)) b!1268074))

(declare-fun m!1166599 () Bool)

(assert (=> mapNonEmpty!50530 m!1166599))

(check-sat (not mapNonEmpty!50530) (not bm!62484) (not b!1268066) tp_is_empty!32635 (not b!1268063))
(check-sat)
