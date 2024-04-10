; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112904 () Bool)

(assert start!112904)

(declare-fun mapIsEmpty!57184 () Bool)

(declare-fun mapRes!57184 () Bool)

(assert (=> mapIsEmpty!57184 mapRes!57184))

(declare-fun b!1338715 () Bool)

(declare-fun res!888184 () Bool)

(declare-fun e!762335 () Bool)

(assert (=> b!1338715 (=> (not res!888184) (not e!762335))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90844 0))(
  ( (array!90845 (arr!43882 (Array (_ BitVec 32) (_ BitVec 64))) (size!44432 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90844)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54427 0))(
  ( (V!54428 (val!18571 Int)) )
))
(declare-datatypes ((ValueCell!17598 0))(
  ( (ValueCellFull!17598 (v!21218 V!54427)) (EmptyCell!17598) )
))
(declare-datatypes ((array!90846 0))(
  ( (array!90847 (arr!43883 (Array (_ BitVec 32) ValueCell!17598)) (size!44433 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90846)

(assert (=> b!1338715 (= res!888184 (and (= (size!44433 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44432 _keys!1571) (size!44433 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338716 () Bool)

(declare-fun res!888183 () Bool)

(assert (=> b!1338716 (=> (not res!888183) (not e!762335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90844 (_ BitVec 32)) Bool)

(assert (=> b!1338716 (= res!888183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338717 () Bool)

(declare-fun e!762338 () Bool)

(declare-fun tp_is_empty!36993 () Bool)

(assert (=> b!1338717 (= e!762338 tp_is_empty!36993)))

(declare-fun b!1338718 () Bool)

(declare-fun e!762337 () Bool)

(declare-fun e!762336 () Bool)

(assert (=> b!1338718 (= e!762337 (and e!762336 mapRes!57184))))

(declare-fun condMapEmpty!57184 () Bool)

(declare-fun mapDefault!57184 () ValueCell!17598)

(assert (=> b!1338718 (= condMapEmpty!57184 (= (arr!43883 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17598)) mapDefault!57184)))))

(declare-fun b!1338719 () Bool)

(assert (=> b!1338719 (= e!762336 tp_is_empty!36993)))

(declare-fun b!1338720 () Bool)

(assert (=> b!1338720 (= e!762335 (bvsgt #b00000000000000000000000000000000 (size!44432 _keys!1571)))))

(declare-fun mapNonEmpty!57184 () Bool)

(declare-fun tp!108883 () Bool)

(assert (=> mapNonEmpty!57184 (= mapRes!57184 (and tp!108883 e!762338))))

(declare-fun mapValue!57184 () ValueCell!17598)

(declare-fun mapRest!57184 () (Array (_ BitVec 32) ValueCell!17598))

(declare-fun mapKey!57184 () (_ BitVec 32))

(assert (=> mapNonEmpty!57184 (= (arr!43883 _values!1303) (store mapRest!57184 mapKey!57184 mapValue!57184))))

(declare-fun res!888182 () Bool)

(assert (=> start!112904 (=> (not res!888182) (not e!762335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112904 (= res!888182 (validMask!0 mask!1977))))

(assert (=> start!112904 e!762335))

(assert (=> start!112904 true))

(declare-fun array_inv!33091 (array!90846) Bool)

(assert (=> start!112904 (and (array_inv!33091 _values!1303) e!762337)))

(declare-fun array_inv!33092 (array!90844) Bool)

(assert (=> start!112904 (array_inv!33092 _keys!1571)))

(assert (= (and start!112904 res!888182) b!1338715))

(assert (= (and b!1338715 res!888184) b!1338716))

(assert (= (and b!1338716 res!888183) b!1338720))

(assert (= (and b!1338718 condMapEmpty!57184) mapIsEmpty!57184))

(assert (= (and b!1338718 (not condMapEmpty!57184)) mapNonEmpty!57184))

(get-info :version)

(assert (= (and mapNonEmpty!57184 ((_ is ValueCellFull!17598) mapValue!57184)) b!1338717))

(assert (= (and b!1338718 ((_ is ValueCellFull!17598) mapDefault!57184)) b!1338719))

(assert (= start!112904 b!1338718))

(declare-fun m!1227033 () Bool)

(assert (=> b!1338716 m!1227033))

(declare-fun m!1227035 () Bool)

(assert (=> mapNonEmpty!57184 m!1227035))

(declare-fun m!1227037 () Bool)

(assert (=> start!112904 m!1227037))

(declare-fun m!1227039 () Bool)

(assert (=> start!112904 m!1227039))

(declare-fun m!1227041 () Bool)

(assert (=> start!112904 m!1227041))

(check-sat (not b!1338716) (not start!112904) (not mapNonEmpty!57184) tp_is_empty!36993)
(check-sat)
(get-model)

(declare-fun b!1338748 () Bool)

(declare-fun e!762361 () Bool)

(declare-fun e!762363 () Bool)

(assert (=> b!1338748 (= e!762361 e!762363)))

(declare-fun lt!593792 () (_ BitVec 64))

(assert (=> b!1338748 (= lt!593792 (select (arr!43882 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43983 0))(
  ( (Unit!43984) )
))
(declare-fun lt!593791 () Unit!43983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90844 (_ BitVec 64) (_ BitVec 32)) Unit!43983)

(assert (=> b!1338748 (= lt!593791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593792 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338748 (arrayContainsKey!0 _keys!1571 lt!593792 #b00000000000000000000000000000000)))

(declare-fun lt!593790 () Unit!43983)

(assert (=> b!1338748 (= lt!593790 lt!593791)))

(declare-fun res!888199 () Bool)

(declare-datatypes ((SeekEntryResult!10052 0))(
  ( (MissingZero!10052 (index!42579 (_ BitVec 32))) (Found!10052 (index!42580 (_ BitVec 32))) (Intermediate!10052 (undefined!10864 Bool) (index!42581 (_ BitVec 32)) (x!119579 (_ BitVec 32))) (Undefined!10052) (MissingVacant!10052 (index!42582 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90844 (_ BitVec 32)) SeekEntryResult!10052)

(assert (=> b!1338748 (= res!888199 (= (seekEntryOrOpen!0 (select (arr!43882 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10052 #b00000000000000000000000000000000)))))

(assert (=> b!1338748 (=> (not res!888199) (not e!762363))))

(declare-fun b!1338749 () Bool)

(declare-fun call!65028 () Bool)

(assert (=> b!1338749 (= e!762363 call!65028)))

(declare-fun b!1338750 () Bool)

(assert (=> b!1338750 (= e!762361 call!65028)))

(declare-fun bm!65025 () Bool)

(assert (=> bm!65025 (= call!65028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!144081 () Bool)

(declare-fun res!888198 () Bool)

(declare-fun e!762362 () Bool)

(assert (=> d!144081 (=> res!888198 e!762362)))

(assert (=> d!144081 (= res!888198 (bvsge #b00000000000000000000000000000000 (size!44432 _keys!1571)))))

(assert (=> d!144081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762362)))

(declare-fun b!1338747 () Bool)

(assert (=> b!1338747 (= e!762362 e!762361)))

(declare-fun c!126289 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338747 (= c!126289 (validKeyInArray!0 (select (arr!43882 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144081 (not res!888198)) b!1338747))

(assert (= (and b!1338747 c!126289) b!1338748))

(assert (= (and b!1338747 (not c!126289)) b!1338750))

(assert (= (and b!1338748 res!888199) b!1338749))

(assert (= (or b!1338749 b!1338750) bm!65025))

(declare-fun m!1227053 () Bool)

(assert (=> b!1338748 m!1227053))

(declare-fun m!1227055 () Bool)

(assert (=> b!1338748 m!1227055))

(declare-fun m!1227057 () Bool)

(assert (=> b!1338748 m!1227057))

(assert (=> b!1338748 m!1227053))

(declare-fun m!1227059 () Bool)

(assert (=> b!1338748 m!1227059))

(declare-fun m!1227061 () Bool)

(assert (=> bm!65025 m!1227061))

(assert (=> b!1338747 m!1227053))

(assert (=> b!1338747 m!1227053))

(declare-fun m!1227063 () Bool)

(assert (=> b!1338747 m!1227063))

(assert (=> b!1338716 d!144081))

(declare-fun d!144083 () Bool)

(assert (=> d!144083 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112904 d!144083))

(declare-fun d!144085 () Bool)

(assert (=> d!144085 (= (array_inv!33091 _values!1303) (bvsge (size!44433 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112904 d!144085))

(declare-fun d!144087 () Bool)

(assert (=> d!144087 (= (array_inv!33092 _keys!1571) (bvsge (size!44432 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112904 d!144087))

(declare-fun mapIsEmpty!57190 () Bool)

(declare-fun mapRes!57190 () Bool)

(assert (=> mapIsEmpty!57190 mapRes!57190))

(declare-fun condMapEmpty!57190 () Bool)

(declare-fun mapDefault!57190 () ValueCell!17598)

(assert (=> mapNonEmpty!57184 (= condMapEmpty!57190 (= mapRest!57184 ((as const (Array (_ BitVec 32) ValueCell!17598)) mapDefault!57190)))))

(declare-fun e!762368 () Bool)

(assert (=> mapNonEmpty!57184 (= tp!108883 (and e!762368 mapRes!57190))))

(declare-fun b!1338757 () Bool)

(declare-fun e!762369 () Bool)

(assert (=> b!1338757 (= e!762369 tp_is_empty!36993)))

(declare-fun b!1338758 () Bool)

(assert (=> b!1338758 (= e!762368 tp_is_empty!36993)))

(declare-fun mapNonEmpty!57190 () Bool)

(declare-fun tp!108889 () Bool)

(assert (=> mapNonEmpty!57190 (= mapRes!57190 (and tp!108889 e!762369))))

(declare-fun mapKey!57190 () (_ BitVec 32))

(declare-fun mapValue!57190 () ValueCell!17598)

(declare-fun mapRest!57190 () (Array (_ BitVec 32) ValueCell!17598))

(assert (=> mapNonEmpty!57190 (= mapRest!57184 (store mapRest!57190 mapKey!57190 mapValue!57190))))

(assert (= (and mapNonEmpty!57184 condMapEmpty!57190) mapIsEmpty!57190))

(assert (= (and mapNonEmpty!57184 (not condMapEmpty!57190)) mapNonEmpty!57190))

(assert (= (and mapNonEmpty!57190 ((_ is ValueCellFull!17598) mapValue!57190)) b!1338757))

(assert (= (and mapNonEmpty!57184 ((_ is ValueCellFull!17598) mapDefault!57190)) b!1338758))

(declare-fun m!1227065 () Bool)

(assert (=> mapNonEmpty!57190 m!1227065))

(check-sat (not bm!65025) (not b!1338748) (not mapNonEmpty!57190) (not b!1338747) tp_is_empty!36993)
(check-sat)
