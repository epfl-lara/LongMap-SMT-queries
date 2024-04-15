; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131570 () Bool)

(assert start!131570)

(declare-fun b!1541376 () Bool)

(declare-fun e!857330 () Bool)

(declare-fun tp_is_empty!37639 () Bool)

(assert (=> b!1541376 (= e!857330 tp_is_empty!37639)))

(declare-fun b!1541377 () Bool)

(declare-fun res!1057974 () Bool)

(declare-fun e!857329 () Bool)

(assert (=> b!1541377 (=> (not res!1057974) (not e!857329))))

(declare-datatypes ((array!102458 0))(
  ( (array!102459 (arr!49435 (Array (_ BitVec 32) (_ BitVec 64))) (size!49987 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102458)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58629 0))(
  ( (V!58630 (val!18897 Int)) )
))
(declare-datatypes ((ValueCell!17909 0))(
  ( (ValueCellFull!17909 (v!21693 V!58629)) (EmptyCell!17909) )
))
(declare-datatypes ((array!102460 0))(
  ( (array!102461 (arr!49436 (Array (_ BitVec 32) ValueCell!17909)) (size!49988 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102460)

(assert (=> b!1541377 (= res!1057974 (and (= (size!49988 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49987 _keys!618) (size!49988 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541378 () Bool)

(assert (=> b!1541378 (= e!857329 (and (bvsle #b00000000000000000000000000000000 (size!49987 _keys!618)) (bvsge (size!49987 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541379 () Bool)

(declare-fun res!1057973 () Bool)

(assert (=> b!1541379 (=> (not res!1057973) (not e!857329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102458 (_ BitVec 32)) Bool)

(assert (=> b!1541379 (= res!1057973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58153 () Bool)

(declare-fun mapRes!58153 () Bool)

(declare-fun tp!110681 () Bool)

(assert (=> mapNonEmpty!58153 (= mapRes!58153 (and tp!110681 e!857330))))

(declare-fun mapRest!58153 () (Array (_ BitVec 32) ValueCell!17909))

(declare-fun mapKey!58153 () (_ BitVec 32))

(declare-fun mapValue!58153 () ValueCell!17909)

(assert (=> mapNonEmpty!58153 (= (arr!49436 _values!470) (store mapRest!58153 mapKey!58153 mapValue!58153))))

(declare-fun mapIsEmpty!58153 () Bool)

(assert (=> mapIsEmpty!58153 mapRes!58153))

(declare-fun b!1541380 () Bool)

(declare-fun e!857328 () Bool)

(declare-fun e!857331 () Bool)

(assert (=> b!1541380 (= e!857328 (and e!857331 mapRes!58153))))

(declare-fun condMapEmpty!58153 () Bool)

(declare-fun mapDefault!58153 () ValueCell!17909)

(assert (=> b!1541380 (= condMapEmpty!58153 (= (arr!49436 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17909)) mapDefault!58153)))))

(declare-fun res!1057975 () Bool)

(assert (=> start!131570 (=> (not res!1057975) (not e!857329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131570 (= res!1057975 (validMask!0 mask!926))))

(assert (=> start!131570 e!857329))

(assert (=> start!131570 true))

(declare-fun array_inv!38661 (array!102460) Bool)

(assert (=> start!131570 (and (array_inv!38661 _values!470) e!857328)))

(declare-fun array_inv!38662 (array!102458) Bool)

(assert (=> start!131570 (array_inv!38662 _keys!618)))

(declare-fun b!1541381 () Bool)

(assert (=> b!1541381 (= e!857331 tp_is_empty!37639)))

(assert (= (and start!131570 res!1057975) b!1541377))

(assert (= (and b!1541377 res!1057974) b!1541379))

(assert (= (and b!1541379 res!1057973) b!1541378))

(assert (= (and b!1541380 condMapEmpty!58153) mapIsEmpty!58153))

(assert (= (and b!1541380 (not condMapEmpty!58153)) mapNonEmpty!58153))

(get-info :version)

(assert (= (and mapNonEmpty!58153 ((_ is ValueCellFull!17909) mapValue!58153)) b!1541376))

(assert (= (and b!1541380 ((_ is ValueCellFull!17909) mapDefault!58153)) b!1541381))

(assert (= start!131570 b!1541380))

(declare-fun m!1422699 () Bool)

(assert (=> b!1541379 m!1422699))

(declare-fun m!1422701 () Bool)

(assert (=> mapNonEmpty!58153 m!1422701))

(declare-fun m!1422703 () Bool)

(assert (=> start!131570 m!1422703))

(declare-fun m!1422705 () Bool)

(assert (=> start!131570 m!1422705))

(declare-fun m!1422707 () Bool)

(assert (=> start!131570 m!1422707))

(check-sat (not start!131570) (not b!1541379) (not mapNonEmpty!58153) tp_is_empty!37639)
(check-sat)
(get-model)

(declare-fun d!160451 () Bool)

(assert (=> d!160451 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131570 d!160451))

(declare-fun d!160453 () Bool)

(assert (=> d!160453 (= (array_inv!38661 _values!470) (bvsge (size!49988 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131570 d!160453))

(declare-fun d!160455 () Bool)

(assert (=> d!160455 (= (array_inv!38662 _keys!618) (bvsge (size!49987 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131570 d!160455))

(declare-fun b!1541426 () Bool)

(declare-fun e!857369 () Bool)

(declare-fun call!68653 () Bool)

(assert (=> b!1541426 (= e!857369 call!68653)))

(declare-fun d!160457 () Bool)

(declare-fun res!1057999 () Bool)

(declare-fun e!857371 () Bool)

(assert (=> d!160457 (=> res!1057999 e!857371)))

(assert (=> d!160457 (= res!1057999 (bvsge #b00000000000000000000000000000000 (size!49987 _keys!618)))))

(assert (=> d!160457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857371)))

(declare-fun bm!68650 () Bool)

(assert (=> bm!68650 (= call!68653 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1541427 () Bool)

(declare-fun e!857370 () Bool)

(assert (=> b!1541427 (= e!857370 e!857369)))

(declare-fun lt!665427 () (_ BitVec 64))

(assert (=> b!1541427 (= lt!665427 (select (arr!49435 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51319 0))(
  ( (Unit!51320) )
))
(declare-fun lt!665426 () Unit!51319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102458 (_ BitVec 64) (_ BitVec 32)) Unit!51319)

(assert (=> b!1541427 (= lt!665426 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665427 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541427 (arrayContainsKey!0 _keys!618 lt!665427 #b00000000000000000000000000000000)))

(declare-fun lt!665425 () Unit!51319)

(assert (=> b!1541427 (= lt!665425 lt!665426)))

(declare-fun res!1057998 () Bool)

(declare-datatypes ((SeekEntryResult!13509 0))(
  ( (MissingZero!13509 (index!56434 (_ BitVec 32))) (Found!13509 (index!56435 (_ BitVec 32))) (Intermediate!13509 (undefined!14321 Bool) (index!56436 (_ BitVec 32)) (x!138366 (_ BitVec 32))) (Undefined!13509) (MissingVacant!13509 (index!56437 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102458 (_ BitVec 32)) SeekEntryResult!13509)

(assert (=> b!1541427 (= res!1057998 (= (seekEntryOrOpen!0 (select (arr!49435 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13509 #b00000000000000000000000000000000)))))

(assert (=> b!1541427 (=> (not res!1057998) (not e!857369))))

(declare-fun b!1541428 () Bool)

(assert (=> b!1541428 (= e!857370 call!68653)))

(declare-fun b!1541429 () Bool)

(assert (=> b!1541429 (= e!857371 e!857370)))

(declare-fun c!141213 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541429 (= c!141213 (validKeyInArray!0 (select (arr!49435 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160457 (not res!1057999)) b!1541429))

(assert (= (and b!1541429 c!141213) b!1541427))

(assert (= (and b!1541429 (not c!141213)) b!1541428))

(assert (= (and b!1541427 res!1057998) b!1541426))

(assert (= (or b!1541426 b!1541428) bm!68650))

(declare-fun m!1422729 () Bool)

(assert (=> bm!68650 m!1422729))

(declare-fun m!1422731 () Bool)

(assert (=> b!1541427 m!1422731))

(declare-fun m!1422733 () Bool)

(assert (=> b!1541427 m!1422733))

(declare-fun m!1422735 () Bool)

(assert (=> b!1541427 m!1422735))

(assert (=> b!1541427 m!1422731))

(declare-fun m!1422737 () Bool)

(assert (=> b!1541427 m!1422737))

(assert (=> b!1541429 m!1422731))

(assert (=> b!1541429 m!1422731))

(declare-fun m!1422739 () Bool)

(assert (=> b!1541429 m!1422739))

(assert (=> b!1541379 d!160457))

(declare-fun mapNonEmpty!58162 () Bool)

(declare-fun mapRes!58162 () Bool)

(declare-fun tp!110690 () Bool)

(declare-fun e!857376 () Bool)

(assert (=> mapNonEmpty!58162 (= mapRes!58162 (and tp!110690 e!857376))))

(declare-fun mapRest!58162 () (Array (_ BitVec 32) ValueCell!17909))

(declare-fun mapKey!58162 () (_ BitVec 32))

(declare-fun mapValue!58162 () ValueCell!17909)

(assert (=> mapNonEmpty!58162 (= mapRest!58153 (store mapRest!58162 mapKey!58162 mapValue!58162))))

(declare-fun b!1541437 () Bool)

(declare-fun e!857377 () Bool)

(assert (=> b!1541437 (= e!857377 tp_is_empty!37639)))

(declare-fun condMapEmpty!58162 () Bool)

(declare-fun mapDefault!58162 () ValueCell!17909)

(assert (=> mapNonEmpty!58153 (= condMapEmpty!58162 (= mapRest!58153 ((as const (Array (_ BitVec 32) ValueCell!17909)) mapDefault!58162)))))

(assert (=> mapNonEmpty!58153 (= tp!110681 (and e!857377 mapRes!58162))))

(declare-fun b!1541436 () Bool)

(assert (=> b!1541436 (= e!857376 tp_is_empty!37639)))

(declare-fun mapIsEmpty!58162 () Bool)

(assert (=> mapIsEmpty!58162 mapRes!58162))

(assert (= (and mapNonEmpty!58153 condMapEmpty!58162) mapIsEmpty!58162))

(assert (= (and mapNonEmpty!58153 (not condMapEmpty!58162)) mapNonEmpty!58162))

(assert (= (and mapNonEmpty!58162 ((_ is ValueCellFull!17909) mapValue!58162)) b!1541436))

(assert (= (and mapNonEmpty!58153 ((_ is ValueCellFull!17909) mapDefault!58162)) b!1541437))

(declare-fun m!1422741 () Bool)

(assert (=> mapNonEmpty!58162 m!1422741))

(check-sat (not b!1541429) (not mapNonEmpty!58162) (not bm!68650) tp_is_empty!37639 (not b!1541427))
(check-sat)
