; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84994 () Bool)

(assert start!84994)

(declare-fun mapNonEmpty!37065 () Bool)

(declare-fun mapRes!37065 () Bool)

(declare-fun tp!70137 () Bool)

(declare-fun e!559814 () Bool)

(assert (=> mapNonEmpty!37065 (= mapRes!37065 (and tp!70137 e!559814))))

(declare-datatypes ((V!36097 0))(
  ( (V!36098 (val!11718 Int)) )
))
(declare-datatypes ((ValueCell!11186 0))(
  ( (ValueCellFull!11186 (v!14291 V!36097)) (EmptyCell!11186) )
))
(declare-fun mapRest!37065 () (Array (_ BitVec 32) ValueCell!11186))

(declare-fun mapValue!37065 () ValueCell!11186)

(declare-fun mapKey!37065 () (_ BitVec 32))

(declare-datatypes ((array!62682 0))(
  ( (array!62683 (arr!30184 (Array (_ BitVec 32) ValueCell!11186)) (size!30664 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62682)

(assert (=> mapNonEmpty!37065 (= (arr!30184 _values!1551) (store mapRest!37065 mapKey!37065 mapValue!37065))))

(declare-fun b!992470 () Bool)

(declare-fun res!663145 () Bool)

(declare-fun e!559812 () Bool)

(assert (=> b!992470 (=> (not res!663145) (not e!559812))))

(declare-datatypes ((array!62684 0))(
  ( (array!62685 (arr!30185 (Array (_ BitVec 32) (_ BitVec 64))) (size!30665 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62684)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62684 (_ BitVec 32)) Bool)

(assert (=> b!992470 (= res!663145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992471 () Bool)

(declare-fun e!559816 () Bool)

(declare-fun e!559813 () Bool)

(assert (=> b!992471 (= e!559816 (and e!559813 mapRes!37065))))

(declare-fun condMapEmpty!37065 () Bool)

(declare-fun mapDefault!37065 () ValueCell!11186)

(assert (=> b!992471 (= condMapEmpty!37065 (= (arr!30184 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11186)) mapDefault!37065)))))

(declare-fun mapIsEmpty!37065 () Bool)

(assert (=> mapIsEmpty!37065 mapRes!37065))

(declare-fun b!992472 () Bool)

(declare-fun tp_is_empty!23335 () Bool)

(assert (=> b!992472 (= e!559813 tp_is_empty!23335)))

(declare-fun b!992473 () Bool)

(assert (=> b!992473 (= e!559814 tp_is_empty!23335)))

(declare-fun res!663147 () Bool)

(assert (=> start!84994 (=> (not res!663147) (not e!559812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84994 (= res!663147 (validMask!0 mask!2471))))

(assert (=> start!84994 e!559812))

(assert (=> start!84994 true))

(declare-fun array_inv!23335 (array!62682) Bool)

(assert (=> start!84994 (and (array_inv!23335 _values!1551) e!559816)))

(declare-fun array_inv!23336 (array!62684) Bool)

(assert (=> start!84994 (array_inv!23336 _keys!1945)))

(declare-fun b!992474 () Bool)

(assert (=> b!992474 (= e!559812 (and (bvsle #b00000000000000000000000000000000 (size!30665 _keys!1945)) (bvsge (size!30665 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!992475 () Bool)

(declare-fun res!663146 () Bool)

(assert (=> b!992475 (=> (not res!663146) (not e!559812))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992475 (= res!663146 (and (= (size!30664 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30665 _keys!1945) (size!30664 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(assert (= (and start!84994 res!663147) b!992475))

(assert (= (and b!992475 res!663146) b!992470))

(assert (= (and b!992470 res!663145) b!992474))

(assert (= (and b!992471 condMapEmpty!37065) mapIsEmpty!37065))

(assert (= (and b!992471 (not condMapEmpty!37065)) mapNonEmpty!37065))

(get-info :version)

(assert (= (and mapNonEmpty!37065 ((_ is ValueCellFull!11186) mapValue!37065)) b!992473))

(assert (= (and b!992471 ((_ is ValueCellFull!11186) mapDefault!37065)) b!992472))

(assert (= start!84994 b!992471))

(declare-fun m!920761 () Bool)

(assert (=> mapNonEmpty!37065 m!920761))

(declare-fun m!920763 () Bool)

(assert (=> b!992470 m!920763))

(declare-fun m!920765 () Bool)

(assert (=> start!84994 m!920765))

(declare-fun m!920767 () Bool)

(assert (=> start!84994 m!920767))

(declare-fun m!920769 () Bool)

(assert (=> start!84994 m!920769))

(check-sat (not b!992470) (not start!84994) (not mapNonEmpty!37065) tp_is_empty!23335)
(check-sat)
(get-model)

(declare-fun bm!42121 () Bool)

(declare-fun call!42124 () Bool)

(assert (=> bm!42121 (= call!42124 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!992520 () Bool)

(declare-fun e!559854 () Bool)

(assert (=> b!992520 (= e!559854 call!42124)))

(declare-fun d!118279 () Bool)

(declare-fun res!663170 () Bool)

(declare-fun e!559853 () Bool)

(assert (=> d!118279 (=> res!663170 e!559853)))

(assert (=> d!118279 (= res!663170 (bvsge #b00000000000000000000000000000000 (size!30665 _keys!1945)))))

(assert (=> d!118279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559853)))

(declare-fun b!992521 () Bool)

(declare-fun e!559855 () Bool)

(assert (=> b!992521 (= e!559855 call!42124)))

(declare-fun b!992522 () Bool)

(assert (=> b!992522 (= e!559853 e!559854)))

(declare-fun c!100912 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992522 (= c!100912 (validKeyInArray!0 (select (arr!30185 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!992523 () Bool)

(assert (=> b!992523 (= e!559854 e!559855)))

(declare-fun lt!440362 () (_ BitVec 64))

(assert (=> b!992523 (= lt!440362 (select (arr!30185 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32885 0))(
  ( (Unit!32886) )
))
(declare-fun lt!440361 () Unit!32885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62684 (_ BitVec 64) (_ BitVec 32)) Unit!32885)

(assert (=> b!992523 (= lt!440361 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440362 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!992523 (arrayContainsKey!0 _keys!1945 lt!440362 #b00000000000000000000000000000000)))

(declare-fun lt!440360 () Unit!32885)

(assert (=> b!992523 (= lt!440360 lt!440361)))

(declare-fun res!663171 () Bool)

(declare-datatypes ((SeekEntryResult!9170 0))(
  ( (MissingZero!9170 (index!39051 (_ BitVec 32))) (Found!9170 (index!39052 (_ BitVec 32))) (Intermediate!9170 (undefined!9982 Bool) (index!39053 (_ BitVec 32)) (x!86245 (_ BitVec 32))) (Undefined!9170) (MissingVacant!9170 (index!39054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62684 (_ BitVec 32)) SeekEntryResult!9170)

(assert (=> b!992523 (= res!663171 (= (seekEntryOrOpen!0 (select (arr!30185 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9170 #b00000000000000000000000000000000)))))

(assert (=> b!992523 (=> (not res!663171) (not e!559855))))

(assert (= (and d!118279 (not res!663170)) b!992522))

(assert (= (and b!992522 c!100912) b!992523))

(assert (= (and b!992522 (not c!100912)) b!992520))

(assert (= (and b!992523 res!663171) b!992521))

(assert (= (or b!992521 b!992520) bm!42121))

(declare-fun m!920791 () Bool)

(assert (=> bm!42121 m!920791))

(declare-fun m!920793 () Bool)

(assert (=> b!992522 m!920793))

(assert (=> b!992522 m!920793))

(declare-fun m!920795 () Bool)

(assert (=> b!992522 m!920795))

(assert (=> b!992523 m!920793))

(declare-fun m!920797 () Bool)

(assert (=> b!992523 m!920797))

(declare-fun m!920799 () Bool)

(assert (=> b!992523 m!920799))

(assert (=> b!992523 m!920793))

(declare-fun m!920801 () Bool)

(assert (=> b!992523 m!920801))

(assert (=> b!992470 d!118279))

(declare-fun d!118281 () Bool)

(assert (=> d!118281 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84994 d!118281))

(declare-fun d!118283 () Bool)

(assert (=> d!118283 (= (array_inv!23335 _values!1551) (bvsge (size!30664 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84994 d!118283))

(declare-fun d!118285 () Bool)

(assert (=> d!118285 (= (array_inv!23336 _keys!1945) (bvsge (size!30665 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84994 d!118285))

(declare-fun b!992531 () Bool)

(declare-fun e!559861 () Bool)

(assert (=> b!992531 (= e!559861 tp_is_empty!23335)))

(declare-fun condMapEmpty!37074 () Bool)

(declare-fun mapDefault!37074 () ValueCell!11186)

(assert (=> mapNonEmpty!37065 (= condMapEmpty!37074 (= mapRest!37065 ((as const (Array (_ BitVec 32) ValueCell!11186)) mapDefault!37074)))))

(declare-fun mapRes!37074 () Bool)

(assert (=> mapNonEmpty!37065 (= tp!70137 (and e!559861 mapRes!37074))))

(declare-fun mapIsEmpty!37074 () Bool)

(assert (=> mapIsEmpty!37074 mapRes!37074))

(declare-fun mapNonEmpty!37074 () Bool)

(declare-fun tp!70146 () Bool)

(declare-fun e!559860 () Bool)

(assert (=> mapNonEmpty!37074 (= mapRes!37074 (and tp!70146 e!559860))))

(declare-fun mapKey!37074 () (_ BitVec 32))

(declare-fun mapRest!37074 () (Array (_ BitVec 32) ValueCell!11186))

(declare-fun mapValue!37074 () ValueCell!11186)

(assert (=> mapNonEmpty!37074 (= mapRest!37065 (store mapRest!37074 mapKey!37074 mapValue!37074))))

(declare-fun b!992530 () Bool)

(assert (=> b!992530 (= e!559860 tp_is_empty!23335)))

(assert (= (and mapNonEmpty!37065 condMapEmpty!37074) mapIsEmpty!37074))

(assert (= (and mapNonEmpty!37065 (not condMapEmpty!37074)) mapNonEmpty!37074))

(assert (= (and mapNonEmpty!37074 ((_ is ValueCellFull!11186) mapValue!37074)) b!992530))

(assert (= (and mapNonEmpty!37065 ((_ is ValueCellFull!11186) mapDefault!37074)) b!992531))

(declare-fun m!920803 () Bool)

(assert (=> mapNonEmpty!37074 m!920803))

(check-sat (not b!992522) tp_is_empty!23335 (not b!992523) (not bm!42121) (not mapNonEmpty!37074))
(check-sat)
