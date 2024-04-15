; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112044 () Bool)

(assert start!112044)

(declare-fun b!1327337 () Bool)

(declare-fun res!880811 () Bool)

(declare-fun e!756611 () Bool)

(assert (=> b!1327337 (=> (not res!880811) (not e!756611))))

(declare-datatypes ((array!89599 0))(
  ( (array!89600 (arr!43269 (Array (_ BitVec 32) (_ BitVec 64))) (size!43821 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89599)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89599 (_ BitVec 32)) Bool)

(assert (=> b!1327337 (= res!880811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!880810 () Bool)

(assert (=> start!112044 (=> (not res!880810) (not e!756611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112044 (= res!880810 (validMask!0 mask!1998))))

(assert (=> start!112044 e!756611))

(assert (=> start!112044 true))

(declare-datatypes ((V!53609 0))(
  ( (V!53610 (val!18264 Int)) )
))
(declare-datatypes ((ValueCell!17291 0))(
  ( (ValueCellFull!17291 (v!20899 V!53609)) (EmptyCell!17291) )
))
(declare-datatypes ((array!89601 0))(
  ( (array!89602 (arr!43270 (Array (_ BitVec 32) ValueCell!17291)) (size!43822 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89601)

(declare-fun e!756614 () Bool)

(declare-fun array_inv!32829 (array!89601) Bool)

(assert (=> start!112044 (and (array_inv!32829 _values!1320) e!756614)))

(declare-fun array_inv!32830 (array!89599) Bool)

(assert (=> start!112044 (array_inv!32830 _keys!1590)))

(declare-fun b!1327338 () Bool)

(declare-fun e!756612 () Bool)

(declare-fun tp_is_empty!36379 () Bool)

(assert (=> b!1327338 (= e!756612 tp_is_empty!36379)))

(declare-fun b!1327339 () Bool)

(assert (=> b!1327339 (= e!756611 (and (bvsle #b00000000000000000000000000000000 (size!43821 _keys!1590)) (bvsge (size!43821 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!56233 () Bool)

(declare-fun mapRes!56233 () Bool)

(declare-fun tp!107141 () Bool)

(assert (=> mapNonEmpty!56233 (= mapRes!56233 (and tp!107141 e!756612))))

(declare-fun mapKey!56233 () (_ BitVec 32))

(declare-fun mapRest!56233 () (Array (_ BitVec 32) ValueCell!17291))

(declare-fun mapValue!56233 () ValueCell!17291)

(assert (=> mapNonEmpty!56233 (= (arr!43270 _values!1320) (store mapRest!56233 mapKey!56233 mapValue!56233))))

(declare-fun b!1327340 () Bool)

(declare-fun e!756610 () Bool)

(assert (=> b!1327340 (= e!756610 tp_is_empty!36379)))

(declare-fun b!1327341 () Bool)

(assert (=> b!1327341 (= e!756614 (and e!756610 mapRes!56233))))

(declare-fun condMapEmpty!56233 () Bool)

(declare-fun mapDefault!56233 () ValueCell!17291)

(assert (=> b!1327341 (= condMapEmpty!56233 (= (arr!43270 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17291)) mapDefault!56233)))))

(declare-fun mapIsEmpty!56233 () Bool)

(assert (=> mapIsEmpty!56233 mapRes!56233))

(declare-fun b!1327342 () Bool)

(declare-fun res!880809 () Bool)

(assert (=> b!1327342 (=> (not res!880809) (not e!756611))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327342 (= res!880809 (and (= (size!43822 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43821 _keys!1590) (size!43822 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112044 res!880810) b!1327342))

(assert (= (and b!1327342 res!880809) b!1327337))

(assert (= (and b!1327337 res!880811) b!1327339))

(assert (= (and b!1327341 condMapEmpty!56233) mapIsEmpty!56233))

(assert (= (and b!1327341 (not condMapEmpty!56233)) mapNonEmpty!56233))

(get-info :version)

(assert (= (and mapNonEmpty!56233 ((_ is ValueCellFull!17291) mapValue!56233)) b!1327338))

(assert (= (and b!1327341 ((_ is ValueCellFull!17291) mapDefault!56233)) b!1327340))

(assert (= start!112044 b!1327341))

(declare-fun m!1216227 () Bool)

(assert (=> b!1327337 m!1216227))

(declare-fun m!1216229 () Bool)

(assert (=> start!112044 m!1216229))

(declare-fun m!1216231 () Bool)

(assert (=> start!112044 m!1216231))

(declare-fun m!1216233 () Bool)

(assert (=> start!112044 m!1216233))

(declare-fun m!1216235 () Bool)

(assert (=> mapNonEmpty!56233 m!1216235))

(check-sat (not start!112044) (not b!1327337) (not mapNonEmpty!56233) tp_is_empty!36379)
(check-sat)
(get-model)

(declare-fun d!143201 () Bool)

(assert (=> d!143201 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112044 d!143201))

(declare-fun d!143203 () Bool)

(assert (=> d!143203 (= (array_inv!32829 _values!1320) (bvsge (size!43822 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112044 d!143203))

(declare-fun d!143205 () Bool)

(assert (=> d!143205 (= (array_inv!32830 _keys!1590) (bvsge (size!43821 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112044 d!143205))

(declare-fun b!1327387 () Bool)

(declare-fun e!756652 () Bool)

(declare-fun e!756651 () Bool)

(assert (=> b!1327387 (= e!756652 e!756651)))

(declare-fun c!125877 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327387 (= c!125877 (validKeyInArray!0 (select (arr!43269 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64794 () Bool)

(declare-fun call!64797 () Bool)

(assert (=> bm!64794 (= call!64797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1327388 () Bool)

(assert (=> b!1327388 (= e!756651 call!64797)))

(declare-fun d!143207 () Bool)

(declare-fun res!880834 () Bool)

(assert (=> d!143207 (=> res!880834 e!756652)))

(assert (=> d!143207 (= res!880834 (bvsge #b00000000000000000000000000000000 (size!43821 _keys!1590)))))

(assert (=> d!143207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756652)))

(declare-fun b!1327389 () Bool)

(declare-fun e!756653 () Bool)

(assert (=> b!1327389 (= e!756651 e!756653)))

(declare-fun lt!590526 () (_ BitVec 64))

(assert (=> b!1327389 (= lt!590526 (select (arr!43269 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43528 0))(
  ( (Unit!43529) )
))
(declare-fun lt!590525 () Unit!43528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89599 (_ BitVec 64) (_ BitVec 32)) Unit!43528)

(assert (=> b!1327389 (= lt!590525 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590526 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327389 (arrayContainsKey!0 _keys!1590 lt!590526 #b00000000000000000000000000000000)))

(declare-fun lt!590524 () Unit!43528)

(assert (=> b!1327389 (= lt!590524 lt!590525)))

(declare-fun res!880835 () Bool)

(declare-datatypes ((SeekEntryResult!10043 0))(
  ( (MissingZero!10043 (index!42543 (_ BitVec 32))) (Found!10043 (index!42544 (_ BitVec 32))) (Intermediate!10043 (undefined!10855 Bool) (index!42545 (_ BitVec 32)) (x!118352 (_ BitVec 32))) (Undefined!10043) (MissingVacant!10043 (index!42546 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89599 (_ BitVec 32)) SeekEntryResult!10043)

(assert (=> b!1327389 (= res!880835 (= (seekEntryOrOpen!0 (select (arr!43269 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10043 #b00000000000000000000000000000000)))))

(assert (=> b!1327389 (=> (not res!880835) (not e!756653))))

(declare-fun b!1327390 () Bool)

(assert (=> b!1327390 (= e!756653 call!64797)))

(assert (= (and d!143207 (not res!880834)) b!1327387))

(assert (= (and b!1327387 c!125877) b!1327389))

(assert (= (and b!1327387 (not c!125877)) b!1327388))

(assert (= (and b!1327389 res!880835) b!1327390))

(assert (= (or b!1327390 b!1327388) bm!64794))

(declare-fun m!1216257 () Bool)

(assert (=> b!1327387 m!1216257))

(assert (=> b!1327387 m!1216257))

(declare-fun m!1216259 () Bool)

(assert (=> b!1327387 m!1216259))

(declare-fun m!1216261 () Bool)

(assert (=> bm!64794 m!1216261))

(assert (=> b!1327389 m!1216257))

(declare-fun m!1216263 () Bool)

(assert (=> b!1327389 m!1216263))

(declare-fun m!1216265 () Bool)

(assert (=> b!1327389 m!1216265))

(assert (=> b!1327389 m!1216257))

(declare-fun m!1216267 () Bool)

(assert (=> b!1327389 m!1216267))

(assert (=> b!1327337 d!143207))

(declare-fun b!1327397 () Bool)

(declare-fun e!756658 () Bool)

(assert (=> b!1327397 (= e!756658 tp_is_empty!36379)))

(declare-fun condMapEmpty!56242 () Bool)

(declare-fun mapDefault!56242 () ValueCell!17291)

(assert (=> mapNonEmpty!56233 (= condMapEmpty!56242 (= mapRest!56233 ((as const (Array (_ BitVec 32) ValueCell!17291)) mapDefault!56242)))))

(declare-fun e!756659 () Bool)

(declare-fun mapRes!56242 () Bool)

(assert (=> mapNonEmpty!56233 (= tp!107141 (and e!756659 mapRes!56242))))

(declare-fun mapIsEmpty!56242 () Bool)

(assert (=> mapIsEmpty!56242 mapRes!56242))

(declare-fun b!1327398 () Bool)

(assert (=> b!1327398 (= e!756659 tp_is_empty!36379)))

(declare-fun mapNonEmpty!56242 () Bool)

(declare-fun tp!107150 () Bool)

(assert (=> mapNonEmpty!56242 (= mapRes!56242 (and tp!107150 e!756658))))

(declare-fun mapValue!56242 () ValueCell!17291)

(declare-fun mapKey!56242 () (_ BitVec 32))

(declare-fun mapRest!56242 () (Array (_ BitVec 32) ValueCell!17291))

(assert (=> mapNonEmpty!56242 (= mapRest!56233 (store mapRest!56242 mapKey!56242 mapValue!56242))))

(assert (= (and mapNonEmpty!56233 condMapEmpty!56242) mapIsEmpty!56242))

(assert (= (and mapNonEmpty!56233 (not condMapEmpty!56242)) mapNonEmpty!56242))

(assert (= (and mapNonEmpty!56242 ((_ is ValueCellFull!17291) mapValue!56242)) b!1327397))

(assert (= (and mapNonEmpty!56233 ((_ is ValueCellFull!17291) mapDefault!56242)) b!1327398))

(declare-fun m!1216269 () Bool)

(assert (=> mapNonEmpty!56242 m!1216269))

(check-sat (not b!1327387) (not b!1327389) (not bm!64794) tp_is_empty!36379 (not mapNonEmpty!56242))
(check-sat)
