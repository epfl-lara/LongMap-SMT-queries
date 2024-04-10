; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112032 () Bool)

(assert start!112032)

(declare-fun res!880814 () Bool)

(declare-fun e!756602 () Bool)

(assert (=> start!112032 (=> (not res!880814) (not e!756602))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112032 (= res!880814 (validMask!0 mask!1998))))

(assert (=> start!112032 e!756602))

(assert (=> start!112032 true))

(declare-datatypes ((V!53603 0))(
  ( (V!53604 (val!18262 Int)) )
))
(declare-datatypes ((ValueCell!17289 0))(
  ( (ValueCellFull!17289 (v!20898 V!53603)) (EmptyCell!17289) )
))
(declare-datatypes ((array!89658 0))(
  ( (array!89659 (arr!43299 (Array (_ BitVec 32) ValueCell!17289)) (size!43849 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89658)

(declare-fun e!756599 () Bool)

(declare-fun array_inv!32683 (array!89658) Bool)

(assert (=> start!112032 (and (array_inv!32683 _values!1320) e!756599)))

(declare-datatypes ((array!89660 0))(
  ( (array!89661 (arr!43300 (Array (_ BitVec 32) (_ BitVec 64))) (size!43850 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89660)

(declare-fun array_inv!32684 (array!89660) Bool)

(assert (=> start!112032 (array_inv!32684 _keys!1590)))

(declare-fun mapIsEmpty!56224 () Bool)

(declare-fun mapRes!56224 () Bool)

(assert (=> mapIsEmpty!56224 mapRes!56224))

(declare-fun b!1327351 () Bool)

(declare-fun res!880816 () Bool)

(assert (=> b!1327351 (=> (not res!880816) (not e!756602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89660 (_ BitVec 32)) Bool)

(assert (=> b!1327351 (= res!880816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327352 () Bool)

(assert (=> b!1327352 (= e!756602 (bvsgt #b00000000000000000000000000000000 (size!43850 _keys!1590)))))

(declare-fun mapNonEmpty!56224 () Bool)

(declare-fun tp!107131 () Bool)

(declare-fun e!756598 () Bool)

(assert (=> mapNonEmpty!56224 (= mapRes!56224 (and tp!107131 e!756598))))

(declare-fun mapRest!56224 () (Array (_ BitVec 32) ValueCell!17289))

(declare-fun mapValue!56224 () ValueCell!17289)

(declare-fun mapKey!56224 () (_ BitVec 32))

(assert (=> mapNonEmpty!56224 (= (arr!43299 _values!1320) (store mapRest!56224 mapKey!56224 mapValue!56224))))

(declare-fun b!1327353 () Bool)

(declare-fun res!880815 () Bool)

(assert (=> b!1327353 (=> (not res!880815) (not e!756602))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327353 (= res!880815 (and (= (size!43849 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43850 _keys!1590) (size!43849 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327354 () Bool)

(declare-fun e!756601 () Bool)

(declare-fun tp_is_empty!36375 () Bool)

(assert (=> b!1327354 (= e!756601 tp_is_empty!36375)))

(declare-fun b!1327355 () Bool)

(assert (=> b!1327355 (= e!756598 tp_is_empty!36375)))

(declare-fun b!1327356 () Bool)

(assert (=> b!1327356 (= e!756599 (and e!756601 mapRes!56224))))

(declare-fun condMapEmpty!56224 () Bool)

(declare-fun mapDefault!56224 () ValueCell!17289)

(assert (=> b!1327356 (= condMapEmpty!56224 (= (arr!43299 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17289)) mapDefault!56224)))))

(assert (= (and start!112032 res!880814) b!1327353))

(assert (= (and b!1327353 res!880815) b!1327351))

(assert (= (and b!1327351 res!880816) b!1327352))

(assert (= (and b!1327356 condMapEmpty!56224) mapIsEmpty!56224))

(assert (= (and b!1327356 (not condMapEmpty!56224)) mapNonEmpty!56224))

(get-info :version)

(assert (= (and mapNonEmpty!56224 ((_ is ValueCellFull!17289) mapValue!56224)) b!1327355))

(assert (= (and b!1327356 ((_ is ValueCellFull!17289) mapDefault!56224)) b!1327354))

(assert (= start!112032 b!1327356))

(declare-fun m!1216709 () Bool)

(assert (=> start!112032 m!1216709))

(declare-fun m!1216711 () Bool)

(assert (=> start!112032 m!1216711))

(declare-fun m!1216713 () Bool)

(assert (=> start!112032 m!1216713))

(declare-fun m!1216715 () Bool)

(assert (=> b!1327351 m!1216715))

(declare-fun m!1216717 () Bool)

(assert (=> mapNonEmpty!56224 m!1216717))

(check-sat (not b!1327351) (not start!112032) (not mapNonEmpty!56224) tp_is_empty!36375)
(check-sat)
(get-model)

(declare-fun b!1327383 () Bool)

(declare-fun e!756624 () Bool)

(declare-fun e!756626 () Bool)

(assert (=> b!1327383 (= e!756624 e!756626)))

(declare-fun lt!590702 () (_ BitVec 64))

(assert (=> b!1327383 (= lt!590702 (select (arr!43300 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43731 0))(
  ( (Unit!43732) )
))
(declare-fun lt!590703 () Unit!43731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89660 (_ BitVec 64) (_ BitVec 32)) Unit!43731)

(assert (=> b!1327383 (= lt!590703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590702 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327383 (arrayContainsKey!0 _keys!1590 lt!590702 #b00000000000000000000000000000000)))

(declare-fun lt!590701 () Unit!43731)

(assert (=> b!1327383 (= lt!590701 lt!590703)))

(declare-fun res!880830 () Bool)

(declare-datatypes ((SeekEntryResult!10043 0))(
  ( (MissingZero!10043 (index!42543 (_ BitVec 32))) (Found!10043 (index!42544 (_ BitVec 32))) (Intermediate!10043 (undefined!10855 Bool) (index!42545 (_ BitVec 32)) (x!118345 (_ BitVec 32))) (Undefined!10043) (MissingVacant!10043 (index!42546 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89660 (_ BitVec 32)) SeekEntryResult!10043)

(assert (=> b!1327383 (= res!880830 (= (seekEntryOrOpen!0 (select (arr!43300 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10043 #b00000000000000000000000000000000)))))

(assert (=> b!1327383 (=> (not res!880830) (not e!756626))))

(declare-fun b!1327384 () Bool)

(declare-fun e!756625 () Bool)

(assert (=> b!1327384 (= e!756625 e!756624)))

(declare-fun c!125892 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327384 (= c!125892 (validKeyInArray!0 (select (arr!43300 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64810 () Bool)

(declare-fun call!64813 () Bool)

(assert (=> bm!64810 (= call!64813 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143307 () Bool)

(declare-fun res!880831 () Bool)

(assert (=> d!143307 (=> res!880831 e!756625)))

(assert (=> d!143307 (= res!880831 (bvsge #b00000000000000000000000000000000 (size!43850 _keys!1590)))))

(assert (=> d!143307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756625)))

(declare-fun b!1327385 () Bool)

(assert (=> b!1327385 (= e!756626 call!64813)))

(declare-fun b!1327386 () Bool)

(assert (=> b!1327386 (= e!756624 call!64813)))

(assert (= (and d!143307 (not res!880831)) b!1327384))

(assert (= (and b!1327384 c!125892) b!1327383))

(assert (= (and b!1327384 (not c!125892)) b!1327386))

(assert (= (and b!1327383 res!880830) b!1327385))

(assert (= (or b!1327385 b!1327386) bm!64810))

(declare-fun m!1216729 () Bool)

(assert (=> b!1327383 m!1216729))

(declare-fun m!1216731 () Bool)

(assert (=> b!1327383 m!1216731))

(declare-fun m!1216733 () Bool)

(assert (=> b!1327383 m!1216733))

(assert (=> b!1327383 m!1216729))

(declare-fun m!1216735 () Bool)

(assert (=> b!1327383 m!1216735))

(assert (=> b!1327384 m!1216729))

(assert (=> b!1327384 m!1216729))

(declare-fun m!1216737 () Bool)

(assert (=> b!1327384 m!1216737))

(declare-fun m!1216739 () Bool)

(assert (=> bm!64810 m!1216739))

(assert (=> b!1327351 d!143307))

(declare-fun d!143309 () Bool)

(assert (=> d!143309 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112032 d!143309))

(declare-fun d!143311 () Bool)

(assert (=> d!143311 (= (array_inv!32683 _values!1320) (bvsge (size!43849 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112032 d!143311))

(declare-fun d!143313 () Bool)

(assert (=> d!143313 (= (array_inv!32684 _keys!1590) (bvsge (size!43850 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112032 d!143313))

(declare-fun mapIsEmpty!56230 () Bool)

(declare-fun mapRes!56230 () Bool)

(assert (=> mapIsEmpty!56230 mapRes!56230))

(declare-fun b!1327394 () Bool)

(declare-fun e!756631 () Bool)

(assert (=> b!1327394 (= e!756631 tp_is_empty!36375)))

(declare-fun condMapEmpty!56230 () Bool)

(declare-fun mapDefault!56230 () ValueCell!17289)

(assert (=> mapNonEmpty!56224 (= condMapEmpty!56230 (= mapRest!56224 ((as const (Array (_ BitVec 32) ValueCell!17289)) mapDefault!56230)))))

(assert (=> mapNonEmpty!56224 (= tp!107131 (and e!756631 mapRes!56230))))

(declare-fun mapNonEmpty!56230 () Bool)

(declare-fun tp!107137 () Bool)

(declare-fun e!756632 () Bool)

(assert (=> mapNonEmpty!56230 (= mapRes!56230 (and tp!107137 e!756632))))

(declare-fun mapKey!56230 () (_ BitVec 32))

(declare-fun mapRest!56230 () (Array (_ BitVec 32) ValueCell!17289))

(declare-fun mapValue!56230 () ValueCell!17289)

(assert (=> mapNonEmpty!56230 (= mapRest!56224 (store mapRest!56230 mapKey!56230 mapValue!56230))))

(declare-fun b!1327393 () Bool)

(assert (=> b!1327393 (= e!756632 tp_is_empty!36375)))

(assert (= (and mapNonEmpty!56224 condMapEmpty!56230) mapIsEmpty!56230))

(assert (= (and mapNonEmpty!56224 (not condMapEmpty!56230)) mapNonEmpty!56230))

(assert (= (and mapNonEmpty!56230 ((_ is ValueCellFull!17289) mapValue!56230)) b!1327393))

(assert (= (and mapNonEmpty!56224 ((_ is ValueCellFull!17289) mapDefault!56230)) b!1327394))

(declare-fun m!1216741 () Bool)

(assert (=> mapNonEmpty!56230 m!1216741))

(check-sat (not mapNonEmpty!56230) (not b!1327383) tp_is_empty!36375 (not bm!64810) (not b!1327384))
(check-sat)
