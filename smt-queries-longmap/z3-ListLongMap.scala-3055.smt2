; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43152 () Bool)

(assert start!43152)

(declare-fun res!285460 () Bool)

(declare-fun e!281310 () Bool)

(assert (=> start!43152 (=> (not res!285460) (not e!281310))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43152 (= res!285460 (validMask!0 mask!2352))))

(assert (=> start!43152 e!281310))

(assert (=> start!43152 true))

(declare-datatypes ((V!19155 0))(
  ( (V!19156 (val!6829 Int)) )
))
(declare-datatypes ((ValueCell!6420 0))(
  ( (ValueCellFull!6420 (v!9117 V!19155)) (EmptyCell!6420) )
))
(declare-datatypes ((array!30799 0))(
  ( (array!30800 (arr!14809 (Array (_ BitVec 32) ValueCell!6420)) (size!15167 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30799)

(declare-fun e!281312 () Bool)

(declare-fun array_inv!10684 (array!30799) Bool)

(assert (=> start!43152 (and (array_inv!10684 _values!1516) e!281312)))

(declare-datatypes ((array!30801 0))(
  ( (array!30802 (arr!14810 (Array (_ BitVec 32) (_ BitVec 64))) (size!15168 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30801)

(declare-fun array_inv!10685 (array!30801) Bool)

(assert (=> start!43152 (array_inv!10685 _keys!1874)))

(declare-fun mapIsEmpty!22033 () Bool)

(declare-fun mapRes!22033 () Bool)

(assert (=> mapIsEmpty!22033 mapRes!22033))

(declare-fun mapNonEmpty!22033 () Bool)

(declare-fun tp!42508 () Bool)

(declare-fun e!281311 () Bool)

(assert (=> mapNonEmpty!22033 (= mapRes!22033 (and tp!42508 e!281311))))

(declare-fun mapValue!22033 () ValueCell!6420)

(declare-fun mapKey!22033 () (_ BitVec 32))

(declare-fun mapRest!22033 () (Array (_ BitVec 32) ValueCell!6420))

(assert (=> mapNonEmpty!22033 (= (arr!14809 _values!1516) (store mapRest!22033 mapKey!22033 mapValue!22033))))

(declare-fun b!478461 () Bool)

(declare-fun e!281313 () Bool)

(declare-fun tp_is_empty!13563 () Bool)

(assert (=> b!478461 (= e!281313 tp_is_empty!13563)))

(declare-fun b!478462 () Bool)

(assert (=> b!478462 (= e!281312 (and e!281313 mapRes!22033))))

(declare-fun condMapEmpty!22033 () Bool)

(declare-fun mapDefault!22033 () ValueCell!6420)

(assert (=> b!478462 (= condMapEmpty!22033 (= (arr!14809 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6420)) mapDefault!22033)))))

(declare-fun b!478463 () Bool)

(declare-fun res!285463 () Bool)

(assert (=> b!478463 (=> (not res!285463) (not e!281310))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478463 (= res!285463 (and (= (size!15167 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15168 _keys!1874) (size!15167 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478464 () Bool)

(declare-datatypes ((List!9060 0))(
  ( (Nil!9057) (Cons!9056 (h!9912 (_ BitVec 64)) (t!15266 List!9060)) )
))
(declare-fun noDuplicate!204 (List!9060) Bool)

(assert (=> b!478464 (= e!281310 (not (noDuplicate!204 Nil!9057)))))

(declare-fun b!478465 () Bool)

(declare-fun res!285462 () Bool)

(assert (=> b!478465 (=> (not res!285462) (not e!281310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30801 (_ BitVec 32)) Bool)

(assert (=> b!478465 (= res!285462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478466 () Bool)

(assert (=> b!478466 (= e!281311 tp_is_empty!13563)))

(declare-fun b!478467 () Bool)

(declare-fun res!285461 () Bool)

(assert (=> b!478467 (=> (not res!285461) (not e!281310))))

(assert (=> b!478467 (= res!285461 (and (bvsle #b00000000000000000000000000000000 (size!15168 _keys!1874)) (bvslt (size!15168 _keys!1874) #b01111111111111111111111111111111)))))

(assert (= (and start!43152 res!285460) b!478463))

(assert (= (and b!478463 res!285463) b!478465))

(assert (= (and b!478465 res!285462) b!478467))

(assert (= (and b!478467 res!285461) b!478464))

(assert (= (and b!478462 condMapEmpty!22033) mapIsEmpty!22033))

(assert (= (and b!478462 (not condMapEmpty!22033)) mapNonEmpty!22033))

(get-info :version)

(assert (= (and mapNonEmpty!22033 ((_ is ValueCellFull!6420) mapValue!22033)) b!478466))

(assert (= (and b!478462 ((_ is ValueCellFull!6420) mapDefault!22033)) b!478461))

(assert (= start!43152 b!478462))

(declare-fun m!460723 () Bool)

(assert (=> start!43152 m!460723))

(declare-fun m!460725 () Bool)

(assert (=> start!43152 m!460725))

(declare-fun m!460727 () Bool)

(assert (=> start!43152 m!460727))

(declare-fun m!460729 () Bool)

(assert (=> mapNonEmpty!22033 m!460729))

(declare-fun m!460731 () Bool)

(assert (=> b!478464 m!460731))

(declare-fun m!460733 () Bool)

(assert (=> b!478465 m!460733))

(check-sat (not mapNonEmpty!22033) tp_is_empty!13563 (not b!478464) (not b!478465) (not start!43152))
(check-sat)
(get-model)

(declare-fun d!76609 () Bool)

(assert (=> d!76609 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43152 d!76609))

(declare-fun d!76611 () Bool)

(assert (=> d!76611 (= (array_inv!10684 _values!1516) (bvsge (size!15167 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43152 d!76611))

(declare-fun d!76613 () Bool)

(assert (=> d!76613 (= (array_inv!10685 _keys!1874) (bvsge (size!15168 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43152 d!76613))

(declare-fun bm!30835 () Bool)

(declare-fun call!30838 () Bool)

(assert (=> bm!30835 (= call!30838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478497 () Bool)

(declare-fun e!281336 () Bool)

(declare-fun e!281338 () Bool)

(assert (=> b!478497 (= e!281336 e!281338)))

(declare-fun c!57667 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478497 (= c!57667 (validKeyInArray!0 (select (arr!14810 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478498 () Bool)

(declare-fun e!281337 () Bool)

(assert (=> b!478498 (= e!281337 call!30838)))

(declare-fun b!478499 () Bool)

(assert (=> b!478499 (= e!281338 e!281337)))

(declare-fun lt!217728 () (_ BitVec 64))

(assert (=> b!478499 (= lt!217728 (select (arr!14810 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14062 0))(
  ( (Unit!14063) )
))
(declare-fun lt!217726 () Unit!14062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30801 (_ BitVec 64) (_ BitVec 32)) Unit!14062)

(assert (=> b!478499 (= lt!217726 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217728 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478499 (arrayContainsKey!0 _keys!1874 lt!217728 #b00000000000000000000000000000000)))

(declare-fun lt!217727 () Unit!14062)

(assert (=> b!478499 (= lt!217727 lt!217726)))

(declare-fun res!285480 () Bool)

(declare-datatypes ((SeekEntryResult!3565 0))(
  ( (MissingZero!3565 (index!16439 (_ BitVec 32))) (Found!3565 (index!16440 (_ BitVec 32))) (Intermediate!3565 (undefined!4377 Bool) (index!16441 (_ BitVec 32)) (x!44905 (_ BitVec 32))) (Undefined!3565) (MissingVacant!3565 (index!16442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30801 (_ BitVec 32)) SeekEntryResult!3565)

(assert (=> b!478499 (= res!285480 (= (seekEntryOrOpen!0 (select (arr!14810 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3565 #b00000000000000000000000000000000)))))

(assert (=> b!478499 (=> (not res!285480) (not e!281337))))

(declare-fun d!76615 () Bool)

(declare-fun res!285481 () Bool)

(assert (=> d!76615 (=> res!285481 e!281336)))

(assert (=> d!76615 (= res!285481 (bvsge #b00000000000000000000000000000000 (size!15168 _keys!1874)))))

(assert (=> d!76615 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281336)))

(declare-fun b!478500 () Bool)

(assert (=> b!478500 (= e!281338 call!30838)))

(assert (= (and d!76615 (not res!285481)) b!478497))

(assert (= (and b!478497 c!57667) b!478499))

(assert (= (and b!478497 (not c!57667)) b!478500))

(assert (= (and b!478499 res!285480) b!478498))

(assert (= (or b!478498 b!478500) bm!30835))

(declare-fun m!460747 () Bool)

(assert (=> bm!30835 m!460747))

(declare-fun m!460749 () Bool)

(assert (=> b!478497 m!460749))

(assert (=> b!478497 m!460749))

(declare-fun m!460751 () Bool)

(assert (=> b!478497 m!460751))

(assert (=> b!478499 m!460749))

(declare-fun m!460753 () Bool)

(assert (=> b!478499 m!460753))

(declare-fun m!460755 () Bool)

(assert (=> b!478499 m!460755))

(assert (=> b!478499 m!460749))

(declare-fun m!460757 () Bool)

(assert (=> b!478499 m!460757))

(assert (=> b!478465 d!76615))

(declare-fun d!76617 () Bool)

(declare-fun res!285486 () Bool)

(declare-fun e!281343 () Bool)

(assert (=> d!76617 (=> res!285486 e!281343)))

(assert (=> d!76617 (= res!285486 ((_ is Nil!9057) Nil!9057))))

(assert (=> d!76617 (= (noDuplicate!204 Nil!9057) e!281343)))

(declare-fun b!478505 () Bool)

(declare-fun e!281344 () Bool)

(assert (=> b!478505 (= e!281343 e!281344)))

(declare-fun res!285487 () Bool)

(assert (=> b!478505 (=> (not res!285487) (not e!281344))))

(declare-fun contains!2580 (List!9060 (_ BitVec 64)) Bool)

(assert (=> b!478505 (= res!285487 (not (contains!2580 (t!15266 Nil!9057) (h!9912 Nil!9057))))))

(declare-fun b!478506 () Bool)

(assert (=> b!478506 (= e!281344 (noDuplicate!204 (t!15266 Nil!9057)))))

(assert (= (and d!76617 (not res!285486)) b!478505))

(assert (= (and b!478505 res!285487) b!478506))

(declare-fun m!460759 () Bool)

(assert (=> b!478505 m!460759))

(declare-fun m!460761 () Bool)

(assert (=> b!478506 m!460761))

(assert (=> b!478464 d!76617))

(declare-fun b!478514 () Bool)

(declare-fun e!281350 () Bool)

(assert (=> b!478514 (= e!281350 tp_is_empty!13563)))

(declare-fun mapNonEmpty!22039 () Bool)

(declare-fun mapRes!22039 () Bool)

(declare-fun tp!42514 () Bool)

(declare-fun e!281349 () Bool)

(assert (=> mapNonEmpty!22039 (= mapRes!22039 (and tp!42514 e!281349))))

(declare-fun mapValue!22039 () ValueCell!6420)

(declare-fun mapRest!22039 () (Array (_ BitVec 32) ValueCell!6420))

(declare-fun mapKey!22039 () (_ BitVec 32))

(assert (=> mapNonEmpty!22039 (= mapRest!22033 (store mapRest!22039 mapKey!22039 mapValue!22039))))

(declare-fun b!478513 () Bool)

(assert (=> b!478513 (= e!281349 tp_is_empty!13563)))

(declare-fun mapIsEmpty!22039 () Bool)

(assert (=> mapIsEmpty!22039 mapRes!22039))

(declare-fun condMapEmpty!22039 () Bool)

(declare-fun mapDefault!22039 () ValueCell!6420)

(assert (=> mapNonEmpty!22033 (= condMapEmpty!22039 (= mapRest!22033 ((as const (Array (_ BitVec 32) ValueCell!6420)) mapDefault!22039)))))

(assert (=> mapNonEmpty!22033 (= tp!42508 (and e!281350 mapRes!22039))))

(assert (= (and mapNonEmpty!22033 condMapEmpty!22039) mapIsEmpty!22039))

(assert (= (and mapNonEmpty!22033 (not condMapEmpty!22039)) mapNonEmpty!22039))

(assert (= (and mapNonEmpty!22039 ((_ is ValueCellFull!6420) mapValue!22039)) b!478513))

(assert (= (and mapNonEmpty!22033 ((_ is ValueCellFull!6420) mapDefault!22039)) b!478514))

(declare-fun m!460763 () Bool)

(assert (=> mapNonEmpty!22039 m!460763))

(check-sat (not b!478505) (not b!478506) tp_is_empty!13563 (not mapNonEmpty!22039) (not b!478497) (not bm!30835) (not b!478499))
(check-sat)
