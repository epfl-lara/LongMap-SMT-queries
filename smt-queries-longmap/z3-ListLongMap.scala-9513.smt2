; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113126 () Bool)

(assert start!113126)

(declare-fun mapNonEmpty!57181 () Bool)

(declare-fun mapRes!57181 () Bool)

(declare-fun tp!108880 () Bool)

(declare-fun e!763164 () Bool)

(assert (=> mapNonEmpty!57181 (= mapRes!57181 (and tp!108880 e!763164))))

(declare-fun mapKey!57181 () (_ BitVec 32))

(declare-datatypes ((V!54425 0))(
  ( (V!54426 (val!18570 Int)) )
))
(declare-datatypes ((ValueCell!17597 0))(
  ( (ValueCellFull!17597 (v!21212 V!54425)) (EmptyCell!17597) )
))
(declare-fun mapRest!57181 () (Array (_ BitVec 32) ValueCell!17597))

(declare-fun mapValue!57181 () ValueCell!17597)

(declare-datatypes ((array!90963 0))(
  ( (array!90964 (arr!43937 (Array (_ BitVec 32) ValueCell!17597)) (size!44488 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90963)

(assert (=> mapNonEmpty!57181 (= (arr!43937 _values!1303) (store mapRest!57181 mapKey!57181 mapValue!57181))))

(declare-fun mapIsEmpty!57181 () Bool)

(assert (=> mapIsEmpty!57181 mapRes!57181))

(declare-fun b!1339996 () Bool)

(declare-fun e!763167 () Bool)

(declare-fun tp_is_empty!36991 () Bool)

(assert (=> b!1339996 (= e!763167 tp_is_empty!36991)))

(declare-fun b!1339997 () Bool)

(declare-fun e!763165 () Bool)

(assert (=> b!1339997 (= e!763165 (and e!763167 mapRes!57181))))

(declare-fun condMapEmpty!57181 () Bool)

(declare-fun mapDefault!57181 () ValueCell!17597)

(assert (=> b!1339997 (= condMapEmpty!57181 (= (arr!43937 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17597)) mapDefault!57181)))))

(declare-fun b!1339999 () Bool)

(assert (=> b!1339999 (= e!763164 tp_is_empty!36991)))

(declare-fun b!1340000 () Bool)

(declare-fun res!888692 () Bool)

(declare-fun e!763166 () Bool)

(assert (=> b!1340000 (=> (not res!888692) (not e!763166))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90965 0))(
  ( (array!90966 (arr!43938 (Array (_ BitVec 32) (_ BitVec 64))) (size!44489 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90965)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340000 (= res!888692 (and (= (size!44488 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44489 _keys!1571) (size!44488 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340001 () Bool)

(declare-fun res!888691 () Bool)

(assert (=> b!1340001 (=> (not res!888691) (not e!763166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90965 (_ BitVec 32)) Bool)

(assert (=> b!1340001 (= res!888691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339998 () Bool)

(assert (=> b!1339998 (= e!763166 (bvsgt #b00000000000000000000000000000000 (size!44489 _keys!1571)))))

(declare-fun res!888693 () Bool)

(assert (=> start!113126 (=> (not res!888693) (not e!763166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113126 (= res!888693 (validMask!0 mask!1977))))

(assert (=> start!113126 e!763166))

(assert (=> start!113126 true))

(declare-fun array_inv!33399 (array!90963) Bool)

(assert (=> start!113126 (and (array_inv!33399 _values!1303) e!763165)))

(declare-fun array_inv!33400 (array!90965) Bool)

(assert (=> start!113126 (array_inv!33400 _keys!1571)))

(assert (= (and start!113126 res!888693) b!1340000))

(assert (= (and b!1340000 res!888692) b!1340001))

(assert (= (and b!1340001 res!888691) b!1339998))

(assert (= (and b!1339997 condMapEmpty!57181) mapIsEmpty!57181))

(assert (= (and b!1339997 (not condMapEmpty!57181)) mapNonEmpty!57181))

(get-info :version)

(assert (= (and mapNonEmpty!57181 ((_ is ValueCellFull!17597) mapValue!57181)) b!1339999))

(assert (= (and b!1339997 ((_ is ValueCellFull!17597) mapDefault!57181)) b!1339996))

(assert (= start!113126 b!1339997))

(declare-fun m!1228621 () Bool)

(assert (=> mapNonEmpty!57181 m!1228621))

(declare-fun m!1228623 () Bool)

(assert (=> b!1340001 m!1228623))

(declare-fun m!1228625 () Bool)

(assert (=> start!113126 m!1228625))

(declare-fun m!1228627 () Bool)

(assert (=> start!113126 m!1228627))

(declare-fun m!1228629 () Bool)

(assert (=> start!113126 m!1228629))

(check-sat (not b!1340001) (not start!113126) (not mapNonEmpty!57181) tp_is_empty!36991)
(check-sat)
(get-model)

(declare-fun b!1340047 () Bool)

(declare-fun e!763206 () Bool)

(declare-fun e!763204 () Bool)

(assert (=> b!1340047 (= e!763206 e!763204)))

(declare-fun c!126687 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340047 (= c!126687 (validKeyInArray!0 (select (arr!43938 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1340048 () Bool)

(declare-fun e!763205 () Bool)

(declare-fun call!65093 () Bool)

(assert (=> b!1340048 (= e!763205 call!65093)))

(declare-fun d!144525 () Bool)

(declare-fun res!888716 () Bool)

(assert (=> d!144525 (=> res!888716 e!763206)))

(assert (=> d!144525 (= res!888716 (bvsge #b00000000000000000000000000000000 (size!44489 _keys!1571)))))

(assert (=> d!144525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!763206)))

(declare-fun b!1340046 () Bool)

(assert (=> b!1340046 (= e!763204 call!65093)))

(declare-fun b!1340049 () Bool)

(assert (=> b!1340049 (= e!763204 e!763205)))

(declare-fun lt!594266 () (_ BitVec 64))

(assert (=> b!1340049 (= lt!594266 (select (arr!43938 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43920 0))(
  ( (Unit!43921) )
))
(declare-fun lt!594267 () Unit!43920)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90965 (_ BitVec 64) (_ BitVec 32)) Unit!43920)

(assert (=> b!1340049 (= lt!594267 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!594266 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1340049 (arrayContainsKey!0 _keys!1571 lt!594266 #b00000000000000000000000000000000)))

(declare-fun lt!594268 () Unit!43920)

(assert (=> b!1340049 (= lt!594268 lt!594267)))

(declare-fun res!888717 () Bool)

(declare-datatypes ((SeekEntryResult!10008 0))(
  ( (MissingZero!10008 (index!42403 (_ BitVec 32))) (Found!10008 (index!42404 (_ BitVec 32))) (Intermediate!10008 (undefined!10820 Bool) (index!42405 (_ BitVec 32)) (x!119557 (_ BitVec 32))) (Undefined!10008) (MissingVacant!10008 (index!42406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90965 (_ BitVec 32)) SeekEntryResult!10008)

(assert (=> b!1340049 (= res!888717 (= (seekEntryOrOpen!0 (select (arr!43938 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10008 #b00000000000000000000000000000000)))))

(assert (=> b!1340049 (=> (not res!888717) (not e!763205))))

(declare-fun bm!65090 () Bool)

(assert (=> bm!65090 (= call!65093 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!144525 (not res!888716)) b!1340047))

(assert (= (and b!1340047 c!126687) b!1340049))

(assert (= (and b!1340047 (not c!126687)) b!1340046))

(assert (= (and b!1340049 res!888717) b!1340048))

(assert (= (or b!1340048 b!1340046) bm!65090))

(declare-fun m!1228651 () Bool)

(assert (=> b!1340047 m!1228651))

(assert (=> b!1340047 m!1228651))

(declare-fun m!1228653 () Bool)

(assert (=> b!1340047 m!1228653))

(assert (=> b!1340049 m!1228651))

(declare-fun m!1228655 () Bool)

(assert (=> b!1340049 m!1228655))

(declare-fun m!1228657 () Bool)

(assert (=> b!1340049 m!1228657))

(assert (=> b!1340049 m!1228651))

(declare-fun m!1228659 () Bool)

(assert (=> b!1340049 m!1228659))

(declare-fun m!1228661 () Bool)

(assert (=> bm!65090 m!1228661))

(assert (=> b!1340001 d!144525))

(declare-fun d!144527 () Bool)

(assert (=> d!144527 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113126 d!144527))

(declare-fun d!144529 () Bool)

(assert (=> d!144529 (= (array_inv!33399 _values!1303) (bvsge (size!44488 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113126 d!144529))

(declare-fun d!144531 () Bool)

(assert (=> d!144531 (= (array_inv!33400 _keys!1571) (bvsge (size!44489 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113126 d!144531))

(declare-fun mapNonEmpty!57190 () Bool)

(declare-fun mapRes!57190 () Bool)

(declare-fun tp!108889 () Bool)

(declare-fun e!763211 () Bool)

(assert (=> mapNonEmpty!57190 (= mapRes!57190 (and tp!108889 e!763211))))

(declare-fun mapValue!57190 () ValueCell!17597)

(declare-fun mapKey!57190 () (_ BitVec 32))

(declare-fun mapRest!57190 () (Array (_ BitVec 32) ValueCell!17597))

(assert (=> mapNonEmpty!57190 (= mapRest!57181 (store mapRest!57190 mapKey!57190 mapValue!57190))))

(declare-fun condMapEmpty!57190 () Bool)

(declare-fun mapDefault!57190 () ValueCell!17597)

(assert (=> mapNonEmpty!57181 (= condMapEmpty!57190 (= mapRest!57181 ((as const (Array (_ BitVec 32) ValueCell!17597)) mapDefault!57190)))))

(declare-fun e!763212 () Bool)

(assert (=> mapNonEmpty!57181 (= tp!108880 (and e!763212 mapRes!57190))))

(declare-fun mapIsEmpty!57190 () Bool)

(assert (=> mapIsEmpty!57190 mapRes!57190))

(declare-fun b!1340056 () Bool)

(assert (=> b!1340056 (= e!763211 tp_is_empty!36991)))

(declare-fun b!1340057 () Bool)

(assert (=> b!1340057 (= e!763212 tp_is_empty!36991)))

(assert (= (and mapNonEmpty!57181 condMapEmpty!57190) mapIsEmpty!57190))

(assert (= (and mapNonEmpty!57181 (not condMapEmpty!57190)) mapNonEmpty!57190))

(assert (= (and mapNonEmpty!57190 ((_ is ValueCellFull!17597) mapValue!57190)) b!1340056))

(assert (= (and mapNonEmpty!57181 ((_ is ValueCellFull!17597) mapDefault!57190)) b!1340057))

(declare-fun m!1228663 () Bool)

(assert (=> mapNonEmpty!57190 m!1228663))

(check-sat (not b!1340049) tp_is_empty!36991 (not mapNonEmpty!57190) (not b!1340047) (not bm!65090))
(check-sat)
