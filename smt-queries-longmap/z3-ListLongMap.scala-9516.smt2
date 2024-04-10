; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112948 () Bool)

(assert start!112948)

(declare-fun mapNonEmpty!57220 () Bool)

(declare-fun mapRes!57220 () Bool)

(declare-fun tp!108919 () Bool)

(declare-fun e!762529 () Bool)

(assert (=> mapNonEmpty!57220 (= mapRes!57220 (and tp!108919 e!762529))))

(declare-datatypes ((V!54451 0))(
  ( (V!54452 (val!18580 Int)) )
))
(declare-datatypes ((ValueCell!17607 0))(
  ( (ValueCellFull!17607 (v!21227 V!54451)) (EmptyCell!17607) )
))
(declare-fun mapRest!57220 () (Array (_ BitVec 32) ValueCell!17607))

(declare-fun mapKey!57220 () (_ BitVec 32))

(declare-fun mapValue!57220 () ValueCell!17607)

(declare-datatypes ((array!90886 0))(
  ( (array!90887 (arr!43900 (Array (_ BitVec 32) ValueCell!17607)) (size!44450 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90886)

(assert (=> mapNonEmpty!57220 (= (arr!43900 _values!1303) (store mapRest!57220 mapKey!57220 mapValue!57220))))

(declare-fun b!1338967 () Bool)

(declare-fun res!888311 () Bool)

(declare-fun e!762526 () Bool)

(assert (=> b!1338967 (=> (not res!888311) (not e!762526))))

(declare-datatypes ((List!31093 0))(
  ( (Nil!31090) (Cons!31089 (h!32298 (_ BitVec 64)) (t!45425 List!31093)) )
))
(declare-fun noDuplicate!2070 (List!31093) Bool)

(assert (=> b!1338967 (= res!888311 (noDuplicate!2070 Nil!31090))))

(declare-fun b!1338968 () Bool)

(declare-fun res!888316 () Bool)

(assert (=> b!1338968 (=> (not res!888316) (not e!762526))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90888 0))(
  ( (array!90889 (arr!43901 (Array (_ BitVec 32) (_ BitVec 64))) (size!44451 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90888)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338968 (= res!888316 (and (= (size!44450 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44451 _keys!1571) (size!44450 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338969 () Bool)

(declare-fun e!762530 () Bool)

(declare-fun e!762531 () Bool)

(assert (=> b!1338969 (= e!762530 (and e!762531 mapRes!57220))))

(declare-fun condMapEmpty!57220 () Bool)

(declare-fun mapDefault!57220 () ValueCell!17607)

(assert (=> b!1338969 (= condMapEmpty!57220 (= (arr!43900 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17607)) mapDefault!57220)))))

(declare-fun res!888312 () Bool)

(assert (=> start!112948 (=> (not res!888312) (not e!762526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112948 (= res!888312 (validMask!0 mask!1977))))

(assert (=> start!112948 e!762526))

(assert (=> start!112948 true))

(declare-fun array_inv!33105 (array!90886) Bool)

(assert (=> start!112948 (and (array_inv!33105 _values!1303) e!762530)))

(declare-fun array_inv!33106 (array!90888) Bool)

(assert (=> start!112948 (array_inv!33106 _keys!1571)))

(declare-fun b!1338970 () Bool)

(declare-fun res!888315 () Bool)

(assert (=> b!1338970 (=> (not res!888315) (not e!762526))))

(assert (=> b!1338970 (= res!888315 (and (bvsle #b00000000000000000000000000000000 (size!44451 _keys!1571)) (bvslt (size!44451 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!57220 () Bool)

(assert (=> mapIsEmpty!57220 mapRes!57220))

(declare-fun b!1338971 () Bool)

(declare-fun tp_is_empty!37011 () Bool)

(assert (=> b!1338971 (= e!762531 tp_is_empty!37011)))

(declare-fun b!1338972 () Bool)

(assert (=> b!1338972 (= e!762529 tp_is_empty!37011)))

(declare-fun b!1338973 () Bool)

(declare-fun e!762528 () Bool)

(assert (=> b!1338973 (= e!762526 e!762528)))

(declare-fun res!888314 () Bool)

(assert (=> b!1338973 (=> res!888314 e!762528)))

(declare-fun contains!8993 (List!31093 (_ BitVec 64)) Bool)

(assert (=> b!1338973 (= res!888314 (contains!8993 Nil!31090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338974 () Bool)

(declare-fun res!888313 () Bool)

(assert (=> b!1338974 (=> (not res!888313) (not e!762526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90888 (_ BitVec 32)) Bool)

(assert (=> b!1338974 (= res!888313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338975 () Bool)

(assert (=> b!1338975 (= e!762528 (contains!8993 Nil!31090 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!112948 res!888312) b!1338968))

(assert (= (and b!1338968 res!888316) b!1338974))

(assert (= (and b!1338974 res!888313) b!1338970))

(assert (= (and b!1338970 res!888315) b!1338967))

(assert (= (and b!1338967 res!888311) b!1338973))

(assert (= (and b!1338973 (not res!888314)) b!1338975))

(assert (= (and b!1338969 condMapEmpty!57220) mapIsEmpty!57220))

(assert (= (and b!1338969 (not condMapEmpty!57220)) mapNonEmpty!57220))

(get-info :version)

(assert (= (and mapNonEmpty!57220 ((_ is ValueCellFull!17607) mapValue!57220)) b!1338972))

(assert (= (and b!1338969 ((_ is ValueCellFull!17607) mapDefault!57220)) b!1338971))

(assert (= start!112948 b!1338969))

(declare-fun m!1227181 () Bool)

(assert (=> start!112948 m!1227181))

(declare-fun m!1227183 () Bool)

(assert (=> start!112948 m!1227183))

(declare-fun m!1227185 () Bool)

(assert (=> start!112948 m!1227185))

(declare-fun m!1227187 () Bool)

(assert (=> b!1338974 m!1227187))

(declare-fun m!1227189 () Bool)

(assert (=> mapNonEmpty!57220 m!1227189))

(declare-fun m!1227191 () Bool)

(assert (=> b!1338973 m!1227191))

(declare-fun m!1227193 () Bool)

(assert (=> b!1338975 m!1227193))

(declare-fun m!1227195 () Bool)

(assert (=> b!1338967 m!1227195))

(check-sat (not b!1338967) (not b!1338975) (not b!1338974) (not start!112948) tp_is_empty!37011 (not mapNonEmpty!57220) (not b!1338973))
(check-sat)
(get-model)

(declare-fun d!144113 () Bool)

(declare-fun res!888339 () Bool)

(declare-fun e!762554 () Bool)

(assert (=> d!144113 (=> res!888339 e!762554)))

(assert (=> d!144113 (= res!888339 ((_ is Nil!31090) Nil!31090))))

(assert (=> d!144113 (= (noDuplicate!2070 Nil!31090) e!762554)))

(declare-fun b!1339007 () Bool)

(declare-fun e!762555 () Bool)

(assert (=> b!1339007 (= e!762554 e!762555)))

(declare-fun res!888340 () Bool)

(assert (=> b!1339007 (=> (not res!888340) (not e!762555))))

(assert (=> b!1339007 (= res!888340 (not (contains!8993 (t!45425 Nil!31090) (h!32298 Nil!31090))))))

(declare-fun b!1339008 () Bool)

(assert (=> b!1339008 (= e!762555 (noDuplicate!2070 (t!45425 Nil!31090)))))

(assert (= (and d!144113 (not res!888339)) b!1339007))

(assert (= (and b!1339007 res!888340) b!1339008))

(declare-fun m!1227213 () Bool)

(assert (=> b!1339007 m!1227213))

(declare-fun m!1227215 () Bool)

(assert (=> b!1339008 m!1227215))

(assert (=> b!1338967 d!144113))

(declare-fun d!144115 () Bool)

(declare-fun lt!593813 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!662 (List!31093) (InoxSet (_ BitVec 64)))

(assert (=> d!144115 (= lt!593813 (select (content!662 Nil!31090) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!762560 () Bool)

(assert (=> d!144115 (= lt!593813 e!762560)))

(declare-fun res!888346 () Bool)

(assert (=> d!144115 (=> (not res!888346) (not e!762560))))

(assert (=> d!144115 (= res!888346 ((_ is Cons!31089) Nil!31090))))

(assert (=> d!144115 (= (contains!8993 Nil!31090 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593813)))

(declare-fun b!1339013 () Bool)

(declare-fun e!762561 () Bool)

(assert (=> b!1339013 (= e!762560 e!762561)))

(declare-fun res!888345 () Bool)

(assert (=> b!1339013 (=> res!888345 e!762561)))

(assert (=> b!1339013 (= res!888345 (= (h!32298 Nil!31090) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339014 () Bool)

(assert (=> b!1339014 (= e!762561 (contains!8993 (t!45425 Nil!31090) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144115 res!888346) b!1339013))

(assert (= (and b!1339013 (not res!888345)) b!1339014))

(declare-fun m!1227217 () Bool)

(assert (=> d!144115 m!1227217))

(declare-fun m!1227219 () Bool)

(assert (=> d!144115 m!1227219))

(declare-fun m!1227221 () Bool)

(assert (=> b!1339014 m!1227221))

(assert (=> b!1338973 d!144115))

(declare-fun d!144117 () Bool)

(assert (=> d!144117 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112948 d!144117))

(declare-fun d!144119 () Bool)

(assert (=> d!144119 (= (array_inv!33105 _values!1303) (bvsge (size!44450 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112948 d!144119))

(declare-fun d!144121 () Bool)

(assert (=> d!144121 (= (array_inv!33106 _keys!1571) (bvsge (size!44451 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112948 d!144121))

(declare-fun b!1339023 () Bool)

(declare-fun e!762569 () Bool)

(declare-fun e!762568 () Bool)

(assert (=> b!1339023 (= e!762569 e!762568)))

(declare-fun lt!593821 () (_ BitVec 64))

(assert (=> b!1339023 (= lt!593821 (select (arr!43901 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43989 0))(
  ( (Unit!43990) )
))
(declare-fun lt!593820 () Unit!43989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90888 (_ BitVec 64) (_ BitVec 32)) Unit!43989)

(assert (=> b!1339023 (= lt!593820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593821 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1339023 (arrayContainsKey!0 _keys!1571 lt!593821 #b00000000000000000000000000000000)))

(declare-fun lt!593822 () Unit!43989)

(assert (=> b!1339023 (= lt!593822 lt!593820)))

(declare-fun res!888351 () Bool)

(declare-datatypes ((SeekEntryResult!10055 0))(
  ( (MissingZero!10055 (index!42591 (_ BitVec 32))) (Found!10055 (index!42592 (_ BitVec 32))) (Intermediate!10055 (undefined!10867 Bool) (index!42593 (_ BitVec 32)) (x!119612 (_ BitVec 32))) (Undefined!10055) (MissingVacant!10055 (index!42594 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90888 (_ BitVec 32)) SeekEntryResult!10055)

(assert (=> b!1339023 (= res!888351 (= (seekEntryOrOpen!0 (select (arr!43901 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10055 #b00000000000000000000000000000000)))))

(assert (=> b!1339023 (=> (not res!888351) (not e!762568))))

(declare-fun bm!65034 () Bool)

(declare-fun call!65037 () Bool)

(assert (=> bm!65034 (= call!65037 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1339024 () Bool)

(declare-fun e!762570 () Bool)

(assert (=> b!1339024 (= e!762570 e!762569)))

(declare-fun c!126298 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1339024 (= c!126298 (validKeyInArray!0 (select (arr!43901 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1339025 () Bool)

(assert (=> b!1339025 (= e!762569 call!65037)))

(declare-fun b!1339026 () Bool)

(assert (=> b!1339026 (= e!762568 call!65037)))

(declare-fun d!144123 () Bool)

(declare-fun res!888352 () Bool)

(assert (=> d!144123 (=> res!888352 e!762570)))

(assert (=> d!144123 (= res!888352 (bvsge #b00000000000000000000000000000000 (size!44451 _keys!1571)))))

(assert (=> d!144123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762570)))

(assert (= (and d!144123 (not res!888352)) b!1339024))

(assert (= (and b!1339024 c!126298) b!1339023))

(assert (= (and b!1339024 (not c!126298)) b!1339025))

(assert (= (and b!1339023 res!888351) b!1339026))

(assert (= (or b!1339026 b!1339025) bm!65034))

(declare-fun m!1227223 () Bool)

(assert (=> b!1339023 m!1227223))

(declare-fun m!1227225 () Bool)

(assert (=> b!1339023 m!1227225))

(declare-fun m!1227227 () Bool)

(assert (=> b!1339023 m!1227227))

(assert (=> b!1339023 m!1227223))

(declare-fun m!1227229 () Bool)

(assert (=> b!1339023 m!1227229))

(declare-fun m!1227231 () Bool)

(assert (=> bm!65034 m!1227231))

(assert (=> b!1339024 m!1227223))

(assert (=> b!1339024 m!1227223))

(declare-fun m!1227233 () Bool)

(assert (=> b!1339024 m!1227233))

(assert (=> b!1338974 d!144123))

(declare-fun d!144125 () Bool)

(declare-fun lt!593823 () Bool)

(assert (=> d!144125 (= lt!593823 (select (content!662 Nil!31090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!762571 () Bool)

(assert (=> d!144125 (= lt!593823 e!762571)))

(declare-fun res!888354 () Bool)

(assert (=> d!144125 (=> (not res!888354) (not e!762571))))

(assert (=> d!144125 (= res!888354 ((_ is Cons!31089) Nil!31090))))

(assert (=> d!144125 (= (contains!8993 Nil!31090 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593823)))

(declare-fun b!1339027 () Bool)

(declare-fun e!762572 () Bool)

(assert (=> b!1339027 (= e!762571 e!762572)))

(declare-fun res!888353 () Bool)

(assert (=> b!1339027 (=> res!888353 e!762572)))

(assert (=> b!1339027 (= res!888353 (= (h!32298 Nil!31090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1339028 () Bool)

(assert (=> b!1339028 (= e!762572 (contains!8993 (t!45425 Nil!31090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144125 res!888354) b!1339027))

(assert (= (and b!1339027 (not res!888353)) b!1339028))

(assert (=> d!144125 m!1227217))

(declare-fun m!1227235 () Bool)

(assert (=> d!144125 m!1227235))

(declare-fun m!1227237 () Bool)

(assert (=> b!1339028 m!1227237))

(assert (=> b!1338975 d!144125))

(declare-fun b!1339035 () Bool)

(declare-fun e!762578 () Bool)

(assert (=> b!1339035 (= e!762578 tp_is_empty!37011)))

(declare-fun b!1339036 () Bool)

(declare-fun e!762577 () Bool)

(assert (=> b!1339036 (= e!762577 tp_is_empty!37011)))

(declare-fun mapIsEmpty!57226 () Bool)

(declare-fun mapRes!57226 () Bool)

(assert (=> mapIsEmpty!57226 mapRes!57226))

(declare-fun mapNonEmpty!57226 () Bool)

(declare-fun tp!108925 () Bool)

(assert (=> mapNonEmpty!57226 (= mapRes!57226 (and tp!108925 e!762578))))

(declare-fun mapKey!57226 () (_ BitVec 32))

(declare-fun mapRest!57226 () (Array (_ BitVec 32) ValueCell!17607))

(declare-fun mapValue!57226 () ValueCell!17607)

(assert (=> mapNonEmpty!57226 (= mapRest!57220 (store mapRest!57226 mapKey!57226 mapValue!57226))))

(declare-fun condMapEmpty!57226 () Bool)

(declare-fun mapDefault!57226 () ValueCell!17607)

(assert (=> mapNonEmpty!57220 (= condMapEmpty!57226 (= mapRest!57220 ((as const (Array (_ BitVec 32) ValueCell!17607)) mapDefault!57226)))))

(assert (=> mapNonEmpty!57220 (= tp!108919 (and e!762577 mapRes!57226))))

(assert (= (and mapNonEmpty!57220 condMapEmpty!57226) mapIsEmpty!57226))

(assert (= (and mapNonEmpty!57220 (not condMapEmpty!57226)) mapNonEmpty!57226))

(assert (= (and mapNonEmpty!57226 ((_ is ValueCellFull!17607) mapValue!57226)) b!1339035))

(assert (= (and mapNonEmpty!57220 ((_ is ValueCellFull!17607) mapDefault!57226)) b!1339036))

(declare-fun m!1227239 () Bool)

(assert (=> mapNonEmpty!57226 m!1227239))

(check-sat (not b!1339014) (not bm!65034) (not b!1339024) (not b!1339007) (not d!144125) (not b!1339008) (not mapNonEmpty!57226) (not b!1339023) tp_is_empty!37011 (not b!1339028) (not d!144115))
(check-sat)
