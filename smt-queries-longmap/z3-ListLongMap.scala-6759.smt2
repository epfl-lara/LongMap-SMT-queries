; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84814 () Bool)

(assert start!84814)

(declare-fun b!991511 () Bool)

(declare-fun e!559189 () Bool)

(declare-fun e!559187 () Bool)

(declare-fun mapRes!37056 () Bool)

(assert (=> b!991511 (= e!559189 (and e!559187 mapRes!37056))))

(declare-fun condMapEmpty!37056 () Bool)

(declare-datatypes ((V!36091 0))(
  ( (V!36092 (val!11716 Int)) )
))
(declare-datatypes ((ValueCell!11184 0))(
  ( (ValueCellFull!11184 (v!14292 V!36091)) (EmptyCell!11184) )
))
(declare-datatypes ((array!62625 0))(
  ( (array!62626 (arr!30161 (Array (_ BitVec 32) ValueCell!11184)) (size!30640 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62625)

(declare-fun mapDefault!37056 () ValueCell!11184)

(assert (=> b!991511 (= condMapEmpty!37056 (= (arr!30161 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11184)) mapDefault!37056)))))

(declare-fun b!991512 () Bool)

(declare-fun e!559186 () Bool)

(declare-datatypes ((array!62627 0))(
  ( (array!62628 (arr!30162 (Array (_ BitVec 32) (_ BitVec 64))) (size!30641 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62627)

(assert (=> b!991512 (= e!559186 (bvsgt #b00000000000000000000000000000000 (size!30641 _keys!1945)))))

(declare-fun b!991513 () Bool)

(declare-fun res!662777 () Bool)

(assert (=> b!991513 (=> (not res!662777) (not e!559186))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(assert (=> b!991513 (= res!662777 (and (= (size!30640 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30641 _keys!1945) (size!30640 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991515 () Bool)

(declare-fun e!559188 () Bool)

(declare-fun tp_is_empty!23331 () Bool)

(assert (=> b!991515 (= e!559188 tp_is_empty!23331)))

(declare-fun mapIsEmpty!37056 () Bool)

(assert (=> mapIsEmpty!37056 mapRes!37056))

(declare-fun mapNonEmpty!37056 () Bool)

(declare-fun tp!70127 () Bool)

(assert (=> mapNonEmpty!37056 (= mapRes!37056 (and tp!70127 e!559188))))

(declare-fun mapKey!37056 () (_ BitVec 32))

(declare-fun mapRest!37056 () (Array (_ BitVec 32) ValueCell!11184))

(declare-fun mapValue!37056 () ValueCell!11184)

(assert (=> mapNonEmpty!37056 (= (arr!30161 _values!1551) (store mapRest!37056 mapKey!37056 mapValue!37056))))

(declare-fun b!991516 () Bool)

(declare-fun res!662779 () Bool)

(assert (=> b!991516 (=> (not res!662779) (not e!559186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62627 (_ BitVec 32)) Bool)

(assert (=> b!991516 (= res!662779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun res!662778 () Bool)

(assert (=> start!84814 (=> (not res!662778) (not e!559186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84814 (= res!662778 (validMask!0 mask!2471))))

(assert (=> start!84814 e!559186))

(assert (=> start!84814 true))

(declare-fun array_inv!23293 (array!62625) Bool)

(assert (=> start!84814 (and (array_inv!23293 _values!1551) e!559189)))

(declare-fun array_inv!23294 (array!62627) Bool)

(assert (=> start!84814 (array_inv!23294 _keys!1945)))

(declare-fun b!991514 () Bool)

(assert (=> b!991514 (= e!559187 tp_is_empty!23331)))

(assert (= (and start!84814 res!662778) b!991513))

(assert (= (and b!991513 res!662777) b!991516))

(assert (= (and b!991516 res!662779) b!991512))

(assert (= (and b!991511 condMapEmpty!37056) mapIsEmpty!37056))

(assert (= (and b!991511 (not condMapEmpty!37056)) mapNonEmpty!37056))

(get-info :version)

(assert (= (and mapNonEmpty!37056 ((_ is ValueCellFull!11184) mapValue!37056)) b!991515))

(assert (= (and b!991511 ((_ is ValueCellFull!11184) mapDefault!37056)) b!991514))

(assert (= start!84814 b!991511))

(declare-fun m!919433 () Bool)

(assert (=> mapNonEmpty!37056 m!919433))

(declare-fun m!919435 () Bool)

(assert (=> b!991516 m!919435))

(declare-fun m!919437 () Bool)

(assert (=> start!84814 m!919437))

(declare-fun m!919439 () Bool)

(assert (=> start!84814 m!919439))

(declare-fun m!919441 () Bool)

(assert (=> start!84814 m!919441))

(check-sat (not b!991516) (not start!84814) (not mapNonEmpty!37056) tp_is_empty!23331)
(check-sat)
(get-model)

(declare-fun b!991543 () Bool)

(declare-fun e!559211 () Bool)

(declare-fun e!559213 () Bool)

(assert (=> b!991543 (= e!559211 e!559213)))

(declare-fun c!100627 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991543 (= c!100627 (validKeyInArray!0 (select (arr!30162 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!991544 () Bool)

(declare-fun e!559212 () Bool)

(assert (=> b!991544 (= e!559213 e!559212)))

(declare-fun lt!439992 () (_ BitVec 64))

(assert (=> b!991544 (= lt!439992 (select (arr!30162 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32894 0))(
  ( (Unit!32895) )
))
(declare-fun lt!439991 () Unit!32894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62627 (_ BitVec 64) (_ BitVec 32)) Unit!32894)

(assert (=> b!991544 (= lt!439991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!439992 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991544 (arrayContainsKey!0 _keys!1945 lt!439992 #b00000000000000000000000000000000)))

(declare-fun lt!439990 () Unit!32894)

(assert (=> b!991544 (= lt!439990 lt!439991)))

(declare-fun res!662794 () Bool)

(declare-datatypes ((SeekEntryResult!9214 0))(
  ( (MissingZero!9214 (index!39227 (_ BitVec 32))) (Found!9214 (index!39228 (_ BitVec 32))) (Intermediate!9214 (undefined!10026 Bool) (index!39229 (_ BitVec 32)) (x!86265 (_ BitVec 32))) (Undefined!9214) (MissingVacant!9214 (index!39230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62627 (_ BitVec 32)) SeekEntryResult!9214)

(assert (=> b!991544 (= res!662794 (= (seekEntryOrOpen!0 (select (arr!30162 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9214 #b00000000000000000000000000000000)))))

(assert (=> b!991544 (=> (not res!662794) (not e!559212))))

(declare-fun bm!42073 () Bool)

(declare-fun call!42076 () Bool)

(assert (=> bm!42073 (= call!42076 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!991545 () Bool)

(assert (=> b!991545 (= e!559212 call!42076)))

(declare-fun d!117947 () Bool)

(declare-fun res!662793 () Bool)

(assert (=> d!117947 (=> res!662793 e!559211)))

(assert (=> d!117947 (= res!662793 (bvsge #b00000000000000000000000000000000 (size!30641 _keys!1945)))))

(assert (=> d!117947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559211)))

(declare-fun b!991546 () Bool)

(assert (=> b!991546 (= e!559213 call!42076)))

(assert (= (and d!117947 (not res!662793)) b!991543))

(assert (= (and b!991543 c!100627) b!991544))

(assert (= (and b!991543 (not c!100627)) b!991546))

(assert (= (and b!991544 res!662794) b!991545))

(assert (= (or b!991545 b!991546) bm!42073))

(declare-fun m!919453 () Bool)

(assert (=> b!991543 m!919453))

(assert (=> b!991543 m!919453))

(declare-fun m!919455 () Bool)

(assert (=> b!991543 m!919455))

(assert (=> b!991544 m!919453))

(declare-fun m!919457 () Bool)

(assert (=> b!991544 m!919457))

(declare-fun m!919459 () Bool)

(assert (=> b!991544 m!919459))

(assert (=> b!991544 m!919453))

(declare-fun m!919461 () Bool)

(assert (=> b!991544 m!919461))

(declare-fun m!919463 () Bool)

(assert (=> bm!42073 m!919463))

(assert (=> b!991516 d!117947))

(declare-fun d!117949 () Bool)

(assert (=> d!117949 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84814 d!117949))

(declare-fun d!117951 () Bool)

(assert (=> d!117951 (= (array_inv!23293 _values!1551) (bvsge (size!30640 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84814 d!117951))

(declare-fun d!117953 () Bool)

(assert (=> d!117953 (= (array_inv!23294 _keys!1945) (bvsge (size!30641 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84814 d!117953))

(declare-fun b!991554 () Bool)

(declare-fun e!559219 () Bool)

(assert (=> b!991554 (= e!559219 tp_is_empty!23331)))

(declare-fun mapIsEmpty!37062 () Bool)

(declare-fun mapRes!37062 () Bool)

(assert (=> mapIsEmpty!37062 mapRes!37062))

(declare-fun condMapEmpty!37062 () Bool)

(declare-fun mapDefault!37062 () ValueCell!11184)

(assert (=> mapNonEmpty!37056 (= condMapEmpty!37062 (= mapRest!37056 ((as const (Array (_ BitVec 32) ValueCell!11184)) mapDefault!37062)))))

(assert (=> mapNonEmpty!37056 (= tp!70127 (and e!559219 mapRes!37062))))

(declare-fun mapNonEmpty!37062 () Bool)

(declare-fun tp!70133 () Bool)

(declare-fun e!559218 () Bool)

(assert (=> mapNonEmpty!37062 (= mapRes!37062 (and tp!70133 e!559218))))

(declare-fun mapRest!37062 () (Array (_ BitVec 32) ValueCell!11184))

(declare-fun mapValue!37062 () ValueCell!11184)

(declare-fun mapKey!37062 () (_ BitVec 32))

(assert (=> mapNonEmpty!37062 (= mapRest!37056 (store mapRest!37062 mapKey!37062 mapValue!37062))))

(declare-fun b!991553 () Bool)

(assert (=> b!991553 (= e!559218 tp_is_empty!23331)))

(assert (= (and mapNonEmpty!37056 condMapEmpty!37062) mapIsEmpty!37062))

(assert (= (and mapNonEmpty!37056 (not condMapEmpty!37062)) mapNonEmpty!37062))

(assert (= (and mapNonEmpty!37062 ((_ is ValueCellFull!11184) mapValue!37062)) b!991553))

(assert (= (and mapNonEmpty!37056 ((_ is ValueCellFull!11184) mapDefault!37062)) b!991554))

(declare-fun m!919465 () Bool)

(assert (=> mapNonEmpty!37062 m!919465))

(check-sat tp_is_empty!23331 (not b!991543) (not mapNonEmpty!37062) (not b!991544) (not bm!42073))
(check-sat)
