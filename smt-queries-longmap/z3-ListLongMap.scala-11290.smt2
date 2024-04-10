; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131608 () Bool)

(assert start!131608)

(declare-fun b!1541633 () Bool)

(declare-fun res!1058080 () Bool)

(declare-fun e!857482 () Bool)

(assert (=> b!1541633 (=> (not res!1058080) (not e!857482))))

(declare-datatypes ((array!102502 0))(
  ( (array!102503 (arr!49457 (Array (_ BitVec 32) (_ BitVec 64))) (size!50007 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102502)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58623 0))(
  ( (V!58624 (val!18895 Int)) )
))
(declare-datatypes ((ValueCell!17907 0))(
  ( (ValueCellFull!17907 (v!21695 V!58623)) (EmptyCell!17907) )
))
(declare-datatypes ((array!102504 0))(
  ( (array!102505 (arr!49458 (Array (_ BitVec 32) ValueCell!17907)) (size!50008 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102504)

(assert (=> b!1541633 (= res!1058080 (and (= (size!50008 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50007 _keys!618) (size!50008 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541634 () Bool)

(assert (=> b!1541634 (= e!857482 (bvsgt #b00000000000000000000000000000000 (size!50007 _keys!618)))))

(declare-fun mapNonEmpty!58144 () Bool)

(declare-fun mapRes!58144 () Bool)

(declare-fun tp!110671 () Bool)

(declare-fun e!857484 () Bool)

(assert (=> mapNonEmpty!58144 (= mapRes!58144 (and tp!110671 e!857484))))

(declare-fun mapKey!58144 () (_ BitVec 32))

(declare-fun mapValue!58144 () ValueCell!17907)

(declare-fun mapRest!58144 () (Array (_ BitVec 32) ValueCell!17907))

(assert (=> mapNonEmpty!58144 (= (arr!49458 _values!470) (store mapRest!58144 mapKey!58144 mapValue!58144))))

(declare-fun b!1541635 () Bool)

(declare-fun tp_is_empty!37635 () Bool)

(assert (=> b!1541635 (= e!857484 tp_is_empty!37635)))

(declare-fun res!1058078 () Bool)

(assert (=> start!131608 (=> (not res!1058078) (not e!857482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131608 (= res!1058078 (validMask!0 mask!926))))

(assert (=> start!131608 e!857482))

(assert (=> start!131608 true))

(declare-fun e!857481 () Bool)

(declare-fun array_inv!38481 (array!102504) Bool)

(assert (=> start!131608 (and (array_inv!38481 _values!470) e!857481)))

(declare-fun array_inv!38482 (array!102502) Bool)

(assert (=> start!131608 (array_inv!38482 _keys!618)))

(declare-fun mapIsEmpty!58144 () Bool)

(assert (=> mapIsEmpty!58144 mapRes!58144))

(declare-fun b!1541636 () Bool)

(declare-fun res!1058079 () Bool)

(assert (=> b!1541636 (=> (not res!1058079) (not e!857482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102502 (_ BitVec 32)) Bool)

(assert (=> b!1541636 (= res!1058079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541637 () Bool)

(declare-fun e!857485 () Bool)

(assert (=> b!1541637 (= e!857481 (and e!857485 mapRes!58144))))

(declare-fun condMapEmpty!58144 () Bool)

(declare-fun mapDefault!58144 () ValueCell!17907)

(assert (=> b!1541637 (= condMapEmpty!58144 (= (arr!49458 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17907)) mapDefault!58144)))))

(declare-fun b!1541638 () Bool)

(assert (=> b!1541638 (= e!857485 tp_is_empty!37635)))

(assert (= (and start!131608 res!1058078) b!1541633))

(assert (= (and b!1541633 res!1058080) b!1541636))

(assert (= (and b!1541636 res!1058079) b!1541634))

(assert (= (and b!1541637 condMapEmpty!58144) mapIsEmpty!58144))

(assert (= (and b!1541637 (not condMapEmpty!58144)) mapNonEmpty!58144))

(get-info :version)

(assert (= (and mapNonEmpty!58144 ((_ is ValueCellFull!17907) mapValue!58144)) b!1541635))

(assert (= (and b!1541637 ((_ is ValueCellFull!17907) mapDefault!58144)) b!1541638))

(assert (= start!131608 b!1541637))

(declare-fun m!1423557 () Bool)

(assert (=> mapNonEmpty!58144 m!1423557))

(declare-fun m!1423559 () Bool)

(assert (=> start!131608 m!1423559))

(declare-fun m!1423561 () Bool)

(assert (=> start!131608 m!1423561))

(declare-fun m!1423563 () Bool)

(assert (=> start!131608 m!1423563))

(declare-fun m!1423565 () Bool)

(assert (=> b!1541636 m!1423565))

(check-sat (not start!131608) (not b!1541636) (not mapNonEmpty!58144) tp_is_empty!37635)
(check-sat)
(get-model)

(declare-fun d!160695 () Bool)

(assert (=> d!160695 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131608 d!160695))

(declare-fun d!160697 () Bool)

(assert (=> d!160697 (= (array_inv!38481 _values!470) (bvsge (size!50008 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131608 d!160697))

(declare-fun d!160699 () Bool)

(assert (=> d!160699 (= (array_inv!38482 _keys!618) (bvsge (size!50007 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131608 d!160699))

(declare-fun b!1541665 () Bool)

(declare-fun e!857508 () Bool)

(declare-fun e!857509 () Bool)

(assert (=> b!1541665 (= e!857508 e!857509)))

(declare-fun c!141299 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541665 (= c!141299 (validKeyInArray!0 (select (arr!49457 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160701 () Bool)

(declare-fun res!1058095 () Bool)

(assert (=> d!160701 (=> res!1058095 e!857508)))

(assert (=> d!160701 (= res!1058095 (bvsge #b00000000000000000000000000000000 (size!50007 _keys!618)))))

(assert (=> d!160701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857508)))

(declare-fun bm!68682 () Bool)

(declare-fun call!68685 () Bool)

(assert (=> bm!68682 (= call!68685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1541666 () Bool)

(declare-fun e!857507 () Bool)

(assert (=> b!1541666 (= e!857509 e!857507)))

(declare-fun lt!665703 () (_ BitVec 64))

(assert (=> b!1541666 (= lt!665703 (select (arr!49457 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51486 0))(
  ( (Unit!51487) )
))
(declare-fun lt!665704 () Unit!51486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102502 (_ BitVec 64) (_ BitVec 32)) Unit!51486)

(assert (=> b!1541666 (= lt!665704 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665703 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541666 (arrayContainsKey!0 _keys!618 lt!665703 #b00000000000000000000000000000000)))

(declare-fun lt!665702 () Unit!51486)

(assert (=> b!1541666 (= lt!665702 lt!665704)))

(declare-fun res!1058094 () Bool)

(declare-datatypes ((SeekEntryResult!13508 0))(
  ( (MissingZero!13508 (index!56430 (_ BitVec 32))) (Found!13508 (index!56431 (_ BitVec 32))) (Intermediate!13508 (undefined!14320 Bool) (index!56432 (_ BitVec 32)) (x!138360 (_ BitVec 32))) (Undefined!13508) (MissingVacant!13508 (index!56433 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102502 (_ BitVec 32)) SeekEntryResult!13508)

(assert (=> b!1541666 (= res!1058094 (= (seekEntryOrOpen!0 (select (arr!49457 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13508 #b00000000000000000000000000000000)))))

(assert (=> b!1541666 (=> (not res!1058094) (not e!857507))))

(declare-fun b!1541667 () Bool)

(assert (=> b!1541667 (= e!857509 call!68685)))

(declare-fun b!1541668 () Bool)

(assert (=> b!1541668 (= e!857507 call!68685)))

(assert (= (and d!160701 (not res!1058095)) b!1541665))

(assert (= (and b!1541665 c!141299) b!1541666))

(assert (= (and b!1541665 (not c!141299)) b!1541667))

(assert (= (and b!1541666 res!1058094) b!1541668))

(assert (= (or b!1541668 b!1541667) bm!68682))

(declare-fun m!1423577 () Bool)

(assert (=> b!1541665 m!1423577))

(assert (=> b!1541665 m!1423577))

(declare-fun m!1423579 () Bool)

(assert (=> b!1541665 m!1423579))

(declare-fun m!1423581 () Bool)

(assert (=> bm!68682 m!1423581))

(assert (=> b!1541666 m!1423577))

(declare-fun m!1423583 () Bool)

(assert (=> b!1541666 m!1423583))

(declare-fun m!1423585 () Bool)

(assert (=> b!1541666 m!1423585))

(assert (=> b!1541666 m!1423577))

(declare-fun m!1423587 () Bool)

(assert (=> b!1541666 m!1423587))

(assert (=> b!1541636 d!160701))

(declare-fun condMapEmpty!58150 () Bool)

(declare-fun mapDefault!58150 () ValueCell!17907)

(assert (=> mapNonEmpty!58144 (= condMapEmpty!58150 (= mapRest!58144 ((as const (Array (_ BitVec 32) ValueCell!17907)) mapDefault!58150)))))

(declare-fun e!857514 () Bool)

(declare-fun mapRes!58150 () Bool)

(assert (=> mapNonEmpty!58144 (= tp!110671 (and e!857514 mapRes!58150))))

(declare-fun mapNonEmpty!58150 () Bool)

(declare-fun tp!110677 () Bool)

(declare-fun e!857515 () Bool)

(assert (=> mapNonEmpty!58150 (= mapRes!58150 (and tp!110677 e!857515))))

(declare-fun mapKey!58150 () (_ BitVec 32))

(declare-fun mapRest!58150 () (Array (_ BitVec 32) ValueCell!17907))

(declare-fun mapValue!58150 () ValueCell!17907)

(assert (=> mapNonEmpty!58150 (= mapRest!58144 (store mapRest!58150 mapKey!58150 mapValue!58150))))

(declare-fun b!1541675 () Bool)

(assert (=> b!1541675 (= e!857515 tp_is_empty!37635)))

(declare-fun b!1541676 () Bool)

(assert (=> b!1541676 (= e!857514 tp_is_empty!37635)))

(declare-fun mapIsEmpty!58150 () Bool)

(assert (=> mapIsEmpty!58150 mapRes!58150))

(assert (= (and mapNonEmpty!58144 condMapEmpty!58150) mapIsEmpty!58150))

(assert (= (and mapNonEmpty!58144 (not condMapEmpty!58150)) mapNonEmpty!58150))

(assert (= (and mapNonEmpty!58150 ((_ is ValueCellFull!17907) mapValue!58150)) b!1541675))

(assert (= (and mapNonEmpty!58144 ((_ is ValueCellFull!17907) mapDefault!58150)) b!1541676))

(declare-fun m!1423589 () Bool)

(assert (=> mapNonEmpty!58150 m!1423589))

(check-sat (not b!1541665) (not mapNonEmpty!58150) (not bm!68682) tp_is_empty!37635 (not b!1541666))
(check-sat)
