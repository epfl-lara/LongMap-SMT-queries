; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131622 () Bool)

(assert start!131622)

(declare-fun b!1541707 () Bool)

(declare-fun e!857544 () Bool)

(declare-datatypes ((array!102514 0))(
  ( (array!102515 (arr!49462 (Array (_ BitVec 32) (_ BitVec 64))) (size!50012 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102514)

(assert (=> b!1541707 (= e!857544 (and (bvsle #b00000000000000000000000000000000 (size!50012 _keys!618)) (bvsge (size!50012 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541708 () Bool)

(declare-fun res!1058113 () Bool)

(assert (=> b!1541708 (=> (not res!1058113) (not e!857544))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58631 0))(
  ( (V!58632 (val!18898 Int)) )
))
(declare-datatypes ((ValueCell!17910 0))(
  ( (ValueCellFull!17910 (v!21698 V!58631)) (EmptyCell!17910) )
))
(declare-datatypes ((array!102516 0))(
  ( (array!102517 (arr!49463 (Array (_ BitVec 32) ValueCell!17910)) (size!50013 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102516)

(assert (=> b!1541708 (= res!1058113 (and (= (size!50013 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50012 _keys!618) (size!50013 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1058112 () Bool)

(assert (=> start!131622 (=> (not res!1058112) (not e!857544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131622 (= res!1058112 (validMask!0 mask!926))))

(assert (=> start!131622 e!857544))

(assert (=> start!131622 true))

(declare-fun e!857543 () Bool)

(declare-fun array_inv!38485 (array!102516) Bool)

(assert (=> start!131622 (and (array_inv!38485 _values!470) e!857543)))

(declare-fun array_inv!38486 (array!102514) Bool)

(assert (=> start!131622 (array_inv!38486 _keys!618)))

(declare-fun b!1541709 () Bool)

(declare-fun e!857542 () Bool)

(declare-fun tp_is_empty!37641 () Bool)

(assert (=> b!1541709 (= e!857542 tp_is_empty!37641)))

(declare-fun mapIsEmpty!58156 () Bool)

(declare-fun mapRes!58156 () Bool)

(assert (=> mapIsEmpty!58156 mapRes!58156))

(declare-fun mapNonEmpty!58156 () Bool)

(declare-fun tp!110683 () Bool)

(declare-fun e!857541 () Bool)

(assert (=> mapNonEmpty!58156 (= mapRes!58156 (and tp!110683 e!857541))))

(declare-fun mapKey!58156 () (_ BitVec 32))

(declare-fun mapRest!58156 () (Array (_ BitVec 32) ValueCell!17910))

(declare-fun mapValue!58156 () ValueCell!17910)

(assert (=> mapNonEmpty!58156 (= (arr!49463 _values!470) (store mapRest!58156 mapKey!58156 mapValue!58156))))

(declare-fun b!1541710 () Bool)

(assert (=> b!1541710 (= e!857541 tp_is_empty!37641)))

(declare-fun b!1541711 () Bool)

(assert (=> b!1541711 (= e!857543 (and e!857542 mapRes!58156))))

(declare-fun condMapEmpty!58156 () Bool)

(declare-fun mapDefault!58156 () ValueCell!17910)

(assert (=> b!1541711 (= condMapEmpty!58156 (= (arr!49463 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17910)) mapDefault!58156)))))

(declare-fun b!1541712 () Bool)

(declare-fun res!1058111 () Bool)

(assert (=> b!1541712 (=> (not res!1058111) (not e!857544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102514 (_ BitVec 32)) Bool)

(assert (=> b!1541712 (= res!1058111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131622 res!1058112) b!1541708))

(assert (= (and b!1541708 res!1058113) b!1541712))

(assert (= (and b!1541712 res!1058111) b!1541707))

(assert (= (and b!1541711 condMapEmpty!58156) mapIsEmpty!58156))

(assert (= (and b!1541711 (not condMapEmpty!58156)) mapNonEmpty!58156))

(get-info :version)

(assert (= (and mapNonEmpty!58156 ((_ is ValueCellFull!17910) mapValue!58156)) b!1541710))

(assert (= (and b!1541711 ((_ is ValueCellFull!17910) mapDefault!58156)) b!1541709))

(assert (= start!131622 b!1541711))

(declare-fun m!1423601 () Bool)

(assert (=> start!131622 m!1423601))

(declare-fun m!1423603 () Bool)

(assert (=> start!131622 m!1423603))

(declare-fun m!1423605 () Bool)

(assert (=> start!131622 m!1423605))

(declare-fun m!1423607 () Bool)

(assert (=> mapNonEmpty!58156 m!1423607))

(declare-fun m!1423609 () Bool)

(assert (=> b!1541712 m!1423609))

(check-sat (not start!131622) (not b!1541712) (not mapNonEmpty!58156) tp_is_empty!37641)
(check-sat)
(get-model)

(declare-fun d!160705 () Bool)

(assert (=> d!160705 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131622 d!160705))

(declare-fun d!160707 () Bool)

(assert (=> d!160707 (= (array_inv!38485 _values!470) (bvsge (size!50013 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131622 d!160707))

(declare-fun d!160709 () Bool)

(assert (=> d!160709 (= (array_inv!38486 _keys!618) (bvsge (size!50012 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131622 d!160709))

(declare-fun b!1541739 () Bool)

(declare-fun e!857569 () Bool)

(declare-fun call!68688 () Bool)

(assert (=> b!1541739 (= e!857569 call!68688)))

(declare-fun b!1541740 () Bool)

(declare-fun e!857567 () Bool)

(assert (=> b!1541740 (= e!857569 e!857567)))

(declare-fun lt!665712 () (_ BitVec 64))

(assert (=> b!1541740 (= lt!665712 (select (arr!49462 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51488 0))(
  ( (Unit!51489) )
))
(declare-fun lt!665711 () Unit!51488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102514 (_ BitVec 64) (_ BitVec 32)) Unit!51488)

(assert (=> b!1541740 (= lt!665711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665712 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541740 (arrayContainsKey!0 _keys!618 lt!665712 #b00000000000000000000000000000000)))

(declare-fun lt!665713 () Unit!51488)

(assert (=> b!1541740 (= lt!665713 lt!665711)))

(declare-fun res!1058128 () Bool)

(declare-datatypes ((SeekEntryResult!13509 0))(
  ( (MissingZero!13509 (index!56434 (_ BitVec 32))) (Found!13509 (index!56435 (_ BitVec 32))) (Intermediate!13509 (undefined!14321 Bool) (index!56436 (_ BitVec 32)) (x!138371 (_ BitVec 32))) (Undefined!13509) (MissingVacant!13509 (index!56437 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102514 (_ BitVec 32)) SeekEntryResult!13509)

(assert (=> b!1541740 (= res!1058128 (= (seekEntryOrOpen!0 (select (arr!49462 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13509 #b00000000000000000000000000000000)))))

(assert (=> b!1541740 (=> (not res!1058128) (not e!857567))))

(declare-fun b!1541741 () Bool)

(assert (=> b!1541741 (= e!857567 call!68688)))

(declare-fun bm!68685 () Bool)

(assert (=> bm!68685 (= call!68688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun d!160711 () Bool)

(declare-fun res!1058127 () Bool)

(declare-fun e!857568 () Bool)

(assert (=> d!160711 (=> res!1058127 e!857568)))

(assert (=> d!160711 (= res!1058127 (bvsge #b00000000000000000000000000000000 (size!50012 _keys!618)))))

(assert (=> d!160711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857568)))

(declare-fun b!1541742 () Bool)

(assert (=> b!1541742 (= e!857568 e!857569)))

(declare-fun c!141302 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541742 (= c!141302 (validKeyInArray!0 (select (arr!49462 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160711 (not res!1058127)) b!1541742))

(assert (= (and b!1541742 c!141302) b!1541740))

(assert (= (and b!1541742 (not c!141302)) b!1541739))

(assert (= (and b!1541740 res!1058128) b!1541741))

(assert (= (or b!1541741 b!1541739) bm!68685))

(declare-fun m!1423621 () Bool)

(assert (=> b!1541740 m!1423621))

(declare-fun m!1423623 () Bool)

(assert (=> b!1541740 m!1423623))

(declare-fun m!1423625 () Bool)

(assert (=> b!1541740 m!1423625))

(assert (=> b!1541740 m!1423621))

(declare-fun m!1423627 () Bool)

(assert (=> b!1541740 m!1423627))

(declare-fun m!1423629 () Bool)

(assert (=> bm!68685 m!1423629))

(assert (=> b!1541742 m!1423621))

(assert (=> b!1541742 m!1423621))

(declare-fun m!1423631 () Bool)

(assert (=> b!1541742 m!1423631))

(assert (=> b!1541712 d!160711))

(declare-fun b!1541749 () Bool)

(declare-fun e!857574 () Bool)

(assert (=> b!1541749 (= e!857574 tp_is_empty!37641)))

(declare-fun mapNonEmpty!58162 () Bool)

(declare-fun mapRes!58162 () Bool)

(declare-fun tp!110689 () Bool)

(assert (=> mapNonEmpty!58162 (= mapRes!58162 (and tp!110689 e!857574))))

(declare-fun mapKey!58162 () (_ BitVec 32))

(declare-fun mapRest!58162 () (Array (_ BitVec 32) ValueCell!17910))

(declare-fun mapValue!58162 () ValueCell!17910)

(assert (=> mapNonEmpty!58162 (= mapRest!58156 (store mapRest!58162 mapKey!58162 mapValue!58162))))

(declare-fun b!1541750 () Bool)

(declare-fun e!857575 () Bool)

(assert (=> b!1541750 (= e!857575 tp_is_empty!37641)))

(declare-fun mapIsEmpty!58162 () Bool)

(assert (=> mapIsEmpty!58162 mapRes!58162))

(declare-fun condMapEmpty!58162 () Bool)

(declare-fun mapDefault!58162 () ValueCell!17910)

(assert (=> mapNonEmpty!58156 (= condMapEmpty!58162 (= mapRest!58156 ((as const (Array (_ BitVec 32) ValueCell!17910)) mapDefault!58162)))))

(assert (=> mapNonEmpty!58156 (= tp!110683 (and e!857575 mapRes!58162))))

(assert (= (and mapNonEmpty!58156 condMapEmpty!58162) mapIsEmpty!58162))

(assert (= (and mapNonEmpty!58156 (not condMapEmpty!58162)) mapNonEmpty!58162))

(assert (= (and mapNonEmpty!58162 ((_ is ValueCellFull!17910) mapValue!58162)) b!1541749))

(assert (= (and mapNonEmpty!58156 ((_ is ValueCellFull!17910) mapDefault!58162)) b!1541750))

(declare-fun m!1423633 () Bool)

(assert (=> mapNonEmpty!58162 m!1423633))

(check-sat (not mapNonEmpty!58162) (not bm!68685) tp_is_empty!37641 (not b!1541740) (not b!1541742))
(check-sat)
