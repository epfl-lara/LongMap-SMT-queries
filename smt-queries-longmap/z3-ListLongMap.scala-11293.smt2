; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131600 () Bool)

(assert start!131600)

(declare-fun b!1541545 () Bool)

(declare-fun res!1058065 () Bool)

(declare-fun e!857459 () Bool)

(assert (=> b!1541545 (=> (not res!1058065) (not e!857459))))

(declare-datatypes ((array!102480 0))(
  ( (array!102481 (arr!49444 (Array (_ BitVec 32) (_ BitVec 64))) (size!49996 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102480)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102480 (_ BitVec 32)) Bool)

(assert (=> b!1541545 (= res!1058065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541546 () Bool)

(declare-fun res!1058060 () Bool)

(assert (=> b!1541546 (=> (not res!1058060) (not e!857459))))

(declare-datatypes ((List!35907 0))(
  ( (Nil!35904) (Cons!35903 (h!37349 (_ BitVec 64)) (t!50593 List!35907)) )
))
(declare-fun noDuplicate!2659 (List!35907) Bool)

(assert (=> b!1541546 (= res!1058060 (noDuplicate!2659 Nil!35904))))

(declare-fun mapNonEmpty!58177 () Bool)

(declare-fun mapRes!58177 () Bool)

(declare-fun tp!110705 () Bool)

(declare-fun e!857457 () Bool)

(assert (=> mapNonEmpty!58177 (= mapRes!58177 (and tp!110705 e!857457))))

(declare-datatypes ((V!58645 0))(
  ( (V!58646 (val!18903 Int)) )
))
(declare-datatypes ((ValueCell!17915 0))(
  ( (ValueCellFull!17915 (v!21699 V!58645)) (EmptyCell!17915) )
))
(declare-fun mapValue!58177 () ValueCell!17915)

(declare-datatypes ((array!102482 0))(
  ( (array!102483 (arr!49445 (Array (_ BitVec 32) ValueCell!17915)) (size!49997 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102482)

(declare-fun mapKey!58177 () (_ BitVec 32))

(declare-fun mapRest!58177 () (Array (_ BitVec 32) ValueCell!17915))

(assert (=> mapNonEmpty!58177 (= (arr!49445 _values!470) (store mapRest!58177 mapKey!58177 mapValue!58177))))

(declare-fun res!1058062 () Bool)

(assert (=> start!131600 (=> (not res!1058062) (not e!857459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131600 (= res!1058062 (validMask!0 mask!926))))

(assert (=> start!131600 e!857459))

(assert (=> start!131600 true))

(declare-fun e!857461 () Bool)

(declare-fun array_inv!38665 (array!102482) Bool)

(assert (=> start!131600 (and (array_inv!38665 _values!470) e!857461)))

(declare-fun array_inv!38666 (array!102480) Bool)

(assert (=> start!131600 (array_inv!38666 _keys!618)))

(declare-fun b!1541547 () Bool)

(declare-fun tp_is_empty!37651 () Bool)

(assert (=> b!1541547 (= e!857457 tp_is_empty!37651)))

(declare-fun b!1541548 () Bool)

(declare-fun e!857458 () Bool)

(assert (=> b!1541548 (= e!857458 tp_is_empty!37651)))

(declare-fun b!1541549 () Bool)

(declare-fun e!857460 () Bool)

(assert (=> b!1541549 (= e!857459 e!857460)))

(declare-fun res!1058061 () Bool)

(assert (=> b!1541549 (=> res!1058061 e!857460)))

(declare-fun contains!9985 (List!35907 (_ BitVec 64)) Bool)

(assert (=> b!1541549 (= res!1058061 (contains!9985 Nil!35904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541550 () Bool)

(assert (=> b!1541550 (= e!857460 (contains!9985 Nil!35904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541551 () Bool)

(declare-fun res!1058064 () Bool)

(assert (=> b!1541551 (=> (not res!1058064) (not e!857459))))

(assert (=> b!1541551 (= res!1058064 (and (bvsle #b00000000000000000000000000000000 (size!49996 _keys!618)) (bvslt (size!49996 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541552 () Bool)

(declare-fun res!1058063 () Bool)

(assert (=> b!1541552 (=> (not res!1058063) (not e!857459))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541552 (= res!1058063 (and (= (size!49997 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49996 _keys!618) (size!49997 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58177 () Bool)

(assert (=> mapIsEmpty!58177 mapRes!58177))

(declare-fun b!1541553 () Bool)

(assert (=> b!1541553 (= e!857461 (and e!857458 mapRes!58177))))

(declare-fun condMapEmpty!58177 () Bool)

(declare-fun mapDefault!58177 () ValueCell!17915)

(assert (=> b!1541553 (= condMapEmpty!58177 (= (arr!49445 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17915)) mapDefault!58177)))))

(assert (= (and start!131600 res!1058062) b!1541552))

(assert (= (and b!1541552 res!1058063) b!1541545))

(assert (= (and b!1541545 res!1058065) b!1541551))

(assert (= (and b!1541551 res!1058064) b!1541546))

(assert (= (and b!1541546 res!1058060) b!1541549))

(assert (= (and b!1541549 (not res!1058061)) b!1541550))

(assert (= (and b!1541553 condMapEmpty!58177) mapIsEmpty!58177))

(assert (= (and b!1541553 (not condMapEmpty!58177)) mapNonEmpty!58177))

(get-info :version)

(assert (= (and mapNonEmpty!58177 ((_ is ValueCellFull!17915) mapValue!58177)) b!1541547))

(assert (= (and b!1541553 ((_ is ValueCellFull!17915) mapDefault!58177)) b!1541548))

(assert (= start!131600 b!1541553))

(declare-fun m!1422797 () Bool)

(assert (=> b!1541545 m!1422797))

(declare-fun m!1422799 () Bool)

(assert (=> start!131600 m!1422799))

(declare-fun m!1422801 () Bool)

(assert (=> start!131600 m!1422801))

(declare-fun m!1422803 () Bool)

(assert (=> start!131600 m!1422803))

(declare-fun m!1422805 () Bool)

(assert (=> b!1541550 m!1422805))

(declare-fun m!1422807 () Bool)

(assert (=> b!1541549 m!1422807))

(declare-fun m!1422809 () Bool)

(assert (=> b!1541546 m!1422809))

(declare-fun m!1422811 () Bool)

(assert (=> mapNonEmpty!58177 m!1422811))

(check-sat (not start!131600) (not b!1541545) tp_is_empty!37651 (not b!1541546) (not b!1541550) (not b!1541549) (not mapNonEmpty!58177))
(check-sat)
(get-model)

(declare-fun d!160473 () Bool)

(assert (=> d!160473 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131600 d!160473))

(declare-fun d!160475 () Bool)

(assert (=> d!160475 (= (array_inv!38665 _values!470) (bvsge (size!49997 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131600 d!160475))

(declare-fun d!160477 () Bool)

(assert (=> d!160477 (= (array_inv!38666 _keys!618) (bvsge (size!49996 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131600 d!160477))

(declare-fun d!160479 () Bool)

(declare-fun res!1058107 () Bool)

(declare-fun e!857506 () Bool)

(assert (=> d!160479 (=> res!1058107 e!857506)))

(assert (=> d!160479 (= res!1058107 (bvsge #b00000000000000000000000000000000 (size!49996 _keys!618)))))

(assert (=> d!160479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857506)))

(declare-fun b!1541616 () Bool)

(declare-fun e!857505 () Bool)

(declare-fun call!68659 () Bool)

(assert (=> b!1541616 (= e!857505 call!68659)))

(declare-fun bm!68656 () Bool)

(assert (=> bm!68656 (= call!68659 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1541617 () Bool)

(declare-fun e!857504 () Bool)

(assert (=> b!1541617 (= e!857504 call!68659)))

(declare-fun b!1541618 () Bool)

(assert (=> b!1541618 (= e!857506 e!857504)))

(declare-fun c!141219 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541618 (= c!141219 (validKeyInArray!0 (select (arr!49444 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1541619 () Bool)

(assert (=> b!1541619 (= e!857504 e!857505)))

(declare-fun lt!665445 () (_ BitVec 64))

(assert (=> b!1541619 (= lt!665445 (select (arr!49444 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51323 0))(
  ( (Unit!51324) )
))
(declare-fun lt!665444 () Unit!51323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102480 (_ BitVec 64) (_ BitVec 32)) Unit!51323)

(assert (=> b!1541619 (= lt!665444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665445 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541619 (arrayContainsKey!0 _keys!618 lt!665445 #b00000000000000000000000000000000)))

(declare-fun lt!665443 () Unit!51323)

(assert (=> b!1541619 (= lt!665443 lt!665444)))

(declare-fun res!1058106 () Bool)

(declare-datatypes ((SeekEntryResult!13511 0))(
  ( (MissingZero!13511 (index!56442 (_ BitVec 32))) (Found!13511 (index!56443 (_ BitVec 32))) (Intermediate!13511 (undefined!14323 Bool) (index!56444 (_ BitVec 32)) (x!138388 (_ BitVec 32))) (Undefined!13511) (MissingVacant!13511 (index!56445 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102480 (_ BitVec 32)) SeekEntryResult!13511)

(assert (=> b!1541619 (= res!1058106 (= (seekEntryOrOpen!0 (select (arr!49444 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13511 #b00000000000000000000000000000000)))))

(assert (=> b!1541619 (=> (not res!1058106) (not e!857505))))

(assert (= (and d!160479 (not res!1058107)) b!1541618))

(assert (= (and b!1541618 c!141219) b!1541619))

(assert (= (and b!1541618 (not c!141219)) b!1541617))

(assert (= (and b!1541619 res!1058106) b!1541616))

(assert (= (or b!1541616 b!1541617) bm!68656))

(declare-fun m!1422845 () Bool)

(assert (=> bm!68656 m!1422845))

(declare-fun m!1422847 () Bool)

(assert (=> b!1541618 m!1422847))

(assert (=> b!1541618 m!1422847))

(declare-fun m!1422849 () Bool)

(assert (=> b!1541618 m!1422849))

(assert (=> b!1541619 m!1422847))

(declare-fun m!1422851 () Bool)

(assert (=> b!1541619 m!1422851))

(declare-fun m!1422853 () Bool)

(assert (=> b!1541619 m!1422853))

(assert (=> b!1541619 m!1422847))

(declare-fun m!1422855 () Bool)

(assert (=> b!1541619 m!1422855))

(assert (=> b!1541545 d!160479))

(declare-fun d!160481 () Bool)

(declare-fun lt!665448 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!782 (List!35907) (InoxSet (_ BitVec 64)))

(assert (=> d!160481 (= lt!665448 (select (content!782 Nil!35904) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857512 () Bool)

(assert (=> d!160481 (= lt!665448 e!857512)))

(declare-fun res!1058113 () Bool)

(assert (=> d!160481 (=> (not res!1058113) (not e!857512))))

(assert (=> d!160481 (= res!1058113 ((_ is Cons!35903) Nil!35904))))

(assert (=> d!160481 (= (contains!9985 Nil!35904 #b0000000000000000000000000000000000000000000000000000000000000000) lt!665448)))

(declare-fun b!1541624 () Bool)

(declare-fun e!857511 () Bool)

(assert (=> b!1541624 (= e!857512 e!857511)))

(declare-fun res!1058112 () Bool)

(assert (=> b!1541624 (=> res!1058112 e!857511)))

(assert (=> b!1541624 (= res!1058112 (= (h!37349 Nil!35904) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541625 () Bool)

(assert (=> b!1541625 (= e!857511 (contains!9985 (t!50593 Nil!35904) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160481 res!1058113) b!1541624))

(assert (= (and b!1541624 (not res!1058112)) b!1541625))

(declare-fun m!1422857 () Bool)

(assert (=> d!160481 m!1422857))

(declare-fun m!1422859 () Bool)

(assert (=> d!160481 m!1422859))

(declare-fun m!1422861 () Bool)

(assert (=> b!1541625 m!1422861))

(assert (=> b!1541549 d!160481))

(declare-fun d!160483 () Bool)

(declare-fun res!1058118 () Bool)

(declare-fun e!857517 () Bool)

(assert (=> d!160483 (=> res!1058118 e!857517)))

(assert (=> d!160483 (= res!1058118 ((_ is Nil!35904) Nil!35904))))

(assert (=> d!160483 (= (noDuplicate!2659 Nil!35904) e!857517)))

(declare-fun b!1541630 () Bool)

(declare-fun e!857518 () Bool)

(assert (=> b!1541630 (= e!857517 e!857518)))

(declare-fun res!1058119 () Bool)

(assert (=> b!1541630 (=> (not res!1058119) (not e!857518))))

(assert (=> b!1541630 (= res!1058119 (not (contains!9985 (t!50593 Nil!35904) (h!37349 Nil!35904))))))

(declare-fun b!1541631 () Bool)

(assert (=> b!1541631 (= e!857518 (noDuplicate!2659 (t!50593 Nil!35904)))))

(assert (= (and d!160483 (not res!1058118)) b!1541630))

(assert (= (and b!1541630 res!1058119) b!1541631))

(declare-fun m!1422863 () Bool)

(assert (=> b!1541630 m!1422863))

(declare-fun m!1422865 () Bool)

(assert (=> b!1541631 m!1422865))

(assert (=> b!1541546 d!160483))

(declare-fun d!160485 () Bool)

(declare-fun lt!665449 () Bool)

(assert (=> d!160485 (= lt!665449 (select (content!782 Nil!35904) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857520 () Bool)

(assert (=> d!160485 (= lt!665449 e!857520)))

(declare-fun res!1058121 () Bool)

(assert (=> d!160485 (=> (not res!1058121) (not e!857520))))

(assert (=> d!160485 (= res!1058121 ((_ is Cons!35903) Nil!35904))))

(assert (=> d!160485 (= (contains!9985 Nil!35904 #b1000000000000000000000000000000000000000000000000000000000000000) lt!665449)))

(declare-fun b!1541632 () Bool)

(declare-fun e!857519 () Bool)

(assert (=> b!1541632 (= e!857520 e!857519)))

(declare-fun res!1058120 () Bool)

(assert (=> b!1541632 (=> res!1058120 e!857519)))

(assert (=> b!1541632 (= res!1058120 (= (h!37349 Nil!35904) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541633 () Bool)

(assert (=> b!1541633 (= e!857519 (contains!9985 (t!50593 Nil!35904) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160485 res!1058121) b!1541632))

(assert (= (and b!1541632 (not res!1058120)) b!1541633))

(assert (=> d!160485 m!1422857))

(declare-fun m!1422867 () Bool)

(assert (=> d!160485 m!1422867))

(declare-fun m!1422869 () Bool)

(assert (=> b!1541633 m!1422869))

(assert (=> b!1541550 d!160485))

(declare-fun b!1541641 () Bool)

(declare-fun e!857526 () Bool)

(assert (=> b!1541641 (= e!857526 tp_is_empty!37651)))

(declare-fun mapIsEmpty!58186 () Bool)

(declare-fun mapRes!58186 () Bool)

(assert (=> mapIsEmpty!58186 mapRes!58186))

(declare-fun b!1541640 () Bool)

(declare-fun e!857525 () Bool)

(assert (=> b!1541640 (= e!857525 tp_is_empty!37651)))

(declare-fun condMapEmpty!58186 () Bool)

(declare-fun mapDefault!58186 () ValueCell!17915)

(assert (=> mapNonEmpty!58177 (= condMapEmpty!58186 (= mapRest!58177 ((as const (Array (_ BitVec 32) ValueCell!17915)) mapDefault!58186)))))

(assert (=> mapNonEmpty!58177 (= tp!110705 (and e!857526 mapRes!58186))))

(declare-fun mapNonEmpty!58186 () Bool)

(declare-fun tp!110714 () Bool)

(assert (=> mapNonEmpty!58186 (= mapRes!58186 (and tp!110714 e!857525))))

(declare-fun mapKey!58186 () (_ BitVec 32))

(declare-fun mapRest!58186 () (Array (_ BitVec 32) ValueCell!17915))

(declare-fun mapValue!58186 () ValueCell!17915)

(assert (=> mapNonEmpty!58186 (= mapRest!58177 (store mapRest!58186 mapKey!58186 mapValue!58186))))

(assert (= (and mapNonEmpty!58177 condMapEmpty!58186) mapIsEmpty!58186))

(assert (= (and mapNonEmpty!58177 (not condMapEmpty!58186)) mapNonEmpty!58186))

(assert (= (and mapNonEmpty!58186 ((_ is ValueCellFull!17915) mapValue!58186)) b!1541640))

(assert (= (and mapNonEmpty!58177 ((_ is ValueCellFull!17915) mapDefault!58186)) b!1541641))

(declare-fun m!1422871 () Bool)

(assert (=> mapNonEmpty!58186 m!1422871))

(check-sat (not mapNonEmpty!58186) (not bm!68656) tp_is_empty!37651 (not b!1541619) (not d!160485) (not b!1541625) (not d!160481) (not b!1541618) (not b!1541633) (not b!1541631) (not b!1541630))
(check-sat)
