; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108160 () Bool)

(assert start!108160)

(declare-fun b!1276629 () Bool)

(declare-fun e!728864 () Bool)

(declare-fun e!728863 () Bool)

(declare-fun mapRes!51386 () Bool)

(assert (=> b!1276629 (= e!728864 (and e!728863 mapRes!51386))))

(declare-fun condMapEmpty!51386 () Bool)

(declare-datatypes ((V!49433 0))(
  ( (V!49434 (val!16698 Int)) )
))
(declare-datatypes ((ValueCell!15725 0))(
  ( (ValueCellFull!15725 (v!19289 V!49433)) (EmptyCell!15725) )
))
(declare-datatypes ((array!83617 0))(
  ( (array!83618 (arr!40320 (Array (_ BitVec 32) ValueCell!15725)) (size!40871 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83617)

(declare-fun mapDefault!51386 () ValueCell!15725)

(assert (=> b!1276629 (= condMapEmpty!51386 (= (arr!40320 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15725)) mapDefault!51386)))))

(declare-fun mapNonEmpty!51386 () Bool)

(declare-fun tp!98144 () Bool)

(declare-fun e!728867 () Bool)

(assert (=> mapNonEmpty!51386 (= mapRes!51386 (and tp!98144 e!728867))))

(declare-fun mapValue!51386 () ValueCell!15725)

(declare-fun mapRest!51386 () (Array (_ BitVec 32) ValueCell!15725))

(declare-fun mapKey!51386 () (_ BitVec 32))

(assert (=> mapNonEmpty!51386 (= (arr!40320 _values!1187) (store mapRest!51386 mapKey!51386 mapValue!51386))))

(declare-fun res!848215 () Bool)

(declare-fun e!728865 () Bool)

(assert (=> start!108160 (=> (not res!848215) (not e!728865))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108160 (= res!848215 (validMask!0 mask!1805))))

(assert (=> start!108160 e!728865))

(assert (=> start!108160 true))

(declare-fun array_inv!30829 (array!83617) Bool)

(assert (=> start!108160 (and (array_inv!30829 _values!1187) e!728864)))

(declare-datatypes ((array!83619 0))(
  ( (array!83620 (arr!40321 (Array (_ BitVec 32) (_ BitVec 64))) (size!40872 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83619)

(declare-fun array_inv!30830 (array!83619) Bool)

(assert (=> start!108160 (array_inv!30830 _keys!1427)))

(declare-fun b!1276630 () Bool)

(declare-fun res!848216 () Bool)

(assert (=> b!1276630 (=> (not res!848216) (not e!728865))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276630 (= res!848216 (and (= (size!40871 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40872 _keys!1427) (size!40871 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276631 () Bool)

(assert (=> b!1276631 (= e!728865 (bvsgt #b00000000000000000000000000000000 (size!40872 _keys!1427)))))

(declare-fun b!1276632 () Bool)

(declare-fun tp_is_empty!33247 () Bool)

(assert (=> b!1276632 (= e!728863 tp_is_empty!33247)))

(declare-fun b!1276633 () Bool)

(assert (=> b!1276633 (= e!728867 tp_is_empty!33247)))

(declare-fun mapIsEmpty!51386 () Bool)

(assert (=> mapIsEmpty!51386 mapRes!51386))

(declare-fun b!1276634 () Bool)

(declare-fun res!848214 () Bool)

(assert (=> b!1276634 (=> (not res!848214) (not e!728865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83619 (_ BitVec 32)) Bool)

(assert (=> b!1276634 (= res!848214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108160 res!848215) b!1276630))

(assert (= (and b!1276630 res!848216) b!1276634))

(assert (= (and b!1276634 res!848214) b!1276631))

(assert (= (and b!1276629 condMapEmpty!51386) mapIsEmpty!51386))

(assert (= (and b!1276629 (not condMapEmpty!51386)) mapNonEmpty!51386))

(get-info :version)

(assert (= (and mapNonEmpty!51386 ((_ is ValueCellFull!15725) mapValue!51386)) b!1276633))

(assert (= (and b!1276629 ((_ is ValueCellFull!15725) mapDefault!51386)) b!1276632))

(assert (= start!108160 b!1276629))

(declare-fun m!1173229 () Bool)

(assert (=> mapNonEmpty!51386 m!1173229))

(declare-fun m!1173231 () Bool)

(assert (=> start!108160 m!1173231))

(declare-fun m!1173233 () Bool)

(assert (=> start!108160 m!1173233))

(declare-fun m!1173235 () Bool)

(assert (=> start!108160 m!1173235))

(declare-fun m!1173237 () Bool)

(assert (=> b!1276634 m!1173237))

(check-sat (not b!1276634) (not start!108160) (not mapNonEmpty!51386) tp_is_empty!33247)
(check-sat)
(get-model)

(declare-fun b!1276679 () Bool)

(declare-fun e!728904 () Bool)

(declare-fun e!728906 () Bool)

(assert (=> b!1276679 (= e!728904 e!728906)))

(declare-fun c!124318 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1276679 (= c!124318 (validKeyInArray!0 (select (arr!40321 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1276680 () Bool)

(declare-fun call!62700 () Bool)

(assert (=> b!1276680 (= e!728906 call!62700)))

(declare-fun b!1276681 () Bool)

(declare-fun e!728905 () Bool)

(assert (=> b!1276681 (= e!728906 e!728905)))

(declare-fun lt!575824 () (_ BitVec 64))

(assert (=> b!1276681 (= lt!575824 (select (arr!40321 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42322 0))(
  ( (Unit!42323) )
))
(declare-fun lt!575823 () Unit!42322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83619 (_ BitVec 64) (_ BitVec 32)) Unit!42322)

(assert (=> b!1276681 (= lt!575823 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575824 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276681 (arrayContainsKey!0 _keys!1427 lt!575824 #b00000000000000000000000000000000)))

(declare-fun lt!575822 () Unit!42322)

(assert (=> b!1276681 (= lt!575822 lt!575823)))

(declare-fun res!848239 () Bool)

(declare-datatypes ((SeekEntryResult!9957 0))(
  ( (MissingZero!9957 (index!42199 (_ BitVec 32))) (Found!9957 (index!42200 (_ BitVec 32))) (Intermediate!9957 (undefined!10769 Bool) (index!42201 (_ BitVec 32)) (x!112924 (_ BitVec 32))) (Undefined!9957) (MissingVacant!9957 (index!42202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83619 (_ BitVec 32)) SeekEntryResult!9957)

(assert (=> b!1276681 (= res!848239 (= (seekEntryOrOpen!0 (select (arr!40321 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9957 #b00000000000000000000000000000000)))))

(assert (=> b!1276681 (=> (not res!848239) (not e!728905))))

(declare-fun d!140795 () Bool)

(declare-fun res!848240 () Bool)

(assert (=> d!140795 (=> res!848240 e!728904)))

(assert (=> d!140795 (= res!848240 (bvsge #b00000000000000000000000000000000 (size!40872 _keys!1427)))))

(assert (=> d!140795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728904)))

(declare-fun b!1276682 () Bool)

(assert (=> b!1276682 (= e!728905 call!62700)))

(declare-fun bm!62697 () Bool)

(assert (=> bm!62697 (= call!62700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(assert (= (and d!140795 (not res!848240)) b!1276679))

(assert (= (and b!1276679 c!124318) b!1276681))

(assert (= (and b!1276679 (not c!124318)) b!1276680))

(assert (= (and b!1276681 res!848239) b!1276682))

(assert (= (or b!1276682 b!1276680) bm!62697))

(declare-fun m!1173259 () Bool)

(assert (=> b!1276679 m!1173259))

(assert (=> b!1276679 m!1173259))

(declare-fun m!1173261 () Bool)

(assert (=> b!1276679 m!1173261))

(assert (=> b!1276681 m!1173259))

(declare-fun m!1173263 () Bool)

(assert (=> b!1276681 m!1173263))

(declare-fun m!1173265 () Bool)

(assert (=> b!1276681 m!1173265))

(assert (=> b!1276681 m!1173259))

(declare-fun m!1173267 () Bool)

(assert (=> b!1276681 m!1173267))

(declare-fun m!1173269 () Bool)

(assert (=> bm!62697 m!1173269))

(assert (=> b!1276634 d!140795))

(declare-fun d!140797 () Bool)

(assert (=> d!140797 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108160 d!140797))

(declare-fun d!140799 () Bool)

(assert (=> d!140799 (= (array_inv!30829 _values!1187) (bvsge (size!40871 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108160 d!140799))

(declare-fun d!140801 () Bool)

(assert (=> d!140801 (= (array_inv!30830 _keys!1427) (bvsge (size!40872 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108160 d!140801))

(declare-fun mapIsEmpty!51395 () Bool)

(declare-fun mapRes!51395 () Bool)

(assert (=> mapIsEmpty!51395 mapRes!51395))

(declare-fun condMapEmpty!51395 () Bool)

(declare-fun mapDefault!51395 () ValueCell!15725)

(assert (=> mapNonEmpty!51386 (= condMapEmpty!51395 (= mapRest!51386 ((as const (Array (_ BitVec 32) ValueCell!15725)) mapDefault!51395)))))

(declare-fun e!728912 () Bool)

(assert (=> mapNonEmpty!51386 (= tp!98144 (and e!728912 mapRes!51395))))

(declare-fun b!1276690 () Bool)

(assert (=> b!1276690 (= e!728912 tp_is_empty!33247)))

(declare-fun mapNonEmpty!51395 () Bool)

(declare-fun tp!98153 () Bool)

(declare-fun e!728911 () Bool)

(assert (=> mapNonEmpty!51395 (= mapRes!51395 (and tp!98153 e!728911))))

(declare-fun mapRest!51395 () (Array (_ BitVec 32) ValueCell!15725))

(declare-fun mapKey!51395 () (_ BitVec 32))

(declare-fun mapValue!51395 () ValueCell!15725)

(assert (=> mapNonEmpty!51395 (= mapRest!51386 (store mapRest!51395 mapKey!51395 mapValue!51395))))

(declare-fun b!1276689 () Bool)

(assert (=> b!1276689 (= e!728911 tp_is_empty!33247)))

(assert (= (and mapNonEmpty!51386 condMapEmpty!51395) mapIsEmpty!51395))

(assert (= (and mapNonEmpty!51386 (not condMapEmpty!51395)) mapNonEmpty!51395))

(assert (= (and mapNonEmpty!51395 ((_ is ValueCellFull!15725) mapValue!51395)) b!1276689))

(assert (= (and mapNonEmpty!51386 ((_ is ValueCellFull!15725) mapDefault!51395)) b!1276690))

(declare-fun m!1173271 () Bool)

(assert (=> mapNonEmpty!51395 m!1173271))

(check-sat (not b!1276681) (not mapNonEmpty!51395) (not b!1276679) tp_is_empty!33247 (not bm!62697))
(check-sat)
