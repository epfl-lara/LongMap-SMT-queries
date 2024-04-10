; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131652 () Bool)

(assert start!131652)

(declare-fun b!1541885 () Bool)

(declare-fun res!1058212 () Bool)

(declare-fun e!857675 () Bool)

(assert (=> b!1541885 (=> (not res!1058212) (not e!857675))))

(declare-datatypes ((array!102538 0))(
  ( (array!102539 (arr!49472 (Array (_ BitVec 32) (_ BitVec 64))) (size!50022 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102538)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102538 (_ BitVec 32)) Bool)

(assert (=> b!1541885 (= res!1058212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58180 () Bool)

(declare-fun mapRes!58180 () Bool)

(declare-fun tp!110707 () Bool)

(declare-fun e!857673 () Bool)

(assert (=> mapNonEmpty!58180 (= mapRes!58180 (and tp!110707 e!857673))))

(declare-datatypes ((V!58647 0))(
  ( (V!58648 (val!18904 Int)) )
))
(declare-datatypes ((ValueCell!17916 0))(
  ( (ValueCellFull!17916 (v!21704 V!58647)) (EmptyCell!17916) )
))
(declare-fun mapRest!58180 () (Array (_ BitVec 32) ValueCell!17916))

(declare-fun mapValue!58180 () ValueCell!17916)

(declare-datatypes ((array!102540 0))(
  ( (array!102541 (arr!49473 (Array (_ BitVec 32) ValueCell!17916)) (size!50023 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102540)

(declare-fun mapKey!58180 () (_ BitVec 32))

(assert (=> mapNonEmpty!58180 (= (arr!49473 _values!470) (store mapRest!58180 mapKey!58180 mapValue!58180))))

(declare-fun b!1541886 () Bool)

(declare-fun e!857676 () Bool)

(assert (=> b!1541886 (= e!857675 e!857676)))

(declare-fun res!1058210 () Bool)

(assert (=> b!1541886 (=> res!1058210 e!857676)))

(declare-datatypes ((List!35855 0))(
  ( (Nil!35852) (Cons!35851 (h!37296 (_ BitVec 64)) (t!50549 List!35855)) )
))
(declare-fun contains!10024 (List!35855 (_ BitVec 64)) Bool)

(assert (=> b!1541886 (= res!1058210 (contains!10024 Nil!35852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541887 () Bool)

(assert (=> b!1541887 (= e!857676 (contains!10024 Nil!35852 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541888 () Bool)

(declare-fun e!857672 () Bool)

(declare-fun e!857677 () Bool)

(assert (=> b!1541888 (= e!857672 (and e!857677 mapRes!58180))))

(declare-fun condMapEmpty!58180 () Bool)

(declare-fun mapDefault!58180 () ValueCell!17916)

(assert (=> b!1541888 (= condMapEmpty!58180 (= (arr!49473 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17916)) mapDefault!58180)))))

(declare-fun b!1541889 () Bool)

(declare-fun tp_is_empty!37653 () Bool)

(assert (=> b!1541889 (= e!857677 tp_is_empty!37653)))

(declare-fun mapIsEmpty!58180 () Bool)

(assert (=> mapIsEmpty!58180 mapRes!58180))

(declare-fun res!1058209 () Bool)

(assert (=> start!131652 (=> (not res!1058209) (not e!857675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131652 (= res!1058209 (validMask!0 mask!926))))

(assert (=> start!131652 e!857675))

(assert (=> start!131652 true))

(declare-fun array_inv!38493 (array!102540) Bool)

(assert (=> start!131652 (and (array_inv!38493 _values!470) e!857672)))

(declare-fun array_inv!38494 (array!102538) Bool)

(assert (=> start!131652 (array_inv!38494 _keys!618)))

(declare-fun b!1541890 () Bool)

(declare-fun res!1058208 () Bool)

(assert (=> b!1541890 (=> (not res!1058208) (not e!857675))))

(declare-fun noDuplicate!2638 (List!35855) Bool)

(assert (=> b!1541890 (= res!1058208 (noDuplicate!2638 Nil!35852))))

(declare-fun b!1541891 () Bool)

(declare-fun res!1058207 () Bool)

(assert (=> b!1541891 (=> (not res!1058207) (not e!857675))))

(assert (=> b!1541891 (= res!1058207 (and (bvsle #b00000000000000000000000000000000 (size!50022 _keys!618)) (bvslt (size!50022 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541892 () Bool)

(assert (=> b!1541892 (= e!857673 tp_is_empty!37653)))

(declare-fun b!1541893 () Bool)

(declare-fun res!1058211 () Bool)

(assert (=> b!1541893 (=> (not res!1058211) (not e!857675))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541893 (= res!1058211 (and (= (size!50023 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50022 _keys!618) (size!50023 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131652 res!1058209) b!1541893))

(assert (= (and b!1541893 res!1058211) b!1541885))

(assert (= (and b!1541885 res!1058212) b!1541891))

(assert (= (and b!1541891 res!1058207) b!1541890))

(assert (= (and b!1541890 res!1058208) b!1541886))

(assert (= (and b!1541886 (not res!1058210)) b!1541887))

(assert (= (and b!1541888 condMapEmpty!58180) mapIsEmpty!58180))

(assert (= (and b!1541888 (not condMapEmpty!58180)) mapNonEmpty!58180))

(get-info :version)

(assert (= (and mapNonEmpty!58180 ((_ is ValueCellFull!17916) mapValue!58180)) b!1541892))

(assert (= (and b!1541888 ((_ is ValueCellFull!17916) mapDefault!58180)) b!1541889))

(assert (= start!131652 b!1541888))

(declare-fun m!1423705 () Bool)

(assert (=> b!1541885 m!1423705))

(declare-fun m!1423707 () Bool)

(assert (=> start!131652 m!1423707))

(declare-fun m!1423709 () Bool)

(assert (=> start!131652 m!1423709))

(declare-fun m!1423711 () Bool)

(assert (=> start!131652 m!1423711))

(declare-fun m!1423713 () Bool)

(assert (=> b!1541890 m!1423713))

(declare-fun m!1423715 () Bool)

(assert (=> b!1541887 m!1423715))

(declare-fun m!1423717 () Bool)

(assert (=> mapNonEmpty!58180 m!1423717))

(declare-fun m!1423719 () Bool)

(assert (=> b!1541886 m!1423719))

(check-sat (not mapNonEmpty!58180) tp_is_empty!37653 (not b!1541890) (not b!1541887) (not b!1541886) (not b!1541885) (not start!131652))
(check-sat)
(get-model)

(declare-fun bm!68691 () Bool)

(declare-fun call!68694 () Bool)

(assert (=> bm!68691 (= call!68694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1541929 () Bool)

(declare-fun e!857704 () Bool)

(assert (=> b!1541929 (= e!857704 call!68694)))

(declare-fun d!160727 () Bool)

(declare-fun res!1058236 () Bool)

(declare-fun e!857702 () Bool)

(assert (=> d!160727 (=> res!1058236 e!857702)))

(assert (=> d!160727 (= res!1058236 (bvsge #b00000000000000000000000000000000 (size!50022 _keys!618)))))

(assert (=> d!160727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857702)))

(declare-fun b!1541930 () Bool)

(declare-fun e!857703 () Bool)

(assert (=> b!1541930 (= e!857703 call!68694)))

(declare-fun b!1541931 () Bool)

(assert (=> b!1541931 (= e!857703 e!857704)))

(declare-fun lt!665731 () (_ BitVec 64))

(assert (=> b!1541931 (= lt!665731 (select (arr!49472 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51492 0))(
  ( (Unit!51493) )
))
(declare-fun lt!665729 () Unit!51492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102538 (_ BitVec 64) (_ BitVec 32)) Unit!51492)

(assert (=> b!1541931 (= lt!665729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665731 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541931 (arrayContainsKey!0 _keys!618 lt!665731 #b00000000000000000000000000000000)))

(declare-fun lt!665730 () Unit!51492)

(assert (=> b!1541931 (= lt!665730 lt!665729)))

(declare-fun res!1058235 () Bool)

(declare-datatypes ((SeekEntryResult!13511 0))(
  ( (MissingZero!13511 (index!56442 (_ BitVec 32))) (Found!13511 (index!56443 (_ BitVec 32))) (Intermediate!13511 (undefined!14323 Bool) (index!56444 (_ BitVec 32)) (x!138393 (_ BitVec 32))) (Undefined!13511) (MissingVacant!13511 (index!56445 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102538 (_ BitVec 32)) SeekEntryResult!13511)

(assert (=> b!1541931 (= res!1058235 (= (seekEntryOrOpen!0 (select (arr!49472 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13511 #b00000000000000000000000000000000)))))

(assert (=> b!1541931 (=> (not res!1058235) (not e!857704))))

(declare-fun b!1541932 () Bool)

(assert (=> b!1541932 (= e!857702 e!857703)))

(declare-fun c!141308 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541932 (= c!141308 (validKeyInArray!0 (select (arr!49472 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160727 (not res!1058236)) b!1541932))

(assert (= (and b!1541932 c!141308) b!1541931))

(assert (= (and b!1541932 (not c!141308)) b!1541930))

(assert (= (and b!1541931 res!1058235) b!1541929))

(assert (= (or b!1541929 b!1541930) bm!68691))

(declare-fun m!1423737 () Bool)

(assert (=> bm!68691 m!1423737))

(declare-fun m!1423739 () Bool)

(assert (=> b!1541931 m!1423739))

(declare-fun m!1423741 () Bool)

(assert (=> b!1541931 m!1423741))

(declare-fun m!1423743 () Bool)

(assert (=> b!1541931 m!1423743))

(assert (=> b!1541931 m!1423739))

(declare-fun m!1423745 () Bool)

(assert (=> b!1541931 m!1423745))

(assert (=> b!1541932 m!1423739))

(assert (=> b!1541932 m!1423739))

(declare-fun m!1423747 () Bool)

(assert (=> b!1541932 m!1423747))

(assert (=> b!1541885 d!160727))

(declare-fun d!160729 () Bool)

(declare-fun lt!665734 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!793 (List!35855) (InoxSet (_ BitVec 64)))

(assert (=> d!160729 (= lt!665734 (select (content!793 Nil!35852) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857709 () Bool)

(assert (=> d!160729 (= lt!665734 e!857709)))

(declare-fun res!1058241 () Bool)

(assert (=> d!160729 (=> (not res!1058241) (not e!857709))))

(assert (=> d!160729 (= res!1058241 ((_ is Cons!35851) Nil!35852))))

(assert (=> d!160729 (= (contains!10024 Nil!35852 #b0000000000000000000000000000000000000000000000000000000000000000) lt!665734)))

(declare-fun b!1541937 () Bool)

(declare-fun e!857710 () Bool)

(assert (=> b!1541937 (= e!857709 e!857710)))

(declare-fun res!1058242 () Bool)

(assert (=> b!1541937 (=> res!1058242 e!857710)))

(assert (=> b!1541937 (= res!1058242 (= (h!37296 Nil!35852) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541938 () Bool)

(assert (=> b!1541938 (= e!857710 (contains!10024 (t!50549 Nil!35852) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160729 res!1058241) b!1541937))

(assert (= (and b!1541937 (not res!1058242)) b!1541938))

(declare-fun m!1423749 () Bool)

(assert (=> d!160729 m!1423749))

(declare-fun m!1423751 () Bool)

(assert (=> d!160729 m!1423751))

(declare-fun m!1423753 () Bool)

(assert (=> b!1541938 m!1423753))

(assert (=> b!1541886 d!160729))

(declare-fun d!160731 () Bool)

(declare-fun res!1058247 () Bool)

(declare-fun e!857715 () Bool)

(assert (=> d!160731 (=> res!1058247 e!857715)))

(assert (=> d!160731 (= res!1058247 ((_ is Nil!35852) Nil!35852))))

(assert (=> d!160731 (= (noDuplicate!2638 Nil!35852) e!857715)))

(declare-fun b!1541943 () Bool)

(declare-fun e!857716 () Bool)

(assert (=> b!1541943 (= e!857715 e!857716)))

(declare-fun res!1058248 () Bool)

(assert (=> b!1541943 (=> (not res!1058248) (not e!857716))))

(assert (=> b!1541943 (= res!1058248 (not (contains!10024 (t!50549 Nil!35852) (h!37296 Nil!35852))))))

(declare-fun b!1541944 () Bool)

(assert (=> b!1541944 (= e!857716 (noDuplicate!2638 (t!50549 Nil!35852)))))

(assert (= (and d!160731 (not res!1058247)) b!1541943))

(assert (= (and b!1541943 res!1058248) b!1541944))

(declare-fun m!1423755 () Bool)

(assert (=> b!1541943 m!1423755))

(declare-fun m!1423757 () Bool)

(assert (=> b!1541944 m!1423757))

(assert (=> b!1541890 d!160731))

(declare-fun d!160733 () Bool)

(assert (=> d!160733 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131652 d!160733))

(declare-fun d!160735 () Bool)

(assert (=> d!160735 (= (array_inv!38493 _values!470) (bvsge (size!50023 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131652 d!160735))

(declare-fun d!160737 () Bool)

(assert (=> d!160737 (= (array_inv!38494 _keys!618) (bvsge (size!50022 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131652 d!160737))

(declare-fun d!160739 () Bool)

(declare-fun lt!665735 () Bool)

(assert (=> d!160739 (= lt!665735 (select (content!793 Nil!35852) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!857717 () Bool)

(assert (=> d!160739 (= lt!665735 e!857717)))

(declare-fun res!1058249 () Bool)

(assert (=> d!160739 (=> (not res!1058249) (not e!857717))))

(assert (=> d!160739 (= res!1058249 ((_ is Cons!35851) Nil!35852))))

(assert (=> d!160739 (= (contains!10024 Nil!35852 #b1000000000000000000000000000000000000000000000000000000000000000) lt!665735)))

(declare-fun b!1541945 () Bool)

(declare-fun e!857718 () Bool)

(assert (=> b!1541945 (= e!857717 e!857718)))

(declare-fun res!1058250 () Bool)

(assert (=> b!1541945 (=> res!1058250 e!857718)))

(assert (=> b!1541945 (= res!1058250 (= (h!37296 Nil!35852) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541946 () Bool)

(assert (=> b!1541946 (= e!857718 (contains!10024 (t!50549 Nil!35852) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160739 res!1058249) b!1541945))

(assert (= (and b!1541945 (not res!1058250)) b!1541946))

(assert (=> d!160739 m!1423749))

(declare-fun m!1423759 () Bool)

(assert (=> d!160739 m!1423759))

(declare-fun m!1423761 () Bool)

(assert (=> b!1541946 m!1423761))

(assert (=> b!1541887 d!160739))

(declare-fun condMapEmpty!58186 () Bool)

(declare-fun mapDefault!58186 () ValueCell!17916)

(assert (=> mapNonEmpty!58180 (= condMapEmpty!58186 (= mapRest!58180 ((as const (Array (_ BitVec 32) ValueCell!17916)) mapDefault!58186)))))

(declare-fun e!857723 () Bool)

(declare-fun mapRes!58186 () Bool)

(assert (=> mapNonEmpty!58180 (= tp!110707 (and e!857723 mapRes!58186))))

(declare-fun b!1541953 () Bool)

(declare-fun e!857724 () Bool)

(assert (=> b!1541953 (= e!857724 tp_is_empty!37653)))

(declare-fun mapNonEmpty!58186 () Bool)

(declare-fun tp!110713 () Bool)

(assert (=> mapNonEmpty!58186 (= mapRes!58186 (and tp!110713 e!857724))))

(declare-fun mapKey!58186 () (_ BitVec 32))

(declare-fun mapRest!58186 () (Array (_ BitVec 32) ValueCell!17916))

(declare-fun mapValue!58186 () ValueCell!17916)

(assert (=> mapNonEmpty!58186 (= mapRest!58180 (store mapRest!58186 mapKey!58186 mapValue!58186))))

(declare-fun mapIsEmpty!58186 () Bool)

(assert (=> mapIsEmpty!58186 mapRes!58186))

(declare-fun b!1541954 () Bool)

(assert (=> b!1541954 (= e!857723 tp_is_empty!37653)))

(assert (= (and mapNonEmpty!58180 condMapEmpty!58186) mapIsEmpty!58186))

(assert (= (and mapNonEmpty!58180 (not condMapEmpty!58186)) mapNonEmpty!58186))

(assert (= (and mapNonEmpty!58186 ((_ is ValueCellFull!17916) mapValue!58186)) b!1541953))

(assert (= (and mapNonEmpty!58180 ((_ is ValueCellFull!17916) mapDefault!58186)) b!1541954))

(declare-fun m!1423763 () Bool)

(assert (=> mapNonEmpty!58186 m!1423763))

(check-sat (not b!1541944) (not b!1541931) (not mapNonEmpty!58186) (not b!1541938) (not bm!68691) tp_is_empty!37653 (not b!1541932) (not b!1541943) (not d!160729) (not b!1541946) (not d!160739))
(check-sat)
