; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131636 () Bool)

(assert start!131636)

(declare-fun b!1541786 () Bool)

(declare-fun e!857604 () Bool)

(declare-fun tp_is_empty!37647 () Bool)

(assert (=> b!1541786 (= e!857604 tp_is_empty!37647)))

(declare-fun b!1541787 () Bool)

(declare-fun e!857603 () Bool)

(declare-fun mapRes!58168 () Bool)

(assert (=> b!1541787 (= e!857603 (and e!857604 mapRes!58168))))

(declare-fun condMapEmpty!58168 () Bool)

(declare-datatypes ((V!58639 0))(
  ( (V!58640 (val!18901 Int)) )
))
(declare-datatypes ((ValueCell!17913 0))(
  ( (ValueCellFull!17913 (v!21701 V!58639)) (EmptyCell!17913) )
))
(declare-datatypes ((array!102526 0))(
  ( (array!102527 (arr!49467 (Array (_ BitVec 32) ValueCell!17913)) (size!50017 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102526)

(declare-fun mapDefault!58168 () ValueCell!17913)

(assert (=> b!1541787 (= condMapEmpty!58168 (= (arr!49467 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17913)) mapDefault!58168)))))

(declare-fun b!1541788 () Bool)

(declare-fun res!1058151 () Bool)

(declare-fun e!857605 () Bool)

(assert (=> b!1541788 (=> (not res!1058151) (not e!857605))))

(declare-datatypes ((array!102528 0))(
  ( (array!102529 (arr!49468 (Array (_ BitVec 32) (_ BitVec 64))) (size!50018 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102528)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1541788 (= res!1058151 (and (= (size!50017 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50018 _keys!618) (size!50017 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541789 () Bool)

(declare-fun res!1058152 () Bool)

(assert (=> b!1541789 (=> (not res!1058152) (not e!857605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102528 (_ BitVec 32)) Bool)

(assert (=> b!1541789 (= res!1058152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541790 () Bool)

(declare-fun res!1058150 () Bool)

(assert (=> b!1541790 (=> (not res!1058150) (not e!857605))))

(assert (=> b!1541790 (= res!1058150 (and (bvsle #b00000000000000000000000000000000 (size!50018 _keys!618)) (bvslt (size!50018 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541791 () Bool)

(declare-datatypes ((List!35853 0))(
  ( (Nil!35850) (Cons!35849 (h!37294 (_ BitVec 64)) (t!50547 List!35853)) )
))
(declare-fun noDuplicate!2636 (List!35853) Bool)

(assert (=> b!1541791 (= e!857605 (not (noDuplicate!2636 Nil!35850)))))

(declare-fun res!1058149 () Bool)

(assert (=> start!131636 (=> (not res!1058149) (not e!857605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131636 (= res!1058149 (validMask!0 mask!926))))

(assert (=> start!131636 e!857605))

(assert (=> start!131636 true))

(declare-fun array_inv!38489 (array!102526) Bool)

(assert (=> start!131636 (and (array_inv!38489 _values!470) e!857603)))

(declare-fun array_inv!38490 (array!102528) Bool)

(assert (=> start!131636 (array_inv!38490 _keys!618)))

(declare-fun b!1541792 () Bool)

(declare-fun e!857601 () Bool)

(assert (=> b!1541792 (= e!857601 tp_is_empty!37647)))

(declare-fun mapIsEmpty!58168 () Bool)

(assert (=> mapIsEmpty!58168 mapRes!58168))

(declare-fun mapNonEmpty!58168 () Bool)

(declare-fun tp!110695 () Bool)

(assert (=> mapNonEmpty!58168 (= mapRes!58168 (and tp!110695 e!857601))))

(declare-fun mapRest!58168 () (Array (_ BitVec 32) ValueCell!17913))

(declare-fun mapKey!58168 () (_ BitVec 32))

(declare-fun mapValue!58168 () ValueCell!17913)

(assert (=> mapNonEmpty!58168 (= (arr!49467 _values!470) (store mapRest!58168 mapKey!58168 mapValue!58168))))

(assert (= (and start!131636 res!1058149) b!1541788))

(assert (= (and b!1541788 res!1058151) b!1541789))

(assert (= (and b!1541789 res!1058152) b!1541790))

(assert (= (and b!1541790 res!1058150) b!1541791))

(assert (= (and b!1541787 condMapEmpty!58168) mapIsEmpty!58168))

(assert (= (and b!1541787 (not condMapEmpty!58168)) mapNonEmpty!58168))

(get-info :version)

(assert (= (and mapNonEmpty!58168 ((_ is ValueCellFull!17913) mapValue!58168)) b!1541792))

(assert (= (and b!1541787 ((_ is ValueCellFull!17913) mapDefault!58168)) b!1541786))

(assert (= start!131636 b!1541787))

(declare-fun m!1423647 () Bool)

(assert (=> b!1541789 m!1423647))

(declare-fun m!1423649 () Bool)

(assert (=> b!1541791 m!1423649))

(declare-fun m!1423651 () Bool)

(assert (=> start!131636 m!1423651))

(declare-fun m!1423653 () Bool)

(assert (=> start!131636 m!1423653))

(declare-fun m!1423655 () Bool)

(assert (=> start!131636 m!1423655))

(declare-fun m!1423657 () Bool)

(assert (=> mapNonEmpty!58168 m!1423657))

(check-sat tp_is_empty!37647 (not b!1541791) (not start!131636) (not b!1541789) (not mapNonEmpty!58168))
(check-sat)
(get-model)

(declare-fun bm!68688 () Bool)

(declare-fun call!68691 () Bool)

(assert (=> bm!68688 (= call!68691 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1541822 () Bool)

(declare-fun e!857628 () Bool)

(declare-fun e!857627 () Bool)

(assert (=> b!1541822 (= e!857628 e!857627)))

(declare-fun c!141305 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541822 (= c!141305 (validKeyInArray!0 (select (arr!49468 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1541824 () Bool)

(declare-fun e!857629 () Bool)

(assert (=> b!1541824 (= e!857627 e!857629)))

(declare-fun lt!665721 () (_ BitVec 64))

(assert (=> b!1541824 (= lt!665721 (select (arr!49468 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51490 0))(
  ( (Unit!51491) )
))
(declare-fun lt!665722 () Unit!51490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102528 (_ BitVec 64) (_ BitVec 32)) Unit!51490)

(assert (=> b!1541824 (= lt!665722 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665721 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541824 (arrayContainsKey!0 _keys!618 lt!665721 #b00000000000000000000000000000000)))

(declare-fun lt!665720 () Unit!51490)

(assert (=> b!1541824 (= lt!665720 lt!665722)))

(declare-fun res!1058169 () Bool)

(declare-datatypes ((SeekEntryResult!13510 0))(
  ( (MissingZero!13510 (index!56438 (_ BitVec 32))) (Found!13510 (index!56439 (_ BitVec 32))) (Intermediate!13510 (undefined!14322 Bool) (index!56440 (_ BitVec 32)) (x!138382 (_ BitVec 32))) (Undefined!13510) (MissingVacant!13510 (index!56441 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102528 (_ BitVec 32)) SeekEntryResult!13510)

(assert (=> b!1541824 (= res!1058169 (= (seekEntryOrOpen!0 (select (arr!49468 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13510 #b00000000000000000000000000000000)))))

(assert (=> b!1541824 (=> (not res!1058169) (not e!857629))))

(declare-fun b!1541825 () Bool)

(assert (=> b!1541825 (= e!857629 call!68691)))

(declare-fun d!160715 () Bool)

(declare-fun res!1058170 () Bool)

(assert (=> d!160715 (=> res!1058170 e!857628)))

(assert (=> d!160715 (= res!1058170 (bvsge #b00000000000000000000000000000000 (size!50018 _keys!618)))))

(assert (=> d!160715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857628)))

(declare-fun b!1541823 () Bool)

(assert (=> b!1541823 (= e!857627 call!68691)))

(assert (= (and d!160715 (not res!1058170)) b!1541822))

(assert (= (and b!1541822 c!141305) b!1541824))

(assert (= (and b!1541822 (not c!141305)) b!1541823))

(assert (= (and b!1541824 res!1058169) b!1541825))

(assert (= (or b!1541825 b!1541823) bm!68688))

(declare-fun m!1423671 () Bool)

(assert (=> bm!68688 m!1423671))

(declare-fun m!1423673 () Bool)

(assert (=> b!1541822 m!1423673))

(assert (=> b!1541822 m!1423673))

(declare-fun m!1423675 () Bool)

(assert (=> b!1541822 m!1423675))

(assert (=> b!1541824 m!1423673))

(declare-fun m!1423677 () Bool)

(assert (=> b!1541824 m!1423677))

(declare-fun m!1423679 () Bool)

(assert (=> b!1541824 m!1423679))

(assert (=> b!1541824 m!1423673))

(declare-fun m!1423681 () Bool)

(assert (=> b!1541824 m!1423681))

(assert (=> b!1541789 d!160715))

(declare-fun d!160717 () Bool)

(declare-fun res!1058175 () Bool)

(declare-fun e!857634 () Bool)

(assert (=> d!160717 (=> res!1058175 e!857634)))

(assert (=> d!160717 (= res!1058175 ((_ is Nil!35850) Nil!35850))))

(assert (=> d!160717 (= (noDuplicate!2636 Nil!35850) e!857634)))

(declare-fun b!1541830 () Bool)

(declare-fun e!857635 () Bool)

(assert (=> b!1541830 (= e!857634 e!857635)))

(declare-fun res!1058176 () Bool)

(assert (=> b!1541830 (=> (not res!1058176) (not e!857635))))

(declare-fun contains!10022 (List!35853 (_ BitVec 64)) Bool)

(assert (=> b!1541830 (= res!1058176 (not (contains!10022 (t!50547 Nil!35850) (h!37294 Nil!35850))))))

(declare-fun b!1541831 () Bool)

(assert (=> b!1541831 (= e!857635 (noDuplicate!2636 (t!50547 Nil!35850)))))

(assert (= (and d!160717 (not res!1058175)) b!1541830))

(assert (= (and b!1541830 res!1058176) b!1541831))

(declare-fun m!1423683 () Bool)

(assert (=> b!1541830 m!1423683))

(declare-fun m!1423685 () Bool)

(assert (=> b!1541831 m!1423685))

(assert (=> b!1541791 d!160717))

(declare-fun d!160719 () Bool)

(assert (=> d!160719 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131636 d!160719))

(declare-fun d!160721 () Bool)

(assert (=> d!160721 (= (array_inv!38489 _values!470) (bvsge (size!50017 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131636 d!160721))

(declare-fun d!160723 () Bool)

(assert (=> d!160723 (= (array_inv!38490 _keys!618) (bvsge (size!50018 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131636 d!160723))

(declare-fun mapIsEmpty!58174 () Bool)

(declare-fun mapRes!58174 () Bool)

(assert (=> mapIsEmpty!58174 mapRes!58174))

(declare-fun mapNonEmpty!58174 () Bool)

(declare-fun tp!110701 () Bool)

(declare-fun e!857641 () Bool)

(assert (=> mapNonEmpty!58174 (= mapRes!58174 (and tp!110701 e!857641))))

(declare-fun mapRest!58174 () (Array (_ BitVec 32) ValueCell!17913))

(declare-fun mapValue!58174 () ValueCell!17913)

(declare-fun mapKey!58174 () (_ BitVec 32))

(assert (=> mapNonEmpty!58174 (= mapRest!58168 (store mapRest!58174 mapKey!58174 mapValue!58174))))

(declare-fun condMapEmpty!58174 () Bool)

(declare-fun mapDefault!58174 () ValueCell!17913)

(assert (=> mapNonEmpty!58168 (= condMapEmpty!58174 (= mapRest!58168 ((as const (Array (_ BitVec 32) ValueCell!17913)) mapDefault!58174)))))

(declare-fun e!857640 () Bool)

(assert (=> mapNonEmpty!58168 (= tp!110695 (and e!857640 mapRes!58174))))

(declare-fun b!1541839 () Bool)

(assert (=> b!1541839 (= e!857640 tp_is_empty!37647)))

(declare-fun b!1541838 () Bool)

(assert (=> b!1541838 (= e!857641 tp_is_empty!37647)))

(assert (= (and mapNonEmpty!58168 condMapEmpty!58174) mapIsEmpty!58174))

(assert (= (and mapNonEmpty!58168 (not condMapEmpty!58174)) mapNonEmpty!58174))

(assert (= (and mapNonEmpty!58174 ((_ is ValueCellFull!17913) mapValue!58174)) b!1541838))

(assert (= (and mapNonEmpty!58168 ((_ is ValueCellFull!17913) mapDefault!58174)) b!1541839))

(declare-fun m!1423687 () Bool)

(assert (=> mapNonEmpty!58174 m!1423687))

(check-sat tp_is_empty!37647 (not b!1541822) (not b!1541824) (not b!1541831) (not mapNonEmpty!58174) (not bm!68688) (not b!1541830))
(check-sat)
