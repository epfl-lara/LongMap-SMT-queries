; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43122 () Bool)

(assert start!43122)

(declare-fun b!478303 () Bool)

(declare-fun e!281196 () Bool)

(declare-fun tp_is_empty!13555 () Bool)

(assert (=> b!478303 (= e!281196 tp_is_empty!13555)))

(declare-fun mapNonEmpty!22018 () Bool)

(declare-fun mapRes!22018 () Bool)

(declare-fun tp!42493 () Bool)

(assert (=> mapNonEmpty!22018 (= mapRes!22018 (and tp!42493 e!281196))))

(declare-datatypes ((V!19145 0))(
  ( (V!19146 (val!6825 Int)) )
))
(declare-datatypes ((ValueCell!6416 0))(
  ( (ValueCellFull!6416 (v!9114 V!19145)) (EmptyCell!6416) )
))
(declare-fun mapRest!22018 () (Array (_ BitVec 32) ValueCell!6416))

(declare-fun mapValue!22018 () ValueCell!6416)

(declare-fun mapKey!22018 () (_ BitVec 32))

(declare-datatypes ((array!30770 0))(
  ( (array!30771 (arr!14795 (Array (_ BitVec 32) ValueCell!6416)) (size!15153 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30770)

(assert (=> mapNonEmpty!22018 (= (arr!14795 _values!1516) (store mapRest!22018 mapKey!22018 mapValue!22018))))

(declare-fun mapIsEmpty!22018 () Bool)

(assert (=> mapIsEmpty!22018 mapRes!22018))

(declare-fun b!478304 () Bool)

(declare-fun e!281199 () Bool)

(declare-fun e!281197 () Bool)

(assert (=> b!478304 (= e!281199 (and e!281197 mapRes!22018))))

(declare-fun condMapEmpty!22018 () Bool)

(declare-fun mapDefault!22018 () ValueCell!6416)

(assert (=> b!478304 (= condMapEmpty!22018 (= (arr!14795 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6416)) mapDefault!22018)))))

(declare-fun b!478306 () Bool)

(declare-fun res!285408 () Bool)

(declare-fun e!281200 () Bool)

(assert (=> b!478306 (=> (not res!285408) (not e!281200))))

(declare-datatypes ((array!30772 0))(
  ( (array!30773 (arr!14796 (Array (_ BitVec 32) (_ BitVec 64))) (size!15154 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30772)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30772 (_ BitVec 32)) Bool)

(assert (=> b!478306 (= res!285408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285406 () Bool)

(assert (=> start!43122 (=> (not res!285406) (not e!281200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43122 (= res!285406 (validMask!0 mask!2352))))

(assert (=> start!43122 e!281200))

(assert (=> start!43122 true))

(declare-fun array_inv!10754 (array!30770) Bool)

(assert (=> start!43122 (and (array_inv!10754 _values!1516) e!281199)))

(declare-fun array_inv!10755 (array!30772) Bool)

(assert (=> start!43122 (array_inv!10755 _keys!1874)))

(declare-fun b!478305 () Bool)

(assert (=> b!478305 (= e!281197 tp_is_empty!13555)))

(declare-fun b!478307 () Bool)

(assert (=> b!478307 (= e!281200 (and (bvsle #b00000000000000000000000000000000 (size!15154 _keys!1874)) (bvsge (size!15154 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478308 () Bool)

(declare-fun res!285407 () Bool)

(assert (=> b!478308 (=> (not res!285407) (not e!281200))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478308 (= res!285407 (and (= (size!15153 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15154 _keys!1874) (size!15153 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43122 res!285406) b!478308))

(assert (= (and b!478308 res!285407) b!478306))

(assert (= (and b!478306 res!285408) b!478307))

(assert (= (and b!478304 condMapEmpty!22018) mapIsEmpty!22018))

(assert (= (and b!478304 (not condMapEmpty!22018)) mapNonEmpty!22018))

(get-info :version)

(assert (= (and mapNonEmpty!22018 ((_ is ValueCellFull!6416) mapValue!22018)) b!478303))

(assert (= (and b!478304 ((_ is ValueCellFull!6416) mapDefault!22018)) b!478305))

(assert (= start!43122 b!478304))

(declare-fun m!460849 () Bool)

(assert (=> mapNonEmpty!22018 m!460849))

(declare-fun m!460851 () Bool)

(assert (=> b!478306 m!460851))

(declare-fun m!460853 () Bool)

(assert (=> start!43122 m!460853))

(declare-fun m!460855 () Bool)

(assert (=> start!43122 m!460855))

(declare-fun m!460857 () Bool)

(assert (=> start!43122 m!460857))

(check-sat (not b!478306) (not start!43122) (not mapNonEmpty!22018) tp_is_empty!13555)
(check-sat)
(get-model)

(declare-fun b!478353 () Bool)

(declare-fun e!281237 () Bool)

(declare-fun call!30821 () Bool)

(assert (=> b!478353 (= e!281237 call!30821)))

(declare-fun b!478354 () Bool)

(declare-fun e!281239 () Bool)

(assert (=> b!478354 (= e!281237 e!281239)))

(declare-fun lt!217730 () (_ BitVec 64))

(assert (=> b!478354 (= lt!217730 (select (arr!14796 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14031 0))(
  ( (Unit!14032) )
))
(declare-fun lt!217729 () Unit!14031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30772 (_ BitVec 64) (_ BitVec 32)) Unit!14031)

(assert (=> b!478354 (= lt!217729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217730 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478354 (arrayContainsKey!0 _keys!1874 lt!217730 #b00000000000000000000000000000000)))

(declare-fun lt!217731 () Unit!14031)

(assert (=> b!478354 (= lt!217731 lt!217729)))

(declare-fun res!285432 () Bool)

(declare-datatypes ((SeekEntryResult!3513 0))(
  ( (MissingZero!3513 (index!16231 (_ BitVec 32))) (Found!3513 (index!16232 (_ BitVec 32))) (Intermediate!3513 (undefined!4325 Bool) (index!16233 (_ BitVec 32)) (x!44840 (_ BitVec 32))) (Undefined!3513) (MissingVacant!3513 (index!16234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30772 (_ BitVec 32)) SeekEntryResult!3513)

(assert (=> b!478354 (= res!285432 (= (seekEntryOrOpen!0 (select (arr!14796 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3513 #b00000000000000000000000000000000)))))

(assert (=> b!478354 (=> (not res!285432) (not e!281239))))

(declare-fun b!478355 () Bool)

(declare-fun e!281238 () Bool)

(assert (=> b!478355 (= e!281238 e!281237)))

(declare-fun c!57637 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478355 (= c!57637 (validKeyInArray!0 (select (arr!14796 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30818 () Bool)

(assert (=> bm!30818 (= call!30821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun d!76627 () Bool)

(declare-fun res!285431 () Bool)

(assert (=> d!76627 (=> res!285431 e!281238)))

(assert (=> d!76627 (= res!285431 (bvsge #b00000000000000000000000000000000 (size!15154 _keys!1874)))))

(assert (=> d!76627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281238)))

(declare-fun b!478356 () Bool)

(assert (=> b!478356 (= e!281239 call!30821)))

(assert (= (and d!76627 (not res!285431)) b!478355))

(assert (= (and b!478355 c!57637) b!478354))

(assert (= (and b!478355 (not c!57637)) b!478353))

(assert (= (and b!478354 res!285432) b!478356))

(assert (= (or b!478356 b!478353) bm!30818))

(declare-fun m!460879 () Bool)

(assert (=> b!478354 m!460879))

(declare-fun m!460881 () Bool)

(assert (=> b!478354 m!460881))

(declare-fun m!460883 () Bool)

(assert (=> b!478354 m!460883))

(assert (=> b!478354 m!460879))

(declare-fun m!460885 () Bool)

(assert (=> b!478354 m!460885))

(assert (=> b!478355 m!460879))

(assert (=> b!478355 m!460879))

(declare-fun m!460887 () Bool)

(assert (=> b!478355 m!460887))

(declare-fun m!460889 () Bool)

(assert (=> bm!30818 m!460889))

(assert (=> b!478306 d!76627))

(declare-fun d!76629 () Bool)

(assert (=> d!76629 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43122 d!76629))

(declare-fun d!76631 () Bool)

(assert (=> d!76631 (= (array_inv!10754 _values!1516) (bvsge (size!15153 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43122 d!76631))

(declare-fun d!76633 () Bool)

(assert (=> d!76633 (= (array_inv!10755 _keys!1874) (bvsge (size!15154 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43122 d!76633))

(declare-fun mapNonEmpty!22027 () Bool)

(declare-fun mapRes!22027 () Bool)

(declare-fun tp!42502 () Bool)

(declare-fun e!281245 () Bool)

(assert (=> mapNonEmpty!22027 (= mapRes!22027 (and tp!42502 e!281245))))

(declare-fun mapKey!22027 () (_ BitVec 32))

(declare-fun mapRest!22027 () (Array (_ BitVec 32) ValueCell!6416))

(declare-fun mapValue!22027 () ValueCell!6416)

(assert (=> mapNonEmpty!22027 (= mapRest!22018 (store mapRest!22027 mapKey!22027 mapValue!22027))))

(declare-fun b!478364 () Bool)

(declare-fun e!281244 () Bool)

(assert (=> b!478364 (= e!281244 tp_is_empty!13555)))

(declare-fun b!478363 () Bool)

(assert (=> b!478363 (= e!281245 tp_is_empty!13555)))

(declare-fun condMapEmpty!22027 () Bool)

(declare-fun mapDefault!22027 () ValueCell!6416)

(assert (=> mapNonEmpty!22018 (= condMapEmpty!22027 (= mapRest!22018 ((as const (Array (_ BitVec 32) ValueCell!6416)) mapDefault!22027)))))

(assert (=> mapNonEmpty!22018 (= tp!42493 (and e!281244 mapRes!22027))))

(declare-fun mapIsEmpty!22027 () Bool)

(assert (=> mapIsEmpty!22027 mapRes!22027))

(assert (= (and mapNonEmpty!22018 condMapEmpty!22027) mapIsEmpty!22027))

(assert (= (and mapNonEmpty!22018 (not condMapEmpty!22027)) mapNonEmpty!22027))

(assert (= (and mapNonEmpty!22027 ((_ is ValueCellFull!6416) mapValue!22027)) b!478363))

(assert (= (and mapNonEmpty!22018 ((_ is ValueCellFull!6416) mapDefault!22027)) b!478364))

(declare-fun m!460891 () Bool)

(assert (=> mapNonEmpty!22027 m!460891))

(check-sat (not b!478355) (not bm!30818) (not mapNonEmpty!22027) tp_is_empty!13555 (not b!478354))
(check-sat)
