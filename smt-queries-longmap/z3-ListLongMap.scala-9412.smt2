; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112058 () Bool)

(assert start!112058)

(declare-fun mapIsEmpty!56245 () Bool)

(declare-fun mapRes!56245 () Bool)

(assert (=> mapIsEmpty!56245 mapRes!56245))

(declare-fun mapNonEmpty!56245 () Bool)

(declare-fun tp!107153 () Bool)

(declare-fun e!756671 () Bool)

(assert (=> mapNonEmpty!56245 (= mapRes!56245 (and tp!107153 e!756671))))

(declare-datatypes ((V!53617 0))(
  ( (V!53618 (val!18267 Int)) )
))
(declare-datatypes ((ValueCell!17294 0))(
  ( (ValueCellFull!17294 (v!20902 V!53617)) (EmptyCell!17294) )
))
(declare-fun mapRest!56245 () (Array (_ BitVec 32) ValueCell!17294))

(declare-datatypes ((array!89611 0))(
  ( (array!89612 (arr!43274 (Array (_ BitVec 32) ValueCell!17294)) (size!43826 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89611)

(declare-fun mapKey!56245 () (_ BitVec 32))

(declare-fun mapValue!56245 () ValueCell!17294)

(assert (=> mapNonEmpty!56245 (= (arr!43274 _values!1320) (store mapRest!56245 mapKey!56245 mapValue!56245))))

(declare-fun b!1327413 () Bool)

(declare-fun res!880847 () Bool)

(declare-fun e!756670 () Bool)

(assert (=> b!1327413 (=> (not res!880847) (not e!756670))))

(declare-datatypes ((array!89613 0))(
  ( (array!89614 (arr!43275 (Array (_ BitVec 32) (_ BitVec 64))) (size!43827 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89613)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89613 (_ BitVec 32)) Bool)

(assert (=> b!1327413 (= res!880847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327414 () Bool)

(declare-fun e!756672 () Bool)

(declare-fun tp_is_empty!36385 () Bool)

(assert (=> b!1327414 (= e!756672 tp_is_empty!36385)))

(declare-fun res!880846 () Bool)

(assert (=> start!112058 (=> (not res!880846) (not e!756670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112058 (= res!880846 (validMask!0 mask!1998))))

(assert (=> start!112058 e!756670))

(assert (=> start!112058 true))

(declare-fun e!756674 () Bool)

(declare-fun array_inv!32831 (array!89611) Bool)

(assert (=> start!112058 (and (array_inv!32831 _values!1320) e!756674)))

(declare-fun array_inv!32832 (array!89613) Bool)

(assert (=> start!112058 (array_inv!32832 _keys!1590)))

(declare-fun b!1327415 () Bool)

(declare-fun res!880845 () Bool)

(assert (=> b!1327415 (=> (not res!880845) (not e!756670))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327415 (= res!880845 (and (= (size!43826 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43827 _keys!1590) (size!43826 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327416 () Bool)

(assert (=> b!1327416 (= e!756674 (and e!756672 mapRes!56245))))

(declare-fun condMapEmpty!56245 () Bool)

(declare-fun mapDefault!56245 () ValueCell!17294)

(assert (=> b!1327416 (= condMapEmpty!56245 (= (arr!43274 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17294)) mapDefault!56245)))))

(declare-fun b!1327417 () Bool)

(declare-fun res!880844 () Bool)

(assert (=> b!1327417 (=> (not res!880844) (not e!756670))))

(assert (=> b!1327417 (= res!880844 (and (bvsle #b00000000000000000000000000000000 (size!43827 _keys!1590)) (bvslt (size!43827 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1327418 () Bool)

(assert (=> b!1327418 (= e!756671 tp_is_empty!36385)))

(declare-fun b!1327419 () Bool)

(declare-datatypes ((List!30742 0))(
  ( (Nil!30739) (Cons!30738 (h!31947 (_ BitVec 64)) (t!44740 List!30742)) )
))
(declare-fun noDuplicate!2087 (List!30742) Bool)

(assert (=> b!1327419 (= e!756670 (not (noDuplicate!2087 Nil!30739)))))

(assert (= (and start!112058 res!880846) b!1327415))

(assert (= (and b!1327415 res!880845) b!1327413))

(assert (= (and b!1327413 res!880847) b!1327417))

(assert (= (and b!1327417 res!880844) b!1327419))

(assert (= (and b!1327416 condMapEmpty!56245) mapIsEmpty!56245))

(assert (= (and b!1327416 (not condMapEmpty!56245)) mapNonEmpty!56245))

(get-info :version)

(assert (= (and mapNonEmpty!56245 ((_ is ValueCellFull!17294) mapValue!56245)) b!1327418))

(assert (= (and b!1327416 ((_ is ValueCellFull!17294) mapDefault!56245)) b!1327414))

(assert (= start!112058 b!1327416))

(declare-fun m!1216271 () Bool)

(assert (=> mapNonEmpty!56245 m!1216271))

(declare-fun m!1216273 () Bool)

(assert (=> b!1327413 m!1216273))

(declare-fun m!1216275 () Bool)

(assert (=> start!112058 m!1216275))

(declare-fun m!1216277 () Bool)

(assert (=> start!112058 m!1216277))

(declare-fun m!1216279 () Bool)

(assert (=> start!112058 m!1216279))

(declare-fun m!1216281 () Bool)

(assert (=> b!1327419 m!1216281))

(check-sat (not b!1327419) (not mapNonEmpty!56245) (not start!112058) (not b!1327413) tp_is_empty!36385)
(check-sat)
(get-model)

(declare-fun d!143211 () Bool)

(assert (=> d!143211 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112058 d!143211))

(declare-fun d!143213 () Bool)

(assert (=> d!143213 (= (array_inv!32831 _values!1320) (bvsge (size!43826 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112058 d!143213))

(declare-fun d!143215 () Bool)

(assert (=> d!143215 (= (array_inv!32832 _keys!1590) (bvsge (size!43827 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112058 d!143215))

(declare-fun b!1327470 () Bool)

(declare-fun e!756711 () Bool)

(declare-fun call!64800 () Bool)

(assert (=> b!1327470 (= e!756711 call!64800)))

(declare-fun b!1327471 () Bool)

(declare-fun e!756712 () Bool)

(assert (=> b!1327471 (= e!756712 call!64800)))

(declare-fun b!1327472 () Bool)

(declare-fun e!756713 () Bool)

(assert (=> b!1327472 (= e!756713 e!756712)))

(declare-fun c!125880 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327472 (= c!125880 (validKeyInArray!0 (select (arr!43275 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143217 () Bool)

(declare-fun res!880876 () Bool)

(assert (=> d!143217 (=> res!880876 e!756713)))

(assert (=> d!143217 (= res!880876 (bvsge #b00000000000000000000000000000000 (size!43827 _keys!1590)))))

(assert (=> d!143217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756713)))

(declare-fun b!1327473 () Bool)

(assert (=> b!1327473 (= e!756712 e!756711)))

(declare-fun lt!590535 () (_ BitVec 64))

(assert (=> b!1327473 (= lt!590535 (select (arr!43275 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43530 0))(
  ( (Unit!43531) )
))
(declare-fun lt!590533 () Unit!43530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89613 (_ BitVec 64) (_ BitVec 32)) Unit!43530)

(assert (=> b!1327473 (= lt!590533 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590535 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327473 (arrayContainsKey!0 _keys!1590 lt!590535 #b00000000000000000000000000000000)))

(declare-fun lt!590534 () Unit!43530)

(assert (=> b!1327473 (= lt!590534 lt!590533)))

(declare-fun res!880877 () Bool)

(declare-datatypes ((SeekEntryResult!10044 0))(
  ( (MissingZero!10044 (index!42547 (_ BitVec 32))) (Found!10044 (index!42548 (_ BitVec 32))) (Intermediate!10044 (undefined!10856 Bool) (index!42549 (_ BitVec 32)) (x!118363 (_ BitVec 32))) (Undefined!10044) (MissingVacant!10044 (index!42550 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89613 (_ BitVec 32)) SeekEntryResult!10044)

(assert (=> b!1327473 (= res!880877 (= (seekEntryOrOpen!0 (select (arr!43275 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10044 #b00000000000000000000000000000000)))))

(assert (=> b!1327473 (=> (not res!880877) (not e!756711))))

(declare-fun bm!64797 () Bool)

(assert (=> bm!64797 (= call!64800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(assert (= (and d!143217 (not res!880876)) b!1327472))

(assert (= (and b!1327472 c!125880) b!1327473))

(assert (= (and b!1327472 (not c!125880)) b!1327471))

(assert (= (and b!1327473 res!880877) b!1327470))

(assert (= (or b!1327470 b!1327471) bm!64797))

(declare-fun m!1216307 () Bool)

(assert (=> b!1327472 m!1216307))

(assert (=> b!1327472 m!1216307))

(declare-fun m!1216309 () Bool)

(assert (=> b!1327472 m!1216309))

(assert (=> b!1327473 m!1216307))

(declare-fun m!1216311 () Bool)

(assert (=> b!1327473 m!1216311))

(declare-fun m!1216313 () Bool)

(assert (=> b!1327473 m!1216313))

(assert (=> b!1327473 m!1216307))

(declare-fun m!1216315 () Bool)

(assert (=> b!1327473 m!1216315))

(declare-fun m!1216317 () Bool)

(assert (=> bm!64797 m!1216317))

(assert (=> b!1327413 d!143217))

(declare-fun d!143219 () Bool)

(declare-fun res!880882 () Bool)

(declare-fun e!756718 () Bool)

(assert (=> d!143219 (=> res!880882 e!756718)))

(assert (=> d!143219 (= res!880882 ((_ is Nil!30739) Nil!30739))))

(assert (=> d!143219 (= (noDuplicate!2087 Nil!30739) e!756718)))

(declare-fun b!1327478 () Bool)

(declare-fun e!756719 () Bool)

(assert (=> b!1327478 (= e!756718 e!756719)))

(declare-fun res!880883 () Bool)

(assert (=> b!1327478 (=> (not res!880883) (not e!756719))))

(declare-fun contains!8740 (List!30742 (_ BitVec 64)) Bool)

(assert (=> b!1327478 (= res!880883 (not (contains!8740 (t!44740 Nil!30739) (h!31947 Nil!30739))))))

(declare-fun b!1327479 () Bool)

(assert (=> b!1327479 (= e!756719 (noDuplicate!2087 (t!44740 Nil!30739)))))

(assert (= (and d!143219 (not res!880882)) b!1327478))

(assert (= (and b!1327478 res!880883) b!1327479))

(declare-fun m!1216319 () Bool)

(assert (=> b!1327478 m!1216319))

(declare-fun m!1216321 () Bool)

(assert (=> b!1327479 m!1216321))

(assert (=> b!1327419 d!143219))

(declare-fun b!1327487 () Bool)

(declare-fun e!756725 () Bool)

(assert (=> b!1327487 (= e!756725 tp_is_empty!36385)))

(declare-fun b!1327486 () Bool)

(declare-fun e!756724 () Bool)

(assert (=> b!1327486 (= e!756724 tp_is_empty!36385)))

(declare-fun condMapEmpty!56254 () Bool)

(declare-fun mapDefault!56254 () ValueCell!17294)

(assert (=> mapNonEmpty!56245 (= condMapEmpty!56254 (= mapRest!56245 ((as const (Array (_ BitVec 32) ValueCell!17294)) mapDefault!56254)))))

(declare-fun mapRes!56254 () Bool)

(assert (=> mapNonEmpty!56245 (= tp!107153 (and e!756725 mapRes!56254))))

(declare-fun mapIsEmpty!56254 () Bool)

(assert (=> mapIsEmpty!56254 mapRes!56254))

(declare-fun mapNonEmpty!56254 () Bool)

(declare-fun tp!107162 () Bool)

(assert (=> mapNonEmpty!56254 (= mapRes!56254 (and tp!107162 e!756724))))

(declare-fun mapValue!56254 () ValueCell!17294)

(declare-fun mapRest!56254 () (Array (_ BitVec 32) ValueCell!17294))

(declare-fun mapKey!56254 () (_ BitVec 32))

(assert (=> mapNonEmpty!56254 (= mapRest!56245 (store mapRest!56254 mapKey!56254 mapValue!56254))))

(assert (= (and mapNonEmpty!56245 condMapEmpty!56254) mapIsEmpty!56254))

(assert (= (and mapNonEmpty!56245 (not condMapEmpty!56254)) mapNonEmpty!56254))

(assert (= (and mapNonEmpty!56254 ((_ is ValueCellFull!17294) mapValue!56254)) b!1327486))

(assert (= (and mapNonEmpty!56245 ((_ is ValueCellFull!17294) mapDefault!56254)) b!1327487))

(declare-fun m!1216323 () Bool)

(assert (=> mapNonEmpty!56254 m!1216323))

(check-sat (not b!1327479) (not b!1327478) (not b!1327473) (not bm!64797) tp_is_empty!36385 (not mapNonEmpty!56254) (not b!1327472))
(check-sat)
