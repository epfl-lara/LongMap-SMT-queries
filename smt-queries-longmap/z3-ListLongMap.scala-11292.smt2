; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131584 () Bool)

(assert start!131584)

(declare-fun b!1541452 () Bool)

(declare-fun e!857392 () Bool)

(declare-fun e!857388 () Bool)

(declare-fun mapRes!58165 () Bool)

(assert (=> b!1541452 (= e!857392 (and e!857388 mapRes!58165))))

(declare-fun condMapEmpty!58165 () Bool)

(declare-datatypes ((V!58637 0))(
  ( (V!58638 (val!18900 Int)) )
))
(declare-datatypes ((ValueCell!17912 0))(
  ( (ValueCellFull!17912 (v!21696 V!58637)) (EmptyCell!17912) )
))
(declare-datatypes ((array!102468 0))(
  ( (array!102469 (arr!49439 (Array (_ BitVec 32) ValueCell!17912)) (size!49991 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102468)

(declare-fun mapDefault!58165 () ValueCell!17912)

(assert (=> b!1541452 (= condMapEmpty!58165 (= (arr!49439 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17912)) mapDefault!58165)))))

(declare-fun b!1541453 () Bool)

(declare-fun e!857389 () Bool)

(declare-fun tp_is_empty!37645 () Bool)

(assert (=> b!1541453 (= e!857389 tp_is_empty!37645)))

(declare-fun b!1541454 () Bool)

(declare-fun e!857391 () Bool)

(declare-datatypes ((List!35906 0))(
  ( (Nil!35903) (Cons!35902 (h!37348 (_ BitVec 64)) (t!50592 List!35906)) )
))
(declare-fun noDuplicate!2658 (List!35906) Bool)

(assert (=> b!1541454 (= e!857391 (not (noDuplicate!2658 Nil!35903)))))

(declare-fun b!1541455 () Bool)

(assert (=> b!1541455 (= e!857388 tp_is_empty!37645)))

(declare-fun b!1541456 () Bool)

(declare-fun res!1058008 () Bool)

(assert (=> b!1541456 (=> (not res!1058008) (not e!857391))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((array!102470 0))(
  ( (array!102471 (arr!49440 (Array (_ BitVec 32) (_ BitVec 64))) (size!49992 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102470)

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1541456 (= res!1058008 (and (= (size!49991 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49992 _keys!618) (size!49991 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58165 () Bool)

(declare-fun tp!110693 () Bool)

(assert (=> mapNonEmpty!58165 (= mapRes!58165 (and tp!110693 e!857389))))

(declare-fun mapKey!58165 () (_ BitVec 32))

(declare-fun mapValue!58165 () ValueCell!17912)

(declare-fun mapRest!58165 () (Array (_ BitVec 32) ValueCell!17912))

(assert (=> mapNonEmpty!58165 (= (arr!49439 _values!470) (store mapRest!58165 mapKey!58165 mapValue!58165))))

(declare-fun b!1541457 () Bool)

(declare-fun res!1058011 () Bool)

(assert (=> b!1541457 (=> (not res!1058011) (not e!857391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102470 (_ BitVec 32)) Bool)

(assert (=> b!1541457 (= res!1058011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58165 () Bool)

(assert (=> mapIsEmpty!58165 mapRes!58165))

(declare-fun res!1058009 () Bool)

(assert (=> start!131584 (=> (not res!1058009) (not e!857391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131584 (= res!1058009 (validMask!0 mask!926))))

(assert (=> start!131584 e!857391))

(assert (=> start!131584 true))

(declare-fun array_inv!38663 (array!102468) Bool)

(assert (=> start!131584 (and (array_inv!38663 _values!470) e!857392)))

(declare-fun array_inv!38664 (array!102470) Bool)

(assert (=> start!131584 (array_inv!38664 _keys!618)))

(declare-fun b!1541458 () Bool)

(declare-fun res!1058010 () Bool)

(assert (=> b!1541458 (=> (not res!1058010) (not e!857391))))

(assert (=> b!1541458 (= res!1058010 (and (bvsle #b00000000000000000000000000000000 (size!49992 _keys!618)) (bvslt (size!49992 _keys!618) #b01111111111111111111111111111111)))))

(assert (= (and start!131584 res!1058009) b!1541456))

(assert (= (and b!1541456 res!1058008) b!1541457))

(assert (= (and b!1541457 res!1058011) b!1541458))

(assert (= (and b!1541458 res!1058010) b!1541454))

(assert (= (and b!1541452 condMapEmpty!58165) mapIsEmpty!58165))

(assert (= (and b!1541452 (not condMapEmpty!58165)) mapNonEmpty!58165))

(get-info :version)

(assert (= (and mapNonEmpty!58165 ((_ is ValueCellFull!17912) mapValue!58165)) b!1541453))

(assert (= (and b!1541452 ((_ is ValueCellFull!17912) mapDefault!58165)) b!1541455))

(assert (= start!131584 b!1541452))

(declare-fun m!1422743 () Bool)

(assert (=> b!1541454 m!1422743))

(declare-fun m!1422745 () Bool)

(assert (=> mapNonEmpty!58165 m!1422745))

(declare-fun m!1422747 () Bool)

(assert (=> b!1541457 m!1422747))

(declare-fun m!1422749 () Bool)

(assert (=> start!131584 m!1422749))

(declare-fun m!1422751 () Bool)

(assert (=> start!131584 m!1422751))

(declare-fun m!1422753 () Bool)

(assert (=> start!131584 m!1422753))

(check-sat tp_is_empty!37645 (not mapNonEmpty!58165) (not start!131584) (not b!1541457) (not b!1541454))
(check-sat)
(get-model)

(declare-fun d!160461 () Bool)

(declare-fun res!1058040 () Bool)

(declare-fun e!857427 () Bool)

(assert (=> d!160461 (=> res!1058040 e!857427)))

(assert (=> d!160461 (= res!1058040 ((_ is Nil!35903) Nil!35903))))

(assert (=> d!160461 (= (noDuplicate!2658 Nil!35903) e!857427)))

(declare-fun b!1541505 () Bool)

(declare-fun e!857428 () Bool)

(assert (=> b!1541505 (= e!857427 e!857428)))

(declare-fun res!1058041 () Bool)

(assert (=> b!1541505 (=> (not res!1058041) (not e!857428))))

(declare-fun contains!9984 (List!35906 (_ BitVec 64)) Bool)

(assert (=> b!1541505 (= res!1058041 (not (contains!9984 (t!50592 Nil!35903) (h!37348 Nil!35903))))))

(declare-fun b!1541506 () Bool)

(assert (=> b!1541506 (= e!857428 (noDuplicate!2658 (t!50592 Nil!35903)))))

(assert (= (and d!160461 (not res!1058040)) b!1541505))

(assert (= (and b!1541505 res!1058041) b!1541506))

(declare-fun m!1422779 () Bool)

(assert (=> b!1541505 m!1422779))

(declare-fun m!1422781 () Bool)

(assert (=> b!1541506 m!1422781))

(assert (=> b!1541454 d!160461))

(declare-fun d!160463 () Bool)

(assert (=> d!160463 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131584 d!160463))

(declare-fun d!160465 () Bool)

(assert (=> d!160465 (= (array_inv!38663 _values!470) (bvsge (size!49991 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131584 d!160465))

(declare-fun d!160467 () Bool)

(assert (=> d!160467 (= (array_inv!38664 _keys!618) (bvsge (size!49992 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131584 d!160467))

(declare-fun b!1541516 () Bool)

(declare-fun e!857436 () Bool)

(declare-fun e!857435 () Bool)

(assert (=> b!1541516 (= e!857436 e!857435)))

(declare-fun c!141216 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541516 (= c!141216 (validKeyInArray!0 (select (arr!49440 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1541517 () Bool)

(declare-fun e!857437 () Bool)

(assert (=> b!1541517 (= e!857435 e!857437)))

(declare-fun lt!665434 () (_ BitVec 64))

(assert (=> b!1541517 (= lt!665434 (select (arr!49440 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51321 0))(
  ( (Unit!51322) )
))
(declare-fun lt!665435 () Unit!51321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102470 (_ BitVec 64) (_ BitVec 32)) Unit!51321)

(assert (=> b!1541517 (= lt!665435 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665434 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541517 (arrayContainsKey!0 _keys!618 lt!665434 #b00000000000000000000000000000000)))

(declare-fun lt!665436 () Unit!51321)

(assert (=> b!1541517 (= lt!665436 lt!665435)))

(declare-fun res!1058046 () Bool)

(declare-datatypes ((SeekEntryResult!13510 0))(
  ( (MissingZero!13510 (index!56438 (_ BitVec 32))) (Found!13510 (index!56439 (_ BitVec 32))) (Intermediate!13510 (undefined!14322 Bool) (index!56440 (_ BitVec 32)) (x!138377 (_ BitVec 32))) (Undefined!13510) (MissingVacant!13510 (index!56441 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102470 (_ BitVec 32)) SeekEntryResult!13510)

(assert (=> b!1541517 (= res!1058046 (= (seekEntryOrOpen!0 (select (arr!49440 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13510 #b00000000000000000000000000000000)))))

(assert (=> b!1541517 (=> (not res!1058046) (not e!857437))))

(declare-fun b!1541518 () Bool)

(declare-fun call!68656 () Bool)

(assert (=> b!1541518 (= e!857435 call!68656)))

(declare-fun bm!68653 () Bool)

(assert (=> bm!68653 (= call!68656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun d!160469 () Bool)

(declare-fun res!1058047 () Bool)

(assert (=> d!160469 (=> res!1058047 e!857436)))

(assert (=> d!160469 (= res!1058047 (bvsge #b00000000000000000000000000000000 (size!49992 _keys!618)))))

(assert (=> d!160469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857436)))

(declare-fun b!1541515 () Bool)

(assert (=> b!1541515 (= e!857437 call!68656)))

(assert (= (and d!160469 (not res!1058047)) b!1541516))

(assert (= (and b!1541516 c!141216) b!1541517))

(assert (= (and b!1541516 (not c!141216)) b!1541518))

(assert (= (and b!1541517 res!1058046) b!1541515))

(assert (= (or b!1541515 b!1541518) bm!68653))

(declare-fun m!1422783 () Bool)

(assert (=> b!1541516 m!1422783))

(assert (=> b!1541516 m!1422783))

(declare-fun m!1422785 () Bool)

(assert (=> b!1541516 m!1422785))

(assert (=> b!1541517 m!1422783))

(declare-fun m!1422787 () Bool)

(assert (=> b!1541517 m!1422787))

(declare-fun m!1422789 () Bool)

(assert (=> b!1541517 m!1422789))

(assert (=> b!1541517 m!1422783))

(declare-fun m!1422791 () Bool)

(assert (=> b!1541517 m!1422791))

(declare-fun m!1422793 () Bool)

(assert (=> bm!68653 m!1422793))

(assert (=> b!1541457 d!160469))

(declare-fun b!1541525 () Bool)

(declare-fun e!857443 () Bool)

(assert (=> b!1541525 (= e!857443 tp_is_empty!37645)))

(declare-fun condMapEmpty!58174 () Bool)

(declare-fun mapDefault!58174 () ValueCell!17912)

(assert (=> mapNonEmpty!58165 (= condMapEmpty!58174 (= mapRest!58165 ((as const (Array (_ BitVec 32) ValueCell!17912)) mapDefault!58174)))))

(declare-fun e!857442 () Bool)

(declare-fun mapRes!58174 () Bool)

(assert (=> mapNonEmpty!58165 (= tp!110693 (and e!857442 mapRes!58174))))

(declare-fun b!1541526 () Bool)

(assert (=> b!1541526 (= e!857442 tp_is_empty!37645)))

(declare-fun mapNonEmpty!58174 () Bool)

(declare-fun tp!110702 () Bool)

(assert (=> mapNonEmpty!58174 (= mapRes!58174 (and tp!110702 e!857443))))

(declare-fun mapKey!58174 () (_ BitVec 32))

(declare-fun mapRest!58174 () (Array (_ BitVec 32) ValueCell!17912))

(declare-fun mapValue!58174 () ValueCell!17912)

(assert (=> mapNonEmpty!58174 (= mapRest!58165 (store mapRest!58174 mapKey!58174 mapValue!58174))))

(declare-fun mapIsEmpty!58174 () Bool)

(assert (=> mapIsEmpty!58174 mapRes!58174))

(assert (= (and mapNonEmpty!58165 condMapEmpty!58174) mapIsEmpty!58174))

(assert (= (and mapNonEmpty!58165 (not condMapEmpty!58174)) mapNonEmpty!58174))

(assert (= (and mapNonEmpty!58174 ((_ is ValueCellFull!17912) mapValue!58174)) b!1541525))

(assert (= (and mapNonEmpty!58165 ((_ is ValueCellFull!17912) mapDefault!58174)) b!1541526))

(declare-fun m!1422795 () Bool)

(assert (=> mapNonEmpty!58174 m!1422795))

(check-sat tp_is_empty!37645 (not mapNonEmpty!58174) (not b!1541505) (not b!1541506) (not bm!68653) (not b!1541516) (not b!1541517))
(check-sat)
