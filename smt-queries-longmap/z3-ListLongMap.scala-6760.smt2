; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84808 () Bool)

(assert start!84808)

(declare-fun b!991328 () Bool)

(declare-fun e!559085 () Bool)

(declare-datatypes ((array!62568 0))(
  ( (array!62569 (arr!30132 (Array (_ BitVec 32) (_ BitVec 64))) (size!30613 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62568)

(assert (=> b!991328 (= e!559085 (and (bvsle #b00000000000000000000000000000000 (size!30613 _keys!1945)) (bvsge (size!30613 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!991329 () Bool)

(declare-fun res!662692 () Bool)

(assert (=> b!991329 (=> (not res!662692) (not e!559085))))

(declare-datatypes ((V!36097 0))(
  ( (V!36098 (val!11718 Int)) )
))
(declare-datatypes ((ValueCell!11186 0))(
  ( (ValueCellFull!11186 (v!14293 V!36097)) (EmptyCell!11186) )
))
(declare-datatypes ((array!62570 0))(
  ( (array!62571 (arr!30133 (Array (_ BitVec 32) ValueCell!11186)) (size!30614 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62570)

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(assert (=> b!991329 (= res!662692 (and (= (size!30614 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30613 _keys!1945) (size!30614 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun res!662693 () Bool)

(assert (=> start!84808 (=> (not res!662693) (not e!559085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84808 (= res!662693 (validMask!0 mask!2471))))

(assert (=> start!84808 e!559085))

(assert (=> start!84808 true))

(declare-fun e!559086 () Bool)

(declare-fun array_inv!23287 (array!62570) Bool)

(assert (=> start!84808 (and (array_inv!23287 _values!1551) e!559086)))

(declare-fun array_inv!23288 (array!62568) Bool)

(assert (=> start!84808 (array_inv!23288 _keys!1945)))

(declare-fun b!991330 () Bool)

(declare-fun e!559082 () Bool)

(declare-fun tp_is_empty!23335 () Bool)

(assert (=> b!991330 (= e!559082 tp_is_empty!23335)))

(declare-fun b!991331 () Bool)

(declare-fun res!662691 () Bool)

(assert (=> b!991331 (=> (not res!662691) (not e!559085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62568 (_ BitVec 32)) Bool)

(assert (=> b!991331 (= res!662691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991332 () Bool)

(declare-fun e!559083 () Bool)

(declare-fun mapRes!37065 () Bool)

(assert (=> b!991332 (= e!559086 (and e!559083 mapRes!37065))))

(declare-fun condMapEmpty!37065 () Bool)

(declare-fun mapDefault!37065 () ValueCell!11186)

(assert (=> b!991332 (= condMapEmpty!37065 (= (arr!30133 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11186)) mapDefault!37065)))))

(declare-fun mapNonEmpty!37065 () Bool)

(declare-fun tp!70137 () Bool)

(assert (=> mapNonEmpty!37065 (= mapRes!37065 (and tp!70137 e!559082))))

(declare-fun mapKey!37065 () (_ BitVec 32))

(declare-fun mapValue!37065 () ValueCell!11186)

(declare-fun mapRest!37065 () (Array (_ BitVec 32) ValueCell!11186))

(assert (=> mapNonEmpty!37065 (= (arr!30133 _values!1551) (store mapRest!37065 mapKey!37065 mapValue!37065))))

(declare-fun b!991333 () Bool)

(assert (=> b!991333 (= e!559083 tp_is_empty!23335)))

(declare-fun mapIsEmpty!37065 () Bool)

(assert (=> mapIsEmpty!37065 mapRes!37065))

(assert (= (and start!84808 res!662693) b!991329))

(assert (= (and b!991329 res!662692) b!991331))

(assert (= (and b!991331 res!662691) b!991328))

(assert (= (and b!991332 condMapEmpty!37065) mapIsEmpty!37065))

(assert (= (and b!991332 (not condMapEmpty!37065)) mapNonEmpty!37065))

(get-info :version)

(assert (= (and mapNonEmpty!37065 ((_ is ValueCellFull!11186) mapValue!37065)) b!991330))

(assert (= (and b!991332 ((_ is ValueCellFull!11186) mapDefault!37065)) b!991333))

(assert (= start!84808 b!991332))

(declare-fun m!918709 () Bool)

(assert (=> start!84808 m!918709))

(declare-fun m!918711 () Bool)

(assert (=> start!84808 m!918711))

(declare-fun m!918713 () Bool)

(assert (=> start!84808 m!918713))

(declare-fun m!918715 () Bool)

(assert (=> b!991331 m!918715))

(declare-fun m!918717 () Bool)

(assert (=> mapNonEmpty!37065 m!918717))

(check-sat (not b!991331) (not start!84808) (not mapNonEmpty!37065) tp_is_empty!23335)
(check-sat)
(get-model)

(declare-fun b!991378 () Bool)

(declare-fun e!559125 () Bool)

(declare-fun e!559124 () Bool)

(assert (=> b!991378 (= e!559125 e!559124)))

(declare-fun c!100565 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991378 (= c!100565 (validKeyInArray!0 (select (arr!30132 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42050 () Bool)

(declare-fun call!42053 () Bool)

(assert (=> bm!42050 (= call!42053 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!991379 () Bool)

(declare-fun e!559123 () Bool)

(assert (=> b!991379 (= e!559124 e!559123)))

(declare-fun lt!439763 () (_ BitVec 64))

(assert (=> b!991379 (= lt!439763 (select (arr!30132 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32769 0))(
  ( (Unit!32770) )
))
(declare-fun lt!439765 () Unit!32769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62568 (_ BitVec 64) (_ BitVec 32)) Unit!32769)

(assert (=> b!991379 (= lt!439765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!439763 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991379 (arrayContainsKey!0 _keys!1945 lt!439763 #b00000000000000000000000000000000)))

(declare-fun lt!439764 () Unit!32769)

(assert (=> b!991379 (= lt!439764 lt!439765)))

(declare-fun res!662716 () Bool)

(declare-datatypes ((SeekEntryResult!9210 0))(
  ( (MissingZero!9210 (index!39211 (_ BitVec 32))) (Found!9210 (index!39212 (_ BitVec 32))) (Intermediate!9210 (undefined!10022 Bool) (index!39213 (_ BitVec 32)) (x!86266 (_ BitVec 32))) (Undefined!9210) (MissingVacant!9210 (index!39214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62568 (_ BitVec 32)) SeekEntryResult!9210)

(assert (=> b!991379 (= res!662716 (= (seekEntryOrOpen!0 (select (arr!30132 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9210 #b00000000000000000000000000000000)))))

(assert (=> b!991379 (=> (not res!662716) (not e!559123))))

(declare-fun d!117759 () Bool)

(declare-fun res!662717 () Bool)

(assert (=> d!117759 (=> res!662717 e!559125)))

(assert (=> d!117759 (= res!662717 (bvsge #b00000000000000000000000000000000 (size!30613 _keys!1945)))))

(assert (=> d!117759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559125)))

(declare-fun b!991380 () Bool)

(assert (=> b!991380 (= e!559124 call!42053)))

(declare-fun b!991381 () Bool)

(assert (=> b!991381 (= e!559123 call!42053)))

(assert (= (and d!117759 (not res!662717)) b!991378))

(assert (= (and b!991378 c!100565) b!991379))

(assert (= (and b!991378 (not c!100565)) b!991380))

(assert (= (and b!991379 res!662716) b!991381))

(assert (= (or b!991381 b!991380) bm!42050))

(declare-fun m!918739 () Bool)

(assert (=> b!991378 m!918739))

(assert (=> b!991378 m!918739))

(declare-fun m!918741 () Bool)

(assert (=> b!991378 m!918741))

(declare-fun m!918743 () Bool)

(assert (=> bm!42050 m!918743))

(assert (=> b!991379 m!918739))

(declare-fun m!918745 () Bool)

(assert (=> b!991379 m!918745))

(declare-fun m!918747 () Bool)

(assert (=> b!991379 m!918747))

(assert (=> b!991379 m!918739))

(declare-fun m!918749 () Bool)

(assert (=> b!991379 m!918749))

(assert (=> b!991331 d!117759))

(declare-fun d!117761 () Bool)

(assert (=> d!117761 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84808 d!117761))

(declare-fun d!117763 () Bool)

(assert (=> d!117763 (= (array_inv!23287 _values!1551) (bvsge (size!30614 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84808 d!117763))

(declare-fun d!117765 () Bool)

(assert (=> d!117765 (= (array_inv!23288 _keys!1945) (bvsge (size!30613 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84808 d!117765))

(declare-fun mapNonEmpty!37074 () Bool)

(declare-fun mapRes!37074 () Bool)

(declare-fun tp!70146 () Bool)

(declare-fun e!559131 () Bool)

(assert (=> mapNonEmpty!37074 (= mapRes!37074 (and tp!70146 e!559131))))

(declare-fun mapRest!37074 () (Array (_ BitVec 32) ValueCell!11186))

(declare-fun mapKey!37074 () (_ BitVec 32))

(declare-fun mapValue!37074 () ValueCell!11186)

(assert (=> mapNonEmpty!37074 (= mapRest!37065 (store mapRest!37074 mapKey!37074 mapValue!37074))))

(declare-fun b!991389 () Bool)

(declare-fun e!559130 () Bool)

(assert (=> b!991389 (= e!559130 tp_is_empty!23335)))

(declare-fun condMapEmpty!37074 () Bool)

(declare-fun mapDefault!37074 () ValueCell!11186)

(assert (=> mapNonEmpty!37065 (= condMapEmpty!37074 (= mapRest!37065 ((as const (Array (_ BitVec 32) ValueCell!11186)) mapDefault!37074)))))

(assert (=> mapNonEmpty!37065 (= tp!70137 (and e!559130 mapRes!37074))))

(declare-fun b!991388 () Bool)

(assert (=> b!991388 (= e!559131 tp_is_empty!23335)))

(declare-fun mapIsEmpty!37074 () Bool)

(assert (=> mapIsEmpty!37074 mapRes!37074))

(assert (= (and mapNonEmpty!37065 condMapEmpty!37074) mapIsEmpty!37074))

(assert (= (and mapNonEmpty!37065 (not condMapEmpty!37074)) mapNonEmpty!37074))

(assert (= (and mapNonEmpty!37074 ((_ is ValueCellFull!11186) mapValue!37074)) b!991388))

(assert (= (and mapNonEmpty!37065 ((_ is ValueCellFull!11186) mapDefault!37074)) b!991389))

(declare-fun m!918751 () Bool)

(assert (=> mapNonEmpty!37074 m!918751))

(check-sat (not bm!42050) (not b!991378) tp_is_empty!23335 (not mapNonEmpty!37074) (not b!991379))
(check-sat)
