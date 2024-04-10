; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112836 () Bool)

(assert start!112836)

(declare-fun b_free!31065 () Bool)

(declare-fun b_next!31065 () Bool)

(assert (=> start!112836 (= b_free!31065 (not b_next!31065))))

(declare-fun tp!108845 () Bool)

(declare-fun b_and!50083 () Bool)

(assert (=> start!112836 (= tp!108845 b_and!50083)))

(declare-fun b!1338241 () Bool)

(declare-fun e!761991 () Bool)

(declare-fun tp_is_empty!36975 () Bool)

(assert (=> b!1338241 (= e!761991 tp_is_empty!36975)))

(declare-datatypes ((V!54403 0))(
  ( (V!54404 (val!18562 Int)) )
))
(declare-datatypes ((ValueCell!17589 0))(
  ( (ValueCellFull!17589 (v!21207 V!54403)) (EmptyCell!17589) )
))
(declare-datatypes ((array!90808 0))(
  ( (array!90809 (arr!43866 (Array (_ BitVec 32) ValueCell!17589)) (size!44416 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90808)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90810 0))(
  ( (array!90811 (arr!43867 (Array (_ BitVec 32) (_ BitVec 64))) (size!44417 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90810)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun zeroValue!1262 () V!54403)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun b!1338242 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54403)

(declare-fun e!761987 () Bool)

(declare-datatypes ((tuple2!23946 0))(
  ( (tuple2!23947 (_1!11984 (_ BitVec 64)) (_2!11984 V!54403)) )
))
(declare-datatypes ((List!31087 0))(
  ( (Nil!31084) (Cons!31083 (h!32292 tuple2!23946) (t!45417 List!31087)) )
))
(declare-datatypes ((ListLongMap!21603 0))(
  ( (ListLongMap!21604 (toList!10817 List!31087)) )
))
(declare-fun contains!8988 (ListLongMap!21603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5786 (array!90810 array!90808 (_ BitVec 32) (_ BitVec 32) V!54403 V!54403 (_ BitVec 32) Int) ListLongMap!21603)

(assert (=> b!1338242 (= e!761987 (not (contains!8988 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(declare-fun res!887980 () Bool)

(assert (=> start!112836 (=> (not res!887980) (not e!761987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112836 (= res!887980 (validMask!0 mask!1998))))

(assert (=> start!112836 e!761987))

(declare-fun e!761988 () Bool)

(declare-fun array_inv!33081 (array!90808) Bool)

(assert (=> start!112836 (and (array_inv!33081 _values!1320) e!761988)))

(assert (=> start!112836 true))

(declare-fun array_inv!33082 (array!90810) Bool)

(assert (=> start!112836 (array_inv!33082 _keys!1590)))

(assert (=> start!112836 tp!108845))

(assert (=> start!112836 tp_is_empty!36975))

(declare-fun mapIsEmpty!57150 () Bool)

(declare-fun mapRes!57150 () Bool)

(assert (=> mapIsEmpty!57150 mapRes!57150))

(declare-fun b!1338243 () Bool)

(declare-fun res!887973 () Bool)

(assert (=> b!1338243 (=> (not res!887973) (not e!761987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90810 (_ BitVec 32)) Bool)

(assert (=> b!1338243 (= res!887973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1338244 () Bool)

(declare-fun res!887975 () Bool)

(assert (=> b!1338244 (=> (not res!887975) (not e!761987))))

(assert (=> b!1338244 (= res!887975 (contains!8988 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1338245 () Bool)

(declare-fun e!761989 () Bool)

(assert (=> b!1338245 (= e!761988 (and e!761989 mapRes!57150))))

(declare-fun condMapEmpty!57150 () Bool)

(declare-fun mapDefault!57150 () ValueCell!17589)

(assert (=> b!1338245 (= condMapEmpty!57150 (= (arr!43866 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17589)) mapDefault!57150)))))

(declare-fun b!1338246 () Bool)

(declare-fun res!887977 () Bool)

(assert (=> b!1338246 (=> (not res!887977) (not e!761987))))

(assert (=> b!1338246 (= res!887977 (not (= (select (arr!43867 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1338247 () Bool)

(declare-fun res!887974 () Bool)

(assert (=> b!1338247 (=> (not res!887974) (not e!761987))))

(assert (=> b!1338247 (= res!887974 (and (= (size!44416 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44417 _keys!1590) (size!44416 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1338248 () Bool)

(declare-fun res!887976 () Bool)

(assert (=> b!1338248 (=> (not res!887976) (not e!761987))))

(declare-datatypes ((List!31088 0))(
  ( (Nil!31085) (Cons!31084 (h!32293 (_ BitVec 64)) (t!45418 List!31088)) )
))
(declare-fun arrayNoDuplicates!0 (array!90810 (_ BitVec 32) List!31088) Bool)

(assert (=> b!1338248 (= res!887976 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31085))))

(declare-fun b!1338249 () Bool)

(declare-fun res!887978 () Bool)

(assert (=> b!1338249 (=> (not res!887978) (not e!761987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338249 (= res!887978 (not (validKeyInArray!0 (select (arr!43867 _keys!1590) from!1980))))))

(declare-fun mapNonEmpty!57150 () Bool)

(declare-fun tp!108846 () Bool)

(assert (=> mapNonEmpty!57150 (= mapRes!57150 (and tp!108846 e!761991))))

(declare-fun mapRest!57150 () (Array (_ BitVec 32) ValueCell!17589))

(declare-fun mapKey!57150 () (_ BitVec 32))

(declare-fun mapValue!57150 () ValueCell!17589)

(assert (=> mapNonEmpty!57150 (= (arr!43866 _values!1320) (store mapRest!57150 mapKey!57150 mapValue!57150))))

(declare-fun b!1338250 () Bool)

(assert (=> b!1338250 (= e!761989 tp_is_empty!36975)))

(declare-fun b!1338251 () Bool)

(declare-fun res!887979 () Bool)

(assert (=> b!1338251 (=> (not res!887979) (not e!761987))))

(assert (=> b!1338251 (= res!887979 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112836 res!887980) b!1338247))

(assert (= (and b!1338247 res!887974) b!1338243))

(assert (= (and b!1338243 res!887973) b!1338248))

(assert (= (and b!1338248 res!887976) b!1338251))

(assert (= (and b!1338251 res!887979) b!1338244))

(assert (= (and b!1338244 res!887975) b!1338246))

(assert (= (and b!1338246 res!887977) b!1338249))

(assert (= (and b!1338249 res!887978) b!1338242))

(assert (= (and b!1338245 condMapEmpty!57150) mapIsEmpty!57150))

(assert (= (and b!1338245 (not condMapEmpty!57150)) mapNonEmpty!57150))

(get-info :version)

(assert (= (and mapNonEmpty!57150 ((_ is ValueCellFull!17589) mapValue!57150)) b!1338241))

(assert (= (and b!1338245 ((_ is ValueCellFull!17589) mapDefault!57150)) b!1338250))

(assert (= start!112836 b!1338245))

(declare-fun m!1226371 () Bool)

(assert (=> b!1338244 m!1226371))

(assert (=> b!1338244 m!1226371))

(declare-fun m!1226373 () Bool)

(assert (=> b!1338244 m!1226373))

(declare-fun m!1226375 () Bool)

(assert (=> b!1338249 m!1226375))

(assert (=> b!1338249 m!1226375))

(declare-fun m!1226377 () Bool)

(assert (=> b!1338249 m!1226377))

(declare-fun m!1226379 () Bool)

(assert (=> b!1338248 m!1226379))

(declare-fun m!1226381 () Bool)

(assert (=> b!1338243 m!1226381))

(declare-fun m!1226383 () Bool)

(assert (=> mapNonEmpty!57150 m!1226383))

(declare-fun m!1226385 () Bool)

(assert (=> start!112836 m!1226385))

(declare-fun m!1226387 () Bool)

(assert (=> start!112836 m!1226387))

(declare-fun m!1226389 () Bool)

(assert (=> start!112836 m!1226389))

(declare-fun m!1226391 () Bool)

(assert (=> b!1338242 m!1226391))

(assert (=> b!1338242 m!1226391))

(declare-fun m!1226393 () Bool)

(assert (=> b!1338242 m!1226393))

(assert (=> b!1338246 m!1226375))

(check-sat (not b!1338249) (not b!1338242) (not b!1338243) (not mapNonEmpty!57150) (not start!112836) (not b_next!31065) (not b!1338244) (not b!1338248) tp_is_empty!36975 b_and!50083)
(check-sat b_and!50083 (not b_next!31065))
(get-model)

(declare-fun b!1338295 () Bool)

(declare-fun e!762016 () Bool)

(declare-fun e!762018 () Bool)

(assert (=> b!1338295 (= e!762016 e!762018)))

(declare-fun c!126208 () Bool)

(assert (=> b!1338295 (= c!126208 (validKeyInArray!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64985 () Bool)

(declare-fun call!64988 () Bool)

(assert (=> bm!64985 (= call!64988 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126208 (Cons!31084 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) Nil!31085) Nil!31085)))))

(declare-fun d!143917 () Bool)

(declare-fun res!888012 () Bool)

(declare-fun e!762015 () Bool)

(assert (=> d!143917 (=> res!888012 e!762015)))

(assert (=> d!143917 (= res!888012 (bvsge #b00000000000000000000000000000000 (size!44417 _keys!1590)))))

(assert (=> d!143917 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31085) e!762015)))

(declare-fun b!1338296 () Bool)

(assert (=> b!1338296 (= e!762015 e!762016)))

(declare-fun res!888013 () Bool)

(assert (=> b!1338296 (=> (not res!888013) (not e!762016))))

(declare-fun e!762017 () Bool)

(assert (=> b!1338296 (= res!888013 (not e!762017))))

(declare-fun res!888011 () Bool)

(assert (=> b!1338296 (=> (not res!888011) (not e!762017))))

(assert (=> b!1338296 (= res!888011 (validKeyInArray!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338297 () Bool)

(assert (=> b!1338297 (= e!762018 call!64988)))

(declare-fun b!1338298 () Bool)

(declare-fun contains!8989 (List!31088 (_ BitVec 64)) Bool)

(assert (=> b!1338298 (= e!762017 (contains!8989 Nil!31085 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338299 () Bool)

(assert (=> b!1338299 (= e!762018 call!64988)))

(assert (= (and d!143917 (not res!888012)) b!1338296))

(assert (= (and b!1338296 res!888011) b!1338298))

(assert (= (and b!1338296 res!888013) b!1338295))

(assert (= (and b!1338295 c!126208) b!1338299))

(assert (= (and b!1338295 (not c!126208)) b!1338297))

(assert (= (or b!1338299 b!1338297) bm!64985))

(declare-fun m!1226419 () Bool)

(assert (=> b!1338295 m!1226419))

(assert (=> b!1338295 m!1226419))

(declare-fun m!1226421 () Bool)

(assert (=> b!1338295 m!1226421))

(assert (=> bm!64985 m!1226419))

(declare-fun m!1226423 () Bool)

(assert (=> bm!64985 m!1226423))

(assert (=> b!1338296 m!1226419))

(assert (=> b!1338296 m!1226419))

(assert (=> b!1338296 m!1226421))

(assert (=> b!1338298 m!1226419))

(assert (=> b!1338298 m!1226419))

(declare-fun m!1226425 () Bool)

(assert (=> b!1338298 m!1226425))

(assert (=> b!1338248 d!143917))

(declare-fun b!1338308 () Bool)

(declare-fun e!762025 () Bool)

(declare-fun e!762027 () Bool)

(assert (=> b!1338308 (= e!762025 e!762027)))

(declare-fun c!126211 () Bool)

(assert (=> b!1338308 (= c!126211 (validKeyInArray!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338309 () Bool)

(declare-fun e!762026 () Bool)

(assert (=> b!1338309 (= e!762027 e!762026)))

(declare-fun lt!593529 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593529 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43969 0))(
  ( (Unit!43970) )
))
(declare-fun lt!593528 () Unit!43969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90810 (_ BitVec 64) (_ BitVec 32)) Unit!43969)

(assert (=> b!1338309 (= lt!593528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593529 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338309 (arrayContainsKey!0 _keys!1590 lt!593529 #b00000000000000000000000000000000)))

(declare-fun lt!593527 () Unit!43969)

(assert (=> b!1338309 (= lt!593527 lt!593528)))

(declare-fun res!888019 () Bool)

(declare-datatypes ((SeekEntryResult!10051 0))(
  ( (MissingZero!10051 (index!42575 (_ BitVec 32))) (Found!10051 (index!42576 (_ BitVec 32))) (Intermediate!10051 (undefined!10863 Bool) (index!42577 (_ BitVec 32)) (x!119545 (_ BitVec 32))) (Undefined!10051) (MissingVacant!10051 (index!42578 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90810 (_ BitVec 32)) SeekEntryResult!10051)

(assert (=> b!1338309 (= res!888019 (= (seekEntryOrOpen!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10051 #b00000000000000000000000000000000)))))

(assert (=> b!1338309 (=> (not res!888019) (not e!762026))))

(declare-fun b!1338310 () Bool)

(declare-fun call!64991 () Bool)

(assert (=> b!1338310 (= e!762026 call!64991)))

(declare-fun bm!64988 () Bool)

(assert (=> bm!64988 (= call!64991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143919 () Bool)

(declare-fun res!888018 () Bool)

(assert (=> d!143919 (=> res!888018 e!762025)))

(assert (=> d!143919 (= res!888018 (bvsge #b00000000000000000000000000000000 (size!44417 _keys!1590)))))

(assert (=> d!143919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!762025)))

(declare-fun b!1338311 () Bool)

(assert (=> b!1338311 (= e!762027 call!64991)))

(assert (= (and d!143919 (not res!888018)) b!1338308))

(assert (= (and b!1338308 c!126211) b!1338309))

(assert (= (and b!1338308 (not c!126211)) b!1338311))

(assert (= (and b!1338309 res!888019) b!1338310))

(assert (= (or b!1338310 b!1338311) bm!64988))

(assert (=> b!1338308 m!1226419))

(assert (=> b!1338308 m!1226419))

(assert (=> b!1338308 m!1226421))

(assert (=> b!1338309 m!1226419))

(declare-fun m!1226427 () Bool)

(assert (=> b!1338309 m!1226427))

(declare-fun m!1226429 () Bool)

(assert (=> b!1338309 m!1226429))

(assert (=> b!1338309 m!1226419))

(declare-fun m!1226431 () Bool)

(assert (=> b!1338309 m!1226431))

(declare-fun m!1226433 () Bool)

(assert (=> bm!64988 m!1226433))

(assert (=> b!1338243 d!143919))

(declare-fun d!143921 () Bool)

(declare-fun e!762032 () Bool)

(assert (=> d!143921 e!762032))

(declare-fun res!888022 () Bool)

(assert (=> d!143921 (=> res!888022 e!762032)))

(declare-fun lt!593539 () Bool)

(assert (=> d!143921 (= res!888022 (not lt!593539))))

(declare-fun lt!593540 () Bool)

(assert (=> d!143921 (= lt!593539 lt!593540)))

(declare-fun lt!593538 () Unit!43969)

(declare-fun e!762033 () Unit!43969)

(assert (=> d!143921 (= lt!593538 e!762033)))

(declare-fun c!126214 () Bool)

(assert (=> d!143921 (= c!126214 lt!593540)))

(declare-fun containsKey!741 (List!31087 (_ BitVec 64)) Bool)

(assert (=> d!143921 (= lt!593540 (containsKey!741 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!143921 (= (contains!8988 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!593539)))

(declare-fun b!1338318 () Bool)

(declare-fun lt!593541 () Unit!43969)

(assert (=> b!1338318 (= e!762033 lt!593541)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!487 (List!31087 (_ BitVec 64)) Unit!43969)

(assert (=> b!1338318 (= lt!593541 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!771 0))(
  ( (Some!770 (v!21209 V!54403)) (None!769) )
))
(declare-fun isDefined!526 (Option!771) Bool)

(declare-fun getValueByKey!719 (List!31087 (_ BitVec 64)) Option!771)

(assert (=> b!1338318 (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1338319 () Bool)

(declare-fun Unit!43971 () Unit!43969)

(assert (=> b!1338319 (= e!762033 Unit!43971)))

(declare-fun b!1338320 () Bool)

(assert (=> b!1338320 (= e!762032 (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143921 c!126214) b!1338318))

(assert (= (and d!143921 (not c!126214)) b!1338319))

(assert (= (and d!143921 (not res!888022)) b!1338320))

(declare-fun m!1226435 () Bool)

(assert (=> d!143921 m!1226435))

(declare-fun m!1226437 () Bool)

(assert (=> b!1338318 m!1226437))

(declare-fun m!1226439 () Bool)

(assert (=> b!1338318 m!1226439))

(assert (=> b!1338318 m!1226439))

(declare-fun m!1226441 () Bool)

(assert (=> b!1338318 m!1226441))

(assert (=> b!1338320 m!1226439))

(assert (=> b!1338320 m!1226439))

(assert (=> b!1338320 m!1226441))

(assert (=> b!1338242 d!143921))

(declare-fun b!1338363 () Bool)

(declare-fun e!762068 () ListLongMap!21603)

(declare-fun call!65012 () ListLongMap!21603)

(assert (=> b!1338363 (= e!762068 call!65012)))

(declare-fun b!1338364 () Bool)

(declare-fun e!762062 () Bool)

(declare-fun lt!593589 () ListLongMap!21603)

(declare-fun apply!1036 (ListLongMap!21603 (_ BitVec 64)) V!54403)

(declare-fun get!22147 (ValueCell!17589 V!54403) V!54403)

(declare-fun dynLambda!3692 (Int (_ BitVec 64)) V!54403)

(assert (=> b!1338364 (= e!762062 (= (apply!1036 lt!593589 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22147 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338364 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44416 _values!1320)))))

(assert (=> b!1338364 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(declare-fun b!1338365 () Bool)

(declare-fun e!762064 () Bool)

(declare-fun e!762063 () Bool)

(assert (=> b!1338365 (= e!762064 e!762063)))

(declare-fun c!126228 () Bool)

(assert (=> b!1338365 (= c!126228 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338366 () Bool)

(declare-fun c!126229 () Bool)

(assert (=> b!1338366 (= c!126229 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762066 () ListLongMap!21603)

(assert (=> b!1338366 (= e!762066 e!762068)))

(declare-fun b!1338367 () Bool)

(assert (=> b!1338367 (= e!762066 call!65012)))

(declare-fun b!1338368 () Bool)

(declare-fun e!762072 () Bool)

(declare-fun e!762071 () Bool)

(assert (=> b!1338368 (= e!762072 e!762071)))

(declare-fun res!888048 () Bool)

(declare-fun call!65011 () Bool)

(assert (=> b!1338368 (= res!888048 call!65011)))

(assert (=> b!1338368 (=> (not res!888048) (not e!762071))))

(declare-fun b!1338369 () Bool)

(declare-fun e!762067 () Bool)

(assert (=> b!1338369 (= e!762067 (= (apply!1036 lt!593589 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1338370 () Bool)

(declare-fun e!762060 () ListLongMap!21603)

(declare-fun call!65009 () ListLongMap!21603)

(declare-fun +!4753 (ListLongMap!21603 tuple2!23946) ListLongMap!21603)

(assert (=> b!1338370 (= e!762060 (+!4753 call!65009 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1338372 () Bool)

(assert (=> b!1338372 (= e!762072 (not call!65011))))

(declare-fun b!1338373 () Bool)

(declare-fun e!762065 () Unit!43969)

(declare-fun Unit!43972 () Unit!43969)

(assert (=> b!1338373 (= e!762065 Unit!43972)))

(declare-fun bm!65003 () Bool)

(assert (=> bm!65003 (= call!65012 call!65009)))

(declare-fun bm!65004 () Bool)

(declare-fun call!65007 () Bool)

(assert (=> bm!65004 (= call!65007 (contains!8988 lt!593589 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!65008 () ListLongMap!21603)

(declare-fun c!126230 () Bool)

(declare-fun call!65010 () ListLongMap!21603)

(declare-fun call!65006 () ListLongMap!21603)

(declare-fun bm!65005 () Bool)

(declare-fun c!126232 () Bool)

(assert (=> bm!65005 (= call!65009 (+!4753 (ite c!126232 call!65008 (ite c!126230 call!65006 call!65010)) (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338374 () Bool)

(declare-fun e!762070 () Bool)

(assert (=> b!1338374 (= e!762070 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338375 () Bool)

(declare-fun e!762061 () Bool)

(assert (=> b!1338375 (= e!762061 e!762062)))

(declare-fun res!888045 () Bool)

(assert (=> b!1338375 (=> (not res!888045) (not e!762062))))

(assert (=> b!1338375 (= res!888045 (contains!8988 lt!593589 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338375 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(declare-fun b!1338376 () Bool)

(assert (=> b!1338376 (= e!762060 e!762066)))

(assert (=> b!1338376 (= c!126230 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338377 () Bool)

(declare-fun res!888047 () Bool)

(assert (=> b!1338377 (=> (not res!888047) (not e!762064))))

(assert (=> b!1338377 (= res!888047 e!762061)))

(declare-fun res!888043 () Bool)

(assert (=> b!1338377 (=> res!888043 e!762061)))

(assert (=> b!1338377 (= res!888043 (not e!762070))))

(declare-fun res!888041 () Bool)

(assert (=> b!1338377 (=> (not res!888041) (not e!762070))))

(assert (=> b!1338377 (= res!888041 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(declare-fun b!1338378 () Bool)

(assert (=> b!1338378 (= e!762071 (= (apply!1036 lt!593589 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1338379 () Bool)

(declare-fun e!762069 () Bool)

(assert (=> b!1338379 (= e!762069 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun d!143923 () Bool)

(assert (=> d!143923 e!762064))

(declare-fun res!888046 () Bool)

(assert (=> d!143923 (=> (not res!888046) (not e!762064))))

(assert (=> d!143923 (= res!888046 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))))

(declare-fun lt!593595 () ListLongMap!21603)

(assert (=> d!143923 (= lt!593589 lt!593595)))

(declare-fun lt!593599 () Unit!43969)

(assert (=> d!143923 (= lt!593599 e!762065)))

(declare-fun c!126231 () Bool)

(assert (=> d!143923 (= c!126231 e!762069)))

(declare-fun res!888049 () Bool)

(assert (=> d!143923 (=> (not res!888049) (not e!762069))))

(assert (=> d!143923 (= res!888049 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(assert (=> d!143923 (= lt!593595 e!762060)))

(assert (=> d!143923 (= c!126232 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143923 (validMask!0 mask!1998)))

(assert (=> d!143923 (= (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593589)))

(declare-fun b!1338371 () Bool)

(assert (=> b!1338371 (= e!762063 (not call!65007))))

(declare-fun bm!65006 () Bool)

(assert (=> bm!65006 (= call!65006 call!65008)))

(declare-fun b!1338380 () Bool)

(assert (=> b!1338380 (= e!762068 call!65010)))

(declare-fun b!1338381 () Bool)

(assert (=> b!1338381 (= e!762063 e!762067)))

(declare-fun res!888044 () Bool)

(assert (=> b!1338381 (= res!888044 call!65007)))

(assert (=> b!1338381 (=> (not res!888044) (not e!762067))))

(declare-fun bm!65007 () Bool)

(assert (=> bm!65007 (= call!65011 (contains!8988 lt!593589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65008 () Bool)

(assert (=> bm!65008 (= call!65010 call!65006)))

(declare-fun b!1338382 () Bool)

(declare-fun lt!593605 () Unit!43969)

(assert (=> b!1338382 (= e!762065 lt!593605)))

(declare-fun lt!593606 () ListLongMap!21603)

(declare-fun getCurrentListMapNoExtraKeys!6395 (array!90810 array!90808 (_ BitVec 32) (_ BitVec 32) V!54403 V!54403 (_ BitVec 32) Int) ListLongMap!21603)

(assert (=> b!1338382 (= lt!593606 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593598 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593607 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593607 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593597 () Unit!43969)

(declare-fun addStillContains!1192 (ListLongMap!21603 (_ BitVec 64) V!54403 (_ BitVec 64)) Unit!43969)

(assert (=> b!1338382 (= lt!593597 (addStillContains!1192 lt!593606 lt!593598 zeroValue!1262 lt!593607))))

(assert (=> b!1338382 (contains!8988 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262)) lt!593607)))

(declare-fun lt!593588 () Unit!43969)

(assert (=> b!1338382 (= lt!593588 lt!593597)))

(declare-fun lt!593601 () ListLongMap!21603)

(assert (=> b!1338382 (= lt!593601 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593594 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593594 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593596 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593596 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593587 () Unit!43969)

(declare-fun addApplyDifferent!578 (ListLongMap!21603 (_ BitVec 64) V!54403 (_ BitVec 64)) Unit!43969)

(assert (=> b!1338382 (= lt!593587 (addApplyDifferent!578 lt!593601 lt!593594 minValue!1262 lt!593596))))

(assert (=> b!1338382 (= (apply!1036 (+!4753 lt!593601 (tuple2!23947 lt!593594 minValue!1262)) lt!593596) (apply!1036 lt!593601 lt!593596))))

(declare-fun lt!593593 () Unit!43969)

(assert (=> b!1338382 (= lt!593593 lt!593587)))

(declare-fun lt!593603 () ListLongMap!21603)

(assert (=> b!1338382 (= lt!593603 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593586 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593602 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593602 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593600 () Unit!43969)

(assert (=> b!1338382 (= lt!593600 (addApplyDifferent!578 lt!593603 lt!593586 zeroValue!1262 lt!593602))))

(assert (=> b!1338382 (= (apply!1036 (+!4753 lt!593603 (tuple2!23947 lt!593586 zeroValue!1262)) lt!593602) (apply!1036 lt!593603 lt!593602))))

(declare-fun lt!593591 () Unit!43969)

(assert (=> b!1338382 (= lt!593591 lt!593600)))

(declare-fun lt!593592 () ListLongMap!21603)

(assert (=> b!1338382 (= lt!593592 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593590 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593590 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593604 () (_ BitVec 64))

(assert (=> b!1338382 (= lt!593604 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338382 (= lt!593605 (addApplyDifferent!578 lt!593592 lt!593590 minValue!1262 lt!593604))))

(assert (=> b!1338382 (= (apply!1036 (+!4753 lt!593592 (tuple2!23947 lt!593590 minValue!1262)) lt!593604) (apply!1036 lt!593592 lt!593604))))

(declare-fun bm!65009 () Bool)

(assert (=> bm!65009 (= call!65008 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338383 () Bool)

(declare-fun res!888042 () Bool)

(assert (=> b!1338383 (=> (not res!888042) (not e!762064))))

(assert (=> b!1338383 (= res!888042 e!762072)))

(declare-fun c!126227 () Bool)

(assert (=> b!1338383 (= c!126227 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!143923 c!126232) b!1338370))

(assert (= (and d!143923 (not c!126232)) b!1338376))

(assert (= (and b!1338376 c!126230) b!1338367))

(assert (= (and b!1338376 (not c!126230)) b!1338366))

(assert (= (and b!1338366 c!126229) b!1338363))

(assert (= (and b!1338366 (not c!126229)) b!1338380))

(assert (= (or b!1338363 b!1338380) bm!65008))

(assert (= (or b!1338367 bm!65008) bm!65006))

(assert (= (or b!1338367 b!1338363) bm!65003))

(assert (= (or b!1338370 bm!65006) bm!65009))

(assert (= (or b!1338370 bm!65003) bm!65005))

(assert (= (and d!143923 res!888049) b!1338379))

(assert (= (and d!143923 c!126231) b!1338382))

(assert (= (and d!143923 (not c!126231)) b!1338373))

(assert (= (and d!143923 res!888046) b!1338377))

(assert (= (and b!1338377 res!888041) b!1338374))

(assert (= (and b!1338377 (not res!888043)) b!1338375))

(assert (= (and b!1338375 res!888045) b!1338364))

(assert (= (and b!1338377 res!888047) b!1338383))

(assert (= (and b!1338383 c!126227) b!1338368))

(assert (= (and b!1338383 (not c!126227)) b!1338372))

(assert (= (and b!1338368 res!888048) b!1338378))

(assert (= (or b!1338368 b!1338372) bm!65007))

(assert (= (and b!1338383 res!888042) b!1338365))

(assert (= (and b!1338365 c!126228) b!1338381))

(assert (= (and b!1338365 (not c!126228)) b!1338371))

(assert (= (and b!1338381 res!888044) b!1338369))

(assert (= (or b!1338381 b!1338371) bm!65004))

(declare-fun b_lambda!24275 () Bool)

(assert (=> (not b_lambda!24275) (not b!1338364)))

(declare-fun t!45421 () Bool)

(declare-fun tb!12135 () Bool)

(assert (=> (and start!112836 (= defaultEntry!1323 defaultEntry!1323) t!45421) tb!12135))

(declare-fun result!25349 () Bool)

(assert (=> tb!12135 (= result!25349 tp_is_empty!36975)))

(assert (=> b!1338364 t!45421))

(declare-fun b_and!50087 () Bool)

(assert (= b_and!50083 (and (=> t!45421 result!25349) b_and!50087)))

(declare-fun m!1226443 () Bool)

(assert (=> bm!65009 m!1226443))

(declare-fun m!1226445 () Bool)

(assert (=> b!1338364 m!1226445))

(declare-fun m!1226447 () Bool)

(assert (=> b!1338364 m!1226447))

(declare-fun m!1226449 () Bool)

(assert (=> b!1338364 m!1226449))

(declare-fun m!1226451 () Bool)

(assert (=> b!1338364 m!1226451))

(assert (=> b!1338364 m!1226445))

(assert (=> b!1338364 m!1226447))

(declare-fun m!1226453 () Bool)

(assert (=> b!1338364 m!1226453))

(assert (=> b!1338364 m!1226449))

(declare-fun m!1226455 () Bool)

(assert (=> bm!65004 m!1226455))

(assert (=> b!1338374 m!1226449))

(assert (=> b!1338374 m!1226449))

(declare-fun m!1226457 () Bool)

(assert (=> b!1338374 m!1226457))

(declare-fun m!1226459 () Bool)

(assert (=> b!1338378 m!1226459))

(declare-fun m!1226461 () Bool)

(assert (=> b!1338382 m!1226461))

(declare-fun m!1226463 () Bool)

(assert (=> b!1338382 m!1226463))

(declare-fun m!1226465 () Bool)

(assert (=> b!1338382 m!1226465))

(declare-fun m!1226467 () Bool)

(assert (=> b!1338382 m!1226467))

(declare-fun m!1226469 () Bool)

(assert (=> b!1338382 m!1226469))

(declare-fun m!1226471 () Bool)

(assert (=> b!1338382 m!1226471))

(declare-fun m!1226473 () Bool)

(assert (=> b!1338382 m!1226473))

(declare-fun m!1226475 () Bool)

(assert (=> b!1338382 m!1226475))

(assert (=> b!1338382 m!1226465))

(declare-fun m!1226477 () Bool)

(assert (=> b!1338382 m!1226477))

(assert (=> b!1338382 m!1226443))

(assert (=> b!1338382 m!1226469))

(declare-fun m!1226479 () Bool)

(assert (=> b!1338382 m!1226479))

(declare-fun m!1226481 () Bool)

(assert (=> b!1338382 m!1226481))

(assert (=> b!1338382 m!1226449))

(assert (=> b!1338382 m!1226475))

(declare-fun m!1226483 () Bool)

(assert (=> b!1338382 m!1226483))

(declare-fun m!1226485 () Bool)

(assert (=> b!1338382 m!1226485))

(assert (=> b!1338382 m!1226461))

(declare-fun m!1226487 () Bool)

(assert (=> b!1338382 m!1226487))

(declare-fun m!1226489 () Bool)

(assert (=> b!1338382 m!1226489))

(declare-fun m!1226491 () Bool)

(assert (=> b!1338369 m!1226491))

(assert (=> d!143923 m!1226385))

(declare-fun m!1226493 () Bool)

(assert (=> bm!65005 m!1226493))

(declare-fun m!1226495 () Bool)

(assert (=> bm!65007 m!1226495))

(assert (=> b!1338375 m!1226449))

(assert (=> b!1338375 m!1226449))

(declare-fun m!1226497 () Bool)

(assert (=> b!1338375 m!1226497))

(declare-fun m!1226499 () Bool)

(assert (=> b!1338370 m!1226499))

(assert (=> b!1338379 m!1226449))

(assert (=> b!1338379 m!1226449))

(assert (=> b!1338379 m!1226457))

(assert (=> b!1338242 d!143923))

(declare-fun d!143925 () Bool)

(assert (=> d!143925 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112836 d!143925))

(declare-fun d!143927 () Bool)

(assert (=> d!143927 (= (array_inv!33081 _values!1320) (bvsge (size!44416 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112836 d!143927))

(declare-fun d!143929 () Bool)

(assert (=> d!143929 (= (array_inv!33082 _keys!1590) (bvsge (size!44417 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112836 d!143929))

(declare-fun d!143931 () Bool)

(declare-fun e!762073 () Bool)

(assert (=> d!143931 e!762073))

(declare-fun res!888050 () Bool)

(assert (=> d!143931 (=> res!888050 e!762073)))

(declare-fun lt!593609 () Bool)

(assert (=> d!143931 (= res!888050 (not lt!593609))))

(declare-fun lt!593610 () Bool)

(assert (=> d!143931 (= lt!593609 lt!593610)))

(declare-fun lt!593608 () Unit!43969)

(declare-fun e!762074 () Unit!43969)

(assert (=> d!143931 (= lt!593608 e!762074)))

(declare-fun c!126233 () Bool)

(assert (=> d!143931 (= c!126233 lt!593610)))

(assert (=> d!143931 (= lt!593610 (containsKey!741 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143931 (= (contains!8988 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593609)))

(declare-fun b!1338386 () Bool)

(declare-fun lt!593611 () Unit!43969)

(assert (=> b!1338386 (= e!762074 lt!593611)))

(assert (=> b!1338386 (= lt!593611 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1338386 (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1338387 () Bool)

(declare-fun Unit!43973 () Unit!43969)

(assert (=> b!1338387 (= e!762074 Unit!43973)))

(declare-fun b!1338388 () Bool)

(assert (=> b!1338388 (= e!762073 (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143931 c!126233) b!1338386))

(assert (= (and d!143931 (not c!126233)) b!1338387))

(assert (= (and d!143931 (not res!888050)) b!1338388))

(declare-fun m!1226501 () Bool)

(assert (=> d!143931 m!1226501))

(declare-fun m!1226503 () Bool)

(assert (=> b!1338386 m!1226503))

(declare-fun m!1226505 () Bool)

(assert (=> b!1338386 m!1226505))

(assert (=> b!1338386 m!1226505))

(declare-fun m!1226507 () Bool)

(assert (=> b!1338386 m!1226507))

(assert (=> b!1338388 m!1226505))

(assert (=> b!1338388 m!1226505))

(assert (=> b!1338388 m!1226507))

(assert (=> b!1338244 d!143931))

(declare-fun b!1338389 () Bool)

(declare-fun e!762083 () ListLongMap!21603)

(declare-fun call!65019 () ListLongMap!21603)

(assert (=> b!1338389 (= e!762083 call!65019)))

(declare-fun e!762077 () Bool)

(declare-fun lt!593615 () ListLongMap!21603)

(declare-fun b!1338390 () Bool)

(assert (=> b!1338390 (= e!762077 (= (apply!1036 lt!593615 (select (arr!43867 _keys!1590) from!1980)) (get!22147 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338390 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44416 _values!1320)))))

(assert (=> b!1338390 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)))))

(declare-fun b!1338391 () Bool)

(declare-fun e!762079 () Bool)

(declare-fun e!762078 () Bool)

(assert (=> b!1338391 (= e!762079 e!762078)))

(declare-fun c!126235 () Bool)

(assert (=> b!1338391 (= c!126235 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338392 () Bool)

(declare-fun c!126236 () Bool)

(assert (=> b!1338392 (= c!126236 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762081 () ListLongMap!21603)

(assert (=> b!1338392 (= e!762081 e!762083)))

(declare-fun b!1338393 () Bool)

(assert (=> b!1338393 (= e!762081 call!65019)))

(declare-fun b!1338394 () Bool)

(declare-fun e!762087 () Bool)

(declare-fun e!762086 () Bool)

(assert (=> b!1338394 (= e!762087 e!762086)))

(declare-fun res!888058 () Bool)

(declare-fun call!65018 () Bool)

(assert (=> b!1338394 (= res!888058 call!65018)))

(assert (=> b!1338394 (=> (not res!888058) (not e!762086))))

(declare-fun b!1338395 () Bool)

(declare-fun e!762082 () Bool)

(assert (=> b!1338395 (= e!762082 (= (apply!1036 lt!593615 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1338396 () Bool)

(declare-fun e!762075 () ListLongMap!21603)

(declare-fun call!65016 () ListLongMap!21603)

(assert (=> b!1338396 (= e!762075 (+!4753 call!65016 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1338398 () Bool)

(assert (=> b!1338398 (= e!762087 (not call!65018))))

(declare-fun b!1338399 () Bool)

(declare-fun e!762080 () Unit!43969)

(declare-fun Unit!43974 () Unit!43969)

(assert (=> b!1338399 (= e!762080 Unit!43974)))

(declare-fun bm!65010 () Bool)

(assert (=> bm!65010 (= call!65019 call!65016)))

(declare-fun bm!65011 () Bool)

(declare-fun call!65014 () Bool)

(assert (=> bm!65011 (= call!65014 (contains!8988 lt!593615 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!65017 () ListLongMap!21603)

(declare-fun call!65013 () ListLongMap!21603)

(declare-fun call!65015 () ListLongMap!21603)

(declare-fun bm!65012 () Bool)

(declare-fun c!126239 () Bool)

(declare-fun c!126237 () Bool)

(assert (=> bm!65012 (= call!65016 (+!4753 (ite c!126239 call!65015 (ite c!126237 call!65013 call!65017)) (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338400 () Bool)

(declare-fun e!762085 () Bool)

(assert (=> b!1338400 (= e!762085 (validKeyInArray!0 (select (arr!43867 _keys!1590) from!1980)))))

(declare-fun b!1338401 () Bool)

(declare-fun e!762076 () Bool)

(assert (=> b!1338401 (= e!762076 e!762077)))

(declare-fun res!888055 () Bool)

(assert (=> b!1338401 (=> (not res!888055) (not e!762077))))

(assert (=> b!1338401 (= res!888055 (contains!8988 lt!593615 (select (arr!43867 _keys!1590) from!1980)))))

(assert (=> b!1338401 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)))))

(declare-fun b!1338402 () Bool)

(assert (=> b!1338402 (= e!762075 e!762081)))

(assert (=> b!1338402 (= c!126237 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338403 () Bool)

(declare-fun res!888057 () Bool)

(assert (=> b!1338403 (=> (not res!888057) (not e!762079))))

(assert (=> b!1338403 (= res!888057 e!762076)))

(declare-fun res!888053 () Bool)

(assert (=> b!1338403 (=> res!888053 e!762076)))

(assert (=> b!1338403 (= res!888053 (not e!762085))))

(declare-fun res!888051 () Bool)

(assert (=> b!1338403 (=> (not res!888051) (not e!762085))))

(assert (=> b!1338403 (= res!888051 (bvslt from!1980 (size!44417 _keys!1590)))))

(declare-fun b!1338404 () Bool)

(assert (=> b!1338404 (= e!762086 (= (apply!1036 lt!593615 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1338405 () Bool)

(declare-fun e!762084 () Bool)

(assert (=> b!1338405 (= e!762084 (validKeyInArray!0 (select (arr!43867 _keys!1590) from!1980)))))

(declare-fun d!143933 () Bool)

(assert (=> d!143933 e!762079))

(declare-fun res!888056 () Bool)

(assert (=> d!143933 (=> (not res!888056) (not e!762079))))

(assert (=> d!143933 (= res!888056 (or (bvsge from!1980 (size!44417 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)))))))

(declare-fun lt!593621 () ListLongMap!21603)

(assert (=> d!143933 (= lt!593615 lt!593621)))

(declare-fun lt!593625 () Unit!43969)

(assert (=> d!143933 (= lt!593625 e!762080)))

(declare-fun c!126238 () Bool)

(assert (=> d!143933 (= c!126238 e!762084)))

(declare-fun res!888059 () Bool)

(assert (=> d!143933 (=> (not res!888059) (not e!762084))))

(assert (=> d!143933 (= res!888059 (bvslt from!1980 (size!44417 _keys!1590)))))

(assert (=> d!143933 (= lt!593621 e!762075)))

(assert (=> d!143933 (= c!126239 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143933 (validMask!0 mask!1998)))

(assert (=> d!143933 (= (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593615)))

(declare-fun b!1338397 () Bool)

(assert (=> b!1338397 (= e!762078 (not call!65014))))

(declare-fun bm!65013 () Bool)

(assert (=> bm!65013 (= call!65013 call!65015)))

(declare-fun b!1338406 () Bool)

(assert (=> b!1338406 (= e!762083 call!65017)))

(declare-fun b!1338407 () Bool)

(assert (=> b!1338407 (= e!762078 e!762082)))

(declare-fun res!888054 () Bool)

(assert (=> b!1338407 (= res!888054 call!65014)))

(assert (=> b!1338407 (=> (not res!888054) (not e!762082))))

(declare-fun bm!65014 () Bool)

(assert (=> bm!65014 (= call!65018 (contains!8988 lt!593615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65015 () Bool)

(assert (=> bm!65015 (= call!65017 call!65013)))

(declare-fun b!1338408 () Bool)

(declare-fun lt!593631 () Unit!43969)

(assert (=> b!1338408 (= e!762080 lt!593631)))

(declare-fun lt!593632 () ListLongMap!21603)

(assert (=> b!1338408 (= lt!593632 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593624 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593633 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593633 (select (arr!43867 _keys!1590) from!1980))))

(declare-fun lt!593623 () Unit!43969)

(assert (=> b!1338408 (= lt!593623 (addStillContains!1192 lt!593632 lt!593624 zeroValue!1262 lt!593633))))

(assert (=> b!1338408 (contains!8988 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262)) lt!593633)))

(declare-fun lt!593614 () Unit!43969)

(assert (=> b!1338408 (= lt!593614 lt!593623)))

(declare-fun lt!593627 () ListLongMap!21603)

(assert (=> b!1338408 (= lt!593627 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593620 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593620 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593622 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593622 (select (arr!43867 _keys!1590) from!1980))))

(declare-fun lt!593613 () Unit!43969)

(assert (=> b!1338408 (= lt!593613 (addApplyDifferent!578 lt!593627 lt!593620 minValue!1262 lt!593622))))

(assert (=> b!1338408 (= (apply!1036 (+!4753 lt!593627 (tuple2!23947 lt!593620 minValue!1262)) lt!593622) (apply!1036 lt!593627 lt!593622))))

(declare-fun lt!593619 () Unit!43969)

(assert (=> b!1338408 (= lt!593619 lt!593613)))

(declare-fun lt!593629 () ListLongMap!21603)

(assert (=> b!1338408 (= lt!593629 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593612 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593628 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593628 (select (arr!43867 _keys!1590) from!1980))))

(declare-fun lt!593626 () Unit!43969)

(assert (=> b!1338408 (= lt!593626 (addApplyDifferent!578 lt!593629 lt!593612 zeroValue!1262 lt!593628))))

(assert (=> b!1338408 (= (apply!1036 (+!4753 lt!593629 (tuple2!23947 lt!593612 zeroValue!1262)) lt!593628) (apply!1036 lt!593629 lt!593628))))

(declare-fun lt!593617 () Unit!43969)

(assert (=> b!1338408 (= lt!593617 lt!593626)))

(declare-fun lt!593618 () ListLongMap!21603)

(assert (=> b!1338408 (= lt!593618 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593616 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593616 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593630 () (_ BitVec 64))

(assert (=> b!1338408 (= lt!593630 (select (arr!43867 _keys!1590) from!1980))))

(assert (=> b!1338408 (= lt!593631 (addApplyDifferent!578 lt!593618 lt!593616 minValue!1262 lt!593630))))

(assert (=> b!1338408 (= (apply!1036 (+!4753 lt!593618 (tuple2!23947 lt!593616 minValue!1262)) lt!593630) (apply!1036 lt!593618 lt!593630))))

(declare-fun bm!65016 () Bool)

(assert (=> bm!65016 (= call!65015 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1338409 () Bool)

(declare-fun res!888052 () Bool)

(assert (=> b!1338409 (=> (not res!888052) (not e!762079))))

(assert (=> b!1338409 (= res!888052 e!762087)))

(declare-fun c!126234 () Bool)

(assert (=> b!1338409 (= c!126234 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!143933 c!126239) b!1338396))

(assert (= (and d!143933 (not c!126239)) b!1338402))

(assert (= (and b!1338402 c!126237) b!1338393))

(assert (= (and b!1338402 (not c!126237)) b!1338392))

(assert (= (and b!1338392 c!126236) b!1338389))

(assert (= (and b!1338392 (not c!126236)) b!1338406))

(assert (= (or b!1338389 b!1338406) bm!65015))

(assert (= (or b!1338393 bm!65015) bm!65013))

(assert (= (or b!1338393 b!1338389) bm!65010))

(assert (= (or b!1338396 bm!65013) bm!65016))

(assert (= (or b!1338396 bm!65010) bm!65012))

(assert (= (and d!143933 res!888059) b!1338405))

(assert (= (and d!143933 c!126238) b!1338408))

(assert (= (and d!143933 (not c!126238)) b!1338399))

(assert (= (and d!143933 res!888056) b!1338403))

(assert (= (and b!1338403 res!888051) b!1338400))

(assert (= (and b!1338403 (not res!888053)) b!1338401))

(assert (= (and b!1338401 res!888055) b!1338390))

(assert (= (and b!1338403 res!888057) b!1338409))

(assert (= (and b!1338409 c!126234) b!1338394))

(assert (= (and b!1338409 (not c!126234)) b!1338398))

(assert (= (and b!1338394 res!888058) b!1338404))

(assert (= (or b!1338394 b!1338398) bm!65014))

(assert (= (and b!1338409 res!888052) b!1338391))

(assert (= (and b!1338391 c!126235) b!1338407))

(assert (= (and b!1338391 (not c!126235)) b!1338397))

(assert (= (and b!1338407 res!888054) b!1338395))

(assert (= (or b!1338407 b!1338397) bm!65011))

(declare-fun b_lambda!24277 () Bool)

(assert (=> (not b_lambda!24277) (not b!1338390)))

(assert (=> b!1338390 t!45421))

(declare-fun b_and!50089 () Bool)

(assert (= b_and!50087 (and (=> t!45421 result!25349) b_and!50089)))

(declare-fun m!1226509 () Bool)

(assert (=> bm!65016 m!1226509))

(declare-fun m!1226511 () Bool)

(assert (=> b!1338390 m!1226511))

(assert (=> b!1338390 m!1226447))

(assert (=> b!1338390 m!1226375))

(declare-fun m!1226513 () Bool)

(assert (=> b!1338390 m!1226513))

(assert (=> b!1338390 m!1226511))

(assert (=> b!1338390 m!1226447))

(declare-fun m!1226515 () Bool)

(assert (=> b!1338390 m!1226515))

(assert (=> b!1338390 m!1226375))

(declare-fun m!1226517 () Bool)

(assert (=> bm!65011 m!1226517))

(assert (=> b!1338400 m!1226375))

(assert (=> b!1338400 m!1226375))

(assert (=> b!1338400 m!1226377))

(declare-fun m!1226519 () Bool)

(assert (=> b!1338404 m!1226519))

(declare-fun m!1226521 () Bool)

(assert (=> b!1338408 m!1226521))

(declare-fun m!1226523 () Bool)

(assert (=> b!1338408 m!1226523))

(declare-fun m!1226525 () Bool)

(assert (=> b!1338408 m!1226525))

(declare-fun m!1226527 () Bool)

(assert (=> b!1338408 m!1226527))

(declare-fun m!1226529 () Bool)

(assert (=> b!1338408 m!1226529))

(declare-fun m!1226531 () Bool)

(assert (=> b!1338408 m!1226531))

(declare-fun m!1226533 () Bool)

(assert (=> b!1338408 m!1226533))

(declare-fun m!1226535 () Bool)

(assert (=> b!1338408 m!1226535))

(assert (=> b!1338408 m!1226525))

(declare-fun m!1226537 () Bool)

(assert (=> b!1338408 m!1226537))

(assert (=> b!1338408 m!1226509))

(assert (=> b!1338408 m!1226529))

(declare-fun m!1226539 () Bool)

(assert (=> b!1338408 m!1226539))

(declare-fun m!1226541 () Bool)

(assert (=> b!1338408 m!1226541))

(assert (=> b!1338408 m!1226375))

(assert (=> b!1338408 m!1226535))

(declare-fun m!1226543 () Bool)

(assert (=> b!1338408 m!1226543))

(declare-fun m!1226545 () Bool)

(assert (=> b!1338408 m!1226545))

(assert (=> b!1338408 m!1226521))

(declare-fun m!1226547 () Bool)

(assert (=> b!1338408 m!1226547))

(declare-fun m!1226549 () Bool)

(assert (=> b!1338408 m!1226549))

(declare-fun m!1226551 () Bool)

(assert (=> b!1338395 m!1226551))

(assert (=> d!143933 m!1226385))

(declare-fun m!1226553 () Bool)

(assert (=> bm!65012 m!1226553))

(declare-fun m!1226555 () Bool)

(assert (=> bm!65014 m!1226555))

(assert (=> b!1338401 m!1226375))

(assert (=> b!1338401 m!1226375))

(declare-fun m!1226557 () Bool)

(assert (=> b!1338401 m!1226557))

(declare-fun m!1226559 () Bool)

(assert (=> b!1338396 m!1226559))

(assert (=> b!1338405 m!1226375))

(assert (=> b!1338405 m!1226375))

(assert (=> b!1338405 m!1226377))

(assert (=> b!1338244 d!143933))

(declare-fun d!143935 () Bool)

(assert (=> d!143935 (= (validKeyInArray!0 (select (arr!43867 _keys!1590) from!1980)) (and (not (= (select (arr!43867 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43867 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338249 d!143935))

(declare-fun b!1338417 () Bool)

(declare-fun e!762093 () Bool)

(assert (=> b!1338417 (= e!762093 tp_is_empty!36975)))

(declare-fun mapIsEmpty!57156 () Bool)

(declare-fun mapRes!57156 () Bool)

(assert (=> mapIsEmpty!57156 mapRes!57156))

(declare-fun mapNonEmpty!57156 () Bool)

(declare-fun tp!108855 () Bool)

(declare-fun e!762092 () Bool)

(assert (=> mapNonEmpty!57156 (= mapRes!57156 (and tp!108855 e!762092))))

(declare-fun mapRest!57156 () (Array (_ BitVec 32) ValueCell!17589))

(declare-fun mapValue!57156 () ValueCell!17589)

(declare-fun mapKey!57156 () (_ BitVec 32))

(assert (=> mapNonEmpty!57156 (= mapRest!57150 (store mapRest!57156 mapKey!57156 mapValue!57156))))

(declare-fun condMapEmpty!57156 () Bool)

(declare-fun mapDefault!57156 () ValueCell!17589)

(assert (=> mapNonEmpty!57150 (= condMapEmpty!57156 (= mapRest!57150 ((as const (Array (_ BitVec 32) ValueCell!17589)) mapDefault!57156)))))

(assert (=> mapNonEmpty!57150 (= tp!108846 (and e!762093 mapRes!57156))))

(declare-fun b!1338416 () Bool)

(assert (=> b!1338416 (= e!762092 tp_is_empty!36975)))

(assert (= (and mapNonEmpty!57150 condMapEmpty!57156) mapIsEmpty!57156))

(assert (= (and mapNonEmpty!57150 (not condMapEmpty!57156)) mapNonEmpty!57156))

(assert (= (and mapNonEmpty!57156 ((_ is ValueCellFull!17589) mapValue!57156)) b!1338416))

(assert (= (and mapNonEmpty!57150 ((_ is ValueCellFull!17589) mapDefault!57156)) b!1338417))

(declare-fun m!1226561 () Bool)

(assert (=> mapNonEmpty!57156 m!1226561))

(declare-fun b_lambda!24279 () Bool)

(assert (= b_lambda!24277 (or (and start!112836 b_free!31065) b_lambda!24279)))

(declare-fun b_lambda!24281 () Bool)

(assert (= b_lambda!24275 (or (and start!112836 b_free!31065) b_lambda!24281)))

(check-sat (not d!143923) (not b!1338405) (not bm!65014) (not bm!65012) (not b!1338375) (not mapNonEmpty!57156) (not b_next!31065) b_and!50089 (not b!1338404) (not bm!64985) (not b!1338364) (not b!1338379) (not bm!65005) (not b!1338298) (not d!143921) (not b!1338318) (not b!1338296) (not bm!65009) (not b!1338309) (not bm!65007) (not b!1338382) (not b!1338408) (not bm!65011) (not b!1338401) (not b!1338295) (not d!143933) (not b_lambda!24279) (not b!1338400) (not b!1338388) (not b!1338308) (not bm!64988) (not b!1338386) (not b!1338378) (not b!1338370) (not b!1338390) (not b!1338396) (not b_lambda!24281) (not b!1338320) tp_is_empty!36975 (not b!1338369) (not bm!65004) (not d!143931) (not b!1338395) (not bm!65016) (not b!1338374))
(check-sat b_and!50089 (not b_next!31065))
(get-model)

(declare-fun d!143937 () Bool)

(declare-fun e!762094 () Bool)

(assert (=> d!143937 e!762094))

(declare-fun res!888060 () Bool)

(assert (=> d!143937 (=> res!888060 e!762094)))

(declare-fun lt!593635 () Bool)

(assert (=> d!143937 (= res!888060 (not lt!593635))))

(declare-fun lt!593636 () Bool)

(assert (=> d!143937 (= lt!593635 lt!593636)))

(declare-fun lt!593634 () Unit!43969)

(declare-fun e!762095 () Unit!43969)

(assert (=> d!143937 (= lt!593634 e!762095)))

(declare-fun c!126240 () Bool)

(assert (=> d!143937 (= c!126240 lt!593636)))

(assert (=> d!143937 (= lt!593636 (containsKey!741 (toList!10817 lt!593589) (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!143937 (= (contains!8988 lt!593589 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!593635)))

(declare-fun b!1338418 () Bool)

(declare-fun lt!593637 () Unit!43969)

(assert (=> b!1338418 (= e!762095 lt!593637)))

(assert (=> b!1338418 (= lt!593637 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 lt!593589) (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338418 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593589) (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338419 () Bool)

(declare-fun Unit!43975 () Unit!43969)

(assert (=> b!1338419 (= e!762095 Unit!43975)))

(declare-fun b!1338420 () Bool)

(assert (=> b!1338420 (= e!762094 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593589) (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!143937 c!126240) b!1338418))

(assert (= (and d!143937 (not c!126240)) b!1338419))

(assert (= (and d!143937 (not res!888060)) b!1338420))

(assert (=> d!143937 m!1226449))

(declare-fun m!1226563 () Bool)

(assert (=> d!143937 m!1226563))

(assert (=> b!1338418 m!1226449))

(declare-fun m!1226565 () Bool)

(assert (=> b!1338418 m!1226565))

(assert (=> b!1338418 m!1226449))

(declare-fun m!1226567 () Bool)

(assert (=> b!1338418 m!1226567))

(assert (=> b!1338418 m!1226567))

(declare-fun m!1226569 () Bool)

(assert (=> b!1338418 m!1226569))

(assert (=> b!1338420 m!1226449))

(assert (=> b!1338420 m!1226567))

(assert (=> b!1338420 m!1226567))

(assert (=> b!1338420 m!1226569))

(assert (=> b!1338375 d!143937))

(declare-fun d!143939 () Bool)

(declare-fun res!888065 () Bool)

(declare-fun e!762100 () Bool)

(assert (=> d!143939 (=> res!888065 e!762100)))

(assert (=> d!143939 (= res!888065 (and ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143939 (= (containsKey!741 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) e!762100)))

(declare-fun b!1338425 () Bool)

(declare-fun e!762101 () Bool)

(assert (=> b!1338425 (= e!762100 e!762101)))

(declare-fun res!888066 () Bool)

(assert (=> b!1338425 (=> (not res!888066) (not e!762101))))

(assert (=> b!1338425 (= res!888066 (and (or (not ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (bvsle (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)) ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1338426 () Bool)

(assert (=> b!1338426 (= e!762101 (containsKey!741 (t!45417 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) k0!1153))))

(assert (= (and d!143939 (not res!888065)) b!1338425))

(assert (= (and b!1338425 res!888066) b!1338426))

(declare-fun m!1226571 () Bool)

(assert (=> b!1338426 m!1226571))

(assert (=> d!143921 d!143939))

(declare-fun d!143941 () Bool)

(assert (=> d!143941 (= (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338374 d!143941))

(declare-fun d!143943 () Bool)

(declare-fun e!762104 () Bool)

(assert (=> d!143943 e!762104))

(declare-fun res!888072 () Bool)

(assert (=> d!143943 (=> (not res!888072) (not e!762104))))

(declare-fun lt!593649 () ListLongMap!21603)

(assert (=> d!143943 (= res!888072 (contains!8988 lt!593649 (_1!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593648 () List!31087)

(assert (=> d!143943 (= lt!593649 (ListLongMap!21604 lt!593648))))

(declare-fun lt!593647 () Unit!43969)

(declare-fun lt!593646 () Unit!43969)

(assert (=> d!143943 (= lt!593647 lt!593646)))

(assert (=> d!143943 (= (getValueByKey!719 lt!593648 (_1!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!770 (_2!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!364 (List!31087 (_ BitVec 64) V!54403) Unit!43969)

(assert (=> d!143943 (= lt!593646 (lemmaContainsTupThenGetReturnValue!364 lt!593648 (_1!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun insertStrictlySorted!493 (List!31087 (_ BitVec 64) V!54403) List!31087)

(assert (=> d!143943 (= lt!593648 (insertStrictlySorted!493 (toList!10817 (ite c!126232 call!65008 (ite c!126230 call!65006 call!65010))) (_1!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143943 (= (+!4753 (ite c!126232 call!65008 (ite c!126230 call!65006 call!65010)) (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593649)))

(declare-fun b!1338431 () Bool)

(declare-fun res!888071 () Bool)

(assert (=> b!1338431 (=> (not res!888071) (not e!762104))))

(assert (=> b!1338431 (= res!888071 (= (getValueByKey!719 (toList!10817 lt!593649) (_1!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!770 (_2!11984 (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1338432 () Bool)

(declare-fun contains!8990 (List!31087 tuple2!23946) Bool)

(assert (=> b!1338432 (= e!762104 (contains!8990 (toList!10817 lt!593649) (ite (or c!126232 c!126230) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143943 res!888072) b!1338431))

(assert (= (and b!1338431 res!888071) b!1338432))

(declare-fun m!1226573 () Bool)

(assert (=> d!143943 m!1226573))

(declare-fun m!1226575 () Bool)

(assert (=> d!143943 m!1226575))

(declare-fun m!1226577 () Bool)

(assert (=> d!143943 m!1226577))

(declare-fun m!1226579 () Bool)

(assert (=> d!143943 m!1226579))

(declare-fun m!1226581 () Bool)

(assert (=> b!1338431 m!1226581))

(declare-fun m!1226583 () Bool)

(assert (=> b!1338432 m!1226583))

(assert (=> bm!65005 d!143943))

(assert (=> d!143923 d!143925))

(declare-fun d!143945 () Bool)

(declare-fun get!22148 (Option!771) V!54403)

(assert (=> d!143945 (= (apply!1036 lt!593589 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22148 (getValueByKey!719 (toList!10817 lt!593589) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38320 () Bool)

(assert (= bs!38320 d!143945))

(declare-fun m!1226585 () Bool)

(assert (=> bs!38320 m!1226585))

(assert (=> bs!38320 m!1226585))

(declare-fun m!1226587 () Bool)

(assert (=> bs!38320 m!1226587))

(assert (=> b!1338378 d!143945))

(declare-fun d!143947 () Bool)

(declare-fun e!762105 () Bool)

(assert (=> d!143947 e!762105))

(declare-fun res!888073 () Bool)

(assert (=> d!143947 (=> res!888073 e!762105)))

(declare-fun lt!593651 () Bool)

(assert (=> d!143947 (= res!888073 (not lt!593651))))

(declare-fun lt!593652 () Bool)

(assert (=> d!143947 (= lt!593651 lt!593652)))

(declare-fun lt!593650 () Unit!43969)

(declare-fun e!762106 () Unit!43969)

(assert (=> d!143947 (= lt!593650 e!762106)))

(declare-fun c!126241 () Bool)

(assert (=> d!143947 (= c!126241 lt!593652)))

(assert (=> d!143947 (= lt!593652 (containsKey!741 (toList!10817 lt!593615) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143947 (= (contains!8988 lt!593615 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593651)))

(declare-fun b!1338433 () Bool)

(declare-fun lt!593653 () Unit!43969)

(assert (=> b!1338433 (= e!762106 lt!593653)))

(assert (=> b!1338433 (= lt!593653 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 lt!593615) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338433 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593615) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338434 () Bool)

(declare-fun Unit!43976 () Unit!43969)

(assert (=> b!1338434 (= e!762106 Unit!43976)))

(declare-fun b!1338435 () Bool)

(assert (=> b!1338435 (= e!762105 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143947 c!126241) b!1338433))

(assert (= (and d!143947 (not c!126241)) b!1338434))

(assert (= (and d!143947 (not res!888073)) b!1338435))

(declare-fun m!1226589 () Bool)

(assert (=> d!143947 m!1226589))

(declare-fun m!1226591 () Bool)

(assert (=> b!1338433 m!1226591))

(declare-fun m!1226593 () Bool)

(assert (=> b!1338433 m!1226593))

(assert (=> b!1338433 m!1226593))

(declare-fun m!1226595 () Bool)

(assert (=> b!1338433 m!1226595))

(assert (=> b!1338435 m!1226593))

(assert (=> b!1338435 m!1226593))

(assert (=> b!1338435 m!1226595))

(assert (=> bm!65011 d!143947))

(declare-fun d!143949 () Bool)

(declare-fun e!762107 () Bool)

(assert (=> d!143949 e!762107))

(declare-fun res!888075 () Bool)

(assert (=> d!143949 (=> (not res!888075) (not e!762107))))

(declare-fun lt!593657 () ListLongMap!21603)

(assert (=> d!143949 (= res!888075 (contains!8988 lt!593657 (_1!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593656 () List!31087)

(assert (=> d!143949 (= lt!593657 (ListLongMap!21604 lt!593656))))

(declare-fun lt!593655 () Unit!43969)

(declare-fun lt!593654 () Unit!43969)

(assert (=> d!143949 (= lt!593655 lt!593654)))

(assert (=> d!143949 (= (getValueByKey!719 lt!593656 (_1!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!770 (_2!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143949 (= lt!593654 (lemmaContainsTupThenGetReturnValue!364 lt!593656 (_1!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143949 (= lt!593656 (insertStrictlySorted!493 (toList!10817 (ite c!126239 call!65015 (ite c!126237 call!65013 call!65017))) (_1!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143949 (= (+!4753 (ite c!126239 call!65015 (ite c!126237 call!65013 call!65017)) (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593657)))

(declare-fun b!1338436 () Bool)

(declare-fun res!888074 () Bool)

(assert (=> b!1338436 (=> (not res!888074) (not e!762107))))

(assert (=> b!1338436 (= res!888074 (= (getValueByKey!719 (toList!10817 lt!593657) (_1!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!770 (_2!11984 (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1338437 () Bool)

(assert (=> b!1338437 (= e!762107 (contains!8990 (toList!10817 lt!593657) (ite (or c!126239 c!126237) (tuple2!23947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143949 res!888075) b!1338436))

(assert (= (and b!1338436 res!888074) b!1338437))

(declare-fun m!1226597 () Bool)

(assert (=> d!143949 m!1226597))

(declare-fun m!1226599 () Bool)

(assert (=> d!143949 m!1226599))

(declare-fun m!1226601 () Bool)

(assert (=> d!143949 m!1226601))

(declare-fun m!1226603 () Bool)

(assert (=> d!143949 m!1226603))

(declare-fun m!1226605 () Bool)

(assert (=> b!1338436 m!1226605))

(declare-fun m!1226607 () Bool)

(assert (=> b!1338437 m!1226607))

(assert (=> bm!65012 d!143949))

(declare-fun b!1338462 () Bool)

(declare-fun e!762127 () Bool)

(declare-fun e!762123 () Bool)

(assert (=> b!1338462 (= e!762127 e!762123)))

(assert (=> b!1338462 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)))))

(declare-fun res!888087 () Bool)

(declare-fun lt!593677 () ListLongMap!21603)

(assert (=> b!1338462 (= res!888087 (contains!8988 lt!593677 (select (arr!43867 _keys!1590) from!1980)))))

(assert (=> b!1338462 (=> (not res!888087) (not e!762123))))

(declare-fun b!1338463 () Bool)

(declare-fun e!762126 () Bool)

(assert (=> b!1338463 (= e!762127 e!762126)))

(declare-fun c!126253 () Bool)

(assert (=> b!1338463 (= c!126253 (bvslt from!1980 (size!44417 _keys!1590)))))

(declare-fun b!1338464 () Bool)

(assert (=> b!1338464 (= e!762126 (= lt!593677 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun d!143951 () Bool)

(declare-fun e!762125 () Bool)

(assert (=> d!143951 e!762125))

(declare-fun res!888086 () Bool)

(assert (=> d!143951 (=> (not res!888086) (not e!762125))))

(assert (=> d!143951 (= res!888086 (not (contains!8988 lt!593677 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762128 () ListLongMap!21603)

(assert (=> d!143951 (= lt!593677 e!762128)))

(declare-fun c!126251 () Bool)

(assert (=> d!143951 (= c!126251 (bvsge from!1980 (size!44417 _keys!1590)))))

(assert (=> d!143951 (validMask!0 mask!1998)))

(assert (=> d!143951 (= (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593677)))

(declare-fun b!1338465 () Bool)

(assert (=> b!1338465 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)))))

(assert (=> b!1338465 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44416 _values!1320)))))

(assert (=> b!1338465 (= e!762123 (= (apply!1036 lt!593677 (select (arr!43867 _keys!1590) from!1980)) (get!22147 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!65022 () ListLongMap!21603)

(declare-fun bm!65019 () Bool)

(assert (=> bm!65019 (= call!65022 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338466 () Bool)

(assert (=> b!1338466 (= e!762125 e!762127)))

(declare-fun c!126250 () Bool)

(declare-fun e!762122 () Bool)

(assert (=> b!1338466 (= c!126250 e!762122)))

(declare-fun res!888085 () Bool)

(assert (=> b!1338466 (=> (not res!888085) (not e!762122))))

(assert (=> b!1338466 (= res!888085 (bvslt from!1980 (size!44417 _keys!1590)))))

(declare-fun b!1338467 () Bool)

(declare-fun e!762124 () ListLongMap!21603)

(assert (=> b!1338467 (= e!762128 e!762124)))

(declare-fun c!126252 () Bool)

(assert (=> b!1338467 (= c!126252 (validKeyInArray!0 (select (arr!43867 _keys!1590) from!1980)))))

(declare-fun b!1338468 () Bool)

(declare-fun isEmpty!1089 (ListLongMap!21603) Bool)

(assert (=> b!1338468 (= e!762126 (isEmpty!1089 lt!593677))))

(declare-fun b!1338469 () Bool)

(declare-fun lt!593676 () Unit!43969)

(declare-fun lt!593674 () Unit!43969)

(assert (=> b!1338469 (= lt!593676 lt!593674)))

(declare-fun lt!593678 () ListLongMap!21603)

(declare-fun lt!593673 () (_ BitVec 64))

(declare-fun lt!593675 () (_ BitVec 64))

(declare-fun lt!593672 () V!54403)

(assert (=> b!1338469 (not (contains!8988 (+!4753 lt!593678 (tuple2!23947 lt!593673 lt!593672)) lt!593675))))

(declare-fun addStillNotContains!500 (ListLongMap!21603 (_ BitVec 64) V!54403 (_ BitVec 64)) Unit!43969)

(assert (=> b!1338469 (= lt!593674 (addStillNotContains!500 lt!593678 lt!593673 lt!593672 lt!593675))))

(assert (=> b!1338469 (= lt!593675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338469 (= lt!593672 (get!22147 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338469 (= lt!593673 (select (arr!43867 _keys!1590) from!1980))))

(assert (=> b!1338469 (= lt!593678 call!65022)))

(assert (=> b!1338469 (= e!762124 (+!4753 call!65022 (tuple2!23947 (select (arr!43867 _keys!1590) from!1980) (get!22147 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338470 () Bool)

(assert (=> b!1338470 (= e!762122 (validKeyInArray!0 (select (arr!43867 _keys!1590) from!1980)))))

(assert (=> b!1338470 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1338471 () Bool)

(assert (=> b!1338471 (= e!762128 (ListLongMap!21604 Nil!31084))))

(declare-fun b!1338472 () Bool)

(assert (=> b!1338472 (= e!762124 call!65022)))

(declare-fun b!1338473 () Bool)

(declare-fun res!888084 () Bool)

(assert (=> b!1338473 (=> (not res!888084) (not e!762125))))

(assert (=> b!1338473 (= res!888084 (not (contains!8988 lt!593677 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143951 c!126251) b!1338471))

(assert (= (and d!143951 (not c!126251)) b!1338467))

(assert (= (and b!1338467 c!126252) b!1338469))

(assert (= (and b!1338467 (not c!126252)) b!1338472))

(assert (= (or b!1338469 b!1338472) bm!65019))

(assert (= (and d!143951 res!888086) b!1338473))

(assert (= (and b!1338473 res!888084) b!1338466))

(assert (= (and b!1338466 res!888085) b!1338470))

(assert (= (and b!1338466 c!126250) b!1338462))

(assert (= (and b!1338466 (not c!126250)) b!1338463))

(assert (= (and b!1338462 res!888087) b!1338465))

(assert (= (and b!1338463 c!126253) b!1338464))

(assert (= (and b!1338463 (not c!126253)) b!1338468))

(declare-fun b_lambda!24283 () Bool)

(assert (=> (not b_lambda!24283) (not b!1338465)))

(assert (=> b!1338465 t!45421))

(declare-fun b_and!50091 () Bool)

(assert (= b_and!50089 (and (=> t!45421 result!25349) b_and!50091)))

(declare-fun b_lambda!24285 () Bool)

(assert (=> (not b_lambda!24285) (not b!1338469)))

(assert (=> b!1338469 t!45421))

(declare-fun b_and!50093 () Bool)

(assert (= b_and!50091 (and (=> t!45421 result!25349) b_and!50093)))

(assert (=> b!1338462 m!1226375))

(assert (=> b!1338462 m!1226375))

(declare-fun m!1226609 () Bool)

(assert (=> b!1338462 m!1226609))

(declare-fun m!1226611 () Bool)

(assert (=> b!1338468 m!1226611))

(declare-fun m!1226613 () Bool)

(assert (=> b!1338473 m!1226613))

(declare-fun m!1226615 () Bool)

(assert (=> d!143951 m!1226615))

(assert (=> d!143951 m!1226385))

(assert (=> b!1338470 m!1226375))

(assert (=> b!1338470 m!1226375))

(assert (=> b!1338470 m!1226377))

(assert (=> b!1338467 m!1226375))

(assert (=> b!1338467 m!1226375))

(assert (=> b!1338467 m!1226377))

(assert (=> b!1338469 m!1226375))

(declare-fun m!1226617 () Bool)

(assert (=> b!1338469 m!1226617))

(declare-fun m!1226619 () Bool)

(assert (=> b!1338469 m!1226619))

(assert (=> b!1338469 m!1226511))

(assert (=> b!1338469 m!1226447))

(assert (=> b!1338469 m!1226511))

(assert (=> b!1338469 m!1226447))

(assert (=> b!1338469 m!1226515))

(declare-fun m!1226621 () Bool)

(assert (=> b!1338469 m!1226621))

(assert (=> b!1338469 m!1226621))

(declare-fun m!1226623 () Bool)

(assert (=> b!1338469 m!1226623))

(declare-fun m!1226625 () Bool)

(assert (=> bm!65019 m!1226625))

(assert (=> b!1338464 m!1226625))

(assert (=> b!1338465 m!1226375))

(assert (=> b!1338465 m!1226375))

(declare-fun m!1226627 () Bool)

(assert (=> b!1338465 m!1226627))

(assert (=> b!1338465 m!1226511))

(assert (=> b!1338465 m!1226447))

(assert (=> b!1338465 m!1226511))

(assert (=> b!1338465 m!1226447))

(assert (=> b!1338465 m!1226515))

(assert (=> bm!65016 d!143951))

(declare-fun d!143953 () Bool)

(declare-fun e!762129 () Bool)

(assert (=> d!143953 e!762129))

(declare-fun res!888089 () Bool)

(assert (=> d!143953 (=> (not res!888089) (not e!762129))))

(declare-fun lt!593682 () ListLongMap!21603)

(assert (=> d!143953 (= res!888089 (contains!8988 lt!593682 (_1!11984 (tuple2!23947 lt!593624 zeroValue!1262))))))

(declare-fun lt!593681 () List!31087)

(assert (=> d!143953 (= lt!593682 (ListLongMap!21604 lt!593681))))

(declare-fun lt!593680 () Unit!43969)

(declare-fun lt!593679 () Unit!43969)

(assert (=> d!143953 (= lt!593680 lt!593679)))

(assert (=> d!143953 (= (getValueByKey!719 lt!593681 (_1!11984 (tuple2!23947 lt!593624 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593624 zeroValue!1262))))))

(assert (=> d!143953 (= lt!593679 (lemmaContainsTupThenGetReturnValue!364 lt!593681 (_1!11984 (tuple2!23947 lt!593624 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593624 zeroValue!1262))))))

(assert (=> d!143953 (= lt!593681 (insertStrictlySorted!493 (toList!10817 lt!593632) (_1!11984 (tuple2!23947 lt!593624 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593624 zeroValue!1262))))))

(assert (=> d!143953 (= (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262)) lt!593682)))

(declare-fun b!1338474 () Bool)

(declare-fun res!888088 () Bool)

(assert (=> b!1338474 (=> (not res!888088) (not e!762129))))

(assert (=> b!1338474 (= res!888088 (= (getValueByKey!719 (toList!10817 lt!593682) (_1!11984 (tuple2!23947 lt!593624 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593624 zeroValue!1262)))))))

(declare-fun b!1338475 () Bool)

(assert (=> b!1338475 (= e!762129 (contains!8990 (toList!10817 lt!593682) (tuple2!23947 lt!593624 zeroValue!1262)))))

(assert (= (and d!143953 res!888089) b!1338474))

(assert (= (and b!1338474 res!888088) b!1338475))

(declare-fun m!1226629 () Bool)

(assert (=> d!143953 m!1226629))

(declare-fun m!1226631 () Bool)

(assert (=> d!143953 m!1226631))

(declare-fun m!1226633 () Bool)

(assert (=> d!143953 m!1226633))

(declare-fun m!1226635 () Bool)

(assert (=> d!143953 m!1226635))

(declare-fun m!1226637 () Bool)

(assert (=> b!1338474 m!1226637))

(declare-fun m!1226639 () Bool)

(assert (=> b!1338475 m!1226639))

(assert (=> b!1338408 d!143953))

(declare-fun d!143955 () Bool)

(assert (=> d!143955 (= (apply!1036 (+!4753 lt!593618 (tuple2!23947 lt!593616 minValue!1262)) lt!593630) (get!22148 (getValueByKey!719 (toList!10817 (+!4753 lt!593618 (tuple2!23947 lt!593616 minValue!1262))) lt!593630)))))

(declare-fun bs!38321 () Bool)

(assert (= bs!38321 d!143955))

(declare-fun m!1226641 () Bool)

(assert (=> bs!38321 m!1226641))

(assert (=> bs!38321 m!1226641))

(declare-fun m!1226643 () Bool)

(assert (=> bs!38321 m!1226643))

(assert (=> b!1338408 d!143955))

(declare-fun d!143957 () Bool)

(declare-fun e!762130 () Bool)

(assert (=> d!143957 e!762130))

(declare-fun res!888091 () Bool)

(assert (=> d!143957 (=> (not res!888091) (not e!762130))))

(declare-fun lt!593686 () ListLongMap!21603)

(assert (=> d!143957 (= res!888091 (contains!8988 lt!593686 (_1!11984 (tuple2!23947 lt!593616 minValue!1262))))))

(declare-fun lt!593685 () List!31087)

(assert (=> d!143957 (= lt!593686 (ListLongMap!21604 lt!593685))))

(declare-fun lt!593684 () Unit!43969)

(declare-fun lt!593683 () Unit!43969)

(assert (=> d!143957 (= lt!593684 lt!593683)))

(assert (=> d!143957 (= (getValueByKey!719 lt!593685 (_1!11984 (tuple2!23947 lt!593616 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593616 minValue!1262))))))

(assert (=> d!143957 (= lt!593683 (lemmaContainsTupThenGetReturnValue!364 lt!593685 (_1!11984 (tuple2!23947 lt!593616 minValue!1262)) (_2!11984 (tuple2!23947 lt!593616 minValue!1262))))))

(assert (=> d!143957 (= lt!593685 (insertStrictlySorted!493 (toList!10817 lt!593618) (_1!11984 (tuple2!23947 lt!593616 minValue!1262)) (_2!11984 (tuple2!23947 lt!593616 minValue!1262))))))

(assert (=> d!143957 (= (+!4753 lt!593618 (tuple2!23947 lt!593616 minValue!1262)) lt!593686)))

(declare-fun b!1338476 () Bool)

(declare-fun res!888090 () Bool)

(assert (=> b!1338476 (=> (not res!888090) (not e!762130))))

(assert (=> b!1338476 (= res!888090 (= (getValueByKey!719 (toList!10817 lt!593686) (_1!11984 (tuple2!23947 lt!593616 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593616 minValue!1262)))))))

(declare-fun b!1338477 () Bool)

(assert (=> b!1338477 (= e!762130 (contains!8990 (toList!10817 lt!593686) (tuple2!23947 lt!593616 minValue!1262)))))

(assert (= (and d!143957 res!888091) b!1338476))

(assert (= (and b!1338476 res!888090) b!1338477))

(declare-fun m!1226645 () Bool)

(assert (=> d!143957 m!1226645))

(declare-fun m!1226647 () Bool)

(assert (=> d!143957 m!1226647))

(declare-fun m!1226649 () Bool)

(assert (=> d!143957 m!1226649))

(declare-fun m!1226651 () Bool)

(assert (=> d!143957 m!1226651))

(declare-fun m!1226653 () Bool)

(assert (=> b!1338476 m!1226653))

(declare-fun m!1226655 () Bool)

(assert (=> b!1338477 m!1226655))

(assert (=> b!1338408 d!143957))

(declare-fun d!143959 () Bool)

(assert (=> d!143959 (= (apply!1036 (+!4753 lt!593629 (tuple2!23947 lt!593612 zeroValue!1262)) lt!593628) (get!22148 (getValueByKey!719 (toList!10817 (+!4753 lt!593629 (tuple2!23947 lt!593612 zeroValue!1262))) lt!593628)))))

(declare-fun bs!38322 () Bool)

(assert (= bs!38322 d!143959))

(declare-fun m!1226657 () Bool)

(assert (=> bs!38322 m!1226657))

(assert (=> bs!38322 m!1226657))

(declare-fun m!1226659 () Bool)

(assert (=> bs!38322 m!1226659))

(assert (=> b!1338408 d!143959))

(declare-fun d!143961 () Bool)

(assert (=> d!143961 (= (apply!1036 lt!593618 lt!593630) (get!22148 (getValueByKey!719 (toList!10817 lt!593618) lt!593630)))))

(declare-fun bs!38323 () Bool)

(assert (= bs!38323 d!143961))

(declare-fun m!1226661 () Bool)

(assert (=> bs!38323 m!1226661))

(assert (=> bs!38323 m!1226661))

(declare-fun m!1226663 () Bool)

(assert (=> bs!38323 m!1226663))

(assert (=> b!1338408 d!143961))

(declare-fun d!143963 () Bool)

(assert (=> d!143963 (= (apply!1036 (+!4753 lt!593618 (tuple2!23947 lt!593616 minValue!1262)) lt!593630) (apply!1036 lt!593618 lt!593630))))

(declare-fun lt!593689 () Unit!43969)

(declare-fun choose!1968 (ListLongMap!21603 (_ BitVec 64) V!54403 (_ BitVec 64)) Unit!43969)

(assert (=> d!143963 (= lt!593689 (choose!1968 lt!593618 lt!593616 minValue!1262 lt!593630))))

(declare-fun e!762133 () Bool)

(assert (=> d!143963 e!762133))

(declare-fun res!888094 () Bool)

(assert (=> d!143963 (=> (not res!888094) (not e!762133))))

(assert (=> d!143963 (= res!888094 (contains!8988 lt!593618 lt!593630))))

(assert (=> d!143963 (= (addApplyDifferent!578 lt!593618 lt!593616 minValue!1262 lt!593630) lt!593689)))

(declare-fun b!1338481 () Bool)

(assert (=> b!1338481 (= e!762133 (not (= lt!593630 lt!593616)))))

(assert (= (and d!143963 res!888094) b!1338481))

(declare-fun m!1226665 () Bool)

(assert (=> d!143963 m!1226665))

(declare-fun m!1226667 () Bool)

(assert (=> d!143963 m!1226667))

(assert (=> d!143963 m!1226525))

(assert (=> d!143963 m!1226527))

(assert (=> d!143963 m!1226525))

(assert (=> d!143963 m!1226539))

(assert (=> b!1338408 d!143963))

(declare-fun d!143965 () Bool)

(assert (=> d!143965 (= (apply!1036 (+!4753 lt!593627 (tuple2!23947 lt!593620 minValue!1262)) lt!593622) (get!22148 (getValueByKey!719 (toList!10817 (+!4753 lt!593627 (tuple2!23947 lt!593620 minValue!1262))) lt!593622)))))

(declare-fun bs!38324 () Bool)

(assert (= bs!38324 d!143965))

(declare-fun m!1226669 () Bool)

(assert (=> bs!38324 m!1226669))

(assert (=> bs!38324 m!1226669))

(declare-fun m!1226671 () Bool)

(assert (=> bs!38324 m!1226671))

(assert (=> b!1338408 d!143965))

(declare-fun d!143967 () Bool)

(declare-fun e!762134 () Bool)

(assert (=> d!143967 e!762134))

(declare-fun res!888095 () Bool)

(assert (=> d!143967 (=> res!888095 e!762134)))

(declare-fun lt!593691 () Bool)

(assert (=> d!143967 (= res!888095 (not lt!593691))))

(declare-fun lt!593692 () Bool)

(assert (=> d!143967 (= lt!593691 lt!593692)))

(declare-fun lt!593690 () Unit!43969)

(declare-fun e!762135 () Unit!43969)

(assert (=> d!143967 (= lt!593690 e!762135)))

(declare-fun c!126254 () Bool)

(assert (=> d!143967 (= c!126254 lt!593692)))

(assert (=> d!143967 (= lt!593692 (containsKey!741 (toList!10817 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262))) lt!593633))))

(assert (=> d!143967 (= (contains!8988 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262)) lt!593633) lt!593691)))

(declare-fun b!1338482 () Bool)

(declare-fun lt!593693 () Unit!43969)

(assert (=> b!1338482 (= e!762135 lt!593693)))

(assert (=> b!1338482 (= lt!593693 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262))) lt!593633))))

(assert (=> b!1338482 (isDefined!526 (getValueByKey!719 (toList!10817 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262))) lt!593633))))

(declare-fun b!1338483 () Bool)

(declare-fun Unit!43977 () Unit!43969)

(assert (=> b!1338483 (= e!762135 Unit!43977)))

(declare-fun b!1338484 () Bool)

(assert (=> b!1338484 (= e!762134 (isDefined!526 (getValueByKey!719 (toList!10817 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262))) lt!593633)))))

(assert (= (and d!143967 c!126254) b!1338482))

(assert (= (and d!143967 (not c!126254)) b!1338483))

(assert (= (and d!143967 (not res!888095)) b!1338484))

(declare-fun m!1226673 () Bool)

(assert (=> d!143967 m!1226673))

(declare-fun m!1226675 () Bool)

(assert (=> b!1338482 m!1226675))

(declare-fun m!1226677 () Bool)

(assert (=> b!1338482 m!1226677))

(assert (=> b!1338482 m!1226677))

(declare-fun m!1226679 () Bool)

(assert (=> b!1338482 m!1226679))

(assert (=> b!1338484 m!1226677))

(assert (=> b!1338484 m!1226677))

(assert (=> b!1338484 m!1226679))

(assert (=> b!1338408 d!143967))

(declare-fun d!143969 () Bool)

(declare-fun e!762136 () Bool)

(assert (=> d!143969 e!762136))

(declare-fun res!888097 () Bool)

(assert (=> d!143969 (=> (not res!888097) (not e!762136))))

(declare-fun lt!593697 () ListLongMap!21603)

(assert (=> d!143969 (= res!888097 (contains!8988 lt!593697 (_1!11984 (tuple2!23947 lt!593612 zeroValue!1262))))))

(declare-fun lt!593696 () List!31087)

(assert (=> d!143969 (= lt!593697 (ListLongMap!21604 lt!593696))))

(declare-fun lt!593695 () Unit!43969)

(declare-fun lt!593694 () Unit!43969)

(assert (=> d!143969 (= lt!593695 lt!593694)))

(assert (=> d!143969 (= (getValueByKey!719 lt!593696 (_1!11984 (tuple2!23947 lt!593612 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593612 zeroValue!1262))))))

(assert (=> d!143969 (= lt!593694 (lemmaContainsTupThenGetReturnValue!364 lt!593696 (_1!11984 (tuple2!23947 lt!593612 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593612 zeroValue!1262))))))

(assert (=> d!143969 (= lt!593696 (insertStrictlySorted!493 (toList!10817 lt!593629) (_1!11984 (tuple2!23947 lt!593612 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593612 zeroValue!1262))))))

(assert (=> d!143969 (= (+!4753 lt!593629 (tuple2!23947 lt!593612 zeroValue!1262)) lt!593697)))

(declare-fun b!1338485 () Bool)

(declare-fun res!888096 () Bool)

(assert (=> b!1338485 (=> (not res!888096) (not e!762136))))

(assert (=> b!1338485 (= res!888096 (= (getValueByKey!719 (toList!10817 lt!593697) (_1!11984 (tuple2!23947 lt!593612 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593612 zeroValue!1262)))))))

(declare-fun b!1338486 () Bool)

(assert (=> b!1338486 (= e!762136 (contains!8990 (toList!10817 lt!593697) (tuple2!23947 lt!593612 zeroValue!1262)))))

(assert (= (and d!143969 res!888097) b!1338485))

(assert (= (and b!1338485 res!888096) b!1338486))

(declare-fun m!1226681 () Bool)

(assert (=> d!143969 m!1226681))

(declare-fun m!1226683 () Bool)

(assert (=> d!143969 m!1226683))

(declare-fun m!1226685 () Bool)

(assert (=> d!143969 m!1226685))

(declare-fun m!1226687 () Bool)

(assert (=> d!143969 m!1226687))

(declare-fun m!1226689 () Bool)

(assert (=> b!1338485 m!1226689))

(declare-fun m!1226691 () Bool)

(assert (=> b!1338486 m!1226691))

(assert (=> b!1338408 d!143969))

(declare-fun d!143971 () Bool)

(assert (=> d!143971 (= (apply!1036 lt!593629 lt!593628) (get!22148 (getValueByKey!719 (toList!10817 lt!593629) lt!593628)))))

(declare-fun bs!38325 () Bool)

(assert (= bs!38325 d!143971))

(declare-fun m!1226693 () Bool)

(assert (=> bs!38325 m!1226693))

(assert (=> bs!38325 m!1226693))

(declare-fun m!1226695 () Bool)

(assert (=> bs!38325 m!1226695))

(assert (=> b!1338408 d!143971))

(assert (=> b!1338408 d!143951))

(declare-fun d!143973 () Bool)

(declare-fun e!762137 () Bool)

(assert (=> d!143973 e!762137))

(declare-fun res!888099 () Bool)

(assert (=> d!143973 (=> (not res!888099) (not e!762137))))

(declare-fun lt!593701 () ListLongMap!21603)

(assert (=> d!143973 (= res!888099 (contains!8988 lt!593701 (_1!11984 (tuple2!23947 lt!593620 minValue!1262))))))

(declare-fun lt!593700 () List!31087)

(assert (=> d!143973 (= lt!593701 (ListLongMap!21604 lt!593700))))

(declare-fun lt!593699 () Unit!43969)

(declare-fun lt!593698 () Unit!43969)

(assert (=> d!143973 (= lt!593699 lt!593698)))

(assert (=> d!143973 (= (getValueByKey!719 lt!593700 (_1!11984 (tuple2!23947 lt!593620 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593620 minValue!1262))))))

(assert (=> d!143973 (= lt!593698 (lemmaContainsTupThenGetReturnValue!364 lt!593700 (_1!11984 (tuple2!23947 lt!593620 minValue!1262)) (_2!11984 (tuple2!23947 lt!593620 minValue!1262))))))

(assert (=> d!143973 (= lt!593700 (insertStrictlySorted!493 (toList!10817 lt!593627) (_1!11984 (tuple2!23947 lt!593620 minValue!1262)) (_2!11984 (tuple2!23947 lt!593620 minValue!1262))))))

(assert (=> d!143973 (= (+!4753 lt!593627 (tuple2!23947 lt!593620 minValue!1262)) lt!593701)))

(declare-fun b!1338487 () Bool)

(declare-fun res!888098 () Bool)

(assert (=> b!1338487 (=> (not res!888098) (not e!762137))))

(assert (=> b!1338487 (= res!888098 (= (getValueByKey!719 (toList!10817 lt!593701) (_1!11984 (tuple2!23947 lt!593620 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593620 minValue!1262)))))))

(declare-fun b!1338488 () Bool)

(assert (=> b!1338488 (= e!762137 (contains!8990 (toList!10817 lt!593701) (tuple2!23947 lt!593620 minValue!1262)))))

(assert (= (and d!143973 res!888099) b!1338487))

(assert (= (and b!1338487 res!888098) b!1338488))

(declare-fun m!1226697 () Bool)

(assert (=> d!143973 m!1226697))

(declare-fun m!1226699 () Bool)

(assert (=> d!143973 m!1226699))

(declare-fun m!1226701 () Bool)

(assert (=> d!143973 m!1226701))

(declare-fun m!1226703 () Bool)

(assert (=> d!143973 m!1226703))

(declare-fun m!1226705 () Bool)

(assert (=> b!1338487 m!1226705))

(declare-fun m!1226707 () Bool)

(assert (=> b!1338488 m!1226707))

(assert (=> b!1338408 d!143973))

(declare-fun d!143975 () Bool)

(assert (=> d!143975 (= (apply!1036 (+!4753 lt!593629 (tuple2!23947 lt!593612 zeroValue!1262)) lt!593628) (apply!1036 lt!593629 lt!593628))))

(declare-fun lt!593702 () Unit!43969)

(assert (=> d!143975 (= lt!593702 (choose!1968 lt!593629 lt!593612 zeroValue!1262 lt!593628))))

(declare-fun e!762138 () Bool)

(assert (=> d!143975 e!762138))

(declare-fun res!888100 () Bool)

(assert (=> d!143975 (=> (not res!888100) (not e!762138))))

(assert (=> d!143975 (= res!888100 (contains!8988 lt!593629 lt!593628))))

(assert (=> d!143975 (= (addApplyDifferent!578 lt!593629 lt!593612 zeroValue!1262 lt!593628) lt!593702)))

(declare-fun b!1338489 () Bool)

(assert (=> b!1338489 (= e!762138 (not (= lt!593628 lt!593612)))))

(assert (= (and d!143975 res!888100) b!1338489))

(declare-fun m!1226709 () Bool)

(assert (=> d!143975 m!1226709))

(declare-fun m!1226711 () Bool)

(assert (=> d!143975 m!1226711))

(assert (=> d!143975 m!1226521))

(assert (=> d!143975 m!1226523))

(assert (=> d!143975 m!1226521))

(assert (=> d!143975 m!1226533))

(assert (=> b!1338408 d!143975))

(declare-fun d!143977 () Bool)

(assert (=> d!143977 (= (apply!1036 lt!593627 lt!593622) (get!22148 (getValueByKey!719 (toList!10817 lt!593627) lt!593622)))))

(declare-fun bs!38326 () Bool)

(assert (= bs!38326 d!143977))

(declare-fun m!1226713 () Bool)

(assert (=> bs!38326 m!1226713))

(assert (=> bs!38326 m!1226713))

(declare-fun m!1226715 () Bool)

(assert (=> bs!38326 m!1226715))

(assert (=> b!1338408 d!143977))

(declare-fun d!143979 () Bool)

(assert (=> d!143979 (= (apply!1036 (+!4753 lt!593627 (tuple2!23947 lt!593620 minValue!1262)) lt!593622) (apply!1036 lt!593627 lt!593622))))

(declare-fun lt!593703 () Unit!43969)

(assert (=> d!143979 (= lt!593703 (choose!1968 lt!593627 lt!593620 minValue!1262 lt!593622))))

(declare-fun e!762139 () Bool)

(assert (=> d!143979 e!762139))

(declare-fun res!888101 () Bool)

(assert (=> d!143979 (=> (not res!888101) (not e!762139))))

(assert (=> d!143979 (= res!888101 (contains!8988 lt!593627 lt!593622))))

(assert (=> d!143979 (= (addApplyDifferent!578 lt!593627 lt!593620 minValue!1262 lt!593622) lt!593703)))

(declare-fun b!1338490 () Bool)

(assert (=> b!1338490 (= e!762139 (not (= lt!593622 lt!593620)))))

(assert (= (and d!143979 res!888101) b!1338490))

(declare-fun m!1226717 () Bool)

(assert (=> d!143979 m!1226717))

(declare-fun m!1226719 () Bool)

(assert (=> d!143979 m!1226719))

(assert (=> d!143979 m!1226529))

(assert (=> d!143979 m!1226531))

(assert (=> d!143979 m!1226529))

(assert (=> d!143979 m!1226537))

(assert (=> b!1338408 d!143979))

(declare-fun d!143981 () Bool)

(assert (=> d!143981 (contains!8988 (+!4753 lt!593632 (tuple2!23947 lt!593624 zeroValue!1262)) lt!593633)))

(declare-fun lt!593706 () Unit!43969)

(declare-fun choose!1969 (ListLongMap!21603 (_ BitVec 64) V!54403 (_ BitVec 64)) Unit!43969)

(assert (=> d!143981 (= lt!593706 (choose!1969 lt!593632 lt!593624 zeroValue!1262 lt!593633))))

(assert (=> d!143981 (contains!8988 lt!593632 lt!593633)))

(assert (=> d!143981 (= (addStillContains!1192 lt!593632 lt!593624 zeroValue!1262 lt!593633) lt!593706)))

(declare-fun bs!38327 () Bool)

(assert (= bs!38327 d!143981))

(assert (=> bs!38327 m!1226535))

(assert (=> bs!38327 m!1226535))

(assert (=> bs!38327 m!1226543))

(declare-fun m!1226721 () Bool)

(assert (=> bs!38327 m!1226721))

(declare-fun m!1226723 () Bool)

(assert (=> bs!38327 m!1226723))

(assert (=> b!1338408 d!143981))

(declare-fun d!143983 () Bool)

(declare-fun isEmpty!1090 (Option!771) Bool)

(assert (=> d!143983 (= (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)) (not (isEmpty!1090 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38328 () Bool)

(assert (= bs!38328 d!143983))

(assert (=> bs!38328 m!1226439))

(declare-fun m!1226725 () Bool)

(assert (=> bs!38328 m!1226725))

(assert (=> b!1338320 d!143983))

(declare-fun b!1338501 () Bool)

(declare-fun e!762144 () Option!771)

(declare-fun e!762145 () Option!771)

(assert (=> b!1338501 (= e!762144 e!762145)))

(declare-fun c!126260 () Bool)

(assert (=> b!1338501 (= c!126260 (and ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (not (= (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1338503 () Bool)

(assert (=> b!1338503 (= e!762145 None!769)))

(declare-fun c!126259 () Bool)

(declare-fun d!143985 () Bool)

(assert (=> d!143985 (= c!126259 (and ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143985 (= (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) e!762144)))

(declare-fun b!1338502 () Bool)

(assert (=> b!1338502 (= e!762145 (getValueByKey!719 (t!45417 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) k0!1153))))

(declare-fun b!1338500 () Bool)

(assert (=> b!1338500 (= e!762144 (Some!770 (_2!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))))))

(assert (= (and d!143985 c!126259) b!1338500))

(assert (= (and d!143985 (not c!126259)) b!1338501))

(assert (= (and b!1338501 c!126260) b!1338502))

(assert (= (and b!1338501 (not c!126260)) b!1338503))

(declare-fun m!1226727 () Bool)

(assert (=> b!1338502 m!1226727))

(assert (=> b!1338320 d!143985))

(declare-fun d!143987 () Bool)

(declare-fun e!762146 () Bool)

(assert (=> d!143987 e!762146))

(declare-fun res!888103 () Bool)

(assert (=> d!143987 (=> (not res!888103) (not e!762146))))

(declare-fun lt!593710 () ListLongMap!21603)

(assert (=> d!143987 (= res!888103 (contains!8988 lt!593710 (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593709 () List!31087)

(assert (=> d!143987 (= lt!593710 (ListLongMap!21604 lt!593709))))

(declare-fun lt!593708 () Unit!43969)

(declare-fun lt!593707 () Unit!43969)

(assert (=> d!143987 (= lt!593708 lt!593707)))

(assert (=> d!143987 (= (getValueByKey!719 lt!593709 (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143987 (= lt!593707 (lemmaContainsTupThenGetReturnValue!364 lt!593709 (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143987 (= lt!593709 (insertStrictlySorted!493 (toList!10817 call!65016) (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143987 (= (+!4753 call!65016 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593710)))

(declare-fun b!1338504 () Bool)

(declare-fun res!888102 () Bool)

(assert (=> b!1338504 (=> (not res!888102) (not e!762146))))

(assert (=> b!1338504 (= res!888102 (= (getValueByKey!719 (toList!10817 lt!593710) (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1338505 () Bool)

(assert (=> b!1338505 (= e!762146 (contains!8990 (toList!10817 lt!593710) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143987 res!888103) b!1338504))

(assert (= (and b!1338504 res!888102) b!1338505))

(declare-fun m!1226729 () Bool)

(assert (=> d!143987 m!1226729))

(declare-fun m!1226731 () Bool)

(assert (=> d!143987 m!1226731))

(declare-fun m!1226733 () Bool)

(assert (=> d!143987 m!1226733))

(declare-fun m!1226735 () Bool)

(assert (=> d!143987 m!1226735))

(declare-fun m!1226737 () Bool)

(assert (=> b!1338504 m!1226737))

(declare-fun m!1226739 () Bool)

(assert (=> b!1338505 m!1226739))

(assert (=> b!1338396 d!143987))

(declare-fun d!143989 () Bool)

(declare-fun e!762147 () Bool)

(assert (=> d!143989 e!762147))

(declare-fun res!888104 () Bool)

(assert (=> d!143989 (=> res!888104 e!762147)))

(declare-fun lt!593712 () Bool)

(assert (=> d!143989 (= res!888104 (not lt!593712))))

(declare-fun lt!593713 () Bool)

(assert (=> d!143989 (= lt!593712 lt!593713)))

(declare-fun lt!593711 () Unit!43969)

(declare-fun e!762148 () Unit!43969)

(assert (=> d!143989 (= lt!593711 e!762148)))

(declare-fun c!126261 () Bool)

(assert (=> d!143989 (= c!126261 lt!593713)))

(assert (=> d!143989 (= lt!593713 (containsKey!741 (toList!10817 lt!593589) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143989 (= (contains!8988 lt!593589 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593712)))

(declare-fun b!1338506 () Bool)

(declare-fun lt!593714 () Unit!43969)

(assert (=> b!1338506 (= e!762148 lt!593714)))

(assert (=> b!1338506 (= lt!593714 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 lt!593589) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338506 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593589) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338507 () Bool)

(declare-fun Unit!43978 () Unit!43969)

(assert (=> b!1338507 (= e!762148 Unit!43978)))

(declare-fun b!1338508 () Bool)

(assert (=> b!1338508 (= e!762147 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143989 c!126261) b!1338506))

(assert (= (and d!143989 (not c!126261)) b!1338507))

(assert (= (and d!143989 (not res!888104)) b!1338508))

(declare-fun m!1226741 () Bool)

(assert (=> d!143989 m!1226741))

(declare-fun m!1226743 () Bool)

(assert (=> b!1338506 m!1226743))

(declare-fun m!1226745 () Bool)

(assert (=> b!1338506 m!1226745))

(assert (=> b!1338506 m!1226745))

(declare-fun m!1226747 () Bool)

(assert (=> b!1338506 m!1226747))

(assert (=> b!1338508 m!1226745))

(assert (=> b!1338508 m!1226745))

(assert (=> b!1338508 m!1226747))

(assert (=> bm!65004 d!143989))

(declare-fun d!143991 () Bool)

(declare-fun res!888105 () Bool)

(declare-fun e!762149 () Bool)

(assert (=> d!143991 (=> res!888105 e!762149)))

(assert (=> d!143991 (= res!888105 (and ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143991 (= (containsKey!741 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762149)))

(declare-fun b!1338509 () Bool)

(declare-fun e!762150 () Bool)

(assert (=> b!1338509 (= e!762149 e!762150)))

(declare-fun res!888106 () Bool)

(assert (=> b!1338509 (=> (not res!888106) (not e!762150))))

(assert (=> b!1338509 (= res!888106 (and (or (not ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1338510 () Bool)

(assert (=> b!1338510 (= e!762150 (containsKey!741 (t!45417 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!143991 (not res!888105)) b!1338509))

(assert (= (and b!1338509 res!888106) b!1338510))

(declare-fun m!1226749 () Bool)

(assert (=> b!1338510 m!1226749))

(assert (=> d!143931 d!143991))

(assert (=> d!143933 d!143925))

(declare-fun d!143993 () Bool)

(assert (=> d!143993 (= (apply!1036 lt!593615 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22148 (getValueByKey!719 (toList!10817 lt!593615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38329 () Bool)

(assert (= bs!38329 d!143993))

(assert (=> bs!38329 m!1226593))

(assert (=> bs!38329 m!1226593))

(declare-fun m!1226751 () Bool)

(assert (=> bs!38329 m!1226751))

(assert (=> b!1338395 d!143993))

(declare-fun d!143995 () Bool)

(assert (=> d!143995 (= (validKeyInArray!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338296 d!143995))

(declare-fun d!143997 () Bool)

(assert (=> d!143997 (= (apply!1036 (+!4753 lt!593603 (tuple2!23947 lt!593586 zeroValue!1262)) lt!593602) (apply!1036 lt!593603 lt!593602))))

(declare-fun lt!593715 () Unit!43969)

(assert (=> d!143997 (= lt!593715 (choose!1968 lt!593603 lt!593586 zeroValue!1262 lt!593602))))

(declare-fun e!762151 () Bool)

(assert (=> d!143997 e!762151))

(declare-fun res!888107 () Bool)

(assert (=> d!143997 (=> (not res!888107) (not e!762151))))

(assert (=> d!143997 (= res!888107 (contains!8988 lt!593603 lt!593602))))

(assert (=> d!143997 (= (addApplyDifferent!578 lt!593603 lt!593586 zeroValue!1262 lt!593602) lt!593715)))

(declare-fun b!1338511 () Bool)

(assert (=> b!1338511 (= e!762151 (not (= lt!593602 lt!593586)))))

(assert (= (and d!143997 res!888107) b!1338511))

(declare-fun m!1226753 () Bool)

(assert (=> d!143997 m!1226753))

(declare-fun m!1226755 () Bool)

(assert (=> d!143997 m!1226755))

(assert (=> d!143997 m!1226461))

(assert (=> d!143997 m!1226463))

(assert (=> d!143997 m!1226461))

(assert (=> d!143997 m!1226473))

(assert (=> b!1338382 d!143997))

(declare-fun d!143999 () Bool)

(assert (=> d!143999 (= (apply!1036 (+!4753 lt!593603 (tuple2!23947 lt!593586 zeroValue!1262)) lt!593602) (get!22148 (getValueByKey!719 (toList!10817 (+!4753 lt!593603 (tuple2!23947 lt!593586 zeroValue!1262))) lt!593602)))))

(declare-fun bs!38330 () Bool)

(assert (= bs!38330 d!143999))

(declare-fun m!1226757 () Bool)

(assert (=> bs!38330 m!1226757))

(assert (=> bs!38330 m!1226757))

(declare-fun m!1226759 () Bool)

(assert (=> bs!38330 m!1226759))

(assert (=> b!1338382 d!143999))

(declare-fun d!144001 () Bool)

(assert (=> d!144001 (= (apply!1036 (+!4753 lt!593592 (tuple2!23947 lt!593590 minValue!1262)) lt!593604) (get!22148 (getValueByKey!719 (toList!10817 (+!4753 lt!593592 (tuple2!23947 lt!593590 minValue!1262))) lt!593604)))))

(declare-fun bs!38331 () Bool)

(assert (= bs!38331 d!144001))

(declare-fun m!1226761 () Bool)

(assert (=> bs!38331 m!1226761))

(assert (=> bs!38331 m!1226761))

(declare-fun m!1226763 () Bool)

(assert (=> bs!38331 m!1226763))

(assert (=> b!1338382 d!144001))

(declare-fun d!144003 () Bool)

(declare-fun e!762152 () Bool)

(assert (=> d!144003 e!762152))

(declare-fun res!888109 () Bool)

(assert (=> d!144003 (=> (not res!888109) (not e!762152))))

(declare-fun lt!593719 () ListLongMap!21603)

(assert (=> d!144003 (= res!888109 (contains!8988 lt!593719 (_1!11984 (tuple2!23947 lt!593590 minValue!1262))))))

(declare-fun lt!593718 () List!31087)

(assert (=> d!144003 (= lt!593719 (ListLongMap!21604 lt!593718))))

(declare-fun lt!593717 () Unit!43969)

(declare-fun lt!593716 () Unit!43969)

(assert (=> d!144003 (= lt!593717 lt!593716)))

(assert (=> d!144003 (= (getValueByKey!719 lt!593718 (_1!11984 (tuple2!23947 lt!593590 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593590 minValue!1262))))))

(assert (=> d!144003 (= lt!593716 (lemmaContainsTupThenGetReturnValue!364 lt!593718 (_1!11984 (tuple2!23947 lt!593590 minValue!1262)) (_2!11984 (tuple2!23947 lt!593590 minValue!1262))))))

(assert (=> d!144003 (= lt!593718 (insertStrictlySorted!493 (toList!10817 lt!593592) (_1!11984 (tuple2!23947 lt!593590 minValue!1262)) (_2!11984 (tuple2!23947 lt!593590 minValue!1262))))))

(assert (=> d!144003 (= (+!4753 lt!593592 (tuple2!23947 lt!593590 minValue!1262)) lt!593719)))

(declare-fun b!1338512 () Bool)

(declare-fun res!888108 () Bool)

(assert (=> b!1338512 (=> (not res!888108) (not e!762152))))

(assert (=> b!1338512 (= res!888108 (= (getValueByKey!719 (toList!10817 lt!593719) (_1!11984 (tuple2!23947 lt!593590 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593590 minValue!1262)))))))

(declare-fun b!1338513 () Bool)

(assert (=> b!1338513 (= e!762152 (contains!8990 (toList!10817 lt!593719) (tuple2!23947 lt!593590 minValue!1262)))))

(assert (= (and d!144003 res!888109) b!1338512))

(assert (= (and b!1338512 res!888108) b!1338513))

(declare-fun m!1226765 () Bool)

(assert (=> d!144003 m!1226765))

(declare-fun m!1226767 () Bool)

(assert (=> d!144003 m!1226767))

(declare-fun m!1226769 () Bool)

(assert (=> d!144003 m!1226769))

(declare-fun m!1226771 () Bool)

(assert (=> d!144003 m!1226771))

(declare-fun m!1226773 () Bool)

(assert (=> b!1338512 m!1226773))

(declare-fun m!1226775 () Bool)

(assert (=> b!1338513 m!1226775))

(assert (=> b!1338382 d!144003))

(declare-fun d!144005 () Bool)

(declare-fun e!762153 () Bool)

(assert (=> d!144005 e!762153))

(declare-fun res!888111 () Bool)

(assert (=> d!144005 (=> (not res!888111) (not e!762153))))

(declare-fun lt!593723 () ListLongMap!21603)

(assert (=> d!144005 (= res!888111 (contains!8988 lt!593723 (_1!11984 (tuple2!23947 lt!593598 zeroValue!1262))))))

(declare-fun lt!593722 () List!31087)

(assert (=> d!144005 (= lt!593723 (ListLongMap!21604 lt!593722))))

(declare-fun lt!593721 () Unit!43969)

(declare-fun lt!593720 () Unit!43969)

(assert (=> d!144005 (= lt!593721 lt!593720)))

(assert (=> d!144005 (= (getValueByKey!719 lt!593722 (_1!11984 (tuple2!23947 lt!593598 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593598 zeroValue!1262))))))

(assert (=> d!144005 (= lt!593720 (lemmaContainsTupThenGetReturnValue!364 lt!593722 (_1!11984 (tuple2!23947 lt!593598 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593598 zeroValue!1262))))))

(assert (=> d!144005 (= lt!593722 (insertStrictlySorted!493 (toList!10817 lt!593606) (_1!11984 (tuple2!23947 lt!593598 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593598 zeroValue!1262))))))

(assert (=> d!144005 (= (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262)) lt!593723)))

(declare-fun b!1338514 () Bool)

(declare-fun res!888110 () Bool)

(assert (=> b!1338514 (=> (not res!888110) (not e!762153))))

(assert (=> b!1338514 (= res!888110 (= (getValueByKey!719 (toList!10817 lt!593723) (_1!11984 (tuple2!23947 lt!593598 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593598 zeroValue!1262)))))))

(declare-fun b!1338515 () Bool)

(assert (=> b!1338515 (= e!762153 (contains!8990 (toList!10817 lt!593723) (tuple2!23947 lt!593598 zeroValue!1262)))))

(assert (= (and d!144005 res!888111) b!1338514))

(assert (= (and b!1338514 res!888110) b!1338515))

(declare-fun m!1226777 () Bool)

(assert (=> d!144005 m!1226777))

(declare-fun m!1226779 () Bool)

(assert (=> d!144005 m!1226779))

(declare-fun m!1226781 () Bool)

(assert (=> d!144005 m!1226781))

(declare-fun m!1226783 () Bool)

(assert (=> d!144005 m!1226783))

(declare-fun m!1226785 () Bool)

(assert (=> b!1338514 m!1226785))

(declare-fun m!1226787 () Bool)

(assert (=> b!1338515 m!1226787))

(assert (=> b!1338382 d!144005))

(declare-fun d!144007 () Bool)

(assert (=> d!144007 (= (apply!1036 lt!593601 lt!593596) (get!22148 (getValueByKey!719 (toList!10817 lt!593601) lt!593596)))))

(declare-fun bs!38332 () Bool)

(assert (= bs!38332 d!144007))

(declare-fun m!1226789 () Bool)

(assert (=> bs!38332 m!1226789))

(assert (=> bs!38332 m!1226789))

(declare-fun m!1226791 () Bool)

(assert (=> bs!38332 m!1226791))

(assert (=> b!1338382 d!144007))

(declare-fun d!144009 () Bool)

(assert (=> d!144009 (= (apply!1036 lt!593592 lt!593604) (get!22148 (getValueByKey!719 (toList!10817 lt!593592) lt!593604)))))

(declare-fun bs!38333 () Bool)

(assert (= bs!38333 d!144009))

(declare-fun m!1226793 () Bool)

(assert (=> bs!38333 m!1226793))

(assert (=> bs!38333 m!1226793))

(declare-fun m!1226795 () Bool)

(assert (=> bs!38333 m!1226795))

(assert (=> b!1338382 d!144009))

(declare-fun d!144011 () Bool)

(declare-fun e!762154 () Bool)

(assert (=> d!144011 e!762154))

(declare-fun res!888113 () Bool)

(assert (=> d!144011 (=> (not res!888113) (not e!762154))))

(declare-fun lt!593727 () ListLongMap!21603)

(assert (=> d!144011 (= res!888113 (contains!8988 lt!593727 (_1!11984 (tuple2!23947 lt!593594 minValue!1262))))))

(declare-fun lt!593726 () List!31087)

(assert (=> d!144011 (= lt!593727 (ListLongMap!21604 lt!593726))))

(declare-fun lt!593725 () Unit!43969)

(declare-fun lt!593724 () Unit!43969)

(assert (=> d!144011 (= lt!593725 lt!593724)))

(assert (=> d!144011 (= (getValueByKey!719 lt!593726 (_1!11984 (tuple2!23947 lt!593594 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593594 minValue!1262))))))

(assert (=> d!144011 (= lt!593724 (lemmaContainsTupThenGetReturnValue!364 lt!593726 (_1!11984 (tuple2!23947 lt!593594 minValue!1262)) (_2!11984 (tuple2!23947 lt!593594 minValue!1262))))))

(assert (=> d!144011 (= lt!593726 (insertStrictlySorted!493 (toList!10817 lt!593601) (_1!11984 (tuple2!23947 lt!593594 minValue!1262)) (_2!11984 (tuple2!23947 lt!593594 minValue!1262))))))

(assert (=> d!144011 (= (+!4753 lt!593601 (tuple2!23947 lt!593594 minValue!1262)) lt!593727)))

(declare-fun b!1338516 () Bool)

(declare-fun res!888112 () Bool)

(assert (=> b!1338516 (=> (not res!888112) (not e!762154))))

(assert (=> b!1338516 (= res!888112 (= (getValueByKey!719 (toList!10817 lt!593727) (_1!11984 (tuple2!23947 lt!593594 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593594 minValue!1262)))))))

(declare-fun b!1338517 () Bool)

(assert (=> b!1338517 (= e!762154 (contains!8990 (toList!10817 lt!593727) (tuple2!23947 lt!593594 minValue!1262)))))

(assert (= (and d!144011 res!888113) b!1338516))

(assert (= (and b!1338516 res!888112) b!1338517))

(declare-fun m!1226797 () Bool)

(assert (=> d!144011 m!1226797))

(declare-fun m!1226799 () Bool)

(assert (=> d!144011 m!1226799))

(declare-fun m!1226801 () Bool)

(assert (=> d!144011 m!1226801))

(declare-fun m!1226803 () Bool)

(assert (=> d!144011 m!1226803))

(declare-fun m!1226805 () Bool)

(assert (=> b!1338516 m!1226805))

(declare-fun m!1226807 () Bool)

(assert (=> b!1338517 m!1226807))

(assert (=> b!1338382 d!144011))

(declare-fun d!144013 () Bool)

(assert (=> d!144013 (contains!8988 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262)) lt!593607)))

(declare-fun lt!593728 () Unit!43969)

(assert (=> d!144013 (= lt!593728 (choose!1969 lt!593606 lt!593598 zeroValue!1262 lt!593607))))

(assert (=> d!144013 (contains!8988 lt!593606 lt!593607)))

(assert (=> d!144013 (= (addStillContains!1192 lt!593606 lt!593598 zeroValue!1262 lt!593607) lt!593728)))

(declare-fun bs!38334 () Bool)

(assert (= bs!38334 d!144013))

(assert (=> bs!38334 m!1226475))

(assert (=> bs!38334 m!1226475))

(assert (=> bs!38334 m!1226483))

(declare-fun m!1226809 () Bool)

(assert (=> bs!38334 m!1226809))

(declare-fun m!1226811 () Bool)

(assert (=> bs!38334 m!1226811))

(assert (=> b!1338382 d!144013))

(declare-fun d!144015 () Bool)

(declare-fun e!762155 () Bool)

(assert (=> d!144015 e!762155))

(declare-fun res!888114 () Bool)

(assert (=> d!144015 (=> res!888114 e!762155)))

(declare-fun lt!593730 () Bool)

(assert (=> d!144015 (= res!888114 (not lt!593730))))

(declare-fun lt!593731 () Bool)

(assert (=> d!144015 (= lt!593730 lt!593731)))

(declare-fun lt!593729 () Unit!43969)

(declare-fun e!762156 () Unit!43969)

(assert (=> d!144015 (= lt!593729 e!762156)))

(declare-fun c!126262 () Bool)

(assert (=> d!144015 (= c!126262 lt!593731)))

(assert (=> d!144015 (= lt!593731 (containsKey!741 (toList!10817 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262))) lt!593607))))

(assert (=> d!144015 (= (contains!8988 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262)) lt!593607) lt!593730)))

(declare-fun b!1338518 () Bool)

(declare-fun lt!593732 () Unit!43969)

(assert (=> b!1338518 (= e!762156 lt!593732)))

(assert (=> b!1338518 (= lt!593732 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262))) lt!593607))))

(assert (=> b!1338518 (isDefined!526 (getValueByKey!719 (toList!10817 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262))) lt!593607))))

(declare-fun b!1338519 () Bool)

(declare-fun Unit!43979 () Unit!43969)

(assert (=> b!1338519 (= e!762156 Unit!43979)))

(declare-fun b!1338520 () Bool)

(assert (=> b!1338520 (= e!762155 (isDefined!526 (getValueByKey!719 (toList!10817 (+!4753 lt!593606 (tuple2!23947 lt!593598 zeroValue!1262))) lt!593607)))))

(assert (= (and d!144015 c!126262) b!1338518))

(assert (= (and d!144015 (not c!126262)) b!1338519))

(assert (= (and d!144015 (not res!888114)) b!1338520))

(declare-fun m!1226813 () Bool)

(assert (=> d!144015 m!1226813))

(declare-fun m!1226815 () Bool)

(assert (=> b!1338518 m!1226815))

(declare-fun m!1226817 () Bool)

(assert (=> b!1338518 m!1226817))

(assert (=> b!1338518 m!1226817))

(declare-fun m!1226819 () Bool)

(assert (=> b!1338518 m!1226819))

(assert (=> b!1338520 m!1226817))

(assert (=> b!1338520 m!1226817))

(assert (=> b!1338520 m!1226819))

(assert (=> b!1338382 d!144015))

(declare-fun d!144017 () Bool)

(assert (=> d!144017 (= (apply!1036 (+!4753 lt!593601 (tuple2!23947 lt!593594 minValue!1262)) lt!593596) (get!22148 (getValueByKey!719 (toList!10817 (+!4753 lt!593601 (tuple2!23947 lt!593594 minValue!1262))) lt!593596)))))

(declare-fun bs!38335 () Bool)

(assert (= bs!38335 d!144017))

(declare-fun m!1226821 () Bool)

(assert (=> bs!38335 m!1226821))

(assert (=> bs!38335 m!1226821))

(declare-fun m!1226823 () Bool)

(assert (=> bs!38335 m!1226823))

(assert (=> b!1338382 d!144017))

(declare-fun d!144019 () Bool)

(assert (=> d!144019 (= (apply!1036 (+!4753 lt!593592 (tuple2!23947 lt!593590 minValue!1262)) lt!593604) (apply!1036 lt!593592 lt!593604))))

(declare-fun lt!593733 () Unit!43969)

(assert (=> d!144019 (= lt!593733 (choose!1968 lt!593592 lt!593590 minValue!1262 lt!593604))))

(declare-fun e!762157 () Bool)

(assert (=> d!144019 e!762157))

(declare-fun res!888115 () Bool)

(assert (=> d!144019 (=> (not res!888115) (not e!762157))))

(assert (=> d!144019 (= res!888115 (contains!8988 lt!593592 lt!593604))))

(assert (=> d!144019 (= (addApplyDifferent!578 lt!593592 lt!593590 minValue!1262 lt!593604) lt!593733)))

(declare-fun b!1338521 () Bool)

(assert (=> b!1338521 (= e!762157 (not (= lt!593604 lt!593590)))))

(assert (= (and d!144019 res!888115) b!1338521))

(declare-fun m!1226825 () Bool)

(assert (=> d!144019 m!1226825))

(declare-fun m!1226827 () Bool)

(assert (=> d!144019 m!1226827))

(assert (=> d!144019 m!1226465))

(assert (=> d!144019 m!1226467))

(assert (=> d!144019 m!1226465))

(assert (=> d!144019 m!1226479))

(assert (=> b!1338382 d!144019))

(declare-fun d!144021 () Bool)

(assert (=> d!144021 (= (apply!1036 (+!4753 lt!593601 (tuple2!23947 lt!593594 minValue!1262)) lt!593596) (apply!1036 lt!593601 lt!593596))))

(declare-fun lt!593734 () Unit!43969)

(assert (=> d!144021 (= lt!593734 (choose!1968 lt!593601 lt!593594 minValue!1262 lt!593596))))

(declare-fun e!762158 () Bool)

(assert (=> d!144021 e!762158))

(declare-fun res!888116 () Bool)

(assert (=> d!144021 (=> (not res!888116) (not e!762158))))

(assert (=> d!144021 (= res!888116 (contains!8988 lt!593601 lt!593596))))

(assert (=> d!144021 (= (addApplyDifferent!578 lt!593601 lt!593594 minValue!1262 lt!593596) lt!593734)))

(declare-fun b!1338522 () Bool)

(assert (=> b!1338522 (= e!762158 (not (= lt!593596 lt!593594)))))

(assert (= (and d!144021 res!888116) b!1338522))

(declare-fun m!1226829 () Bool)

(assert (=> d!144021 m!1226829))

(declare-fun m!1226831 () Bool)

(assert (=> d!144021 m!1226831))

(assert (=> d!144021 m!1226469))

(assert (=> d!144021 m!1226471))

(assert (=> d!144021 m!1226469))

(assert (=> d!144021 m!1226477))

(assert (=> b!1338382 d!144021))

(declare-fun d!144023 () Bool)

(declare-fun e!762159 () Bool)

(assert (=> d!144023 e!762159))

(declare-fun res!888118 () Bool)

(assert (=> d!144023 (=> (not res!888118) (not e!762159))))

(declare-fun lt!593738 () ListLongMap!21603)

(assert (=> d!144023 (= res!888118 (contains!8988 lt!593738 (_1!11984 (tuple2!23947 lt!593586 zeroValue!1262))))))

(declare-fun lt!593737 () List!31087)

(assert (=> d!144023 (= lt!593738 (ListLongMap!21604 lt!593737))))

(declare-fun lt!593736 () Unit!43969)

(declare-fun lt!593735 () Unit!43969)

(assert (=> d!144023 (= lt!593736 lt!593735)))

(assert (=> d!144023 (= (getValueByKey!719 lt!593737 (_1!11984 (tuple2!23947 lt!593586 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593586 zeroValue!1262))))))

(assert (=> d!144023 (= lt!593735 (lemmaContainsTupThenGetReturnValue!364 lt!593737 (_1!11984 (tuple2!23947 lt!593586 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593586 zeroValue!1262))))))

(assert (=> d!144023 (= lt!593737 (insertStrictlySorted!493 (toList!10817 lt!593603) (_1!11984 (tuple2!23947 lt!593586 zeroValue!1262)) (_2!11984 (tuple2!23947 lt!593586 zeroValue!1262))))))

(assert (=> d!144023 (= (+!4753 lt!593603 (tuple2!23947 lt!593586 zeroValue!1262)) lt!593738)))

(declare-fun b!1338523 () Bool)

(declare-fun res!888117 () Bool)

(assert (=> b!1338523 (=> (not res!888117) (not e!762159))))

(assert (=> b!1338523 (= res!888117 (= (getValueByKey!719 (toList!10817 lt!593738) (_1!11984 (tuple2!23947 lt!593586 zeroValue!1262))) (Some!770 (_2!11984 (tuple2!23947 lt!593586 zeroValue!1262)))))))

(declare-fun b!1338524 () Bool)

(assert (=> b!1338524 (= e!762159 (contains!8990 (toList!10817 lt!593738) (tuple2!23947 lt!593586 zeroValue!1262)))))

(assert (= (and d!144023 res!888118) b!1338523))

(assert (= (and b!1338523 res!888117) b!1338524))

(declare-fun m!1226833 () Bool)

(assert (=> d!144023 m!1226833))

(declare-fun m!1226835 () Bool)

(assert (=> d!144023 m!1226835))

(declare-fun m!1226837 () Bool)

(assert (=> d!144023 m!1226837))

(declare-fun m!1226839 () Bool)

(assert (=> d!144023 m!1226839))

(declare-fun m!1226841 () Bool)

(assert (=> b!1338523 m!1226841))

(declare-fun m!1226843 () Bool)

(assert (=> b!1338524 m!1226843))

(assert (=> b!1338382 d!144023))

(declare-fun d!144025 () Bool)

(assert (=> d!144025 (= (apply!1036 lt!593603 lt!593602) (get!22148 (getValueByKey!719 (toList!10817 lt!593603) lt!593602)))))

(declare-fun bs!38336 () Bool)

(assert (= bs!38336 d!144025))

(declare-fun m!1226845 () Bool)

(assert (=> bs!38336 m!1226845))

(assert (=> bs!38336 m!1226845))

(declare-fun m!1226847 () Bool)

(assert (=> bs!38336 m!1226847))

(assert (=> b!1338382 d!144025))

(declare-fun b!1338525 () Bool)

(declare-fun e!762165 () Bool)

(declare-fun e!762161 () Bool)

(assert (=> b!1338525 (= e!762165 e!762161)))

(assert (=> b!1338525 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(declare-fun res!888122 () Bool)

(declare-fun lt!593744 () ListLongMap!21603)

(assert (=> b!1338525 (= res!888122 (contains!8988 lt!593744 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338525 (=> (not res!888122) (not e!762161))))

(declare-fun b!1338526 () Bool)

(declare-fun e!762164 () Bool)

(assert (=> b!1338526 (= e!762165 e!762164)))

(declare-fun c!126266 () Bool)

(assert (=> b!1338526 (= c!126266 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(declare-fun b!1338527 () Bool)

(assert (=> b!1338527 (= e!762164 (= lt!593744 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun d!144027 () Bool)

(declare-fun e!762163 () Bool)

(assert (=> d!144027 e!762163))

(declare-fun res!888121 () Bool)

(assert (=> d!144027 (=> (not res!888121) (not e!762163))))

(assert (=> d!144027 (= res!888121 (not (contains!8988 lt!593744 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762166 () ListLongMap!21603)

(assert (=> d!144027 (= lt!593744 e!762166)))

(declare-fun c!126264 () Bool)

(assert (=> d!144027 (= c!126264 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(assert (=> d!144027 (validMask!0 mask!1998)))

(assert (=> d!144027 (= (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593744)))

(declare-fun b!1338528 () Bool)

(assert (=> b!1338528 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(assert (=> b!1338528 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44416 _values!1320)))))

(assert (=> b!1338528 (= e!762161 (= (apply!1036 lt!593744 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22147 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!65020 () Bool)

(declare-fun call!65023 () ListLongMap!21603)

(assert (=> bm!65020 (= call!65023 (getCurrentListMapNoExtraKeys!6395 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338529 () Bool)

(assert (=> b!1338529 (= e!762163 e!762165)))

(declare-fun c!126263 () Bool)

(declare-fun e!762160 () Bool)

(assert (=> b!1338529 (= c!126263 e!762160)))

(declare-fun res!888120 () Bool)

(assert (=> b!1338529 (=> (not res!888120) (not e!762160))))

(assert (=> b!1338529 (= res!888120 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44417 _keys!1590)))))

(declare-fun b!1338530 () Bool)

(declare-fun e!762162 () ListLongMap!21603)

(assert (=> b!1338530 (= e!762166 e!762162)))

(declare-fun c!126265 () Bool)

(assert (=> b!1338530 (= c!126265 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338531 () Bool)

(assert (=> b!1338531 (= e!762164 (isEmpty!1089 lt!593744))))

(declare-fun b!1338532 () Bool)

(declare-fun lt!593743 () Unit!43969)

(declare-fun lt!593741 () Unit!43969)

(assert (=> b!1338532 (= lt!593743 lt!593741)))

(declare-fun lt!593745 () ListLongMap!21603)

(declare-fun lt!593740 () (_ BitVec 64))

(declare-fun lt!593742 () (_ BitVec 64))

(declare-fun lt!593739 () V!54403)

(assert (=> b!1338532 (not (contains!8988 (+!4753 lt!593745 (tuple2!23947 lt!593740 lt!593739)) lt!593742))))

(assert (=> b!1338532 (= lt!593741 (addStillNotContains!500 lt!593745 lt!593740 lt!593739 lt!593742))))

(assert (=> b!1338532 (= lt!593742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338532 (= lt!593739 (get!22147 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338532 (= lt!593740 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338532 (= lt!593745 call!65023)))

(assert (=> b!1338532 (= e!762162 (+!4753 call!65023 (tuple2!23947 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22147 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338533 () Bool)

(assert (=> b!1338533 (= e!762160 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338533 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1338534 () Bool)

(assert (=> b!1338534 (= e!762166 (ListLongMap!21604 Nil!31084))))

(declare-fun b!1338535 () Bool)

(assert (=> b!1338535 (= e!762162 call!65023)))

(declare-fun b!1338536 () Bool)

(declare-fun res!888119 () Bool)

(assert (=> b!1338536 (=> (not res!888119) (not e!762163))))

(assert (=> b!1338536 (= res!888119 (not (contains!8988 lt!593744 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144027 c!126264) b!1338534))

(assert (= (and d!144027 (not c!126264)) b!1338530))

(assert (= (and b!1338530 c!126265) b!1338532))

(assert (= (and b!1338530 (not c!126265)) b!1338535))

(assert (= (or b!1338532 b!1338535) bm!65020))

(assert (= (and d!144027 res!888121) b!1338536))

(assert (= (and b!1338536 res!888119) b!1338529))

(assert (= (and b!1338529 res!888120) b!1338533))

(assert (= (and b!1338529 c!126263) b!1338525))

(assert (= (and b!1338529 (not c!126263)) b!1338526))

(assert (= (and b!1338525 res!888122) b!1338528))

(assert (= (and b!1338526 c!126266) b!1338527))

(assert (= (and b!1338526 (not c!126266)) b!1338531))

(declare-fun b_lambda!24287 () Bool)

(assert (=> (not b_lambda!24287) (not b!1338528)))

(assert (=> b!1338528 t!45421))

(declare-fun b_and!50095 () Bool)

(assert (= b_and!50093 (and (=> t!45421 result!25349) b_and!50095)))

(declare-fun b_lambda!24289 () Bool)

(assert (=> (not b_lambda!24289) (not b!1338532)))

(assert (=> b!1338532 t!45421))

(declare-fun b_and!50097 () Bool)

(assert (= b_and!50095 (and (=> t!45421 result!25349) b_and!50097)))

(assert (=> b!1338525 m!1226449))

(assert (=> b!1338525 m!1226449))

(declare-fun m!1226849 () Bool)

(assert (=> b!1338525 m!1226849))

(declare-fun m!1226851 () Bool)

(assert (=> b!1338531 m!1226851))

(declare-fun m!1226853 () Bool)

(assert (=> b!1338536 m!1226853))

(declare-fun m!1226855 () Bool)

(assert (=> d!144027 m!1226855))

(assert (=> d!144027 m!1226385))

(assert (=> b!1338533 m!1226449))

(assert (=> b!1338533 m!1226449))

(assert (=> b!1338533 m!1226457))

(assert (=> b!1338530 m!1226449))

(assert (=> b!1338530 m!1226449))

(assert (=> b!1338530 m!1226457))

(assert (=> b!1338532 m!1226449))

(declare-fun m!1226857 () Bool)

(assert (=> b!1338532 m!1226857))

(declare-fun m!1226859 () Bool)

(assert (=> b!1338532 m!1226859))

(assert (=> b!1338532 m!1226445))

(assert (=> b!1338532 m!1226447))

(assert (=> b!1338532 m!1226445))

(assert (=> b!1338532 m!1226447))

(assert (=> b!1338532 m!1226453))

(declare-fun m!1226861 () Bool)

(assert (=> b!1338532 m!1226861))

(assert (=> b!1338532 m!1226861))

(declare-fun m!1226863 () Bool)

(assert (=> b!1338532 m!1226863))

(declare-fun m!1226865 () Bool)

(assert (=> bm!65020 m!1226865))

(assert (=> b!1338527 m!1226865))

(assert (=> b!1338528 m!1226449))

(assert (=> b!1338528 m!1226449))

(declare-fun m!1226867 () Bool)

(assert (=> b!1338528 m!1226867))

(assert (=> b!1338528 m!1226445))

(assert (=> b!1338528 m!1226447))

(assert (=> b!1338528 m!1226445))

(assert (=> b!1338528 m!1226447))

(assert (=> b!1338528 m!1226453))

(assert (=> b!1338382 d!144027))

(declare-fun b!1338537 () Bool)

(declare-fun e!762168 () Bool)

(declare-fun e!762170 () Bool)

(assert (=> b!1338537 (= e!762168 e!762170)))

(declare-fun c!126267 () Bool)

(assert (=> b!1338537 (= c!126267 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!65024 () Bool)

(declare-fun bm!65021 () Bool)

(assert (=> bm!65021 (= call!65024 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126267 (Cons!31084 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126208 (Cons!31084 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) Nil!31085) Nil!31085)) (ite c!126208 (Cons!31084 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) Nil!31085) Nil!31085))))))

(declare-fun d!144029 () Bool)

(declare-fun res!888124 () Bool)

(declare-fun e!762167 () Bool)

(assert (=> d!144029 (=> res!888124 e!762167)))

(assert (=> d!144029 (= res!888124 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44417 _keys!1590)))))

(assert (=> d!144029 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126208 (Cons!31084 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) Nil!31085) Nil!31085)) e!762167)))

(declare-fun b!1338538 () Bool)

(assert (=> b!1338538 (= e!762167 e!762168)))

(declare-fun res!888125 () Bool)

(assert (=> b!1338538 (=> (not res!888125) (not e!762168))))

(declare-fun e!762169 () Bool)

(assert (=> b!1338538 (= res!888125 (not e!762169))))

(declare-fun res!888123 () Bool)

(assert (=> b!1338538 (=> (not res!888123) (not e!762169))))

(assert (=> b!1338538 (= res!888123 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338539 () Bool)

(assert (=> b!1338539 (= e!762170 call!65024)))

(declare-fun b!1338540 () Bool)

(assert (=> b!1338540 (= e!762169 (contains!8989 (ite c!126208 (Cons!31084 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) Nil!31085) Nil!31085) (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338541 () Bool)

(assert (=> b!1338541 (= e!762170 call!65024)))

(assert (= (and d!144029 (not res!888124)) b!1338538))

(assert (= (and b!1338538 res!888123) b!1338540))

(assert (= (and b!1338538 res!888125) b!1338537))

(assert (= (and b!1338537 c!126267) b!1338541))

(assert (= (and b!1338537 (not c!126267)) b!1338539))

(assert (= (or b!1338541 b!1338539) bm!65021))

(declare-fun m!1226869 () Bool)

(assert (=> b!1338537 m!1226869))

(assert (=> b!1338537 m!1226869))

(declare-fun m!1226871 () Bool)

(assert (=> b!1338537 m!1226871))

(assert (=> bm!65021 m!1226869))

(declare-fun m!1226873 () Bool)

(assert (=> bm!65021 m!1226873))

(assert (=> b!1338538 m!1226869))

(assert (=> b!1338538 m!1226869))

(assert (=> b!1338538 m!1226871))

(assert (=> b!1338540 m!1226869))

(assert (=> b!1338540 m!1226869))

(declare-fun m!1226875 () Bool)

(assert (=> b!1338540 m!1226875))

(assert (=> bm!64985 d!144029))

(assert (=> bm!65009 d!144027))

(assert (=> b!1338405 d!143935))

(assert (=> b!1338295 d!143995))

(declare-fun b!1338542 () Bool)

(declare-fun e!762171 () Bool)

(declare-fun e!762173 () Bool)

(assert (=> b!1338542 (= e!762171 e!762173)))

(declare-fun c!126268 () Bool)

(assert (=> b!1338542 (= c!126268 (validKeyInArray!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338543 () Bool)

(declare-fun e!762172 () Bool)

(assert (=> b!1338543 (= e!762173 e!762172)))

(declare-fun lt!593748 () (_ BitVec 64))

(assert (=> b!1338543 (= lt!593748 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!593747 () Unit!43969)

(assert (=> b!1338543 (= lt!593747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1338543 (arrayContainsKey!0 _keys!1590 lt!593748 #b00000000000000000000000000000000)))

(declare-fun lt!593746 () Unit!43969)

(assert (=> b!1338543 (= lt!593746 lt!593747)))

(declare-fun res!888127 () Bool)

(assert (=> b!1338543 (= res!888127 (= (seekEntryOrOpen!0 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10051 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1338543 (=> (not res!888127) (not e!762172))))

(declare-fun b!1338544 () Bool)

(declare-fun call!65025 () Bool)

(assert (=> b!1338544 (= e!762172 call!65025)))

(declare-fun bm!65022 () Bool)

(assert (=> bm!65022 (= call!65025 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!144031 () Bool)

(declare-fun res!888126 () Bool)

(assert (=> d!144031 (=> res!888126 e!762171)))

(assert (=> d!144031 (= res!888126 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44417 _keys!1590)))))

(assert (=> d!144031 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!762171)))

(declare-fun b!1338545 () Bool)

(assert (=> b!1338545 (= e!762173 call!65025)))

(assert (= (and d!144031 (not res!888126)) b!1338542))

(assert (= (and b!1338542 c!126268) b!1338543))

(assert (= (and b!1338542 (not c!126268)) b!1338545))

(assert (= (and b!1338543 res!888127) b!1338544))

(assert (= (or b!1338544 b!1338545) bm!65022))

(assert (=> b!1338542 m!1226869))

(assert (=> b!1338542 m!1226869))

(assert (=> b!1338542 m!1226871))

(assert (=> b!1338543 m!1226869))

(declare-fun m!1226877 () Bool)

(assert (=> b!1338543 m!1226877))

(declare-fun m!1226879 () Bool)

(assert (=> b!1338543 m!1226879))

(assert (=> b!1338543 m!1226869))

(declare-fun m!1226881 () Bool)

(assert (=> b!1338543 m!1226881))

(declare-fun m!1226883 () Bool)

(assert (=> bm!65022 m!1226883))

(assert (=> bm!64988 d!144031))

(declare-fun d!144033 () Bool)

(declare-fun e!762174 () Bool)

(assert (=> d!144033 e!762174))

(declare-fun res!888129 () Bool)

(assert (=> d!144033 (=> (not res!888129) (not e!762174))))

(declare-fun lt!593752 () ListLongMap!21603)

(assert (=> d!144033 (= res!888129 (contains!8988 lt!593752 (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593751 () List!31087)

(assert (=> d!144033 (= lt!593752 (ListLongMap!21604 lt!593751))))

(declare-fun lt!593750 () Unit!43969)

(declare-fun lt!593749 () Unit!43969)

(assert (=> d!144033 (= lt!593750 lt!593749)))

(assert (=> d!144033 (= (getValueByKey!719 lt!593751 (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144033 (= lt!593749 (lemmaContainsTupThenGetReturnValue!364 lt!593751 (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144033 (= lt!593751 (insertStrictlySorted!493 (toList!10817 call!65009) (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144033 (= (+!4753 call!65009 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593752)))

(declare-fun b!1338546 () Bool)

(declare-fun res!888128 () Bool)

(assert (=> b!1338546 (=> (not res!888128) (not e!762174))))

(assert (=> b!1338546 (= res!888128 (= (getValueByKey!719 (toList!10817 lt!593752) (_1!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!770 (_2!11984 (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1338547 () Bool)

(assert (=> b!1338547 (= e!762174 (contains!8990 (toList!10817 lt!593752) (tuple2!23947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144033 res!888129) b!1338546))

(assert (= (and b!1338546 res!888128) b!1338547))

(declare-fun m!1226885 () Bool)

(assert (=> d!144033 m!1226885))

(declare-fun m!1226887 () Bool)

(assert (=> d!144033 m!1226887))

(declare-fun m!1226889 () Bool)

(assert (=> d!144033 m!1226889))

(declare-fun m!1226891 () Bool)

(assert (=> d!144033 m!1226891))

(declare-fun m!1226893 () Bool)

(assert (=> b!1338546 m!1226893))

(declare-fun m!1226895 () Bool)

(assert (=> b!1338547 m!1226895))

(assert (=> b!1338370 d!144033))

(declare-fun d!144035 () Bool)

(declare-fun e!762175 () Bool)

(assert (=> d!144035 e!762175))

(declare-fun res!888130 () Bool)

(assert (=> d!144035 (=> res!888130 e!762175)))

(declare-fun lt!593754 () Bool)

(assert (=> d!144035 (= res!888130 (not lt!593754))))

(declare-fun lt!593755 () Bool)

(assert (=> d!144035 (= lt!593754 lt!593755)))

(declare-fun lt!593753 () Unit!43969)

(declare-fun e!762176 () Unit!43969)

(assert (=> d!144035 (= lt!593753 e!762176)))

(declare-fun c!126269 () Bool)

(assert (=> d!144035 (= c!126269 lt!593755)))

(assert (=> d!144035 (= lt!593755 (containsKey!741 (toList!10817 lt!593615) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144035 (= (contains!8988 lt!593615 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593754)))

(declare-fun b!1338548 () Bool)

(declare-fun lt!593756 () Unit!43969)

(assert (=> b!1338548 (= e!762176 lt!593756)))

(assert (=> b!1338548 (= lt!593756 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 lt!593615) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338548 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593615) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338549 () Bool)

(declare-fun Unit!43980 () Unit!43969)

(assert (=> b!1338549 (= e!762176 Unit!43980)))

(declare-fun b!1338550 () Bool)

(assert (=> b!1338550 (= e!762175 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144035 c!126269) b!1338548))

(assert (= (and d!144035 (not c!126269)) b!1338549))

(assert (= (and d!144035 (not res!888130)) b!1338550))

(declare-fun m!1226897 () Bool)

(assert (=> d!144035 m!1226897))

(declare-fun m!1226899 () Bool)

(assert (=> b!1338548 m!1226899))

(declare-fun m!1226901 () Bool)

(assert (=> b!1338548 m!1226901))

(assert (=> b!1338548 m!1226901))

(declare-fun m!1226903 () Bool)

(assert (=> b!1338548 m!1226903))

(assert (=> b!1338550 m!1226901))

(assert (=> b!1338550 m!1226901))

(assert (=> b!1338550 m!1226903))

(assert (=> bm!65014 d!144035))

(declare-fun d!144037 () Bool)

(declare-fun lt!593759 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!661 (List!31088) (InoxSet (_ BitVec 64)))

(assert (=> d!144037 (= lt!593759 (select (content!661 Nil!31085) (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!762181 () Bool)

(assert (=> d!144037 (= lt!593759 e!762181)))

(declare-fun res!888135 () Bool)

(assert (=> d!144037 (=> (not res!888135) (not e!762181))))

(assert (=> d!144037 (= res!888135 ((_ is Cons!31084) Nil!31085))))

(assert (=> d!144037 (= (contains!8989 Nil!31085 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)) lt!593759)))

(declare-fun b!1338555 () Bool)

(declare-fun e!762182 () Bool)

(assert (=> b!1338555 (= e!762181 e!762182)))

(declare-fun res!888136 () Bool)

(assert (=> b!1338555 (=> res!888136 e!762182)))

(assert (=> b!1338555 (= res!888136 (= (h!32293 Nil!31085) (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338556 () Bool)

(assert (=> b!1338556 (= e!762182 (contains!8989 (t!45418 Nil!31085) (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144037 res!888135) b!1338555))

(assert (= (and b!1338555 (not res!888136)) b!1338556))

(declare-fun m!1226905 () Bool)

(assert (=> d!144037 m!1226905))

(assert (=> d!144037 m!1226419))

(declare-fun m!1226907 () Bool)

(assert (=> d!144037 m!1226907))

(assert (=> b!1338556 m!1226419))

(declare-fun m!1226909 () Bool)

(assert (=> b!1338556 m!1226909))

(assert (=> b!1338298 d!144037))

(declare-fun d!144039 () Bool)

(assert (=> d!144039 (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun lt!593762 () Unit!43969)

(declare-fun choose!1970 (List!31087 (_ BitVec 64)) Unit!43969)

(assert (=> d!144039 (= lt!593762 (choose!1970 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun e!762185 () Bool)

(assert (=> d!144039 e!762185))

(declare-fun res!888139 () Bool)

(assert (=> d!144039 (=> (not res!888139) (not e!762185))))

(declare-fun isStrictlySorted!880 (List!31087) Bool)

(assert (=> d!144039 (= res!888139 (isStrictlySorted!880 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))))

(assert (=> d!144039 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153) lt!593762)))

(declare-fun b!1338559 () Bool)

(assert (=> b!1338559 (= e!762185 (containsKey!741 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (= (and d!144039 res!888139) b!1338559))

(assert (=> d!144039 m!1226439))

(assert (=> d!144039 m!1226439))

(assert (=> d!144039 m!1226441))

(declare-fun m!1226911 () Bool)

(assert (=> d!144039 m!1226911))

(declare-fun m!1226913 () Bool)

(assert (=> d!144039 m!1226913))

(assert (=> b!1338559 m!1226435))

(assert (=> b!1338318 d!144039))

(assert (=> b!1338318 d!143983))

(assert (=> b!1338318 d!143985))

(declare-fun d!144041 () Bool)

(assert (=> d!144041 (= (apply!1036 lt!593589 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22148 (getValueByKey!719 (toList!10817 lt!593589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38337 () Bool)

(assert (= bs!38337 d!144041))

(assert (=> bs!38337 m!1226745))

(assert (=> bs!38337 m!1226745))

(declare-fun m!1226915 () Bool)

(assert (=> bs!38337 m!1226915))

(assert (=> b!1338369 d!144041))

(declare-fun d!144043 () Bool)

(assert (=> d!144043 (= (apply!1036 lt!593615 (select (arr!43867 _keys!1590) from!1980)) (get!22148 (getValueByKey!719 (toList!10817 lt!593615) (select (arr!43867 _keys!1590) from!1980))))))

(declare-fun bs!38338 () Bool)

(assert (= bs!38338 d!144043))

(assert (=> bs!38338 m!1226375))

(declare-fun m!1226917 () Bool)

(assert (=> bs!38338 m!1226917))

(assert (=> bs!38338 m!1226917))

(declare-fun m!1226919 () Bool)

(assert (=> bs!38338 m!1226919))

(assert (=> b!1338390 d!144043))

(declare-fun d!144045 () Bool)

(declare-fun c!126272 () Bool)

(assert (=> d!144045 (= c!126272 ((_ is ValueCellFull!17589) (select (arr!43866 _values!1320) from!1980)))))

(declare-fun e!762188 () V!54403)

(assert (=> d!144045 (= (get!22147 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762188)))

(declare-fun b!1338564 () Bool)

(declare-fun get!22149 (ValueCell!17589 V!54403) V!54403)

(assert (=> b!1338564 (= e!762188 (get!22149 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338565 () Bool)

(declare-fun get!22150 (ValueCell!17589 V!54403) V!54403)

(assert (=> b!1338565 (= e!762188 (get!22150 (select (arr!43866 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144045 c!126272) b!1338564))

(assert (= (and d!144045 (not c!126272)) b!1338565))

(assert (=> b!1338564 m!1226511))

(assert (=> b!1338564 m!1226447))

(declare-fun m!1226921 () Bool)

(assert (=> b!1338564 m!1226921))

(assert (=> b!1338565 m!1226511))

(assert (=> b!1338565 m!1226447))

(declare-fun m!1226923 () Bool)

(assert (=> b!1338565 m!1226923))

(assert (=> b!1338390 d!144045))

(declare-fun d!144047 () Bool)

(declare-fun e!762189 () Bool)

(assert (=> d!144047 e!762189))

(declare-fun res!888140 () Bool)

(assert (=> d!144047 (=> res!888140 e!762189)))

(declare-fun lt!593764 () Bool)

(assert (=> d!144047 (= res!888140 (not lt!593764))))

(declare-fun lt!593765 () Bool)

(assert (=> d!144047 (= lt!593764 lt!593765)))

(declare-fun lt!593763 () Unit!43969)

(declare-fun e!762190 () Unit!43969)

(assert (=> d!144047 (= lt!593763 e!762190)))

(declare-fun c!126273 () Bool)

(assert (=> d!144047 (= c!126273 lt!593765)))

(assert (=> d!144047 (= lt!593765 (containsKey!741 (toList!10817 lt!593615) (select (arr!43867 _keys!1590) from!1980)))))

(assert (=> d!144047 (= (contains!8988 lt!593615 (select (arr!43867 _keys!1590) from!1980)) lt!593764)))

(declare-fun b!1338566 () Bool)

(declare-fun lt!593766 () Unit!43969)

(assert (=> b!1338566 (= e!762190 lt!593766)))

(assert (=> b!1338566 (= lt!593766 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 lt!593615) (select (arr!43867 _keys!1590) from!1980)))))

(assert (=> b!1338566 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593615) (select (arr!43867 _keys!1590) from!1980)))))

(declare-fun b!1338567 () Bool)

(declare-fun Unit!43981 () Unit!43969)

(assert (=> b!1338567 (= e!762190 Unit!43981)))

(declare-fun b!1338568 () Bool)

(assert (=> b!1338568 (= e!762189 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593615) (select (arr!43867 _keys!1590) from!1980))))))

(assert (= (and d!144047 c!126273) b!1338566))

(assert (= (and d!144047 (not c!126273)) b!1338567))

(assert (= (and d!144047 (not res!888140)) b!1338568))

(assert (=> d!144047 m!1226375))

(declare-fun m!1226925 () Bool)

(assert (=> d!144047 m!1226925))

(assert (=> b!1338566 m!1226375))

(declare-fun m!1226927 () Bool)

(assert (=> b!1338566 m!1226927))

(assert (=> b!1338566 m!1226375))

(assert (=> b!1338566 m!1226917))

(assert (=> b!1338566 m!1226917))

(declare-fun m!1226929 () Bool)

(assert (=> b!1338566 m!1226929))

(assert (=> b!1338568 m!1226375))

(assert (=> b!1338568 m!1226917))

(assert (=> b!1338568 m!1226917))

(assert (=> b!1338568 m!1226929))

(assert (=> b!1338401 d!144047))

(declare-fun d!144049 () Bool)

(assert (=> d!144049 (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!593767 () Unit!43969)

(assert (=> d!144049 (= lt!593767 (choose!1970 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!762191 () Bool)

(assert (=> d!144049 e!762191))

(declare-fun res!888141 () Bool)

(assert (=> d!144049 (=> (not res!888141) (not e!762191))))

(assert (=> d!144049 (= res!888141 (isStrictlySorted!880 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!144049 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!593767)))

(declare-fun b!1338569 () Bool)

(assert (=> b!1338569 (= e!762191 (containsKey!741 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!144049 res!888141) b!1338569))

(assert (=> d!144049 m!1226505))

(assert (=> d!144049 m!1226505))

(assert (=> d!144049 m!1226507))

(declare-fun m!1226931 () Bool)

(assert (=> d!144049 m!1226931))

(declare-fun m!1226933 () Bool)

(assert (=> d!144049 m!1226933))

(assert (=> b!1338569 m!1226501))

(assert (=> b!1338386 d!144049))

(declare-fun d!144051 () Bool)

(assert (=> d!144051 (= (isDefined!526 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1090 (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38339 () Bool)

(assert (= bs!38339 d!144051))

(assert (=> bs!38339 m!1226505))

(declare-fun m!1226935 () Bool)

(assert (=> bs!38339 m!1226935))

(assert (=> b!1338386 d!144051))

(declare-fun b!1338571 () Bool)

(declare-fun e!762192 () Option!771)

(declare-fun e!762193 () Option!771)

(assert (=> b!1338571 (= e!762192 e!762193)))

(declare-fun c!126275 () Bool)

(assert (=> b!1338571 (= c!126275 (and ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1338573 () Bool)

(assert (=> b!1338573 (= e!762193 None!769)))

(declare-fun c!126274 () Bool)

(declare-fun d!144053 () Bool)

(assert (=> d!144053 (= c!126274 (and ((_ is Cons!31083) (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144053 (= (getValueByKey!719 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762192)))

(declare-fun b!1338572 () Bool)

(assert (=> b!1338572 (= e!762193 (getValueByKey!719 (t!45417 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1338570 () Bool)

(assert (=> b!1338570 (= e!762192 (Some!770 (_2!11984 (h!32292 (toList!10817 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(assert (= (and d!144053 c!126274) b!1338570))

(assert (= (and d!144053 (not c!126274)) b!1338571))

(assert (= (and b!1338571 c!126275) b!1338572))

(assert (= (and b!1338571 (not c!126275)) b!1338573))

(declare-fun m!1226937 () Bool)

(assert (=> b!1338572 m!1226937))

(assert (=> b!1338386 d!144053))

(assert (=> b!1338379 d!143941))

(assert (=> b!1338400 d!143935))

(assert (=> b!1338388 d!144051))

(assert (=> b!1338388 d!144053))

(declare-fun d!144055 () Bool)

(assert (=> d!144055 (= (apply!1036 lt!593589 (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22148 (getValueByKey!719 (toList!10817 lt!593589) (select (arr!43867 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38340 () Bool)

(assert (= bs!38340 d!144055))

(assert (=> bs!38340 m!1226449))

(assert (=> bs!38340 m!1226567))

(assert (=> bs!38340 m!1226567))

(declare-fun m!1226939 () Bool)

(assert (=> bs!38340 m!1226939))

(assert (=> b!1338364 d!144055))

(declare-fun d!144057 () Bool)

(declare-fun c!126276 () Bool)

(assert (=> d!144057 (= c!126276 ((_ is ValueCellFull!17589) (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!762194 () V!54403)

(assert (=> d!144057 (= (get!22147 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762194)))

(declare-fun b!1338574 () Bool)

(assert (=> b!1338574 (= e!762194 (get!22149 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338575 () Bool)

(assert (=> b!1338575 (= e!762194 (get!22150 (select (arr!43866 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144057 c!126276) b!1338574))

(assert (= (and d!144057 (not c!126276)) b!1338575))

(assert (=> b!1338574 m!1226445))

(assert (=> b!1338574 m!1226447))

(declare-fun m!1226941 () Bool)

(assert (=> b!1338574 m!1226941))

(assert (=> b!1338575 m!1226445))

(assert (=> b!1338575 m!1226447))

(declare-fun m!1226943 () Bool)

(assert (=> b!1338575 m!1226943))

(assert (=> b!1338364 d!144057))

(declare-fun d!144059 () Bool)

(declare-fun e!762195 () Bool)

(assert (=> d!144059 e!762195))

(declare-fun res!888142 () Bool)

(assert (=> d!144059 (=> res!888142 e!762195)))

(declare-fun lt!593769 () Bool)

(assert (=> d!144059 (= res!888142 (not lt!593769))))

(declare-fun lt!593770 () Bool)

(assert (=> d!144059 (= lt!593769 lt!593770)))

(declare-fun lt!593768 () Unit!43969)

(declare-fun e!762196 () Unit!43969)

(assert (=> d!144059 (= lt!593768 e!762196)))

(declare-fun c!126277 () Bool)

(assert (=> d!144059 (= c!126277 lt!593770)))

(assert (=> d!144059 (= lt!593770 (containsKey!741 (toList!10817 lt!593589) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144059 (= (contains!8988 lt!593589 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593769)))

(declare-fun b!1338576 () Bool)

(declare-fun lt!593771 () Unit!43969)

(assert (=> b!1338576 (= e!762196 lt!593771)))

(assert (=> b!1338576 (= lt!593771 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!10817 lt!593589) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338576 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593589) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338577 () Bool)

(declare-fun Unit!43982 () Unit!43969)

(assert (=> b!1338577 (= e!762196 Unit!43982)))

(declare-fun b!1338578 () Bool)

(assert (=> b!1338578 (= e!762195 (isDefined!526 (getValueByKey!719 (toList!10817 lt!593589) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144059 c!126277) b!1338576))

(assert (= (and d!144059 (not c!126277)) b!1338577))

(assert (= (and d!144059 (not res!888142)) b!1338578))

(declare-fun m!1226945 () Bool)

(assert (=> d!144059 m!1226945))

(declare-fun m!1226947 () Bool)

(assert (=> b!1338576 m!1226947))

(assert (=> b!1338576 m!1226585))

(assert (=> b!1338576 m!1226585))

(declare-fun m!1226949 () Bool)

(assert (=> b!1338576 m!1226949))

(assert (=> b!1338578 m!1226585))

(assert (=> b!1338578 m!1226585))

(assert (=> b!1338578 m!1226949))

(assert (=> bm!65007 d!144059))

(declare-fun d!144061 () Bool)

(assert (=> d!144061 (= (apply!1036 lt!593615 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22148 (getValueByKey!719 (toList!10817 lt!593615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38341 () Bool)

(assert (= bs!38341 d!144061))

(assert (=> bs!38341 m!1226901))

(assert (=> bs!38341 m!1226901))

(declare-fun m!1226951 () Bool)

(assert (=> bs!38341 m!1226951))

(assert (=> b!1338404 d!144061))

(declare-fun d!144063 () Bool)

(assert (=> d!144063 (arrayContainsKey!0 _keys!1590 lt!593529 #b00000000000000000000000000000000)))

(declare-fun lt!593774 () Unit!43969)

(declare-fun choose!13 (array!90810 (_ BitVec 64) (_ BitVec 32)) Unit!43969)

(assert (=> d!144063 (= lt!593774 (choose!13 _keys!1590 lt!593529 #b00000000000000000000000000000000))))

(assert (=> d!144063 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144063 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593529 #b00000000000000000000000000000000) lt!593774)))

(declare-fun bs!38342 () Bool)

(assert (= bs!38342 d!144063))

(assert (=> bs!38342 m!1226429))

(declare-fun m!1226953 () Bool)

(assert (=> bs!38342 m!1226953))

(assert (=> b!1338309 d!144063))

(declare-fun d!144065 () Bool)

(declare-fun res!888147 () Bool)

(declare-fun e!762201 () Bool)

(assert (=> d!144065 (=> res!888147 e!762201)))

(assert (=> d!144065 (= res!888147 (= (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) lt!593529))))

(assert (=> d!144065 (= (arrayContainsKey!0 _keys!1590 lt!593529 #b00000000000000000000000000000000) e!762201)))

(declare-fun b!1338583 () Bool)

(declare-fun e!762202 () Bool)

(assert (=> b!1338583 (= e!762201 e!762202)))

(declare-fun res!888148 () Bool)

(assert (=> b!1338583 (=> (not res!888148) (not e!762202))))

(assert (=> b!1338583 (= res!888148 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44417 _keys!1590)))))

(declare-fun b!1338584 () Bool)

(assert (=> b!1338584 (= e!762202 (arrayContainsKey!0 _keys!1590 lt!593529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144065 (not res!888147)) b!1338583))

(assert (= (and b!1338583 res!888148) b!1338584))

(assert (=> d!144065 m!1226419))

(declare-fun m!1226955 () Bool)

(assert (=> b!1338584 m!1226955))

(assert (=> b!1338309 d!144065))

(declare-fun b!1338597 () Bool)

(declare-fun e!762211 () SeekEntryResult!10051)

(declare-fun e!762210 () SeekEntryResult!10051)

(assert (=> b!1338597 (= e!762211 e!762210)))

(declare-fun lt!593781 () (_ BitVec 64))

(declare-fun lt!593783 () SeekEntryResult!10051)

(assert (=> b!1338597 (= lt!593781 (select (arr!43867 _keys!1590) (index!42577 lt!593783)))))

(declare-fun c!126286 () Bool)

(assert (=> b!1338597 (= c!126286 (= lt!593781 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!144067 () Bool)

(declare-fun lt!593782 () SeekEntryResult!10051)

(assert (=> d!144067 (and (or ((_ is Undefined!10051) lt!593782) (not ((_ is Found!10051) lt!593782)) (and (bvsge (index!42576 lt!593782) #b00000000000000000000000000000000) (bvslt (index!42576 lt!593782) (size!44417 _keys!1590)))) (or ((_ is Undefined!10051) lt!593782) ((_ is Found!10051) lt!593782) (not ((_ is MissingZero!10051) lt!593782)) (and (bvsge (index!42575 lt!593782) #b00000000000000000000000000000000) (bvslt (index!42575 lt!593782) (size!44417 _keys!1590)))) (or ((_ is Undefined!10051) lt!593782) ((_ is Found!10051) lt!593782) ((_ is MissingZero!10051) lt!593782) (not ((_ is MissingVacant!10051) lt!593782)) (and (bvsge (index!42578 lt!593782) #b00000000000000000000000000000000) (bvslt (index!42578 lt!593782) (size!44417 _keys!1590)))) (or ((_ is Undefined!10051) lt!593782) (ite ((_ is Found!10051) lt!593782) (= (select (arr!43867 _keys!1590) (index!42576 lt!593782)) (select (arr!43867 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10051) lt!593782) (= (select (arr!43867 _keys!1590) (index!42575 lt!593782)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10051) lt!593782) (= (select (arr!43867 _keys!1590) (index!42578 lt!593782)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144067 (= lt!593782 e!762211)))

(declare-fun c!126284 () Bool)

(assert (=> d!144067 (= c!126284 (and ((_ is Intermediate!10051) lt!593783) (undefined!10863 lt!593783)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90810 (_ BitVec 32)) SeekEntryResult!10051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144067 (= lt!593783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!144067 (validMask!0 mask!1998)))

(assert (=> d!144067 (= (seekEntryOrOpen!0 (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!593782)))

(declare-fun b!1338598 () Bool)

(declare-fun e!762209 () SeekEntryResult!10051)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90810 (_ BitVec 32)) SeekEntryResult!10051)

(assert (=> b!1338598 (= e!762209 (seekKeyOrZeroReturnVacant!0 (x!119545 lt!593783) (index!42577 lt!593783) (index!42577 lt!593783) (select (arr!43867 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1338599 () Bool)

(assert (=> b!1338599 (= e!762211 Undefined!10051)))

(declare-fun b!1338600 () Bool)

(assert (=> b!1338600 (= e!762210 (Found!10051 (index!42577 lt!593783)))))

(declare-fun b!1338601 () Bool)

(assert (=> b!1338601 (= e!762209 (MissingZero!10051 (index!42577 lt!593783)))))

(declare-fun b!1338602 () Bool)

(declare-fun c!126285 () Bool)

(assert (=> b!1338602 (= c!126285 (= lt!593781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338602 (= e!762210 e!762209)))

(assert (= (and d!144067 c!126284) b!1338599))

(assert (= (and d!144067 (not c!126284)) b!1338597))

(assert (= (and b!1338597 c!126286) b!1338600))

(assert (= (and b!1338597 (not c!126286)) b!1338602))

(assert (= (and b!1338602 c!126285) b!1338601))

(assert (= (and b!1338602 (not c!126285)) b!1338598))

(declare-fun m!1226957 () Bool)

(assert (=> b!1338597 m!1226957))

(declare-fun m!1226959 () Bool)

(assert (=> d!144067 m!1226959))

(declare-fun m!1226961 () Bool)

(assert (=> d!144067 m!1226961))

(declare-fun m!1226963 () Bool)

(assert (=> d!144067 m!1226963))

(assert (=> d!144067 m!1226419))

(declare-fun m!1226965 () Bool)

(assert (=> d!144067 m!1226965))

(assert (=> d!144067 m!1226385))

(declare-fun m!1226967 () Bool)

(assert (=> d!144067 m!1226967))

(assert (=> d!144067 m!1226419))

(assert (=> d!144067 m!1226963))

(assert (=> b!1338598 m!1226419))

(declare-fun m!1226969 () Bool)

(assert (=> b!1338598 m!1226969))

(assert (=> b!1338309 d!144067))

(assert (=> b!1338308 d!143995))

(declare-fun b!1338604 () Bool)

(declare-fun e!762213 () Bool)

(assert (=> b!1338604 (= e!762213 tp_is_empty!36975)))

(declare-fun mapIsEmpty!57157 () Bool)

(declare-fun mapRes!57157 () Bool)

(assert (=> mapIsEmpty!57157 mapRes!57157))

(declare-fun mapNonEmpty!57157 () Bool)

(declare-fun tp!108856 () Bool)

(declare-fun e!762212 () Bool)

(assert (=> mapNonEmpty!57157 (= mapRes!57157 (and tp!108856 e!762212))))

(declare-fun mapRest!57157 () (Array (_ BitVec 32) ValueCell!17589))

(declare-fun mapKey!57157 () (_ BitVec 32))

(declare-fun mapValue!57157 () ValueCell!17589)

(assert (=> mapNonEmpty!57157 (= mapRest!57156 (store mapRest!57157 mapKey!57157 mapValue!57157))))

(declare-fun condMapEmpty!57157 () Bool)

(declare-fun mapDefault!57157 () ValueCell!17589)

(assert (=> mapNonEmpty!57156 (= condMapEmpty!57157 (= mapRest!57156 ((as const (Array (_ BitVec 32) ValueCell!17589)) mapDefault!57157)))))

(assert (=> mapNonEmpty!57156 (= tp!108855 (and e!762213 mapRes!57157))))

(declare-fun b!1338603 () Bool)

(assert (=> b!1338603 (= e!762212 tp_is_empty!36975)))

(assert (= (and mapNonEmpty!57156 condMapEmpty!57157) mapIsEmpty!57157))

(assert (= (and mapNonEmpty!57156 (not condMapEmpty!57157)) mapNonEmpty!57157))

(assert (= (and mapNonEmpty!57157 ((_ is ValueCellFull!17589) mapValue!57157)) b!1338603))

(assert (= (and mapNonEmpty!57156 ((_ is ValueCellFull!17589) mapDefault!57157)) b!1338604))

(declare-fun m!1226971 () Bool)

(assert (=> mapNonEmpty!57157 m!1226971))

(declare-fun b_lambda!24291 () Bool)

(assert (= b_lambda!24283 (or (and start!112836 b_free!31065) b_lambda!24291)))

(declare-fun b_lambda!24293 () Bool)

(assert (= b_lambda!24287 (or (and start!112836 b_free!31065) b_lambda!24293)))

(declare-fun b_lambda!24295 () Bool)

(assert (= b_lambda!24285 (or (and start!112836 b_free!31065) b_lambda!24295)))

(declare-fun b_lambda!24297 () Bool)

(assert (= b_lambda!24289 (or (and start!112836 b_free!31065) b_lambda!24297)))

(check-sat (not b!1338520) (not b!1338568) (not b!1338502) (not b!1338464) (not b!1338508) (not d!143989) (not d!143957) (not d!143959) (not b!1338514) (not d!143943) (not b!1338550) (not d!144017) (not b_lambda!24295) (not d!144039) (not d!143999) (not d!143955) (not d!143963) (not d!144019) (not b!1338527) (not d!144011) (not d!143937) (not d!143981) (not bm!65020) (not b!1338533) (not b!1338525) (not mapNonEmpty!57157) b_and!50097 (not b!1338470) (not b!1338576) (not b!1338516) (not b!1338538) (not b_lambda!24293) (not d!144007) (not b!1338506) (not d!144009) (not d!144051) (not b_lambda!24291) (not b!1338512) (not bm!65021) (not b!1338524) (not b!1338575) (not b!1338566) (not d!143953) (not b!1338598) (not d!143977) (not b!1338530) (not b!1338433) (not b!1338486) (not bm!65022) (not b!1338437) (not b!1338531) (not d!144063) (not b!1338484) (not d!143969) (not d!144033) (not d!144025) (not d!144059) (not d!144041) (not bm!65019) (not d!144061) (not b!1338556) (not b!1338487) (not b!1338426) (not b!1338578) (not d!143951) (not d!143997) (not d!143993) (not d!143961) (not b!1338469) (not d!144021) (not d!144015) (not d!144043) (not b!1338546) (not d!143983) (not b!1338565) (not b!1338418) (not b!1338559) (not b!1338462) (not d!144035) (not b!1338528) (not b!1338436) (not b!1338543) (not b!1338548) (not b!1338477) (not b!1338482) (not b!1338432) (not b_lambda!24279) (not d!144013) (not b!1338542) (not b!1338517) (not b!1338574) (not b_next!31065) (not d!143949) (not b!1338564) (not b!1338431) (not b!1338513) (not b!1338547) (not b!1338532) (not b!1338420) (not d!144005) (not b!1338473) (not b!1338468) (not b_lambda!24297) (not d!143965) (not b!1338518) (not b!1338569) (not d!144037) (not b!1338504) (not b!1338476) (not b!1338485) (not d!143971) (not b!1338536) (not b!1338537) (not b!1338572) (not b!1338435) (not b!1338505) (not d!144027) (not b!1338475) (not b_lambda!24281) (not b!1338540) (not d!143945) (not b!1338515) (not d!143987) (not b!1338474) tp_is_empty!36975 (not d!143973) (not b!1338584) (not b!1338488) (not d!144003) (not d!144055) (not d!144023) (not d!143947) (not d!144067) (not d!143975) (not b!1338510) (not d!144001) (not b!1338523) (not b!1338467) (not d!143979) (not d!143967) (not d!144049) (not d!144047) (not b!1338465))
(check-sat b_and!50097 (not b_next!31065))
