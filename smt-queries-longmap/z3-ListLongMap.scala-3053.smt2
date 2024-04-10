; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43124 () Bool)

(assert start!43124)

(declare-fun b!478308 () Bool)

(declare-fun e!281192 () Bool)

(declare-datatypes ((array!30773 0))(
  ( (array!30774 (arr!14798 (Array (_ BitVec 32) (_ BitVec 64))) (size!15156 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30773)

(assert (=> b!478308 (= e!281192 (bvsgt #b00000000000000000000000000000000 (size!15156 _keys!1874)))))

(declare-fun b!478309 () Bool)

(declare-fun e!281191 () Bool)

(declare-fun tp_is_empty!13551 () Bool)

(assert (=> b!478309 (= e!281191 tp_is_empty!13551)))

(declare-fun b!478310 () Bool)

(declare-fun e!281194 () Bool)

(assert (=> b!478310 (= e!281194 tp_is_empty!13551)))

(declare-fun mapNonEmpty!22009 () Bool)

(declare-fun mapRes!22009 () Bool)

(declare-fun tp!42484 () Bool)

(assert (=> mapNonEmpty!22009 (= mapRes!22009 (and tp!42484 e!281194))))

(declare-fun mapKey!22009 () (_ BitVec 32))

(declare-datatypes ((V!19139 0))(
  ( (V!19140 (val!6823 Int)) )
))
(declare-datatypes ((ValueCell!6414 0))(
  ( (ValueCellFull!6414 (v!9111 V!19139)) (EmptyCell!6414) )
))
(declare-fun mapRest!22009 () (Array (_ BitVec 32) ValueCell!6414))

(declare-fun mapValue!22009 () ValueCell!6414)

(declare-datatypes ((array!30775 0))(
  ( (array!30776 (arr!14799 (Array (_ BitVec 32) ValueCell!6414)) (size!15157 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30775)

(assert (=> mapNonEmpty!22009 (= (arr!14799 _values!1516) (store mapRest!22009 mapKey!22009 mapValue!22009))))

(declare-fun b!478311 () Bool)

(declare-fun e!281193 () Bool)

(assert (=> b!478311 (= e!281193 (and e!281191 mapRes!22009))))

(declare-fun condMapEmpty!22009 () Bool)

(declare-fun mapDefault!22009 () ValueCell!6414)

(assert (=> b!478311 (= condMapEmpty!22009 (= (arr!14799 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6414)) mapDefault!22009)))))

(declare-fun res!285390 () Bool)

(assert (=> start!43124 (=> (not res!285390) (not e!281192))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43124 (= res!285390 (validMask!0 mask!2352))))

(assert (=> start!43124 e!281192))

(assert (=> start!43124 true))

(declare-fun array_inv!10678 (array!30775) Bool)

(assert (=> start!43124 (and (array_inv!10678 _values!1516) e!281193)))

(declare-fun array_inv!10679 (array!30773) Bool)

(assert (=> start!43124 (array_inv!10679 _keys!1874)))

(declare-fun mapIsEmpty!22009 () Bool)

(assert (=> mapIsEmpty!22009 mapRes!22009))

(declare-fun b!478312 () Bool)

(declare-fun res!285389 () Bool)

(assert (=> b!478312 (=> (not res!285389) (not e!281192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30773 (_ BitVec 32)) Bool)

(assert (=> b!478312 (= res!285389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478313 () Bool)

(declare-fun res!285391 () Bool)

(assert (=> b!478313 (=> (not res!285391) (not e!281192))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478313 (= res!285391 (and (= (size!15157 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15156 _keys!1874) (size!15157 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43124 res!285390) b!478313))

(assert (= (and b!478313 res!285391) b!478312))

(assert (= (and b!478312 res!285389) b!478308))

(assert (= (and b!478311 condMapEmpty!22009) mapIsEmpty!22009))

(assert (= (and b!478311 (not condMapEmpty!22009)) mapNonEmpty!22009))

(get-info :version)

(assert (= (and mapNonEmpty!22009 ((_ is ValueCellFull!6414) mapValue!22009)) b!478310))

(assert (= (and b!478311 ((_ is ValueCellFull!6414) mapDefault!22009)) b!478309))

(assert (= start!43124 b!478311))

(declare-fun m!460633 () Bool)

(assert (=> mapNonEmpty!22009 m!460633))

(declare-fun m!460635 () Bool)

(assert (=> start!43124 m!460635))

(declare-fun m!460637 () Bool)

(assert (=> start!43124 m!460637))

(declare-fun m!460639 () Bool)

(assert (=> start!43124 m!460639))

(declare-fun m!460641 () Bool)

(assert (=> b!478312 m!460641))

(check-sat (not start!43124) (not b!478312) (not mapNonEmpty!22009) tp_is_empty!13551)
(check-sat)
(get-model)

(declare-fun d!76589 () Bool)

(assert (=> d!76589 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43124 d!76589))

(declare-fun d!76591 () Bool)

(assert (=> d!76591 (= (array_inv!10678 _values!1516) (bvsge (size!15157 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43124 d!76591))

(declare-fun d!76593 () Bool)

(assert (=> d!76593 (= (array_inv!10679 _keys!1874) (bvsge (size!15156 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43124 d!76593))

(declare-fun bm!30829 () Bool)

(declare-fun call!30832 () Bool)

(assert (=> bm!30829 (= call!30832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478340 () Bool)

(declare-fun e!281218 () Bool)

(assert (=> b!478340 (= e!281218 call!30832)))

(declare-fun b!478341 () Bool)

(declare-fun e!281216 () Bool)

(assert (=> b!478341 (= e!281216 e!281218)))

(declare-fun lt!217710 () (_ BitVec 64))

(assert (=> b!478341 (= lt!217710 (select (arr!14798 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14058 0))(
  ( (Unit!14059) )
))
(declare-fun lt!217708 () Unit!14058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30773 (_ BitVec 64) (_ BitVec 32)) Unit!14058)

(assert (=> b!478341 (= lt!217708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217710 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478341 (arrayContainsKey!0 _keys!1874 lt!217710 #b00000000000000000000000000000000)))

(declare-fun lt!217709 () Unit!14058)

(assert (=> b!478341 (= lt!217709 lt!217708)))

(declare-fun res!285406 () Bool)

(declare-datatypes ((SeekEntryResult!3563 0))(
  ( (MissingZero!3563 (index!16431 (_ BitVec 32))) (Found!3563 (index!16432 (_ BitVec 32))) (Intermediate!3563 (undefined!4375 Bool) (index!16433 (_ BitVec 32)) (x!44883 (_ BitVec 32))) (Undefined!3563) (MissingVacant!3563 (index!16434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30773 (_ BitVec 32)) SeekEntryResult!3563)

(assert (=> b!478341 (= res!285406 (= (seekEntryOrOpen!0 (select (arr!14798 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3563 #b00000000000000000000000000000000)))))

(assert (=> b!478341 (=> (not res!285406) (not e!281218))))

(declare-fun d!76595 () Bool)

(declare-fun res!285405 () Bool)

(declare-fun e!281217 () Bool)

(assert (=> d!76595 (=> res!285405 e!281217)))

(assert (=> d!76595 (= res!285405 (bvsge #b00000000000000000000000000000000 (size!15156 _keys!1874)))))

(assert (=> d!76595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281217)))

(declare-fun b!478342 () Bool)

(assert (=> b!478342 (= e!281217 e!281216)))

(declare-fun c!57661 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478342 (= c!57661 (validKeyInArray!0 (select (arr!14798 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478343 () Bool)

(assert (=> b!478343 (= e!281216 call!30832)))

(assert (= (and d!76595 (not res!285405)) b!478342))

(assert (= (and b!478342 c!57661) b!478341))

(assert (= (and b!478342 (not c!57661)) b!478343))

(assert (= (and b!478341 res!285406) b!478340))

(assert (= (or b!478340 b!478343) bm!30829))

(declare-fun m!460653 () Bool)

(assert (=> bm!30829 m!460653))

(declare-fun m!460655 () Bool)

(assert (=> b!478341 m!460655))

(declare-fun m!460657 () Bool)

(assert (=> b!478341 m!460657))

(declare-fun m!460659 () Bool)

(assert (=> b!478341 m!460659))

(assert (=> b!478341 m!460655))

(declare-fun m!460661 () Bool)

(assert (=> b!478341 m!460661))

(assert (=> b!478342 m!460655))

(assert (=> b!478342 m!460655))

(declare-fun m!460663 () Bool)

(assert (=> b!478342 m!460663))

(assert (=> b!478312 d!76595))

(declare-fun mapNonEmpty!22015 () Bool)

(declare-fun mapRes!22015 () Bool)

(declare-fun tp!42490 () Bool)

(declare-fun e!281223 () Bool)

(assert (=> mapNonEmpty!22015 (= mapRes!22015 (and tp!42490 e!281223))))

(declare-fun mapKey!22015 () (_ BitVec 32))

(declare-fun mapValue!22015 () ValueCell!6414)

(declare-fun mapRest!22015 () (Array (_ BitVec 32) ValueCell!6414))

(assert (=> mapNonEmpty!22015 (= mapRest!22009 (store mapRest!22015 mapKey!22015 mapValue!22015))))

(declare-fun mapIsEmpty!22015 () Bool)

(assert (=> mapIsEmpty!22015 mapRes!22015))

(declare-fun b!478350 () Bool)

(assert (=> b!478350 (= e!281223 tp_is_empty!13551)))

(declare-fun condMapEmpty!22015 () Bool)

(declare-fun mapDefault!22015 () ValueCell!6414)

(assert (=> mapNonEmpty!22009 (= condMapEmpty!22015 (= mapRest!22009 ((as const (Array (_ BitVec 32) ValueCell!6414)) mapDefault!22015)))))

(declare-fun e!281224 () Bool)

(assert (=> mapNonEmpty!22009 (= tp!42484 (and e!281224 mapRes!22015))))

(declare-fun b!478351 () Bool)

(assert (=> b!478351 (= e!281224 tp_is_empty!13551)))

(assert (= (and mapNonEmpty!22009 condMapEmpty!22015) mapIsEmpty!22015))

(assert (= (and mapNonEmpty!22009 (not condMapEmpty!22015)) mapNonEmpty!22015))

(assert (= (and mapNonEmpty!22015 ((_ is ValueCellFull!6414) mapValue!22015)) b!478350))

(assert (= (and mapNonEmpty!22009 ((_ is ValueCellFull!6414) mapDefault!22015)) b!478351))

(declare-fun m!460665 () Bool)

(assert (=> mapNonEmpty!22015 m!460665))

(check-sat (not bm!30829) (not b!478342) tp_is_empty!13551 (not mapNonEmpty!22015) (not b!478341))
(check-sat)
