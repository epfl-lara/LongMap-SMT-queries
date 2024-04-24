; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113154 () Bool)

(assert start!113154)

(declare-fun b!1340146 () Bool)

(declare-fun res!888762 () Bool)

(declare-fun e!763283 () Bool)

(assert (=> b!1340146 (=> (not res!888762) (not e!763283))))

(declare-datatypes ((array!90989 0))(
  ( (array!90990 (arr!43948 (Array (_ BitVec 32) (_ BitVec 64))) (size!44499 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90989)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90989 (_ BitVec 32)) Bool)

(assert (=> b!1340146 (= res!888762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340147 () Bool)

(declare-fun e!763287 () Bool)

(declare-fun e!763286 () Bool)

(declare-fun mapRes!57205 () Bool)

(assert (=> b!1340147 (= e!763287 (and e!763286 mapRes!57205))))

(declare-fun condMapEmpty!57205 () Bool)

(declare-datatypes ((V!54441 0))(
  ( (V!54442 (val!18576 Int)) )
))
(declare-datatypes ((ValueCell!17603 0))(
  ( (ValueCellFull!17603 (v!21218 V!54441)) (EmptyCell!17603) )
))
(declare-datatypes ((array!90991 0))(
  ( (array!90992 (arr!43949 (Array (_ BitVec 32) ValueCell!17603)) (size!44500 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90991)

(declare-fun mapDefault!57205 () ValueCell!17603)

(assert (=> b!1340147 (= condMapEmpty!57205 (= (arr!43949 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17603)) mapDefault!57205)))))

(declare-fun b!1340149 () Bool)

(declare-datatypes ((List!31137 0))(
  ( (Nil!31134) (Cons!31133 (h!32351 (_ BitVec 64)) (t!45461 List!31137)) )
))
(declare-fun noDuplicate!2087 (List!31137) Bool)

(assert (=> b!1340149 (= e!763283 (not (noDuplicate!2087 Nil!31134)))))

(declare-fun b!1340150 () Bool)

(declare-fun res!888761 () Bool)

(assert (=> b!1340150 (=> (not res!888761) (not e!763283))))

(assert (=> b!1340150 (= res!888761 (and (bvsle #b00000000000000000000000000000000 (size!44499 _keys!1571)) (bvslt (size!44499 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun b!1340151 () Bool)

(declare-fun res!888760 () Bool)

(assert (=> b!1340151 (=> (not res!888760) (not e!763283))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340151 (= res!888760 (and (= (size!44500 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44499 _keys!1571) (size!44500 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340152 () Bool)

(declare-fun e!763285 () Bool)

(declare-fun tp_is_empty!37003 () Bool)

(assert (=> b!1340152 (= e!763285 tp_is_empty!37003)))

(declare-fun mapIsEmpty!57205 () Bool)

(assert (=> mapIsEmpty!57205 mapRes!57205))

(declare-fun mapNonEmpty!57205 () Bool)

(declare-fun tp!108904 () Bool)

(assert (=> mapNonEmpty!57205 (= mapRes!57205 (and tp!108904 e!763285))))

(declare-fun mapKey!57205 () (_ BitVec 32))

(declare-fun mapRest!57205 () (Array (_ BitVec 32) ValueCell!17603))

(declare-fun mapValue!57205 () ValueCell!17603)

(assert (=> mapNonEmpty!57205 (= (arr!43949 _values!1303) (store mapRest!57205 mapKey!57205 mapValue!57205))))

(declare-fun res!888759 () Bool)

(assert (=> start!113154 (=> (not res!888759) (not e!763283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113154 (= res!888759 (validMask!0 mask!1977))))

(assert (=> start!113154 e!763283))

(assert (=> start!113154 true))

(declare-fun array_inv!33407 (array!90991) Bool)

(assert (=> start!113154 (and (array_inv!33407 _values!1303) e!763287)))

(declare-fun array_inv!33408 (array!90989) Bool)

(assert (=> start!113154 (array_inv!33408 _keys!1571)))

(declare-fun b!1340148 () Bool)

(assert (=> b!1340148 (= e!763286 tp_is_empty!37003)))

(assert (= (and start!113154 res!888759) b!1340151))

(assert (= (and b!1340151 res!888760) b!1340146))

(assert (= (and b!1340146 res!888762) b!1340150))

(assert (= (and b!1340150 res!888761) b!1340149))

(assert (= (and b!1340147 condMapEmpty!57205) mapIsEmpty!57205))

(assert (= (and b!1340147 (not condMapEmpty!57205)) mapNonEmpty!57205))

(get-info :version)

(assert (= (and mapNonEmpty!57205 ((_ is ValueCellFull!17603) mapValue!57205)) b!1340152))

(assert (= (and b!1340147 ((_ is ValueCellFull!17603) mapDefault!57205)) b!1340148))

(assert (= start!113154 b!1340147))

(declare-fun m!1228709 () Bool)

(assert (=> b!1340146 m!1228709))

(declare-fun m!1228711 () Bool)

(assert (=> b!1340149 m!1228711))

(declare-fun m!1228713 () Bool)

(assert (=> mapNonEmpty!57205 m!1228713))

(declare-fun m!1228715 () Bool)

(assert (=> start!113154 m!1228715))

(declare-fun m!1228717 () Bool)

(assert (=> start!113154 m!1228717))

(declare-fun m!1228719 () Bool)

(assert (=> start!113154 m!1228719))

(check-sat tp_is_empty!37003 (not start!113154) (not b!1340149) (not b!1340146) (not mapNonEmpty!57205))
(check-sat)
(get-model)

(declare-fun d!144545 () Bool)

(declare-fun res!888791 () Bool)

(declare-fun e!763322 () Bool)

(assert (=> d!144545 (=> res!888791 e!763322)))

(assert (=> d!144545 (= res!888791 ((_ is Nil!31134) Nil!31134))))

(assert (=> d!144545 (= (noDuplicate!2087 Nil!31134) e!763322)))

(declare-fun b!1340199 () Bool)

(declare-fun e!763323 () Bool)

(assert (=> b!1340199 (= e!763322 e!763323)))

(declare-fun res!888792 () Bool)

(assert (=> b!1340199 (=> (not res!888792) (not e!763323))))

(declare-fun contains!9033 (List!31137 (_ BitVec 64)) Bool)

(assert (=> b!1340199 (= res!888792 (not (contains!9033 (t!45461 Nil!31134) (h!32351 Nil!31134))))))

(declare-fun b!1340200 () Bool)

(assert (=> b!1340200 (= e!763323 (noDuplicate!2087 (t!45461 Nil!31134)))))

(assert (= (and d!144545 (not res!888791)) b!1340199))

(assert (= (and b!1340199 res!888792) b!1340200))

(declare-fun m!1228745 () Bool)

(assert (=> b!1340199 m!1228745))

(declare-fun m!1228747 () Bool)

(assert (=> b!1340200 m!1228747))

(assert (=> b!1340149 d!144545))

(declare-fun d!144547 () Bool)

(assert (=> d!144547 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113154 d!144547))

(declare-fun d!144549 () Bool)

(assert (=> d!144549 (= (array_inv!33407 _values!1303) (bvsge (size!44500 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113154 d!144549))

(declare-fun d!144551 () Bool)

(assert (=> d!144551 (= (array_inv!33408 _keys!1571) (bvsge (size!44499 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113154 d!144551))

(declare-fun bm!65096 () Bool)

(declare-fun call!65099 () Bool)

(assert (=> bm!65096 (= call!65099 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1340209 () Bool)

(declare-fun e!763332 () Bool)

(declare-fun e!763330 () Bool)

(assert (=> b!1340209 (= e!763332 e!763330)))

(declare-fun c!126693 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340209 (= c!126693 (validKeyInArray!0 (select (arr!43948 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!144553 () Bool)

(declare-fun res!888798 () Bool)

(assert (=> d!144553 (=> res!888798 e!763332)))

(assert (=> d!144553 (= res!888798 (bvsge #b00000000000000000000000000000000 (size!44499 _keys!1571)))))

(assert (=> d!144553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!763332)))

(declare-fun b!1340210 () Bool)

(assert (=> b!1340210 (= e!763330 call!65099)))

(declare-fun b!1340211 () Bool)

(declare-fun e!763331 () Bool)

(assert (=> b!1340211 (= e!763331 call!65099)))

(declare-fun b!1340212 () Bool)

(assert (=> b!1340212 (= e!763330 e!763331)))

(declare-fun lt!594286 () (_ BitVec 64))

(assert (=> b!1340212 (= lt!594286 (select (arr!43948 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43924 0))(
  ( (Unit!43925) )
))
(declare-fun lt!594284 () Unit!43924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90989 (_ BitVec 64) (_ BitVec 32)) Unit!43924)

(assert (=> b!1340212 (= lt!594284 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!594286 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1340212 (arrayContainsKey!0 _keys!1571 lt!594286 #b00000000000000000000000000000000)))

(declare-fun lt!594285 () Unit!43924)

(assert (=> b!1340212 (= lt!594285 lt!594284)))

(declare-fun res!888797 () Bool)

(declare-datatypes ((SeekEntryResult!10010 0))(
  ( (MissingZero!10010 (index!42411 (_ BitVec 32))) (Found!10010 (index!42412 (_ BitVec 32))) (Intermediate!10010 (undefined!10822 Bool) (index!42413 (_ BitVec 32)) (x!119579 (_ BitVec 32))) (Undefined!10010) (MissingVacant!10010 (index!42414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90989 (_ BitVec 32)) SeekEntryResult!10010)

(assert (=> b!1340212 (= res!888797 (= (seekEntryOrOpen!0 (select (arr!43948 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10010 #b00000000000000000000000000000000)))))

(assert (=> b!1340212 (=> (not res!888797) (not e!763331))))

(assert (= (and d!144553 (not res!888798)) b!1340209))

(assert (= (and b!1340209 c!126693) b!1340212))

(assert (= (and b!1340209 (not c!126693)) b!1340210))

(assert (= (and b!1340212 res!888797) b!1340211))

(assert (= (or b!1340211 b!1340210) bm!65096))

(declare-fun m!1228749 () Bool)

(assert (=> bm!65096 m!1228749))

(declare-fun m!1228751 () Bool)

(assert (=> b!1340209 m!1228751))

(assert (=> b!1340209 m!1228751))

(declare-fun m!1228753 () Bool)

(assert (=> b!1340209 m!1228753))

(assert (=> b!1340212 m!1228751))

(declare-fun m!1228755 () Bool)

(assert (=> b!1340212 m!1228755))

(declare-fun m!1228757 () Bool)

(assert (=> b!1340212 m!1228757))

(assert (=> b!1340212 m!1228751))

(declare-fun m!1228759 () Bool)

(assert (=> b!1340212 m!1228759))

(assert (=> b!1340146 d!144553))

(declare-fun mapIsEmpty!57214 () Bool)

(declare-fun mapRes!57214 () Bool)

(assert (=> mapIsEmpty!57214 mapRes!57214))

(declare-fun condMapEmpty!57214 () Bool)

(declare-fun mapDefault!57214 () ValueCell!17603)

(assert (=> mapNonEmpty!57205 (= condMapEmpty!57214 (= mapRest!57205 ((as const (Array (_ BitVec 32) ValueCell!17603)) mapDefault!57214)))))

(declare-fun e!763337 () Bool)

(assert (=> mapNonEmpty!57205 (= tp!108904 (and e!763337 mapRes!57214))))

(declare-fun b!1340220 () Bool)

(assert (=> b!1340220 (= e!763337 tp_is_empty!37003)))

(declare-fun b!1340219 () Bool)

(declare-fun e!763338 () Bool)

(assert (=> b!1340219 (= e!763338 tp_is_empty!37003)))

(declare-fun mapNonEmpty!57214 () Bool)

(declare-fun tp!108913 () Bool)

(assert (=> mapNonEmpty!57214 (= mapRes!57214 (and tp!108913 e!763338))))

(declare-fun mapValue!57214 () ValueCell!17603)

(declare-fun mapRest!57214 () (Array (_ BitVec 32) ValueCell!17603))

(declare-fun mapKey!57214 () (_ BitVec 32))

(assert (=> mapNonEmpty!57214 (= mapRest!57205 (store mapRest!57214 mapKey!57214 mapValue!57214))))

(assert (= (and mapNonEmpty!57205 condMapEmpty!57214) mapIsEmpty!57214))

(assert (= (and mapNonEmpty!57205 (not condMapEmpty!57214)) mapNonEmpty!57214))

(assert (= (and mapNonEmpty!57214 ((_ is ValueCellFull!17603) mapValue!57214)) b!1340219))

(assert (= (and mapNonEmpty!57205 ((_ is ValueCellFull!17603) mapDefault!57214)) b!1340220))

(declare-fun m!1228761 () Bool)

(assert (=> mapNonEmpty!57214 m!1228761))

(check-sat tp_is_empty!37003 (not bm!65096) (not b!1340200) (not b!1340199) (not b!1340212) (not b!1340209) (not mapNonEmpty!57214))
(check-sat)
